@implementation PXStoryMemoryFeedDataSourceManager

- (PXStoryMemoryFeedDataSourceManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXStoryMemoryFeedDataSourceManager *v6;
  PXStoryMemoryFeedDataSourceManager *v7;
  void *v8;
  PXLibraryFilterState *v9;
  PXLibraryFilterState *libraryFilterState;
  uint64_t v11;
  PXUpdater *updater;
  PXStoryMemoryFeedDataSourceManager *v13;
  _QWORD v15[4];
  PXStoryMemoryFeedDataSourceManager *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXStoryMemoryFeedDataSourceManager;
  v6 = -[PXSectionedDataSourceManager init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v8);
    libraryFilterState = v7->_libraryFilterState;
    v7->_libraryFilterState = v9;

    v11 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v7, sel__setNeedsUpdate);
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v11;

    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateChildDataSourceManagers);
    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateDataSource);
    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updateHasAnyFavorites);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__PXStoryMemoryFeedDataSourceManager_initWithPhotoLibrary___block_invoke;
    v15[3] = &unk_1E5141988;
    v13 = v7;
    v16 = v13;
    -[PXStoryMemoryFeedDataSourceManager performChanges:](v13, "performChanges:", v15);
    PXRegisterPreferencesObserver(v13);
    -[PXLibraryFilterState registerChangeObserver:context:](v7->_libraryFilterState, "registerChangeObserver:context:", v13, PXLibraryFilterStateObservationContext_263970);

  }
  return v7;
}

- (PXStoryMemoryFeedDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryFeedDataSourceManager.m"), 69, CFSTR("%s is not available as initializer"), "-[PXStoryMemoryFeedDataSourceManager init]");

  abort();
}

- (BOOL)hasAnyMemories
{
  void *v2;
  void *v3;
  char v4;

  -[PXStoryMemoryFeedDataSourceManager allMemoriesDataSourceManager](self, "allMemoriesDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsAnyItems");

  return v4;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryMemoryFeedDataSourceManager;
  -[PXStoryMemoryFeedDataSourceManager performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryMemoryFeedDataSourceManager;
  -[PXStoryMemoryFeedDataSourceManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryMemoryFeedDataSourceManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)setHasAnyFavorites:(BOOL)a3
{
  if (self->_hasAnyFavorites != a3)
  {
    self->_hasAnyFavorites = a3;
    -[PXStoryMemoryFeedDataSourceManager signalChange:](self, "signalChange:", 4);
  }
}

- (void)preferencesDidChange
{
  if ((PLIsFeaturedContentAllowed() & 1) == 0)
    -[PXStoryMemoryFeedDataSourceManager _setDataSourceToEmpty](self, "_setDataSourceToEmpty");
}

- (void)_setDataSourceToEmpty
{
  id v3;

  objc_msgSend(off_1E50B4A10, "emptyDataSource");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSourceManager setDataSource:changeDetailsArray:](self, "setDataSource:changeDetailsArray:", v3, 0);

}

- (id)createInitialDataSource
{
  return (id)objc_msgSend(off_1E50B4A10, "emptyDataSource");
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[PXStoryMemoryFeedDataSourceManager photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_beginPausingChangesWithTimeout:identifier:", v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXStoryMemoryFeedDataSourceManager photoLibrary](self, "photoLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_endPausingChanges:", v4);

}

- (void)setIsActive:(BOOL)a3
{
  void *v4;
  void *v5;

  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXStoryMemoryFeedDataSourceManager signalChange:](self, "signalChange:", 2);
    if (self->_isActive)
    {
      -[PXStoryMemoryFeedDataSourceManager allMemoriesDataSourceManager](self, "allMemoriesDataSourceManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startLoadingIfNeeded");

      -[PXStoryMemoryFeedDataSourceManager favoriteMemoriesDataSourceManager](self, "favoriteMemoriesDataSourceManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startLoadingIfNeeded");

      -[PXStoryMemoryFeedDataSourceManager _invalidateDataSource](self, "_invalidateDataSource");
      -[PXStoryMemoryFeedDataSourceManager _invalidateHasAnyFavorites](self, "_invalidateHasAnyFavorites");
    }
  }
}

- (void)setWantsFavoritesOnly:(BOOL)a3
{
  if (self->_wantsFavoritesOnly != a3)
  {
    self->_wantsFavoritesOnly = a3;
    -[PXStoryMemoryFeedDataSourceManager signalChange:](self, "signalChange:", 8);
    -[PXStoryMemoryFeedDataSourceManager _invalidateDataSource](self, "_invalidateDataSource");
  }
}

- (void)_setNeedsUpdate
{
  -[PXStoryMemoryFeedDataSourceManager signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateChildDataSourceManagers
{
  id v2;

  -[PXStoryMemoryFeedDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateChildDataSourceManagers);

}

- (void)_updateChildDataSourceManagers
{
  PXFetchResultBasedMemoriesDataSourceManager *allMemoriesDataSourceManager;
  void *v4;
  void *v5;
  id v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  PXFetchResultBasedMemoriesDataSourceManager *v20;
  PXFetchResultBasedMemoriesDataSourceManager *v21;
  PXFetchResultBasedMemoriesDataSourceManager *v22;
  PXFetchResultBasedMemoriesDataSourceManager *favoriteMemoriesDataSourceManager;
  _QWORD aBlock[4];
  id v25;
  uint64_t v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  allMemoriesDataSourceManager = self->_allMemoriesDataSourceManager;
  if (allMemoriesDataSourceManager || self->_favoriteMemoriesDataSourceManager)
  {
    -[PXSectionedDataSourceManager unregisterChangeObserver:context:](allMemoriesDataSourceManager, "unregisterChangeObserver:context:", self, AllMemoriesDataSourceManagerObservationContext);
    -[PXSectionedDataSourceManager unregisterChangeObserver:context:](self->_favoriteMemoriesDataSourceManager, "unregisterChangeObserver:context:", self, FavoriteMemoriesDataSourceManagerObservationContext);
  }
  -[PXStoryMemoryFeedDataSourceManager photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PXStoryMemoryFeedDataSourceManager__updateChildDataSourceManagers__block_invoke;
  aBlock[3] = &unk_1E51419B0;
  v25 = v5;
  v6 = v5;
  v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("rejected == NO"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);

  objc_msgSend(v6, "setIncludePendingMemories:", 1);
  objc_msgSend(v6, "setIncludeStoryMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v11);

  v26 = *MEMORY[0x1E0CD1D28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v12);

  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchLimit:", objc_msgSend(v13, "feedInitialLimit"));

  -[PXStoryMemoryFeedDataSourceManager libraryFilterState](self, "libraryFilterState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "viewMode");
  if (v15 == 2)
    v16 = 1;
  else
    v16 = 2 * (v15 != 1);
  objc_msgSend(v6, "setSharingFilter:", v16);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("favorite == YES"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v18);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[PXFetchResultBasedMemoriesDataSourceManager initWithMemoriesFetchResult:]([PXFetchResultBasedMemoriesDataSourceManager alloc], "initWithMemoriesFetchResult:", v17);
  v21 = self->_allMemoriesDataSourceManager;
  self->_allMemoriesDataSourceManager = v20;

  -[PXSectionedDataSourceManager registerChangeObserver:context:](self->_allMemoriesDataSourceManager, "registerChangeObserver:context:", self, AllMemoriesDataSourceManagerObservationContext);
  v22 = -[PXFetchResultBasedMemoriesDataSourceManager initWithMemoriesFetchResult:]([PXFetchResultBasedMemoriesDataSourceManager alloc], "initWithMemoriesFetchResult:", v19);
  favoriteMemoriesDataSourceManager = self->_favoriteMemoriesDataSourceManager;
  self->_favoriteMemoriesDataSourceManager = v22;

  -[PXSectionedDataSourceManager registerChangeObserver:context:](self->_favoriteMemoriesDataSourceManager, "registerChangeObserver:context:", self, FavoriteMemoriesDataSourceManagerObservationContext);
}

- (void)_invalidateDataSource
{
  id v2;

  -[PXStoryMemoryFeedDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDataSource);

}

- (void)_updateDataSource
{
  void *v3;
  _PXStoryMemoryFeedDataSource *v4;
  void *v5;
  _PXStoryMemoryFeedDataSource *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (-[PXStoryMemoryFeedDataSourceManager wantsFavoritesOnly](self, "wantsFavoritesOnly"))
    -[PXStoryMemoryFeedDataSourceManager favoriteMemoriesDataSourceManager](self, "favoriteMemoriesDataSourceManager");
  else
    -[PXStoryMemoryFeedDataSourceManager allMemoriesDataSourceManager](self, "allMemoriesDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [_PXStoryMemoryFeedDataSource alloc];
  objc_msgSend(v3, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_PXStoryMemoryFeedDataSource initWithDataSource:](v4, "initWithDataSource:", v5);

  if ((-[_PXStoryMemoryFeedDataSource isEqual:](v6, "isEqual:", v9) & 1) == 0)
  {
    objc_msgSend(v3, "changeHistory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v9, "identifier"), -[_PXStoryMemoryFeedDataSource identifier](v6, "identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXSectionedDataSourceManager setDataSource:changeDetailsArray:](self, "setDataSource:changeDetailsArray:", v6, v8);
  }

}

- (void)_invalidateHasAnyFavorites
{
  id v2;

  -[PXStoryMemoryFeedDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateHasAnyFavorites);

}

- (void)_updateHasAnyFavorites
{
  void *v3;
  id v4;

  -[PXStoryMemoryFeedDataSourceManager favoriteMemoriesDataSourceManager](self, "favoriteMemoriesDataSourceManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryMemoryFeedDataSourceManager setHasAnyFavorites:](self, "setHasAnyFavorites:", objc_msgSend(v3, "containsAnyItems"));

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PXStoryMemoryFeedDataSourceManager_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E51419D8;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  -[PXStoryMemoryFeedDataSourceManager performChanges:](self, "performChanges:", v5);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)hasAnyFavorites
{
  return self->_hasAnyFavorites;
}

- (BOOL)wantsFavoritesOnly
{
  return self->_wantsFavoritesOnly;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXFetchResultBasedMemoriesDataSourceManager)allMemoriesDataSourceManager
{
  return self->_allMemoriesDataSourceManager;
}

- (PXFetchResultBasedMemoriesDataSourceManager)favoriteMemoriesDataSourceManager
{
  return self->_favoriteMemoriesDataSourceManager;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_favoriteMemoriesDataSourceManager, 0);
  objc_storeStrong((id *)&self->_allMemoriesDataSourceManager, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

void __67__PXStoryMemoryFeedDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 == AllMemoriesDataSourceManagerObservationContext)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v8 = v3;
      objc_msgSend(*(id *)(a1 + 32), "_invalidateDataSource");
LABEL_12:
      v3 = v8;
    }
  }
  else if (v4 == FavoriteMemoriesDataSourceManagerObservationContext)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v6 = *(void **)(a1 + 32);
      v8 = v3;
      goto LABEL_11;
    }
  }
  else
  {
    if (v4 != PXLibraryFilterStateObservationContext_263970)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXStoryMemoryFeedDataSourceManager.m"), 241, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v8 = v3;
      objc_msgSend(*(id *)(a1 + 32), "_invalidateChildDataSourceManagers");
      v5 = objc_msgSend(*(id *)(a1 + 32), "isActive");
      v3 = v8;
      if (v5)
      {
        v6 = *(void **)(a1 + 32);
LABEL_11:
        objc_msgSend(v6, "_invalidateDataSource");
        objc_msgSend(*(id *)(a1 + 32), "_invalidateHasAnyFavorites");
        goto LABEL_12;
      }
    }
  }

}

void __68__PXStoryMemoryFeedDataSourceManager__updateChildDataSourceManagers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3528];
    v9[0] = v4;
    v9[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "andPredicateWithSubpredicates:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPredicate:", v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setPredicate:", v3);
  }

}

uint64_t __59__PXStoryMemoryFeedDataSourceManager_initWithPhotoLibrary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateChildDataSourceManagers");
}

@end
