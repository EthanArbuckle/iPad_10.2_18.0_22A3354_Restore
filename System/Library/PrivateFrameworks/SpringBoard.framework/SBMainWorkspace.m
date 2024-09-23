@implementation SBMainWorkspace

- (SBPIPControllerCoordinator)pipCoordinator
{
  return self->_pipCoordinator;
}

- (SBTransientOverlayPresentationManager)transientOverlayPresentationManager
{
  return self->_transientOverlayPresentationManager;
}

- (SBInCallPresentationManager)inCallPresentationManager
{
  return self->_inCallPresentationManager;
}

+ (id)_sharedInstanceWithNilCheckPolicy:(int64_t)a3
{
  SBMainWorkspace *v3;
  void *v4;
  void *v8;

  if (a3 == 1)
  {
    if (!_sharedInstanceWithNilCheckPolicy____sharedInstance)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBWorkspace.m"), 1743, CFSTR("you can't call this before [SBMainWorkspace start]"));

    }
  }
  else if (a3 == 2 && !_sharedInstanceWithNilCheckPolicy____sharedInstance)
  {
    kdebug_trace();
    v3 = objc_alloc_init(SBMainWorkspace);
    v4 = (void *)_sharedInstanceWithNilCheckPolicy____sharedInstance;
    _sharedInstanceWithNilCheckPolicy____sharedInstance = (uint64_t)v3;

    kdebug_trace();
  }
  return (id)_sharedInstanceWithNilCheckPolicy____sharedInstance;
}

- (BOOL)isMedusaCapable
{
  return self->_medusaCapable;
}

uint64_t __43__SBMainWorkspace__activeIdleTimerProvider__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMainDisplayWindowScene");
}

- (void)_determineSourceForTransitionRequest:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v11 = objc_msgSend(v3, "source");
  v4 = v9[3];
  if (!v4)
  {
    objc_msgSend(v3, "applicationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applicationSceneEntities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__SBMainWorkspace__determineSourceForTransitionRequest___block_invoke;
    v7[3] = &unk_1E8E9F320;
    v7[4] = &v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

    v4 = v9[3];
  }
  objc_msgSend(v3, "setSource:", v4);
  _Block_object_dispose(&v8, 8);

}

+ (id)sharedInstance
{
  return (id)objc_msgSend(a1, "_sharedInstanceWithNilCheckPolicy:", 1);
}

void __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = *(id *)(a1 + 32);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "sceneHandle");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "additionalActionsForActivatingSceneEntity:withTransitionContext:", v3, v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "count"))
        objc_msgSend(v3, "addActions:", v5);

    }
    WeakRetained = v6;
  }

}

uint64_t __42__SBMainWorkspace_transactionDidComplete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentTransaction:", 0);
}

- (void)setCurrentTransaction:(id)a3
{
  SBWorkspaceTransaction *v6;
  SBWorkspaceTransaction **p_currentTransaction;
  BSEventQueueLock *v8;
  BSEventQueueLock *currentTransactionLock;
  BSWatchdog *transactionWatchdog;
  SBWorkspaceTransaction *v11;
  BSInvalidatable *displayLayoutTransitionAssertion;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BSEventQueueLock *v20;
  BSEventQueueLock *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  BSInvalidatable *v29;
  BSInvalidatable *v30;
  void *v31;
  int v32;
  id v33;
  void *v34;
  BSWatchdog *v35;
  BSWatchdog *v36;
  void *v37;
  void *v38;
  SEL v39;
  BSEventQueueLock *v40;
  void *v41;
  void *v42;
  const char *v43;
  BSEventQueueLock *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = (SBWorkspaceTransaction *)a3;
  p_currentTransaction = &self->_currentTransaction;
  if (self->_currentTransaction != v6)
  {
    v8 = self->_currentTransactionLock;
    currentTransactionLock = self->_currentTransactionLock;
    self->_currentTransactionLock = 0;

    -[BSWatchdog invalidate](self->_transactionWatchdog, "invalidate");
    transactionWatchdog = self->_transactionWatchdog;
    self->_transactionWatchdog = 0;

    -[SBWorkspaceTransaction removeObserver:](*p_currentTransaction, "removeObserver:", self);
    v11 = *p_currentTransaction;
    *p_currentTransaction = 0;

    -[BSInvalidatable invalidate](self->_displayLayoutTransitionAssertion, "invalidate");
    displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
    self->_displayLayoutTransitionAssertion = 0;

    if (v6)
    {
      objc_storeStrong((id *)&self->_currentTransaction, a3);
      -[SBWorkspaceTransaction addObserver:](*p_currentTransaction, "addObserver:", self);
      SBLogTransactionVerbose();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);

      if (v14)
      {
        SBLogTransactionVerbose();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[SBMainWorkspace setCurrentTransaction:].cold.1();
      }
      else
      {
        SBLogTransaction();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBWorkspaceTransaction transitionRequest](v6, "transitionRequest");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "compactDescriptionBuilder");
          v44 = v8;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "build");
          v43 = a2;
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v16;
          v47 = 2114;
          v48 = v18;
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Running %{public}@ for transition request:\n%{public}@", buf, 0x16u);

          v8 = v44;
          a2 = v43;

        }
      }

      -[SBWorkspace eventQueue](self, "eventQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "acquireLockForReason:", CFSTR("CurrentTransaction"));
      v20 = (BSEventQueueLock *)objc_claimAutoreleasedReturnValue();
      v21 = self->_currentTransactionLock;
      self->_currentTransactionLock = v20;

      -[SBWorkspaceTransaction transitionRequest](*p_currentTransaction, "transitionRequest");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      SBMainWorkspaceMapInternalTransitionSourceToExternalTransitionSource(objc_msgSend(v22, "source"));
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      v25 = CFSTR("SBWorkspace");
      if (v23)
        v25 = (__CFString *)v23;
      v26 = v25;

      -[SBWorkspaceTransaction windowScene](v6, "windowScene");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v27)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 2364, CFSTR("No window scene to get a publisher: %@"), self);

      }
      objc_msgSend(v27, "displayLayoutPublisher");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = a2;
        v40 = v8;
        v41 = v38;
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", v39, self, CFSTR("SBWorkspace.m"), 2364, CFSTR("No publisher for window scene: %@; self: %@"),
          v27,
          self);

        v8 = v40;
      }

      objc_msgSend(v28, "transitionAssertionWithReason:", v26);
      v29 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();

      v30 = self->_displayLayoutTransitionAssertion;
      self->_displayLayoutTransitionAssertion = v29;

      -[SBWorkspaceTransaction begin](v6, "begin");
      if ((-[SBWorkspaceTransaction isComplete](v6, "isComplete") & 1) == 0)
      {
        +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isInternalInstall");

        if (v32)
        {
          v33 = objc_alloc(MEMORY[0x1E0D01898]);
          -[SBTransaction queue](v6, "queue");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (BSWatchdog *)objc_msgSend(v33, "initWithProvider:queue:", v6, v34);
          v36 = self->_transactionWatchdog;
          self->_transactionWatchdog = v35;

          -[BSWatchdog setDelegate:](self->_transactionWatchdog, "setDelegate:", self);
          -[BSWatchdog start](self->_transactionWatchdog, "start");
        }
      }

    }
    -[BSEventQueueLock relinquish](v8, "relinquish");

  }
}

- (id)createRequestWithOptions:(unint64_t)a3 displayConfiguration:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  SBMainWorkspaceTransitionRequest *v11;
  SBMainWorkspaceTransitionRequest *v12;
  SBMainWorkspaceTransitionRequest *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];

  v5 = a4;
  if ((a3 & 0x60) == 0)
  {
    +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSystemAssistantExperiencePersistentSiriEnabled");

    SBLogWorkspace();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9)
        -[SBMainWorkspace createRequestWithOptions:displayConfiguration:].cold.1();
      v10 = 32;
    }
    else
    {
      if (v9)
        -[SBMainWorkspace createRequestWithOptions:displayConfiguration:].cold.2();
      v10 = 64;
    }

    a3 |= v10;
  }
  v11 = [SBMainWorkspaceTransitionRequest alloc];
  v12 = v11;
  if ((a3 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D228F8], "sb_secureMainConfiguration");
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v15 = (void *)v14;
    v13 = -[SBMainWorkspaceTransitionRequest initWithDisplayConfiguration:](v12, "initWithDisplayConfiguration:", v14);

    goto LABEL_16;
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v13 = -[SBMainWorkspaceTransitionRequest initWithDisplayConfiguration:](v11, "initWithDisplayConfiguration:", v5);
LABEL_16:
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__SBMainWorkspace_createRequestWithOptions_displayConfiguration___block_invoke;
  v17[3] = &__block_descriptor_40_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
  v17[4] = a3;
  -[SBWorkspaceTransitionRequest modifyApplicationContext:](v13, "modifyApplicationContext:", v17);

  return v13;
}

void __65__SBMainWorkspace_createRequestWithOptions_displayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  if ((v4 & 2) != 0)
  {
    objc_msgSend(v3, "setBackground:", 1);
    v3 = v5;
    v4 = *(_QWORD *)(a1 + 32);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "setAnimationDisabled:", 1);
  v3 = v5;
  v4 = *(_QWORD *)(a1 + 32);
  if ((v4 & 0x10) != 0)
  {
LABEL_4:
    objc_msgSend(v5, "setSceneless:", 1);
    v3 = v5;
    v4 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  if ((v4 & 0x60) != 0)
  {
    objc_msgSend(v5, "setRetainsSiri:", (v4 >> 5) & 1);
    v3 = v5;
  }

}

- (BOOL)_executeTransitionRequest:(id)a3 options:(unint64_t)a4 validator:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  int v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v50;
  void *v51;
  void *v52;
  BOOL v53;
  void *v54;
  uint64_t v55;
  id v56;
  _QWORD v57[4];
  id v58;
  SBMainWorkspace *v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  char v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "succinctDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v67 = v10;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Executing request: %{public}@", buf, 0xCu);

  }
  v11 = -[SBMainWorkspace _canExecuteTransitionRequest:forExecution:](self, "_canExecuteTransitionRequest:forExecution:", v7, 1);
  v12 = v11;
  if (v11)
  {
    v53 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v14 = v13;
    v55 = mach_continuous_time();
    -[SBMainWorkspace currentTransaction](self, "currentTransaction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v7, "source");
    objc_msgSend(v7, "applicationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isBackground");

    v19 = 0;
    v20 = 0;
    if ((v18 & 1) == 0 && v16 != 14)
    {
      if ((objc_msgSend(v15, "shouldInterceptTransitionRequest:", v7) & 1) != 0)
      {
        v20 = 0;
        v19 = 1;
      }
      else
      {
        v20 = objc_msgSend(v15, "canInterruptForTransitionRequest:", v7);
        v19 = 0;
      }
    }
    v54 = v15;
    objc_msgSend(v7, "displayIdentity", v16);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "windowSceneManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)v21;
    objc_msgSend(v22, "windowSceneForDisplayIdentity:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "applicationContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "requestedUnlockedEnvironmentMode");

    v56 = v8;
    v51 = v23;
    if (v25 == 2)
    {
      objc_msgSend(v23, "homeScreenController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "iconManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v27)
      {
        v29 = v27;
      }
      else
      {
        +[SBIconController sharedInstance](SBIconController, "sharedInstance");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "iconManager");
        v29 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v29, "currentTransitionAnimator");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        objc_msgSend(v32, "childViewController");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v30 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v33, "currentOperation") == 1;

      }
      else
      {
        v30 = 0;
      }

      v8 = v56;
    }
    else
    {
      v30 = 0;
    }
    v35 = (void *)MEMORY[0x1E0D229B0];
    objc_msgSend(v7, "eventLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (!v36)
    {
      objc_msgSend(v7, "succinctDescription");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke;
    v57[3] = &unk_1E8E9F2D0;
    v61 = v8;
    v38 = v7;
    v58 = v38;
    v59 = self;
    v62 = v14;
    v63 = v55;
    v64 = v19;
    v39 = v54;
    v60 = v39;
    v65 = v20;
    objc_msgSend(v35, "eventWithName:handler:", v37, v57);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)

    objc_msgSend(v38, "applicationContext");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isBackground");

    if (((v19 | v20 | v30) & 1) == 0 && !v42)
    {
      if (v50 != 14)
      {
        +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "deactivateReachability");

      }
      -[SBWorkspace eventQueue](self, "eventQueue");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "executeOrAppendEvent:", v40);
LABEL_34:

      v8 = v56;
      v12 = v53;
      v46 = v51;
      v45 = v52;
LABEL_44:

      goto LABEL_45;
    }
    if (v30)
    {
      if (v20)
        objc_msgSend(v39, "interruptForTransitionRequest:", v38);
      -[SBWorkspace eventQueue](self, "eventQueue");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "executeOrPrependEvent:", v40);
      goto LABEL_34;
    }
    if (v42)
    {
      SBLogWorkspace();
      v47 = objc_claimAutoreleasedReturnValue();
      v46 = v51;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v40, "name");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v67 = v48;
        _os_log_impl(&dword_1D0540000, v47, OS_LOG_TYPE_DEFAULT, "Executing suspended-activation immediately: %{public}@", buf, 0xCu);

      }
      v12 = v53;
    }
    else
    {
      v12 = v53;
      v46 = v51;
      if (!v20)
      {
LABEL_43:
        objc_msgSend(v40, "execute");
        v8 = v56;
        v45 = v52;
        goto LABEL_44;
      }
      SBLogWorkspace();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349314;
        v67 = v39;
        v68 = 2114;
        v69 = v38;
        _os_log_impl(&dword_1D0540000, v47, OS_LOG_TYPE_DEFAULT, "Interrupting transaction (%{public}p) for new request: %{public}@", buf, 0x16u);
      }
    }

    goto LABEL_43;
  }
LABEL_45:

  return v12;
}

- (SBWorkspaceTransaction)currentTransaction
{
  return self->_currentTransaction;
}

void __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  id v37;
  char v38;
  _QWORD block[4];
  id v40;
  _QWORD v41[5];
  id v42;
  id location;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
  {
    if (((*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "declineWithReason:", CFSTR("Vetoed by request validator."));
      return;
    }
    objc_msgSend(*(id *)(a1 + 40), "_determineSourceForTransitionRequest:", *(_QWORD *)(a1 + 32));
  }
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "sceneManagerForDisplayIdentity:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "policyAggregator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "allowsTransitionRequest:", *(_QWORD *)(a1 + 32));

  v6 = *(void **)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v6, "transientOverlayContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v7;
    if (v7)
      objc_msgSend(v7, "transitionType", v7);
    kdebug_trace();
    objc_msgSend(*(id *)(a1 + 32), "applicationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v8, "applicationSceneEntities");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    if (v9)
    {
      v33 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v45 != v33)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v11, "application", v30);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[SBApplicationTestingManager sharedInstance](SBApplicationTestingManager, "sharedInstance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "markUserLaunchInitiationTime");

          +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "info");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "domainsToPreheat");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "preHeatDataLinkForDomains:", v16);

          objc_initWeak(&location, v8);
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke_2;
          v41[3] = &unk_1E8E9F280;
          objc_copyWeak(&v42, &location);
          v41[4] = v11;
          objc_msgSend(v8, "addFinalizeBlock:", v41);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forActivationSetting:", v17, 18);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 72));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forActivationSetting:", v18, 19);

          objc_msgSend(v12, "info");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v15) = objc_msgSend(v19, "isIdentifiedGame");

          if ((_DWORD)v15)
          {
            dispatch_get_global_queue(25, 0);
            v20 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke_3;
            block[3] = &unk_1E8E9DED8;
            v40 = v12;
            dispatch_async(v20, block);

          }
          objc_destroyWeak(&v42);
          objc_destroyWeak(&location);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      }
      while (v9);
    }

    v21 = (void *)MEMORY[0x1E0D229B0];
    objc_msgSend(*(id *)(a1 + 32), "eventLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (!v22)
    {
      objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke_4;
    v34[3] = &unk_1E8E9F2A8;
    v24 = *(id *)(a1 + 32);
    v25 = *(_QWORD *)(a1 + 40);
    v26 = *(void **)(a1 + 48);
    v35 = v24;
    v36 = v25;
    v38 = *(_BYTE *)(a1 + 80);
    v37 = v26;
    objc_msgSend(v21, "eventWithName:handler:", v23, v34);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)

    if (*(_BYTE *)(a1 + 81))
    {
      objc_msgSend(*(id *)(a1 + 40), "eventQueue");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "acquireLockForReason:", CFSTR("interrupting current transaction"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "interruptForTransitionRequest:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v28, "executeOrPrependEvent:", v27);
      objc_msgSend(v29, "relinquish");

    }
    else
    {
      objc_msgSend(v27, "execute");
    }

  }
  else
  {
    objc_msgSend(v6, "declineWithReason:", CFSTR("Vetoed by policy aggregator."));
  }

}

- (BOOL)_canExecuteTransitionRequest:(id)a3 forExecution:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SBWorkspaceTransientOverlay *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  char v42;
  NSObject *v43;
  void *v44;
  const __CFString *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v4 = a4;
  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SBLogWorkspace();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "succinctDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v61 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Can execute transition request: %@", buf, 0xCu);

  }
  if (!-[SBMainWorkspace _preflightTransitionRequest:forExecution:](self, "_preflightTransitionRequest:forExecution:", v6, v4))
  {
    objc_msgSend(v6, "declineWithReason:", CFSTR("Failed preflight"));
    v17 = 0;
    goto LABEL_48;
  }
  -[SBMainWorkspace _determineSourceForTransitionRequest:](self, "_determineSourceForTransitionRequest:", v6);
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayIdentity");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sceneManagerForDisplayIdentity:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "policyAggregator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v12, "allowsTransitionRequest:", v6);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v6, "declineWithReason:", CFSTR("Vetoed by policy aggregator."));
    v17 = 0;
    goto LABEL_47;
  }
  +[SBSOSEventHandler sharedInstance](SBSOSEventHandler, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isSOSActive");

  objc_msgSend(v6, "applicationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v14;
  if (objc_msgSend(v15, "requestedUnlockedEnvironmentMode") == 2)
  {
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting app switcher while SOS is active"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "declineWithReason:", v16);
LABEL_8:
      v17 = 0;
      goto LABEL_46;
    }
    objc_msgSend((id)SBApp, "windowSceneManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "windowSceneForDisplayIdentity:", v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "transientOverlayPresenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topmostPresentedViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v16, "switcherController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[SBWorkspaceTransientOverlay initWithViewController:]([SBWorkspaceTransientOverlay alloc], "initWithViewController:", v21);
      objc_msgSend(v22, "appLayoutForWorkspaceTransientOverlay:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting app switcher and presenting switcher ineligible view controller %@"), v21);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "declineWithReason:", v47);

        goto LABEL_8;
      }

    }
    v14 = v54;
  }
  if (!_canExecuteTransitionRequest_forExecution__canAppearOverSOSApps)
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.siri"), CFSTR("com.apple.InCallService"), CFSTR("com.apple.SOSBuddy"), CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.camera"), CFSTR("com.apple.mobileslideshow"), 0);
    v26 = (void *)_canExecuteTransitionRequest_forExecution__canAppearOverSOSApps;
    _canExecuteTransitionRequest_forExecution__canAppearOverSOSApps = v25;

  }
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v15, "applicationSceneEntities");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (!v27)
  {
    v17 = 1;
    goto LABEL_46;
  }
  v28 = v27;
  v52 = v11;
  v53 = v6;
  v51 = v15;
  v29 = *(_QWORD *)v56;
  v30 = CFSTR("com.apple.PrintKit.Print-Center");
LABEL_19:
  v31 = 0;
  while (1)
  {
    if (*(_QWORD *)v56 != v29)
      objc_enumerationMutation(v16);
    v32 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v31);
    objc_msgSend(v32, "application");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (!v33 || objc_msgSend(v33, "isUninstalled"))
    {
      SBLogCommon();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        -[SBMainWorkspace _canExecuteTransitionRequest:forExecution:].cold.1(v32, v43);

      FBSOpenApplicationErrorCreate();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = CFSTR("App is uninstalled");
      goto LABEL_40;
    }
    if (objc_msgSend(v34, "isAnyTerminationAssertionInEffect"))
    {
      SBLogCommon();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[SBMainWorkspace _canExecuteTransitionRequest:forExecution:].cold.2(v32, v46);

      v45 = CFSTR("App has outstanding termination assertions");
      FBSOpenApplicationErrorCreate();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:
      v15 = v51;
      objc_msgSend(v51, "sendActivationResultError:", v44);

      v6 = v53;
      objc_msgSend(v53, "declineWithReason:", v45);

      v17 = 0;
      v11 = v52;
      goto LABEL_46;
    }
    objc_msgSend(v34, "bundleIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14
      && (objc_msgSend((id)_canExecuteTransitionRequest_forExecution__canAppearOverSOSApps, "containsObject:", v35) & 1) == 0)
    {
      v38 = v16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requesting application %@ while SOS active"), v35);
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v48 = v53;
      v49 = v40;
      goto LABEL_44;
    }
    if (!objc_msgSend(v35, "isEqualToString:", v30))
      goto LABEL_30;
    v36 = v28;
    v37 = v30;
    v38 = v16;
    +[SBAppSwitcherServiceManager sharedInstance](SBAppSwitcherServiceManager, "sharedInstance");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "registeredServicesSnapshot");
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();

    -[__CFString serviceBundleIdentifiers](v40, "serviceBundleIdentifiers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "containsObject:", v35);

    if ((v42 & 1) == 0)
      break;

    v16 = v38;
    v14 = v54;
    v30 = v37;
    v28 = v36;
LABEL_30:

    if (v28 == ++v31)
    {
      v28 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
      v17 = 1;
      if (v28)
        goto LABEL_19;
      v15 = v51;
      v11 = v52;
      goto LABEL_45;
    }
  }
  v49 = CFSTR("Service not registered");
  v48 = v53;
LABEL_44:
  objc_msgSend(v48, "declineWithReason:", v49);

  v17 = 0;
  v15 = v51;
  v11 = v52;
  v16 = v38;
LABEL_45:
  v6 = v53;
LABEL_46:

LABEL_47:
LABEL_48:

  return v17;
}

- (BOOL)_preflightTransitionRequest:(id)a3 forExecution:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SBApplication32BitDeprecationAlertItem *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  id v27;
  int v28;
  int v29;
  NSObject *v30;
  void *v31;
  int v32;
  BOOL v33;
  id v34;
  void *v35;
  void *v36;
  NSMutableSet *ocelotRepairRequests;
  NSMutableSet *v38;
  NSMutableSet *v39;
  void *v40;
  void *v41;
  int v42;
  SBLegacyTVRemoteAppLaunchDeniedAlertItem *v43;
  void *v44;
  void *v45;
  void *v46;
  BOOL v47;
  int *v49;
  void *v50;
  void *v51;
  void *v52;
  SBMainWorkspace *v53;
  void *v54;
  NSObject *v55;
  id v56;
  void *v57;
  char v58;
  int v59;
  void *v60;
  id obj;
  _QWORD v62[5];
  id v63;
  _QWORD block[4];
  SBApplication32BitDeprecationAlertItem *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint8_t buf[4];
  int v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  int v76;
  uint8_t v77[4];
  int v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "applicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = 0;
  v59 = objc_msgSend(v7, "isBackground");
  v52 = v6;
  objc_msgSend(v6, "displayIdentity");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowSceneForDisplayIdentity:", v8);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)v8;
  objc_msgSend(v10, "sceneManagerForDisplayIdentity:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v11;
  objc_msgSend(v11, "externalForegroundApplicationSceneHandles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v54 = v7;
  objc_msgSend(v7, "applicationSceneEntities");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
  if (!v13)
    goto LABEL_47;
  v14 = v13;
  v58 = !a4 | v59;
  v49 = &v78;
  v15 = *(_QWORD *)v67;
  v53 = self;
  v57 = v12;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v67 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
      objc_msgSend(v17, "sceneHandle", v49);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "application");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "info");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForActivationSetting:", 5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v70)
      {
LABEL_43:
        objc_msgSend(v19, "bundleIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("com.apple.TVRemote"));

        if (v42)
        {
          v43 = objc_alloc_init(SBLegacyTVRemoteAppLaunchDeniedAlertItem);
          +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "activateAlertItem:", v43);

        }
        goto LABEL_45;
      }
      if ((objc_msgSend(v12, "containsObject:", v18) & 1) == 0
        && _SBWorkspaceCanLaunchApplication(v17, v59, v21, v60, &v70))
      {
        if ((objc_msgSend(v20, "supports64Bit") & 1) != 0)
        {
          v22 = 0;
          goto LABEL_14;
        }
        v70 = 1;
        if ((v58 & 1) != 0)
        {
          v22 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v22 = -[SBApplication32BitDeprecationAlertItem initWithApplication:]([SBApplication32BitDeprecationAlertItem alloc], "initWithApplication:", v19);
LABEL_14:
        if (!v70)
        {
          v23 = objc_msgSend(v20, "unauthoritativeTrustState");
          if (v23 != 8)
          {
            v24 = v23;
            SBLogCommon();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              -[SBMainWorkspace _preflightTransitionRequest:forExecution:].cold.1(v77, v17, v49, v55);

            v70 = 3;
            if ((v58 & 1) != 0)
            {
              v12 = v57;
              goto LABEL_26;
            }
            -[SBMainWorkspace _alertItemForPreventingLaunchOfApp:fromTrustState:](v53, "_alertItemForPreventingLaunchOfApp:fromTrustState:", v19, v24);
            v25 = objc_claimAutoreleasedReturnValue();

            v22 = (SBApplication32BitDeprecationAlertItem *)v25;
          }
          v12 = v57;
        }
        v26 = v58;
        if (!v22)
          v26 = 1;
        if ((v26 & 1) == 0)
        {
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __60__SBMainWorkspace__preflightTransitionRequest_forExecution___block_invoke;
          block[3] = &unk_1E8E9DED8;
          v22 = v22;
          v65 = v22;
          dispatch_async(MEMORY[0x1E0C80D38], block);

        }
        goto LABEL_26;
      }
LABEL_27:
      if (v70)
        goto LABEL_43;
      if (objc_msgSend(v20, "isArcadeApplication"))
      {
        objc_msgSend(v20, "executableURL");
        v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v27, "fileSystemRepresentation");
        mm0Euuzhc();
        if (v28)
        {
          v29 = v28;
          SBLogCommon();
          v30 = objc_claimAutoreleasedReturnValue();
          v56 = v27;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v19, "bundleIdentifier");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v54, "isBackground");
            *(_DWORD *)buf = 67109634;
            v72 = v29;
            v73 = 2114;
            v74 = v31;
            v75 = 1024;
            v76 = v32;
            _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_INFO, "Received FairPlay error %d while trying to launch Arcade app %{public}@ isBackground: %d", buf, 0x18u);

            v27 = v56;
          }

          v33 = (v29 + 42587) > 3 || v29 == -42586;
          v12 = v57;
          if (!v33)
          {
            v70 = 3;
            v34 = objc_alloc(MEMORY[0x1E0CF9DA0]);
            objc_msgSend(v20, "bundleIdentifier");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)objc_msgSend(v34, "initWithBundleID:", v35);

            objc_msgSend(v36, "setExitReason:", 16);
            objc_msgSend(v36, "setIsBackground:", objc_msgSend(v54, "isBackground"));
            if (v36)
            {
              ocelotRepairRequests = v53->_ocelotRepairRequests;
              if (!ocelotRepairRequests)
              {
                v38 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
                v39 = v53->_ocelotRepairRequests;
                v53->_ocelotRepairRequests = v38;

                ocelotRepairRequests = v53->_ocelotRepairRequests;
              }
              -[NSMutableSet addObject:](ocelotRepairRequests, "addObject:", v36);
              objc_msgSend(MEMORY[0x1E0CF9DA8], "defaultService");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v62[0] = MEMORY[0x1E0C809B0];
              v62[1] = 3221225472;
              v62[2] = __60__SBMainWorkspace__preflightTransitionRequest_forExecution___block_invoke_315;
              v62[3] = &unk_1E8E9F2F8;
              v62[4] = v53;
              v63 = v36;
              objc_msgSend(v40, "repairAppWithOptions:replyHandler:", v63, v62);

              v27 = v56;
            }

            v12 = v57;
          }
        }

      }
      if (v70)
        goto LABEL_43;
LABEL_45:

    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
  }
  while (v14);
LABEL_47:

  if (v70)
  {
    FBSOpenApplicationErrorCreate();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v54;
    objc_msgSend(v54, "sendActivationResultError:", v45);

    v47 = v70 == 0;
  }
  else
  {
    v47 = 1;
    v46 = v54;
  }

  return v47;
}

- (SBIdleTimerProviding)_activeIdleTimerProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v16;
  int v17;

  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectedWindowScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_firstObjectPassingTest:", &__block_literal_global_262);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modalLibraryController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "accidentalActivationMitigationSessionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasIdleTimerBehaviors"))
  {
    v9 = v8;
  }
  else
  {
    v10 = 224;
    if (-[SBTransientOverlayPresentationManager hasIdleTimerBehaviors](self->_transientOverlayPresentationManager, "hasIdleTimerBehaviors"))
    {
      goto LABEL_4;
    }
    if ((objc_msgSend(v3, "isUILocked") & 1) != 0
      || (+[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v13 = objc_msgSend(v12, "isVisible"), v12, v13))
    {
      v9 = v3;
      goto LABEL_9;
    }
    if (objc_msgSend(v7, "hasIdleTimerBehaviors"))
    {
      v9 = v7;
      goto LABEL_9;
    }
    v10 = 256;
    if (-[SBPIPControllerCoordinator hasIdleTimerBehaviors](self->_pipCoordinator, "hasIdleTimerBehaviors"))
    {
LABEL_4:
      v11 = *(Class *)((char *)&self->super.super.isa + v10);
    }
    else
    {
      +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hasIdleTimerBehaviors");

      if (v17)
      {
        +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      v11 = (void *)SBApp;
    }
    v9 = v11;
  }
LABEL_9:
  v14 = v9;

  return (SBIdleTimerProviding *)v14;
}

- (BOOL)executeTransitionRequest:(id)a3 withValidator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBMainWorkspace;
  return -[SBWorkspace executeTransitionRequest:withValidator:](&v5, sel_executeTransitionRequest_withValidator_, a3, a4);
}

uint64_t __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  char v5;
  _BOOL4 IsValid;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;

  v3 = a2;
  v4 = *(_BYTE *)(a1 + 104);
  if (v4)
    v4 = *(_BYTE *)(a1 + 105) != 0;
  if (*(_BYTE *)(a1 + 106))
  {
    if (*(_BYTE *)(a1 + 107))
      v5 = 1;
    else
      v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  IsValid = SBLayoutRoleIsValid(*(_QWORD *)(a1 + 88));
  if ((v5 & 1) != 0 || IsValid)
  {
    objc_msgSend(*(id *)(a1 + 32), "switcherController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entityWithRole:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entityWithRole:", 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entityWithRole:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(id *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 56);
    v13 = *(id *)(a1 + 64);
    v14 = *(unsigned __int8 *)(a1 + 106);
    if (!*(_BYTE *)(a1 + 104))
    {
      if (*(_BYTE *)(a1 + 106)
        || !v8
        || v11
        || (+[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity"),
            v11 = (id)objc_claimAutoreleasedReturnValue(),
            v14 = *(unsigned __int8 *)(a1 + 106),
            !*(_BYTE *)(a1 + 104)))
      {
        if (v14
          || !v22
          || v12
          || (+[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity"),
              v12 = (id)objc_claimAutoreleasedReturnValue(),
              v14 = *(unsigned __int8 *)(a1 + 106),
              !*(_BYTE *)(a1 + 104)))
        {
          if (!v14 && v9 && !v13)
          {
            +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
            v13 = (id)objc_claimAutoreleasedReturnValue();
            LOBYTE(v14) = *(_BYTE *)(a1 + 106);
          }
        }
      }
    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_5;
    v23[3] = &unk_1E8E9F6D0;
    v31 = v14;
    v32 = v5;
    v24 = v10;
    v25 = v11;
    v26 = v12;
    v27 = v13;
    v28 = *(id *)(a1 + 72);
    v15 = *(id *)(a1 + 80);
    v33 = *(_BYTE *)(a1 + 104);
    v16 = *(_QWORD *)(a1 + 96);
    v29 = v15;
    v30 = v16;
    v17 = v13;
    v18 = v12;
    v19 = v11;
    v20 = v10;
    objc_msgSend(v3, "modifyApplicationContext:", v23);

  }
  return 1;
}

void __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setPrefersCrossfadeTransition:", v3);
  objc_msgSend(v4, "setPrefersCenterZoomTransition:", *(unsigned __int8 *)(a1 + 33));

}

- (id)_selectTransactionForAppActivationRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBAppToAppWorkspaceTransaction *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBAppToAppWorkspaceTransaction *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  char v23;

  v4 = a3;
  objc_msgSend(v4, "applicationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resolvedActivatingWorkspaceEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationSceneEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "BOOLForActivationSetting:", 59))
  {
    -[SBMainWorkspace _selectTransactionForAppActivationUnderMainScreenLockRequest:](self, "_selectTransactionForAppActivationUnderMainScreenLockRequest:", v4);
    v8 = (SBAppToAppWorkspaceTransaction *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowSceneForDisplayIdentity:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "transientOverlayPresenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "hasActivePresentation")
      && (objc_msgSend(v4, "shouldPreventDismissalOfUnrelatedTransientOverlays") & 1) == 0)
    {
      objc_msgSend(v4, "applicationContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
        v16 = objc_msgSend(v14, "animationDisabled") ^ 1;
      else
        v16 = 0;
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __61__SBMainWorkspace__selectTransactionForAppActivationRequest___block_invoke;
      v21 = &unk_1E8E9F3E8;
      v22 = v12;
      v23 = v16;
      objc_msgSend(v4, "modifyTransientOverlayContext:", &v18);
      -[SBMainWorkspace _selectTransactionForTransientOverlayPresentationRequest:](self, "_selectTransactionForTransientOverlayPresentationRequest:", v4, v18, v19, v20, v21);
      v13 = (SBAppToAppWorkspaceTransaction *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = -[SBAppToAppWorkspaceTransaction initWithTransitionRequest:]([SBAppToAppWorkspaceTransaction alloc], "initWithTransitionRequest:", v4);
    }
    v8 = v13;

  }
  return v8;
}

- (SBKeyboardFocusControlling)keyboardFocusController
{
  return self->_keyboardFocusCoordinator;
}

+ (id)_instanceIfExists
{
  return (id)objc_msgSend(a1, "_sharedInstanceWithNilCheckPolicy:", 0);
}

- (id)_transactionForTransitionRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_currentTransaction)
  {
    -[SBWorkspace eventQueue](self, "eventQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "executingEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 1960, CFSTR("must be called from a transaction or on a workspace event"));

    }
  }
  objc_msgSend(v5, "transientOverlayContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[SBMainWorkspace _selectTransactionForTransientOverlayPresentationRequest:](self, "_selectTransactionForTransientOverlayPresentationRequest:", v5);
  else
    -[SBMainWorkspace _selectTransactionForAppActivationRequest:](self, "_selectTransactionForAppActivationRequest:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogTransactionVerbose();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);

  if (v12)
  {
    SBLogTransactionVerbose();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SBMainWorkspace _transactionForTransitionRequest:].cold.1();
  }
  else
  {
    SBLogTransaction();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transitionRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "compactDescriptionBuilder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "build");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2114;
      v22 = v17;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, "Prepared %{public}@ for transition request:\n%{public}@", (uint8_t *)&v19, 0x16u);

    }
  }

  return v10;
}

uint64_t __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t result;
  void *v4;
  char v5;
  const __CFString *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "transientOverlayContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "_executeTransientOverlayTransitionRequest:", *(_QWORD *)(a1 + 32));
    if ((result & 1) != 0)
      return result;
    goto LABEL_9;
  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "handleTransitionRequest:", *(_QWORD *)(a1 + 32));

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("Lock screen handled request");
    return objc_msgSend(*(id *)(a1 + 32), "declineWithReason:", v6);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 48), "interceptTransitionRequest:", v7);
  result = objc_msgSend(*(id *)(a1 + 40), "_executeApplicationTransitionRequest:", v7);
  if ((result & 1) == 0)
  {
LABEL_9:
    v6 = CFSTR("No transaction created");
    return objc_msgSend(*(id *)(a1 + 32), "declineWithReason:", v6);
  }
  return result;
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  SBIdleTimerProviding *v8;
  id v9;
  id v10;
  SBIdleTimerProviding *v11;
  SBIdleTimerProviding *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;

  v8 = (SBIdleTimerProviding *)a3;
  v9 = a4;
  v10 = a5;
  -[SBMainWorkspace _activeIdleTimerProvider](self, "_activeIdleTimerProvider");
  v11 = (SBIdleTimerProviding *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 == v8)
  {
    -[SBIdleTimerCoordinatorHelper proposeIdleTimerBehavior:fromProvider:reason:](self->_idleTimerCoordinatorHelper, "proposeIdleTimerBehavior:fromProvider:reason:", v9, v8, v10);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11 != self->_activeIdleTimerProvider)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBWorkspaceActiveProviderChanged:%@"), v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBMainWorkspace _generateIdleTimerBehaviorForReason:](self, "_generateIdleTimerBehaviorForReason:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SBIdleTimerCoordinatorHelper proposeIdleTimerBehavior:fromProvider:reason:](self->_idleTimerCoordinatorHelper, "proposeIdleTimerBehavior:fromProvider:reason:", v14, v12, v13);

    }
    -[SBIdleTimerCoordinatorHelper updateProvider:behavior:reason:](self->_idleTimerCoordinatorHelper, "updateProvider:behavior:reason:", v8, v9, v10);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;
  -[SBMainWorkspace _setActiveIdleTimerProvider:](self, "_setActiveIdleTimerProvider:", v12);

  return v17;
}

- (void)_setActiveIdleTimerProvider:(id)a3
{
  objc_storeStrong((id *)&self->_activeIdleTimerProvider, a3);
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return -[SBMainWorkspace _generateIdleTimerBehaviorForReason:](self, "_generateIdleTimerBehaviorForReason:", CFSTR("SBWorkspaceCoordinatorRequested"));
}

- (id)_generateIdleTimerBehaviorForReason:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;

  v5 = a3;
  -[SBMainWorkspace _activeIdleTimerProvider](self, "_activeIdleTimerProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 2215, CFSTR("Workspace activeProvider should not be nil"));

  }
  objc_msgSend(v6, "coordinatorRequestedIdleTimerBehavior:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBIdleTimerCoordinatorHelper updateProvider:behavior:reason:](self->_idleTimerCoordinatorHelper, "updateProvider:behavior:reason:", v6, v7, v5);

  return v7;
}

uint64_t __104__SBMainWorkspace__handleTrustedOpenRequestForApplication_options_activationSettings_origin_withResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUserActionRequest:options:activationSettings:origin:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __60__SBMainWorkspace__addRequestCompletionBlock_toTransaction___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v6;
  }

}

void __58__SBMainWorkspace__executeSuspendedTransactionForRequest___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v4;
  id *WeakRetained;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(a1[4], "completionBlock");
  v4 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v4;
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 5);
  v6 = objc_loadWeakRetained(a1 + 6);
  v7 = v6;
  if (WeakRetained && v6)
    objc_msgSend(WeakRetained[13], "removeObject:", v6);

}

- (BOOL)requestTransitionWithOptions:(unint64_t)a3 displayConfiguration:(id)a4 builder:(id)a5 validator:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMainWorkspace;
  return -[SBWorkspace requestTransitionWithOptions:displayConfiguration:builder:validator:](&v7, sel_requestTransitionWithOptions_displayConfiguration_builder_validator_, a3, a4, a5, a6);
}

- (void)_updateActivationSettings:(id)a3 forRequestWithOptions:(id)a4 clientProcess:(id)a5 application:(id)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v58;
  _QWORD v59[4];
  id v60;

  v58 = a3;
  v9 = a4;
  v56 = a5;
  v10 = a6;
  if (v58)
  {
    v54 = v10;
    objc_msgSend(v58, "setFlag:forActivationSetting:", 1, 49);
    objc_msgSend(v9, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22D00], objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v9, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22D58], objc_opt_class());
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0DC60B8], "isEqual:", v12);
    objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 41);
    objc_msgSend((id)*MEMORY[0x1E0DC60D8], "isEqual:", v12);
    objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 42);
    objc_msgSend((id)*MEMORY[0x1E0CD0868], "isEqual:", v12);
    objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 53);
    objc_msgSend((id)*MEMORY[0x1E0CEC8C0], "isEqual:", v12);
    objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 54);
    objc_msgSend((id)*MEMORY[0x1E0DAB818], "isEqual:", v12);
    objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 46);
    objc_msgSend((id)*MEMORY[0x1E0DAB810], "isEqual:", v12);
    objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 52);
    objc_msgSend((id)*MEMORY[0x1E0DAB820], "isEqual:", v12);
    objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 62);
    objc_msgSend((id)*MEMORY[0x1E0DAB800], "isEqual:", v12);
    objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 63);
    objc_msgSend((id)*MEMORY[0x1E0DAB808], "isEqual:", v12);
    objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 64);
    objc_msgSend((id)*MEMORY[0x1E0D145D0], "isEqual:", v12);
    objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 44);
    v53 = (void *)v12;
    objc_msgSend((id)*MEMORY[0x1E0CF9600], "isEqual:", v12);
    objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 58);
    v55 = v9;
    objc_msgSend(v9, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB8D0], objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = 0;
      v15 = 1;
      v16 = MEMORY[0x1E0C809B0];
      while (1)
      {
        v17 = v15;
        -[SBPIPControllerCoordinator controllerForType:](self->_pipCoordinator, "controllerForType:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "hostedAppSceneHandles");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v16;
        v59[1] = 3221225472;
        v59[2] = __93__SBMainWorkspace__updateActivationSettings_forRequestWithOptions_clientProcess_application___block_invoke;
        v59[3] = &unk_1E8E9F570;
        v60 = v13;
        v20 = objc_msgSend(v19, "bs_containsObjectPassingTest:", v59);

        if (v20)
          break;

        v15 = 0;
        v14 = 1;
        if ((v17 & 1) == 0)
          goto LABEL_8;
      }
      objc_msgSend(v58, "setFlag:forActivationSetting:", 1, 56);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setObject:forActivationSetting:", v21, 57);

    }
LABEL_8:
    if ((v52 & 1) == 0 && +[SBAssistantController isVisible](SBAssistantController, "isVisible"))
    {
      +[SBAssistantController defaultActivationSettings](SBAssistantController, "defaultActivationSettings");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "applyActivationSettings:", v22);

    }
    objc_msgSend(v55, "bs_safeDictionaryForKey:", *MEMORY[0x1E0D22D70]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "mutableCopy");

    +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "applicationWithPid:", objc_msgSend(v56, "pid"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "bundleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (uint64_t *)MEMORY[0x1E0CEB2B0];
    if (!v27)
    {
      objc_msgSend(v24, "bs_safeStringForKey:", *MEMORY[0x1E0CEB2B0]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v58, "BOOLForActivationSetting:", 51))
    {
      objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagForBool(), 3);
      objc_msgSend(v55, "bs_safeStringForKey:", *MEMORY[0x1E0D22D48]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setObject:forActivationSetting:", v29, 17);

      objc_msgSend(v55, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22D08], objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setObject:forActivationSetting:", v30, 21);

      objc_msgSend(v55, "bs_safeDictionaryForKey:", *MEMORY[0x1E0D22D10]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setObject:forActivationSetting:", v31, 22);

      v32 = *v28;
      objc_msgSend(v24, "objectForKey:", *v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v24, "bs_safeStringForKey:", v32);
        v34 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v34;
      }
      objc_msgSend(v55, "bs_safeNumberForKey:", *MEMORY[0x1E0D22D50]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "integerValue");

      if (v36)
      {
        if (v52)
        {
          if (v36 >= 5)
            v37 = 2;
          else
            v37 = qword_1D0E881D8[v36 - 1];
        }
        else if (v36 == 4)
        {
          v37 = 4;
        }
        else
        {
          v37 = 3;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setObject:forActivationSetting:", v38, 30);

      }
      objc_msgSend(v55, "bs_safeStringForKey:", *MEMORY[0x1E0D22D80]);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setObject:forActivationSetting:", v39, 33);

    }
    objc_msgSend(v58, "objectForActivationSetting:", 30);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
    {
      objc_msgSend(v54, "bundleIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("com.apple.InCallService"));

      if (v42)
        objc_msgSend(v58, "setObject:forActivationSetting:", &unk_1E91CFF00, 30);
    }
    objc_msgSend(v24, "removeObjectForKey:", *v28);
    objc_msgSend(v55, "bs_safeURLForKey:", *MEMORY[0x1E0D22D78]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setObject:forActivationSetting:", v43, 5);

    objc_msgSend(v58, "setObject:forActivationSetting:", v24, 16);
    objc_msgSend(v55, "bs_safeDictionaryForKey:", *MEMORY[0x1E0D22D60]);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setObject:forActivationSetting:", v44, 15);

    objc_msgSend(v55, "bs_safeNumberForKey:", *MEMORY[0x1E0DAB8E0]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "BOOLValue");
    objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 8);

    objc_msgSend(v58, "setObject:forActivationSetting:", v27, 14);
    objc_msgSend(v55, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22DC8], objc_opt_class());
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
      objc_msgSend(v58, "setObject:forActivationSetting:", MEMORY[0x1E0C9AAB0], 31);
    objc_msgSend(v55, "objectForKey:", *MEMORY[0x1E0DC5CF8]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setObject:forActivationSetting:", v47, 32);

    objc_msgSend(v55, "objectForKey:", *MEMORY[0x1E0DC5D10]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setObject:forActivationSetting:", v48, 34);

    objc_msgSend(v54, "bundleIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[SBMainWorkspace _canAppWithBundleIdentifier:requestMovingContentToSceneOpenApplicationOptions:](self, "_canAppWithBundleIdentifier:requestMovingContentToSceneOpenApplicationOptions:", v49, v55);

    if (v50)
    {
      objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagForBool(), 66);
      objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagForBool(), 67);
      objc_msgSend(v58, "setFlag:forActivationSetting:", BSSettingFlagForBool(), 31);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settings != ((void *)0)"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBMainWorkspace _updateActivationSettings:forRequestWithOptions:clientProcess:application:].cold.1();
    objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (BOOL)_executeApplicationTransitionRequest:(id)a3
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  char v18;
  SBMainWorkspace *val;
  id v21;
  void *v22;
  id obj;
  _QWORD v24[4];
  id v25;
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  val = self;
  v32 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(v21, "applicationContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v22, "isBackground");
  v4 = objc_msgSend(v22, "animationDisabled");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v22, "applicationSceneEntities");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v4 ^ 1;
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (v3 & 1 | ((v6 & 1) == 0)
          || (objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "BOOLForActivationSetting:", 4) & 1) != 0)
        {
          v10 = 0;
        }
        else
        {
          v10 = objc_msgSend(v9, "BOOLForActivationSetting:", 1) ^ 1;
        }
        objc_msgSend(v9, "setFlag:forActivationSetting:", BSSettingFlagForBool(), 1);
        objc_msgSend(v9, "setFlag:forActivationSetting:", BSSettingFlagForBool(), 3);
        if (v3)
        {
          objc_msgSend(v22, "setWaitsForSceneUpdates:", 0);
        }
        else
        {
          if (objc_msgSend(v9, "flagForActivationSetting:", 43) == 0x7FFFFFFFFFFFFFFFLL)
          {
            +[SBAssistantController isVisible](SBAssistantController, "isVisible");
            objc_msgSend(v9, "setFlag:forActivationSetting:", BSSettingFlagForBool(), 43);
          }
          +[SBIconController sharedInstance](SBIconController, "sharedInstance", val);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "areAnyIconViewContextMenusShowing");

          if (v12)
            objc_msgSend(v9, "setFlag:forActivationSetting:", 1, 27);
          +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isVisible");

          if (v14)
            objc_msgSend(v9, "setFlag:forActivationSetting:", 1, 44);
          if (SBSpotlightIsVisible())
            objc_msgSend(v9, "setFlag:forActivationSetting:", 1, 26);
          objc_msgSend((id)SBApp, "notificationDispatcher");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "bannerDestination");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isPresentingBannerInLongLook");

          if (v17)
            objc_msgSend(v9, "setFlag:forActivationSetting:", 1, 28);
        }
        v6 &= v10;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
    v4 = v6 ^ 1u;
  }

  objc_msgSend(v22, "setAnimationDisabled:", v4);
  if ((v3 & 1) != 0)
  {
    -[SBMainWorkspace _executeSuspendedTransactionForRequest:](val, "_executeSuspendedTransactionForRequest:", v21);
    v18 = 1;
  }
  else
  {
    objc_initWeak(&location, val);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __56__SBMainWorkspace__executeApplicationTransitionRequest___block_invoke;
    v24[3] = &unk_1E8E9F348;
    objc_copyWeak(&v25, &location);
    v18 = -[SBMainWorkspace _setCurrentTransactionForRequest:fallbackProvider:](val, "_setCurrentTransactionForRequest:fallbackProvider:", v21, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v18;
}

- (BOOL)_setCurrentTransactionForRequest:(id)a3 fallbackProvider:(id)a4
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;

  v7 = a3;
  v8 = (void (**)(id, id))a4;
  -[SBWorkspace eventQueue](self, "eventQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executingEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 2917, CFSTR("must only be called when running on the event queue"));

  }
  objc_msgSend(v7, "transactionProvider");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTransactionProvider:", 0);
    if (!v8)
      goto LABEL_9;
  }
  else
  {
    v13 = 0;
    if (!v8)
      goto LABEL_9;
  }
  if (!v13)
  {
    v8[2](v8, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 2932, CFSTR("at this point we must have a transaction : request=%@"), v7);

  }
  objc_msgSend(v13, "transitionRequest");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 2933, CFSTR("the transaction must reference the original request"));

  }
  objc_msgSend(v7, "transactionConfigurator");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v13);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__SBMainWorkspace__setCurrentTransactionForRequest_fallbackProvider___block_invoke;
  v22[3] = &unk_1E8E9E980;
  v23 = v7;
  v17 = v7;
  -[SBMainWorkspace _addRequestCompletionBlock:toTransaction:](self, "_addRequestCompletionBlock:toTransaction:", v22, v13);
  -[SBMainWorkspace setCurrentTransaction:](self, "setCurrentTransaction:", v13);

  return v13 != 0;
}

- (void)_addRequestCompletionBlock:(id)a3 toTransaction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "completionBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v10 = (void *)objc_msgSend(v5, "copy");
    objc_initWeak(&location, v7);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__SBMainWorkspace__addRequestCompletionBlock_toTransaction___block_invoke;
    v13[3] = &unk_1E8E9F370;
    objc_copyWeak(&v16, &location);
    v11 = v9;
    v14 = v11;
    v12 = v10;
    v15 = v12;
    objc_msgSend(v7, "setCompletionBlock:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

void __69__SBMainWorkspace__setCurrentTransactionForRequest_fallbackProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void (**v5)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionBlock");
    v5 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, a2);

  }
}

id __56__SBMainWorkspace__executeApplicationTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_selectTransactionForAppActivationRequest:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_canAppWithBundleIdentifier:(id)a3 requestMovingContentToSceneOpenApplicationOptions:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  char v11;
  void *v12;

  v5 = *MEMORY[0x1E0DAB8C0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "bs_safeNumberForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v6, "bs_safeStringForKey:", *MEMORY[0x1E0DAB8B8]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)v10, "isEqualToString:", *MEMORY[0x1E0DAB828]);

  LOBYTE(v10) = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilemail"));
  objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x1E0D22D00]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v12, "BOOLValue");
  return v9 & v10 & v11 & v6;
}

uint64_t __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_executeSuspendedTransactionForRequest:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *activeSuspendedWorkspaceTransitions;
  SBSuspendedWorkspaceTransaction *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id from;
  id location;

  v4 = a3;
  if (!self->_activeSuspendedWorkspaceTransitions)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeSuspendedWorkspaceTransitions = self->_activeSuspendedWorkspaceTransitions;
    self->_activeSuspendedWorkspaceTransitions = v5;

  }
  v7 = -[SBMainWorkspaceTransaction initWithTransitionRequest:]([SBSuspendedWorkspaceTransaction alloc], "initWithTransitionRequest:", v4);
  -[NSMutableSet addObject:](self->_activeSuspendedWorkspaceTransitions, "addObject:", v7);
  objc_msgSend(v4, "transactionConfigurator");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t, SBSuspendedWorkspaceTransaction *))(v8 + 16))(v8, v7);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__SBMainWorkspace__executeSuspendedTransactionForRequest___block_invoke;
  v11[3] = &unk_1E8E9F258;
  v10 = v4;
  v12 = v10;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  -[SBMainWorkspace _addRequestCompletionBlock:toTransaction:](self, "_addRequestCompletionBlock:toTransaction:", v11, v7);
  -[SBSuspendedWorkspaceTransaction begin](v7, "begin");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

- (void)_handleOpenApplicationRequest:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void (**v19)(_QWORD);
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  SBWindowingLayoutFormatAdapter *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(_QWORD);
  void *v46;
  int v47;
  void *v48;
  _BOOL4 v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  int v75;
  void *v76;
  char v77;
  void *v78;
  BOOL v79;
  char v80;
  char v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  char v112;
  id v113;
  int v114;
  int v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  _BOOL4 v124;
  id v125;
  void *v126;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  id v142;
  void *v143;
  _UNKNOWN **v144;
  NSObject *v145;
  void *v146;
  void *v147;
  int v148;
  void *v149;
  int v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  _BOOL4 v155;
  uint64_t v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  int v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  int v165;
  int v166;
  id v167;
  id v168;
  int v169;
  SBBackgroundFetchExternalRequest *v170;
  void *v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  BOOL v177;
  id v178;
  void *v179;
  void *v180;
  uint64_t v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  id v193;
  void *v194;
  void *v195;
  void *v196;
  id v197;
  id v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t j;
  uint64_t v203;
  void *v204;
  uint64_t v205;
  void *v206;
  NSObject *v207;
  id v208;
  const char *v209;
  void *v210;
  int v211;
  void *v212;
  NSObject *v213;
  void *v214;
  NSObject *v215;
  int v216;
  void *v217;
  id v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  uint64_t v225;
  void *v226;
  void *v227;
  id v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t i;
  BOOL v233;
  id v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  uint64_t v240;
  int v241;
  uint64_t v242;
  void *v243;
  void *v244;
  void *v245;
  uint64_t v246;
  void *v247;
  char v248;
  void *v249;
  int v250;
  int v251;
  int v252;
  unsigned int v253;
  int v254;
  char v255;
  int v256;
  void (**v257)(_QWORD);
  int v258;
  void *v259;
  int v260;
  id v261;
  _BOOL4 v262;
  int v263;
  id v264;
  int v265;
  void *v266;
  int v267;
  uint64_t v268;
  int v269;
  int v270;
  SBApplicationClassicModeLaunchArgumentParser *v271;
  void *v272;
  int v273;
  uint64_t v274;
  uint64_t v275;
  id v276;
  int v277;
  int v278;
  int v279;
  id v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  int v289;
  void (**v290)(_QWORD, _QWORD, _QWORD);
  void *v291;
  uint64_t v292;
  void *v293;
  uint64_t v294;
  void *v295;
  uint64_t v296;
  void *v297;
  void *v298;
  char v299;
  _BOOL4 v300;
  id v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  id obj;
  id obja;
  uint64_t v307;
  void *v308;
  void *v309;
  uint64_t v310;
  void *v311;
  uint64_t v312;
  char v313;
  id v314;
  int v315;
  void *v316;
  void *v317;
  id v318;
  id v319;
  void *v320;
  id v321;
  id v322;
  void *v323;
  void *v324;
  id v325;
  id v326;
  int v327;
  void *v328;
  SBWindowingLayoutFormatAdapter *v329;
  id v330;
  SBMainWorkspace *v331;
  void (**v332)(_QWORD);
  void *v333;
  void *v334;
  id v335;
  int v336;
  void *v337;
  void *v338;
  id v339;
  void *v340;
  id v341;
  id v342;
  void *v343;
  void *v344;
  void *v345;
  id v346;
  _QWORD v347[4];
  id v348;
  id v349;
  id v350;
  id v351;
  id v352;
  id v353;
  SBWindowingLayoutFormatAdapter *v354;
  uint64_t v355;
  uint64_t v356;
  char v357;
  char v358;
  char v359;
  char v360;
  _QWORD v361[4];
  BOOL v362;
  char v363;
  _QWORD v364[4];
  id v365;
  void (**v366)(_QWORD);
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  _QWORD v375[4];
  id v376;
  id v377;
  id v378;
  _QWORD v379[4];
  id v380;
  void (**v381)(_QWORD);
  _QWORD v382[4];
  NSObject *v383;
  SBMainWorkspace *v384;
  id v385;
  id v386;
  id v387;
  id v388;
  void (**v389)(_QWORD);
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  id v394[5];
  id v395;
  SBMainWorkspace *v396;
  id v397;
  id v398;
  id v399;
  void (**v400)(_QWORD);
  id v401;
  _QWORD v402[4];
  id v403;
  SBMainWorkspace *v404;
  void *v405;
  id v406;
  void (**v407)(_QWORD);
  uint64_t v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  id v421[3];
  uint64_t v422;
  uint64_t v423;
  id v424;
  _QWORD v425[4];
  id v426;
  _BYTE v427[128];
  _BYTE v428[128];
  _BYTE buf[12];
  __int16 v430;
  void *v431;
  __int16 v432;
  id v433;
  _BYTE v434[128];
  _BYTE v435[128];
  uint64_t v436;
  _BYTE v437[128];
  _BYTE v438[128];
  uint64_t v439;

  v439 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  BSDispatchQueueAssertMain();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("activationSettings != ((void *)0)"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBMainWorkspace _handleOpenApplicationRequest:options:activationSettings:origin:withResult:].cold.1();
    objc_msgSend(objc_retainAutorelease(v129), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0626EF8);
  }
  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v425[0] = MEMORY[0x1E0C809B0];
  v425[1] = 3221225472;
  v425[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke;
  v425[3] = &unk_1E8E9F598;
  v18 = v16;
  v426 = v18;
  v19 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v425);
  v424 = 0;
  -[SBMainWorkspace _validateRequestToOpenApplication:options:origin:error:](self, "_validateRequestToOpenApplication:options:origin:error:", v12, v13, v15, &v424);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v424;
  v22 = v21;
  if (!v12 || v20)
  {
    v341 = v21;
    v343 = v20;
    v345 = v17;
    v423 = 0;
    v344 = (void *)objc_opt_new();
    objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22D00], objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v336 = objc_msgSend(v23, "BOOLValue");

    v422 = 0;
    v24 = *MEMORY[0x1E0DAB8B8];
    objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB8B8], objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v340 = v13;
    v338 = v25;
    if (v25 && (SBValidateLayoutRoleString(v25, &v423, &v422) & 1) == 0)
    {
      FBSOpenApplicationErrorCreate();
      v339 = (id)objc_claimAutoreleasedReturnValue();
      v19[2](v19);
      v29 = 0;
      v342 = 0;
      v31 = 0;
      v346 = 0;
      v20 = v343;
      v22 = v341;
LABEL_402:

      v13 = v340;
      goto LABEL_403;
    }
    v421[2] = 0;
    v421[1] = 0;
    v331 = self;
    v20 = v343;
    v327 = v336 ^ 1;
    -[SBMainWorkspace _targetWindowSceneForApplication:options:settings:requireForeground:targetDisplayConfiguration:error:](self, "_targetWindowSceneForApplication:options:settings:requireForeground:targetDisplayConfiguration:error:", v343, v13, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v339 = 0;
    v27 = 0;
    v337 = v26;
    if (!v26 && v27)
    {
      v28 = v27;
      ((void (*)(void (**)(_QWORD), id))v19[2])(v19, v27);
      v29 = 0;
      v342 = 0;
      v335 = 0;
      v346 = 0;
      v22 = v341;
LABEL_401:

      v31 = v335;
      goto LABEL_402;
    }
    v326 = v27;
    objc_msgSend(v13, "bs_safeStringForKey:", *MEMORY[0x1E0DAB8D8]);
    v334 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bs_safeArrayForKey:", *MEMORY[0x1E0DAB888]);
    v333 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "hasEntitlement:", CFSTR("com.apple.springboard.testautomation")) & 1) != 0)
      v30 = 1;
    else
      v30 = objc_msgSend(v15, "hasEntitlement:", CFSTR("com.apple.LaunchApp"));
    v32 = 0;
    v332 = v19;
    if (v334 && v333)
    {
      v346 = 0;
      if (v30)
      {
        v421[0] = 0;
        v329 = -[SBWindowingLayoutFormatAdapter initWithWindowScene:]([SBWindowingLayoutFormatAdapter alloc], "initWithWindowScene:", v26);
        -[SBWindowingLayoutFormatAdapter parse:bundleIdentifier:error:](v329, "parse:bundleIdentifier:error:", v334, v333, v421);
        v33 = v421[0];
        if (v33)
        {
          v34 = v33;
          ((void (*)(void (**)(_QWORD), id))v332[2])(v332, v33);
          v29 = 0;
          v342 = 0;
          v335 = 0;
          v346 = 0;
LABEL_40:
          v22 = v341;
LABEL_400:

          v28 = v326;
          v19 = v332;
          goto LABEL_401;
        }
        v330 = v18;
        v322 = v15;
        v325 = v12;
        v419 = 0u;
        v420 = 0u;
        v417 = 0u;
        v418 = 0u;
        v34 = v333;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v417, v438, 16);
        if (!v35)
        {
          v346 = 0;
          goto LABEL_34;
        }
        v36 = v35;
        v346 = 0;
        v37 = *(_QWORD *)v418;
LABEL_22:
        v38 = 0;
        while (1)
        {
          if (*(_QWORD *)v418 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(v17, "applicationWithBundleIdentifier:", *(_QWORD *)(*((_QWORD *)&v417 + 1) + 8 * v38));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v39)
            break;
          v40 = v39;
          if (v346)
          {
            objc_msgSend(v344, "addObject:", v39);
          }
          else
          {
            v346 = v39;
            v423 = 1;
          }

          if (v36 == ++v38)
          {
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v417, v438, 16);
            if (!v36)
            {
LABEL_34:

              v15 = v322;
              v12 = v325;
              v32 = v329;
              v18 = v330;
              v19 = v332;
              goto LABEL_35;
            }
            goto LABEL_22;
          }
        }
        FBSOpenApplicationErrorCreate();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(void (**)(_QWORD), void *))v332[2])(v332, v41);

        v29 = 0;
        v342 = 0;
        v335 = 0;
        v15 = v322;
        v12 = v325;
LABEL_39:
        v18 = v330;
        v20 = v343;
        goto LABEL_40;
      }
    }
    else
    {
      v346 = 0;
    }
LABEL_35:
    v329 = v32;
    v330 = v18;
    objc_msgSend(v26, "switcherController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "windowManagementStyle");

    if (SBLayoutRoleIsValid(v423) && v423 != 1 && !v43)
    {
      FBSOpenApplicationErrorCreate();
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = v19;
      v34 = (id)v44;
      ((void (*)(void (**)(_QWORD), uint64_t))v45[2])(v45, v44);
      v29 = 0;
      v342 = 0;
      v335 = 0;
      goto LABEL_39;
    }
    objc_msgSend(v26, "switcherController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "isChamoisWindowingUIEnabled");

    objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB878], objc_opt_class());
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v299 = objc_msgSend(v48, "BOOLValue");

    v49 = !SBLayoutRoleIsValid(v423);
    if (v423 == 1)
      v49 = 1;
    v300 = v49;
    if (v49)
    {
      v50 = v343;

      v51 = 0;
      v342 = 0;
      v335 = 0;
      v302 = 0;
      v303 = 0;
      v304 = 0;
      v346 = v50;
    }
    else if (v423 == 2)
    {
      v335 = v343;
      v51 = 0;
      v342 = 0;
      v303 = 0;
      v304 = v423;
      v302 = 0;
    }
    else
    {
      if (v423 == 3)
      {
        v342 = v343;
        v51 = 0;
        v335 = 0;
        v302 = 0;
        v303 = v423;
      }
      else
      {
        if (v423 == 4)
        {
          v51 = v343;
          v342 = 0;
          v335 = 0;
          v302 = v423;
        }
        else
        {
          v51 = 0;
          v342 = 0;
          v335 = 0;
          v302 = 0;
        }
        v303 = 0;
      }
      v304 = 0;
    }
    objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB850], objc_opt_class());
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v316, "count") >= 1)
    {
      v18 = v330;
      if (v43)
      {
        v415 = 0u;
        v416 = 0u;
        v413 = 0u;
        v414 = 0u;
        v52 = v316;
        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v413, v437, 16);
        if (!v53)
          goto LABEL_115;
        v54 = *(_QWORD *)v414;
        v298 = v52;
        v319 = v14;
        v323 = v15;
        v292 = *(_QWORD *)v414;
        while (1)
        {
          v55 = 0;
          v294 = v53;
          do
          {
            if (*(_QWORD *)v414 != v54)
            {
              v56 = v55;
              objc_enumerationMutation(v52);
              v55 = v56;
            }
            v296 = v55;
            v312 = *(_QWORD *)(*((_QWORD *)&v413 + 1) + 8 * v55);
            objc_msgSend(v52, "bs_safeArrayForKey:");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v57)
            {
              objc_msgSend(v52, "bs_safeDictionaryForKey:", v312);
              v58 = objc_claimAutoreleasedReturnValue();
              v59 = (void *)v58;
              if (v58)
              {
                v436 = v58;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v436, 1);
                v57 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v57 = 0;
              }

              v52 = v298;
            }
            v411 = 0u;
            v412 = 0u;
            v409 = 0u;
            v410 = 0u;
            obj = v57;
            v307 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v409, v435, 16);
            if (v307)
            {
              v310 = *(_QWORD *)v410;
              do
              {
                v60 = 0;
                do
                {
                  if (*(_QWORD *)v410 != v310)
                    objc_enumerationMutation(obj);
                  v61 = *(void **)(*((_QWORD *)&v409 + 1) + 8 * v60);
                  objc_msgSend(v61, "bs_safeObjectForKey:ofType:", v24, objc_opt_class());
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_QWORD *)buf = 0;
                  v408 = 0;
                  v14 = v319;
                  if ((SBValidateLayoutRoleString(v62, (uint64_t *)buf, &v408) & 1) == 0
                    || *(_QWORD *)buf == 1 && v346 && (v47 & 1) == 0
                    || *(_QWORD *)buf == 2 && v335 && (v47 & 1) == 0
                    || *(_QWORD *)buf == 3 && v342 && (v47 & 1) == 0
                    || *(_QWORD *)buf == 4 && v51 && (v47 & 1) == 0)
                  {
                    FBSOpenApplicationErrorCreate();
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    ((void (*)(void (**)(_QWORD), void *))v332[2])(v332, v83);

                    v15 = v323;
                    v18 = v330;
                    v20 = v343;
                    v22 = v341;
LABEL_147:

                    goto LABEL_398;
                  }
                  v317 = v51;
                  v402[0] = MEMORY[0x1E0C809B0];
                  v402[1] = 3221225472;
                  v402[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_2;
                  v402[3] = &unk_1E8E9F5C0;
                  v403 = v17;
                  v407 = v332;
                  v404 = v331;
                  v405 = v61;
                  v406 = v323;
                  v63 = MEMORY[0x1D17E5550](v402);
                  v64 = (void *)v63;
                  switch(*(_QWORD *)buf)
                  {
                    case 1:
                      (*(void (**)(uint64_t, uint64_t))(v63 + 16))(v63, v312);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v65)
                        goto LABEL_100;
                      v66 = v65;
                      if (v346)
                        objc_msgSend(v344, "addObject:", v65);
                      else
                        v346 = v65;
                      if (!v422)
                        goto LABEL_105;
                      goto LABEL_106;
                    case 2:
                      (*(void (**)(uint64_t, uint64_t))(v63 + 16))(v63, v312);
                      v67 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v67)
                        goto LABEL_100;
                      v66 = v67;
                      if (v335)
                      {
                        objc_msgSend(v344, "addObject:", v67);
                      }
                      else
                      {
                        v335 = v67;
                        v304 = *(_QWORD *)buf;
                      }
LABEL_105:
                      v422 = v408;
LABEL_106:

                      break;
                    case 3:
                      (*(void (**)(uint64_t, uint64_t))(v63 + 16))(v63, v312);
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v68)
                        goto LABEL_100;
                      v66 = v68;
                      if (!v47)
                      {
                        v66 = v68;

                        v303 = *(_QWORD *)buf;
                        v342 = v66;
                        goto LABEL_106;
                      }
LABEL_99:
                      objc_msgSend(v344, "addObject:", v66);
                      goto LABEL_106;
                    case 4:
                      (*(void (**)(uint64_t, uint64_t))(v63 + 16))(v63, v312);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v69)
                      {
LABEL_100:
                        v70 = 0;
                        goto LABEL_108;
                      }
                      v66 = v69;
                      if (!v47)
                      {
                        v66 = v69;

                        v302 = *(_QWORD *)buf;
                        v317 = v66;
                        goto LABEL_106;
                      }
                      goto LABEL_99;
                  }
                  v70 = 1;
LABEL_108:
                  v18 = v330;

                  if (!v70)
                  {
                    v14 = v319;
                    v15 = v323;
                    v20 = v343;
                    v22 = v341;
                    v51 = v317;
                    goto LABEL_147;
                  }
                  ++v60;
                  v51 = v317;
                }
                while (v307 != v60);
                v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v409, v435, 16);
                v14 = v319;
                v15 = v323;
                v52 = v298;
                v307 = v71;
              }
              while (v71);
            }

            v55 = v296 + 1;
            v54 = v292;
          }
          while (v296 + 1 != v294);
          v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v413, v437, 16);
          if (!v53)
          {
LABEL_115:

            goto LABEL_116;
          }
        }
      }
      FBSOpenApplicationErrorCreate();
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(_QWORD), void *))v332[2])(v332, v78);
      v20 = v343;
      v22 = v341;
LABEL_399:
      v29 = v51;

      v34 = v316;
      goto LABEL_400;
    }
LABEL_116:
    v72 = objc_msgSend(v344, "count");
    v73 = v423;
    v315 = 0;
    v22 = v341;
    if (SBLayoutRoleIsValid(v423) && !v346)
    {
      if (v72)
        v74 = 0;
      else
        v74 = v73 == 4;
      v75 = v47 ^ 1;
      if (v74)
        v75 = 1;
      v315 = v75;
    }
    objc_msgSend(v337, "switcherController");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v76, "layoutContainsRole:", 1);

    if (v315 && (v77 & 1) == 0 && (v47 & 1) == 0)
    {
      FBSOpenApplicationErrorCreate();
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (*)(void (**)(_QWORD), void *))v332[2])(v332, v78);
      v18 = v330;
LABEL_152:
      v20 = v343;
      goto LABEL_399;
    }
    v313 = v77;
    v18 = v330;
    if (((v327 | objc_msgSend(v14, "BOOLForActivationSetting:", 51)) & 1) != 0)
    {
      v79 = -[SBMainWorkspace _canAppWithBundleIdentifier:requestMovingContentToSceneOpenApplicationOptions:](v331, "_canAppWithBundleIdentifier:requestMovingContentToSceneOpenApplicationOptions:", v12, v13);
      if (!v336)
        goto LABEL_138;
      v80 = v79;
      if (v335 || v342 || v51)
      {
        if (v79)
          goto LABEL_138;
      }
      else
      {
        if (objc_msgSend(v344, "count"))
          v81 = v80;
        else
          v81 = 1;
        if ((v81 & 1) != 0)
        {
LABEL_138:
          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22CF0], objc_opt_class());
          v298 = (void *)objc_claimAutoreleasedReturnValue();
          if (v298)
          {
            if (v335 || v342 || v51 || objc_msgSend(v344, "count"))
            {
              FBSOpenApplicationErrorCreate();
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (*)(void (**)(_QWORD), void *))v332[2])(v332, v82);
              v20 = v343;
              goto LABEL_397;
            }
            objc_msgSend(v298, "objectForKey:", *MEMORY[0x1E0D008F0]);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v262 = v84 != 0;

          }
          else
          {
            v262 = 0;
          }
          v85 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D22CE0]);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "setWithArray:", v86);
          v308 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "bs_safeURLForKey:", *MEMORY[0x1E0D22D78]);
          v309 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22D70], objc_opt_class());
          obja = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22DA8], objc_opt_class());
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v267 = objc_msgSend(v87, "BOOLValue");

          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22D88], objc_opt_class());
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v270 = objc_msgSend(v88, "BOOLValue");

          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB768], objc_opt_class());
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v89, "BOOLValue"))
          {
            objc_msgSend(v343, "bundleIdentifier");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v277 = objc_msgSend(v90, "isEqualToString:", CFSTR("com.apple.InCallService"));

          }
          else
          {
            v277 = 0;
          }

          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB540], objc_opt_class());
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v273 = objc_msgSend(v91, "BOOLValue");

          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22D58], objc_opt_class());
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22DC8], objc_opt_class());
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v256 = objc_msgSend(v92, "BOOLValue");

          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DC5D00], objc_opt_class());
          v288 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DC5D08], objc_opt_class());
          v311 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB8B0], objc_opt_class());
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v254 = objc_msgSend(v93, "BOOLValue");

          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB8A0], objc_opt_class());
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v255 = objc_msgSend(v94, "BOOLValue");

          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB8A8], objc_opt_class());
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v289 = objc_msgSend(v95, "BOOLValue");

          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB860], objc_opt_class());
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "BOOLValue");

          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB8C8], objc_opt_class());
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          v253 = objc_msgSend(v97, "BOOLValue");

          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB870], objc_opt_class());
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D44650], objc_opt_class());
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v260 = objc_msgSend(v99, "BOOLValue");

          if (v98)
          {
            v252 = objc_msgSend(v98, "BOOLValue");
          }
          else
          {
            +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v252 = objc_msgSend(v100, "isSystemAssistantExperiencePersistentSiriEnabled");

          }
          if ((v289 & 1) != 0)
          {
            v258 = 0;
          }
          else
          {
            objc_msgSend(v343, "info");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v258 = objc_msgSend(v101, "alwaysDeliversOpenURLActionsUsingWorkspace");

          }
          v318 = v51;
          v281 = v98;
          if (v309 && !v311)
          {
            objc_msgSend(v309, "absoluteString");
            v311 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D22D18]);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D00920], objc_opt_class());
          v285 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D00940], objc_opt_class());
          v284 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D00950], objc_opt_class());
          v283 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D00948], objc_opt_class());
          v282 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D00930], objc_opt_class());
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = objc_msgSend(v103, "BOOLValue");

          objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D00928], objc_opt_class());
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          v279 = objc_msgSend(v105, "BOOLValue");

          objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D00938], objc_opt_class());
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "BOOLValue");

          objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D00958], objc_opt_class());
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          v265 = objc_msgSend(v107, "BOOLValue");

          objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22C40], objc_opt_class());
          v295 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22C48], objc_opt_class());
          v293 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D0FEF8], objc_opt_class());
          v287 = (void *)objc_claimAutoreleasedReturnValue();
          v291 = v102;
          objc_msgSend(v102, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D0FF00], objc_opt_class());
          v286 = (void *)objc_claimAutoreleasedReturnValue();
          +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v102) = objc_msgSend(v108, "isInSetupMode");

          if ((_DWORD)v102)
          {
            objc_msgSend(v343, "info");
            v109 = objc_claimAutoreleasedReturnValue();
            if (v109)
            {
              v110 = (void *)v109;
              objc_msgSend(v343, "info");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = objc_msgSend(v111, "isLaunchableDuringSetup");

              if ((v112 & 1) == 0)
              {
                FBSOpenApplicationErrorCreate();
                v328 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (*)(void))v332[2])();
                v18 = v330;
                v20 = v343;
                v22 = v341;
                goto LABEL_209;
              }
            }
          }
          v324 = v15;
          v113 = v14;
          if (((v104 | v279) & 1) != 0)
            v114 = 0;
          else
            v114 = objc_msgSend(v343, "isAnyTerminationAssertionInEffect") ^ 1;
          v250 = v114;
          v115 = v114 & v327 | v277;
          objc_msgSend(v13, "bs_safeObjectForKey:ofType:", CFSTR("__SBWorkspaceOpenOptionUnlockResult"), objc_opt_class());
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v278 = objc_msgSend(v116, "BOOLValue");

          objc_msgSend(v337, "uiLockStateProvider");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = v117;
          if (v117)
          {
            v119 = v117;
          }
          else
          {
            +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
            v119 = (id)objc_claimAutoreleasedReturnValue();

          }
          v22 = v341;
          v51 = v318;

          v328 = v119;
          if (!v115 || ((objc_msgSend(v119, "isUILocked") ^ 1 | v278) & 1) != 0)
          {
            if (v273)
            {
              objc_msgSend(v337, "homeScreenController");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v120, "iconManager");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              v122 = v121;
              if (v121)
              {
                v123 = v121;
              }
              else
              {
                +[SBIconController sharedInstance](SBIconController, "sharedInstance");
                v130 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v130, "iconManager");
                v123 = (id)objc_claimAutoreleasedReturnValue();

                v51 = v318;
              }

              objc_msgSend(v123, "iconModel");
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v131, "applicationIconForBundleIdentifier:", v12);
              v132 = (void *)objc_claimAutoreleasedReturnValue();

              if (v132)
                objc_msgSend(v123, "scrollToIconListContainingIcon:animate:", v132, 0);

              v22 = v341;
            }
            if ((v336 & 1) == 0)
            {
              +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
              v133 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v133, "resetIdleTimerForReason:", CFSTR("OpenApplication"));

            }
            objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22CE8], objc_opt_class());
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "bs_safeStringForKey:", *MEMORY[0x1E0DAB898]);
            v135 = objc_claimAutoreleasedReturnValue();
            v136 = (void *)v135;
            if (v134)
            {
              v137 = objc_msgSend(v134, "integerValue");
              v14 = v113;
LABEL_198:
              v15 = v324;
              goto LABEL_199;
            }
            v14 = v113;
            if (!v135)
            {
              v137 = -1;
              goto LABEL_198;
            }
            v394[0] = 0;
            v271 = -[SBApplicationClassicModeLaunchArgumentParser initWithApplication:]([SBApplicationClassicModeLaunchArgumentParser alloc], "initWithApplication:", v343);
            v137 = -[SBApplicationClassicModeLaunchArgumentParser classicModeForLaunchArgument:error:](v271, "classicModeForLaunchArgument:error:", v136, v394);
            v142 = v394[0];
            v15 = v324;
            if (v142)
            {
              ((void (*)(void (**)(_QWORD), id))v332[2])(v332, v142);
            }
            else
            {
              objc_msgSend(v343, "processState");
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              v269 = objc_msgSend(v157, "isRunning");

              if (!v269 || v137 == objc_msgSend(v343, "_classicMode"))
              {

                v22 = v341;
                v51 = v318;
LABEL_199:

                if (_SBApplicationClassicModeIsClassic(v137) && v335)
                {
                  FBSOpenApplicationErrorCreate();
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (*)(void (**)(_QWORD), void *))v332[2])(v332, v138);

                  v17 = v345;
                  v18 = v330;
                  v20 = v343;
LABEL_210:
                  v82 = v308;
                  v128 = v297;
LABEL_396:

LABEL_397:
LABEL_398:
                  v78 = v298;
                  goto LABEL_399;
                }
                objc_msgSend(obja, "objectForKey:", *MEMORY[0x1E0CEB2C0]);
                v139 = objc_claimAutoreleasedReturnValue();
                v140 = (void *)v139;
                if (v139 && v335)
                {
                  FBSOpenApplicationErrorCreate();
                  v141 = (void *)objc_claimAutoreleasedReturnValue();
                  ((void (*)(void (**)(_QWORD), void *))v332[2])(v332, v141);
                  v17 = v345;
                  v18 = v330;
                  v128 = v297;
LABEL_394:

                  v20 = v343;
                  goto LABEL_395;
                }
                v272 = (void *)v139;
                v274 = v137;
                objc_msgSend(v13, "objectForKey:", CFSTR("SBWorkspaceOpenApplicationResolvedWebClipSceneEntityKey"));
                v268 = objc_claimAutoreleasedReturnValue();
                v143 = v343;
                v144 = &off_1E8E94000;
                if (!v343)
                  goto LABEL_220;
                objc_msgSend(v343, "info");
                v145 = objc_claimAutoreleasedReturnValue();
                if ((-[NSObject isAppClip](v145, "isAppClip") & 1) == 0
                  && !objc_msgSend(v343, "isWebApplication"))
                {
LABEL_219:

                  v143 = v343;
                  goto LABEL_220;
                }

                v143 = v343;
                if (v268)
                {
LABEL_220:
                  objc_msgSend(v13, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DC5CF0], objc_opt_class());
                  v147 = (void *)objc_claimAutoreleasedReturnValue();
                  v148 = objc_msgSend(v147, "BOOLValue");

                  objc_msgSend(v143, "info");
                  v149 = (void *)objc_claimAutoreleasedReturnValue();
                  v150 = objc_msgSend(v149, "hasViewServicesEntitlement");

                  if (!v150 || !v148)
                  {
                    v155 = v262;
                    v156 = v274;
                    goto LABEL_233;
                  }
                  objc_msgSend(v15, "bundleIdentifier");
                  v151 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v144[397], "sharedInstanceIfExists");
                  v152 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v152, "applicationWithBundleIdentifier:", v151);
                  v153 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v153)
                  {
                    v154 = v151;
                    v155 = v262;
                  }
                  else
                  {
                    +[SBApplicationSupportServiceRequestContext hostingApplicationBundleIDForPid:](SBApplicationSupportServiceRequestContext, "hostingApplicationBundleIDForPid:", objc_msgSend(v15, "pid"));
                    v154 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v144[397], "sharedInstanceIfExists");
                    v159 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v159, "applicationWithBundleIdentifier:", v154);
                    v153 = (void *)objc_claimAutoreleasedReturnValue();

                    v155 = v262;
                    v156 = v274;
                    if (!v153)
                    {
LABEL_232:

LABEL_233:
                      v275 = v156;
                      v263 = v300 & objc_msgSend(v343, "_canLaunchInClassicMode:", v156);
                      if (v343)
                      {
                        objc_msgSend(v343, "info");
                        v160 = (void *)objc_claimAutoreleasedReturnValue();
                        v161 = objc_msgSend(v160, "hasHiddenTag");

                        v162 = objc_msgSend(v343, "_classicMode");
                        if (v161)
                        {
                          v163 = v162;
                          objc_msgSend(v343, "processState");
                          v164 = (void *)objc_claimAutoreleasedReturnValue();
                          v165 = objc_msgSend(v164, "isRunning");
                          v166 = v163 == v156 ? 0 : v165;
                          v167 = v14;
                          v168 = v12;
                          v169 = v166 & v263;

                          v74 = v169 == 1;
                          v12 = v168;
                          v14 = v167;
                          if (v74)
                            SBWorkspaceTerminateApplication(v343, 5, 0, CFSTR("exit for classic mode relaunch"), 0);
                        }
                      }
                      if (v265)
                        SBWorkspaceTerminateApplication(v343, 5, 0, CFSTR("terminate for debugging launch request"), 0);
                      if (v155)
                      {
                        v170 = [SBBackgroundFetchExternalRequest alloc];
                        objc_msgSend(v343, "info");
                        v171 = (void *)objc_claimAutoreleasedReturnValue();
                        v172 = -[SBBackgroundFetchExternalRequest initForAppInfo:](v170, "initForAppInfo:", v171);

                        objc_msgSend(v172, "action");
                        v173 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v308, "addObject:", v173);

                      }
                      else
                      {
                        v172 = 0;
                      }
                      v22 = v341;
                      if (v272)
                      {
                        v174 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA620]), "initWithSessionIdentifier:", v272);
                        objc_msgSend(v308, "addObject:", v174);

                      }
                      if (v309)
                      {
                        v175 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7E0]), "initWithURL:", v309);
                        objc_msgSend(v308, "addObject:", v175);

                      }
                      v176 = v343;
                      if (v12 || !objc_msgSend(v295, "length"))
                      {
                        v177 = 0;
                      }
                      else if (objc_msgSend(v293, "length"))
                      {
                        -[SBMainWorkspace _handlerForExtensionPoint:](v331, "_handlerForExtensionPoint:", v293);
                        v185 = (void *)objc_claimAutoreleasedReturnValue();
                        v177 = v185 != 0;
                        if (v185)
                        {
                          v186 = (void *)objc_opt_new();
                          objc_msgSend(v186, "bs_setSafeObject:forKey:", v287, *MEMORY[0x1E0DAB7E8]);
                          objc_msgSend(v186, "bs_setSafeObject:forKey:", v286, *MEMORY[0x1E0DAB7F0]);
                          if (objc_msgSend(v186, "count"))
                            v187 = v186;
                          else
                            v187 = 0;
                          v379[0] = MEMORY[0x1E0C809B0];
                          v379[1] = 3221225472;
                          v379[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_534;
                          v379[3] = &unk_1E8E9F638;
                          v380 = v295;
                          v381 = v332;
                          objc_msgSend(v185, "launchExtensionWithBundleID:options:completion:", v380, v187, v379);

                        }
                        v176 = v343;
                        v22 = v341;
                        v51 = v318;
                      }
                      else
                      {
                        v177 = 0;
                        v176 = v343;
                      }
                      if (!v176)
                      {
                        if (objc_msgSend(v308, "count"))
                        {
                          objc_msgSend((id)SBApp, "_mainScene");
                          v188 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v188, "sendActions:", v308);

                          ((void (*)(void (**)(_QWORD), _QWORD))v332[2])(v332, 0);
                        }
                        else if (!v177)
                        {
                          __SBWorkspaceActivateSpringBoardWithResult(0, 0, 0, 0, 0, v332, 0);
                        }
                        v15 = v324;
                        v18 = v330;
                        v128 = v297;
                        v140 = v272;
                        goto LABEL_392;
                      }
                      v249 = v172;
                      v248 = v47;
                      v178 = v12;
                      if (-[SBInCallPresentationManager canHandleOpenApplicationRequestForApplication:](v331->_inCallPresentationManager, "canHandleOpenApplicationRequestForApplication:", v176))
                      {
                        objc_msgSend(v176, "processState");
                        v179 = v176;
                        v180 = (void *)objc_claimAutoreleasedReturnValue();
                        v181 = objc_msgSend(v180, "pid");

                        objc_msgSend(MEMORY[0x1E0D22920], "sharedInstanceIfExists");
                        v182 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v182, "processForPID:", v181);
                        v183 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v183, "workspace");
                        v184 = (void *)objc_claimAutoreleasedReturnValue();
                        -[SBInCallPresentationManager handleOpenApplicationRequest:clientWorkspace:actions:origin:options:withResult:](v331->_inCallPresentationManager, "handleOpenApplicationRequest:clientWorkspace:actions:origin:options:withResult:", v179, v184, v308, v324, v13, v332);

                        v15 = v324;
LABEL_273:
                        v18 = v330;
LABEL_391:
                        v128 = v297;
                        v140 = v272;
                        v172 = v249;
LABEL_392:

                        v17 = v345;
                        goto LABEL_393;
                      }
                      if (!v250)
                      {
                        FBSOpenApplicationErrorCreate();
                        v194 = (void *)objc_claimAutoreleasedReturnValue();
                        ((void (*)(void (**)(_QWORD), void *))v332[2])(v332, v194);

                        v15 = v324;
                        goto LABEL_273;
                      }
                      v321 = v14;
                      objc_msgSend(v337, "sceneManager");
                      v189 = (void *)objc_claimAutoreleasedReturnValue();
                      if (!v339)
                      {
                        objc_msgSend(v337, "_fbsDisplayConfiguration");
                        v339 = (id)objc_claimAutoreleasedReturnValue();
                      }
                      v251 = v258 | v289;
                      objc_msgSend(v189, "displayIdentity");
                      v190 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v13, "objectForKey:", CFSTR("SBWorkspaceOpenApplicationResolvedWebClipSceneEntityKey"));
                      v191 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v343, "info");
                      v192 = (void *)objc_claimAutoreleasedReturnValue();
                      v259 = v191;
                      if ((objc_msgSend(v192, "isAppClip") & 1) != 0
                        || objc_msgSend(v343, "isWebApplication"))
                      {

                        if (v191)
                        {
                          v193 = v191;
                          goto LABEL_310;
                        }
                      }
                      else
                      {

                      }
                      if ((v251 | v256) == 1
                        && (objc_msgSend(v343, "info"),
                            v210 = (void *)objc_claimAutoreleasedReturnValue(),
                            v211 = objc_msgSend(v210, "supportsMultiwindow"),
                            v210,
                            v211))
                      {
                        v193 = +[SBDeviceApplicationSceneEntity newEntityWithApplication:sceneHandleProvider:displayIdentity:](SBDeviceApplicationSceneEntity, "newEntityWithApplication:sceneHandleProvider:displayIdentity:", v343, v189, v190);
                      }
                      else
                      {
                        if (v288)
                        {
                          +[SBDeviceApplicationSceneEntity entityWithApplication:scenePersistenceIdentifier:sceneHandleProvider:displayIdentity:](SBDeviceApplicationSceneEntity, "entityWithApplication:scenePersistenceIdentifier:sceneHandleProvider:displayIdentity:", v343, v288, v189, v190);
                          v212 = (void *)objc_claimAutoreleasedReturnValue();
                          SBLogCommon();
                          v213 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138543618;
                            *(_QWORD *)&buf[4] = v288;
                            v430 = 2114;
                            v431 = v212;
                            _os_log_impl(&dword_1D0540000, v213, OS_LOG_TYPE_DEFAULT, "did retrieve a workspace primary app scene entity for the received — %{public}@ — scene persistence identifier: %{public}@", buf, 0x16u);
                          }

LABEL_311:
                          if (objc_msgSend(v308, "count"))
                            objc_msgSend(v212, "addActions:", v308);
                          -[SBMainWorkspace _updateActivationSettings:forRequestWithOptions:clientProcess:application:](v331, "_updateActivationSettings:forRequestWithOptions:clientProcess:application:", v14, v340, v324, v343);
                          objc_msgSend(v212, "applyActivationSettings:", v14);
                          if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]())
                            v216 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
                          else
                            v216 = 0;
                          if (((LCSFeatureEnabled() | v216) & v260) == 1)
                          {
                            objc_msgSend(v212, "setFlag:forActivationSetting:", 1, 36);
                            objc_msgSend(v212, "setFlag:forActivationSetting:", 1, 35);
                          }
                          if (v263)
                          {
                            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v275);
                            v217 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v212, "setObject:forActivationSetting:", v217, 20);

                          }
                          if (v279)
                          {
                            objc_msgSend(v212, "setObject:forActivationSetting:", 0, 15);
                          }
                          else
                          {
                            objc_msgSend(v212, "setObject:forProcessSetting:", v285, 1);
                            objc_msgSend(v212, "setObject:forProcessSetting:", v284, 2);
                            objc_msgSend(v212, "setObject:forProcessSetting:", v283, 3);
                            objc_msgSend(v212, "setObject:forProcessSetting:", v282, 4);
                            objc_msgSend(v212, "setFlag:forProcessSetting:", BSSettingFlagIfYes(), 6);
                            objc_msgSend(v212, "setFlag:forProcessSetting:", BSSettingFlagIfYes(), 5);
                            objc_msgSend(v212, "setFlag:forProcessSetting:", BSSettingFlagIfYes(), 7);
                          }
                          v375[0] = MEMORY[0x1E0C809B0];
                          v375[1] = 3221225472;
                          v375[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_537;
                          v375[3] = &unk_1E8E9F660;
                          v264 = v189;
                          v376 = v264;
                          v261 = v190;
                          v377 = v261;
                          v257 = v332;
                          v378 = v257;
                          v290 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v375);
                          v266 = (void *)objc_opt_new();
                          if (v300)
                          {
                            v301 = v212;
                          }
                          else
                          {
                            if ((objc_msgSend(v212, "supportsLayoutRole:", v423) & 1) == 0)
                            {
                              objc_msgSend(v212, "uniqueIdentifier");
                              v225 = objc_claimAutoreleasedReturnValue();
                              SBLayoutRoleDescription(v423);
                              v226 = (void *)objc_claimAutoreleasedReturnValue();
                              v218 = (id)v225;
                              FBSOpenApplicationErrorCreate();
                              v227 = (void *)objc_claimAutoreleasedReturnValue();
                              ((void (*)(void (**)(_QWORD), void *))v257[2])(v257, v227);
                              v301 = 0;
                              v314 = 0;
                              v280 = 0;
                              v276 = 0;
                              goto LABEL_388;
                            }
                            switch(v423)
                            {
                              case 2:
                                v314 = v212;
                                v301 = 0;
                                goto LABEL_326;
                              case 3:
                                v280 = v212;
                                v301 = 0;
                                v314 = 0;
                                goto LABEL_327;
                              case 4:
                                v234 = v212;
                                objc_msgSend(v234, "application");
                                v235 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v235, "_dataStore");
                                v236 = (void *)objc_claimAutoreleasedReturnValue();

                                v276 = v234;
                                objc_msgSend(v234, "uniqueIdentifier");
                                v237 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v236, "sceneStoreForIdentifier:creatingIfNecessary:", v237, 0);
                                v238 = (void *)objc_claimAutoreleasedReturnValue();
                                v239 = v238;
                                if (v238)
                                  objc_msgSend(v238, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("originatedInCenterWindow"));

                                v301 = 0;
                                v314 = 0;
                                v280 = 0;
LABEL_328:
                                if (v346 && !v301)
                                {
                                  ((void (**)(_QWORD, id, uint64_t))v290)[2](v290, v346, 1);
                                  v301 = (id)objc_claimAutoreleasedReturnValue();
                                }
                                if (!v335
                                  || v314
                                  || (((void (**)(_QWORD, id, uint64_t))v290)[2](v290, v335, v304),
                                      (v314 = (id)objc_claimAutoreleasedReturnValue()) != 0))
                                {
                                  if (!v342
                                    || v280
                                    || (((void (**)(_QWORD, id, uint64_t))v290)[2](v290, v342, v303),
                                        (v280 = (id)objc_claimAutoreleasedReturnValue()) != 0))
                                  {
                                    if (!v318
                                      || v276
                                      || (((void (**)(_QWORD, id, uint64_t))v290)[2](v290, v318, v302),
                                          (v276 = (id)objc_claimAutoreleasedReturnValue()) != 0))
                                    {
                                      v373 = 0u;
                                      v374 = 0u;
                                      v371 = 0u;
                                      v372 = 0u;
                                      v218 = v344;
                                      v219 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v371, v428, 16);
                                      if (v219)
                                      {
                                        v220 = v219;
                                        v221 = *(_QWORD *)v372;
LABEL_342:
                                        v222 = 0;
                                        while (1)
                                        {
                                          if (*(_QWORD *)v372 != v221)
                                            objc_enumerationMutation(v218);
                                          v290[2](v290, *(_QWORD *)(*((_QWORD *)&v371 + 1) + 8 * v222), 2);
                                          v223 = objc_claimAutoreleasedReturnValue();
                                          if (!v223)
                                            goto LABEL_389;
                                          v224 = (void *)v223;
                                          objc_msgSend(v266, "addObject:", v223);

                                          if (v220 == ++v222)
                                          {
                                            v220 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v371, v428, 16);
                                            if (v220)
                                              goto LABEL_342;
                                            break;
                                          }
                                        }
                                      }

                                      if ((v278 & 1) == 0)
                                        objc_msgSend(v328, "isUILocked");
                                      objc_msgSend(v301, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 29);
                                      objc_msgSend(v314, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 29);
                                      objc_msgSend(v280, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 29);
                                      objc_msgSend(v276, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 29);
                                      v369 = 0u;
                                      v370 = 0u;
                                      v367 = 0u;
                                      v368 = 0u;
                                      v228 = v266;
                                      v229 = objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v367, v427, 16);
                                      if (v229)
                                      {
                                        v230 = v229;
                                        v231 = *(_QWORD *)v368;
                                        do
                                        {
                                          for (i = 0; i != v230; ++i)
                                          {
                                            if (*(_QWORD *)v368 != v231)
                                              objc_enumerationMutation(v228);
                                            objc_msgSend(*(id *)(*((_QWORD *)&v367 + 1) + 8 * i), "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 29);
                                          }
                                          v230 = objc_msgSend(v228, "countByEnumeratingWithState:objects:count:", &v367, v427, 16);
                                        }
                                        while (v230);
                                      }

                                      v233 = -[SBMainWorkspace _isLaunchingApplicationAfterSetupForRequestWithBundleIdentifier:options:origin:](v331, "_isLaunchingApplicationAfterSetupForRequestWithBundleIdentifier:options:origin:", v178, v340, v324)|| objc_msgSend(v297, "isEqualToString:", *MEMORY[0x1E0CF78D8]);
                                      if ((v336 & 1) != 0)
                                      {
                                        v240 = 2;
                                      }
                                      else
                                      {
                                        v241 = objc_msgSend(v301, "BOOLForActivationSetting:", 3);
                                        v240 = 2;
                                        if (!v241)
                                          v240 = 0;
                                      }
                                      if (v254)
                                        v240 |= 4uLL;
                                      if (v251)
                                        v240 |= 0x10uLL;
                                      v242 = 64;
                                      if (v252)
                                        v242 = 32;
                                      -[SBMainWorkspace createRequestForApplicationActivation:withDisplayConfiguration:options:](v331, "createRequestForApplicationActivation:withDisplayConfiguration:options:", v212, v339, v240 | v242);
                                      v243 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v243, "setOriginatingProcess:", v324);
                                      objc_msgSend(v212, "uniqueIdentifier");
                                      v244 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v324, "pid");
                                      BSProcessDescriptionForPID();
                                      v245 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v243, "setEventLabelWithFormat:", CFSTR("OpenApplication(%@)ForRequester(%@)"), v244, v245);

                                      objc_msgSend(v243, "setShouldPreventDismissalOfUnrelatedTransientOverlays:", v253);
                                      objc_msgSend(v243, "applicationContext");
                                      v226 = (void *)objc_claimAutoreleasedReturnValue();
                                      v246 = MEMORY[0x1E0C809B0];
                                      v364[0] = MEMORY[0x1E0C809B0];
                                      v364[1] = 3221225472;
                                      v364[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_2_543;
                                      v364[3] = &unk_1E8E9F688;
                                      v366 = v257;
                                      v365 = v249;
                                      objc_msgSend(v226, "setResultBlock:", v364);
                                      v361[0] = v246;
                                      v361[1] = 3221225472;
                                      v361[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_3;
                                      v361[3] = &__block_descriptor_34_e54_v16__0__SBWorkspaceApplicationSceneTransitionContext_8l;
                                      v362 = v233;
                                      v363 = v255;
                                      objc_msgSend(v243, "modifyApplicationContext:", v361);
                                      -[SBMainWorkspace _determineSourceForTransitionRequest:](v331, "_determineSourceForTransitionRequest:", v243);
                                      v218 = v243;
                                      if (!objc_msgSend(v243, "source"))
                                        objc_msgSend(v243, "setSource:", 13);
                                      v347[0] = MEMORY[0x1E0C809B0];
                                      v347[1] = 3221225472;
                                      v347[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_4;
                                      v347[3] = &unk_1E8E9F6F8;
                                      v357 = v315;
                                      v358 = v313;
                                      v359 = v248;
                                      v360 = v299;
                                      v355 = v423;
                                      v348 = v337;
                                      v301 = v301;
                                      v349 = v301;
                                      v314 = v314;
                                      v350 = v314;
                                      v280 = v280;
                                      v351 = v280;
                                      v276 = v276;
                                      v352 = v276;
                                      v353 = v228;
                                      v354 = v329;
                                      v356 = v422;
                                      -[SBMainWorkspace executeTransitionRequest:withValidator:](v331, "executeTransitionRequest:withValidator:", v243, v347);

                                      v227 = v366;
LABEL_388:

LABEL_389:
                                      goto LABEL_390;
                                    }
                                    v276 = 0;
                                  }
                                  else
                                  {
                                    v280 = 0;
                                  }
                                }
                                else
                                {
                                  v314 = 0;
                                }
LABEL_390:

                                v12 = v178;
                                v14 = v321;
                                v15 = v324;
                                v18 = v330;
                                v22 = v341;
                                v51 = v318;
                                goto LABEL_391;
                            }
                            v301 = 0;
                          }
                          v314 = 0;
LABEL_326:
                          v280 = 0;
LABEL_327:
                          v276 = 0;
                          goto LABEL_328;
                        }
                        +[SBDeviceApplicationSceneEntity defaultEntityWithApplication:targetContentIdentifier:sceneHandleProvider:displayIdentity:](SBDeviceApplicationSceneEntity, "defaultEntityWithApplication:targetContentIdentifier:sceneHandleProvider:displayIdentity:", v343, v311, v189, v190);
                        v193 = (id)objc_claimAutoreleasedReturnValue();
                      }
LABEL_310:
                      v212 = v193;
                      goto LABEL_311;
                    }
                  }
                  v156 = objc_msgSend(v153, "_classicMode");

                  goto LABEL_232;
                }
                v320 = v14;
                v146 = v12;
                if (v291)
                {
                  SBLogCommon();
                  v145 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D0540000, v145, OS_LOG_TYPE_DEFAULT, "Trying to launch an app clip, but this looks like a launch from Xcode. Falling back to default application launch path", buf, 2u);
                  }
                  v15 = v324;
                  v51 = v318;
                  goto LABEL_219;
                }
                objc_msgSend((id)SBApp, "webClipService");
                v196 = (void *)objc_claimAutoreleasedReturnValue();
                v197 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(MEMORY[0x1E0CEAC08], "clipsIncludingWebClips:includingAppClips:", 1, 1);
                v390 = 0u;
                v391 = 0u;
                v392 = 0u;
                v393 = 0u;
                v198 = (id)objc_claimAutoreleasedReturnValue();
                v199 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v390, v434, 16);
                if (v199)
                {
                  v200 = v199;
                  v201 = *(_QWORD *)v391;
                  do
                  {
                    for (j = 0; j != v200; ++j)
                    {
                      if (*(_QWORD *)v391 != v201)
                        objc_enumerationMutation(v198);
                      v203 = *(_QWORD *)(*((_QWORD *)&v390 + 1) + 8 * j);
                      objc_msgSend(v196, "targetApplicationBundleIdentifierForWebClip:", v203);
                      v204 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v204 && BSEqualStrings())
                        objc_msgSend(v197, "addObject:", v203);

                    }
                    v200 = objc_msgSend(v198, "countByEnumeratingWithState:objects:count:", &v390, v434, 16);
                  }
                  while (v200);
                }

                +[SBWebClipService bestWebClipForTargetContentIdentifier:fromWebClips:](SBWebClipService, "bestWebClipForTargetContentIdentifier:fromWebClips:", v311, v197);
                v205 = objc_claimAutoreleasedReturnValue();
                if (v205)
                {
                  v206 = (void *)v205;
                  SBLogCommon();
                  v207 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_303;
                  objc_msgSend(v206, "pageURL");
                  v208 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v146;
                  v430 = 2114;
                  v431 = v311;
                  v432 = 2114;
                  v433 = v208;
                  v209 = "Best web clip found for app clip '%{public}@' with targetContentIdentifier '%{public}@': '%{public}@'.";
                }
                else
                {
                  objc_msgSend(v197, "lastObject");
                  v206 = (void *)objc_claimAutoreleasedReturnValue();
                  SBLogCommon();
                  v207 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT))
                    goto LABEL_303;
                  objc_msgSend(v206, "pageURL");
                  v208 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v146;
                  v430 = 2114;
                  v431 = v311;
                  v432 = 2114;
                  v433 = v208;
                  v209 = "Couldn't find a web clip for '%{public}@' with targetContentIdentifier '%{public}@'. Picking: '%{public}@'.";
                }
                _os_log_impl(&dword_1D0540000, v207, OS_LOG_TYPE_DEFAULT, v209, buf, 0x20u);

LABEL_303:
                objc_msgSend(v206, "identifier");
                v214 = (void *)objc_claimAutoreleasedReturnValue();
                if (v214)
                {
                  v382[0] = MEMORY[0x1E0C809B0];
                  v382[1] = 3221225472;
                  v382[2] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_522;
                  v382[3] = &unk_1E8E9F610;
                  v383 = v340;
                  v384 = v331;
                  v385 = v146;
                  v386 = v320;
                  v387 = v324;
                  v389 = v332;
                  v388 = v214;
                  objc_msgSend(v196, "prepareToLaunchWebClipWithIdentifier:handler:", v388, v382);

                  v215 = v383;
                }
                else
                {
                  SBLogCommon();
                  v215 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v215, OS_LOG_TYPE_ERROR))
                    -[SBMainWorkspace _handleOpenApplicationRequest:options:activationSettings:origin:withResult:].cold.2();
                }

                v12 = v146;
                v14 = v320;
                v15 = v324;
                v143 = v343;
                v51 = v318;
                v13 = v340;
                v144 = &off_1E8E94000;
                if (v214)
                {
                  v17 = v345;
                  v18 = v330;
                  v22 = v341;
                  v128 = v297;
                  v140 = v272;
LABEL_393:
                  v141 = (void *)v268;
                  goto LABEL_394;
                }
                goto LABEL_220;
              }
              objc_msgSend(v343, "bundleIdentifier");
              v247 = (void *)objc_claimAutoreleasedReturnValue();
              FBSOpenApplicationErrorCreate();
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (*)(void (**)(_QWORD), void *))v332[2])(v332, v195);

              v22 = v341;
            }

            v17 = v345;
            v18 = v330;
            v20 = v343;
LABEL_209:
            v51 = v318;
            goto LABEL_210;
          }
          v14 = v113;
          v15 = v324;
          if (((v267 | v270) & 1) == 0)
          {
            v401 = 0;
            v124 = -[SBMainWorkspace _canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin:givenOrigin:trustedRequest:outReason:](v331, "_canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin:givenOrigin:trustedRequest:outReason:", v324, v297, 1, &v401);
            v125 = v401;
            v126 = v125;
            if (!v124)
            {

              FBSOpenApplicationErrorCreate();
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (*)(void (**)(_QWORD), void *))v332[2])(v332, v158);

              v18 = v330;
              v20 = v343;
              v128 = v297;
              goto LABEL_395;
            }
            SBLogWorkspace();
            v127 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v126;
              v430 = 2112;
              v431 = v324;
              _os_log_impl(&dword_1D0540000, v127, OS_LOG_TYPE_DEFAULT, "Allowing openApplication unlock attempt because we're authenticated and %@: %@", buf, 0x16u);
            }

          }
          v394[1] = (id)MEMORY[0x1E0C809B0];
          v394[2] = (id)3221225472;
          v394[3] = __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_506;
          v394[4] = &unk_1E8E9F5E8;
          v395 = v13;
          v396 = v331;
          v397 = v12;
          v398 = v14;
          v399 = v324;
          v400 = v332;
          v128 = v297;
          v20 = v343;
          -[SBMainWorkspace _attemptUnlockToApplication:showPasscode:origin:givenOrigin:options:completion:](v331, "_attemptUnlockToApplication:showPasscode:origin:givenOrigin:options:completion:");

          v18 = v330;
LABEL_395:
          v82 = v308;
          goto LABEL_396;
        }
      }
    }
    FBSOpenApplicationErrorCreate();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(_QWORD), void *))v332[2])(v332, v78);
    goto LABEL_152;
  }
  ((void (*)(void (**)(_QWORD), id))v19[2])(v19, v21);
LABEL_403:

}

- (void)systemService:(id)a3 handleOpenApplicationRequest:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  const __CFString *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  int v19;
  const __CFString *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  int has_internal_diagnostics;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  int v38;
  void *v39;
  char v40;
  void *v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int v47;
  SBActivationSettings *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint8_t buf[4];
  const __CFString *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D229A0], "currentOpenApplicationInstance");
  v11 = objc_claimAutoreleasedReturnValue();
  SBLogWorkspace();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  v54 = v8;
  if (v11)
  {
    if (!v13)
      goto LABEL_11;
    v14 = objc_msgSend(v7, "isTrusted");
    v15 = CFSTR("untrusted");
    *(_DWORD *)buf = 138544130;
    if (v14)
      v15 = CFSTR("trusted");
    v56 = v15;
    v57 = 2114;
    v58 = v11;
    v59 = 2114;
    v60 = v9;
    v61 = 2114;
    v62 = v10;
    v16 = "Received %{public}@ open application request to %{public}@ for \"%{public}@\" from %{public}@.";
    v17 = v12;
    v18 = 42;
  }
  else
  {
    if (!v13)
      goto LABEL_11;
    v19 = objc_msgSend(v7, "isTrusted");
    v20 = CFSTR("untrusted");
    *(_DWORD *)buf = 138543874;
    if (v19)
      v20 = CFSTR("trusted");
    v56 = v20;
    v57 = 2114;
    v58 = (uint64_t)v9;
    v59 = 2114;
    v60 = v10;
    v16 = "Received %{public}@ open application request for \"%{public}@\" from %{public}@.";
    v17 = v12;
    v18 = 32;
  }
  _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_11:
  v52 = v11;

  v21 = objc_msgSend(v7, "isTrusted");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "options");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dictionary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v7, "options", v52);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addEntriesFromDictionary:", v26);

  }
  SBSConvertOpenApplicationSBSKeysToFBSKeysIfNecessary();
  v27 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.LaunchApp"));
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (v27 && has_internal_diagnostics)
  {
    objc_msgSend(v22, "bs_safeArrayForKey:", *MEMORY[0x1E0D22D40]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      -[SBMainWorkspace _parseShellArguments:](self, "_parseShellArguments:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addEntriesFromDictionary:", v30);
      if (!v9)
      {
        objc_msgSend(v22, "bs_safeArrayForKey:", *MEMORY[0x1E0DAB888]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists", v52);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "applicationWithBundleIdentifier:", v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v33, "info");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "shouldLaunchSuspendedAlways");

    v36 = *MEMORY[0x1E0D22D00];
    if (v35)
    {
      objc_msgSend(v22, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D00]);
      v21 = 1;
    }
  }
  else
  {
    v36 = *MEMORY[0x1E0D22D00];
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.DataActivation")))
  {
    objc_msgSend(v22, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v36);
    v21 = 1;
  }
  objc_msgSend(v22, "bs_safeNumberForKey:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "BOOLValue");

  objc_msgSend(v22, "bs_safeNumberForKey:", *MEMORY[0x1E0DAB768]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "BOOLValue"))
    v40 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.InCallService"));
  else
    v40 = 0;

  if (v38 && (v40 & 1) == 0)
  {
    objc_msgSend(v22, "removeObjectForKey:", *MEMORY[0x1E0D22DA8]);
    objc_msgSend(v22, "removeObjectForKey:", *MEMORY[0x1E0D22D88]);
  }
  objc_msgSend(v22, "bs_safeNumberForKey:", *MEMORY[0x1E0DAB520]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "BOOLValue");

  if (v42)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *MEMORY[0x1E0D22D70];
    objc_msgSend(v22, "bs_safeDictionaryForKey:", *MEMORY[0x1E0D22D70]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
      objc_msgSend(v43, "addEntriesFromDictionary:", v45);
    objc_msgSend(v43, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CEB2A8]);
    objc_msgSend(v22, "setObject:forKey:", v43, v44);

  }
  objc_msgSend(v10, "bundleIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("com.apple.Spotlight"));

  if (v47)
    objc_msgSend(v22, "setObject:forKey:", *MEMORY[0x1E0DAB818], *MEMORY[0x1E0D22D58]);
  v48 = objc_alloc_init(SBActivationSettings);
  -[SBActivationSettings setFlag:forActivationSetting:](v48, "setFlag:forActivationSetting:", BSSettingFlagForBool(), 51);
  objc_msgSend(MEMORY[0x1E0D229A0], "currentOpenApplicationInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
    -[SBActivationSettings setObject:forActivationSetting:](v48, "setObject:forActivationSetting:", v49, 50);
  objc_msgSend(v10, "handle");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v51 = v54;
    -[SBMainWorkspace _handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:](self, "_handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:", v9, v22, v48, v50, v54);
  }
  else
  {
    v51 = v54;
    -[SBMainWorkspace _handleUntrustedOpenRequestForApplication:options:activationSettings:origin:withResult:](self, "_handleUntrustedOpenRequestForApplication:options:activationSettings:origin:withResult:", v9, v22, v48, v50, v54);
  }

}

- (void)_handleTrustedOpenRequestForApplication:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id *v22;
  id *v23;
  id *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SBMainWorkspace *v31;
  id *v32;
  id *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("result"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBMainWorkspace _handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:].cold.1();
    objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
LABEL_20:
    JUMPOUT(0x1D06294C0);
  }
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settings"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBMainWorkspace _handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:].cold.2();
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0629524);
  }
  v17 = v16;
  if ((objc_msgSend(v14, "BOOLForActivationSetting:", 51) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[settings BOOLForActivationSetting:kSBAppActivationSettingFromTrustedSystemServiceRequest]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBMainWorkspace _handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:].cold.3((uint64_t)v30);
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    goto LABEL_20;
  }
  if (objc_msgSend(v13, "bs_BOOLForKey:", *MEMORY[0x1E0D22D00]))
  {
    -[SBMainWorkspace _handleOpenApplicationRequest:options:activationSettings:origin:withResult:](self, "_handleOpenApplicationRequest:options:activationSettings:origin:withResult:", v12, v13, v14, v15, v17);
  }
  else
  {
    objc_msgSend(v13, "bs_safeURLForKey:", *MEMORY[0x1E0D22D78]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = SBWorkspaceOpenURLIsHandledBySpringBoard(v18);

    v31 = self;
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBSystemService-SpringBoardURL: %@"), v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D229B0];
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __104__SBMainWorkspace__handleTrustedOpenRequestForApplication_options_activationSettings_origin_withResult___block_invoke;
      v40[3] = &unk_1E8E9F720;
      v40[4] = self;
      v33 = &v41;
      v41 = v12;
      v32 = &v42;
      v42 = v13;
      v22 = &v43;
      v43 = v14;
      v23 = &v44;
      v44 = v15;
      v24 = &v45;
      v45 = v17;
      v25 = v40;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBSystemService-TrustedRequest: %@"), v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D229B0];
      v34[1] = 3221225472;
      v34[2] = __104__SBMainWorkspace__handleTrustedOpenRequestForApplication_options_activationSettings_origin_withResult___block_invoke_2;
      v34[3] = &unk_1E8E9F720;
      v34[4] = self;
      v33 = &v35;
      v34[0] = MEMORY[0x1E0C809B0];
      v35 = v12;
      v32 = &v36;
      v36 = v13;
      v22 = &v37;
      v37 = v14;
      v23 = &v38;
      v38 = v15;
      v24 = &v39;
      v39 = v17;
      v25 = v34;
    }
    objc_msgSend(v21, "eventWithName:handler:", v20, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBWorkspace eventQueue](v31, "eventQueue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "executeOrAppendEvent:", v26);

  }
}

- (void)transactionDidComplete:(id)a3
{
  SBWorkspaceTransaction *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD block[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (SBWorkspaceTransaction *)a3;
  if (self->_currentTransaction != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 5736, CFSTR("Not the same transaction: _currentTransaction = %p vs transaction = %p"), self->_currentTransaction, v5);

  }
  v6 = -[SBWorkspaceTransaction isFailed](v5, "isFailed");
  SBLogTransactionVerbose();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    if (v8)
    {
      SBLogTransactionVerbose();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[SBMainWorkspace transactionDidComplete:].cold.1();
    }
    else
    {
      SBLogTransaction();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[SBWorkspaceTransaction _descriptionProem](v5, "_descriptionProem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v11;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Root transaction failed: %{public}@. Attempting to force us back to SB...", buf, 0xCu);

      }
    }

    __SBWorkspaceActivateSpringBoardWithResult(0, 0, 0, 0, 1, 0, 0);
  }
  else
  {
    if (v8)
    {
      SBLogTransactionVerbose();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[SBMainWorkspace transactionDidComplete:].cold.2();
    }
    else
    {
      SBLogTransaction();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        -[SBWorkspaceTransaction _descriptionProem](v5, "_descriptionProem");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v12;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Root transaction complete: %{public}@", buf, 0xCu);

      }
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && !-[SBWorkspaceTransaction clearsCompletionAsynchronously](v5, "clearsCompletionAsynchronously"))
  {
    SBLogTransaction();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, "Running next transaction event synchronously.", buf, 2u);
    }

    -[SBMainWorkspace setCurrentTransaction:](self, "setCurrentTransaction:", 0);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__SBMainWorkspace_transactionDidComplete___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __48__SBMainWorkspace_applicationProcessWillLaunch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationWithBundleIdentifier:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_processWillLaunch:", *(_QWORD *)(a1 + 32));
}

- (id)_validateRequestToOpenApplication:(id)a3 options:(id)a4 origin:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  BOOL v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  char v41;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  char v48;
  int v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  SBMainWorkspace *v55;
  void *v56;
  void *v57;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 4301, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outError != nil"));

  }
  *a6 = 0;
  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "applicationWithBundleIdentifier:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "info");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || v15)
  {
    objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22D00], objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v17, "BOOLValue");

    objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22CF0], objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v18;
    v55 = self;
    if (v18)
    {
      objc_msgSend(v18, "objectForKey:", *MEMORY[0x1E0D22BB0]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v19 != 0;

    }
    else
    {
      v47 = 0;
    }
    objc_msgSend(v12, "bs_safeURLForKey:", *MEMORY[0x1E0D22D78]);
    v54 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0D22D18]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D00930], objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v21, "BOOLValue");

    v51 = v20;
    objc_msgSend(v20, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D00928], objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v22, "BOOLValue");

    +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v23;
    if ((objc_msgSend(v23, "isInSetupMode") & 1) != 0)
    {
      v24 = objc_msgSend(v23, "updateInSetupMode");
      v25 = -[SBMainWorkspace _isLaunchingApplicationAfterSetupForRequestWithBundleIdentifier:options:origin:](v55, "_isLaunchingApplicationAfterSetupForRequestWithBundleIdentifier:options:origin:", v11, v12, v13);
      if ((v24 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v25 = -[SBMainWorkspace _isLaunchingApplicationAfterSetupForRequestWithBundleIdentifier:options:origin:](v55, "_isLaunchingApplicationAfterSetupForRequestWithBundleIdentifier:options:origin:", v11, v12, v13);
    }
    if (v25)
      goto LABEL_17;
    +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
    v26 = v13;
    v27 = v14;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setupApplication");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "processState");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isForeground");

    v14 = v27;
    v13 = v26;
    if (!v31)
    {
LABEL_17:
      objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB768], objc_opt_class());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "BOOLValue");

      if (!v33
        || (objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.springboard.inCallPresentation")) & 1) != 0
        || (+[SBDefaults localDefaults](SBDefaults, "localDefaults"),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v34, "inCallPresentationDefaults"),
            v35 = (void *)objc_claimAutoreleasedReturnValue(),
            v36 = objc_msgSend(v35, "skipPromptUnlockEntitlementCheck"),
            v35,
            v34,
            (v36 & 1) != 0))
      {
        objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB868], objc_opt_class());
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.springboard.display-lookup")) & 1) != 0
          || (v38 = objc_msgSend(v13, "hasEntitlement:", CFSTR("com.apple.springboard.testautomation")), !v37)
          || (v38 & 1) != 0)
        {
          v39 = (void *)v54;
          if (((v49 | v50) & 1) != 0 || objc_msgSend(v15, "isAnyTerminationAssertionInEffect"))
          {
            v40 = v52;
            if (!objc_msgSend(v15, "isAnyTerminationAssertionInEffect"))
            {
              v41 = v48;
              if (v54)
                v41 = 1;
              if ((v41 & 1) == 0 && (v49 & v50) == 0)
                goto LABEL_30;
            }
          }
          else
          {
            v40 = v52;
            if ((objc_msgSend(v56, "isRestoring") & 1) == 0
              && !objc_msgSend(v56, "isResetting")
              && (__SBWFinishedBoot & 1) != 0)
            {
LABEL_30:
              if (!v15)
              {
                objc_msgSend(v57, "unauthoritativeTrustState");
LABEL_46:
                v16 = v15;
                goto LABEL_39;
              }
              if (!objc_msgSend((id)SBApp, "isBundleIdentifierRestrictionDisabled:", v11)
                && (!v47
                 || (objc_msgSend(v57, "supportsFetchBackgroundMode") & 1) != 0
                 || (objc_msgSend(v15, "isSystemApplication") & 1) != 0))
              {
                v43 = objc_msgSend(v57, "unauthoritativeTrustState");
                if (v43 == 8)
                  goto LABEL_46;
                if ((v48 & 1) == 0)
                {
                  -[SBMainWorkspace _alertItemForPreventingLaunchOfApp:fromTrustState:](v55, "_alertItemForPreventingLaunchOfApp:fromTrustState:", v15, v43);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v44)
                  {
                    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "activateAlertItem:", v44);

                    v39 = (void *)v54;
                  }

                }
              }
            }
          }
          FBSOpenApplicationErrorCreate();
          v16 = 0;
          *a6 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_39;
        }
      }
LABEL_37:
      FBSOpenApplicationErrorCreate();
      v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      v40 = v52;
      v39 = (void *)v54;
LABEL_39:

      goto LABEL_40;
    }
LABEL_15:
    if (v57 && (objc_msgSend(v57, "isLaunchableDuringSetup") & 1) == 0)
      goto LABEL_37;
    goto LABEL_17;
  }
  FBSOpenApplicationErrorCreate();
  v16 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v16;
}

void __47__SBMainWorkspace_applicationProcessDidLaunch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationWithBundleIdentifier:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_processDidLaunch:", *(_QWORD *)(a1 + 32));
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setupApplication");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7 == v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "_handleBuddyLaunchFinished");
    v6 = v7;
  }

}

- (void)_handleUserActionRequest:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7
{
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  id v36;
  void *v37;
  __CFString *v38;
  uint64_t v39;
  unint64_t v40;
  const __CFString *v41;
  const __CFString *v42;
  __CFString *v43;
  NSObject *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  NSObject *v52;
  const __CFString *v53;
  __CFString *v54;
  NSObject *v55;
  const char *v56;
  int v57;
  void *v58;
  void *v59;
  int v60;
  _BOOL4 v61;
  int v62;
  NSObject *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  int v84;
  __CFString *v85;
  _BOOL4 v86;
  __CFString *v87;
  __CFString *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  const __CFString *v95;
  __CFString *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  __CFString *v100;
  void *v101;
  id v102;
  void *v103;
  int v104;
  int v105;
  void *v106;
  void *v107;
  void *v109;
  void *v110;
  __CFString *v111;
  void *v112;
  void *v113;
  void (**v114)(_QWORD, _QWORD);
  int v115;
  void *v116;
  _QWORD v117[4];
  __CFString *v118;
  id v119;
  id v120;
  void (**v121)(_QWORD, _QWORD);
  uint64_t v122;
  uint64_t v123;
  void (*v124)(uint64_t, int);
  void *v125;
  id v126;
  SBMainWorkspace *v127;
  id v128;
  id v129;
  __CFString *v130;
  void (**v131)(_QWORD, _QWORD);
  id v132;
  id v133;
  __int128 v134;
  __int128 v135;
  uint8_t buf[4];
  __CFString *v137;
  __int16 v138;
  const __CFString *v139;
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (__CFString *)a6;
  v15 = a7;
  BSDispatchQueueAssertMain();
  v114 = (void (**)(_QWORD, _QWORD))v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("result"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBMainWorkspace _handleUserActionRequest:options:activationSettings:origin:withResult:].cold.1();
    objc_msgSend(objc_retainAutorelease(v93), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D062BFE8);
  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("activationSettings"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBMainWorkspace _handleUserActionRequest:options:activationSettings:origin:withResult:].cold.2();
    objc_msgSend(objc_retainAutorelease(v94), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D062C04CLL);
  }
  objc_msgSend(v12, "bs_safeURLForKey:", *MEMORY[0x1E0D22D78]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = v13;
  v18 = objc_msgSend(v13, "BOOLForActivationSetting:", 51);
  v113 = v16;
  objc_msgSend(v16, "scheme");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("test"));

  v110 = v17;
  objc_msgSend(v17, "dataActivationApplication");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bundleIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v11, "isEqualToIgnoringCase:", v22);

  objc_msgSend(v12, "bs_safeObjectForKey:ofType:", CFSTR("__SBWorkspaceOpenOptionUnlockResult"), objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = objc_msgSend(v24, "BOOLValue");

  objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22D58], objc_opt_class());
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = 0u;
  v135 = 0u;
  -[__CFString auditToken](v14, "auditToken");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "realToken");
  }
  else
  {
    v134 = 0u;
    v135 = 0u;
  }

  SBRunningApplicationForAuditToken();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  v29 = v27 != 0;
  if (v27)
    v30 = v18;
  else
    v30 = 1;
  if (!v30)
    v29 = v115 | v23;
  v31 = v112;
  v111 = v14;
  if (v27
    && (v29 & 1) == 0
    && (SBWorkspaceHasApplicationSceneInLockedOrUnlockedEnvironmentLayoutStateMatchingApplication(v27) & 1) == 0
    && !-[SBMainWorkspace isApplicationRunningAsViewService:](self, "isApplicationRunningAsViewService:", v28)
    && (-[__CFString hasEntitlement:](v14, "hasEntitlement:", CFSTR("com.apple.springboard.openurlinbackground")) & 1) == 0)
  {
    objc_msgSend(v28, "bundleIdentifier");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    FBSOpenApplicationErrorCreate();
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v114)[2](v114, v58);

    goto LABEL_99;
  }
  v104 = v20;
  v105 = v23;
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "processForPID:", -[__CFString pid](v14, "pid"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v107 = v33;
  v34 = objc_msgSend(v33, "isExtensionProcess");
  v35 = v34 & (v18 | v115);
  if (!v34 || (v35 & 1) != 0)
  {
LABEL_59:
    if (!v113)
    {
      -[SBMainWorkspace _handleOpenApplicationRequest:options:activationSettings:origin:withResult:](self, "_handleOpenApplicationRequest:options:activationSettings:origin:withResult:", v11, v12, v31, v111, v114);
LABEL_98:
      v36 = v107;
      goto LABEL_99;
    }
    if ((v105 & 1) != 0)
      objc_msgSend(v110, "dataActivationApplication");
    else
      objc_msgSend(v110, "applicationWithBundleIdentifier:", v11);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22D00], objc_opt_class());
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "BOOLValue");

    v133 = 0;
    -[SBMainWorkspace _targetWindowSceneForApplication:options:settings:requireForeground:targetDisplayConfiguration:error:](self, "_targetWindowSceneForApplication:options:settings:requireForeground:targetDisplayConfiguration:error:", v64, v12, v31, v66 ^ 1u, 0, &v133);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v133;
    v69 = v68;
    if (!v67 && v68)
    {
      ((void (**)(_QWORD, id))v114)[2](v114, v68);
LABEL_97:

      goto LABEL_98;
    }
    v98 = v64;
    objc_msgSend(v67, "uiLockStateProvider", v95, v96);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (v70)
    {
      v72 = v70;
    }
    else
    {
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v72 = (id)objc_claimAutoreleasedReturnValue();
    }
    v73 = v72;

    objc_msgSend(v67, "authenticationStatusProvider");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v74;
    if (v74)
    {
      v76 = v74;
    }
    else
    {
      objc_msgSend((id)SBApp, "authenticationController");
      v76 = (id)objc_claimAutoreleasedReturnValue();
    }
    v77 = v76;

    v101 = v73;
    v78 = objc_msgSend(v73, "isUILocked");
    if (((v104 | objc_msgSend(v77, "isAuthenticatedCached") | v78 ^ 1 | v115) & 1) != 0)
    {
      v64 = v98;
      if (!v11 || v98)
      {
        v79 = v101;
        if (v98)
        {
          -[SBMainWorkspace _updateActivationSettings:forRequestWithOptions:clientProcess:application:](self, "_updateActivationSettings:forRequestWithOptions:clientProcess:application:", v31, v12, v111, v98);
          if ((v115 & 1) == 0)
            objc_msgSend(v101, "isUILocked");
          objc_msgSend(v31, "setFlag:forActivationSetting:", BSSettingFlagIfYes(), 29);
        }
      }
      else
      {
        v79 = v101;
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.springboard")) & 1) == 0)
        {
          FBSOpenApplicationErrorCreate();
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v114)[2](v114, v80);

          v79 = v101;
LABEL_96:

          goto LABEL_97;
        }
      }
      if (v105)
      {
        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v117[0] = MEMORY[0x1E0C809B0];
        v117[1] = 3221225472;
        v117[2] = __89__SBMainWorkspace__handleUserActionRequest_options_activationSettings_origin_withResult___block_invoke_2;
        v117[3] = &unk_1E8E9F770;
        v118 = v111;
        v119 = v98;
        v120 = v31;
        v121 = v114;
        objc_msgSend(v91, "requestTransitionWithBuilder:", v117);

        v79 = v101;
      }
      else
      {
        objc_msgSend((id)SBApp, "applicationOpenURL:withApplication:animating:activationSettings:origin:notifyLSOnFailure:withResult:", v113, v98, 1, v31, v111, 0, v114);
      }
      goto LABEL_96;
    }
    v116 = v67;
    v103 = v11;
    objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22DA8], objc_opt_class());
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "BOOLValue");

    objc_msgSend(v12, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D22D88], objc_opt_class());
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v83, "BOOLValue");

    v85 = v111;
    if ((-[__CFString hasEntitlement:](v111, "hasEntitlement:", CFSTR("com.apple.springboard.openurlswhenlocked")) & 1) != 0)
      goto LABEL_83;
    v106 = v69;
    v132 = 0;
    v86 = -[SBMainWorkspace _canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin:givenOrigin:trustedRequest:outReason:](self, "_canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin:givenOrigin:trustedRequest:outReason:", v111, v109, objc_msgSend(v112, "BOOLForActivationSetting:", 51), &v132);
    v87 = (__CFString *)v132;
    v88 = v87;
    if (v86)
    {
      SBLogWorkspace();
      v89 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v137 = v88;
        v138 = 2112;
        v139 = v111;
        _os_log_impl(&dword_1D0540000, v89, OS_LOG_TYPE_DEFAULT, "Allowing openURL unlock attempt for un-entitled process because we're authenticated and %@: %@", buf, 0x16u);
      }

      v85 = v111;
      v69 = v106;
      goto LABEL_83;
    }

    if (v82 | v84)
    {
      v85 = v111;
      v69 = v106;
      if (v35)
      {
LABEL_83:
        v122 = MEMORY[0x1E0C809B0];
        v123 = 3221225472;
        v124 = __89__SBMainWorkspace__handleUserActionRequest_options_activationSettings_origin_withResult___block_invoke;
        v125 = &unk_1E8E9F5E8;
        v126 = v12;
        v127 = self;
        v11 = v103;
        v128 = v103;
        v31 = v112;
        v129 = v112;
        v130 = v85;
        v131 = v114;
        v64 = v98;
        -[SBMainWorkspace _attemptUnlockToApplication:showPasscode:origin:givenOrigin:options:completion:](self, "_attemptUnlockToApplication:showPasscode:origin:givenOrigin:options:completion:");

        v79 = v101;
LABEL_84:
        v67 = v116;
        goto LABEL_96;
      }
      FBSOpenApplicationErrorCreate();
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v114)[2](v114, v90);

      v11 = v103;
      v31 = v112;
    }
    else
    {
      v11 = v103;
      FBSOpenApplicationErrorCreate();
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v114)[2](v114, v92);

      v31 = v112;
      v69 = v106;
    }
    v79 = v101;
    v64 = v98;
    goto LABEL_84;
  }
  v36 = v107;
  objc_msgSend(v36, "extensionInfo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "typeIdentifier");
  v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v37, "sb_type");
  v40 = v39;
  v99 = v28;
  if (v39)
  {
    NSStringFromSBExtensionType(v39);
    v41 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = v38;
  }
  v42 = v41;
  FBSProcessPrettyDescription();
  v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v137 = v43;
    v138 = 2114;
    v139 = v42;
    _os_log_impl(&dword_1D0540000, v44, OS_LOG_TYPE_INFO, "Verifying request for <%{public}@> of extension type \"%{public}@\"...", buf, 0x16u);
  }

  v100 = (__CFString *)v42;
  v102 = v11;
  if (v40 == 15)
  {
    objc_msgSend(MEMORY[0x1E0D87D80], "identityOfCurrentProcess");
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "identity");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "hostIdentity");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[__CFString isEqual:](v45, "isEqual:", v47);

    if (!v48)
    {
      v95 = v38;
      v96 = v45;
      v54 = v38;
      FBSOpenApplicationErrorCreate();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v114)[2](v114, v49);
      v35 = 0;
      v57 = 1;
      goto LABEL_58;
    }
    objc_msgSend(v37, "extensionIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "notificationDispatcher");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "isNotificationContentExtensionVisible:", v49);

    SBLogCommon();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = CFSTR("NOT VISIBLE");
      if (v51)
        v53 = CFSTR("VISIBLE");
      *(_DWORD *)buf = 138543618;
      v137 = v43;
      v138 = 2114;
      v139 = v53;
      _os_log_impl(&dword_1D0540000, v52, OS_LOG_TYPE_INFO, "NotificationUI extension <%{public}@> visibility is: %{public}@", buf, 0x16u);
    }

    v54 = v38;
    if ((v51 & 1) == 0)
    {
      v42 = v100;
      goto LABEL_46;
    }
LABEL_53:
    v62 = 1;
    goto LABEL_54;
  }
  objc_msgSend(v37, "extensionIdentifier");
  v97 = objc_claimAutoreleasedReturnValue();
  if (v40 > 0xE)
    goto LABEL_41;
  if (((1 << v40) & 0x3EFE) != 0)
  {
    SBLogCommon();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v54 = v38;
      v137 = v38;
      v56 = "Extension type \"<%{public}@>\" predates 10.0 -- ignoring visibility check and allowing the openURL request.";
LABEL_35:
      _os_log_impl(&dword_1D0540000, v55, OS_LOG_TYPE_INFO, v56, buf, 0xCu);
LABEL_52:
      v49 = (void *)v97;

      v45 = 0;
      goto LABEL_53;
    }
    goto LABEL_51;
  }
  if (v40 == 14)
  {
    SBLogCommon();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v137 = v43;
      _os_log_impl(&dword_1D0540000, v55, OS_LOG_TYPE_INFO, "Extension <%{public}@> is not allowed to open URLs, period.", buf, 0xCu);
    }
  }
  else
  {
LABEL_41:
    _SBApplicationStateGetMonitor();
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "mostElevatedApplicationStateForPID:", objc_msgSend(v36, "pid"));

    SBLogCommon();
    v55 = objc_claimAutoreleasedReturnValue();
    v61 = os_log_type_enabled(v55, OS_LOG_TYPE_INFO);
    if ((v60 & 8) != 0)
    {
      if (v61)
      {
        v54 = v38;
        *(_DWORD *)buf = 138543362;
        v137 = v43;
        v56 = "Extension <%{public}@> is considered foreground-running.";
        goto LABEL_35;
      }
LABEL_51:
      v54 = v38;
      goto LABEL_52;
    }
    if (v61)
    {
      *(_DWORD *)buf = 138543618;
      v137 = v43;
      v138 = 1024;
      LODWORD(v139) = v60;
      _os_log_impl(&dword_1D0540000, v55, OS_LOG_TYPE_INFO, "Extension <%{public}@> is not considered foreground-running (state: %u).", buf, 0x12u);
    }
    v42 = v100;
  }
  v49 = (void *)v97;
  v54 = v38;

  v45 = 0;
LABEL_46:
  if ((-[__CFString hasEntitlement:](v111, "hasEntitlement:", CFSTR("com.apple.springboard.openurlinbackground")) & 1) != 0)
  {
    v62 = 0;
LABEL_54:
    SBLogCommon();
    v63 = objc_claimAutoreleasedReturnValue();
    v35 = 1;
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v137 = v43;
      v138 = 1024;
      LODWORD(v139) = v62;
      _os_log_impl(&dword_1D0540000, v63, OS_LOG_TYPE_INFO, "Allowing openURL request from extension <%{public}@> because it is visible (%d) or entitled.", buf, 0x12u);
    }
    v57 = 0;
    goto LABEL_57;
  }
  v95 = v42;
  v96 = v43;
  FBSOpenApplicationErrorCreate();
  v63 = objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, NSObject *))v114)[2](v114, v63);
  v35 = 0;
  v57 = 1;
LABEL_57:

LABEL_58:
  v11 = v102;
  v31 = v112;
  v28 = v99;
  if (!v57)
    goto LABEL_59;
LABEL_99:

}

- (BOOL)_isLaunchingApplicationAfterSetupForRequestWithBundleIdentifier:(id)a3 options:(id)a4 origin:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0DAB880]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.springboard.launchAppAfterSetup"));

    if (v10)
    {
      v14[0] = CFSTR("com.apple.AppStore");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v7)
        LOBYTE(v9) = objc_msgSend(v11, "containsObject:", v7);
      else
        LOBYTE(v9) = 0;

    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return (char)v9;
}

- (void)processManager:(id)a3 didAddProcess:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "isApplicationProcess") && (objc_msgSend(v5, "isCurrentProcess") & 1) == 0)
    objc_msgSend(v5, "addObserver:", self);

}

- (void)applicationProcessWillLaunch:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SBMainWorkspace_applicationProcessWillLaunch___block_invoke;
  block[3] = &unk_1E8E9DED8;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)applicationProcessDidLaunch:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBMainWorkspace *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SBMainWorkspace_applicationProcessDidLaunch___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __59__SBMainWorkspace_process_stateDidChangeFromState_toState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isApplicationProcess"))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_applicationForIdentifier:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_noteProcess:didChangeToState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
}

- (id)_applicationForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationWithBundleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)requestTransitionWithBuilder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMainWorkspace;
  return -[SBWorkspace requestTransitionWithBuilder:](&v4, sel_requestTransitionWithBuilder_, a3);
}

- (BOOL)requestTransitionWithOptions:(unint64_t)a3 builder:(id)a4 validator:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMainWorkspace;
  return -[SBWorkspace requestTransitionWithOptions:builder:validator:](&v6, sel_requestTransitionWithOptions_builder_validator_, a3, a4, a5);
}

- (id)createRequestWithOptions:(unint64_t)a3
{
  return -[SBMainWorkspace createRequestWithOptions:displayConfiguration:](self, "createRequestWithOptions:displayConfiguration:", a3, 0);
}

- (id)createRequestForApplicationActivation:(id)a3 withDisplayConfiguration:(id)a4 options:(unint64_t)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMainWorkspace;
  -[SBWorkspace createRequestForApplicationActivation:withDisplayConfiguration:options:](&v6, sel_createRequestForApplicationActivation_withDisplayConfiguration_options_, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)process:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SBMainWorkspace *v13;
  id v14;

  v7 = a3;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SBMainWorkspace_process_stateDidChangeFromState_toState___block_invoke;
  block[3] = &unk_1E8E9E270;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (id)_targetWindowSceneForApplication:(id)a3 preferringDisplay:(id)a4 requireForeground:(BOOL)a5 options:(id)a6
{
  _BOOL8 v7;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id obj;
  SBMainWorkspace *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  NSObject *v66;
  uint64_t v67;

  v7 = a5;
  v67 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v10 = a4;
  v11 = a6;
  if (!v10)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    +[SBMainSwitcherControllerCoordinator sharedInstanceIfExists](SBMainSwitcherControllerCoordinator, "sharedInstanceIfExists");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v47 = v14;
      objc_msgSend(v11, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DC5D08], objc_opt_class());
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v53)
      {
        objc_msgSend(v11, "bs_safeURLForKey:", *MEMORY[0x1E0D22D78]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "absoluteString");
        v53 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v45 = v11;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      objc_msgSend((id)SBApp, "windowSceneManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "connectedWindowScenes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v18;
      v55 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      if (v55)
      {
        v52 = *(_QWORD *)v59;
        v50 = self;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v59 != v52)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_msgSend(v20, "sceneManager");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "_fbsDisplayIdentity");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "sceneIdentityForApplication:targetContentIdentifier:allowCanMatches:preferNewScene:allowSceneCreation:visibleIdentifiers:preferredDisplay:", v54, v53, 1, 0, 0, 0, v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v21, "existingSceneHandleForSceneIdentity:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v24, "contentState");
              objc_msgSend(v24, "sceneIfExists");
              v25 = v7;
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "settings");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "sb_displayIdentityForSceneManagers");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "displayIdentity");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v28, "isEqual:", v29);

              v7 = v25;
              if (v24)
              {
                if (v25)
                {
                  if (v51)
                    v31 = v30;
                  else
                    v31 = 0;
                  if ((v31 & 1) == 0)
                    goto LABEL_23;
LABEL_22:
                  objc_msgSend(v47, "addObject:", v24);
                }
                else if (v30)
                {
                  goto LABEL_22;
                }
              }
LABEL_23:

              self = v50;
            }

          }
          v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        }
        while (v55);
      }

      v11 = v45;
      v10 = 0;
      v14 = v47;
    }
    -[SBKeyboardFocusControlling externalSceneWithFocus](self->_keyboardFocusCoordinator, "externalSceneWithFocus");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainWorkspace _sceneComparatorForApplication:keyboardFocusScene:](self, "_sceneComparatorForApplication:keyboardFocusScene:", v54, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __96__SBMainWorkspace__targetWindowSceneForApplication_preferringDisplay_requireForeground_options___block_invoke;
    v56[3] = &unk_1E8E9F4E0;
    v35 = v33;
    v57 = v35;
    objc_msgSend(v14, "bs_reduce:block:", v34, v56);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v36, "displayIdentity");
      v37 = objc_claimAutoreleasedReturnValue();
      SBLogWorkspace();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v54, "bundleIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v64 = v39;
        v65 = 2114;
        v66 = v37;
        _os_log_impl(&dword_1D0540000, v38, OS_LOG_TYPE_DEFAULT, "Target window scene for \"%{public}@\" --> found candidate scene handle on display %{public}@", buf, 0x16u);

      }
      objc_msgSend((id)SBApp, "windowSceneManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "windowSceneForDisplayIdentity:", v37);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)SBApp, "windowSceneManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "activeDisplayWindowScene");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      SBLogWorkspace();
      v37 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
LABEL_34:

        goto LABEL_35;
      }
      objc_msgSend(v54, "bundleIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_sbDisplayConfiguration");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "identity");
      v48 = v14;
      v43 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v64 = v40;
      v65 = 2114;
      v66 = v43;
      _os_log_impl(&dword_1D0540000, v37, OS_LOG_TYPE_DEFAULT, "Target window scene for \"%{public}@\" --> active display %{public}@", buf, 0x16u);

      v14 = v48;
    }

    goto LABEL_34;
  }
  SBLogWorkspace();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v54, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v64 = v13;
    v65 = 2114;
    v66 = v10;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Target window scene for \"%{public}@\" --> using preferred display identity: %{public}@", buf, 0x16u);

  }
  objc_msgSend((id)SBApp, "windowSceneManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "windowSceneForDisplayIdentity:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:

  return v15;
}

- (id)_sceneComparatorForApplication:(id)a3 keyboardFocusScene:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__SBMainWorkspace__sceneComparatorForApplication_keyboardFocusScene___block_invoke;
  v11[3] = &unk_1E8E9F4B8;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = (void *)MEMORY[0x1D17E5550](v11);

  return v9;
}

void __63__SBMainWorkspace__executeTransitionRequest_options_validator___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D25CB8], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gameDidLaunch:", v2);

}

void __56__SBMainWorkspace__determineSourceForTransitionRequest___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 39) & 1) != 0)
  {
    v5 = 7;
LABEL_34:
    v6 = v8;
    goto LABEL_35;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 40) & 1) != 0)
  {
    v5 = 10;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 46) & 1) != 0)
    goto LABEL_6;
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 53) & 1) != 0)
  {
    v5 = 19;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 41) & 1) != 0)
  {
    v5 = 6;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 42) & 1) != 0)
  {
    v5 = 4;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 43) & 1) != 0)
  {
    v5 = 8;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 44) & 1) != 0)
  {
    v5 = 5;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 38) & 1) != 0)
  {
    v5 = 1;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 47) & 1) != 0)
  {
    v5 = 15;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 48) & 1) != 0)
  {
    v5 = 16;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 46) & 1) != 0)
  {
LABEL_6:
    v5 = 2;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 58) & 1) != 0)
  {
    v5 = 47;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 56) & 1) != 0)
  {
    v5 = 53;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 62) & 1) != 0)
  {
    v5 = 61;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 63) & 1) != 0)
  {
    v5 = 67;
    goto LABEL_34;
  }
  if ((objc_msgSend(v8, "BOOLForActivationSetting:", 64) & 1) != 0)
  {
    v5 = 70;
    goto LABEL_34;
  }
  v7 = objc_msgSend(v8, "BOOLForActivationSetting:", 49);
  v6 = v8;
  if (!v7)
    goto LABEL_36;
  v5 = 13;
LABEL_35:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
LABEL_36:
  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 0;

}

id __96__SBMainWorkspace__targetWindowSceneForApplication_preferringDisplay_requireForeground_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = a3;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v8 = v6;
  if (v7 != -1)
  {
    if (v7 != 1)
    {
      v9 = 0;
      goto LABEL_6;
    }
    v8 = v5;
  }
  v9 = v8;
LABEL_6:

  return v9;
}

uint64_t __69__SBMainWorkspace__sceneComparatorForApplication_keyboardFocusScene___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "application");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (objc_msgSend(v5, "isEqual:", v6) && (v8 & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v6, "application");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 32));

    if ((v8 & v11) == 1)
    {
      v12 = objc_msgSend(v5, "contentState");
      v13 = objc_msgSend(v6, "contentState");
      if (v12 && v13)
      {
        v14 = *(void **)(a1 + 40);
        if (v14)
        {
          objc_msgSend(v14, "settings");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "displayIdentity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v5, "displayIdentity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqual:", v16);
          objc_msgSend(v6, "displayIdentity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqual:", v16);
          if (v18 && v20)
          {
            v21 = *(void **)(a1 + 40);
            objc_msgSend(v6, "sceneIfExists");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v21) = objc_msgSend(v21, "isEqual:", v22);

            if ((v21 & 1) != 0)
            {
              v9 = -1;
            }
            else
            {
              v24 = *(void **)(a1 + 40);
              objc_msgSend(v5, "sceneIfExists");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v9) = objc_msgSend(v24, "isEqual:", v25);

              v9 = v9;
            }
          }
          else if (v20)
          {
            v9 = -1;
          }
          else
          {
            v9 = v18;
          }

        }
        else
        {
          v9 = 0;
        }
      }
      else
      {
        if (v12)
          v9 = 1;
        else
          v9 = -1;
        if (!(v12 | v13))
        {
          objc_msgSend(v5, "sceneIfExists");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            v9 = 1;
          else
            v9 = -1;

        }
      }
    }
    else if (v8)
    {
      v9 = 1;
    }
    else
    {
      v9 = v11 << 63 >> 63;
    }
  }

  return v9;
}

+ (id)start
{
  NSObject *v3;
  void *v4;
  uint8_t v6[16];

  SBLogWorkspace();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "[SBWorkspace] start", v6, 2u);
  }

  objc_msgSend(a1, "_sharedInstanceWithNilCheckPolicy:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_resume");
  return v4;
}

- (SBMainWorkspace)init
{
  void *v3;
  SBMainWorkspace *v4;
  SBIdleTimerCoordinatorHelper *v5;
  SBIdleTimerCoordinatorHelper *idleTimerCoordinatorHelper;
  void *v7;
  SBOrientationAggdLogger *v8;
  SBOrientationAggdLogger *orientationAggdLogger;
  SBTransientOverlayPresentationManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  SBTransientOverlayPresentationManager *transientOverlayPresentationManager;
  SBTransientOverlayPresentationManager *v17;
  void *v18;
  BOOL v19;
  SBInCallTransientOverlayManager *v20;
  uint64_t v21;
  SBKeyboardFocusControlling *keyboardFocusCoordinator;
  SBUniversalControlServer *v23;
  SBKeyboardFocusControlling *v24;
  void *v25;
  uint64_t v26;
  SBUniversalControlServer *universalControlServer;
  void *v28;
  void *v29;
  void *v30;
  objc_super v32;

  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32.receiver = self;
  v32.super_class = (Class)SBMainWorkspace;
  v4 = -[SBWorkspace initWithEventQueue:](&v32, sel_initWithEventQueue_, v3);

  if (v4)
  {
    v5 = -[SBIdleTimerCoordinatorHelper initWithSourceProvider:]([SBIdleTimerCoordinatorHelper alloc], "initWithSourceProvider:", v4);
    idleTimerCoordinatorHelper = v4->_idleTimerCoordinatorHelper;
    v4->_idleTimerCoordinatorHelper = v5;

    objc_msgSend(MEMORY[0x1E0D14568], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerEndpoint:", v4);

    v8 = objc_alloc_init(SBOrientationAggdLogger);
    orientationAggdLogger = v4->_orientationAggdLogger;
    v4->_orientationAggdLogger = v8;

    v10 = [SBTransientOverlayPresentationManager alloc];
    objc_msgSend((id)SBApp, "windowSceneManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBTransientOverlayPresentationManager initWithWindowSceneManager:alertItemsController:lockStateAggregator:reachabilityManager:](v10, "initWithWindowSceneManager:alertItemsController:lockStateAggregator:reachabilityManager:", v11, v12, v13, v14);
    transientOverlayPresentationManager = v4->_transientOverlayPresentationManager;
    v4->_transientOverlayPresentationManager = (SBTransientOverlayPresentationManager *)v15;

    v17 = v4->_transientOverlayPresentationManager;
    objc_msgSend((id)SBApp, "bannerManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransientOverlayPresentationManager setBannerManager:](v17, "setBannerManager:", v18);

    -[SBTransientOverlayPresentationManager setPresenterDelegate:](v4->_transientOverlayPresentationManager, "setPresenterDelegate:", v4);
    -[SBTransientOverlayPresentationManager setIdleTimerCoordinator:](v4->_transientOverlayPresentationManager, "setIdleTimerCoordinator:", v4);
    v19 = +[SBInCallPresentationManager isSpecializedAPISupported](SBInCallPresentationManager, "isSpecializedAPISupported");
    if (v19)
      v20 = 0;
    else
      v20 = objc_alloc_init(SBInCallTransientOverlayManager);
    objc_storeStrong((id *)&v4->_inCallTransientOverlayManager, v20);
    if (!v19)

    +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
    v21 = objc_claimAutoreleasedReturnValue();
    keyboardFocusCoordinator = v4->_keyboardFocusCoordinator;
    v4->_keyboardFocusCoordinator = (SBKeyboardFocusControlling *)v21;

    v23 = [SBUniversalControlServer alloc];
    v24 = v4->_keyboardFocusCoordinator;
    +[SBKeyboardSuppressionManager sharedInstance](SBKeyboardSuppressionManager, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[SBUniversalControlServer initWithKeyboardFocusController:keyboardSuppressionManager:](v23, "initWithKeyboardFocusController:keyboardSuppressionManager:", v24, v25);
    universalControlServer = v4->_universalControlServer;
    v4->_universalControlServer = (SBUniversalControlServer *)v26;

    -[SBMainWorkspace _updateMedusaCapabilitySendingNotification:](v4, "_updateMedusaCapabilitySendingNotification:", 0);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "registerObserver:", v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObserver:selector:name:object:", v4, sel__coversheetDidPresent, CFSTR("SBCoverSheetDidPresentNotification"), 0);
    objc_msgSend(v29, "addObserver:selector:name:object:", v4, sel__coversheetDidDismiss, CFSTR("SBCoverSheetDidDismissNotification"), 0);
    objc_msgSend(v29, "addObserver:selector:name:object:", v4, sel__handleKeyShortcutHUDVisibilityDidPresent_, *MEMORY[0x1E0CEB7E0], 0);
    objc_msgSend(v29, "addObserver:selector:name:object:", v4, sel__handleKeyShortcutHUDVisibilityDidDismiss, *MEMORY[0x1E0CEB7D8], 0);
    -[SBMainWorkspace _suspend](v4, "_suspend");
    objc_msgSend(MEMORY[0x1E0DB0F78], "monitorUsingMainQueue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:", v4);

    -[SBMainWorkspace _initializeAndObserveDefaults](v4, "_initializeAndObserveDefaults");
    -[SBMainWorkspace _addStateCaptureHandlers](v4, "_addStateCaptureHandlers");

  }
  return v4;
}

- (SBMainWorkspace)initWithEventQueue:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 1797, CFSTR("just don't call this"));

  return -[SBMainWorkspace init](self, "init");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D229A0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterObserver:", self);

  -[SBPowerDownViewController setDelegate:](self->_powerDownViewController, "setDelegate:", 0);
  if (self->_powerDownLongPressDurationAssertion)
  {
    objc_msgSend((id)SBApp, "homeHardwareButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeLongPressDurationAssertion:", self->_powerDownLongPressDurationAssertion);

  }
  -[BSEventQueueLock relinquish](self->_currentTransactionLock, "relinquish");
  -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_statusBarAssertion, "invalidate");
  v8.receiver = self;
  v8.super_class = (Class)SBMainWorkspace;
  -[SBMainWorkspace dealloc](&v8, sel_dealloc);
}

+ (id)debugDescription
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)debugDescription
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  SBMainWorkspace *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUseDebugDescription:", 1);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __35__SBMainWorkspace_debugDescription__block_invoke;
  v10 = &unk_1E8E9E820;
  v11 = v3;
  v12 = self;
  v4 = v3;
  objc_msgSend(v4, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, &v7);
  objc_msgSend(v4, "build", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

void __35__SBMainWorkspace_debugDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("sceneManager"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 224), CFSTR("transientOverlayPresentationManager"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("currentTransaction"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "eventQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, CFSTR("eventQueue"));

  v10 = *(void **)(a1 + 32);
  +[SBDaemonHandler stateDescription](SBDaemonHandler, "stateDescription");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "appendObject:withName:", v12, CFSTR("daemonHandlers"));

}

- (void)_addStateCaptureHandlers
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C80D38];
  v3 = (id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle();
  v4 = (id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle();

  v5 = (id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle();
  v6 = (id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle();

}

uint64_t __43__SBMainWorkspace__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "description");
}

__CFString *__43__SBMainWorkspace__addStateCaptureHandlers__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v2)
  {
    objc_msgSend(v2, "debugDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)SBApp, "_isRemoteStateDumpEnabled") & 1) != 0
      || BSLogStateCaptureCheckPlistSizeIsPermitted())
    {
      v4 = v3;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "description");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;

  }
  else
  {
    v5 = CFSTR("None");
  }
  return v5;
}

id __43__SBMainWorkspace__addStateCaptureHandlers__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "eventQueue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __43__SBMainWorkspace__addStateCaptureHandlers__block_invoke_4()
{
  return +[SBDaemonHandler stateDescription](SBDaemonHandler, "stateDescription");
}

- (id)createRequestForApplicationActivation:(id)a3 options:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBMainWorkspace;
  -[SBWorkspace createRequestForApplicationActivation:options:](&v5, sel_createRequestForApplicationActivation_options_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)requestTransitionWithOptions:(unint64_t)a3 displayConfiguration:(id)a4 builder:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBMainWorkspace;
  return -[SBWorkspace requestTransitionWithOptions:displayConfiguration:builder:](&v6, sel_requestTransitionWithOptions_displayConfiguration_builder_, a3, a4, a5);
}

- (BOOL)executeTransitionRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBMainWorkspace;
  return -[SBWorkspace executeTransitionRequest:](&v4, sel_executeTransitionRequest_, a3);
}

- (BOOL)canExecuteTransitionRequest:(id)a3
{
  return -[SBMainWorkspace _canExecuteTransitionRequest:forExecution:](self, "_canExecuteTransitionRequest:forExecution:", a3, 0);
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  return -[SBIdleTimerCoordinatorHelper targetCoordinator](self->_idleTimerCoordinatorHelper, "targetCoordinator");
}

- (void)setIdleTimerCoordinator:(id)a3
{
  -[SBIdleTimerCoordinatorHelper setTargetCoordinator:](self->_idleTimerCoordinatorHelper, "setTargetCoordinator:", a3);
}

- (void)presentModuleWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  SBMainWorkspace *v19;
  id v20;
  id v21;
  char v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = objc_msgSend(v9, "animatePresentation");
    objc_initWeak(&location, self);
    v12 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __66__SBMainWorkspace_presentModuleWithIdentifier_options_completion___block_invoke;
    v16[3] = &unk_1E8E9F198;
    objc_copyWeak(&v21, &location);
    v17 = v8;
    v18 = v9;
    v19 = self;
    v22 = v11;
    v20 = v10;
    v14[0] = v12;
    v14[1] = 3221225472;
    v14[2] = __66__SBMainWorkspace_presentModuleWithIdentifier_options_completion___block_invoke_3;
    v14[3] = &unk_1E8E9F1C0;
    v13 = (id)MEMORY[0x1D17E5550](v16);
    v15 = v13;
    -[SBMainWorkspace _dismissPresentedControlCenterModule:](self, "_dismissPresentedControlCenterModule:", v14);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    -[SBMainWorkspace _dismissPresentedControlCenterModule:](self, "_dismissPresentedControlCenterModule:", 0);
  }

}

void __66__SBMainWorkspace_presentModuleWithIdentifier_options_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  SBControlCenterModuleTransientOverlayViewController *v3;
  uint64_t v4;
  SBControlCenterModuleTransientOverlayViewController *v5;
  uint64_t v6;
  _QWORD v7[5];
  SBControlCenterModuleTransientOverlayViewController *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = -[SBControlCenterModuleTransientOverlayViewController initWithModuleIdentifier:presentationOptions:]([SBControlCenterModuleTransientOverlayViewController alloc], "initWithModuleIdentifier:presentationOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    -[SBControlCenterModuleTransientOverlayViewController setDelegate:](v3, "setDelegate:", *(_QWORD *)(a1 + 48));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 48) + 136), v3);
    v4 = *(unsigned __int8 *)(a1 + 72);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__SBMainWorkspace_presentModuleWithIdentifier_options_completion___block_invoke_2;
    v7[3] = &unk_1E8E9F170;
    v9 = *(id *)(a1 + 56);
    v7[4] = WeakRetained;
    v5 = v3;
    v8 = v5;
    if ((objc_msgSend(WeakRetained, "presentTransientOverlayViewController:animated:completion:", v5, v4, v7) & 1) == 0)
    {
      v6 = *(_QWORD *)(a1 + 56);
      if (v6)
        (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    }

  }
}

void __66__SBMainWorkspace_presentModuleWithIdentifier_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), *(id *)(a1 + 40));
}

uint64_t __66__SBMainWorkspace_presentModuleWithIdentifier_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_dismissPresentedControlCenterModule:(id)a3
{
  id v4;
  SBControlCenterModuleTransientOverlayViewController *presentedControlCenterModuleTransientOverlayViewController;
  void *v6;
  uint64_t v7;
  SBControlCenterModuleTransientOverlayViewController *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  presentedControlCenterModuleTransientOverlayViewController = self->_presentedControlCenterModuleTransientOverlayViewController;
  if (presentedControlCenterModuleTransientOverlayViewController)
  {
    -[SBControlCenterModuleTransientOverlayViewController presentationOptions](presentedControlCenterModuleTransientOverlayViewController, "presentationOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "animateDismissal");

    v8 = self->_presentedControlCenterModuleTransientOverlayViewController;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__SBMainWorkspace__dismissPresentedControlCenterModule___block_invoke;
    v9[3] = &unk_1E8E9F1E8;
    v9[4] = self;
    v10 = v4;
    -[SBMainWorkspace dismissTransientOverlayViewController:animated:completion:](self, "dismissTransientOverlayViewController:animated:completion:", v8, v7, v9);

  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }

}

void __56__SBMainWorkspace__dismissPresentedControlCenterModule___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 136);
  *(_QWORD *)(v3 + 136) = 0;

}

- (void)controlCenterModuleTransientOverlayViewControllerNeedsDismissal:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "presentationOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v7, "presentationOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "animatePresentation");

  }
  else
  {
    v6 = 1;
  }

  -[SBMainWorkspace dismissTransientOverlayViewController:animated:completion:](self, "dismissTransientOverlayViewController:animated:completion:", v7, v6, 0);
}

- (id)inCallPresentationManager:(id)a3 createPresentationSessionWithSceneHandle:(id)a4
{
  id v5;
  SBInCallPresentationSession *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  SBPIPControllerCoordinator *pipCoordinator;
  void *v13;
  SBInCallPresentationSession *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a4;
  v6 = [SBInCallPresentationSession alloc];
  objc_msgSend((id)SBApp, "bannerManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sceneDeactivationManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainWorkspace keyboardFocusController](self, "keyboardFocusController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = SBApp;
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  pipCoordinator = self->_pipCoordinator;
  objc_msgSend((id)SBApp, "lockOutController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SBInCallPresentationSession initWithSceneHandle:workspace:bannerManager:lockScreenManager:deactivationManager:mainSwitcherCoordinator:backlightController:keyboardFocusController:springBoard:setupManager:uiController:pipCoordinator:lockoutStateProvider:](v6, "initWithSceneHandle:workspace:bannerManager:lockScreenManager:deactivationManager:mainSwitcherCoordinator:backlightController:keyboardFocusController:springBoard:setupManager:uiController:pipCoordinator:lockoutStateProvider:", v5, self, v19, v18, v17, v16, v7, v8, v9, v10, v11, pipCoordinator, v13);

  return v15;
}

- (int64_t)inCallPresentationManager:(id)a3 interfaceOrientationForBannerPresentationInWindowScene:(id)a4
{
  id v4;
  uint64_t v5;
  int64_t v6;

  v4 = a4;
  if (objc_msgSend(v4, "isMainDisplayWindowScene"))
    v5 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
  else
    v5 = objc_msgSend(v4, "interfaceOrientation");
  v6 = v5;

  return v6;
}

- (int64_t)inCallPresentationManager:(id)a3 interfaceOrientationForTransientOverlayPresentationInWindowScene:(id)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a4, "transientOverlayPresenter", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBMainWorkspace defaultPreferredInterfaceOrientationForPresentationForTransientOverlayScenePresenter:](self, "defaultPreferredInterfaceOrientationForPresentationForTransientOverlayScenePresenter:", v5);

  return v6;
}

- (void)inCallPresentationManagerRequestsHandlingOfDeferredUILock:(id)a3
{
  objc_msgSend((id)SBApp, "handleDeferredUILockForInCallPresentation", a3);
}

- (void)_proposeIdleTimerBehaviorForReason:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  -[SBMainWorkspace _activeIdleTimerProvider](self, "_activeIdleTimerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMainWorkspace _setActiveIdleTimerProvider:](self, "_setActiveIdleTimerProvider:", v4);
  -[SBMainWorkspace _generateIdleTimerBehaviorForReason:](self, "_generateIdleTimerBehaviorForReason:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBIdleTimerCoordinatorHelper proposeIdleTimerBehavior:fromProvider:reason:](self->_idleTimerCoordinatorHelper, "proposeIdleTimerBehavior:fromProvider:reason:", v5, v4, v7);

}

- (void)presentPowerDownTransientOverlay
{
  SBPowerDownViewController *v3;
  void *v4;
  SBPowerDownViewController *v5;
  SBPowerDownViewController *powerDownViewController;
  SBHomeHardwareButtonLongPressDurationAssertion *v7;
  SBHomeHardwareButtonLongPressDurationAssertion *powerDownLongPressDurationAssertion;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  if (!self->_powerDownViewController)
  {
    v3 = [SBPowerDownViewController alloc];
    objc_msgSend((id)SBApp, "windowSceneManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SBPowerDownViewController initWithWindowSceneManager:](v3, "initWithWindowSceneManager:", v4);
    powerDownViewController = self->_powerDownViewController;
    self->_powerDownViewController = v5;

    -[SBPowerDownViewController setDelegate:](self->_powerDownViewController, "setDelegate:", self);
    v7 = -[SBHomeHardwareButtonLongPressDurationAssertion initWithReason:duration:]([SBHomeHardwareButtonLongPressDurationAssertion alloc], "initWithReason:duration:", CFSTR("SBPowerDownViewController"), 5.0);
    powerDownLongPressDurationAssertion = self->_powerDownLongPressDurationAssertion;
    self->_powerDownLongPressDurationAssertion = v7;

    objc_msgSend((id)SBApp, "homeHardwareButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addLongPressDurationAssertion:", self->_powerDownLongPressDurationAssertion);

    objc_msgSend((id)SBApp, "authenticationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v10, "hasPasscodeSet");

    if ((_DWORD)v4)
    {
      v13[0] = CFSTR("SBUILockOptionsForceBioLockoutKey");
      v13[1] = CFSTR("SBUILockOptionsForceLockKey");
      v14[0] = MEMORY[0x1E0C9AAB0];
      v14[1] = MEMORY[0x1E0C9AAB0];
      v13[2] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
      v14[2] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lockUIFromSource:withOptions:", 23, v11);

    }
    -[SBMainWorkspace presentTransientOverlayViewController:animated:completion:](self, "presentTransientOverlayViewController:animated:completion:", self->_powerDownViewController, 1, 0);
  }
}

- (void)dismissPowerDownTransientOverlayWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD, _QWORD);
  _QWORD v15[5];
  void (**v16)(_QWORD);
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBMainWorkspace dismissPowerDownTransientOverlayWithCompletion:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("SBWorkspace.m"), 2278, CFSTR("this call must be made on the main thread"));

  }
  if (self->_powerDownViewController)
  {
    v5 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__SBMainWorkspace_dismissPowerDownTransientOverlayWithCompletion___block_invoke;
    v15[3] = &unk_1E8E9F230;
    v15[4] = self;
    v16 = v4;
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v15);
    objc_msgSend((id)SBApp, "authenticationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasPasscodeSet");

    if (v8)
    {
      v17[0] = CFSTR("SBUILockOptionsForceBioLockoutKey");
      v17[1] = CFSTR("SBUILockOptionsForceLockKey");
      v18[0] = MEMORY[0x1E0C9AAB0];
      v18[1] = MEMORY[0x1E0C9AAB0];
      v17[2] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
      v18[2] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __66__SBMainWorkspace_dismissPowerDownTransientOverlayWithCompletion___block_invoke_2;
      v13[3] = &unk_1E8E9F1C0;
      v14 = v6;
      objc_msgSend(v10, "lockUIFromSource:withOptions:completion:", 23, v9, v13);

    }
    else
    {
      v6[2](v6, 1);
    }

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

uint64_t __66__SBMainWorkspace_dismissPowerDownTransientOverlayWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissTransientOverlayViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), a2, *(_QWORD *)(a1 + 40));
}

void __66__SBMainWorkspace_dismissPowerDownTransientOverlayWithCompletion___block_invoke_2(uint64_t a1)
{
  id v1;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPasscodeVisible:animated:", 1, 1);

}

- (BOOL)isPowerDownTransientOverlayTopmost
{
  return self->_powerDownViewController
      && -[SBTransientOverlayPresentationManager isTopmostPresentedViewController:](self->_transientOverlayPresentationManager, "isTopmostPresentedViewController:");
}

- (void)powerDownViewControllerRequestsPowerDown:(id)a3
{
  void *v3;
  SBShutdownContext *v4;

  v4 = -[SBShutdownContext initWithReason:]([SBShutdownContext alloc], "initWithReason:", CFSTR("Powerdown UI"));
  -[SBShutdownContext setFromUserPowerDown:](v4, "setFromUserPowerDown:", 1);
  objc_msgSend((id)SBApp, "restartManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shutdownWithContext:", v4);

}

- (void)powerDownViewControllerRequestsDismissal:(id)a3
{
  -[SBMainWorkspace dismissPowerDownTransientOverlayWithCompletion:](self, "dismissPowerDownTransientOverlayWithCompletion:", 0);
}

- (void)powerDownViewControllerDidDisappear:(id)a3
{
  SBPowerDownViewController *powerDownViewController;
  void *v5;
  SBHomeHardwareButtonLongPressDurationAssertion *powerDownLongPressDurationAssertion;

  powerDownViewController = self->_powerDownViewController;
  self->_powerDownViewController = 0;

  objc_msgSend((id)SBApp, "homeHardwareButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeLongPressDurationAssertion:", self->_powerDownLongPressDurationAssertion);

  powerDownLongPressDurationAssertion = self->_powerDownLongPressDurationAssertion;
  self->_powerDownLongPressDurationAssertion = 0;

}

- (void)_broadcastCurrentTransaction
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  if (objc_msgSend((id)SBApp, "_isRemoteStateDumpEnabled"))
  {
    -[SBWorkspaceTransaction debugDescription](self->_currentTransaction, "debugDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SBMainWorkspace__broadcastCurrentTransaction__block_invoke;
    block[3] = &unk_1E8E9DED8;
    v7 = v3;
    v5 = v3;
    dispatch_async(v4, block);

  }
}

void __47__SBMainWorkspace__broadcastCurrentTransaction__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)SBApp;
  v2 = *(_QWORD *)(a1 + 32);
  v4 = CFSTR("SpringBoard - CurrentTransaction");
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_broadcastStateCaptureToConnectedRemotePeers:", v3);

}

- (void)_initializeAndObserveDefaults
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "soundDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __playSoundOnWake = objc_msgSend(v3, "playSoundOnDeviceWake");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "playSoundOnDeviceWake");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __48__SBMainWorkspace__initializeAndObserveDefaults__block_invoke;
  v20[3] = &unk_1E8E9DED8;
  v21 = v3;
  v6 = v3;
  v7 = (void *)MEMORY[0x1E0C80D38];
  v8 = (id)objc_msgSend(v6, "observeDefault:onQueue:withBlock:", v4, MEMORY[0x1E0C80D38], v20);

  objc_msgSend(v2, "powerDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBWorkspaceSetPreventIdleSleepForReason(objc_msgSend(v9, "disableIdleSleep"), CFSTR("SBPowerDefaults"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "disableIdleSleep");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __48__SBMainWorkspace__initializeAndObserveDefaults__block_invoke_2;
  v18[3] = &unk_1E8E9DED8;
  v11 = v9;
  v19 = v11;
  v12 = (id)objc_msgSend(v11, "observeDefault:onQueue:withBlock:", v10, v7, v18);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "trackPowerEvents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __48__SBMainWorkspace__initializeAndObserveDefaults__block_invoke_3;
  v16[3] = &unk_1E8E9DED8;
  v17 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v14, "observeDefault:onQueue:withBlock:", v13, v7, v16);

}

uint64_t __48__SBMainWorkspace__initializeAndObserveDefaults__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "playSoundOnDeviceWake");
  __playSoundOnWake = result;
  return result;
}

void __48__SBMainWorkspace__initializeAndObserveDefaults__block_invoke_2(uint64_t a1)
{
  SBWorkspaceSetPreventIdleSleepForReason(objc_msgSend(*(id *)(a1 + 32), "disableIdleSleep"), CFSTR("SBPowerDefaults"));
}

void __48__SBMainWorkspace__initializeAndObserveDefaults__block_invoke_3(uint64_t a1)
{
  _SBWorkspaceTrackPowerEvents(objc_msgSend(*(id *)(a1 + 32), "trackPowerEvents"));
}

- (id)_alertItemForPreventingLaunchOfApp:(id)a3 fromTrustState:(unint64_t)a4
{
  id v5;
  void *v6;
  SBAppDeveloperModeRequiredAlertItem *v7;
  __objc2_class *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  SBAppDeveloperModeRequiredAlertItem *v14;
  void *v15;
  int v16;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  NSObject *v24;
  __objc2_class **v25;
  _DWORD v26[2];
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  v7 = 0;
  switch(a4)
  {
    case 2uLL:
      v8 = SBAppDeniedAlertItem;
      goto LABEL_13;
    case 3uLL:
    case 4uLL:
    case 5uLL:
      v8 = SBAppProfileExpiredAlertItem;
      goto LABEL_13;
    case 6uLL:
      v8 = SBAppProfileNeedsValidationAlertItem;
      goto LABEL_13;
    case 7uLL:
      objc_msgSend(v5, "info");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isUPPProvisioningProfileValidated"))
      {

      }
      else
      {
        objc_msgSend(v6, "info");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isFreeDeveloperProvisioningProfileValidated");

        if (v16)
        {
          v8 = SBAppFreeDevProfileNotTrustedAlertItem;
          goto LABEL_13;
        }
      }
      v8 = SBAppProfileNotTrustedAlertItem;
LABEL_13:
      v14 = (SBAppDeveloperModeRequiredAlertItem *)objc_msgSend([v8 alloc], "initWithApp:", v6);
LABEL_14:
      v7 = v14;
LABEL_15:

      return v7;
    case 9uLL:
      v10 = objc_alloc(MEMORY[0x1E0CA5870]);
      objc_msgSend(v6, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithBundleIdentifier:allowPlaceholder:error:", v11, 0, 0);

      if (v12)
        v13 = objc_msgSend(v12, "updateAvailability") == 1;
      else
        v13 = 0;
      objc_msgSend(v6, "info");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isProvisioningProfileValidated");

      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isOnDeviceAppInstallationAllowed");

      objc_msgSend(v6, "info");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isLicensedToDevice");

      SBLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v26[0] = 67109888;
        v26[1] = v13;
        v27 = 1024;
        v28 = v19 ^ 1;
        v29 = 1024;
        v30 = v21;
        v31 = 1024;
        v32 = v23;
        _os_log_debug_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEBUG, "Signature error: hasUpdateAvailable: %d, isAppStoreApp: %d, isAppInstallationAllowed: %d, isAppLicensedToDevice: %d", (uint8_t *)v26, 0x1Au);
      }

      if (v19 | v23 | !v13 | v21 ^ 1)
        v25 = off_1E8E94D98;
      else
        v25 = off_1E8E94D90;
      v7 = (SBAppDeveloperModeRequiredAlertItem *)objc_msgSend(objc_alloc(*v25), "initWithApplication:", v6);

      goto LABEL_15;
    case 0xAuLL:
      v14 = -[SBAppDeveloperModeRequiredAlertItem initWithApplication:]([SBAppDeveloperModeRequiredAlertItem alloc], "initWithApplication:", v5);
      goto LABEL_14;
    default:
      goto LABEL_15;
  }
}

void __60__SBMainWorkspace__preflightTransitionRequest_forExecution___block_invoke(uint64_t a1)
{
  id v2;

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateAlertItem:", *(_QWORD *)(a1 + 32));

}

void __60__SBMainWorkspace__preflightTransitionRequest_forExecution___block_invoke_315(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  BSDispatchMain();

}

uint64_t __60__SBMainWorkspace__preflightTransitionRequest_forExecution___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cleanupAppRepairRequest:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_executeTransientOverlayTransitionRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  BOOL v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location;

  v5 = a3;
  -[SBWorkspace eventQueue](self, "eventQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executingEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 2837, CFSTR("must only be called when running on the event queue"));

  }
  objc_msgSend(v5, "transientOverlayContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "shouldPreserveAppSwitcher"))
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "windowSceneForDisplayIdentity:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "switcherController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      SBLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

      if (v15)
        NSLog(CFSTR("expected a switcherController!"));
    }
    if (objc_msgSend(v13, "unlockedEnvironmentMode") == 2)
      objc_msgSend(v9, "setRequestedUnlockedEnvironmentMode:", 2);

  }
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__SBMainWorkspace__executeTransientOverlayTransitionRequest___block_invoke;
  v19[3] = &unk_1E8E9F348;
  objc_copyWeak(&v20, &location);
  v16 = -[SBMainWorkspace _setCurrentTransactionForRequest:fallbackProvider:](self, "_setCurrentTransactionForRequest:fallbackProvider:", v5, v19);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v16;
}

id __61__SBMainWorkspace__executeTransientOverlayTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_selectTransactionForTransientOverlayPresentationRequest:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_selectTransactionForTransientOverlayPresentationRequest:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __objc2_class **v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "transientOverlayContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "transitionType");
  v6 = off_1E8E98C80;
  if (v5)
    v6 = off_1E8E98C68;
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithTransitionRequest:", v3);

  return v7;
}

- (id)_selectTransactionForReturningToTheLockScreenAndForceToBuddy:(BOOL)a3
{
  void *v5;
  void *v6;
  _QWORD v8[5];
  BOOL v9;

  -[SBMainWorkspace createRequestWithOptions:](self, "createRequestWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__SBMainWorkspace__selectTransactionForReturningToTheLockScreenAndForceToBuddy___block_invoke;
  v8[3] = &unk_1E8E9F398;
  v9 = a3;
  v8[4] = self;
  objc_msgSend(v5, "modifyApplicationContext:", v8);
  -[SBMainWorkspace _selectTransactionForReturningToTheLockScreenWithRequest:](self, "_selectTransactionForReturningToTheLockScreenWithRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __80__SBMainWorkspace__selectTransactionForReturningToTheLockScreenAndForceToBuddy___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  SBDeviceApplicationSceneEntity *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setAnimationDisabled:", 1);
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInSetupMode") && (objc_msgSend(v3, "updateInSetupMode") & 1) != 0
    || *(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_applicationForIdentifier:", CFSTR("com.apple.purplebuddy"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", v4);
    objc_msgSend(v6, "setEntity:forLayoutRole:", v5, 1);

  }
  else
  {
    +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActivatingEntity:", v4);
  }

}

- (id)_selectTransactionForReturningToTheLockScreenWithRequest:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  SBReturnToLockscreenWorkspaceTransaction *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 2998, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lockScreenEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBReturnToLockscreenWorkspaceTransaction initWithTransitionRequest:toLockScreenEnvironment:]([SBReturnToLockscreenWorkspaceTransaction alloc], "initWithTransitionRequest:toLockScreenEnvironment:", v5, v7);

  return v8;
}

- (id)_selectTransactionForAppActivationUnderMainScreenLock:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[SBMainWorkspace createRequestWithOptions:](self, "createRequestWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __84__SBMainWorkspace__selectTransactionForAppActivationUnderMainScreenLock_withResult___block_invoke;
  v16 = &unk_1E8E9F3C0;
  v17 = v6;
  v18 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "modifyApplicationContext:", &v13);
  -[SBMainWorkspace _selectTransactionForAppActivationUnderMainScreenLockRequest:](self, "_selectTransactionForAppActivationUnderMainScreenLockRequest:", v8, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __84__SBMainWorkspace__selectTransactionForAppActivationUnderMainScreenLock_withResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    objc_msgSend(a2, "setActivatingEntity:", v3);
  }
  else
  {
    v4 = a2;
    +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActivatingEntity:", v5);

  }
  objc_msgSend(a2, "setResultBlock:", *(_QWORD *)(a1 + 40));

}

- (id)_selectTransactionForAppActivationUnderMainScreenLockRequest:(id)a3
{
  id v5;
  SBActivateAppUnderLockScreenWorkspaceTransaction *v6;
  void *v7;
  void *v8;
  SBActivateAppUnderLockScreenWorkspaceTransaction *v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 3019, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

  }
  v6 = [SBActivateAppUnderLockScreenWorkspaceTransaction alloc];
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lockScreenEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBActivateAppUnderLockScreenWorkspaceTransaction initWithTransitionRequest:lockScreenEnvironment:](v6, "initWithTransitionRequest:lockScreenEnvironment:", v5, v8);

  -[SBWorkspaceTransaction transitionRequest](v9, "transitionRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_selectTransactionForAppRelaunch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowSceneForDisplayIdentity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "uiLockStateProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  if (objc_msgSend(v12, "isUILocked") && (objc_msgSend(v4, "BOOLForActivationSetting:", 3) & 1) == 0)
  {
    -[SBMainWorkspace _selectTransactionForAppActivationUnderMainScreenLock:withResult:](self, "_selectTransactionForAppActivationUnderMainScreenLock:withResult:", v4, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBMainWorkspace createRequestForApplicationActivation:options:](self, "createRequestForApplicationActivation:options:", v4, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainWorkspace _selectTransactionForAppActivationRequest:](self, "_selectTransactionForAppActivationRequest:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)_selectTransactionForAppEntityRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  SBMainWorkspaceLayoutStateContingencyPlan *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SBAppExitedWorkspaceTransaction *v25;
  void *v26;
  SBMainWorkspaceLayoutStateContingencyPlan *v28;

  v4 = a3;
  objc_msgSend(v4, "sceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sb_displayIdentityForSceneManagers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)SBApp, "windowSceneManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowSceneForDisplayIdentity:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v9, "embeddedDisplayWindowScene");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend((id)SBApp, "lockOutController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "authenticationStatusProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  if ((objc_msgSend(v14, "isBlocked") & 1) != 0 || (objc_msgSend(v18, "isAuthenticated") & 1) == 0)
  {
    -[SBMainWorkspace _selectTransactionForReturningToTheLockScreenAndForceToBuddy:](self, "_selectTransactionForReturningToTheLockScreenAndForceToBuddy:", 0);
    v25 = (SBAppExitedWorkspaceTransaction *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = objc_alloc_init(SBMainWorkspaceLayoutStateContingencyPlan);
    objc_msgSend(v13, "switcherController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v19;
    -[SBMainWorkspaceLayoutStateContingencyPlan transitionContextForLayoutContext:failedEntities:](v19, "transitionContextForLayoutContext:failedEntities:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v22, "setAnimationDisabled:", 1);
      objc_msgSend(v13, "_fbsDisplayConfiguration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBMainWorkspace createRequestWithOptions:displayConfiguration:](self, "createRequestWithOptions:displayConfiguration:", 0, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "setApplicationContext:", v22);
      v25 = -[SBToAppsWorkspaceTransaction initWithTransitionRequest:]([SBAppExitedWorkspaceTransaction alloc], "initWithTransitionRequest:", v24);
      -[SBWorkspaceTransaction transitionRequest](v25, "transitionRequest");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = 0;
    }

  }
  return v25;
}

void __61__SBMainWorkspace__selectTransactionForAppActivationRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setTransitionType:", 1);
  objc_msgSend(v3, "setScenePresenter:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setAnimated:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_updateMedusaCapabilitySendingNotification:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  id v7;

  v3 = a3;
  +[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMedusaCapable");

  if (self->_medusaCapable != v6)
  {
    self->_medusaCapable = v6;
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("SBWorkspaceMedusaCapabilityChangedNotification"), 0);

    }
  }
}

- (void)_suspend
{
  id v3;
  BSEventQueueLock *v4;
  BSEventQueueLock *suspensionLock;
  id v6;

  if (!self->_suspensionLock)
  {
    v3 = objc_alloc(MEMORY[0x1E0D01780]);
    -[SBWorkspace eventQueue](self, "eventQueue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (BSEventQueueLock *)objc_msgSend(v3, "initWithEventQueue:reason:", v6, CFSTR("SBWorkspaceSuspended"));
    suspensionLock = self->_suspensionLock;
    self->_suspensionLock = v4;

  }
}

- (void)_resume
{
  BSEventQueueLock *suspensionLock;
  BSEventQueueLock *v4;
  BSEventQueueLock *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  suspensionLock = self->_suspensionLock;
  if (suspensionLock)
  {
    v4 = suspensionLock;
    v5 = self->_suspensionLock;
    self->_suspensionLock = 0;

    if (!self->_initialized)
    {
      -[SBWorkspace eventQueue](self, "eventQueue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __26__SBMainWorkspace__resume__block_invoke;
      v8[3] = &unk_1E8E9DED8;
      v8[4] = self;
      objc_msgSend(MEMORY[0x1E0D01778], "eventWithName:handler:", CFSTR("SBWorkspaceFinishInitialization"), v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "executeOrInsertEvent:atPosition:", v7, 0);

    }
    -[BSEventQueueLock relinquish](v4, "relinquish");

  }
}

uint64_t __26__SBMainWorkspace__resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishInitialization");
}

- (void)_finishInitialization
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  SBInCallPresentationManager *v15;
  void *v16;
  void *v17;
  void *v18;
  SBInCallPresentationManager *v19;
  SBInCallPresentationManager *inCallPresentationManager;
  SBFocusModesHomeScreenSettingsManager *v21;
  SBFocusModesHomeScreenSettingsManager *focusModesHomeScreenSnapshotManager;
  SBHomeScreenConfigurationManager *v23;
  SBHomeScreenConfigurationManager *homeScreenConfigurationManager;
  SBTransientOverlayPresentationManager *transientOverlayPresentationManager;
  void *v26;
  Class v27;
  void *v28;
  SBKeyboardDismissalManager *v29;
  void *v30;
  void *v31;
  void *v32;
  SBKeyboardDismissalManager *v33;
  SBKeyboardDismissalManager *keyboardDismissalManager;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!self->_initialized)
  {
    self->_initialized = 1;
    objc_msgSend(MEMORY[0x1E0D229A0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", self);

    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:", self);

    +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:", self);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v6, "allProcesses", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          -[SBMainWorkspace processManager:didAddProcess:](self, "processManager:didAddProcess:", v6, v12);
          if (objc_msgSend(v12, "isApplicationProcess") && objc_msgSend(v12, "isRunning"))
          {
            objc_msgSend(v12, "bundleIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "applicationWithBundleIdentifier:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "_processWillLaunch:", v12);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v9);
    }

    v15 = [SBInCallPresentationManager alloc];
    objc_msgSend((id)SBApp, "windowSceneManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "bannerManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SBInCallPresentationManager initWithWindowSceneManager:applicationController:bannerManager:](v15, "initWithWindowSceneManager:applicationController:bannerManager:", v16, v17, v18);
    inCallPresentationManager = self->_inCallPresentationManager;
    self->_inCallPresentationManager = v19;

    -[SBInCallPresentationManager setDelegate:](self->_inCallPresentationManager, "setDelegate:", self);
    v21 = objc_alloc_init(SBFocusModesHomeScreenSettingsManager);
    focusModesHomeScreenSnapshotManager = self->_focusModesHomeScreenSnapshotManager;
    self->_focusModesHomeScreenSnapshotManager = v21;

    v23 = objc_alloc_init(SBHomeScreenConfigurationManager);
    homeScreenConfigurationManager = self->_homeScreenConfigurationManager;
    self->_homeScreenConfigurationManager = v23;

    transientOverlayPresentationManager = self->_transientOverlayPresentationManager;
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransientOverlayPresentationManager setCoverSheetPresentationManager:](transientOverlayPresentationManager, "setCoverSheetPresentationManager:", v26);

    v27 = NSClassFromString(CFSTR("UIKeyboardArbiterManager"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[objc_class performSelector:](v27, "performSelector:", sel_sharedArbiterManager);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
    v29 = [SBKeyboardDismissalManager alloc];
    objc_msgSend(MEMORY[0x1E0D00E00], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainWorkspace keyboardFocusController](self, "keyboardFocusController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[SBKeyboardDismissalManager initWithTouchDeliveryService:systemGestureManager:keyboardArbiterManager:focusController:](v29, "initWithTouchDeliveryService:systemGestureManager:keyboardArbiterManager:focusController:", v30, v31, v28, v32);
    keyboardDismissalManager = self->_keyboardDismissalManager;
    self->_keyboardDismissalManager = v33;

    +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBKeyboardFocusArbitrationReason workspaceDidFinishInitialization](SBKeyboardFocusArbitrationReason, "workspaceDidFinishInitialization");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "requestArbitrationForSBWindowScene:forReason:", 0, v36);

  }
}

- (void)setPipCoordinator:(id)a3
{
  SBPIPControllerCoordinator **p_pipCoordinator;
  SBPIPPegasusAdapter *v7;
  SBPIPController *v8;
  double v9;
  void *v10;
  void *v11;
  SBPIPController *v12;
  Class v13;
  SBPIPControllerCoordinator *v14;
  SBKeyboardDismissalManager *keyboardDismissalManager;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SBSystemNotesManager *v21;
  SBSystemNotesManager *systemNotesManager;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SBSystemNotesManager *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  p_pipCoordinator = &self->_pipCoordinator;
  if (self->_pipCoordinator)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBWorkspace.m"), 3178, CFSTR("PIP Coordinator must be configured exactly once"));

  }
  objc_storeStrong((id *)&self->_pipCoordinator, a3);
  if (+[SBPIPPegasusAdapter isSupported](SBPIPPegasusAdapter, "isSupported"))
  {
    v7 = objc_alloc_init(SBPIPPegasusAdapter);
    v8 = [SBPIPController alloc];
    v9 = *MEMORY[0x1E0CEBE28] + 5.0 + 25.0;
    +[SBPIPSettingsDomain rootSettings](SBPIPSettingsDomain, "rootSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interactionSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBPIPController initWithIdleTimerCoordinator:windowLevel:interactionSettings:adapter:](v8, "initWithIdleTimerCoordinator:windowLevel:interactionSettings:adapter:", self, v11, v7, v9);

    -[SBPIPControllerCoordinator registerController:forType:](*p_pipCoordinator, "registerController:forType:", v12, 0);
  }
  v13 = NSClassFromString(CFSTR("UIKeyboardArbiterManager"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class performSelector:](v13, "performSelector:", sel_sharedArbiterManager);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  v29 = [SBSystemNotesManager alloc];
  v14 = *p_pipCoordinator;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sceneDeactivationManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardSuppressionManager sharedInstance](SBKeyboardSuppressionManager, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  keyboardDismissalManager = self->_keyboardDismissalManager;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "embeddedDisplayWindowScene");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "systemPointerInteractionManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SBSystemNotesManager initWithControllerCoordinator:workspace:sceneManager:keyboardArbiterManager:fbSceneManager:sceneDeactivationManager:keyboardSuppressionManager:keyboardDismissalManager:applicationController:systemGestureManager:systemPointerInteractionManager:idleTimerCoordinator:managedProfileConnection:](v29, "initWithControllerCoordinator:workspace:sceneManager:keyboardArbiterManager:fbSceneManager:sceneDeactivationManager:keyboardSuppressionManager:keyboardDismissalManager:applicationController:systemGestureManager:systemPointerInteractionManager:idleTimerCoordinator:managedProfileConnection:", v14, self, v28, v31, v27, v26, v25, keyboardDismissalManager, v24, v16, v19, self, v20);
  systemNotesManager = self->_systemNotesManager;
  self->_systemNotesManager = v21;

}

- (id)pipControllerForType:(int64_t)a3
{
  return -[SBPIPControllerCoordinator controllerForType:](self->_pipCoordinator, "controllerForType:", a3);
}

- (void)_handleBuddyLaunchFinished
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SBBuddyLockScreenDismissOnlyAlertItem *v14;
  void *v15;
  void *v16;
  SBBuddyLockScreenDismissOnlyAlertItem *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "restartManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "startupTransition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

    }
    else
    {
      +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isInSetupModeForDeviceMigration");

      if ((v6 & 1) == 0)
      {
        +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = v8;
        v19[1] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = v9;
        v19[2] = CFSTR("SBUILockOptionsForceLockKey");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20[2] = v10;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lockUIFromSource:withOptions:", 16, v11);

        +[SBDefaults localDefaults](SBDefaults, "localDefaults");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setupDefaults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v9) = objc_msgSend(v13, "inSetupModeForActivationChange");

        if ((_DWORD)v9)
        {
          v14 = [SBBuddyLockScreenDismissOnlyAlertItem alloc];
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ACTIVATION_REQUIRED"), CFSTR("Activation Required"), CFSTR("SpringBoard"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[SBDismissOnlyAlertItem initWithTitle:body:](v14, "initWithTitle:body:", v16, 0);

          +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "activateAlertItem:", v17);

        }
      }
    }
  }

}

- (BOOL)_handleSetupExited:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateInSetupMode");
  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isInSetupMode")
    || (objc_msgSend(v3, "isInSetupModeForDeviceMigration") & 1) != 0
    || (objc_msgSend(v4, "isRestoring") & 1) != 0
    || objc_msgSend(v4, "isResetting"))
  {
    objc_msgSend((id)SBApp, "bannerManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSuspended:forReason:", 0, CFSTR("com.apple.purplebuddy"));

    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDeferringDeviceOrientationUpdates:", 0);

    +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "restoreStateFromPrefs");

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setupDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInSetupModeForActivationChange:", 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("SBSetupBuddyCompletedNotification"), 0);

    v11 = 0;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)_applicationProcessExited:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  char v14;
  uint64_t v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  _QWORD block[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "applicationWithBundleIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setupApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v10 == v12 && -[SBMainWorkspace _handleSetupExited:](self, "_handleSetupExited:", v10);
    v14 = objc_msgSend(v6, "exitReason");
    v15 = objc_msgSend(v6, "terminationReason");
    if ((FBSApplicationTerminationReasonIsGraceful() & 1) == 0 && v15 != 7 && (v14 & 1) == 0 && (v14 & 0x10) == 0)
    {
      objc_msgSend(v10, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.siri"));

      if ((v17 & 1) == 0)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __57__SBMainWorkspace__applicationProcessExited_withContext___block_invoke;
        block[3] = &unk_1E8E9DED8;
        v22 = v10;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
    }
    if (v13)
    {
      SBLogWorkspace();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "bundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v19;
        _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, "%{public}@ should relaunch on exit", buf, 0xCu);

      }
    }
    objc_msgSend(v10, "_didExitWithContext:", v6);
    if ((v14 & 0x10) != 0)
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "didReceiveMemoryWarning");

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

void __57__SBMainWorkspace__applicationProcessExited_withContext___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithObjectsAndKeys:", v2, *MEMORY[0x1E0CEB338], 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)SBApp, "failedTest:withResults:", 0, v3);
}

- (void)_noteDidWakeFromSleep
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  BSDispatchQueueAssertMain();
  __SBWIsSleeping = 0;
  if (__SBWGatherUsageTime == 1 && *(double *)&__SBWLastUsageTimeGMT != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", *(double *)&__SBWLastUsageTimeGMT);
    __SBWLastUsageTimeGMT = v2;
  }
  _SBWorkspaceNoteSleepOrWake(1);
  v3 = (void *)_noteDidWakeFromSleep___WakeSound;
  if (__playSoundOnWake)
  {
    if (!_noteDidWakeFromSleep___WakeSound)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/AppleInternal/Library/PreferenceBundles/Internal Settings.bundle/4_note_rising.aiff"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AD0]), "initWithContentsOfURL:error:", v4, 0);
      v6 = (void *)_noteDidWakeFromSleep___WakeSound;
      _noteDidWakeFromSleep___WakeSound = v5;

      v3 = (void *)_noteDidWakeFromSleep___WakeSound;
    }
    objc_msgSend(v3, "play");
  }
  else if (_noteDidWakeFromSleep___WakeSound)
  {
    _noteDidWakeFromSleep___WakeSound = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("SBWorkspaceDidWakeFromSleepNotification"), 0, 0);

}

- (void)_coversheetDidPresent
{
  BSDispatchMain();
}

uint64_t __40__SBMainWorkspace__coversheetDidPresent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proposeIdleTimerBehaviorForReason:", CFSTR("CoverSheetDidPresent"));
}

- (void)_coversheetDidDismiss
{
  BSDispatchMain();
}

uint64_t __40__SBMainWorkspace__coversheetDidDismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proposeIdleTimerBehaviorForReason:", CFSTR("CoverSheetDidDismiss"));
}

- (void)_destroyApplicationSceneEntity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
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
  id v26;

  v26 = a3;
  objc_msgSend(v26, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v26, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationSceneHandle lookupOrCreatePersistenceIDFromApplication:sceneID:](SBApplicationSceneHandle, "lookupOrCreatePersistenceIDFromApplication:sceneID:", v5, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      && (objc_msgSend(v5, "processState"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isRunning"),
          v8,
          v9))
    {
      v10 = objc_alloc(MEMORY[0x1E0CEA4F8]);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithPersistedIdentifiers:preferredAnimationType:callbackQueue:completion:", v11, 1, 0, 0);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v6, "sceneWithIdentifier:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (v13)
      {
        v15 = objc_alloc_init(MEMORY[0x1E0D23248]);
        objc_msgSend(v15, "setActions:", v13);
      }
      else
      {
        v15 = 0;
      }
      objc_msgSend(v6, "destroyScene:withTransitionContext:", v4, v15);

    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "applicationProcessesForBundleIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "workspace");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sendActions:", v13);

    }
    else
    {
      -[SBMainWorkspace _cleanupForRemovedAppEntity:](self, "_cleanupForRemovedAppEntity:", v26);
    }
    objc_msgSend(v5, "flushSnapshotsForSceneID:", v4);
    objc_msgSend(v5, "_dataStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeSceneStoreForIdentifier:", v4);

    objc_msgSend(v5, "bundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "info");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "restorationArchiveContainerURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    _deleteStateRestorationArchiveForApplication();

  }
}

- (void)_cleanupForRemovedAppEntity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  SBMainWorkspace *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectedWindowScenes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (!v30)
    {
LABEL_22:

      goto LABEL_23;
    }
    v25 = self;
    v26 = v4;
    v27 = 0;
    v28 = v7;
    v29 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v38 != v29)
          objc_enumerationMutation(v7);
        v9 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v9, "layoutStateProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "layoutState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "elements");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v34;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v34 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "workspaceEntity");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "applicationSceneEntity");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "uniqueIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isEqualToString:", v5);

              if ((v20 & 1) != 0)
              {
                v27 = 1;
                goto LABEL_17;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            if (v14)
              continue;
            break;
          }
LABEL_17:
          v7 = v28;
        }

      }
      v30 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v30);

    v4 = v26;
    if ((v27 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ApplicationEntity was removed = %@"), v5);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D229B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __47__SBMainWorkspace__cleanupForRemovedAppEntity___block_invoke;
      v31[3] = &unk_1E8E9E820;
      v31[4] = v25;
      v32 = v26;
      objc_msgSend(v22, "eventWithName:handler:", v21, v31);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)v21;
      -[SBWorkspace eventQueue](v25, "eventQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "executeOrPrependEvent:", v23);

      goto LABEL_22;
    }
  }
LABEL_23:

}

void __47__SBMainWorkspace__cleanupForRemovedAppEntity___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_selectTransactionForAppEntityRemoved:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentTransaction:", v2);

}

- (void)_removeApplicationEntities:(id)a3 withDestructionIntent:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, id);
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _BOOL4 v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, id))a5;
  v11 = objc_msgSend(v9, "shouldRemoveFromHistory");
  v31 = v8;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBPIPControllerCoordinator controllerForType:](self->_pipCoordinator, "controllerForType:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hostedAppSceneHandles");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v15);

  -[SBPIPControllerCoordinator controllerForType:](self->_pipCoordinator, "controllerForType:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hostedAppSceneHandles");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v17);

  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __79__SBMainWorkspace__removeApplicationEntities_withDestructionIntent_completion___block_invoke;
  v33[3] = &unk_1E8E9F410;
  v30 = v13;
  v34 = v30;
  objc_msgSend(v12, "bs_filter:", v33);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minusSet:", v18);
  v19 = 0;
  if (v11)
  {
    objc_msgSend(v12, "bs_filter:", &__block_literal_global_388);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "minusSet:", v19);
  }
  v20 = v12;
  v21 = objc_msgSend(v19, "count") == 0;
  v22 = objc_msgSend(v20, "count") == 0;
  if (objc_msgSend(v19, "count"))
  {
    SBLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v19;
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "asking switcher to remove the following entities: %{public}@", buf, 0xCu);
    }

    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleApplicationSceneEntityDestructionIntent:forEntities:", v9, v25);

    v21 = 1;
  }
  if (objc_msgSend(v20, "count"))
  {
    SBLogCommon();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v20;
      _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "asking workspace to remove the following entities: %{public}@", buf, 0xCu);
    }

    v32 = 0;
    v22 = -[SBMainWorkspace _removeApplicationEntitiesFromWorkspace:error:](self, "_removeApplicationEntitiesFromWorkspace:error:", v20, &v32);
    v27 = v32;
  }
  else
  {
    v27 = 0;
  }
  if (objc_msgSend(v18, "count"))
  {
    SBLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v36 = v18;
      _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "asking pip coordinator to remove the following entities: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v18, "bs_map:", &__block_literal_global_391);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBPIPControllerCoordinator handleDestructionRequestForSceneHandles:](self->_pipCoordinator, "handleDestructionRequestForSceneHandles:", v29);

  }
  if (v10)
    v10[2](v10, v22 & v21, v27);

}

uint64_t __79__SBMainWorkspace__removeApplicationEntities_withDestructionIntent_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);

  return v4;
}

uint64_t __79__SBMainWorkspace__removeApplicationEntities_withDestructionIntent_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "sceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_definition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "specification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiSceneSessionRole");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0CEBE48]) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "isEqual:", *MEMORY[0x1E0CEBB58]);

  return v6;
}

uint64_t __79__SBMainWorkspace__removeApplicationEntities_withDestructionIntent_completion___block_invoke_389(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sceneHandle");
}

- (BOOL)_removeApplicationEntitiesFromWorkspace:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v4;
  v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
  if (v53)
  {
    v52 = *(_QWORD *)v72;
    v56 = v5;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v72 != v52)
          objc_enumerationMutation(obj);
        v54 = v6;
        objc_msgSend(*(id *)(*((_QWORD *)&v71 + 1) + 8 * v6), "uniqueIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v70 = 0u;
        objc_msgSend((id)SBApp, "windowSceneManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "connectedWindowScenes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = v9;
        v58 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
        if (v58)
        {
          v57 = *(_QWORD *)v68;
          do
          {
            for (i = 0; i != v58; ++i)
            {
              if (*(_QWORD *)v68 != v57)
                objc_enumerationMutation(v55);
              v11 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
              v63 = 0u;
              v64 = 0u;
              v65 = 0u;
              v66 = 0u;
              objc_msgSend(v11, "layoutStateProvider");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "layoutState");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "elements");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v64;
                while (2)
                {
                  for (j = 0; j != v16; ++j)
                  {
                    if (*(_QWORD *)v64 != v17)
                      objc_enumerationMutation(v14);
                    objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * j), "workspaceEntity");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "applicationSceneEntity");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "uniqueIdentifier");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = objc_msgSend(v21, "isEqualToString:", v7);

                    if (v22)
                    {
                      objc_msgSend(v56, "addObject:", v7);
                      goto LABEL_21;
                    }
                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
                  if (v16)
                    continue;
                  break;
                }
              }
LABEL_21:

            }
            v58 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
          }
          while (v58);
        }

        v5 = v56;
        if ((objc_msgSend(v56, "containsObject:", v7) & 1) == 0)
        {
          objc_msgSend(v49, "sceneWithIdentifier:", v7);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = v50;
          if (v23)
          {
            objc_msgSend(v49, "destroyScene:withTransitionContext:", v7, 0);
            v24 = v48;
          }
          objc_msgSend(v24, "addObject:", v7);
        }

        v6 = v54 + 1;
      }
      while (v54 + 1 != v53);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
    }
    while (v53);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  objc_msgSend(v48, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v60;
LABEL_31:
    v29 = 0;
    while (1)
    {
      if (*(_QWORD *)v60 != v28)
        objc_enumerationMutation(v25);
      v30 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v29);
      objc_msgSend(v49, "sceneWithIdentifier:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
        break;
      if (v27 == ++v29)
      {
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
        if (v27)
          goto LABEL_31;
        goto LABEL_37;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The scene with identifier — %@ — was not destroyed synchronously by FBSceneManager as we relied upon"), v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogCommon();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      SBWorkspaceDestroyApplicationSceneHandlesWithIntent_cold_1();

    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = SBMainWorkspaceErrorDomain;
    v77 = *MEMORY[0x1E0CB2938];
    v78 = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, 2, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      v38 = 0;
      goto LABEL_52;
    }
  }
  else
  {
LABEL_37:

  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v39, "appendString:", CFSTR("The following scenes where not destroyed since they are laid out as foreground and we were asked to not remove their sessions (destroySessions flag is false): "));
    objc_msgSend(v5, "description");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "appendString:", v40);

  }
  if (objc_msgSend(v50, "count"))
  {
    objc_msgSend(v39, "appendString:", CFSTR("\n The following scenes couldn't be found: "));
    objc_msgSend(v50, "description");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "appendString:", v41);

  }
  if (objc_msgSend(v39, "length"))
  {
    SBLogCommon();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      SBWorkspaceDestroyApplicationSceneHandlesWithIntent_cold_1();

    v43 = (void *)MEMORY[0x1E0CB35C8];
    v44 = SBMainWorkspaceErrorDomain;
    v75 = *MEMORY[0x1E0CB2938];
    v76 = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "errorWithDomain:code:userInfo:", v44, 2, v45);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v37 = 0;
  }

  v38 = 1;
LABEL_52:
  if (a4)
    *a4 = objc_retainAutorelease(v37);

  return v38;
}

- (void)_cleanupAppRepairRequest:(id)a3
{
  NSMutableSet *ocelotRepairRequests;

  -[NSMutableSet removeObject:](self->_ocelotRepairRequests, "removeObject:", a3);
  if (!-[NSMutableSet count](self->_ocelotRepairRequests, "count"))
  {
    ocelotRepairRequests = self->_ocelotRepairRequests;
    self->_ocelotRepairRequests = 0;

  }
}

- (void)_handleKeyShortcutHUDVisibilityDidPresent:(id)a3
{
  SBKeyboardFocusControlling *keyboardFocusCoordinator;
  void *v5;
  void *v6;
  BSInvalidatable *v7;
  BSInvalidatable *lockKeyboardFocusAssertion;
  id v9;

  if (!self->_lockKeyboardFocusAssertion)
  {
    keyboardFocusCoordinator = self->_keyboardFocusCoordinator;
    objc_msgSend(a3, "object");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_sbWindowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBKeyboardFocusLockReason keyShortcutHUD](SBKeyboardFocusLockReason, "keyShortcutHUD");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBKeyboardFocusControlling focusLockSpringBoardWindowScene:forReason:](keyboardFocusCoordinator, "focusLockSpringBoardWindowScene:forReason:", v5, v6);
    v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    lockKeyboardFocusAssertion = self->_lockKeyboardFocusAssertion;
    self->_lockKeyboardFocusAssertion = v7;

  }
}

- (void)_handleKeyShortcutHUDVisibilityDidDismiss
{
  BSInvalidatable *lockKeyboardFocusAssertion;
  BSInvalidatable *v4;

  lockKeyboardFocusAssertion = self->_lockKeyboardFocusAssertion;
  if (lockKeyboardFocusAssertion)
  {
    -[BSInvalidatable invalidate](lockKeyboardFocusAssertion, "invalidate");
    v4 = self->_lockKeyboardFocusAssertion;
    self->_lockKeyboardFocusAssertion = 0;

  }
}

- (id)_targetWindowSceneForApplication:(id)a3 options:(id)a4 settings:(id)a5 requireForeground:(BOOL)a6 targetDisplayConfiguration:(id *)a7 error:(id *)a8
{
  uint64_t v10;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  void *v33;
  id v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  SBMainWorkspace *v50;
  unsigned int v51;
  id *v52;
  id v53;
  id *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v10 = a6;
  v66 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  objc_msgSend(a5, "objectForActivationSetting:", 50);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0DAB5C8]))
  {
    +[SBContinuitySessionManager sharedInstance](SBContinuitySessionManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mainWindowScene");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if (a7)
      {
        objc_msgSend(v19, "_sbDisplayConfiguration");
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      SBLogWorkspace();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "bundleIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v61 = v21;
        _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "Target window scene for \"%{public}@\" --> continuity because request originated from continuity system service instance", buf, 0xCu);

      }
      v19 = v19;
      v22 = v19;
    }
    else
    {
      if (a8)
      {
        FBSOpenApplicationErrorCreate();
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v22 = 0;
    }
    goto LABEL_40;
  }
  objc_msgSend(v15, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB868], objc_opt_class());
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "length"))
    goto LABEL_31;
  if ((SBFIsChamoisExternalDisplayControllerAvailable() & 1) == 0
    && !+[SBContinuitySessionManager areContinuitySessionsAllowed](SBContinuitySessionManager, "areContinuitySessionsAllowed"))
  {
    if (a8)
    {
      FBSOpenApplicationErrorCreate();
      v22 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
    goto LABEL_37;
  }
  v50 = self;
  v51 = v10;
  v52 = a8;
  v53 = v19;
  v54 = a7;
  v55 = v14;
  v19 = v19;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "connectedWindowScenes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v57;
LABEL_13:
    v28 = 0;
    while (1)
    {
      if (*(_QWORD *)v57 != v27)
        objc_enumerationMutation(v24);
      objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v28), "_fbsDisplayConfiguration");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "deviceName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", v19);

      if ((v31 & 1) != 0)
        break;

      if (v26 == ++v28)
      {
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v56, buf, 16);
        if (v26)
          goto LABEL_13;
        goto LABEL_19;
      }
    }

    v32 = objc_retainAutorelease(v29);
    if (!v32)
      goto LABEL_25;
    v33 = v32;
    v34 = 0;
    v35 = 1;
  }
  else
  {
LABEL_19:

LABEL_25:
    objc_msgSend((id)SBApp, "windowSceneManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "connectedWindowScenes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "allObjects");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bs_mapNoNulls:", &__block_literal_global_1061);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v39, "componentsJoinedByString:", CFSTR("\n"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringWithFormat:", CFSTR("Connected displays device names:\n\n%@\n\n"), v41);
    v34 = (id)objc_claimAutoreleasedReturnValue();

    v35 = 0;
    v33 = 0;
  }

  v42 = v33;
  v43 = v34;
  if ((v35 & 1) == 0)
  {
    v14 = v55;
    if (v52)
    {
      FBSOpenApplicationErrorCreate();
      *v52 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_37:
    v22 = 0;
    goto LABEL_40;
  }
  SBLogWorkspace();
  v44 = objc_claimAutoreleasedReturnValue();
  v14 = v55;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v55, "bundleIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "identity");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v61 = v45;
    v62 = 2114;
    v63 = v19;
    v64 = 2114;
    v65 = v46;
    _os_log_impl(&dword_1D0540000, v44, OS_LOG_TYPE_DEFAULT, "Target window scene for \"%{public}@\" --> options specified display name %{public}@ matching %{public}@", buf, 0x20u);

  }
  v19 = v53;
  a7 = v54;
  v10 = v51;
  self = v50;
  if (v42)
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "identity");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "windowSceneForDisplayIdentity:", v48);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(0, "identity");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  -[SBMainWorkspace _targetWindowSceneForApplication:preferringDisplay:requireForeground:options:](self, "_targetWindowSceneForApplication:preferringDisplay:requireForeground:options:", v14, v42, v10, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:

  if (a7)
  {
    objc_msgSend(v22, "_sbDisplayConfiguration");
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_40:

  return v22;
}

- (void)processDidExit:(id)a3
{
  objc_msgSend(a3, "removeObserver:", self);
}

- (void)applicationProcessDidExit:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  SBMainWorkspace *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke;
  block[3] = &unk_1E8E9E270;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  id obj;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  _QWORD v77[4];
  id v78;
  uint64_t v79;
  _QWORD v80[4];
  id v81;
  uint64_t v82;
  NSObject *v83;
  _QWORD v84[5];
  char v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[4];
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "restartManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPendingExit");

  if (!v3)
  {
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    objc_msgSend((id)SBApp, "windowSceneManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectedWindowScenes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v7;
    v74 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
    if (v74)
    {
      v75 = 0;
      v73 = *(_QWORD *)v91;
      do
      {
        for (i = 0; i != v74; ++i)
        {
          if (*(_QWORD *)v91 != v73)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
          v86 = 0u;
          v87 = 0u;
          v88 = 0u;
          v89 = 0u;
          objc_msgSend(v9, "layoutStateProvider");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "layoutState");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "elements");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
          if (v13)
          {
            v14 = v13;
            v76 = i;
            v15 = *(_QWORD *)v87;
            while (2)
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v87 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * j), "workspaceEntity");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "applicationSceneEntity");
                v18 = objc_claimAutoreleasedReturnValue();

                -[NSObject sceneHandle](v18, "sceneHandle");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "sceneIfExists");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "clientProcess");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = a1;
                v23 = *(void **)(a1 + 32);

                if (v21 == v23)
                {

                  v75 = v18;
                  a1 = v22;
                  goto LABEL_19;
                }

                a1 = v22;
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v86, v98, 16);
              if (v14)
                continue;
              break;
            }
LABEL_19:
            i = v76;
          }

        }
        v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
      }
      while (v74);
    }
    else
    {
      v75 = 0;
    }

    SBLogWorkspace();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v95 = v25;
      v96 = 2114;
      v97 = v26;
      _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Process exited: %{public}@ -> %{public}@", buf, 0x16u);
    }

    +[SBApplicationController sharedInstanceIfExists](SBApplicationController, "sharedInstanceIfExists");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "applicationWithBundleIdentifier:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      SBLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_cold_1((id *)(a1 + 32), v33);
      goto LABEL_73;
    }
    if (objc_msgSend(*(id *)(a1 + 48), "_applicationProcessExited:withContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)))
    {
      if (!objc_msgSend(v29, "isAnyTerminationAssertionHeld"))
      {
        v32 = a1;
        v34 = 1;
LABEL_37:
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v33 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "isUILocked"))
        {

          v37 = v32;
        }
        else
        {
          objc_msgSend((id)SBApp, "lockOutController");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isLockedOut");

          v37 = v32;
          if (v39)
          {
            if (v34)
            {
              objc_msgSend(v29, "bundleIdentifier");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

            }
            else
            {
              v41 = 0;
            }
            if ((v41 & 1) != 0 || v75)
            {
              SBLogCommon();
              v57 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v95) = v41;
                _os_log_impl(&dword_1D0540000, v57, OS_LOG_TYPE_DEFAULT, "Application exit detected and we need to return to the lock-screen: forceSetup: %d", buf, 8u);
              }

              v58 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v29, "bundleIdentifier");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "stringWithFormat:", CFSTR("ReturnToLockscreenFromApplicationExited = %@"), v59);
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              v84[0] = MEMORY[0x1E0C809B0];
              v84[1] = 3221225472;
              v84[2] = __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_414;
              v84[3] = &unk_1E8E9F508;
              v84[4] = *(_QWORD *)(v32 + 48);
              v85 = v41;
              objc_msgSend(MEMORY[0x1E0D229B0], "eventWithName:handler:", v52, v84);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject addObject:](v33, "addObject:", v60);

              v34 = 1;
              goto LABEL_56;
            }
            v34 = 1;
LABEL_57:
            +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "setupApplication");
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v63;
            if (v29 != v62
              && objc_msgSend(v63, "isInSetupMode")
              && ((v34 | objc_msgSend(v64, "updateInSetupMode") ^ 1) & 1) == 0
              && v75)
            {
              SBLogCommon();
              v65 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D0540000, v65, OS_LOG_TYPE_DEFAULT, "Activating Setup on a process exit because we're in setup mode.", buf, 2u);
              }

              SBWorkspaceActivateApplicationWithActionsAndResult(v62, 0, 0);
            }
            v66 = -[NSObject count](v33, "count");
            v67 = objc_msgSend(v35, "count");
            if (v66 | v67)
            {
              v69 = v67;
              if (v66)
              {
                +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "deactivateReachability");

                objc_msgSend(*(id *)(v37 + 48), "eventQueue");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v71, "executeOrPrependEvents:", v33);

              }
              if (!v69)
                goto LABEL_72;
              objc_msgSend(*(id *)(v37 + 48), "eventQueue");
              v68 = objc_claimAutoreleasedReturnValue();
              -[NSObject executeOrInsertEvents:atPosition:](v68, "executeOrInsertEvents:atPosition:", v35, 1);
            }
            else
            {
              SBLogWorkspace();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D0540000, v68, OS_LOG_TYPE_INFO, "No transaction needed for exiting app.", buf, 2u);
              }
            }

LABEL_72:
LABEL_73:

            v4 = v75;
            goto LABEL_74;
          }
        }
        if (v75)
          v42 = v34;
        else
          v42 = 1;
        if ((v42 & 1) == 0)
        {
          v43 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v29, "bundleIdentifier");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "stringWithFormat:", CFSTR("ApplicationExited = %@"), v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = (void *)MEMORY[0x1E0D229B0];
          v80[0] = MEMORY[0x1E0C809B0];
          v80[1] = 3221225472;
          v80[2] = __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_2;
          v80[3] = &unk_1E8E9E270;
          v47 = v29;
          v48 = *(_QWORD *)(v37 + 48);
          v81 = v47;
          v82 = v48;
          v83 = v75;
          objc_msgSend(v46, "eventWithName:handler:", v45, v80);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v33, "addObject:", v49);

        }
        if (v34)
        {
          v50 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v29, "bundleIdentifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "stringWithFormat:", CFSTR("RelaunchAfterApplicationExited = %@"), v51);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = (void *)MEMORY[0x1E0D229B0];
          v77[0] = MEMORY[0x1E0C809B0];
          v77[1] = 3221225472;
          v77[2] = __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_3;
          v77[3] = &unk_1E8E9E820;
          v54 = v29;
          v55 = *(_QWORD *)(v37 + 48);
          v78 = v54;
          v79 = v55;
          objc_msgSend(v53, "eventWithName:handler:", v52, v77);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v33, "addObject:", v56);

          v34 = 0;
LABEL_56:

          goto LABEL_57;
        }
        goto LABEL_57;
      }
      SBLogWorkspace();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v95 = v31;
        _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_INFO, "Not actually relaunching %@ because it has outstanding termination assertions", buf, 0xCu);
      }
      v32 = a1;

    }
    else
    {
      v32 = a1;
    }
    v34 = 0;
    goto LABEL_37;
  }
  SBLogWorkspace();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v95 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Ignoring application exit of %@ because we are pending exit.", buf, 0xCu);
  }
LABEL_74:

}

void __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_414(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_selectTransactionForReturningToTheLockScreenAndForceToBuddy:", *(unsigned __int8 *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentTransaction:", v2);

}

void __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "processState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "_selectTransactionForAppEntityRemoved:", *(_QWORD *)(a1 + 48));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setCurrentTransaction:", v4);

  }
}

void __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  SBDeviceApplicationSceneEntity *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "processState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  if ((v3 & 1) != 0)
  {
    SBLogWorkspace();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v9 = v5;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Not creating an app relaunch transaction because %{public}@ is already running", buf, 0xCu);

    }
  }
  else
  {
    v7 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_selectTransactionForAppRelaunch:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setCurrentTransaction:", v6);

  }
}

- (void)applicationProcessDebuggingStateDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBMainWorkspace_applicationProcessDebuggingStateDidChange___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __61__SBMainWorkspace_applicationProcessDebuggingStateDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_applicationForIdentifier:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 40);
  objc_msgSend(v4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_noteProcess:didChangeToState:", v4, v5);

  +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetIdleTimerForReason:", CFSTR("DebuggingStateDidChange"));

}

- (id)systemServiceApplicationInfoProvider:(id)a3
{
  void *v3;
  void *v4;

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_appLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)systemService:(id)a3 canActivateApplication:(id)a4 withResult:(id)a5
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a4;
  v6 = (void (**)(id, uint64_t))a5;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationWithBundleIdentifier:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v12 = 2;
    if (!v6)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (!v8)
  {
    v12 = 4;
    if (!v6)
      goto LABEL_11;
    goto LABEL_10;
  }
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "applicationIconForBundleIdentifier:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)SBApp, "isBundleIdentifierRestrictionDisabled:", v13) & 1) != 0
    || (objc_msgSend(v10, "isIconVisible:", v11) & 1) == 0)
  {
    v12 = 5;
  }
  else
  {
    v12 = 0;
  }

  if (v6)
LABEL_10:
    v6[2](v6, v12);
LABEL_11:

}

- (id)_parseShellArguments:(id)a3
{
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 1)
  {
    v6 = 0;
    v17 = *MEMORY[0x1E0DAB898];
    v18 = *MEMORY[0x1E0DAB868];
    v19 = *MEMORY[0x1E0DAB888];
    v7 = *MEMORY[0x1E0DAB8D8];
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lowercaseString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v6 + 1;
      objc_msgSend(v3, "objectAtIndex:", v6 + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("-grid")))
      {
        v12 = v4;
        v13 = v11;
        v14 = v7;
      }
      else
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("-launch")))
        {
          objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(","));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "bs_compactMap:", &__block_literal_global_436);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, v19);
          goto LABEL_9;
        }
        if (!objc_msgSend(v9, "isEqualToString:", CFSTR("-display")))
        {
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("-classicmode")))
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v17);
            v10 = v6 + 2;
          }
          goto LABEL_9;
        }
        v12 = v4;
        v13 = v11;
        v14 = v18;
      }
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v14);
LABEL_9:

      v6 = v10 + 1;
    }
    while (v10 + 1 < (unint64_t)(objc_msgSend(v3, "count") - 1));
  }

  return v4;
}

id __40__SBMainWorkspace__parseShellArguments___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3500];
  v3 = a2;
  objc_msgSend(v2, "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __93__SBMainWorkspace__updateActivationSettings_forRequestWithOptions_clientProcess_application___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sceneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v15;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "applicationWithBundleIdentifier:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)a1[5];
    v8 = a1[6];
    v9 = a1[7];
    v15 = 0;
    objc_msgSend(v7, "_validateRequestToOpenApplication:options:origin:error:", v4, v8, v9, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v15;
    if (!v10)
      (*(void (**)(void))(a1[8] + 16))();

  }
  else
  {
    v12 = a1[8];
    FBSOpenApplicationErrorCreate();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
    v10 = 0;
  }
  return v10;
}

void __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_506(uint64_t a1, int a2)
{
  uint64_t v3;
  id v4;

  if (a2)
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x1E0D22DA8]);
    objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x1E0D22D88]);
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("__SBWorkspaceOpenOptionUnlockResult"));
    objc_msgSend(*(id *)(a1 + 40), "_handleOpenApplicationRequest:options:activationSettings:origin:withResult:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 72);
    FBSOpenApplicationErrorCreate();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }

}

void __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_522(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isDeviceApplicationSceneEntity"))
  {
    v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("SBWorkspaceOpenApplicationResolvedWebClipSceneEntityKey"));
    objc_msgSend(*(id *)(a1 + 40), "_handleOpenApplicationRequest:options:activationSettings:origin:withResult:", *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80));
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 80);
    FBSOpenApplicationErrorCreate();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }

}

void __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_534(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogWidgets();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412802;
    v10 = v8;
    v11 = 1024;
    v12 = a2;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEBUG, "launchExtensionWithBundleID: %@ completed with success=%d error: %@", (uint8_t *)&v9, 0x1Cu);
  }

  if (a2)
    v7 = 0;
  else
    v7 = v5;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7);

}

id __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_537(_QWORD *a1, uint64_t a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = +[SBDeviceApplicationSceneEntity newEntityWithApplication:sceneHandleProvider:displayIdentity:](SBDeviceApplicationSceneEntity, "newEntityWithApplication:sceneHandleProvider:displayIdentity:", a2, a1[4], a1[5]);
  if ((objc_msgSend(v5, "supportsLayoutRole:", a3) & 1) == 0)
  {
    v6 = a1[6];
    objc_msgSend(v5, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBLayoutRoleDescription(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    FBSOpenApplicationErrorCreate();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);

  }
  return v5;
}

uint64_t __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_2_543(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "execute");
}

void __94__SBMainWorkspace__handleOpenApplicationRequest_options_activationSettings_origin_withResult___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 88))
  {
    v5 = *(unsigned __int8 *)(a1 + 89);
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "bs_safeAddObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "bs_safeAddObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "bs_safeAddObject:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v6, "bs_safeAddObject:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v6, "addObjectsFromArray:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v4, "setEntities:withPolicy:centerEntity:floatingEntity:", v6, v5, 0, 0);
    v7 = *(void **)(a1 + 72);
    if (v7)
    {
      v18 = a1;
      objc_msgSend(v7, "layoutRoleToLayoutAttributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v4, "entities");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (objc_msgSend(v14, "isApplicationSceneEntity"))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "layoutRole"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKey:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
                objc_msgSend(v4, "setRequestedLayoutAttributes:forEntity:", v16, v14);

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v11);
      }

      a1 = v18;
    }
    if (*(_BYTE *)(a1 + 90) || *(_BYTE *)(a1 + 89))
    {
      v17 = *(_QWORD *)(a1 + 32);
      if (!v17)
      {
        v17 = *(_QWORD *)(a1 + 40);
        if (!v17)
        {
          v17 = *(_QWORD *)(a1 + 48);
          if (!v17)
            v17 = *(_QWORD *)(a1 + 56);
        }
      }
      objc_msgSend(v4, "_setRequestedFrontmostEntity:", v17);
    }

  }
  else
  {
    objc_msgSend(v3, "setEntity:forLayoutRole:", *(_QWORD *)(a1 + 32), 1);
    objc_msgSend(v4, "setEntity:forLayoutRole:", *(_QWORD *)(a1 + 40), 2);
    objc_msgSend(v4, "setEntity:forLayoutRole:", *(_QWORD *)(a1 + 48), 3);
    objc_msgSend(v4, "setEntity:forLayoutRole:", *(_QWORD *)(a1 + 56), 4);
  }
  objc_msgSend(v4, "setRequestedSpaceConfiguration:", *(_QWORD *)(a1 + 80));

}

- (BOOL)isApplicationRunningAsViewService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  int v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "processState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isRunning") & 1) == 0)
  {

    goto LABEL_13;
  }
  objc_msgSend(v3, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasViewServicesEntitlement");

  if (!v6)
  {
LABEL_13:
    v18 = 0;
    goto LABEL_16;
  }
  _SBApplicationStateGetMonitor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationInfoForApplication:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D00918], 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    v14 = *MEMORY[0x1E0D00910];
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "objectForKey:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "unsignedIntValue");

        if (v17 == 9)
        {
          v18 = 1;
          goto LABEL_15;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v12)
        continue;
      break;
    }
  }
  v18 = 0;
LABEL_15:

LABEL_16:
  return v18;
}

uint64_t __104__SBMainWorkspace__handleTrustedOpenRequestForApplication_options_activationSettings_origin_withResult___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleOpenApplicationRequest:options:activationSettings:origin:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_handleUntrustedOpenRequestForApplication:(id)a3 options:(id)a4 activationSettings:(id)a5 origin:(id)a6 withResult:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("result"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBMainWorkspace _handleUntrustedOpenRequestForApplication:options:activationSettings:origin:withResult:].cold.1();
LABEL_9:
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D06919B4);
  }
  v17 = v16;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("settings"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBMainWorkspace _handleUntrustedOpenRequestForApplication:options:activationSettings:origin:withResult:].cold.2();
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FBSystemService-UntrustedRequest: %@"), v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspace eventQueue](self, "eventQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0D229B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __106__SBMainWorkspace__handleUntrustedOpenRequestForApplication_options_activationSettings_origin_withResult___block_invoke;
  v28[3] = &unk_1E8E9F720;
  v28[4] = self;
  v29 = v12;
  v30 = v13;
  v31 = v14;
  v32 = v15;
  v33 = v17;
  v21 = v17;
  v22 = v15;
  v23 = v14;
  v24 = v13;
  v25 = v12;
  objc_msgSend(v20, "eventWithName:handler:", v18, v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "executeOrAppendEvent:", v26);

}

uint64_t __106__SBMainWorkspace__handleUntrustedOpenRequestForApplication_options_activationSettings_origin_withResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUserActionRequest:options:activationSettings:origin:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

void __89__SBMainWorkspace__handleUserActionRequest_options_activationSettings_origin_withResult___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  id v4;

  if (a2)
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x1E0D22DA8]);
    objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x1E0D22D88]);
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("__SBWorkspaceOpenOptionUnlockResult"));
    objc_msgSend(*(id *)(a1 + 40), "_handleUserActionRequest:options:activationSettings:origin:withResult:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 72);
    FBSOpenApplicationErrorCreate();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }

}

void __89__SBMainWorkspace__handleUserActionRequest_options_activationSettings_origin_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setOriginatingProcess:", v3);
  objc_msgSend(v4, "setSource:", 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __89__SBMainWorkspace__handleUserActionRequest_options_activationSettings_origin_withResult___block_invoke_3;
  v5[3] = &unk_1E8E9F748;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "modifyApplicationContext:", v5);

}

void __89__SBMainWorkspace__handleUserActionRequest_options_activationSettings_origin_withResult___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  SBDeviceApplicationSceneEntity *v4;

  v3 = a2;
  v4 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", a1[4]);
  -[SBWorkspaceEntity applyActivationSettings:](v4, "applyActivationSettings:", a1[5]);
  -[SBWorkspaceEntity setObject:forActivationSetting:](v4, "setObject:forActivationSetting:", &unk_1E91CFF18, 30);
  objc_msgSend(v3, "setResultBlock:", a1[6]);
  objc_msgSend(v3, "setEntity:forLayoutRole:", v4, 1);

}

- (BOOL)_canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin:(id)a3 givenOrigin:(id)a4 trustedRequest:(BOOL)a5 outReason:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  int v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  char v20;
  BOOL v21;
  unsigned __int8 v22;
  void *v23;
  char v24;
  char v25;
  char v26;
  void *v27;
  unsigned __int8 v28;
  _QWORD v30[5];

  v9 = a3;
  v10 = a4;
  objc_msgSend((id)SBApp, "authenticationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isAuthenticated");

  if (v12)
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __117__SBMainWorkspace__canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin_givenOrigin_trustedRequest_outReason___block_invoke;
    v30[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
    v30[4] = a6;
    v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v30);
    objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "processForPID:", objc_msgSend(v9, "pid"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "isApplicationProcess"))
      v16 = v15;
    else
      v16 = 0;
    objc_msgSend(v16, "applicationInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasViewServicesEntitlement");

    LODWORD(v17) = getpid();
    v19 = objc_msgSend(v9, "pid");
    v20 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DAB818]);
    v21 = (_DWORD)v17 == v19 || a5;
    v22 = v21 | v20 | v18;
    if (SBSpotlightIsVisible())
    {
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isUILocked");

      v25 = v24 ^ 1;
    }
    else
    {
      v25 = 1;
    }
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "screenIsOn");

    if (((v28 ^ 1 | v25 | v22 ^ 1) & 1) == 0)
      ((void (**)(_QWORD, const __CFString *))v13)[2](v13, CFSTR("lock-screen Spotlight is visible"));
    v26 = (v28 ^ 1 | v25 | v22 ^ 1) ^ 1;

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

_QWORD **__117__SBMainWorkspace__canImplicitlyUnlockAtLockScreenWhileAuthenticatedFromOrigin_givenOrigin_trustedRequest_outReason___block_invoke(_QWORD **result, id a2)
{
  _QWORD **v2;

  if (result[4])
  {
    v2 = result;
    result = (_QWORD **)objc_retainAutorelease(a2);
    *v2[4] = result;
  }
  return result;
}

- (void)_attemptUnlockToApplication:(id)a3 showPasscode:(BOOL)a4 origin:(id)a5 givenOrigin:(id)a6 options:(id)a7 completion:(id)a8
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  int CanLaunchWhilePasscodeLocked;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  char v27;
  void *v28;
  int v29;
  void *v30;
  char v31;
  char v32;
  int v33;
  char v34;
  void *v35;
  char v36;
  char v37;
  void *v38;
  int v39;
  unsigned int v40;
  uint64_t v41;
  int v42;
  id v43;
  SBLockScreenUnlockRequest *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  int v53;
  void *v54;
  uint64_t v55;
  id v56;
  char v57;
  int CanResumeWhilePasscodeLocked;
  char CanLaunchWhilePasscodeLockedIfSecureLaunchRequested;
  void *v60;
  int v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;

  v62 = a4;
  v67 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = SBApp;
  v16 = a8;
  objc_msgSend((id)v15, "authenticationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_msgSend(v17, "hasAuthenticatedAtLeastOnceSinceBoot");

  v65 = v12;
  v56 = v16;
  if ((v15 & 1) != 0)
  {
    CanLaunchWhilePasscodeLocked = SBWorkspaceApplicationCanLaunchWhilePasscodeLocked(v67);
    CanResumeWhilePasscodeLocked = SBWorkspaceApplicationCanResumeWhilePasscodeLocked(v67);
    CanLaunchWhilePasscodeLockedIfSecureLaunchRequested = SBWorkspaceApplicationCanLaunchWhilePasscodeLockedIfSecureLaunchRequested(v67);
  }
  else
  {
    CanResumeWhilePasscodeLocked = SBWorkspaceApplicationCanResumeWhilePasscodeLocked(v67);
    CanLaunchWhilePasscodeLockedIfSecureLaunchRequested = 0;
    CanLaunchWhilePasscodeLocked = 0;
  }
  objc_msgSend(v14, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB890], objc_opt_class());
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v64, "isEqualToString:", *MEMORY[0x1E0DAB7F8]);
  objc_msgSend(v14, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D44650], objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "secureAppViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "applicationSceneHandle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "application");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D145D0]);
  v55 = *MEMORY[0x1E0CD0868];
  v61 = objc_msgSend(v13, "isEqualToString:");
  v26 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CF78D8]);
  v27 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAB800]);
  v66 = v14;
  objc_msgSend(v14, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0DAB768], objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v20;
  if (objc_msgSend(v28, "BOOLValue"))
  {
    objc_msgSend(v67, "bundleIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.InCallService"));

  }
  else
  {
    v31 = 0;
  }
  v60 = v13;

  v32 = CanLaunchWhilePasscodeLocked | CanResumeWhilePasscodeLocked;
  v63 = v24;
  if ((CanLaunchWhilePasscodeLocked | CanResumeWhilePasscodeLocked) == 1)
  {
    v33 = v26;
    if (((objc_msgSend(v24, "isEqual:", v67) ^ 1 | v25) & 1) != 0)
      v34 = 0;
    else
      v34 = (v26 | v27) ^ 1;
  }
  else
  {
    v33 = v26;
    v34 = 0;
  }
  objc_msgSend(v66, "bs_safeObjectForKey:ofType:", *MEMORY[0x1E0D44648], objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "BOOLValue");

  v37 = v36 & CanLaunchWhilePasscodeLocked;
  if (v25)
  {
    objc_msgSend(v67, "bundleIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("com.apple.camera")) & (v29 ^ 1);

  }
  else
  {
    LOBYTE(v39) = 0;
  }
  if (v62)
    v40 = 3;
  else
    v40 = 1;
  if (v34 & 1 | ((((v32 | CanLaunchWhilePasscodeLockedIfSecureLaunchRequested & v57) | v29) & 1) == 0) | ((v31 | v37) | v39) & 1)
    v41 = v40;
  else
    v41 = 0;
  v42 = objc_msgSend(v65, "pid");
  if (v42 == getpid())
    v43 = 0;
  else
    v43 = v65;
  v44 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setSource:](v44, "setSource:", 18);
  if (v25)
    -[SBLockScreenUnlockRequest setSource:](v44, "setSource:", 26);
  if (v33)
    -[SBLockScreenUnlockRequest setSource:](v44, "setSource:", 13);
  -[SBLockScreenUnlockRequest setIntent:](v44, "setIntent:", v41);
  v45 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v67, "bundleIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "stringWithFormat:", CFSTR("SBWorkspaceRequest: Open \"%@\"), v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenUnlockRequest setName:](v44, "setName:", v47);

  -[SBLockScreenUnlockRequest setProcess:](v44, "setProcess:", v43);
  if ((v31 & 1) == 0)
    -[SBLockScreenUnlockRequest setDestinationApplication:](v44, "setDestinationApplication:", v67);
  -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v44, "setWantsBiometricPresentation:", 1);
  if (v61)
    -[SBLockScreenUnlockRequest setForceAlertAuthenticationUI:](v44, "setForceAlertAuthenticationUI:", 1);
  v48 = *MEMORY[0x1E0DAB858];
  objc_msgSend(v66, "objectForKey:", *MEMORY[0x1E0DAB858]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
  {
    objc_msgSend(v66, "objectForKeyedSubscript:", v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenUnlockRequest setConfirmedNotInPocket:](v44, "setConfirmedNotInPocket:", objc_msgSend(v50, "BOOLValue"));

    v51 = v56;
  }
  else
  {
    v52 = objc_msgSend(v60, "isEqualToString:", v55);
    v53 = objc_msgSend(v60, "isEqualToString:", *MEMORY[0x1E0DAB818]);
    v51 = v56;
    if ((v52 & 1) != 0 || v53)
      -[SBLockScreenUnlockRequest setConfirmedNotInPocket:](v44, "setConfirmedNotInPocket:", 1);
  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "unlockWithRequest:completion:", v44, v51);

}

- (void)systemService:(id)a3 isPasscodeLockedOrBlockedWithResult:(id)a4
{
  void *v5;
  id v6;
  id v7;

  if (a4)
  {
    v5 = (void *)SBApp;
    v6 = a4;
    objc_msgSend(v5, "lockOutController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t))a4 + 2))(v6, objc_msgSend(v7, "isLockedOut"));

  }
}

- (void)systemService:(id)a3 handleActions:(id)a4 origin:(id)a5 withResult:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[SBWorkspace eventQueue](self, "eventQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D229B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __65__SBMainWorkspace_systemService_handleActions_origin_withResult___block_invoke;
  v18[3] = &unk_1E8E9F7B8;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v14 = v11;
  v15 = v10;
  v16 = v9;
  objc_msgSend(v13, "eventWithName:handler:", CFSTR("FBSystemService-HandleActions"), v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeOrAppendEvent:", v17);

}

void __65__SBMainWorkspace_systemService_handleActions_origin_withResult___block_invoke(_QWORD *a1)
{
  id v2;

  +[SBActionHandler sharedInstance](SBActionHandler, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleActions:origin:withResult:", a1[4], a1[5], a1[6]);

}

- (void)systemServicePrepareForExit:(id)a3 andRelaunch:(BOOL)a4
{
  id v4;

  objc_msgSend((id)SBApp, "restartManager", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_exitIsImminent");

}

- (void)systemService:(id)a3 prepareForShutdownWithOptions:(id)a4 origin:(id)a5
{
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  dispatch_semaphore_t v11;

  if (objc_msgSend(a4, "isUserInitiated", a3))
  {
    v5 = dispatch_semaphore_create(0);
    objc_msgSend((id)SBApp, "restartManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__SBMainWorkspace_systemService_prepareForShutdownWithOptions_origin___block_invoke;
    v10[3] = &unk_1E8E9DED8;
    v11 = v5;
    v7 = v5;
    objc_msgSend(v6, "_playShutdownSound:", v10);

    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend((id)SBApp, "restartManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_exitIsImminent");

  }
  else
  {
    objc_msgSend((id)SBApp, "restartManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_exitIsImminent");

  }
}

intptr_t __70__SBMainWorkspace_systemService_prepareForShutdownWithOptions_origin___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)backlightController:(id)a3 didAnimateBacklightToFactor:(float)a4 source:(int64_t)a5
{
  void *v5;
  void *v6;
  id v7;

  +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance", a3, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusArbitrationReason backlightControllerDidAnimate](SBKeyboardFocusArbitrationReason, "backlightControllerDidAnimate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "annotatedWithSourceName:", CFSTR("SBWorkspace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestArbitrationForSBWindowScene:forReason:", 0, v6);

}

- (void)watchdogFired:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t *p_currentTransaction;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (BSIsBeingDebugged())
  {
    SBLogTransaction();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "Ignoring transaction watchdog while FrontBoard is being debugged.";
LABEL_7:
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }
  else
  {
    p_currentTransaction = (uint64_t *)&self->_currentTransaction;
    if ((-[SBWorkspaceTransaction isComplete](self->_currentTransaction, "isComplete") & 1) != 0)
    {
      SBLogTransaction();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v5 = "Ignoring transaction watchdog because the transaction is complete.";
        goto LABEL_7;
      }
    }
    else
    {
      v7 = (void *)*p_currentTransaction;
      v12 = 0;
      v8 = objc_msgSend(v7, "shouldWatchdog:", &v12);
      v4 = v12;
      if (v8)
      {
        SBLogTransactionVerbose();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);

        if (v10)
        {
          SBLogTransactionVerbose();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
            -[SBMainWorkspace watchdogFired:].cold.1(p_currentTransaction, v11);
        }
        else
        {
          SBLogTransaction();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
            -[SBMainWorkspace watchdogFired:].cold.2();
        }
      }
      else
      {
        SBLogTransaction();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v4;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "Ignoring transaction watchdog for reason: %@", buf, 0xCu);
        }
      }

    }
  }

}

- (id)currentStatusBarSettingsForTransientOverlayScenePresenter:(id)a3
{
  void *v3;
  id v4;
  SBMutableStatusBarSettings *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  double v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = objc_alloc_init(SBMutableStatusBarSettings);
  objc_msgSend(v4, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "statusBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "assertionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isFrontmostStatusBarHidden");
  if ((v10 & 1) != 0)
  {
    v11 = 0.0;
  }
  else
  {
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v3, "screenIsOn");
    v11 = 0.0;
    if (v12)
      v11 = 1.0;
  }
  objc_msgSend(v8, "numberWithDouble:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMutableStatusBarSettings setAlpha:](v5, "setAlpha:", v13);

  if ((v10 & 1) == 0)
  objc_msgSend(v7, "frontmostStatusBarStyleRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEADE8], "sharedInstanceForStyle:", objc_msgSend(v14, "legibilityStyle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBMutableStatusBarSettings setLegibilitySettings:](v5, "setLegibilitySettings:", v15);

  -[SBMutableStatusBarSettings setStyle:](v5, "setStyle:", objc_msgSend(v14, "style"));
  return v5;
}

- (id)transientOverlayScenePresenter:(id)a3 acquireHideAppStatusBarAssertionWithReason:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a5;
  v7 = a4;
  objc_msgSend(a3, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "switcherController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestInAppStatusBarHiddenAssertionForReason:animated:", v7, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)defaultPreferredInterfaceOrientationForPresentationForTransientOverlayScenePresenter:(id)a3
{
  return objc_msgSend((id)SBApp, "activeInterfaceOrientation", a3);
}

- (BOOL)defaultShouldAutorotateForTransientOverlayScenePresenter:(id)a3
{
  return objc_msgSend((id)SBApp, "homeScreenRotationStyle", a3) != 0;
}

- (BOOL)isKeyboardVisibleForSpringBoardForTransientOverlayScenePresenter:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "medusaHostedKeyboardWindowController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isKeyboardVisibleForSpringBoard");

  return v5;
}

- (unint64_t)defaultSupportedInterfaceOrientationsForTransientOverlayScenePresenter:(id)a3
{
  unint64_t v3;
  void *v4;

  if (!objc_msgSend((id)SBApp, "homeScreenRotationStyle", a3))
    return 2;
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
      return 30;
    else
      return 26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceIdiom") == 1)
      v3 = 30;
    else
      v3 = 26;

  }
  return v3;
}

- (void)transientOverlayScenePresenterRequestsAppIconForceTouchDismissal:(id)a3 animated:(BOOL)a4
{
  id v4;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissAppIconForceTouchControllers:", 0);

}

- (id)transientOverlayScenePresenter:(id)a3 acquireDisableAutoUnlockAssertionWithReason:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a4;
  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "biometricAuthenticationCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "acquireDisableAutoUnlockAssertionForReason:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)transientOverlayScenePresenter:(id)a3 acquireProximitySensorEnabledAssertionWithReason:(id)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a4;
  objc_msgSend((id)SBApp, "proximitySensorManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "client:wantsProximityDetectionEnabled:", v4, 1);

  v6 = objc_alloc(MEMORY[0x1E0D01868]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __99__SBMainWorkspace_transientOverlayScenePresenter_acquireProximitySensorEnabledAssertionWithReason___block_invoke;
  v10[3] = &unk_1E8E9DCD8;
  v11 = v4;
  v7 = v4;
  v8 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("transientOverlayScenePresenterProximitySensorEnabledAssertion"), v7, v10);

  return v8;
}

void __99__SBMainWorkspace_transientOverlayScenePresenter_acquireProximitySensorEnabledAssertionWithReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)SBApp, "proximitySensorManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "client:wantsProximityDetectionEnabled:", *(_QWORD *)(a1 + 32), 0);

}

- (id)transientOverlayScenePresenter:(id)a3 acquireInteractiveScreenshotGestureDisabledAssertionWithReason:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)SBApp;
  v5 = a4;
  objc_msgSend(v4, "interactiveScreenshotGestureManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "acquireDisableGestureAssertionWithReason:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)bannerLongLookPresentationObservationTokenForTransientOverlayScenePresenter:(id)a3
{
  id v3;
  SBNotificationLongLookBannerPresentationObservationToken *v4;
  void *v5;
  void *v6;
  void *v7;
  SBNotificationLongLookBannerPresentationObservationToken *v8;

  v3 = a3;
  v4 = [SBNotificationLongLookBannerPresentationObservationToken alloc];
  objc_msgSend((id)SBApp, "notificationDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bannerDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SBNotificationLongLookBannerPresentationObservationToken initWithNotificationBannerDestination:scene:](v4, "initWithNotificationBannerDestination:scene:", v6, v7);
  return v8;
}

- (id)transientOverlayScenePresenter:(id)a3 acquireBannerLongLookWindowLevelAssertionWithReason:(id)a4 windowLevel:(double)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = (void *)SBApp;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "bannerManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "acquireWindowLevelAssertionWithPriority:windowLevel:windowScene:reason:", 0, v11, v8, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)controlCenterPresentationObservationTokenForTransientOverlayScenePresenter:(id)a3
{
  id v3;
  SBControlCenterPresentationObservationToken *v4;
  void *v5;
  void *v6;
  SBControlCenterPresentationObservationToken *v7;

  v3 = a3;
  v4 = [SBControlCenterPresentationObservationToken alloc];
  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBControlCenterPresentationObservationToken initWithControlCenterController:scene:](v4, "initWithControlCenterController:scene:", v5, v6);
  return v7;
}

- (id)transientOverlayScenePresenter:(id)a3 acquireControlCenterWindowLevelAssertionWithReason:(id)a4 windowLevel:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "acquireWindowLevelAssertionWithPriority:windowLevel:windowScene:reason:", 0, v10, v7, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)transientOverlayScenePresenterRequestsControlCenterDismissal:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissAnimated:", v4);

}

- (id)transientOverlayScenePresenter:(id)a3 acquireDeviceOrientationUpdateDeferralAssertionWithReason:(id)a4
{
  return (id)objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", a4);
}

- (id)siriPresentationObservationTokenForTransientOverlayScenePresenter:(id)a3
{
  id v3;
  SBAssistantPresentationObservationToken *v4;
  void *v5;
  void *v6;
  SBAssistantPresentationObservationToken *v7;

  v3 = a3;
  v4 = [SBAssistantPresentationObservationToken alloc];
  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBAssistantPresentationObservationToken initWithAssistantController:scene:](v4, "initWithAssistantController:scene:", v5, v6);
  return v7;
}

- (id)transientOverlayScenePresenter:(id)a3 acquireWallpaperAnimationSuspensionAssertionWithReason:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a4;
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suspendWallpaperAnimationForReason:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)transientOverlayScenePresenter:(id)a3 acquireSiriWindowLevelAssertionWithReason:(id)a4 windowLevel:(double)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "acquireWindowLevelAssertionWithPriority:windowLevel:windowScene:reason:", 0, v10, v7, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)transientOverlayScenePresenterRequestsSiriDismissal:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v5;

  v4 = a4;
  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissAssistantViewInEverySceneIfNecessaryWithAnimation:", v4);

}

- (id)transientOverlayScenePresenter:(id)a3 newSceneDeactivationAssertionWithReason:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneDeactivationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newAssertionWithReason:", a4);

  return v7;
}

- (void)transientOverlayScenePresenter:(id)a3 didDismissViewController:(id)a4 wasTopmostPresentation:(BOOL)a5
{
  _BOOL4 v5;
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
  char v16;
  char v17;
  char v18;
  void *v19;
  void *v20;
  id v21;

  v5 = a5;
  objc_msgSend(a3, "windowScene");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "pictureInPictureManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatePictureInPictureWindowLevels");

  v7 = v21;
  if (v5)
  {
    objc_msgSend(v21, "switcherController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutStatePrimaryElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "workspaceEntity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationSceneEntity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sceneHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lockScreenEnvironment");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "backlightController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isInScreenOffMode");

    if (v21)
      v17 = objc_msgSend(v21, "isMainDisplayWindowScene") ^ 1;
    else
      v17 = 0;
    if (v12)
      v18 = 1;
    else
      v18 = v16;
    if ((v18 & 1) == 0 && (v17 & 1) == 0)
    {
      +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "resetIdleTimerForReason:", CFSTR("TransientOverlayDismissed"));

    }
    +[SBMainStatusBarStateProvider sharedInstance](SBMainStatusBarStateProvider, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateTimeEnabledImmediately:", 1);

    v7 = v21;
  }

}

- (void)transientOverlayScenePresenter:(id)a3 preferredWhitePointAdaptivityStyleDidChangeWithAnimationSettings:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  +[SBSceneLayoutWhitePointAdaptationController sharedInstance](SBSceneLayoutWhitePointAdaptationController, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWhitePointAdaptationStrengthWithAnimationSettings:", v4);

}

- (void)transientOverlayScenePresenter:(id)a3 registerCoverSheetExternalBehaviorProvider:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a4;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coverSheetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerExternalBehaviorProvider:", v4);

}

- (void)transientOverlayScenePresenter:(id)a3 unregisterCoverSheetExternalBehaviorProvider:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a4;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coverSheetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterExternalBehaviorProvider:", v4);

}

- (void)transientOverlayScenePresenter:(id)a3 willChangeTopmostViewControllerInterfaceOrientationToOrientation:(int64_t)a4
{
  objc_msgSend((id)SBApp, "noteMainTransientOverlayPresentationManagerWillChangeToInterfaceOrientation:", a4);
}

- (void)transientOverlayScenePresenter:(id)a3 willPresentViewController:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
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
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "windowScene");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("transient overlay presenter has unknown windowScene"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBMainWorkspace transientOverlayScenePresenter:willPresentViewController:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D069375CLL);
  }
  v8 = (void *)v7;
  +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sbWindowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusArbitrationReason willPresentTransientOverlayScene](SBKeyboardFocusArbitrationReason, "willPresentTransientOverlayScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestArbitrationForSBWindowScene:forReason:", v10, v11);

  objc_msgSend((id)SBApp, "frontDisplayDidChange:", v6);
  objc_msgSend(v8, "pictureInPictureManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updatePictureInPictureWindowLevels");

  +[SBMainStatusBarStateProvider sharedInstance](SBMainStatusBarStateProvider, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateTimeEnabled");

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "noteTransientOverlayPresented");

  if ((objc_msgSend(v8, "isContinuityDisplayWindowScene") & 1) == 0)
  {
    objc_msgSend(v8, "lockScreenManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
    v19[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unlockUIFromSource:withOptions:", 9, v16);

  }
}

- (BOOL)transientOverlayScenePresenter:(id)a3 shouldResignFirstResponderForKeyWindow:(id)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  char v27;

  v4 = a4;
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coverSheetWindow");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v4)
  {
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isVisible");

    if ((v8 & 1) != 0)
      goto LABEL_10;
  }
  else
  {

  }
  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v4)
  {
    +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isVisible");

    if ((v12 & 1) != 0)
      goto LABEL_10;
  }
  else
  {

  }
  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_controlCenterWindow");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v14 != v4)
  {

    goto LABEL_11;
  }
  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isVisible");

  if ((v16 & 1) == 0)
  {
LABEL_11:
    objc_msgSend((id)SBApp, "notificationDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bannerDestination");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)SBApp, "bannerManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowScene");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    v23 = v21;
    if (v22)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v24 = v23;
      else
        v24 = 0;
    }
    else
    {
      v24 = 0;
    }
    v25 = v24;

    objc_msgSend(v20, "bannerWindowInWindowScene:", v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    if (v26 == v4)
    {
      v27 = objc_msgSend(v19, "isPresentingBannerInLongLook");

      if ((v27 & 1) != 0)
      {
        v17 = 1;
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {

    }
    v17 = 0;
    goto LABEL_21;
  }
LABEL_10:
  v17 = 1;
LABEL_22:

  return v17;
}

- (BOOL)transientOverlayScenePresenter:(id)a3 shouldRestoreFirstResponderForKeyWindow:(id)a4
{
  return 1;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  -[SBMainWorkspace _updateMedusaCapabilitySendingNotification:](self, "_updateMedusaCapabilitySendingNotification:", 1, a4);
}

- (void)registerHandler:(id)a3 forExtensionPoint:(id)a4
{
  id v6;
  NSMutableDictionary *extensionHandlersByType;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11 && objc_msgSend(v6, "length"))
  {
    extensionHandlersByType = self->_extensionHandlersByType;
    if (!extensionHandlersByType)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_extensionHandlersByType;
      self->_extensionHandlersByType = v8;

      extensionHandlersByType = self->_extensionHandlersByType;
    }
    -[NSMutableDictionary objectForKey:](extensionHandlersByType, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 && (objc_opt_respondsToSelector() & 1) != 0)
      -[NSMutableDictionary setObject:forKey:](self->_extensionHandlersByType, "setObject:forKey:", v11, v6);
  }

}

- (void)unregisterHandler:(id)a3 forExtensionPoint:(id)a4
{
  -[NSMutableDictionary removeObjectForKey:](self->_extensionHandlersByType, "removeObjectForKey:", a4);
}

- (id)_handlerForExtensionPoint:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_extensionHandlersByType, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  void (**v4)(_QWORD);
  NSObject *v5;
  uint8_t v6[16];

  v4 = (void (**)(_QWORD))a4;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Got kIOMessageSystemWillSleep", v6, 2u);
  }

  _SBWorkspaceUpdateBatteryUsageTime(0);
  __SBWIsSleeping = 1;
  _SBWorkspaceNoteSleepOrWake(0);
  v4[2](v4);

}

- (void)systemSleepMonitorSleepRequestAborted:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Got kIOMessageSystemWillNotSleep", v5, 2u);
  }

  -[SBMainWorkspace _noteDidWakeFromSleep](self, "_noteDidWakeFromSleep");
}

- (void)systemSleepMonitorWillWakeFromSleep:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Got kIOMessageSystemWillPowerOn", v4, 2u);
  }

}

- (void)systemSleepMonitorDidWakeFromSleep:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Got kIOMessageSystemHasPoweredOn", v5, 2u);
  }

  -[SBMainWorkspace _noteDidWakeFromSleep](self, "_noteDidWakeFromSleep");
}

- (BOOL)dismissAllTransientOverlayPresentationsAnimated:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__SBMainWorkspace_dismissAllTransientOverlayPresentationsAnimated___block_invoke;
  v4[3] = &__block_descriptor_33_e42_v16__0__SBMainWorkspaceTransitionRequest_8l;
  v5 = a3;
  return -[SBMainWorkspace requestTransitionWithOptions:builder:validator:](self, "requestTransitionWithOptions:builder:validator:", 0, v4, &__block_literal_global_620);
}

void __67__SBMainWorkspace_dismissAllTransientOverlayPresentationsAnimated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  char v5;

  v3 = a2;
  objc_msgSend(v3, "setEventLabelWithFormat:", CFSTR("DismissAllFromLock"));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__SBMainWorkspace_dismissAllTransientOverlayPresentationsAnimated___block_invoke_2;
  v4[3] = &__block_descriptor_33_e54_v16__0__SBWorkspaceTransientOverlayTransitionContext_8l;
  v5 = *(_BYTE *)(a1 + 32);
  objc_msgSend(v3, "modifyTransientOverlayContext:", v4);

}

void __67__SBMainWorkspace_dismissAllTransientOverlayPresentationsAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setTransitionType:", 1);
  objc_msgSend(v3, "setAnimated:", *(unsigned __int8 *)(a1 + 32));

}

uint64_t __67__SBMainWorkspace_dismissAllTransientOverlayPresentationsAnimated___block_invoke_3()
{
  return 1;
}

- (BOOL)dismissTransientOverlayViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  SBWorkspaceTransientOverlay *v10;
  void *v11;
  id v12;
  SBWorkspaceTransientOverlay *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  SBWorkspaceTransientOverlay *v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a5;
  v10 = -[SBWorkspaceTransientOverlay initWithViewController:]([SBWorkspaceTransientOverlay alloc], "initWithViewController:", v8);
  objc_msgSend(v8, "_fbsDisplayConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke;
  v16[3] = &unk_1E8E9F8C8;
  v17 = v8;
  v18 = v10;
  v20 = a4;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  LOBYTE(self) = -[SBMainWorkspace requestTransitionWithOptions:displayConfiguration:builder:validator:](self, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v11, v16, &__block_literal_global_624);

  return (char)self;
}

void __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  v3 = a2;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventLabelWithFormat:", CFSTR("DismissTransientOverlay = %@"), v5);

  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke_2;
  v10[3] = &unk_1E8E9F860;
  v11 = *(id *)(a1 + 40);
  v13 = *(_BYTE *)(a1 + 56);
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyTransientOverlayContext:", v10);
  objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_623);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke_4;
  v8[3] = &unk_1E8E9F1C0;
  v9 = *(id *)(a1 + 48);
  v7 = (id)objc_msgSend(v3, "addCompletionHandler:", v8);

}

void __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setTransitionType:", 1);
  objc_msgSend(v3, "setTransientOverlay:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setAnimated:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v3, "setShouldPreserveAppSwitcher:", objc_msgSend(*(id *)(a1 + 40), "preservesAppSwitcherDuringPresentationAndDismissal"));

}

uint64_t __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWaitsForSceneUpdates:", 0);
}

uint64_t __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __77__SBMainWorkspace_dismissTransientOverlayViewController_animated_completion___block_invoke_5()
{
  return 1;
}

- (BOOL)presentTransientOverlayViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  SBWorkspaceTransientOverlay *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  SBWorkspaceTransientOverlay *v17;
  id v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  SBWorkspaceTransientOverlay *v23;
  id v24;
  BOOL v25;

  v8 = a3;
  v9 = a5;
  v10 = -[SBWorkspaceTransientOverlay initWithViewController:]([SBWorkspaceTransientOverlay alloc], "initWithViewController:", v8);
  if (objc_msgSend(v8, "prefersContinuityDisplayPresentation")
    && +[SBContinuitySessionManager areContinuitySessionsAllowed](SBContinuitySessionManager, "areContinuitySessionsAllowed"))
  {
    +[SBContinuitySessionManager sharedInstance](SBContinuitySessionManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "state") == 10)
    {
      objc_msgSend(v12, "mainWindowScene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_fbsDisplayConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        goto LABEL_10;
    }
    else
    {

    }
  }
  if (!objc_msgSend(v8, "prefersEmbeddedDisplayPresentation")
    || (-[SBMainWorkspace mainWindowScene](self, "mainWindowScene"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v15, "_fbsDisplayConfiguration"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        !v14))
  {
    -[SBTransientOverlayPresentationManager defaultDisplayConfigurationForTransientOverlayPresentation](self->_transientOverlayPresentationManager, "defaultDisplayConfigurationForTransientOverlayPresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke;
  v21[3] = &unk_1E8E9F8C8;
  v22 = v8;
  v23 = v10;
  v25 = a4;
  v24 = v9;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v19 = -[SBMainWorkspace requestTransitionWithOptions:displayConfiguration:builder:validator:](self, "requestTransitionWithOptions:displayConfiguration:builder:validator:", 0, v14, v21, &__block_literal_global_628);

  return v19;
}

void __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;

  v3 = a2;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEventLabelWithFormat:", CFSTR("PresentTransientOverlay = %@"), v5);

  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke_2;
  v10[3] = &unk_1E8E9F860;
  v11 = *(id *)(a1 + 40);
  v13 = *(_BYTE *)(a1 + 56);
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyTransientOverlayContext:", v10);
  objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_627);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke_4;
  v8[3] = &unk_1E8E9F1C0;
  v9 = *(id *)(a1 + 48);
  v7 = (id)objc_msgSend(v3, "addCompletionHandler:", v8);

}

void __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setTransitionType:", 0);
  objc_msgSend(v3, "setTransientOverlay:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setAnimated:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(v3, "setShouldPreserveAppSwitcher:", objc_msgSend(*(id *)(a1 + 40), "preservesAppSwitcherDuringPresentationAndDismissal"));
  objc_msgSend(v3, "setShouldDismissSiriUponPresentation:", objc_msgSend(*(id *)(a1 + 40), "dismissesSiriForPresentation"));

}

uint64_t __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWaitsForSceneUpdates:", 0);
}

uint64_t __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __77__SBMainWorkspace_presentTransientOverlayViewController_animated_completion___block_invoke_5()
{
  return 1;
}

- (SBHardwareButtonZStackClient)zStackHardwareButtonClient
{
  return self->_zStackHardwareButtonClient;
}

- (SBInCallTransientOverlayManager)inCallTransientOverlayManager
{
  return self->_inCallTransientOverlayManager;
}

- (SBUniversalControlServer)universalControlServer
{
  return self->_universalControlServer;
}

- (SBKeyboardDismissalManager)keyboardDismissalManager
{
  return self->_keyboardDismissalManager;
}

- (SBSystemNotesManager)systemNotesManager
{
  return self->_systemNotesManager;
}

- (SBWindowScene)mainWindowScene
{
  return self->_mainWindowScene;
}

- (void)setMainWindowScene:(id)a3
{
  objc_storeStrong((id *)&self->_mainWindowScene, a3);
}

- (FBSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_pipCoordinator, 0);
  objc_storeStrong((id *)&self->_mainWindowScene, 0);
  objc_storeStrong((id *)&self->_inCallPresentationManager, 0);
  objc_storeStrong((id *)&self->_keyboardDismissalManager, 0);
  objc_storeStrong((id *)&self->_transientOverlayPresentationManager, 0);
  objc_storeStrong((id *)&self->_inCallTransientOverlayManager, 0);
  objc_storeStrong((id *)&self->_zStackHardwareButtonClient, 0);
  objc_storeStrong((id *)&self->_activeIdleTimerProvider, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigurationManager, 0);
  objc_storeStrong((id *)&self->_focusModesHomeScreenSnapshotManager, 0);
  objc_storeStrong((id *)&self->_systemNotesManager, 0);
  objc_storeStrong((id *)&self->_lockKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardFocusCoordinator, 0);
  objc_storeStrong((id *)&self->_universalControlServer, 0);
  objc_storeStrong((id *)&self->_ocelotRepairRequests, 0);
  objc_storeStrong((id *)&self->_presentedControlCenterModuleTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_powerDownLongPressDurationAssertion, 0);
  objc_storeStrong((id *)&self->_powerDownViewController, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_activeSuspendedWorkspaceTransitions, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_extensionHandlersByType, 0);
  objc_storeStrong((id *)&self->_transactionWatchdog, 0);
  objc_storeStrong((id *)&self->_currentTransactionLock, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_displayLayoutTransitionAssertion, 0);
  objc_storeStrong((id *)&self->_orientationAggdLogger, 0);
  objc_storeStrong((id *)&self->_suspensionLock, 0);
}

- (void)createRequestWithOptions:displayConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Using workspace transition option \"do not dismiss Siri\" because no Siri dismissal option was specified and SAE is enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)createRequestWithOptions:displayConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "Using workspace transition option \"dismiss Siri\" because no Siri dismissal option was specified and SAE is disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_transactionForTransitionRequest:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_12();
  objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "transitionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v3, v4, "Prepared %{public}@ for transition request:\n%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_20();
}

- (void)_canExecuteTransitionRequest:(void *)a1 forExecution:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "Application scene '%{public}@' cannot be launched because it has been uninstalled.", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)_canExecuteTransitionRequest:(void *)a1 forExecution:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "Application scene '%{public}@' cannot be launched because it has outstanding termination assertions.", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)setCurrentTransaction:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_12();
  objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "transitionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v3, v4, "Running %{public}@ for transition request:\n%{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_20();
}

- (void)_preflightTransitionRequest:(_QWORD *)a3 forExecution:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1D0540000, a4, OS_LOG_TYPE_ERROR, "Attempted to launch an untrusted application scene %{public}@", a1, 0xCu);

}

void __57__SBMainWorkspace_applicationProcessDidExit_withContext___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "An application that SpringBoard is not tracking with bundle identifier %{public}@ just exited.", v5);

  OUTLINED_FUNCTION_2_2();
}

- (void)_updateActivationSettings:forRequestWithOptions:clientProcess:application:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_handleOpenApplicationRequest:options:activationSettings:origin:withResult:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_handleOpenApplicationRequest:options:activationSettings:origin:withResult:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, v0, v1, "Trying to launch an app clip, but no webClipIdentifier found. Falling back to default application launch path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_handleTrustedOpenRequestForApplication:(uint64_t)a1 options:activationSettings:origin:withResult:.cold.3(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  __int16 v5;
  const __CFString *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBMainWorkspace _handleTrustedOpenRequestForApplication:options:activationSettings:origin:withResult:]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138544130;
  v4 = v2;
  v5 = 2114;
  v6 = CFSTR("SBWorkspace.m");
  v7 = 1024;
  v8 = 5265;
  v9 = 2114;
  v10 = a1;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", (uint8_t *)&v3, 0x26u);

}

- (void)_handleUntrustedOpenRequestForApplication:options:activationSettings:origin:withResult:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_handleUntrustedOpenRequestForApplication:options:activationSettings:origin:withResult:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_handleUserActionRequest:options:activationSettings:origin:withResult:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_handleUserActionRequest:options:activationSettings:origin:withResult:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)watchdogFired:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_fault_impl(&dword_1D0540000, a2, OS_LOG_TYPE_FAULT, "Transaction watchdog fired: %{public}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)watchdogFired:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_fault_impl(&dword_1D0540000, v0, OS_LOG_TYPE_FAULT, "Transaction watchdog fired. Asking for state capture info.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)transactionDidComplete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "Root transaction failed: %{public}@. Attempting to force us back to SB...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)transactionDidComplete:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, v0, v1, "Root transaction complete: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)transientOverlayScenePresenter:willPresentViewController:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
