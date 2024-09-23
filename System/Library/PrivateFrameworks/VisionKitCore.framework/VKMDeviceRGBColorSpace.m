@implementation VKMDeviceRGBColorSpace

CGColorSpaceRef __VKMDeviceRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  VKMDeviceRGBColorSpace_sDeviceRGBColorSpace = (uint64_t)result;
  return result;
}

@end
