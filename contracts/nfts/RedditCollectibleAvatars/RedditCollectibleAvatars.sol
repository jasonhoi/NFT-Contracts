pragma solidity ^0.8.4;

import "@opengsn/contracts/src/BaseRelayRecipient.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts/interfaces/IERC2981.sol";
import "@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol";

import "./RedditCollectibleAvatarsRouter.sol";

/**
 *
 * An ERC1155-based NFT contract which includes support for partitioned (bucketed) IPFS routes.
 *
 * This contract is a standard ERC1155 contract with modifications to make the contract
 * allow for a dynamically-sized collection of NFTs to be minted on it over a prolonged
 * period of time.
 *
 * These differences are:
 *
 *   1. The contact leverages ownership of the contract (OwnableUpgradeable), however it also
 *      allows for the NFT minting method (`mintNFT`) to be only executable via a
 *      `minter` wallet.
 *
 *   2. The `uri` mechanism of the contract defers to a sub contract which acts as
 *      a router to determine what IPFS directory CID value will be used for the uri
 *      of the provided tokenId.
 *
 * While the behavior of "minting over a prolonged period of time" is something that isn't
 * common in the crypto space, the intent with this contract is to only allow for minting
 * to occur until the collection is complete. Once complete, ownership and minting on the
 * contract will be relinquished.
 *
 *
 * ## How the minting logic works
 *
 * The `mintNFT` method works much the same as any public minting function on an ERC721 or
 * ERC1155 contract. The main difference here is that only the `minter` wallet can execute
 * this method instead of the `owner` of the contract. The `minter` wallet is a standard
 * 0x0 address that can be set via the `setMinter()` method and it can be the same as the
 * owner of the wallet.
 *
 * The reason why this contract makes use of a minter/owner split is so that the deployment
 * and configuration of contract is done via an offline wallet while minting of new NFTs is
 * done using a wallet that is distributed on the backend.
 *
 *
 * ## How the `uri` assembling works
 *
 * With a standard ERC1155 contract, all NFT URI values (which point to their respective
 * metadata files) are bound to a single URI structure with a consistent domain/path prefix.
 * This design choice is done as such by ERC1155 to optimize storage of NFT entries within
 * the contract (since no URL values need to be stored).
 *
 * While this feature of ERC1155 works well, it doesn't allow for a collection of NFTs to
 * be extended without some kind of variable change to the prefix of the `uri`. In other
 * words, you would need to introduce a setter/getter value to change the IPFS prefix if
 * new NFT metadata files are introduced into the collection.
 *
 * The contract below changes how the `uri` method works by delegating the IPFS CID resolution
 * logic to a "router" contract. The router contract will execute its own logic given the `ID`
 * value and return the correct IPFS CID based on what IPFS directory that `ID` entry was
 * registered.
 *
 * See [RedditCollectibleAvatarsRouter.sol] for more info.
 *
 */
error RedditCollectibleAvatars__NotMinter();
error RedditCollectibleAvatars__InvalidArg_TokenAndAddressLengthMismatch();
error RedditCollectibleAvatars__InvalidArg_AddressZero();
error RedditCollectibleAvatars__InvalidArg_SellerFeeBasisPoints(uint16 basisPoints);
error RedditCollectibleAvatars__AlreadyMinted(uint256 tokenId);
error RedditCollectibleAvatars__NotImplemented();

contract RedditCollectibleAvatars is ERC1155Upgradeable, OwnableUpgradeable, BaseRelayRecipient, IERC2981 {
  using AddressUpgradeable for address;

  struct RoyaltyInfo {
    address recipient;
    uint16 basisPoints;
  }

  event RouterAddressUpdated(address current, address previous);
  event MinterUpdated(address current, address prevMinter, address removedMinter);
  event PreviousMinterCleared(address removedMinter);
  event TrustedForwarderUpdated(address current, address previous);
  event ContractURIUpdated(string current, string previous);
  event RoyaltiesUpdated(address currentRecipient, uint16 currentBasisPoints, address previousRecipient, uint16 previousBasisPoints);

  string public override versionRecipient;  // required by BaseRelayRecipient
  /**
   * Wallet address of the `minter` wallet
   */
  address public minter;
  /**
   * Wallet address of the previous `minter` wallet to have no downtime during minter rotation
   */
  address public prevMinter;
  /**
   * Reference to the "router contract" that the `uri` method will call
   *
   * See [RedditCollectibleAvatarsRouter] for more info.
   */
  RedditCollectibleAvatarsRouter public _router;
  RoyaltyInfo public royalties;

  string private _contractURI;

  // Mapping from token ID to owner
  mapping(uint256 => address) internal _owners;

  modifier onlyMinter() {
    address sender = _msgSender();
    if (sender != minter && sender != prevMinter) {
      revert RedditCollectibleAvatars__NotMinter();
    }
    _;
  }

  function initialize(RoyaltyInfo calldata _royalties, address routerAddress, address minterAddress, address owner, address forwarder, string calldata contracturi) public initializer {
    __ERC1155_init("_");

    _updateRoyalties(_royalties);
    minter = minterAddress;
    prevMinter = address(0);
    _setRouterAddress(routerAddress);
    _updateTrustedForwarder(forwarder);
    _contractURI = contracturi;
  
    OwnableUpgradeable.__Ownable_init();
    if (owner != _msgSender()) {
      OwnableUpgradeable.transferOwnership(owner);
    }

    versionRecipient = "1.0.0";
  }

  /**
   * OZ ERC1155 Function Overrides
   */
  
  /**
     * @dev See {IERC1155-balanceOf}.
     *
     * Requirements:
     *
     * - `account` cannot be the zero address.
     */
  function balanceOf(address account, uint256 id) public view virtual override returns (uint256) {
      require(account != address(0), "ERC1155: balance query for the zero address");
      return _owners[id] == account ? 1 : 0;
  }

  /**
    * @dev Transfers `amount` tokens of token type `id` from `from` to `to`.
    *
    * Emits a {TransferSingle} event.
    *
    * Requirements:
    *
    * - `to` cannot be the zero address.
    * - `from` must have a balance of tokens of type `id` of at least `amount`.
    * - If `to` refers to a smart contract, it must implement {IERC1155Receiver-onERC1155Received} and return the
    * acceptance magic value.
    */
  function _safeTransferFrom(
    address from,
    address to,
    uint256 id,
    uint256 amount,
    bytes memory data
  ) internal virtual override {
    require(to != address(0), "ERC1155: transfer to the zero address");

    address operator = _msgSender();
    uint256[] memory ids = __asSingletonArray(id);
    uint256[] memory amounts = __asSingletonArray(amount);

    _beforeTokenTransfer(operator, from, to, ids, amounts, data);

    require(_owners[id] == from && amount < 2, "ERC1155: insufficient balance for transfer");

    // The ERC1155 spec allows for transferring zero tokens,
    // but only modify ownership if amount == 1
    if (amount == 1) {
      _owners[id] = to;
    }

    emit TransferSingle(operator, from, to, id, amount);

    _afterTokenTransfer(operator, from, to, ids, amounts, data);

    __doSafeTransferAcceptanceCheck(operator, from, to, id, amount, data);
  }

  function __doSafeTransferAcceptanceCheck(
    address operator,
    address from,
    address to,
    uint256 id,
    uint256 amount,
    bytes memory data
  ) internal {
    if (to.isContract()) {
      try IERC1155ReceiverUpgradeable(to).onERC1155Received(operator, from, id, amount, data) returns (bytes4 response) {
        if (response != IERC1155ReceiverUpgradeable.onERC1155Received.selector) {
          revert("ERC1155: ERC1155Receiver rejected tokens");
        }
      } catch Error(string memory reason) {
        revert(reason);
      } catch {
        revert("ERC1155: transfer to non ERC1155Receiver implementer");
      }
    }
  }

  function __asSingletonArray(uint256 element) internal pure returns (uint256[] memory) {
    uint256[] memory array = new uint256[](1);
    array[0] = element;

    return array;
  }

  /**
    * @dev xref:ROOT:erc1155.adoc#batch-operations[Batched] version of {_safeTransferFrom}.
    *
    * Emits a {TransferBatch} event.
    *
    * Requirements:
    *
    * - If `to` refers to a smart contract, it must implement {IERC1155Receiver-onERC1155BatchReceived} and return the
    * acceptance magic value.
    */
  function _safeBatchTransferFrom(
    address from,
    address to,
    uint256[] memory ids,
    uint256[] memory amounts,
    bytes memory data
  ) internal virtual override {
    require(ids.length == amounts.length, "ERC1155: ids and amounts length mismatch");
    require(to != address(0), "ERC1155: transfer to the zero address");

    address operator = _msgSender();

    for (uint256 i = 0; i < ids.length; ++i) {
      uint256 id = ids[i];
      uint256 amount = amounts[i];

      require(_owners[id] == from && amount < 2, "ERC1155: insufficient balance for transfer");
      // The ERC1155 spec allows for transferring zero tokens,
      // but only modify ownership if amount == 1
      if (amount == 1) {
        _owners[id] = to;
      }
    }

    emit TransferBatch(operator, from, to, ids, amounts);

    __doSafeBatchTransferAcceptanceCheck(operator, from, to, ids, amounts, data);
  }
  
  function __doSafeBatchTransferAcceptanceCheck(
    address operator,
    address from,
    address to,
    uint256[] memory ids,
    uint256[] memory amounts,
    bytes memory data
  ) internal {
    if (to.isContract()) {
      try IERC1155ReceiverUpgradeable(to).onERC1155BatchReceived(operator, from, ids, amounts, data) returns (
        bytes4 response
      ) {
        if (response != IERC1155ReceiverUpgradeable.onERC1155BatchReceived.selector) {
          revert("ERC1155: ERC1155Receiver rejected tokens");
        }
      } catch Error(string memory reason) {
        revert(reason);
      } catch {
        revert("ERC1155: transfer to non ERC1155Receiver implementer");
      }
    }
  }

  /**
    * @dev Creates `amount` tokens of token type `id`, and assigns them to `to`.
    *
    * Emits a {TransferSingle} event.
    *
    * Requirements:
    *
    * - `to` cannot be the zero address.
    * - If `to` refers to a smart contract, it must implement {IERC1155Receiver-onERC1155Received} and return the
    * acceptance magic value.
    */
  function _mint(
    address to,
    uint256 id,
    bytes memory data
  ) internal virtual {
    require(to != address(0), "ERC1155: mint to the zero address");
    if(_owners[id] != address(0)) {
      revert RedditCollectibleAvatars__AlreadyMinted(id);
    }

    address operator = _msgSender();

    _owners[id] = to;

    emit TransferSingle(operator, address(0), to, id, 1);

    __doSafeTransferAcceptanceCheck(operator, address(0), to, id, 1, data);
  }

  /**
    * @dev xref:ROOT:erc1155.adoc#batch-operations[Batched] version of {_mint}.
    *
    * Requirements:
    *
    * - `ids` and `amounts` must have the same length.
    * - If `to` refers to a smart contract, it must implement {IERC1155Receiver-onERC1155BatchReceived} and return the
    * acceptance magic value.
    */
  function _mintBatch(
    address,
    uint256[] memory,
    uint256[] memory,
    bytes memory
  ) internal virtual override {
    revert RedditCollectibleAvatars__NotImplemented();
  }

  /**
    * @dev Destroys `amount` tokens of token type `id` from `from`
    *
    * Requirements:
    *
    * - `from` cannot be the zero address.
    * - `from` must have at least `amount` tokens of token type `id`.
    */
  function _burn(
    address,
    uint256,
    uint256
  ) internal virtual override {
    revert RedditCollectibleAvatars__NotImplemented();
  }

  /**
    * @dev xref:ROOT:erc1155.adoc#batch-operations[Batched] version of {_burn}.
    *
    * Requirements:
    *
    * - `ids` and `amounts` must have the same length.
    */
  function _burnBatch(
    address,
    uint256[] memory,
    uint256[] memory
  ) internal virtual override {
    revert RedditCollectibleAvatars__NotImplemented();
  }

  /**
   * IPFS Routing Functions
   */

  function setRouterAddress(address routerAddress) external onlyOwner {
    _setRouterAddress(routerAddress);
  }

  /**
   * Sets the contract address for the router contract (which is used to deterine the IPFS CID for each ID entry)
   */
  function _setRouterAddress(address routerAddress) internal {
    if (routerAddress == address(0)){
      revert RedditCollectibleAvatars__InvalidArg_AddressZero();
    }
    emit RouterAddressUpdated({current: routerAddress, previous: address(_router)});
    _router = RedditCollectibleAvatarsRouter(routerAddress);
  }

  /**
   * Minting Functions
   */
  
  /**
   * Mints a NFT on the contract (node that only the `minter` wallet can execute this action)
   */
  function mintNFT(uint256 tokenId, address ownerId) public onlyMinter {
    _mint(ownerId, tokenId, "");
  }

  /**
   * Sets (updates) the `minter` wallet address on the contract (note that only the `owner` wallet can execute this action)
   */
  function setMinter(address account) public onlyOwner {
    if (account == address(0)){
      revert RedditCollectibleAvatars__InvalidArg_AddressZero();
    }
    emit MinterUpdated({current: account, prevMinter: minter, removedMinter: prevMinter});
    prevMinter = minter;
    minter = account;
  }

  function clearPreviousMinter() public onlyOwner {
    emit PreviousMinterCleared({removedMinter: prevMinter});
    prevMinter = address(0);
  }

  /**
   * Returns a URL for the provided `id` value.
   *
   * This method will call the "router" contract to determine what the cid value of the
   * IPFS url will be for the provided `id` entry.
   */
  function uri(uint256 id) public view override returns (string memory) {
    string memory cid = _router.lookup(id);
    return string(
      abi.encodePacked(
        "ipfs://",
        cid,
        "/",
        Strings.toString(id),
        ".json"
      )
    );
  }

  function contractURI() public view returns (string memory) {
    return _contractURI;
  }

  function updateContractURI(string calldata contracturi) external onlyOwner {
    emit ContractURIUpdated(contracturi, _contractURI);
    _contractURI = contracturi;
  }

  function batchMint(uint256[] calldata tokenIds, address[] calldata ownerIds) public onlyMinter {
    if (tokenIds.length != ownerIds.length) {
      revert RedditCollectibleAvatars__InvalidArg_TokenAndAddressLengthMismatch();
    }
    for (uint256 i=0; i < tokenIds.length; ++i) {
      _mint(ownerIds[i], tokenIds[i], "");
    }
  }

  function royaltyInfo(uint256, uint256 _salePrice)
    external
    view
    override
    returns (address receiver, uint256 royaltyAmount)
  {
      receiver = royalties.recipient;
      royaltyAmount = (_salePrice * royalties.basisPoints) / 10000;
  }

  function updateRoyalties(RoyaltyInfo calldata _royalties) external onlyOwner {
    _updateRoyalties(_royalties);
  }

  function _updateRoyalties(RoyaltyInfo calldata _royalties) internal {
    if(_royalties.basisPoints > 10000){
      revert RedditCollectibleAvatars__InvalidArg_SellerFeeBasisPoints(_royalties.basisPoints);
    }
    emit RoyaltiesUpdated(_royalties.recipient, _royalties.basisPoints, royalties.recipient, royalties.basisPoints);
    royalties = _royalties;
  }

  function updateTrustedForwarder(address forwarder) external onlyOwner {
    _updateTrustedForwarder(forwarder);
  }

  function _updateTrustedForwarder(address forwarder) internal {
    emit TrustedForwarderUpdated(forwarder, trustedForwarder());
    _setTrustedForwarder(forwarder);
  }

  function _msgSender() internal view override(BaseRelayRecipient, ContextUpgradeable) returns (address ret) {
    ret = BaseRelayRecipient._msgSender();
  }

  function _msgData() internal view override(BaseRelayRecipient, ContextUpgradeable) returns (bytes calldata ret) {
    ret = BaseRelayRecipient._msgData();
  }

  function supportsInterface(bytes4 interfaceId) public view override(ERC1155Upgradeable, IERC165) returns (bool) {
    return (interfaceId == type(IERC2981).interfaceId || super.supportsInterface(interfaceId));
  }
}