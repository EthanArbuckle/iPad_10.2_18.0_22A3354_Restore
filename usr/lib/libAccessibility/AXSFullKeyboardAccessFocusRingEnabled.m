@implementation AXSFullKeyboardAccessFocusRingEnabled

uint64_t ___AXSFullKeyboardAccessFocusRingEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.full.keyboard.access.focus.ring"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSFullKeyboardAccessFocusRingEnabledPreference, &v2);
  if (v2)
    _kAXSCacheFullKeyboardAccessFocusRingEnabled = result;
  return result;
}

@end
