@implementation PHFetchOptions(PhotosUICore)

+ (id)px_standardFetchOptions
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "px_standardLibrarySpecificFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (void)px_defaultDetectionTypes
{
  return &unk_1E53EAB90;
}

@end
