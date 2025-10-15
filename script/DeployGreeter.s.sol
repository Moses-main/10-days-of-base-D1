// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Greet} from "../src/Greeter.sol";

contract DeployGreeter is Script {
    // The default greeting message
    string public constant DEFAULT_GREETING = "Hello Base Builders";
    
    function run() public {
        // Get the private key from the environment variable
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        
        // Start broadcasting transactions
        vm.startBroadcast(deployerPrivateKey);
        
        // Deploy the Greeter contract with the default greeting
        Greet greeter = new Greet(DEFAULT_GREETING);
        
        // Log the deployed contract address
        console2.log("Greeter deployed to:", address(greeter));
        
        // Stop broadcasting transactions
        vm.stopBroadcast();
    }
    
    // Helper function to get the current greeting
    function getGreeting(address greeterAddress) public view returns (string memory) {
        return Greet(greeterAddress).getGreeting();
    }
    
    // Helper function to set a new greeting
    function setGreeting(address greeterAddress, string memory newGreeting) public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);
        Greet(greeterAddress).setGreeting(newGreeting);
        vm.stopBroadcast();
    }
}
