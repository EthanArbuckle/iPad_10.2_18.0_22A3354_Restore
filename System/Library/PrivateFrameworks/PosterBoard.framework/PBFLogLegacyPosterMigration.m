@implementation PBFLogLegacyPosterMigration

void __PBFLogLegacyPosterMigration_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "LegacyPosterMigration");
  v1 = (void *)PBFLogLegacyPosterMigration___logObj;
  PBFLogLegacyPosterMigration___logObj = (uint64_t)v0;

}

@end
