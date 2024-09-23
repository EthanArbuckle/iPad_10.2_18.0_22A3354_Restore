@implementation PUAssetViewModel

- (PUAssetViewModel)initWithLowMemoryMode:(BOOL)a3
{
  PUAssetViewModel *v4;
  PUAssetViewModel *v5;
  PUModelTileTransform *v6;
  PUModelTileTransform *modelTileTransform;
  uint64_t v8;
  NSHashTable *registeredVideoLayerSources;
  NSArray *highlightTimeRanges;
  PUAssetHighlightTimeRangesProducer *v11;
  void *v12;
  uint64_t v13;
  PUAssetHighlightTimeRangesProducer *highlightTimeRangesProducer;
  uint64_t v15;
  PXUpdater *updater;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PUAssetViewModel;
  v4 = -[PUViewModel init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_isZoomedIn = 0;
    v6 = -[PUModelTileTransform initWithNoUserInput]([PUModelTileTransform alloc], "initWithNoUserInput");
    modelTileTransform = v5->_modelTileTransform;
    v5->_modelTileTransform = v6;

    v5->_focusValue = 1.79769313e308;
    v5->_lowMemoryMode = a3;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    registeredVideoLayerSources = v5->_registeredVideoLayerSources;
    v5->_registeredVideoLayerSources = (NSHashTable *)v8;

    highlightTimeRanges = v5->_highlightTimeRanges;
    v5->_highlightTimeRanges = (NSArray *)MEMORY[0x1E0C9AA60];

    v11 = [PUAssetHighlightTimeRangesProducer alloc];
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PUAssetHighlightTimeRangesProducer initWithUseDummyHighlight:](v11, "initWithUseDummyHighlight:", objc_msgSend(v12, "insertDummyHighlightTimeRanges"));
    highlightTimeRangesProducer = v5->_highlightTimeRangesProducer;
    v5->_highlightTimeRangesProducer = (PUAssetHighlightTimeRangesProducer *)v13;

    -[PUAssetHighlightTimeRangesProducer setDelegate:](v5->_highlightTimeRangesProducer, "setDelegate:", v5);
    v5->_imageAnalysisInteractionHostMode = 1;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7CDA0]), "initWithTarget:", v5);
    updater = v5->_updater;
    v5->_updater = (PXUpdater *)v15;

    -[PXUpdater addUpdateSelector:needsUpdate:](v5->_updater, "addUpdateSelector:needsUpdate:", sel__updateHighlightTimeRangesProducer, 1);
    -[PXUpdater addUpdateSelector:needsUpdate:](v5->_updater, "addUpdateSelector:needsUpdate:", sel__updateShouldShowHighlightTimeRanges, 1);
    -[PXUpdater addUpdateSelector:](v5->_updater, "addUpdateSelector:", sel__updateMediaControllers);
    -[PXUpdater addUpdateSelector:](v5->_updater, "addUpdateSelector:", sel__updatePlayersLoadingAllowed);
    -[PXUpdater addUpdateSelector:](v5->_updater, "addUpdateSelector:", sel__updateAccessoryViewVisibilityFraction);
    -[PXUpdater addUpdateSelector:needsUpdate:](v5->_updater, "addUpdateSelector:needsUpdate:", sel__updateInteractionHostMode, 1);
  }
  return v5;
}

- (PUAssetViewModel)init
{
  return -[PUAssetViewModel initWithLowMemoryMode:](self, "initWithLowMemoryMode:", 0);
}

- (void)dealloc
{
  objc_super v3;

  PXDeferredDealloc();
  v3.receiver = self;
  v3.super_class = (Class)PUAssetViewModel;
  -[PUAssetViewModel dealloc](&v3, sel_dealloc);
}

- (void)setVideoAutoplayPredicate:(id)a3
{
  void *v4;
  id videoAutoplayPredicate;

  if (self->_videoAutoplayPredicate != a3)
  {
    v4 = _Block_copy(a3);
    videoAutoplayPredicate = self->_videoAutoplayPredicate;
    self->_videoAutoplayPredicate = v4;

    -[PUAssetViewModel _updateMediaControllers](self, "_updateMediaControllers");
  }
}

- (BOOL)allowAutoplayVideoForAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  char v7;
  BOOL v8;

  v4 = a3;
  -[PUAssetViewModel videoAutoplayPredicate](self, "videoAutoplayPredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUAssetViewModel videoAutoplayPredicate](self, "videoAutoplayPredicate");
    v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v4);
  }
  else
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "allowAutoplayVideoForAsset:", v4);
  }
  v8 = v7;

  return v8;
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUAssetViewModelChange);
}

- (PUAssetViewModelChange)currentChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAssetViewModel;
  -[PUViewModel currentChange](&v3, sel_currentChange);
  return (PUAssetViewModelChange *)(id)objc_claimAutoreleasedReturnValue();
}

- (PUAssetViewModelChange)currentChangeIfExists
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAssetViewModel;
  -[PUViewModel currentChangeIfExists](&v3, sel_currentChangeIfExists);
  return (PUAssetViewModelChange *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)didPerformChanges
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAssetViewModel;
  -[PUViewModel didPerformChanges](&v5, sel_didPerformChanges);
  -[PUAssetViewModel updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

  -[PUAssetViewModel currentChangeIfExists](self, "currentChangeIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "contentOffsetChanged"))
  {
    -[PUAssetViewModel contentOffset](self, "contentOffset");
    kdebug_trace();
  }

}

- (void)registerChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAssetViewModel;
  -[PUViewModel registerChangeObserver:](&v3, sel_registerChangeObserver_, a3);
}

- (void)unregisterChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUAssetViewModel;
  -[PUViewModel unregisterChangeObserver:](&v3, sel_unregisterChangeObserver_, a3);
}

- (void)setAsset:(id)a3
{
  PUDisplayAsset *v5;
  PUDisplayAsset *asset;
  PUDisplayAsset *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PUDisplayAsset *v13;
  id v14;
  PUDisplayAsset *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  PUDisplayAsset *v20;
  _QWORD v21[4];
  id v22;
  PUDisplayAsset *v23;
  _QWORD v24[4];
  id v25;
  PUDisplayAsset *v26;

  v5 = (PUDisplayAsset *)a3;
  asset = self->_asset;
  if (asset != v5)
  {
    v7 = asset;
    v8 = -[PUDisplayAsset isContentEqualTo:](v5, "isContentEqualTo:", v7);
    if (!v8)
      v8 = -[PUDisplayAsset isContentEqualTo:](v7, "isContentEqualTo:", v5);

    if (v8 != 2)
    {
      -[PUAssetViewModel currentChange](self, "currentChange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setAssetContentChanged:", 1);

    }
    objc_storeStrong((id *)&self->_asset, a3);
    -[PUAssetViewModel currentChange](self, "currentChange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setAssetChanged:", 1);

    -[PUAssetViewModel setIsFavoriteOverride:](self, "setIsFavoriteOverride:", 0);
    -[PUAssetViewModel _updateFavoriteState](self, "_updateFavoriteState");
    -[PUAssetViewModel setAssetSyndicationStateOverride:](self, "setAssetSyndicationStateOverride:", 0);
    -[PUAssetViewModel _invalidateMediaControllers](self, "_invalidateMediaControllers");
    -[PUAssetViewModel videoPlayer](self, "videoPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __29__PUAssetViewModel_setAsset___block_invoke;
    v24[3] = &unk_1E58ABCA8;
    v25 = v11;
    v13 = v5;
    v26 = v13;
    v14 = v11;
    objc_msgSend(v14, "performChanges:", v24);
    -[PUAssetViewModel irisPlayer](self, "irisPlayer");
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __29__PUAssetViewModel_setAsset___block_invoke_2;
    v21[3] = &unk_1E58ABCA8;
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v23 = v15;
    v16 = v22;
    objc_msgSend(v16, "performChanges:", v21);
    -[PUAssetViewModel animatedImagePlayer](self, "animatedImagePlayer");
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __29__PUAssetViewModel_setAsset___block_invoke_3;
    v18[3] = &unk_1E58ABCA8;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = v15;
    v17 = v19;
    objc_msgSend(v17, "performChanges:", v18);

  }
}

- (void)setMediaProvider:(id)a3
{
  PUMediaProvider *v5;
  void *v6;
  PUMediaProvider *v7;

  v5 = (PUMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    -[PUAssetViewModel currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHasChanges");

    -[PUAssetViewModel _invalidateMediaControllers](self, "_invalidateMediaControllers");
    v5 = v7;
  }

}

- (void)setUserTransformingTile:(BOOL)a3
{
  id v3;

  if (self->_isUserTransformingTile != a3)
  {
    self->_isUserTransformingTile = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setUserTransformingTileDidChange:", 1);

  }
}

- (void)setFocusValue:(double)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v10;
  double Current;
  _QWORD v12[4];
  id v13;

  if (self->_focusValue == a3)
    return;
  self->_focusValue = a3;
  -[PUAssetViewModel currentChange](self, "currentChange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setFocusValueChanged:", 1);

  v6 = fabs(a3);
  -[PUAssetViewModel setIsFullyInFocus:](self, "setIsFullyInFocus:", v6 <= 0.01);
  -[PUAssetViewModel setIsFullyOutOfFocus:](self, "setIsFullyOutOfFocus:", v6 >= 1.0);
  -[PUAssetViewModel irisPlayer](self, "irisPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 >= 0.5 && v7 != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __34__PUAssetViewModel_setFocusValue___block_invoke;
    v12[3] = &unk_1E58ABD10;
    v13 = v7;
    objc_msgSend(v13, "performChanges:", v12);

  }
  if (a3 == 0.0)
  {
    -[PUAssetViewModel focusValueAtZeroTimestamp](self, "focusValueAtZeroTimestamp");
    if (v10 == 0.0)
    {
      Current = CFAbsoluteTimeGetCurrent();
LABEL_11:
      -[PUAssetViewModel setFocusValueAtZeroTimestamp:](self, "setFocusValueAtZeroTimestamp:", Current);
      goto LABEL_12;
    }
  }
  Current = 0.0;
  if (v6 > 0.75)
    goto LABEL_11;
LABEL_12:
  -[PUAssetViewModel _invalidateVideoPlayersLoadingAllowed](self, "_invalidateVideoPlayersLoadingAllowed", Current);
  -[PUAssetViewModel _invalidateMediaControllers](self, "_invalidateMediaControllers");
  if (v6 > 1.0)
  {
    -[PUAssetViewModel setVisualImageAnalysis:](self, "setVisualImageAnalysis:", 0);
    -[PUAssetViewModel setBestImage:](self, "setBestImage:", 0);
  }

}

- (void)setIsFullyInFocus:(BOOL)a3
{
  id v4;

  if (self->_isFullyInFocus != a3)
  {
    self->_isFullyInFocus = a3;
    if (!a3)
      -[PUAssetViewModel setHasAutoplayedVideoSinceBecomingFocused:](self, "setHasAutoplayedVideoSinceBecomingFocused:", 0);
    -[PUAssetViewModel currentChange](self, "currentChange");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsFullyInFocusChanged:", 1);

  }
}

- (void)setIsFullyOutOfFocus:(BOOL)a3
{
  id v3;

  if (self->_isFullyOutOfFocus != a3)
  {
    self->_isFullyOutOfFocus = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsFullyOutOfFocusChanged:", 1);

  }
}

- (void)setBadgeInfoPromise:(id)a3
{
  PUBadgeInfoPromise *v4;
  PUBadgeInfoPromise *v5;
  BOOL v6;
  PUBadgeInfoPromise *v7;
  PUBadgeInfoPromise *badgeInfoPromise;
  void *v9;
  PUBadgeInfoPromise *v10;

  v4 = (PUBadgeInfoPromise *)a3;
  v5 = v4;
  if (self->_badgeInfoPromise != v4)
  {
    v10 = v4;
    v6 = -[PUBadgeInfoPromise isEqual:](v4, "isEqual:");
    v5 = v10;
    if (!v6)
    {
      v7 = (PUBadgeInfoPromise *)-[PUBadgeInfoPromise copy](v10, "copy");
      badgeInfoPromise = self->_badgeInfoPromise;
      self->_badgeInfoPromise = v7;

      -[PUAssetViewModel currentChange](self, "currentChange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setBadgeInfoChanged:", 1);

      v5 = v10;
    }
  }

}

- (void)setIsFavoriteOverride:(id)a3
{
  NSNumber *v4;
  NSNumber *isFavoriteOverride;
  NSNumber *v6;
  NSNumber *v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD block[4];
  id v11[2];
  id location;

  v4 = (NSNumber *)a3;
  isFavoriteOverride = self->_isFavoriteOverride;
  if (isFavoriteOverride != v4 && (-[NSNumber isEqual:](isFavoriteOverride, "isEqual:", v4) & 1) == 0)
  {
    v6 = (NSNumber *)-[NSNumber copy](v4, "copy");
    v7 = self->_isFavoriteOverride;
    self->_isFavoriteOverride = v6;

    -[PUAssetViewModel _updateFavoriteState](self, "_updateFavoriteState");
    v8 = (void *)(-[PUAssetViewModel _currentFavoriteOverrideRequest](self, "_currentFavoriteOverrideRequest") + 1);
    -[PUAssetViewModel _setCurrentFavoriteOverrideRequest:](self, "_setCurrentFavoriteOverrideRequest:", v8);
    objc_initWeak(&location, self);
    v9 = dispatch_time(0, 30000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__PUAssetViewModel_setIsFavoriteOverride___block_invoke;
    block[3] = &unk_1E58A79B8;
    objc_copyWeak(v11, &location);
    v11[1] = v8;
    dispatch_after(v9, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }

}

- (void)setAssetSyndicationStateOverride:(id)a3
{
  id v5;
  NSNumber **p_assetSyndicationStateOverride;
  uint64_t v7;
  uint64_t v8;
  NSNumber *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_assetSyndicationStateOverride = &self->_assetSyndicationStateOverride;
  if ((-[NSNumber isEqual:](self->_assetSyndicationStateOverride, "isEqual:", v5) & 1) == 0)
  {
    if (!v5)
    {
      v9 = *p_assetSyndicationStateOverride;
      *p_assetSyndicationStateOverride = 0;

      v8 = 0;
      goto LABEL_6;
    }
    v7 = objc_msgSend(v5, "integerValue");
    if ((unint64_t)(v7 - 1) < 4)
    {
      objc_storeStrong((id *)&self->_assetSyndicationStateOverride, a3);
      v8 = objc_msgSend(v5, "integerValue");
LABEL_6:
      -[PUAssetViewModel _setAssetSyndicationState:](self, "_setAssetSyndicationState:", v8);
      goto LABEL_10;
    }
    v10 = v7;
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 134217984;
      v13 = v10;
      _os_log_error_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "PUAssetViewModel syndication state override is not valid: %ld", (uint8_t *)&v12, 0xCu);
    }

  }
LABEL_10:

}

- (void)_setFavorite:(BOOL)a3
{
  id v3;

  if (self->_isFavorite != a3)
  {
    self->_isFavorite = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setIsFavoriteChanged:", 1);

  }
}

- (void)_setAssetSyndicationState:(int64_t)a3
{
  id v3;

  if (self->_assetSyndicationState != a3)
  {
    self->_assetSyndicationState = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAssetSyndicationStateChanged:", 1);

  }
}

- (void)setLoadingStatus:(id)a3
{
  PXOperationStatus *v4;
  void *v5;
  char v6;
  PXOperationStatus *v7;
  PXOperationStatus *loadingStatus;
  PXOperationStatus *v9;

  v9 = (PXOperationStatus *)a3;
  v4 = self->_loadingStatus;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[PXOperationStatus isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (PXOperationStatus *)-[PXOperationStatus copy](v9, "copy");
    loadingStatus = self->_loadingStatus;
    self->_loadingStatus = v7;

    -[PUAssetViewModel currentChange](self, "currentChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setLoadingStatusChanged:", 1);
LABEL_4:

  }
}

- (void)setSaveProgress:(id)a3
{
  NSProgress *v5;
  void *v6;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  if (self->_saveProgress != v5)
  {
    v7 = v5;
    kdebug_trace();
    objc_storeStrong((id *)&self->_saveProgress, a3);
    -[PUAssetViewModel currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setSaveProgressChanged:", 1);

    v5 = v7;
  }

}

- (void)setSaveState:(int64_t)a3
{
  id v3;

  if (self->_saveState != a3)
  {
    self->_saveState = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setSaveStateChanged:", 1);

  }
}

- (void)setImportState:(int64_t)a3
{
  id v3;

  if (self->_importState != a3)
  {
    self->_importState = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setImportStateChanged:", 1);

  }
}

- (void)setIsScrubbing:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (self->_isScrubbing != a3)
  {
    self->_isScrubbing = a3;
    if (a3)
    {
      if (!self->_assetSyndicationState)
      {
        -[PUAssetViewModel assetSyndicationStateOverride](self, "assetSyndicationStateOverride");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v4)
          -[PUAssetViewModel setAssetSyndicationStateOverride:](self, "setAssetSyndicationStateOverride:", &unk_1E59BAE00);
      }
    }
    else
    {
      objc_initWeak(&location, self);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __35__PUAssetViewModel_setIsScrubbing___block_invoke;
      v5[3] = &unk_1E58AB2F8;
      objc_copyWeak(&v6, &location);
      dispatch_async(MEMORY[0x1E0C80D38], v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_handleDidEndScrubbing
{
  _QWORD v3[5];

  if (!-[PUAssetViewModel isScrubbing](self, "isScrubbing"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __42__PUAssetViewModel__handleDidEndScrubbing__block_invoke;
    v3[3] = &unk_1E58ABD10;
    v3[4] = self;
    -[PUViewModel performChanges:](self, "performChanges:", v3);
  }
}

- (void)_invalidateVideoPlayersLoadingAllowed
{
  id v2;

  -[PUAssetViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePlayersLoadingAllowed);

}

- (void)_updatePlayersLoadingAllowed
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  BOOL v16;

  -[PUAssetViewModel focusValue](self, "focusValue");
  v4 = fabs(v3);
  if (v4 > 0.25)
    v5 = 1;
  else
    v5 = 2;
  -[PUAssetViewModel irisPlayer](self, "irisPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__PUAssetViewModel__updatePlayersLoadingAllowed__block_invoke;
  v13[3] = &unk_1E58AA4F0;
  v16 = v4 > 1.1;
  v14 = v6;
  v15 = v5;
  v8 = v6;
  objc_msgSend(v8, "performChanges:", v13);
  -[PUAssetViewModel animatedImagePlayer](self, "animatedImagePlayer");
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __48__PUAssetViewModel__updatePlayersLoadingAllowed__block_invoke_2;
  v10[3] = &unk_1E58AAD68;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v4 > 0.25;
  v9 = v11;
  objc_msgSend(v9, "performChanges:", v10);

}

- (void)_invalidateMediaControllers
{
  id v2;

  -[PUAssetViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateMediaControllers);

}

- (void)_updateMediaControllers
{
  void *v3;
  double v4;
  double v5;
  BOOL v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  float v19;
  float v20;
  void *v21;
  PUBrowsingIrisPlayer *v22;
  void *v23;
  PUBrowsingIrisPlayer *v24;
  PUBrowsingIrisPlayer *v25;
  PUBrowsingAnimatedImagePlayer *animatedImagePlayer;
  PUBrowsingAnimatedImagePlayer *v27;
  void *v28;
  PUBrowsingAnimatedImagePlayer *v29;
  PUBrowsingAnimatedImagePlayer *v30;
  PUBrowsingAnimatedImagePlayer *v31;
  _QWORD v32[4];
  PUBrowsingIrisPlayer *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  PUAssetViewModel *v37;
  float v38;

  -[PUAssetViewModel asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetViewModel focusValue](self, "focusValue");
  v5 = fabs(v4);
  v6 = v5 < 1.0 && objc_msgSend(v3, "playbackStyle") == 5;
  v7 = 0;
  if (!-[PUAssetViewModel lowMemoryMode](self, "lowMemoryMode") && !v6)
  {
    -[PUAssetViewModel mediaProvider](self, "mediaProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((objc_msgSend(v3, "canPlayPhotoIris") & 1) != 0)
        v7 = 1;
      else
        v7 = objc_msgSend(v3, "isPhotoIrisPlaceholder");
    }
    else
    {
      v7 = 0;
    }

  }
  if (v5 >= 1.0)
  {
    v11 = 0;
  }
  else
  {
    -[PUAssetViewModel mediaProvider](self, "mediaProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && objc_msgSend(v3, "isAnimatedImage"))
    {
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "allowGIFPlayback");

    }
    else
    {
      v11 = 0;
    }

  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetViewModel videoPlayer](self, "videoPlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "videoPauseThreshold");
    v15 = v5 / v14;
    v16 = 1.0 - v15;
    v17 = v15 <= 1.0;
    v18 = 0.0;
    if (v17)
      v18 = v16;
    v19 = v18;
    v20 = v19 * v19;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __43__PUAssetViewModel__updateMediaControllers__block_invoke;
    v34[3] = &unk_1E589CF80;
    v35 = v13;
    v38 = v20;
    v36 = v3;
    v37 = self;
    objc_msgSend(v35, "performChanges:", v34);
    -[PUAssetViewModel _updateVideoPlaybackStartTime](self, "_updateVideoPlaybackStartTime");

  }
  if (v7)
  {
    -[PUAssetViewModel irisPlayer](self, "irisPlayer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v22 = [PUBrowsingIrisPlayer alloc];
      -[PUAssetViewModel mediaProvider](self, "mediaProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[PUBrowsingIrisPlayer initWithAsset:mediaProvider:](v22, "initWithAsset:mediaProvider:", v3, v23);

      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __43__PUAssetViewModel__updateMediaControllers__block_invoke_3;
      v32[3] = &unk_1E58ABD10;
      v33 = v24;
      v25 = v24;
      -[PUViewModel performChanges:](v25, "performChanges:", v32);
      -[PUAssetViewModel setIrisPlayer:](self, "setIrisPlayer:", v25);

    }
  }
  else
  {
    -[PUAssetViewModel setIrisPlayer:](self, "setIrisPlayer:", 0);
  }
  animatedImagePlayer = self->_animatedImagePlayer;
  if (v11)
  {
    if (!animatedImagePlayer)
    {
      v27 = [PUBrowsingAnimatedImagePlayer alloc];
      -[PUAssetViewModel mediaProvider](self, "mediaProvider");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[PUBrowsingAnimatedImagePlayer initWithAsset:mediaProvider:](v27, "initWithAsset:mediaProvider:", v3, v28);
      v30 = self->_animatedImagePlayer;
      self->_animatedImagePlayer = v29;

      -[PUViewModel registerChangeObserver:](self->_animatedImagePlayer, "registerChangeObserver:", self);
    }
  }
  else
  {
    -[PUViewModel unregisterChangeObserver:](animatedImagePlayer, "unregisterChangeObserver:", self);
    v31 = self->_animatedImagePlayer;
    self->_animatedImagePlayer = 0;

  }
}

- (void)setVideoPlayer:(id)a3
{
  PUBrowsingVideoPlayer *v5;
  PUBrowsingVideoPlayer *videoPlayer;
  void *v7;
  PUBrowsingVideoPlayer *v8;

  v5 = (PUBrowsingVideoPlayer *)a3;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    v8 = v5;
    -[PUBrowsingVideoPlayer unregisterChangeObserver:](videoPlayer, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    -[PUBrowsingVideoPlayer registerChangeObserver:](self->_videoPlayer, "registerChangeObserver:", self);
    -[PUAssetViewModel currentChange](self, "currentChange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVideoPlayerDidChange:", 1);

    -[PUAssetViewModel _invalidateMediaControllers](self, "_invalidateMediaControllers");
    -[PUAssetViewModel _invalidateVideoPlayersLoadingAllowed](self, "_invalidateVideoPlayersLoadingAllowed");
    v5 = v8;
  }

}

- (void)setIrisPlayer:(id)a3
{
  PUBrowsingIrisPlayer *v5;
  PUBrowsingIrisPlayer *irisPlayer;
  void *v7;
  PUBrowsingIrisPlayer *v8;

  v5 = (PUBrowsingIrisPlayer *)a3;
  irisPlayer = self->_irisPlayer;
  if (irisPlayer != v5)
  {
    v8 = v5;
    -[PUBrowsingIrisPlayer unregisterChangeObserver:](irisPlayer, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_irisPlayer, a3);
    -[PUBrowsingIrisPlayer registerChangeObserver:](self->_irisPlayer, "registerChangeObserver:", self);
    -[PUAssetViewModel currentChange](self, "currentChange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIrisPlayerChanged:", 1);

    -[PUAssetViewModel _invalidateVideoPlayersLoadingAllowed](self, "_invalidateVideoPlayersLoadingAllowed");
    v5 = v8;
  }

}

- (void)setImageAnalysisInteraction:(id)a3
{
  PUImageAnalysisInteraction *v5;
  PUImageAnalysisInteraction **p_imageAnalysisInteraction;
  PUImageAnalysisInteraction *imageAnalysisInteraction;
  PUAssetViewModel *v8;
  PUImageAnalysisInteraction *v9;

  v5 = (PUImageAnalysisInteraction *)a3;
  p_imageAnalysisInteraction = &self->_imageAnalysisInteraction;
  imageAnalysisInteraction = self->_imageAnalysisInteraction;
  if (imageAnalysisInteraction != v5)
  {
    v9 = v5;
    -[PUImageAnalysisInteraction assetViewModel](imageAnalysisInteraction, "assetViewModel");
    v8 = (PUAssetViewModel *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[PUImageAnalysisInteraction setAssetViewModel:](*p_imageAnalysisInteraction, "setAssetViewModel:", 0);
    objc_storeStrong((id *)&self->_imageAnalysisInteraction, a3);
    -[PUImageAnalysisInteraction setAssetViewModel:](*p_imageAnalysisInteraction, "setAssetViewModel:", self);
    -[PUAssetViewModel _updateImageAnalysisInteractionHostView](self, "_updateImageAnalysisInteractionHostView");
    v5 = v9;
  }

}

- (void)_updateHighlightTimeRangesProducer
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  -[PUAssetViewModel asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  -[PUAssetViewModel highlightTimeRangesProducer](self, "highlightTimeRangesProducer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAsset:", v4);

  -[PUAssetViewModel searchQueryMatchInfo](self, "searchQueryMatchInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAssetViewModel highlightTimeRangesProducer](self, "highlightTimeRangesProducer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSearchQueryMatchInfo:", v7);

}

- (void)_handleHighlightTimeRangesResult:(id)a3 forAsset:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  -[PUAssetViewModel asset](self, "asset");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__PUAssetViewModel__handleHighlightTimeRangesResult_forAsset___block_invoke;
    v9[3] = &unk_1E58ABCA8;
    v9[4] = self;
    v10 = v6;
    -[PUViewModel performChanges:](self, "performChanges:", v9);

  }
}

- (void)setHighlightTimeRanges:(id)a3
{
  NSArray *v4;
  void *v5;
  char v6;
  NSArray *v7;
  NSArray *highlightTimeRanges;
  NSArray *v9;

  v9 = (NSArray *)a3;
  v4 = self->_highlightTimeRanges;
  v5 = v9;
  if (v4 == v9)
    goto LABEL_4;
  v6 = -[NSArray isEqual:](v9, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSArray *)-[NSArray copy](v9, "copy");
    highlightTimeRanges = self->_highlightTimeRanges;
    self->_highlightTimeRanges = v7;

    -[PUAssetViewModel _invalidateShouldShowHighlightTimeRanges](self, "_invalidateShouldShowHighlightTimeRanges");
    -[PUAssetViewModel _updateVideoPlaybackStartTime](self, "_updateVideoPlaybackStartTime");
    -[PUAssetViewModel currentChange](self, "currentChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlightTimeRangesChanged:", 1);
LABEL_4:

  }
}

- (void)_invalidateShouldShowHighlightTimeRanges
{
  id v2;

  -[PUAssetViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateShouldShowHighlightTimeRanges);

}

- (void)_updateShouldShowHighlightTimeRanges
{
  void *v3;
  void *v4;
  void *v5;
  double Seconds;
  Float64 v7;
  void *v8;
  Float64 v9;
  _BOOL8 v10;
  CMTime v11;
  CMTime time;
  CMTime v13;

  -[PUAssetViewModel highlightTimeRanges](self, "highlightTimeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v13, 0, sizeof(v13));
  -[PUAssetViewModel videoPlayer](self, "videoPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "duration");
  else
    memset(&v13, 0, sizeof(v13));

  if ((v13.flags & 0x1D) == 1 && objc_msgSend(v3, "count"))
  {
    time = v13;
    Seconds = CMTimeGetSeconds(&time);
    PXCMTimeRangeCombinedDuration();
    v7 = CMTimeGetSeconds(&v11) / Seconds;
    objc_msgSend(MEMORY[0x1E0D7BBB8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maxHighlightFractionForDisplay");
    v10 = v7 <= v9;

  }
  else
  {
    v10 = 0;
  }
  -[PUAssetViewModel setShouldShowHighlightTimeRanges:](self, "setShouldShowHighlightTimeRanges:", v10);

}

- (void)setShouldShowHighlightTimeRanges:(BOOL)a3
{
  id v3;

  if (self->_shouldShowHighlightTimeRanges != a3)
  {
    self->_shouldShowHighlightTimeRanges = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setShouldShowHighlightTimeRangesChanged:", 1);

  }
}

- (void)setSearchQueryMatchInfo:(id)a3
{
  PXSearchQueryMatchInfo *v4;
  PXSearchQueryMatchInfo *searchQueryMatchInfo;
  char v6;
  PXSearchQueryMatchInfo *v7;
  PXSearchQueryMatchInfo *v8;

  v8 = (PXSearchQueryMatchInfo *)a3;
  v4 = self->_searchQueryMatchInfo;
  searchQueryMatchInfo = v8;
  if (v4 == v8)
    goto LABEL_4;
  v6 = -[PXSearchQueryMatchInfo isEqual:](v8, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = v8;
    searchQueryMatchInfo = self->_searchQueryMatchInfo;
    self->_searchQueryMatchInfo = v7;
LABEL_4:

  }
}

- (void)setIsDisplayingSearchQueryLabel:(BOOL)a3
{
  id v3;

  if (self->_isDisplayingSearchQueryLabel != a3)
  {
    self->_isDisplayingSearchQueryLabel = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsDisplayingSearchQueryLabelChanged:", 1);

  }
}

- (void)registerVideoLayerSource:(id)a3
{
  -[NSHashTable addObject:](self->_registeredVideoLayerSources, "addObject:", a3);
}

- (void)unregisterVideoLayerSource:(id)a3
{
  -[NSHashTable removeObject:](self->_registeredVideoLayerSources, "removeObject:", a3);
}

- (PUVideoLayerSource)primaryVideoLayerSource
{
  NSHashTable *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_registeredVideoLayerSources;
  v3 = (id)-[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v6, "isOnSecondScreen", (_QWORD)v8))
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)-[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (PUVideoLayerSource *)v3;
}

- (void)setIsZoomedIn:(BOOL)a3
{
  id v3;

  if (self->_isZoomedIn != a3)
  {
    self->_isZoomedIn = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsZoomedInChanged:", 1);

  }
}

- (void)setModelTileTransform:(id)a3
{
  PUModelTileTransform *v4;
  PUModelTileTransform *v5;
  PUModelTileTransform *v6;
  PUModelTileTransform *modelTileTransform;
  NSObject *v8;
  void *v9;
  int v10;
  PUAssetViewModel *v11;
  __int16 v12;
  PUModelTileTransform *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (PUModelTileTransform *)a3;
  v5 = v4;
  if (self->_modelTileTransform != v4 && !-[PUModelTileTransform isEqual:](v4, "isEqual:"))
  {
    v6 = (PUModelTileTransform *)-[PUModelTileTransform copy](v5, "copy");
    modelTileTransform = self->_modelTileTransform;
    self->_modelTileTransform = v6;

    PLOneUpGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = 134218242;
      v11 = self;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEBUG, "%p modelTileTransform=%@", (uint8_t *)&v10, 0x16u);
    }

    -[PUAssetViewModel currentChange](self, "currentChange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setModelTileTransformChanged:", 1);

  }
}

- (void)setContentOffsetForAccessoryFullyVisible:(CGPoint)a3
{
  if (a3.x != self->_contentOffsetForAccessoryFullyVisible.x || a3.y != self->_contentOffsetForAccessoryFullyVisible.y)
  {
    self->_contentOffsetForAccessoryFullyVisible = a3;
    -[PUAssetViewModel _updateAccessoryViewVisibilityFraction](self, "_updateAccessoryViewVisibilityFraction");
  }
}

- (void)_invalidateAccessoryViewVisibilityFraction
{
  id v2;

  -[PUAssetViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateAccessoryViewVisibilityFraction);

}

- (void)_updateAccessoryViewVisibilityFraction
{
  double v3;
  double v4;
  double v6;
  double v7;
  double v8;

  -[PUAssetViewModel contentOffsetForAccessoryFullyVisible](self, "contentOffsetForAccessoryFullyVisible");
  if (v4 == *MEMORY[0x1E0C9D538] && v3 == *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    v8 = (double)-[PUAssetViewModel isAccessoryViewVisible](self, "isAccessoryViewVisible");
  }
  else
  {
    PXPointDistanceFromOrigin();
    v7 = v6;
    v8 = 0.0;
    if (v7 != 0.0)
    {
      -[PUAssetViewModel contentOffset](self, "contentOffset", 0.0);
      PXPointDistanceFromOrigin();
      PXClamp();
    }
  }
  -[PUAssetViewModel setAccessoryViewVisibilityFraction:](self, "setAccessoryViewVisibilityFraction:", v8);
}

- (void)setAccessoryViewVisibilityFraction:(double)a3
{
  id v4;

  if (self->_accessoryViewVisibilityFraction != a3)
  {
    self->_accessoryViewVisibilityFraction = a3;
    -[PUAssetViewModel _invalidateInteractionHostMode](self, "_invalidateInteractionHostMode");
    -[PUAssetViewModel currentChange](self, "currentChange");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessoryViewVisibilityFractionChanged:", 1);

  }
}

- (void)setAccessoryViewVisible:(BOOL)a3
{
  -[PUAssetViewModel setAccessoryViewVisible:changeReason:](self, "setAccessoryViewVisible:changeReason:", a3, 0);
}

- (void)setAccessoryViewVisible:(BOOL)a3 changeReason:(int64_t)a4
{
  void *v6;

  if (self->_accessoryViewVisible != a3)
  {
    self->_accessoryViewVisible = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setAccessoryViewVisibilityChanged:", 1);

    -[PUAssetViewModel _setLastAccessoryViewVisibilityChangeReason:](self, "_setLastAccessoryViewVisibilityChangeReason:", a4);
    -[PUAssetViewModel _invalidateAccessoryViewVisibilityFraction](self, "_invalidateAccessoryViewVisibilityFraction");
  }
}

- (BOOL)isLastAccessoryViewVisibilityChangeReasonUserAction
{
  return (unint64_t)(-[PUAssetViewModel lastAccessoryViewVisibilityChangeReason](self, "lastAccessoryViewVisibilityChangeReason")- 1) < 2;
}

- (CGPoint)contentOffset
{
  double v3;
  double v4;
  double v5;
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
  CGPoint result;

  -[PUAssetViewModel preferredContentOffset](self, "preferredContentOffset");
  v4 = v3;
  v6 = v5;
  -[PUAssetViewModel overridingContentOffset](self, "overridingContentOffset");
  v8 = v7;
  v10 = v9;
  -[PUAssetViewModel contentOffsetOverrideFactor](self, "contentOffsetOverrideFactor");
  v12 = v6 * (1.0 - v11);
  v13 = v10 * v11;
  v14 = v4 * (1.0 - v11) + v8 * v11;
  v15 = v12 + v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)resetContentOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  id v9;

  -[PUAssetViewModel preferredContentOffset](self, "preferredContentOffset");
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v6 != *MEMORY[0x1E0C9D538] || v3 != v5)
  {
    -[PUAssetViewModel contentOffsetOverrideFactor](self, "contentOffsetOverrideFactor");
    if (v8 != 0.0)
    {
      -[PUAssetViewModel setPreferredContentOffset:](self, "setPreferredContentOffset:", v4, v5);
      -[PUAssetViewModel setContentOffsetOverrideFactor:](self, "setContentOffsetOverrideFactor:", 0.0);
      -[PUAssetViewModel currentChange](self, "currentChange");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setContentOffsetChanged:", 1);

    }
  }
}

- (void)setPreferredContentOffset:(CGPoint)a3
{
  -[PUAssetViewModel setPreferredContentOffset:changeReason:](self, "setPreferredContentOffset:changeReason:", 0, a3.x, a3.y);
}

- (void)setPreferredContentOffset:(CGPoint)a3 changeReason:(int64_t)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint *p_preferredContentOffset;
  void *v9;

  y = a3.y;
  x = a3.x;
  p_preferredContentOffset = &self->_preferredContentOffset;
  if ((PXPointApproximatelyEqualToPoint() & 1) == 0)
  {
    p_preferredContentOffset->x = x;
    p_preferredContentOffset->y = y;
    kdebug_trace();
    -[PUAssetViewModel _setLastContentOffsetChangeReason:](self, "_setLastContentOffsetChangeReason:", a4);
    -[PUAssetViewModel currentChange](self, "currentChange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setContentOffsetChanged:", 1);

    -[PUAssetViewModel _updateAccessoryViewVisibilityFraction](self, "_updateAccessoryViewVisibilityFraction");
  }
}

- (void)setOverridingContentOffset:(CGPoint)a3
{
  void *v5;

  if (a3.x != self->_overridingContentOffset.x || a3.y != self->_overridingContentOffset.y)
  {
    self->_overridingContentOffset = a3;
    kdebug_trace();
    -[PUAssetViewModel _setLastContentOffsetChangeReason:](self, "_setLastContentOffsetChangeReason:", 0);
    -[PUAssetViewModel currentChange](self, "currentChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setContentOffsetChanged:", 1);

    -[PUAssetViewModel _updateAccessoryViewVisibilityFraction](self, "_updateAccessoryViewVisibilityFraction");
  }
}

- (void)setContentOffsetOverrideFactor:(double)a3
{
  void *v4;

  if (self->_contentOffsetOverrideFactor != a3)
  {
    self->_contentOffsetOverrideFactor = a3;
    kdebug_trace();
    -[PUAssetViewModel currentChange](self, "currentChange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setContentOffsetChanged:", 1);

    -[PUAssetViewModel _updateAccessoryViewVisibilityFraction](self, "_updateAccessoryViewVisibilityFraction");
  }
}

- (BOOL)isInEditMode
{
  return self->_editStyle != 0;
}

- (void)setEditStyle:(int64_t)a3 changeReason:(int64_t)a4
{
  _BOOL4 v7;
  id v8;

  if (*(_OWORD *)&self->_editStyle != __PAIR128__(a4, a3))
  {
    v7 = -[PUAssetViewModel isInEditMode](self, "isInEditMode");
    self->_editStyle = a3;
    self->_lastEditStyleChangeReason = a4;
    if (v7 != -[PUAssetViewModel isInEditMode](self, "isInEditMode"))
    {
      -[PUAssetViewModel currentChange](self, "currentChange");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setIsInEditModeChanged:", 1);

    }
  }
}

- (void)setRevealsGainMapImage:(BOOL)a3
{
  id v3;

  if (self->_revealsGainMapImage != a3)
  {
    self->_revealsGainMapImage = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRevealsGainMapImageChanged:", 1);

  }
}

- (void)setForceBadgesVisible:(BOOL)a3
{
  id v3;

  if (self->_forceBadgesVisible != a3)
  {
    self->_forceBadgesVisible = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setForceBadgesVisibleChanged:", 1);

  }
}

- (void)setAssetSharedViewModel:(id)a3
{
  PUAssetSharedViewModel *v5;
  PUAssetSharedViewModel *assetSharedViewModel;
  PUAssetSharedViewModel *v7;

  v5 = (PUAssetSharedViewModel *)a3;
  assetSharedViewModel = self->_assetSharedViewModel;
  if (assetSharedViewModel != v5)
  {
    v7 = v5;
    -[PUAssetSharedViewModel unregisterChangeObserver:](assetSharedViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_assetSharedViewModel, a3);
    -[PUAssetSharedViewModel registerChangeObserver:](self->_assetSharedViewModel, "registerChangeObserver:", self);
    -[PUAssetViewModel _updatePropertiesFromAssetSharedViewModel](self, "_updatePropertiesFromAssetSharedViewModel");
    v5 = v7;
  }

}

- (void)_updatePropertiesFromAssetSharedViewModel
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[PUAssetViewModel assetSharedViewModel](self, "assetSharedViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PUAssetViewModel__updatePropertiesFromAssetSharedViewModel__block_invoke;
  v5[3] = &unk_1E58ABCA8;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  -[PUViewModel performChanges:](self, "performChanges:", v5);

}

- (void)willUpdateDisplayedContent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__PUAssetViewModel_willUpdateDisplayedContent__block_invoke;
  v2[3] = &unk_1E58ABD10;
  v2[4] = self;
  -[PUViewModel performChanges:](self, "performChanges:", v2);
}

- (void)didUpdateDisplayedContent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__PUAssetViewModel_didUpdateDisplayedContent__block_invoke;
  v2[3] = &unk_1E58ABD10;
  v2[4] = self;
  -[PUViewModel performChanges:](self, "performChanges:", v2);
}

- (void)setDisplayedContentUpdateCount:(int64_t)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (self->_displayedContentUpdateCount != a3)
  {
    if (a3 < 0)
    {
      PLOneUpGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "displayedContentUpdateCount underflow", v5, 2u);
      }

      a3 = 0;
    }
    self->_displayedContentUpdateCount = a3;
    -[PUAssetViewModel setIsUpdatingDisplayedContent:](self, "setIsUpdatingDisplayedContent:", a3 != 0);
  }
}

- (void)setIsUpdatingDisplayedContent:(BOOL)a3
{
  void *v5;
  dispatch_group_t v6;

  if (self->_isUpdatingDisplayedContent != a3)
  {
    self->_isUpdatingDisplayedContent = a3;
    kdebug_trace();
    -[PUAssetViewModel currentChange](self, "currentChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setIsUpdatingDisplayedContentChanged:", 1);

    if (a3)
    {
      v6 = dispatch_group_create();
      -[PUAssetViewModel setDisplayedContentUpdateGroup:](self, "setDisplayedContentUpdateGroup:", v6);

    }
    else
    {
      -[PUAssetViewModel setDisplayedContentUpdateGroup:](self, "setDisplayedContentUpdateGroup:", 0);
    }
  }
}

- (void)setDisplayedContentUpdateGroup:(id)a3
{
  id v5;
  id *p_displayedContentUpdateGroup;
  NSObject *v7;
  id v8;

  v5 = a3;
  p_displayedContentUpdateGroup = (id *)&self->_displayedContentUpdateGroup;
  v7 = *p_displayedContentUpdateGroup;
  v8 = v5;
  if (*p_displayedContentUpdateGroup != v5)
  {
    if (v7)
      dispatch_group_leave(v7);
    objc_storeStrong(p_displayedContentUpdateGroup, a3);
    if (*p_displayedContentUpdateGroup)
      dispatch_group_enter((dispatch_group_t)*p_displayedContentUpdateGroup);
  }

}

- (void)setIsPresentedForPreview:(BOOL)a3
{
  id v3;

  if (self->_isPresentedForPreview != a3)
  {
    self->_isPresentedForPreview = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setIsPresentedForPreviewChanged:", 1);

  }
}

- (void)setVisualImageAnalysis:(id)a3
{
  PXVKImageAnalysis *v5;
  void *v6;
  PXVKImageAnalysis *v7;

  v5 = (PXVKImageAnalysis *)a3;
  if (self->_visualImageAnalysis != v5)
  {
    v7 = v5;
    PXDeferredDealloc();
    objc_storeStrong((id *)&self->_visualImageAnalysis, a3);
    -[PUAssetViewModel currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setVisualImageAnalysisChanged:", 1);

    v5 = v7;
  }

}

- (void)setMainImageContentsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_mainImageContentsRect;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_mainImageContentsRect = &self->_mainImageContentsRect;
  if (!CGRectEqualToRect(a3, self->_mainImageContentsRect))
  {
    p_mainImageContentsRect->origin.x = x;
    p_mainImageContentsRect->origin.y = y;
    p_mainImageContentsRect->size.width = width;
    p_mainImageContentsRect->size.height = height;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMainImageContentsRectChanged:", 1);

  }
}

- (void)setVisualIntelligenceAnalyzeRequestID:(int)a3
{
  id v3;

  if (self->_visualIntelligenceAnalyzeRequestID != a3)
  {
    self->_visualIntelligenceAnalyzeRequestID = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setVisualIntelligenceAnalyzeRequestIDChanged:", 1);

  }
}

- (void)setIsBeingDismissed:(BOOL)a3
{
  id v3;

  if (self->_isBeingDismissed != a3)
  {
    self->_isBeingDismissed = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setIsBeingDismissedChanged:", 1);

  }
}

- (void)setIsIrisPlaying:(BOOL)a3
{
  id v3;

  if (self->_isIrisPlaying != a3)
  {
    self->_isIrisPlaying = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setIsIrisPlayingChanged:", 1);

  }
}

- (void)setIsVisualSearchCardShowing:(BOOL)a3
{
  id v3;

  if (self->_isVisualSearchCardShowing != a3)
  {
    self->_isVisualSearchCardShowing = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setIsVisualSearchCardShowingChanged:", 1);

  }
}

- (void)setBestImage:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_bestImage);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_bestImage, obj);
    -[PUAssetViewModel currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setBestImageChanged:", 1);

    v5 = obj;
  }

}

- (void)setStatusCornerState:(int64_t)a3
{
  id v3;

  if (self->_statusCornerState != a3)
  {
    self->_statusCornerState = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStatusCornerStateChanged:", 1);

  }
}

- (void)setNeedsResetVisualImageInteraction:(BOOL)a3
{
  -[PUAssetViewModel setNeedsResetVisualImageInteraction:reason:](self, "setNeedsResetVisualImageInteraction:reason:", a3, 0);
}

- (void)setNeedsResetVisualImageInteraction:(BOOL)a3 reason:(int64_t)a4
{
  id v4;

  if (self->_needsResetVisualImageInteraction != a3)
  {
    self->_needsResetVisualImageInteraction = a3;
    self->_needsResetVisualImageInteractionReason = a4;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsResetVisualImageInteractionChanged:", 1);

  }
}

- (void)setPPT_isDeferredProcessingDoneAndFinalImageDisplayed:(BOOL)a3
{
  id v3;

  if (self->_PPT_isDeferredProcessingDoneAndFinalImageDisplayed != a3)
  {
    self->_PPT_isDeferredProcessingDoneAndFinalImageDisplayed = a3;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged:", 1);

  }
}

- (void)_updateVideoPlaybackStartTime
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[PUAssetViewModel videoPlayer](self, "videoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__PUAssetViewModel__updateVideoPlaybackStartTime__block_invoke;
    v5[3] = &unk_1E58ABCA8;
    v5[4] = self;
    v6 = v3;
    objc_msgSend(v6, "performChanges:", v5);

  }
}

- (PXVKCVisualSearchResultInfo)visualSearchResultInfo
{
  void *v2;
  void *v3;
  void *v4;

  -[PUAssetViewModel visualImageAnalysis](self, "visualImageAnalysis");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resultItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXVKCVisualSearchResultInfo *)v4;
}

- (void)_updateFavoriteState
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[PUAssetViewModel asset](self, "asset");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAssetViewModel isFavoriteOverride](self, "isFavoriteOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUAssetViewModel isFavoriteOverride](self, "isFavoriteOverride");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = objc_msgSend(v6, "isFavorite");
  }

  -[PUAssetViewModel _setFavorite:](self, "_setFavorite:", v5);
}

- (int64_t)fetchAssetSyndicationState
{
  int64_t result;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  id v8;
  void *v9;

  result = self->_assetSyndicationState;
  if (!result)
  {
    -[PUAssetViewModel assetSyndicationStateOverride](self, "assetSyndicationStateOverride");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, "integerValue");
    }
    else
    {
      -[PUAssetViewModel asset](self, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if (objc_msgSend(v8, "px_isUnsavedSyndicatedAsset"))
        {
          if (PXContentSyndicationCMMAssetIsBeingSaved())
          {
            -[PUAssetViewModel setAssetSyndicationStateOverride:](self, "setAssetSyndicationStateOverride:", &unk_1E59BAE18);
            v6 = 1;
          }
          else
          {
            v6 = 2;
          }
        }
        else if (objc_msgSend(v8, "px_wasSavedThroughSyndication"))
        {
          v6 = 4;
        }
        else
        {
          v6 = 1;
        }

      }
      else
      {
        v6 = 1;
      }

    }
    self->_assetSyndicationState = v6;
    -[PUAssetViewModel currentChange](self, "currentChange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAssetSyndicationStateChanged:", 1);

    return self->_assetSyndicationState;
  }
  return result;
}

- (void)assetHighlightTimeRangesProducerDidChangeHighlights:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PUAssetViewModel_assetHighlightTimeRangesProducerDidChangeHighlights___block_invoke;
  v6[3] = &unk_1E58ABCA8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PUViewModel performChanges:](self, "performChanges:", v6);

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUAssetViewModel _handleAssetSharedViewModel:didChange:](self, "_handleAssetSharedViewModel:didChange:", v7, v6);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PUAssetViewModel _handleBrowsingVideoPlayer:didChange:](self, "_handleBrowsingVideoPlayer:didChange:", v7, v6);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PUAssetViewModel _handleBrowsingIrisPlayer:didChange:](self, "_handleBrowsingIrisPlayer:didChange:", v7, v6);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[PUAssetViewModel _handleBrowsingAnimatedImage:didChange:](self, "_handleBrowsingAnimatedImage:didChange:", v7, v6);
      }
    }
  }

}

- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4
{
  id v5;

  v5 = a4;
  if ((objc_msgSend(v5, "loadingStatusChanged") & 1) != 0
    || (objc_msgSend(v5, "saveProgressChanged") & 1) != 0
    || objc_msgSend(v5, "saveStateChanged"))
  {
    -[PUAssetViewModel _updatePropertiesFromAssetSharedViewModel](self, "_updatePropertiesFromAssetSharedViewModel");
  }

}

- (void)_handleBrowsingVideoPlayer:(id)a3 didChange:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  PUAssetViewModel *v14;
  id v15;

  v5 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __57__PUAssetViewModel__handleBrowsingVideoPlayer_didChange___block_invoke;
  v13 = &unk_1E58ABCA8;
  v14 = self;
  v15 = v5;
  v6 = v5;
  v7 = (void (**)(_QWORD))_Block_copy(&v10);
  -[PUAssetViewModel updater](self, "updater", v10, v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPerformingUpdates");

  if (v9)
    dispatch_async(MEMORY[0x1E0C80D38], v7);
  else
    v7[2](v7);

}

- (void)_handleBrowsingIrisPlayer:(id)a3 didChange:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PUAssetViewModel__handleBrowsingIrisPlayer_didChange___block_invoke;
  v7[3] = &unk_1E58ABCA8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PUViewModel performChanges:](self, "performChanges:", v7);

}

- (void)_handleBrowsingAnimatedImage:(id)a3 didChange:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__PUAssetViewModel__handleBrowsingAnimatedImage_didChange___block_invoke;
  v7[3] = &unk_1E58ABCA8;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PUViewModel performChanges:](self, "performChanges:", v7);

}

- (void)registerView:(id)a3 forImageAnalysisInteractionHostMode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PUAssetViewModel interactionHostViewsByMode](self, "interactionHostViewsByMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

  -[PUAssetViewModel _updateImageAnalysisInteractionHostView](self, "_updateImageAnalysisInteractionHostView");
}

- (void)unregisterView:(id)a3 forImageAnalysisInteractionHostMode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[PUAssetViewModel interactionHostViewsByMode](self, "interactionHostViewsByMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    -[PUAssetViewModel interactionHostViewsByMode](self, "interactionHostViewsByMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

    -[PUAssetViewModel _updateImageAnalysisInteractionHostView](self, "_updateImageAnalysisInteractionHostView");
  }
}

- (NSMapTable)interactionHostViewsByMode
{
  NSMapTable *interactionHostViewsByMode;
  NSMapTable *v4;
  NSMapTable *v5;

  interactionHostViewsByMode = self->_interactionHostViewsByMode;
  if (!interactionHostViewsByMode)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_interactionHostViewsByMode;
    self->_interactionHostViewsByMode = v4;

    interactionHostViewsByMode = self->_interactionHostViewsByMode;
  }
  return interactionHostViewsByMode;
}

- (void)setImageAnalysisInteractionHostMode:(int64_t)a3
{
  if (self->_imageAnalysisInteractionHostMode != a3)
  {
    self->_imageAnalysisInteractionHostMode = a3;
    -[PUAssetViewModel _updateImageAnalysisInteractionHostView](self, "_updateImageAnalysisInteractionHostView");
  }
}

- (void)_updateImageAnalysisInteractionHostView
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[PUAssetViewModel imageAnalysisInteractionHostMode](self, "imageAnalysisInteractionHostMode");
  -[PUAssetViewModel interactionHostViewsByMode](self, "interactionHostViewsByMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PUAssetViewModel imageAnalysisInteraction](self, "imageAnalysisInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHostView:", v7);

}

- (void)_invalidateInteractionHostMode
{
  id v2;

  -[PUAssetViewModel updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateInteractionHostMode);

}

- (void)_updateInteractionHostMode
{
  -[PUAssetViewModel setImageAnalysisInteractionHostMode:](self, "setImageAnalysisInteractionHostMode:", objc_msgSend((id)objc_opt_class(), "imageAnalysisInteractionHostModeForAccessoryViewVisibility:", -[PUAssetViewModel isAccessoryViewVisible](self, "isAccessoryViewVisible")));
}

- (id)debugDetailedDescription
{
  void *v3;
  uint64_t v4;
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
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  CGPoint v22;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetViewModel focusValue](self, "focusValue");
  objc_msgSend(v3, "appendFormat:", CFSTR("Focus Value: %f\n"), v4);
  -[PUAssetViewModel modelTileTransform](self, "modelTileTransform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Tile Transform: %@\n"), v5);

  -[PUAssetViewModel contentOffset](self, "contentOffset");
  NSStringFromCGPoint(v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Content Offset: %@\n"), v6);

  -[PUAssetViewModel badgeInfoPromise](self, "badgeInfoPromise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Badge Info: %@\n"), v7);

  -[PUAssetViewModel loadingStatus](self, "loadingStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Loading Status: %@\n"), v8);

  -[PUAssetViewModel videoPlayer](self, "videoPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "debugDetailedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Video Player: %@\n"), v10);

  -[PUAssetViewModel irisPlayer](self, "irisPlayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "debugDetailedDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Iris Player: %@\n"), v12);

  -[PUAssetViewModel animatedImagePlayer](self, "animatedImagePlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "debugDetailedDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Animated Image: %@\n"), v14);

  -[PUAssetViewModel searchQueryMatchInfo](self, "searchQueryMatchInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Search Info: %@\n"), v15);

  if (-[PUAssetViewModel isUserTransformingTile](self, "isUserTransformingTile"))
    objc_msgSend(v3, "appendString:", CFSTR("User Transforming Tile\n"));
  v16 = (void *)MEMORY[0x1E0CB3940];
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_stringByIndentingNewLines");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@ %p> {\n\t%@}"), v18, self, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)setFetchAssetSyndicationState:(int64_t)a3
{
  self->_assetSyndicationState = a3;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (PUModelTileTransform)modelTileTransform
{
  return self->_modelTileTransform;
}

- (BOOL)isUserTransformingTile
{
  return self->_isUserTransformingTile;
}

- (double)focusValue
{
  return self->_focusValue;
}

- (BOOL)isFullyInFocus
{
  return self->_isFullyInFocus;
}

- (BOOL)isFullyOutOfFocus
{
  return self->_isFullyOutOfFocus;
}

- (BOOL)isZoomedIn
{
  return self->_isZoomedIn;
}

- (double)focusValueAtZeroTimestamp
{
  return self->_focusValueAtZeroTimestamp;
}

- (void)setFocusValueAtZeroTimestamp:(double)a3
{
  self->_focusValueAtZeroTimestamp = a3;
}

- (PUBrowsingVideoPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (NSArray)highlightTimeRanges
{
  return self->_highlightTimeRanges;
}

- (BOOL)shouldShowHighlightTimeRanges
{
  return self->_shouldShowHighlightTimeRanges;
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  return self->_searchQueryMatchInfo;
}

- (BOOL)isDisplayingSearchQueryLabel
{
  return self->_isDisplayingSearchQueryLabel;
}

- (BOOL)forceBadgesVisible
{
  return self->_forceBadgesVisible;
}

- (PUBrowsingIrisPlayer)irisPlayer
{
  return self->_irisPlayer;
}

- (PUBrowsingAnimatedImagePlayer)animatedImagePlayer
{
  return self->_animatedImagePlayer;
}

- (PXOperationStatus)loadingStatus
{
  return self->_loadingStatus;
}

- (NSProgress)saveProgress
{
  return self->_saveProgress;
}

- (int64_t)saveState
{
  return self->_saveState;
}

- (int64_t)importState
{
  return self->_importState;
}

- (BOOL)isUpdatingDisplayedContent
{
  return self->_isUpdatingDisplayedContent;
}

- (OS_dispatch_group)displayedContentUpdateGroup
{
  return self->_displayedContentUpdateGroup;
}

- (PUBadgeInfoPromise)badgeInfoPromise
{
  return self->_badgeInfoPromise;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (BOOL)isAccessoryViewVisible
{
  return self->_accessoryViewVisible;
}

- (int64_t)lastAccessoryViewVisibilityChangeReason
{
  return self->_lastAccessoryViewVisibilityChangeReason;
}

- (void)_setLastAccessoryViewVisibilityChangeReason:(int64_t)a3
{
  self->_lastAccessoryViewVisibilityChangeReason = a3;
}

- (int64_t)lastContentOffsetChangeReason
{
  return self->_lastContentOffsetChangeReason;
}

- (void)_setLastContentOffsetChangeReason:(int64_t)a3
{
  self->_lastContentOffsetChangeReason = a3;
}

- (CGPoint)contentOffsetForAccessoryFullyVisible
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOffsetForAccessoryFullyVisible.x;
  y = self->_contentOffsetForAccessoryFullyVisible.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)accessoryViewVisibilityFraction
{
  return self->_accessoryViewVisibilityFraction;
}

- (CGPoint)preferredContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_preferredContentOffset.x;
  y = self->_preferredContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)overridingContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_overridingContentOffset.x;
  y = self->_overridingContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)contentOffsetOverrideFactor
{
  return self->_contentOffsetOverrideFactor;
}

- (int64_t)editStyle
{
  return self->_editStyle;
}

- (int64_t)lastEditStyleChangeReason
{
  return self->_lastEditStyleChangeReason;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (BOOL)revealsGainMapImage
{
  return self->_revealsGainMapImage;
}

- (BOOL)isPresentedForPreview
{
  return self->_isPresentedForPreview;
}

- (PXVKImageAnalysis)visualImageAnalysis
{
  return self->_visualImageAnalysis;
}

- (BOOL)isBeingDismissed
{
  return self->_isBeingDismissed;
}

- (BOOL)isIrisPlaying
{
  return self->_isIrisPlaying;
}

- (int)visualIntelligenceAnalyzeRequestID
{
  return self->_visualIntelligenceAnalyzeRequestID;
}

- (BOOL)isVisualSearchCardShowing
{
  return self->_isVisualSearchCardShowing;
}

- (PXVKImageAnalysisInteraction)visualSearchImageAnalysisInteraction
{
  return (PXVKImageAnalysisInteraction *)objc_loadWeakRetained((id *)&self->_visualSearchImageAnalysisInteraction);
}

- (void)setVisualSearchImageAnalysisInteraction:(id)a3
{
  objc_storeWeak((id *)&self->_visualSearchImageAnalysisInteraction, a3);
}

- (BOOL)hasVisualAnalysisFailed
{
  return self->_hasVisualAnalysisFailed;
}

- (void)setHasVisualAnalysisFailed:(BOOL)a3
{
  self->_hasVisualAnalysisFailed = a3;
}

- (int64_t)statusCornerState
{
  return self->_statusCornerState;
}

- (UIImage)bestImage
{
  return (UIImage *)objc_loadWeakRetained((id *)&self->_bestImage);
}

- (CGRect)mainImageContentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_mainImageContentsRect.origin.x;
  y = self->_mainImageContentsRect.origin.y;
  width = self->_mainImageContentsRect.size.width;
  height = self->_mainImageContentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)needsResetVisualImageInteraction
{
  return self->_needsResetVisualImageInteraction;
}

- (int64_t)needsResetVisualImageInteractionReason
{
  return self->_needsResetVisualImageInteractionReason;
}

- (NSNumber)isFavoriteOverride
{
  return self->_isFavoriteOverride;
}

- (NSNumber)assetSyndicationStateOverride
{
  return self->_assetSyndicationStateOverride;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (int64_t)_currentFavoriteOverrideRequest
{
  return self->__currentFavoriteOverrideRequest;
}

- (void)_setCurrentFavoriteOverrideRequest:(int64_t)a3
{
  self->__currentFavoriteOverrideRequest = a3;
}

- (int64_t)displayedContentUpdateCount
{
  return self->_displayedContentUpdateCount;
}

- (NSHashTable)registeredVideoLayerSources
{
  return self->_registeredVideoLayerSources;
}

- (void)setRegisteredVideoLayerSources:(id)a3
{
  objc_storeStrong((id *)&self->_registeredVideoLayerSources, a3);
}

- (PUAssetHighlightTimeRangesProducer)highlightTimeRangesProducer
{
  return self->_highlightTimeRangesProducer;
}

- (void)setHighlightTimeRangesProducer:(id)a3
{
  objc_storeStrong((id *)&self->_highlightTimeRangesProducer, a3);
}

- (BOOL)hasAutoplayedVideoSinceBecomingFocused
{
  return self->_hasAutoplayedVideoSinceBecomingFocused;
}

- (void)setHasAutoplayedVideoSinceBecomingFocused:(BOOL)a3
{
  self->_hasAutoplayedVideoSinceBecomingFocused = a3;
}

- (void)setInteractionHostViewsByMode:(id)a3
{
  objc_storeStrong((id *)&self->_interactionHostViewsByMode, a3);
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (PUAssetReference)assetReference
{
  return self->_assetReference;
}

- (void)setAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_assetReference, a3);
}

- (PUAssetSharedViewModel)assetSharedViewModel
{
  return self->_assetSharedViewModel;
}

- (PUImageAnalysisInteraction)imageAnalysisInteraction
{
  return self->_imageAnalysisInteraction;
}

- (int64_t)imageAnalysisInteractionHostMode
{
  return self->_imageAnalysisInteractionHostMode;
}

- (id)videoAutoplayPredicate
{
  return self->_videoAutoplayPredicate;
}

- (BOOL)PPT_isDeferredProcessingDoneAndFinalImageDisplayed
{
  return self->_PPT_isDeferredProcessingDoneAndFinalImageDisplayed;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_videoAutoplayPredicate, 0);
  objc_storeStrong((id *)&self->_imageAnalysisInteraction, 0);
  objc_storeStrong((id *)&self->_assetSharedViewModel, 0);
  objc_storeStrong((id *)&self->_assetReference, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_interactionHostViewsByMode, 0);
  objc_storeStrong((id *)&self->_highlightTimeRangesProducer, 0);
  objc_storeStrong((id *)&self->_registeredVideoLayerSources, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_assetSyndicationStateOverride, 0);
  objc_storeStrong((id *)&self->_isFavoriteOverride, 0);
  objc_destroyWeak((id *)&self->_bestImage);
  objc_destroyWeak((id *)&self->_visualSearchImageAnalysisInteraction);
  objc_storeStrong((id *)&self->_visualImageAnalysis, 0);
  objc_storeStrong((id *)&self->_badgeInfoPromise, 0);
  objc_storeStrong((id *)&self->_displayedContentUpdateGroup, 0);
  objc_storeStrong((id *)&self->_saveProgress, 0);
  objc_storeStrong((id *)&self->_loadingStatus, 0);
  objc_storeStrong((id *)&self->_searchQueryMatchInfo, 0);
  objc_storeStrong((id *)&self->_highlightTimeRanges, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_modelTileTransform, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_animatedImagePlayer, 0);
  objc_storeStrong((id *)&self->_irisPlayer, 0);
}

void __59__PUAssetViewModel__handleBrowsingAnimatedImage_didChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "currentChange");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setAnimatedImageChange:", *(_QWORD *)(a1 + 40));

}

void __56__PUAssetViewModel__handleBrowsingIrisPlayer_didChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "currentChange");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setIrisPlayerChange:", *(_QWORD *)(a1 + 40));

}

void __57__PUAssetViewModel__handleBrowsingVideoPlayer_didChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__PUAssetViewModel__handleBrowsingVideoPlayer_didChange___block_invoke_2;
  v5[3] = &unk_1E58ABCA8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "performChanges:", v5);

}

void __57__PUAssetViewModel__handleBrowsingVideoPlayer_didChange___block_invoke_2(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "durationDidChange"))
    objc_msgSend(*(id *)(a1 + 40), "_invalidateShouldShowHighlightTimeRanges");
  objc_msgSend(*(id *)(a1 + 40), "currentChange");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setVideoPlayerChange:", *(_QWORD *)(a1 + 32));

}

void __72__PUAssetViewModel_assetHighlightTimeRangesProducerDidChangeHighlights___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "highlightTimeRanges");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setHighlightTimeRanges:", v2);

}

uint64_t __49__PUAssetViewModel__updateVideoPlaybackStartTime__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CMTime *v8;
  void *v9;
  Float64 v10;
  __int128 v12;
  uint64_t v13;
  CMTime v14;
  CMTime lhs;
  CMTime rhs;
  CMTime time2;
  CMTime v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTime v22;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "videoStartAtFirstHighlight");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "highlightTimeRanges");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "CMTimeRangeValue");
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v19 = 0u;
    }
    *(_OWORD *)&v22.value = v19;
    v22.epoch = v20;

    memset(&v18, 0, sizeof(v18));
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "videoHighlightPreroll");
    CMTimeMakeWithSeconds(&rhs, v10, 600);
    lhs = v22;
    CMTimeSubtract(&time2, &lhs, &rhs);
    lhs = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    CMTimeMaximum(&v18, &lhs, &time2);

    v14 = v18;
    v7 = *(void **)(a1 + 40);
    v8 = &v14;
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    v12 = *MEMORY[0x1E0CA2E18];
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v8 = (CMTime *)&v12;
  }
  return objc_msgSend(v7, "setPlaybackStartTime:", v8, v12, v13);
}

uint64_t __45__PUAssetViewModel_didUpdateDisplayedContent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayedContentUpdateCount:", objc_msgSend(*(id *)(a1 + 32), "displayedContentUpdateCount") - 1);
}

uint64_t __46__PUAssetViewModel_willUpdateDisplayedContent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayedContentUpdateCount:", objc_msgSend(*(id *)(a1 + 32), "displayedContentUpdateCount") + 1);
}

uint64_t __61__PUAssetViewModel__updatePropertiesFromAssetSharedViewModel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 40), "loadingStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLoadingStatus:", v2);

  objc_msgSend(*(id *)(a1 + 40), "saveProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSaveProgress:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "setSaveState:", objc_msgSend(*(id *)(a1 + 40), "saveState"));
}

uint64_t __62__PUAssetViewModel__handleHighlightTimeRangesResult_forAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHighlightTimeRanges:", *(_QWORD *)(a1 + 40));
}

void __43__PUAssetViewModel__updateMediaControllers__block_invoke(uint64_t a1, double a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "setVolume:", a2);
  v3 = objc_msgSend(*(id *)(a1 + 40), "playbackStyle");
  v4 = *(void **)(a1 + 32);
  if (v3 == 5)
  {
    objc_msgSend(v4, "setDesiredPlayState:reason:", 4, CFSTR("Automatic playback of looping video"));
  }
  else if (!objc_msgSend(v4, "desiredPlayState"))
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "asset");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "allowAutoplayVideoForAsset:")
      && (objc_msgSend(*(id *)(a1 + 48), "isFullyInFocus") & 1) != 0)
    {
      v6 = objc_msgSend(*(id *)(a1 + 48), "hasAutoplayedVideoSinceBecomingFocused");

      if ((v6 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "setHasAutoplayedVideoSinceBecomingFocused:", 1);
        v7 = *(void **)(a1 + 32);
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __43__PUAssetViewModel__updateMediaControllers__block_invoke_2;
        v9[3] = &unk_1E58ABD10;
        v10 = v7;
        objc_msgSend(v10, "performChanges:", v9);

      }
    }
    else
    {

    }
  }
}

uint64_t __43__PUAssetViewModel__updateMediaControllers__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImageLoadingEnabled:", 0);
}

uint64_t __43__PUAssetViewModel__updateMediaControllers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:reason:", 3, CFSTR("Starting auto-play of in-focus video"));
}

uint64_t __48__PUAssetViewModel__updatePlayersLoadingAllowed__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setLivePhotoLoadingDisabled:forReason:", *(unsigned __int8 *)(a1 + 48), CFSTR("OutOfFocus"));
  result = objc_msgSend(*(id *)(a1 + 32), "setLoadingTarget:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(a1 + 32), "unloadLivePhoto");
  return result;
}

uint64_t __48__PUAssetViewModel__updatePlayersLoadingAllowed__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setAnimatedImageLoadingDisabled:forReason:", *(unsigned __int8 *)(a1 + 40), CFSTR("OutOfFocus"));
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "unloadAnimatedImage");
  return result;
}

uint64_t __42__PUAssetViewModel__handleDidEndScrubbing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAssetSyndicationStateOverride:", 0);
}

void __35__PUAssetViewModel_setIsScrubbing___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDidEndScrubbing");

}

void __42__PUAssetViewModel_setIsFavoriteOverride___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_currentFavoriteOverrideRequest") == *(_QWORD *)(a1 + 40))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __42__PUAssetViewModel_setIsFavoriteOverride___block_invoke_2;
    v3[3] = &unk_1E58ABD10;
    v4 = WeakRetained;
    objc_msgSend(v4, "performChanges:", v3);

  }
}

uint64_t __42__PUAssetViewModel_setIsFavoriteOverride___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsFavoriteOverride:", 0);
}

uint64_t __34__PUAssetViewModel_setFocusValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActivated:", 0);
}

uint64_t __29__PUAssetViewModel_setAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __29__PUAssetViewModel_setAsset___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAsset:", *(_QWORD *)(a1 + 40));
}

uint64_t __29__PUAssetViewModel_setAsset___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAsset:", *(_QWORD *)(a1 + 40));
}

+ (int64_t)imageAnalysisInteractionHostModeForAccessoryViewVisibility:(BOOL)a3
{
  if (a3)
    return 2;
  else
    return 1;
}

@end
