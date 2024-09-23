@implementation SBApplicationAutoLaunchService

- (void)_applicationProcessStateDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v4 = a3;
  objc_msgSend(v4, "object");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("previousProcessState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "processState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "taskState");
  if (v7)
    v9 = objc_msgSend(v7, "taskState") != 1;
  else
    v9 = 0;
  v10 = v21;
  if (v8 != 1 && !v9)
  {
    objc_msgSend(v21, "lastExitContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "info");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "supportsLegacyVOIPBackgroundMode");

    if (v13)
      -[SBApplicationAutoLaunchService _recalculateVoIPBehaviorForApplication:withExitContext:](self, "_recalculateVoIPBehaviorForApplication:withExitContext:", v21, v11);
    if (-[SBApplicationAutoLaunchService _shouldAutoLaunchApplication:forReason:](self, "_shouldAutoLaunchApplication:forReason:", v21, 3))
    {
      -[SBApplicationAutoLaunchService _scheduleAutoLaunchForApplicationExited:withExitContext:](self, "_scheduleAutoLaunchForApplicationExited:withExitContext:", v21, v11);
    }

    v10 = v21;
  }
  objc_msgSend(v10, "info");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsLegacyVOIPBackgroundMode");

  if (v15)
  {
    v16 = objc_msgSend(v6, "taskState");
    v17 = objc_msgSend(v7, "taskState");
    if (v16 == 3 && v17 == 3)
      objc_msgSend(v21, "setFailedAutoLaunchCountForVOIP:", 0);
    v19 = objc_msgSend(v6, "visibility");
    v20 = objc_msgSend(v7, "visibility");
    if (v19 != 2 && v20 == 2)
      objc_msgSend(v21, "setWantsAutoLaunchForVOIP:", 1);
  }

}

- (id)_initWithWorkspace:(id)a3 applicationController:(id)a4 restartManager:(id)a5 syncController:(id)a6 keybag:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  SBApplicationAutoLaunchService *v19;
  SBApplicationAutoLaunchService *v20;
  id *p_isa;
  void *v22;
  char v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id obj;
  void *v34;
  uint8_t buf[16];
  objc_super v36;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  obj = a7;
  v17 = a7;
  v34 = v13;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationAutoLaunchService.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workspace"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationAutoLaunchService.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("applicationController"));

LABEL_3:
  v18 = v17;
  v19 = self;
  if (v15)
  {
    if (v16)
      goto LABEL_5;
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("SBApplicationAutoLaunchService.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncController"));

    if (v18)
      goto LABEL_6;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("SBApplicationAutoLaunchService.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("restartManager"));

  if (!v16)
    goto LABEL_19;
LABEL_5:
  if (v18)
    goto LABEL_6;
LABEL_20:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("SBApplicationAutoLaunchService.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keybag"));

LABEL_6:
  v36.receiver = v19;
  v36.super_class = (Class)SBApplicationAutoLaunchService;
  v20 = -[SBApplicationAutoLaunchService init](&v36, sel_init);
  p_isa = (id *)&v20->super.isa;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_mainWorkspace, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
    objc_storeStrong(p_isa + 5, obj);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", p_isa, sel__installedApplicationsDidChange_, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", p_isa, sel__applicationProcessStateDidChange_, CFSTR("SBApplicationProcessStateDidChange"), 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", p_isa, sel__memoryPressureRelieved_, CFSTR("SBMemoryPressureReturnedToNormalNotification"), 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", p_isa, sel__memoryPressureWarn_, CFSTR("SBMemoryPressureUnderPressureNotification"), 0);
    v23 = objc_msgSend(p_isa[5], "hasBeenUnlockedSinceBoot");
    SBLogAutoLaunching();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if ((v23 & 1) != 0)
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Service initialized: already unlocked.", buf, 2u);
      }

    }
    else
    {
      if (v25)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "Service initialized: waiting for first unlock.", buf, 2u);
      }

      objc_msgSend(p_isa[5], "addObserver:", p_isa);
    }

  }
  return p_isa;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationAutoLaunchService.m"), 108, CFSTR("SBApplicationAutoLaunchService Must be invalidated before it can dealloc."));

  }
  v5.receiver = self;
  v5.super_class = (Class)SBApplicationAutoLaunchService;
  -[SBApplicationAutoLaunchService dealloc](&v5, sel_dealloc);
}

- (void)autoLaunchApplicationsIfNecessaryForStartup
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t buf[8];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SBLogAutoLaunching();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "AutoLaunch for startup.", buf, 2u);
  }

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SBApplicationController allApplications](self->_applicationController, "allApplications", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
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
        -[SBApplicationAutoLaunchService _autoLaunchIfNecessary:forReason:](self, "_autoLaunchIfNecessary:forReason:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v6);
  }

}

- (void)invalidate
{
  id v3;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[SBFMobileKeyBag removeObserver:](self->_keybag, "removeObserver:", self);
    -[NSTimer invalidate](self->_queuedApplicationsThrottledForRelaunchTimer, "invalidate");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
}

- (NSString)description
{
  return (NSString *)-[SBApplicationAutoLaunchService descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)_noteTerminationAssertionRemovedForApplication:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "supportsLegacyVOIPBackgroundMode"))
  {
    v6 = objc_msgSend(v4, "wantsAutoLaunchForVOIP");

    if (v6)
    {
      SBLogAutoLaunching();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = 138543362;
        v9 = v4;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "AutoLaunch for termination assertion removed on application: %{public}@", (uint8_t *)&v8, 0xCu);
      }

      -[SBApplicationAutoLaunchService _autoLaunchIfNecessary:forReason:](self, "_autoLaunchIfNecessary:forReason:", v4, 2);
    }
  }
  else
  {

  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBApplicationAutoLaunchService succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBApplicationAutoLaunchService descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;

  -[SBApplicationAutoLaunchService succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", self->_queuedApplicationsThrottledForRelaunch, CFSTR("QueuedApplicationsThrottledForRelaunch"), 1);
  v5 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_queuedApplicationsThrottledForRelaunchTimer, CFSTR("QueuedApplicationsThrottledForRelaunchTimer"), 1);
  return v4;
}

- (void)_autoLaunchIfNecessary:(id)a3 forReason:(unint64_t)a4
{
  __CFString *v6;
  NSObject *v7;
  __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  void *v12;
  _QWORD block[4];
  void (**v14)(_QWORD);
  _QWORD v15[5];
  __CFString *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  if ((-[SBFMobileKeyBag hasBeenUnlockedSinceBoot](self->_keybag, "hasBeenUnlockedSinceBoot") & 1) != 0)
  {
    if (-[SBApplicationAutoLaunchService _shouldAutoLaunchApplication:forReason:](self, "_shouldAutoLaunchApplication:forReason:", v6, a4))
    {
      SBLogAutoLaunching();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (a4 > 3)
          v8 = 0;
        else
          v8 = off_1E8EB8290[a4];
        *(_DWORD *)buf = 138543618;
        v18 = v8;
        v19 = 2114;
        v20 = v6;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "AutoLaunching application for %{public}@: %{public}@", buf, 0x16u);
      }

      v10 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke;
      v15[3] = &unk_1E8E9E820;
      v15[4] = self;
      v16 = v6;
      v11 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v15);
      v12 = v11;
      if (self->_autoLaunchSynchronously)
      {
        v11[2](v11);
      }
      else
      {
        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke_4;
        block[3] = &unk_1E8E9E8D0;
        v14 = v11;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
    }
  }
  else
  {
    SBLogAutoLaunching();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Pre-empting auto launch because we haven't had first unlock yet: %{public}@", buf, 0xCu);
    }

  }
}

void __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke_2;
  v3[3] = &unk_1E8E9EE78;
  v4 = v1;
  objc_msgSend(v2, "requestTransitionWithBuilder:", v3);

}

void __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 58);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke_3;
  v4[3] = &unk_1E8E9EE50;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "modifyApplicationContext:", v4);

}

void __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  SBDeviceApplicationSceneEntity *v6;

  v3 = a2;
  v6 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 32), "wantsAutoLaunchForVOIP"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA318]), "initWithInfo:responder:", 0, 0);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationSceneEntity addActions:](v6, "addActions:", v5);

  }
  objc_msgSend(v3, "setBackground:", 1);
  objc_msgSend(v3, "setEntity:forLayoutRole:", v6, 1);

}

uint64_t __67__SBApplicationAutoLaunchService__autoLaunchIfNecessary_forReason___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_shouldAutoLaunchApplication:(id)a3 forReason:(unint64_t)a4
{
  id v6;
  int v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  _BOOL4 v23;
  void *v24;
  int v25;
  NSObject *v26;

  v6 = a3;
  v7 = objc_msgSend(v6, "isSystemApplication");
  objc_msgSend(v6, "lastExitContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "exitReason") & 1) != 0)
  {
    objc_msgSend(v8, "underlyingContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "legacyCode") == 0;

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v6, "lastExitContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "terminationReason");

  if (v9 || (v13 = v12 != 1, (objc_msgSend(v8, "exitReason") & 0x20) != 0))
    v13 = 0;
  if ((objc_msgSend(v6, "isUninstalled") & 1) != 0)
    goto LABEL_31;
  if (v7
    && (objc_msgSend(v6, "bundleIdentifier"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEqual:", CFSTR("com.apple.mobiletimer")),
        v14,
        v15))
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "notificationDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "legacyAlarmList");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_31;
  }
  else
  {
    v19 = objc_msgSend(v6, "wantsAutoLaunchForVOIP");
    v20 = a4 != 3 || v13;
    if (!v19 || (v20 & 1) == 0)
    {
      if (!v13)
        goto LABEL_31;
      if (!objc_msgSend(v6, "isConnectedToExternalAccessory"))
        goto LABEL_31;
      objc_msgSend(v6, "info");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "supportsBackgroundMode:", CFSTR("external-accessory"));

      if (!v25)
        goto LABEL_31;
    }
  }
  v21 = objc_msgSend(v6, "failedLaunchCount");
  v22 = 5;
  if (v7)
    v22 = 10;
  if (v21 >= v22)
  {
    SBLogAutoLaunching();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[SBApplicationAutoLaunchService _shouldAutoLaunchApplication:forReason:].cold.1(v6, v26);

    goto LABEL_31;
  }
  if ((objc_msgSend(v6, "isAnyTerminationAssertionHeld") & 1) != 0
    || -[SBRestartManager isPendingExit](self->_restartManager, "isPendingExit")
    || -[SBSyncController restoreState](self->_syncController, "restoreState"))
  {
LABEL_31:
    LOBYTE(v23) = 0;
    goto LABEL_32;
  }
  v23 = !-[SBSyncController isResetting](self->_syncController, "isResetting");
LABEL_32:

  return v23;
}

- (void)_launchNextQueuedApplicationThrottledForRelaunch
{
  void *v3;
  NSObject *v4;
  NSMutableArray *queuedApplicationsThrottledForRelaunch;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray objectAtIndex:](self->_queuedApplicationsThrottledForRelaunch, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_queuedApplicationsThrottledForRelaunch, "removeObjectAtIndex:", 0);
  if (v3)
  {
    SBLogAutoLaunching();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "AutoLaunch throttled application for relaunch: %{public}@.", (uint8_t *)&v6, 0xCu);
    }

    -[SBApplicationAutoLaunchService _autoLaunchIfNecessary:forReason:](self, "_autoLaunchIfNecessary:forReason:", v3, 3);
  }
  if (!-[NSMutableArray count](self->_queuedApplicationsThrottledForRelaunch, "count"))
  {
    queuedApplicationsThrottledForRelaunch = self->_queuedApplicationsThrottledForRelaunch;
    self->_queuedApplicationsThrottledForRelaunch = 0;

    -[SBApplicationAutoLaunchService _invalidateQueuedApplicationsThrottledForRelaunchTimer](self, "_invalidateQueuedApplicationsThrottledForRelaunchTimer");
  }

}

- (void)_scheduleThrottledApplicationRelaunchTimerIfNecessary
{
  NSObject *v3;
  NSTimer *v4;
  NSTimer *queuedApplicationsThrottledForRelaunchTimer;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend((id)SBApp, "underMemoryPressure") & 1) == 0
    && self->_queuedApplicationsThrottledForRelaunch
    && !self->_queuedApplicationsThrottledForRelaunchTimer)
  {
    SBLogAutoLaunching();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109120;
      v6[1] = 15;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Scheduling throttled relaunch of queued applications in %d seconds.", (uint8_t *)v6, 8u);
    }

    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__launchNextQueuedApplicationThrottledForRelaunch, 0, 1, 15.0);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    queuedApplicationsThrottledForRelaunchTimer = self->_queuedApplicationsThrottledForRelaunchTimer;
    self->_queuedApplicationsThrottledForRelaunchTimer = v4;

  }
}

- (void)_invalidateQueuedApplicationsThrottledForRelaunchTimer
{
  NSTimer *queuedApplicationsThrottledForRelaunchTimer;

  -[NSTimer invalidate](self->_queuedApplicationsThrottledForRelaunchTimer, "invalidate");
  queuedApplicationsThrottledForRelaunchTimer = self->_queuedApplicationsThrottledForRelaunchTimer;
  self->_queuedApplicationsThrottledForRelaunchTimer = 0;

}

- (void)_scheduleAutoLaunchForApplicationExited:(id)a3 withExitContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSMutableArray *queuedApplicationsThrottledForRelaunch;
  NSMutableArray *v12;
  NSMutableArray *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogAutoLaunching();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Application exited and wants to be relaunched: %{public}@.", (uint8_t *)&v14, 0xCu);
  }

  if ((objc_msgSend((id)SBApp, "underMemoryPressure") & 1) != 0 || (objc_msgSend(v7, "exitReason") & 0x10) != 0)
  {
    SBLogAutoLaunching();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBApplicationAutoLaunchService _scheduleAutoLaunchForApplicationExited:withExitContext:].cold.1((uint64_t)v6, v9, v10);

    queuedApplicationsThrottledForRelaunch = self->_queuedApplicationsThrottledForRelaunch;
    if (!queuedApplicationsThrottledForRelaunch)
    {
      v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = self->_queuedApplicationsThrottledForRelaunch;
      self->_queuedApplicationsThrottledForRelaunch = v12;

      queuedApplicationsThrottledForRelaunch = self->_queuedApplicationsThrottledForRelaunch;
    }
    if ((-[NSMutableArray containsObject:](queuedApplicationsThrottledForRelaunch, "containsObject:", v6) & 1) == 0)
    {
      -[NSMutableArray addObject:](self->_queuedApplicationsThrottledForRelaunch, "addObject:", v6);
      -[SBApplicationAutoLaunchService _scheduleThrottledApplicationRelaunchTimerIfNecessary](self, "_scheduleThrottledApplicationRelaunchTimerIfNecessary");
    }
  }
  else
  {
    -[SBApplicationAutoLaunchService _autoLaunchIfNecessary:forReason:](self, "_autoLaunchIfNecessary:forReason:", v6, 3);
  }

}

- (void)_autoLaunchAppsIfNecessaryAfterFirstUnlock
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];
  uint8_t buf[16];

  if ((-[SBFMobileKeyBag hasBeenUnlockedSinceBoot](self->_keybag, "hasBeenUnlockedSinceBoot") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationAutoLaunchService.m"), 328, CFSTR("Keybag must have been unlocked since boot to enter this function."));

  }
  SBLogAutoLaunching();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "First unlock occured; trying auto launch of necessary applications.",
      buf,
      2u);
  }

  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__SBApplicationAutoLaunchService__autoLaunchAppsIfNecessaryAfterFirstUnlock__block_invoke;
  v12[3] = &unk_1E8E9DED8;
  v12[4] = self;
  v6 = MEMORY[0x1D17E5550](v12);
  v7 = (void *)v6;
  if (self->_autoLaunchSynchronously)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
  else
  {
    v8 = dispatch_time(0, 1000000000);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __76__SBApplicationAutoLaunchService__autoLaunchAppsIfNecessaryAfterFirstUnlock__block_invoke_2;
    v10[3] = &unk_1E8E9E8D0;
    v11 = v7;
    dispatch_after(v8, MEMORY[0x1E0C80D38], v10);

  }
}

void __76__SBApplicationAutoLaunchService__autoLaunchAppsIfNecessaryAfterFirstUnlock__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allApplications", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_autoLaunchIfNecessary:forReason:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), 1);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

uint64_t __76__SBApplicationAutoLaunchService__autoLaunchAppsIfNecessaryAfterFirstUnlock__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_recalculateVoIPBehaviorForApplication:(id)a3 withExitContext:(id)a4
{
  id v7;
  void *v8;
  char v9;
  unint64_t v10;
  char v11;
  char v12;
  unsigned int v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  v7 = a4;
  objc_msgSend(v18, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsLegacyVOIPBackgroundMode");

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationAutoLaunchService.m"), 351, CFSTR("Application must support legacy VOIP to be here."));

  }
  v10 = objc_msgSend(v7, "terminationReason");
  v11 = objc_msgSend(v7, "exitReason");
  v12 = v11;
  v13 = (v10 > 9) | (0x18Du >> v10);
  if ((v11 & 1) != 0)
  {
    objc_msgSend(v7, "underlyingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "legacyCode");

    LOBYTE(v13) = v13 & (v15 != 0);
    if (!(v10 | v12 & 0x10))
    {
      if (!v15)
      {
        v16 = 0;
        LOBYTE(v13) = 0;
        goto LABEL_9;
      }
LABEL_8:
      v16 = objc_msgSend(v18, "failedAutoLaunchCountForVOIP") + 1;
LABEL_9:
      objc_msgSend(v18, "setFailedAutoLaunchCountForVOIP:", v16);
    }
  }
  else if (!(v10 | v11 & 0x10))
  {
    goto LABEL_8;
  }
  if (!-[SBRestartManager isPendingExit](self->_restartManager, "isPendingExit")
    && (v13 & ((unint64_t)objc_msgSend(v18, "failedAutoLaunchCountForVOIP") < 6)) == 0)
  {
    objc_msgSend(v18, "setWantsAutoLaunchForVOIP:", 0);
  }

}

- (void)_noteKeybagDidUnlock
{
  -[SBApplicationAutoLaunchService _autoLaunchAppsIfNecessaryAfterFirstUnlock](self, "_autoLaunchAppsIfNecessaryAfterFirstUnlock");
  -[SBFMobileKeyBag removeObserver:](self->_keybag, "removeObserver:", self);
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SBApplicationAutoLaunchService_keybagDidUnlockForTheFirstTime___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __65__SBApplicationAutoLaunchService_keybagDidUnlockForTheFirstTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteKeybagDidUnlock");
}

- (void)_installedApplicationsDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SBInstalledApplicationsAddedBundleIDs"));
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SBInstalledApplicationsReplacedBundleIDs"));
  v8 = objc_claimAutoreleasedReturnValue();

  if (v6 | v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = v9;
    if (v6)
      objc_msgSend(v9, "unionSet:", v6);
    if (v8)
      objc_msgSend(v10, "unionSet:", v8);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          -[SBApplicationController applicationWithBundleIdentifier:](self->_applicationController, "applicationWithBundleIdentifier:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15), (_QWORD)v17);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            -[SBApplicationAutoLaunchService _autoLaunchIfNecessary:forReason:](self, "_autoLaunchIfNecessary:forReason:", v16, 0);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

  }
}

- (void)_memoryPressureWarn:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  BSDispatchQueueAssertMain();
  SBLogAutoLaunching();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Memory pressure warning; unscheduling queued throttled applications to relaunch.",
      v5,
      2u);
  }

  -[SBApplicationAutoLaunchService _invalidateQueuedApplicationsThrottledForRelaunchTimer](self, "_invalidateQueuedApplicationsThrottledForRelaunchTimer");
}

- (void)_memoryPressureRelieved:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  BSDispatchQueueAssertMain();
  SBLogAutoLaunching();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Memory pressure relieved; scheduling relaunch of queued throttled applications to relaunch if necessary.",
      v5,
      2u);
  }

  -[SBApplicationAutoLaunchService _scheduleThrottledApplicationRelaunchTimerIfNecessary](self, "_scheduleThrottledApplicationRelaunchTimerIfNecessary");
}

- (BOOL)_autoLaunchSynchronously
{
  return self->_autoLaunchSynchronously;
}

- (void)_setAutoLaunchSynchronously:(BOOL)a3
{
  self->_autoLaunchSynchronously = a3;
}

- (NSTimer)_queuedApplicationsThrottledForRelaunchTimer
{
  return self->_queuedApplicationsThrottledForRelaunchTimer;
}

- (NSArray)_queuedApplicationsThrottledForRelaunch
{
  return &self->_queuedApplicationsThrottledForRelaunch->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedApplicationsThrottledForRelaunchTimer, 0);
  objc_storeStrong((id *)&self->_queuedApplicationsThrottledForRelaunch, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
  objc_storeStrong((id *)&self->_restartManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_mainWorkspace, 0);
}

- (void)_shouldAutoLaunchApplication:(void *)a1 forReason:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "Application '%{public}@' has failed to launch too many times. Not relaunching.", (uint8_t *)&v5);

}

- (void)_scheduleAutoLaunchForApplicationExited:(uint64_t)a3 withExitContext:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, a3, "Queueing application for throttled auto launch due to memory-pressure or jetsam exit: %{public}@.", (uint8_t *)&v3);
}

@end
