@implementation ExtendedSRGBColorSpace

CGColorSpaceRef __ExtendedSRGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
  qword_1ECD7C4C8 = (uint64_t)result;
  return result;
}

CGColorSpaceRef __ExtendedSRGBColorSpace_block_invoke_0()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
  _MergedGlobals_3_14 = (uint64_t)result;
  return result;
}

@end
