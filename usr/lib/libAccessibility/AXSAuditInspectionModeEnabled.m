@implementation AXSAuditInspectionModeEnabled

uint64_t ___AXSAuditInspectionModeEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.audit.inspection.mode"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAuditInspectionModeEnabledPreference, &v2);
  if (v2)
    _kAXSCacheAuditInspectionModeModeEnabled = result;
  return result;
}

@end
