@implementation AXSVoiceOverTouchMediaDuckingVolume

void ___AXSVoiceOverTouchMediaDuckingVolume_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  float FloatPreference;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.vot.media.ducking.volume"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSVoiceOverTouchMediaDuckingVolumePreference, 0, &v2);
  if (v2)
    _kAXSCachedVoiceOverMediaDuckingVolume = LODWORD(FloatPreference);
}

@end
