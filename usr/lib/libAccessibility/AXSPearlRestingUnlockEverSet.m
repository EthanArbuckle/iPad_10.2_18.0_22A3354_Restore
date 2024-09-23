@implementation AXSPearlRestingUnlockEverSet

uint64_t ___AXSPearlRestingUnlockEverSet_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.resting.pearl.unlock"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSRestingPearlUnlockPreference, &v2);
  if (v2)
    _kAXSCacheRestingPearlUnlockEnabled = result;
  return result;
}

@end
