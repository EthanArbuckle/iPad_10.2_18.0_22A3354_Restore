@implementation PHSuggestion(PXDisplaySuggestionAdoption)

- (id)fetchKeyAssets
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", a1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
