@implementation PUJoiningAssetsDataSource

- (PUJoiningAssetsDataSource)initWithDataSources:(id)a3
{
  id v5;
  PUJoiningAssetsDataSource *v6;
  PUJoiningAssetsDataSource *v7;
  NSArray *v8;
  NSDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  PUContainedDataSourceInfo *v18;
  void *v19;
  NSArray *containedDataSourceInfos;
  NSArray *v21;
  NSDictionary *containedDataSourceInfoByIdentifier;
  PUJoiningAssetsDataSource *v24;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PUJoiningAssetsDataSource;
  v6 = -[PUTilingDataSource init](&v31, sel_init);
  v7 = v6;
  if (v6)
  {
    v24 = v6;
    objc_storeStrong((id *)&v6->__dataSources, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v25 = v5;
    obj = v5;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB36B0], "pu_rootIndexPath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "numberOfSubItemsAtIndexPath:", v16);

          v18 = objc_alloc_init(PUContainedDataSourceInfo);
          -[PUContainedDataSourceInfo setAssetsDataSource:](v18, "setAssetsDataSource:", v15);
          -[PUContainedDataSourceInfo setExternalSections:](v18, "setExternalSections:", v12, v17);
          objc_msgSend(v15, "identifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v18, v19);

          -[NSArray addObject:](v8, "addObject:", v18);
          v12 += v17;

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    v7 = v24;
    containedDataSourceInfos = v24->__containedDataSourceInfos;
    v24->__containedDataSourceInfos = v8;
    v21 = v8;

    containedDataSourceInfoByIdentifier = v24->__containedDataSourceInfoByIdentifier;
    v24->__containedDataSourceInfoByIdentifier = v9;

    v24->__totalNumberOfSections = v12;
    v5 = v25;
  }

  return v7;
}

- (id)_assetsDataSourceForExternalIndexPath:(id)a3 outDataSourceIndex:(int64_t *)a4 outLocalIndexPath:(id *)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  id v20;
  int64_t *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = objc_msgSend(v8, "indexAtPosition:", 0);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PUJoiningAssetsDataSource _containedDataSourceInfos](self, "_containedDataSourceInfos");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (char *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v22 = a4;
    v12 = 0;
    v13 = *(_QWORD *)v24;
    while (2)
    {
      v14 = 0;
      v15 = &v11[(_QWORD)v12];
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v14);
        v17 = objc_msgSend(v16, "externalSections");
        if (v9 >= v17 && v9 - v17 < v18)
        {
          objc_msgSend(v16, "assetsDataSource");
          v11 = (char *)objc_claimAutoreleasedReturnValue();
          if (a5)
          {
            objc_msgSend(v8, "pu_indexPathByChangingIndexAtPosition:toIndex:", 0, v9 - objc_msgSend(v16, "externalSections"));
            v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            *a5 = v20;

          }
          if (v22)
            *v22 = (int64_t)&v14[(_QWORD)v12];
          goto LABEL_18;
        }
        ++v14;
      }
      while (v11 != v14);
      v11 = (char *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v12 = v15;
      if (v11)
        continue;
      break;
    }
  }
LABEL_18:

  return v11;
}

- (id)_externalIndexPathForLocalIndexPath:(id)a3 inAssetsDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[PUJoiningAssetsDataSource _containedDataSourceInfoByIdentifier](self, "_containedDataSourceInfoByIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pu_indexPathByChangingIndexAtPosition:toIndex:", 0, objc_msgSend(v10, "externalSections") + objc_msgSend(v7, "indexAtPosition:", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int64_t v7;
  void *v8;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB36B0], "pu_rootIndexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = -[PUJoiningAssetsDataSource _totalNumberOfSections](self, "_totalNumberOfSections");
  }
  else
  {
    v10 = 0;
    -[PUJoiningAssetsDataSource _assetsDataSourceForExternalIndexPath:outDataSourceIndex:outLocalIndexPath:](self, "_assetsDataSourceForExternalIndexPath:outDataSourceIndex:outLocalIndexPath:", v4, 0, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "numberOfSubItemsAtIndexPath:", v10);

  }
  return v7;
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PUJoiningAssetReference *v7;
  uint64_t v8;
  void *v9;
  PUJoiningAssetReference *v10;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v4 = a3;
  -[PUJoiningAssetsDataSource _assetsDataSourceForExternalIndexPath:outDataSourceIndex:outLocalIndexPath:](self, "_assetsDataSourceForExternalIndexPath:outDataSourceIndex:outLocalIndexPath:", v4, &v13, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetReferenceAtIndexPath:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [PUJoiningAssetReference alloc];
  v8 = v13;
  -[PUTilingDataSource identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUJoiningAssetReference initWithContainedAssetReference:hintDataSourceIndex:indexPath:dataSourceIdentifier:](v7, "initWithContainedAssetReference:hintDataSourceIndex:indexPath:dataSourceIdentifier:", v6, v8, v4, v9);

  return v10;
}

- (id)indexPathForAssetReference:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  id v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  PUJoiningAssetsDataSource *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__43693;
  v47 = __Block_byref_object_dispose__43694;
  v48 = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "dataSourceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTilingDataSource identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      objc_msgSend(v5, "indexPath");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v44[5];
      v44[5] = v9;
    }
    else
    {
      objc_msgSend(v5, "containedAssetReference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v5, "hintDataSourceIndex");
      -[PUJoiningAssetsDataSource _dataSources](self, "_dataSources");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v18 < objc_msgSend(v19, "count");

      if (v20)
      {
        -[PUJoiningAssetsDataSource _dataSources](self, "_dataSources");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v22 = 0;
      }
      objc_msgSend(v22, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataSourceIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqualToString:", v24);

      if (v25)
      {
        objc_msgSend(v10, "indexPath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUJoiningAssetsDataSource _externalIndexPathForLocalIndexPath:inAssetsDataSource:](self, "_externalIndexPathForLocalIndexPath:inAssetsDataSource:", v26, v22);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v44[5];
        v44[5] = v27;

      }
      else
      {
        v29 = objc_msgSend(v5, "hintDataSourceIndex");
        -[PUJoiningAssetsDataSource _dataSources](self, "_dataSources");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        -[PUJoiningAssetsDataSource _dataSources](self, "_dataSources");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29 >= v31)
          v29 = 0;
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __56__PUJoiningAssetsDataSource_indexPathForAssetReference___block_invoke;
        v39[3] = &unk_1E58A18E8;
        v41 = self;
        v42 = &v43;
        v40 = v10;
        objc_msgSend(v32, "px_enumerateObjectsFromIndex:usingBlock:", v29, v39);

        v26 = v40;
      }

    }
LABEL_23:

  }
  else
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[PUJoiningAssetsDataSource _dataSources](self, "_dataSources", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reverseObjectEnumerator");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(v5);
          v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v15, "indexPathForAssetReference:", v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            -[PUJoiningAssetsDataSource _externalIndexPathForLocalIndexPath:inAssetsDataSource:](self, "_externalIndexPathForLocalIndexPath:inAssetsDataSource:", v10, v15);
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v44[5];
            v44[5] = v16;

            goto LABEL_23;
          }
        }
        v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
        if (v12)
          continue;
        break;
      }
    }
  }

  v33 = (id)v44[5];
  _Block_object_dispose(&v43, 8);

  return v33;
}

- (id)assetCollectionAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  -[PUJoiningAssetsDataSource _assetsDataSourceForExternalIndexPath:outDataSourceIndex:outLocalIndexPath:](self, "_assetsDataSourceForExternalIndexPath:outDataSourceIndex:outLocalIndexPath:", a3, 0, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCollectionAtIndexPath:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)indexPathForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PUJoiningAssetsDataSource _dataSources](self, "_dataSources", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "indexPathForAssetCollection:", v4);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v14 = (void *)v12;
          -[PUJoiningAssetsDataSource _externalIndexPathForLocalIndexPath:inAssetsDataSource:](self, "_externalIndexPathForLocalIndexPath:inAssetsDataSource:", v12, v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)assetAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  -[PUJoiningAssetsDataSource _assetsDataSourceForExternalIndexPath:outDataSourceIndex:outLocalIndexPath:](self, "_assetsDataSourceForExternalIndexPath:outDataSourceIndex:outLocalIndexPath:", a3, 0, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetAtIndexPath:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  -[PUJoiningAssetsDataSource _assetsDataSourceForExternalIndexPath:outDataSourceIndex:outLocalIndexPath:](self, "_assetsDataSourceForExternalIndexPath:outDataSourceIndex:outLocalIndexPath:", a3, 0, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "badgeInfoPromiseForAssetAtIndexPath:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)startingAssetReference
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PUJoiningAssetsDataSource _dataSources](self, "_dataSources", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "startingAssetReference");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v13 = v10;
          objc_msgSend(v10, "indexPath");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUJoiningAssetsDataSource _externalIndexPathForLocalIndexPath:inAssetsDataSource:](self, "_externalIndexPathForLocalIndexPath:inAssetsDataSource:", v14, v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            -[PUJoiningAssetsDataSource assetReferenceAtIndexPath:](self, "assetReferenceAtIndexPath:", v12);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = 0;
          }
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }

  v11 = 0;
  v12 = 0;
LABEL_13:

  return v11;
}

- (int64_t)numberOfAssetsWithMaximum:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PUJoiningAssetsDataSource _dataSources](self, "_dataSources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v4);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "numberOfAssetsWithMaximum:", a3);
      v7 += v10;
      a3 -= v10;
      if (a3 < 1)
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)containedAssetsDataSourceAtIndexPath:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  -[PUJoiningAssetsDataSource _assetsDataSourceForExternalIndexPath:outDataSourceIndex:outLocalIndexPath:](self, "_assetsDataSourceForExternalIndexPath:outDataSourceIndex:outLocalIndexPath:", a3, 0, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containedAssetsDataSourceAtIndexPath:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)_dataSources
{
  return self->__dataSources;
}

- (int64_t)_totalNumberOfSections
{
  return self->__totalNumberOfSections;
}

- (NSDictionary)_containedDataSourceInfoByIdentifier
{
  return self->__containedDataSourceInfoByIdentifier;
}

- (NSArray)_containedDataSourceInfos
{
  return self->__containedDataSourceInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__containedDataSourceInfos, 0);
  objc_storeStrong((id *)&self->__containedDataSourceInfoByIdentifier, 0);
  objc_storeStrong((id *)&self->__dataSources, 0);
}

void __56__PUJoiningAssetsDataSource_indexPathForAssetReference___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "indexPathForAssetReference:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "_externalIndexPathForLocalIndexPath:inAssetsDataSource:", v6, v10);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a4 = 1;
  }

}

@end
