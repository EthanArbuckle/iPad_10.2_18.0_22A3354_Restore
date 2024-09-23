@implementation AXSFullKeyboardAccessEnabled

uint64_t ___AXSFullKeyboardAccessEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.full.keyboard.access"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSFullKeyboardAccessEnabledPreference, &v2);
  if (v2)
    _kAXSCacheFullKeyboardAccessEnabled = result;
  return result;
}

@end
