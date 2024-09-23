@implementation SFRemoteAutoFillSessionHelper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRemoteAutoFillSessionHelper)init
{
  SFRemoteAutoFillSessionHelper *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFRemoteAutoFillSessionHelper;
  v2 = -[SFRemoteAutoFillSessionHelper init](&v6, sel_init);
  if (v2)
  {
    SFMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (SFRemoteAutoFillSessionHelper)initWithCoder:(id)a3
{
  SFRemoteAutoFillSessionHelper *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFRemoteAutoFillSessionHelper;
  v3 = -[SFRemoteAutoFillSessionHelper init](&v7, sel_init, a3);
  if (v3)
  {
    SFMainQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  SFRemoteAutoFillSessionHelper *v5;
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
  v8[2] = __56__SFRemoteAutoFillSessionHelper_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __56__SFRemoteAutoFillSessionHelper_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  NSXPCConnection *xpcCnx;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  void (**v16)(id, void *);
  os_activity_scope_state_s state;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteAutoFillSessionHelper <= 30
    && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_invalidateCalled)
  {
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      v14 = 4294960572;
      LogPrintF();
    }
    if (v4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v10 = objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v11 = CFSTR("?");
      if (v10)
        v11 = (const __CFString *)v10;
      v19[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1, v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -6724, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v13);

      goto LABEL_8;
    }
  }
  else if (!self->_agent)
  {
    v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteAutoFillSessionHelper/autoFillHelperActivate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    -[SFRemoteAutoFillSessionHelper _ensureXPCStarted](self, "_ensureXPCStarted");
    xpcCnx = self->_xpcCnx;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__SFRemoteAutoFillSessionHelper__activateWithCompletion___block_invoke;
    v15[3] = &unk_1E482E490;
    v7 = v4;
    v16 = v7;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "autoFillHelperActivate:completion:", self, v7);

    os_activity_scope_leave(&state);
LABEL_8:

  }
}

uint64_t __57__SFRemoteAutoFillSessionHelper__activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SFRemoteAutoFillSessionHelper_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__SFRemoteAutoFillSessionHelper_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSXPCConnection *xpcCnx;
  NSXPCConnection *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_SFRemoteAutoFillSessionHelper <= 30
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      -[NSXPCConnection invalidate](xpcCnx, "invalidate");
      v4 = self->_xpcCnx;
      self->_xpcCnx = 0;

    }
    else
    {
      -[SFRemoteAutoFillSessionHelper _invalidated](self, "_invalidated");
    }
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  id interruptionHandler;
  id v5;
  id pairingResponseHandler;
  id promptForPINHandler;
  NSXPCConnection *xpcCnx;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFRemoteAutoFillSessionHelper <= 50
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    self->_invalidateDone = 1;
    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    pairingResponseHandler = self->_pairingResponseHandler;
    self->_pairingResponseHandler = 0;

    promptForPINHandler = self->_promptForPINHandler;
    self->_promptForPINHandler = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 10
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)serverDidPickUsername:(id)a3 password:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__SFRemoteAutoFillSessionHelper_serverDidPickUsername_password_error___block_invoke;
  v15[3] = &unk_1E482E7D8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __70__SFRemoteAutoFillSessionHelper_serverDidPickUsername_password_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  os_activity_scope_state_s v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v2 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteAutoFillSessionHelper/serverDidPickUsername", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v4.opaque[0] = 0;
    v4.opaque[1] = 0;
    os_activity_scope_enter(v2, &v4);
    objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "autoFillHelperDidPickUsername:password:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

    os_activity_scope_leave(&v4);
  }
}

- (void)serverTryPIN:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__SFRemoteAutoFillSessionHelper_serverTryPIN___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __46__SFRemoteAutoFillSessionHelper_serverTryPIN___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  os_activity_scope_state_s v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v2 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteAutoFillSessionHelper/autoFillHelperTryPin", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v4.opaque[0] = 0;
    v4.opaque[1] = 0;
    os_activity_scope_enter(v2, &v4);
    objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "autoFillHelperTryPIN:", *(_QWORD *)(a1 + 40));

    os_activity_scope_leave(&v4);
  }
}

- (void)serverUserNotificationDidActivate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__SFRemoteAutoFillSessionHelper_serverUserNotificationDidActivate___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __67__SFRemoteAutoFillSessionHelper_serverUserNotificationDidActivate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  os_activity_scope_state_s v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v2 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteAutoFillSessionHelper/autoFillHelperUserNotificationDidActivate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v4.opaque[0] = 0;
    v4.opaque[1] = 0;
    os_activity_scope_enter(v2, &v4);
    objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "autoFillHelperUserNotificationDidActivate:", *(_QWORD *)(a1 + 40));

    os_activity_scope_leave(&v4);
  }
}

- (void)serverUserNotificationDidDismiss:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__SFRemoteAutoFillSessionHelper_serverUserNotificationDidDismiss___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __66__SFRemoteAutoFillSessionHelper_serverUserNotificationDidDismiss___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  os_activity_scope_state_s v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v2 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteAutoFillSessionHelper/autoFillHelperUserNotificationDidDismiss", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v4.opaque[0] = 0;
    v4.opaque[1] = 0;
    os_activity_scope_enter(v2, &v4);
    objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "autoFillHelperUserNotificationDidDismiss:", *(_QWORD *)(a1 + 40));

    os_activity_scope_leave(&v4);
  }
}

- (void)autoFillDismissUserNotification
{
  void (**dismissUserNotificationHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteAutoFillSessionHelper <= 30
    && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dismissUserNotificationHandler = (void (**)(void))self->_dismissUserNotificationHandler;
  if (dismissUserNotificationHandler)
    dismissUserNotificationHandler[2]();
}

- (void)autoFillPairingSucceeded:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**pairingResponseHandler)(id, _BOOL8, id);
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteAutoFillSessionHelper <= 30
    && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  pairingResponseHandler = (void (**)(id, _BOOL8, id))self->_pairingResponseHandler;
  v7 = v8;
  if (pairingResponseHandler)
  {
    pairingResponseHandler[2](pairingResponseHandler, v4, v8);
    v7 = v8;
  }

}

- (void)autoFillPromptForPIN:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void (**promptForPINHandler)(id, uint64_t, uint64_t);

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteAutoFillSessionHelper <= 30
    && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  promptForPINHandler = (void (**)(id, uint64_t, uint64_t))self->_promptForPINHandler;
  if (promptForPINHandler)
    promptForPINHandler[2](promptForPINHandler, v5, v4);
}

- (void)clientDismissUserNotification
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (self->_agent)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SFRemoteAutoFillSessionHelper_clientDismissUserNotification__block_invoke;
    block[3] = &unk_1E482DF78;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
  else if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60
         && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __62__SFRemoteAutoFillSessionHelper_clientDismissUserNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "autoFillDismissUserNotification");
}

- (void)clientPairingSucceeded:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *dispatchQueue;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  v7 = v6;
  if (self->_agent)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__SFRemoteAutoFillSessionHelper_clientPairingSucceeded_completion___block_invoke;
    block[3] = &unk_1E482E800;
    block[4] = self;
    v11 = a3;
    v10 = v6;
    dispatch_async(dispatchQueue, block);

  }
  else if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60
         && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

uint64_t __67__SFRemoteAutoFillSessionHelper_clientPairingSucceeded_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "autoFillPairingSucceeded:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)clientPromptForPIN:(unsigned int)a3 throttleSeconds:(int)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[5];
  unsigned int v6;
  int v7;

  if (self->_agent)
  {
    dispatchQueue = self->_dispatchQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__SFRemoteAutoFillSessionHelper_clientPromptForPIN_throttleSeconds___block_invoke;
    v5[3] = &unk_1E482E018;
    v5[4] = self;
    v6 = a3;
    v7 = a4;
    dispatch_async(dispatchQueue, v5);
  }
  else if (gLogCategory_SFRemoteAutoFillSessionHelper <= 60
         && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __68__SFRemoteAutoFillSessionHelper_clientPromptForPIN_throttleSeconds___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "autoFillPromptForPIN:throttleSeconds:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

- (void)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.SharingServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B55E0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__SFRemoteAutoFillSessionHelper__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E482DF78;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __50__SFRemoteAutoFillSessionHelper__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E482DF78;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DB8C8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 10
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __50__SFRemoteAutoFillSessionHelper__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __50__SFRemoteAutoFillSessionHelper__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  void (**interruptionHandler)(void);
  NSObject *v4;
  void *v5;
  os_activity_scope_state_s v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteAutoFillSessionHelper <= 50
    && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
  if (self->_activateCalled)
  {
    v4 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteAutoFillSessionHelper/autoFillHelperActivate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v6.opaque[0] = 0;
    v6.opaque[1] = 0;
    os_activity_scope_enter(v4, &v6);
    if (gLogCategory_SFRemoteAutoFillSessionHelper <= 50
      && (gLogCategory_SFRemoteAutoFillSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFRemoteAutoFillSessionHelper _ensureXPCStarted](self, "_ensureXPCStarted");
    -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autoFillHelperActivate:completion:", self, &__block_literal_global_8);

    os_activity_scope_leave(&v6);
  }
}

void __45__SFRemoteAutoFillSessionHelper__interrupted__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_SFRemoteAutoFillSessionHelper <= 30
    && ((v5 = v2, gLogCategory_SFRemoteAutoFillSessionHelper != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)dismissUserNotificationHandler
{
  return self->_dismissUserNotificationHandler;
}

- (void)setDismissUserNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)pairingResponseHandler
{
  return self->_pairingResponseHandler;
}

- (void)setPairingResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SDAutoFillAgent)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
  objc_storeStrong((id *)&self->_agent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_pairingResponseHandler, 0);
  objc_storeStrong(&self->_dismissUserNotificationHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end
