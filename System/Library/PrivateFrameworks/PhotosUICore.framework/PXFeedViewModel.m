@implementation PXFeedViewModel

- (PXFeedViewModel)initWithFeedViewConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  PXFeedViewModel *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  objc_msgSend(v4, "feedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "specManagerWithExtendedTraitCollection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "itemLayoutFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeholderFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "wantsEmbeddedScrollView");
  objc_msgSend(v5, "visibleRectChangeObserver");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PXFeedViewModel initWithDataSourceManager:specManager:itemLayoutFactory:placeholderFactory:wantsEmbeddedScrollView:visibleRectChangeObserver:](self, "initWithDataSourceManager:specManager:itemLayoutFactory:placeholderFactory:wantsEmbeddedScrollView:visibleRectChangeObserver:", v6, v8, v9, v10, v11, v12);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__PXFeedViewModel_PXFeedDataSourceManager__initWithFeedViewConfiguration___block_invoke;
  v16[3] = &unk_1E51375E8;
  v17 = v5;
  v14 = v5;
  -[PXFeedViewModel performChanges:](v13, "performChanges:", v16);

  return v13;
}

void __74__PXFeedViewModel_PXFeedDataSourceManager__initWithFeedViewConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "localizedSubtitle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSubtitle:", v4);

}

- (PXFeedViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXFeedViewModel.m"), 33, CFSTR("%s is not available as initializer"), "-[PXFeedViewModel init]");

  abort();
}

- (PXFeedViewModel)initWithDataSourceManager:(id)a3 specManager:(id)a4 itemLayoutFactory:(id)a5 placeholderFactory:(id)a6 wantsEmbeddedScrollView:(BOOL)a7 visibleRectChangeObserver:(id)a8
{
  id v15;
  id v16;
  id v17;
  PXFeedViewModel *v18;
  PXFeedViewModel *v19;
  id *p_dataSourceManager;
  uint64_t v21;
  PXSectionedChangeDetailsRepository *dataSourceChangeHistory;
  uint64_t v23;
  PXSectionedSelectionManager *selectionManager;
  uint64_t v25;
  id visibleRectChangeObserver;
  uint64_t v27;
  PXUpdater *updater;
  id v30;
  id v31;
  _QWORD v32[4];
  PXFeedViewModel *v33;
  objc_super v34;

  v31 = a3;
  v30 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v34.receiver = self;
  v34.super_class = (Class)PXFeedViewModel;
  v18 = -[PXFeedViewModel init](&v34, sel_init);
  v19 = v18;
  if (v18)
  {
    p_dataSourceManager = (id *)&v18->_dataSourceManager;
    objc_storeStrong((id *)&v18->_dataSourceManager, a3);
    objc_msgSend(*p_dataSourceManager, "registerChangeObserver:context:", v19, DataSourceManagerObservationContext);
    objc_msgSend(*p_dataSourceManager, "changeHistory");
    v21 = objc_claimAutoreleasedReturnValue();
    dataSourceChangeHistory = v19->_dataSourceChangeHistory;
    v19->_dataSourceChangeHistory = (PXSectionedChangeDetailsRepository *)v21;

    v23 = objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", *p_dataSourceManager);
    selectionManager = v19->_selectionManager;
    v19->_selectionManager = (PXSectionedSelectionManager *)v23;

    -[PXSectionedSelectionManager registerChangeObserver:context:](v19->_selectionManager, "registerChangeObserver:context:", v19, SelectionManagerObservationContext);
    objc_storeStrong((id *)&v19->_specManager, a4);
    -[PXFeedViewLayoutSpecManager registerChangeObserver:context:](v19->_specManager, "registerChangeObserver:context:", v19, SpecManagerObservationContext);
    objc_storeStrong((id *)&v19->_itemLayoutFactory, a5);
    objc_storeStrong((id *)&v19->_placeholderFactory, a6);
    objc_storeStrong((id *)&v19->_storyQueue, MEMORY[0x1E0C80D38]);
    v19->_wantsEmbeddedScrollView = a7;
    v25 = objc_msgSend(v17, "copy");
    visibleRectChangeObserver = v19->_visibleRectChangeObserver;
    v19->_visibleRectChangeObserver = (id)v25;

    v27 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v19, sel__setNeedsUpdate);
    updater = v19->_updater;
    v19->_updater = (PXUpdater *)v27;

    -[PXUpdater addUpdateSelector:](v19->_updater, "addUpdateSelector:", sel__updateDataSource);
    -[PXUpdater addUpdateSelector:](v19->_updater, "addUpdateSelector:", sel__updateSelectionSnapshot);
    -[PXUpdater addUpdateSelector:](v19->_updater, "addUpdateSelector:", sel__updateSpec);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __144__PXFeedViewModel_initWithDataSourceManager_specManager_itemLayoutFactory_placeholderFactory_wantsEmbeddedScrollView_visibleRectChangeObserver___block_invoke;
    v32[3] = &unk_1E51479C8;
    v33 = v19;
    -[PXFeedViewModel performChanges:](v33, "performChanges:", v32);

  }
  return v19;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXFeedViewModel;
  -[PXFeedViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXFeedViewModel;
  -[PXFeedViewModel didPerformChanges](&v4, sel_didPerformChanges);
  -[PXFeedViewModel updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)registerAccessoryTapToRadarDiagnosticsProvider:(id)a3
{
  NSHashTable *v4;
  NSHashTable *accessoryTapToRadarDiagnosticsProviders;
  void *v6;
  id v7;

  v7 = a3;
  if (!self->_accessoryTapToRadarDiagnosticsProviders)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    accessoryTapToRadarDiagnosticsProviders = self->_accessoryTapToRadarDiagnosticsProviders;
    self->_accessoryTapToRadarDiagnosticsProviders = v4;

  }
  -[PXFeedViewModel accessoryTapToRadarDiagnosticsProviders](self, "accessoryTapToRadarDiagnosticsProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXFeedViewModel signalChange:](self, "signalChange:", 1);
  }
}

- (void)setActionPerformer:(id)a3
{
  id v4;
  PXFeedViewActionPerformer **p_actionPerformer;
  id WeakRetained;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_actionPerformer = &self->_actionPerformer;
  WeakRetained = objc_loadWeakRetained((id *)p_actionPerformer);

  if (WeakRetained != v4)
  {
    v7 = objc_loadWeakRetained((id *)p_actionPerformer);

    if (v7)
    {
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_loadWeakRetained((id *)p_actionPerformer);
        v10 = 138412290;
        v11 = v9;
        _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "overriding action performer %@", (uint8_t *)&v10, 0xCu);

      }
    }
    objc_storeWeak((id *)p_actionPerformer, v4);
  }

}

- (void)setAssetCollectionActionPerformerDelegate:(id)a3
{
  id v4;
  PXAssetCollectionActionPerformerDelegate **p_assetCollectionActionPerformerDelegate;
  id WeakRetained;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_assetCollectionActionPerformerDelegate = &self->_assetCollectionActionPerformerDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_assetCollectionActionPerformerDelegate);

  if (WeakRetained != v4)
  {
    v7 = objc_loadWeakRetained((id *)p_assetCollectionActionPerformerDelegate);

    if (v7)
    {
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_loadWeakRetained((id *)p_assetCollectionActionPerformerDelegate);
        v10 = 138412290;
        v11 = v9;
        _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "overriding asset collection action performer delegate %@", (uint8_t *)&v10, 0xCu);

      }
    }
    objc_storeWeak((id *)p_assetCollectionActionPerformerDelegate, v4);
  }

}

- (void)setPresentingViewController:(id)a3
{
  id v4;
  PXAnonymousViewController **p_presentingViewController;
  id WeakRetained;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_presentingViewController = &self->_presentingViewController;
  WeakRetained = objc_loadWeakRetained((id *)p_presentingViewController);

  if (WeakRetained != v4)
  {
    v7 = objc_loadWeakRetained((id *)p_presentingViewController);

    if (v7)
    {
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_loadWeakRetained((id *)p_presentingViewController);
        v10 = 138412290;
        v11 = v9;
        _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "overriding presenting view controller %@", (uint8_t *)&v10, 0xCu);

      }
    }
    objc_storeWeak((id *)p_presentingViewController, v4);
  }

}

- (void)setDataSource:(id)a3
{
  PXSectionedDataSource *v5;
  char v6;
  PXSectionedDataSource *v7;

  v7 = (PXSectionedDataSource *)a3;
  v5 = self->_dataSource;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXSectionedDataSource isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dataSource, a3);
      -[PXFeedViewModel signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)setSelectionSnapshot:(id)a3
{
  PXSelectionSnapshot *v5;
  char v6;
  PXSelectionSnapshot *v7;

  v7 = (PXSelectionSnapshot *)a3;
  v5 = self->_selectionSnapshot;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXSelectionSnapshot isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_selectionSnapshot, a3);
      -[PXFeedViewModel signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setSpec:(id)a3
{
  PXFeedViewLayoutSpec *v5;
  char v6;
  PXFeedViewLayoutSpec *v7;

  v7 = (PXFeedViewLayoutSpec *)a3;
  v5 = self->_spec;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXFeedViewLayoutSpec isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      -[PXFeedViewModel signalChange:](self, "signalChange:", 8);
    }
  }

}

- (void)setSubtitle:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *subtitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_subtitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      subtitle = self->_subtitle;
      self->_subtitle = v6;

      -[PXFeedViewModel signalChange:](self, "signalChange:", 16);
    }
  }

}

- (void)_setNeedsUpdate
{
  -[PXFeedViewModel signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateDataSource
{
  id v2;

  -[PXFeedViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDataSource);

}

- (void)_updateDataSource
{
  void *v3;
  id v4;

  -[PXFeedViewModel dataSourceManager](self, "dataSourceManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedViewModel setDataSource:](self, "setDataSource:", v3);

}

- (void)_invalidateSelectionSnapshot
{
  id v2;

  -[PXFeedViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSelectionSnapshot);

}

- (void)_updateSelectionSnapshot
{
  void *v3;
  id v4;

  -[PXFeedViewModel selectionManager](self, "selectionManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedViewModel setSelectionSnapshot:](self, "setSelectionSnapshot:", v3);

}

- (void)_invalidateSpec
{
  id v2;

  -[PXFeedViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSpec);

}

- (void)_updateSpec
{
  void *v3;
  id v4;

  -[PXFeedViewModel specManager](self, "specManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFeedViewModel setSpec:](self, "setSpec:", v3);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  _QWORD v5[8];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__PXFeedViewModel_observable_didChange_context___block_invoke;
  v5[3] = &unk_1E5119100;
  v5[4] = self;
  v5[5] = a5;
  v5[6] = a4;
  v5[7] = a2;
  -[PXFeedViewModel performChanges:](self, "performChanges:", v5);
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PXFeedViewModel isActive](self, "isActive"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("isActive"));

  -[PXFeedViewModel dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("dataSource"));

  -[PXFeedViewModel spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("spec"));

  -[PXFeedViewModel itemLayoutFactory](self, "itemLayoutFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("itemLayoutFactory"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXFeedViewModel accessoryTapToRadarDiagnosticsProviders](self, "accessoryTapToRadarDiagnosticsProviders", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v4, "addSubprovider:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (OS_dispatch_queue)storyQueue
{
  return self->_storyQueue;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (PXSectionedDataSource)dataSource
{
  return self->_dataSource;
}

- (PXSectionedChangeDetailsRepository)dataSourceChangeHistory
{
  return self->_dataSourceChangeHistory;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (PXFeedViewLayoutSpec)spec
{
  return self->_spec;
}

- (PXFeedViewActionPerformer)actionPerformer
{
  return (PXFeedViewActionPerformer *)objc_loadWeakRetained((id *)&self->_actionPerformer);
}

- (PXAssetCollectionActionPerformerDelegate)assetCollectionActionPerformerDelegate
{
  return (PXAssetCollectionActionPerformerDelegate *)objc_loadWeakRetained((id *)&self->_assetCollectionActionPerformerDelegate);
}

- (PXAnonymousViewController)presentingViewController
{
  return (PXAnonymousViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (PXFeedItemLayoutFactory)itemLayoutFactory
{
  return self->_itemLayoutFactory;
}

- (PXFeedPlaceholderFactory)placeholderFactory
{
  return self->_placeholderFactory;
}

- (PXFeedViewLayoutSpecManager)specManager
{
  return self->_specManager;
}

- (BOOL)wantsEmbeddedScrollView
{
  return self->_wantsEmbeddedScrollView;
}

- (id)visibleRectChangeObserver
{
  return self->_visibleRectChangeObserver;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (NSHashTable)accessoryTapToRadarDiagnosticsProviders
{
  return self->_accessoryTapToRadarDiagnosticsProviders;
}

- (PXSectionedDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_accessoryTapToRadarDiagnosticsProviders, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong(&self->_visibleRectChangeObserver, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_placeholderFactory, 0);
  objc_storeStrong((id *)&self->_itemLayoutFactory, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_assetCollectionActionPerformerDelegate);
  objc_destroyWeak((id *)&self->_actionPerformer);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
  objc_storeStrong((id *)&self->_dataSourceChangeHistory, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_storyQueue, 0);
}

void __48__PXFeedViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 == DataSourceManagerObservationContext)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v6 = v3;
      objc_msgSend(*(id *)(a1 + 32), "_invalidateDataSource");
      goto LABEL_10;
    }
  }
  else if (v4 == SelectionManagerObservationContext)
  {
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v6 = v3;
      objc_msgSend(*(id *)(a1 + 32), "_invalidateSelectionSnapshot");
      goto LABEL_10;
    }
  }
  else
  {
    if (v4 != SpecManagerObservationContext)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXFeedViewModel.m"), 204, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    {
      v6 = v3;
      objc_msgSend(*(id *)(a1 + 32), "_invalidateSpec");
LABEL_10:
      v3 = v6;
    }
  }

}

uint64_t __144__PXFeedViewModel_initWithDataSourceManager_specManager_itemLayoutFactory_placeholderFactory_wantsEmbeddedScrollView_visibleRectChangeObserver___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateDataSource");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateSelectionSnapshot");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSpec");
}

@end
