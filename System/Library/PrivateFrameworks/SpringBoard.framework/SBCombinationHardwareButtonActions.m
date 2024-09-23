@implementation SBCombinationHardwareButtonActions

- (void)performTakeScreenshotAction
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockScreenEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backlightController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInScreenOffMode");

  if ((v5 & 1) == 0)
    objc_msgSend((id)SBApp, "takeScreenshot");
}

- (void)performPresentPowerDownTransientOverlayAction
{
  id v2;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentPowerDownTransientOverlay");

}

@end
