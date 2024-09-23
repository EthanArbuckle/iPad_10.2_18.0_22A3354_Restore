@implementation AXSReportValidationErrors

uint64_t ___AXSReportValidationErrors_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.internal.reportvalidationerrors"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSReportValidationErrorsPreference, &v2);
  if (v2)
    _kAXSCacheReportValidationErrors = result;
  return result;
}

@end
