@implementation PRLogModel

void __PRLogModel_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterKit", "Model");
  v1 = (void *)PRLogModel___logObj;
  PRLogModel___logObj = (uint64_t)v0;

}

@end
