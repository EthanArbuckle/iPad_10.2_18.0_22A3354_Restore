@implementation SBMainSwitcherTestRecipe

- (id)title
{
  return CFSTR("Main Switcher");
}

- (void)handleVolumeIncrease
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "embeddedDisplayWindowScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activateMainSwitcherWithSource:animated:", 0, 1);

}

- (void)handleVolumeDecrease
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "embeddedDisplayWindowScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissMainSwitcherWithSource:animated:", 0, 1);

}

@end
