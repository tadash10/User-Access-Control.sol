// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DevSecRepository {
    address public owner;
    mapping(address => bool) public contributors;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    modifier onlyContributor() {
        require(contributors[msg.sender], "Only contributors can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
        contributors[msg.sender] = true;
    }

    function addContributor(address _contributor) public onlyOwner {
        contributors[_contributor] = true;
    }

    // Other repository-related functions can be added here
}
