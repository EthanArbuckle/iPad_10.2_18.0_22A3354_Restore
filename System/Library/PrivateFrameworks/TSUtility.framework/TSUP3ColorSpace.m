@implementation TSUP3ColorSpace

CGColorSpaceRef __TSUP3ColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
  TSUP3ColorSpace_sP3ColorSpace = (uint64_t)result;
  if (!result)
  {
    result = CGColorSpaceCreateDeviceRGB();
    TSUP3ColorSpace_sP3ColorSpace = (uint64_t)result;
  }
  return result;
}

@end
