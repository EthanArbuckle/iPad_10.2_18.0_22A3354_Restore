@implementation AXSWalkieTalkieTapToTalkEnabled

uint64_t ___AXSWalkieTalkieTapToTalkEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.AXSCacheWalkieTalkieTapToTalkNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSWalkieTalkieTapToTalkPreference, &v2);
  if (v2)
    _kAXSCacheWalkieTalkieTapToTalk = result;
  return result;
}

@end
