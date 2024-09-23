@implementation PHFetchOptions(PXSearch)

+ (id)px_searchAssetFetchOptions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "px_searchAssetFetchOptionsForPhotoLibrary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)px_searchAssetFetchOptionsForPhotoLibrary:()PXSearch
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludeAssetSourceTypes:", 5);
  objc_msgSend(v3, "setIncludeHiddenAssets:", 0);
  objc_msgSend(v3, "setIncludeGuestAssets:", 1);
  objc_msgSend(v3, "setIncludeTorsoAndFaceDetectionData:", 1);
  v7[0] = *MEMORY[0x1E0CD1A70];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFetchPropertySets:", v4);

  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIncludedDetectionTypes:", v5);

  return v3;
}

@end
