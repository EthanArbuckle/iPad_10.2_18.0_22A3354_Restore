@implementation RPServer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPServer)init
{
  RPServer *v2;
  RPServer *v3;
  RPServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPServer;
  v2 = -[RPServer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_RPServer;
    v4 = v3;
  }

  return v3;
}

- (RPServer)initWithCoder:(id)a3
{
  id v4;
  RPServer *v5;
  RPServer *v6;
  id v7;
  id v8;
  id v9;
  NSString *label;
  NSString *v11;
  id v12;
  RPServer *v13;
  objc_super v15;
  uint64_t v16;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RPServer;
  v5 = -[RPServer init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPServer;
    v7 = v4;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("devName")))
      v6->_advertiseDeviceName = objc_msgSend(v7, "decodeBoolForKey:", CFSTR("devName"));

    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v8 = v7;
    if (objc_msgSend(v8, "containsValueForKey:", CFSTR("cFl")))
      v6->_controlFlags = objc_msgSend(v8, "decodeInt64ForKey:", CFSTR("cFl"));

    v16 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_internalAuthFlags = v16;
    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    label = v6->_label;
    if (label)
    {
      v11 = objc_retainAutorelease(label);
      -[NSString UTF8String](v11, "UTF8String");
      LogCategoryReplaceF();

    }
    objc_opt_class();
    NSDecodeNSArrayOfClassIfPresent();
    v16 = 0;
    if ((NSDecodeSInt64RangedIfPresent() & 1) != 0)
      v6->_passwordType = v16;
    v12 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v13 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSArray *allowedMACAddresses;
  unint64_t controlFlags;
  uint64_t internalAuthFlags;
  NSString *label;
  NSArray *pairSetupACL;
  uint64_t passwordType;
  NSString *serviceType;
  id v12;

  v4 = a3;
  allowedMACAddresses = self->_allowedMACAddresses;
  v12 = v4;
  if (allowedMACAddresses)
  {
    objc_msgSend(v4, "encodeObject:forKey:", allowedMACAddresses, CFSTR("MAcAddrs"));
    v4 = v12;
  }
  if (self->_advertiseDeviceName)
  {
    objc_msgSend(v12, "encodeBool:forKey:", 1, CFSTR("devName"));
    v4 = v12;
  }
  controlFlags = self->_controlFlags;
  if (controlFlags)
  {
    objc_msgSend(v12, "encodeInt64:forKey:", controlFlags, CFSTR("cFl"));
    v4 = v12;
  }
  internalAuthFlags = self->_internalAuthFlags;
  if ((_DWORD)internalAuthFlags)
  {
    objc_msgSend(v12, "encodeInt64:forKey:", internalAuthFlags, CFSTR("iaf"));
    v4 = v12;
  }
  label = self->_label;
  if (label)
  {
    objc_msgSend(v12, "encodeObject:forKey:", label, CFSTR("label"));
    v4 = v12;
  }
  pairSetupACL = self->_pairSetupACL;
  if (pairSetupACL)
  {
    objc_msgSend(v12, "encodeObject:forKey:", pairSetupACL, CFSTR("acl"));
    v4 = v12;
  }
  passwordType = self->_passwordType;
  if ((_DWORD)passwordType)
  {
    objc_msgSend(v12, "encodeInteger:forKey:", passwordType, CFSTR("pwTy"));
    v4 = v12;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    objc_msgSend(v12, "encodeObject:forKey:", serviceType, CFSTR("st"));
    v4 = v12;
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
  v4.super_class = (Class)RPServer;
  -[RPServer dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[RPServer descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  void *v5;
  NSArray *allowedMACAddresses;
  NSArray *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSArray *pairSetupACL;
  id v13;
  NSString *serviceType;
  NSArray *v16;
  void *v17;

  serviceType = self->_serviceType;
  NSAppendPrintF();
  v4 = 0;
  v5 = v4;
  allowedMACAddresses = self->_allowedMACAddresses;
  if (allowedMACAddresses)
  {
    v17 = v4;
    v7 = allowedMACAddresses;
    -[NSArray count](v7, "count", serviceType);
    NSAppendPrintF();
    v8 = v17;

    v5 = v8;
  }
  if (self->_advertiseDeviceName)
  {
    NSAppendPrintF();
    v9 = v5;

    v5 = v9;
  }
  if (self->_controlFlags)
  {
    NSAppendPrintF();
    v10 = v5;

    v5 = v10;
  }
  if (self->_passwordType)
  {
    NSAppendPrintF();
    v11 = v5;

    v5 = v11;
  }
  pairSetupACL = self->_pairSetupACL;
  if (pairSetupACL)
  {
    v16 = pairSetupACL;
    NSAppendPrintF();
    v13 = v5;

    v5 = v13;
  }
  return v5;
}

- (void)setControlFlags:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__RPServer_setControlFlags___block_invoke;
  v3[3] = &unk_1E5F50C88;
  v3[4] = self;
  v3[5] = a3;
  -[RPServer _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __28__RPServer_setControlFlags___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 128);
  if (v1 != v3)
    *(_QWORD *)(v2 + 128) = v1;
  return v1 != v3;
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

}

- (void)setPassword:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  RPServer *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__RPServer_setPassword___block_invoke;
  v6[3] = &unk_1E5F50AA0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[RPServer _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __24__RPServer_setPassword___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

LABEL_8:
    return v5;
  }
  v6 = v4;
  if ((v3 == 0) == (v4 != 0))
  {

    goto LABEL_7;
  }
  v7 = objc_msgSend(v3, "isEqual:", v4);

  if ((v7 & 1) == 0)
  {
LABEL_7:
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = v8;
    v3 = *(id *)(v9 + 72);
    *(_QWORD *)(v9 + 72) = v10;
    goto LABEL_8;
  }
  return 0;
}

- (void)setServiceType:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  RPServer *v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__RPServer_setServiceType___block_invoke;
  v6[3] = &unk_1E5F50AA0;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[RPServer _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v6);

}

BOOL __27__RPServer_setServiceType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  id v10;

  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 176);
  v3 = *(id *)(a1 + 32);
  v4 = v2;
  v5 = v3 != v4;
  if (v3 == v4)
  {

LABEL_8:
    return v5;
  }
  v6 = v4;
  if ((v3 == 0) == (v4 != 0))
  {

    goto LABEL_7;
  }
  v7 = objc_msgSend(v3, "isEqual:", v4);

  if ((v7 & 1) == 0)
  {
LABEL_7:
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = v8;
    v3 = *(id *)(v9 + 176);
    *(_QWORD *)(v9 + 176) = v10;
    goto LABEL_8;
  }
  return 0;
}

- (void)setPasswordType:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__RPServer_setPasswordType___block_invoke;
  v3[3] = &unk_1E5F50150;
  v4 = a3;
  v3[4] = self;
  -[RPServer _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

BOOL __28__RPServer_setPasswordType___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 44);
  if (v1 != v3)
    *(_DWORD *)(v2 + 44) = v1;
  return v1 != v3;
}

- (void)activate
{
  RPServer *v2;
  BOOL activateCalled;
  NSObject *dispatchQueue;
  _QWORD v5[5];
  BOOL v6;

  v2 = self;
  objc_sync_enter(v2);
  activateCalled = v2->_activateCalled;
  v2->_activateCalled = 1;
  dispatchQueue = v2->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__RPServer_activate__block_invoke;
  v5[3] = &unk_1E5F50CB0;
  v5[4] = v2;
  v6 = activateCalled;
  dispatch_async(dispatchQueue, v5);
  objc_sync_exit(v2);

}

int *__20__RPServer_activate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int *result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 10))
  {
    result = *(int **)(v2 + 16);
    if (*result > 115)
      return result;
    if (*result == -1)
    {
      result = (int *)_LogCategory_Initialize();
      if (!(_DWORD)result)
        return result;
    }
    return (int *)LogPrintF();
  }
  if (*(_BYTE *)(a1 + 40))
  {
    result = *(int **)(v2 + 16);
    if (*result > 30)
      return result;
    if (*result == -1)
    {
      result = (int *)_LogCategory_Initialize();
      if (!(_DWORD)result)
        return result;
    }
    return (int *)LogPrintF();
  }
  if (*(_QWORD *)(v2 + 80))
  {
    *(_DWORD *)(v2 + 52) |= 8u;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 88))
  {
    *(_DWORD *)(v2 + 52) |= 1u;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 96))
  {
    *(_DWORD *)(v2 + 52) |= 2u;
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v2 + 104))
  {
    *(_DWORD *)(v2 + 52) |= 4u;
    v2 = *(_QWORD *)(a1 + 32);
  }
  return (int *)objc_msgSend((id)v2, "_activateWithReactivate:", 0);
}

- (void)_activateWithReactivate:(BOOL)a3
{
  int var0;
  NSXPCConnection *xpcCnx;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  _QWORD v11[5];
  BOOL v12;

  var0 = self->_ucat->var0;
  if (a3)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF();
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  -[RPServer _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__RPServer__activateWithReactivate___block_invoke;
  v11[3] = &unk_1E5F50AC8;
  v12 = a3;
  v11[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __36__RPServer__activateWithReactivate___block_invoke_2;
  v9[3] = &unk_1E5F50AC8;
  v10 = a3;
  v9[4] = self;
  objc_msgSend(v8, "xpcServerActivate:completion:", self, v9);

}

void __36__RPServer__activateWithReactivate___block_invoke(uint64_t a1, void *a2)
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
  v4 = MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

}

void __36__RPServer__activateWithReactivate___block_invoke_2(uint64_t a1, void *a2)
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
  v5 = MEMORY[0x1AF45BE48](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144));
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
  int var0;
  _QWORD v9[5];
  _QWORD v10[5];

  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.CompanionLink"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE3CEE8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __29__RPServer__ensureXPCStarted__block_invoke;
    v10[3] = &unk_1E5F4EC60;
    v10[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v10);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __29__RPServer__ensureXPCStarted__block_invoke_2;
    v9[3] = &unk_1E5F4EC60;
    v9[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v9);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4ABD8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

uint64_t __29__RPServer__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __29__RPServer__ensureXPCStarted__block_invoke_2(uint64_t a1)
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
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (self->_activateCalled)
    -[RPServer _activateWithReactivate:](self, "_activateWithReactivate:", 1);
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__RPServer_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __22__RPServer_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 10))
  {
    v2 = result;
    *(_BYTE *)(v1 + 10) = 1;
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
    objc_msgSend(*(id *)(v3 + 24), "invalidate");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id acceptHandler;
  id errorHandler;
  id interruptionHandler;
  id v7;
  id showPasswordHandler;
  id hidePasswordHandler;
  id promptForPasswordHandler;
  int var0;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    acceptHandler = self->_acceptHandler;
    self->_acceptHandler = 0;

    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v7 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    showPasswordHandler = self->_showPasswordHandler;
    self->_showPasswordHandler = 0;

    hidePasswordHandler = self->_hidePasswordHandler;
    self->_hidePasswordHandler = 0;

    promptForPasswordHandler = self->_promptForPasswordHandler;
    self->_promptForPasswordHandler = 0;

    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  RPServer *v5;
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
    block[2] = __37__RPServer__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E5F4EC60;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

uint64_t __37__RPServer__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

- (void)_update
{
  RPServer *v2;
  _BOOL4 changesPending;
  int var0;
  RPServer *v5;
  id v6;

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
        v5 = v2;
        LogPrintF();
      }
      -[NSXPCConnection remoteObjectProxy](v2->_xpcCnx, "remoteObjectProxy", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "xpcServerUpdate:", v2);

    }
    else if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)xpcServerAcceptSession:(id)a3 completion:(id)a4
{
  id v6;
  int var0;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v8 = MEMORY[0x1AF45BE48](self->_acceptHandler);
  v9 = (void *)v8;
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v10, v6);

}

- (void)xpcServerShowPassword:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  int var0;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v7 = MEMORY[0x1AF45BE48](self->_showPasswordHandler);
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v4, v9);

}

- (void)xpcServerHidePassword:(unsigned int)a3
{
  uint64_t v3;
  int var0;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1AF45BE48](self->_hidePasswordHandler);
  if (v6)
  {
    v7 = v6;
    v6[2](v6, v3);
    v6 = (void (**)(_QWORD, _QWORD))v7;
  }

}

- (NSArray)allowedMACAddresses
{
  return self->_allowedMACAddresses;
}

- (void)setAllowedMACAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_allowedMACAddresses, a3);
}

- (NSArray)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
  objc_storeStrong((id *)&self->_pairSetupACL, a3);
}

- (unsigned)pairSetupFlags
{
  return self->_pairSetupFlags;
}

- (void)setPairSetupFlags:(unsigned int)a3
{
  self->_pairSetupFlags = a3;
}

- (unsigned)pairVerifyFlags
{
  return self->_pairVerifyFlags;
}

- (void)setPairVerifyFlags:(unsigned int)a3
{
  self->_pairVerifyFlags = a3;
}

- (NSString)password
{
  return self->_password;
}

- (int)passwordType
{
  return self->_passwordType;
}

- (int)passwordTypeActual
{
  return self->_passwordTypeActual;
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)showPasswordHandler
{
  return self->_showPasswordHandler;
}

- (void)setShowPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)hidePasswordHandler
{
  return self->_hidePasswordHandler;
}

- (void)setHidePasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)promptForPasswordHandler
{
  return self->_promptForPasswordHandler;
}

- (void)setPromptForPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSData)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)acceptHandler
{
  return self->_acceptHandler;
}

- (void)setAcceptHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)advertiseDeviceName
{
  return self->_advertiseDeviceName;
}

- (void)setAdvertiseDeviceName:(BOOL)a3
{
  self->_advertiseDeviceName = a3;
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)label
{
  return self->_label;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (unsigned)internalAuthFlags
{
  return self->_internalAuthFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_acceptHandler, 0);
  objc_storeStrong((id *)&self->_pairingInfo, 0);
  objc_storeStrong(&self->_promptForPasswordHandler, 0);
  objc_storeStrong(&self->_hidePasswordHandler, 0);
  objc_storeStrong(&self->_showPasswordHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairSetupACL, 0);
  objc_storeStrong((id *)&self->_allowedMACAddresses, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end
