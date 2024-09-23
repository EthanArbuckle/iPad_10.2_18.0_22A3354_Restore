@implementation AXSHighContrastFocusIndicatorsEnabled

uint64_t ___AXSHighContrastFocusIndicatorsEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.use.prominent.focus.indicators"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSHighContrastFocusIndicatorsEnabledPreference, &v2);
  if (v2)
    _kAXSCacheHighContrastFocusIndicatorsEnabled = result;
  return result;
}

@end
