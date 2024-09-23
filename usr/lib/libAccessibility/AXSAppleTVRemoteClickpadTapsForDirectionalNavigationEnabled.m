@implementation AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled

uint64_t ___AXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.AppleTVRemoteClickpadTapsForDirectionalNavigationEnabled"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAppleTVRemoteClickpadTapsForDirectionalNavigationEnabledPreference, &v2);
  if (v2)
    _kAXSCacheAppleTVRemoteClickpadTapsForDirectionalNavigationEnabled = result;
  return result;
}

@end
