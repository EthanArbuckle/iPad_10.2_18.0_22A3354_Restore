@implementation AXSVisualAlertEnabled

uint64_t ___AXSVisualAlertEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.visual.alert"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSVisualAlertEnabledPreference, &v2);
  if (v2)
    _kAXSCacheVisualAlertEnabled = result;
  return result;
}

@end
