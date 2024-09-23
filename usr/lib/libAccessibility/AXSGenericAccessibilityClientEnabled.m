@implementation AXSGenericAccessibilityClientEnabled

uint64_t ___AXSGenericAccessibilityClientEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.generic.accessibility.client"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSGenericAccessibilityClientEnabledPreference, &v2);
  if (v2)
    _kAXSCacheGenericAccessibilityClientEnabled = result;
  return result;
}

@end
