@implementation TSUSRGBColorSpace

CGColorSpaceRef __TSUSRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  TSUSRGBColorSpace_sSRGBColorSpace = (uint64_t)result;
  if (!result)
  {
    result = CGColorSpaceCreateDeviceRGB();
    TSUSRGBColorSpace_sSRGBColorSpace = (uint64_t)result;
  }
  return result;
}

@end
