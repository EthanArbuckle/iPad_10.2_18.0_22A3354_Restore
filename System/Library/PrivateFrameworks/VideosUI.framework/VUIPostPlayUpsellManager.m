@implementation VUIPostPlayUpsellManager

- (void)_registerStateMachineHandlers
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  -[VUIPostPlayUpsellManager stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__VUIPostPlayUpsellManager__registerStateMachineHandlers__block_invoke;
  v8[3] = &unk_1E9F9B8C0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Player started Live playback"), v8);

  -[VUIPostPlayUpsellManager stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __57__VUIPostPlayUpsellManager__registerStateMachineHandlers__block_invoke_2;
  v6[3] = &unk_1E9FA2F68;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v5, "registerHandlerForEvent:onState:withBlock:", CFSTR("Anything other than live playback started"), CFSTR("PlayingLiveStream"), v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_30 != -1)
    dispatch_once(&sharedInstance_onceToken_30, &__block_literal_global_132);
  return (id)sharedInstance_instance_6;
}

void __42__VUIPostPlayUpsellManager_sharedInstance__block_invoke()
{
  VUIPostPlayUpsellManager *v0;
  void *v1;

  v0 = objc_alloc_init(VUIPostPlayUpsellManager);
  v1 = (void *)sharedInstance_instance_6;
  sharedInstance_instance_6 = (uint64_t)v0;

}

- (VUIPostPlayUpsellManager)init
{
  VUIPostPlayUpsellManager *v2;
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  TVPStateMachine *stateMachine;
  TVPStateMachine *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VUIPostPlayUpsellManager;
  v2 = -[VUIPostPlayUpsellManager init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__isPlaybackUIBeingShownDidChange_, VUIPlaybackManagerIsPlaybackUIBeingShownDidChange[0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__currentMediaItemWillChange_, *MEMORY[0x1E0DB1E28], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__playbackStateWillChange_, *MEMORY[0x1E0DB1F70], 0);
    v4 = objc_alloc(MEMORY[0x1E0DB1978]);
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "initWithName:initialState:mode:stateChangeHandler:", v6, CFSTR("NotPlayingLiveStream"), 0, 0);
    stateMachine = v2->_stateMachine;
    v2->_stateMachine = (TVPStateMachine *)v7;

    v9 = v2->_stateMachine;
    VUIDefaultLogObject();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPStateMachine setLogObject:](v9, "setLogObject:", v10);

    -[TVPStateMachine setCallsStateChangeHandlerSynchronously:](v2->_stateMachine, "setCallsStateChangeHandlerSynchronously:", 1);
    -[VUIPostPlayUpsellManager _registerStateMachineHandlers](v2, "_registerStateMachineHandlers");
    -[TVPStateMachine setShouldAcceptEvents:](v2->_stateMachine, "setShouldAcceptEvents:", 1);
    v2->_cumulativeLivePlaybacktime = 0.0;

  }
  return v2;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (void)_playbackStateWillChange:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  if (v5 == *MEMORY[0x1E0DB1990])
  {
    objc_msgSend(v12, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DB1F60]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DB1958], "playing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[VUIPostPlayUpsellManager stateMachine](self, "stateMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7 == v8)
      v11 = CFSTR("Player started Live playback");
    else
      v11 = CFSTR("Anything other than live playback started");
    objc_msgSend(v9, "postEvent:withContext:", v11, v4);

  }
  else
  {
    objc_msgSend(v4, "elapsedTime");
    -[VUIPostPlayUpsellManager setElapsedTime:](self, "setElapsedTime:");
  }

}

- (void)_currentMediaItemWillChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  double v16;
  double v17;
  NSObject *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentMediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPlaybackExitUpsellRouterDataSource"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0DB1E18]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    VUIDefaultLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v12;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1D96EE000, v11, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellManager - _currentMediaItemWillChange: %@, reason: %@", (uint8_t *)&v19, 0x16u);

    }
    -[VUIPostPlayUpsellManager elapsedTime](self, "elapsedTime");
    v14 = v13;
    if (-[VUIPostPlayUpsellManager _isFullScreenPlaybackUIShown](self, "_isFullScreenPlaybackUIShown"))
    {
      if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DB1E10]))
      {
        VUIDefaultLogObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D96EE000, v15, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellManager - Defer the processing of this media item upsell", (uint8_t *)&v19, 2u);
        }

        -[VUIPostPlayUpsellManager setDeferredMediaItem:](self, "setDeferredMediaItem:", v6);
        -[VUIPostPlayUpsellManager setDeferredElapsedTime:](self, "setDeferredElapsedTime:", v14);
      }
    }
    else
    {
      -[VUIPostPlayUpsellManager cumulativeLivePlaybacktime](self, "cumulativeLivePlaybacktime");
      if (v16 != 0.0)
      {
        -[VUIPostPlayUpsellManager cumulativeLivePlaybacktime](self, "cumulativeLivePlaybacktime");
        v14 = v17;
        -[VUIPostPlayUpsellManager setCumulativeLivePlaybacktime:](self, "setCumulativeLivePlaybacktime:", 0.0);
      }
      if (v14 >= 0.0)
      {
        -[VUIPostPlayUpsellManager _handleUpsellForMediaItem:elapsedTimeInterval:](self, "_handleUpsellForMediaItem:elapsedTimeInterval:", v6, v14);
      }
      else
      {
        VUIDefaultLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1D96EE000, v18, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellManager - VUIPostPlayUpsellManager: Not triggering upsell because elapsed time is 0", (uint8_t *)&v19, 2u);
        }

      }
      -[VUIPostPlayUpsellManager _reset](self, "_reset");
    }

  }
}

const __CFString *__57__VUIPostPlayUpsellManager__registerStateMachineHandlers__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v5, "playbackDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setLivePlaybackStartDate:", v7);

  return CFSTR("PlayingLiveStream");
}

const __CFString *__57__VUIPostPlayUpsellManager__registerStateMachineHandlers__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = v5;
  objc_msgSend(v7, "playbackDate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        objc_msgSend(WeakRetained, "livePlaybackStartDate"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v10))
  {
    objc_msgSend(v7, "playbackDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "livePlaybackStartDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v14 = v13;

    objc_msgSend(WeakRetained, "cumulativeLivePlaybacktime");
    objc_msgSend(WeakRetained, "setCumulativeLivePlaybacktime:", v14 + v15);
  }
  else
  {
    objc_msgSend(WeakRetained, "setCumulativeLivePlaybacktime:", 0.0);
    VUIDefaultLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "playbackDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "livePlaybackStartDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v17;
      v22 = 2112;
      v23 = v18;
      _os_log_impl(&dword_1D96EE000, v16, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellManager - EventPlayerEventOtherThanLivePlaybackStarted: null Date [player playbackDate] = %@ [self livePlaybackStartDate] == %@", (uint8_t *)&v20, 0x16u);

    }
  }

  return CFSTR("NotPlayingLiveStream");
}

- (BOOL)_isFullScreenPlaybackUIShown
{
  void *v2;
  char v3;

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFullscreenPlaybackUIBeingShown");

  return v3;
}

- (void)_isPlaybackUIBeingShownDidChange:(id)a3
{
  void *v4;
  char v5;

  +[VUIPlaybackManager sharedInstance](VUIPlaybackManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPlaybackUIBeingShown");

  if ((v5 & 1) == 0)
    -[VUIPostPlayUpsellManager _handleDeferredMediaItemUpsellIfNeeded](self, "_handleDeferredMediaItemUpsellIfNeeded");
}

- (void)_handleDeferredMediaItemUpsellIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[VUIPostPlayUpsellManager deferredMediaItem](self, "deferredMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !-[VUIPostPlayUpsellManager _isFullScreenPlaybackUIShown](self, "_isFullScreenPlaybackUIShown"))
  {
    VUIDefaultLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "mediaItemMetadataForProperty:", *MEMORY[0x1E0DB1CC8]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellManager - _handleDeferredMediaItemUpsellIfNeeded: %@", (uint8_t *)&v6, 0xCu);

    }
    -[VUIPostPlayUpsellManager deferredElapsedTime](self, "deferredElapsedTime");
    -[VUIPostPlayUpsellManager _handleUpsellForMediaItem:elapsedTimeInterval:](self, "_handleUpsellForMediaItem:elapsedTimeInterval:", v3);
  }

}

- (void)_handleUpsellForMediaItem:(id)a3 elapsedTimeInterval:(double)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  VUIPostPlayUpsellManager *v10;

  v6 = a3;
  if (v6)
  {
    +[VUIPostPlayUpsellConfig sharedInstance](VUIPostPlayUpsellConfig, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__VUIPostPlayUpsellManager__handleUpsellForMediaItem_elapsedTimeInterval___block_invoke;
    v8[3] = &unk_1E9F9A240;
    v9 = v6;
    v10 = self;
    objc_msgSend(v7, "canShowUpsellForMediaItem:withElapsedTime:completion:", v9, v8, a4);

  }
}

void __74__VUIPostPlayUpsellManager__handleUpsellForMediaItem_elapsedTimeInterval___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  id v4;
  uint8_t buf[16];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaItemMetadataForProperty:", CFSTR("VUIContentMetadataPlaybackExitUpsellRouterDataSource"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "handleRouterDataSourceIfNeeded:", v4);
    objc_msgSend(*(id *)(a1 + 40), "_reset");

  }
  else
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_DEFAULT, "VUIPostPlayUpsellManager - Do not have valid conditions to show upsell", buf, 2u);
    }

  }
}

- (void)_reset
{
  -[VUIPostPlayUpsellManager setDeferredMediaItem:](self, "setDeferredMediaItem:", 0);
  -[VUIPostPlayUpsellManager setDeferredElapsedTime:](self, "setDeferredElapsedTime:", 0.0);
  -[VUIPostPlayUpsellManager setCumulativeLivePlaybacktime:](self, "setCumulativeLivePlaybacktime:", 0.0);
}

- (void)handleRouterDataSourceIfNeeded:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    v3 = a3;
    +[VUIAppReviewManager sharedInstance](VUIAppReviewManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isFeatureEnabled:", &__block_literal_global_22_0);

    +[VideosUI markLastPlaybackEventasUpsellPresented](_TtC8VideosUI8VideosUI, "markLastPlaybackEventasUpsellPresented");
    +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appController");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "appContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIApplicationRouter handleEvent:targetResponder:appContext:routerDataSource:supplementaryData:extraInfo:](VUIApplicationRouter, "handleEvent:targetResponder:appContext:routerDataSource:supplementaryData:extraInfo:", *MEMORY[0x1E0DB18E8], 0, v6, v3, 0, 0);

  }
}

void __59__VUIPostPlayUpsellManager_handleRouterDataSourceIfNeeded___block_invoke(uint64_t a1, int a2)
{
  id v2;

  if (a2)
  {
    +[VUIAppReviewManager sharedInstance](VUIAppReviewManager, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setLastPlaybackEvent:", 2);

  }
}

- (TVPMediaItem)deferredMediaItem
{
  return self->_deferredMediaItem;
}

- (void)setDeferredMediaItem:(id)a3
{
  objc_storeStrong((id *)&self->_deferredMediaItem, a3);
}

- (double)deferredElapsedTime
{
  return self->_deferredElapsedTime;
}

- (void)setDeferredElapsedTime:(double)a3
{
  self->_deferredElapsedTime = a3;
}

- (NSDate)livePlaybackStartDate
{
  return self->_livePlaybackStartDate;
}

- (void)setLivePlaybackStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_livePlaybackStartDate, a3);
}

- (double)cumulativeLivePlaybacktime
{
  return self->_cumulativeLivePlaybacktime;
}

- (void)setCumulativeLivePlaybacktime:(double)a3
{
  self->_cumulativeLivePlaybacktime = a3;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_livePlaybackStartDate, 0);
  objc_storeStrong((id *)&self->_deferredMediaItem, 0);
}

@end
