@implementation SBToggleClassroomPluginTestRecipe

- (id)title
{
  return CFSTR("Toggle Classroom Plugin");
}

- (void)handleVolumeIncrease
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockScreenEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pluginPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DAC230], "contextWithName:", CFSTR("ClassroomLockScreen"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableLockScreenPluginWithContext:", v4);

}

- (void)handleVolumeDecrease
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockScreenEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pluginPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DAC230], "contextWithName:", CFSTR("ClassroomLockScreen"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disableLockScreenPluginWithContext:", v4);

}

@end
