@implementation PUIrisImageTileViewController

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToDidBeginPlaying = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToWillEndPlaying = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidEndPlaying = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidEndVitality = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToViewHostingGestureRecognizers = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDelegateForGestureRecognizer = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidBeginHinting = objc_opt_respondsToSelector() & 1;
    -[PUIrisImageTileViewController _updatePlaybackGestureRecognizer](self, "_updatePlaybackGestureRecognizer");
  }

}

- (id)loadView
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  UIView *v12;
  void *v13;
  UIView *borderView;
  objc_super v16;
  uint8_t buf[4];
  PUIrisImageTileViewController *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PUIrisImageTileViewController;
  -[PUImageTileViewController loadView](&v16, sel_loadView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CD2160]);
  objc_storeStrong((id *)&self->__livePhotoView, v4);
  objc_msgSend(v4, "setShouldApplyTargetReadiness:", 0);
  +[PUIrisSettings sharedInstance](PUIrisSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsStatusBorder:", objc_msgSend(v5, "showStatusBorder"));

  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setContentMode:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  objc_msgSend(v4, "setClipsToBounds:", 1);
  objc_msgSend(v4, "playerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCustomPhotoView:", v3);

  if (objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled"))
  {
    PLLivePhotoPlaybackGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PUImageTileViewController assetViewModel](self, "assetViewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "Muting the live photo displayed by %{public}@ (asset %{public}@) because audible playback should only occur via the overlay tile.", buf, 0x16u);

    }
    objc_msgSend(v4, "setMuted:", 1);
  }
  v11 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v4, "bounds");
  v12 = (UIView *)objc_msgSend(v11, "initWithFrame:");
  -[UIView setAutoresizingMask:](v12, "setAutoresizingMask:", 18);
  -[UIView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

  -[UIView setClipsToBounds:](v12, "setClipsToBounds:", 1);
  objc_msgSend(v4, "addSubview:", v12);
  borderView = self->_borderView;
  self->_borderView = v12;

  -[PUIrisImageTileViewController _updatePlaybackGestureRecognizer](self, "_updatePlaybackGestureRecognizer");
  -[PUIrisImageTileViewController _updateLivePhotoViewVitalityEnabled](self, "_updateLivePhotoViewVitalityEnabled");

  return v4;
}

- (void)updateModulator
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  -[PUTileController tilingView](self, "tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldDisplayHDR");

  if (v4)
  {
    -[PUImageTileViewController imageModulationManager](self, "imageModulationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0D7B500];
    -[PUImageTileViewController asset](self, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "optionsForAsset:", v7);
    v10 = v9;

    -[PUIrisImageTileViewController livePhotoViewModulator](self, "livePhotoViewModulator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "checkInLivePhotoViewModulator:", v11);

    objc_msgSend(v5, "checkoutLivePhotoViewModulatorWithOptions:", v8, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __48__PUIrisImageTileViewController_updateModulator__block_invoke;
    v13[3] = &unk_1E58A4610;
    v13[4] = self;
    objc_msgSend(v12, "performChanges:", v13);
    -[PUIrisImageTileViewController setLivePhotoViewModulator:](self, "setLivePhotoViewModulator:", v12);

  }
}

- (void)updateModulatorInputs
{
  void *v3;
  _QWORD v4[5];

  -[PUIrisImageTileViewController livePhotoViewModulator](self, "livePhotoViewModulator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PUIrisImageTileViewController_updateModulatorInputs__block_invoke;
  v4[3] = &unk_1E58A4610;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)removeAllAnimations
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIrisImageTileViewController;
  -[PUTileViewController removeAllAnimations](&v4, sel_removeAllAnimations);
  -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_removeAllGeometryAnimationsRecursively:", 1);

}

- (void)addToTilingView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIrisImageTileViewController;
  -[PUTileViewController addToTilingView:](&v4, sel_addToTilingView_, a3);
  -[PUIrisImageTileViewController _updateLivePhotoViewVitalityEnabled](self, "_updateLivePhotoViewVitalityEnabled");
}

- (void)applyLayoutInfo:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PUIrisImageTileViewController;
  v4 = a3;
  -[PUOneUpImageTileViewController applyLayoutInfo:](&v16, sel_applyLayoutInfo_, v4);
  objc_msgSend(v4, "contentsRect", v16.receiver, v16.super_class);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "playerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setContentsRect:", v6, v8, v10, v12);

  -[PUTileViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

  -[PUIrisImageTileViewController _updateVitalityTransform](self, "_updateVitalityTransform");
}

- (id)viewsForApplyingCornerRadius
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  if (!-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[PUIrisImageTileViewController borderView](self, "borderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)viewsForApplyingBorder
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  -[PUIrisImageTileViewController borderView](self, "borderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)assetViewModelDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUIrisImageTileViewController;
  -[PUOneUpImageTileViewController assetViewModelDidChange:](&v4, sel_assetViewModelDidChange_, a3);
  -[PUIrisImageTileViewController _updateIrisPlayer](self, "_updateIrisPlayer");
  -[PUIrisImageTileViewController _updateLivePhotoViewVitalityEnabled](self, "_updateLivePhotoViewVitalityEnabled");
  -[PUIrisImageTileViewController _updatePlayerViewInteractivePlaybackAllowed](self, "_updatePlayerViewInteractivePlaybackAllowed");
  -[PUIrisImageTileViewController _assetFocusValueDidChange](self, "_assetFocusValueDidChange");
  -[PUIrisImageTileViewController _updateVitalityTransform](self, "_updateVitalityTransform");
}

- (void)assetDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUIrisImageTileViewController;
  -[PUImageTileViewController assetDidChange](&v3, sel_assetDidChange);
  -[PUIrisImageTileViewController _updatePlayerViewInteractivePlaybackAllowed](self, "_updatePlayerViewInteractivePlaybackAllowed");
  -[PUIrisImageTileViewController _updateSRLCompensation](self, "_updateSRLCompensation");
}

- (void)_updateLivePhotoViewVitalityEnabled
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  +[PUIrisSettings sharedInstance](PUIrisSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVitalityAllowed");

  if (!v4
    || (-[PUImageTileViewController assetViewModel](self, "assetViewModel"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "irisPlayer"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v7 = -[PUIrisImageTileViewController isVitalityDisabledByTransformInset](self, "isVitalityDisabledByTransformInset");
  -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
LABEL_6:
    -[PUTileController tilingView](self, "tilingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "is_vitalityControllerCreateIfNeeded:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "playerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removePlayerView:", v10);
    goto LABEL_7;
  }
  -[PUTileController tilingView](self, "tilingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "is_vitalityControllerCreateIfNeeded:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "playerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addPlayerView:", v10);
LABEL_7:

}

- (void)_updateSRLCompensation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id location;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "livePhotoSRLCompensationEnabled"))
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  if (!objc_msgSend(v3, "livePhotoSRLCompensationManualMode"))
  {
    -[PUImageTileViewController asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[PUImageTileViewController asset](self, "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      objc_msgSend((id)objc_opt_class(), "srlCompensationLoadingQueue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v8;
      objc_copyWeak(&v12, &location);
      PXDispatchAsyncWithSignpost();

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);

    }
    goto LABEL_6;
  }
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "livePhotoSRLCompensationManualValue");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOverrideSRLCompensationAmount:", v5);

}

- (void)_handleLoadedSRLCompensationAmount:(id)a3 forAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[PUImageTileViewController asset](self, "asset");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOverrideSRLCompensationAmount:", v9);

  }
}

- (void)_updateIrisPlayer
{
  void *v3;
  id v4;

  -[PUImageTileViewController assetViewModel](self, "assetViewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "irisPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIrisImageTileViewController setIrisPlayer:](self, "setIrisPlayer:", v3);

}

- (void)setIrisPlayer:(id)a3
{
  PUBrowsingIrisPlayer *v5;
  PUBrowsingIrisPlayer *irisPlayer;
  PUBrowsingIrisPlayer *v7;

  v5 = (PUBrowsingIrisPlayer *)a3;
  irisPlayer = self->_irisPlayer;
  if (irisPlayer != v5)
  {
    v7 = v5;
    -[PUBrowsingIrisPlayer unregisterChangeObserver:](irisPlayer, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_irisPlayer, a3);
    -[PUBrowsingIrisPlayer registerChangeObserver:](self->_irisPlayer, "registerChangeObserver:", self);
    -[PUIrisImageTileViewController _updateLivePhotoViewPlayer](self, "_updateLivePhotoViewPlayer");
    v5 = v7;
  }

}

- (void)_updateLivePhotoViewPlayer
{
  void *v3;
  void *v4;
  id v5;

  -[PUIrisImageTileViewController irisPlayer](self, "irisPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlayer:", v3);

}

- (void)_updatePlayerViewInteractivePlaybackAllowed
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  id v18;

  -[PUImageTileViewController assetViewModel](self, "assetViewModel");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "focusValue");
  v4 = v3;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "livePhotoInteractionThreshold");
  v7 = v6;
  v8 = fabs(v4);
  objc_msgSend(v18, "irisPlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isActivated");

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "shouldMergeOverlappingLivePhotos"))
  {
    -[PUImageTileViewController assetViewModel](self, "assetViewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "asset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    LOBYTE(v14) = 1;
  }

  -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "playbackGestureRecognizer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 <= v7)
    v17 = v10 | v14;
  else
    v17 = 0;
  objc_msgSend(v16, "setEnabled:", v17 & 1);

}

- (void)ppt_playLivePhotoWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id ppt_didEndPlayingHandler;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    v5 = _Block_copy(self->_ppt_didEndPlayingHandler);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __72__PUIrisImageTileViewController_ppt_playLivePhotoWithCompletionHandler___block_invoke;
    v13 = &unk_1E58AA540;
    v14 = v5;
    v15 = v4;
    v6 = v5;
    v7 = _Block_copy(&v10);
    ppt_didEndPlayingHandler = self->_ppt_didEndPlayingHandler;
    self->_ppt_didEndPlayingHandler = v7;

  }
  -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startPlaybackWithStyle:", 1);

}

- (id)generateAssetTransitionInfo
{
  void *v3;
  double v4;
  double v5;
  BOOL v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  PUIrisImageTileViewController *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  objc_super v18;

  -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isDisplayingPhoto") & 1) != 0
    || ((-[PUTileViewController visibleRect](self, "visibleRect"), v5 == *MEMORY[0x1E0C9D820])
      ? (v6 = v4 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      : (v6 = 0),
        v6))
  {
    v18.receiver = self;
    v18.super_class = (Class)PUIrisImageTileViewController;
    -[PUImageTileViewController generateAssetTransitionInfo](&v18, sel_generateAssetTransitionInfo);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "generateSnapshotImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0uLL;
    v17 = 0;
    if (v3)
      objc_msgSend(v3, "seekTime");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PUIrisImageTileViewController_generateAssetTransitionInfo__block_invoke;
    v11[3] = &unk_1E58A0FF0;
    v14 = v16;
    v15 = v17;
    v12 = v7;
    v13 = self;
    v8 = v7;
    +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:](PUAssetTransitionInfo, "assetTransitionInfoWithConfigurationBlock:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  _QWORD v29[5];
  objc_super v30;

  v7 = a3;
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PUIrisImageTileViewController;
  -[PUImageTileViewController viewModel:didChange:](&v30, sel_viewModel_didChange_, v7, v8);
  -[PUImageTileViewController assetViewModel](self, "assetViewModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
  {
    if (objc_msgSend(v8, "focusValueChanged"))
      -[PUIrisImageTileViewController _assetFocusValueDidChange](self, "_assetFocusValueDidChange");
    if (objc_msgSend(v8, "revealsGainMapImageChanged"))
    {
      -[PUIrisImageTileViewController livePhotoViewModulator](self, "livePhotoViewModulator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __53__PUIrisImageTileViewController_viewModel_didChange___block_invoke;
      v29[3] = &unk_1E58A4610;
      v29[4] = self;
      objc_msgSend(v18, "performChanges:", v29);

    }
    if (objc_msgSend(v8, "irisPlayerChanged"))
      -[PUIrisImageTileViewController _updateIrisPlayer](self, "_updateIrisPlayer");
    goto LABEL_22;
  }
  -[PUIrisImageTileViewController irisPlayer](self, "irisPlayer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v7)
  {
    v12 = v7;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_20:
        -[PUIrisImageTileViewController _handleBrowsingIrisPlayer:didChange:](self, "_handleBrowsingIrisPlayer:didChange:", v12, v8);
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUIrisImageTileViewController.m"), 332, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("viewModel"), v21, v23);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUIrisImageTileViewController.m"), 332, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("viewModel"), v21);
    }

    goto LABEL_20;
  }
  -[PUImageTileViewController browsingViewModel](self, "browsingViewModel");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v7)
  {
    v12 = v8;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_6:
        if (objc_msgSend(v12, "isScrubbingActivationDidChange"))
          -[PUIrisImageTileViewController _updatePlaybackGestureRecognizer](self, "_updatePlaybackGestureRecognizer");
        if (objc_msgSend(v12, "livePhotoShouldPlayDidChange"))
        {
          -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "playbackGestureRecognizer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEnabled");

          if (v15)
          {
            objc_msgSend(v13, "playerView");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUImageTileViewController browsingViewModel](self, "browsingViewModel");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setPlaybackFilterTouchActive:", objc_msgSend(v17, "livePhotoShouldPlay"));

          }
        }
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUIrisImageTileViewController.m"), 336, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("change"), v26, v28);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUIrisImageTileViewController.m"), 336, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("change"), v26);
    }

    goto LABEL_6;
  }
LABEL_22:

}

- (void)_handleBrowsingIrisPlayer:(id)a3 didChange:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "playerDidChange"))
    -[PUIrisImageTileViewController _updateLivePhotoViewPlayer](self, "_updateLivePhotoViewPlayer");
  if (objc_msgSend(v5, "activatedDidChange"))
    -[PUIrisImageTileViewController _updatePlayerViewInteractivePlaybackAllowed](self, "_updatePlayerViewInteractivePlaybackAllowed");
  if (objc_msgSend(v5, "vitalityTransformDidChange"))
    -[PUIrisImageTileViewController _updateVitalityTransform](self, "_updateVitalityTransform");

}

- (void)_updatePlaybackGestureRecognizer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playbackGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_delegateFlags.respondsToDelegateForGestureRecognizer)
  {
    -[PUIrisImageTileViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "irisImageTileViewController:delegateForGestureRecognizer:", self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "setDelegate:", v6);
  v9 = v3;
  v7 = v9;
  if (self->_delegateFlags.respondsToViewHostingGestureRecognizers)
  {
    -[PUIrisImageTileViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "irisImageTileViewControllerViewHostingGestureRecognizers:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "addGestureRecognizer:", v4);

}

- (void)_updateVitalityTransform
{
  void *v3;
  void *v4;
  float32x4_t v5;
  __int128 v6;
  float32x4_t v7;
  int v8;
  uint32x4_t v9;
  unsigned int v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  id v36[2];
  void *v37;

  -[PUImageTileViewController assetViewModel](self, "assetViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "irisPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "vitalityTransform");
    v5.i32[3] = 0;
    HIDWORD(v6) = 0;
    *(_OWORD *)v36 = v6;
    v7.i32[3] = 0;
    v34 = v5;
    v35 = v7;
    v8 = objc_msgSend(v4, "allowLargeVitalityInset", *(_QWORD *)(MEMORY[0x1E0C83FE8] + 16), *(_QWORD *)(MEMORY[0x1E0C83FE8] + 24), *(_QWORD *)(MEMORY[0x1E0C83FE8] + 32), *(_QWORD *)(MEMORY[0x1E0C83FE8] + 40), *MEMORY[0x1E0C83FE8], *(_QWORD *)(MEMORY[0x1E0C83FE8] + 8));
  }
  else
  {
    v34 = *(float32x4_t *)MEMORY[0x1E0C83FE8];
    v35 = *(float32x4_t *)(MEMORY[0x1E0C83FE8] + 32);
    *(_OWORD *)v36 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
    v8 = objc_msgSend(0, "allowLargeVitalityInset", *(_QWORD *)(MEMORY[0x1E0C83FE8] + 16), *(_QWORD *)(MEMORY[0x1E0C83FE8] + 24), *(_QWORD *)(MEMORY[0x1E0C83FE8] + 32), *(_QWORD *)(MEMORY[0x1E0C83FE8] + 40), *MEMORY[0x1E0C83FE8], *(_QWORD *)(MEMORY[0x1E0C83FE8] + 8));
  }
  v9 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)v36, v31), (int8x16_t)vceqq_f32(v34, v33)), (int8x16_t)vceqq_f32(v35, v32));
  v9.i32[3] = v9.i32[2];
  v10 = vminvq_u32(v9);
  v11 = *(double *)v34.i64;
  v12 = *(double *)v36;
  v13 = *(double *)v35.i64;
  if (!v8)
  {
    if ((v10 & 0x80000000) != 0)
      goto LABEL_10;
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "vitalityMaxAllowedInsetPoints");
    v24 = v23;

    -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v28 = PUPerspectiveTransformMaxInsetForDimensions(v34, *(float32x4_t *)v36, v35, v26, v27);

    if (v28 > v24)
    {
LABEL_10:
      v21 = 0;
      v37 = 0;
      goto LABEL_12;
    }
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CD27D8], "pu_meshTransformApplyingNormalizedPerspectiveTransform:", *(double *)v34.i64, *(double *)v36, *(double *)v35.i64);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    goto LABEL_12;
  }
  if ((v10 & 0x80000000) == 0)
  {
    -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v17 = PUPerspectiveTransformMaxInsetForDimensions(v34, *(float32x4_t *)v36, v35, v15, v16);

    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "vitalityMaxAllowedLargeInsetPoints");
    v20 = v19;

    if (v17 <= v20)
      goto LABEL_11;
  }
  v37 = 0;
  v21 = 1;
LABEL_12:
  -[PUIrisImageTileViewController _livePhotoView](self, "_livePhotoView", v11, v12, v13);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "playerView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setVitalityTransform:", v37);

  -[PUIrisImageTileViewController setIsVitalityDisabledByTransformInset:](self, "setIsVitalityDisabledByTransformInset:", v21);
}

- (void)setIsVitalityDisabledByTransformInset:(BOOL)a3
{
  if (self->_isVitalityDisabledByTransformInset != a3)
  {
    self->_isVitalityDisabledByTransformInset = a3;
    -[PUIrisImageTileViewController _updateLivePhotoViewVitalityEnabled](self, "_updateLivePhotoViewVitalityEnabled");
  }
}

- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4
{
  id v5;

  if (self->_delegateFlags.respondsToDidBeginPlaying)
  {
    -[PUIrisImageTileViewController delegate](self, "delegate", a3, a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "irisImageTileViewControllerDidBeginPlaying:", self);

  }
}

- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4
{
  void *v5;
  void (**ppt_didEndPlayingHandler)(void);
  id v7;
  id v8;

  v8 = a3;
  if (self->_delegateFlags.respondsToDidEndPlaying)
  {
    -[PUIrisImageTileViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "irisImageTileViewControllerDidEndPlaying:", self);

  }
  ppt_didEndPlayingHandler = (void (**)(void))self->_ppt_didEndPlayingHandler;
  if (ppt_didEndPlayingHandler)
  {
    ppt_didEndPlayingHandler[2]();
    v7 = self->_ppt_didEndPlayingHandler;
    self->_ppt_didEndPlayingHandler = 0;

  }
}

- (void)livePhotoViewDidEndPlayingVitality:(id)a3
{
  id v4;

  if (self->_delegateFlags.respondsToDidEndVitality)
  {
    -[PUIrisImageTileViewController delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "irisImageTileViewControllerDidEndVitality:", self);

  }
}

- (void)livePhotoViewDidBeginHinting:(id)a3
{
  id v4;

  if (self->_delegateFlags.respondsToDidBeginHinting)
  {
    -[PUIrisImageTileViewController delegate](self, "delegate", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "irisImageTileViewControllerDidBeginHinting:", self);

  }
}

- (PUIrisImageTileViewControllerDelegate)delegate
{
  return (PUIrisImageTileViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PHLivePhotoView)_livePhotoView
{
  return self->__livePhotoView;
}

- (PXLivePhotoViewModulator)livePhotoViewModulator
{
  return self->_livePhotoViewModulator;
}

- (void)setLivePhotoViewModulator:(id)a3
{
  objc_storeStrong((id *)&self->_livePhotoViewModulator, a3);
}

- (BOOL)isVitalityDisabledByTransformInset
{
  return self->_isVitalityDisabledByTransformInset;
}

- (UIView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
  objc_storeStrong((id *)&self->_borderView, a3);
}

- (PUBrowsingIrisPlayer)irisPlayer
{
  return self->_irisPlayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irisPlayer, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_livePhotoViewModulator, 0);
  objc_storeStrong((id *)&self->__livePhotoView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_ppt_didEndPlayingHandler, 0);
}

void __53__PUIrisImageTileViewController_viewModel_didChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "assetViewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRevealsGainMapImage:", objc_msgSend(v4, "revealsGainMapImage"));

}

void __60__PUIrisImageTileViewController_generateAssetTransitionInfo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setImage:", v3);
  v6 = *(_OWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v4, "setSeekTime:", &v6);
  objc_msgSend(*(id *)(a1 + 40), "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAsset:", v5);

}

uint64_t __72__PUIrisImageTileViewController_ppt_playLivePhotoWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __55__PUIrisImageTileViewController__updateSRLCompensation__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "livePhotoSRLCompensationAmount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PUIrisImageTileViewController__updateSRLCompensation__block_invoke_2;
  block[3] = &unk_1E58AA2E0;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v5 = v2;
  v6 = *(id *)(a1 + 32);
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v7);
}

void __55__PUIrisImageTileViewController__updateSRLCompensation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleLoadedSRLCompensationAmount:forAsset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __54__PUIrisImageTileViewController_updateModulatorInputs__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "gainMapImageIsAvailable"))
  {
    objc_msgSend(v3, "setGainMapImage:animated:", objc_msgSend(*(id *)(a1 + 32), "gainMapImage"), 1);
    objc_msgSend(*(id *)(a1 + 32), "gainMapValue");
    objc_msgSend(v3, "setGainMapValue:");
  }

}

void __48__PUIrisImageTileViewController_updateModulator__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_livePhotoView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLivePhotoView:", v4);

}

+ (OS_dispatch_queue)srlCompensationLoadingQueue
{
  if (srlCompensationLoadingQueue_onceToken_42501 != -1)
    dispatch_once(&srlCompensationLoadingQueue_onceToken_42501, &__block_literal_global_42502);
  return (OS_dispatch_queue *)(id)srlCompensationLoadingQueue_queue_42503;
}

void __60__PUIrisImageTileViewController_srlCompensationLoadingQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  px_dispatch_queue_create_serial();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)srlCompensationLoadingQueue_queue_42503;
  srlCompensationLoadingQueue_queue_42503 = v0;

}

@end
