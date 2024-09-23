@implementation AXSHoverTextBackgroundOpacity

void ___AXSHoverTextBackgroundOpacity_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  float FloatPreference;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.hovertext.backgroundopacity.change"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSHoverTextBackgroundOpacityPreference, 0, &v2);
  if (v2)
    _kAXSCachedHoverTextBackgroundOpacity = LODWORD(FloatPreference);
}

@end
