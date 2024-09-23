@implementation AXSLiveHeadphoneLevelEnabled

uint64_t ___AXSLiveHeadphoneLevelEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  if (kAXSLiveHeadphoneLevelEnabledDidChangeNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)kAXSLiveHeadphoneLevelEnabledDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSLiveHeadphoneLevelEnabledPreference, &v2);
  if (v2)
    _kAXSCacheLiveHeadphoneLevelEnabled = result;
  return result;
}

@end
