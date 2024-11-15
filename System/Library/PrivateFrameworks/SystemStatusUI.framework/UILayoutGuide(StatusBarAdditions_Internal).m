@implementation UILayoutGuide(StatusBarAdditions_Internal)

- (void)_ui_addSubLayoutItem:()StatusBarAdditions_Internal
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "owningView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ui_addToView:atIndex:", v5, -1);

}

- (uint64_t)_ui_addToView:()StatusBarAdditions_Internal atIndex:
{
  return objc_msgSend(a3, "addLayoutGuide:", a1);
}

- (void)_ui_removeFromParentLayoutItem
{
  id v2;

  objc_msgSend(a1, "owningView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeLayoutGuide:", a1);

}

- (uint64_t)_ui_usesManualLayout
{
  return 0;
}

- (void)_ui_insertSubLayoutItem:()StatusBarAdditions_Internal atIndex:
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "owningView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_ui_addToView:atIndex:", v7, a4);

}

- (id)traitCollection
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_ui_view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
