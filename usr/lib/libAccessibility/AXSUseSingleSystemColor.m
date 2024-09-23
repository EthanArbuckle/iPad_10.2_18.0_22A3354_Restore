@implementation AXSUseSingleSystemColor

uint64_t ___AXSUseSingleSystemColor_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.use.single.system.color.enabled"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSUseSingleSystemColorPreference, &v2);
  if (v2)
    _kAXSCacheUseSingleSystemColor = result;
  return result;
}

@end
