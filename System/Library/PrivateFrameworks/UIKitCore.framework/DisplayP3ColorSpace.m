@implementation DisplayP3ColorSpace

CGColorSpaceRef __DisplayP3ColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D908]);
  qword_1ECD7C4E8 = (uint64_t)result;
  return result;
}

@end
