@implementation AXSSoftwareTTYEnabled

uint64_t ___AXSSoftwareTTYEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.softwaretty"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSSoftwareTTYPreference, &v2);
  if (v2)
    _kAXSCacheSoftwareTTYEnabled = result;
  return result;
}

@end
