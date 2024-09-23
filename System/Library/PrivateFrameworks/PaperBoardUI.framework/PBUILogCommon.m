@implementation PBUILogCommon

void __PBUILogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PaperBoardUI", "Common");
  v1 = (void *)PBUILogCommon___logObj;
  PBUILogCommon___logObj = (uint64_t)v0;

}

@end
