@implementation SYDGetAccountsLog

void __SYDGetAccountsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.kvs", "Accounts");
  v1 = (void *)SYDGetAccountsLog_log;
  SYDGetAccountsLog_log = (uint64_t)v0;

}

@end
