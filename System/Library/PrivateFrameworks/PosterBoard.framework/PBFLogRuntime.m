@implementation PBFLogRuntime

void __PBFLogRuntime_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "Runtime");
  v1 = (void *)PBFLogRuntime___logObj;
  PBFLogRuntime___logObj = (uint64_t)v0;

}

@end
