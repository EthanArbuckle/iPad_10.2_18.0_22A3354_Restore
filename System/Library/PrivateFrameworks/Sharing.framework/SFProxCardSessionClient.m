@implementation SFProxCardSessionClient

- (SFProxCardSessionClient)init
{
  SFProxCardSessionClient *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  SFProxCardSessionClient *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFProxCardSessionClient;
  v2 = -[SFProxCardSessionClient init](&v7, sel_init);
  if (v2)
  {
    SFMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_ucat = (LogCategory *)&gLogCategory_SFProxCardSessionClient;
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SFProxCardSessionClient;
  -[SFProxCardSessionClient dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

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
  v7[2] = __50__SFProxCardSessionClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __50__SFProxCardSessionClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  int v4;
  id v5;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[8])
  {
    NSErrorF();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 40);
    v5 = (id)v3;
    if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(v2, "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
  }
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  int var0;
  NSXPCListener *v8;
  NSXPCListener *xpcListener;
  void *v10;
  void *v11;
  NSString *v12;
  __CFString *viewServiceName;
  __CFString *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  SBSRemoteAlertHandle *v23;
  SBSRemoteAlertHandle *remoteAlertHandle;
  SBSRemoteAlertHandle *v25;
  dispatch_source_t v26;
  void *v27;
  id activateCompletion;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  _QWORD handler[5];
  _QWORD aBlock[5];
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v4 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3;
  v46 = __Block_byref_object_dispose__3;
  v47 = 0;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__SFProxCardSessionClient__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_1E482FD50;
  v41 = &v42;
  aBlock[4] = self;
  v37 = v4;
  v40 = v37;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (self->_activateCalled)
  {
    SFErrorF();
    v30 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v43[5];
    v43[5] = v30;
  }
  else
  {
    self->_activateCalled = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener", v37);
    v8 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    xpcListener = self->_xpcListener;
    self->_xpcListener = v8;

    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener resume](self->_xpcListener, "resume");
    -[NSXPCListener endpoint](self->_xpcListener, "endpoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_endpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = self->_viewControllerClassName;
      if (v12)
      {
        viewServiceName = (__CFString *)self->_viewServiceName;
        if (!viewServiceName)
          viewServiceName = CFSTR("com.apple.SharingViewService");
        v14 = viewServiceName;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", v14, v12);
        if (v15)
        {
          v16 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "setXpcEndpoint:", v11);
            v18 = v5;
            v19 = (void *)-[NSDictionary mutableCopy](self->_userInfo, "mutableCopy");
            v20 = v19;
            if (v19)
              v21 = v19;
            else
              v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v22 = v21;

            objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_proxXPC"));
            objc_msgSend(v17, "setUserInfo:", v22);
            v23 = (SBSRemoteAlertHandle *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v15, v17);
            remoteAlertHandle = self->_remoteAlertHandle;
            self->_remoteAlertHandle = v23;

            v25 = self->_remoteAlertHandle;
            if (v25)
            {
              -[SBSRemoteAlertHandle addObserver:](v25, "addObserver:", self);
              -[SBSRemoteAlertHandle activateWithContext:](self->_remoteAlertHandle, "activateWithContext:", 0);
              v26 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
              objc_storeStrong((id *)&self->_xpcCheckinTimer, v26);
              handler[0] = v18;
              handler[1] = 3221225472;
              handler[2] = __51__SFProxCardSessionClient__activateWithCompletion___block_invoke_2;
              handler[3] = &unk_1E482DF78;
              handler[4] = self;
              dispatch_source_set_event_handler(v26, handler);
              SFDispatchTimerSet(v26, 30.0, -1.0, 1.0);
              dispatch_activate(v26);
              v27 = _Block_copy(v37);
              activateCompletion = self->_activateCompletion;
              self->_activateCompletion = v27;

              v29 = self->_ucat->var0;
              if (v29 <= 30 && (v29 != -1 || _LogCategory_Initialize()))
                LogPrintF();
            }
            else
            {
              SFErrorF();
              v36 = objc_claimAutoreleasedReturnValue();
              v26 = (dispatch_source_t)v43[5];
              v43[5] = v36;
            }

          }
          else
          {
            SFErrorF();
            v35 = objc_claimAutoreleasedReturnValue();
            v22 = (void *)v43[5];
            v43[5] = v35;
          }

        }
        else
        {
          SFErrorF();
          v34 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v43[5];
          v43[5] = v34;
        }

      }
      else
      {
        SFErrorF();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = (void *)v43[5];
        v43[5] = v32;

      }
    }
    else
    {
      SFErrorF();
      v31 = objc_claimAutoreleasedReturnValue();
      v12 = (NSString *)v43[5];
      v43[5] = v31;
    }

  }
  v6[2](v6);

  _Block_object_dispose(&v42, 8);
}

uint64_t __51__SFProxCardSessionClient__activateWithCompletion___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 40))
  {
    v1 = result;
    v2 = **(_DWORD **)(*(_QWORD *)(result + 32) + 40);
    if (v2 <= 90 && (v2 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __51__SFProxCardSessionClient__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcCheckinTimerFired");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFProxCardSessionClient_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFProxCardSessionClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD **v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 25))
  {
    v2 = result;
    *(_BYTE *)(v1 + 25) = 1;
    v3 = *(_DWORD ***)(result + 32);
    v4 = *v3[5];
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v5))
      {
        LogPrintF();
        v3 = *(_DWORD ***)(v2 + 32);
      }
    }
    return objc_msgSend(v3, "_invalidate");
  }
  return result;
}

- (void)_invalidate
{
  SFProxCardXPCClientInterface *delegate;
  SBSRemoteAlertHandle *remoteAlertHandle;
  SBSRemoteAlertHandle *v5;
  OS_dispatch_source *xpcCheckinTimer;
  NSObject *v7;
  OS_dispatch_source *v8;
  NSXPCListener *xpcListener;

  delegate = self->_delegate;
  self->_delegate = 0;

  remoteAlertHandle = self->_remoteAlertHandle;
  if (remoteAlertHandle)
  {
    -[SBSRemoteAlertHandle removeObserver:](remoteAlertHandle, "removeObserver:", self);
    -[SBSRemoteAlertHandle invalidate](self->_remoteAlertHandle, "invalidate");
    v5 = self->_remoteAlertHandle;
    self->_remoteAlertHandle = 0;

  }
  xpcCheckinTimer = self->_xpcCheckinTimer;
  if (xpcCheckinTimer)
  {
    v7 = xpcCheckinTimer;
    dispatch_source_cancel(v7);
    v8 = self->_xpcCheckinTimer;
    self->_xpcCheckinTimer = 0;

  }
  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  -[NSXPCConnection invalidate](self->_xpcCnx, "invalidate");
  -[SFProxCardSessionClient _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  void (**v3)(void *, void *);
  void *v4;
  void *v5;
  void *v6;
  id activateCompletion;
  id errorHandler;
  id invalidationHandler;
  int var0;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone && self->_invalidateCalled && !self->_remoteAlertHandle && !self->_xpcCnx)
  {
    v3 = (void (**)(void *, void *))_Block_copy(self->_activateCompletion);
    if (v3)
    {
      SFErrorF();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3[2](v3, v4);

    }
    v5 = _Block_copy(self->_invalidationHandler);
    v6 = v5;
    if (v5)
      (*((void (**)(void *))v5 + 2))(v5);

    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)_reportError:(id)a3
{
  int var0;
  void *v5;
  void *v6;
  id activateCompletion;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  var0 = self->_ucat->var0;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v5 = _Block_copy(self->_activateCompletion);
  v6 = v5;
  if (v5)
    (*((void (**)(void *, id))v5 + 2))(v5, v10);

  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  v8 = _Block_copy(self->_errorHandler);
  v9 = v8;
  if (v8)
    (*((void (**)(void *, id))v8 + 2))(v8, v10);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  NSXPCConnection **p_xpcCnx;
  int var0;
  NSXPCConnection *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[5];
  id v17;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  p_xpcCnx = &self->_xpcCnx;
  if (self->_xpcCnx)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v15 = objc_msgSend(v6, "processIdentifier");
      LogPrintF();
    }
    -[NSXPCConnection invalidate](*p_xpcCnx, "invalidate", v15);
    v9 = *p_xpcCnx;
    *p_xpcCnx = 0;

  }
  v10 = self->_ucat->var0;
  if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v6, "processIdentifier");
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_xpcCnx, a4);
  objc_msgSend(v6, "_setQueue:", self->_dispatchQueue);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B9FF0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v11);

  objc_msgSend(v6, "setExportedObject:", self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__SFProxCardSessionClient_listener_shouldAcceptNewConnection___block_invoke;
  v16[3] = &unk_1E482D3A0;
  v16[4] = self;
  v17 = v6;
  v12 = v6;
  objc_msgSend(v12, "setInvalidationHandler:", v16);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBC28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRemoteObjectInterface:", v13);

  objc_msgSend(v12, "resume");
  return 1;
}

uint64_t __62__SFProxCardSessionClient_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_xpcConnectionInvalidated:", *(_QWORD *)(a1 + 40));
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SFProxCardSessionClient *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SFProxCardSessionClient_remoteAlertHandleDidActivate___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

int *__56__SFProxCardSessionClient_remoteAlertHandleDidActivate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *result;
  uint64_t v4;
  int v5;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(v1 + 32);
  result = *(int **)(v1 + 40);
  v5 = *result;
  if (v2 == v4)
  {
    if (v5 > 30)
      return result;
    if (v5 == -1)
    {
      result = (int *)_LogCategory_Initialize();
      if (!(_DWORD)result)
        return result;
    }
    return (int *)LogPrintF();
  }
  if (v5 <= 30)
  {
    if (v5 != -1)
      return (int *)LogPrintF();
    result = (int *)_LogCategory_Initialize();
    if ((_DWORD)result)
      return (int *)LogPrintF();
  }
  return result;
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SFProxCardSessionClient *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SFProxCardSessionClient_remoteAlertHandleDidDeactivate___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

int *__58__SFProxCardSessionClient_remoteAlertHandleDidDeactivate___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int *result;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 32))
  {
    if (*(_BYTE *)(v1 + 25) || *(_BYTE *)(v1 + 24))
    {
      result = *(int **)(v1 + 40);
      if (*result <= 30)
      {
        if (*result != -1)
          return (int *)LogPrintF();
        result = (int *)_LogCategory_Initialize();
        if ((_DWORD)result)
          return (int *)LogPrintF();
      }
    }
    else
    {
      result = *(int **)(v1 + 40);
      if (*result <= 90)
      {
        if (*result != -1)
          return (int *)LogPrintF();
        result = (int *)_LogCategory_Initialize();
        if ((_DWORD)result)
          return (int *)LogPrintF();
      }
    }
  }
  else
  {
    result = *(int **)(v1 + 40);
    if (*result <= 30)
    {
      if (*result != -1)
        return (int *)LogPrintF();
      result = (int *)_LogCategory_Initialize();
      if ((_DWORD)result)
        return (int *)LogPrintF();
    }
  }
  return result;
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SFProxCardSessionClient *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SFProxCardSessionClient_remoteAlertHandle_didInvalidateWithError___block_invoke;
  block[3] = &unk_1E482EBA0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

int *__68__SFProxCardSessionClient_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  int *result;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v2 + 32))
  {
    if (*(_BYTE *)(v2 + 25) || *(_BYTE *)(v2 + 24))
    {
      v3 = **(_DWORD **)(v2 + 40);
      if (v3 > 30 || v3 == -1 && !_LogCategory_Initialize())
        goto LABEL_12;
    }
    else
    {
      v4 = **(_DWORD **)(v2 + 40);
      if (v4 > 90 || v4 == -1 && !_LogCategory_Initialize())
        goto LABEL_12;
    }
    LogPrintF();
LABEL_12:
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = 0;

    return (int *)objc_msgSend(*(id *)(a1 + 40), "_invalidated");
  }
  result = *(int **)(v2 + 40);
  if (*result <= 30)
  {
    if (*result != -1)
      return (int *)LogPrintF();
    result = (int *)_LogCategory_Initialize();
    if ((_DWORD)result)
      return (int *)LogPrintF();
  }
  return result;
}

- (void)_xpcConnectionInvalidated:(id)a3
{
  void *v4;
  int var0;
  NSXPCConnection *v6;
  uint64_t v7;
  NSXPCConnection *v8;

  v8 = (NSXPCConnection *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!*(_WORD *)&self->_dismissCalled)
  {
    SFErrorF();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFProxCardSessionClient _reportError:](self, "_reportError:", v4);

  }
  var0 = self->_ucat->var0;
  if (var0 <= 20)
  {
    v6 = v8;
    if (var0 != -1)
    {
LABEL_5:
      v7 = -[NSXPCConnection processIdentifier](v6, "processIdentifier");
      LogPrintF();
      goto LABEL_7;
    }
    if (_LogCategory_Initialize())
    {
      v6 = v8;
      goto LABEL_5;
    }
  }
LABEL_7:
  if (self->_xpcCnx == v8)
  {
    self->_xpcCnx = 0;

  }
  -[SFProxCardSessionClient _invalidated](self, "_invalidated", v7);

}

- (void)_xpcCheckinTimerFired
{
  OS_dispatch_source *xpcCheckinTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  id v6;

  xpcCheckinTimer = self->_xpcCheckinTimer;
  if (xpcCheckinTimer)
  {
    v4 = xpcCheckinTimer;
    dispatch_source_cancel(v4);
    v5 = self->_xpcCheckinTimer;
    self->_xpcCheckinTimer = 0;

  }
  SFErrorF();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SFProxCardSessionClient _reportError:](self, "_reportError:", v6);

}

- (void)xpcCheckinWithCompletion:(id)a3
{
  NSObject *dispatchQueue;
  int var0;
  OS_dispatch_source *xpcCheckinTimer;
  NSObject *v7;
  OS_dispatch_source *v8;
  void *v9;
  void *v10;
  id activateCompletion;
  void (**v12)(id, _QWORD);

  dispatchQueue = self->_dispatchQueue;
  v12 = (void (**)(id, _QWORD))a3;
  dispatch_assert_queue_V2(dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  xpcCheckinTimer = self->_xpcCheckinTimer;
  if (xpcCheckinTimer)
  {
    v7 = xpcCheckinTimer;
    dispatch_source_cancel(v7);
    v8 = self->_xpcCheckinTimer;
    self->_xpcCheckinTimer = 0;

  }
  v9 = _Block_copy(self->_activateCompletion);
  v10 = v9;
  if (v9)
    (*((void (**)(void *, _QWORD))v9 + 2))(v9, 0);

  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  v12[2](v12, 0);
}

- (void)xpcPerformAction:(int)a3 completion:(id)a4
{
  uint64_t v4;
  int var0;
  SFProxCardXPCClientInterface *v7;
  void (**v8)(id, _QWORD);

  v4 = *(_QWORD *)&a3;
  v8 = (void (**)(id, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->_dismissCalled = 1;
  v7 = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SFProxCardXPCClientInterface xpcPerformAction:completion:](v7, "xpcPerformAction:completion:", v4, v8);
  else
    v8[2](v8, 0);

}

- (SFProxCardXPCClientInterface)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)label
{
  return self->_label;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (void)setViewControllerClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)viewServiceName
{
  return self->_viewServiceName;
}

- (void)setViewServiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewServiceName, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_xpcCheckinTimer, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandle, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
