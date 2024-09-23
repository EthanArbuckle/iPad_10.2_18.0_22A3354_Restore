@implementation AXSGrayscaleEnabled

uint64_t ___AXSGrayscaleEnabled_block_invoke()
{
  uint64_t result;
  char v1;

  v1 = 1;
  result = _getBooleanPreference((const __CFString *)kAXSGrayscaleEnabledPreference, &v1);
  if (v1)
    _kAXSCacheGrayscaleEnabled = result;
  return result;
}

@end
