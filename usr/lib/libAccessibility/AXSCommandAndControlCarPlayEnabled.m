@implementation AXSCommandAndControlCarPlayEnabled

uint64_t ___AXSCommandAndControlCarPlayEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.command.and.control.carplay"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSCommandAndControlCarPlayEnabledPreference, &v2);
  if (v2)
    _kAXSCacheCommandAndControlCarPlayEnabled = result;
  return result;
}

@end
