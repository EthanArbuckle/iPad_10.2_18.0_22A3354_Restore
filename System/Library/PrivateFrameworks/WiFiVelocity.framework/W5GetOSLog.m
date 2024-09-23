@implementation W5GetOSLog

os_log_t __W5GetOSLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.wifivelocity", ");
  _MergedGlobals = (uint64_t)result;
  return result;
}

@end
