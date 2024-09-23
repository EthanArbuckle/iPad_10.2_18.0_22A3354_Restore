@implementation PXContentSyndicationPhotoKitDataSource

- (PXContentSyndicationPhotoKitDataSource)initWithFetchResult:(id)a3
{
  id v6;
  PXContentSyndicationPhotoKitDataSource *v7;
  PXContentSyndicationPhotoKitDataSource *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXContentSyndicationPhotoKitDataSource;
  v7 = -[PXContentSyndicationPhotoKitDataSource init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_fetchResult, a3);

  return v8;
}

- (id)dataSourceUpdatedWithChange:(id)a3 underlyingArrayChangeDetails:(id *)a4
{
  void *v6;
  NSObject *v7;
  PHFetchResult *v8;
  PHFetchResult *fetchResult;
  PHFetchResult *v10;
  PXContentSyndicationPhotoKitDataSource *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "changeDetailsForFetchResult:", self->_fetchResult);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v11 = self;
    if (!a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  PLSyndicationUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "ContentSyndicationPhotoKitDataSourceManager: We have received changes to our fetch result: %@", (uint8_t *)&v13, 0xCu);
  }

  objc_msgSend(v6, "fetchResultAfterChanges");
  v8 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  fetchResult = v8;
  if (!v8)
    fetchResult = self->_fetchResult;
  v10 = fetchResult;

  v11 = -[PXContentSyndicationPhotoKitDataSource initWithFetchResult:]([PXContentSyndicationPhotoKitDataSource alloc], "initWithFetchResult:", v10);
  if (a4)
  {
LABEL_7:
    objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return v11;
}

- (int64_t)numberOfSections
{
  return -[PHFetchResult count](self->_fetchResult, "count") != 0;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return -[PHFetchResult count](self->_fetchResult, "count", a3);
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->item;
  v5[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v5[1] = v3;
  -[PXContentSyndicationPhotoKitDataSource assetCollectionAtItemIndexPath:](self, "assetCollectionAtItemIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v12;
  NSUInteger v13;
  NSUInteger v14;
  __int128 v15;
  PXSimpleIndexPath *result;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectReference"));

    v27 = 0u;
    v28 = 0u;
    v9 = *(_QWORD *)off_1E50B7E98;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(objectReference.indexPath)"));

    goto LABEL_10;
  }
  objc_msgSend(v7, "indexPath");
  v9 = *(_QWORD *)off_1E50B7E98;
  if ((_QWORD)v27 == *(_QWORD *)off_1E50B7E98
    || (_QWORD)v28 == 0x7FFFFFFFFFFFFFFFLL
    || *((_QWORD *)&v28 + 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_18;
  }
LABEL_10:
  v25 = 0u;
  v26 = 0u;
  v24.receiver = self;
  v24.super_class = (Class)PXContentSyndicationPhotoKitDataSource;
  -[PXSimpleIndexPath indexPathForObjectReference:](&v24, sel_indexPathForObjectReference_, v8);
  if ((_QWORD)v25 != v9)
    goto LABEL_16;
  objc_msgSend(v8, "itemObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 88, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectReference.itemObject"), v21);
LABEL_21:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 88, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectReference.itemObject"), v21, v23);

    goto LABEL_21;
  }
LABEL_13:
  v13 = -[PHFetchResult indexOfObject:](self->_fetchResult, "indexOfObject:", v12);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v13;
    v25 = (unint64_t)-[PXContentSyndicationPhotoKitDataSource identifier](self, "identifier");
    *(_QWORD *)&v26 = v14;
    *((_QWORD *)&v26 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_16:
  v15 = v26;
  *(_OWORD *)&retstr->dataSourceIdentifier = v25;
  *(_OWORD *)&retstr->item = v15;

  return result;
}

- (id)indexPathForCollection:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 100, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (id)collectionAtIndexPath:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 104, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (id)collectionListForSection:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 108, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (int64_t)countForCollection:(id)a3
{
  id v5;
  int64_t v6;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 112, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collection"), v10);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 112, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collection"), v10, v12);

    goto LABEL_6;
  }
LABEL_3:
  v6 = objc_msgSend(v5, "estimatedAssetCount");

  return v6;
}

- (id)existingAssetsFetchResultAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 118, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  void *v3;
  PXContentSyndicationItem *v4;

  -[PHFetchResult objectAtIndexedSubscript:](self->_fetchResult, "objectAtIndexedSubscript:", a3->item);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXContentSyndicationItem initWithAssetCollection:]([PXContentSyndicationItem alloc], "initWithAssetCollection:", v3);

  return v4;
}

- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v10;
  void *v11;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXContentSyndicationPhotoKitDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationPhotoKitDataSource.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(indexPath)"));

  }
  return -[PHFetchResult objectAtIndexedSubscript:](self->_fetchResult, "objectAtIndexedSubscript:");
}

- (id)mostRecentlyAddedDate
{
  void *v2;
  void *v3;

  -[PHFetchResult firstObject](self->_fetchResult, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

@end
