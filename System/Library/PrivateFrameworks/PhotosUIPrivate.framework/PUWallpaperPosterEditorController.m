@implementation PUWallpaperPosterEditorController

- (PUWallpaperPosterEditorController)initWithWallpaperEditor:(id)a3 photoLibrary:(id)a4
{
  id v7;
  id v8;
  PUWallpaperPosterEditorController *v9;
  PUWallpaperPosterEditorController *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  NSObject *v14;
  dispatch_group_t v15;
  OS_dispatch_group *segmentationLoadingGroup;
  UIView *v17;
  UIView *styleDividerView;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD block[4];
  id v25;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PUWallpaperPosterEditorController;
  v9 = -[PUWallpaperPosterEditorController init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_editor, a3);
    objc_storeStrong((id *)&v10->_photoLibrary, a4);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.photos.poster-editor-loading", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    PLWallpaperGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v10->_signpost = os_signpost_id_make_with_pointer(v14, v10);

    v15 = dispatch_group_create();
    segmentationLoadingGroup = v10->_segmentationLoadingGroup;
    v10->_segmentationLoadingGroup = (OS_dispatch_group *)v15;

    v10->_performingInitialLoad = 1;
    v17 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    styleDividerView = v10->_styleDividerView;
    v10->_styleDividerView = v17;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v10->_styleDividerView, "setBackgroundColor:", v19);

    -[PUWallpaperPosterEditModel registerChangeObserver:context:](v10->_editModel, "registerChangeObserver:context:", v10, "EditModelObservationContext");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__PUWallpaperPosterEditorController_initWithWallpaperEditor_photoLibrary___block_invoke;
    block[3] = &unk_1E58ABD10;
    v20 = v8;
    v25 = v20;
    if (initWithWallpaperEditor_photoLibrary__onceToken == -1)
    {
      v21 = v20;
    }
    else
    {
      dispatch_once(&initWithWallpaperEditor_photoLibrary__onceToken, block);
      v21 = v25;
    }
    objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "scheduleDeferredTaskWithQoS:block:", 0, &__block_literal_global_43405);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PUWallpaperPosterEditorController backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("layer.bounds"), &BackgroundViewObservationContext);

  -[PUWallpaperPosterEditorController editModel](self, "editModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterChangeObserver:context:", self, "EditModelObservationContext");

  -[PUWallpaperPosterEditorController _stopObservingPlayerItem](self, "_stopObservingPlayerItem");
  v5.receiver = self;
  v5.super_class = (Class)PUWallpaperPosterEditorController;
  -[PUWallpaperPosterEditorController dealloc](&v5, sel_dealloc);
}

- (void)setEditViewModel:(id)a3
{
  PUWallpaperPosterEditViewModel *v5;
  PUWallpaperPosterEditViewModel *v6;
  char v7;
  PUWallpaperPosterEditViewModel *v8;
  PUWallpaperPosterEditViewModel *v9;
  uint64_t v10;
  PUWallpaperPosterEditViewModel *v11;

  v11 = (PUWallpaperPosterEditViewModel *)a3;
  v5 = self->_editViewModel;
  if (v5 == v11)
  {

LABEL_8:
    v8 = v11;
    goto LABEL_9;
  }
  v6 = v5;
  v7 = -[PUWallpaperPosterEditViewModel isEqual:](v5, "isEqual:", v11);

  v8 = v11;
  if ((v7 & 1) == 0)
  {
    v9 = self->_editViewModel;
    -[PUWallpaperPosterEditViewModel unregisterChangeObserver:context:](v9, "unregisterChangeObserver:context:", self, "EditViewModelObservationContext");
    objc_storeStrong((id *)&self->_editViewModel, a3);
    -[PUWallpaperPosterEditViewModel registerChangeObserver:context:](self->_editViewModel, "registerChangeObserver:context:", self, "EditViewModelObservationContext");

    if (v9)
      v10 = -[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle") ^ 1;
    else
      v10 = 1;
    -[PUWallpaperPosterEditorController _loadEditViewModelAndUpdateLooks:](self, "_loadEditViewModelAndUpdateLooks:", v10);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_loadEditViewModelAndUpdateLooks:(BOOL)a3
{
  _QWORD v5[4];
  id v6;
  BOOL v7;
  id location;

  -[PUWallpaperPosterEditorController _stopSettlingEffectPreview](self, "_stopSettlingEffectPreview");
  -[PUWallpaperPosterEditorController _updateContainerFrame](self, "_updateContainerFrame");
  -[PUWallpaperPosterEditorController _updateDeviceOrientation](self, "_updateDeviceOrientation");
  -[PUWallpaperPosterEditorController _updateCurrentLayerStackViewModel](self, "_updateCurrentLayerStackViewModel");
  -[PUWallpaperPosterEditorController _updateVisibleLayerStackViewModels](self, "_updateVisibleLayerStackViewModels");
  -[PUWallpaperPosterEditorController _updateEditViewModelPropertiesFromPosterConfiguration](self, "_updateEditViewModelPropertiesFromPosterConfiguration");
  -[PUWallpaperPosterEditorController _updateUserTransformView](self, "_updateUserTransformView");
  -[PUWallpaperPosterEditorController _updateShuffleView](self, "_updateShuffleView");
  -[PUWallpaperPosterEditorController _displayDefaultHint](self, "_displayDefaultHint");
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__PUWallpaperPosterEditorController__loadEditViewModelAndUpdateLooks___block_invoke;
  v5[3] = &unk_1E58AA4A0;
  v7 = a3;
  objc_copyWeak(&v6, &location);
  -[PUWallpaperPosterEditorController _dismissPosterConfigurationViewControllerWithCompletion:](self, "_dismissPosterConfigurationViewControllerWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_updateEditViewModelPropertiesFromPosterConfiguration
{
  void *v3;
  void *v4;
  id v5;

  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
  {
    -[PUWallpaperPosterEditorController _applyPosterEditConfigurationForShuffleAsset](self, "_applyPosterEditConfigurationForShuffleAsset");
    if (-[PUWallpaperPosterEditorController _isShuffleModeWithGlobalDepth](self, "_isShuffleModeWithGlobalDepth"))
    {
      -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "performChanges:", &__block_literal_global_204);
LABEL_6:

    }
  }
  else if (v5)
  {
    -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applyChangesFromPosterEditConfiguration:", v5);
    goto LABEL_6;
  }

}

- (void)_updateCurrentStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
  {
    -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentLayerStackViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "style");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "bakedStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController currentEditConfiguration](self, "currentEditConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStyle:", v5);

    -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStyle:", v8);

  }
}

- (void)_updateCurrentLayerStackViewModel
{
  void *v3;
  id v4;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentLayerStackViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController setCurrentLayerStackViewModel:](self, "setCurrentLayerStackViewModel:", v3);

}

- (void)_updateVisibleLayerStackViewModels
{
  void *v3;
  id v4;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleLayerStackViewModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController setVisibleLayerStackViewModels:](self, "setVisibleLayerStackViewModels:", v3);

}

- (void)setCurrentLayerStackViewModel:(id)a3
{
  PUParallaxLayerStackViewModel *v5;
  PUParallaxLayerStackViewModel *v6;
  char v7;
  PUParallaxLayerStackViewModel *v8;
  void *v9;
  char v10;
  PUParallaxLayerStackViewModel *v11;

  v11 = (PUParallaxLayerStackViewModel *)a3;
  v5 = self->_currentLayerStackViewModel;
  if (v5 == v11)
  {

    goto LABEL_8;
  }
  v6 = v5;
  v7 = -[PUParallaxLayerStackViewModel isEqual:](v5, "isEqual:", v11);

  v8 = v11;
  if ((v7 & 1) == 0)
  {
    if (self->_currentLayerStackViewModel)
      -[PUWallpaperPosterEditorController _stopSimulatingParallax](self, "_stopSimulatingParallax");
    objc_storeStrong((id *)&self->_currentLayerStackViewModel, a3);
    -[PUWallpaperPosterEditorController _updateParallaxEnabled](self, "_updateParallaxEnabled");
    -[PUWallpaperPosterEditorController _updateSettlingEffectEnabled](self, "_updateSettlingEffectEnabled");
    -[PUWallpaperPosterEditorController _updateEditToolbar](self, "_updateEditToolbar");
    -[PUWallpaperPosterEditorController editor](self, "editor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "pu_canApplyParallaxToViews");

    v8 = v11;
    if ((v10 & 1) == 0)
    {
      -[PUWallpaperPosterEditorController _startSimulatingParallax](self, "_startSimulatingParallax");
LABEL_8:
      v8 = v11;
    }
  }

}

- (void)setVisibleLayerStackViewModels:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  char v7;
  NSArray *v8;
  NSArray *visibleLayerStackViewModels;
  NSArray *v10;

  v10 = (NSArray *)a3;
  v4 = self->_visibleLayerStackViewModels;
  v5 = v10;
  if (v4 == v10)
    goto LABEL_4;
  v6 = v4;
  v7 = -[NSArray isEqual:](v4, "isEqual:", v10);

  if ((v7 & 1) == 0)
  {
    v5 = self->_visibleLayerStackViewModels;
    v8 = (NSArray *)-[NSArray copy](v10, "copy");
    visibleLayerStackViewModels = self->_visibleLayerStackViewModels;
    self->_visibleLayerStackViewModels = v8;

    -[PUWallpaperPosterEditorController _updateVisibleLayerStackViewsWithPreviouslyVisibleStackViewModels:](self, "_updateVisibleLayerStackViewsWithPreviouslyVisibleStackViewModels:", v5);
LABEL_4:

  }
}

- (void)_updateContainerFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[8];
  CGRect v18;
  CGRect v19;

  -[PUWallpaperPosterEditorController backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  PXRectWithOriginAndSize();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
  {
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    CGRectGetWidth(v18);
    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    CGRectGetHeight(v19);
    PXRectWithOriginAndSize();
    v5 = v12;
    v7 = v13;
    v9 = v14;
    v11 = v15;
  }
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__PUWallpaperPosterEditorController__updateContainerFrame__block_invoke;
  v17[3] = &__block_descriptor_64_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8l;
  *(CGFloat *)&v17[4] = v5;
  *(CGFloat *)&v17[5] = v7;
  *(CGFloat *)&v17[6] = v9;
  *(CGFloat *)&v17[7] = v11;
  objc_msgSend(v16, "performChanges:", v17);

}

- (void)_updateDeviceOrientation
{
  void *v3;
  _QWORD v4[5];

  if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
  {
    -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __61__PUWallpaperPosterEditorController__updateDeviceOrientation__block_invoke;
    v4[3] = &unk_1E58A10B8;
    v4[4] = self;
    objc_msgSend(v3, "performChanges:", v4);

  }
  -[PUWallpaperPosterEditorController _updateContentOverlayContainerView](self, "_updateContentOverlayContainerView");
}

- (void)_removeViewsFromLayerStackViewModel:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a3, "viewManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createdLayerViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__PUWallpaperPosterEditorController__removeViewsFromLayerStackViewModel___block_invoke;
  v7[3] = &unk_1E58ABD10;
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "performWithoutAnimation:", v7);

}

- (void)_updateViewForLayerID:(id)a3 usingViewManager:(id)a4 containerView:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v11 = a5;
  objc_msgSend(a4, "viewForLayerID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "superview");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v11)
    {
      v10 = (void *)MEMORY[0x1E0DC3F10];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __90__PUWallpaperPosterEditorController__updateViewForLayerID_usingViewManager_containerView___block_invoke;
      v12[3] = &unk_1E58ABCA8;
      v13 = v11;
      v14 = v8;
      objc_msgSend(v10, "performWithoutAnimation:", v12);

    }
  }

}

- (void)_updateVisibleLayerStackViewsWithPreviouslyVisibleStackViewModels:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "unregisterChangeObserver:context:", self, "LayerStackViewModelObservationContext");
        -[PUWallpaperPosterEditorController _removeViewsFromLayerStackViewModel:](self, "_removeViewsFromLayerStackViewModel:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visibleLayerStackViewModels");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
        -[PUWallpaperPosterEditorController _updateLayerStackOrderingForViewModel:](self, "_updateLayerStackOrderingForViewModel:", v16);
        objc_msgSend(v16, "registerChangeObserver:context:", self, "LayerStackViewModelObservationContext");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

}

- (void)_updateLayerStackOrderingForViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "viewManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController backgroundView](self, "backgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController _updateViewForLayerID:usingViewManager:containerView:](self, "_updateViewForLayerID:usingViewManager:containerView:", *MEMORY[0x1E0D75570], v5, v6);
  if (objc_msgSend(v4, "hasMatte"))
  {
    if ((objc_msgSend(v4, "clockAppearsAboveForeground") & 1) != 0)
      -[PUWallpaperPosterEditorController foregroundView](self, "foregroundView");
    else
      -[PUWallpaperPosterEditorController floatingView](self, "floatingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController _updateViewForLayerID:usingViewManager:containerView:](self, "_updateViewForLayerID:usingViewManager:containerView:", *MEMORY[0x1E0D75580], v5, v7);

  }
  if (objc_msgSend(v4, "showsDebugHUD"))
  {
    -[PUWallpaperPosterEditorController floatingView](self, "floatingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debugInfoView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentLayerStackViewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "debugInfoView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = CFSTR("Idle Timer Disabled");
    -[PUWallpaperPosterEditorController editModel](self, "editModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "idleTimerDisabled");
    v16 = CFSTR("NO");
    if (v15)
      v16 = CFSTR("YES");
    v19[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayAdditionalDebugInfo:", v17);

  }
}

- (void)_updateStyleDividerView
{
  double v3;
  double v4;
  double v5;
  double Height;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v20;
  double MidY;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  Height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController styleDividerView](self, "styleDividerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v22 = v5;
    objc_msgSend(v7, "scrollPosition");
    v9 = 0.0;
    if (objc_msgSend(v8, "effectiveUserInterfaceLayoutDirection") == 1)
      v9 = 1.0 - 0.0;
    objc_msgSend(v8, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v23.origin.x = v12;
    v23.origin.y = v14;
    v23.size.width = v16;
    v23.size.height = v18;
    if (!CGRectIsEmpty(v23) && v9 > 0.0 && v9 < 1.0)
    {
      v24.origin.x = v12;
      v24.origin.y = v14;
      v24.size.width = v16;
      v24.size.height = v18;
      v22 = 6.0;
      v20 = (0.5 - v9) * 6.0 + CGRectGetWidth(v24) * (1.0 - v9);
      v25.origin.x = v12;
      v25.origin.y = v14;
      v25.size.width = v16;
      v25.size.height = v18;
      MidY = CGRectGetMidY(v25);
      v26.origin.x = v12;
      v26.origin.y = v14;
      v26.size.width = v16;
      v26.size.height = v18;
      Height = CGRectGetHeight(v26);
      v3 = v20 + -3.0;
      v4 = MidY + Height * -0.5;
    }
    v5 = v22;
  }
  objc_msgSend(v8, "setFrame:", v3, v4, v5, Height, *(_QWORD *)&v22);

}

- (void)_updateContentOverlayContainerView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  CGAffineTransform *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _OWORD v24[3];
  _OWORD v25[3];

  -[PUWallpaperPosterEditorController contentOverlayContainerView](self, "contentOverlayContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController editor](self, "editor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOverlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PUWallpaperPosterEditorController environment](self, "environment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (CGAffineTransform *)objc_msgSend(v14, "pu_deviceOrientation");

  v16 = v7;
  v17 = v9;
  v18 = v11;
  v19 = v13;
  if ((unint64_t)&v15[-1].ty + 5 <= 1)
  {
    PXRectTransposed();
    v16 = v20;
    v17 = v21;
    v18 = v22;
    v19 = v23;
  }
  PXRectGetCenter();
  objc_msgSend(v3, "setCenter:");
  objc_msgSend(v3, "setBounds:", v16, v17, v18, v19);
  PUPosterAdditionalTransformForDeviceOrientation(v15, (uint64_t)v25);
  v24[0] = v25[0];
  v24[1] = v25[1];
  v24[2] = v25[2];
  objc_msgSend(v3, "setTransform:", v24);

}

- (void)setPosterConfiguration:(id)a3
{
  PFPosterConfiguration *v5;
  char v6;
  PFPosterConfiguration *v7;
  PFPosterConfiguration *v8;

  v8 = (PFPosterConfiguration *)a3;
  v5 = self->_posterConfiguration;
  if (v5 == v8)
  {

LABEL_8:
    v7 = v8;
    goto LABEL_9;
  }
  v6 = -[PFPosterConfiguration isEqual:](v8, "isEqual:", v5);

  v7 = v8;
  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_posterConfiguration, a3);
    v7 = v8;
    if (v8)
    {
      if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
        -[PUWallpaperPosterEditorController _beginLoadingShuffleResources](self, "_beginLoadingShuffleResources");
      -[PUWallpaperPosterEditorController _updateUserTransformIsDisabled](self, "_updateUserTransformIsDisabled");
      -[PUWallpaperPosterEditorController _loadAssetFromPosterConfiguration](self, "_loadAssetFromPosterConfiguration");
      -[PUWallpaperPosterEditorController _updateEditToolbar](self, "_updateEditToolbar");
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (PFPosterEditConfiguration)currentEditConfiguration
{
  void *v3;
  void *v4;

  if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
    -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
  else
    -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PFPosterEditConfiguration *)v4;
}

- (void)_loadAssetFromPosterConfiguration
{
  void *v3;
  NSObject *v4;
  void *v5;
  PUWallpaperPosterMigrator *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "options") & 2) != 0)
  {
    v6 = [PUWallpaperPosterMigrator alloc];
    -[PUWallpaperPosterEditorController environment](self, "environment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pu_sourceAssetDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController environment](self, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PUWallpaperPosterMigrator initWithAssetDirectory:configurationType:](v6, "initWithAssetDirectory:configurationType:", v8, objc_msgSend(v9, "pu_legacyConfigurationType"));

    -[PUWallpaperPosterEditorController _showLoadingIndicator](self, "_showLoadingIndicator");
    objc_initWeak(location, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __70__PUWallpaperPosterEditorController__loadAssetFromPosterConfiguration__block_invoke;
    v13[3] = &unk_1E58A10E0;
    objc_copyWeak(&v14, location);
    -[NSObject attemptMigrationWithCompletionBlock:](v4, "attemptMigrationWithCompletionBlock:", v13);
    -[PUWallpaperPosterEditorController setMigrator:](self, "setMigrator:", v4);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
LABEL_9:

    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "options") & 8) != 0)
  {
    PLWallpaperGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v3;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_INFO, "Ignore current configuration as it's marked as needing update: %@", (uint8_t *)location, 0xCu);
    }
    goto LABEL_9;
  }
  if (v3)
  {
    objc_msgSend(v3, "media");
    v4 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v4, "count"))
    {
      -[NSObject objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", -[PUWallpaperPosterEditorController shuffleAssetIndex](self, "shuffleAssetIndex")% (unint64_t)-[NSObject count](v4, "count"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperPosterEditorController setCurrentPosterMedia:](self, "setCurrentPosterMedia:", v5);

    }
    else
    {
      -[PUWallpaperPosterEditorController environment](self, "environment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "px_isCallServices");

      if (v11)
      {
        -[PUWallpaperPosterEditorController _pickAssets](self, "_pickAssets");
      }
      else
      {
        PLWallpaperGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v3;
          _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "Current poster configuration has no media: %@", (uint8_t *)location, 0xCu);
        }

        -[PUWallpaperPosterEditorController setCurrentPosterMedia:](self, "setCurrentPosterMedia:", 0);
      }
    }
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_createShuffleResourceManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  PUWallpaperShuffleResourceManager *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PUWallpaperShuffleResourceManager *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopPreloadingResources");

  -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "style");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "editConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "style");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D71248], "styleWithBakedStyle:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  v28 = (void *)v8;

  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "editConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "style");
  v12 = objc_claimAutoreleasedReturnValue();

  v27 = (void *)v12;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D71248], "styleWithBakedStyle:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  v14 = -[PUWallpaperPosterEditorController _shuffleType](self, "_shuffleType");
  v15 = [PUWallpaperShuffleResourceManager alloc];
  objc_msgSend(v4, "media");
  v16 = v4;
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController environment](self, "environment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "pu_sourceAssetDirectory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v28;
  v22 = -[PUWallpaperShuffleResourceManager initWithPosterMedia:style:assetDirectory:persistedStyle:photoLibrary:shuffleType:](v15, "initWithPosterMedia:style:assetDirectory:persistedStyle:photoLibrary:shuffleType:", v17, v28, v19, v13, v20, v14);
  -[PUWallpaperPosterEditorController setShuffleResourceManager:](self, "setShuffleResourceManager:", v22);

  if (v14 != 1)
  {
    if (v29)
    {
      v23 = objc_msgSend(v29, "depthEnabledForAllMedia");
    }
    else
    {
      objc_msgSend(v16, "editConfiguration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v16, "editConfiguration");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v25, "isDepthEnabled");

      }
      else
      {
        v23 = 1;
      }
    }
    -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDepthEnabledForAllMedia:", v23);

    v21 = v28;
  }

}

- (void)_beginLoadingShuffleResources
{
  void *v3;
  void *v4;
  id v5;

  -[PUWallpaperPosterEditorController _createShuffleResourceManager](self, "_createShuffleResourceManager");
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "media");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startPreloadingResourcesForPosterMedia:", v4);

  if (!-[PUWallpaperPosterEditorController isAnySmartAlbumAvailable](self, "isAnySmartAlbumAvailable"))
    -[PUWallpaperPosterEditorController _updateSmartAlbumAvailability](self, "_updateSmartAlbumAvailability");

}

- (void)_loadPosterDescriptor
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[PUWallpaperPosterEditorController environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pu_posterDescriptor");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 635, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("posterDescriptor"));

    v5 = 0;
  }
  if ((objc_msgSend(v5, "isBlankTemplate") & 1) != 0 || objc_msgSend(v12, "descriptorType") == 2)
  {
    -[PUWallpaperPosterEditorController _pickAssets](self, "_pickAssets");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "posterConfigurationFromPosterDescriptor:", v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 642, CFSTR("Missing poster configuration"));

    }
    if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
    {
      objc_msgSend(v6, "shuffleConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 644, CFSTR("Missing poster shuffle configuration"));

      }
    }
    objc_msgSend(v12, "media");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMedia:", v8);

    -[PUWallpaperPosterEditorController setPosterConfiguration:](self, "setPosterConfiguration:", v6);
  }

}

- (void)_loadSourcePosterConfiguration
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PUWallpaperConfigurationUpdater *v10;
  PUWallpaperConfigurationUpdater *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, void *, uint64_t, void *, void *);
  void *v24;
  id v25;
  id location;

  -[PUWallpaperPosterEditorController environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pu_sourcePosterConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "options") & 8) != 0)
  {
    -[PUWallpaperPosterEditorController _showLoadingIndicator](self, "_showLoadingIndicator");
    v11 = [PUWallpaperConfigurationUpdater alloc];
    -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController environment](self, "environment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pu_sourcePosterConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController environment](self, "environment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pu_targetAssetDirectory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController environment](self, "environment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pu_overrideConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PUWallpaperConfigurationUpdater initWithPhotoLibrary:sourceConfiguration:targetAssetDirectory:overrideConfiguration:](v11, "initWithPhotoLibrary:sourceConfiguration:targetAssetDirectory:overrideConfiguration:", v12, v14, v16, v18);

    objc_initWeak(&location, self);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __67__PUWallpaperPosterEditorController__loadSourcePosterConfiguration__block_invoke;
    v24 = &unk_1E58A1108;
    objc_copyWeak(&v25, &location);
    -[PUWallpaperConfigurationUpdater attemptUpdateWithCompletionBlock:](v10, "attemptUpdateWithCompletionBlock:", &v21);
    -[PUWallpaperPosterEditorController setConfigurationUpdater:](self, "setConfigurationUpdater:", v10, v21, v22, v23, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 710, CFSTR("Missing source poster configuration"));

    }
    if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
    {
      objc_msgSend(v5, "shuffleConfiguration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 712, CFSTR("Missing source poster shuffle configuration"));

      }
      objc_msgSend(v5, "media");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperPosterEditorController environment](self, "environment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "px_significantEventsCounter");

      self->_shuffleAssetIndex = +[PUPosterUtilities mediaIndexWithSeed:mediaCount:](PUPosterUtilities, "mediaIndexWithSeed:mediaCount:", v9, objc_msgSend(v7, "count"));
    }
    v10 = (PUWallpaperConfigurationUpdater *)objc_msgSend(v5, "copy");
    -[PUWallpaperPosterEditorController setPosterConfiguration:](self, "setPosterConfiguration:", v10);
  }

}

- (void)_handleUpdatedConfiguration:(id)a3 segmentationItem:(id)a4 compoundLayerStack:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v14 = a4;
  v12 = a3;
  -[PUWallpaperPosterEditorController _hideLoadingIndicator](self, "_hideLoadingIndicator");
  v13 = (void *)objc_msgSend(v12, "copy");

  -[PUWallpaperPosterEditorController setPosterConfiguration:](self, "setPosterConfiguration:", v13);
  -[PUWallpaperPosterEditorController _handleSegmentationItem:compoundLayerStack:style:forAsset:error:](self, "_handleSegmentationItem:compoundLayerStack:style:forAsset:error:", v14, v11, 0, 0, v10);

}

- (void)setCurrentPosterMedia:(id)a3
{
  PFPosterMedia **p_currentPosterMedia;
  PFPosterMedia *v6;
  char v7;
  PFPosterMedia *v8;
  PFPosterMedia *v9;
  PFPosterMedia *v10;

  v10 = (PFPosterMedia *)a3;
  p_currentPosterMedia = &self->_currentPosterMedia;
  v6 = self->_currentPosterMedia;
  if (v6 == v10)
  {

LABEL_8:
    v8 = v10;
    goto LABEL_9;
  }
  v7 = -[PFPosterMedia isEqual:](v10, "isEqual:", v6);

  v8 = v10;
  if ((v7 & 1) == 0)
  {
    v9 = *p_currentPosterMedia;
    objc_storeStrong((id *)&self->_currentPosterMedia, a3);
    if (!v9 || !*p_currentPosterMedia)
      -[PUWallpaperPosterEditorController _updateEditToolbar](self, "_updateEditToolbar");
    -[PUWallpaperPosterEditorController _loadContentForCurrentPosterMedia](self, "_loadContentForCurrentPosterMedia");
    goto LABEL_8;
  }
LABEL_9:

}

- (void)setIsCancellingMediaLoading:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_isCancellingMediaLoading != a3)
  {
    self->_isCancellingMediaLoading = a3;
    if (a3)
    {
      -[PUWallpaperPosterEditorController segmentationLoading](self, "segmentationLoading");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cancel");

      -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stopPreloadingResources");

    }
  }
}

- (void)_loadContentForCurrentPosterMedia
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *p_location;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id *v28;
  id v29;
  id from;
  id *p_from;
  uint64_t v32;
  char v33;
  id location;

  -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController environment](self, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pu_sourceAssetDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "assetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController setLoadingSettlingEffect:](self, "setLoadingSettlingEffect:", 0);
  if (v3)
  {
    if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
    {
      objc_initWeak(&location, self);
      from = 0;
      p_from = &from;
      v32 = 0x2020000000;
      v33 = 0;
      -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __70__PUWallpaperPosterEditorController__loadContentForCurrentPosterMedia__block_invoke;
      v26[3] = &unk_1E58A1130;
      objc_copyWeak(&v29, &location);
      v27 = v3;
      v28 = &from;
      objc_msgSend(v7, "requestResourceForPosterMedia:completion:", v27, v26);

      if (!*((_BYTE *)p_from + 24)
        && !-[PUWallpaperPosterEditorController isPerformingInitialLoad](self, "isPerformingInitialLoad"))
      {
        -[PUWallpaperPosterEditorController _showLoadingIndicator](self, "_showLoadingIndicator");
      }
      v8 = -[PUWallpaperPosterEditorController shuffleAssetIndex](self, "shuffleAssetIndex");
      -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "media");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "media");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", (v8 + 1) % v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "preloadResourceForPosterMedia:", v14);

      objc_destroyWeak(&v29);
      _Block_object_dispose(&from, 8);
      p_location = &location;
      goto LABEL_14;
    }
    if (!v5)
      goto LABEL_12;
    objc_msgSend(v3, "subpath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "fileExistsAtPath:", v20);

    if (v21)
      -[PUWallpaperPosterEditorController _loadAssetUUID:fromWallpaperURL:](self, "_loadAssetUUID:fromWallpaperURL:", v6, v18);

    if (v21 != 1)
    {
LABEL_12:
      if (v6)
      {
        -[PUWallpaperPosterEditorController _showLoadingIndicator](self, "_showLoadingIndicator");
        objc_initWeak(&from, self);
        -[PUWallpaperPosterEditorController queue](self, "queue");
        v22 = objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __70__PUWallpaperPosterEditorController__loadContentForCurrentPosterMedia__block_invoke_2;
        v23[3] = &unk_1E58AB210;
        objc_copyWeak(&v25, &from);
        v24 = v6;
        dispatch_async(v22, v23);

        objc_destroyWeak(&v25);
        p_location = &from;
LABEL_14:
        objc_destroyWeak(p_location);
      }
    }
  }
  else
  {
    -[PUWallpaperPosterEditorController setEditViewModel:](self, "setEditViewModel:", 0);
  }

}

- (void)_loadAssetUUID:(id)a3 fromWallpaperURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLWallpaperGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v7;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_INFO, "Attempt to load wallpaper for editing from poster url: %{public}@", buf, 0xCu);
  }

  if (!-[PUWallpaperPosterEditorController _tryLoadAssetUUID:fromWallpaperURL:](self, "_tryLoadAssetUUID:fromWallpaperURL:", v6, v7))
  {
    -[PUWallpaperPosterEditorController environment](self, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "px_isCallServices");

    if ((v10 & 1) != 0)
      goto LABEL_6;
    PUWallpaperCacheDirectoryURL();
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "URLByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v11) = -[PUWallpaperPosterEditorController _tryLoadAssetUUID:fromWallpaperURL:](self, "_tryLoadAssetUUID:fromWallpaperURL:", v6, v13);
    if ((v11 & 1) == 0)
    {
LABEL_6:
      -[PUWallpaperPosterEditorController _showLoadingIndicator](self, "_showLoadingIndicator");
      objc_initWeak((id *)buf, self);
      -[PUWallpaperPosterEditorController queue](self, "queue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__PUWallpaperPosterEditorController__loadAssetUUID_fromWallpaperURL___block_invoke;
      block[3] = &unk_1E58AA2E0;
      objc_copyWeak(&v18, (id *)buf);
      v16 = v6;
      v17 = v7;
      dispatch_async(v14, block);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }

}

- (BOOL)_tryLoadAssetUUID:(id)a3 fromWallpaperURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0D71298], "loadCompoundLayerStackFromWallpaperURL:options:error:", v7, 66, &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v21;
  if (v8)
  {
    -[PUWallpaperPosterEditorController currentEditConfiguration](self, "currentEditConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "style");
    v11 = objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v20 = 0;
      objc_msgSend(MEMORY[0x1E0D71298], "loadStyleFromWallpaperURL:error:", v7, &v20);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v20;
      if (!v11)
      {
        PLWallpaperGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v23 = v6;
          v24 = 2114;
          v25 = v12;
          _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "Failed to load style for asset: %{public}@, error: %{public}@", buf, 0x16u);
        }

      }
    }
    v19 = v9;
    objc_msgSend(MEMORY[0x1E0D71298], "loadSegmentationItemFromWallpaperURL:error:", v7, &v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;

    v16 = v14 != 0;
    if (v14)
    {
      -[PUWallpaperPosterEditorController _handleSegmentationItem:compoundLayerStack:style:forAsset:error:](self, "_handleSegmentationItem:compoundLayerStack:style:forAsset:error:", v14, v8, v11, 0, v15);
    }
    else
    {
      PLWallpaperGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v23 = v6;
        v24 = 2114;
        v25 = v15;
        _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_ERROR, "Failed to load segmentation item for asset: %{public}@, error: %{public}@", buf, 0x16u);
      }

    }
  }
  else
  {
    PLWallpaperGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v6;
      v24 = 2114;
      v25 = v9;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_INFO, "Failed to load layer stack for asset: %{public}@, error: %{public}@", buf, 0x16u);
    }
    v16 = 0;
    v15 = v9;
  }

  return v16;
}

- (void)_reloadAssetUUID:(id)a3 fromWallpaperURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  PUWallpaperPosterEditorController *v26;
  id v27;
  id location;
  uint8_t buf[4];
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0CD1390];
  v31[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetsWithUUIDs:options:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PUWallpaperPosterEditorController segmentationLoadingGroup](self, "segmentationLoadingGroup");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v14);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1818]), "initWithPhotoAsset:", v13);
    v16 = (void *)MEMORY[0x1E0D71298];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke;
    v23[3] = &unk_1E58A1158;
    v17 = v14;
    v24 = v17;
    objc_copyWeak(&v27, &location);
    v25 = v6;
    v26 = self;
    objc_msgSend(v16, "reloadSegmentationItemFromWallpaperURL:asset:completion:", v7, v15, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController setSegmentationLoading:](self, "setSegmentationLoading:", v18);

    objc_destroyWeak(&v27);
  }
  else
  {
    PLWallpaperGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v6;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Failed to fetch cold-start asset: %{public}@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke_247;
    block[3] = &unk_1E58AB210;
    objc_copyWeak(&v22, &location);
    v21 = 0;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v22);
  }

  objc_destroyWeak(&location);
}

- (void)_loadAssetWithUUID:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v23;
  void *v24;
  _QWORD block[4];
  id v26;
  _QWORD v27[5];
  id v28;
  NSObject *v29;
  _BYTE *v30;
  _QWORD *v31;
  id v32[2];
  BOOL v33;
  _QWORD v34[4];
  id v35;
  _BYTE *v36;
  _QWORD *v37;
  id v38;
  _QWORD v39[4];
  id location;
  _BYTE buf[24];
  char v42;
  _QWORD v43[4];

  v43[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PUWallpaperPosterEditorController shouldLoadSettlingEffectSynchronously](self, "shouldLoadSettlingEffectSynchronously");
  PLWallpaperGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("asynchronous");
    if (v5)
      v7 = CFSTR("synchronous");
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_INFO, "Segmenting asset, %@ settling effect: %{public}@", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIncludeGuestAssets:", 1);
  v10 = (void *)MEMORY[0x1E0CD1390];
  v43[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchAssetsWithUUIDs:options:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PUWallpaperPosterEditorController segmentationLoadingGroup](self, "segmentationLoadingGroup");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v14);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1818]), "initWithPhotoAsset:", v13);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71298]), "initWithParallaxAsset:", v24);
    if (-[PUPosterEditingEnvironment px_isCallServices](self->_environment, "px_isCallServices"))
    {
      -[PUPosterEditingEnvironment px_titleBoundsForLayout:](self->_environment, "px_titleBoundsForLayout:", 0);
      objc_msgSend(MEMORY[0x1E0D75340], "genericCallServicesConfigurationWithTitleBounds:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setLayoutConfiguration:", v16);

      objc_msgSend(v15, "setDisableSettlingEffect:", 1);
      objc_msgSend(v15, "setRole:", 1);
      objc_msgSend(v15, "setDisableCache:", 1);
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v42 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v39[3] = 0;
    -[PUWallpaperPosterEditorController setSegmentationLoading:](self, "setSegmentationLoading:", v15, a2);
    v17 = MEMORY[0x1E0C80D38];
    v18 = MEMORY[0x1E0C80D38];
    objc_msgSend(v15, "setLoadingHandlerQueue:", v17);

    v19 = MEMORY[0x1E0C809B0];
    if (!v5)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke;
      v34[3] = &unk_1E58A1180;
      v36 = buf;
      objc_copyWeak(&v38, &location);
      v35 = v13;
      v37 = v39;
      objc_msgSend(v15, "setLoadingHandler:", v34);

      objc_destroyWeak(&v38);
    }
    v27[0] = v19;
    v27[1] = 3221225472;
    v27[2] = __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke_253;
    v27[3] = &unk_1E58A11A8;
    v33 = v5;
    v32[1] = v23;
    v30 = buf;
    v27[4] = self;
    objc_copyWeak(v32, &location);
    v28 = v13;
    v31 = v39;
    v20 = v14;
    v29 = v20;
    objc_msgSend(v15, "loadSegmentationItemWithCompletion:", v27);

    objc_destroyWeak(v32);
    _Block_object_dispose(v39, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    PLWallpaperGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v4;
      _os_log_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_ERROR, "Failed to fetch asset: %{public}@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke_254;
    block[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v26, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v26);
  }

  objc_destroyWeak(&location);
}

- (void)_handleShuffleSegmentationItem:(id)a3 compoundLayerStack:(id)a4 editConfiguration:(id)a5 forPosterMedia:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[PUWallpaperPosterEditorController environment](self, "environment");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (v17 == v14)
    {
      if (v13)
      {
        v18 = (void *)objc_msgSend(v13, "copy");
        -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setEditConfiguration:", v18);

      }
      objc_msgSend(v13, "style");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "currentLayerStackViewModel");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "style");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bakedStyle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[PUWallpaperPosterEditorController _handleSegmentationItem:compoundLayerStack:style:forAsset:error:](self, "_handleSegmentationItem:compoundLayerStack:style:forAsset:error:", v24, v12, v20, 0, v15);
      if (!v24)
        -[PUWallpaperPosterEditorController setCurrentPosterMedia:](self, "setCurrentPosterMedia:", 0);

    }
  }

}

- (id)_sanitizeCompoundLayerStack:(id)a3 forSegmentationItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CGRect v14;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    if (!objc_msgSend(v6, "isSettlingEffectAvailable")
      || (objc_msgSend(v7, "settlingEffectNormalizedBounds"), CGRectIsEmpty(v14)))
    {
      objc_msgSend(v5, "compoundLayerStackByUpdatingSettlingEffectEnabled:", 0);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v8;
    }
    objc_msgSend(v7, "originalLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "supportsBothOrientations"))
      goto LABEL_12;
    objc_msgSend(v5, "portraitLayerStack");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {

LABEL_11:
      v9 = v5;
      v5 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v11 = (void *)v10;
    objc_msgSend(v5, "landscapeLayerStack");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_11;
  }
LABEL_13:

  return v5;
}

- (void)_handleSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 forAsset:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[PUWallpaperPosterEditorController environment](self, "environment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (v12)
    {
      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __101__PUWallpaperPosterEditorController__handleSegmentationItem_compoundLayerStack_style_forAsset_error___block_invoke;
      v18[3] = &unk_1E58A11D0;
      objc_copyWeak(&v20, &location);
      v19 = v15;
      -[PUWallpaperPosterEditorController _loadEditViewModelWithSegmentationItem:compoundLayerStack:style:completion:](self, "_loadEditViewModelWithSegmentationItem:compoundLayerStack:style:completion:", v12, v13, v14, v18);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PUWallpaperPosterEditorController _didFinishCreatingEditViewModel:forAsset:error:](self, "_didFinishCreatingEditViewModel:forAsset:error:", 0, v15, v16);
    }
  }

}

- (void)_loadEditViewModelWithSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD aBlock[4];
  id v25;
  id v26;
  PUWallpaperPosterEditorController *v27;
  id v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v12)
  {
    -[PUWallpaperPosterEditorController _initialLayerStyleForSegmentationItem:](self, "_initialLayerStyleForSegmentationItem:", v10);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PUWallpaperPosterEditorController _sanitizeCompoundLayerStack:forSegmentationItem:](self, "_sanitizeCompoundLayerStack:forSegmentationItem:", v11, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_class();
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "availableStylesForItem:posterConfiguration:", v10, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__PUWallpaperPosterEditorController__loadEditViewModelWithSegmentationItem_compoundLayerStack_style_completion___block_invoke;
  aBlock[3] = &unk_1E58A11F8;
  v18 = v10;
  v25 = v18;
  v19 = v12;
  v26 = v19;
  v27 = self;
  v28 = v17;
  v29 = v13;
  v20 = v13;
  v21 = v17;
  v22 = _Block_copy(aBlock);
  v23 = v22;
  if (v14)
    (*((void (**)(void *, void *, _QWORD))v22 + 2))(v22, v14, 0);
  else
    -[PUWallpaperPosterEditorController _renderInitialLayerStack:style:completion:](self, "_renderInitialLayerStack:style:completion:", v18, v19, v22);

}

- (void)_renderInitialLayerStack:(id)a3 style:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[4];
  id v29;

  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0D71220];
  v11 = a3;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithSegmentationItem:", v11);
  objc_msgSend(v12, "setResponseQueue:", MEMORY[0x1E0C80D38]);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 0);
  objc_msgSend(v12, "setPriority:", v13);

  v14 = objc_msgSend(v11, "isSettlingEffectAvailable");
  objc_msgSend(v12, "setSettlingEffectEnabled:", v14);
  if (objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration"))
    v15 = 136;
  else
    v15 = 8;
  if (objc_msgSend(v12, "isSettlingEffectEnabled"))
    v16 = v15 | 0x40;
  else
    v16 = v15;
  objc_msgSend(v12, "setLayerStackOptions:", v16);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D71248], "styleWithBakedStyle:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStyle:", v17);

    objc_msgSend(v8, "kind");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D75600]);

    if ((v19 & 1) == 0)
      objc_msgSend(v12, "setSettlingEffectEnabled:", 0);
  }
  -[PUWallpaperPosterEditorController segmentationLoadingGroup](self, "segmentationLoadingGroup");
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v20);
  objc_msgSend(MEMORY[0x1E0D52290], "begin");
  v21 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __79__PUWallpaperPosterEditorController__renderInitialLayerStack_style_completion___block_invoke;
  v28[3] = &unk_1E58A4BB0;
  v29 = v9;
  v22 = v9;
  objc_msgSend(v12, "submit:", v28);
  -[PUWallpaperPosterEditorController setLayerStackRequest:](self, "setLayerStackRequest:", v12);
  v23 = (void *)MEMORY[0x1E0D52290];
  -[PUWallpaperPosterEditorController queue](self, "queue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v21;
  v26[1] = 3221225472;
  v26[2] = __79__PUWallpaperPosterEditorController__renderInitialLayerStack_style_completion___block_invoke_263;
  v26[3] = &unk_1E58ABD10;
  v27 = v20;
  v25 = v20;
  objc_msgSend(v23, "commitAndNotifyOnQueue:withBlock:", v24, v26);

}

- (void)_handleSettlingEffectLoadedWithSegmentationItem:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  id v13;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v4, "isSettlingEffectAvailable"))
    {
      objc_initWeak(location, self);
      v8 = MEMORY[0x1E0C809B0];
      v9 = 3221225472;
      v10 = __85__PUWallpaperPosterEditorController__handleSettlingEffectLoadedWithSegmentationItem___block_invoke;
      v11 = &unk_1E58A1220;
      objc_copyWeak(&v13, location);
      v12 = v4;
      -[PUWallpaperPosterEditorController _loadSettlingEffectLayerStackForSegmentationItem:completion:](self, "_loadSettlingEffectLayerStackForSegmentationItem:completion:", v12, &v8);

      objc_destroyWeak(&v13);
      objc_destroyWeak(location);
    }
    if (objc_msgSend(v4, "settlingEffectFailedAnyGating", v8, v9, v10, v11))
    {
      PLWallpaperGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "settlingEffectGatingDiagnostics");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v7;
        _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_INFO, "Settling effect diagnostics: %@", (uint8_t *)location, 0xCu);

      }
      -[PUWallpaperPosterEditorController _presentSettlingEffectDebugView:](self, "_presentSettlingEffectDebugView:", v4);
    }
  }

}

- (void)_sendSettlingEffectGatingAnalyticsWithSegmentationItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int v13;

  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  v3 = (void *)MEMORY[0x1E0D71280];
  objc_msgSend(a3, "scores");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settlingEffectGatingStatisticsFromScores:", v4);

  v6 = v10;
  v7 = v11;
  v8 = v12;
  LODWORD(v9) = v13;
  PFPosterSettlingEffectGatingStatisticsAnalyticsPayload();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", *MEMORY[0x1E0D75870], v5, v6, v7, v8, v9);

}

- (void)_loadSettlingEffectLayerStackForSegmentationItem:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD v19[4];
  id v20;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0D71228];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithSegmentationItem:", v8);

  objc_msgSend(v9, "setResponseQueue:", MEMORY[0x1E0C80D38]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52230]), "initWithLevel:", 1);
  objc_msgSend(v9, "setPriority:", v10);

  objc_msgSend(v9, "setLayerStackMode:", 7);
  objc_msgSend(v9, "setSettlingEffectEnabled:", 0);
  -[PUWallpaperPosterEditorController segmentationLoadingGroup](self, "segmentationLoadingGroup");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v11);
  objc_msgSend(MEMORY[0x1E0D52290], "begin");
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__PUWallpaperPosterEditorController__loadSettlingEffectLayerStackForSegmentationItem_completion___block_invoke;
  v19[3] = &unk_1E58A4BB0;
  v20 = v6;
  v13 = v6;
  objc_msgSend(v9, "submit:", v19);
  -[PUWallpaperPosterEditorController setSettlingEffectRequest:](self, "setSettlingEffectRequest:", v9);
  v14 = (void *)MEMORY[0x1E0D52290];
  -[PUWallpaperPosterEditorController queue](self, "queue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __97__PUWallpaperPosterEditorController__loadSettlingEffectLayerStackForSegmentationItem_completion___block_invoke_267;
  v17[3] = &unk_1E58ABD10;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v14, "commitAndNotifyOnQueue:withBlock:", v15, v17);

}

- (void)_handleSettlingEffectLoadedWithSegmentationItem:(id)a3 layerStack:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v8)
  {

    if (v7)
    {
      -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __96__PUWallpaperPosterEditorController__handleSettlingEffectLoadedWithSegmentationItem_layerStack___block_invoke;
      v10[3] = &unk_1E58A1248;
      v11 = v6;
      v12 = v7;
      objc_msgSend(v9, "performChanges:", v10);

    }
  }
  else
  {

  }
}

- (void)_didFinishCreatingEditViewModel:(id)a3 forAsset:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v8 = a4;
  v9 = a5;
  -[PUWallpaperPosterEditorController environment](self, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_17;
  -[PUWallpaperPosterEditorController setEditViewModel:](self, "setEditViewModel:", v17);
  if (!v17)
  {
    if (-[PUWallpaperPosterEditorController isCancellingMediaLoading](self, "isCancellingMediaLoading"))
    {
      if (!v9)
        goto LABEL_12;
      objc_msgSend(v9, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
      {
        v12 = objc_msgSend(v9, "code");

        if (v12 == 3072)
          goto LABEL_12;
      }
      else
      {

      }
    }
    if (v8)
      -[PUWallpaperPosterEditorController _presentLoadingError:forAsset:](self, "_presentLoadingError:forAsset:", v9, v8);
    else
      -[PUWallpaperPosterEditorController _presentLoadingError:](self, "_presentLoadingError:", v9);
  }
LABEL_12:
  -[PUWallpaperPosterEditorController _hideLoadingIndicator](self, "_hideLoadingIndicator");
  if (-[PUWallpaperPosterEditorController fadeInInitialLoad](self, "fadeInInitialLoad")
    && -[PUWallpaperPosterEditorController isPerformingInitialLoad](self, "isPerformingInitialLoad"))
  {
    -[PUWallpaperPosterEditorController _fadeInViews](self, "_fadeInViews");
  }
  -[PUWallpaperPosterEditorController setPerformingInitialLoad:](self, "setPerformingInitialLoad:", 0);
  -[PUWallpaperPosterEditorController mediaLoadedCompletionHandler](self, "mediaLoadedCompletionHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PUWallpaperPosterEditorController mediaLoadedCompletionHandler](self, "mediaLoadedCompletionHandler");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assetUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, BOOL, void *, id))v14)[2](v14, v17 != 0, v16, v9);

  }
LABEL_17:

}

- (void)_fadeInViews
{
  uint64_t v2;
  void (**v3)(double);
  void *v4;
  void (**v5)(double);
  _QWORD v6[4];
  void (**v7)(double);
  _QWORD aBlock[5];

  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PUWallpaperPosterEditorController__fadeInViews__block_invoke;
  aBlock[3] = &unk_1E58AA448;
  aBlock[4] = self;
  v3 = (void (**)(double))_Block_copy(aBlock);
  v3[2](0.0);
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __49__PUWallpaperPosterEditorController__fadeInViews__block_invoke_2;
  v6[3] = &unk_1E58ABAC8;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "animateWithDuration:animations:", v6, 0.3);

}

- (void)_presentLoadingError:(id)a3 forAsset:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  PUEditingErrorPresentationController *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PUWallpaperPosterErrorDomain"), -1, 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = -[PUEditingErrorPresentationController initWithError:forAsset:]([PUEditingErrorPresentationController alloc], "initWithError:forAsset:", v8, v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PUWallpaperPosterEditorController__presentLoadingError_forAsset___block_invoke;
  v12[3] = &unk_1E58ABD10;
  v12[4] = self;
  -[PUErrorPresentationController alertControllerWithCompletion:](v10, "alertControllerWithCompletion:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController _presentLoadingErrorAlertController:](self, "_presentLoadingErrorAlertController:", v11);

}

- (void)_presentLoadingError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v4 = a3;
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_EDITOR_ASSET_LOADING_FAILED_TITLE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
  {

    goto LABEL_5;
  }
  v7 = objc_msgSend(v4, "code");

  if (v7 != -1009)
  {
LABEL_5:
    v8 = CFSTR("PHOTOS_WALLPAPER_EDITOR_ASSET_LOADING_FAILED_MESSAGE");
    goto LABEL_6;
  }
  v8 = CFSTR("PHOTOS_WALLPAPER_EDITOR_ASSET_LOADING_FAILED_MESSAGE_CONNECTION");
LABEL_6:
  PULocalizedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __58__PUWallpaperPosterEditorController__presentLoadingError___block_invoke;
  v14[3] = &unk_1E58A8DE8;
  v14[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v13);

  -[PUWallpaperPosterEditorController _presentLoadingErrorAlertController:](self, "_presentLoadingErrorAlertController:", v10);
}

- (id)_initialLayerStyleForSegmentationItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PUWallpaperPosterEditorController environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pu_posterDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "styleCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "suggestedStyleForCategory:", v7);
  else
    objc_msgSend(v4, "originalStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_pickAssets
{
  void *v3;
  uint64_t v4;

  -[PUWallpaperPosterEditorController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pu_posterType");

  if (v4 == 2)
  {
    -[PUWallpaperPosterEditorController _presentShuffleConfigurationEditor](self, "_presentShuffleConfigurationEditor");
  }
  else if (v4 == 1)
  {
    -[PUWallpaperPosterEditorController _presentPhotoPicker](self, "_presentPhotoPicker");
  }
}

- (void)_presentPosterConfigurationViewController:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  -[PUWallpaperPosterEditorController presentedPosterConfigurationViewController](self, "presentedPosterConfigurationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "should dismiss posterConfiguration ViewController before presenting another one", buf, 2u);
    }

  }
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController setOldPosterConfiguration:](self, "setOldPosterConfiguration:", v7);

  -[PUWallpaperPosterEditorController setPresentedPosterConfigurationViewController:](self, "setPresentedPosterConfigurationViewController:", v4);
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PUWallpaperPosterEditorController editor](self, "editor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentViewController:animated:completion:", v4, 1, 0);

  }
  else
  {
    v10 = (void *)MEMORY[0x1E0DC3F20];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__PUWallpaperPosterEditorController__presentPosterConfigurationViewController___block_invoke;
    v11[3] = &unk_1E58ABCA8;
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v10, "_performWithoutDeferringTransitions:", v11);

  }
}

- (void)_dismissPosterConfigurationViewController
{
  -[PUWallpaperPosterEditorController _dismissPosterConfigurationViewControllerWithCompletion:](self, "_dismissPosterConfigurationViewControllerWithCompletion:", 0);
}

- (void)_dismissPosterConfigurationViewControllerWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  -[PUWallpaperPosterEditorController presentedPosterConfigurationViewController](self, "presentedPosterConfigurationViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUWallpaperPosterEditorController setPresentedPosterConfigurationViewController:](self, "setPresentedPosterConfigurationViewController:", 0);
    -[PUWallpaperPosterEditorController editor](self, "editor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  }
  else if (v6)
  {
    v6[2]();
  }

}

- (void)_dismissPosterConfigurationViewControllerAndCancelEditor
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[PUWallpaperPosterEditorController presentedPosterConfigurationViewController](self, "presentedPosterConfigurationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_ERROR, "Expected presentedPosterConfigurationViewController", v6, 2u);
    }

  }
  -[PUWallpaperPosterEditorController setPresentedPosterConfigurationViewController:](self, "setPresentedPosterConfigurationViewController:", 0);
  -[PUWallpaperPosterEditorController editor](self, "editor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pu_requestDismissalWithAction:", 0);

}

- (void)_presentLoadingErrorAlertController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUWallpaperPosterEditorController presentedPosterConfigurationViewController](self, "presentedPosterConfigurationViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUWallpaperPosterEditorController presentedPosterConfigurationViewController](self, "presentedPosterConfigurationViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_presentOverTopmostPresentedViewController:animated:completion:", v4, 1, 0);
  }
  else
  {
    -[PUWallpaperPosterEditorController editor](self, "editor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v4, 1, 0);
  }

}

- (void)_didDismissLoadingErrorAlert
{
  void *v3;
  id v4;

  -[PUWallpaperPosterEditorController presentedPosterConfigurationViewController](self, "presentedPosterConfigurationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PUWallpaperPosterEditorController editor](self, "editor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pu_requestDismissalWithAction:", 0);

  }
}

- (void)_showLoadingIndicator
{
  void *v3;
  NSObject *v4;
  unint64_t v5;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[8];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  if (!-[PUWallpaperPosterEditorController isLoading](self, "isLoading"))
  {
    -[PUWallpaperPosterEditorController setIsLoading:](self, "setIsLoading:", 1);
    -[PUWallpaperPosterEditorController loadingIndicator](self, "loadingIndicator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PLWallpaperGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = -[PUWallpaperPosterEditorController signpost](self, "signpost");
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PUWallpaperPosterEditorController.Loading", ", buf, 2u);
      }
    }

    -[PUWallpaperPosterEditorController editModel](self, "editModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "performChanges:", &__block_literal_global_286);

    if (!v3)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 101);
      -[PUWallpaperPosterEditorController setLoadingIndicator:](self, "setLoadingIndicator:", v3);
      objc_msgSend(v3, "setOverrideUserInterfaceStyle:", 2);
      objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PUWallpaperPosterEditorController contentOverlayContainerView](self, "contentOverlayContainerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v3);
      -[PUWallpaperPosterEditorController hintLabel](self, "hintLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        -[PUWallpaperPosterEditorController setHint:](self, "setHint:", 1);
      v21 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v3, "centerXAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "centerXAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v11;
      objc_msgSend(v3, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperPosterEditorController hintLabel](self, "hintLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, -8.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v16 = v8;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "activateConstraints:", v17);

    }
    objc_msgSend(v3, "startAnimating");
    if (-[PUWallpaperPosterEditorController isPerformingInitialLoad](self, "isPerformingInitialLoad"))
      v18 = 0.0;
    else
      v18 = 0.3;
    objc_msgSend(v3, "setAlpha:", 0.0);
    v19 = (void *)MEMORY[0x1E0DC3F10];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __58__PUWallpaperPosterEditorController__showLoadingIndicator__block_invoke_2;
    v23[3] = &unk_1E58ABD10;
    v24 = v3;
    v20 = v3;
    objc_msgSend(v19, "animateWithDuration:animations:", v23, v18);

  }
}

- (void)_hideLoadingIndicator
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  os_signpost_id_t v12;
  uint8_t v13[16];
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  if (-[PUWallpaperPosterEditorController isLoading](self, "isLoading"))
  {
    -[PUWallpaperPosterEditorController setIsLoading:](self, "setIsLoading:", 0);
    -[PUWallpaperPosterEditorController loadingIndicator](self, "loadingIndicator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController presentedPosterConfigurationViewController](self, "presentedPosterConfigurationViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v5 = 0.0;
    else
      v5 = 0.3;
    v6 = (void *)MEMORY[0x1E0DC3F10];
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __58__PUWallpaperPosterEditorController__hideLoadingIndicator__block_invoke;
    v16[3] = &unk_1E58ABD10;
    v17 = v3;
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __58__PUWallpaperPosterEditorController__hideLoadingIndicator__block_invoke_2;
    v14[3] = &unk_1E58A9910;
    v15 = v17;
    v8 = v17;
    objc_msgSend(v6, "animateWithDuration:animations:completion:", v16, v14, v5);
    if (-[PUWallpaperPosterEditorController hint](self, "hint") == 1)
      -[PUWallpaperPosterEditorController _displayNextHint](self, "_displayNextHint");
    -[PUWallpaperPosterEditorController editModel](self, "editModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performChanges:", &__block_literal_global_292);

    PLWallpaperGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[PUWallpaperPosterEditorController signpost](self, "signpost");
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)v13 = 0;
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v10, OS_SIGNPOST_INTERVAL_END, v12, "PUWallpaperPosterEditorController.Loading", ", v13, 2u);
      }
    }

  }
}

- (void)_showProgressIndicator:(id)a3 determinate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  PUProgressIndicatorView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[3];

  v4 = a4;
  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PUWallpaperPosterEditorController contentOverlayContainerView](self, "contentOverlayContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController progressIndicator](self, "progressIndicator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = -[PUProgressIndicatorView initWithStyle:]([PUProgressIndicatorView alloc], "initWithStyle:", 0);
    -[PUWallpaperPosterEditorController setProgressIndicator:](self, "setProgressIndicator:", v9);

    -[PUWallpaperPosterEditorController progressIndicator](self, "progressIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLocalizedMessage:", v6);

    -[PUWallpaperPosterEditorController progressIndicator](self, "progressIndicator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDeterminate:", v4);

    -[PUWallpaperPosterEditorController progressIndicator](self, "progressIndicator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShowsBackground:", 1);

    -[PUWallpaperPosterEditorController progressIndicator](self, "progressIndicator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[PUWallpaperPosterEditorController progressIndicator](self, "progressIndicator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "beginShowingProgressImmediately:animated:", 1, 1);

    -[PUWallpaperPosterEditorController progressIndicator](self, "progressIndicator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v15);

    v25 = (void *)MEMORY[0x1E0CB3718];
    -[PUWallpaperPosterEditorController progressIndicator](self, "progressIndicator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "centerXAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerXAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v18;
    -[PUWallpaperPosterEditorController progressIndicator](self, "progressIndicator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v23 = v6;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v24);

    v6 = v23;
  }

}

- (void)_hideProgressIndicator
{
  void *v3;
  _QWORD v4[4];
  id v5;

  -[PUWallpaperPosterEditorController progressIndicator](self, "progressIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController setProgressIndicator:](self, "setProgressIndicator:", 0);
  if (objc_msgSend(v3, "isShowingProgress"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__PUWallpaperPosterEditorController__hideProgressIndicator__block_invoke;
    v4[3] = &unk_1E58ABD10;
    v5 = v3;
    objc_msgSend(v5, "endShowingProgressImmediately:animated:withCompletionHandler:", 1, 1, v4);

  }
}

- (void)_updateProgressIndicator:(double)a3
{
  void *v5;
  double v6;
  double v7;
  id v8;

  -[PUWallpaperPosterEditorController progressIndicator](self, "progressIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentProgress");
  v7 = v6;

  if (v7 < a3)
  {
    -[PUWallpaperPosterEditorController progressIndicator](self, "progressIndicator");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCurrentProgress:", a3);

  }
}

- (void)_presentPhotoPicker
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v3 = objc_alloc(MEMORY[0x1E0CD2168]);
  -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v3, "initWithPhotoLibrary:", v4);

  objc_msgSend(MEMORY[0x1E0CD2170], "imagesFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFilter:", v5);

  objc_msgSend(v28, "setDisabledCapabilities:", 18);
  -[PUWallpaperPosterEditorController environment](self, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "px_isCallServices");

  if ((_DWORD)v4)
    v7 = 12;
  else
    v7 = 4;
  objc_msgSend(v28, "_setDisabledPrivateCapabilities:", v7);
  -[PUWallpaperPosterEditorController environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pu_posterDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterEditorController environment](self, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "px_isCallServices");

  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("preferPhotosSuggestionsForDeviceOwner"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    v17 = (void *)MEMORY[0x1E0CD21F8];
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CD21F8], "deviceOwnerSuggestionGroup");
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  else
  {
    if (v12)
    {

    }
    else if (objc_msgSend(v9, "descriptorType") == 103)
    {
      objc_msgSend(MEMORY[0x1E0CD21F8], "portraitWallpaperSuggestionGroup");
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19 && objc_msgSend(v9, "descriptorType") == 104
      || (-[PUWallpaperPosterEditorController editViewModel](self, "editViewModel"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "settlingEffectEnabled"),
          v20,
          v19,
          v21))
    {
      objc_msgSend(MEMORY[0x1E0CD21F8], "livePhotoWallpaperSuggestionGroup");
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    v17 = (void *)MEMORY[0x1E0CD21F8];
  }
  objc_msgSend(v17, "wallpaperSuggestionGroup");
  v18 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v22 = (void *)v18;
  objc_msgSend(v28, "set_suggestionGroup:", v18);

  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    objc_msgSend(v28, "_setAlwaysShowLoadingPlaceholder:", 1);
  -[PUWallpaperPosterEditorController photoPickerViewController](self, "photoPickerViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v28);
    objc_msgSend(v25, "setDelegate:", self);
    objc_msgSend(v25, "presentationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setDelegate:", self);

    -[PUWallpaperPosterEditorController setPhotoPickerViewController:](self, "setPhotoPickerViewController:", v25);
  }
  -[PUWallpaperPosterEditorController photoPickerViewController](self, "photoPickerViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController _presentPosterConfigurationViewController:](self, "_presentPosterConfigurationViewController:", v27);

  -[PUWallpaperPosterEditorController _beginListeningForExtensionHostResignationNotification](self, "_beginListeningForExtensionHostResignationNotification");
}

- (void)_handlePhotoPickerResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  BOOL v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  id *location;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, void *, void *);
  void *v43;
  id v44;
  id buf[2];
  void *v46;
  void *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController mediaLoadedCompletionHandler](self, "mediaLoadedCompletionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "itemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registeredTypeIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PXPhotosFileProviderTypeIdentifierLiveWallpaperPrivate();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController setShouldLoadSettlingEffectSynchronously:](self, "setShouldLoadSettlingEffectSynchronously:", objc_msgSend(v9, "containsObject:", v10));

  if (-[PUWallpaperPosterEditorController shouldLoadSettlingEffectSynchronously](self, "shouldLoadSettlingEffectSynchronously"))
  {
    PLWallpaperGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_INFO, "Picker result came from Live Photo tab", (uint8_t *)buf, 2u);
    }

  }
  if (v6)
  {
    if (!v7)
    {
      v12 = (void *)MEMORY[0x1E0CD1390];
      v48[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "librarySpecificFetchOptions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fetchAssetsWithLocalIdentifiers:options:", v13, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[PUWallpaperPosterEditorController photoPickerViewController](self, "photoPickerViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_startActivityIndicatorsForAssetsWithIdentifiers:", v19);

        objc_initWeak(buf, self);
        v41 = 3221225472;
        v42 = __63__PUWallpaperPosterEditorController__handlePhotoPickerResults___block_invoke;
        v43 = &unk_1E58A12D0;
        v40 = MEMORY[0x1E0C809B0];
        objc_copyWeak(&v44, buf);
        -[PUWallpaperPosterEditorController setMediaLoadedCompletionHandler:](self, "setMediaLoadedCompletionHandler:", &v40);
        objc_msgSend(v17, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "assetUUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v20, "isEqualToString:", v22);

        if (v23)
        {
          -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel", &v44, v40, v41, v42, v43);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24 == 0;

          if (v25)
            -[PUWallpaperPosterEditorController _loadContentForCurrentPosterMedia](self, "_loadContentForCurrentPosterMedia");
          else
            -[PUWallpaperPosterEditorController _didLoadMediaFromPhotoPickerWithAssetUUID:succeeded:error:](self, "_didLoadMediaFromPhotoPickerWithAssetUUID:succeeded:error:", v20, 1, 0);
        }
        else
        {
          -[PUWallpaperPosterEditorController environment](self, "environment", &v44, v40, v41, v42, v43);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "pu_posterType");

          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D751F0]), "initWithConfigurationType:", objc_msgSend((id)objc_opt_class(), "posterConfigurationTypeForPosterType:", v29));
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75210]), "initWithAssetUUID:", v20);
          v46 = v31;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setMedia:", v32);

          -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUWallpaperPosterEditorController environment](self, "environment");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "px_isCallServices");
          if (v33)
            v36 = v35;
          else
            v36 = 0;

          if (v36)
          {
            objc_msgSend(v30, "setOptions:", objc_msgSend(v33, "options"));
            objc_msgSend(v33, "userInfo");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (void *)objc_msgSend(v37, "copy");
            objc_msgSend(v30, "setUserInfo:", v38);

          }
          -[PUWallpaperPosterEditorController setPosterConfiguration:](self, "setPosterConfiguration:", v30);

        }
        objc_destroyWeak(location);
        objc_destroyWeak(buf);
      }

    }
  }
  else
  {
    -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26 == 0;

    if (v27)
    {
      -[PUWallpaperPosterEditorController _dismissPosterConfigurationViewControllerAndCancelEditor](self, "_dismissPosterConfigurationViewControllerAndCancelEditor");
    }
    else if (v7)
    {
      -[PUWallpaperPosterEditorController setIsCancellingMediaLoading:](self, "setIsCancellingMediaLoading:", 1);
    }
    else
    {
      -[PUWallpaperPosterEditorController _dismissPosterConfigurationViewController](self, "_dismissPosterConfigurationViewController");
    }
  }

}

- (void)_beginListeningForExtensionHostResignationNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__extensionWillResignNotification_, *MEMORY[0x1E0CB2A00], 0);

}

- (void)_stopListeningForExtensionHostResignationNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0, 0);

}

- (void)_extensionWillResignNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  -[PUWallpaperPosterEditorController photoPickerViewController](self, "photoPickerViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    PLWallpaperGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Host extension will resign notification while photos picker is shown. Forwarding to Photos picker.", v7, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("_UIViewServiceHostWillResignActiveNotification"), self);

  }
}

- (void)_didLoadMediaFromPhotoPickerWithAssetUUID:(id)a3 succeeded:(BOOL)a4 error:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PUWallpaperPosterEditorController setMediaLoadedCompletionHandler:](self, "setMediaLoadedCompletionHandler:", 0);
  if (-[PUWallpaperPosterEditorController isCancellingMediaLoading](self, "isCancellingMediaLoading"))
  {
    -[PUWallpaperPosterEditorController oldPosterConfiguration](self, "oldPosterConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController setPosterConfiguration:](self, "setPosterConfiguration:", v8);

  }
  if (a4 || -[PUWallpaperPosterEditorController isCancellingMediaLoading](self, "isCancellingMediaLoading"))
    -[PUWallpaperPosterEditorController _dismissPosterConfigurationViewController](self, "_dismissPosterConfigurationViewController");
  -[PUWallpaperPosterEditorController setIsCancellingMediaLoading:](self, "setIsCancellingMediaLoading:", 0);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CD1390], "localIdentifierWithUUID:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController photoPickerViewController](self, "photoPickerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_stopActivityIndicatorsForAssetsWithIdentifiers:", v11);

    if (!a4)
    {
      -[PUWallpaperPosterEditorController photoPickerViewController](self, "photoPickerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deselectAssetsWithIdentifiers:", v13);

    }
  }

}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  -[PUWallpaperPosterEditorController _handlePhotoPickerResults:](self, "_handlePhotoPickerResults:", a4);
}

- (id)centerSuggestionMedia
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[PUWallpaperPosterEditorController environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pu_posterDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "media");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "count");

    if (v5)
    {
      objc_msgSend(v3, "media");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v5 = v7;
      else
        v5 = 0;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_presentShuffleConfigurationEditor
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *v15;
  void *v16;
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *v17;
  void *v18;
  id v19;

  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shuffleConfiguration");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v19;
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 1600, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shuffleConfiguration"));

      v6 = 0;
    }
    v7 = objc_msgSend(v6, "shuffleType");
    if (v7)
    {
      if (v7 == 2)
      {
        -[PUWallpaperPosterEditorController _presentUserAlbumShuffleEditor](self, "_presentUserAlbumShuffleEditor");
      }
      else if (v7 == 1)
      {
        -[PUWallpaperPosterEditorController _presentManualShuffleAssetEditor](self, "_presentManualShuffleAssetEditor");
      }
    }
    else
    {
      -[PUWallpaperPosterEditorController _presentSmartAlbumShuffleEditor](self, "_presentSmartAlbumShuffleEditor");
    }
  }
  else
  {
    -[PUWallpaperPosterEditorController environment](self, "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pu_posterDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shuffleConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)objc_opt_class();
      -[PUWallpaperPosterEditorController environment](self, "environment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pu_posterDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "posterConfigurationFromPosterDescriptor:", v13);
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = 0;
    }
    -[PUWallpaperPosterEditorController centerSuggestionMedia](self, "centerSuggestionMedia");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController alloc];
    -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PUWallpaperShuffleConfigurationViewController initWithPhotoLibrary:style:posterConfiguration:centerMedia:](v15, "initWithPhotoLibrary:style:posterConfiguration:centerMedia:", v16, 0, v19, v14);

    -[PUWallpaperShuffleConfigurationViewController setDelegate:](v17, "setDelegate:", self);
    -[PUWallpaperPosterEditorController _presentPosterConfigurationViewController:](self, "_presentPosterConfigurationViewController:", v17);

  }
}

- (void)_presentUserAlbumShuffleEditor
{
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *v3;
  void *v4;
  void *v5;
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *v6;

  v3 = [_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController alloc];
  -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUWallpaperShuffleConfigurationViewController initWithPhotoLibrary:style:posterConfiguration:centerMedia:](v3, "initWithPhotoLibrary:style:posterConfiguration:centerMedia:", v4, 2, v5, 0);

  -[PUWallpaperShuffleConfigurationViewController setDelegate:](v6, "setDelegate:", self);
  -[PUWallpaperPosterEditorController _presentPosterConfigurationViewController:](self, "_presentPosterConfigurationViewController:", v6);

}

- (void)_presentSmartAlbumShuffleEditor
{
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *v3;
  void *v4;
  void *v5;
  _TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];

  if (-[PUWallpaperPosterEditorController isAnySmartAlbumAvailable](self, "isAnySmartAlbumAvailable"))
  {
    -[PUWallpaperPosterEditorController centerSuggestionMedia](self, "centerSuggestionMedia");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v3 = [_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController alloc];
    -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUWallpaperShuffleConfigurationViewController initWithPhotoLibrary:style:posterConfiguration:centerMedia:](v3, "initWithPhotoLibrary:style:posterConfiguration:centerMedia:", v4, 1, v5, v14);

    -[PUWallpaperShuffleConfigurationViewController setDelegate:](v6, "setDelegate:", self);
    -[PUWallpaperPosterEditorController _presentPosterConfigurationViewController:](self, "_presentPosterConfigurationViewController:", v6);

  }
  else
  {
    PULocalizedString(CFSTR("PHOTOS_WALLPAPER_SMART_ALBUM_SHUFFLE_CONFIGURATION_UNAVAILABLE_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("PHOTOS_WALLPAPER_SMART_ALBUM_SHUFFLE_CONFIGURATION_UNAVAILABLE_DESCRIPTION"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__PUWallpaperPosterEditorController__presentSmartAlbumShuffleEditor__block_invoke;
    v15[3] = &unk_1E58A8DE8;
    v15[4] = self;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v12);

    -[PUWallpaperPosterEditorController editor](self, "editor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentViewController:animated:completion:", v9, 1, 0);

  }
}

- (void)_updateSmartAlbumAvailability
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(21, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PUWallpaperPosterEditorController__updateSmartAlbumAvailability__block_invoke;
  block[3] = &unk_1E58AB210;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v8, &location);
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_presentManualShuffleAssetEditor
{
  PUWallpaperPosterShuffleGridViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PUWallpaperPosterShuffleGridViewController *v8;

  v3 = [PUWallpaperPosterShuffleGridViewController alloc];
  -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "media");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUWallpaperPosterShuffleGridViewController initWithResourceManager:posterMedia:](v3, "initWithResourceManager:posterMedia:", v4, v6);

  -[PUWallpaperPosterShuffleGridViewController setDelegate:](v8, "setDelegate:", self);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v8);
  objc_msgSend(v7, "setToolbarHidden:", 0);
  -[PUWallpaperPosterEditorController _presentPosterConfigurationViewController:](self, "_presentPosterConfigurationViewController:", v7);

}

- (id)_shuffleFrequencyMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id location;
  _BYTE v32[128];
  _QWORD v33[4];
  _QWORD v34[6];

  v34[4] = *MEMORY[0x1E0C80C00];
  v33[0] = &unk_1E59BB178;
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_SHUFFLE_FREQUENCY_TAP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v3;
  v33[1] = &unk_1E59BB190;
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_SHUFFLE_FREQUENCY_LOCK"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v4;
  v33[2] = &unk_1E59BB1A8;
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_SHUFFLE_FREQUENCY_HOURLY"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v5;
  v33[3] = &unk_1E59BB1C0;
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_SHUFFLE_FREQUENCY_DAILY"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shuffleConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shuffleFrequency");

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = objc_msgSend(&unk_1E59BA0C0, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(&unk_1E59BA0C0);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v15 = (void *)objc_msgSend(v14, "integerValue");
        objc_msgSend(v24, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0DC3428];
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __58__PUWallpaperPosterEditorController__shuffleFrequencyMenu__block_invoke;
        v25[3] = &unk_1E58AB620;
        objc_copyWeak(v26, &location);
        v26[1] = v15;
        objc_msgSend(v17, "actionWithTitle:image:identifier:handler:", v16, 0, 0, v25);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v15 == (void *)v9)
          objc_msgSend(v18, "setState:", 1);
        objc_msgSend(v10, "addObject:", v19);

        objc_destroyWeak(v26);
      }
      v11 = objc_msgSend(&unk_1E59BA0C0, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v11);
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("clock.arrow.circlepath"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_SHUFFLE_CONFIGURATION_FREQUENCY_TITLE"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:image:identifier:options:children:", v21, v20, 0, 33, v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&location);
  return v22;
}

- (void)_rejectSuggestionsForCurrentAsset
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD);
  _QWORD aBlock[4];
  id v21;
  id v22;
  id v23;
  id location;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v3;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_INFO, "User rejected poster media %@", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke;
  aBlock[3] = &unk_1E58AA2E0;
  objc_copyWeak(&v23, &location);
  v7 = v3;
  v21 = v7;
  v8 = v4;
  v22 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10 = (void *)MEMORY[0x1E0CD1390];
  v25 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchAssetsWithUUIDs:options:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0D77EF8];
    v18[0] = v6;
    v18[1] = 3221225472;
    v18[2] = __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke_345;
    v18[3] = &unk_1E58AA6A8;
    v19 = v9;
    objc_msgSend(v16, "rejectWallpaperSuggestionsUsingAsset:completionHandler:", v15, v18);

  }
  else
  {
    PLWallpaperGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v8;
      _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_DEFAULT, "Could not fetch PHAsset with rejected UUID %{public}@, choosing replacement anyway.", buf, 0xCu);
    }

    v9[2](v9);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (void)_reloadSmartAlbumPreviewAssetsWithCompletionHandler:(id)a3
{
  id v4;
  _PUWallpaperSmartAlbumPreviewReloadRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _PUWallpaperSmartAlbumPreviewReloadRequest *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [_PUWallpaperSmartAlbumPreviewReloadRequest alloc];
  -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shuffleConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89__PUWallpaperPosterEditorController__reloadSmartAlbumPreviewAssetsWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E58A1358;
  objc_copyWeak(&v13, &location);
  v9 = v4;
  v12 = v9;
  v10 = -[_PUWallpaperSmartAlbumPreviewReloadRequest initWithPhotoLibrary:shuffleConfiguration:completion:](v5, "initWithPhotoLibrary:shuffleConfiguration:completion:", v6, v8, v11);
  -[PUWallpaperPosterEditorController setSmartAlbumPreviewReloadRequest:](self, "setSmartAlbumPreviewReloadRequest:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)wallpaperShuffleConfigurationViewControllerDidDismiss:(id)a3
{
  void *v4;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[PUWallpaperPosterEditorController _dismissPosterConfigurationViewControllerAndCancelEditor](self, "_dismissPosterConfigurationViewControllerAndCancelEditor");
}

- (void)wallpaperShuffleConfigurationViewController:(id)a3 didFinishWithPosterConfiguration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PUWallpaperPosterEditorController _dismissPosterConfigurationViewController](self, "_dismissPosterConfigurationViewController");
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __114__PUWallpaperPosterEditorController_wallpaperShuffleConfigurationViewController_didFinishWithPosterConfiguration___block_invoke;
    v13[3] = &unk_1E58A1380;
    objc_copyWeak(&v15, &location);
    v14 = v6;
    -[PUWallpaperPosterEditorController setMediaLoadedCompletionHandler:](self, "setMediaLoadedCompletionHandler:", v13);

    objc_destroyWeak(&v15);
  }
  objc_msgSend(v7, "media");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    goto LABEL_7;
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "media");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
    v9 = v7;
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  }
  -[PUWallpaperPosterEditorController setPosterConfiguration:](self, "setPosterConfiguration:", v7);
  objc_destroyWeak(&location);

}

- (void)wallpaperShuffleConfigurationViewControllerDidCancelManuallySelectingPhotos:(id)a3
{
  void *v4;

  -[PUWallpaperPosterEditorController mediaLoadedCompletionHandler](self, "mediaLoadedCompletionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[PUWallpaperPosterEditorController setIsCancellingMediaLoading:](self, "setIsCancellingMediaLoading:", 1);
}

- (void)_didLoadMediaFromShuffleConfigurationViewController:(id)a3 succeeded:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[PUWallpaperPosterEditorController setMediaLoadedCompletionHandler:](self, "setMediaLoadedCompletionHandler:", 0);
  if (-[PUWallpaperPosterEditorController isCancellingMediaLoading](self, "isCancellingMediaLoading"))
  {
    -[PUWallpaperPosterEditorController oldPosterConfiguration](self, "oldPosterConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController setPosterConfiguration:](self, "setPosterConfiguration:", v6);

    -[PUWallpaperPosterEditorController setIsCancellingMediaLoading:](self, "setIsCancellingMediaLoading:", 0);
  }
  else if (v4)
  {
    -[PUWallpaperPosterEditorController _dismissPosterConfigurationViewController](self, "_dismissPosterConfigurationViewController");
  }
  else
  {
    objc_msgSend(v7, "didFailFinishingWithPosterConfiguration");
  }

}

- (void)wallpaperPosterShuffleGridViewController:(id)a3 didFinishWithChange:(id)a4 selectedPosterMedia:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v17 = a4;
  v7 = a5;
  -[PUWallpaperPosterEditorController _dismissPosterConfigurationViewController](self, "_dismissPosterConfigurationViewController");
  if (objc_msgSend(v17, "hasChanges"))
  {
    objc_msgSend(v17, "differenceByTransformingChangesWithBlock:", &__block_literal_global_349);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "media");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByApplyingDifference:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMedia:", v11);

    -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startPreloadingResourcesForPosterMedia:", v11);

    -[PUWallpaperPosterEditorController _loadAssetFromPosterConfiguration](self, "_loadAssetFromPosterConfiguration");
  }
  if (v7)
  {
    -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "media");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __118__PUWallpaperPosterEditorController_wallpaperPosterShuffleGridViewController_didFinishWithChange_selectedPosterMedia___block_invoke_2;
    v18[3] = &unk_1E58A13E8;
    v19 = v7;
    v16 = objc_msgSend(v15, "indexOfObjectPassingTest:", v18);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      -[PUWallpaperPosterEditorController setShuffleAssetIndex:](self, "setShuffleAssetIndex:", v16);

  }
}

- (BOOL)_isShuffle
{
  void *v2;
  BOOL v3;

  -[PUWallpaperPosterEditorController environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pu_posterType") == 2;

  return v3;
}

- (int64_t)_shuffleType
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v8;

  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shuffleConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 1832, CFSTR("Expected shuffle configuration"));

  }
  v6 = objc_msgSend(v5, "shuffleType");

  return v6;
}

- (BOOL)_isSmartShuffle
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
    return 0;
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shuffleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shuffleType") == 0;

  return v5;
}

- (BOOL)_isUserAlbumShuffle
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
    return 0;
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shuffleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shuffleType") == 2;

  return v5;
}

- (BOOL)_isManualShuffle
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
    return 0;
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shuffleConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shuffleType") == 1;

  return v5;
}

- (BOOL)_isShuffleModeWithGlobalDepth
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = -[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle");
  if (v3)
  {
    -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shuffleConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shuffleType");

    LOBYTE(v3) = (v6 & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  return v3;
}

- (void)setShuffleAssetIndex:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  if (self->_shuffleAssetIndex != a3)
  {
    self->_shuffleAssetIndex = a3;
    if (-[PUWallpaperPosterEditorController hint](self, "hint") == 2)
    {
      -[PUWallpaperPosterEditorController cancelPendingHint](self, "cancelPendingHint");
      objc_initWeak(&location, self);
      v4 = MEMORY[0x1E0C809B0];
      v5 = 3221225472;
      v6 = __58__PUWallpaperPosterEditorController_setShuffleAssetIndex___block_invoke;
      v7 = &unk_1E58AB2F8;
      objc_copyWeak(&v8, &location);
      -[PUWallpaperPosterEditorController _hideHintAnimated:completion:](self, "_hideHintAnimated:completion:", 1, &v4);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    -[PUWallpaperPosterEditorController _savePosterEditConfigurationForCurrentPosterMedia](self, "_savePosterEditConfigurationForCurrentPosterMedia", v4, v5, v6, v7);
    -[PUWallpaperPosterEditorController _loadAssetFromPosterConfiguration](self, "_loadAssetFromPosterConfiguration");
  }
}

- (void)_updateShuffleView
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[PUWallpaperPosterEditorController contentOverlayContainerView](self, "contentOverlayContainerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pu_posterType");

  if (v4 == 2)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapToShuffle_);
    objc_msgSend(v6, "addGestureRecognizer:", v5);
    -[PUWallpaperPosterEditorController setTapToShuffleGestureRecognizer:](self, "setTapToShuffleGestureRecognizer:", v5);
  }
  else
  {
    -[PUWallpaperPosterEditorController tapToShuffleGestureRecognizer](self, "tapToShuffleGestureRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeGestureRecognizer:", v5);
  }

}

- (void)_handleTapToShuffle:(id)a3
{
  if (!-[PUWallpaperPosterEditorController isLoading](self, "isLoading", a3))
    -[PUWallpaperPosterEditorController setShuffleAssetIndex:](self, "setShuffleAssetIndex:", -[PUWallpaperPosterEditorController shuffleAssetIndex](self, "shuffleAssetIndex") + 1);
}

- (void)_applyPosterEditConfigurationForShuffleAsset
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "editConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;

    v8 = v6;
  }
  else if (!v8)
  {
    v8 = 0;
    goto LABEL_5;
  }
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyChangesFromPosterEditConfiguration:", v8);

LABEL_5:
}

- (void)_savePosterEditConfigurationForCurrentPosterMedia
{
  void *v3;
  void *v4;
  id v5;

  -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterEditConfigurationRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEditConfiguration:", v4);

}

- (void)_updateShuffleSuggestionFeaturedStateIfNeededForConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  int v27;
  void *v28;
  id v29;
  int v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  os_log_type_t v36;
  PUWallpaperPosterEditorController *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  _BYTE v46[10];
  _QWORD v47[2];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "shuffleConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && !objc_msgSend(v5, "shuffleType"))
  {
    v37 = self;
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "media");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v8);
          v13 = *(id *)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v13, "suggestionUUID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(v13, "suggestionUUID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v15);

            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v10);
    }
    -[PUWallpaperPosterEditorController photoLibrary](v37, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "librarySpecificFetchOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v19;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPredicate:", v22);

    objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    if (v24 != objc_msgSend(v8, "count"))
    {
      PLWallpaperGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = objc_msgSend(v8, "count");
        v27 = objc_msgSend(v23, "count");
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v46 = v26;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v27;
        _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_ERROR, "Shuffle suggestion count mismatch. Expected %d, found %d in library", buf, 0xEu);
      }

    }
    -[PUWallpaperPosterEditorController photoLibrary](v37, "photoLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __99__PUWallpaperPosterEditorController__updateShuffleSuggestionFeaturedStateIfNeededForConfiguration___block_invoke;
    v39[3] = &unk_1E58ABD10;
    v29 = v23;
    v40 = v29;
    v38 = 0;
    v30 = objc_msgSend(v28, "performChangesAndWait:error:", v39, &v38);
    v31 = v38;

    PLWallpaperGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v30)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v46 = v7;
        v34 = "Updated featured state for shuffle wallpaper suggestions %@";
        v35 = v33;
        v36 = OS_LOG_TYPE_INFO;
LABEL_22:
        _os_log_impl(&dword_1AAB61000, v35, v36, v34, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v46 = v31;
      v34 = "Failed updating featured state for shuffle wallpaper suggestions. Error: %@";
      v35 = v33;
      v36 = OS_LOG_TYPE_ERROR;
      goto LABEL_22;
    }

  }
}

- (void)setHint:(unint64_t)a3
{
  unint64_t hint;
  _BOOL8 v5;

  hint = self->_hint;
  if (hint != a3)
  {
    self->_hint = a3;
    v5 = a3 - 3 < 0xFFFFFFFFFFFFFFFELL || hint != 0;
    -[PUWallpaperPosterEditorController _updateHintLabelAnimated:](self, "_updateHintLabelAnimated:", v5);
  }
}

- (void)_updateHintLabelAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[4];
  id v6;
  BOOL v7;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__PUWallpaperPosterEditorController__updateHintLabelAnimated___block_invoke;
  v5[3] = &unk_1E58AA4A0;
  objc_copyWeak(&v6, &location);
  v7 = v3;
  -[PUWallpaperPosterEditorController _hideHintAnimated:completion:](self, "_hideHintAnimated:completion:", v3, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (NSAttributedString)pinchToZoomHintTitle
{
  NSAttributedString *pinchToZoomHintTitle;
  void *v4;
  NSAttributedString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSAttributedString *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  pinchToZoomHintTitle = self->_pinchToZoomHintTitle;
  if (!pinchToZoomHintTitle)
  {
    PULocalizedString(CFSTR("PHOTOS_WALLPAPER_EDITOR_PINCH_TO_CROP"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v4);
    v6 = (void *)MEMORY[0x1E0DC3888];
    -[PUWallpaperPosterEditorController hintLabelFont](self, "hintLabelFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configurationWithFont:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3888];
    -[PUWallpaperPosterEditorController hintLabelTextColor](self, "hintLabelTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationWithPaletteColors:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "configurationByApplyingConfiguration:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("crop"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSAttributedString px_replaceOccurrencesOfString:withTextAttachmentWithImage:](v5, "px_replaceOccurrencesOfString:withTextAttachmentWithImage:", CFSTR("(_SYMBOL_PLACEHOLDER_)"), v14);
    v15 = self->_pinchToZoomHintTitle;
    self->_pinchToZoomHintTitle = v5;

    pinchToZoomHintTitle = self->_pinchToZoomHintTitle;
  }
  return pinchToZoomHintTitle;
}

- (BOOL)_createHintLabelIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterEditorController contentOverlayContainerView](self, "contentOverlayContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUWallpaperPosterEditorController hintLabel](self, "hintLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = objc_alloc(MEMORY[0x1E0DC3990]);
      v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PUWallpaperPosterEditorController hintLabelFont](self, "hintLabelFont");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFont:", v7);

      objc_msgSend(v6, "setTextAlignment:", 1);
      objc_msgSend(v6, "setNumberOfLines:", 0);
      -[PUWallpaperPosterEditorController hintLabelTextColor](self, "hintLabelTextColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTextColor:", v8);

      objc_msgSend(v3, "addSubview:", v6);
      v18 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v6, "widthAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "widthAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v20;
      objc_msgSend(v6, "centerXAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "centerXAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v10;
      objc_msgSend(v3, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUWallpaperPosterEditorController editor](self, "editor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pu_editingChromeDodgingInsets");
      objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, v14 + 40.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[2] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "activateConstraints:", v16);

      objc_msgSend(v6, "setAlpha:", 0.0);
      -[PUWallpaperPosterEditorController setHintLabel:](self, "setHintLabel:", v6);

    }
  }

  return v3 != 0;
}

- (id)hintLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0DC4A90], *MEMORY[0x1E0DC1448]);
}

- (id)hintLabelTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (void)_hideHintAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  double v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD v12[5];

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  -[PUWallpaperPosterEditorController hintLabel](self, "hintLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v4)
      v8 = 0.3;
    else
      v8 = 0.0;
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__PUWallpaperPosterEditorController__hideHintAnimated_completion___block_invoke;
    v12[3] = &unk_1E58ABD10;
    v12[4] = self;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__PUWallpaperPosterEditorController__hideHintAnimated_completion___block_invoke_2;
    v10[3] = &unk_1E58AA518;
    v11 = v6;
    objc_msgSend(v9, "animateWithDuration:animations:completion:", v12, v10, v8);

  }
  else if (v6)
  {
    v6[2](v6);
  }

}

- (void)_showHintAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  double v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  v7 = a4;
  if (-[PUWallpaperPosterEditorController hint](self, "hint")
    && -[PUWallpaperPosterEditorController _createHintLabelIfNeeded](self, "_createHintLabelIfNeeded"))
  {
    -[PUWallpaperPosterEditorController hintLabel](self, "hintLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 2059, CFSTR("expected hintLabel"));

    }
    v9 = 0.0;
    objc_msgSend(v8, "setAlpha:", 0.0);
    switch(-[PUWallpaperPosterEditorController hint](self, "hint"))
    {
      case 0uLL:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 2075, CFSTR("Code which should be unreachable has been reached"));

        abort();
      case 1uLL:
        v10 = CFSTR("PHOTOS_WALLPAPER_LOADING_PROGRESS_INDICATOR_TITLE");
        goto LABEL_8;
      case 2uLL:
        v10 = CFSTR("PHOTOS_WALLPAPER_EDITOR_TAP_TO_SHUFFLE");
LABEL_8:
        PULocalizedString(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setText:", v11);
        goto LABEL_14;
      case 3uLL:
        -[PUWallpaperPosterEditorController pinchToZoomHintTitle](self, "pinchToZoomHintTitle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAttributedText:", v11);
        goto LABEL_14;
      case 4uLL:
        -[PUWallpaperPosterEditorController environment](self, "environment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "px_isCallServices"))
          v12 = CFSTR("PHOTOS_WALLPAPER_EDITOR_POSTER_EXTENDED");
        else
          v12 = CFSTR("PHOTOS_WALLPAPER_EDITOR_WALLPAPER_EXTENDED");
        PULocalizedString(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setText:", v13);

LABEL_14:
        break;
      default:
        break;
    }
    if (v4)
      v9 = 0.3;
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __66__PUWallpaperPosterEditorController__showHintAnimated_completion___block_invoke;
    v20[3] = &unk_1E58ABD10;
    v21 = v8;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __66__PUWallpaperPosterEditorController__showHintAnimated_completion___block_invoke_2;
    v18[3] = &unk_1E58AA518;
    v19 = v7;
    v15 = v8;
    objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 4, v20, v18, v9, 0.0);

  }
}

- (unint64_t)_defaultHint
{
  if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
    return 2;
  if (-[PUWallpaperPosterEditorController isUserTransformDisabled](self, "isUserTransformDisabled"))
    return 0;
  return 3;
}

- (void)_displayDefaultHint
{
  unint64_t v3;

  -[PUWallpaperPosterEditorController cancelPendingHint](self, "cancelPendingHint");
  v3 = -[PUWallpaperPosterEditorController _defaultHint](self, "_defaultHint");
  if ((!-[PUWallpaperPosterEditorController hint](self, "hint")
     || -[PUWallpaperPosterEditorController hint](self, "hint") == 1)
    && v3 == 3)
  {
    if (-[PUWallpaperPosterEditorController hint](self, "hint") == 1)
      -[PUWallpaperPosterEditorController setHint:](self, "setHint:", 0);
  }
  else
  {
    -[PUWallpaperPosterEditorController setHint:](self, "setHint:", v3);
    if (-[PUWallpaperPosterEditorController hint](self, "hint") != 2)
      return;
  }
  -[PUWallpaperPosterEditorController displayNextHintAfterDelay](self, "displayNextHintAfterDelay");
}

- (void)_displayNextHint
{
  unint64_t v3;
  void *v4;
  char v5;

  -[PUWallpaperPosterEditorController cancelPendingHint](self, "cancelPendingHint");
  v3 = -[PUWallpaperPosterEditorController hint](self, "hint");
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "settlingEffectEnabled");

  if ((v5 & 1) != 0)
  {
    v3 = 0;
  }
  else if (v3 < 2)
  {
    v3 = -[PUWallpaperPosterEditorController _defaultHint](self, "_defaultHint");
  }
  else if (v3 - 3 >= 2)
  {
    if (v3 == 2)
    {
      if (-[PUWallpaperPosterEditorController isUserTransformDisabled](self, "isUserTransformDisabled"))
        v3 = 2;
      else
        v3 = 3;
    }
  }
  else if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
  {
    -[PUWallpaperPosterEditorController displayNextHintAfterDelay](self, "displayNextHintAfterDelay");
    v3 = 2;
  }
  else
  {
    v3 = 3;
  }
  -[PUWallpaperPosterEditorController setHint:](self, "setHint:", v3);
}

- (void)displayNextHintAfterDelay
{
  -[PUWallpaperPosterEditorController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__displayNextHint, 0, 4.0);
}

- (void)cancelPendingHint
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__displayNextHint, 0);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  char v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  dispatch_time_t v28;
  id *v29;
  NSObject *v30;
  _QWORD *v31;
  void *v32;
  char v33;
  void *v34;
  int v35;
  unint64_t v36;
  void *v37;
  char v38;
  void *v39;
  objc_class *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  objc_class *v47;
  void *v48;
  _QWORD block[4];
  id v50;
  _QWORD v51[4];
  id v52;
  id location;

  v6 = a4;
  v9 = a3;
  v10 = v9;
  if (a5 == "EditModelObservationContext")
  {
    if ((v6 & 1) != 0)
    {
      -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentLayerStackViewModel");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "showsDebugHUD"))
        -[PUWallpaperPosterEditorController _updateLayerStackViewModelProperties:](self, "_updateLayerStackViewModelProperties:", v11);
      goto LABEL_75;
    }
    goto LABEL_76;
  }
  if (a5 == "LayerStackViewModelObservationContext")
  {
    v13 = v9;
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_15:
        v14 = objc_msgSend(v13, "currentLayerStackPropertiesChange");
        v15 = objc_msgSend(v13, "stylePropertiesChange");
        if ((v6 & 2) != 0)
        {
          -[PUWallpaperPosterEditorController _updateLayerStackViewModelProperties:](self, "_updateLayerStackViewModelProperties:", v13);
          -[PUWallpaperPosterEditorController _updateContentOverlayContainerView](self, "_updateContentOverlayContainerView");
          -[PUWallpaperPosterEditorController _updateUserTransformView](self, "_updateUserTransformView");
          -[PUWallpaperPosterEditorController _updateEditToolbar](self, "_updateEditToolbar");
        }
        if (v14 & 0x15 | *(_QWORD *)&v6 & 0x81000)
        {
          -[PUWallpaperPosterEditorController _updateLayerStackViewModelProperties:](self, "_updateLayerStackViewModelProperties:", v13);
          -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
          v16 = (id)objc_claimAutoreleasedReturnValue();

          if (v16 == v13)
            -[PUWallpaperPosterEditorController _updateEditToolbar](self, "_updateEditToolbar");
        }
        if (v15 & 0xB | (unint64_t)(v6 & 0x100) | v14 & 8)
        {
          -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
          v17 = (id)objc_claimAutoreleasedReturnValue();

          if (v17 == v13)
            -[PUWallpaperPosterEditorController _updateEditToolbar](self, "_updateEditToolbar");
        }
        if ((v15 & 0xE) != 0)
        {
          -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
          v18 = (id)objc_claimAutoreleasedReturnValue();

          if (v18 == v13)
            -[PUWallpaperPosterEditorController _updateCurrentStyle](self, "_updateCurrentStyle");
        }
        if ((v14 & 8) != 0)
        {
          -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
          v19 = (id)objc_claimAutoreleasedReturnValue();

          if (v19 == v13)
            -[PUWallpaperPosterEditorController _displayNextHint](self, "_displayNextHint");
        }
        if ((v14 & 2) != 0)
        {
          -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
          v20 = (id)objc_claimAutoreleasedReturnValue();

          if (v20 == v13)
          {
            objc_msgSend(v13, "currentLayerStack");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "settlingEffectLayer");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              objc_msgSend(v13, "currentLayerStack");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "settlingEffectEnabled");

              if (v27)
                -[PUWallpaperPosterEditorController _startSettlingEffectPreviewAfterDelay](self, "_startSettlingEffectPreviewAfterDelay");
            }
          }
        }

        goto LABEL_76;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (objc_class *)objc_opt_class();
      NSStringFromClass(v42);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_descriptionForAssertionMessage");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 2168, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("observable"), v41, v43);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 2168, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("observable"), v41);
    }

    goto LABEL_15;
  }
  if (a5 == "EditViewModelObservationContext")
  {
    if ((v6 & 1) != 0)
    {
      -[PUWallpaperPosterEditorController _updateCurrentLayerStackViewModel](self, "_updateCurrentLayerStackViewModel");
      -[PUWallpaperPosterEditorController _updateCurrentStyle](self, "_updateCurrentStyle");
    }
    if ((v6 & 2) == 0)
    {
LABEL_48:
      if ((v6 & 4) != 0)
        -[PUWallpaperPosterEditorController _updateVisibleLayerStackViewModels](self, "_updateVisibleLayerStackViewModels");
      if ((v6 & 0x200) != 0)
      {
        -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "stylesChange");

        if ((v33 & 2) != 0)
        {
          -[PUWallpaperPosterEditorController editor](self, "editor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "pu_updateLooks");
          goto LABEL_57;
        }
        if ((v33 & 1) != 0)
          -[PUWallpaperPosterEditorController _updateCurrentStyle](self, "_updateCurrentStyle");
        if ((v33 & 4) != 0)
        {
          -[PUWallpaperPosterEditorController editor](self, "editor");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "pu_updateLuminanceValuesForLooks");
LABEL_57:

        }
      }
      if ((v6 & 0x20) != 0)
      {
        -[PUWallpaperPosterEditorController _updateParallaxEnabled](self, "_updateParallaxEnabled");
        if ((v6 & 0x100) == 0)
        {
LABEL_60:
          if ((v6 & 0x10000) == 0)
            goto LABEL_61;
          goto LABEL_65;
        }
      }
      else if ((v6 & 0x100) == 0)
      {
        goto LABEL_60;
      }
      -[PUWallpaperPosterEditorController _updateStyleDividerView](self, "_updateStyleDividerView");
      if ((v6 & 0x10000) == 0)
      {
LABEL_61:
        if ((v6 & 0x1000) == 0)
          goto LABEL_76;
        goto LABEL_66;
      }
LABEL_65:
      -[PUWallpaperPosterEditorController _updateEditToolbar](self, "_updateEditToolbar");
      -[PUWallpaperPosterEditorController _showTrySettlingEffectTip](self, "_showTrySettlingEffectTip");
      if ((v6 & 0x1000) == 0)
        goto LABEL_76;
LABEL_66:
      -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v11, "isUsingHeadroom");
      v36 = -[PUWallpaperPosterEditorController hint](self, "hint");
      if (v35)
      {
        if (v36 == 4)
          -[PUWallpaperPosterEditorController _showHintAnimated:completion:](self, "_showHintAnimated:completion:", 1, 0);
        else
          -[PUWallpaperPosterEditorController setHint:](self, "setHint:", 4);
      }
      else if (v36 == 4)
      {
        -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isUserPanningOrZooming");

        if ((v38 & 1) != 0)
          -[PUWallpaperPosterEditorController _hideHintAnimated:completion:](self, "_hideHintAnimated:completion:", 1, 0);
        else
          -[PUWallpaperPosterEditorController _displayNextHint](self, "_displayNextHint");
      }
      -[PUWallpaperPosterEditorController _updateEditToolbar](self, "_updateEditToolbar");
      goto LABEL_75;
    }
    -[PUWallpaperPosterEditorController _updateParallaxIsPaused](self, "_updateParallaxIsPaused");
    -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isUserPanningOrZooming");

    v23 = -[PUWallpaperPosterEditorController hint](self, "hint");
    if ((v22 & 1) != 0)
    {
      if (v23 == 3)
        -[PUWallpaperPosterEditorController _hideHintAnimated:completion:](self, "_hideHintAnimated:completion:", 1, 0);
      goto LABEL_48;
    }
    if (v23 == 4)
    {
      -[PUWallpaperPosterEditorController cancelPendingHint](self, "cancelPendingHint");
      objc_initWeak(&location, self);
      v28 = dispatch_time(0, 2000000000);
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __66__PUWallpaperPosterEditorController_observable_didChange_context___block_invoke;
      v51[3] = &unk_1E58AB2F8;
      v29 = &v52;
      objc_copyWeak(&v52, &location);
      v30 = MEMORY[0x1E0C80D38];
      v31 = v51;
    }
    else
    {
      if (-[PUWallpaperPosterEditorController hint](self, "hint") != 3)
      {
        -[PUWallpaperPosterEditorController _displayNextHint](self, "_displayNextHint");
        goto LABEL_47;
      }
      objc_initWeak(&location, self);
      v28 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__PUWallpaperPosterEditorController_observable_didChange_context___block_invoke_2;
      block[3] = &unk_1E58AB2F8;
      v29 = &v50;
      objc_copyWeak(&v50, &location);
      v30 = MEMORY[0x1E0C80D38];
      v31 = block;
    }
    dispatch_after(v28, v30, v31);
    objc_destroyWeak(v29);
    objc_destroyWeak(&location);
LABEL_47:
    -[PUWallpaperPosterEditorController _updateParallaxEnabled](self, "_updateParallaxEnabled");
    -[PUWallpaperPosterEditorController _updateEditToolbar](self, "_updateEditToolbar");
    goto LABEL_48;
  }
  if (a5 == "AnimateScrollToStyleKindAnimatorObservationContext" && (v6 & 2) != 0)
  {
    v11 = v9;
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_8;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (objc_class *)objc_opt_class();
      NSStringFromClass(v47);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "px_descriptionForAssertionMessage");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 2295, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("observable"), v46, v48);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 2295, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("observable"), v46);
    }

LABEL_8:
    if ((objc_msgSend(v11, "isBeingMutated") & 1) == 0)
      -[PUWallpaperPosterEditorController _animateScrollToStyleKindAnimatorUpdated](self, "_animateScrollToStyleKindAnimatorUpdated");
LABEL_75:

  }
LABEL_76:

}

- (void)_setupUserTransformView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  PUUserTransformView *v9;
  id v10;

  -[PUWallpaperPosterEditorController userTransformView](self, "userTransformView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUWallpaperPosterEditorController userTransformView](self, "userTransformView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[PUWallpaperPosterEditorController setUserTransformView:](self, "setUserTransformView:", 0);
  }
  -[PUWallpaperPosterEditorController contentOverlayContainerView](self, "contentOverlayContainerView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  PXRectWithOriginAndSize();
  v9 = -[PUUserTransformView initWithFrame:]([PUUserTransformView alloc], "initWithFrame:", v5, v6, v7, v8);
  -[PUUserTransformView setDelegate:](v9, "setDelegate:", self);
  -[PUUserTransformView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
  objc_msgSend(v10, "addSubview:", v9);
  -[PUWallpaperPosterEditorController setUserTransformView:](self, "setUserTransformView:", v9);

}

- (void)_updateUserTransformView
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  void *v34;
  double v35;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  _OWORD v46[3];
  _OWORD v47[3];
  CGRect v48;

  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PUWallpaperPosterEditorController contentOverlayContainerView](self, "contentOverlayContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v43 = v6;
    v44 = v7;
    v45 = v8;
    v10 = v9;
    objc_msgSend(v4, "contentRect");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v4, "visibleFrame");
    v20 = v19;
    v42 = v21;
    v23 = v22;
    v25 = v24;
    v48.origin.x = v12;
    v48.origin.y = v14;
    v48.size.width = v16;
    v48.size.height = v18;
    if (CGRectIsEmpty(v48))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 2330, CFSTR("Layout rect must be valid"));

    }
    v26 = v12 - v20;
    v27 = 0.0;
    v28 = 0.0;
    if (v23 != 0.0)
    {
      v26 = v26 / v23;
      v28 = v16 / v23;
    }
    v29 = v14 - v42;
    if (v25 != 0.0)
    {
      v29 = v29 / v25;
      v27 = v18 / v25;
    }
    v30 = v43 + v26 * v44;
    v31 = v45 + v29 * v10;
    v32 = v44 * v28;
    v33 = v10 * v27;
    -[PUWallpaperPosterEditorController userTransformView](self, "userTransformView", *(_QWORD *)&v42);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setContentPixelSize:", v16, v18);
    v35 = 0.0;
    if ((v16 != -1.79769313e308 || v18 != -1.79769313e308)
      && (v16 != *MEMORY[0x1E0C9D820] || v18 != *(double *)(MEMORY[0x1E0C9D820] + 8)))
    {
      v35 = v16 / v18;
    }
    PURectWithAspectRatioFillingRect(v35, v43, v45, v44, v10);
    v38 = v37;
    v40 = v39;
    objc_msgSend(v34, "setUntransformedContentFrame:", 0.0, 0.0);
    PUAffineTransformToMatchRect((uint64_t)v47, 0.0, 0.0, v38, v40, v30, v31, v32, v33);
    v46[0] = v47[0];
    v46[1] = v47[1];
    v46[2] = v47[2];
    objc_msgSend(v34, "setUserAffineTransform:", v46);
    objc_msgSend(v34, "setRequireTwoTouchesForPan:", 1);

  }
}

- (void)_updateUserTransformIsDisabled
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "configurationType");

  if (v4 == 1)
  {
    -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shuffleConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "shuffleType") != 1;
  }
  else
  {
    v7 = 0;
  }
  -[PUWallpaperPosterEditorController setIsUserTransformDisabled:](self, "setIsUserTransformDisabled:", v7);
}

- (void)setIsUserTransformDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_isUserTransformDisabled != a3)
  {
    self->_isUserTransformDisabled = a3;
    v3 = !a3;
    -[PUWallpaperPosterEditorController userTransformView](self, "userTransformView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInteractionEnabled:", v3);

  }
}

- (void)userTransformView:(id)a3 didChangeUserAffineTransform:(CGAffineTransform *)a4 isUserInteracting:(BOOL)a5
{
  id v6;
  double v7;
  double v8;
  double v9;
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
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
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
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  _QWORD v44[8];

  if (a5)
  {
    v6 = a3;
    objc_msgSend(v6, "visibleRect");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "untransformedContentFrame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v23 = v8 - v16;
    v24 = 0.0;
    v25 = 0.0;
    if (v20 != 0.0)
    {
      v23 = v23 / v20;
      v25 = v12 / v20;
    }
    v26 = v10 - v18;
    if (v22 != 0.0)
    {
      v26 = v26 / v22;
      v24 = v14 / v22;
    }
    v43 = v24;
    -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contentRect");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    objc_msgSend(v27, "imageSize");
    v38 = v29 + v23 * v33;
    v39 = 0.0;
    v40 = 0.0;
    if (v36 != 0.0)
    {
      v38 = v38 / v36;
      v40 = v25 * v33 / v36;
    }
    v41 = v31 + v26 * v35;
    if (v37 != 0.0)
    {
      v41 = v41 / v37;
      v39 = v43 * v35 / v37;
    }
    -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __102__PUWallpaperPosterEditorController_userTransformView_didChangeUserAffineTransform_isUserInteracting___block_invoke;
    v44[3] = &__block_descriptor_64_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8l;
    *(double *)&v44[4] = v38;
    *(double *)&v44[5] = v41;
    *(double *)&v44[6] = v40;
    *(double *)&v44[7] = v39;
    objc_msgSend(v42, "performChanges:", v44);

  }
}

- (void)userTransformView:(id)a3 didChangeIsUserInteracting:(BOOL)a4
{
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__PUWallpaperPosterEditorController_userTransformView_didChangeIsUserInteracting___block_invoke;
  v6[3] = &__block_descriptor_33_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8l;
  v7 = a4;
  objc_msgSend(v5, "performChanges:", v6);

}

- (BOOL)_isParallaxAllowed
{
  return 0;
}

- (id)_perspectiveZoomAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  objc_initWeak(&location, self);
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_PERSPECTIVE_ZOOM_MENU_ITEM_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("perspective"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __59__PUWallpaperPosterEditorController__perspectiveZoomAction__block_invoke;
  v16 = &unk_1E58AB5D0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v4, "actionWithTitle:image:identifier:handler:", v3, v5, 0, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel", v13, v14, v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEnoughRoomForParallax");

  if (v8)
  {
    -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "parallaxDisabled") ^ 1;

    v11 = 0;
  }
  else
  {
    v10 = 0;
    v11 = 1;
  }
  objc_msgSend(v6, "setState:", v10);
  objc_msgSend(v6, "setAttributes:", v11);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
  return v6;
}

- (void)_togglePerspectiveZoom
{
  id v2;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performChanges:", &__block_literal_global_408);

}

- (BOOL)_shouldEnableParallax
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  if (!-[PUWallpaperPosterEditorController _isParallaxAllowed](self, "_isParallaxAllowed"))
    return 0;
  if (-[PUWallpaperPosterEditorController isPausingParallax](self, "isPausingParallax"))
    return 0;
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "parallaxDisabled");

  if ((v4 & 1) != 0)
    return 0;
  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canApplyParallax");

  return v7;
}

- (void)_updateParallaxEnabled
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v3 = -[PUWallpaperPosterEditorController _shouldEnableParallax](self, "_shouldEnableParallax");
  -[PUWallpaperPosterEditorController editor](self, "editor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPerspectiveZoomEnabled:", v3);

  -[PUWallpaperPosterEditorController editor](self, "editor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pu_canApplyParallaxToViews");

  if ((v6 & 1) == 0)
  {
    -[PUWallpaperPosterEditorController parallaxSimulationView](self, "parallaxSimulationView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v3)
      objc_msgSend(v7, "startParallax");
    else
      objc_msgSend(v7, "stopParallax");

  }
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isUserPanningOrZooming");

  if ((v10 & 1) == 0)
    -[PUWallpaperPosterEditorController _updateEditToolbar](self, "_updateEditToolbar");
}

- (BOOL)_isDepthEnabled
{
  void *v3;
  char v4;
  BOOL v5;

  if (-[PUWallpaperPosterEditorController _isShuffleModeWithGlobalDepth](self, "_isShuffleModeWithGlobalDepth"))
  {
    -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "depthEnabledForAllMedia");
  }
  else
  {
    -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "depthEnabled");
  }
  v5 = v4;

  return v5;
}

- (void)_toggleDepth
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  char v7;

  if (-[PUWallpaperPosterEditorController _isShuffleModeWithGlobalDepth](self, "_isShuffleModeWithGlobalDepth"))
  {
    v3 = -[PUWallpaperPosterEditorController _isDepthEnabled](self, "_isDepthEnabled") ^ 1;
    -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDepthEnabledForAllMedia:", v3);

    -[PUWallpaperPosterEditorController _updateEditToolbar](self, "_updateEditToolbar");
  }
  else
  {
    -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v3) = objc_msgSend(v5, "depthEnabled") ^ 1;

  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PUWallpaperPosterEditorController__toggleDepth__block_invoke;
  v6[3] = &unk_1E58AAD68;
  v6[4] = self;
  v7 = v3;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v6, 0.2);
}

- (BOOL)_isDepthEffectPossible
{
  void *v3;
  char v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;

  objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "forceEnableSegmentation");

  if ((v4 & 1) == 0)
  {
    v5 = PFPosterDeviceSupportsSegmentation();
    if (!v5)
      return v5;
    objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "disableSegmentation");

    if ((v7 & 1) != 0)
    {
LABEL_8:
      LOBYTE(v5) = 0;
      return v5;
    }
  }
  if (!-[PUWallpaperPosterEditorController _isShuffleModeWithGlobalDepth](self, "_isShuffleModeWithGlobalDepth"))
  {
    -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "settlingEffectEnabled");

    if ((v9 & 1) == 0)
    {
      -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasMatte");

      LOBYTE(v5) = v11;
      return v5;
    }
    goto LABEL_8;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)_canEnableDepthEffect
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  -[PUWallpaperPosterEditorController editor](self, "editor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pu_isDepthEffectDisallowed");

  if ((v4 & 1) != 0)
    return 0;
  if (-[PUWallpaperPosterEditorController _isShuffleModeWithGlobalDepth](self, "_isShuffleModeWithGlobalDepth"))
    return 1;
  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canEnableDepthEffect");

  return v7;
}

- (void)_toggleHeadroom
{
  void *v3;
  char v4;
  void *v5;
  _QWORD v6[4];
  char v7;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUsingHeadroom");

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PUWallpaperPosterEditorController__toggleHeadroom__block_invoke;
  v6[3] = &__block_descriptor_33_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8l;
  v7 = v4;
  objc_msgSend(v5, "performChanges:", v6);

  -[PUWallpaperPosterEditorController _updateUserTransformView](self, "_updateUserTransformView");
}

- (void)_updateParallaxIsPaused
{
  id v3;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController setIsPausingParallax:](self, "setIsPausingParallax:", objc_msgSend(v3, "isUserPanningOrZooming"));

}

- (void)setIsPausingParallax:(BOOL)a3
{
  if (self->_isPausingParallax != a3)
  {
    self->_isPausingParallax = a3;
    -[PUWallpaperPosterEditorController _updateParallaxEnabled](self, "_updateParallaxEnabled");
  }
}

- (void)_startSimulatingParallax
{
  void *v3;
  void *v4;
  PUWallpaperPosterParallaxView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  PUWallpaperPosterParallaxView *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, double, double);
  void *v19;
  id v20;
  id location;

  -[PUWallpaperPosterEditorController parallaxSimulationView](self, "parallaxSimulationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PUWallpaperPosterEditorController contentOverlayContainerView](self, "contentOverlayContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v5 = [PUWallpaperPosterParallaxView alloc];
    objc_msgSend(v4, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __61__PUWallpaperPosterEditorController__startSimulatingParallax__block_invoke;
    v19 = &unk_1E58A1450;
    objc_copyWeak(&v20, &location);
    v14 = -[PUWallpaperPosterParallaxView initWithFrame:parallaxHandler:](v5, "initWithFrame:parallaxHandler:", &v16, v7, v9, v11, v13);
    -[PUWallpaperPosterParallaxView setAutoresizingMask:](v14, "setAutoresizingMask:", 18, v16, v17, v18, v19);
    objc_msgSend(v4, "addSubview:", v14);
    -[PUWallpaperPosterParallaxView setUserInteractionEnabled:](v14, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterParallaxView setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[PUWallpaperPosterEditorController setParallaxSimulationView:](self, "setParallaxSimulationView:", v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

- (void)_stopSimulatingParallax
{
  id v3;

  -[PUWallpaperPosterEditorController parallaxSimulationView](self, "parallaxSimulationView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUWallpaperPosterEditorController setParallaxSimulationView:](self, "setParallaxSimulationView:", 0);
    objc_msgSend(v3, "stopParallax");
    objc_msgSend(v3, "removeFromSuperview");
  }

}

- (void)_renderAfterStyleChange
{
  void *v3;
  void *v4;
  id v5;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLayerStackViewModelUpdater");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderOnscreenModelAfterStyleChange:", v4);

}

- (BOOL)_currentStyleSupportsHighAndLowKeyModes
{
  void *v2;
  void *v3;
  char v4;

  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasTonalityMode");

  return v4;
}

- (BOOL)_currentStyleIsHighKey
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hasTonalityMode"))
    v4 = objc_msgSend(v3, "tonality") == 3;
  else
    v4 = 0;

  return v4;
}

- (void)_setCurrentStyleIsHighKey:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = a3;
  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasTonalityMode"))
  {
    v7 = (void *)MEMORY[0x1E0D71248];
    objc_msgSend(v6, "bakedStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "styleWithBakedStyle:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      v10 = 3;
    else
      v10 = 1;
    objc_msgSend(v9, "setTonality:", v10);
    -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__PUWallpaperPosterEditorController__setCurrentStyleIsHighKey___block_invoke;
    v13[3] = &unk_1E58AB148;
    v14 = v9;
    v12 = v9;
    objc_msgSend(v11, "performChanges:", v13);

    -[PUWallpaperPosterEditorController _renderAfterStyleChange](self, "_renderAfterStyleChange");
  }

}

- (BOOL)_currentStyleSupportsColorPicker
{
  void *v2;
  void *v3;
  char v4;

  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasColorParameter");

  return v4;
}

- (void)_presentStyleColorPicker
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id location;
  _QWORD v66[6];
  _QWORD v67[6];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[5];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v59, "kind");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_alloc_init((Class)getPREditorColorPickerConfigurationClass());
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v61);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v62;
  objc_msgSend(v62, "setIdentifier:", v6);

  v8 = *MEMORY[0x1E0D755C8];
  if ((objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755C8]) & 1) != 0
    || (objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755E0]) & 1) != 0
    || (objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755F8]) & 1) != 0
    || objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755F0]))
  {
    objc_msgSend(v59, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("PHOTOS_WALLPAPER_EDITOR_BACKGROUND_COLOR_PICKER_PROMPT");
LABEL_6:
    v11 = 1;
    goto LABEL_7;
  }
  if (objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755D8]))
  {
    objc_msgSend(v59, "color");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755D0]))
    {
      if (!objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755E8]))
        goto LABEL_42;
      objc_msgSend(v59, "color");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("PHOTOS_WALLPAPER_EDITOR_STYLE_COLOR_PICKER_PROMPT");
      goto LABEL_6;
    }
    objc_msgSend(v59, "primaryColor");
    v51 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v51;
  v11 = 0;
  v10 = CFSTR("PHOTOS_WALLPAPER_EDITOR_STYLE_COLOR_PICKER_PROMPT");
LABEL_7:
  objc_msgSend(v62, "setShowsSlider:", v11);
  PULocalizedString(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setPrompt:", v12);

  objc_msgSend(v9, "pu_UIColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setSelectedColor:", v13);

  objc_msgSend(MEMORY[0x1E0D71248], "colorPaletteWithStyleKind:", v61);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "primaryColors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((unint64_t)objc_msgSend(v14, "count") >= 0xD)
  {
    objc_msgSend(v14, "subarrayWithRange:", 0, 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = objc_msgSend(v62, "showsSlider");
  v17 = MEMORY[0x1E0C809B0];
  v57 = v15;
  if (!v16)
  {
    PXMap();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(objc_alloc((Class)getPREditorColorPaletteClass()), "initWithColors:localizedName:showsColorWell:", v31, 0, 0);
    v33 = v62;
    objc_msgSend(v62, "setColorPalette:", v32);

    goto LABEL_37;
  }
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v61, "isEqualToString:", v8))
  {
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v19 = v15;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v74 != v21)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_msgSend(v23, "pu_toneVariation");
          v25 = v24;
          objc_msgSend(v23, "hue");
          v27 = v26;
          objc_msgSend(v9, "hue");
          if (PXFloatEqualToFloatWithTolerance())
          {
            objc_msgSend(v9, "pu_toneVariation");
            v25 = v28;
          }
          v29 = objc_alloc((Class)getPREditorColorPickerCustomColorClass());
          v72[0] = v17;
          v72[1] = 3221225472;
          v72[2] = __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke;
          v72[3] = &__block_descriptor_40_e17___UIColor_16__0d8l;
          v72[4] = v27;
          v30 = (void *)objc_msgSend(v29, "initWithDefaultInitialVariation:colorProvider:", v72, v25);
          objc_msgSend(v18, "addObject:", v30);

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
      }
      while (v20);
    }
  }
  else if ((objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755E0]) & 1) != 0
         || (objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755F8]) & 1) != 0
         || objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755F0]))
  {
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v19 = v15;
    v34 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v69 != v35)
            objc_enumerationMutation(v19);
          v37 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          objc_msgSend(v37, "pu_lumaVariation");
          v39 = v38;
          objc_msgSend(v37, "hue");
          v41 = v40;
          objc_msgSend(v37, "chroma");
          v43 = v42;
          objc_msgSend(v9, "hue");
          if (PXFloatEqualToFloatWithTolerance())
          {
            objc_msgSend(v9, "chroma");
            if (PXFloatEqualToFloatWithTolerance())
            {
              objc_msgSend(v9, "pu_lumaVariation");
              v39 = v44;
            }
          }
          v45 = objc_alloc((Class)getPREditorColorPickerCustomColorClass());
          v67[0] = v17;
          v67[1] = 3221225472;
          v67[2] = __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_2;
          v67[3] = &__block_descriptor_48_e17___UIColor_16__0d8l;
          v67[4] = v41;
          v67[5] = v43;
          v46 = (void *)objc_msgSend(v45, "initWithDefaultInitialVariation:colorProvider:", v67, v39);
          objc_msgSend(v18, "addObject:", v46);

        }
        v34 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v77, 16);
      }
      while (v34);
    }
  }
  else
  {
    if (!objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755E8]))
      goto LABEL_36;
    objc_msgSend(v9, "hue");
    v53 = v52;
    objc_msgSend(v9, "chroma");
    v55 = v54;
    objc_msgSend(v9, "pu_lumaVariation");
    v66[0] = v17;
    v66[1] = 3221225472;
    v66[2] = __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_3;
    v66[3] = &__block_descriptor_48_e17___UIColor_16__0d8l;
    v66[4] = v53;
    v66[5] = v55;
    v19 = (id)objc_msgSend(objc_alloc((Class)getPREditorColorPickerCustomColorClass()), "initWithDefaultInitialVariation:colorProvider:", v66, v56);
    objc_msgSend(v18, "addObject:", v19);
  }

LABEL_36:
  v47 = (void *)objc_msgSend(objc_alloc((Class)getPREditorColorPaletteClass()), "initWithPickerColors:localizedName:", v18, 0);
  objc_msgSend(v62, "setColorPalette:", v47);

  v33 = v62;
LABEL_37:
  objc_msgSend(v33, "setColorWellDisplayMode:", 0);
  if ((objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755E0]) & 1) != 0
    || (objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755F8]) & 1) != 0
    || objc_msgSend(v61, "isEqualToString:", *MEMORY[0x1E0D755F0]))
  {
    objc_msgSend(v62, "setColorWellDisplayMode:", 2);
  }
  -[PUWallpaperPosterEditorController editor](self, "editor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "pu_viewForMenuElementIdentifier:", CFSTR("PUPosterEditorActionIdentifierColorPicker"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v62, "setColorPickerSourceItem:", v49);
  objc_initWeak(&location, self);
  -[PUWallpaperPosterEditorController editor](self, "editor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v17;
  v63[1] = 3221225472;
  v63[2] = __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_5;
  v63[3] = &unk_1E58A14F8;
  objc_copyWeak(&v64, &location);
  objc_msgSend(v50, "presentColorPickerWithConfiguration:changeHandler:", v62, v63);

  objc_destroyWeak(&v64);
  objc_destroyWeak(&location);

  v7 = v62;
LABEL_42:

}

- (void)_updateCurrentStyleColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  void *v29;
  _QWORD v30[4];
  void *v31;

  v4 = a3;
  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "style");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "kind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D75170], "pu_parallaxColorWithUIColor:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D755C8]))
  {
    v9 = (void *)MEMORY[0x1E0D71248];
    objc_msgSend(v6, "bakedStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "styleWithBakedStyle:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setColor:", v8);
    -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __62__PUWallpaperPosterEditorController__updateCurrentStyleColor___block_invoke;
    v30[3] = &unk_1E58AB148;
    v31 = v11;
    v13 = v11;
    objc_msgSend(v12, "performChanges:", v30);

    v14 = v31;
  }
  else if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D755D8]) & 1) != 0
         || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D755E0]) & 1) != 0
         || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D755F8]) & 1) != 0
         || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D755E8]) & 1) != 0
         || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D755F0]))
  {
    v15 = (void *)MEMORY[0x1E0D71248];
    objc_msgSend(v6, "bakedStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "styleWithBakedStyle:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "setColor:", v8);
    -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __62__PUWallpaperPosterEditorController__updateCurrentStyleColor___block_invoke_2;
    v28[3] = &unk_1E58AB148;
    v29 = v17;
    v13 = v17;
    objc_msgSend(v18, "performChanges:", v28);

    v14 = v29;
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D755D0]))
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0D71248], "colorPaletteWithStyleKind:", v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "suggestionAtIndex:", objc_msgSend(v13, "indexOfColor:", v8));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0D71248];
    objc_msgSend(v6, "bakedStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "styleWithBakedStyle:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "primaryColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setPrimaryColor:", v22);

    objc_msgSend(v14, "secondaryColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSecondaryColor:", v23);

    -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __62__PUWallpaperPosterEditorController__updateCurrentStyleColor___block_invoke_3;
    v26[3] = &unk_1E58AB148;
    v27 = v21;
    v25 = v21;
    objc_msgSend(v24, "performChanges:", v26);

  }
LABEL_10:
  -[PUWallpaperPosterEditorController _renderAfterStyleChange](self, "_renderAfterStyleChange");

}

- (void)_updateEditToolbar
{
  void *v3;
  char v4;
  id v5;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUserPanningOrZooming");

  if ((v4 & 1) == 0)
  {
    -[PUWallpaperPosterEditorController editor](self, "editor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateActions");

  }
}

- (id)_photoPickerAction
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;

  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "configurationType");
  if (v4 == 1)
  {
    -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "shuffleConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v13, "shuffleType");

    if (v5 == 2)
    {
      LOBYTE(v5) = 0;
      v6 = CFSTR("rectangle.stack.fill");
    }
    else if (v5 == 1)
    {
      LOBYTE(v5) = 0;
      v6 = CFSTR("rectangle.grid.3x2.fill");
    }
    else if (v5)
    {
      v6 = 0;
      LOBYTE(v5) = 1;
    }
    else
    {
      v6 = CFSTR("sparkles.rectangle.stack.fill");
    }
  }
  else
  {
    LOBYTE(v5) = v4 != 0;
    if (v4)
      v6 = 0;
    else
      v6 = CFSTR("photo.on.rectangle");
  }
  v7 = 0;
  if ((objc_msgSend(v3, "options") & 0x13) == 0 && (v5 & 1) == 0)
  {
    PULocalizedString(CFSTR("PHOTOS_WALLPAPER_EDITOR_PICK_A_PHOTO_BUTTON_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __55__PUWallpaperPosterEditorController__photoPickerAction__block_invoke;
    v17 = &unk_1E58AB5D0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v8, v10, CFSTR("PUPosterEditorActionIdentifierPhotoPicker"), &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setAccessibilityLabel:", v8, v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);

  }
  return v7;
}

- (id)_toggleSettlingEffectAction
{
  void *v3;
  id v4;
  void *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  if (!-[PUWallpaperPosterEditorController _attemptedSettlingEffect](self, "_attemptedSettlingEffect"))
    return 0;
  PULocalizedString(CFSTR("PHOTOS_WALLPAPER_EDITOR_TOGGLE_LIVE_PHOTO_BUTTON_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUWallpaperPosterEditorController loadingSettlingEffect](self, "loadingSettlingEffect"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3870]);
  }
  else
  {
    -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "settlingEffectEnabled");

    if (v7)
      v8 = CFSTR("livephoto.play");
    else
      v8 = CFSTR("livephoto.slash");
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v8);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v4;
  objc_initWeak(&location, self);
  v10 = (void *)MEMORY[0x1E0DC3428];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__PUWallpaperPosterEditorController__toggleSettlingEffectAction__block_invoke;
  v12[3] = &unk_1E58AB5D0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v3, v9, CFSTR("PUPosterEditorActionIdentifierSettlingEffect"), v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v11;
}

- (id)_colorPickerAction
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;
  _QWORD v20[5];
  __int128 v21;

  if (-[PUWallpaperPosterEditorController _currentStyleSupportsColorPicker](self, "_currentStyleSupportsColorPicker"))
  {
    -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "color");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "CGColor");

      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", 35.0, 35.0);
      v8 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __55__PUWallpaperPosterEditorController__colorPickerAction__block_invoke;
      v20[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
      v20[4] = v6;
      v21 = xmmword_1AB0EF320;
      objc_msgSend(v7, "imageWithActions:", v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "kind");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("PHOTOS_WALLPAPER_EDITOR_STYLE_COLOR_MENU_TITLE");
      if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D755D8]) & 1) == 0
        && !objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D755D0]))
      {
        v11 = CFSTR("PHOTOS_WALLPAPER_EDITOR_BACKGROUND_COLOR_MENU_TITLE");
      }
      v12 = v11;
      objc_initWeak(&location, self);
      v13 = (void *)MEMORY[0x1E0DC3428];
      PULocalizedString(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __55__PUWallpaperPosterEditorController__colorPickerAction__block_invoke_2;
      v17[3] = &unk_1E58AB5D0;
      objc_copyWeak(&v18, &location);
      objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v14, v9, CFSTR("PUPosterEditorActionIdentifierColorPicker"), v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)_toggleHighKeyLowKeyAction
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  BOOL v15;
  id location;
  _QWORD v17[4];
  int64x2_t v18;
  uint64_t v19;
  BOOL v20;

  if (-[PUWallpaperPosterEditorController _currentStyleSupportsHighAndLowKeyModes](self, "_currentStyleSupportsHighAndLowKeyModes"))
  {
    v3 = -[PUWallpaperPosterEditorController _currentStyleIsHighKey](self, "_currentStyleIsHighKey");
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", 33.5, 33.5);
    v5 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__PUWallpaperPosterEditorController__toggleHighKeyLowKeyAction__block_invoke;
    v17[3] = &__block_descriptor_57_e40_v16__0__UIGraphicsImageRendererContext_8l;
    v18 = vdupq_n_s64(0x4040C00000000000uLL);
    v19 = 0x403B800000000000;
    v20 = v3;
    objc_msgSend(v4, "imageWithActions:", v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("PHOTOS_WALLPAPER_EDITOR_HIGH_KEY_MENU_TITLE");
    if (v3)
      v7 = CFSTR("PHOTOS_WALLPAPER_EDITOR_LOW_KEY_MENU_TITLE");
    v8 = v7;
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0DC3428];
    PULocalizedString(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __63__PUWallpaperPosterEditorController__toggleHighKeyLowKeyAction__block_invoke_2;
    v13[3] = &unk_1E58AB5F8;
    objc_copyWeak(&v14, &location);
    v15 = v3;
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v6, 0, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)_actionsMenu
{
  unint64_t v3;
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id *v68;
  id *v69;
  void *v70;
  void *v71;
  _QWORD v72[5];
  _QWORD v73[4];
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD aBlock[5];
  _QWORD v83[4];
  id v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  id location[2];

  objc_initWeak(location, self);
  v3 = 0x1E0C99000uLL;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = -[PUWallpaperPosterEditorController _currentStyleSupportsToggleBackground](self, "_currentStyleSupportsToggleBackground");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0DC3428];
    PULocalizedString(CFSTR("PHOTOS_WALLPAPER_EDITOR_STYLE_BACKGROUND_MENU_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("person.and.background.dotted"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v89[0] = v6;
    v89[1] = 3221225472;
    v89[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke;
    v89[3] = &unk_1E58AB5D0;
    objc_copyWeak(&v90, location);
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v8, v9, 0, v89);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setState:", -[PUWallpaperPosterEditorController _currentStyleShowsBackground](self, "_currentStyleShowsBackground") ^ 1);
    objc_msgSend(v4, "addObject:", v10);

    objc_destroyWeak(&v90);
  }
  if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
  {
    -[PUWallpaperPosterEditorController _shuffleFrequencyMenu](self, "_shuffleFrequencyMenu");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
  if (-[PUWallpaperPosterEditorController _isDepthEffectPossible](self, "_isDepthEffectPossible"))
  {
    v12 = (void *)MEMORY[0x1E0DC3428];
    PULocalizedString(CFSTR("PHOTOS_WALLPAPER_DEPTH_MENU_ITEM_TITLE"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.2.stack.3d"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v6;
    v87[1] = 3221225472;
    v87[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_2;
    v87[3] = &unk_1E58AB5D0;
    objc_copyWeak(&v88, location);
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v13, v14, 0, v87);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[PUWallpaperPosterEditorController _canEnableDepthEffect](self, "_canEnableDepthEffect"))
    {
      objc_msgSend(v15, "setState:", -[PUWallpaperPosterEditorController _isDepthEnabled](self, "_isDepthEnabled"));
    }
    else
    {
      objc_msgSend(v15, "setState:", 0);
      objc_msgSend(v15, "setAttributes:", 1);
    }
    objc_msgSend(v4, "addObject:", v15);

    objc_destroyWeak(&v88);
  }
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (PFPosterEnableHeadroom()
    && objc_msgSend(v16, "canApplyHeadroom")
    && (!-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle")
     || -[PUWallpaperPosterEditorController _isManualShuffle](self, "_isManualShuffle")))
  {
    -[PUWallpaperPosterEditorController environment](self, "environment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "px_isCallServices"))
      v18 = CFSTR("PHOTOS_WALLPAPER_EXTEND_POSTER_MENU_ITEM_TITLE");
    else
      v18 = CFSTR("PHOTOS_WALLPAPER_EXTEND_WALLPAPER_MENU_ITEM_TITLE");
    PULocalizedString(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.expand.vertical"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v6;
    v85[1] = 3221225472;
    v85[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_3;
    v85[3] = &unk_1E58AB5D0;
    objc_copyWeak(&v86, location);
    objc_msgSend(v20, "actionWithTitle:image:identifier:handler:", v19, v21, 0, v85);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setState:", objc_msgSend(v16, "isUsingHeadroom"));
    if ((objc_msgSend(v16, "isUsingHeadroom") & 1) == 0
      && (objc_msgSend(v16, "headroomLayoutUsesHeadroomArea") & 1) == 0)
    {
      objc_msgSend(v22, "setAttributes:", 1);
    }
    objc_msgSend(v4, "addObject:", v22);

    objc_destroyWeak(&v86);
    v3 = 0x1E0C99000;
  }
  if (-[PUWallpaperPosterEditorController _isParallaxAllowed](self, "_isParallaxAllowed"))
  {
    -[PUWallpaperPosterEditorController _perspectiveZoomAction](self, "_perspectiveZoomAction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v23);

  }
  -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "shuffleConfiguration");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    if (!objc_msgSend(v25, "shuffleType"))
    {
      -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v27 = v25;
        v28 = (void *)MEMORY[0x1E0DC3428];
        PULocalizedString(CFSTR("PHOTOS_WALLPAPER_DONT_FEATURE_PHOTO_MENU_ITEM_TITLE"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark.circle"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v83[0] = v6;
        v83[1] = 3221225472;
        v83[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_4;
        v83[3] = &unk_1E58AB5D0;
        objc_copyWeak(&v84, location);
        objc_msgSend(v28, "actionWithTitle:image:identifier:handler:", v29, v30, 0, v83);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "setAttributes:", 2);
        objc_msgSend(v4, "addObject:", v31);

        objc_destroyWeak(&v84);
        v25 = v27;
      }
    }
  }
  -[PUWallpaperPosterEditorController environment](self, "environment");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "pu_sourcePosterConfiguration");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = v25;
  if (v33)
  {
    v34 = objc_msgSend(v33, "options") & 1;
    v35 = ((unint64_t)objc_msgSend(v33, "options") >> 5) & 1;
  }
  else
  {
    v34 = 0;
    LOBYTE(v35) = 0;
  }
  aBlock[0] = v6;
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_5;
  aBlock[3] = &unk_1E58AB498;
  aBlock[4] = self;
  v36 = _Block_copy(aBlock);
  v37 = v36;
  if ((v34 & 1) == 0 && (v35 & 1) == 0 && (*((unsigned int (**)(void *))v36 + 2))(v36))
  {
    v38 = v16;
    v39 = v6;
    v40 = (void *)MEMORY[0x1E0DC3428];
    PULocalizedString(CFSTR("PHOTOS_WALLPAPER_SHOW_PHOTO_IN_LIBRARY_MENU_ITEM_TITLE"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("photo.on.rectangle"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v39;
    v80[1] = 3221225472;
    v80[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_6;
    v80[3] = &unk_1E58AB5D0;
    objc_copyWeak(&v81, location);
    objc_msgSend(v40, "actionWithTitle:image:identifier:handler:", v41, v42, 0, v80);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v43);
    objc_destroyWeak(&v81);
    v6 = v39;
    v16 = v38;
    v3 = 0x1E0C99000uLL;
  }
  v44 = 0x1E0DC3000;
  if (MEMORY[0x1AF429AFC]())
  {
    v70 = v16;
    v45 = v6;
    v46 = objc_alloc_init(*(Class *)(v3 + 3560));
    v47 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ant.fill"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v45;
    v78[1] = 3221225472;
    v78[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_7;
    v78[3] = &unk_1E58AB5D0;
    v68 = &v79;
    objc_copyWeak(&v79, location);
    objc_msgSend(v47, "actionWithTitle:image:identifier:handler:", CFSTR("Wallpaper Feedback"), v48, 0, v78);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObject:", v49);

    v50 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ant.fill"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v45;
    v76[1] = 3221225472;
    v76[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_8;
    v76[3] = &unk_1E58AB5D0;
    objc_copyWeak(&v77, location);
    objc_msgSend(v50, "actionWithTitle:image:identifier:handler:", CFSTR("Tap to Radar"), v51, 0, v76);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObject:", v52);

    if (PFPosterEnableSettlingEffect())
    {
      -[PUWallpaperPosterEditorController environment](self, "environment", &v79);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "px_isCallServices");

      if ((v54 & 1) == 0)
      {
        v55 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("livephoto"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v73[0] = v45;
        v73[1] = 3221225472;
        v73[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_9;
        v73[3] = &unk_1E58A9FA8;
        v74 = v70;
        objc_copyWeak(&v75, location);
        objc_msgSend(v55, "actionWithTitle:image:identifier:handler:", CFSTR("Settling Effect Debug"), v56, 0, v73);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObject:", v57);

        objc_destroyWeak(&v75);
      }
    }
    if (PXPreferencesGetBool())
    {
      v58 = (void *)MEMORY[0x1E0DC3428];
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("gear"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = v45;
      v72[1] = 3221225472;
      v72[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_10;
      v72[3] = &unk_1E58A6930;
      v72[4] = self;
      objc_msgSend(v58, "actionWithTitle:image:identifier:handler:", CFSTR("Show Internal Settings"), v59, 0, v72);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObject:", v60);

    }
    v44 = 0x1E0DC3000uLL;
    v61 = (void *)MEMORY[0x1E0DC39D0];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("gear"), v68);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "menuWithTitle:image:identifier:options:children:", CFSTR("Internal"), v62, 0, 0, v46);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v63);
    objc_destroyWeak(&v77);
    objc_destroyWeak(v69);

    v16 = v70;
  }
  if (objc_msgSend(v4, "count"))
  {
    v64 = *(void **)(v44 + 2512);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis.circle.fill"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "menuWithTitle:image:identifier:options:children:", &stru_1E58AD278, v65, CFSTR("PUPosterEditorActionIdentifierMenu"), 0, v4);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v66 = 0;
  }

  objc_destroyWeak(location);
  return v66;
}

- (void)_showPhotoInLibrary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("photos://contentmode?id=photos&assetuuid=%@&oneUp=1"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D22D88];
  v17[0] = *MEMORY[0x1E0D22DA8];
  v17[1] = v7;
  v18[0] = MEMORY[0x1E0C9AAB0];
  v18[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = objc_msgSend(v6, "openSensitiveURL:withOptions:error:", v5, v8, &v12);
  v10 = v12;

  if ((v9 & 1) == 0)
  {
    PLWallpaperGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v5;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "Failed to navigate to URL: %@ with error: %@", buf, 0x16u);
    }

  }
}

- (BOOL)_currentStyleSupportsToggleBackground
{
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "segmentationItem");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)v4, "supportsBackgroundlessStyles");

  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "hasBackgroundParameter");

  return v5 & v4;
}

- (BOOL)_currentStyleShowsBackground
{
  void *v2;
  void *v3;
  char v4;

  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hasBackgroundParameter"))
    v4 = objc_msgSend(v3, "showsBackground");
  else
    v4 = 1;

  return v4;
}

- (void)_toggleStyleBackground
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasBackgroundParameter"))
  {
    v5 = objc_msgSend(v4, "showsBackground");
    v6 = (void *)MEMORY[0x1E0D71248];
    objc_msgSend(v4, "bakedStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "styleWithBakedStyle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setShowsBackground:", v5 ^ 1u);
    -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__PUWallpaperPosterEditorController__toggleStyleBackground__block_invoke;
    v11[3] = &unk_1E58AB148;
    v12 = v8;
    v10 = v8;
    objc_msgSend(v9, "performChanges:", v11);

    -[PUWallpaperPosterEditorController _renderAfterStyleChange](self, "_renderAfterStyleChange");
  }

}

- (void)_startSettlingEffectPreviewAfterDelay
{
  void *v3;
  char v4;
  id v5;

  -[PUWallpaperPosterEditorController settlingEffectPreviewDelayTimer](self, "settlingEffectPreviewDelayTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__startSettlingEffectPreview, 0, 0, 0.2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController setSettlingEffectPreviewDelayTimer:](self, "setSettlingEffectPreviewDelayTimer:", v5);

  }
}

- (void)_startSettlingEffectPreview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;

  -[PUWallpaperPosterEditorController backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentLayerStack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "settlingEffectEnabled"))
    {
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(v6, "foregroundLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewForLayer:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "videoLayerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (-[PUWallpaperPosterEditorController isPreviewingSettlingEffect](self, "isPreviewingSettlingEffect"))
      {
LABEL_9:

        goto LABEL_10;
      }
      -[PUWallpaperPosterEditorController setPreviewingSettlingEffect:](self, "setPreviewingSettlingEffect:", 1);
      -[PUWallpaperPosterEditorController settlingEffectPreviewDelayTimer](self, "settlingEffectPreviewDelayTimer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "invalidate");

      objc_msgSend(v9, "setAlpha:", 0.0);
      objc_msgSend(v3, "addSubview:", v9);
      -[PUWallpaperPosterEditorController settlingEffectPreviewAnimator](self, "settlingEffectPreviewAnimator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stopAnimation:", 1);

      v12 = objc_alloc(MEMORY[0x1E0DC3F38]);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __64__PUWallpaperPosterEditorController__startSettlingEffectPreview__block_invoke;
      v19[3] = &unk_1E58ABCA8;
      v20 = v8;
      v13 = v9;
      v21 = v13;
      v14 = (void *)objc_msgSend(v12, "initWithDuration:curve:animations:", 0, v19, 0.5);
      objc_msgSend(v14, "startAnimation");
      -[PUWallpaperPosterEditorController setSettlingEffectPreviewAnimator:](self, "setSettlingEffectPreviewAnimator:", v14);
      -[PUWallpaperPosterEditorController _observeCurrentPlayerItem](self, "_observeCurrentPlayerItem");
      objc_msgSend(v13, "player");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *MEMORY[0x1E0CA2E68];
      v18 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      objc_msgSend(v15, "seekToTime:", &v17);
      objc_msgSend(v15, "play");

      v16 = v20;
    }
    else
    {
      PLWallpaperGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "Failed to preview settling effect because the video layer view is nil.", (uint8_t *)&v17, 2u);
      }
    }

    goto LABEL_9;
  }
LABEL_11:

}

- (void)_stopSettlingEffectPreview
{
  -[PUWallpaperPosterEditorController _stopSettlingEffectPreview:](self, "_stopSettlingEffectPreview:", 0);
}

- (void)_stopSettlingEffectPreview:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  PUWallpaperPosterEditorController *v23;
  void (**v24)(_QWORD);
  _QWORD v25[4];
  id v26;
  id v27;

  v4 = (void (**)(_QWORD))a3;
  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentLayerStack");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "foregroundLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewForLayer:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "videoLayerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUWallpaperPosterEditorController isPreviewingSettlingEffect](self, "isPreviewingSettlingEffect"))
  {
    -[PUWallpaperPosterEditorController setPreviewingSettlingEffect:](self, "setPreviewingSettlingEffect:", 0);
    -[PUWallpaperPosterEditorController settlingEffectPreviewDelayTimer](self, "settlingEffectPreviewDelayTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    objc_msgSend(v11, "pause");
    -[PUWallpaperPosterEditorController settlingEffectPreviewAnimator](self, "settlingEffectPreviewAnimator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stopAnimation:", 1);

    v14 = objc_alloc(MEMORY[0x1E0DC3F38]);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __64__PUWallpaperPosterEditorController__stopSettlingEffectPreview___block_invoke;
    v25[3] = &unk_1E58ABCA8;
    v26 = v9;
    v15 = v10;
    v27 = v15;
    v16 = (void *)objc_msgSend(v14, "initWithDuration:curve:animations:", 0, v25, 0.5);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __64__PUWallpaperPosterEditorController__stopSettlingEffectPreview___block_invoke_2;
    v20 = &unk_1E58A1560;
    v21 = v11;
    v22 = v15;
    v23 = self;
    v24 = v4;
    objc_msgSend(v16, "addCompletion:", &v17);
    objc_msgSend(v16, "startAnimation", v17, v18, v19, v20);
    -[PUWallpaperPosterEditorController setSettlingEffectPreviewAnimator:](self, "setSettlingEffectPreviewAnimator:", v16);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

- (void)_updateSettlingEffectEnabled
{
  id v2;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityIsReduceMotionEnabled() && objc_msgSend(v2, "settlingEffectEnabled"))
    objc_msgSend(v2, "performChanges:", &__block_literal_global_513);

}

- (void)_playerItemDidFinish:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PUWallpaperPosterEditorController__playerItemDidFinish___block_invoke;
  block[3] = &unk_1E58ABD10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_observeCurrentPlayerItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;

  -[PUWallpaperPosterEditorController observedPlayerItem](self, "observedPlayerItem");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoLayerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v7)
  {
    v8 = (_QWORD *)MEMORY[0x1E0C8AC48];
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:name:object:", self, *v8, v11);

      objc_msgSend(v11, "removeObserver:forKeyPath:context:", self, CFSTR("status"), &PlayerItemObservationContext);
    }
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__playerItemDidFinish_, *v8, v7);

      objc_msgSend(v7, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 0, &PlayerItemObservationContext);
    }
    -[PUWallpaperPosterEditorController setObservedPlayerItem:](self, "setObservedPlayerItem:", v7);
  }

}

- (void)_stopObservingPlayerItem
{
  void *v3;
  id v4;

  -[PUWallpaperPosterEditorController observedPlayerItem](self, "observedPlayerItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AC48], v4);

    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("status"), &PlayerItemObservationContext);
    -[PUWallpaperPosterEditorController setObservedPlayerItem:](self, "setObservedPlayerItem:", 0);
  }

}

- (BOOL)_attemptedSettlingEffect
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle")
    || (-[PUWallpaperPosterEditorController environment](self, "environment"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "px_isCallServices"),
        v3,
        (v4 & 1) != 0)
    || !PFPosterEnableSettlingEffect()
    || !objc_msgSend(MEMORY[0x1E0D71298], "currentDeviceSupportsSettlingEffect"))
  {
    LOBYTE(v13) = 0;
  }
  else
  {
    -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "assetUUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v5, "librarySpecificFetchOptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setIncludeGuestAssets:", 1);
        v9 = (void *)MEMORY[0x1E0CD1390];
        v15[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "fetchAssetsWithUUIDs:options:", v10, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = ((unint64_t)objc_msgSend(v12, "mediaSubtypes") >> 3) & 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }

  }
  return v13;
}

- (void)_toggleSettlingEffectEnabled
{
  void *v3;
  int v4;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "settlingEffectEnabled");

  if (v4)
    -[PUWallpaperPosterEditorController _disableSettlingEffect](self, "_disableSettlingEffect");
  else
    -[PUWallpaperPosterEditorController _enableSettlingEffect](self, "_enableSettlingEffect");
}

- (void)_showSettlingEffectUnavailableTip
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUWallpaperPosterEditorController loadingSettlingEffect](self, "loadingSettlingEffect")
    || (objc_msgSend(v3, "settlingEffectEnabled") & 1) != 0
    || (objc_msgSend(v3, "originalLayerStackViewModel"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "canEnableSettlingEffect"),
        v4,
        v5))
  {
    PLWallpaperGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (-[PUWallpaperPosterEditorController loadingSettlingEffect](self, "loadingSettlingEffect"))
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      if (objc_msgSend(v3, "settlingEffectEnabled"))
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      objc_msgSend(v3, "originalLayerStackViewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      if (objc_msgSend(v9, "canEnableSettlingEffect"))
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Cannot show settling effect unavailable tip; loading: %@ settling enabled: %@ can enable settling: %@",
        (uint8_t *)&v11,
        0x20u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7BC20], "presentFailedSettlingEffectTip:", self);
  }

}

- (void)_showTrySettlingEffectTip
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[PUWallpaperPosterEditorController loadingSettlingEffect](self, "loadingSettlingEffect")
    && (objc_msgSend(v3, "settlingEffectEnabled") & 1) == 0)
  {
    objc_msgSend(v3, "originalLayerStackViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "canEnableSettlingEffect") & 1) != 0)
    {
      objc_msgSend(v3, "segmentationItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "settlingEffectHasInterestingMotion");

      if ((v6 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0D7BC20], "presentTrySettlingEffectTip:", self);
        goto LABEL_22;
      }
    }
    else
    {

    }
  }
  PLWallpaperGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    if (-[PUWallpaperPosterEditorController loadingSettlingEffect](self, "loadingSettlingEffect"))
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    if (objc_msgSend(v3, "settlingEffectEnabled"))
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    objc_msgSend(v3, "originalLayerStackViewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "canEnableSettlingEffect"))
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    objc_msgSend(v3, "segmentationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413058;
    if (objc_msgSend(v12, "settlingEffectHasInterestingMotion"))
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Cannot show try settling effect tip; loading: %@ settling enabled: %@ can enable settling: %@ interesting motion: %@",
      (uint8_t *)&v14,
      0x2Au);

  }
LABEL_22:

}

- (void)_disableSettlingEffect
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id location;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if ((objc_msgSend(v3, "settlingEffectEnabled") & 1) != 0
    && !-[PUWallpaperPosterEditorController settlingEffectToggleInProgress](self, "settlingEffectToggleInProgress"))
  {
    -[PUWallpaperPosterEditorController setSettlingEffectToggleInProgress:](self, "setSettlingEffectToggleInProgress:", 1);
    objc_msgSend(v3, "performChanges:", &__block_literal_global_519);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke_2;
    v4[3] = &unk_1E58AB210;
    objc_copyWeak(&v6, &location);
    v5 = v3;
    -[PUWallpaperPosterEditorController _stopSettlingEffectPreview:](self, "_stopSettlingEffectPreview:", v4);

    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&location);

}

- (void)_enableSettlingEffect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _QWORD aBlock[4];
  id v21;
  id v22;
  id location;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if ((objc_msgSend(v3, "settlingEffectEnabled") & 1) == 0)
  {
    -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originalLayerStackViewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canEnableSettlingEffect");

    if ((v7 & 1) != 0)
    {
      if (!-[PUWallpaperPosterEditorController settlingEffectToggleInProgress](self, "settlingEffectToggleInProgress"))
      {
        -[PUWallpaperPosterEditorController setSettlingEffectToggleInProgress:](self, "setSettlingEffectToggleInProgress:", 1);
        v8 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke;
        aBlock[3] = &unk_1E58AB210;
        v9 = v3;
        v21 = v9;
        objc_copyWeak(&v22, &location);
        v10 = (void (**)(_QWORD))_Block_copy(aBlock);
        objc_msgSend(v4, "style");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "kind");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v8;
        v16 = 3221225472;
        v17 = __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_6;
        v18 = &unk_1E58A10B8;
        v13 = v12;
        v19 = v13;
        objc_msgSend(v9, "performChanges:", &v15);
        v14 = *MEMORY[0x1E0D75600];
        if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D75600], v15, v16, v17, v18) & 1) != 0)
          v10[2](v10);
        else
          -[PUWallpaperPosterEditorController _animateScrollToStyleKind:completion:](self, "_animateScrollToStyleKind:completion:", v14, v10);

        objc_destroyWeak(&v22);
      }
    }
    else
    {
      -[PUWallpaperPosterEditorController _showSettlingEffectUnavailableTip](self, "_showSettlingEffectUnavailableTip");
    }
  }
  objc_destroyWeak(&location);

}

- (void)_animateScrollToStyleKind:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[PUWallpaperPosterEditorController currentLayerStackViewModel](self, "currentLayerStackViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "kind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController setAnimateScrollToStyleKindStartingKind:](self, "setAnimateScrollToStyleKindStartingKind:", v10);

  -[PUWallpaperPosterEditorController setAnimateScrollToStyleKindEndingKind:](self, "setAnimateScrollToStyleKindEndingKind:", v7);
  -[PUWallpaperPosterEditorController setAnimateScrollToStyleKindCompletion:](self, "setAnimateScrollToStyleKindCompletion:", v6);

  -[PUWallpaperPosterEditorController animateScrollToStyleKindAnimator](self, "animateScrollToStyleKindAnimator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7CD50]), "initWithValue:", 0.0);
    objc_msgSend(v12, "registerChangeObserver:context:", self, "AnimateScrollToStyleKindAnimatorObservationContext");
    objc_msgSend(v12, "setLabel:", CFSTR("AnimateScrollToStyleKindAnimator"));
    objc_msgSend(v12, "setHighFrameRateReason:", 2228225);
    -[PUWallpaperPosterEditorController setAnimateScrollToStyleKindAnimator:](self, "setAnimateScrollToStyleKindAnimator:", v12);
    v11 = v12;
  }
  v13 = v11;
  objc_msgSend(v11, "performChangesWithoutAnimation:", &__block_literal_global_525);
  objc_msgSend(v13, "performChangesWithDuration:curve:changes:", 4, &__block_literal_global_526, 0.3);

}

- (void)_animateScrollToStyleKindAnimatorUpdated
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  _QWORD v10[7];

  -[PUWallpaperPosterEditorController animateScrollToStyleKindStartingKind](self, "animateScrollToStyleKindStartingKind");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController animateScrollToStyleKindAnimator](self, "animateScrollToStyleKindAnimator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationValue");
  v6 = v5;

  -[PUWallpaperPosterEditorController animateScrollToStyleKindEndingKind](self, "animateScrollToStyleKindEndingKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__PUWallpaperPosterEditorController__animateScrollToStyleKindAnimatorUpdated__block_invoke;
  v10[3] = &__block_descriptor_56_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8lu32l8u48l8;
  v10[4] = v3;
  *(double *)&v10[5] = v6;
  v10[6] = v7;
  objc_msgSend(v8, "performChanges:", v10);

  if (v6 == 1.0)
  {
    -[PUWallpaperPosterEditorController animateScrollToStyleKindCompletion](self, "animateScrollToStyleKindCompletion");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();

  }
}

- (void)setLoadingSettlingEffect:(BOOL)a3
{
  if (self->_loadingSettlingEffect != a3)
  {
    self->_loadingSettlingEffect = a3;
    -[PUWallpaperPosterEditorController _updateEditToolbar](self, "_updateEditToolbar");
  }
}

- (void)_presentSettlingEffectDebugView:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  PUWallpaperSettlingEffectDebugView *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;
  CGRect v15;
  CGRect v16;

  v4 = a3;
  if (MEMORY[0x1AF429AFC]())
  {
    -[PUWallpaperPosterEditorController environment](self, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "px_isCallServices");

    if ((v6 & 1) == 0)
    {
      -[PUWallpaperPosterEditorController contentOverlayContainerView](self, "contentOverlayContainerView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = -[PUWallpaperSettlingEffectDebugView initWithSegmentationItem:]([PUWallpaperSettlingEffectDebugView alloc], "initWithSegmentationItem:", v4);
        objc_initWeak(&location, self);
        v9 = MEMORY[0x1E0C809B0];
        v10 = 3221225472;
        v11 = __69__PUWallpaperPosterEditorController__presentSettlingEffectDebugView___block_invoke;
        v12 = &unk_1E58AB2F8;
        objc_copyWeak(&v13, &location);
        -[PUWallpaperSettlingEffectDebugView setOnFileRadar:](v8, "setOnFileRadar:", &v9);
        objc_msgSend(v7, "addSubview:", v8, v9, v10, v11, v12);
        objc_msgSend(v7, "bounds");
        v16 = CGRectInset(v15, 40.0, 200.0);
        -[PUWallpaperSettlingEffectDebugView setFrame:](v8, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);

      }
    }
  }

}

- (id)presentationControllerForTipID:(id)a3
{
  UIViewController *tipContainerViewController;
  UIViewController *v5;
  UIViewController *v6;
  void *v7;
  void *v8;
  void *v9;

  tipContainerViewController = self->_tipContainerViewController;
  if (!tipContainerViewController)
  {
    v5 = (UIViewController *)objc_alloc_init(MEMORY[0x1E0DC3F20]);
    v6 = self->_tipContainerViewController;
    self->_tipContainerViewController = v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_tipContainerViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    -[UIViewController view](self->_tipContainerViewController, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAutoresizingMask:", 45);

    tipContainerViewController = self->_tipContainerViewController;
  }
  return tipContainerViewController;
}

- (id)sourceItemForTipID:(id)a3
{
  void *v3;
  void *v4;

  -[PUWallpaperPosterEditorController tipContainerViewController](self, "tipContainerViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)prepareTipPopover:(id)a3 tipID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PUWallpaperPosterEditorController contentOverlayContainerView](self, "contentOverlayContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController tipContainerViewController](self, "tipContainerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "bounds");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v6, "addSubview:", v8);
  objc_msgSend(v5, "setSourceView:", v8);
  -[PUWallpaperPosterEditorController editor](self, "editor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pu_viewForMenuElementIdentifier:", CFSTR("PUPosterEditorActionIdentifierSettlingEffect"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v12[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPassthroughViews:", v11);

    objc_msgSend(v10, "frame");
    objc_msgSend(v5, "setSourceRect:");
  }

}

- (void)tipPopoverDidDismissWithTipID:(id)a3
{
  void *v3;
  id v4;

  -[PUWallpaperPosterEditorController tipContainerViewController](self, "tipContainerViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

}

- (void)_tapToRadar
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  void *v38;
  void *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterEditorController _showProgressIndicator:determinate:](self, "_showProgressIndicator:determinate:", CFSTR("Preparing Attachments…"), 0);
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetUUID");
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CD1390];
  v35 = (void *)v6;
  v40[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchAssetsWithUUIDs:options:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v9) = objc_opt_isKindOfClass();

  v36 = v4;
  if ((v9 & 1) != 0)
  {
    -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "suggestionUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uuid"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPredicate:", v16);

    objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFetchLimit:", 1);
    v18 = (void *)MEMORY[0x1E0CB3528];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("type"), 6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v21);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("subtype"), 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSortDescriptors:", v23);

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v11, 8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "currentLayerStackViewModel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "compoundLayerStack");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "currentLayerStackViewModel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "segmentationItem");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterEditorController environment](self, "environment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "pu_posterDescriptor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController environment](self, "environment");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "pu_sourcePosterConfiguration");
  v33 = v3;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUWallpaperRadarAttachmentProvider radarConfigurationForAsset:suggestion:compoundLayerStack:segmentationItem:posterDescriptor:posterConfiguration:component:completionHandler:](PUWallpaperRadarAttachmentProvider, "radarConfigurationForAsset:suggestion:compoundLayerStack:segmentationItem:posterDescriptor:posterConfiguration:component:completionHandler:", v11, v34, v25, v27, v29, v31, 7, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __48__PUWallpaperPosterEditorController__tapToRadar__block_invoke;
  v37[3] = &unk_1E58AB060;
  v37[4] = self;
  objc_msgSend(v32, "setCompletionHandler:", v37);
  PXFileRadarWithConfiguration();

}

- (void)_wallpaperFeedbackRadar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  _QWORD v19[5];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterEditorController _showProgressIndicator:determinate:](self, "_showProgressIndicator:determinate:", CFSTR("Preparing Attachments…"), 0);
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CD1390];
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchAssetsWithUUIDs:options:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "isLivePhoto"))
    v12 = 34;
  else
    v12 = 9;
  objc_msgSend(v3, "currentLayerStackViewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "compoundLayerStack");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "currentLayerStackViewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "segmentationItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUWallpaperRadarAttachmentProvider radarConfigurationForAsset:suggestion:compoundLayerStack:segmentationItem:posterDescriptor:posterConfiguration:component:completionHandler:](PUWallpaperRadarAttachmentProvider, "radarConfigurationForAsset:suggestion:compoundLayerStack:segmentationItem:posterDescriptor:posterConfiguration:component:completionHandler:", v11, 0, v14, v16, 0, 0, v12, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWantsSystemDiagnostics:", 0);
  objc_msgSend(v17, "setWantsPhotosDiagnostics:", 0);
  if (objc_msgSend(v11, "isLivePhoto"))
    v18 = CFSTR("[Maglev] Wallpaper Feedback: This Live Photo wallpaper is not good");
  else
    v18 = CFSTR("[Maglev] Wallpaper Feedback: This wallpaper is not good");
  objc_msgSend(v17, "setTitle:", v18);
  objc_msgSend(v17, "setDescription:", CFSTR("Please describe why you like or dislike this wallpaper:"));
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__PUWallpaperPosterEditorController__wallpaperFeedbackRadar__block_invoke;
  v19[3] = &unk_1E58AB060;
  v19[4] = self;
  objc_msgSend(v17, "setCompletionHandler:", v19);
  PXFileRadarWithConfiguration();

}

- (void)transitionBetweenStyleWithKind:(id)a3 andKind:(id)a4 progress:(double)a5
{
  id v8;
  id v9;
  int v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[7];

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "isEqualToString:", v9);
  if (v10)
    v11 = v9;
  else
    v11 = v8;
  if (v10)
  {
    a5 = 0.0;
    v12 = (id)*MEMORY[0x1E0D75610];
  }
  else
  {
    v12 = v9;
  }

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85__PUWallpaperPosterEditorController_transitionBetweenStyleWithKind_andKind_progress___block_invoke;
  v14[3] = &__block_descriptor_56_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8lu32l8u48l8;
  v14[4] = v11;
  *(double *)&v14[5] = a5;
  v14[6] = v12;
  objc_msgSend(v13, "performChanges:", v14);

}

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  PUWallpaperPosterEditModel *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint8_t v21[16];

  v7 = a3;
  v8 = a4;
  PLWallpaperGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_INFO, "editor initialize", v21, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D7BC20], "startObservingTips");
  objc_msgSend(MEMORY[0x1E0D71280], "ensureResources");
  v10 = -[PUWallpaperPosterEditModel initWithEditor:]([PUWallpaperPosterEditModel alloc], "initWithEditor:", v7);
  -[PUWallpaperPosterEditorController setEditModel:](self, "setEditModel:", v10);

  v11 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v12 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v7, "contentOverlayView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v12);

  -[PUWallpaperPosterEditorController setContentOverlayContainerView:](self, "setContentOverlayContainerView:", v12);
  -[PUWallpaperPosterEditorController styleDividerView](self, "styleDividerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v14);

  -[PUWallpaperPosterEditorController _setupUserTransformView](self, "_setupUserTransformView");
  -[PUWallpaperPosterEditorController setEnvironment:](self, "setEnvironment:", v8);
  objc_msgSend(v8, "pu_posterDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PUWallpaperPosterEditorController setIsInitialSave:](self, "setIsInitialSave:", 1);
    -[PUWallpaperPosterEditorController _loadPosterDescriptor](self, "_loadPosterDescriptor");
  }
  else
  {
    objc_msgSend(v8, "pu_sourcePosterConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v8, "pu_sourcePosterConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "options") & 1) != 0)
      {
        v19 = objc_msgSend(v8, "px_isCallServices");

        if ((v19 & 1) == 0)
        {
          -[PUWallpaperPosterEditorController setFadeInInitialLoad:](self, "setFadeInInitialLoad:", 1);
          -[PUWallpaperPosterEditorController setHint:](self, "setHint:", 1);
          -[PUWallpaperPosterEditorController setIsInitialSave:](self, "setIsInitialSave:", 1);
        }
      }
      else
      {

      }
      -[PUWallpaperPosterEditorController _loadSourcePosterConfiguration](self, "_loadSourcePosterConfiguration");
    }
    else
    {
      -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUWallpaperPosterEditorController.m"), 3604, CFSTR("asset not found"));

        abort();
      }
      -[PUWallpaperPosterEditorController _loadEditViewModelAndUpdateLooks:](self, "_loadEditViewModelAndUpdateLooks:", 1);
    }
  }

}

- (void)editorDidInvalidate:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  intptr_t v18;
  NSObject *v19;
  void *v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint32_t denom;
  uint32_t numer;
  NSObject *v29;
  NSObject *v30;
  _QWORD v31[4];
  BOOL v32;
  BOOL v33;
  BOOL v34;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  PLWallpaperGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_INFO, "editor invalidate", buf, 2u);
  }

  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "editorDidInvalidate", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v9 = mach_absolute_time();
  -[PUWallpaperPosterEditorController cancelPendingHint](self, "cancelPendingHint");
  objc_msgSend(MEMORY[0x1E0D7BC20], "removeAllPresentationDelegates");
  -[PUWallpaperPosterEditorController _stopObservingPlayerItem](self, "_stopObservingPlayerItem");
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shutdownWithTimeout:", 10.0);

  -[PUWallpaperPosterEditorController segmentationLoading](self, "segmentationLoading");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancel");

  -[PUWallpaperPosterEditorController layerStackRequest](self, "layerStackRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "renderContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cancelAllRequests");

  -[PUWallpaperPosterEditorController settlingEffectRequest](self, "settlingEffectRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "renderContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cancelAllRequests");

  -[PUWallpaperPosterEditorController segmentationLoadingGroup](self, "segmentationLoadingGroup");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = dispatch_time(0, 10000000000);
  v18 = dispatch_group_wait(v16, v17);

  if (v18)
  {
    PLWallpaperGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_FAULT, "Timed out waiting for segmentation loading", buf, 2u);
    }

  }
  if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
  {
    -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stopPreloadingResourcesWithTimeout:", 10.0);

    -[PUWallpaperPosterEditorController setShuffleResourceManager:](self, "setShuffleResourceManager:", 0);
  }
  v21 = -[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle");
  v22 = -[PUWallpaperPosterEditorController isLoading](self, "isLoading");
  v23 = -[PUWallpaperPosterEditorController finalizationState](self, "finalizationState") == 1;
  -[PUWallpaperPosterEditorController editModel](self, "editModel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __57__PUWallpaperPosterEditorController_editorDidInvalidate___block_invoke;
  v31[3] = &__block_descriptor_35_e45_v16__0___PUWallpaperPosterMutableEditModel__8l;
  v32 = v21;
  v33 = v23;
  v34 = v22;
  objc_msgSend(v24, "performChanges:", v31);

  -[PUWallpaperPosterEditorController setPosterConfiguration:](self, "setPosterConfiguration:", 0);
  -[PUWallpaperPosterEditorController setEnvironment:](self, "setEnvironment:", 0);
  -[PUWallpaperPosterEditorController setPhotoPickerViewController:](self, "setPhotoPickerViewController:", 0);
  -[PUWallpaperPosterEditorController setEditModel:](self, "setEditModel:", 0);
  -[PUWallpaperPosterEditorController editor](self, "editor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dismissViewControllerAnimated:completion:", 0, 0);

  objc_msgSend(MEMORY[0x1E0D71280], "freeResources");
  v26 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v29 = v8;
  v30 = v29;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v30, OS_SIGNPOST_INTERVAL_END, v6, "editorDidInvalidate", ", buf, 2u);
  }

  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "editorDidInvalidate";
    v38 = 2048;
    v39 = (float)((float)((float)((float)(v26 - v9) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1AAB61000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v6 = a4;
  PLWallpaperGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_INFO, "editor update", v8, 2u);
  }

  -[PUWallpaperPosterEditorController setEnvironment:](self, "setEnvironment:", v6);
}

- (BOOL)editorShouldBeginFinalization:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  v5 = -[PUWallpaperPosterEditorController finalizationState](self, "finalizationState");
  if (!v5)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__PUWallpaperPosterEditorController_editorShouldBeginFinalization___block_invoke;
    v7[3] = &unk_1E58AA4C8;
    objc_copyWeak(&v8, &location);
    -[PUWallpaperPosterEditorController _saveWithCompletionHandler:](self, "_saveWithCompletionHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5 == 2;
}

- (void)editor:(id)a3 finalizeWithCompletion:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (void)setEnvironment:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_environment, a3);
  if (self->_environment)
  {
    -[PUWallpaperPosterEditorController _updateDeviceOrientation](self, "_updateDeviceOrientation");
    if (objc_msgSend(v6, "px_isCallServices"))
    {
      objc_msgSend(MEMORY[0x1E0D751B8], "standardAlphabeticTextParameters");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D751B8], "setSystemParameters:", v5);

    }
  }

}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[PUWallpaperPosterEditorController backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "backgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController setBackgroundView:](self, "setBackgroundView:", v8);

  objc_msgSend(v6, "foregroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController setForegroundView:](self, "setForegroundView:", v9);

  objc_msgSend(v6, "floatingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterEditorController setFloatingView:](self, "setFloatingView:", v10);
  -[PUWallpaperPosterEditorController _updateContainerFrame](self, "_updateContainerFrame");
  if (!-[PUWallpaperPosterEditorController isPreviewingSettlingEffect](self, "isPreviewingSettlingEffect") || !v7)
    -[PUWallpaperPosterEditorController _updateVisibleLayerStackViewsWithPreviouslyVisibleStackViewModels:](self, "_updateVisibleLayerStackViewsWithPreviouslyVisibleStackViewModels:", MEMORY[0x1E0C9AA60]);
}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  char v6;
  UIView *v7;

  v7 = (UIView *)a3;
  v5 = self->_backgroundView;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[UIView isEqual:](v5, "isEqual:", v7);

    if ((v6 & 1) == 0)
    {
      -[PUWallpaperPosterEditorController _transferSubviewsFrom:to:](self, "_transferSubviewsFrom:to:", self->_backgroundView, v7);
      -[UIView removeObserver:forKeyPath:context:](self->_backgroundView, "removeObserver:forKeyPath:context:", self, CFSTR("layer.bounds"), &BackgroundViewObservationContext);
      objc_storeStrong((id *)&self->_backgroundView, a3);
      -[UIView addObserver:forKeyPath:options:context:](self->_backgroundView, "addObserver:forKeyPath:options:context:", self, CFSTR("layer.bounds"), 0, &BackgroundViewObservationContext);
    }
  }

}

- (void)setForegroundView:(id)a3
{
  UIView *v4;
  UIView *foregroundView;
  UIView *v6;
  char v7;
  UIView *v8;
  UIView *v9;

  v9 = (UIView *)a3;
  v4 = self->_foregroundView;
  foregroundView = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[UIView isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    -[PUWallpaperPosterEditorController _transferSubviewsFrom:to:](self, "_transferSubviewsFrom:to:", self->_foregroundView, v9);
    v8 = v9;
    foregroundView = self->_foregroundView;
    self->_foregroundView = v8;
LABEL_4:

  }
}

- (void)setFloatingView:(id)a3
{
  UIView *v4;
  UIView *floatingView;
  UIView *v6;
  char v7;
  UIView *v8;
  UIView *v9;

  v9 = (UIView *)a3;
  v4 = self->_floatingView;
  floatingView = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = v4;
  v7 = -[UIView isEqual:](v4, "isEqual:", v9);

  if ((v7 & 1) == 0)
  {
    -[PUWallpaperPosterEditorController _transferSubviewsFrom:to:](self, "_transferSubviewsFrom:to:", self->_floatingView, v9);
    v8 = v9;
    floatingView = self->_floatingView;
    self->_floatingView = v8;
LABEL_4:

  }
}

- (void)_transferSubviewsFrom:(id)a3 to:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "subviews", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addSubview:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)looksForEditor:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count") || objc_msgSend(v3, "settlingEffectEnabled"))
  {
    v5 = objc_alloc(MEMORY[0x1E0D751A0]);
    v6 = (void *)objc_msgSend(v5, "initWithKind:parameters:colorSuggestions:", *MEMORY[0x1E0D75600], MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA60]);
    objc_msgSend(MEMORY[0x1E0D71248], "styleWithBakedStyle:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  PXMap();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)initialLookIdentifierForEditor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "currentStyles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") && !objc_msgSend(v6, "settlingEffectEnabled"))
    {
      -[PUWallpaperPosterEditorController currentEditConfiguration](self, "currentEditConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentLayerStackViewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "style");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "kind");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        objc_msgSend(v9, "style");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "kind");
        v14 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (!v14)
      {
        PLWallpaperGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "Cannot determine current style from either edit configuration or layer stack, using Original as fallback", buf, 2u);
        }

        v14 = (id)*MEMORY[0x1E0D75600];
      }
      objc_msgSend(v6, "currentStyleKinds");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count") && objc_msgSend(v17, "indexOfObject:", v14) == 0x7FFFFFFFFFFFFFFFLL)
      {
        PLWallpaperGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v14;
          _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_ERROR, "Initial look styleKind %@ not found in availableStyles", buf, 0xCu);
        }

        v19 = (id)*MEMORY[0x1E0D75600];
        v14 = v19;
      }
      -[PUWallpaperPosterEditorController looksForEditor:](self, "looksForEditor:", v4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v14;
      v29 = v21;
      if ((PXExists() & 1) != 0)
      {
        v8 = v21;
      }
      else
      {
        objc_msgSend(v20, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        v25 = (void *)*MEMORY[0x1E0D75600];
        if (v23)
          v25 = (void *)v23;
        v8 = v25;

        PLWallpaperGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          PXMap();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v8;
          v32 = 2114;
          v33 = v27;
          v34 = 2114;
          v35 = v8;
          _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_ERROR, "Initial look %{public}@ is not present in looks array: %{public}@. Falling back to %{public}@.", buf, 0x20u);

        }
      }

    }
    else
    {
      v8 = (id)*MEMORY[0x1E0D75600];
    }

  }
  else
  {
    v8 = (id)*MEMORY[0x1E0D75600];
  }

  return v8;
}

- (void)editor:(id)a3 didTransitionToLook:(id)a4 progress:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v8 = a4;
  objc_msgSend(a3, "pu_currentLook");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterEditorController transitionBetweenStyleWithKind:andKind:progress:](self, "transitionBetweenStyleWithKind:andKind:progress:", v11, v10, a5);
}

- (id)leadingMenuElementsForEditor:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (-[PUWallpaperPosterEditorController _attemptedSettlingEffect](self, "_attemptedSettlingEffect"))
    v5 = -[PUWallpaperPosterEditorController loadingSettlingEffect](self, "loadingSettlingEffect");
  else
    v5 = 0;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUWallpaperPosterEditorController _photoPickerAction](self, "_photoPickerAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "addObject:", v7);
  -[PUWallpaperPosterEditorController _toggleSettlingEffectAction](self, "_toggleSettlingEffectAction");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
  {
    objc_msgSend(v4, "pu_placeholderAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
  else if (v8)
  {
    objc_msgSend(v6, "addObject:", v8);
  }

  return v6;
}

- (id)trailingMenuElementsForEditor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUWallpaperPosterEditorController _colorPickerAction](self, "_colorPickerAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUWallpaperPosterEditorController _toggleHighKeyLowKeyAction](self, "_toggleHighKeyLowKeyAction");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = v5;
  if (v5 || (v8 = (void *)v6) != 0)
    objc_msgSend(v4, "addObject:", v8);
  -[PUWallpaperPosterEditorController _actionsMenu](self, "_actionsMenu", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "addObject:", v9);

  return v4;
}

- (double)editor:(id)a3 luminanceForLook:(id)a4 inRect:(CGRect)a5
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  double v10;

  v6 = a4;
  if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
  {
    v7 = *MEMORY[0x1E0D755A8];
  }
  else
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentClockAreaLuminanceForStyleKind:", v8);
    v7 = v10;

  }
  return v7;
}

- (id)solidColorHomeScreenColorPickerConfigurationForEditor:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "segmentationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "colorAnalysis");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentLayerStackViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "style");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "defaultDominantColorWithAnalysis:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pu_UIColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init((Class)getPREditorColorPickerConfigurationClass());
  objc_msgSend(v12, "setSelectedColor:", v11);

  return v12;
}

- (BOOL)wantsLowLuminanceContent
{
  void *v3;
  int v4;

  if (PFPosterWantsLowLuminanceContent())
  {
    -[PUWallpaperPosterEditorController environment](self, "environment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "px_isCallServices") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_handlePosterSaved:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[5];

  v4 = a3;
  v6 = a4;
  if (v4)
    v7 = 2;
  else
    v7 = 0;
  -[PUWallpaperPosterEditorController setFinalizationState:](self, "setFinalizationState:", v7);
  if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
  {
    -[PUWallpaperPosterEditorController editModel](self, "editModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performChanges:", &__block_literal_global_562);

  }
  if (v4)
  {
    -[PUWallpaperPosterEditorController editor](self, "editor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pu_requestDismissalWithAction:", 1);

  }
  else
  {
    if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
      -[PUWallpaperPosterEditorController _createShuffleResourceManager](self, "_createShuffleResourceManager");
    v10 = -[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle");
    v11 = &stru_1E58AD278;
    if (v10)
      v11 = CFSTR("SHUFFLE_");
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PHOTOS_WALLPAPER_EDITOR_SAVING_%@FAILED_TITLE"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(v13);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v6;
    v15 = *MEMORY[0x1E0CB3388];
    v16 = v14;
    do
    {
      v17 = v16;
      v18 = +[PUErrorPresentationController isNetworkRelatedError:](PUErrorPresentationController, "isNetworkRelatedError:", v16);
      objc_msgSend(v16, "userInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while (!v18 && v16);
    if (v18)
      v20 = CFSTR("PHOTOS_WALLPAPER_EDITOR_SAVING_%@FAILED_MESSAGE_CONNECTION");
    else
      v20 = CFSTR("PHOTOS_WALLPAPER_EDITOR_SAVING_%@FAILED_MESSAGE");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v20, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (MEMORY[0x1AF429AFC]())
    {
      objc_msgSend(v22, "stringByAppendingFormat:", CFSTR("\n\nError (Internal):\n%@"), v14);
      v23 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v23;
    }
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v31, v22, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __62__PUWallpaperPosterEditorController__handlePosterSaved_error___block_invoke_2;
    v33[3] = &unk_1E58A8DE8;
    v33[4] = self;
    objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 1, v33);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addAction:", v28);

    if (MEMORY[0x1AF429AFC]())
    {
      v32[0] = v27;
      v32[1] = 3221225472;
      v32[2] = __62__PUWallpaperPosterEditorController__handlePosterSaved_error___block_invoke_3;
      v32[3] = &unk_1E58A8DE8;
      v32[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Tap to Radar (Internal)"), 0, v32);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addAction:", v29);

    }
    -[PUWallpaperPosterEditorController editor](self, "editor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "presentViewController:animated:completion:", v24, 1, 0);

  }
}

- (void)_saveWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int64_t v33;
  unint64_t v34;
  void *v35;
  int64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  id v55;
  uint64_t v56;
  id v57;
  void *v58;
  _QWORD block[4];
  id v60;
  id v61;
  id v62;
  id v63;
  id v64[2];
  char v65;
  id buf;
  _QWORD v67[4];
  id v68;
  id v69;
  PUWallpaperPosterEditorController *v70;
  id v71;
  _QWORD v72[4];
  id v73;
  _QWORD aBlock[4];
  id v75;
  id v76;
  id location[2];

  v4 = a3;
  -[PUWallpaperPosterEditorController setFinalizationState:](self, "setFinalizationState:", 1);
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E58A5AE8;
  objc_copyWeak(&v76, location);
  v57 = v4;
  v75 = v57;
  v58 = _Block_copy(aBlock);
  -[PUWallpaperPosterEditorController environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pu_targetAssetDirectory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    PLWallpaperGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[PUWallpaperPosterEditorController signpost](self, "signpost");
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PUWallpaperPosterEditorController.Saving", ", (uint8_t *)&buf, 2u);
    }

    PULocalizedString(CFSTR("PHOTOS_WALLPAPER_SAVING_PROGRESS_INDICATOR_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController _showProgressIndicator:determinate:](self, "_showProgressIndicator:determinate:", v9, -[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"));

    -[PUWallpaperPosterEditorController posterConfiguration](self, "posterConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    LODWORD(v10) = -[PUWallpaperPosterEditorController wantsLowLuminanceContent](self, "wantsLowLuminanceContent");
    v12 = objc_msgSend(MEMORY[0x1E0D75340], "deviceSupportsLandscapeConfiguration");
    v13 = 5;
    if (!(_DWORD)v10)
      v13 = 1;
    if (v12)
      v14 = v13 | 0x22;
    else
      v14 = v13;
    -[PUWallpaperPosterEditorController environment](self, "environment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "px_isCallServices");

    v17 = v14 | 2;
    if (!v16)
      v17 = v14;
    v56 = v17;
    if ((v17 & 4) != 0)
      objc_msgSend(v11, "setOptions:", objc_msgSend(v11, "options") | 4);
    -[PUWallpaperPosterEditorController editor](self, "editor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "pu_isDepthEffectDisallowed");

    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUWallpaperPosterEditorController isAnySmartAlbumAvailable](self, "isAnySmartAlbumAvailable"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("smart_shuffle_available"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PUWallpaperPosterEditorController isInitialSave](self, "isInitialSave"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("is_initial_save"));

    if (-[PUWallpaperPosterEditorController _isShuffle](self, "_isShuffle"))
    {
      -[PUWallpaperPosterEditorController editModel](self, "editModel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "performChanges:", &__block_literal_global_585);

      -[PUWallpaperPosterEditorController _savePosterEditConfigurationForCurrentPosterMedia](self, "_savePosterEditConfigurationForCurrentPosterMedia");
      -[PUWallpaperPosterEditorController shuffleResourceManager](self, "shuffleResourceManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc_init(MEMORY[0x1E0D75200]);
      objc_msgSend(v24, "style");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bakedStyle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setStyle:", v27);

      v28 = v19 ^ 1u;
      objc_msgSend(v25, "setIsDepthAvailable:", v28);
      if (-[PUWallpaperPosterEditorController _isShuffleModeWithGlobalDepth](self, "_isShuffleModeWithGlobalDepth"))
      {
        v29 = objc_msgSend(v24, "depthEnabledForAllMedia");
        objc_msgSend(v25, "setIsDepthEnabled:", v29 & v28);
        objc_msgSend(v25, "setIsLandscapeDepthEnabled:", v29);
      }
      objc_msgSend(v25, "setNormalizedVisibleFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
      objc_msgSend(v11, "setEditConfiguration:", v25);
      -[PUWallpaperPosterEditorController environment](self, "environment");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "px_significantEventsCounter");

      objc_msgSend(v11, "media");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = +[PUPosterUtilities mediaIndexWithSeed:mediaCount:](PUPosterUtilities, "mediaIndexWithSeed:mediaCount:", v31, objc_msgSend(v32, "count"));

      v34 = -[PUWallpaperPosterEditorController shuffleAssetIndex](self, "shuffleAssetIndex");
      objc_msgSend(v11, "media");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v34 % objc_msgSend(v35, "count");

      if (v36 < v33)
      {
        objc_msgSend(v11, "media");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "count");

      }
      objc_msgSend(v11, "media");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      PXArrayRotate();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMedia:", v39);

      -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "layoutConfiguration");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLayoutConfiguration:", v41);

      objc_msgSend(v11, "analyticsPayload");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addEntriesFromDictionary:", v42);

      objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.wallpaper.editorSaved"), v20);
      objc_msgSend(v11, "media");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = MEMORY[0x1E0C809B0];
      v72[0] = MEMORY[0x1E0C809B0];
      v72[1] = 3221225472;
      v72[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_2_589;
      v72[3] = &unk_1E58A4298;
      objc_copyWeak(&v73, location);
      v67[0] = v44;
      v67[1] = 3221225472;
      v67[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_4;
      v67[3] = &unk_1E58A17C8;
      v68 = v11;
      v45 = v6;
      v69 = v45;
      v70 = self;
      v71 = v58;
      objc_msgSend(v24, "exportResourcesForFinalPosterMedia:options:assetDirectory:progressHandler:completion:", v43, v56, v45, v72, v67);

      objc_destroyWeak(&v73);
    }
    else
    {
      -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "posterEditConfigurationRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setIsDepthAvailable:", objc_msgSend(v24, "isDepthAvailable") & (v19 ^ 1));
      objc_msgSend(v11, "setEditConfiguration:", v24);
      objc_msgSend(v46, "layoutConfiguration");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLayoutConfiguration:", v47);

      objc_msgSend(v11, "analyticsPayload");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addEntriesFromDictionary:", v48);

      objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.wallpaper.editorSaved"), v20);
      objc_msgSend(v11, "setOptions:", objc_msgSend(v11, "options") & 0xFFFFFFFFFFFFFFFDLL);
      objc_msgSend(v11, "setOptions:", objc_msgSend(v11, "options") & 0xFFFFFFFFFFFFFFFELL);
      if (objc_msgSend(v46, "settlingEffectEnabled"))
        v49 = (void *)(v56 | 0x40);
      else
        v49 = (void *)v56;
      if (objc_msgSend(v46, "settlingEffectEnabled"))
        v50 = CFSTR("PHOTOS_WALLPAPER_SWITCHER_TITLE_LIVE_PHOTO");
      else
        v50 = CFSTR("PHOTOS_WALLPAPER_SWITCHER_TITLE_PHOTOS");
      -[PUWallpaperPosterEditorController environment](self, "environment");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "pu_targetConfiguration");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setPu_displayNameLocalizationKey:", v50);

      -[PUWallpaperPosterEditorController environment](self, "environment");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v51) = objc_msgSend(v53, "px_isCallServices");

      objc_initWeak(&buf, self);
      -[PUWallpaperPosterEditorController queue](self, "queue");
      v54 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_595;
      block[3] = &unk_1E58A17F0;
      v60 = v46;
      v63 = v58;
      v65 = (char)v51;
      v55 = v46;
      objc_copyWeak(v64, &buf);
      v61 = v11;
      v62 = v6;
      v64[1] = v49;
      dispatch_async(v54, block);

      objc_destroyWeak(v64);
      objc_destroyWeak(&buf);
    }

  }
  else
  {
    (*((void (**)(void *, _QWORD, _QWORD))v58 + 2))(v58, 0, 0);
  }

  objc_destroyWeak(&v76);
  objc_destroyWeak(location);

}

- (id)_fetchMePerson
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  id v20;
  id v22;
  uint8_t buf[4];
  NSObject *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v2, "suggestedMePersonIdentifierWithError:", &v22);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v22;

  if (!v3)
  {
    PLWallpaperGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    v8 = "No suggestedMePerson: %@";
    v9 = v7;
    v10 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0D7B6B8], "personWithLocalIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLWallpaperGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_DWORD *)buf = 138412290;
    v24 = v3;
    v8 = "No PHPerson found for suggestedPersonIdentifier: %@";
    v9 = v7;
    v10 = OS_LOG_TYPE_ERROR;
LABEL_9:
    _os_log_impl(&dword_1AAB61000, v9, v10, v8, buf, 0xCu);
LABEL_10:

    objc_msgSend(MEMORY[0x1E0D7B6B8], "fetchMeContact");
    v11 = objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0D7B6B8];
      -[NSObject identifier](v11, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "personWithPersonUri:", v13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      PLWallpaperGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v5)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v24 = v7;
          v25 = 2112;
          v26 = v5;
          _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_INFO, "Found person for Me contact: contact %@, person %@", buf, 0x16u);
        }
        goto LABEL_20;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        v16 = "No PHPerson found for Me contact: %@";
        v17 = v15;
        v18 = OS_LOG_TYPE_ERROR;
        v19 = 12;
        goto LABEL_18;
      }
    }
    else
    {
      PLWallpaperGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v16 = "No Me contact found";
        v17 = v15;
        v18 = OS_LOG_TYPE_INFO;
        v19 = 2;
LABEL_18:
        _os_log_impl(&dword_1AAB61000, v17, v18, v16, buf, v19);
      }
    }
    v5 = 0;
LABEL_20:

    goto LABEL_21;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v3;
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_INFO, "Found suggestedMePerson: identifier %@, person %@", buf, 0x16u);
  }
LABEL_21:

  v20 = v5;
  return v20;
}

- (void)_updatePosterConfigurationForCallServices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  _BOOL8 v27;
  NSObject *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = v8;

  -[PUWallpaperPosterEditorController currentPosterMedia](self, "currentPosterMedia");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetUUID");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  -[PUWallpaperPosterEditorController editViewModel](self, "editViewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "segmentationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "regions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0D71290], "dictionaryFromRegions:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("regions"));

  }
  else
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("regions"));
  }
  -[PUWallpaperPosterEditorController _fetchMePerson](self, "_fetchMePerson");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v33 = v4;
    v17 = (void *)MEMORY[0x1E0CD1390];
    v39[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUWallpaperPosterEditorController photoLibrary](self, "photoLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "librarySpecificFetchOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fetchAssetsWithLocalIdentifiers:options:", v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = (void *)MEMORY[0x1E0D7B6B8];
      v38 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "facesForPerson:inAssets:", v16, v24);
      v25 = objc_claimAutoreleasedReturnValue();

      v26 = -[NSObject count](v25, "count");
      v27 = v26 != 0;
      PLWallpaperGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        if (v26)
          v29 = CFSTR("YES");
        else
          v29 = CFSTR("NO");
        *(_DWORD *)buf = 138412546;
        v35 = v29;
        v36 = 2048;
        v37 = -[NSObject count](v25, "count");
        _os_log_impl(&dword_1AAB61000, v28, OS_LOG_TYPE_INFO, "Setting representsDeviceOwner to %@: found %lu faces", buf, 0x16u);
      }

    }
    else
    {
      PLWallpaperGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v11;
        _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_ERROR, "Could not find asset for %@, not setting representsDeviceOwner flag", buf, 0xCu);
      }
      v27 = 0;
    }
    v4 = v33;

  }
  else
  {
    v27 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0D75738]);

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[__CFString hash](v11, "hash"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v31, CFSTR("hashedAssetIdentifier"));

  }
  else
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("hashedAssetIdentifier"));
  }
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D75730]);
  v32 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setUserInfo:", v32);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  objc_super v20;
  CMTime v21;
  CMTime time;
  CMTime v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[PUWallpaperPosterEditorController observedPlayerItem](self, "observedPlayerItem");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if ((void *)BackgroundViewObservationContext == a6)
  {
    -[PUWallpaperPosterEditorController _updateContainerFrame](self, "_updateContainerFrame");
  }
  else if ((void *)PlayerItemObservationContext == a6)
  {
    if ((id)v13 == v11)
    {
      v15 = objc_msgSend(v11, "status");
      if (v15 == 1)
      {
        objc_msgSend(MEMORY[0x1E0D711D0], "globalSettings");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "disableMADForSettlingEffect");

        if (v19)
        {
          if (v11)
            objc_msgSend(v11, "duration");
          else
            memset(&time, 0, sizeof(time));
          CMTimeMultiplyByFloat64(&v23, &time, 0.5);
          v21 = v23;
          objc_msgSend(v11, "setForwardPlaybackEndTime:", &v21);
        }
      }
      else if (v15 == 2)
      {
        PLWallpaperGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "error");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v25 = v17;
          _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "Settling effect preview video failed to load: %@", buf, 0xCu);

        }
      }
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)PUWallpaperPosterEditorController;
    -[PUWallpaperPosterEditorController observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  v4 = a3;
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "transitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "initiallyInteractive"))
    {
      objc_initWeak(&location, self);
      v7 = MEMORY[0x1E0C809B0];
      v8 = 3221225472;
      v9 = __71__PUWallpaperPosterEditorController_presentationControllerWillDismiss___block_invoke;
      v10 = &unk_1E58A8108;
      objc_copyWeak(&v11, &location);
      objc_msgSend(v6, "notifyWhenInteractionChangesUsingBlock:", &v7);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      -[PUWallpaperPosterEditorController _handlePhotoPickerResults:](self, "_handlePhotoPickerResults:", 0);
    }
    -[PUWallpaperPosterEditorController _stopListeningForExtensionHostResignationNotification](self, "_stopListeningForExtensionHostResignationNotification", v7, v8, v9, v10);

  }
}

- (void)setPinchToZoomHintTitle:(id)a3
{
  objc_storeStrong((id *)&self->_pinchToZoomHintTitle, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (PUWallpaperPosterEditViewModel)editViewModel
{
  return self->_editViewModel;
}

- (PFPosterMedia)currentPosterMedia
{
  return self->_currentPosterMedia;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unint64_t)signpost
{
  return self->_signpost;
}

- (PUWallpaperPosterEditModel)editModel
{
  return self->_editModel;
}

- (void)setEditModel:(id)a3
{
  objc_storeStrong((id *)&self->_editModel, a3);
}

- (PIParallaxCompoundLayerStackRequest)layerStackRequest
{
  return self->_layerStackRequest;
}

- (void)setLayerStackRequest:(id)a3
{
  objc_storeStrong((id *)&self->_layerStackRequest, a3);
}

- (PISegmentationLoading)segmentationLoading
{
  return (PISegmentationLoading *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSegmentationLoading:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_group)segmentationLoadingGroup
{
  return self->_segmentationLoadingGroup;
}

- (void)setSegmentationLoadingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_segmentationLoadingGroup, a3);
}

- (PIParallaxLayerStackRequest)settlingEffectRequest
{
  return self->_settlingEffectRequest;
}

- (void)setSettlingEffectRequest:(id)a3
{
  objc_storeStrong((id *)&self->_settlingEffectRequest, a3);
}

- (PFPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (PFPosterConfiguration)oldPosterConfiguration
{
  return self->_oldPosterConfiguration;
}

- (void)setOldPosterConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_oldPosterConfiguration, a3);
}

- (BOOL)isCancellingMediaLoading
{
  return self->_isCancellingMediaLoading;
}

- (PUWallpaperShuffleResourceManager)shuffleResourceManager
{
  return self->_shuffleResourceManager;
}

- (void)setShuffleResourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_shuffleResourceManager, a3);
}

- (PUWallpaperPosterMigrator)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
  objc_storeStrong((id *)&self->_migrator, a3);
}

- (PUWallpaperConfigurationUpdater)configurationUpdater
{
  return self->_configurationUpdater;
}

- (void)setConfigurationUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_configurationUpdater, a3);
}

- (int64_t)shuffleAssetIndex
{
  return self->_shuffleAssetIndex;
}

- (PUPosterEditingEnvironment)environment
{
  return self->_environment;
}

- (PUPosterEditor)editor
{
  return self->_editor;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (UIView)floatingView
{
  return self->_floatingView;
}

- (UIView)styleDividerView
{
  return self->_styleDividerView;
}

- (PUParallaxLayerStackViewModel)currentLayerStackViewModel
{
  return self->_currentLayerStackViewModel;
}

- (NSArray)visibleLayerStackViewModels
{
  return self->_visibleLayerStackViewModels;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (PUProgressIndicatorView)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setProgressIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_progressIndicator, a3);
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicator, a3);
}

- (BOOL)isPerformingInitialLoad
{
  return self->_performingInitialLoad;
}

- (void)setPerformingInitialLoad:(BOOL)a3
{
  self->_performingInitialLoad = a3;
}

- (BOOL)fadeInInitialLoad
{
  return self->_fadeInInitialLoad;
}

- (void)setFadeInInitialLoad:(BOOL)a3
{
  self->_fadeInInitialLoad = a3;
}

- (PUUserTransformView)userTransformView
{
  return self->_userTransformView;
}

- (void)setUserTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_userTransformView, a3);
}

- (PUWallpaperPosterParallaxView)parallaxSimulationView
{
  return self->_parallaxSimulationView;
}

- (void)setParallaxSimulationView:(id)a3
{
  objc_storeStrong((id *)&self->_parallaxSimulationView, a3);
}

- (UIView)contentOverlayContainerView
{
  return self->_contentOverlayContainerView;
}

- (void)setContentOverlayContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_contentOverlayContainerView, a3);
}

- (UILabel)hintLabel
{
  return self->_hintLabel;
}

- (void)setHintLabel:(id)a3
{
  objc_storeStrong((id *)&self->_hintLabel, a3);
}

- (unint64_t)hint
{
  return self->_hint;
}

- (UITapGestureRecognizer)tapToShuffleGestureRecognizer
{
  return self->_tapToShuffleGestureRecognizer;
}

- (void)setTapToShuffleGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapToShuffleGestureRecognizer, a3);
}

- (BOOL)isPausingParallax
{
  return self->_isPausingParallax;
}

- (BOOL)isUserTransformDisabled
{
  return self->_isUserTransformDisabled;
}

- (BOOL)isAnySmartAlbumAvailable
{
  return self->_isAnySmartAlbumAvailable;
}

- (void)setIsAnySmartAlbumAvailable:(BOOL)a3
{
  self->_isAnySmartAlbumAvailable = a3;
}

- (BOOL)isInitialSave
{
  return self->_isInitialSave;
}

- (void)setIsInitialSave:(BOOL)a3
{
  self->_isInitialSave = a3;
}

- (_PUWallpaperSmartAlbumPreviewReloadRequest)smartAlbumPreviewReloadRequest
{
  return self->_smartAlbumPreviewReloadRequest;
}

- (void)setSmartAlbumPreviewReloadRequest:(id)a3
{
  objc_storeStrong((id *)&self->_smartAlbumPreviewReloadRequest, a3);
}

- (PHPickerViewController)photoPickerViewController
{
  return self->_photoPickerViewController;
}

- (void)setPhotoPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_photoPickerViewController, a3);
}

- (id)mediaLoadedCompletionHandler
{
  return self->_mediaLoadedCompletionHandler;
}

- (void)setMediaLoadedCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (UIViewController)presentedPosterConfigurationViewController
{
  return self->_presentedPosterConfigurationViewController;
}

- (void)setPresentedPosterConfigurationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedPosterConfigurationViewController, a3);
}

- (unint64_t)finalizationState
{
  return self->_finalizationState;
}

- (void)setFinalizationState:(unint64_t)a3
{
  self->_finalizationState = a3;
}

- (NSString)animateScrollToStyleKindStartingKind
{
  return self->_animateScrollToStyleKindStartingKind;
}

- (void)setAnimateScrollToStyleKindStartingKind:(id)a3
{
  objc_storeStrong((id *)&self->_animateScrollToStyleKindStartingKind, a3);
}

- (NSString)animateScrollToStyleKindEndingKind
{
  return self->_animateScrollToStyleKindEndingKind;
}

- (void)setAnimateScrollToStyleKindEndingKind:(id)a3
{
  objc_storeStrong((id *)&self->_animateScrollToStyleKindEndingKind, a3);
}

- (id)animateScrollToStyleKindCompletion
{
  return self->_animateScrollToStyleKindCompletion;
}

- (void)setAnimateScrollToStyleKindCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (PXNumberAnimator)animateScrollToStyleKindAnimator
{
  return self->_animateScrollToStyleKindAnimator;
}

- (void)setAnimateScrollToStyleKindAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_animateScrollToStyleKindAnimator, a3);
}

- (AVPlayerItem)observedPlayerItem
{
  return self->_observedPlayerItem;
}

- (void)setObservedPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_observedPlayerItem, a3);
}

- (BOOL)isPreviewingSettlingEffect
{
  return self->_previewingSettlingEffect;
}

- (void)setPreviewingSettlingEffect:(BOOL)a3
{
  self->_previewingSettlingEffect = a3;
}

- (UIViewPropertyAnimator)settlingEffectPreviewAnimator
{
  return self->_settlingEffectPreviewAnimator;
}

- (void)setSettlingEffectPreviewAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_settlingEffectPreviewAnimator, a3);
}

- (NSTimer)settlingEffectPreviewDelayTimer
{
  return self->_settlingEffectPreviewDelayTimer;
}

- (void)setSettlingEffectPreviewDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_settlingEffectPreviewDelayTimer, a3);
}

- (BOOL)loadingSettlingEffect
{
  return self->_loadingSettlingEffect;
}

- (BOOL)settlingEffectToggleInProgress
{
  return self->_settlingEffectToggleInProgress;
}

- (void)setSettlingEffectToggleInProgress:(BOOL)a3
{
  self->_settlingEffectToggleInProgress = a3;
}

- (UIViewController)tipContainerViewController
{
  return self->_tipContainerViewController;
}

- (void)setTipContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tipContainerViewController, a3);
}

- (BOOL)shouldLoadSettlingEffectSynchronously
{
  return self->_shouldLoadSettlingEffectSynchronously;
}

- (void)setShouldLoadSettlingEffectSynchronously:(BOOL)a3
{
  self->_shouldLoadSettlingEffectSynchronously = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipContainerViewController, 0);
  objc_storeStrong((id *)&self->_settlingEffectPreviewDelayTimer, 0);
  objc_storeStrong((id *)&self->_settlingEffectPreviewAnimator, 0);
  objc_storeStrong((id *)&self->_observedPlayerItem, 0);
  objc_storeStrong((id *)&self->_animateScrollToStyleKindAnimator, 0);
  objc_storeStrong(&self->_animateScrollToStyleKindCompletion, 0);
  objc_storeStrong((id *)&self->_animateScrollToStyleKindEndingKind, 0);
  objc_storeStrong((id *)&self->_animateScrollToStyleKindStartingKind, 0);
  objc_storeStrong((id *)&self->_presentedPosterConfigurationViewController, 0);
  objc_storeStrong(&self->_mediaLoadedCompletionHandler, 0);
  objc_storeStrong((id *)&self->_photoPickerViewController, 0);
  objc_storeStrong((id *)&self->_smartAlbumPreviewReloadRequest, 0);
  objc_storeStrong((id *)&self->_tapToShuffleGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hintLabel, 0);
  objc_storeStrong((id *)&self->_contentOverlayContainerView, 0);
  objc_storeStrong((id *)&self->_parallaxSimulationView, 0);
  objc_storeStrong((id *)&self->_userTransformView, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_visibleLayerStackViewModels, 0);
  objc_storeStrong((id *)&self->_currentLayerStackViewModel, 0);
  objc_storeStrong((id *)&self->_styleDividerView, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_configurationUpdater, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_shuffleResourceManager, 0);
  objc_storeStrong((id *)&self->_oldPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_settlingEffectRequest, 0);
  objc_storeStrong((id *)&self->_segmentationLoadingGroup, 0);
  objc_storeStrong((id *)&self->_segmentationLoading, 0);
  objc_storeStrong((id *)&self->_layerStackRequest, 0);
  objc_storeStrong((id *)&self->_editModel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentPosterMedia, 0);
  objc_storeStrong((id *)&self->_editViewModel, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_pinchToZoomHintTitle, 0);
}

void __71__PUWallpaperPosterEditorController_presentationControllerWillDismiss___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;

  if ((objc_msgSend(a2, "isCancelled") & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_handlePhotoPickerResults:", 0);

  }
}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E58A1780;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v6 = *(id *)(a1 + 32);
  v12 = a2;
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

  objc_destroyWeak(&v11);
}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_2_589(uint64_t a1, double a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_3;
  v3[3] = &unk_1E58A79B8;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)&a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void (*v14)(void);
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    PLWallpaperGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v3;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_ERROR, "Failed to export shuffle assets: %{public}@", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v3, "allValues");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v7);

  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v16 = 0;
    v10 = objc_msgSend(v8, "saveToURL:error:", v9, &v16);
    v6 = v16;
    PLWallpaperGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 40), "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v18 = v13;
        _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_INFO, "Successfully saved shuffle poster config to directory: %{public}@'", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 48), "_updateShuffleSuggestionFeaturedStateIfNeededForConfiguration:", *(_QWORD *)(a1 + 32));
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v15;
        v19 = 2114;
        v20 = v6;
        _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "Failed to save shuffle poster configuration to directory: '%{public}@', error: %{public}@", buf, 0x16u);

      }
      v14 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    }
    v14();
  }

}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_595(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "segmentationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(WeakRetained, "_updatePosterConfigurationForCallServices:", *(_QWORD *)(a1 + 40));

    }
    v4 = *(void **)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v23 = 0;
    objc_msgSend(v4, "saveToURL:error:", v5, &v23);
    v6 = v23;
    v7 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "media");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subpath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0D71298];
    objc_msgSend(*(id *)(a1 + 32), "segmentationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 40), "editConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_596;
    v20[3] = &unk_1E58A5EB8;
    v21 = v11;
    v22 = *(id *)(a1 + 56);
    v16 = v11;
    v17 = (id)objc_msgSend(v12, "saveSegmentationItem:layerStackOptions:configuration:style:layout:toWallpaperURL:completion:", v13, v14, v15, 0, 0, v16, v20);

  }
  else
  {
    PLWallpaperGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v25 = v19;
      _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_ERROR, "failed to save wallpaper: view model has nil segmentation item %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_596(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void (*v6)(void);
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLWallpaperGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v5;
      v9 = 2114;
      v10 = v3;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_ERROR, "failed to save wallpaper to file: '%{public}@', error: %{public}@", (uint8_t *)&v7, 0x16u);

    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();

}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateProgressIndicator:", *(double *)(a1 + 40));

}

uint64_t __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_584(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIdleTimerDisabled:forReason:", 1, CFSTR("shuffleSave"));
}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_hideProgressIndicator");
    PLWallpaperGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "signpost");
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)v7 = 0;
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PUWallpaperPosterEditorController.Saving", ", v7, 2u);
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __62__PUWallpaperPosterEditorController__handlePosterSaved_error___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "editor");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

uint64_t __62__PUWallpaperPosterEditorController__handlePosterSaved_error___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tapToRadar");
}

uint64_t __62__PUWallpaperPosterEditorController__handlePosterSaved_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIdleTimerDisabled:forReason:", 0, CFSTR("shuffleSave"));
}

uint64_t __68__PUWallpaperPosterEditorController_initialLookIdentifierForEditor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

uint64_t __68__PUWallpaperPosterEditorController_initialLookIdentifierForEditor___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

_PUPosterEditingLook *__52__PUWallpaperPosterEditorController_looksForEditor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id PRPosterColorClass;
  void *v15;
  _PUPosterEditingLook *v16;

  v3 = a2;
  objc_msgSend(v3, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clockFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clockColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D75170], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToParallaxColor:", v7);

  if ((objc_msgSend(*(id *)(a1 + 32), "_isShuffle") & 1) != 0 || (v8 & 1) != 0)
  {
    v13 = PIParallaxStylePrefersVibrantClockForKind();
    PRPosterColorClass = getPRPosterColorClass();
    if ((v13 & 1) != 0)
      objc_msgSend(PRPosterColorClass, "vibrantMaterialColor");
    else
      objc_msgSend(PRPosterColorClass, "vibrantMonochromeColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "clockColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pu_UIColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clockVibrancy");
    objc_msgSend(v10, "colorWithAlphaComponent:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc((Class)getPRPosterColorClass()), "initWithColor:preferredStyle:", v11, 2);
  }
  PUPosterLookLocalizedDisplayNameForLayerStyleKind(v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_PUPosterEditingLook initWithIdentifier:displayName:pu_timeAppearance:pu_timeFontIdentifier:pu_timeFontColor:]([_PUPosterEditingLook alloc], "initWithIdentifier:displayName:pu_timeAppearance:pu_timeFontIdentifier:pu_timeFontColor:", v4, v15, 2, v5, v12);

  return v16;
}

void __67__PUWallpaperPosterEditorController_editorShouldBeginFinalization___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PUWallpaperPosterEditorController_editorShouldBeginFinalization___block_invoke_2;
  block[3] = &unk_1E58A62D0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __67__PUWallpaperPosterEditorController_editorShouldBeginFinalization___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handlePosterSaved:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

void __57__PUWallpaperPosterEditorController_editorDidInvalidate___block_invoke(_BYTE *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (a1[32] && a1[33])
  {
    objc_msgSend(v3, "setIdleTimerDisabled:forReason:", 0, CFSTR("shuffleSave"));
    v3 = v4;
  }
  if (a1[34])
  {
    objc_msgSend(v4, "setIdleTimerDisabled:forReason:", 0, CFSTR("loading"));
    v3 = v4;
  }

}

uint64_t __85__PUWallpaperPosterEditorController_transitionBetweenStyleWithKind_andKind_progress___block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "scrollToPosition:", &v3);
}

uint64_t __60__PUWallpaperPosterEditorController__wallpaperFeedbackRadar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideProgressIndicator");
}

uint64_t __48__PUWallpaperPosterEditorController__tapToRadar__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hideProgressIndicator");
}

void __69__PUWallpaperPosterEditorController__presentSettlingEffectDebugView___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_tapToRadar");

}

uint64_t __77__PUWallpaperPosterEditorController__animateScrollToStyleKindAnimatorUpdated__block_invoke(uint64_t a1, void *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "scrollToPosition:", &v3);
}

uint64_t __74__PUWallpaperPosterEditorController__animateScrollToStyleKind_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 1.0);
}

uint64_t __74__PUWallpaperPosterEditorController__animateScrollToStyleKind_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", 0.0);
}

void __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "performChanges:", &__block_literal_global_520_43132);
  v2 = (void *)MEMORY[0x1E0D7BC20];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_3;
  v3[3] = &unk_1E58AB210;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "dismissTip:", v3);

  objc_destroyWeak(&v5);
}

uint64_t __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSettlingEffectStateRestorationLayerStyleKind:", *(_QWORD *)(a1 + 32));
}

void __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "editor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pu_updateLooks");

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_startSettlingEffectPreview");

  v6 = dispatch_time(0, 10000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_4;
  v7[3] = &unk_1E58AB210;
  v8 = *(id *)(a1 + 32);
  objc_copyWeak(&v9, v2);
  dispatch_after(v6, MEMORY[0x1E0C80D38], v7);
  objc_destroyWeak(&v9);

}

void __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_4(id *a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = a1;
  objc_msgSend(a1[4], "performChanges:", &__block_literal_global_521);
  v1 += 5;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "_updateUserTransformView");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setSettlingEffectToggleInProgress:", 0);

}

uint64_t __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reframeToSettlingEffectBoundsIfNeeded");
}

uint64_t __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSettlingEffectEnabled:", 1);
}

void __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke_2(uint64_t a1)
{
  id *v2;
  void (**v3)(_QWORD);
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke_3;
  v11 = &unk_1E58AB210;
  v2 = (id *)(a1 + 40);
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v12 = *(id *)(a1 + 32);
  v3 = (void (**)(_QWORD))_Block_copy(&v8);
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateUserTransformView", v8, v9, v10, v11);

  objc_msgSend(*(id *)(a1 + 32), "settlingEffectStateRestorationLayerStyleKind");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D75600]) & 1) == 0)
  {
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "_animateScrollToStyleKind:completion:", v6, v3);

  }
  else
  {
    v3[2](v3);
  }

  objc_destroyWeak(&v13);
}

void __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "editor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pu_updateLooks");

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke_4;
  v8[3] = &unk_1E58A15C8;
  v8[4] = &v9;
  objc_msgSend(v5, "performChanges:", v8);
  if (*((_BYTE *)v10 + 24))
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "_updateUserTransformView");

  }
  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "setSettlingEffectToggleInProgress:", 0);

  _Block_object_dispose(&v9, 8);
}

uint64_t __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "applySettlingEffectVisibleFrameRestoration");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSettlingEffectEnabled:", 0);
}

uint64_t __58__PUWallpaperPosterEditorController__playerItemDidFinish___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopSettlingEffectPreview");
}

uint64_t __65__PUWallpaperPosterEditorController__updateSettlingEffectEnabled__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSettlingEffectEnabled:", 0);
}

uint64_t __64__PUWallpaperPosterEditorController__stopSettlingEffectPreview___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __64__PUWallpaperPosterEditorController__stopSettlingEffectPreview___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0CA2E68];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v2, "seekToTime:", &v4);
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "_startSettlingEffectPreviewAfterDelay");
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __64__PUWallpaperPosterEditorController__startSettlingEffectPreview__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __59__PUWallpaperPosterEditorController__toggleStyleBackground__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStyle:", *(_QWORD *)(a1 + 32));
}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleStyleBackground");

}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleDepth");

}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleHeadroom");

}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_rejectSuggestionsForCurrentAsset");

}

BOOL __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentPosterMedia");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setIncludeGuestAssets:", 1);
    v6 = (void *)MEMORY[0x1E0CD1390];
    v11[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchAssetsWithLocalIdentifiers:options:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showPhotoInLibrary");

}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_wallpaperFeedbackRadar");

}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_tapToRadar");

}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_9(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "originalLayerStackViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "segmentationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_presentSettlingEffectDebugView:", v4);

}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_10(uint64_t a1)
{
  PUPosterSettingsController *v2;
  void *v3;
  PUPosterSettingsController *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = [PUPosterSettingsController alloc];
  +[PUPosterSettings sharedInstance](PUPosterSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUPosterSettingsController initWithRootSettings:](v2, "initWithRootSettings:", v3);

  -[PUPosterSettingsController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 2);
  objc_msgSend(MEMORY[0x1E0DC3C78], "mediumDetent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPosterSettingsController sheetPresentationController](v4, "sheetPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetents:", v6);

  v8 = *MEMORY[0x1E0DC5380];
  -[PUPosterSettingsController sheetPresentationController](v4, "sheetPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLargestUndimmedDetentIdentifier:", v8);

  -[PUPosterSettingsController sheetPresentationController](v4, "sheetPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", 1);

  -[PUPosterSettingsController sheetPresentationController](v4, "sheetPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPrefersEdgeAttachedInCompactHeight:", 1);

  objc_msgSend(*(id *)(a1 + 32), "editor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "presentViewController:animated:completion:", v4, 1, 0);

}

void __63__PUWallpaperPosterEditorController__toggleHighKeyLowKeyAction__block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  double v4;
  double v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  v4 = *(double *)(a1 + 32) * 0.5;
  v5 = *(double *)(a1 + 40) * 0.5;
  CGContextBeginPath(v3);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v5, *(double *)(a1 + 32) * 0.5, 0.0, 6.28318531);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextAddPath(v3, (CGPathRef)objc_msgSend(v9, "CGPath"));
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v6, "CGColor"));

  CGContextFillPath(v3);
  CGContextClosePath(v3);
  CGContextBeginPath(v3);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", *(unsigned __int8 *)(a1 + 56), v4, v5, *(double *)(a1 + 48) * 0.5, 1.57079633, 4.71238898);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextAddPath(v3, (CGPathRef)objc_msgSend(v7, "CGPath"));
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v8, "CGColor"));

  CGContextFillPath(v3);
  CGContextClosePath(v3);

}

void __63__PUWallpaperPosterEditorController__toggleHighKeyLowKeyAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setCurrentStyleIsHighKey:", *(_BYTE *)(a1 + 40) == 0);

}

void __55__PUWallpaperPosterEditorController__colorPickerAction__block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  id v4;
  CGRect v5;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSetFillColorWithColor(v3, *(CGColorRef *)(a1 + 32));
  CGContextSetLineWidth(v3, *(CGFloat *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(v3, (CGColorRef)objc_msgSend(v4, "CGColor"));

  v5.origin.x = *(CGFloat *)(a1 + 40);
  v5.size.width = *(CGFloat *)(a1 + 48);
  v5.origin.y = v5.origin.x;
  v5.size.height = v5.size.width;
  CGContextAddEllipseInRect(v3, v5);
  CGContextDrawPath(v3, kCGPathFillStroke);
}

void __55__PUWallpaperPosterEditorController__colorPickerAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentStyleColorPicker");

}

void __64__PUWallpaperPosterEditorController__toggleSettlingEffectAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_toggleSettlingEffectEnabled");

}

void __55__PUWallpaperPosterEditorController__photoPickerAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_pickAssets");

}

uint64_t __62__PUWallpaperPosterEditorController__updateCurrentStyleColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStyle:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__PUWallpaperPosterEditorController__updateCurrentStyleColor___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStyle:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__PUWallpaperPosterEditorController__updateCurrentStyleColor___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStyle:", *(_QWORD *)(a1 + 32));
}

id __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke(uint64_t a1, double a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D75170], "pu_parallaxColorWithHue:toneVariation:", *(double *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pu_UIColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_2(uint64_t a1, double a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D75170], "pu_parallaxColorWithHue:chroma:lumaVariation:", *(double *)(a1 + 32), *(double *)(a1 + 40), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pu_UIColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_3(uint64_t a1, double a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D75170], "pu_parallaxColorWithHue:chroma:lumaVariation:", *(double *)(a1 + 32), *(double *)(a1 + 40), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pu_UIColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  id WeakRetained;
  id v7;
  id v8;

  v8 = a2;
  getPRPosterColorClass();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "color");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v8;
  }
  v4 = v3;
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_updateCurrentStyleColor:", v4);

  v7 = objc_loadWeakRetained(v5);
  objc_msgSend(v7, "_updateEditToolbar");

}

id __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = objc_alloc((Class)getPRPosterColorClass());
  objc_msgSend(v2, "pu_UIColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v3, "initWithColor:preferredStyle:", v4, 1);
  return v5;
}

uint64_t __63__PUWallpaperPosterEditorController__setCurrentStyleIsHighKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStyle:", *(_QWORD *)(a1 + 32));
}

void __61__PUWallpaperPosterEditorController__startSimulatingParallax__block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained;
  void *v6;
  _QWORD v7[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentLayerStackViewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PUWallpaperPosterEditorController__startSimulatingParallax__block_invoke_2;
  v7[3] = &__block_descriptor_48_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
  *(double *)&v7[4] = a2;
  *(double *)&v7[5] = a3;
  objc_msgSend(v6, "performChanges:", v7);

}

uint64_t __61__PUWallpaperPosterEditorController__startSimulatingParallax__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setParallaxVector:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

uint64_t __52__PUWallpaperPosterEditorController__toggleHeadroom__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHeadroomEnabled:", *(_BYTE *)(a1 + 32) == 0);
}

void __49__PUWallpaperPosterEditorController__toggleDepth__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "editViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__PUWallpaperPosterEditorController__toggleDepth__block_invoke_2;
  v3[3] = &__block_descriptor_33_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8l;
  v4 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v2, "performChanges:", v3);

}

uint64_t __49__PUWallpaperPosterEditorController__toggleDepth__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDepthEnabled:", *(unsigned __int8 *)(a1 + 32));
}

void __59__PUWallpaperPosterEditorController__togglePerspectiveZoom__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setParallaxDisabled:", objc_msgSend(v2, "parallaxDisabled") ^ 1);

}

void __59__PUWallpaperPosterEditorController__perspectiveZoomAction__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_togglePerspectiveZoom");

}

uint64_t __82__PUWallpaperPosterEditorController_userTransformView_didChangeIsUserInteracting___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIsUserPanningOrZooming:", *(unsigned __int8 *)(a1 + 32));
}

void __102__PUWallpaperPosterEditorController_userTransformView_didChangeUserAffineTransform_isUserInteracting___block_invoke(double *a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;

  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a2;
  objc_msgSend(v6, "setNormalizedVisibleFrame:", v2, v3, v4, v5);
  objc_msgSend(v6, "userDidAdjustVisibleFrame");

}

void __66__PUWallpaperPosterEditorController_observable_didChange_context___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "hint");

  if (v3 == 4)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "_displayNextHint");

  }
}

void __66__PUWallpaperPosterEditorController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  void *v1;
  char v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "hint") == 3)
  {
    objc_msgSend(WeakRetained, "editViewModel");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "isUserPanningOrZooming");

    if ((v2 & 1) == 0)
      objc_msgSend(WeakRetained, "_showHintAnimated:completion:", 1, 0);
  }

}

uint64_t __66__PUWallpaperPosterEditorController__showHintAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __66__PUWallpaperPosterEditorController__showHintAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __66__PUWallpaperPosterEditorController__hideHintAnimated_completion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "hintLabel");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

uint64_t __66__PUWallpaperPosterEditorController__hideHintAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __62__PUWallpaperPosterEditorController__updateHintLabelAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showHintAnimated:completion:", *(unsigned __int8 *)(a1 + 40), 0);

}

void __99__PUWallpaperPosterEditorController__updateShuffleSuggestionFeaturedStateIfNeededForConfiguration___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setFeaturedState:", 1);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __58__PUWallpaperPosterEditorController_setShuffleAssetIndex___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_showHintAnimated:completion:", 1, 0);

}

uint64_t __118__PUWallpaperPosterEditorController_wallpaperPosterShuffleGridViewController_didFinishWithChange_selectedPosterMedia___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "assetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

id __118__PUWallpaperPosterEditorController_wallpaperPosterShuffleGridViewController_didFinishWithChange_selectedPosterMedia___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v2 = (void *)MEMORY[0x1E0CD1390];
  v3 = a2;
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuidFromLocalIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75210]), "initWithAssetUUID:", v6);
  v8 = (void *)MEMORY[0x1E0CB3830];
  v9 = objc_msgSend(v3, "changeType");
  v10 = objc_msgSend(v3, "index");
  v11 = objc_msgSend(v3, "associatedIndex");

  objc_msgSend(v8, "changeWithObject:type:index:associatedIndex:", v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __114__PUWallpaperPosterEditorController_wallpaperShuffleConfigurationViewController_didFinishWithPosterConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_didLoadMediaFromShuffleConfigurationViewController:succeeded:", *(_QWORD *)(a1 + 32), a2);

}

void __89__PUWallpaperPosterEditorController__reloadSmartAlbumPreviewAssetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setSmartAlbumPreviewReloadRequest:", 0);

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

void __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke(id *a1)
{
  id WeakRetained;
  _QWORD v3[5];
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke_2;
  v3[3] = &unk_1E58A6420;
  v3[4] = WeakRetained;
  v4 = a1[4];
  v5 = a1[5];
  objc_msgSend(WeakRetained, "_reloadSmartAlbumPreviewAssetsWithCompletionHandler:", v3);

}

void __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke_345(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLWallpaperGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Failed to reject asset suggestion for smart album shuffle, choosing replacement anyway. Error was: %{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "posterConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "media");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 40));
  v8 = (void *)MEMORY[0x1E0C99E60];
  PXMap();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  PXMap();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  PXSetSubtract();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v15, "removeObject:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "anyObject");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75210]), "initWithAssetUUID:", v16);
    PLWallpaperGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v21 = 138543362;
      v22 = v17;
      _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_INFO, "Replacing user-rejected asset with new poster media %{public}@", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend(v7, "addObject:", v17);
  }
  else
  {
    PLWallpaperGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEFAULT, "Could not find any new asset to replace user-rejected asset!", (uint8_t *)&v21, 2u);
    }
  }

  v19 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(*(id *)(a1 + 32), "posterConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMedia:", v19);

  objc_msgSend(*(id *)(a1 + 32), "_loadAssetFromPosterConfiguration");
}

uint64_t __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

uint64_t __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetUUID");
}

void __58__PUWallpaperPosterEditorController__shuffleFrequencyMenu__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "posterConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shuffleConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShuffleFrequency:", v1);

}

void __66__PUWallpaperPosterEditorController__updateSmartAlbumAvailability__block_invoke(uint64_t a1)
{
  char v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v2 = objc_msgSend(MEMORY[0x1E0D7BC08], "isAnySmartAlbumAvailableInPhotoLibrary:", *(_QWORD *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__PUWallpaperPosterEditorController__updateSmartAlbumAvailability__block_invoke_2;
  v3[3] = &unk_1E58AA4A0;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v5 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
}

void __66__PUWallpaperPosterEditorController__updateSmartAlbumAvailability__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(unsigned __int8 *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsAnySmartAlbumAvailable:", v1);

}

void __68__PUWallpaperPosterEditorController__presentSmartAlbumShuffleEditor__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "editor");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 1, 0);

}

void __63__PUWallpaperPosterEditorController__handlePhotoPickerResults___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_didLoadMediaFromPhotoPickerWithAssetUUID:succeeded:error:", v8, a2, v7);

}

uint64_t __59__PUWallpaperPosterEditorController__hideProgressIndicator__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __58__PUWallpaperPosterEditorController__hideLoadingIndicator__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __58__PUWallpaperPosterEditorController__hideLoadingIndicator__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopAnimating");
}

uint64_t __58__PUWallpaperPosterEditorController__hideLoadingIndicator__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIdleTimerDisabled:forReason:", 0, CFSTR("loading"));
}

uint64_t __58__PUWallpaperPosterEditorController__showLoadingIndicator__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __58__PUWallpaperPosterEditorController__showLoadingIndicator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIdleTimerDisabled:forReason:", 1, CFSTR("loading"));
}

void __79__PUWallpaperPosterEditorController__presentPosterConfigurationViewController___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "editor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 0, 0);

}

uint64_t __58__PUWallpaperPosterEditorController__presentLoadingError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didDismissLoadingErrorAlert");
}

uint64_t __67__PUWallpaperPosterEditorController__presentLoadingError_forAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didDismissLoadingErrorAlert");
}

void __49__PUWallpaperPosterEditorController__fadeInViews__block_invoke(uint64_t a1, double a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a2);

  objc_msgSend(*(id *)(a1 + 32), "foregroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", a2);

  objc_msgSend(*(id *)(a1 + 32), "floatingView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", a2);

}

uint64_t __49__PUWallpaperPosterEditorController__fadeInViews__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(1.0);
}

uint64_t __96__PUWallpaperPosterEditorController__handleSettlingEffectLoadedWithSegmentationItem_layerStack___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateSettlingEffectWithSegmentationItem:layerStack:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __97__PUWallpaperPosterEditorController__loadSettlingEffectLayerStackForSegmentationItem_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  objc_msgSend(a2, "result:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "statistics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Settling effect layer stack render stats: %{public}@", buf, 0xCu);

    }
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "layerStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Settling effect layer stack render failed: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __97__PUWallpaperPosterEditorController__loadSettlingEffectLayerStackForSegmentationItem_completion___block_invoke_267(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __85__PUWallpaperPosterEditorController__handleSettlingEffectLoadedWithSegmentationItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_handleSettlingEffectLoadedWithSegmentationItem:layerStack:", *(_QWORD *)(a1 + 32), v5);

  }
  else
  {
    PLWallpaperGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "Settling effect layer stack render error: %{public}@", (uint8_t *)&v9, 0xCu);
    }

  }
}

void __79__PUWallpaperPosterEditorController__renderInitialLayerStack_style_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  objc_msgSend(a2, "result:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  PLWallpaperGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "statistics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Initial layer stack render stats: %{public}@", buf, 0xCu);

    }
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "compoundLayerStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v4;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Initial layer stack render failed: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __79__PUWallpaperPosterEditorController__renderInitialLayerStack_style_completion___block_invoke_263(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __112__PUWallpaperPosterEditorController__loadEditViewModelWithSegmentationItem_compoundLayerStack_style_completion___block_invoke(uint64_t a1, void *a2)
{
  PUParallaxLayerStackViewModel *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  PUParallaxLayerStackViewModel *v7;
  PUWallpaperPosterEditViewModel *v8;
  id v9;

  v9 = a2;
  if (v9)
  {
    v3 = [PUParallaxLayerStackViewModel alloc];
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PUParallaxLayerStackViewModel initWithSegmentationItem:initialStyle:compoundLayerStack:deviceOrientation:](v3, "initWithSegmentationItem:initialStyle:compoundLayerStack:deviceOrientation:", v4, v5, v9, objc_msgSend(v6, "pu_deviceOrientation"));

    v8 = -[PUWallpaperPosterEditViewModel initWithInitialLayerStackViewModel:availableStyles:]([PUWallpaperPosterEditViewModel alloc], "initWithInitialLayerStackViewModel:availableStyles:", v7, *(_QWORD *)(a1 + 56));
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __101__PUWallpaperPosterEditorController__handleSegmentationItem_compoundLayerStack_style_forAsset_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_didFinishCreatingEditViewModel:forAsset:error:", v7, *(_QWORD *)(a1 + 32), v6);

}

void __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke(_QWORD *a1, void *a2, int a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _BOOL8 v11;
  id v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((~a3 & 0x84) == 0 && *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) == 0)
  {
    v5 = (id *)(a1 + 7);
    v6 = a2;
    WeakRetained = objc_loadWeakRetained(v5);
    objc_msgSend(WeakRetained, "_handleSegmentationItem:compoundLayerStack:style:forAsset:error:", v6, 0, 0, a1[4], 0);

    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    v8 = objc_msgSend(v6, "settlingEffectStatus");

    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v8;
    PLWallpaperGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      v13 = 134217984;
      v14 = v10;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "Partial item setting effect status: %ld", (uint8_t *)&v13, 0xCu);
    }

    v11 = (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) & 0xFFFFFFFFFFFFFFFDLL) == 0;
    v12 = objc_loadWeakRetained(v5);
    objc_msgSend(v12, "setLoadingSettlingEffect:", v11);

  }
}

void __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke_253(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke_2;
  block[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v11, (id *)(a1 + 72));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  if (objc_msgSend(*(id *)(a1 + 32), "_attemptedSettlingEffect"))
    objc_msgSend(*(id *)(a1 + 32), "_sendSettlingEffectGatingAnalyticsWithSegmentationItem:", v5);
  if (*(_BYTE *)(a1 + 88))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "_handleSegmentationItem:compoundLayerStack:style:forAsset:error:", v5, 0, 0, *(_QWORD *)(a1 + 40), 0);
LABEL_7:

    goto LABEL_8;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v8 != objc_msgSend(v5, "settlingEffectStatus"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "_handleSettlingEffectLoadedWithSegmentationItem:", v5);
    goto LABEL_7;
  }
LABEL_8:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  v9 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v9, "setSegmentationLoading:", 0);

  objc_destroyWeak(&v11);
}

void __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke_254(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleSegmentationItem:compoundLayerStack:style:forAsset:error:", 0, 0, 0, 0, 0);

}

void __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setLoadingSettlingEffect:", 0);

}

void __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  id *v11;
  id *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setSegmentationLoading:", 0);

  PLWallpaperGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v22 = v10;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_INFO, "Successfully reloaded cold-start segmentation item: %{public}@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke_244;
    block[3] = &unk_1E58AB210;
    v11 = &v20;
    objc_copyWeak(&v20, (id *)(a1 + 56));
    v12 = &v19;
    v19 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v22 = v13;
      v23 = 2114;
      v24 = v6;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Failed to reload cold-start segmentation item: %{public}@, error: %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke_245;
    v15[3] = &unk_1E58AB210;
    v11 = &v17;
    objc_copyWeak(&v17, (id *)(a1 + 56));
    v12 = &v16;
    v16 = *(id *)(a1 + 40);
    dispatch_async(v14, v15);

  }
  objc_destroyWeak(v11);

}

void __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke_247(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleSegmentationItem:compoundLayerStack:style:forAsset:error:", 0, 0, 0, 0, *(_QWORD *)(a1 + 32));

}

void __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke_244(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleSegmentationItem:compoundLayerStack:style:forAsset:error:", *(_QWORD *)(a1 + 32), 0, 0, 0, 0);

}

void __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke_245(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_loadAssetWithUUID:", *(_QWORD *)(a1 + 32));

}

void __69__PUWallpaperPosterEditorController__loadAssetUUID_fromWallpaperURL___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_reloadAssetUUID:fromWallpaperURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __70__PUWallpaperPosterEditorController__loadContentForCurrentPosterMedia__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;

  v9 = (id *)(a1 + 48);
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "_handleShuffleSegmentationItem:compoundLayerStack:editConfiguration:forPosterMedia:error:", v13, v12, v11, *(_QWORD *)(a1 + 32), v10);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

void __70__PUWallpaperPosterEditorController__loadContentForCurrentPosterMedia__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_loadAssetWithUUID:", *(_QWORD *)(a1 + 32));

}

void __67__PUWallpaperPosterEditorController__loadSourcePosterConfiguration__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id WeakRetained;

  v9 = (id *)(a1 + 32);
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = a2;
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "_handleUpdatedConfiguration:segmentationItem:compoundLayerStack:error:", v13, v11, v12, v10);

}

void __70__PUWallpaperPosterEditorController__loadAssetFromPosterConfiguration__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__PUWallpaperPosterEditorController__loadAssetFromPosterConfiguration__block_invoke_2;
  v13[3] = &unk_1E58A9F58;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  v14 = v8;
  v15 = v7;
  v16 = v9;
  v10 = v9;
  v11 = v7;
  v12 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

  objc_destroyWeak(&v17);
}

void __70__PUWallpaperPosterEditorController__loadAssetFromPosterConfiguration__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleSegmentationItem:compoundLayerStack:style:forAsset:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 48));

}

uint64_t __90__PUWallpaperPosterEditorController__updateViewForLayerID_usingViewManager_containerView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
}

void __73__PUWallpaperPosterEditorController__removeViewsFromLayerStackViewModel___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "removeFromSuperview", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __61__PUWallpaperPosterEditorController__updateDeviceOrientation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "environment");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceOrientation:", objc_msgSend(v4, "pu_deviceOrientation"));

}

uint64_t __58__PUWallpaperPosterEditorController__updateContainerFrame__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setContainerFrame:", a1[4], a1[5], a1[6], a1[7]);
}

uint64_t __90__PUWallpaperPosterEditorController__updateEditViewModelPropertiesFromPosterConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAppliesDepthToAllOrientations:", 1);
}

void __70__PUWallpaperPosterEditorController__loadEditViewModelAndUpdateLooks___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  if (*(_BYTE *)(a1 + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "editor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "pu_updateLooks");

  }
}

uint64_t __74__PUWallpaperPosterEditorController_initWithWallpaperEditor_photoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0D09910];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupWithConfigurationFilename:inBundle:", CFSTR("CPAnalyticsConfig-PhotosPosterProvider"), v3);

  objc_msgSend(MEMORY[0x1E0D09910], "setupSystemPropertyProvidersForLibrary:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D09910], "startAppTracking");
  objc_msgSend(MEMORY[0x1E0D09910], "startViewTracking");
  return objc_msgSend(MEMORY[0x1E0DC3470], "pu_prepareCPAnalytics");
}

uint64_t __74__PUWallpaperPosterEditorController_initWithWallpaperEditor_photoLibrary___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0D09910], "activateEventQueue");
}

+ (id)posterConfigurationFromPosterDescriptor:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D751F0]), "initWithConfigurationType:", objc_msgSend((id)objc_opt_class(), "posterConfigurationTypeForPosterType:", objc_msgSend(v3, "posterType")));
  if (objc_msgSend(v3, "descriptorType") == 2)
  {
    objc_msgSend(v3, "shuffleConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75230]), "initWithShuffleType:", 0);
      objc_msgSend(v5, "setShuffleFrequency:", *MEMORY[0x1E0D75740]);
      objc_msgSend(v5, "setShuffleSmartAlbums:", objc_msgSend(MEMORY[0x1E0D7BC08], "supportedTypes"));
    }
    objc_msgSend(v4, "setShuffleConfiguration:", v5);

  }
  return v4;
}

+ (int64_t)posterConfigurationTypeForPosterType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if (a3 == 2)
    return 1;
  if (!a3)
  {
    v13 = v4;
    v14 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v6, v5, v13, v14, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUWallpaperPosterEditorController.m"), 690, CFSTR("Unexpected poster descriptor type"));

    abort();
  }
  return 0;
}

+ (id)availableStylesForItem:(id)a3 posterConfiguration:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUWallpaperPosterEditorController.m"), 1232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("posterConfiguration"));

    }
    if (objc_msgSend(v9, "posterType") == 2)
      objc_msgSend(v7, "defaultStyles");
    else
      objc_msgSend(v7, "availableStyles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
