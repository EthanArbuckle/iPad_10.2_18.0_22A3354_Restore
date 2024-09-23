@implementation UIFocusGetSensitivitySetting

void __UIFocusGetSensitivitySetting_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_UIFocusClearCachedSensitivitySettingObserver, CFSTR("UIFocusSensitivityUpdateNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

@end
