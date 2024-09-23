@implementation SBINLogCommon

void __SBINLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SpringBoardIntents", "Common");
  v1 = (void *)SBINLogCommon___logObj;
  SBINLogCommon___logObj = (uint64_t)v0;

}

@end
