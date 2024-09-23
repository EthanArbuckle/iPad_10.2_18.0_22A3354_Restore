@implementation AXSVoiceOverSpeakUnderPointerDelay

void ___AXSVoiceOverSpeakUnderPointerDelay_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  float FloatPreference;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.voiceover.speak.under.pointer"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  FloatPreference = _getFloatPreference((const __CFString *)kAXSVoiceOverSpeakUnderPointerDelayPreference, 0, &v2);
  if (v2)
    _kAXSCacheVoiceOverSpeakUnderPointerDelay = LODWORD(FloatPreference);
}

@end
