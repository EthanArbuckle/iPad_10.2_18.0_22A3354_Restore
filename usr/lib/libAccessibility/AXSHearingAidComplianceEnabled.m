@implementation AXSHearingAidComplianceEnabled

uint64_t ___AXSHearingAidComplianceEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.hac.audio"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSHearingAidCompliancePreference, &v2);
  if (v2)
    _kAXSCacheHearingAidComplianceEnabled = result;
  return result;
}

@end
