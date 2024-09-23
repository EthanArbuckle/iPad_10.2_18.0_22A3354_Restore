@implementation PPSClientInterfaceLog

void __PPSClientInterfaceLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PerfPowerServicesMetadata", "ClientInterface");
  v1 = (void *)PPSClientInterfaceLog___logObj;
  PPSClientInterfaceLog___logObj = (uint64_t)v0;

}

@end
