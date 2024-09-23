@implementation AXSWebProcessAllowsSecondaryThreadAccess

uint64_t ___AXSWebProcessAllowsSecondaryThreadAccess_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.allows.notification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSWebProcessAllowsSecondaryThreadEnabledPreference, &v2);
  if (v2)
    _kAXSCacheWebProcessAllowsSecondaryThreadEnabled = result;
  return result;
}

@end
