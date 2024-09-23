@implementation VGGetAssertLog

void __VGGetAssertLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.navigation.VirtualGarage", "Assert");
  v1 = (void *)VGGetAssertLog_log;
  VGGetAssertLog_log = (uint64_t)v0;

}

@end
