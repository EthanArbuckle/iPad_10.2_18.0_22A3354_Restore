@implementation AXSHoverTextFontSize

void ___AXSHoverTextFontSize_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  float FloatPreference;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.hovertext.fontsize.change"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSHoverTextFontSizePreference, 0, &v2);
  if (v2)
    _kAXSCachedHoverTextFontSize = LODWORD(FloatPreference);
}

@end
