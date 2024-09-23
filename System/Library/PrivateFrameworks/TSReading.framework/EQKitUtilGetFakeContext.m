@implementation EQKitUtilGetFakeContext

CGContextRef __EQKitUtilGetFakeContext_block_invoke()
{
  CGContextRef result;

  if (EQKitUtilGetDeviceColorSpace::onceToken != -1)
    dispatch_once(&EQKitUtilGetDeviceColorSpace::onceToken, &__block_literal_global_3);
  result = CGBitmapContextCreate(0, 1uLL, 1uLL, 8uLL, 4uLL, (CGColorSpaceRef)EQKitUtilGetDeviceColorSpace::sDeviceColor, 5u);
  EQKitUtilGetFakeContext::sFakeContext = (uint64_t)result;
  return result;
}

@end
