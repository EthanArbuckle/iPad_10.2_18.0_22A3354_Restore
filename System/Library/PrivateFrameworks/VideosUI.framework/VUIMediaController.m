@implementation VUIMediaController

- (VUIMediaController)init
{
  return -[VUIMediaController initWithName:](self, "initWithName:", CFSTR("generic media controller"));
}

- (VUIMediaController)initWithCoder:(id)a3
{
  return -[VUIMediaController initWithName:](self, "initWithName:", CFSTR("generic media controller"));
}

- (VUIMediaController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[VUIMediaController initWithName:](self, "initWithName:", CFSTR("generic media controller"), a4);
}

- (VUIMediaController)initWithName:(id)a3
{
  id v4;
  VUIMediaController *v5;
  VUIMediaController *v6;
  VUIImageView *v7;
  VUIImageView *proxyImageView;
  uint64_t v9;
  uint64_t v10;
  NSString *name;
  id v12;
  NSString *v13;
  uint64_t v14;
  TVPStateMachine *stateMachine;
  TVPStateMachine *v16;
  void *v17;
  NSObject *v18;
  NSString *v19;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;
  uint8_t buf[4];
  VUIMediaController *v26;
  __int16 v27;
  NSString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)VUIMediaController;
  v5 = -[VUIMediaController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    v5->_playerReadyToBePlayed = 0;
    v5->_shouldAnimateOverlayView = 1;
    v5->_shouldZoomWhenTransitioningToBackground = 1;
    v5->_automaticPlaybackStart = 0;
    v5->_automaticPlaybackStop = 0;
    v5->_playbackEnabled = 1;
    v5->_stopPlayerWhenViewDisappears = 1;
    v5->_shouldPlayAfterAppBecomesActive = 0;
    v5->_clearPreviousImageBeforeLoading = 1;
    v5->_popWhenPlayerStops = 0;
    v5->_restoringAVPlayerController = 0;
    v5->_stopWhenAnotherMediaControllerStarts = 1;
    v5->_imageTransitionInterval = 5.0;
    v5->_imageAnimationDuration = 0.5;
    v5->_overlayViewDisplayDuration = 10.0;
    v5->_imageAnimationOptions = 5243008;
    v5->_playbackStopReason = 2;
    v5->_state = 0;
    v7 = (VUIImageView *)objc_alloc_init(MEMORY[0x1E0DC6A20]);
    proxyImageView = v6->_proxyImageView;
    v6->_proxyImageView = v7;

    -[VUIMediaController _registerForApplicationStateNotifications](v6, "_registerForApplicationStateNotifications");
    objc_initWeak(&location, v6);
    v9 = initWithName__instanceNumber++;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%ld)"), v4, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v10;

    v12 = objc_alloc(MEMORY[0x1E0DB1978]);
    v13 = v6->_name;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __35__VUIMediaController_initWithName___block_invoke;
    v21[3] = &unk_1E9F9BD50;
    objc_copyWeak(&v22, &location);
    v14 = objc_msgSend(v12, "initWithName:initialState:mode:stateChangeHandler:", v13, CFSTR("Not doing anything"), 0, v21);
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = (TVPStateMachine *)v14;

    v16 = v6->_stateMachine;
    VUIDefaultLogObject();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPStateMachine setLogObject:](v16, "setLogObject:", v17);

    -[TVPStateMachine setCallsStateChangeHandlerSynchronously:](v6->_stateMachine, "setCallsStateChangeHandlerSynchronously:", 1);
    -[VUIMediaController _registerStateMachineHandlers](v6, "_registerStateMachineHandlers");
    -[TVPStateMachine setShouldAcceptEvents:](v6->_stateMachine, "setShouldAcceptEvents:", 1);
    VUIDefaultLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v6->_name;
      *(_DWORD *)buf = 138412546;
      v26 = v6;
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "VUIMediaController::finished creating media controller %@ (%@)", buf, 0x16u);
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __35__VUIMediaController_initWithName___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id WeakRetained;

  v11 = (id *)(a1 + 32);
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  WeakRetained = objc_loadWeakRetained(v11);
  objc_msgSend(WeakRetained, "_stateDidChangeFromState:toState:onEvent:context:userInfo:", v16, v15, v14, v13, v12);

}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  VUIMediaController *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[VUIMediaController _cleanUpEverything](self, "_cleanUpEverything");
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIMediaController name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIMediaController::finished cleaning up %@ (%@)", buf, 0x16u);

  }
  v6.receiver = self;
  v6.super_class = (Class)VUIMediaController;
  -[VUIMediaController dealloc](&v6, sel_dealloc);
}

- (BOOL)isPostPlayPiPActive
{
  return 0;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIMediaController;
  -[VUIMediaController viewDidLoad](&v3, sel_viewDidLoad);
  -[VUIMediaController _addProxyImageView](self, "_addProxyImageView");
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  VUIMediaController *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VUIMediaController;
  -[VUIMediaController viewWillDisappear:](&v11, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  if (-[VUIMediaController shouldStopPlayerWhenViewDisappears](self, "shouldStopPlayerWhenViewDisappears"))
  {
    -[VUIMediaController player](self, "player");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_7;
    v5 = (void *)v4;
    -[VUIMediaController player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
    {
LABEL_7:
      -[VUIMediaController setPlaybackEnabled:](self, "setPlaybackEnabled:", 0);
    }
    else
    {
      VUIDefaultLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIMediaController name](self, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v13 = "-[VUIMediaController viewWillDisappear:]";
        v14 = 2048;
        v15 = self;
        v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIMediaController::%s will stop media controller (%p: %@)", buf, 0x20u);

      }
      -[VUIMediaController stop](self, "stop");
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)__PlayerAVPlayerKVOContext == a6)
  {
    -[VUIMediaController _updateAVPlayerViewControllerWithAVPlayerForPlayer:](self, "_updateAVPlayerViewControllerWithAVPlayerForPlayer:", a4);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)VUIMediaController;
    -[VUIMediaController observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)setMediaInfo:(id)a3
{
  id v4;
  VUIMediaInfo *v5;
  VUIMediaInfo *v6;
  VUIMediaInfo *mediaInfo;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    -[VUIMediaController setAutomaticPlaybackStart:](self, "setAutomaticPlaybackStart:", objc_msgSend(v4, "isAutomaticPlaybackStart"));
    -[VUIMediaController setVpafPlaybackStartReason:](self, "setVpafPlaybackStartReason:", objc_msgSend(v10, "playbackStartReason"));
    if (objc_msgSend(v10, "playbackStartReason") == 3)
    {
      -[VUIMediaController setAutomaticPlaybackStop:](self, "setAutomaticPlaybackStop:", objc_msgSend(v10, "isAutomaticPlaybackStop"));
      -[VUIMediaController setVpafPlaybackStopReason:](self, "setVpafPlaybackStopReason:", objc_msgSend(v10, "playbackStopReason"));
    }
    if (-[VUIMediaInfo intent](self->_mediaInfo, "intent") == 1 && !objc_msgSend(v10, "intent"))
    {
      mediaInfo = self->_mediaInfo;
      objc_msgSend(v10, "imageProxies");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaInfo setImageProxies:](mediaInfo, "setImageProxies:", v8);

      objc_msgSend(v10, "imageProxies");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaController _setImageProxies:](self, "_setImageProxies:", v9);

    }
    else
    {
      v5 = (VUIMediaInfo *)objc_msgSend(v10, "copy");
      v6 = self->_mediaInfo;
      self->_mediaInfo = v5;

      -[VUIMediaController _updateMediaInfo](self, "_updateMediaInfo");
    }
    v4 = v10;
  }

}

- (void)play
{
  id v2;

  -[VUIMediaController stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Play"));

}

- (void)pause
{
  id v2;

  -[VUIMediaController stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Pause"));

}

- (void)stop
{
  id v2;

  -[VUIMediaController stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Stop"));

}

- (id)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[VUIMediaController avPlayerViewController](self, "avPlayerViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VUIMediaController;
    -[VUIMediaController preferredFocusEnvironments](&v8, sel_preferredFocusEnvironments);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)coverImage
{
  return 0;
}

- (BOOL)showsVideoControls
{
  return 1;
}

- (void)transitionToForeground:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v4 = a4;
  v5 = a3;
  v11[1] = *MEMORY[0x1E0C80C00];
  -[VUIMediaController stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v7 = CFSTR("Transition to foreground");
  else
    v7 = CFSTR("Transition background");
  v10 = CFSTR("AnimatedKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:withContext:userInfo:", v7, 0, v9);

}

- (void)setState:(int64_t)a3
{
  id v4;

  if (self->_state != a3)
  {
    self->_state = a3;
    -[VUIMediaController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (-[VUIMediaController doesDelegateRespondToStateChange](self, "doesDelegateRespondToStateChange"))
      objc_msgSend(v4, "stateDidChangeForMediaController:", self);

  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[VUIMediaController setDoesDelegateRespondToStateChange:](self, "setDoesDelegateRespondToStateChange:", objc_opt_respondsToSelector() & 1);
    -[VUIMediaController setDoesDelegateRespondToShowStill:](self, "setDoesDelegateRespondToShowStill:", objc_opt_respondsToSelector() & 1);
  }

}

- (void)setPlaybackEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  VUIMediaController *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  self->_playbackEnabled = a3;
  -[VUIMediaController player](self, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v3)
    {
      if (-[VUIMediaController isPlayerReadyToBePlayed](self, "isPlayerReadyToBePlayed"))
      {
        -[VUIMediaController stateMachine](self, "stateMachine");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "postEvent:withContext:userInfo:", CFSTR("Show playback"), 0, 0);

        return;
      }
      VUIDefaultLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIMediaController::player is not ready to play; will start playback when it's ready.",
          buf,
          2u);
      }
      goto LABEL_19;
    }
    -[VUIMediaController player](self, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v10)
    {
      VUIDefaultLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = self;
        _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIMediaController::stopping player for media controller: [%@]", buf, 0xCu);
      }

      -[VUIMediaController stop](self, "stop");
    }
  }
  else
  {
    if (v3)
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIMediaController::playback is enabled but we don't have a player, start reloading.", buf, 2u);
      }

      -[VUIMediaController stateMachine](self, "stateMachine");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject postEvent:](v7, "postEvent:", CFSTR("Replay"));
LABEL_19:

      return;
    }
    -[VUIMediaController playbackLoadingTimer](self, "playbackLoadingTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v14 = v12;
      objc_msgSend(v12, "invalidate");
      -[VUIMediaController setPlaybackLoadingTimer:](self, "setPlaybackLoadingTimer:", 0);
      -[VUIMediaController setPlaybackLoadingStartDate:](self, "setPlaybackLoadingStartDate:", 0);
      v12 = v14;
    }

  }
}

- (void)setShouldZoomWhenTransitioningToBackground:(BOOL)a3
{
  void *v4;

  self->_shouldZoomWhenTransitioningToBackground = a3;
  if (a3)
  {
    -[VUIMediaController avPlayerViewController](self, "avPlayerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[VUIMediaController _updateCurrentPlaybackViewFrameForPlaybackInBackground:animated:](self, "_updateCurrentPlaybackViewFrameForPlaybackInBackground:animated:", -[VUIMediaController isBackgrounded](self, "isBackgrounded"), 1);
  }
}

- (void)_registerForApplicationStateNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleApplicationWillResignActiveNotification_, *MEMORY[0x1E0DC4868], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleApplicationDidEnterBackgroundNotification_, *MEMORY[0x1E0DC4768], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleApplicationDidBecomeActiveNotification_, *MEMORY[0x1E0DC4750], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationWillAddDeactivationReason_, *MEMORY[0x1E0DC5760], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationDidRemoveDeactivationReason_, *MEMORY[0x1E0DC5718], 0);

}

- (void)_handleApplicationWillResignActiveNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[VUIMediaController player](self, "player", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[VUIMediaController player](self, "player");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "playing");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[VUIMediaController player](self, "player");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "state");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DB1958], "loading");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 != v12)
        return;
    }
    if (-[VUIMediaController _shouldPausePlaybackDueToDeactivationReasons](self, "_shouldPausePlaybackDueToDeactivationReasons"))
    {
      -[VUIMediaController setShouldPlayAfterAppBecomesActive:](self, "setShouldPlayAfterAppBecomesActive:", 1);
      -[VUIMediaController pause](self, "pause");
    }
  }
}

- (void)_handleApplicationDidEnterBackgroundNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[VUIMediaController player](self, "player", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[VUIMediaController mediaInfo](self, "mediaInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intent");

    if (!v7)
    {
      -[VUIMediaController setShouldPlayAfterAppBecomesActive:](self, "setShouldPlayAfterAppBecomesActive:", 0);
      -[VUIMediaController stop](self, "stop");
    }
  }
}

- (void)_handleApplicationDidBecomeActiveNotification:(id)a3
{
  uint64_t v4;
  void *v5;
  _BOOL4 v6;

  -[VUIMediaController player](self, "player", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[VUIMediaController shouldPlayAfterAppBecomesActive](self, "shouldPlayAfterAppBecomesActive");

    if (v6)
    {
      -[VUIMediaController setShouldPlayAfterAppBecomesActive:](self, "setShouldPlayAfterAppBecomesActive:", 0);
      -[VUIMediaController play](self, "play");
    }
  }
}

- (BOOL)_shouldPausePlaybackDueToDeactivationReasons
{
  return (-[VUIMediaController deactivationReasons](self, "deactivationReasons") & 0xFFFFEDEB) != 0;
}

- (void)_applicationWillAddDeactivationReason:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5710]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  self->_deactivationReasons |= (1 << v6);
}

- (void)_applicationDidRemoveDeactivationReason:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5710]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  self->_deactivationReasons &= ~(1 << v6);
}

- (void)_registerPlayerNotifications
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DB1F58];
  -[VUIMediaController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__playbackStateChanged_, v3, v4);

  v5 = *MEMORY[0x1E0DB1E48];
  -[VUIMediaController player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handlePlaybackErrorNotification_, v5, v6);

  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__mediaControllerStartedPlayback_, CFSTR("VUIMediaControllerWillStartPlaybackNotification"), 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__mediaControllerStartedPlayback_, CFSTR("VUIMediaControllerDidStartPlaybackNotification"), 0);

}

- (void)_unregisterPlayerNotifications
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DB1F58];
  -[VUIMediaController player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, v3, v4);

  v5 = *MEMORY[0x1E0DB1E48];
  -[VUIMediaController player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, v5, v6);

  objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("VUIMediaControllerWillStartPlaybackNotification"), 0);
  objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("VUIMediaControllerDidStartPlaybackNotification"), 0);
  v7 = *MEMORY[0x1E0DB1E38];
  -[VUIMediaController player](self, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, v7, v8);

}

- (BOOL)_canPause
{
  void *v2;
  double v3;
  BOOL v4;

  -[VUIMediaController player](self, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3 != *MEMORY[0x1E0DB1990];

  return v4;
}

- (void)_updateMediaInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSString *v14;
  NSString *name;
  NSString *v16;
  NSString *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;

  -[VUIMediaController mediaInfo](self, "mediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VUIMediaController overlayViewDisplayDuration](self, "overlayViewDisplayDuration");
    -[VUIMediaController _addOverlayViewAnimatedIfNeeded:dismissAfter:](self, "_addOverlayViewAnimatedIfNeeded:dismissAfter:", 0);
    -[VUIMediaController _addContentViewIfNeeded](self, "_addContentViewIfNeeded");
    -[VUIMediaController mediaInfo](self, "mediaInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvpPlaylist");
    v25 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "currentMediaItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaController titleForLogging](self, "titleForLogging");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        -[VUIMediaController name](self, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "rangeOfString:", v8);
        v12 = v11;

        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[VUIMediaController name](self, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", v10, v12, &stru_1E9FF3598);
          v14 = (NSString *)objc_claimAutoreleasedReturnValue();
          name = self->_name;
          self->_name = v14;

        }
      }
      -[VUIMediaController setTitleForLogging:](self, "setTitleForLogging:", v7);
      -[NSString stringByAppendingString:](self->_name, "stringByAppendingString:", v7);
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v17 = self->_name;
      self->_name = v16;

    }
    if (-[VUIMediaController isRestoringAVPlayerController](self, "isRestoringAVPlayerController"))
    {
      -[VUIMediaController stateMachine](self, "stateMachine");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postEvent:", CFSTR("Restore avPlayerViewController"));
LABEL_19:

      return;
    }
    -[VUIMediaController player](self, "player");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "playlist");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0;
    if (v18)
    {
      if (v25)
        v20 = objc_msgSend(v18, "isEqualToPlaylist:", v25);
    }
    -[VUIMediaController mediaInfo](self, "mediaInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "imageProxies");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      -[VUIMediaController setPlayerReadyToBePlayed:](self, "setPlayerReadyToBePlayed:", 0);
      -[VUIMediaController mediaInfo](self, "mediaInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "intent");

      if (v24 != 1)
      {
        -[VUIMediaController _setImageProxies:](self, "_setImageProxies:", v22);
        -[VUIMediaController _setPlaylist:](self, "_setPlaylist:", v25);
        goto LABEL_18;
      }
      -[VUIMediaController _setPlaylist:](self, "_setPlaylist:", v25);
    }
    -[VUIMediaController _setImageProxies:](self, "_setImageProxies:", v22);
LABEL_18:

    goto LABEL_19;
  }
}

- (void)_setImageProxies:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  objc_msgSend(a3, "firstObject");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[VUIMediaController currentImageProxy](self, "currentImageProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqual:", v20);

    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v20, "loadSynchronouslyIfCached");
      if (-[VUIMediaController clearPreviousImageBeforeLoading](self, "clearPreviousImageBeforeLoading")
        && (-[VUIMediaController mediaInfo](self, "mediaInfo"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v8, "shouldDelayLoadingImage"),
            v8,
            (v9 & 1) == 0))
      {
        v10 = v7 ^ 1u;
        -[VUIMediaController proxyImageView](self, "proxyImageView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setImage:", 0);

        -[VUIMediaController proxyImageView](self, "proxyImageView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setImageProxy:", 0);

      }
      else
      {
        v10 = 1;
      }
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("ImageProxyKey"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("AnimatedKey"));

      -[VUIMediaController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaController mediaInfo](self, "mediaInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "backgroundColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBackgroundColor:", v18);

      -[VUIMediaController stateMachine](self, "stateMachine");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postEvent:withContext:userInfo:", CFSTR("Set image"), 0, v6);

    }
  }
  else
  {
    -[VUIMediaController proxyImageView](self, "proxyImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setImage:", 0);

    -[VUIMediaController proxyImageView](self, "proxyImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setImageProxy:", 0);

    -[VUIMediaController setCurrentImageProxy:](self, "setCurrentImageProxy:", 0);
  }

}

- (void)_setPlaylist:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[VUIMediaController setPlayerReadyToBePlayed:](self, "setPlayerReadyToBePlayed:", 0);
    -[VUIMediaController setPendingPlaylist:](self, "setPendingPlaylist:", 0);
    -[VUIMediaController stateMachine](self, "stateMachine");
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("PlaylistKey");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject postEvent:withContext:userInfo:](v5, "postEvent:withContext:userInfo:", CFSTR("Set playlist"), 0, v6);

  }
  else
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[VUIMediaController _setPlaylist:].cold.1(v5);
  }

}

- (void)_cleanUpEverything
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIMediaController name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIMediaController::cleaning up everything for %@", (uint8_t *)&v7, 0xCu);

  }
  -[VUIMediaController proxyImageView](self, "proxyImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", 0);

  -[VUIMediaController proxyImageView](self, "proxyImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImageProxy:", 0);

  -[VUIMediaController setCurrentImageProxy:](self, "setCurrentImageProxy:", 0);
  -[VUIMediaController _cleanUpEverythingPlaybackRelated](self, "_cleanUpEverythingPlaybackRelated");
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
}

- (void)_cleanUpEverythingPlaybackRelated
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIMediaController name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIMediaController::cleaning up player and playback view controller for %@", (uint8_t *)&v13, 0xCu);

  }
  -[VUIMediaController playbackLoadingTimer](self, "playbackLoadingTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[VUIMediaController setPlaybackLoadingTimer:](self, "setPlaybackLoadingTimer:", 0);
  -[VUIMediaController setPendingPlaylist:](self, "setPendingPlaylist:", 0);
  -[VUIMediaController _unregisterPlayerNotifications](self, "_unregisterPlayerNotifications");
  -[VUIMediaController _removePlaybackViewController](self, "_removePlaybackViewController");
  -[VUIMediaController secondaryVideoView](self, "secondaryVideoView");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[VUIMediaController secondaryVideoView](self, "secondaryVideoView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[VUIMediaController secondaryVideoView](self, "secondaryVideoView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeFromSuperview");

    }
  }
  -[VUIMediaController setSecondaryVideoView:](self, "setSecondaryVideoView:", 0);
  -[VUIMediaController setAvPlayerViewController:](self, "setAvPlayerViewController:", 0);
  -[VUIMediaController setPlaybackContainerController:](self, "setPlaybackContainerController:", 0);
  if (-[VUIMediaController didWeCreatePlayer](self, "didWeCreatePlayer"))
  {
    -[VUIMediaController player](self, "player");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObserver:forKeyPath:", self, CFSTR("avPlayer"));

    -[VUIMediaController player](self, "player");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

  }
  -[VUIMediaController setPlayer:](self, "setPlayer:", 0);
}

- (void)_addOverlayViewAnimatedIfNeeded:(BOOL)a3 dismissAfter:(double)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  _QWORD v19[4];
  id v20;
  double v21;
  _QWORD aBlock[4];
  id v23;
  id v24[2];
  BOOL v25;
  id location;

  v5 = a3;
  -[VUIMediaController mediaInfo](self, "mediaInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overlayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v8, "alpha");
      v11 = v10;
      objc_msgSend(v8, "setAlpha:", 0.0);
      -[VUIMediaController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", v8);

      objc_initWeak(&location, self);
      v13 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke;
      aBlock[3] = &unk_1E9F9BD78;
      v24[1] = *(id *)&a4;
      objc_copyWeak(v24, &location);
      v14 = v8;
      v23 = v14;
      v25 = v5;
      v15 = (void (**)(_QWORD))_Block_copy(aBlock);
      if (v5)
      {
        v16 = (void *)MEMORY[0x1E0DC3F10];
        v19[0] = v13;
        v19[1] = 3221225472;
        v19[2] = __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_3;
        v19[3] = &unk_1E9F9BDA0;
        v20 = v14;
        v21 = v11;
        v17[0] = v13;
        v17[1] = 3221225472;
        v17[2] = __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_4;
        v17[3] = &unk_1E9F98E18;
        v18 = v15;
        objc_msgSend(v16, "animateWithDuration:delay:options:animations:completion:", 5243008, v19, v17, 0.75, 0.0);

      }
      else
      {
        objc_msgSend(v14, "setAlpha:", v11);
        v15[2](v15);
      }

      objc_destroyWeak(v24);
      objc_destroyWeak(&location);
    }
  }

}

void __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke(uint64_t a1)
{
  double v1;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  char v8;

  v1 = *(double *)(a1 + 48);
  if (v1 != 0.0)
  {
    v3 = (void *)MEMORY[0x1E0C99E88];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_2;
    v5[3] = &unk_1E9F9B6E8;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    v6 = *(id *)(a1 + 32);
    v8 = *(_BYTE *)(a1 + 56);
    v4 = (id)objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, v1);

    objc_destroyWeak(&v7);
  }
}

void __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeOverlayView:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

uint64_t __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __67__VUIMediaController__addOverlayViewAnimatedIfNeeded_dismissAfter___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_removeOverlayView:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setAlpha:", 1.0);
    if (v4)
    {
      v7 = (void *)MEMORY[0x1E0DC3F10];
      v8 = MEMORY[0x1E0C809B0];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __50__VUIMediaController__removeOverlayView_animated___block_invoke;
      v11[3] = &unk_1E9F98DF0;
      v12 = v6;
      v9[0] = v8;
      v9[1] = 3221225472;
      v9[2] = __50__VUIMediaController__removeOverlayView_animated___block_invoke_2;
      v9[3] = &unk_1E9F9B4F8;
      v10 = v12;
      objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 5243008, v11, v9, 0.75, 0.0);

    }
    else
    {
      objc_msgSend(v6, "setAlpha:", 0.0);
      objc_msgSend(v6, "removeFromSuperview");
    }
  }

}

uint64_t __50__VUIMediaController__removeOverlayView_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __50__VUIMediaController__removeOverlayView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (void)_swapActiveMedia:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  id *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD aBlock[4];
  id v24;
  BOOL v25;
  id location;

  v5 = a4;
  v8 = a5;
  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke;
  aBlock[3] = &unk_1E9F9A758;
  objc_copyWeak(&v24, &location);
  v25 = a3;
  v10 = _Block_copy(aBlock);
  v11 = v10;
  v12 = (void *)MEMORY[0x1E0DC3F10];
  if (v5)
  {
    -[VUIMediaController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke_134;
    v21[3] = &unk_1E9F98E68;
    v22 = v11;
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke_2;
    v19[3] = &unk_1E9F98E18;
    v20 = v8;
    objc_msgSend(v12, "transitionWithView:duration:options:animations:completion:", v13, 5242880, v21, v19, 0.5);
    v14 = &v22;
    v15 = &v20;

  }
  else
  {
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke_3;
    v16[3] = &unk_1E9F9BDC8;
    v17 = v10;
    v18 = v8;
    objc_msgSend(v12, "performWithoutAnimation:", v16);
    v14 = &v17;
    v15 = &v18;
  }

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(unsigned __int8 *)(a1 + 40);
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134218242;
      v20 = WeakRetained;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) showing background image now.", (uint8_t *)&v19, 0x16u);

    }
    objc_msgSend(WeakRetained, "proxyImageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    objc_msgSend(WeakRetained, "playbackContainerController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 1);

    objc_msgSend(WeakRetained, "mediaInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = objc_msgSend(v10, "showsSecondaryVideoView");

    if ((_DWORD)v9)
    {
      objc_msgSend(WeakRetained, "secondaryVideoView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = 1;
LABEL_10:
      objc_msgSend(v11, "setHidden:", v13);

    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134218242;
      v20 = WeakRetained;
      v21 = 2112;
      v22 = v14;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) showing playback view now.", (uint8_t *)&v19, 0x16u);

    }
    objc_msgSend(WeakRetained, "proxyImageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 1);

    objc_msgSend(WeakRetained, "playbackContainerController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidden:", 0);

    objc_msgSend(WeakRetained, "mediaInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v18, "showsSecondaryVideoView");

    if ((_DWORD)v17)
    {
      objc_msgSend(WeakRetained, "secondaryVideoView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = 0;
      goto LABEL_10;
    }
  }

}

uint64_t __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke_134(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __59__VUIMediaController__swapActiveMedia_animated_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_addContentViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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

  -[VUIMediaController mediaInfo](self, "mediaInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[VUIMediaController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertSubview:atIndex:", v21, 0);

    objc_msgSend(v21, "leadingAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);

    objc_msgSend(v21, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    objc_msgSend(v21, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    objc_msgSend(v21, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

  }
}

- (void)_addProxyImageView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v21;
  void *v22;
  void *v23;
  id v24;

  -[VUIMediaController proxyImageView](self, "proxyImageView");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    -[VUIMediaController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    objc_msgSend(v24, "setFrame:");

    -[VUIMediaController mediaInfo](self, "mediaInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "overlayView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIMediaController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
      objc_msgSend(v6, "insertSubview:belowSubview:", v24, v5);
    else
      objc_msgSend(v6, "addSubview:", v24);

    objc_msgSend(v24, "setHidden:", 1);
    objc_msgSend(v24, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

    objc_msgSend(v24, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    objc_msgSend(v24, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    objc_msgSend(v24, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setActive:", 1);

  }
}

- (void)_removeProxyImageView
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[VUIMediaController proxyImageView](self, "proxyImageView");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[VUIMediaController proxyImageView](self, "proxyImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[VUIMediaController proxyImageView](self, "proxyImageView");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

    }
  }
}

- (void)_delayLoadImage:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIMediaController::delay load image with object %@", (uint8_t *)&v5, 0xCu);
  }

  if (v3)
    objc_msgSend(v3, "load");

}

- (void)_playbackStateChanged:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v18[3];
  _QWORD v19[3];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DB1F60]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIMediaController name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v7;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIMediaController::playback state changed for %@, new state %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v8)
  {
    v18[0] = CFSTR("VUIMediaControllerIsPlayingFullscreenKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIMediaController isFullscreenPlaybackIntent](self, "isFullscreenPlaybackIntent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v18[1] = CFSTR("VUIMediaControllerIsAutomaticPlaybackStartKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VUIMediaController isAutomaticPlaybackStart](self, "isAutomaticPlaybackStart"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    v18[2] = CFSTR("VUIMediaControllerPlaybackStartReasonKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIMediaController vpafPlaybackStartReason](self, "vpafPlaybackStartReason"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("VUIMediaControllerDidStartPlaybackNotification"), self, v12);

    -[VUIMediaController _updateCurrentPlaybackViewFrameForPlaybackInBackground:animated:](self, "_updateCurrentPlaybackViewFrameForPlaybackInBackground:animated:", -[VUIMediaController isBackgrounded](self, "isBackgrounded"), 0);
  }
  -[VUIMediaController stateMachine](self, "stateMachine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("PlaybackStateKey");
  v17 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postEvent:withContext:userInfo:", CFSTR("Player state changed"), 0, v15);

}

- (void)_handlePlaybackErrorNotification:(id)a3
{
  -[VUIMediaController setPlaybackStopReason:](self, "setPlaybackStopReason:", 3);
}

- (void)_mediaControllerStartedPlayback:(id)a3
{
  VUIMediaController *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (VUIMediaController *)objc_claimAutoreleasedReturnValue();
  if (v4 != self)
  {
    -[VUIMediaController player](self, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 != v7)
    {
      if (-[VUIMediaController shouldStopWhenAnotherMediaControllerStarts](self, "shouldStopWhenAnotherMediaControllerStarts"))
      {
        VUIDefaultLogObject();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          -[VUIMediaController name](self, "name");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIMediaController name](v4, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 138412546;
          v12 = v9;
          v13 = 2112;
          v14 = v10;
          _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIMediaController::%@ received stop event because %@ will start playback.", (uint8_t *)&v11, 0x16u);

        }
        -[VUIMediaController setPlaybackStopReason:](self, "setPlaybackStopReason:", 1);
        -[VUIMediaController setAutomaticPlaybackStop:](self, "setAutomaticPlaybackStop:", 1);
        -[VUIMediaController setVpafPlaybackStopReason:](self, "setVpafPlaybackStopReason:", 1);
        -[VUIMediaController stop](self, "stop");
      }
    }
  }

}

- (BOOL)isFullscreenPlaybackIntent
{
  void *v2;
  BOOL v3;

  -[VUIMediaController mediaInfo](self, "mediaInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intent") == 1;

  return v3;
}

- (BOOL)isBackgrounded
{
  return 0;
}

- (BOOL)_shouldIgnorePlaybackStop
{
  void *v3;
  int64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[VUIMediaController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[VUIMediaController doesDelegateRespondToShowStill](self, "doesDelegateRespondToShowStill"))
    goto LABEL_5;
  v4 = -[VUIMediaController playbackStopReason](self, "playbackStopReason");
  if (v4 == 3)
  {
    v5 = 1;
    goto LABEL_9;
  }
  if (v4 != 1
    || (v5 = 1,
        LOBYTE(v11) = 1,
        objc_msgSend(v3, "mediaController:shouldShowStill:afterStoppingForReason:", self, &v11, 1),
        (_BYTE)v11))
  {
LABEL_5:
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v3, "mediaControllerShouldIgnorePlaybackStop:", self);
    else
      v5 = 0;
  }
LABEL_9:
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[VUIMediaController name](self, "name");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("NO");
    if (v5)
      v9 = CFSTR("YES");
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIMediaController::%@ shouldIgnorePlaybackStop = %@", (uint8_t *)&v11, 0x16u);

  }
  return v5;
}

- (CGRect)_playbackContainerViewFrame:(BOOL)a3 hasSecondaryVideoView:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v4 = a4;
  v5 = a3;
  -[VUIMediaController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  if (v5 && v4)
    v15 = v14 + -300.0;
  else
    v15 = v14;
  v16 = v8;
  v17 = v10;
  v18 = v12;
  result.size.height = v15;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)_hasSecondaryView
{
  void *v2;
  BOOL v3;

  -[VUIMediaController secondaryVideoView](self, "secondaryVideoView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_shouldShowSecondaryView
{
  void *v2;
  char v3;

  -[VUIMediaController mediaInfo](self, "mediaInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsSecondaryVideoView");

  return v3;
}

- (CGRect)_secondaryVideoViewFrame:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = a3;
  -[VUIMediaController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[VUIMediaController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;

  v13 = v12 + -300.0;
  if (!v3)
    v13 = v12;
  v14 = v7 + -300.0;
  v15 = 0.0;
  v16 = v10;
  result.size.height = v14;
  result.size.width = v16;
  result.origin.y = v13;
  result.origin.x = v15;
  return result;
}

- (void)_updateCurrentPlaybackViewFrameForPlaybackInBackground:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  BOOL v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  double v36;
  double v37;
  _QWORD aBlock[4];
  id v39[9];
  CGAffineTransform v40;
  BOOL v41;
  id location;
  CGAffineTransform v43;

  v4 = a4;
  v5 = a3;
  -[VUIMediaController avPlayerViewController](self, "avPlayerViewController");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[VUIMediaController shouldZoomWhenTransitioningToBackground](self, "shouldZoomWhenTransitioningToBackground");

    if (v9)
    {
      -[VUIMediaController player](self, "player");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentMediaItemPresentationSize");
      v12 = v11;
      v14 = v13;

      v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v43.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v43.c = v15;
      *(_OWORD *)&v43.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      -[VUIMediaController _playbackContainerViewFrame:hasSecondaryVideoView:](self, "_playbackContainerViewFrame:hasSecondaryVideoView:", v5, -[VUIMediaController _hasSecondaryView](self, "_hasSecondaryView"));
      v20 = v16;
      v21 = v17;
      v22 = v18;
      v23 = v19;
      v25 = v12 == *MEMORY[0x1E0C9D820] && v14 == *(double *)(MEMORY[0x1E0C9D820] + 8) || !v5;
      v36 = v18;
      v37 = v19;
      v26 = *(double *)&v17;
      v27 = *(double *)&v16;
      if (!v25)
      {
        v28 = v12 / v14;
        if (v12 / v14 >= v18 / v19)
        {
          v30 = round(v19);
          v29 = round(v28 * v30);
          v31 = v29 / v18;
        }
        else
        {
          v29 = round(v18);
          v30 = round(v29 / v28);
          v31 = v30 / v19;
        }
        CGAffineTransformMakeScale(&v43, v31, v31);
        v36 = v29;
        v37 = v30;
        v26 = (v23 - v30) * 0.5;
        v27 = (v22 - v29) * 0.5;
      }
      -[VUIMediaController view](self, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "layoutIfNeeded");

      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __86__VUIMediaController__updateCurrentPlaybackViewFrameForPlaybackInBackground_animated___block_invoke;
      aBlock[3] = &unk_1E9F9BDF0;
      objc_copyWeak(v39, &location);
      v39[1] = v20;
      v39[2] = v21;
      v39[3] = *(id *)&v22;
      v39[4] = *(id *)&v23;
      v41 = v5;
      v39[5] = *(id *)&v27;
      v39[6] = *(id *)&v26;
      v39[7] = *(id *)&v36;
      v39[8] = *(id *)&v37;
      v40 = v43;
      v33 = _Block_copy(aBlock);
      v34 = v33;
      if (v4)
      {
        if (v5)
          v35 = 0x10000;
        else
          v35 = 0x20000;
        objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", v35, v33, 0, 0.25, 0.0);
      }
      else
      {
        (*((void (**)(void *))v33 + 2))(v33);
      }

      objc_destroyWeak(v39);
      objc_destroyWeak(&location);
    }
  }
}

void __86__VUIMediaController__updateCurrentPlaybackViewFrameForPlaybackInBackground_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  void *v18;
  _OWORD v19[3];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playbackContainerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  objc_msgSend(WeakRetained, "secondaryVideoView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "_secondaryVideoViewFrame:", *(unsigned __int8 *)(a1 + 152));
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(WeakRetained, "secondaryVideoView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    objc_msgSend(WeakRetained, "avPlayerViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFrame:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  }
  else
  {
    objc_msgSend(WeakRetained, "avPlayerViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_OWORD *)(a1 + 120);
    v19[0] = *(_OWORD *)(a1 + 104);
    v19[1] = v17;
    v19[2] = *(_OWORD *)(a1 + 136);
    objc_msgSend(v16, "setTransform:", v19);
  }

  objc_msgSend(WeakRetained, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutIfNeeded");

}

- (void)_addPlaybackViewControllerForPlayback:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CGAffineTransform v44;

  v3 = a3;
  -[VUIMediaController playbackContainerController](self, "playbackContainerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    -[VUIMediaController addChildViewController:](self, "addChildViewController:", v6);
    -[VUIMediaController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    if (-[VUIMediaController _shouldShowSecondaryView](self, "_shouldShowSecondaryView"))
    {
      -[VUIMediaController _playbackContainerViewFrame:hasSecondaryVideoView:](self, "_playbackContainerViewFrame:hasSecondaryVideoView:", v3, 1);
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend(v6, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

      objc_msgSend(v6, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setClipsToBounds:", 1);

      -[VUIMediaController _secondaryVideoViewFrame:](self, "_secondaryVideoViewFrame:", 1);
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB1988]), "initWithFrame:", v21, v22, v23, v24);
      CGAffineTransformMakeScale(&v44, 1.0, -1.0);
      objc_msgSend(v25, "setTransform:", &v44);
      -[VUIMediaController player](self, "player");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPlayer:", v26);

      objc_msgSend(v25, "setHidden:", 1);
      objc_msgSend(v25, "setVideoGravity:", 1);
      -[VUIMediaController view](self, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "insertSubview:aboveSubview:", v25, v28);

      -[VUIMediaController setSecondaryVideoView:](self, "setSecondaryVideoView:", v25);
    }
    else
    {
      -[VUIMediaController _playbackContainerViewFrame:hasSecondaryVideoView:](self, "_playbackContainerViewFrame:hasSecondaryVideoView:", v3, 0);
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      objc_msgSend(v6, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setFrame:", v30, v32, v34, v36);
    }

    objc_msgSend(v6, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setHidden:", v3);

    objc_msgSend(v6, "didMoveToParentViewController:", self);
    -[VUIMediaController avPlayerViewController](self, "avPlayerViewController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      objc_msgSend(v38, "view");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addChildViewController:", v39);
      -[VUIMediaController mediaInfo](self, "mediaInfo");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "overlayView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (v43)
        objc_msgSend(v41, "insertSubview:belowSubview:", v40, v43);
      else
        objc_msgSend(v41, "addSubview:", v40);
      objc_msgSend(v41, "bounds");
      objc_msgSend(v40, "setFrame:");
      objc_msgSend(v39, "didMoveToParentViewController:", v6);

    }
  }

}

- (void)_removePlaybackViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VUIMediaController *v7;
  void *v8;
  id v9;

  -[VUIMediaController avPlayerViewController](self, "avPlayerViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaController playbackContainerController](self, "playbackContainerController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    objc_msgSend(v9, "willMoveToParentViewController:", 0);
    objc_msgSend(v9, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_msgSend(v9, "removeFromParentViewController");
  }
  -[VUIMediaController playbackContainerController](self, "playbackContainerController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentViewController");
  v7 = (VUIMediaController *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    objc_msgSend(v6, "willMoveToParentViewController:", 0);
    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    objc_msgSend(v6, "removeFromParentViewController");
  }

}

- (void)_updateAVPlayerViewControllerWithAVPlayerForPlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[VUIMediaController avPlayerViewController](self, "avPlayerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __73__VUIMediaController__updateAVPlayerViewControllerWithAVPlayerForPlayer___block_invoke;
      v9[3] = &unk_1E9F99000;
      objc_copyWeak(&v12, &location);
      v10 = v6;
      v11 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], v9);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(v4, "avPlayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPlayer:", v8);

    }
  }

}

void __73__VUIMediaController__updateAVPlayerViewControllerWithAVPlayerForPlayer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    if (v3)
    {
      v5 = WeakRetained;
      objc_msgSend(*(id *)(a1 + 40), "avPlayer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setPlayer:", v4);

      WeakRetained = v5;
    }
  }

}

- (void)_stateDidChangeFromState:(id)a3 toState:(id)a4 onEvent:(id)a5 context:(id)a6 userInfo:(id)a7
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9 && v10)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("Media controller waiting for timeout while paused")))
    {
      VUIDefaultLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[VUIMediaController name](self, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v13;
        _os_log_impl(&dword_1D96EE000, v12, OS_LOG_TYPE_DEFAULT, "VUIMediaController::%@ invalidating waiting for timeout timer in paused state.", (uint8_t *)&v18, 0xCu);

      }
      -[VUIMediaController pauseStateTimeoutTimer](self, "pauseStateTimeoutTimer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "invalidate");

      -[VUIMediaController setPauseStateTimeoutTimer:](self, "setPauseStateTimeoutTimer:", 0);
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("Loading image")))
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("Showing image")))
    {
      -[VUIMediaController playbackLoadingTimer](self, "playbackLoadingTimer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        VUIDefaultLogObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          -[VUIMediaController name](self, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138412546;
          v19 = v17;
          v20 = 2112;
          v21 = v11;
          _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "VUIMediaController::%@ invalidating playlist loading timer. Going to new state: %@", (uint8_t *)&v18, 0x16u);

        }
        objc_msgSend(v15, "invalidate");
        -[VUIMediaController setPlaybackLoadingTimer:](self, "setPlaybackLoadingTimer:", 0);
      }

    }
  }

}

- (void)_registerStateMachineHandlers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id *v33;
  void *v34;
  id *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  id v57;
  id *v58;
  id *v59;
  id *v60;
  id v61;
  id v62;
  void *v63;
  id *v64;
  id *v65;
  id *v66;
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  id v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id *v87;
  id v88;
  _QWORD v89[4];
  id v90;
  _QWORD v91[4];
  id v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  _QWORD v97[4];
  id v98;
  _QWORD v99[4];
  id *v100;
  id v101;
  _QWORD v102[4];
  id v103;
  _QWORD v104[4];
  id v105;
  _QWORD v106[4];
  id v107;
  id v108;
  _QWORD v109[4];
  id *v110;
  id v111;
  _QWORD v112[4];
  id *v113;
  id v114;
  _QWORD v115[4];
  id v116;
  id *v117;
  _QWORD v118[4];
  id v119;
  _QWORD v120[4];
  id v121;
  id v122;
  _QWORD v123[4];
  id v124;
  _QWORD v125[4];
  id v126;
  _QWORD v127[4];
  id v128;
  id v129;
  _QWORD v130[4];
  id v131;
  id v132;
  _QWORD v133[4];
  id v134;
  _QWORD v135[4];
  id v136;
  id v137;
  _QWORD v138[4];
  id v139;
  _QWORD v140[4];
  id v141;
  _QWORD v142[4];
  id v143;
  _QWORD v144[4];
  id v145;
  _QWORD v146[4];
  id v147;
  id v148;
  id v149;
  _QWORD v150[4];
  id *v151;
  id v152;
  _QWORD v153[4];
  id v154;
  _QWORD v155[4];
  id v156;
  _QWORD aBlock[4];
  id v158;
  id location;
  _QWORD v160[3];
  _QWORD v161[2];
  _QWORD v162[4];
  _QWORD v163[4];
  _QWORD v164[4];
  _QWORD v165[2];
  _QWORD v166[7];

  v166[5] = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke;
  aBlock[3] = &unk_1E9F9B3A0;
  objc_copyWeak(&v158, &location);
  v3 = _Block_copy(aBlock);
  v155[0] = MEMORY[0x1E0C809B0];
  v155[1] = 3221225472;
  v155[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2;
  v155[3] = &unk_1E9F99C98;
  objc_copyWeak(&v156, &location);
  v4 = _Block_copy(v155);
  v153[0] = MEMORY[0x1E0C809B0];
  v153[1] = 3221225472;
  v153[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3;
  v153[3] = &unk_1E9F99C98;
  objc_copyWeak(&v154, &location);
  v64 = (id *)_Block_copy(v153);
  v150[0] = MEMORY[0x1E0C809B0];
  v150[1] = 3221225472;
  v150[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4;
  v150[3] = &unk_1E9F9BE18;
  objc_copyWeak(&v152, &location);
  v66 = v3;
  v151 = v66;
  v5 = _Block_copy(v150);
  v146[0] = MEMORY[0x1E0C809B0];
  v146[1] = 3221225472;
  v146[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_147;
  v146[3] = &unk_1E9F9BE40;
  objc_copyWeak(&v149, &location);
  v67 = v4;
  v147 = v67;
  v6 = v5;
  v148 = v6;
  v63 = _Block_copy(v146);
  v144[0] = MEMORY[0x1E0C809B0];
  v144[1] = 3221225472;
  v144[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_149;
  v144[3] = &unk_1E9F9BEB8;
  objc_copyWeak(&v145, &location);
  v7 = _Block_copy(v144);
  v142[0] = MEMORY[0x1E0C809B0];
  v142[1] = 3221225472;
  v142[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_158;
  v142[3] = &unk_1E9F9BF08;
  objc_copyWeak(&v143, &location);
  v8 = _Block_copy(v142);
  v140[0] = MEMORY[0x1E0C809B0];
  v140[1] = 3221225472;
  v140[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_165;
  v140[3] = &unk_1E9F9BF08;
  objc_copyWeak(&v141, &location);
  v65 = (id *)_Block_copy(v140);
  -[VUIMediaController stateMachine](self, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v166[0] = CFSTR("Not doing anything");
  v166[1] = CFSTR("Loading image");
  v166[2] = CFSTR("Showing image");
  v166[3] = CFSTR("Showing playback in foreground");
  v166[4] = CFSTR("Showing playback in background");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v166, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Set image"), v10, &__block_literal_global_39);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v165[0] = CFSTR("Loading playlist");
  v165[1] = CFSTR("Waiting for player to start loading");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v165, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = MEMORY[0x1E0C809B0];
  v138[1] = 3221225472;
  v138[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_170;
  v138[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v139, &location);
  objc_msgSend(v11, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Set image"), v12, v138);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v164[0] = CFSTR("Not doing anything");
  v164[1] = CFSTR("Loading image");
  v164[2] = CFSTR("Showing image");
  v164[3] = CFSTR("Finished playback");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v164, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v135[0] = MEMORY[0x1E0C809B0];
  v135[1] = 3221225472;
  v135[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5;
  v135[3] = &unk_1E9F9B898;
  objc_copyWeak(&v137, &location);
  v15 = v7;
  v136 = v15;
  objc_msgSend(v13, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Load image"), v14, v135);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v133[0] = MEMORY[0x1E0C809B0];
  v133[1] = 3221225472;
  v133[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_172;
  v133[3] = &unk_1E9F9BFC0;
  v17 = v15;
  v134 = v17;
  objc_msgSend(v16, "registerHandlerForEvent:onState:withBlock:", CFSTR("Load image"), CFSTR("Showing playback in foreground"), v133);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v130[0] = MEMORY[0x1E0C809B0];
  v130[1] = 3221225472;
  v130[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_173;
  v130[3] = &unk_1E9F9B898;
  objc_copyWeak(&v132, &location);
  v61 = v17;
  v131 = v61;
  objc_msgSend(v18, "registerHandlerForEvent:onState:withBlock:", CFSTR("Load image"), CFSTR("Showing playback in background"), v130);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = MEMORY[0x1E0C809B0];
  v127[1] = 3221225472;
  v127[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_174;
  v127[3] = &unk_1E9F9B898;
  objc_copyWeak(&v129, &location);
  v20 = v8;
  v128 = v20;
  objc_msgSend(v19, "registerHandlerForEvent:onState:withBlock:", CFSTR("Show image"), CFSTR("Loading image"), v127);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v125[0] = MEMORY[0x1E0C809B0];
  v125[1] = 3221225472;
  v125[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_177;
  v125[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v126, &location);
  objc_msgSend(v21, "registerHandlerForEvent:onState:withBlock:", CFSTR("Show image"), CFSTR("Finished playback"), v125);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v163[0] = CFSTR("Not doing anything");
  v163[1] = CFSTR("Loading playlist");
  v163[2] = CFSTR("Showing playback in foreground");
  v163[3] = CFSTR("Showing playback in background");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v163, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Set playlist"), v23, &__block_literal_global_180);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v123[0] = MEMORY[0x1E0C809B0];
  v123[1] = 3221225472;
  v123[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_181;
  v123[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v124, &location);
  objc_msgSend(v24, "registerHandlerForEvent:onState:withBlock:", CFSTR("Set playlist"), CFSTR("Loading image"), v123);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = MEMORY[0x1E0C809B0];
  v120[1] = 3221225472;
  v120[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_182;
  v120[3] = &unk_1E9F9B898;
  objc_copyWeak(&v122, &location);
  v62 = v20;
  v121 = v62;
  objc_msgSend(v25, "registerHandlerForEvent:onState:withBlock:", CFSTR("Set playlist"), CFSTR("Showing image"), v120);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v162[0] = CFSTR("Not doing anything");
  v162[1] = CFSTR("Showing image");
  v162[2] = CFSTR("Loading image");
  v162[3] = CFSTR("Loading playlist");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v162, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = MEMORY[0x1E0C809B0];
  v118[1] = 3221225472;
  v118[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_183;
  v118[3] = &unk_1E9F9BFC0;
  v28 = v6;
  v119 = v28;
  objc_msgSend(v26, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Load playlist"), v27, v118);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v161[0] = CFSTR("Showing playback in foreground");
  v161[1] = CFSTR("Showing playback in background");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v161, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v115[0] = MEMORY[0x1E0C809B0];
  v115[1] = 3221225472;
  v115[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_8;
  v115[3] = &unk_1E9F9C030;
  v31 = v67;
  v116 = v31;
  v60 = v65;
  v117 = v60;
  objc_msgSend(v29, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Load playlist"), v30, v115);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = MEMORY[0x1E0C809B0];
  v112[1] = 3221225472;
  v112[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_9;
  v112[3] = &unk_1E9F9B898;
  objc_copyWeak(&v114, &location);
  v33 = v66;
  v113 = v33;
  objc_msgSend(v32, "registerHandlerForEvent:onState:withBlock:", CFSTR("Show playback"), CFSTR("Loading playlist"), v112);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = MEMORY[0x1E0C809B0];
  v109[1] = 3221225472;
  v109[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_12;
  v109[3] = &unk_1E9F9B898;
  objc_copyWeak(&v111, &location);
  v35 = v33;
  v110 = v35;
  objc_msgSend(v34, "registerHandlerForEvent:onState:withBlock:", CFSTR("Show playback"), CFSTR("Showing image"), v109);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_15;
  v106[3] = &unk_1E9F9B898;
  objc_copyWeak(&v108, &location);
  v68 = v28;
  v107 = v68;
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Player state changed"), CFSTR("Waiting for player to start loading"), v106);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = MEMORY[0x1E0C809B0];
  v104[1] = 3221225472;
  v104[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_16;
  v104[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v105, &location);
  objc_msgSend(v37, "registerHandlerForEvent:onState:withBlock:", CFSTR("Player state changed"), CFSTR("Loading playlist"), v104);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v160[0] = CFSTR("Media controller waiting for timeout while paused");
  v160[1] = CFSTR("Showing playback in background");
  v160[2] = CFSTR("Showing playback in foreground");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v160, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v102[0] = MEMORY[0x1E0C809B0];
  v102[1] = 3221225472;
  v102[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_186;
  v102[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v103, &location);
  objc_msgSend(v38, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Player state changed"), v39, v102);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_187;
  v99[3] = &unk_1E9F9B898;
  objc_copyWeak(&v101, &location);
  v59 = v64;
  v100 = v59;
  objc_msgSend(v40, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Finished playback"), v99);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_190;
  v97[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v98, &location);
  objc_msgSend(v41, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Playback error occurred"), v97);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 3221225472;
  v95[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_7_192;
  v95[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v96, &location);
  objc_msgSend(v42, "registerHandlerForEvent:onState:withBlock:", CFSTR("Transition to foreground"), CFSTR("Loading image"), v95);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = MEMORY[0x1E0C809B0];
  v93[1] = 3221225472;
  v93[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_8_193;
  v93[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v94, &location);
  objc_msgSend(v43, "registerHandlerForEvent:onState:withBlock:", CFSTR("Transition to foreground"), CFSTR("Showing playback in background"), v93);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = MEMORY[0x1E0C809B0];
  v91[1] = 3221225472;
  v91[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_10_195;
  v91[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v92, &location);
  objc_msgSend(v44, "registerHandlerForEvent:onState:withBlock:", CFSTR("Transition background"), CFSTR("Loading image"), v91);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_11_196;
  v89[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v90, &location);
  objc_msgSend(v45, "registerHandlerForEvent:onState:withBlock:", CFSTR("Transition background"), CFSTR("Showing playback in foreground"), v89);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_13_198;
  v86[3] = &unk_1E9F9B898;
  objc_copyWeak(&v88, &location);
  v58 = v35;
  v87 = v58;
  objc_msgSend(v46, "registerHandlerForEvent:onState:withBlock:", CFSTR("Play"), CFSTR("Showing playback in background"), v86);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_14_199;
  v84[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v85, &location);
  objc_msgSend(v47, "registerHandlerForEvent:onState:withBlock:", CFSTR("Play"), CFSTR("Showing playback in foreground"), v84);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_15_200;
  v82[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v83, &location);
  objc_msgSend(v48, "registerHandlerForEvent:onState:withBlock:", CFSTR("Play"), CFSTR("Media controller waiting for timeout while paused"), v82);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_17_202;
  v80[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v81, &location);
  objc_msgSend(v49, "registerHandlerForEvent:onState:withBlock:", CFSTR("Pause"), CFSTR("Showing playback in background"), v80);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_203;
  v78[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v79, &location);
  objc_msgSend(v50, "registerHandlerForEvent:onState:withBlock:", CFSTR("Pause"), CFSTR("Showing playback in foreground"), v78);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_204;
  v75[3] = &unk_1E9F9B898;
  objc_copyWeak(&v77, &location);
  v57 = v31;
  v76 = v57;
  objc_msgSend(v51, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Stop"), v75);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_205;
  v71[3] = &unk_1E9F9C0A8;
  objc_copyWeak(&v74, &location);
  v53 = v62;
  v72 = v53;
  v54 = v63;
  v73 = v54;
  objc_msgSend(v52, "registerHandlerForEvent:onState:withBlock:", CFSTR("Replay"), CFSTR("Showing image"), v71);

  -[VUIMediaController stateMachine](self, "stateMachine");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = MEMORY[0x1E0C809B0];
  v69[1] = 3221225472;
  v69[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_207;
  v69[3] = &unk_1E9F9BFC0;
  v56 = v68;
  v70 = v56;
  objc_msgSend(v55, "registerHandlerForEvent:onState:withBlock:", CFSTR("Restore avPlayerViewController"), CFSTR("Not doing anything"), v69);

  objc_destroyWeak(&v74);
  objc_destroyWeak(&v77);
  objc_destroyWeak(&v79);
  objc_destroyWeak(&v81);
  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);

  objc_destroyWeak(&v88);
  objc_destroyWeak(&v90);
  objc_destroyWeak(&v92);
  objc_destroyWeak(&v94);
  objc_destroyWeak(&v96);
  objc_destroyWeak(&v98);

  objc_destroyWeak(&v101);
  objc_destroyWeak(&v103);
  objc_destroyWeak(&v105);

  objc_destroyWeak(&v108);
  objc_destroyWeak(&v111);

  objc_destroyWeak(&v114);
  objc_destroyWeak(&v122);
  objc_destroyWeak(&v124);
  objc_destroyWeak(&v126);

  objc_destroyWeak(&v129);
  objc_destroyWeak(&v132);

  objc_destroyWeak(&v137);
  objc_destroyWeak(&v139);

  objc_destroyWeak(&v141);
  objc_destroyWeak(&v143);

  objc_destroyWeak(&v145);
  objc_destroyWeak(&v149);

  objc_destroyWeak(&v152);
  objc_destroyWeak(&v154);

  objc_destroyWeak(&v156);
  objc_destroyWeak(&v158);
  objc_destroyWeak(&location);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAutomaticPlaybackStop:", 0);
  v7[0] = CFSTR("VUIMediaControllerIsPlayingFullscreenKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isFullscreenPlaybackIntent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = CFSTR("VUIMediaControllerIsAutomaticPlaybackStartKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isAutomaticPlaybackStart"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  v7[2] = CFSTR("VUIMediaControllerPlaybackStartReasonKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "vpafPlaybackStartReason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("VUIMediaControllerWillStartPlaybackNotification"), WeakRetained, v5);

}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = CFSTR("VUIMediaControllerIsAutomaticPlaybackStopKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isAutomaticPlaybackStop"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("VUIMediaControllerPlaybackStopReasonKey");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "vpafPlaybackStopReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("VUIMediaControllerWillStopPlaybackNotification"), WeakRetained, v4);

}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = CFSTR("VUIMediaControllerIsAutomaticPlaybackStopKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isAutomaticPlaybackStop"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("VUIMediaControllerPlaybackStopReasonKey");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "vpafPlaybackStopReason"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("VUIMediaControllerDidStopPlaybackNotification"), WeakRetained, v4);

}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4(uint64_t a1, void *a2, char a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString **v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v32 = 138412290;
    v33 = v5;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIMediaController::will create a new playback view controller with playlist:<%@>", (uint8_t *)&v32, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "player");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    VUIDefaultLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIMediaController::creating player because no player was supplied.", (uint8_t *)&v32, 2u);
    }

    v10 = objc_alloc(MEMORY[0x1E0DB1968]);
    objc_msgSend(WeakRetained, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithName:", v11);

    objc_msgSend(WeakRetained, "mediaInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "intent");
    v15 = VUIRTCPlaybackBackground;
    if (v14)
      v15 = VUIRTCPlaybackFullscreen;
    v16 = *v15;

    objc_msgSend(v12, "setReportingValueWithString:forKey:", v16, CFSTR("initiator"));
    objc_msgSend(v12, "setUpdatesMediaRemoteInfoAutomatically:", 0);
    objc_msgSend(WeakRetained, "setPlayer:", v12);
    objc_msgSend(WeakRetained, "setDidWeCreatePlayer:", 1);
    objc_msgSend(WeakRetained, "player");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:forKeyPath:options:context:", WeakRetained, CFSTR("avPlayer"), 0, __PlayerAVPlayerKVOContext);

  }
  if (v5)
  {
    objc_msgSend(WeakRetained, "player");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPlaylist:", v5);

  }
  objc_msgSend(WeakRetained, "setPlaybackStopReason:", 2);
  objc_msgSend(WeakRetained, "_registerPlayerNotifications");
  v19 = (void *)objc_opt_new();
  objc_msgSend(WeakRetained, "setPlaybackContainerController:", v19);

  objc_msgSend(WeakRetained, "mediaInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(WeakRetained, "mediaInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "intent") == 0;

  }
  else
  {
    v22 = 0;
  }

  objc_msgSend(WeakRetained, "avPlayerViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    VUIDefaultLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1D96EE000, v24, OS_LOG_TYPE_DEFAULT, "VUIMediaController::creating avPlayerViewController because none was supplied.", (uint8_t *)&v32, 2u);
    }

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B448]), "initWithNibName:bundle:", 0, 0);
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    objc_msgSend(v26, "setFrame:");

    objc_msgSend(v5, "currentMediaItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1B90]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAllowsPictureInPicturePlayback:", objc_msgSend(v29, "isEqualToString:", *MEMORY[0x1E0DB1DC8]) ^ 1);
    objc_msgSend(WeakRetained, "setAvPlayerViewController:", v25);
    if (objc_msgSend(WeakRetained, "didWeCreatePlayer"))
    {
      objc_msgSend(WeakRetained, "player");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_updateAVPlayerViewControllerWithAVPlayerForPlayer:", v30);

    }
  }
  objc_msgSend(WeakRetained, "_addPlaybackViewControllerForPlayback:", v22);
  if ((a3 & 1) == 0 && v22)
  {
    objc_msgSend(WeakRetained, "player");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "pause");

  }
  if (!v22)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(WeakRetained, "setState:", 3);
  }

}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_147(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v3;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIMediaController::starting to load the playlist:<%@>", (uint8_t *)&v12, 0xCu);
  }

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "player");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_6;
    v7 = (void *)v6;
    objc_msgSend(WeakRetained, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "playlist");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v3);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(WeakRetained, "setPendingPlaylist:", v3);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      objc_msgSend(WeakRetained, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stop");

    }
    else
    {
LABEL_6:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_149(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  id WeakRetained;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(id *, void *, void *, uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;

  v5 = a2;
  v6 = a3;
  objc_initWeak(&location, v5);
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_150;
  v18 = &unk_1E9F9BE90;
  objc_copyWeak(&v20, &location);
  v9 = v6;
  v19 = v9;
  objc_copyWeak(&v21, v7);
  objc_msgSend(v5, "setCompletionHandler:", &v15);
  objc_msgSend(WeakRetained, "setCurrentImageProxy:", v5, v15, v16, v17, v18);
  objc_msgSend(WeakRetained, "mediaInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldDelayLoadingImage");

  objc_msgSend(WeakRetained, "proxyImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = v11;
  else
    v14 = 0;
  if (v14 == 1)
    objc_msgSend(WeakRetained, "performSelector:withObject:afterDelay:", sel__delayLoadImage_, v5, 5.0);
  else
    objc_msgSend(v5, "load");
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_150(id *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id WeakRetained;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD v15[2];
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD aBlock[4];
  id v23;

  v7 = a2;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  VUIDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_150_cold_1((uint64_t)WeakRetained, a4, v10);

  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_151;
  aBlock[3] = &unk_1E9F98E18;
  v23 = a1[4];
  v12 = _Block_copy(aBlock);
  v13 = v12;
  if ((_DWORD)a4)
  {
    objc_msgSend(WeakRetained, "setCompletionHandler:", 0);
    v15[0] = v11;
    v15[1] = 3221225472;
    v16 = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_153;
    v17 = &unk_1E9F997F0;
    objc_copyWeak(&v21, a1 + 6);
    v18 = v8;
    v19 = v7;
    v20 = v13;
    v14 = v15;
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v16((uint64_t)v14);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v14);

    objc_destroyWeak(&v21);
  }
  else
  {
    (*((void (**)(void *, _QWORD))v12 + 2))(v12, 0);
  }

}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_151(uint64_t a1, char a2)
{
  _QWORD v3[2];
  uint64_t (*v4)(uint64_t);
  void *v5;
  id v6;
  char v7;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v4 = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_152;
  v5 = &unk_1E9F9BE68;
  v6 = *(id *)(a1 + 32);
  v7 = a2;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v3[0], 3221225472))
    v4((uint64_t)v3);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_152(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_153(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void (*v5)(void);
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_153_cold_1((uint64_t *)(a1 + 32), v4);

    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_msgSend(WeakRetained, "proxyImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uiImage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v7);

    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v5();

}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_158(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  NSObject *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  void (**v29)(_QWORD);
  id v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_159;
  aBlock[3] = &unk_1E9F99000;
  objc_copyWeak(&v34, (id *)(a1 + 32));
  v6 = v3;
  v32 = v6;
  v33 = WeakRetained;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(WeakRetained, "isBackgrounded"))
  {
    if (objc_msgSend(WeakRetained, "isPlaybackEnabled"))
    {
      objc_msgSend(WeakRetained, "playbackLoadingTimer");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        -[NSObject invalidate](v8, "invalidate");
        objc_msgSend(WeakRetained, "setPlaybackLoadingTimer:", 0);
      }
      if (PlaybackDelayTimeIntervalOverride_onceToken != -1)
        dispatch_once(&PlaybackDelayTimeIntervalOverride_onceToken, &__block_literal_global_504);
      v10 = *(double *)&PlaybackDelayTimeIntervalOverride_playbackDelayInterval;
      +[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "autoPlayConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "autoPlayDelayInterval");
      v14 = v13;

      objc_msgSend(WeakRetained, "mediaInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "playbackDelayInterval");
      v17 = v16;

      if (v14 <= 0.0)
        v18 = v17;
      else
        v18 = v14;
      if (v10 > 0.0)
        v18 = v10;
      if (v18 > 0.0)
        v19 = v18 + -1.0;
      else
        v19 = 0.0;
      if (v19 == 0.0)
      {
        VUIDefaultLogObject();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(WeakRetained, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v36 = WeakRetained;
          v37 = 2112;
          v38 = v26;
          _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) since playback delay interval is 0.0, loading playlist now.", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "setPlaybackLoadingStartDate:", v27);

        v7[2](v7);
      }
      else
      {
        VUIDefaultLogObject();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(WeakRetained, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v36 = WeakRetained;
          v37 = 2112;
          v38 = v21;
          v39 = 2048;
          v40 = v19;
          _os_log_impl(&dword_1D96EE000, v20, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) scheduling a playlist loading timer with interval: (%f)", buf, 0x20u);

        }
        v22 = (void *)MEMORY[0x1E0C99E88];
        v28[0] = v5;
        v28[1] = 3221225472;
        v28[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_163;
        v28[3] = &unk_1E9F9BEE0;
        objc_copyWeak(&v30, (id *)(a1 + 32));
        v29 = v7;
        objc_msgSend(v22, "scheduledTimerWithTimeInterval:repeats:block:", 0, v28, v19);
        v23 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(WeakRetained, "setPlaybackLoadingTimer:", v23);
        objc_destroyWeak(&v30);
        v9 = v23;
      }
    }
    else
    {
      VUIDefaultLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v36 = WeakRetained;
        v37 = 2112;
        v38 = v24;
        _os_log_impl(&dword_1D96EE000, v9, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) playback is not enabled, not setting loading timer.", buf, 0x16u);

      }
    }

  }
  else
  {
    v7[2](v7);
  }

  objc_destroyWeak(&v34);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_159(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "applicationState");

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFullscreenPlaybackUIBeingShown");

  if (v4 || (v6 & 1) != 0)
  {
    VUIDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      VUIBoolLogString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218754;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2048;
      v18 = v4;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) not loading playlist applicationState:<%ld> isFullscreenPlaybackUIBeingShown:<%@>.", (uint8_t *)&v13, 0x2Au);

    }
    goto LABEL_7;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(WeakRetained, "stateMachine");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v21 = CFSTR("PlaylistKey");
    v22[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject postEvent:withContext:userInfo:](v7, "postEvent:withContext:userInfo:", CFSTR("Load playlist"), 0, v9);

LABEL_7:
  }

}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_163(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "isPlaybackEnabled");
    VUIBoolLogString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218498;
    v8 = WeakRetained;
    v9 = 2112;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIMediaController::(%p: %@) loading timer fired, isPlaybackEnabled: (%@)", (uint8_t *)&v7, 0x20u);

  }
  if (objc_msgSend(WeakRetained, "isPlaybackEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPlaybackLoadingStartDate:", v6);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_165(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = a2;
  if (v3)
  {
    v26 = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "player");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playlist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v26, "isEqualToPlaylist:", v6) & 1) == 0)
    {
      objc_msgSend(WeakRetained, "player");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "playlist");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "activeListIndex");

      v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      objc_msgSend(WeakRetained, "player");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "playlist");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v13)
      {
        v14 = 0;
        do
        {
          if (v9 != v14)
            objc_msgSend(v10, "addIndex:", v14);
          ++v14;
          objc_msgSend(WeakRetained, "player");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "playlist");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

        }
        while (v14 < v17);
      }
      objc_msgSend(WeakRetained, "player");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "playlist");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeItemsAtIndexes:", v10);

      objc_msgSend(WeakRetained, "player");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "playlist");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "trackList");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addItems:", v22);

      objc_msgSend(WeakRetained, "player");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "changeMediaInDirection:", 0);

      objc_msgSend(WeakRetained, "player");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "playlist");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "removeItemAtIndex:", 0);

    }
    v3 = v26;
  }

}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_167(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  v6 = a2;
  v7 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_169;
  v15 = &unk_1E9F98FD8;
  v16 = v6;
  v17 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", &v12);
  objc_msgSend(v9, "currentState", v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_169(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Load image"), 0, *(_QWORD *)(a1 + 40));
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_170(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;

  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ImageProxyKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(WeakRetained, "setPendingImageProxy:", v10);
  objc_msgSend(v7, "currentState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

const __CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ImageProxyKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6;
  v18[3] = &unk_1E9F9BF98;
  objc_copyWeak(&v23, (id *)(a1 + 40));
  v14 = v13;
  v19 = v14;
  v22 = *(id *)(a1 + 32);
  v15 = v9;
  v20 = v15;
  v16 = v12;
  v21 = v16;
  objc_msgSend(v15, "executeBlockAfterCurrentStateTransition:", v18);

  objc_destroyWeak(&v23);
  return CFSTR("Loading image");
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "currentImageProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(WeakRetained, "currentImageProxy"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    objc_msgSend(WeakRetained, "currentImageProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      VUIDefaultLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "currentImageProxy");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v19 = v9;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_DEFAULT, "VUIMediaController::cancelling loading of current image proxy: [%@], new image proxy to load: [%@]", buf, 0x16u);

      }
      objc_msgSend(WeakRetained, "currentImageProxy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cancel");

      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", WeakRetained);
      objc_msgSend(WeakRetained, "setCurrentImageProxy:", 0);
    }
  }
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_171;
  v14[3] = &unk_1E9F9BF70;
  objc_copyWeak(&v17, v2);
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(v12 + 16))(v12, v13, v14);

  objc_destroyWeak(&v17);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_171(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "mediaInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageProxies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "currentImageProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (a2 && v8)
    objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Show image"), 0, *(_QWORD *)(a1 + 40));

}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_172(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("ImageProxyKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v7, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_173(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mediaInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intent");

  if (v11 == 1)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ImageProxyKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  objc_msgSend(v7, "currentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

const __CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_174(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id WeakRetained;
  _QWORD v18[4];
  id v19;
  id v20;
  char v21;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v15 = 1;
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setState:", 1);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_175;
  v18[3] = &unk_1E9F9BFE8;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  v21 = v15;
  v19 = *(id *)(a1 + 32);
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v18);

  objc_destroyWeak(&v20);
  return CFSTR("Showing image");
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_175(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_176;
  v5[3] = &unk_1E9F9A060;
  objc_copyWeak(&v7, v2);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "_swapActiveMedia:animated:completion:", 1, v4, v5);

  objc_destroyWeak(&v7);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_176(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_7;
  v2[3] = &unk_1E9F9A060;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pendingPlaylist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIMediaController::we have a pending playlist, starting loading timer.", v5, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(WeakRetained, "setPendingPlaylist:", 0);
  }

}

const __CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_177(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  id *v16;
  id WeakRetained;
  _QWORD v19[4];
  id v20;
  char v21;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v15 = 1;
  }

  v16 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setState:", 1);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_178;
  v19[3] = &unk_1E9F9A758;
  objc_copyWeak(&v20, v16);
  v21 = v15;
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v19);
  objc_destroyWeak(&v20);

  return CFSTR("Showing image");
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_178(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_swapActiveMedia:animated:completion:", 1, *(unsigned __int8 *)(a1 + 40), 0);

}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_179(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6;
  void *v7;

  v6 = a2;
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Load playlist"), 0, a5);
  objc_msgSend(v6, "currentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_181(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;

  v7 = a2;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("PlaylistKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPendingPlaylist:", v8);

  objc_msgSend(v7, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_182(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v7 = a5;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PlaylistKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "mediaInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intent");

  if (v12)
    objc_msgSend(v8, "postEvent:withContext:userInfo:", CFSTR("Load playlist"), 0, v7);
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v8, "currentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

const __CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_183(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a2;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("PlaylistKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_7_184;
  v12[3] = &unk_1E9F99420;
  v9 = *(id *)(a1 + 32);
  v13 = v8;
  v14 = v9;
  v10 = v8;
  objc_msgSend(v7, "executeBlockAfterCurrentStateTransition:", v12);

  return CFSTR("Waiting for player to start loading");
}

uint64_t __51__VUIMediaController__registerStateMachineHandlers__block_invoke_7_184(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("PlaylistKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v7, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  __CFString *v21;
  __CFString *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v15 = 1;
  }

  v16 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "isBackgrounded"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(WeakRetained, "player");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "play");

    objc_msgSend(WeakRetained, "player");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMuted:", 1);

    objc_msgSend(WeakRetained, "setState:", 2);
  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_10;
  v24[3] = &unk_1E9F9C058;
  v20 = v9;
  v25 = v20;
  objc_copyWeak(&v27, v16);
  v26 = WeakRetained;
  objc_msgSend(WeakRetained, "_swapActiveMedia:animated:completion:", 0, v15, v24);
  if (objc_msgSend(WeakRetained, "isBackgrounded"))
    v21 = CFSTR("Showing playback in background");
  else
    v21 = CFSTR("Showing playback in foreground");
  v22 = v21;
  objc_destroyWeak(&v27);

  return v22;
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_10(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_11;
  v5[3] = &unk_1E9F99000;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "executeBlockAfterCurrentStateTransition:", v5);

  objc_destroyWeak(&v8);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_11(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "pendingImageProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7 = CFSTR("ImageProxyKey");
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "pendingImageProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Load image"), 0, v6);

    objc_msgSend(WeakRetained, "setPendingImageProxy:", 0);
  }

}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  __CFString *v21;
  __CFString *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v15 = 1;
  }

  v16 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "isBackgrounded"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(WeakRetained, "player");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "play");

    objc_msgSend(WeakRetained, "player");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setMuted:", 1);

    objc_msgSend(WeakRetained, "setState:", 2);
  }
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_13;
  v27 = &unk_1E9F9B6C0;
  v20 = v9;
  v28 = v20;
  objc_copyWeak(&v29, v16);
  objc_msgSend(WeakRetained, "_swapActiveMedia:animated:completion:", 0, v15, &v24);
  if (objc_msgSend(WeakRetained, "isBackgrounded", v24, v25, v26, v27))
    v21 = CFSTR("Showing playback in background");
  else
    v21 = CFSTR("Showing playback in foreground");
  v22 = v21;
  objc_destroyWeak(&v29);

  return v22;
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_13(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_14;
  v3[3] = &unk_1E9F9A938;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "executeBlockAfterCurrentStateTransition:", v3);

  objc_destroyWeak(&v5);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pendingImageProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v7 = CFSTR("ImageProxyKey");
    objc_msgSend(WeakRetained, "pendingImageProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Load image"), 0, v6);

    objc_msgSend(WeakRetained, "setPendingImageProxy:", 0);
  }

}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_15(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  id WeakRetained;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v7 = a2;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("PlaybackStateKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v7, "currentState");
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DB1958], "loading");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v11)
  {
    objc_msgSend(WeakRetained, "setPlayerReadyToBePlayed:", 0);

    v10 = CFSTR("Loading playlist");
  }
  else if ((objc_msgSend(WeakRetained, "_shouldIgnorePlaybackStop") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v12)
    {
      objc_msgSend(WeakRetained, "pendingPlaylist");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(WeakRetained, "_cleanUpEverythingPlaybackRelated");
        v14 = *(_QWORD *)(a1 + 32);
        objc_msgSend(WeakRetained, "pendingPlaylist");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v14 + 16))(v14, v15, 0);

        objc_msgSend(WeakRetained, "setPendingPlaylist:", 0);
      }
    }
  }

  return v10;
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_16(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  id WeakRetained;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  NSObject *v25;
  dispatch_time_t when;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[16];
  _QWORD block[4];
  id v33;
  id v34;
  const __CFString *v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PlaybackStateKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v9, "currentState");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "paused");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 != v17)
  {
    objc_msgSend(MEMORY[0x1E0DB1958], "playing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == v18)
    {

      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_185;
      v28[3] = &unk_1E9F9A938;
      objc_copyWeak(&v30, v14);
      v29 = v9;
      objc_msgSend(v29, "executeBlockAfterCurrentStateTransition:", v28);

      objc_destroyWeak(&v30);
      v16 = CFSTR("Showing playback in foreground");
    }
    else if ((objc_msgSend(WeakRetained, "_shouldIgnorePlaybackStop") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v19)
      {
        v35 = CFSTR("AnimatedKey");
        v36[0] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "postEvent:withContext:userInfo:", CFSTR("Finished playback"), 0, v20);

      }
    }
    goto LABEL_18;
  }
  if (objc_msgSend(WeakRetained, "isPlaybackEnabled"))
  {
    objc_msgSend(WeakRetained, "playbackLoadingStartDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceDate:", v21);
      v24 = v23;

      objc_msgSend(WeakRetained, "setPlaybackLoadingStartDate:", 0);
      if (objc_msgSend(WeakRetained, "isBackgrounded") && v24 < 1.0)
      {
        when = dispatch_time(0, (uint64_t)((1.0 - v24) * 1000000000.0));
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_17;
        block[3] = &unk_1E9F9A938;
        objc_copyWeak(&v34, v14);
        v33 = v9;
        dispatch_after(when, MEMORY[0x1E0C80D38], block);

        objc_destroyWeak(&v34);
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "isBackgrounded");
    }
    objc_msgSend(v9, "postEvent:withContext:userInfo:", CFSTR("Show playback"), 0, 0);
    goto LABEL_17;
  }
  VUIDefaultLogObject();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D96EE000, v25, OS_LOG_TYPE_DEFAULT, "VUIMediaController::playback is not enabled yet. Will show playback when it gets enabled.", buf, 2u);
  }

LABEL_18:
  return v16;
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_17(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "isPlaybackEnabled");
    VUIBoolLogString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIMediaController::dispatch_after fired in StateLoadingPlaylist, isPlaybackEnabled: (%@)", (uint8_t *)&v5, 0xCu);

  }
  if (objc_msgSend(WeakRetained, "isPlaybackEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Show playback"), 0, 0);

}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_185(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "pendingImageProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v7 = CFSTR("ImageProxyKey");
    objc_msgSend(WeakRetained, "pendingImageProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Load image"), 0, v6);

    objc_msgSend(WeakRetained, "setPendingImageProxy:", 0);
  }

}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_186(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("PlaybackStateKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v11)
  {
    v12 = objc_msgSend(WeakRetained, "_shouldIgnorePlaybackStop");

    if ((v12 & 1) == 0)
    {
      v19 = CFSTR("AnimatedKey");
      v20[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Finished playback"), 0, v17);

      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0DB1958], "paused");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v13)
  {
    v14 = objc_msgSend(WeakRetained, "isBackgrounded");
    v15 = CFSTR("Showing playback in foreground");
    if (v14)
      v15 = CFSTR("Showing playback in background");
    v16 = v15;

    v10 = v16;
  }
LABEL_9:

  return v10;
}

const __CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_187(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_188;
  v16[3] = &unk_1E9F9C080;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  v19 = *(id *)(a1 + 32);
  v13 = v9;
  v17 = v13;
  v14 = v12;
  v18 = v14;
  objc_msgSend(v13, "executeBlockAfterCurrentStateTransition:", v16);

  objc_destroyWeak(&v20);
  return CFSTR("Finished playback");
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_188(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(WeakRetained, "_cleanUpEverythingPlaybackRelated");
  objc_msgSend(WeakRetained, "setPlaybackEnabled:", 0);
  if (objc_msgSend(WeakRetained, "popWhenPlayerStops"))
  {
    objc_msgSend(WeakRetained, "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "navigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

    }
    else
    {
      objc_msgSend(WeakRetained, "mediaInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "intent");

      if (!v7)
        objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Show image"), 0, *(_QWORD *)(a1 + 40));
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Show image"), 0, *(_QWORD *)(a1 + 40));
  }

}

const __CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_190(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "setState:", 1);
  objc_msgSend(WeakRetained, "_cleanUpEverythingPlaybackRelated");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_191;
  v17[3] = &unk_1E9F99000;
  objc_copyWeak(&v20, a1);
  v14 = v9;
  v18 = v14;
  v15 = v12;
  v19 = v15;
  objc_msgSend(v14, "executeBlockAfterCurrentStateTransition:", v17);

  objc_destroyWeak(&v20);
  return CFSTR("Finished playback");
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_191(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "pendingImageProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v7 = CFSTR("ImageProxyKey");
    objc_msgSend(WeakRetained, "pendingImageProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Load image"), 0, v6);

    objc_msgSend(WeakRetained, "setPendingImageProxy:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "postEvent:withContext:userInfo:", CFSTR("Show image"), 0, *(_QWORD *)(a1 + 40));
  }

}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_7_192(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "pendingPlaylist");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v10 = CFSTR("PlaylistKey");
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postEvent:withContext:userInfo:", CFSTR("Load playlist"), 0, v7);

    objc_msgSend(WeakRetained, "setPendingPlaylist:", 0);
    objc_msgSend(v3, "currentState");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("Showing playback in foreground");
  }

  return v8;
}

const __CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_8_193(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  id WeakRetained;
  _QWORD v19[4];
  id v20;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v15 = 1;
  }

  v16 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShowsVideoControls:", 1);
  objc_msgSend(WeakRetained, "_updateCurrentPlaybackViewFrameForPlaybackInBackground:animated:", 0, v15);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_9_194;
  v19[3] = &unk_1E9F99C98;
  objc_copyWeak(&v20, v16);
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v19);
  objc_destroyWeak(&v20);

  return CFSTR("Showing playback in foreground");
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_9_194(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = CFSTR("VUIMediaControllerIsPlayingFullscreenKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isFullscreenPlaybackIntent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("VUIMediaControllerForegroundStateDidChangeNotification"), WeakRetained, v3);

}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_10_195(uint64_t a1, void *a2)
{
  __CFString *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a2, "currentState");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(WeakRetained, "avPlayerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {

      v3 = CFSTR("Showing playback in background");
    }
  }

  return v3;
}

const __CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_11_196(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  id WeakRetained;
  _QWORD v19[4];
  id v20;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AnimatedKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

  }
  else
  {
    v15 = 1;
  }

  v16 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShowsVideoControls:", 0);
  objc_msgSend(WeakRetained, "_updateCurrentPlaybackViewFrameForPlaybackInBackground:animated:", 1, v15);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_12_197;
  v19[3] = &unk_1E9F99C98;
  objc_copyWeak(&v20, v16);
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v19);
  objc_destroyWeak(&v20);

  return CFSTR("Showing playback in background");
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_12_197(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = CFSTR("VUIMediaControllerIsPlayingFullscreenKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isFullscreenPlaybackIntent"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("VUIMediaControllerForegroundStateDidChangeNotification"), WeakRetained, v3);

}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_13_198(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_msgSend(WeakRetained, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "play");

  }
  objc_msgSend(v3, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_14_199(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(WeakRetained, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "play");

  }
  objc_msgSend(v3, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

const __CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_15_200(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_16_201;
  v14[3] = &unk_1E9F99C98;
  objc_copyWeak(&v15, (id *)(a1 + 32));
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v14);
  objc_destroyWeak(&v15);

  return CFSTR("Showing playback in background");
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_16_201(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "playing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
  {
    objc_msgSend(WeakRetained, "player");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "play");

  }
}

const __CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_17_202(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_18;
  v15[3] = &unk_1E9F9A938;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  v13 = v9;
  v16 = v13;
  objc_msgSend(v13, "executeBlockAfterCurrentStateTransition:", v15);

  objc_destroyWeak(&v17);
  return CFSTR("Media controller waiting for timeout while paused");
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_18(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "paused");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    objc_msgSend(WeakRetained, "player");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pause");

    objc_msgSend(WeakRetained, "pauseStateTimeoutTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    objc_msgSend(WeakRetained, "setPauseStateTimeoutTimer:", 0);
    v9 = (void *)MEMORY[0x1E0C99E88];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_19;
    v14 = &unk_1E9F9B738;
    objc_copyWeak(&v16, v2);
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v9, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v11, 480.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPauseStateTimeoutTimer:", v10, v11, v12, v13, v14);

    objc_destroyWeak(&v16);
  }

}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_19(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  VUIDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIMediaController::%@ timedout while waiting in pause state, current state %@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Media controller waiting for timeout while paused"));

  if (v7)
  {
    objc_msgSend(WeakRetained, "setPlaybackStopReason:", 1);
    objc_msgSend(WeakRetained, "setAutomaticPlaybackStop:", 1);
    objc_msgSend(WeakRetained, "setVpafPlaybackStopReason:", 4);
    objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Stop"));
  }

}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_203(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "player");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "paused");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(WeakRetained, "player");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pause");

  }
  objc_msgSend(v3, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_204(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t *v12;
  const __CFString **v13;
  void *v14;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setPendingPlaylist:", 0);
  objc_msgSend(WeakRetained, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v16 = CFSTR("AnimatedKey");
    v17 = MEMORY[0x1E0C9AAB0];
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v17;
    v13 = &v16;
LABEL_6:
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Finished playback"), 0, v10);
    goto LABEL_7;
  }
  objc_msgSend(WeakRetained, "player");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {
    v18 = CFSTR("AnimatedKey");
    v19[0] = MEMORY[0x1E0C9AAB0];
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = v19;
    v13 = &v18;
    goto LABEL_6;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(WeakRetained, "player");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stop");
LABEL_7:

  objc_msgSend(v4, "currentState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

__CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_205(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  __CFString *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "currentState");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "mediaInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tvpPlaylist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(WeakRetained, "isBackgrounded"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {

      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_206;
      v9[3] = &unk_1E9F99420;
      v11 = *(id *)(a1 + 40);
      v10 = v7;
      objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v9);

      v5 = CFSTR("Waiting for player to start loading");
    }
  }

  return v5;
}

uint64_t __51__VUIMediaController__registerStateMachineHandlers__block_invoke_4_206(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

const __CFString *__51__VUIMediaController__registerStateMachineHandlers__block_invoke_5_207(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_208;
  v4[3] = &unk_1E9F98E68;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "executeBlockAfterCurrentStateTransition:", v4);

  return CFSTR("Showing playback in foreground");
}

uint64_t __51__VUIMediaController__registerStateMachineHandlers__block_invoke_6_208(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (TVPAVFPlayback)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (AVPlayerViewController)avPlayerViewController
{
  return self->_avPlayerViewController;
}

- (void)setAvPlayerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avPlayerViewController, a3);
}

- (VUIMediaInfo)mediaInfo
{
  return self->_mediaInfo;
}

- (VUIMediaControllerDelegate)delegate
{
  return (VUIMediaControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)state
{
  return self->_state;
}

- (BOOL)allowsSkipping
{
  return self->_allowsSkipping;
}

- (void)setAllowsSkipping:(BOOL)a3
{
  self->_allowsSkipping = a3;
}

- (BOOL)shouldZoomWhenTransitioningToBackground
{
  return self->_shouldZoomWhenTransitioningToBackground;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isPlaybackEnabled
{
  return self->_playbackEnabled;
}

- (BOOL)shouldStopPlayerWhenViewDisappears
{
  return self->_stopPlayerWhenViewDisappears;
}

- (void)setStopPlayerWhenViewDisappears:(BOOL)a3
{
  self->_stopPlayerWhenViewDisappears = a3;
}

- (BOOL)clearPreviousImageBeforeLoading
{
  return self->_clearPreviousImageBeforeLoading;
}

- (void)setClearPreviousImageBeforeLoading:(BOOL)a3
{
  self->_clearPreviousImageBeforeLoading = a3;
}

- (BOOL)popWhenPlayerStops
{
  return self->_popWhenPlayerStops;
}

- (void)setPopWhenPlayerStops:(BOOL)a3
{
  self->_popWhenPlayerStops = a3;
}

- (BOOL)isRestoringAVPlayerController
{
  return self->_restoringAVPlayerController;
}

- (void)setRestoringAVPlayerController:(BOOL)a3
{
  self->_restoringAVPlayerController = a3;
}

- (BOOL)shouldStopWhenAnotherMediaControllerStarts
{
  return self->_stopWhenAnotherMediaControllerStarts;
}

- (void)setStopWhenAnotherMediaControllerStarts:(BOOL)a3
{
  self->_stopWhenAnotherMediaControllerStarts = a3;
}

- (BOOL)isAutomaticPlaybackStop
{
  return self->_automaticPlaybackStop;
}

- (void)setAutomaticPlaybackStop:(BOOL)a3
{
  self->_automaticPlaybackStop = a3;
}

- (unint64_t)vpafPlaybackStopReason
{
  return self->_vpafPlaybackStopReason;
}

- (void)setVpafPlaybackStopReason:(unint64_t)a3
{
  self->_vpafPlaybackStopReason = a3;
}

- (VUIImageView)proxyImageView
{
  return self->_proxyImageView;
}

- (void)setProxyImageView:(id)a3
{
  objc_storeStrong((id *)&self->_proxyImageView, a3);
}

- (VUIImageProxy)currentImageProxy
{
  return self->_currentImageProxy;
}

- (void)setCurrentImageProxy:(id)a3
{
  objc_storeStrong((id *)&self->_currentImageProxy, a3);
}

- (UIViewController)playbackContainerController
{
  return self->_playbackContainerController;
}

- (void)setPlaybackContainerController:(id)a3
{
  objc_storeStrong((id *)&self->_playbackContainerController, a3);
}

- (NSDate)playbackLoadingStartDate
{
  return self->_playbackLoadingStartDate;
}

- (void)setPlaybackLoadingStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_playbackLoadingStartDate, a3);
}

- (NSTimer)playbackLoadingTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_playbackLoadingTimer);
}

- (void)setPlaybackLoadingTimer:(id)a3
{
  objc_storeWeak((id *)&self->_playbackLoadingTimer, a3);
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (TVPPlaylist)pendingPlaylist
{
  return self->_pendingPlaylist;
}

- (void)setPendingPlaylist:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPlaylist, a3);
}

- (VUIImageProxy)pendingImageProxy
{
  return self->_pendingImageProxy;
}

- (void)setPendingImageProxy:(id)a3
{
  objc_storeStrong((id *)&self->_pendingImageProxy, a3);
}

- (BOOL)isPlayerReadyToBePlayed
{
  return self->_playerReadyToBePlayed;
}

- (void)setPlayerReadyToBePlayed:(BOOL)a3
{
  self->_playerReadyToBePlayed = a3;
}

- (unint64_t)imageAnimationOptions
{
  return self->_imageAnimationOptions;
}

- (void)setImageAnimationOptions:(unint64_t)a3
{
  self->_imageAnimationOptions = a3;
}

- (double)imageAnimationDuration
{
  return self->_imageAnimationDuration;
}

- (void)setImageAnimationDuration:(double)a3
{
  self->_imageAnimationDuration = a3;
}

- (double)imageTransitionInterval
{
  return self->_imageTransitionInterval;
}

- (void)setImageTransitionInterval:(double)a3
{
  self->_imageTransitionInterval = a3;
}

- (BOOL)shouldAnimateOverlayView
{
  return self->_shouldAnimateOverlayView;
}

- (void)setShouldAnimateOverlayView:(BOOL)a3
{
  self->_shouldAnimateOverlayView = a3;
}

- (double)overlayViewDisplayDuration
{
  return self->_overlayViewDisplayDuration;
}

- (void)setOverlayViewDisplayDuration:(double)a3
{
  self->_overlayViewDisplayDuration = a3;
}

- (BOOL)doesDelegateRespondToShowStill
{
  return self->_doesDelegateRespondToShowStill;
}

- (void)setDoesDelegateRespondToShowStill:(BOOL)a3
{
  self->_doesDelegateRespondToShowStill = a3;
}

- (BOOL)doesDelegateRespondToStateChange
{
  return self->_doesDelegateRespondToStateChange;
}

- (void)setDoesDelegateRespondToStateChange:(BOOL)a3
{
  self->_doesDelegateRespondToStateChange = a3;
}

- (int64_t)playbackStopReason
{
  return self->_playbackStopReason;
}

- (void)setPlaybackStopReason:(int64_t)a3
{
  self->_playbackStopReason = a3;
}

- (TVPVideoView)secondaryVideoView
{
  return self->_secondaryVideoView;
}

- (void)setSecondaryVideoView:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryVideoView, a3);
}

- (NSTimer)pauseStateTimeoutTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_pauseStateTimeoutTimer);
}

- (void)setPauseStateTimeoutTimer:(id)a3
{
  objc_storeWeak((id *)&self->_pauseStateTimeoutTimer, a3);
}

- (BOOL)isAutomaticPlaybackStart
{
  return self->_automaticPlaybackStart;
}

- (void)setAutomaticPlaybackStart:(BOOL)a3
{
  self->_automaticPlaybackStart = a3;
}

- (unint64_t)vpafPlaybackStartReason
{
  return self->_vpafPlaybackStartReason;
}

- (void)setVpafPlaybackStartReason:(unint64_t)a3
{
  self->_vpafPlaybackStartReason = a3;
}

- (BOOL)shouldPlayAfterAppBecomesActive
{
  return self->_shouldPlayAfterAppBecomesActive;
}

- (void)setShouldPlayAfterAppBecomesActive:(BOOL)a3
{
  self->_shouldPlayAfterAppBecomesActive = a3;
}

- (BOOL)didWeCreatePlayer
{
  return self->_didWeCreatePlayer;
}

- (void)setDidWeCreatePlayer:(BOOL)a3
{
  self->_didWeCreatePlayer = a3;
}

- (BOOL)observingPictureInPictureActive
{
  return self->_observingPictureInPictureActive;
}

- (void)setObservingPictureInPictureActive:(BOOL)a3
{
  self->_observingPictureInPictureActive = a3;
}

- (NSString)titleForLogging
{
  return self->_titleForLogging;
}

- (void)setTitleForLogging:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1176);
}

- (unint64_t)deactivationReasons
{
  return self->_deactivationReasons;
}

- (void)setDeactivationReasons:(unint64_t)a3
{
  self->_deactivationReasons = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleForLogging, 0);
  objc_destroyWeak((id *)&self->_pauseStateTimeoutTimer);
  objc_storeStrong((id *)&self->_secondaryVideoView, 0);
  objc_storeStrong((id *)&self->_pendingImageProxy, 0);
  objc_storeStrong((id *)&self->_pendingPlaylist, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_destroyWeak((id *)&self->_playbackLoadingTimer);
  objc_storeStrong((id *)&self->_playbackLoadingStartDate, 0);
  objc_storeStrong((id *)&self->_playbackContainerController, 0);
  objc_storeStrong((id *)&self->_currentImageProxy, 0);
  objc_storeStrong((id *)&self->_proxyImageView, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaInfo, 0);
  objc_storeStrong((id *)&self->_avPlayerViewController, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

- (void)_setPlaylist:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIMediaController::no playlist specified.", v1, 2u);
}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_2_150_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  VUIBoolLogString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1D96EE000, a3, OS_LOG_TYPE_ERROR, "VUIMediaController::completed loading image proxy: [%@], finished: [%@]", (uint8_t *)&v6, 0x16u);

}

void __51__VUIMediaController__registerStateMachineHandlers__block_invoke_3_153_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D96EE000, a2, OS_LOG_TYPE_ERROR, "VUIMediaController::failed to load image proxy with error: [%@]", (uint8_t *)&v3, 0xCu);
}

@end
