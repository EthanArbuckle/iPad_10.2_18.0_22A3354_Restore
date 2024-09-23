@implementation AXSAudioDonationSiriImprovementEnabled

uint64_t ___AXSAudioDonationSiriImprovementEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  if (_kAXSCacheAudioDonationSiriImprovementDidChangeNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)_kAXSCacheAudioDonationSiriImprovementDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAudioDonationSiriImprovementEnabledPreference, &v2);
  if (v2)
    _kAXSCacheAudioDonationSiriImprovementEnabled = result;
  return result;
}

@end
