@implementation AXSSiriSemanticContextEnabled

uint64_t ___AXSSiriSemanticContextEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.siri.semantic.context.enabled"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSSiriSemanticContextEnabledPreference, &v2);
  if (v2)
    _kAXSCacheSiriSemanticContextEnabled = result;
  return result;
}

@end
