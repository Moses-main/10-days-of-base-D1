// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Greet {
    string public greeting;

    // initial greeting word when the contract is created
    constructor(string memory _initialGreeting)
    {
        greeting = _initialGreeting;
    }

    // function to update the greeting word/ sentence  
    function setGreeting(string memory _newGreeting) public {
        greeting = _newGreeting;
    }

    // get the greeting word that have been created
    function getGreeting() public view returns(string memory) {
        return greeting;
    }
}
