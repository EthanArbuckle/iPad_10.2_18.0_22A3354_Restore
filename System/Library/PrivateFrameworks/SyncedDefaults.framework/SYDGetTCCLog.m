@implementation SYDGetTCCLog

void __SYDGetTCCLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.kvs", "TCC");
  v1 = (void *)SYDGetTCCLog_log;
  SYDGetTCCLog_log = (uint64_t)v0;

}

@end
