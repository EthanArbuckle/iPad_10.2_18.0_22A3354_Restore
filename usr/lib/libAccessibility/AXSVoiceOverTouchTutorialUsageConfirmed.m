@implementation AXSVoiceOverTouchTutorialUsageConfirmed

uint64_t ___AXSVoiceOverTouchTutorialUsageConfirmed_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.vo.usage.tutorial.confirm"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSVoiceOverTouchTutorialUsageConfirmedPreference, &v2);
  if (v2)
    _kAXSCacheVoiceOverTutorialUsageConfirmation = result;
  return result;
}

@end
