@implementation PUVideoTileViewController

- (PUVideoTileViewController)initWithReuseIdentifier:(id)a3
{
  PUVideoTileViewController *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUVideoTileViewController;
  result = -[PUTileController initWithReuseIdentifier:](&v4, sel_initWithReuseIdentifier_, a3);
  if (result)
  {
    result->_placeholderVisible = 1;
    result->_canPlayVideo = 1;
  }
  return result;
}

- (void)setCanPlayVideo:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  if (self->_canPlayVideo != a3)
  {
    v3 = a3;
    -[PUVideoTileViewController browsingVideoPlayer](self, "browsingVideoPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "registerVideoOutput:", self);
    else
      objc_msgSend(v5, "unregisterVideoOutput:", self);

    self->_canPlayVideo = v3;
    -[PUVideoTileViewController _callReadyToDisplayChangeHandler](self, "_callReadyToDisplayChangeHandler");
    -[PUVideoTileViewController _updateVideo](self, "_updateVideo");
  }
}

- (void)setAssetViewModel:(id)a3
{
  PUAssetViewModel *v5;
  PUAssetViewModel **p_assetViewModel;
  PUAssetViewModel *assetViewModel;
  void *v8;
  void *v9;
  PUAssetViewModel *v10;

  v5 = (PUAssetViewModel *)a3;
  p_assetViewModel = &self->_assetViewModel;
  assetViewModel = self->_assetViewModel;
  v10 = v5;
  if (assetViewModel != v5)
  {
    -[PUAssetViewModel unregisterChangeObserver:](assetViewModel, "unregisterChangeObserver:", self);
    -[PUAssetViewModel unregisterVideoLayerSource:](*p_assetViewModel, "unregisterVideoLayerSource:", self);
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    -[PUAssetViewModel registerChangeObserver:](*p_assetViewModel, "registerChangeObserver:", self);
    -[PUAssetViewModel registerVideoLayerSource:](*p_assetViewModel, "registerVideoLayerSource:", self);
    -[PUAssetViewModel asset](v10, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUVideoTileViewController _setAsset:](self, "_setAsset:", v8);

    -[PUAssetViewModel videoPlayer](*p_assetViewModel, "videoPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUVideoTileViewController setBrowsingVideoPlayer:](self, "setBrowsingVideoPlayer:", v9);

    -[PUVideoTileViewController _updateInteractionHostViewRegistration](self, "_updateInteractionHostViewRegistration");
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
    -[PUVideoTileViewController _updateImage](self, "_updateImage");
    v5 = v6;
  }

}

- (id)loadView
{
  id v3;
  UIView *v4;
  UIView *view;
  id v6;
  PXVideoSessionUIView *v7;
  PXVideoSessionUIView *videoView;
  id v9;
  UIImageView *v10;
  UIImageView *placeholderImageView;
  id v12;
  PXPixelBufferView *v13;
  PXPixelBufferView *pixelBufferView;
  void *v15;
  id v16;
  UIView *v17;
  UIView *borderView;
  void *v19;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  view = self->_view;
  self->_view = v4;

  v6 = objc_alloc(MEMORY[0x1E0D7BBD8]);
  -[UIView bounds](self->_view, "bounds");
  v7 = (PXVideoSessionUIView *)objc_msgSend(v6, "initWithFrame:");
  videoView = self->_videoView;
  self->_videoView = v7;

  -[PXVideoSessionUIView setAutoresizingMask:](self->_videoView, "setAutoresizingMask:", 18);
  -[PXVideoSessionUIView setDelegate:](self->_videoView, "setDelegate:", self);
  -[UIView addSubview:](self->_view, "addSubview:", self->_videoView);
  v9 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[UIView bounds](self->_view, "bounds");
  v10 = (UIImageView *)objc_msgSend(v9, "initWithFrame:");
  placeholderImageView = self->_placeholderImageView;
  self->_placeholderImageView = v10;

  -[UIImageView setAutoresizingMask:](self->_placeholderImageView, "setAutoresizingMask:", 18);
  -[UIImageView setContentMode:](self->_placeholderImageView, "setContentMode:", 2);
  -[UIImageView setAlpha:](self->_placeholderImageView, "setAlpha:", (double)-[PUVideoTileViewController placeholderVisible](self, "placeholderVisible"));
  -[UIView addSubview:](self->_view, "addSubview:", self->_placeholderImageView);
  v12 = objc_alloc(MEMORY[0x1E0D7B838]);
  -[UIView bounds](self->_view, "bounds");
  v13 = (PXPixelBufferView *)objc_msgSend(v12, "initWithFrame:");
  pixelBufferView = self->_pixelBufferView;
  self->_pixelBufferView = v13;

  -[PXPixelBufferView setAutoresizingMask:](self->_pixelBufferView, "setAutoresizingMask:", 18);
  -[UIImageView addSubview:](self->_placeholderImageView, "addSubview:", self->_pixelBufferView);
  self->_placeholderIsAnimatingToHidden = !-[PUVideoTileViewController placeholderVisible](self, "placeholderVisible");
  -[PUVideoTileViewController _updateDebugBorders](self, "_updateDebugBorders");
  -[PUVideoTileViewController _updateLiveEffectsRenderDebugIndicator](self, "_updateLiveEffectsRenderDebugIndicator");
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addKeyObserver:", self);

  v16 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[UIView bounds](self->_view, "bounds");
  v17 = (UIView *)objc_msgSend(v16, "initWithFrame:");
  borderView = self->_borderView;
  self->_borderView = v17;

  -[UIView setUserInteractionEnabled:](self->_borderView, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_borderView, "setBackgroundColor:", v19);

  -[UIView setClipsToBounds:](self->_borderView, "setClipsToBounds:", 1);
  -[UIView setAutoresizingMask:](self->_borderView, "setAutoresizingMask:", 18);
  -[UIView addSubview:](self->_view, "addSubview:", self->_borderView);
  return self->_view;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUVideoTileViewController;
  -[PUTileViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PUVideoTileViewController _updateInteractionHostViewRegistration](self, "_updateInteractionHostViewRegistration");
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
  void *v16;
  _QWORD v17[9];
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)PUVideoTileViewController;
  v4 = a3;
  -[PUTileViewController applyLayoutInfo:](&v18, sel_applyLayoutInfo_, v4);
  objc_msgSend(v4, "contentsRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  if (!CGRectIsEmpty(v19))
  {
    -[PUVideoTileViewController videoView](self, "videoView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentsRect:", v6, v8, v10, v12);

    -[UIImageView layer](self->_placeholderImageView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentsRect:", v6, v8, v10, v12);

    -[PUVideoTileViewController _layoutLiveEffectsRenderDebugIndicator](self, "_layoutLiveEffectsRenderDebugIndicator");
    -[PUVideoTileViewController assetViewModel](self, "assetViewModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__PUVideoTileViewController_applyLayoutInfo___block_invoke;
    v17[3] = &unk_1E58AACA0;
    v17[4] = self;
    *(double *)&v17[5] = v6;
    *(double *)&v17[6] = v8;
    *(double *)&v17[7] = v10;
    *(double *)&v17[8] = v12;
    objc_msgSend(v15, "performChanges:", v17);

  }
  -[PUVideoTileViewController _updateTargetSize](self, "_updateTargetSize");
  -[PUTileViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutIfNeeded");

}

- (id)viewsForApplyingBorder
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!-[PUTileViewController isViewLoaded](self, "isViewLoaded"))
    return 0;
  -[PUVideoTileViewController borderView](self, "borderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  -[PUTileViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[PUVideoTileViewController borderView](self, "borderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setEdgeAntialiasingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PUVideoTileViewController videoView](self, "videoView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsEdgeAntialiasing:", v3);

}

- (void)becomeReusable
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUVideoTileViewController;
  -[PUTileViewController becomeReusable](&v3, sel_becomeReusable);
  -[PUVideoTileViewController setAssetViewModel:](self, "setAssetViewModel:", 0);
  -[PUVideoTileViewController setMediaProvider:](self, "setMediaProvider:", 0);
  self->_waitForFocusValueForCrossfade = 0;
  self->_isOnSecondScreen = 0;
}

- (void)removeAllAnimations
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUVideoTileViewController;
  -[PUTileViewController removeAllAnimations](&v4, sel_removeAllAnimations);
  -[PUVideoTileViewController videoView](self, "videoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_removeAllGeometryAnimationsRecursively:", 1);

  -[UIImageView pu_removeAllGeometryAnimationsRecursively:](self->_placeholderImageView, "pu_removeAllGeometryAnimationsRecursively:", 1);
}

- (void)didChangeAnimating
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUVideoTileViewController;
  -[PUTileController didChangeAnimating](&v3, sel_didChangeAnimating);
  -[PUVideoTileViewController _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
  -[PUVideoTileViewController _callReadyToDisplayChangeHandler](self, "_callReadyToDisplayChangeHandler");
  if (!-[PUTileController shouldPreserveCurrentContent](self, "shouldPreserveCurrentContent"))
    -[PUVideoTileViewController _updateVideo](self, "_updateVideo");
}

- (void)didChangeActive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUVideoTileViewController;
  -[PUTileController didChangeActive](&v3, sel_didChangeActive);
  -[PUVideoTileViewController _updateTargetSize](self, "_updateTargetSize");
}

- (void)setPreloadedImage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UIImageView image](self->_placeholderImageView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[UIImageView setImage:](self->_placeholderImageView, "setImage:", v5);

}

- (id)generateAssetTransitionInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  -[PUVideoTileViewController videoSession](self, "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUVideoTileViewController videoView](self, "videoView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generateSnapshotImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[UIImageView image](self->_placeholderImageView, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PUVideoTileViewController videoView](self, "videoView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewForSnapshotting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "snapshotViewAfterScreenUpdates:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__PUVideoTileViewController_generateAssetTransitionInfo__block_invoke;
  v14[3] = &unk_1E58AACC8;
  v14[4] = self;
  v15 = v5;
  v16 = v8;
  v17 = v3;
  v9 = v3;
  v10 = v8;
  v11 = v5;
  +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:](PUAssetTransitionInfo, "assetTransitionInfoWithConfigurationBlock:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)adoptAssetTransitionInfo:(id)a3
{
  id v4;
  void *v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  if (a3)
  {
    v4 = a3;
    -[PUVideoTileViewController browsingVideoPlayer](self, "browsingVideoPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0uLL;
    v10 = 0;
    objc_msgSend(v4, "seekTime");

    if ((unsigned __int128)0 >> 96)
    {
      v7 = v9;
      v8 = v10;
      objc_msgSend(v5, "seekToTime:completionHandler:", &v7, 0);
    }
    -[PUVideoTileViewController _updateVideo](self, "_updateVideo");

  }
  return 1;
}

- (void)videoPlayer:(id)a3 desiredSeekTimeDidChange:(id *)a4
{
  if ((a4->var2 & 1) != 0)
  {
    -[PUVideoTileViewController setPlayerDidPlayToEnd:](self, "setPlayerDidPlayToEnd:", 0);
    -[PUVideoTileViewController setPlayerIsSeeking:](self, "setPlayerIsSeeking:", 1);
  }
}

- (void)videoPlayer:(id)a3 currentTimeDidChange:(id *)a4
{
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "playState") == 3)
  {
    -[PUVideoTileViewController setPlayerIsSeeking:](self, "setPlayerIsSeeking:", 0);
    if ((objc_msgSend(v5, "isAtEnd") & 1) == 0 && (objc_msgSend(v5, "isAtBeginning") & 1) == 0)
      -[PUVideoTileViewController setPlayerDidPlayToEnd:](self, "setPlayerDidPlayToEnd:", 0);
  }

}

- (void)videoSessionViewPlaceholderVisibilityChanged:(id)a3
{
  -[PUVideoTileViewController _updateReadyForDisplay](self, "_updateReadyForDisplay", a3);
  -[PUVideoTileViewController _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
  -[PUVideoTileViewController _callReadyToDisplayChangeHandler](self, "_callReadyToDisplayChangeHandler");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)VideoSessionContext == a5)
    px_dispatch_on_main_queue();
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  if (!-[PUTileController shouldPreserveCurrentContent](self, "shouldPreserveCurrentContent"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[PUVideoTileViewController _handleAssetViewModel:didChange:](self, "_handleAssetViewModel:didChange:", v14, v7);
LABEL_10:
      -[PUVideoTileViewController _updateReadyForDisplay](self, "_updateReadyForDisplay");
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    v8 = v7;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_7:
        if (objc_msgSend(v8, "avPlayerDidChange"))
          -[PUVideoTileViewController _updateVideo](self, "_updateVideo");

        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUVideoTileViewController.m"), 352, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("change"), v11, v13);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUVideoTileViewController.m"), 352, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("change"), v11);
    }

    goto LABEL_7;
  }
LABEL_11:

}

- (BOOL)videoOutputIsReadyForDisplay
{
  void *v3;
  BOOL v4;

  -[PUVideoTileViewController videoView](self, "videoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVideoLayerReadyForDisplay")
    && !-[PUTileController isAnimating](self, "isAnimating")
    && !-[PUVideoTileViewController placeholderIsAnimatingToHidden](self, "placeholderIsAnimatingToHidden")
    && -[PUVideoTileViewController canPlayVideo](self, "canPlayVideo");

  return v4;
}

- (void)prepareForVideoResolutionChange
{
  void *v3;
  void *v4;
  __CVBuffer *v5;

  -[PUVideoTileViewController videoView](self, "videoView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activePlayerLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (__CVBuffer *)objc_msgSend(v4, "copyDisplayedPixelBuffer");

  if (v5)
  {
    -[PXPixelBufferView enqueuePixelBuffer:](self->_pixelBufferView, "enqueuePixelBuffer:", v5);
    CVPixelBufferRelease(v5);
    -[PUVideoTileViewController setPlaceholderVisible:animated:animationDuration:completion:](self, "setPlaceholderVisible:animated:animationDuration:completion:", 1, 0, 0, 0.0);
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  id v9;

  v9 = a4;
  NSStringFromSelector(sel_videoShowDebugBorders);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "isEqualToString:", v5);

  if (v6)
    -[PUVideoTileViewController _updateDebugBorders](self, "_updateDebugBorders");
  NSStringFromSelector(sel_videoShowLiveEffectsRenderingIndicator);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "isEqualToString:", v7);

  if (v8)
    -[PUVideoTileViewController _updateLiveEffectsRenderDebugIndicator](self, "_updateLiveEffectsRenderDebugIndicator");

}

- (AVPlayerLayer)playerLayer
{
  void *v2;
  void *v3;

  -[PUVideoTileViewController videoView](self, "videoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activePlayerLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVPlayerLayer *)v3;
}

- (void)_updateInteractionHostViewRegistration
{
  id v3;

  -[PUVideoTileViewController assetViewModel](self, "assetViewModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerView:forImageAnalysisInteractionHostMode:", self->_view, 2);

}

- (void)_updateDebugBorders
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "videoShowDebugBorders");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "CGColor");
    -[UIImageView layer](self->_placeholderImageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderColor:", v6);

    -[UIImageView layer](self->_placeholderImageView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderWidth:", 5.0);

    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = objc_msgSend(v9, "CGColor");
    -[PXVideoSessionUIView layer](self->_videoView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderColor:", v10);

    -[PXVideoSessionUIView layer](self->_videoView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 8.0;
  }
  else
  {
    -[UIImageView layer](self->_placeholderImageView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBorderColor:", 0);

    -[UIImageView layer](self->_placeholderImageView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBorderWidth:", 0.0);

    -[PXVideoSessionUIView layer](self->_videoView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBorderColor:", 0);

    -[PXVideoSessionUIView layer](self->_videoView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0.0;
  }
  v17 = v12;
  objc_msgSend(v12, "setBorderWidth:", v13);

}

- (void)setPlaceholderIsAnimatingToHidden:(BOOL)a3
{
  if (self->_placeholderIsAnimatingToHidden != a3)
  {
    self->_placeholderIsAnimatingToHidden = a3;
    -[PUVideoTileViewController _callReadyToDisplayChangeHandler](self, "_callReadyToDisplayChangeHandler");
  }
}

- (void)_setAsset:(id)a3
{
  PUDisplayAsset *v5;
  PUDisplayAsset *asset;
  PUDisplayAsset *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[4];
  PUDisplayAsset *v11;
  id v12;
  id location;

  v5 = (PUDisplayAsset *)a3;
  asset = self->_asset;
  if (asset != v5)
  {
    v7 = asset;
    v8 = -[PUDisplayAsset isContentEqualTo:](v5, "isContentEqualTo:", v7);
    if (!v8)
      v8 = -[PUDisplayAsset isContentEqualTo:](v7, "isContentEqualTo:", v5);

    objc_storeStrong((id *)&self->_asset, a3);
    objc_initWeak(&location, self);
    objc_msgSend((id)objc_opt_class(), "keyFrameTimeLoadingQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__PUVideoTileViewController__setAsset___block_invoke;
    block[3] = &unk_1E58AB210;
    objc_copyWeak(&v12, &location);
    v11 = v5;
    dispatch_async(v9, block);

    -[PUVideoTileViewController _updateTargetSize](self, "_updateTargetSize");
    -[PUVideoTileViewController _updateVideo](self, "_updateVideo");
    if (v8 != 2)
    {
      -[PUVideoTileViewController setRequestedImageTargetSize:](self, "setRequestedImageTargetSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      -[PUVideoTileViewController _updateImage](self, "_updateImage");
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)_fetchKeyTimeForAsset:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  uint64_t v10;
  id location;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  PUVideoTileViewController *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "keyFrameTimeLoadingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __51__PUVideoTileViewController__fetchKeyTimeForAsset___block_invoke;
  v17 = &unk_1E58AAD18;
  v20 = &v21;
  v6 = v4;
  v18 = v6;
  v19 = self;
  px_dispatch_on_main_queue_sync();
  if (*((_BYTE *)v22 + 24))
  {
    v12 = 0uLL;
    v13 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (v6)
      {
        objc_msgSend(v6, "videoKeyFrameSourceTime");
      }
      else
      {
        v12 = 0uLL;
        v13 = 0;
      }
    }
    else
    {
      v12 = *MEMORY[0x1E0CA2E18];
      v13 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    }
    objc_initWeak(&location, self);
    objc_copyWeak(&v8, &location);
    v9 = v12;
    v10 = v13;
    v7 = v6;
    px_dispatch_on_main_queue();

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  _Block_object_dispose(&v21, 8);
}

- (void)_handleKeyFrameSourceTime:(id *)a3 forAsset:(id)a4
{
  id v6;
  id v7;
  __int128 v8;
  int64_t var3;

  v6 = a4;
  -[PUVideoTileViewController asset](self, "asset");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    v8 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    -[PUVideoTileViewController setAssetKeyFrameSourceTime:](self, "setAssetKeyFrameSourceTime:", &v8);
  }
}

- (void)setBrowsingVideoPlayer:(id)a3
{
  PUBrowsingVideoPlayer *v5;
  PUBrowsingVideoPlayer **p_browsingVideoPlayer;
  PUBrowsingVideoPlayer *browsingVideoPlayer;
  PUBrowsingVideoPlayer *v8;

  v5 = (PUBrowsingVideoPlayer *)a3;
  p_browsingVideoPlayer = &self->_browsingVideoPlayer;
  browsingVideoPlayer = self->_browsingVideoPlayer;
  if (browsingVideoPlayer != v5)
  {
    v8 = v5;
    -[PUBrowsingVideoPlayer unregisterChangeObserver:](browsingVideoPlayer, "unregisterChangeObserver:", self);
    -[PUBrowsingVideoPlayer unregisterTimeObserver:](*p_browsingVideoPlayer, "unregisterTimeObserver:", self);
    -[PUBrowsingVideoPlayer unregisterVideoOutput:](*p_browsingVideoPlayer, "unregisterVideoOutput:", self);
    objc_storeStrong((id *)&self->_browsingVideoPlayer, a3);
    -[PUBrowsingVideoPlayer registerTimeObserver:](*p_browsingVideoPlayer, "registerTimeObserver:", self);
    if (-[PUVideoTileViewController canPlayVideo](self, "canPlayVideo"))
      -[PUBrowsingVideoPlayer registerVideoOutput:](*p_browsingVideoPlayer, "registerVideoOutput:", self);
    -[PUBrowsingVideoPlayer registerChangeObserver:](*p_browsingVideoPlayer, "registerChangeObserver:", self);
    -[PUVideoTileViewController _updateVideo](self, "_updateVideo");
    v5 = v8;
  }

}

- (void)setPlaceholderVisible:(BOOL)a3 animated:(BOOL)a4 animationDuration:(double)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  _QWORD v16[5];
  BOOL v17;

  v7 = a3;
  v9 = a6;
  if (self->_placeholderVisible != v7)
  {
    self->_placeholderVisible = v7;
    v10 = !v7;
    if (a5 > 0.0)
      v11 = v10;
    else
      v11 = 0;
    -[PUVideoTileViewController setPlaceholderIsAnimatingToHidden:](self, "setPlaceholderIsAnimatingToHidden:", v11);
    -[PUVideoTileViewController setPlaceholderHiddenBehindVideoView:](self, "setPlaceholderHiddenBehindVideoView:", 0);
    v12 = (void *)MEMORY[0x1E0DC3F10];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __89__PUVideoTileViewController_setPlaceholderVisible_animated_animationDuration_completion___block_invoke;
    v16[3] = &unk_1E58AAD68;
    v16[4] = self;
    v17 = v7;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__PUVideoTileViewController_setPlaceholderVisible_animated_animationDuration_completion___block_invoke_2;
    v13[3] = &unk_1E58AAD90;
    v13[4] = self;
    v15 = v7;
    v14 = v9;
    objc_msgSend(v12, "animateWithDuration:delay:options:animations:completion:", 2, v16, v13, a5, 0.0);
    if ((v10 & 1) == 0)
      -[PUVideoTileViewController _updateImage](self, "_updateImage");

  }
}

- (void)setPlaceholderHiddenBehindVideoView:(BOOL)a3
{
  UIImageView *placeholderImageView;

  if (self->_placeholderHiddenBehindVideoView != a3)
  {
    self->_placeholderHiddenBehindVideoView = a3;
    placeholderImageView = self->_placeholderImageView;
    if (a3)
    {
      -[UIImageView setAlpha:](placeholderImageView, "setAlpha:", 1.0);
      -[UIView insertSubview:belowSubview:](self->_view, "insertSubview:belowSubview:", self->_placeholderImageView, self->_videoView);
    }
    else
    {
      -[UIImageView setAlpha:](placeholderImageView, "setAlpha:", 0.0);
      -[UIView insertSubview:aboveSubview:](self->_view, "insertSubview:aboveSubview:", self->_placeholderImageView, self->_videoView);
    }
  }
}

- (void)_setTargetSize:(CGSize)a3
{
  double width;
  double height;
  double v6;
  double v7;
  BOOL v9;
  BOOL v10;
  double v11;
  double v12;
  id v13;

  width = self->__targetSize.width;
  height = self->__targetSize.height;
  if (a3.width != width || a3.height != height)
  {
    v6 = a3.height;
    v7 = a3.width;
    self->__targetSize = a3;
    -[UIImageView image](self->_placeholderImageView, "image");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
      v9 = v7 <= width;
    else
      v9 = 0;
    v10 = v9 && v6 <= height;
    if (!v10 || (objc_msgSend(v13, "size"), v7 > v11) || (objc_msgSend(v13, "size"), v6 > v12))
    {
      if (-[PUVideoTileViewController placeholderVisible](self, "placeholderVisible"))
        -[PUVideoTileViewController _updateImage](self, "_updateImage");
    }

  }
}

- (void)_setCurrentImageRequestID:(int)a3
{
  void *v5;

  if (self->__currentImageRequestID != a3)
  {
    -[PUVideoTileViewController mediaProvider](self, "mediaProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelImageRequest:", self->__currentImageRequestID);

    self->__currentImageRequestID = a3;
  }
}

- (void)_callReadyToDisplayChangeHandler
{
  void *v2;
  void *v3;
  id v4;

  -[PUVideoTileViewController readyForDisplayChangeHandler](self, "readyForDisplayChangeHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "copy");

  v3 = v4;
  if (v4)
  {
    (*((void (**)(id))v4 + 2))(v4);
    v3 = v4;
  }

}

- (void)_handleAssetViewModel:(id)a3 didChange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUVideoTileViewController _setAsset:](self, "_setAsset:", v7);

  if (objc_msgSend(v6, "focusValueChanged") && self->_waitForFocusValueForCrossfade)
    -[PUVideoTileViewController _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
  if (objc_msgSend(v6, "isUserTransformingTileDidChange")
    && (objc_msgSend(v10, "isUserTransformingTile") & 1) == 0)
  {
    -[PUVideoTileViewController browsingVideoPlayer](self, "browsingVideoPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUVideoTileViewController _targetSize](self, "_targetSize");
    objc_msgSend(v8, "setDesiredTargetSize:");

  }
  if (objc_msgSend(v6, "videoPlayerDidChange"))
  {
    objc_msgSend(v10, "videoPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUVideoTileViewController setBrowsingVideoPlayer:](self, "setBrowsingVideoPlayer:", v9);

  }
}

- (void)_updateReadyForDisplay
{
  _BOOL8 v3;

  v3 = -[PUVideoTileViewController _isDisplayingVideo](self, "_isDisplayingVideo")
    || -[PUVideoTileViewController _isDisplayingFullQualityImage](self, "_isDisplayingFullQualityImage");
  -[PUTileViewController _setReadyForDisplay:](self, "_setReadyForDisplay:", v3);
}

- (void)_updateTargetSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  if (-[PUTileController isActive](self, "isActive"))
  {
    -[PUTileViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;

    if (v7 < 1.0)
    {
      -[PUTileController tilingView](self, "tilingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "screen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scale");
      v7 = v11;

    }
    if (v7 < 1.0 && PUMainScreenScale_onceToken != -1)
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
    -[PUTileViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");

    -[PUVideoTileViewController asset](self, "asset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pixelWidth");
    objc_msgSend(v13, "pixelHeight");
    PXSizeMin();
    v15 = v14;
    v17 = v16;

  }
  else
  {
    v15 = *MEMORY[0x1E0C9D820];
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  -[PUVideoTileViewController _setTargetSize:](self, "_setTargetSize:", v15, v17);
}

- (void)_updateImage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  id location;

  -[PUVideoTileViewController assetViewModel](self, "assetViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUVideoTileViewController _targetSize](self, "_targetSize");
  v6 = v5;
  v8 = v7;
  -[PUVideoTileViewController mediaProvider](self, "mediaProvider");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v4)
  {
    if (v8 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v6 == *MEMORY[0x1E0C9D820] || v9 == 0)
    {
      -[PUVideoTileViewController _setCurrentImageRequestID:](self, "_setCurrentImageRequestID:", 0);
    }
    else
    {
      -[PUVideoTileViewController requestedImageTargetSize](self, "requestedImageTargetSize");
      if (v13 < v6
        || (-[PUVideoTileViewController requestedImageTargetSize](self, "requestedImageTargetSize"), v14 < v8))
      {
        v15 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
        objc_msgSend(v15, "setAllowPlaceholder:", 1);
        objc_msgSend(v15, "setNetworkAccessAllowed:", 1);
        -[PUVideoTileViewController _setDisplayingFullQualityImage:](self, "_setDisplayingFullQualityImage:", 0);
        -[PUVideoTileViewController setRequestedImageTargetSize:](self, "setRequestedImageTargetSize:", v6, v8);
        objc_initWeak(&location, self);
        v19 = 0;
        v20 = &v19;
        v21 = 0x2020000000;
        v22 = 1;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __41__PUVideoTileViewController__updateImage__block_invoke;
        v17[3] = &unk_1E58AADB8;
        objc_copyWeak(&v18, &location);
        v17[4] = &v19;
        v16 = objc_msgSend(v10, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v4, 1, v15, v17, v6, v8);
        *((_BYTE *)v20 + 24) = 0;
        -[PUVideoTileViewController _setCurrentImageRequestID:](self, "_setCurrentImageRequestID:", v16);
        objc_destroyWeak(&v18);
        _Block_object_dispose(&v19, 8);
        objc_destroyWeak(&location);

      }
    }
  }
  else
  {
    -[PUVideoTileViewController _setCurrentImageRequestID:](self, "_setCurrentImageRequestID:", 0);
    -[UIImageView setImage:](self->_placeholderImageView, "setImage:", 0);
    -[PXPixelBufferView enqueuePixelBuffer:](self->_pixelBufferView, "enqueuePixelBuffer:", 0);
  }

}

- (void)_handleImageResult:(id)a3 info:(id)a4 synchronous:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25[2];
  BOOL v26;
  id location[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5
    || (objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C68]),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "intValue"),
        v13 = -[PUVideoTileViewController _currentImageRequestID](self, "_currentImageRequestID"),
        v11,
        v12 == v13))
  {
    -[PUVideoTileViewController asset](self, "asset");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "mediaSubtypes");

    v16 = PXSupportsImageModulation();
    v17 = 0;
    v18 = (void *)MEMORY[0x1E0C809B0];
    if (v16 && v8 && (v15 & 0x100000) != 0)
    {
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "useHDRVideoThumbnails");

      if (v20)
      {
        v28 = 0;
        v29 = &v28;
        v30 = 0x2050000000;
        v21 = (void *)getPIHDRUtilitiesClass_softClass;
        v31 = getPIHDRUtilitiesClass_softClass;
        if (!getPIHDRUtilitiesClass_softClass)
        {
          location[0] = v18;
          location[1] = (id)3221225472;
          location[2] = __getPIHDRUtilitiesClass_block_invoke;
          location[3] = &unk_1E58AAEB0;
          location[4] = &v28;
          __getPIHDRUtilitiesClass_block_invoke((uint64_t)location);
          v21 = (void *)v29[3];
        }
        v22 = objc_retainAutorelease(v21);
        _Block_object_dispose(&v28, 8);
        v17 = (void *)objc_msgSend(v22, "newHLGPixelBufferFromSDRImage:", objc_msgSend(objc_retainAutorelease(v8), "CGImage"));
      }
      else
      {
        v17 = 0;
      }
    }
    objc_initWeak(location, self);
    objc_copyWeak(v25, location);
    v23 = v8;
    v25[1] = v17;
    v24 = v10;
    v26 = a5;
    px_dispatch_on_main_queue();
    if (v17)
      CFRelease(v17);

    objc_destroyWeak(v25);
    objc_destroyWeak(location);
  }

}

- (void)_setImageResult:(id)a3 pixelBuffer:(__CVBuffer *)a4 info:(id)a5 synchronous:(BOOL)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  char v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a5;
  if (v16)
  {
    -[UIImageView image](self->_placeholderImageView, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C60]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    if ((_DWORD)v12)
      v13 = v10 == 0;
    else
      v13 = 1;
    if (v13)
    {
      -[PUVideoTileViewController setCurrentImageIsPlaceholder:](self, "setCurrentImageIsPlaceholder:", v12);
      -[UIImageView setImage:](self->_placeholderImageView, "setImage:", v16);
      if (a4)
        v14 = v12;
      else
        v14 = 1;
      if ((v14 & 1) == 0)
        -[PXPixelBufferView enqueuePixelBuffer:](self->_pixelBufferView, "enqueuePixelBuffer:", a4);
    }
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUVideoTileViewController _setDisplayingFullQualityImage:](self, "_setDisplayingFullQualityImage:", objc_msgSend(v15, "BOOLValue") ^ 1);

  }
}

- (void)_updateVideo
{
  void *v3;
  id v4;

  -[PUVideoTileViewController browsingVideoPlayer](self, "browsingVideoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "videoSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (!-[PUVideoTileViewController canPlayVideo](self, "canPlayVideo"))
  {

    v4 = 0;
  }
  if (!-[PUTileController isAnimating](self, "isAnimating"))
    -[PUVideoTileViewController setVideoSession:](self, "setVideoSession:", v4);

}

- (void)setVideoSession:(id)a3
{
  PXVideoSession *v5;
  PXVideoSession *videoSession;
  BOOL v7;
  void *v8;
  PXVideoSession *v9;

  v5 = (PXVideoSession *)a3;
  videoSession = self->_videoSession;
  if (videoSession != v5)
  {
    v9 = v5;
    -[PXVideoSession unregisterChangeObserver:context:](videoSession, "unregisterChangeObserver:context:", self, VideoSessionContext);
    objc_storeStrong((id *)&self->_videoSession, a3);
    -[PXVideoSession registerChangeObserver:context:](v9, "registerChangeObserver:context:", self, VideoSessionContext);
    if (v9)
      v7 = -[PXVideoSession playState](v9, "playState") == 3;
    else
      v7 = 0;
    self->_hidePlaceholderImmediately = v7;
    -[PUVideoTileViewController videoView](self, "videoView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setVideoSession:", v9);

    -[PUVideoTileViewController setPlayerDidPlayToEnd:](self, "setPlayerDidPlayToEnd:", 0);
    -[PUVideoTileViewController _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
    v5 = v9;
  }

}

- (void)_setDisplayingFullQualityImage:(BOOL)a3
{
  if (self->__isDisplayingFullQualityImage != a3)
  {
    self->__isDisplayingFullQualityImage = a3;
    -[PUVideoTileViewController _updateReadyForDisplay](self, "_updateReadyForDisplay");
  }
}

- (BOOL)_isDisplayingVideo
{
  void *v2;
  char v3;

  -[PUVideoTileViewController videoView](self, "videoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "placeholderVisible") ^ 1;

  return v3;
}

- (void)_updatePlaceholderVisibility
{
  _BOOL4 v3;
  void *v4;
  int v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  _BOOL8 v15;
  void *v16;
  BOOL v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  uint64_t v21;
  id location[2];
  uint64_t v23;

  if (-[PUTileController isAnimating](self, "isAnimating"))
    return;
  v3 = -[PUVideoTileViewController playerIsSeeking](self, "playerIsSeeking");
  -[PUVideoTileViewController asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mediaSubtypes");

  if (v3)
  {
    -[PUVideoTileViewController videoView](self, "videoView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isVideoLayerReadyForDisplay");

    if ((v7 & 1) != 0)
      goto LABEL_14;
  }
  -[PUVideoTileViewController videoView](self, "videoView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isVideoLayerReadyForDisplay") & 1) == 0 && !self->_hidePlaceholderImmediately)
  {

    goto LABEL_11;
  }
  -[PUVideoTileViewController videoSession](self, "videoSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playerItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_11:
    v13 = 1;
    goto LABEL_15;
  }
  if (!self->_hidePlaceholderImmediately)
  {
    location[0] = 0;
    location[1] = 0;
    v23 = 0;
    -[PUVideoTileViewController assetKeyFrameSourceTime](self, "assetKeyFrameSourceTime");
    v20 = 0uLL;
    v21 = 0;
    -[PUVideoTileViewController browsingVideoPlayer](self, "browsingVideoPlayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "currentTime");
    }
    else
    {
      v20 = 0uLL;
      v21 = 0;
    }

  }
LABEL_14:
  v13 = 0;
LABEL_15:
  v14 = 0.0;
  if ((v5 & 0x100000) != 0 && !-[PUTileController shouldSuppressAnimatedUpdates](self, "shouldSuppressAnimatedUpdates"))
  {
    -[UIView window](self->_view, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v16 == 0;
    v15 = v16 != 0;
    if (v17)
      v14 = 0.0;
    else
      v14 = 0.2;
  }
  else
  {
    v15 = 0;
  }
  objc_initWeak(location, self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __57__PUVideoTileViewController__updatePlaceholderVisibility__block_invoke;
  v18[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v19, location);
  -[PUVideoTileViewController setPlaceholderVisible:animated:animationDuration:completion:](self, "setPlaceholderVisible:animated:animationDuration:completion:", v13, v15, v18, v14);
  objc_destroyWeak(&v19);
  objc_destroyWeak(location);
}

- (void)setPlayerIsSeeking:(BOOL)a3
{
  if (self->_playerIsSeeking != a3)
  {
    self->_playerIsSeeking = a3;
    -[PUVideoTileViewController _updatePlaceholderVisibility](self, "_updatePlaceholderVisibility");
  }
}

- (void)setPlayerDidPlayToEnd:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;

  if (self->_playerDidPlayToEnd != a3)
  {
    self->_playerDidPlayToEnd = a3;
    if (a3)
    {
      -[PUVideoTileViewController browsingVideoPlayer](self, "browsingVideoPlayer");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isActivated"))
      {

      }
      else
      {
        -[PUVideoTileViewController browsingVideoPlayer](self, "browsingVideoPlayer");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "loopingEnabledForAllVideos");

        if ((v5 & 1) == 0)
        {
          -[PUVideoTileViewController videoView](self, "videoView");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 1);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addSubview:", v7);
          -[PUVideoTileViewController browsingVideoPlayer](self, "browsingVideoPlayer");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __51__PUVideoTileViewController_setPlayerDidPlayToEnd___block_invoke;
          v14[3] = &unk_1E58AAE08;
          v15 = v6;
          v16 = v7;
          v12 = *MEMORY[0x1E0CA2E68];
          v13 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
          v9 = v7;
          v10 = v6;
          objc_msgSend(v8, "seekToTime:completionHandler:", &v12, v14);

        }
      }
    }
  }
}

- (void)_updateLiveEffectsRenderDebugIndicator
{
  void *v3;
  int v4;
  UIView *liveEffectRenderingDebugIndicator;
  UIView *v6;
  UIView *v7;
  UIView *v8;
  void *v9;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "videoShowLiveEffectsRenderingIndicator");

  liveEffectRenderingDebugIndicator = self->_liveEffectRenderingDebugIndicator;
  if (v4)
  {
    if (!liveEffectRenderingDebugIndicator)
    {
      v7 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", 0.0, 0.0, 90.0, 20.0);
      v8 = self->_liveEffectRenderingDebugIndicator;
      self->_liveEffectRenderingDebugIndicator = v7;

      -[UIView setText:](self->_liveEffectRenderingDebugIndicator, "setText:", CFSTR("Live Render"));
      objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_liveEffectRenderingDebugIndicator, "setBackgroundColor:", v9);

      -[UIView addSubview:](self->_view, "addSubview:", self->_liveEffectRenderingDebugIndicator);
      -[PUVideoTileViewController _updateLiveEffectsRenderDebugIndicatorVisibility](self, "_updateLiveEffectsRenderDebugIndicatorVisibility");
      -[PUVideoTileViewController _layoutLiveEffectsRenderDebugIndicator](self, "_layoutLiveEffectsRenderDebugIndicator");
    }
  }
  else
  {
    -[UIView removeFromSuperview](liveEffectRenderingDebugIndicator, "removeFromSuperview");
    v6 = self->_liveEffectRenderingDebugIndicator;
    self->_liveEffectRenderingDebugIndicator = 0;

  }
}

- (void)_layoutLiveEffectsRenderDebugIndicator
{
  UIView *liveEffectRenderingDebugIndicator;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double MaxX;
  double v14;
  void *v15;
  CGFloat v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  liveEffectRenderingDebugIndicator = self->_liveEffectRenderingDebugIndicator;
  if (liveEffectRenderingDebugIndicator)
  {
    -[UIView frame](liveEffectRenderingDebugIndicator, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[UIView superview](self->_liveEffectRenderingDebugIndicator, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    MaxX = CGRectGetMaxX(v17);
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    v14 = MaxX - CGRectGetWidth(v18) + -20.0;

    -[UIView superview](self->_liveEffectRenderingDebugIndicator, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v16 = CGRectGetMinY(v19) + 40.0;

    -[UIView setFrame:](self->_liveEffectRenderingDebugIndicator, "setFrame:", v14, v16, v9, v11);
  }
}

- (void)_updateLiveEffectsRenderDebugIndicatorVisibility
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  -[PUVideoTileViewController videoSession](self, "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "videoComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  -[UIView setHidden:](self->_liveEffectRenderingDebugIndicator, "setHidden:", v5);
}

- (id)readyForDisplayChangeHandler
{
  return self->_readyForDisplayChangeHandler;
}

- (void)setReadyForDisplayChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (void)setBrowsingViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_browsingViewModel, a3);
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (BOOL)canPlayVideo
{
  return self->_canPlayVideo;
}

- (BOOL)isOnSecondScreen
{
  return self->_isOnSecondScreen;
}

- (void)setIsOnSecondScreen:(BOOL)a3
{
  self->_isOnSecondScreen = a3;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (PXVideoSessionUIView)videoView
{
  return self->_videoView;
}

- (void)setVideoView:(id)a3
{
  objc_storeStrong((id *)&self->_videoView, a3);
}

- (int)_currentImageRequestID
{
  return self->__currentImageRequestID;
}

- (CGSize)_targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->__targetSize.width;
  height = self->__targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)requestedImageTargetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_requestedImageTargetSize.width;
  height = self->_requestedImageTargetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRequestedImageTargetSize:(CGSize)a3
{
  self->_requestedImageTargetSize = a3;
}

- (int64_t)_thumbnailRequestNumber
{
  return self->__thumbnailRequestNumber;
}

- (void)_setThumbnailRequestNumber:(int64_t)a3
{
  self->__thumbnailRequestNumber = a3;
}

- (BOOL)_isDisplayingFullQualityImage
{
  return self->__isDisplayingFullQualityImage;
}

- (id)_readyForDisplayCompletionHandler
{
  return self->__readyForDisplayCompletionHandler;
}

- (void)_setReadyForDisplayCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)playerIsSeeking
{
  return self->_playerIsSeeking;
}

- (BOOL)playerDidPlayToEnd
{
  return self->_playerDidPlayToEnd;
}

- (BOOL)placeholderVisible
{
  return self->_placeholderVisible;
}

- (void)setPlaceholderVisible:(BOOL)a3
{
  self->_placeholderVisible = a3;
}

- (BOOL)currentImageIsPlaceholder
{
  return self->_currentImageIsPlaceholder;
}

- (void)setCurrentImageIsPlaceholder:(BOOL)a3
{
  self->_currentImageIsPlaceholder = a3;
}

- (BOOL)placeholderIsAnimatingToHidden
{
  return self->_placeholderIsAnimatingToHidden;
}

- (BOOL)placeholderHiddenBehindVideoView
{
  return self->_placeholderHiddenBehindVideoView;
}

- (UIView)borderView
{
  return self->_borderView;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)assetKeyFrameSourceTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[14];
  return self;
}

- (void)setAssetKeyFrameSourceTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_assetKeyFrameSourceTime.value = *(_OWORD *)&a3->var0;
  self->_assetKeyFrameSourceTime.epoch = var3;
}

- (PUBrowsingVideoPlayer)browsingVideoPlayer
{
  return self->_browsingVideoPlayer;
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_browsingVideoPlayer, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong(&self->__readyForDisplayCompletionHandler, 0);
  objc_storeStrong((id *)&self->_videoView, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
  objc_storeStrong(&self->_readyForDisplayChangeHandler, 0);
  objc_storeStrong((id *)&self->_liveEffectRenderingDebugIndicator, 0);
  objc_storeStrong((id *)&self->_pixelBufferView, 0);
  objc_storeStrong((id *)&self->_preloadedImage, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

void __51__PUVideoTileViewController_setPlayerDidPlayToEnd___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "generateSnapshotImage");
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  px_dispatch_on_main_queue();

}

void __51__PUVideoTileViewController_setPlayerDidPlayToEnd___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = (void *)MEMORY[0x1E0DC3F10];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PUVideoTileViewController_setPlayerDidPlayToEnd___block_invoke_3;
  v3[3] = &unk_1E58ABD10;
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v1, "transitionWithView:duration:options:animations:completion:", v2, 5242880, v3, 0, 0.5);

}

uint64_t __51__PUVideoTileViewController_setPlayerDidPlayToEnd___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

void __57__PUVideoTileViewController__updatePlaceholderVisibility__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_callReadyToDisplayChangeHandler");

}

void __65__PUVideoTileViewController__handleImageResult_info_synchronous___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setImageResult:pixelBuffer:info:synchronous:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64));

}

void __41__PUVideoTileViewController__updateImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleImageResult:info:synchronous:", v7, v6, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

}

uint64_t __89__PUVideoTileViewController_setPlaceholderVisible_animated_animationDuration_completion___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setAlpha:", (double)*(unint64_t *)&a2);
}

uint64_t __89__PUVideoTileViewController_setPlaceholderVisible_animated_animationDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setPlaceholderIsAnimatingToHidden:", 0);
  if (!*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "setPlaceholderHiddenBehindVideoView:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __51__PUVideoTileViewController__fetchKeyTimeForAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v2 == v3;

}

void __51__PUVideoTileViewController__fetchKeyTimeForAsset___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  objc_msgSend(WeakRetained, "_handleKeyFrameSourceTime:forAsset:", &v4, v3);

}

void __39__PUVideoTileViewController__setAsset___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fetchKeyTimeForAsset:", *(_QWORD *)(a1 + 32));

}

void __58__PUVideoTileViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  if ((*(_BYTE *)(a1 + 41) & 2) != 0 && (objc_msgSend(*(id *)(a1 + 32), "playerIsSeeking") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "videoSession");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "isAtEnd");

    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "setPlayerDidPlayToEnd:", 1);
  }
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updatePlaceholderVisibility");
    objc_msgSend(*(id *)(a1 + 32), "_updateLiveEffectsRenderDebugIndicatorVisibility");
  }
}

void __56__PUVideoTileViewController_generateAssetTransitionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAsset:", v4);

  objc_msgSend(v3, "setImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setSnapshotView:", *(_QWORD *)(a1 + 48));
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    objc_msgSend(v5, "currentTime");
    v6 = v8;
    v7 = v9;
    objc_msgSend(v3, "setSeekTime:", &v6);
  }

}

void __45__PUVideoTileViewController_applyLayoutInfo___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "assetViewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMainImageContentsRect:", v1, v2, v3, v4);

}

+ (id)keyFrameTimeLoadingQueue
{
  if (keyFrameTimeLoadingQueue_onceToken != -1)
    dispatch_once(&keyFrameTimeLoadingQueue_onceToken, &__block_literal_global_102381);
  return (id)keyFrameTimeLoadingQueue_queue;
}

void __53__PUVideoTileViewController_keyFrameTimeLoadingQueue__block_invoke()
{
  uint64_t v0;
  void *v1;

  px_dispatch_queue_create_serial();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyFrameTimeLoadingQueue_queue;
  keyFrameTimeLoadingQueue_queue = v0;

}

@end
