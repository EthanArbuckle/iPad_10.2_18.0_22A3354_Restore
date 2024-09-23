@implementation AXSPointerAutoHideEnabled

uint64_t ___AXSPointerAutoHideEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.pointer.auto.hide"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSPointerAutoHideEnabledPreference, &v2);
  if (v2)
    _kAXSCachePointerAutoHideEnabled = result;
  return result;
}

@end
