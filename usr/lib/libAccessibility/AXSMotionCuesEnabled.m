@implementation AXSMotionCuesEnabled

uint64_t ___AXSMotionCuesEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  if (_kAXSCacheMotionCuesDidChangeNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)_kAXSCacheMotionCuesDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSMotionCuesEnabledPreference, &v2);
  if (v2)
    _kAXSCacheMotionCuesEnabled = result;
  return result;
}

@end
