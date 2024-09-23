@implementation _PFStoryRecipeDisplayAssetNormalizationDataV2

- (_PFStoryRecipeDisplayAssetNormalizationDataV2)initWithSliderNetPackedDataV2:(id *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PFStoryRecipeDisplayAssetNormalizationDataV2;
  return -[_PFStoryRecipeDisplayAssetNormalizationDataV1 initWithSliderNetPackedDataV1:](&v4, sel_initWithSliderNetPackedDataV1_, a3);
}

+ (id)limits
{
  if (limits_onceToken_151 != -1)
    dispatch_once(&limits_onceToken_151, &__block_literal_global_153);
  return (id)limits_limitsV1_152;
}

@end
