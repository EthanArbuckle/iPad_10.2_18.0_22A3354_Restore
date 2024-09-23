@implementation PUBrowsingVideoPlayer

- (PUBrowsingVideoPlayer)initWithAsset:(id)a3 mediaProvider:(id)a4
{
  id v8;
  id v9;
  void *v10;
  PUBrowsingVideoPlayer *v11;
  PUBrowsingVideoPlayer *v12;
  uint64_t v13;
  PXUpdater *updater;
  void *v15;
  void *v16;
  double v17;
  Float64 v18;
  __int128 v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  CMTime v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingVideoPlayer.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingVideoPlayer.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProvider"));

LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)PUBrowsingVideoPlayer;
  v11 = -[PUViewModel init](&v28, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_asset, a3);
    objc_storeStrong((id *)&v12->_mediaProvider, a4);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7CDA0]), "initWithTarget:", v12);
    updater = v12->_updater;
    v12->_updater = (PXUpdater *)v13;

    -[PXUpdater addUpdateSelector:](v12->_updater, "addUpdateSelector:", sel__updateVideoSession);
    -[PXUpdater addUpdateSelector:](v12->_updater, "addUpdateSelector:", sel__updatePlayerVolume);
    -[PXUpdater addUpdateSelector:](v12->_updater, "addUpdateSelector:", sel__updateVideoSessionDesiredPlayState);
    -[PXUpdater setNeedsUpdateSelector:](v12->_updater, "setNeedsUpdateSelector:", sel_assertInsideChangesBlock);
    objc_msgSend(MEMORY[0x1E0D7BBB0], "sharedController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerChangeObserver:context:", v12, VideoMuteControllerContext);

    v12->_desiredPlayState = 0;
    v12->_isPlayerLoadingAllowed = 1;
    v12->_volume = 1.0;
    -[PUBrowsingVideoPlayer _updateMuteState](v12, "_updateMuteState");
    -[PUBrowsingVideoPlayer asset](v12, "asset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "duration");
    v18 = v17;

    CMTimeMakeWithSeconds(&v27, v18, 600);
    v19 = *(_OWORD *)&v27.value;
    v12->_duration.epoch = v27.epoch;
    *(_OWORD *)&v12->_duration.value = v19;
    v12->_videoSessionPresenter = &v12->_videoSessionPresenter;
    v12->_targetSize = (CGSize)PUBrowsingVideoDefaultSize;
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "enableLiveVideoRenderAtSetSize");

    if (v21)
      v12->_targetSize = (CGSize)PUBrowsingVideoMaxSize;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v12, sel__handleShouldReloadAssetMediaNotification_, CFSTR("PUShouldReloadAssetMediaNotification"), 0);

    objc_msgSend(MEMORY[0x1E0D7B1B8], "sharedState");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "registerChangeObserver:context:", v12, ApplicationStateContext);

  }
  return v12;
}

- (PUBrowsingVideoPlayer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingVideoPlayer.m"), 158, CFSTR("%s is not available as initializer"), "-[PUBrowsingVideoPlayer init]");

  abort();
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[PXVideoSession leavePresentationContext:presenter:](self->_videoSession, "leavePresentationContext:presenter:", 1, self->_videoSessionPresenter);
  objc_msgSend(MEMORY[0x1E0D7BBD0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkInVideoSession:", self->_videoSession);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PUBrowsingVideoPlayer;
  -[PUBrowsingVideoPlayer dealloc](&v5, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PUBrowsingVideoPlayer;
  -[PUBrowsingVideoPlayer description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PUBrowsingVideoPlayer asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tAsset : %@"), v5);

  PUBrowsingVideoDesiredPlayStateDescription(-[PUBrowsingVideoPlayer desiredPlayState](self, "desiredPlayState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tDesired State : %@"), v6);

  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tVideoSession : %@"), v8);

  v9 = (void *)objc_msgSend(v4, "copy");
  return (NSString *)v9;
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingVideoPlayer;
  -[PUViewModel didPerformChanges](&v3, sel_didPerformChanges);
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
}

- (id)newViewModelChange
{
  return objc_alloc_init(PUBrowsingVideoPlayerChange);
}

- (PUBrowsingVideoPlayerChange)currentChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingVideoPlayer;
  -[PUViewModel currentChange](&v3, sel_currentChange);
  return (PUBrowsingVideoPlayerChange *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)registerChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingVideoPlayer;
  -[PUViewModel registerChangeObserver:](&v3, sel_registerChangeObserver_, a3);
}

- (void)unregisterChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingVideoPlayer;
  -[PUViewModel unregisterChangeObserver:](&v3, sel_unregisterChangeObserver_, a3);
}

- (void)invalidateExistingPlayer
{
  -[PUBrowsingVideoPlayer setVideoSession:](self, "setVideoSession:", 0);
}

- (void)assetContentDidChange
{
  void *v3;

  -[PUBrowsingVideoPlayer currentChange](self, "currentChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHasChanges");

  -[PUBrowsingVideoPlayer setVideoSession:](self, "setVideoSession:", 0);
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVideoSession);
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlayerVolume);
  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVideoSessionDesiredPlayState);
}

- (void)setAsset:(id)a3
{
  PUDisplayAsset *v5;
  int isKindOfClass;
  PUDisplayAsset *asset;
  PUDisplayAsset *v8;
  PUDisplayAsset *v9;
  uint64_t v10;
  int v11;
  void *v12;
  PUDisplayAsset *v13;

  v5 = (PUDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    v13 = v5;
    if (setAsset__onceToken != -1)
    {
      dispatch_once(&setAsset__onceToken, &__block_literal_global_18188);
      v5 = v13;
    }
    if (setAsset__CAMTransientAssetClass)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        isKindOfClass = objc_opt_isKindOfClass();
      else
        isKindOfClass = 1;
      v5 = v13;
    }
    else
    {
      isKindOfClass = 1;
    }
    asset = self->_asset;
    v8 = v5;
    v9 = asset;
    if (v9 == v8)
    {
      v11 = 0;
    }
    else
    {
      v10 = -[PUDisplayAsset isContentEqualTo:](v8, "isContentEqualTo:", v9);
      if (!v10)
        v10 = -[PUDisplayAsset isContentEqualTo:](v9, "isContentEqualTo:", v8);
      v11 = v10 != 2;
    }

    if (((v11 | isKindOfClass) & 1) == 0)
      v11 = !-[PUBrowsingVideoPlayer isActivated](self, "isActivated");
    objc_storeStrong((id *)&self->_asset, a3);
    -[PUBrowsingVideoPlayer currentChange](self, "currentChange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHasChanges");

    if (v11)
      -[PUBrowsingVideoPlayer assetContentDidChange](self, "assetContentDidChange");
    if (-[PUDisplayAsset mediaType](v8, "mediaType") != 2
      && (-[PUDisplayAsset canPlayLoopingVideo](v8, "canPlayLoopingVideo") & 1) == 0)
    {
      -[PUBrowsingVideoPlayer setActivated:](self, "setActivated:", 0);
    }
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVideoSession);
    v5 = v13;
  }

}

- (ISWrappedAVPlayer)avPlayer
{
  void *v2;
  void *v3;

  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "videoPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ISWrappedAVPlayer *)v3;
}

- (void)setDesiredPlayState:(int64_t)a3 reason:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  PUBrowsingVideoPlayer *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_desiredPlayState != a3)
  {
    PLVideoPlaybackGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      PUBrowsingVideoDesiredPlayStateDescription(self->_desiredPlayState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PUBrowsingVideoDesiredPlayStateDescription(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138413058;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v6;
      v17 = 2112;
      v18 = self;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Desired play state changing from %@ to %@ with reason: %@\n\t%@", (uint8_t *)&v11, 0x2Au);

    }
    self->_desiredPlayState = a3;
    if (-[PUBrowsingVideoPlayer isPlaybackDesired](self, "isPlaybackDesired"))
      -[PUBrowsingVideoPlayer setShouldLoadVideoSession:](self, "setShouldLoadVideoSession:", 1);
    -[PUBrowsingVideoPlayer _requestNewRenderIfNeeded](self, "_requestNewRenderIfNeeded");
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVideoSessionDesiredPlayState);
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVideoSession);
    -[PUBrowsingVideoPlayer currentChange](self, "currentChange");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setDesiredPlayStateDidChange:", 1);

  }
}

- (BOOL)isPlaybackDesired
{
  return (unint64_t)(-[PUBrowsingVideoPlayer desiredPlayState](self, "desiredPlayState") - 3) < 2;
}

- (void)setIsMuted:(BOOL)a3
{
  NSObject *v4;
  int v5;
  PUBrowsingVideoPlayer *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_isMuted != a3)
  {
    self->_isMuted = a3;
    -[PUBrowsingVideoPlayer setShouldFadeNextVolumeChange:](self, "setShouldFadeNextVolumeChange:", 1);
    PLVideoPlaybackGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "Browsing Video Player detected mute state change. Will update player volume. %@", (uint8_t *)&v5, 0xCu);
    }

    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlayerVolume);
  }
}

- (void)setIsUserScrubbing:(BOOL)a3
{
  if (self->_isUserScrubbing != a3)
  {
    self->_isUserScrubbing = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVideoSessionDesiredPlayState);
  }
}

- (void)setDesiredTargetSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  int v9;

  PXSizeMin();
  v5 = v4;
  v7 = v6;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "enableDynamicVideoScaling");

  if (v9)
  {
    if ((PXSizeApproximatelyEqualOrBiggerThanSize() & 1) == 0)
    {
      -[PUBrowsingVideoPlayer setShouldRequestNewRender:](self, "setShouldRequestNewRender:", 1);
      -[PUBrowsingVideoPlayer _setTargetSize:](self, "_setTargetSize:", v5, v7);
      -[PUBrowsingVideoPlayer _requestNewRenderIfNeeded](self, "_requestNewRenderIfNeeded");
    }
  }
}

- (void)setDuration:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_duration;
  __int128 v6;
  void *v7;
  $95D729B680665BEAEFA1D6FCA8238556 duration;
  CMTime time1;

  p_duration = &self->_duration;
  time1 = *(CMTime *)a3;
  duration = self->_duration;
  if (CMTimeCompare(&time1, (CMTime *)&duration))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_duration->epoch = a3->var3;
    *(_OWORD *)&p_duration->value = v6;
    -[PUBrowsingVideoPlayer currentChange](self, "currentChange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDurationDidChange:", 1);

  }
}

- (void)setShouldLoadVideoSession:(BOOL)a3
{
  if (self->_shouldLoadVideoSession != a3)
  {
    self->_shouldLoadVideoSession = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVideoSession);
  }
}

- (void)setVolume:(float)a3
{
  if (self->_volume != a3)
  {
    self->_volume = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlayerVolume);
  }
}

- (void)setLoopingEnabledForAllVideos:(BOOL)a3
{
  if (self->_loopingEnabledForAllVideos != a3)
  {
    self->_loopingEnabledForAllVideos = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVideoSession);
  }
}

- (BOOL)isAtBeginning
{
  void *v3;
  void *v4;
  char v5;

  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAtBeginning");

  return v5;
}

- (BOOL)isAtEnd
{
  void *v3;
  void *v4;
  char v5;

  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAtEnd");

  return v5;
}

- (BOOL)isPlayable
{
  void *v3;
  void *v4;
  char v5;

  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPlayable");

  return v5;
}

- (int64_t)playState
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "playState");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isStalled
{
  void *v3;
  void *v4;
  char v5;

  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStalled");

  return v5;
}

- (void)seekToTime:(id *)a3 completionHandler:(id)a4
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;

  v8 = *a3;
  v6 = *MEMORY[0x1E0CA2E30];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  v4 = v6;
  v5 = v7;
  -[PUBrowsingVideoPlayer seekToTime:toleranceBefore:toleranceAfter:completionHandler:](self, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v8, &v6, &v4, a4);
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id pendingSeekCompletionHandler;
  _QWORD v18[5];
  __int128 v19;
  int64_t v20;
  __int128 v21;
  int64_t v22;
  __int128 v23;
  int64_t var3;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v10 = a6;
  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "isReadyForSeeking") && !self->_isSeeking)
  {
    self->_isSeeking = 1;
    objc_initWeak(&location, self);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __85__PUBrowsingVideoPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke;
    v25[3] = &unk_1E589D7A0;
    objc_copyWeak(&v27, &location);
    v26 = v10;
    v23 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v21 = *(_OWORD *)&a4->var0;
    v22 = a4->var3;
    v19 = *(_OWORD *)&a5->var0;
    v20 = a5->var3;
    objc_msgSend(v12, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v23, &v21, &v19, v25);
    v16 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&self->_pendingSeekTime.value = *MEMORY[0x1E0CA2E18];
    self->_pendingSeekTime.epoch = *(_QWORD *)(v16 + 16);
    pendingSeekCompletionHandler = self->_pendingSeekCompletionHandler;
    self->_pendingSeekCompletionHandler = 0;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = a3->var3;
    *(_OWORD *)&self->_pendingSeekTime.value = *(_OWORD *)&a3->var0;
    self->_pendingSeekTime.epoch = v13;
    v14 = (void *)objc_msgSend(v10, "copy");
    v15 = self->_pendingSeekCompletionHandler;
    self->_pendingSeekCompletionHandler = v14;

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __85__PUBrowsingVideoPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke_3;
    v18[3] = &unk_1E58ABD10;
    v18[4] = self;
    -[PUViewModel performChanges:](self, "performChanges:", v18);
  }

}

- (void)_handleSeekCompletion:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[PUBrowsingVideoPlayer setIsSeeking:](self, "setIsSeeking:", 0);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _BOOL8))v7 + 2))(v7, v4);
    v6 = v7;
  }
  if (v4)
  {
    -[PUBrowsingVideoPlayer _performPendingSeekIfNeeded](self, "_performPendingSeekIfNeeded");
    v6 = v7;
  }

}

- (void)setActivated:(BOOL)a3
{
  id v4;

  if (self->_isActivated != a3)
  {
    self->_isActivated = a3;
    if (a3)
      -[PUBrowsingVideoPlayer setShouldLoadVideoSession:](self, "setShouldLoadVideoSession:", 1);
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVideoSession);
    -[PUBrowsingVideoPlayer currentChange](self, "currentChange");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setActivatedDidChange:", 1);

  }
}

- (void)setShouldPreloadVideoContent:(BOOL)a3
{
  if (self->_shouldPreloadVideoContent != a3)
  {
    self->_shouldPreloadVideoContent = a3;
    if (a3)
      -[PUBrowsingVideoPlayer setShouldLoadVideoSession:](self, "setShouldLoadVideoSession:", 1);
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVideoSession);
  }
}

- (void)rewindExistingPlayer
{
  id v2;

  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "seekToPlaybackStartTime");

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  void *v4;
  void *v5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t v7;

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "currentTime");
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  if ((retstr->var2 & 0x1D) != 1)
  {
    v7 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E68];
    retstr->var3 = *(_QWORD *)(v7 + 16);
  }
  return result;
}

- (void)setDesiredSeekTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_desiredSeekTime;
  __int128 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTime time2;
  CMTime time1;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_desiredSeekTime = &self->_desiredSeekTime;
  time1 = *(CMTime *)a3;
  time2 = (CMTime)self->_desiredSeekTime;
  if (CMTimeCompare(&time1, &time2))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_desiredSeekTime->epoch = a3->var3;
    *(_OWORD *)&p_desiredSeekTime->value = v6;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[PUBrowsingVideoPlayer timeObservers](self, "timeObservers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
          time1 = (CMTime)*a3;
          objc_msgSend(v12, "videoPlayer:desiredSeekTimeDidChange:", self, &time1);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      }
      while (v9);
    }

  }
}

- (void)setPlaybackStartTime:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_playbackStartTime;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 playbackStartTime;
  CMTime time1;

  p_playbackStartTime = &self->_playbackStartTime;
  time1 = *(CMTime *)a3;
  playbackStartTime = self->_playbackStartTime;
  if (CMTimeCompare(&time1, (CMTime *)&playbackStartTime))
  {
    v6 = *(_OWORD *)&a3->var0;
    p_playbackStartTime->epoch = a3->var3;
    *(_OWORD *)&p_playbackStartTime->value = v6;
    -[PUBrowsingVideoPlayer _updateVideoSession](self, "_updateVideoSession");
  }
}

- (void)registerTimeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUBrowsingVideoPlayer timeObservers](self, "timeObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)unregisterTimeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUBrowsingVideoPlayer timeObservers](self, "timeObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)registerVideoOutput:(id)a3
{
  id v5;
  _PUBrowsingVideoOutputPlayerReference *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
  _BYTE location[12];
  __int16 v17;
  PUBrowsingVideoPlayer *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingVideoPlayer.m"), 502, CFSTR("%s must be called on the main thread"), "-[PUBrowsingVideoPlayer registerVideoOutput:]");

  }
  objc_getAssociatedObject(v5, (const void *)VideoOutputPlayerReferenceKey);
  v6 = (_PUBrowsingVideoOutputPlayerReference *)objc_claimAutoreleasedReturnValue();
  -[_PUBrowsingVideoOutputPlayerReference player](v6, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[_PUBrowsingVideoOutputPlayerReference player](v6, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412802;
      *(_QWORD *)&location[4] = v5;
      v17 = 2112;
      v18 = self;
      v19 = 2112;
      v20 = v11;
      _os_log_error_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "[PUBrowsingVideoPlayer] Attempted to register output %@ with %@, but it is already registered with %@", location, 0x20u);

    }
  }
  if (!v6)
  {
    v6 = objc_alloc_init(_PUBrowsingVideoOutputPlayerReference);
    objc_setAssociatedObject(v5, (const void *)VideoOutputPlayerReferenceKey, v6, (void *)1);
  }
  -[_PUBrowsingVideoOutputPlayerReference setPlayer:](v6, "setPlayer:", self);
  -[PUBrowsingVideoPlayer videoOutputs](self, "videoOutputs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v5);

  objc_initWeak((id *)location, self);
  v10 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__PUBrowsingVideoPlayer_registerVideoOutput___block_invoke;
  v14[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v15, (id *)location);
  objc_msgSend(v5, "setReadyForDisplayChangeHandler:", v14);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __45__PUBrowsingVideoPlayer_registerVideoOutput___block_invoke_2;
  v13[3] = &unk_1E58ABD10;
  v13[4] = self;
  -[PUViewModel performChanges:](self, "performChanges:", v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)location);

}

- (void)unregisterVideoOutput:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v5 = (void *)MEMORY[0x1E0CB3978];
  v6 = a3;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingVideoPlayer.m"), 521, CFSTR("%s must be called on the main thread"), "-[PUBrowsingVideoPlayer unregisterVideoOutput:]");

  }
  objc_getAssociatedObject(v6, (const void *)VideoOutputPlayerReferenceKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlayer:", 0);
  objc_msgSend(v6, "setReadyForDisplayChangeHandler:", 0);
  -[PUBrowsingVideoPlayer videoOutputs](self, "videoOutputs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v6);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__PUBrowsingVideoPlayer_unregisterVideoOutput___block_invoke;
  v10[3] = &unk_1E58ABD10;
  v10[4] = self;
  -[PUViewModel performChanges:](self, "performChanges:", v10);

}

- (void)_updatePlayerItem
{
  void *v3;
  void *v4;
  id v5;

  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeRangeMapper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBrowsingVideoPlayer _setPlayerItem:timeRangeMapper:](self, "_setPlayerItem:timeRangeMapper:", v3, v4);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  _QWORD v11[11];

  v9 = a3;
  if ((void *)VideoMuteControllerContext == a5)
  {
    if ((a4 & 1) != 0)
      -[PUBrowsingVideoPlayer _updateMuteState](self, "_updateMuteState");
  }
  else if ((void *)videoSessionObservationContext == a5)
  {
    v11[5] = MEMORY[0x1E0C809B0];
    v11[6] = 3221225472;
    v11[7] = __54__PUBrowsingVideoPlayer_observable_didChange_context___block_invoke;
    v11[8] = &unk_1E58AACF0;
    v11[9] = self;
    v11[10] = a4;
    px_dispatch_on_main_queue();
  }
  else
  {
    if ((void *)ApplicationStateContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingVideoPlayer.m"), 605, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__PUBrowsingVideoPlayer_observable_didChange_context___block_invoke_3;
    v11[3] = &unk_1E58ABD10;
    v11[4] = self;
    -[PUViewModel performChanges:](self, "performChanges:", v11);
  }

}

- (void)videoSessionDidPlayToEnd:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", PUBrowsingVideoPlayerDidPlayToEndTimeNotification, self);

}

- (void)videoSessionAudioSessionOutputVolumeDidChange:(id)a3 fromVolume:(float)a4 toVolume:(float)a5
{
  if (a4 < a5)
    px_dispatch_on_main_queue();
}

- (BOOL)shouldLoopCurrentVideo
{
  void *v3;
  BOOL v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  -[PUBrowsingVideoPlayer asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "playbackStyle") == 5)
  {
    v4 = 1;
  }
  else if (-[PUBrowsingVideoPlayer loopingEnabledForAllVideos](self, "loopingEnabledForAllVideos"))
  {
    -[PUBrowsingVideoPlayer asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "duration");
    v7 = v6;
    -[PUBrowsingVideoPlayer minimumDurationForLooping](self, "minimumDurationForLooping");
    v4 = v7 >= v8;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_updateMuteState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__PUBrowsingVideoPlayer__updateMuteState__block_invoke;
  v2[3] = &unk_1E58ABD10;
  v2[4] = self;
  -[PUViewModel performChanges:](self, "performChanges:", v2);
}

- (BOOL)isAutoPlayingVideo
{
  void *v3;
  void *v4;
  char v5;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBrowsingVideoPlayer asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "allowAutoplayVideoForAsset:", v4);

  return v5;
}

- (void)_setPlayerItem:(id)a3 timeRangeMapper:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  if (*(_OWORD *)&self->_timeRangeMapper != __PAIR128__((unint64_t)v9, (unint64_t)v7))
  {
    objc_storeStrong((id *)&self->_playerItem, a3);
    objc_storeStrong((id *)&self->_timeRangeMapper, a4);
    -[PUBrowsingVideoPlayer currentChange](self, "currentChange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setPlayerItemDidChange:", 1);

  }
}

- (void)_setError:(id)a3
{
  NSError *v5;
  void *v6;
  NSError *v7;

  v5 = (NSError *)a3;
  if (self->_error != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_error, a3);
    -[PUBrowsingVideoPlayer currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setErrorDidChange:", 1);

    v5 = v7;
  }

}

- (void)_setAudioStatus:(int64_t)a3
{
  id v3;

  if (self->_audioStatus != a3)
  {
    self->_audioStatus = a3;
    -[PUBrowsingVideoPlayer currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_setAudioStatusDidChange:", 1);

  }
}

- (void)_setPlayerLoadingAllowed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  if (self->_isPlayerLoadingAllowed != a3)
  {
    v3 = a3;
    self->_isPlayerLoadingAllowed = a3;
    -[PUBrowsingVideoPlayer currentChange](self, "currentChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setPlayerLoadingAllowedDidChange:", 1);

    if (v3)
      -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVideoSession);
  }
}

- (void)testing_setVideoSession:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((PFProcessIsLaunchedToExecuteTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingVideoPlayer.m"), 688, CFSTR("%@ should only be called as part of a unit test, but it was called from: \n%@"), v6, v7);

  }
  -[PUBrowsingVideoPlayer setVideoSession:](self, "setVideoSession:", v8);

}

- (void)setVideoSession:(id)a3
{
  PXVideoSession *v5;
  PXVideoSession **p_videoSession;
  PXVideoSession *videoSession;
  PUBrowsingVideoPlayer *v8;
  void *v9;
  void *v10;
  void *v11;
  PXVideoSession *v12;

  v5 = (PXVideoSession *)a3;
  p_videoSession = &self->_videoSession;
  videoSession = self->_videoSession;
  if (videoSession != v5)
  {
    v12 = v5;
    -[PXVideoSession unregisterChangeObserver:context:](videoSession, "unregisterChangeObserver:context:", self, videoSessionObservationContext);
    -[PXVideoSession delegate](*p_videoSession, "delegate");
    v8 = (PUBrowsingVideoPlayer *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[PXVideoSession setDelegate:](*p_videoSession, "setDelegate:", 0);
    -[PXVideoSession leavePresentationContext:presenter:](*p_videoSession, "leavePresentationContext:presenter:", 1, self->_videoSessionPresenter);
    objc_msgSend(MEMORY[0x1E0D7BBD0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "checkInVideoSession:", *p_videoSession);

    objc_storeStrong((id *)&self->_videoSession, a3);
    -[PXVideoSession setDelegate:](v12, "setDelegate:", self);
    -[PUBrowsingVideoPlayer _updatePlayerItem](self, "_updatePlayerItem");
    -[PUBrowsingVideoPlayer _updateVideoDuration](self, "_updateVideoDuration");
    -[PUBrowsingVideoPlayer _setAudioStatus:](self, "_setAudioStatus:", -[PXVideoSession audioStatus](v12, "audioStatus"));
    -[PXVideoSession error](v12, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUBrowsingVideoPlayer _setError:](self, "_setError:", v10);

    -[PXVideoSession registerChangeObserver:context:](*p_videoSession, "registerChangeObserver:context:", self, videoSessionObservationContext);
    -[PXVideoSession enterPresentationContext:presenter:](*p_videoSession, "enterPresentationContext:presenter:", 1, self->_videoSessionPresenter);
    -[PUBrowsingVideoPlayer currentChange](self, "currentChange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setAVPlayerDidChange:", 1);

    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateVideoSessionDesiredPlayState);
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updatePlayerVolume);
    v5 = v12;
  }

}

- (void)_handleShouldReloadAssetMediaNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v11[5];

  v4 = a3;
  -[PUBrowsingVideoPlayer asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EEC2D708))
  {
    v7 = v6;
    objc_msgSend(v5, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (v10)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __67__PUBrowsingVideoPlayer__handleShouldReloadAssetMediaNotification___block_invoke;
      v11[3] = &unk_1E58ABD10;
      v11[4] = self;
      -[PUViewModel performChanges:](self, "performChanges:", v11);
    }

  }
}

- (NSHashTable)timeObservers
{
  NSHashTable *timeObservers;
  NSHashTable *v5;
  NSHashTable *v6;
  void *v8;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingVideoPlayer.m"), 738, CFSTR("%s must be called on the main thread"), "-[PUBrowsingVideoPlayer timeObservers]");

  }
  timeObservers = self->_timeObservers;
  if (!timeObservers)
  {
    v5 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    v6 = self->_timeObservers;
    self->_timeObservers = v5;

    timeObservers = self->_timeObservers;
  }
  return timeObservers;
}

- (NSHashTable)videoOutputs
{
  NSHashTable *videoOutputs;
  NSHashTable *v5;
  NSHashTable *v6;
  void *v8;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingVideoPlayer.m"), 748, CFSTR("%s must be called on the main thread"), "-[PUBrowsingVideoPlayer videoOutputs]");

  }
  videoOutputs = self->_videoOutputs;
  if (!videoOutputs)
  {
    v5 = (NSHashTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 1);
    v6 = self->_videoOutputs;
    self->_videoOutputs = v5;

    videoOutputs = self->_videoOutputs;
  }
  return videoOutputs;
}

- (void)_updatePlayerLoadingAllowedWithUpdateID:(unint64_t)a3
{
  void *v4;
  BOOL v5;
  _QWORD v6[5];
  BOOL v7;

  if (-[PUBrowsingVideoPlayer nextPlayerLoadingEnabledUpdateID](self, "nextPlayerLoadingEnabledUpdateID") == a3)
  {
    -[PUBrowsingVideoPlayer _playerLoadingDisablingReasons](self, "_playerLoadingDisablingReasons");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count") == 0;

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__PUBrowsingVideoPlayer__updatePlayerLoadingAllowedWithUpdateID___block_invoke;
    v6[3] = &unk_1E58AAD68;
    v6[4] = self;
    v7 = v5;
    -[PUViewModel performChanges:](self, "performChanges:", v6);
  }
}

- (void)_requestNewRenderIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[PUBrowsingVideoPlayer shouldRequestNewRender](self, "shouldRequestNewRender")
    && !-[PUBrowsingVideoPlayer isPlaybackDesired](self, "isPlaybackDesired"))
  {
    -[PUBrowsingVideoPlayer setShouldRequestNewRender:](self, "setShouldRequestNewRender:", 0);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[PUBrowsingVideoPlayer videoOutputs](self, "videoOutputs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "prepareForVideoResolutionChange");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__PUBrowsingVideoPlayer__requestNewRenderIfNeeded__block_invoke;
    v8[3] = &unk_1E58ABD10;
    v8[4] = self;
    -[PUViewModel performChanges:](self, "performChanges:", v8);
  }
}

- (void)_updateVideoSession
{
  void *v3;
  PUWrappingPXMediaProvider *v4;
  void *v5;
  PUWrappingPXMediaProvider *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *videoSessionPresenter;
  id v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  PUBrowsingVideoPlayer *v32;
  id v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  -[PUBrowsingVideoPlayer asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [PUWrappingPXMediaProvider alloc];
  -[PUBrowsingVideoPlayer mediaProvider](self, "mediaProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUWrappingPXMediaProvider initWithWrappedMediaProvider:](v4, "initWithWrappedMediaProvider:", v5);

  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUBrowsingVideoPlayer isPlayerLoadingAllowed](self, "isPlayerLoadingAllowed"))
  {
    v8 = -[PUBrowsingVideoPlayer shouldLoadVideoSession](self, "shouldLoadVideoSession");
    if (v7)
      goto LABEL_14;
  }
  else
  {
    v8 = 0;
    if (v7)
      goto LABEL_14;
  }
  if (v3 && v6)
  {
    -[PUBrowsingVideoPlayer asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "playbackStyle") == 5)
      objc_msgSend(MEMORY[0x1E0D78290], "sharedAmbientInstance");
    else
      objc_msgSend(MEMORY[0x1E0D78290], "sharedVideoPlaybackInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc_init(MEMORY[0x1E0D7B2F8]);
    objc_msgSend(v11, "setIsStreamingAllowed:", 1);
    objc_msgSend(v11, "setQuality:", 2);
    -[PUBrowsingVideoPlayer targetSize](self, "targetSize");
    objc_msgSend(v11, "setTargetSize:");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = objc_alloc(MEMORY[0x1E0D7B770]);
      v34[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:", v3, v6, v13, v10, 0);

    }
    else
    {
      v15 = objc_alloc(MEMORY[0x1E0D7B300]);
      v33 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v15, "initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:", v3, v6, v16, v10, 0);

      objc_msgSend(v14, "makeUniqueContentIdentifier");
    }
    objc_msgSend(MEMORY[0x1E0D7BBD0], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "checkOutSessionWithContentProvider:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUBrowsingVideoPlayer setVideoSession:](self, "setVideoSession:", v7);
  }
LABEL_14:
  if (v8)
  {
    v18 = -[PUBrowsingVideoPlayer isActivated](self, "isActivated");
    -[PUBrowsingVideoPlayer asset](self, "asset");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "playbackStyle");

    v21 = v20 == 5 || v18;
    if (v21)
      v22 = 3;
    else
      v22 = 2;
    if ((v21 & 1) == 0
      && objc_msgSend(v7, "playState") == 5
      && (objc_msgSend(v7, "contentProvider"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v23, "loadingResult"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "priority"),
          v24,
          v23,
          v25 == 2))
    {
      PLVideoPlaybackGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v32 = self;
        _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_DEFAULT, "[PUBrowsingVideoPlayer] Declining to trigger autoplay video because it has already failed for %@", buf, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v7, "loadIfNeededWithPriority:", v22);
    }
  }
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __44__PUBrowsingVideoPlayer__updateVideoSession__block_invoke;
  v29[3] = &unk_1E589D7C8;
  v29[4] = self;
  v30 = v3;
  videoSessionPresenter = self->_videoSessionPresenter;
  v28 = v3;
  objc_msgSend(v7, "performChanges:withPresentationContext:presenter:", v29, 1, videoSessionPresenter);

}

- (int64_t)_videoSessionDesiredPlayState
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  PUBrowsingVideoPlayer *v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  PUBrowsingVideoPlayer *v21;
  __int16 v22;
  PUBrowsingVideoPlayer *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[PUBrowsingVideoPlayer isPlaybackDesired](self, "isPlaybackDesired");
  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v3 || !v4)
  {
LABEL_7:
    objc_msgSend(v5, "desiredPlayState");
    v7 = 0;
    goto LABEL_8;
  }
  if (-[PUBrowsingVideoPlayer isUserScrubbing](self, "isUserScrubbing"))
  {
    PLVideoPlaybackGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543362;
      v21 = self;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "[PUBrowsingVideoPlayer] %{public}@ will remain paused while user is scrubbing.", (uint8_t *)&v20, 0xCu);
    }

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D7B1B8], "sharedState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "visibilityState");

  v15 = objc_msgSend(v5, "desiredPlayState");
  v7 = v14 == 1;
  if (v14 == 1 && v15 != 1)
  {
    -[PUBrowsingVideoPlayer videoOutputs](self, "videoOutputs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PXFilter();
    v17 = (PUBrowsingVideoPlayer *)objc_claimAutoreleasedReturnValue();

    v18 = -[PUBrowsingVideoPlayer count](v17, "count");
    v7 = v18 == 0;
    if (v18)
    {
      PLVideoPlaybackGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138543618;
        v21 = v17;
        v22 = 2114;
        v23 = self;
        _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_DEFAULT, "[PUBrowsingVideoPlayer] Unable to start video session playback because one or more video outputs is not ready for display:\n\t%{public}@\n\t%{public}@", (uint8_t *)&v20, 0x16u);
      }

    }
  }
LABEL_8:
  -[PUBrowsingVideoPlayer asset](self, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUBrowsingVideoPlayer asset](self, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "needsDeferredProcessing"))
    {
      +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "enableLiveVideoRender");

    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 1;
  }

  return v7 & v11;
}

- (void)_updateVideoSessionDesiredPlayState
{
  int64_t v3;
  void *v4;
  _QWORD v5[5];

  v3 = -[PUBrowsingVideoPlayer _videoSessionDesiredPlayState](self, "_videoSessionDesiredPlayState");
  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__PUBrowsingVideoPlayer__updateVideoSessionDesiredPlayState__block_invoke;
  v5[3] = &__block_descriptor_40_e33_v16__0___PXMutableVideoSession__8l;
  v5[4] = v3;
  objc_msgSend(v4, "performChanges:withPresentationContext:presenter:", v5, 1, self->_videoSessionPresenter);

}

- (void)_updatePlayerVolume
{
  void *v3;
  _QWORD v4[5];

  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__PUBrowsingVideoPlayer__updatePlayerVolume__block_invoke;
  v4[3] = &unk_1E589D850;
  v4[4] = self;
  objc_msgSend(v3, "performChanges:withPresentationContext:presenter:", v4, 1, self->_videoSessionPresenter);

}

- (void)_performPendingSeekIfNeeded
{
  void *v3;
  void *v4;
  $95D729B680665BEAEFA1D6FCA8238556 *p_pendingSeekTime;
  id pendingSeekCompletionHandler;
  id v7;
  uint64_t v8;
  __int128 v9;
  int64_t epoch;

  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    p_pendingSeekTime = &self->_pendingSeekTime;
    if ((self->_pendingSeekTime.flags & 0x1D) == 1)
    {
      if (objc_msgSend(v3, "isReadyForSeeking"))
      {
        pendingSeekCompletionHandler = self->_pendingSeekCompletionHandler;
        v9 = *(_OWORD *)&p_pendingSeekTime->value;
        epoch = self->_pendingSeekTime.epoch;
        objc_msgSend(v4, "seekToTime:completionHandler:", &v9, pendingSeekCompletionHandler);
        v7 = self->_pendingSeekCompletionHandler;
        self->_pendingSeekCompletionHandler = 0;

        v8 = MEMORY[0x1E0CA2E18];
        *(_OWORD *)&p_pendingSeekTime->value = *MEMORY[0x1E0CA2E18];
        self->_pendingSeekTime.epoch = *(_QWORD *)(v8 + 16);
      }
    }
  }

}

- (void)_setVideoSessionVolume:(id)a3
{
  id v4;
  _BOOL8 v5;
  float v6;
  float v7;
  NSObject *v8;
  double v9;
  int v10;
  double v11;
  __int16 v12;
  PUBrowsingVideoPlayer *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PUBrowsingVideoPlayer shouldFadeNextVolumeChange](self, "shouldFadeNextVolumeChange");
  -[PUBrowsingVideoPlayer setShouldFadeNextVolumeChange:](self, "setShouldFadeNextVolumeChange:", 0);
  v6 = 0.0;
  if (!-[PUBrowsingVideoPlayer isMuted](self, "isMuted"))
  {
    -[PUBrowsingVideoPlayer volume](self, "volume");
    v6 = v7;
  }
  PLVideoPlaybackGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134218242;
    v11 = v6;
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "Browsing Video Player setting player volume to %f: %@", (uint8_t *)&v10, 0x16u);
  }

  *(float *)&v9 = v6;
  objc_msgSend(v4, "setVolume:withFade:", v5, v9);

}

- (void)_updateVideoDuration
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  Float64 v7;
  CMTime v8;
  CMTime v9;
  CMTime v10;

  memset(&v10, 0, sizeof(v10));
  -[PUBrowsingVideoPlayer videoSession](self, "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "videoDuration");
  else
    memset(&v10, 0, sizeof(v10));

  if ((v10.flags & 0x1D) != 1)
  {
    -[PUBrowsingVideoPlayer asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "duration");
    v7 = v6;

    CMTimeMakeWithSeconds(&v9, v7, 60);
    v10 = v9;
  }
  v8 = v10;
  -[PUBrowsingVideoPlayer setDuration:](self, "setDuration:", &v8);
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (int64_t)desiredPlayState
{
  return self->_desiredPlayState;
}

- (int64_t)audioStatus
{
  return self->_audioStatus;
}

- (float)volume
{
  return self->_volume;
}

- (BOOL)loopingEnabledForAllVideos
{
  return self->_loopingEnabledForAllVideos;
}

- (double)minimumDurationForLooping
{
  return self->_minimumDurationForLooping;
}

- (void)setMinimumDurationForLooping:(double)a3
{
  self->_minimumDurationForLooping = a3;
}

- (PXVideoSession)videoSession
{
  return self->_videoSession;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playbackStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 248);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 272);
  return self;
}

- (PFSlowMotionTimeRangeMapper)timeRangeMapper
{
  return self->_timeRangeMapper;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)desiredSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 296);
  return self;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (BOOL)shouldPreloadVideoContent
{
  return self->_shouldPreloadVideoContent;
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isPlayerLoadingAllowed
{
  return self->_isPlayerLoadingAllowed;
}

- (NSMutableSet)_playerLoadingDisablingReasons
{
  return self->__playerLoadingDisablingReasons;
}

- (void)_setPlayerLoadingDisablingReasons:(id)a3
{
  objc_storeStrong((id *)&self->__playerLoadingDisablingReasons, a3);
}

- (BOOL)_isUpdatingAudioSession
{
  return self->__isUpdatingAudioSession;
}

- (void)_setUpdatingAudioSession:(BOOL)a3
{
  self->__isUpdatingAudioSession = a3;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (unint64_t)nextPlayerLoadingEnabledUpdateID
{
  return self->_nextPlayerLoadingEnabledUpdateID;
}

- (void)setNextPlayerLoadingEnabledUpdateID:(unint64_t)a3
{
  self->_nextPlayerLoadingEnabledUpdateID = a3;
}

- (BOOL)shouldLoadVideoSession
{
  return self->_shouldLoadVideoSession;
}

- (BOOL)shouldFadeNextVolumeChange
{
  return self->_shouldFadeNextVolumeChange;
}

- (void)setShouldFadeNextVolumeChange:(BOOL)a3
{
  self->_shouldFadeNextVolumeChange = a3;
}

- (BOOL)shouldRequestNewRender
{
  return self->_shouldRequestNewRender;
}

- (void)setShouldRequestNewRender:(BOOL)a3
{
  self->_shouldRequestNewRender = a3;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (BOOL)isSeeking
{
  return self->_isSeeking;
}

- (void)setIsSeeking:(BOOL)a3
{
  self->_isSeeking = a3;
}

- (BOOL)isUserScrubbing
{
  return self->_isUserScrubbing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__playerLoadingDisablingReasons, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_timeRangeMapper, 0);
  objc_storeStrong((id *)&self->_videoSession, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_videoOutputs, 0);
  objc_storeStrong((id *)&self->_timeObservers, 0);
  objc_storeStrong(&self->_pendingSeekCompletionHandler, 0);
  objc_storeStrong((id *)&self->_updater, 0);
}

uint64_t __44__PUBrowsingVideoPlayer__updatePlayerVolume__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setVideoSessionVolume:", a2);
}

uint64_t __60__PUBrowsingVideoPlayer__updateVideoSessionDesiredPlayState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDesiredPlayState:", *(_QWORD *)(a1 + 32));
}

uint64_t __54__PUBrowsingVideoPlayer__videoSessionDesiredPlayState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "videoOutputIsReadyForDisplay") ^ 1;
}

void __44__PUBrowsingVideoPlayer__updateVideoSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  int v9;
  _BOOL8 v10;
  _OWORD v11[3];
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "playbackStartTime");
  }
  else
  {
    v14 = 0uLL;
    v15 = 0;
  }
  v12 = v14;
  v13 = v15;
  objc_msgSend(v3, "setPlaybackStartTime:", &v12);
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "playbackStyle");

  if (v6 == 5)
    v7 = 0;
  else
    v7 = objc_msgSend(*(id *)(a1 + 32), "shouldLoopCurrentVideo");
  objc_msgSend(v3, "setLoopingEnabled:", v6 == 5);
  objc_msgSend(v3, "setSeekToBeginningAtEnd:", v7);
  objc_msgSend(v3, "setAllowsExternalPlayback:", 0);
  v8 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v11[0] = *MEMORY[0x1E0CA2E40];
  v11[1] = v8;
  v11[2] = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 32);
  objc_msgSend(v3, "setPlaybackTimeRange:", v11);
  objc_msgSend(*(id *)(a1 + 32), "_setVideoSessionVolume:", v3);
  v9 = objc_msgSend(*(id *)(a1 + 32), "isPlaybackDesired");
  v10 = 0;
  if (v9)
    v10 = objc_msgSend(*(id *)(a1 + 40), "playbackStyle", 0) != 5;
  objc_msgSend(v3, "setPreventsSleepDuringVideoPlayback:", v10);

}

uint64_t __50__PUBrowsingVideoPlayer__requestNewRenderIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v8 = 0uLL;
  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "videoSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "currentTime");
  }
  else
  {
    v8 = 0uLL;
    v9 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidateExistingPlayer");
  v4 = *(void **)(a1 + 32);
  v6 = v8;
  v7 = v9;
  objc_msgSend(v4, "seekToTime:completionHandler:", &v6, 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setNeedsUpdateOf:", sel__updateVideoSession);
}

uint64_t __65__PUBrowsingVideoPlayer__updatePlayerLoadingAllowedWithUpdateID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPlayerLoadingAllowed:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __67__PUBrowsingVideoPlayer__handleShouldReloadAssetMediaNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setNeedsUpdateOf:", sel__updateVideoSession);
}

void __41__PUBrowsingVideoPlayer__updateMuteState__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isAutoPlayingVideo")
    && (objc_msgSend(*(id *)(a1 + 32), "asset"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "playbackStyle"),
        v2,
        v3 != 5))
  {
    objc_msgSend(MEMORY[0x1E0D7BBB0], "sharedController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setIsMuted:", objc_msgSend(v4, "isMuted"));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsMuted:", 0);
  }
}

uint64_t __91__PUBrowsingVideoPlayer_videoSessionAudioSessionOutputVolumeDidChange_fromVolume_toVolume___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __91__PUBrowsingVideoPlayer_videoSessionAudioSessionOutputVolumeDidChange_fromVolume_toVolume___block_invoke_2;
  v3[3] = &unk_1E58ABD10;
  v3[4] = v1;
  return objc_msgSend(v1, "performChanges:", v3);
}

void __91__PUBrowsingVideoPlayer_videoSessionAudioSessionOutputVolumeDidChange_fromVolume_toVolume___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "currentChange");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_setAudioSessionVolumeIncreaseDidOccur:", 1);

}

uint64_t __54__PUBrowsingVideoPlayer_observable_didChange_context___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__PUBrowsingVideoPlayer_observable_didChange_context___block_invoke_2;
  v3[3] = &unk_1E58AACF0;
  v1 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v1;
  return objc_msgSend(v4, "performChanges:", v3);
}

uint64_t __54__PUBrowsingVideoPlayer_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setNeedsUpdateOf:", sel__updateVideoSessionDesiredPlayState);
}

void __54__PUBrowsingVideoPlayer_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
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
  float v29;
  double v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updatePlayerItem");
    v2 = *(_QWORD *)(a1 + 40);
    if ((v2 & 0x80) == 0)
    {
LABEL_3:
      if ((v2 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((v2 & 0x80) == 0)
  {
    goto LABEL_3;
  }
  v37 = 0uLL;
  v38 = 0;
  objc_msgSend(*(id *)(a1 + 32), "videoSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "currentTime");
  }
  else
  {
    v37 = 0uLL;
    v38 = 0;
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "timeObservers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v11 = *(_QWORD *)(a1 + 32);
        v31 = v37;
        v32 = v38;
        objc_msgSend(v10, "videoPlayer:currentTimeDidChange:", v11, &v31);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v7);
  }

  v2 = *(_QWORD *)(a1 + 40);
  if ((v2 & 0x10) == 0)
  {
LABEL_4:
    if ((v2 & 0x100) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "videoSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setAudioStatus:", objc_msgSend(v12, "audioStatus"));

  v2 = *(_QWORD *)(a1 + 40);
  if ((v2 & 0x100) == 0)
  {
LABEL_5:
    if ((v2 & 0x200) == 0)
      goto LABEL_25;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(*(id *)(a1 + 32), "currentChange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setAtBeginningDidChange:", 1);

  if ((*(_QWORD *)(a1 + 40) & 0x200) == 0)
    goto LABEL_25;
LABEL_21:
  objc_msgSend(*(id *)(a1 + 32), "currentChange");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setAtEndDidChange:", 1);

  objc_msgSend(*(id *)(a1 + 32), "videoSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isAtEnd"))
  {
    v16 = objc_msgSend(*(id *)(a1 + 32), "shouldLoopCurrentVideo");

    if ((v16 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:reason:", 1, CFSTR("Video played to end"));
  }
  else
  {

  }
LABEL_25:
  v17 = *(_QWORD *)(a1 + 40);
  if ((v17 & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentChange");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setStalledDidChange:", 1);

    v17 = *(_QWORD *)(a1 + 40);
    if ((v17 & 0x20) == 0)
    {
LABEL_27:
      if ((v17 & 4) == 0)
        goto LABEL_28;
      goto LABEL_34;
    }
  }
  else if ((v17 & 0x20) == 0)
  {
    goto LABEL_27;
  }
  objc_msgSend(*(id *)(a1 + 32), "currentChange");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setPlayableDidChange:", 1);

  v17 = *(_QWORD *)(a1 + 40);
  if ((v17 & 4) == 0)
  {
LABEL_28:
    if ((v17 & 0x2000) == 0)
      goto LABEL_29;
    goto LABEL_41;
  }
LABEL_34:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setNeedsUpdateOf:", sel__updateVideoSession);
  objc_msgSend(*(id *)(a1 + 32), "videoSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "error");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setError:", v21);

  objc_msgSend(*(id *)(a1 + 32), "currentChange");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_setPlayStateDidChange:", 1);

  objc_msgSend(*(id *)(a1 + 32), "avPlayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "videoComposition");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "instructions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "firstObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "videoSession");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "playState") == 3)
        v29 = 1.0;
      else
        v29 = 0.0;

      *(float *)&v30 = v29;
      objc_msgSend(v27, "setPlaybackRate:", v30);
    }
  }

  v17 = *(_QWORD *)(a1 + 40);
  if ((v17 & 0x2000) == 0)
  {
LABEL_29:
    if ((v17 & 0x40) == 0)
      return;
    goto LABEL_30;
  }
LABEL_41:
  objc_msgSend(*(id *)(a1 + 32), "_performPendingSeekIfNeeded");
  if ((*(_QWORD *)(a1 + 40) & 0x40) == 0)
    return;
LABEL_30:
  objc_msgSend(*(id *)(a1 + 32), "_updateVideoDuration");
}

uint64_t __47__PUBrowsingVideoPlayer_unregisterVideoOutput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setNeedsUpdateOf:", sel__updateVideoSessionDesiredPlayState);
}

void __45__PUBrowsingVideoPlayer_registerVideoOutput___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateVideoSessionDesiredPlayState");

}

uint64_t __45__PUBrowsingVideoPlayer_registerVideoOutput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setNeedsUpdateOf:", sel__updateVideoSessionDesiredPlayState);
}

void __85__PUBrowsingVideoPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__PUBrowsingVideoPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke_2;
  block[3] = &unk_1E589D778;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  v7 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v6);
}

uint64_t __85__PUBrowsingVideoPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setShouldLoadVideoSession:", 1);
}

void __85__PUBrowsingVideoPlayer_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleSeekCompletion:finished:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

Class __34__PUBrowsingVideoPlayer_setAsset___block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("CAMTransientAsset"));
  setAsset__CAMTransientAssetClass = (uint64_t)result;
  return result;
}

@end
