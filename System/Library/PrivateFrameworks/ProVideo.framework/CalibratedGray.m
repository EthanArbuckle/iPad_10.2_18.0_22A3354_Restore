@implementation CalibratedGray

CGColorSpaceRef __CalibratedGray_block_invoke()
{
  CGColorSpaceRef result;

  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D970]);
  CalibratedGray_result = (uint64_t)result;
  return result;
}

@end
