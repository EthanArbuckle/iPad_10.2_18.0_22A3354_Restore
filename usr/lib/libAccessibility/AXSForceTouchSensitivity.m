@implementation AXSForceTouchSensitivity

void ___AXSForceTouchSensitivity_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  float FloatPreference;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.forcetouch.sensitivity.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSForceTouchSensitivityPreference, 0, &v2);
  if (v2)
    _kAXSCachedForceTouchSensitivity = LODWORD(FloatPreference);
}

@end
