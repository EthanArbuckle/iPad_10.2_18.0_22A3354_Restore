@implementation AXSVoiceOverTouchScreenCurtainEnabled

uint64_t ___AXSVoiceOverTouchScreenCurtainEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.vo.screen.curtain"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchScreenCurtainPreference, &v2);
  if (v2)
    _kAXSCacheVoiceOverScreenCurtain = result;
  return result;
}

@end
