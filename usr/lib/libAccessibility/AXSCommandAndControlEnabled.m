@implementation AXSCommandAndControlEnabled

uint64_t ___AXSCommandAndControlEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.command.and.control"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSCommandAndControlEnabledPreference, &v2);
  if (v2)
    _kAXSCacheCommandAndControlEnabled = result;
  return result;
}

@end
