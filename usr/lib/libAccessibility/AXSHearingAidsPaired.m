@implementation AXSHearingAidsPaired

uint64_t ___AXSHearingAidsPaired_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.hearing.aid.paired"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSHearingAidPairedPreference, &v2);
  if (v2)
    _kAXSCacheHearingAidPaired = result;
  return result;
}

@end
