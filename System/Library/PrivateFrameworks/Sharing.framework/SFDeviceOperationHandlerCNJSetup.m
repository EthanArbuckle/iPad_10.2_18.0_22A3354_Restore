@implementation SFDeviceOperationHandlerCNJSetup

- (SFDeviceOperationHandlerCNJSetup)init
{
  SFDeviceOperationHandlerCNJSetup *v2;
  SFDeviceOperationHandlerCNJSetup *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFDeviceOperationHandlerCNJSetup;
  v2 = -[SFDeviceOperationHandlerCNJSetup init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_cnsNotifyToken = -1;
  }
  return v3;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SFDeviceOperationHandlerCNJSetup_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __44__SFDeviceOperationHandlerCNJSetup_activate__block_invoke(uint64_t result)
{
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD handler[5];

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 48))
  {
    v1 = result;
    if (gLogCategory_SFDeviceOperationCNJ <= 30
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = (const char *)*MEMORY[0x1E0D0D2E8];
    v3 = *(_QWORD *)(v1 + 32);
    v4 = MEMORY[0x1E0C809B0];
    v5 = *(NSObject **)(v3 + 56);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __44__SFDeviceOperationHandlerCNJSetup_activate__block_invoke_2;
    handler[3] = &unk_1E482FB48;
    handler[4] = v3;
    notify_register_dispatch(v2, (int *)(v3 + 32), v5, handler);
    objc_msgSend(*(id *)(v1 + 32), "_updateCaptiveState");
    v6 = *(_QWORD *)(v1 + 32);
    v7 = *(void **)(v6 + 48);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __44__SFDeviceOperationHandlerCNJSetup_activate__block_invoke_3;
    v8[3] = &unk_1E482E2D0;
    v8[4] = v6;
    return objc_msgSend(v7, "registerRequestID:options:handler:", CFSTR("_cnj"), 0, v8);
  }
  else if (gLogCategory_SFDeviceOperationCNJ <= 60)
  {
    if (gLogCategory_SFDeviceOperationCNJ != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

uint64_t __44__SFDeviceOperationHandlerCNJSetup_activate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCaptiveState");
}

uint64_t __44__SFDeviceOperationHandlerCNJSetup_activate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runReachability:responseHandler:");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SFDeviceOperationHandlerCNJSetup_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __46__SFDeviceOperationHandlerCNJSetup_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;

  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 32);
  if (v3 != -1)
  {
    notify_cancel(v3);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = -1;
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 48), "deregisterRequestID:", CFSTR("_cnj"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "deregisterRequestID:", CFSTR("_cnjExtIO"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

}

- (void)_updateCaptiveState
{
  if (!self->_invalidateCalled)
  {
    if (self->_reachabilityDone || !CNUserInteractionIsRequired())
    {
      if (gLogCategory_SFDeviceOperationCNJ <= 30
        && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceOperationCNJ <= 30
        && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_reachabilityDone = 1;
      if (self->_responseHandler)
      {
        if (gLogCategory_SFDeviceOperationCNJ <= 30
          && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        -[SFDeviceOperationHandlerCNJSetup _handleCaptiveJoinRequestWithResponseHandler:](self, "_handleCaptiveJoinRequestWithResponseHandler:", self->_responseHandler);
      }
    }
  }
}

- (void)_runReachability:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id responseHandler;
  CUReachabilityMonitor *v11;
  CUReachabilityMonitor *reachabilityMonitor;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  SFDeviceOperationHandlerCNJSetup *v17;
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_reachabilityDone)
  {
    if (gLogCategory_SFDeviceOperationCNJ <= 30
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFDeviceOperationHandlerCNJSetup _handleCaptiveJoinRequestWithResponseHandler:](self, "_handleCaptiveJoinRequestWithResponseHandler:", v8);
  }
  else
  {
    v9 = _Block_copy(v7);
    responseHandler = self->_responseHandler;
    self->_responseHandler = v9;

    location = 0;
    objc_initWeak(&location, self);
    -[CUReachabilityMonitor invalidate](self->_reachabilityMonitor, "invalidate");
    v11 = (CUReachabilityMonitor *)objc_alloc_init(MEMORY[0x1E0D1B420]);
    reachabilityMonitor = self->_reachabilityMonitor;
    self->_reachabilityMonitor = v11;

    -[CUReachabilityMonitor setDispatchQueue:](self->_reachabilityMonitor, "setDispatchQueue:", self->_dispatchQueue);
    -[CUReachabilityMonitor setTimeout:](self->_reachabilityMonitor, "setTimeout:", 60.0);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __69__SFDeviceOperationHandlerCNJSetup__runReachability_responseHandler___block_invoke;
    v16 = &unk_1E4833370;
    v17 = self;
    v18 = v8;
    objc_copyWeak(&v19, &location);
    -[CUReachabilityMonitor setCompletionHandler:](self->_reachabilityMonitor, "setCompletionHandler:", &v13);
    -[CUReachabilityMonitor activate](self->_reachabilityMonitor, "activate", v13, v14, v15, v16, v17);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }

}

void __69__SFDeviceOperationHandlerCNJSetup__runReachability_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void (*v8)(void);
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 16) && !*(_BYTE *)(v4 + 36))
  {
    *(_BYTE *)(v4 + 36) = 1;
    v9 = v3;
    if (v3)
    {
      if (objc_msgSend(v3, "code") != -6722
        || (objc_msgSend(v9, "domain"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            v6 = (void *)*MEMORY[0x1E0CB2F90],
            v5,
            v5 != v6))
      {
        if (gLogCategory_SFDeviceOperationCNJ <= 30
          && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(WeakRetained, "_handleCaptiveJoinRequestWithResponseHandler:reachabilityError:", *(_QWORD *)(a1 + 40), v9);

        goto LABEL_22;
      }
      if (gLogCategory_SFDeviceOperationCNJ <= 30
        && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      if (gLogCategory_SFDeviceOperationCNJ <= 30
        && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v8();
LABEL_22:
    v3 = v9;
  }

}

- (void)_handleCaptiveJoinRequestWithResponseHandler:(id)a3
{
  -[SFDeviceOperationHandlerCNJSetup _handleCaptiveJoinRequestWithResponseHandler:reachabilityError:](self, "_handleCaptiveJoinRequestWithResponseHandler:reachabilityError:", a3, 0);
}

- (void)_handleCaptiveJoinRequestWithResponseHandler:(id)a3 reachabilityError:(id)a4
{
  id v6;
  id v7;
  SKSetupCaptiveNetworkJoinServer *v8;
  SKSetupCaptiveNetworkJoinServer *cnjServer;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8 = (SKSetupCaptiveNetworkJoinServer *)objc_alloc_init((Class)getSKSetupCaptiveNetworkJoinServerClass[0]());
  cnjServer = self->_cnjServer;
  self->_cnjServer = v8;

  location = 0;
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __99__SFDeviceOperationHandlerCNJSetup__handleCaptiveJoinRequestWithResponseHandler_reachabilityError___block_invoke;
  v16 = &unk_1E4833320;
  objc_copyWeak(&v17, &location);
  -[SKSetupCaptiveNetworkJoinServer setSendDataHandler:](self->_cnjServer, "setSendDataHandler:", &v13);
  -[SKSetupCaptiveNetworkJoinServer setEventHandler:](self->_cnjServer, "setEventHandler:", &__block_literal_global_220, v13, v14, v15, v16);
  -[SFSession pairingDeriveKeyForIdentifier:keyLength:](self->_sfSession, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("A2A772B2-84C1-447A-B978-5793FF08E513"), 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SKSetupCaptiveNetworkJoinServer setPskData:](self->_cnjServer, "setPskData:", v10);
    -[SFSession registerForExternalIO:](self->_sfSession, "registerForExternalIO:", self->_cnjServer);
    -[SKSetupCaptiveNetworkJoinServer activate](self->_cnjServer, "activate");
    v11 = (void *)objc_opt_new();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("re"));

    }
    (*((void (**)(id, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, v11);
  }
  else
  {
    NSErrorWithOSStatusF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v6 + 2))(v6, v11, 0, 0);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __99__SFDeviceOperationHandlerCNJSetup__handleCaptiveJoinRequestWithResponseHandler_reachabilityError___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "sfSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendExternalIO:", v3);

}

void __99__SFDeviceOperationHandlerCNJSetup__handleCaptiveJoinRequestWithResponseHandler_reachabilityError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && ((v5 = v2, gLogCategory_SFDeviceOperationCNJ != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
  objc_storeStrong((id *)&self->_sfSession, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_cnjServer, 0);
}

@end
