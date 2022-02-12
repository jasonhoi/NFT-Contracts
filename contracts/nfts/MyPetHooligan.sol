/**
 *Submitted for verification at Etherscan.io on 2021-12-13
*/

// SPDX-License-Identifier: Unlimited
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract MPHPresale {

	mapping (address => uint8) public _presaleAddresses;
	mapping (address => bool) public _presaleAddressesMinted;
	address public owner;

    constructor () {
        owner = msg.sender;
    }

    function setMainContract(address _address) public {
        require(msg.sender == owner, "My Pet Hooligan: You are not the owner");
        owner = _address;
    }

    function addPresalers(address[] calldata _addresses, uint8[] calldata _amounts) public {
        require(msg.sender == owner, "My Pet Hooligan: You are not the owner");
        for (uint x = 0; x < _addresses.length; x++) {
            _presaleAddresses[_addresses[x]] = _amounts[x];
        }
    }
    
    function removePresalers(address[] calldata _addresses) public {
        require(msg.sender == owner, "My Pet Hooligan: You are not the owner");
        for (uint x = 0; x < _addresses.length; x++) {
            _presaleAddresses[_addresses[x]] = 0;
        }
    }

    function isInPresale(address _address) public view returns (uint8) {
        return _presaleAddresses[_address];
    }

    function isInMintedPresale(address _address) public view returns (bool) {
        return _presaleAddressesMinted[_address];
    }

    function addToMinted(address _address) public {
        require(msg.sender == owner, "My Pet Hooligan: You are not the owner");
        _presaleAddressesMinted[_address] = true;
    }

}

contract MPH is ERC721Enumerable, Ownable, ReentrancyGuard {
    uint public constant MAX = 8888;
	string _baseTokenURI;
	bool _didWeGetTheReserves = false;
	uint _saleTime = 1639497600;
	uint _presaleTime = 1639411200;
	uint _price = 80000000000000000;
	mapping (uint256 => string) public _tokenURI;
    address public _presaleContract;
	address[] public _presaleAddresses;
	address[] public _presaleAddressesMinted;
	
    constructor(string memory baseURI) ERC721("My Pet Hooligan", "MPH")  {
        setBaseURI(baseURI);
    }

    function mint(uint _count) public payable nonReentrant {
        require(totalSupply() + _count <= MAX, "My Pet Hooligan: Not enough left to mint");
        require(totalSupply() < MAX, "My Pet Hooligan: Not enough left to mint");
        require(_count <= 5, "My Pet Hooligan: Exceeds the max you can mint");
        require(msg.value >= price(_count), "My Pet Hooligan: Value below price");
        

        if (block.timestamp >= _saleTime) {
            for (uint x = 0; x < _count; x++) {
                _safeMint(msg.sender, totalSupply());
            }
        } else if (block.timestamp < _saleTime && block.timestamp >= _presaleTime) {
            require(_count <= MPHPresale(_presaleContract).isInPresale(msg.sender), "My Pet Hooligan: Exceeds the max you can mint in the presale");
            require(MPHPresale(_presaleContract).isInPresale(msg.sender) > 0, "My Pet Hooligan: You are not in the presale");
            require(MPHPresale(_presaleContract).isInMintedPresale(msg.sender) == false, "My Pet Hooligan: You already minted from the presale");
            for (uint x = 0; x < _count; x++) {
                _safeMint(msg.sender, totalSupply());
            }
            MPHPresale(_presaleContract).addToMinted(msg.sender);
        }
    }

    function price(uint _count) public view returns (uint256) {
        return _price * _count;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }
    
    function setNewPrice(uint _newPrice) public onlyOwner {
        _price = _newPrice;
    }
    
    function setBaseURI(string memory baseURI) public onlyOwner {
        _baseTokenURI = baseURI;
    }

    function setPresaleAddress(address _address) public onlyOwner {
        _presaleContract = _address;
    }
    
    function changeSaleTime(uint _newDate) public onlyOwner {
        _saleTime = _newDate;
    }
    
    function changePreSaleTime(uint _newDate) public onlyOwner {
        _presaleTime = _newDate;
    }
    
    function getReserves44() public onlyOwner {
        require(totalSupply() + 44 <= MAX, "My Pet Hooligan: Not enough left to mint");
        for (uint x = 0; x < 44; x++) {
            _safeMint(msg.sender, totalSupply());
        }
    }

    function walletOfOwner(address _owner) external view returns(uint256[] memory) {
        uint tokenCount = balanceOf(_owner);
        uint256[] memory tokensId = new uint256[](tokenCount);
        for(uint i = 0; i < tokenCount; i++){
            tokensId[i] = tokenOfOwnerByIndex(_owner, i);
        }
        return tokensId;
    }

    function withdrawAll() public payable onlyOwner {
        require(payable(_msgSender()).send(address(this).balance));
    }
}