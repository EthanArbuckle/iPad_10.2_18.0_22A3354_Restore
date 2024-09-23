@implementation TSUGenericGrayColorSpace

CGColorSpaceRef __TSUGenericGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF288]);
  TSUGenericGrayColorSpace_sGenericGrayColorSpace = (uint64_t)result;
  return result;
}

@end
