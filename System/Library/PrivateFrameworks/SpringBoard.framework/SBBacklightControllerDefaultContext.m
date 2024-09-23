@implementation SBBacklightControllerDefaultContext

- (BLSHBacklightHostObservable)blsBacklight
{
  return (BLSHBacklightHostObservable *)objc_msgSend(MEMORY[0x1E0D00FF0], "sharedBacklightHost");
}

- (SBLockScreenManager)lockScreenManager
{
  return (SBLockScreenManager *)+[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
}

- (SBIdleTimerDefaults)idleTimerDefaults
{
  void *v2;
  void *v3;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "idleTimerDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIdleTimerDefaults *)v3;
}

- (SBScreenSleepCoordinator)screenSleepCoordinator
{
  return (SBScreenSleepCoordinator *)objc_msgSend((id)SBApp, "screenSleepCoordinator");
}

- (SBScreenWakeAnimationController)screenWakeAnimationController
{
  return +[SBScreenWakeAnimationController sharedInstance](SBScreenWakeAnimationController, "sharedInstance");
}

- (SBWakeLogger)wakeLogger
{
  return (SBWakeLogger *)objc_msgSend(MEMORY[0x1E0DA9FC8], "sharedInstance");
}

- (SBHIDUISensorModeController)HIDUISensorModeController
{
  return (SBHIDUISensorModeController *)objc_msgSend((id)SBApp, "HIDUISensorController");
}

- (SBProximitySensorManager)proximitySensorManager
{
  return (SBProximitySensorManager *)objc_msgSend((id)SBApp, "proximitySensorManager");
}

@end
