@implementation PXSwitchableAssetsDataSourceManager

- (PXSwitchableAssetsDataSourceManager)initWithDataSourceManagerByKey:(id)a3 currentKey:(id)a4
{
  id v7;
  id v8;
  PXSwitchableAssetsDataSourceManager *v9;
  uint64_t v10;
  NSDictionary *dataSourceManagerByKey;
  uint64_t v12;
  NSCopying *currentKey;
  id v14;
  void *v15;
  uint64_t v16;
  NSSet *allKeys;
  uint64_t v18;
  PXUpdater *updater;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)PXSwitchableAssetsDataSourceManager;
  v9 = -[PXSectionedDataSourceManager init](&v32, sel_init);
  if (!v9)
    goto LABEL_12;
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PXSwitchableAssetsDataSourceManager.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataSourceManagers.count >= 1"));

    if (v8)
      goto LABEL_4;
LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PXSwitchableAssetsDataSourceManager.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentKey != nil"));

    goto LABEL_4;
  }
  if (!v8)
    goto LABEL_14;
LABEL_4:
  v10 = objc_msgSend(v7, "copy");
  dataSourceManagerByKey = v9->_dataSourceManagerByKey;
  v9->_dataSourceManagerByKey = (NSDictionary *)v10;

  v12 = objc_msgSend(v8, "copyWithZone:", 0);
  currentKey = v9->_currentKey;
  v9->_currentKey = (NSCopying *)v12;

  v14 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v7, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "initWithArray:", v15);
  allKeys = v9->_allKeys;
  v9->_allKeys = (NSSet *)v16;

  v18 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v9, sel__setNeedsUpdate);
  updater = v9->_updater;
  v9->_updater = (PXUpdater *)v18;

  -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateCurrentDataSource);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v7, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v29;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v24++), "registerChangeObserver:context:", v9, PXChildDataSourceManagerObservationContext);
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }

LABEL_12:
  return v9;
}

- (PXSwitchableAssetsDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSwitchableAssetsDataSourceManager.m"), 55, CFSTR("%s is not available as initializer"), "-[PXSwitchableAssetsDataSourceManager init]");

  abort();
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; currentDataSourceManager:%@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)dataSourceManagerForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_dataSourceManagerByKey, "objectForKeyedSubscript:", a3);
}

- (void)setCurrentKey:(id)a3
{
  NSCopying *v5;
  NSCopying *v6;
  NSCopying *v7;
  char v8;
  _QWORD v9[5];
  NSCopying *v10;
  SEL v11;

  v5 = (NSCopying *)a3;
  v6 = self->_currentKey;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[NSCopying isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __53__PXSwitchableAssetsDataSourceManager_setCurrentKey___block_invoke;
      v9[3] = &unk_1E51209D8;
      v9[4] = self;
      v10 = v5;
      v11 = a2;
      -[PXSwitchableAssetsDataSourceManager performChanges:](self, "performChanges:", v9);

    }
  }

}

- (PXPhotosViewLens)currentLens
{
  void *v4;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  -[PXSwitchableAssetsDataSourceManager currentKey](self, "currentKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSwitchableAssetsDataSourceManager.m"), 87, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.currentKey"), v8, v9);

    }
  }
  return (PXPhotosViewLens *)v4;
}

- (BOOL)supportsLens:(id)a3
{
  return -[NSSet containsObject:](self->_allKeys, "containsObject:", a3);
}

- (id)createInitialDataSource
{
  void *v3;
  void *v4;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_currentDataSource, v4);
  return v4;
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  double v16;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__PXSwitchableAssetsDataSourceManager_pauseChangeDeliveryWithTimeout_identifier___block_invoke;
  v13[3] = &unk_1E5120A00;
  v8 = v7;
  v16 = a3;
  v14 = v8;
  v15 = v6;
  v9 = v6;
  -[PXSwitchableAssetsDataSourceManager _enumerateAllDataSourceManagers:](self, "_enumerateAllDataSourceManagers:", v13);
  v10 = v15;
  v11 = v8;

  return v11;
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;
  _QWORD v11[5];

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSwitchableAssetsDataSourceManager.m"), 114, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("token"), v7);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSwitchableAssetsDataSourceManager.m"), 114, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("token"), v7, v9);

    goto LABEL_6;
  }
LABEL_3:
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PXSwitchableAssetsDataSourceManager_resumeChangeDeliveryAndBackgroundLoading___block_invoke;
  v11[3] = &unk_1E5120A28;
  v11[4] = self;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);

}

- (id)sharedLibraryStatusProvider
{
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "sharedLibraryStatusProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (objc_class *)objc_opt_class();
        NSStringFromClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "px_descriptionForAssertionMessage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSwitchableAssetsDataSourceManager.m"), 130, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[(id<_PXStatusProviderWorkaround>)currentDataSourceManager sharedLibraryStatusProvider]"), v8, v9);

      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)localizedEmptyPlaceholderTitle
{
  void *v2;
  void *v3;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedEmptyPlaceholderTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedEmptyPlaceholderAttributedMessage
{
  void *v2;
  void *v3;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedEmptyPlaceholderAttributedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedLoadingInitialDataSourceMessage
{
  void *v2;
  void *v3;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedLoadingInitialDataSourceMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isLoadingInitialDataSource
{
  void *v2;
  char v3;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLoadingInitialDataSource");

  return v3;
}

- (BOOL)isBackgroundFetching
{
  void *v2;
  char v3;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBackgroundFetching");

  return v3;
}

- (BOOL)supportsCurationToggling
{
  void *v2;
  char v3;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsCurationToggling");

  return v3;
}

- (BOOL)supportsFiltering
{
  void *v2;
  char v3;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsFiltering");

  return v3;
}

- (id)filterPredicate
{
  void *v2;
  void *v3;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)includeOthersInSocialGroupAssets
{
  void *v2;
  char v3;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "includeOthersInSocialGroupAssets");

  return v3;
}

- (id)sortDescriptors
{
  void *v2;
  void *v3;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)waitForAvailabilityOfAsset:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "waitForAvailabilityOfAsset:timeout:completionHandler:", v9, v8, a4);

}

- (id)createDataSourceManagerForAssetsInSectionOfAsset:(id)a3 usingNewTransientAssetCollection:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createDataSourceManagerForAssetsInSectionOfAsset:usingNewTransientAssetCollection:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)createDataSourceManagerForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createDataSourceManagerForAsset:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)markContentAsViewed
{
  id v2;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markContentAsViewed");

}

- (void)setCurationEnabledForAllCollections:(BOOL)a3 curationLength:(int64_t)a4 collectionsToDiff:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;

  v6 = a3;
  v8 = a5;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCurationEnabledForAllCollections:curationLength:collectionsToDiff:", v6, a4, v8);

}

- (void)setCurationEnabled:(BOOL)a3 forAssetCollection:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurationEnabled:forAssetCollection:", v4, v6);

}

- (BOOL)forceAccurateAllSectionsIfNeeded
{
  void *v2;
  char v3;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "forceAccurateAllSectionsIfNeeded");

  return v3;
}

- (BOOL)forceAccurateSectionsIfNeeded:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "forceAccurateSectionsIfNeeded:", v4);

  return v6;
}

- (BOOL)forceAccurateSection:(int64_t)a3 andSectionsBeforeAndAfter:(int64_t)a4
{
  void *v6;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "forceAccurateSection:andSectionsBeforeAndAfter:", a3, a4);

  return a4;
}

- (void)ensureLastSectionHasContent
{
  id v2;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ensureLastSectionHasContent");

}

- (void)ensureStartingSectionHasContent
{
  id v2;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ensureStartingSectionHasContent");

}

- (void)setBackgroundFetchOriginSection:(int64_t)a3
{
  id v4;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundFetchOriginSection:", a3);

}

- (int64_t)backgroundFetchOriginSection
{
  void *v2;
  int64_t v3;

  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backgroundFetchOriginSection");

  return v3;
}

- (void)startBackgroundFetchIfNeeded
{
  -[PXSwitchableAssetsDataSourceManager _enumerateAllDataSourceManagers:](self, "_enumerateAllDataSourceManagers:", &__block_literal_global_69683);
}

- (void)forceIncludeAssetsAtIndexPaths:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forceIncludeAssetsAtIndexPaths:", v4);

}

- (void)stopForceIncludingAllAssets
{
  -[PXSwitchableAssetsDataSourceManager _enumerateAllDataSourceManagers:](self, "_enumerateAllDataSourceManagers:", &__block_literal_global_41);
}

- (void)excludeAssetsAtIndexPaths:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "excludeAssetsAtIndexPaths:", v4);

}

- (void)stopExcludingAssets:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopExcludingAssets:", v4);

}

- (void)refreshResultsForAssetCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refreshResultsForAssetCollection:", v4);

}

- (void)setFilterPredicate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilterPredicate:", v4);

}

- (void)setSortDescriptors:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSortDescriptors:", v4);

}

- (void)setFilterPredicate:(id)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilterPredicate:provideIncrementalChangeDetailsForAssetCollections:", v7, v6);

}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeOthersInSocialGroupAssets:", v3);

}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3 provideIncrementalChangeDetailsForAssetCollections:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIncludeOthersInSocialGroupAssets:provideIncrementalChangeDetailsForAssetCollections:", v4, v6);

}

- (void)setFilteringDisabled:(BOOL)a3 forAssetCollection:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilteringDisabled:forAssetCollection:", v4, v6);

}

- (void)setAllowedUUIDs:(id)a3 manualOrderUUIDs:(id)a4 forAssetCollections:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowedUUIDs:manualOrderUUIDs:forAssetCollections:", v10, v9, v8);

}

- (PXAssetsDataSourceManager)currentDataSourceManager
{
  NSDictionary *dataSourceManagerByKey;
  void *v3;
  void *v4;

  dataSourceManagerByKey = self->_dataSourceManagerByKey;
  -[PXSwitchableAssetsDataSourceManager currentKey](self, "currentKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](dataSourceManagerByKey, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXAssetsDataSourceManager *)v4;
}

- (void)_enumerateAllDataSourceManagers:(id)a3
{
  id v4;
  NSDictionary *dataSourceManagerByKey;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  dataSourceManagerByKey = self->_dataSourceManagerByKey;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PXSwitchableAssetsDataSourceManager__enumerateAllDataSourceManagers___block_invoke;
  v7[3] = &unk_1E5120AB0;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](dataSourceManagerByKey, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSwitchableAssetsDataSourceManager;
  -[PXSwitchableAssetsDataSourceManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXSwitchableAssetsDataSourceManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)_setNeedsUpdate
{
  -[PXSwitchableAssetsDataSourceManager signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateCurrentDataSource
{
  id v2;

  -[PXSwitchableAssetsDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentDataSource);

}

- (void)_updateCurrentDataSource
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  -[PXSwitchableAssetsDataSourceManager currentDataSource](self, "currentDataSource");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSwitchableAssetsDataSourceManager setCurrentDataSource:](self, "setCurrentDataSource:", v4);
  -[PXSwitchableAssetsDataSourceManager currentKey](self, "currentKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSwitchableAssetsDataSourceManager setCurrentDataSourceKey:](self, "setCurrentDataSourceKey:", v5);

  v6 = v4;
  v7 = v10;
  if (v10 == v6)
    goto LABEL_4;
  v8 = objc_msgSend(v10, "isEqual:", v6);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v3, "changeHistory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v10, "identifier"), objc_msgSend(v6, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXSectionedDataSourceManager setDataSource:changeDetailsArray:](self, "setDataSource:changeDetailsArray:", v6, v7);
LABEL_4:

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  v9 = a3;
  if ((void *)PXChildDataSourceManagerObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSwitchableAssetsDataSourceManager.m"), 339, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __68__PXSwitchableAssetsDataSourceManager_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E5145F88;
    v12[4] = self;
    -[PXSwitchableAssetsDataSourceManager performChanges:](self, "performChanges:", v12);
  }

}

- (void)assetsDataSourceManagerDidFinishBackgroundFetching:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];

  v4 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __90__PXSwitchableAssetsDataSourceManager_assetsDataSourceManagerDidFinishBackgroundFetching___block_invoke;
    v6[3] = &unk_1E51270B0;
    v6[4] = self;
    -[PXSwitchableAssetsDataSourceManager enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v6);
  }
}

- (void)assetsDataSourceManagerDidFinishLoadingInitialDataSource:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];

  v4 = a3;
  -[PXSwitchableAssetsDataSourceManager currentDataSourceManager](self, "currentDataSourceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __96__PXSwitchableAssetsDataSourceManager_assetsDataSourceManagerDidFinishLoadingInitialDataSource___block_invoke;
    v6[3] = &unk_1E51270B0;
    v6[4] = self;
    -[PXSwitchableAssetsDataSourceManager enumerateObserversUsingBlock:](self, "enumerateObserversUsingBlock:", v6);
  }
}

- (NSCopying)currentKey
{
  return self->_currentKey;
}

- (NSDictionary)dataSourceManagerByKey
{
  return self->_dataSourceManagerByKey;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (NSSet)allKeys
{
  return self->_allKeys;
}

- (NSCopying)currentDataSourceKey
{
  return self->_currentDataSourceKey;
}

- (void)setCurrentDataSourceKey:(id)a3
{
  objc_storeStrong((id *)&self->_currentDataSourceKey, a3);
}

- (PXAssetsDataSource)currentDataSource
{
  return self->_currentDataSource;
}

- (void)setCurrentDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_currentDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_currentDataSourceKey, 0);
  objc_storeStrong((id *)&self->_allKeys, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_dataSourceManagerByKey, 0);
  objc_storeStrong((id *)&self->_currentKey, 0);
}

void __96__PXSwitchableAssetsDataSourceManager_assetsDataSourceManagerDidFinishLoadingInitialDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assetsDataSourceManagerDidFinishLoadingInitialDataSource:", *(_QWORD *)(a1 + 32));

}

void __90__PXSwitchableAssetsDataSourceManager_assetsDataSourceManagerDidFinishBackgroundFetching___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assetsDataSourceManagerDidFinishBackgroundFetching:", *(_QWORD *)(a1 + 32));

}

uint64_t __68__PXSwitchableAssetsDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentDataSource");
}

uint64_t __71__PXSwitchableAssetsDataSourceManager__enumerateAllDataSourceManagers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__PXSwitchableAssetsDataSourceManager_stopForceIncludingAllAssets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "stopForceIncludingAllAssets");
}

uint64_t __67__PXSwitchableAssetsDataSourceManager_startBackgroundFetchIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "startBackgroundFetchIfNeeded");
}

void __80__PXSwitchableAssetsDataSourceManager_resumeChangeDeliveryAndBackgroundLoading___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "dataSourceManagerForKey:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resumeChangeDeliveryAndBackgroundLoading:", v5);

}

void __81__PXSwitchableAssetsDataSourceManager_pauseChangeDeliveryWithTimeout_identifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = *(double *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(a3, "pauseChangeDeliveryWithTimeout:identifier:", v6, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

}

uint64_t __53__PXSwitchableAssetsDataSourceManager_setCurrentKey___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "dataSourceManagerForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PXSwitchableAssetsDataSourceManager.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self dataSourceManagerForKey:currentKey] != nil"));

  }
  v3 = objc_msgSend(*(id *)(a1 + 40), "copyWithZone:", 0);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 168);
  *(_QWORD *)(v4 + 168) = v3;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentDataSource");
}

@end
