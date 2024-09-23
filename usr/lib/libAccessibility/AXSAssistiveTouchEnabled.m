@implementation AXSAssistiveTouchEnabled

uint64_t ___AXSAssistiveTouchEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.ast"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAssistiveTouchEnabledPreference, &v2);
  if (v2)
    _kAXSAssistiveTouchEnabledCache = result;
  return result;
}

@end
