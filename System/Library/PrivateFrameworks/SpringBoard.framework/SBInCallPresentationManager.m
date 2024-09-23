@implementation SBInCallPresentationManager

- (BOOL)isHostingAnApp
{
  void *v2;
  char v3;

  -[SBInCallPresentationManager _hostedPresentationSessions](self, "_hostedPresentationSessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", &__block_literal_global_170);

  return v3;
}

- (id)_hostedPresentationSessions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NSMutableDictionary allValues](self->_clientIdentifierToPresentationSession, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];
  -[NSMutableArray arrayByAddingObjectsFromArray:](self->_pendingInvalidationSessions, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = v3;
  v7 = v5;

  return v7;
}

- (void)sceneManager:(id)a3 didAddScene:(id)a4
{
  -[SBInCallPresentationManager _runZombieChecksForScene:](self, "_runZombieChecksForScene:", a4);
}

- (BOOL)hasOverrideAppSceneEntityForLaunchingApplication:(id)a3
{
  void *v3;
  BOOL v4;

  -[SBInCallPresentationManager overrideAppSceneEntityForLaunchingApplication:](self, "overrideAppSceneEntityForLaunchingApplication:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)overrideAppSceneEntityForLaunchingApplication:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_clientIdentifierToPresentationSession, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "overrideAppSceneEntityForLaunchingApplication:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)canHandleOpenApplicationRequestForApplication:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.InCallService")))
  {
    objc_msgSend(v3, "processState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isRunning");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)disablesSystemVolumeHUDForCategory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NSMutableDictionary allValues](self->_clientIdentifierToPresentationSession, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__SBInCallPresentationManager_disablesSystemVolumeHUDForCategory___block_invoke;
  v9[3] = &unk_1E8EAF6E8;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v9);

  return v7;
}

- (void)_runZombieChecksForScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identity");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sceneManagerForDisplayIdentity:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "existingSceneHandleForScene:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[SBInCallPresentationManager _runZombieChecksForSceneHandle:](self, "_runZombieChecksForSceneHandle:", v9);

}

- (void)_runZombieChecksForSceneHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(v4, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.InCallService"));

  if (v7)
  {
    objc_msgSend(v4, "sceneIfExists");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "persistenceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[SBInCallPresentationManager _hasPendingDismissalOfSceneHandleWithPersistenceIdentifier:](self, "_hasPendingDismissalOfSceneHandleWithPersistenceIdentifier:", v9);

      objc_msgSend(v4, "persistenceIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11
        && !v10
        && !-[SBInCallPresentationManager _isManagingSceneOrSceneHandleWithPersistenceIdentifier:](self, "_isManagingSceneOrSceneHandleWithPersistenceIdentifier:", v11))
      {
        SBLogInCallPresentation();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[SBInCallPresentationManager _runZombieChecksForSceneHandle:].cold.1((uint64_t)v4, v12, v13, v14, v15, v16, v17, v18);

      }
    }
  }

}

- (SBInCallPresentationManager)initWithWindowSceneManager:(id)a3 applicationController:(id)a4 bannerManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  SBInCallPresentationManager *v12;
  SBInCallPresentationManager *v13;
  SBInCallPresentationRequestServer *v14;
  SBInCallPresentationRequestServer *presentationRequestServer;
  SBInCallBannerAuthority *v16;
  SBInCallBannerAuthority *inCallBannerAuthority;
  SBInCallBannerAuthority *v18;
  void *v19;
  SBExpanseBannerAuthority *v20;
  SBExpanseBannerAuthority *expanseBannerAuthority;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  BSCompoundAssertion *nonModalSuppressionAssertions;
  _QWORD v30[4];
  id v31;
  id location;
  objc_super v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v33.receiver = self;
  v33.super_class = (Class)SBInCallPresentationManager;
  v12 = -[SBInCallPresentationManager init](&v33, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_windowSceneManager, a3);
    objc_storeStrong((id *)&v13->_applicationController, a4);
    v14 = objc_alloc_init(SBInCallPresentationRequestServer);
    presentationRequestServer = v13->_presentationRequestServer;
    v13->_presentationRequestServer = v14;

    -[SBInCallPresentationRequestServer setDelegate:](v13->_presentationRequestServer, "setDelegate:", v13);
    -[SBInCallPresentationRequestServer activate](v13->_presentationRequestServer, "activate");
    v16 = objc_alloc_init(SBInCallBannerAuthority);
    inCallBannerAuthority = v13->_inCallBannerAuthority;
    v13->_inCallBannerAuthority = v16;

    v18 = v13->_inCallBannerAuthority;
    +[SBInCallBannerPresentableViewController requesterIdentifier](SBInCallBannerPresentableViewController, "requesterIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerAuthority:forRequesterIdentifier:", v18, v19);

    v20 = objc_alloc_init(SBExpanseBannerAuthority);
    expanseBannerAuthority = v13->_expanseBannerAuthority;
    v13->_expanseBannerAuthority = v20;

    objc_msgSend(v11, "registerAuthority:forRequesterIdentifier:", v13->_expanseBannerAuthority, CFSTR("com.apple.ConversationKit"));
    objc_msgSend(MEMORY[0x1E0D23068], "storeForApplication:", CFSTR("com.apple.InCallService"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeAllSceneDataStores");

    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:", v13);

    objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "registerBacklightEnvironmentSceneProvider:", v13);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v13, sel__ringerButtonDown_, *MEMORY[0x1E0DAC378], 0);

    objc_initWeak(&location, v13);
    v26 = (void *)MEMORY[0x1E0D01718];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __94__SBInCallPresentationManager_initWithWindowSceneManager_applicationController_bannerManager___block_invoke;
    v30[3] = &unk_1E8EA3688;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v26, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("Non Modal Call Suppression Assertion"), v30);
    v27 = objc_claimAutoreleasedReturnValue();
    nonModalSuppressionAssertions = v13->_nonModalSuppressionAssertions;
    v13->_nonModalSuppressionAssertions = (BSCompoundAssertion *)v27;

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __94__SBInCallPresentationManager_initWithWindowSceneManager_applicationController_bannerManager___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_evaluateNonModalSuppressionAssertions");

}

- (id)acquireNonModalSuppressionAssertionForReason:(id)a3
{
  return (id)-[BSCompoundAssertion acquireForReason:](self->_nonModalSuppressionAssertions, "acquireForReason:", a3);
}

- (BOOL)_shouldSuppressNonModalCalls
{
  return -[BSCompoundAssertion isActive](self->_nonModalSuppressionAssertions, "isActive");
}

- (void)_evaluateNonModalSuppressionAssertions
{
  _BOOL8 v3;
  void *v4;
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
  v3 = -[SBInCallPresentationManager _shouldSuppressNonModalCalls](self, "_shouldSuppressNonModalCalls");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_clientIdentifierToPresentationSession, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setNonModalPresentationsSuppressed:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)inCallClientPresentationSession:(id)a3 handleDestroySceneActionWithReason:(int64_t)a4 analyticsSource:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  NSMutableDictionary *clientIdentifierToPresentationSession;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t, _BYTE *);
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__58;
  v32 = __Block_byref_object_dispose__58;
  v33 = 0;
  clientIdentifierToPresentationSession = self->_clientIdentifierToPresentationSession;
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __125__SBInCallPresentationManager_inCallClientPresentationSession_handleDestroySceneActionWithReason_analyticsSource_completion___block_invoke;
  v25 = &unk_1E8EAF6C0;
  v13 = v9;
  v26 = v13;
  v27 = &v28;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientIdentifierToPresentationSession, "enumerateKeysAndObjectsUsingBlock:", &v22);
  if (v29[5])
  {
    SBLogInCallPresentation();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "sceneHandle", v22, v23, v24, v25);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sceneIdentifier");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      SBSUIInCallWindowSceneSessionDestructionReasonDescription();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v35 = v16;
      v36 = 2114;
      v37 = v17;
      v38 = 2114;
      v39 = v10;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Dismissing client with scene identifier %{public}@ from destroy scene action request with reason %{public}@, analyticsSource: %{public}@", buf, 0x20u);

    }
    -[SBInCallPresentationManager _dismissClientWithIdentifier:animated:analyticsSource:reason:completion:](self, "_dismissClientWithIdentifier:animated:analyticsSource:reason:completion:", v29[5], 1, v10, CFSTR("client request"), v11);
  }
  else
  {
    SBLogInCallPresentation();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "sceneHandle", v22, v23, v24, v25);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sceneIdentifier");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      SBSUIInCallWindowSceneSessionDestructionReasonDescription();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v20;
      v36 = 2114;
      v37 = v21;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "Failed to find client identifier for scene identifier %{public}@ to handle destroy scene action with reason %{public}@", buf, 0x16u);

    }
    if (v11)
      v11[2](v11, 1);
  }

  _Block_object_dispose(&v28, 8);
}

void __125__SBInCallPresentationManager_inCallClientPresentationSession_handleDestroySceneActionWithReason_analyticsSource_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

- (void)inCallClientPresentationSessionSceneWasDestroyed:(id)a3
{
  id v4;
  NSMutableDictionary *clientIdentifierToPresentationSession;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__58;
  v23 = __Block_byref_object_dispose__58;
  v24 = 0;
  clientIdentifierToPresentationSession = self->_clientIdentifierToPresentationSession;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __80__SBInCallPresentationManager_inCallClientPresentationSessionSceneWasDestroyed___block_invoke;
  v16 = &unk_1E8EAF6C0;
  v6 = v4;
  v17 = v6;
  v18 = &v19;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientIdentifierToPresentationSession, "enumerateKeysAndObjectsUsingBlock:", &v13);
  if (v20[5])
  {
    SBLogInCallPresentation();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "sceneHandle", v13, v14, v15, v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sceneIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v9;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Dismissing client with scene identifier %{public}@ due to scene destruction", buf, 0xCu);

    }
    -[SBInCallPresentationManager _dismissClientWithIdentifier:animated:analyticsSource:reason:completion:](self, "_dismissClientWithIdentifier:animated:analyticsSource:reason:completion:", v20[5], 0, *MEMORY[0x1E0DAC808], CFSTR("inCallClientPresentationSessionSceneWasDestroyed"), 0);
  }
  else
  {
    SBLogInCallPresentation();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "sceneHandle", v13, v14, v15, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sceneIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v12;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Already removed client identifier %{public}@ from set of presentation sessions which means we think we already have handled inCallClientPresentationSessionSceneWasDestroyed and can safely do nothing.", buf, 0xCu);

    }
  }

  _Block_object_dispose(&v19, 8);
}

void __80__SBInCallPresentationManager_inCallClientPresentationSessionSceneWasDestroyed___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8;
  id v9;

  v8 = a2;
  if (*(_QWORD *)(a1 + 32) == a3)
  {
    v9 = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v8 = v9;
    *a4 = 1;
  }

}

- (int64_t)inCallClientPresentationSessionInterfaceOrientationForBannerPresentation:(id)a3
{
  SBInCallPresentationManagerDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  int64_t v8;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v5, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(WeakRetained, "inCallPresentationManager:interfaceOrientationForBannerPresentationInWindowScene:", self, v7);
  return v8;
}

- (int64_t)inCallClientPresentationSessionInterfaceOrientationForTransientOverlayPresentation:(id)a3
{
  SBInCallPresentationManagerDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  int64_t v8;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v5, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(WeakRetained, "inCallPresentationManager:interfaceOrientationForTransientOverlayPresentationInWindowScene:", self, v7);
  return v8;
}

- (void)inCallClientPresentationSession:(id)a3 callConnectedStatusChangedForPresentableViewController:(id)a4
{
  -[SBInCallBannerAuthority mayChangeDecisionForResponsiblePresentable:](self->_inCallBannerAuthority, "mayChangeDecisionForResponsiblePresentable:", a4);
}

- (id)inCallClientPresentationSession:(id)a3 acquireHideSharePlayContentFromClonedDisplaysAssertionForReason:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBInCallPresentationManager hideSharePlayContentFromSharedScreenController](self, "hideSharePlayContentFromSharedScreenController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "acquireHideSharePlayContentFromClonedDisplaysAssertionForReason:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)inCallClientPresentationSession:(id)a3 canRestoreToPreviousEntity:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  objc_msgSend(a3, "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceApplicationSceneEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sceneHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "application");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "application");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqual:", v11) & 1) == 0)
  {

    v15 = 1;
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(v9, "persistenceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistenceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToString:", v13);

  if ((v14 & 1) == 0)
  {
    -[NSMutableDictionary allValues](self->_clientIdentifierToPresentationSession, "allValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __90__SBInCallPresentationManager_inCallClientPresentationSession_canRestoreToPreviousEntity___block_invoke;
    v18[3] = &unk_1E8EAF6E8;
    v19 = v9;
    v15 = objc_msgSend(v16, "bs_containsObjectPassingTest:", v18);

    v10 = v19;
    goto LABEL_6;
  }
  v15 = 1;
LABEL_7:

  return v15;
}

uint64_t __90__SBInCallPresentationManager_inCallClientPresentationSession_canRestoreToPreviousEntity___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_msgSend(v3, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
    v5 = objc_msgSend(v3, "canBeRestored");
  else
    v5 = 0;

  return v5;
}

- (BOOL)inCallClientPresentationSessionAmbientPresentationActive:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[SBInCallPresentationManager windowSceneManager](self, "windowSceneManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDisplayWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ambientPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPresented");

  return v6;
}

- (void)inCallPresentationRequestServer:(id)a3 clientWithIdentifier:(id)a4 requestsPresentationWithConfiguration:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v10, "sceneBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationController applicationWithBundleIdentifier:](self->_applicationController, "applicationWithBundleIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v9;
  v20 = v10;
  v21 = v12;
  v22 = v11;
  v14 = v12;
  v15 = v10;
  v16 = v13;
  v17 = v11;
  v18 = v9;
  BSDispatchMain();

}

void __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  _QWORD v69[4];
  id v70;
  id v71;
  uint64_t v72;
  id v73;
  id v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    SBLogInCallPresentation();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v76 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Skipping presentation for client with identifier %{public}@ because there is already a presentation session", buf, 0xCu);
    }

    v5 = *(_QWORD *)(a1 + 72);
    if (v5)
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
    return;
  }
  v6 = *(void **)(a1 + 48);
  if (v6)
  {
    objc_msgSend(v6, "processState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isRunning");

    if ((v8 & 1) != 0)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
      objc_msgSend(*(id *)(a1 + 48), "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v10);

      if ((v9 & 1) == 0)
      {
        v11 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(a1 + 32);
          v14 = *(void **)(v13 + 56);
          *(_QWORD *)(v13 + 56) = v12;

          v11 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
        }
        objc_msgSend(*(id *)(a1 + 48), "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v15);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__applicationDidExit_, CFSTR("SBApplicationDidExitNotification"), *(_QWORD *)(a1 + 48));

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "activeDisplayWindowScene");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sceneManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(*(id *)(a1 + 56), "isUserInitiated"))
        v19 = objc_msgSend(*(id *)(a1 + 56), "preferredPresentationMode") == 3;
      else
        v19 = 0;
      objc_msgSend(v18, "displayIdentity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v33, "isContinuityDisplay"))
      {
        v34 = objc_msgSend(*(id *)(a1 + 56), "shouldPreferContinuityDisplayForFullScreenPresentation") ^ 1 | v19;

        if (v34 != 1)
          goto LABEL_28;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "embeddedDisplayWindowScene");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "sceneManager");
        v35 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v35;
      }

LABEL_28:
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "containsObject:", v18) & 1) == 0)
      {
        objc_msgSend(v18, "addObserver:", *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", v18);
      }
      v36 = *(_QWORD *)(a1 + 48);
      v37 = (void *)objc_msgSend(v18, "newSceneIdentityForApplication:", v36);
      objc_msgSend(v18, "displayIdentity");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBApplicationSceneHandleRequest defaultRequestForApplication:sceneIdentity:displayIdentity:](SBApplicationSceneHandleRequest, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v36, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "sceneDefinition");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v40, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0DAC4E0], "specification");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setSpecification:", v42);

      objc_msgSend(v39, "setSceneDefinition:", v41);
      v43 = objc_msgSend(*(id *)(a1 + 56), "preferredPresentationMode");
      v44 = objc_opt_class();
      objc_msgSend(v18, "fetchOrCreateApplicationSceneHandleForRequest:", v39);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      SBSafeCast(v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (v46)
      {
        if ((v43 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "isUILocked");

          if ((v48 & 1) == 0)
          {
            +[SBAssistantController sharedInstanceIfExists](SBAssistantController, "sharedInstanceIfExists");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "dismissAssistantViewInEverySceneIfNecessary");

          }
        }
        v50 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newClientPresentationSessionWithSceneHandle:", v46);
        objc_msgSend(v50, "setNonModalPresentationsSuppressed:", objc_msgSend(*(id *)(a1 + 32), "_shouldSuppressNonModalCalls"));
        if (v50)
        {
          v51 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
          if (!v51)
          {
            v52 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
            v53 = *(_QWORD *)(a1 + 32);
            v54 = *(void **)(v53 + 40);
            *(_QWORD *)(v53 + 40) = v52;

            v51 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
          }
          objc_msgSend(v51, "setObject:forKey:", v50, *(_QWORD *)(a1 + 40));
          objc_msgSend(v50, "setDelegate:", *(_QWORD *)(a1 + 32));
          objc_msgSend(*(id *)(a1 + 56), "preferredBannerHeight");
          objc_msgSend(v50, "setPreferredBannerHeight:");
          SBLogInCallPresentation();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v46, "sceneIdentifier");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            SBSInCallPresentationModeDescription();
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v76 = v56;
            v77 = 2114;
            v78 = v57;
            _os_log_impl(&dword_1D0540000, v55, OS_LOG_TYPE_DEFAULT, "Requesting client presentation session presentation for scene identifier: %{public}@ with initial presentation mode: %{public}@", buf, 0x16u);

          }
          objc_msgSend(v50, "setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:", v43 != 3);
          objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "invalidateBacklightScenesForProvider:", *(_QWORD *)(a1 + 32));

          v59 = *MEMORY[0x1E0DAC7F8];
          v69[0] = MEMORY[0x1E0C809B0];
          v69[1] = 3221225472;
          v69[2] = __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_35;
          v69[3] = &unk_1E8EA0560;
          v60 = *(_QWORD *)(a1 + 56);
          v70 = *(id *)(a1 + 48);
          v61 = v50;
          v62 = *(_QWORD *)(a1 + 32);
          v63 = *(void **)(a1 + 40);
          v71 = v61;
          v72 = v62;
          v73 = v63;
          v74 = *(id *)(a1 + 72);
          objc_msgSend(v61, "presentWithRequestedConfiguration:animated:analyticsSource:completion:", v60, 1, v59, v69);

          v64 = v70;
        }
        else
        {
          SBLogInCallPresentation();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_cold_3();

          v68 = *(_QWORD *)(a1 + 72);
          if (!v68)
            goto LABEL_49;
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBInCallPresentationManagerErrorDomain"), -2004, 0);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v68 + 16))(v68, v64);
        }

      }
      else
      {
        SBLogInCallPresentation();
        v65 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_cold_2();

        v66 = *(_QWORD *)(a1 + 72);
        if (!v66)
          goto LABEL_50;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBInCallPresentationManagerErrorDomain"), -2003, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v66 + 16))(v66, v50);
      }
LABEL_49:

LABEL_50:
      goto LABEL_51;
    }
    SBLogInCallPresentation();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v76 = v32;
      _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_DEFAULT, "Skipping presentation for client with identifier %{public}@ because it is no longer running", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_dismissAllPresentationsForApplication:", *(_QWORD *)(a1 + 48));
    v28 = *(_QWORD *)(a1 + 72);
    if (v28)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = -2003;
      goto LABEL_22;
    }
  }
  else
  {
    SBLogInCallPresentation();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);

    v28 = *(_QWORD *)(a1 + 72);
    if (v28)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = -2002;
LABEL_22:
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("SBInCallPresentationManagerErrorDomain"), v30, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v28 + 16))(v28, v18);
LABEL_51:

    }
  }
}

void __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_35(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "processState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  SBLogInCallPresentation();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Successfully presented %@", buf, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 64);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
  else
  {
    if (v5)
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Immediately dismissing session %{public}@ because the application is no longer running", buf, 0xCu);
    }

    v10 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v11 = *MEMORY[0x1E0DAC808];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_38;
    v12[3] = &unk_1E8E9F230;
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 64);
    objc_msgSend(v10, "_dismissClientWithIdentifier:animated:analyticsSource:reason:completion:", v9, 0, v11, CFSTR("shouldImmediatelyDismiss"), v12);

  }
}

void __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_38(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogInCallPresentation();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138543618;
    v9 = v5;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Immediately dismissed session %{public}@ with success %{BOOL}u", (uint8_t *)&v8, 0x12u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBInCallPresentationManagerErrorDomain"), -2004, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

- (UIEdgeInsets)inCallClientPresentationSessionResolvedPIPDodgingInsets:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  UIEdgeInsets result;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary allValues](self->_clientIdentifierToPresentationSession, "allValues", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "preferredPIPDodgingInsets");
        UIEdgeInsetsMax();
        v4 = v12;
        v3 = v13;
        v6 = v14;
        v5 = v15;
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v16 = v4;
  v17 = v3;
  v18 = v6;
  v19 = v5;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (BOOL)canHostAnApp
{
  return 1;
}

uint64_t __45__SBInCallPresentationManager_isHostingAnApp__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHostingAnApp");
}

- (id)hostedAppSceneHandle
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBInCallPresentationManager.m"), 358, CFSTR("%@ should never be called"), v5);

  return 0;
}

- (id)hostedAppSceneHandles
{
  void *v2;
  void *v3;
  void *v4;

  -[SBInCallPresentationManager _hostedPresentationSessions](self, "_hostedPresentationSessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_compactMap:", &__block_literal_global_47_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_flatten");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __52__SBInCallPresentationManager_hostedAppSceneHandles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hostedAppSceneHandles");
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SBInCallPresentationManager _hostedPresentationSessions](self, "_hostedPresentationSessions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "hostedAppWillRotateToInterfaceOrientation:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
  -[SBInCallPresentationManager _runZombieChecksForSceneHandle:](self, "_runZombieChecksForSceneHandle:", a4);
}

- (void)sceneManagerDidInvalidate:(id)a3
{
  -[NSMutableSet removeObject:](self->_observedSceneManagers, "removeObject:", a3);
}

- (void)sceneManager:(id)a3 willMoveScene:(id)a4 toSceneManager:(id)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBInCallPresentationManager sessionForSceneIdentifier:](self, "sessionForSceneIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (-[NSMutableSet containsObject:](self->_observedSceneManagers, "containsObject:", v9) & 1) == 0)
  {
    objc_msgSend(v9, "addObserver:", self);
    -[NSMutableSet addObject:](self->_observedSceneManagers, "addObject:", v9);
  }

}

- (id)scenesForBacklightSession
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_clientIdentifierToPresentationSession, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "sceneHandle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sceneIfExists");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

+ (BOOL)isSpecializedAPISupported
{
  return 1;
}

- (id)sessionForSceneIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_clientIdentifierToPresentationSession, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "sceneHandle");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sceneIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)supportsHandlingDeviceLock
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_clientIdentifierToPresentationSession, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "supportsHandlingDeviceLock") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)disallowsLockHardwareButtonDoublePress
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_clientIdentifierToPresentationSession, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "disallowsLockHardwareButtonDoublePress") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)supportsBecomingVisibleWhenUnlockingFromSource:(int)a3 wakingDisplay:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_clientIdentifierToPresentationSession, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "supportsBecomingVisibleWhenUnlockingFromSource:wakingDisplay:", v5, v4) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)handleAccessoryAttachWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_clientIdentifierToPresentationSession, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "handleAccessoryAttachWithCompletion:", v4) & 1) != 0)
        {

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v7)
        continue;
      break;
    }
  }

  v4[2](v4, 0);
LABEL_11:

}

- (void)handlePresentationForActivityContinuationIdentifier:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isSpecializedAPISupported"))
  {
    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activateInCallUIWithActivityContinuationIdentifier:", v4);

  }
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_clientIdentifierToPresentationSession, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "handleHeadsetButtonPress:", v3) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)handleDeviceLockFromSource:(int)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id obj;
  _QWORD v27[4];
  id v28;
  void *v29;
  id v30;
  SBInCallPresentationManager *v31;
  uint8_t *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  char v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  SBLogInCallPresentation();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "SBLogInCallPresentationManager handling handleDeviceLockFromSource", buf, 2u);
  }

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_clientIdentifierToPresentationSession, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (objc_msgSend(v9, "supportsHandlingDeviceLock"))
        {
          if (!v5)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 1);
            v5 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v5, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v6);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(v5, "count"))
  {
    *(_QWORD *)buf = 0;
    v38 = buf;
    v39 = 0x2020000000;
    v40 = 0;
    objc_msgSend(v5, "allObjects");
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v34;
      v13 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          v27[0] = v13;
          v27[1] = 3221225472;
          v27[2] = __58__SBInCallPresentationManager_handleDeviceLockFromSource___block_invoke;
          v27[3] = &unk_1E8EAF7B8;
          v28 = v5;
          v29 = v15;
          v32 = buf;
          v30 = WeakRetained;
          v31 = self;
          objc_msgSend(v15, "handleDeviceLockFromSource:completion:", a3, v27);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
      }
      while (v11);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    SBLogInCallPresentation();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SBInCallPresentationManager handleDeviceLockFromSource:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    objc_msgSend(WeakRetained, "inCallPresentationManagerRequestsHandlingOfDeferredUILock:", self);
  }

}

uint64_t __58__SBInCallPresentationManager_handleDeviceLockFromSource___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (!result && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    SBLogInCallPresentation();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v7[0] = 67109120;
      v7[1] = v6;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBLogInCallPresentationManager finished handling handleDeviceLockFromSource, hasAnySessionConsumedLock: %{BOOL}u", (uint8_t *)v7, 8u);
    }

    return objc_msgSend(*(id *)(a1 + 48), "inCallPresentationManagerRequestsHandlingOfDeferredUILock:", *(_QWORD *)(a1 + 56));
  }
  return result;
}

- (void)reactivateInCallForReason:(int64_t)a3
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogInCallPresentation();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 2)
      v5 = CFSTR(".invalid");
    else
      v5 = off_1E8EAF850[a3 - 1];
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Reactivating InCall for reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (!+[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported"))
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inCallTransientOverlayManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentTransientOverlay");

  }
}

- (void)handleOpenApplicationRequest:(id)a3 clientWorkspace:(id)a4 actions:(id)a5 origin:(id)a6 options:(id)a7 withResult:(id)a8
{
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  dispatch_time_t v44;
  id v45;
  void *v46;
  void (**v47)(id, _QWORD);
  void *v48;
  id v49;
  id v50;
  id v51;
  _QWORD block[4];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[6];
  uint8_t v59[128];
  uint8_t buf[4];
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v49 = a4;
  v13 = a5;
  v51 = a6;
  v14 = a7;
  v47 = (void (**)(id, _QWORD))a8;
  SBLogInCallPresentation();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v61 = v51;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Handling open application request from origin %{public}@", buf, 0xCu);
  }

  v16 = (void *)objc_msgSend(v13, "mutableCopy");
  v48 = v14;
  objc_msgSend(v14, "objectForKey:", *MEMORY[0x1E0D22D58]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0DAB820]);

  if (v18)
  {
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = objc_alloc(MEMORY[0x1E0CEA7E0]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("facetime://?showInCallUI=1"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithURL:workspaceOriginatingProcess:", v20, v51);

    objc_msgSend(v16, "addObject:", v21);
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v22 = v13;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v55 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        if (objc_msgSend(v27, "UIActionType") == 1 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v28 = objc_alloc(MEMORY[0x1E0CEA7E0]);
          objc_msgSend(v27, "url");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "workspaceOriginatingProcess");
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v30;
          if (v30)
            v32 = (id)v30;
          else
            v32 = v51;
          v33 = (void *)objc_msgSend(v28, "initWithURL:workspaceOriginatingProcess:", v29, v32);

          objc_msgSend(v16, "removeObject:", v27);
          objc_msgSend(v16, "addObject:", v33);

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v24);
  }

  objc_msgSend(v50, "processState");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "pid");

  if ((_DWORD)v35 != -1)
  {
    objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", v35);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87C80], "attributeWithCompletionPolicy:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v36;
    objc_msgSend(MEMORY[0x1E0D87CB0], "grantWithUserInteractivity");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v58[1] = v37;
    objc_msgSend(MEMORY[0x1E0D87D08], "grantWithForegroundPriority");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v58[2] = v38;
    objc_msgSend(MEMORY[0x1E0D87DD8], "grantWithResistance:", 40);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v58[3] = v39;
    objc_msgSend(MEMORY[0x1E0D87CC8], "grant");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v58[4] = v40;
    objc_msgSend(MEMORY[0x1E0D87DE8], "withReason:", 9);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v58[5] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 6);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87C98]), "initWithExplanation:target:attributes:", CFSTR("SBInCallPresentationManagerHandlingOpenApplication"), v46, v42);
    objc_msgSend(v43, "acquireWithError:", 0);
    v44 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __110__SBInCallPresentationManager_handleOpenApplicationRequest_clientWorkspace_actions_origin_options_withResult___block_invoke;
    block[3] = &unk_1E8E9DED8;
    v53 = v43;
    v45 = v43;
    dispatch_after(v44, MEMORY[0x1E0C80D38], block);

  }
  objc_msgSend(v49, "sendActions:", v16);
  v47[2](v47, 0);

}

uint64_t __110__SBInCallPresentationManager_handleOpenApplicationRequest_clientWorkspace_actions_origin_options_withResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)ensureSwitcherInclusionForRestoringFromPIPForSceneWithPersistenceIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24 = a4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSMutableDictionary allValues](self->_clientIdentifierToPresentationSession, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
      objc_msgSend(v12, "sceneHandle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sceneIfExists");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "settings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_class();
      v17 = v15;
      if (v16)
        v18 = (objc_opt_isKindOfClass() & 1) != 0 ? v17 : 0;
      else
        v18 = 0;
      v19 = v18;

      objc_msgSend(v19, "persistenceIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", v6);

      if ((v21 & 1) != 0)
        break;

      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
    v22 = v12;

    if (!v22)
      goto LABEL_17;
    v23 = v24;
    objc_msgSend(v22, "ensureInclusionInSwitcherForRestoreFromPIPWithCompletion:", v24);

  }
  else
  {
LABEL_14:

LABEL_17:
    v23 = v24;
    (*((void (**)(id, _QWORD))v24 + 2))(v24, 0);
  }

}

- (BOOL)hasFullscreenActiveCallInSwitcher
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SBInCallPresentationManager _hostedPresentationSessions](self, "_hostedPresentationSessions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isFullscreenCallInSwitcher") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (SBHideSharePlayContentFromSharedScreenController)hideSharePlayContentFromSharedScreenController
{
  SBHideSharePlayContentFromSharedScreenController *lazy_hideSharePlayContentFromSharedScreenController;
  SBHideSharePlayContentFromSharedScreenController *v4;
  SBHideSharePlayContentFromSharedScreenController *v5;

  lazy_hideSharePlayContentFromSharedScreenController = self->_lazy_hideSharePlayContentFromSharedScreenController;
  if (!lazy_hideSharePlayContentFromSharedScreenController)
  {
    v4 = objc_alloc_init(SBHideSharePlayContentFromSharedScreenController);
    v5 = self->_lazy_hideSharePlayContentFromSharedScreenController;
    self->_lazy_hideSharePlayContentFromSharedScreenController = v4;

    lazy_hideSharePlayContentFromSharedScreenController = self->_lazy_hideSharePlayContentFromSharedScreenController;
  }
  return lazy_hideSharePlayContentFromSharedScreenController;
}

uint64_t __66__SBInCallPresentationManager_disablesSystemVolumeHUDForCategory___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "disablesSystemVolumeHUDForCategory:", *(_QWORD *)(a1 + 32));
}

- (void)_dismissAllPresentationsForApplication:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  SBInCallPresentationManager *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = (void *)-[NSMutableDictionary copy](self->_clientIdentifierToPresentationSession, "copy");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__SBInCallPresentationManager__dismissAllPresentationsForApplication___block_invoke;
  v10[3] = &unk_1E8EAF7E0;
  v6 = v4;
  v12 = self;
  v13 = &v14;
  v11 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
  if (!*((_BYTE *)v15 + 24))
  {
    v7 = (void *)MEMORY[0x1E0D23068];
    objc_msgSend(v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "storeForApplication:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllSceneDataStores");

  }
  _Block_object_dispose(&v14, 8);

}

void __70__SBInCallPresentationManager__dismissAllPresentationsForApplication___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(a3, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_dismissClientWithIdentifier:animated:analyticsSource:reason:completion:", v8, 1, *MEMORY[0x1E0DAC808], CFSTR("_dismissAllPresentationsForApplication"), 0);
  }

}

- (void)_dismissAllPresentations
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableDictionary copy](self->_clientIdentifierToPresentationSession, "copy");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "keyEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = *MEMORY[0x1E0DAC828];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[SBInCallPresentationManager _dismissClientWithIdentifier:animated:analyticsSource:reason:completion:](self, "_dismissClientWithIdentifier:animated:analyticsSource:reason:completion:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 1, v8, CFSTR("_dismissAllPresentations"), 0);
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (SBInCallPresentationSession)_lastPresentationSession
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allValues](self->_clientIdentifierToPresentationSession, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBInCallPresentationSession *)v3;
}

- (id)_sessionForSceneWithIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *clientIdentifierToPresentationSession;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__58;
  v16 = __Block_byref_object_dispose__58;
  v17 = 0;
  clientIdentifierToPresentationSession = self->_clientIdentifierToPresentationSession;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__SBInCallPresentationManager__sessionForSceneWithIdentifier___block_invoke;
  v9[3] = &unk_1E8EAF808;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clientIdentifierToPresentationSession, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __62__SBInCallPresentationManager__sessionForSceneWithIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(*(_QWORD *)(v9 + 8) + 40))
  {
    objc_msgSend(v7, "sceneHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sceneIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 32));

    v9 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      objc_storeStrong((id *)(*(_QWORD *)(v9 + 8) + 40), a3);
      v9 = *(_QWORD *)(a1 + 40);
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(v9 + 8) + 40))
    *a4 = 1;

}

- (void)_ringerButtonDown:(id)a3
{
  void *v3;
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_clientIdentifierToPresentationSession, "allValues", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "handleRingerButtonDown");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_dismissClientWithIdentifier:(id)a3 animated:(BOOL)a4 analyticsSource:(id)a5 reason:(id)a6 completion:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *pendingInvalidationSessions;
  NSMutableArray *v20;
  NSMutableArray *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  SBInCallPresentationManager *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v10 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[NSMutableDictionary objectForKey:](self->_clientIdentifierToPresentationSession, "objectForKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sceneHandle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sceneIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 && (-[NSMutableArray containsObject:](self->_pendingInvalidationSessions, "containsObject:", v16) & 1) == 0)
  {
    pendingInvalidationSessions = self->_pendingInvalidationSessions;
    if (!pendingInvalidationSessions)
    {
      v20 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v21 = self->_pendingInvalidationSessions;
      self->_pendingInvalidationSessions = v20;

      pendingInvalidationSessions = self->_pendingInvalidationSessions;
    }
    -[NSMutableArray addObject:](pendingInvalidationSessions, "addObject:", v16);
    SBLogInCallPresentation();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = v16;
      v31 = 2114;
      v32 = v14;
      _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEFAULT, "starting to destroy %{public}@ with reason %{public}@", buf, 0x16u);
    }

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __103__SBInCallPresentationManager__dismissClientWithIdentifier_animated_analyticsSource_reason_completion___block_invoke;
    v23[3] = &unk_1E8EAF830;
    v24 = v16;
    v25 = self;
    v26 = v12;
    v27 = v18;
    v28 = v15;
    objc_msgSend(v24, "dismissAndFinalizeSceneDestructionAnimated:analyticsSource:completion:", v10, v13, v23);

  }
  else if (v15)
  {
    (*((void (**)(id, uint64_t))v15 + 2))(v15, 1);
  }

}

uint64_t __103__SBInCallPresentationManager__dismissClientWithIdentifier_animated_analyticsSource_reason_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t result;
  int v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  SBLogInCallPresentation();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v13 = 138543618;
    v14 = v5;
    v15 = 1024;
    v16 = a2;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Destroyed %{public}@ with success %{BOOL}u", (uint8_t *)&v13, 0x12u);
  }

  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "removeObject:", *(_QWORD *)(a1 + 32));
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "count"))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(v6 + 48);
      *(_QWORD *)(v6 + 48) = 0;

    }
  }
  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sceneWithIdentifier:", *(_QWORD *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)a2 && v9)
  {
    SBLogInCallPresentation();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __103__SBInCallPresentationManager__dismissClientWithIdentifier_animated_analyticsSource_reason_completion___block_invoke_cold_2();
  }
  else
  {
    if ((a2 & 1) != 0)
      goto LABEL_14;
    SBLogInCallPresentation();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __103__SBInCallPresentationManager__dismissClientWithIdentifier_animated_analyticsSource_reason_completion___block_invoke_cold_1();
  }

LABEL_14:
  objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidateBacklightScenesForProvider:", *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(a1 + 64);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (id)_newClientPresentationSessionWithSceneHandle:(id)a3
{
  SBInCallPresentationManagerDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "inCallPresentationManager:createPresentationSessionWithSceneHandle:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_applicationDidExit:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBInCallPresentationManager _dismissAllPresentationsForApplication:](self, "_dismissAllPresentationsForApplication:", v4);

}

- (BOOL)_isManagingSceneOrSceneHandleWithPersistenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[NSMutableDictionary allValues](self->_clientIdentifierToPresentationSession, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__SBInCallPresentationManager__isManagingSceneOrSceneHandleWithPersistenceIdentifier___block_invoke;
  v9[3] = &unk_1E8EAF6E8;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v9);

  return v7;
}

uint64_t __86__SBInCallPresentationManager__isManagingSceneOrSceneHandleWithPersistenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistenceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (BOOL)_hasPendingDismissalOfSceneHandleWithPersistenceIdentifier:(id)a3
{
  id v4;
  NSMutableArray *pendingInvalidationSessions;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  pendingInvalidationSessions = self->_pendingInvalidationSessions;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__SBInCallPresentationManager__hasPendingDismissalOfSceneHandleWithPersistenceIdentifier___block_invoke;
  v8[3] = &unk_1E8EAF6E8;
  v9 = v4;
  v6 = v4;
  LOBYTE(pendingInvalidationSessions) = -[NSMutableArray bs_containsObjectPassingTest:](pendingInvalidationSessions, "bs_containsObjectPassingTest:", v8);

  return (char)pendingInvalidationSessions;
}

uint64_t __90__SBInCallPresentationManager__hasPendingDismissalOfSceneHandleWithPersistenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistenceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (SBInCallPresentationManagerDelegate)delegate
{
  return (SBInCallPresentationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBWindowSceneManager)windowSceneManager
{
  return self->_windowSceneManager;
}

- (BOOL)supportsHandlingUILockForWindowedAccessoryAttach
{
  return self->_supportsHandlingUILockForWindowedAccessoryAttach;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lazy_hideSharePlayContentFromSharedScreenController, 0);
  objc_storeStrong((id *)&self->_nonModalSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_observedSceneManagers, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersOfObservedApplications, 0);
  objc_storeStrong((id *)&self->_pendingInvalidationSessions, 0);
  objc_storeStrong((id *)&self->_clientIdentifierToPresentationSession, 0);
  objc_storeStrong((id *)&self->_expanseBannerAuthority, 0);
  objc_storeStrong((id *)&self->_inCallBannerAuthority, 0);
  objc_storeStrong((id *)&self->_presentationRequestServer, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
}

void __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Could not find application for scene bundle ID presentation request", a5, a6, a7, a8, 0);
}

void __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Could not create a scene handle for application with bundle ID %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __133__SBInCallPresentationManager_inCallPresentationRequestServer_clientWithIdentifier_requestsPresentationWithConfiguration_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Could not create a presentation session for application with bundle ID %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)handleDeviceLockFromSource:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "SBLogInCallPresentationManager finished handling handleDeviceLockFromSource, but shouldn't have claimed it could do so", a5, a6, a7, a8, 0);
}

void __103__SBInCallPresentationManager__dismissClientWithIdentifier_animated_analyticsSource_reason_completion___block_invoke_cold_1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_3();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_1D0540000, v1, OS_LOG_TYPE_ERROR, "Dismissal failed for %{public}@ with sceneRemovedFromSceneManager: %{BOOL}u", v2, 0x12u);
  OUTLINED_FUNCTION_2_0();
}

void __103__SBInCallPresentationManager__dismissClientWithIdentifier_animated_analyticsSource_reason_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Failed to successfully destroy %{public}@, which should not be possible", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_runZombieChecksForSceneHandle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "ICSZOMBIE: Found a zombie ICS sceneHandle %{public}@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
