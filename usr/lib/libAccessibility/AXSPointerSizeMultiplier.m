@implementation AXSPointerSizeMultiplier

void ___AXSPointerSizeMultiplier_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  float FloatPreference;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.pointer.size.multiplier"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSPointerSizeMultiplierPreference, 0, &v2);
  if (v2)
    _kAXSCachePointerSizeMultiplier = LODWORD(FloatPreference);
}

@end
