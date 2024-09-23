@implementation TVRUIDeviceInfoLog

void ___TVRUIDeviceInfoLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "DeviceInfo");
  v1 = (void *)_TVRUIDeviceInfoLog_log;
  _TVRUIDeviceInfoLog_log = (uint64_t)v0;

}

@end
