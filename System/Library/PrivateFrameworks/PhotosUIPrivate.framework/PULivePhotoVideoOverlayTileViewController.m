@implementation PULivePhotoVideoOverlayTileViewController

- (void)setMergedVideo:(id)a3
{
  PUMergedLivePhotosVideo *v5;
  PUMergedLivePhotosVideo *v6;

  v5 = (PUMergedLivePhotosVideo *)a3;
  if (self->_mergedVideo != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mergedVideo, a3);
    -[PULivePhotoVideoOverlayTileViewController _updateLivePhotoViewModulator](self, "_updateLivePhotoViewModulator");
    -[PULivePhotoVideoOverlayTileViewController _updateSRLCompensation](self, "_updateSRLCompensation");
    v5 = v6;
  }

}

- (void)setMergedVideoProvider:(id)a3
{
  PUOneUpMergedVideoProvider *v5;
  PUOneUpMergedVideoProvider *mergedVideoProvider;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PUOneUpMergedVideoProvider *v12;

  v5 = (PUOneUpMergedVideoProvider *)a3;
  mergedVideoProvider = self->_mergedVideoProvider;
  v12 = v5;
  if (mergedVideoProvider != v5)
  {
    -[PUOneUpMergedVideoProvider unregisterChangeObserver:context:](mergedVideoProvider, "unregisterChangeObserver:context:", self, MergedVideoProviderContext_38299);
    objc_storeStrong((id *)&self->_mergedVideoProvider, a3);
    -[PUOneUpMergedVideoProvider registerChangeObserver:context:](self->_mergedVideoProvider, "registerChangeObserver:context:", self, MergedVideoProviderContext_38299);
    -[PUOneUpMergedVideoProvider livePhotoPlayer](v12, "livePhotoPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PULivePhotoVideoOverlayTileViewController livePhotoView](self, "livePhotoView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlayer:", v7);

    -[PHLivePhotoView player](self->_livePhotoView, "player");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "videoPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PULivePhotoVideoOverlayTileViewController setVideoPlayer:](self, "setVideoPlayer:", v10);

    -[PHLivePhotoView player](self->_livePhotoView, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerChangeObserver:context:", self, VideoPlayerChangeContext);

    -[PULivePhotoVideoOverlayTileViewController _updateMergedVideo](self, "_updateMergedVideo");
  }

}

- (void)setBrowsingViewModel:(id)a3
{
  PUBrowsingViewModel *v5;
  PUBrowsingViewModel *browsingViewModel;
  PUBrowsingViewModel *v7;

  v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    v7 = v5;
    -[PUBrowsingViewModel unregisterChangeObserver:](browsingViewModel, "unregisterChangeObserver:", self);
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    -[PUBrowsingViewModel registerChangeObserver:](self->_browsingViewModel, "registerChangeObserver:", self);
    v5 = v7;
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[PULivePhotoVideoOverlayTileViewController _updatePlaybackEnabled](self, "_updatePlaybackEnabled");
    v5 = obj;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[ISWrappedAVPlayer removeTimeObserver:](self->_videoPlayer, "removeTimeObserver:", self->_videoPlayerTimeObserver);
  v3.receiver = self;
  v3.super_class = (Class)PULivePhotoVideoOverlayTileViewController;
  -[PUTileViewController dealloc](&v3, sel_dealloc);
}

- (id)loadView
{
  UIView *v3;
  UIView *containerView;
  PHLivePhotoView *v5;
  PHLivePhotoView *livePhotoView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *playbackGestureRecognizers;
  PUModelTileTransform *modelTileTransform;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  containerView = self->_containerView;
  self->_containerView = v3;

  -[UIView setUserInteractionEnabled:](self->_containerView, "setUserInteractionEnabled:", 0);
  -[UIView setClipsToBounds:](self->_containerView, "setClipsToBounds:", 1);
  v5 = (PHLivePhotoView *)objc_alloc_init(MEMORY[0x1E0CD2160]);
  livePhotoView = self->_livePhotoView;
  self->_livePhotoView = v5;

  -[PHLivePhotoView setAutoresizingMask:](self->_livePhotoView, "setAutoresizingMask:", 18);
  -[PHLivePhotoView setUserInteractionEnabled:](self->_livePhotoView, "setUserInteractionEnabled:", 0);
  -[PHLivePhotoView setContentMode:](self->_livePhotoView, "setContentMode:", 2);
  -[PHLivePhotoView setDelegate:](self->_livePhotoView, "setDelegate:", self);
  -[PHLivePhotoView setHidden:](self->_livePhotoView, "setHidden:", 1);
  -[PHLivePhotoView setClipsToBounds:](self->_livePhotoView, "setClipsToBounds:", 1);
  -[PHLivePhotoView setShouldApplyTargetReadiness:](self->_livePhotoView, "setShouldApplyTargetReadiness:", 0);
  -[PULivePhotoVideoOverlayTileViewController mergedVideoProvider](self, "mergedVideoProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "livePhotoPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHLivePhotoView setPlayer:](self->_livePhotoView, "setPlayer:", v8);

  -[PHLivePhotoView player](self->_livePhotoView, "player");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "videoPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PULivePhotoVideoOverlayTileViewController setVideoPlayer:](self, "setVideoPlayer:", v10);

  -[PHLivePhotoView player](self->_livePhotoView, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerChangeObserver:context:", self, VideoPlayerChangeContext);

  -[UIView addSubview:](self->_containerView, "addSubview:", self->_livePhotoView);
  -[PHLivePhotoView playbackGestureRecognizer](self->_livePhotoView, "playbackGestureRecognizer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  playbackGestureRecognizers = self->_playbackGestureRecognizers;
  self->_playbackGestureRecognizers = v13;

  modelTileTransform = self->_modelTileTransform;
  self->_modelTileTransform = 0;

  -[PULivePhotoVideoOverlayTileViewController _updateLivePhotoViewPhoto](self, "_updateLivePhotoViewPhoto");
  -[PULivePhotoVideoOverlayTileViewController _updateLivePhotoViewModulatorInput](self, "_updateLivePhotoViewModulatorInput");
  return self->_containerView;
}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PULivePhotoVideoOverlayTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PULivePhotoVideoOverlayTileViewController setBrowsingViewModel:](self, "setBrowsingViewModel:", 0);
  -[PULivePhotoVideoOverlayTileViewController setImageModulationManager:](self, "setImageModulationManager:", 0);
  -[PULivePhotoVideoOverlayTileViewController setMergedVideoProvider:](self, "setMergedVideoProvider:", 0);
}

- (BOOL)disappearanceAssertionsEnabled
{
  return 0;
}

- (BOOL)livePhotoView:(id)a3 canBeginPlaybackWithStyle:(int64_t)a4
{
  PULivePhotoVideoOverlayTileViewController *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = self;
  -[PULivePhotoVideoOverlayTileViewController livePhotoView](self, "livePhotoView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playbackGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PULivePhotoVideoOverlayTileViewController delegate](v4, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v7, "livePhotoVideoPlaybackTileViewControllerCanBeginPlaying:locationProvider:", v4, v6);

  return (char)v4;
}

- (void)livePhotoView:(id)a3 willBeginPlaybackWithStyle:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  char v19;

  -[PULivePhotoVideoOverlayTileViewController setWillEndCurrentPlayback:](self, "setWillEndCurrentPlayback:", 0, a4);
  -[PULivePhotoVideoOverlayTileViewController _updateLivePhotoViewPhoto](self, "_updateLivePhotoViewPhoto");
  -[PULivePhotoVideoOverlayTileViewController browsingViewModel](self, "browsingViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PULivePhotoVideoOverlayTileViewController setPlaybackAssetReference:](self, "setPlaybackAssetReference:", v6);
  -[PULivePhotoVideoOverlayTileViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "livePhotoVideoPlaybackTileViewControllerDisplayTileTransform:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "modelTileTransform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PULivePhotoVideoOverlayTileViewController setModelTileTransform:](self, "setModelTileTransform:", v9);

  objc_msgSend(v8, "modelTileTransform");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasUserZoomedIn");

  -[PULivePhotoVideoOverlayTileViewController livePhotoView](self, "livePhotoView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHidden:", 0);

  if (!-[PULivePhotoVideoOverlayTileViewController isPresentedForSecondScreen](self, "isPresentedForSecondScreen"))
  {
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __86__PULivePhotoVideoOverlayTileViewController_livePhotoView_willBeginPlaybackWithStyle___block_invoke;
    v17 = &unk_1E58AAD68;
    v18 = v5;
    v19 = v11;
    objc_msgSend(v18, "performChanges:", &v14);

  }
  -[PULivePhotoVideoOverlayTileViewController delegate](self, "delegate", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "livePhotoVideoPlaybackTileViewControllerWillBeginPlaying:", self);

}

- (void)livePhotoView:(id)a3 didEndPlaybackWithStyle:(int64_t)a4
{
  void *v5;
  void *v6;

  -[PULivePhotoVideoOverlayTileViewController livePhotoView](self, "livePhotoView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[PULivePhotoVideoOverlayTileViewController setPlaybackAssetReference:](self, "setPlaybackAssetReference:", 0);
  -[PULivePhotoVideoOverlayTileViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "livePhotoVideoPlaybackTileViewControllerDidEndPlaying:", self);

  -[PULivePhotoVideoOverlayTileViewController _updateMergedVideo](self, "_updateMergedVideo");
}

- (double)livePhotoView:(id)a3 extraMinimumTouchDurationForTouch:(id)a4 withStyle:(int64_t)a5
{
  id v6;
  void *v7;
  double v8;
  double v9;

  v6 = a4;
  -[PULivePhotoVideoOverlayTileViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "livePhotoVideoPlaybackTileViewControllerExtraMinimumTouchDuration:locationProvider:", self, v6);
  v9 = v8;

  return v9;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  _QWORD v15[15];
  uint64_t v16;

  v6 = a4;
  v9 = a3;
  if ((void *)MergedVideoProviderContext_38299 == a5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((v6 & 2) == 0)
        goto LABEL_16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULivePhotoVideoOverlayTileViewController.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[observable isKindOfClass:PUOneUpMergedVideoProvider.class]"));

      if ((v6 & 2) == 0)
        goto LABEL_16;
    }
    v16 = MEMORY[0x1E0C809B0];
    v11 = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke;
    v12 = &v16;
    goto LABEL_15;
  }
  if ((void *)VideoPlayerChangeContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PULivePhotoVideoOverlayTileViewController.m"), 254, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x40) != 0
    && !-[PULivePhotoVideoOverlayTileViewController isPresentedForSecondScreen](self, "isPresentedForSecondScreen"))
  {
    v15[10] = MEMORY[0x1E0C809B0];
    v15[11] = 3221225472;
    v15[12] = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_2;
    v15[13] = &unk_1E58ABD10;
    v15[14] = self;
    px_dispatch_on_main_queue();
  }
  if (v6 < 0
    && !-[PULivePhotoVideoOverlayTileViewController isPresentedForSecondScreen](self, "isPresentedForSecondScreen"))
  {
    -[PULivePhotoVideoOverlayTileViewController playbackAssetReference](self, "playbackAssetReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v15[5] = MEMORY[0x1E0C809B0];
      v15[6] = 3221225472;
      v15[7] = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_4;
      v15[8] = &unk_1E58ABD10;
      v15[9] = self;
      px_dispatch_on_main_queue();
    }
  }
  if ((v6 & 4) != 0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v11 = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_7;
    v12 = v15;
LABEL_15:
    v12[1] = 3221225472;
    v12[2] = (uint64_t)v11;
    v12[3] = (uint64_t)&unk_1E58ABD10;
    v12[4] = (uint64_t)self;
    px_dispatch_on_main_queue();
  }
LABEL_16:

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  PUBrowsingViewModel *browsingViewModel;
  PULivePhotoVideoOverlayTileViewController *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  PULivePhotoVideoOverlayTileViewController *v36;
  __int16 v37;
  PUBrowsingViewModel *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PULivePhotoVideoOverlayTileViewController browsingViewModel](self, "browsingViewModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      browsingViewModel = self->_browsingViewModel;
      *(_DWORD *)buf = 138412802;
      v36 = self;
      v37 = 2112;
      v38 = browsingViewModel;
      v39 = 2112;
      v40 = v6;
      _os_log_fault_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_FAULT, "Unexpected browsing view model sent a change to %@. Expected %@, but got %@.", buf, 0x20u);
    }

  }
  v10 = objc_msgSend(v7, "isScrubbingActivationDidChange");
  v11 = objc_msgSend(v7, "currentAssetTransitionProgressDidChange");
  v12 = objc_msgSend(v7, "currentAssetDidChange") | v11 | v10;
  objc_msgSend(v6, "currentAssetReference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (v12 & 1) == 0)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v7, "assetViewModelChangesByAssetReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      v29 = self;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v20, "irisPlayerChange");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "activatedDidChange");

          if ((v22 & 1) != 0 || (objc_msgSend(v20, "accessoryViewVisibilityChanged") & 1) != 0)
          {
            v12 = 1;
            self = v29;
            goto LABEL_19;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        v12 = 0;
        self = v29;
        if (v17)
          continue;
        break;
      }
    }
    else
    {
      v12 = 0;
    }
LABEL_19:

  }
  -[PULivePhotoVideoOverlayTileViewController livePhotoView](self, "livePhotoView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "livePhotoShouldPlayDidChange"))
  {
    objc_msgSend(v23, "playbackGestureRecognizer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEnabled");

    if (v25)
    {
      -[PULivePhotoVideoOverlayTileViewController livePhotoView](self, "livePhotoView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "playerView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setPlaybackFilterTouchActive:", objc_msgSend(v6, "livePhotoShouldPlay"));

    }
  }
  if (v12)
    -[PULivePhotoVideoOverlayTileViewController _updatePlaybackEnabled](self, "_updatePlaybackEnabled");

}

- (void)setPlaybackAssetReference:(id)a3
{
  PUAssetReference *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PULivePhotoVideoOverlayTileViewController *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = (PUAssetReference *)a3;
  if (self->_playbackAssetReference != v5)
  {
    objc_storeStrong((id *)&self->_playbackAssetReference, a3);
    if (v5)
    {
      -[PUTileController tilingView](self, "tilingView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = self;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "detachTileControllers:", v7);

      -[PUTileViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTileController tilingView](self, "tilingView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_transferToSuperview:", v10);

    }
    else
    {
      -[PUTileViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTileController tilingView](self, "tilingView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "px_transferToSuperview:", v12);

      -[PUTileController tilingView](self, "tilingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reattachTileControllers:withContext:", v9, 0);
    }

  }
}

- (void)_updateLivePhotoViewPhoto
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];
  int v12;
  int v13;
  char v14;

  -[PULivePhotoVideoOverlayTileViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "livePhotoVideoPlaybackTileViewControllerCurrentImage:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGImage");
  -[PULivePhotoVideoOverlayTileViewController livePhotoView](self, "livePhotoView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOverridePhoto:", v6);

  v14 = 0;
  v13 = 0;
  -[PULivePhotoVideoOverlayTileViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "livePhotoVideoPlaybackTileViewControllerCurrentGainMapImage:outGainMapAvailable:outGainMapValue:", self, &v14, &v13);

  if (v14)
  {
    -[PULivePhotoVideoOverlayTileViewController livePhotoViewModulator](self, "livePhotoViewModulator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __70__PULivePhotoVideoOverlayTileViewController__updateLivePhotoViewPhoto__block_invoke;
    v11[3] = &__block_descriptor_52_e43_v16__0___PXMutableLivePhotoViewModulator__8l;
    v11[4] = v6;
    v11[5] = v9;
    v12 = v13;
    objc_msgSend(v10, "performChanges:", v11);

  }
}

- (void)setVideoPlayer:(id)a3
{
  ISWrappedAVPlayer *v5;
  ISWrappedAVPlayer *videoPlayer;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  CMTime v13;
  id location;

  v5 = (ISWrappedAVPlayer *)a3;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    -[PULivePhotoVideoOverlayTileViewController videoPlayerTimeObserver](self, "videoPlayerTimeObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISWrappedAVPlayer removeTimeObserver:](videoPlayer, "removeTimeObserver:", v7);

    objc_storeStrong((id *)&self->_videoPlayer, a3);
    objc_initWeak(&location, self);
    CMTimeMake(&v13, 1, 60);
    v8 = MEMORY[0x1E0C80D38];
    v9 = MEMORY[0x1E0C80D38];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PULivePhotoVideoOverlayTileViewController_setVideoPlayer___block_invoke;
    v11[3] = &unk_1E58A6CE8;
    objc_copyWeak(&v12, &location);
    -[ISWrappedAVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](v5, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v13, v8, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PULivePhotoVideoOverlayTileViewController setVideoPlayerTimeObserver:](self, "setVideoPlayerTimeObserver:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)setImageModulationManager:(id)a3
{
  PXImageModulationManager *v5;
  PXImageModulationManager *v6;

  v5 = (PXImageModulationManager *)a3;
  if (self->_imageModulationManager != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_imageModulationManager, a3);
    -[PULivePhotoVideoOverlayTileViewController _updateLivePhotoViewModulator](self, "_updateLivePhotoViewModulator");
    v5 = v6;
  }

}

- (void)_updateLivePhotoViewModulator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[PULivePhotoVideoOverlayTileViewController imageModulationManager](self, "imageModulationManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PULivePhotoVideoOverlayTileViewController livePhotoViewModulator](self, "livePhotoViewModulator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "checkInLivePhotoViewModulator:", v3);

  -[PULivePhotoVideoOverlayTileViewController mergedVideo](self, "mergedVideo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(MEMORY[0x1E0D7B500], "optionsForAsset:", v6);
    objc_msgSend(v10, "checkoutLivePhotoViewModulatorWithOptions:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PULivePhotoVideoOverlayTileViewController setLivePhotoViewModulator:](self, "setLivePhotoViewModulator:", v9);

  }
  else
  {
    -[PULivePhotoVideoOverlayTileViewController setLivePhotoViewModulator:](self, "setLivePhotoViewModulator:", 0);
  }

}

- (void)setLivePhotoViewModulator:(id)a3
{
  PXLivePhotoViewModulator *v5;
  PXLivePhotoViewModulator *v6;

  v5 = (PXLivePhotoViewModulator *)a3;
  if (self->_livePhotoViewModulator != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_livePhotoViewModulator, a3);
    -[PULivePhotoVideoOverlayTileViewController _updateLivePhotoViewModulatorInput](self, "_updateLivePhotoViewModulatorInput");
    v5 = v6;
  }

}

- (void)_updateLivePhotoViewModulatorInput
{
  void *v3;
  _QWORD v4[5];

  -[PULivePhotoVideoOverlayTileViewController livePhotoViewModulator](self, "livePhotoViewModulator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__PULivePhotoVideoOverlayTileViewController__updateLivePhotoViewModulatorInput__block_invoke;
  v4[3] = &unk_1E58A4610;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:", v4);

}

- (void)_updateMergedVideo
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PULivePhotoVideoOverlayTileViewController livePhotoView](self, "livePhotoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "currentPlaybackStyle"))
  {
    -[PULivePhotoVideoOverlayTileViewController mergedVideoProvider](self, "mergedVideoProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mergedVideo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PULivePhotoVideoOverlayTileViewController setMergedVideo:](self, "setMergedVideo:", v5);

  }
}

- (void)_videoCurrentTimeDidChange:(id *)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  PUAssetReference *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  double v19;
  __int128 v20;
  int64_t var3;
  double v22;

  -[PULivePhotoVideoOverlayTileViewController livePhotoView](self, "livePhotoView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "currentPlaybackStyle") == 1
    && !-[PULivePhotoVideoOverlayTileViewController isPresentedForSecondScreen](self, "isPresentedForSecondScreen"))
  {
    v6 = -[PULivePhotoVideoOverlayTileViewController willEndCurrentPlayback](self, "willEndCurrentPlayback");

    if (!v6)
    {
      v22 = NAN;
      -[PULivePhotoVideoOverlayTileViewController mergedVideo](self, "mergedVideo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      objc_msgSend(v7, "assetAtTime:progress:", &v20, &v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[PULivePhotoVideoOverlayTileViewController browsingViewModel](self, "browsingViewModel", v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PUAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:]([PUAssetReference alloc], "initWithAsset:assetCollection:indexPath:dataSourceIdentifier:", v8, 0, 0, 0);
        objc_msgSend(v9, "assetsDataSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "assetReferenceForAssetReference:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __72__PULivePhotoVideoOverlayTileViewController__videoCurrentTimeDidChange___block_invoke;
        v16[3] = &unk_1E58A9DF0;
        v17 = v9;
        v18 = v12;
        v19 = v22;
        v13 = v12;
        v14 = v9;
        objc_msgSend(v14, "performChanges:", v16);

      }
    }
  }
  else
  {

  }
}

- (void)_updatePlaybackEnabled
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[PULivePhotoVideoOverlayTileViewController livePhotoView](self, "livePhotoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentPlaybackStyle");

  if (!v5)
  {
    -[PULivePhotoVideoOverlayTileViewController browsingViewModel](self, "browsingViewModel");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentAssetReference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "assetViewModelForAssetReference:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "playbackStyle");

    if (v9 == 3
      && (objc_msgSend(v17, "currentAssetTransitionProgress"), PXFloatEqualToFloatWithTolerance())
      && (objc_msgSend(v7, "isAccessoryViewVisible") & 1) == 0
      && (objc_msgSend(v7, "irisPlayer"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isActivated"),
          v10,
          (v11 & 1) == 0))
    {
      objc_msgSend(v7, "asset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

    }
    else
    {
      isKindOfClass = 0;
    }
    -[PULivePhotoVideoOverlayTileViewController livePhotoView](self, "livePhotoView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "playbackGestureRecognizer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEnabled:", isKindOfClass & 1);

    -[PULivePhotoVideoOverlayTileViewController containerView](self, "containerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", (isKindOfClass & 1) == 0);

  }
}

- (void)_updateSRLCompensation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id location;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "livePhotoSRLCompensationEnabled"))
    goto LABEL_5;
  if (!objc_msgSend(v3, "livePhotoSRLCompensationManualMode"))
  {
    -[PULivePhotoVideoOverlayTileViewController mergedVideo](self, "mergedVideo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, self);
    objc_msgSend((id)objc_opt_class(), "srlCompensationLoadingQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    objc_copyWeak(&v12, &location);
    PXDispatchAsyncWithSignpost();

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "livePhotoSRLCompensationManualValue");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  -[PULivePhotoVideoOverlayTileViewController livePhotoView](self, "livePhotoView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOverrideSRLCompensationAmount:", v5);

}

- (void)_handleLoadedSRLCompensationAmount:(id)a3 forAsset:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[PULivePhotoVideoOverlayTileViewController mergedVideo](self, "mergedVideo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    -[PULivePhotoVideoOverlayTileViewController livePhotoView](self, "livePhotoView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOverrideSRLCompensationAmount:", v11);

  }
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUOneUpMergedVideoProvider)mergedVideoProvider
{
  return self->_mergedVideoProvider;
}

- (BOOL)isPresentedForSecondScreen
{
  return self->_isPresentedForSecondScreen;
}

- (void)setIsPresentedForSecondScreen:(BOOL)a3
{
  self->_isPresentedForSecondScreen = a3;
}

- (PULivePhotoVideoOverlayTileViewControllerDelegate)delegate
{
  return (PULivePhotoVideoOverlayTileViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXImageModulationManager)imageModulationManager
{
  return self->_imageModulationManager;
}

- (NSArray)playbackGestureRecognizers
{
  return self->_playbackGestureRecognizers;
}

- (UIImpactFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (PUMergedLivePhotosVideo)mergedVideo
{
  return self->_mergedVideo;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (PHLivePhotoView)livePhotoView
{
  return self->_livePhotoView;
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (id)videoPlayerTimeObserver
{
  return self->_videoPlayerTimeObserver;
}

- (void)setVideoPlayerTimeObserver:(id)a3
{
  objc_storeStrong(&self->_videoPlayerTimeObserver, a3);
}

- (PUModelTileTransform)modelTileTransform
{
  return self->_modelTileTransform;
}

- (void)setModelTileTransform:(id)a3
{
  objc_storeStrong((id *)&self->_modelTileTransform, a3);
}

- (PXLivePhotoViewModulator)livePhotoViewModulator
{
  return self->_livePhotoViewModulator;
}

- (PUAssetReference)playbackAssetReference
{
  return self->_playbackAssetReference;
}

- (BOOL)willEndCurrentPlayback
{
  return self->_willEndCurrentPlayback;
}

- (void)setWillEndCurrentPlayback:(BOOL)a3
{
  self->_willEndCurrentPlayback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackAssetReference, 0);
  objc_storeStrong((id *)&self->_livePhotoViewModulator, 0);
  objc_storeStrong((id *)&self->_modelTileTransform, 0);
  objc_storeStrong(&self->_videoPlayerTimeObserver, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_livePhotoView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_mergedVideo, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_playbackGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_imageModulationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mergedVideoProvider, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

void __67__PULivePhotoVideoOverlayTileViewController__updateSRLCompensation__block_invoke(uint64_t a1)
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
  block[2] = __67__PULivePhotoVideoOverlayTileViewController__updateSRLCompensation__block_invoke_2;
  block[3] = &unk_1E58AA2E0;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v5 = v2;
  v6 = *(id *)(a1 + 32);
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v7);
}

void __67__PULivePhotoVideoOverlayTileViewController__updateSRLCompensation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleLoadedSRLCompensationAmount:forAsset:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __72__PULivePhotoVideoOverlayTileViewController__videoCurrentTimeDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:transitionProgress:transitionDriverIdentifier:animated:", *(_QWORD *)(a1 + 40), CFSTR("LivePhotoOverlay"), 0, *(double *)(a1 + 48));
}

void __79__PULivePhotoVideoOverlayTileViewController__updateLivePhotoViewModulatorInput__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "livePhotoView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLivePhotoView:", v4);

}

void __60__PULivePhotoVideoOverlayTileViewController_setVideoPlayer___block_invoke(uint64_t a1, __int128 *a2)
{
  id WeakRetained;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = *a2;
  v5 = *((_QWORD *)a2 + 2);
  objc_msgSend(WeakRetained, "_videoCurrentTimeDidChange:", &v4);

}

void __70__PULivePhotoVideoOverlayTileViewController__updateLivePhotoViewPhoto__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  id v5;

  if (*(_QWORD *)(a1 + 32))
    v3 = *(_QWORD *)(a1 + 40);
  else
    v3 = 0;
  v5 = a2;
  objc_msgSend(v5, "setGainMapImage:", v3);
  LODWORD(v4) = *(_DWORD *)(a1 + 48);
  objc_msgSend(v5, "setGainMapValue:", v4);

}

void __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "browsingViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_3;
  v3[3] = &unk_1E58ABD10;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "performChanges:", v3);

}

void __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "setWillEndCurrentPlayback:", 1);
  objc_msgSend(*(id *)(a1 + 32), "browsingViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "modelTileTransform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "playbackAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_5;
  v8[3] = &unk_1E58AB790;
  v9 = v2;
  v10 = v4;
  v11 = v3;
  v5 = v3;
  v6 = v4;
  v7 = v2;
  objc_msgSend(v7, "performChanges:", v8);

}

uint64_t __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMergedVideo");
}

void __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "livePhotoView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setVideoPlayer:", v3);

}

void __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "assetViewModelForAssetReference:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(a1 + 48))
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_6;
    v9 = &unk_1E58ABCA8;
    v10 = v2;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v10, "performChanges:", &v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "setVideoOverlayPlayState:", 0, v6, v7, v8, v9);
  objc_msgSend(*(id *)(a1 + 32), "assetsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetReferenceForAssetReference:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:transitionProgress:transitionDriverIdentifier:animated:", v5, CFSTR("PUBrowsingViewModelTransitionDriverIdentifierLivePhotoOverlay"), 0, 0.0);
}

uint64_t __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setModelTileTransform:", *(_QWORD *)(a1 + 40));
}

void __74__PULivePhotoVideoOverlayTileViewController_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "mergedVideoProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "livePhotoPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAttemptingToPlayback");
  objc_msgSend(*(id *)(a1 + 32), "browsingViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAttemptingToPlayVideoOverlay:", v3);

}

uint64_t __86__PULivePhotoVideoOverlayTileViewController_livePhotoView_willBeginPlaybackWithStyle___block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 40))
    v1 = 2;
  else
    v1 = 1;
  return objc_msgSend(*(id *)(a1 + 32), "setVideoOverlayPlayState:", v1);
}

+ (OS_dispatch_queue)srlCompensationLoadingQueue
{
  if (srlCompensationLoadingQueue_onceToken != -1)
    dispatch_once(&srlCompensationLoadingQueue_onceToken, &__block_literal_global_38318);
  return (OS_dispatch_queue *)(id)srlCompensationLoadingQueue_queue;
}

void __72__PULivePhotoVideoOverlayTileViewController_srlCompensationLoadingQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  px_dispatch_queue_create_serial();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)srlCompensationLoadingQueue_queue;
  srlCompensationLoadingQueue_queue = v0;

}

@end
