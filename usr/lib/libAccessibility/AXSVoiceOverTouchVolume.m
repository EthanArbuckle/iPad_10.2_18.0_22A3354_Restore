@implementation AXSVoiceOverTouchVolume

void ___AXSVoiceOverTouchVolume_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  float FloatPreference;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.vot.volume"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSVoiceOverTouchVolumePreference, 0, &v2);
  if (v2)
    _kAXSCachedVoiceOverVolume = LODWORD(FloatPreference);
}

@end
