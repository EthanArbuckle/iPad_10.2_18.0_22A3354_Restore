@implementation TSUDeviceGrayColorSpace

CGColorSpaceRef __TSUDeviceGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceGray();
  TSUDeviceGrayColorSpace_sDeviceGrayColorSpace = (uint64_t)result;
  return result;
}

@end
