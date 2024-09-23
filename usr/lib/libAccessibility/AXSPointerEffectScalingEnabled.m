@implementation AXSPointerEffectScalingEnabled

uint64_t ___AXSPointerEffectScalingEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.pointer.effect.scaling"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSPointerEffectScalingEnabledPreference, &v2);
  if (v2)
    _kAXSCachePointerEffectScalingEnabled = result;
  return result;
}

@end
