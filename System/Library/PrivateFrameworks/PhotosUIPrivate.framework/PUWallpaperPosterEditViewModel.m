@implementation PUWallpaperPosterEditViewModel

- (PUWallpaperPosterEditViewModel)initWithInitialLayerStackViewModel:(id)a3 availableStyles:(id)a4
{
  id *v4;
  id v7;
  id v8;
  PUWallpaperPosterEditViewModel *v9;
  uint64_t v10;
  PISegmentationItem *segmentationItem;
  void *v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  NSArray *availableStyles;
  NSArray *v18;
  void *v19;
  uint64_t v20;
  NSArray *v21;
  uint64_t v22;
  NSArray *currentStyles;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *layerStackViewModelsByStyleKind;
  NSMutableDictionary *v30;
  NSMutableDictionary *viewModelUpdatersByStyleKind;
  PXNumberAnimator *v32;
  PXNumberAnimator *headroomVisibilityAmountAnimator;
  uint64_t v34;
  PXUpdater *updater;
  _QWORD v37[4];
  PUWallpaperPosterEditViewModel *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, void *);
  void *v42;
  id v43;
  objc_super v44;

  v7 = a3;
  v8 = a4;
  v44.receiver = self;
  v44.super_class = (Class)PUWallpaperPosterEditViewModel;
  v9 = -[PUWallpaperPosterEditViewModel init](&v44, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "segmentationItem");
    v10 = objc_claimAutoreleasedReturnValue();
    segmentationItem = v9->_segmentationItem;
    v9->_segmentationItem = (PISegmentationItem *)v10;

    v9->_deviceOrientation = objc_msgSend(v7, "deviceOrientation");
    objc_msgSend(v7, "style");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = MEMORY[0x1E0C809B0];
    if (v12)
    {
      v39 = MEMORY[0x1E0C809B0];
      v40 = 3221225472;
      v41 = __85__PUWallpaperPosterEditViewModel_initWithInitialLayerStackViewModel_availableStyles___block_invoke;
      v42 = &unk_1E58A2D38;
      v4 = &v43;
      v43 = v12;
      v15 = PXExists();
    }
    else
    {
      v15 = 1;
    }
    v16 = objc_msgSend(v8, "copy");
    availableStyles = v9->_availableStyles;
    v9->_availableStyles = (NSArray *)v16;

    if ((v15 & 1) == 0)
    {
      v18 = v9->_availableStyles;
      objc_msgSend(v13, "bakedStyle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray arrayByAddingObject:](v18, "arrayByAddingObject:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v9->_availableStyles;
      v9->_availableStyles = (NSArray *)v20;

    }
    PXMap();
    v22 = objc_claimAutoreleasedReturnValue();
    currentStyles = v9->_currentStyles;
    v9->_currentStyles = (NSArray *)v22;

    objc_msgSend(v7, "normalizedVisibleFrame");
    v9->_normalizedVisibleFrame.origin.x = v24;
    v9->_normalizedVisibleFrame.origin.y = v25;
    v9->_normalizedVisibleFrame.size.width = v26;
    v9->_normalizedVisibleFrame.size.height = v27;
    v9->_depthEnabled = objc_msgSend(v7, "depthEnabled");
    v9->_parallaxDisabled = objc_msgSend(v7, "parallaxDisabled");
    v9->_settlingEffectEnabled = objc_msgSend(v7, "settlingEffectEnabled");
    -[PUWallpaperPosterEditViewModel _initScrollPositionWithViewModel:](v9, "_initScrollPositionWithViewModel:", v7);
    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    layerStackViewModelsByStyleKind = v9->_layerStackViewModelsByStyleKind;
    v9->_layerStackViewModelsByStyleKind = v28;

    v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    viewModelUpdatersByStyleKind = v9->_viewModelUpdatersByStyleKind;
    v9->_viewModelUpdatersByStyleKind = v30;

    -[PUWallpaperPosterEditViewModel _createViewModelsWithInitialViewModel:](v9, "_createViewModelsWithInitialViewModel:", v7);
    v32 = (PXNumberAnimator *)objc_alloc_init(MEMORY[0x1E0D7CD50]);
    headroomVisibilityAmountAnimator = v9->_headroomVisibilityAmountAnimator;
    v9->_headroomVisibilityAmountAnimator = v32;

    -[PXNumberAnimator registerChangeObserver:context:](v9->_headroomVisibilityAmountAnimator, "registerChangeObserver:context:", v9, "HeadroomVisibilityAmountAnimatorObservationContext");
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7CDA0]), "initWithTarget:needsUpdateSelector:", v9, sel__setNeedsUpdate);
    updater = v9->_updater;
    v9->_updater = (PXUpdater *)v34;

    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateActiveLayerStackViewModels);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateCurrentStyles);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateVisibleLayerStackViewModels);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updatePresentingSingleStyle);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateCurrentLayerStackViewModel);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateAvailableLayerStackViewModelsContainerGeometry);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updatePropertiesFromCurrentLayerStackViewModel);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateAvailableLayerStackViewModelsProperties);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateNormalizedVisibleFrame);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateDepthEnabled);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateVisibleFrameCrossesHeadroomBoundary);
    -[PXUpdater addUpdateSelector:](v9->_updater, "addUpdateSelector:", sel__updateDesiredHeadroomVisibilityAmount);
    v37[0] = v14;
    v37[1] = 3221225472;
    v37[2] = __85__PUWallpaperPosterEditViewModel_initWithInitialLayerStackViewModel_availableStyles___block_invoke_3;
    v37[3] = &unk_1E58A10B8;
    v38 = v9;
    -[PUWallpaperPosterEditViewModel performChanges:](v38, "performChanges:", v37);

    if (v13)
  }

  return v9;
}

- (void)_createViewModelsWithInitialViewModel:(id)a3
{
  id v4;
  PUParallaxLayerStackViewModelUpdater *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  PUParallaxLayerStackViewModelUpdater *v13;
  void *v14;
  PUWallpaperPosterEditViewModel *v15;
  id v16;
  uint64_t v17;
  PUParallaxLayerStackViewModelUpdater *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  unsigned int v26;
  _QWORD v27[4];
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PUParallaxLayerStackViewModelUpdater initWithSegmentationItem:]([PUParallaxLayerStackViewModelUpdater alloc], "initWithSegmentationItem:", self->_segmentationItem);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[PUWallpaperPosterEditViewModel availableStyles](self, "availableStyles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v25)
  {
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "kind");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "style");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "kind");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v8, "isEqualToString:", v10);

        v26 = v11;
        if (v11)
        {
          v12 = v4;
          v13 = v5;
        }
        else
        {
          v12 = (id)objc_msgSend(v4, "copy");
          v13 = (PUParallaxLayerStackViewModelUpdater *)-[PUParallaxLayerStackViewModelUpdater copy](v5, "copy");
          v14 = (void *)MEMORY[0x1E0D71248];
          -[PISegmentationItem defaultStyleOfKind:](self->_segmentationItem, "defaultStyleOfKind:", v8);
          v15 = self;
          v16 = v4;
          v17 = v6;
          v18 = v5;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "styleWithBakedStyle:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v5 = v18;
          v6 = v17;
          v4 = v16;
          self = v15;
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __72__PUWallpaperPosterEditViewModel__createViewModelsWithInitialViewModel___block_invoke;
          v27[3] = &unk_1E58AB148;
          v28 = v20;
          v21 = v20;
          objc_msgSend(v12, "performChanges:", v27);

        }
        -[PUWallpaperPosterEditViewModel layerStackViewModelsByStyleKind](self, "layerStackViewModelsByStyleKind");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v12, v8);

        -[PUWallpaperPosterEditViewModel viewModelUpdatersByStyleKind](self, "viewModelUpdatersByStyleKind");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setObject:forKeyedSubscript:", v13, v8);

        -[PUParallaxLayerStackViewModelUpdater renderModelAfterStyleInitialization:isOnscreen:](v13, "renderModelAfterStyleInitialization:isOnscreen:", v12, v26);
        objc_msgSend(v12, "registerChangeObserver:context:", self, "LayerStackViewModelObservationContext");

      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v25);
  }

}

- (void)_initScrollPositionWithViewModel:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  $36902F3E5980455EA0B9AB8F1A9878F3 *p_scrollPosition;
  NSString *v10;

  objc_msgSend(a3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = (void *)*MEMORY[0x1E0D75600];
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  p_scrollPosition = &self->_scrollPosition;
  v10 = (NSString *)*MEMORY[0x1E0D75610];

  p_scrollPosition->firstStyle = (NSString *)v8;
  p_scrollPosition->secondStyleMixFactor = 0.0;
  p_scrollPosition->secondStyle = v10;
}

- (PUWallpaperPosterEditViewModel)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditViewModel.m"), 155, CFSTR("%s is not available as initializer"), "-[PUWallpaperPosterEditViewModel init]");

  abort();
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUWallpaperPosterEditViewModel;
  -[PUWallpaperPosterEditViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperPosterEditViewModel;
  -[PUWallpaperPosterEditViewModel didPerformChanges](&v4, sel_didPerformChanges);
  -[PUWallpaperPosterEditViewModel updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)_setNeedsUpdate
{
  -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 0);
}

- (double)currentClockAreaLuminanceForStyleKind:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  double v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D755A8];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_layerStackViewModelsByStyleKind, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentLayerStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "clockAreaLuminance");
    v10 = v9;
    if (v9 != v5)
      goto LABEL_9;
    PLWallpaperGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v4;
      v12 = "LuminanceForLook: Layer stack for look \"%@\" has unknown clockAreaLuminance";
LABEL_7:
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    PLWallpaperGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v4;
      v12 = "LuminanceForLook: Can't find layer stack for look \"%@\";
      goto LABEL_7;
    }
  }

  v10 = v5;
LABEL_9:
  PLWallpaperGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412802;
    v16 = v4;
    v17 = 2048;
    v18 = v10;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_DEBUG, "LuminanceForLook: luminance for %@ is %.2f, viewModel %@", (uint8_t *)&v15, 0x20u);
  }

  return v10;
}

- (void)shutdownWithTimeout:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PUWallpaperPosterEditViewModel viewModelUpdatersByStyleKind](self, "viewModelUpdatersByStyleKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "cancelPendingRenders");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v9);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[PUWallpaperPosterEditViewModel viewModelUpdatersByStyleKind](self, "viewModelUpdatersByStyleKind", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    while (2)
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "waitForInFlightRenders:", a3) & 1) == 0)
        {
          PLWallpaperGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_FAULT, "Timed out waiting for in flight renders", buf, 2u);
          }

          goto LABEL_20;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_20:

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  PLWallpaperGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v19, "timeIntervalSinceDate:", v5);
    *(_DWORD *)buf = 134217984;
    v31 = v21;
    _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_INFO, "Editor canceled render requests in %0.3f s", buf, 0xCu);
  }

}

- (PUParallaxLayerStackViewModelUpdater)currentLayerStackViewModelUpdater
{
  NSMutableDictionary *viewModelUpdatersByStyleKind;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  viewModelUpdatersByStyleKind = self->_viewModelUpdatersByStyleKind;
  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "kind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](viewModelUpdatersByStyleKind, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (PUParallaxLayerStackViewModelUpdater *)v6;
}

- (BOOL)canApplyHeadroom
{
  void *v2;
  char v3;

  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canApplyHeadroom");

  return v3;
}

- (BOOL)headroomLayoutUsesHeadroomArea
{
  void *v2;
  char v3;

  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "headroomLayoutUsesHeadroomArea");

  return v3;
}

- (void)setCurrentLayerStackViewModel:(id)a3
{
  PUParallaxLayerStackViewModel *v5;
  PUParallaxLayerStackViewModel *v6;
  char v7;
  PUParallaxLayerStackViewModel *v8;

  v8 = (PUParallaxLayerStackViewModel *)a3;
  v5 = self->_currentLayerStackViewModel;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PUParallaxLayerStackViewModel isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentLayerStackViewModel, a3);
      -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 1);
    }
  }

}

- (id)availableLayerStackViewModels
{
  void *v2;
  void *v3;

  -[PUWallpaperPosterEditViewModel currentStyleKinds](self, "currentStyleKinds");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  if (self->_deviceOrientation != a3)
  {
    self->_deviceOrientation = a3;
    -[PUWallpaperPosterEditViewModel _updateAvailableLayerStackViewModelsContainerGeometry](self, "_updateAvailableLayerStackViewModelsContainerGeometry");
  }
}

- (void)setIsUserPanningOrZooming:(BOOL)a3
{
  void *v4;
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
  id obj;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_isUserPanningOrZooming != a3)
  {
    self->_isUserPanningOrZooming = a3;
    -[PUWallpaperPosterEditViewModel _invalidateVisibleFrameCrossesHeadroomBoundary](self, "_invalidateVisibleFrameCrossesHeadroomBoundary");
    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 2);
    if (!self->_isUserPanningOrZooming)
    {
      -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[PUWallpaperPosterEditViewModel layerStackViewModelsByStyleKind](self, "layerStackViewModelsByStyleKind");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "allValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v6;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(obj);
            v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            if (v11 != v4)
            {
              v17[0] = MEMORY[0x1E0C809B0];
              v17[1] = 3221225472;
              v17[2] = __60__PUWallpaperPosterEditViewModel_setIsUserPanningOrZooming___block_invoke;
              v17[3] = &unk_1E58AB148;
              v17[4] = self;
              objc_msgSend(v11, "performChanges:", v17);
              -[PUWallpaperPosterEditViewModel viewModelUpdatersByStyleKind](self, "viewModelUpdatersByStyleKind");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "style");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "kind");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v15, "renderOffscreenModelAfterVisibleFrameChange:highPriority:", v11, -[NSSet containsObject:](self->_activeLayerStackViewModels, "containsObject:", v11));
            }
          }
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v8);
      }

    }
  }
}

- (void)scrollToPosition:(id *)a3
{
  $36902F3E5980455EA0B9AB8F1A9878F3 *p_scrollPosition;
  NSString *firstStyle;
  BOOL v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  __int128 v12;
  id v13;

  p_scrollPosition = &self->_scrollPosition;
  firstStyle = self->_scrollPosition.firstStyle;
  if (firstStyle != a3->var0
    || (self->_scrollPosition.secondStyleMixFactor == a3->var1 ? (v7 = firstStyle == a3->var2) : (v7 = 0), !v7))
  {
    -[PUWallpaperPosterEditViewModel currentStyleKinds](self, "currentStyleKinds");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v8 = a3->var0;
    v9 = a3->var2;
    if (v9)
    {
      v10 = objc_msgSend(v13, "indexOfObject:", v8);
      if (objc_msgSend(v13, "indexOfObject:", v9) < v10)
      {
        v11 = 1.0 - a3->var1;
        a3->var0 = v9;
        a3->var1 = v11;
        a3->var2 = v8;
      }
    }
    v12 = *(_OWORD *)&a3->var0;
    p_scrollPosition->secondStyle = (NSString *)a3->var2;
    *(_OWORD *)&p_scrollPosition->firstStyle = v12;
    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 256);
    -[PUWallpaperPosterEditViewModel _invalidateActiveLayerStackViewModels](self, "_invalidateActiveLayerStackViewModels");
    -[PUWallpaperPosterEditViewModel _invalidateVisibleLayerStackViewModels](self, "_invalidateVisibleLayerStackViewModels");
    -[PUWallpaperPosterEditViewModel _invalidateCurrentLayerStackViewModel](self, "_invalidateCurrentLayerStackViewModel");
    -[PUWallpaperPosterEditViewModel _invalidatePresentingSingleStyle](self, "_invalidatePresentingSingleStyle");

  }
}

- (void)setVisibleLayerStackViewModels:(id)a3
{
  NSArray *v4;
  char v5;
  NSArray *v6;
  NSArray *visibleLayerStackViewModels;
  NSArray *v8;

  v8 = (NSArray *)a3;
  v4 = self->_visibleLayerStackViewModels;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSArray isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      -[NSArray enumerateObjectsUsingBlock:](self->_visibleLayerStackViewModels, "enumerateObjectsUsingBlock:", &__block_literal_global_49);
      v6 = (NSArray *)-[NSArray copy](v8, "copy");
      visibleLayerStackViewModels = self->_visibleLayerStackViewModels;
      self->_visibleLayerStackViewModels = v6;

      -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 4);
    }
  }

}

- (void)setActiveLayerStackViewModels:(id)a3
{
  NSSet *v4;
  NSSet *activeLayerStackViewModels;
  NSSet *v6;
  char v7;
  NSSet *v8;
  NSSet *v9;

  v9 = (NSSet *)a3;
  v4 = self->_activeLayerStackViewModels;
  activeLayerStackViewModels = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSSet isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    v8 = (NSSet *)-[NSSet copy](v9, "copy");
    activeLayerStackViewModels = self->_activeLayerStackViewModels;
    self->_activeLayerStackViewModels = v8;
LABEL_4:

  }
}

- (void)setNormalizedVisibleFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_normalizedVisibleFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_normalizedVisibleFrame = &self->_normalizedVisibleFrame;
  if ((PXRectApproximatelyEqualToRect() & 1) == 0)
  {
    p_normalizedVisibleFrame->origin.x = x;
    p_normalizedVisibleFrame->origin.y = y;
    p_normalizedVisibleFrame->size.width = width;
    p_normalizedVisibleFrame->size.height = height;
    -[PUWallpaperPosterEditViewModel _invalidateNormalizedVisibleFrame](self, "_invalidateNormalizedVisibleFrame");
    -[PUWallpaperPosterEditViewModel _invalidateVisibleFrameCrossesHeadroomBoundary](self, "_invalidateVisibleFrameCrossesHeadroomBoundary");
    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 8);
  }
}

- (void)setNormalizedVisibleFrameAnimated:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_normalizedVisibleFrame;
  void *v9;
  _QWORD v10[8];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_normalizedVisibleFrame = &self->_normalizedVisibleFrame;
  if ((PXRectApproximatelyEqualToRect() & 1) == 0)
  {
    p_normalizedVisibleFrame->origin.x = x;
    p_normalizedVisibleFrame->origin.y = y;
    p_normalizedVisibleFrame->size.width = width;
    p_normalizedVisibleFrame->size.height = height;
    -[PUWallpaperPosterEditViewModel _invalidateVisibleFrameCrossesHeadroomBoundary](self, "_invalidateVisibleFrameCrossesHeadroomBoundary");
    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 8);
    -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__PUWallpaperPosterEditViewModel_setNormalizedVisibleFrameAnimated___block_invoke;
    v10[3] = &__block_descriptor_64_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    *(CGFloat *)&v10[4] = x;
    *(CGFloat *)&v10[5] = y;
    *(CGFloat *)&v10[6] = width;
    *(CGFloat *)&v10[7] = height;
    objc_msgSend(v9, "performChanges:", v10);

  }
}

- (void)reframeToSettlingEffectBoundsIfNeeded
{
  uint64_t (**v3)(void *, id);
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
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
  double v35;
  double v36;
  double v37;
  int v38;
  double v39;
  double v40;
  double v41;
  double v42;
  NSObject *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  int v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  id v73;
  id v74;
  _QWORD v75[8];
  uint8_t buf[16];
  _QWORD aBlock[6];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PUWallpaperPosterEditViewModel_reframeToSettlingEffectBoundsIfNeeded__block_invoke;
  aBlock[3] = &unk_1E58A0C80;
  aBlock[4] = self;
  v3 = (uint64_t (**)(void *, id))_Block_copy(aBlock);
  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "orientation");
  objc_msgSend(v4, "compoundLayerStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "landscapeLayerStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "portraitLayerStack");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5 == 2)
    v10 = v7;
  else
    v10 = (void *)v8;
  if (v5 == 2)
    v11 = (void *)v8;
  else
    v11 = v7;
  v74 = v10;
  v73 = v11;
  objc_msgSend(v4, "segmentationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "settlingEffectLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    PLWallpaperGetLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v43, OS_LOG_TYPE_ERROR, "Settling effect layout missing, reframe failed", buf, 2u);
    }

    goto LABEL_54;
  }
  objc_msgSend(v13, "portraitLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visibleFrame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(v13, "landscapeLayout");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "visibleFrame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  if (v5 == 2)
    v32 = v31;
  else
    v32 = v22;
  if (v5 == 2)
    v33 = v29;
  else
    v33 = v20;
  v69 = v33;
  v70 = v32;
  if (v5 == 2)
    v34 = v27;
  else
    v34 = v18;
  if (v5 == 2)
    v35 = v25;
  else
    v35 = v16;
  v71 = v34;
  v72 = v35;
  if (v5 == 2)
    v36 = v22;
  else
    v36 = v31;
  v68 = v36;
  if (v5 == 2)
  {
    v29 = v20;
    v27 = v18;
    v37 = v16;
  }
  else
  {
    v37 = v25;
  }
  v38 = v3[2](v3, v74);
  if (v38)
  {
    -[PUWallpaperPosterEditViewModel normalizedVisibleFrame](self, "normalizedVisibleFrame");
  }
  else
  {
    v39 = *MEMORY[0x1E0C9D648];
    v40 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v41 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v42 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  if (v5 == 2)
  {
    -[PUWallpaperPosterEditViewModel setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:](self, "setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:", v39, v40, v41, v42);
    if (!v38)
      goto LABEL_41;
  }
  else
  {
    -[PUWallpaperPosterEditViewModel setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:](self, "setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:", v39, v40, v41, v42);
    if (!v38)
      goto LABEL_41;
  }
  objc_msgSend(v4, "imageSize", *(_QWORD *)&v68);
  v46 = 0.0;
  v47 = 0.0;
  v48 = v72;
  if (v44 != 0.0)
  {
    v48 = v72 / v44;
    v47 = v69 / v44;
  }
  v49 = v71;
  if (v45 != 0.0)
  {
    v49 = v71 / v45;
    v46 = v70 / v45;
  }
  -[PUWallpaperPosterEditViewModel setNormalizedVisibleFrameAnimated:](self, "setNormalizedVisibleFrameAnimated:", v48, *(double *)(MEMORY[0x1E0D71110] + 8) + *(double *)(MEMORY[0x1E0D71110] + 24) - (v46 + v49), v47);
LABEL_41:
  v50 = v73;
  if (v73)
  {
    v51 = v3[2](v3, v73);
    if ((v51 & 1) != 0)
    {
      objc_msgSend(v73, "layout");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "normalizedVisibleFrame");
      PXRectFlippedVertically();
      v54 = v53;
      v56 = v55;
      v58 = v57;
      v60 = v59;

    }
    else
    {
      v54 = *MEMORY[0x1E0C9D648];
      v56 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v58 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v60 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    if (v5 == 2)
      -[PUWallpaperPosterEditViewModel setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:](self, "setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:", v54, v56, v58, v60);
    else
      -[PUWallpaperPosterEditViewModel setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:](self, "setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:", v54, v56, v58, v60);
    v50 = v73;
    if (v51)
    {
      objc_msgSend(v73, "layout");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "imageSize");
      v64 = 0.0;
      v65 = 0.0;
      if (v62 != 0.0)
      {
        v37 = v37 / v62;
        v65 = v29 / v62;
      }
      v66 = MEMORY[0x1E0C809B0];
      if (v63 != 0.0)
      {
        v27 = v27 / v63;
        v64 = v68 / v63;
      }

      v67 = *(double *)(MEMORY[0x1E0D71110] + 8) + *(double *)(MEMORY[0x1E0D71110] + 24) - (v64 + v27);
      v75[0] = v66;
      v75[1] = 3221225472;
      v75[2] = __71__PUWallpaperPosterEditViewModel_reframeToSettlingEffectBoundsIfNeeded__block_invoke_52;
      v75[3] = &__block_descriptor_64_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
      *(double *)&v75[4] = v37;
      *(double *)&v75[5] = v67;
      *(double *)&v75[6] = v65;
      *(double *)&v75[7] = v64;
      objc_msgSend(v4, "performChanges:", v75);
LABEL_54:
      v50 = v73;
    }
  }

}

- (void)userDidAdjustVisibleFrame
{
  void *v3;
  uint64_t v4;

  -[PUWallpaperPosterEditViewModel setSettlingEffectStateRestorationLayerStyleKind:](self, "setSettlingEffectStateRestorationLayerStyleKind:", *MEMORY[0x1E0D75600]);
  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "orientation");

  if (v4 == 2)
  {
    -[PUWallpaperPosterEditViewModel setUserHasAdjustedLandscapeVisibleFrame:](self, "setUserHasAdjustedLandscapeVisibleFrame:", 1);
    -[PUWallpaperPosterEditViewModel setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:](self, "setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  else if (v4 == 1)
  {
    -[PUWallpaperPosterEditViewModel setUserHasAdjustedPortraitVisibleFrame:](self, "setUserHasAdjustedPortraitVisibleFrame:", 1);
    -[PUWallpaperPosterEditViewModel setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:](self, "setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
}

- (BOOL)applySettlingEffectVisibleFrameRestoration
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL IsEmpty;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[8];

  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "orientation");
  objc_msgSend(v3, "compoundLayerStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "landscapeLayerStack");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == 2)
    -[PUWallpaperPosterEditViewModel settlingEffectStateRestorationLandscapeNormalizedVisibleFrame](self, "settlingEffectStateRestorationLandscapeNormalizedVisibleFrame");
  else
    -[PUWallpaperPosterEditViewModel settlingEffectStateRestorationPortraitNormalizedVisibleFrame](self, "settlingEffectStateRestorationPortraitNormalizedVisibleFrame");
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  IsEmpty = CGRectIsEmpty(*(CGRect *)&v7);
  if (!IsEmpty)
    -[PUWallpaperPosterEditViewModel setNormalizedVisibleFrameAnimated:](self, "setNormalizedVisibleFrameAnimated:", v11, v12, v13, v14);
  if (v6)
  {
    if (v4 == 2)
      -[PUWallpaperPosterEditViewModel settlingEffectStateRestorationPortraitNormalizedVisibleFrame](self, "settlingEffectStateRestorationPortraitNormalizedVisibleFrame");
    else
      -[PUWallpaperPosterEditViewModel settlingEffectStateRestorationLandscapeNormalizedVisibleFrame](self, "settlingEffectStateRestorationLandscapeNormalizedVisibleFrame");
    v20 = v16;
    v21 = v17;
    v22 = v18;
    v23 = v19;
    if (!CGRectIsEmpty(*(CGRect *)&v16))
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __76__PUWallpaperPosterEditViewModel_applySettlingEffectVisibleFrameRestoration__block_invoke;
      v25[3] = &__block_descriptor_64_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
      v25[4] = v20;
      v25[5] = v21;
      v25[6] = v22;
      v25[7] = v23;
      objc_msgSend(v3, "performChanges:", v25);
    }
  }

  return !IsEmpty;
}

- (void)setContainerFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_containerFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_containerFrame = &self->_containerFrame;
  if ((PXRectApproximatelyEqualToRect() & 1) == 0)
  {
    p_containerFrame->origin.x = x;
    p_containerFrame->origin.y = y;
    p_containerFrame->size.width = width;
    p_containerFrame->size.height = height;
    -[PUWallpaperPosterEditViewModel _invalidateAvailableLayerStackViewModelsContainerGeometry](self, "_invalidateAvailableLayerStackViewModelsContainerGeometry");
    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 16);
  }
}

- (void)setDepthEnabled:(BOOL)a3
{
  if (self->_depthEnabled != a3)
  {
    self->_depthEnabled = a3;
    -[PUWallpaperPosterEditViewModel _invalidateAvailableLayerStackViewModelsProperties](self, "_invalidateAvailableLayerStackViewModelsProperties");
    -[PUWallpaperPosterEditViewModel _invalidateDepthEnabled](self, "_invalidateDepthEnabled");
    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 128);
  }
}

- (void)setAppliesDepthToAllOrientations:(BOOL)a3
{
  if (self->_appliesDepthToAllOrientations != a3)
  {
    self->_appliesDepthToAllOrientations = a3;
    -[PUWallpaperPosterEditViewModel _invalidateAvailableLayerStackViewModelsProperties](self, "_invalidateAvailableLayerStackViewModelsProperties");
    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 2048);
  }
}

- (void)setSettlingEffectEnabled:(BOOL)a3
{
  if (self->_settlingEffectEnabled != a3)
  {
    self->_settlingEffectEnabled = a3;
    -[PUWallpaperPosterEditViewModel _invalidateAvailableLayerStackViewModelsProperties](self, "_invalidateAvailableLayerStackViewModelsProperties");
    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 1024);
  }
}

- (void)setHeadroomEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  char v23;
  void *v24;
  int v25;
  char v26;
  double v27;
  double x;
  double y;
  double width;
  double height;
  BOOL v32;
  double v33;
  id v34;
  CGRect v35;

  v3 = a3;
  if (-[PUWallpaperPosterEditViewModel isUsingHeadroom](self, "isUsingHeadroom") != a3)
  {
    self->_headroomEnabled = v3;
    -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v34, "orientation");
    objc_msgSend(v34, "segmentationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PUWallpaperPosterEditViewModel isUsingHeadroom](self, "isUsingHeadroom"))
      objc_msgSend(v6, "originalLayout");
    else
      objc_msgSend(v6, "headroomLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5 == 2)
      objc_msgSend(v7, "landscapeLayout");
    else
      objc_msgSend(v7, "portraitLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visibleFrame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v9, "imageSize");
    v20 = 0.0;
    v21 = 0.0;
    if (v18 != 0.0)
    {
      v11 = v11 / v18;
      v21 = v15 / v18;
    }
    if (v19 != 0.0)
    {
      v13 = v13 / v19;
      v20 = v17 / v19;
    }
    v22 = *(double *)(MEMORY[0x1E0D71110] + 8) + *(double *)(MEMORY[0x1E0D71110] + 24) - (v20 + v13);
    objc_msgSend(v34, "normalizedVisibleFrame");
    v23 = PXRectApproximatelyEqualToRect();
    objc_msgSend(v6, "headroomLayout");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v9, "isUsingHeadroom");
    if (v3)
    {
      if (v24)
        v26 = v23;
      else
        v26 = 1;
      if ((v26 & 1) != 0 || v25 != 1)
      {
        objc_msgSend(v34, "normalizedVisibleFrame");
        PXSizeGetAspectRatio();
        v27 = 1.0 - *MEMORY[0x1E0D75770];
        PXRectWithAspectRatioFittingRect();
        x = v35.origin.x;
        y = v35.origin.y;
        width = v35.size.width;
        height = v35.size.height;
        v32 = CGRectGetMinY(v35) < 0.0;
        v33 = v27 * 0.25;
        v11 = x;
        if (v32)
          v22 = v33;
        else
          v22 = y;
        v21 = width;
        v20 = height;
      }
      -[PUWallpaperPosterEditViewModel setNormalizedVisibleFrameAnimated:](self, "setNormalizedVisibleFrameAnimated:", v11, v22, v21, v20);
      -[PUWallpaperPosterEditViewModel setSettlingEffectEnabled:](self, "setSettlingEffectEnabled:", 0);
      -[PUWallpaperPosterEditViewModel setDepthEnabled:](self, "setDepthEnabled:", 1);
    }
    else
    {
      -[PUWallpaperPosterEditViewModel setNormalizedVisibleFrameAnimated:](self, "setNormalizedVisibleFrameAnimated:", v11, v22, v21, v20);
    }
    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 0x2000);

  }
}

- (void)setParallaxDisabled:(BOOL)a3
{
  if (self->_parallaxDisabled != a3)
  {
    self->_parallaxDisabled = a3;
    -[PUWallpaperPosterEditViewModel _invalidateAvailableLayerStackViewModelsProperties](self, "_invalidateAvailableLayerStackViewModelsProperties");
    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 32);
  }
}

- (void)setSettlingEffectStateRestorationLayerStyleKind:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_settlingEffectStateRestorationLayerStyleKind != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_settlingEffectStateRestorationLayerStyleKind, a3);
    v5 = v6;
  }

}

- (void)setPresentingSingleStyle:(BOOL)a3
{
  if (self->_presentingSingleStyle != a3)
  {
    self->_presentingSingleStyle = a3;
    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 64);
  }
}

- (PUParallaxLayerStackViewModel)originalLayerStackViewModel
{
  return (PUParallaxLayerStackViewModel *)-[PUWallpaperPosterEditViewModel _layerStackViewModelForStyleKind:](self, "_layerStackViewModelForStyleKind:", *MEMORY[0x1E0D75600]);
}

- (void)updateSettlingEffectWithSegmentationItem:(id)a3 layerStack:(id)a4
{
  PISegmentationItem *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *);
  void *v13;
  PISegmentationItem *v14;
  id v15;

  v7 = (PISegmentationItem *)a3;
  v8 = a4;
  if (self->_segmentationItem != v7)
  {
    objc_storeStrong((id *)&self->_segmentationItem, a3);
    -[PUWallpaperPosterEditViewModel originalLayerStackViewModel](self, "originalLayerStackViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __86__PUWallpaperPosterEditViewModel_updateSettlingEffectWithSegmentationItem_layerStack___block_invoke;
    v13 = &unk_1E58A0CA8;
    v14 = v7;
    v15 = v8;
    objc_msgSend(v9, "performChanges:", &v10);

    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 0x10000, v10, v11, v12, v13);
  }

}

- (NSArray)currentStyleKinds
{
  void *v2;
  void *v3;

  -[PUWallpaperPosterEditViewModel currentStyles](self, "currentStyles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setCurrentStyles:(id)a3
{
  NSArray *v4;
  NSArray *currentStyles;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  currentStyles = self->_currentStyles;
  self->_currentStyles = v4;

  -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 512);
}

- (void)_updateCurrentStylesWithChange:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int64_t v21;

  -[PUWallpaperPosterEditViewModel availableLayerStackViewModels](self, "availableLayerStackViewModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = a3;
  -[PUWallpaperPosterEditViewModel currentStyles](self, "currentStyles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  if (v9)
  {
    v10 = objc_msgSend(v9, "count");
    if (v10 != objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditViewModel.m"), 605, CFSTR("Diffing is only supported when number of styles does not change"));

    }
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __65__PUWallpaperPosterEditViewModel__updateCurrentStylesWithChange___block_invoke_2;
    v15 = &unk_1E58A0D30;
    v16 = v7;
    v17 = &v18;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v12);

  }
  -[PUWallpaperPosterEditViewModel setStylesChange:](self, "setStylesChange:", v19[3], v12, v13, v14, v15);
  -[PUWallpaperPosterEditViewModel setCurrentStyles:](self, "setCurrentStyles:", v7);

  _Block_object_dispose(&v18, 8);
}

- (id)_previousStyleKindForStyleKind:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUWallpaperPosterEditViewModel currentStyleKinds](self, "currentStyleKinds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLWallpaperGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "styleKind %@ not found in availableStyleKinds", (uint8_t *)&v12, 0xCu);
    }

    v8 = (id)*MEMORY[0x1E0D75600];
  }
  else
  {
    if (v6 <= 1)
      v9 = 1;
    else
      v9 = v6;
    objc_msgSend(v5, "objectAtIndexedSubscript:", v9 - 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;

  return v10;
}

- (id)_nextStyleKindForStyleKind:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUWallpaperPosterEditViewModel currentStyleKinds](self, "currentStyleKinds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLWallpaperGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "styleKind %@ not found in availableStyleKinds", (uint8_t *)&v15, 0xCu);
    }

    v8 = (id)*MEMORY[0x1E0D75600];
  }
  else
  {
    v9 = v6;
    v10 = v6 + 1;
    v11 = objc_msgSend(v5, "count");
    if (v10 < v11 - 1)
      v12 = v9 + 1;
    else
      v12 = v11 - 1;
    objc_msgSend(v5, "objectAtIndexedSubscript:", v12);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v8;

  return v13;
}

- (void)applyChangesFromPosterEditConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  PUWallpaperPosterEditViewModel *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;

  v4 = a3;
  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "orientation");

  if (v6 == 2)
  {
    objc_msgSend(v4, "normalizedLandscapeVisibleFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = objc_msgSend(v4, "isLandscapeDepthEnabled");
  }
  else
  {
    objc_msgSend(v4, "normalizedVisibleFrame");
    v8 = v16;
    v10 = v17;
    v12 = v18;
    v14 = v19;
    v15 = objc_msgSend(v4, "isDepthEnabled");
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __74__PUWallpaperPosterEditViewModel_applyChangesFromPosterEditConfiguration___block_invoke;
  v21[3] = &unk_1E58A0D58;
  v24 = v8;
  v25 = v10;
  v26 = v12;
  v27 = v14;
  v28 = v15;
  v22 = v4;
  v23 = self;
  v20 = v4;
  -[PUWallpaperPosterEditViewModel performChanges:](self, "performChanges:", v21);

}

- (id)posterEditConfigurationRepresentation
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v20;
  double v21;
  uint64_t v22;

  -[PUWallpaperPosterEditViewModel scrollPosition](self, "scrollPosition");
  v3 = (id *)&v22;
  if (v21 <= 0.5)
    v3 = (id *)&v20;
  v4 = *v3;
  -[PUWallpaperPosterEditViewModel layerStackViewModelsByStyleKind](self, "layerStackViewModelsByStyleKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "compoundLayerStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "portraitLayerStack");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "landscapeLayerStack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0D75200]);
  objc_msgSend(v8, "layout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "normalizedVisibleFrame");
  PXRectFlippedVertically();
  objc_msgSend(v10, "setNormalizedVisibleFrame:");

  objc_msgSend(v9, "layout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "normalizedVisibleFrame");
  PXRectFlippedVertically();
  objc_msgSend(v10, "setNormalizedLandscapeVisibleFrame:");

  if (objc_msgSend(v8, "depthEnabled"))
    v13 = -[PUWallpaperPosterEditViewModel settlingEffectEnabled](self, "settlingEffectEnabled") ^ 1;
  else
    v13 = 0;
  objc_msgSend(v10, "setIsDepthEnabled:", v13);
  -[PUWallpaperPosterEditViewModel segmentationItem](self, "segmentationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "segmentationMatte");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsDepthAvailable:", v15 != 0);

  objc_msgSend(v10, "setIsLandscapeDepthEnabled:", objc_msgSend(v9, "depthEnabled"));
  objc_msgSend(v10, "setIsSettlingEffectEnabled:", -[PUWallpaperPosterEditViewModel settlingEffectEnabled](self, "settlingEffectEnabled"));
  -[PUWallpaperPosterEditViewModel segmentationItem](self, "segmentationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsSettlingEffectAvailable:", objc_msgSend(v16, "isSettlingEffectAvailable"));

  objc_msgSend(v10, "setIsPerspectiveZoomEnabled:", -[PUWallpaperPosterEditViewModel parallaxDisabled](self, "parallaxDisabled") ^ 1);
  objc_msgSend(v6, "style");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bakedStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStyle:", v18);

  return v10;
}

- (id)_layerStackViewModelForStyleKind:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((id)*MEMORY[0x1E0D75610] == v4)
  {
    v6 = 0;
  }
  else
  {
    -[PUWallpaperPosterEditViewModel layerStackViewModelsByStyleKind](self, "layerStackViewModelsByStyleKind");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      _PFAssertContinueHandler();
  }

  return v6;
}

- (PFWallpaperCompoundDeviceConfiguration)layoutConfiguration
{
  void *v2;
  void *v3;

  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PFWallpaperCompoundDeviceConfiguration *)v3;
}

- (void)_invalidateCurrentStyles
{
  id v2;

  -[PUWallpaperPosterEditViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentStyles);

}

- (void)_updateCurrentStyles
{
  -[PUWallpaperPosterEditViewModel _updateCurrentStylesWithChange:](self, "_updateCurrentStylesWithChange:", 0);
}

- (void)_invalidateActiveLayerStackViewModels
{
  id v2;

  -[PUWallpaperPosterEditViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateActiveLayerStackViewModels);

}

- (void)_updateActiveLayerStackViewModels
{
  id v3;
  id v4;
  void (**v5)(void *, _QWORD);
  void *v6;
  _QWORD aBlock[5];
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = 0;
  v10 = 0;
  v11 = 0;
  -[PUWallpaperPosterEditViewModel scrollPosition](self, "scrollPosition");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PUWallpaperPosterEditViewModel__updateActiveLayerStackViewModels__block_invoke;
  aBlock[3] = &unk_1E58A5BF8;
  aBlock[4] = self;
  v8 = v3;
  v4 = v3;
  v5 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v5[2](v5, v9);
  v5[2](v5, v11);
  v6 = (void *)objc_msgSend(v4, "copy");
  -[PUWallpaperPosterEditViewModel setActiveLayerStackViewModels:](self, "setActiveLayerStackViewModels:", v6);

}

- (void)_invalidateVisibleLayerStackViewModels
{
  id v2;

  -[PUWallpaperPosterEditViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateVisibleLayerStackViewModels);

}

- (void)_updateVisibleLayerStackViewModels
{
  id v3;
  double v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  _QWORD v31[7];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v31[5] = 0;
  v31[6] = 0;
  v32 = 0;
  -[PUWallpaperPosterEditViewModel scrollPosition](self, "scrollPosition");
  v3 = 0;
  v4 = 0.0;
  if ((PXFloatEqualToFloatWithTolerance() & 1) == 0)
  {
    v4 = 1.0;
    if (!PXFloatEqualToFloatWithTolerance())
      v4 = 0.0;
  }
  -[PUWallpaperPosterEditViewModel _layerStackViewModelForStyleKind:](self, "_layerStackViewModelForStyleKind:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __68__PUWallpaperPosterEditViewModel__updateVisibleLayerStackViewModels__block_invoke;
  v31[3] = &__block_descriptor_40_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
  *(double *)&v31[4] = v4;
  objc_msgSend(v5, "performChanges:", v31);
  v7 = v32;
  if (objc_msgSend(v3, "isEqualToString:", v7))
  {
    -[PUWallpaperPosterEditViewModel _nextStyleKindForStyleKind:](self, "_nextStyleKindForStyleKind:", v3);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v8;
  }
  v25 = v3;
  v23 = v7;
  if ((objc_msgSend(v3, "isEqualToString:", v7) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    -[PUWallpaperPosterEditViewModel _layerStackViewModelForStyleKind:](self, "_layerStackViewModelForStyleKind:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v6;
    v30[1] = 3221225472;
    v30[2] = __68__PUWallpaperPosterEditViewModel__updateVisibleLayerStackViewModels__block_invoke_2;
    v30[3] = &__block_descriptor_40_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    *(double *)&v30[4] = v4;
    objc_msgSend(v9, "performChanges:", v30);
  }
  v22 = v9;
  v24 = v5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v5, v9, 0);
  -[PUWallpaperPosterEditViewModel setVisibleLayerStackViewModels:](self, "setVisibleLayerStackViewModels:", v10);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[PUWallpaperPosterEditViewModel availableLayerStackViewModels](self, "availableLayerStackViewModels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[PUWallpaperPosterEditViewModel viewModelUpdatersByStyleKind](self, "viewModelUpdatersByStyleKind");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "style");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "kind");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[PUWallpaperPosterEditViewModel visibleLayerStackViewModels](self, "visibleLayerStackViewModels");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v19) = objc_msgSend(v21, "containsObject:", v16);

        if ((_DWORD)v19)
          objc_msgSend(v20, "ensureOnscreenModelIsLoaded:", v16);
        else
          objc_msgSend(v20, "ensureOffscreenModelIsUnloaded:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v13);
  }

}

- (void)_invalidatePresentingSingleStyle
{
  id v2;

  -[PUWallpaperPosterEditViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePresentingSingleStyle);

}

- (void)_updatePresentingSingleStyle
{
  double v3;

  -[PUWallpaperPosterEditViewModel scrollPosition](self, "scrollPosition");
  -[PUWallpaperPosterEditViewModel setPresentingSingleStyle:](self, "setPresentingSingleStyle:", fabs(v3) <= 0.00000999999975);
}

- (void)_invalidateCurrentLayerStackViewModel
{
  id v2;

  -[PUWallpaperPosterEditViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateCurrentLayerStackViewModel);

}

- (void)_updateCurrentLayerStackViewModel
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  uint64_t v14;

  v13[0] = 0;
  v13[1] = 0;
  v14 = 0;
  -[PUWallpaperPosterEditViewModel scrollPosition](self, "scrollPosition");
  if (0.0 <= 0.5)
    v3 = (id *)v13;
  else
    v3 = (id *)&v14;
  v4 = *v3;
  -[PUWallpaperPosterEditViewModel layerStackViewModelsByStyleKind](self, "layerStackViewModelsByStyleKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditViewModel setCurrentLayerStackViewModel:](self, "setCurrentLayerStackViewModel:", v6);

  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "clockIntersection"))
  {
    -[PUWallpaperPosterEditViewModel segmentationItem](self, "segmentationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "supportsManualClockIntersectionTolerance");

    if ((v9 & 1) != 0)
      goto LABEL_9;
  }
  else
  {

  }
  -[PUWallpaperPosterEditViewModel currentLayerStackViewModelUpdater](self, "currentLayerStackViewModelUpdater");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditViewModel availableLayerStackViewModels](self, "availableLayerStackViewModels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recalculateClockIntersection:allViewModels:highPriority:", v11, v12, 1);

LABEL_9:
}

- (void)_invalidateNormalizedVisibleFrame
{
  id v2;

  -[PUWallpaperPosterEditViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateNormalizedVisibleFrame);

}

- (void)_updateNormalizedVisibleFrame
{
  BOOL v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id obj;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = -[PUWallpaperPosterEditViewModel isUserPanningOrZooming](self, "isUserPanningOrZooming");
  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __63__PUWallpaperPosterEditViewModel__updateNormalizedVisibleFrame__block_invoke;
  v31[3] = &unk_1E58AB148;
  v31[4] = self;
  objc_msgSend(v4, "performChanges:", v31);
  +[PUSuggestionsSettings sharedInstance](PUSuggestionsSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "debugDisableFrameUpdates");

  if ((v6 & 1) == 0)
  {
    -[PUWallpaperPosterEditViewModel viewModelUpdatersByStyleKind](self, "viewModelUpdatersByStyleKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "kind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUWallpaperPosterEditViewModel layerStackViewModelsByStyleKind](self, "layerStackViewModelsByStyleKind");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "renderOnscreenModelAfterVisibleFrameChange:allViewModels:", v4, v12);

    if (!v3)
    {
      v24 = v10;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      -[PUWallpaperPosterEditViewModel layerStackViewModelsByStyleKind](self, "layerStackViewModelsByStyleKind");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v14;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v28;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v18);
            if (v19 != v4)
            {
              v26[0] = MEMORY[0x1E0C809B0];
              v26[1] = 3221225472;
              v26[2] = __63__PUWallpaperPosterEditViewModel__updateNormalizedVisibleFrame__block_invoke_2;
              v26[3] = &unk_1E58AB148;
              v26[4] = self;
              objc_msgSend(v19, "performChanges:", v26);
              -[PUWallpaperPosterEditViewModel viewModelUpdatersByStyleKind](self, "viewModelUpdatersByStyleKind");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "style");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "kind");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v23, "renderOffscreenModelAfterVisibleFrameChange:highPriority:", v19, -[NSSet containsObject:](self->_activeLayerStackViewModels, "containsObject:", v19));
            }
            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v16);
      }

      v10 = v24;
    }

  }
}

- (void)_invalidateAvailableLayerStackViewModelsContainerGeometry
{
  id v2;

  -[PUWallpaperPosterEditViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAvailableLayerStackViewModelsContainerGeometry);

}

- (void)_updateAvailableLayerStackViewModelsContainerGeometry
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
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
  -[PUWallpaperPosterEditViewModel layerStackViewModelsByStyleKind](self, "layerStackViewModelsByStyleKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11[0] = v8;
        v11[1] = 3221225472;
        v11[2] = __87__PUWallpaperPosterEditViewModel__updateAvailableLayerStackViewModelsContainerGeometry__block_invoke;
        v11[3] = &unk_1E58AB148;
        v11[4] = self;
        objc_msgSend(v10, "performChanges:", v11);
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_invalidatePropertiesFromCurrentLayerStackViewModel
{
  id v2;

  -[PUWallpaperPosterEditViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePropertiesFromCurrentLayerStackViewModel);

}

- (void)_updatePropertiesFromCurrentLayerStackViewModel
{
  id v3;

  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "normalizedVisibleFrame");
  -[PUWallpaperPosterEditViewModel setNormalizedVisibleFrame:](self, "setNormalizedVisibleFrame:");
  -[PUWallpaperPosterEditViewModel setDepthEnabled:](self, "setDepthEnabled:", objc_msgSend(v3, "depthEnabled"));
  -[PUWallpaperPosterEditViewModel setParallaxDisabled:](self, "setParallaxDisabled:", objc_msgSend(v3, "parallaxDisabled"));

}

- (void)_invalidateAvailableLayerStackViewModelsProperties
{
  id v2;

  -[PUWallpaperPosterEditViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAvailableLayerStackViewModelsProperties);

}

- (void)_updateAvailableLayerStackViewModelsProperties
{
  void *v3;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PUWallpaperPosterEditViewModel layerStackViewModelsByStyleKind](self, "layerStackViewModelsByStyleKind", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
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
        -[PUWallpaperPosterEditViewModel _updateLayerStackViewModelProperties:](self, "_updateLayerStackViewModelProperties:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_updateLayerStackViewModelProperties:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __71__PUWallpaperPosterEditViewModel__updateLayerStackViewModelProperties___block_invoke;
  v3[3] = &unk_1E58AB148;
  v3[4] = self;
  objc_msgSend(a3, "performChanges:", v3);
}

- (void)_invalidateDepthEnabled
{
  id v2;

  -[PUWallpaperPosterEditViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDepthEnabled);

}

- (void)_updateDepthEnabled
{
  void *v3;
  void *v4;
  id v5;

  -[PUWallpaperPosterEditViewModel currentLayerStackViewModelUpdater](self, "currentLayerStackViewModelUpdater");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditViewModel availableLayerStackViewModels](self, "availableLayerStackViewModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recalculateClockOverlap:allViewModels:highPriority:", v3, v4, 1);

}

- (void)_invalidateVisibleFrameCrossesHeadroomBoundary
{
  id v2;

  -[PUWallpaperPosterEditViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateVisibleFrameCrossesHeadroomBoundary);

}

- (void)_updateVisibleFrameCrossesHeadroomBoundary
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  _BOOL8 v7;
  CGRect v8;

  -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLayerStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canApplyHeadroom");

  if (v6)
  {
    -[PUWallpaperPosterEditViewModel normalizedVisibleFrame](self, "normalizedVisibleFrame");
    v7 = CGRectGetMinY(v8) < 0.0;
  }
  else
  {
    v7 = 0;
  }
  -[PUWallpaperPosterEditViewModel setVisibleFrameCrossesHeadroomBoundary:](self, "setVisibleFrameCrossesHeadroomBoundary:", v7);
  -[PUWallpaperPosterEditViewModel setUsingHeadroom:](self, "setUsingHeadroom:", v7);
}

- (void)setVisibleFrameCrossesHeadroomBoundary:(BOOL)a3
{
  if (self->_visibleFrameCrossesHeadroomBoundary != a3)
  {
    self->_visibleFrameCrossesHeadroomBoundary = a3;
    -[PUWallpaperPosterEditViewModel _invalidateDesiredHeadroomVisibilityAmount](self, "_invalidateDesiredHeadroomVisibilityAmount");
  }
}

- (void)setUsingHeadroom:(BOOL)a3
{
  if (self->_usingHeadroom != a3)
  {
    self->_usingHeadroom = a3;
    -[PUWallpaperPosterEditViewModel signalChange:](self, "signalChange:", 4096);
  }
}

- (void)_invalidateDesiredHeadroomVisibilityAmount
{
  id v2;

  -[PUWallpaperPosterEditViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDesiredHeadroomVisibilityAmount);

}

- (void)_updateDesiredHeadroomVisibilityAmount
{
  void *v3;

  if (-[PUWallpaperPosterEditViewModel visibleFrameCrossesHeadroomBoundary](self, "visibleFrameCrossesHeadroomBoundary"))
  {
    v3 = &unk_1E59BC520;
  }
  else
  {
    v3 = &unk_1E59BC530;
  }
  -[PUWallpaperPosterEditViewModel setDesiredHeadroomVisibilityAmount:](self, "setDesiredHeadroomVisibilityAmount:", v3);
}

- (void)setDesiredHeadroomVisibilityAmount:(id)a3
{
  NSNumber *v5;
  NSNumber *v6;
  NSNumber *v7;
  char v8;
  NSNumber *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id *v14;
  _QWORD v15[4];
  NSNumber *v16;
  _QWORD v17[4];
  NSNumber *v18;

  v5 = (NSNumber *)a3;
  v6 = self->_desiredHeadroomVisibilityAmount;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[NSNumber isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      v9 = self->_desiredHeadroomVisibilityAmount;
      objc_storeStrong((id *)&self->_desiredHeadroomVisibilityAmount, a3);
      if (v9 || -[PUWallpaperPosterEditViewModel isUserPanningOrZooming](self, "isUserPanningOrZooming"))
      {
        -[PUWallpaperPosterEditViewModel headroomVisibilityAmountAnimator](self, "headroomVisibilityAmountAnimator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PUPosterHeadroomSettings sharedInstance](PUPosterHeadroomSettings, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fadeAnimationDuration");
        v13 = v12;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __69__PUWallpaperPosterEditViewModel_setDesiredHeadroomVisibilityAmount___block_invoke;
        v17[3] = &unk_1E58A0D80;
        v14 = (id *)&v18;
        v18 = v5;
        objc_msgSend(v10, "performChangesWithDuration:curve:changes:", 4, v17, v13);

      }
      else
      {
        -[PUWallpaperPosterEditViewModel headroomVisibilityAmountAnimator](self, "headroomVisibilityAmountAnimator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __69__PUWallpaperPosterEditViewModel_setDesiredHeadroomVisibilityAmount___block_invoke_2;
        v15[3] = &unk_1E58A0D80;
        v14 = (id *)&v16;
        v16 = v5;
        objc_msgSend(v10, "performChangesWithoutAnimation:", v15);
      }

    }
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  char v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  _QWORD v32[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _BYTE v42[128];
  uint64_t v43;

  v6 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  if (a5 == "LayerStackViewModelObservationContext")
  {
    v14 = v9;
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_16:
        v23 = objc_msgSend(v14, "stylePropertiesChange");
        v24 = objc_msgSend(v14, "currentLayerStackPropertiesChange");
        if ((v6 & 2) != 0)
        {
          -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
          v25 = (id)objc_claimAutoreleasedReturnValue();

          if (v25 == v14)
          {
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke;
            v41[3] = &unk_1E58A10B8;
            v41[4] = self;
            -[PUWallpaperPosterEditViewModel performChanges:](self, "performChanges:", v41);
          }
        }
        if (v6 < 0)
        {
          -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
          v26 = (id)objc_claimAutoreleasedReturnValue();

          if (v26 == v14)
            -[PUWallpaperPosterEditViewModel _updateNormalizedVisibleFrame](self, "_updateNormalizedVisibleFrame");
        }
        if ((v23 & 1) != 0)
        {
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_2;
          v40[3] = &unk_1E58A10B8;
          v40[4] = self;
          -[PUWallpaperPosterEditViewModel performChanges:](self, "performChanges:", v40);
          if ((v23 & 0x10) == 0)
          {
LABEL_24:
            if ((v24 & 0x20) == 0)
            {
LABEL_26:

              goto LABEL_27;
            }
LABEL_25:
            v38[0] = MEMORY[0x1E0C809B0];
            v38[1] = 3221225472;
            v38[2] = __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_4;
            v38[3] = &unk_1E58A10B8;
            v38[4] = self;
            -[PUWallpaperPosterEditViewModel performChanges:](self, "performChanges:", v38);
            goto LABEL_26;
          }
        }
        else if ((v23 & 0x10) == 0)
        {
          goto LABEL_24;
        }
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_3;
        v39[3] = &unk_1E58A10B8;
        v39[4] = self;
        -[PUWallpaperPosterEditViewModel performChanges:](self, "performChanges:", v39);
        if ((v24 & 0x20) == 0)
          goto LABEL_26;
        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "px_descriptionForAssertionMessage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditViewModel.m"), 961, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("observable"), v29, v31);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditViewModel.m"), 961, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("observable"), v29);
    }

    goto LABEL_16;
  }
  if (a5 == "HeadroomVisibilityAmountAnimatorObservationContext" && (v6 & 2) != 0)
  {
    -[PUWallpaperPosterEditViewModel headroomVisibilityAmountAnimator](self, "headroomVisibilityAmountAnimator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "presentationValue");
    v13 = v12;

    -[PUWallpaperPosterEditViewModel currentLayerStackViewModel](self, "currentLayerStackViewModel");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_5;
    v37[3] = &__block_descriptor_40_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
    v37[4] = v13;
    objc_msgSend(v14, "performChanges:", v37);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[PUWallpaperPosterEditViewModel layerStackViewModelsByStyleKind](self, "layerStackViewModelsByStyleKind");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          v22 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (v22 != v14)
          {
            v32[0] = v15;
            v32[1] = 3221225472;
            v32[2] = __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_6;
            v32[3] = &__block_descriptor_40_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
            v32[4] = v13;
            objc_msgSend(v22, "performChanges:", v32);
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v19);
    }

    goto LABEL_26;
  }
LABEL_27:

}

- (PISegmentationItem)segmentationItem
{
  return self->_segmentationItem;
}

- (PUParallaxLayerStackViewModel)currentLayerStackViewModel
{
  return self->_currentLayerStackViewModel;
}

- (NSArray)currentStyles
{
  return self->_currentStyles;
}

- (int64_t)stylesChange
{
  return self->_stylesChange;
}

- (void)setStylesChange:(int64_t)a3
{
  self->_stylesChange = a3;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (BOOL)isUserPanningOrZooming
{
  return self->_isUserPanningOrZooming;
}

- ($9041C250948D1B2A219AAF65C5556C0D)scrollPosition
{
  *($36902F3E5980455EA0B9AB8F1A9878F3 *)retstr = *($36902F3E5980455EA0B9AB8F1A9878F3 *)((char *)self + 224);
  return self;
}

- (CGRect)containerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_containerFrame.origin.x;
  y = self->_containerFrame.origin.y;
  width = self->_containerFrame.size.width;
  height = self->_containerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)normalizedVisibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedVisibleFrame.origin.x;
  y = self->_normalizedVisibleFrame.origin.y;
  width = self->_normalizedVisibleFrame.size.width;
  height = self->_normalizedVisibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)depthEnabled
{
  return self->_depthEnabled;
}

- (BOOL)appliesDepthToAllOrientations
{
  return self->_appliesDepthToAllOrientations;
}

- (BOOL)settlingEffectEnabled
{
  return self->_settlingEffectEnabled;
}

- (BOOL)headroomEnabled
{
  return self->_headroomEnabled;
}

- (BOOL)parallaxDisabled
{
  return self->_parallaxDisabled;
}

- (BOOL)isUsingHeadroom
{
  return self->_usingHeadroom;
}

- (NSString)settlingEffectStateRestorationLayerStyleKind
{
  return self->_settlingEffectStateRestorationLayerStyleKind;
}

- (NSArray)visibleLayerStackViewModels
{
  return self->_visibleLayerStackViewModels;
}

- (BOOL)isPresentingSingleStyle
{
  return self->_presentingSingleStyle;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (NSArray)availableStyles
{
  return self->_availableStyles;
}

- (void)setAvailableStyles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSMutableDictionary)layerStackViewModelsByStyleKind
{
  return self->_layerStackViewModelsByStyleKind;
}

- (NSMutableDictionary)viewModelUpdatersByStyleKind
{
  return self->_viewModelUpdatersByStyleKind;
}

- (NSSet)activeLayerStackViewModels
{
  return self->_activeLayerStackViewModels;
}

- (BOOL)visibleFrameCrossesHeadroomBoundary
{
  return self->_visibleFrameCrossesHeadroomBoundary;
}

- (NSNumber)desiredHeadroomVisibilityAmount
{
  return self->_desiredHeadroomVisibilityAmount;
}

- (PXNumberAnimator)headroomVisibilityAmountAnimator
{
  return self->_headroomVisibilityAmountAnimator;
}

- (void)setHeadroomVisibilityAmountAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_headroomVisibilityAmountAnimator, a3);
}

- (BOOL)userHasAdjustedPortraitVisibleFrame
{
  return self->_userHasAdjustedPortraitVisibleFrame;
}

- (void)setUserHasAdjustedPortraitVisibleFrame:(BOOL)a3
{
  self->_userHasAdjustedPortraitVisibleFrame = a3;
}

- (BOOL)userHasAdjustedLandscapeVisibleFrame
{
  return self->_userHasAdjustedLandscapeVisibleFrame;
}

- (void)setUserHasAdjustedLandscapeVisibleFrame:(BOOL)a3
{
  self->_userHasAdjustedLandscapeVisibleFrame = a3;
}

- (CGRect)settlingEffectStateRestorationPortraitNormalizedVisibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_settlingEffectStateRestorationPortraitNormalizedVisibleFrame.origin.x;
  y = self->_settlingEffectStateRestorationPortraitNormalizedVisibleFrame.origin.y;
  width = self->_settlingEffectStateRestorationPortraitNormalizedVisibleFrame.size.width;
  height = self->_settlingEffectStateRestorationPortraitNormalizedVisibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSettlingEffectStateRestorationPortraitNormalizedVisibleFrame:(CGRect)a3
{
  self->_settlingEffectStateRestorationPortraitNormalizedVisibleFrame = a3;
}

- (CGRect)settlingEffectStateRestorationLandscapeNormalizedVisibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_settlingEffectStateRestorationLandscapeNormalizedVisibleFrame.origin.x;
  y = self->_settlingEffectStateRestorationLandscapeNormalizedVisibleFrame.origin.y;
  width = self->_settlingEffectStateRestorationLandscapeNormalizedVisibleFrame.size.width;
  height = self->_settlingEffectStateRestorationLandscapeNormalizedVisibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSettlingEffectStateRestorationLandscapeNormalizedVisibleFrame:(CGRect)a3
{
  self->_settlingEffectStateRestorationLandscapeNormalizedVisibleFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headroomVisibilityAmountAnimator, 0);
  objc_storeStrong((id *)&self->_desiredHeadroomVisibilityAmount, 0);
  objc_storeStrong((id *)&self->_activeLayerStackViewModels, 0);
  objc_storeStrong((id *)&self->_viewModelUpdatersByStyleKind, 0);
  objc_storeStrong((id *)&self->_layerStackViewModelsByStyleKind, 0);
  objc_storeStrong((id *)&self->_availableStyles, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_visibleLayerStackViewModels, 0);
  objc_storeStrong((id *)&self->_settlingEffectStateRestorationLayerStyleKind, 0);
  objc_storeStrong((id *)&self->_currentStyles, 0);
  objc_storeStrong((id *)&self->_currentLayerStackViewModel, 0);
  objc_storeStrong((id *)&self->_segmentationItem, 0);
}

uint64_t __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidatePropertiesFromCurrentLayerStackViewModel");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateVisibleFrameCrossesHeadroomBoundary");
}

uint64_t __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentStylesWithChange:", 0);
}

uint64_t __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentStylesWithChange:", 1);
}

uint64_t __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setStylesChange:", objc_msgSend(*(id *)(a1 + 32), "stylesChange") | 4);
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 512);
}

uint64_t __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredHeadroomVisibilityAmount:", *(double *)(a1 + 32));
}

uint64_t __63__PUWallpaperPosterEditViewModel_observable_didChange_context___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredHeadroomVisibilityAmount:", ceil(*(double *)(a1 + 32)));
}

void __69__PUWallpaperPosterEditViewModel_setDesiredHeadroomVisibilityAmount___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  float v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "floatValue");
  objc_msgSend(v4, "setValue:", v3);

}

void __69__PUWallpaperPosterEditViewModel_setDesiredHeadroomVisibilityAmount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  float v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "floatValue");
  objc_msgSend(v4, "setValue:", v3);

}

void __71__PUWallpaperPosterEditViewModel__updateLayerStackViewModelProperties___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "normalizedVisibleFrame");
  objc_msgSend(v4, "setNormalizedVisibleFrame:");
  objc_msgSend(v4, "setParallaxDisabled:", objc_msgSend(*(id *)(a1 + 32), "parallaxDisabled"));
  objc_msgSend(v4, "setAppliesDepthToAllOrientations:", objc_msgSend(*(id *)(a1 + 32), "appliesDepthToAllOrientations"));
  objc_msgSend(v4, "setDepthEnabled:", objc_msgSend(*(id *)(a1 + 32), "depthEnabled"));
  objc_msgSend(v4, "setSettlingEffectEnabled:", objc_msgSend(*(id *)(a1 + 32), "settlingEffectEnabled"));
  objc_msgSend(v4, "setShowsDebugHUD:", PXPreferencesGetBool());

}

void __87__PUWallpaperPosterEditViewModel__updateAvailableLayerStackViewModelsContainerGeometry__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "containerFrame");
  objc_msgSend(v4, "setContainerFrame:");
  objc_msgSend(v4, "setDeviceOrientation:", objc_msgSend(*(id *)(a1 + 32), "deviceOrientation"));

}

void __63__PUWallpaperPosterEditViewModel__updateNormalizedVisibleFrame__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "normalizedVisibleFrame");
  objc_msgSend(v3, "setNormalizedVisibleFrame:");

}

void __63__PUWallpaperPosterEditViewModel__updateNormalizedVisibleFrame__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "normalizedVisibleFrame");
  objc_msgSend(v3, "setNormalizedVisibleFrame:");

}

void __68__PUWallpaperPosterEditViewModel__updateVisibleLayerStackViewModels__block_invoke(uint64_t a1, void *a2)
{
  double v2;
  id v3;

  v2 = 1.0 - *(double *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setVisibilityAmount:", v2);
  objc_msgSend(v3, "setLayoutOrder:", 2);

}

void __68__PUWallpaperPosterEditViewModel__updateVisibleLayerStackViewModels__block_invoke_2(uint64_t a1, void *a2)
{
  double v2;
  id v3;

  v2 = *(double *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setVisibilityAmount:", v2);
  objc_msgSend(v3, "setLayoutOrder:", 1);

}

void __67__PUWallpaperPosterEditViewModel__updateActiveLayerStackViewModels__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v15 = v3;
    v5 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D75610]);
    v4 = v15;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_layerStackViewModelForStyleKind:", v15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 32);
      objc_msgSend(v7, "_previousStyleKindForStyleKind:", v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_layerStackViewModelForStyleKind:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = *(void **)(a1 + 32);
      objc_msgSend(v10, "_nextStyleKindForStyleKind:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_layerStackViewModelForStyleKind:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v6, v9, v12, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObjectsFromArray:", v14);

      v4 = v15;
    }
  }

}

void __74__PUWallpaperPosterEditViewModel_applyChangesFromPosterEditConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[3];

  v3 = a2;
  if (!CGRectIsEmpty(*(CGRect *)(a1 + 48)))
    objc_msgSend(v3, "setNormalizedVisibleFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(v3, "setDepthEnabled:", *(unsigned __int8 *)(a1 + 80));
  if (objc_msgSend(*(id *)(a1 + 32), "isDepthEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 40), "currentLayerStackViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "clockAppearsAboveForeground");

    if (v5)
      objc_msgSend(v3, "setDepthEnabled:", 0);
  }
  objc_msgSend(v3, "setSettlingEffectEnabled:", objc_msgSend(*(id *)(a1 + 32), "isSettlingEffectEnabled"));
  objc_msgSend(v3, "setParallaxDisabled:", objc_msgSend(*(id *)(a1 + 32), "isPerspectiveZoomEnabled") ^ 1);
  objc_msgSend(*(id *)(a1 + 32), "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0D75610];
    v10[0] = v8;
    v10[1] = 0;
    v10[2] = v9;
    objc_msgSend(v3, "scrollToPosition:", v10);

  }
}

void __65__PUWallpaperPosterEditViewModel__updateCurrentStylesWithChange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v5, "clockFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clockFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", v10) & 1) != 0)
    {
      objc_msgSend(v5, "clockColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "clockColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if ((v13 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    v14 = 1;
  }
  else
  {
    v14 = 2;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v14;
LABEL_9:

}

uint64_t __65__PUWallpaperPosterEditViewModel__updateCurrentStylesWithChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "style");
}

uint64_t __51__PUWallpaperPosterEditViewModel_currentStyleKinds__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "kind");
}

uint64_t __86__PUWallpaperPosterEditViewModel_updateSettlingEffectWithSegmentationItem_layerStack___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateSettlingEffectWithSegmentationItem:layerStack:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __76__PUWallpaperPosterEditViewModel_applySettlingEffectVisibleFrameRestoration__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setNormalizedVisibleFrameForInactiveOrientation:", a1[4], a1[5], a1[6], a1[7]);
}

BOOL __71__PUWallpaperPosterEditViewModel_reframeToSettlingEffectBoundsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGRect v24;
  CGRect v25;

  v3 = a2;
  objc_msgSend(v3, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "orientation");

  if (v5 != 2)
  {
    if (v5 == 1 && (objc_msgSend(*(id *)(a1 + 32), "userHasAdjustedPortraitVisibleFrame") & 1) == 0)
      goto LABEL_4;
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "currentLayerStackViewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "segmentationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "settlingEffectNormalizedBounds");

    objc_msgSend(v3, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageSize");
    PXRectWithSize();

    PXRectFlippedVertically();
    objc_msgSend(v3, "layout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "visibleFrame");

    NUPixelRectFromCGRect();
    NUPixelRectFromCGRect();
    NUPixelRectToCGRect();
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    NUPixelRectToCGRect();
    v25.origin.x = v19;
    v25.origin.y = v20;
    v25.size.width = v21;
    v25.size.height = v22;
    v24.origin.x = v12;
    v24.origin.y = v14;
    v24.size.width = v16;
    v24.size.height = v18;
    v6 = !CGRectContainsRect(v24, v25);
    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "userHasAdjustedLandscapeVisibleFrame"))
    goto LABEL_6;
LABEL_4:
  v6 = 1;
LABEL_7:

  return v6;
}

uint64_t __71__PUWallpaperPosterEditViewModel_reframeToSettlingEffectBoundsIfNeeded__block_invoke_52(double *a1, void *a2)
{
  return objc_msgSend(a2, "setNormalizedVisibleFrameForInactiveOrientation:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __68__PUWallpaperPosterEditViewModel_setNormalizedVisibleFrameAnimated___block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setNormalizedVisibleFrame:animated:", 1, a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __65__PUWallpaperPosterEditViewModel_setVisibleLayerStackViewModels___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performChanges:", &__block_literal_global_50);
}

uint64_t __65__PUWallpaperPosterEditViewModel_setVisibleLayerStackViewModels___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLayoutOrder:", 0);
}

void __60__PUWallpaperPosterEditViewModel_setIsUserPanningOrZooming___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "normalizedVisibleFrame");
  objc_msgSend(v3, "setNormalizedVisibleFrame:");

}

uint64_t __63__PUWallpaperPosterEditViewModel_availableLayerStackViewModels__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layerStackViewModelForStyleKind:", a2);
}

uint64_t __72__PUWallpaperPosterEditViewModel__createViewModelsWithInitialViewModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStyle:", *(_QWORD *)(a1 + 32));
}

uint64_t __85__PUWallpaperPosterEditViewModel_initWithInitialLayerStackViewModel_availableStyles___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "kind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __85__PUWallpaperPosterEditViewModel_initWithInitialLayerStackViewModel_availableStyles___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateActiveLayerStackViewModels");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentStyles");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateVisibleLayerStackViewModels");
  objc_msgSend(*(id *)(a1 + 32), "_invalidatePresentingSingleStyle");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCurrentLayerStackViewModel");
  objc_msgSend(*(id *)(a1 + 32), "_invalidateAvailableLayerStackViewModelsProperties");
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateVisibleFrameCrossesHeadroomBoundary");
}

uint64_t __85__PUWallpaperPosterEditViewModel_initWithInitialLayerStackViewModel_availableStyles___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D71248], "styleWithBakedStyle:", a2);
}

@end
