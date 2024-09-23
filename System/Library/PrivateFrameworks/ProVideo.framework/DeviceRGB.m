@implementation DeviceRGB

CGColorSpaceRef __DeviceRGB_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  DeviceRGB_result = (uint64_t)result;
  return result;
}

@end
