@implementation TSUDeviceRGBColorSpace

CGColorSpaceRef __TSUDeviceRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateDeviceRGB();
  TSUDeviceRGBColorSpace_sDeviceRGBColorSpace = (uint64_t)result;
  return result;
}

@end
