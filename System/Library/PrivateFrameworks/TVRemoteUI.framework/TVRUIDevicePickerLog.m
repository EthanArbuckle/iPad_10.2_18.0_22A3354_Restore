@implementation TVRUIDevicePickerLog

void ___TVRUIDevicePickerLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.TVRemoteUI", "DevicePicker");
  v1 = (void *)_TVRUIDevicePickerLog_log;
  _TVRUIDevicePickerLog_log = (uint64_t)v0;

}

@end
