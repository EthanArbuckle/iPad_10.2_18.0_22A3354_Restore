@implementation PBUIIrisWallpaperView

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_playerView);
  objc_msgSend(WeakRetained, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)PBUIIrisWallpaperView;
  -[PBUIWallpaperView dealloc](&v4, sel_dealloc);
}

- (int64_t)wallpaperType
{
  return 3;
}

- (void)switchToIrisMode:(int64_t)a3
{
  -[PBUIIrisWallpaperView _setupContentViewForMode:](self, "_setupContentViewForMode:");
  self->_currentMode = a3;
  -[PBUIIrisWallpaperView _populateContentView](self, "_populateContentView");
}

- (int64_t)irisPlaybackState
{
  return self->_playbackState;
}

- (BOOL)isIrisInteracting
{
  return self->_isInteracting;
}

- (UIGestureRecognizer)irisGestureRecognizer
{
  return self->_playerGestureRecognizer;
}

- (void)beginSimulatedTouchWithReason:(id)a3
{
  id v4;
  NSMutableSet *simulatedTouchReasons;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id WeakRetained;
  void *v9;
  id v10;

  v4 = a3;
  simulatedTouchReasons = self->_simulatedTouchReasons;
  v10 = v4;
  if (!simulatedTouchReasons)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_simulatedTouchReasons;
    self->_simulatedTouchReasons = v6;

    v4 = v10;
    simulatedTouchReasons = self->_simulatedTouchReasons;
  }
  -[NSMutableSet addObject:](simulatedTouchReasons, "addObject:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_playerView);
  -[PBUIIrisWallpaperView _playbackReasonForSimulatedTouchReason:](self, "_playbackReasonForSimulatedTouchReason:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "startPlaybackWithReason:", v9);

}

- (void)endSimulatedTouchWithReason:(id)a3
{
  NSMutableSet *simulatedTouchReasons;
  id v5;
  void *v6;
  id WeakRetained;

  simulatedTouchReasons = self->_simulatedTouchReasons;
  v5 = a3;
  -[NSMutableSet removeObject:](simulatedTouchReasons, "removeObject:", v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_playerView);
  -[PBUIIrisWallpaperView _playbackReasonForSimulatedTouchReason:](self, "_playbackReasonForSimulatedTouchReason:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "stopPlaybackWithReason:", v6);
}

- (id)_playbackReasonForSimulatedTouchReason:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Simulated touch with reason \"%@\"), a3);
}

- (void)_setupContentViewWithOptions:(unint64_t)a3
{
  -[PBUIIrisWallpaperView _setupContentViewForMode:](self, "_setupContentViewForMode:", self->_currentMode);
}

- (void)_setPlayerGestureRecognizer:(id)a3
{
  id v5;
  UIGestureRecognizer *v6;
  void *v7;
  id v8;

  v5 = a3;
  if (self->_playerState == 2)
  {
    v8 = v5;
    v6 = self->_playerGestureRecognizer;
    objc_storeStrong((id *)&self->_playerGestureRecognizer, a3);
    if (v6 != self->_playerGestureRecognizer)
    {
      -[PBUIIrisWallpaperView irisDelegate](self, "irisDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "irisWallpaperPlayer:didReplaceGestureRecognizer:withGestureRecognizer:", self, v6, self->_playerGestureRecognizer);

    }
    v5 = v8;
  }

}

- (void)_resetPrewiredAVPlayer
{
  ISAVPlayer *prewiredAVPlayer;
  void *v4;
  void *v5;
  ISAVPlayer *v6;
  ISAVPlayer *v7;
  id v9;

  prewiredAVPlayer = self->_prewiredAVPlayer;
  self->_prewiredAVPlayer = 0;

  objc_msgSend(MEMORY[0x1E0D01760], "serial");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceClass:", 25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)BSDispatchQueueCreate();

  v6 = (ISAVPlayer *)objc_msgSend(objc_alloc(getISAVPlayerClass()), "initWithDispatchQueue:", v9);
  v7 = self->_prewiredAVPlayer;
  self->_prewiredAVPlayer = v6;

  if (*MEMORY[0x1E0C9D820] != self->_prewiredSize.width
    || *(double *)(MEMORY[0x1E0C9D820] + 8) != self->_prewiredSize.height)
  {
    -[ISAVPlayer setDimensionsOfReservedVideoMemory:](self->_prewiredAVPlayer, "setDimensionsOfReservedVideoMemory:");
  }

}

- (BOOL)_setupContentViewForMode:(int64_t)a3
{
  void *v6;
  id WeakRetained;
  NSObject *v9;
  NSObject *v10;
  id v11;
  double v12;
  double v13;
  PBUIStaticWallpaperImageView *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  ISAVPlayer *prewiredAVPlayer;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSMutableSet *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  _QWORD block[5];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (self->_currentMode == a3)
  {
    -[PBUIWallpaperView contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      return 0;
  }
  -[PBUIIrisWallpaperView _setPlayerGestureRecognizer:](self, "_setPlayerGestureRecognizer:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_playerView);
  objc_msgSend(WeakRetained, "setDelegate:", 0);
  objc_msgSend(WeakRetained, "removeFromSuperview");
  objc_storeWeak((id *)&self->_playerView, 0);
  self->_playerState = 0;
  if (a3)
  {
    -[ISAVPlayer dispatchQueue](self->_prewiredAVPlayer, "dispatchQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      v10 = MEMORY[0x1E0C80D38];
      v11 = MEMORY[0x1E0C80D38];
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PBUIIrisWallpaperView__setupContentViewForMode___block_invoke;
    block[3] = &unk_1E6B94728;
    block[4] = self;
    dispatch_sync(v10, block);
    if (!v9)

    -[PBUIIrisWallpaperView playerViewPlaybackStateDidChange:](self, "playerViewPlaybackStateDidChange:", 0);
    -[PBUIIrisWallpaperView playerViewIsInteractingDidChange:](self, "playerViewIsInteractingDidChange:", 0);
    -[PBUIStaticWallpaperView _imageSize](self, "_imageSize");
    v14 = -[PBUIStaticWallpaperImageView initWithFrame:]([PBUIStaticWallpaperImageView alloc], "initWithFrame:", 0.0, 0.0, v12, v13);
    objc_storeWeak((id *)&self->_imageView, v14);
    -[PBUIStaticWallpaperImageView setContentMode:](v14, "setContentMode:", 1);
    -[PBUIStaticWallpaperView _setUpStaticImageContentView:](self, "_setUpStaticImageContentView:", v14);
    -[PBUIWallpaperView setContentView:](self, "setContentView:", v14);

  }
  else
  {
    v15 = objc_loadWeakRetained((id *)&self->_imageView);
    objc_msgSend(v15, "removeFromSuperview");

    objc_storeWeak((id *)&self->_imageView, 0);
    -[PBUIStaticWallpaperView _imageSize](self, "_imageSize");
    v17 = v16;
    v19 = v18;
    prewiredAVPlayer = self->_prewiredAVPlayer;
    if (prewiredAVPlayer)
    {
      if (-[ISAVPlayer status](prewiredAVPlayer, "status") == 2)
      {
        -[ISAVPlayer error](self->_prewiredAVPlayer, "error");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "domain");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0C8A2F8]))
        {
          v23 = objc_msgSend(v21, "code");

          if (v23 == -11819)
            -[PBUIIrisWallpaperView _resetPrewiredAVPlayer](self, "_resetPrewiredAVPlayer");
        }
        else
        {

        }
      }
    }
    else
    {
      -[PBUIIrisWallpaperView _resetPrewiredAVPlayer](self, "_resetPrewiredAVPlayer");
    }
    v24 = objc_loadWeakRetained((id *)&self->_playerView);

    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIIrisWallpaperView.m"), 177, CFSTR("about to stomp on a previous playerView"));

    }
    +[PBUILivePhotoPlayerView playerViewWithRewindPlaybackStyle:](PBUILivePhotoPlayerView, "playerViewWithRewindPlaybackStyle:", self->_useRewindPlaybackStyle);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_playerView, v25);
    objc_msgSend(v25, "setFrame:", 0.0, 0.0, v17, v19);
    objc_msgSend(v25, "setDelegate:", self);
    -[PBUIIrisWallpaperView playerViewPlaybackStateDidChange:](self, "playerViewPlaybackStateDidChange:", v25);
    -[PBUIIrisWallpaperView playerViewIsInteractingDidChange:](self, "playerViewIsInteractingDidChange:", v25);
    -[PBUIWallpaperView setContentView:](self, "setContentView:", v25);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = self->_simulatedTouchReasons;
    v27 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(v25, "startPlaybackWithReason:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
        }
        v28 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v28);
    }

    WeakRetained = v24;
  }

  return 1;
}

uint64_t __50__PBUIIrisWallpaperView__setupContentViewForMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 720), "replaceCurrentItemWithPlayerItem:", 0);
}

- (void)_populateContentView
{
  __assert_rtn("-[PBUIIrisWallpaperView _populateContentView]", "PBUIIrisWallpaperView.m", 239, "imageView");
}

- (void)playerViewPlaybackStateDidChange:(id)a3
{
  id v4;
  id WeakRetained;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playerView);

  if (WeakRetained == v4)
  {
    v6 = PBUIIrisWallpaperPlaybackStateForISPlaybackState(objc_msgSend(v4, "playbackState"));
    PBUILogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      PBUIIrisWallpaperPlaybackStateDescription(self->_playbackState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PBUIIrisWallpaperPlaybackStateDescription(v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_1B71C0000, v7, OS_LOG_TYPE_DEFAULT, "Iris wallpaper playback state changed. Current State: %@, New State: %@", (uint8_t *)&v11, 0x16u);

    }
    if (v6 != -1 && v6 != self->_playbackState)
    {
      self->_playbackState = v6;
      -[PBUIIrisWallpaperView irisDelegate](self, "irisDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v10, "irisWallpaperPlayerPlaybackStateDidChange:", self);

    }
  }

}

- (void)playerViewIsInteractingDidChange:(id)a3
{
  id WeakRetained;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_playerView);
  if (WeakRetained == v7)
  {
    v5 = objc_msgSend(v7, "isInteracting");
    if (self->_isInteracting != v5)
    {
      self->_isInteracting = v5;
      -[PBUIIrisWallpaperView irisDelegate](self, "irisDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "irisWallpaperPlayerIsInteractingDidChange:", self);

    }
  }

}

- (id)videoPlayerForPlayerView:(id)a3
{
  -[PBUIIrisWallpaperView _resetPrewiredAVPlayer](self, "_resetPrewiredAVPlayer", a3);
  return self->_prewiredAVPlayer;
}

- (PBUIIrisWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  PBUIIrisWallpaperView *v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  NSURL *videoFileURL;
  void *v33;
  double v34;
  objc_super v36;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  objc_msgSend(v17, "videoURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a8 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = v18;
    v24 = v20;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "naturalSize");
    self->_prewiredSize.width = v26;
    self->_prewiredSize.height = v27;

    v20 = v24;
    v18 = v23;

  }
  self->_useRewindPlaybackStyle = (a8 & 0x10) != 0;
  v36.receiver = self;
  v36.super_class = (Class)PBUIIrisWallpaperView;
  v28 = -[PBUIStaticWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v36, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, v17, a5, v18, v19, a8 | ((a8 & 0x10) >> 2), x, y, width, height);
  if (v28)
  {
    v29 = (a8 & 0x10) >> 4;
    objc_msgSend(v17, "videoURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    videoFileURL = v28->_videoFileURL;
    v28->_videoFileURL = (NSURL *)v31;

    objc_msgSend(v17, "wallpaperOptions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stillTimeInVideo");
    v28->_stillTimeInVideo = v34;

    v28->_useRewindPlaybackStyle = v29;
    -[PBUIIrisWallpaperView _populateContentView](v28, "_populateContentView");
  }

  return v28;
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

- (NSURL)videoFileURL
{
  return self->_videoFileURL;
}

- (int64_t)currentIrisMode
{
  return self->_currentMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedTouchReasons, 0);
  objc_storeStrong((id *)&self->_playerGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_playerView);
  objc_storeStrong((id *)&self->_prewiredAVPlayer, 0);
  objc_storeStrong((id *)&self->_videoFileURL, 0);
  objc_destroyWeak((id *)&self->_imageView);
  objc_destroyWeak((id *)&self->_irisDelegate);
}

@end
