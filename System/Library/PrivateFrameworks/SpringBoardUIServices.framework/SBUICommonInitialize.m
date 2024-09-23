@implementation SBUICommonInitialize

void __SBUICommonInitialize_block_invoke()
{
  void *v0;
  __CFNotificationCenter *LocalCenter;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  __graphicsQuality = objc_msgSend(v0, "_graphicsQuality");

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_enhanceContrastChanged, (CFStringRef)*MEMORY[0x1E0CEB098], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
