@implementation TUDefaultLog

void __TUDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calls.telephonyutilities", "Default");
  v1 = (void *)TUDefaultLog_TUDefaultLog;
  TUDefaultLog_TUDefaultLog = (uint64_t)v0;

}

@end
