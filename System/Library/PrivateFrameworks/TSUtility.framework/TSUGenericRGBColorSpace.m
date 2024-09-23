@implementation TSUGenericRGBColorSpace

CGColorSpaceRef __TSUGenericRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF2A0]);
  TSUGenericRGBColorSpace_sGenericRGBColorSpace = (uint64_t)result;
  return result;
}

@end
