@implementation RGBColorSpace

CGColorSpaceRef __RGBColorSpace_block_invoke()
{
  CGColorSpaceRef result;

  if (dyld_program_sdk_at_least())
  {
    if (qword_1ECD7C4D0 != -1)
      dispatch_once(&qword_1ECD7C4D0, &__block_literal_global_1676);
    result = (CGColorSpaceRef)qword_1ECD7C4C8;
  }
  else
  {
    result = CGColorSpaceCreateDeviceRGB();
  }
  qword_1ECD7C4B8 = (uint64_t)result;
  return result;
}

@end
