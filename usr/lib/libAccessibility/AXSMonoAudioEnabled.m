@implementation AXSMonoAudioEnabled

uint64_t ___AXSMonoAudioEnabled_block_invoke()
{
  uint64_t result;
  char v1;

  v1 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSMonoAudioEnabledPreference, &v1);
  if (v1)
    _kAXSCacheMonoAudioEnabled = result;
  return result;
}

@end
