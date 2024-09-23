@implementation AXSRosebudLoggingEnabled

uint64_t ___AXSRosebudLoggingEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.rosebud.logging.enabled"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSRosebudLoggingEnabledPreference, &v2);
  if (v2)
    _kAXSCacheRosebudLoggingEnabled = result;
  return result;
}

@end
