@implementation TVRUIDeviceQueryLog

void ___TVRUIDeviceQueryLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "DeviceQuery");
  v1 = (void *)_TVRUIDeviceQueryLog_log;
  _TVRUIDeviceQueryLog_log = (uint64_t)v0;

}

@end
