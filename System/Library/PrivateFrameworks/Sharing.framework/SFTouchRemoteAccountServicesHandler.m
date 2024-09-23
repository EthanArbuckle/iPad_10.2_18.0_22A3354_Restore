@implementation SFTouchRemoteAccountServicesHandler

- (SFTouchRemoteAccountServicesHandler)initWithConfiguration:(id)a3
{
  id v4;
  SFTouchRemoteAccountServicesHandler *v5;
  uint64_t v6;
  SFTouchRemoteAccountServicesHandlerConfiguration *configuration;
  uint64_t v8;
  ACAccountStore *accountStore;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFTouchRemoteAccountServicesHandler;
  v5 = -[SFTouchRemoteAccountServicesHandler init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (SFTouchRemoteAccountServicesHandlerConfiguration *)v6;

    objc_msgSend((Class)getACAccountStoreClass_1[0](), "defaultStore");
    v8 = objc_claimAutoreleasedReturnValue();
    accountStore = v5->_accountStore;
    v5->_accountStore = (ACAccountStore *)v8;

    v5->_appleAccountSignInState = 0;
  }

  return v5;
}

- (BOOL)activateWithSession:(id)a3 error:(id *)a4
{
  id v7;
  TRSession **p_trSession;
  TRSession *trSession;
  uint64_t v10;
  TRSession *v11;
  TRSession *v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v7 = a3;
  if (!-[BSAtomicSignal hasBeenSignalled](self->_activated, "hasBeenSignalled"))
  {
    if (-[BSAtomicSignal hasBeenSignalled](self->_invalidated, "hasBeenSignalled"))
    {
      if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
        && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (a4)
        goto LABEL_26;
    }
    else
    {
      if (v7)
      {
        if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
          && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        -[BSAtomicSignal signal](self->_activated, "signal");
        p_trSession = &self->_trSession;
        objc_storeStrong((id *)&self->_trSession, a3);
        location = 0;
        objc_initWeak(&location, self);
        trSession = self->_trSession;
        v10 = MEMORY[0x1E0C809B0];
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __65__SFTouchRemoteAccountServicesHandler_activateWithSession_error___block_invoke;
        v19[3] = &unk_1E48321E0;
        objc_copyWeak(&v20, &location);
        -[TRSession setRequestHandler:forRequestClass:](trSession, "setRequestHandler:forRequestClass:", v19, getTRSetupCompanionAuthenticationRequestClass_0[0]());
        v11 = *p_trSession;
        v17[0] = v10;
        v17[1] = 3221225472;
        v17[2] = __65__SFTouchRemoteAccountServicesHandler_activateWithSession_error___block_invoke_2;
        v17[3] = &unk_1E48321E0;
        objc_copyWeak(&v18, &location);
        -[TRSession setRequestHandler:forRequestClass:](v11, "setRequestHandler:forRequestClass:", v17, getTRSetupProxyDeviceRequestClass_0[0]());
        v12 = *p_trSession;
        v15[0] = v10;
        v15[1] = 3221225472;
        v15[2] = __65__SFTouchRemoteAccountServicesHandler_activateWithSession_error___block_invoke_3;
        v15[3] = &unk_1E48321E0;
        objc_copyWeak(&v16, &location);
        -[TRSession setRequestHandler:forRequestClass:](v12, "setRequestHandler:forRequestClass:", v15, getTRSetupProxyAuthenticationRequestClass_0[0]());
        objc_destroyWeak(&v16);
        objc_destroyWeak(&v18);
        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);
        goto LABEL_23;
      }
      if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
        && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      if (a4)
      {
LABEL_26:
        NSErrorWithOSStatusF();
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
    }
    v13 = 0;
    goto LABEL_28;
  }
  if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
    && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_23:
  v13 = 1;
LABEL_28:

  return v13;
}

void __65__SFTouchRemoteAccountServicesHandler_activateWithSession_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTRCompanionAuthenticationRequest:responseHandler:", v7, v5);

}

void __65__SFTouchRemoteAccountServicesHandler_activateWithSession_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTRProxyDeviceRequest:responseHandler:", v7, v5);

}

void __65__SFTouchRemoteAccountServicesHandler_activateWithSession_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleTRProxyAuthenticationRequest:responseHandler:", v7, v5);

}

- (void)invalidate
{
  if ((-[BSAtomicSignal hasBeenSignalled](self->_invalidated, "hasBeenSignalled") & 1) == 0)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 50
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[BSAtomicSignal signal](self->_invalidated, "signal");
  }
}

- (void)_handleTRCompanionAuthenticationRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  void (**v17)(id, void *, _QWORD);
  id v18;
  id location;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if (-[BSAtomicSignal hasBeenSignalled](self->_invalidated, "hasBeenSignalled"))
  {
    NSErrorWithOSStatusF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, 0);
  }
  else
  {
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
          if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
            && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
          {
            objc_msgSend(v8, "username");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF();

          }
          location = 0;
          objc_initWeak(&location, self);
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __95__SFTouchRemoteAccountServicesHandler__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke;
          v13[3] = &unk_1E4832230;
          objc_copyWeak(&v18, &location);
          v17 = v7;
          v14 = v9;
          v15 = v8;
          v16 = v10;
          -[SFTouchRemoteAccountServicesHandler _saveRemoteVerifiedAccount:completion:](self, "_saveRemoteVerifiedAccount:completion:", v15, v13);

          objc_destroyWeak(&v18);
          objc_destroyWeak(&location);
        }
        else
        {
          NSErrorWithOSStatusF();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
            && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v7[2](v7, v11, 0);

        }
      }
      else
      {
        NSErrorWithOSStatusF();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
          && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v7[2](v7, v10, 0);
      }

    }
    else
    {
      NSErrorWithOSStatusF();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
        && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v7[2](v7, v9, 0);
    }

  }
}

void __95__SFTouchRemoteAccountServicesHandler__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15[2];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v3)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      v11 = v3;
      LogPrintF();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56));
  }
  v5 = (void *)objc_msgSend(WeakRetained, "_nextServiceTypeForTRAccountServices:", *(_QWORD *)(a1 + 32), v11);
  if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
    && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = objc_alloc((Class)getTRAnisetteDataProviderClass_0[0]());
  objc_msgSend(WeakRetained, "trSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithSession:", v7);

  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__SFTouchRemoteAccountServicesHandler__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_2;
  v12[3] = &unk_1E4832208;
  objc_copyWeak(v15, (id *)(a1 + 64));
  v15[1] = v5;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 56);
  objc_msgSend(WeakRetained, "_authenticateAccount:serviceType:companionDevice:anisetteDataProvider:completion:", v9, v5, v10, v8, v12);

  objc_destroyWeak(v15);
}

void __95__SFTouchRemoteAccountServicesHandler__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v5 || v6)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 60
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = objc_alloc_init((Class)getTRSetupAuthenticationResponseClass_0[0]());
    objc_msgSend(v9, "setUnauthenticatedAccountServices:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v9, "setError:", v6);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);

  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __95__SFTouchRemoteAccountServicesHandler__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_3;
    v10[3] = &unk_1E482E490;
    v8 = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "_authenticateWithServiceTypes:authResults:completion:", v8, v5, v10);

  }
}

void __95__SFTouchRemoteAccountServicesHandler__handleTRCompanionAuthenticationRequest_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  }
  else
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = objc_alloc_init((Class)getTRSetupAuthenticationResponseClass_0[0]());
    v4 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    objc_msgSend(v3, "setUnauthenticatedAccountServices:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_handleTRProxyDeviceRequest:(id)a3 responseHandler:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
    && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (-[BSAtomicSignal hasBeenSignalled](self->_invalidated, "hasBeenSignalled"))
  {
    NSErrorWithOSStatusF();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7, 0);
  }
  else
  {
    objc_msgSend((Class)getAKDeviceClass_0[0](), "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLinkType:", 3);
    v8 = objc_alloc_init((Class)getTRSetupProxyDeviceResponseClass_0[0]());
    objc_msgSend(v8, "setProxyDevice:", v7);
    ((void (**)(id, void *, id))v6)[2](v6, 0, v8);

  }
}

- (void)_handleTRProxyAuthenticationRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
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
  void (**v18)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if (-[BSAtomicSignal hasBeenSignalled](self->_invalidated, "hasBeenSignalled"))
  {
    NSErrorWithOSStatusF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v8, 0);
  }
  else
  {
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
          if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
            && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
          {
            objc_msgSend(v8, "username");
            v12 = v10;
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF();

          }
          objc_msgSend(v8, "_aa_setRawPassword:", v9, v12, v13);
          v14[0] = MEMORY[0x1E0C809B0];
          v14[1] = 3221225472;
          v14[2] = __91__SFTouchRemoteAccountServicesHandler__handleTRProxyAuthenticationRequest_responseHandler___block_invoke;
          v14[3] = &unk_1E482F690;
          v18 = v7;
          v14[4] = self;
          v15 = v10;
          v16 = v8;
          v17 = v9;
          -[SFTouchRemoteAccountServicesHandler _saveRemoteVerifiedAccount:completion:](self, "_saveRemoteVerifiedAccount:completion:", v16, v14);

        }
        else
        {
          NSErrorWithOSStatusF();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
            && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v7[2](v7, v11, 0);

        }
      }
      else
      {
        NSErrorWithOSStatusF();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
          && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v7[2](v7, v10, 0);
      }

    }
    else
    {
      NSErrorWithOSStatusF();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
        && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v7[2](v7, v9, 0);
    }

  }
}

void __91__SFTouchRemoteAccountServicesHandler__handleTRProxyAuthenticationRequest_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12[2];
  id location;

  v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      v8 = v3;
      LogPrintF();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64));
  }
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "_nextServiceTypeForTRAccountServices:", *(_QWORD *)(a1 + 40), v8);
  if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
    && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__SFTouchRemoteAccountServicesHandler__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_2;
  v9[3] = &unk_1E4832258;
  objc_copyWeak(v12, &location);
  v12[1] = v4;
  v11 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v5, "_authenticateAccount:serviceType:rawPassword:completion:", v6, v4, v7, v9);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);

}

void __91__SFTouchRemoteAccountServicesHandler__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!v5 || v6)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v9 + 16))(v9, v6, 0);
    }
    else
    {
      NSErrorWithOSStatusF();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

    }
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__SFTouchRemoteAccountServicesHandler__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_3;
    v11[3] = &unk_1E482E490;
    v8 = *(_QWORD *)(a1 + 32);
    v12 = *(id *)(a1 + 40);
    objc_msgSend(WeakRetained, "_authenticateWithServiceTypes:authResults:completion:", v8, v5, v11);

  }
}

void __91__SFTouchRemoteAccountServicesHandler__handleTRProxyAuthenticationRequest_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  }
  else
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = objc_alloc_init((Class)getTRSetupAuthenticationResponseClass_0[0]());
    v4 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    objc_msgSend(v3, "setUnauthenticatedAccountServices:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)_saveRemoteVerifiedAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  ACAccountStore *accountStore;
  void *v9;
  void *v10;
  void *v11;
  ACAccountStore *v12;
  void *v13;
  id v14;
  ACAccountStore *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  accountStore = self->_accountStore;
  objc_msgSend(v6, "accountType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACAccountStore accountTypeWithAccountTypeIdentifier:](accountStore, "accountTypeWithAccountTypeIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAccountType:", v11);
  objc_msgSend(v6, "_setObjectID:", 0);
  objc_msgSend(v6, "markAllPropertiesDirty");
  v12 = self->_accountStore;
  objc_msgSend(v6, "credential");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  -[ACAccountStore setCredential:forAccount:serviceID:error:](v12, "setCredential:forAccount:serviceID:error:", v13, v6, 0, &v19);
  v14 = v19;

  if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
    && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v15 = self->_accountStore;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __77__SFTouchRemoteAccountServicesHandler__saveRemoteVerifiedAccount_completion___block_invoke;
  v17[3] = &unk_1E482F780;
  v18 = v7;
  v16 = v7;
  -[ACAccountStore saveVerifiedAccount:withCompletionHandler:](v15, "saveVerifiedAccount:withCompletionHandler:", v6, v17);

}

void __77__SFTouchRemoteAccountServicesHandler__saveRemoteVerifiedAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = a3;
  if ((a2 & 1) != 0)
  {
    if (v5)

    goto LABEL_7;
  }
  v9 = v5;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", *MEMORY[0x1E0C8F1D0]) & 1) != 0)
  {
    v7 = objc_msgSend(v9, "code");

    v8 = (uint64_t)v9;
    if (v7 == 5)
    {

LABEL_7:
      v8 = 0;
      goto LABEL_11;
    }
  }
  else
  {

    v8 = (uint64_t)v9;
  }
  if (!v8)
  {
    NSErrorWithOSStatusF();
    v8 = objc_claimAutoreleasedReturnValue();
  }
LABEL_11:
  v10 = (id)v8;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

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

  v11 = (Class (__cdecl *)())getAKAppleIDAuthenticationContextClass_0[0];
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
  v17 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass_0[0]());
  objc_msgSend(v17, "authenticateWithContext:completion:", v18, v12);

}

- (void)_authenticateAccount:(id)a3 serviceType:(int64_t)a4 rawPassword:(id)a5 completion:(id)a6
{
  Class (__cdecl *v9)();
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v9 = (Class (__cdecl *)())getAKAppleIDAuthenticationContextClass_0[0];
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
  v14 = objc_alloc_init((Class)getAKAppleIDAuthenticationControllerClass_0[0]());
  objc_msgSend(v14, "authenticateWithContext:completion:", v15, v10);

}

- (void)_authenticateWithServiceTypes:(id)a3 authResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = -[SFTouchRemoteAccountServicesHandler _nextTRServiceTypeForTRAccountServices:](self, "_nextTRServiceTypeForTRAccountServices:", v8);
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    location = 0;
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __92__SFTouchRemoteAccountServicesHandler__authenticateWithServiceTypes_authResults_completion___block_invoke;
    v12[3] = &unk_1E4832280;
    objc_copyWeak(v16, &location);
    v16[1] = v11;
    v15 = v10;
    v13 = v8;
    v14 = v9;
    -[SFTouchRemoteAccountServicesHandler _authenticateWithServiceType:authResults:completion:](self, "_authenticateWithServiceType:authResults:completion:", v11, v14, v12);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __92__SFTouchRemoteAccountServicesHandler__authenticateWithServiceTypes_authResults_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = v9;
  v5 = WeakRetained;
  if (v9)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90)
    {
      if (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || (v8 = _LogCategory_Initialize(), v4 = v9, v8))
      {
        LogPrintF();
        v4 = v9;
      }
    }
    (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v4);
  }
  else
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 64));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v7);

    objc_msgSend(v5, "_authenticateWithServiceTypes:authResults:completion:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)_authenticateWithServiceType:(unint64_t)a3 authResults:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = (void (**)(id, void *))a5;
  -[SFTouchRemoteAccountServicesHandlerConfiguration supportedTRAccountServices](self->_configuration, "supportedTRAccountServices");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "containsObject:", v10);

  if (!v11)
    goto LABEL_6;
  switch(a3)
  {
    case 3uLL:
      -[SFTouchRemoteAccountServicesHandler _authenticateGameCenterWithAuthResults:completion:](self, "_authenticateGameCenterWithAuthResults:completion:", v13, v8);
      break;
    case 2uLL:
      -[SFTouchRemoteAccountServicesHandler _authenticateiTunesWithAuthResults:completion:](self, "_authenticateiTunesWithAuthResults:completion:", v13, v8);
      break;
    case 1uLL:
      -[SFTouchRemoteAccountServicesHandler _authenticateiCloudWithAuthResults:completion:](self, "_authenticateiCloudWithAuthResults:completion:", v13, v8);
      break;
    default:
LABEL_6:
      NSErrorWithOSStatusF();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v12);

      break;
  }

}

- (void)_authenticateiCloudWithAuthResults:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  ACAccountStore *accountStore;
  uint64_t v13;
  void *v14;
  int64_t v15;
  ACAccountStore *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  uint64_t *v23;
  void *v24;
  ACAccountStore *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id location;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;

  v6 = a3;
  v7 = a4;
  getAKAuthenticationAlternateDSIDKey_0[0]();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  getAKAuthenticationUsernameKey_0[0]();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  getAKAuthenticationPasswordKey_0[0]();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SFTouchRemoteAccountServicesHandlerConfiguration isPrimaryAppleAccount](self->_configuration, "isPrimaryAppleAccount");
  accountStore = self->_accountStore;
  if (v11)
    -[ACAccountStore aa_primaryAppleAccount](accountStore, "aa_primaryAppleAccount");
  else
    -[ACAccountStore aa_appleAccountWithAltDSID:](accountStore, "aa_appleAccountWithAltDSID:", v8);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = 1;
  if (v13)
    v15 = 2;
  self->_appleAccountSignInState = v15;
  if (v13)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v14, "username");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v9;
      LogPrintF();

    }
    objc_msgSend(v14, "setAuthenticated:", 0, v26, v27);
    objc_msgSend(v14, "aa_setPassword:", v10);
    v16 = self->_accountStore;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __85__SFTouchRemoteAccountServicesHandler__authenticateiCloudWithAuthResults_completion___block_invoke;
    v34[3] = &unk_1E482F640;
    v35 = v14;
    v36 = v9;
    v37 = v7;
    -[ACAccountStore verifyCredentialsForAccount:saveWhenAuthorized:withHandler:](v16, "verifyCredentialsForAccount:saveWhenAuthorized:withHandler:", v35, 1, v34);

    v17 = v35;
  }
  else
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v18 = objc_alloc(MEMORY[0x1E0C8F298]);
    -[ACAccountStore aa_appleAccountType](self->_accountStore, "aa_appleAccountType");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithAccountType:", v19);

    objc_msgSend(v20, "setUsername:", v9);
    objc_msgSend(MEMORY[0x1E0C8F2B0], "credentialWithPassword:", v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCredential:", v21);

    v22 = -[SFTouchRemoteAccountServicesHandlerConfiguration isPrimaryAppleAccount](self->_configuration, "isPrimaryAppleAccount");
    v23 = &getAAAccountClassPrimary;
    if (!v22)
      v23 = &getAAAccountClassFull;
    ((void (*)(_BOOL8))*v23)(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "aa_setAccountClass:", v24);

    location = 0;
    objc_initWeak(&location, self);
    v25 = self->_accountStore;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __85__SFTouchRemoteAccountServicesHandler__authenticateiCloudWithAuthResults_completion___block_invoke_2;
    v28[3] = &unk_1E48322A8;
    objc_copyWeak(&v32, &location);
    v29 = v9;
    v31 = v7;
    v17 = v20;
    v30 = v17;
    -[ACAccountStore aa_registerAppleAccount:withCompletion:](v25, "aa_registerAppleAccount:withCompletion:", v17, v28);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

}

void __85__SFTouchRemoteAccountServicesHandler__authenticateiCloudWithAuthResults_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (!v10 || v5)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 32), "username");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v7 = *(_QWORD *)(a1 + 48);
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
    }
    else
    {
      NSErrorWithOSStatusF();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

    }
  }
  else
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v10, "username");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }

}

void __85__SFTouchRemoteAccountServicesHandler__authenticateiCloudWithAuthResults_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id WeakRetained;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6 = v12;
  v7 = WeakRetained;
  if (v12 || (a2 & 1) == 0)
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 90)
    {
      if (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || (v8 = _LogCategory_Initialize(), v6 = v12, v8))
      {
        LogPrintF();
        v6 = v12;
      }
    }
    v9 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
    }
    else
    {
      NSErrorWithOSStatusF();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    }
  }
  else
  {
    if (gLogCategory_SFTouchRemoteAccountServicesHandler <= 30
      && (gLogCategory_SFTouchRemoteAccountServicesHandler != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 40), "username");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_msgSend(v7, "_saveNewAccount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v11);
  }

}

- (void)_saveNewAccount:(id)a3 completion:(id)a4
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
  SFTouchRemoteAccountServicesHandler *v23;
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
  v26[2] = __66__SFTouchRemoteAccountServicesHandler__saveNewAccount_completion___block_invoke;
  v26[3] = &unk_1E482F780;
  v27 = v7;
  v21 = v7;
  -[ACAccountStore saveAccount:withDataclassActions:completion:](accountStore, "saveAccount:withDataclassActions:completion:", v6, v8, v26);

}

void __66__SFTouchRemoteAccountServicesHandler__saveNewAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
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

- (void)_authenticateiTunesWithAuthResults:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a4;
  v7 = a3;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((Class)getSSMutableAuthenticationContextClass_0[0](), "contextForSignIn");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccountName:", v9);
  objc_msgSend(v11, "setAllowsRetry:", 0);
  objc_msgSend(v11, "setAltDSID:", v8);
  objc_msgSend(v11, "setCanSetActiveAccount:", 0);
  objc_msgSend(v11, "setPasswordEquivalentToken:", v10);
  objc_msgSend(v11, "setPromptStyle:", 1);
  objc_msgSend(v11, "setShouldSuppressDialogs:", -[SFTouchRemoteAccountServicesHandlerConfiguration shouldSuppressStoreSignInDialogs](self->_configuration, "shouldSuppressStoreSignInDialogs"));
  objc_msgSend(v11, "setShouldIgnoreAccountConversion:", -[SFTouchRemoteAccountServicesHandlerConfiguration shouldIgnoreStoreAccountConversion](self->_configuration, "shouldIgnoreStoreAccountConversion"));
  objc_msgSend((Class)getSSAccountStoreClass_0[0](), "defaultStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc((Class)getSSAuthenticateRequestClass_0[0]()), "initWithAuthenticationContext:", v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __85__SFTouchRemoteAccountServicesHandler__authenticateiTunesWithAuthResults_completion___block_invoke;
  v16[3] = &unk_1E48322D0;
  v17 = v12;
  v18 = v6;
  v16[4] = self;
  v14 = v12;
  v15 = v6;
  objc_msgSend(v13, "startWithAuthenticateResponseBlock:", v16);

}

void __85__SFTouchRemoteAccountServicesHandler__authenticateiTunesWithAuthResults_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "authenticatedAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "shouldActivateStoreAccount"))
      objc_msgSend(v5, "setActive:", 1);
    objc_msgSend(*(id *)(a1 + 40), "saveAccount:error:", v5, 0);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v8)
    {
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
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
  if ((objc_msgSend(v3, "containsObject:", &unk_1E48908C8) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsObject:", &unk_1E48908E0) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "containsObject:", &unk_1E48908F8))
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
  if ((objc_msgSend(v3, "containsObject:", &unk_1E48908C8) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsObject:", &unk_1E48908E0) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "containsObject:", &unk_1E48908F8))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)appleAccountSignInState
{
  return self->_appleAccountSignInState;
}

- (BSAtomicSignal)activated
{
  return self->_activated;
}

- (void)setActivated:(id)a3
{
  objc_storeStrong((id *)&self->_activated, a3);
}

- (BSAtomicSignal)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(id)a3
{
  objc_storeStrong((id *)&self->_invalidated, a3);
}

- (TRSession)trSession
{
  return self->_trSession;
}

- (void)setTrSession:(id)a3
{
  objc_storeStrong((id *)&self->_trSession, a3);
}

- (SFTouchRemoteAccountServicesHandlerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_invalidated, 0);
  objc_storeStrong((id *)&self->_activated, 0);
}

@end
