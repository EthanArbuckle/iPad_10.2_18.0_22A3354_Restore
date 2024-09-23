@implementation SBSwitcherCardUpdateTestRecipe

- (id)title
{
  return CFSTR("Add/Remove Switcher Cards");
}

- (void)handleVolumeIncrease
{
  id v2;

  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_insertCardForDisplayIdentifier:atIndex:", CFSTR("com.apple.mobilesafari"), 1);

}

- (void)handleVolumeDecrease
{
  id v2;

  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_removeCardForDisplayIdentifier:", CFSTR("com.apple.mobilesafari"));

}

@end
