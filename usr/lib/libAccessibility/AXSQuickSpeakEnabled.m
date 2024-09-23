@implementation AXSQuickSpeakEnabled

uint64_t ___AXSQuickSpeakEnabled_block_invoke()
{
  uint64_t result;
  char v1;

  v1 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSQuickSpeakEnabledPreference, &v1);
  if (v1)
    _kAXSCacheQuickSpeakEnabled = result;
  return result;
}

@end
