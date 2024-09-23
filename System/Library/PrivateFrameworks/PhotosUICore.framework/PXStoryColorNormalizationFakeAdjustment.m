@implementation PXStoryColorNormalizationFakeAdjustment

- (PXStoryColorNormalizationFakeAdjustment)init
{
  void *v3;
  PXStoryColorNormalizationFakeAdjustment *v4;
  objc_super v6;

  +[PXStoryColorNormalizationFakeAdjustment fakeNormalization](PXStoryColorNormalizationFakeAdjustment, "fakeNormalization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)PXStoryColorNormalizationFakeAdjustment;
  v4 = -[PXStoryColorNormalizationAdjustment initWithNormalization:](&v6, sel_initWithNormalization_, v3);

  return v4;
}

- (id)adjustmentSummary
{
  return CFSTR("simulated");
}

+ (PFStoryRecipeDisplayAssetNormalization)fakeNormalization
{
  if (fakeNormalization_s_generateFakeNormalizationOnce != -1)
    dispatch_once(&fakeNormalization_s_generateFakeNormalizationOnce, &__block_literal_global_49433);
  return (PFStoryRecipeDisplayAssetNormalization *)(id)fakeNormalization_s_fakeNormalization;
}

void __60__PXStoryColorNormalizationFakeAdjustment_fakeNormalization__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  PFStoryRecipeDisplayAssetNormalizationDataFromMediaAnalysisDictionaryAndRevision();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D752C0]), "initWithAnalysisData:", v2);
  v1 = (void *)fakeNormalization_s_fakeNormalization;
  fakeNormalization_s_fakeNormalization = v0;

}

@end
