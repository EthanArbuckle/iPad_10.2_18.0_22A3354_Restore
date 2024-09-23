@implementation PUBrowsingIrisPlayer

- (PUBrowsingIrisPlayer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingIrisPlayer.m"), 99, CFSTR("%s is not available as initializer"), "-[PUBrowsingIrisPlayer init]");

  abort();
}

- (PUBrowsingIrisPlayer)initWithAsset:(id)a3 mediaProvider:(id)a4
{
  id v8;
  id v9;
  PUBrowsingIrisPlayer *v10;
  NSMutableSet *v11;
  NSMutableSet *livePhotoLoadingDisablingReasons;
  NSMutableSet *v13;
  NSMutableSet *livePhotoPlaybackDisablingReasons;
  uint64_t v15;
  __int128 v16;
  void *v18;
  void *v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PUBrowsingIrisPlayer;
  v10 = -[PUViewModel init](&v20, sel_init);
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        objc_storeStrong((id *)&v10->_asset, a3);
        objc_storeStrong((id *)&v10->_mediaProvider, a4);
        v10->_loadingTarget = 0;
        v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        livePhotoLoadingDisablingReasons = v10->_livePhotoLoadingDisablingReasons;
        v10->_livePhotoLoadingDisablingReasons = v11;

        v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        livePhotoPlaybackDisablingReasons = v10->_livePhotoPlaybackDisablingReasons;
        v10->_livePhotoPlaybackDisablingReasons = v13;

        v15 = MEMORY[0x1E0C83FE8];
        v16 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
        *(_OWORD *)&v10[1].super.super.isa = *MEMORY[0x1E0C83FE8];
        *(_OWORD *)&v10[1].super._nestedChanges = v16;
        *(_OWORD *)&v10[1].super._numAppliedPendingChanges = *(_OWORD *)(v15 + 32);
        v10->_imageLoadingEnabled = 1;
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PUBrowsingIrisPlayer.m"), 109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

      if (v9)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PUBrowsingIrisPlayer.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProvider != nil"));

    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_videoPeriodicObserver)
    -[ISWrappedAVPlayer removeTimeObserver:](self->_videoPlayer, "removeTimeObserver:");
  -[PUBrowsingIrisPlayer _cancelAllRequests](self, "_cancelAllRequests");
  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingIrisPlayer;
  -[PUBrowsingIrisPlayer dealloc](&v3, sel_dealloc);
}

- (void)setAsset:(id)a3
{
  PUDisplayAsset *v5;
  PUDisplayAsset **p_asset;
  void *v7;
  int v8;
  PUDisplayAsset *v9;
  PUDisplayAsset *v10;
  PUDisplayAsset *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  char v15;
  _QWORD v16[5];

  v5 = (PUDisplayAsset *)a3;
  p_asset = &self->_asset;
  if (self->_asset != v5)
  {
    -[PUBrowsingIrisPlayer _playerCreateIfNeeded:](self, "_playerCreateIfNeeded:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && -[PUDisplayAsset isPhotoIrisPlaceholder](*p_asset, "isPhotoIrisPlaceholder"))
      v8 = -[PUDisplayAsset isPhotoIrisPlaceholder](v5, "isPhotoIrisPlaceholder") ^ 1;
    else
      v8 = 0;
    v9 = *p_asset;
    v10 = v5;
    v11 = v9;
    if (v11 == v10)
    {
      v13 = 0;
    }
    else
    {
      v12 = -[PUDisplayAsset isContentEqualTo:](v10, "isContentEqualTo:", v11);
      if (!v12)
        v12 = -[PUDisplayAsset isContentEqualTo:](v11, "isContentEqualTo:", v10);
      v13 = v12 != 2;
    }

    objc_storeStrong((id *)&self->_asset, a3);
    -[PUBrowsingIrisPlayer currentChange](self, "currentChange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHasChanges");

    if (v8)
    {
      if (-[PUBrowsingIrisPlayer livePhotoRequestState](self, "livePhotoRequestState") != 5)
        goto LABEL_20;
      if (v7)
      {
        v15 = objc_msgSend(v7, "status") != 2 || v13;
        if ((v15 & 1) == 0)
          goto LABEL_22;
        goto LABEL_20;
      }
    }
    if (!v13)
    {
LABEL_22:

      goto LABEL_23;
    }
LABEL_20:
    if (!objc_msgSend(v7, "currentPlaybackStyle"))
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __33__PUBrowsingIrisPlayer_setAsset___block_invoke;
      v16[3] = &unk_1E58ABD10;
      v16[4] = self;
      -[PUViewModel performChanges:](self, "performChanges:", v16);
    }
    goto LABEL_22;
  }
LABEL_23:

}

- (void)playPreviewHintWhenReady
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__PUBrowsingIrisPlayer_playPreviewHintWhenReady__block_invoke;
  v2[3] = &unk_1E58ABD10;
  v2[4] = self;
  -[PUViewModel performChanges:](self, "performChanges:", v2);
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingIrisPlayer;
  -[PUViewModel didPerformChanges](&v3, sel_didPerformChanges);
  -[PUBrowsingIrisPlayer _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)setLivePhotoPlaybackDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingIrisPlayer.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  -[PUBrowsingIrisPlayer livePhotoPlaybackDisablingReasons](self, "livePhotoPlaybackDisablingReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "addObject:", v10);
  else
    objc_msgSend(v7, "removeObject:", v10);
  -[PUBrowsingIrisPlayer setIsLivePhotoPlaybackAllowed:](self, "setIsLivePhotoPlaybackAllowed:", objc_msgSend(v8, "count") == 0);

}

- (void)setIsLivePhotoPlaybackAllowed:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_isLivePhotoPlaybackAllowed != a3)
  {
    v3 = a3;
    self->_isLivePhotoPlaybackAllowed = a3;
    -[PUBrowsingIrisPlayer currentChange](self, "currentChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsLivePhotoPlaybackAllowedDidChange:", 1);

    -[PUBrowsingIrisPlayer _playerCreateIfNeeded:](self, "_playerCreateIfNeeded:", 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaybackAllowed:", v3);

  }
}

- (void)setScrubbingPhotoTime:(id *)a3 completion:(id)a4
{
  id v6;
  __int128 v7;
  void *v8;
  $95D729B680665BEAEFA1D6FCA8238556 scrubbingPhotoTime;
  CMTime time1;

  v6 = a4;
  time1 = *(CMTime *)a3;
  scrubbingPhotoTime = self->_scrubbingPhotoTime;
  if (CMTimeCompare(&time1, (CMTime *)&scrubbingPhotoTime))
  {
    -[PUBrowsingIrisPlayer setSeekCompletionHandler:](self, "setSeekCompletionHandler:", v6);
    v7 = *(_OWORD *)&a3->var0;
    self->_scrubbingPhotoTime.epoch = a3->var3;
    *(_OWORD *)&self->_scrubbingPhotoTime.value = v7;
    -[PUBrowsingIrisPlayer _invalidatePlayerItemScrubbingPhotoTime](self, "_invalidatePlayerItemScrubbingPhotoTime");
    -[PUBrowsingIrisPlayer currentChange](self, "currentChange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScrubbingPhotoTimeDidChange:", 1);

  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentPhotoTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  int64_t v11;

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  result = -[PUBrowsingIrisPlayer scrubbingPhotoTime](self, "scrubbingPhotoTime");
  if ((retstr->var2 & 1) == 0)
  {
    -[PUBrowsingIrisPlayer player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "photoCMTime");
    }
    else
    {
      v10 = 0uLL;
      v11 = 0;
    }
    *(_OWORD *)&retstr->var0 = v10;
    retstr->var3 = v11;

  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentVideoDuration
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  void *v6;

  -[PUBrowsingIrisPlayer videoPlayer](self, "videoPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "currentItemDuration");
    v4 = v6;
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (void)setCurrentlyDisplayedTimes:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  char v6;
  NSArray *v7;
  NSArray *currentlyDisplayedTimes;
  void *v9;
  NSArray *v10;

  v4 = (NSArray *)a3;
  v5 = v4;
  if (self->_currentlyDisplayedTimes != v4)
  {
    v10 = v4;
    v6 = -[NSArray isEqual:](v4, "isEqual:");
    v5 = v10;
    if ((v6 & 1) == 0)
    {
      v7 = (NSArray *)-[NSArray copy](v10, "copy");
      currentlyDisplayedTimes = self->_currentlyDisplayedTimes;
      self->_currentlyDisplayedTimes = v7;

      -[PUBrowsingIrisPlayer currentChange](self, "currentChange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setCurrentlyDisplayedTimesDidChange:", 1);

      v5 = v10;
    }
  }

}

- (void)setLivePhotoLoadingDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingIrisPlayer.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  -[PUBrowsingIrisPlayer livePhotoLoadingDisablingReasons](self, "livePhotoLoadingDisablingReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    objc_msgSend(v7, "addObject:", v10);
  else
    objc_msgSend(v7, "removeObject:", v10);
  -[PUBrowsingIrisPlayer setLivePhotoLoadingAllowed:](self, "setLivePhotoLoadingAllowed:", objc_msgSend(v8, "count") == 0);

}

- (void)setLivePhotoLoadingAllowed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;

  if (self->_livePhotoLoadingAllowed != a3)
  {
    v3 = a3;
    self->_livePhotoLoadingAllowed = a3;
    -[PUBrowsingIrisPlayer currentChange](self, "currentChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsLivePhotoLoadingAllowedDidChange:", 1);

    -[PUBrowsingIrisPlayer livePhoto](self, "livePhoto");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 || !v3)
    {

    }
    else if (!-[PUBrowsingIrisPlayer isContentLoadingRequestInProgress](self, "isContentLoadingRequestInProgress"))
    {
      -[PUBrowsingIrisPlayer _invalidateLivePhoto](self, "_invalidateLivePhoto");
    }
  }
}

- (void)setActivated:(BOOL)a3
{
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  if (self->_activated != a3)
  {
    self->_activated = a3;
    if (!a3)
    {
      -[PUBrowsingIrisPlayer player](self, "player");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stopPlaybackAnimated:", 1);

      v6 = *MEMORY[0x1E0CA2E18];
      v7 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      -[PUBrowsingIrisPlayer setScrubbingPhotoTime:completion:](self, "setScrubbingPhotoTime:completion:", &v6, 0);
    }
    -[PUBrowsingIrisPlayer currentChange](self, "currentChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActivatedDidChange:", 1);

  }
}

- (void)setImageLoadingEnabled:(BOOL)a3
{
  id v4;

  if (self->_imageLoadingEnabled != a3)
  {
    self->_imageLoadingEnabled = a3;
    -[PUBrowsingIrisPlayer _invalidateLivePhoto](self, "_invalidateLivePhoto");
    -[PUBrowsingIrisPlayer currentChange](self, "currentChange");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setImageLoadingEnabledDidChange:", 1);

  }
}

- (void)setLivePhoto:(id)a3
{
  PHLivePhoto *v5;
  void *v6;
  PHLivePhoto *v7;

  v5 = (PHLivePhoto *)a3;
  if (self->_livePhoto != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_livePhoto, a3);
    -[PUBrowsingIrisPlayer currentChange](self, "currentChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLivePhotoDidChange:", 1);

    -[PUBrowsingIrisPlayer _invalidatePlayerContent](self, "_invalidatePlayerContent");
    v5 = v7;
  }

}

- (id)newViewModelChange
{
  return objc_alloc_init(PUBrowsingIrisPlayerChange);
}

- (PUBrowsingIrisPlayerChange)currentChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingIrisPlayer;
  -[PUViewModel currentChange](&v3, sel_currentChange);
  return (PUBrowsingIrisPlayerChange *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)registerChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingIrisPlayer;
  -[PUViewModel registerChangeObserver:](&v3, sel_registerChangeObserver_, a3);
}

- (void)unregisterChangeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUBrowsingIrisPlayer;
  -[PUViewModel unregisterChangeObserver:](&v3, sel_unregisterChangeObserver_, a3);
}

- (void)setLoadingTarget:(int64_t)a3
{
  if (self->_loadingTarget != a3)
  {
    self->_loadingTarget = a3;
    -[PUBrowsingIrisPlayer _invalidatePlayerItemLoadingTarget](self, "_invalidatePlayerItemLoadingTarget");
  }
}

- (id)_playerCreateIfNeeded:(BOOL)a3
{
  ISLivePhotoPlayer *player;
  BOOL v5;
  ISLivePhotoPlayer *v6;
  ISLivePhotoPlayer *v7;
  _QWORD v9[5];

  player = self->_player;
  if (player)
    v5 = 1;
  else
    v5 = !a3;
  if (!v5)
  {
    v6 = (ISLivePhotoPlayer *)objc_alloc_init(MEMORY[0x1E0D78268]);
    v7 = self->_player;
    self->_player = v6;

    -[ISLivePhotoPlayer registerChangeObserver:context:](self->_player, "registerChangeObserver:context:", self, PULivePhotoPlayerObservationContext);
    -[ISLivePhotoPlayer setAudioEnabled:](self->_player, "setAudioEnabled:", 0);
    -[ISLivePhotoPlayer setDelegate:](self->_player, "setDelegate:", self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__PUBrowsingIrisPlayer__playerCreateIfNeeded___block_invoke;
    v9[3] = &unk_1E58ABD10;
    v9[4] = self;
    -[PUViewModel performChanges:](self, "performChanges:", v9);
    player = self->_player;
  }
  return player;
}

- (ISLivePhotoPlayer)player
{
  return (ISLivePhotoPlayer *)-[PUBrowsingIrisPlayer _playerCreateIfNeeded:](self, "_playerCreateIfNeeded:", 0);
}

- (id)playerCreateIfNeeded
{
  return -[PUBrowsingIrisPlayer _playerCreateIfNeeded:](self, "_playerCreateIfNeeded:", 1);
}

- (CGSize)_targetSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  v7 = v4 * *(double *)&PUMainScreenScale_screenScale;
  v8 = v6 * *(double *)&PUMainScreenScale_screenScale;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)_contentMode
{
  return 0;
}

- (void)_handleLivePhotoResult:(id)a3 info:(id)a4 requestID:(int)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  PUBrowsingIrisPlayer *v15;
  uint64_t v16;
  char v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  PUBrowsingIrisPlayer *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[PUBrowsingIrisPlayer livePhotoRequestID](self, "livePhotoRequestID") == a5)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v12)
    {
      v15 = self;
      v16 = 4;
LABEL_4:
      -[PUBrowsingIrisPlayer setLivePhotoRequestState:](v15, "setLivePhotoRequestState:", v16);
LABEL_18:

      goto LABEL_19;
    }
    v17 = v14 ^ 1;
    if (!v8)
      v17 = 1;
    if ((v17 & 1) == 0)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __62__PUBrowsingIrisPlayer__handleLivePhotoResult_info_requestID___block_invoke;
      v26[3] = &unk_1E58ABCA8;
      v26[4] = self;
      v27 = v8;
      -[PUViewModel performChanges:](self, "performChanges:", v26);
      v18 = v27;
LABEL_17:

      goto LABEL_18;
    }
    if (v8 || !v10)
    {
      if (v8)
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __62__PUBrowsingIrisPlayer__handleLivePhotoResult_info_requestID___block_invoke_2;
        v23[3] = &unk_1E58ABCA8;
        v23[4] = self;
        v24 = v8;
        -[PUViewModel performChanges:](self, "performChanges:", v23);
        -[PUBrowsingIrisPlayer setLivePhotoRequestState:](self, "setLivePhotoRequestState:", 5);
        v18 = v24;
        goto LABEL_17;
      }
    }
    else if (-[PUBrowsingIrisPlayer livePhotoRequestState](self, "livePhotoRequestState") == 1)
    {
      PLOneUpGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        -[PUBrowsingIrisPlayer asset](self, "asset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v29 = self;
        v30 = 2112;
        v31 = v20;
        v32 = 2112;
        v33 = v9;
        _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_DEBUG, "%@ Failed to load live photo for Iris asset %@: %@, will retry...", buf, 0x20u);

      }
      -[PUBrowsingIrisPlayer setLivePhotoRequestState:](self, "setLivePhotoRequestState:", 2);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __62__PUBrowsingIrisPlayer__handleLivePhotoResult_info_requestID___block_invoke_154;
      v25[3] = &unk_1E58ABD10;
      v25[4] = self;
      -[PUViewModel performChanges:](self, "performChanges:", v25);
      goto LABEL_18;
    }
    PLOneUpGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      -[PUBrowsingIrisPlayer asset](self, "asset");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v29 = self;
      v30 = 2112;
      v31 = v22;
      v32 = 2112;
      v33 = v9;
      _os_log_impl(&dword_1AAB61000, v21, OS_LOG_TYPE_DEBUG, "%@ Failed to load live photo for Iris asset %@: %@", buf, 0x20u);

    }
    v15 = self;
    v16 = 3;
    goto LABEL_4;
  }
LABEL_19:

}

- (void)_cancelAllRequests
{
  id v3;

  -[PUBrowsingIrisPlayer mediaProvider](self, "mediaProvider");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelImageRequest:", -[PUBrowsingIrisPlayer livePhotoRequestID](self, "livePhotoRequestID"));

}

- (BOOL)isContentLoadingRequestInProgress
{
  int64_t v3;

  v3 = -[PUBrowsingIrisPlayer livePhotoRequestState](self, "livePhotoRequestState");
  if (v3 != 1)
    LOBYTE(v3) = -[PUBrowsingIrisPlayer livePhotoRequestState](self, "livePhotoRequestState") == 2;
  return v3;
}

- (BOOL)_needsUpdate
{
  return !self->_isValid.livePhoto
      || !self->_isValid.playerContent
      || !self->_isValid.playerLoadingTarget
      || !self->_isValid.playerItemScrubbingPhotoTime
      || !self->_isValid.playing;
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUBrowsingIrisPlayer _needsUpdate](self, "_needsUpdate"))
  {
    -[PUBrowsingIrisPlayer _updateLivePhotoIfNeeded](self, "_updateLivePhotoIfNeeded");
    -[PUBrowsingIrisPlayer _updatePlayerContentIfNeeded](self, "_updatePlayerContentIfNeeded");
    -[PUBrowsingIrisPlayer _updatePlayerItemScrubbingPhotoTimeIfNeeded](self, "_updatePlayerItemScrubbingPhotoTimeIfNeeded");
    -[PUBrowsingIrisPlayer _updatePlayerItemLoadingTargetIfNeeded](self, "_updatePlayerItemLoadingTargetIfNeeded");
    -[PUBrowsingIrisPlayer _updatePlayingIfNeeded](self, "_updatePlayingIfNeeded");
    if (-[PUBrowsingIrisPlayer _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUBrowsingIrisPlayer.m"), 435, CFSTR("[%@] Update still needed after update pass"), self);

    }
  }
}

- (void)unloadLivePhoto
{
  -[PUBrowsingIrisPlayer _invalidateLivePhoto](self, "_invalidateLivePhoto");
  -[PUBrowsingIrisPlayer setLivePhoto:](self, "setLivePhoto:", 0);
}

- (void)_invalidateLivePhoto
{
  -[PUBrowsingIrisPlayer _cancelAllRequests](self, "_cancelAllRequests");
  self->_isValid.livePhoto = 0;
}

- (void)_updateLivePhotoIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  id location;

  if (!self->_isValid.livePhoto)
  {
    self->_isValid.livePhoto = 1;
    if (-[PUBrowsingIrisPlayer isLivePhotoLoadingAllowed](self, "isLivePhotoLoadingAllowed"))
    {
      -[PUBrowsingIrisPlayer asset](self, "asset");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "canPlayPhotoIris");

      if (v4)
      {
        if (-[PUBrowsingIrisPlayer livePhotoRequestState](self, "livePhotoRequestState") != 2)
          -[PUBrowsingIrisPlayer setLivePhotoRequestState:](self, "setLivePhotoRequestState:", 1);
        -[PUBrowsingIrisPlayer mediaProvider](self, "mediaProvider");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUBrowsingIrisPlayer asset](self, "asset");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        v16 = 0;
        v17 = &v16;
        v18 = 0x2020000000;
        v19 = 0;
        -[PUBrowsingIrisPlayer setLivePhotoRequestID:](self, "setLivePhotoRequestID:", 0);
        -[PUBrowsingIrisPlayer _targetSize](self, "_targetSize");
        v8 = v7;
        v10 = v9;
        v11 = -[PUBrowsingIrisPlayer _contentMode](self, "_contentMode");
        v12 = objc_alloc_init(MEMORY[0x1E0CD1618]);
        objc_msgSend(v12, "setNetworkAccessAllowed:", 1);
        objc_msgSend(v12, "setDeliveryMode:", 1);
        objc_msgSend(v12, "setIncludeImage:", -[PUBrowsingIrisPlayer isImageLoadingEnabled](self, "isImageLoadingEnabled"));
        objc_msgSend(v12, "setDownloadIntent:", 3);
        objc_msgSend(v12, "setDownloadPriority:", 0);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __48__PUBrowsingIrisPlayer__updateLivePhotoIfNeeded__block_invoke;
        v14[3] = &unk_1E589D608;
        objc_copyWeak(&v15, &location);
        v14[4] = &v16;
        v13 = objc_msgSend(v5, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v6, v11, v12, v14, v8, v10);
        *((_DWORD *)v17 + 6) = v13;
        -[PUBrowsingIrisPlayer setLivePhotoRequestID:](self, "setLivePhotoRequestID:", v13);
        objc_destroyWeak(&v15);

        _Block_object_dispose(&v16, 8);
        objc_destroyWeak(&location);

      }
    }
  }
}

- (void)_invalidatePlayerContent
{
  self->_isValid.playerContent = 0;
}

- (void)_updatePlayerContentIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double Seconds;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  CMTime v18;
  int v19;

  if (!self->_isValid.playerContent)
  {
    self->_isValid.playerContent = 1;
    -[PUBrowsingIrisPlayer livePhoto](self, "livePhoto");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUBrowsingIrisPlayer _playerCreateIfNeeded:](self, "_playerCreateIfNeeded:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "videoAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(v3, "image");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageOrientation");
      v7 = PLExifOrientationFromImageOrientation();
      objc_msgSend(v3, "photoTime");
      Seconds = 0.0;
      if ((v19 & 0x1D) == 1)
      {
        objc_msgSend(v3, "photoTime");
        Seconds = CMTimeGetSeconds(&v18);
      }
      v9 = objc_msgSend(v3, "hasPhotoColorAdjustments");
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D78260]), "initWithVideoAsset:UIImage:photoTime:photoEXIFOrientation:options:", v5, v6, v7, v9, Seconds);
      -[PUBrowsingIrisPlayer asset](self, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "aspectRatio");
      v13 = v12;

      if (v13 <= 0.0)
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v16 = (void *)MEMORY[0x1E0D78278];
      -[PUBrowsingIrisPlayer _targetSize](self, "_targetSize");
      objc_msgSend(v16, "playerItemWithAsset:targetSize:contentAspectRatio:", v10, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUBrowsingIrisPlayer _invalidatePlayerItemScrubbingPhotoTime](self, "_invalidatePlayerItemScrubbingPhotoTime");
      -[PUBrowsingIrisPlayer _invalidatePlayerItemLoadingTarget](self, "_invalidatePlayerItemLoadingTarget");

      if (v15)
      {
        -[PUBrowsingIrisPlayer _playerCreateIfNeeded:](self, "_playerCreateIfNeeded:", 1);
        v17 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v17;
      }
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v4, "setPlayerItem:", v15);

  }
}

- (void)_updateVitalityTransform
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__PUBrowsingIrisPlayer__updateVitalityTransform__block_invoke;
  v2[3] = &unk_1E58ABD10;
  v2[4] = self;
  -[PUViewModel performChanges:](self, "performChanges:", v2);
}

- (void)_handleLoadedVitalityTransform:(__n128)a3 limitingAllowed:(__n128)a4 forAsset:(uint64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v17[4];
  __n128 v18;
  __n128 v19;
  __n128 v20;
  void *v21;
  char v22;

  v9 = a7;
  objc_msgSend(a1, "_playerCreateIfNeeded:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "playerItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "videoAsset");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v9)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __80__PUBrowsingIrisPlayer__handleLoadedVitalityTransform_limitingAllowed_forAsset___block_invoke;
    v17[3] = &unk_1E589D680;
    v21 = a1;
    v18 = a2;
    v19 = a3;
    v20 = a4;
    v22 = a6;
    objc_msgSend(a1, "performChanges:", v17);
  }
}

- (void)setVitalityTransform:(float32x4_t)a3 limitingAllowed:(float32x4_t)a4
{
  uint32x4_t v6;
  id v7;

  v6 = (uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a3, a1[17]), (int8x16_t)vceqq_f32(a2, a1[16])), (int8x16_t)vceqq_f32(a4, a1[18]));
  v6.i32[3] = v6.i32[2];
  if ((vminvq_u32(v6) & 0x80000000) == 0 || a1[5].u8[13] != a6)
  {
    a1[5].i8[13] = a6;
    a1[16] = a2;
    a1[17] = a3;
    a1[18] = a4;
    -[float32x4_t currentChange](a1, "currentChange");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVitalityTransformDidChange:", 1);

  }
}

- (void)_invalidatePlayerItemLoadingTarget
{
  self->_isValid.playerLoadingTarget = 0;
}

- (void)_updatePlayerItemLoadingTargetIfNeeded
{
  void *v3;
  id v4;

  if (!self->_isValid.playerLoadingTarget)
  {
    self->_isValid.playerLoadingTarget = 1;
    -[PUBrowsingIrisPlayer _playerCreateIfNeeded:](self, "_playerCreateIfNeeded:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLoadingTarget:", -[PUBrowsingIrisPlayer loadingTarget](self, "loadingTarget"));

  }
}

- (void)_invalidatePlayerItemScrubbingPhotoTime
{
  self->_isValid.playerItemScrubbingPhotoTime = 0;
}

- (void)_updatePlayerItemScrubbingPhotoTimeIfNeeded
{
  void *v3;
  void *v4;
  _BYTE v5[24];

  if (!self->_isValid.playerItemScrubbingPhotoTime)
  {
    self->_isValid.playerItemScrubbingPhotoTime = 1;
    -[PUBrowsingIrisPlayer player](self, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUBrowsingIrisPlayer scrubbingPhotoTime](self, "scrubbingPhotoTime");
    -[PUBrowsingIrisPlayer seekCompletionHandler](self, "seekCompletionHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSeekTime:completion:", v5, v4);

  }
}

- (void)setVideoPlayer:(id)a3
{
  ISWrappedAVPlayer *v5;
  ISWrappedAVPlayer **p_videoPlayer;
  ISWrappedAVPlayer *videoPlayer;
  id videoPeriodicObserver;
  ISWrappedAVPlayer *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CMTime v16;
  id location;

  v5 = (ISWrappedAVPlayer *)a3;
  p_videoPlayer = &self->_videoPlayer;
  videoPlayer = self->_videoPlayer;
  if (videoPlayer != v5)
  {
    -[ISWrappedAVPlayer unregisterChangeObserver:context:](videoPlayer, "unregisterChangeObserver:context:", self, PUISWrappedAVPlayerObservationContext);
    -[ISWrappedAVPlayer removeTimeObserver:](*p_videoPlayer, "removeTimeObserver:", self->_videoPeriodicObserver);
    videoPeriodicObserver = self->_videoPeriodicObserver;
    self->_videoPeriodicObserver = 0;

    objc_storeStrong((id *)&self->_videoPlayer, a3);
    -[ISWrappedAVPlayer registerChangeObserver:context:](*p_videoPlayer, "registerChangeObserver:context:", self, PUISWrappedAVPlayerObservationContext);
    objc_initWeak(&location, self);
    v9 = *p_videoPlayer;
    CMTimeMake(&v16, 1, 30);
    v10 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __39__PUBrowsingIrisPlayer_setVideoPlayer___block_invoke;
    v14[3] = &unk_1E58A6CE8;
    objc_copyWeak(&v15, &location);
    -[ISWrappedAVPlayer addPeriodicTimeObserverForInterval:queue:usingBlock:](v9, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v16, v10, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self->_videoPeriodicObserver;
    self->_videoPeriodicObserver = v12;

    -[PUBrowsingIrisPlayer _updateVitalityTransform](self, "_updateVitalityTransform");
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

- (void)_handlePeriodicObserverWithTime:(id *)a3
{
  _QWORD v3[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__PUBrowsingIrisPlayer__handlePeriodicObserverWithTime___block_invoke;
  v3[3] = &unk_1E58AA1F8;
  v3[4] = self;
  v4 = *a3;
  -[PUViewModel performChanges:](self, "performChanges:", v3);
}

- (void)_invalidatePlaying
{
  self->_isValid.playing = 0;
}

- (void)_updatePlayingIfNeeded
{
  id v3;

  if (!self->_isValid.playing)
  {
    self->_isValid.playing = 1;
    -[PUBrowsingIrisPlayer player](self, "player");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PUBrowsingIrisPlayer setPlaying:](self, "setPlaying:", (unint64_t)(objc_msgSend(v3, "currentPlaybackStyle") - 1) < 2);

  }
}

- (void)setPlaying:(BOOL)a3
{
  id v3;

  if (self->_playing != a3)
  {
    self->_playing = a3;
    -[PUBrowsingIrisPlayer currentChange](self, "currentChange");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPlayingDidChange:", 1);

  }
}

- (void)_handlePlaybackStyleChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__PUBrowsingIrisPlayer__handlePlaybackStyleChanged__block_invoke;
  v2[3] = &unk_1E58ABD10;
  v2[4] = self;
  -[PUViewModel performChanges:](self, "performChanges:", v2);
}

- (id)debugDetailedDescription
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUBrowsingIrisPlayer mediaProvider](self, "mediaProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Media Provider: %@\n"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("Loading Target: %ld\n"), -[PUBrowsingIrisPlayer loadingTarget](self, "loadingTarget"));
  if (-[PUBrowsingIrisPlayer isLivePhotoLoadingAllowed](self, "isLivePhotoLoadingAllowed"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = v5;
  objc_msgSend(v3, "appendFormat:", CFSTR("isLivePhotoLoadingAllowed: %@\n"), v6);

  -[PUBrowsingIrisPlayer livePhotoLoadingDisablingReasons](self, "livePhotoLoadingDisablingReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("livePhotoLoadingDisablingReasons: %@\n"), v7);

  if (-[PUBrowsingIrisPlayer isLivePhotoPlaybackAllowed](self, "isLivePhotoPlaybackAllowed"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v8;
  objc_msgSend(v3, "appendFormat:", CFSTR("isLivePhotoPlaybackAllowed: %@\n"), v9);

  -[PUBrowsingIrisPlayer livePhotoPlaybackDisablingReasons](self, "livePhotoPlaybackDisablingReasons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("livePhotoPlaybackDisablingReasons: %@\n"), v10);

  -[PUBrowsingIrisPlayer player](self, "player");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Iris Player: %@\n"), v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_stringByIndentingNewLines");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@ %p> {\n\t%@}"), v14, self, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  __int16 v6;
  id v8;
  void *v9;
  void (**v10)(void);
  void *v11;
  void (**v12)(void);
  void *v13;
  void (**v14)(void);
  void *v15;
  void *v16;

  v6 = a4;
  v8 = a3;
  if ((void *)PULivePhotoPlayerObservationContext == a5)
  {
    if ((v6 & 8) != 0)
      -[PUBrowsingIrisPlayer _handlePlaybackStyleChanged](self, "_handlePlaybackStyleChanged");
    if ((v6 & 4) != 0)
    {
      -[PUBrowsingIrisPlayer player](self, "player");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "videoPlayer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUBrowsingIrisPlayer setVideoPlayer:](self, "setVideoPlayer:", v16);

    }
  }
  else if ((void *)PUISWrappedAVPlayerObservationContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      -[PUBrowsingIrisPlayer statusChangeHandler](self, "statusChangeHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        -[PUBrowsingIrisPlayer statusChangeHandler](self, "statusChangeHandler");
        v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v10[2]();

      }
    }
    if ((v6 & 4) != 0)
    {
      -[PUBrowsingIrisPlayer playerItemChangeHandler](self, "playerItemChangeHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[PUBrowsingIrisPlayer playerItemChangeHandler](self, "playerItemChangeHandler");
        v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v12[2]();

      }
      px_dispatch_on_main_queue();
    }
    if ((v6 & 0x200) != 0)
    {
      -[PUBrowsingIrisPlayer durationChangeHandler](self, "durationChangeHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[PUBrowsingIrisPlayer durationChangeHandler](self, "durationChangeHandler");
        v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v14[2]();

      }
    }
  }

}

- (id)wrappedVideoPlayerForPlayer:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  PUBrowsingIrisPlayer *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7BBD0], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkOutReusableWrappedPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLVideoPlaybackGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412546;
    v9 = self;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEBUG, "%@ checking out player %@", (uint8_t *)&v8, 0x16u);
  }

  return v5;
}

- (void)playerWillRelinquishVideoPlayer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  PUBrowsingIrisPlayer *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLVideoPlaybackGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "%@ checking in player %@", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D7BBD0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkInReusableWrappedPlayer:", v4);

}

- (void)videoScrubberController:(id)a3 seekToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6 completionHandler:(id)a7
{
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;

  v9 = a7;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __108__PUBrowsingIrisPlayer_videoScrubberController_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke;
  v11[3] = &unk_1E589D6A8;
  v13 = *a4;
  v11[4] = self;
  v12 = v9;
  v10 = v9;
  -[PUViewModel performChanges:](self, "performChanges:", v11);

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentItemDuration
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v6;

  -[PUBrowsingIrisPlayer videoPlayer](self, "videoPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "currentItemDuration");
    v4 = v6;
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)playerCurrentTime
{
  void *v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v6;

  -[PUBrowsingIrisPlayer videoPlayer](self, "videoPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "currentTime");
    v4 = v6;
  }

  return result;
}

- (void)cancelPendingSeeks
{
  void *v2;
  id v3;

  -[PUBrowsingIrisPlayer videoPlayer](self, "videoPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelPendingSeeks");

}

- (float)playRate
{
  void *v2;
  float v3;
  float v4;

  -[PUBrowsingIrisPlayer videoPlayer](self, "videoPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rate");
  v4 = v3;

  return v4;
}

- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;

  v8 = a5;
  v9 = a4;
  -[PUBrowsingIrisPlayer videoPlayer](self, "videoPlayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *a3;
  objc_msgSend(v10, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v13, v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)removeTimeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUBrowsingIrisPlayer videoPlayer](self, "videoPlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTimeObserver:", v4);

}

- (int64_t)playerStatus
{
  void *v2;
  int64_t v3;

  -[PUBrowsingIrisPlayer videoPlayer](self, "videoPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  return v3;
}

- (id)playerItem
{
  void *v2;
  void *v3;

  -[PUBrowsingIrisPlayer videoPlayer](self, "videoPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)durationChangeHandler
{
  return self->durationChangeHandler;
}

- (void)setDurationChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)statusChangeHandler
{
  return self->statusChangeHandler;
}

- (void)setStatusChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)playerItemChangeHandler
{
  return self->playerItemChangeHandler;
}

- (void)setPlayerItemChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (ISWrappedAVPlayer)videoPlayer
{
  return self->_videoPlayer;
}

- (int64_t)loadingTarget
{
  return self->_loadingTarget;
}

- (BOOL)isLivePhotoLoadingAllowed
{
  return self->_livePhotoLoadingAllowed;
}

- (BOOL)isLivePhotoPlaybackAllowed
{
  return self->_isLivePhotoPlaybackAllowed;
}

- (BOOL)isActivated
{
  return self->_activated;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)scrubbingPhotoTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 224);
  return self;
}

- (NSArray)currentlyDisplayedTimes
{
  return self->_currentlyDisplayedTimes;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isImageLoadingEnabled
{
  return self->_imageLoadingEnabled;
}

- (__n128)vitalityTransform
{
  return a1[16];
}

- (BOOL)allowLargeVitalityInset
{
  return self->_allowLargeVitalityInset;
}

- (NSMutableSet)livePhotoLoadingDisablingReasons
{
  return self->_livePhotoLoadingDisablingReasons;
}

- (NSMutableSet)livePhotoPlaybackDisablingReasons
{
  return self->_livePhotoPlaybackDisablingReasons;
}

- (int64_t)_currentUnloadRequestId
{
  return self->__currentUnloadRequestId;
}

- (void)set_currentUnloadRequestId:(int64_t)a3
{
  self->__currentUnloadRequestId = a3;
}

- (PHLivePhoto)livePhoto
{
  return self->_livePhoto;
}

- (int64_t)livePhotoRequestState
{
  return self->_livePhotoRequestState;
}

- (void)setLivePhotoRequestState:(int64_t)a3
{
  self->_livePhotoRequestState = a3;
}

- (int)livePhotoRequestID
{
  return self->_livePhotoRequestID;
}

- (void)setLivePhotoRequestID:(int)a3
{
  self->_livePhotoRequestID = a3;
}

- (id)seekCompletionHandler
{
  return self->_seekCompletionHandler;
}

- (void)setSeekCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (BOOL)appIsInBackground
{
  return self->_appIsInBackground;
}

- (void)setAppIsInBackground:(BOOL)a3
{
  self->_appIsInBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_seekCompletionHandler, 0);
  objc_storeStrong((id *)&self->_livePhoto, 0);
  objc_storeStrong((id *)&self->_livePhotoPlaybackDisablingReasons, 0);
  objc_storeStrong((id *)&self->_livePhotoLoadingDisablingReasons, 0);
  objc_storeStrong((id *)&self->_currentlyDisplayedTimes, 0);
  objc_storeStrong((id *)&self->_videoPlayer, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong(&self->playerItemChangeHandler, 0);
  objc_storeStrong(&self->statusChangeHandler, 0);
  objc_storeStrong(&self->durationChangeHandler, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong(&self->_videoPeriodicObserver, 0);
}

uint64_t __108__PUBrowsingIrisPlayer_videoScrubberController_seekToTime_toleranceBefore_toleranceAfter_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  __int128 v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  return objc_msgSend(v2, "setScrubbingPhotoTime:completion:", &v4, v1);
}

uint64_t __53__PUBrowsingIrisPlayer_observable_didChange_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVitalityTransform");
}

uint64_t __51__PUBrowsingIrisPlayer__handlePlaybackStyleChanged__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;

  objc_msgSend(*(id *)(a1 + 32), "currentChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPlaybackStateDidChange:", 1);

  objc_msgSend(*(id *)(a1 + 32), "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentPlaybackStyle");

  if (v4)
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "livePhotoScrubberShowForPlayback");

    if (v6)
      objc_msgSend(*(id *)(a1 + 32), "setActivated:", 1);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_invalidatePlaying");
}

void __56__PUBrowsingIrisPlayer__handlePeriodicObserverWithTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;
  void *v7;
  void *v8;
  CMTime v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "currentPlaybackStyle"))
  {
    objc_msgSend(*(id *)(a1 + 32), "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "videoPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rate");
    v6 = v5;

    if (v6 != 0.0)
    {
      v9 = *(CMTime *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds(&v9));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setCurrentlyDisplayedTimes:", v8);

      return;
    }
  }
  else
  {

  }
  objc_msgSend(*(id *)(a1 + 32), "setCurrentlyDisplayedTimes:", 0);
}

void __39__PUBrowsingIrisPlayer_setVideoPlayer___block_invoke(uint64_t a1, __int128 *a2)
{
  id WeakRetained;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = *a2;
  v5 = *((_QWORD *)a2 + 2);
  objc_msgSend(WeakRetained, "_handlePeriodicObserverWithTime:", &v4);

}

uint64_t __80__PUBrowsingIrisPlayer__handleLoadedVitalityTransform_limitingAllowed_forAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 80), "setVitalityTransform:limitingAllowed:", *(unsigned __int8 *)(a1 + 88), *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));
}

void __48__PUBrowsingIrisPlayer__updateVitalityTransform__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id from;
  id location;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applyPerspectiveTransformDuringVitality");

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "_playerCreateIfNeeded:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "videoAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "pu_vitalityPerspectiveTransform");
        *(_QWORD *)&v14 = v11;
        *(_QWORD *)&v15 = v10;
        *(_QWORD *)&v13 = v12;
      }
      else
      {
        v14 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
        v15 = *MEMORY[0x1E0C83FE8];
        v13 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 32);
      }
      objc_initWeak(&location, *(id *)(a1 + 32));
      objc_initWeak(&from, v8);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __48__PUBrowsingIrisPlayer__updateVitalityTransform__block_invoke_2;
      v16[3] = &unk_1E589D658;
      objc_copyWeak(&v17, &location);
      objc_copyWeak(&v18, &from);
      objc_msgSend(v8, "pu_loadNormalizedVitalityPerspectiveTransformWithAdditionalNormalizedTransform:completion:", v16, *(double *)&v15, *(double *)&v14, *(double *)&v13);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setVitalityTransform:limitingAllowed:", 0, *MEMORY[0x1E0C83FE8], *(double *)(MEMORY[0x1E0C83FE8] + 16), *(double *)(MEMORY[0x1E0C83FE8] + 32));
    }

  }
  else
  {
    objc_msgSend(v4, "setVitalityTransform:limitingAllowed:", 0, *MEMORY[0x1E0C83FE8], *(double *)(MEMORY[0x1E0C83FE8] + 16), *(double *)(MEMORY[0x1E0C83FE8] + 32));
  }
}

void __48__PUBrowsingIrisPlayer__updateVitalityTransform__block_invoke_2(uint64_t a1, char a2, __n128 a3, __n128 a4, __n128 a5)
{
  _QWORD block[4];
  __n128 v11;
  __n128 v12;
  __n128 v13;
  id v14;
  id v15;
  char v16;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PUBrowsingIrisPlayer__updateVitalityTransform__block_invoke_3;
  block[3] = &unk_1E589D630;
  objc_copyWeak(&v14, (id *)(a1 + 32));
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v16 = a2;
  objc_copyWeak(&v15, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
}

void __48__PUBrowsingIrisPlayer__updateVitalityTransform__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v2 = *(unsigned __int8 *)(a1 + 96);
  v3 = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "_handleLoadedVitalityTransform:limitingAllowed:forAsset:", v2, v3, *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64));

}

void __48__PUBrowsingIrisPlayer__updateLivePhotoIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = v5;
  v8 = v6;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v9);
}

void __48__PUBrowsingIrisPlayer__updateLivePhotoIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleLivePhotoResult:info:requestID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

}

uint64_t __62__PUBrowsingIrisPlayer__handleLivePhotoResult_info_requestID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLivePhoto:", *(_QWORD *)(a1 + 40));
}

uint64_t __62__PUBrowsingIrisPlayer__handleLivePhotoResult_info_requestID___block_invoke_154(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateLivePhoto");
}

uint64_t __62__PUBrowsingIrisPlayer__handleLivePhotoResult_info_requestID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLivePhoto:", *(_QWORD *)(a1 + 40));
}

void __46__PUBrowsingIrisPlayer__playerCreateIfNeeded___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "currentChange");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPlayerDidChange:", 1);

}

void __48__PUBrowsingIrisPlayer_playPreviewHintWhenReady__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "playerCreateIfNeeded");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setActivated:", 1);
  objc_msgSend(v2, "playHintWhenReady");

}

uint64_t __33__PUBrowsingIrisPlayer_setAsset___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setActivated:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "unloadLivePhoto");
}

+ (PUBrowsingIrisPlayer)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUBrowsingIrisPlayer.m"), 103, CFSTR("%s is not available as initializer"), "+[PUBrowsingIrisPlayer new]");

  abort();
}

@end
