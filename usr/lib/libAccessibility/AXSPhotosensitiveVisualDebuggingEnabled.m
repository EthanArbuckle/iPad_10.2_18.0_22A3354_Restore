@implementation AXSPhotosensitiveVisualDebuggingEnabled

uint64_t ___AXSPhotosensitiveVisualDebuggingEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.pse.visual.debugging"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference(CFSTR("PhotosensitiveVisualDebugging"), &v2);
  if (v2)
    _kAXSCachePhotosensitiveVisualDebuggingEnabled = result;
  return result;
}

@end
