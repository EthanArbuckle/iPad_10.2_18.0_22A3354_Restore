@implementation AXSAppleTVRemoteForceLiveTVButtons

uint64_t ___AXSAppleTVRemoteForceLiveTVButtons_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.apple.tv.live.tv.buttons"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAppleTVForceLiveTVButtonsEnabledPreference, &v2);
  if (v2)
    _kAXSCacheAppleTVForceLiveTVButtonsEnabled = result;
  return result;
}

@end
