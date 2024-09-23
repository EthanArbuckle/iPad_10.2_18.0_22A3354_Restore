@implementation SBIconRecentlyUpdatedLabelAccessoryView

+ (id)_dotColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

+ (CAColorMatrix)_vibrantColorMatrixInput
{
  *retstr = *(CAColorMatrix *)byte_1D0193F30;
  return result;
}

+ (id)_cachedDotImage
{
  return (id)cachedRecentlyUpdatedDotImage;
}

+ (void)_setCachedDotImage:(id)a3
{
  objc_storeStrong((id *)&cachedRecentlyUpdatedDotImage, a3);
}

@end
