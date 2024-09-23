@implementation AXSPointerScaleWithZoomLevelEnabled

uint64_t ___AXSPointerScaleWithZoomLevelEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.pointer.scale.with.zoom.level"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSPointerScaleWithZoomLevelEnabledPreference, &v2);
  if (v2)
    _kAXSCachePointerScaleWithZoomLevelEnabled = result;
  return result;
}

@end
