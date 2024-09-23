@implementation SBReachabilityTestRecipe

- (id)title
{
  return CFSTR("Reachability Test");
}

- (void)handleVolumeIncrease
{
  id v2;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deactivateReachability");

}

- (void)handleVolumeDecrease
{
  id v2;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleReachability");

}

@end
