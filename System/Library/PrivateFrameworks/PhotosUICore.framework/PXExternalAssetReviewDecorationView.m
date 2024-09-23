@implementation PXExternalAssetReviewDecorationView

- (void)_updateAssetInformation
{
  void *v3;
  uint64_t v4;

  -[PXContentSyndicationReviewDecorationView userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = PXExternalAssetReviewDecorationEligibilityForAssetReference(v3);

  -[PXContentSyndicationReviewDecorationView _setEligibility:](self, "_setEligibility:", v4);
}

@end
