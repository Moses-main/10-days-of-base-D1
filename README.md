# 10 Days of Base Batches - Day 1: Greeter Contract

Welcome to Day 1 of the 10 Days of Base Batches! This series will guide you through building and deploying smart contracts on Base, Coinbase's Layer 2 solution for Ethereum.

## Project Overview

In this first project, we'll deploy a simple Greeter contract that stores and retrieves a greeting message on the Base Sepolia testnet. This will help you understand the basics of smart contract deployment and verification on Base.

## Prerequisites

Before you begin, make sure you have the following installed:

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- [Node.js](https://nodejs.org/) (for package management)
- [Git](https://git-scm.com/)

## Environment Setup

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd 10-days-of-base-D1
   ```

2. Install dependencies:
   ```bash
   forge install
   ```

3. Set up your environment variables. Create a `.env` file in the root directory with:
   ```
   BASE_SEPOLIA_RPC_URL=your_base_sepolia_rpc_url
   PRIVATE_KEY=your_private_key
   BASESCAN_API_KEY=your_basescan_api_key
   ```

## Deploying the Greeter Contract

To deploy the Greeter contract to Base Sepolia testnet, run:

```bash
forge create src/Greeter.sol:Greet \
  --rpc-url $BASE_SEPOLIA_RPC_URL \
  --broadcast \
  --private-key $PRIVATE_KEY \
  --constructor-args "Hello Base Builders"
```

## Verifying the Contract

After deployment, verify your contract on Basescan with:

```bash
forge verify-contract \
  --chain base-sepolia \
  <YOUR_CONTRACT_ADDRESS> \
  src/Greeter.sol:Greet \
  --verifier etherscan \
  --etherscan-api-key $BASESCAN_API_KEY \
  --constructor-args $(cast abi-encode "constructor(string)" "Hello Base Builders")
```

Replace `<YOUR_CONTRACT_ADDRESS>` with the address returned from the deployment command.

## Project Structure

- `src/`: Contains the smart contract source code
  - `Greeter.sol`: The main contract that stores and retrieves a greeting message
- `test/`: Contains test files
- `script/`: Contains deployment scripts

## Development Commands

### Build

```bash
forge build
```

### Test

```bash
forge test
```

### Format Code

```bash
forge fmt
```

### Run Local Node

```bash
anvil
```

## Next Steps

1. Interact with your deployed contract using [Etherscan](https://sepolia.basescan.org/)
2. Try updating the greeting message
3. Explore the contract's functions using a block explorer

## Resources

- [Base Documentation](https://docs.base.org/)
- [Foundry Book](https://book.getfoundry.sh/)
- [Solidity Documentation](https://docs.soliditylang.org/)

## Keywords

Base Network, Smart Contracts, Solidity, Foundry, DeFi, Blockchain, Ethereum L2, Web3, dApp Development, Smart Contract Deployment
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
