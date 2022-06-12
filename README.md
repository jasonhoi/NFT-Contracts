# About

This repo record some smart contract sample codes and techniques.

## NFT projects

- [contracts/nfts/@chainlink](https://openzeppelin.com/) Chainlink contracts
- [contracts/nfts/@openzeppelin](https://openzeppelin.com/) OZ contracts
- [contracts/nfts/ERC-721A](https://github.com/chiru-labs/ERC721A/releases) Keep track of ERC-721A update changes
- [contracts/nfts/ERC-721psi](https://github.com/estarriolvetch/ERC721Psi/releases) Keep track of ERC-721psi update changes
- [contracts/nfts/3Landers](https://etherscan.io/address/0xb4d06d46a8285f4ec79fd294f78a881799d8ced9#code) ERC721 wirh VRF random token id, EIP712 whitelisting
- [contracts/nfts/Alpaca2D](https://etherscan.io/address/0x3db5463a9e2d04334192c6f2dd4b72def4751a61)
- [contracts/nfts/Karafuru](https://etherscan.io/address/0xd2f668a8461d6761115daf8aeb3cdf5f40c532c6)
- [contracts/nfts/AZUKI](https://etherscan.io/address/0xed5af388653567af2f388e6224dc7c4b3241c544)
- [contracts/nfts/BladeRunnerPunks](https://etherscan.io/address/0x0651132f094551f9d4e40de3e1e2f8b7ac149c3a)
- [contracts/nfts/Gooniez](https://etherscan.io/address/0x18cd9fda7d584401d04e30bf73fb0013efe65bb0)
- [contracts/nfts/HapebestToken](https://etherscan.io/address/0x4db1f25d3d98600140dfc18deb7515be5bd293af)
- [contracts/nfts/KillerGF](https://etherscan.io/address/0x6be69b2a9b153737887cfcdca7781ed1511c7e36)
- [contracts/nfts/LiveOfAsuna](https://etherscan.io/address/0xaf615b61448691fc3e4c61ae4f015d6e77b6cca8)
- [contracts/nfts/MyPetHooligan](https://etherscan.io/address/0x09233d553058c2f42ba751c87816a8e9fae7ef10)
- [contracts/nfts/Pixelmon](https://etherscan.io/address/0x32973908faee0bf825a343000fe412ebe56f802a)
- [contracts/nfts/SuperNormal](https://etherscan.io/address/0xd532b88607b1877fe20c181cba2550e3bbd6b31c)
- [contracts/nfts/CityDAO](https://etherscan.io/address/0x7eef591a6cc0403b9652e98e88476fe1bf31ddeb)
- [contracts/nfts/Gooniez-with-ERC20](https://etherscan.io/address/0x18cd9fda7d584401d04e30bf73fb0013efe65bb0) NFT with claimable ERC20 tokens
- [contracts/nfts/ConiunIO-ERC721A](https://etherscan.io/address/0x03ef30e1aee25abd320ad961b8cd31aa1a011c97)
- [contracts/nfts/ConiunIO-ERC721A/CBOXRandomSeedGenerator.sol](https://etherscan.io/address/0xaf8BFFf3962E49afaEA9e49BbaFAb57F4daa77E0) Coniun CBox random seed generator
- [contracts/nfts/Doodles/SpaceDoodles](https://etherscan.io/address/0x620b70123fb810f6c653da7644b5dd0b6312e4d8)
- [contracts/nfts/MURI](https://etherscan.io/address/0x4b61413d4392c806e6d0ff5ee91e6073c21d6430) ERC721A NFT
- [contracts/nfts/LateDAO](https://etherscan.io/address/0x9717e477cc5869a4a228361492b9bf7b8db58582) ERC721A NFT with ECDSA whitelisting
- [contracts/nfts/CyberBrokers](https://etherscan.io/address/0x892848074ddea461a15f337250da3ce55580ca85) A first-of-its-kind NFT fully on-chain SVG JSON data
- [contracts/nfts/MutantShibaClub](https://etherscan.io/address/0xca95777971c7c438eecbd8bfc23249fbee99e716) ERC721A NFT
- [contracts/nfts/Impostors](https://etherscan.io/address/0x3110ef5f612208724ca51f5761a69081809f03b7) ERC721 with gas saving similar to ERC721A but not implemanting it
- [contracts/nfts/RTFKT](https://etherscan.io/address/0x86825dfca7a6224cfbd2da48e85df2fc3aa7c4b1) RTFKT ERC 1155 burnable to convert to ERC 721 NFT and 2 items
- [contracts/nfts/Otherside](https://etherscan.io/address/0x34d85c9cdeb23fa97cb08333b511ac86e1c4e258) BAYC Otherside land contract, ERC721Enumerable
- [contracts/nfts/OxyanOrigin/](https://etherscan.io/address/0xe106c63e655df0e300b78336af587f300cff9e76) Oxyan Origin NFT
- [contracts/nfts/OxyanOrigin/](https://etherscan.io/address/0xbba10c994e2780b459cf6511d9ad3d4f5d38b5a1) Oxyan Staking contract

### HOW-TO techniques

- [contracts/nfts/HOW-TO-ProxyRegistry-Opensea/*](https://gist.github.com/dievardump/483eb43bc6ed30b14f01e01842e3339b): (Use in your own risk as it can be dangerous) How to work with proxy registry for Opensea addresses
- [contracts/nfts/HOW-TO-SignMessage-ECDSA/*](https://docs.openzeppelin.com/contracts/2.x/utilities): How to do ECDSA signature
- [contracts/nfts/HOW-TO-Random-Basic/*](https://fravoll.github.io/solidity-patterns/randomness.html): How to do basic on-chain randomness

## Chainlink codes

- [contracts/chainlink/VRF](https://youtu.be/JqZWariqh5s) Use Chainlink to generate random numbers
- [contracts/chainlink/FeedsNFT](https://youtu.be/nS9xP1hxg3w) Use Chainlink to generate dynamic SVG image for token uri value
- [contracts/chainlink/TeslaConsumer](https://blog.chain.link/create-tesla-smart-contract-rental/) Use Chainlink to connect Tesla Vehicle API

## Next.js sample codes

- [contracts/nextjs-marketplace/NFT](https://youtu.be/GKJBEEXUha0) How to Build a Full Stack NFT Marketplace
- [contracts/nextjs-marketplace/Market](https://youtu.be/GKJBEEXUha0) How to Build a Full Stack NFT Marketplace
