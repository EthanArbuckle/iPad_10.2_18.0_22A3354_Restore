@implementation AXSMotionCuesActive

uint64_t ___AXSMotionCuesActive_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  if (_kAXSCacheMotionCuesActiveDidChangeNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)_kAXSCacheMotionCuesActiveDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v2 = 1;
  result = _getBooleanPreference(CFSTR("AXSMotionCuesActive"), &v2);
  if (v2)
    _kAXSCacheMotionCuesActive = result;
  return result;
}

@end
