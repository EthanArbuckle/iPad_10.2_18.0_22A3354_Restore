@implementation AXSLowercaseKeyboardDisplayEnabled

uint64_t ___AXSLowercaseKeyboardDisplayEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.lower.case.keyboard.enabled"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSLowerCaseKeyboardEnabledPreference, &v2);
  if (v2)
    _kAXSCacheLowercaseKeyboardEnabled = result;
  return result;
}

@end
