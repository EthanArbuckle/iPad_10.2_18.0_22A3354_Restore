@implementation AXSZoomSpeakUnderFingerEnabled

uint64_t ___AXSZoomSpeakUnderFingerEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.zoom.speakunderfinger"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSZoomSpeakUnderFingerEnabledPreference, &v2);
  if (v2)
    _kAXSCacheZoomSpeakUnderFingerEnabled = result;
  return result;
}

@end
