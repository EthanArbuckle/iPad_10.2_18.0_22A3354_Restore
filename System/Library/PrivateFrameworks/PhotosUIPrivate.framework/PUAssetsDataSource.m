@implementation PUAssetsDataSource

+ (PUAssetsDataSource)emptyDataSource
{
  if (emptyDataSource_onceToken != -1)
    dispatch_once(&emptyDataSource_onceToken, &__block_literal_global_14403);
  return (PUAssetsDataSource *)(id)emptyDataSource__sharedEmptyDataSource;
}

void __37__PUAssetsDataSource_emptyDataSource__block_invoke()
{
  _PUEmptyAssetsDataSource *v0;
  void *v1;

  v0 = objc_alloc_init(_PUEmptyAssetsDataSource);
  v1 = (void *)emptyDataSource__sharedEmptyDataSource;
  emptyDataSource__sharedEmptyDataSource = (uint64_t)v0;

}

- (id)assetReferenceAtIndexPath:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetsDataSource.m"), 43, CFSTR("Concrete subclass must implement %@"), v6);

  return 0;
}

- (id)indexPathForAssetReference:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetsDataSource.m"), 48, CFSTR("Concrete subclass must implement %@"), v6);

  return 0;
}

- (id)assetCollectionAtIndexPath:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetsDataSource.m"), 53, CFSTR("Concrete subclass must implement %@"), v6);

  return 0;
}

- (id)indexPathForAssetCollection:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUAssetsDataSource.m"), 58, CFSTR("Concrete subclass must implement %@"), v6);

  return 0;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  return 0;
}

- (id)assetReferenceForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;

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
    -[PUAssetsDataSource indexPathForAssetReference:](self, "indexPathForAssetReference:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PUAssetsDataSource assetReferenceAtIndexPath:](self, "assetReferenceAtIndexPath:", v10);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (id)assetAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[PUAssetsDataSource assetReferenceAtIndexPath:](self, "assetReferenceAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length") != 1)
  {
    if (objc_msgSend(v6, "length") != 2)
    {
      v10 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v7, "assetReferenceAtIndexPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PUAssetsDataSource indexPathForAssetReference:](self, "indexPathForAssetReference:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v7, "assetCollectionAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_8;
  -[PUAssetsDataSource indexPathForAssetCollection:](self, "indexPathForAssetCollection:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v10 = (void *)v9;
LABEL_9:

LABEL_11:
  return v10;
}

- (PUAssetReference)startingAssetReference
{
  void *v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14440;
  v11 = __Block_byref_object_dispose__14441;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PUAssetsDataSource_startingAssetReference__block_invoke;
  v6[3] = &unk_1E58A2E20;
  v6[4] = &v7;
  -[PUTilingDataSource enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](self, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v3, 0, v6);

  if (v8[5])
  {
    -[PUAssetsDataSource assetReferenceAtIndexPath:](self, "assetReferenceAtIndexPath:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return (PUAssetReference *)v4;
}

- (BOOL)isEmpty
{
  return -[PUAssetsDataSource numberOfAssetsWithMaximum:](self, "numberOfAssetsWithMaximum:", 1) == 0;
}

- (BOOL)containsMultipleAssets
{
  return -[PUAssetsDataSource numberOfAssetsWithMaximum:](self, "numberOfAssetsWithMaximum:", 2) > 1;
}

- (NSIndexPath)firstItemIndexPath
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__14440;
  v11 = __Block_byref_object_dispose__14441;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PUAssetsDataSource_firstItemIndexPath__block_invoke;
  v6[3] = &unk_1E58A2E20;
  v6[4] = &v7;
  -[PUTilingDataSource enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](self, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v3, 0, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSIndexPath *)v4;
}

- (NSIndexPath)lastItemIndexPath
{
  void *v3;
  int64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB36B0], "pu_rootIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUTilingDataSource numberOfSubItemsAtIndexPath:](self, "numberOfSubItemsAtIndexPath:", v3);

  while (v4-- >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PUTilingDataSource numberOfSubItemsAtIndexPath:](self, "numberOfSubItemsAtIndexPath:", v6);

    if (v7 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v7 - 1, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return (NSIndexPath *)v8;
    }
  }
  v8 = 0;
  return (NSIndexPath *)v8;
}

- (int64_t)numberOfAssetsWithMaximum:(int64_t)a3
{
  void *v5;
  int64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__PUAssetsDataSource_numberOfAssetsWithMaximum___block_invoke;
  v8[3] = &unk_1E589CFE0;
  v8[4] = &v9;
  v8[5] = a3;
  -[PUTilingDataSource enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](self, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v5, 0, v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (BOOL)couldAssetReferenceAppear:(id)a3
{
  return 1;
}

uint64_t __48__PUAssetsDataSource_numberOfAssetsWithMaximum___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) >= *(_QWORD *)(result + 40))
    *a3 = 1;
  return result;
}

void __40__PUAssetsDataSource_firstItemIndexPath__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __44__PUAssetsDataSource_startingAssetReference__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

@end
