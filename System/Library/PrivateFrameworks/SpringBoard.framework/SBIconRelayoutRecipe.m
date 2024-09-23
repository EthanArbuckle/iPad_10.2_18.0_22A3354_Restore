@implementation SBIconRelayoutRecipe

- (id)title
{
  return CFSTR("Icon Relayout & Reload");
}

- (void)handleVolumeIncrease
{
  void *v2;
  id v3;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relayout");

}

- (void)handleVolumeDecrease
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadIcons");

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relayout");

}

@end
