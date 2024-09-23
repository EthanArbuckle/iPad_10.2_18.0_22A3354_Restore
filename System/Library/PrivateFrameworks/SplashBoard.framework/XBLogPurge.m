@implementation XBLogPurge

void __XBLogPurge_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SplashBoard", "Purge");
  v1 = (void *)XBLogPurge___logObj;
  XBLogPurge___logObj = (uint64_t)v0;

}

@end
