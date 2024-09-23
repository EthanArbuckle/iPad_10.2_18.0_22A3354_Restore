@implementation PRSLogArchiver

void __PRSLogArchiver_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoardServices", "Archiver");
  v1 = (void *)PRSLogArchiver___logObj;
  PRSLogArchiver___logObj = (uint64_t)v0;

}

@end
