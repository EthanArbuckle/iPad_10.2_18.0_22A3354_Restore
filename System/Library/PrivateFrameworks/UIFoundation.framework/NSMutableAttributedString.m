@implementation NSMutableAttributedString

uint64_t __92__NSMutableAttributedString_NSMutableAttributedStringKitAdditions__fixFontAttributeInRange___block_invoke()
{
  uint64_t result;

  fixFontAttributeInRange__nonBaseSetBMP = CFUniCharGetBitmapPtrForPlane();
  fixFontAttributeInRange__combiningDataBMP = CFUniCharGetUnicodePropertyDataForPlane();
  fixFontAttributeInRange__controlFormatBMP = CFUniCharGetBitmapPtrForPlane();
  result = CFUniCharGetBitmapPtrForPlane();
  fixFontAttributeInRange__graphemeBMP = result;
  return result;
}

@end
