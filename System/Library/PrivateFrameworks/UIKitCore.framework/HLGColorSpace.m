@implementation HLGColorSpace

CGColorSpaceRef __HLGColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9C0]);
  qword_1ECD7A628 = (uint64_t)result;
  return result;
}

@end
