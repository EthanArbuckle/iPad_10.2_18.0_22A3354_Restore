@implementation AXSGuidedAccessEnabledByManagedConfiguration

uint64_t ___AXSGuidedAccessEnabledByManagedConfiguration_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.guided.access.via.mdm"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSGuidedAccessEnabledByManagedConfigurationPreference, &v2);
  if (v2)
    _kAXSCacheGuidedAccessEnabledByManagedConfiguration = result;
  return result;
}

@end
