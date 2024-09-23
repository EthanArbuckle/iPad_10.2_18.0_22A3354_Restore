@implementation AXSAutomaticSubtitlesShowWhenMuted

uint64_t ___AXSAutomaticSubtitlesShowWhenMuted_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.AutomationSubtitlesShowWhenMuted"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAutomaticSubtitlesShowWhenMutedPreference, &v2);
  if (v2)
    _kAXSCacheAutomaticSubtitlesShowWhenMuted = result;
  return result;
}

@end
