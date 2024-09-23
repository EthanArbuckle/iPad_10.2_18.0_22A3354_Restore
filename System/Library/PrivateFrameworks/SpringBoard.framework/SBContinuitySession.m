@implementation SBContinuitySession

- (SBContinuitySession)init
{
  void *v2;
  _SBContinuitySessionStateMachine *v3;
  _SBContinuityUIFlusher *v4;
  SBContinuitySessionLaunchEventExecutor *v5;
  void *v6;
  void *v7;
  void *v8;
  SBContinuityScreenshotManager *v9;
  void *v10;
  void *v11;
  SBContinuitySession *v12;
  SBContinuitySessionSystemEventMonitor *v15;

  +[SBContinuityDisplayAuthenticationCoordinator sharedInstance](SBContinuityDisplayAuthenticationCoordinator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(SBContinuitySessionSystemEventMonitor);
  v3 = -[_SBContinuitySessionStateMachine initWithSystemEventMonitor:continuityDisplayAuthenticationCoordinator:]([_SBContinuitySessionStateMachine alloc], "initWithSystemEventMonitor:continuityDisplayAuthenticationCoordinator:", v15, v2);
  v4 = objc_alloc_init(_SBContinuityUIFlusher);
  v5 = objc_alloc_init(SBContinuitySessionLaunchEventExecutor);
  objc_msgSend((id)SBApp, "multiDisplayUserInteractionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBContinuitySessionManager sharedInstance](SBContinuitySessionManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "overridableUserInterfaceStyleProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(SBContinuityScreenshotManager);
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainDisplayLinkController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBContinuitySession initWithAuthenticationCoordinator:stateMachine:buttonActionsFactory:displayLinkController:launchEventExecutor:uiFlusher:multiDisplayUserInteractionCoordinator:userInterfaceStyleProvider:screenshotManager:](self, "initWithAuthenticationCoordinator:stateMachine:buttonActionsFactory:displayLinkController:launchEventExecutor:uiFlusher:multiDisplayUserInteractionCoordinator:userInterfaceStyleProvider:screenshotManager:", v2, v3, 0, v11, v5, v4, v6, v8, v9);

  return v12;
}

- (SBContinuitySession)initWithAuthenticationCoordinator:(id)a3 stateMachine:(id)a4 buttonActionsFactory:(id)a5 displayLinkController:(id)a6 launchEventExecutor:(id)a7 uiFlusher:(id)a8 multiDisplayUserInteractionCoordinator:(id)a9 userInterfaceStyleProvider:(id)a10 screenshotManager:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  SBContinuitySession *v21;
  SBContinuitySession *v22;
  uint64_t v23;
  NSHashTable *observers;
  uint64_t v25;
  NSHashTable *orientationObservers;
  SBUIContinuitySessionAppearanceSettings *v27;
  SBUIContinuitySessionAppearanceSettings *appearanceSettings;
  uint64_t v29;
  NSHashTable *screenRecordingObservers;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[8];
  objc_super v48;

  v17 = a3;
  v41 = a4;
  v18 = a4;
  v46 = a5;
  v39 = a6;
  v45 = a6;
  v44 = a7;
  v40 = a8;
  v43 = a8;
  v19 = a9;
  v42 = a10;
  v20 = a11;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authenticationCoordinator"));

    if (v18)
    {
LABEL_3:
      if (v19)
        goto LABEL_4;
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("multiDisplayUserInteractionCoordinator"));

      if (v20)
        goto LABEL_5;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stateMachine"));

  if (!v19)
    goto LABEL_12;
LABEL_4:
  if (v20)
    goto LABEL_5;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("screenshotManager"));

LABEL_5:
  v48.receiver = self;
  v48.super_class = (Class)SBContinuitySession;
  v21 = -[SBContinuitySession init](&v48, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_authenticationCoordinator, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v23 = objc_claimAutoreleasedReturnValue();
    observers = v22->_observers;
    v22->_observers = (NSHashTable *)v23;

    objc_storeStrong((id *)&v22->_buttonActionsFactory, a5);
    objc_storeStrong((id *)&v22->_displayLinkController, v39);
    objc_storeStrong((id *)&v22->_launchEventExecutor, a7);
    objc_storeStrong((id *)&v22->_uiFlusher, v40);
    objc_storeStrong((id *)&v22->_multiDisplayUserInteractionCoordinator, a9);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v25 = objc_claimAutoreleasedReturnValue();
    orientationObservers = v22->_orientationObservers;
    v22->_orientationObservers = (NSHashTable *)v25;

    objc_storeStrong((id *)&v22->_userInterfaceStyleProvider, a10);
    v27 = (SBUIContinuitySessionAppearanceSettings *)objc_alloc_init(MEMORY[0x1E0DAC5C0]);
    appearanceSettings = v22->_appearanceSettings;
    v22->_appearanceSettings = v27;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v29 = objc_claimAutoreleasedReturnValue();
    screenRecordingObservers = v22->_screenRecordingObservers;
    v22->_screenRecordingObservers = (NSHashTable *)v29;

    objc_storeStrong((id *)&v22->_screenshotManager, a11);
    -[SBContinuityScreenshotManager setSceneManagerProvider:](v22->_screenshotManager, "setSceneManagerProvider:", v22);
    SBLogContinuitySession();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v31, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_SESSION", (const char *)&unk_1D0E9B6CB, buf, 2u);
    }

    objc_storeStrong((id *)&v22->_stateMachine, v41);
    -[_SBContinuitySessionStateMachine setDelegate:](v22->_stateMachine, "setDelegate:", v22);
    -[_SBContinuitySessionStateMachine setClientExternallyBlockedReasonsProvider:](v22->_stateMachine, "setClientExternallyBlockedReasonsProvider:", v22);
    -[SBContinuitySession continuitySessionStateMachineDidUpdateState:oldState:](v22, "continuitySessionStateMachineDidUpdateState:oldState:", v22->_stateMachine, 0);
  }

  return v22;
}

- (id)_newContinuityButtonActionsForWindowScene:(id)a3
{
  SBContinuityButtonActionsFactory *buttonActionsFactory;
  SBContinuityButtonActions *v5;
  SBContinuityButtonActions *v6;

  buttonActionsFactory = self->_buttonActionsFactory;
  if (buttonActionsFactory)
    v5 = (SBContinuityButtonActions *)-[SBContinuityButtonActionsFactory newButtonActionsForWindowScene:](buttonActionsFactory, "newButtonActionsForWindowScene:", a3);
  else
    v5 = -[SBContinuityButtonActions initWithWindowScene:debugName:]([SBContinuityButtonActions alloc], "initWithWindowScene:debugName:", a3, CFSTR("Continuity"));
  v6 = v5;

  return v6;
}

- (void)addStateObserver:(id)a3
{
  if (a3)
    -[NSHashTable addObject:](self->_observers, "addObject:");
}

- (void)removeStateObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (unint64_t)state
{
  return -[_SBContinuitySessionStateMachine state](self->_stateMachine, "state");
}

- (NSSet)reasons
{
  return -[_SBContinuitySessionStateMachine reasons](self->_stateMachine, "reasons");
}

- (void)setDisplayLayoutPublisher:(id)a3
{
  SBContinuityDisplayLayoutPublisher *v5;
  SBContinuityDisplayLayoutPublisher *displayLayoutPublisher;
  void *v7;

  v5 = (SBContinuityDisplayLayoutPublisher *)a3;
  if (self->_displayLayoutPublisher)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 172, CFSTR("Already tracking a display layout publisher"));

  }
  displayLayoutPublisher = self->_displayLayoutPublisher;
  self->_displayLayoutPublisher = v5;

}

- (SBContinuityDisplayLayoutPublisher)displayLayoutPublisher
{
  return self->_displayLayoutPublisher;
}

- (BOOL)isActivelyScreenRecording
{
  return !self->_clientAdoptedScreenCaptureNotifications || self->_isBeingScreenRecorded;
}

- (void)addScreenRecordingObserver:(id)a3
{
  if (a3)
    -[NSHashTable addObject:](self->_screenRecordingObservers, "addObject:");
}

- (void)removeScreenRecordingObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_screenRecordingObservers, "removeObject:");
}

- (void)addOrientationObserver:(id)a3
{
  void *v4;
  BOOL v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v4 = v6;
  if (v6)
  {
    v5 = -[NSHashTable containsObject:](self->_orientationObservers, "containsObject:", v6);
    v4 = v6;
    if (!v5)
    {
      -[NSHashTable addObject:](self->_orientationObservers, "addObject:", v6);
      v4 = v6;
    }
  }

}

- (void)removeOrientationObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v4 = v5;
  if (v5)
  {
    -[NSHashTable removeObject:](self->_orientationObservers, "removeObject:", v5);
    v4 = v5;
  }

}

- (void)setInterfaceOrientation:(int64_t)a3 supportedInterfaceOrientations:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (*(_OWORD *)&self->_currentInterfaceOrientation != __PAIR128__(a4, a3))
  {
    self->_currentInterfaceOrientation = a3;
    self->_currentSupportedInterfaceOrientation = a4;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSHashTable allObjects](self->_orientationObservers, "allObjects", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "continuitySession:didUpdateInterfaceOrientation:supportedInterfaceOrientations:", self, self->_currentInterfaceOrientation, self->_currentSupportedInterfaceOrientation);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)isSceneConnected
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v3 = WeakRetained != 0;

  return v3;
}

- (void)noteSceneConnected:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sceneIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 242, CFSTR("Already tracking a window scene: <%p>:%@"), WeakRetained, v10);

  }
  SBLogContinuitySession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_sceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v12 = v5;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Session] scene connected: <%p>:%{public}@", buf, 0x16u);

  }
  objc_storeWeak((id *)&self->_windowScene, v5);
  -[_SBContinuitySessionStateMachine noteSceneConnected](self->_stateMachine, "noteSceneConnected");

}

- (void)noteSceneDisconnected:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if (WeakRetained != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sceneIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 253, CFSTR("scene disconnected: <%p>:%@ is not the one i'm tracking: <%p>:%@"), v5, v11, WeakRetained, v12);

  }
  SBLogContinuitySession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_sceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v14 = v5;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Session] scene disconnected: <%p>:%{public}@", buf, 0x16u);

  }
  objc_storeWeak((id *)&self->_windowScene, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("terminal.scene-disconnected"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuitySession _invalidateForReasons:](self, "_invalidateForReasons:", v9);

}

- (BOOL)isMainSceneConnected
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  v3 = WeakRetained != 0;

  return v3;
}

- (SBWindowScene)mainWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
}

- (void)noteMainSceneConnected:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sceneIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 274, CFSTR("Already tracking a main window scene: <%p>:%@"), WeakRetained, v10);

  }
  SBLogContinuitySession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_sceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v12 = v5;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Session] main scene connected: <%p>:%{public}@", buf, 0x16u);

  }
  objc_storeWeak((id *)&self->_mainSBWindowScene, v5);
  -[_SBContinuitySessionStateMachine noteMainSceneConnected](self->_stateMachine, "noteMainSceneConnected");

}

- (void)noteUIIsReady:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  if (WeakRetained != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sceneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 285, CFSTR("UI is ready for scene: <%p>:%@ is not the one i'm tracking: <%p>:%@"), v5, v10, WeakRetained, v11);

  }
  SBLogContinuitySession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_sceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v13 = v5;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Session] ui is ready: <%p>:%{public}@", buf, 0x16u);

  }
  -[_SBContinuitySessionStateMachine noteUIIsReady](self->_stateMachine, "noteUIIsReady");

}

- (void)noteSceneHasValidDisplayUUID:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *displayHardwareIdentifier;
  NSObject *v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  if (WeakRetained != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sceneIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 295, CFSTR("main scene is reporting valid displayUUID: <%p>:%@ is not the one i'm tracking: <%p>:%@"), v5, v17, WeakRetained, v18);

  }
  objc_msgSend(v5, "_FBSScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hardwareIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSString *)objc_msgSend(v10, "copy");
  displayHardwareIdentifier = self->_displayHardwareIdentifier;
  self->_displayHardwareIdentifier = v11;

  if (!self->_displayHardwareIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 299, CFSTR("_displayHardwareIdentifier is nil"));

  }
  SBLogContinuitySession();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_sceneIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = self->_displayHardwareIdentifier;
    *(_DWORD *)buf = 134218498;
    v21 = v5;
    v22 = 2114;
    v23 = v14;
    v24 = 2114;
    v25 = v15;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[Session] main scene <%p>:%{public}@ has valid displayUUID: %{public}@", buf, 0x20u);

  }
  -[_SBContinuitySessionStateMachine noteSceneHasValidDisplayUUID](self->_stateMachine, "noteSceneHasValidDisplayUUID");

}

- (void)noteMainSceneDisconnected:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  if (WeakRetained != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sceneIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 309, CFSTR("Main scene disconnected: <%p>:%@ is not the one i'm tracking: <%p>:%@"), v5, v11, WeakRetained, v12);

  }
  SBLogContinuitySession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_sceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v14 = v5;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Session] main scene disconnected: <%p>:%{public}@", buf, 0x16u);

  }
  objc_storeWeak((id *)&self->_mainSBWindowScene, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("terminal.scene-disconnected"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuitySession _invalidateForReasons:](self, "_invalidateForReasons:", v9);

}

- (void)noteSystemApertureSceneConnected:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureScene);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sceneIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 323, CFSTR("Already tracking a system aperture window scene: <%p>:%@"), WeakRetained, v10);

  }
  SBLogContinuitySession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_sceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v12 = v5;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Session] system aperture scene connected: <%p>:%{public}@", buf, 0x16u);

  }
  objc_storeWeak((id *)&self->_systemApertureScene, v5);
  -[_SBContinuitySessionStateMachine noteSystemApertureSceneConnected](self->_stateMachine, "noteSystemApertureSceneConnected");

}

- (void)noteSystemApertureUIIsReady:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureScene);
  if (WeakRetained != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sceneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 334, CFSTR("UI is ready for system aperture scene: <%p>:%@ is not the one i'm tracking: <%p>:%@"), v5, v10, WeakRetained, v11);

  }
  SBLogContinuitySession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_sceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v13 = v5;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Session] system aperture ui is ready: <%p>:%{public}@", buf, 0x16u);

  }
  -[_SBContinuitySessionStateMachine noteSystemApertureUIIsReady](self->_stateMachine, "noteSystemApertureUIIsReady");

}

- (void)noteSystemApertureSceneDisconnected:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureScene);
  if (WeakRetained != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sceneIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 344, CFSTR("System aperture scene disconnected: <%p>:%@ is not the one i'm tracking: <%p>:%@"), v5, v11, WeakRetained, v12);

  }
  SBLogContinuitySession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_sceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v14 = v5;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Session] system aperture scene disconnected: <%p>:%{public}@", buf, 0x16u);

  }
  objc_storeWeak((id *)&self->_systemApertureScene, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("terminal.scene-disconnected"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuitySession _invalidateForReasons:](self, "_invalidateForReasons:", v9);

}

- (void)noteSystemApertureCurtainSceneConnected:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureCurtainScene);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sceneIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 357, CFSTR("Already tracking a system aperture curtain window scene: <%p>:%@"), WeakRetained, v10);

  }
  SBLogContinuitySession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_sceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v12 = v5;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Session] system aperture curtain scene connected: <%p>:%{public}@", buf, 0x16u);

  }
  objc_storeWeak((id *)&self->_systemApertureCurtainScene, v5);
  -[_SBContinuitySessionStateMachine noteSystemApertureCurtainSceneConnected](self->_stateMachine, "noteSystemApertureCurtainSceneConnected");

}

- (void)noteSystemApertureCurtainUIIsReady:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureCurtainScene);
  if (WeakRetained != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sceneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 368, CFSTR("UI is ready for system aperture curtain scene: <%p>:%@ is not the one i'm tracking: <%p>:%@"), v5, v10, WeakRetained, v11);

  }
  SBLogContinuitySession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_sceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v13 = v5;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Session] system aperture curtain ui is ready: <%p>:%{public}@", buf, 0x16u);

  }
  -[_SBContinuitySessionStateMachine noteSystemApertureCurtainUIIsReady](self->_stateMachine, "noteSystemApertureCurtainUIIsReady");

}

- (void)noteSystemApertureCurtainSceneDisconnected:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_systemApertureCurtainScene);
  if (WeakRetained != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sceneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_sceneIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 378, CFSTR("System aperture curtain scene disconnected: <%p>:%@ is not the one i'm tracking: <%p>:%@"), v5, v11, WeakRetained, v12);

  }
  SBLogContinuitySession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "_sceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v14 = v5;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Session] system aperture curtain scene disconnected: <%p>:%{public}@", buf, 0x16u);

  }
  objc_storeWeak((id *)&self->_systemApertureCurtainScene, 0);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("terminal.scene-disconnected"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBContinuitySession _invalidateForReasons:](self, "_invalidateForReasons:", v9);

}

- (id)clientExternallyBlockedReasons
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[_SBContinuitySessionServiceClient externallyBlockedReasons](self->_continuitySessionServiceClient, "externallyBlockedReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("block.session.client-connected"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (void)continuitySessionServiceClientConnected:(id)a3
{
  _SBContinuitySessionServiceClient *v4;
  void *v5;
  _SBContinuitySessionServiceClient *continuitySessionServiceClient;
  _SBContinuitySessionServiceClient *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (_SBContinuitySessionServiceClient *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[_SBContinuitySessionServiceClient externallyBlockedReasons](v4, "externallyBlockedReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  continuitySessionServiceClient = self->_continuitySessionServiceClient;
  self->_continuitySessionServiceClient = v4;
  v7 = v4;

  SBLogContinuitySession();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[Session] client connected with initial blocked reasons: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  -[_SBContinuitySessionStateMachine noteClientConnectedWithInitialExternallyBlockedReasons:](self->_stateMachine, "noteClientConnectedWithInitialExternallyBlockedReasons:", v5);
}

- (void)continuitySessionServiceClient:(id)a3 handleLaunchEventOfType:(id)a4 payload:(id)a5
{
  id v7;
  id v8;
  SBContinuitySessionLaunchEvent *v9;
  NSObject *v10;
  SBContinuitySessionLaunchEventExecutor *launchEventExecutor;
  SBContinuitySessionLaunchEvent *v12;
  NSObject *v13;
  SBContinuitySessionLaunchEvent *pendingLaunchEvent;
  NSObject *v15;
  _SBContinuitySessionStateMachine *stateMachine;
  void *v17;
  _SBContinuitySessionStateMachine *v18;
  void *v19;
  _QWORD v20[4];
  SBContinuitySessionLaunchEvent *v21;
  uint8_t buf[4];
  SBContinuitySessionLaunchEvent *v23;
  __int16 v24;
  SBContinuitySessionLaunchEvent *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v9 = -[SBContinuitySessionLaunchEvent initWithType:payload:]([SBContinuitySessionLaunchEvent alloc], "initWithType:payload:", v8, v7);

  if (-[SBContinuitySession state](self, "state") == 10)
  {
    SBLogContinuitySession();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[Session] received a launch event %{public}@ and we are .active so handling it now", buf, 0xCu);
    }

    launchEventExecutor = self->_launchEventExecutor;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __86__SBContinuitySession_continuitySessionServiceClient_handleLaunchEventOfType_payload___block_invoke;
    v20[3] = &unk_1E8E9DED8;
    v21 = v9;
    -[SBContinuitySessionLaunchEventExecutor executeLaunchEvent:animatedly:completion:](launchEventExecutor, "executeLaunchEvent:animatedly:completion:", v21, 1, v20);
    v12 = v21;
  }
  else
  {
    if (self->_pendingLaunchEvent)
    {
      SBLogContinuitySession();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        pendingLaunchEvent = self->_pendingLaunchEvent;
        *(_DWORD *)buf = 138543618;
        v23 = v9;
        v24 = 2114;
        v25 = pendingLaunchEvent;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[Session] received a launch event %{public}@ but we already have one pended %{public}@, dropping pended event in favor of latest launch event", buf, 0x16u);
      }

    }
    SBLogContinuitySession();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v9;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "[Session] received a launch event %{public}@ but we aren't in the .active state so saving it for when the time is right", buf, 0xCu);
    }

    v12 = self->_pendingLaunchEvent;
    objc_storeStrong((id *)&self->_pendingLaunchEvent, v9);
    stateMachine = self->_stateMachine;
    -[SBContinuitySessionLaunchEvent identifier](v9, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SBContinuitySessionStateMachine didReceiveLaunchEvent:](stateMachine, "didReceiveLaunchEvent:", v17);

    if (v12)
    {
      v18 = self->_stateMachine;
      -[SBContinuitySessionLaunchEvent identifier](v12, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SBContinuitySessionStateMachine didHandleLaunchEvent:](v18, "didHandleLaunchEvent:", v19);

    }
  }

}

void __86__SBContinuitySession_continuitySessionServiceClient_handleLaunchEventOfType_payload___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBLogContinuitySession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[Session] finished handling launch event %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)continuitySessionServiceClient:(id)a3 handleContinuityButtonEvent:(unint64_t)a4
{
  _SBContinuitySessionServiceClient *v7;
  _SBContinuitySessionServiceClient *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = (_SBContinuitySessionServiceClient *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v8 = self->_continuitySessionServiceClient;

  if (v8 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSBUIContinuityButtonEventType();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 434, CFSTR("client asking me to handle button event %@ is not the one i'm tracking: %@"), v12, v8);

  }
  SBLogContinuitySession();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSBUIContinuityButtonEventType();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v10;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[Session] client sent button event: %{public}@", buf, 0xCu);

  }
  -[SBContinuitySession _handleContinuityButtonEvent:](self, "_handleContinuityButtonEvent:", a4);

}

- (void)continuitySessionServiceClient:(id)a3 setHostedInterfaceOrientation:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  int v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogContinuitySession();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a4;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[Session] client updated hosted interface orientation: %ld", (uint8_t *)&v8, 0xCu);
  }

  -[SBContinuitySession orientationDelegate](self, "orientationDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "continuitySession:didUpdateHostedInterfaceOrientation:", self, a4);

}

- (void)continuitySessionServiceClientDidUpdateExternallyBlockedReasons:(id)a3
{
  _SBContinuitySessionServiceClient *v5;
  _SBContinuitySessionServiceClient *v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[16];

  v5 = (_SBContinuitySessionServiceClient *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v6 = self->_continuitySessionServiceClient;

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 449, CFSTR("client updating externally blocked reasons is not the one i'm tracking: %@"), v6);

  }
  SBLogContinuitySession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Session] client updated externally blocked reasons", buf, 2u);
  }

  -[_SBContinuitySessionStateMachine noteClientDidUpdateExternallyBlockedReasons](self->_stateMachine, "noteClientDidUpdateExternallyBlockedReasons");
}

- (void)continuitySessionServiceClientDidConfigureHIDServices:(id)a3
{
  _SBContinuitySessionServiceClient *v5;
  _SBContinuitySessionServiceClient *v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[16];

  v5 = (_SBContinuitySessionServiceClient *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v6 = self->_continuitySessionServiceClient;

  if (v6 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 458, CFSTR("client that configured HID services is not the one i'm tracking: %@"), v6);

  }
  SBLogContinuitySession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[Session] client configured HID services", buf, 2u);
  }

  -[_SBContinuitySessionStateMachine noteClientConfiguredHIDServices](self->_stateMachine, "noteClientConfiguredHIDServices");
}

- (void)continuitySessionServiceClient:(id)a3 updatedAppearanceSettings:(id)a4 transitionContext:(id)a5 completion:(id)a6
{
  _SBContinuitySessionServiceClient *v11;
  id v12;
  id v13;
  void (**v14)(id, uint64_t, _QWORD);
  _SBContinuitySessionServiceClient *v15;
  NSObject *v16;
  SBUIContinuitySessionAppearanceSettings *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  SBOverridableUserInterfaceStyleProvider *userInterfaceStyleProvider;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  void (**v26)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = (_SBContinuitySessionServiceClient *)a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, uint64_t, _QWORD))a6;
  v15 = self->_continuitySessionServiceClient;
  if (v15 != v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 466, CFSTR("client that updated appearance settings is not the one i'm tracking: %@"), v15);

  }
  SBLogContinuitySession();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v28 = v12;
    v29 = 2114;
    v30 = v13;
    _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "[Session] updated appearance settings %{public}@ with transitionContext %{public}@", buf, 0x16u);
  }

  v17 = self->_appearanceSettings;
  objc_storeStrong((id *)&self->_appearanceSettings, a4);
  v18 = -[SBUIContinuitySessionAppearanceSettings userInterfaceStyle](v17, "userInterfaceStyle");
  v19 = objc_msgSend(v12, "userInterfaceStyle");
  SBLogContinuitySession();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v18 == v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "[Session] updated appearance setting - no updates necessary", buf, 2u);
    }

    v14[2](v14, 1, 0);
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[SBContinuitySession continuitySessionServiceClient:updatedAppearanceSettings:transitionContext:completion:].cold.1(v21);

    userInterfaceStyleProvider = self->_userInterfaceStyleProvider;
    v23 = objc_msgSend(v12, "userInterfaceStyle");
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __109__SBContinuitySession_continuitySessionServiceClient_updatedAppearanceSettings_transitionContext_completion___block_invoke;
    v25[3] = &unk_1E8E9E8D0;
    v26 = v14;
    -[SBOverridableUserInterfaceStyleProvider setOverrideStyle:completion:](userInterfaceStyleProvider, "setOverrideStyle:completion:", v23, v25);

  }
}

uint64_t __109__SBContinuitySession_continuitySessionServiceClient_updatedAppearanceSettings_transitionContext_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)continuitySessionServiceClientDidCaptureScreenshot:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  SBLogContinuitySession();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[Session] client did capture screenshot", v5, 2u);
  }

  -[SBContinuityScreenshotManager noteCapturedScreenshot](self->_screenshotManager, "noteCapturedScreenshot");
}

- (void)continuitySessionServiceClientDidStartScreenRecording:(id)a3
{
  _BOOL4 isBeingScreenRecorded;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  isBeingScreenRecorded = self->_isBeingScreenRecorded;
  SBLogContinuitySession();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (isBeingScreenRecorded)
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[Session] client said screen recording started - but we already think it started??", v7, 2u);
    }

  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[Session] client said screen recording started", buf, 2u);
    }

    -[SBContinuitySession _clientReportedScreenRecordingActive:](self, "_clientReportedScreenRecordingActive:", 1);
  }
}

- (void)continuitySessionServiceClientDidStopScreenRecording:(id)a3
{
  _BOOL4 isBeingScreenRecorded;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  isBeingScreenRecorded = self->_isBeingScreenRecorded;
  SBLogContinuitySession();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (isBeingScreenRecorded)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[Session] client said screen recording stopped", buf, 2u);
    }

    -[SBContinuitySession _clientReportedScreenRecordingActive:](self, "_clientReportedScreenRecordingActive:", 0);
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[Session] client said screen recording stopped - but we already think it stopped??", v7, 2u);
    }

  }
}

- (void)_clientReportedScreenRecordingActive:(BOOL)a3
{
  int v3;
  BOOL *p_isBeingScreenRecorded;
  NSObject *v6;
  int isBeingScreenRecorded;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  if (self->_clientAdoptedScreenCaptureNotifications)
  {
    p_isBeingScreenRecorded = &self->_isBeingScreenRecorded;
    if (self->_isBeingScreenRecorded == a3)
      return;
  }
  else
  {
    SBLogContinuitySession();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[Session] assuming client has adopted screen catpure API because they used it", buf, 2u);
    }

    p_isBeingScreenRecorded = &self->_isBeingScreenRecorded;
    isBeingScreenRecorded = self->_isBeingScreenRecorded;
    self->_clientAdoptedScreenCaptureNotifications = 1;
    if (isBeingScreenRecorded == v3)
      goto LABEL_8;
  }
  *p_isBeingScreenRecorded = v3;
LABEL_8:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSHashTable allObjects](self->_screenRecordingObservers, "allObjects", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "continuitySessionDidUpdateScreenRecordingState:", self);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

}

- (void)continuitySessionServiceClientHasAdoptedScreenCaptureNotifications:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_clientAdoptedScreenCaptureNotifications)
  {
    SBLogContinuitySession();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[Session] client notified us they have adopted screen capture notifications", buf, 2u);
    }

    self->_clientAdoptedScreenCaptureNotifications = 1;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSHashTable allObjects](self->_screenRecordingObservers, "allObjects", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "continuitySessionDidUpdateScreenRecordingState:", self);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)_handleContinuityButtonEvent:(unint64_t)a3
{
  NSObject *WeakRetained;
  void *v5;
  SBContinuityButtonActions *continuityButtonActions;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  const char *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_invalid)
  {
    SBLogContinuitySession();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSBUIContinuityButtonEventType();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v12 = 138543362;
      *(_QWORD *)&v12[4] = v5;
      _os_log_impl(&dword_1D0540000, WeakRetained, OS_LOG_TYPE_DEFAULT, "[Session] INVALIDATED - Ignoringing continuity button event %{public}@", v12, 0xCu);

    }
    goto LABEL_22;
  }
  continuityButtonActions = self->_continuityButtonActions;
  SBLogContinuitySession();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (continuityButtonActions)
  {
    if (!v9)
      goto LABEL_10;
    NSStringFromSBUIContinuityButtonEventType();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v12 = 138543362;
    *(_QWORD *)&v12[4] = v10;
    v11 = "[Session] Received button event %{public}@";
  }
  else
  {
    if (!v9)
      goto LABEL_10;
    NSStringFromSBUIContinuityButtonEventType();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v12 = 138543362;
    *(_QWORD *)&v12[4] = v10;
    v11 = "[Session] Not ready to handle button event %{public}@";
  }
  _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, v11, v12, 0xCu);

LABEL_10:
  switch(a3)
  {
    case 3uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
      if (WeakRetained)
        -[SBMultiDisplayUserInteractionCoordinator updateActiveWindowScene:forUserInteraction:](self->_multiDisplayUserInteractionCoordinator, "updateActiveWindowScene:forUserInteraction:", WeakRetained, CFSTR("continuity.showSpotlight"));
      -[SBContinuityButtonActions performSpotlightButtonAction](self->_continuityButtonActions, "performSpotlightButtonAction", *(_OWORD *)v12);
      break;
    case 2uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
      if (WeakRetained)
        -[SBMultiDisplayUserInteractionCoordinator updateActiveWindowScene:forUserInteraction:](self->_multiDisplayUserInteractionCoordinator, "updateActiveWindowScene:forUserInteraction:", WeakRetained, CFSTR("continuity.enterSwitcher"));
      -[SBContinuityButtonActions performSwitcherButtonAction](self->_continuityButtonActions, "performSwitcherButtonAction", *(_OWORD *)v12);
      break;
    case 1uLL:
      WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
      if (WeakRetained)
        -[SBMultiDisplayUserInteractionCoordinator updateActiveWindowScene:forUserInteraction:](self->_multiDisplayUserInteractionCoordinator, "updateActiveWindowScene:forUserInteraction:", WeakRetained, CFSTR("continuity.goToHome"));
      -[SBContinuityButtonActions performHomeButtonAction](self->_continuityButtonActions, "performHomeButtonAction", *(_OWORD *)v12);
      break;
    default:
      return;
  }
LABEL_22:

}

- (void)_handlePendedLaunchEventIfNecessaryAnimatedly:(BOOL)a3
{
  SBContinuitySessionLaunchEvent *pendingLaunchEvent;
  _BOOL8 v4;
  SBContinuitySessionLaunchEvent *v6;
  SBContinuitySessionLaunchEvent *v7;
  NSObject *v8;
  SBContinuitySessionLaunchEventExecutor *launchEventExecutor;
  SBContinuitySessionLaunchEvent *v10;
  _QWORD v11[4];
  SBContinuitySessionLaunchEvent *v12;
  SBContinuitySession *v13;
  id v14;
  uint8_t buf[4];
  SBContinuitySessionLaunchEvent *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  pendingLaunchEvent = self->_pendingLaunchEvent;
  if (pendingLaunchEvent)
  {
    v4 = a3;
    v6 = pendingLaunchEvent;
    v7 = self->_pendingLaunchEvent;
    self->_pendingLaunchEvent = 0;

    SBLogContinuitySession();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v6;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[Session] handling pended launch event now %{public}@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    launchEventExecutor = self->_launchEventExecutor;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__SBContinuitySession__handlePendedLaunchEventIfNecessaryAnimatedly___block_invoke;
    v11[3] = &unk_1E8EA5EB0;
    objc_copyWeak(&v14, (id *)buf);
    v10 = v6;
    v12 = v10;
    v13 = self;
    -[SBContinuitySessionLaunchEventExecutor executeLaunchEvent:animatedly:completion:](launchEventExecutor, "executeLaunchEvent:animatedly:completion:", v10, v4, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);

  }
}

void __69__SBContinuitySession__handlePendedLaunchEventIfNecessaryAnimatedly___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    SBLogContinuitySession();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[Session] finished handling pended launch event %{public}@", (uint8_t *)&v8, 0xCu);
    }

    v5 = *(void **)(a1 + 32);
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didHandleLaunchEvent:", v7);

  }
}

- (void)continuitySessionStateMachineDidUpdateState:(id)a3 oldState:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  BSInvalidatable *authenticationSessionAssertion;
  NSObject *v18;
  BSInvalidatable *v19;
  BSInvalidatable *v20;
  NSObject *v21;
  NSObject *v22;
  BSInvalidatable *v23;
  BSInvalidatable *keepDisplayLinkActiveAssertion;
  NSObject *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  SBContinuityUIFlushing *uiFlusher;
  NSObject *v30;
  SBContinuityButtonActions *v31;
  SBContinuityButtonActions *continuityButtonActions;
  NSObject *v33;
  NSObject *v34;
  _SBContinuitySessionStateMachine *stateMachine;
  void *v36;
  BSInvalidatable *v37;
  BSInvalidatable *v38;
  SBContinuityButtonActions *v39;
  SBContinuityDisplayLayoutPublisher *displayLayoutPublisher;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  id v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_msgSend(v7, "state");
  WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  SBLogContinuitySession();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSBContinuitySessionState(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v7;
    v54 = 2114;
    v55 = v11;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[Session] State machine update - %{public}@ oldState: %{public}@", buf, 0x16u);

  }
  if (v8 != a4)
  {
    switch(v8)
    {
      case 1:
        if (self->_authenticationSessionAssertion)
        {
          SBLogContinuitySession();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "[Session] blocked: dropping lock state assertion", buf, 2u);
          }

          -[BSInvalidatable invalidate](self->_authenticationSessionAssertion, "invalidate");
          authenticationSessionAssertion = self->_authenticationSessionAssertion;
          self->_authenticationSessionAssertion = 0;

          -[_SBContinuitySessionStateMachine setAutomaticBiometricsDisabled:](self->_stateMachine, "setAutomaticBiometricsDisabled:", 0);
        }
        break;
      case 2:
        SBLogContinuitySession();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "[Session] preparing: acquiring lock state assertion", buf, 2u);
        }

        if (self->_authenticationSessionAssertion)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 625, CFSTR("already tracking lock state assertion"));

        }
        -[SBContinuityDisplayAuthenticationCoordinator acquireContinuityDisplayActiveAssertionForReason:](self->_authenticationCoordinator, "acquireContinuityDisplayActiveAssertionForReason:", CFSTR("ready"));
        v19 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        v20 = self->_authenticationSessionAssertion;
        self->_authenticationSessionAssertion = v19;

        -[_SBContinuitySessionStateMachine setAutomaticBiometricsDisabled:](self->_stateMachine, "setAutomaticBiometricsDisabled:", 1);
        break;
      case 3:
        SBLogContinuitySession();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "[Session] waitingForRemoteUnlock", buf, 2u);
        }
        goto LABEL_30;
      case 4:
        SBLogContinuitySession();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "[Session] waitingForScenes", buf, 2u);
        }
        goto LABEL_30;
      case 5:
        SBLogContinuitySession();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "[Session] waitingForHIDServices", buf, 2u);
        }
LABEL_30:

        break;
      case 6:
        SBLogContinuitySession();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "[Session] activating", buf, 2u);
        }

        if (!self->_keepDisplayLinkActiveAssertion)
        {
          -[SBDisplayLinkController maintainDisplayLinkWhenBacklightIsOffForReason:](self->_displayLinkController, "maintainDisplayLinkWhenBacklightIsOffForReason:", CFSTR("SBContinuitySessionStateActivating"));
          v23 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
          keepDisplayLinkActiveAssertion = self->_keepDisplayLinkActiveAssertion;
          self->_keepDisplayLinkActiveAssertion = v23;

        }
        break;
      case 7:
        SBLogContinuitySession();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "[Session] updatingActiveDisplay", buf, 2u);
        }

        v26 = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
        if (!v26)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 652, CFSTR("Where is the main window scene?"));

        }
        -[SBMultiDisplayUserInteractionCoordinator updateActiveWindowScene:forUserInteraction:](self->_multiDisplayUserInteractionCoordinator, "updateActiveWindowScene:forUserInteraction:", v26, CFSTR("continuity.activation"));
        -[_SBContinuitySessionStateMachine noteActiveDisplayUpdated](self->_stateMachine, "noteActiveDisplayUpdated");

        break;
      case 8:
        SBLogContinuitySession();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "[Session] launching", buf, 2u);
        }

        -[SBContinuitySession _handlePendedLaunchEventIfNecessaryAnimatedly:](self, "_handlePendedLaunchEventIfNecessaryAnimatedly:", 0);
        break;
      case 9:
        SBLogContinuitySession();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "[Session] flushing: performing flush", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        uiFlusher = self->_uiFlusher;
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __76__SBContinuitySession_continuitySessionStateMachineDidUpdateState_oldState___block_invoke;
        v49[3] = &unk_1E8E9DF28;
        objc_copyWeak(&v50, (id *)buf);
        -[SBContinuityUIFlushing flushUIWithCompletion:](uiFlusher, "flushUIWithCompletion:", v49);
        objc_destroyWeak(&v50);
        objc_destroyWeak((id *)buf);
        break;
      case 10:
        SBLogContinuitySession();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_DEFAULT, "[Session] Lifecycle event: didActivateSession", buf, 2u);
        }

        if (self->_continuityButtonActions)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 677, CFSTR("already have continuity button actions"));

        }
        if (!WeakRetained)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySession.m"), 678, CFSTR("Where is the window scene???"));

        }
        v31 = -[SBContinuitySession _newContinuityButtonActionsForWindowScene:](self, "_newContinuityButtonActionsForWindowScene:", WeakRetained);
        continuityButtonActions = self->_continuityButtonActions;
        self->_continuityButtonActions = v31;

        -[SBContinuityDisplayLayoutPublisher activate](self->_displayLayoutPublisher, "activate");
        -[SBContinuitySession _handlePendedLaunchEventIfNecessaryAnimatedly:](self, "_handlePendedLaunchEventIfNecessaryAnimatedly:", 1);
        break;
      case 11:
        SBLogContinuitySession();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEFAULT, "[Session] Lifecycle event: didEndSession", buf, 2u);
        }

        SBLogContinuitySession();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v34))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D0540000, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_SESSION", (const char *)&unk_1D0E9B6CB, buf, 2u);
        }

        stateMachine = self->_stateMachine;
        -[_SBContinuitySessionStateMachine reasons](stateMachine, "reasons");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SBContinuitySessionStateMachine invalidateForReasons:](stateMachine, "invalidateForReasons:", v36);

        -[BSInvalidatable invalidate](self->_authenticationSessionAssertion, "invalidate");
        v37 = self->_authenticationSessionAssertion;
        self->_authenticationSessionAssertion = 0;

        -[BSInvalidatable invalidate](self->_keepDisplayLinkActiveAssertion, "invalidate");
        v38 = self->_keepDisplayLinkActiveAssertion;
        self->_keepDisplayLinkActiveAssertion = 0;

        -[SBContinuityButtonActions invalidate](self->_continuityButtonActions, "invalidate");
        v39 = self->_continuityButtonActions;
        self->_continuityButtonActions = 0;

        -[SBContinuityDisplayLayoutPublisher invalidate](self->_displayLayoutPublisher, "invalidate");
        displayLayoutPublisher = self->_displayLayoutPublisher;
        self->_displayLayoutPublisher = 0;

        self->_invalid = 1;
        break;
      default:
        break;
    }
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v46 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "continuitySessionDidUpdateState:", self);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v13);
  }

}

void __76__SBContinuitySession_continuitySessionStateMachineDidUpdateState_oldState___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "noteUIFlushed");
    WeakRetained = v2;
  }

}

- (id)sceneManagerforContinuityScreenshotManager:(id)a3
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
  objc_msgSend(WeakRetained, "sceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  int v8;
  id WeakRetained;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  SBContinuitySession *v36;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __49__SBContinuitySession_appendDescriptionToStream___block_invoke;
  v34[3] = &unk_1E8E9E820;
  v21 = v4;
  v35 = v21;
  v36 = self;
  objc_msgSend(v21, "appendProem:block:", self, v34);
  if ((objc_msgSend(v21, "hasSuccinctStyle") & 1) == 0)
  {
    v6 = (id)objc_msgSend(v21, "appendObject:withName:", self->_stateMachine, CFSTR("stateMachine"));
    v7 = (id)objc_msgSend(v21, "appendObject:withName:", self->_continuitySessionServiceClient, CFSTR("client"));
    v8 = objc_msgSend(v21, "hasDebugStyle");
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    if (v8)
    {
      v10 = (id)objc_msgSend(v21, "appendObject:withName:", WeakRetained, CFSTR("windowScene"));

      v11 = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
      v12 = (id)objc_msgSend(v21, "appendObject:withName:skipIfNil:", v11, CFSTR("mainWindowScene"), 1);

      v13 = objc_loadWeakRetained((id *)&self->_systemApertureScene);
      v14 = (id)objc_msgSend(v21, "appendObject:withName:", v13, CFSTR("systemApertureSceneIdentifier"));

      v15 = objc_loadWeakRetained((id *)&self->_systemApertureCurtainScene);
      v16 = (id)objc_msgSend(v21, "appendObject:withName:", v15, CFSTR("curtainSceneIdentifier"));
    }
    else
    {
      v31[0] = v5;
      v31[1] = 3221225472;
      v31[2] = __49__SBContinuitySession_appendDescriptionToStream___block_invoke_3;
      v31[3] = &unk_1E8E9E820;
      v17 = v21;
      v32 = v17;
      v15 = WeakRetained;
      v33 = v15;
      objc_msgSend(v17, "appendProem:block:", v15, v31);
      v18 = objc_loadWeakRetained((id *)&self->_mainSBWindowScene);
      if (v18)
      {
        v28[0] = v5;
        v28[1] = 3221225472;
        v28[2] = __49__SBContinuitySession_appendDescriptionToStream___block_invoke_4;
        v28[3] = &unk_1E8E9E820;
        v29 = v17;
        v30 = v18;
        objc_msgSend(v29, "appendProem:block:", v30, v28);

      }
      v19 = objc_loadWeakRetained((id *)&self->_systemApertureScene);
      if (v19)
      {
        v25[0] = v5;
        v25[1] = 3221225472;
        v25[2] = __49__SBContinuitySession_appendDescriptionToStream___block_invoke_5;
        v25[3] = &unk_1E8E9E820;
        v26 = v17;
        v27 = v19;
        objc_msgSend(v26, "appendProem:block:", v27, v25);

      }
      v20 = objc_loadWeakRetained((id *)&self->_systemApertureCurtainScene);
      if (v20)
      {
        v22[0] = v5;
        v22[1] = 3221225472;
        v22[2] = __49__SBContinuitySession_appendDescriptionToStream___block_invoke_6;
        v22[3] = &unk_1E8E9E820;
        v23 = v17;
        v24 = v20;
        objc_msgSend(v23, "appendProem:block:", v24, v22);

      }
    }

  }
}

void __49__SBContinuitySession_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x1E0D01758], "collectionLineBreakNoneStyle");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__SBContinuitySession_appendDescriptionToStream___block_invoke_2;
  v14[3] = &unk_1E8E9E820;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v15 = v3;
  v16 = v4;
  objc_msgSend(v3, "overlayStyle:block:", v13, v14);
  if ((objc_msgSend(*(id *)(a1 + 32), "hasSuccinctStyle") & 1) == 0)
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 216), CFSTR("displayHardwareIdentifier"), 1);
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184), CFSTR("appearanceSettings"));
    v7 = *(void **)(a1 + 32);
    BSInterfaceOrientationDescription();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, CFSTR("currentInterfaceOrientation"));

    v10 = *(void **)(a1 + 32);
    BSInterfaceOrientationMaskDescription();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v10, "appendObject:withName:", v11, CFSTR("supportedInterfaceOrientations"));

  }
}

void __49__SBContinuitySession_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  NSStringFromSBContinuitySessionState(objc_msgSend(*(id *)(a1 + 40), "state"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, 0);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "reasons");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", v6, 0);

}

void __49__SBContinuitySession_appendDescriptionToStream___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_sceneIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, CFSTR("sceneIdentifier"));

}

void __49__SBContinuitySession_appendDescriptionToStream___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_sceneIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, CFSTR("mainSceneIdentifier"));

}

void __49__SBContinuitySession_appendDescriptionToStream___block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_sceneIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, CFSTR("systemApertureSceneIdentifier"));

}

void __49__SBContinuitySession_appendDescriptionToStream___block_invoke_6(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_sceneIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, CFSTR("curtainSceneIdentifier"));

}

- (void)_invalidateForReasons:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogContinuitySession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] : %{public}@", (uint8_t *)&v8, 0x16u);

  }
  if (!self->_invalid)
  {
    v7 = -[SBContinuitySession state](self, "state");
    -[_SBContinuitySessionStateMachine invalidateForReasons:](self->_stateMachine, "invalidateForReasons:", v4);
    if (v7 != 11)
      -[SBContinuitySession continuitySessionStateMachineDidUpdateState:oldState:](self, "continuitySessionStateMachineDidUpdateState:oldState:", self->_stateMachine, v7);
  }

}

- (NSString)displayHardwareIdentifier
{
  return self->_displayHardwareIdentifier;
}

- (SBContinuitySessionOrientationDelegate)orientationDelegate
{
  return (SBContinuitySessionOrientationDelegate *)objc_loadWeakRetained((id *)&self->_orientationDelegate);
}

- (void)setOrientationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_orientationDelegate, a3);
}

- (BSInvalidatable)authenticationSessionAssertion
{
  return self->_authenticationSessionAssertion;
}

- (void)setAuthenticationSessionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationSessionAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationSessionAssertion, 0);
  objc_destroyWeak((id *)&self->_orientationDelegate);
  objc_storeStrong((id *)&self->_displayHardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_screenRecordingObservers, 0);
  objc_storeStrong((id *)&self->_displayLayoutPublisher, 0);
  objc_storeStrong((id *)&self->_appearanceSettings, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleProvider, 0);
  objc_storeStrong((id *)&self->_keepDisplayLinkActiveAssertion, 0);
  objc_storeStrong((id *)&self->_pendingLaunchEvent, 0);
  objc_storeStrong((id *)&self->_continuitySessionServiceClient, 0);
  objc_storeStrong((id *)&self->_orientationObservers, 0);
  objc_destroyWeak((id *)&self->_systemApertureCurtainScene);
  objc_destroyWeak((id *)&self->_systemApertureScene);
  objc_destroyWeak((id *)&self->_mainSBWindowScene);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_continuityButtonActions, 0);
  objc_storeStrong((id *)&self->_screenshotManager, 0);
  objc_storeStrong((id *)&self->_multiDisplayUserInteractionCoordinator, 0);
  objc_storeStrong((id *)&self->_launchEventExecutor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_uiFlusher, 0);
  objc_storeStrong((id *)&self->_displayLinkController, 0);
  objc_storeStrong((id *)&self->_buttonActionsFactory, 0);
  objc_storeStrong((id *)&self->_authenticationCoordinator, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

- (void)continuitySessionServiceClient:(os_log_t)log updatedAppearanceSettings:transitionContext:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "[Session] updated appearance setting - user interface style", v1, 2u);
}

@end
