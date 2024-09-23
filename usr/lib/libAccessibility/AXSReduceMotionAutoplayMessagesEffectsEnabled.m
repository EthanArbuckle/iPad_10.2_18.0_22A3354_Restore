@implementation AXSReduceMotionAutoplayMessagesEffectsEnabled

uint64_t ___AXSReduceMotionAutoplayMessagesEffectsEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.reduce.motion.autoplay.messages.effects"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 0;
  result = _getBooleanPreference((const __CFString *)kAXSReduceMotionAutoplayMessagesEffectsPreference, &v2);
  if (!v2)
    result = !_AXSReduceMotionEnabled();
  _kAXSCacheReduceMotionAutoplayMessagesEffectsEnabled = result;
  return result;
}

@end
