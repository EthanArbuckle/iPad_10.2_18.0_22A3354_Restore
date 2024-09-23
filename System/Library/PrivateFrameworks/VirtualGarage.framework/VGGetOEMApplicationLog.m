@implementation VGGetOEMApplicationLog

void __VGGetOEMApplicationLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.navigation.VirtualGarage", "OEMApplication");
  v1 = (void *)VGGetOEMApplicationLog_log;
  VGGetOEMApplicationLog_log = (uint64_t)v0;

}

@end
