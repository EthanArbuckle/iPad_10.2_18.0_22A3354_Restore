@implementation SSBOSLogDeviceIdentificationToken

void __SSBOSLogDeviceIdentificationToken_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Safari.SafeBrowsing", "DeviceIdentificationToken");
  v1 = (void *)SSBOSLogDeviceIdentificationToken_log;
  SSBOSLogDeviceIdentificationToken_log = (uint64_t)v0;

}

@end
