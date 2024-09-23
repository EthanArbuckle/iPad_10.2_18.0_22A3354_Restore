@implementation PBFLogReaper

void __PBFLogReaper_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "Reaper");
  v1 = (void *)PBFLogReaper___logObj;
  PBFLogReaper___logObj = (uint64_t)v0;

}

@end
