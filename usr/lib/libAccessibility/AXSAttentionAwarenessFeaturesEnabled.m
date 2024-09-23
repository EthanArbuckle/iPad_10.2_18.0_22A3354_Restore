@implementation AXSAttentionAwarenessFeaturesEnabled

uint64_t ___AXSAttentionAwarenessFeaturesEnabled_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  _AXSAttentionAwarenessFeaturesEnabled_supported = result;
  return result;
}

uint64_t ___AXSAttentionAwarenessFeaturesEnabled_block_invoke_1273()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t result;
  char v2;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.attention.awareness"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSAttentionAwarenessFeaturesEnabledPreference, &v2);
  if (v2)
    _kAXSCacheAttentionAwarenessFeaturesEnabled = result;
  return result;
}

@end
