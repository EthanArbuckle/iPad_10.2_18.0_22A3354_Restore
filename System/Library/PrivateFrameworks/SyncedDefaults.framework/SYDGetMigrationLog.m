@implementation SYDGetMigrationLog

void __SYDGetMigrationLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.kvs", "Migration");
  v1 = (void *)SYDGetMigrationLog_log;
  SYDGetMigrationLog_log = (uint64_t)v0;

}

@end
