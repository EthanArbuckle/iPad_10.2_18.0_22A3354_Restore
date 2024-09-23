@implementation PRLogUpdatingService

void __PRLogUpdatingService_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterKit", "UpdatingService");
  v1 = (void *)PRLogUpdatingService___logObj;
  PRLogUpdatingService___logObj = (uint64_t)v0;

}

@end
