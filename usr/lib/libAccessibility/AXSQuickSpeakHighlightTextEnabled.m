@implementation AXSQuickSpeakHighlightTextEnabled

uint64_t ___AXSQuickSpeakHighlightTextEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.quick.speak.highlight.text"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSQuickSpeakHighlightTextEnabledPreference, &v2);
  if (v2)
    _kAXSCacheQuickSpeakHighlightTextEnabled = result;
  return result;
}

@end
