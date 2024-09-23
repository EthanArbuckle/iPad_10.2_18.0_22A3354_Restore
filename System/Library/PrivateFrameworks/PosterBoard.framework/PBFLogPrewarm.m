@implementation PBFLogPrewarm

void __PBFLogPrewarm_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "Prewarm");
  v1 = (void *)PBFLogPrewarm___logObj;
  PBFLogPrewarm___logObj = (uint64_t)v0;

}

@end
