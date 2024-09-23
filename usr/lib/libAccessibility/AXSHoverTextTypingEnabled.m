@implementation AXSHoverTextTypingEnabled

uint64_t ___AXSHoverTextTypingEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.hovertext.typing"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSHoverTextTypingEnabledPreference, &v2);
  if (v2)
    _kAXSCacheHoverTextTypingEnabled = result;
  return result;
}

@end
