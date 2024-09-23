@implementation AXSBrailleInputDeviceConnected

uint64_t ___AXSBrailleInputDeviceConnected_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.braille.input.connection.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSBrailleInputDeviceConnectedPreference, &v2);
  if (v2)
    _kAXSCacheBrailleInputDeviceConnected = result;
  return result;
}

@end
