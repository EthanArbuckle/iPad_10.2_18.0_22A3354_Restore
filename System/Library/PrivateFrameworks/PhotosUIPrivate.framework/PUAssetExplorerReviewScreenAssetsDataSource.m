@implementation PUAssetExplorerReviewScreenAssetsDataSource

- (PUAssetExplorerReviewScreenAssetsDataSource)initWithDataSource:(id)a3 substitutedAssets:(id)a4
{
  id v7;
  id v8;
  PUAssetExplorerReviewScreenAssetsDataSource *v9;
  PUAssetExplorerReviewScreenAssetsDataSource *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  NSDictionary *substitutedAssetsByUUID;
  NSCache *v21;
  NSCache *assetReferenceByIndexPathCache;
  PUAssetExplorerReviewScreenAssetsDataSource *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PUAssetExplorerReviewScreenAssetsDataSource;
  v9 = -[PUTilingDataSource init](&v29, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->__originalDataSource, a3);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v17, "uuid", (_QWORD)v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v14);
    }

    v19 = objc_msgSend(v11, "copy");
    substitutedAssetsByUUID = v10->__substitutedAssetsByUUID;
    v10->__substitutedAssetsByUUID = (NSDictionary *)v19;

    v21 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    assetReferenceByIndexPathCache = v10->__assetReferenceByIndexPathCache;
    v10->__assetReferenceByIndexPathCache = v21;

    v23 = v10;
  }

  return v10;
}

- (id)identifier
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAssetExplorerReviewScreenAssetsDataSource;
  -[PUTilingDataSource identifier](&v3, sel_identifier);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[PUAssetExplorerReviewScreenAssetsDataSource _originalDataSource](self, "_originalDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfSubItemsAtIndexPath:", v4);

  return v6;
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  PUAssetExplorerReviewScreenAssetsDataSourceAssetReference *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v17;

  v4 = a3;
  -[PUAssetExplorerReviewScreenAssetsDataSource _assetReferenceByIndexPathCache](self, "_assetReferenceByIndexPathCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (PUAssetExplorerReviewScreenAssetsDataSourceAssetReference *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[PUAssetExplorerReviewScreenAssetsDataSource _originalDataSource](self, "_originalDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "assetReferenceAtIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetExplorerReviewScreenAssetsDataSource _substitutedAssetsByUUID](self, "_substitutedAssetsByUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = v8;
    v14 = v13;
    -[PUAssetExplorerReviewScreenAssetsDataSource identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUAssetExplorerReviewScreenAssetsDataSourceAssetReference initWithOriginalAssetReference:asset:dataSourceIdentifier:]([PUAssetExplorerReviewScreenAssetsDataSourceAssetReference alloc], "initWithOriginalAssetReference:asset:dataSourceIdentifier:", v7, v14, v15);

    objc_msgSend(v5, "setObject:forKey:", v6, v4);
  }

  return v6;
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

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "dataSourceIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PUAssetExplorerReviewScreenAssetsDataSource identifier](self, "identifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqual:", v7),
        v7,
        v6,
        !v8))
  {
    -[PUAssetExplorerReviewScreenAssetsDataSource _originalDataSource](self, "_originalDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "originalAssetReference");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "indexPathForAssetReference:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "indexPathForAssetReference:", v5);
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

- (id)assetCollectionAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUAssetExplorerReviewScreenAssetsDataSource _originalDataSource](self, "_originalDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetCollectionAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)indexPathForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUAssetExplorerReviewScreenAssetsDataSource _originalDataSource](self, "_originalDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForAssetCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUAssetExplorerReviewScreenAssetsDataSource _originalDataSource](self, "_originalDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "badgeInfoPromiseForAssetAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PUAssetsDataSource)_originalDataSource
{
  return self->__originalDataSource;
}

- (NSDictionary)_substitutedAssetsByUUID
{
  return self->__substitutedAssetsByUUID;
}

- (NSCache)_assetReferenceByIndexPathCache
{
  return self->__assetReferenceByIndexPathCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__assetReferenceByIndexPathCache, 0);
  objc_storeStrong((id *)&self->__substitutedAssetsByUUID, 0);
  objc_storeStrong((id *)&self->__originalDataSource, 0);
}

@end
