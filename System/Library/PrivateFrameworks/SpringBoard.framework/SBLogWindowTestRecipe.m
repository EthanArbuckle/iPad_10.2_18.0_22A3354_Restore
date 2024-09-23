@implementation SBLogWindowTestRecipe

- (id)title
{
  return CFSTR("Log Window");
}

- (void)handleVolumeIncrease
{
  id v2;

  +[SBLogWindowController sharedInstance](SBLogWindowController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "show");

}

- (void)handleVolumeDecrease
{
  id v2;

  +[SBLogWindowController sharedInstance](SBLogWindowController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hide");

}

- (void)windowSceneDidUpdate:(id)a3
{
  +[SBLogWindowController setWindowScene:](SBLogWindowController, "setWindowScene:", a3);
}

@end
