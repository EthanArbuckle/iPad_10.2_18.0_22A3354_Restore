@implementation GenericGrayGamma22ColorSpace

CGColorSpaceRef __GenericGrayGamma22ColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]);
  GenericGrayGamma22ColorSpace_result = (uint64_t)result;
  return result;
}

@end
