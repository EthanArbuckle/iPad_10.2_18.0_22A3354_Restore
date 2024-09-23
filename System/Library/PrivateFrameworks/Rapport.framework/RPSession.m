@implementation RPSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPSession)init
{
  RPSession *v2;
  RPSession *v3;
  RPSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPSession;
  v2 = -[RPSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_RPSession;
    v4 = v3;
  }

  return v3;
}

- (RPSession)initWithCoder:(id)a3
{
  id v4;
  RPSession *v5;
  RPSession *v6;
  id v7;
  NSString *label;
  NSString *v9;
  id v10;
  RPSession *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RPSession;
  v5 = -[RPSession init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPSession;
    v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    label = v6->_label;
    if (label)
    {
      v9 = objc_retainAutorelease(label);
      -[NSString UTF8String](v9, "UTF8String");
      LogCategoryReplaceF();

    }
    v10 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v11 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *label;
  NSString *serviceType;
  id v7;

  v4 = a3;
  label = self->_label;
  v7 = v4;
  if (label)
  {
    objc_msgSend(v4, "encodeObject:forKey:", label, CFSTR("label"));
    v4 = v7;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    objc_msgSend(v7, "encodeObject:forKey:", serviceType, CFSTR("st"));
    v4 = v7;
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
  v4.super_class = (Class)RPSession;
  -[RPSession dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return -[RPSession descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  void *v5;
  NSString *peerID;
  id v7;
  NSString *v9;
  void *v10;

  NSAppendPrintF();
  v4 = 0;
  v5 = v4;
  peerID = self->_peerID;
  if (peerID)
  {
    v10 = v4;
    v9 = peerID;
    NSAppendPrintF();
    v7 = v10;

    v5 = v7;
  }
  return v5;
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
  RPSession *v5;
  BOOL activateCalled;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  activateCalled = v5->_activateCalled;
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__RPSession_activateWithCompletion___block_invoke;
  block[3] = &unk_1E5F4EEB0;
  block[4] = v5;
  v10 = v4;
  v11 = activateCalled;
  v8 = v4;
  dispatch_async(dispatchQueue, block);

  objc_sync_exit(v5);
}

void __36__RPSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 9))
  {
    RPErrorF();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 16);
    v9 = v3;
    if (v4 <= 115)
    {
      if (v4 != -1 || (v6 = _LogCategory_Initialize(), v3 = v9, v6))
      {
        LogPrintF();
        v3 = v9;
      }
    }
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
      v3 = v9;
    }

  }
  else if (*(_BYTE *)(a1 + 48))
  {
    v5 = **(_DWORD **)(v2 + 16);
    if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }
  else
  {
    objc_msgSend((id)v2, "_activateWithCompletion:reactivate:", *(_QWORD *)(a1 + 40), 0);
  }
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int var0;
  NSXPCConnection *xpcCnx;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;

  v4 = a4;
  v6 = a3;
  var0 = self->_ucat->var0;
  if (v4)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF();
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  -[RPSession _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __48__RPSession__activateWithCompletion_reactivate___block_invoke;
  v16[3] = &unk_1E5F4F478;
  v18 = v4;
  v16[4] = self;
  v10 = v6;
  v17 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __48__RPSession__activateWithCompletion_reactivate___block_invoke_2;
  v13[3] = &unk_1E5F4F478;
  v15 = v4;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "xpcSessionActivate:completion:", self, v13);

}

void __48__RPSession__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 16);
  if (*(_BYTE *)(a1 + 48))
  {
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF();
  }
  else if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

}

void __48__RPSession__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
LABEL_15:
        LogPrintF();
    }
    else if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_15;
    }
  }
  else if (*(_BYTE *)(a1 + 48))
  {
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
      goto LABEL_15;
  }
  else if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_15;
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

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
    v10[2] = __30__RPSession__ensureXPCStarted__block_invoke;
    v10[3] = &unk_1E5F4EC60;
    v10[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v10);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __30__RPSession__ensureXPCStarted__block_invoke_2;
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

uint64_t __30__RPSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __30__RPSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
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
    -[RPSession _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0, 1);
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
  block[2] = __23__RPSession_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __23__RPSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    v2 = result;
    *(_BYTE *)(v1 + 9) = 1;
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
  id interruptionHandler;
  id v5;
  RPConnection *cnx;
  int var0;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    cnx = self->_cnx;
    self->_cnx = 0;

    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  if (a6)
    (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  if (a7)
    (*((void (**)(id, _QWORD))a7 + 2))(a7, 0);
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  -[RPSession sendRequestID:request:destinationID:options:responseHandler:](self, "sendRequestID:request:destinationID:options:responseHandler:", a3, a4, CFSTR("rapport:rdid:DirectPeer"), a5, a6);
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))a7 + 2))(a7, MEMORY[0x1E0C9AA70], 0, 0);
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

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(int)a3
{
  self->_passwordType = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)showPasswordHandler
{
  return self->_showPasswordHandler;
}

- (void)setShowPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)hidePasswordHandler
{
  return self->_hidePasswordHandler;
}

- (void)setHidePasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)promptForPasswordHandler
{
  return self->_promptForPasswordHandler;
}

- (void)setPromptForPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSData)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_controlFlags = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)label
{
  return self->_label;
}

- (RPEndpoint)peerEndpoint
{
  return self->_peerEndpoint;
}

- (void)setPeerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_peerEndpoint, a3);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (RPConnection)cnx
{
  return self->_cnx;
}

- (void)setCnx:(id)a3
{
  objc_storeStrong((id *)&self->_cnx, a3);
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (unint64_t)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unint64_t)a3
{
  self->_sessionID = a3;
}

- (unint64_t)startTicks
{
  return self->_startTicks;
}

- (void)setStartTicks:(unint64_t)a3
{
  self->_startTicks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_cnx, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_peerEndpoint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
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
