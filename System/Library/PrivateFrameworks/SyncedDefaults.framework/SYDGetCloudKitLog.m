@implementation SYDGetCloudKitLog

void __SYDGetCloudKitLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.kvs", "CloudKit");
  v1 = (void *)SYDGetCloudKitLog_log;
  SYDGetCloudKitLog_log = (uint64_t)v0;

}

@end
