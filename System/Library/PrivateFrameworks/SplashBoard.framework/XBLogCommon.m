@implementation XBLogCommon

void __XBLogCommon_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SplashBoard", "Common");
  v1 = (void *)XBLogCommon___logObj;
  XBLogCommon___logObj = (uint64_t)v0;

}

@end
