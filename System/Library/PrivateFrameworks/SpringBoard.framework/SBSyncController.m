@implementation SBSyncController

- (BOOL)isResetting
{
  return (self->_resetState - 1) < 2;
}

+ (SBSyncController)sharedInstance
{
  if (sharedInstance___once_0 != -1)
    dispatch_once(&sharedInstance___once_0, &__block_literal_global_54);
  return (SBSyncController *)(id)sharedInstance___sharedSyncController;
}

- (BOOL)isInUse
{
  return -[SBSyncController isRestoring](self, "isRestoring") || -[SBSyncController isResetting](self, "isResetting");
}

- (BOOL)isRestoring
{
  int restoreState;

  restoreState = self->_restoreState;
  return restoreState == 1 || restoreState == 4;
}

uint64_t __34__SBSyncController_sharedInstance__block_invoke()
{
  SBSyncController *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBSyncController);
  v1 = (void *)sharedInstance___sharedSyncController;
  sharedInstance___sharedSyncController = (uint64_t)v0;

  return kdebug_trace();
}

- (void)dealloc
{
  objc_super v3;

  -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_hideStatusBarAssertion, "invalidate");
  -[SBSyncController stopObserving](self, "stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)SBSyncController;
  -[SBSyncController dealloc](&v3, sel_dealloc);
}

- (void)startObserving
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  uint64_t state64;

  notify_register_dispatch("com.apple.MobileSync.BackupAgent.RestoreStarted", &self->_restoreStartedNotifyToken, MEMORY[0x1E0C80D38], &__block_literal_global_6);
  state64 = 0;
  notify_get_state(self->_restoreStartedNotifyToken, &state64);
  if (state64)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "SB RESTORE: SBRestoreStarted", v8, 2u);
    }

    +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginRestoring");

  }
  v5 = (void *)MEMORY[0x1E0C80D38];
  notify_register_dispatch("com.apple.MobileSync.BackupAgent.kBackupAgentRestoreEnded", &self->_restoreEndedNotifyToken, MEMORY[0x1E0C80D38], &__block_literal_global_9_0);

  objc_msgSend(MEMORY[0x1E0D1F1F8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOberver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__wirelessSyncEnded_, CFSTR("kSBWirelessAppSyncEnded"), 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__wirelessSyncBegan_, CFSTR("kSBWirelessAppSyncBegan"), 0);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__appInstallationNotification, CFSTR("SBInstalledApplicationsDidChangeNotification"), 0);

}

void __34__SBSyncController_startObserving__block_invoke()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  SBLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1D0540000, v0, OS_LOG_TYPE_DEFAULT, "SB RESTORE: SBRestoreStarted", v2, 2u);
  }

  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "beginRestoring");

}

void __34__SBSyncController_startObserving__block_invoke_8()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  SBLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1D0540000, v0, OS_LOG_TYPE_DEFAULT, "SB RESTORE: SBRestoreEnded", v2, 2u);
  }

  +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_didEndRestoring:", 2);

}

- (void)stopObserving
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D1F1F8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  notify_cancel(self->_restoreStartedNotifyToken);
  notify_cancel(self->_restoreEndedNotifyToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)finishedTerminatingApplications
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("SBResetOrRestoreStateDidChangeNotification"), self);

  +[SBSyncController cancelPreviousPerformRequestsWithTarget:selector:object:](SBSyncController, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_finishedTerminatingApplications, 0);
  -[SBSyncController _notifyRestoreCanProceed](self, "_notifyRestoreCanProceed");
}

- (int)restoreState
{
  return self->_restoreState;
}

- (void)beginRestoring
{
  NSObject *v3;
  int restoreState;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    restoreState = self->_restoreState;
    v11[0] = 67109120;
    v11[1] = restoreState;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "SB RESTORE: beginRestoring %d", (uint8_t *)v11, 8u);
  }

  if (!self->_restoreState)
  {
    +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSyncController _setRestoreState:](self, "_setRestoreState:", 1);
    -[SBSyncController _setupRestoreTimer](self, "_setupRestoreTimer");
    objc_msgSend(MEMORY[0x1E0D229A0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prepareDisplaysForExit");

    +[SBMainStatusBarStateProvider sharedInstance](SBMainStatusBarStateProvider, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTelephonyAndBluetoothItemsCloaked:", 1);

    objc_msgSend(v5, "disconnectAllCalls");
    +[SBAirplaneModeController sharedInstance](SBAirplaneModeController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInAirplaneMode:", 0);

    if (objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode"))
    {
      objc_msgSend(MEMORY[0x1E0CEAC08], "webClips");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      objc_msgSend(v10, "makeObjectsPerformSelector:", sel_removeFromDisk);
    }
    objc_msgSend(v5, "setNetworkRegistrationEnabled:", 0);
    -[SBSyncController _killApplicationsIfNecessary](self, "_killApplicationsIfNecessary");

  }
}

- (void)cancelRestoring
{
  NSObject *v3;
  int restoreState;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    restoreState = self->_restoreState;
    v5[0] = 67109120;
    v5[1] = restoreState;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "SB RESTORE: cancelRestoring %d", (uint8_t *)v5, 8u);
  }

  -[SBSyncController _setRestoreState:](self, "_setRestoreState:", 3);
}

- (int)resetState
{
  return self->_resetState;
}

- (void)resetService:(id)a3 willBeginDataResetWithMode:(int64_t)a4
{
  NSObject *v5;
  uint8_t buf[4];
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogDataReset();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = a4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Received willBeginDataResetWithMode:%ld in springboard", buf, 0xCu);
  }

  BSDispatchMain();
}

void __60__SBSyncController_resetService_willBeginDataResetWithMode___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v1 + 12))
  {
    *(_DWORD *)(v1 + 12) = 1;
    objc_msgSend(MEMORY[0x1E0D229A0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "prepareDisplaysForExit");

    +[SBMainStatusBarStateProvider sharedInstance](SBMainStatusBarStateProvider, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTelephonyAndBluetoothItemsCloaked:", 1);

    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
    {
      SBLogDataReset();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Hiding the status bar", buf, 2u);
      }

      +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay](SBWindowSceneStatusBarManager, "windowSceneStatusBarManagerForEmbeddedDisplay");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "assertionManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), "-[SBSyncController resetService:willBeginDataResetWithMode:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", 1, 9, v8);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 64);
      *(_QWORD *)(v10 + 64) = v9;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "acquire");
    }
    SBLogDataReset();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Disabling the idle timer", v17, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_idleTimerCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 32);
    objc_msgSend(v14, "_idleTimerBehavior");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v13, "idleTimerProvider:didProposeBehavior:forReason:", v14, v15, CFSTR("SBSyncControllerReset"));

  }
}

- (void)resetService:(id)a3 didBeginDataResetWithMode:(int64_t)a4
{
  NSObject *v5;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogDataReset();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Received didBeginDataResetWithMode:%ld in springboard", (uint8_t *)&v6, 0xCu);
  }

}

- (void)resetService:(id)a3 didCompleteDataResetMode:(int64_t)a4 withError:(id)a5 completion:(id)a6
{
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a6;
  SBLogDataReset();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a4;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Received didCompleteDataResetMode:%ld in springboard", buf, 0xCu);
  }

  v9 = v7;
  BSDispatchMain();

}

uint64_t __79__SBSyncController_resetService_didCompleteDataResetMode_withError_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t result;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = 2;
  objc_msgSend(*(id *)(a1 + 32), "_idleTimerCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "_idleTimerBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "idleTimerProvider:didProposeBehavior:forReason:", v3, v4, CFSTR("SBSyncControllerReset"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SBResetOrRestoreStateDidChangeNotification"), *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_setRestoreState:(int)a3
{
  SBFAuthenticationAssertion *disableDeviceLockAssertion;
  void *v5;
  SBFAuthenticationAssertion *v6;
  SBFAuthenticationAssertion *v7;
  SBFAuthenticationAssertion *v8;
  SBWindowSceneStatusBarSettingsAssertion *hideStatusBarAssertion;
  id v10;

  if (self->_restoreState != a3)
  {
    self->_restoreState = a3;
    disableDeviceLockAssertion = self->_disableDeviceLockAssertion;
    if (a3 == 1)
    {
      if (!disableDeviceLockAssertion)
      {
        objc_msgSend((id)SBApp, "authenticationController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "createKeybagUnlockAssertionWithReason:", CFSTR("Sync restore or reset"));
        v6 = (SBFAuthenticationAssertion *)objc_claimAutoreleasedReturnValue();
        v7 = self->_disableDeviceLockAssertion;
        self->_disableDeviceLockAssertion = v6;

        -[SBFAuthenticationAssertion activate](self->_disableDeviceLockAssertion, "activate");
      }
    }
    else
    {
      -[SBFAuthenticationAssertion invalidate](disableDeviceLockAssertion, "invalidate");
      v8 = self->_disableDeviceLockAssertion;
      self->_disableDeviceLockAssertion = 0;

      -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_hideStatusBarAssertion, "invalidate");
      hideStatusBarAssertion = self->_hideStatusBarAssertion;
      self->_hideStatusBarAssertion = 0;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("SBITunesRestoreStateDidChangeNotification"), 0);

  }
}

- (void)_syncSessionDidBegin
{
  self->_isAppSyncing = 1;
}

- (void)_syncSessionDidEnd
{
  dispatch_time_t v3;
  _QWORD block[5];

  *(_WORD *)&self->_isAppSyncing = 256;
  v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SBSyncController__syncSessionDidEnd__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

void __38__SBSyncController__syncSessionDidEnd__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = 0;
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 40))
  {
    if (!*(_BYTE *)(v1 + 72))
    {
      *(_BYTE *)(v1 + 40) = 0;
      v2 = objc_alloc_init(MEMORY[0x1E0DAF648]);
      objc_msgSend(v2, "start");

    }
  }
}

- (void)_notifyRestoreCanProceed
{
  NSObject *v3;
  int restoreState;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    restoreState = self->_restoreState;
    v5[0] = 67109120;
    v5[1] = restoreState;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "SB RESTORE: _notifyRestoreCanProceed %d", (uint8_t *)v5, 8u);
  }

  notify_post("com.apple.SpringBoard.ReadyForRestore");
}

- (void)_killApplicationsIfNecessary
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[16];
  _QWORD v13[6];
  _QWORD v14[3];
  char v15;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  v2 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__SBSyncController__killApplicationsIfNecessary__block_invoke;
  v13[3] = &unk_1E8E9DFA0;
  v13[4] = self;
  v13[5] = v14;
  v3 = (void *)MEMORY[0x1D17E5550](v13, a2);
  SBLogDataReset();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Start killing all applications", buf, 2u);
  }

  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __48__SBSyncController__killApplicationsIfNecessary__block_invoke_40;
  v10[3] = &unk_1E8E9F1C0;
  v5 = v3;
  v11 = v5;
  SBWorkspaceTerminateAllApps(5, 0, CFSTR("device reset"), v10);
  v6 = dispatch_time(0, 4000000000);
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __48__SBSyncController__killApplicationsIfNecessary__block_invoke_42;
  v8[3] = &unk_1E8E9E8D0;
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x1E0C80D38], v8);

  _Block_object_dispose(v14, 8);
}

uint64_t __48__SBSyncController__killApplicationsIfNecessary__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return objc_msgSend(*(id *)(result + 32), "finishedTerminatingApplications");
  }
  return result;
}

uint64_t __48__SBSyncController__killApplicationsIfNecessary__block_invoke_40(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogDataReset();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Completed killing all applications", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__SBSyncController__killApplicationsIfNecessary__block_invoke_42(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogDataReset();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Killing all applications watchdog fired: continuing anyway.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_rebootNow
{
  void *v2;
  id v3;

  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNetworkRegistrationEnabled:", 1);

  objc_msgSend((id)SBApp, "restartManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rebootForReason:", CFSTR("ResetOrRestoreComplete"));

}

- (void)_didEndRestoring:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  SBRestoreFailureAlertItem *v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD block[5];
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v3 = *(_QWORD *)&a3;
  v13 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v12 = v3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SB RESTORE: didEndRestoring %d", buf, 8u);
  }

  -[SBSyncController _setRestoreState:](self, "_setRestoreState:", v3);
  -[SBSyncController _invalidateRestoreTimer](self, "_invalidateRestoreTimer");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("SBResetOrRestoreStateDidChangeNotification"), self);

  if ((_DWORD)v3 == 4)
  {
    v7 = objc_alloc_init(SBRestoreFailureAlertItem);
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateAlertItem:", v7);

  }
  else
  {
    v9 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__SBSyncController__didEndRestoring___block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = self;
    dispatch_after(v9, MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __37__SBSyncController__didEndRestoring___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rebootNow");
}

- (void)_delayedQuitApplications
{
  id v2;

  -[SBSyncController _killApplicationsIfNecessary](self, "_killApplicationsIfNecessary");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("com.apple.springboard.reset-ready"), 0);

}

- (void)_invalidateRestoreTimer
{
  NSTimer *restoreTimer;

  restoreTimer = self->_restoreTimer;
  self->_restoreTimer = 0;

}

- (BOOL)_isBackupAgentRunning
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  size_t size;
  int v24[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)v24 = xmmword_1D0E88CA0;
  v25 = 0;
  size = 0;
  if (sysctl(v24, 3u, 0, &size, 0, 0))
  {
    SBLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[SBSyncController _isBackupAgentRunning].cold.2(v2, v3, v4, v5, v6, v7, v8, v9);
    v10 = 0;
LABEL_8:

LABEL_9:
    v18 = 0;
    goto LABEL_10;
  }
  v10 = (char *)malloc_type_malloc(size, 0xC5580565uLL);
  if (sysctl(v24, 3u, v10, &size, 0, 0))
  {
    SBLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[SBSyncController _isBackupAgentRunning].cold.1(v2, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_8;
  }
  v20 = (int)size / 0x288uLL;
  if ((int)v20 < 1)
    goto LABEL_9;
  v21 = 0;
  v22 = 648 * v20;
  while (*(int *)&v10[v21 + 40] < 1 || !strstr(&v10[v21 + 243], "BackupAgent"))
  {
    v21 += 648;
    if (v22 == v21)
      goto LABEL_9;
  }
  v18 = 1;
LABEL_10:
  free(v10);
  return v18;
}

- (void)_restoreTimerFired:(id)a3
{
  id v4;
  int restoreTimerState;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  restoreTimerState = self->_restoreTimerState;
  if (restoreTimerState == 1)
  {
    v7 = -[SBSyncController _isBackupAgentRunning](self, "_isBackupAgentRunning");
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SB RESTORE: BackupAgent restarted", v11, 2u);
      }

      self->_restoreTimerState = 0;
    }
    else
    {
      if (v9)
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SB RESTORE: BackupAgent failed", v10, 2u);
      }

      self->_restoreTimerState = 2;
      -[SBSyncController _didEndRestoring:](self, "_didEndRestoring:", 4);
    }
  }
  else if (!restoreTimerState && !-[SBSyncController _isBackupAgentRunning](self, "_isBackupAgentRunning"))
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "SB RESTORE: BackupAgent not running", buf, 2u);
    }

    self->_restoreTimerState = 1;
  }

}

- (void)_setupRestoreTimer
{
  NSTimer *v3;
  NSTimer *restoreTimer;

  self->_restoreTimerState = 0;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__restoreTimerFired_, 0, 1, 5.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  restoreTimer = self->_restoreTimer;
  self->_restoreTimer = v3;

}

- (void)_appInstallationNotification
{
  BOOL v2;

  v2 = self->_appsChangedDuringSync || self->_isAppSyncing || self->_inExtendedAppSyncCoalescePeriod;
  self->_appsChangedDuringSync = v2;
}

- (id)_idleTimerBehavior
{
  if (-[SBSyncController isResetting](self, "isResetting"))
    +[SBIdleTimerBehavior disabledBehavior](SBIdleTimerBehavior, "disabledBehavior");
  else
    +[SBIdleTimerBehavior defaultBehavior](SBIdleTimerBehavior, "defaultBehavior");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SBIdleTimerCoordinating)_idleTimerCoordinator
{
  return (SBIdleTimerCoordinating *)objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
}

- (void)_setIdleTimerCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_idleTimerCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_hideStatusBarAssertion, 0);
  objc_storeStrong((id *)&self->_disableDeviceLockAssertion, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_restoreTimer, 0);
}

- (void)_isBackupAgentRunning
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "SB RESTORE: Error obtaining process list size", a5, a6, a7, a8, 0);
}

@end
