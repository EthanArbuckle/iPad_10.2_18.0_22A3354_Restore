@implementation AXSAutomaticSubtitlesShowOnSkipBack

uint64_t ___AXSAutomaticSubtitlesShowOnSkipBack_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.AutomationSubtitlesShowOnSkipBack"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAutomaticSubtitlesShowOnSkipBackPreference, &v2);
  if (v2)
    _kAXSCacheAutomaticSubtitlesShowOnSkipBack = result;
  return result;
}

@end
