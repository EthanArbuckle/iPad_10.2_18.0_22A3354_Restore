@implementation UITableViewShadowUpdatesController

uint64_t __67___UITableViewShadowUpdatesController_sectionsBeforeShadowUpdates___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "initialSectionIndexForFinalSectionIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", result);
  return result;
}

void __87___UITableViewShadowUpdatesController_sectionsAfterShadowUpdates_allowAppendingInsert___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = objc_msgSend(*(id *)(a1 + 32), "finalSectionIndexForInitialSectionIndex:", a2);
  v5 = v4;
  if (*(_BYTE *)(a1 + 48))
    v6 = v4 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v6 = 0;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "initialSnapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfSections");

    if (v8 != a2)
      return;
    objc_msgSend(*(id *)(a1 + 32), "finalSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v9, "numberOfSections");

  }
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", v5);
}

uint64_t __101___UITableViewShadowUpdatesController_UITableViewDropDelegate__tableView_performDropWithCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "indexPathBeforeShadowUpdates:", a2);
}

uint64_t __101___UITableViewShadowUpdatesController_UITableViewDropDelegate__tableView_performDropWithCoordinator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "indexPathBeforeShadowUpdates:", a2);
}

uint64_t __113___UITableViewShadowUpdatesController_UITableViewDragDestinationDelegate___tableView_performDropWithCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "indexPathBeforeShadowUpdates:", a2);
}

uint64_t __113___UITableViewShadowUpdatesController_UITableViewDragDestinationDelegate___tableView_performDropWithCoordinator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "indexPathBeforeShadowUpdates:", a2);
}

@end
