bool public paused;

modifier whenNotPaused() {
    require(!paused, "Contract is paused");
    _;
}

modifier whenPaused() {
    require(paused, "Contract is not paused");
    _;
}

function pause() public onlyOwner whenNotPaused {
    paused = true;

    // Emit an event indicating that the contract has been paused
}

function unpause() public onlyOwner whenPaused {
    paused = false;

    // Emit an event indicating that the contract has been unpaused
}
