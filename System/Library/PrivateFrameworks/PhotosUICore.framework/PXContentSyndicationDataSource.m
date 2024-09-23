@implementation PXContentSyndicationDataSource

- (id)allAssetsFetchResult
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationDataSource.m"), 18, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentSyndicationDataSource allAssetsFetchResult]", v6);

  abort();
}

- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationDataSource.m"), 22, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentSyndicationDataSource contentSyndicationItemAtItemIndexPath:]", v7);

  abort();
}

- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationDataSource.m"), 26, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentSyndicationDataSource assetCollectionAtItemIndexPath:]", v7);

  abort();
}

- (NSDate)mostRecentlyAddedDate
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationDataSource.m"), 30, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentSyndicationDataSource mostRecentlyAddedDate]", v6);

  abort();
}

- (id)indexPathForCollection:(id)a3
{
  -[PXContentSyndicationDataSource indexPathForObjectID:](self, "indexPathForObjectID:", a3);
  PXIndexPathFromSimpleIndexPath();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)collectionAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationDataSource.m"), 42, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentSyndicationDataSource collectionAtIndexPath:]", v8);

  abort();
}

- (id)collectionListForSection:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationDataSource.m"), 46, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentSyndicationDataSource collectionListForSection:]", v7);

  abort();
}

- (int64_t)countForCollection:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationDataSource.m"), 50, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXContentSyndicationDataSource countForCollection:]", v8);

  abort();
}

@end
