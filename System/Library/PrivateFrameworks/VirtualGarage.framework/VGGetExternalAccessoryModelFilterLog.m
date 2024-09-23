@implementation VGGetExternalAccessoryModelFilterLog

void __VGGetExternalAccessoryModelFilterLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.navigation.VirtualGarage", "ExternalAccessoryModelFilter");
  v1 = (void *)VGGetExternalAccessoryModelFilterLog_log;
  VGGetExternalAccessoryModelFilterLog_log = (uint64_t)v0;

}

@end
