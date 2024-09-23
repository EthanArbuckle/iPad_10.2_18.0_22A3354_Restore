@implementation AXSPointerAutoHideDuration

void ___AXSPointerAutoHideDuration_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  float FloatPreference;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.pointer.auto.hide.duration"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSPointerAutoHideDurationPreference, 0, &v2);
  if (v2)
    _kAXSCachePointerAutoHideDuration = LODWORD(FloatPreference);
}

@end
