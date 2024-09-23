@implementation WBSShouldApplyBackingForLightBackdropToImage

BOOL __WBSShouldApplyBackingForLightBackdropToImage_block_invoke(double a1)
{
  return a1 < 220.0;
}

uint64_t __WBSShouldApplyBackingForLightBackdropToImage_block_invoke_2(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  _BOOL4 v7;

  v7 = a2 > 0xF0 && a3 > 0xF0 && a4 > 0xF0;
  return a5 < 0x19 || v7;
}

@end
