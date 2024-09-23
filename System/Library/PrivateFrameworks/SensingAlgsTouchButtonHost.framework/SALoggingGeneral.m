@implementation SALoggingGeneral

os_log_t __SALoggingGeneral_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.SensingAlgs", "General");
  _MergedGlobals_0 = (uint64_t)result;
  return result;
}

@end
