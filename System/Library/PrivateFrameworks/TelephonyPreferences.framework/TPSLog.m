@implementation TPSLog

os_log_t __TPSLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.TelephonyPreferences", "default");
  TPSLog_sLog = (uint64_t)result;
  return result;
}

@end
