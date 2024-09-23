@implementation PHMemory(PXSelectionAssetContainer)

- (uint64_t)px_isEmpty
{
  return 0;
}

- (uint64_t)px_canPerformFavoriteAction
{
  return 1;
}

- (id)px_fetchContainedAssets
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  +[PXMemoriesFeedSettings sharedInstance](PXMemoriesFeedSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sharingBehavior");

  if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", a1, 0);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v6 = (void *)v7;
    return v6;
  }
  if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchCuratedAssetsInAssetCollection:", a1);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v3)
  {
    v6 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CD1620];
    objc_msgSend(a1, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "emptyFetchResultWithPhotoLibrary:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
