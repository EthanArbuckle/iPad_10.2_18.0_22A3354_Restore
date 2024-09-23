@implementation AXSCarPlayEnhanceTextLegibilityEnabled

uint64_t ___AXSCarPlayEnhanceTextLegibilityEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.carplay.enhance.text.legibility"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference(CFSTR("CarPlayEnhancedTextLegibilityEnabled"), &v2);
  if (v2)
    _kAXSCacheCarPlayEnhanceTextLegibility = result;
  return result;
}

@end
