@implementation AXSSpeakThisHighlightVisible

uint64_t ___AXSSpeakThisHighlightVisible_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.speak.this.highlight.visible"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSSpeakThisHighlightVisiblePreference, &v2);
  if (v2)
    _kAXSCacheSpeakThisHighlightVisible = result;
  return result;
}

@end
