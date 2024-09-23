@implementation XBLogSnapshot

void __XBLogSnapshot_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.SplashBoard", "Snapshot");
  v1 = (void *)XBLogSnapshot___logObj;
  XBLogSnapshot___logObj = (uint64_t)v0;

}

@end
