@implementation PXStoryMediaSizeForDisplayAssetClipInfo

double __PXStoryMediaSizeForDisplayAssetClipInfo_block_invoke()
{
  PXStoryRectFromCGRect();
  PXStoryRectDenormalize();
  PXStoryRectDecompose();
  return 0.0;
}

uint64_t __PXStoryMediaSizeForDisplayAssetClipInfo_block_invoke_2()
{
  PXRectNormalize();
  PXSizeGetAspectRatio();
  PXRectWithAspectRatioFillingRect();
  return PXRectDenormalize();
}

@end
