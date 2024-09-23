@implementation RPNearbyInvitationServer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNearbyInvitationServer)init
{
  RPNearbyInvitationServer *v2;
  RPNearbyInvitationServer *v3;
  RPNearbyInvitationServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPNearbyInvitationServer;
  v2 = -[RPNearbyInvitationServer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
}

- (RPNearbyInvitationServer)initWithCoder:(id)a3
{
  id v4;
  RPNearbyInvitationServer *v5;
  RPNearbyInvitationServer *v6;
  id v7;
  RPNearbyInvitationServer *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPNearbyInvitationServer;
  v5 = -[RPNearbyInvitationServer init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *serviceType;

  serviceType = self->_serviceType;
  if (serviceType)
    objc_msgSend(a3, "encodeObject:forKey:", serviceType, CFSTR("srvTy"));
}

- (id)description
{
  id v3;
  void *v4;
  NSString *serviceType;
  id v6;
  NSString *v8;
  void *v9;

  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  serviceType = self->_serviceType;
  if (serviceType)
  {
    v9 = v3;
    v8 = serviceType;
    NSAppendPrintF();
    v6 = v9;

    v4 = v6;
  }
  return v4;
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
  v7[2] = __51__RPNearbyInvitationServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __51__RPNearbyInvitationServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:reactivate:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSXPCConnection *xpcCnx;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    if (gLogCategory_RPNearbyInvitationServer <= 30
      && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPNearbyInvitationServer <= 30
         && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  -[RPNearbyInvitationServer _ensureXPCStarted](self, "_ensureXPCStarted");
  v7 = MEMORY[0x1E0C809B0];
  xpcCnx = self->_xpcCnx;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__RPNearbyInvitationServer__activateWithCompletion_reactivate___block_invoke;
  v15[3] = &unk_1E5F4EED8;
  v17 = v4;
  v9 = v6;
  v16 = v9;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __63__RPNearbyInvitationServer__activateWithCompletion_reactivate___block_invoke_2;
  v12[3] = &unk_1E5F4EED8;
  v14 = v4;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "nearbyInvitationActivateServer:completion:", self, v12);

}

void __63__RPNearbyInvitationServer__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_RPNearbyInvitationServer <= 90)
    {
      if (gLogCategory_RPNearbyInvitationServer != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        v3 = v7;
      }
    }
  }
  else if (gLogCategory_RPNearbyInvitationServer <= 90)
  {
    if (gLogCategory_RPNearbyInvitationServer != -1)
      goto LABEL_7;
    v5 = _LogCategory_Initialize();
    v3 = v7;
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

void __63__RPNearbyInvitationServer__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (gLogCategory_RPNearbyInvitationServer <= 90)
      {
        if (gLogCategory_RPNearbyInvitationServer != -1 || (v5 = _LogCategory_Initialize(), v3 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          v3 = v9;
        }
      }
    }
    else if (gLogCategory_RPNearbyInvitationServer <= 90)
    {
      if (gLogCategory_RPNearbyInvitationServer != -1)
        goto LABEL_15;
      v7 = _LogCategory_Initialize();
      v3 = v9;
      if (v7)
        goto LABEL_15;
    }
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_RPNearbyInvitationServer <= 30)
    {
      if (gLogCategory_RPNearbyInvitationServer != -1)
        goto LABEL_15;
      v6 = _LogCategory_Initialize();
      v3 = 0;
      if (v6)
        goto LABEL_15;
    }
  }
  else if (gLogCategory_RPNearbyInvitationServer <= 30)
  {
    if (gLogCategory_RPNearbyInvitationServer != -1)
      goto LABEL_15;
    v8 = _LogCategory_Initialize();
    v3 = 0;
    if (v8)
      goto LABEL_15;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v9);
    v3 = v9;
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

  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.rapport.NearbyInvitation"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE40F98);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__RPNearbyInvitationServer__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E5F4EC60;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __45__RPNearbyInvitationServer__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E5F4EC60;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4AB18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPNearbyInvitationServer <= 10
      && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __45__RPNearbyInvitationServer__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __45__RPNearbyInvitationServer__ensureXPCStarted__block_invoke_2(uint64_t a1)
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
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPNearbyInvitationServer <= 50
    && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_activateCalled)
    -[RPNearbyInvitationServer _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0, 1);
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
  block[2] = __38__RPNearbyInvitationServer_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__RPNearbyInvitationServer_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    v2 = result;
    *(_BYTE *)(v1 + 9) = 1;
    if (gLogCategory_RPNearbyInvitationServer <= 30
      && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 16), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_0);
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 24), "invalidate");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

uint64_t __38__RPNearbyInvitationServer_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  id interruptionHandler;
  id v5;
  id sessionStartHandler;
  id sessionEndedHandler;

  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableDictionary count](self->_sessions, "count")
    && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    sessionStartHandler = self->_sessionStartHandler;
    self->_sessionStartHandler = 0;

    sessionEndedHandler = self->_sessionEndedHandler;
    self->_sessionEndedHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPNearbyInvitationServer <= 30
      && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)nearbyInvitationStartServerSessionID:(id)a3 device:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *);
  NSObject *dispatchQueue;
  id v10;
  RPNearbyInvitationSession *v11;
  NSMutableDictionary *sessions;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = (void (**)(id, void *))a5;
  dispatchQueue = self->_dispatchQueue;
  v10 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  v11 = objc_alloc_init(RPNearbyInvitationSession);
  -[RPNearbyInvitationSession setDestinationDevice:](v11, "setDestinationDevice:", v10);

  -[RPNearbyInvitationSession setDispatchQueue:](v11, "setDispatchQueue:", self->_dispatchQueue);
  -[RPNearbyInvitationSession setServer:](v11, "setServer:", self);
  -[RPNearbyInvitationSession setSessionID:](v11, "setSessionID:", v18);
  -[RPNearbyInvitationSession setXpcCnx:](v11, "setXpcCnx:", self->_xpcCnx);
  sessions = self->_sessions;
  if (!sessions)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = self->_sessions;
    self->_sessions = v13;

    sessions = self->_sessions;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](sessions, "setObject:forKeyedSubscript:", v11, v18);
  v15 = MEMORY[0x1AF45BE48](self->_sessionStartHandler);
  v16 = (void *)v15;
  if (v15)
  {
    (*(void (**)(uint64_t, RPNearbyInvitationSession *, void (**)(id, void *)))(v15 + 16))(v15, v11, v8);
  }
  else
  {
    RPErrorF();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v17);

  }
}

- (void)nearbyInvitationSessionEndedWithID:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = MEMORY[0x1AF45BE48](self->_sessionEndedHandler);
    v6 = (void *)v5;
    if (v5)
      (*(void (**)(uint64_t, void *, _QWORD))(v5 + 16))(v5, v4, 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessions, "setObject:forKeyedSubscript:", 0, v7);

  }
}

- (void)nearbyInvitationReceivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      objc_msgSend(v13, "nearbyInvitationReceivedEventID:event:options:sessionID:", v15, v10, v11, v12);

  }
  else if (gLogCategory_RPNearbyInvitationServer <= 90
         && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)nearbyInvitationReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v15)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "nearbyInvitationReceivedRequestID:request:options:responseHandler:sessionID:", v18, v12, v13, v14, v15);

  }
  else if (gLogCategory_RPNearbyInvitationServer <= 90
         && (gLogCategory_RPNearbyInvitationServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)nearbyInvitationSessionError:(id)a3 withID:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "nearbyInvitationSessionError:", v8);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)sessionStartHandler
{
  return self->_sessionStartHandler;
}

- (void)setSessionStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)sessionEndedHandler
{
  return self->_sessionEndedHandler;
}

- (void)setSessionEndedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sessionEndedHandler, 0);
  objc_storeStrong(&self->_sessionStartHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end
