@implementation PSLogCommon

void __PSLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PointerUI", "Common");
  v1 = (void *)PSLogCommon___logObj;
  PSLogCommon___logObj = (uint64_t)v0;

}

@end
