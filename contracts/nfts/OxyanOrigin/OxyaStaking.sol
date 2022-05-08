// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

contract OxyaStaking is Ownable, ReentrancyGuard {

    mapping(uint256 => address) public depositaries;
    
    address public OxyaAddress;
    bool public isActive = false;

    event Staked(address owner, uint256 tokenId, uint256 timeframe);
    event Unstaked(address owner, uint256 tokenId, uint256 timeframe);

    modifier shouldBeActive() {
        require(isActive, "Contract is not active");
        _;
    }

    constructor(address oxyaAddress_) {
        OxyaAddress = oxyaAddress_;
    }

    /**
     * @dev   activate/desactivate the smart contract
     * staking methods will be blocked but this will not be the case of unstaking methods
     */
    function toggleActive() external onlyOwner {
        isActive = !isActive;
    }

    /**
     * @dev stake tokens in the contract, if the token was already staked it replace prev timestamp by actual
     * @param _tokenId ids of token
     */
    function stake(uint256 _tokenId) internal shouldBeActive {
        require(
            IERC721Enumerable(OxyaAddress).ownerOf(_tokenId) == msg.sender &&
                depositaries[_tokenId] == address(0),
            "You must own the NFT."
        );
        IERC721Enumerable(OxyaAddress).transferFrom(
            msg.sender,
            address(this),
            _tokenId
        );
        depositaries[_tokenId] = msg.sender;

        emit Staked(msg.sender, _tokenId, block.timestamp);
    }

    /**
     * @dev stake tokens in the contract, if the token was already staked it replace prev timestamp by actual
     * @param _tokenIds ids of token
     */
    function batchStake(uint256[] memory _tokenIds) public shouldBeActive {
        for (uint256 i = 0; i < _tokenIds.length; i++) {
            stake(_tokenIds[i]);
        }
    }

    // UNSTAKE
    /**
     * @dev unstake token out of the contract
     * @param _tokenId tokenId of token to unstake
     */
    function unstake(uint256 _tokenId) internal {
        require(depositaries[_tokenId] == msg.sender, "Not original owner");

        IERC721Enumerable(OxyaAddress).transferFrom(
            address(this),
            msg.sender,
            _tokenId
        );
        depositaries[_tokenId] = address(0);

        emit Unstaked(msg.sender, _tokenId, block.timestamp);
    }

    /**
     * @dev unstake tokens out of the contract
     * @param _tokenIds tokenIds of token to unstake
     */
    function batchUnstake(uint256[] memory _tokenIds) public {
        for (uint256 i = 0; i < _tokenIds.length; i++) {
            unstake(_tokenIds[i]);
        }
    }

    /**
     * @dev necessary to transfer tokens
     */
    function onERC721Received(
        address,
        address,
        uint256,
        bytes calldata
    ) external pure returns (bytes4) {
        return IERC721Receiver.onERC721Received.selector;
    }
}