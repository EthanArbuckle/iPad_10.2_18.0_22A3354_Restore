@implementation SHSheetInteractor

- (SHSheetInteractor)initWithContext:(id)a3
{
  id v4;
  SHSheetInteractor *v5;
  SHSheetInteractor *v6;
  SHSheetSession *v7;
  SHSheetSession *session;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SHSheetInteractor;
  v5 = -[SHSheetInteractor init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SHSheetInteractor _setupServiceManagerIfNeeded](v5, "_setupServiceManagerIfNeeded");
    v7 = -[SHSheetSession initWithContext:delegate:]([SHSheetSession alloc], "initWithContext:delegate:", v4, v6);
    session = v6->_session;
    v6->_session = v7;

  }
  return v6;
}

- (void)setWantsCollaborativeSession:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  const __CFString *v27;
  void *v28;
  int v29;
  const __CFString *v30;
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  -[SHSheetInteractor session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCollaborative");

  if (v6 != v3)
  {
    -[SHSheetInteractor session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "collaborationModeRestriction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "disabledMode") == 1 && v3)
    {
      v9 = 1;
    }
    else
    {
      v9 = !v3;
      -[SHSheetInteractor session](self, "session");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "collaborationModeRestriction");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "disabledMode"))
        v9 = 0;

    }
    -[SHSheetInteractor session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collaborationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 && (SHSheetIsCollaborationItemEligibleForActivity(v13, 0) & 1) == 0)
    {
      share_sheet_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_19E419000, v25, OS_LOG_TYPE_DEFAULT, "Collaboration not supported for URL", (uint8_t *)&v29, 2u);
      }

      -[SHSheetInteractor delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "interactorDidFailPerformActivityNotCollaborationEligible:", self);
    }
    else
    {
      if (!v9)
        goto LABEL_21;
      -[SHSheetInteractor session](self, "session");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "collaborationModeRestriction");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "alertTitle");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        -[SHSheetInteractor session](self, "session");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "collaborationModeRestriction");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "allowContinueToMode");

        if ((v20 & 1) == 0)
        {
          -[SHSheetInteractor delegate](self, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SHSheetInteractor session](self, "session");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "collaborationModeRestriction");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "interactor:showingModeRestriction:continueHandler:", self, v23, 0);

          share_sheet_log();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v29) = 0;
            _os_log_impl(&dword_19E419000, v24, OS_LOG_TYPE_DEFAULT, "Not changing mode because desired mode is disabled", (uint8_t *)&v29, 2u);
          }

LABEL_26:
          return;
        }
LABEL_21:
        share_sheet_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = CFSTR("Send Copy");
          if (v3)
            v27 = CFSTR("Collaborative");
          v29 = 138412290;
          v30 = v27;
          _os_log_impl(&dword_19E419000, v26, OS_LOG_TYPE_DEFAULT, "Changing mode to %@", (uint8_t *)&v29, 0xCu);
        }

        -[SHSheetInteractor session](self, "session");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setIsCollaborative:", v3);

        -[SHSheetInteractor requestServiceUpdate](self, "requestServiceUpdate");
        goto LABEL_26;
      }

    }
    goto LABEL_21;
  }
}

- (BOOL)hasSessionStarted
{
  void *v2;
  BOOL v3;

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "connectionState") != 0;

  return v3;
}

- (void)updateSessionWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Update session with context:%@", (uint8_t *)&v7, 0xCu);
  }

  -[SHSheetInteractor session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithContext:", v4);

}

- (void)startSession
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = -[SHSheetInteractor hasSessionStarted](self, "hasSessionStarted");
  share_sheet_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "Session has already started.", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "Start session", v9, 2u);
    }

    -[SHSheetInteractor _setupServiceManagerIfNeeded](self, "_setupServiceManagerIfNeeded");
    -[SHSheetInteractor serviceManager](self, "serviceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetInteractor session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectWithSession:", v7);

    -[SHSheetInteractor session](self, "session");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject remoteScene](v4, "remoteScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activate");

  }
}

- (void)stopSession
{
  NSObject *v3;
  uint8_t v4[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Stop session", v4, 2u);
  }

  -[SHSheetInteractor setServiceManager:](self, "setServiceManager:", 0);
}

- (void)requestServiceUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SHSheetInteractor session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_createActivityMatchingContext");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SHSheetInteractor session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activitiesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateActivitiesWithContext:", v8);

  -[SHSheetInteractor session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "useRemoteUIService");

  if ((_DWORD)v5)
    -[SHSheetInteractor _updateRemoteScene](self, "_updateRemoteScene");
  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "update");

}

- (void)_updateRemoteScene
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SHSheetInteractor session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteScene");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SHSheetInteractor session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createClientContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "updateWithSessionContext:", v5);
  }

}

- (void)invalidateRemoteSession
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[SHSheetInteractor session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    share_sheet_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_19E419000, v4, OS_LOG_TYPE_DEFAULT, "invalidate remote session", v5, 2u);
    }

    objc_msgSend(v3, "resetContext");
  }

}

- (void)clearActivityForResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint8_t v20[16];

  v4 = a3;
  -[SHSheetInteractor session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "completedState");
  objc_msgSend(v6, "readyToInteractTimestamp");
  objc_msgSend(v6, "creationTimestamp");
  v9 = UpTicksToMilliseconds();
  mach_continuous_time();
  objc_msgSend(v6, "creationTimestamp");
  v10 = UpTicksToMilliseconds();
  -[SHSheetInteractor _recordActivityInteractionForResult:](self, "_recordActivityInteractionForResult:", v4);

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v8 == 5;
    -[SHSheetInteractor serviceManager](self, "serviceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetInteractor session](self, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activityType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reportActivityWithSessionID:presentationMs:totalShareTimeMs:activityType:success:", v15, v9, v10, v16, v12);

  }
  else
  {
    share_sheet_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_19E419000, v17, OS_LOG_TYPE_DEFAULT, "Service manager is nil.", v20, 2u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SHSheetInteractor session](self, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activitiesManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeActivity:", v7);

  }
}

- (void)performActivity:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;

  v4 = a3;
  -[SHSheetInteractor activityPerformer](self, "activityPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunning");

  if (v6)
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SHSheetInteractor performActivity:].cold.1((uint64_t)v4, self, v7);

  }
  else
  {
    -[SHSheetInteractor _runActivity:](self, "_runActivity:", v4);
  }

}

- (void)performPeopleSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "transportBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIActivityHelper activityTypeForBundleIdentifier:](_UIActivityHelper, "activityTypeForBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetInteractor session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activitiesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityForActivityType:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SHSheetInteractor session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCurrentPeopleSuggestion:", v4);

    -[SHSheetInteractor serviceManager](self, "serviceManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "provideFeedbackForPeopleSugestionIdentifier:", v12);

    -[SHSheetInteractor _performActivity:](self, "_performActivity:", v9);
  }
  else
  {
    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_19E419000, v13, OS_LOG_TYPE_DEFAULT, "activityType:%@ is not available for people suggestion:%@", (uint8_t *)&v14, 0x16u);
    }

  }
}

- (void)performActivityWithRequest:(id)a3 forExtension:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SHSheetInteractor _prepareActivityProxyForRequest:](self, "_prepareActivityProxyForRequest:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__SHSheetInteractor_performActivityWithRequest_forExtension_completion___block_invoke;
  v15[3] = &unk_1E4002D40;
  objc_copyWeak(&v19, &location);
  v12 = v8;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  objc_msgSend(v11, "setDidFinishPreparingForExecution:", v15);
  -[SHSheetInteractor _performActivity:](self, "_performActivity:", v11);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __72__SHSheetInteractor_performActivityWithRequest_forExtension_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "activityPerformer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activityItemsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityItemValuesForActivity:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "classForPreparingExtensionItemData"), "preparedActivityExtensionItemDataForActivityItemValues:extensionItemDataRequest:", v7, *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "prepareForSendingToExtension:", *(_QWORD *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    WeakRetained = v9;
  }

}

- (void)preheatActivitiesIfNeeded
{
  void *v2;
  id v3;

  -[SHSheetInteractor session](self, "session");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activitiesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preheatActivitiesIfNeeded");

}

- (void)activityViewControllerDidAppear
{
  id v2;

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityViewControllerDidAppear");

}

- (void)activityViewControllerDidDisappear
{
  id v2;

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityViewControllerDidDisappear");

}

- (void)applicationDidEnterBackground
{
  id v2;

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationDidEnterBackground");

}

- (void)applicationWillEnterForeground
{
  id v2;

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationWillEnterForeground");

}

- (id)createActivityItemsConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3440]), "initWithItemProviders:", v2);

  return v3;
}

- (void)performShareActivityWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Perform share activity with identifier:%@", (uint8_t *)&v7, 0xCu);
  }

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performShareActivityWithIdentifier:", v4);

}

- (void)performActionActivityWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Perform action activity with identifier:%@", (uint8_t *)&v7, 0xCu);
  }

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performActionActivityWithIdentifier:", v4);

}

- (void)performEditAction
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Perform edit action", v5, 2u);
  }

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performEditAction");

}

- (void)performPersonSuggestionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Perform person suggestion with identifier:%@", (uint8_t *)&v7, 0xCu);
  }

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performPersonSuggestionWithIdentifier:", v4);

}

- (void)removePersonSuggestionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Remove person suggestion with identifier:%@", (uint8_t *)&v7, 0xCu);
  }

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removePersonSuggestionWithIdentifier:", v4);

}

- (void)toggleUserDefaultsActivityWithIdentifier:(id)a3 activityCategory:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "Toggle user defaults activity with identifier:%@", (uint8_t *)&v9, 0xCu);
  }

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toggleUserDefaultsActivityWithIdentifier:activityCategory:", v6, a4);

}

- (void)favoriteUserDefaultsActivity:(BOOL)a3 withIdentifier:(id)a4 activityCategory:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v6 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  share_sheet_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_19E419000, v9, OS_LOG_TYPE_DEFAULT, "Favorite user defaults activity with identifier:%@", (uint8_t *)&v11, 0xCu);
  }

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "favoriteUserDefaultsActivity:withIdentifier:activityCategory:", v6, v8, a5);

}

- (void)updateUserDefaultsFavorites:(id)a3 activityCategory:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "Update user defaults favorites:%@", (uint8_t *)&v9, 0xCu);
  }

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateUserDefaultsFavorites:activityCategory:", v6, a4);

}

- (void)performUserDefaultsActivityWithIdentifier:(id)a3 activityCategory:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "Perform user defaults activity with identifier:%@", (uint8_t *)&v9, 0xCu);
  }

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performUserDefaultsActivityWithIdentifier:activityCategory:", v6, a4);

}

- (void)longPressShareActivityWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Long press share activity with identifier:%@", (uint8_t *)&v7, 0xCu);
  }

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "longPressShareActivityWithIdentifier:", v4);

}

- (void)provideFeedbackForPeopleSugestionIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Provide feedback for people suggestion identifier:%@", (uint8_t *)&v7, 0xCu);
  }

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "provideFeedbackForPeopleSugestionIdentifier:", v4);

}

- (void)performActivityWithType:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  share_sheet_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19E419000, v8, OS_LOG_TYPE_DEFAULT, "Perform activity with type:%@", (uint8_t *)&v10, 0xCu);
  }

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performActivityWithType:completionHandler:", v6, v7);

}

- (void)findSupportedActivitiesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Find supported activities", v7, 2u);
  }

  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "findSupportedActivitiesWithCompletionHandler:", v4);

}

- (void)_setupServiceManagerIfNeeded
{
  SHSheetServiceManager *v3;
  SHSheetServiceManager *serviceManager;

  if (!self->_serviceManager)
  {
    v3 = objc_alloc_init(SHSheetServiceManager);
    serviceManager = self->_serviceManager;
    self->_serviceManager = v3;

    -[SHSheetServiceManager setDelegate:](self->_serviceManager, "setDelegate:", self);
  }
}

- (void)_performActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SHSheetInteractor activityPerformer](self, "activityPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isRunning") & 1) == 0)
  {

    goto LABEL_7;
  }
  -[SHSheetInteractor collaborationPerformer](self, "collaborationPerformer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_7:
    -[SHSheetInteractor session](self, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activityViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_performActivity:", v4);

    goto LABEL_8;
  }
  share_sheet_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[SHSheetInteractor performActivity:].cold.1((uint64_t)v4, self, v7);

LABEL_8:
}

- (void)_runActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  int v23;
  int v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  int v32;
  void *v33;
  void *v34;
  char IsCollaborationItemEligibleForActivity;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  BOOL v58;
  void *v59;
  void *v60;
  unsigned int v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  char v68;
  _BYTE buf[24];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "activityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Perform activity:%@", buf, 0xCu);

  }
  -[SHSheetInteractor collaborationPerformer](self, "collaborationPerformer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRunning");

  if (!v8)
  {
    -[SHSheetInteractor session](self, "session");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collaborationItem");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v63, "type"))
      v16 = 0;
    else
      v16 = objc_msgSend(v63, "isiCloudDrive");
    -[SHSheetInteractor collaborationPerformer](self, "collaborationPerformer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activityType");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activityType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqual:", v19))
    {
      -[SHSheetInteractor collaborationPerformer](self, "collaborationPerformer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "cloudSharingResult");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21 != 0;

    }
    else
    {
      v22 = 0;
    }

    if (objc_msgSend(v63, "type") == 2)
      v23 = objc_msgSend(v63, "isURLProviderSupported");
    else
      v23 = 0;
    if (objc_msgSend(v63, "type") == 1)
      v24 = 1;
    else
      v24 = v16 | v23;
    v25 = objc_msgSend((id)objc_opt_class(), "activityCategory");
    objc_msgSend(v4, "activityType");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isEqual:", CFSTR("com.apple.UIKit.activity.AirDrop")) & 1) != 0)
    {
      v27 = 0;
    }
    else
    {
      v28 = (void *)MEMORY[0x1E0D97420];
      objc_msgSend(v4, "activityType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v28) = objc_msgSend(v28, "isHeroCollaborationActivityType:", v29);

      v27 = v28 ^ 1;
    }

    -[SHSheetInteractor session](self, "session");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "isCollaborative"))
    {
      if (v25 == 1)
        v31 = v27;
      else
        v31 = 0;
      v32 = v22 | v31 & v24 ^ 1;
    }
    else
    {
      v32 = 1;
    }
    v61 = v32;

    objc_msgSend(v4, "activityType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v33, "isEqual:", CFSTR("com.apple.UIKit.activity.AirDrop")) & 1) == 0)
    {
      -[SHSheetInteractor session](self, "session");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v34, "isCollaborative") & 1) != 0)
      {
        IsCollaborationItemEligibleForActivity = SHSheetIsCollaborationItemEligibleForActivity(v63, v4);

        if ((IsCollaborationItemEligibleForActivity & 1) == 0)
        {
          share_sheet_log();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "activityType");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v37;
            _os_log_impl(&dword_19E419000, v36, OS_LOG_TYPE_DEFAULT, "Collaboration not supported for URL - activity:%@", buf, 0xCu);

          }
          -[SHSheetInteractor delegate](self, "delegate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "interactorDidFailPerformActivityNotCollaborationEligible:", self);

          goto LABEL_57;
        }
LABEL_35:
        -[SHSheetInteractor session](self, "session");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "collaborationModeRestriction");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "disabledMode");
        if (v40 == 1)
        {
          -[SHSheetInteractor session](self, "session");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v60, "isCollaborative"))
          {

            goto LABEL_50;
          }
        }
        -[SHSheetInteractor session](self, "session");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "collaborationModeRestriction");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "disabledMode");
        if (v43
          || (-[SHSheetInteractor session](self, "session"),
              v59 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v59, "isCollaborative")))
        {
          -[SHSheetInteractor session](self, "session");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "collaborationModeRestriction");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v45, "disabledMode"))
          {

            v46 = 0;
            if (!v43)
            {
LABEL_48:

              if (v40 != 1)
              {
LABEL_49:

                if (v46)
                {
LABEL_50:
                  -[SHSheetInteractor session](self, "session");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "collaborationModeRestriction");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "alertTitle");
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v50)
                  {
                    -[SHSheetInteractor session](self, "session");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v51, "collaborationModeRestriction");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v53 = objc_msgSend(v52, "allowContinueToMode");

                    if (v53)
                    {
                      share_sheet_log();
                      v54 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_19E419000, v54, OS_LOG_TYPE_DEFAULT, "Showing mode restriction alert. Waiting for user confirmation...", buf, 2u);
                      }

                      *(_QWORD *)buf = 0;
                      objc_initWeak((id *)buf, self);
                      -[SHSheetInteractor delegate](self, "delegate");
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      -[SHSheetInteractor session](self, "session");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v56, "collaborationModeRestriction");
                      v57 = (void *)objc_claimAutoreleasedReturnValue();
                      v64[0] = MEMORY[0x1E0C809B0];
                      v64[1] = 3221225472;
                      v64[2] = __34__SHSheetInteractor__runActivity___block_invoke;
                      v64[3] = &unk_1E4002D68;
                      objc_copyWeak(&v67, (id *)buf);
                      v65 = v4;
                      v66 = v63;
                      v68 = v61;
                      objc_msgSend(v55, "interactor:showingModeRestriction:continueHandler:", self, v57, v64);

                      objc_destroyWeak(&v67);
                      objc_destroyWeak((id *)buf);
                      goto LABEL_57;
                    }
                  }
                  else
                  {

                  }
                }
LABEL_56:
                -[SHSheetInteractor _startPerformingActivity:collaborationItem:skipCollaborationPerformer:](self, "_startPerformingActivity:collaborationItem:skipCollaborationPerformer:", v4, v63, v61);
LABEL_57:

                goto LABEL_58;
              }
LABEL_45:

              if ((v46 & 1) != 0)
                goto LABEL_50;
              goto LABEL_56;
            }
          }
          else
          {
            v58 = v43 == 0;
            objc_msgSend(v4, "activityType");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v47, "isEqual:", CFSTR("com.apple.UIKit.activity.AirDrop"));

            if (v58)
              goto LABEL_48;
          }

          if (v40 != 1)
            goto LABEL_49;
          goto LABEL_45;
        }
        v46 = 1;
        goto LABEL_48;
      }

    }
    goto LABEL_35;
  }
  -[SHSheetInteractor collaborationPerformer](self, "collaborationPerformer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancel");

  -[SHSheetInteractor setCollaborationPerformer:](self, "setCollaborationPerformer:", 0);
  objc_msgSend(v4, "activityType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetInteractor session](self, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performingActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activityType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "isEqual:", v13);

  if ((v14 & 1) == 0)
    -[SHSheetInteractor _runActivity:](self, "_runActivity:", v4);
LABEL_58:

}

void __34__SHSheetInteractor__runActivity___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v5;
  const __CFString *v6;
  NSObject *v7;
  __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("did not choose");
    if (a2)
      v6 = CFSTR("chose");
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "User %@ to continue", (uint8_t *)&v9, 0xCu);
  }

  if (a2)
  {
    objc_msgSend(WeakRetained, "_startPerformingActivity:collaborationItem:skipCollaborationPerformer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  }
  else
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "activityType");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "Canceling perform for activity %@ due to user's choice in mode restriction alert", (uint8_t *)&v9, 0xCu);

    }
  }

}

- (void)_startPerformingActivity:(id)a3 collaborationItem:(id)a4 skipCollaborationPerformer:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SHSheetActivityPerformer *v18;
  void *v19;
  SHSheetActivityPerformer *v20;
  _QWORD v21[4];
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  -[SHSheetInteractor session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPerformingActivity:", v8);

  if (!v9 || a5)
  {
    -[SHSheetInteractor delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "interactor:willPerformActivity:", self, v8);

    -[SHSheetInteractor _recordActivityViewControllerInteraction](self, "_recordActivityViewControllerInteraction");
    -[SHSheetInteractor delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "interactor:activityPresentationControllerForActivity:", self, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = [SHSheetActivityPerformer alloc];
    -[SHSheetInteractor session](self, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SHSheetActivityPerformer initWithActivity:session:](v18, "initWithActivity:session:", v8, v19);

    -[SHSheetActivityPerformer setDelegate:](v20, "setDelegate:", self);
    -[SHSheetActivityPerformer setPresentationController:](v20, "setPresentationController:", v14);
    -[SHSheetInteractor setActivityPerformer:](self, "setActivityPerformer:", v20);
    location = 0;
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __91__SHSheetInteractor__startPerformingActivity_collaborationItem_skipCollaborationPerformer___block_invoke;
    v21[3] = &unk_1E4002D90;
    objc_copyWeak(&v22, &location);
    -[SHSheetActivityPerformer performWithCompletionHandler:](v20, "performWithCompletionHandler:", v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0D97418]);
    objc_msgSend(v8, "activityType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scale");
    v14 = (void *)objc_msgSend(v11, "initWithCollaborationItem:activityType:deviceScreenScale:", v9, v12);

    objc_msgSend(v14, "setDelegate:", self);
    objc_msgSend(v14, "setCreationDelegate:", self);
    -[SHSheetInteractor setCollaborationPerformer:](self, "setCollaborationPerformer:", v14);
    -[SHSheetInteractor collaborationPerformer](self, "collaborationPerformer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "perform");

  }
}

void __91__SHSheetInteractor__startPerformingActivity_collaborationItem_skipCollaborationPerformer___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didPerformActivityWithResult:", v3);

}

- (void)_deleteSharingURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[SHSheetInteractor session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collaborationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v7 == 1)
  {
    -[SHSheetInteractor session](self, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collaborationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "containerSetupInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__SHSheetInteractor__deleteSharingURL___block_invoke;
  v13[3] = &unk_1E4002DB8;
  v14 = v4;
  v12 = v4;
  objc_msgSend(v11, "deleteSharingURL:containerSetupInfo:completionHandler:", v12, v10, v13);

}

void __39__SHSheetInteractor__deleteSharingURL___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    share_sheet_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __39__SHSheetInteractor__deleteSharingURL___block_invoke_cold_1(a1, (uint64_t)v4, v5);

  }
  share_sheet_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "Sharing URL was removed successfully:%@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)_didPerformActivityWithResult:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "completedState") == 4 || objc_msgSend(v4, "completedState") == 3;
  -[SHSheetInteractor session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCollaborative");

  if (v7 && v5)
  {
    v8 = (void *)MEMORY[0x1E0D97420];
    -[SHSheetInteractor session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collaborationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "canDeleteShareForCollaborationItem:", v10);

    if ((_DWORD)v8)
    {
      -[SHSheetInteractor collaborationPerformer](self, "collaborationPerformer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cloudSharingResult");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sharingURL");
      v13 = objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        share_sheet_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "activity");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "activityType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 138412546;
          v37 = v16;
          v38 = 2112;
          v39 = v13;
          _os_log_impl(&dword_19E419000, v14, OS_LOG_TYPE_DEFAULT, "Activity failed:%@ - delete sharing URL:%@", (uint8_t *)&v36, 0x16u);

        }
        -[SHSheetInteractor _deleteSharingURL:](self, "_deleteSharingURL:", v13);
      }
    }
    else
    {
      share_sheet_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "activity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "activityType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138412290;
        v37 = v18;
        _os_log_impl(&dword_19E419000, v13, OS_LOG_TYPE_DEFAULT, "Activity failed:%@ - can't delete post share", (uint8_t *)&v36, 0xCu);

      }
    }

  }
  if (!v5)
  {
    -[SHSheetInteractor session](self, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "collaborationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[SHSheetInteractor serviceManager](self, "serviceManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[SHSheetInteractor session](self, "session");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "numberWithBool:", objc_msgSend(v23, "isCollaborative"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "contentIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "saveCollaborativeMode:forContentIdentifier:", v24, v25);

    objc_msgSend(v20, "additionalContentIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      -[SHSheetInteractor serviceManager](self, "serviceManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x1E0CB37E8];
      -[SHSheetInteractor session](self, "session");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "numberWithBool:", objc_msgSend(v29, "isCollaborative"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "saveCollaborativeMode:forContentIdentifier:", v30, v26);

    }
  }
  -[SHSheetInteractor delegate](self, "delegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "interactor:didPerformActivityWithResult:", self, v4);

  -[SHSheetInteractor setActivityPerformer:](self, "setActivityPerformer:", 0);
  -[SHSheetInteractor setCollaborationPerformer:](self, "setCollaborationPerformer:", 0);
  -[SHSheetInteractor session](self, "session");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setPerformingActivity:", 0);

  -[SHSheetInteractor session](self, "session");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setCurrentPeopleSuggestion:", 0);

  -[SHSheetInteractor session](self, "session");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "collaborationItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setCloudSharingResult:", 0);

}

- (id)_prepareActivityProxyForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[SHSheetInteractor session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activitySpecificMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_willPerformInServiceActivityType:activitySpecificMetadata:", v7, v8);

  +[_UIShareServiceActivityProxy activityProxyForServiceActivityDataRequest:](_UIShareServiceActivityProxy, "activityProxyForServiceActivityDataRequest:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetInteractor session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activitiesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addActivity:", v9);

  return v9;
}

- (void)sessionConfigurationDidChangeForSession:(id)a3
{
  id v4;

  -[SHSheetInteractor delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactorDidUpdateSessionConfiguration:", self);

}

- (void)showOptionsDidChangeForSession:(id)a3
{
  id v4;

  -[SHSheetInteractor delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactorDidUpdateObjectManipulationSupport:", self);

}

- (void)headerMetadataDidChangeForSession:(id)a3
{
  id v4;

  -[SHSheetInteractor delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactorDidUpdateHeaderMetadata:", self);

}

- (void)isCollaborativeDidChangeForSession:(id)a3
{
  id v4;

  -[SHSheetInteractor delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactorDidUpdateCollaborationDetails:", self);

}

- (void)collaborationFooterViewModelDidChangeForSession:(id)a3
{
  id v4;

  -[SHSheetInteractor delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactorDidUpdateCollaborationDetails:", self);

}

- (id)collaborationSharingResultForActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SHSheetInteractor collaborationPerformer](self, "collaborationPerformer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "isEqual:", v7);
  if ((_DWORD)v4)
  {
    -[SHSheetInteractor collaborationPerformer](self, "collaborationPerformer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cloudSharingResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)session:(id)a3 didChangeMetadata:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SHSheetInteractor delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactor:didChangeMetadata:", self, v5);

}

- (void)serviceManager:(id)a3 performActivity:(id)a4
{
  id v5;

  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SHSheetInteractor _performActivity:](self, "_performActivity:", v5);

}

- (void)serviceManager:(id)a3 performUserDefaultsActivityWithContext:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SHSheetInteractor delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactor:didPerformUserDefaultsActivityWithContext:", self, v5);

}

- (void)serviceManager:(id)a3 performAirdropViewActivityWithNoContentView:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SHSheetInteractor delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactor:didPerformAirdropViewActivityWithNoContentView:", self, v4);

}

- (void)serviceManager:(id)a3 didUpdateAirDropTransferWithChange:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SHSheetInteractor delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "interactor:didUpdateAirDropTransferWithChange:", self, v5);

}

- (void)serviceManager:(id)a3 willPerformActivityInServiceForRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id location;
  uint64_t v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SHSheetInteractor session](self, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performingActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[SHSheetInteractor session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "performingActivity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activityType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqual:", CFSTR("com.apple.UIKit.activity.AirDrop"));

    if ((v15 & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v35 = *MEMORY[0x1E0CB2D50];
      v36[0] = CFSTR("An other activity is currently performing.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sharesheet.activity-request"), -1, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v18);
      goto LABEL_12;
    }
  }
  else
  {

  }
  -[SHSheetInteractor _prepareActivityProxyForRequest:](self, "_prepareActivityProxyForRequest:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  location = 0;
  objc_initWeak(&location, self);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke;
  v30[3] = &unk_1E4001F88;
  objc_copyWeak(&v33, &location);
  v31 = v8;
  v32 = v9;
  objc_msgSend(v18, "setDidFinishPreparingForExecution:", v30);
  -[SHSheetInteractor session](self, "session");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activityViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "airDropDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v22 = 1;
  else
    v22 = objc_opt_respondsToSelector();
  objc_msgSend(v18, "activityType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqual:", CFSTR("com.apple.UIKit.activity.AirDrop"));

  if ((v24 & v22) != 0)
  {
    -[SHSheetInteractor session](self, "session");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke_3;
    v28[3] = &unk_1E4002E08;
    v28[4] = self;
    v29 = v18;
    +[_UIActivityRecipientManager requestRecipientsV2ForSessionID:completionHandler:](_UIActivityRecipientManager, "requestRecipientsV2ForSessionID:completionHandler:", v26, v28);

  }
  else
  {
    -[SHSheetInteractor _performActivity:](self, "_performActivity:", v18);
  }

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
LABEL_12:

}

void __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "activityPerformer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activityItemsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke_2;
    v9[3] = &unk_1E4002DE0;
    v8 = *(_QWORD *)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v7, "loadItemProvidersForRequest:activity:completion:", v8, v5, v9);

  }
}

uint64_t __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke_4;
  block[3] = &unk_1E4001730;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __86__SHSheetInteractor_serviceManager_willPerformActivityInServiceForRequest_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "interactor:airDropViewServiceWillStartTransferToRecipient:", *(_QWORD *)(a1 + 40), v3);

  }
  objc_msgSend(*(id *)(a1 + 40), "_performActivity:", *(_QWORD *)(a1 + 48));

}

- (void)serviceManager:(id)a3 didPerformInServiceActivityWithIdentifier:(id)a4 completed:(BOOL)a5 items:(id)a6 error:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;

  v9 = a5;
  v11 = a4;
  v12 = a6;
  v13 = a7;
  -[SHSheetInteractor activityPerformer](self, "activityPerformer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activityUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && (objc_msgSend(v11, "isEqual:", v16) & 1) != 0)
  {
    -[SHSheetInteractor activityPerformer](self, "activityPerformer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activityDidFinish:items:error:", v9, v12, v13);

  }
  else
  {
    share_sheet_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SHSheetInteractor serviceManager:didPerformInServiceActivityWithIdentifier:completed:items:error:].cold.1((uint64_t)v11, (uint64_t)v16, v19);

  }
}

- (id)serviceManager:(id)a3 identificationResultsFromSuggestedImageData:(id)a4
{
  return +[SHSheetImageIdentificationUtilities personIdResultsFromImage:](SHSheetImageIdentificationUtilities, "personIdResultsFromImage:", a4);
}

- (void)_recordActivityViewControllerInteraction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[SHSheetInteractor activityPerformer](self, "activityPerformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SHSheetInteractor session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activityViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "readyToInteractTimestamp"))
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_make_with_pointer(v8, v4);

    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      v21 = 134349056;
      v22 = objc_msgSend(v6, "readyToInteractTimestamp");
      _os_signpost_emit_with_name_impl(&dword_19E419000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Interact", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v21, 0xCu);
    }

    share_sheet_log();
    v10 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_make_with_pointer(v11, v4);

    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v10, OS_SIGNPOST_INTERVAL_END, v12, "Interact", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
    }

    share_sheet_log();
    v13 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_make_with_pointer(v14, v4);

    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v16 = objc_msgSend(v6, "readyToInteractTimestamp");
      objc_msgSend(v4, "activityType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 134349314;
      v22 = v16;
      v23 = 2114;
      v24 = v17;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "InteractWithType", "%{public, signpost.description:begin_time}llu activityType=%{public, signpost.telemetry:string1}@", (uint8_t *)&v21, 0x16u);

    }
    share_sheet_log();
    v18 = objc_claimAutoreleasedReturnValue();
    share_sheet_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_id_make_with_pointer(v19, v4);

    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_19E419000, v18, OS_SIGNPOST_INTERVAL_END, v20, "InteractWithType", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
    }

    objc_msgSend(v6, "setReadyToInteractTimestamp:", 0);
  }

}

- (void)_recordActivityInteractionForResult:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "completedState");
  -[SHSheetInteractor session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "viewWillAppearTimestamp"))
  {
    if (v5 == 5)
    {
      share_sheet_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v8))
      {
        v14 = 134349056;
        v15 = objc_msgSend(v7, "viewWillAppearTimestamp");
        _os_signpost_emit_with_name_impl(&dword_19E419000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UserShare.Success", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0xCu);
      }

      share_sheet_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_signpost_enabled(v9))
        goto LABEL_17;
      LOWORD(v14) = 0;
      v10 = "UserShare.Success";
    }
    else
    {
      objc_msgSend(v4, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      share_sheet_log();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_signpost_enabled(v12);
      if (v11)
      {
        if (v13)
        {
          v14 = 134349056;
          v15 = objc_msgSend(v7, "viewWillAppearTimestamp");
          _os_signpost_emit_with_name_impl(&dword_19E419000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UserShare.Error", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0xCu);
        }

        share_sheet_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_signpost_enabled(v9))
          goto LABEL_17;
        LOWORD(v14) = 0;
        v10 = "UserShare.Error";
      }
      else
      {
        if (v13)
        {
          v14 = 134349056;
          v15 = objc_msgSend(v7, "viewWillAppearTimestamp");
          _os_signpost_emit_with_name_impl(&dword_19E419000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UserShare.Cancel", "%{public, signpost.description:begin_time}llu", (uint8_t *)&v14, 0xCu);
        }

        share_sheet_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_signpost_enabled(v9))
          goto LABEL_17;
        LOWORD(v14) = 0;
        v10 = "UserShare.Cancel";
      }
    }
    _os_signpost_emit_with_name_impl(&dword_19E419000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v10, " enableTelemetry=YES ", (uint8_t *)&v14, 2u);
LABEL_17:

    objc_msgSend(v7, "setViewWillAppearTimestamp:", 0);
  }

}

- (id)linkMetadataForActivityPerformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SHSheetInteractor delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "interactor:linkMetadataForActivity:", self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)createSharingURLForCollaborationRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "createSharingURLForCollaborationRequest:completionHandler:", v7, v6);

}

- (void)createSharingURLWithParticipantsForCollaborationRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SHSheetInteractor delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interactor:createSharingURLWithParticipantsForCollaborationRequest:completionHandler:", self, v7, v6);

}

- (void)addParticipantsAllowedForCollaborationItem:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0D97420];
  v7 = a4;
  v8 = a3;
  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addParticipantsAllowedForCollaborationItem:collaborationService:completionHandler:", v8, v9, v7);

}

- (void)shareStatusForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SHSheetInteractor serviceManager](self, "serviceManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shareStatusForURL:completionHandler:", v7, v6);

}

- (void)canShareFolderContainingExistingSharedItemsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHSheetInteractor delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactor:canShareFolderContainingExistingSharedItemsWithCompletionHandler:", self, v4);

}

- (void)canManageShareForDocumentInSharedFolderWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SHSheetInteractor delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactor:canManageShareForDocumentInSharedFolderWithCompletionHandler:", self, v4);

}

- (void)manageShareForDocumentInSharedFolder
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_19E419000, a2, OS_LOG_TYPE_ERROR, "Unable to perform Manage Share because canPerform returned NO for file collaboration item with URL %@", (uint8_t *)&v4, 0xCu);

}

- (void)didBeginCreationForCollaborationPerformer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(a3, "requiresParticipants") & 1) == 0)
  {
    -[SHSheetInteractor delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SHSheetInteractor session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performingActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interactor:creatingCollaborationForActivity:", self, v5);

  }
}

- (void)didFinishCreationForCollaborationPerformer:(id)a3
{
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
  id v16;

  v16 = a3;
  if ((objc_msgSend(v16, "requiresParticipants") & 1) == 0)
  {
    -[SHSheetInteractor delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetInteractor session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "performingActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactor:didCreateCollaborationForActivity:", self, v6);

  }
  objc_msgSend(v16, "cloudSharingResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharingURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SHSheetInteractor session](self, "session");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performingActivity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetInteractor _runActivity:](self, "_runActivity:", v10);

  }
  else
  {
    -[SHSheetInteractor delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetInteractor session](self, "session");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "performingActivity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cloudSharingResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "interactor:didFailCreatingCollaborationForActivity:error:", self, v13, v15);

    -[SHSheetInteractor setCollaborationPerformer:](self, "setCollaborationPerformer:", 0);
  }

}

- (void)didCancelCreationForCollaborationPerformer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if ((objc_msgSend(a3, "requiresParticipants") & 1) == 0)
  {
    -[SHSheetInteractor delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SHSheetInteractor session](self, "session");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performingActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interactor:didCancelCollaborationForActivity:", self, v5);

  }
}

- (void)didFailCreationForCollaborationPerformer:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  -[SHSheetInteractor delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SHSheetInteractor session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performingActivity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interactor:didFailCreatingCollaborationForActivity:error:", self, v7, v5);

}

- (SHSheetInteractorDelegate)delegate
{
  return (SHSheetInteractorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SHSheetActivityPerformerPresentationInterface)activityPresentationController
{
  return (SHSheetActivityPerformerPresentationInterface *)objc_loadWeakRetained((id *)&self->_activityPresentationController);
}

- (void)setActivityPresentationController:(id)a3
{
  objc_storeWeak((id *)&self->_activityPresentationController, a3);
}

- (SHSheetSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (SHSheetServiceManager)serviceManager
{
  return self->_serviceManager;
}

- (void)setServiceManager:(id)a3
{
  objc_storeStrong((id *)&self->_serviceManager, a3);
}

- (SHSheetActivityPerformer)activityPerformer
{
  return self->_activityPerformer;
}

- (void)setActivityPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_activityPerformer, a3);
}

- (SFCollaborationPerformer)collaborationPerformer
{
  return self->_collaborationPerformer;
}

- (void)setCollaborationPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationPerformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationPerformer, 0);
  objc_storeStrong((id *)&self->_activityPerformer, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_activityPresentationController);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)performActivity:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "activityPerformer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_5_0(&dword_19E419000, a3, v5, "Trying to perform %@ but there is already an activity performing:%@", v6);

  OUTLINED_FUNCTION_1();
}

void __39__SHSheetInteractor__deleteSharingURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_5_0(&dword_19E419000, a3, (uint64_t)a3, "error while removing sharingURL:%@ error:%@", (uint8_t *)&v4);
}

- (void)serviceManager:(NSObject *)a3 didPerformInServiceActivityWithIdentifier:completed:items:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_5_0(&dword_19E419000, a3, (uint64_t)a3, "Attempted to call didPerformInServiceActivity for identifier %@ when current activity has identifier %@", (uint8_t *)&v3);
}

@end
