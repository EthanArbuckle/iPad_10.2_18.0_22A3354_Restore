@implementation PQColorSpace

CGColorSpaceRef __PQColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D9C8]);
  qword_1ECD7A618 = (uint64_t)result;
  return result;
}

@end
