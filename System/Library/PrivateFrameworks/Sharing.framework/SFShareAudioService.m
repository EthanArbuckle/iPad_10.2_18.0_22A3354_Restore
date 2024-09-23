@implementation SFShareAudioService

- (SFShareAudioService)init
{
  SFShareAudioService *v2;
  SFShareAudioService *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  SFShareAudioService *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFShareAudioService;
  v2 = -[SFShareAudioService init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
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
  block[2] = __31__SFShareAudioService_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__SFShareAudioService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFShareAudioService <= 30
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_sfServiceStart");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SFShareAudioService_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__SFShareAudioService_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 24))
  {
    v1 = result;
    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 24) = 1;
    return objc_msgSend(*(id *)(v1 + 32), "_invalidate");
  }
  return result;
}

- (void)_invalidate
{
  SFService *sfService;

  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    -[SFShareAudioService _handleSessionEnded:error:](self, "_handleSessionEnded:error:", self->_sfSession, 0);
    -[SFService invalidate](self->_sfService, "invalidate");
    sfService = self->_sfService;
    self->_sfService = 0;

    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_sfServiceStart
{
  SFService *v3;
  SFService *sfService;
  SFService *v5;
  uint64_t v6;
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];

  if (gLogCategory_SFShareAudioService <= 30
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFService invalidate](self->_sfService, "invalidate");
  v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;
  v5 = v3;

  -[SFService setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
  -[SFService setFixedPIN:](v5, "setFixedPIN:", CFSTR("public"));
  -[SFService setIdentifier:](v5, "setIdentifier:", CFSTR("com.apple.sharing.ShareAudio"));
  -[SFService setLabel:](v5, "setLabel:", CFSTR("ShareAudio"));
  -[SFService setSessionFlags:](v5, "setSessionFlags:", 2305);
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__SFShareAudioService__sfServiceStart__block_invoke;
  v9[3] = &unk_1E4834480;
  v9[4] = v5;
  v9[5] = self;
  -[SFService setSessionStartedHandler:](v5, "setSessionStartedHandler:", v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __38__SFShareAudioService__sfServiceStart__block_invoke_2;
  v8[3] = &unk_1E48344A8;
  v8[4] = v5;
  v8[5] = self;
  -[SFService setSessionEndedHandler:](v5, "setSessionEndedHandler:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __38__SFShareAudioService__sfServiceStart__block_invoke_3;
  v7[3] = &unk_1E482E2F8;
  v7[4] = v5;
  v7[5] = self;
  -[SFService activateWithCompletion:](v5, "activateWithCompletion:", v7);

}

_QWORD *__38__SFShareAudioService__sfServiceStart__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[7])
    return (_QWORD *)objc_msgSend(result, "_handleSessionStarted:", a2);
  return result;
}

_QWORD *__38__SFShareAudioService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v4 == result[7])
    return (_QWORD *)objc_msgSend(result, "_handleSessionEnded:error:", a2, a3);
  return result;
}

void __38__SFShareAudioService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56))
  {
    if (v3)
    {
      v9 = v3;
      if (gLogCategory_SFShareAudioService <= 90
        && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
      {
        v8 = v9;
        LogPrintF();
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "invalidate", v8);
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 56);
      *(_QWORD *)(v5 + 56) = 0;

      goto LABEL_11;
    }
    if (gLogCategory_SFShareAudioService <= 30)
    {
      v9 = 0;
      if (gLogCategory_SFShareAudioService != -1 || (v7 = _LogCategory_Initialize(), v4 = 0, v7))
      {
        LogPrintF();
LABEL_11:
        v4 = v9;
      }
    }
  }

}

- (void)_handleSessionStarted:(id)a3
{
  id v5;
  SFSession *sfSession;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v5 = a3;
  sfSession = self->_sfSession;
  if (sfSession)
  {
    if (gLogCategory_SFShareAudioService <= 60)
    {
      if (gLogCategory_SFShareAudioService == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_7;
        sfSession = self->_sfSession;
      }
      -[SFSession peer](sfSession, "peer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "peer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
  else
  {
    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "peer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_msgSend(v5, "setStatusMonitor:", self->_statusMonitor, v8);
    objc_storeStrong((id *)&self->_sfSession, a3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__SFShareAudioService__handleSessionStarted___block_invoke;
    v10[3] = &unk_1E482E2D0;
    v10[4] = self;
    objc_msgSend(v5, "registerRequestID:options:handler:", CFSTR("_shAu"), &unk_1E48916B0, v10);
  }
LABEL_7:

}

uint64_t __45__SFShareAudioService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleShareAudioRequest:responseHandler:");
}

- (void)_handleSessionEnded:(id)a3 error:(id)a4
{
  id v6;
  SFSession *sfSession;
  SFBluetoothPairingSession *pairingSession;
  SFProxCardSessionClient *proxCardSessionClient;
  OS_dispatch_source *searchTimer;
  NSObject *v11;
  OS_dispatch_source *v12;
  CUBluetoothClient *searchBTClient;
  void *v14;
  void *v15;
  int v16;
  id responseHandler;
  void *v18;
  id v19;
  SFSession *v20;

  v20 = (SFSession *)a3;
  v6 = a4;
  if (self->_sfSession == v20)
  {
    if (v20)
    {
      sfSession = v20;
      if (gLogCategory_SFShareAudioService <= 30)
      {
        sfSession = v20;
        if (gLogCategory_SFShareAudioService != -1
          || (v16 = _LogCategory_Initialize(), sfSession = self->_sfSession, v16))
        {
          -[SFSession peer](sfSession, "peer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v6;
          LogPrintF();

          sfSession = self->_sfSession;
        }
      }
    }
    else
    {
      sfSession = 0;
    }
    self->_sfSession = 0;

    -[SFBluetoothPairingSession invalidate](self->_pairingSession, "invalidate");
    pairingSession = self->_pairingSession;
    self->_pairingSession = 0;

    -[SFProxCardSessionClient invalidate](self->_proxCardSessionClient, "invalidate");
    proxCardSessionClient = self->_proxCardSessionClient;
    self->_proxCardSessionClient = 0;

    searchTimer = self->_searchTimer;
    if (searchTimer)
    {
      v11 = searchTimer;
      dispatch_source_cancel(v11);
      v12 = self->_searchTimer;
      self->_searchTimer = 0;

    }
    -[CUBluetoothClient invalidate](self->_searchBTClient, "invalidate", v18, v19);
    searchBTClient = self->_searchBTClient;
    self->_searchBTClient = 0;

    v14 = _Block_copy(self->_responseHandler);
    if (v14)
    {
      NSErrorF();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_SFShareAudioService < 91
        && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(void *, void *, _QWORD, _QWORD))v14 + 2))(v14, v15, 0, 0);
      responseHandler = self->_responseHandler;
      self->_responseHandler = 0;

    }
  }

}

- (void)_handleShareAudioRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  SFSession *sfSession;
  OS_dispatch_queue *dispatchQueue;
  id v10;
  id v11;
  SFSession *v12;
  _QWORD v13[6];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFShareAudioService <= 30
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  sfSession = self->_sfSession;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__SFShareAudioService__handleShareAudioRequest_responseHandler___block_invoke;
  v13[3] = &unk_1E48344D0;
  v13[4] = sfSession;
  v13[5] = self;
  v14 = v6;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  v12 = sfSession;
  -[SFSession appleIDVerifyProof:dispatchQueue:completion:](v12, "appleIDVerifyProof:dispatchQueue:completion:", v11, dispatchQueue, v13);

}

void __64__SFShareAudioService__handleShareAudioRequest_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64))
  {
    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v9, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      objc_msgSend(*(id *)(a1 + 40), "_handleShareAudioRequest2:contact:responseHandler:", *(_QWORD *)(a1 + 48), v9, *(_QWORD *)(a1 + 56), v7, v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_handleShareAudioRequest2:contact:responseHandler:", *(_QWORD *)(a1 + 48), v9, *(_QWORD *)(a1 + 56), v6, v8);
    }
  }

}

- (void)_handleShareAudioRequest2:(id)a3 contact:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  id responseHandler;
  SFProxCardSessionClient *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[6];
  int v28;
  _QWORD aBlock[4];
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__17;
  v36 = __Block_byref_object_dispose__17;
  v11 = MEMORY[0x1E0C809B0];
  v37 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke;
  aBlock[3] = &unk_1E48344F8;
  v31 = &v32;
  v12 = v10;
  v30 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (self->_responseHandler)
  {
    NSErrorF();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v33[5];
    v33[5] = v22;

  }
  else
  {
    v28 = 0;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_storeStrong((id *)&self->_guestDeviceAddress, v14);
      v15 = _Block_copy(v12);
      responseHandler = self->_responseHandler;
      self->_responseHandler = v15;

      if (gLogCategory_SFShareAudioService <= 30
        && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[SFProxCardSessionClient invalidate](self->_proxCardSessionClient, "invalidate");
      v17 = objc_alloc_init(SFProxCardSessionClient);
      objc_storeStrong((id *)&self->_proxCardSessionClient, v17);
      -[SFProxCardSessionClient setDelegate:](v17, "setDelegate:", self);
      -[SFProxCardSessionClient setDispatchQueue:](v17, "setDispatchQueue:", self->_dispatchQueue);
      -[SFProxCardSessionClient setViewControllerClassName:](v17, "setViewControllerClassName:", CFSTR("ShareAudioAcceptMainController"));
      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      CFStringGetTypeID();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", CFDictionaryGetTypedValue(), CFSTR("deviceName"));
      v19 = v9;
      if (v19)
      {
        v20 = v9;
        objc_msgSend((Class)getCNContactFormatterClass_0[0](), "stringFromContact:style:", v19, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("username"));

        v9 = v20;
        v11 = MEMORY[0x1E0C809B0];
      }

      -[SFProxCardSessionClient setUserInfo:](v17, "setUserInfo:", v18);
      v27[0] = v11;
      v27[1] = 3221225472;
      v27[2] = __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke_2;
      v27[3] = &unk_1E482E2F8;
      v27[4] = v17;
      v27[5] = self;
      -[SFProxCardSessionClient setErrorHandler:](v17, "setErrorHandler:", v27);
      v26[0] = v11;
      v26[1] = 3221225472;
      v26[2] = __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke_3;
      v26[3] = &unk_1E482D3A0;
      v26[4] = v17;
      v26[5] = self;
      -[SFProxCardSessionClient setInvalidationHandler:](v17, "setInvalidationHandler:", v26);
      v25[0] = v11;
      v25[1] = 3221225472;
      v25[2] = __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke_4;
      v25[3] = &unk_1E482E2F8;
      v25[4] = v17;
      v25[5] = self;
      -[SFProxCardSessionClient activateWithCompletion:](v17, "activateWithCompletion:", v25);

    }
    else
    {
      NSErrorF();
      v24 = objc_claimAutoreleasedReturnValue();
      v17 = (SFProxCardSessionClient *)v33[5];
      v33[5] = v24;
    }

  }
  v13[2](v13);

  _Block_object_dispose(&v32, 8);
}

uint64_t __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_SFShareAudioService <= 90
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

void __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40))
  {
    v8 = v3;
    if (gLogCategory_SFShareAudioService <= 90)
    {
      if (gLogCategory_SFShareAudioService != -1 || (v5 = _LogCategory_Initialize(), v4 = v8, v5))
      {
        LogPrintF();
        v4 = v8;
      }
    }
    v6 = *(void **)(a1 + 40);
    if (v4)
    {
      objc_msgSend(v6, "_handleShareAudioResponse:error:", 0, v8);
    }
    else
    {
      SFErrorF();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_handleShareAudioResponse:error:", 0, v7);

    }
    v4 = v8;
  }

}

void __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40))
  {
    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = *(void **)(a1 + 40);
    SFErrorF();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_handleShareAudioResponse:error:", 0, v3);

  }
}

void __73__SFShareAudioService__handleShareAudioRequest2_contact_responseHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40))
  {
    v6 = v3;
    if (gLogCategory_SFShareAudioService <= 30)
    {
      if (gLogCategory_SFShareAudioService != -1 || (v5 = _LogCategory_Initialize(), v4 = v6, v5))
      {
        LogPrintF();
        v4 = v6;
      }
    }
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "_handleShareAudioResponse:error:", 0, v6);
      v4 = v6;
    }
  }

}

- (void)_handleShareAudioResponse:(int)a3 error:(id)a4
{
  id v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *searchTimer;
  uint64_t v9;
  NSObject *v10;
  CUBluetoothClient *v11;
  id responseHandler;
  void *v13;
  CUBluetoothClient *v14;
  CUBluetoothClient *searchBTClient;
  _QWORD v16[6];
  _QWORD handler[5];

  v6 = a4;
  if (gLogCategory_SFShareAudioService <= 30
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a3 == 2)
  {
    v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    searchTimer = self->_searchTimer;
    self->_searchTimer = v7;

    v9 = MEMORY[0x1E0C809B0];
    v10 = self->_searchTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __55__SFShareAudioService__handleShareAudioResponse_error___block_invoke;
    handler[3] = &unk_1E482DF78;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)self->_searchTimer);
    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v14 = (CUBluetoothClient *)objc_alloc_init(MEMORY[0x1E0D1B338]);
    searchBTClient = self->_searchBTClient;
    self->_searchBTClient = v14;
    v11 = v14;

    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __55__SFShareAudioService__handleShareAudioResponse_error___block_invoke_2;
    v16[3] = &unk_1E4834520;
    v16[4] = v11;
    v16[5] = self;
    -[CUBluetoothClient setDeviceConnectedHandler:](v11, "setDeviceConnectedHandler:", v16);
    -[CUBluetoothClient activate](v11, "activate");
  }
  else
  {
    v11 = (CUBluetoothClient *)_Block_copy(self->_responseHandler);
    if (v11)
    {
      responseHandler = self->_responseHandler;
      self->_responseHandler = 0;

      if (v6)
      {
        (*((void (**)(CUBluetoothClient *, id, _QWORD, _QWORD))v11 + 2))(v11, v6, 0, 0);
      }
      else
      {
        SFErrorF();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(CUBluetoothClient *, void *, _QWORD, _QWORD))v11 + 2))(v11, v13, 0, 0);

      }
    }
  }

}

uint64_t __55__SFShareAudioService__handleShareAudioResponse_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleShareAudioSearchTimeout");
}

void __55__SFShareAudioService__handleShareAudioResponse_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72))
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "deviceFlags");
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_handleShareAudioFoundDevice:", v6);
      v4 = v6;
    }
  }

}

- (void)_handleShareAudioFoundDevice:(id)a3
{
  id v4;
  OS_dispatch_source *searchTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  CUBluetoothClient *searchBTClient;
  void *v9;
  void *v10;
  SFBluetoothPairingSession *v11;
  SFBluetoothPairingSession *pairingSession;
  SFBluetoothPairingSession *v13;
  id v14;
  _QWORD v15[6];
  id v16;

  v4 = a3;
  searchTimer = self->_searchTimer;
  if (searchTimer)
  {
    v6 = searchTimer;
    dispatch_source_cancel(v6);
    v7 = self->_searchTimer;
    self->_searchTimer = 0;

  }
  -[CUBluetoothClient invalidate](self->_searchBTClient, "invalidate");
  searchBTClient = self->_searchBTClient;
  self->_searchBTClient = 0;

  objc_msgSend(v4, "addressString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_headphonesAddress, v9);
  -[SFSession pairingDeriveKeyForIdentifier:keyLength:](self->_sfSession, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("ShareAudio"), 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_SFShareAudioService <= 30
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v11 = objc_alloc_init(SFBluetoothPairingSession);
  pairingSession = self->_pairingSession;
  self->_pairingSession = v11;
  v13 = v11;

  -[SFBluetoothPairingSession setDeviceAddress:](v13, "setDeviceAddress:", v9);
  -[SFBluetoothPairingSession setGuestAddress:](v13, "setGuestAddress:", self->_guestDeviceAddress);
  -[SFBluetoothPairingSession setGuestKey:](v13, "setGuestKey:", v10);
  -[SFBluetoothPairingSession setGuestMode:](v13, "setGuestMode:", 1);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__SFShareAudioService__handleShareAudioFoundDevice___block_invoke;
  v15[3] = &unk_1E4834548;
  v15[4] = v13;
  v15[5] = self;
  v16 = v4;
  v14 = v4;
  -[SFBluetoothPairingSession setCompletionHandler:](v13, "setCompletionHandler:", v15);
  -[SFBluetoothPairingSession activate](v13, "activate");

}

uint64_t __52__SFShareAudioService__handleShareAudioFoundDevice___block_invoke(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 32))
    return objc_msgSend(*(id *)(result + 40), "_handleShareAudioPairingCompleted:error:", *(_QWORD *)(result + 48), a2);
  return result;
}

- (void)_handleShareAudioPairingCompleted:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  SFBluetoothPairingSession *pairingSession;
  void *v9;
  id responseHandler;
  SFSession *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  OS_dispatch_queue *dispatchQueue;
  void *v18;
  _QWORD v19[8];

  v6 = a3;
  v7 = a4;
  -[SFBluetoothPairingSession invalidate](self->_pairingSession, "invalidate");
  pairingSession = self->_pairingSession;
  self->_pairingSession = 0;

  v9 = _Block_copy(self->_responseHandler);
  if (v9)
  {
    responseHandler = self->_responseHandler;
    self->_responseHandler = 0;

    if (v7)
    {
      if (gLogCategory_SFShareAudioService <= 90
        && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(void *, id, _QWORD, _QWORD))v9 + 2))(v9, v7, 0, 0);
    }
    else
    {
      v11 = self->_sfSession;
      if (v11)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v13 = objc_msgSend(v6, "colorCode");
        if ((_DWORD)v13)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("colorCode"));

        }
        v15 = objc_msgSend(v6, "productIdentifier");
        if ((_DWORD)v15)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v16, CFSTR("productID"));

        }
        dispatchQueue = self->_dispatchQueue;
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __63__SFShareAudioService__handleShareAudioPairingCompleted_error___block_invoke;
        v19[3] = &unk_1E4834570;
        v19[4] = v11;
        v19[5] = self;
        v19[6] = v12;
        v19[7] = v9;
        -[SFSession appleIDAddProof:dispatchQueue:completion:](v11, "appleIDAddProof:dispatchQueue:completion:", v12, dispatchQueue, v19);

      }
      else
      {
        SFErrorF();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (gLogCategory_SFShareAudioService <= 90
          && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        (*((void (**)(void *, void *, _QWORD, _QWORD))v9 + 2))(v9, v18, 0, 0);

      }
    }
  }

}

void __63__SFShareAudioService__handleShareAudioPairingCompleted_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64))
  {
    v5 = v3;
    if (v3
      && gLogCategory_SFShareAudioService <= 90
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      v4 = v5;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("btAd"), v4);
    if (gLogCategory_SFShareAudioService <= 30
      && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
    v3 = v5;
  }

}

- (void)_handleShareAudioSearchTimeout
{
  OS_dispatch_source *searchTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  CUBluetoothClient *searchBTClient;
  void *v7;
  id responseHandler;
  void *v9;
  id v10;

  if (gLogCategory_SFShareAudioService <= 90
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  searchTimer = self->_searchTimer;
  if (searchTimer)
  {
    v4 = searchTimer;
    dispatch_source_cancel(v4);
    v5 = self->_searchTimer;
    self->_searchTimer = 0;

  }
  -[CUBluetoothClient invalidate](self->_searchBTClient, "invalidate");
  searchBTClient = self->_searchBTClient;
  self->_searchBTClient = 0;

  v7 = _Block_copy(self->_responseHandler);
  if (v7)
  {
    responseHandler = self->_responseHandler;
    self->_responseHandler = 0;
    v10 = v7;

    NSErrorF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD, _QWORD))v10 + 2))(v10, v9, 0, 0);

    v7 = v10;
  }

}

- (void)xpcPerformAction:(int)a3 completion:(id)a4
{
  uint64_t v4;
  NSObject *dispatchQueue;
  const char *v7;
  const char *v8;
  void (**v9)(id, _QWORD);

  v4 = *(_QWORD *)&a3;
  dispatchQueue = self->_dispatchQueue;
  v9 = (void (**)(id, _QWORD))a4;
  dispatch_assert_queue_V2(dispatchQueue);
  if (gLogCategory_SFShareAudioService <= 30
    && (gLogCategory_SFShareAudioService != -1 || _LogCategory_Initialize()))
  {
    if (v4 > 3)
      v7 = "?";
    else
      v7 = off_1E4834590[(int)v4];
    v8 = v7;
    LogPrintF();
  }
  -[SFShareAudioService _handleShareAudioResponse:error:](self, "_handleShareAudioResponse:error:", v4, 0, v8);
  v9[2](v9, 0);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (SDStatusMonitor)statusMonitor
{
  return self->_statusMonitor;
}

- (void)setStatusMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_statusMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_searchTimer, 0);
  objc_storeStrong((id *)&self->_searchBTClient, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_proxCardSessionClient, 0);
  objc_storeStrong((id *)&self->_pairingSession, 0);
  objc_storeStrong((id *)&self->_headphonesAddress, 0);
  objc_storeStrong((id *)&self->_guestDeviceAddress, 0);
}

@end
