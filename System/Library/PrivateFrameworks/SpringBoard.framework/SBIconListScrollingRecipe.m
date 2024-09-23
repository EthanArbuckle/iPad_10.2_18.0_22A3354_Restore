@implementation SBIconListScrollingRecipe

- (id)title
{
  return CFSTR("Icon List Scrolling");
}

- (void)handleVolumeIncrease
{
  void *v2;
  void *v3;
  id v4;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootFolderController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setCurrentPageIndex:animated:", objc_msgSend(v4, "firstIconPageIndex"), 1);
}

- (void)handleVolumeDecrease
{
  void *v2;
  void *v3;
  id v4;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootFolderController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setCurrentPageIndex:animated:", objc_msgSend(v4, "firstIconPageIndex"), 0);
}

@end
