// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DevSecRepository {
    address public owner;
    mapping(address => bool) public contributors;
    uint256 public contributorCount;

    event ContributorAdded(address indexed contributor);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender;
        contributors[msg.sender] = true;
        contributorCount = 1;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    modifier onlyContributor() {
        require(contributors[msg.sender], "Only contributors can perform this action");
        _;
    }

    function addContributor(address _contributor) public onlyOwner {
        require(_contributor != address(0), "Invalid contributor address");
        require(!contributors[_contributor], "Contributor already added");
        
        contributors[_contributor] = true;
        contributorCount++;
        
        emit ContributorAdded(_contributor);
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Invalid new owner address");
        require(_newOwner != owner, "New owner address must be different");
        
        address previousOwner = owner;
        owner = _newOwner;
        
        emit OwnershipTransferred(previousOwner, _newOwner);
    }

    // Other repository-related functions can be added here
}
