@implementation VGGetChargingNetworksLog

void __VGGetChargingNetworksLog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.navigation.VirtualGarage", "ChargingNetworks");
  v1 = (void *)VGGetChargingNetworksLog_log;
  VGGetChargingNetworksLog_log = (uint64_t)v0;

}

@end
