@implementation SYDGetMiscLog

void __SYDGetMiscLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.kvs", "Misc");
  v1 = (void *)SYDGetMiscLog_log;
  SYDGetMiscLog_log = (uint64_t)v0;

}

@end
