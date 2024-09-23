@implementation XBLogMemory

void __XBLogMemory_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SplashBoard", "Memory");
  v1 = (void *)XBLogMemory___logObj;
  XBLogMemory___logObj = (uint64_t)v0;

}

@end
