@implementation AXSZoomTouchSmoothScalingDisabled

uint64_t ___AXSZoomTouchSmoothScalingDisabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.zoom.smoothscaling"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSZoomTouchSmoothScalingPreference, &v2);
  if (v2)
    _kAXSCacheZoomTouchSmoothScalingDisabled = result;
  return result;
}

@end
