@implementation AXSIncreaseBrightnessFloorEnabled

uint64_t ___AXSIncreaseBrightnessFloorEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.increase.brightness.floor.enabled"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSIncreaseBrightnessFloorEnabledPreference, &v2);
  if (v2)
    _kAXSCacheIncreaseBrightnessFloorEnabled = result;
  return result;
}

@end
