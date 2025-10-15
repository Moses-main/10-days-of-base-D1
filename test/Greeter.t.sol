// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Greet} from "../src/Greeter.sol";

contract GreeterTest is Test {
    Greet public greeter;
    string public constant INITIAL_GREETING = "Hello Base Builders";
    string public constant NEW_GREETING = "Hello Test";

    // This function runs before each test case
    function setUp() public {
        greeter = new Greet(INITIAL_GREETING);
    }

    // Test that the contract is deployed with the correct initial greeting
    function testInitialGreeting() public view {
        string memory currentGreeting = greeter.getGreeting();
        assert(keccak256(abi.encodePacked(currentGreeting)) == keccak256(abi.encodePacked(INITIAL_GREETING)));
    }

    // Test updating the greeting
    function testSetGreeting() public {
        greeter.setGreeting(NEW_GREETING);
        string memory currentGreeting = greeter.getGreeting();
        assert(keccak256(abi.encodePacked(currentGreeting)) == keccak256(abi.encodePacked(NEW_GREETING)));
    }

    // Test that the greeting was actually updated
    function testGetGreeting() public {
        string memory currentGreeting = greeter.getGreeting();
        assert(keccak256(abi.encodePacked(currentGreeting)) == keccak256(abi.encodePacked(INITIAL_GREETING)));
    }

    // Fuzz test for setting random greetings
    function testFuzz_SetGreeting(string memory _greeting) public {
        // Skip empty strings in fuzzing
        vm.assume(bytes(_greeting).length > 0);
        greeter.setGreeting(_greeting);
        string memory currentGreeting = greeter.getGreeting();
        assert(keccak256(abi.encodePacked(currentGreeting)) == keccak256(abi.encodePacked(_greeting)));
    }
}
