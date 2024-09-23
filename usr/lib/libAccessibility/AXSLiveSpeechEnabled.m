@implementation AXSLiveSpeechEnabled

uint64_t ___AXSLiveSpeechEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.livespeech"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSLiveSpeechEnabledPreference, &v2);
  if (v2)
    _kAXSCacheLiveSpeechEnabled = result;
  return result;
}

@end
