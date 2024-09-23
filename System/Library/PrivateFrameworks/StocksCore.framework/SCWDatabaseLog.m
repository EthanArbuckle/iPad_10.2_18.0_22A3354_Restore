@implementation SCWDatabaseLog

void __SCWDatabaseLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.stocks", "SCWDatabase");
  v1 = (void *)SCWDatabaseLog_databaseLog;
  SCWDatabaseLog_databaseLog = (uint64_t)v0;

}

@end
