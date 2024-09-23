@implementation PBFLogMigration

void __PBFLogMigration_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "Migration");
  v1 = (void *)PBFLogMigration___logObj;
  PBFLogMigration___logObj = (uint64_t)v0;

}

@end
