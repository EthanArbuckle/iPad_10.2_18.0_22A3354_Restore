@implementation SYDGetSyncSignpostsLog

void __SYDGetSyncSignpostsLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.kvs", "SyncSignposts");
  v1 = (void *)SYDGetSyncSignpostsLog_log;
  SYDGetSyncSignpostsLog_log = (uint64_t)v0;

}

@end
