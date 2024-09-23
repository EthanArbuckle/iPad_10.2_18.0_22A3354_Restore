@implementation AXSHearingAidRingtoneStreamingEnabled

uint64_t ___AXSHearingAidRingtoneStreamingEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  if (kAXSHearingAidRingtoneStreamPreferenceChangedNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)kAXSHearingAidRingtoneStreamPreferenceChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSHearingAidRingtoneStreamingPreference, &v2);
  if (v2)
    _kAXSCacheHearingAidRingtonStreamingEnabled = result;
  return result;
}

@end
