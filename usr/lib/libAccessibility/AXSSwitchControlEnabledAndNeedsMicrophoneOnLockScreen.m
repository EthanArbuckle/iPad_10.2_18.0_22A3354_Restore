@implementation AXSSwitchControlEnabledAndNeedsMicrophoneOnLockScreen

void ___AXSSwitchControlEnabledAndNeedsMicrophoneOnLockScreen_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v1;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsSCNeedsMicrophoneAccessibilityPrefChanged, CFSTR("com.apple.accessibility.cache.switch.control"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v1 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v1, 0, (CFNotificationCallback)_axsSCNeedsMicrophoneAccessibilityPrefChanged, CFSTR("com.apple.accessibility.needs.microphone.cache"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
