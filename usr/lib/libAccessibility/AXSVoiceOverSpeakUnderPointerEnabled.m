@implementation AXSVoiceOverSpeakUnderPointerEnabled

uint64_t ___AXSVoiceOverSpeakUnderPointerEnabled_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.voiceover.speak.under.pointer"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSVoiceOverSpeakUnderPointerPreference, &v2);
  if (v2)
    _kAXSCacheVoiceOverSpeakUnderPointer = result;
  return result;
}

@end
