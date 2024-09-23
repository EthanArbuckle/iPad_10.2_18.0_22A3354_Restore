@implementation AXSAppleTVScaledUIEnabled

uint64_t ___AXSAppleTVScaledUIEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.AppleTVScaledUIEnabled"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAppleTVScaledUIEnabledPreference, &v2);
  if (v2)
    _kAXSCacheAppleTVScaledUIEnabled = result;
  return result;
}

@end
