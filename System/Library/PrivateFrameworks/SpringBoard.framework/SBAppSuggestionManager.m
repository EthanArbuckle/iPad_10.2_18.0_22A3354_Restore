@implementation SBAppSuggestionManager

- (void)disableListeningForUpdatesForReason:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSCountedSet containsObject:](self->_listeningReasons, "containsObject:"))
  {
    -[NSCountedSet removeObject:](self->_listeningReasons, "removeObject:", v4);
    -[SBAppSuggestionManager _evaluateSuggestionUpdates:](self, "_evaluateSuggestionUpdates:", 0);
  }

}

- (id)currentSuggestedApp
{
  return self->_currentBestSuggestion;
}

+ (SBAppSuggestionManager)sharedInstance
{
  if (sharedInstance_onceToken_34 != -1)
    dispatch_once(&sharedInstance_onceToken_34, &__block_literal_global_238);
  return (SBAppSuggestionManager *)(id)sharedInstance___sharedInstance_18;
}

void __40__SBAppSuggestionManager_sharedInstance__block_invoke()
{
  SBAppSuggestionManager *v0;
  void *v1;

  v0 = objc_alloc_init(SBAppSuggestionManager);
  v1 = (void *)sharedInstance___sharedInstance_18;
  sharedInstance___sharedInstance_18 = (uint64_t)v0;

}

- (SBAppSuggestionManager)init
{
  SBAppSuggestionManager *v2;
  SBAppSuggestionManager *v3;
  id v4;
  SBAttentionAwarenessClient *v5;
  SBAttentionAwarenessClient *idleTouchAwarenessClient;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBAppSuggestionManager;
  v2 = -[SBAppSuggestionManager init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SBAppSuggestionManager _createSuggestionSources](v2, "_createSuggestionSources");
    -[SBAppSuggestionManager _listenForNotifications](v3, "_listenForNotifications");
    v4 = objc_alloc_init(MEMORY[0x1E0CFEC08]);
    objc_msgSend(v4, "setIdentifier:", CFSTR("com.apple.SpringBoard.AppSuggestionManager"));
    objc_msgSend(v4, "setEventMask:", 3967);
    objc_msgSend(v4, "setAttentionLostTimeout:", 0.0);
    v5 = objc_alloc_init(SBAttentionAwarenessClient);
    idleTouchAwarenessClient = v3->_idleTouchAwarenessClient;
    v3->_idleTouchAwarenessClient = v5;

    -[SBAttentionAwarenessClient setConfiguration:](v3->_idleTouchAwarenessClient, "setConfiguration:", v4);
    -[SBAttentionAwarenessClient setEnabled:](v3->_idleTouchAwarenessClient, "setEnabled:", 1);
    -[SBAttentionAwarenessClient setDelegate:](v3->_idleTouchAwarenessClient, "setDelegate:", v3);

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SBAppSuggestionManager _stopListeningForNotifications](self, "_stopListeningForNotifications");
  -[SBAppSuggestionManager _destroySuggestionSources](self, "_destroySuggestionSources");
  -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 0);
  -[SBAttentionAwarenessClient setDelegate:](self->_idleTouchAwarenessClient, "setDelegate:", 0);
  -[SBAttentionAwarenessClient invalidate](self->_idleTouchAwarenessClient, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBAppSuggestionManager;
  -[SBAppSuggestionManager dealloc](&v3, sel_dealloc);
}

- (void)_createSuggestionSources
{
  UABestAppSuggestionManager *v3;
  UABestAppSuggestionManager *continuitySuggestionManager;
  ATXProactiveSuggestionClient *v5;
  ATXProactiveSuggestionClient *proactiveSuggestionClient;

  v3 = (UABestAppSuggestionManager *)objc_alloc_init(MEMORY[0x1E0DC5EB0]);
  continuitySuggestionManager = self->_continuitySuggestionManager;
  self->_continuitySuggestionManager = v3;

  -[UABestAppSuggestionManager setDelegate:](self->_continuitySuggestionManager, "setDelegate:", self);
  v5 = (ATXProactiveSuggestionClient *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9078]), "initWithConsumerSubType:", 31);
  proactiveSuggestionClient = self->_proactiveSuggestionClient;
  self->_proactiveSuggestionClient = v5;

}

- (void)_destroySuggestionSources
{
  -[UABestAppSuggestionManager stopListeningForBestAppSuggestions](self->_continuitySuggestionManager, "stopListeningForBestAppSuggestions");
  -[UABestAppSuggestionManager setDelegate:](self->_continuitySuggestionManager, "setDelegate:", 0);
  -[SBAppSuggestionManager _deregisterFromProactiveSuggestionNotifications](self, "_deregisterFromProactiveSuggestionNotifications");
}

- (void)_listenForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__screenDidUndim_, *MEMORY[0x1E0DAC310], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__screenDidDim_, *MEMORY[0x1E0DAC2F0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__evaluateSuggestionUpdates_, *MEMORY[0x1E0DAC318], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleInitialSpringBoardLaunch, *MEMORY[0x1E0CEB290], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAppUninstall_, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

}

- (void)_stopListeningForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC310], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC2F0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DAC318], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB290], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

}

- (void)performWithCurrentSuggestedAppAndApplication:(id)a3
{
  void (**v4)(id, SBBestAppSuggestion *, id);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, SBBestAppSuggestion *, id))a3;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBestAppSuggestion bundleIdentifier](self->_currentBestSuggestion, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationWithBundleIdentifier:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, self->_currentBestSuggestion, v7);
}

- (void)startFetchingPayloadForAppSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    dispatch_get_global_queue(0, 2uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__SBAppSuggestionManager_startFetchingPayloadForAppSuggestion___block_invoke;
    v6[3] = &unk_1E8E9E820;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

uint64_t __63__SBAppSuggestionManager_startFetchingPayloadForAppSuggestion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  kdebug_trace();
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = *(_QWORD *)(v2 + 8);
  else
    v3 = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "queueFetchOfPayloadForBestAppSuggestion:", v3);
}

- (void)enableListeningForUpdatesForReason:(id)a3
{
  id v4;
  NSCountedSet *listeningReasons;
  NSCountedSet *v6;
  NSCountedSet *v7;
  id v8;

  v4 = a3;
  listeningReasons = self->_listeningReasons;
  v8 = v4;
  if (!listeningReasons)
  {
    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    v7 = self->_listeningReasons;
    self->_listeningReasons = v6;

    v4 = v8;
    listeningReasons = self->_listeningReasons;
  }
  if ((-[NSCountedSet containsObject:](listeningReasons, "containsObject:", v4) & 1) == 0)
  {
    -[NSCountedSet addObject:](self->_listeningReasons, "addObject:", v8);
    -[SBAppSuggestionManager _evaluateSuggestionUpdates:](self, "_evaluateSuggestionUpdates:", 0);
  }

}

- (void)_screenDidDim:(id)a3
{
  *(_WORD *)&self->_screenOnDueToUserEvent = 0;
  -[SBAppSuggestionManager _evaluateSuggestionUpdates:](self, "_evaluateSuggestionUpdates:", a3);
}

- (void)_screenDidUndim:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DAC2E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "intValue");
    if ((unint64_t)v6 > 0x2F || ((1 << v6) & 0x8001801002FCLL) == 0)
    {
      self->_screenOnAndLookingForEvent = 1;
      -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 1);
    }
    else
    {
      self->_screenOnDueToUserEvent = 1;
    }
    -[SBAppSuggestionManager _evaluateSuggestionUpdates:](self, "_evaluateSuggestionUpdates:", v8);
  }

}

- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4
{
  void *v5;

  -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 0, a4);
  if (self->_screenOnAndLookingForEvent)
  {
    self->_screenOnAndLookingForEvent = 0;
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_screenOnDueToUserEvent = objc_msgSend(v5, "screenIsOn");

    -[SBAppSuggestionManager _evaluateSuggestionUpdates:](self, "_evaluateSuggestionUpdates:", 0);
  }
}

- (void)_handleInitialSpringBoardLaunch
{
  void *v3;
  int v4;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUILocked");

  if (v4)
  {
    self->_screenOnDueToUserEvent = 1;
    -[SBAppSuggestionManager _evaluateSuggestionUpdates:](self, "_evaluateSuggestionUpdates:", 0);
  }
}

- (void)_evaluateSuggestionUpdates:(id)a3
{
  int v4;
  _BOOL4 v5;
  uint64_t v6;
  _BOOL8 screenOnDueToUserEvent;
  id v8;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v8, "isUILocked");
  v5 = self->_screenOnDueToUserEvent || self->_screenOnAndLookingForEvent;
  v6 = -[NSCountedSet count](self->_listeningReasons, "count");
  screenOnDueToUserEvent = v6 != 0;
  if (!v6 && ((v4 ^ 1) & 1) == 0)
    screenOnDueToUserEvent = self->_screenOnDueToUserEvent;
  -[SBAppSuggestionManager _setContinuitySuggestionUpdatesEnabled:expertCenterSuggestionUpdatesEnabled:](self, "_setContinuitySuggestionUpdatesEnabled:expertCenterSuggestionUpdatesEnabled:", screenOnDueToUserEvent, screenOnDueToUserEvent | v4 & v5);

}

- (void)_setContinuitySuggestionUpdatesEnabled:(BOOL)a3 expertCenterSuggestionUpdatesEnabled:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 isListeningForContinuitySuggestion;
  _BOOL4 isListeningForExpertCenterSuggestion;
  int v9;
  NSObject *v10;
  UABestAppSuggestion *continuityCurrentBestSuggestion;
  NSObject *v12;
  NSObject *v14;
  NSObject *v15;
  ATXProactiveSuggestion *currentProactiveBestSuggestion;
  void *v17;
  _QWORD *v18;
  void *v19;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];
  uint8_t v23[16];

  v4 = a4;
  isListeningForContinuitySuggestion = self->_isListeningForContinuitySuggestion;
  isListeningForExpertCenterSuggestion = self->_isListeningForExpertCenterSuggestion;
  if (self->_isListeningForContinuitySuggestion || !a3)
  {
    v9 = 0;
    if (self->_isListeningForContinuitySuggestion && !a3)
    {
      SBLogContinuity();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "No longer listening for handoff app suggestions", buf, 2u);
      }

      -[UABestAppSuggestionManager stopListeningForBestAppSuggestions](self->_continuitySuggestionManager, "stopListeningForBestAppSuggestions");
      self->_isListeningForContinuitySuggestion = 0;
      continuityCurrentBestSuggestion = self->_continuityCurrentBestSuggestion;
      self->_continuityCurrentBestSuggestion = 0;

      v9 = 1;
    }
  }
  else
  {
    SBLogContinuity();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "Starting to listen for handoff app suggestions", v23, 2u);
    }

    -[UABestAppSuggestionManager startListeningForBestAppSuggestions](self->_continuitySuggestionManager, "startListeningForBestAppSuggestions");
    v9 = 0;
    self->_isListeningForContinuitySuggestion = 1;
  }
  if (v4)
  {
    if (!self->_isListeningForExpertCenterSuggestion)
    {
      SBLogContinuity();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "Starting to listen for Duet app suggestions", v21, 2u);
      }

      -[SBAppSuggestionManager _registerForProactiveSuggestionNotifications](self, "_registerForProactiveSuggestionNotifications");
      self->_isListeningForExpertCenterSuggestion = 1;
    }
  }
  else if (self->_isListeningForExpertCenterSuggestion)
  {
    SBLogContinuity();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_INFO, "No longer listening for Duet app suggestions", v20, 2u);
    }

    -[SBAppSuggestionManager _deregisterFromProactiveSuggestionNotifications](self, "_deregisterFromProactiveSuggestionNotifications");
    self->_isListeningForExpertCenterSuggestion = 0;
    currentProactiveBestSuggestion = self->_currentProactiveBestSuggestion;
    self->_currentProactiveBestSuggestion = 0;

    v9 = 1;
  }
  if (isListeningForExpertCenterSuggestion || isListeningForContinuitySuggestion)
  {
    if (self->_isListeningForContinuitySuggestion || self->_isListeningForExpertCenterSuggestion)
      goto LABEL_31;
    +[SBEventObserverRegistry sharedInstance](SBEventObserverRegistry, "sharedInstance", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:forState:", 0, *MEMORY[0x1E0DAB700]);
    v18 = (_QWORD *)MEMORY[0x1E0DAB6E0];
  }
  else
  {
    if (!self->_isListeningForContinuitySuggestion && !self->_isListeningForExpertCenterSuggestion)
      goto LABEL_31;
    +[SBEventObserverRegistry sharedInstance](SBEventObserverRegistry, "sharedInstance", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setValue:forState:", 1, *MEMORY[0x1E0DAB700]);
    v18 = (_QWORD *)MEMORY[0x1E0DAB6D8];
  }

  +[SBEventObserverRegistry sharedInstance](SBEventObserverRegistry, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "postEventToInterestedObservers:", *v18);

LABEL_31:
  if (v9)
    -[SBAppSuggestionManager _calculateBestSuggestionAndNotifyListeners](self, "_calculateBestSuggestionAndNotifyListeners", a3);
}

- (void)_registerForProactiveSuggestionNotifications
{
  int *p_proactiveSuggestionNotificationToken;
  const char *v4;
  _QWORD handler[5];

  p_proactiveSuggestionNotificationToken = &self->_proactiveSuggestionNotificationToken;
  if (!self->_proactiveSuggestionNotificationToken)
  {
    v4 = (const char *)objc_msgSend((id)*MEMORY[0x1E0CF89B8], "UTF8String");
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __70__SBAppSuggestionManager__registerForProactiveSuggestionNotifications__block_invoke;
    handler[3] = &unk_1E8E9EBA8;
    handler[4] = self;
    notify_register_dispatch(v4, p_proactiveSuggestionNotificationToken, MEMORY[0x1E0C80D38], handler);
  }
}

uint64_t __70__SBAppSuggestionManager__registerForProactiveSuggestionNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "proactiveSuggestionChanged");
}

- (void)_deregisterFromProactiveSuggestionNotifications
{
  int proactiveSuggestionNotificationToken;

  proactiveSuggestionNotificationToken = self->_proactiveSuggestionNotificationToken;
  if (proactiveSuggestionNotificationToken)
  {
    notify_cancel(proactiveSuggestionNotificationToken);
    self->_proactiveSuggestionNotificationToken = 0;
  }
}

- (void)noteActivatingForAppSuggestion:(id)a3 fromSource:(int64_t)a4
{
  char isKindOfClass;
  void *v8;
  void *v9;
  UABestAppSuggestionManager *continuitySuggestionManager;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  if (a4 == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAppSuggestionManager.m"), 378, CFSTR("we're activating an app for continuity that didn't come from a source we know about"));

  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v8 = v14;
  if ((isKindOfClass & 1) != 0)
  {
    if (v14)
      v9 = (void *)*((_QWORD *)v14 + 1);
    else
      v9 = 0;
    continuitySuggestionManager = self->_continuitySuggestionManager;
    if ((unint64_t)(a4 + 1) > 3)
      v11 = 0x20000000;
    else
      v11 = qword_1D0E8A6D8[a4 + 1];
    v12 = v9;
    -[UABestAppSuggestionManager bestAppSuggestionWasLaunched:withInteractionType:](continuitySuggestionManager, "bestAppSuggestionWasLaunched:withInteractionType:", v12, v11);
    -[UABestAppSuggestionManager removeBestApp:options:](self->_continuitySuggestionManager, "removeBestApp:options:", v12, &unk_1E91D25F8);

    v8 = v14;
  }

}

- (void)noteNotActivatingForAppSuggestion:(id)a3 fromSource:(int64_t)a4
{
  char isKindOfClass;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;

  v8 = (uint64_t *)a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    if (v8)
      v7 = v8[1];
    else
      v7 = 0;
    -[UABestAppSuggestionManager bestAppSuggestionLaunchWasCancelled:](self->_continuitySuggestionManager, "bestAppSuggestionLaunchWasCancelled:", v7);
    v6 = v8;
  }

}

- (void)_calculateBestSuggestionAndNotifyListeners
{
  SBBestAppSuggestion *v3;
  SBBestAppSuggestion *currentBestSuggestion;
  _BOOL4 v5;
  ATXProactiveSuggestion *currentProactiveBestSuggestion;
  _SBProactiveAppSuggestion *v7;
  SBBestAppSuggestion *v8;
  void *v9;
  void *v10;
  void *v11;
  SBBestAppSuggestion *v12;
  SBBestAppSuggestion *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_currentBestSuggestion;
  currentBestSuggestion = self->_currentBestSuggestion;
  self->_currentBestSuggestion = 0;

  v5 = -[UABestAppSuggestion type](self->_continuityCurrentBestSuggestion, "type") != 5
    && -[UABestAppSuggestion type](self->_continuityCurrentBestSuggestion, "type") != 10;
  currentProactiveBestSuggestion = self->_currentProactiveBestSuggestion;
  if (!self->_continuityCurrentBestSuggestion)
  {
    if (!currentProactiveBestSuggestion)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (!currentProactiveBestSuggestion)
    v5 = 1;
  if (!v5)
  {
LABEL_10:
    v7 = -[_SBProactiveAppSuggestion initWithAppSuggestion:]([_SBProactiveAppSuggestion alloc], "initWithAppSuggestion:", self->_currentProactiveBestSuggestion);
    goto LABEL_11;
  }
  v7 = (_SBProactiveAppSuggestion *)-[_SBUABestAppSuggestion initWithAppSuggestion:]((id *)[_SBUABestAppSuggestion alloc], self->_continuityCurrentBestSuggestion);
LABEL_11:
  v8 = self->_currentBestSuggestion;
  self->_currentBestSuggestion = &v7->super;

LABEL_12:
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBBestAppSuggestion bundleIdentifier](self->_currentBestSuggestion, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationWithBundleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

    goto LABEL_14;
  }
  if (!v3)
  {
LABEL_21:

    goto LABEL_22;
  }
  v13 = self->_currentBestSuggestion;

  if (!v13)
  {
LABEL_14:
    v12 = self->_currentBestSuggestion;
    if (v12)
    {
      v14 = CFSTR("SBNewSuggestedAppKey");
      v15[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("SBSuggestedAppChangedNotification"), self, v9);
    goto LABEL_21;
  }
LABEL_22:

}

- (void)bestAppSuggestionChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBAppSuggestionManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__SBAppSuggestionManager_bestAppSuggestionChanged___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __51__SBAppSuggestionManager_bestAppSuggestionChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogContinuity();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Got handoff app suggestion: %@", (uint8_t *)&v11, 0xCu);
  }

  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_10;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restrictionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isApplicationIdentifierRestricted:", v6);

  if ((v7 & 1) != 0)
    return;
  v8 = *(void **)(a1 + 32);
  if (!v8)
    goto LABEL_10;
  objc_msgSend(v8, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((TUIsCallHandoffActivityType() & 1) == 0)
  {

    goto LABEL_10;
  }
  v10 = TUShouldShowCallHandoff();

  if (v10)
  {
LABEL_10:
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 16), *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_calculateBestSuggestionAndNotifyListeners");
  }
}

- (void)_handleAppUninstall:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  SBBestAppSuggestion *currentBestSuggestion;
  void *v16;
  int v17;
  UABestAppSuggestion *continuityCurrentBestSuggestion;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SBInstalledApplicationsRemovedBundleIDs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[SBBestAppSuggestion bundleIdentifier](self->_currentBestSuggestion, "bundleIdentifier", (_QWORD)v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          currentBestSuggestion = self->_currentBestSuggestion;
          self->_currentBestSuggestion = 0;

          v9 = 1;
        }
        -[UABestAppSuggestion bundleIdentifier](self->_continuityCurrentBestSuggestion, "bundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v12, "isEqualToString:", v16);

        if (v17)
        {
          continuityCurrentBestSuggestion = self->_continuityCurrentBestSuggestion;
          self->_continuityCurrentBestSuggestion = 0;

          v9 = 1;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);

    if ((v9 & 1) != 0)
      -[SBAppSuggestionManager _calculateBestSuggestionAndNotifyListeners](self, "_calculateBestSuggestionAndNotifyListeners");
  }
  else
  {

  }
}

- (void)proactiveSuggestionChanged
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Proactive suggestion was not of executable type App, discarding", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTouchAwarenessClient, 0);
  objc_storeStrong((id *)&self->_listeningReasons, 0);
  objc_storeStrong((id *)&self->_currentBestSuggestion, 0);
  objc_storeStrong((id *)&self->_currentProactiveBestSuggestion, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestionClient, 0);
  objc_storeStrong((id *)&self->_continuityCurrentBestSuggestion, 0);
  objc_storeStrong((id *)&self->_continuitySuggestionManager, 0);
}

@end
