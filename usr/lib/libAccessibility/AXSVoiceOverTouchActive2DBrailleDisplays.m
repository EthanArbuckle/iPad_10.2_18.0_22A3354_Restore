@implementation AXSVoiceOverTouchActive2DBrailleDisplays

CFTypeID ___AXSVoiceOverTouchActive2DBrailleDisplays_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.HasActive2DBrailleDisplay"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  return _AXSVoiceOverTouchUpdateActive2DBrailleDisplays();
}

@end
