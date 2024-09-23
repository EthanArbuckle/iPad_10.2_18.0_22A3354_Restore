@implementation AXSSpeechSettingsDisabledByManagedConfiguration

uint64_t ___AXSSpeechSettingsDisabledByManagedConfiguration_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.speech.settings.disabled.by.mc"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSSpeechSettingsDisabledByManagedConfigurationPreference, &v2);
  if (v2)
    _kAXSCacheSpeechSettingsDisabledByManagedConfiguration = result;
  return result;
}

@end
