@implementation TSUGenericCMYKColorSpace

CGColorSpaceRef __TSUGenericCMYKColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF280]);
  TSUGenericCMYKColorSpace_sGenericCMYKColorSpace = (uint64_t)result;
  return result;
}

@end
