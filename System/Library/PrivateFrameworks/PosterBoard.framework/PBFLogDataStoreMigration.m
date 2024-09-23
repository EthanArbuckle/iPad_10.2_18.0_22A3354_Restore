@implementation PBFLogDataStoreMigration

void __PBFLogDataStoreMigration_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "DataStoreMigration");
  v1 = (void *)PBFLogDataStoreMigration___logObj;
  PBFLogDataStoreMigration___logObj = (uint64_t)v0;

}

@end
