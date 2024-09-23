@implementation AXSMotionCuesShouldShowBanner

uint64_t ___AXSMotionCuesShouldShowBanner_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  if (_kAXSCacheMotionCuesShouldShowBannerDidChangeNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)_kAXSCacheMotionCuesShouldShowBannerDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v2 = 1;
  result = _getBooleanPreference(CFSTR("AXSMotionCuesShouldShowBanner"), &v2);
  if (v2)
    _kAXSCacheMotionCuesShouldShowBanner = result;
  return result;
}

@end
