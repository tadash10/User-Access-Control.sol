function removeContributor(address _contributor) public onlyOwner {
    require(contributors[_contributor], "Contributor not found");
    require(_contributor != owner, "Cannot remove owner as a contributor");

    contributors[_contributor] = false;
    contributorCount--;

    // Emit an event indicating that a contributor has been removed
}
