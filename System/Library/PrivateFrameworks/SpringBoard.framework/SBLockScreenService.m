@implementation SBLockScreenService

- (SBLockScreenService)initWithLockScreenManager:(id)a3 workspace:(id)a4 authenticationAssertionProvider:(id)a5 remoteTransientOverlaySessionManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBLockScreenService *v15;
  SBLockScreenService *v16;
  uint64_t v17;
  FBServiceClientAuthenticator *requestDeviceUnlockAuthenticator;
  uint64_t v19;
  NSMutableSet *connections;
  uint64_t v21;
  NSMutableSet *connectionsPreventingPasscodeLock;
  uint64_t v23;
  NSMutableSet *connectionsPreventingSpuriousScreenUndim;
  void *v25;
  id *v26;
  uint64_t v27;
  id v28;
  _QWORD v30[4];
  id *v31;
  objc_super v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v32.receiver = self;
  v32.super_class = (Class)SBLockScreenService;
  v15 = -[SBLockScreenService init](&v32, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_lockScreenManager, a3);
    objc_storeStrong((id *)&v16->_mainWorkspace, a4);
    objc_storeStrong((id *)&v16->_authenticationAssertionProvider, a5);
    objc_storeStrong((id *)&v16->_remoteTransientOverlaySessionManager, a6);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:additionalCredentials:", CFSTR("com.apple.springboard.requestDeviceUnlock"), 3);
    requestDeviceUnlockAuthenticator = v16->_requestDeviceUnlockAuthenticator;
    v16->_requestDeviceUnlockAuthenticator = (FBServiceClientAuthenticator *)v17;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    connections = v16->_connections;
    v16->_connections = (NSMutableSet *)v19;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    connectionsPreventingPasscodeLock = v16->_connectionsPreventingPasscodeLock;
    v16->_connectionsPreventingPasscodeLock = (NSMutableSet *)v21;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    connectionsPreventingSpuriousScreenUndim = v16->_connectionsPreventingSpuriousScreenUndim;
    v16->_connectionsPreventingSpuriousScreenUndim = (NSMutableSet *)v23;

    v25 = (void *)MEMORY[0x1E0D23030];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __128__SBLockScreenService_initWithLockScreenManager_workspace_authenticationAssertionProvider_remoteTransientOverlaySessionManager___block_invoke;
    v30[3] = &unk_1E8E9EFA0;
    v26 = v16;
    v31 = v26;
    objc_msgSend(v25, "listenerWithConfigurator:", v30);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v26[6];
    v26[6] = (id)v27;

    objc_msgSend(v26[6], "activate");
  }

  return v16;
}

void __128__SBLockScreenService_initWithLockScreenManager_workspace_authenticationAssertionProvider_remoteTransientOverlaySessionManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(v3, "setService:", CFSTR("com.apple.springboard.lockscreen"));
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)requestPasscodeUnlockUIForClient:(id)a3 options:(id)a4 description:(id)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FBServiceClientAuthenticator *requestDeviceUnlockAuthenticator;
  char v16;
  id v17;
  SBLockScreenUnlockRequest *v18;
  SBLockScreenManager *lockScreenManager;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  BSDispatchQueueAssertMain();
  if (v11)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenService.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auditToken"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenService.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("description"));

LABEL_3:
  requestDeviceUnlockAuthenticator = self->_requestDeviceUnlockAuthenticator;
  v26 = 0;
  v16 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](requestDeviceUnlockAuthenticator, "authenticateAuditToken:error:", v11, &v26);
  v17 = v26;
  if ((v16 & 1) != 0)
  {
    v18 = objc_alloc_init(SBLockScreenUnlockRequest);
    -[SBLockScreenUnlockRequest setSource:](v18, "setSource:", 19);
    -[SBLockScreenUnlockRequest setIntent:](v18, "setIntent:", 2);
    -[SBLockScreenUnlockRequest setName:](v18, "setName:", v13);
    -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v18, "setWantsBiometricPresentation:", 1);
    if (objc_msgSend(v12, "_aboveOtherContexts"))
      -[SBLockScreenUnlockRequest setForceAlertAuthenticationUI:](v18, "setForceAlertAuthenticationUI:", 1);
    if (-[SBRemoteTransientOverlaySessionManager hasSessionWithServiceProcessIdentifier:options:](self->_remoteTransientOverlaySessionManager, "hasSessionWithServiceProcessIdentifier:options:", objc_msgSend(v11, "pid"), 0))
    {
      -[SBLockScreenUnlockRequest setSource:](v18, "setSource:", 9);
    }
    lockScreenManager = self->_lockScreenManager;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __91__SBLockScreenService_requestPasscodeUnlockUIForClient_options_description_withCompletion___block_invoke;
    v24[3] = &unk_1E8E9F1C0;
    v25 = v14;
    -[SBLockScreenManager unlockWithRequest:completion:](lockScreenManager, "unlockWithRequest:completion:", v18, v24);

  }
  else
  {
    SBLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SBLockScreenService requestPasscodeUnlockUIForClient:options:description:withCompletion:].cold.1();

    if (v14)
    {
      if (v17)
      {
        (*((void (**)(id, id))v14 + 2))(v14, v17);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v14 + 2))(v14, v21);

      }
    }
  }

}

void __91__SBLockScreenService_requestPasscodeUnlockUIForClient_options_description_withCompletion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (a2)
    {
      (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 16, 0);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

    }
  }
}

- (void)requestPasscodeCheckUIForClient:(id)a3 options:(id)a4 description:(id)a5 withCompletion:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  FBServiceClientAuthenticator *requestDeviceUnlockAuthenticator;
  char v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  NSString *v20;
  NSString *passcodeTitle;
  void *v22;
  NSString *v23;
  NSString *passcodeSubtitle;
  void *v25;
  id passcodeCheckCompletion;
  void *v27;
  SBFUserAuthenticationController *v28;
  SBFUserAuthenticationController *userAuthController;
  SBFLockOutStatusProvider *v30;
  SBFLockOutStatusProvider *lockOutController;
  SBPasscodeEntryTransientOverlayViewController *v32;
  void *v33;
  SBPasscodeEntryTransientOverlayViewController *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, _QWORD))a6;
  BSDispatchQueueAssertMain();
  if (v11)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenService.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auditToken"));

    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenService.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("description"));

LABEL_3:
  requestDeviceUnlockAuthenticator = self->_requestDeviceUnlockAuthenticator;
  v40 = 0;
  v15 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](requestDeviceUnlockAuthenticator, "authenticateAuditToken:error:", v11, &v40);
  v16 = v40;
  if ((v15 & 1) != 0)
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasPasscodeSet");

    if ((v18 & 1) != 0)
    {
      objc_msgSend(v12, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v12, "title");
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        passcodeTitle = self->_passcodeTitle;
        self->_passcodeTitle = v20;

      }
      objc_msgSend(v12, "subtitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v12, "subtitle");
        v23 = (NSString *)objc_claimAutoreleasedReturnValue();
        passcodeSubtitle = self->_passcodeSubtitle;
        self->_passcodeSubtitle = v23;

      }
      v25 = (void *)MEMORY[0x1D17E5550](v13);
      passcodeCheckCompletion = self->_passcodeCheckCompletion;
      self->_passcodeCheckCompletion = v25;

      -[SBLockScreenService userAuthController](self, "userAuthController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      {
        objc_msgSend((id)SBApp, "authenticationController");
        v28 = (SBFUserAuthenticationController *)objc_claimAutoreleasedReturnValue();
        userAuthController = self->_userAuthController;
        self->_userAuthController = v28;

        objc_msgSend((id)SBApp, "lockOutController");
        v30 = (SBFLockOutStatusProvider *)objc_claimAutoreleasedReturnValue();
        lockOutController = self->_lockOutController;
        self->_lockOutController = v30;

      }
      v32 = [SBPasscodeEntryTransientOverlayViewController alloc];
      objc_msgSend((id)SBApp, "authenticationController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[SBPasscodeEntryTransientOverlayViewController initWithAuthenticationController:](v32, "initWithAuthenticationController:", v33);

      -[SBLockScreenService setPasscodeEntryTransientOverlayViewController:](self, "setPasscodeEntryTransientOverlayViewController:", v34);
      -[SBPasscodeEntryTransientOverlayViewController setDelegate:](self->_passcodeEntryTransientOverlayViewController, "setDelegate:", self);
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "presentTransientOverlayViewController:animated:completion:", self->_passcodeEntryTransientOverlayViewController, 1, 0);

    }
    else
    {
      v13[2](v13, 0);
    }
  }
  else
  {
    SBLogCommon();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[SBLockScreenService requestPasscodeUnlockUIForClient:options:description:withCompletion:].cold.1();

    if (v13)
    {
      if (v16)
      {
        ((void (**)(id, id))v13)[2](v13, v16);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *))v13)[2](v13, v37);

      }
    }
  }

}

- (void)_setPasscodeVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  SBPasscodeEntryTransientOverlayViewController *passcodeEntryTransientOverlayViewController;

  v4 = a4;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissTransientOverlayViewController:animated:completion:", self->_passcodeEntryTransientOverlayViewController, v4, 0);

  passcodeEntryTransientOverlayViewController = self->_passcodeEntryTransientOverlayViewController;
  self->_passcodeEntryTransientOverlayViewController = 0;

}

- (BOOL)passcodeEntryTransientOverlayViewController:(id)a3 authenticatePasscode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__SBLockScreenService_passcodeEntryTransientOverlayViewController_authenticatePasscode___block_invoke;
  v10[3] = &unk_1E8E9E980;
  v10[4] = self;
  v5 = a4;
  v6 = (void *)MEMORY[0x1D17E5550](v10);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9DA0]), "initForPasscode:source:handler:", v5, 0, v6);

  -[SBLockScreenService userAuthController](self, "userAuthController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processAuthenticationRequest:", v7);

  return 1;
}

void __88__SBLockScreenService_passcodeEntryTransientOverlayViewController_authenticatePasscode___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("no");
    if (a2)
      v5 = CFSTR("yes");
    v18 = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "SBLockScreenService auth attempt succeeded: %@", (uint8_t *)&v18, 0xCu);
  }

  if ((a2 & 1) != 0 || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "isBlocked"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_setPasscodeVisible:animated:", 0, 1);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
    if (a2)
    {
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 16, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 120);
    *(_QWORD *)(v8 + 120) = 0;

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 104);
    *(_QWORD *)(v10 + 104) = 0;

    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 112);
    *(_QWORD *)(v12 + 112) = 0;

    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 144);
    *(_QWORD *)(v14 + 144) = 0;

    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 136);
    *(_QWORD *)(v16 + 136) = 0;

  }
}

- (void)passcodeEntryTransientOverlayViewControllerRequestsDismissal:(id)a3
{
  id v4;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissTransientOverlayViewController:animated:completion:", self->_passcodeEntryTransientOverlayViewController, 1, 0);

}

- (id)passcodeEntryTransientOverlayViewControllerStatusText
{
  return self->_passcodeTitle;
}

- (id)passcodeEntryTransientOverlayViewControllerStatusSubtitleText
{
  return self->_passcodeSubtitle;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SBLockScreenService_listener_didReceiveConnection_withContext___block_invoke;
  v8[3] = &unk_1E8EA88C8;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(v7, "configureConnection:", v8);
  -[NSMutableSet addObject:](self->_connections, "addObject:", v7);
  objc_msgSend(v7, "activate");

}

void __65__SBLockScreenService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v3 = (void *)MEMORY[0x1E0DAAF08];
  v4 = a2;
  objc_msgSend(v3, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v5);

  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D23040], "userInitiated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v6);

  objc_msgSend(v4, "setTargetQueue:", MEMORY[0x1E0C80D38]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SBLockScreenService_listener_didReceiveConnection_withContext___block_invoke_2;
  v8[3] = &unk_1E8EA8DA0;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v4, "setInvalidationHandler:", v8);

}

void __65__SBLockScreenService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "SBLockScreenService: invalidated remotely", (uint8_t *)&v19, 2u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "containsObject:", v3))
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 40);
      objc_msgSend(v6, "remoteProcess");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134218242;
      v20 = v6;
      v21 = 2114;
      v22 = v7;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBLockScreenService-%p: client went away and therefore stopped requesting preventPasscodeLock : %{public}@", (uint8_t *)&v19, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", v3);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count"))
    {
      SBLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "SBLockScreenService: all clients have stopped requesting preventPasscodeLock - invalidating global assertion", (uint8_t *)&v19, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "invalidate");
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 72);
      *(_QWORD *)(v9 + 72) = 0;

    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "containsObject:", v3))
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 40);
      objc_msgSend(v12, "remoteProcess");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 134218242;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "SBLockScreenService-%p: client went away and therefore stopped requesting preventSpuriousScreenUndim : %{public}@", (uint8_t *)&v19, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:", v3);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
    {
      SBLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "SBLockScreenService: all clients have stopped requesting preventSpuriousScreenUndim - invalidating global assertion", (uint8_t *)&v19, 2u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "invalidate");
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 88);
      *(_QWORD *)(v15 + 88) = 0;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "invalidate");
      v17 = *(_QWORD *)(a1 + 32);
      v18 = *(void **)(v17 + 96);
      *(_QWORD *)(v17 + 96) = 0;

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", v3);

}

- (void)launchEmergencyDialerWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  SBLockScreenManager *lockScreenManager;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D22990], "sharedSystemClientAuthenticator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "auditToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v9 = objc_msgSend(v7, "authenticateAuditToken:error:", v8, &v21);
  v10 = v21;

  if (v9)
  {
    lockScreenManager = self->_lockScreenManager;
    v22[0] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    v22[1] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v13;
    v22[2] = CFSTR("SBUILockOptionsForceLockKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenManager lockUIFromSource:withOptions:](lockScreenManager, "lockUIFromSource:withOptions:", 9, v15);

    v16 = dispatch_walltime(0, 250000000);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __59__SBLockScreenService_launchEmergencyDialerWithCompletion___block_invoke;
    v19[3] = &unk_1E8EA02D8;
    v19[4] = self;
    v20 = v4;
    dispatch_after(v16, MEMORY[0x1E0C80D38], v19);

  }
  else
  {
    SBLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SBLockScreenService launchEmergencyDialerWithCompletion:].cold.1();

    if (v4)
    {
      if (v10)
      {
        (*((void (**)(id, id))v4 + 2))(v4, v10);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v4 + 2))(v4, v18);

      }
    }
  }

}

uint64_t __59__SBLockScreenService_launchEmergencyDialerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lockScreenEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "launchEmergencyDialer");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)requestPasscodeUnlockUIWithOptions:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D23010];
  v8 = a3;
  objc_msgSend(v7, "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "auditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__SBLockScreenService_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke;
  v13[3] = &unk_1E8E9F598;
  v14 = v6;
  v12 = v6;
  -[SBLockScreenService requestPasscodeUnlockUIForClient:options:description:withCompletion:](self, "requestPasscodeUnlockUIForClient:options:description:withCompletion:", v11, v8, CFSTR("SBSRequestPasscodeUnlockUI"), v13);

}

uint64_t __73__SBLockScreenService_requestPasscodeUnlockUIWithOptions_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestPasscodeCheckUIWithOptions:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D23010];
  v8 = a3;
  objc_msgSend(v7, "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "auditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__SBLockScreenService_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke;
  v13[3] = &unk_1E8E9F598;
  v14 = v6;
  v12 = v6;
  -[SBLockScreenService requestPasscodeCheckUIForClient:options:description:withCompletion:](self, "requestPasscodeCheckUIForClient:options:description:withCompletion:", v11, v8, CFSTR("SBSRequestPasscodeCheckUI"), v13);

}

uint64_t __72__SBLockScreenService_requestPasscodeCheckUIWithOptions_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setPreventPasscodeLock:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  SBFAuthenticationAssertion *v11;
  SBFAuthenticationAssertion *preventPasscodeLockAssertion;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D23010];
  v5 = a3;
  objc_msgSend(v4, "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "BOOLValue");

  if (v7)
  {
    objc_msgSend(v6, "remoteProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.springboard.preventDeviceLock")))
    {
      if ((-[NSMutableSet containsObject:](self->_connectionsPreventingPasscodeLock, "containsObject:", v6) & 1) == 0)
      {
        SBLogCommon();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 134218242;
          v24 = v6;
          v25 = 2114;
          v26 = v8;
          _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "SBLockScreenService-%p: client started requesting preventPasscodeLock : %{public}@", (uint8_t *)&v23, 0x16u);
        }

        -[NSMutableSet addObject:](self->_connectionsPreventingPasscodeLock, "addObject:", v6);
        if (!self->_preventPasscodeLockAssertion)
        {
          SBLogCommon();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v23) = 0;
            _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "SBLockScreenService: a client has started requesting preventPasscodeLock - creating global assertion", (uint8_t *)&v23, 2u);
          }

          -[SBFAuthenticationAssertionProviding createKeybagUnlockAssertionWithReason:](self->_authenticationAssertionProvider, "createKeybagUnlockAssertionWithReason:", CFSTR("LockScreenService"));
          v11 = (SBFAuthenticationAssertion *)objc_claimAutoreleasedReturnValue();
          preventPasscodeLockAssertion = self->_preventPasscodeLockAssertion;
          self->_preventPasscodeLockAssertion = v11;

          -[SBFAuthenticationAssertion activate](self->_preventPasscodeLockAssertion, "activate");
        }
      }
    }
    else
    {
      SBLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SBLockScreenService setPreventPasscodeLock:].cold.1((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);

    }
LABEL_20:

    goto LABEL_21;
  }
  if (-[NSMutableSet containsObject:](self->_connectionsPreventingPasscodeLock, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->_connectionsPreventingPasscodeLock, "removeObject:", v6);
    SBLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "remoteProcess");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 134218242;
      v24 = v6;
      v25 = 2114;
      v26 = v14;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "SBLockScreenService-%p: client stopped requesting preventPasscodeLock : %{public}@", (uint8_t *)&v23, 0x16u);

    }
    if (!-[NSMutableSet count](self->_connectionsPreventingPasscodeLock, "count"))
    {
      SBLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "SBLockScreenService: all clients have stopped requesting preventPasscodeLock - invalidating global assertion", (uint8_t *)&v23, 2u);
      }

      -[SBFAuthenticationAssertion invalidate](self->_preventPasscodeLockAssertion, "invalidate");
      v8 = self->_preventPasscodeLockAssertion;
      self->_preventPasscodeLockAssertion = 0;
      goto LABEL_20;
    }
  }
LABEL_21:

}

- (void)setPreventSpuriousScreenUndim:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  SBSpuriousScreenUndimmingAssertion *v11;
  SBSpuriousScreenUndimmingAssertion *preventSpuriousScreenUndimAssertion;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BLSAssertion *v17;
  BLSAssertion *preventSpuriousScreenUndimDisableAlwaysOnAssertion;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  SBSpuriousScreenUndimmingAssertion *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D23010];
  v5 = a3;
  objc_msgSend(v4, "currentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "BOOLValue");

  if (v7)
  {
    objc_msgSend(v6, "remoteProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.springboard.preventSpuriousScreenUndim")))
    {
      if ((-[NSMutableSet containsObject:](self->_connectionsPreventingSpuriousScreenUndim, "containsObject:", v6) & 1) != 0)
        goto LABEL_20;
      SBLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v31 = v6;
        v32 = 2114;
        v33 = v8;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "SBLockScreenService-%p: client started requesting preventSpuriousScreenUndim : %{public}@", buf, 0x16u);
      }

      -[NSMutableSet addObject:](self->_connectionsPreventingSpuriousScreenUndim, "addObject:", v6);
      if (self->_preventSpuriousScreenUndimAssertion)
        goto LABEL_20;
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "SBLockScreenService: a client has started requesting preventSpuriousScreenUndim - creating global assertion", buf, 2u);
      }

      v11 = -[SBSpuriousScreenUndimmingAssertion initWithIdentifier:]([SBSpuriousScreenUndimmingAssertion alloc], "initWithIdentifier:", CFSTR("SBLockScreenService"));
      preventSpuriousScreenUndimAssertion = self->_preventSpuriousScreenUndimAssertion;
      self->_preventSpuriousScreenUndimAssertion = v11;

      v13 = (void *)MEMORY[0x1E0D00F48];
      objc_msgSend(MEMORY[0x1E0CF78A8], "allowAmbientIdleTimer");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D00F90], "disableAlwaysOn", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "acquireWithExplanation:observer:attributes:", CFSTR("SBLockScreenService-PreventSpuriousScreenUndimming"), 0, v16);
      v17 = (BLSAssertion *)objc_claimAutoreleasedReturnValue();
      preventSpuriousScreenUndimDisableAlwaysOnAssertion = self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion;
      self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion = v17;

    }
    else
    {
      SBLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SBLockScreenService setPreventSpuriousScreenUndim:].cold.1((uint64_t)v8, v14, v23, v24, v25, v26, v27, v28);
    }

LABEL_20:
    goto LABEL_21;
  }
  if (-[NSMutableSet containsObject:](self->_connectionsPreventingSpuriousScreenUndim, "containsObject:", v6))
  {
    -[NSMutableSet removeObject:](self->_connectionsPreventingSpuriousScreenUndim, "removeObject:", v6);
    SBLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "remoteProcess");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v31 = v6;
      v32 = 2114;
      v33 = v20;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "SBLockScreenService-%p: client stopped requesting preventSpuriousScreenUndim : %{public}@", buf, 0x16u);

    }
    if (!-[NSMutableSet count](self->_connectionsPreventingSpuriousScreenUndim, "count"))
    {
      SBLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "SBLockScreenService: all clients have stopped requesting preventSpuriousScreenUndim - invalidating global assertion", buf, 2u);
      }

      -[SBSpuriousScreenUndimmingAssertion invalidate](self->_preventSpuriousScreenUndimAssertion, "invalidate");
      v22 = self->_preventSpuriousScreenUndimAssertion;
      self->_preventSpuriousScreenUndimAssertion = 0;

      -[BLSAssertion invalidate](self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion, "invalidate");
      v8 = self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion;
      self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion = 0;
      goto LABEL_20;
    }
  }
LABEL_21:

}

- (void)lockDeviceAnimated:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  SBLockScreenManager *lockScreenManager;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D23010], "currentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "hasEntitlement:", CFSTR("com.apple.springboard.lockDevice")))
  {
    lockScreenManager = self->_lockScreenManager;
    v17[0] = CFSTR("SBUILockOptionsUseScreenOffModeKey");
    v17[1] = CFSTR("SBUILockOptionsLockAutomaticallyKey");
    v18[0] = MEMORY[0x1E0C9AAA0];
    v18[1] = MEMORY[0x1E0C9AAB0];
    v18[2] = MEMORY[0x1E0C9AAB0];
    v17[2] = CFSTR("SBUILockOptionsForceLockKey");
    v17[3] = CFSTR("SBUILockOptionsAnimateLockScreenActivationKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "BOOLValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__SBLockScreenService_lockDeviceAnimated_withCompletion___block_invoke;
    v15[3] = &unk_1E8E9F1C0;
    v16 = v7;
    -[SBLockScreenManager lockUIFromSource:withOptions:completion:](lockScreenManager, "lockUIFromSource:withOptions:completion:", 21, v12, v15);

    v13 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D22858], 13, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SBLockScreenService lockDeviceAnimated:withCompletion:].cold.1();

    if (v7)
      (*((void (**)(id, void *))v7 + 2))(v7, v13);
  }

}

uint64_t __57__SBLockScreenService_lockDeviceAnimated_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (BOOL)isAlwaysOnPolicyActive
{
  return 1;
}

- (NSString)analyticsPolicyName
{
  return (NSString *)CFSTR("preventSpuriousScreenUndimming");
}

- (id)analyticsPolicyValue
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion != 0);
}

- (SBPasscodeEntryTransientOverlayViewController)passcodeEntryTransientOverlayViewController
{
  return self->_passcodeEntryTransientOverlayViewController;
}

- (void)setPasscodeEntryTransientOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeEntryTransientOverlayViewController, a3);
}

- (SBFUserAuthenticationController)userAuthController
{
  return self->_userAuthController;
}

- (void)setUserAuthController:(id)a3
{
  objc_storeStrong((id *)&self->_userAuthController, a3);
}

- (SBFLockOutStatusProvider)lockOutController
{
  return self->_lockOutController;
}

- (void)setLockOutController:(id)a3
{
  objc_storeStrong((id *)&self->_lockOutController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_storeStrong((id *)&self->_userAuthController, 0);
  objc_storeStrong((id *)&self->_passcodeEntryTransientOverlayViewController, 0);
  objc_storeStrong(&self->_passcodeCheckCompletion, 0);
  objc_storeStrong((id *)&self->_passcodeSubtitle, 0);
  objc_storeStrong((id *)&self->_passcodeTitle, 0);
  objc_storeStrong((id *)&self->_preventSpuriousScreenUndimDisableAlwaysOnAssertion, 0);
  objc_storeStrong((id *)&self->_preventSpuriousScreenUndimAssertion, 0);
  objc_storeStrong((id *)&self->_connectionsPreventingSpuriousScreenUndim, 0);
  objc_storeStrong((id *)&self->_preventPasscodeLockAssertion, 0);
  objc_storeStrong((id *)&self->_connectionsPreventingPasscodeLock, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_requestDeviceUnlockAuthenticator, 0);
  objc_storeStrong((id *)&self->_remoteTransientOverlaySessionManager, 0);
  objc_storeStrong((id *)&self->_authenticationAssertionProvider, 0);
  objc_storeStrong((id *)&self->_mainWorkspace, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
}

- (void)requestPasscodeUnlockUIForClient:options:description:withCompletion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v0, v1, "SBLockScreenService: Insufficient authorization to request unlock for client: %{public}@ -> %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)launchEmergencyDialerWithCompletion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v0, v1, "SBLockScreenService: Insufficient authorization to show emergency dialer for client: %{public}@ -> %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)setPreventPasscodeLock:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "SBLockScreenService: Insufficient authorization to preventPasscodeLock for client: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)setPreventSpuriousScreenUndim:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "SBLockScreenService: Insufficient authorization to preventSpuriousScreenUndim for client: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)lockDeviceAnimated:withCompletion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v0, v1, "SBLockScreenService: Insufficient authorization to lock device for client: %{public}@ -> %@");
  OUTLINED_FUNCTION_2_0();
}

@end
