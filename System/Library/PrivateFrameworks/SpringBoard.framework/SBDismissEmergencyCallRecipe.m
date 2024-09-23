@implementation SBDismissEmergencyCallRecipe

- (id)title
{
  return CFSTR("Dismiss Emergency Call");
}

- (void)handleVolumeIncrease
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lockScreenEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("blah"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emergencyDialerExitedWithError:", v4);

}

- (void)handleVolumeDecrease
{
  void *v2;
  void *v3;
  id v4;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lockScreenEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exitEmergencyDialerAnimated:", 1);

}

@end
