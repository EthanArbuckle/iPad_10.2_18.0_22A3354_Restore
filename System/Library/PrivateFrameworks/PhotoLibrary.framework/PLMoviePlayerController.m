@implementation PLMoviePlayerController

- (PLMoviePlayerController)init
{
  PLMoviePlayerController *v2;
  PLMoviePlayerView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLMoviePlayerController;
  v2 = -[PLMoviePlayerController init](&v5, sel_init);
  if (v2)
  {
    v3 = [PLMoviePlayerView alloc];
    v2->_view = -[PLMoviePlayerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v2->_playbackState = 0;
    v2->_lastSetCurrentTimeTime = -1.79769313e308;
    -[PLMoviePlayerController _registerForNotifications](v2, "_registerForNotifications");
    -[PLMoviePlayerController _setupPlayer](v2, "_setupPlayer");
    -[PLMoviePlayerController _updateTVOutEnabled](v2, "_updateTVOutEnabled");
    -[PLMoviePlayerController _updateDisableAirPlayMirroringDuringPlayback](v2, "_updateDisableAirPlayMirroringDuringPlayback");
    -[PLMoviePlayerController _updateBackgroundViewInformation](v2, "_updateBackgroundViewInformation");
    v2->_backgroundTaskId = *MEMORY[0x1E0CEB390];
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PLMoviePlayerController requestToResignAsActiveController](self, "requestToResignAsActiveController");
  -[PLMoviePlayerController _unregisterForNotifications](self, "_unregisterForNotifications");
  -[PLMoviePlayerController _setPlayerItem:](self, "_setPlayerItem:", 0);
  -[PLMoviePlayerController _tearDownPlayer](self, "_tearDownPlayer");

  self->_view = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLMoviePlayerController;
  -[PLMoviePlayerController dealloc](&v3, sel_dealloc);
}

- (void)_registerForNotifications
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__simpleRemoteNotification_, *MEMORY[0x1E0CEB300], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__willSuspendNotification_, *MEMORY[0x1E0CEB330], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__willBeginSuspendAnimationNotification_, *MEMORY[0x1E0CEBF18], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__willResignNotification_, *MEMORY[0x1E0CEB358], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__screenDidConnect_, *MEMORY[0x1E0CEBB88], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__screenDidDisconnect_, *MEMORY[0x1E0CEBB90], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__willEnterForegroundNotification_, *MEMORY[0x1E0CEB350], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__didEnterBackgroundNotification_, *MEMORY[0x1E0CEB288], 0);
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "beginReceivingRemoteControlEvents");
}

- (void)_unregisterForNotifications
{
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "endReceivingRemoteControlEvents");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
}

- (id)_playerKeysToObserve
{
  return &unk_1E70C6868;
}

- (void)_setupPlayer
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_player = (AVPlayer *)objc_alloc_init(MEMORY[0x1E0C8B2E8]);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C89AE8], "auxiliarySession");
  objc_msgSend(v3, "setCategory:error:", *MEMORY[0x1E0C89690], 0);
  -[AVPlayer setAudioSession:](self->_player, "setAudioSession:", v3);
  -[AVPlayer setExternalPlaybackVideoGravity:](self->_player, "setExternalPlaybackVideoGravity:", *MEMORY[0x1E0C8A6D8]);
  -[AVPlayer setActionAtItemEnd:](self->_player, "setActionAtItemEnd:", 1);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = -[PLMoviePlayerController _playerKeysToObserve](self, "_playerKeysToObserve", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[AVPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 3, &PlayerKeyContext);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  -[PLMoviePlayerView setPlayer:](self->_view, "setPlayer:", self->_player);
  -[CALayer addObserver:forKeyPath:options:context:](-[UIView layer](-[PLMoviePlayerView videoView](self->_view, "videoView"), "layer"), "addObserver:forKeyPath:options:context:", self, CFSTR("readyForDisplay"), 5, &ViewerKeyContext);
  -[PLMoviePlayerController _updateTVOutEnabled](self, "_updateTVOutEnabled");
  -[PLMoviePlayerController _updateDisableAirPlayMirroringDuringPlayback](self, "_updateDisableAirPlayMirroringDuringPlayback");
  -[PLMoviePlayerController _updateBackgroundViewInformation](self, "_updateBackgroundViewInformation");
}

- (void)_tearDownPlayer
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[CALayer removeObserver:forKeyPath:context:](-[UIView layer](-[PLMoviePlayerView videoView](self->_view, "videoView"), "layer"), "removeObserver:forKeyPath:context:", self, CFSTR("readyForDisplay"), &ViewerKeyContext);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[PLMoviePlayerController _playerKeysToObserve](self, "_playerKeysToObserve", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[AVPlayer removeObserver:forKeyPath:context:](self->_player, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), &PlayerKeyContext);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[AVPlayer pause](self->_player, "pause");

  self->_player = 0;
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (PLMoviePlayerControllerDelegate *)a3;
    -[PLMoviePlayerController _updateDisableAirPlayMirroringDuringPlayback](self, "_updateDisableAirPlayMirroringDuringPlayback");
    -[PLMoviePlayerController _updateTVOutEnabled](self, "_updateTVOutEnabled");
  }
}

- (id)_asset
{
  return -[AVPlayerItem asset](self->_playerItem, "asset");
}

- (void)setPlayerItem:(id)a3 startTime:(double)a4
{
  AVPlayer *player;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  CMTime v12;
  CMTime v13;

  if (self->_playerItem != a3)
  {
    self->_isPreparedForPlayback = 0;
    if (self->_playbackState == 1)
    {
      -[PLMoviePlayerController _setPlaybackState:](self, "_setPlaybackState:", 2);
      -[AVPlayer pause](self->_player, "pause");
    }
    -[PLMoviePlayerController _setBufferingState:](self, "_setBufferingState:", 0);
    -[PLMoviePlayerController _setPlayerItem:](self, "_setPlayerItem:", a3);
    if (a3)
    {
      -[PLMoviePlayerController _loadAsset:](self, "_loadAsset:", -[PLMoviePlayerController _asset](self, "_asset"));
      if (a4 != 0.0)
      {
        memset(&v13, 0, sizeof(v13));
        CMTimeMakeWithSeconds(&v13, a4, 600);
        player = self->_player;
        v12 = v13;
        v10 = *MEMORY[0x1E0CA2E68];
        v11 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        v8 = v10;
        v9 = v11;
        -[AVPlayer seekToTime:toleranceBefore:toleranceAfter:](player, "seekToTime:toleranceBefore:toleranceAfter:", &v12, &v10, &v8);
      }
    }
  }
}

- (void)_setPlayerItem:(id)a3
{
  AVPlayerItem *playerItem;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  AVPlayerItem *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  AVPlayerItem *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  playerItem = self->_playerItem;
  if (playerItem != a3)
  {
    v6 = (_QWORD *)MEMORY[0x1E0C8AC48];
    v7 = (_QWORD *)MEMORY[0x1E0C8AC58];
    if (playerItem)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v8 = objc_msgSend(&unk_1E70C6880, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v23;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(&unk_1E70C6880);
            -[AVPlayerItem removeObserver:forKeyPath:context:](self->_playerItem, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11++), &ItemKeyContext);
          }
          while (v9 != v11);
          v9 = objc_msgSend(&unk_1E70C6880, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v9);
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, *v6, self->_playerItem);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, *v7, self->_playerItem);
      playerItem = self->_playerItem;
    }

    v12 = (AVPlayerItem *)a3;
    self->_playerItem = v12;
    if (v12)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v13 = objc_msgSend(&unk_1E70C6880, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v19;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v19 != v15)
              objc_enumerationMutation(&unk_1E70C6880);
            -[AVPlayerItem addObserver:forKeyPath:options:context:](self->_playerItem, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16++), 3, &ItemKeyContext);
          }
          while (v14 != v16);
          v14 = objc_msgSend(&unk_1E70C6880, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        }
        while (v14);
      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__playerItemDidReachEndNotification_, *v6, self->_playerItem);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel__playerItemFailedToPlayToEndNotification_, *v7, self->_playerItem);
      v17 = self->_playerItem;
    }
    else
    {
      v17 = 0;
    }
    -[AVPlayer replaceCurrentItemWithPlayerItem:](self->_player, "replaceCurrentItemWithPlayerItem:", v17);
    -[PLMoviePlayerController _updateFromPendingTime](self, "_updateFromPendingTime");
  }
}

- (void)_loadAsset:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[7];
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(&unk_1E70C6898, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(&unk_1E70C6898);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v13 = 0;
        if (objc_msgSend(a3, "statusOfValueForKey:error:", v10, &v13) == 2)
        {
          -[PLMoviePlayerController _didLoadValueOfKey:forAsset:](self, "_didLoadValueOfKey:forAsset:", v10, a3);
        }
        else
        {
          v18 = v10;
          v11 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
          v12[0] = v8;
          v12[1] = 3221225472;
          v12[2] = __38__PLMoviePlayerController__loadAsset___block_invoke;
          v12[3] = &unk_1E70B6410;
          v12[4] = self;
          v12[5] = v10;
          v12[6] = a3;
          objc_msgSend(a3, "loadValuesAsynchronouslyForKeys:completionHandler:", v11, v12);
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(&unk_1E70C6898, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v6);
  }
}

- (void)_didLoadValueOfKey:(id)a3 forAsset:(id)a4
{
  id v7[8];

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    if (-[PLMoviePlayerController _asset](self, "_asset") == a4)
    {
      v7[0] = 0;
      if (objc_msgSend(a4, "statusOfValueForKey:error:", a3, v7) == 2)
      {
        if (objc_msgSend(a3, "isEqualToString:", CFSTR("duration")))
          -[PLMoviePlayerControllerDelegate moviePlayerDurationAvailable:](self->_delegate, "moviePlayerDurationAvailable:", self);
      }
      else
      {
        NSLog(CFSTR("Could not load value for key %@:\n%@"), a3, objc_msgSend(v7[0], "localizedDescription"));
      }
    }
  }
  else
  {
    v7[1] = (id)MEMORY[0x1E0C809B0];
    v7[2] = (id)3221225472;
    v7[3] = __55__PLMoviePlayerController__didLoadValueOfKey_forAsset___block_invoke;
    v7[4] = &unk_1E70B6410;
    v7[5] = self;
    v7[6] = a3;
    v7[7] = a4;
    pl_dispatch_async();
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *Log;
  _QWORD *v12;
  objc_super v13;
  _QWORD v14[8];
  _QWORD v15[8];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v17 = objc_opt_class();
    v18 = 2112;
    v19 = a3;
    v20 = 2112;
    v21 = a5;
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) %@ observeValueForKeyPath %@ %@", buf, 0x20u);
  }
  if (a6 == &ItemKeyContext)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__PLMoviePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v15[3] = &unk_1E70B5C88;
    v15[4] = self;
    v15[5] = a4;
    v15[6] = a3;
    v15[7] = a5;
    v12 = v15;
LABEL_9:
    -[PLMoviePlayerController _dispatchOnMainThreadWithBlock:](self, "_dispatchOnMainThreadWithBlock:", v12);
    return;
  }
  if (a6 == &PlayerKeyContext)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__PLMoviePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v14[3] = &unk_1E70B5C88;
    v14[4] = self;
    v14[5] = a4;
    v14[6] = a3;
    v14[7] = a5;
    v12 = v14;
    goto LABEL_9;
  }
  if (a6 == &ViewerKeyContext)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("readyForDisplay")))
      -[PLMoviePlayerControllerDelegate moviePlayerReadyToDisplay:](self->_delegate, "moviePlayerReadyToDisplay:", self);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLMoviePlayerController;
    -[PLMoviePlayerController observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5, a6);
  }
}

- (void)_dispatchOnMainThreadWithBlock:(id)a3
{
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (a3)
      (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    pl_dispatch_async();
  }
}

- (void)_playerRateDidChange:(id)a3
{
  void *v5;
  float v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  NSObject *Log;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
  v6 = 0.0;
  v7 = 0.0;
  if (v5 != (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
  {
    objc_msgSend(v5, "floatValue");
    v7 = v8;
  }
  v9 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
  if (v9 != (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
  {
    objc_msgSend(v9, "floatValue");
    v6 = v10;
  }
  if (v7 != v6)
    -[PLMoviePlayerControllerDelegate moviePlayerPlaybackRateDidChange:](self->_delegate, "moviePlayerPlaybackRateDidChange:", self);
  v11 = fabsf(v7);
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = a3;
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) _playerRateDidChange %@", (uint8_t *)&v13, 0xCu);
  }
  if (v11 <= 0.00000011921 && fabsf(v6) > 0.00000011921)
    -[PLMoviePlayerController _setPlaybackState:](self, "_setPlaybackState:", 1);
}

- (void)play
{
  NSObject *Log;
  uint8_t v4[16];

  self->_forceUpdateCurrentTime = 1;
  -[PLMoviePlayerController _updateFromPendingTime](self, "_updateFromPendingTime");
  if ((objc_msgSend((id)objc_opt_class(), "_isStreamableAsset:", -[PLMoviePlayerController _asset](self, "_asset")) & 1) == 0)
  {
    -[PLMoviePlayerController _setPlaybackState:](self, "_setPlaybackState:", 1);
    Log = PLPhotoSharingGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) calling _player play", v4, 2u);
    }
    -[AVPlayer play](self->_player, "play");
  }
}

- (void)playFromBeginning
{
  NSObject *Log;
  uint8_t v4[16];

  -[PLMoviePlayerController setCurrentTime:timeSnapOption:forceUpdate:](self, "setCurrentTime:timeSnapOption:forceUpdate:", 0, 1, 0.0);
  if ((objc_msgSend((id)objc_opt_class(), "_isStreamableAsset:", -[PLMoviePlayerController _asset](self, "_asset")) & 1) == 0)
  {
    -[PLMoviePlayerController _setPlaybackState:](self, "_setPlaybackState:", 1);
    Log = PLPhotoSharingGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) calling _player play in playFromBeginning", v4, 2u);
    }
    -[AVPlayer play](self->_player, "play");
  }
}

- (void)playDueToEnoughData
{
  NSObject *Log;
  uint8_t v4[16];

  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) calling _player playDueToEnoughData", v4, 2u);
  }
  -[AVPlayer play](self->_player, "play");
}

- (void)pause
{
  NSObject *Log;
  uint8_t v4[16];

  -[PLMoviePlayerController _setPlaybackState:](self, "_setPlaybackState:", 2);
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) calling _player pause in pause", v4, 2u);
  }
  -[AVPlayer pause](self->_player, "pause");
}

- (void)pauseDueToInsufficientData
{
  NSObject *Log;
  uint8_t v4[16];

  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) calling _player pauseDueToInsufficientData", v4, 2u);
  }
  -[AVPlayer pause](self->_player, "pause");
}

- (void)stop
{
  NSObject *Log;
  uint8_t v4[16];

  -[PLMoviePlayerController _setPlaybackState:](self, "_setPlaybackState:", 0);
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) calling _player pause in stop", v4, 2u);
  }
  -[AVPlayer pause](self->_player, "pause");
}

- (void)resetPlayer
{
  -[PLMoviePlayerController _tearDownPlayer](self, "_tearDownPlayer");
  -[PLMoviePlayerController _setupPlayer](self, "_setupPlayer");
}

- (void)setCurrentTime:(double)a3
{
  -[PLMoviePlayerController setCurrentTime:timeSnapOption:](self, "setCurrentTime:timeSnapOption:", 0, a3);
}

- (void)setCurrentTime:(double)a3 timeSnapOption:(unint64_t)a4
{
  -[PLMoviePlayerController setCurrentTime:timeSnapOption:forceUpdate:](self, "setCurrentTime:timeSnapOption:forceUpdate:", a4, 0, a3);
}

- (void)setCurrentTime:(double)a3 timeSnapOption:(unint64_t)a4 forceUpdate:(BOOL)a5
{
  self->_hasPendingTime = 1;
  self->_pendingTime = a3;
  self->_pendingTimeSnapOption = a4;
  if (a5)
    self->_forceUpdateCurrentTime = 1;
  -[PLMoviePlayerController _updateFromPendingTime](self, "_updateFromPendingTime");
}

- (void)_updateFromPendingTime
{
  CFAbsoluteTime Current;
  unint64_t pendingTimeSnapOption;
  double v5;
  double pendingTime;
  AVPlayer *player;
  CMTime v8;
  CMTime v9;
  CMTime v10;
  _QWORD v11[5];
  CMTime v12;
  CMTime v13;
  CMTime v14;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__delayedUpdateFromPendingTime, 0);
  if (self->_hasPendingTime && self->_isPreparedForPlayback)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (self->_forceUpdateCurrentTime || !self->_isSeeking || (v5 = Current - self->_lastSetCurrentTimeTime, v5 >= 0.5))
    {
      self->_hasPendingTime = 0;
      self->_forceUpdateCurrentTime = 0;
      self->_lastSetCurrentTimeTime = Current;
      self->_isSeeking = 1;
      memset(&v14, 0, sizeof(v14));
      CMTimeMakeWithSeconds(&v14, 0.0, 1000);
      memset(&v13, 0, sizeof(v13));
      CMTimeMakeWithSeconds(&v13, 0.0, 1000);
      pendingTimeSnapOption = self->_pendingTimeSnapOption;
      if (pendingTimeSnapOption == 1)
      {
        CMTimeMakeWithSeconds(&v12, 2.0, 1000);
        v14 = v12;
        CMTimeMakeWithSeconds(&v12, 2.0, 1000);
        v13 = v12;
      }
      else if (!pendingTimeSnapOption)
      {
        CMTimeMakeWithSeconds(&v12, 2.0, 1000);
        v14 = v12;
      }
      memset(&v12, 0, sizeof(v12));
      pendingTime = self->_pendingTime;
      if (fabs(pendingTime) == INFINITY)
        v12 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
      else
        CMTimeMakeWithSeconds(&v12, pendingTime, 600);
      player = self->_player;
      v11[1] = 3221225472;
      v11[2] = __49__PLMoviePlayerController__updateFromPendingTime__block_invoke;
      v11[3] = &unk_1E70B6398;
      v11[4] = self;
      v10 = v12;
      v11[0] = MEMORY[0x1E0C809B0];
      v9 = v14;
      v8 = v13;
      -[AVPlayer seekToTime:toleranceBefore:toleranceAfter:completionHandler:](player, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v10, &v9, &v8, v11);
    }
    else
    {
      -[PLMoviePlayerController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__delayedUpdateFromPendingTime, 0, 0.5 - v5);
    }
  }
}

- (double)duration
{
  id v2;
  CMTime time;

  v2 = -[PLMoviePlayerController _asset](self, "_asset");
  if (v2)
    objc_msgSend(v2, "duration");
  else
    memset(&time, 0, sizeof(time));
  return CMTimeGetSeconds(&time);
}

- (float)playbackRate
{
  float result;

  -[AVPlayer rate](self->_player, "rate");
  return result;
}

- (double)currentTime
{
  AVPlayerItem *playerItem;
  CMTime time;

  playerItem = self->_playerItem;
  if (playerItem)
    -[AVPlayerItem currentTime](playerItem, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  return CMTimeGetSeconds(&time);
}

- (void)_streamBufferFull
{
  -[PLMoviePlayerController _setBufferingState:](self, "_setBufferingState:", self->_bufferingState & 0xFFFFFFFFFFFFFFF3 | 8);
}

- (void)_streamLikelyToKeepUp
{
  -[PLMoviePlayerController _setBufferingState:](self, "_setBufferingState:", self->_bufferingState & 0xFFFFFFFFFFFFFFF9 | 2);
}

- (void)_streamRanDry
{
  -[PLMoviePlayerController _setBufferingState:](self, "_setBufferingState:", self->_bufferingState | 4);
}

- (void)_streamUnlikelyToKeepUp
{
  -[PLMoviePlayerController _setBufferingState:](self, "_setBufferingState:", self->_bufferingState & 0xFFFFFFFFFFFFFFFDLL);
}

- (void)_setBufferingState:(unint64_t)a3
{
  NSObject *Log;
  int v6;
  unint64_t v7;
  NSObject *v8;
  unint64_t bufferingState;
  int v10;
  unint64_t v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  Log = PLPhotoSharingGetLog();
  if (os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1B9897000, Log, OS_LOG_TYPE_DEFAULT, "(video-playback) setting buffering state to %lu", (uint8_t *)&v10, 0xCu);
  }
  if ((a3 & 4) != 0)
  {
    a3 &= 0xFFFFFFFFFFFFFFF5;
  }
  else if ((a3 & 1) != 0)
  {
    v6 = objc_msgSend((id)objc_opt_class(), "_isStreamableAsset:", -[PLMoviePlayerController _asset](self, "_asset"));
    v7 = a3 | 0xA;
    if (v6)
      v7 = a3;
    a3 = v7 & 0xFFFFFFFFFFFFFFFBLL;
  }
  if (self->_bufferingState != a3)
  {
    v8 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      bufferingState = self->_bufferingState;
      v10 = 134218240;
      v11 = bufferingState;
      v12 = 2048;
      v13 = a3;
      _os_log_impl(&dword_1B9897000, v8, OS_LOG_TYPE_DEFAULT, "(video-playback) buffering state changed from %lu to %lu", (uint8_t *)&v10, 0x16u);
    }
    self->_bufferingState = a3;
    -[PLMoviePlayerControllerDelegate moviePlayerBufferingStateDidChange:](self->_delegate, "moviePlayerBufferingStateDidChange:", self);
  }
}

- (void)_setPlaybackState:(unint64_t)a3
{
  unint64_t playbackState;

  playbackState = self->_playbackState;
  if (a3 == 1 || playbackState)
  {
    if (playbackState != a3)
    {
      self->_playbackState = a3;
      if (a3 == 1)
        -[PLMoviePlayerController _setBufferingState:](self, "_setBufferingState:", self->_bufferingState & 0xFFFFFFFFFFFFFFFBLL);
      -[PLMoviePlayerControllerDelegate moviePlayerPlaybackStateDidChange:fromPlaybackState:](self->_delegate, "moviePlayerPlaybackStateDidChange:fromPlaybackState:", self, playbackState);
      a3 = self->_playbackState;
    }
    if (a3 == 1)
      -[PLMoviePlayerController _restoreTVOutVideoIfNecessary](self, "_restoreTVOutVideoIfNecessary");
  }
}

- (void)_simpleRemoteNotification:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  switch(objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CEB308]), "unsignedIntValue"))
  {
    case 0u:
      -[PLMoviePlayerControllerDelegate moviePlayerHeadsetPlayPausePressed:](self->_delegate, "moviePlayerHeadsetPlayPausePressed:", self);
      break;
    case 1u:
      -[PLMoviePlayerControllerDelegate moviePlayerHeadsetNextTrackPressed:](self->_delegate, "moviePlayerHeadsetNextTrackPressed:", self);
      break;
    case 2u:
      -[PLMoviePlayerControllerDelegate moviePlayerHeadsetPreviousTrackPressed:](self->_delegate, "moviePlayerHeadsetPreviousTrackPressed:", self);
      break;
    case 5u:
      -[PLMoviePlayerController stop](self, "stop");
      break;
    case 6u:
      -[PLMoviePlayerController play](self, "play");
      break;
    case 7u:
      -[PLMoviePlayerController pause](self, "pause");
      break;
    default:
      return;
  }
}

- (void)_pausePlaybackForNotification
{
  if ((!MPTVOutCapabledAndPreferred()
     || (objc_msgSend((id)*MEMORY[0x1E0CEB258], "isSuspendedUnderLock") & 1) == 0)
    && !-[AVPlayer isExternalPlaybackActive](self->_player, "isExternalPlaybackActive")
    && self->_playbackState == 1)
  {
    -[PLMoviePlayerController pause](self, "pause");
    -[PLMoviePlayerControllerDelegate moviePlayerWasSuspendedDuringPlayback:](self->_delegate, "moviePlayerWasSuspendedDuringPlayback:", self);
  }
}

- (void)_willSuspendNotification:(id)a3
{
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__tearDownTVOutWindow, 0);
  -[PLMoviePlayerController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__tearDownTVOutWindow, 0, 0.0);
  v4 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "beginBackgroundTaskWithExpirationHandler:", 0);
  self->_backgroundTaskId = v4;
  if (v4 == *MEMORY[0x1E0CEB390])
    NSLog(CFSTR("Unable to start background task, TV Out window may not tear down."));
  -[PLMoviePlayerController _pausePlaybackForNotification](self, "_pausePlaybackForNotification");
}

- (void)_didEnterBackgroundNotification:(id)a3
{
  if ((objc_msgSend((id)*MEMORY[0x1E0CEB258], "isSuspendedUnderLock", a3) & 1) == 0)
    -[PLMoviePlayerController _setForceDisableTVOut:](self, "_setForceDisableTVOut:", 1);
}

- (void)_willEnterForegroundNotification:(id)a3
{
  -[PLMoviePlayerController _displayVideoView](self, "_displayVideoView", a3);
  -[PLMoviePlayerController _setForceDisableTVOut:](self, "_setForceDisableTVOut:", 0);
}

- (void)_screenDidConnect:(id)a3
{
  -[PLMoviePlayerController _updateTVOutEnabled](self, "_updateTVOutEnabled", a3);
  -[PLMoviePlayerController _displayVideoView](self, "_displayVideoView");
  -[PLMoviePlayerController _updateDisableAirPlayMirroringDuringPlayback](self, "_updateDisableAirPlayMirroringDuringPlayback");
  -[PLMoviePlayerController _updateBackgroundViewInformation](self, "_updateBackgroundViewInformation");
}

- (void)_screenDidDisconnect:(id)a3
{
  -[PLMoviePlayerController _updateTVOutEnabled](self, "_updateTVOutEnabled", a3);
  -[PLMoviePlayerController _displayVideoView](self, "_displayVideoView");
  -[PLMoviePlayerController _updateDisableAirPlayMirroringDuringPlayback](self, "_updateDisableAirPlayMirroringDuringPlayback");
  -[PLMoviePlayerController _updateBackgroundViewInformation](self, "_updateBackgroundViewInformation");
}

- (BOOL)videoOutActive
{
  return MPTVOutCapabledAndPreferred();
}

- (void)_setForceDisableTVOut:(BOOL)a3
{
  if (self->_forceDisableTVOut != a3)
  {
    self->_forceDisableTVOut = a3;
    -[PLMoviePlayerController _updateTVOutEnabled](self, "_updateTVOutEnabled");
  }
}

- (void)_updateTVOutEnabled
{
  int v3;

  if (self->_forceDisableTVOut)
    v3 = 0;
  else
    v3 = MPTVOutCapabledAndPreferred();
  if (self->_TVOutEnabled != v3)
  {
    self->_TVOutEnabled = v3;
    -[AVPlayer _setCALayerDestinationIsTVOut:](self->_player, "_setCALayerDestinationIsTVOut:");
    -[PLMoviePlayerController _updateBackgroundViewInformation](self, "_updateBackgroundViewInformation");
  }
}

- (void)_restoreTVOutVideoIfNecessary
{
  UIView *v3;
  UIView *v4;

  v3 = -[PLMoviePlayerView videoView](self->_view, "videoView");
  if (v3)
  {
    v4 = v3;
    if (!-[UIView superview](v3, "superview")
      || !-[UIView window](v4, "window")
      || self->_TVOutEnabled && (PLTVOutWindow *)-[UIView window](v4, "window") != self->_tvOutWindow)
    {
      -[PLMoviePlayerController _displayVideoView](self, "_displayVideoView");
    }
  }
}

- (void)_displayVideoView
{
  _BOOL4 TVOutEnabled;
  AVPlayer *player;

  TVOutEnabled = self->_TVOutEnabled;
  player = self->_player;
  if (TVOutEnabled)
  {
    -[AVPlayer _setCALayerDestinationIsTVOut:](player, "_setCALayerDestinationIsTVOut:", 1);
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__setupTVOutWindow, 0);
    -[PLMoviePlayerController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__setupTVOutWindow, 0, 0.0);
  }
  else
  {
    -[AVPlayer _setCALayerDestinationIsTVOut:](player, "_setCALayerDestinationIsTVOut:", 0);
    -[PLMoviePlayerView reattachVideoView](self->_view, "reattachVideoView");
  }
  -[PLMoviePlayerController _updateBackgroundViewInformation](self, "_updateBackgroundViewInformation");
}

- (void)_setupTVOutWindow
{
  PLTVOutWindow *tvOutWindow;

  tvOutWindow = self->_tvOutWindow;
  if (!tvOutWindow)
  {
    tvOutWindow = objc_alloc_init(PLTVOutWindow);
    self->_tvOutWindow = tvOutWindow;
  }
  if (-[PLTVOutWindow setVideoView:](tvOutWindow, "setVideoView:", -[PLMoviePlayerView videoView](self->_view, "videoView")))
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__tearDownTVOutWindow, 0);
    -[PLTVOutWindow setHidden:](self->_tvOutWindow, "setHidden:", 0);
  }
  else
  {
    NSLog(CFSTR("Error setting up TVOutWindow"));
  }
}

- (void)_tearDownTVOutWindow
{
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__setupTVOutWindow, 0);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  -[PLTVOutWindow setHidden:](self->_tvOutWindow, "setHidden:", 1);

  self->_tvOutWindow = 0;
  v4 = *MEMORY[0x1E0CEB390];
  if (self->_backgroundTaskId != *MEMORY[0x1E0CEB390])
  {
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "endBackgroundTask:");
    self->_backgroundTaskId = v4;
  }
}

- (BOOL)_allowsExternalPlayback
{
  int v3;

  v3 = -[PLMoviePlayerController isActiveController](self, "isActiveController");
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      LOBYTE(v3) = -[PLMoviePlayerControllerDelegate moviePlayerControllerShouldAllowExternalPlayback:](self->_delegate, "moviePlayerControllerShouldAllowExternalPlayback:", self);
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)_updateDisableAirPlayMirroringDuringPlayback
{
  -[AVPlayer setAllowsExternalPlayback:](self->_player, "setAllowsExternalPlayback:", -[PLMoviePlayerController _allowsExternalPlayback](self, "_allowsExternalPlayback"));
  -[AVPlayer setUsesExternalPlaybackWhileExternalScreenIsActive:](self->_player, "setUsesExternalPlaybackWhileExternalScreenIsActive:", 1);
}

- (BOOL)isExternalPlayback
{
  return -[AVPlayer externalPlaybackType](self->_player, "externalPlaybackType")
      || -[PLMoviePlayerController videoOutActive](self, "videoOutActive");
}

- (int64_t)externalPlaybackType
{
  return -[AVPlayer externalPlaybackType](self->_player, "externalPlaybackType");
}

- (void)_updateBackgroundViewInformation
{
  _BOOL4 v3;
  _BOOL4 v4;
  uint64_t v5;

  v3 = -[PLMoviePlayerController _allowsExternalPlayback](self, "_allowsExternalPlayback");
  v4 = -[PLMoviePlayerController isExternalPlayback](self, "isExternalPlayback") && v3;
  if (self->_isExternalPlayback != v4)
    self->_isExternalPlayback = v4;
  if (v3 && -[AVPlayer externalPlaybackType](self->_player, "externalPlaybackType") == 1)
  {
    v5 = 1;
  }
  else if (-[PLMoviePlayerController videoOutActive](self, "videoOutActive"))
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }
  if (-[PLMoviePlayerView destinationPlaceholderStyle](self->_view, "destinationPlaceholderStyle") != v5)
    -[PLMoviePlayerControllerDelegate moviePlayerUpdatedDestinationPlaceholder:](self->_delegate, "moviePlayerUpdatedDestinationPlaceholder:", self);
}

- (void)requestToBecomeActiveController
{
  -[PLMoviePlayerControllerManager moveControllerToTopOfStack:](+[PLMoviePlayerControllerManager sharedInstance](PLMoviePlayerControllerManager, "sharedInstance"), "moveControllerToTopOfStack:", self);
}

- (void)requestToResignAsActiveController
{
  -[PLMoviePlayerControllerManager removeControllerFromStack:](+[PLMoviePlayerControllerManager sharedInstance](PLMoviePlayerControllerManager, "sharedInstance"), "removeControllerFromStack:", self);
}

- (void)didBecomeActiveController
{
  -[PLMoviePlayerController setIsActiveController:](self, "setIsActiveController:", 1);
  -[PLMoviePlayerControllerDelegate moviePlayerControllerDidBecomeActiveController:](self->_delegate, "moviePlayerControllerDidBecomeActiveController:", self);
  -[PLMoviePlayerController _updateTVOutEnabled](self, "_updateTVOutEnabled");
  -[PLMoviePlayerController _updateDisableAirPlayMirroringDuringPlayback](self, "_updateDisableAirPlayMirroringDuringPlayback");
}

- (void)willResignAsActiveController
{
  -[PLMoviePlayerController setIsActiveController:](self, "setIsActiveController:", 0);
  -[PLMoviePlayerControllerDelegate moviePlayerControllerWillResignAsActiveController:](self->_delegate, "moviePlayerControllerWillResignAsActiveController:", self);
  -[PLMoviePlayerController _tearDownTVOutWindow](self, "_tearDownTVOutWindow");
  -[PLMoviePlayerController _updateTVOutEnabled](self, "_updateTVOutEnabled");
  -[PLMoviePlayerController _updateDisableAirPlayMirroringDuringPlayback](self, "_updateDisableAirPlayMirroringDuringPlayback");
}

- (void)_playerItemDidReachEndNotification:(id)a3
{
  -[PLMoviePlayerControllerDelegate moviePlayerPlaybackDidEnd:](self->_delegate, "moviePlayerPlaybackDidEnd:", self);
}

- (void)_playerItemFailedToPlayToEndNotification:(id)a3
{
  -[PLMoviePlayerController _playerItemFailedToPlayToEnd:](self, "_playerItemFailedToPlayToEnd:", objc_msgSend(a3, "userInfo"));
}

- (void)_playerItemFailedToPlayToEnd:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C8AC50]), "userInfo");
  if (objc_msgSend((id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CB3388]), "code") == -12926)
    -[PLMoviePlayerController pause](self, "pause");
  else
    -[PLMoviePlayerController _playbackFailedWithError:](self, "_playbackFailedWithError:", -[AVPlayerItem error](self->_playerItem, "error"));
}

- (void)_playbackFailedWithError:(id)a3
{
  _BOOL4 v5;
  void *v6;
  id *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (self->_playbackState)
    v5 = 0;
  else
    v5 = !self->_isPreparedForPlayback;
  -[PLMoviePlayerController _setPlaybackState:](self, "_setPlaybackState:", 3);
  if (objc_msgSend(a3, "code") != -11819)
  {
    v6 = (void *)objc_msgSend(a3, "domain");
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB32E8]) && objc_msgSend(a3, "code") == -1013)
    {
      -[PLMoviePlayerControllerDelegate moviePlayerEncounteredAuthenticationError:](self->_delegate, "moviePlayerEncounteredAuthenticationError:", self);
    }
    else if (!v5
           || -[PLMoviePlayerControllerDelegate moviePlayerShouldNotifyOnPreparationError:](self->_delegate, "moviePlayerShouldNotifyOnPreparationError:", self))
    {
      v7 = (id *)MEMORY[0x1E0CEB258];
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "applicationState") || objc_msgSend(*v7, "applicationState") == 2)
      {
        if (!v5)
        {
          pl_dispatch_async();
          -[PLMoviePlayerController _setPlaybackState:](self, "_setPlaybackState:", 0);
        }
      }
      else
      {
        v8 = (void *)objc_msgSend(a3, "localizedDescription");
        if (objc_msgSend(v8, "length"))
        {
          PLLocalizedFrameworkString();
          v11 = v8;
          v9 = PFStringWithValidatedFormat();
        }
        else
        {
          v9 = PLLocalizedFrameworkString();
        }
        v10 = (void *)objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v9, 0, 1, v11);
        objc_msgSend(v10, "addAction:", objc_msgSend(MEMORY[0x1E0CEA2E0], "actionWithTitle:style:handler:", PLLocalizedFrameworkString(), 0, 0));
        objc_msgSend((id)-[PLMoviePlayerView window](-[PLMoviePlayerController view](self, "view"), "window"), "pl_presentViewController:animated:", v10, 1);
      }
    }
  }
}

- (void)_exitPlayer:(int)a3
{
  if (!self->_exited)
    self->_exited = -[PLMoviePlayerControllerDelegate moviePlayerExitRequest:exitReason:](self->_delegate, "moviePlayerExitRequest:exitReason:", self, *(_QWORD *)&a3);
}

- (void)_serverConnectionDidDie:(id)a3
{
  NSError *v4;
  AVPlayer *player;
  Float64 Seconds;
  CMTime time;

  v4 = -[AVPlayer error](self->_player, "error", a3);
  player = self->_player;
  if (player)
    -[AVPlayer currentTime](self->_player, "currentTime");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  NSLog(CFSTR("_serverConnectionDiedNotification. Info -- notification=%@, AVPlayer = %@, currentTime = %.2f"), v4, player, *(_QWORD *)&Seconds);
  -[PLMoviePlayerController _exitPlayer:](self, "_exitPlayer:", 3);
}

- (PLMoviePlayerControllerDelegate)delegate
{
  return self->_delegate;
}

- (PLMoviePlayerView)view
{
  return self->_view;
}

- (AVPlayer)player
{
  return self->_player;
}

- (unint64_t)bufferingState
{
  return self->_bufferingState;
}

- (unint64_t)playbackState
{
  return self->_playbackState;
}

- (BOOL)TVOutEnabled
{
  return self->_TVOutEnabled;
}

- (void)setTVOutEnabled:(BOOL)a3
{
  self->_TVOutEnabled = a3;
}

- (BOOL)forceDisableTVOut
{
  return self->_forceDisableTVOut;
}

- (BOOL)isPreparedForPlayback
{
  return self->_isPreparedForPlayback;
}

- (BOOL)isActiveController
{
  return self->_isActiveController;
}

- (void)setIsActiveController:(BOOL)a3
{
  self->_isActiveController = a3;
}

uint64_t __52__PLMoviePlayerController__playbackFailedWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_exitPlayer:", 3);
}

uint64_t __49__PLMoviePlayerController__updateFromPendingTime__block_invoke(uint64_t result, int a2)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = 0;
  return result;
}

uint64_t __74__PLMoviePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  id *v1;
  uint64_t v2;
  _BYTE *v3;
  int v4;
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 8) == *(_QWORD *)(result + 40))
  {
    v1 = (id *)result;
    if (objc_msgSend(*(id *)(result + 48), "isEqualToString:", CFSTR("status")))
    {
      v2 = objc_msgSend(*((id *)v1[4] + 1), "status");
      v3 = v1[4];
      if (v2 == 1)
      {
        v3[114] = 1;
        objc_msgSend(v1[4], "_updateFromPendingTime");
        objc_msgSend(v1[4], "_setBufferingState:", *((_QWORD *)v1[4] + 16) | 1);
        return objc_msgSend(*((id *)v1[4] + 15), "moviePlayerReadyToPlay:");
      }
      else
      {
        return objc_msgSend(v3, "_playerItemFailedToPlayToEnd:", v1[7]);
      }
    }
    else if (objc_msgSend(v1[6], "isEqualToString:", CFSTR("playbackBufferEmpty")))
    {
      result = objc_msgSend((id)objc_msgSend(v1[7], "objectForKey:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
      if ((_DWORD)result)
        return objc_msgSend(v1[4], "_streamRanDry");
    }
    else if (objc_msgSend(v1[6], "isEqualToString:", CFSTR("playbackBufferFull")))
    {
      result = objc_msgSend((id)objc_msgSend(v1[7], "objectForKey:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
      if ((_DWORD)result)
        return objc_msgSend(v1[4], "_streamBufferFull");
    }
    else
    {
      result = objc_msgSend(v1[6], "isEqualToString:", CFSTR("playbackLikelyToKeepUp"));
      if ((_DWORD)result)
      {
        v4 = objc_msgSend((id)objc_msgSend(v1[7], "objectForKey:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
        v5 = v1[4];
        if (v4)
          return objc_msgSend(v5, "_streamLikelyToKeepUp");
        else
          return objc_msgSend(v5, "_streamUnlikelyToKeepUp");
      }
    }
  }
  return result;
}

uint64_t __74__PLMoviePlayerController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t result)
{
  id *v1;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 16) == *(_QWORD *)(result + 40))
  {
    v1 = (id *)result;
    if (objc_msgSend(*(id *)(result + 48), "isEqualToString:", CFSTR("rate")))
    {
      return objc_msgSend(v1[4], "_playerRateDidChange:", v1[7]);
    }
    else if (objc_msgSend(v1[6], "isEqualToString:", CFSTR("status")))
    {
      result = objc_msgSend((id)objc_msgSend(v1[7], "objectForKey:", *MEMORY[0x1E0CB2CB8]), "intValue");
      if ((_DWORD)result == 2)
        return objc_msgSend(v1[4], "_serverConnectionDidDie:", v1[7]);
    }
    else
    {
      result = objc_msgSend(v1[6], "isEqualToString:", CFSTR("externalPlaybackActive"));
      if ((_DWORD)result)
      {
        objc_msgSend(v1[4], "_updateBackgroundViewInformation");
        return objc_msgSend(*((id *)v1[4] + 15), "moviePlayerDidChangeExternalPlaybackType:");
      }
    }
  }
  return result;
}

uint64_t __55__PLMoviePlayerController__didLoadValueOfKey_forAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didLoadValueOfKey:forAsset:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __38__PLMoviePlayerController__loadAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didLoadValueOfKey:forAsset:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)AVAssetURLWithPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CC22F0], "URLFromPath:", a3);
}

+ (BOOL)_isStreamableAsset:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a1, "_isNetworkSupportedPath:", objc_msgSend((id)objc_msgSend(a3, "URL"), "absoluteString"));
  else
    return 0;
}

+ (BOOL)_isNetworkSupportedPath:(id)a3
{
  BOOL v4;

  v4 = 1;
  if (objc_msgSend(a3, "compare:options:range:", CFSTR("https://"), 1, 0, objc_msgSend(CFSTR("https://"), "length")))
  {
    return !objc_msgSend(a3, "compare:options:range:", CFSTR("http://"), 1, 0, objc_msgSend(CFSTR("http://"), "length"))|| objc_msgSend(a3, "compare:options:range:", CFSTR("home-sharing://"), 1, 0, objc_msgSend(CFSTR("home-sharing://"), "length")) == 0;
  }
  return v4;
}

@end
