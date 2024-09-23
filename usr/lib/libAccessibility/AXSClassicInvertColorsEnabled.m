@implementation AXSClassicInvertColorsEnabled

uint64_t ___AXSClassicInvertColorsEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.classic.invert.colors"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSClassicInvertColorsPreference, &v2);
  if (v2)
    _kAXSCacheClassicInvertColorsEnabled = result;
  return result;
}

@end
