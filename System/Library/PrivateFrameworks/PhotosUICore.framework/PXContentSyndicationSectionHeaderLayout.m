@implementation PXContentSyndicationSectionHeaderLayout

void __121___PXContentSyndicationSectionHeaderLayout_additionalContextMenuActionsForAttributionViewInContentSyndicationHeaderView___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "canPerformActionType:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "actionPerformerForActionType:", *(_QWORD *)(a1 + 40));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performActionWithCompletionHandler:", 0);

  }
}

@end
