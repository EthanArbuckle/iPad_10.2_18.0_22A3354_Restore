@implementation SBIconBetaLabelAccessoryView

+ (id)_dotColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (CAColorMatrix)_vibrantColorMatrixInput
{
  *(_OWORD *)&retstr->var0 = xmmword_1D0193F80;
  *(_OWORD *)&retstr->var4 = xmmword_1D0193F90;
  *(_OWORD *)&retstr->var8 = xmmword_1D0193FA0;
  *(_OWORD *)&retstr->var12 = xmmword_1D0193FB0;
  *(_OWORD *)&retstr->var16 = *(_OWORD *)&byte_1D0193F30[64];
  return result;
}

+ (id)_cachedDotImage
{
  return (id)cachedBetaDotImage;
}

+ (void)_setCachedDotImage:(id)a3
{
  objc_storeStrong((id *)&cachedBetaDotImage, a3);
}

@end
