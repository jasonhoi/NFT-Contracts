/**
 *Submitted for verification at Etherscan.io on 2022-02-15
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract ALIToken is ERC721, Ownable, ERC721Enumerable, ReentrancyGuard {
    using Strings for uint256;

    constructor() ERC721("alinft-official", "ALI") {}
    
    string private baseURI;
    string private blindURI;
    uint256 constant private MAX_NFT = 10000;
    uint256 public WHITE_ONE_COUNT;
    uint256 public WHITE_TWO_COUNT;
    uint256 public _oneListCount;
    uint256 public _twoListCount;
    uint256 public listPrice = 100000000000000000;  // 0.1 ETH
    uint256 public publicPrice = 150000000000000000; // 0.15 ETH
    address private root = 0xA6c28f11002435EA015309Ca1b5DaDc533Be22fB;
    bool public isActive;
    bool public reveal;
    uint256 public ONE_TIME;
    uint256 public TWO_TIME;
    uint256 public PUBLIC_TIME;
    uint256 public END_TIME;
    mapping (address => uint256) private _nftMintCount;
    mapping (uint256 => uint256) private _allowCount;
    mapping(uint256 => mapping(address => bool)) private _whiteList;

    function oneCount(uint256 _num) public onlyOwner {
        WHITE_ONE_COUNT = _num;
    }

    function twoCount(uint256 _num) public onlyOwner {
        WHITE_TWO_COUNT = _num;
    }

    function activeNow() public onlyOwner {
        isActive = true;
    }

    function revealNow() public onlyOwner {
        reveal = true;
    }

    function onetime(uint256 _time) public onlyOwner(){
        ONE_TIME = _time;
    }

    function twotime(uint256 _time) public onlyOwner(){
        TWO_TIME = _time;
    }

    function publictime(uint256 _time) public onlyOwner(){
        PUBLIC_TIME = _time;
    }

    function endtime(uint256 _time) public onlyOwner(){
        END_TIME = _time;
    }

    function mintCount(address _address) public view returns(uint256){
        return _nftMintCount[_address];
    }

    function allowCount(uint256 _edition) public view returns(uint256){
        return _allowCount[_edition];
    }

    function white(address _address) public view returns(uint256){
        if(_whiteList[1][_address]){
            return 1;
        }else if(_whiteList[2][_address]){
            return 2;
        }else{
            return 3;
        }
    }

    function setWhite(address[] memory _address,uint256[] memory _edition) public onlyOwner {
        require(_address.length == _edition.length, "Should have same length");
        for(uint256 i = 0; i < _address.length;i++){
            if(_edition[i] == 1){
                require(_oneListCount + 1 <= WHITE_ONE_COUNT,"Cannot list above limit");
                _oneListCount++;
            }
            if(_edition[i] == 2){
                require(_twoListCount + 1 <= WHITE_TWO_COUNT,"Cannot list above limit");
                _twoListCount++;
            }
            _whiteList[_edition[i]][_address[i]] = true;
        }
    }

    modifier mintCheck(uint256 num){
        require(tx.origin == msg.sender,"CONTRACTS_NOT_ALLOWED_TO_MINT");
        require(isActive, "Contract is not active");
        require(totalSupply() + num <= MAX_NFT, "Purchase would exceed max public supply of NFTs");
        address _address = msg.sender;
        uint256 time = block.timestamp;
        if(_whiteList[1][_address] && time >= ONE_TIME && time < PUBLIC_TIME){
            require(_nftMintCount[_address] + num <= 2, "Cannot mint above limit");
            require(msg.value == listPrice * num, "Ether value sent is not correct");
        }else if(_whiteList[2][_address] && time >= TWO_TIME && time < PUBLIC_TIME){
            require(_nftMintCount[_address] + num <= 1, "Cannot mint above limit");
            require(msg.value == listPrice * num, "Ether value sent is not correct");
        }else if(_whiteList[1][_address] == false && _whiteList[2][_address] == false && time >= PUBLIC_TIME && time < END_TIME){
            require(_nftMintCount[_address] + num <= 1, "Cannot mint above limit");
            require(msg.value == publicPrice * num, "Ether value sent is not correct");
        }else{
            revert("mint error");
        }
        _;
    }

    function mintNFT(uint256 num) external payable mintCheck(num) nonReentrant {
        address _address = msg.sender;
        (bool success, ) = payable(root).call{value: msg.value}("");
        require(success, "Failed to withdraw payment");
        for(uint256 i = 0; i < num;i++){
             uint256 tokenId = _randMod();
             _safeMint(_address, tokenId);
             _nftMintCount[_address]++;
             if(_whiteList[1][_address]){
                _allowCount[1]++;
            }else if(_whiteList[2][_address]){
                _allowCount[2]++;
            }else{
                _allowCount[3]++;
            }
        }
    }

    function setURI(string memory _blindURI, string memory _URI) external onlyOwner {
        blindURI = _blindURI;
        baseURI = _URI;
    }

    function tokenURI(uint256 _tokenId) public view virtual override returns (string memory) {
        require(_exists(_tokenId), "ERC721Metadata: URI query for nonexistent token");
        if (!reveal) {
            return string(abi.encodePacked(blindURI, _tokenId.toString()));
        } else {
            return string(abi.encodePacked(baseURI, _tokenId.toString()));
        }
    }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
 
    uint[MAX_NFT] public indices;
    uint nonce;
    function _randMod() private returns (uint) {
        uint totalSize = MAX_NFT - nonce;
        uint index = uint(keccak256(abi.encodePacked(nonce, msg.sender, block.difficulty, block.timestamp))) % totalSize;
        uint value = 0;
        if (indices[index] != 0) {
            value = indices[index];
        } else {
            value = index;
        }
 
        if (indices[totalSize - 1] == 0) {
            indices[index] = totalSize - 1;
        } else {
            indices[index] = indices[totalSize - 1];
        }
        nonce++;
        return value+1;
    }
}