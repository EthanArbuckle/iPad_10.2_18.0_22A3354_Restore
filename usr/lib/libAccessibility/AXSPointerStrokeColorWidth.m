@implementation AXSPointerStrokeColorWidth

void ___AXSPointerStrokeColorWidth_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  float FloatPreference;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.pointer.stroke.color.width"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSPointerStrokeColorWidthPreference, 0, &v2);
  if (v2)
    _kAXSCachePointerStrokeColorWidth = LODWORD(FloatPreference);
}

@end
