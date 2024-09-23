@implementation AXSPearlAuthenticationHapticsEnabled

uint64_t ___AXSPearlAuthenticationHapticsEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.perl.auth.haptics"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSPearlAuthenticationHapticsPreference, &v2);
  if (v2)
    _kAXSCachePearlAuthenticationHapticsEnabled = result;
  return result;
}

@end
