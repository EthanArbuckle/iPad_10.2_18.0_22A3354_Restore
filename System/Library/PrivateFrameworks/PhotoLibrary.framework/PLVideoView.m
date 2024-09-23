@implementation PLVideoView

- (PLVideoView)initWithFrame:(CGRect)a3 videoCameraImage:(id)a4 orientation:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((objc_msgSend(a4, "isVideo") & 1) != 0
    || (objc_msgSend(a4, "isStreamedVideo") & 1) != 0
    || (objc_msgSend(a4, "isAudio") & 1) != 0)
  {
    return (PLVideoView *)-[PLVideoView _initWithFrame:videoCameraImage:orientation:](self, "_initWithFrame:videoCameraImage:orientation:", a4, a5, x, y, width, height);
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("videoCameraImage must be either video or audio"));
  return 0;
}

- (id)_initWithFrame:(CGRect)a3 videoCameraImage:(id)a4 orientation:(int64_t)a5
{
  PLVideoView *v7;
  PLVideoView *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  PLVideoPosterFrameView *v13;
  void *v14;
  void **v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PLVideoView;
  v7 = -[PLVideoView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7)
  {
    v7->_useLandscapeCache = (unint64_t)(a5 - 3) < 2;
    v7->_videoCameraImage = (PLManagedAsset *)a4;
    v8->_summaryThumbnailRequestTimestamps = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8->_detailThumbnailRequestTimestamps = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8->_scrubberWidth = 0.0;
    *((_BYTE *)v8 + 657) |= 0x10u;
    v8->_scaleMode = 1;
    *((_BYTE *)v8 + 657) = *((_BYTE *)v8 + 657) & 0xFE | -[PLVideoView _canAccessVideo](v8, "_canAccessVideo");
    *((_BYTE *)v8 + 657) &= ~2u;
    if (-[PLManagedAsset isStreamedVideo](v8->_videoCameraImage, "isStreamedVideo"))
      v8->_pathToOriginalVideo = (NSString *)(id)-[PLManagedAsset pathToOriginalVideoFile](v8->_videoCameraImage, "pathToOriginalVideoFile");
    -[PLVideoView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    -[PLVideoView bounds](v8, "bounds");
    v13 = -[PLVideoPosterFrameView initWithFrame:]([PLVideoPosterFrameView alloc], "initWithFrame:", v9, v10, v11, v12);
    v8->_posterFrameView = v13;
    -[PLVideoPosterFrameView setScaleMode:](v13, "setScaleMode:", v8->_scaleMode);
    -[PLVideoPosterFrameView setAutoresizingMask:](v8->_posterFrameView, "setAutoresizingMask:", 18);
    -[PLVideoView addSubview:](v8, "addSubview:", v8->_posterFrameView);
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel__screenDidConnect_, *MEMORY[0x1E0CEBB88], 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel__screenDidDisconnect_, *MEMORY[0x1E0CEBB90], 0);
    v15 = (void **)MEMORY[0x1E0CEB258];
    NSClassFromString(CFSTR("PLPhotosApplication"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = *v15;
    else
      v16 = 0;
    objc_msgSend(v16, "enableNetworkObservation");
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel__networkReachabilityDidChange_, *MEMORY[0x1E0D71FE0], 0);
    v8->_thumbnailReqQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobileslideshow.videoThumbnails", 0);
    v8->_prepareMoviePlayerForScrubberAutomatically = 1;
  }
  return v8;
}

- (void)_networkReachabilityDidChange:(id)a3
{
  PLManagedAsset *videoCameraImage;
  NSObject *Log;
  uint8_t v6[16];

  videoCameraImage = self->_videoCameraImage;
  if (videoCameraImage
    && -[PLManagedAsset cachedNonPersistedVideoPlaybackURL](videoCameraImage, "cachedNonPersistedVideoPlaybackURL", a3))
  {
    Log = PLPhotoSharingGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) network reachability changes. Clears out cached video URL.", v6, 2u);
    }
    -[PLManagedAsset setCachedNonPersistedVideoPlaybackURL:](self->_videoCameraImage, "setCachedNonPersistedVideoPlaybackURL:", 0);
    -[PLManagedAsset setCachedNonPersistedVideoPlaybackURLExpiration:](self->_videoCameraImage, "setCachedNonPersistedVideoPlaybackURLExpiration:", 0);
    -[PLManagedAsset setCachedNonPersistedVideoPlaybackURLError:](self->_videoCameraImage, "setCachedNonPersistedVideoPlaybackURLError:", 0);
  }
}

- (void)dealloc
{
  void **v3;
  void *v4;
  NSObject *thumbnailReqQueue;
  objc_super v6;

  v3 = (void **)MEMORY[0x1E0CEB258];
  NSClassFromString(CFSTR("PLPhotosApplication"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = *v3;
  else
    v4 = 0;
  objc_msgSend(v4, "disableNetworkObservation");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  -[PLVideoView _commitPendingAdjustmentsUpdateAndWait:completionHandler:](self, "_commitPendingAdjustmentsUpdateAndWait:completionHandler:", 0, 0);

  -[PLVideoView setImageTile:](self, "setImageTile:", 0);
  -[PLVideoView _tearDownMoviePlayer](self, "_tearDownMoviePlayer");

  -[PLVideoOverlayButton removeFromSuperview](self->_videoOverlayPlayButton, "removeFromSuperview");
  +[PLVideoView _enqueueOverlayPlayButton:](PLVideoView, "_enqueueOverlayPlayButton:", self->_videoOverlayPlayButton);

  self->_videoOverlayPlayButton = 0;
  -[UIMovieScrubber setDelegate:](self->_scrubber, "setDelegate:", 0);
  -[UIMovieScrubber setDataSource:](self->_scrubber, "setDataSource:", 0);

  -[PLSlalomRegionEditor setDelegate:](self->_slalomRegionEditor, "setDelegate:", 0);
  thumbnailReqQueue = self->_thumbnailReqQueue;
  if (thumbnailReqQueue)
    dispatch_release(thumbnailReqQueue);
  -[PLVideoView _clearImageGenerators](self, "_clearImageGenerators");

  -[PLVideoView _cancelAirplayExportSession](self, "_cancelAirplayExportSession");
  v6.receiver = self;
  v6.super_class = (Class)PLVideoView;
  -[PLVideoView dealloc](&v6, sel_dealloc);
}

- (void)_setupMoviePlayerIfNecessary
{
  PLMoviePlayerController *v3;

  if (!self->_moviePlayer)
  {
    v3 = objc_alloc_init(PLMoviePlayerController);
    self->_moviePlayer = v3;
    -[PLMoviePlayerController setDelegate:](v3, "setDelegate:", self);
    -[PLMoviePlayerController requestToBecomeActiveController](self->_moviePlayer, "requestToBecomeActiveController");
    self->__didInsertMoviePlayerView = 0;
    self->_isAirPlay = -[PLVideoView _playerIsAirplay](self, "_playerIsAirplay");
  }
}

- (void)_insertMoviePlayerViewIfNecessary
{
  PLMoviePlayerView *v3;

  -[PLVideoView _setupMoviePlayerIfNecessary](self, "_setupMoviePlayerIfNecessary");
  if (!-[PLVideoView _didInsertMoviePlayerView](self, "_didInsertMoviePlayerView"))
  {
    v3 = -[PLMoviePlayerController view](self->_moviePlayer, "view");
    -[PLVideoView bounds](self, "bounds");
    -[PLMoviePlayerView setFrame:](v3, "setFrame:");
    -[PLMoviePlayerView setAutoresizingMask:](v3, "setAutoresizingMask:", 18);
    -[PLVideoView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v3, self->_posterFrameView);
    self->__didInsertMoviePlayerView = 1;
  }
}

- (void)_tearDownMoviePlayer
{
  -[PLMoviePlayerController setDelegate:](self->_moviePlayer, "setDelegate:", 0);
  -[PLMoviePlayerController requestToResignAsActiveController](self->_moviePlayer, "requestToResignAsActiveController");
  if ((*((_BYTE *)self + 658) & 4) != 0)
    -[PLMoviePlayerController stop](self->_moviePlayer, "stop");
  -[PLMoviePlayerView removeFromSuperview](-[PLMoviePlayerController view](self->_moviePlayer, "view"), "removeFromSuperview");

  self->_moviePlayer = 0;
}

- (PLVideoViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  char v4;
  UIMovieScrubber *scrubber;

  if (self->_delegate != a3)
  {
    self->_delegate = (PLVideoViewDelegate *)a3;
    if (a3)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if (-[PLVideoViewDelegate videoViewCanCreateMetadata:](self->_delegate, "videoViewCanCreateMetadata:", self))v4 = 16;
        else
          v4 = 0;
      }
      else
      {
        v4 = 0;
      }
      *((_BYTE *)self + 660) = *((_BYTE *)self + 660) & 0xEF | v4;
      scrubber = self->_scrubber;
      a3 = self;
    }
    else
    {
      scrubber = self->_scrubber;
    }
    -[UIMovieScrubber setDelegate:](scrubber, "setDelegate:", a3);
  }
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLVideoView;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ path:%@>"), -[PLVideoView description](&v3, sel_description), -[PLVideoView pathForVideoFile](self, "pathForVideoFile"));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLVideoView;
  -[PLVideoView touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[PLVideoView _hideTrimMessageView:](self, "_hideTrimMessageView:", 1);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  uint64_t v8;
  UIView *scrubberBackgroundView;
  BOOL v10;
  UIMovieScrubber *scrubber;
  id result;
  PLSlalomRegionEditor *slalomRegionEditor;
  PLVideoOverlayButton *videoOverlayPlayButton;

  y = a3.y;
  x = a3.x;
  v8 = -[UIMovieScrubber superview](self->_scrubber, "superview");
  scrubberBackgroundView = self->_scrubberBackgroundView;
  v10 = (UIView *)v8 != scrubberBackgroundView || scrubberBackgroundView == 0;
  if (v10
    || (scrubber = self->_scrubber,
        -[UIMovieScrubber convertPoint:fromView:](scrubber, "convertPoint:fromView:", self, x, y),
        result = (id)-[UIMovieScrubber hitTest:withEvent:](scrubber, "hitTest:withEvent:", a4),
        !result
     && ((slalomRegionEditor = self->_slalomRegionEditor) == 0
      || (-[PLSlalomRegionEditor convertPoint:fromView:](self->_slalomRegionEditor, "convertPoint:fromView:", self, x, y), (result = (id)-[PLSlalomRegionEditor hitTest:withEvent:](slalomRegionEditor, "hitTest:withEvent:", a4)) == 0))))
  {
    if (-[PLVideoView pointInside:withEvent:](self, "pointInside:withEvent:", a4, x, y))
    {
      if ((*((_BYTE *)self + 659) & 0x40) != 0)
      {
        videoOverlayPlayButton = self->_videoOverlayPlayButton;
        -[PLVideoOverlayButton convertPoint:fromView:](videoOverlayPlayButton, "convertPoint:fromView:", -[PLVideoOverlayButton superview](videoOverlayPlayButton, "superview"), x, y);
        result = (id)-[PLVideoOverlayButton hitTest:withEvent:](videoOverlayPlayButton, "hitTest:withEvent:", a4);
      }
      else
      {
        result = 0;
      }
      if (!result)
        return self;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)_updateScrubberFrame
{
  UIView *scrubberBackgroundView;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  float v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  scrubberBackgroundView = self->_scrubberBackgroundView;
  if (scrubberBackgroundView && (PLVideoView *)-[UIView superview](scrubberBackgroundView, "superview") == self)
  {
    v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarOrientation");
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PLVideoViewDelegate videoViewScrubberYOrigin:forOrientation:](self->_delegate, "videoViewScrubberYOrigin:forOrientation:", self, v4);
      v6 = v5;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "statusBarHeightForOrientation:ignoreHidden:", v4, 1);
      v8 = v7;
      objc_msgSend(MEMORY[0x1E0CEA7A8], "defaultSizeForOrientation:", v4);
      v10 = v9;
      v6 = (float)(v8 + v10);
    }
    -[UIView frame](self->_scrubberBackgroundView, "frame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[PLVideoView _scrubberBackgroundHeight](self, "_scrubberBackgroundHeight");
    -[UIView setFrame:](self->_scrubberBackgroundView, "setFrame:", v12, v14, v16, v6 + v17);
    -[UIMovieScrubber frame](self->_scrubber, "frame");
    -[UIMovieScrubber setFrame:](self->_scrubber, "setFrame:");
  }
}

- (double)scrubberWidth
{
  double result;
  CGRect v4;

  result = self->_scrubberWidth;
  if (result == 0.0)
  {
    -[PLVideoView bounds](self, "bounds");
    result = CGRectGetWidth(v4);
    self->_scrubberWidth = result;
  }
  return result;
}

- (double)_scrubberBackgroundHeight
{
  _BOOL4 v2;
  double result;

  v2 = -[PLVideoView _shouldShowSlalomEditor](self, "_shouldShowSlalomEditor");
  result = 42.0;
  if (v2)
    return 72.0;
  return result;
}

- (void)_createScrubberIfNeeded
{
  _BOOL4 v3;
  _BOOL8 v4;
  UIMovieScrubber *scrubber;
  double Width;
  double v7;
  UIView *v8;
  double v9;
  UIMovieScrubber *v10;
  double v11;
  PLSlalomRegionEditor *v12;
  CGRect v13;
  CGRect v14;

  v3 = -[PLVideoView _shouldShowSlalomEditor](self, "_shouldShowSlalomEditor");
  v4 = -[PLVideoView canEdit](self, "canEdit");
  scrubber = self->_scrubber;
  if (scrubber
    && (self->__slalomRegionEditorCreatedForScrubber != v3
     || v4 != -[UIMovieScrubber isEditable](scrubber, "isEditable")))
  {
    -[PLVideoView _removeScrubber](self, "_removeScrubber");
  }
  if ((*((_BYTE *)self + 657) & 0x10) != 0 && !self->_scrubberBackgroundView)
  {
    -[PLVideoView bounds](self, "bounds");
    Width = CGRectGetWidth(v13);
    -[PLVideoView _scrubberBackgroundHeight](self, "_scrubberBackgroundHeight");
    v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, Width, v7);
    self->_scrubberBackgroundView = v8;
    -[UIView setAutoresizingMask:](v8, "setAutoresizingMask:", 34);
    -[UIView setDeliversTouchesForGesturesToSuperview:](self->_scrubberBackgroundView, "setDeliversTouchesForGesturesToSuperview:", 0);
    -[UIView setBackgroundColor:](self->_scrubberBackgroundView, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.101960786, 0.75));
    -[PLVideoView addSubview:](self, "addSubview:", self->_scrubberBackgroundView);
  }
  -[PLVideoView scrubberWidth](self, "scrubberWidth");
  if (!self->_scrubber)
  {
    v10 = (UIMovieScrubber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA780]), "initWithFrame:", 0.0, 1.0, v9, 0.0);
    self->_scrubber = v10;
    -[UIMovieScrubber setEditable:](v10, "setEditable:", v4);
    v11 = 8.0;
    if (!v4)
      v11 = 0.0;
    -[UIMovieScrubber setEdgeInset:](self->_scrubber, "setEdgeInset:", v11);
    -[UIMovieScrubber setAutoresizingMask:](self->_scrubber, "setAutoresizingMask:", 2);
    -[UIMovieScrubber setZoomDelay:](self->_scrubber, "setZoomDelay:", 0.5);
    -[UIMovieScrubber setMinimumTrimLength:](self->_scrubber, "setMinimumTrimLength:", 1.0);
    -[UIView addSubview:](self->_scrubberBackgroundView, "addSubview:", self->_scrubber);
    *((_BYTE *)self + 660) |= 4u;
    -[UIMovieScrubber setDelegate:](self->_scrubber, "setDelegate:", self);
    -[UIMovieScrubber setDataSource:](self->_scrubber, "setDataSource:", self);
    if (self->_maximumTrimLength != 0.0)
      -[UIMovieScrubber setMaximumTrimLength:](self->_scrubber, "setMaximumTrimLength:");
    if ((*((_BYTE *)self + 658) & 8) != 0)
      -[UIMovieScrubber setEditing:animated:](self->_scrubber, "setEditing:animated:", 1, 1);
    if (!self->_slalomRegionEditor && v3)
    {
      -[UIMovieScrubber frame](self->_scrubber, "frame");
      v12 = -[PLSlalomRegionEditor initWithFrame:]([PLSlalomRegionEditor alloc], "initWithFrame:", v14.origin.x, CGRectGetMaxY(v14), v14.size.width, 30.0);
      self->_slalomRegionEditor = v12;
      -[PLSlalomRegionEditor setAutoresizingMask:](v12, "setAutoresizingMask:", 2);
      -[PLSlalomRegionEditor setDelegate:](self->_slalomRegionEditor, "setDelegate:", self);
      -[PLVideoView _updateSlalomRegionEditorRange](self, "_updateSlalomRegionEditorRange");
      -[PLVideoView _updateSlalomRegionEditorState](self, "_updateSlalomRegionEditorState");
      -[UIView addSubview:](self->_scrubberBackgroundView, "addSubview:", self->_slalomRegionEditor);
    }
    self->__slalomRegionEditorCreatedForScrubber = v3;
    -[PLVideoView _updateForEditing](self, "_updateForEditing");
  }
}

- (void)_removeScrubber
{
  -[UIView removeFromSuperview](self->_scrubberBackgroundView, "removeFromSuperview");

  self->_scrubberBackgroundView = 0;
  -[UIMovieScrubber setDataSource:](self->_scrubber, "setDataSource:", 0);
  -[UIMovieScrubber setDelegate:](self->_scrubber, "setDelegate:", 0);
  -[UIMovieScrubber removeFromSuperview](self->_scrubber, "removeFromSuperview");

  self->_scrubber = 0;
  -[PLSlalomRegionEditor removeFromSuperview](self->_slalomRegionEditor, "removeFromSuperview");
  -[PLSlalomRegionEditor setDelegate:](self->_slalomRegionEditor, "setDelegate:", 0);

  self->_slalomRegionEditor = 0;
}

- (BOOL)_shouldShowSlalomEditor
{
  char v3;

  if ((PLRunningFromPhotosApplication() & 1) != 0)
    v3 = 0;
  else
    v3 = PLIsCamera() ^ 1;
  if (-[PLVideoView allowSlalomEditor](self, "allowSlalomEditor")
    && (v3 & 1) == 0
    && -[PLManagedAsset isMogul](self->_videoCameraImage, "isMogul"))
  {
    return objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "isRecognizedFormat");
  }
  else
  {
    return 0;
  }
}

- (BOOL)_canAccessVideo
{
  PLManagedAsset *videoCameraImage;

  videoCameraImage = self->_videoCameraImage;
  if (videoCameraImage
    && -[PLManagedAsset complete](videoCameraImage, "complete")
    && !-[PLManagedAsset isTimelapsePlaceholder](self->_videoCameraImage, "isTimelapsePlaceholder")
    || self->_videoURL)
  {
    return -[PLManagedAsset isPhotoIrisPlaceholder](self->_videoCameraImage, "isPhotoIrisPlaceholder") ^ 1;
  }
  else
  {
    return 0;
  }
}

- (id)videoOverlayPlayButton
{
  return self->_videoOverlayPlayButton;
}

- (void)_showVideoOverlay
{
  PLVideoOverlayButton *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if ((*((_BYTE *)self + 657) & 1) != 0
    && (*((_BYTE *)self + 658) & 4) == 0
    && -[PLVideoView _canAccessVideo](self, "_canAccessVideo"))
  {
    if (self->_videoOverlayPlayButton)
      goto LABEL_8;
    if (-[PLVideoView _mediaIsPlayable](self, "_mediaIsPlayable"))
    {
      v3 = (PLVideoOverlayButton *)+[PLVideoView _dequeueOverlayPlayButton](PLVideoView, "_dequeueOverlayPlayButton");
      self->_videoOverlayPlayButton = v3;
      -[PLVideoOverlayButton setTarget:action:](v3, "setTarget:action:", self, sel_playButtonClicked_);
    }
    if (self->_videoOverlayPlayButton)
    {
LABEL_8:
      *((_BYTE *)self + 659) |= 0x40u;
      -[PLVideoOverlayButton frame](self->_videoOverlayPlayButton, "frame");
      v5 = v4;
      v7 = v6;
      -[PLVideoView addSubview:](self, "addSubview:", self->_videoOverlayPlayButton);
      objc_msgSend((id)-[PLVideoOverlayButton superview](self->_videoOverlayPlayButton, "superview"), "bounds");
      -[PLVideoOverlayButton setFrame:](self->_videoOverlayPlayButton, "setFrame:", rint((v9 - v5) * 0.5), rint((v8 - v7) * 0.5), v5, v7);
      -[PLVideoOverlayButton setAutoresizingMask:](self->_videoOverlayPlayButton, "setAutoresizingMask:", 45);
      -[PLVideoOverlayButton setAlpha:](self->_videoOverlayPlayButton, "setAlpha:", 1.0);
    }
  }
}

- (void)_videoOverlayFadeOutDidFinish
{
  -[PLVideoView removeVideoOverlay](self, "removeVideoOverlay");
  -[PLVideoEditingOverlayView removeFromSuperview](self->_trimMessageView, "removeFromSuperview");

  self->_trimMessageView = 0;
}

- (void)_hideVideoOverlay:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  PLVideoView *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  PLVideoView *v13;

  if ((*((_BYTE *)self + 659) & 0x40) != 0)
  {
    *((_BYTE *)self + 659) &= ~0x40u;
    v8 = self;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __33__PLVideoView__hideVideoOverlay___block_invoke;
    v12 = &unk_1E70B6370;
    v13 = self;
    v4 = MEMORY[0x1E0C809B0];
    v5 = 3221225472;
    v6 = __33__PLVideoView__hideVideoOverlay___block_invoke_2;
    v7 = &unk_1E70B6398;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", &v9, &v4, 0.25);
    }
    else
    {
      -[PLVideoOverlayButton setAlpha:](self->_videoOverlayPlayButton, "setAlpha:", 0.0, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);
      -[PLVideoView _videoOverlayFadeOutDidFinish](self, "_videoOverlayFadeOutDidFinish");
    }
  }
}

- (void)removeVideoOverlay
{
  -[PLVideoOverlayButton removeFromSuperview](self->_videoOverlayPlayButton, "removeFromSuperview");
  +[PLVideoView _enqueueOverlayPlayButton:](PLVideoView, "_enqueueOverlayPlayButton:", self->_videoOverlayPlayButton);

  self->_videoOverlayPlayButton = 0;
  *((_BYTE *)self + 659) &= ~0x40u;
}

- (void)_hideTrimMessageView:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  PLVideoView *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  PLVideoView *v15;

  v3 = a3;
  -[PLVideoEditingOverlayView alpha](self->_trimMessageView, "alpha");
  if (v5 == 1.0)
  {
    v10 = self;
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __36__PLVideoView__hideTrimMessageView___block_invoke;
    v14 = &unk_1E70B6370;
    v15 = self;
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __36__PLVideoView__hideTrimMessageView___block_invoke_2;
    v9 = &unk_1E70B6398;
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", &v11, &v6, 0.25);
    }
    else
    {
      -[PLVideoEditingOverlayView setAlpha:](self->_trimMessageView, "setAlpha:", 0.0, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
      -[PLVideoView _videoOverlayFadeOutDidFinish](self, "_videoOverlayFadeOutDidFinish");
    }
  }
}

- (void)updateScaleMode
{
  if (self->_posterFrameImage)
  {
    self->_scaleMode = 1;
    -[UIImage size](self->_posterFrameImage, "size");
    -[PLVideoView _updateScaleModeForSize:](self, "_updateScaleModeForSize:");
    -[PLMoviePlayerView setScaleMode:](-[PLMoviePlayerController view](self->_moviePlayer, "view"), "setScaleMode:", self->_scaleMode);
    -[PLVideoPosterFrameView setScaleMode:](self->_posterFrameView, "setScaleMode:", self->_scaleMode);
  }
}

- (void)_updateScaleModeForSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL4 v6;
  double v7;
  double v8;
  double v9;

  height = a3.height;
  width = a3.width;
  v6 = a3.width >= a3.height;
  -[PLVideoView bounds](self, "bounds");
  v8 = v7;
  -[PLVideoView bounds](self, "bounds");
  if (v6 != v8 < v9)
    self->_scaleMode = 2;
  *((_BYTE *)self + 660) = *((_BYTE *)self + 660) & 0xF7 | (8 * (width >= height));
}

- (BOOL)_canCreateMetadata
{
  return (*((unsigned __int8 *)self + 660) >> 4) & 1;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UIActivityIndicatorView *spinner;
  double MidX;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;

  if (*((char *)self + 659) < 0)
    -[PLVideoView _updateScrubberFrame](self, "_updateScrubberFrame");
  -[PLVideoView bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  spinner = self->_spinner;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  -[UIActivityIndicatorView setCenter:](spinner, "setCenter:", MidX, CGRectGetMidY(v12));
  -[UIActivityIndicatorView center](self->_spinner, "center");
  -[UIActivityIndicatorView setCenter:](self->_shadowSpinner, "setCenter:", v10 + 1.0, v9 + 1.0);
  -[PLVideoView _reloadScrubberThumbnailsIfNeeded](self, "_reloadScrubberThumbnailsIfNeeded");
}

- (void)_setNeedsReloadScrubberThumbnails:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 658) = *((_BYTE *)self + 658) & 0xFD | v3;
}

- (void)_reloadScrubberThumbnailsIfNeeded
{
  if ((*((_BYTE *)self + 658) & 2) != 0 && self->_scrubber && (*((_BYTE *)self + 659) & 4) != 0)
  {
    *((_BYTE *)self + 658) &= ~2u;
    -[UIMovieScrubber setDelegate:](self->_scrubber, "setDelegate:", self);
    -[UIMovieScrubber setDataSource:](self->_scrubber, "setDataSource:", self);
    -[UIMovieScrubber reloadData](self->_scrubber, "reloadData");
  }
}

- (BOOL)moviePlayerExitRequest:(id)a3 exitReason:(int)a4
{
  -[PLVideoView _playbackFinished](self, "_playbackFinished", a3, *(_QWORD *)&a4);
  return 1;
}

- (void)moviePlayerBufferingStateDidChange:(id)a3
{
  unint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *Log;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = -[PLMoviePlayerController bufferingState](self->_moviePlayer, "bufferingState", a3);
  v5 = -[PLVideoView _shouldStreamVideo](self, "_shouldStreamVideo");
  v6 = 10;
  if (!v5)
    v6 = 1;
  if ((v6 & v4) != 0)
  {
    Log = PLPhotoSharingGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) play due to buffer state change", buf, 2u);
    }
    *((_BYTE *)self + 659) |= 0x20u;
    -[PLVideoView _verifyOrRestartPlayback](self, "_verifyOrRestartPlayback");
  }
  else if (-[PLVideoView _shouldStreamVideo](self, "_shouldStreamVideo") && (v4 & 4) != 0)
  {
    v8 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1B9897000, v8, OS_LOG_TYPE_DEFAULT, "(video-playback) pauseDueToInsufficientData due to buffer state change", v9, 2u);
    }
    *((_BYTE *)self + 659) &= ~0x20u;
    -[PLVideoView _displayPlaySpinner](self, "_displayPlaySpinner");
  }
}

- (void)moviePlayerPlaybackRateDidChange:(id)a3
{
  float v4;
  NSObject *v5;
  NSObject *Log;
  uint8_t v7[16];
  uint8_t buf[16];

  -[PLMoviePlayerController playbackRate](self->_moviePlayer, "playbackRate", a3);
  if ((int)v4 == 1)
  {
    Log = PLPhotoSharingGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) moviePlayerPlaybackRateDidChange to 1", v7, 2u);
    }
    if ((*((_BYTE *)self + 658) & 4) != 0)
      -[PLVideoView _didBeginPlayback](self, "_didBeginPlayback");
  }
  else if (!(int)v4)
  {
    v5 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9897000, v5, OS_LOG_TYPE_DEFAULT, "(video-playback) moviePlayerPlaybackRateDidChange to 0", buf, 2u);
    }
    -[PLVideoView _updateSnapshotImage](self, "_updateSnapshotImage");
  }
}

- (void)moviePlayerPlaybackStateDidChange:(id)a3 fromPlaybackState:(unint64_t)a4
{
  unint64_t v5;
  double v6;
  double v7;
  double v8;

  v5 = -[PLMoviePlayerController playbackState](self->_moviePlayer, "playbackState", a3, a4);
  if (v5 == 3)
  {
    -[PLVideoView _removePlaySpinner](self, "_removePlaySpinner");
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      -[PLVideoViewDelegate videoViewPlaybackDidFail:](self->_delegate, "videoViewPlaybackDidFail:", self);
  }
  else if (v5 == 2)
  {
    if ((*((_BYTE *)self + 658) & 4) != 0)
    {
      -[PLMoviePlayerController currentTime](self->_moviePlayer, "currentTime");
      v7 = v6;
      -[PLMoviePlayerController duration](self->_moviePlayer, "duration");
      if (vabdd_f64(v7, v8) < 1.0)
      {
LABEL_12:
        -[PLVideoView _playbackFinished](self, "_playbackFinished");
        return;
      }
      -[PLVideoView moviePlayerHeadsetPlayPausePressed:](self, "moviePlayerHeadsetPlayPausePressed:", 0);
    }
  }
  else if (!v5 && (*((_BYTE *)self + 658) & 4) != 0)
  {
    goto LABEL_12;
  }
}

- (void)_requestPreviewPosterFrameForVideoSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  float v8;
  float v9;
  double v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[2];

  height = a3.height;
  width = a3.width;
  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "bounds");
  -[PLVideoView convertRect:fromView:](self, "convertRect:fromView:", 0);
  v7 = v6;
  v8 = width / height;
  v9 = v6 * v8;
  v10 = rintf(v9);
  v11 = -[PLVideoView _thumbnailSourceAsset](self, "_thumbnailSourceAsset");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC8]), "initWithAsset:", v11);
  -[PLVideoView _configureImageGenerator:thumbnailSize:forSummaryThumbnails:](self, "_configureImageGenerator:thumbnailSize:forSummaryThumbnails:", v12, 1, v10, v7);
  v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v13 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__PLVideoView__requestPreviewPosterFrameForVideoSize___block_invoke;
  v14[3] = &unk_1E70B63E8;
  v14[4] = self;
  v14[5] = v12;
  objc_msgSend(v12, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v13, v14);
}

- (void)_savePreviewPosterFrameImage:(CGImage *)a3
{
  void *v5;
  NSString *v6;
  const __CFURL *v7;
  CGImageDestination *v8;
  CGImageDestination *v9;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", a3);
  -[PLVideoPosterFrameView setImage:](self->_posterFrameView, "setImage:", v5);

  v6 = -[PLVideoView _pathForVideoPreviewFile](self, "_pathForVideoPreviewFile");
  if (v6)
  {
    v7 = (const __CFURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
    v8 = CGImageDestinationCreateWithURL(v7, (CFStringRef)objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier"), 1uLL, 0);
    if (v8)
    {
      v9 = v8;
      CGImageDestinationAddImage(v8, a3, 0);
      CGImageDestinationFinalize(v9);
      CFRelease(v9);
    }
  }
}

- (void)moviePlayerReadyToPlay:(id)a3
{
  PLVideoPosterFrameView *posterFrameView;
  double v5;
  double v6;
  double v7;
  double v8;

  -[PLVideoView _insertMoviePlayerViewIfNecessary](self, "_insertMoviePlayerViewIfNecessary", a3);
  if ((*((_BYTE *)self + 659) & 8) == 0 && (*((_BYTE *)self + 659) & 1) == 0)
  {
    *((_BYTE *)self + 659) |= 8u;
    -[PLMoviePlayerController duration](self->_moviePlayer, "duration");
    -[PLVideoView _setDuration:](self, "_setDuration:");
    posterFrameView = self->_posterFrameView;
    if (posterFrameView)
    {
      if (!-[PLVideoPosterFrameView image](posterFrameView, "image"))
      {
        -[AVPlayerItem presentationSize](-[AVPlayer currentItem](-[PLMoviePlayerController player](self->_moviePlayer, "player"), "currentItem"), "presentationSize");
        v6 = v5;
        v8 = v7;
        -[PLVideoView _updateScaleModeForSize:](self, "_updateScaleModeForSize:");
        -[PLMoviePlayerView setScaleMode:](-[PLMoviePlayerController view](self->_moviePlayer, "view"), "setScaleMode:", self->_scaleMode);
        -[PLVideoPosterFrameView setScaleMode:](self->_posterFrameView, "setScaleMode:", self->_scaleMode);
        if ((*((_BYTE *)self + 660) & 0x20) != 0)
        {
          *((_BYTE *)self + 660) &= ~0x20u;
          -[PLVideoView _requestPreviewPosterFrameForVideoSize:](self, "_requestPreviewPosterFrameForVideoSize:", v6, v8);
        }
      }
    }
    -[PLVideoView _setNeedsReloadScrubberThumbnails:](self, "_setNeedsReloadScrubberThumbnails:", 1);
    -[PLVideoView _updateScrubberVisibilityWithDuration:](self, "_updateScrubberVisibilityWithDuration:", 0.0);
    -[PLVideoView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updatePosterFrameVisibility, 0, 0.1);
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[PLVideoViewDelegate videoViewIsReadyToBeginPlayback:](self->_delegate, "videoViewIsReadyToBeginPlayback:", self);
    }
  }
}

- (void)moviePlayerReadyToDisplay:(id)a3
{
  int v5;
  char v6;
  char v7;

  -[PLVideoView _insertMoviePlayerViewIfNecessary](self, "_insertMoviePlayerViewIfNecessary");
  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "view"), "videoView"), "layer"), "isReadyForDisplay");
  v6 = *((_BYTE *)self + 659);
  if (((v5 ^ ((v6 & 0x10) == 0)) & 1) == 0)
  {
    if (v5)
      v7 = 16;
    else
      v7 = 0;
    *((_BYTE *)self + 659) = v6 & 0xEF | v7;
    -[PLVideoView _updatePosterFrameVisibility](self, "_updatePosterFrameVisibility");
  }
}

- (void)moviePlayerDurationAvailable:(id)a3
{
  double v4;

  -[PLMoviePlayerController duration](self->_moviePlayer, "duration", a3);
  if (self->_duration != v4)
  {
    -[PLVideoView _setDuration:](self, "_setDuration:");
    -[PLVideoView _updateScrubberVisibilityWithDuration:](self, "_updateScrubberVisibilityWithDuration:", 0.0);
  }
}

- (void)_prepareAndResumePlayback
{
  _BOOL4 v3;

  v3 = -[PLVideoView isPlaying](self, "isPlaying");
  -[PLVideoView _prepareMoviePlayerIfNeeded](self, "_prepareMoviePlayerIfNeeded");
  if (v3 && !-[PLVideoView isPlaying](self, "isPlaying"))
    -[PLVideoView play](self, "play");
}

- (void)_fetchNonlocalVideo
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  -[PLVideoView _setLocalVideoUnavailable:](self, "_setLocalVideoUnavailable:", 1);
  -[PLVideoView _updateSlalomRegionEditorState](self, "_updateSlalomRegionEditorState");
  if (-[PLVideoView isPlaying](self, "isPlaying"))
    -[PLVideoView _displayPlaySpinner](self, "_displayPlaySpinner");
  v3 = objc_alloc_init(MEMORY[0x1E0CD1808]);
  objc_msgSend(v3, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v3, "setStreamingAllowed:", 1);
  objc_msgSend(v3, "setVideoComplementAllowed:", 1);
  objc_msgSend(v3, "setVersion:", 0);
  self->__isFetchingVideo = 1;
  v4 = -[PLManagedAsset pl_PHAssetFromPhotoLibrary:](self->_videoCameraImage, "pl_PHAssetFromPhotoLibrary:", pl_appPhotoLibrary());
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PLVideoView__fetchNonlocalVideo__block_invoke;
  v6[3] = &unk_1E70B6438;
  v6[4] = self;
  v6[5] = v4;
  objc_msgSend(v5, "requestPlayerItemForVideo:options:resultHandler:", v4, v3, v6);
}

- (void)_fetchLocalContentEditingInput
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = objc_alloc_init(MEMORY[0x1E0CD1500]);
  objc_msgSend(v3, "setNetworkAccessAllowed:", 0);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PLVideoView__fetchLocalContentEditingInput__block_invoke;
  v7[3] = &unk_1E70B6460;
  v7[4] = self;
  objc_msgSend(v3, "setCanHandleAdjustmentData:", v7);
  self->__isFetchingVideo = 1;
  v5 = (void *)-[PLManagedAsset pl_PHAssetFromPhotoLibrary:](self->_videoCameraImage, "pl_PHAssetFromPhotoLibrary:", pl_appPhotoLibrary());
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __45__PLVideoView__fetchLocalContentEditingInput__block_invoke_2;
  v6[3] = &unk_1E70B6488;
  v6[4] = self;
  objc_msgSend(v5, "requestContentEditingInputWithOptions:completionHandler:", v3, v6);
}

- (BOOL)_prepareMoviePlayerIfNeeded
{
  uint64_t v3;
  id v4;
  _BOOL4 v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  PFVideoAVObjectBuilder *videoAVObjectBuilder;
  id v10;
  PLMoviePlayerView *v11;
  AVAsset *v12;
  void *v13;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  _QWORD v23[5];

  LODWORD(v3) = -[UIView pl_isOnScreen:](self, "pl_isOnScreen:", objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"));
  if ((_DWORD)v3)
  {
    if (!-[PLVideoView _mediaIsCloudSharedStreamedVideo](self, "_mediaIsCloudSharedStreamedVideo")
      || -[PLVideoView _canPlayCloudSharedStreamedVideoWithLocalVideo](self, "_canPlayCloudSharedStreamedVideoWithLocalVideo")|| (v3 = -[PLManagedAsset cachedNonPersistedVideoPlaybackURL](self->_videoCameraImage, "cachedNonPersistedVideoPlaybackURL")) != 0)
    {
      if ((*((_BYTE *)self + 659) & 2) != 0
        || (*((_BYTE *)self + 659) & 4) == 0
        || !self->_moviePlayer
        || !-[PLVideoView _canAccessVideo](self, "_canAccessVideo"))
      {
        if (self->_moviePlayer)
        {
LABEL_17:
          LOBYTE(v3) = 1;
          return v3;
        }
        -[PLVideoView _setupMoviePlayerIfNecessary](self, "_setupMoviePlayerIfNecessary");
LABEL_19:
        LOBYTE(v3) = 0;
        return v3;
      }
      if (!self->__videoAVObjectBuilder)
      {
        if (self->_videoURL)
          goto LABEL_11;
        if (!-[PLVideoView _mediaIsCloudSharedStreamedVideo](self, "_mediaIsCloudSharedStreamedVideo"))
        {
          if (self->_videoCameraImage)
          {
            if (!self->__isFetchingVideo && !-[PLVideoView _localVideoUnavailable](self, "_localVideoUnavailable"))
              -[PLVideoView _fetchLocalContentEditingInput](self, "_fetchLocalContentEditingInput");
            goto LABEL_19;
          }
          goto LABEL_12;
        }
        if (-[PLVideoView _canPlayCloudSharedStreamedVideoWithLocalVideo](self, "_canPlayCloudSharedStreamedVideoWithLocalVideo")? objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", self->_pathToOriginalVideo, 0): -[PLManagedAsset cachedNonPersistedVideoPlaybackURL](self->_videoCameraImage, "cachedNonPersistedVideoPlaybackURL"))
        {
LABEL_11:
          v4 = -[PLVideoView _assetForVideoURL:](self, "_assetForVideoURL:");
          self->__videoAVObjectBuilder = (PFVideoAVObjectBuilder *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v4, 0);
        }
      }
LABEL_12:
      v5 = -[PLVideoView _shouldPlayFlattenedVideo](self, "_shouldPlayFlattenedVideo");
      v6 = v5;
      if (!v5 || -[PLVideoView _isFlattenedVideoUpToDate](self, "_isFlattenedVideoUpToDate"))
      {
        *((_BYTE *)self + 659) |= 2u;
        -[PLVideoView _configurePlayerForStreamedVideoIfNecessary](self, "_configurePlayerForStreamedVideoIfNecessary");
        v17 = 0;
        v18 = &v17;
        v19 = 0x3052000000;
        v20 = __Block_byref_object_copy__3970;
        v21 = __Block_byref_object_dispose__3971;
        v22 = 0;
        if (v6)
        {
          v7 = -[PLVideoView _assetForVideoPath:](self, "_assetForVideoPath:", -[PLVideoView _filePathForFlattenedVideo](self, "_filePathForFlattenedVideo"));
          v8 = objc_msgSend(MEMORY[0x1E0C8B300], "playerItemWithAsset:", v7);
          v18[5] = v8;
        }
        else
        {
          videoAVObjectBuilder = self->__videoAVObjectBuilder;
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __42__PLVideoView__prepareMoviePlayerIfNeeded__block_invoke_100;
          v16[3] = &unk_1E70B64B0;
          v16[4] = &v17;
          -[PFVideoAVObjectBuilder requestPlayerItemWithResultHandler:](videoAVObjectBuilder, "requestPlayerItemWithResultHandler:", v16);
          v10 = (id)v18[5];
        }
        if (objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "hasSlowMotionAdjustments"))-[PLVideoView _updateScrubberForSlowMotion](self, "_updateScrubberForSlowMotion");
        -[PLMoviePlayerController setPlayerItem:startTime:](self->_moviePlayer, "setPlayerItem:startTime:", v18[5], self->_cachedCurrentPlaybackTime);
        v11 = -[PLMoviePlayerController view](self->_moviePlayer, "view");
        -[PLMoviePlayerView setClipsToBounds:](v11, "setClipsToBounds:", 1);
        -[PLMoviePlayerView setScaleMode:](v11, "setScaleMode:", self->_scaleMode);
        *((_BYTE *)self + 659) &= ~1u;
        -[PLVideoView _clearImageGenerators](self, "_clearImageGenerators");
        -[PLVideoView _createImageGenerators](self, "_createImageGenerators");
        if ((-[PLMoviePlayerController bufferingState](self->_moviePlayer, "bufferingState") & 0xB) != 0)
          *((_BYTE *)self + 659) |= 0x20u;
        if (-[PLMoviePlayerController isPreparedForPlayback](self->_moviePlayer, "isPreparedForPlayback"))
          -[PLVideoView moviePlayerReadyToPlay:](self, "moviePlayerReadyToPlay:", self->_moviePlayer);
        _Block_object_dispose(&v17, 8);
        goto LABEL_17;
      }
      if (!self->_airplayExportSession)
      {
        v12 = -[AVPlayerItem asset](-[AVPlayer currentItem](-[PLMoviePlayerController player](self->_moviePlayer, "player"), "currentItem"), "asset");
        if (-[AVAsset isMemberOfClass:](v12, "isMemberOfClass:", objc_opt_class()))
        {
          v13 = (void *)-[AVAsset URL](v12, "URL");
          if (objc_msgSend(v13, "isFileURL"))
          {
            if (objc_msgSend((id)objc_msgSend(v13, "path"), "isEqualToString:", -[PLVideoView _filePathForFlattenedVideo](self, "_filePathForFlattenedVideo")))
            {
              -[PLVideoView pause](self, "pause");
              -[PLMoviePlayerController setPlayerItem:startTime:](self->_moviePlayer, "setPlayerItem:startTime:", 0, 0.0);
            }
          }
        }
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __42__PLVideoView__prepareMoviePlayerIfNeeded__block_invoke;
        v23[3] = &unk_1E70B6398;
        v23[4] = self;
        -[PLVideoView _flattenVideoWithCompletionHandler:](self, "_flattenVideoWithCompletionHandler:", v23);
      }
      goto LABEL_19;
    }
  }
  return v3;
}

- (BOOL)_canHandleAdjustmentData:(id)a3
{
  void *v3;
  char v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75308]), "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", objc_msgSend(a3, "formatIdentifier"), objc_msgSend(a3, "formatVersion"), objc_msgSend(a3, "data"), 0, 0, 0);
  v4 = objc_msgSend(v3, "isRecognizedFormat");

  return v4;
}

- (void)_updateVideoAVObjectBuilderFromContentEditingInput:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = objc_msgSend(a3, "audiovisualAsset");

  v6 = (void *)objc_msgSend(a3, "adjustmentData");
  if (v6)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D75308]), "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", objc_msgSend(v6, "formatIdentifier"), objc_msgSend(v6, "formatVersion"), objc_msgSend(v6, "data"), 0, 0, 0);
    self->__videoAVObjectBuilder = (PFVideoAVObjectBuilder *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v5, v7);

  }
  else
  {
    self->__videoAVObjectBuilder = (PFVideoAVObjectBuilder *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v5, 0);
  }
}

- (id)_optionsForAVURLAsset
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!-[PLVideoView _mediaIsCloudSharedStreamedVideo](self, "_mediaIsCloudSharedStreamedVideo")
    || -[PLVideoView _canPlayCloudSharedStreamedVideoWithLocalVideo](self, "_canPlayCloudSharedStreamedVideoWithLocalVideo"))
  {
    return 0;
  }
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x1E0C8ADB0]);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  objc_msgSend(v3, "setObject:forKey:", v6, *MEMORY[0x1E0C8AD78]);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x1E0C8AD98]);
  if ((objc_msgSend(MEMORY[0x1E0D719E0], "debugAlwaysStreamSharedVideos") & 1) == 0)
  {
    v8 = objc_msgSend(MEMORY[0x1E0D719E0], "streamdVideoCache");
    objc_msgSend(v3, "setObject:forKey:", v8, *MEMORY[0x1E0C8AD50]);
  }
  return v3;
}

- (id)_assetForVideoPath:(id)a3
{
  id v4;
  id v5;

  v4 = +[PLMoviePlayerController AVAssetURLWithPath:](PLMoviePlayerController, "AVAssetURLWithPath:", a3);
  v5 = -[PLVideoView _optionsForAVURLAsset](self, "_optionsForAVURLAsset");
  return (id)objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v4, v5);
}

- (id)_assetForVideoURL:(id)a3
{
  id v4;

  v4 = -[PLVideoView _optionsForAVURLAsset](self, "_optionsForAVURLAsset");
  return (id)objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", a3, v4);
}

- (void)_configurePlayerForStreamedVideoIfNecessary
{
  AVPlayer *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (-[PLVideoView _shouldStreamVideo](self, "_shouldStreamVideo"))
  {
    if (!-[PLVideoView _canPlayCloudSharedStreamedVideoWithLocalVideo](self, "_canPlayCloudSharedStreamedVideoWithLocalVideo"))
    {
      v3 = -[PLMoviePlayerController player](self->_moviePlayer, "player");
      v4[0] = *MEMORY[0x1E0C8A2E0];
      -[AVPlayer setExpectedAssetTypes:](v3, "setExpectedAssetTypes:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1));
    }
  }
}

- (void)_updateScrubberForSlowMotion
{
  -[UIMovieScrubber value](self->_scrubber, "value");
  -[PLVideoView _movieTimeFromScrubberTime:](self, "_movieTimeFromScrubberTime:");
  -[PLVideoView _scrubToMovieTime:](self, "_scrubToMovieTime:");
}

- (void)_setMoviePlayerActive:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 659) = *((_BYTE *)self + 659) & 0xFB | v3;
  -[PLVideoView _updatePosterFrameVisibility](self, "_updatePosterFrameVisibility");
}

- (void)moviePlayerControllerDidBecomeActiveController:(id)a3
{
  -[PLVideoView _setMoviePlayerActive:](self, "_setMoviePlayerActive:", 1);
  if ((*((_BYTE *)self + 659) & 2) == 0)
    *((_BYTE *)self + 659) |= 1u;
  -[PLVideoView _setPlaybackDidBegin:](self, "_setPlaybackDidBegin:", 0);
  self->_lastScrubbedValue = -1.0;
  self->_lastActualValue = 0.0;
  *((_BYTE *)self + 658) &= ~0x40u;
}

- (void)moviePlayerControllerWillResignAsActiveController:(id)a3
{
  double v5;

  if (!self->_snapshotImage)
    -[PLVideoView _updateSnapshotImage](self, "_updateSnapshotImage");
  if ((*((_BYTE *)self + 659) & 2) != 0)
  {
    objc_msgSend(a3, "currentTime");
    self->_cachedCurrentPlaybackTime = v5;
  }
  -[PLVideoView _setMoviePlayerActive:](self, "_setMoviePlayerActive:", 0);
  -[PLVideoView _setPlaybackDidBegin:](self, "_setPlaybackDidBegin:", 0);
  -[PLVideoView setShowsScrubber:duration:](self, "setShowsScrubber:duration:", 0, 0.0);
  -[PLVideoView _updatePosterFrameVisibility](self, "_updatePosterFrameVisibility");
}

- (BOOL)moviePlayerShouldNotifyOnPreparationError:(id)a3
{
  _BOOL4 v4;

  v4 = -[PLVideoView _canAttemptFetchingVideoDerivative](self, "_canAttemptFetchingVideoDerivative", a3);
  if (v4)
  {
    -[PLVideoView _setCanAttemptFetchingVideoDerivative:](self, "_setCanAttemptFetchingVideoDerivative:", 0);
    -[PLMoviePlayerController resetPlayer](self->_moviePlayer, "resetPlayer");
    -[PLVideoView _reset](self, "_reset");
    -[PLVideoView _fetchNonlocalVideo](self, "_fetchNonlocalVideo");
  }
  return !v4;
}

- (void)moviePlayerEncounteredAuthenticationError:(id)a3
{
  -[PLManagedAsset setCachedNonPersistedVideoPlaybackURL:](self->_videoCameraImage, "setCachedNonPersistedVideoPlaybackURL:", 0);
  -[PLManagedAsset setCachedNonPersistedVideoPlaybackURLExpiration:](self->_videoCameraImage, "setCachedNonPersistedVideoPlaybackURLExpiration:", 0);
  -[PLManagedAsset setCachedNonPersistedVideoPlaybackURLError:](self->_videoCameraImage, "setCachedNonPersistedVideoPlaybackURLError:", 0);
  *((_BYTE *)self + 659) &= ~2u;
  -[PLVideoView play](self, "play");
}

- (BOOL)moviePlayerControllerShouldAllowExternalPlayback:(id)a3
{
  return 1;
}

- (void)moviePlayerDidChangeExternalPlaybackType:(id)a3
{
  _BOOL4 v4;

  v4 = -[PLVideoView _playerIsAirplay](self, "_playerIsAirplay", a3);
  if (self->_isAirPlay != v4)
  {
    self->_isAirPlay = v4;
    if (!-[PLVideoView _canAirPlayCurrentVideo](self, "_canAirPlayCurrentVideo"))
      pl_dispatch_async();
  }
}

- (BOOL)_playerIsAirplay
{
  return -[PLMoviePlayerController externalPlaybackType](self->_moviePlayer, "externalPlaybackType") == 1;
}

- (id)moviePlayerRequestsPickedAirplayRoute:(id)a3
{
  return 0;
}

- (void)moviePlayerHeadsetPlayPausePressed:(id)a3
{
  if ((*((_BYTE *)self + 659) & 4) != 0 && (*((_BYTE *)self + 658) & 0x20) == 0)
  {
    if (-[PLMoviePlayerController playbackState](self->_moviePlayer, "playbackState", a3))
    {
      if ((*((_BYTE *)self + 658) & 4) != 0)
      {
        -[PLVideoView pause](self, "pause");
        if (self->_delegate)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[PLVideoViewDelegate videoViewDidPausePlayback:](self->_delegate, "videoViewDidPausePlayback:", self);
        }
      }
      else
      {
        -[PLVideoView play](self, "play");
      }
    }
    else
    {
      -[PLVideoView _playbackFinished](self, "_playbackFinished");
    }
  }
}

- (void)moviePlayerHeadsetNextTrackPressed:(id)a3
{
  if ((*((_BYTE *)self + 659) & 4) != 0 && ((*((_BYTE *)self + 658) & 4) != 0 || (*((_BYTE *)self + 660) & 2) != 0))
    -[PLVideoView _scrubToMovieTime:](self, "_scrubToMovieTime:", a3, self->_duration);
}

- (void)moviePlayerHeadsetPreviousTrackPressed:(id)a3
{
  if ((*((_BYTE *)self + 659) & 4) != 0 && ((*((_BYTE *)self + 658) & 4) != 0 || (*((_BYTE *)self + 660) & 2) != 0))
    -[PLVideoView _scrubToMovieTime:](self, "_scrubToMovieTime:", a3, 0.0);
}

- (id)movieScrubber:(id)a3 evenlySpacedTimestamps:(int)a4 startingAt:(id)a5 endingAt:(id)a6
{
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  double v21;
  uint64_t v22;
  _QWORD *v23;

  objc_msgSend(a5, "doubleValue");
  v11 = v10;
  objc_msgSend(a6, "doubleValue");
  v13 = v12;
  -[PLVideoView movieScrubberDuration:](self, "movieScrubberDuration:", a3);
  v15 = v14;
  if (v13 == 0.0)
    goto LABEL_8;
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
  if (a4 >= 1)
  {
    v18 = (v13 - v11) / (double)(a4 - 1);
    v19 = v11;
    do
    {
      objc_msgSend(v16, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19));
      v19 = v18 + v19;
      if (v19 > v15)
      {
        v17 = v19 + -0.001;
        v20 = v19 + -0.001 > v15;
        v19 = v15;
        if (v20)
          break;
      }
      --a4;
    }
    while (a4);
  }
  if (!v16)
LABEL_8:
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0));
  -[PLVideoView _scrubberStartTime](self, "_scrubberStartTime", v17);
  if (v11 == v21 && v13 == v15)
  {
    if (self->_useLandscapeCache)
      v22 = 704;
    else
      v22 = 712;
    v23 = (Class *)((char *)&self->super.super.super.isa + v22);
    if (!*v23)
      *v23 = v16;
  }
  return v16;
}

- (id)movieScrubber:(id)a3 timestampsStartingAt:(id)a4 endingAt:(id)a5 maxCount:(int)a6
{
  return 0;
}

- (void)_saveCachedThumbnailsIfNecessary
{
  _BOOL4 useLandscapeCache;
  int *v4;
  void *v5;
  int *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  NSString *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  useLandscapeCache = self->_useLandscapeCache;
  v4 = &OBJC_IVAR___PLVideoView__landscapeSummaryThumbnailTimestamps;
  if (!self->_useLandscapeCache)
    v4 = &OBJC_IVAR___PLVideoView__portraitSummaryThumbnailTimestamps;
  v5 = *(Class *)((char *)&self->super.super.super.isa + *v4);
  v6 = &OBJC_IVAR___PLVideoView__bakedLandscapeThumbnails;
  if (!self->_useLandscapeCache)
    v6 = &OBJC_IVAR___PLVideoView__bakedPortraitThumbnails;
  v7 = objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "options"), "objectForKey:", CFSTR("timestamps"));
  if (v5 && (objc_msgSend(v5, "isEqualToArray:", v7) & 1) == 0)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v5);
          v13 = -[NSMutableDictionary objectForKey:](self->_cachedThumbnails, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          if (v13)
            objc_msgSend(v8, "addObject:", v13);
        }
        v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }
    v14 = objc_msgSend(v8, "count");
    if (v14 == objc_msgSend(v5, "count"))
    {
      v15 = *((_BYTE *)self + 660);
      v16 = (void *)objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
      if ((v15 & 8) != 0)
        v17 = (void *)objc_msgSend(v16, "landscapeScrubberThumbnailFormat");
      else
        v17 = (void *)objc_msgSend(v16, "portraitScrubberThumbnailFormat");
      v18 = objc_msgSend(v17, "formatID");
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("timestamps"), 0);
      v20 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71970]), "initWithImages:format:options:delegate:", v8, v18, v19, 0);

      if (useLandscapeCache)
        v21 = -[PLVideoView _pathForPrebakedLandscapeScrubberThumbnails](self, "_pathForPrebakedLandscapeScrubberThumbnails");
      else
        v21 = -[PLVideoView _pathForPrebakedPortraitScrubberThumbnails](self, "_pathForPrebakedPortraitScrubberThumbnails");
      if (v21 && -[objc_class saveToFile:](v20, "saveToFile:", v21))
      {
        if (useLandscapeCache)
          v22 = 552;
        else
          v22 = 560;

        *(Class *)((char *)&self->super.super.super.isa + v22) = v20;
      }
      else
      {

      }
    }

  }
}

- (void)movieScrubberDidBeginAnimatingZoom:(id)a3
{
  -[PLSlalomRegionEditor setZoomAnimating:](self->_slalomRegionEditor, "setZoomAnimating:", 1);
}

- (void)movieScrubberDidEndAnimatingZoom:(id)a3
{
  -[PLSlalomRegionEditor setZoomAnimating:](self->_slalomRegionEditor, "setZoomAnimating:", 0);
}

- (NSString)pathForVideoFile
{
  if (self->_videoCameraImage)
    return (NSString *)-[PLManagedAsset pathForVideoFile](self->_videoCameraImage, "pathForVideoFile");
  else
    return -[NSURL path](self->_videoURL, "path");
}

- (id)_pathForOriginalFile
{
  NSString *v3;
  PLManagedAsset *videoCameraImage;

  v3 = -[NSURL path](self->_videoURL, "path");
  if (-[PLVideoView _mediaIsCloudSharedStreamedVideo](self, "_mediaIsCloudSharedStreamedVideo"))
  {
    if (!self->_pathToOriginalVideo || (objc_msgSend(MEMORY[0x1E0D719E0], "debugAlwaysStreamSharedVideos") & 1) != 0)
      return (id)objc_msgSend((id)-[PLManagedAsset cachedNonPersistedVideoPlaybackURL](self->_videoCameraImage, "cachedNonPersistedVideoPlaybackURL"), "absoluteString");
    return self->_pathToOriginalVideo;
  }
  else
  {
    videoCameraImage = self->_videoCameraImage;
    if (videoCameraImage)
      return (id)-[PLManagedAsset pathForOriginalFile](videoCameraImage, "pathForOriginalFile");
  }
  return v3;
}

- (NSString)_pathForVideoPreviewFile
{
  NSString *result;

  result = (NSString *)self->_videoCameraImage;
  if (result)
    return (NSString *)-[NSString pathForVideoPreviewFile](result, "pathForVideoPreviewFile");
  return result;
}

- (NSString)_pathForPrebakedLandscapeScrubberThumbnails
{
  NSString *result;

  result = (NSString *)self->_videoCameraImage;
  if (result)
    return (NSString *)-[NSString pathForPrebakedLandscapeScrubberThumbnails](result, "pathForPrebakedLandscapeScrubberThumbnails");
  return result;
}

- (NSString)_pathForPrebakedPortraitScrubberThumbnails
{
  NSString *result;

  result = (NSString *)self->_videoCameraImage;
  if (result)
    return (NSString *)-[NSString pathForPrebakedPortraitScrubberThumbnails](result, "pathForPrebakedPortraitScrubberThumbnails");
  return result;
}

- (BOOL)_mediaIsPlayable
{
  PLManagedAsset *videoCameraImage;

  videoCameraImage = self->_videoCameraImage;
  if (!videoCameraImage
    || (-[PLManagedAsset isVideo](videoCameraImage, "isVideo") & 1) != 0
    || (-[PLManagedAsset isStreamedVideo](self->_videoCameraImage, "isStreamedVideo") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[PLManagedAsset isAudio](self->_videoCameraImage, "isAudio");
  }
}

- (BOOL)_mediaIsVideo
{
  PLManagedAsset *videoCameraImage;

  videoCameraImage = self->_videoCameraImage;
  if (videoCameraImage)
    return -[PLManagedAsset isVideo](videoCameraImage, "isVideo");
  else
    return 1;
}

- (BOOL)_mediaIsCloudSharedStreamedVideo
{
  PLManagedAsset *videoCameraImage;

  videoCameraImage = self->_videoCameraImage;
  if (videoCameraImage)
    LOBYTE(videoCameraImage) = -[PLManagedAsset isStreamedVideo](videoCameraImage, "isStreamedVideo");
  return (char)videoCameraImage;
}

- (BOOL)_shouldStreamCloudPhotoLibraryVideo
{
  PLManagedAsset *videoCameraImage;

  videoCameraImage = self->_videoCameraImage;
  return videoCameraImage
      && -[PLManagedAsset cloudPlaceholderKind](videoCameraImage, "cloudPlaceholderKind")
      && -[PLVideoView _localVideoUnavailable](self, "_localVideoUnavailable");
}

- (BOOL)_shouldStreamVideo
{
  return -[PLVideoView _mediaIsCloudSharedStreamedVideo](self, "_mediaIsCloudSharedStreamedVideo")
      || -[PLVideoView _shouldStreamCloudPhotoLibraryVideo](self, "_shouldStreamCloudPhotoLibraryVideo");
}

- (BOOL)_canPlayCloudSharedStreamedVideoWithLocalVideo
{
  if (self->_pathToOriginalVideo && (objc_msgSend(MEMORY[0x1E0D719E0], "debugAlwaysStreamSharedVideos") & 1) == 0)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", self->_pathToOriginalVideo);
  else
    return 0;
}

- (BOOL)_didSetPhotoData
{
  PLManagedAsset *videoCameraImage;

  videoCameraImage = self->_videoCameraImage;
  if (!videoCameraImage)
    return 1;
  if ((-[PLManagedAsset isInFlight](videoCameraImage, "isInFlight") & 1) != 0)
    return 0;
  return -[PLManagedAsset complete](self->_videoCameraImage, "complete");
}

- (void)movieScrubber:(id)a3 requestThumbnailImageForTimestamp:(id)a4
{
  -[PLVideoView movieScrubber:requestThumbnailImageForTimestamp:isSummaryThumbnail:](self, "movieScrubber:requestThumbnailImageForTimestamp:isSummaryThumbnail:", a3, a4, 1);
}

- (void)movieScrubber:(id)a3 requestThumbnailImageForTimestamp:(id)a4 isSummaryThumbnail:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;

  v5 = a5;
  v8 = -[NSMutableDictionary objectForKey:](self->_cachedThumbnails, "objectForKey:", a4);
  if (v8)
    -[UIMovieScrubber setThumbnailImage:forTimestamp:](self->_scrubber, "setThumbnailImage:forTimestamp:", v8, a4);
  else
    -[PLVideoView _addThumbnailRequestForTimestamp:isSummaryThumbnail:](self, "_addThumbnailRequestForTimestamp:isSummaryThumbnail:", a4, v5);
}

- (id)_loadThumbnailsIntoDictionary:(id)a3 isLandscape:(BOOL)a4 aspectRatio:(float)a5
{
  NSString *v7;
  NSString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;

  if (a4)
    v7 = -[PLVideoView _pathForPrebakedLandscapeScrubberThumbnails](self, "_pathForPrebakedLandscapeScrubberThumbnails");
  else
    v7 = -[PLVideoView _pathForPrebakedPortraitScrubberThumbnails](self, "_pathForPrebakedPortraitScrubberThumbnails");
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
    if (a5 <= 1.0)
      v10 = (void *)objc_msgSend(v9, "portraitScrubberThumbnailFormat");
    else
      v10 = (void *)objc_msgSend(v9, "landscapeScrubberThumbnailFormat");
    v11 = objc_msgSend(v10, "formatID");
    v8 = (NSString *)objc_msgSend(MEMORY[0x1E0D71970], "thumbnailsWithContentsOfFile:format:", v8, v11);
    v12 = (void *)objc_msgSend((id)-[NSString options](v8, "options"), "objectForKey:", CFSTR("timestamps"));
    v13 = -[NSString count](v8, "count");
    if (v13 >= 1)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
        objc_msgSend(a3, "setObject:forKey:", -[NSString thumbnailImageAtIndex:](v8, "thumbnailImageAtIndex:", i), objc_msgSend(v12, "objectAtIndex:", i));
    }
  }
  return v8;
}

- (double)movieScrubberThumbnailAspectRatio:(id)a3
{
  AVPlayerItem *v4;
  double v5;
  double v6;
  double v7;
  float v8;
  double width;
  double height;
  void *v12;
  void *v13;
  _BOOL4 useLandscapeCache;
  uint64_t v15;
  NSMutableDictionary *cachedThumbnails;
  id v17;
  _BOOL4 v18;
  objc_class *v19;
  int *v20;

  v4 = -[AVPlayer currentItem](-[PLMoviePlayerController player](self->_moviePlayer, "player", a3), "currentItem");
  if (v4)
  {
    -[AVPlayerItem presentationSize](v4, "presentationSize");
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D820];
    v6 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v7 = 1.0;
  if (v5 > 0.0 && v6 > 0.0)
  {
    v8 = v5 / v6;
    width = self->_thumbnailSize.width;
    height = self->_thumbnailSize.height;
    if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
      if (v8 <= 1.0)
        v13 = (void *)objc_msgSend(v12, "portraitScrubberThumbnailFormat");
      else
        v13 = (void *)objc_msgSend(v12, "landscapeScrubberThumbnailFormat");
      objc_msgSend(v13, "size");
      width = rint(height * v8);
      self->_thumbnailSize.width = width;
      self->_thumbnailSize.height = height;
    }
    useLandscapeCache = self->_useLandscapeCache;
    if (self->_useLandscapeCache)
      v15 = 552;
    else
      v15 = 560;
    if (!*(Class *)((char *)&self->super.super.super.isa + v15))
    {
      cachedThumbnails = self->_cachedThumbnails;
      if (!cachedThumbnails)
      {
        cachedThumbnails = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        self->_cachedThumbnails = cachedThumbnails;
        useLandscapeCache = self->_useLandscapeCache;
      }
      *(float *)&width = v8;
      v17 = -[PLVideoView _loadThumbnailsIntoDictionary:isLandscape:aspectRatio:](self, "_loadThumbnailsIntoDictionary:isLandscape:aspectRatio:", cachedThumbnails, useLandscapeCache, width, height);
      v18 = self->_useLandscapeCache;
      v19 = (objc_class *)v17;
      v20 = &OBJC_IVAR___PLVideoView__bakedLandscapeThumbnails;
      if (!v18)
        v20 = &OBJC_IVAR___PLVideoView__bakedPortraitThumbnails;
      *(Class *)((char *)&self->super.super.super.isa + *v20) = v19;
    }
    return v8;
  }
  return v7;
}

- (void)_removeScrubberUpdateTimer
{
  -[NSTimer invalidate](self->_scrubberUpdateTimer, "invalidate");

  self->_scrubberUpdateTimer = 0;
}

- (void)_resetScrubberUpdateTimer
{
  if (!self->_scrubberUpdateTimer)
    self->_scrubberUpdateTimer = (NSTimer *)(id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__updateScrubberValue, 0, 1, 0.25);
}

- (void)movieScrubberDidBeginScrubbing:(id)a3 withHandle:(int)a4
{
  char v6;
  double v7;
  AVPlayerItem *v8;
  CMTime v9;
  CMTime v10;

  -[PLVideoView _removeScrubberUpdateTimer](self, "_removeScrubberUpdateTimer", a3);
  if (-[PLVideoView playingToAirTunes](self, "playingToAirTunes"))
  {
    v6 = (32 * *((_BYTE *)self + 658)) & 0x80;
  }
  else if (-[PLMoviePlayerController playbackState](self->_moviePlayer, "playbackState") == 1)
  {
    v6 = 0x80;
  }
  else
  {
    v6 = 0;
  }
  *((_BYTE *)self + 657) = *((_BYTE *)self + 657) & 0x7F | v6;
  *((_BYTE *)self + 658) |= 0x20u;
  -[UIMovieScrubber value](self->_scrubber, "value");
  self->_lastScrubbedValue = v7;
  -[PLVideoView _hideVideoOverlay:](self, "_hideVideoOverlay:", 1);
  -[PLVideoView _hideTrimMessageView:](self, "_hideTrimMessageView:", 1);
  if (*((char *)self + 657) < 0)
  {
    -[PLVideoView pause](self, "pause");
    if (a4 == 2)
    {
      CMTimeMakeWithSeconds(&v10, self->_duration, 1);
      v8 = -[AVPlayer currentItem](-[PLMoviePlayerController player](self->_moviePlayer, "player"), "currentItem");
      v9 = v10;
      -[AVPlayerItem setForwardPlaybackEndTime:](v8, "setForwardPlaybackEndTime:", &v9);
    }
  }
}

- (void)movieScrubberDidEndScrubbing:(id)a3 withHandle:(int)a4
{
  double lastScrubbedValue;
  double v7;
  double v8;
  double v9;
  double v10;
  double lastActualValue;
  double v12;
  Float64 v14;
  AVPlayerItem *v15;
  CMTime v16;
  CMTime v17;

  *((_BYTE *)self + 658) &= ~0x20u;
  if (*((char *)self + 657) < 0)
  {
    if ((a4 - 1) <= 1)
    {
      lastScrubbedValue = self->_lastScrubbedValue;
      if (a4 == 2 && (*((_BYTE *)self + 658) & 0x40) != 0)
        *((_BYTE *)self + 658) &= ~0x40u;
      if ((*((_BYTE *)self + 658) & 8) != 0)
      {
        -[UIMovieScrubber trimStartValue](self->_scrubber, "trimStartValue", a3);
        v9 = v8;
        -[UIMovieScrubber trimEndValue](self->_scrubber, "trimEndValue");
        v10 = v7;
        lastActualValue = self->_lastActualValue;
        if (lastActualValue >= v9)
          v12 = self->_lastActualValue;
        else
          v12 = v9;
        if (v12 <= v7)
          v7 = v12;
        if (lastActualValue < v9 || v12 > v10)
          self->_lastActualValue = v7;
      }
      else
      {
        v7 = self->_lastActualValue;
      }
      -[UIMovieScrubber setValue:](self->_scrubber, "setValue:", a3, v7);
      -[PLVideoView _movieTimeFromScrubberTime:](self, "_movieTimeFromScrubberTime:", self->_lastActualValue);
      -[PLVideoView setCurrentTime:](self, "setCurrentTime:");
      self->_lastScrubbedValue = self->_lastActualValue;
      if (a4 == 2)
      {
        -[PLVideoView _movieTimeFromScrubberTime:](self, "_movieTimeFromScrubberTime:", lastScrubbedValue);
        CMTimeMakeWithSeconds(&v17, v14, 1);
        v15 = -[AVPlayer currentItem](-[PLMoviePlayerController player](self->_moviePlayer, "player"), "currentItem");
        v16 = v17;
        -[AVPlayerItem setForwardPlaybackEndTime:](v15, "setForwardPlaybackEndTime:", &v16);
      }
    }
    -[PLVideoView play](self, "play");
  }
  else
  {
    -[PLVideoView _invalidateSnapshotImage](self, "_invalidateSnapshotImage", a3, *(_QWORD *)&a4);
  }
}

- (void)_didScrubToValue:(double)a3 withHandle:(int)a4
{
  -[PLVideoView _hideVideoOverlay:](self, "_hideVideoOverlay:", 1);
  -[PLVideoView _hideTrimMessageView:](self, "_hideTrimMessageView:", 1);
  if ((*((_BYTE *)self + 658) & 0x20) != 0)
  {
    *((_BYTE *)self + 658) &= ~1u;
    *((_BYTE *)self + 658) = *((_BYTE *)self + 658) & 0xBF | ((self->_lastScrubbedValue < a3) << 6);
    self->_lastScrubbedValue = a3;
  }
  if ((a4 - 1) <= 1 && (*((char *)self + 657) & 0x80000000) == 0)
  {
    *((_BYTE *)self + 658) |= 1u;
    self->_lastScrubbedValue = -1.0;
  }
  -[PLVideoView _movieTimeFromScrubberTime:](self, "_movieTimeFromScrubberTime:", a3);
  -[PLVideoView setCurrentTime:](self, "setCurrentTime:");
}

- (void)movieScrubber:(id)a3 valueDidChange:(double)a4
{
  -[PLVideoView _didScrubToValue:withHandle:](self, "_didScrubToValue:withHandle:", 0, a4);
}

- (void)movieScrubber:(id)a3 editingStartValueDidChange:(double)a4
{
  -[PLVideoView _didScrubToValue:withHandle:](self, "_didScrubToValue:withHandle:", 1, a4);
}

- (void)movieScrubber:(id)a3 editingEndValueDidChange:(double)a4
{
  -[PLVideoView _didScrubToValue:withHandle:](self, "_didScrubToValue:withHandle:", 2, a4);
}

- (void)movieScrubberDidFinishRequestingThumbnails:(id)a3
{
  if ((*((_BYTE *)self + 659) & 4) != 0)
    *((_BYTE *)self + 660) &= ~4u;
  -[PLVideoView _serviceImageGenerationRequests](self, "_serviceImageGenerationRequests", a3);
}

- (void)movieScrubberDidBeginEditing:(id)a3
{
  *((_BYTE *)self + 658) |= 8u;
  -[PLVideoView _updateForEditing](self, "_updateForEditing", a3);
}

- (void)movieScrubber:(id)a3 widthDelta:(float)a4 originXDelta:(float)a5
{
  double v7;

  -[UIMovieScrubber frame](self->_scrubber, "frame", a3);
  -[UIMovieScrubber setFrame:](self->_scrubber, "setFrame:", v7 + a5);
}

- (void)movieScrubber:(id)a3 willZoomToMinimumValue:(double)a4 maximumValue:(double)a5
{
  -[PLSlalomRegionEditor setZoomMinValue:maxValue:](self->_slalomRegionEditor, "setZoomMinValue:maxValue:", a3, a4, a5);
}

- (void)_addThumbnailRequestForTimestamp:(id)a3 isSummaryThumbnail:(BOOL)a4
{
  pl_dispatch_sync();
}

- (void)_serviceImageGenerationRequests
{
  double v3;
  double v4;

  objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->_imageGenerators, "firstObject"), "imageGenerator"), "maximumSize");
  if (v4 != self->_thumbnailSize.width || v3 != self->_thumbnailSize.height)
  {
    -[PLVideoView _clearImageGenerators](self, "_clearImageGenerators");
    -[PLVideoView _createImageGenerators](self, "_createImageGenerators");
  }
  pl_dispatch_sync();
}

- (void)_configureImageGenerator:(id)a3 thumbnailSize:(CGSize)thumbnailSize forSummaryThumbnails:(BOOL)a5
{
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  if (thumbnailSize.width == *MEMORY[0x1E0C9D820] && thumbnailSize.height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    thumbnailSize = self->_thumbnailSize;
  objc_msgSend(a3, "setMaximumSize:", thumbnailSize.width, thumbnailSize.height);
  objc_msgSend(a3, "setApertureMode:", *MEMORY[0x1E0C89EC8]);
  objc_msgSend(a3, "setAppliesPreferredTrackTransform:", 1);
  if (!a5 && (-[PLManagedAsset isStreamedVideo](self->_videoCameraImage, "isStreamedVideo") & 1) == 0)
  {
    v13 = *MEMORY[0x1E0CA2E68];
    v10 = v13;
    v14 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v9 = v14;
    objc_msgSend(a3, "setRequestedTimeToleranceBefore:", &v13);
    v11 = v10;
    v12 = v9;
    objc_msgSend(a3, "setRequestedTimeToleranceAfter:", &v11);
  }
}

- (void)_clearImageGenerators
{

  self->_imageGenerators = 0;
}

- (void)_createImageGenerators
{
  id v3;
  PLAssetImageGenerator *v4;
  PLAssetImageGenerator *v5;

  v3 = -[PLVideoView _thumbnailSourceAsset](self, "_thumbnailSourceAsset");
  v4 = -[PLAssetImageGenerator initWithAsset:]([PLAssetImageGenerator alloc], "initWithAsset:", v3);
  v5 = -[PLAssetImageGenerator initWithAsset:]([PLAssetImageGenerator alloc], "initWithAsset:", v3);
  self->_imageGenerators = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v4, v5, 0);
}

- (void)setMaximumTrimLength:(double)a3
{
  self->_maximumTrimLength = a3;
  -[UIMovieScrubber setMaximumTrimLength:](self->_scrubber, "setMaximumTrimLength:");
}

- (void)showTrimMessage:(id)a3 withBottomY:(float)a4
{
  PLVideoEditingOverlayView *trimMessageView;
  PLVideoEditingOverlayView *v8;
  CGRect v9;
  CGRect v10;

  if ((*((_BYTE *)self + 658) & 4) == 0)
  {
    trimMessageView = self->_trimMessageView;
    if (!trimMessageView)
    {
      -[PLVideoView bounds](self, "bounds");
      v10 = CGRectInset(v9, 10.0, 0.0);
      v8 = -[PLVideoEditingOverlayView initWithFrame:]([PLVideoEditingOverlayView alloc], "initWithFrame:", v10.origin.x, (float)(a4 + -90.0), v10.size.width, 90.0);
      self->_trimMessageView = v8;
      -[PLVideoEditingOverlayView setTitle:](v8, "setTitle:", a3);
      -[PLVideoEditingOverlayView setBody:](self->_trimMessageView, "setBody:", PLLocalizedFrameworkString());
      -[PLVideoEditingOverlayView setAutoresizingMask:](self->_trimMessageView, "setAutoresizingMask:", 10);
      -[PLVideoView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_trimMessageView, self->_posterFrameView);
      trimMessageView = self->_trimMessageView;
    }
    -[PLVideoEditingOverlayView setAlpha:](trimMessageView, "setAlpha:", a3, 1.0);
  }
}

- (void)hideTrimMessage
{
  -[PLVideoView _hideTrimMessageView:](self, "_hideTrimMessageView:", 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  char v5;
  char v6;
  _BOOL8 v7;
  char v8;

  v5 = *((_BYTE *)self + 658);
  v6 = v5 & 8;
  if (((((v5 & 8) == 0) ^ a3) & 1) != 0)
  {
LABEL_7:
    if (!v6)
      return;
    goto LABEL_8;
  }
  v7 = a4;
  if (a3)
    v8 = 8;
  else
    v8 = 0;
  *((_BYTE *)self + 658) = v5 & 0xF7 | v8;
  -[PLVideoView _updateForEditing](self, "_updateForEditing");
  -[UIMovieScrubber setEditing:animated:](self->_scrubber, "setEditing:animated:", (*((unsigned __int8 *)self + 658) >> 3) & 1, v7);
  if ((*((_BYTE *)self + 658) & 8) == 0)
  {
    -[UIMovieScrubber value](self->_scrubber, "value");
    -[PLVideoView _movieTimeFromScrubberTime:](self, "_movieTimeFromScrubberTime:");
    -[PLVideoView setCurrentTime:](self, "setCurrentTime:");
    v6 = *((_BYTE *)self + 658) & 8;
    goto LABEL_7;
  }
LABEL_8:
  *((_BYTE *)self + 658) |= 1u;
  *((_BYTE *)self + 657) &= ~0x80u;
  -[PLVideoView pause](self, "pause");
}

- (void)setEditing:(BOOL)a3
{
  -[PLVideoView setEditing:animated:](self, "setEditing:animated:", a3, 1);
}

- (BOOL)isEditing
{
  return (*((unsigned __int8 *)self + 658) >> 3) & 1;
}

- (void)_updateSlalomRegionEditorState
{
  _BOOL8 v3;

  if ((*((_BYTE *)self + 657) & 4) == 0
    || -[PLVideoView _localVideoUnavailable](self, "_localVideoUnavailable")
    || -[PLVideoView isEditing](self, "isEditing"))
  {
    v3 = 0;
  }
  else
  {
    v3 = (*((_BYTE *)self + 657) & 0x10) == 0 || *((char *)self + 659) < 0;
  }
  -[PLSlalomRegionEditor setEnabled:](self->_slalomRegionEditor, "setEnabled:", v3);
}

- (void)_setPlaying:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_BYTE *)self + 658) = *((_BYTE *)self + 658) & 0xFB | v3;
}

- (void)_setPlaybackDidBegin:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 660) = *((_BYTE *)self + 660) & 0xFD | v3;
  -[PLVideoView _updatePosterFrameVisibility](self, "_updatePosterFrameVisibility");
}

- (void)_reset
{
  NSObject *Log;
  uint8_t v4[16];

  -[PLVideoView _removeScrubberUpdateTimer](self, "_removeScrubberUpdateTimer");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  -[PLVideoView _setPlaying:](self, "_setPlaying:", 0);
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) pause due to reset", v4, 2u);
  }
  -[PLMoviePlayerController pause](self->_moviePlayer, "pause");
  -[PLMoviePlayerController setPlayerItem:startTime:](self->_moviePlayer, "setPlayerItem:startTime:", 0, 0.0);
  *((_BYTE *)self + 659) &= ~8u;
  *((_BYTE *)self + 659) &= ~0x10u;
  *((_BYTE *)self + 659) &= ~2u;
  *((_BYTE *)self + 659) &= ~0x20u;
  -[PLVideoView _setPlaybackDidBegin:](self, "_setPlaybackDidBegin:", 0);

  self->__videoAVObjectBuilder = 0;
  -[PLVideoView _setDuration:](self, "_setDuration:", self->_duration);
  self->_cachedCurrentPlaybackTime = 0.0;
  -[UIMovieScrubber setEditing:](self->_scrubber, "setEditing:", 0);
  -[UIMovieScrubber setValue:](self->_scrubber, "setValue:", 0.0);
  -[UIMovieScrubber setDelegate:](self->_scrubber, "setDelegate:", 0);
  if ((*((_BYTE *)self + 658) & 0x10) != 0)
  {
    -[UIMovieScrubber setEditable:](self->_scrubber, "setEditable:", 0);
    *((_BYTE *)self + 658) &= ~0x10u;
  }

  self->_cachedThumbnails = 0;
  self->_bakedPortraitThumbnails = 0;

  self->_bakedLandscapeThumbnails = 0;
  self->_landscapeSummaryThumbnailTimestamps = 0;

  self->_portraitSummaryThumbnailTimestamps = 0;
  self->_thumbnailSize = (CGSize)*MEMORY[0x1E0C9D820];
  *((_BYTE *)self + 658) &= ~0x80u;
  -[PLVideoView _updatePosterFrameVisibility](self, "_updatePosterFrameVisibility");
  -[PLVideoView viewDidAppear](self, "viewDidAppear");
}

- (double)_scrubberStartTime
{
  double result;

  -[UIMovieScrubber trimStartValue](self->_scrubber, "trimStartValue");
  return result;
}

- (double)startTime
{
  double result;

  -[PLVideoView _scrubberStartTime](self, "_scrubberStartTime");
  -[PLVideoView _movieTimeFromScrubberTime:](self, "_movieTimeFromScrubberTime:");
  return result;
}

- (double)endTime
{
  double v3;
  double result;

  -[UIMovieScrubber trimEndValue](self->_scrubber, "trimEndValue");
  if (v3 == 0.0)
    return self->_duration;
  -[PLVideoView _movieTimeFromScrubberTime:](self, "_movieTimeFromScrubberTime:");
  return result;
}

- (id)newPreviewImageData:(id *)a3
{
  AVAsset *v5;
  void *v6;
  double v7;
  double v8;
  float v9;
  double v10;
  void *v11;
  void *v12;
  Float64 v13;
  CGImage *v14;
  uint64_t v15;
  NSData *v16;
  CMTime v18;
  uint64_t v19;

  v5 = -[AVPlayerItem asset](-[AVPlayer currentItem](-[PLMoviePlayerController player](self->_moviePlayer, "player"), "currentItem"), "asset");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0D75130], "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v5);
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", 0), "naturalSize");
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v9 = v7 / v8;
  v10 = rint(v9 * 110.0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFC8]), "initWithAsset:", v5);
  objc_msgSend(v11, "setApertureMode:", *MEMORY[0x1E0C89EC8]);
  objc_msgSend(v11, "setMaximumSize:", v10, 110.0);
  objc_msgSend(v11, "setAppliesPreferredTrackTransform:", 1);
  v19 = 0;
  v12 = (void *)MEMORY[0x1E0D75130];
  -[PLVideoView startTime](self, "startTime");
  CMTimeMakeWithSeconds(&v18, v13, 1);
  v14 = (CGImage *)objc_msgSend(v12, "copyCGImageFromImageGenerator:atTime:actualTime:error:", v11, &v18, 0, &v19);
  if (!v14)
  {
    -[PLVideoView startTime](self, "startTime");
    NSLog(CFSTR("Unable to copy CGImage at time:%f, error:[%@]"), v15, v19);
  }
  if (a3)
    *a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", v14);
  v16 = UIImageJPEGRepresentation((UIImage *)objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v14), 0.899999976);
  CGImageRelease(v14);

  return v16;
}

- (id)_videoSnapshot
{
  UIView *v3;
  UIView *v4;
  __IOSurface *v5;
  __IOSurface *v6;
  void *BaseAddress;
  size_t BytesPerRow;
  size_t Width;
  unint64_t Height;
  CGColorSpace *DeviceRGB;
  CGContext *v12;
  double v13;
  CGFloat v14;
  CGImageRef Image;
  CGImage *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGImageRef v21;
  CGAffineTransform v23;
  CGRect v24;

  v3 = -[PLMoviePlayerView videoView](-[PLMoviePlayerController view](self->_moviePlayer, "view"), "videoView");
  v4 = v3;
  if (v3)
  {
    if ((*((_BYTE *)self + 659) & 8) != 0
      && (v5 = (__IOSurface *)-[UIView _createIOSurfaceWithPadding:](v3, "_createIOSurfaceWithPadding:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24))) != 0)
    {
      v6 = v5;
      IOSurfaceLock(v5, 1u, 0);
      BaseAddress = IOSurfaceGetBaseAddress(v6);
      BytesPerRow = IOSurfaceGetBytesPerRow(v6);
      Width = IOSurfaceGetWidth(v6);
      Height = IOSurfaceGetHeight(v6);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v12 = CGBitmapContextCreate(BaseAddress, Width, Height, 8uLL, BytesPerRow, DeviceRGB, 0x2002u);
      CGColorSpaceRelease(DeviceRGB);
      if (v12)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen"), "scale");
        v14 = v13;
        CGContextTranslateCTM(v12, 0.0, (double)Height);
        CGContextScaleCTM(v12, v14, -v14);
        CGAffineTransformMakeScale(&v23, v14, -v14);
        CGContextSetBaseCTM();
        Image = CGBitmapContextCreateImage(v12);
        if (!Image)
          goto LABEL_10;
        v16 = Image;
        -[UIView videoRect](v4, "videoRect");
        v24.origin.x = v14 * v17;
        v24.origin.y = v14 * v18;
        v24.size.width = v14 * v19;
        v24.size.height = v14 * v20;
        v21 = CGImageCreateWithImageInRect(v16, v24);
        CFRelease(v16);
        if (v21)
        {
          v4 = (UIView *)objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v21, 0, v14);
          CFRelease(v21);
        }
        else
        {
LABEL_10:
          v4 = 0;
        }
        CFRelease(v12);
      }
      else
      {
        v4 = 0;
      }
      IOSurfaceUnlock(v6, 1u, 0);
      CFRelease(v6);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (UIImageView)previewImageView
{
  return (UIImageView *)-[PLVideoPosterFrameView imageView](self->_posterFrameView, "imageView");
}

- (PLManagedAsset)videoCameraImage
{
  return self->_videoCameraImage;
}

- (PLPhotoTileViewController)imageTile
{
  return self->_imageTile;
}

- (void)setImageTile:(id)a3
{
  self->_imageTile = (PLPhotoTileViewController *)a3;
}

- (void)toggleScaleMode:(float)a3
{
  PLMoviePlayerView *v5;
  int64_t v6;
  PLVideoPosterFrameView *posterFrameView;
  _QWORD v8[5];

  v5 = -[PLMoviePlayerController view](self->_moviePlayer, "view");
  if (self->_scaleMode == 1)
    v6 = 2;
  else
    v6 = 1;
  self->_scaleMode = v6;
  -[PLMoviePlayerView setScaleMode:duration:](v5, "setScaleMode:duration:", a3);
  -[PLVideoView _invalidateSnapshotImage](self, "_invalidateSnapshotImage");
  posterFrameView = self->_posterFrameView;
  if (posterFrameView)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __31__PLVideoView_toggleScaleMode___block_invoke;
    v8[3] = &unk_1E70B6370;
    v8[4] = self;
    if (a3 <= 0.0)
    {
      -[PLVideoPosterFrameView setScaleMode:](posterFrameView, "setScaleMode:", self->_scaleMode);
      -[PLVideoPosterFrameView layoutIfNeeded](self->_posterFrameView, "layoutIfNeeded");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v8, a3);
    }
  }
}

- (void)handleDoubleTap
{
  double v3;

  if (!-[PLMoviePlayerView destinationPlaceholderStyle](-[PLMoviePlayerController view](self->_moviePlayer, "view"), "destinationPlaceholderStyle"))
  {
    LODWORD(v3) = 1045220557;
    -[PLVideoView toggleScaleMode:](self, "toggleScaleMode:", v3);
  }
}

- (BOOL)isPlaying
{
  return (*((unsigned __int8 *)self + 658) >> 2) & 1;
}

- (void)_didBeginPlayback
{
  -[PLVideoView _removePlaySpinner](self, "_removePlaySpinner");
  -[UIMovieScrubber setThumbIsVisible:](self->_scrubber, "setThumbIsVisible:", 1);
  if ((*((_BYTE *)self + 660) & 2) == 0)
  {
    -[PLVideoView _setPlaybackDidBegin:](self, "_setPlaybackDidBegin:", 1);
    -[PLVideoView _hideVideoOverlay:](self, "_hideVideoOverlay:", 1);
    -[PLVideoView _hideTrimMessageView:](self, "_hideTrimMessageView:", 1);
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[PLVideoViewDelegate videoViewDidBeginPlayback:](self->_delegate, "videoViewDidBeginPlayback:", self);
    }
  }
  -[PLVideoView _updatePosterFrameVisibility](self, "_updatePosterFrameVisibility");
}

- (void)_verifyOrRestartPlayback
{
  NSObject *Log;
  int v4;
  int v5;
  float v6;
  float v7;
  NSObject *v8;
  _BOOL4 v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (*((unsigned __int8 *)self + 658) >> 2) & 1;
    v5 = (*((unsigned __int8 *)self + 659) >> 5) & 1;
    v10[0] = 67109376;
    v10[1] = v4;
    v11 = 1024;
    v12 = v5;
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) _verifyOrRestartPlayback playing %u didBuffer %u", (uint8_t *)v10, 0xEu);
  }
  if ((*((_BYTE *)self + 658) & 4) != 0 && (*((_BYTE *)self + 659) & 0x20) != 0)
  {
    -[PLMoviePlayerController playbackRate](self->_moviePlayer, "playbackRate");
    v7 = v6;
    v8 = PLPhotoSharingGetLog();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7 <= 0.0)
    {
      if (v9)
      {
        LOWORD(v10[0]) = 0;
        _os_log_impl(&dword_1B9897000, v8, OS_LOG_TYPE_DEFAULT, "(video-playback) _verifyOrRestartPlayback telling movie player to play", (uint8_t *)v10, 2u);
      }
      -[PLVideoView _removePlaySpinner](self, "_removePlaySpinner");
      -[PLMoviePlayerController playDueToEnoughData](self->_moviePlayer, "playDueToEnoughData");
    }
    else
    {
      if (v9)
      {
        LOWORD(v10[0]) = 0;
        _os_log_impl(&dword_1B9897000, v8, OS_LOG_TYPE_DEFAULT, "(video-playback) _verifyOrRestartPlayback rate > 0", (uint8_t *)v10, 2u);
      }
      -[PLVideoView _didBeginPlayback](self, "_didBeginPlayback");
    }
    if (self->_videoStreamingStartTime > 0.0)
      self->_videoStreamingStartTime = 0.0;
    -[PLVideoView _removeScrubberUpdateTimer](self, "_removeScrubberUpdateTimer");
    -[PLVideoView _resetScrubberUpdateTimer](self, "_resetScrubberUpdateTimer");
  }
}

- (BOOL)playingToAirTunes
{
  return -[PLMoviePlayerController isExternalPlayback](self->_moviePlayer, "isExternalPlayback");
}

- (BOOL)playingToVideoOut
{
  return -[PLMoviePlayerController videoOutActive](self->_moviePlayer, "videoOutActive");
}

- (void)_displayPlaySpinner
{
  UIActivityIndicatorView *v3;

  if (!self->_shadowSpinner)
  {
    v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    self->_shadowSpinner = v3;
    -[PLVideoView addSubview:](self, "addSubview:", v3);
  }
  if (!self->_spinner)
  {
    self->_spinner = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor"));
    -[PLVideoView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_spinner, self->_shadowSpinner);
  }
  -[PLVideoView setNeedsLayout](self, "setNeedsLayout");
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  -[UIActivityIndicatorView startAnimating](self->_shadowSpinner, "startAnimating");
}

- (void)_removePlaySpinner
{
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
  -[UIActivityIndicatorView stopAnimating](self->_shadowSpinner, "stopAnimating");
  -[UIActivityIndicatorView removeFromSuperview](self->_spinner, "removeFromSuperview");
  -[UIActivityIndicatorView removeFromSuperview](self->_shadowSpinner, "removeFromSuperview");
  self->_spinner = 0;
  self->_shadowSpinner = 0;
}

- (void)play
{
  NSObject *Log;
  NSObject *v4;
  NSString *pathToOriginalVideo;
  const char *v6;
  _BOOL4 v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  Float64 v13;
  AVPlayerItem *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  PLManagedAsset *videoCameraImage;
  CMTime v19;
  CMTime v20;
  _QWORD v21[5];
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  self->_videoStreamingStartTime = CFAbsoluteTimeGetCurrent();
  -[PLVideoView _insertMoviePlayerViewIfNecessary](self, "_insertMoviePlayerViewIfNecessary");
  -[PLVideoView _hideVideoOverlay:](self, "_hideVideoOverlay:", 1);
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = objc_opt_class();
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) play in %@", buf, 0xCu);
  }
  if (!-[PLVideoView _mediaIsCloudSharedStreamedVideo](self, "_mediaIsCloudSharedStreamedVideo"))
    goto LABEL_8;
  if (-[PLVideoView _canPlayCloudSharedStreamedVideoWithLocalVideo](self, "_canPlayCloudSharedStreamedVideoWithLocalVideo"))
  {
    v4 = PLPhotoSharingGetLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:
      if (-[PLVideoView _shouldStreamVideo](self, "_shouldStreamVideo"))
        -[PLVideoView _displayPlaySpinner](self, "_displayPlaySpinner");
      v7 = -[PLVideoView _prepareMoviePlayerIfNeeded](self, "_prepareMoviePlayerIfNeeded");
      v8 = *((_BYTE *)self + 658);
      -[PLVideoView _setPlaying:](self, "_setPlaying:", 1);
      if (v7)
      {
        if ((*((_BYTE *)self + 658) & 1) != 0)
        {
          if ((*((_BYTE *)self + 658) & 8) != 0)
          {
            -[PLVideoView _scrubberStartTime](self, "_scrubberStartTime");
            -[UIMovieScrubber setValue:animated:](self->_scrubber, "setValue:animated:", 0);
            -[PLVideoView startTime](self, "startTime");
            -[PLVideoView setCurrentTime:](self, "setCurrentTime:");
            -[PLVideoView endTime](self, "endTime");
            CMTimeMakeWithSeconds(&v20, v13, 1);
            v14 = -[AVPlayer currentItem](-[PLMoviePlayerController player](self->_moviePlayer, "player"), "currentItem");
            v19 = v20;
            -[AVPlayerItem setForwardPlaybackEndTime:](v14, "setForwardPlaybackEndTime:", &v19);
            -[PLMoviePlayerController play](self->_moviePlayer, "play");
          }
          else
          {
            -[UIMovieScrubber setValue:animated:](self->_scrubber, "setValue:animated:", 0, 0.0);
            -[PLMoviePlayerController playFromBeginning](self->_moviePlayer, "playFromBeginning");
          }
          *((_BYTE *)self + 658) &= ~1u;
        }
        else
        {
          -[PLMoviePlayerController play](self->_moviePlayer, "play");
        }
        -[PLVideoView _verifyOrRestartPlayback](self, "_verifyOrRestartPlayback");
        if ((v8 & 4) == 0 && self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
          -[PLVideoViewDelegate videoViewDidBeginPlayback:](self->_delegate, "videoViewDidBeginPlayback:", self);
      }
      return;
    }
    pathToOriginalVideo = self->_pathToOriginalVideo;
    *(_DWORD *)buf = 138412290;
    v23 = (uint64_t)pathToOriginalVideo;
    v6 = "(streamed-video-playback) will play streamed video using original video at path %@";
LABEL_7:
    _os_log_impl(&dword_1B9897000, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
    goto LABEL_8;
  }
  v9 = -[PLManagedAsset cachedNonPersistedVideoPlaybackURLError](self->_videoCameraImage, "cachedNonPersistedVideoPlaybackURLError");
  if (v9)
  {
    v10 = (void *)v9;
    v11 = PLLocalizedFrameworkString();
    v12 = objc_msgSend(v10, "localizedDescription");
    objc_msgSend((id)-[PLVideoView window](self, "window"), "pl_presentViewController:animated:", objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v11, v12, 1), 1);
    -[PLManagedAsset setCachedNonPersistedVideoPlaybackURLError:](self->_videoCameraImage, "setCachedNonPersistedVideoPlaybackURLError:", 0);
    return;
  }
  -[PLVideoView _displayPlaySpinner](self, "_displayPlaySpinner");
  if (-[PLManagedAsset cachedNonPersistedVideoPlaybackURL](self->_videoCameraImage, "cachedNonPersistedVideoPlaybackURL"))
  {
    v4 = PLPhotoSharingGetLog();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    v15 = -[PLManagedAsset cachedNonPersistedVideoPlaybackURL](self->_videoCameraImage, "cachedNonPersistedVideoPlaybackURL");
    *(_DWORD *)buf = 138412290;
    v23 = v15;
    v6 = "(streamed-video-playback) already have a cachedNonPersistedVideoPlaybackURL %@";
    goto LABEL_7;
  }
  if (objc_msgSend(MEMORY[0x1E0D719E0], "isCellularConnection"))
  {
    v16 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9897000, v16, OS_LOG_TYPE_DEFAULT, "Playing 360p video for cellular connection.", buf, 2u);
    }
    v17 = 6;
  }
  else
  {
    v17 = 7;
  }
  videoCameraImage = self->_videoCameraImage;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __19__PLVideoView_play__block_invoke;
  v21[3] = &unk_1E70B6370;
  v21[4] = self;
  objc_msgSend(MEMORY[0x1E0D719E0], "requestVideoPlaybackURLForAsset:videoType:completion:", videoCameraImage, v17, v21);
}

- (void)pause
{
  NSObject *Log;
  uint8_t v4[16];

  -[PLVideoView _removeScrubberUpdateTimer](self, "_removeScrubberUpdateTimer");
  -[PLVideoView _removePlaySpinner](self, "_removePlaySpinner");
  -[PLVideoView _setPlaying:](self, "_setPlaying:", 0);
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) pause due to video view pause", v4, 2u);
  }
  -[PLMoviePlayerController pause](self->_moviePlayer, "pause");
  if ((*((_BYTE *)self + 658) & 8) != 0 && (*((_BYTE *)self + 658) & 0x20) == 0)
  {
    self->_lastScrubbedValue = -1.0;
    -[UIMovieScrubber setThumbIsVisible:](self->_scrubber, "setThumbIsVisible:", 0);
  }
  if ((*((_BYTE *)self + 658) & 0x20) == 0 && self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
    -[PLVideoViewDelegate videoViewDidEndPlayback:didFinish:](self->_delegate, "videoViewDidEndPlayback:didFinish:", self, 0);
}

- (void)stop
{
  char v3;
  NSObject *Log;
  uint8_t v5[16];

  -[PLVideoView _removeScrubberUpdateTimer](self, "_removeScrubberUpdateTimer");
  -[PLVideoView _removePlaySpinner](self, "_removePlaySpinner");
  if ((*((_BYTE *)self + 658) & 8) != 0)
    -[UIMovieScrubber setThumbIsVisible:](self->_scrubber, "setThumbIsVisible:", 0);
  v3 = *((_BYTE *)self + 658);
  if ((v3 & 4) != 0 || (*((_BYTE *)self + 660) & 2) != 0)
  {
    Log = PLPhotoSharingGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) pause due to stop", v5, 2u);
    }
    -[PLMoviePlayerController pause](self->_moviePlayer, "pause");
    -[PLVideoView _setPlaying:](self, "_setPlaying:", 0);
    -[PLVideoView _setPlaybackDidBegin:](self, "_setPlaybackDidBegin:", 0);
    self->_lastScrubbedValue = -1.0;
    if ((v3 & 4) != 0 && self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      -[PLVideoViewDelegate videoViewDidEndPlayback:didFinish:](self->_delegate, "videoViewDidEndPlayback:didFinish:", self, 0);
  }
}

- (void)_updateScrubberVisibilityWithDuration:(double)a3
{
  int v5;
  unsigned int v6;
  char v7;
  _QWORD v8[5];

  if ((*((_BYTE *)self + 657) & 2) != 0
    && (*((_BYTE *)self + 659) & 8) != 0
    && self->_duration > 0.0
    && -[PLVideoView _canAccessVideo](self, "_canAccessVideo"))
  {
    -[PLVideoView _createScrubberIfNeeded](self, "_createScrubberIfNeeded");
    -[UIMovieScrubber setEditable:](self->_scrubber, "setEditable:", -[PLVideoView canEdit](self, "canEdit"));
    -[PLVideoView _reloadScrubberThumbnailsIfNeeded](self, "_reloadScrubberThumbnailsIfNeeded");
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  v6 = *((unsigned __int8 *)self + 659);
  if (v5 != v6 >> 7)
  {
    if (v5)
      v7 = 0x80;
    else
      v7 = 0;
    *((_BYTE *)self + 659) = v7 & 0x80 | v6 & 0x7F;
    if ((*((_BYTE *)self + 657) & 0x10) != 0)
      -[UIMovieScrubber setEnabled:](self->_scrubber, "setEnabled:");
    -[PLVideoView _updateSlalomRegionEditorState](self, "_updateSlalomRegionEditorState");
    -[PLVideoView _updateScrubberFrame](self, "_updateScrubberFrame");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__PLVideoView__updateScrubberVisibilityWithDuration___block_invoke;
    v8[3] = &unk_1E70B6370;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v8, a3);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  *((_BYTE *)self + 657) |= 0x40u;
  if ((*((_BYTE *)self + 657) & 0x20) == 0)
  {
    *((_BYTE *)self + 657) |= 0x20u;
    -[PLMoviePlayerController requestToBecomeActiveController](self->_moviePlayer, "requestToBecomeActiveController", a3);
    -[PLVideoView _updatePosterImageView](self, "_updatePosterImageView");
    -[PLVideoView _updatePosterFrameVisibility](self, "_updatePosterFrameVisibility");
    if ((*((_BYTE *)self + 658) & 4) != 0
      || -[PLVideoView shouldPlayVideoWhenViewAppears](self, "shouldPlayVideoWhenViewAppears"))
    {
      -[PLVideoView _hideVideoOverlay:](self, "_hideVideoOverlay:", 1);
    }
    else
    {
      -[PLVideoView _showVideoOverlay](self, "_showVideoOverlay");
    }
  }
}

- (void)viewDidAppear
{
  -[PLVideoView _updateScrubberVisibilityWithDuration:](self, "_updateScrubberVisibilityWithDuration:", 0.0);
  if ((*((_BYTE *)self + 658) & 4) == 0
    && (*((_BYTE *)self + 659) & 0x40) == 0
    && !-[PLVideoView shouldPlayVideoWhenViewAppears](self, "shouldPlayVideoWhenViewAppears"))
  {
    -[PLVideoView _showVideoOverlay](self, "_showVideoOverlay");
  }
  if (-[PLVideoView loadMediaImmediately](self, "loadMediaImmediately"))
    -[PLVideoView _prepareMoviePlayerIfNeeded](self, "_prepareMoviePlayerIfNeeded");
  if (-[PLVideoView shouldPlayVideoWhenViewAppears](self, "shouldPlayVideoWhenViewAppears"))
  {
    -[PLVideoView play](self, "play");
    -[PLVideoView setShouldPlayVideoWhenViewAppears:](self, "setShouldPlayVideoWhenViewAppears:", 0);
  }
}

- (void)viewDidDisappear
{
  if ((*((_BYTE *)self + 657) & 0x20) != 0)
  {
    -[PLVideoView _setPlaybackDidBegin:](self, "_setPlaybackDidBegin:", 0);
    +[PLVideoView cancelPreviousPerformRequestsWithTarget:](PLVideoView, "cancelPreviousPerformRequestsWithTarget:", self);
    -[PLVideoView setShowsScrubber:duration:](self, "setShowsScrubber:duration:", 0, 0.0);
    -[PLVideoView _hideVideoOverlay:](self, "_hideVideoOverlay:", 0);
    *((_BYTE *)self + 657) &= ~0x20u;
    if ((*((_BYTE *)self + 660) & 4) != 0)
    {
      *((_BYTE *)self + 660) &= ~4u;
      -[PLVideoView _removeScrubber](self, "_removeScrubber");
    }
    -[PLVideoView stop](self, "stop");
    -[PLMoviePlayerController requestToResignAsActiveController](self->_moviePlayer, "requestToResignAsActiveController");
    -[PLMoviePlayerController tearDownTVOutWindow](self->_moviePlayer, "tearDownTVOutWindow");
  }
  -[PLVideoView _cancelAirplayExportSession](self, "_cancelAirplayExportSession");
  -[PLVideoView _commitPendingAdjustmentsUpdateAndWait:completionHandler:](self, "_commitPendingAdjustmentsUpdateAndWait:completionHandler:", 0, 0);
}

- (void)applicationWillResignActive
{
  -[PLVideoView _commitPendingAdjustmentsUpdateAndWait:completionHandler:](self, "_commitPendingAdjustmentsUpdateAndWait:completionHandler:", 0, 0);
}

- (void)applicationDidEnterBackground
{
  -[PLVideoView _commitPendingAdjustmentsUpdateAndWait:completionHandler:](self, "_commitPendingAdjustmentsUpdateAndWait:completionHandler:", 0, 0);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PLVideoView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)PLVideoView;
  -[PLVideoView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  if (self->_scrubber)
  {
    v17.origin.x = v9;
    v17.origin.y = v11;
    v17.size.width = v13;
    v17.size.height = v15;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    if (!CGRectEqualToRect(v17, v18))
      -[PLVideoView _setNeedsReloadScrubberThumbnails:](self, "_setNeedsReloadScrubberThumbnails:", 1);
  }
  if ((*((_BYTE *)self + 658) & 2) != 0 && (*((_BYTE *)self + 657) & 0x20) == 0)
  {
    -[UIMovieScrubber setDataSource:](self->_scrubber, "setDataSource:", 0);
    -[UIMovieScrubber setDelegate:](self->_scrubber, "setDelegate:", 0);
  }
}

- (void)willMoveToSuperview:(id)a3
{
  if (a3)
  {
    if ((*((_BYTE *)self + 658) & 4) != 0)
      -[PLVideoView _resetScrubberUpdateTimer](self, "_resetScrubberUpdateTimer");
  }
  else
  {
    -[PLVideoView _removeScrubberUpdateTimer](self, "_removeScrubberUpdateTimer");
  }
}

- (void)didMoveToSuperview
{
  void *v3;
  PLMoviePlayerView *v4;

  v3 = (void *)-[PLVideoView superview](self, "superview");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "bounds");
    -[PLVideoView setBounds:](self, "setBounds:");
    UIRectGetCenter();
    -[PLVideoView setCenter:](self, "setCenter:");
    v4 = -[PLMoviePlayerController view](self->_moviePlayer, "view");
    if ((PLVideoView *)-[PLMoviePlayerView superview](v4, "superview") == self)
    {
      -[PLVideoView bounds](self, "bounds");
      -[PLMoviePlayerView setFrame:](v4, "setFrame:");
    }
  }
}

- (void)setPosterFrameImage:(id)a3
{
  UIImage *posterFrameImage;

  if (a3)
  {
    posterFrameImage = self->_posterFrameImage;
    if (posterFrameImage != a3)
    {

      self->_posterFrameImage = (UIImage *)a3;
      -[PLVideoView _updatePosterImageView](self, "_updatePosterImageView");
    }
  }
}

- (UIImage)posterFrameImage
{
  return self->_posterFrameImage;
}

- (void)_updateSnapshotImage
{
  if ((*((_BYTE *)self + 659) & 8) != 0
    && (*((_BYTE *)self + 659) & 0x10) != 0
    && !-[PLMoviePlayerController isExternalPlayback](self->_moviePlayer, "isExternalPlayback"))
  {

    self->_snapshotImage = (UIImage *)-[PLVideoView _videoSnapshot](self, "_videoSnapshot");
    -[PLVideoView _updatePosterImageView](self, "_updatePosterImageView");
  }
}

- (void)_invalidateSnapshotImage
{

  self->_snapshotImage = 0;
}

- (void)_updatePosterImageView
{
  UIImage *snapshotImage;
  uint64_t v4;
  UIImage *posterFrameImage;
  uint64_t v6;
  UIImage *v7;
  UIImage *v8;

  if (-[PLVideoView _mediaIsVideo](self, "_mediaIsVideo")
    || -[PLVideoView _mediaIsCloudSharedStreamedVideo](self, "_mediaIsCloudSharedStreamedVideo"))
  {
    snapshotImage = self->_snapshotImage;
    if (!snapshotImage)
    {
      if (!self->_posterFrameImage && -[PLVideoView _didSetPhotoData](self, "_didSetPhotoData"))
      {
        if (PLGetPhotoLibraryClient() == 1)
        {
          v4 = -[PLManagedAsset pathForVideoPreviewFile](self->_videoCameraImage, "pathForVideoPreviewFile");
          posterFrameImage = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithContentsOfFile:", v4);
          self->_posterFrameImage = posterFrameImage;
        }
        else
        {
          posterFrameImage = self->_posterFrameImage;
        }
        if (!posterFrameImage)
        {
          v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser"), "fullScreenFormatForCurrentDevice"), "formatID");
          v7 = (UIImage *)objc_msgSend(MEMORY[0x1E0D717B8], "newSynchronousImageForAsset:withFormat:allowPlaceholder:outImageProperties:outDeliveredPlaceholder:", self->_videoCameraImage, v6, 1, 0, 0);
          self->_posterFrameImage = v7;
          if (!v7)
          {
            -[PLVideoView pathForVideoFile](self, "pathForVideoFile");
            PLPreviewImageAndDurationForVideoAtPath();
            self->_posterFrameImage = (UIImage *)0;
          }
        }
      }
      self->_scaleMode = 1;
      v8 = self->_posterFrameImage;
      if (v8)
      {
        -[UIImage size](v8, "size");
        -[PLVideoView _updateScaleModeForSize:](self, "_updateScaleModeForSize:");
      }
      else if (-[PLVideoView _canCreateMetadata](self, "_canCreateMetadata"))
      {
        *((_BYTE *)self + 660) |= 0x20u;
      }
      snapshotImage = self->_posterFrameImage;
    }
    -[PLVideoPosterFrameView setScaleMode:](self->_posterFrameView, "setScaleMode:", self->_scaleMode);
    -[PLVideoPosterFrameView setImage:](self->_posterFrameView, "setImage:", snapshotImage);
  }
}

- (void)_updatePosterFrameVisibility
{
  PLMoviePlayerView *v3;
  _BOOL8 v4;
  BOOL v5;
  char v6;
  float v7;
  int v8;
  NSObject *Log;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[PLMoviePlayerController view](self->_moviePlayer, "view");
  -[PLMoviePlayerView setScaleMode:](v3, "setScaleMode:", self->_scaleMode);
  if (-[PLMoviePlayerView destinationPlaceholderStyle](v3, "destinationPlaceholderStyle"))
    v4 = (*((_BYTE *)self + 660) & 2) == 0;
  else
    v4 = 0;
  v5 = -[PLVideoView _playerIsAirplay](self, "_playerIsAirplay");
  if ((*((_BYTE *)self + 659) & 8) == 0)
    goto LABEL_14;
  if (v5)
  {
    if (v4)
    {
LABEL_14:
      v8 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    v6 = (*((_BYTE *)self + 659) & 0x10) == 0 || v4;
    if ((v6 & 1) != 0)
      goto LABEL_14;
  }
  if (-[PLVideoView _shouldStreamVideo](self, "_shouldStreamVideo"))
  {
    -[PLMoviePlayerController playbackRate](self->_moviePlayer, "playbackRate");
    if (v7 < 1.0)
      goto LABEL_14;
  }
  v8 = 0;
LABEL_15:
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = v8;
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) update poster frame visibility to %d", (uint8_t *)v10, 8u);
  }
  -[PLVideoPosterFrameView setHidden:](self->_posterFrameView, "setHidden:", v8 ^ 1u);
  -[PLMoviePlayerView setDestinationPlaceholderHidden:](v3, "setDestinationPlaceholderHidden:", v4);
}

- (void)setShowsPlayOverlay:(BOOL)a3
{
  int v4;
  char v5;

  v4 = -[PLVideoView _canAccessVideo](self, "_canAccessVideo") && a3;
  v5 = *((_BYTE *)self + 657);
  if (((v4 ^ ((v5 & 1) == 0)) & 1) == 0)
  {
    *((_BYTE *)self + 657) = v5 & 0xFE | v4;
    if (!v4 || (*((_BYTE *)self + 658) & 4) != 0)
      -[PLVideoView _hideVideoOverlay:](self, "_hideVideoOverlay:", 0);
    else
      -[PLVideoView _showVideoOverlay](self, "_showVideoOverlay");
  }
}

- (BOOL)showsPlayOverlay
{
  return *((_BYTE *)self + 657) & 1;
}

- (void)setShowsScrubber:(BOOL)a3
{
  -[PLVideoView setShowsScrubber:duration:](self, "setShowsScrubber:duration:", a3, 0.0);
}

- (void)setShowsScrubber:(BOOL)a3 duration:(double)a4
{
  char v4;
  char v7;

  v4 = *((_BYTE *)self + 657);
  if (((((v4 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v7 = 2;
    else
      v7 = 0;
    *((_BYTE *)self + 657) = v4 & 0xFD | v7;
    if (a3 && self->_prepareMoviePlayerForScrubberAutomatically)
    {
      dispatch_time(0, 200000000);
      pl_dispatch_after();
    }
    -[PLVideoView _updateScrubberVisibilityWithDuration:](self, "_updateScrubberVisibilityWithDuration:", a4);
  }
}

- (BOOL)showsScrubber
{
  return (*((unsigned __int8 *)self + 657) >> 1) & 1;
}

- (void)notifyRequiredResourcesDownloaded
{
  if (-[PLVideoView _localVideoUnavailable](self, "_localVideoUnavailable"))
    -[PLVideoView _fetchLocalContentEditingInput](self, "_fetchLocalContentEditingInput");
}

- (void)setCanEdit:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 657);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 4;
    else
      v4 = 0;
    *((_BYTE *)self + 657) = v3 & 0xFB | v4;
    -[PLVideoView _updateScrubberVisibilityWithDuration:](self, "_updateScrubberVisibilityWithDuration:", 0.0);
  }
}

- (void)_setLocalVideoUnavailable:(BOOL)a3
{
  if (self->__localVideoUnavailable != a3)
  {
    self->__localVideoUnavailable = a3;
    -[PLVideoView _updateScrubberVisibilityWithDuration:](self, "_updateScrubberVisibilityWithDuration:", 0.0);
  }
}

- (BOOL)canEdit
{
  _BOOL4 v2;

  if ((*((_BYTE *)self + 657) & 4) != 0)
  {
    v2 = -[PLVideoView _canEditDuration:](self, "_canEditDuration:", self->_duration);
    if (v2)
      LOBYTE(v2) = !-[PLVideoView _localVideoUnavailable](self, "_localVideoUnavailable");
  }
  else
  {
    LOBYTE(v2) = 0;
  }
  return v2;
}

- (BOOL)_canEditDuration:(double)a3
{
  return fabs(a3 + -1.0) > 0.5;
}

- (void)setScrubberIsSubview:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_BYTE *)self + 657) = *((_BYTE *)self + 657) & 0xEF | v3;
}

- (BOOL)scrubberIsSubview
{
  return (*((unsigned __int8 *)self + 657) >> 4) & 1;
}

- (void)setLoadMediaImmediately:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 657) = *((_BYTE *)self + 657) & 0xF7 | v3;
}

- (BOOL)loadMediaImmediately
{
  return (*((unsigned __int8 *)self + 657) >> 3) & 1;
}

- (void)setCurrentTime:(double)a3
{
  self->_cachedCurrentPlaybackTime = a3;
  if ((*((_BYTE *)self + 659) & 8) != 0)
    -[PLMoviePlayerController setCurrentTime:timeSnapOption:](self->_moviePlayer, "setCurrentTime:timeSnapOption:", 2);
}

- (double)currentTime
{
  double result;

  result = 0.0;
  if ((*((_BYTE *)self + 659) & 8) != 0)
    -[PLMoviePlayerController currentTime](self->_moviePlayer, "currentTime", 0.0);
  self->_cachedCurrentPlaybackTime = result;
  return result;
}

- (void)_scrubToMovieTime:(double)a3
{
  double v5;
  double v6;

  -[PLVideoView _scrubberTimeFromMovieTime:](self, "_scrubberTimeFromMovieTime:");
  v6 = v5;
  -[UIMovieScrubber setValue:](self->_scrubber, "setValue:");
  -[PLVideoView setCurrentTime:](self, "setCurrentTime:", a3);
  self->_lastScrubbedValue = v6;
}

- (void)notifyOfChange:(id)a3 shouldReloadBlock:(id)a4
{
  int64_t expectedNotificationsCount;
  BOOL v8;
  int64_t v9;
  uint64_t v10;

  if (!objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "isRecognizedFormat"))goto LABEL_5;
  if (!objc_msgSend((id)objc_msgSend(a3, "changeDetailsForObject:", -[PLManagedAsset pl_PHAssetFromPhotoLibrary:](self->_videoCameraImage, "pl_PHAssetFromPhotoLibrary:", pl_appPhotoLibrary())), "assetContentChanged"))
  {
    v10 = 0;
    goto LABEL_7;
  }
  expectedNotificationsCount = self->__expectedNotificationsCount;
  v8 = expectedNotificationsCount < 1;
  v9 = expectedNotificationsCount - 1;
  if (v8)
  {
LABEL_5:
    v10 = 1;
  }
  else
  {
    v10 = 0;
    self->__expectedNotificationsCount = v9;
  }
LABEL_7:
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v10);
}

- (BOOL)_scrubberTimeNeedsMapping
{
  int v3;

  v3 = -[PLVideoView _shouldShowSlalomEditor](self, "_shouldShowSlalomEditor");
  if (v3)
    LOBYTE(v3) = objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "hasSlowMotionAdjustments");
  return v3;
}

- (double)_movieScrubberDuration
{
  double duration;
  void *v4;
  CMTime time;

  duration = self->_duration;
  if (-[PLVideoView _scrubberTimeNeedsMapping](self, "_scrubberTimeNeedsMapping"))
  {
    v4 = (void *)-[PFVideoAVObjectBuilder videoAsset](self->__videoAVObjectBuilder, "videoAsset");
    if (v4)
      objc_msgSend(v4, "duration");
    else
      memset(&time, 0, sizeof(time));
    return CMTimeGetSeconds(&time);
  }
  return duration;
}

- (id)_thumbnailSourceAsset
{
  if (objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "hasSlowMotionAdjustments"))return (id)-[PFVideoAVObjectBuilder videoAsset](self->__videoAVObjectBuilder, "videoAsset");
  else
    return -[AVPlayerItem asset](-[AVPlayer currentItem](-[PLMoviePlayerController player](self->_moviePlayer, "player"), "currentItem"), "asset");
}

- (double)_thumbnailTimeFromScrubberTime:(double)a3
{
  PFVideoAVObjectBuilder *videoAVObjectBuilder;
  _BYTE v7[56];
  CMTime v8;

  if (!-[PLVideoView _scrubberTimeNeedsMapping](self, "_scrubberTimeNeedsMapping"))
  {
    memset(&v8, 0, sizeof(v8));
    CMTimeMakeWithSeconds(&v8, a3, objc_msgSend(MEMORY[0x1E0D75298], "preferredTimeScale"));
    memset(&v7[32], 0, 24);
    videoAVObjectBuilder = self->__videoAVObjectBuilder;
    if (videoAVObjectBuilder)
    {
      *(CMTime *)v7 = v8;
      -[PFVideoAVObjectBuilder convertToOriginalTimeFromScaledTime:forExport:](videoAVObjectBuilder, "convertToOriginalTimeFromScaledTime:forExport:", v7, 0);
    }
    *(CMTime *)v7 = *(CMTime *)&v7[32];
    return CMTimeGetSeconds((CMTime *)v7);
  }
  return a3;
}

- (double)_movieTimeFromScrubberTime:(double)a3
{
  PFVideoAVObjectBuilder *videoAVObjectBuilder;
  _BYTE v7[56];
  CMTime v8;

  if (-[PLVideoView _scrubberTimeNeedsMapping](self, "_scrubberTimeNeedsMapping"))
  {
    memset(&v8, 0, sizeof(v8));
    CMTimeMakeWithSeconds(&v8, a3, objc_msgSend(MEMORY[0x1E0D75298], "preferredTimeScale"));
    memset(&v7[32], 0, 24);
    videoAVObjectBuilder = self->__videoAVObjectBuilder;
    if (videoAVObjectBuilder)
    {
      *(CMTime *)v7 = v8;
      -[PFVideoAVObjectBuilder convertToScaledTimeFromOriginalTime:forExport:](videoAVObjectBuilder, "convertToScaledTimeFromOriginalTime:forExport:", v7, 0);
    }
    *(CMTime *)v7 = *(CMTime *)&v7[32];
    return CMTimeGetSeconds((CMTime *)v7);
  }
  return a3;
}

- (double)_scrubberTimeFromMovieTime:(double)a3
{
  PFVideoAVObjectBuilder *videoAVObjectBuilder;
  _BYTE v7[56];
  CMTime v8;

  if (-[PLVideoView _scrubberTimeNeedsMapping](self, "_scrubberTimeNeedsMapping"))
  {
    memset(&v8, 0, sizeof(v8));
    CMTimeMakeWithSeconds(&v8, a3, objc_msgSend(MEMORY[0x1E0D75298], "preferredTimeScale"));
    memset(&v7[32], 0, 24);
    videoAVObjectBuilder = self->__videoAVObjectBuilder;
    if (videoAVObjectBuilder)
    {
      *(CMTime *)v7 = v8;
      -[PFVideoAVObjectBuilder convertToOriginalTimeFromScaledTime:forExport:](videoAVObjectBuilder, "convertToOriginalTimeFromScaledTime:forExport:", v7, 0);
    }
    *(CMTime *)v7 = *(CMTime *)&v7[32];
    return CMTimeGetSeconds((CMTime *)v7);
  }
  return a3;
}

- (void)_screenDidConnect:(id)a3
{
  -[PLVideoView _handleScreenConnectionChange:](self, "_handleScreenConnectionChange:", 1);
}

- (void)_screenDidDisconnect:(id)a3
{
  -[PLVideoView _handleScreenConnectionChange:](self, "_handleScreenConnectionChange:", 0);
}

- (void)_handleScreenConnectionChange:(BOOL)a3
{
  if ((*((_BYTE *)self + 660) & 2) != 0)
  {
    -[PLVideoView stop](self, "stop", a3);
    -[PLVideoPosterFrameView setHidden:](self->_posterFrameView, "setHidden:", 1);
    -[PLMoviePlayerView setDestinationPlaceholderHidden:](-[PLMoviePlayerController view](self->_moviePlayer, "view"), "setDestinationPlaceholderHidden:", 0);
    -[PLVideoView _showVideoOverlay](self, "_showVideoOverlay");
  }
}

- (id)_moviePlayer
{
  return self->_moviePlayer;
}

- (void)_playbackFinished
{
  double duration;

  if ((*((_BYTE *)self + 658) & 4) != 0)
  {
    -[PLVideoView _setPlaying:](self, "_setPlaying:", 0);
    if ((*((_BYTE *)self + 658) & 8) != 0)
      -[UIMovieScrubber setThumbIsVisible:](self->_scrubber, "setThumbIsVisible:", 0);
    -[PLVideoView _removeScrubberUpdateTimer](self, "_removeScrubberUpdateTimer");
    self->_lastScrubbedValue = -1.0;
    *((_BYTE *)self + 658) |= 1u;
    -[PLVideoView _setPlaybackDidBegin:](self, "_setPlaybackDidBegin:", 0);
    self->_lastActualValue = 0.0;
    if (-[PLMoviePlayerController playbackState](self->_moviePlayer, "playbackState"))
    {
      duration = self->_duration;
    }
    else
    {
      duration = 0.0;
      -[PLVideoView setCurrentTime:](self, "setCurrentTime:", 0.0);
    }
    -[PLVideoView _scrubberTimeFromMovieTime:](self, "_scrubberTimeFromMovieTime:", duration);
    -[UIMovieScrubber setValue:animated:](self->_scrubber, "setValue:animated:", 0);
    -[PLVideoView _showVideoOverlay](self, "_showVideoOverlay");
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[PLVideoViewDelegate videoViewDidEndPlayback:didFinish:](self->_delegate, "videoViewDidEndPlayback:didFinish:", self, 1);
    }
  }
}

- (double)duration
{
  return self->_duration;
}

- (void)_setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    -[PLVideoView _updateSlalomRegionEditorRange](self, "_updateSlalomRegionEditorRange");
  }
}

- (void)_updateSlalomRegionEditorRange
{
  double Seconds;
  double v4;
  void *v5;
  PLSlalomRegionEditor *slalomRegionEditor;
  CMTime v7;
  __int128 v8;
  _OWORD v9[2];

  Seconds = 0.0;
  v4 = 0.0;
  if (objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "hasSlowMotionAdjustments"))
  {
    memset(v9, 0, sizeof(v9));
    v8 = 0u;
    v5 = (void *)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments");
    if (v5)
    {
      objc_msgSend(v5, "slowMotionTimeRange");
    }
    else
    {
      memset(v9, 0, sizeof(v9));
      v8 = 0u;
    }
    *(_OWORD *)&v7.value = v8;
    v7.epoch = *(_QWORD *)&v9[0];
    Seconds = CMTimeGetSeconds(&v7);
    v7 = *(CMTime *)((char *)v9 + 8);
    v4 = Seconds + CMTimeGetSeconds(&v7);
  }
  -[PLSlalomRegionEditor setMinValue:](self->_slalomRegionEditor, "setMinValue:", 0.0);
  slalomRegionEditor = self->_slalomRegionEditor;
  -[PLVideoView _movieScrubberDuration](self, "_movieScrubberDuration");
  -[PLSlalomRegionEditor setMaxValue:](slalomRegionEditor, "setMaxValue:");
  -[PLSlalomRegionEditor setStartValue:](self->_slalomRegionEditor, "setStartValue:", Seconds);
  -[PLSlalomRegionEditor setEndValue:](self->_slalomRegionEditor, "setEndValue:", v4);
}

- (void)_updateScrubberValue
{
  double v3;
  double v4;
  double lastScrubbedValue;
  double v7;
  double v8;

  if (!self->_scrubberUpdateTimer || self->_duration == 0.0)
    return;
  -[PLVideoView currentTime](self, "currentTime");
  -[PLVideoView _scrubberTimeFromMovieTime:](self, "_scrubberTimeFromMovieTime:");
  if ((*((_BYTE *)self + 658) & 0x20) == 0)
    goto LABEL_13;
  lastScrubbedValue = self->_lastScrubbedValue;
  v4 = -1.0;
  if (lastScrubbedValue == -1.0)
    goto LABEL_13;
  if ((*((_BYTE *)self + 658) & 0x40) != 0)
  {
    if (v3 < lastScrubbedValue)
      goto LABEL_14;
    goto LABEL_12;
  }
  v4 = v3 - lastScrubbedValue;
  if (v3 > lastScrubbedValue && v4 < 0.5)
  {
LABEL_12:
    self->_lastScrubbedValue = -1.0;
LABEL_13:
    lastScrubbedValue = v3;
  }
LABEL_14:
  -[PLVideoView _scrubberTimeFromMovieTime:](self, "_scrubberTimeFromMovieTime:", self->_duration, v4);
  v8 = v7;
  if (lastScrubbedValue < v7)
    v7 = lastScrubbedValue;
  self->_lastActualValue = fmax(v7, 0.0);
  -[UIMovieScrubber setValue:animated:](self->_scrubber, "setValue:animated:", 1);
  if (lastScrubbedValue >= v8)
    -[PLVideoView _removeScrubberUpdateTimer](self, "_removeScrubberUpdateTimer");
}

- (void)updateForRotationWithDuration:(double)a3 isLandscape:(BOOL)a4
{
  double v6;

  if (self->_useLandscapeCache != a4)
  {
    self->_useLandscapeCache = a4;
    -[PLVideoView _setNeedsReloadScrubberThumbnails:](self, "_setNeedsReloadScrubberThumbnails:", 1);
    -[PLVideoView setShowsScrubber:duration:](self, "setShowsScrubber:duration:", 0, 0.0);
    if (self->_scaleMode == 2)
    {
      *(float *)&v6 = a3;
      -[PLVideoView toggleScaleMode:](self, "toggleScaleMode:", v6);
    }
  }
}

- (void)slalomRegionEditorDidBeginEditing:(id)a3 withStartHandle:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[PLVideoView pause](self, "pause", a3);
  *((_BYTE *)self + 658) &= ~1u;
  -[PLVideoView _scrubToSlalomRegionEditorStartHandle:](self, "_scrubToSlalomRegionEditorStartHandle:", v4);
}

- (void)slalomRegionEditorDidEndEditing:(id)a3
{
  id v3;
  double v5;
  Float64 v6;
  double v7;
  Float64 v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  id v12;
  void *v13;
  uint64_t v14;
  PFVideoAVObjectBuilder *v15;
  PFVideoAVObjectBuilder *videoAVObjectBuilder;
  _QWORD v17[5];
  CMTimeRange range2;
  CMTimeRange range1;
  CMTimeRange v20;
  CMTime end;
  CMTime start;
  CMTimeRange v23;

  v3 = a3;
  objc_msgSend(a3, "startValue");
  v6 = v5;
  objc_msgSend(v3, "endValue");
  v8 = v7;
  LODWORD(v3) = objc_msgSend(MEMORY[0x1E0D75298], "preferredTimeScale");
  memset(&v23, 0, sizeof(v23));
  CMTimeMakeWithSeconds(&start, v6, (int32_t)v3);
  CMTimeMakeWithSeconds(&end, v8, (int32_t)v3);
  CMTimeRangeFromTimeToTime(&v23, &start, &end);
  memset(&v20, 0, sizeof(v20));
  v9 = (void *)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments");
  if (v9)
    objc_msgSend(v9, "slowMotionTimeRange");
  else
    memset(&v20, 0, sizeof(v20));
  range1 = v20;
  range2 = v23;
  if (!CMTimeRangeEqual(&range1, &range2))
  {
    objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "slowMotionRate");
    v11 = v10;
    v12 = objc_alloc(MEMORY[0x1E0D75308]);
    range1 = v23;
    v13 = (void *)objc_msgSend(v12, "initWithSlowMotionTimeRange:rate:", &range1, COERCE_DOUBLE(__PAIR64__(v23.duration.flags, v11)));
    v14 = -[PFVideoAVObjectBuilder videoAsset](self->__videoAVObjectBuilder, "videoAsset");
    v15 = (PFVideoAVObjectBuilder *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v14, v13);

    self->__videoAVObjectBuilder = v15;
    -[PLVideoView _updateScrubberForSlowMotion](self, "_updateScrubberForSlowMotion");
    videoAVObjectBuilder = self->__videoAVObjectBuilder;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __47__PLVideoView_slalomRegionEditorDidEndEditing___block_invoke;
    v17[3] = &unk_1E70B6550;
    v17[4] = self;
    -[PFVideoAVObjectBuilder requestPlayerItemWithResultHandler:](videoAVObjectBuilder, "requestPlayerItemWithResultHandler:", v17);
    -[PLVideoView _enqueueAdjustmentsForCommit](self, "_enqueueAdjustmentsForCommit");
    -[PLVideoView _cancelAirplayExportSession](self, "_cancelAirplayExportSession");
    if (-[PLVideoView _shouldPlayFlattenedVideo](self, "_shouldPlayFlattenedVideo"))
    {
      *((_BYTE *)self + 659) &= ~2u;
      -[PLVideoView _prepareMoviePlayerIfNeeded](self, "_prepareMoviePlayerIfNeeded");
    }
    if (!-[PLVideoView _didEditSlalom](self, "_didEditSlalom"))
    {
      -[PLVideoView _setDidEditSlalom:](self, "_setDidEditSlalom:", 1);
      PLSAggregateDictionaryAddValueForScalarKey();
    }
  }
}

- (void)_enqueueAdjustmentsForCommit
{
  uint64_t v3;
  PFVideoAdjustments *adjustmentsToCommit;
  void *v5;

  v3 = -[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments");
  adjustmentsToCommit = self->__adjustmentsToCommit;
  if (adjustmentsToCommit != (PFVideoAdjustments *)v3)
  {
    v5 = (void *)v3;

    self->__adjustmentsToCommit = (PFVideoAdjustments *)v5;
  }
  -[PLVideoView _cancelDelayedCommitPendingAdjustmentsUpdate](self, "_cancelDelayedCommitPendingAdjustmentsUpdate");
  -[PLVideoView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__commitPendingAdjustmentsUpdate, 0, 40.0);
}

- (void)_commitPendingAdjustmentsUpdate
{
  -[PLVideoView _commitPendingAdjustmentsUpdateAndWait:completionHandler:](self, "_commitPendingAdjustmentsUpdateAndWait:completionHandler:", 0, 0);
}

- (void)_cancelDelayedCommitPendingAdjustmentsUpdate
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__commitPendingAdjustmentsUpdate, 0);
}

- (void)_commitPendingAdjustmentsUpdateAndWait:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v5;
  PFVideoAdjustments *adjustmentsToCommit;
  PFVideoAdjustments *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *Log;
  _QWORD v15[5];
  uint8_t buf[8];
  _QWORD v17[7];

  v5 = a3;
  -[PLVideoView _cancelDelayedCommitPendingAdjustmentsUpdate](self, "_cancelDelayedCommitPendingAdjustmentsUpdate");
  adjustmentsToCommit = self->__adjustmentsToCommit;
  if (adjustmentsToCommit)
  {
    v8 = adjustmentsToCommit;

    self->__adjustmentsToCommit = 0;
    v9 = -[PLManagedAsset pl_PHAssetFromPhotoLibrary:](self->_videoCameraImage, "pl_PHAssetFromPhotoLibrary:", pl_appPhotoLibrary());
    if (v9)
    {
      v10 = v9;
      ++self->__expectedNotificationsCount;
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1370]), "initWithFormatIdentifier:formatVersion:data:", -[PFVideoAdjustments adjustmentFormatIdentifier](v8, "adjustmentFormatIdentifier"), -[PFVideoAdjustments adjustmentFormatVersion](v8, "adjustmentFormatVersion"), -[PFVideoAdjustments adjustmentData](v8, "adjustmentData"));
      v12 = (void *)pl_appPhotoLibrary();
      v13 = objc_msgSend(v12, "photoLibraryURL");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __72__PLVideoView__commitPendingAdjustmentsUpdateAndWait_completionHandler___block_invoke;
      v17[3] = &unk_1E70B6410;
      v17[4] = v10;
      v17[5] = v13;
      v17[6] = v11;
      if (v5)
      {
        *(_QWORD *)buf = 0;
        if (!objc_msgSend(v12, "performChangesAndWait:error:", v17, buf) || *(_QWORD *)buf)
          NSLog(CFSTR("Failed to commit adjustments with error: %@"), *(_QWORD *)buf);
        if (a4)
          (*((void (**)(id, _QWORD))a4 + 2))(a4, *(_QWORD *)buf);
      }
      else
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __72__PLVideoView__commitPendingAdjustmentsUpdateAndWait_completionHandler___block_invoke_2;
        v15[3] = &unk_1E70B6578;
        v15[4] = a4;
        objc_msgSend(v12, "performChanges:completionHandler:", v17, v15);
      }
    }
    else
    {
      Log = PLBackendGetLog();
      if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_ERROR, "No PHAsset for committing pending adjustment changes", buf, 2u);
      }
      if (a4)
        (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
    }

  }
  else if (a4)
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
  }
}

- (void)slalomRegionEditorStartValueChanged:(id)a3
{
  -[PLVideoView _scrubToSlalomRegionEditorStartHandle:](self, "_scrubToSlalomRegionEditorStartHandle:", 1);
}

- (void)slalomRegionEditorEndValueChanged:(id)a3
{
  -[PLVideoView _scrubToSlalomRegionEditorStartHandle:](self, "_scrubToSlalomRegionEditorStartHandle:", 0);
}

- (void)_scrubToSlalomRegionEditorStartHandle:(BOOL)a3
{
  PLSlalomRegionEditor *slalomRegionEditor;

  slalomRegionEditor = self->_slalomRegionEditor;
  if (a3)
    -[PLSlalomRegionEditor startValue](slalomRegionEditor, "startValue");
  else
    -[PLSlalomRegionEditor endValue](slalomRegionEditor, "endValue");
  -[PLVideoView _movieTimeFromScrubberTime:](self, "_movieTimeFromScrubberTime:");
  -[PLVideoView _scrubToMovieTime:](self, "_scrubToMovieTime:");
}

- (BOOL)slalomRegionEditorRequestForceZoom:(id)a3
{
  return -[UIMovieScrubber forceZoom](self->_scrubber, "forceZoom", a3);
}

- (void)slalomRegionEditorRequestForceUnzoom:(id)a3
{
  -[UIMovieScrubber forceUnzoom](self->_scrubber, "forceUnzoom", a3);
}

- (BOOL)_canAirPlayCurrentVideo
{
  BOOL v2;
  PFVideoAVObjectBuilder *videoAVObjectBuilder;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = 1;
  v9 = 1;
  videoAVObjectBuilder = self->__videoAVObjectBuilder;
  if (videoAVObjectBuilder)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__PLVideoView__canAirPlayCurrentVideo__block_invoke;
    v5[3] = &unk_1E70B65A0;
    v5[4] = &v6;
    -[PFVideoAVObjectBuilder requestAVAssetForExport:withResultHandler:](videoAVObjectBuilder, "requestAVAssetForExport:withResultHandler:", 0, v5);
    v2 = *((_BYTE *)v7 + 24) != 0;
  }
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (BOOL)_shouldPlayFlattenedVideo
{
  if (self->_isAirPlay)
    return !-[PLVideoView _canAirPlayCurrentVideo](self, "_canAirPlayCurrentVideo");
  else
    return 0;
}

- (BOOL)_isFlattenedVideoUpToDate
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = -[PLVideoView _filePathForFlattenedVideo](self, "_filePathForFlattenedVideo");
  v5 = -[PLVideoView _filePathForFlattenedVideoMetadata](self, "_filePathForFlattenedVideoMetadata");
  if (objc_msgSend(v3, "fileExistsAtPath:", v4)
    && objc_msgSend(v3, "fileExistsAtPath:", v5))
  {
    return objc_msgSend(-[PLVideoView _readMetadataFromPath:](self, "_readMetadataFromPath:", v5), "isEqual:", -[PLVideoView _metadataForFlattenedVideo](self, "_metadataForFlattenedVideo"));
  }
  else
  {
    return 0;
  }
}

- (id)_metadataForFlattenedVideo
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  -[PLManagedAsset duration](self->_videoCameraImage, "duration");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:"), CFSTR("duration"));
  v4 = objc_msgSend((id)-[PFVideoAVObjectBuilder videoAdjustments](self->__videoAVObjectBuilder, "videoAdjustments"), "propertyListDictionary");
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("plist"));
  return v3;
}

- (id)_readMetadataFromPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", a3);
}

- (void)_writeMetadata:(id)a3 toPath:(id)a4
{
  if (a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 100, 0, 0), "writeToFile:options:error:", a4, 1073741825, 0);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", a4) & 1) == 0)
    NSLog(CFSTR("Failed to write metadata to path %@"), a4);
}

- (id)_filePathForFlattenedVideo
{
  return -[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", objc_msgSend(-[PLVideoView _pathForOriginalFile](self, "_pathForOriginalFile"), "lastPathComponent"));
}

- (id)_filePathForFlattenedVideoMetadata
{
  return (id)objc_msgSend(-[PLVideoView _filePathForFlattenedVideo](self, "_filePathForFlattenedVideo"), "stringByAppendingPathExtension:", CFSTR("MD"));
}

- (void)_deleteFileAtPath:(id)a3
{
  void *v4;
  uint64_t v5;

  v5 = 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", a3, 0))
  {
    objc_msgSend(v4, "removeItemAtPath:error:", a3, &v5);
    if (v5)
      NSLog(CFSTR("Failed to delete file at path %@: %@"), a3, v5);
  }
}

- (void)_flattenVideoWithCompletionHandler:(id)a3
{
  id v5;
  id v6;
  id v7;
  PFVideoAVObjectBuilder *videoAVObjectBuilder;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AVAssetExportSession *airplayExportSession;
  _QWORD v13[10];
  _QWORD v14[5];

  -[PLVideoView _cancelAirplayExportSession](self, "_cancelAirplayExportSession");
  if (!self->__videoAVObjectBuilder)
    goto LABEL_4;
  v5 = -[PLVideoView _filePathForFlattenedVideo](self, "_filePathForFlattenedVideo");
  v6 = -[PLVideoView _filePathForFlattenedVideoMetadata](self, "_filePathForFlattenedVideoMetadata");
  -[PLVideoView _deleteFileAtPath:](self, "_deleteFileAtPath:", v5);
  -[PLVideoView _deleteFileAtPath:](self, "_deleteFileAtPath:", v6);
  v7 = -[PLVideoView _metadataForFlattenedVideo](self, "_metadataForFlattenedVideo");
  videoAVObjectBuilder = self->__videoAVObjectBuilder;
  v9 = MEMORY[0x1E0C809B0];
  v10 = *MEMORY[0x1E0C89E98];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__PLVideoView__flattenVideoWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E70B65C8;
  v14[4] = self;
  -[PFVideoAVObjectBuilder requestExportSessionWithExportPreset:resultHandler:](videoAVObjectBuilder, "requestExportSessionWithExportPreset:resultHandler:", v10, v14);
  if (self->_airplayExportSession)
  {
    v11 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
    -[AVAssetExportSession setOutputFileType:](self->_airplayExportSession, "setOutputFileType:", *MEMORY[0x1E0C8A2E8]);
    -[AVAssetExportSession setOutputURL:](self->_airplayExportSession, "setOutputURL:", v11);
    airplayExportSession = self->_airplayExportSession;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __50__PLVideoView__flattenVideoWithCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E70B65F0;
    v13[4] = airplayExportSession;
    v13[5] = self;
    v13[6] = v7;
    v13[7] = v6;
    v13[8] = v11;
    v13[9] = a3;
    -[AVAssetExportSession exportAsynchronouslyWithCompletionHandler:](airplayExportSession, "exportAsynchronouslyWithCompletionHandler:", v13);
  }
  else
  {
LABEL_4:
    if (a3)
      (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

- (void)_cancelAirplayExportSession
{
  -[AVAssetExportSession cancelExport](self->_airplayExportSession, "cancelExport");

  self->_airplayExportSession = 0;
}

- (void)setScrubberWidth:(double)a3
{
  self->_scrubberWidth = a3;
}

- (PLVideoPosterFrameView)posterFrameView
{
  return self->_posterFrameView;
}

- (BOOL)allowSlalomEditor
{
  return self->_allowSlalomEditor;
}

- (void)setAllowSlalomEditor:(BOOL)a3
{
  self->_allowSlalomEditor = a3;
}

- (UIView)scrubberBackgroundView
{
  return self->_scrubberBackgroundView;
}

- (BOOL)prepareMoviePlayerForScrubberAutomatically
{
  return self->_prepareMoviePlayerForScrubberAutomatically;
}

- (void)setPrepareMoviePlayerForScrubberAutomatically:(BOOL)a3
{
  self->_prepareMoviePlayerForScrubberAutomatically = a3;
}

- (BOOL)shouldPlayVideoWhenViewAppears
{
  return self->_shouldPlayVideoWhenViewAppears;
}

- (void)setShouldPlayVideoWhenViewAppears:(BOOL)a3
{
  self->_shouldPlayVideoWhenViewAppears = a3;
}

- (BOOL)_didInsertMoviePlayerView
{
  return self->__didInsertMoviePlayerView;
}

- (void)set_didInsertMoviePlayerView:(BOOL)a3
{
  self->__didInsertMoviePlayerView = a3;
}

- (BOOL)_didEditSlalom
{
  return self->__didEditSlalom;
}

- (void)_setDidEditSlalom:(BOOL)a3
{
  self->__didEditSlalom = a3;
}

- (PFVideoAVObjectBuilder)_videoAVObjectBuilder
{
  return self->__videoAVObjectBuilder;
}

- (BOOL)_isFetchingVideo
{
  return self->__isFetchingVideo;
}

- (BOOL)_localVideoUnavailable
{
  return self->__localVideoUnavailable;
}

- (int64_t)_expectedNotificationsCount
{
  return self->__expectedNotificationsCount;
}

- (PFVideoAdjustments)_adjustmentsToCommit
{
  return self->__adjustmentsToCommit;
}

- (BOOL)_canAttemptFetchingVideoDerivative
{
  return self->__canAttemptFetchingVideoDerivative;
}

- (void)_setCanAttemptFetchingVideoDerivative:(BOOL)a3
{
  self->__canAttemptFetchingVideoDerivative = a3;
}

- (BOOL)_attemptFetchingVideoDerivative
{
  return self->__attemptFetchingVideoDerivative;
}

- (void)_setAttemptFetchingVideoDerivative:(BOOL)a3
{
  self->__attemptFetchingVideoDerivative = a3;
}

- (BOOL)_slalomRegionEditorCreatedForScrubber
{
  return self->__slalomRegionEditorCreatedForScrubber;
}

id __50__PLVideoView__flattenVideoWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 648) = result;
  return result;
}

uint64_t __50__PLVideoView__flattenVideoWithCompletionHandler___block_invoke_2()
{
  return pl_dispatch_async();
}

uint64_t __50__PLVideoView__flattenVideoWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "status");
  if (v2 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_writeMetadata:toPath:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "removeItemAtURL:error:", *(_QWORD *)(a1 + 64), 0);
    if (v2 == 4)
      NSLog(CFSTR("Video export failed for asset %@: %@"), objc_msgSend(*(id *)(a1 + 32), "asset"), objc_msgSend(*(id *)(a1 + 32), "error"));
  }
  v3 = *(void **)(a1 + 32);
  if (v3 == *(void **)(*(_QWORD *)(a1 + 40) + 648))
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 648) = 0;
  }
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 3);
  return result;
}

uint64_t __38__PLVideoView__canAirPlayCurrentVideo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  char v8;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  v8 = (a3 == 0) & result;
  if (a4)
    v8 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  return result;
}

uint64_t __72__PLVideoView__commitPendingAdjustmentsUpdateAndWait_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", a1[4]);
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1508]), "initWithAdjustmentBaseVersion:mediaType:appropriateForURL:", 0, 2, a1[5]);
  objc_msgSend(v3, "setAdjustmentData:", a1[6]);
  objc_msgSend(v3, "clearRenderedContentURL");
  return objc_msgSend(v2, "setContentEditingOutput:", v3);
}

uint64_t __72__PLVideoView__commitPendingAdjustmentsUpdateAndWait_completionHandler___block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t result;

  if (a3 || (a2 & 1) == 0)
    NSLog(CFSTR("Failed to commit adjustments with error: %@"), a3);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

uint64_t __47__PLVideoView_slalomRegionEditorDidEndEditing___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 568), "setPlayerItem:startTime:", a2, *(double *)(*(_QWORD *)(a1 + 32) + 592));
}

uint64_t __41__PLVideoView_setShowsScrubber_duration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupMoviePlayerIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "_prepareMoviePlayerIfNeeded");
}

uint64_t __53__PLVideoView__updateScrubberVisibilityWithDuration___block_invoke(uint64_t a1)
{
  uint64_t v1;
  double v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 1.0;
  if (*(char *)(v1 + 659) >= 0)
    v2 = 0.0;
  return objc_msgSend(*(id *)(v1 + 504), "setAlpha:", v2);
}

uint64_t __19__PLVideoView_play__block_invoke()
{
  return pl_dispatch_async();
}

uint64_t __19__PLVideoView_play__block_invoke_2(uint64_t a1)
{
  NSObject *Log;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "cachedNonPersistedVideoPlaybackURL");
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(streamed-video-playback) will play video for %@", (uint8_t *)&v5, 0xCu);
  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "cachedNonPersistedVideoPlaybackURL");
  if (result)
    return objc_msgSend(*(id *)(a1 + 32), "play");
  return result;
}

uint64_t __31__PLVideoView_toggleScaleMode___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setScaleMode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "layoutIfNeeded");
}

void __46__PLVideoView__serviceImageGenerationRequests__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v20[9];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 624);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (!v2)
    return;
  v3 = *(_QWORD *)v31;
  while (2)
  {
    for (i = 0; i != v2; ++i)
    {
      if (*(_QWORD *)v31 != v3)
        objc_enumerationMutation(v1);
      v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      if ((objc_msgSend(v18, "inUse", v17) & 1) == 0)
      {
        v5 = 664;
        v17 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 664), "count");
        v6 = *(_QWORD *)(a1 + 32);
        if (!v17)
        {
          v5 = 672;
          if (!objc_msgSend(*(id *)(v6 + 672), "count"))
            continue;
          v6 = *(_QWORD *)(a1 + 32);
        }
        v7 = *(void **)(v6 + v5);
        *(_QWORD *)(*(_QWORD *)(a1 + 32) + v5) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (v7)
        {
          objc_msgSend(v18, "setInUse:", 1);
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
          v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v27;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v27 != v11)
                  objc_enumerationMutation(v7);
                v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                objc_msgSend(v13, "doubleValue", v17);
                objc_msgSend(*(id *)(a1 + 32), "_thumbnailTimeFromScrubberTime:");
                v14 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
                objc_msgSend(v9, "addObject:", v14);
                v21 = 0uLL;
                v22 = 0;
                if (v14)
                  objc_msgSend(v14, "CMTimeValue");
                v24 = v21;
                v25 = v22;
                objc_msgSend(v8, "setObject:forKey:", v13, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v24));
              }
              v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v10);
          }
          v15 = (void *)objc_msgSend(v18, "imageGenerator");
          objc_msgSend(*(id *)(a1 + 32), "_configureImageGenerator:thumbnailSize:forSummaryThumbnails:", v15, v17 != 0, *(double *)(*(_QWORD *)(a1 + 32) + 536), *(double *)(*(_QWORD *)(a1 + 32) + 544));
          *(_QWORD *)&v21 = 0;
          *((_QWORD *)&v21 + 1) = &v21;
          v22 = 0x2020000000;
          v23 = 0;
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __46__PLVideoView__serviceImageGenerationRequests__block_invoke_2;
          v20[3] = &unk_1E70B6528;
          v16 = *(_QWORD *)(a1 + 32);
          v20[4] = v8;
          v20[5] = v16;
          v20[8] = &v21;
          v20[6] = v7;
          v20[7] = v18;
          objc_msgSend(v15, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v9, v20);

          _Block_object_dispose(&v21, 8);
          return;
        }
      }
    }
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v2)
      continue;
    break;
  }
}

uint64_t __46__PLVideoView__serviceImageGenerationRequests__block_invoke_2(uint64_t a1, int a2, CGImageRef image)
{
  uint64_t v4;
  uint64_t result;

  if (image)
    CGImageRetain(image);
  pl_dispatch_async();
  v4 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  result = objc_msgSend(*(id *)(a1 + 48), "count");
  if (v4 == result)
  {
    pl_dispatch_sync();
    return pl_dispatch_async();
  }
  return result;
}

void __46__PLVideoView__serviceImageGenerationRequests__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  CGImage *v5;
  __int128 v6;
  uint64_t v7;

  if (!*(_QWORD *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    v6 = *(_OWORD *)(a1 + 64);
    v7 = *(_QWORD *)(a1 + 80);
    v3 = objc_msgSend(v2, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v6));
    if (v3)
    {
      v4 = v3;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 680), "setThumbnailImage:forTimestamp:", *(_QWORD *)(a1 + 56), v3);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 696), "setObject:forKey:", *(_QWORD *)(a1 + 56), v4);
    }
  }
  v5 = *(CGImage **)(a1 + 56);
  if (v5)
    CGImageRelease(v5);
}

uint64_t __46__PLVideoView__serviceImageGenerationRequests__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInUse:", 0);
}

uint64_t __46__PLVideoView__serviceImageGenerationRequests__block_invoke_5(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_serviceImageGenerationRequests");
  result = objc_msgSend(*(id *)(a1 + 32), "_canCreateMetadata");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_saveCachedThumbnailsIfNecessary");
  return result;
}

uint64_t __67__PLVideoView__addThumbnailRequestForTimestamp_isSummaryThumbnail___block_invoke(uint64_t a1)
{
  int *v1;

  if (*(_BYTE *)(a1 + 48))
    v1 = &OBJC_IVAR___PLVideoView__summaryThumbnailRequestTimestamps;
  else
    v1 = &OBJC_IVAR___PLVideoView__detailThumbnailRequestTimestamps;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + *v1), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __56__PLVideoView_moviePlayerDidChangeExternalPlaybackType___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if ((*(_BYTE *)(v1 + 659) & 2) != 0)
  {
    *(_BYTE *)(v1 + 659) &= ~2u;
    return objc_msgSend(*(id *)(result + 32), "_prepareAndResumePlayback");
  }
  return result;
}

uint64_t __42__PLVideoView__prepareMoviePlayerIfNeeded__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_prepareAndResumePlayback");
  return result;
}

id __42__PLVideoView__prepareMoviePlayerIfNeeded__block_invoke_100(uint64_t a1, void *a2)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __45__PLVideoView__fetchLocalContentEditingInput__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_canHandleAdjustmentData:", a2);
}

uint64_t __45__PLVideoView__fetchLocalContentEditingInput__block_invoke_2()
{
  return pl_dispatch_async();
}

uint64_t __45__PLVideoView__fetchLocalContentEditingInput__block_invoke_3(id *a1)
{
  void *v2;

  *((_BYTE *)a1[4] + 765) = 0;
  v2 = (void *)objc_msgSend(a1[5], "audiovisualAsset");
  if (objc_msgSend(a1[6], "objectForKeyedSubscript:", *MEMORY[0x1E0CD1B30])
    || !objc_msgSend(v2, "isPlayable"))
  {
    return objc_msgSend(a1[4], "_fetchNonlocalVideo");
  }
  objc_msgSend(a1[4], "_setCanAttemptFetchingVideoDerivative:", 1);
  objc_msgSend(a1[4], "_updateVideoAVObjectBuilderFromContentEditingInput:", a1[5]);
  objc_msgSend(a1[4], "_setLocalVideoUnavailable:", 0);
  objc_msgSend(a1[4], "_updateSlalomRegionEditorState");
  *((_BYTE *)a1[4] + 659) &= ~2u;
  return objc_msgSend(a1[4], "_prepareAndResumePlayback");
}

uint64_t __34__PLVideoView__fetchNonlocalVideo__block_invoke()
{
  return pl_dispatch_async();
}

void __34__PLVideoView__fetchNonlocalVideo__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *Log;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 765) = 0;
  v2 = objc_msgSend(*(id *)(a1 + 40), "asset");
  if (v2)
  {
    v3 = v2;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 776) = objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v3, 0);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 659) &= ~2u;
    objc_msgSend(*(id *)(a1 + 32), "_prepareAndResumePlayback");
  }
  else
  {
    Log = PLBackendGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 48);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_ERROR, "Failed to fetch playback objects for %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __54__PLVideoView__requestPreviewPosterFrameForVideoSize___block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  if (cf)
    CFRetain(cf);
  pl_dispatch_async();

}

void __54__PLVideoView__requestPreviewPosterFrameForVideoSize___block_invoke_2(uint64_t a1)
{
  const void *v2;

  if (!*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_savePreviewPosterFrameImage:", *(_QWORD *)(a1 + 48));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

uint64_t __36__PLVideoView__hideTrimMessageView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", 0.0);
}

uint64_t __36__PLVideoView__hideTrimMessageView___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_videoOverlayFadeOutDidFinish");
}

uint64_t __33__PLVideoView__hideVideoOverlay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "setAlpha:", 0.0);
}

uint64_t __33__PLVideoView__hideVideoOverlay___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_videoOverlayFadeOutDidFinish");
}

+ (id)videoViewForVideoFileAtURL:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(objc_alloc((Class)a1), "_initWithFrame:videoCameraImage:orientation:", 0, 1, 0.0, 0.0, 1.0, 1.0);
  v5 = (id)v4;
  *(_QWORD *)(v4 + 432) = objc_msgSend(a3, "copy");
  *(_BYTE *)(v4 + 657) = *(_BYTE *)(v4 + 657) & 0xFE | objc_msgSend((id)v4, "_canAccessVideo");
  return (id)v4;
}

+ (id)_dequeueOverlayPlayButton
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)_overlayButtonQueue;
  if (!_overlayButtonQueue)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
    _overlayButtonQueue = (uint64_t)v2;
  }
  v3 = (void *)objc_msgSend(v2, "firstObject");
  if (!v3)
    return (id)objc_msgSend(MEMORY[0x1E0CEABB0], "pl_videoOverlayButtonWithStyle:", 0);
  v4 = v3;
  v5 = v3;
  objc_msgSend((id)_overlayButtonQueue, "removeObjectAtIndex:", 0);
  return v4;
}

+ (void)_enqueueOverlayPlayButton:(id)a3
{
  if (a3)
    objc_msgSend((id)_overlayButtonQueue, "addObject:");
}

@end
