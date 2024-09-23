@implementation AXSAppSwitcherAutoSelectEnabled

uint64_t ___AXSAppSwitcherAutoSelectEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.AXSCacheAppSwitcherAutoSelectNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAppSwitcherAutoSelectPreference, &v2);
  if (v2)
    _kAXSCacheAppSwitcherAutoSelect = result;
  return result;
}

@end
