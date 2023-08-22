function updateContributorPermission(address _contributor, bool _canPerformAction) public onlyOwner {
    require(contributors[_contributor], "Contributor not found");

    contributors[_contributor] = _canPerformAction;

    // Emit an event indicating that contributor permissions have been updated
}
