@implementation PXCuratedLibraryViewModel

- (void)setCurrentContentFilterState:(id)a3
{
  PXContentFilterState *v4;
  BOOL v5;
  PXContentFilterState *v6;
  PXContentFilterState *currentContentFilterState;
  PXContentFilterState *v8;

  v8 = (PXContentFilterState *)a3;
  v4 = self->_currentContentFilterState;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXContentFilterState isEqual:](v8, "isEqual:", v4);

    if (!v5)
    {
      v6 = (PXContentFilterState *)-[PXContentFilterState copy](v8, "copy");
      currentContentFilterState = self->_currentContentFilterState;
      self->_currentContentFilterState = v6;

      -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x2000000);
      -[PXCuratedLibraryViewModel _updateFilteringTimeoutObserver](self, "_updateFilteringTimeoutObserver");
      -[PXCuratedLibraryViewModel _invalidateAllowedActions](self, "_invalidateAllowedActions");
      -[PXCuratedLibraryViewModel _invalidateShouldShowEmptyPlaceholder](self, "_invalidateShouldShowEmptyPlaceholder");
    }
  }

}

- (void)_updateCurrentContentFilterState
{
  id v3;

  if (-[PXCuratedLibraryViewModel zoomLevel](self, "zoomLevel") == 4)
  {
    -[PXCuratedLibraryViewModel allPhotosContentFilterState](self, "allPhotosContentFilterState");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryViewModel setCurrentContentFilterState:](self, "setCurrentContentFilterState:", v3);

  }
  else
  {
    -[PXCuratedLibraryViewModel setCurrentContentFilterState:](self, "setCurrentContentFilterState:", 0);
  }
}

- (void)setAspectFitContent:(BOOL)a3
{
  if (self->_aspectFitContent != a3)
  {
    self->_aspectFitContent = a3;
    -[PXCuratedLibraryViewModel _invalidateZoomablePhotosViewModel](self, "_invalidateZoomablePhotosViewModel");
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  uint64_t *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  PXCuratedLibraryViewModel *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  PXCuratedLibraryViewModel *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  PXCuratedLibraryViewModel *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  PXCuratedLibraryViewModel *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  PXCuratedLibraryViewModel *v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];

  v9 = a3;
  v10 = v9;
  if ((void *)PXCuratedLibraryViewModelObserverContext_112114 == a5)
  {
    if ((a4 & 1) != 0)
      -[PXCuratedLibraryViewModel _handleIsSelectingChange](self, "_handleIsSelectingChange");
    if ((a4 & 0x10000) != 0)
    {
      -[PXCuratedLibraryViewModel allowedActions](self, "allowedActions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", CFSTR("PXCuratedLibraryActionNavigateToYearsMonthsOrDays"));

      if ((v13 & 1) == 0)
      {
        v11 = (uint64_t *)&__block_literal_global_224;
        goto LABEL_53;
      }
    }
  }
  else if ((void *)PXCuratedLibraryViewModelZoomablePhotosObserverContext == a5)
  {
    if ((a4 & 1) != 0)
    {
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_2;
      v50[3] = &unk_1E5143468;
      v50[4] = self;
      v11 = v50;
      goto LABEL_53;
    }
  }
  else if ((void *)PXCuratedLibraryViewModelSelectionObserverContext == a5)
  {
    -[PXCuratedLibraryViewModel _handleSelectionManagerChange:](self, "_handleSelectionManagerChange:", a4);
  }
  else if ((void *)PXCuratedLibraryViewModelScrollingSpeedometerObserverContext == a5)
  {
    if ((a4 & 0xA) != 0)
    {
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_3;
      v49[3] = &unk_1E5143468;
      v49[4] = self;
      v11 = v49;
      goto LABEL_53;
    }
  }
  else if ((void *)PXCuratedLibraryViewModelSpecManagerObserverContext == a5)
  {
    if ((a4 & 1) != 0)
      -[PXCuratedLibraryViewModel _handleSpecChange](self, "_handleSpecChange");
  }
  else if ((void *)PXCuratedLibraryViewModelAnalysisStatusObserverContext == a5)
  {
    if ((a4 & 0x20) != 0)
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_4;
      v48[3] = &unk_1E5143468;
      v48[4] = self;
      v11 = v48;
      goto LABEL_53;
    }
  }
  else if ((void *)PXCuratedLibraryViewModelAllPhotosDataSourceManagerObserverContext == a5)
  {
    if ((a4 & 1) != 0)
    {
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_5;
      v47[3] = &unk_1E5143468;
      v47[4] = self;
      v11 = v47;
      goto LABEL_53;
    }
  }
  else if ((void *)PXCuratedLibraryViewModelAssetsDataSourceManagerObserverContext == a5)
  {
    if ((a4 & 2) != 0)
    {
      -[PXCuratedLibraryViewModel selectionManager](self, "selectionManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "performChanges:", &__block_literal_global_225_112115);

      -[PXCuratedLibraryViewModel _invalidateAssetCollectionActionManager](self, "_invalidateAssetCollectionActionManager");
    }
    if ((a4 & 4) != 0)
    {
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_7;
      v46[3] = &unk_1E5143468;
      v46[4] = self;
      v11 = v46;
      goto LABEL_53;
    }
  }
  else if ((void *)PXCuratedLibraryViewModelAssetSelectionTypeObserverContext == a5)
  {
    if ((a4 & 1) != 0)
    {
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_8;
      v44[3] = &unk_1E5127C90;
      v44[4] = self;
      v45 = v9;
      -[PXCuratedLibraryViewModel performChanges:](self, "performChanges:", v44);

    }
  }
  else if ((void *)PXSharedLibrarySharingSuggestionsCountsManagerObservationContext == a5)
  {
    if ((a4 & 0xA) != 0)
    {
      v39 = MEMORY[0x1E0C809B0];
      v40 = 3221225472;
      v41 = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_9;
      v42 = &unk_1E5143468;
      v43 = self;
      v11 = &v39;
      goto LABEL_53;
    }
  }
  else if ((void *)PXPhotosSortOrderStateObservationContext == a5)
  {
    if ((a4 & 1) != 0)
    {
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_10;
      v37 = &unk_1E5143468;
      v38 = self;
      v11 = &v34;
      goto LABEL_53;
    }
  }
  else if ((void *)PXSharedLibraryCameraSharingBannerStatusProviderObservationContext == a5)
  {
    if ((a4 & 1) != 0)
    {
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_11;
      v32 = &unk_1E5143468;
      v33 = self;
      v11 = &v29;
      goto LABEL_53;
    }
  }
  else if ((void *)PXSharedLibraryStatusProviderObservationContext_112116 == a5)
  {
    if ((a4 & 3) != 0)
    {
      if ((a4 & 1) != 0)
      {
        -[PXCuratedLibraryViewModel sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "hasSharedLibraryOrPreview"))
          v15 = 2;
        else
          v15 = 0;

      }
      else
      {
        v15 = 0;
      }
      -[PXCuratedLibraryViewModel libraryFilterState](self, "libraryFilterState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setViewMode:", v15);

      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_12;
      v27 = &unk_1E5143468;
      v28 = self;
      v11 = &v24;
      goto LABEL_53;
    }
  }
  else
  {
    if ((void *)PXLibraryFilterStateObservationContext_112117 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryViewModel.m"), 1538, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((a4 & 1) != 0)
    {
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_13;
      v22 = &unk_1E5143468;
      v23 = self;
      v11 = &v19;
LABEL_53:
      -[PXCuratedLibraryViewModel performChanges:](self, "performChanges:", v11, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        v41,
        v42,
        v43);
    }
  }

}

- (BOOL)hideStatusFooterInSelectMode
{
  return self->_hideStatusFooterInSelectMode;
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLibraryState");
}

- (void)_handleSelectionManagerChange:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__PXCuratedLibraryViewModel__handleSelectionManagerChange___block_invoke;
  v3[3] = &unk_1E5127DD0;
  v3[4] = self;
  v3[5] = a3;
  -[PXCuratedLibraryViewModel performChanges:](self, "performChanges:", v3);
}

- (void)setIsAppearing:(BOOL)a3
{
  if (self->_isAppearing != a3)
  {
    self->_isAppearing = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 256);
  }
}

- (void)_handleSpecChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__PXCuratedLibraryViewModel__handleSpecChange__block_invoke;
  v2[3] = &unk_1E5143468;
  v2[4] = self;
  -[PXCuratedLibraryViewModel performChanges:](self, "performChanges:", v2);
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __51__PXCuratedLibraryViewModel_performInitialChanges___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_BYTE *)(v2 + 167);
  *(_BYTE *)(v2 + 167) = 1;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 167) = v3;
  return result;
}

- (void)setZoomLevel:(int64_t)a3
{
  int64_t zoomLevel;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  zoomLevel = self->_zoomLevel;
  if (zoomLevel != a3)
  {
    self->_zoomLevel = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 4);
    -[PXCuratedLibraryViewModel _invalidateAssetsDataSourceManager](self, "_invalidateAssetsDataSourceManager");
    -[PXCuratedLibraryViewModel _invalidateAllowedActions](self, "_invalidateAllowedActions");
    -[PXCuratedLibraryViewModel _invalidateCurrentContentFilterState](self, "_invalidateCurrentContentFilterState");
    if (!-[PXCuratedLibraryViewModel isPerformingInitialChanges](self, "isPerformingInitialChanges"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCuratedLibraryZoomLevel:", v6);

    }
    if (a3 == 4 && (unint64_t)(zoomLevel - 1) <= 1)
    {
      -[PXCuratedLibraryViewModel zoomablePhotosViewModel](self, "zoomablePhotosViewModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isDisplayingIndividualItems");

      if ((v9 & 1) == 0)
      {
        -[PXCuratedLibraryViewModel zoomablePhotosViewModel](self, "zoomablePhotosViewModel");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "performChanges:", &__block_literal_global_112171);

      }
    }
  }
}

- (void)setWantsDarkStatusBar:(BOOL)a3
{
  if (self->_wantsDarkStatusBar != a3)
  {
    self->_wantsDarkStatusBar = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x1000000);
  }
}

- (void)setIsSelecting:(BOOL)a3
{
  if (self->_isSelecting != a3)
  {
    self->_isSelecting = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 1);
    -[PXCuratedLibraryViewModel _invalidateAssetActionManager](self, "_invalidateAssetActionManager");
    -[PXCuratedLibraryViewModel _invalidateAllowedActions](self, "_invalidateAllowedActions");
    -[PXCuratedLibraryViewModel _invalidateChromeVisibility](self, "_invalidateChromeVisibility");
    -[PXCuratedLibraryViewModel _invalidateZoomablePhotosViewModel](self, "_invalidateZoomablePhotosViewModel");
    -[PXCuratedLibraryViewModel _invalidateIsModalInPresentation](self, "_invalidateIsModalInPresentation");
  }
}

- (void)addView:(id)a3
{
  -[NSHashTable addObject:](self->_views, "addObject:", a3);
  -[PXCuratedLibraryViewModel _invalidateScrollingSpeedometer](self, "_invalidateScrollingSpeedometer");
}

- (void)addPresenter:(id)a3
{
  -[NSHashTable addObject:](self->_presenters, "addObject:", a3);
}

- (void)_invalidateScrollingSpeedometer
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateScrollingSpeedometer);

}

- (void)_invalidateAssetCollectionActionManager
{
  PXAssetCollectionActionManager *assetCollectionActionManager;

  assetCollectionActionManager = self->_assetCollectionActionManager;
  self->_assetCollectionActionManager = 0;

}

- (PXCuratedLibraryActionManager)actionManager
{
  return self->_actionManager;
}

- (void)_invalidateAssetActionManager
{
  void *v3;
  PXAssetActionManager *v4;
  PXAssetActionManager *assetActionManager;
  id v6;

  -[PXCuratedLibraryViewModel assetActionManager](self, "assetActionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allowedActionTypes");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryViewModel _assetActionManagerWithAllowedActionTypes:](self, "_assetActionManagerWithAllowedActionTypes:", v6);
  v4 = (PXAssetActionManager *)objc_claimAutoreleasedReturnValue();
  assetActionManager = self->_assetActionManager;
  self->_assetActionManager = v4;

}

- (PXAssetActionManager)assetActionManager
{
  PXAssetActionManager *assetActionManager;
  PXAssetActionManager *v4;
  PXAssetActionManager *v5;

  assetActionManager = self->_assetActionManager;
  if (!assetActionManager)
  {
    -[PXCuratedLibraryViewModel _assetActionManagerWithAllowedActionTypes:](self, "_assetActionManagerWithAllowedActionTypes:", 0);
    v4 = (PXAssetActionManager *)objc_claimAutoreleasedReturnValue();
    v5 = self->_assetActionManager;
    self->_assetActionManager = v4;

    assetActionManager = self->_assetActionManager;
  }
  return assetActionManager;
}

- (id)_assetActionManagerWithAllowedActionTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXPhotoKitAssetActionManager *v8;

  v4 = a3;
  -[PXCuratedLibraryViewModel assetsDataSourceManager](self, "assetsDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentPhotoKitAssetsDataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryViewModel selectionManager](self, "selectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXPhotoKitAssetActionManager initWithSelectionManager:]([PXPhotoKitAssetActionManager alloc], "initWithSelectionManager:", v7);
  -[PXPhotoKitAssetActionManager setDataSourceManager:](v8, "setDataSourceManager:", v6);
  -[PXActionManager setAllowedActionTypes:](v8, "setAllowedActionTypes:", v4);

  return v8;
}

- (void)_updateCurrentDataSource
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PXCuratedLibraryViewModel assetsDataSourceManager](self, "assetsDataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryViewModel selectionManager](self, "selectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqual:", v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryViewModel.m"), 874, CFSTR("Expected selection manager's data source to match assetsDataSourceManager.dataSource!"));

  }
  -[PXCuratedLibraryViewModel setCurrentDataSource:](self, "setCurrentDataSource:", v9);

}

- (void)_updateLibraryState
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  char v6;
  unint64_t v7;
  id v8;

  -[PXCuratedLibraryViewModel assetsDataSourceManager](self, "assetsDataSourceManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = -[PXCuratedLibraryViewModel zoomLevel](self, "zoomLevel") - 1;
  v5 = 1;
  do
  {
    if (v4 == v3 || v3 == 3)
    {
      v6 = objc_msgSend(v8, "libraryStateForZoomLevel:", v3 + 1);
      v7 = v5 & 0xFFFFFFFFFFFFFFFELL;
      if ((v6 & 1) != 0)
        v7 = v5;
      v5 = v7 | v6 & 2;
    }
    ++v3;
  }
  while (v3 != 4);
  -[PXCuratedLibraryViewModel setLibraryState:](self, "setLibraryState:", v5);

}

- (PXCuratedLibraryAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (void)setLibraryState:(unint64_t)a3
{
  if (self->_libraryState != a3)
  {
    self->_libraryState = a3;
    -[PXCuratedLibraryViewModel _invalidateChromeVisibility](self, "_invalidateChromeVisibility");
    -[PXCuratedLibraryViewModel _invalidateShouldShowEmptyPlaceholder](self, "_invalidateShouldShowEmptyPlaceholder");
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 64);
  }
}

- (void)setCurrentDataSource:(id)a3
{
  PXAssetsDataSource *v5;
  PXAssetsDataSource *v6;

  v5 = (PXAssetsDataSource *)a3;
  if (self->_currentDataSource != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentDataSource, a3);
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 16);
    -[PXCuratedLibraryViewModel _invalidateDraggedAssetReferences](self, "_invalidateDraggedAssetReferences");
    -[PXCuratedLibraryViewModel _invalidateAllowedActions](self, "_invalidateAllowedActions");
    v5 = v6;
  }

}

- (void)_invalidateAllowedActions
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAllowedActions);

}

- (void)_invalidateDraggedAssetReferences
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDraggedAssetReferences);

}

uint64_t __46__PXCuratedLibraryViewModel__handleSpecChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateUserWantsAspectFitContent");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateChromeVisibility");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllowedActions");
}

- (void)_invalidateChromeVisibility
{
  -[PXCuratedLibraryViewModel _invalidateChromeVisibilityWithChangeReason:](self, "_invalidateChromeVisibilityWithChangeReason:", 0);
}

- (void)_invalidateChromeVisibilityWithChangeReason:(int64_t)a3
{
  id v3;

  if (a3)
    self->_pendingChromeVisibilityChangeReason = a3;
  -[PXCuratedLibraryViewModel updater](self, "updater");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateOf:", sel__updateChromeVisibility);

}

- (void)_invalidateUserWantsAspectFitContent
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateUserWantsAspectFitContent);

}

- (id)curatedLibraryAssetsDataSourceManager:(id)a3 dominantAssetCollectionReferenceForZoomLevel:(int64_t)a4
{
  void *v6;
  void *v7;

  -[PXCuratedLibraryViewModel mainPresenter](self, "mainPresenter", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel:dominantAssetCollectionReferenceForZoomLevel:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  void *v2;
  void *v3;

  -[PXCuratedLibraryViewModel selectionManager](self, "selectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXSelectionSnapshot *)v3;
}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryViewModel;
  -[PXCuratedLibraryViewModel didPerformChanges](&v4, sel_didPerformChanges);
  -[PXCuratedLibraryViewModel updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)_updateDraggedAssetReferences
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryViewModel currentDataSource](self, "currentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXCuratedLibraryViewModel draggedAssetReferences](self, "draggedAssetReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "assetReferenceForAssetReference:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__PXCuratedLibraryViewModel__updateDraggedAssetReferences__block_invoke;
  v12[3] = &unk_1E5143468;
  v13 = v4;
  v11 = v4;
  -[PXCuratedLibraryViewModel performChanges:](self, "performChanges:", v12);

}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryViewModel;
  -[PXCuratedLibraryViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (NSSet)draggedAssetReferences
{
  return self->_draggedAssetReferences;
}

- (PXAssetsDataSource)currentDataSource
{
  return self->_currentDataSource;
}

- (NSSet)allowedActions
{
  return self->_allowedActions;
}

- (PXContentFilterState)currentContentFilterState
{
  return self->_currentContentFilterState;
}

- (PXCuratedLibraryStyleGuide)styleGuide
{
  return self->_styleGuide;
}

- (BOOL)wantsSecondaryToolbarVisible
{
  return self->_wantsSecondaryToolbarVisible;
}

- (void)_updateChromeVisibility
{
  void *v3;
  char v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  _BOOL8 v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  -[PXCuratedLibraryViewModel specManager](self, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[PXCuratedLibraryViewModel libraryState](self, "libraryState");
  if (objc_msgSend(v14, "userInterfaceIdiom") != 4)
  {
    v9 = -[PXCuratedLibraryViewModel isSelecting](self, "isSelecting");
    v10 = objc_msgSend(v14, "layoutOrientation");
    v11 = objc_msgSend(v14, "sizeClass");
    v12 = v11;
    if ((v4 & 2) != 0)
    {
      if (v9)
      {
        v8 = 0;
        v6 = 0;
        v7 = 1;
      }
      else
      {
        v7 = 0;
        v8 = 1;
        if (v10 == 2)
        {
          v6 = 1;
          if (v11 == 1)
          {
            v6 = -[PXCuratedLibraryViewModel wantsOptionalChromeVisible](self, "wantsOptionalChromeVisible");
            v7 = 0;
          }
        }
        else
        {
          v6 = 1;
        }
      }
    }
    else
    {
      v8 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
      v7 = 0;
      v6 = 1;
      if (v12 != 1)
        goto LABEL_13;
    }
    -[PXCuratedLibraryViewModel bannerViewConfiguration](self, "bannerViewConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_14;
LABEL_13:
    -[PXCuratedLibraryViewModel configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v13, "enableNavigationHeader");

    goto LABEL_14;
  }
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
LABEL_14:
  -[PXCuratedLibraryViewModel setWantsNavigationBarVisible:](self, "setWantsNavigationBarVisible:", v5);
  -[PXCuratedLibraryViewModel setWantsTabBarVisible:](self, "setWantsTabBarVisible:", v6);
  -[PXCuratedLibraryViewModel setWantsToolbarVisible:](self, "setWantsToolbarVisible:", v7);
  -[PXCuratedLibraryViewModel setWantsSecondaryToolbarVisible:](self, "setWantsSecondaryToolbarVisible:", v8);
  self->_lastChromeVisibilityChangeReason = self->_pendingChromeVisibilityChangeReason;
  self->_pendingChromeVisibilityChangeReason = 0;

}

- (unint64_t)libraryState
{
  return self->_libraryState;
}

- (void)_updateAllowedActions
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  int v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  void *v27;
  int v28;
  _BOOL8 v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  char v33;
  _BOOL4 v35;
  _BOOL4 v37;
  _BOOL4 v40;
  void *v41;
  uint64_t v42;
  _BOOL8 v43;
  _BOOL4 v44;
  uint64_t v45;
  _BOOL4 v46;
  unsigned int v47;
  BOOL v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  unsigned int v52;
  _BOOL4 v53;
  _BOOL8 v54;
  void *v55;
  void (**v56)(void *, _QWORD, const __CFString *);
  unsigned int v57;
  _BOOL4 v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  _BOOL4 v64;
  uint64_t v65;
  unsigned int v66;
  int v67;
  unsigned int v68;
  uint64_t v69;
  _BOOL4 v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  _BOOL4 v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD aBlock[4];
  id v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  uint64_t v92;

  v3 = -[PXCuratedLibraryViewModel zoomLevel](self, "zoomLevel");
  v92 = 0;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  -[PXCuratedLibraryViewModel zoomablePhotosViewModel](self, "zoomablePhotosViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "zoomState");
  }
  else
  {
    v92 = 0;
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
  }

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryViewModel zoomablePhotosViewModel](self, "zoomablePhotosViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryViewModel specManager](self, "specManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PXCuratedLibraryViewModel isSelecting](self, "isSelecting");
  v82 = v7;
  v11 = objc_msgSend(v7, "isDisplayingIndividualItems");
  v12 = objc_msgSend(v9, "userInterfaceIdiom");
  v73 = objc_msgSend(v9, "userInterfaceIdiom");
  v75 = objc_msgSend(v9, "userInterfaceIdiom");
  v65 = objc_msgSend(v9, "sizeClass");
  v13 = -[PXCuratedLibraryViewModel shouldShowEmptyPlaceholder](self, "shouldShowEmptyPlaceholder");
  -[PXCuratedLibraryViewModel analysisStatus](self, "analysisStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v9;
  if ((objc_msgSend(v14, "isDaysMonthsYearsStructureEnabled") & 1) != 0
    || +[PXCuratedLibrarySettings enableEmptyYearsMonthsDaysForTesting](PXCuratedLibrarySettings, "enableEmptyYearsMonthsDaysForTesting"))
  {
    -[PXCuratedLibraryViewModel currentContentFilterState](self, "currentContentFilterState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_msgSend(v15, "isFiltering") | v13) ^ 1;

  }
  else
  {
    v16 = 0;
  }

  -[PXCuratedLibraryViewModel sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasSharedLibraryOrPreview");

  v81 = v6;
  v79 = v16;
  if (objc_msgSend(v6, "enableNewActionMenu"))
  {
    if (v3 == 4)
    {
      v57 = objc_msgSend(v6, "enableContentFiltering");
      v67 = 1;
      v59 = 1;
      v19 = 1;
      goto LABEL_23;
    }
    if (v3 == 3)
    {
      v57 = 0;
      v59 = 0;
      v19 = 0;
      v67 = !v10;
      goto LABEL_23;
    }
    if (v3 != 1)
    {
      -[PXCuratedLibraryViewModel skimmingInfo](self, "skimmingInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v20, "touchInteractionStarted") ^ 1;

      goto LABEL_22;
    }
    goto LABEL_12;
  }
  if (v3 == 1)
  {
LABEL_12:
    v67 = 0;
    goto LABEL_22;
  }
  if (v10)
  {
    v67 = 0;
  }
  else
  {
    -[PXCuratedLibraryViewModel skimmingInfo](self, "skimmingInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v21, "touchInteractionStarted") ^ 1;

  }
  if (v3 == 4)
  {
    v19 = 0;
    v57 = objc_msgSend(v6, "enableContentFiltering");
    v59 = v57;
    goto LABEL_23;
  }
LABEL_22:
  v57 = 0;
  v59 = 0;
  v19 = 0;
LABEL_23:
  if (v3 == 4)
    v22 = v11;
  else
    v22 = 0;
  if (v3 == 3)
    v22 = 1;
  v23 = v22 & ~v10;
  if (v12 == 4)
    v24 = 0;
  else
    v24 = v23;
  v77 = v24;
  if (v10)
  {
    v25 = 0;
  }
  else
  {
    if (v3 == 4)
      v25 = v11;
    else
      v25 = 1;
    if (v3 == 4)
      v26 = v11;
    else
      v26 = 0;
    if (v26 == 1)
    {
      v58 = (uint64_t)v88 > 1;
LABEL_43:
      v71 = v25;
      if (-[PXCuratedLibraryViewModel isExpanded](self, "isExpanded"))
      {
        -[PXCuratedLibraryViewModel currentDataSource](self, "currentDataSource");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "containsAnyItems");

        v69 = *((_QWORD *)&v88 + 1);
        v29 = v10;
        if (v28)
        {
          objc_msgSend(v82, "allowedColumns");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = *((_QWORD *)&v88 + 1) + 1 < (unint64_t)objc_msgSend(v30, "count");

          v32 = 1;
        }
        else
        {
          v32 = 0;
          v31 = 0;
        }
      }
      else
      {
        v29 = v10;
        v32 = 0;
        v31 = 0;
        v69 = *((_QWORD *)&v88 + 1);
      }
      v62 = (v12 != 4) & ~((v3 == 4) ^ (v3 == 1));
LABEL_68:
      v40 = v3 == 4 && v12 != 4 || v3 == 1;
      v60 = v31;
      v61 = v40;
      v31 = 0;
      goto LABEL_78;
    }
  }
  if (v3 == 4)
  {
    v58 = 0;
    goto LABEL_43;
  }
  v33 = v3 != 3 || v10;
  v71 = v25;
  v69 = *((_QWORD *)&v88 + 1);
  if ((v33 & 1) != 0)
  {
    v31 = 0;
    v35 = v3 != 1 && v12 != 4;
    v62 = v35;
    v29 = v10;
    if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v60 = 0;
      v61 = 1;
      v32 = 0;
      v58 = 0;
      goto LABEL_78;
    }
    v32 = 0;
    v58 = 0;
    goto LABEL_68;
  }
  v29 = v10;
  v31 = objc_msgSend(v83, "enableShowAllButtons");
  v32 = 0;
  v58 = 0;
  v37 = v3 != 1 && v12 != 4;
  v62 = v37;
  v60 = 0;
  v61 = 1;
LABEL_78:
  v78 = v31;
  if (v12 == 4)
  {
    v63 = 0;
  }
  else
  {
    +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v41, "canShowInternalUI");

  }
  v42 = v75;
  v43 = 0;
  if (v73 == 2 && v65 != 1)
    v43 = -[PXCuratedLibraryViewModel sidebarCanBecomeVisible](self, "sidebarCanBecomeVisible");
  v44 = v3 != 1 && !v29;
  if ((unint64_t)(v3 - 1) < 2)
    v45 = v29 ^ 1;
  else
    v45 = 0;
  v46 = v3 == 3 && v29;
  if (v3 == 3)
    v47 = 0;
  else
    v47 = v67 | v18;
  if (v12 == 4)
    v46 = 0;
  v64 = v46;
  v48 = v75 == 5;
  v76 = v75 == 5;
  if (v42 == 5)
    v49 = v47;
  else
    v49 = v67 | v18;
  v50 = v71;
  if (v48)
    v50 = 0;
  v66 = v50;
  v51 = v32;
  if (v69 > 0)
    v52 = v32;
  else
    v52 = 0;
  v72 = v52;
  v68 = v44 & v79;
  v53 = v3 != 4 && !v29;
  v70 = v53;
  v54 = v43;
  v55 = (void *)objc_opt_new();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PXCuratedLibraryViewModel__updateAllowedActions__block_invoke;
  aBlock[3] = &unk_1E5127B80;
  v85 = v55;
  v74 = v55;
  v56 = (void (**)(void *, _QWORD, const __CFString *))_Block_copy(aBlock);
  v56[2](v56, v49, CFSTR("PXCuratedLibraryActionEllipsisButton"));
  v56[2](v56, v18, CFSTR("PXCuratedLibraryActionSetAllLibrariesFilter"));
  v56[2](v56, v18, CFSTR("PXCuratedLibraryActionSetPersonalLibraryFilter"));
  v56[2](v56, v18, CFSTR("PXCuratedLibraryActionSetSharedLibraryFilter"));
  v56[2](v56, v18, CFSTR("PXCuratedLibraryActionToggleSharedLibraryBadge"));
  v56[2](v56, v57, CFSTR("PXCuratedLibraryActionShowFiltersMenu"));
  v56[2](v56, v57, CFSTR("PXCuratedLibraryActionShowFilters"));
  v56[2](v56, v57, CFSTR("PXCuratedLibraryActionUnfilter"));
  v56[2](v56, v19, CFSTR("PXCuratedLibraryActionToggleFavoriteFilter"));
  v56[2](v56, v19, CFSTR("PXCuratedLibraryActionToggleEditFilter"));
  v56[2](v56, v19, CFSTR("PXCuratedLibraryActionToggleImageFilter"));
  v56[2](v56, v19, CFSTR("PXCuratedLibraryActionToggleVideoFilter"));
  v56[2](v56, v59, CFSTR("PXCuratedLibraryActionToggleShowOnlyScreenshotFilter"));
  v56[2](v56, v59, CFSTR("PXCuratedLibraryActionToggleIncludeScreenshotFilter"));
  v56[2](v56, v59, CFSTR("PXCuratedLibraryActionToggleIncludeSharedWithYouFilter"));
  v56[2](v56, v19, CFSTR("PXCuratedLibraryActionToggleLiveFilter"));
  v56[2](v56, v19, CFSTR("PXCuratedLibraryActionTogglePortraitFilter"));
  v56[2](v56, v77, CFSTR("PXCuratedLibraryActionEnterSelectMode"));
  ((void (**)(void *, _BOOL4, const __CFString *))v56)[2](v56, v64, CFSTR("PXCuratedLibraryActionSelectAllToggle"));
  v56[2](v56, v29, CFSTR("PXCuratedLibraryActionCancelSelectMode"));
  v56[2](v56, v66, CFSTR("PXCuratedLibraryActionNavigateToOneUp"));
  v56[2](v56, v68, CFSTR("PXCuratedLibraryActionNavigateToPreviousZoomLevel"));
  v56[2](v56, v45 & v79, CFSTR("PXCuratedLibraryActionNavigateToNextZoomLevel"));
  ((void (**)(void *, _BOOL4, const __CFString *))v56)[2](v56, v70, CFSTR("PXCuratedLibraryActionPinchToSwitchZoomLevel"));
  v56[2](v56, v45, CFSTR("PXCuratedLibraryActionSkim"));
  v56[2](v56, v51, CFSTR("PXCuratedLibraryActionAllPhotosInteractiveZoom"));
  ((void (**)(void *, _BOOL4, const __CFString *))v56)[2](v56, v58, CFSTR("PXCuratedLibraryActionAllPhotosToggleAspectFit"));
  v56[2](v56, v72, CFSTR("PXCuratedLibraryActionAllPhotosZoomIn"));
  v56[2](v56, v60, CFSTR("PXCuratedLibraryActionAllPhotosZoomOut"));
  v56[2](v56, 1, CFSTR("PXCuratedLibraryActionDropInFromDrag"));
  v56[2](v56, v78, CFSTR("PXCuratedLibraryActionShowAll"));
  v56[2](v56, v62, CFSTR("PXCuratedLibraryActionShare"));
  v56[2](v56, v79, CFSTR("PXCuratedLibraryActionNavigateToYearsMonthsOrDays"));
  v56[2](v56, v61, CFSTR("PXCuratedLibraryActionShowMap"));
  v56[2](v56, v63, CFSTR("PXCuratedLibraryActionTapToRadar"));
  v56[2](v56, v63, CFSTR("PXCuratedLibraryActionCurationDebug"));
  v56[2](v56, v54, CFSTR("PXCuratedLibraryActionShowSidebar"));
  ((void (**)(void *, _BOOL4, const __CFString *))v56)[2](v56, v76, CFSTR("PXCuratedLibraryActionNavigateToAssetReference"));
  v56[2](v56, 0, CFSTR("PXCuratedLibraryActionHover"));
  -[PXCuratedLibraryViewModel setAllowedActions:](self, "setAllowedActions:", v74);

}

uint64_t __50__PXCuratedLibraryViewModel__updateAllowedActions__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:");
  return result;
}

- (BOOL)isSelecting
{
  return self->_isSelecting;
}

- (PXCuratedLibraryLayoutSpecManager)specManager
{
  return self->_specManager;
}

- (PXZoomablePhotosViewModel)zoomablePhotosViewModel
{
  return self->_zoomablePhotosViewModel;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXCuratedLibraryAnalysisStatus)analysisStatus
{
  return self->_analysisStatus;
}

- (void)setAllowedActions:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSSet isEqualToSet:](self->_allowedActions, "isEqualToSet:"))
  {
    objc_storeStrong((id *)&self->_allowedActions, a3);
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x10000);
  }

}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (PXBannerViewConfiguration)bannerViewConfiguration
{
  return self->_bannerViewConfiguration;
}

- (void)setWantsToolbarVisible:(BOOL)a3
{
  if (self->_wantsToolbarVisible != a3)
  {
    self->_wantsToolbarVisible = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x400000);
  }
}

- (void)setWantsTabBarVisible:(BOOL)a3
{
  if (self->_wantsTabBarVisible != a3)
  {
    self->_wantsTabBarVisible = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x400000);
  }
}

- (void)setWantsSecondaryToolbarVisible:(BOOL)a3
{
  if (self->_wantsSecondaryToolbarVisible != a3)
  {
    self->_wantsSecondaryToolbarVisible = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x400000);
  }
}

- (void)setWantsNavigationBarVisible:(BOOL)a3
{
  if (self->_wantsNavigationBarVisible != a3)
  {
    self->_wantsNavigationBarVisible = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x400000);
  }
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

void __59__PXCuratedLibraryViewModel__handleSelectionManagerChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 40);
  if ((v3 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentDataSource");
    v3 = *(_QWORD *)(a1 + 40);
  }
  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_invalidateAssetActionManager");
    objc_msgSend(*(id *)(a1 + 32), "signalChange:", 8);
  }

}

- (void)_invalidateCurrentDataSource
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentDataSource);

}

- (void)_invalidateLibraryState
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateLibraryState);

}

- (void)_invalidateZoomablePhotosViewModel
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateZoomablePhotosViewModel);

}

- (void)_invalidateBannerViewConfiguration
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateBannerViewConfiguration);

}

- (void)_invalidateAspectFitContent
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAspectFitContent);

}

- (void)_setNeedsUpdate
{
  -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0);
}

- (BOOL)wantsToolbarVisible
{
  return self->_wantsToolbarVisible;
}

- (BOOL)wantsTabBarVisible
{
  return self->_wantsTabBarVisible;
}

- (BOOL)wantsNavigationBarVisible
{
  return self->_wantsNavigationBarVisible;
}

- (int64_t)lastChromeVisibilityChangeReason
{
  return self->_lastChromeVisibilityChangeReason;
}

- (int64_t)scrollRegime
{
  return self->_scrollRegime;
}

- (int64_t)zoomLevelTransitionPhase
{
  return self->_zoomLevelTransitionPhase;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)performInitialChanges:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__PXCuratedLibraryViewModel_performInitialChanges___block_invoke;
  v6[3] = &unk_1E5127AD0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PXCuratedLibraryViewModel performChanges:](self, "performChanges:", v6);

}

- (PXCPLUIStatusProvider)cplUIStatusProvider
{
  PXCPLUIStatusProvider *cplUIStatusProvider;
  objc_class *cplActionManagerClass;
  void *v5;
  PXCPLUIStatusProvider *v6;
  PXCPLUIStatusProvider *v7;
  NSObject *v8;
  uint64_t v9;
  PXCPLUIStatusProvider *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  PXCuratedLibraryViewModel *v15;
  __int16 v16;
  PXCPLUIStatusProvider *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  cplUIStatusProvider = self->_cplUIStatusProvider;
  if (!cplUIStatusProvider)
  {
    cplActionManagerClass = self->_cplActionManagerClass;
    if (cplActionManagerClass)
      v5 = (void *)objc_msgSend([cplActionManagerClass alloc], "initWithPhotoLibrary:", self->_photoLibrary);
    else
      v5 = 0;
    v6 = -[PXCPLUIStatusProvider initWithPhotoLibrary:actionManager:]([PXCPLUIStatusProvider alloc], "initWithPhotoLibrary:actionManager:", self->_photoLibrary, v5);
    v7 = self->_cplUIStatusProvider;
    self->_cplUIStatusProvider = v6;

    PLUserStatusUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_opt_class();
      v10 = self->_cplUIStatusProvider;
      v12 = 138543874;
      v13 = v9;
      v14 = 2048;
      v15 = self;
      v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did assign %{public}@", (uint8_t *)&v12, 0x20u);
    }

    cplUIStatusProvider = self->_cplUIStatusProvider;
  }
  return cplUIStatusProvider;
}

- (BOOL)wantsDarkStatusBar
{
  return self->_wantsDarkStatusBar;
}

- (BOOL)selectionManagerShouldAvoidEmptySelection:(id)a3
{
  return !-[PXCuratedLibraryViewModel isSelecting](self, "isSelecting", a3);
}

- (void)_updateAssetsDataSourceManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  -[PXCuratedLibraryViewModel allPhotosContentFilterState](self, "allPhotosContentFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateForUseCase:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryViewModel viewOptionsModel](self, "viewOptionsModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortOrderState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sortOrder");

  PXFetchSortOrderStandardAssetSortDescriptors(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryViewModel assetsDataSourceManager](self, "assetsDataSourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__PXCuratedLibraryViewModel__updateAssetsDataSourceManager__block_invoke;
  v12[3] = &unk_1E5127B58;
  v12[4] = self;
  v13 = v4;
  v14 = v8;
  v10 = v8;
  v11 = v4;
  objc_msgSend(v9, "performChanges:", v12);

}

- (PXContentFilterState)allPhotosContentFilterState
{
  return self->_allPhotosContentFilterState;
}

void __59__PXCuratedLibraryViewModel__updateAssetsDataSourceManager__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "loadIfNeeded");
  objc_msgSend(v3, "setZoomLevel:", objc_msgSend(*(id *)(a1 + 32), "zoomLevel"));
  objc_msgSend(v3, "setAllPhotosFilterPredicate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setAllPhotosSortDescriptors:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "libraryFilterState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLibraryFilter:", objc_msgSend(v4, "viewMode"));

  +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCanIncludeUnsavedSyndicatedAssets:", objc_msgSend(v5, "showUnsavedSyndicatedContentInPhotosGrids"));

}

- (void)resetAllPhotosContentFilterState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__PXCuratedLibraryViewModel_resetAllPhotosContentFilterState__block_invoke;
  v2[3] = &unk_1E5143468;
  v2[4] = self;
  -[PXCuratedLibraryViewModel performChanges:](self, "performChanges:", v2);
}

void __61__PXCuratedLibraryViewModel_resetAllPhotosContentFilterState__block_invoke(uint64_t a1)
{
  id v2;

  +[PXContentFilterState defaultAllPhotosFilterStateForPhotoLibrary:](PXContentFilterState, "defaultAllPhotosFilterStateForPhotoLibrary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setAllPhotosContentFilterState:", v2);

}

- (void)setAllPhotosContentFilterState:(id)a3
{
  PXContentFilterState *v4;
  BOOL v5;
  PXContentFilterState *v6;
  PXContentFilterState *allPhotosContentFilterState;
  PXContentFilterState *v8;

  v8 = (PXContentFilterState *)a3;
  v4 = self->_allPhotosContentFilterState;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXContentFilterState isEqual:](v8, "isEqual:", v4);

    if (!v5)
    {
      v6 = (PXContentFilterState *)-[PXContentFilterState copy](v8, "copy");
      allPhotosContentFilterState = self->_allPhotosContentFilterState;
      self->_allPhotosContentFilterState = v6;

      -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x4000000);
      -[PXCuratedLibraryViewModel _invalidateCurrentContentFilterState](self, "_invalidateCurrentContentFilterState");
      -[PXCuratedLibraryViewModel _invalidateAssetsDataSourceManager](self, "_invalidateAssetsDataSourceManager");
      -[PXCuratedLibraryViewModel _invalidateAllowedActions](self, "_invalidateAllowedActions");
    }
  }

}

- (void)_invalidateCurrentContentFilterState
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentContentFilterState);

}

- (void)_invalidateAssetsDataSourceManager
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAssetsDataSourceManager);

}

- (PXCuratedLibraryViewModel)initWithAssetsDataSourceManagerConfiguration:(id)a3 zoomLevel:(int64_t)a4 mediaProvider:(id)a5 specManager:(id)a6 styleGuide:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PXCuratedLibraryViewConfiguration *v16;
  void *v17;
  PXCuratedLibraryViewConfiguration *v18;
  PXCuratedLibraryViewModel *v19;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = [PXCuratedLibraryViewConfiguration alloc];
  objc_msgSend(v15, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PXCuratedLibraryViewConfiguration initWithPhotoLibrary:](v16, "initWithPhotoLibrary:", v17);

  v19 = -[PXCuratedLibraryViewModel initWithConfiguration:assetsDataSourceManagerConfiguration:zoomLevel:mediaProvider:specManager:styleGuide:](self, "initWithConfiguration:assetsDataSourceManagerConfiguration:zoomLevel:mediaProvider:specManager:styleGuide:", v18, v15, a4, v14, v13, v12);
  return v19;
}

- (void)_updateUserWantsAspectFitContent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allPhotosAspectFit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryViewModel specManager](self, "specManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "userInterfaceIdiom") == 2 && objc_msgSend(v5, "sizeClass") == 1)
  {
    objc_msgSend(v7, "allPhotosAspectFitInCompact");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  -[PXCuratedLibraryViewModel setUserWantsAspectFitContent:](self, "setUserWantsAspectFitContent:", v3);

}

- (void)setUserWantsAspectFitContent:(id)a3
{
  NSNumber *v4;
  void *v5;
  NSNumber *v6;
  char v7;
  NSNumber *v8;
  NSNumber *userWantsAspectFitContent;
  void *v10;
  void *v11;
  NSNumber *v12;

  v12 = (NSNumber *)a3;
  v4 = self->_userWantsAspectFitContent;
  v5 = v12;
  if (v4 == v12)
  {
LABEL_8:

    goto LABEL_9;
  }
  v6 = v4;
  v7 = -[NSNumber isEqual:](v4, "isEqual:", v12);

  if ((v7 & 1) == 0)
  {
    v8 = (NSNumber *)-[NSNumber copy](v12, "copy");
    userWantsAspectFitContent = self->_userWantsAspectFitContent;
    self->_userWantsAspectFitContent = v8;

    -[PXCuratedLibraryViewModel specManager](self, "specManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "spec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "userInterfaceIdiom") == 2 && objc_msgSend(v5, "sizeClass") == 1)
    {
      +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAllPhotosAspectFitInCompact:", v12);
    }
    else
    {
      +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAllPhotosAspectFit:", v12);
    }

    -[PXCuratedLibraryViewModel _invalidateAspectFitContent](self, "_invalidateAspectFitContent");
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_updateZoomablePhotosViewModel
{
  void *v3;
  _QWORD v4[5];

  -[PXCuratedLibraryViewModel zoomablePhotosViewModel](self, "zoomablePhotosViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__PXCuratedLibraryViewModel__updateZoomablePhotosViewModel__block_invoke;
  v4[3] = &unk_1E512BDB8;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

void __59__PXCuratedLibraryViewModel__updateZoomablePhotosViewModel__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setIsInSelectMode:", objc_msgSend(v3, "isSelecting"));
  objc_msgSend(v5, "setViewBasedDecorationsEnabled:", objc_msgSend(*(id *)(a1 + 32), "viewBasedDecorationsEnabled"));
  objc_msgSend(*(id *)(a1 + 32), "draggedAssetReferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDraggedAssetReferences:", v4);

  objc_msgSend(v5, "setAspectFit:", objc_msgSend(*(id *)(a1 + 32), "aspectFitContent"));
  objc_msgSend(v5, "setIsInteractiveZoomingAllowed:", objc_msgSend(*(id *)(a1 + 32), "isExpanded"));

}

void __58__PXCuratedLibraryViewModel__updateDraggedAssetReferences__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  if (objc_msgSend(v3, "count"))
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = 0;
  objc_msgSend(v5, "setDraggedAssetReferences:", v4);

}

- (void)setDraggedAssetReferences:(id)a3
{
  NSSet *v4;
  char v5;
  NSSet *v6;
  NSSet *draggedAssetReferences;
  NSSet *v8;

  v8 = (NSSet *)a3;
  v4 = self->_draggedAssetReferences;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSSet isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSSet *)-[NSSet copy](v8, "copy");
      draggedAssetReferences = self->_draggedAssetReferences;
      self->_draggedAssetReferences = v6;

      -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x200000);
      -[PXCuratedLibraryViewModel _invalidateZoomablePhotosViewModel](self, "_invalidateZoomablePhotosViewModel");
    }
  }

}

- (BOOL)viewBasedDecorationsEnabled
{
  return self->_viewBasedDecorationsEnabled;
}

- (BOOL)aspectFitContent
{
  return self->_aspectFitContent;
}

- (PXCuratedLibraryAssetCollectionSkimmingInfo)skimmingInfo
{
  return self->_skimmingInfo;
}

- (id)visibleAssetCollectionsFromCuratedLibraryAssetsDataSourceManager:(id)a3
{
  void *v3;
  void *v4;

  -[PXCuratedLibraryViewModel visibleAssetCollections](self, "visibleAssetCollections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSSet)visibleAssetCollections
{
  return (NSSet *)self->_visibleAssetCollections;
}

- (void)_updateBannerViewConfiguration
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;

  if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    -[PXCuratedLibraryViewModel sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "hasPreview"))
    {
      PXSharedLibraryPreviewBannerConfiguration(v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v4, "hasSharedLibrary"))
        goto LABEL_11;
      -[PXCuratedLibraryViewModel sharedLibrarySuggestionCountsManager](self, "sharedLibrarySuggestionCountsManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "shouldShowNotificationBanner");

      if (v7)
      {
        -[PXCuratedLibraryViewModel sharedLibrarySuggestionCountsManager](self, "sharedLibrarySuggestionCountsManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        PXSharedLibrarySharingSuggestionsBannerConfiguration(v8);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      -[PXCuratedLibraryViewModel sharedLibraryCameraSharingBannerStatusProvider](self, "sharedLibraryCameraSharingBannerStatusProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "shouldShowBanner");

      if (!v10)
      {
LABEL_11:
        v11 = 0;
        goto LABEL_12;
      }
      PXSharedLibraryCameraSharingBannerConfiguration();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (id)v5;
LABEL_12:

    v3 = v11;
    goto LABEL_13;
  }
  v3 = 0;
LABEL_13:
  v12 = v3;
  -[PXCuratedLibraryViewModel setBannerViewConfiguration:](self, "setBannerViewConfiguration:", v3);

}

- (void)setBannerViewConfiguration:(id)a3
{
  PXBannerViewConfiguration *v5;
  PXBannerViewConfiguration *v6;
  char v7;
  PXBannerViewConfiguration *v8;

  v8 = (PXBannerViewConfiguration *)a3;
  v5 = self->_bannerViewConfiguration;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXBannerViewConfiguration isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_bannerViewConfiguration, a3);
      -[PXCuratedLibraryViewModel _invalidateChromeVisibility](self, "_invalidateChromeVisibility");
      -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0xFFFFFFFF80000000);
    }
  }

}

- (void)_updateScrollingProperties
{
  id v3;

  -[PXCuratedLibraryViewModel scrollingSpeedometer](self, "scrollingSpeedometer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryViewModel setScrollRegime:](self, "setScrollRegime:", objc_msgSend(v3, "regime"));
  objc_msgSend(v3, "lastScrollDirection");
  -[PXCuratedLibraryViewModel setLastScrollDirection:](self, "setLastScrollDirection:");

}

- (void)setScrollRegime:(int64_t)a3
{
  if (self->_scrollRegime != a3)
  {
    self->_scrollRegime = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 2048);
  }
}

- (void)setLastScrollDirection:(CGPoint)a3
{
  if (a3.x != self->_lastScrollDirection.x || a3.y != self->_lastScrollDirection.y)
  {
    self->_lastScrollDirection = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 4096);
  }
}

- (PXScrollViewSpeedometer)scrollingSpeedometer
{
  return self->_scrollingSpeedometer;
}

- (void)_updateScrollingSpeedometer
{
  void *v3;
  void *v4;
  id v5;

  -[PXCuratedLibraryViewModel views](self, "views");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollingSpeedometer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryViewModel setScrollingSpeedometer:](self, "setScrollingSpeedometer:", v4);

}

- (NSArray)views
{
  return -[NSHashTable allObjects](self->_views, "allObjects");
}

- (void)setScrollingSpeedometer:(id)a3
{
  PXScrollViewSpeedometer *v5;
  PXScrollViewSpeedometer *scrollingSpeedometer;
  PXScrollViewSpeedometer *v7;

  v5 = (PXScrollViewSpeedometer *)a3;
  scrollingSpeedometer = self->_scrollingSpeedometer;
  if (scrollingSpeedometer != v5)
  {
    v7 = v5;
    -[PXScrollViewSpeedometer unregisterChangeObserver:context:](scrollingSpeedometer, "unregisterChangeObserver:context:", self, PXCuratedLibraryViewModelScrollingSpeedometerObserverContext);
    objc_storeStrong((id *)&self->_scrollingSpeedometer, a3);
    -[PXScrollViewSpeedometer registerChangeObserver:context:](self->_scrollingSpeedometer, "registerChangeObserver:context:", self, PXCuratedLibraryViewModelScrollingSpeedometerObserverContext);
    -[PXCuratedLibraryViewModel _invalidateScrollingProperties](self, "_invalidateScrollingProperties");
    v5 = v7;
  }

}

- (void)_invalidateScrollingProperties
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateScrollingProperties);

}

- (void)setSidebarCanBecomeVisible:(BOOL)a3
{
  if (self->_sidebarCanBecomeVisible != a3)
  {
    self->_sidebarCanBecomeVisible = a3;
    -[PXCuratedLibraryViewModel _invalidateAllowedActions](self, "_invalidateAllowedActions");
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x40000000);
  }
}

- (void)_updateAspectFitContent
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[PXCuratedLibraryViewModel specManager](self, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom") == 4;

  -[PXCuratedLibraryViewModel userWantsAspectFitContent](self, "userWantsAspectFitContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXCuratedLibraryViewModel userWantsAspectFitContent](self, "userWantsAspectFitContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "BOOLValue");

  }
  -[PXCuratedLibraryViewModel setAspectFitContent:](self, "setAspectFitContent:", v5);
}

- (NSNumber)userWantsAspectFitContent
{
  return self->_userWantsAspectFitContent;
}

- (PXCuratedLibraryVideoPlaybackController)videoPlaybackController
{
  return self->_videoPlaybackController;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)curatedLibraryAssetsDataSourceManager:(id)a3 didTransitionFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXCuratedLibraryViewModel presenters](self, "presenters", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "viewModel:didTransitionFromZoomLevel:toZoomLevel:", self, a4, a5);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)curatedLibraryAssetsDataSourceManager:(id)a3 willTransitionFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXCuratedLibraryViewModel presenters](self, "presenters", a3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "viewModel:willTransitionFromZoomLevel:toZoomLevel:", self, a4, a5);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (PXCuratedLibraryViewModelPresenter)mainPresenter
{
  void *v2;
  void *v3;

  -[PXCuratedLibraryViewModel presenters](self, "presenters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXCuratedLibraryViewModelPresenter *)v3;
}

- (NSArray)presenters
{
  return -[NSHashTable allObjects](self->_presenters, "allObjects");
}

- (void)setCplActionManagerClass:(Class)a3
{
  Class *p_cplActionManagerClass;
  PXCPLUIStatusProvider *cplUIStatusProvider;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  PXCuratedLibraryViewModel *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_cplActionManagerClass = &self->_cplActionManagerClass;
  if (*p_cplActionManagerClass != a3)
  {
    objc_storeStrong((id *)p_cplActionManagerClass, a3);
    cplUIStatusProvider = self->_cplUIStatusProvider;
    if (cplUIStatusProvider)
    {
      self->_cplUIStatusProvider = 0;

      PLUserStatusUIGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138543618;
        v8 = objc_opt_class();
        v9 = 2048;
        v10 = self;
        _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Did reset PXCPLUIStatusProvider", (uint8_t *)&v7, 0x16u);
      }

    }
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x10000000);
  }
}

- ($DE30A600513D762F9B6AB73D2AED4B95)selectedAssetsTypedCount
{
  $7D1650DB7441A0F5833AC641852B48F3 *p_selectedAssetsTypedCount;
  unint64_t count;
  int64_t type;
  $DE30A600513D762F9B6AB73D2AED4B95 result;

  p_selectedAssetsTypedCount = &self->_selectedAssetsTypedCount;
  count = self->_selectedAssetsTypedCount.count;
  type = p_selectedAssetsTypedCount->type;
  result.var1 = type;
  result.var0 = count;
  return result;
}

- (PXCuratedLibraryViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryViewModel.m"), 139, CFSTR("%s is not available as initializer"), "-[PXCuratedLibraryViewModel init]");

  abort();
}

- (PXCuratedLibraryViewModel)initWithConfiguration:(id)a3 assetsDataSourceManagerConfiguration:(id)a4 zoomLevel:(int64_t)a5 mediaProvider:(id)a6 specManager:(id)a7 styleGuide:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PXCuratedLibraryViewModel *v20;
  PXCuratedLibraryViewModel *v21;
  uint64_t v22;
  PXUpdater *updater;
  PXCuratedLibraryAssetsDataSourceManager *v24;
  PXCuratedLibraryAssetsDataSourceManager *assetsDataSourceManager;
  PXCuratedLibraryVideoPlaybackController *v26;
  PXCuratedLibraryVideoPlaybackController *videoPlaybackController;
  PXCuratedLibraryActionManager *v28;
  PXCuratedLibraryActionManager *actionManager;
  uint64_t v30;
  NSHashTable *presenters;
  char v32;
  uint64_t v33;
  NSHashTable *views;
  uint64_t v35;
  NSMutableSet *visibleAssetCollections;
  uint64_t v37;
  PXSectionedSelectionManager *selectionManager;
  void *v39;
  void *v40;
  float v41;
  double v42;
  void *v43;
  uint64_t v44;
  PXCuratedLibraryAnalysisStatus *analysisStatus;
  void *v46;
  void *v47;
  uint64_t v48;
  PHPhotoLibrary *photoLibrary;
  uint64_t v50;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  PXLibraryFilterState *v52;
  PXLibraryFilterState *libraryFilterState;
  uint64_t v54;
  PXPhotosViewOptionsModel *viewOptionsModel;
  void *v56;
  void *v57;
  id *v58;
  void *v59;
  PXZoomablePhotosLayoutSpecManager *v60;
  void *v61;
  PXZoomablePhotosLayoutSpecManager *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  PXZoomablePhotosViewModel *v67;
  PXSectionedSelectionManager *v68;
  void *v69;
  PXZoomablePhotosViewModel *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  id v74;
  PXSharedLibraryCameraSharingBannerStatusProvider *v75;
  id v76;
  void *v77;
  id *v78;
  void *v79;
  void *v80;
  void *v82;
  id v83;
  id v84;
  _QWORD v85[4];
  id *v86;
  _QWORD v87[4];
  id *v88;
  objc_super v89;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v89.receiver = self;
  v89.super_class = (Class)PXCuratedLibraryViewModel;
  v20 = -[PXCuratedLibraryViewModel init](&v89, sel_init);
  v21 = v20;
  if (v20)
  {
    v83 = v19;
    v84 = v17;
    objc_storeStrong((id *)&v20->_configuration, a3);
    v22 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v21);
    updater = v21->_updater;
    v21->_updater = (PXUpdater *)v22;

    -[PXUpdater setNeedsUpdateSelector:](v21->_updater, "setNeedsUpdateSelector:", sel__setNeedsUpdate);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateAssetsDataSourceManager);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateCurrentDataSource);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateSelectModeCaption);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateUserWantsAspectFitContent);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateAspectFitContent);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateLibraryState);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateCurrentContentFilterState);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateScrollingSpeedometer);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateScrollingProperties);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateBannerViewConfiguration);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateChromeVisibility);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateDraggedAssetReferences);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateZoomablePhotosViewModel);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateShouldShowEmptyPlaceholder);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateAllowedActions);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateIsModalInPresentation);
    -[PXUpdater addUpdateSelector:](v21->_updater, "addUpdateSelector:", sel__updateDesiredVerticalAlignment);
    objc_storeStrong((id *)&v21->_specManager, a7);
    objc_msgSend(v18, "registerChangeObserver:context:", v21, PXCuratedLibraryViewModelSpecManagerObserverContext);
    objc_storeStrong((id *)&v21->_styleGuide, a8);
    v21->_desiredVerticalAlignment = 0;
    v24 = -[PXCuratedLibraryAssetsDataSourceManager initWithConfiguration:]([PXCuratedLibraryAssetsDataSourceManager alloc], "initWithConfiguration:", v16);
    assetsDataSourceManager = v21->_assetsDataSourceManager;
    v21->_assetsDataSourceManager = v24;

    -[PXCuratedLibraryAssetsDataSourceManager setDelegate:](v21->_assetsDataSourceManager, "setDelegate:", v21);
    -[PXSectionedDataSourceManager registerChangeObserver:context:](v21->_assetsDataSourceManager, "registerChangeObserver:context:", v21, PXCuratedLibraryViewModelAssetsDataSourceManagerObserverContext);
    v26 = -[PXCuratedLibraryVideoPlaybackController initViewViewModel:]([PXCuratedLibraryVideoPlaybackController alloc], "initViewViewModel:", v21);
    videoPlaybackController = v21->_videoPlaybackController;
    v21->_videoPlaybackController = v26;

    v28 = -[PXCuratedLibraryActionManager initWithViewModel:]([PXCuratedLibraryActionManager alloc], "initWithViewModel:", v21);
    actionManager = v21->_actionManager;
    v21->_actionManager = v28;

    v21->_zoomLevel = a5;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v30 = objc_claimAutoreleasedReturnValue();
    presenters = v21->_presenters;
    v21->_presenters = (NSHashTable *)v30;

    v21->_wantsZoomControlVisible = 1;
    v32 = objc_msgSend(v15, "isExpandedInitially");
    v21->_isExpanded = v32;
    v21->_isFullyExpanded = v32;
    v21->_secondaryToolbarVisibility = 1.0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v33 = objc_claimAutoreleasedReturnValue();
    views = v21->_views;
    v21->_views = (NSHashTable *)v33;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v35 = objc_claimAutoreleasedReturnValue();
    visibleAssetCollections = v21->_visibleAssetCollections;
    v21->_visibleAssetCollections = (NSMutableSet *)v35;

    v37 = objc_msgSend(objc_alloc((Class)off_1E50B4A40), "initWithDataSourceManager:", v21->_assetsDataSourceManager);
    selectionManager = v21->_selectionManager;
    v21->_selectionManager = (PXSectionedSelectionManager *)v37;

    -[PXSectionedSelectionManager setSnapshotValidator:](v21->_selectionManager, "setSnapshotValidator:", v21);
    -[PXSectionedSelectionManager registerChangeObserver:context:](v21->_selectionManager, "registerChangeObserver:context:", v21, PXCuratedLibraryViewModelSelectionObserverContext);
    -[PXCuratedLibraryViewModel registerChangeObserver:context:](v21, "registerChangeObserver:context:", v21, PXCuratedLibraryViewModelObserverContext_112114);
    +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "daysMarginScale");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v40, "floatValue");
      v42 = v41;
    }
    else
    {
      v42 = 1.0;
    }
    v21->_daysMarginScale = v42;
    objc_msgSend(v16, "photoLibrary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXCuratedLibraryAnalysisStatus sharedStatusForLibrary:](PXCuratedLibraryAnalysisStatus, "sharedStatusForLibrary:", v43);
    v44 = objc_claimAutoreleasedReturnValue();
    analysisStatus = v21->_analysisStatus;
    v21->_analysisStatus = (PXCuratedLibraryAnalysisStatus *)v44;

    -[PXCuratedLibraryAnalysisStatus setDataSourceManager:](v21->_analysisStatus, "setDataSourceManager:", v21->_assetsDataSourceManager);
    -[PXCuratedLibraryAnalysisStatus registerChangeObserver:context:](v21->_analysisStatus, "registerChangeObserver:context:", v21, PXCuratedLibraryViewModelAnalysisStatusObserverContext);
    -[PXCuratedLibraryViewModel selectionManager](v21, "selectionManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "assetTypeCounter");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "registerChangeObserver:context:", v21, PXCuratedLibraryViewModelAssetSelectionTypeObserverContext);

    objc_msgSend(v16, "photoLibrary");
    v48 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v21->_photoLibrary;
    v21->_photoLibrary = (PHPhotoLibrary *)v48;

    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v21->_photoLibrary);
    v50 = objc_claimAutoreleasedReturnValue();
    sharedLibraryStatusProvider = v21->_sharedLibraryStatusProvider;
    v21->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v50;

    v52 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v21->_sharedLibraryStatusProvider);
    libraryFilterState = v21->_libraryFilterState;
    v21->_libraryFilterState = v52;

    objc_msgSend(v15, "viewOptionsModel");
    v54 = objc_claimAutoreleasedReturnValue();
    v82 = v15;
    viewOptionsModel = v21->_viewOptionsModel;
    v21->_viewOptionsModel = (PXPhotosViewOptionsModel *)v54;

    -[PXPhotosViewOptionsModel sortOrderState](v21->_viewOptionsModel, "sortOrderState");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "registerChangeObserver:context:", v21, PXPhotosSortOrderStateObservationContext);

    -[PXPhotosViewOptionsModel sortOrderState](v21->_viewOptionsModel, "sortOrderState");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryViewModel _sendAllPhotosSortOrderAnalyticsEvent:](v21, "_sendAllPhotosSortOrderAnalyticsEvent:", objc_msgSend(v57, "sortOrder"));

    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __135__PXCuratedLibraryViewModel_initWithConfiguration_assetsDataSourceManagerConfiguration_zoomLevel_mediaProvider_specManager_styleGuide___block_invoke;
    v87[3] = &unk_1E5143468;
    v58 = v21;
    v88 = v58;
    objc_msgSend(v58, "performChanges:", v87);
    -[PXCuratedLibraryAssetsDataSourceManager dataSourceManagerForZoomLevel:](v21->_assetsDataSourceManager, "dataSourceManagerForZoomLevel:", 4);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "registerChangeObserver:context:", v58, PXCuratedLibraryViewModelAllPhotosDataSourceManagerObserverContext);
    v60 = [PXZoomablePhotosLayoutSpecManager alloc];
    objc_msgSend(v18, "extendedTraitCollection");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = -[PXFeatureSpecManager initWithExtendedTraitCollection:](v60, "initWithExtendedTraitCollection:", v61);

    +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "curatedLibraryUserDefaults");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXZoomablePhotosLayoutSpecManager setUserDefaults:](v62, "setUserDefaults:", v64);

    objc_msgSend(v18, "availableThumbnailSizes");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXZoomablePhotosLayoutSpecManager setAvailableThumbnailSizes:](v62, "setAvailableThumbnailSizes:", v65);

    objc_msgSend(v58, "configuration");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXZoomablePhotosLayoutSpecManager setOverrideDefaultNumberOfColumns:](v62, "setOverrideDefaultNumberOfColumns:", objc_msgSend(v66, "overrideDefaultNumberOfColumns"));

    -[PXZoomablePhotosLayoutSpecManager setGridStyle:](v62, "setGridStyle:", 3);
    v67 = [PXZoomablePhotosViewModel alloc];
    v68 = v21->_selectionManager;
    objc_msgSend(v58, "videoPlaybackController");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v67;
    v17 = v84;
    v71 = -[PXZoomablePhotosViewModel initWithDataSourceManager:selectionManager:mediaProvider:specManager:loadingStatusManager:badgesModifier:preferredAssetCropDelegate:preferredColumnCountsDelegate:inlinePlaybackController:](v70, "initWithDataSourceManager:selectionManager:mediaProvider:specManager:loadingStatusManager:badgesModifier:preferredAssetCropDelegate:preferredColumnCountsDelegate:inlinePlaybackController:", v59, v68, v84, v62, 0, 0, 0, 0, v69);
    v72 = v58[36];
    v58[36] = (id)v71;

    objc_msgSend(v58[36], "registerChangeObserver:context:", v58, PXCuratedLibraryViewModelZoomablePhotosObserverContext);
    if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    {
      -[PHPhotoLibrary px_sharedLibrarySharingSuggestionsCountsManager](v21->_photoLibrary, "px_sharedLibrarySharingSuggestionsCountsManager");
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = v58[57];
      v58[57] = (id)v73;

      objc_msgSend(v58[57], "registerChangeObserver:context:", v58, &PXSharedLibrarySharingSuggestionsCountsManagerObservationContext);
    }
    v75 = objc_alloc_init(PXSharedLibraryCameraSharingBannerStatusProvider);
    v76 = v58[58];
    v58[58] = v75;

    objc_msgSend(v58[58], "registerChangeObserver:context:", v58, &PXSharedLibraryCameraSharingBannerStatusProviderObservationContext);
    v15 = v82;
    *((_BYTE *)v58 + 163) = objc_msgSend(v82, "enableFooter");
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v58 + 164) = objc_msgSend(v77, "hideStatusFooterInSelectMode");

    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __135__PXCuratedLibraryViewModel_initWithConfiguration_assetsDataSourceManagerConfiguration_zoomLevel_mediaProvider_specManager_styleGuide___block_invoke_2;
    v85[3] = &unk_1E5143468;
    v78 = v58;
    v86 = v78;
    objc_msgSend(v78, "performChanges:", v85);
    -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v21->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v78, PXSharedLibraryStatusProviderObservationContext_112116);
    -[PXLibraryFilterState registerChangeObserver:context:](v21->_libraryFilterState, "registerChangeObserver:context:", v78, PXLibraryFilterStateObservationContext_112117);
    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "addDeferredKeyObserver:", v78);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "addObserver:forKeyPath:options:context:", v78, CFSTR("IncludeScreenshots"), 0, PXUserDefaultsObservationContext);
    objc_msgSend(v80, "addObserver:forKeyPath:options:context:", v78, CFSTR("IncludeSharedWithYou"), 0, PXUserDefaultsObservationContext);

    v19 = v83;
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("IncludeSharedWithYou"), PXUserDefaultsObservationContext);

  v4.receiver = self;
  v4.super_class = (Class)PXCuratedLibraryViewModel;
  -[PXCuratedLibraryViewModel dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;

  -[PXCuratedLibraryViewModel allowedActions](self, "allowedActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@; %p; zoomLevel = %ld; allowedActions = [%@];>"),
    v9,
    self,
    -[PXCuratedLibraryViewModel zoomLevel](self, "zoomLevel"),
    v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v10;
}

- (void)setIsResetting:(BOOL)a3
{
  self->_isResetting = a3;
}

- (void)setIsNavigating:(BOOL)a3
{
  self->_isNavigating = a3;
}

- (void)setZoomLevelTransitionPhase:(int64_t)a3
{
  if (self->_zoomLevelTransitionPhase != a3)
  {
    self->_zoomLevelTransitionPhase = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x2000);
  }
}

- (void)setIsExpanded:(BOOL)a3
{
  if (self->_isExpanded != a3)
  {
    self->_isExpanded = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0xFFFFFFFF80000000);
    -[PXCuratedLibraryViewModel _invalidateAllowedActions](self, "_invalidateAllowedActions");
    -[PXCuratedLibraryViewModel _invalidateZoomablePhotosViewModel](self, "_invalidateZoomablePhotosViewModel");
    -[PXCuratedLibraryViewModel _updateIsFullyExpanded](self, "_updateIsFullyExpanded");
  }
}

- (void)setIsExpandedAnimating:(BOOL)a3
{
  if (self->_isExpandedAnimating != a3)
  {
    self->_isExpandedAnimating = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0xFFFFFFFF80000000);
    -[PXCuratedLibraryViewModel _updateIsFullyExpanded](self, "_updateIsFullyExpanded");
  }
}

- (void)_updateIsFullyExpanded
{
  uint64_t v3;

  if (-[PXCuratedLibraryViewModel isExpanded](self, "isExpanded"))
    v3 = -[PXCuratedLibraryViewModel isExpandedAnimating](self, "isExpandedAnimating") ^ 1;
  else
    v3 = 0;
  -[PXCuratedLibraryViewModel setIsFullyExpanded:](self, "setIsFullyExpanded:", v3);
}

- (void)setIsFullyExpanded:(BOOL)a3
{
  if (self->_isFullyExpanded != a3)
  {
    self->_isFullyExpanded = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0xFFFFFFFF80000000);
  }
}

- (void)setViewBasedDecorationsEnabled:(BOOL)a3
{
  if (self->_viewBasedDecorationsEnabled != a3)
  {
    self->_viewBasedDecorationsEnabled = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x800000);
    -[PXCuratedLibraryViewModel _invalidateZoomablePhotosViewModel](self, "_invalidateZoomablePhotosViewModel");
  }
}

- (void)setWantsOptionalChromeVisible:(BOOL)a3
{
  -[PXCuratedLibraryViewModel setWantsOptionalChromeVisible:changeReason:](self, "setWantsOptionalChromeVisible:changeReason:", a3, 0);
}

- (void)setWantsOptionalChromeVisible:(BOOL)a3 changeReason:(int64_t)a4
{
  if (self->_wantsOptionalChromeVisible != a3)
  {
    self->_wantsOptionalChromeVisible = a3;
    -[PXCuratedLibraryViewModel _invalidateChromeVisibilityWithChangeReason:](self, "_invalidateChromeVisibilityWithChangeReason:", a4);
  }
}

- (void)setDaysMarginScale:(double)a3
{
  void *v5;
  id v6;

  if (self->_daysMarginScale != a3)
  {
    self->_daysMarginScale = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 128);
    if (!-[PXCuratedLibraryViewModel isPerformingInitialChanges](self, "isPerformingInitialChanges"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDaysMarginScale:", v6);

    }
  }
}

- (void)setSkimmingInfo:(id)a3
{
  PXCuratedLibraryAssetCollectionSkimmingInfo *v5;
  char v6;
  PXCuratedLibraryAssetCollectionSkimmingInfo *v7;

  v7 = (PXCuratedLibraryAssetCollectionSkimmingInfo *)a3;
  v5 = self->_skimmingInfo;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXCuratedLibraryAssetCollectionSkimmingInfo isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_skimmingInfo, a3);
      -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 512);
    }
  }

}

- (PXAssetReference)singleSelectedAssetReference
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  void *v9;
  void *v10;
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;

  -[PXCuratedLibraryViewModel selectionManager](self, "selectionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "selectedIndexPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    if (v4)
    {
      objc_msgSend(v4, "firstSelectedIndexPath");
    }
    else
    {
      v13 = 0u;
      v14 = 0u;
    }
  }
  else
  {
    v6 = *((_OWORD *)off_1E50B8778 + 1);
    v13 = *(_OWORD *)off_1E50B8778;
    v14 = v6;
  }

  if ((_QWORD)v13 != *(_QWORD *)off_1E50B7E98
    && (_QWORD)v14 != 0x7FFFFFFFFFFFFFFFLL
    && *((_QWORD *)&v14 + 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PXCuratedLibraryViewModel currentDataSource](self, "currentDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v13;
    v12[1] = v14;
    objc_msgSend(v10, "assetReferenceAtItemIndexPath:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return (PXAssetReference *)v9;
}

- (void)setSelectModeCaption:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *selectModeCaption;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_selectModeCaption;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      selectModeCaption = self->_selectModeCaption;
      self->_selectModeCaption = v6;

      -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 2);
    }
  }

}

- (void)removePresenter:(id)a3
{
  -[NSHashTable removeObject:](self->_presenters, "removeObject:", a3);
}

- (void)removeView:(id)a3
{
  -[NSHashTable removeObject:](self->_views, "removeObject:", a3);
  -[PXCuratedLibraryViewModel _invalidateScrollingSpeedometer](self, "_invalidateScrollingSpeedometer");
}

- (int64_t)zoomLevelInDirection:(int64_t)a3 fromZoomLevel:(int64_t)a4
{
  int64_t v5;
  uint64_t v6;
  void *v7;
  int64_t v8;

  if (a3 >= 1)
    v5 = 1;
  else
    v5 = a3;
  if (v5 < 0)
    v6 = -1;
  else
    v6 = v5;
  -[PXCuratedLibraryViewModel configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 + a4;
  if (v8 > 4)
  {
LABEL_10:
    v8 = 0;
  }
  else
  {
    while ((objc_msgSend(v7, "isZoomLevelEnabled:", v8) & 1) == 0)
    {
      if (++v8 == 5)
        goto LABEL_10;
    }
  }

  return v8;
}

- (void)userDidSetAllPhotosContentFilterState:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PXCuratedLibraryViewModel zoomLevel](self, "zoomLevel") == 4)
  {
    -[PXCuratedLibraryViewModel setAllPhotosContentFilterState:](self, "setAllPhotosContentFilterState:", v4);
  }
  else
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = -[PXCuratedLibraryViewModel zoomLevel](self, "zoomLevel");
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Attempted content filtering with unexpected zoom level %li", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (PXAssetCollectionActionManager)assetCollectionActionManager
{
  PXAssetCollectionActionManager *assetCollectionActionManager;
  void *v4;
  void *v5;
  PXPhotoKitAssetCollectionActionManager *v6;
  PXAssetCollectionActionManager *v7;

  assetCollectionActionManager = self->_assetCollectionActionManager;
  if (!assetCollectionActionManager)
  {
    -[PXCuratedLibraryViewModel assetsDataSourceManager](self, "assetsDataSourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentPhotoKitAssetsDataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = -[PXPhotoKitAssetCollectionActionManager initWithAssetCollectionReference:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollectionReference:displayTitleInfo:", 0, 0);
    -[PXAssetCollectionActionManager setAssetsDataSourceManager:](v6, "setAssetsDataSourceManager:", v5);
    v7 = self->_assetCollectionActionManager;
    self->_assetCollectionActionManager = &v6->super;

    assetCollectionActionManager = self->_assetCollectionActionManager;
  }
  return assetCollectionActionManager;
}

- (void)toggleSelectionForIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v3;
  _OWORD v4[2];

  v3 = *(_OWORD *)&a3->item;
  v4[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v4[1] = v3;
  -[PXCuratedLibraryViewModel toggleSelectionForIndexPath:updateCursorIndexPath:](self, "toggleSelectionForIndexPath:updateCursorIndexPath:", v4, 0);
}

- (void)toggleSelectionForIndexPath:(PXSimpleIndexPath *)a3 updateCursorIndexPath:(BOOL)a4
{
  void *v7;
  __int128 v8;
  char v9;
  void *v10;
  __int128 v11;
  _QWORD v12[4];
  __int128 v13;
  __int128 v14;
  char v15;
  BOOL v16;
  _OWORD v17[2];

  -[PXCuratedLibraryViewModel selectionSnapshot](self, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a3->item;
  v17[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v17[1] = v8;
  v9 = objc_msgSend(v7, "isIndexPathSelected:", v17);

  -[PXCuratedLibraryViewModel selectionManager](self, "selectionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __79__PXCuratedLibraryViewModel_toggleSelectionForIndexPath_updateCursorIndexPath___block_invoke;
  v12[3] = &__block_descriptor_66_e37_v16__0___PXMutableSelectionManager__8l;
  v15 = v9;
  v11 = *(_OWORD *)&a3->item;
  v13 = *(_OWORD *)&a3->dataSourceIdentifier;
  v14 = v11;
  v16 = a4;
  objc_msgSend(v10, "performChanges:", v12);

}

- (void)toggleSelectionForAssetReference:(id)a3
{
  -[PXCuratedLibraryViewModel toggleSelectionForAssetReference:updateCursorIndexPath:](self, "toggleSelectionForAssetReference:updateCursorIndexPath:", a3, 0);
}

- (void)toggleSelectionForAssetReference:(id)a3 updateCursorIndexPath:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  _BYTE buf[32];
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  -[PXCuratedLibraryViewModel currentDataSource](self, "currentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "indexPathForAssetReference:", v6);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }

  if ((_QWORD)v11 == *(_QWORD *)off_1E50B7E98)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[PXCuratedLibraryViewModel currentDataSource](self, "currentDataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_DEFAULT, "can't toggle selection for %@ because it's not in %@", buf, 0x16u);

    }
  }
  else
  {
    *(_OWORD *)buf = v11;
    *(_OWORD *)&buf[16] = v12;
    -[PXCuratedLibraryViewModel toggleSelectionForIndexPath:updateCursorIndexPath:](self, "toggleSelectionForIndexPath:updateCursorIndexPath:", buf, v4);
  }

}

- (void)toggleSelectionForAssetCollectionReference:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  char v12;

  -[PXCuratedLibraryViewModel _indexPathsForAssetCollectionReference:](self, "_indexPathsForAssetCollectionReference:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryViewModel selectionSnapshot](self, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isSubsetOfSet:", v6);

  -[PXCuratedLibraryViewModel selectionManager](self, "selectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__PXCuratedLibraryViewModel_toggleSelectionForAssetCollectionReference___block_invoke;
  v10[3] = &unk_1E5144348;
  v12 = v7;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "performChanges:", v10);

}

- (id)_indexPathsForAssetCollectionReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  -[PXCuratedLibraryViewModel currentDataSource](self, "currentDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "indexPathForAssetCollectionReference:", v4);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }

  -[PXCuratedLibraryViewModel currentDataSource](self, "currentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v11;
  v10[1] = v12;
  objc_msgSend(v7, "indexPathSetForItemsInIndexPath:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setWantsSidebarVisible:(BOOL)a3
{
  self->_wantsSidebarVisible = a3;
  -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x20000000);
}

- (void)setWantsZoomControlVisible:(BOOL)a3
{
  self->_wantsZoomControlVisible = a3;
  -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0xFFFFFFFF80000000);
}

- (void)setIsModalInPresentation:(BOOL)a3
{
  if (self->_isModalInPresentation != a3)
  {
    self->_isModalInPresentation = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0xFFFFFFFF80000000);
  }
}

- (void)setSecondaryToolbarLegibilityGradientIsVisible:(BOOL)a3
{
  if (self->_secondaryToolbarLegibilityGradientIsVisible != a3)
  {
    self->_secondaryToolbarLegibilityGradientIsVisible = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0xFFFFFFFF80000000);
  }
}

- (BOOL)isResetToInitialState
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  if (-[PXCuratedLibraryViewModel zoomLevel](self, "zoomLevel") != 4)
    return 0;
  -[PXCuratedLibraryViewModel allPhotosContentFilterState](self, "allPhotosContentFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFiltering");

  if ((v4 & 1) != 0)
    return 0;
  -[PXCuratedLibraryViewModel zoomablePhotosViewModel](self, "zoomablePhotosViewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isResetToInitialState");

  return v7;
}

- (void)resetToInitialState
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[PXCuratedLibraryViewModel setIsResetting:](self, "setIsResetting:", 1);
  -[PXCuratedLibraryViewModel zoomablePhotosViewModel](self, "zoomablePhotosViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveCurrentZoomLevelAsUserPreferredIfPossible");

  -[PXCuratedLibraryViewModel setZoomLevel:](self, "setZoomLevel:", 4);
  -[PXCuratedLibraryViewModel allPhotosContentFilterState](self, "allPhotosContentFilterState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFiltering");

  if (v5)
    -[PXCuratedLibraryViewModel resetAllPhotosContentFilterState](self, "resetAllPhotosContentFilterState");
  -[PXCuratedLibraryViewModel zoomablePhotosViewModel](self, "zoomablePhotosViewModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performChanges:", &__block_literal_global_205_112161);

}

- (void)setDesiredVerticalAlignment:(unint64_t)a3
{
  if (self->_desiredVerticalAlignment != a3)
  {
    self->_desiredVerticalAlignment = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0xFFFFFFFF80000000);
  }
}

- (void)setSelectedAssetsTypedCount:(id)a3
{
  if (a3.var0 != self->_selectedAssetsTypedCount.count || a3.var1 != self->_selectedAssetsTypedCount.type)
  {
    self->_selectedAssetsTypedCount = ($7D1650DB7441A0F5833AC641852B48F3)a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0x8000000);
    -[PXCuratedLibraryViewModel _invalidateSelectModeCaption](self, "_invalidateSelectModeCaption");
  }
}

- (void)_invalidateSelectModeCaption
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateSelectModeCaption);

}

- (void)_updateSelectModeCaption
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  -[PXCuratedLibraryViewModel selectionSnapshot](self, "selectionSnapshot");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isAnyItemSelected"))
  {
    v4 = -[PXCuratedLibraryViewModel selectedAssetsTypedCount](self, "selectedAssetsTypedCount");
    v6 = v5;
  }
  else
  {
    v4 = *(_QWORD *)off_1E50B7F48;
    v6 = *((_QWORD *)off_1E50B7F48 + 1);
  }
  -[PXCuratedLibraryViewModel sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "hasPreview"))
  {

    goto LABEL_15;
  }
  v8 = objc_msgSend(v16, "isAnyItemSelected");

  if (!v8)
  {
LABEL_15:
    PXLocalizedSelectModeCaption(-[PXCuratedLibraryViewModel isSelecting](self, "isSelecting"), v4, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  -[PXCuratedLibraryViewModel assetActionManager](self, "assetActionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canPerformActionType:", CFSTR("PXAssetActionTypeMoveToPersonalLibrary"));
  v11 = objc_msgSend(v9, "canPerformActionType:", CFSTR("PXAssetActionTypeMoveToSharedLibrary"));
  if ((v10 & 1) == 0 && (v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryViewModel.m"), 976, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v12 = 15;
  if ((v10 & v11) == 0)
    v12 = 16;
  if (v10)
    v13 = v12;
  else
    v13 = 17;
  PXLocalizedSharedLibraryAssetCountForUsage(v4, v6, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  -[PXCuratedLibraryViewModel setSelectModeCaption:](self, "setSelectModeCaption:", v14);

}

- (void)setShouldShowEmptyPlaceholder:(BOOL)a3
{
  if (self->_shouldShowEmptyPlaceholder != a3)
  {
    self->_shouldShowEmptyPlaceholder = a3;
    -[PXCuratedLibraryViewModel _invalidateDesiredVerticalAlignment](self, "_invalidateDesiredVerticalAlignment");
    -[PXCuratedLibraryViewModel _invalidateAllowedActions](self, "_invalidateAllowedActions");
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0xFFFFFFFF80000000);
  }
}

- (void)setSecondaryToolbarVisibility:(double)a3
{
  if (self->_secondaryToolbarVisibility != a3)
  {
    self->_secondaryToolbarVisibility = a3;
    -[PXCuratedLibraryViewModel signalChange:](self, "signalChange:", 0xFFFFFFFF80000000);
  }
}

- (void)_updateFilteringTimeoutObserver
{
  void *v3;
  NSObject *filterTimeoutObserver;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[PXCuratedLibraryViewModel currentContentFilterState](self, "currentContentFilterState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isFiltering"))
  {
    filterTimeoutObserver = self->_filterTimeoutObserver;

    if (!filterTimeoutObserver)
    {
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __60__PXCuratedLibraryViewModel__updateFilteringTimeoutObserver__block_invoke;
      v12[3] = &unk_1E51441D8;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("PXPhotosResetViewNotificationName"), 0, 0, v12);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = self->_filterTimeoutObserver;
      self->_filterTimeoutObserver = v6;

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {

  }
  -[PXCuratedLibraryViewModel currentContentFilterState](self, "currentContentFilterState");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isFiltering") & 1) != 0)
  {

  }
  else
  {
    v8 = self->_filterTimeoutObserver;

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:", self->_filterTimeoutObserver);

      v10 = self->_filterTimeoutObserver;
      self->_filterTimeoutObserver = 0;

    }
  }
}

- (void)_invalidateIsModalInPresentation
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateIsModalInPresentation);

}

- (void)_updateIsModalInPresentation
{
  -[PXCuratedLibraryViewModel setIsModalInPresentation:](self, "setIsModalInPresentation:", -[PXCuratedLibraryViewModel isSelecting](self, "isSelecting"));
}

- (void)_invalidateShouldShowEmptyPlaceholder
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateShouldShowEmptyPlaceholder);

}

- (void)_updateShouldShowEmptyPlaceholder
{
  char v3;
  id v4;

  v3 = -[PXCuratedLibraryViewModel libraryState](self, "libraryState");
  -[PXCuratedLibraryViewModel currentContentFilterState](self, "currentContentFilterState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryViewModel setShouldShowEmptyPlaceholder:](self, "setShouldShowEmptyPlaceholder:", PXCuratedLibraryStateIsEmptyLibrary(v3) & ~objc_msgSend(v4, "isFiltering") & objc_msgSend(v4, "isContentFilterActive:", 2));

}

- (void)_invalidateDesiredVerticalAlignment
{
  id v2;

  -[PXCuratedLibraryViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDesiredVerticalAlignment);

}

- (void)_updateDesiredVerticalAlignment
{
  -[PXCuratedLibraryViewModel setDesiredVerticalAlignment:](self, "setDesiredVerticalAlignment:", -[PXCuratedLibraryViewModel shouldShowEmptyPlaceholder](self, "shouldShowEmptyPlaceholder"));
}

- (int64_t)curatedLibraryAssetsDataSourceManager:(id)a3 transitionTypeFromZoomLevel:(int64_t)a4 toZoomLevel:(int64_t)a5
{
  void *v8;
  int64_t v9;

  -[PXCuratedLibraryViewModel mainPresenter](self, "mainPresenter", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(v8, "viewModel:transitionTypeFromZoomLevel:toZoomLevel:", self, a4, a5);
  else
    v9 = 0;

  return v9;
}

- (id)selectionManager:(id)a3 validateSnapshot:(id)a4
{
  return a4;
}

- (void)_handleIsSelectingChange
{
  void *v3;
  _QWORD v4[5];

  if (!-[PXCuratedLibraryViewModel isSelecting](self, "isSelecting"))
  {
    -[PXCuratedLibraryViewModel selectionManager](self, "selectionManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "performChanges:", &__block_literal_global_229_112113);

  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PXCuratedLibraryViewModel__handleIsSelectingChange__block_invoke_2;
  v4[3] = &unk_1E5143468;
  v4[4] = self;
  -[PXCuratedLibraryViewModel performChanges:](self, "performChanges:", v4);
}

- (void)assetsDataSourceManagerDidFinishBackgroundFetching:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__PXCuratedLibraryViewModel_assetsDataSourceManagerDidFinishBackgroundFetching___block_invoke;
  v3[3] = &unk_1E5143468;
  v3[4] = self;
  -[PXCuratedLibraryViewModel performChanges:](self, "performChanges:", v3);
}

- (id)_updatedContentFilterState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryViewModel allPhotosContentFilterState](self, "allPhotosContentFilterState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v3, "includeScreenshots");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeScreenshots:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(v3, "includeSharedWithYou");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIncludeSharedWithYou:", objc_msgSend(v7, "BOOLValue"));

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id location;

  v9 = a3;
  if ((void *)PXUserDefaultsObservationContext == a6)
  {
    v10 = (void *)MEMORY[0x1E0C99EA0];
    v11 = a4;
    objc_msgSend(v10, "standardUserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v11, "isEqual:", v12);

    if ((_DWORD)v10)
    {
      if ((objc_msgSend(v9, "isEqual:", CFSTR("IncludeSharedWithYou")) & 1) != 0)
      {

LABEL_7:
        -[PXCuratedLibraryViewModel _updatedContentFilterState](self, "_updatedContentFilterState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __76__PXCuratedLibraryViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_1E5147280;
        objc_copyWeak(&v18, &location);
        v17 = v14;
        v15 = v14;
        dispatch_async(MEMORY[0x1E0C80D38], block);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
        goto LABEL_8;
      }
      v13 = objc_msgSend(v9, "isEqual:", CFSTR("IncludeScreenshots"));

      if ((v13 & 1) != 0)
        goto LABEL_7;
    }
    else
    {

    }
  }
LABEL_8:

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD v9[5];

  v5 = a4;
  NSStringFromSelector(sel_enableNewActionMenu);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {

LABEL_4:
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__PXCuratedLibraryViewModel_settings_changedValueForKey___block_invoke;
    v9[3] = &unk_1E5143468;
    v9[4] = self;
    -[PXCuratedLibraryViewModel performChanges:](self, "performChanges:", v9);
    goto LABEL_5;
  }
  NSStringFromSelector(sel_enableContentFiltering);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
    goto LABEL_4;
LABEL_5:

}

- (void)_sendAllPhotosSortOrderAnalyticsEvent:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PXCuratedLibraryViewModel__sendAllPhotosSortOrderAnalyticsEvent___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (_sendAllPhotosSortOrderAnalyticsEvent__onceToken != -1)
    dispatch_once(&_sendAllPhotosSortOrderAnalyticsEvent__onceToken, block);
}

- (PXCuratedLibraryViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setAssetActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetActionManager, a3);
}

- (void)setAssetCollectionActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollectionActionManager, a3);
}

- (BOOL)isResetting
{
  return self->_isResetting;
}

- (BOOL)isNavigating
{
  return self->_isNavigating;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (BOOL)isExpandedAnimating
{
  return self->_isExpandedAnimating;
}

- (BOOL)isFullyExpanded
{
  return self->_isFullyExpanded;
}

- (BOOL)wantsOptionalChromeVisible
{
  return self->_wantsOptionalChromeVisible;
}

- (BOOL)isModalInPresentation
{
  return self->_isModalInPresentation;
}

- (double)daysMarginScale
{
  return self->_daysMarginScale;
}

- (CGPoint)lastScrollDirection
{
  double x;
  double y;
  CGPoint result;

  x = self->_lastScrollDirection.x;
  y = self->_lastScrollDirection.y;
  result.y = y;
  result.x = x;
  return result;
}

- (NSString)selectModeCaption
{
  return self->_selectModeCaption;
}

- (PXPhotosViewOptionsModel)viewOptionsModel
{
  return self->_viewOptionsModel;
}

- (Class)cplActionManagerClass
{
  return self->_cplActionManagerClass;
}

- (BOOL)sidebarCanBecomeVisible
{
  return self->_sidebarCanBecomeVisible;
}

- (BOOL)wantsSidebarVisible
{
  return self->_wantsSidebarVisible;
}

- (BOOL)wantsZoomControlVisible
{
  return self->_wantsZoomControlVisible;
}

- (BOOL)enableFooter
{
  return self->_enableFooter;
}

- (BOOL)secondaryToolbarLegibilityGradientIsVisible
{
  return self->_secondaryToolbarLegibilityGradientIsVisible;
}

- (PXLibrarySummaryOutputPresenter)librarySummaryPresenter
{
  return (PXLibrarySummaryOutputPresenter *)objc_loadWeakRetained((id *)&self->_librarySummaryPresenter);
}

- (void)setLibrarySummaryPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_librarySummaryPresenter, a3);
}

- (BOOL)shouldShowEmptyPlaceholder
{
  return self->_shouldShowEmptyPlaceholder;
}

- (unint64_t)desiredVerticalAlignment
{
  return self->_desiredVerticalAlignment;
}

- (double)secondaryToolbarVisibility
{
  return self->_secondaryToolbarVisibility;
}

- (BOOL)isPerformingInitialChanges
{
  return self->_isPerformingInitialChanges;
}

- (PXSharedLibrarySharingSuggestionsCountsManager)sharedLibrarySuggestionCountsManager
{
  return self->_sharedLibrarySuggestionCountsManager;
}

- (PXSharedLibraryCameraSharingBannerStatusProvider)sharedLibraryCameraSharingBannerStatusProvider
{
  return self->_sharedLibraryCameraSharingBannerStatusProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedLibraryCameraSharingBannerStatusProvider, 0);
  objc_storeStrong((id *)&self->_sharedLibrarySuggestionCountsManager, 0);
  objc_storeStrong((id *)&self->_scrollingSpeedometer, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_destroyWeak((id *)&self->_librarySummaryPresenter);
  objc_storeStrong((id *)&self->_bannerViewConfiguration, 0);
  objc_storeStrong((id *)&self->_userWantsAspectFitContent, 0);
  objc_storeStrong((id *)&self->_cplActionManagerClass, 0);
  objc_storeStrong((id *)&self->_analysisStatus, 0);
  objc_storeStrong((id *)&self->_viewOptionsModel, 0);
  objc_storeStrong((id *)&self->_allPhotosContentFilterState, 0);
  objc_storeStrong((id *)&self->_currentContentFilterState, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_selectModeCaption, 0);
  objc_storeStrong((id *)&self->_draggedAssetReferences, 0);
  objc_storeStrong((id *)&self->_skimmingInfo, 0);
  objc_storeStrong((id *)&self->_zoomablePhotosViewModel, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_allowedActions, 0);
  objc_storeStrong((id *)&self->_assetCollectionActionManager, 0);
  objc_storeStrong((id *)&self->_assetActionManager, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_videoPlaybackController, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_styleGuide, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_filterTimeoutObserver, 0);
  objc_storeStrong((id *)&self->_cplUIStatusProvider, 0);
  objc_storeStrong((id *)&self->_visibleAssetCollections, 0);
  objc_storeStrong((id *)&self->_views, 0);
  objc_storeStrong((id *)&self->_presenters, 0);
}

uint64_t __67__PXCuratedLibraryViewModel__sendAllPhotosSortOrderAnalyticsEvent___block_invoke(uint64_t a1)
{
  const __CFString *v1;

  if (*(_QWORD *)(a1 + 32) == 1)
    v1 = CFSTR("com.apple.photos.CPAnalytics.allPhotosSortOrderDateCreated");
  else
    v1 = CFSTR("com.apple.photos.CPAnalytics.allPhotosSortOrderDateAdded");
  return objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", v1, MEMORY[0x1E0C9AA70]);
}

uint64_t __57__PXCuratedLibraryViewModel_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllowedActions");
}

void __76__PXCuratedLibraryViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__PXCuratedLibraryViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
  v4[3] = &unk_1E5127CD8;
  objc_copyWeak(&v6, v2);
  v5 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "performChanges:", v4);

  objc_destroyWeak(&v6);
}

void __76__PXCuratedLibraryViewModel_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAllPhotosContentFilterState:", v1);

}

uint64_t __80__PXCuratedLibraryViewModel_assetsDataSourceManagerDidFinishBackgroundFetching___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLibraryState");
}

uint64_t __53__PXCuratedLibraryViewModel__handleIsSelectingChange__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateSelectModeCaption");
}

uint64_t __53__PXCuratedLibraryViewModel__handleIsSelectingChange__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deselectAll");
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllowedActions");
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateScrollingProperties");
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllowedActions");
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLibraryState");
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(*(id *)(a1 + 40), "typedCount");
  return objc_msgSend(*(id *)(a1 + 32), "setSelectedAssetsTypedCount:", v2, v3);
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateBannerViewConfiguration");
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_10(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.allPhotosSortOrderChanged"), MEMORY[0x1E0C9AA70]);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAssetsDataSourceManager");
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateBannerViewConfiguration");
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_12(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateBannerViewConfiguration");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateChromeVisibility");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllowedActions");
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke_13(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAssetsDataSourceManager");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentDataSource");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllowedActions");
}

uint64_t __58__PXCuratedLibraryViewModel_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setZoomLevel:", 4);
}

void __60__PXCuratedLibraryViewModel__updateFilteringTimeoutObserver__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetAllPhotosContentFilterState");

}

uint64_t __48__PXCuratedLibraryViewModel_resetToInitialState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetToInitialState");
}

uint64_t __72__PXCuratedLibraryViewModel_toggleSelectionForAssetCollectionReference___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedState:forIndexPathSet:", *(_BYTE *)(a1 + 40) == 0, *(_QWORD *)(a1 + 32));
}

uint64_t __79__PXCuratedLibraryViewModel_toggleSelectionForIndexPath_updateCursorIndexPath___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v2;
  uint64_t v3;
  __int128 v4;
  _OWORD v6[2];

  v2 = *(_BYTE *)(a1 + 64) == 0;
  v3 = *(unsigned __int8 *)(a1 + 65);
  v4 = *(_OWORD *)(a1 + 48);
  v6[0] = *(_OWORD *)(a1 + 32);
  v6[1] = v4;
  return objc_msgSend(a2, "setSelectedState:forIndexPath:andUpdateCursorIndexPath:", v2, v6, v3);
}

uint64_t __42__PXCuratedLibraryViewModel_setZoomLevel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "zoomInToIndividualItemsWithAnchorAssetReference:animated:", 0, 0);
}

uint64_t __135__PXCuratedLibraryViewModel_initWithConfiguration_assetsDataSourceManagerConfiguration_zoomLevel_mediaProvider_specManager_styleGuide___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "resetAllPhotosContentFilterState");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAssetsDataSourceManager");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentDataSource");
}

uint64_t __135__PXCuratedLibraryViewModel_initWithConfiguration_assetsDataSourceManagerConfiguration_zoomLevel_mediaProvider_specManager_styleGuide___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateZoomablePhotosViewModel");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateUserWantsAspectFitContent");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAspectFitContent");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAllowedActions");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateLibraryState");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentContentFilterState");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateBannerViewConfiguration");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateChromeVisibility");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateShouldShowEmptyPlaceholder");
}

@end
