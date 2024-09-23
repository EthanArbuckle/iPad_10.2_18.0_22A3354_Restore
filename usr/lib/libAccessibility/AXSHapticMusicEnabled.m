@implementation AXSHapticMusicEnabled

uint64_t ___AXSHapticMusicEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  if (_kAXSCacheHapticMusicDidChangeNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, (CFStringRef)_kAXSCacheHapticMusicDidChangeNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSHapticMusicEnabledPreference, &v2);
  if (v2)
    _kAXSCacheHapticMusicEnabled = result;
  return result;
}

@end
