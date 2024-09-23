@implementation _PXBrowserDataSourceSelection

- (_PXBrowserDataSourceSelection)initWithIndexPaths:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  _PXBrowserDataSourceSelection *v8;
  uint64_t v9;
  NSArray *indexPaths;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXBrowserDataSourceSelection;
  v8 = -[_PXBrowserDataSourceSelection init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    indexPaths = v8->_indexPaths;
    v8->_indexPaths = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_dataSource, a4);
  }

  return v8;
}

- (NSArray)assets
{
  NSMutableArray *assets;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  assets = self->_assets;
  if (!assets)
  {
    -[_PXBrowserDataSourceSelection indexPaths](self, "indexPaths");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXBrowserDataSourceSelection dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v7 = self->_assets;
    self->_assets = v6;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = self->_assets;
          objc_msgSend(v5, "displayAssetAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v13, "addObject:", v14);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    assets = self->_assets;
  }
  return (NSArray *)assets;
}

- (int64_t)estimatedAssetCount
{
  void *v2;
  int64_t v3;

  -[_PXBrowserDataSourceSelection indexPaths](self, "indexPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)assetCount
{
  void *v2;
  int64_t v3;

  -[_PXBrowserDataSourceSelection indexPaths](self, "indexPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)mediaType
{
  void *v2;
  int64_t v3;

  -[_PXBrowserDataSourceSelection assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PXMediaTypeForAssets();

  return v3;
}

- (id)displayAssetAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[_PXBrowserDataSourceSelection assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)assetReferenceAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[_PXBrowserDataSourceSelection assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PXBrowserDataSourceSelection indexPaths](self, "indexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("asset"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("indexPath"));
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("selectionPointer"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[_PXBrowserDataSourceSelection dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "versionIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("dataSourceVersion"));

  return v9;
}

- (int64_t)indexOfAssetReference:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SEL v20;
  char v21;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("asset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("indexPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("selectionPointer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dataSourceVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXBrowserDataSourceSelection indexPaths](self, "indexPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v7);

  -[_PXBrowserDataSourceSelection dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_PXBrowserDataSourceSelection *)objc_msgSend(v8, "pointerValue") != self
    || (v13 = objc_msgSend(v12, "versionIdentifier"), v13 != objc_msgSend(v9, "longValue")))
  {
    objc_msgSend(v12, "indexPathForDisplayAsset:hintIndexPath:", v6, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[_PXBrowserDataSourceSelection indexPaths](self, "indexPaths");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v18, "indexOfObject:", v17);

    }
    else
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    goto LABEL_9;
  }
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = a2;
    objc_msgSend(v12, "displayAssetAtIndexPath:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("asset"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v15, "isEqual:", v16);

    if ((v21 & 1) != 0)
    {
LABEL_10:
      v14 = v11;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v20, self, CFSTR("PXBrowserSnapshot.m"), 228, CFSTR("version mismatch"));
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:

  return v14;
}

- (NSArray)indexPaths
{
  return self->_indexPaths;
}

- (PXDisplayAssetDataSource)dataSource
{
  return self->_dataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_indexPaths, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

@end
