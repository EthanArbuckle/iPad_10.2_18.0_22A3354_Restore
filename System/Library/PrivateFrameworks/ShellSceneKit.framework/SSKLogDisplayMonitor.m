@implementation SSKLogDisplayMonitor

void __SSKLogDisplayMonitor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.ShellSceneKit", "DisplayMonitor");
  v1 = (void *)SSKLogDisplayMonitor___logObj;
  SSKLogDisplayMonitor___logObj = (uint64_t)v0;

}

@end
