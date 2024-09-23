@implementation PXContentSyndicationMockSingleAssetsDataSource

- (PXContentSyndicationMockSingleAssetsDataSource)initWithFetchResult:(id)a3
{
  id v6;
  PXContentSyndicationMockSingleAssetsDataSource *v7;
  PXContentSyndicationMockSingleAssetsDataSource *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXContentSyndicationMockSingleAssetsDataSource;
  v7 = -[PXContentSyndicationMockSingleAssetsDataSource init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_fetchResult, a3);

  return v8;
}

- (id)dataSourceUpdatedWithChange:(id)a3 changeDetails:(id *)a4
{
  void *v6;
  void *v7;
  PHFetchResult *v8;
  PHFetchResult *fetchResult;
  PHFetchResult *v10;
  PXContentSyndicationMockSingleAssetsDataSource *v11;

  objc_msgSend(a3, "changeDetailsForFetchResult:", self->_fetchResult);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v11 = self;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v6, "fetchResultAfterChanges");
  v8 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
  fetchResult = v8;
  if (!v8)
    fetchResult = self->_fetchResult;
  v10 = fetchResult;

  v11 = -[PXContentSyndicationMockSingleAssetsDataSource initWithFetchResult:]([PXContentSyndicationMockSingleAssetsDataSource alloc], "initWithFetchResult:", v10);
  if (a4)
  {
LABEL_5:
    objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_6:

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
  -[PXContentSyndicationMockSingleAssetsDataSource assetCollectionAtItemIndexPath:](self, "assetCollectionAtItemIndexPath:", v5);
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
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectReference"));

    v27 = 0u;
    v28 = 0u;
    v9 = *(_QWORD *)off_1E50B7E98;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(objectReference.indexPath)"));

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
  v24.super_class = (Class)PXContentSyndicationMockSingleAssetsDataSource;
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
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 86, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectReference.itemObject"), v21);
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
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 86, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectReference.itemObject"), v21, v23);

    goto LABEL_21;
  }
LABEL_13:
  v13 = -[PHFetchResult indexOfObject:](self->_fetchResult, "indexOfObject:", v12);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v13;
    v25 = (unint64_t)-[PXContentSyndicationMockSingleAssetsDataSource identifier](self, "identifier");
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 98, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (id)collectionAtIndexPath:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 102, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (id)collectionListForSection:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 106, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (int64_t)countForCollection:(id)a3
{
  return 1;
}

- (id)existingAssetsFetchResultAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 114, CFSTR("Code which should be unreachable has been reached"));

  abort();
}

- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  void *v4;
  PXContentSyndicationItem *v5;
  _OWORD v7[2];

  v3 = *(_OWORD *)&a3->item;
  v7[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v7[1] = v3;
  -[PXContentSyndicationMockSingleAssetsDataSource assetCollectionAtItemIndexPath:](self, "assetCollectionAtItemIndexPath:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXContentSyndicationItem initWithAssetCollection:]([PXContentSyndicationItem alloc], "initWithAssetCollection:", v4);

  return v5;
}

- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXContentSyndicationMockSingleAssetsDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(indexPath)"));

  }
  -[PHFetchResult objectAtIndexedSubscript:](self->_fetchResult, "objectAtIndexedSubscript:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CD1620]);
  v20[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResult photoLibrary](self->_fetchResult, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResult fetchType](self->_fetchResult, "fetchType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFetchResult fetchPropertySets](self->_fetchResult, "fetchPropertySets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v10, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v11, v12, v13, v14, 0, 0);

  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:subtype:", v15, 1000000501);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)mostRecentlyAddedDate
{
  void *v2;
  void *v3;
  void *v4;

  -[PHFetchResult firstObject](self->_fetchResult, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchPropertySetsIfNeeded");
  objc_msgSend(v2, "curationProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

@end
