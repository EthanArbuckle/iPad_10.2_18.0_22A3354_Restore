@implementation AXSApplicationAccessibilityEnabled

uint64_t ___AXSApplicationAccessibilityEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.app.ax"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSApplicationAccessibilityEnabledPreference, &v2);
  if (v2)
    _kAXSCacheApplicationAccessibilityEnabled = result;
  return result;
}

@end
