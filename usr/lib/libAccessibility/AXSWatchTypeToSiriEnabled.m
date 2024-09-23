@implementation AXSWatchTypeToSiriEnabled

uint64_t ___AXSWatchTypeToSiriEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.watch.typetosiri.enabled"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSWatchTypeToSiriEnabledPreference, &v2);
  if (v2)
    _kAXSCacheWatchTypeToSiriEnabled = result;
  return result;
}

@end
