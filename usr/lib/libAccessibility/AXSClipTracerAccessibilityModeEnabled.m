@implementation AXSClipTracerAccessibilityModeEnabled

uint64_t ___AXSClipTracerAccessibilityModeEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.clip.tracer.enabled"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSClipTracerAccessibilityModeEnabledPreference, &v2);
  if (v2)
    _kAXSCacheClipTracerAccessibilityModeEnabled = result;
  return result;
}

@end
