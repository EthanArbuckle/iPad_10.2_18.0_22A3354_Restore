@implementation SBPresentFloatingDockTestRecipe

- (id)title
{
  return CFSTR("Present Floating Dock");
}

- (void)handleVolumeIncrease
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDisplayWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingDockController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentFloatingDockIfDismissedAnimated:completionHandler:", 1, 0);

}

- (void)handleVolumeDecrease
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeDisplayWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingDockController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissFloatingDockIfPresentedAnimated:completionHandler:", 1, 0);

}

@end
