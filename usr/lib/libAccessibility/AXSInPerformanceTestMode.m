@implementation AXSInPerformanceTestMode

uint64_t ___AXSInPerformanceTestMode_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.performance.testing.mode"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSInPerformanceTestModePreference, &v2);
  if (v2)
    _kAXSCacheInPerformanceTestMode = result;
  return result;
}

@end
