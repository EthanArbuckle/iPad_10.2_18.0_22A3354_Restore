@implementation AXSUIFocusRingEnabled

uint64_t ___AXSUIFocusRingEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.ui.focus.ring"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSUIFocusRingEnabledPreference, &v2);
  if (v2)
    _kAXSCacheUIFocusRingEnabled = result;
  return result;
}

@end
