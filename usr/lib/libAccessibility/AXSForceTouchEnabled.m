@implementation AXSForceTouchEnabled

uint64_t ___AXSForceTouchEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.forcetouch.enabled.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSForceTouchEnabledPreference, &v2);
  if (v2)
    _kAXSCachedForceTouchEnabled = result;
  return result;
}

@end
