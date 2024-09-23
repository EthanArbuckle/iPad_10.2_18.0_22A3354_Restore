@implementation AXSAssistiveTouchExtendedKeyboardPredictionsEnabled

uint64_t ___AXSAssistiveTouchExtendedKeyboardPredictionsEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.assistivetouch.useextendedkeyboardpredictions"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAssistiveTouchUseExtendedKeyboardPredictionsEnabledPreference, &v2);
  if (v2)
    _kAXSCacheAssistiveTouchUseExtendedKeyboardPredictionsEnabled = result;
  return result;
}

@end
