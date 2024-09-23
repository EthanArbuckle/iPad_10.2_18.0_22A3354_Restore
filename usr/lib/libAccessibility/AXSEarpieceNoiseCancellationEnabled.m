@implementation AXSEarpieceNoiseCancellationEnabled

uint64_t ___AXSEarpieceNoiseCancellationEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.earpiece.noise"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSEarpieceNoiseCancellationPreference, &v2);
  if (v2)
    _kAXSCacheEarpieceNoiseCancellation = result;
  return result;
}

@end
