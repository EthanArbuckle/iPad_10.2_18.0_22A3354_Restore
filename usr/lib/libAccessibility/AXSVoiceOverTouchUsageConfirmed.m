@implementation AXSVoiceOverTouchUsageConfirmed

uint64_t ___AXSVoiceOverTouchUsageConfirmed_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.vo.usage.confirm"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchUsageConfirmedPreference, &v2);
  if (v2)
    _kAXSCacheVoiceOverUsageConfirmation = result;
  return result;
}

@end
