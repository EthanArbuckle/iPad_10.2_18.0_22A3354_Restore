@implementation PUPXAssetsDataSource

- (PUPXAssetsDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXAssetsDataSource.m"), 21, CFSTR("%s is not available as initializer"), "-[PUPXAssetsDataSource init]");

  abort();
}

- (PUPXAssetsDataSource)initWithUnderlyingDataSource:(id)a3
{
  id v5;
  PUPXAssetsDataSource *v6;
  PUPXAssetsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PUPXAssetsDataSource;
  v6 = -[PUTilingDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingDataSource, a3);

  return v7;
}

- (id)startingAssetReference
{
  void *v3;
  void *v4;
  PUPXAssetReference *v5;
  void *v6;
  PUPXAssetReference *v7;

  -[PUPXAssetsDataSource underlyingDataSource](self, "underlyingDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startingAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [PUPXAssetReference alloc];
    -[PUTilingDataSource identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PUPXAssetReference initWithPXAssetReference:dataSourceIdentifier:](v5, "initWithPXAssetReference:dataSourceIdentifier:", v4, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB36B0], "pu_rootIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    -[PUPXAssetsDataSource underlyingDataSource](self, "underlyingDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfSections");
  }
  else if (objc_msgSend(v4, "length") == 1 && objc_msgSend(v4, "section") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PUPXAssetsDataSource underlyingDataSource](self, "underlyingDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfItemsInSection:", objc_msgSend(v4, "section"));
  }
  else
  {
    -[PUPXAssetsDataSource underlyingDataSource](self, "underlyingDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfSubitemsInItem:section:", objc_msgSend(v4, "item"), objc_msgSend(v4, "section"));
  }
  v9 = v8;

  return v9;
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PUPXAssetReference *v8;
  void *v9;
  PUPXAssetReference *v10;
  _OWORD v12[4];

  v4 = a3;
  -[PUPXAssetsDataSource underlyingDataSource](self, "underlyingDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  PXSimpleIndexPathFromIndexPath();

  -[PUPXAssetsDataSource underlyingDataSource](self, "underlyingDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v12, 0, sizeof(v12));
  objc_msgSend(v6, "assetReferenceAtItemIndexPath:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [PUPXAssetReference alloc];
  -[PUTilingDataSource identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUPXAssetReference initWithPXAssetReference:dataSourceIdentifier:](v8, "initWithPXAssetReference:dataSourceIdentifier:", v7, v9);

  return v10;
}

- (id)indexPathForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;

  v4 = a3;
  objc_msgSend(v4, "dataSourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTilingDataSource identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(v4, "indexPath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUPXAssetsDataSource underlyingDataSource](self, "underlyingDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsAnyItems"))
    {
      v8 = objc_alloc(MEMORY[0x1E0D7CCD0]);
      objc_msgSend(v4, "assetCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_OWORD *)(MEMORY[0x1E0D7D0D0] + 16);
      v16 = *MEMORY[0x1E0D7D0D0];
      v17 = v11;
      v12 = (void *)objc_msgSend(v8, "initWithSectionObject:itemObject:subitemObject:indexPath:", v9, v10, 0, &v16);

      v16 = 0u;
      v17 = 0u;
      if (v7)
      {
        objc_msgSend(v7, "indexPathForAssetReference:", v12);
        v13 = v16;
      }
      else
      {
        v13 = 0;
      }
      if (v13 == *MEMORY[0x1E0D7CE28])
      {
        v14 = 0;
      }
      else
      {
        PXIndexPathFromSimpleIndexPath();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a4, "assetReferenceAtIndexPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPXAssetsDataSource indexPathForAssetReference:](self, "indexPathForAssetReference:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PUBadgeInfoPromise *v13;
  PUBadgeInfoPromise *v14;
  _OWORD v16[2];
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];

  v4 = (void *)MEMORY[0x1E0D7B1D8];
  v5 = a3;
  objc_msgSend(v4, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPXAssetsDataSource underlyingDataSource](self, "underlyingDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "identifier");
  v9 = objc_msgSend(v5, "section");
  v10 = objc_msgSend(v5, "item");

  v19[0] = v8;
  v19[1] = v9;
  v19[2] = v10;
  v19[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v7, "assetReferenceAtItemIndexPath:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  if (v6)
    objc_msgSend(v6, "badgeInfoForAsset:inCollection:options:", v12, 0, 0);
  v13 = [PUBadgeInfoPromise alloc];
  v16[0] = v17;
  v16[1] = v18;
  v14 = -[PUBadgeInfoPromise initWithBadgeInfo:](v13, "initWithBadgeInfo:", v16);

  return v14;
}

- (PXAssetsDataSource)underlyingDataSource
{
  return self->_underlyingDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDataSource, 0);
}

@end
