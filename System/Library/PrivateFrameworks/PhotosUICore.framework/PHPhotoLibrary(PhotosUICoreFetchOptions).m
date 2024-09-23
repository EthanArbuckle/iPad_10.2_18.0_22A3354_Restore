@implementation PHPhotoLibrary(PhotosUICoreFetchOptions)

- (id)px_standardLibrarySpecificFetchOptions
{
  void *v1;

  objc_msgSend(a1, "librarySpecificFetchOptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setCacheSizeForFetch:", 200000);
  return v1;
}

@end
