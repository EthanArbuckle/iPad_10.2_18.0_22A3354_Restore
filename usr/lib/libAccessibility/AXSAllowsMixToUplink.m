@implementation AXSAllowsMixToUplink

uint64_t ___AXSAllowsMixToUplink_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.mix.to.uplink.notification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference(CFSTR("AXSAllowsMixToUplinkPreference"), &v2);
  if (v2)
    _kAXSCacheAllowsMixToUplink = result;
  return result;
}

@end
