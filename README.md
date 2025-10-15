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

## Deployment

### Using Foundry Script (Recommended)

We've provided a deployment script that makes it easy to deploy and interact with the Greeter contract:

1. **Deploy the contract**:
   ```bash
   # Deploy to Base Sepolia
   forge script script/DeployGreeter.s.sol:DeployGreeter \
     --rpc-url $BASE_SEPOLIA_RPC_URL \
     --broadcast \
     --verify \
     --etherscan-api-key $BASESCAN_API_KEY \
     -vvvv
   ```

2. **Interact with the deployed contract**:
   ```bash
   # Get the current greeting
   cast call <CONTRACT_ADDRESS> "getGreeting()(string)" --rpc-url $BASE_SEPOLIA_RPC_URL
   
   # Set a new greeting (requires private key)
   cast send <CONTRACT_ADDRESS> \
     "setGreeting(string)" "New Greeting" \
     --private-key $PRIVATE_KEY \
     --rpc-url $BASE_SEPOLIA_RPC_URL
   ```

### Manual Deployment

Alternatively, you can deploy the contract directly:

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

- `src/`
  - `Greeter.sol`: The main contract that stores and retrieves a greeting message
- `test/`
  - `Greeter.t.sol`: Test file with unit tests for the Greeter contract
- `script/`
  - `DeployGreeter.s.sol`: Script to deploy and interact with the Greeter contract
  - `Counter.s.sol`: Example script (not used in this project)

## Development Commands

### Build

```bash
forge build
```

### Testing the Contract

We've included a comprehensive test suite for the Greeter contract. The tests cover:

- Initial greeting setup
- Updating the greeting
- Retrieving the current greeting
- Fuzz testing with random inputs

To run the tests:

```bash
# Run all tests
forge test

# Run a specific test with detailed output
forge test --match-test testSetGreeting -vvv

# Run with gas report
forge test --gas-report

# Run fuzz tests with a specific number of runs
forge test --match-test testFuzz_SetGreeting -vvv --fuzz-runs 1000
```

#### Test Coverage

To generate a test coverage report:

```bash
forge coverage
```

This will show you which lines of your contract are being tested and help identify any untested code paths.

### Format Code

```bash
forge fmt
```

### Run Local Node

```bash
anvil
```

## Testing Locally with Anvil

You can test the contract locally using Anvil, Foundry's local testnet:

```bash
# In terminal 1: Start Anvil
anvil

# In terminal 2: Deploy to local node
forge create --rpc-url http://127.0.0.1:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --constructor-args "Hello Local Test" \
  src/Greeter.sol:Greet

# Interact with the contract using cast
# Get greeting
cast call <CONTRACT_ADDRESS> "getGreeting()(string)" --rpc-url http://127.0.0.1:8545

# Set new greeting
cast send <CONTRACT_ADDRESS> "setGreeting(string)" "New Local Greeting" \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 \
  --rpc-url http://127.0.0.1:8545
```

## Next Steps

1. Interact with your deployed contract using [Etherscan](https://sepolia.basescan.org/)
2. Try updating the greeting message
3. Explore the contract's functions using a block explorer
4. Write additional test cases to cover more scenarios
5. Add events to the contract for better off-chain tracking

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
