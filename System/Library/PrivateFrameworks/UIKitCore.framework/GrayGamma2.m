@implementation GrayGamma2

CGColorSpaceRef __GrayGamma2_2ColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  if (dyld_program_sdk_at_least())
    result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]);
  else
    result = CGColorSpaceCreateDeviceGray();
  qword_1ECD7C4D8 = (uint64_t)result;
  return result;
}

@end
