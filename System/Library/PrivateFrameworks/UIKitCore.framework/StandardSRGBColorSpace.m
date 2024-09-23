@implementation StandardSRGBColorSpace

CGColorSpaceRef __StandardSRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  qword_1ECD7A638 = (uint64_t)result;
  return result;
}

@end
