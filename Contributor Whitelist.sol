mapping(address => bool) public whitelist;

function addToWhitelist(address _address) public onlyOwner {
    whitelist[_address] = true;

    // Emit an event indicating that an address has been added to the whitelist
}
