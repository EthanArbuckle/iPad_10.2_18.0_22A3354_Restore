@implementation AXSHomeButtonRestingUnlock

uint64_t ___AXSHomeButtonRestingUnlock_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.resting.home.button.unlock"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSRestingHomeButtonUnlockPreference, &v2);
  if (v2)
    _kAXSCacheRestingHomeButtonUnlockEnabled = result;
  return result;
}

@end
