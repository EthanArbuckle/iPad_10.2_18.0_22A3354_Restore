@implementation AXSLogValidationErrors

uint64_t ___AXSLogValidationErrors_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.internal.logvalidationerrors"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSLogValidationErrorsPreference, &v2);
  if (v2)
    _kAXSCacheLogValidationErrors = result;
  return result;
}

@end
