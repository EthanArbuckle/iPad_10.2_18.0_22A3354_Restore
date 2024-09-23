@implementation PUPhotoSelectionManager

- (PUPhotoSelectionManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoSelectionManager.m"), 66, CFSTR("Do not use this initializer, use the designated one instead."));

  return 0;
}

- (PUPhotoSelectionManager)initWithOptions:(int64_t)a3
{
  PUPhotoSelectionManager *v4;
  PUPhotoSelectionManager *v5;
  uint64_t v6;
  NSMapTable *selectionEntriesByAssetCollection;
  NSMutableSet *v8;
  NSMutableSet *uniqueAssetSelection;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUPhotoSelectionManager;
  v4 = -[PUPhotoSelectionManager init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    selectionEntriesByAssetCollection = v5->_selectionEntriesByAssetCollection;
    v5->_selectionEntriesByAssetCollection = (NSMapTable *)v6;

    if (-[PUPhotoSelectionManager _shouldUniqueAssets](v5, "_shouldUniqueAssets"))
    {
      v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      uniqueAssetSelection = v5->_uniqueAssetSelection;
      v5->_uniqueAssetSelection = v8;

    }
  }
  return v5;
}

- (void)registerChangeObserver:(id)a3
{
  NSHashTable *changeObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoSelectionManager.m"), 85, CFSTR("%s must be called on the main thread"), "-[PUPhotoSelectionManager registerChangeObserver:]");

  }
  changeObservers = self->_changeObservers;
  if (!changeObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_changeObservers;
    self->_changeObservers = v6;

    changeObservers = self->_changeObservers;
  }
  if (-[NSHashTable containsObject:](changeObservers, "containsObject:", v10))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoSelectionManager.m"), 89, CFSTR("can't register an observer instance more than once: %@"), v10);

  }
  -[NSHashTable addObject:](self->_changeObservers, "addObject:", v10);

}

- (void)unregisterChangeObserver:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoSelectionManager.m"), 94, CFSTR("%s must be called on the main thread"), "-[PUPhotoSelectionManager unregisterChangeObserver:]");

  }
  -[NSHashTable removeObject:](self->_changeObservers, "removeObject:", v6);

}

- (id)_selectionEntryForAssetCollection:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PUPhotoSelectionEntry *v7;
  _BOOL4 v8;
  NSMutableSet *uniqueAssetSelection;
  void *v10;
  NSMutableSet *v11;
  void *v12;
  id WeakRetained;
  id v14;
  void *v15;

  v4 = a4;
  v6 = a3;
  -[NSMapTable objectForKey:](self->_selectionEntriesByAssetCollection, "objectForKey:", v6);
  v7 = (PUPhotoSelectionEntry *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUPhotoSelectionManager _shouldUniqueAssets](self, "_shouldUniqueAssets");
  if (!v7)
  {
    if (v4 || v8)
    {
      if (v8)
        uniqueAssetSelection = self->_uniqueAssetSelection;
      else
        uniqueAssetSelection = 0;
      v10 = (void *)MEMORY[0x1E0CD1570];
      v11 = uniqueAssetSelection;
      objc_msgSend(v10, "fetchOptionsWithPhotoLibrary:orObject:", 0, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      if (WeakRetained)
      {
        v14 = objc_loadWeakRetained((id *)&self->_dataSource);
        objc_msgSend(v14, "assetsInAssetCollection:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v6, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v7 = -[PUPhotoSelectionEntry initWithAssetCollection:fetchResult:uniqueSelectedAssets:]([PUPhotoSelectionEntry alloc], "initWithAssetCollection:fetchResult:uniqueSelectedAssets:", v6, v15, v11);
      -[NSMapTable setObject:forKey:](self->_selectionEntriesByAssetCollection, "setObject:forKey:", v7, v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)selectAssetAtIndex:(unint64_t)a3 inAssetCollection:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[PUPhotoSelectionManager _beginSelectionChange](self, "_beginSelectionChange");
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoSelectionManager selectAssetsAtIndexes:inAssetCollection:](self, "selectAssetsAtIndexes:inAssetCollection:", v7, v6);

  -[PUPhotoSelectionManager _endSelectionChange](self, "_endSelectionChange");
}

- (void)selectAssetsAtIndexes:(id)a3 inAssetCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PUPhotoSelectionManager _beginSelectionChange](self, "_beginSelectionChange");
  -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectAssetsAtIndexes:", v6);
  if (-[PUPhotoSelectionManager _shouldUniqueAssets](self, "_shouldUniqueAssets"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMapTable objectEnumerator](self->_selectionEntriesByAssetCollection, "objectEnumerator", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
          if (v14 != v8)
            objc_msgSend(v14, "invalidateAllAssetIndexes");
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  -[PUPhotoSelectionManager _endSelectionChange](self, "_endSelectionChange");

}

- (void)selectAllAssetsInAssetCollections:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPhotoSelectionManager _beginSelectionChange](self, "_beginSelectionChange");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", v10, 1, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB36B8];
        objc_msgSend(v11, "fetchResult");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "indexSetWithIndexesInRange:", 0, objc_msgSend(v13, "count"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUPhotoSelectionManager selectAssetsAtIndexes:inAssetCollection:](self, "selectAssetsAtIndexes:inAssetCollection:", v14, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[PUPhotoSelectionManager _endSelectionChange](self, "_endSelectionChange");
}

- (void)selectInitialAssetsInAssetCollections:(id)a3
{
  id v4;
  _OWORD v5[4];
  _BYTE v6[128];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v5, 0, sizeof(v5));
  if (objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", v5, v6, 16)
    && !PXDisplayAssetCollectionSharingShouldStartWithAllAssetsSelected())
  {
    -[PUPhotoSelectionManager _selectFirstAssetInAssetCollections:](self, "_selectFirstAssetInAssetCollections:", v4);
  }
  else
  {
    -[PUPhotoSelectionManager selectAllAssetsInAssetCollections:](self, "selectAllAssetsInAssetCollections:", v4);
  }

}

- (void)_selectFirstAssetInAssetCollections:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPhotoSelectionManager _beginSelectionChange](self, "_beginSelectionChange");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", v10, 1, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fetchResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoSelectionManager selectAssetsAtIndexes:inAssetCollection:](self, "selectAssetsAtIndexes:inAssetCollection:", v14, v10);

          goto LABEL_11;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  -[PUPhotoSelectionManager _endSelectionChange](self, "_endSelectionChange");
}

- (void)deselectAssetAtIndex:(unint64_t)a3 inAssetCollection:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  -[PUPhotoSelectionManager _beginSelectionChange](self, "_beginSelectionChange");
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoSelectionManager deselectAssetsAtIndexes:inAssetCollection:](self, "deselectAssetsAtIndexes:inAssetCollection:", v7, v6);

  -[PUPhotoSelectionManager _endSelectionChange](self, "_endSelectionChange");
}

- (void)deselectAssetsAtIndexes:(id)a3 inAssetCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PUPhotoSelectionManager _beginSelectionChange](self, "_beginSelectionChange");
  -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deselectAssetsAtIndexes:", v6);
  if (-[PUPhotoSelectionManager _shouldUniqueAssets](self, "_shouldUniqueAssets"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMapTable objectEnumerator](self->_selectionEntriesByAssetCollection, "objectEnumerator", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
          if (v14 != v8)
            objc_msgSend(v14, "invalidateAllAssetIndexes");
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

  }
  -[PUPhotoSelectionManager _endSelectionChange](self, "_endSelectionChange");

}

- (void)deselectAllAssetsInAssetCollections:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPhotoSelectionManager _beginSelectionChange](self, "_beginSelectionChange");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", v10, 0, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB36B8];
        objc_msgSend(v11, "fetchResult");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "indexSetWithIndexesInRange:", 0, objc_msgSend(v13, "count"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUPhotoSelectionManager deselectAssetsAtIndexes:inAssetCollection:](self, "deselectAssetsAtIndexes:inAssetCollection:", v14, v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  -[PUPhotoSelectionManager _endSelectionChange](self, "_endSelectionChange");
}

- (void)deselectAllAssets
{
  -[PUPhotoSelectionManager _beginSelectionChange](self, "_beginSelectionChange");
  -[NSMapTable removeAllObjects](self->_selectionEntriesByAssetCollection, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_uniqueAssetSelection, "removeAllObjects");
  -[PUPhotoSelectionManager _endSelectionChange](self, "_endSelectionChange");
}

- (BOOL)isAnyAssetSelected
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[PUPhotoSelectionManager _shouldUniqueAssets](self, "_shouldUniqueAssets"))
  {
    LOBYTE(v3) = -[NSMutableSet count](self->_uniqueAssetSelection, "count") != 0;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSMapTable objectEnumerator](self->_selectionEntriesByAssetCollection, "objectEnumerator", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "selectedIndexes");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "count");

          if (v8)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v3;
}

- (BOOL)isAssetAtIndexSelected:(unint64_t)a3 inAssetCollection:(id)a4
{
  void *v5;

  -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "isIndexSelected:", a3);

  return a3;
}

- (BOOL)isAnyAssetSelectedInAssetCollection:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)isAnyAssetSelectedInAssetCollections:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[PUPhotoSelectionManager isAnyAssetSelectedInAssetCollection:](self, "isAnyAssetSelectedInAssetCollection:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)areAllAssetsSelectedInAssetCollection:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 1)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v3, "fetchResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v8 = v7 == v5;
  }

  return v8;
}

- (BOOL)areAllAssetsSelectedInAssetCollections:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(v4);
      if (!-[PUPhotoSelectionManager areAllAssetsSelectedInAssetCollection:](self, "areAllAssetsSelectedInAssetCollection:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11))break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          goto LABEL_3;
        v9 = 1;
        goto LABEL_11;
      }
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (id)selectedAssetIndexesWithAssetCollectionOrdering:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), 0, (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "selectedIndexes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        objc_msgSend(v5, "addObject:", v15);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)enumerateSelectedAssetsWithAssetCollectionOrdering:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id obj;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(obj);
        -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __84__PUPhotoSelectionManager_enumerateSelectedAssetsWithAssetCollectionOrdering_block___block_invoke;
        v13[3] = &unk_1E58A58C8;
        v14 = v7;
        v15 = &v21;
        v16 = &v25;
        objc_msgSend(v11, "enumerateSelectedAssetsWithBlock:", v13);
        if (*((_BYTE *)v26 + 24))
        {

          goto LABEL_11;
        }
        ++*((_DWORD *)v22 + 6);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v29, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

}

- (id)selectedAssetsWithAssetCollectionOrdering:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), 0, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "selectedAssets");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSSet)selectedAssets
{
  void *v3;
  void *v4;

  if (-[PUPhotoSelectionManager _shouldUniqueAssets](self, "_shouldUniqueAssets"))
  {
    v3 = (void *)-[NSMutableSet copy](self->_uniqueAssetSelection, "copy");
  }
  else
  {
    -[PUPhotoSelectionManager orderedSelectedAssets](self, "orderedSelectedAssets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSSet *)v3;
}

- (NSOrderedSet)orderedSelectedAssets
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMapTable objectEnumerator](self->_selectionEntriesByAssetCollection, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "selectedAssets");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSOrderedSet *)v3;
}

- (NSDictionary)selectedAssetsByAssetCollection
{
  NSMapTable *selectionEntriesByAssetCollection;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  selectionEntriesByAssetCollection = self->_selectionEntriesByAssetCollection;
  if (selectionEntriesByAssetCollection && -[NSMapTable count](selectionEntriesByAssetCollection, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSMapTable count](self->_selectionEntriesByAssetCollection, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NSMapTable keyEnumerator](self->_selectionEntriesByAssetCollection, "keyEnumerator", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_selectionEntriesByAssetCollection, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "selectedAssets");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (NSArray)selectedAssetCollections
{
  void *selectionEntriesByAssetCollection;

  selectionEntriesByAssetCollection = self->_selectionEntriesByAssetCollection;
  if (selectionEntriesByAssetCollection)
  {
    selectionEntriesByAssetCollection = (void *)objc_msgSend(selectionEntriesByAssetCollection, "count");
    if (selectionEntriesByAssetCollection)
    {
      NSAllMapTableKeys(self->_selectionEntriesByAssetCollection);
      selectionEntriesByAssetCollection = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return (NSArray *)selectionEntriesByAssetCollection;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  _QWORD v34[4];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[PUPhotoSelectionManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetCollectionsFetchResult");
  v4 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[NSMapTable keyEnumerator](self->_selectionEntriesByAssetCollection, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(v6);
        -[NSMapTable objectForKey:](self->_selectionEntriesByAssetCollection, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fetchResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "assetCollection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v8);
  }

  v31 = (void *)v4;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B790]), "initWithCollectionListFetchResult:options:", v4, 4);
  v30 = v5;
  objc_msgSend(v14, "setExistingAssetCollectionFetchResults:", v5);
  v29 = v14;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B788]), "initWithPhotosDataSourceConfiguration:", v14);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B6F0]), "initWithImmutablePhotosDataSource:withChange:", v15, 0);
  v32 = objc_msgSend(v28, "identifier");
  v33 = objc_alloc_init(MEMORY[0x1E0D7CD48]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[NSMapTable keyEnumerator](self->_selectionEntriesByAssetCollection, "keyEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v37 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j);
        -[NSMapTable objectForKey:](self->_selectionEntriesByAssetCollection, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v15, "sectionForAssetCollection:", v21);
        objc_msgSend(v22, "selectedIndexes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          v25 = v23 == 0x7FFFFFFFFFFFFFFFLL;
        else
          v25 = 1;
        if (!v25)
        {
          v34[0] = MEMORY[0x1E0C809B0];
          v34[1] = 3221225472;
          v34[2] = __44__PUPhotoSelectionManager_selectionSnapshot__block_invoke;
          v34[3] = &unk_1E58A58F0;
          v35 = v22;
          objc_msgSend(v33, "modifyItemIndexSetForDataSourceIdentifier:section:usingBlock:", v32, v23, v34);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v18);
  }

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CD88]), "initWithDataSource:selectedIndexPaths:", v28, v33);
  return (PXSelectionSnapshot *)v26;
}

- (id)localizedSelectionString
{
  void *v2;
  void *v3;
  void *v4;

  -[PUPhotoSelectionManager selectedAssets](self, "selectedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PLLocalizedSelectionMessageForItems();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PXAssetMediaTypeCount)requestAssetsMediaTypeCount
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  PXAssetMediaTypeCount *result;
  id obj;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[PUPhotoSelectionManager selectedAssets](self, "selectedAssets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (v26)
  {
    v25 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        v27 = v3;
        v28 = v7;
        v29 = v6;
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "playbackStyle");
        objc_msgSend(v11, "location");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          v14 = v5 + 1;
        else
          v14 = v5;
        objc_msgSend(v11, "descriptionProperties");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "assetDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        v18 = v17 == 0;
        v6 = v29;
        if (!v18)
          v6 = v29 + 1;
        objc_msgSend(v11, "descriptionProperties");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "accessibilityDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "length");

        v18 = v21 == 0;
        v5 = v14;
        v3 = v27;
        v7 = v28;
        if (!v18)
          v7 = v28 + 1;
        if ((unint64_t)(v12 - 1) < 3)
          ++v9;
        if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 4)
          ++v8;
        if (v12 == 5)
          v3 = v27 + 1;
        if (v12 == 3)
          ++v4;
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v26);
  }

  retstr->var0 = v9;
  retstr->var1 = v8;
  retstr->var2 = v3;
  retstr->var3 = v4;
  retstr->var4 = 0;
  retstr->var5 = v5;
  retstr->var6 = 0;
  retstr->var7 = v6;
  retstr->var8 = v7;
  return result;
}

- (void)handlePhotoLibraryChange:(id)a3
{
  id v4;
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  NSMapTable *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = self->_selectionEntriesByAssetCollection;
  v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v4, "changeDetailsForObject:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "objectWasDeleted"))
        {
          if (!v8)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v8, "addObject:", v11);
        }

      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        -[NSMapTable removeObjectForKey:](self->_selectionEntriesByAssetCollection, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v15);
  }

  if (-[PUPhotoSelectionManager _shouldUniqueAssets](self, "_shouldUniqueAssets"))
    -[PUPhotoSelectionManager invalidateAllAssetIndexes](self, "invalidateAllAssetIndexes");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v18 = self->_selectionEntriesByAssetCollection;
  v19 = -[NSMapTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v25;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v18);
        -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * k), 0, (_QWORD)v24);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handlePhotoLibraryChange:", v4);

      }
      v20 = -[NSMapTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v20);
  }

}

- (void)invalidateAllAssetIndexes
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_selectionEntriesByAssetCollection;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[PUPhotoSelectionManager _selectionEntryForAssetCollection:createIfNeeded:](self, "_selectionEntryForAssetCollection:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), 0, (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invalidateAllAssetIndexes");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_beginSelectionChange
{
  ++self->_selectionChangeCount;
}

- (void)_endSelectionChange
{
  int64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = self->_selectionChangeCount - 1;
  self->_selectionChangeCount = v2;
  if (!v2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[NSHashTable allObjects](self->_changeObservers, "allObjects", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "photoSelectionManagerSelectionDidChange:", self);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (BOOL)_shouldUniqueAssets
{
  return -[PUPhotoSelectionManager options](self, "options") & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NSMapTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id WeakRetained;
  uint64_t v15;
  NSMutableSet *uniqueAssetSelection;
  PUPhotoSelectionManager *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = -[PUPhotoSelectionManager initWithOptions:](+[PUPhotoSelectionManager allocWithZone:](PUPhotoSelectionManager, "allocWithZone:"), "initWithOptions:", self->_options);
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = self->_selectionEntriesByAssetCollection;
  v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_selectionEntriesByAssetCollection, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
        objc_msgSend(v5, "setObject:forKey:", v13, v11);

      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  objc_storeStrong((id *)&v18->_selectionEntriesByAssetCollection, v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_storeWeak((id *)&v18->_dataSource, WeakRetained);

  if (-[PUPhotoSelectionManager _shouldUniqueAssets](v18, "_shouldUniqueAssets"))
  {
    v15 = -[NSMutableSet copy](self->_uniqueAssetSelection, "copy");
    uniqueAssetSelection = v18->_uniqueAssetSelection;
    v18->_uniqueAssetSelection = (NSMutableSet *)v15;

  }
  return v18;
}

- (int64_t)options
{
  return self->_options;
}

- (PHAssetCollectionDataSource)dataSource
{
  return (PHAssetCollectionDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_uniqueAssetSelection, 0);
  objc_storeStrong((id *)&self->_selectionEntriesByAssetCollection, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
}

void __44__PUPhotoSelectionManager_selectionSnapshot__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedIndexes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addIndexes:", v4);

}

uint64_t __84__PUPhotoSelectionManager_enumerateSelectedAssetsWithAssetCollectionOrdering_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;
  return result;
}

@end
