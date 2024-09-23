@implementation TPSCallForwardingLog

os_log_t __TPSCallForwardingLog_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.TelephonySettings", "CallForwarding");
  TPSCallForwardingLog_sLog = (uint64_t)result;
  return result;
}

@end
