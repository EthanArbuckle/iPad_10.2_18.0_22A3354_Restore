@implementation SFAdjustedImageView

- (void)updateViewForAssetType:(int)a3 adjustmentsURL:(id)a4
{
  void *v5;
  id v6;

  SFAdjustmentFiltersForAssetTypeAndURL(a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SFAdjustedImageView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilters:", v6);

}

@end
