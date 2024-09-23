@implementation AXSAutomationLocalizedStringLookupInfoEnabled

uint64_t ___AXSAutomationLocalizedStringLookupInfoEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.automation.localized.lookup"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAutomationLocalizedStringLookupInfoEnabledPreference, &v2);
  if (v2)
    _kAXSCacheAutomationLocalizedStringLookup = result;
  return result;
}

@end
