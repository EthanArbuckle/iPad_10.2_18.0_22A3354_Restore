@implementation PUCameraTransientAssetsDataSource

- (PUCameraTransientAssetsDataSource)initWithUUIDs:(id)a3 mapping:(id)a4 representativeMapping:(id)a5 inAssetCollection:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PUCameraTransientAssetsDataSource *v15;
  PUCameraTransientAssetsDataSource *v16;
  PUCameraTransientAssetsDataSource *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PUCameraTransientAssetsDataSource;
  v15 = -[PUTilingDataSource init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->__assetUUIDs, a3);
    objc_storeStrong((id *)&v16->__assetsByUUID, a4);
    objc_storeStrong((id *)&v16->__representativeAssetsByBurstIdentifier, a5);
    objc_storeStrong((id *)&v16->__transientAssetCollection, a6);
    v17 = v16;
  }

  return v16;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  int64_t v8;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (v6 == 1)
  {
    -[PUCameraTransientAssetsDataSource _assetUUIDs](self, "_assetUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUCameraTransientAssetsDataSource.m"), 62, CFSTR("invalid indexPath %@"), v5);
    v8 = 0;
  }
  else
  {
    -[PUCameraTransientAssetsDataSource _assetUUIDs](self, "_assetUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") != 0;
  }

  return v8;
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PUAssetReference *v10;
  void *v11;
  PUAssetReference *v12;

  v4 = a3;
  -[PUCameraTransientAssetsDataSource _assetUUIDs](self, "_assetUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCameraTransientAssetsDataSource _assetsByUUID](self, "_assetsByUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCameraTransientAssetsDataSource _transientAssetCollection](self, "_transientAssetCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [PUAssetReference alloc];
  -[PUTilingDataSource identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PUAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:](v10, "initWithAsset:assetCollection:indexPath:dataSourceIdentifier:", v8, v9, v4, v11);

  return v12;
}

- (id)indexPathForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "dataSourceIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PUTilingDataSource identifier](self, "identifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqual:", v7),
        v7,
        v6,
        !v8))
  {
    -[PUCameraTransientAssetsDataSource _assetUUIDs](self, "_assetUUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "indexOfObject:", v12);

    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v13, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(v5, "indexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)indexPathForAssetCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  -[PUCameraTransientAssetsDataSource _transientAssetCollection](self, "_transientAssetCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  int v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  PUBadgeInfoPromise *v22;
  _QWORD v24[4];

  v4 = a3;
  -[PUCameraTransientAssetsDataSource _assetUUIDs](self, "_assetUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCameraTransientAssetsDataSource _assetsByUUID](self, "_assetsByUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isHDR");
  v11 = objc_msgSend(v9, "mediaSubtypes");
  v12 = objc_msgSend(v9, "canPlayPhotoIris");
  objc_msgSend(v9, "burstIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "numberOfRepresentedAssets");
  v15 = *(_QWORD *)(MEMORY[0x1E0D7CE00] + 8);
  v16 = *(_QWORD *)(MEMORY[0x1E0D7CE00] + 24);
  v17 = v13 != 0;
  v18 = v14 > 1;
  v19 = !v17 || !v18;
  if (v17 && v18)
    v20 = *MEMORY[0x1E0D7CE00] | 8;
  else
    v20 = *MEMORY[0x1E0D7CE00];
  if (v19)
    v21 = *(_QWORD *)(MEMORY[0x1E0D7CE00] + 16);
  else
    v21 = v14;
  if (v12)
    v20 |= 0x40uLL;
  if (v10)
    v20 |= 4uLL;
  v24[0] = v20 | (v11 >> 10) & 0x400;
  v24[1] = v15;
  v24[2] = v21;
  v24[3] = v16;
  v22 = -[PUBadgeInfoPromise initWithBadgeInfo:]([PUBadgeInfoPromise alloc], "initWithBadgeInfo:", v24);

  return v22;
}

- (id)assetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PUCameraTransientAssetsDataSource _assetUUIDs](self, "_assetUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCameraTransientAssetsDataSource _assetsByUUID](self, "_assetsByUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)assetReferenceForAssetReference:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PUAssetReference *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PUAssetReference *v13;
  void *v14;
  void *v15;

  objc_msgSend(a3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCameraTransientAssetsDataSource _assetUUIDs](self, "_assetUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    -[PUCameraTransientAssetsDataSource _assetsByUUID](self, "_assetsByUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [PUAssetReference alloc];
    -[PUCameraTransientAssetsDataSource _transientAssetCollection](self, "_transientAssetCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTilingDataSource identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PUAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:](v13, "initWithAsset:assetCollection:indexPath:dataSourceIdentifier:", v11, v14, v12, v15);

  }
  return v8;
}

- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a4, "_uuidAtIndexPath:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PUCameraTransientAssetsDataSource _assetUUIDs](self, "_assetUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "indexOfObject:", v5);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)startingAssetReference
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[PUCameraTransientAssetsDataSource _assetUUIDs](self, "_assetUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v4 - 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCameraTransientAssetsDataSource assetReferenceAtIndexPath:](self, "assetReferenceAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[PUCameraTransientAssetsDataSource _assetUUIDs](self, "_assetUUIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)_uuidAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  -[PUCameraTransientAssetsDataSource _assetUUIDs](self, "_assetUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  if (v6 >= objc_msgSend(v5, "count") - 1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (PUDisplayAssetCollection)_transientAssetCollection
{
  return self->__transientAssetCollection;
}

- (NSArray)_assetUUIDs
{
  return self->__assetUUIDs;
}

- (NSDictionary)_assetsByUUID
{
  return self->__assetsByUUID;
}

- (NSDictionary)_representativeAssetsByBurstIdentifier
{
  return self->__representativeAssetsByBurstIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__representativeAssetsByBurstIdentifier, 0);
  objc_storeStrong((id *)&self->__assetsByUUID, 0);
  objc_storeStrong((id *)&self->__assetUUIDs, 0);
  objc_storeStrong((id *)&self->__transientAssetCollection, 0);
}

@end
