@implementation PXZoomablePhotosViewModel

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];

  v6 = a4;
  v9 = a3;
  v10 = v9;
  if ((void *)PXZoomablePhotosViewModelSpecManagerObserverContext != a5)
  {
    if ((void *)PXZoomablePhotosViewModelNumberAnimatorObserverContext != a5)
    {
      if ((void *)PXZoomablePhotosViewModelAlphaAnimatorObserverContext != a5)
      {
        if ((void *)PXZoomablePhotosViewModelDataSourceManagerObserverContext == a5)
        {
          if ((v6 & 1) == 0)
            goto LABEL_30;
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke_3;
          v27[3] = &unk_1E512BDB8;
          v27[4] = self;
          v14 = v27;
        }
        else
        {
          if ((void *)PXZoomablePhotosViewModelSelectionObserverContext != a5)
          {
            if ((void *)PXZoomablePhotosViewModelInlineHeadersDataSourceManagerObserverContext != a5)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosViewModel.m"), 1159, CFSTR("Code which should be unreachable has been reached"));

              abort();
            }
            if ((v6 & 1) != 0)
            {
              -[PXZoomableInlineHeadersDataSourceManager yearsDataSource](self->_inlineHeadersDataSourceManager, "yearsDataSource");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              -[PXZoomablePhotosViewModel setHasInlineHeadersContent:](self, "setHasInlineHeadersContent:", objc_msgSend(v11, "numberOfSections") > 0);

            }
            goto LABEL_30;
          }
          if ((v6 & 1) == 0)
            goto LABEL_30;
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke_4;
          v26[3] = &unk_1E512BDB8;
          v26[4] = self;
          v14 = v26;
        }
        -[PXZoomablePhotosViewModel performChanges:](self, "performChanges:", v14);
        goto LABEL_30;
      }
      if ((v6 & 6) == 0)
        goto LABEL_30;
      v12 = v9;
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_20;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "px_descriptionForAssertionMessage");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosViewModel.m"), 1134, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("observable"), v22, v24);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosViewModel.m"), 1134, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("observable"), v22);
      }

LABEL_20:
      if (self->_isUpdatingZoomState || (objc_msgSend(v12, "isBeingMutated") & 1) != 0)
        goto LABEL_24;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke_2;
      v28[3] = &unk_1E512BDB8;
      v28[4] = self;
      v13 = v28;
LABEL_23:
      -[PXZoomablePhotosViewModel performChanges:](self, "performChanges:", v13);
LABEL_24:

      goto LABEL_30;
    }
    if ((v6 & 6) == 0)
      goto LABEL_30;
    v12 = v9;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosViewModel.m"), 1125, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("observable"), v17, v19);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosViewModel.m"), 1125, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("observable"), v17);
    }

LABEL_14:
    if (self->_isUpdatingZoomState || (objc_msgSend(v12, "isBeingMutated") & 1) != 0)
      goto LABEL_24;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke;
    v29[3] = &unk_1E512BDB8;
    v29[4] = self;
    v13 = v29;
    goto LABEL_23;
  }
  if ((v6 & 1) != 0)
    -[PXZoomablePhotosViewModel _handleSpecChange](self, "_handleSpecChange");
LABEL_30:

}

uint64_t __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 64);
}

uint64_t __49__PXZoomablePhotosViewModel__updateAlphaAnimator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMaxColumnsForAspectFit:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (void)_handleSpecChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__PXZoomablePhotosViewModel__handleSpecChange__block_invoke;
  v2[3] = &unk_1E512BDB8;
  v2[4] = self;
  -[PXZoomablePhotosViewModel performChanges:](self, "performChanges:", v2);
}

uint64_t __54__PXZoomablePhotosViewModel__columnIndexForItemWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  double v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(a2, "doubleValue");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_QWORD *)(v7 + 24) == 0x7FFFFFFFFFFFFFFFLL || v6 >= *(double *)(a1 + 48))
    *(_QWORD *)(v7 + 24) = a3;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v8 + 24) == 0x7FFFFFFFFFFFFFFFLL && v6 <= *(double *)(a1 + 48))
    *(_QWORD *)(v8 + 24) = a3;
  return result;
}

- ($C4B70A1B11CB87E7174F2B82042BF1A7)zoomState
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self[5].var6;
  *(_OWORD *)&retstr->var10 = *(_OWORD *)&self[5].var4;
  *(_OWORD *)&retstr->var12 = v3;
  *(_QWORD *)&retstr->var14 = self[5].var11;
  v4 = *(_OWORD *)&self[4].var14;
  retstr->var0 = *(CGPoint *)&self[4].var12;
  *(_OWORD *)&retstr->var1 = v4;
  v5 = *(_OWORD *)&self[5].var2;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self[5].var0.y;
  *(_OWORD *)&retstr->var5 = v5;
  return self;
}

- (BOOL)isDisplayingIndividualItems
{
  int64_t columns;

  columns = self->_zoomState.columns;
  return columns <= -[PXZoomablePhotosViewModel _maxColumnsForIndividualItems](self, "_maxColumnsForIndividualItems");
}

- (int64_t)_maxColumnsForIndividualItems
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PXZoomablePhotosViewModel specManager](self, "specManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "maxColumnsForIndividualItems");

  return v4;
}

- (PXZoomablePhotosLayoutSpecManager)specManager
{
  return self->_specManager;
}

- (void)_updateAllowedColumns
{
  PXZoomablePhotosViewModel *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  PXZoomablePhotosViewModel *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v2 = self;
  v39 = *MEMORY[0x1E0C80C00];
  -[PXZoomablePhotosViewModel specManager](self, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedTraitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXZoomablePhotosViewModel preferredColumnCountsDelegate](v2, "preferredColumnCountsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredColumnCounts:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXZoomablePhotosViewModel setAllowedColumns:](v2, "setAllowedColumns:", v6);
  }
  else
  {
    -[PXZoomablePhotosViewModel specManager](v2, "specManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "spec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "supportedColumns");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minimumAssetsRequiredByColumn");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutReferenceSize");
    -[PXZoomablePhotosViewModel assetsDataSourceManager](v2, "assetsDataSourceManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "numberOfSections") < 1)
      v32 = 0;
    else
      v32 = objc_msgSend(v11, "numberOfItemsInSection:", 0);
    v12 = -[PXZoomablePhotosViewModel allowDenseLevels](v2, "allowDenseLevels");
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    if (PXSizeIsEmpty())
    {
      objc_msgSend(v13, "addObjectsFromArray:", v9);
    }
    else
    {
      v30 = v4;
      v31 = v13;
      v26 = v11;
      v27 = v9;
      v28 = v2;
      v29 = 0;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v14 = v9;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v15)
      {
        v16 = v15;
        v17 = 0;
        v18 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v35 != v18)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            v21 = objc_msgSend(v20, "integerValue", v26, v27, v28, v29, v30);
            if (v21 <= objc_msgSend(v8, "maxColumnsForIndividualItems"))
              v22 = 1;
            else
              v22 = v12;
            if (v22 == 1)
            {
              objc_msgSend(v33, "objectAtIndexedSubscript:", v17 + i);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "integerValue");

              if (v32 >= v24)
                objc_msgSend(v31, "addObject:", v20);
            }
          }
          v17 += i;
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v16);
      }

      v6 = v29;
      v4 = v30;
      v9 = v27;
      v2 = v28;
      v11 = v26;
      v13 = v31;
    }
    if (!objc_msgSend(v13, "count", v26, v27, v28, v29, v30))
    {
      objc_msgSend(v9, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v25);

    }
    -[PXZoomablePhotosViewModel setAllowedColumns:](v2, "setAllowedColumns:", v13);

  }
}

- (PXAssetsDataSourceManager)assetsDataSourceManager
{
  return self->_assetsDataSourceManager;
}

- (BOOL)allowDenseLevels
{
  void *v2;
  char v3;

  if (!-[PXZoomablePhotosViewModel isInSelectMode](self, "isInSelectMode"))
    return 1;
  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableDenseLevelsInSelectMode");

  return v3;
}

- (BOOL)isInSelectMode
{
  return self->_isInSelectMode;
}

- (PXPhotosPreferredColumnCountsDelegate)preferredColumnCountsDelegate
{
  return (PXPhotosPreferredColumnCountsDelegate *)objc_loadWeakRetained((id *)&self->_preferredColumnCountsDelegate);
}

uint64_t __216__PXZoomablePhotosViewModel_initWithDataSourceManager_selectionManager_mediaProvider_specManager_loadingStatusManager_badgesModifier_preferredAssetCropDelegate_preferredColumnCountsDelegate_inlinePlaybackController___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAllowedColumns");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAlphaAnimator");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateZoomState");
}

uint64_t __46__PXZoomablePhotosViewModel__handleSpecChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAlphaAnimator");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllowedColumns");
}

- (void)_invalidateAlphaAnimator
{
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateAlphaAnimator);
}

- (void)_setNeedsUpdate
{
  -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0);
}

- (void)setAllowedColumns:(id)a3
{
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  char v8;
  int64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  int64_t v15;
  uint64_t v16;
  _NSRange *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;

  v5 = (NSArray *)a3;
  v6 = self->_allowedColumns;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[NSArray isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_allowedColumns, a3);
      v9 = -[PXZoomablePhotosViewModel _maxColumnsForIndividualItems](self, "_maxColumnsForIndividualItems");
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = 0;
      v17 = (_NSRange *)&v16;
      v18 = 0x3010000000;
      v19 = &unk_1A7E74EE7;
      v20 = xmmword_1A7C0C330;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __47__PXZoomablePhotosViewModel_setAllowedColumns___block_invoke;
      v12[3] = &unk_1E511AD30;
      v14 = &v16;
      v15 = v9;
      v11 = v10;
      v13 = v11;
      -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v12);
      self->_denseColumnsIndexRange = v17[2];
      objc_storeStrong((id *)&self->_allowedColumnWidths, v10);
      -[PXZoomablePhotosViewModel _invalidateZoomState](self, "_invalidateZoomState");
      -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 4);

      _Block_object_dispose(&v16, 8);
    }
  }

}

- (void)_invalidateZoomState
{
  id v2;

  -[PXZoomablePhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateZoomState);

}

- (void)_invalidateAllowedColumns
{
  id v2;

  -[PXZoomablePhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAllowedColumns);

}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXZoomablePhotosViewModel;
  -[PXZoomablePhotosViewModel didPerformChanges](&v4, sel_didPerformChanges);
  -[PXZoomablePhotosViewModel updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXZoomablePhotosViewModel)initWithDataSourceManager:(id)a3 selectionManager:(id)a4 mediaProvider:(id)a5 specManager:(id)a6 loadingStatusManager:(id)a7 badgesModifier:(id)a8 preferredAssetCropDelegate:(id)a9 preferredColumnCountsDelegate:(id)a10 inlinePlaybackController:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PXZoomablePhotosViewModel *v23;
  PXZoomablePhotosViewModel *v24;
  uint64_t v25;
  PXUpdater *updater;
  void *v27;
  id badgesModifier;
  id v29;
  double v30;
  double v31;
  uint64_t v32;
  PXNumberAnimator *columnWidthAnimator;
  PXZoomablePhotosAlphaAnimator *v34;
  PXZoomablePhotosAlphaAnimator *alphaAnimator;
  PXZoomablePhotosMiniModeAnimator *v36;
  PXZoomablePhotosMiniModeAnimator *miniModeAnimator;
  id *v38;
  PXZoomableInlineHeadersDataSourceManager *v39;
  id v40;
  id v42;
  id v43;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id *v49;
  objc_super v50;

  v17 = a3;
  v47 = a4;
  v46 = a5;
  v42 = a6;
  v18 = a6;
  v43 = a7;
  v45 = a7;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v50.receiver = self;
  v50.super_class = (Class)PXZoomablePhotosViewModel;
  v23 = -[PXZoomablePhotosViewModel init](&v50, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_assetsDataSourceManager, a3);
    objc_storeStrong((id *)&v24->_selectionManager, a4);
    objc_storeStrong((id *)&v24->_mediaProvider, a5);
    objc_storeWeak((id *)&v24->_preferredAssetCropDelegate, v20);
    objc_storeWeak((id *)&v24->_preferredColumnCountsDelegate, v21);
    objc_storeWeak((id *)&v24->_inlinePlaybackController, v22);
    v25 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v24);
    updater = v24->_updater;
    v24->_updater = (PXUpdater *)v25;

    -[PXUpdater setNeedsUpdateSelector:](v24->_updater, "setNeedsUpdateSelector:", sel__setNeedsUpdate);
    -[PXUpdater addUpdateSelector:](v24->_updater, "addUpdateSelector:", sel__updateAllowedColumns);
    -[PXUpdater addUpdateSelector:](v24->_updater, "addUpdateSelector:", sel__updateAlphaAnimator);
    -[PXUpdater addUpdateSelector:](v24->_updater, "addUpdateSelector:", sel__updatePinchVelocity);
    -[PXUpdater addUpdateSelector:](v24->_updater, "addUpdateSelector:", sel__updateZoomState);
    -[PXUpdater addUpdateSelector:](v24->_updater, "addUpdateSelector:", sel__updateShouldHideSurroundingContent);
    -[PXUpdater addUpdateSelector:](v24->_updater, "addUpdateSelector:", sel__updateMiniModeAnimator);
    objc_storeStrong((id *)&v24->_specManager, v42);
    objc_msgSend(v18, "registerChangeObserver:context:", v24, PXZoomablePhotosViewModelSpecManagerObserverContext);
    objc_storeStrong((id *)&v24->_loadingStatusManager, v43);
    v27 = _Block_copy(v19);
    badgesModifier = v24->_badgesModifier;
    v24->_badgesModifier = v27;

    v24->_pendingZoomColumnIndex = 0x7FFFFFFFFFFFFFFFLL;
    v24->_isInteractiveZoomingAllowed = 1;
    v24->_zoomState.scale = 1.0;
    v24->_zoomState.columnIndex = 0;
    v24->_zoomState.normalizedColumnWidth = 1.0;
    v29 = objc_alloc((Class)off_1E50B3760);
    v30 = log10(fabs(v24->_zoomState.normalizedColumnWidth) * 1000.0 + 1.0);
    PXFloatSign();
    v32 = objc_msgSend(v29, "initWithValue:epsilon:", v31 * v30, 0.0001);
    columnWidthAnimator = v24->_columnWidthAnimator;
    v24->_columnWidthAnimator = (PXNumberAnimator *)v32;

    -[PXNumberAnimator setHighFrameRateReason:](v24->_columnWidthAnimator, "setHighFrameRateReason:", 2228226);
    -[PXNumberAnimator registerChangeObserver:context:](v24->_columnWidthAnimator, "registerChangeObserver:context:", v24, PXZoomablePhotosViewModelNumberAnimatorObserverContext);
    -[PXNumberAnimator setLabel:](v24->_columnWidthAnimator, "setLabel:", CFSTR("columnWidth"));
    v34 = objc_alloc_init(PXZoomablePhotosAlphaAnimator);
    alphaAnimator = v24->_alphaAnimator;
    v24->_alphaAnimator = v34;

    -[PXZoomablePhotosAlphaAnimator registerChangeObserver:context:](v24->_alphaAnimator, "registerChangeObserver:context:", v24, PXZoomablePhotosViewModelAlphaAnimatorObserverContext);
    v36 = objc_alloc_init(PXZoomablePhotosMiniModeAnimator);
    miniModeAnimator = v24->_miniModeAnimator;
    v24->_miniModeAnimator = v36;

    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __216__PXZoomablePhotosViewModel_initWithDataSourceManager_selectionManager_mediaProvider_specManager_loadingStatusManager_badgesModifier_preferredAssetCropDelegate_preferredColumnCountsDelegate_inlinePlaybackController___block_invoke;
    v48[3] = &unk_1E512BDB8;
    v38 = v24;
    v49 = v38;
    objc_msgSend(v38, "performChanges:", v48);
    objc_msgSend(v17, "registerChangeObserver:context:", v38, PXZoomablePhotosViewModelDataSourceManagerObserverContext);
    -[PXSectionedSelectionManager registerChangeObserver:context:](v24->_selectionManager, "registerChangeObserver:context:", v38, PXZoomablePhotosViewModelSelectionObserverContext);
    if (+[PXZoomableInlineHeadersDataSourceManager supportsAssetsDataSourceManager:](PXZoomableInlineHeadersDataSourceManager, "supportsAssetsDataSourceManager:", v17))
    {
      v39 = -[PXZoomableInlineHeadersDataSourceManager initWithAssetsDataSourceManager:]([PXZoomableInlineHeadersDataSourceManager alloc], "initWithAssetsDataSourceManager:", v17);
      v40 = v38[40];
      v38[40] = v39;

      objc_msgSend(v38[40], "registerChangeObserver:context:", v38, PXZoomablePhotosViewModelInlineHeadersDataSourceManagerObserverContext);
    }
    *((_BYTE *)v38 + 202) = 0;

  }
  return v24;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXZoomablePhotosViewModel;
  -[PXZoomablePhotosViewModel performChanges:](&v3, sel_performChanges_, a3);
}

void __63__PXZoomablePhotosViewModel__closestColumnIndexForColumnWidth___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 <= *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(v10, "doubleValue");
    v8 = vabdd_f64(v7, *(double *)(a1 + 64));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v8 < *(double *)(v9 + 24))
    {
      *(double *)(v9 + 24) = v8;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    }
  }

}

- (void)setViewBasedDecorationsEnabled:(BOOL)a3
{
  if (self->_viewBasedDecorationsEnabled != a3)
  {
    self->_viewBasedDecorationsEnabled = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 512);
  }
}

- (void)setIsInSelectMode:(BOOL)a3
{
  if (self->_isInSelectMode != a3)
  {
    self->_isInSelectMode = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 32);
    -[PXZoomablePhotosViewModel _invalidateAllowedColumns](self, "_invalidateAllowedColumns");
    -[PXZoomablePhotosViewModel _invalidateZoomState](self, "_invalidateZoomState");
  }
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

      -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 1024);
    }
  }

}

- (void)setAspectFit:(BOOL)a3
{
  if (self->_aspectFit != a3)
  {
    self->_aspectFit = a3;
    -[PXZoomablePhotosViewModel _invalidateAlphaAnimator](self, "_invalidateAlphaAnimator");
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 2);
  }
}

- (void)_updateAlphaAnimator
{
  _BOOL4 v3;
  int64_t v4;
  PXZoomablePhotosAlphaAnimator *alphaAnimator;
  _QWORD v6[5];
  _QWORD v7[3];
  int64_t v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  v3 = -[PXZoomablePhotosViewModel aspectFit](self, "aspectFit");
  v4 = 0;
  if (v3)
    v4 = -[PXZoomablePhotosViewModel _maxColumnsForIndividualItems](self, "_maxColumnsForIndividualItems");
  alphaAnimator = self->_alphaAnimator;
  v8 = v4;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PXZoomablePhotosViewModel__updateAlphaAnimator__block_invoke;
  v6[3] = &unk_1E511AD80;
  v6[4] = v7;
  -[PXZoomablePhotosAlphaAnimator performChanges:](alphaAnimator, "performChanges:", v6);
  _Block_object_dispose(v7, 8);
}

- (BOOL)aspectFit
{
  return self->_aspectFit;
}

- (void)_updateZoomState
{
  id v3;
  char v4;
  int64_t v5;
  double normalizedColumnWidthWhenPinchStarted;
  uint64_t v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  double v16;
  char v17;
  _BOOL4 v18;
  NSObject *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double pinchLogVelocity;
  BOOL *p_wasInteractiveZooming;
  double v37;
  double v38;
  int64_t v39;
  int64_t v40;
  int64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  char v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  int64_t v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  double v84;
  double v85;
  uint64_t v86;
  uint64_t v87;
  int64_t v88;
  uint64_t v89;
  uint64_t v90;
  double v91;
  double v92;
  uint64_t v93;
  double v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  id v102;
  char v103;
  double v104;
  unint64_t v105;
  NSObject *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  _BOOL4 v113;
  id pauseToken;
  id v115;
  id v116;
  dispatch_time_t v117;
  id v118;
  void *v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  _BOOL4 animatePendingZoom;
  uint64_t v127;
  _BOOL8 v128;
  char v129;
  BOOL isUpdatingZoomState;
  double v131;
  double v132;
  int v133;
  void *v134;
  PXZoomablePhotosAlphaAnimator *v135;
  void *v136;
  PXNumberAnimator *v137;
  _QWORD v138[7];
  char v139;
  BOOL v140;
  char v141;
  char v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  double v146;
  double v147;
  double v148;
  _QWORD block[4];
  id v150;
  id v151;
  _QWORD v152[5];
  _QWORD v153[6];
  char v154;
  _QWORD v155[5];
  _QWORD v156[5];
  _QWORD v157[5];
  _QWORD v158[5];
  _QWORD v159[5];
  _QWORD v160[5];
  _QWORD v161[4];
  id v162;
  uint64_t v163;
  _QWORD v164[4];
  id v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  uint64_t v177;
  __int128 buf;
  uint64_t v179;
  uint64_t (*v180)(uint64_t, uint64_t);
  void (*v181)(uint64_t);
  id v182;
  uint64_t v183;

  v183 = *MEMORY[0x1E0C80C00];
  isUpdatingZoomState = self->_isUpdatingZoomState;
  self->_isUpdatingZoomState = 1;
  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = 0;
  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  -[PXZoomablePhotosViewModel zoomState](self, "zoomState");
  v137 = self->_columnWidthAnimator;
  v135 = self->_alphaAnimator;
  -[PXZoomablePhotosViewModel allowedColumns](self, "allowedColumns");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXZoomablePhotosViewModel allowedColumnWidths](self, "allowedColumnWidths");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (self->_pendingZoomColumnIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = -[PXZoomablePhotosViewModel _clampColumnIndexToValidIndex:](self, "_clampColumnIndexToValidIndex:");
    self->_pendingZoomColumnIndex = 0x7FFFFFFFFFFFFFFFLL;
    v4 = 1;
  }
  v129 = v4;
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  v166 = 0u;
  -[PXZoomablePhotosViewModel pinchState](self, "pinchState");
  normalizedColumnWidthWhenPinchStarted = self->_normalizedColumnWidthWhenPinchStarted;
  v7 = *((_QWORD *)&v173 + 1);
  if (*((_QWORD *)&v173 + 1) >= (unint64_t)objc_msgSend(v3, "count"))
    v7 = objc_msgSend(v3, "count") - 1;
  -[PXZoomablePhotosAlphaAnimator allowedColumns](v135, "allowedColumns");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v3)
  {

    v11 = v3;
  }
  else
  {
    v9 = v8;
    v10 = objc_msgSend(v8, "isEqual:", v3);

    if ((v10 & 1) != 0)
      goto LABEL_10;
    v164[0] = MEMORY[0x1E0C809B0];
    v164[1] = 3221225472;
    v164[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke;
    v164[3] = &unk_1E511ADA8;
    v165 = v3;
    -[PXZoomablePhotosAlphaAnimator performChangesWithAnimation:changeBlock:](v135, "performChangesWithAnimation:changeBlock:", 0, v164);
    v11 = v165;
  }

LABEL_10:
  v12 = v173;
  objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = v12 == objc_msgSend(v13, "integerValue");

  if ((v12 & 1) == 0)
  {
    v161[0] = MEMORY[0x1E0C809B0];
    v161[1] = 3221225472;
    v161[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_2;
    v161[3] = &unk_1E511ADD0;
    v162 = v134;
    v163 = v7;
    -[PXNumberAnimator performChangesWithoutAnimation:](v137, "performChangesWithoutAnimation:", v161);
    v160[0] = MEMORY[0x1E0C809B0];
    v160[1] = 3221225472;
    v160[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_3;
    v160[3] = &__block_descriptor_40_e34_v16__0___PXMutableAlphaAnimator__8l;
    v160[4] = v7;
    -[PXZoomablePhotosAlphaAnimator performChangesWithAnimation:changeBlock:](v135, "performChangesWithAnimation:changeBlock:", 0, v160);

  }
  v14 = -[PXZoomablePhotosViewModel isPinching](self, "isPinching");
  v15 = -[PXZoomablePhotosViewModel isInteractiveZooming](self, "isInteractiveZooming");
  if ((v14 || v15 || self->_animatePendingZoom)
    && (!-[PXZoomablePhotosViewModel hasContentToZoom](self, "hasContentToZoom")
     || (unint64_t)objc_msgSend(v3, "count") <= 1))
  {
    if (!-[PXZoomablePhotosViewModel hasContentToZoom](self, "hasContentToZoom"))
    {
      PXAssertGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        animatePendingZoom = self->_animatePendingZoom;
        LODWORD(buf) = 67109632;
        DWORD1(buf) = v14;
        WORD4(buf) = 1024;
        *(_DWORD *)((char *)&buf + 10) = v15;
        HIWORD(buf) = 1024;
        LODWORD(v179) = animatePendingZoom;
        _os_log_fault_impl(&dword_1A6789000, v19, OS_LOG_TYPE_FAULT, "Has no content to zoom, but pinching:%d interactiveZooming:%d animatePendingZoom:%d", (uint8_t *)&buf, 0x14u);
      }

    }
    LOBYTE(v133) = 0;
    v17 = 0;
    v14 = 0;
    v18 = 0;
    self->_animatePendingZoom = 0;
    if (!self->_wasInteractiveZooming)
    {
      LOBYTE(v133) = 0;
      v20 = normalizedColumnWidthWhenPinchStarted * *(double *)&v169;
      goto LABEL_46;
    }
    goto LABEL_26;
  }
  v133 = v14 || v15;
  if (v15)
  {
    v17 = 1;
    v18 = 1;
    goto LABEL_26;
  }
  if (self->_wasInteractiveZooming)
  {
    v18 = 0;
    v17 = v14 || v15;
LABEL_26:
    -[PXZoomablePhotosViewModel interactiveZoomColumnIndex](self, "interactiveZoomColumnIndex");
    -[PXZoomablePhotosViewModel _columnWidthForDesiredColumnIndex:](self, "_columnWidthForDesiredColumnIndex:");
    v20 = v21;
    if ((v17 & 1) != 0)
    {
      v22 = *((double *)&v166 + 1);
      v23 = *(double *)&v166;
      v24 = 0.5;
      if (v14)
        v16 = *((double *)&v166 + 1);
      else
        v16 = 0.5;
      if (v14)
        v24 = *(double *)&v166;
      if (v18 && !self->_wasInteractiveZooming)
      {
        v131 = v24;
        v132 = v16;
        objc_msgSend(v136, "zoomSpringStiffness");
        v33 = v32;
        objc_msgSend(v136, "zoomSpringStiffness");
        v159[0] = MEMORY[0x1E0C809B0];
        v159[1] = 3221225472;
        v159[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_48;
        v159[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
        *(double *)&v159[4] = v20;
        -[PXNumberAnimator performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:](v137, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", v159, v33, v34, 0.0);
        LOBYTE(v18) = 1;
LABEL_43:
        self->_wasPinching = v14;
        self->_wasInteractiveZooming = v18;
        BYTE4(v128) = 1;
LABEL_57:
        LOBYTE(v128) = 1;
        v56 = 1;
        goto LABEL_58;
      }
      if (v14)
        goto LABEL_35;
      goto LABEL_39;
    }
    goto LABEL_46;
  }
  v24 = *(double *)&v169;
  v20 = normalizedColumnWidthWhenPinchStarted * *(double *)&v169;
  if (v133)
  {
    LOBYTE(v18) = 0;
    LOBYTE(v133) = 1;
    if (v14)
    {
      v22 = *((double *)&v166 + 1);
      v23 = *(double *)&v166;
LABEL_35:
      objc_msgSend(v136, "pinchSmoothingDuration", v24, v16);
      v26 = v25;
      LOBYTE(v14) = 1;
LABEL_40:
      v28 = log10(fabs(v20) * 1000.0 + 1.0);
      PXFloatSign();
      v30 = v29;
      -[PXNumberAnimator value](v137, "value");
      v31 = v28 * v30;
      if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
      {
        v158[0] = MEMORY[0x1E0C809B0];
        v158[1] = 3221225472;
        v158[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_2_50;
        v158[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
        *(double *)&v158[4] = v31;
        -[PXNumberAnimator performChangesWithDuration:curve:changes:](v137, "performChangesWithDuration:curve:changes:", 1, v158, v26);
      }
      v131 = v23;
      v132 = v22;
      goto LABEL_43;
    }
LABEL_39:
    objc_msgSend(v136, "sliderSmoothingDuration", v24, v16);
    v26 = v27;
    LOBYTE(v14) = 0;
    v22 = 0.5;
    v23 = 0.5;
    goto LABEL_40;
  }
  LOBYTE(v133) = 0;
LABEL_46:
  v131 = *MEMORY[0x1E0C9D538];
  v132 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (self->_wasPinching)
  {
    pinchLogVelocity = self->_pinchLogVelocity;
    p_wasInteractiveZooming = &self->_wasInteractiveZooming;
    if (!self->_wasInteractiveZooming)
    {
      log10(fabs(v20) * 1000.0 + 1.0);
      PXFloatSign();
      objc_msgSend(v136, "zoomDecelerationRate");
      PXProjectValueWithDecelerationRate();
      v38 = v37;
      v39 = -[PXZoomablePhotosViewModel _closestColumnIndexForColumnWidth:](self, "_closestColumnIndexForColumnWidth:", self->_normalizedColumnWidthWhenPinchStarted);
      v40 = -[PXZoomablePhotosViewModel _closestColumnIndexForAnimatedValue:](self, "_closestColumnIndexForAnimatedValue:", fmax(v38, 0.00001));
      if (v40 != v39)
      {
LABEL_56:
        objc_msgSend(v3, "objectAtIndexedSubscript:", v40);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "doubleValue");
        v49 = v48;

        v50 = log10(fabs(1.0 / v49) * 1000.0 + 1.0);
        PXFloatSign();
        v52 = v51;
        objc_msgSend(v136, "zoomSpringStiffness");
        v54 = v53;
        objc_msgSend(v136, "zoomSpringDamping");
        v157[0] = MEMORY[0x1E0C809B0];
        v157[1] = 3221225472;
        v157[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_3_51;
        v157[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
        *(double *)&v157[4] = v52 * v50;
        -[PXNumberAnimator performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:](v137, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", v157, v54, v55, pinchLogVelocity);
        BYTE4(v128) = 0;
        *p_wasInteractiveZooming = 0;
        self->_wasPinching = 0;
        goto LABEL_57;
      }
      v41 = -[PXZoomablePhotosViewModel _nextColumnIndexForInitialColumnWidth:currentColumnWidth:velocity:](self, "_nextColumnIndexForInitialColumnWidth:currentColumnWidth:velocity:", v40, self->_normalizedColumnWidthWhenPinchStarted, v20, *((double *)&v169 + 1));
LABEL_55:
      v40 = v41;
      goto LABEL_56;
    }
LABEL_52:
    -[PXZoomablePhotosAlphaAnimator columnIndex](self->_alphaAnimator, "columnIndex");
    v43 = v42;
    -[PXZoomablePhotosAlphaAnimator presentationColumnIndex](self->_alphaAnimator, "presentationColumnIndex");
    v45 = round(v44);
    if (round(v43) == v45)
    {
      -[PXZoomablePhotosViewModel interactiveZoomColumnIndex](self, "interactiveZoomColumnIndex");
      v45 = round(v46);
    }
    v41 = -[PXZoomablePhotosViewModel _clampColumnIndexToValidIndex:](self, "_clampColumnIndexToValidIndex:", (uint64_t)v45);
    goto LABEL_55;
  }
  p_wasInteractiveZooming = &self->_wasInteractiveZooming;
  if (self->_wasInteractiveZooming)
  {
    pinchLogVelocity = 0.0;
    goto LABEL_52;
  }
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v128 = BYTE9(v174) != 0;
    v56 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v5);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "doubleValue");
    v121 = v120;

    v122 = 1.0 / v121;
    if (self->_animatePendingZoom)
    {
      objc_msgSend(v136, "zoomSpringStiffness");
      v124 = v123;
      objc_msgSend(v136, "zoomSpringDamping");
      v156[0] = MEMORY[0x1E0C809B0];
      v156[1] = 3221225472;
      v156[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_4;
      v156[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
      *(double *)&v156[4] = v122;
      -[PXNumberAnimator performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:](v137, "performChangesUsingSpringAnimationWithStiffness:dampingRatio:initialVelocity:changes:", v156, v124, v125, 0.0);
    }
    else
    {
      v155[0] = MEMORY[0x1E0C809B0];
      v155[1] = 3221225472;
      v155[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_5;
      v155[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
      *(double *)&v155[4] = 1.0 / v121;
      -[PXNumberAnimator performChangesWithoutAnimation:](v137, "performChangesWithoutAnimation:", v155);
    }
    v128 = 0;
    v56 = 0;
    v131 = 0.5;
    v132 = 0.5;
  }
LABEL_58:
  self->_animatePendingZoom = 0;
  -[PXNumberAnimator value](v137, "value");
  v58 = __exp10(fabs(v57));
  PXFloatSign();
  v60 = v59;
  -[PXNumberAnimator presentationValue](v137, "presentationValue");
  v62 = __exp10(fabs(v61));
  PXFloatSign();
  v64 = v63;
  v65 = v60 * ((v58 + -1.0) / 1000.0);
  v66 = -[PXZoomablePhotosViewModel _closestColumnIndexForColumnWidth:](self, "_closestColumnIndexForColumnWidth:", v65);
  objc_msgSend(v3, "objectAtIndexedSubscript:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = objc_msgSend(v67, "integerValue");

  -[PXNumberAnimator presentationValue](v137, "presentationValue");
  objc_msgSend(v134, "firstObject");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "doubleValue");
  v70 = v69;

  objc_msgSend(v134, "lastObject");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "doubleValue");
  v73 = v72;

  log10(fabs(v70) * 1000.0 + 1.0);
  PXFloatSign();
  objc_msgSend(v136, "zoomInRubberBanding");
  PXSoftClamp();
  log10(fabs(v73) * 1000.0 + 1.0);
  PXFloatSign();
  PXFloatSign();
  objc_msgSend(v136, "zoomOutRubberBanding");
  PXSoftClamp();
  v75 = __exp10(fabs(v74));
  PXFloatSign();
  v77 = v76;
  -[PXZoomablePhotosViewModel _columnIndexForItemWidth:](self, "_columnIndexForItemWidth:", v64 * ((v62 + -1.0) / 1000.0) + (v65 - v64 * ((v62 + -1.0) / 1000.0)) * 0.0001);
  v79 = v78;
  -[PXZoomablePhotosViewModel _columnIndexForItemWidth:](self, "_columnIndexForItemWidth:", v65);
  v81 = v80;
  if ((v56 & 1) != 0)
    v82 = 1;
  else
    v82 = -[PXNumberAnimator isAnimating](v137, "isAnimating");
  v153[0] = MEMORY[0x1E0C809B0];
  v153[1] = 3221225472;
  v153[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_6;
  v153[3] = &__block_descriptor_49_e34_v16__0___PXMutableAlphaAnimator__8l;
  v153[4] = v79;
  v153[5] = v81;
  v154 = v133;
  -[PXZoomablePhotosAlphaAnimator performChangesWithAnimation:changeBlock:](v135, "performChangesWithAnimation:changeBlock:", v82, v153);
  v83 = v77 * ((v75 + -1.0) / 1000.0);
  -[PXZoomablePhotosViewModel _columnIndexForItemWidth:](self, "_columnIndexForItemWidth:", v83);
  v85 = v84;
  if (objc_msgSend(v136, "enableAutoCrossfade"))
    -[PXZoomablePhotosAlphaAnimator presentationColumnIndex](self->_alphaAnimator, "presentationColumnIndex");
  v86 = objc_msgSend(v3, "count");
  v87 = vcvtmd_s64_f64(v85);
  if (v86 - 1 < v87)
    v87 = v86 - 1;
  v88 = vcvtpd_s64_f64(v85);
  v89 = v87 & ~(v87 >> 63);
  if (v86 - 1 >= v88)
    v90 = v88;
  else
    v90 = v86 - 1;
  PXClamp();
  v92 = v91;
  v93 = v90 & ~(v90 >> 63);
  v94 = 1.0;
  if (-[PXZoomablePhotosViewModel hasInlineHeadersContent](self, "hasInlineHeadersContent"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v89);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "integerValue");

    objc_msgSend(v3, "objectAtIndexedSubscript:", v93);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v97, "integerValue");

    -[PXZoomablePhotosViewModel specManager](self, "specManager");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "spec");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v100, "maxColumnsForStickyHeaderDisplay");

    if (v98 > v101)
    {
      if (v96 <= v101)
        v94 = 1.0 - v92;
      else
        v94 = 0.0;
    }
  }
  if ((v128 & 0x100000000) != 0 || -[PXNumberAnimator isAnimating](v137, "isAnimating"))
  {
    -[PXZoomablePhotosViewModel assetsDataSourceManager](self, "assetsDataSourceManager");
    v102 = (id)objc_claimAutoreleasedReturnValue();
LABEL_76:
    if (!self->_pauseToken)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v179 = 0x3032000000;
      v180 = __Block_byref_object_copy__29287;
      v181 = __Block_byref_object_dispose__29288;
      v182 = 0;
      v152[0] = MEMORY[0x1E0C809B0];
      v152[1] = 3221225472;
      v152[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_53;
      v152[3] = &unk_1E5145E98;
      v152[4] = &buf;
      objc_msgSend(v102, "performChanges:", v152);
      objc_storeStrong(&self->_pauseToken, *(id *)(*((_QWORD *)&buf + 1) + 40));
      _Block_object_dispose(&buf, 8);

    }
    v103 = 1;
    goto LABEL_79;
  }
  v113 = -[PXZoomablePhotosAlphaAnimator isAnimating](v135, "isAnimating");
  -[PXZoomablePhotosViewModel assetsDataSourceManager](self, "assetsDataSourceManager");
  v102 = (id)objc_claimAutoreleasedReturnValue();
  if (v113)
    goto LABEL_76;
  pauseToken = self->_pauseToken;
  if (pauseToken)
  {
    v115 = pauseToken;
    v116 = self->_pauseToken;
    self->_pauseToken = 0;

    v117 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_2_56;
    block[3] = &unk_1E5148D08;
    v102 = v102;
    v150 = v102;
    v151 = v115;
    v118 = v115;
    dispatch_after(v117, MEMORY[0x1E0C80D38], block);

  }
  v103 = 0;
LABEL_79:
  v104 = v83 / (1.0 / (double)v127);
  v105 = (unint64_t)(COERCE__INT64(fabs(v104)) - 0x10000000000000) >> 53;
  if ((*(uint64_t *)&v104 <= -1 || v105 >= 0x3FF) && (unint64_t)(*(_QWORD *)&v104 - 1) >= 0xFFFFFFFFFFFFFLL)
  {
    PXAssertGetLog();
    v108 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v83 / (1.0 / (double)v127);
      _os_log_error_impl(&dword_1A6789000, v108, OS_LOG_TYPE_ERROR, "Invalid scale:%.3f", (uint8_t *)&buf, 0xCu);
    }

  }
  -[PXNumberAnimator approximateVelocity](v137, "approximateVelocity");
  v110 = v109;
  objc_msgSend(v3, "objectAtIndexedSubscript:", v66);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v111, "integerValue");

  *(double *)v138 = v131;
  *(double *)&v138[1] = v132;
  *(double *)&v138[2] = v83 / (1.0 / (double)v127);
  v138[3] = v110;
  v138[4] = v112;
  v138[5] = v66;
  *(double *)&v138[6] = v83;
  v139 = v103;
  v140 = v128;
  v141 = v133;
  v142 = v129;
  v143 = 0;
  v144 = v89;
  v145 = v93;
  v146 = v85 - (double)v89;
  v147 = v92;
  v148 = v94;
  -[PXZoomablePhotosViewModel setZoomState:](self, "setZoomState:", v138);
  self->_isUpdatingZoomState = isUpdatingZoomState;

}

- (double)_columnIndexForItemWidth:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  -[PXZoomablePhotosViewModel allowedColumnWidths](self, "allowedColumnWidths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__PXZoomablePhotosViewModel__columnIndexForItemWidth___block_invoke;
  v12[3] = &unk_1E51321E0;
  *(double *)&v12[6] = a3;
  v12[4] = &v17;
  v12[5] = &v13;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);
  v5 = v14[3];
  v6 = v18;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v18[3];
    v14[3] = v5;
  }
  v7 = 0.0;
  if (v6[3] != v5)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");

    objc_msgSend(v4, "objectAtIndexedSubscript:", v14[3]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");

    PXClamp();
    PXClamp();
    v5 = v18[3];
  }
  v10 = v7 + (double)v5;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v10;
}

- (NSArray)allowedColumnWidths
{
  return self->_allowedColumnWidths;
}

- (void)setZoomState:(id *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v5 = *(_OWORD *)&a3->var1;
  v4 = *(_OWORD *)&a3->var3;
  self->_zoomState.normalizedScaleCenter = a3->var0;
  *(_OWORD *)&self->_zoomState.scale = v5;
  *(_OWORD *)&self->_zoomState.columns = v4;
  v7 = *(_OWORD *)&a3->var10;
  v6 = *(_OWORD *)&a3->var12;
  v8 = *(_OWORD *)&a3->var5;
  self->_zoomState.stickyHeaderOpacity = a3->var14;
  *(_OWORD *)&self->_zoomState.fromColumnIndex = v7;
  *(_OWORD *)&self->_zoomState.interactiveProgress = v6;
  *(_OWORD *)&self->_zoomState.normalizedColumnWidth = v8;
  -[PXZoomablePhotosViewModel _invalidateShouldHideSurroundingContent](self, "_invalidateShouldHideSurroundingContent");
  -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 1);
}

- ($49CB12D5354CCF22210FF066E175BE67)pinchState
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[5].var6;
  *(_OWORD *)&retstr->var2.y = *(_OWORD *)&self[5].var4;
  *(_OWORD *)&retstr->var4 = v3;
  *(CGPoint *)&retstr->var6 = self[6].var0;
  v4 = *(_OWORD *)&self[5].var2.y;
  retstr->var0 = *(CGPoint *)&self[5].var1;
  *(_OWORD *)&retstr->var1 = v4;
  return self;
}

- (BOOL)isPinching
{
  return self->_isPinching;
}

- (BOOL)isInteractiveZooming
{
  return self->_isInteractiveZooming;
}

- (BOOL)hasInlineHeadersContent
{
  return self->_hasInlineHeadersContent;
}

- (void)_invalidateShouldHideSurroundingContent
{
  id v2;

  -[PXZoomablePhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateShouldHideSurroundingContent);

}

- (int64_t)_closestColumnIndexForColumnWidth:(double)a3
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  id v11;
  unint64_t v12;
  int64_t v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  double v22;
  _QWORD v23[4];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  -[PXZoomablePhotosViewModel allowedColumns](self, "allowedColumns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXZoomablePhotosViewModel allowedColumnWidths](self, "allowedColumnWidths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (!-[PXZoomablePhotosViewModel allowDenseLevels](self, "allowDenseLevels"))
  {
    v10 = -[PXZoomablePhotosViewModel _maxColumnsForIndividualItems](self, "_maxColumnsForIndividualItems");
    if (v9 >= v10)
      v9 = v10;
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0x7FFFFFFFFFFFFFFFLL;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0x7FEFFFFFFFFFFFFFLL;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__PXZoomablePhotosViewModel__closestColumnIndexForColumnWidth___block_invoke;
  v17[3] = &unk_1E511AD08;
  v11 = v6;
  v22 = a3;
  v18 = v11;
  v19 = v23;
  v20 = &v24;
  v21 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17);
  v12 = v25[3];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosViewModel.m"), 462, CFSTR("Unable to find number of columns"));

    v12 = v25[3];
    if ((v12 & 0x8000000000000000) != 0)
      goto LABEL_9;
  }
  else if ((v12 & 0x8000000000000000) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosViewModel.m"), 463, CFSTR("Invalid column index"));

    goto LABEL_7;
  }
  if (v12 >= objc_msgSend(v11, "count"))
    goto LABEL_9;
LABEL_7:
  v13 = v25[3];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

- (NSArray)allowedColumns
{
  return self->_allowedColumns;
}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_6(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = *(double *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setColumnIndex:", v3);
  objc_msgSend(v5, "setTargetColumnIndex:", *(double *)(a1 + 40));
  v4 = 1.0;
  if (!*(_BYTE *)(a1 + 48))
    v4 = 0.0;
  objc_msgSend(v5, "setAutoFadeAmount:", v4);

}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_3(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = (double)*(uint64_t *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setColumnIndex:", v3);
  objc_msgSend(v4, "setTargetColumnIndex:", (double)*(uint64_t *)(a1 + 32));
  objc_msgSend(v4, "setAutoFadeAmount:", 0.0);

}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setAllowedColumns:", v2);
  objc_msgSend(v3, "setAutoFadeAmount:", 0.0);

}

- (void)_updateShouldHideSurroundingContent
{
  -[PXZoomablePhotosViewModel shouldHideSurroundingContent](self, "shouldHideSurroundingContent");
  -[PXZoomablePhotosViewModel zoomState](self, "zoomState", 0, 0);
  -[PXZoomablePhotosViewModel setShouldHideSurroundingContent:](self, "setShouldHideSurroundingContent:", 0);
}

- (BOOL)shouldHideSurroundingContent
{
  return self->_shouldHideSurroundingContent;
}

- (void)setShouldHideSurroundingContent:(BOOL)a3
{
  if (self->_shouldHideSurroundingContent != a3)
  {
    self->_shouldHideSurroundingContent = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0x4000);
  }
}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "objectAtIndexedSubscript:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v6 = log10(fabs(v5) * 1000.0 + 1.0);
  PXFloatSign();
  objc_msgSend(v4, "setValue:", v7 * v6);

}

- (PXZoomablePhotosViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosViewModel.m"), 91, CFSTR("%s is not available as initializer"), "-[PXZoomablePhotosViewModel init]");

  abort();
}

- (void)dealloc
{
  id v3;
  PXAssetsDataSourceManager *v4;
  PXAssetsDataSourceManager *v5;
  objc_super v6;
  _QWORD block[4];
  PXAssetsDataSourceManager *v8;
  id v9;

  v3 = self->_pauseToken;
  if (v3)
  {
    v4 = self->_assetsDataSourceManager;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__PXZoomablePhotosViewModel_dealloc__block_invoke;
    block[3] = &unk_1E5148D08;
    v8 = v4;
    v9 = v3;
    v5 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  v6.receiver = self;
  v6.super_class = (Class)PXZoomablePhotosViewModel;
  -[PXZoomablePhotosViewModel dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; %p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)performInitialChanges:(id)a3
{
  id v4;
  BOOL isPerformingInitialChanges;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  isPerformingInitialChanges = self->_isPerformingInitialChanges;
  self->_isPerformingInitialChanges = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PXZoomablePhotosViewModel_performInitialChanges___block_invoke;
  v7[3] = &unk_1E511ACB8;
  v8 = v4;
  v6 = v4;
  -[PXZoomablePhotosViewModel performChanges:](self, "performChanges:", v7);
  self->_isPerformingInitialChanges = isPerformingInitialChanges;

}

- (PXSelectionSnapshot)selectionSnapshot
{
  void *v2;
  void *v3;

  -[PXZoomablePhotosViewModel selectionManager](self, "selectionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXSelectionSnapshot *)v3;
}

- (PXZoomablePhotosUserDefaults)userDefaults
{
  void *v2;
  void *v3;

  -[PXZoomablePhotosViewModel specManager](self, "specManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXZoomablePhotosUserDefaults *)v3;
}

- (BOOL)hasContentToZoom
{
  void *v2;
  void *v3;
  char v4;

  -[PXZoomablePhotosViewModel assetsDataSourceManager](self, "assetsDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsAnyItems");

  return v4;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  if (self->_lowMemoryMode != a3)
    self->_lowMemoryMode = a3;
}

- (void)setDropTargetAssetReference:(id)a3
{
  PXAssetReference *v5;
  PXAssetReference *v6;
  char v7;
  PXAssetReference *v8;

  v8 = (PXAssetReference *)a3;
  v5 = self->_dropTargetAssetReference;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXAssetReference isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dropTargetAssetReference, a3);
      -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 2048);
    }
  }

}

- (void)setIsPinching:(BOOL)a3
{
  if (self->_isPinching != a3)
  {
    self->_isPinching = a3;
    if (a3)
    {
      self->_normalizedColumnWidthWhenPinchStarted = self->_zoomState.normalizedColumnWidth;
      self->_pinchLastDate = 0.0;
      self->_pinchLogValue = 0.0;
      self->_pinchLogVelocity = 0.0;
    }
    -[PXZoomablePhotosViewModel _invalidatePinchVelocity](self, "_invalidatePinchVelocity");
    -[PXZoomablePhotosViewModel _invalidateZoomState](self, "_invalidateZoomState");
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 128);
  }
}

- (void)setPinchState:(id *)a3 withAnchorAssetReference:(id)a4
{
  PXAssetReference *v7;
  PXAssetReference *v8;
  $ADDCB68D4A5F49641AE0B7A8D1985833 *p_pinchState;
  double var4;
  float64x2_t v12;
  NSObject *v15;
  double v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  PXZoomablePhotosViewModel *v21;
  double v22;
  double var5;
  int v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = (PXAssetReference *)a4;
  v8 = v7;
  p_pinchState = &self->_pinchState;
  if (self->_pinchState.normalizedPosition.x == a3->var2.x && self->_pinchState.normalizedPosition.y == a3->var2.y)
  {
    var4 = a3->var4;
    v12.f64[0] = var4;
    v12.f64[1] = a3->var3;
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)vextq_s8((int8x16_t)p_pinchState->normalizedInitialPosition, (int8x16_t)p_pinchState->normalizedInitialPosition, 8uLL), (float64x2_t)vextq_s8((int8x16_t)a3->var0, (int8x16_t)a3->var0, 8uLL)), (int32x4_t)vceqq_f64((float64x2_t)vextq_s8(*(int8x16_t *)&self->_pinchState.initialScale, *(int8x16_t *)&self->_pinchState.initialScale, 8uLL), v12))), 0xFuLL))) & 1) != 0
      && self->_pinchState.scaleVelocity == a3->var5
      && self->_pinchState.lastEventTime == a3->var7
      && self->_pinchState.events == a3->var6
      && self->_anchorAssetReference == v7)
    {
      goto LABEL_30;
    }
  }
  else
  {
    var4 = a3->var4;
  }
  if ((*(uint64_t *)&var4 <= -1 || ((*(_QWORD *)&var4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
    && (unint64_t)(*(_QWORD *)&var4 - 1) >= 0xFFFFFFFFFFFFFLL)
  {
    PXAssertGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v22 = a3->var4;
      v24 = 134217984;
      v25 = v22;
      _os_log_error_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Invalid scale:%.3f", (uint8_t *)&v24, 0xCu);
    }

  }
  v16 = fabs(a3->var5);
  if (v16 >= INFINITY && v16 <= INFINITY)
  {
    PXAssertGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      var5 = a3->var5;
      v24 = 134217984;
      v25 = var5;
      _os_log_error_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Invalid scaleVelocity:%.3f", (uint8_t *)&v24, 0xCu);
    }

  }
  p_pinchState->normalizedInitialPosition = a3->var0;
  v18 = *(_OWORD *)&a3->var1;
  v19 = *(_OWORD *)&a3->var2.y;
  v20 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_pinchState.scale = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_pinchState.events = v20;
  *(_OWORD *)&self->_pinchState.normalizedInitialPinchDistance = v18;
  *(_OWORD *)&self->_pinchState.normalizedPosition.y = v19;
  objc_storeStrong((id *)&self->_anchorAssetReference, a4);
  v21 = self;
  if (kdebug_is_enabled())
    kdebug_trace();

  -[PXZoomablePhotosViewModel _invalidatePinchVelocity](v21, "_invalidatePinchVelocity");
  -[PXZoomablePhotosViewModel _invalidateZoomState](v21, "_invalidateZoomState");
  -[PXZoomablePhotosViewModel signalChange:](v21, "signalChange:", 256);
LABEL_30:

}

- (void)setViewMode:(unint64_t)a3
{
  if (self->_viewMode != a3)
  {
    self->_viewMode = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0x200000);
    -[PXZoomablePhotosViewModel _invalidateMiniModeAnimator](self, "_invalidateMiniModeAnimator");
  }
}

- (void)setViewModeInteractionProgress:(double)a3
{
  if (self->_viewModeInteractionProgress != a3)
  {
    self->_viewModeInteractionProgress = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0x400000);
    -[PXZoomablePhotosViewModel _invalidateMiniModeAnimator](self, "_invalidateMiniModeAnimator");
  }
}

- (void)setMiniModeAnchorAssetReference:(id)a3
{
  PXAssetReference *v4;
  char v5;
  PXAssetReference *v6;
  PXAssetReference *miniModeAnchorAssetReference;
  PXAssetReference *v8;

  v8 = (PXAssetReference *)a3;
  v4 = self->_miniModeAnchorAssetReference;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXAssetReference isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (PXAssetReference *)-[PXAssetReference copy](v8, "copy");
      miniModeAnchorAssetReference = self->_miniModeAnchorAssetReference;
      self->_miniModeAnchorAssetReference = v6;

      -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0x800000);
    }
  }

}

- (int64_t)denseZoomLevelForZoomState:(id *)a3
{
  int64_t v5;
  int64_t v6;
  void *v7;
  int64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = -[PXZoomablePhotosViewModel _maxColumnsForIndividualItems](self, "_maxColumnsForIndividualItems");
  if (a3->var3 <= v5)
    return 0;
  v6 = v5;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[PXZoomablePhotosViewModel allowedColumns](self, "allowedColumns");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__PXZoomablePhotosViewModel_denseZoomLevelForZoomState___block_invoke;
  v10[3] = &unk_1E511ACE0;
  v10[4] = &v11;
  v10[5] = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  v8 = a3->var4 - v12[3];
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (void)zoomToColumnIndex:(int64_t)a3 withAnchorAssetReference:(id)a4 animated:(BOOL)a5
{
  id v9;

  v9 = a4;
  if (!-[PXZoomablePhotosViewModel isPinching](self, "isPinching")
    && !-[PXZoomablePhotosViewModel isInteractiveZooming](self, "isInteractiveZooming"))
  {
    self->_pendingZoomColumnIndex = -[PXZoomablePhotosViewModel _clampColumnIndexToValidIndex:](self, "_clampColumnIndexToValidIndex:", a3);
    objc_storeStrong((id *)&self->_anchorAssetReference, a4);
    self->_animatePendingZoom = a5;
    -[PXZoomablePhotosViewModel _invalidateZoomState](self, "_invalidateZoomState");
  }

}

- (void)zoomInToLastRememberedWithAnchorAssetReference:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a4;
  v6 = a3;
  -[PXZoomablePhotosViewModel zoomState](self, "zoomState");
  v7 = -[PXZoomablePhotosViewModel _clampColumnIndexToValidIndex:](self, "_clampColumnIndexToValidIndex:", v21 - 1);
  if (v21 != v7)
  {
    v8 = v7;
    +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "tapsZoomsToLastIndividualDensity");

    if (v10)
    {
      -[PXZoomablePhotosViewModel allowedColumns](self, "allowedColumns");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      -[PXZoomablePhotosViewModel allowedColumns](self, "allowedColumns");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "integerValue");

      v17 = -[PXZoomablePhotosViewModel _maxColumnsForIndividualItems](self, "_maxColumnsForIndividualItems");
      if (v13 > v17 && v16 <= v17)
      {
        -[PXZoomablePhotosViewModel userDefaults](self, "userDefaults");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "preferredIndividualItemsColumnsNumber");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "integerValue");

        if (v20)
          v8 = -[PXZoomablePhotosViewModel bestColumnIndexForPreferredNumberOfColumns:](self, "bestColumnIndexForPreferredNumberOfColumns:", v20);
      }
    }
    -[PXZoomablePhotosViewModel zoomToColumnIndex:withAnchorAssetReference:animated:](self, "zoomToColumnIndex:withAnchorAssetReference:animated:", v8, v6, v4);
  }

}

- (void)zoomInToIndividualItemsWithAnchorAssetReference:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a4;
  v6 = a3;
  if (!-[PXZoomablePhotosViewModel isDisplayingIndividualItems](self, "isDisplayingIndividualItems"))
  {
    v7 = -[PXZoomablePhotosViewModel defaultColumnIndex](self, "defaultColumnIndex");
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      PXAssertGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Unable to find a valid nextColumnIndex when zooming to individual items", v9, 2u);
      }

    }
    else
    {
      -[PXZoomablePhotosViewModel zoomToColumnIndex:withAnchorAssetReference:animated:](self, "zoomToColumnIndex:withAnchorAssetReference:animated:", v7, v6, v4);
    }
  }

}

- (int64_t)bestColumnIndexForPreferredNumberOfColumns:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[PXZoomablePhotosViewModel allowedColumns](self, "allowedColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXZoomablePhotosViewModel specManager](self, "specManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "bestColumnIndexForPreferredNumberOfColumns:allowedColumns:", a3, v5);
  return v8;
}

- (int64_t)defaultColumnIndex
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[PXZoomablePhotosViewModel userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredIndividualItemsColumnsNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (!v5)
  {
    -[PXZoomablePhotosViewModel specManager](self, "specManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "spec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "defaultNumberOfColumns");

  }
  return -[PXZoomablePhotosViewModel bestColumnIndexForPreferredNumberOfColumns:](self, "bestColumnIndexForPreferredNumberOfColumns:", v5);
}

- (int64_t)_clampColumnIndexToValidIndex:(int64_t)a3
{
  int64_t v3;
  void *v4;
  int64_t v5;

  v3 = a3 & ~(a3 >> 63);
  -[PXZoomablePhotosViewModel allowedColumns](self, "allowedColumns");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") - 1;

  if (v3 >= v5)
    return v5;
  else
    return v3;
}

- (int64_t)_nextColumnIndexForInitialColumnWidth:(double)a3 currentColumnWidth:(double)a4 velocity:(double)a5
{
  uint64_t v8;
  double v9;
  double v10;
  double v11;

  v8 = -[PXZoomablePhotosViewModel _closestColumnIndexForColumnWidth:](self, "_closestColumnIndexForColumnWidth:");
  PXFloatSign();
  v10 = v9;
  PXFloatSign();
  if (v10 == v11 || fabs(a4 / a3 + -1.0) > 0.1 && v10 == 0.0)
    v8 = llround((double)v8 - v11);
  return -[PXZoomablePhotosViewModel _clampColumnIndexToValidIndex:](self, "_clampColumnIndexToValidIndex:", v8);
}

- (int64_t)_closestColumnIndexForAnimatedValue:(double)a3
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  id v11;
  unint64_t v12;
  int64_t v13;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  double v22;
  _QWORD v23[4];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  -[PXZoomablePhotosViewModel allowedColumns](self, "allowedColumns");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXZoomablePhotosViewModel allowedColumnWidths](self, "allowedColumnWidths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (!-[PXZoomablePhotosViewModel allowDenseLevels](self, "allowDenseLevels"))
  {
    v10 = -[PXZoomablePhotosViewModel _maxColumnsForIndividualItems](self, "_maxColumnsForIndividualItems");
    if (v9 >= v10)
      v9 = v10;
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0x7FFFFFFFFFFFFFFFLL;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0x7FEFFFFFFFFFFFFFLL;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__PXZoomablePhotosViewModel__closestColumnIndexForAnimatedValue___block_invoke;
  v17[3] = &unk_1E511AD08;
  v11 = v6;
  v22 = a3;
  v18 = v11;
  v19 = v23;
  v20 = &v24;
  v21 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17);
  v12 = v25[3];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosViewModel.m"), 438, CFSTR("Unable to find number of columns"));

    v12 = v25[3];
    if ((v12 & 0x8000000000000000) != 0)
      goto LABEL_9;
  }
  else if ((v12 & 0x8000000000000000) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomablePhotosViewModel.m"), 439, CFSTR("Invalid column index"));

    goto LABEL_7;
  }
  if (v12 >= objc_msgSend(v11, "count"))
    goto LABEL_9;
LABEL_7:
  v13 = v25[3];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

- (double)_columnWidthForDesiredColumnIndex:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double result;

  -[PXZoomablePhotosViewModel allowedColumns](self, "allowedColumns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") - 1;

  v7 = vcvtmd_s64_f64(a3);
  if (v6 < v7)
    v7 = v6;
  v8 = v7 & ~(v7 >> 63);
  v9 = vcvtpd_s64_f64(a3);
  if (v6 < v9)
    v9 = v6;
  v10 = v9 & ~(v9 >> 63);
  PXFloatProgressBetween();
  PXClamp();
  -[PXZoomablePhotosViewModel allowedColumnWidths](self, "allowedColumnWidths");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");

  -[PXZoomablePhotosViewModel allowedColumnWidths](self, "allowedColumnWidths");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");

  PXFloatByLinearlyInterpolatingFloats();
  return result;
}

- (void)resetColumns
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[PXZoomablePhotosViewModel userDefaults](self, "userDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredIndividualItemsColumnsNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (!v5)
  {
    -[PXZoomablePhotosViewModel specManager](self, "specManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "spec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "initialNumberOfColumns");

  }
  -[PXZoomablePhotosViewModel zoomToColumnIndex:withAnchorAssetReference:animated:](self, "zoomToColumnIndex:withAnchorAssetReference:animated:", -[PXZoomablePhotosViewModel bestColumnIndexForPreferredNumberOfColumns:](self, "bestColumnIndexForPreferredNumberOfColumns:", v5), 0, 0);
}

- (void)setCaptionsVisible:(BOOL)a3
{
  if (self->_captionsVisible != a3)
  {
    self->_captionsVisible = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 16);
  }
}

- (void)setAllowsCaptionsInSquare:(BOOL)a3
{
  if (self->_allowsCaptionsInSquare != a3)
  {
    self->_allowsCaptionsInSquare = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0x20000);
  }
}

- (void)setWantsDimmedSelectionStyle:(BOOL)a3
{
  if (self->_wantsDimmedSelectionStyle != a3)
  {
    self->_wantsDimmedSelectionStyle = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0x2000);
  }
}

- (void)setWantsNumberedSelectionStyle:(BOOL)a3
{
  if (self->_wantsNumberedSelectionStyle != a3)
  {
    self->_wantsNumberedSelectionStyle = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0x8000);
  }
}

- (void)setWantsFileSizeBadge:(BOOL)a3
{
  if (self->_wantsFileSizeBadge != a3)
  {
    self->_wantsFileSizeBadge = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0x10000);
  }
}

- (void)setWantsAssetIndexBadge:(BOOL)a3
{
  self->_wantsAssetIndexBadge = a3;
}

- (void)setIsInteractiveZooming:(BOOL)a3
{
  if (self->_isInteractiveZooming != a3)
  {
    self->_isInteractiveZooming = a3;
    -[PXZoomablePhotosViewModel _invalidateZoomState](self, "_invalidateZoomState");
  }
}

- (void)setIsInteractiveZoomingAllowed:(BOOL)a3
{
  if (self->_isInteractiveZoomingAllowed != a3)
  {
    self->_isInteractiveZoomingAllowed = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0x1000000);
  }
}

- (void)setInteractiveZoomColumnIndex:(double)a3 withAnchorAssetReference:(id)a4
{
  PXAssetReference *v7;
  PXAssetReference *v8;

  v7 = (PXAssetReference *)a4;
  if (self->_interactiveZoomColumnIndex != a3 || self->_anchorAssetReference != v7)
  {
    self->_interactiveZoomColumnIndex = a3;
    v8 = v7;
    objc_storeStrong((id *)&self->_anchorAssetReference, a4);
    -[PXZoomablePhotosViewModel _invalidateZoomState](self, "_invalidateZoomState");
    v7 = v8;
  }

}

- (void)setWantsOverBackgroundFloatingHeaderAppearance:(BOOL)a3
{
  if (self->_wantsOverBackgroundFloatingHeaderAppearance != a3)
  {
    self->_wantsOverBackgroundFloatingHeaderAppearance = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 4096);
  }
}

- (void)setLayoutExtendsContentBelowBounds:(BOOL)a3
{
  if (self->_layoutExtendsContentBelowBounds != a3)
  {
    self->_layoutExtendsContentBelowBounds = a3;
    -[PXZoomablePhotosViewModel _invalidateShouldHideSurroundingContent](self, "_invalidateShouldHideSurroundingContent");
  }
}

- (void)setHasInlineHeadersContent:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_hasInlineHeadersContent != a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __56__PXZoomablePhotosViewModel_setHasInlineHeadersContent___block_invoke;
    v3[3] = &unk_1E511AD58;
    v3[4] = self;
    v4 = a3;
    -[PXZoomablePhotosViewModel performChanges:](self, "performChanges:", v3);
  }
}

- (void)setEffectProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id effectProvider;
  id aBlock;

  aBlock = a3;
  v4 = _Block_copy(self->_effectProvider);
  v5 = _Block_copy(aBlock);
  if (v4 == v5)
  {

  }
  else
  {
    v6 = v5;
    v7 = objc_msgSend(v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = _Block_copy(aBlock);
      effectProvider = self->_effectProvider;
      self->_effectProvider = v8;

      -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0x10000);
    }
  }

}

- (void)setAlwaysShowTopBadges:(BOOL)a3
{
  if (self->_alwaysShowTopBadges != a3)
  {
    self->_alwaysShowTopBadges = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0x40000);
  }
}

- (void)setFaceModeEnabled:(BOOL)a3
{
  if (self->_faceModeEnabled != a3)
  {
    self->_faceModeEnabled = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0x80000);
  }
}

- (void)setUseLowMemoryDecode:(BOOL)a3
{
  if (self->_useLowMemoryDecode != a3)
  {
    self->_useLowMemoryDecode = a3;
    -[PXZoomablePhotosViewModel signalChange:](self, "signalChange:", 0x100000);
  }
}

- (BOOL)isResetToInitialState
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v8;

  if (-[PXZoomablePhotosViewModel isDisplayingIndividualItems](self, "isDisplayingIndividualItems"))
  {
    -[PXZoomablePhotosViewModel zoomState](self, "zoomState");
    v3 = v8 == -[PXZoomablePhotosViewModel defaultColumnIndex](self, "defaultColumnIndex");
  }
  else
  {
    v3 = 0;
  }
  -[PXZoomablePhotosViewModel geometryDelegate](self, "geometryDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = 0;
  else
    v6 = v3;
  if (v4 && v3)
    v6 = objc_msgSend(v4, "zoomablePhotosViewModelIsResetToInitialState:", self);

  return v6;
}

- (void)resetToInitialState
{
  id v3;

  -[PXZoomablePhotosViewModel zoomInToIndividualItemsWithAnchorAssetReference:animated:](self, "zoomInToIndividualItemsWithAnchorAssetReference:animated:", 0, 0);
  -[PXZoomablePhotosViewModel geometryDelegate](self, "geometryDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoomablePhotosViewModelResetToInitialState:", self);

}

- (void)saveCurrentZoomLevelAsUserPreferredIfPossible
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[PXZoomablePhotosViewModel zoomState](self, "zoomState");
  v3 = v8;
  -[PXZoomablePhotosViewModel specManager](self, "specManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 >= 2
    && v3 <= objc_msgSend(v5, "maxColumnsForIndividualItems")
    && (objc_msgSend(v5, "userInterfaceIdiom") != 1 || objc_msgSend(v5, "layoutOrientation") != 2))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXZoomablePhotosViewModel userDefaults](self, "userDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPreferredIndividualItemsColumnsNumber:", v6);

  }
}

- (void)_invalidatePinchVelocity
{
  id v2;

  -[PXZoomablePhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePinchVelocity);

}

- (void)_updatePinchVelocity
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double pinchLogValue;

  if (-[PXZoomablePhotosViewModel isPinching](self, "isPinching"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v4 = v3;
    v5 = v3 - self->_pinchLastDate;
    v6 = v5 >= 0.0 ? v5 : -v5;
    if (v6 > 0.003)
    {
      v7 = log10(fabs(self->_pinchState.scale * self->_normalizedColumnWidthWhenPinchStarted) * 1000.0 + 1.0);
      PXFloatSign();
      v9 = v8 * v7;
      if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
      {
        if (self->_pinchLastDate == 0.0)
        {
          self->_pinchLogValue = v9;
          pinchLogValue = v9;
        }
        else
        {
          pinchLogValue = self->_pinchLogValue;
        }
        self->_pinchLogVelocity = self->_pinchLogVelocity * 0.5 + (v9 - pinchLogValue) / v6 * 0.5;
        self->_pinchLastDate = v4;
        self->_pinchLogValue = v9;
      }
    }
  }
}

- (void)_invalidateMiniModeAnimator
{
  id v2;

  -[PXZoomablePhotosViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMiniModeAnimator);

}

- (void)_updateMiniModeAnimator
{
  void *v3;
  _BOOL8 v4;
  _QWORD v5[5];

  -[PXZoomablePhotosViewModel miniModeAnimator](self, "miniModeAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = !self->_isPerformingInitialChanges;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__PXZoomablePhotosViewModel__updateMiniModeAnimator__block_invoke;
  v5[3] = &unk_1E511AE38;
  v5[4] = self;
  objc_msgSend(v3, "performAnimated:changes:", v4, v5);

}

- (PXSectionedSelectionManager)selectionManager
{
  return self->_selectionManager;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (PXPhotosPreferredAssetCropDelegate)preferredAssetCropDelegate
{
  return (PXPhotosPreferredAssetCropDelegate *)objc_loadWeakRetained((id *)&self->_preferredAssetCropDelegate);
}

- (PXGDisplayAssetPixelBufferSourcesProvider)inlinePlaybackController
{
  return (PXGDisplayAssetPixelBufferSourcesProvider *)objc_loadWeakRetained((id *)&self->_inlinePlaybackController);
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (BOOL)viewBasedDecorationsEnabled
{
  return self->_viewBasedDecorationsEnabled;
}

- (NSSet)draggedAssetReferences
{
  return self->_draggedAssetReferences;
}

- (PXAssetReference)dropTargetAssetReference
{
  return self->_dropTargetAssetReference;
}

- (double)interactiveZoomColumnIndex
{
  return self->_interactiveZoomColumnIndex;
}

- (BOOL)isInteractiveZoomingAllowed
{
  return self->_isInteractiveZoomingAllowed;
}

- (_NSRange)denseColumnsIndexRange
{
  _NSRange *p_denseColumnsIndexRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_denseColumnsIndexRange = &self->_denseColumnsIndexRange;
  location = self->_denseColumnsIndexRange.location;
  length = p_denseColumnsIndexRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (PXAssetReference)anchorAssetReference
{
  return self->_anchorAssetReference;
}

- (BOOL)captionsVisible
{
  return self->_captionsVisible;
}

- (BOOL)allowsCaptionsInSquare
{
  return self->_allowsCaptionsInSquare;
}

- (BOOL)wantsDimmedSelectionStyle
{
  return self->_wantsDimmedSelectionStyle;
}

- (BOOL)wantsNumberedSelectionStyle
{
  return self->_wantsNumberedSelectionStyle;
}

- (BOOL)wantsFileSizeBadge
{
  return self->_wantsFileSizeBadge;
}

- (BOOL)wantsAssetIndexBadge
{
  return self->_wantsAssetIndexBadge;
}

- (BOOL)wantsOverBackgroundFloatingHeaderAppearance
{
  return self->_wantsOverBackgroundFloatingHeaderAppearance;
}

- (BOOL)layoutExtendsContentBelowBounds
{
  return self->_layoutExtendsContentBelowBounds;
}

- (PXZoomableInlineHeadersDataSourceManager)inlineHeadersDataSourceManager
{
  return self->_inlineHeadersDataSourceManager;
}

- (id)effectProvider
{
  return self->_effectProvider;
}

- (id)badgesModifier
{
  return self->_badgesModifier;
}

- (BOOL)alwaysShowTopBadges
{
  return self->_alwaysShowTopBadges;
}

- (BOOL)isFaceModeEnabled
{
  return self->_faceModeEnabled;
}

- (BOOL)useLowMemoryDecode
{
  return self->_useLowMemoryDecode;
}

- (unint64_t)viewMode
{
  return self->_viewMode;
}

- (double)viewModeInteractionProgress
{
  return self->_viewModeInteractionProgress;
}

- (PXAssetReference)miniModeAnchorAssetReference
{
  return self->_miniModeAnchorAssetReference;
}

- (PXZoomablePhotosMiniModeAnimator)miniModeAnimator
{
  return self->_miniModeAnimator;
}

- (int64_t)contentShiftStrategy
{
  return self->_contentShiftStrategy;
}

- (void)setContentShiftStrategy:(int64_t)a3
{
  self->_contentShiftStrategy = a3;
}

- (PXZoomablePhotosViewModelGeometryDelegate)geometryDelegate
{
  return (PXZoomablePhotosViewModelGeometryDelegate *)objc_loadWeakRetained((id *)&self->_geometryDelegate);
}

- (void)setGeometryDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_geometryDelegate, a3);
}

- (BOOL)isPerformingInitialChanges
{
  return self->_isPerformingInitialChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_destroyWeak((id *)&self->_geometryDelegate);
  objc_storeStrong((id *)&self->_miniModeAnimator, 0);
  objc_storeStrong((id *)&self->_miniModeAnchorAssetReference, 0);
  objc_storeStrong(&self->_badgesModifier, 0);
  objc_storeStrong(&self->_effectProvider, 0);
  objc_storeStrong((id *)&self->_inlineHeadersDataSourceManager, 0);
  objc_storeStrong((id *)&self->_anchorAssetReference, 0);
  objc_storeStrong((id *)&self->_allowedColumnWidths, 0);
  objc_storeStrong((id *)&self->_allowedColumns, 0);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_storeStrong((id *)&self->_draggedAssetReferences, 0);
  objc_destroyWeak((id *)&self->_inlinePlaybackController);
  objc_destroyWeak((id *)&self->_preferredColumnCountsDelegate);
  objc_destroyWeak((id *)&self->_preferredAssetCropDelegate);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_selectionManager, 0);
  objc_storeStrong((id *)&self->_assetsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong(&self->_pauseToken, 0);
  objc_storeStrong((id *)&self->_columnWidthAnimator, 0);
  objc_storeStrong((id *)&self->_alphaAnimator, 0);
}

uint64_t __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateZoomState");
}

uint64_t __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateZoomState");
}

uint64_t __58__PXZoomablePhotosViewModel_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllowedColumns");
}

void __52__PXZoomablePhotosViewModel__updateMiniModeAnimator__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  v4 = objc_msgSend(v3, "viewMode");
  if ((unint64_t)(v4 - 1) >= 3)
    v5 = 0;
  else
    v5 = v4;
  objc_msgSend(v6, "setTargetState:", v5);
  objc_msgSend(*(id *)(a1 + 32), "viewModeInteractionProgress");
  objc_msgSend(v6, "setInteractionProgress:");

}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_48(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = log10(fabs(*(double *)(a1 + 32)) * 1000.0 + 1.0);
  v5 = a2;
  PXFloatSign();
  objc_msgSend(v5, "setValue:", v4 * v3);

}

uint64_t __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_2_50(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

uint64_t __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_3_51(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_4(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = log10(fabs(*(double *)(a1 + 32)) * 1000.0 + 1.0);
  v5 = a2;
  PXFloatSign();
  objc_msgSend(v5, "setValue:", v4 * v3);

}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_5(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  id v5;

  v3 = log10(fabs(*(double *)(a1 + 32)) * 1000.0 + 1.0);
  v5 = a2;
  PXFloatSign();
  objc_msgSend(v5, "setValue:", v4 * v3);

}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "pauseChangeDeliveryWithTimeout:identifier:", CFSTR("PXZoomablePhotosViewModel"), 180.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_2_56(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_3_57;
  v2[3] = &unk_1E5145F88;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "performChanges:", v2);

}

uint64_t __45__PXZoomablePhotosViewModel__updateZoomState__block_invoke_3_57(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resumeChangeDeliveryAndBackgroundLoading:", *(_QWORD *)(a1 + 32));
}

uint64_t __56__PXZoomablePhotosViewModel_setHasInlineHeadersContent___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 204) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateZoomState");
}

void __47__PXZoomablePhotosViewModel_setAllowedColumns___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = objc_msgSend(a2, "integerValue");
  if (v5 > a1[6])
  {
    v6 = *(_QWORD *)(a1[5] + 8);
    v8 = *(_QWORD *)(v6 + 32);
    v7 = *(_QWORD *)(v6 + 40);
    if (v7)
      v9 = v8 == 0x7FFFFFFFFFFFFFFFLL;
    else
      v9 = 1;
    if (v9)
    {
      *(_QWORD *)(v6 + 32) = a3;
      v10 = 1;
LABEL_10:
      *(_QWORD *)(v6 + 40) = v10;
      goto LABEL_11;
    }
    if (v7 + v8 == a3)
    {
      v10 = v7 + 1;
      goto LABEL_10;
    }
  }
LABEL_11:
  v11 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1.0 / (double)v5);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

}

void __65__PXZoomablePhotosViewModel__closestColumnIndexForAnimatedValue___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (v6 <= *(_QWORD *)(a1 + 56))
  {
    objc_msgSend(v12, "doubleValue");
    v8 = log10(fabs(v7) * 1000.0 + 1.0);
    PXFloatSign();
    v10 = vabdd_f64(v9 * v8, *(double *)(a1 + 64));
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v10 < *(double *)(v11 + 24))
    {
      *(double *)(v11 + 24) = v10;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    }
  }

}

uint64_t __56__PXZoomablePhotosViewModel_denseZoomLevelForZoomState___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v8;

  result = objc_msgSend(a2, "integerValue");
  if (result <= *(_QWORD *)(a1 + 40))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v8 + 24) < a3)
      *(_QWORD *)(v8 + 24) = a3;
  }
  else
  {
    *a4 = 1;
  }
  return result;
}

uint64_t __51__PXZoomablePhotosViewModel_performInitialChanges___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __36__PXZoomablePhotosViewModel_dealloc__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36__PXZoomablePhotosViewModel_dealloc__block_invoke_2;
  v2[3] = &unk_1E5145F88;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "performChanges:", v2);

}

uint64_t __36__PXZoomablePhotosViewModel_dealloc__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resumeChangeDeliveryAndBackgroundLoading:", *(_QWORD *)(a1 + 32));
}

@end
