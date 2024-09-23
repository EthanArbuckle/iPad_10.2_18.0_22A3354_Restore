@implementation SFProximityClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFProximityClient)init
{
  SFProximityClient *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFProximityClient;
  v2 = -[SFProximityClient init](&v6, sel_init);
  if (v2)
  {
    SFMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (SFProximityClient)initWithCoder:(id)a3
{
  id v4;
  SFProximityClient *v5;
  uint64_t v6;
  OS_dispatch_queue *dispatchQueue;
  id v8;
  id v9;
  SFProximityClient *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFProximityClient;
  v5 = -[SFProximityClient init](&v12, sel_init);
  if (v5)
  {
    SFMainQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = v4;
    if (objc_msgSend(v8, "containsValueForKey:", CFSTR("sa")))
      v5->_shouldAdvertise = objc_msgSend(v8, "decodeBoolForKey:", CFSTR("sa"));

    v9 = v8;
    if (objc_msgSend(v9, "containsValueForKey:", CFSTR("wu")))
      v5->_wantsUpdates = objc_msgSend(v9, "decodeBoolForKey:", CFSTR("wu"));

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_shouldAdvertise)
  {
    objc_msgSend(v4, "encodeBool:forKey:", 1, CFSTR("sa"));
    v4 = v5;
  }
  if (self->_wantsUpdates)
  {
    objc_msgSend(v5, "encodeBool:forKey:", 1, CFSTR("wu"));
    v4 = v5;
  }

}

- (void)dealloc
{
  OS_dispatch_queue *dispatchQueue;
  id interruptionHandler;
  id invalidationHandler;
  SFProximityClient *v6;
  SEL v7;
  id v8;
  objc_super v9;

  if (self->_xpcCnx)
  {
    v6 = (SFProximityClient *)FatalErrorF();
    -[SFProximityClient activateWithCompletion:](v6, v7, v8);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0;

    }
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    v9.receiver = self;
    v9.super_class = (Class)SFProximityClient;
    -[SFProximityClient dealloc](&v9, sel_dealloc);
  }
}

- (void)activateWithCompletion:(id)a3
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
  v7[2] = __44__SFProximityClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __44__SFProximityClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *xpcCnx;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  os_activity_scope_state_s state;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFProximityClient/proximityClientActivate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activateCalled)
  {
    v9 = -6721;
  }
  else
  {
    if (gLogCategory_SFProximityClient <= 30
      && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_activateCalled = 1;
    -[SFProximityClient _ensureXPCStarted](self, "_ensureXPCStarted");
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      -[NSXPCConnection remoteObjectProxy](xpcCnx, "remoteObjectProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __45__SFProximityClient__activateWithCompletion___block_invoke;
      v15[3] = &unk_1E482E490;
      v16 = v4;
      objc_msgSend(v7, "proximityClientActivate:completion:", self, v15);

      v8 = v16;
      goto LABEL_8;
    }
    v9 = -6753;
  }
  if (!v4)
    goto LABEL_9;
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v18 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
  v11 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v11;
  v12 = CFSTR("?");
  if (v11)
    v12 = (const __CFString *)v11;
  v19[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v4 + 2))(v4, v14);

LABEL_8:
LABEL_9:
  os_activity_scope_leave(&state);

}

uint64_t __45__SFProximityClient__activateWithCompletion___block_invoke(uint64_t a1)
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
  block[2] = __31__SFProximityClient_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __31__SFProximityClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSXPCConnection *xpcCnx;
  NSXPCConnection *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateDone)
  {
    if (gLogCategory_SFProximityClient <= 60
      && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_SFProximityClient <= 30
      && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
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
      -[SFProximityClient _invalidated](self, "_invalidated");
    }
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  id interruptionHandler;
  id v5;
  NSXPCConnection *xpcCnx;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFProximityClient <= 50
      && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_SFProximityClient <= 10
      && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
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
    v9[2] = __38__SFProximityClient__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E482DF78;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __38__SFProximityClient__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E482DF78;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DB868);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_SFProximityClient <= 10
      && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __38__SFProximityClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __38__SFProximityClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 50
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)_invokeBlockActivateSafe:(id)a3
{
  void (**v4)(_QWORD);
  SFProximityClient *v5;
  NSObject *dispatchQueue;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__SFProximityClient__invokeBlockActivateSafe___block_invoke;
    v7[3] = &unk_1E482E0F0;
    v7[4] = v5;
    v8 = v4;
    dispatch_async(dispatchQueue, v7);

  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);

}

void __46__SFProximityClient__invokeBlockActivateSafe___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "proximityClientUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)setShouldAdvertise:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__SFProximityClient_setShouldAdvertise___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v3[4] = self;
  v4 = a3;
  -[SFProximityClient _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __40__SFProximityClient_setShouldAdvertise___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = *(_BYTE *)(result + 40);
  return result;
}

- (void)dismissContentForDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SFProximityClient_dismissContentForDevice_completion___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __56__SFProximityClient_dismissContentForDevice_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissContentForDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_dismissContentForDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *xpcCnx;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    v17 = v6;
    LogPrintF();
  }
  -[SFProximityClient _ensureXPCStarted](self, "_ensureXPCStarted", v17);
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    -[NSXPCConnection remoteObjectProxy](xpcCnx, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__SFProximityClient__dismissContentForDevice_completion___block_invoke;
    v18[3] = &unk_1E482E490;
    v19 = v7;
    objc_msgSend(v9, "proximityClientDismissContentForDevice:completion:", v6, v18);

    v10 = v19;
  }
  else
  {
    if (!v7)
      goto LABEL_8;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2F90];
    v20 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v13 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v13;
    v14 = CFSTR("?");
    if (v13)
      v14 = (const __CFString *)v13;
    v21[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -6753, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v16);

  }
LABEL_8:

}

uint64_t __57__SFProximityClient__dismissContentForDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)provideContent:(id)a3 forDevice:(id)a4 force:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *dispatchQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SFProximityClient_provideContent_forDevice_force_completion___block_invoke;
  block[3] = &unk_1E482E4E0;
  block[4] = self;
  v18 = v10;
  v21 = a5;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(dispatchQueue, block);

}

uint64_t __63__SFProximityClient_provideContent_forDevice_force_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_provideContent:forDevice:force:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)_provideContent:(id)a3 forDevice:(id)a4 force:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  NSXPCConnection *xpcCnx;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  const char *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  os_activity_scope_state_s state;
  uint64_t v29;
  _QWORD v30[2];

  v7 = a5;
  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = _os_activity_create(&dword_1A2830000, "Sharing/SFProximityClient/proximityClientprovideContent", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    v14 = "no";
    if (v7)
      v14 = "yes";
    v24 = v14;
    v25 = v10;
    v23 = v11;
    LogPrintF();
  }
  -[SFProximityClient _ensureXPCStarted](self, "_ensureXPCStarted", v23, v24, v25);
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    -[NSXPCConnection remoteObjectProxy](xpcCnx, "remoteObjectProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __64__SFProximityClient__provideContent_forDevice_force_completion___block_invoke;
    v26[3] = &unk_1E482E490;
    v27 = v12;
    objc_msgSend(v16, "proximityClientProvideContent:forDevice:force:completion:", v10, v11, v7, v26);

    v17 = v27;
  }
  else
  {
    if (!v12)
      goto LABEL_10;
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v19 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v19;
    v20 = CFSTR("?");
    if (v19)
      v20 = (const __CFString *)v19;
    v30[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -6753, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v12 + 2))(v12, v22);

  }
LABEL_10:
  os_activity_scope_leave(&state);

}

uint64_t __64__SFProximityClient__provideContent_forDevice_force_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)suppressDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SFProximityClient_suppressDevice_completion___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __47__SFProximityClient_suppressDevice_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_suppressDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_suppressDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *xpcCnx;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    v17 = v6;
    LogPrintF();
  }
  -[SFProximityClient _ensureXPCStarted](self, "_ensureXPCStarted", v17);
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    -[NSXPCConnection remoteObjectProxy](xpcCnx, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __48__SFProximityClient__suppressDevice_completion___block_invoke;
    v18[3] = &unk_1E482E490;
    v19 = v7;
    objc_msgSend(v9, "proximityClientSuppressDevice:completion:", v6, v18);

    v10 = v19;
  }
  else
  {
    if (!v7)
      goto LABEL_8;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2F90];
    v20 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v13 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v13;
    v14 = CFSTR("?");
    if (v13)
      v14 = (const __CFString *)v13;
    v21[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -6753, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v16);

  }
LABEL_8:

}

uint64_t __48__SFProximityClient__suppressDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)stopSuppressingDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SFProximityClient_stopSuppressingDevice_completion___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __54__SFProximityClient_stopSuppressingDevice_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopSuppressingDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_stopSuppressingDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSXPCConnection *xpcCnx;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    v17 = v6;
    LogPrintF();
  }
  -[SFProximityClient _ensureXPCStarted](self, "_ensureXPCStarted", v17);
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    -[NSXPCConnection remoteObjectProxy](xpcCnx, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __55__SFProximityClient__stopSuppressingDevice_completion___block_invoke;
    v18[3] = &unk_1E482E490;
    v19 = v7;
    objc_msgSend(v9, "proximityClientStopSuppressingDevice:completion:", v6, v18);

    v10 = v19;
  }
  else
  {
    if (!v7)
      goto LABEL_8;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2F90];
    v20 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v13 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v13;
    v14 = CFSTR("?");
    if (v13)
      v14 = (const __CFString *)v13;
    v21[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -6753, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v16);

  }
LABEL_8:

}

uint64_t __55__SFProximityClient__stopSuppressingDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateContent:(id)a3 forDevice:(id)a4 completion:(id)a5
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
  v15[2] = __56__SFProximityClient_updateContent_forDevice_completion___block_invoke;
  v15[3] = &unk_1E482E508;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

uint64_t __56__SFProximityClient_updateContent_forDevice_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateContent:forDevice:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_updateContent:(id)a3 forDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSXPCConnection *xpcCnx;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    v20 = v9;
    v21 = v8;
    LogPrintF();
  }
  -[SFProximityClient _ensureXPCStarted](self, "_ensureXPCStarted", v20, v21);
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    -[NSXPCConnection remoteObjectProxy](xpcCnx, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __57__SFProximityClient__updateContent_forDevice_completion___block_invoke;
    v22[3] = &unk_1E482E490;
    v23 = v10;
    objc_msgSend(v12, "proximityClientUpdateContent:forDevice:completion:", v8, v9, v22);

    v13 = v23;
  }
  else
  {
    if (!v10)
      goto LABEL_8;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2F90];
    v24 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v16 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v16;
    v17 = CFSTR("?");
    if (v16)
      v17 = (const __CFString *)v16;
    v25[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, -6753, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v19);

  }
LABEL_8:

}

uint64_t __57__SFProximityClient__updateContent_forDevice_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)requestScannerTimerReset
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SFProximityClient_requestScannerTimerReset__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __45__SFProximityClient_requestScannerTimerReset__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    objc_msgSend(v2, "remoteObjectProxy");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "proximityClientRequestScannerTimerReset");

  }
  else if (gLogCategory_SFProximityClient <= 90
         && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = *MEMORY[0x1E0CB2F90];
    v11 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = CFSTR("?");
    if (v5)
      v7 = (const __CFString *)v5;
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, -6753, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
}

- (void)proximityClientDeviceEnteredImmediate:(id)a3
{
  void (**deviceEnteredImmediateHandler)(id, id);
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceEnteredImmediateHandler = (void (**)(id, id))self->_deviceEnteredImmediateHandler;
  v5 = v6;
  if (deviceEnteredImmediateHandler)
  {
    deviceEnteredImmediateHandler[2](deviceEnteredImmediateHandler, v6);
    v5 = v6;
  }

}

- (void)proximityClientDeviceExitedImmediate:(id)a3
{
  void (**deviceExitedImmediateHandler)(id, id);
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceExitedImmediateHandler = (void (**)(id, id))self->_deviceExitedImmediateHandler;
  v5 = v6;
  if (deviceExitedImmediateHandler)
  {
    deviceExitedImmediateHandler[2](deviceExitedImmediateHandler, v6);
    v5 = v6;
  }

}

- (void)proximityClientDeviceEnteredNearby:(id)a3
{
  void (**deviceEnteredNearbyHandler)(id, id);
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceEnteredNearbyHandler = (void (**)(id, id))self->_deviceEnteredNearbyHandler;
  v5 = v6;
  if (deviceEnteredNearbyHandler)
  {
    deviceEnteredNearbyHandler[2](deviceEnteredNearbyHandler, v6);
    v5 = v6;
  }

}

- (void)proximityClientDeviceExitedNearby:(id)a3
{
  void (**deviceExitedNearbyHandler)(id, id);
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceExitedNearbyHandler = (void (**)(id, id))self->_deviceExitedNearbyHandler;
  v5 = v6;
  if (deviceExitedNearbyHandler)
  {
    deviceExitedNearbyHandler[2](deviceExitedNearbyHandler, v6);
    v5 = v6;
  }

}

- (void)proximityClientDeviceWasDismissedHandler:(id)a3 reason:(int64_t)a4
{
  void (**deviceWasDismissedHandlerEx)(id, id, int64_t);
  void *v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceWasDismissedHandlerEx = (void (**)(id, id, int64_t))self->_deviceWasDismissedHandlerEx;
  v7 = v8;
  if (deviceWasDismissedHandlerEx)
  {
    deviceWasDismissedHandlerEx[2](deviceWasDismissedHandlerEx, v8, a4);
    v7 = v8;
  }

}

- (void)proximityClientDeviceWasSelectedHandler:(id)a3
{
  void (**deviceWasSelectedHandler)(id, id);
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceWasSelectedHandler = (void (**)(id, id))self->_deviceWasSelectedHandler;
  v5 = v6;
  if (deviceWasSelectedHandler)
  {
    deviceWasSelectedHandler[2](deviceWasSelectedHandler, v6);
    v5 = v6;
  }

}

- (void)proximityClientDeviceDidUntriggerHandler:(id)a3
{
  void (**deviceDidUntriggerHandler)(id, id);
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceDidUntriggerHandler = (void (**)(id, id))self->_deviceDidUntriggerHandler;
  v5 = v6;
  if (deviceDidUntriggerHandler)
  {
    deviceDidUntriggerHandler[2](deviceDidUntriggerHandler, v6);
    v5 = v6;
  }

}

- (void)proximityClientDeviceWillTriggerHandler:(id)a3
{
  void (**deviceWillTriggerHandler)(id, id);
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceWillTriggerHandler = (void (**)(id, id))self->_deviceWillTriggerHandler;
  v5 = v6;
  if (deviceWillTriggerHandler)
  {
    deviceWillTriggerHandler[2](deviceWillTriggerHandler, v6);
    v5 = v6;
  }

}

- (void)proximityClientDeviceUpdated:(id)a3 rssi:(int64_t)a4 state:(int64_t)a5
{
  void (**deviceUpdateHandler)(id, id, int64_t, int64_t);
  void *v9;
  id v10;

  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFProximityClient <= 30
    && (gLogCategory_SFProximityClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceUpdateHandler = (void (**)(id, id, int64_t, int64_t))self->_deviceUpdateHandler;
  v9 = v10;
  if (deviceUpdateHandler)
  {
    deviceUpdateHandler[2](deviceUpdateHandler, v10, a4, a5);
    v9 = v10;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)shouldAdvertise
{
  return self->_shouldAdvertise;
}

- (id)deviceEnteredImmediateHandler
{
  return self->_deviceEnteredImmediateHandler;
}

- (void)setDeviceEnteredImmediateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)deviceExitedImmediateHandler
{
  return self->_deviceExitedImmediateHandler;
}

- (void)setDeviceExitedImmediateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)deviceEnteredNearbyHandler
{
  return self->_deviceEnteredNearbyHandler;
}

- (void)setDeviceEnteredNearbyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)deviceExitedNearbyHandler
{
  return self->_deviceExitedNearbyHandler;
}

- (void)setDeviceExitedNearbyHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)deviceWasSelectedHandler
{
  return self->_deviceWasSelectedHandler;
}

- (void)setDeviceWasSelectedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)deviceWillTriggerHandler
{
  return self->_deviceWillTriggerHandler;
}

- (void)setDeviceWillTriggerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)deviceDidUntriggerHandler
{
  return self->_deviceDidUntriggerHandler;
}

- (void)setDeviceDidUntriggerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)deviceWasDismissedHandlerEx
{
  return self->_deviceWasDismissedHandlerEx;
}

- (void)setDeviceWasDismissedHandlerEx:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)deviceWasDismissedHandler
{
  return self->_deviceWasDismissedHandler;
}

- (void)setDeviceWasDismissedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)deviceUpdateHandler
{
  return self->_deviceUpdateHandler;
}

- (void)setDeviceUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)wantsUpdates
{
  return self->_wantsUpdates;
}

- (void)setWantsUpdates:(BOOL)a3
{
  self->_wantsUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceUpdateHandler, 0);
  objc_storeStrong(&self->_deviceWasDismissedHandler, 0);
  objc_storeStrong(&self->_deviceWasDismissedHandlerEx, 0);
  objc_storeStrong(&self->_deviceDidUntriggerHandler, 0);
  objc_storeStrong(&self->_deviceWillTriggerHandler, 0);
  objc_storeStrong(&self->_deviceWasSelectedHandler, 0);
  objc_storeStrong(&self->_deviceExitedNearbyHandler, 0);
  objc_storeStrong(&self->_deviceEnteredNearbyHandler, 0);
  objc_storeStrong(&self->_deviceExitedImmediateHandler, 0);
  objc_storeStrong(&self->_deviceEnteredImmediateHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
