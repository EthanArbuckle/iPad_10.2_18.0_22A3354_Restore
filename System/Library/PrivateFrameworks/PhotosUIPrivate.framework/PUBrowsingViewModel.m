@implementation PUBrowsingViewModel

- (PUBrowsingViewModel)initWithLowMemoryMode:(BOOL)a3
{
  PUBrowsingViewModel *v4;
  PUBrowsingViewModel *v5;
  uint64_t v6;
  NSMutableSet *invalidAssetViewModels;
  void *v8;
  uint64_t v9;
  PUCachedMapTable *v10;
  PUCachedMapTable *viewModelByAssetReference;
  PUCachedMapTable *v12;
  PUCachedMapTable *assetSharedViewModelByAsset;
  PUCachedMapTable *v14;
  PUCachedMapTable *assetSharedViewModelByAssetUUID;
  NSMutableSet *v16;
  NSMutableSet *videoScrubberInteractionIdentifiers;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDate *currentAssetReferenceChangedDate;
  uint64_t v22;
  OS_dispatch_queue *audioSessionUpdateQueue;
  PUOneUpVideoPlayerController *v24;
  PUOneUpVideoPlayerController *videoPlayerController;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)PUBrowsingViewModel;
  v4 = -[PUViewModel init](&v28, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_lowMemoryMode = a3;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    invalidAssetViewModels = v5->_invalidAssetViewModels;
    v5->_invalidAssetViewModels = (NSMutableSet *)v6;

    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "viewModelCacheCountLimit");

    v10 = objc_alloc_init(PUCachedMapTable);
    viewModelByAssetReference = v5->_viewModelByAssetReference;
    v5->_viewModelByAssetReference = v10;

    -[PUCachedMapTable setCacheCountLimit:](v5->_viewModelByAssetReference, "setCacheCountLimit:", v9);
    v12 = objc_alloc_init(PUCachedMapTable);
    assetSharedViewModelByAsset = v5->_assetSharedViewModelByAsset;
    v5->_assetSharedViewModelByAsset = v12;

    -[PUCachedMapTable setCacheCountLimit:](v5->_assetSharedViewModelByAsset, "setCacheCountLimit:", v9);
    v14 = objc_alloc_init(PUCachedMapTable);
    assetSharedViewModelByAssetUUID = v5->_assetSharedViewModelByAssetUUID;
    v5->_assetSharedViewModelByAssetUUID = v14;

    -[PUCachedMapTable setCacheCountLimit:](v5->_assetSharedViewModelByAssetUUID, "setCacheCountLimit:", v9);
    v16 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    videoScrubberInteractionIdentifiers = v5->_videoScrubberInteractionIdentifiers;
    v5->_videoScrubberInteractionIdentifiers = v16;

    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "persistChromeVisibility") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_isChromeVisible = objc_msgSend(v19, "BOOLForKey:", CFSTR("browsingChromeVisibility"));

    }
    else
    {
      v5->_isChromeVisible = 1;
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
    v20 = objc_claimAutoreleasedReturnValue();
    currentAssetReferenceChangedDate = v5->_currentAssetReferenceChangedDate;
    v5->_currentAssetReferenceChangedDate = (NSDate *)v20;

    v5->_videoContentAllowed = 0;
    v5->_needsUpdatePlaybackAudioSession = 1;
    px_dispatch_queue_create_serial();
    v22 = objc_claimAutoreleasedReturnValue();
    audioSessionUpdateQueue = v5->_audioSessionUpdateQueue;
    v5->_audioSessionUpdateQueue = (OS_dispatch_queue *)v22;

    v24 = objc_alloc_init(PUOneUpVideoPlayerController);
    videoPlayerController = v5->_videoPlayerController;
    v5->_videoPlayerController = v24;

    -[PUOneUpVideoPlayerController setDelegate:](v5->_videoPlayerController, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x1E0D7BBB0], "sharedController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "registerChangeObserver:context:", v5, VideoMuteControllerContext_18832);

  }
  return v5;
}

- (PUBrowsingViewModel)init
{
  return -[PUBrowsingViewModel initWithLowMemoryMode:](self, "initWithLowMemoryMode:", 0);
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUBrowsingViewModelChange);
}

- (id)currentChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingViewModel;
  -[PUViewModel currentChange](&v3, sel_currentChange);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)registerChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingViewModel;
  -[PUViewModel registerChangeObserver:](&v3, sel_registerChangeObserver_, a3);
}

- (void)unregisterChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingViewModel;
  -[PUViewModel unregisterChangeObserver:](&v3, sel_unregisterChangeObserver_, a3);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingViewModel;
  -[PUViewModel didPerformChanges](&v3, sel_didPerformChanges);
  -[PUBrowsingViewModel _invalidateVideoPlayerController](self, "_invalidateVideoPlayerController");
  -[PUBrowsingViewModel _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)setAssetsDataSource:(id)a3
{
  PUAssetsDataSource *v5;
  PUAssetsDataSource *assetsDataSource;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  PUAssetsDataSource *v10;
  unint64_t v11;
  PUAssetsDataSource *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  PUAssetsDataSource *v20;
  PUBrowsingViewModel *v21;
  _QWORD aBlock[4];
  PUAssetsDataSource *v23;
  PUAssetsDataSource *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v5 = (PUAssetsDataSource *)a3;
  assetsDataSource = self->_assetsDataSource;
  if (assetsDataSource != v5 && !-[PUTilingDataSource isEqual:](assetsDataSource, "isEqual:", v5))
  {
    -[PUBrowsingViewModel currentAssetReference](self, "currentAssetReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__18860;
    v35 = __Block_byref_object_dispose__18861;
    v36 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v9 = &unk_1AB0EE000;
    if (v7)
    {
      if (-[PUAssetsDataSource isEmpty](v5, "isEmpty"))
      {
LABEL_10:
        objc_storeStrong((id *)&self->_assetsDataSource, a3);
        -[PUBrowsingViewModel currentChange](self, "currentChange");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "_setAssetsDataSourceDidChange:", 1);

        v18 = (void *)-[PUCachedMapTable copy](self->_viewModelByAssetReference, "copy");
        -[PUCachedMapTable removeAllObjects](self->_viewModelByAssetReference, "removeAllObjects");
        v19[0] = v8;
        v19[1] = v9[283];
        v19[2] = __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke_2;
        v19[3] = &unk_1E589D8C8;
        v20 = v5;
        v21 = self;
        objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v19);
        -[PUBrowsingViewModel setCurrentAssetReference:](self, "setCurrentAssetReference:", v32[5]);

        _Block_object_dispose(&v31, 8);
        goto LABEL_11;
      }
      v10 = self->_assetsDataSource;
      v11 = -[PUBrowsingViewModel _userNavigationDistance](self, "_userNavigationDistance");
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v30 = 0;
      aBlock[0] = v8;
      aBlock[1] = 3221225472;
      aBlock[2] = __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke;
      aBlock[3] = &unk_1E589D8A0;
      v25 = &v27;
      v12 = v10;
      v23 = v12;
      v26 = &v31;
      v24 = v5;
      v13 = _Block_copy(aBlock);
      objc_msgSend(v7, "indexPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v11 >> 63;
      -[PUTilingDataSource enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](v12, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v14, v15, v13);
      v28[3] = 0;
      if (!v32[5])
        -[PUTilingDataSource enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:](v12, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v14, v15 ^ 1, v13);

      _Block_object_dispose(&v27, 8);
      v9 = (_QWORD *)&unk_1AB0EE000;
    }
    else
    {
      -[PUAssetsDataSource startingAssetReference](v5, "startingAssetReference");
      v16 = objc_claimAutoreleasedReturnValue();
      v12 = (PUAssetsDataSource *)v32[5];
      v32[5] = v16;
    }

    goto LABEL_10;
  }
LABEL_11:

}

- (void)setImportStatusManager:(id)a3
{
  PXAssetImportStatusManager *v5;
  PXAssetImportStatusManager *importStatusManager;
  PXAssetImportStatusManager *v7;

  v5 = (PXAssetImportStatusManager *)a3;
  importStatusManager = self->_importStatusManager;
  if (importStatusManager != v5)
  {
    v7 = v5;
    -[PXAssetImportStatusManager removeAssetImportStatusObserver:](importStatusManager, "removeAssetImportStatusObserver:", self);
    objc_storeStrong((id *)&self->_importStatusManager, a3);
    -[PXAssetImportStatusManager addAssetImportStatusObserver:](self->_importStatusManager, "addAssetImportStatusObserver:", self);
    v5 = v7;
  }

}

- (void)setPrivacyController:(id)a3
{
  PXContentPrivacyController *v5;
  PXContentPrivacyController *privacyController;
  PXContentPrivacyController *v7;

  v5 = (PXContentPrivacyController *)a3;
  privacyController = self->_privacyController;
  if (privacyController != v5)
  {
    v7 = v5;
    -[PXContentPrivacyController unregisterChangeObserver:context:](privacyController, "unregisterChangeObserver:context:", self, PUBrowsingViewModelPrivacyControllerObservationContext);
    objc_storeStrong((id *)&self->_privacyController, a3);
    -[PXContentPrivacyController registerChangeObserver:context:](self->_privacyController, "registerChangeObserver:context:", self, PUBrowsingViewModelPrivacyControllerObservationContext);
    -[PUBrowsingViewModel _updateContentPrivacyState](self, "_updateContentPrivacyState");
    -[PUBrowsingViewModel _updateSystemAuthenticationType](self, "_updateSystemAuthenticationType");
    -[PUBrowsingViewModel _updateWantsContentUnavailableUnlockButtonVisible](self, "_updateWantsContentUnavailableUnlockButtonVisible");
    v5 = v7;
  }

}

- (void)setCurrentAssetReference:(id)a3 transitionProgress:(double)a4 transitionDriverIdentifier:(id)a5 animated:(BOOL)a6
{
  PUAssetReference *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PUAssetReference **p_currentAssetReference;
  NSObject *v23;
  void *v24;
  void *v25;
  PUAssetReference *v26;
  PUAssetReference *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _BOOL4 v35;
  _BOOL8 v36;
  BOOL v37;
  _BOOL4 v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL4 v46;
  _BOOL4 v47;
  uint64_t v48;
  NSDate *v49;
  double v50;
  NSDate *currentAssetReferenceChangedDate;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v12 = (PUAssetReference *)a3;
  v13 = a5;
  if (v12)
  {
    -[PUBrowsingViewModel assetsDataSource](self, "assetsDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetReference dataSourceIdentifier](v12, "dataSourceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if ((v17 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingViewModel.m"), 320, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!currentAssetReference || [[[self assetsDataSource] identifier] isEqual:[currentAssetReference dataSourceIdentifier]]"));

    }
    -[PUBrowsingViewModel assetsDataSource](self, "assetsDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "assetReferenceForAssetReference:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingViewModel.m"), 321, CFSTR("Tried to set a current asset reference that doesn't exist in the data source"));

    }
  }
  p_currentAssetReference = &self->_currentAssetReference;
  if (self->_currentAssetReference != v12 && !-[PUAssetReference isEqual:](v12, "isEqual:"))
  {
    if (!-[PUBrowsingViewModel isScrubbing](self, "isScrubbing"))
    {
      PLOneUpGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[PUAssetReference asset](v12, "asset");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v25;
        _os_log_impl(&dword_1AAB61000, v23, OS_LOG_TYPE_DEFAULT, "Current asset changed and not scrubbing. UUID: %{public}@", buf, 0xCu);

      }
    }
    if (*p_currentAssetReference)
    {
      -[PUBrowsingViewModel _invalidateCurrentAndNeighboringAssetViewModels](self, "_invalidateCurrentAndNeighboringAssetViewModels");
      v26 = *p_currentAssetReference;
    }
    else
    {
      v26 = 0;
    }
    v27 = v26;
    if (v12)
    {
      objc_storeStrong((id *)&self->_lastViewedAssetReference, a3);
      objc_storeStrong((id *)&self->_assetBeforeLastViewedAssetReference, v26);
    }
    objc_storeStrong((id *)&self->_currentAssetReference, a3);
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_setCurrentAssetDidChange:", 1);

    -[PUBrowsingViewModel _updateNeighboringAssetReferences](self, "_updateNeighboringAssetReferences");
    -[PUAssetReference dataSourceIdentifier](v27, "dataSourceIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetReference dataSourceIdentifier](v12, "dataSourceIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqualToString:", v30);

    if (v31)
    {
      -[PUAssetReference indexPath](v27, "indexPath");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAssetReference indexPath](v12, "indexPath");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v32, "compare:", v33);

      v35 = v34 == -1;
      v36 = v34 == -1;
      v37 = v34 == 1;
      v38 = v34 == 1;
      v39 = !v37 && v35;
      if (v37)
        v40 = -1;
      else
        v40 = v36;
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "userNavigationMaximumDistance");

      v43 = -[PUBrowsingViewModel _userNavigationDistance](self, "_userNavigationDistance") + v40;
      if (v38 && v43 == 0)
        v43 = -1;
      if (v43 <= -v42)
        v43 = -v42;
      if (v43 >= v42)
        v44 = v42;
      else
        v44 = v43;
      -[PUBrowsingViewModel _setUserNavigationDistance:](self, "_setUserNavigationDistance:", v44);
      v45 = -[PUBrowsingViewModel _scrubbingSessionDistance](self, "_scrubbingSessionDistance");
      v46 = v45 > 0 && v38;
      v47 = v45 < 0 && v39;
      if (v46 || v47)
        v48 = 0;
      else
        v48 = v45;
      -[PUBrowsingViewModel _setScrubbingSessionDistance:](self, "_setScrubbingSessionDistance:", v48 + v40);
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v49 = (NSDate *)objc_claimAutoreleasedReturnValue();
    -[NSDate timeIntervalSinceDate:](v49, "timeIntervalSinceDate:", self->_currentAssetReferenceChangedDate);
    self->_lastAssetWasCurrentForDuration = v50;
    currentAssetReferenceChangedDate = self->_currentAssetReferenceChangedDate;
    self->_currentAssetReferenceChangedDate = v49;

    -[PUBrowsingViewModel _invalidateBrowsingSpeedRegime](self, "_invalidateBrowsingSpeedRegime");
  }
  -[PUBrowsingViewModel _setCurrentAssetTransitionProgress:](self, "_setCurrentAssetTransitionProgress:", a4);
  -[PUBrowsingViewModel _setTransitionDriverIdentifier:](self, "_setTransitionDriverIdentifier:", v13);
  self->_assetChangesShouldAnimate = a6;
  -[PUBrowsingViewModel _invalidateCurrentAndNeighboringAssetViewModels](self, "_invalidateCurrentAndNeighboringAssetViewModels");
  -[PUBrowsingViewModel _invalidateImageAnalysisInteraction](self, "_invalidateImageAnalysisInteraction");
  -[PUBrowsingViewModel _updateIfNeeded](self, "_updateIfNeeded");

}

- (PUAssetReference)currentAssetReference
{
  PUAssetReference *currentAssetReference;
  void *v4;
  PUAssetReference *v5;
  PUAssetReference *v6;

  currentAssetReference = self->_currentAssetReference;
  if (!currentAssetReference)
  {
    -[PUBrowsingViewModel assetsDataSource](self, "assetsDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startingAssetReference");
    v5 = (PUAssetReference *)objc_claimAutoreleasedReturnValue();
    v6 = self->_currentAssetReference;
    self->_currentAssetReference = v5;

    currentAssetReference = self->_currentAssetReference;
  }
  return currentAssetReference;
}

- (void)setCurrentAssetReference:(id)a3
{
  PUAssetReference *v4;
  PUAssetReference *currentAssetReference;
  BOOL v6;
  void *v7;
  void *v8;
  PUAssetReference *v9;

  v4 = (PUAssetReference *)a3;
  currentAssetReference = self->_currentAssetReference;
  if (currentAssetReference != v4)
  {
    v9 = v4;
    v6 = -[PUAssetReference isEqual:](currentAssetReference, "isEqual:", v4);
    v4 = v9;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "UUIDString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUBrowsingViewModel setCurrentAssetReference:transitionProgress:transitionDriverIdentifier:animated:](self, "setCurrentAssetReference:transitionProgress:transitionDriverIdentifier:animated:", v9, v8, 0, 0.0);

      v4 = v9;
    }
  }

}

- (void)_setCurrentAssetTransitionProgress:(double)a3
{
  id v3;

  if (self->_currentAssetTransitionProgress != a3)
  {
    self->_currentAssetTransitionProgress = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setCurrentAssetTransitionProgressDidChange:", 1);

  }
}

- (void)_setTransitionDriverIdentifier:(id)a3
{
  NSString *v4;
  NSString *transitionDriverIdentifier;
  id v6;

  if (self->_transitionDriverIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    transitionDriverIdentifier = self->_transitionDriverIdentifier;
    self->_transitionDriverIdentifier = v4;

    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setTransitionDriverIdentifierDidChange:", 1);

  }
}

- (void)_setBrowsingSpeedRegime:(int64_t)a3
{
  void *v4;

  if (self->_browsingSpeedRegime != a3)
  {
    self->_browsingSpeedRegime = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setBrowsingSpeedRegimeDidChange:", 1);

    -[PUBrowsingViewModel _invalidateAllAssetViewModels](self, "_invalidateAllAssetViewModels");
  }
}

- (void)setIsScrubbing:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_isScrubbing != a3)
  {
    if (self->_isScrubbing)
    {
      PLOneUpGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        -[PUBrowsingViewModel currentAssetReference](self, "currentAssetReference");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "asset");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v8;
        _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Scrubbing ended on asset UUID: %{public}@", (uint8_t *)&v10, 0xCu);

      }
    }
    self->_isScrubbing = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setIsScrubbingDidChange:", 1);

    -[PUBrowsingViewModel _setScrubbingSessionDistance:](self, "_setScrubbingSessionDistance:", 0);
    -[PUBrowsingViewModel _invalidateAllAssetViewModels](self, "_invalidateAllAssetViewModels");
    -[PUBrowsingViewModel _invalidateBrowsingSpeedRegime](self, "_invalidateBrowsingSpeedRegime");
  }
}

- (void)setVideoOverlayPlayState:(int64_t)a3
{
  void *v4;

  if (self->_videoOverlayPlayState != a3)
  {
    self->_videoOverlayPlayState = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setVideoOverlayPlayStateDidChange:", 1);

    -[PUBrowsingViewModel _invalidateAllAssetViewModels](self, "_invalidateAllAssetViewModels");
    -[PUBrowsingViewModel _invalidateBrowsingSpeedRegime](self, "_invalidateBrowsingSpeedRegime");
  }
}

- (void)setIsAttemptingToPlayVideoOverlay:(BOOL)a3
{
  id v3;

  if (self->_isAttemptingToPlayVideoOverlay != a3)
  {
    self->_isAttemptingToPlayVideoOverlay = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setIsAttemptingToPlayVideoOverlayDidChange:", 1);

  }
}

- (void)setIsScrolling:(BOOL)a3
{
  void *v4;

  if (self->_isScrolling != a3)
  {
    self->_isScrolling = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setIsScrollingDidChange:", 1);

    -[PUBrowsingViewModel _invalidateAllAssetViewModels](self, "_invalidateAllAssetViewModels");
  }
}

- (void)setLivePhotoShouldPlay:(BOOL)a3
{
  id v3;

  if (self->_livePhotoShouldPlay != a3)
  {
    self->_livePhotoShouldPlay = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLivePhotoShouldPlayDidChange:", 1);

  }
}

- (void)setAnimating:(BOOL)a3 transitionWithIdentifier:(id)a4
{
  int v4;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingViewModel.m"), 508, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionIdentifier"));

  }
  -[PUBrowsingViewModel _animatingTransitionIdentifiers](self, "_animatingTransitionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", v10) != v4)
  {
    if (v4)
    {
      v8 = v10;
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUBrowsingViewModel _setAnimatingTransitionIdentifiers:](self, "_setAnimatingTransitionIdentifiers:", v7);
        v8 = v10;
      }
      objc_msgSend(v7, "addObject:", v8);
    }
    else
    {
      objc_msgSend(v7, "removeObject:", v10);
    }
    -[PUBrowsingViewModel _setAnimatingAnyTransition:](self, "_setAnimatingAnyTransition:", objc_msgSend(v7, "count") != 0);
  }

}

- (void)_setAnimatingAnyTransition:(BOOL)a3
{
  void *v4;

  if (self->_isAnimatingAnyTransition != a3)
  {
    self->_isAnimatingAnyTransition = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setAnimatingAnyTransitionDidChange:", 1);

    -[PUBrowsingViewModel _invalidateAllAssetViewModels](self, "_invalidateAllAssetViewModels");
  }
}

- (void)setSecondScreenSize:(CGSize)a3
{
  id v4;

  if (a3.width != self->_secondScreenSize.width || a3.height != self->_secondScreenSize.height)
  {
    self->_secondScreenSize = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setSecondScreenSizeDidChange:", 1);

  }
}

- (void)setIsPresentedForPreview:(BOOL)a3
{
  id v3;

  if (self->_isPresentedForPreview != a3)
  {
    self->_isPresentedForPreview = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsPresentedForPreviewDidChange:", 1);

  }
}

- (void)setAccessoryViewsDefaultVisibility:(BOOL)a3
{
  -[PUBrowsingViewModel setAccessoryViewsDefaultVisibility:changeReason:](self, "setAccessoryViewsDefaultVisibility:changeReason:", a3, 0);
}

- (void)setAccessoryViewsDefaultVisibility:(BOOL)a3 changeReason:(int64_t)a4
{
  if (self->_accessoryViewsDefaultVisibility != a3)
  {
    self->_accessoryViewsDefaultVisibility = a3;
    -[PUBrowsingViewModel _resetAccessoryViewsVisibilityToDefaultWithChangeReason:](self, "_resetAccessoryViewsVisibilityToDefaultWithChangeReason:", a4);
  }
}

- (void)_resetAccessoryViewsVisibilityToDefaultWithChangeReason:(int64_t)a3
{
  BOOL v5;
  id v6;
  _QWORD v7[5];
  BOOL v8;

  v5 = -[PUBrowsingViewModel accessoryViewsDefaultVisibility](self, "accessoryViewsDefaultVisibility");
  v6 = (id)-[PUCachedMapTable copy](self->_viewModelByAssetReference, "copy");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__PUBrowsingViewModel__resetAccessoryViewsVisibilityToDefaultWithChangeReason___block_invoke;
  v7[3] = &__block_descriptor_41_e51_v32__0__PUAssetReference_8__PUAssetViewModel_16_B24l;
  v8 = v5;
  v7[4] = a3;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)setIsInSelectionMode:(BOOL)a3
{
  id v3;

  if (self->_isInSelectionMode != a3)
  {
    self->_isInSelectionMode = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setIsInSelectionModeDidChange:", 1);

  }
}

- (void)setIsAnimatingPresentationSize:(BOOL)a3
{
  id v3;

  if (self->_isAnimatingPresentationSize != a3)
  {
    self->_isAnimatingPresentationSize = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsAnimatingPresentationSizeDidChange:", 1);

  }
}

- (void)setChromeVisible:(BOOL)a3
{
  -[PUBrowsingViewModel setChromeVisible:changeReason:](self, "setChromeVisible:changeReason:", a3, 0);
}

- (void)setChromeVisible:(BOOL)a3 changeReason:(int64_t)a4
{
  -[PUBrowsingViewModel setChromeVisible:changeReason:context:](self, "setChromeVisible:changeReason:context:", a3, a4, 0);
}

- (void)setChromeVisible:(BOOL)a3 changeReason:(int64_t)a4 context:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  char v10;
  void *v11;
  NSDate *v12;
  NSDate *lastChromeVisibilityChangeDate;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  char v20;
  char v21;
  id v22;

  v6 = a3;
  v8 = a5;
  if (self->_isChromeVisible != v6)
  {
    v22 = v8;
    if (a4 != 1
      || v6
      || (-[PUBrowsingViewModel assetsDataSource](self, "assetsDataSource"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEmpty"),
          v9,
          v8 = v22,
          (v10 & 1) == 0))
    {
      self->_isChromeVisible = v6;
      -[PUBrowsingViewModel currentChange](self, "currentChange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_setChromeVisibilityDidChange:", 1);

      -[PUBrowsingViewModel _setLastChromeVisibilityChangeReason:](self, "_setLastChromeVisibilityChangeReason:", a4);
      -[PUBrowsingViewModel _setLastChromeVisibilityChangeContext:](self, "_setLastChromeVisibilityChangeContext:", v22);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastChromeVisibilityChangeDate = self->_lastChromeVisibilityChangeDate;
      self->_lastChromeVisibilityChangeDate = v12;

      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "persistChromeVisibility");

      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBool:forKey:", v6, CFSTR("browsingChromeVisibility"));

      }
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "userInterfaceIdiom");

      if (v18 == 1 && -[PUBrowsingViewModel horizontalSizeClass](self, "horizontalSizeClass") == 2)
      {
        +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "hideFloatingInfoPanelWhenHidingChrome");

        v21 = v20 ^ 1;
      }
      else
      {
        v21 = 0;
      }
      v8 = v22;
      if (a4 != 5 && !v6 && (v21 & 1) == 0)
      {
        -[PUBrowsingViewModel setAccessoryViewsDefaultVisibility:changeReason:](self, "setAccessoryViewsDefaultVisibility:changeReason:", 0, 3);
        -[PUBrowsingViewModel _resetAccessoryViewsVisibilityToDefaultWithChangeReason:](self, "_resetAccessoryViewsVisibilityToDefaultWithChangeReason:", 3);
        v8 = v22;
      }
    }
  }

}

- (void)setPresentingOverOneUp:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (self->_presentingOverOneUp != a3)
  {
    self->_presentingOverOneUp = a3;
    if (a3)
    {
      -[PUBrowsingViewModel videoPlayer](self, "videoPlayer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __46__PUBrowsingViewModel_setPresentingOverOneUp___block_invoke;
      v6[3] = &unk_1E58ABD10;
      v6[4] = self;
      objc_msgSend(v4, "performChanges:", v6);

    }
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setPresentingOverOneUpDidChange:", 1);

  }
}

- (void)setVideoContentAllowed:(BOOL)a3 forReason:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingViewModel.m"), 666, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  -[PUBrowsingViewModel _videoDisallowedReasons](self, "_videoDisallowedReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3)
  {
    objc_msgSend(v7, "removeObject:", v10);
LABEL_9:
    -[PUBrowsingViewModel _setVideoContentAllowed:](self, "_setVideoContentAllowed:", objc_msgSend(v8, "count") == 0);
    goto LABEL_10;
  }
  if ((objc_msgSend(v7, "containsObject:", v10) & 1) == 0)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUBrowsingViewModel _setVideoDisallowedReasons:](self, "_setVideoDisallowedReasons:", v8);
    }
    objc_msgSend(v8, "addObject:", v10);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)setVideoContentAllowedForAllReasons
{
  id v3;

  -[PUBrowsingViewModel _videoDisallowedReasons](self, "_videoDisallowedReasons");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");
  -[PUBrowsingViewModel _setVideoContentAllowed:](self, "_setVideoContentAllowed:", 1);

}

- (void)_setVideoContentAllowed:(BOOL)a3
{
  void *v5;
  id v6;
  _QWORD v7[4];
  BOOL v8;

  if (self->_videoContentAllowed != a3)
  {
    self->_videoContentAllowed = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsVideoContentAllowedDidChange:", 1);

    v6 = (id)-[PUCachedMapTable copy](self->_viewModelByAssetReference, "copy");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__PUBrowsingViewModel__setVideoContentAllowed___block_invoke;
    v7[3] = &__block_descriptor_33_e51_v32__0__PUAssetReference_8__PUAssetViewModel_16_B24l;
    v8 = a3;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
}

- (BOOL)isVideoContentAllowed
{
  return self->_videoContentAllowed;
}

- (id)activeAssetReferences
{
  void *v2;
  void *v3;

  -[PUCachedMapTable keyEnumerator](self->_viewModelByAssetReference, "keyEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)assetViewModelForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PUAssetViewModel *v7;
  PUAssetViewModel *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  PUAssetViewModel *v14;
  PUBrowsingViewModel *v15;
  id v16;

  v4 = a3;
  -[PUBrowsingViewModel assetsDataSource](self, "assetsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetReferenceForAssetReference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PUCachedMapTable objectForKey:](self->_viewModelByAssetReference, "objectForKey:", v6);
    v7 = (PUAssetViewModel *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v8 = -[PUAssetViewModel initWithLowMemoryMode:]([PUAssetViewModel alloc], "initWithLowMemoryMode:", -[PUBrowsingViewModel lowMemoryMode](self, "lowMemoryMode"));
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __55__PUBrowsingViewModel_assetViewModelForAssetReference___block_invoke;
      v13[3] = &unk_1E58AB790;
      v7 = v8;
      v14 = v7;
      v15 = self;
      v9 = v6;
      v16 = v9;
      -[PUViewModel performChanges:](v7, "performChanges:", v13);
      objc_msgSend(v9, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUBrowsingViewModel _assetSharedViewModelForAsset:createIfNeeded:](self, "_assetSharedViewModelForAsset:createIfNeeded:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[PUAssetViewModel setAssetSharedViewModel:](v7, "setAssetSharedViewModel:", v11);
      -[PUCachedMapTable setObject:forKey:](self->_viewModelByAssetReference, "setObject:forKey:", v7, v9);
      -[PUAssetViewModel setAssetReference:](v7, "setAssetReference:", v9);
      -[PUAssetViewModel registerChangeObserver:](v7, "registerChangeObserver:", self);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setSearchQueryMatchInfo:(id)a3
{
  PXSearchQueryMatchInfo *v4;
  PXSearchQueryMatchInfo *v5;
  PXSearchQueryMatchInfo *v6;
  char v7;
  _QWORD v8[5];
  PXSearchQueryMatchInfo *v9;

  v4 = (PXSearchQueryMatchInfo *)a3;
  v5 = self->_searchQueryMatchInfo;
  if (v5 == v4)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXSearchQueryMatchInfo isEqual:](v4, "isEqual:", v5);

    if ((v7 & 1) == 0)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __47__PUBrowsingViewModel_setSearchQueryMatchInfo___block_invoke;
      v8[3] = &unk_1E58ABCA8;
      v8[4] = self;
      v9 = v4;
      -[PUViewModel performChanges:](self, "performChanges:", v8);

    }
  }

}

- (PUAssetViewModel)assetViewModelForCurrentAssetReference
{
  void *v3;
  void *v4;

  -[PUBrowsingViewModel currentAssetReference](self, "currentAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUBrowsingViewModel assetViewModelForAssetReference:](self, "assetViewModelForAssetReference:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (PUAssetViewModel *)v4;
}

- (id)assetSharedViewModelForAsset:(id)a3
{
  return -[PUBrowsingViewModel _assetSharedViewModelForAsset:createIfNeeded:](self, "_assetSharedViewModelForAsset:createIfNeeded:", a3, 1);
}

- (id)assetSharedViewModelForAssetUUID:(id)a3
{
  return -[PUCachedMapTable objectForKey:](self->_assetSharedViewModelByAssetUUID, "objectForKey:", a3);
}

- (id)_assetSharedViewModelForAsset:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  PUAssetSharedViewModel *v8;
  BOOL v9;
  PUAssetSharedViewModel *v10;
  void *v11;
  id v12;
  PUCachedMapTable *assetSharedViewModelByAssetUUID;
  void *v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  PUAssetSharedViewModel *v19;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingViewModel.m"), 788, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

  }
  -[PUCachedMapTable objectForKey:](self->_assetSharedViewModelByAsset, "objectForKey:", v7);
  v8 = (PUAssetSharedViewModel *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = 1;
  else
    v9 = !v4;
  if (!v9)
  {
    v10 = -[PUAssetSharedViewModel initWithAsset:]([PUAssetSharedViewModel alloc], "initWithAsset:", v7);
    v11 = (void *)-[PUCachedMapTable copy](self->_viewModelByAssetReference, "copy");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__PUBrowsingViewModel__assetSharedViewModelForAsset_createIfNeeded___block_invoke;
    v17[3] = &unk_1E589D8C8;
    v12 = v7;
    v18 = v12;
    v8 = v10;
    v19 = v8;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v17);

    -[PUCachedMapTable setObject:forKey:](self->_assetSharedViewModelByAsset, "setObject:forKey:", v8, v12);
    assetSharedViewModelByAssetUUID = self->_assetSharedViewModelByAssetUUID;
    objc_msgSend(v12, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUCachedMapTable setObject:forKey:](assetSharedViewModelByAssetUUID, "setObject:forKey:", v8, v14);

    -[PUAssetSharedViewModel registerChangeObserver:](v8, "registerChangeObserver:", self);
  }

  return v8;
}

- (void)setNavigationBarTitle:(id)a3
{
  NSString *v4;
  NSString *navigationBarTitle;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToString:", self->_navigationBarTitle) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    navigationBarTitle = self->_navigationBarTitle;
    self->_navigationBarTitle = v4;

    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setNavigationBarTitleDidChange:", 1);

  }
}

- (void)setResizeTaskDescriptorViewModel:(id)a3
{
  PUPhotoPickerResizeTaskDescriptorViewModel *v5;
  void *v6;
  PUPhotoPickerResizeTaskDescriptorViewModel *v7;

  v5 = (PUPhotoPickerResizeTaskDescriptorViewModel *)a3;
  if (self->_resizeTaskDescriptorViewModel != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, a3);
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setResizeTaskDescriptorViewModelDidChange:", 1);

    v5 = v7;
  }

}

- (void)setReviewScreenBarsModel:(id)a3
{
  PUReviewScreenBarsModel *v5;
  void *v6;
  PUReviewScreenBarsModel *v7;

  v5 = (PUReviewScreenBarsModel *)a3;
  if (self->_reviewScreenBarsModel != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_reviewScreenBarsModel, a3);
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setReviewScreenBarsModelDidChange:", 1);

    v5 = v7;
  }

}

- (void)signalReviewScreenSelectionChanged
{
  id v2;

  -[PUBrowsingViewModel currentChange](self, "currentChange");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setReviewScreenSelectionDidChange:", 1);

}

- (void)setContentPrivacyState:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  if (self->_contentPrivacyState != a3)
  {
    self->_contentPrivacyState = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setContentPrivacyStateDidChange:", 1);

    -[PUBrowsingViewModel assetViewModelForCurrentAssetReference](self, "assetViewModelForCurrentAssetReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isAccessoryViewVisible"))
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __46__PUBrowsingViewModel_setContentPrivacyState___block_invoke;
      v6[3] = &unk_1E58ABD10;
      v7 = v5;
      objc_msgSend(v7, "performChanges:", v6);

    }
  }
}

- (void)setSystemAuthenticationType:(int64_t)a3
{
  id v3;

  if (self->_systemAuthenticationType != a3)
  {
    self->_systemAuthenticationType = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setSystemAuthenticationTypeDidChange:", 1);

  }
}

- (void)setWantsContentUnavailableUnlockButtonVisible:(BOOL)a3
{
  id v3;

  if (self->_wantsContentUnavailableUnlockButtonVisible != a3)
  {
    self->_wantsContentUnavailableUnlockButtonVisible = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setWantsContentUnavailableUnlockButtonVisibleDidChange:", 1);

  }
}

- (void)setIsFillScreenModeEnabled:(BOOL)a3
{
  id v3;

  if (self->_isFillScreenModeEnabled != a3)
  {
    self->_isFillScreenModeEnabled = a3;
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsFillScreenModeEnabledDidChange:", 1);

  }
}

- (void)setMediaProvider:(id)a3
{
  PUMediaProvider *v5;
  PUMediaProvider *v6;

  v5 = (PUMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    v5 = v6;
  }

}

- (void)setVideoPlayer:(id)a3
{
  PUBrowsingVideoPlayer *v5;
  void *v6;
  NSObject *v7;
  int v8;
  PUBrowsingVideoPlayer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (PUBrowsingVideoPlayer *)a3;
  if (self->_videoPlayer != v5)
  {
    objc_storeStrong((id *)&self->_videoPlayer, a3);
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVideoPlayerDidChange:", 1);

    PLVideoPlaybackGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "1-Up video player has become: %@", (uint8_t *)&v8, 0xCu);
    }

    -[PUBrowsingViewModel _invalidateAllAssetViewModels](self, "_invalidateAllAssetViewModels");
  }

}

- (void)setImageAnalysisInteraction:(id)a3
{
  PUImageAnalysisInteraction *v5;
  PUImageAnalysisInteraction *imageAnalysisInteraction;
  void *v7;
  NSObject *v8;
  int v9;
  PUImageAnalysisInteraction *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (PUImageAnalysisInteraction *)a3;
  imageAnalysisInteraction = self->_imageAnalysisInteraction;
  if (imageAnalysisInteraction != v5)
  {
    -[PUImageAnalysisInteraction setBrowsingViewModel:](imageAnalysisInteraction, "setBrowsingViewModel:", 0);
    objc_storeStrong((id *)&self->_imageAnalysisInteraction, a3);
    -[PUImageAnalysisInteraction setBrowsingViewModel:](self->_imageAnalysisInteraction, "setBrowsingViewModel:", self);
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImageAnalysisInteractionDidChange:", 1);

    PLVisualIntelligenceGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "1-Up image Analysis Interaction has become: %@", (uint8_t *)&v9, 0xCu);
    }

    -[PUBrowsingViewModel _invalidateAllAssetViewModels](self, "_invalidateAllAssetViewModels");
  }

}

- (void)setIsInteractingWithVideoScrubber:(BOOL)a3
{
  id v4;

  if (self->_isInteractingWithVideoScrubber != a3)
  {
    self->_isInteractingWithVideoScrubber = a3;
    -[PUBrowsingViewModel _invalidateAllAssetViewModels](self, "_invalidateAllAssetViewModels");
    -[PUBrowsingViewModel currentChange](self, "currentChange");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsInteractingWithVideoScrubberDidChange:", 1);

  }
}

- (void)videoScrubberInteractionWillStart:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PUBrowsingViewModel videoScrubberInteractionIdentifiers](self, "videoScrubberInteractionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[PUBrowsingViewModel _updateIsInteractingWithVideoScrubber](self, "_updateIsInteractingWithVideoScrubber");
}

- (void)videoScrubberInteractionDidEnd:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PUBrowsingViewModel videoScrubberInteractionIdentifiers](self, "videoScrubberInteractionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[PUBrowsingViewModel _updateIsInteractingWithVideoScrubber](self, "_updateIsInteractingWithVideoScrubber");
}

- (void)_updateIsInteractingWithVideoScrubber
{
  id v3;

  -[PUBrowsingViewModel videoScrubberInteractionIdentifiers](self, "videoScrubberInteractionIdentifiers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PUBrowsingViewModel setIsInteractingWithVideoScrubber:](self, "setIsInteractingWithVideoScrubber:", objc_msgSend(v3, "count") != 0);

}

- (BOOL)_needsUpdate
{
  return -[NSMutableSet count](self->_invalidAssetViewModels, "count")
      || self->_allAssetViewModelsAreInvalid
      || !self->_browsingSpeedRegimeIsValid
      || self->_needsUpdatePlaybackAudioSession
      || -[PUBrowsingViewModel needsUpdateVideoPlayerController](self, "needsUpdateVideoPlayerController")
      || -[PUBrowsingViewModel needsUpdateImageAnalysisInteraction](self, "needsUpdateImageAnalysisInteraction");
}

- (void)_updateIfNeeded
{
  if (-[PUBrowsingViewModel _needsUpdate](self, "_needsUpdate"))
  {
    -[PUBrowsingViewModel _updateScrubSpeedRegimeIfNeeded](self, "_updateScrubSpeedRegimeIfNeeded");
    -[PUBrowsingViewModel _updateVideoPlayerControllerIfNeeded](self, "_updateVideoPlayerControllerIfNeeded");
    -[PUBrowsingViewModel _updateImageAnalysisInteractionIfNeeded](self, "_updateImageAnalysisInteractionIfNeeded");
    -[PUBrowsingViewModel _updateAssetViewModelsIfNeeded](self, "_updateAssetViewModelsIfNeeded");
    -[PUBrowsingViewModel _updatePlaybackAudioSessionIfNeeded](self, "_updatePlaybackAudioSessionIfNeeded");
  }
}

- (void)_invalidatePlaybackAudioSession
{
  self->_needsUpdatePlaybackAudioSession = 1;
}

- (void)_updatePlaybackAudioSessionIfNeeded
{
  void *v3;
  int v4;
  id *v5;
  id v6;
  void *v7;
  id v8;

  if (self->_needsUpdatePlaybackAudioSession)
  {
    self->_needsUpdatePlaybackAudioSession = 0;
    objc_msgSend(MEMORY[0x1E0D7BBB0], "sharedController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isMuted");

    v5 = (id *)MEMORY[0x1E0C89660];
    if (!v4)
      v5 = (id *)MEMORY[0x1E0C89690];
    v6 = *v5;
    if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
    {
      -[PUBrowsingViewModel audioSessionUpdateQueue](self, "audioSessionUpdateQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      PXDispatchAsyncWithSignpost();

    }
  }
}

- (void)_invalidateBrowsingSpeedRegime
{
  self->_browsingSpeedRegimeIsValid = 0;
}

- (void)_updateScrubSpeedRegimeIfNeeded
{
  int64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v24;
  id v25;

  if (!self->_browsingSpeedRegimeIsValid)
  {
    self->_browsingSpeedRegimeIsValid = 1;
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[PUBrowsingViewModel browsingSpeedRegime](self, "browsingSpeedRegime");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", self->_currentAssetReferenceChangedDate);
    v6 = v5;

    if (-[PUBrowsingViewModel isScrubbing](self, "isScrubbing"))
    {
      objc_msgSend(v25, "visibilityDurationForExitingFastRegime");
      v8 = v7;
      if (v3 == 2)
      {
        if (v6 < v7 && self->_lastAssetWasCurrentForDuration < v7)
        {
LABEL_33:
          v24 = 2;
LABEL_37:
          -[PUBrowsingViewModel _invalidateBrowsingSpeedRegimeAfterMaximumDelay:](self, "_invalidateBrowsingSpeedRegimeAfterMaximumDelay:", v8);
LABEL_39:
          -[PUBrowsingViewModel _setBrowsingSpeedRegime:](self, "_setBrowsingSpeedRegime:", v24);

          return;
        }
      }
      else if (!v3)
      {
        objc_msgSend(v25, "visibilityDurationForEnteringFastRegime");
        v10 = v9;
        v11 = -[PUBrowsingViewModel _scrubbingSessionDistance](self, "_scrubbingSessionDistance");
        v12 = v11 >= 0 ? v11 : -v11;
        v13 = objc_msgSend(v25, "minNavigationDistanceForFastRegime");
        v14 = self->_lastAssetWasCurrentForDuration < v10 && v6 < v10;
        if (v14 && v12 > v13)
          goto LABEL_33;
      }
LABEL_38:
      v24 = 0;
      goto LABEL_39;
    }
    objc_msgSend(v25, "visibilityDurationForExitingQuickPagingRegime");
    v8 = v16;
    if (v3 == 1)
    {
      if (v6 >= v16 || self->_lastAssetWasCurrentForDuration >= v16)
        goto LABEL_38;
    }
    else
    {
      if (v3)
        goto LABEL_38;
      objc_msgSend(v25, "visibilityDurationForEnteringQuickPagingRegime");
      v18 = v17;
      v19 = -[PUBrowsingViewModel _scrubbingSessionDistance](self, "_scrubbingSessionDistance");
      v20 = v19 >= 0 ? v19 : -v19;
      v21 = objc_msgSend(v25, "minNavigationDistanceForQuickPagingRegime");
      v22 = self->_lastAssetWasCurrentForDuration < v18 && v6 < v18;
      if (!v22 || v20 <= v21)
        goto LABEL_38;
    }
    v24 = 1;
    goto LABEL_37;
  }
}

- (void)_invalidateBrowsingSpeedRegimeAfterMaximumDelay:(double)a3
{
  dispatch_time_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_isBrowsingSpeedRegimeInvalidationScheduled)
  {
    self->_isBrowsingSpeedRegimeInvalidationScheduled = 1;
    objc_initWeak(&location, self);
    v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__PUBrowsingViewModel__invalidateBrowsingSpeedRegimeAfterMaximumDelay___block_invoke;
    v5[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v6, &location);
    dispatch_after(v4, MEMORY[0x1E0C80D38], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_handleAsyncBrowsingSpeedRegimeInvalidation
{
  _QWORD v2[5];

  self->_isBrowsingSpeedRegimeInvalidationScheduled = 0;
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __66__PUBrowsingViewModel__handleAsyncBrowsingSpeedRegimeInvalidation__block_invoke;
  v2[3] = &unk_1E58ABD10;
  v2[4] = self;
  -[PUViewModel performChanges:](self, "performChanges:", v2);
}

- (void)_invalidateVideoPlayerController
{
  -[PUBrowsingViewModel setNeedsUpdateVideoPlayerController:](self, "setNeedsUpdateVideoPlayerController:", 1);
}

- (void)_updateVideoPlayerControllerIfNeeded
{
  id v3;

  if (-[PUBrowsingViewModel needsUpdateVideoPlayerController](self, "needsUpdateVideoPlayerController"))
  {
    -[PUBrowsingViewModel setNeedsUpdateVideoPlayerController:](self, "setNeedsUpdateVideoPlayerController:", 0);
    -[PUBrowsingViewModel videoPlayerController](self, "videoPlayerController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateWithBrowsingViewModel:", self);

  }
}

- (void)_invalidateImageAnalysisInteraction
{
  -[PUBrowsingViewModel setNeedsUpdateImageAnalysisInteraction:](self, "setNeedsUpdateImageAnalysisInteraction:", 1);
}

- (void)_updateImageAnalysisInteractionIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  id location;

  if (-[PUBrowsingViewModel needsUpdateImageAnalysisInteraction](self, "needsUpdateImageAnalysisInteraction"))
  {
    -[PUBrowsingViewModel setNeedsUpdateImageAnalysisInteraction:](self, "setNeedsUpdateImageAnalysisInteraction:", 0);
    -[PUBrowsingViewModel imageAnalysisInteraction](self, "imageAnalysisInteraction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isDrivingLivePhotoPlayback");

    if ((v4 & 1) == 0)
    {
      -[PUBrowsingViewModel imageAnalysisInteraction](self, "imageAnalysisInteraction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {

      }
      else if (!-[PUBrowsingViewModel creatingImageAnalysisInteraction](self, "creatingImageAnalysisInteraction"))
      {
        -[PUBrowsingViewModel setCreatingImageAnalysisInteraction:](self, "setCreatingImageAnalysisInteraction:", 1);
        objc_initWeak(&location, self);
        objc_copyWeak(&v6, &location);
        px_dispatch_on_main_queue_when_idle_after_delay();
        objc_destroyWeak(&v6);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)_invalidateAllAssetViewModels
{
  self->_allAssetViewModelsAreInvalid = 1;
}

- (void)_invalidateCurrentAndNeighboringAssetViewModels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PUBrowsingViewModel currentAssetReference](self, "currentAssetReference");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PUBrowsingViewModel leadingAssetReference](self, "leadingAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBrowsingViewModel trailingAssetReference](self, "trailingAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCachedMapTable objectForKey:](self->_viewModelByAssetReference, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCachedMapTable objectForKey:](self->_viewModelByAssetReference, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUCachedMapTable objectForKey:](self->_viewModelByAssetReference, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[PUBrowsingViewModel _invalidateAssetViewModel:](self, "_invalidateAssetViewModel:", v5);
  if (v6)
    -[PUBrowsingViewModel _invalidateAssetViewModel:](self, "_invalidateAssetViewModel:", v6);
  if (v7)
    -[PUBrowsingViewModel _invalidateAssetViewModel:](self, "_invalidateAssetViewModel:", v7);

}

- (void)_invalidateAssetViewModel:(id)a3
{
  -[NSMutableSet addObject:](self->_invalidAssetViewModels, "addObject:", a3);
}

- (void)_updateAssetViewModelsIfNeeded
{
  void *v3;
  NSMutableSet *invalidAssetViewModels;
  _QWORD v5[5];
  _QWORD v6[5];

  if (self->_allAssetViewModelsAreInvalid)
    goto LABEL_2;
  if (-[NSMutableSet count](self->_invalidAssetViewModels, "count"))
  {
    if (!self->_allAssetViewModelsAreInvalid)
    {
      invalidAssetViewModels = self->_invalidAssetViewModels;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __53__PUBrowsingViewModel__updateAssetViewModelsIfNeeded__block_invoke_2;
      v5[3] = &unk_1E589D958;
      v5[4] = self;
      -[NSMutableSet enumerateObjectsUsingBlock:](invalidAssetViewModels, "enumerateObjectsUsingBlock:", v5);
      goto LABEL_3;
    }
LABEL_2:
    v3 = (void *)-[PUCachedMapTable copy](self->_viewModelByAssetReference, "copy");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__PUBrowsingViewModel__updateAssetViewModelsIfNeeded__block_invoke;
    v6[3] = &unk_1E589D930;
    v6[4] = self;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

LABEL_3:
    -[NSMutableSet removeAllObjects](self->_invalidAssetViewModels, "removeAllObjects");
    self->_allAssetViewModelsAreInvalid = 0;
  }
}

- (void)_updateAssetViewModel:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  BOOL videoContentAllowed;
  void *v9;
  BOOL v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;
  id v15;
  BOOL v16;
  _QWORD v17[4];
  id v18;
  PUBrowsingViewModel *v19;
  id v20;
  uint64_t v21;
  BOOL v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  char v28;

  v4 = a3;
  objc_msgSend(v4, "assetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PUBrowsingViewModel isScrubbing](self, "isScrubbing");
  v6 = -[PUBrowsingViewModel isAnimatingAnyTransition](self, "isAnimatingAnyTransition");
  v7 = -[PUBrowsingViewModel browsingSpeedRegime](self, "browsingSpeedRegime") > 0;
  videoContentAllowed = self->_videoContentAllowed;
  objc_msgSend(v4, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "playbackStyle") == 5;

  LOBYTE(v9) = PXIsOLEDDevice();
  objc_msgSend(v5, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "mediaSubtypes");

  -[PUBrowsingViewModel _focusValueForAsset:](self, "_focusValueForAsset:", v5);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke;
  v17[3] = &unk_1E589D9A8;
  v18 = v4;
  v19 = self;
  v21 = v13;
  v22 = v16;
  v23 = v6;
  v24 = v7;
  v25 = videoContentAllowed;
  v26 = v10;
  v27 = (v12 & 0x100000) != 0;
  v28 = (char)v9;
  v20 = v5;
  v14 = v5;
  v15 = v4;
  objc_msgSend(v15, "performChanges:", v17);

}

- (void)_updateContentPrivacyState
{
  void *v3;
  char v4;
  _QWORD v5[5];
  char v6;

  -[PUBrowsingViewModel privacyController](self, "privacyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocked");

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__PUBrowsingViewModel__updateContentPrivacyState__block_invoke;
  v5[3] = &unk_1E58AAD68;
  v5[4] = self;
  v6 = v4;
  -[PUViewModel performChanges:](self, "performChanges:", v5);
}

- (void)_updateSystemAuthenticationType
{
  void *v3;
  uint64_t v4;
  _QWORD v5[6];

  -[PUBrowsingViewModel privacyController](self, "privacyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "authenticationType");

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PUBrowsingViewModel__updateSystemAuthenticationType__block_invoke;
  v5[3] = &unk_1E58AACF0;
  v5[4] = self;
  v5[5] = v4;
  -[PUViewModel performChanges:](self, "performChanges:", v5);
}

- (void)_updateWantsContentUnavailableUnlockButtonVisible
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v8[5];
  char v9;
  char v10;

  -[PUBrowsingViewModel privacyController](self, "privacyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "willPerformAuthenticationAutomatically") ^ 1;

  objc_msgSend(MEMORY[0x1E0D7B290], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldAlwaysShowUnlockButtonInContentUnavailableViews");

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PUBrowsingViewModel__updateWantsContentUnavailableUnlockButtonVisible__block_invoke;
  v8[3] = &unk_1E58A7DF8;
  v8[4] = self;
  v9 = v4;
  v10 = v7;
  -[PUViewModel performChanges:](self, "performChanges:", v8);
}

- (void)_updateNeighboringAssetReferences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  -[PUBrowsingViewModel assetsDataSource](self, "assetsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBrowsingViewModel currentAssetReference](self, "currentAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__18860;
    v27 = __Block_byref_object_dispose__18861;
    v28 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __56__PUBrowsingViewModel__updateNeighboringAssetReferences__block_invoke;
    v20[3] = &unk_1E58A7BC0;
    v8 = v5;
    v21 = v8;
    v22 = &v23;
    objc_msgSend(v3, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v8, 1, v20);
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__18860;
    v18 = __Block_byref_object_dispose__18861;
    v19 = 0;
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __56__PUBrowsingViewModel__updateNeighboringAssetReferences__block_invoke_2;
    v11[3] = &unk_1E58A7BC0;
    v12 = v8;
    v13 = &v14;
    objc_msgSend(v3, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v12, 0, v11);
    if (v24[5])
    {
      objc_msgSend(v3, "assetReferenceAtIndexPath:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    if (v15[5])
    {
      objc_msgSend(v3, "assetReferenceAtIndexPath:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    -[PUBrowsingViewModel _setLeadingAssetReference:](self, "_setLeadingAssetReference:", v9);
    -[PUBrowsingViewModel _setTrailingAssetReference:](self, "_setTrailingAssetReference:", v10);

    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    -[PUBrowsingViewModel _setLeadingAssetReference:](self, "_setLeadingAssetReference:", 0);
    -[PUBrowsingViewModel _setTrailingAssetReference:](self, "_setTrailingAssetReference:", 0);
  }

}

- (double)_focusValueForAsset:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;

  v4 = a3;
  -[PUBrowsingViewModel currentAssetReference](self, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBrowsingViewModel currentAssetTransitionProgress](self, "currentAssetTransitionProgress");
  v7 = v6;
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    v8 = -v7;
    goto LABEL_14;
  }
  -[PUBrowsingViewModel trailingAssetReference](self, "trailingAssetReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "isEqual:", v9);

  if (v10)
  {
    v11 = 1.0;
LABEL_7:
    v8 = v11 - v7;
    goto LABEL_14;
  }
  -[PUBrowsingViewModel leadingAssetReference](self, "leadingAssetReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "isEqual:", v12);

  if (v13)
  {
    v11 = -1.0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "indexPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "compare:", v15);
  v17 = 0.0;
  if (v16 == 1)
    v17 = 2.0;
  if (v16 == -1)
    v8 = -2.0;
  else
    v8 = v17;

LABEL_14:
  return v8;
}

- (id)_badgeInfoPromiseForAssetReference:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v5 = a3;
  -[PUBrowsingViewModel assetsDataSource](self, "assetsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingViewModel.m"), 1351, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[assetReference dataSourceIdentifier] isEqual:[assetsDataSource identifier]]"));

  }
  objc_msgSend(v5, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "badgeInfoPromiseForAssetAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUBrowsingViewModel _filteredAllowedBadges:forAssetReference:](self, "_filteredAllowedBadges:forAssetReference:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_filteredAllowedBadges:(id)a3 forAssetReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a4;
  v7 = a3;
  -[PUBrowsingViewModel actionManager](self, "actionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PUBrowsingViewModel__filteredAllowedBadges_forAssetReference___block_invoke;
  v13[3] = &unk_1E589D9D0;
  v14 = v6;
  v15 = v8;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v7, "badgeInfoPromiseWithAdjustments:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)_importStateForAssetReference:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  -[PUBrowsingViewModel importStatusManager](self, "importStatusManager");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    objc_msgSend(v4, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "importStateForAsset:", v8);

    if ((unint64_t)(v9 - 1) >= 3)
      v7 = 0;
    else
      v7 = v9;
  }

  return v7;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingViewModel.m"), 1425, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[change isKindOfClass:[PUAssetViewModelChange class]]"));

    }
    -[PUBrowsingViewModel _handleAssetViewModel:didChange:](self, "_handleAssetViewModel:didChange:", v10, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingViewModel.m"), 1429, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[change isKindOfClass:[PUAssetSharedViewModelChange class]]"));

      }
      -[PUBrowsingViewModel _handleAssetSharedViewModel:didChange:](self, "_handleAssetSharedViewModel:didChange:", v10, v7);
    }
  }

}

- (void)_handleAssetViewModel:(id)a3 didChange:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "assetReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingViewModel.m"), 1437, CFSTR("Should always be able to lookup the asset reference of a view model"));

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__PUBrowsingViewModel__handleAssetViewModel_didChange___block_invoke;
  v14[3] = &unk_1E58A9AE0;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v17 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v9;
  -[PUViewModel performChanges:](self, "performChanges:", v14);

}

- (void)_handleAssetSharedViewModel:(id)a3 didChange:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v7 = a4;
  objc_msgSend(a3, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingViewModel.m"), 1460, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uuid.length > 0"));

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__PUBrowsingViewModel__handleAssetSharedViewModel_didChange___block_invoke;
  v13[3] = &unk_1E58AB790;
  v13[4] = self;
  v14 = v9;
  v15 = v7;
  v10 = v7;
  v11 = v9;
  -[PUViewModel performChanges:](self, "performChanges:", v13);

}

- (void)assetImportStatusManager:(id)a3 didChangeStatusForAssetReference:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PUBrowsingViewModel *v14;
  id v15;
  __int128 v16;
  __int128 v17;

  v5 = a4;
  -[PUBrowsingViewModel assetsDataSource](self, "assetsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "indexPath");
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  PXIndexPathFromSimpleIndexPath();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetReferenceAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUBrowsingViewModel assetViewModelForAssetReference:](self, "assetViewModelForAssetReference:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__PUBrowsingViewModel_assetImportStatusManager_didChangeStatusForAssetReference___block_invoke;
  v12[3] = &unk_1E58AB790;
  v13 = v9;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v9;
  objc_msgSend(v11, "performChanges:", v12);

}

- (void)oneUpVideoPlayerControllerPlayerDidChange:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  -[PUBrowsingViewModel videoPlayerController](self, "videoPlayerController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingViewModel.m"), 1486, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("controller == self.videoPlayerController"));

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__PUBrowsingViewModel_oneUpVideoPlayerControllerPlayerDidChange___block_invoke;
  v9[3] = &unk_1E58ABCA8;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  -[PUViewModel performChanges:](self, "performChanges:", v9);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  _QWORD v11[5];

  v6 = a4;
  v9 = a3;
  if ((void *)PUBrowsingViewModelPrivacyControllerObservationContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      -[PUBrowsingViewModel _updateContentPrivacyState](self, "_updateContentPrivacyState");
      if ((v6 & 4) == 0)
      {
LABEL_6:
        if ((v6 & 8) == 0)
          goto LABEL_8;
LABEL_7:
        -[PUBrowsingViewModel _updateWantsContentUnavailableUnlockButtonVisible](self, "_updateWantsContentUnavailableUnlockButtonVisible");
        goto LABEL_8;
      }
    }
    else if ((v6 & 4) == 0)
    {
      goto LABEL_6;
    }
    -[PUBrowsingViewModel _updateSystemAuthenticationType](self, "_updateSystemAuthenticationType");
    -[PUBrowsingViewModel _updateWantsContentUnavailableUnlockButtonVisible](self, "_updateWantsContentUnavailableUnlockButtonVisible");
    if ((v6 & 8) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if ((void *)VideoMuteControllerContext_18832 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingViewModel.m"), 1511, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__PUBrowsingViewModel_observable_didChange_context___block_invoke;
  v11[3] = &unk_1E58ABD10;
  v11[4] = self;
  -[PUViewModel performChanges:](self, "performChanges:", v11);
LABEL_8:

}

- (id)debugDetailedDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PUCachedMapTable *viewModelByAssetReference;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  PUBrowsingViewModel *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUCachedMapTable accurateCount](self->_viewModelByAssetReference, "accurateCount");
  objc_msgSend(v3, "appendFormat:", CFSTR("Asset View Models: %lu\n"), v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("Asset Shared View Models: %lu\n"), -[PUCachedMapTable accurateCount](self->_assetSharedViewModelByAsset, "accurateCount"));
  if (-[PUBrowsingViewModel isScrubbing](self, "isScrubbing"))
    objc_msgSend(v3, "appendString:", CFSTR("Scrubbing"));
  if (-[PUBrowsingViewModel isScrolling](self, "isScrolling"))
    objc_msgSend(v3, "appendString:", CFSTR("Scrolling"));
  if (-[PUBrowsingViewModel isAnimatingAnyTransition](self, "isAnimatingAnyTransition"))
  {
    -[PUBrowsingViewModel _animatingTransitionIdentifiers](self, "_animatingTransitionIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("Animating Transitions: %@"), v7);

  }
  objc_msgSend(v3, "appendString:", CFSTR("\nAsset View Models:\n"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = self;
  viewModelByAssetReference = self->_viewModelByAssetReference;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __47__PUBrowsingViewModel_debugDetailedDescription__block_invoke;
  v33[3] = &unk_1E589D930;
  v10 = v8;
  v34 = v10;
  -[PUCachedMapTable enumerateKeysAndObjectsUsingBlock:](viewModelByAssetReference, "enumerateKeysAndObjectsUsingBlock:", v33);
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_18818);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v18, "description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "pu_stringByIndentingNewLines");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@:\n\t%@\n"), v19, v21);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v15);
  }

  v22 = (void *)MEMORY[0x1E0CB3940];
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_stringByIndentingNewLines");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("<%@ %p> {\n\t%@}"), v24, v28, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (PUAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (PUAssetReference)lastViewedAssetReference
{
  return self->_lastViewedAssetReference;
}

- (PUAssetReference)assetBeforeLastViewedAssetReference
{
  return self->_assetBeforeLastViewedAssetReference;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (double)currentAssetTransitionProgress
{
  return self->_currentAssetTransitionProgress;
}

- (NSString)transitionDriverIdentifier
{
  return self->_transitionDriverIdentifier;
}

- (BOOL)assetChangesShouldAnimate
{
  return self->_assetChangesShouldAnimate;
}

- (int64_t)browsingSpeedRegime
{
  return self->_browsingSpeedRegime;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (BOOL)isScrolling
{
  return self->_isScrolling;
}

- (BOOL)isAnimatingAnyTransition
{
  return self->_isAnimatingAnyTransition;
}

- (int64_t)videoOverlayPlayState
{
  return self->_videoOverlayPlayState;
}

- (BOOL)isPresentedForPreview
{
  return self->_isPresentedForPreview;
}

- (BOOL)isAttemptingToPlayVideoOverlay
{
  return self->_isAttemptingToPlayVideoOverlay;
}

- (BOOL)accessoryViewsDefaultVisibility
{
  return self->_accessoryViewsDefaultVisibility;
}

- (int64_t)contentPrivacyState
{
  return self->_contentPrivacyState;
}

- (int64_t)systemAuthenticationType
{
  return self->_systemAuthenticationType;
}

- (BOOL)wantsContentUnavailableUnlockButtonVisible
{
  return self->_wantsContentUnavailableUnlockButtonVisible;
}

- (BOOL)isChromeVisible
{
  return self->_isChromeVisible;
}

- (int64_t)lastChromeVisibilityChangeReason
{
  return self->_lastChromeVisibilityChangeReason;
}

- (void)_setLastChromeVisibilityChangeReason:(int64_t)a3
{
  self->_lastChromeVisibilityChangeReason = a3;
}

- (id)lastChromeVisibilityChangeContext
{
  return self->_lastChromeVisibilityChangeContext;
}

- (void)_setLastChromeVisibilityChangeContext:(id)a3
{
  objc_storeStrong(&self->_lastChromeVisibilityChangeContext, a3);
}

- (NSDate)lastChromeVisibilityChangeDate
{
  return self->_lastChromeVisibilityChangeDate;
}

- (BOOL)isPresentingOverOneUp
{
  return self->_presentingOverOneUp;
}

- (int64_t)horizontalSizeClass
{
  return self->_horizontalSizeClass;
}

- (void)setHorizontalSizeClass:(int64_t)a3
{
  self->_horizontalSizeClass = a3;
}

- (CGSize)secondScreenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_secondScreenSize.width;
  height = self->_secondScreenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)isAnimatingPresentationSize
{
  return self->_isAnimatingPresentationSize;
}

- (PUAssetReference)trailingAssetReference
{
  return self->_trailingAssetReference;
}

- (void)_setTrailingAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_trailingAssetReference, a3);
}

- (PUAssetReference)leadingAssetReference
{
  return self->_leadingAssetReference;
}

- (void)_setLeadingAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_leadingAssetReference, a3);
}

- (NSString)navigationBarTitle
{
  return self->_navigationBarTitle;
}

- (PUReviewScreenBarsModel)reviewScreenBarsModel
{
  return self->_reviewScreenBarsModel;
}

- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel
{
  return self->_resizeTaskDescriptorViewModel;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (BOOL)isInSelectionMode
{
  return self->_isInSelectionMode;
}

- (BOOL)livePhotoShouldPlay
{
  return self->_livePhotoShouldPlay;
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  return self->_searchQueryMatchInfo;
}

- (BOOL)isFillScreenModeEnabled
{
  return self->_isFillScreenModeEnabled;
}

- (PUBrowsingVideoPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (BOOL)isInteractingWithVideoScrubber
{
  return self->_isInteractingWithVideoScrubber;
}

- (PUImageAnalysisInteraction)imageAnalysisInteraction
{
  return self->_imageAnalysisInteraction;
}

- (int64_t)_userNavigationDistance
{
  return self->__userNavigationDistance;
}

- (void)_setUserNavigationDistance:(int64_t)a3
{
  self->__userNavigationDistance = a3;
}

- (int64_t)_scrubbingSessionDistance
{
  return self->__scrubbingSessionDistance;
}

- (void)_setScrubbingSessionDistance:(int64_t)a3
{
  self->__scrubbingSessionDistance = a3;
}

- (NSMutableSet)_animatingTransitionIdentifiers
{
  return self->__animatingTransitionIdentifiers;
}

- (void)_setAnimatingTransitionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->__animatingTransitionIdentifiers, a3);
}

- (NSMutableSet)_videoDisallowedReasons
{
  return self->__videoDisallowedReasons;
}

- (void)_setVideoDisallowedReasons:(id)a3
{
  objc_storeStrong((id *)&self->__videoDisallowedReasons, a3);
}

- (OS_dispatch_queue)audioSessionUpdateQueue
{
  return self->_audioSessionUpdateQueue;
}

- (BOOL)needsUpdateVideoPlayerController
{
  return self->_needsUpdateVideoPlayerController;
}

- (void)setNeedsUpdateVideoPlayerController:(BOOL)a3
{
  self->_needsUpdateVideoPlayerController = a3;
}

- (PUAssetViewModel)assetViewModelHostingVideoPlayer
{
  return self->_assetViewModelHostingVideoPlayer;
}

- (NSMutableSet)videoScrubberInteractionIdentifiers
{
  return self->_videoScrubberInteractionIdentifiers;
}

- (BOOL)needsUpdateImageAnalysisInteraction
{
  return self->_needsUpdateImageAnalysisInteraction;
}

- (void)setNeedsUpdateImageAnalysisInteraction:(BOOL)a3
{
  self->_needsUpdateImageAnalysisInteraction = a3;
}

- (BOOL)creatingImageAnalysisInteraction
{
  return self->_creatingImageAnalysisInteraction;
}

- (void)setCreatingImageAnalysisInteraction:(BOOL)a3
{
  self->_creatingImageAnalysisInteraction = a3;
}

- (PUAssetActionManager)actionManager
{
  return self->_actionManager;
}

- (void)setActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_actionManager, a3);
}

- (PXAssetImportStatusManager)importStatusManager
{
  return self->_importStatusManager;
}

- (PXContentPrivacyController)privacyController
{
  return self->_privacyController;
}

- (PUOneUpVideoPlayerController)videoPlayerController
{
  return self->_videoPlayerController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayerController, 0);
  objc_storeStrong((id *)&self->_privacyController, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_videoScrubberInteractionIdentifiers, 0);
  objc_storeStrong((id *)&self->_assetViewModelHostingVideoPlayer, 0);
  objc_storeStrong((id *)&self->_audioSessionUpdateQueue, 0);
  objc_storeStrong((id *)&self->__videoDisallowedReasons, 0);
  objc_storeStrong((id *)&self->__animatingTransitionIdentifiers, 0);
  objc_storeStrong((id *)&self->_imageAnalysisInteraction, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_searchQueryMatchInfo, 0);
  objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, 0);
  objc_storeStrong((id *)&self->_reviewScreenBarsModel, 0);
  objc_storeStrong((id *)&self->_navigationBarTitle, 0);
  objc_storeStrong((id *)&self->_leadingAssetReference, 0);
  objc_storeStrong((id *)&self->_trailingAssetReference, 0);
  objc_storeStrong((id *)&self->_lastChromeVisibilityChangeDate, 0);
  objc_storeStrong(&self->_lastChromeVisibilityChangeContext, 0);
  objc_storeStrong((id *)&self->_transitionDriverIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_assetBeforeLastViewedAssetReference, 0);
  objc_storeStrong((id *)&self->_lastViewedAssetReference, 0);
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
  objc_storeStrong((id *)&self->_assetSharedViewModelByAssetUUID, 0);
  objc_storeStrong((id *)&self->_assetSharedViewModelByAsset, 0);
  objc_storeStrong((id *)&self->_invalidAssetViewModels, 0);
  objc_storeStrong((id *)&self->_viewModelByAssetReference, 0);
  objc_storeStrong((id *)&self->_currentAssetReferenceChangedDate, 0);
  objc_storeStrong((id *)&self->_currentAssetReference, 0);
}

void __47__PUBrowsingViewModel_debugDetailedDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "debugDetailedDescription");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t __47__PUBrowsingViewModel_debugDetailedDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __52__PUBrowsingViewModel_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePlaybackAudioSession");
}

void __65__PUBrowsingViewModel_oneUpVideoPlayerControllerPlayerDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "player");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setVideoPlayer:", v2);

}

uint64_t __81__PUBrowsingViewModel_assetImportStatusManager_didChangeStatusForAssetReference___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImportState:", objc_msgSend(*(id *)(a1 + 40), "_importStateForAssetReference:", *(_QWORD *)(a1 + 48)));
}

void __61__PUBrowsingViewModel__handleAssetSharedViewModel_didChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "currentChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mutableSharedViewModelChangesByAssetUUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v3, *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 48));

}

void __55__PUBrowsingViewModel__handleAssetViewModel_didChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "currentChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mutableViewModelChangesByAssetReference");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentAssetReference");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {

  }
  else
  {
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (!v6)
    {
LABEL_12:

      goto LABEL_13;
    }
  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "isPresentingOverOneUp");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "videoPlayer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "videoPlayerChange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isPlaybackDesired")
      && objc_msgSend(v8, "audioSessionVolumeIncreaseDidOccur"))
    {
      objc_msgSend(MEMORY[0x1E0D7BBB0], "sharedController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "userDidUnmute");

    }
    goto LABEL_12;
  }
LABEL_13:

}

PXAssetBadgeInfo *__64__PUBrowsingViewModel__filteredAllowedBadges_forAssetReference___block_invoke(uint64_t a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _OWORD v6[2];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  return +[PUBrowsingViewModel filteredBadgeInfoWithInputInfo:assetReference:actionManager:](PUBrowsingViewModel, "filteredBadgeInfoWithInputInfo:assetReference:actionManager:", v6, v2, v3);
}

void __56__PUBrowsingViewModel__updateNeighboringAssetReferences__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

void __56__PUBrowsingViewModel__updateNeighboringAssetReferences__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if ((objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

uint64_t __72__PUBrowsingViewModel__updateWantsContentUnavailableUnlockButtonVisible__block_invoke(uint64_t a1)
{
  _BOOL8 v1;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1;
  else
    v1 = *(_BYTE *)(a1 + 41) != 0;
  return objc_msgSend(*(id *)(a1 + 32), "setWantsContentUnavailableUnlockButtonVisible:", v1);
}

uint64_t __54__PUBrowsingViewModel__updateSystemAuthenticationType__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSystemAuthenticationType:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__PUBrowsingViewModel__updateContentPrivacyState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentPrivacyState:", *(unsigned __int8 *)(a1 + 40));
}

void __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  char v24;
  char v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  char v29;
  char v30;
  char v31;
  __int16 v32;
  _QWORD v33[4];
  id v34;
  int v35;

  objc_msgSend(*(id *)(a1 + 32), "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "videoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isEqual:", v4);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "videoPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setVideoPlayer:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setVideoPlayer:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "currentAssetReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqual:", v11);

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "imageAnalysisInteraction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setImageAnalysisInteraction:", v13);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setImageAnalysisInteraction:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setFocusValue:", *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setForceBadgesVisible:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setIsScrubbing:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "irisPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke_2;
  v33[3] = &unk_1E589DC68;
  v34 = v14;
  v35 = *(_DWORD *)(a1 + 64);
  v16 = v14;
  objc_msgSend(v16, "performChanges:", v33);
  objc_msgSend(*(id *)(a1 + 32), "videoPlayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke_3;
  v26[3] = &unk_1E589D980;
  v29 = *(_BYTE *)(a1 + 68);
  v30 = *(_BYTE *)(a1 + 66);
  v31 = *(_BYTE *)(a1 + 64);
  v32 = *(_WORD *)(a1 + 69);
  v18 = *(_QWORD *)(a1 + 40);
  v27 = v17;
  v28 = v18;
  v19 = v17;
  objc_msgSend(v19, "performChanges:", v26);
  objc_msgSend(*(id *)(a1 + 32), "animatedImagePlayer");
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke_4;
  v22[3] = &unk_1E58A7DF8;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = *(_BYTE *)(a1 + 64);
  v25 = *(_BYTE *)(a1 + 66);
  v20 = v23;
  objc_msgSend(v20, "performChanges:", v22);
  objc_msgSend(*(id *)(a1 + 32), "setImportState:", objc_msgSend(*(id *)(a1 + 40), "_importStateForAssetReference:", *(_QWORD *)(a1 + 48)));
  objc_msgSend(*(id *)(a1 + 40), "searchQueryMatchInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSearchQueryMatchInfo:", v21);

}

uint64_t __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setLivePhotoPlaybackDisabled:forReason:", *(unsigned __int8 *)(a1 + 40), CFSTR("Scrubbing"));
  objc_msgSend(*(id *)(a1 + 32), "setLivePhotoLoadingDisabled:forReason:", *(unsigned __int8 *)(a1 + 40), CFSTR("Scrubbing"));
  objc_msgSend(*(id *)(a1 + 32), "setLivePhotoLoadingDisabled:forReason:", *(unsigned __int8 *)(a1 + 41), CFSTR("TransitionAnimation"));
  objc_msgSend(*(id *)(a1 + 32), "setLivePhotoLoadingDisabled:forReason:", *(unsigned __int8 *)(a1 + 42), CFSTR("BrowsingSpeed"));
  return objc_msgSend(*(id *)(a1 + 32), "setLivePhotoLoadingDisabled:forReason:", *(_BYTE *)(a1 + 43) == 0, CFSTR("VideoContentDisallowed"));
}

uint64_t __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke_3(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;

  if (!*(_BYTE *)(a1 + 48))
  {
    v2 = !*(_BYTE *)(a1 + 49) && !*(_BYTE *)(a1 + 50) && *(_BYTE *)(a1 + 51) && *(_BYTE *)(a1 + 52) != 0;
    objc_msgSend(*(id *)(a1 + 32), "setShouldPreloadVideoContent:", v2);
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "isInteractingWithVideoScrubber") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(*(id *)(a1 + 40), "isScrubbing");
  return objc_msgSend(*(id *)(a1 + 32), "setIsUserScrubbing:", v3);
}

uint64_t __45__PUBrowsingViewModel__updateAssetViewModel___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAnimatedImageLoadingDisabled:forReason:", *(unsigned __int8 *)(a1 + 40), CFSTR("Scrubbing"));
  return objc_msgSend(*(id *)(a1 + 32), "setAnimatedImageLoadingDisabled:forReason:", *(unsigned __int8 *)(a1 + 41), CFSTR("BrowsingSpeed"));
}

uint64_t __53__PUBrowsingViewModel__updateAssetViewModelsIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAssetViewModel:");
}

uint64_t __53__PUBrowsingViewModel__updateAssetViewModelsIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAssetViewModel:", a2);
}

void __62__PUBrowsingViewModel__updateImageAnalysisInteractionIfNeeded__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__PUBrowsingViewModel__updateImageAnalysisInteractionIfNeeded__block_invoke_2;
  v4[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v5, v1);
  objc_msgSend(WeakRetained, "performChanges:", v4);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setCreatingImageAnalysisInteraction:", 0);

  objc_destroyWeak(&v5);
}

void __62__PUBrowsingViewModel__updateImageAnalysisInteractionIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  PUImageAnalysisInteraction *v3;

  v3 = objc_alloc_init(PUImageAnalysisInteraction);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setImageAnalysisInteraction:", v3);

}

uint64_t __66__PUBrowsingViewModel__handleAsyncBrowsingSpeedRegimeInvalidation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateBrowsingSpeedRegime");
}

void __71__PUBrowsingViewModel__invalidateBrowsingSpeedRegimeAfterMaximumDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAsyncBrowsingSpeedRegimeInvalidation");

}

void __58__PUBrowsingViewModel__updatePlaybackAudioSessionIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D78290], "sharedVideoPlaybackInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x1E0C89748];
  v8 = 0;
  v5 = objc_msgSend(v2, "setCategory:mode:routeSharingPolicy:options:error:", v3, v4, 0, 0, &v8);
  v6 = v8;

  if ((v5 & 1) == 0)
  {
    PLOneUpGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_FAULT, "Failed to set 1-Up video playback audio session category. %@", buf, 0xCu);
    }

  }
}

uint64_t __46__PUBrowsingViewModel_setContentPrivacyState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccessoryViewVisible:", 0);
}

void __68__PUBrowsingViewModel__assetSharedViewModelForAsset_createIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(a2, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v6)
    objc_msgSend(v7, "setAssetSharedViewModel:", *(_QWORD *)(a1 + 40));

}

uint64_t __47__PUBrowsingViewModel_setSearchQueryMatchInfo___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 312), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateAllAssetViewModels");
}

void __55__PUBrowsingViewModel_assetViewModelForAssetReference___block_invoke(id *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = a1[4];
  objc_msgSend(a1[5], "mediaProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaProvider:", v3);

  v4 = a1[4];
  objc_msgSend(a1[6], "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAsset:", v5);

  objc_msgSend(a1[4], "setAssetReference:", a1[6]);
  objc_msgSend(a1[5], "_badgeInfoPromiseForAssetReference:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setBadgeInfoPromise:", v6);
  objc_msgSend(a1[4], "setAccessoryViewVisible:", objc_msgSend(a1[5], "accessoryViewsDefaultVisibility"));
  objc_msgSend(a1[4], "setIsScrubbing:", objc_msgSend(a1[5], "isScrubbing"));
  objc_msgSend(a1[5], "_updateAssetViewModel:", a1[4]);

}

void __47__PUBrowsingViewModel__setVideoContentAllowed___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  char v8;

  objc_msgSend(a3, "irisPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PUBrowsingViewModel__setVideoContentAllowed___block_invoke_2;
  v6[3] = &unk_1E58AAD68;
  v7 = v4;
  v8 = *(_BYTE *)(a1 + 32);
  v5 = v4;
  objc_msgSend(v5, "performChanges:", v6);

}

uint64_t __47__PUBrowsingViewModel__setVideoContentAllowed___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setLivePhotoLoadingDisabled:forReason:", *(_BYTE *)(a1 + 40) == 0, CFSTR("VideoContentDisallowed"));
  if (!*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "unloadLivePhoto");
  return result;
}

void __46__PUBrowsingViewModel_setPresentingOverOneUp___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "videoPlayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setDesiredPlayState:reason:", 1, CFSTR("Presenting Over 1-Up"));

}

void __79__PUBrowsingViewModel__resetAccessoryViewsVisibilityToDefaultWithChangeReason___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  if (*(unsigned __int8 *)(a1 + 40) != objc_msgSend(v4, "isAccessoryViewVisible"))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__PUBrowsingViewModel__resetAccessoryViewsVisibilityToDefaultWithChangeReason___block_invoke_2;
    v13[3] = &unk_1E58AA4F0;
    v5 = v4;
    v16 = *(_BYTE *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 32);
    v14 = v5;
    v15 = v6;
    objc_msgSend(v5, "performChanges:", v13);

  }
  objc_msgSend(v4, "preferredContentOffset");
  if (v8 != *MEMORY[0x1E0C9D538] || v7 != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    objc_msgSend(v4, "focusValue");
    if (fabs(v10) >= 1.0)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __79__PUBrowsingViewModel__resetAccessoryViewsVisibilityToDefaultWithChangeReason___block_invoke_3;
      v11[3] = &unk_1E58ABD10;
      v12 = v4;
      objc_msgSend(v12, "performChanges:", v11);

    }
  }

}

uint64_t __79__PUBrowsingViewModel__resetAccessoryViewsVisibilityToDefaultWithChangeReason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccessoryViewVisible:changeReason:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __79__PUBrowsingViewModel__resetAccessoryViewsVisibilityToDefaultWithChangeReason___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentOffset:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

void __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "assetReferenceAtIndexPath:", a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "assetReferenceForAssetReference:");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    || *(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= 100)
  {
    *a3 = 1;
  }

}

void __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "assetReferenceForAssetReference:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    objc_msgSend(*(id *)(v7 + 96), "setObject:forKey:", v5, v6);
    objc_msgSend(v5, "setAssetReference:", v6);
    objc_msgSend(*(id *)(a1 + 40), "_badgeInfoPromiseForAssetReference:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 40), "_importStateForAssetReference:", v6);
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke_3;
    v20[3] = &unk_1E58A4810;
    v21 = v5;
    v11 = v6;
    v22 = v11;
    v12 = v8;
    v13 = *(_QWORD *)(a1 + 40);
    v23 = v12;
    v24 = v13;
    v25 = v9;
    objc_msgSend(v21, "performChanges:", v20);
    v14 = *(void **)(a1 + 40);
    objc_msgSend(v11, "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_assetSharedViewModelForAsset:createIfNeeded:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke_4;
      v17[3] = &unk_1E58ABCA8;
      v18 = v16;
      v19 = v11;
      objc_msgSend(v18, "performChanges:", v17);

    }
  }
  else
  {
    objc_msgSend(v5, "unregisterChangeObserver:", v7);
  }

}

uint64_t __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAsset:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setAssetReference:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setBadgeInfoPromise:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setImportState:", *(_QWORD *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setIsScrubbing:", objc_msgSend(*(id *)(a1 + 56), "isScrubbing"));
}

void __43__PUBrowsingViewModel_setAssetsDataSource___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "asset");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAsset:", v2);

}

+ (void)initialize
{
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("browsingChromeVisibility");
    v5[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "registerDefaults:", v3);

  }
}

+ (PXAssetBadgeInfo)filteredBadgeInfoWithInputInfo:(SEL)a3 assetReference:(PXAssetBadgeInfo *)a4 actionManager:(id)a5
{
  __int128 v9;
  unint64_t badges;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  unint64_t v23;
  int v24;
  int v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  PXAssetBadgeInfo *result;
  id v32;

  v32 = a5;
  v9 = *(_OWORD *)&a4->count;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&a4->badges;
  *(_OWORD *)&retstr->count = v9;
  badges = a4->badges;
  v11 = a6;
  objc_msgSend(v32, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "assetCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "canPerformActionType:onAsset:inAssetCollection:", 15, v12, v13);

  objc_msgSend(v32, "asset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "assetCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v11, "shouldEnableActionType:onAsset:inAssetCollection:", 15, v15, v16);

  objc_msgSend(MEMORY[0x1E0D7B1E0], "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PXAssetEditOperationTypeForVariationType();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "asset");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v18, "canPerformEditOperationWithType:onAsset:", v19, v20);

  v22 = v14 & v17;
  v23 = badges & 0xFFFFFFFFFFBFFFFFLL;
  if ((badges & 0x400000) != 0)
    v24 = v14 & v17;
  else
    v24 = 1;
  if (v24)
    v23 = badges;
  v25 = v22 & v21;
  if ((v23 & 0x2000) == 0)
    v25 = 1;
  if (v25)
    v26 = v23;
  else
    v26 = v23 & 0xFFFFFFFFFFFFDFFFLL;
  if ((v26 & 0x40000000000) != 0)
  {
    if (!v22)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0D7B1E0], "sharedManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PXAssetEditOperationTypeForDepthToggle();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "asset");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v27, "canPerformEditOperationWithType:onAsset:", v28, v29);

    if ((v30 & 1) == 0)
LABEL_14:
      v26 &= ~0x40000000000uLL;
  }
  retstr->badges = v26;

  return result;
}

@end
