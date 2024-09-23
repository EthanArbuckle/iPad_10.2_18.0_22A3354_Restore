@implementation AXSLiveTranscriptionEnabled

uint64_t ___AXSLiveTranscriptionEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("_AXSCacheLiveTranscriptionNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSLiveTranscriptionEnabledPreference, &v2);
  if (v2)
    _kAXSCacheLiveTranscriptionEnabled = result;
  return result;
}

@end
