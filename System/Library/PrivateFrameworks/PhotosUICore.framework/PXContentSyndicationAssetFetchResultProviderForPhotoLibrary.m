@implementation PXContentSyndicationAssetFetchResultProviderForPhotoLibrary

id __PXContentSyndicationAssetFetchResultProviderForPhotoLibrary_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;

  v2 = a2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHFetchResult<PHAsset *> *_FetchResultForAssetCollection(PHAssetCollection *__strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXContentSyndicationDataSourcePhotoKitUtilities.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollection"));

  }
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeGuestAssets:", 1);
  objc_msgSend(v4, "setFetchLimit:", 3);
  _AssetSortDescriptorsSortedAscending(1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalSortDescriptors:", v5);

  objc_msgSend(v4, "setReverseSortOrder:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v2, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
