pragma solidity ^0.8.4;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

/**
 *
 * A custom contract that acts as a CID registry for IPFS directories.
 *
 * This contract is a delegate contract used by the [RedditCollectibleAvatars] contract
 * for its `uri` contruction code. The purpose of it is to determine what IPFS CID
 * value to use for a given NFT ID.
 *
 * The reason why this code exists is to allow the RedditCollectibleAvatars ERC1155 contract
 * to allow for NFTs to be registered even if the underlying NFT collection expands in size.
 * This is usually not possible with a ERC1155 contract, unless IPFS isn't used (i.e. you
 * use your own domain to host the NFT metadata). Because IPFS directories (i.e. where the CID
 * reflects the contents of a directory) cannot be updated without the CID changing, this router
 * will handle that CID changing behavior throughout the collection being published. Once the
 * NFT collection is complete, then the ownership of this contract and the parent
 * RedditCollectibleAvatars contract will be relinquished so that the NFT collection stays immutable.
 *
 * ## How the "routing" works
 * This contract allows for two things:
 *   1. Registration of new routes
 *   2. Resolution of routes via the provided ID
 *
 * When the contract is instantiated for the first time, it will require a `itemsPerRoute` value
 * which specifies how many IPFS metadata files will be stored in each IPFS directory. Then,
 * when a route is registered (via the `registerRoute()` method), the provided `index` value is
 * used to reference which IPFS directory the route lives in (and what the `cid` value is).
 *
 * With routes registered, when the `lookup()` method is called, it can determine what directory
 * (or route) the provided `itemIndex` lives in (this happens by diving the `itemIndex` by
 * the `itemsPerRoute` value). Once determined, the CID value for that `itemIndex` is returned.
 *
 * The parent contract (RedditCollectibleAvatars) then uses the CID value and places that into the
 * IPFS URI that it assembles within the `uri()` method.
 *
 * ## What happens if the routes collection expands?
 * When instantiated, the contract below will pre-fill an array of routes (for performance
 * reasons) so that it doesn't have to expand the size of the array everytime a new route is
 * filled. If an when a new route is added that goes beyond the pre-fill size, the registration
 * code will expand the array by inserting additional cells up until the new route index.
 *
 */

error RedditCollectibleAvatarsRouter__UndefinedRouteForItemIndex(uint256 itemIndex, uint totalRoutes, uint256 itemsPerRoute);
error RedditCollectibleAvatarsRouter__NotRouteRegisterer();
error RedditCollectibleAvatarsRouter__InvalidArg_AddressZero();
error RedditCollectibleAvatarsRouter__InvalidArg_ItemsPerRouteZero();

contract RedditCollectibleAvatarsRouter is OwnableUpgradeable {
  event RouteRegistered(uint256 index, string cid);
  event RouteRegistererUpdated(address current, address previous);
  event ItemsPerRouteUpdated(uint256 current, uint256 previous);

  mapping(uint256 => string) public routes;
  uint256 internal _totalRoutes;
  uint256 public itemsPerRoute;
  address public routeRegisterer;

  /**
   * @param _itemsPerRoute used to specify how many entries will live in each route (in each IPFS dir)
   */
  function initialize(uint256 _itemsPerRoute, address _routeRegisterer, address owner) public initializer {
    itemsPerRoute = _itemsPerRoute;
    routeRegisterer = _routeRegisterer;
  
    OwnableUpgradeable.__Ownable_init();
    if (owner != _msgSender()) {
      OwnableUpgradeable.transferOwnership(owner);
    }
  }

  /**
   * Registers a new route in the contract
   *
   * @param index the index of the route (IFPS directory index)
   * @param cid the IPFS cid value for that route (IPFS directory)
   */
  function registerRoute(uint256 index, string calldata cid) public {
    if (_msgSender() != routeRegisterer) {
      revert RedditCollectibleAvatarsRouter__NotRouteRegisterer();
    }
    if (bytes(routes[index]).length == 0){
      _totalRoutes += 1;
    }
    if (bytes(cid).length == 0){
      _totalRoutes -= 1;
    }
    routes[index] = cid;
    emit RouteRegistered(index, cid);
  }

  /**
   * Returns the CID value for the given `itemIndex` by looking up the associated route
   *
   * @param itemIndex the index of the item (the NFT token ID)
   */
  function lookup(uint256 itemIndex) public view returns (string memory) {
    uint256 index = itemIndex / itemsPerRoute;
    string memory cid = routes[index];
    if (bytes(cid).length == 0) {
      revert RedditCollectibleAvatarsRouter__UndefinedRouteForItemIndex({itemIndex: itemIndex, totalRoutes: _totalRoutes, itemsPerRoute: itemsPerRoute});
    }
    return cid;
  }

  /**
   * Returns how many routes have been registered
   *
   * Note that this value is effected by the `initialRoutesCount` value as well.
   */
  function getTotalRoutes() public view returns (uint) {
    return _totalRoutes;
  }

  /**
   * Sets the `routeRegisterer` wallet address on the contract (note that only the `owner` wallet can execute this action)
   */
  function setRouteRegisterer(address account) public onlyOwner {
    if (account == address(0)){
      revert RedditCollectibleAvatarsRouter__InvalidArg_AddressZero();
    }
    emit RouteRegistererUpdated({current: account, previous: routeRegisterer});
    routeRegisterer = account;
  }

  /**
   * Sets `itemsPerRoute` (note that only the `owner` wallet can execute this action)
   * This function should be used cautiously. This redistributes tokenIDs to potentially different CIDs.
   */
  function setItemsPerRoute(uint256 _itemsPerRoute) public onlyOwner {
    if (_itemsPerRoute == 0){
      revert RedditCollectibleAvatarsRouter__InvalidArg_ItemsPerRouteZero();
    }
    emit ItemsPerRouteUpdated({current: _itemsPerRoute, previous: itemsPerRoute});
    itemsPerRoute = _itemsPerRoute;
  }
}