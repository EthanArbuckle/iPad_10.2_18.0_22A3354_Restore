@implementation PRSLogPosterContents

void __PRSLogPosterContents_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoardServices", "PosterContents");
  v1 = (void *)PRSLogPosterContents___logObj;
  PRSLogPosterContents___logObj = (uint64_t)v0;

}

@end
