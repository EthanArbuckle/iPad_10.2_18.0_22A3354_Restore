@implementation NSUltraFastLineBreakFinder

uint64_t ____NSUltraFastLineBreakFinder_block_invoke()
{
  uint64_t result;

  __NSUltraFastLineBreakFinder_strongRightBMP = CFUniCharGetBitmapPtrForPlane();
  __NSUltraFastLineBreakFinder_nonBaseBMP = CFUniCharGetBitmapPtrForPlane();
  __NSUltraFastLineBreakFinder_alphaNumericBMP = CFUniCharGetBitmapPtrForPlane();
  __NSUltraFastLineBreakFinder_symbolBMP = CFUniCharGetBitmapPtrForPlane();
  result = CFUniCharGetBitmapPtrForPlane();
  __NSUltraFastLineBreakFinder_punctuationBMP = result;
  return result;
}

@end
