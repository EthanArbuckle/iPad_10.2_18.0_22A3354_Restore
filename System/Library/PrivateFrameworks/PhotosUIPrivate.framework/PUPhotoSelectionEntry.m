@implementation PUPhotoSelectionEntry

- (PUPhotoSelectionEntry)initWithAssetCollection:(id)a3 fetchResult:(id)a4 uniqueSelectedAssets:(id)a5
{
  id v9;
  id v10;
  id v11;
  PUPhotoSelectionEntry *v12;
  PUPhotoSelectionEntry *v13;
  NSMutableSet *v14;
  NSMutableSet *selectedAssets;
  uint64_t v16;
  NSMutableIndexSet *selectedIndexes;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PUPhotoSelectionEntry;
  v12 = -[PUPhotoSelectionEntry init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_assetCollection, a3);
    objc_storeStrong((id *)&v13->_fetchResult, a4);
    if (v11)
    {
      v14 = (NSMutableSet *)v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v14 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    }
    selectedAssets = v13->_selectedAssets;
    v13->_selectedAssets = v14;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v16 = objc_claimAutoreleasedReturnValue();
    selectedIndexes = v13->_selectedIndexes;
    v13->_selectedIndexes = (NSMutableIndexSet *)v16;

  }
  return v13;
}

- (void)_ensureValidAssetIndexes
{
  NSMutableIndexSet *v3;
  NSMutableIndexSet *selectedIndexes;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_hasValidAssetIndexes)
  {
    self->_hasValidAssetIndexes = 1;
    v3 = (NSMutableIndexSet *)objc_opt_new();
    selectedIndexes = self->_selectedIndexes;
    self->_selectedIndexes = v3;

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = self->_selectedAssets;
    v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = -[PHFetchResult indexOfObject:](self->_fetchResult, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
            -[NSMutableIndexSet addIndex:](self->_selectedIndexes, "addIndex:", v10);
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)invalidateAllAssetIndexes
{
  self->_hasValidAssetIndexes = 0;
  -[NSMutableIndexSet removeAllIndexes](self->_selectedIndexes, "removeAllIndexes");
}

- (NSIndexSet)selectedIndexes
{
  -[PUPhotoSelectionEntry _ensureValidAssetIndexes](self, "_ensureValidAssetIndexes");
  return (NSIndexSet *)self->_selectedIndexes;
}

- (NSArray)selectedAssets
{
  id v3;
  NSMutableIndexSet *selectedIndexes;
  id v5;
  NSArray *v6;
  _QWORD v8[4];
  id v9;
  PUPhotoSelectionEntry *v10;

  -[PUPhotoSelectionEntry _ensureValidAssetIndexes](self, "_ensureValidAssetIndexes");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  selectedIndexes = self->_selectedIndexes;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__PUPhotoSelectionEntry_selectedAssets__block_invoke;
  v8[3] = &unk_1E58A7D80;
  v5 = v3;
  v9 = v5;
  v10 = self;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](selectedIndexes, "enumerateIndexesUsingBlock:", v8);
  v6 = (NSArray *)v5;

  return v6;
}

- (void)selectAssetsAtIndexes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUPhotoSelectionEntry _ensureValidAssetIndexes](self, "_ensureValidAssetIndexes");
  -[PHFetchResult objectsAtIndexes:](self->_fetchResult, "objectsAtIndexes:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObjectsFromArray:](self->_selectedAssets, "addObjectsFromArray:", v5);
  -[NSMutableIndexSet addIndexes:](self->_selectedIndexes, "addIndexes:", v4);

}

- (void)deselectAssetsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PUPhotoSelectionEntry _ensureValidAssetIndexes](self, "_ensureValidAssetIndexes");
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[PHFetchResult objectsAtIndexes:](self->_fetchResult, "objectsAtIndexes:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableSet minusSet:](self->_selectedAssets, "minusSet:", v7);
  -[NSMutableIndexSet removeIndexes:](self->_selectedIndexes, "removeIndexes:", v4);

}

- (BOOL)isIndexSelected:(unint64_t)a3
{
  -[PUPhotoSelectionEntry _ensureValidAssetIndexes](self, "_ensureValidAssetIndexes");
  return -[NSMutableIndexSet containsIndex:](self->_selectedIndexes, "containsIndex:", a3);
}

- (void)enumerateSelectedAssetsWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v4 = a3;
  -[PUPhotoSelectionEntry _ensureValidAssetIndexes](self, "_ensureValidAssetIndexes");
  -[PUPhotoSelectionEntry selectedIndexes](self, "selectedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PUPhotoSelectionEntry_enumerateSelectedAssetsWithBlock___block_invoke;
  v7[3] = &unk_1E58A5918;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  v9 = v10;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v7);

  _Block_object_dispose(v10, 8);
}

- (void)handlePhotoLibraryChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PHFetchResult *v12;
  PHFetchResult *fetchResult;
  id v14;

  v4 = a3;
  -[PUPhotoSelectionEntry fetchResult](self, "fetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:", v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v14;
  if (v14)
  {
    if (!objc_msgSend(v14, "hasIncrementalChanges") || objc_msgSend(v14, "hasMoves"))
      -[PUPhotoSelectionEntry invalidateAllAssetIndexes](self, "invalidateAllAssetIndexes");
    v7 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v14, "removedObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_hasValidAssetIndexes)
    {
      objc_msgSend(v14, "removedIndexes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        -[NSMutableIndexSet pl_adjustIndexesForDeletions:](self->_selectedIndexes, "pl_adjustIndexesForDeletions:", v10);
      objc_msgSend(v14, "insertedIndexes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        -[NSMutableIndexSet pl_adjustIndexesForInsertions:](self->_selectedIndexes, "pl_adjustIndexesForInsertions:", v11);

    }
    if (objc_msgSend(v9, "count"))
      -[NSMutableSet minusSet:](self->_selectedAssets, "minusSet:", v9);
    objc_msgSend(v14, "fetchResultAfterChanges");
    v12 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    fetchResult = self->_fetchResult;
    self->_fetchResult = v12;

    v6 = v14;
  }

}

- (void)setSelectedAssetsSet:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *selectedAssets;
  char v6;
  NSMutableSet *v7;

  v4 = (NSMutableSet *)a3;
  selectedAssets = self->_selectedAssets;
  if (selectedAssets != v4)
  {
    v7 = v4;
    v6 = -[NSMutableSet isEqualToSet:](selectedAssets, "isEqualToSet:", v4);
    v4 = v7;
    if ((v6 & 1) == 0)
    {
      -[NSMutableSet setSet:](self->_selectedAssets, "setSet:", v7);
      -[PUPhotoSelectionEntry invalidateAllAssetIndexes](self, "invalidateAllAssetIndexes");
      v4 = v7;
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  PUPhotoSelectionEntry *v5;
  uint64_t v6;
  PHFetchResult *fetchResult;
  uint64_t v8;
  NSMutableSet *selectedAssets;
  uint64_t v10;
  NSMutableIndexSet *selectedIndexes;

  v5 = -[PUPhotoSelectionEntry init](+[PUPhotoSelectionEntry allocWithZone:](PUPhotoSelectionEntry, "allocWithZone:"), "init");
  v5->_hasValidAssetIndexes = self->_hasValidAssetIndexes;
  objc_storeStrong((id *)&v5->_assetCollection, self->_assetCollection);
  v6 = -[PHFetchResult copyWithZone:](self->_fetchResult, "copyWithZone:", a3);
  fetchResult = v5->_fetchResult;
  v5->_fetchResult = (PHFetchResult *)v6;

  v8 = -[NSMutableSet copyWithZone:](self->_selectedAssets, "copyWithZone:", a3);
  selectedAssets = v5->_selectedAssets;
  v5->_selectedAssets = (NSMutableSet *)v8;

  v10 = -[NSMutableIndexSet copyWithZone:](self->_selectedIndexes, "copyWithZone:", a3);
  selectedIndexes = v5->_selectedIndexes;
  v5->_selectedIndexes = (NSMutableIndexSet *)v10;

  return v5;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexes, 0);
  objc_storeStrong((id *)&self->_selectedAssets, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

void __58__PUPhotoSelectionEntry_enumerateSelectedAssetsWithBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "fetchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a3 = 1;

}

void __39__PUPhotoSelectionEntry_selectedAssets__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "objectAtIndex:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
