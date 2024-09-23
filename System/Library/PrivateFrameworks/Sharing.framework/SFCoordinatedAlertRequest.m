@implementation SFCoordinatedAlertRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCoordinatedAlertRequest)init
{
  SFCoordinatedAlertRequest *v2;
  SFCoordinatedAlertRequest *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFCoordinatedAlertRequest;
  v2 = -[SFCoordinatedAlertRequest init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (SFCoordinatedAlertRequest)initWithCoder:(id)a3
{
  id v4;
  SFCoordinatedAlertRequest *v5;
  SFCoordinatedAlertRequest *v6;
  uint64_t v7;
  OS_dispatch_queue *dispatchQueue;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  SFCoordinatedAlertRequest *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SFCoordinatedAlertRequest;
  v5 = -[SFCoordinatedAlertRequest init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    SFMainQueue(v5);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("type")))
    {
      v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
      v6->_type = v9;
      if (v9 >= 7)
      {
        v10 = (void *)MEMORY[0x1E0C99DA0];
        v11 = *MEMORY[0x1E0C99778];
        _NSMethodExceptionProem();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "raise:format:", v11, CFSTR("%@: type (%ld) out-of-range"), v12, v6->_type);

      }
    }
    v13 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;

  type = self->_type;
  if (type)
    objc_msgSend(a3, "encodeInteger:forKey:", type, CFSTR("type"));
}

- (void)dealloc
{
  id completionHandler;
  OS_dispatch_queue *dispatchQueue;
  id invalidationHandler;
  SFCoordinatedAlertRequest *v6;
  SEL v7;
  objc_super v8;

  if (self->_timeoutTimer)
  {
    FatalErrorF();
    goto LABEL_7;
  }
  if (self->_xpcCnx)
  {
LABEL_7:
    v6 = (SFCoordinatedAlertRequest *)FatalErrorF();
    -[SFCoordinatedAlertRequest invalidate](v6, v7);
    return;
  }
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    self->_dispatchQueue = 0;

  }
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  v8.receiver = self;
  v8.super_class = (Class)SFCoordinatedAlertRequest;
  -[SFCoordinatedAlertRequest dealloc](&v8, sel_dealloc);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFCoordinatedAlertRequest_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFCoordinatedAlertRequest_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  OS_dispatch_source *timeoutTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  NSXPCConnection *xpcCnx;
  NSXPCConnection *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_SFCoordinatedAlertRequest <= 30
      && (gLogCategory_SFCoordinatedAlertRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      v4 = timeoutTimer;
      dispatch_source_cancel(v4);
      v5 = self->_timeoutTimer;
      self->_timeoutTimer = 0;

    }
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      -[NSXPCConnection invalidate](xpcCnx, "invalidate");
      v7 = self->_xpcCnx;
      self->_xpcCnx = 0;

    }
    else
    {
      -[SFCoordinatedAlertRequest _invalidated](self, "_invalidated");
    }
  }
}

- (void)start
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SFCoordinatedAlertRequest_start__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__SFCoordinatedAlertRequest_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_start");
}

- (void)_start
{
  double timeout;
  double v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *timeoutTimer;
  NSObject *v7;
  unint64_t v8;
  dispatch_time_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSXPCConnection *xpcCnx;
  void *v14;
  _Unwind_Exception *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  os_activity_scope_state_s state;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFCoordinatedAlertRequest <= 30
    && (gLogCategory_SFCoordinatedAlertRequest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_completionHandler)
  {
    FatalErrorF();
    goto LABEL_15;
  }
  if (self->_started)
  {
LABEL_15:
    FatalErrorF();
    goto LABEL_16;
  }
  self->_started = 1;
  timeout = self->_timeout;
  if (timeout <= 0.0)
  {
    CFPrefs_GetDouble();
    self->_timeout = timeout;
  }
  v4 = 2.0;
  if (timeout <= 0.0 || (v4 = 900.0, timeout > 900.0))
    self->_timeout = v4;
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v5;

  v7 = self->_timeoutTimer;
  if (!v7)
  {
LABEL_16:
    v15 = (_Unwind_Exception *)FatalErrorF();
    os_activity_scope_leave(&state);
    _Unwind_Resume(v15);
  }
  v8 = (unint64_t)(self->_timeout * 1000000000.0);
  v9 = dispatch_time(0, v8);
  dispatch_source_set_timer(v7, v9, v8, v8 >> 2);
  v10 = MEMORY[0x1E0C809B0];
  v11 = self->_timeoutTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __35__SFCoordinatedAlertRequest__start__block_invoke;
  handler[3] = &unk_1E482DF78;
  handler[4] = self;
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  v12 = _os_activity_create(&dword_1A2830000, "Sharing/SFCoordinatedAlertRequest/coordinatedAlertsRequestStart", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  -[SFCoordinatedAlertRequest _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __35__SFCoordinatedAlertRequest__start__block_invoke_2;
  v17[3] = &unk_1E482DFF0;
  v17[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __35__SFCoordinatedAlertRequest__start__block_invoke_3;
  v16[3] = &unk_1E4832180;
  v16[4] = self;
  objc_msgSend(v14, "coordinatedAlertsRequestStart:completion:", self, v16);

  os_activity_scope_leave(&state);
}

uint64_t __35__SFCoordinatedAlertRequest__start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timeoutFired");
}

void __35__SFCoordinatedAlertRequest__start__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (gLogCategory_SFCoordinatedAlertRequest <= 50)
  {
    if (gLogCategory_SFCoordinatedAlertRequest != -1 || (v4 = _LogCategory_Initialize(), v3 = v8, v4))
    {
      LogPrintF();
      v3 = v8;
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, id, uint64_t, _QWORD))(v6 + 16))(v6, v3, 1, 0);
    v5 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v5 + 40);
  }
  else
  {
    v7 = 0;
  }
  *(_QWORD *)(v5 + 40) = 0;

}

void __35__SFCoordinatedAlertRequest__start__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(void);

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void (***)(void))(v2 + 40);
  if (v3)
  {
    v3[2]();
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void (***)(void))(v2 + 40);
  }
  *(_QWORD *)(v2 + 40) = 0;

}

- (void)coordinatedAlertUpdatedWithError:(id)a3 bestIsMe:(BOOL)a4 info:(id)a5
{
  void (**updateHandler)(id, id, BOOL, id);

  updateHandler = (void (**)(id, id, BOOL, id))self->_updateHandler;
  if (updateHandler)
    updateHandler[2](updateHandler, a3, a4, a5);
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
    v9[2] = __46__SFCoordinatedAlertRequest__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E482DF78;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __46__SFCoordinatedAlertRequest__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E482DF78;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBDA8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_SFCoordinatedAlertRequest <= 10
      && (gLogCategory_SFCoordinatedAlertRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __46__SFCoordinatedAlertRequest__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __46__SFCoordinatedAlertRequest__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  void *v3;
  void (**updateHandler)(void);
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFCoordinatedAlertRequest <= 50
    && (gLogCategory_SFCoordinatedAlertRequest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  SFErrorF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  updateHandler = (void (**)(void))self->_updateHandler;
  if (updateHandler)
  {
    v5 = v3;
    updateHandler[2]();
    v3 = v5;
  }

}

- (void)_invalidated
{
  void (**completionHandler)(id, void *, uint64_t, _QWORD);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void (**invalidationHandler)(void);
  void *v12;
  id v13;
  id v14;
  OS_dispatch_source *timeoutTimer;
  NSObject *v16;
  OS_dispatch_source *v17;
  NSXPCConnection *xpcCnx;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFCoordinatedAlertRequest <= 50
      && (gLogCategory_SFCoordinatedAlertRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    completionHandler = (void (**)(id, void *, uint64_t, _QWORD))self->_completionHandler;
    if (completionHandler && self->_started)
    {
      v4 = (void *)MEMORY[0x1E0CB35C8];
      v5 = *MEMORY[0x1E0CB2F90];
      v19 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = CFSTR("?");
      if (v6)
        v8 = (const __CFString *)v6;
      v20[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, -6723, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      completionHandler[2](completionHandler, v10, 1, 0);

    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "coordinatedAlertsRequestCancel");

    v13 = self->_completionHandler;
    self->_completionHandler = 0;

    v14 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      v16 = timeoutTimer;
      dispatch_source_cancel(v16);
      v17 = self->_timeoutTimer;
      self->_timeoutTimer = 0;

    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_SFCoordinatedAlertRequest <= 10
      && (gLogCategory_SFCoordinatedAlertRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_timeoutFired
{
  NSObject *v3;
  OS_dispatch_source *timeoutTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  void *v7;
  os_activity_scope_state_s v8;

  v3 = _os_activity_create(&dword_1A2830000, "Sharing/SFCoordinatedAlertRequest/coordinatedAlertsRequestFinish", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v3, &v8);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v5 = timeoutTimer;
    dispatch_source_cancel(v5);
    v6 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coordinatedAlertsRequestFinish");

  os_activity_scope_leave(&v8);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (BOOL)bestIsMe
{
  return self->_bestIsMe;
}

- (void)setBestIsMe:(BOOL)a3
{
  self->_bestIsMe = a3;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end
