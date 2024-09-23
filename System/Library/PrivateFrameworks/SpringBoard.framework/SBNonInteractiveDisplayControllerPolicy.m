@implementation SBNonInteractiveDisplayControllerPolicy

- (SBNonInteractiveDisplayControllerPolicy)initWithFBSceneManager:(id)a3 monitoredWindowScene:(id)a4 applicationController:(id)a5
{
  id v10;
  id v11;
  id v12;
  SBNonInteractiveDisplayControllerPolicy *v13;
  SBNonInteractiveDisplayControllerPolicy *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayControllerPolicy.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("monitoredWindowScene"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayControllerPolicy.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbSceneManager"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayControllerPolicy.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationController"));

LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)SBNonInteractiveDisplayControllerPolicy;
  v13 = -[SBNonInteractiveDisplayControllerPolicy init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fbSceneManager, a3);
    objc_storeStrong((id *)&v14->_monitoredWindowScene, a4);
    objc_storeStrong((id *)&v14->_applicationController, a5);
    -[SBWindowScene sceneManager](v14->_monitoredWindowScene, "sceneManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addChildTransactionProvider:", v14);

  }
  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBWindowScene sceneManager](self->_monitoredWindowScene, "sceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeChildTransactionProvider:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBNonInteractiveDisplayControllerPolicy;
  -[SBNonInteractiveDisplayControllerPolicy dealloc](&v4, sel_dealloc);
}

- (id)childTransactionsForTransitionRequest:(id)a3
{
  SBSceneHostingDisplayController **p_displayController;
  id v4;
  id WeakRetained;
  void *v6;

  p_displayController = &self->_displayController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_displayController);
  objc_msgSend(WeakRetained, "createTransactionForTransitionRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)displayAssertionPriorityLevel:(id)a3
{
  return 3;
}

- (unint64_t)displayAssertionDeactivationReasons:(id)a3
{
  return 512;
}

- (void)connectToDisplayController:(id)a3 displayConfiguration:(id)a4
{
  void *v6;
  id v7;
  id v8;
  FBSDisplayIdentity *v9;
  FBSDisplayIdentity *displayIdentity;
  FBSDisplayLayoutPublishing *v11;
  FBSDisplayLayoutPublishing *layoutPublisher;
  void *v13;
  void *v14;

  v6 = (void *)MEMORY[0x1E0CB3978];
  v7 = a4;
  v8 = a3;
  if ((objc_msgSend(v6, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBNonInteractiveDisplayControllerPolicy connectToDisplayController:displayConfiguration:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("SBNonInteractiveDisplayControllerPolicy.m"), 122, CFSTR("this call must be made on the main thread"));

  }
  objc_storeWeak((id *)&self->_displayController, v8);
  objc_msgSend(v7, "identity");
  v9 = (FBSDisplayIdentity *)objc_claimAutoreleasedReturnValue();

  displayIdentity = self->_displayIdentity;
  self->_displayIdentity = v9;

  objc_msgSend(v8, "layoutPublisher");
  v11 = (FBSDisplayLayoutPublishing *)objc_claimAutoreleasedReturnValue();

  layoutPublisher = self->_layoutPublisher;
  self->_layoutPublisher = v11;

}

- (void)displayControllerDidDisconnect:(id)a3 sceneManager:(id)a4
{
  FBScene *currentScene;
  id v7;
  id v8;
  _QWORD v9[6];

  currentScene = self->_currentScene;
  v7 = a4;
  -[FBScene removeObserver:](currentScene, "removeObserver:", self);
  objc_msgSend(v7, "allScenes");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__SBNonInteractiveDisplayControllerPolicy_displayControllerDidDisconnect_sceneManager___block_invoke;
  v9[3] = &unk_1E8EB77A8;
  v9[4] = self;
  v9[5] = a2;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

void __87__SBNonInteractiveDisplayControllerPolicy_displayControllerDidDisconnect_sceneManager___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogDisplayControlling();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v4;
    v8 = 2114;
    v9 = v5;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ INVALIDATING scene %{public}@", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(v2, "invalidate");

}

- (void)displayController:(id)a3 didGainControlOfDisplayWithSceneManager:(id)a4
{
  BSInvalidatable *v5;
  BSInvalidatable *currentLayoutElementAssertion;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];

  v8 = a4;
  if (self->_currentLayoutElement)
  {
    -[BSInvalidatable invalidate](self->_currentLayoutElementAssertion, "invalidate");
    -[FBSDisplayLayoutPublishing addElement:](self->_layoutPublisher, "addElement:", self->_currentLayoutElement);
    v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    currentLayoutElementAssertion = self->_currentLayoutElementAssertion;
    self->_currentLayoutElementAssertion = v5;

  }
  objc_msgSend(v8, "allScenes", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__SBNonInteractiveDisplayControllerPolicy_displayController_didGainControlOfDisplayWithSceneManager___block_invoke;
  v10[3] = &unk_1E8EA2978;
  v10[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  self->_previouslyReceivedDeactivationReasons = 0;
}

void __101__SBNonInteractiveDisplayControllerPolicy_displayController_didGainControlOfDisplayWithSceneManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUISubclass");

  if (v4)
  {
    objc_msgSend(v7, "uiSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "setDeactivationReasons:", objc_msgSend(v6, "deactivationReasons") & ~*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    objc_msgSend(v7, "updateSettings:withTransitionContext:", v6, 0);

  }
}

- (void)displayController:(id)a3 sceneManager:(id)a4 didLoseControlOfDisplayWithDeactivationReasons:(unint64_t)a5
{
  BSInvalidatable *currentLayoutElementAssertion;
  id v8;
  BSInvalidatable *v9;
  void *v10;
  _QWORD v11[5];

  currentLayoutElementAssertion = self->_currentLayoutElementAssertion;
  v8 = a4;
  -[BSInvalidatable invalidate](currentLayoutElementAssertion, "invalidate");
  v9 = self->_currentLayoutElementAssertion;
  self->_currentLayoutElementAssertion = 0;

  objc_msgSend(v8, "allScenes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __121__SBNonInteractiveDisplayControllerPolicy_displayController_sceneManager_didLoseControlOfDisplayWithDeactivationReasons___block_invoke;
  v11[3] = &__block_descriptor_40_e21_v24__0__FBScene_8_B16l;
  v11[4] = a5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

  self->_previouslyReceivedDeactivationReasons = a5;
}

void __121__SBNonInteractiveDisplayControllerPolicy_displayController_sceneManager_didLoseControlOfDisplayWithDeactivationReasons___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUISubclass");

  if (v4)
  {
    objc_msgSend(v7, "uiSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "setDeactivationReasons:", *(_QWORD *)(a1 + 32) | objc_msgSend(v6, "deactivationReasons"));
    objc_msgSend(v7, "updateSettings:withTransitionContext:", v6, 0);

  }
}

- (void)displayController:(id)a3 sceneManager:(id)a4 didReceiveNewDeactivationReasons:(unint64_t)a5
{
  void *v7;
  _QWORD v8[6];

  objc_msgSend(a4, "allScenes", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __107__SBNonInteractiveDisplayControllerPolicy_displayController_sceneManager_didReceiveNewDeactivationReasons___block_invoke;
  v8[3] = &unk_1E8EB77A8;
  v8[4] = self;
  v8[5] = a5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

  self->_previouslyReceivedDeactivationReasons = a5;
}

void __107__SBNonInteractiveDisplayControllerPolicy_displayController_sceneManager_didReceiveNewDeactivationReasons___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUISubclass");

  if (v4)
  {
    objc_msgSend(v7, "uiSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "setDeactivationReasons:", *(_QWORD *)(a1 + 40) | objc_msgSend(v6, "deactivationReasons") & ~*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    objc_msgSend(v7, "updateSettings:withTransitionContext:", v6, 0);

  }
}

- (void)displayController:(id)a3 didBeginTransaction:(id)a4 sceneManager:(id)a5 displayConfiguration:(id)a6 deactivationReasons:(unint64_t)a7
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  char v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  SBApplication *currentApplication;
  void *v41;
  id v42;
  id v44;
  _QWORD v45[7];
  _QWORD v46[4];
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v12 = a4;
  v13 = a5;
  v44 = a6;
  if (-[FBSDisplayIdentity isiPodOnlyDisplay](self->_displayIdentity, "isiPodOnlyDisplay"))
  {
    -[SBApplicationController iPodOutApplication](self->_applicationController, "iPodOutApplication");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v15 = (id)v14;
    v16 = 0;
    goto LABEL_11;
  }
  if (-[FBSDisplayIdentity isMusicOnlyDisplay](self->_displayIdentity, "isMusicOnlyDisplay"))
  {
    -[SBApplicationController musicApplication](self->_applicationController, "musicApplication");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[SBWindowScene layoutStateProvider](self->_monitoredWindowScene, "layoutStateProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layoutState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "elementWithRole:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "workspaceEntity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "applicationSceneEntity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "application");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[FBSDisplayIdentity isRestrictedAirPlayDisplay](self->_displayIdentity, "isRestrictedAirPlayDisplay")&& (objc_msgSend(v22, "processState"), v23 = (void *)objc_claimAutoreleasedReturnValue(), v24 = objc_msgSend(v23, "pid"), v25 = -[FBSDisplayIdentity pid](self->_displayIdentity, "pid"), v23, v24 != v25))
  {
    v15 = 0;
  }
  else
  {
    v15 = v22;
  }

  v16 = 1;
LABEL_11:
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__109;
  v53 = __Block_byref_object_dispose__109;
  v54 = 0;
  -[SBWindowScene sceneManager](self->_monitoredWindowScene, "sceneManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "externalApplicationSceneHandles");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __135__SBNonInteractiveDisplayControllerPolicy_displayController_didBeginTransaction_sceneManager_displayConfiguration_deactivationReasons___block_invoke;
  v46[3] = &unk_1E8EBD410;
  v28 = v15;
  v47 = v28;
  v48 = &v49;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v46);

  v29 = v50[5];
  if (!v29 || !v28)
  {
    if (v28)
      v35 = 1;
    else
      v35 = v16;
    if ((v35 & 1) != 0)
    {
      v30 = 0;
      if (!v28 || v29)
        goto LABEL_33;
      SBLogDisplayControlling();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBNonInteractiveDisplayControllerPolicy displayController:didBeginTransaction:sceneManager:displayConfiguration:deactivationReasons:].cold.1(v37, (uint64_t)v28, buf, v36);
      }

      if (objc_msgSend(v12, "isAuditHistoryEnabled"))
        objc_msgSend(v12, "_addAuditHistoryItem:", CFSTR("failed to add an external display scene for %@ because there's no monitoredDisplayScene"), v28);
    }
    else
    {
      SBLogDisplayControlling();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBNonInteractiveDisplayControllerPolicy displayController:didBeginTransaction:sceneManager:displayConfiguration:deactivationReasons:].cold.2(v39, buf, v38);
      }

      if (objc_msgSend(v12, "isAuditHistoryEnabled"))
        objc_msgSend(v12, "_addAuditHistoryItem:", CFSTR("failed to add an external display scene because we couldn't resolve an application"));
    }
    v30 = 0;
    goto LABEL_33;
  }
  -[SBNonInteractiveDisplayControllerPolicy _fetchOrCreateSceneForApplication:monitoredDisplayScene:fromSceneManager:displayConfiguration:deactivationReasons:](self, "_fetchOrCreateSceneForApplication:monitoredDisplayScene:fromSceneManager:displayConfiguration:deactivationReasons:", v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
  {
    SBLogDisplayControlling();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "identity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v56 = v32;
      v57 = 2114;
      v58 = v33;
      _os_log_impl(&dword_1D0540000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved scene: %{public}@", buf, 0x16u);

    }
    if (objc_msgSend(v12, "isAuditHistoryEnabled"))
    {
      -[FBScene identifier](self->_currentScene, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_addAuditHistoryItem:", CFSTR("retrieved scene %@"), v34);

    }
  }
LABEL_33:
  currentApplication = self->_currentApplication;
  self->_currentApplication = 0;

  -[FBScene removeObserver:](self->_currentScene, "removeObserver:", self);
  objc_storeStrong((id *)&self->_currentScene, v30);
  if (self->_currentScene)
  {
    objc_storeStrong((id *)&self->_currentApplication, v15);
    -[FBScene addObserver:](self->_currentScene, "addObserver:", self);
  }
  objc_msgSend(v13, "allScenes");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __135__SBNonInteractiveDisplayControllerPolicy_displayController_didBeginTransaction_sceneManager_displayConfiguration_deactivationReasons___block_invoke_23;
  v45[3] = &unk_1E8EBD438;
  v45[4] = self;
  v45[5] = a2;
  v45[6] = a7;
  objc_msgSend(v41, "enumerateObjectsUsingBlock:", v45);

  _Block_object_dispose(&v49, 8);
}

void __135__SBNonInteractiveDisplayControllerPolicy_displayController_didBeginTransaction_sceneManager_displayConfiguration_deactivationReasons___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSameExecutableAsApplication:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    objc_msgSend(v10, "scene");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a3 = 1;
  }

}

void __135__SBNonInteractiveDisplayControllerPolicy_displayController_didBeginTransaction_sceneManager_displayConfiguration_deactivationReasons___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isUISubclass");

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SBNonInteractiveDisplayControllerPolicy.m"), 251, CFSTR("settings must be a UI subclass"));

  }
  if (*(id *)(*(_QWORD *)(a1 + 32) + 88) != v3)
  {
    objc_msgSend(v3, "uiSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (objc_msgSend(v7, "isForeground"))
    {
      SBLogDisplayControlling();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 16), *(void **)(a1 + 32));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v9;
        v14 = 2114;
        v15 = v10;
        _os_log_debug_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ backgrounding non-current scene: %{public}@", (uint8_t *)&v12, 0x16u);

      }
      objc_msgSend(v7, "setForeground:", 0);
    }
    objc_msgSend(v7, "setDeactivationReasons:", objc_msgSend(v7, "deactivationReasons") | *(_QWORD *)(a1 + 48) | 0x200);
    objc_msgSend(v3, "updateSettings:withTransitionContext:", v7, 0);

  }
}

- (BOOL)displayController:(id)a3 shouldUpdatePresentationWithSceneManager:(id)a4 displayConfiguration:(id)a5
{
  FBSDisplayConfiguration *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  FBSDisplayConfiguration *lastPresentationUpdateDisplayConfiguration;
  FBSDisplayConfiguration *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (FBSDisplayConfiguration *)a5;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[FBSDisplayConfiguration isEqual:](self->_lastPresentationUpdateDisplayConfiguration, "isEqual:", v6) & 1) == 0)
    objc_msgSend(v7, "appendString:", CFSTR("displayConfiguration"));
  if ((-[FBScene isEqual:](self->_lastPresentationUpdateScene, "isEqual:", self->_currentScene) & 1) == 0)
  {
    if (objc_msgSend(v7, "length"))
      objc_msgSend(v7, "appendString:", CFSTR(", "));
    objc_msgSend(v7, "appendString:", CFSTR("scene"));
  }
  v8 = objc_msgSend(v7, "length");
  if (v8)
  {
    SBLogDisplayControlling();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = v7;

    }
  }
  v11 = v8 != 0;
  lastPresentationUpdateDisplayConfiguration = self->_lastPresentationUpdateDisplayConfiguration;
  self->_lastPresentationUpdateDisplayConfiguration = v6;
  v13 = v6;

  objc_storeStrong((id *)&self->_lastPresentationUpdateScene, self->_currentScene);
  return v11;
}

- (void)displayController:(id)a3 updatePresentationWithSceneManager:(id)a4 displayConfiguration:(id)a5 completion:(id)a6
{
  id v10;
  void (**v11)(_QWORD);
  FBScene **p_currentScene;
  NSObject *v13;
  void *v14;
  FBScene **p_lastPresentationUpdateScene;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  FBSDisplayLayoutElement *v21;
  FBSDisplayLayoutElement *currentLayoutElement;
  BSInvalidatable *v23;
  BSInvalidatable *currentLayoutElementAssertion;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  FBScene *v29;
  void *v30;
  _QWORD v31[4];
  void (**v32)(_QWORD);
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (void (**)(_QWORD))a6;
  if ((-[FBSDisplayConfiguration isEqual:](self->_lastPresentationUpdateDisplayConfiguration, "isEqual:", v10) & 1) != 0
    || (objc_storeStrong((id *)&self->_lastPresentationUpdateDisplayConfiguration, a5),
        p_currentScene = &self->_currentScene,
        !self->_currentScene))
  {
    p_lastPresentationUpdateScene = &self->_lastPresentationUpdateScene;
    p_currentScene = &self->_currentScene;
    if ((-[FBScene isEqual:](self->_lastPresentationUpdateScene, "isEqual:", self->_currentScene) & 1) != 0)
    {
LABEL_18:
      v11[2](v11);
      goto LABEL_19;
    }
  }
  else
  {
    SBLogDisplayControlling();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v14;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ running update as display changed", buf, 0xCu);

    }
    p_lastPresentationUpdateScene = &self->_lastPresentationUpdateScene;
    if ((-[FBScene isEqual:](self->_lastPresentationUpdateScene, "isEqual:", self->_currentScene) & 1) != 0)
      goto LABEL_12;
  }
  objc_storeStrong((id *)p_lastPresentationUpdateScene, *p_currentScene);
  if (!*p_currentScene)
    goto LABEL_18;
  SBLogDisplayControlling();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v17;
    _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ running update as scene changed", buf, 0xCu);

  }
LABEL_12:
  -[SBApplication bundleIdentifier](self->_currentApplication, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSDisplayLayoutElement bundleIdentifier](self->_currentLayoutElement, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", v18);

  if ((v20 & 1) == 0)
  {
    -[BSInvalidatable invalidate](self->_currentLayoutElementAssertion, "invalidate");
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0DAAE40], "elementWithIdentifier:presenting:", v18, 1);
      v21 = (FBSDisplayLayoutElement *)objc_claimAutoreleasedReturnValue();
      currentLayoutElement = self->_currentLayoutElement;
      self->_currentLayoutElement = v21;

      -[FBSDisplayLayoutPublishing addElement:](self->_layoutPublisher, "addElement:", self->_currentLayoutElement);
      v23 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      currentLayoutElementAssertion = self->_currentLayoutElementAssertion;
      self->_currentLayoutElementAssertion = v23;

    }
  }
  -[FBScene settings](*p_currentScene, "settings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isUISubclass");

  if ((v26 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayControllerPolicy.m"), 330, CFSTR("settings must be a UI subclass"));

  }
  -[FBScene uiSettings](*p_currentScene, "uiSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "mutableCopy");

  objc_msgSend(v28, "setDisplayConfiguration:", v10);
  objc_msgSend(v10, "bounds");
  objc_msgSend(v28, "setFrame:");
  v29 = *p_currentScene;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __128__SBNonInteractiveDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke;
  v31[3] = &unk_1E8E9F1C0;
  v32 = v11;
  -[FBScene updateSettings:withTransitionContext:completion:](v29, "updateSettings:withTransitionContext:completion:", v28, 0, v31);

LABEL_19:
}

uint64_t __128__SBNonInteractiveDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)displayPreferencesForDisplayController:(id)a3
{
  void *v3;
  void *v4;
  SBSceneHostingDisplayPreferences *v5;

  -[FBScene uiClientSettings](self->_currentScene, "uiClientSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayConfigurationRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SBSceneHostingDisplayPreferences initWithDisplayConfigurationRequest:logicalScale:contentsScale:keepOtherModes:]([SBSceneHostingDisplayPreferences alloc], "initWithDisplayConfigurationRequest:logicalScale:contentsScale:keepOtherModes:", v4, 1, 1.0, 1.0, 1.0);
  return v5;
}

- (id)assertionPreferencesForDisplay:(id)a3 displayConfiguration:(id)a4
{
  id v6;
  SBDisplayAssertionPreferences *v7;
  FBScene *currentScene;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  FBSDisplayIdentity *displayIdentity;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_alloc_init(SBDisplayAssertionPreferences);
  currentScene = self->_currentScene;
  if (currentScene)
  {
    -[FBScene clientSettings](currentScene, "clientSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isUISubclass");

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayControllerPolicy.m"), 360, CFSTR("clientSettings must be a UI subclass"));

    }
    -[FBScene uiClientSettings](self->_currentScene, "uiClientSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "disablesMirroring");

    SBLogDisplayControlling();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[FBScene identity](self->_currentScene, "identity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543874;
      v23 = v19;
      v24 = 2114;
      v25 = v20;
      v26 = 1024;
      v27 = v12;
      _os_log_debug_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ want control (disablesMirroring): %{BOOL}u", (uint8_t *)&v22, 0x1Cu);

    }
    -[SBDisplayAssertionPreferences setWantsControlOfDisplay:](v7, "setWantsControlOfDisplay:", v12);
  }
  +[SBDisplayPowerLogEntry forDisplay:mode:zoom:](SBDisplayPowerLogEntry, "forDisplay:mode:zoom:", v6, 4, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayAssertionPreferences setPowerLogEntry:](v7, "setPowerLogEntry:", v14);
  displayIdentity = self->_displayIdentity;
  v16 = objc_opt_class();
  _SBPreventIdleSleepReason(displayIdentity, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayAssertionPreferences setDisableSystemIdleSleepReason:](v7, "setDisableSystemIdleSleepReason:", v17);

  -[SBDisplayAssertionPreferences setCloneMirroringMode:](v7, "setCloneMirroringMode:", 1);
  return v7;
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id WeakRetained;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if ((objc_msgSend(v10, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayControllerPolicy.m"), 383, CFSTR("clientSettings must be a UI subclass"));

  }
  objc_msgSend(v9, "clientSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isUISubclass");

  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNonInteractiveDisplayControllerPolicy.m"), 384, CFSTR("clientSettings must be a UI subclass"));

  }
  objc_msgSend(v9, "uiClientSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  objc_msgSend(v13, "displayConfigurationRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayConfigurationRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  v18 = objc_msgSend(v13, "disablesMirroring");
  if (v18 == objc_msgSend(v14, "disablesMirroring"))
  {
    if ((v17 & 1) != 0)
      goto LABEL_17;
    v19 = 2;
  }
  else
  {
    if (v17)
      v19 = 1;
    else
      v19 = 3;
    SBLogDisplayControlling();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v21;
      v29 = 1024;
      v30 = v18;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_NON_INTERACTIVE_POLICY_UPDATE_ASSERTION_FOR_MIRRORING", "%{public}@ disabledMirroring:%{BOOL}u", (uint8_t *)&v27, 0x12u);

    }
  }
  SBLogDisplayControlling();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543362;
    v28 = v23;
    _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_INFO, "%{public}@ detected client settings change. requesting update", (uint8_t *)&v27, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_displayController);
  objc_msgSend(WeakRetained, "requestUpdate:", v19);

LABEL_17:
}

- (CGRect)applicationTransitionContext:(id)a3 frameForApplicationSceneEntity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;
  CGRect v36;
  CGRect result;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = v9;
  if (v14 == *MEMORY[0x1E0C9D820] && v9 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    SBLogDisplayControlling();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      _SBFLoggingMethodProem();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v36.origin.x = v11;
      v36.origin.y = v13;
      v36.size.width = v15;
      v36.size.height = v16;
      NSStringFromCGRect(v36);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544386;
      v26 = v23;
      v27 = 2114;
      v28 = v24;
      v29 = 2114;
      v30 = v5;
      v31 = 2114;
      v32 = v6;
      v33 = 2114;
      v34 = v8;
      _os_log_error_impl(&dword_1D0540000, v18, OS_LOG_TYPE_ERROR, "%{public}@ returning frame with CGSizeZero: %{public}@. context: %{public}@; entity: %{public}@; displayConfig: %{public}@",
        (uint8_t *)&v25,
        0x34u);

    }
  }

  v19 = v11;
  v20 = v13;
  v21 = v15;
  v22 = v16;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (id)layoutStateForApplicationTransitionContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutStateForApplicationTransitionContext:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)previousLayoutStateForApplicationTransitionContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousLayoutStateForApplicationTransitionContext:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_fetchOrCreateSceneForApplication:(id)a3 monitoredDisplayScene:(id)a4 fromSceneManager:(id)a5 displayConfiguration:(id)a6 deactivationReasons:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SBMainWorkspaceTransitionRequest *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SBExternalDisplayApplicationSceneEntity *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  FBSceneManager *fbSceneManager;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  id v45;
  id v46;
  void *v47;
  SBExternalDisplayApplicationSceneEntity *v48;
  id v49;
  id v50;
  SEL v51;
  _QWORD v52[6];
  _QWORD v53[5];
  id v54;
  SEL v55;
  unint64_t v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a5;
  objc_msgSend(v16, "sceneIdentityForApplication:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationSceneHandleRequest defaultRequestForApplication:sceneIdentity:displayIdentity:](SBApplicationSceneHandleRequest, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v13, v17, self->_displayIdentity);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "fetchOrCreateApplicationSceneHandleForRequest:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v51 = a2;
    objc_msgSend(v19, "sceneIfExists");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = v20;
      objc_msgSend(v20, "uiSettings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (SBMainWorkspaceTransitionRequest *)objc_msgSend(v22, "mutableCopy");

      -[SBWorkspaceTransitionRequest setDisplayConfiguration:](v23, "setDisplayConfiguration:", v15);
      objc_msgSend(v15, "bounds");
      -[SBMainWorkspaceTransitionRequest setFrame:](v23, "setFrame:");
      -[SBMainWorkspaceTransitionRequest setForeground:](v23, "setForeground:", 1);
      -[SBMainWorkspaceTransitionRequest setDeactivationReasons:](v23, "setDeactivationReasons:", -[SBMainWorkspaceTransitionRequest deactivationReasons](v23, "deactivationReasons") | a7);
      objc_msgSend(v21, "updateSettings:withTransitionContext:", v23, 0);
      SBLogDisplayControlling();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        v49 = v14;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v58 = v25;
        v59 = 2114;
        v60 = v26;
        v61 = 2114;
        v62 = v27;
        v63 = 2114;
        v64 = v15;
        _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ RETRIEVED scene %{public}@ for presentation; deactivationReasons: %{public}@; displayConfiguration: %{public}@",
          buf,
          0x2Au);

        v14 = v49;
      }

    }
    else
    {
      v45 = v13;
      v23 = -[SBMainWorkspaceTransitionRequest initWithDisplayConfiguration:]([SBMainWorkspaceTransitionRequest alloc], "initWithDisplayConfiguration:", v15);
      -[SBWorkspaceTransitionRequest applicationContext](v23, "applicationContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setDelegate:", self);

      -[SBMainWorkspaceTransitionRequest finalize](v23, "finalize");
      v29 = -[SBExternalDisplayApplicationSceneEntity initWithApplicationSceneHandle:]([SBExternalDisplayApplicationSceneEntity alloc], "initWithApplicationSceneHandle:", v19);
      -[SBWorkspaceTransitionRequest applicationContext](v23, "applicationContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v29;
      objc_msgSend(v19, "_createParametersFromTransitionContext:entity:", v30, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = MEMORY[0x1E0C809B0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __157__SBNonInteractiveDisplayControllerPolicy__fetchOrCreateSceneForApplication_monitoredDisplayScene_fromSceneManager_displayConfiguration_deactivationReasons___block_invoke;
      v53[3] = &unk_1E8EBD460;
      v55 = v51;
      v53[4] = self;
      v46 = v15;
      v33 = v15;
      v54 = v33;
      v56 = a7;
      objc_msgSend(v31, "updateSettingsWithBlock:", v53);
      v52[0] = v32;
      v52[1] = 3221225472;
      v52[2] = __157__SBNonInteractiveDisplayControllerPolicy__fetchOrCreateSceneForApplication_monitoredDisplayScene_fromSceneManager_displayConfiguration_deactivationReasons___block_invoke_2;
      v52[3] = &unk_1E8EBD488;
      v52[4] = self;
      v52[5] = v51;
      objc_msgSend(v31, "updateClientSettingsWithBlock:", v52);
      fbSceneManager = self->_fbSceneManager;
      objc_msgSend(v19, "sceneIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v14;
      objc_msgSend(v14, "clientProcess");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "workspace");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v31;
      -[FBSceneManager createSceneWithIdentifier:parameters:clientProvider:transitionContext:](fbSceneManager, "createSceneWithIdentifier:parameters:clientProvider:transitionContext:", v35, v31, v37, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      SBLogDisplayControlling();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "identifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "uiSettings");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "deactivationReasons");
        UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v58 = v39;
        v59 = 2114;
        v60 = v40;
        v61 = 2114;
        v62 = v42;
        v63 = 2114;
        v64 = v33;
        _os_log_impl(&dword_1D0540000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ CREATED scene %{public}@ for presentation deactivationReasons: %{public}@; displayConfiguration: %{public}@",
          buf,
          0x2Au);

      }
      v14 = v50;
      v13 = v45;
      v15 = v46;
    }
  }
  else
  {
    SBLogDisplayControlling();
    v23 = (SBMainWorkspaceTransitionRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v23->super.super, OS_LOG_TYPE_ERROR))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v58 = v44;
      v59 = 2114;
      v60 = v13;
      v61 = 2114;
      v62 = v14;
      _os_log_error_impl(&dword_1D0540000, &v23->super.super, OS_LOG_TYPE_ERROR, "%{public}@ failed to retrieve scene handle for application: %{public}@ monitoredDisplayScene: %{public}@", buf, 0x20u);

    }
    v21 = 0;
  }

  return v21;
}

void __157__SBNonInteractiveDisplayControllerPolicy__fetchOrCreateSceneForApplication_monitoredDisplayScene_fromSceneManager_displayConfiguration_deactivationReasons___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("SBNonInteractiveDisplayControllerPolicy.m"), 460, CFSTR("settings must be a UI subclass"));

  }
  objc_msgSend(v4, "setInterfaceOrientationMode:", 2);
  objc_msgSend(v4, "setInterfaceOrientation:", 1);
  objc_msgSend(v4, "setDisplayConfiguration:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setForeground:", 1);
  objc_msgSend(v4, "setDeactivationReasons:", *(_QWORD *)(a1 + 56) | objc_msgSend(v4, "deactivationReasons"));

}

void __157__SBNonInteractiveDisplayControllerPolicy__fetchOrCreateSceneForApplication_monitoredDisplayScene_fromSceneManager_displayConfiguration_deactivationReasons___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if ((objc_msgSend(v3, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SBNonInteractiveDisplayControllerPolicy.m"), 474, CFSTR("clientSettings must be a UI subclass"));

  }
  objc_msgSend(v3, "setPreferredInterfaceOrientation:", 1);
  v6 = objc_alloc_init(MEMORY[0x1E0D23130]);
  objc_msgSend(v6, "setOverscanCompensation:", 1);
  v4 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v3, "setDisplayConfigurationRequest:", v4);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBNonInteractiveDisplayControllerPolicy descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)description
{
  return (NSString *)-[SBNonInteractiveDisplayControllerPolicy descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", self->_currentApplication, CFSTR("currentApplication"));
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", self->_currentLayoutElement, CFSTR("currentLayoutElement"));
  if (self->_currentScene)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __81__SBNonInteractiveDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E8E9E820;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("FBScene"), v4, v9);

  }
  return v5;
}

void __81__SBNonInteractiveDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "uiSettings");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v8, "frame");
  v3 = (id)objc_msgSend(v2, "appendRect:withName:", CFSTR("frame"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(v8, "isForeground"), CFSTR("isForeground"));
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v8, "deactivationReasons");
  UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("deactivationReasons"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPresentationUpdateScene, 0);
  objc_storeStrong((id *)&self->_lastPresentationUpdateDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_currentScene, 0);
  objc_storeStrong((id *)&self->_currentApplication, 0);
  objc_storeStrong((id *)&self->_currentLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_currentLayoutElement, 0);
  objc_storeStrong((id *)&self->_layoutPublisher, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_monitoredWindowScene, 0);
  objc_storeStrong((id *)&self->_fbSceneManager, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_destroyWeak((id *)&self->_displayController);
}

- (void)displayController:(uint8_t *)buf didBeginTransaction:(os_log_t)log sceneManager:displayConfiguration:deactivationReasons:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "%{public}@ can't get a scene for %{public}@ because there's no monitoredDisplayScene", buf, 0x16u);

}

- (void)displayController:(os_log_t)log didBeginTransaction:sceneManager:displayConfiguration:deactivationReasons:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "%{public}@ can't get a scene because we couldn't resolve an application", buf, 0xCu);

}

@end
