@implementation SBTestAutomationService

- (SBTestAutomationService)init
{
  SBTestAutomationService *v2;
  uint64_t v3;
  FBServiceClientAuthenticator *clientAuthenticator;
  uint64_t v5;
  NSHashTable *inFlightAnimationTransactions;
  NSHashTable *reachabilityEnabledAssertions;
  BSInvalidatable *idleTimerAssertion;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBTestAutomationService;
  v2 = -[SBTestAutomationService init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.testautomation"));
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 0);
    v5 = objc_claimAutoreleasedReturnValue();
    inFlightAnimationTransactions = v2->_inFlightAnimationTransactions;
    v2->_inFlightAnimationTransactions = (NSHashTable *)v5;

    reachabilityEnabledAssertions = v2->_reachabilityEnabledAssertions;
    v2->_reachabilityEnabledAssertions = 0;

    idleTimerAssertion = v2->_idleTimerAssertion;
    v2->_idleTimerAssertion = 0;

    +[SBSystemServiceServer sharedInstance](SBSystemServiceServer, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTestAutomationDelegate:", v2);

  }
  return v2;
}

- (void)systemServiceServer:(id)a3 suspendAllDisplaysForClient:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];

  v5 = a4;
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to suspend all displays", v8, 2u);
  }

  v7 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v5);
  if (v7)
    BSDispatchMain();
}

- (void)systemServiceServer:(id)a3 clearAllUserNotificationsForClient:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];

  v5 = a4;
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to clear all user notifications", v8, 2u);
  }

  v7 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v5);
  if (v7)
    BSDispatchMain();
}

void __82__SBTestAutomationService_systemServiceServer_clearAllUserNotificationsForClient___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lockScreenEnvironment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_opt_class();
  v8 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v8;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "mainPageContentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "combinedListViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_testingClearAllNotificationRequests");

  }
}

- (void)systemServiceServer:(id)a3 setUserPresenceDetectedSinceWakeForClient:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];

  v5 = a4;
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to inject user presence detected", v8, 2u);
  }

  v7 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v5);
  if (v7)
    BSDispatchMain();
}

uint64_t __89__SBTestAutomationService_systemServiceServer_setUserPresenceDetectedSinceWakeForClient___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D1BC60], "synthesizeUserPresenceForReason:", CFSTR("Test Automation"));
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setAlertsEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  _BOOL4 v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v5 = a5;
  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("disable");
    if (v5)
      v9 = CFSTR("enable");
    *(_DWORD *)buf = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ pending alerts", buf, 0xCu);
  }

  v10 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v7);
  if (v10)
    BSDispatchMain();
}

void __71__SBTestAutomationService_systemServiceServer_client_setAlertsEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 32))
  {
    SBLogAlertItems();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Removing all pending alert items and super-modal items from the SBAlertItemsController", v5, 2u);
    }

    objc_msgSend(v2, "_clearAllQueuedAlertItems");
  }
  objc_msgSend(v2, "setForceAlertsToPend:forReason:", *(_BYTE *)(a1 + 32) == 0, CFSTR("SBTestAutomationService client request"));
  if (!*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(v2, "visibleAlertItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v2, "deactivateAlertItem:", v4);

  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setHiddenFeaturesEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  _BOOL4 v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v5 = a5;
  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("disable");
    if (v5)
      v9 = CFSTR("enable");
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ hidden features", (uint8_t *)&v11, 0xCu);
  }

  v10 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v7);
  if (v10)
    BSDispatchMain();
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setIdleTimerEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  _BOOL4 v10;
  BSInvalidatable *idleTimerAssertion;
  BSInvalidatable *v12;
  void *v13;
  BSInvalidatable *v14;
  BSInvalidatable *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("disable");
    if (v5)
      v9 = CFSTR("enable");
    *(_DWORD *)buf = 138412290;
    v19 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ the idle timer", buf, 0xCu);
  }

  v10 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v7);
  if (v10)
  {
    idleTimerAssertion = self->_idleTimerAssertion;
    if (v5 && idleTimerAssertion)
    {
      -[BSInvalidatable invalidate](idleTimerAssertion, "invalidate");
      v12 = self->_idleTimerAssertion;
      self->_idleTimerAssertion = 0;
    }
    else
    {
      -[BSInvalidatable invalidate](idleTimerAssertion, "invalidate");
      objc_msgSend(MEMORY[0x1E0D3A8B8], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
      v14 = (BSInvalidatable *)objc_msgSend(v13, "newAssertionToDisableIdleTimerForReason:error:", CFSTR("SBTestAutomationService client request"), &v17);
      v12 = (BSInvalidatable *)v17;
      v15 = self->_idleTimerAssertion;
      self->_idleTimerAssertion = v14;

      if (!self->_idleTimerAssertion)
      {
        SBLogCommon();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[SBTestAutomationService systemServiceServer:client:setIdleTimerEnabled:].cold.1();

      }
    }

  }
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setOrientationLockEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  _BOOL4 v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v5 = a5;
  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("unlock");
    if (v5)
      v9 = CFSTR("lock");
    *(_DWORD *)buf = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ the interface orientation", buf, 0xCu);
  }

  v10 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v7);
  if (v10)
    BSDispatchMain();
}

void __80__SBTestAutomationService_systemServiceServer_client_setOrientationLockEnabled___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;
  id v3;

  v1 = *(unsigned __int8 *)(a1 + 32);
  +[SBOrientationLockManager sharedInstance](SBOrientationLockManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
    objc_msgSend(v2, "lock");
  else
    objc_msgSend(v2, "unlock");

}

- (void)systemServiceServer:(id)a3 client:(id)a4 setMallocStackLoggingEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  _BOOL4 v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v5 = a5;
  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("disable");
    if (v5)
      v9 = CFSTR("enable");
    v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ Malloc Stack Logging", (uint8_t *)&v11, 0xCu);
  }

  v10 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v7);
  if (v10)
    msl_turn_on_stack_logging();
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setReachabilityActive:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  _BOOL4 v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v5 = a5;
  v13 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("deactivate");
    if (v5)
      v9 = CFSTR("activate");
    *(_DWORD *)buf = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ reachability", buf, 0xCu);
  }

  v10 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v7);
  if (v10)
    BSDispatchMain();
}

void __76__SBTestAutomationService_systemServiceServer_client_setReachabilityActive___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(a1 + 32))
  {
    if ((objc_msgSend(v2, "reachabilityModeActive") & 1) == 0)
    {
      if (objc_msgSend(v3, "canActivateReachability"))
      {
        objc_msgSend(v3, "toggleReachability");
      }
      else
      {
        SBLogCommon();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v5 = 0;
          _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Unable to activate reachability because the manager rejected the request. Perhaps reachability isn't enabled, the device isn't in portrait, or reachability is temporarily disabled.", v5, 2u);
        }

      }
    }
  }
  else
  {
    objc_msgSend(v2, "deactivateReachability");
  }

}

- (void)systemServiceServer:(id)a3 client:(id)a4 port:(id)a5 acquireAssertionForReachabilityEnabled:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  const __CFString *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v6 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "processHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v9, "processHandle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(v9, "description");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v18;

  }
  SBLogCommon();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = CFSTR("disable");
    if (v6)
      v20 = CFSTR("enable");
    *(_DWORD *)buf = 138412546;
    v24 = v14;
    v25 = 2112;
    v26 = v20;
    _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received request from client %@ to acquire an assertion to %@ reachability", buf, 0x16u);
  }

  if (-[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v9))
  {
    v21 = v14;
    v22 = v10;
    BSDispatchMain();

  }
}

void __98__SBTestAutomationService_systemServiceServer_client_port_acquireAssertionForReachabilityEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  char v21;
  _QWORD v22[4];
  id v23;
  id v24;
  char v25;
  id location;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBTestAutomationService request from client %@"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 56);
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setReachabilityTemporarilyEnabled:forReason:", 1, v2);
  else
    objc_msgSend(v4, "setReachabilityTemporarilyDisabled:forReason:", 1, v2);

  objc_initWeak(&location, *(id *)(a1 + 40));
  v6 = objc_alloc(MEMORY[0x1E0D01868]);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __98__SBTestAutomationService_systemServiceServer_client_port_acquireAssertionForReachabilityEnabled___block_invoke_2;
  v22[3] = &unk_1E8EA7F20;
  v25 = *(_BYTE *)(a1 + 56);
  v9 = v2;
  v23 = v9;
  objc_copyWeak(&v24, &location);
  v10 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", v7, v9, v22);
  v11 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(v13 + 24);
    *(_QWORD *)(v13 + 24) = v12;

    v11 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  }
  objc_msgSend(v11, "addObject:", v10);
  v15 = (void *)MEMORY[0x1E0D01810];
  v16 = *(_QWORD *)(a1 + 48);
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __98__SBTestAutomationService_systemServiceServer_client_port_acquireAssertionForReachabilityEnabled___block_invoke_3;
  v18[3] = &unk_1E8E9EE00;
  v19 = *(id *)(a1 + 32);
  v21 = *(_BYTE *)(a1 + 56);
  v17 = v10;
  v20 = v17;
  objc_msgSend(v15, "monitorSendRight:withHandler:", v16, v18);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

void __98__SBTestAutomationService_systemServiceServer_client_port_acquireAssertionForReachabilityEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id *WeakRetained;
  id *v8;
  id v9;

  v9 = a2;
  v3 = *(unsigned __int8 *)(a1 + 48);
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  if (v3)
    objc_msgSend(v4, "setReachabilityTemporarilyEnabled:forReason:", 0, v6);
  else
    objc_msgSend(v4, "setReachabilityTemporarilyDisabled:forReason:", 0, v6);

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[3], "removeObject:", v9);

}

void __98__SBTestAutomationService_systemServiceServer_client_port_acquireAssertionForReachabilityEnabled___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  BSDispatchMain();

}

uint64_t __98__SBTestAutomationService_systemServiceServer_client_port_acquireAssertionForReachabilityEnabled___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFString *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = CFSTR("enabling");
    if (!*(_BYTE *)(a1 + 48))
      v4 = CFSTR("disabling");
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] client %@ invalidated; relinquishing reachability %@ assertion.",
      (uint8_t *)&v6,
      0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setAmbientPresentationState:(int64_t)a5
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", a4))
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((unint64_t)a5 > 2)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SBTestAutomationService systemServiceServer:client:setAmbientPresentationState:].cold.1();

    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        AMStringForAmbientPresentationState();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v10 = v8;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Setting ambient state to '%@'.", buf, 0xCu);

      }
      BSDispatchMain();
    }
  }
}

void __82__SBTestAutomationService_systemServiceServer_client_setAmbientPresentationState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ambientPresentationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "test_updateAmbientPresentationState:withReason:", *(_QWORD *)(a1 + 32), CFSTR("SBTestAutomationService"));
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setAmbientMountState:(int64_t)a5
{
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", a4))
  {
    if ((unint64_t)a5 > 3 || a5 == 2)
    {
      SBLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SBTestAutomationService systemServiceServer:client:setAmbientMountState:].cold.1();

    }
    else
    {
      SBLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        AMStringForAmbientMountState();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Setting ambient mount state to '%@'.", buf, 0xCu);

      }
      BSDispatchMain();
    }
  }
}

void __75__SBTestAutomationService_systemServiceServer_client_setAmbientMountState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ambientPresentationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "test_updateAmbientMountState:withReason:", *(_QWORD *)(a1 + 32), CFSTR("SBTestAutomationService"));
}

- (void)systemServiceServer:(id)a3 client:(id)a4 resetToHomeScreenAnimated:(BOOL)a5
{
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  BOOL v13;
  uint8_t buf[16];

  v7 = a4;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to reset to home screen", buf, 2u);
  }

  v9 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v7);
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke;
    v12[3] = &__block_descriptor_33_e5_v8__0l;
    v13 = a5;
    v11 = (void *)MEMORY[0x1D17E5550](v12);
    v10 = v11;
    BSDispatchMain();

  }
}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke(uint64_t a1)
{
  SBLockScreenUnlockRequest *v2;
  void *v3;
  _QWORD v4[4];
  char v5;

  v2 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setSource:](v2, "setSource:", 24);
  -[SBLockScreenUnlockRequest setIntent:](v2, "setIntent:", 1);
  -[SBLockScreenUnlockRequest setName:](v2, "setName:", CFSTR("-[SBTestAutomationService systemServiceServer:client:resetToHomeScreenAnimated:]"));
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_2;
  v4[3] = &__block_descriptor_33_e8_v12__0B8l;
  v5 = *(_BYTE *)(a1 + 32);
  objc_msgSend(v3, "unlockWithRequest:completion:", v2, v4);

}

uint64_t __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  char v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_3;
  v2[3] = &__block_descriptor_33_e8_v12__0B8l;
  v3 = *(_BYTE *)(a1 + 32);
  return SBWorkspaceForceToSpringBoard(v2);
}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_3(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  char v12;

  if (a2)
  {
    SBWorkspaceSuspendActiveDisplay();
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "iconManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootFolderController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "firstIconPageIndex");

    v7 = *(unsigned __int8 *)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_4;
    v9[3] = &unk_1E8EA7F68;
    v12 = v7;
    v10 = v4;
    v11 = v6;
    v8 = v4;
    objc_msgSend(v3, "dismissHomeScreenOverlaysAnimated:completion:", v7, v9);

  }
}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  char v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(unsigned __int8 *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_5;
  v6[3] = &unk_1E8EA5AD8;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  v9 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v4, "dismissSpotlightAnimated:completionHandler:", v3, v6);

}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "rootFolderController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCurrentPageIndex:animated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), &__block_literal_global_55_0);

}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_6()
{
  NSObject *v0;
  uint8_t v1[16];

  SBLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D0540000, v0, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Successfully reset SpringBoard to the home screen!", v1, 2u);
  }

}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_58(uint64_t a1)
{
  SBDismissOverlaysAnimationController *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id location;

  v2 = -[SBDismissOverlaysAnimationController initWithTransitionContextProvider:options:]([SBDismissOverlaysAnimationController alloc], "initWithTransitionContextProvider:options:", 0, -1);
  objc_initWeak(&location, v2);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_2_60;
  v7 = &unk_1E8EA7FB0;
  v3 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  objc_copyWeak(&v10, &location);
  -[SBDismissOverlaysAnimationController setCompletionBlock:](v2, "setCompletionBlock:", &v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v2, v4, v5, v6, v7, v8);
  -[SBDismissOverlaysAnimationController begin](v2, "begin");
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __80__SBTestAutomationService_systemServiceServer_client_resetToHomeScreenAnimated___block_invoke_2_60(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v2, "removeObject:", WeakRetained);

}

- (void)systemServiceServer:(id)a3 client:(id)a4 setAccessoryType:(int64_t)a5 attached:(BOOL)a6
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v6 = a6;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      v10 = CFSTR("attach");
    else
      v10 = CFSTR("detach");
    NSStringFromSBSAccessoryType();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ accessory with type '%@'", buf, 0x16u);

  }
  v12 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v8);

  if (v12)
  {
    if (CSMagSafeAccessoryTypeForSBSAccessoryType())
    {
      BSDispatchMain();
    }
    else
    {
      SBLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SBTestAutomationService systemServiceServer:client:setAccessoryType:attached:].cold.1();

    }
  }
}

void __80__SBTestAutomationService_systemServiceServer_client_setAccessoryType_attached___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[SBUIController sharedInstance](SBUIController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 56))
  {
    if (!v5)
    {
      if (*(_QWORD *)(a1 + 40) == 3)
        objc_msgSend(MEMORY[0x1E0CEA478], "systemBrownColor");
      else
        objc_msgSend(MEMORY[0x1E0CEA478], "systemPinkColor");
      v6 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D1BBE0];
      v13 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CEA478], "systemTealColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessoryWithType:primaryColor:secondaryColor:", v13, v6, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setEndpointUUID:", v17);

      v18 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

        v18 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v15, v22);

      objc_msgSend(v2, "_accessoryEndpointAttached:", v15);
      goto LABEL_16;
    }
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSBSAccessoryType();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v7;
      v8 = "[SBTestAutomationService] Will not attach accessory type '%@' as it is already attached.";
LABEL_11:
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v23, 0xCu);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSBSAccessoryType();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412290;
      v24 = v7;
      v8 = "[SBTestAutomationService] Will not detach accessory type '%@' as it is not currently attached.";
      goto LABEL_11;
    }
LABEL_16:

    goto LABEL_17;
  }
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v11);

  objc_msgSend(v2, "_accessoryEndpointDetached:", v5);
LABEL_17:

}

- (void)systemServiceServer:(id)a3 client:(id)a4 setApplicationBundleIdentifier:(id)a5 blockedForScreenTime:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  _BOOL4 v13;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v6 = a6;
  v19 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a4;
  SBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("unblock");
    if (v6)
      v12 = CFSTR("block");
    *(_DWORD *)buf = 138412546;
    v16 = v12;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to %@ application with bundle identifier '%@' for Screen Time", buf, 0x16u);
  }

  v13 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v10);
  if (v13)
  {
    v14 = v9;
    BSDispatchMain();

  }
}

void __106__SBTestAutomationService_systemServiceServer_client_setApplicationBundleIdentifier_blockedForScreenTime___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBScreenTimeTestRecipe _setApplicationBundleIdentifiers:blockedForScreenTimeExpiration:](SBScreenTimeTestRecipe, "_setApplicationBundleIdentifiers:blockedForScreenTimeExpiration:", v2, *(unsigned __int8 *)(a1 + 40));

}

- (void)systemServiceServer:(id)a3 client:(id)a4 port:(id)a5 acquireHUDHiddenAssertionForIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v9, "processHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(v9, "processHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      objc_msgSend(v9, "description");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v19;

  }
  SBLogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v15;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received request from client %@ to acquire an assertion to hide HUDs with identifier %@", buf, 0x16u);
  }

  if (-[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v9))
  {
    v21 = v15;
    v22 = v11;
    v23 = v10;
    BSDispatchMain();

  }
}

void __98__SBTestAutomationService_systemServiceServer_client_port_acquireHUDHiddenAssertionForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBTestAutomationService request from client %@"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x1E0DAB7E0]))
  {
    objc_msgSend((id)SBApp, "volumeControl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "acquireVolumeHUDHiddenAssertionForReason:", v2);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x1E0DAB7D8]))
      goto LABEL_7;
    objc_msgSend((id)SBApp, "brightnessControl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "acquireBrightnessHUDHiddenAssertionForReason:", v2);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D01810];
    v7 = *(_QWORD *)(a1 + 48);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __98__SBTestAutomationService_systemServiceServer_client_port_acquireHUDHiddenAssertionForIdentifier___block_invoke_77;
    v10[3] = &unk_1E8E9E270;
    v11 = *(id *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    v13 = v5;
    v8 = v5;
    objc_msgSend(v6, "monitorSendRight:withHandler:", v7, v10);

    goto LABEL_9;
  }
LABEL_7:
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] No assertion to obtain for HUD with identifier %@", buf, 0xCu);
  }
LABEL_9:

}

void __98__SBTestAutomationService_systemServiceServer_client_port_acquireHUDHiddenAssertionForIdentifier___block_invoke_77(id *a1)
{
  id v2;
  id v3;
  id v4;

  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[6];
  BSDispatchMain();

}

uint64_t __98__SBTestAutomationService_systemServiceServer_client_port_acquireHUDHiddenAssertionForIdentifier___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] client %@ invalidated; relinquishing an assertion to hide HUDs with identifier %@",
      (uint8_t *)&v6,
      0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 48), "invalidate");
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setTestRunnerRecoveryApplicationBundleIdentifier:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to set the test application recovery identifier to %@", buf, 0xCu);
  }

  v10 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v8);
  if (v10)
  {
    v11 = v7;
    BSDispatchMain();

  }
}

void __103__SBTestAutomationService_systemServiceServer_client_setTestRunnerRecoveryApplicationBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "testingDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTestRunnerRecoveryApplicationBundleIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)systemServiceServer:(id)a3 client:(id)a4 countScenesForBundleIdentifier:(id)a5 withCompletion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  v11 = a4;
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v9;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to set the test application recovery identifier to %@", buf, 0xCu);
  }

  v13 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v11);
  if (v13)
  {
    v14 = v9;
    v15 = v10;
    BSDispatchMain();

  }
}

void __100__SBTestAutomationService_systemServiceServer_client_countScenesForBundleIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __100__SBTestAutomationService_systemServiceServer_client_countScenesForBundleIdentifier_withCompletion___block_invoke_2;
  v4[3] = &unk_1E8EA7FD8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "scenesPassingTest:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v2, "count"));

}

uint64_t __100__SBTestAutomationService_systemServiceServer_client_countScenesForBundleIdentifier_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "clientProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)systemServiceServer:(id)a3 client:(id)a4 stashSwitcherModelToPath:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to stash switcher model state to %@", buf, 0xCu);
  }

  v10 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v8);
  if (v10)
  {
    v11 = v7;
    BSDispatchMain();

  }
}

void __79__SBTestAutomationService_systemServiceServer_client_stashSwitcherModelToPath___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_recentAppLayoutsController");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(v3, "_stashModelToPath:", *(_QWORD *)(a1 + 32));

}

- (void)systemServiceServer:(id)a3 client:(id)a4 loadStashedSwitcherModelFromPath:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to load switcher model state from %@", buf, 0xCu);
  }

  v10 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v8);
  if (v10)
  {
    v11 = v7;
    BSDispatchMain();

  }
}

void __87__SBTestAutomationService_systemServiceServer_client_loadStashedSwitcherModelFromPath___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_recentAppLayoutsController");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(v3, "_loadStashedModelAtPath:", *(_QWORD *)(a1 + 32));

}

- (void)systemServiceServer:(id)a3 addWidgetsToEachPageForClient:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];

  v5 = a4;
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to add a static set of widgets to the home screen.", v8, 2u);
  }

  v7 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v5);
  if (v7)
    BSDispatchMain();
}

void __77__SBTestAutomationService_systemServiceServer_addWidgetsToEachPageForClient___block_invoke()
{
  void *v0;
  id v1;
  id v2;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "addWidgetsToEachPage");

}

- (void)systemServiceServer:(id)a3 client:(id)a4 addWidgetWithIdentifier:(id)a5 toPage:(int64_t)a6 withSizing:(int64_t)a7
{
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v10;
    v17 = 2048;
    v18 = a6;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to add widget with extension identifier '%@' to the Home Screen page '%lu'.", buf, 0x16u);
  }

  v13 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v11);
  if (v13)
  {
    v14 = v10;
    BSDispatchMain();

  }
}

void __96__SBTestAutomationService_systemServiceServer_client_addWidgetWithIdentifier_toPage_withSizing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_iconGridSizeClassFromClientArgument:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(uint64_t *)(a1 + 56) >= 0)
    v4 = *(_QWORD *)(a1 + 56);
  else
    v4 = *MEMORY[0x1E0DAAAA0];
  objc_msgSend(v2, "addWidgetWithIdentifier:toPage:withSizeClass:", *(_QWORD *)(a1 + 40), v4, v3);

}

- (void)systemServiceServer:(id)a3 client:(id)a4 addWidgetStackWithIdentifiers:(id)a5 toPage:(int64_t)a6 withSizing:(int64_t)a7
{
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a4;
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v10;
    v17 = 2048;
    v18 = a6;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to add widget stack with extension identifiers '%@' to the Home Screen page '%lu'.", buf, 0x16u);
  }

  v13 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v11);
  if (v13)
  {
    v14 = v10;
    BSDispatchMain();

  }
}

void __102__SBTestAutomationService_systemServiceServer_client_addWidgetStackWithIdentifiers_toPage_withSizing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_iconGridSizeClassFromClientArgument:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(uint64_t *)(a1 + 56) >= 0)
    v4 = *(_QWORD *)(a1 + 56);
  else
    v4 = *MEMORY[0x1E0DAAAA0];
  objc_msgSend(v5, "addWidgetStackWithIdentifiers:toPage:withSizeClass:", *(_QWORD *)(a1 + 40), v4, v3);

}

- (void)systemServiceServer:(id)a3 enterLostModeForClient:(id)a4
{
  if (-[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", a4))
    BSDispatchMain();
}

void __70__SBTestAutomationService_systemServiceServer_enterLostModeForClient___block_invoke()
{
  id v0;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "activateLostModeForRemoteLock:", 0);

}

- (void)systemServiceServer:(id)a3 exitLostModeForClient:(id)a4
{
  if (-[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", a4))
    BSDispatchMain();
}

void __69__SBTestAutomationService_systemServiceServer_exitLostModeForClient___block_invoke()
{
  id v0;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "exitLostModeIfNecessaryFromRemoteRequest:", 1);

}

- (void)systemServiceServer:(id)a3 client:(id)a4 getIsChamoisWindowingUIEnabledWithCompletion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint8_t buf[16];

  v7 = a5;
  v8 = a4;
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to get Chamois windowing enabled state", buf, 2u);
  }

  v10 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v8);
  if (v10)
  {
    v11 = v7;
    BSDispatchMain();

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __99__SBTestAutomationService_systemServiceServer_client_getIsChamoisWindowingUIEnabledWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "embeddedDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isChamoisWindowingUIEnabled");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Returned Chamois windowing enabled state %d", (uint8_t *)v7, 8u);
  }

}

- (void)systemServiceServer:(id)a3 client:(id)a4 setChamoisWindowingUIEnabled:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint8_t buf[4];
  _BOOL4 v11;
  uint64_t v12;

  v5 = a5;
  v12 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v11 = v5;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to set Chamois windowing enabled state to %d", buf, 8u);
  }

  v9 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v7);
  if (v9)
    BSDispatchMain();
}

void __83__SBTestAutomationService_systemServiceServer_client_setChamoisWindowingUIEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "embeddedDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setChamoisMultitaskingEnabled:", *(unsigned __int8 *)(a1 + 32));
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(unsigned __int8 *)(a1 + 32);
    v7[0] = 67109120;
    v7[1] = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Set Chamois windowing enabled state to %d", (uint8_t *)v7, 8u);
  }

}

- (void)systemServiceServer:(id)a3 client:(id)a4 getChamoisPrefersDockHiddenWithCompletion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint8_t buf[16];

  v7 = a5;
  v8 = a4;
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to get Chamois' preferred Hide Dock state", buf, 2u);
  }

  v10 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v8);
  if (v10)
  {
    v11 = v7;
    BSDispatchMain();

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __96__SBTestAutomationService_systemServiceServer_client_getChamoisPrefersDockHiddenWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appSwitcherDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "chamoisHideDock");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Returned Chamois' preferred Hide Dock state %d", (uint8_t *)v6, 8u);
  }

}

- (void)systemServiceServer:(id)a3 client:(id)a4 setChamoisPrefersDockHidden:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint8_t buf[4];
  _BOOL4 v11;
  uint64_t v12;

  v5 = a5;
  v12 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v11 = v5;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to set Chamois' preferred Hide Dock state to %d", buf, 8u);
  }

  v9 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v7);
  if (v9)
    BSDispatchMain();
}

void __82__SBTestAutomationService_systemServiceServer_client_setChamoisPrefersDockHidden___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appSwitcherDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setChamoisHideDock:", *(unsigned __int8 *)(a1 + 32));
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(a1 + 32);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Set Chamois' preferred Hide Dock state to %d", (uint8_t *)v6, 8u);
  }

}

- (void)systemServiceServer:(id)a3 client:(id)a4 getChamoisPrefersStripHiddenWithCompletion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  uint8_t buf[16];

  v7 = a5;
  v8 = a4;
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to get Chamois' preferred Hide Strips state", buf, 2u);
  }

  v10 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v8);
  if (v10)
  {
    v11 = v7;
    BSDispatchMain();

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __97__SBTestAutomationService_systemServiceServer_client_getChamoisPrefersStripHiddenWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appSwitcherDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "chamoisHideStrips");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Returned Chamois' preferred Hide Strips state %d", (uint8_t *)v6, 8u);
  }

}

- (void)systemServiceServer:(id)a3 client:(id)a4 setChamoisPrefersStripHidden:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint8_t buf[4];
  _BOOL4 v11;
  uint64_t v12;

  v5 = a5;
  v12 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v11 = v5;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Received client request to set Chamois' preferred Hide Strips state to %d", buf, 8u);
  }

  v9 = -[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", v7);
  if (v9)
    BSDispatchMain();
}

void __83__SBTestAutomationService_systemServiceServer_client_setChamoisPrefersStripHidden___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appSwitcherDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setChamoisHideStrips:", *(unsigned __int8 *)(a1 + 32));
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(a1 + 32);
    v6[0] = 67109120;
    v6[1] = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[SBTestAutomationService] Set Chamois' preferred Hide Strips state to %d", (uint8_t *)v6, 8u);
  }

}

- (void)systemServiceServer:(id)a3 client:(id)a4 getDeviceSupportsSystemAperture:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  if (-[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", a4))
  {
    v8 = v7;
    BSDispatchMain();

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

uint64_t __86__SBTestAutomationService_systemServiceServer_client_getDeviceSupportsSystemAperture___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = 1;
  v3 = SBFEffectiveArtworkSubtype();
  if (v3 > 2795)
  {
    if (v3 != 2796 && v3 != 2868)
      goto LABEL_7;
  }
  else if (v3 != 2556 && v3 != 2622)
  {
LABEL_7:
    v2 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, v2);
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setSpringBoardAnimationFrameRecordingForUpdateTypes:(unint64_t)a5
{
  char v5;
  id v6;

  v5 = a5;
  if (-[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", a4))
  {
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSystemApertureAnimationFrameRecording:", v5 & 1);

  }
}

- (id)systemServiceServer:(id)a3 getAnimationFrameRecordingsForClient:(id)a4
{
  void *v4;
  void *v5;

  if (-[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", a4))
  {
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationFrameRecordings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)systemServiceServer:(id)a3 getSystemApertureStateDumpForClient:(id)a4
{
  void *v4;
  void *v5;

  if (-[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", a4))
  {
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stateDump");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)systemServiceServer:(id)a3 getSystemApertureModelStateDumpForClient:(id)a4
{
  void *v4;
  void *v5;

  if (-[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", a4))
  {
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "systemApertureModelStateDump");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)systemServiceServer:(id)a3 client:(id)a4 setSystemApertureUnderAutomationTesting:(BOOL)a5
{
  _BOOL8 v5;
  id v6;

  v5 = a5;
  if (-[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", a4))
  {
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSystemApertureUnderAutomationTesting:", v5);

  }
}

- (id)systemServiceServer:(id)a3 getWidgetControllerStateDump:(id)a4
{
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[4];
  id v17;
  NSObject *v18;
  NSObject *v19;

  if (!-[SBTestAutomationService _authenticateClient:](self, "_authenticateClient:", a4))
    return 0;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D10310], "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_semaphore_create(0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__SBTestAutomationService_systemServiceServer_getWidgetControllerStateDump___block_invoke;
  block[3] = &unk_1E8E9E270;
  v17 = v5;
  v7 = v4;
  v18 = v7;
  v8 = v6;
  v19 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v10 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v10);
  v11 = -[NSObject count](v7, "count");
  v12 = v19;
  if (v11)
  {
    v13 = v7;
    v7 = v8;
    v14 = v13;
  }
  else
  {
    v14 = 0;
    v13 = v9;
    v9 = v8;
  }

  return v14;
}

intptr_t __76__SBTestAutomationService_systemServiceServer_getWidgetControllerStateDump___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  uint64_t v15;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v17)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(obj);
        v2 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v18 = *(void **)(a1 + 40);
        v3 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "presentationMode"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "visibility"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "stringWithFormat:", CFSTR("%@,%@"), v4, v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v2, "widget");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "extensionBundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "widget");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "kind");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%@,%@"), v9, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setValue:forKey:", v6, v12);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v17);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)_authenticateClient:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;

  v4 = a3;
  v5 = -[FBServiceClientAuthenticator authenticateClient:](self->_clientAuthenticator, "authenticateClient:", v4);
  if ((v5 & 1) == 0)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBTestAutomationService _authenticateClient:].cold.1(v4, v6);

  }
  return v5;
}

- (id)_iconGridSizeClassFromClientArgument:(int64_t)a3
{
  id *v3;

  if ((unint64_t)(a3 - 1) > 2)
    v3 = (id *)MEMORY[0x1E0DAA758];
  else
    v3 = (id *)qword_1E8EA8058[a3 - 1];
  return *v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoriesByType, 0);
  objc_storeStrong((id *)&self->_inFlightAnimationTransactions, 0);
  objc_storeStrong((id *)&self->_reachabilityEnabledAssertions, 0);
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
}

- (void)systemServiceServer:client:setIdleTimerEnabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "[SBTestAutomationService] Failed to acquire a new idle timer assertion due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)systemServiceServer:client:setAmbientPresentationState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "[SBTestAutomationService] Invalid ambient presentation state detected [%lu].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)systemServiceServer:client:setAmbientMountState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "[SBTestAutomationService] Invalid ambient mount state detected [%lu].", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)systemServiceServer:client:setAccessoryType:attached:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "[SBTestAutomationService] Cannot handle unidentified accessory type with raw value: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_authenticateClient:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "[SBTestAutomationService] Rejecting request because client '%@' does not have the required entitlement.", v4, 0xCu);

}

@end
