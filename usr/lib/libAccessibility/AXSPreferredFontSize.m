@implementation AXSPreferredFontSize

void ___AXSPreferredFontSize_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  float FloatPreference;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.large.text.change"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSPreferredFontSizePreference, 0, &v2);
  if (v2)
    _kAXSCachedPreferredFontSize = LODWORD(FloatPreference);
}

@end
