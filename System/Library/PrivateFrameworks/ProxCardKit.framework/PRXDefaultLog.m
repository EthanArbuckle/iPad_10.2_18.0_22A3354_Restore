@implementation PRXDefaultLog

void __PRXDefaultLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ProxCardKit", "Default");
  v1 = (void *)PRXDefaultLog_log;
  PRXDefaultLog_log = (uint64_t)v0;

}

@end
