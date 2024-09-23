@implementation AXSSpeechSynthesisOptions

uint64_t ___AXSSpeechSynthesisOptions_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.speech.synth.options"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSSpeechSynthesisOptionsPreference, &v2);
  if (v2)
    _kAXSCacheSpeechSynthesisOptions = result;
  return result;
}

@end
