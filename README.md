# BEParator-2000 - Back End

The back-end of the [BEParator-2000 DApp](https://www.beperator2000.online/) - a smart contract that had to be split in two, [NoOwnerAndOwnedGenerator](https://bscscan.com/address/0xA5632246941Fbf53A54962A757B86a569A37764c#code) and [RoleGenerator](https://bscscan.com/address/0x202Ec2Ace922B3Dd533284f15A84E45bF1891476#code), due to node limit on data, both deployed on the Binance Smart Chain and verified on Bscscan, designed
for quick, easy and charge free deployment of BEP-20 tokens with various types of 
supply, ownerships and optional extra features likes minting, burning and pausing. The contract also stores all the addresses and their respective deployed tokens
in order to be able to look up Owner->Tokens.


## Intended improvements:
Give owners the ability to deploy their tokens onto other EVM-compatible 
chains and then allow the transfer of these tokens between the chains. 
Will be achieved by giving the token contract functions that would mint/burn X tokens and be triggered when:
- If token chain = current user chain then just use their injected provider calling a function e.g burn 10 TOKEN on CHAIN 1
- If token chain != current user, listen to events emitted by the previous function call and do something e.g. MINT 10 TOKEN on CHAIN 2







## Tech Stack:

The main technologies used in this project are:

- [Solidity](https://docs.soliditylang.org/en/v0.8.17/) - Language for writing smart contracts on EVM compatible chains.
- [Hardhat](https://hardhat.org/) - Ethereum development environment.
