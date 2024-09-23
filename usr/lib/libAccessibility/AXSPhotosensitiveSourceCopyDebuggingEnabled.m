@implementation AXSPhotosensitiveSourceCopyDebuggingEnabled

uint64_t ___AXSPhotosensitiveSourceCopyDebuggingEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.pse.source.copy.debugging"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference(CFSTR("PhotosensitiveSourceCopyDebugging"), &v2);
  if (v2)
    _kAXSCachePhotosensitiveSourceCopyDebuggingEnabled = result;
  return result;
}

@end
