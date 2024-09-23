@implementation PRLogCommon

void __PRLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterKit", "Common");
  v1 = (void *)PRLogCommon___logObj;
  PRLogCommon___logObj = (uint64_t)v0;

}

@end
