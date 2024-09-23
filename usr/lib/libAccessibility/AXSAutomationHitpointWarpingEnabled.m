@implementation AXSAutomationHitpointWarpingEnabled

uint64_t ___AXSAutomationHitpointWarpingEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.automation.hitpoint_warping.enabled"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAutomationHitpointWarpingEnabledPreference, &v2);
  if (v2)
    _kAXSCacheAutomationHitpointWarpingEnabled = result;
  return result;
}

@end
