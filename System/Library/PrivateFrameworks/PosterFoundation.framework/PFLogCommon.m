@implementation PFLogCommon

void __PFLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterFoundation", "Common");
  v1 = (void *)PFLogCommon___logObj;
  PFLogCommon___logObj = (uint64_t)v0;

}

@end
