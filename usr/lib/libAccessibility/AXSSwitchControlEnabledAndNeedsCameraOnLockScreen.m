@implementation AXSSwitchControlEnabledAndNeedsCameraOnLockScreen

void ___AXSSwitchControlEnabledAndNeedsCameraOnLockScreen_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v1;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsSCNeedsCameraAccessibilityPrefChanged, CFSTR("com.apple.accessibility.cache.switch.control"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v1 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v1, 0, (CFNotificationCallback)_axsSCNeedsCameraAccessibilityPrefChanged, CFSTR("com.apple.accessibility.needs.camera.cache"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
