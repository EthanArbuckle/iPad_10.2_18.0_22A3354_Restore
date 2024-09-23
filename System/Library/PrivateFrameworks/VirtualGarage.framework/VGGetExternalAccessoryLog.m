@implementation VGGetExternalAccessoryLog

void __VGGetExternalAccessoryLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.navigation.VirtualGarage", "ExternalAccessory");
  v1 = (void *)VGGetExternalAccessoryLog_log;
  VGGetExternalAccessoryLog_log = (uint64_t)v0;

}

@end
