@implementation PXMonthsViewKeyAssetHackService

- (id)title
{
  return CFSTR("Set as Trip Key Asset");
}

- (BOOL)canPerformAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  if (!objc_msgSend((id)objc_opt_class(), "keyAssetHackServiceIsEnabled"))
    return 0;
  -[PXKeyAssetHackService asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v4, 6, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = objc_msgSend(v8, "type") == 5;
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldSetKeyAssetForHighlight:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((MEMORY[0x1A85CC160](objc_msgSend(v4, "type")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PXMonthsViewKeyAssetHackService;
    v5 = -[PXDaysViewKeyAssetHackService shouldSetKeyAssetForHighlight:](&v7, sel_shouldSetKeyAssetForHighlight_, v4);
  }

  return v5;
}

@end
