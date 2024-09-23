@implementation SBRestartManager

- (BOOL)isPendingExit
{
  BSDispatchQueueAssertMain();
  return -[SBRestartManager _isPendingExitIncludingExternallyControlledReasons:](self, "_isPendingExitIncludingExternallyControlledReasons:", 1);
}

- (BOOL)_isPendingExitIncludingExternallyControlledReasons:(BOOL)a3
{
  BOOL result;
  SBRestartTransitionRequest *pendingRestartTransitionRequest;
  BOOL v6;

  if (self->_isShuttingDown || self->_isRestartImminent)
    return 1;
  pendingRestartTransitionRequest = self->_pendingRestartTransitionRequest;
  result = pendingRestartTransitionRequest != 0;
  if (pendingRestartTransitionRequest)
    v6 = 1;
  else
    v6 = !a3;
  if (!v6)
    return -[NSMutableSet count](self->_pendingExternallyControlledRestartReasons, "count", a3) != 0;
  return result;
}

- (SBRestartManager)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("UnsupportedInitializerException"), CFSTR("init is unsupported on SBRestartManager"));

  return 0;
}

- (id)_initWithWorkspaceDataSource:(id)a3 initialRestartState:(id)a4 startupController:(id)a5 systemService:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBRestartManager *v15;
  SBRestartManager *v16;
  uint64_t v17;
  NSMutableSet *pendingExternallyControlledRestartReasons;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBRestartManager;
  v15 = -[SBRestartManager init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workspaceDataSource, a3);
    objc_storeStrong((id *)&v16->_initialRestartState, a4);
    objc_storeStrong((id *)&v16->_startupController, a5);
    objc_storeStrong((id *)&v16->_systemService, a6);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    pendingExternallyControlledRestartReasons = v16->_pendingExternallyControlledRestartReasons;
    v16->_pendingExternallyControlledRestartReasons = (NSMutableSet *)v17;

  }
  return v16;
}

- (SBRestartManager)initWithWorkspaceDataSource:(id)a3 initialRestartState:(id)a4
{
  id v6;
  id v7;
  SBStartupTransitionController *v8;
  void *v9;
  SBRestartManager *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[SBStartupTransitionController initWithInitialRestartState:]([SBStartupTransitionController alloc], "initWithInitialRestartState:", v6);
  objc_msgSend(MEMORY[0x1E0D229A0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBRestartManager _initWithWorkspaceDataSource:initialRestartState:startupController:systemService:](self, "_initWithWorkspaceDataSource:initialRestartState:startupController:systemService:", v7, v6, v8, v9);

  return v10;
}

- (SBStartupTransition)startupTransition
{
  BSDispatchQueueAssertMain();
  return -[SBStartupTransitionController startupTransition](self->_startupController, "startupTransition");
}

- (void)initializeAndRunStartupTransition:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[SBStartupTransitionController initializeAndRunStartupTransition:](self->_startupController, "initializeAndRunStartupTransition:", v4);

  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Posting startup notification.", v7, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SBRestartManagerDidBeginStartupTransitionNotification"), self);

}

- (void)shutdownForReason:(id)a3
{
  id v4;
  SBShutdownContext *v5;

  v4 = a3;
  v5 = -[SBShutdownContext initWithReason:]([SBShutdownContext alloc], "initWithReason:", v4);

  -[SBRestartManager shutdownWithContext:](self, "shutdownWithContext:", v5);
}

- (void)shutdownWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (!-[SBRestartManager isPendingExit](self, "isPendingExit"))
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Shutdown requested for with context: %{public}@", buf, 0xCu);
    }

    -[SBRestartManager _persistStartupTransitionContextFromShutdownContext:](self, "_persistStartupTransitionContextFromShutdownContext:", v4);
    v6 = objc_alloc(MEMORY[0x1E0D23280]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Shutdown (%@)"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithReason:", v7);

    objc_msgSend(v8, "setRebootType:", 0);
    if (objc_msgSend(v4, "fromUserPowerDown"))
      objc_msgSend(v8, "setSource:", 1);
    -[SBRestartManager _shutdownUsingOptions:](self, "_shutdownUsingOptions:", v8);

  }
}

- (void)rebootForReason:(id)a3
{
  id v4;
  SBRebootContext *v5;

  v4 = a3;
  v5 = -[SBRebootContext initWithReason:]([SBRebootContext alloc], "initWithReason:", v4);

  -[SBRestartManager rebootWithContext:](self, "rebootWithContext:", v5);
}

- (void)rebootWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  if (!-[SBRestartManager isPendingExit](self, "isPendingExit"))
  {
    v5 = (void *)objc_msgSend(v4, "copy");
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v5;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Reboot requested with context: %{public}@", buf, 0xCu);
    }

    -[SBRestartManager _persistStartupTransitionContextFromRebootContext:](self, "_persistStartupTransitionContextFromRebootContext:", v5);
    v7 = objc_alloc(MEMORY[0x1E0D23280]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reboot (%@)"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithReason:", v8);

    if (objc_msgSend(v5, "isDark"))
      v10 = 2;
    else
      v10 = 1;
    objc_msgSend(v9, "setRebootType:", v10);
    -[SBRestartManager _shutdownUsingOptions:](self, "_shutdownUsingOptions:", v9);

  }
}

- (void)restartWithTransitionRequest:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  BSDispatchQueueAssertMain();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRestartManager.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionRequest"));

  }
  if (!-[SBRestartManager _isPendingExitIncludingExternallyControlledReasons:](self, "_isPendingExitIncludingExternallyControlledReasons:", 0))-[SBRestartManager _restartWithTransitionRequest:](self, "_restartWithTransitionRequest:", v6);

}

- (id)description
{
  return -[SBRestartManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBRestartManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBRestartManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBRestartManager *v11;

  -[SBRestartManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__SBRestartManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

id __58__SBRestartManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 49), CFSTR("isRestartImminent"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("pendingRestartTransitionRequest"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("initialResetState"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("startupController"));
}

- (void)_addPendingExternallyControlledRestartReason:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  BSDispatchQueueAssertMain();
  v5 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRestartManager.m"), 196, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v5 = 0;
  }
  -[NSMutableSet addObject:](self->_pendingExternallyControlledRestartReasons, "addObject:", v5);

}

- (void)_removePendingExternallyControlledRestartReason:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  BSDispatchQueueAssertMain();
  v5 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRestartManager.m"), 202, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v5 = 0;
  }
  -[NSMutableSet removeObject:](self->_pendingExternallyControlledRestartReasons, "removeObject:", v5);

}

- (void)_exitIsImminent
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;

  if (-[SBRestartTransitionRequest restartType](self->_pendingRestartTransitionRequest, "restartType") == 3)
    -[SBRestartManager _postShutdownNotification](self, "_postShutdownNotification");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "restartManagerExitImminent:", self);
      v4 = v6;
    }
  }

}

- (void)_killAllAppsForPendingExitWithReason:(int64_t)a3 description:(id)a4 expiration:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  SBRestartManagerWorkspaceDataSource *workspaceDataSource;
  id v18;
  dispatch_time_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v10 = a6;
  v11 = a4;
  v12 = (void *)objc_opt_new();
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __91__SBRestartManager__killAllAppsForPendingExitWithReason_description_expiration_completion___block_invoke;
  v24[3] = &unk_1E8EA02D8;
  v14 = v12;
  v25 = v14;
  v15 = v10;
  v26 = v15;
  v16 = (void *)MEMORY[0x1D17E5550](v24);
  workspaceDataSource = self->_workspaceDataSource;
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __91__SBRestartManager__killAllAppsForPendingExitWithReason_description_expiration_completion___block_invoke_2;
  v22[3] = &unk_1E8E9F1C0;
  v18 = v16;
  v23 = v18;
  -[SBRestartManagerWorkspaceDataSource terminateAllApplicationsForReason:description:completion:](workspaceDataSource, "terminateAllApplicationsForReason:description:completion:", a3, v11, v22);

  if (a5 > 2.22044605e-16)
  {
    v19 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __91__SBRestartManager__killAllAppsForPendingExitWithReason_description_expiration_completion___block_invoke_3;
    v20[3] = &unk_1E8E9E8D0;
    v21 = v18;
    dispatch_after(v19, MEMORY[0x1E0C80D38], v20);

  }
}

uint64_t __91__SBRestartManager__killAllAppsForPendingExitWithReason_description_expiration_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "signal");
  if ((_DWORD)result)
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __91__SBRestartManager__killAllAppsForPendingExitWithReason_description_expiration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __91__SBRestartManager__killAllAppsForPendingExitWithReason_description_expiration_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_shutdownUsingOptions:(id)a3
{
  id v4;
  int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (!self->_isShuttingDown)
  {
    self->_isShuttingDown = 1;
    -[SBRestartManager _postShutdownNotification](self, "_postShutdownNotification");
    v5 = objc_msgSend(v4, "isReboot");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = WeakRetained;
    if (v5)
    {
      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "restartManagerWillReboot:", self);
    }
    else if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "restartManagerWillShutdown:", self);
    }

    objc_msgSend(v4, "reason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__SBRestartManager__shutdownUsingOptions___block_invoke;
    v9[3] = &unk_1E8E9DEB0;
    v9[4] = self;
    v10 = v4;
    -[SBRestartManager _killAllAppsForPendingExitWithReason:description:expiration:completion:](self, "_killAllAppsForPendingExitWithReason:description:expiration:completion:", 6, v8, v9, 4.0);

  }
}

uint64_t __42__SBRestartManager__shutdownUsingOptions___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "prepareForExitAndRelaunch:", 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "shutdownUsingOptions:", *(_QWORD *)(a1 + 40));
}

- (void)_postShutdownNotification
{
  NSObject *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint8_t v6[16];

  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Posting shutdown notification.", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SBRestartManagerWillRebootNotification"), self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.deviceWillShutDown"), 0, 0, 1u);
}

- (void)_playShutdownSound:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  char v6;
  id v7;
  dispatch_time_t v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD);
  id v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(_QWORD);
  _QWORD block[5];
  id v17;
  id v18;

  v4 = (void (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "startupSoundEnabled");

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D016B8]);
    v8 = dispatch_time(0, 3000000000);
    v9 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__SBRestartManager__playShutdownSound___block_invoke;
    block[3] = &unk_1E8E9F7B8;
    block[4] = self;
    v10 = v7;
    v17 = v10;
    v11 = v4;
    v18 = v11;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __39__SBRestartManager__playShutdownSound___block_invoke_2;
    v13[3] = &unk_1E8E9F7B8;
    v13[4] = self;
    v14 = v10;
    v15 = v11;
    v12 = v10;
    AudioServicesPlaySystemSoundWithCompletion(0x4E5u, v13);

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __39__SBRestartManager__playShutdownSound___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownSoundDidComplete:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __39__SBRestartManager__playShutdownSound___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shutdownSoundDidComplete:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_shutdownSoundDidComplete:(id)a3 completion:(id)a4
{
  void (**v5)(void);

  v5 = (void (**)(void))a4;
  if (objc_msgSend(a3, "setFlag:", 1))
    v5[2]();

}

- (void)_restartWithTransitionRequest:(id)a3
{
  id v5;
  NSObject *v6;
  SBRestartTransitionRequest *v7;
  SBRestartTransitionRequest *pendingRestartTransitionRequest;
  double v9;
  double v10;
  dispatch_time_t v11;
  void *v12;
  _QWORD block[5];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRestartManager.m"), 321, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionRequest"));

  }
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Restart with transition request: %{public}@", buf, 0xCu);
  }

  v7 = (SBRestartTransitionRequest *)objc_msgSend(v5, "copy");
  pendingRestartTransitionRequest = self->_pendingRestartTransitionRequest;
  self->_pendingRestartTransitionRequest = v7;

  objc_msgSend(v5, "delay");
  v10 = v9;
  if (BSFloatGreaterThanFloat())
  {
    v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__SBRestartManager__restartWithTransitionRequest___block_invoke;
    block[3] = &unk_1E8E9E820;
    block[4] = self;
    v14 = v5;
    dispatch_after(v11, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    -[SBRestartManager _reallyRestartWithTransitionRequest:](self, "_reallyRestartWithTransitionRequest:", v5);
  }

}

uint64_t __50__SBRestartManager__restartWithTransitionRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyRestartWithTransitionRequest:", *(_QWORD *)(a1 + 40));
}

- (void)_reallyRestartWithTransitionRequest:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRestartManager.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionRequest"));

  }
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "reason");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requester");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v7;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Really restarting for reason \"%{public}@\" on behalf of %{public}@", buf, 0x16u);

  }
  self->_isRestartImminent = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "restartManager:willRestartWithTransitionRequest:", self, v5);
  v10 = objc_msgSend(v5, "restartType");
  objc_msgSend(v5, "customOverlayDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "wantsPersistentSnapshot"))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "reason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requester");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("RelaunchingSpringBoard-reason:%@-requester:%@"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0D00C88];
    objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "descriptorWithName:display:", v15, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setInterfaceOrientation:", objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation"));
    objc_msgSend(v18, "setLockBacklight:", 1);

    v11 = v18;
  }
  if (v11)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00C80]), "initWithDescriptor:", v11);
    objc_msgSend(v19, "present");
    if ((_DWORD)v10 == 2)
      objc_msgSend(v19, "freeze");

  }
  -[SBRestartManager _persistStartupTransitionContextFromRestartRequest:](self, "_persistStartupTransitionContextFromRestartRequest:", v5);
  -[SBRestartManager _doRestartForTransition:](self, "_doRestartForTransition:", v10);

}

- (void)_persistStartupTransitionContextFromRestartRequest:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRestartManager.m"), 390, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transitionRequest"));

  }
  -[SBRestartManagerWorkspaceDataSource activePrimaryApplicationBundleID](self->_workspaceDataSource, "activePrimaryApplicationBundleID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[SBStartupTransitionContext _initWithRestartRequest:fromLocked:fromApplication:]([SBStartupTransitionContext alloc], "_initWithRestartRequest:fromLocked:fromApplication:", v5, -[SBRestartManagerWorkspaceDataSource isUILocked](self->_workspaceDataSource, "isUILocked"), v8);

  -[SBStartupTransitionController _saveContextFromTransitionContext:](self->_startupController, "_saveContextFromTransitionContext:", v6);
}

- (void)_persistStartupTransitionContextFromRebootContext:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRestartManager.m"), 402, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rebootContext"));

  }
  v7 = -[SBStartupTransitionContext _initWithRebootContext:]([SBStartupTransitionContext alloc], "_initWithRebootContext:", v5);

  -[SBStartupTransitionController _saveContextFromTransitionContext:](self->_startupController, "_saveContextFromTransitionContext:", v7);
}

- (void)_persistStartupTransitionContextFromShutdownContext:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  BSDispatchQueueAssertMain();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBRestartManager.m"), 410, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shutdownContext"));

  }
  v7 = -[SBStartupTransitionContext _initWithShutdownContext:]([SBStartupTransitionContext alloc], "_initWithShutdownContext:", v5);

  -[SBStartupTransitionController _saveContextFromTransitionContext:](self->_startupController, "_saveContextFromTransitionContext:", v7);
}

- (void)_doRestartForTransition:(int)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD block[5];
  id v22;
  uint8_t buf[4];
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  switch(a3)
  {
    case 0:
      -[FBSystemService exitAndRelaunch:](self->_systemService, "exitAndRelaunch:", 1);
      break;
    case 1:
      -[FBSystemService prepareForExitAndRelaunch:](self->_systemService, "prepareForExitAndRelaunch:", 1);
      objc_msgSend(MEMORY[0x1E0D87D70], "identifierForCurrentProcess");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentifier:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D87DA0], "predicateForClearTheBoard");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D87DA0];
      v25[0] = v6;
      v25[1] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "predicateMatchingAnyPredicate:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E00]), "initWithExplanation:", CFSTR("SBRestartManager"));
      objc_msgSend(v11, "setReportType:", 0);
      objc_msgSend(v11, "setExceptionDomain:", 10);
      objc_msgSend(v11, "setExceptionCode:", 1539435076);
      objc_msgSend(v11, "setMaximumTerminationResistance:", 40);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87E08]), "initWithPredicate:context:", v10, v11);
      v22 = 0;
      v13 = objc_msgSend(v12, "execute:", &v22);
      v14 = v22;
      if ((v13 & 1) == 0)
      {
        SBLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v14;
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "restart manager failed to clear the board: %@", buf, 0xCu);
        }

      }
      dispatch_get_global_queue(33, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__SBRestartManager__doRestartForTransition___block_invoke;
      block[3] = &unk_1E8E9DED8;
      block[4] = self;
      dispatch_async(v16, block);

      goto LABEL_9;
    case 2:
      -[FBSystemService prepareForExitAndRelaunch:](self->_systemService, "prepareForExitAndRelaunch:", 1);
      objc_msgSend(MEMORY[0x1E0D00DC0], "actionWithOptions:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D229A8], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sendActionsToBackBoard:", v18);

      dispatch_get_global_queue(33, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __44__SBRestartManager__doRestartForTransition___block_invoke_2;
      v20[3] = &unk_1E8E9DED8;
      v20[4] = self;
      dispatch_async(v6, v20);
LABEL_9:

      break;
    case 3:
      -[FBSystemService prepareForExitAndRelaunch:](self->_systemService, "prepareForExitAndRelaunch:", 1);
      break;
    case 4:
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __44__SBRestartManager__doRestartForTransition___block_invoke_3;
      v19[3] = &unk_1E8E9E980;
      v19[4] = self;
      -[SBRestartManager _killAllAppsForPendingExitWithReason:description:expiration:completion:](self, "_killAllAppsForPendingExitWithReason:description:expiration:completion:", 5, CFSTR("Obliteration"), v19, 4.0);
      break;
    default:
      return;
  }
}

uint64_t __44__SBRestartManager__doRestartForTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "___waitForeverForRunningBoardKill");
}

uint64_t __44__SBRestartManager__doRestartForTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "___waitForeverForRunningBoardKill");
}

uint64_t __44__SBRestartManager__doRestartForTransition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "prepareForExitAndRelaunch:", 1);
}

- (void)___waitForeverForRunningBoardKill
{
  NSObject *v2;

  v2 = dispatch_semaphore_create(0);
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

}

- (SBRestartManagerDelegate)delegate
{
  return (SBRestartManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBRestartTransitionRequest)pendingRestartTransitionRequest
{
  return self->_pendingRestartTransitionRequest;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemService, 0);
  objc_storeStrong((id *)&self->_pendingExternallyControlledRestartReasons, 0);
  objc_storeStrong((id *)&self->_workspaceDataSource, 0);
  objc_storeStrong((id *)&self->_pendingRestartTransitionRequest, 0);
  objc_storeStrong((id *)&self->_startupController, 0);
  objc_storeStrong((id *)&self->_initialRestartState, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
