@implementation PXContentSyndicationEmptyDataSourceManager

+ (id)createCountsController
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXContentSyndicationEmptyDataSource.m"), 57, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (id)createInitialDataSource
{
  return objc_alloc_init(PXContentSyndicationEmptyDataSource);
}

- (id)allAssetsFetchResult
{
  void *v4;
  id v5;
  void *v6;
  void *v8;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CD16F8], "openPhotoLibraryWithWellKnownIdentifier:error:", 3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationEmptyDataSource.m"), 47, CFSTR("Error trying to access the syndication library for returning an empty fetch result in PXContentSyndicationEmptyDataSource: %@"), v5);

  }
  objc_msgSend(MEMORY[0x1E0CD1620], "emptyFetchResultWithPhotoLibrary:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createAssetsDataSourceManager
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationEmptyDataSource.m"), 53, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

@end
