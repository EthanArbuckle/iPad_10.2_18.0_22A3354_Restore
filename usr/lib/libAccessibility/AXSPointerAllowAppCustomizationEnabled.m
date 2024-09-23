@implementation AXSPointerAllowAppCustomizationEnabled

uint64_t ___AXSPointerAllowAppCustomizationEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.pointer.allow.app.customization"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSPointerAllowAppCustomizationEnabledPreference, &v2);
  if (v2)
    _kAXSCachePointerAllowAppCustomizationEnabled = result;
  return result;
}

@end
