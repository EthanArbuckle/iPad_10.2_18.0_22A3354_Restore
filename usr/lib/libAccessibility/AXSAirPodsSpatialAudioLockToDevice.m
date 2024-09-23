@implementation AXSAirPodsSpatialAudioLockToDevice

uint64_t ___AXSAirPodsSpatialAudioLockToDevice_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.airpod.spatial.audio.lock.to.device"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference(CFSTR("AXSAirPodsSpatialAudioLockToDevice"), &v2);
  if (v2)
    _kAXSCacheAirPodsSpatialAudioLockToDeviceEnabled = result;
  return result;
}

@end
