@implementation GrayColorSpace

CGColorSpaceRef __GrayColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  if (dyld_program_sdk_at_least())
    result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D930]);
  else
    result = CGColorSpaceCreateDeviceGray();
  qword_1ECD7C4A8 = (uint64_t)result;
  return result;
}

@end
