////// src/CitizenNFT.sol
/* pragma solidity ^0.8.7; */

// ============ Imports ============

/* import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol"; */
/* import "@openzeppelin/contracts/access/Ownable.sol"; */
/* import "@openzeppelin/contracts/security/ReentrancyGuard.sol"; */
/* import "@openzeppelin/contracts/utils/math/SafeMath.sol"; */
/* import "./Base64.sol"; */
/* import "./IEIP2981.sol"; */
/* import "./IERC1155WithRoyalty.sol"; */

/// @notice Error library for centralised error messaging
library Errors {
    string constant invalidCitizenshipId = "Unknown Citizen NFT ID";
}

/// @title CitizenNFT
/// @author Odysseas Lamtzidis
/// @notice An ERC721 NFT that replaces the Citizen NFTs that are issued by the OpenSea Storefront Smart contract.
/// This smart contract enables users to either mint a new CitizenNFT or
/// "transfer" their Citizen NFTs from the OpenSea smart contract to this one.
contract CitizenNFT is
    ERC1155,
    Ownable,
    IERC1155WithRoyalty,
    IEIP2981,
    ReentrancyGuard
{
    // We use safemath to avoid under and over flows
    using SafeMath for uint256;
    // At the time of writing, a new CitizenNFT costs 0.25 ether.
    // This variable can change by the appropriate function
    uint256 private citizenshipStampCostInWei = 250000000000000000;
    // Internal Ids that are used to differentiate between the different Citizen NFTs
    uint256 private constant CITIZEN_NFT_ID = 42;
    uint256 private constant FOUNDING_NFT_ID = 69;
    uint256 private constant FIRST_NFT_ID = 7;
    // Events
    event LogEthDeposit(address);
    event CitizenLegislatureChanged(string, uint256);
    event NewCitizen(address, uint256, uint256);
    event TokenRoyaltySet(uint256 tokenId, address recipient, uint16 bps);
    event DefaultRoyaltySet(address recipient, uint16 bps);
    // ERC1155
    uint256 private mintedCitizensCounter = 0;
    uint256 private mintedFoundingCitizensCounter = 0;
    uint256 private mintedFirstCitizensCounter = 0;
    // EIP2981
    struct TokenRoyalty {
        address recipient;
        uint16 bps;
    }
    TokenRoyalty public defaultRoyalty;
    mapping(uint256 => TokenRoyalty) private _tokenRoyalties;
    // NFT metadata
    mapping(uint256 => string) private tokenURIs;
    mapping(uint256 => string) private citizenNFTDescriptions;
    //Initialisation
    bool private contractInitialized;
    uint256 private reservedCitizenships;

    /// @notice Initialise CitizenNFT smart contract with the appropriate address and ItemIds of the
    /// Open Sea shared storefront smart contract and the Citizen NFTs that are locked in it.
    constructor(address _royaltyRecipient, uint16 _royaltyBPS)
        Ownable()
        ERC1155("")
    {
        defaultRoyalty = TokenRoyalty(_royaltyRecipient, _royaltyBPS);
        tokenURIs[
            CITIZEN_NFT_ID
        ] = "https://gateway.pinata.cloud/ipfs/QmRRnuHVwhoYEHsTxzMcGdrCfthKTS65gnfUqDZkv6kbza";
        tokenURIs[
            FOUNDING_NFT_ID
        ] = "https://gateway.pinata.cloud/ipfs/QmSrKL6fhPYU6BbYrV97AJm3aM6naGWZK95QntXXZuGQrF";
        tokenURIs[
            FIRST_NFT_ID
        ] = "https://gateway.pinata.cloud/ipfs/Qmb6VmYiktfvNX3YkLosYwjUM82PcEkr2irZ4PWheYiG2b";
        citizenNFTDescriptions[CITIZEN_NFT_ID] = "CityDAO Citizen";
        citizenNFTDescriptions[FOUNDING_NFT_ID] = "CityDAO Founding Citizen";
        citizenNFTDescriptions[FIRST_NFT_ID] = "CityDAO First Citizen";
        contractInitialized = false;
        reservedCitizenships = 0;
    }

    ///@notice Request a new Citizen NFT from the owner of the smart contract.
    /// You can request any number of NFTs and pay `citizenshipStampCostInWei` per NFT
    ///@param _citizenNumber Number of Citizen NFTs to request

    function onlineApplicationForCitizenship(uint256 _citizenNumber)
        public
        payable
        nonReentrant
    {
        require(
            msg.value >= citizenshipStampCostInWei * _citizenNumber,
            "ser, the state machine needs oil"
        );
        require(
            this.balanceOf(this.owner(), CITIZEN_NFT_ID) - _citizenNumber >
                reservedCitizenships,
            "No available Citizenship"
        );
        _safeTransferFrom(
            this.owner(),
            msg.sender,
            CITIZEN_NFT_ID,
            _citizenNumber,
            ""
        );
    }

    ///@notice Mint new citizenNFTs to an address, usually that of CityDAO.
    ///@param _to Address to where the NFTs must be minted
    ///@param _citizenType ID for the Citizen NFT (42 for regular, 69 for founding, 7 for first)
    ///@param _numberOfCitizens The number of Citizen NFTs to be minted
    function issueNewCitizenships(
        address _to,
        uint256 _citizenType,
        uint256 _numberOfCitizens
    ) public onlyOwner {
        if (_citizenType == 42) {
            mintedCitizensCounter = mintedCitizensCounter.add(
                _numberOfCitizens
            );
        } else if (_citizenType == 69) {
            mintedFoundingCitizensCounter = mintedFoundingCitizensCounter.add(
                _numberOfCitizens
            );
        } else if (_citizenType == 7) {
            mintedFirstCitizensCounter = mintedFirstCitizensCounter.add(
                _numberOfCitizens
            );
        } else {
            revert(Errors.invalidCitizenshipId);
        }
        _mint(_to, _citizenType, _numberOfCitizens, "");
    }

    function initialCitizenship() external onlyOwner {
        require(contractInitialized == false, "contract initialized already");
        issueNewCitizenships(msg.sender, CITIZEN_NFT_ID, 10000);
        issueNewCitizenships(msg.sender, FOUNDING_NFT_ID, 50);
        issueNewCitizenships(msg.sender, FIRST_NFT_ID, 1);
        contractInitialized = true;
    }

    /// @notice Change the cost for minting a new regular Citizen NFT
    /// Can only be called by the owner of the smart contract.
    function legislateCostOfEntry(uint256 _stampCost) external onlyOwner {
        citizenshipStampCostInWei = _stampCost;
        emit CitizenLegislatureChanged("stampCost", _stampCost);
    }

    /// @notice Return the current cost of minting a new regular Citizen NFT.
    function inquireCostOfEntry() external view returns (uint256) {
        return citizenshipStampCostInWei;
    }

    /// @notice Return the number of minted Citizen NFTs
    function inquireHousingNumbers() external view returns (uint256) {
        return mintedCitizensCounter;
    }

    /// @notice Return the current maximum number of  minted Founding Citizen NFTs
    function inquireAboutHistory() external view returns (uint256) {
        return mintedFoundingCitizensCounter;
    }

    /// @notice Withdraw the funds locked in the smart contract,
    /// originating from the minting of new regular Citizen NFTs.
    /// Can only becalled by the owner of the smart contract.
    function raidTheCoffers() external onlyOwner {
        uint256 amount = address(this).balance;
        (bool success, ) = owner().call{value: amount}("");
        require(success, "Anti-corruption agencies stopped the transfer");
    }

    function reserveCitizenships(uint256 _numberOfCitizenships)
        external
        onlyOwner
    {
        reservedCitizenships = _numberOfCitizenships;
    }

    function howManyReservedCitizenships() external view returns (uint256) {
        return reservedCitizenships;
    }

    fallback() external payable {
        emit LogEthDeposit(msg.sender);
    }

    receive() external payable {
        emit LogEthDeposit(msg.sender);
    }

    /// @notice Airdrop Citizen NFTs to users. The citizen NFTs must first be minted to the owner address.
    function awardCitizenship(
        address[] calldata _awardees,
        uint256[] calldata _numberOfCitizenships,
        uint256 _citizenshipType
    ) external onlyOwner {
        require(
            _awardees.length == _numberOfCitizenships.length,
            "array length not equal"
        );
        address cityDAO = this.owner();
        for (uint256 i = 0; i < _awardees.length; i++) {
            safeTransferFrom(
                cityDAO,
                _awardees[i],
                _citizenshipType,
                _numberOfCitizenships[i],
                ""
            );
        }
    }

    /// @notice returns the uri metadata. Used by marketplaces and wallets to show the NFT
    function uri(uint256 _citizenNFTId)
        public
        view
        override
        returns (string memory)
    {
        string memory json = Base64.encode(
            bytes(
                string(
                    abi.encodePacked(
                        '{ "name": "',
                        citizenNFTDescriptions[_citizenNFTId],
                        '", ',
                        '"description" : ',
                        '"A Citizen of CityDAO holds governance in the operations and activities of CityDAO.",',
                        '"image": "',
                        tokenURIs[_citizenNFTId],
                        '"'
                        "}"
                    )
                )
            )
        );
        return string(abi.encodePacked("data:application/json;base64,", json));
    }

    /// @notice Change the URI of citizen NFTs
    /// @param _tokenURIs Array of new token URIs
    /// @param _citizenNFTIds Array of citizen NFT Ids (69 OR 42 OR 7) for the respective URIs
    function changeURIs(
        string[] calldata _tokenURIs,
        uint256[] calldata _citizenNFTIds
    ) external onlyOwner {
        for (uint256 i = 0; i < _tokenURIs.length; i++) {
            tokenURIs[_citizenNFTIds[i]] = _tokenURIs[i];
        }
    }

    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // Royalty implementation based on @abbouali
    // https://github.com/abbouali/sample_erc1155_with_eip2981
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    /// @dev Define the fee for the token specify
    /// @param tokenId uint256 token ID to specify
    /// @param recipient address account that receives the royalties
    function setTokenRoyalty(
        uint256 tokenId,
        address recipient,
        uint16 bps
    ) public override onlyOwner {
        _tokenRoyalties[tokenId] = TokenRoyalty(recipient, bps);
        emit TokenRoyaltySet(tokenId, recipient, bps);
    }

    /// @dev Define the default amount of fee and receive address
    /// @param recipient address ID account receive royalty
    /// @param bps uint256 amount of fee (1% == 100)
    function setDefaultRoyalty(address recipient, uint16 bps)
        public
        override
        onlyOwner
    {
        defaultRoyalty = TokenRoyalty(recipient, bps);
        emit DefaultRoyaltySet(recipient, bps);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(ERC1155)
        returns (bool)
    {
        return
            interfaceId == type(IEIP2981).interfaceId ||
            interfaceId == type(IERC1155WithRoyalty).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    /// @dev Returns royalty info (address to send fee, and fee to send)
    /// @param tokenId uint256 ID of the token to display information
    /// @param value uint256 sold price
    function royaltyInfo(uint256 tokenId, uint256 value)
        public
        view
        override
        returns (address, uint256)
    {
        if (_tokenRoyalties[tokenId].recipient != address(0)) {
            return (
                _tokenRoyalties[tokenId].recipient,
                (value * _tokenRoyalties[tokenId].bps) / 10000
            );
        }
        if (defaultRoyalty.recipient != address(0) && defaultRoyalty.bps != 0) {
            return (
                defaultRoyalty.recipient,
                (value * defaultRoyalty.bps) / 10000
            );
        }
        return (address(0), 0);
    }
}