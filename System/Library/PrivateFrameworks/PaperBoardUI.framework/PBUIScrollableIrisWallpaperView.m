@implementation PBUIScrollableIrisWallpaperView

- (PBUIScrollableIrisWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 wallpaperVideo:(id)a5 variant:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  PBUIScrollableIrisWallpaperView *v15;
  PBUIScrollableIrisWallpaperView *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  PBUILivePhotoPlayerView *playerView;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a4;
  v14 = a5;
  v27.receiver = self;
  v27.super_class = (Class)PBUIScrollableIrisWallpaperView;
  v15 = -[PBUIScrollableStaticWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v27, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, v13, a6, 0, 0, 0, x, y, width, height);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_video, a5);
    -[PBUILivePhotoPlayerView setContentMode:](v16->_playerView, "setContentMode:", 1);
    objc_msgSend(v13, "wallpaperImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wallpaperOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stillTimeInVideo");
    v20 = v19;

    playerView = v16->_playerView;
    v22 = objc_retainAutorelease(v17);
    -[PBUILivePhotoPlayerView prepareWithPhoto:videoAsset:photoTime:photoEXIFOrientation:](playerView, "prepareWithPhoto:videoAsset:photoTime:photoEXIFOrientation:", objc_msgSend(v22, "CGImage"), v16->_video, objc_msgSend(v22, "pbui_EXIFOrientation"), v20);
    -[PBUILivePhotoPlayerView gestureRecognizer](v16->_playerView, "gestureRecognizer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDelegate:", v16);

    -[PBUIScrollableStaticWallpaperView _scrollView](v16, "_scrollView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBUILivePhotoPlayerView gestureRecognizer](v16->_playerView, "gestureRecognizer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addGestureRecognizer:", v25);

  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[PBUILivePhotoPlayerView setDelegate:](self->_playerView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PBUIScrollableIrisWallpaperView;
  -[PBUIScrollableStaticWallpaperView dealloc](&v3, sel_dealloc);
}

- (int64_t)irisPlaybackState
{
  return self->_playbackState;
}

- (BOOL)isIrisInteracting
{
  return -[PBUILivePhotoPlayerView isInteracting](self->_playerView, "isInteracting");
}

- (UIGestureRecognizer)irisGestureRecognizer
{
  return -[PBUILivePhotoPlayerView gestureRecognizer](self->_playerView, "gestureRecognizer");
}

- (id)_newImageView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  PBUILivePhotoPlayerView *v8;
  PBUILivePhotoPlayerView *playerView;

  -[PBUIStaticWallpaperView wallpaperImage](self, "wallpaperImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  +[PBUILivePhotoPlayerView playerViewWithRewindPlaybackStyle:](PBUILivePhotoPlayerView, "playerViewWithRewindPlaybackStyle:", 0);
  v8 = (PBUILivePhotoPlayerView *)objc_claimAutoreleasedReturnValue();
  playerView = self->_playerView;
  self->_playerView = v8;

  -[PBUILivePhotoPlayerView setFrame:](self->_playerView, "setFrame:", 0.0, 0.0, v5, v7);
  -[PBUILivePhotoPlayerView setDelegate:](self->_playerView, "setDelegate:", self);
  -[PBUIScrollableIrisWallpaperView playerViewPlaybackStateDidChange:](self, "playerViewPlaybackStateDidChange:", self->_playerView);
  return self->_playerView;
}

- (NSURL)videoFileURL
{
  void *v3;
  void *v4;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AVAsset URL](self->_video, "URL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSURL *)v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;

  v5 = a4;
  -[PBUIScrollableStaticWallpaperView _scrollView](self, "_scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "panGestureRecognizer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v5)
  {
    v10 = 1;
  }
  else
  {
    -[PBUIScrollableStaticWallpaperView _scrollView](self, "_scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pinchGestureRecognizer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v9 == v5;

  }
  return v10;
}

- (void)playerViewPlaybackStateDidChange:(id)a3
{
  unint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_playerView == a3)
  {
    v4 = PBUIIrisWallpaperPlaybackStateForISPlaybackState(objc_msgSend(a3, "playbackState"));
    PBUILogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      PBUIIrisWallpaperPlaybackStateDescription(self->_playbackState);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PBUIIrisWallpaperPlaybackStateDescription(v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1B71C0000, v5, OS_LOG_TYPE_DEFAULT, "Scrollable Iris wallpaper playback state changed. Current State: %@, New State: %@", (uint8_t *)&v9, 0x16u);

    }
    if (v4 != -1 && v4 != self->_playbackState)
    {
      self->_playbackState = v4;
      -[PBUIScrollableIrisWallpaperView irisDelegate](self, "irisDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "irisWallpaperPlayerPlaybackStateDidChange:", self);

    }
  }
}

- (void)playerViewIsInteractingDidChange:(id)a3
{
  id v4;

  if (self->_playerView == a3)
  {
    -[PBUIScrollableIrisWallpaperView irisDelegate](self, "irisDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "irisWallpaperPlayerIsInteractingDidChange:", self);

  }
}

- (PBUIIrisWallpaperPlayerDelegate)irisDelegate
{
  return (PBUIIrisWallpaperPlayerDelegate *)objc_loadWeakRetained((id *)&self->_irisDelegate);
}

- (void)setIrisDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_irisDelegate, a3);
}

- (double)stillTimeInVideo
{
  return self->_stillTimeInVideo;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_irisDelegate);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_video, 0);
}

@end
