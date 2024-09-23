@implementation AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription

uint64_t ___AXSVoiceOverTouchUserHasReadNoHomeButtonGestureDescription_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.vo.user.has.read.no.home.button.gesture"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchUserHasReadNoHomeButtonGesturePreference, &v2);
  if (v2)
    _kAXSCacheVOTUserHasReadNoHomeButtonGesture = result;
  return result;
}

@end
