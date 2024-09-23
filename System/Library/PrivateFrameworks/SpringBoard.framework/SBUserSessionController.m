@implementation SBUserSessionController

- (BOOL)isLoginSession
{
  return -[UMUserManager isLoginSession](self->_userManager, "isLoginSession");
}

- (int64_t)sessionType
{
  void *v3;
  uint64_t v4;

  if (!-[SBUserSessionController isMultiUserSupported](self, "isMultiUserSupported"))
    return 0;
  -[SBUserSessionController user](self, "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userType");

  if (v4)
    return 2 * (v4 == 1);
  else
    return 1;
}

- (BOOL)isMultiUserSupported
{
  return -[UMUserManager isMultiUser](self->_userManager, "isMultiUser");
}

- (SBUserSessionController)init
{
  void *v3;
  SBUserSessionController *v4;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUserSessionController _initWithUserManager:](self, "_initWithUserManager:", v3);

  return v4;
}

- (id)_initWithUserManager:(id)a3
{
  id v5;
  SBUserSessionController *v6;
  id *p_isa;
  NSObject *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBUserSessionController;
  v6 = -[SBUserSessionController init](&v10, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userManager, a3);
    objc_msgSend(p_isa[1], "registerCriticalUserSwitchStakeHolder:", p_isa);
    SBLogUserSession();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SBUserSessionController _initWithUserManager:].cold.1(p_isa + 1, p_isa);

  }
  return p_isa;
}

- (void)dealloc
{
  objc_super v3;

  -[UMUserManager unregisterStakeHolder:status:reason:](self->_userManager, "unregisterStakeHolder:status:reason:", self, 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)SBUserSessionController;
  -[SBUserSessionController dealloc](&v3, sel_dealloc);
}

- (void)setLoggingOut:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  if (self->_loggingOut != a3)
  {
    v3 = a3;
    self->_loggingOut = a3;
    objc_msgSend((id)SBApp, "restartManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "_addPendingExternallyControlledRestartReason:", CFSTR("user-switch"));
    else
      objc_msgSend(v4, "_removePendingExternallyControlledRestartReason:", CFSTR("user-switch"));

  }
}

- (UMUser)user
{
  UMUser *lazy_user;
  UMUser *v4;
  UMUser *v5;

  lazy_user = self->_lazy_user;
  if (!lazy_user)
  {
    -[UMUserManager currentUser](self->_userManager, "currentUser");
    v4 = (UMUser *)objc_claimAutoreleasedReturnValue();
    v5 = self->_lazy_user;
    self->_lazy_user = v4;

    lazy_user = self->_lazy_user;
  }
  return lazy_user;
}

- (BOOL)canLogout
{
  void *v3;
  int v4;
  _BOOL4 v5;

  -[SBUserSessionController policyAggregator](self, "policyAggregator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsCapability:", 15);

  if (v4 && !-[SBUserSessionController isLoggingOut](self, "isLoggingOut"))
  {
    v5 = -[SBUserSessionController isMultiUserSupported](self, "isMultiUserSupported");
    if (v5)
      LOBYTE(v5) = !-[SBUserSessionController isLoginSession](self, "isLoginSession");
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)logout
{
  LKLogoutSupport *logoutSupport;
  LKLogoutSupport *v4;
  LKLogoutSupport *v5;

  logoutSupport = self->_logoutSupport;
  if (!logoutSupport)
  {
    v4 = (LKLogoutSupport *)objc_opt_new();
    v5 = self->_logoutSupport;
    self->_logoutSupport = v4;

    logoutSupport = self->_logoutSupport;
  }
  -[SBUserSessionController logoutWithLogoutSupport:](self, "logoutWithLogoutSupport:", logoutSupport);
}

- (void)logoutWithLogoutSupport:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;

  if (-[SBUserSessionController canLogout](self, "canLogout", a3))
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInLostMode");

    SBLogUserSession();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7)
        -[SBUserSessionController logoutWithLogoutSupport:].cold.1();
    }
    else if (v7)
    {
      -[SBUserSessionController logoutWithLogoutSupport:].cold.2();
    }

    -[SBUserSessionController _displayProgressTransientOverlayIfNeeded](self, "_displayProgressTransientOverlayIfNeeded");
  }
  else
  {
    SBLogUserSession();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SBUserSessionController logoutWithLogoutSupport:].cold.3();

  }
}

- (void)disableCurrentUser
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "LOGOUT: Forcing logout and disable of current user", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __45__SBUserSessionController_disableCurrentUser__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;

  v2 = a2;
  SBLogUserSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __45__SBUserSessionController_disableCurrentUser__block_invoke_cold_1((uint64_t)v2, v3, v4);

}

- (NSString)description
{
  return (NSString *)-[SBUserSessionController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBUserSessionController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBUserSessionController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  SBUserSessionController *v11;

  -[SBUserSessionController succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__SBUserSessionController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

id __65__SBUserSessionController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "user");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("userAccount"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isMultiUserSupported"), CFSTR("multiUserSupported"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "canLogout"), CFSTR("canLogout"));
}

- (id)pendingApplicationsForLogoutProgressTransientOverlayViewController:(id)a3
{
  return self->_displayApplications;
}

- (id)debugBlockingTasksForLogoutProgressTransientOverlayViewController:(id)a3
{
  return self->_debugBlockingTasks;
}

- (void)logoutProgressTransientOverlayViewControllerDidDisappear:(id)a3
{
  SBLogoutProgressTransientOverlayViewController *progressTransientOverlayViewController;

  progressTransientOverlayViewController = self->_progressTransientOverlayViewController;
  self->_progressTransientOverlayViewController = 0;

  self->_loggingOut = 0;
}

- (void)logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete:(id)a3
{
  LKLogoutSupport *logoutSupport;
  _QWORD v4[5];

  logoutSupport = self->_logoutSupport;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __102__SBUserSessionController_logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete___block_invoke;
  v4[3] = &unk_1E8EA78D8;
  v4[4] = self;
  -[LKLogoutSupport logoutToLoginWindowWithCompletionHandler:](logoutSupport, "logoutToLoginWindowWithCompletionHandler:", v4);
}

void __102__SBUserSessionController_logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __102__SBUserSessionController_logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete___block_invoke_2;
  v6[3] = &unk_1E8E9E820;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __102__SBUserSessionController_logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  SBLogUserSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __102__SBUserSessionController_logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete___block_invoke_2_cold_1(a1, v2, v3);

  if (*(_QWORD *)(a1 + 32))
  {
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissTransientOverlayViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), 1, 0);

    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = 0;

    objc_msgSend(*(id *)(a1 + 40), "setLoggingOut:", 0);
  }
}

- (void)willSwitchToUser:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  UMUserSwitchBlockingTask *v8;
  UMUserSwitchBlockingTask *terminateApplicationsTask;
  NSDate *v10;
  NSDate *terminateApplicationsStartDate;
  void *v12;
  _QWORD block[5];
  uint8_t buf[16];

  v5 = a3;
  kdebug_trace();
  SBLogUserSession();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SBUserSessionController willSwitchToUser:].cold.1((uint64_t)self);

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUserSessionController.m"), 259, CFSTR("This is not expected to land on the main thread."));

  }
  if (-[SBUserSessionController isLoginSession](self, "isLoginSession"))
  {
    SBLogUserSession();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[SBUserSessionController] willSwitchToUser: Exiting early for login session. User switch pending... ", buf, 2u);
    }

    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_32);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC5F08], "taskWithName:reason:", CFSTR("terminate running tasks"), CFSTR("terminate running tasks"));
    v8 = (UMUserSwitchBlockingTask *)objc_claimAutoreleasedReturnValue();
    terminateApplicationsTask = self->_terminateApplicationsTask;
    self->_terminateApplicationsTask = v8;

    -[UMUserSwitchBlockingTask begin](self->_terminateApplicationsTask, "begin");
    v10 = (NSDate *)objc_opt_new();
    terminateApplicationsStartDate = self->_terminateApplicationsStartDate;
    self->_terminateApplicationsStartDate = v10;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__SBUserSessionController_willSwitchToUser___block_invoke_2;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    kdebug_trace();
  }

}

void __44__SBUserSessionController_willSwitchToUser___block_invoke()
{
  id v0;

  objc_msgSend((id)SBApp, "restartManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_addPendingExternallyControlledRestartReason:", CFSTR("user-switch"));

}

void __44__SBUserSessionController_willSwitchToUser___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[8];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setLoggingOut:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_displayProgressTransientOverlayIfNeeded");
  SBLogUserSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "LOGOUT: Terminating running applications.", buf, 2u);
  }

  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__noteApplicationDidExitFromNotification_, CFSTR("SBApplicationDidExitNotification"), 0);

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runningApplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = v6;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        v16[0] = v13;
        v16[1] = 3221225472;
        v16[2] = __44__SBUserSessionController_willSwitchToUser___block_invoke_44;
        v16[3] = &unk_1E8E9DEB0;
        v16[4] = *(_QWORD *)(a1 + 32);
        v16[5] = v15;
        SBWorkspaceTerminateApplication(v15, 9, 0, CFSTR("Logout"), v16);
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 32), "_evaluateRunningApplications");
}

uint64_t __44__SBUserSessionController_willSwitchToUser___block_invoke_44(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteApplicationDidExit:", *(_QWORD *)(a1 + 40));
}

- (void)readyToSwitchToUser:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  kdebug_trace();
  kdebug_trace();
  SBLogUserSession();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SBUserSessionController readyToSwitchToUser:].cold.1((uint64_t)self);

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUserSessionController.m"), 306, CFSTR("This cannot be invoked on the main thread."));

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__SBUserSessionController_readyToSwitchToUser___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_sync(MEMORY[0x1E0C80D38], v9);

}

void __47__SBUserSessionController_readyToSwitchToUser___block_invoke(uint64_t a1)
{
  NSObject *v1;
  SBRestartTransitionRequest *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_readyToSwitchToUser:", *(_QWORD *)(a1 + 40));
  SBLogUserSession();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __47__SBUserSessionController_readyToSwitchToUser___block_invoke_cold_1();

  kdebug_trace();
  v2 = -[SBRestartTransitionRequest initWithRequester:reason:]([SBRestartTransitionRequest alloc], "initWithRequester:reason:", CFSTR("SBUserSessionController"), CFSTR("switchToUser"));
  -[SBRestartTransitionRequest setRestartType:](v2, "setRestartType:", 3);
  objc_msgSend((id)SBApp, "restartManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restartWithTransitionRequest:", v2);

}

- (void)readyToSwitchToLoginSession:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  SBLogUserSession();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SBUserSessionController readyToSwitchToLoginSession:].cold.1((uint64_t)self, v6);

  kdebug_trace();
  kdebug_trace();
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUserSessionController.m"), 326, CFSTR("This cannot be invoked on the main thread."));

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SBUserSessionController_readyToSwitchToLoginSession___block_invoke;
  v9[3] = &unk_1E8E9E820;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_sync(MEMORY[0x1E0C80D38], v9);

}

void __55__SBUserSessionController_readyToSwitchToLoginSession___block_invoke(uint64_t a1)
{
  NSObject *v1;
  SBRestartTransitionRequest *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_readyToSwitchToUser:", *(_QWORD *)(a1 + 40));
  SBLogUserSession();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    __55__SBUserSessionController_readyToSwitchToLoginSession___block_invoke_cold_1();

  kdebug_trace();
  v2 = -[SBRestartTransitionRequest initWithRequester:reason:]([SBRestartTransitionRequest alloc], "initWithRequester:reason:", CFSTR("SBUserSessionController"), CFSTR("switchToLoginSession"));
  -[SBRestartTransitionRequest setRestartType:](v2, "setRestartType:", 2);
  objc_msgSend((id)SBApp, "restartManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restartWithTransitionRequest:", v2);

  kdebug_trace();
}

- (void)_readyToSwitchToUser:(id)a3
{
  id v4;
  NSDictionary *debugBlockingTasks;
  int v6;
  int v7;
  __CFString *v8;
  int v9;
  const __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _DWORD v23[2];
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  debugBlockingTasks = self->_debugBlockingTasks;
  self->_debugBlockingTasks = 0;

  if (-[SBUserSessionController isLoginSession](self, "isLoginSession"))
    v6 = objc_msgSend(v4, "isLoginUser") ^ 1;
  else
    v6 = 0;
  if (-[SBUserSessionController isLoginSession](self, "isLoginSession"))
  {
    v7 = objc_msgSend(v4, "isLoginUser");
    v8 = CFSTR("login");
    if (!v7)
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v8 = CFSTR("login");
  }
  v10 = CFSTR("logout");
  v9 = 1;
LABEL_9:
  if (!v6)
    v8 = (__CFString *)v10;
  v11 = v8;
  SBLogUserSession();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    -[UMUserManager currentUser](self->_userManager, "currentUser");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = 67109890;
    v23[1] = v6;
    v24 = 1024;
    v25 = v9;
    v26 = 2112;
    v27 = v22;
    v28 = 2112;
    v29 = v4;
    _os_log_debug_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEBUG, "[SBUserSessionController] _readyToSwitchToUser: (isLogin: %d, isLogout: %d, currentUser? %@) switching to user: %@", (uint8_t *)v23, 0x22u);

  }
  if (v11)
  {
    -[SBLogoutProgressTransientOverlayViewController prepareForRestart](self->_progressTransientOverlayViewController, "prepareForRestart");
    kdebug_trace();
    v13 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
    v14 = (void *)MEMORY[0x1E0D00C78];
    -[SBUserSessionController _portraitOrientedProgressLocationForOrientation:](self, "_portraitOrientedProgressLocationForOrientation:", v13);
    objc_msgSend(v14, "progressIndicatorWithStyle:position:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0D00C88];
    objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "descriptorWithName:display:", v11, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setProgressIndicatorProperties:", v15);
    objc_msgSend(v18, "setInterfaceOrientation:", v13);
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "shouldTurnOnScreenForBacklightSource:", 21))
    {
      +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setBacklightState:source:", 1, 21);

    }
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00C80]), "initWithDescriptor:", v18);
    objc_msgSend(v21, "present");
    objc_msgSend(v21, "freeze");
    kdebug_trace();
    kdebug_trace();

  }
}

- (void)userSwitchBlockingTasksDidUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__SBUserSessionController_userSwitchBlockingTasksDidUpdate___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __60__SBUserSessionController_userSwitchBlockingTasksDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t *v1;
  NSObject *v2;
  uint64_t v3;

  v1 = (uint64_t *)(a1 + 40);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(v1 - 1) + 32), "refreshData");
  SBLogUserSession();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __60__SBUserSessionController_userSwitchBlockingTasksDidUpdate___block_invoke_cold_1(v1, v2, v3);

}

- (SBMainDisplayPolicyAggregator)policyAggregator
{
  SBMainDisplayPolicyAggregator *lazy_policyAggregator;
  void *v4;
  SBMainDisplayPolicyAggregator *v5;
  SBMainDisplayPolicyAggregator *v6;

  lazy_policyAggregator = self->_lazy_policyAggregator;
  if (!lazy_policyAggregator)
  {
    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "policyAggregator");
    v5 = (SBMainDisplayPolicyAggregator *)objc_claimAutoreleasedReturnValue();
    v6 = self->_lazy_policyAggregator;
    self->_lazy_policyAggregator = v5;

    lazy_policyAggregator = self->_lazy_policyAggregator;
  }
  return lazy_policyAggregator;
}

- (void)_noteApplicationDidExitFromNotification:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUserSessionController _noteApplicationDidExit:](self, "_noteApplicationDidExit:", v4);

}

- (void)_noteApplicationDidExit:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUserSessionController.m"), 404, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("application"));

  }
  SBLogUserSession();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SBUserSessionController _noteApplicationDidExit:].cold.1((uint64_t)v5, v6, v7);

  -[NSMutableSet removeObject:](self->_terminatingApplications, "removeObject:", v5);
  -[NSMutableArray removeObject:](self->_displayApplications, "removeObject:", v5);
  -[SBLogoutProgressTransientOverlayViewController refreshData](self->_progressTransientOverlayViewController, "refreshData");
  -[SBUserSessionController _evaluateRunningApplications](self, "_evaluateRunningApplications");

}

- (void)_evaluateRunningApplications
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "LOGOUT: still not switching; _terminatingApplications = %@",
    (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_0();
}

- (void)_displayProgressTransientOverlayIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *displayApplications;
  SBLogoutProgressTransientOverlayViewController *v9;
  void *v10;
  SBLogoutProgressTransientOverlayViewController *v11;
  SBLogoutProgressTransientOverlayViewController *progressTransientOverlayViewController;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[8];
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  if (!self->_progressTransientOverlayViewController)
  {
    SBLogUserSession();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "LOGOUT: displaying logout transient overlay.", v16, 2u);
    }

    kdebug_trace();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "runningApplications");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUserSessionController _massageApplicationListForDisplay:](self, "_massageApplicationListForDisplay:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
    displayApplications = self->_displayApplications;
    self->_displayApplications = v7;

    v9 = [SBLogoutProgressTransientOverlayViewController alloc];
    -[SBUserSessionController user](self, "user");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBLogoutProgressTransientOverlayViewController initWithUserAccount:](v9, "initWithUserAccount:", v10);
    progressTransientOverlayViewController = self->_progressTransientOverlayViewController;
    self->_progressTransientOverlayViewController = v11;

    -[SBLogoutProgressTransientOverlayViewController setDataSource:](self->_progressTransientOverlayViewController, "setDataSource:", self);
    -[SBLogoutProgressTransientOverlayViewController setDelegate:](self->_progressTransientOverlayViewController, "setDelegate:", self);
    +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR("SBUILockOptionsForceLockKey");
    v17[1] = CFSTR("SBUILockOptionsAnimateLockScreenActivationKey");
    v18[0] = MEMORY[0x1E0C9AAB0];
    v18[1] = MEMORY[0x1E0C9AAA0];
    v17[2] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
    v18[2] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lockUIFromSource:withOptions:", 17, v14);

    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "presentTransientOverlayViewController:animated:completion:", self->_progressTransientOverlayViewController, 1, 0);

    kdebug_trace();
  }
}

- (id)_massageApplicationListForDisplay:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[4];
  _QWORD v26[4];
  id v27;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleIconStateDisplayIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3880];
  v8 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke;
  v26[3] = &unk_1E8EA85B8;
  v9 = v6;
  v27 = v9;
  objc_msgSend(v7, "predicateWithBlock:", v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterUsingPredicate:", v10);

  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recentAppLayouts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke_2;
  v22[3] = &unk_1E8EA8608;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v23 = v13;
  v24 = v25;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v22);
  v17 = v8;
  v18 = 3221225472;
  v19 = __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke_4;
  v20 = &unk_1E8EA8630;
  v14 = v13;
  v21 = v14;
  objc_msgSend(v4, "sortUsingComparator:", &v17);
  v15 = (void *)objc_msgSend(v4, "copy", v17, v18, v19, v20);

  _Block_object_dispose(v25, 8);
  return v15;
}

uint64_t __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

void __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke_3;
  v6[3] = &unk_1E8EA85E0;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "enumerate:", v6);

}

void __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!objc_msgSend(v8, "type"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(v4, "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v8, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  }
}

uint64_t __61__SBUserSessionController__massageApplicationListForDisplay___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = &unk_1E91D0920;
  v12 = v11;

  v13 = *(void **)(a1 + 32);
  objc_msgSend(v6, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = &unk_1E91D0920;
  v18 = v17;

  v19 = objc_msgSend(v12, "compare:", v18);
  if (!v19)
  {
    objc_msgSend(v5, "displayName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v20, "localizedCompare:", v21);

  }
  return v19;
}

- (CGPoint)_portraitOrientedProgressLocationForOrientation:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  CGPoint result;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceBounds");

  _UIWindowConvertPointFromOrientationToOrientation();
  result.y = v5;
  result.x = v4;
  return result;
}

- (BOOL)isLoggingOut
{
  return self->_loggingOut;
}

- (SBMainDisplayPolicyAggregator)_policyAggregator
{
  return self->_lazy_policyAggregator;
}

- (void)_setPolicyAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_lazy_policyAggregator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoutSupport, 0);
  objc_storeStrong((id *)&self->_debugBlockingTasks, 0);
  objc_storeStrong((id *)&self->_terminateApplicationsStartDate, 0);
  objc_storeStrong((id *)&self->_terminateApplicationsTask, 0);
  objc_storeStrong((id *)&self->_terminatingApplications, 0);
  objc_storeStrong((id *)&self->_displayApplications, 0);
  objc_storeStrong((id *)&self->_progressTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_lazy_policyAggregator, 0);
  objc_storeStrong((id *)&self->_lazy_user, 0);
  objc_storeStrong((id *)&self->_userManager, 0);
}

- (void)_initWithUserManager:(id *)a1 .cold.1(id *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(*a1, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "isMultiUserSupported");
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v4, v5, "INITIALIZE: session started as user: %@ (multi-user session: %@)", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_20();
}

- (void)logoutWithLogoutSupport:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "LOGOUT: Logout initiated automatically due to lost mode activation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)logoutWithLogoutSupport:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "LOGOUT: Logout initiated by user.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)logoutWithLogoutSupport:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "LOGOUT: Logout attempted, but logout is not supported.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __45__SBUserSessionController_disableCurrentUser__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  __CFString *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("with error: %@"), a1);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("successfully");
  }
  v6 = 138412290;
  v7 = v5;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "LOGOUT: disable current user call completed %@", (uint8_t *)&v6);
  if (a1)

  OUTLINED_FUNCTION_7();
}

void __102__SBUserSessionController_logoutProgressTransientOverlayPresentationTransitionCoordinatorDidComplete___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("with error: %@"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("successfully");
  }
  v6 = 138412290;
  v7 = v5;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "LOGOUT completed: %@", (uint8_t *)&v6);
  if (v4)

  OUTLINED_FUNCTION_7();
}

- (void)willSwitchToUser:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 8), "currentUser");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "[SBUserSessionController] willSwitchToUser: (currentUser? %@) will switch to user: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)readyToSwitchToUser:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 8), "currentUser");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "[SBUserSessionController] readyToSwitchToUser: (currentUser? %@) ready to switch to user: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

void __47__SBUserSessionController_readyToSwitchToUser___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "[SBUserSessionController] readyToSwitchToUser: we're now ready for the user switch.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)readyToSwitchToLoginSession:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 8), "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, v4, "[SBUserSessionController] readyToSwitchToLoginSession: (currentUser? %@) ready to switch to login session.", (uint8_t *)&v5);

}

void __55__SBUserSessionController_readyToSwitchToLoginSession___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1D0540000, v0, v1, "[SBUserSessionController] readyToSwitchToLoginSession: Ready for the user switch. Restarting backboardd.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __60__SBUserSessionController_userSwitchBlockingTasksDidUpdate___block_invoke_cold_1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "[SBUserSessionController] userSwitchBlockingTasksDidUpdate: bundleIDsToTasks = %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_0();
}

- (void)_noteApplicationDidExit:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, a2, a3, "LOGOUT: application exited: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

@end
