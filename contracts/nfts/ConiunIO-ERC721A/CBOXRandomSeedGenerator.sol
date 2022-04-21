// SPDX-License-Identifier: MIT

//       CBOX Random Seed Generator
//           _______
//          /\ o o o\
//         /o \ o o o\_______
//         <    >------>   o /|
//         \ o/  o   /_____/o|
//          \/______/     |oo|
//                |   o   |o/
//                |_______|/
//

//
//                 ..        .           .    ..
//  @@@@&        &@@@@@@@@@@@@@@@(        @@@@@.
//  @@@@&   .@@@@@@@@@@@@@@@@@@@@@@@@@.   @@@@@.
//  @@@@& @@@@@@@@               @@@@@@@@ @@@@@.
//  @@@@@@@@@@..                    ,@@@@@@@@@@.
//  @@@@@@@@                          .@@@@@@@@.
//  @@@@@@.                             %@@@@@@.
//  @@@@@.                               %@@@@@.
//  @@@@@                                 @@@@@.
// .@@@@&              C-BOX              @@@@@
//  @@@@@          SEED GENERATOR         @@@@@.
//  /@@@@,                              .&@@@@..
//   @@@@@/                             @@@@@(
//    %@@@@@..                        .@@@@@.
//     .@@@@@@,.                    #@@@@@@
//       .@@@@@@@@...         . ,@@@@@@@@
//         . @@@@@@@@@@@@@@@@@@@@@@@@&
//               .@@@@@@@@@@@@@@@..

// @creator:     ConiunIO
// @security:    batuhan@coniun.io
// @author:      Batuhan KATIRCI (@batuhan_katirci)
// @website:     https://coniun.io/

pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/LinkTokenInterface.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CBOXRandomSeedGenerator is VRFConsumerBaseV2, Ownable {
  event CBOXRandomSeedDrafted(
    uint256 indexed CBOXWeekIndex,
    uint256 indexed RandomSeed
  );

  VRFCoordinatorV2Interface COORDINATOR;
  LinkTokenInterface LINKTOKEN;

  uint256[] public cboxRandomSeeds;

  // Your subscription ID.
  uint64 s_subscriptionId;

  // Rinkeby coordinator. For other networks,
  // see https://docs.chain.link/docs/vrf-contracts/#configurations
  address vrfCoordinator;

  // Rinkeby LINK token contract. For other networks,
  // see https://docs.chain.link/docs/vrf-contracts/#configurations
  address linkTokenContract;

  // The gas lane to use, which specifies the maximum gas price to bump to.
  // For a list of available gas lanes on each network,
  // see https://docs.chain.link/docs/vrf-contracts/#configurations
  bytes32 gasKeyHash;

  uint32 callbackGasLimit = 300000;
  uint16 requestConfirmations = 3;

  uint256 public s_requestId;

  constructor(
    uint64 subscriptionId,
    address _vrfCoordinator,
    address _linkTokenContract,
    bytes32 _gasKeyHash
  ) VRFConsumerBaseV2(_vrfCoordinator) {
    vrfCoordinator = _vrfCoordinator;
    linkTokenContract = _linkTokenContract;
    gasKeyHash = _gasKeyHash;

    COORDINATOR = VRFCoordinatorV2Interface(_vrfCoordinator);
    LINKTOKEN = LinkTokenInterface(_linkTokenContract);
    s_subscriptionId = subscriptionId;
  }

  // Assumes the subscription is funded sufficiently.
  function requestRandomWords() external onlyOwner {
    // Will revert if subscription is not set and funded.
    s_requestId = COORDINATOR.requestRandomWords(
      gasKeyHash,
      s_subscriptionId,
      requestConfirmations,
      callbackGasLimit,
      1
    );
  }

  function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords)
    internal
    override
  {
    if (requestId != s_requestId) {
      revert("Invalid request ID");
    }
    uint256 randomWord = randomWords[0];
    cboxRandomSeeds.push(randomWord);
    emit CBOXRandomSeedDrafted(randomWords.length, randomWord);
  }
}