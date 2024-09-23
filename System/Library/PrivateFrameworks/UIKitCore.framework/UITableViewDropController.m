@implementation UITableViewDropController

void __48___UITableViewDropController_beginIgnoringDrags__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endIgnoringDrags");

}

void __79___UITableViewDropController_dropInteraction_item_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(id *)(a1 + 32);
    objc_msgSend(v3, "cell");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && objc_msgSend(v3, "_didBeginAnimation"))
      objc_msgSend(v2, "_endAnimatingDropOfCell:", v4);
LABEL_9:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = *(id *)(a1 + 32);
    objc_msgSend(v3, "cellForTargetContainerInTableView:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 && objc_msgSend(v3, "_didBeginAnimation"))
      objc_msgSend(v2, "_endAnimatingDropIntoCell:", v4);
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(WeakRetained, "dragItemDropAnimations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __97___UITableViewDropController_insertPlaceholderAtIndexPath_withContext_previewParametersProvider___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
