@implementation SetupDebugUserDefaults

void ____SetupDebugUserDefaults_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__DebugUserDefaultsChangedNotification, CFSTR("com.apple.itunesstored.defaultschange"), 0, CFNotificationSuspensionBehaviorCoalesce);
  __ReloadDebugUserDefaults();
}

@end
