@implementation SYDGetCoreDataLog

void __SYDGetCoreDataLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.kvs", "CoreData");
  v1 = (void *)SYDGetCoreDataLog_log;
  SYDGetCoreDataLog_log = (uint64_t)v0;

}

@end
