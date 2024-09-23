@implementation RPPrivateAdvertiser

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPPrivateAdvertiser)init
{
  RPPrivateAdvertiser *v3;
  RPPrivateAdvertiser *v4;
  unsigned int v5;
  unsigned int v6;
  RPPrivateAdvertiser *v7;
  objc_super v9;

  if (gRPPrivateAdvertiserClientIDOnce != -1)
    dispatch_once(&gRPPrivateAdvertiserClientIDOnce, &__block_literal_global_10);
  v9.receiver = self;
  v9.super_class = (Class)RPPrivateAdvertiser;
  v3 = -[RPPrivateAdvertiser init](&v9, sel_init);
  v4 = v3;
  if (v3)
  {
    do
    {
      v5 = __ldaxr((unsigned int *)&gRPPrivateAdvertiserClientIDNext);
      v6 = v5 + 1;
    }
    while (__stlxr(v6, (unsigned int *)&gRPPrivateAdvertiserClientIDNext));
    v3->_clientID = v6;
    objc_storeStrong((id *)&v3->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4->_ucat = (LogCategory *)&gLogCategory_RPPrivateAdvertiser;
    v7 = v4;
  }

  return v4;
}

uint64_t __27__RPPrivateAdvertiser_init__block_invoke()
{
  uint64_t result;

  result = RandomBytes();
  gRPPrivateAdvertiserClientIDNext = (unsigned __int16)word_1EEE3A2D2 << 16;
  return result;
}

- (RPPrivateAdvertiser)initWithCoder:(id)a3
{
  id v4;
  RPPrivateAdvertiser *v5;
  RPPrivateAdvertiser *v6;
  id v7;
  id v8;
  id v9;
  RPPrivateAdvertiser *v10;
  objc_super v12;
  uint64_t v13;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RPPrivateAdvertiser;
  v5 = -[RPPrivateAdvertiser init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPPrivateAdvertiser;
    v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v13 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_clientID = v13;
    v8 = v7;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v10 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *accessGroup;
  uint64_t clientID;
  NSDictionary *serviceInfo;
  NSString *serviceType;
  id v9;

  v4 = a3;
  accessGroup = self->_accessGroup;
  v9 = v4;
  if (accessGroup)
  {
    objc_msgSend(v4, "encodeObject:forKey:", accessGroup, CFSTR("ag"));
    v4 = v9;
  }
  clientID = self->_clientID;
  if ((_DWORD)clientID)
  {
    objc_msgSend(v9, "encodeInt64:forKey:", clientID, CFSTR("cid"));
    v4 = v9;
  }
  serviceInfo = self->_serviceInfo;
  if (serviceInfo)
  {
    objc_msgSend(v9, "encodeObject:forKey:", serviceInfo, CFSTR("si"));
    v4 = v9;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    objc_msgSend(v9, "encodeObject:forKey:", serviceType, CFSTR("st"));
    v4 = v9;
  }

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
  v4.super_class = (Class)RPPrivateAdvertiser;
  -[RPPrivateAdvertiser dealloc](&v4, sel_dealloc);
}

- (id)description
{
  id v3;
  void *v4;
  NSString *accessGroup;
  id v6;
  NSString *v8;
  void *v9;

  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  accessGroup = self->_accessGroup;
  if (accessGroup)
  {
    v9 = v3;
    v8 = accessGroup;
    NSAppendPrintF();
    v6 = v9;

    v4 = v6;
  }
  return v4;
}

- (void)setAccessGroup:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  RPPrivateAdvertiser *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__RPPrivateAdvertiser_setAccessGroup___block_invoke;
  v6[3] = &unk_1E5F50AA0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[RPPrivateAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

uint64_t __38__RPPrivateAdvertiser_setAccessGroup___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  if (v3 == v4)
  {

    goto LABEL_6;
  }
  v5 = v4;
  if ((v3 == 0) == (v4 != 0))
  {

    v7 = 0;
    goto LABEL_8;
  }
  v6 = objc_msgSend(v3, "isEqual:", v4);

  if (v6)
  {
LABEL_6:
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = v8;
    v3 = *(id *)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
    v7 = 1;
LABEL_8:

    return v7;
  }
  return 0;
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

}

- (void)setServiceInfo:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  RPPrivateAdvertiser *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__RPPrivateAdvertiser_setServiceInfo___block_invoke;
  v6[3] = &unk_1E5F50AA0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[RPPrivateAdvertiser _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

uint64_t __38__RPPrivateAdvertiser_setServiceInfo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  if (v3 == v4)
  {

    goto LABEL_6;
  }
  v5 = v4;
  if ((v3 == 0) == (v4 != 0))
  {

    v7 = 0;
    goto LABEL_8;
  }
  v6 = objc_msgSend(v3, "isEqual:", v4);

  if (v6)
  {
LABEL_6:
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = v8;
    v3 = *(id *)(v9 + 88);
    *(_QWORD *)(v9 + 88) = v10;
    v7 = 1;
LABEL_8:

    return v7;
  }
  return 0;
}

- (void)activate
{
  RPPrivateAdvertiser *v2;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_activateCalled)
  {
    v2->_activateCalled = 1;
    dispatchQueue = v2->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__RPPrivateAdvertiser_activate__block_invoke;
    block[3] = &unk_1E5F4EC60;
    block[4] = v2;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v2);

}

uint64_t __31__RPPrivateAdvertiser_activate__block_invoke(uint64_t result)
{
  uint64_t v1;
  _BYTE *v2;
  int v3;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 11))
  {
    v3 = **(_DWORD **)(v1 + 16);
    if (v3 <= 115)
    {
      if (v3 != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  else
  {
    *(_BYTE *)(v1 + 10) = gRPPrivateDaemon != 0;
    v2 = *(_BYTE **)(result + 32);
    if (v2[10])
      return objc_msgSend(v2, "_activateDirect");
    else
      return objc_msgSend(v2, "_activateXPC:", 0);
  }
  return result;
}

- (void)_activateDirect
{
  int var0;
  uint64_t clientID;
  NSString *serviceType;
  _QWORD v6[5];

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    clientID = self->_clientID;
    serviceType = self->_serviceType;
    LogPrintF();
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__RPPrivateAdvertiser__activateDirect__block_invoke;
  v6[3] = &unk_1E5F4ECD0;
  v6[4] = self;
  objc_msgSend((id)gRPPrivateDaemon, "addAdvertiser:completion:", self, v6, clientID, serviceType);
}

void __38__RPPrivateAdvertiser__activateDirect__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = **(_DWORD **)(v4 + 16);
  if (v3)
  {
    v10 = v3;
    if (v5 <= 90)
    {
      if (v5 != -1 || (v6 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 32), v6))
      {
        LogPrintF();
        v4 = *(_QWORD *)(a1 + 32);
      }
    }
    v7 = MEMORY[0x1AF45BE48](*(_QWORD *)(v4 + 56));
    v8 = (void *)v7;
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v10);

    goto LABEL_12;
  }
  if (v5 <= 30)
  {
    v10 = 0;
    if (v5 != -1 || (v9 = _LogCategory_Initialize(), v3 = 0, v9))
    {
      LogPrintF();
LABEL_12:
      v3 = v10;
    }
  }

}

- (void)_activateXPC:(BOOL)a3
{
  int var0;
  NSXPCConnection *xpcCnx;
  uint64_t v7;
  void *v8;
  uint64_t clientID;
  NSString *serviceType;
  _QWORD v11[5];
  BOOL v12;
  _QWORD v13[5];
  BOOL v14;

  var0 = self->_ucat->var0;
  if (a3)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      clientID = self->_clientID;
      serviceType = self->_serviceType;
LABEL_8:
      LogPrintF();
    }
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    clientID = self->_clientID;
    serviceType = self->_serviceType;
    goto LABEL_8;
  }
  -[RPPrivateAdvertiser _ensureXPCStarted](self, "_ensureXPCStarted", clientID, serviceType);
  xpcCnx = self->_xpcCnx;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __36__RPPrivateAdvertiser__activateXPC___block_invoke;
  v13[3] = &unk_1E5F50AC8;
  v14 = a3;
  v13[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __36__RPPrivateAdvertiser__activateXPC___block_invoke_2;
  v11[3] = &unk_1E5F50AC8;
  v12 = a3;
  v11[4] = self;
  objc_msgSend(v8, "xpcPrivateAdvertiserActivate:completion:", self, v11);

}

void __36__RPPrivateAdvertiser__activateXPC___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 16);
  if (*(_BYTE *)(a1 + 40))
  {
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF();
  }
  else if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v4 = MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

}

void __36__RPPrivateAdvertiser__activateXPC___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = v3;
  if (!v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (v4 > 30 || v4 == -1 && !_LogCategory_Initialize())
        goto LABEL_24;
    }
    else if (v4 > 30 || v4 == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_24;
    }
    LogPrintF();
    goto LABEL_24;
  }
  if (*(_BYTE *)(a1 + 40))
  {
    if (v4 > 90 || v4 == -1 && !_LogCategory_Initialize())
      goto LABEL_21;
  }
  else if (v4 > 90 || v4 == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_21;
  }
  LogPrintF();
LABEL_21:
  v5 = MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);

LABEL_24:
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

  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.rapport.private-discovery"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE44B88);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__RPPrivateAdvertiser__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E5F4EC60;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __40__RPPrivateAdvertiser__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E5F4EC60;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4ACF8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
  }
}

uint64_t __40__RPPrivateAdvertiser__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __40__RPPrivateAdvertiser__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  int var0;

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[RPPrivateAdvertiser _activateXPC:](self, "_activateXPC:", 1);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__RPPrivateAdvertiser_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__RPPrivateAdvertiser_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 11))
  {
    v2 = result;
    *(_BYTE *)(v1 + 11) = 1;
    v3 = *(_QWORD *)(result + 32);
    v4 = **(_DWORD **)(v3 + 16);
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_QWORD *)(v2 + 32), v5))
      {
        LogPrintF();
        v3 = *(_QWORD *)(v2 + 32);
      }
    }
    if (*(_BYTE *)(v3 + 10))
    {
      objc_msgSend((id)v3, "_invalidateDirect");
      v3 = *(_QWORD *)(v2 + 32);
    }
    if (*(_QWORD *)(v3 + 24))
    {
      objc_msgSend(*(id *)(v3 + 24), "invalidate");
      v3 = *(_QWORD *)(v2 + 32);
    }
    return objc_msgSend((id)v3, "_invalidated");
  }
  return result;
}

- (void)_invalidateDirect
{
  objc_msgSend((id)gRPPrivateDaemon, "removeAdvertiser:completion:");
}

uint64_t __40__RPPrivateAdvertiser__invalidateDirect__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id errorHandler;
  id interruptionHandler;
  id v6;
  int var0;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_direct && !self->_xpcCnx)
  {
    self->_invalidateCalled = 1;
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v6 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  RPPrivateAdvertiser *v5;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = (uint64_t (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_changesPending = 1;
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__RPPrivateAdvertiser__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E5F4EC60;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

uint64_t __48__RPPrivateAdvertiser__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

- (void)_update
{
  RPPrivateAdvertiser *v2;
  _BOOL4 changesPending;
  int var0;
  uint64_t v5;
  NSXPCConnection *xpcCnx;
  void *v7;
  RPPrivateAdvertiser *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  if (!self->_invalidateCalled)
  {
    v2 = self;
    objc_sync_enter(v2);
    changesPending = v2->_changesPending;
    v2->_changesPending = 0;
    objc_sync_exit(v2);

    var0 = v2->_ucat->var0;
    if (changesPending)
    {
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v8 = v2;
        LogPrintF();
      }
      v5 = MEMORY[0x1E0C809B0];
      xpcCnx = v2->_xpcCnx;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __30__RPPrivateAdvertiser__update__block_invoke;
      v10[3] = &unk_1E5F4ECD0;
      v10[4] = v2;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v10, v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v5;
      v9[1] = 3221225472;
      v9[2] = __30__RPPrivateAdvertiser__update__block_invoke_2;
      v9[3] = &unk_1E5F4ECD0;
      v9[4] = v2;
      objc_msgSend(v7, "xpcPrivateAdvertiserUpdate:completion:", v2, v9);

    }
    else if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

void __30__RPPrivateAdvertiser__update__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = **(_DWORD **)(v4 + 16);
  v9 = v3;
  if (v5 <= 90)
  {
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 32), v6))
    {
      LogPrintF();
      v4 = *(_QWORD *)(a1 + 32);
    }
  }
  v7 = MEMORY[0x1AF45BE48](*(_QWORD *)(v4 + 56));
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);

}

void __30__RPPrivateAdvertiser__update__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = **(_DWORD **)(v4 + 16);
  v9 = v3;
  if (v3)
  {
    if (v5 <= 90)
    {
      if (v5 != -1 || (v6 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 32), v6))
      {
        LogPrintF();
        v4 = *(_QWORD *)(a1 + 32);
      }
    }
    v7 = MEMORY[0x1AF45BE48](*(_QWORD *)(v4 + 56));
    v8 = (void *)v7;
    if (v7)
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);

  }
  else if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (NSString)accessGroup
{
  return self->_accessGroup;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)label
{
  return self->_label;
}

- (NSDictionary)serviceInfo
{
  return self->_serviceInfo;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_serviceInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end
