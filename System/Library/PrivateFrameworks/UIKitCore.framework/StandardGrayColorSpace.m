@implementation StandardGrayColorSpace

CGColorSpaceRef __StandardGrayColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]);
  qword_1ECD7A648 = (uint64_t)result;
  return result;
}

@end
