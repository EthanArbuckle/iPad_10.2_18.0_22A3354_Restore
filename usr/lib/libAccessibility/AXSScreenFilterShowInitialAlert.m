@implementation AXSScreenFilterShowInitialAlert

uint64_t ___AXSScreenFilterShowInitialAlert_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.displayfilter.showinitialalert"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSDisplayFilterShowInitialAlertPreference, &v2);
  if (v2)
    _kAXSCacheDisplayFilterShowInitialAlert = result;
  return result;
}

@end
