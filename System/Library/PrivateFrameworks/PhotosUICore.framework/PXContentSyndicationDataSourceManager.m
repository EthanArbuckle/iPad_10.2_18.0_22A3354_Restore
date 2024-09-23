@implementation PXContentSyndicationDataSourceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAssetsFetchResult, 0);
}

+ (id)createCountsController
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXContentSyndicationDataSource.m"), 78, CFSTR("Method %s is a responsibility of subclass %@"), "+[PXContentSyndicationDataSourceManager createCountsController]", v6);

  abort();
}

- (id)assetFetchResultProvider
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationDataSource.m"), 62, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentSyndicationDataSourceManager assetFetchResultProvider]", v6);

  abort();
}

- (id)imageProvider
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationDataSource.m"), 66, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentSyndicationDataSourceManager imageProvider]", v6);

  abort();
}

- (id)socialLayerHighlightProvider
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationDataSource.m"), 70, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentSyndicationDataSourceManager socialLayerHighlightProvider]", v6);

  abort();
}

- (id)createAssetsDataSourceManager
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationDataSource.m"), 74, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentSyndicationDataSourceManager createAssetsDataSourceManager]", v6);

  abort();
}

- (PXDisplayAssetFetchResult)allAssetsFetchResult
{
  return self->_allAssetsFetchResult;
}

@end
