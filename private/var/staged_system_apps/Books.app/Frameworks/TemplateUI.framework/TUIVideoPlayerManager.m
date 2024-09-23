@implementation TUIVideoPlayerManager

- (TUIVideoPlayerManager)init
{
  TUIVideoPlayerManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *players;
  NSMutableSet *v5;
  NSMutableSet *observers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIVideoPlayerManager;
  v2 = -[TUIVideoPlayerManager init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    players = v2->_players;
    v2->_players = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    observers = v2->_observers;
    v2->_observers = v5;

    v2->_isInForeground = 1;
    v2->_observerAccessLock._os_unfair_lock_opaque = 0;
    -[TUIVideoPlayerManager _determineSystemAutoPlay](v2, "_determineSystemAutoPlay");
    -[TUIVideoPlayerManager _addAudioSessionObservers](v2, "_addAudioSessionObservers");
    -[TUIVideoPlayerManager _addNotificationObservers](v2, "_addNotificationObservers");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[TUIVideoPlayerManager _removeAudioSessionObservers](self, "_removeAudioSessionObservers");
  v3.receiver = self;
  v3.super_class = (Class)TUIVideoPlayerManager;
  -[TUIVideoPlayerManager dealloc](&v3, "dealloc");
}

- (void)setSystemAutoPlayEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  id WeakRetained;
  _TUISharableVideoPlayer **p_activeVideoPlayer;
  id v9;
  void *v10;
  id v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  int v21;
  _QWORD v22[2];

  if (self->_systemAutoPlayEnabled != a3)
  {
    v3 = a3;
    v5 = TUIVideoLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
      v21 = 67109378;
      LODWORD(v22[0]) = v3;
      WORD2(v22[0]) = 2112;
      *(_QWORD *)((char *)v22 + 6) = WeakRetained;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Setting systemAutoPlayEnabled: %i, activeVideoPlayer: %@", (uint8_t *)&v21, 0x12u);

    }
    self->_systemAutoPlayEnabled = v3;
    p_activeVideoPlayer = &self->_activeVideoPlayer;
    v9 = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
    v10 = v9;
    if (v9 && self->_systemAutoPlayEnabled)
    {
      v11 = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
      v12 = objc_msgSend(v11, "isWithinVisibleBounds");

      if (v12)
      {
        v13 = TUIVideoLog();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
          v21 = 138412290;
          v22[0] = v15;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Playing video from system auto play settings changed: %@", (uint8_t *)&v21, 0xCu);

        }
        v16 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "player"));
        objc_msgSend(v17, "play");
LABEL_14:

        return;
      }
    }
    else
    {

    }
    v18 = TUIVideoLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
      v21 = 138412290;
      v22[0] = v20;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Pausing video from system auto play settings changed: %@", (uint8_t *)&v21, 0xCu);

    }
    v16 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "player"));
    objc_msgSend(v17, "pause");
    goto LABEL_14;
  }
}

- (void)setActiveVideoPlayer:(id)a3
{
  id v4;
  _TUISharableVideoPlayer **p_activeVideoPlayer;
  id WeakRetained;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;

  v4 = a3;
  p_activeVideoPlayer = &self->_activeVideoPlayer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)p_activeVideoPlayer, v4);
    v7 = TUIVideoLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Set active video player: %@", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (BOOL)captionsEnabledForActivePlayer
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayerManager activeVideoPlayer](self, "activeVideoPlayer"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayerManager activeVideoPlayer](self, "activeVideoPlayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "player"));
  v6 = objc_msgSend(v5, "captionsEnabled");

  return v6;
}

- (void)configureHostWithPlayerForURL:(id)a3 videoId:(id)a4 host:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  _TUISharableVideoPlayer *v12;
  _TUISharableVideoPlayer *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  void *v26;
  void *v27;
  id v28;

  v28 = a3;
  v10 = a4;
  v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v12 = (_TUISharableVideoPlayer *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_players, "objectForKey:", v10));
  if (v12)
  {
    v13 = v12;
    -[_TUISharableVideoPlayer incrementHostCount](v12, "incrementHostCount");
  }
  else
  {
    v13 = -[_TUISharableVideoPlayer initWithURL:videoId:]([_TUISharableVideoPlayer alloc], "initWithURL:videoId:", v28, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_TUISharableVideoPlayer player](v13, "player"));
    objc_msgSend(v14, "beginLoadingResources");

    -[_TUISharableVideoPlayer setTriggerPlaybackEnabled:](v13, "setTriggerPlaybackEnabled:", (a6 >> 1) & 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[_TUISharableVideoPlayer player](v13, "player"));
    objc_msgSend(v15, "setShouldLoop:", a6 & 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_TUISharableVideoPlayer player](v13, "player"));
    objc_msgSend(v16, "setMuted:", (a6 >> 2) & 1);

    -[NSMutableDictionary setObject:forKey:](self->_players, "setObject:forKey:", v13, v10);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_TUISharableVideoPlayer player](v13, "player"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "videoUrl"));
  v19 = objc_msgSend(v18, "isEqual:", v28);

  if ((v19 & 1) == 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_TUISharableVideoPlayer player](v13, "player"));
    objc_msgSend(v20, "reloadWithNewURL:", v28);

  }
  v21 = (id)objc_claimAutoreleasedReturnValue(-[_TUISharableVideoPlayer activeHost](v13, "activeHost"));

  if (v21 != v11)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_TUISharableVideoPlayer activeHost](v13, "activeHost"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[_TUISharableVideoPlayer activeHost](v13, "activeHost"));
      objc_msgSend(v23, "willBecomeInactiveHost");

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_TUISharableVideoPlayer player](v13, "player"));
    objc_msgSend(v24, "setDelegate:", self);

    -[_TUISharableVideoPlayer setActiveHost:](v13, "setActiveHost:", v11);
    objc_msgSend(v11, "didBecomeActiveHost");
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);

  if (!WeakRetained)
    -[TUIVideoPlayerManager setActiveVideoPlayer:](self, "setActiveVideoPlayer:", v13);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[_TUISharableVideoPlayer player](v13, "player"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "videoViewController"));
  objc_msgSend(v27, "setPlayer:", v26);

}

- (void)endHostingForVideoId:(id)a3 forHost:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_players, "objectForKey:", v11));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "decrementHostCount");
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeHost"));

    if (v9 == v6)
      objc_msgSend(v8, "setActiveHost:", 0);
    if (objc_msgSend(v8, "shouldRelease"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "player"));
      objc_msgSend(v10, "releaseResources");

      -[NSMutableDictionary removeObjectForKey:](self->_players, "removeObjectForKey:", v11);
    }
  }

}

- (void)setActiveHostOfPlayerForVideoId:(id)a3 videoUrl:(id)a4 host:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  id v18;

  v18 = a4;
  v8 = a5;
  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_players, "objectForKey:", v9));

  if (v10)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeHost"));

    if (v11 != v8)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeHost"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeHost"));
        objc_msgSend(v13, "willBecomeInactiveHost");

      }
      objc_msgSend(v10, "setActiveHost:", v8);
      objc_msgSend(v8, "didBecomeActiveHost");
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "player"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "videoUrl"));
      v16 = objc_msgSend(v15, "isEqual:", v18);

      if ((v16 & 1) == 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "player"));
        objc_msgSend(v17, "reloadWithNewURL:", v18);

      }
    }
  }

}

- (void)hostWantsToPlayVideoWithVideoId:(id)a3 requestingHost:(id)a4 isTriggerInitiated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  _BOOL4 waitingOnPlaybackToBegin;
  _BOOL4 v12;
  int v13;
  id WeakRetained;
  void *v15;
  id v16;
  unsigned int v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  char *v22;
  void *v23;
  void *v24;
  id v25;

  v5 = a5;
  v25 = a4;
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_players, "objectForKey:", v8));

  waitingOnPlaybackToBegin = self->_waitingOnPlaybackToBegin;
  if (objc_msgSend(v9, "triggerPlaybackEnabled"))
    v12 = !waitingOnPlaybackToBegin && self->_systemAutoPlayEnabled && v5;
  else
    v12 = 0;
  v13 = !v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "player"));
  if (objc_msgSend(v15, "isPlaying"))
  {
    v16 = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
    v17 = v13 | objc_msgSend(v16, "isWithinVisibleBounds") ^ 1;

  }
  else
  {
    v17 = 1;
  }

  if ((v12 | v13) == 1 && v9 && v17)
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeHost"));
    if (v18 != v25)
    {
LABEL_18:

      goto LABEL_24;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "player"));
    if (objc_msgSend(v19, "isPlaying"))
    {

      v18 = v25;
      goto LABEL_18;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "player"));
    v22 = (char *)objc_msgSend(v21, "state");

    if (v22 != (_BYTE *)&dword_8 + 1)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeHost"));
      objc_msgSend(v23, "managerAttemptingActionWithOrigin:actionCase:", v5, 0);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "player"));
      objc_msgSend(v24, "play");

      self->_waitingOnPlaybackToBegin = 1;
    }
  }
  else
  {
    if (v9)
      v20 = v17;
    else
      v20 = 1;
    if ((v20 & 1) == 0)
      objc_msgSend(v9, "setTriggerPlaybackEnabled:", 0);
  }
LABEL_24:

}

- (void)hostWantsToPausePlayerWithVideoId:(id)a3 requestingHost:(id)a4 isTriggerInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  id v16;

  v5 = a5;
  v16 = a4;
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v9 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_players, "objectForKey:", v8));

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
  if (v9 == WeakRetained)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeHost"));
    if (v11 == v16)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "player"));
      v13 = objc_msgSend(v12, "isPlaying");

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeHost"));
        objc_msgSend(v14, "managerAttemptingActionWithOrigin:actionCase:", v5, 1);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "player"));
        objc_msgSend(v15, "pause");

        objc_msgSend(v9, "setTriggerPlaybackEnabled:", v5);
      }
    }
    else
    {

    }
  }

}

- (void)hostWantsToSetPlayerIsWithinVisibleBoundsForPlayerWithVideoId:(id)a3 requestingHost:(id)a4 isWithinVisibleBounds:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  unsigned int v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  void *v17;

  v5 = a5;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_players, "objectForKey:", v7));

  if (v8 && objc_msgSend(v8, "isWithinVisibleBounds") != v5)
  {
    v9 = TUIVideoLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v8, "isWithinVisibleBounds");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "player"));
      v13[0] = 67109634;
      v13[1] = v11;
      v14 = 1024;
      v15 = v5;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Updating isWithinVisibleBounds from %i to %i for %@", (uint8_t *)v13, 0x18u);

    }
    objc_msgSend(v8, "setIsWithinVisibleBounds:", v5);
  }

}

- (void)setLoopingStateForPlayerWithVideoId:(id)a3 loop:(BOOL)a4 requestingHost:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v12 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_players, "objectForKey:", v9));

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeHost"));
  if (v10 == v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "player"));
    objc_msgSend(v11, "setShouldLoop:", v5);

  }
}

- (void)setMuteStateForPlayerWithVideoId:(id)a3 muted:(BOOL)a4 requestingHost:(id)a5 isTriggerInitiated:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a6;
  v7 = a4;
  v10 = a5;
  v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v16 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_players, "objectForKey:", v11));

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activeHost"));
  if (v12 == v10)
  {
    if (v7)
      v13 = 2;
    else
      v13 = 3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activeHost"));
    objc_msgSend(v14, "managerAttemptingActionWithOrigin:actionCase:", v6, v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "player"));
    objc_msgSend(v15, "setMuted:", v7);

  }
}

- (unint64_t)stateForPlayerWithVideoId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_players, "objectForKey:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "player"));
    v7 = objc_msgSend(v6, "state");

  }
  else
  {
    v7 = 0;
  }

  return (unint64_t)v7;
}

- (BOOL)playerWithVideoIdIsPlaying:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_players, "objectForKey:", v4));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "player"));
    v7 = objc_msgSend(v6, "isPlaying");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_observerAccessLock;
  id v5;
  void *v6;

  p_observerAccessLock = &self->_observerAccessLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayerManager observers](self, "observers"));
  objc_msgSend(v6, "addObject:", v5);

  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observerAccessLock;
  id v5;
  void *v6;

  p_observerAccessLock = &self->_observerAccessLock;
  v5 = a3;
  os_unfair_lock_lock(p_observerAccessLock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayerManager observers](self, "observers"));
  objc_msgSend(v6, "removeObject:", v5);

  os_unfair_lock_unlock(p_observerAccessLock);
}

- (void)_addAudioSessionObservers
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("outputVolume"), 1, &off_2414A8);
    v3 = v4;
  }

}

- (void)_removeAudioSessionObservers
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](AVAudioSession, "sharedInstance"));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("outputVolume"));
    v3 = v4;
  }

}

- (void)_addNotificationObservers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_handleDidEnterBackgroundNotification:", UIApplicationDidEnterBackgroundNotification, 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_handleWillEnterForegroundNotification:", UIApplicationWillEnterForegroundNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "_handleVideoAutoplayStatusDidChange:", UIAccessibilityVideoAutoplayStatusDidChangeNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:", self, "_handleReduceMotionStatusDidChange:", UIAccessibilityReduceMotionStatusDidChangeNotification, 0);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "_handlePowerStateDidChange:", NSProcessInfoPowerStateDidChangeNotification, 0);

}

- (void)_handleWillEnterForegroundNotification:(id)a3
{
  _TUISharableVideoPlayer **p_activeVideoPlayer;
  id WeakRetained;
  _BOOL4 activePlayerWasPlayingWhenEnteringBackground;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  id v16;

  p_activeVideoPlayer = &self->_activeVideoPlayer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
  if (WeakRetained)
    activePlayerWasPlayingWhenEnteringBackground = self->_activePlayerWasPlayingWhenEnteringBackground;
  else
    activePlayerWasPlayingWhenEnteringBackground = 0;

  v7 = TUIVideoLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
    v14[0] = 67109378;
    v14[1] = activePlayerWasPlayingWhenEnteringBackground;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Video did enter foreground, should resume: %i, for player: %@", (uint8_t *)v14, 0x12u);

  }
  if (activePlayerWasPlayingWhenEnteringBackground)
  {
    v10 = TUIVideoLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Resuming video on foreground", (uint8_t *)v14, 2u);
    }

    v12 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "player"));
    objc_msgSend(v13, "play");

  }
  self->_isInForeground = 1;
  -[TUIVideoPlayerManager _determineSystemAutoPlay](self, "_determineSystemAutoPlay");
}

- (void)_handleDidEnterBackgroundNotification:(id)a3
{
  _TUISharableVideoPlayer **p_activeVideoPlayer;
  id WeakRetained;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  _DWORD v15[2];

  p_activeVideoPlayer = &self->_activeVideoPlayer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "player"));
    v8 = objc_msgSend(v7, "isPlaying");

  }
  else
  {
    v8 = 0;
  }

  v9 = TUIVideoLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Video did enter background, isPlaying: %i", (uint8_t *)v15, 8u);
  }

  self->_activePlayerWasPlayingWhenEnteringBackground = v8;
  if (v8)
  {
    v11 = TUIVideoLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Pausing video on background", (uint8_t *)v15, 2u);
    }

    v13 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "player"));
    objc_msgSend(v14, "pause");

  }
  self->_isInForeground = 0;
}

- (void)_handlePowerStateDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DF5B0;
  block[3] = &unk_23D938;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_determineSystemAutoPlay
{
  _BOOL4 IsReduceMotionEnabled;
  _BOOL4 IsVideoAutoplayEnabled;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  _DWORD v10[2];
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  unsigned int v14;

  if (self->_isInForeground)
  {
    IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    IsVideoAutoplayEnabled = UIAccessibilityIsVideoAutoplayEnabled();
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v6 = objc_msgSend(v5, "isLowPowerModeEnabled");

    v7 = TUIVideoLog();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109632;
      v10[1] = IsReduceMotionEnabled;
      v11 = 1024;
      v12 = IsVideoAutoplayEnabled;
      v13 = 1024;
      v14 = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Setting systemAutoPlay: reducedMotion: %i, videoAutoPlayEnabled: %i, lowPowerModeEnabled: %i", (uint8_t *)v10, 0x14u);
    }

    if (IsReduceMotionEnabled)
      v9 = 0;
    else
      v9 = IsVideoAutoplayEnabled & (v6 ^ 1);
    -[TUIVideoPlayerManager setSystemAutoPlayEnabled:](self, "setSystemAutoPlayEnabled:", v9);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _TUISharableVideoPlayer **p_activeVideoPlayer;
  id WeakRetained;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (a6 == &off_2414A8)
  {
    if (v10 && v12 && objc_msgSend(v10, "isEqualToString:", CFSTR("outputVolume")))
    {
      p_activeVideoPlayer = &self->_activeVideoPlayer;
      WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "player"));

      if (v16 && objc_msgSend(v16, "isPlaying") && objc_msgSend(v16, "isMuted"))
      {
        v17 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activeHost"));
        objc_msgSend(v18, "managerAttemptingActionWithOrigin:actionCase:", 0, 3);

        v19 = objc_loadWeakRetained((id *)p_activeVideoPlayer);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "player"));
        objc_msgSend(v20, "setMuted:", 0);

      }
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)TUIVideoPlayerManager;
    -[TUIVideoPlayerManager observeValueForKeyPath:ofObject:change:context:](&v21, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)player:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *players;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  players = self->_players;
  v12 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "videoId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](players, "objectForKey:", v8));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeHost"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "videoId"));
    objc_msgSend(v10, "playerWithVideoId:didChangeState:", v11, a4);

  }
}

- (void)playerDidPlayToEnd:(id)a3 mediaTimePlayed:(double)a4
{
  id v6;
  NSMutableDictionary *players;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  players = self->_players;
  v12 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "videoId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](players, "objectForKey:", v8));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeHost"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "videoId"));
    objc_msgSend(v10, "playerWithVideoIdDidPlayToEnd:mediaTimePlayed:", v11, a4);

  }
}

- (void)player:(id)a3 didPlayToTime:(double)a4
{
  id v6;
  NSMutableDictionary *players;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  players = self->_players;
  v12 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "videoId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](players, "objectForKey:", v8));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeHost"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "videoId"));
    objc_msgSend(v10, "playerWithVideoId:didPlayToTime:", v11, a4);

  }
}

- (void)player:(id)a3 didStallPlaybackAtTime:(double)a4
{
  id v6;
  NSMutableDictionary *players;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  players = self->_players;
  v12 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "videoId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](players, "objectForKey:", v8));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeHost"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "videoId"));
    objc_msgSend(v10, "playerWithVideoId:didStallPlaybackAtTime:", v11, a4);

  }
}

- (void)playerDidLoadPlayerItem:(id)a3
{
  id v4;
  NSMutableDictionary *players;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  players = self->_players;
  v10 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "videoId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](players, "objectForKey:", v6));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeHost"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "videoId"));
    objc_msgSend(v8, "playerWithVideoIdDidLoadPlayerItem:", v9);

  }
}

- (void)playerDidPlay:(id)a3 mediaTimePlayed:(double)a4
{
  id v6;
  NSMutableDictionary *players;
  void *v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a3;
  players = self->_players;
  v15 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "videoId"));
  v9 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](players, "objectForKey:", v8));

  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);

    if (WeakRetained != v9)
    {
      v11 = objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "player"));
      objc_msgSend(v12, "pause");

      -[TUIVideoPlayerManager setActiveVideoPlayer:](self, "setActiveVideoPlayer:", v9);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeHost"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "videoId"));
    objc_msgSend(v13, "playerWithVideoIdDidPlay:mediaTimePlayed:", v14, a4);

  }
  self->_waitingOnPlaybackToBegin = 0;

}

- (void)playerDidPause:(id)a3 mediaTimePlayed:(double)a4
{
  id v6;
  NSMutableDictionary *players;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  players = self->_players;
  v12 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "videoId"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](players, "objectForKey:", v8));

  if (v9)
  {
    objc_msgSend(v9, "setTriggerPlaybackEnabled:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeHost"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "videoId"));
    objc_msgSend(v10, "playerWithVideoIdDidPause:mediaTimePlayed:", v11, a4);

  }
}

- (void)player:(id)a3 didSetMuted:(BOOL)a4 mediaTimePlayed:(double)a5
{
  _BOOL8 v6;
  id v8;
  NSMutableDictionary *players;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v8 = a3;
  players = self->_players;
  v14 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "videoId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](players, "objectForKey:", v10));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeHost"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "videoId"));
    objc_msgSend(v12, "playerWithVideoId:didSetMuted:mediaTimePlayed:", v13, v6, a5);

  }
}

- (void)player:(id)a3 didSetFailureReason:(unint64_t)a4 mediaTimePlayed:(double)a5
{
  id v8;
  NSMutableDictionary *players;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a3;
  players = self->_players;
  v14 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "videoId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](players, "objectForKey:", v10));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeHost"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "videoId"));
    objc_msgSend(v12, "playerWithVideoId:didSetFailureReason:mediaTimePlayed:", v13, a4, a5);

  }
}

- (void)player:(id)a3 didSetCaptionsEnabled:(BOOL)a4
{
  _BOOL8 v4;
  os_unfair_lock_s *p_observerAccessLock;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a4;
  p_observerAccessLock = &self->_observerAccessLock;
  os_unfair_lock_lock(&self->_observerAccessLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoPlayerManager observers](self, "observers"));
  v8 = objc_msgSend(v7, "copy");

  os_unfair_lock_unlock(p_observerAccessLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "manager:didSetCaptions:", self, v4, (_QWORD)v14);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (BOOL)isInForeground
{
  return self->_isInForeground;
}

- (void)setIsInForeground:(BOOL)a3
{
  self->_isInForeground = a3;
}

- (NSMutableDictionary)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_players, a3);
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (_TUISharableVideoPlayer)activeVideoPlayer
{
  return (_TUISharableVideoPlayer *)objc_loadWeakRetained((id *)&self->_activeVideoPlayer);
}

- (BOOL)systemAutoPlayEnabled
{
  return self->_systemAutoPlayEnabled;
}

- (BOOL)activePlayerWasPlayingWhenEnteringBackground
{
  return self->_activePlayerWasPlayingWhenEnteringBackground;
}

- (void)setActivePlayerWasPlayingWhenEnteringBackground:(BOOL)a3
{
  self->_activePlayerWasPlayingWhenEnteringBackground = a3;
}

- (BOOL)waitingOnPlaybackToBegin
{
  return self->_waitingOnPlaybackToBegin;
}

- (void)setWaitingOnPlaybackToBegin:(BOOL)a3
{
  self->_waitingOnPlaybackToBegin = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeVideoPlayer);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_players, 0);
}

@end
