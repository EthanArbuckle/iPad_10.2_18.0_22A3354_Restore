@implementation AXSFaceTimeCaptionsEnabled

uint64_t ___AXSFaceTimeCaptionsEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.FaceTimeCaptions"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSFaceTimeCaptionsPreference, &v2);
  if (v2)
    _kAXSCacheFaceTimeCaptionsEnabled = result;
  return result;
}

@end
