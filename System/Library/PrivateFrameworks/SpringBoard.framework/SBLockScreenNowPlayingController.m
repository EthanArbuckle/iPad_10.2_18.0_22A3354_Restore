@implementation SBLockScreenNowPlayingController

- (SBLockScreenNowPlayingController)initWithMediaController:(id)a3
{
  id v5;
  SBLockScreenNowPlayingController *v6;
  SBLockScreenNowPlayingController *v7;
  uint64_t v8;
  CSLockScreenSettings *testSettings;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  PTToggleTestRecipe *testRecipe;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBLockScreenNowPlayingController;
  v6 = -[SBLockScreenNowPlayingController init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaController, a3);
    v7->_currentState = 0;
    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v8 = objc_claimAutoreleasedReturnValue();
    testSettings = v7->_testSettings;
    v7->_testSettings = (CSLockScreenSettings *)v8;

    -[CSLockScreenSettings addKeyObserver:](v7->_testSettings, "addKeyObserver:", v7);
    objc_initWeak(&location, v7);
    v10 = (void *)MEMORY[0x1E0D83110];
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__SBLockScreenNowPlayingController_initWithMediaController___block_invoke;
    v17[3] = &unk_1E8EA1F50;
    objc_copyWeak(&v18, &location);
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __60__SBLockScreenNowPlayingController_initWithMediaController___block_invoke_2;
    v15[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v10, "recipeWithTitle:prepareBlock:toggleAction:cleanupBlock:", CFSTR("Show Now Playing"), 0, v17, v15);
    v12 = objc_claimAutoreleasedReturnValue();
    testRecipe = v7->_testRecipe;
    v7->_testRecipe = (PTToggleTestRecipe *)v12;

    objc_msgSend(MEMORY[0x1E0D1BBD8], "registerTestRecipe:", v7->_testRecipe);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __60__SBLockScreenNowPlayingController_initWithMediaController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateNowPlayingPlugin");

}

void __60__SBLockScreenNowPlayingController_initWithMediaController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateNowPlayingPlugin");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CSLockScreenSettings removeKeyObserver:](self->_testSettings, "removeKeyObserver:", self);
  -[PTToggleTestRecipe invalidate](self->_testRecipe, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SBLockScreenNowPlayingController _invalidateDisableTimer](self, "_invalidateDisableTimer");
  v4.receiver = self;
  v4.super_class = (Class)SBLockScreenNowPlayingController;
  -[SBLockScreenNowPlayingController dealloc](&v4, sel_dealloc);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    SBLogLockScreenNowPlaying();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "setEnabled:true", buf, 2u);
      }

      -[SBLockScreenNowPlayingController _addObservers](self, "_addObservers");
      -[SBLockScreenNowPlayingController _updateNowPlayingPlugin](self, "_updateNowPlayingPlugin");
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "setEnabled:false. Removing Now Playing", v7, 2u);
      }

      -[SBLockScreenNowPlayingController _removeObservers](self, "_removeObservers");
      -[SBLockScreenNowPlayingController _invalidateDisableTimer](self, "_invalidateDisableTimer");
      -[SBLockScreenNowPlayingController _updateToState:](self, "_updateToState:", 0);
    }
  }
}

- (BOOL)isNowPlayingActive
{
  return self->_currentState != 0;
}

- (double)_timeoutInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double result;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockScreenDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nowPlayingTimeout");
  v5 = v4;

  result = 480.0;
  if (v5 >= 0.0)
    return v5;
  return result;
}

- (BOOL)_isMediaRecentlyActive
{
  void *v3;
  NSObject *v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SBMediaController lastActivityDate](self->_mediaController, "lastActivityDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogLockScreenNowPlaying();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "timeIntervalSince1970");
    v12 = 134217984;
    v13 = (uint64_t)v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "media last activity date is %{time_t}ld", (uint8_t *)&v12, 0xCu);
  }

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v3);
    v8 = v7;

    -[SBLockScreenNowPlayingController _timeoutInterval](self, "_timeoutInterval");
    v10 = v8 <= v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_addObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateNowPlayingPlugin, CFSTR("SBMediaNowPlayingChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateNowPlayingPlugin, CFSTR("SBMediaNowPlayingAppChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateNowPlayingPlugin, CFSTR("SBMediaApplicationActivityDidBeginNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateNowPlayingPlugin, CFSTR("SBMediaApplicationActivityDidEndNotification"), 0);

}

- (void)_removeObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBMediaNowPlayingChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBMediaNowPlayingAppChangedNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBMediaApplicationActivityDidBeginNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBMediaApplicationActivityDidEndNotification"), 0);

}

- (void)_updateNowPlayingPlugin
{
  NSObject *v3;
  uint64_t v4;
  _BOOL4 v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (-[SBMediaController isPlaying](self->_mediaController, "isPlaying")
    || -[SBMediaController isApplicationActivityActive](self->_mediaController, "isApplicationActivityActive")
    || (-[CSLockScreenSettings showNowPlaying](self->_testSettings, "showNowPlaying") & 1) != 0
    || -[PTToggleTestRecipe isOn](self->_testRecipe, "isOn"))
  {
    SBLogLockScreenNowPlaying();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v4 = 2;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "media is playing. Showing Now Playing.", buf, 2u);
    }
    else
    {
      v4 = 2;
    }
    goto LABEL_8;
  }
  if (!-[SBMediaController isPaused](self->_mediaController, "isPaused")
    || !-[SBLockScreenNowPlayingController _isMediaRecentlyActive](self, "_isMediaRecentlyActive"))
  {
    v5 = -[SBMediaController isPaused](self->_mediaController, "isPaused");
    SBLogLockScreenNowPlaying();
    v3 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v6)
      {
        v10 = 0;
        v7 = "media is paused but NOT recently active. Removing Now Playing.";
        v8 = (uint8_t *)&v10;
LABEL_19:
        _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
    }
    else if (v6)
    {
      v9 = 0;
      v7 = "media is not playing and not paused. Removing Now Playing.";
      v8 = (uint8_t *)&v9;
      goto LABEL_19;
    }
    v4 = 0;
    goto LABEL_8;
  }
  SBLogLockScreenNowPlaying();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "media is paused and recently active. Showing Now Playing and starting disable timer.", v11, 2u);
  }
  v4 = 1;
LABEL_8:

  -[SBLockScreenNowPlayingController _updateToState:](self, "_updateToState:", v4);
}

- (void)_updateToState:(int64_t)a3
{
  id v4;

  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    if (a3 == 1)
      -[SBLockScreenNowPlayingController _startDisableTimer](self, "_startDisableTimer");
    else
      -[SBLockScreenNowPlayingController _invalidateDisableTimer](self, "_invalidateDisableTimer");
    -[SBLockScreenNowPlayingController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nowPlayingController:didChangeToState:", self, self->_currentState);

  }
}

- (void)_startDisableTimer
{
  id v3;
  PCPersistentTimer *v4;
  PCPersistentTimer *disableTimer;
  PCPersistentTimer *v6;
  id v7;

  -[SBLockScreenNowPlayingController _invalidateDisableTimer](self, "_invalidateDisableTimer");
  v3 = objc_alloc(MEMORY[0x1E0D70A38]);
  -[SBLockScreenNowPlayingController _timeoutInterval](self, "_timeoutInterval");
  v4 = (PCPersistentTimer *)objc_msgSend(v3, "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:", CFSTR("com.apple.springboard.nowplaying"), self, sel__disableTimerFired, 0);
  disableTimer = self->_disableTimer;
  self->_disableTimer = v4;

  v6 = self->_disableTimer;
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PCPersistentTimer scheduleInRunLoop:](v6, "scheduleInRunLoop:", v7);

}

- (void)_invalidateDisableTimer
{
  PCPersistentTimer *disableTimer;

  -[PCPersistentTimer invalidate](self->_disableTimer, "invalidate");
  disableTimer = self->_disableTimer;
  self->_disableTimer = 0;

}

- (void)_disableTimerFired
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogLockScreenNowPlaying();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "disable timer fired, removing Now Playing", v4, 2u);
  }

  -[SBLockScreenNowPlayingController _updateToState:](self, "_updateToState:", 0);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (SBLockScreenNowPlayingControllerDelegate)delegate
{
  return (SBLockScreenNowPlayingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_testRecipe, 0);
  objc_storeStrong((id *)&self->_testSettings, 0);
  objc_storeStrong((id *)&self->_disableTimer, 0);
  objc_storeStrong((id *)&self->_mediaController, 0);
}

@end
