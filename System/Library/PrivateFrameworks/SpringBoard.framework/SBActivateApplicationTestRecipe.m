@implementation SBActivateApplicationTestRecipe

- (id)title
{
  return CFSTR("Activate App");
}

- (void)handleVolumeIncrease
{
  void *v2;
  id v3;

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationWithBundleIdentifier:", CFSTR("com.apple.mobilenotes"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  SBWorkspaceActivateApplication(v3);
}

- (void)handleVolumeDecrease
{
  void *v2;
  id v3;

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationWithBundleIdentifier:", CFSTR("com.apple.mobilenotes"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  SBWorkspaceActivateApplicationSuspended(v3);
}

@end
