@implementation SBApplicationSceneUpdateTransaction

- (SBApplicationSceneUpdateTransaction)initWithApplicationSceneEntity:(id)a3 transitionRequest:(id)a4
{
  return -[SBApplicationSceneUpdateTransaction initWithApplicationSceneEntity:transitionRequest:delegate:](self, "initWithApplicationSceneEntity:transitionRequest:delegate:", a3, a4, 0);
}

- (BOOL)_isReadyToLaunch
{
  return !self->_requiresPreflight;
}

id __97__SBApplicationSceneUpdateTransaction_initWithApplicationSceneEntity_transitionRequest_delegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "applicationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_createProcessExecutionContextFromContext:entity:", v3, *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBApplicationSceneUpdateTransaction)initWithApplicationSceneEntity:(id)a3 transitionRequest:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  SBApplicationSceneUpdateTransaction *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  SBApplicationSceneUpdateTransaction *v21;
  SBApplicationSceneUpdateTransaction *v22;
  SEL v23;
  uint64_t v24;
  SBApplicationSceneEntity *applicationSceneEntity;
  void *v26;
  uint64_t v27;
  NSString *sceneIdentifier;
  void *v29;
  uint64_t v30;
  FBSMutableSceneParameters *sceneParameters;
  void *v32;
  uint64_t v33;
  UIApplicationSceneTransitionContext *sceneTransitionContext;
  void *v35;
  void *v36;
  uint64_t v37;
  LSApplicationIdentity *applicationIdentity;
  uint64_t v39;
  SBPrivacyPreflightController *privacyPreflightController;
  void *v41;
  int v42;
  BOOL v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  void *v51;
  objc_super v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;

  v9 = a3;
  obj = a4;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "applicationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (v9)
      goto LABEL_3;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneUpdateTransaction.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationSceneEntity"));

    if (v12)
      goto LABEL_4;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneUpdateTransaction.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  if (!v9)
    goto LABEL_16;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSceneUpdateTransaction.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionContext"));

LABEL_4:
  objc_msgSend(v10, "finalize");
  objc_msgSend(v9, "sceneHandle");
  v13 = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "application");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "info");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "processIdentity");
  v17 = objc_claimAutoreleasedReturnValue();

  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __97__SBApplicationSceneUpdateTransaction_initWithApplicationSceneEntity_transitionRequest_delegate___block_invoke;
  v53[3] = &unk_1E8EAF5A0;
  v18 = v14;
  v54 = v18;
  v19 = v10;
  v55 = v19;
  v20 = v9;
  v56 = v20;
  v52.receiver = v13;
  v52.super_class = (Class)SBApplicationSceneUpdateTransaction;
  v51 = (void *)v17;
  v21 = -[FBApplicationUpdateScenesTransaction initWithProcessIdentity:executionContextProvider:](&v52, sel_initWithProcessIdentity_executionContextProvider_, v17, v53);
  v22 = v21;
  if (v21)
  {
    v23 = a2;
    objc_storeWeak((id *)&v21->_delegate, v11);
    objc_storeStrong((id *)&v22->_request, obj);
    objc_storeStrong((id *)&v22->_transitionContext, v12);
    v24 = objc_msgSend(v20, "copy");
    applicationSceneEntity = v22->_applicationSceneEntity;
    v22->_applicationSceneEntity = (SBApplicationSceneEntity *)v24;

    objc_msgSend(v20, "activationSettings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v22->_suspendedActivation = objc_msgSend(v26, "BOOLForActivationSetting:", 3);

    objc_msgSend(v18, "sceneIdentifier");
    v27 = objc_claimAutoreleasedReturnValue();
    sceneIdentifier = v22->_sceneIdentifier;
    v22->_sceneIdentifier = (NSString *)v27;

    objc_msgSend(v19, "applicationContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_createParametersFromTransitionContext:entity:", v29, v20);
    v30 = objc_claimAutoreleasedReturnValue();
    sceneParameters = v22->_sceneParameters;
    v22->_sceneParameters = (FBSMutableSceneParameters *)v30;

    objc_msgSend(v19, "applicationContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_createApplicationSceneTransitionContextFromContext:entity:", v32, v20);
    v33 = objc_claimAutoreleasedReturnValue();
    sceneTransitionContext = v22->_sceneTransitionContext;
    v22->_sceneTransitionContext = (UIApplicationSceneTransitionContext *)v33;

    if (v22->_suspendedActivation || (objc_msgSend(v12, "waitsForSceneUpdates") & 1) == 0)
      -[FBApplicationUpdateScenesTransaction setWaitsForSceneCommits:](v22, "setWaitsForSceneCommits:", 0);
    -[SBApplicationSceneEntity application](v22->_applicationSceneEntity, "application");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "info");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "applicationIdentity");
    v37 = objc_claimAutoreleasedReturnValue();
    applicationIdentity = v22->_applicationIdentity;
    v22->_applicationIdentity = (LSApplicationIdentity *)v37;

    if (!v22->_applicationIdentity)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", v23, v22, CFSTR("SBApplicationSceneUpdateTransaction.m"), 95, CFSTR("failed to find LSApplicationIDentity for scene entity: %@"), v20);

    }
    objc_msgSend((id)SBApp, "privacyPreflightController");
    v39 = objc_claimAutoreleasedReturnValue();
    privacyPreflightController = v22->_privacyPreflightController;
    v22->_privacyPreflightController = (SBPrivacyPreflightController *)v39;

    -[FBSMutableSceneParameters settings](v22->_sceneParameters, "settings");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isForeground");

    if (v42)
      v43 = -[SBPrivacyPreflightController requiresPreflightForApplication:](v22->_privacyPreflightController, "requiresPreflightForApplication:", v22->_applicationIdentity);
    else
      v43 = 0;
    v22->_requiresPreflight = v43;
    -[FBApplicationUpdateScenesTransaction updateSceneWithIdentifier:parameters:transitionContext:](v22, "updateSceneWithIdentifier:parameters:transitionContext:", v22->_sceneIdentifier, v22->_sceneParameters, v22->_sceneTransitionContext);
    -[UIApplicationSceneTransitionContext animationFence](v22->_sceneTransitionContext, "animationFence");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "invalidate");

  }
  return v22;
}

- (void)_willBegin
{
  void *v3;
  uint64_t v4;
  SBPrivacyPreflightController *privacyPreflightController;
  LSApplicationIdentity *applicationIdentity;
  NSString *sceneIdentifier;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBApplicationSceneUpdateTransaction;
  -[FBApplicationUpdateScenesTransaction _willBegin](&v15, sel__willBegin);
  if (self->_requiresPreflight)
  {
    -[SBWorkspaceTransitionContext request](self->_transitionContext, "request");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "source");

    if (v4 != 14)
    {
      if (-[SBApplicationSceneUpdateTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))
        -[SBApplicationSceneUpdateTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("running preflight for %@"), self->_sceneIdentifier);
      objc_initWeak(&location, self);
      privacyPreflightController = self->_privacyPreflightController;
      applicationIdentity = self->_applicationIdentity;
      sceneIdentifier = self->_sceneIdentifier;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke;
      v12[3] = &unk_1E8EBDAF0;
      v12[4] = self;
      objc_copyWeak(&v13, &location);
      -[SBPrivacyPreflightController preflightLaunchForApplication:sceneIdentifier:withCompletionHandler:](privacyPreflightController, "preflightLaunchForApplication:sceneIdentifier:withCompletionHandler:", applicationIdentity, sceneIdentifier, v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[SBApplicationSceneEntity sceneHandle](self->_applicationSceneEntity, "sceneHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSceneUpdateInProgress:", 1);

    -[SBWorkspaceTransitionRequest applicationContext](self->_request, "applicationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isInLiveResize");

    if (v10)
    {
      -[SBApplicationSceneUpdateTransaction addMilestone:](self, "addMilestone:", CFSTR("SBApplicationSceneUpdateTransactionLiveResizeFinishedMilestone"));
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__sceneResizeLayoutDidFinish_, CFSTR("SBSceneResizeLayoutDidFinishNotification"), 0);

    }
  }
}

- (void)_didComplete
{
  void *v3;
  void *v4;
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBApplicationSceneUpdateTransaction;
  -[FBApplicationUpdateScenesTransaction _didComplete](&v6, sel__didComplete);
  -[SBApplicationSceneEntity sceneHandle](self->_applicationSceneEntity, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSceneUpdateInProgress:", 0);

  SBWTErrorCreateForTransaction(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSceneUpdateTransaction _sendActivationResultWithError:](self, "_sendActivationResultWithError:", v4);

  if (!self->_requiresPreflight)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sceneUpdateTransaction:finishedApplyingUpdate:", self, -[SBApplicationSceneUpdateTransaction isFailed](self, "isFailed") ^ 1);

  }
}

- (void)_sendActivationResultWithError:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (self->_shouldSendActivationResult)
  {
    v8 = v4;
    v5 = -[SBWorkspaceApplicationSceneTransitionContext needsToSendActivationResult](self->_transitionContext, "needsToSendActivationResult");
    v4 = v8;
    if (v5)
    {
      -[SBWorkspaceApplicationSceneTransitionContext sendActivationResultError:](self->_transitionContext, "sendActivationResultError:", v8);
      v6 = -[SBApplicationSceneUpdateTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled");
      v4 = v8;
      if (v6)
      {
        objc_msgSend(v8, "localizedFailureReason");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBApplicationSceneUpdateTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("Sent activation result; error = %@"),
          v7);

        v4 = v8;
      }
    }
  }

}

- (void)_performSynchronizedCommit:(id)a3
{
  SBApplicationSceneEntity *applicationSceneEntity;
  id v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  applicationSceneEntity = self->_applicationSceneEntity;
  v5 = a3;
  -[SBApplicationSceneEntity application](applicationSceneEntity, "application");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransitionRequest displayConfiguration](self->_request, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "_prepareInitializationContextIfNecessaryForLaunchOnDisplayConfiguration:", v7);

  v9.receiver = self;
  v9.super_class = (Class)SBApplicationSceneUpdateTransaction;
  -[FBSynchronizedTransactionGroup _performSynchronizedCommit:](&v9, sel__performSynchronizedCommit_, v5);

  if (self->_shouldSendActivationResult)
  {
    if (-[SBWorkspaceApplicationSceneTransitionContext needsToSendActivationResult](self->_transitionContext, "needsToSendActivationResult"))
    {
      -[SBApplicationSceneUpdateTransaction _sendActivationResultWithError:](self, "_sendActivationResultWithError:", 0);
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_privacyPreflightController, 0);
  objc_storeStrong((id *)&self->_sceneTransitionContext, 0);
  objc_storeStrong((id *)&self->_sceneParameters, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_applicationIdentity, 0);
  objc_storeStrong((id *)&self->_applicationSceneEntity, 0);
}

- (UIApplicationSceneSettings)sceneSettings
{
  return (UIApplicationSceneSettings *)-[FBSMutableSceneParameters settings](self->_sceneParameters, "settings");
}

void __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  id *WeakRetained;
  id *v7;
  id v8;
  void *v9;
  id v10;
  _BOOL8 v11;
  id *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void *v16;
  id v17;
  id v18;
  id *v19;
  uint64_t v20;

  if (objc_msgSend(*(id *)(a1 + 32), "isAuditHistoryEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "_addAuditHistoryItem:", CFSTR("after-preflight update completed"));
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained(WeakRetained + 39);
    v9 = v8;
    if (a3)
    {
      if (a2)
      {
        if (a2 != 2)
        {
          if (a2 == 1)
          {
            objc_msgSend(*(id *)(a1 + 32), "_createUpdateTransactionForPreflightCompletion");
            v10 = (id)objc_claimAutoreleasedReturnValue();
            v13 = MEMORY[0x1E0C809B0];
            v14 = 3221225472;
            v15 = __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke_2;
            v16 = &unk_1E8EBDAC8;
            v17 = v10;
            v18 = v9;
            v19 = v7;
            v20 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v10, "setCompletionBlock:", &v13);
            if (objc_msgSend(*(id *)(a1 + 32), "isAuditHistoryEnabled", v13, v14, v15, v16))
              objc_msgSend(*(id *)(a1 + 32), "_addAuditHistoryItem:", CFSTR("running after-preflight update"));
            objc_msgSend(v10, "begin");

          }
          goto LABEL_15;
        }
      }
      else
      {
        SBWorkspaceDestroyApplicationEntity(*(void **)(*(_QWORD *)(a1 + 32) + 232));
      }
      v8 = v9;
      v12 = v7;
      v11 = 0;
    }
    else
    {
      v11 = a2 == 1;
      v12 = v7;
    }
    objc_msgSend(v8, "sceneUpdateTransaction:finishedApplyingUpdate:", v12, v11);
LABEL_15:

  }
}

uint64_t __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t result;
  _QWORD v8[5];

  v3 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v3, "sceneUpdateTransaction:finishedApplyingUpdate:", *(_QWORD *)(a1 + 48), a2);
  }
  else if ((a2 & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 56), "isAuditHistoryEnabled"))
    {
      v4 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_addAuditHistoryItem:", CFSTR("after-preflight update failed. taking our ball and going home(screen): %@"), v5);

    }
    +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke_5;
    v8[3] = &unk_1E8EA6C08;
    v8[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v6, "requestTransitionWithOptions:builder:validator:", 4, &__block_literal_global_356, v8);

  }
  result = objc_msgSend(*(id *)(a1 + 56), "isAuditHistoryEnabled");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 56), "_addAuditHistoryItem:", CFSTR("after-preflight update completed"));
  return result;
}

uint64_t __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modifyApplicationContext:", &__block_literal_global_25_5);
}

void __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "setRequestedUnlockedEnvironmentMode:", 1);
  +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setActivatingEntity:", v3);

}

BOOL __49__SBApplicationSceneUpdateTransaction__willBegin__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "applicationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousLayoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && objc_msgSend(*(id *)(a1 + 32), "isAuditHistoryEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "_addAuditHistoryItem:", CFSTR("our scene entity isn't in the previousLayoutState, so not bothering with going home"));
  return v6 != 0;
}

- (void)_willFailWithReason:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBApplicationSceneUpdateTransaction;
  -[FBApplicationUpdateScenesTransaction _willFailWithReason:](&v5, sel__willFailWithReason_, a3);
  -[SBApplicationSceneEntity sceneHandle](self->_applicationSceneEntity, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSceneUpdateInProgress:", 0);

}

- (id)_customizedDescriptionProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceEntity succinctDescription](self->_applicationSceneEntity, "succinctDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Application"));

  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Requires Preflight"));

  objc_msgSend(v3, "setObject:forKey:", self->_sceneIdentifier, CFSTR("SceneID"));
  -[SBWorkspaceTransitionRequest displayIdentity](self->_request, "displayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("Display"));

  NSStringFromBOOL();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("Launch Suspended"));

  -[UIApplicationSceneTransitionContext actions](self->_sceneTransitionContext, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v21 = v3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v15, "UIActionType") != 1
            || (v16 = (void *)MEMORY[0x1E0D01748],
                objc_msgSend(v15, "url"),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v16, "descriptionForObject:withObjectsAndNames:", v15, v17, &stru_1E8EC7EC0, 0),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v17,
                !v18))
          {
            objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v9, "addObject:", v18);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    if ((unint64_t)objc_msgSend(v9, "count") < 2)
    {
      objc_msgSend(v9, "firstObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v21;
      objc_msgSend(v21, "setObject:forKey:", v19, CFSTR("Action"));

    }
    else
    {
      v3 = v21;
      objc_msgSend(v21, "setObject:forKey:", v9, CFSTR("Actions"));
    }

  }
  return v3;
}

- (void)_sceneResizeLayoutDidFinish:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBSceneResizeLayoutDidFinishNotificationSceneIdentifierKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", self->_sceneIdentifier))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("SBSceneResizeLayoutDidFinishNotification"), 0);

    -[SBApplicationSceneUpdateTransaction satisfyMilestone:](self, "satisfyMilestone:", CFSTR("SBApplicationSceneUpdateTransactionLiveResizeFinishedMilestone"));
  }

}

- (id)_createUpdateTransactionForPreflightCompletion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBWorkspaceTransitionRequest workspace](self->_request, "workspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransitionRequest displayConfiguration](self->_request, "displayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createRequestWithOptions:displayConfiguration:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "setSource:", -[SBWorkspaceTransitionRequest source](self->_request, "source"));
  }
  objc_msgSend(v5, "setEventLabel:", CFSTR("AfterPreflightSceneUpdateTransaction"));
  objc_msgSend(v5, "setApplicationContext:", self->_transitionContext);
  objc_msgSend(v5, "finalize");
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithApplicationSceneEntity:transitionRequest:", self->_applicationSceneEntity, v5);

  return v6;
}

- (SBApplicationSceneEntity)applicationSceneEntity
{
  return self->_applicationSceneEntity;
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (BOOL)shouldSendActivationResult
{
  return self->_shouldSendActivationResult;
}

- (void)setShouldSendActivationResult:(BOOL)a3
{
  self->_shouldSendActivationResult = a3;
}

@end
