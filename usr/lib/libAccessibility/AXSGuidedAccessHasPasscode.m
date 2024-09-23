@implementation AXSGuidedAccessHasPasscode

uint64_t ___AXSGuidedAccessHasPasscode_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.gax.haspasscode"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSGuidedAccessHasPasscodePreference, &v2);
  if (v2)
    _kAXSCacheGuidedAccessHasPasscode = result;
  return result;
}

@end
