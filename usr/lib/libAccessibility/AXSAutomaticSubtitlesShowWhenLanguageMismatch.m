@implementation AXSAutomaticSubtitlesShowWhenLanguageMismatch

uint64_t ___AXSAutomaticSubtitlesShowWhenLanguageMismatch_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.AutomaticSubtitlesShowWhenLanguageMismatch"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAutomaticSubtitlesShowWhenLanguageMismatchPreference, &v2);
  if (v2)
    _kAXSCacheAutomaticSubtitlesShowWhenLanguageMismatch = result;
  return result;
}

@end
