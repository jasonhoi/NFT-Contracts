// File contracts/InnocentMonkeyNFT.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract InnocentMonkeyNFT is ERC721A, Ownable, ERC2981ContractWideRoyalties {
    using Strings for uint256;

    uint256 public constant PRICE_PER_TOKEN = 0.12 ether;
    uint256 public collectionSize = 1000 ether;
    string private _baseTokenURI;
    bool public saleIsActive = false;

    mapping(address => uint256) public whitelist;

    constructor() ERC721A('InnocentMonkeyNFT', 'IMN') {}

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC721A, ERC2981Base)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    modifier callerIsUser() {
        require(tx.origin == msg.sender, 'The caller is another contract');
        _;
    }

    function contractURI() public view returns (string memory) {
        return 'https://ipfs.io/ipfs/QmYgAT3qoxpKYq4iV7ATcbc5B58cwiakFvRpjfkWiVSiwn?filename=contract-metadata.json';
    }

    /*
     * Pause sale if active, make active if paused
     */
    function flipSaleState() external onlyOwner {
        saleIsActive = !saleIsActive;
    }

    function setCollectionSize(uint256 size) external onlyOwner {
        collectionSize = size;
    }

    function setWhiteList(address[] calldata addresses, uint256 numAllowedToMint) public onlyOwner {
        require(numAllowedToMint <= 5, 'Exceeded max available to airdrop');
        for (uint256 i = 0; i < addresses.length; i++) {
            whitelist[addresses[i]] = numAllowedToMint;
        }
    }

    function mint(uint256 quantity) external payable virtual callerIsUser returns (uint256) {
        require(saleIsActive, 'Sale must be active to mint');
        require(totalSupply() + quantity <= collectionSize, 'Reached max supply');
        require(msg.value >= 0.12 ether * quantity, 'Not enough ETH sent: check price.');
        require(quantity <= 5, 'Exceeded max available to mint');
        _safeMint(msg.sender, quantity);
        return _currentIndex;
    }

    function developmentMint(uint256 quantity) external virtual onlyOwner returns (uint256) {
        require(saleIsActive, 'Sale must be active to mint');
        require(totalSupply() + quantity <= collectionSize, 'Reached max supply');
        _safeMint(msg.sender, quantity);
        return _currentIndex;
    }

    function airdrop(address _to, uint256 quantity) external onlyOwner returns (uint256) {
        require(saleIsActive, 'Sale must be active to mint');
        require(totalSupply() + quantity <= collectionSize, 'Reached max supply');
        _safeMint(_to, quantity);
        return _currentIndex;
    }

    function mintByWhiteList() external payable callerIsUser returns (uint256) {
        require(whitelist[msg.sender] > 0, 'Exceeded max available to purchase');
        require(totalSupply() + 1 <= collectionSize, 'Reached max supply');
        require(msg.value >= 0.12 ether, 'Not enough ETH sent: check price.');
        whitelist[msg.sender] -= 1;
        _safeMint(msg.sender, 1);
        return _currentIndex;
    }

    function withdrawMoney() external onlyOwner {
        (bool success, ) = msg.sender.call{value: address(this).balance}('');
        require(success, 'Transfer failed.');
    }

    function getMintQuota() external payable returns (uint256) {
        return whitelist[msg.sender];
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function getBaseURI() external view onlyOwner returns (string memory) {
        return _baseTokenURI;
    }

    function setBaseURI(string memory baseURI) external onlyOwner {
        _baseTokenURI = baseURI;
    }

    function getOwnershipData(uint256 tokenId) external view returns (TokenOwnership memory) {
        return _ownershipOf(tokenId);
    }

    function getSaleState() public view returns (bool) {
        return saleIsActive;
    }

    /// @notice Allows to set the royalties on the contract
    /// @dev This function in a real contract should be protected with a onlyOwner (or equivalent) modifier
    /// @param recipient the royalties recipient
    /// @param value royalties value (between 0 and 10000)
    function setRoyalties(address recipient, uint256 value) external onlyOwner {
        _setRoyalties(recipient, value);
    }

    function getCollectionSize() public view returns (uint256) {
        return collectionSize;
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply();
    }
}