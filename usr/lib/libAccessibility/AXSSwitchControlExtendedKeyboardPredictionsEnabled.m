@implementation AXSSwitchControlExtendedKeyboardPredictionsEnabled

uint64_t ___AXSSwitchControlExtendedKeyboardPredictionsEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.switch.control.useextendedkeyboardpredictions"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSSwitchControlUseExtendedKeyboardPredictionsEnabledPreference, &v2);
  if (v2)
    _kAXSCacheSwitchControlUseExtendedKeyboardPredictionsEnabled = result;
  return result;
}

@end
