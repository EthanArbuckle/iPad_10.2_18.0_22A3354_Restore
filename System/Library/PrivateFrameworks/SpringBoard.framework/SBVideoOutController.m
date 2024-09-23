@implementation SBVideoOutController

+ (id)sharedInstance
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  if ((objc_msgSend(MEMORY[0x1E0D44730], "inUserSessionLoginUI") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)__controllerInstance_0;
    if (!__controllerInstance_0)
    {
      kdebug_trace();
      v5 = objc_alloc_init((Class)a1);
      v6 = (void *)__controllerInstance_0;
      __controllerInstance_0 = (uint64_t)v5;

      kdebug_trace();
      v4 = (void *)__controllerInstance_0;
    }
    v3 = v4;
  }
  return v3;
}

+ (id)sharedInstanceIfExists
{
  return (id)__controllerInstance_0;
}

- (SBVideoOutController)init
{
  SBVideoOutController *v2;
  SBVideoOutController *v3;
  SBDisplayPortObserver *v4;
  SBDisplayPortObserver *displayPortObserver;
  uint64_t v6;
  SBAVSystemControllerCache *avCache;
  void *v8;
  uint64_t v9;
  SBVideoOutController *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  SBVideoOutController *v20;
  id v21;
  _QWORD block[4];
  id v23;
  SBVideoOutController *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SBVideoOutController;
  v2 = -[SBVideoOutController init](&v25, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SBVideoOutController _registerForNotifications](v2, "_registerForNotifications");
    v4 = objc_alloc_init(SBDisplayPortObserver);
    displayPortObserver = v3->_displayPortObserver;
    v3->_displayPortObserver = v4;

    -[SBDisplayPortObserver startMatchingNotifications](v3->_displayPortObserver, "startMatchingNotifications");
    -[SBDisplayPortObserver setDelegate:](v3->_displayPortObserver, "setDelegate:", v3);
    +[SBAVSystemControllerCache sharedInstance](SBAVSystemControllerCache, "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    avCache = v3->_avCache;
    v3->_avCache = (SBAVSystemControllerCache *)v6;

    -[SBAVSystemControllerCache addObserver:](v3->_avCache, "addObserver:", v3);
    objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__SBVideoOutController_init__block_invoke;
    block[3] = &unk_1E8E9E820;
    v23 = v8;
    v10 = v3;
    v24 = v10;
    v11 = v8;
    v12 = (void *)MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], block);
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "statusBarDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v10->_screenSharingSetsBackgroundActivity = objc_msgSend(v14, "suppressStatusBarOverrideForScreenSharing") ^ 1;
    -[SBVideoOutController _updateScreenMirroringObserverWithSuppressionPreferenceFromDefaults:](v10, "_updateScreenMirroringObserverWithSuppressionPreferenceFromDefaults:", v14);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "suppressStatusBarOverrideForScreenSharing");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __28__SBVideoOutController_init__block_invoke_2;
    v19[3] = &unk_1E8E9E820;
    v20 = v10;
    v21 = v14;
    v16 = v14;
    v17 = (id)objc_msgSend(v16, "observeDefault:onQueue:withBlock:", v15, v12, v19);

  }
  return v3;
}

uint64_t __28__SBVideoOutController_init__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "addObserver:", *(_QWORD *)(a1 + 40));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "connectedIdentities", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = *(void **)(a1 + 32);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(v9, "configurationForIdentity:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "displayMonitor:didConnectIdentity:withConfiguration:", v9, v7, v10);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_updateAVRoutes");
}

uint64_t __28__SBVideoOutController_init__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_main_updateScreenSharingBackgroundActivityAssertionSuppressionPreference:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateScreenMirroringObserverWithSuppressionPreferenceFromDefaults:", *(_QWORD *)(a1 + 40));
}

- (void)dealloc
{
  objc_super v3;

  -[SBVideoOutController _unregisterForNotifications](self, "_unregisterForNotifications");
  -[NSTimer invalidate](self->_videoOutBackgroundActivityTimer, "invalidate");
  -[SBSBackgroundActivityAssertion invalidate](self->_videoOutBackgroundActivityAssertion, "invalidate");
  -[NSTimer invalidate](self->_screenSharingBackgroundActivityTimer, "invalidate");
  -[SBSBackgroundActivityAssertion invalidate](self->_screenSharingBackgroundActivityAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBVideoOutController;
  -[SBVideoOutController dealloc](&v3, sel_dealloc);
}

- (BOOL)isScreenSharing
{
  return self->_screenSharingViaAVSystemController || self->_screenSharingViaDisplayMonitor;
}

- (void)_registerForNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  id v5;

  -[SBVideoOutController _unregisterForNotifications](self, "_unregisterForNotifications");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__authenticationStateChanged_, *MEMORY[0x1E0DAA248], 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)SBVideoOutController_DisplayPortAccessoryConnected, CFSTR("DisplayPort30PinAdapterConnected"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)SBVideoOutController_DisplayPortAccessoryConnected, CFSTR("com.apple.HaywireAccessoryAttached"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);

}

- (void)_unregisterForNotifications
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);

}

- (BOOL)_displayMonitorHasAConnectedExternalIdentity
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedIdentities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(id *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isExternal") & 1) != 0)
        {
          v8 = objc_msgSend(v7, "type");

          if (v8 == 1)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
LABEL_12:

  return v4;
}

- (void)_updateAVRoutes
{
  _BOOL4 v3;

  v3 = -[SBAVSystemControllerCache isAirplayDisplayActive](self->_avCache, "isAirplayDisplayActive");
  if (self->_screenSharingViaAVSystemController != v3)
  {
    self->_screenSharingViaAVSystemController = v3;
    -[SBVideoOutController updateScreenSharingBackgroundActivityAssertion](self, "updateScreenSharingBackgroundActivityAssertion");
    -[SBVideoOutController _notifyThatScreenSharingChanged](self, "_notifyThatScreenSharingChanged");
  }
}

- (void)_updateDisplayMonitorState
{
  _BOOL4 v3;

  v3 = -[SBVideoOutController _displayMonitorHasAConnectedExternalIdentity](self, "_displayMonitorHasAConnectedExternalIdentity");
  if (self->_screenSharingViaDisplayMonitor != v3)
  {
    self->_screenSharingViaDisplayMonitor = v3;
    BSDispatchMain();
    -[SBVideoOutController _notifyThatScreenSharingChanged](self, "_notifyThatScreenSharingChanged");
  }
}

uint64_t __50__SBVideoOutController__updateDisplayMonitorState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_updateVideoOutBackgroundActivityAssertion");
}

- (void)_notifyThatScreenSharingChanged
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("SBAirPlayScreenSharingStatusChangedNotificationName"), self, 0);

}

- (void)_authenticationStateChanged:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend((id)SBApp, "authenticationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAuthenticated");

  if (v5)
    -[SBVideoOutController updateScreenSharingBackgroundActivityAssertion](self, "updateScreenSharingBackgroundActivityAssertion");
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v6;

  v6 = a4;
  if (objc_msgSend(v6, "isExternal") && objc_msgSend(v6, "type") == 1)
    -[SBVideoOutController _updateDisplayMonitorState](self, "_updateDisplayMonitorState");

}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  id v5;
  _QWORD block[5];

  v5 = a4;
  if (objc_msgSend(v5, "isExternal") && objc_msgSend(v5, "type") == 1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SBVideoOutController_displayMonitor_willDisconnectIdentity___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __62__SBVideoOutController_displayMonitor_willDisconnectIdentity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplayMonitorState");
}

- (void)cacheDidRebuildAfterServerDeath:(id)a3
{
  -[SBVideoOutController _registerForNotifications](self, "_registerForNotifications", a3);
  -[SBVideoOutController _updateAVRoutes](self, "_updateAVRoutes");
}

- (void)displayPortObserver:(id)a3 connectionStateChanged:(BOOL)a4
{
  BSDispatchMain();
}

uint64_t __67__SBVideoOutController_displayPortObserver_connectionStateChanged___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    return objc_msgSend(v2, "_main_startVideoOutBackgroundActivityAssertion");
  else
    return objc_msgSend(v2, "_main_clearVideoOutBackgroundActivityAssertion");
}

- (void)_main_clearScreenSharingBackgroundActivityAssertion
{
  NSTimer *screenSharingBackgroundActivityTimer;
  void *v4;
  int v5;
  SBSBackgroundActivityAssertion *screenSharingBackgroundActivityAssertion;

  BSDispatchQueueAssertMain();
  -[NSTimer invalidate](self->_screenSharingBackgroundActivityTimer, "invalidate");
  screenSharingBackgroundActivityTimer = self->_screenSharingBackgroundActivityTimer;
  self->_screenSharingBackgroundActivityTimer = 0;

  if (self->_screenSharingBackgroundActivityAssertion)
  {
    if (!-[SBVideoOutController isScreenSharing](self, "isScreenSharing")
      || (objc_msgSend((id)SBApp, "authenticationController"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "isAuthenticated"),
          v4,
          v5))
    {
      -[SBSBackgroundActivityAssertion invalidate](self->_screenSharingBackgroundActivityAssertion, "invalidate");
      screenSharingBackgroundActivityAssertion = self->_screenSharingBackgroundActivityAssertion;
      self->_screenSharingBackgroundActivityAssertion = 0;

    }
  }
}

- (void)updateScreenSharingBackgroundActivityAssertion
{
  BSDispatchMain();
}

uint64_t __70__SBVideoOutController_updateScreenSharingBackgroundActivityAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_updateScreenSharingBackgroundActivityAssertion");
}

- (void)_main_updateScreenSharingBackgroundActivityAssertion
{
  uint64_t v3;
  SBSBackgroundActivityAssertion *v4;
  SBSBackgroundActivityAssertion *screenSharingBackgroundActivityAssertion;
  SBSBackgroundActivityAssertion *v6;
  void *v7;
  NSTimer *v8;
  NSTimer *screenSharingBackgroundActivityTimer;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  BSDispatchQueueAssertMain();
  if (self->_screenSharingViaAVSystemController && self->_screenSharingSetsBackgroundActivity)
  {
    v3 = MEMORY[0x1E0C809B0];
    if (!self->_screenSharingBackgroundActivityAssertion)
    {
      objc_msgSend(MEMORY[0x1E0DAADE8], "assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:", *MEMORY[0x1E0DB0BC0], getpid(), 1, 1);
      v4 = (SBSBackgroundActivityAssertion *)objc_claimAutoreleasedReturnValue();
      screenSharingBackgroundActivityAssertion = self->_screenSharingBackgroundActivityAssertion;
      self->_screenSharingBackgroundActivityAssertion = v4;

      objc_initWeak(&location, self);
      v6 = self->_screenSharingBackgroundActivityAssertion;
      v12[0] = v3;
      v12[1] = 3221225472;
      v12[2] = __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke_19;
      v12[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v13, &location);
      -[SBSBackgroundActivityAssertion acquireWithHandler:invalidationHandler:](v6, "acquireWithHandler:invalidationHandler:", &__block_literal_global_14, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    -[NSTimer invalidate](self->_screenSharingBackgroundActivityTimer, "invalidate");
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0C99E88];
    v10[0] = v3;
    v10[1] = 3221225472;
    v10[2] = __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke_3;
    v10[3] = &unk_1E8E9FA90;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, 30.0);
    v8 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    screenSharingBackgroundActivityTimer = self->_screenSharingBackgroundActivityTimer;
    self->_screenSharingBackgroundActivityTimer = v8;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SBVideoOutController _main_clearScreenSharingBackgroundActivityAssertion](self, "_main_clearScreenSharingBackgroundActivityAssertion");
  }
}

void __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((a2 & 1) == 0)
  {
    SBLogVideoOut();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Failed to acquire screen sharing background activity assertion", v3, 2u);
    }

  }
}

void __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke_19(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v1);
}

void __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_main_clearScreenSharingBackgroundActivityAssertion");

}

void __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v4);

}

void __76__SBVideoOutController__main_updateScreenSharingBackgroundActivityAssertion__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_main_clearScreenSharingBackgroundActivityAssertion");

}

- (void)_main_updateScreenSharingBackgroundActivityAssertionSuppressionPreference:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  v5 = objc_msgSend(v4, "suppressStatusBarOverrideForScreenSharing");

  self->_screenSharingSetsBackgroundActivity = v5 ^ 1;
  if (((v5 ^ 1) & 1) == 0)
    -[SBVideoOutController _main_clearScreenSharingBackgroundActivityAssertion](self, "_main_clearScreenSharingBackgroundActivityAssertion");
  -[SBVideoOutController _updateAVRoutes](self, "_updateAVRoutes");
}

- (void)_updateScreenMirroringObserverWithSuppressionPreferenceFromDefaults:(id)a3
{
  char v4;
  MRScreenMirroringObserver *screenMirroringObserver;
  MRScreenMirroringObserver *v6;
  uint64_t v7;

  v4 = objc_msgSend(a3, "suppressStatusBarOverrideForScreenSharing");
  screenMirroringObserver = self->_screenMirroringObserver;
  if ((v4 & 1) == 0)
  {
    if (screenMirroringObserver)
      return;
    v7 = SBFEffectiveArtworkSubtype();
    if (v7 > 2795)
    {
      if (v7 != 2868 && v7 != 2796)
        return;
    }
    else if (v7 != 2556 && v7 != 2622)
    {
      return;
    }
    objc_msgSend(MEMORY[0x1E0D4C610], "UIControllingObserver");
    v6 = (MRScreenMirroringObserver *)objc_claimAutoreleasedReturnValue();
    screenMirroringObserver = self->_screenMirroringObserver;
    goto LABEL_13;
  }
  if (screenMirroringObserver)
  {
    v6 = 0;
LABEL_13:
    self->_screenMirroringObserver = v6;

  }
}

- (void)_main_clearVideoOutBackgroundActivityAssertion
{
  NSTimer *videoOutBackgroundActivityTimer;
  SBSBackgroundActivityAssertion *videoOutBackgroundActivityAssertion;
  SBSBackgroundActivityAssertion *v5;

  BSDispatchQueueAssertMain();
  -[NSTimer invalidate](self->_videoOutBackgroundActivityTimer, "invalidate");
  videoOutBackgroundActivityTimer = self->_videoOutBackgroundActivityTimer;
  self->_videoOutBackgroundActivityTimer = 0;

  videoOutBackgroundActivityAssertion = self->_videoOutBackgroundActivityAssertion;
  if (videoOutBackgroundActivityAssertion)
  {
    -[SBSBackgroundActivityAssertion invalidate](videoOutBackgroundActivityAssertion, "invalidate");
    v5 = self->_videoOutBackgroundActivityAssertion;
    self->_videoOutBackgroundActivityAssertion = 0;

  }
}

- (void)_main_startVideoOutBackgroundActivityAssertion
{
  NSTimer *videoOutBackgroundActivityTimer;
  uint64_t v4;
  SBSBackgroundActivityAssertion *v5;
  SBSBackgroundActivityAssertion *videoOutBackgroundActivityAssertion;
  SBSBackgroundActivityAssertion *v7;
  void *v8;
  NSTimer *v9;
  NSTimer *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  BSDispatchQueueAssertMain();
  videoOutBackgroundActivityTimer = self->_videoOutBackgroundActivityTimer;
  v4 = MEMORY[0x1E0C809B0];
  if (videoOutBackgroundActivityTimer)
  {
    -[NSTimer invalidate](videoOutBackgroundActivityTimer, "invalidate");
  }
  else if (!self->_videoOutBackgroundActivityAssertion)
  {
    objc_msgSend(MEMORY[0x1E0DAADE8], "assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:", *MEMORY[0x1E0DB0C08], getpid(), 1, 1);
    v5 = (SBSBackgroundActivityAssertion *)objc_claimAutoreleasedReturnValue();
    videoOutBackgroundActivityAssertion = self->_videoOutBackgroundActivityAssertion;
    self->_videoOutBackgroundActivityAssertion = v5;

    objc_initWeak(&location, self);
    v7 = self->_videoOutBackgroundActivityAssertion;
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke_24;
    v13[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v14, &location);
    -[SBSBackgroundActivityAssertion acquireWithHandler:invalidationHandler:](v7, "acquireWithHandler:invalidationHandler:", &__block_literal_global_23, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  objc_initWeak(&location, self);
  v8 = (void *)MEMORY[0x1E0C99E88];
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke_3;
  v11[3] = &unk_1E8E9FA90;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, v11, 10.0);
  v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  v10 = self->_videoOutBackgroundActivityTimer;
  self->_videoOutBackgroundActivityTimer = v9;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if ((a2 & 1) == 0)
  {
    SBLogVideoOut();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Failed to acquire video out background activity assertion", v3, 2u);
    }

  }
}

void __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke_24(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v1);
}

void __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_main_clearVideoOutBackgroundActivityAssertion");

}

void __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  BSDispatchMain();
  objc_destroyWeak(&v4);

}

void __70__SBVideoOutController__main_startVideoOutBackgroundActivityAssertion__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_main_clearVideoOutBackgroundActivityAssertion");

}

- (void)_main_updateVideoOutBackgroundActivityAssertion
{
  BSDispatchQueueAssertMain();
  if (self->_screenSharingViaDisplayMonitor && !self->_screenSharingViaAVSystemController)
    -[SBVideoOutController _main_startVideoOutBackgroundActivityAssertion](self, "_main_startVideoOutBackgroundActivityAssertion");
  else
    -[SBVideoOutController _main_clearVideoOutBackgroundActivityAssertion](self, "_main_clearVideoOutBackgroundActivityAssertion");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayPortObserver, 0);
  objc_storeStrong((id *)&self->_avCache, 0);
  objc_storeStrong((id *)&self->_videoOutBackgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_screenSharingBackgroundActivityAssertion, 0);
  objc_storeStrong((id *)&self->_screenMirroringObserver, 0);
  objc_storeStrong((id *)&self->_videoOutBackgroundActivityTimer, 0);
  objc_storeStrong((id *)&self->_screenSharingBackgroundActivityTimer, 0);
}

uint64_t __SBVideoOutController_DisplayPortAccessoryConnected_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_startVideoOutBackgroundActivityAssertion");
}

@end
