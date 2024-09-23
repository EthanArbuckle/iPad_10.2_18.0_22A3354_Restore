@implementation SFNFCTagReaderUIController

- (SFNFCTagReaderUIController)init
{
  SFNFCTagReaderUIController *v2;
  SFNFCTagReaderUIController *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFNFCTagReaderUIController;
  v2 = -[SFNFCTagReaderUIController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    *(_OWORD *)&v3->_mode = xmmword_1A2AF8C10;
  }
  return v3;
}

- (void)setPurpose:(id)a3
{
  void *v4;
  SFNFCTagReaderUIController *v5;
  NSObject *dispatchQueue;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__SFNFCTagReaderUIController_setPurpose___block_invoke;
    v7[3] = &unk_1E482D3A0;
    v7[4] = v5;
    v8 = v4;
    dispatch_async(dispatchQueue, v7);

  }
  else
  {
    objc_storeStrong((id *)&v5->_purpose, v4);
  }
  objc_sync_exit(v5);

}

void __41__SFNFCTagReaderUIController_setPurpose___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_59);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v5 = v2;
    objc_msgSend(v2, "setPurpose:", *(_QWORD *)(a1 + 40));
LABEL_3:
    v3 = v5;
    goto LABEL_8;
  }
  if (gLogCategory_SFNFCTagReaderUIController <= 60)
  {
    v5 = 0;
    if (gLogCategory_SFNFCTagReaderUIController != -1 || (v4 = _LogCategory_Initialize(), v3 = 0, v4))
    {
      LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_8:

}

void __41__SFNFCTagReaderUIController_setPurpose___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_SFNFCTagReaderUIController <= 60
    && ((v5 = v2, gLogCategory_SFNFCTagReaderUIController != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  SFNFCTagReaderUIController *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__SFNFCTagReaderUIController_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __53__SFNFCTagReaderUIController_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSXPCConnection *xpcCnx;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *purpose;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  os_activity_scope_state_s state;
  _QWORD v22[3];
  _QWORD v23[5];

  v23[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFNFCTagReaderUIController _ensureXPCStarted](self, "_ensureXPCStarted");
  -[CUXPCAgent listenerEndpoint](self->_xpcAgent, "listenerEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = _os_activity_create(&dword_1A2830000, "Sharing/SFNFCTagReaderUIController/nfcTagReaderUIActivateWithEndpoint", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v6, &state);
    xpcCnx = self->_xpcCnx;
    v8 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __54__SFNFCTagReaderUIController__activateWithCompletion___block_invoke;
    v19[3] = &unk_1E482E490;
    v9 = v4;
    v20 = v9;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = CFSTR("mode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_mode);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v11;
    v22[1] = CFSTR("operationMode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_operationMode);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v22[2] = CFSTR("purpose");
    purpose = (const __CFString *)self->_purpose;
    if (!purpose)
      purpose = &stru_1E483B8E8;
    v23[1] = v12;
    v23[2] = purpose;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __54__SFNFCTagReaderUIController__activateWithCompletion___block_invoke_2;
    v17[3] = &unk_1E482E490;
    v18 = v9;
    objc_msgSend(v10, "nfcTagReaderUIActivateWithEndpoint:params:completion:", v5, v15, v17);

    os_activity_scope_leave(&state);
  }
  else if (v4)
  {
    NSErrorWithOSStatusF();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v16);

  }
}

void __54__SFNFCTagReaderUIController__activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_SFNFCTagReaderUIController <= 60)
    {
      if (gLogCategory_SFNFCTagReaderUIController != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

void __54__SFNFCTagReaderUIController__activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    if (gLogCategory_SFNFCTagReaderUIController <= 60)
    {
      if (gLogCategory_SFNFCTagReaderUIController != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        v3 = v7;
      }
    }
  }
  else if (gLogCategory_SFNFCTagReaderUIController <= 30)
  {
    if (gLogCategory_SFNFCTagReaderUIController != -1)
      goto LABEL_7;
    v5 = _LogCategory_Initialize();
    v3 = 0;
    if (v5)
      goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    v3 = v7;
  }

}

- (void)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  uint64_t v5;
  void *v6;
  CUXPCAgent *v7;
  CUXPCAgent *xpcAgent;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CUXPCAgent *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.SharingServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    v5 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke;
    v20[3] = &unk_1E482DF78;
    v20[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v20);
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_2;
    v19[3] = &unk_1E482DF78;
    v19[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v19);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBF88);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
  }
  if (!self->_xpcAgent)
  {
    v7 = (CUXPCAgent *)objc_alloc_init(MEMORY[0x1E0D1B498]);
    xpcAgent = self->_xpcAgent;
    self->_xpcAgent = v7;

    -[CUXPCAgent setDispatchQueue:](self->_xpcAgent, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", off_1EE679FB8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUXPCAgent setLabel:](self->_xpcAgent, "setLabel:", v9);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBFE8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUXPCAgent setExportedInterface:](self->_xpcAgent, "setExportedInterface:", v10);

    -[CUXPCAgent setExportedObject:](self->_xpcAgent, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DC048);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUXPCAgent setRemoteObjectInterface:](self->_xpcAgent, "setRemoteObjectInterface:", v11);

    v12 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_3;
    v18[3] = &unk_1E4833928;
    v18[4] = self;
    -[CUXPCAgent setConnectionStartedHandler:](self->_xpcAgent, "setConnectionStartedHandler:", v18);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_4;
    v17[3] = &unk_1E4833928;
    v17[4] = self;
    -[CUXPCAgent setConnectionEndedHandler:](self->_xpcAgent, "setConnectionEndedHandler:", v17);
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_5;
    v16[3] = &unk_1E482DF78;
    v16[4] = self;
    -[CUXPCAgent setInvalidationHandler:](self->_xpcAgent, "setInvalidationHandler:", v16);
    v13 = self->_xpcAgent;
    v15 = 0;
    LODWORD(v12) = -[CUXPCAgent activateDirectAndReturnError:](v13, "activateDirectAndReturnError:", &v15);
    v14 = v15;
    if ((_DWORD)v12)
    {
      if (gLogCategory_SFNFCTagReaderUIController > 30
        || gLogCategory_SFNFCTagReaderUIController == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_14;
      }
    }
    else if (gLogCategory_SFNFCTagReaderUIController > 60
           || gLogCategory_SFNFCTagReaderUIController == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
    LogPrintF();
LABEL_14:

  }
}

uint64_t __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  id v6;

  v6 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    v5 = v6;
    LogPrintF();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), a2);
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 40))
  {
    *(_BYTE *)(v4 + 40) = 0;
    if (gLogCategory_SFNFCTagReaderUIController <= 30
      && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_nfcTagScannedCount", v5);
  }

}

void __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(id *)(v3 + 64) == v8)
  {
    *(_QWORD *)(v3 + 64) = 0;

    v3 = *(_QWORD *)(a1 + 32);
  }
  v4 = *(_QWORD *)(v3 + 72);
  if (v4)
  {
    NSErrorWithOSStatusF();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = 0;

  }
}

uint64_t __47__SFNFCTagReaderUIController__ensureXPCStarted__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFNFCTagReaderUIController <= 50
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SFNFCTagReaderUIController_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__SFNFCTagReaderUIController_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (gLogCategory_SFNFCTagReaderUIController <= 30
      && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 48), "invalidate");
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 56), "invalidate");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, _QWORD);
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFNFCTagReaderUIController <= 50
      && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcAgent && !self->_xpcCnx && !self->_xpcUICnx)
    {
      invalidationHandler = (void (**)(id, _QWORD))self->_invalidationHandler;
      if (invalidationHandler)
      {
        invalidationHandler[2](invalidationHandler, 0);
        v4 = self->_invalidationHandler;
      }
      else
      {
        v4 = 0;
      }
      self->_invalidationHandler = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_SFNFCTagReaderUIController <= 30
        && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)nfcTagScanned
{
  -[SFNFCTagReaderUIController nfcTagScannedCount:](self, "nfcTagScannedCount:", 1);
}

- (void)nfcTagScannedCount:(int64_t)a3
{
  self->_nfcTagScanCount += a3;
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFNFCTagReaderUIController _nfcTagScannedCount](self, "_nfcTagScannedCount");
}

- (void)_nfcTagScannedCount
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[CUXPCAgentConnection remoteObjectProxyWithErrorHandler:](self->_xpcUICnx, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_130);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "nfcTagScannedCount:", self->_nfcTagScanCount);
LABEL_3:
    v4 = v6;
    goto LABEL_8;
  }
  self->_nfcTagScanPending = 1;
  if (gLogCategory_SFNFCTagReaderUIController <= 30)
  {
    v6 = 0;
    if (gLogCategory_SFNFCTagReaderUIController != -1 || (v5 = _LogCategory_Initialize(), v4 = 0, v5))
    {
      LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_8:

}

void __49__SFNFCTagReaderUIController__nfcTagScannedCount__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_SFNFCTagReaderUIController <= 60
    && ((v5 = v2, gLogCategory_SFNFCTagReaderUIController != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)uiActivatedWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_nfcTagScanCount >= 1)
    -[SFNFCTagReaderUIController _nfcTagScannedCount](self, "_nfcTagScannedCount");
  v4[2](v4, 0);

}

- (void)uiInvalidatedWithCompletion:(id)a3
{
  void (**invalidationHandler)(id, void *);
  void *v5;
  id v6;
  void (**v7)(id, _QWORD);

  v7 = (void (**)(id, _QWORD))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFNFCTagReaderUIController <= 30
    && (gLogCategory_SFNFCTagReaderUIController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  invalidationHandler = (void (**)(id, void *))self->_invalidationHandler;
  if (invalidationHandler)
  {
    NSErrorWithOSStatusF();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    invalidationHandler[2](invalidationHandler, v5);

    v6 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

  }
  v7[2](v7, 0);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (int64_t)operationMode
{
  return self->_operationMode;
}

- (void)setOperationMode:(int64_t)a3
{
  self->_operationMode = a3;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_xpcUICnx, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_xpcAgent, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
