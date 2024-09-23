@implementation SYDGetConnectionLog

void __SYDGetConnectionLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.kvs", "Connection");
  v1 = (void *)SYDGetConnectionLog_log;
  SYDGetConnectionLog_log = (uint64_t)v0;

}

@end
