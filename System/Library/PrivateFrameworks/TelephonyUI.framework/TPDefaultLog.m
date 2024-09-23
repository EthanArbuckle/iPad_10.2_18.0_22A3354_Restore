@implementation TPDefaultLog

void __TPDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calls.telephonyui", "Default");
  v1 = (void *)TPDefaultLog_TPDefaultLog;
  TPDefaultLog_TPDefaultLog = (uint64_t)v0;

}

@end
