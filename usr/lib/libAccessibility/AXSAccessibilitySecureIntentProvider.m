@implementation AXSAccessibilitySecureIntentProvider

uint64_t ___AXSAccessibilitySecureIntentProvider_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.secure.intent.provider"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSSecureIntentProviderPreference, &v2);
  if (v2)
    _kAXSCacheSecureIntentProviderPreference = result;
  return result;
}

@end
