@implementation SBCarDoNotDisturbController

- (SBCarDoNotDisturbController)init
{
  id v3;
  void *v4;
  SBCarDoNotDisturbController *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D0D320]);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBCarDoNotDisturbController initWithCARAutomaticDNDStatus:lockScreenManager:](self, "initWithCARAutomaticDNDStatus:lockScreenManager:", v3, v4);

  return v5;
}

- (SBCarDoNotDisturbController)initWithCARAutomaticDNDStatus:(id)a3 lockScreenManager:(id)a4
{
  id v8;
  id v9;
  SBCarDoNotDisturbController *v10;
  SBCarDoNotDisturbController *v11;
  void *v12;
  uint64_t v13;
  OS_dispatch_queue *queue;
  CARAutomaticDNDStatus *carAutomaticDNDStatus;
  uint64_t v16;
  SBCarDoNotDisturbController *v17;
  CARAutomaticDNDStatus *v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location;
  _QWORD v25[4];
  SBCarDoNotDisturbController *v26;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCarDoNotDisturbController.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("carAutomaticDNDStatus"));

  }
  v27.receiver = self;
  v27.super_class = (Class)SBCarDoNotDisturbController;
  v10 = -[SBCarDoNotDisturbController init](&v27, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_carAutomaticDNDStatus, a3);
    objc_storeStrong((id *)&v11->_lockScreenManager, a4);
    objc_msgSend(MEMORY[0x1E0D01760], "serial");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = BSDispatchQueueCreate();
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    carAutomaticDNDStatus = v11->_carAutomaticDNDStatus;
    v16 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke;
    v25[3] = &unk_1E8EA2B20;
    v17 = v11;
    v26 = v17;
    -[CARAutomaticDNDStatus fetchAutomaticDNDExitConfirmationWithReply:](carAutomaticDNDStatus, "fetchAutomaticDNDExitConfirmationWithReply:", v25);
    objc_initWeak(&location, v17);
    v18 = v11->_carAutomaticDNDStatus;
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_31;
    v22[3] = &unk_1E8EA1F50;
    objc_copyWeak(&v23, &location);
    -[CARAutomaticDNDStatus setExitConfirmationChangeObserver:](v18, "setExitConfirmationChangeObserver:", v22);
    -[SBLockScreenManager coverSheetViewController](v11->_lockScreenManager, "coverSheetViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerExternalLockProvider:", v17);
    objc_msgSend(v19, "registerExternalEventHandler:", v17);
    objc_msgSend(v19, "registerExternalBehaviorProvider:", v17);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return v11;
}

void __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  _QWORD *v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  char v19;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogDoNotDisturbWhileDriving();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_cold_1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("Not Required");
      if (a2)
        v14 = CFSTR("Required");
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "fetched car automatic DnD exit-confirmation status: %@", buf, 0xCu);
    }

    v15 = *(_QWORD **)(a1 + 32);
    v16 = v15[1];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_28;
    v17[3] = &unk_1E8E9F508;
    v18 = v15;
    v19 = a2;
    dispatch_async(v16, v17);
    v7 = v18;
  }

}

_BYTE *__79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_28(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[16])
    return (_BYTE *)objc_msgSend(result, "_queue_setExitConfirmationRequired:", *(unsigned __int8 *)(a1 + 40));
  return result;
}

void __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_31(uint64_t a1, int a2)
{
  NSObject *v4;
  _QWORD *WeakRetained;
  NSObject *v6;
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  char v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogDoNotDisturbWhileDriving();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v12 = a2;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "car automatic DnD exit-confirmation state update received, new state: %{BOOL}u", buf, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained[1];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_32;
  v8[3] = &unk_1E8E9F508;
  v9 = WeakRetained;
  v10 = a2;
  v7 = WeakRetained;
  dispatch_async(v6, v8);

}

uint64_t __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_32(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setExitConfirmationRequired:", *(unsigned __int8 *)(a1 + 40));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CARAutomaticDNDStatus setExitConfirmationChangeObserver:](self->_carAutomaticDNDStatus, "setExitConfirmationChangeObserver:", 0);
  -[SBLockScreenManager coverSheetViewController](self->_lockScreenManager, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterExternalLockProvider:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBCarDoNotDisturbController;
  -[SBCarDoNotDisturbController dealloc](&v4, sel_dealloc);
}

- (BOOL)showPasscode
{
  return 0;
}

- (BOOL)unlockFromSource:(int)a3
{
  _BOOL4 v5;
  SBCarDoNotDisturbExitConfirmationAlertItem *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  SBCarDoNotDisturbController *v16;
  id v17;
  int v18;
  id location;

  v5 = -[SBCarDoNotDisturbController _shouldExitConfirmationBeEnforced](self, "_shouldExitConfirmationBeEnforced");
  if (v5)
  {
    v6 = objc_alloc_init(SBCarDoNotDisturbExitConfirmationAlertItem);
    objc_initWeak(&location, v6);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke;
    v15 = &unk_1E8EB6E08;
    objc_copyWeak(&v17, &location);
    v16 = self;
    v18 = a3;
    -[SBCarDoNotDisturbExitConfirmationAlertItem setNotDrivingActionHandler:](v6, "setNotDrivingActionHandler:", &v12);
    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager", v12, v13, v14, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "policyAggregator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "allowsCapability:", 4)
      && objc_msgSend(MEMORY[0x1E0DA7A00], "shouldShowCarDNDUseSiriHeaderViewController"))
    {
      v9 = -[SBCarDoNotDisturbController _hasShownSiriHeaderViewControllerDuringCurrentCarDNDSession](self, "_hasShownSiriHeaderViewControllerDuringCurrentCarDNDSession");

      if (!v9)
      {
        -[SBCarDoNotDisturbExitConfirmationAlertItem setShowSiriHeaderViewController:](v6, "setShowSiriHeaderViewController:", 1);
        -[SBCarDoNotDisturbController _setHasShownSiriHeaderViewControllerDuringCurrentCarDNDSession:](self, "_setHasShownSiriHeaderViewControllerDuringCurrentCarDNDSession:", 1);
      }
    }
    else
    {

    }
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activateAlertItem:", v6);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return !v5;
}

void __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int v11;
  uint8_t buf[16];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v2 = _os_activity_create(&dword_1D0540000, "deactivate car automatic DnD", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &state);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(WeakRetained, "showSiriHeaderViewController"))
    v4 = (id)*MEMORY[0x1E0DA7A10];
  else
    v4 = 0;
  SBLogDoNotDisturbWhileDriving();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "requesting end of car automatic DnD", buf, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_37;
  v9[3] = &unk_1E8EB6DE0;
  v9[4] = v6;
  v8 = WeakRetained;
  v10 = v8;
  v11 = *(_DWORD *)(a1 + 48);
  objc_msgSend(v7, "disableDNDUntilEndOfDriveWithContext:reply:", v4, v9);

  os_activity_scope_leave(&state);
}

void __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_37(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id *v10;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  _QWORD v24[2];
  int v25;
  uint8_t buf[16];

  v5 = a3;
  SBLogDoNotDisturbWhileDriving();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "succeeded in ending car automatic DnD", buf, 2u);
    }

    v8 = *(void **)(a1 + 40);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_38;
    v23[3] = &unk_1E8EA2E30;
    v10 = (id *)v24;
    v11 = v8;
    v12 = *(_QWORD *)(a1 + 32);
    v24[0] = v11;
    v24[1] = v12;
    v25 = *(_DWORD *)(a1 + 48);
    v13 = v23;
    v14 = v9;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_37_cold_1((uint64_t)v5, v7, v15, v16, v17, v18, v19, v20);

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_40;
    v21[3] = &unk_1E8E9DED8;
    v10 = &v22;
    v22 = *(id *)(a1 + 40);
    v14 = MEMORY[0x1E0C80D38];
    v13 = v21;
  }
  dispatch_async(v14, v13);

}

void __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_38(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD block[4];
  id v5;
  uint64_t v6;
  int v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_2;
  block[3] = &unk_1E8EA2E30;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  v7 = *(_DWORD *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(a1 + 40), "_queue_setExitConfirmationRequired:", 0);

}

void __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "coverSheetViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1BB48], "actionWithType:", 9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleAction:fromSender:", v2, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "unlockUIFromSource:withOptions:", *(unsigned int *)(a1 + 48), 0);
}

uint64_t __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateForButton");
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v9[16];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  if (v5 == 24)
  {
    -[SBCarDoNotDisturbController _setScreenOn:](self, "_setScreenOn:", 1);
  }
  else if (v5 == 25)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v6 = _os_activity_create(&dword_1D0540000, "deactivate car automatic DnD alert item (screen off)", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &state);

    if (-[SBCarDoNotDisturbController _dismissAlertItemsAnimated:](self, "_dismissAlertItemsAnimated:", 0))
    {
      SBLogDoNotDisturbWhileDriving();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "deactivated car automatic DnD alert item because screen turned off", v9, 2u);
      }

    }
    -[SBCarDoNotDisturbController _setScreenOn:](self, "_setScreenOn:", 0);
    os_activity_scope_leave(&state);
  }

  return 0;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  if (-[SBCarDoNotDisturbController _isExitConfirmationRequired](self, "_isExitConfirmationRequired"))
    return 10485956;
  else
    return 0;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (void)_setScreenOn:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SBCarDoNotDisturbController__setScreenOn___block_invoke;
  v4[3] = &unk_1E8E9F508;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __44__SBCarDoNotDisturbController__setScreenOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setScreenOn:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_queue_setScreenOn:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];

  if (self->_queue_screenOn != a3)
  {
    self->_queue_screenOn = a3;
    if (!a3 && self->_queue_pendingExitConfirmationRequirement)
    {
      SBLogDoNotDisturbWhileDriving();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "enabling exit-confirmation requirement due to screen-off", v5, 2u);
      }

      -[SBCarDoNotDisturbController _queue_setExitConfirmationRequired:](self, "_queue_setExitConfirmationRequired:", 1);
    }
  }
}

- (BOOL)_dismissAlertItemsAnimated:(BOOL)a3
{
  uint64_t v3;
  void *v4;

  v3 = a3;
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "deactivateAlertItemsOfClass:reason:animated:", objc_opt_class(), 5, v3);

  return v3;
}

- (void)_queue_setExitConfirmationRequired:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 queue_exitConfirmationRequired;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssert();
  self->_queue_pendingExitConfirmationRequirement = 0;
  if (v3)
    self->_queue_hasShownSiriHeaderViewControllerDuringCurrentCarDNDSession = 0;
  SBLogDoNotDisturbWhileDriving();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    queue_exitConfirmationRequired = self->_queue_exitConfirmationRequired;
    *(_DWORD *)buf = 67109376;
    v10 = v3;
    v11 = 1024;
    v12 = queue_exitConfirmationRequired;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "setting internal car automatic DnD exit-confirmation flag to %{BOOL}u (was %{BOOL}u)", buf, 0xEu);
  }

  self->_queue_stateValid = 1;
  if (self->_queue_exitConfirmationRequired != v3)
  {
    if (self->_queue_screenOn && v3)
    {
      SBLogDoNotDisturbWhileDriving();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "deferring exit-confirmation requirement until screen off", buf, 2u);
      }

      self->_queue_pendingExitConfirmationRequirement = 1;
    }
    else
    {
      self->_queue_exitConfirmationRequired = v3;
      if (!v3)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __66__SBCarDoNotDisturbController__queue_setExitConfirmationRequired___block_invoke;
        block[3] = &unk_1E8E9DED8;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
      BSDispatchMain();
    }
  }
}

void __66__SBCarDoNotDisturbController__queue_setExitConfirmationRequired___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v2 = _os_activity_create(&dword_1D0540000, "deactivate car automatic DnD alert item (exit-confirmation off)", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &state);

  if (objc_msgSend(*(id *)(a1 + 32), "_dismissAlertItemsAnimated:", 1))
  {
    SBLogDoNotDisturbWhileDriving();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "deactivated car automatic DnD alert item because exit-confirmation no longer required", v4, 2u);
    }

  }
  os_activity_scope_leave(&state);
}

void __66__SBCarDoNotDisturbController__queue_setExitConfirmationRequired___block_invoke_44(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void (**v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "coverSheetViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __66__SBCarDoNotDisturbController__queue_setExitConfirmationRequired___block_invoke_2;
  v9 = &unk_1E8E9E820;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v4;
  v5 = (void (**)(_QWORD))MEMORY[0x1D17E5550](&v6);
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldExitConfirmationBeEnforced", v6, v7, v8, v9))
    objc_msgSend(v3, "activateMainPageWithCompletion:", v5);
  else
    v5[2](v5);

}

uint64_t __66__SBCarDoNotDisturbController__queue_setExitConfirmationRequired___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "externalBehaviorProviderBehaviorChanged:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "externalLockProviderStateChanged:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_isExitConfirmationRequired
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SBCarDoNotDisturbController__isExitConfirmationRequired__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__SBCarDoNotDisturbController__isExitConfirmationRequired__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 17);
  return result;
}

- (BOOL)_shouldExitConfirmationBeEnforced
{
  _BOOL4 v3;

  v3 = -[SBCarDoNotDisturbController _isExitConfirmationRequired](self, "_isExitConfirmationRequired");
  if (v3)
    LOBYTE(v3) = -[SBLockScreenManager isLockScreenVisible](self->_lockScreenManager, "isLockScreenVisible");
  return v3;
}

- (void)_setHasShownSiriHeaderViewControllerDuringCurrentCarDNDSession:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __94__SBCarDoNotDisturbController__setHasShownSiriHeaderViewControllerDuringCurrentCarDNDSession___block_invoke;
  v4[3] = &unk_1E8E9F508;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __94__SBCarDoNotDisturbController__setHasShownSiriHeaderViewControllerDuringCurrentCarDNDSession___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 20) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)_hasShownSiriHeaderViewControllerDuringCurrentCarDNDSession
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__SBCarDoNotDisturbController__hasShownSiriHeaderViewControllerDuringCurrentCarDNDSession__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __90__SBCarDoNotDisturbController__hasShownSiriHeaderViewControllerDuringCurrentCarDNDSession__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 20);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_carAutomaticDNDStatus, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __79__SBCarDoNotDisturbController_initWithCARAutomaticDNDStatus_lockScreenManager___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "failed to fetch car automatic DnD exit-confirmation status with error %@", a5, a6, a7, a8, 2u);
}

void __48__SBCarDoNotDisturbController_unlockFromSource___block_invoke_37_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "failed to disable car automatic DnD with error %@", a5, a6, a7, a8, 2u);
}

@end
