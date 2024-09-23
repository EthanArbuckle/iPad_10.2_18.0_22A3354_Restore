@implementation AXSZoomTouchReadyForObservers

uint64_t ___AXSZoomTouchReadyForObservers_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.zoom.readyForObservers"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSZoomTouchReadyForObserversPreference, &v2);
  if (v2)
    _kAXSCacheZoomTouchReadyForObservers = result;
  return result;
}

@end
