@implementation PRSLogCommon

void __PRSLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoardServices", "Common");
  v1 = (void *)PRSLogCommon___logObj;
  PRSLogCommon___logObj = (uint64_t)v0;

}

@end
