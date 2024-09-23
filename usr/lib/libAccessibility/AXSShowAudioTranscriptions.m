@implementation AXSShowAudioTranscriptions

uint64_t ___AXSShowAudioTranscriptions_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.show.audio.transcriptions"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSShowAudioTranscriptionsEnabled, &v2);
  if (v2)
    _kAXSCacheShowAudioTranscriptionsEnabled = result;
  return result;
}

@end
