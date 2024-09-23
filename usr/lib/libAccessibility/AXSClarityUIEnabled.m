@implementation AXSClarityUIEnabled

uint64_t ___AXSClarityUIEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.clarityui"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSClarityUIEnabledPreference, &v2);
  if (v2)
    _kAXSCacheClarityUIEnabled = result;
  return result;
}

@end
