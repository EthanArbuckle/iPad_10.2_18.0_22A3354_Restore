@implementation AXSReduceMotionAutoplayAnimatedImagesEnabled

uint64_t ___AXSReduceMotionAutoplayAnimatedImagesEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.animated.images"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSReduceMotionAutoplayAnimatedImagesPreference, &v2);
  if (v2)
    _kAXSCacheReduceMotionAutoplayAnimatedImagesEnabled = result;
  return result;
}

@end
