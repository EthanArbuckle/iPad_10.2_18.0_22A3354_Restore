@implementation LTOSLogDeviceState

void ___LTOSLogDeviceState_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Translation", "DeviceState");
  v1 = (void *)_LTOSLogDeviceState_log;
  _LTOSLogDeviceState_log = (uint64_t)v0;

}

@end
