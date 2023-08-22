function selfDestruct() public onlyOwner {
    selfdestruct(payable(owner));
}
