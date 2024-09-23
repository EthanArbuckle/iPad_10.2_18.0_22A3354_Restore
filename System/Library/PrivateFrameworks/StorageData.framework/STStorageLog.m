@implementation STStorageLog

void __STStorageLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.storage", "log");
  v1 = (void *)STStorageLog__gSharedLog;
  STStorageLog__gSharedLog = (uint64_t)v0;

}

@end
