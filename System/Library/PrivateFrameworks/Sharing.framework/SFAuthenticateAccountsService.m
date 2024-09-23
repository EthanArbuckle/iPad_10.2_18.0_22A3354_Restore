@implementation SFAuthenticateAccountsService

- (SFAuthenticateAccountsService)init
{
  SFAuthenticateAccountsService *v2;
  SFAuthenticateAccountsServiceConfiguration *v3;
  SFAuthenticateAccountsServiceConfiguration *configuration;
  uint64_t v5;
  OS_dispatch_queue *dispatchQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFAuthenticateAccountsService;
  v2 = -[SFAuthenticateAccountsService init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SFAuthenticateAccountsServiceConfiguration);
    configuration = v2->_configuration;
    v2->_configuration = v3;

    SFMainQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)_cleanup
{
  id progressHandler;
  ACAccountStore *accountStore;
  CDPStateUIProvider *cdpUIProvider;
  NSMutableArray *authenticatedAccounts;
  NSArray *knownHomeUserIdentifiers;
  NSString *preferredLanguageCode;
  NSString *localeIdentifier;
  NSArray *preferredLanguages;

  progressHandler = self->_progressHandler;
  self->_progressHandler = 0;

  accountStore = self->_accountStore;
  self->_accountStore = 0;

  cdpUIProvider = self->_cdpUIProvider;
  self->_cdpUIProvider = 0;

  authenticatedAccounts = self->_authenticatedAccounts;
  self->_authenticatedAccounts = 0;

  knownHomeUserIdentifiers = self->_knownHomeUserIdentifiers;
  self->_knownHomeUserIdentifiers = 0;

  self->_isVoiceProfileAvailable = 0;
  preferredLanguageCode = self->_preferredLanguageCode;
  self->_preferredLanguageCode = 0;

  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = 0;

  preferredLanguages = self->_preferredLanguages;
  self->_preferredLanguages = 0;

}

- (SFAuthenticateAccountsServiceConfiguration)configuration
{
  return (SFAuthenticateAccountsServiceConfiguration *)(id)-[SFAuthenticateAccountsServiceConfiguration copy](self->_configuration, "copy");
}

- (void)setConfiguration:(id)a3
{
  id v4;
  void *v5;
  SFAuthenticateAccountsServiceConfiguration *v6;
  SFAuthenticateAccountsServiceConfiguration *configuration;
  int v8;
  id v9;

  v4 = a3;
  v5 = v4;
  if (!self->_activateCalled)
  {
    v9 = v4;
    v6 = (SFAuthenticateAccountsServiceConfiguration *)objc_msgSend(v4, "copy");
    configuration = self->_configuration;
    self->_configuration = v6;

    goto LABEL_6;
  }
  if (gLogCategory_SFAuthenticateAccountsService <= 115)
  {
    v9 = v4;
    if (gLogCategory_SFAuthenticateAccountsService != -1 || (v8 = _LogCategory_Initialize(), v5 = v9, v8))
    {
      LogPrintF();
LABEL_6:
      v5 = v9;
    }
  }

}

- (unsigned)targetedAccountTypes
{
  return -[SFAuthenticateAccountsServiceConfiguration targetedAccountTypes](self->_configuration, "targetedAccountTypes");
}

- (void)setTargetedAccountTypes:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  v5 = (id)-[SFAuthenticateAccountsServiceConfiguration copy](self->_configuration, "copy");
  objc_msgSend(v5, "setTargetedAccountTypes:", v3);
  -[SFAuthenticateAccountsService setConfiguration:](self, "setConfiguration:", v5);

}

- (BOOL)isHomeSharingSetupNeeded
{
  return -[SFAuthenticateAccountsServiceConfiguration isHomeSharingSetupNeeded](self->_configuration, "isHomeSharingSetupNeeded");
}

- (void)setIsHomeSharingSetupNeeded:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)-[SFAuthenticateAccountsServiceConfiguration copy](self->_configuration, "copy");
  objc_msgSend(v5, "setIsHomeSharingSetupNeeded:", v3);
  -[SFAuthenticateAccountsService setConfiguration:](self, "setConfiguration:", v5);

}

- (BOOL)isHomeKitSetupNeeded
{
  return -[SFAuthenticateAccountsServiceConfiguration isHomeKitSetupNeeded](self->_configuration, "isHomeKitSetupNeeded");
}

- (void)setIsHomeKitSetupNeeded:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)-[SFAuthenticateAccountsServiceConfiguration copy](self->_configuration, "copy");
  objc_msgSend(v5, "setIsHomeKitSetupNeeded:", v3);
  -[SFAuthenticateAccountsService setConfiguration:](self, "setConfiguration:", v5);

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SFAuthenticateAccountsService_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__SFAuthenticateAccountsService_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  ACAccountStore *v3;
  ACAccountStore *accountStore;
  NSMutableArray *v5;
  NSMutableArray *authenticatedAccounts;

  if (!self->_activateCalled
    && gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_activateCalled = 1;
  objc_msgSend((Class)getACAccountStoreClass[0](), "defaultStore");
  v3 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
  accountStore = self->_accountStore;
  self->_accountStore = v3;

  if (-[SFAuthenticateAccountsService _validateConfiguration](self, "_validateConfiguration"))
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    authenticatedAccounts = self->_authenticatedAccounts;
    self->_authenticatedAccounts = v5;

    -[SFAuthenticateAccountsService _sfServiceStart](self, "_sfServiceStart");
  }
}

- (BOOL)_validateConfiguration
{
  void (**v3)(_QWORD);
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__SFAuthenticateAccountsService__validateConfiguration__block_invoke;
  aBlock[3] = &unk_1E482DF78;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((!-[SFAuthenticateAccountsServiceConfiguration serviceType](self->_configuration, "serviceType")
     || (-[SFAuthenticateAccountsServiceConfiguration serviceType](self->_configuration, "serviceType") & 1) != 0)
    && !-[SFAuthenticateAccountsServiceConfiguration targetedAccountTypes](self->_configuration, "targetedAccountTypes"))
  {
    if (gLogCategory_SFAuthenticateAccountsService > 90
      || gLogCategory_SFAuthenticateAccountsService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_25;
    }
    goto LABEL_19;
  }
  if ((-[SFAuthenticateAccountsServiceConfiguration serviceType](self->_configuration, "serviceType") & 1) != 0
    || (-[SFAuthenticateAccountsServiceConfiguration serviceType](self->_configuration, "serviceType") & 2) != 0)
  {
    -[SFAuthenticateAccountsServiceConfiguration existingAccountsIdentifiers](self->_configuration, "existingAccountsIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
    {
      if (gLogCategory_SFAuthenticateAccountsService > 90
        || gLogCategory_SFAuthenticateAccountsService == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_25;
      }
      goto LABEL_19;
    }
  }
  if ((-[SFAuthenticateAccountsServiceConfiguration serviceType](self->_configuration, "serviceType") & 2) != 0)
  {
    -[SFAuthenticateAccountsService _configurationExistingAccountWithType:](self, "_configurationExistingAccountWithType:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

      goto LABEL_10;
    }
    if (gLogCategory_SFAuthenticateAccountsService > 90
      || gLogCategory_SFAuthenticateAccountsService == -1 && !_LogCategory_Initialize())
    {
LABEL_25:
      v3[2](v3);
      v7 = 0;
      goto LABEL_26;
    }
LABEL_19:
    LogPrintF();
    goto LABEL_25;
  }
LABEL_10:
  v7 = 1;
LABEL_26:

  return v7;
}

uint64_t __55__SFAuthenticateAccountsService__validateConfiguration__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  const __CFString *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[19];
  if (v3)
  {
    v15 = CFSTR("eo");
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v5 = *MEMORY[0x1E0CB2F90];
    v13 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("?");
    if (v6)
      v8 = (const __CFString *)v6;
    v14 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -6705, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, 30, v11);

    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_invalidate");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SFAuthenticateAccountsService_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__SFAuthenticateAccountsService_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  SFService *sfService;
  void (**progressHandler)(id, uint64_t, _QWORD);

  if (!self->_invalidateCalled
    && gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  if (self->_sfSession)
    -[SFAuthenticateAccountsService _handleSessionEnded:](self, "_handleSessionEnded:");
  -[SFService invalidate](self->_sfService, "invalidate");
  sfService = self->_sfService;
  self->_sfService = 0;

  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 20, 0);
  -[SFAuthenticateAccountsService _cleanup](self, "_cleanup");
}

- (void)_sfServiceStart
{
  unsigned int v3;
  SFService *v4;
  SFService *sfService;
  uint64_t v6;
  uint64_t v7;
  SFService *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = -[SFAuthenticateAccountsServiceConfiguration serviceType](self->_configuration, "serviceType");
  -[SFService invalidate](self->_sfService, "invalidate");
  v4 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v4;

  -[SFService setDispatchQueue:](self->_sfService, "setDispatchQueue:", self->_dispatchQueue);
  -[SFService setAdvertiseRate:](self->_sfService, "setAdvertiseRate:", 50);
  -[SFService setIdentifier:](self->_sfService, "setIdentifier:", CFSTR("com.apple.sharing.AuthenticateAccounts"));
  -[SFService setLabel:](self->_sfService, "setLabel:", CFSTR("AuthenticateAccounts"));
  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 1);
  if (v3)
    v6 = 43;
  else
    v6 = 32;
  -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", v6);
  -[SFService setPairSetupACL:](self->_sfService, "setPairSetupACL:", &unk_1E4891160);
  -[SFService setPinType:](self->_sfService, "setPinType:", 1);
  -[SFService setSessionFlags:](self->_sfService, "setSessionFlags:", 1);
  -[SFService setTouchRemoteEnabled:](self->_sfService, "setTouchRemoteEnabled:", 1);
  location = 0;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke;
  v14[3] = &unk_1E482F550;
  objc_copyWeak(&v15, &location);
  -[SFService setSessionStartedHandler:](self->_sfService, "setSessionStartedHandler:", v14);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke_2;
  v12[3] = &unk_1E482F578;
  objc_copyWeak(&v13, &location);
  -[SFService setSessionEndedHandler:](self->_sfService, "setSessionEndedHandler:", v12);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke_3;
  v10[3] = &unk_1E482F5A0;
  objc_copyWeak(&v11, &location);
  -[SFService setReceivedRequestHandler:](self->_sfService, "setReceivedRequestHandler:", v10);
  v8 = self->_sfService;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke_4;
  v9[3] = &unk_1E482DFF0;
  v9[4] = self;
  -[SFService activateWithCompletion:](v8, "activateWithCompletion:", v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleSessionStarted:", v3);

}

void __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleSessionEnded:", v3);

}

void __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id *v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;

  v8 = (id *)(a1 + 32);
  v9 = a5;
  v10 = a4;
  v11 = a2;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "_handleRequest:flags:session:responseHandler:", v10, a3, v11, v9);

}

void __48__SFAuthenticateAccountsService__sfServiceStart__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
  if (v3)
  {
    if (v5)
    {
      v7 = CFSTR("eo");
      v8[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, 30, v6);

    }
  }
  else if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 10, 0);
  }

}

- (void)_handleSessionStarted:(id)a3
{
  id v5;
  SFSession **p_sfSession;
  void *v7;
  uint64_t v8;
  SFDeviceOperationHandlerCDPSetup *v9;
  SFDeviceOperationHandlerCDPSetup *cdpSetupHandler;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  HMDeviceSetupOperationHandler *v15;
  HMDeviceSetupOperationHandler *homeKitSetupHandler;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void (**v18)(id, uint64_t, void *);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_sfSession = &self->_sfSession;
  if (self->_sfSession)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 60
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "peer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSession peer](*p_sfSession, "peer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    goto LABEL_17;
  }
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v5, "peer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  objc_storeStrong((id *)&self->_sfSession, a3);
  v8 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke;
  v26[3] = &unk_1E482E2D0;
  v26[4] = self;
  objc_msgSend(v5, "registerRequestID:options:handler:", CFSTR("_info"), 0, v26);
  v9 = objc_alloc_init(SFDeviceOperationHandlerCDPSetup);
  cdpSetupHandler = self->_cdpSetupHandler;
  self->_cdpSetupHandler = v9;

  -[SFDeviceOperationHandlerCDPSetup setDispatchQueue:](self->_cdpSetupHandler, "setDispatchQueue:", self->_dispatchQueue);
  -[SFDeviceOperationHandlerCDPSetup setSfSession:](self->_cdpSetupHandler, "setSfSession:", v5);
  if ((-[SFAuthenticateAccountsServiceConfiguration serviceType](self->_configuration, "serviceType") & 2) == 0)
    goto LABEL_14;
  -[SFAuthenticateAccountsService _configurationExistingAccountWithType:](self, "_configurationExistingAccountWithType:", 1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[SFDeviceOperationHandlerCDPSetup setFailIfCDPNotEnabled:](self->_cdpSetupHandler, "setFailIfCDPNotEnabled:", 1);
    objc_msgSend(v12, "aa_altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceOperationHandlerCDPSetup setAltDSIDNeedingRepair:](self->_cdpSetupHandler, "setAltDSIDNeedingRepair:", v13);

LABEL_14:
    -[SFDeviceOperationHandlerCDPSetup activate](self->_cdpSetupHandler, "activate", v21);
    -[SFSession trSession](self->_sfSession, "trSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v8;
    v25[1] = 3221225472;
    v25[2] = __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke_2;
    v25[3] = &unk_1E482F5C8;
    v25[4] = self;
    getTRSetupCompanionAuthenticationRequestClass[0]();
    objc_msgSend(v14, "setRequestHandler:forRequestClass:", v25, objc_opt_class());
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke_3;
    v24[3] = &unk_1E482F5C8;
    v24[4] = self;
    getTRSetupProxyDeviceRequestClass[0]();
    objc_msgSend(v14, "setRequestHandler:forRequestClass:", v24, objc_opt_class());
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke_4;
    v23[3] = &unk_1E482F5C8;
    v23[4] = self;
    getTRSetupProxyAuthenticationRequestClass[0]();
    objc_msgSend(v14, "setRequestHandler:forRequestClass:", v23, objc_opt_class());
    v15 = (HMDeviceSetupOperationHandler *)objc_alloc_init((Class)getHMDeviceSetupOperationHandlerClass[0]());
    homeKitSetupHandler = self->_homeKitSetupHandler;
    self->_homeKitSetupHandler = v15;

    -[HMDeviceSetupOperationHandler registerMessageHandlersForSession:](self->_homeKitSetupHandler, "registerMessageHandlersForSession:", v14);
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 31, 0);
    -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 0);

    goto LABEL_17;
  }
  if (gLogCategory_SFAuthenticateAccountsService <= 115
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v18 = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (v18)
  {
    v27 = CFSTR("eo");
    NSErrorWithOSStatusF();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, 30, v20);

  }
  -[SFAuthenticateAccountsService _invalidate](self, "_invalidate", v21);
LABEL_17:

}

uint64_t __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInfoExchange:responseHandler:");
}

uint64_t __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTRCompanionAuthenticationRequest:responseHandler:", a2, a3);
}

uint64_t __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTRProxyDeviceRequest:responseHandler:", a2, a3);
}

uint64_t __55__SFAuthenticateAccountsService__handleSessionStarted___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTRProxyAuthenticationRequest:responseHandler:", a2, a3);
}

- (void)_handleSessionEnded:(id)a3
{
  SFSession *sfSession;
  SFSession *v5;
  SFDeviceOperationHandlerCDPSetup *cdpSetupHandler;
  HMDeviceSetupOperationHandler *homeKitSetupHandler;
  SFSession *v8;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void *v10;
  SFSession *v11;

  sfSession = (SFSession *)a3;
  v5 = sfSession;
  if (self->_sfSession != sfSession)
    goto LABEL_9;
  v11 = sfSession;
  if (sfSession && gLogCategory_SFAuthenticateAccountsService <= 30)
  {
    if (gLogCategory_SFAuthenticateAccountsService != -1)
    {
LABEL_5:
      -[SFSession peer](sfSession, "peer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      goto LABEL_7;
    }
    if (_LogCategory_Initialize())
    {
      sfSession = self->_sfSession;
      goto LABEL_5;
    }
  }
LABEL_7:
  -[SFDeviceOperationHandlerCDPSetup invalidate](self->_cdpSetupHandler, "invalidate", v10);
  cdpSetupHandler = self->_cdpSetupHandler;
  self->_cdpSetupHandler = 0;

  homeKitSetupHandler = self->_homeKitSetupHandler;
  self->_homeKitSetupHandler = 0;

  -[SFAuthenticateAccountsService _finishSession:](self, "_finishSession:", v11);
  v8 = self->_sfSession;
  self->_sfSession = 0;

  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 1);
  v5 = v11;
  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 32, 0);
    v5 = v11;
  }
LABEL_9:

}

- (void)_handleInfoExchange:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *preferredLanguageCode;
  NSString *v10;
  NSString *localeIdentifier;
  NSArray *v12;
  NSArray *preferredLanguages;
  NSArray *v14;
  NSArray *keyboards;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  NSArray *v23;
  NSArray *knownHomeUserIdentifiers;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  unsigned int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    v41 = v6;
    LogPrintF();
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("lang"), v41);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  preferredLanguageCode = self->_preferredLanguageCode;
  self->_preferredLanguageCode = v8;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("locale"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = v10;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("langs"));
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  preferredLanguages = self->_preferredLanguages;
  self->_preferredLanguages = v12;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kbs"));
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  keyboards = self->_keyboards;
  self->_keyboards = v14;

  v16 = -[SFAuthenticateAccountsService _shouldSignInAccountsInInfoRequest:](self, "_shouldSignInAccountsInInfoRequest:", v6);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hkcuis"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  v19 = MEMORY[0x1E0C809B0];
  if (v18)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("hkhrmve"));
    v44[0] = v19;
    v44[1] = 3221225472;
    v44[2] = __69__SFAuthenticateAccountsService__handleInfoExchange_responseHandler___block_invoke;
    v44[3] = &unk_1E482F5F0;
    v45 = (id)objc_claimAutoreleasedReturnValue();
    v46 = v20;
    v21 = v20;
    v22 = v45;
    objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v44);
    v23 = (NSArray *)objc_msgSend(v21, "copy");
    knownHomeUserIdentifiers = self->_knownHomeUserIdentifiers;
    self->_knownHomeUserIdentifiers = v23;

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("siriVP"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isVoiceProfileAvailable = objc_msgSend(v25, "BOOLValue");

  v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[SFAuthenticateAccountsServiceConfiguration serviceType](self->_configuration, "serviceType"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("aaServiceType"));

  if (v16)
    v28 = -[SFAuthenticateAccountsServiceConfiguration targetedAccountTypes](self->_configuration, "targetedAccountTypes");
  else
    v28 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, CFSTR("aaTargetedTypes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("ff"));

  if (-[SFAuthenticateAccountsServiceConfiguration isHomeKitSetupNeeded](self->_configuration, "isHomeKitSetupNeeded"))
    v31 = 8;
  else
    v31 = 0;
  v32 = -[SFAuthenticateAccountsServiceConfiguration serviceType](self->_configuration, "serviceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v31 | (v32 << 16) & 0x20000);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v33, CFSTR("dpf"));

  -[SFAuthenticateAccountsService _configurationExistingAccountWithType:](self, "_configurationExistingAccountWithType:", 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "aa_altDSID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setObject:forKeyedSubscript:", v35, CFSTR("aaiCloudAltDSID"));
  -[SFAuthenticateAccountsService _configurationExistingAccountWithType:](self, "_configurationExistingAccountWithType:", 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "aa_altDSID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setObject:forKeyedSubscript:", v37, CFSTR("aaiTunesAltDSID"));
  -[SFAuthenticateAccountsService _configurationExistingAccountWithType:](self, "_configurationExistingAccountWithType:", 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "aa_altDSID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "setObject:forKeyedSubscript:", v39, CFSTR("aaGameCenterAltDSID"));
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __69__SFAuthenticateAccountsService__handleInfoExchange_responseHandler___block_invoke_2;
  v42[3] = &unk_1E482F618;
  v43 = v7;
  v40 = v7;
  -[SFAuthenticateAccountsService _validateiCloudCredentialsWithRequest:unvalidatedResponse:completionHandler:](self, "_validateiCloudCredentialsWithRequest:unvalidatedResponse:completionHandler:", v6, v26, v42);

}

void __69__SFAuthenticateAccountsService__handleInfoExchange_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  SFAuthenticateAccountHomeUserInfo *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v13);
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v5);
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    v12 = -[SFAuthenticateAccountHomeUserInfo initWithHomeUUID:userUUID:isRMVEnabled:]([SFAuthenticateAccountHomeUserInfo alloc], "initWithHomeUUID:userUUID:isRMVEnabled:", v6, v8, v11);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);

  }
}

void __69__SFAuthenticateAccountsService__handleInfoExchange_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

- (BOOL)_shouldSignInAccountsInInfoRequest:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;
  SFAuthenticateAccountInfo *v9;
  void *v10;
  SFAuthenticateAccountInfo *v11;
  void *v12;
  SFAuthenticateAccountInfo *v13;
  id v14;
  void *v15;
  char v16;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aaiCloudAltDSID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[SFAuthenticateAccountInfo initWithType:altDSID:]([SFAuthenticateAccountInfo alloc], "initWithType:altDSID:", 1, v8);
      objc_msgSend(v7, "addObject:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aaiTunesAltDSID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[SFAuthenticateAccountInfo initWithType:altDSID:]([SFAuthenticateAccountInfo alloc], "initWithType:altDSID:", 2, v10);
      objc_msgSend(v7, "addObject:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("aaGameCenterAltDSID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[SFAuthenticateAccountInfo initWithType:altDSID:]([SFAuthenticateAccountInfo alloc], "initWithType:altDSID:", 3, v12);
      objc_msgSend(v7, "addObject:", v13);

    }
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = (void *)objc_msgSend(v7, "copy");
    v16 = objc_msgSend(v14, "authenticateAccountsService:shouldSignInAccounts:", self, v15);

    if ((v16 & 1) == 0
      && gLogCategory_SFAuthenticateAccountsService <= 60
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (void)_validateiCloudCredentialsWithRequest:(id)a3 unvalidatedResponse:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  OS_dispatch_queue *v14;
  ACAccountStore *accountStore;
  OS_dispatch_queue *v16;
  _QWORD v17[4];
  id v18;
  OS_dispatch_queue *v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[SFAuthenticateAccountsServiceConfiguration serviceType](self->_configuration, "serviceType"))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("aaiCloudAltDSID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAuthenticateAccountsService _configurationExistingAccountWithType:](self, "_configurationExistingAccountWithType:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aa_altDSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && self->_accountStore && objc_msgSend(v11, "isEqualToString:", v13))
    {
      v14 = self->_dispatchQueue;
      accountStore = self->_accountStore;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __109__SFAuthenticateAccountsService__validateiCloudCredentialsWithRequest_unvalidatedResponse_completionHandler___block_invoke;
      v17[3] = &unk_1E482F640;
      v18 = v9;
      v19 = v14;
      v20 = v10;
      v16 = v14;
      -[ACAccountStore verifyCredentialsForAccount:withHandler:](accountStore, "verifyCredentialsForAccount:withHandler:", v12, v17);

    }
    else
    {
      (*((void (**)(id, id))v10 + 2))(v10, v9);
    }

  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v9);
  }

}

void __109__SFAuthenticateAccountsService__validateiCloudCredentialsWithRequest_unvalidatedResponse_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 50
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10 = CFDictionaryGetInt64Ranged() | 1;
    v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("aaTargetedTypes"));

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __109__SFAuthenticateAccountsService__validateiCloudCredentialsWithRequest_unvalidatedResponse_completionHandler___block_invoke_2;
    v18[3] = &unk_1E482E0F0;
    v13 = *(NSObject **)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    v19 = v11;
    v20 = v14;
    v9 = v11;
    dispatch_async(v13, v18);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109__SFAuthenticateAccountsService__validateiCloudCredentialsWithRequest_unvalidatedResponse_completionHandler___block_invoke_3;
    block[3] = &unk_1E482E0F0;
    v8 = *(NSObject **)(a1 + 40);
    v17 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 32);
    dispatch_async(v8, block);

    v9 = v17;
  }

}

uint64_t __109__SFAuthenticateAccountsService__validateiCloudCredentialsWithRequest_unvalidatedResponse_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __109__SFAuthenticateAccountsService__validateiCloudCredentialsWithRequest_unvalidatedResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_handleTRCompanionAuthenticationRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "targetedAccountServices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "companionDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if (gLogCategory_SFAuthenticateAccountsService <= 30
          && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v8, "username");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __89__SFAuthenticateAccountsService__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke;
        v13[3] = &unk_1E482F690;
        v17 = v7;
        v13[4] = self;
        v14 = v9;
        v15 = v8;
        v16 = v10;
        -[SFAuthenticateAccountsService _saveRemoteVerifiedAccount:completion:](self, "_saveRemoteVerifiedAccount:completion:", v15, v13);

      }
      else
      {
        NSErrorWithOSStatusF();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (gLogCategory_SFAuthenticateAccountsService <= 90
          && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v11, 0);

      }
    }
    else
    {
      NSErrorWithOSStatusF();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_SFAuthenticateAccountsService <= 90
        && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v10, 0);
    }

  }
  else
  {
    NSErrorWithOSStatusF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v9, 0);
  }

}

void __89__SFAuthenticateAccountsService__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      v12 = v3;
      LogPrintF();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));
  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "_nextServiceTypeForTRAccountServices:", *(_QWORD *)(a1 + 40), v12);
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = objc_alloc((Class)getTRAnisetteDataProviderClass[0]());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "trSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithSession:", v6);

  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__SFAuthenticateAccountsService__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_2;
  v13[3] = &unk_1E482F668;
  v17 = v4;
  v10 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v11;
  objc_msgSend(v10, "_authenticateAccount:serviceType:companionDevice:anisetteDataProvider:completion:", v8, v4, v9, v7, v13);

}

void __89__SFAuthenticateAccountsService__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (!v7 || v6)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 60
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10 = objc_alloc_init((Class)getTRSetupAuthenticationResponseClass[0]());
    objc_msgSend(v10, "setUnauthenticatedAccountServices:", *(_QWORD *)(a1 + 32));
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __89__SFAuthenticateAccountsService__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_3;
    v11[3] = &unk_1E482E490;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v8, "_authenticateWithServiceTypes:authResults:completion:", v9, v7, v11);

  }
}

void __89__SFAuthenticateAccountsService__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 30
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = objc_alloc_init((Class)getTRSetupAuthenticationResponseClass[0]());
    v4 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    objc_msgSend(v3, "setUnauthenticatedAccountServices:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_handleTRProxyDeviceRequest:(id)a3 responseHandler:(id)a4
{
  void (**v5)(id, _QWORD, id);
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v5 = (void (**)(id, _QWORD, id))a4;
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend((Class)getAKDeviceClass[0](), "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLinkType:", 3);
  v7 = objc_alloc_init((Class)getTRSetupProxyDeviceResponseClass[0]());
  objc_msgSend(v7, "setProxyDevice:", v6);
  v5[2](v5, 0, v7);

}

- (void)_handleTRProxyAuthenticationRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "rawPassword");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "targetedAccountServices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if (gLogCategory_SFAuthenticateAccountsService <= 30
          && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v8, "username");
          v12 = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
        objc_msgSend(v8, "_aa_setRawPassword:", v9, v12, v13);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __85__SFAuthenticateAccountsService__handleTRProxyAuthenticationRequest_responseHandler___block_invoke;
        v14[3] = &unk_1E482F690;
        v18 = v7;
        v14[4] = self;
        v15 = v10;
        v16 = v8;
        v17 = v9;
        -[SFAuthenticateAccountsService _saveRemoteVerifiedAccount:completion:](self, "_saveRemoteVerifiedAccount:completion:", v16, v14);

      }
      else
      {
        NSErrorWithOSStatusF();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (gLogCategory_SFAuthenticateAccountsService <= 90
          && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v11, 0);

      }
    }
    else
    {
      NSErrorWithOSStatusF();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_SFAuthenticateAccountsService <= 90
        && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v10, 0);
    }

  }
  else
  {
    NSErrorWithOSStatusF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v9, 0);
  }

}

void __85__SFAuthenticateAccountsService__handleTRProxyAuthenticationRequest_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      v11 = v3;
      LogPrintF();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));
  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "_nextServiceTypeForTRAccountServices:", *(_QWORD *)(a1 + 40), v11);
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__SFAuthenticateAccountsService__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_2;
  v12[3] = &unk_1E482F6B8;
  v15 = v4;
  v8 = *(id *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v14 = v8;
  v12[4] = v9;
  v13 = v10;
  objc_msgSend(v5, "_authenticateAccount:serviceType:password:completion:", v6, v4, v7, v12);

}

void __85__SFAuthenticateAccountsService__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (!v7 || v6)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v10 + 16))(v10, v6, 0);
    }
    else
    {
      NSErrorWithOSStatusF();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v10 + 16))(v10, v11, 0);

    }
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __85__SFAuthenticateAccountsService__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_3;
    v12[3] = &unk_1E482E490;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v8, "_authenticateWithServiceTypes:authResults:completion:", v9, v7, v12);

  }
}

void __85__SFAuthenticateAccountsService__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 30
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = objc_alloc_init((Class)getTRSetupAuthenticationResponseClass[0]());
    v4 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    objc_msgSend(v3, "setUnauthenticatedAccountServices:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_authenticateAccount:(id)a3 serviceType:(int64_t)a4 companionDevice:(id)a5 anisetteDataProvider:(id)a6 completion:(id)a7
{
  Class (__cdecl *v11)();
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v11 = (Class (__cdecl *)())getAKAppleIDAuthenticationContextClass[0];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v18 = objc_alloc_init(v11());
  objc_msgSend(v18, "_setProxyingForApp:", 1);
  objc_msgSend(v18, "setAnisetteDataProvider:", v13);

  objc_msgSend(v18, "setAuthenticationType:", 1);
  objc_msgSend(v18, "setCompanionDevice:", v14);

  objc_msgSend(v18, "setIsUsernameEditable:", 0);
  objc_msgSend(v18, "setServiceType:", a4);
  objc_msgSend(v18, "setShouldAllowAppleIDCreation:", 0);
  objc_msgSend(v18, "setShouldUpdatePersistentServiceTokens:", 1);
  objc_msgSend(v15, "username");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setUsername:", v16);
  v17 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass[0]());
  objc_msgSend(v17, "authenticateWithContext:completion:", v18, v12);

}

- (void)_authenticateAccount:(id)a3 serviceType:(int64_t)a4 password:(id)a5 completion:(id)a6
{
  Class (__cdecl *v9)();
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v9 = (Class (__cdecl *)())getAKAppleIDAuthenticationContextClass[0];
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v15 = objc_alloc_init(v9());
  objc_msgSend(v15, "_setProxyingForApp:", 1);
  objc_msgSend(v15, "_setPassword:", v11);

  objc_msgSend(v15, "setAuthenticationType:", 1);
  objc_msgSend(v15, "setIsUsernameEditable:", 0);
  objc_msgSend(v15, "setServiceType:", a4);
  objc_msgSend(v15, "setShouldAllowAppleIDCreation:", 0);
  objc_msgSend(v15, "setShouldUpdatePersistentServiceTokens:", 1);
  objc_msgSend(v12, "username");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setUsername:", v13);
  v14 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass[0]());
  objc_msgSend(v14, "authenticateWithContext:completion:", v15, v10);

}

- (void)__runAuthenticateiCloudWithAuthResults:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "setWithObject:", &unk_1E48907A8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SFAuthenticateAccountsService _authenticateWithServiceTypes:authResults:completion:](self, "_authenticateWithServiceTypes:authResults:completion:", v9, v8, v7);

}

- (void)_authenticateWithServiceTypes:(id)a3 authResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**progressHandler)(id, uint64_t, _QWORD);
  unint64_t v12;
  uint64_t v13;
  id WeakRetained;
  char v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  int v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 801, 0);
    v12 = -[SFAuthenticateAccountsService _nextTRServiceTypeForTRAccountServices:](self, "_nextTRServiceTypeForTRAccountServices:", v8);
    v13 = -[SFAuthenticateAccountsService _accountTypeForTRAccountService:](self, "_accountTypeForTRAccountService:", v12);
    if (gLogCategory_SFAuthenticateAccountsService <= 30
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "authenticateAccountsService:willAttemptSignInWithAccountType:", self, v13);

    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __86__SFAuthenticateAccountsService__authenticateWithServiceTypes_authResults_completion___block_invoke;
    v17[3] = &unk_1E482F6E0;
    v22 = v13;
    v17[4] = self;
    v21 = v12;
    v20 = v10;
    v18 = v9;
    v19 = v8;
    -[SFAuthenticateAccountsService _authenticateWithServiceType:authResults:completion:](self, "_authenticateWithServiceType:authResults:completion:", v12, v18, v17);

  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 30
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __86__SFAuthenticateAccountsService__authenticateWithServiceTypes_authResults_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  SFAuthenticateAccountInfo *v15;
  id v16;
  char v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD block[5];
  id v24;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 152);
  if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 802, 0);
    v4 = *(_QWORD *)(a1 + 32);
  }
  WeakRetained = objc_loadWeakRetained((id *)(v4 + 136));
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
    objc_msgSend(v8, "authenticateAccountsService:didAttemptSignInWithAccountType:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 72));

  }
  if (*(_DWORD *)(a1 + 72) == 2)
  {
    objc_msgSend(v3, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    getSSServerErrorDomain[0]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqual:", v10) & 1) != 0)
    {
      v11 = objc_msgSend(v3, "code");

      if (v11 == 5304)
      {
        if (gLogCategory_SFAuthenticateAccountsService <= 50
          && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v3)
          goto LABEL_25;
        goto LABEL_20;
      }
    }
    else
    {

    }
  }
  if (!v3)
  {
LABEL_20:
    v12 = *(void **)(a1 + 40);
    getAKAuthenticationAlternateDSIDKey[0]();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[SFAuthenticateAccountInfo initWithType:altDSID:]([SFAuthenticateAccountInfo alloc], "initWithType:altDSID:", *(unsigned int *)(a1 + 72), v14);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", v15);
    v16 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
      objc_msgSend(v18, "authenticateAccountsService:didAuthenticateWithAccountInfo:", *(_QWORD *)(a1 + 32), v15);

    }
    if (*(_DWORD *)(a1 + 72) == 1)
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(NSObject **)(v19 + 144);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __86__SFAuthenticateAccountsService__authenticateWithServiceTypes_authResults_completion___block_invoke_2;
      block[3] = &unk_1E482D3A0;
      block[4] = v19;
      v24 = v14;
      dispatch_async(v20, block);

    }
LABEL_25:
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "removeObject:", v22);

    objc_msgSend(*(id *)(a1 + 32), "_authenticateWithServiceTypes:authResults:completion:", v21, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    goto LABEL_26;
  }
  if (gLogCategory_SFAuthenticateAccountsService <= 90
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v3);
LABEL_26:

}

void __86__SFAuthenticateAccountsService__authenticateWithServiceTypes_authResults_completion___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_configurationExistingAccountWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 50
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setAltDSIDNeedingRepair:", *(_QWORD *)(a1 + 40));
  }
}

- (void)_authenticateWithServiceType:(unint64_t)a3 authResults:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  id v10;

  v10 = a4;
  v8 = (void (**)(id, void *))a5;
  switch(a3)
  {
    case 3uLL:
      -[SFAuthenticateAccountsService _authenticateGameCenterWithAuthResults:completion:](self, "_authenticateGameCenterWithAuthResults:completion:", v10, v8);
      break;
    case 2uLL:
      -[SFAuthenticateAccountsService _authenticateiTunesWithAuthResults:completion:](self, "_authenticateiTunesWithAuthResults:completion:", v10, v8);
      break;
    case 1uLL:
      -[SFAuthenticateAccountsService _authenticateiCloudWithAuthResults:completion:](self, "_authenticateiCloudWithAuthResults:completion:", v10, v8);
      break;
    default:
      NSErrorWithOSStatusF();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v9);

      break;
  }

}

- (void)_authenticateiCloudWithAuthResults:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  SFAuthenticateAccountsService *v15;
  id v16;

  v6 = a3;
  v7 = a4;
  getAKAuthenticationUsernameKey[0]();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_accountStore)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCF68]), "initWithAccountStore:", self->_accountStore);
    v10 = objc_alloc_init(MEMORY[0x1E0CFCF58]);
    objc_msgSend(v10, "setAuthenticationResults:", v6);
    objc_msgSend(v10, "setCdpUiProvider:", self->_cdpUIProvider);
    v11 = *MEMORY[0x1E0CFCF18];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __79__SFAuthenticateAccountsService__authenticateiCloudWithAuthResults_completion___block_invoke;
    v13[3] = &unk_1E482F730;
    v14 = v8;
    v15 = self;
    v16 = v7;
    objc_msgSend(v9, "signInService:withContext:completion:", v11, v10, v13);

  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    NSErrorWithOSStatusF();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);

  }
}

void __79__SFAuthenticateAccountsService__authenticateiCloudWithAuthResults_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 30
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
    goto LABEL_19;
  }
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getAASignInErrorDomain[0]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    v9 = objc_msgSend(v6, "code");

    if (v9 == -8010)
    {
      if (gLogCategory_SFAuthenticateAccountsService <= 50
        && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v12 = *(void **)(a1 + 32);
      v13 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __79__SFAuthenticateAccountsService__authenticateiCloudWithAuthResults_completion___block_invoke_2;
      v14[3] = &unk_1E482F708;
      v15 = v12;
      v16 = *(id *)(a1 + 48);
      objc_msgSend(v13, "sendRequestID:options:request:responseHandler:", CFSTR("_aaTerms"), 0, MEMORY[0x1E0C9AA70], v14);

      goto LABEL_19;
    }
  }
  else
  {

  }
  if (gLogCategory_SFAuthenticateAccountsService <= 90
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v10 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v6);
  }
  else
  {
    NSErrorWithOSStatusF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  }
LABEL_19:

}

void __79__SFAuthenticateAccountsService__authenticateiCloudWithAuthResults_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (v9)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v9);
  }

}

- (void)_authenticateiTunesWithAuthResults:(id)a3 completion:(id)a4
{
  id v6;
  void (__cdecl *v7)();
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v6 = a4;
  v7 = (void (__cdecl *)())getAKAuthenticationUsernameKey[0];
  v8 = a3;
  v7();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  getAKAuthenticationAlternateDSIDKey[0]();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  getAKAuthenticationPasswordKey[0]();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAuthenticateAccountsServiceConfiguration isHomeSharingSetupNeeded](self->_configuration, "isHomeSharingSetupNeeded");
  if (gLogCategory_SFAuthenticateAccountsService <= 30
    && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend((Class)getSSMutableAuthenticationContextClass[0](), "contextForSignIn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccountName:", v9);
  objc_msgSend(v12, "setAllowsRetry:", 0);
  objc_msgSend(v12, "setAltDSID:", v10);
  objc_msgSend(v12, "setCanSetActiveAccount:", 0);
  objc_msgSend(v12, "setPasswordEquivalentToken:", v11);
  objc_msgSend(v12, "setPromptStyle:", 1);
  objc_msgSend(v12, "setShouldSuppressDialogs:", 0);
  objc_msgSend((Class)getSSAccountStoreClass[0](), "defaultStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc((Class)getSSAuthenticateRequestClass[0]()), "initWithAuthenticationContext:", v12);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__SFAuthenticateAccountsService__authenticateiTunesWithAuthResults_completion___block_invoke;
  v18[3] = &unk_1E482F758;
  v20 = v13;
  v21 = v6;
  v19 = v9;
  v15 = v13;
  v16 = v6;
  v17 = v9;
  objc_msgSend(v14, "startWithAuthenticateResponseBlock:", v18);

}

void __79__SFAuthenticateAccountsService__authenticateiTunesWithAuthResults_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(a2, "authenticatedAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 30
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      v8 = v5;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 40), "saveAccount:error:", v5, 0, v8);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 90
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6 = *(_QWORD *)(a1 + 48);
    if (v9)
    {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v9);
    }
    else
    {
      NSErrorWithOSStatusF();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
  }

}

- (void)_authenticateGameCenterWithAuthResults:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  NSErrorWithOSStatusF();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v5, v6);

}

- (int64_t)_nextServiceTypeForTRAccountServices:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsObject:", &unk_1E48907A8) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsObject:", &unk_1E48907C0) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "containsObject:", &unk_1E48907D8))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)_nextTRServiceTypeForTRAccountServices:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsObject:", &unk_1E48907A8) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsObject:", &unk_1E48907C0) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "containsObject:", &unk_1E48907D8))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)_accountTypeForTRAccountService:(unint64_t)a3
{
  if (a3 - 1 < 3)
    return a3;
  else
    return 0;
}

- (void)_saveAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  ACAccountStore *accountStore;
  id v21;
  id v22;
  SFAuthenticateAccountsService *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setAuthenticated:", 0);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v6, "aa_isPrimaryEmailVerified"))
  {
    v22 = v7;
    v23 = self;
    v24 = v6;
    -[ACAccountStore dataclassActionsForAccountSave:](self->_accountStore, "dataclassActionsForAccountSave:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v10)
    {
      v11 = v10;
      v25 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          objc_msgSend(v9, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v29 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                if (objc_msgSend(v19, "type"))
                  objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, v13);
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v16);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v11);
    }

    self = v23;
    v6 = v24;
    v7 = v22;
  }
  accountStore = self->_accountStore;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __57__SFAuthenticateAccountsService__saveAccount_completion___block_invoke;
  v26[3] = &unk_1E482F780;
  v27 = v7;
  v21 = v7;
  -[ACAccountStore saveAccount:withDataclassActions:completion:](accountStore, "saveAccount:withDataclassActions:completion:", v6, v8, v26);

}

void __57__SFAuthenticateAccountsService__saveAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  if (v5 || (a2 & 1) == 0)
  {
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
    }
    else
    {
      NSErrorWithOSStatusF();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }

}

- (void)_saveRemoteVerifiedAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  ACAccountStore *accountStore;
  ACAccountStore *v9;
  ACAccountStore *v10;
  void *v11;
  void *v12;
  void *v13;
  ACAccountStore *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    objc_msgSend((Class)getACAccountStoreClass[0](), "defaultStore");
    v9 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
    v10 = self->_accountStore;
    self->_accountStore = v9;

    accountStore = self->_accountStore;
  }
  objc_msgSend(v6, "accountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountStore accountTypeWithAccountTypeIdentifier:](accountStore, "accountTypeWithAccountTypeIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccountType:", v13);
  objc_msgSend(v6, "_setObjectID:", 0);
  objc_msgSend(v6, "markAllPropertiesDirty");
  v14 = self->_accountStore;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__SFAuthenticateAccountsService__saveRemoteVerifiedAccount_completion___block_invoke;
  v16[3] = &unk_1E482F780;
  v17 = v7;
  v15 = v7;
  -[ACAccountStore saveVerifiedAccount:withCompletionHandler:](v14, "saveVerifiedAccount:withCompletionHandler:", v6, v16);

}

void __71__SFAuthenticateAccountsService__saveRemoteVerifiedAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    if (!v5)
      goto LABEL_7;
    goto LABEL_6;
  }
  v7 = v5;
  if (objc_msgSend(v5, "code") == 5)
  {
    v5 = v7;
LABEL_6:

LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v6 = (uint64_t)v7;
  if (!v7)
  {
    NSErrorWithOSStatusF();
    v6 = objc_claimAutoreleasedReturnValue();
  }
LABEL_8:
  v8 = (id)v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_handleRequest:(id)a3 flags:(unsigned int)a4 session:(id)a5 responseHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  uint64_t Int64Ranged;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v8 = *(_QWORD *)&a4;
  v26[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if ((_DWORD)Int64Ranged == 9)
  {
    if ((v8 & 1) != 0)
    {
      if (gLogCategory_SFAuthenticateAccountsService <= 30
        && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (-[SFAuthenticateAccountsServiceConfiguration isHomeKitSetupNeeded](self->_configuration, "isHomeKitSetupNeeded"))
      {
        self->_homeKitSetupDidSucceed = CFDictionaryGetInt64() != 0;
      }
      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v12 + 2))(v12, v8, 0, MEMORY[0x1E0C9AA70]);
      -[SFAuthenticateAccountsService _finishSession:](self, "_finishSession:", v11);
      goto LABEL_18;
    }
    v14 = -6768;
    if (gLogCategory_SFAuthenticateAccountsService <= 60)
    {
      if (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize())
        LogPrintF();
      v14 = -6768;
    }
  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsService <= 60
      && (gLogCategory_SFAuthenticateAccountsService != -1 || _LogCategory_Initialize()))
    {
      v23 = Int64Ranged;
      v24 = 0;
      LogPrintF();
    }
    v14 = -6732;
  }
  v15 = (void *)MEMORY[0x1E0CB35C8];
  v16 = *MEMORY[0x1E0CB2F90];
  v17 = v14;
  v25 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  v20 = CFSTR("?");
  if (v18)
    v20 = (const __CFString *)v18;
  v26[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1, v23, v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, void *, _QWORD))v12 + 2))(v12, v8, v22, 0);

LABEL_18:
}

- (id)_configurationExistingAccountWithType:(unsigned int)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (a3 - 1 > 2)
  {
    v11 = 0;
  }
  else
  {
    v5 = **((id **)&unk_1E482F848 + (int)(a3 - 1));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[SFAuthenticateAccountsServiceConfiguration existingAccountsIdentifiers](self->_configuration, "existingAccountsIdentifiers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        -[ACAccountStore accountWithIdentifier:](self->_accountStore, "accountWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "accountType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v5);

        if ((v14 & 1) != 0)
          break;

        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v11 = 0;
    }

  }
  return v11;
}

- (void)_finishSession:(id)a3
{
  void *v4;
  id WeakRetained;
  char v6;
  SFAuthenticateAccountResult *v7;
  void *v8;
  SFAuthenticateAccountResult *v9;
  id v10;
  void (**progressHandler)(id, uint64_t, _QWORD);
  id object;

  object = a3;
  objc_getAssociatedObject(object, "finished");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "BOOLValue") & 1) == 0)
  {
    if (-[NSMutableArray count](self->_authenticatedAccounts, "count"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        v7 = [SFAuthenticateAccountResult alloc];
        v8 = (void *)-[NSMutableArray copy](self->_authenticatedAccounts, "copy");
        v9 = -[SFAuthenticateAccountResult initWithAuthenticatedAccounts:knownHomeUserIdentifiers:isVoiceProfileAvailable:](v7, "initWithAuthenticatedAccounts:knownHomeUserIdentifiers:isVoiceProfileAvailable:", v8, self->_knownHomeUserIdentifiers, self->_isVoiceProfileAvailable);

        -[SFAuthenticateAccountResult setPreferredLanguageCode:](v9, "setPreferredLanguageCode:", self->_preferredLanguageCode);
        -[SFAuthenticateAccountResult setLocaleIdentifier:](v9, "setLocaleIdentifier:", self->_localeIdentifier);
        -[SFAuthenticateAccountResult setPreferredLanguages:](v9, "setPreferredLanguages:", self->_preferredLanguages);
        -[SFAuthenticateAccountResult setKeyboards:](v9, "setKeyboards:", self->_keyboards);
        v10 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v10, "authenticateAccountsService:didFinishAuthentication:", self, v9);

      }
    }
    objc_setAssociatedObject(object, "finished", MEMORY[0x1E0C9AAB0], (void *)0x301);
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 100, 0);
  }

}

- (SFAuthenticateAccountsServiceDelegate)delegate
{
  return (SFAuthenticateAccountsServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)homeKitSetupDidSucceed
{
  return self->_homeKitSetupDidSucceed;
}

- (void)setHomeKitSetupDidSucceed:(BOOL)a3
{
  self->_homeKitSetupDidSucceed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_keyboards, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredLanguageCode, 0);
  objc_storeStrong((id *)&self->_cdpSetupHandler, 0);
  objc_storeStrong((id *)&self->_homeKitSetupHandler, 0);
  objc_storeStrong((id *)&self->_knownHomeUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_authenticatedAccounts, 0);
  objc_storeStrong((id *)&self->_cdpUIProvider, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
}

@end
