@implementation AXSAppleTVRemoteUsesSimpleGestures

uint64_t ___AXSAppleTVRemoteUsesSimpleGestures_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.apple.tv.simple.gestures"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAppleTVSimpleGesturesEnabledPreference, &v2);
  if (v2)
    _kAXSCacheAppleTVSimpleGesturesEnabled = result;
  return result;
}

@end
