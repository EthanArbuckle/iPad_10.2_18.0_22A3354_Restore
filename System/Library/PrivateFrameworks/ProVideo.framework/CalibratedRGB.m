@implementation CalibratedRGB

CGColorSpaceRef __CalibratedRGB_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D988]);
  CalibratedRGB_result = (uint64_t)result;
  return result;
}

@end
