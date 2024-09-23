@implementation AXSUserEnabledPasscodeForPurchases

uint64_t ___AXSUserEnabledPasscodeForPurchases_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.passcode.purchases"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSPasscodeForPurchasesPreference, &v2);
  if (v2)
    _kAXSCachePasscodeForPurchases = result;
  return result;
}

@end
