@implementation SBPrepareLaunchSentinelIfNecessary

void __SBPrepareLaunchSentinelIfNecessary_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  BYSetupAssistantPrepareLaunchSentinel();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)SBSetupAssistantUISessionNoLongerExclusiveNotification, (CFStringRef)*MEMORY[0x1E0D8D710], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
