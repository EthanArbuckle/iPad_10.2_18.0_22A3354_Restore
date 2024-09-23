@implementation UISearchSuggestionControllerIOSBase

void __69___UISearchSuggestionControllerIOSBase__geometryChanged_forAncestor___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "_refreshSearchSuggestionsMenuAfterGeometryChange");
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "setHasSetUpGeometryChangeResponse:", 0);

  }
}

void __69___UISearchSuggestionControllerIOSBase__geometryChanged_forAncestor___block_invoke_4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "_updateMenuWithSuggestionGroups:", *(_QWORD *)(a1 + 32));

    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "setHasSetUpGeometryChangeResponse:", 0);

  }
}

@end
