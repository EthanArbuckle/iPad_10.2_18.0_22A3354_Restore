@implementation PRUISLogCommon

void __PRUISLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PosterBoardUIServices", "Common");
  v1 = (void *)PRUISLogCommon___logObj;
  PRUISLogCommon___logObj = (uint64_t)v0;

}

@end
