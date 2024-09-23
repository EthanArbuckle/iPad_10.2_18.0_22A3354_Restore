@implementation TUIVideoPlayer

- (TUIVideoPlayer)initWithUrl:(id)a3 videoId:(id)a4
{
  id v7;
  id v8;
  TUIVideoPlayer *v9;
  TUIVideoPlayer *v10;
  _TUIVideoPlaybackChecks *v11;
  _TUIVideoPlaybackChecks *playbackChecks;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIVideoPlayer;
  v9 = -[TUIVideoPlayer init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_videoUrl, a3);
    objc_storeStrong((id *)&v10->_videoId, a4);
    *(_OWORD *)&v10->_lastPlaybackTime.value = *(_OWORD *)&kCMTimeZero.value;
    v10->_lastPlaybackTime.epoch = kCMTimeZero.epoch;
    v11 = objc_alloc_init(_TUIVideoPlaybackChecks);
    playbackChecks = v10->_playbackChecks;
    v10->_playbackChecks = v11;

    -[TUIVideoPlayer _addPlayerObservers](v10, "_addPlayerObservers");
    -[TUIVideoPlayer _addPlaybackCheckObservers](v10, "_addPlaybackCheckObservers");
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[TUIVideoPlayer _removePlayerObservers](self, "_removePlayerObservers");
  -[TUIVideoPlayer _removePlayerItemObservers](self, "_removePlayerItemObservers");
  -[TUIVideoPlayer _removePlaybackCheckObservers](self, "_removePlaybackCheckObservers");
  if (self->_timeObserver)
    -[TUIVideoPlayer removeTimeObserver:](self, "removeTimeObserver:");
  v3.receiver = self;
  v3.super_class = (Class)TUIVideoPlayer;
  -[TUIVideoPlayer dealloc](&v3, "dealloc");
}

- (void)setPlayerItem:(id)a3
{
  AVPlayerItem *v4;
  void *v5;
  AVPlayerItem *playerItem;

  v4 = (AVPlayerItem *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playerItem](self, "playerItem"));

  if (v5)
    -[TUIVideoPlayer _removePlayerItemObservers](self, "_removePlayerItemObservers");
  playerItem = self->_playerItem;
  self->_playerItem = v4;

  -[TUIVideoPlayer replaceCurrentItemWithPlayerItem:](self, "replaceCurrentItemWithPlayerItem:", 0);
  -[TUIVideoPlayer _addPlayerItemObservers](self, "_addPlayerItemObservers");
}

- (void)setShouldLoop:(BOOL)a3
{
  if (self->_shouldLoop != a3)
    self->_shouldLoop = a3;
}

- (void)setState:(unint64_t)a3
{
  id WeakRetained;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  TUIVideoPlayer *v9;
  __int16 v10;
  void *v11;

  if (self->_state != a3)
  {
    self->_state = a3;
    if (a3 == 6)
      self->_shouldBePlaying = 1;
    if ((*(_WORD *)&self->_delegateFlags & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "player:didChangeState:", self, self->_state);

    }
    v5 = TUIVideoLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer _stateAsString](self, "_stateAsString"));
      v8 = 138412546;
      v9 = self;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ : Did change state: %@", (uint8_t *)&v8, 0x16u);

    }
  }
}

- (void)setTimeObserver:(id)a3
{
  id v4;
  id timeObserver;

  v4 = a3;
  if (self->_timeObserver)
    -[TUIVideoPlayer removeTimeObserver:](self, "removeTimeObserver:");
  timeObserver = self->_timeObserver;
  self->_timeObserver = v4;

}

- (void)setLastPlaybackTime:(id *)a3
{
  __int128 v5;

  -[NSLock lock](self->_lastPlaybackTimeLock, "lock");
  v5 = *(_OWORD *)&a3->var0;
  self->_lastPlaybackTime.epoch = a3->var3;
  *(_OWORD *)&self->_lastPlaybackTime.value = v5;
  -[NSLock unlock](self->_lastPlaybackTimeLock, "unlock");
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFE | objc_opt_respondsToSelector(obj, "player:didChangeState:") & 1;
    if ((objc_opt_respondsToSelector(obj, "playerDidPlayToEnd:mediaTimePlayed:") & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFD | v5;
    if ((objc_opt_respondsToSelector(obj, "player:didPlayToTime:") & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFFB | v6;
    if ((objc_opt_respondsToSelector(obj, "player:didStallPlaybackAtTime:") & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFF7 | v7;
    if ((objc_opt_respondsToSelector(obj, "playerDidLoadPlayerItem:") & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFEF | v8;
    if ((objc_opt_respondsToSelector(obj, "playerDidPlay:mediaTimePlayed:") & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFDF | v9;
    if ((objc_opt_respondsToSelector(obj, "playerDidPause:mediaTimePlayed:") & 1) != 0)
      v10 = 64;
    else
      v10 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFFBF | v10;
    if ((objc_opt_respondsToSelector(obj, "player:didSetMuted:mediaTimePlayed:") & 1) != 0)
      v11 = 128;
    else
      v11 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFF7F | v11;
    if ((objc_opt_respondsToSelector(obj, "player:didSetFailureReason:mediaTimePlayed:") & 1) != 0)
      v12 = 256;
    else
      v12 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFEFF | v12;
    if ((objc_opt_respondsToSelector(obj, "player:didSetCaptionsEnabled:") & 1) != 0)
      v13 = 512;
    else
      v13 = 0;
    *(_WORD *)&self->_delegateFlags = *(_WORD *)&self->_delegateFlags & 0xFDFF | v13;
  }

}

- (void)setFailureCount:(int64_t)a3
{
  unint64_t v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  TUIVideoPlayer *v10;
  __int16 v11;
  int64_t v12;
  __int16 v13;
  uint64_t v14;

  self->_failureCount = a3;
  v5 = a3 - 1;
  v6 = TUIVideoLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5 > 1)
  {
    if (v8)
    {
      v9 = 138412546;
      v10 = self;
      v11 = 2048;
      v12 = 2;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%@ : Did reach reload limit of %lu", (uint8_t *)&v9, 0x16u);
    }

    -[TUIVideoPlayer setState:](self, "setState:", 10);
  }
  else
  {
    if (v8)
    {
      v9 = 138412802;
      v10 = self;
      v11 = 2048;
      v12 = a3;
      v13 = 2048;
      v14 = 2;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%@ : Attempting to reload, attempt %lu of %lu", (uint8_t *)&v9, 0x20u);
    }

    -[TUIVideoPlayer reload](self, "reload");
  }
}

- (void)setFailureReason:(unint64_t)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id WeakRetained;
  unint64_t failureReason;
  int v9;
  TUIVideoPlayer *v10;
  __int16 v11;
  void *v12;

  self->_failureReason = a3;
  if (a3)
  {
    v4 = TUIVideoLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer _failureAsString](self, "_failureAsString"));
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%@ : Playback did fail, reason: %@", (uint8_t *)&v9, 0x16u);

    }
    if ((*(_WORD *)&self->_delegateFlags & 0x100) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      failureReason = self->_failureReason;
      -[TUIVideoPlayer currentTimePlayed](self, "currentTimePlayed");
      objc_msgSend(WeakRetained, "player:didSetFailureReason:mediaTimePlayed:", self, failureReason);

    }
    -[TUIVideoPlayer setFailureCount:](self, "setFailureCount:", (char *)-[TUIVideoPlayer failureCount](self, "failureCount") + 1);
  }
}

- (void)setMuted:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  objc_super v6;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (-[TUIVideoPlayer isMuted](self, "isMuted") != v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)TUIVideoPlayer;
    -[TUIVideoPlayer setMuted:](&v6, "setMuted:", v3);
    if ((*(_WORD *)&self->_delegateFlags & 0x80) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[TUIVideoPlayer currentTimePlayed](self, "currentTimePlayed");
      objc_msgSend(WeakRetained, "player:didSetMuted:mediaTimePlayed:", self, v3);

    }
  }
}

- (AVAsset)playerAsset
{
  AVPlayerItem *playerItem;

  playerItem = self->_playerItem;
  if (playerItem)
    playerItem = (AVPlayerItem *)objc_claimAutoreleasedReturnValue(-[AVPlayerItem asset](playerItem, "asset"));
  return (AVAsset *)playerItem;
}

- (BOOL)isPlaying
{
  void *v3;
  BOOL v4;

  if (self->_state == 7 || -[TUIVideoPlayer timeControlStatus](self, "timeControlStatus") != (char *)&dword_0 + 2)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer error](self, "error"));
  v4 = v3 == 0;

  return v4;
}

- (BOOL)captionsEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playerItem](self, "playerItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playerItem](self, "playerItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mediaSelectionGroupForMediaCharacteristic:", AVMediaCharacteristicLegible));

  if (v6)
    v7 = v3 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v10 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentMediaSelection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedMediaOptionInMediaSelectionGroup:", v6));

    v10 = v9 != 0;
  }

  return v10;
}

- (double)currentTimePlayed
{
  CMTime time;

  -[TUIVideoPlayer currentTime](self, "currentTime");
  return CMTimeGetSeconds(&time);
}

- (void)beginLoadingResources
{
  void *v3;
  void *v4;
  NSURL *videoUrl;
  _QWORD v6[4];
  id v7;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (self->_videoUrl)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playerAsset](self, "playerAsset"));

    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playerAsset](self, "playerAsset"));
      objc_msgSend(v4, "cancelLoading");

    }
    -[TUIVideoPlayer setState:](self, "setState:", 1);
    objc_initWeak(&location, self);
    videoUrl = self->_videoUrl;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_149CE8;
    v6[3] = &unk_242668;
    objc_copyWeak(&v7, &location);
    +[AVAsset tui_createAssetFromURL:completion:](AVAsset, "tui_createAssetFromURL:completion:", videoUrl, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)releaseResources
{
  void *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (-[TUIVideoPlayer isPlaying](self, "isPlaying"))
    -[TUIVideoPlayer pause](self, "pause");
  -[TUIVideoPlayer currentTime](self, "currentTime");
  v5 = v7;
  v6 = v8;
  -[TUIVideoPlayer setLastPlaybackTime:](self, "setLastPlaybackTime:", &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playerAsset](self, "playerAsset"));
  objc_msgSend(v3, "cancelLoading");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playbackChecks](self, "playbackChecks"));
  objc_msgSend(v4, "reset");

  -[TUIVideoPlayer setPlayerItem:](self, "setPlayerItem:", 0);
  -[TUIVideoPlayer setState:](self, "setState:", 0);
}

- (void)reset
{
  __int128 v3;
  CMTimeEpoch epoch;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[TUIVideoPlayer releaseResources](self, "releaseResources");
  v3 = *(_OWORD *)&kCMTimeZero.value;
  epoch = kCMTimeZero.epoch;
  -[TUIVideoPlayer setLastPlaybackTime:](self, "setLastPlaybackTime:", &v3);
  -[TUIVideoPlayer setFailureReason:](self, "setFailureReason:", 0);
  self->_shouldBePlaying = 0;
  self->_failureCount = 0;
}

- (void)reloadWithNewURL:(id)a3
{
  NSURL *v4;
  BOOL v5;
  NSURL *videoUrl;

  v4 = (NSURL *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = -[TUIVideoPlayer isPlaying](self, "isPlaying");
  -[TUIVideoPlayer releaseResources](self, "releaseResources");
  self->_shouldBePlaying = v5;
  videoUrl = self->_videoUrl;
  self->_videoUrl = v4;

  -[TUIVideoPlayer reload](self, "reload");
}

- (void)reload
{
  void *v3;
  void *v4;
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[TUIVideoPlayer setState:](self, "setState:", 0);
  -[TUIVideoPlayer setFailureReason:](self, "setFailureReason:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playerAsset](self, "playerAsset"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playerAsset](self, "playerAsset"));
    objc_msgSend(v4, "cancelLoading");

  }
  -[TUIVideoPlayer setPlayerItem:](self, "setPlayerItem:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playbackChecks](self, "playbackChecks"));
  objc_msgSend(v5, "reset");

  -[TUIVideoPlayer beginLoadingResources](self, "beginLoadingResources");
}

- (void)play
{
  void *v3;
  unsigned int v4;
  objc_super v5;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (!-[TUIVideoPlayer isPlaying](self, "isPlaying"))
  {
    self->_shouldBePlaying = 1;
    if (self->_state)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playbackChecks](self, "playbackChecks"));
      v4 = objc_msgSend(v3, "complete");

      if (v4)
      {
        v5.receiver = self;
        v5.super_class = (Class)TUIVideoPlayer;
        -[TUIVideoPlayer play](&v5, "play");
      }
    }
    else
    {
      -[TUIVideoPlayer beginLoadingResources](self, "beginLoadingResources");
    }
  }
}

- (void)pause
{
  objc_super v3;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  self->_shouldBePlaying = 0;
  v3.receiver = self;
  v3.super_class = (Class)TUIVideoPlayer;
  -[TUIVideoPlayer pause](&v3, "pause");
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<TUIVideoPlayer %p: url: %@, videoId: %@>"), self, self->_videoUrl, self->_videoId);
}

- (void)_loadPlayerWithAsset:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  TUIVideoPlayer *v11;
  id v12;
  id location;
  _QWORD v14[2];

  v4 = a3;
  v14[0] = CFSTR("duration");
  v14[1] = CFSTR("playable");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_14A218;
  v8[3] = &unk_242708;
  objc_copyWeak(&v12, &location);
  v6 = v5;
  v9 = v6;
  v7 = v4;
  v10 = v7;
  v11 = self;
  objc_msgSend(v7, "loadValuesAsynchronouslyForKeys:completionHandler:", v6, v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_addPlaybackCheckObservers
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[_TUIVideoPlaybackChecks addObserver:forKeyPath:options:context:](self->_playbackChecks, "addObserver:forKeyPath:options:context:", self, CFSTR("assetKeysLoaded"), 1, &off_242728);
  -[_TUIVideoPlaybackChecks addObserver:forKeyPath:options:context:](self->_playbackChecks, "addObserver:forKeyPath:options:context:", self, CFSTR("itemIsReadyToPlay"), 1, &off_242728);
  -[_TUIVideoPlaybackChecks addObserver:forKeyPath:options:context:](self->_playbackChecks, "addObserver:forKeyPath:options:context:", self, CFSTR("playbackLikelyToKeepUp"), 1, &off_242728);
}

- (void)_removePlaybackCheckObservers
{
  -[_TUIVideoPlaybackChecks removeObserver:forKeyPath:](self->_playbackChecks, "removeObserver:forKeyPath:", self, CFSTR("assetKeysLoaded"));
  -[_TUIVideoPlaybackChecks removeObserver:forKeyPath:](self->_playbackChecks, "removeObserver:forKeyPath:", self, CFSTR("itemIsReadyToPlay"));
  -[_TUIVideoPlaybackChecks removeObserver:forKeyPath:](self->_playbackChecks, "removeObserver:forKeyPath:", self, CFSTR("playbackLikelyToKeepUp"));
}

- (void)_addPlayerObservers
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[TUIVideoPlayer addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("rate"), 1, &off_242728);
  -[TUIVideoPlayer addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("timeControlStatus"), 1, &off_242728);
  -[TUIVideoPlayer addObserver:forKeyPath:options:context:](self, "addObserver:forKeyPath:options:context:", self, CFSTR("reasonForWaitingToPlay"), 1, &off_242728);
}

- (void)_removePlayerObservers
{
  -[TUIVideoPlayer removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("rate"), &off_242728);
  -[TUIVideoPlayer removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("timeControlStatus"), &off_242728);
  -[TUIVideoPlayer removeObserver:forKeyPath:context:](self, "removeObserver:forKeyPath:context:", self, CFSTR("reasonForWaitingToPlay"), &off_242728);
}

- (void)_addPlayerItemObservers
{
  AVPlayerItem *playerItem;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  playerItem = self->_playerItem;
  if (playerItem)
  {
    -[AVPlayerItem addObserver:forKeyPath:options:context:](playerItem, "addObserver:forKeyPath:options:context:", self, CFSTR("status"), 1, &off_242728);
    -[AVPlayerItem addObserver:forKeyPath:options:context:](self->_playerItem, "addObserver:forKeyPath:options:context:", self, CFSTR("playbackLikelyToKeepUp"), 1, &off_242728);
    -[AVPlayerItem addObserver:forKeyPath:options:context:](self->_playerItem, "addObserver:forKeyPath:options:context:", self, CFSTR("playbackBufferFull"), 1, &off_242728);
    -[AVPlayerItem addObserver:forKeyPath:options:context:](self->_playerItem, "addObserver:forKeyPath:options:context:", self, CFSTR("playbackBufferEmpty"), 1, &off_242728);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "videoDidPlayToEnd", AVPlayerItemDidPlayToEndTimeNotification, self->_playerItem);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "videoPlaybackDidStall", AVPlayerItemPlaybackStalledNotification, self->_playerItem);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", self, "playbackErrorOccured:", AVPlayerItemFailedToPlayToEndTimeErrorKey, self->_playerItem);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", self, "playbackErrorOccured:", AVPlayerItemNewErrorLogEntryNotification, self->_playerItem);

    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, "mediaSelectionDidChange:", AVPlayerItemMediaSelectionDidChangeNotification, self->_playerItem);

  }
}

- (void)_removePlayerItemObservers
{
  AVPlayerItem *playerItem;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  playerItem = self->_playerItem;
  if (playerItem)
  {
    -[AVPlayerItem removeObserver:forKeyPath:context:](playerItem, "removeObserver:forKeyPath:context:", self, CFSTR("status"), &off_242728);
    -[AVPlayerItem removeObserver:forKeyPath:context:](self->_playerItem, "removeObserver:forKeyPath:context:", self, CFSTR("playbackLikelyToKeepUp"), &off_242728);
    -[AVPlayerItem removeObserver:forKeyPath:context:](self->_playerItem, "removeObserver:forKeyPath:context:", self, CFSTR("playbackBufferFull"), &off_242728);
    -[AVPlayerItem removeObserver:forKeyPath:context:](self->_playerItem, "removeObserver:forKeyPath:context:", self, CFSTR("playbackBufferEmpty"), &off_242728);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", self, AVPlayerItemDidPlayToEndTimeNotification, self->_playerItem);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, AVPlayerItemPlaybackStalledNotification, self->_playerItem);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:name:object:", self, AVPlayerItemFailedToPlayToEndTimeErrorKey, self->_playerItem);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "removeObserver:name:object:", self, AVPlayerItemNewErrorLogEntryNotification, self->_playerItem);

    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "removeObserver:name:object:", self, AVPlayerItemMediaSelectionDidChangeNotification, self->_playerItem);

  }
}

- (void)videoDidPlayToEnd
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14AF44;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)videoPlaybackDidStall
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_14B088;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)playbackErrorOccured:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  TUIVideoPlayer *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_14B19C;
  v5[3] = &unk_23D7D0;
  v6 = a3;
  v7 = self;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)mediaSelectionDidChange:(id)a3
{
  id v4;
  _BOOL4 v5;
  id WeakRetained;
  id v7;

  v4 = a3;
  if ((*(_WORD *)&self->_delegateFlags & 0x200) != 0)
  {
    v7 = v4;
    v5 = -[TUIVideoPlayer captionsEnabled](self, "captionsEnabled");
    v4 = v7;
    if (self->_lastCaptionsEnabled != v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "player:didSetCaptionsEnabled:", self, -[TUIVideoPlayer captionsEnabled](self, "captionsEnabled"));

      v4 = v7;
      self->_lastCaptionsEnabled = v5;
    }
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a6 == &off_242728)
  {
    if (v10 && v12)
    {
      v14 = objc_opt_class(AVPlayerItem);
      if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0)
      {
        v15 = objc_opt_class(AVPlayerItem);
        v16 = TUIDynamicCast(v15, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        -[TUIVideoPlayer handlePlayerItemChange:keyPath:playerItem:](self, "handlePlayerItemChange:keyPath:playerItem:", v13, v10, v17);
      }
      else
      {
        v18 = objc_opt_class(AVPlayer);
        if ((objc_opt_isKindOfClass(v11, v18) & 1) != 0)
        {
          v19 = objc_opt_class(AVPlayer);
          v20 = TUIDynamicCast(v19, v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v20);
          -[TUIVideoPlayer handlePlayerChange:keyPath:player:](self, "handlePlayerChange:keyPath:player:", v13, v10, v17);
        }
        else
        {
          v21 = objc_opt_class(_TUIVideoPlaybackChecks);
          if ((objc_opt_isKindOfClass(v11, v21) & 1) == 0)
            goto LABEL_12;
          v22 = objc_opt_class(_TUIVideoPlaybackChecks);
          v23 = TUIDynamicCast(v22, v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v23);
          -[TUIVideoPlayer handlePlaybackChecksChange:keyPath:playbackChecks:](self, "handlePlaybackChecksChange:keyPath:playbackChecks:", v13, v10, v17);
        }
      }

    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)TUIVideoPlayer;
    -[TUIVideoPlayer observeValueForKeyPath:ofObject:change:context:](&v24, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }
LABEL_12:

}

- (void)handlePlayerItemChange:(id)a3 keyPath:(id)a4 playerItem:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  int v28;
  TUIVideoPlayer *v29;
  __int16 v30;
  unsigned int v31;

  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (a5)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("status")))
    {
      v10 = objc_opt_class(NSNumber);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", NSKeyValueChangeNewKey));
      v12 = TUIDynamicCast(v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (char *)objc_msgSend(v13, "integerValue");

      if (v14 == (_BYTE *)&dword_0 + 1)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playbackChecks](self, "playbackChecks"));
        objc_msgSend(v15, "setItemIsReadyToPlay:", 1);
LABEL_8:

      }
    }
    else
    {
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("playbackBufferFull")) & 1) != 0
        || objc_msgSend(v9, "isEqualToString:", CFSTR("playbackLikelyToKeepUp")))
      {
        v16 = objc_opt_class(NSNumber);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", NSKeyValueChangeNewKey));
        v18 = TUIDynamicCast(v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        v20 = objc_msgSend(v19, "BOOLValue");

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playbackChecks](self, "playbackChecks"));
        objc_msgSend(v15, "setPlaybackLikelyToKeepUp:", v20);
        goto LABEL_8;
      }
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("playbackBufferEmpty")))
      {
        v21 = objc_opt_class(NSNumber);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", NSKeyValueChangeNewKey));
        v23 = TUIDynamicCast(v21, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v25 = objc_msgSend(v24, "BOOLValue");

        v26 = TUIVideoLog();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = 138412546;
          v29 = self;
          v30 = 1024;
          v31 = v25;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "%@ : Playback buffer is empty: %i", (uint8_t *)&v28, 0x12u);
        }

      }
    }
  }

}

- (void)handlePlayerChange:(id)a3 keyPath:(id)a4 player:(id)a5
{
  id v8;
  id v9;
  TUIVideoPlayer *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  float v15;
  float v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  int32_t v32;
  CMTime v33;
  CMTime time1;
  uint8_t buf[4];
  TUIVideoPlayer *v36;
  __int16 v37;
  double v38;

  v8 = a3;
  v9 = a4;
  v10 = (TUIVideoPlayer *)a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  if (v10 == self)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("rate")))
    {
      v11 = objc_opt_class(NSNumber);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", NSKeyValueChangeNewKey));
      v13 = TUIDynamicCast(v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_msgSend(v14, "floatValue");
      v16 = v15;

      v17 = TUIVideoLog();
      *(double *)&v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(v17));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v10;
        v37 = 2048;
        v38 = v16;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%@ : Did change rate to %f", buf, 0x16u);
      }
      goto LABEL_24;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("timeControlStatus")))
    {
      v19 = objc_opt_class(NSNumber);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", NSKeyValueChangeNewKey));
      v21 = TUIDynamicCast(v19, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = (int)objc_msgSend(v22, "intValue");

      -[TUIVideoPlayer currentTime](v10, "currentTime");
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer currentItem](v10, "currentItem"));
      v25 = v24;
      if (v24)
        objc_msgSend(v24, "duration");
      else
        memset(&v33, 0, sizeof(v33));
      v32 = CMTimeCompare(&time1, &v33);

      if (v23 == 2)
      {
        -[TUIVideoPlayer setState:](v10, "setState:", 4);
        if ((*(_WORD *)&v10->_delegateFlags & 0x20) != 0)
        {
          *(double *)&v18 = COERCE_DOUBLE(objc_loadWeakRetained((id *)&v10->_delegate));
          -[TUIVideoPlayer currentTimePlayed](v10, "currentTimePlayed");
          -[NSObject playerDidPlay:mediaTimePlayed:](v18, "playerDidPlay:mediaTimePlayed:", v10);
          goto LABEL_24;
        }
      }
      else if (!v23 && v10->_state == 4 && v32 < 0)
      {
        -[TUIVideoPlayer setState:](v10, "setState:", 5);
        v10->_shouldBePlaying = 0;
        if ((*(_WORD *)&v10->_delegateFlags & 0x40) != 0)
        {
          *(double *)&v18 = COERCE_DOUBLE(objc_loadWeakRetained((id *)&v10->_delegate));
          -[TUIVideoPlayer currentTimePlayed](v10, "currentTimePlayed");
          -[NSObject playerDidPause:mediaTimePlayed:](v18, "playerDidPause:mediaTimePlayed:", v10);
LABEL_24:

        }
      }
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("reasonForWaitingToPlay")))
    {
      v26 = objc_opt_class(NSString);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", NSKeyValueChangeNewKey));
      v28 = TUIDynamicCast(v26, v27);
      *(double *)&v18 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(v28));

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playbackChecks](v10, "playbackChecks"));
      objc_msgSend(v29, "setPlayerHasNoWaitingReason:", v18 == 0);

      if (*(double *)&v18 != 0.0)
      {
        if (-[NSObject isEqualToString:](v18, "isEqualToString:", AVPlayerWaitingToMinimizeStallsReason))
          -[TUIVideoPlayer setState:](v10, "setState:", 9);
        v30 = TUIVideoLog();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v36 = v10;
          v37 = 2112;
          v38 = *(double *)&v18;
          _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "%@ : Waiting on playback: %@", buf, 0x16u);
        }

      }
      goto LABEL_24;
    }
  }

}

- (void)handlePlaybackChecksChange:(id)a3 keyPath:(id)a4 playbackChecks:(id)a5
{
  id v6;
  unsigned int v7;

  v6 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v7 = objc_msgSend(v6, "complete");

  if (v7)
  {
    if (self->_state == 1)
      -[TUIVideoPlayer setState:](self, "setState:", 2);
    if (self->_shouldBePlaying)
      -[TUIVideoPlayer play](self, "play");
    else
      -[TUIVideoPlayer setState:](self, "setState:", 3);
  }
}

- (id)_stateAsString
{
  if (qword_2CB8B8 != -1)
    dispatch_once(&qword_2CB8B8, &stru_242730);
  return objc_msgSend((id)qword_2CB8B0, "objectAtIndexedSubscript:", self->_state);
}

- (id)_failureAsString
{
  if (qword_2CB8C8 != -1)
    dispatch_once(&qword_2CB8C8, &stru_242750);
  return objc_msgSend((id)qword_2CB8C0, "objectAtIndexedSubscript:", self->_failureReason);
}

- (id)_timeControlStatusAsString
{
  if (qword_2CB8D8 != -1)
    dispatch_once(&qword_2CB8D8, &stru_242770);
  return objc_msgSend((id)qword_2CB8D0, "objectAtIndexedSubscript:", -[TUIVideoPlayer timeControlStatus](self, "timeControlStatus"));
}

- (void)logPlayerStatus
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  CMTime time;
  uint8_t buf[4];
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer _timeControlStatusAsString](self, "_timeControlStatusAsString"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("timeControlStatus: %@"), v3));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer reasonForWaitingToPlay](self, "reasonForWaitingToPlay"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("reasonForWaitingToPlay: %@"), v4));

  -[TUIVideoPlayer rate](self, "rate");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("playerRate: %f"), v6));
  -[TUIVideoPlayer currentTime](self, "currentTime");
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("currentTime: %f"), CMTimeGetSeconds(&time));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playerItem](self, "playerItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadedTimeRanges"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("loadedTimeRanges: %@"), v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playerItem](self, "playerItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("isPlaybackLikelyToKeepUp: %i"), objc_msgSend(v14, "isPlaybackLikelyToKeepUp")));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playerItem](self, "playerItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("isPlaybackBufferFull: %i"), objc_msgSend(v16, "isPlaybackBufferFull")));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayer playerItem](self, "playerItem"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("isPlaybackBufferEmpty: %i"), objc_msgSend(v18, "isPlaybackBufferEmpty")));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n"), v23, v5, v7, v9, v13, v15, v17, v19));
  v21 = TUIVideoLog();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v20;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

}

- (TUIVideoPlayerDelegate)delegate
{
  return (TUIVideoPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)shouldLoop
{
  return self->_shouldLoop;
}

- (unint64_t)failureReason
{
  return self->_failureReason;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)videoId
{
  return self->_videoId;
}

- (void)setVideoId:(id)a3
{
  objc_storeStrong((id *)&self->_videoId, a3);
}

- (NSURL)videoUrl
{
  return self->_videoUrl;
}

- (void)setVideoUrl:(id)a3
{
  objc_storeStrong((id *)&self->_videoUrl, a3);
}

- (AVPlayerItem)playerItem
{
  return self->_playerItem;
}

- (id)timeObserver
{
  return self->_timeObserver;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastPlaybackTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 104);
  return self;
}

- (NSLock)lastPlaybackTimeLock
{
  return self->_lastPlaybackTimeLock;
}

- (_TUIVideoPlaybackChecks)playbackChecks
{
  return self->_playbackChecks;
}

- (BOOL)shouldBePlaying
{
  return self->_shouldBePlaying;
}

- (void)setShouldBePlaying:(BOOL)a3
{
  self->_shouldBePlaying = a3;
}

- (int64_t)failureCount
{
  return self->_failureCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackChecks, 0);
  objc_storeStrong((id *)&self->_lastPlaybackTimeLock, 0);
  objc_storeStrong(&self->_timeObserver, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
  objc_storeStrong((id *)&self->_videoUrl, 0);
  objc_storeStrong((id *)&self->_videoId, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
