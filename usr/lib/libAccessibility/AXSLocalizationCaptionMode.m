@implementation AXSLocalizationCaptionMode

uint64_t ___AXSLocalizationCaptionMode_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.loc.caption.mode.enabled"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSLocalizationCaptionModeEnabledPreference, &v2);
  if (v2)
    _kAXSCacheLocalizationCaptionModeEnabled = result;
  return result;
}

@end
