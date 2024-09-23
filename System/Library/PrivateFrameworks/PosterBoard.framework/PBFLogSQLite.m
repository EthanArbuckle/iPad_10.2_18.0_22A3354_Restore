@implementation PBFLogSQLite

void __PBFLogSQLite_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "SQLite");
  v1 = (void *)PBFLogSQLite___logObj;
  PBFLogSQLite___logObj = (uint64_t)v0;

}

@end
