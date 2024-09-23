@implementation PLLogSQLiteConnection

void __PLLogSQLiteConnection_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.powerlog", "sqliteconnection");
  v1 = (void *)PLLogSQLiteConnection___logObj;
  PLLogSQLiteConnection___logObj = (uint64_t)v0;

}

@end
