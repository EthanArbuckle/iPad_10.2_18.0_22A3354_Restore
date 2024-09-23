@implementation PFLogPosterContents

void __PFLogPosterContents_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterFoundation", "PosterContents");
  v1 = (void *)PFLogPosterContents___logObj;
  PFLogPosterContents___logObj = (uint64_t)v0;

}

@end
