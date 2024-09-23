@implementation PBFLogCommon

void __PBFLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoard", "Common");
  v1 = (void *)PBFLogCommon___logObj;
  PBFLogCommon___logObj = (uint64_t)v0;

}

@end
