@implementation VKMDeviceGrayColorSpace

CGColorSpaceRef __VKMDeviceGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceGray();
  VKMDeviceGrayColorSpace_sDeviceGrayColorSpace = (uint64_t)result;
  return result;
}

@end
