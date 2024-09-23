@implementation WPLoggingInit

void __WPLoggingInit_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bluetooth", "WirelessProximity");
  v1 = (void *)WiProxLog;
  WiProxLog = (uint64_t)v0;

}

@end
