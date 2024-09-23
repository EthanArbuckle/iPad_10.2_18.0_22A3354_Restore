@implementation AXSBrailleScreenInputEnabled

uint64_t ___AXSBrailleScreenInputEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.bsi"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSBrailleScreenInputEnabledPreference, &v2);
  if (v2)
    _kAXSCacheBrailleScreenInputEnabled = result;
  return result;
}

@end
