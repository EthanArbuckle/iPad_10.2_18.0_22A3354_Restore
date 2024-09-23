@implementation TSDMetalDevicePreferringLowPower

void __TSDMetalDevicePreferringLowPower_block_invoke()
{
  id v0;
  void *v1;

  v0 = MTLCreateSystemDefaultDevice();
  v1 = (void *)TSDMetalDevicePreferringLowPower_s_metalDevice;
  TSDMetalDevicePreferringLowPower_s_metalDevice = (uint64_t)v0;

}

@end
