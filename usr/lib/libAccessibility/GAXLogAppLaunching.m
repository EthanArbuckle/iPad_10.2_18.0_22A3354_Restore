@implementation GAXLogAppLaunching

void __GAXLogAppLaunching_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Accessibility", "GAXAppLaunching");
  v1 = (void *)GAXLogAppLaunching___logObj;
  GAXLogAppLaunching___logObj = (uint64_t)v0;

}

@end
