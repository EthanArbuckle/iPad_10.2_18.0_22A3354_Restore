@implementation PXContentSyndicationMockSharedAlbumsDataSource

- (PXContentSyndicationMockSharedAlbumsDataSource)initWithSharedAlbumsDataSource:(id)a3
{
  id v5;
  PXContentSyndicationMockSharedAlbumsDataSource *v6;
  PXContentSyndicationMockSharedAlbumsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXContentSyndicationMockSharedAlbumsDataSource;
  v6 = -[PXContentSyndicationMockSharedAlbumsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sharedAlbumsDataSource, a3);

  return v7;
}

- (int64_t)identifier
{
  void *v2;
  int64_t v3;

  -[PXContentSyndicationMockSharedAlbumsDataSource sharedAlbumsDataSource](self, "sharedAlbumsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "identifier");

  return v3;
}

- (id)contentSyndicationItemAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  void *v6;
  __int128 v7;
  void *v8;
  PXContentSyndicationItem *v9;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  _OWORD v16[2];

  -[PXContentSyndicationMockSharedAlbumsDataSource sharedAlbumsDataSource](self, "sharedAlbumsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&a3->item;
  v16[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v16[1] = v7;
  objc_msgSend(v6, "objectAtIndexPath:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSharedAlbumsDataSource.m"), 58, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[self.sharedAlbumsDataSource objectAtIndexPath:indexPath]"), v13);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSharedAlbumsDataSource.m"), 58, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[self.sharedAlbumsDataSource objectAtIndexPath:indexPath]"), v13, v15);

    goto LABEL_6;
  }
LABEL_3:
  v9 = -[PXContentSyndicationItem initWithAssetCollection:]([PXContentSyndicationItem alloc], "initWithAssetCollection:", v8);

  return v9;
}

- (id)assetCollectionAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  void *v6;
  __int128 v7;
  void *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  _OWORD v15[2];

  -[PXContentSyndicationMockSharedAlbumsDataSource sharedAlbumsDataSource](self, "sharedAlbumsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&a3->item;
  v15[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v15[1] = v7;
  objc_msgSend(v6, "objectAtIndexPath:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSharedAlbumsDataSource.m"), 64, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[self.sharedAlbumsDataSource objectAtIndexPath:indexPath]"), v12);
LABEL_6:

    return v8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSharedAlbumsDataSource.m"), 64, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[self.sharedAlbumsDataSource objectAtIndexPath:indexPath]"), v12, v14);

    goto LABEL_6;
  }
  return v8;
}

- (id)mostRecentlyAddedDate
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;

  -[PXContentSyndicationMockSharedAlbumsDataSource sharedAlbumsDataSource](self, "sharedAlbumsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v16 = 0u;
  v17 = 0u;
  if (v4)
  {
    objc_msgSend(v4, "firstItemIndexPath");
    v6 = v16;
  }
  else
  {
    v6 = 0;
  }
  if (v6 != *(_QWORD *)off_1E50B7E98)
  {
    v15[0] = v16;
    v15[1] = v17;
    objc_msgSend(v5, "objectAtIndexPath:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_8:
        objc_msgSend(v8, "endDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_descriptionForAssertionMessage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSharedAlbumsDataSource.m"), 73, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[sharedAlbumsDataSource objectAtIndexPath:firstItemIndexPath]"), v12, v14);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSharedAlbumsDataSource.m"), 73, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[sharedAlbumsDataSource objectAtIndexPath:firstItemIndexPath]"), v12);
    }

    goto LABEL_8;
  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (id)collectionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXContentSyndicationMockSharedAlbumsDataSource sharedAlbumsDataSource](self, "sharedAlbumsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)collectionListForSection:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXContentSyndicationMockSharedAlbumsDataSource sharedAlbumsDataSource](self, "sharedAlbumsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionListForSection:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)countForCollection:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[PXContentSyndicationMockSharedAlbumsDataSource sharedAlbumsDataSource](self, "sharedAlbumsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countForCollection:", v4);

  return v6;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[PXContentSyndicationMockSharedAlbumsDataSource sharedAlbumsDataSource](self, "sharedAlbumsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  int64_t v5;

  -[PXContentSyndicationMockSharedAlbumsDataSource sharedAlbumsDataSource](self, "sharedAlbumsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItemsInSection:", a3);

  return v5;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  void *v6;
  int64_t v7;

  -[PXContentSyndicationMockSharedAlbumsDataSource sharedAlbumsDataSource](self, "sharedAlbumsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfSubitemsInItem:section:", a3, a4);

  return v7;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  __int128 v5;
  void *v6;
  _OWORD v8[2];

  -[PXContentSyndicationMockSharedAlbumsDataSource sharedAlbumsDataSource](self, "sharedAlbumsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->item;
  v8[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v8[1] = v5;
  objc_msgSend(v4, "objectAtIndexPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXCollectionsDataSource)sharedAlbumsDataSource
{
  return self->_sharedAlbumsDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAlbumsDataSource, 0);
}

@end
