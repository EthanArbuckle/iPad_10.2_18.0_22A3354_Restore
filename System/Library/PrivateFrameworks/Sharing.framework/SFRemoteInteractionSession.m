@implementation SFRemoteInteractionSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRemoteInteractionSession)init
{
  SFRemoteInteractionSession *v2;
  SFRemoteInteractionSession *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFRemoteInteractionSession;
  v2 = -[SFRemoteInteractionSession init](&v7, sel_init);
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

- (SFRemoteInteractionSession)initWithCoder:(id)a3
{
  id v4;
  SFRemoteInteractionSession *v5;
  SFRemoteInteractionSession *v6;
  uint64_t v7;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v9;
  SFDevice *peerDevice;
  SFRemoteInteractionSession *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFRemoteInteractionSession;
  v5 = -[SFRemoteInteractionSession init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    SFMainQueue(v5);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("peerDevice")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("peerDevice"));
      v9 = objc_claimAutoreleasedReturnValue();
      peerDevice = v6->_peerDevice;
      v6->_peerDevice = (SFDevice *)v9;

    }
    v11 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  SFDevice *peerDevice;

  peerDevice = self->_peerDevice;
  if (peerDevice)
    objc_msgSend(a3, "encodeObject:forKey:", peerDevice, CFSTR("peerDevice"));
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  void *v7;

  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  if (self->_invalidateCalled)
  {
    v7 = v3;
    NSAppendPrintF();
    v5 = v7;

    v4 = v5;
  }
  return v4;
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *dispatchQueue;
  SFRemoteInteractionSession *obj;

  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  SFRemoteInteractionSession *v5;
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
  v8[2] = __53__SFRemoteInteractionSession_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __53__SFRemoteInteractionSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  SFSession *v5;
  SFSession *remoteSession;
  uint64_t v7;
  SFSession *v8;
  NSObject *v9;
  NSXPCConnection *xpcCnx;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  os_activity_scope_state_s state;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteInteractionSession <= 30
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_invalidateCalled)
  {
    v13 = 4294960572;
  }
  else
  {
    if (self->_peerDevice)
    {
      if (self->_agent)
      {
        v5 = objc_alloc_init(SFSession);
        remoteSession = self->_remoteSession;
        self->_remoteSession = v5;

        -[SFSession setDispatchQueue:](self->_remoteSession, "setDispatchQueue:", self->_dispatchQueue);
        -[SFSession setPeerDevice:](self->_remoteSession, "setPeerDevice:", self->_peerDevice);
        -[SFSession setServiceIdentifier:](self->_remoteSession, "setServiceIdentifier:", CFSTR("com.apple.sharing.Control"));
        v7 = MEMORY[0x1E0C809B0];
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke;
        v28[3] = &unk_1E4833AE0;
        v28[4] = self;
        -[SFSession setEventMessageHandler:](self->_remoteSession, "setEventMessageHandler:", v28);
        v27[0] = v7;
        v27[1] = 3221225472;
        v27[2] = __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_2;
        v27[3] = &unk_1E482DF78;
        v27[4] = self;
        -[SFSession setInvalidationHandler:](self->_remoteSession, "setInvalidationHandler:", v27);
        v26[0] = v7;
        v26[1] = 3221225472;
        v26[2] = __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_3;
        v26[3] = &unk_1E4830000;
        v26[4] = self;
        -[SFSession setReceivedObjectHandler:](self->_remoteSession, "setReceivedObjectHandler:", v26);
        v8 = self->_remoteSession;
        v24[0] = v7;
        v24[1] = 3221225472;
        v24[2] = __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_4;
        v24[3] = &unk_1E482EE00;
        v24[4] = self;
        v25 = v4;
        -[SFSession activateWithCompletion:](v8, "activateWithCompletion:", v24);

      }
      else
      {
        v9 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteInteractionSession/remoteInteractionSessionActivate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        os_activity_scope_enter(v9, &state);
        -[SFRemoteInteractionSession _ensureXPCStarted](self, "_ensureXPCStarted");
        xpcCnx = self->_xpcCnx;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_5;
        v21[3] = &unk_1E482E490;
        v11 = v4;
        v22 = v11;
        -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "remoteInteractionSessionActivate:completion:", self, v11);

        os_activity_scope_leave(&state);
      }
      goto LABEL_10;
    }
    v13 = 4294960551;
  }
  if (gLogCategory_SFRemoteInteractionSession <= 60
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    v20 = v13;
    LogPrintF();
  }
  if (v4)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = CFSTR("?");
    if (v15)
      v17 = (const __CFString *)v15;
    v30[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], (int)v13, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v19);

  }
LABEL_10:

}

uint64_t __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sessionHandleEvent:", a2);
}

uint64_t __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)v7;
  if (v7)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    if (v6)
    {
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
      v5 = (void *)v7;
    }
  }

}

void __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sessionStart");
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

uint64_t __54__SFRemoteInteractionSession__activateWithCompletion___block_invoke_5(uint64_t a1)
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
  block[2] = __40__SFRemoteInteractionSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__SFRemoteInteractionSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  SFSession *remoteSession;
  void *v4;
  NSXPCConnection *xpcCnx;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_SFRemoteInteractionSession <= 30
      && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    remoteSession = self->_remoteSession;
    if (remoteSession)
    {
      -[SFSession invalidate](remoteSession, "invalidate");
      v4 = self->_remoteSession;
      self->_remoteSession = 0;
LABEL_11:

      return;
    }
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      -[NSXPCConnection invalidate](xpcCnx, "invalidate");
      v4 = self->_xpcCnx;
      self->_xpcCnx = 0;
      goto LABEL_11;
    }
    -[SFRemoteInteractionSession _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  id interruptionHandler;
  id v5;
  id textSessionDidBegin;
  id textSessionDidEnd;
  id textSessionDidChange;
  NSXPCConnection *xpcCnx;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFRemoteInteractionSession <= 50
      && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
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

    textSessionDidBegin = self->_textSessionDidBegin;
    self->_textSessionDidBegin = 0;

    textSessionDidEnd = self->_textSessionDidEnd;
    self->_textSessionDidEnd = 0;

    textSessionDidChange = self->_textSessionDidChange;
    self->_textSessionDidChange = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_SFRemoteInteractionSession <= 10
      && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)sendPayload:(id)a3
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
  v7[2] = __42__SFRemoteInteractionSession_sendPayload___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __42__SFRemoteInteractionSession_sendPayload___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v5;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2])
  {
    objc_msgSend(v2, "_sessionSendPayload:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v3 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteInteractionSession/remoteInteractionSessionSendPayload", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v5.opaque[0] = 0;
    v5.opaque[1] = 0;
    os_activity_scope_enter(v3, &v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteInteractionSessionSendPayload:", *(_QWORD *)(a1 + 40));

    os_activity_scope_leave(&v5);
  }
}

- (void)_sessionStart
{
  void *v3;
  SFEventMessage *v4;

  v4 = objc_alloc_init(SFEventMessage);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMessage setIdentifier:](v4, "setIdentifier:", v3);

  -[SFMessage setHeaderFields:](v4, "setHeaderFields:", &unk_1E4891660);
  -[SFMessage setPeerDevice:](v4, "setPeerDevice:", self->_peerDevice);
  -[SFSession sendEvent:](self->_remoteSession, "sendEvent:", v4);

}

- (void)_sessionSendPayload:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  int v10;
  void *v11;
  SFEventMessage *v12;
  void *v13;
  uint64_t v14;
  id v15;
  unsigned __int8 v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0;
  if (!v4)
  {
    if (gLogCategory_SFRemoteInteractionSession > 60
      || gLogCategory_SFRemoteInteractionSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
LABEL_22:
    LogPrintF();
    goto LABEL_14;
  }
  SFRTIDataPayloadForData(v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (gLogCategory_SFRemoteInteractionSession > 60
      || gLogCategory_SFRemoteInteractionSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("rp"));
  v15 = 0;
  SFRemoteTextInputPayloadToLegacyAPI(v7, (char *)&v16, &v15);
  v8 = v15;
  v9 = v16;
  if (v16)
  {
    if (gLogCategory_SFRemoteInteractionSession <= 30)
    {
      if (gLogCategory_SFRemoteInteractionSession != -1 || (v10 = _LogCategory_Initialize(), v9 = v16, v10))
      {
        v14 = v9;
        LogPrintF();
        v9 = v16;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v9, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("o"));

    if (v8)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("t"));
  }
  else if (gLogCategory_SFRemoteInteractionSession <= 60
         && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v12 = objc_alloc_init(SFEventMessage);
  -[SFMessage setHeaderFields:](v12, "setHeaderFields:", v5);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMessage setIdentifier:](v12, "setIdentifier:", v13);

  -[SFMessage setPeerDevice:](v12, "setPeerDevice:", self->_peerDevice);
  -[SFSession sendEvent:](self->_remoteSession, "sendEvent:", v12);

LABEL_14:
}

- (void)_sessionHandleEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 Int64Ranged;
  void *v9;
  void *v10;
  SFRemoteTextSessionInfo *v11;
  SFRemoteTextSessionInfo *v12;
  void *v13;
  void (**remoteTextEventHandler)(id, void *);
  void *v15;
  void *v16;
  void (**textSessionDidChange)(id, SFRemoteTextSessionInfo *);
  void (**textSessionDidEnd)(id, SFRemoteTextSessionInfo *);

  v4 = a3;
  objc_msgSend(v4, "headerFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (gLogCategory_SFRemoteInteractionSession <= 30
      && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    remoteTextEventHandler = (void (**)(id, void *))self->_remoteTextEventHandler;
    if (remoteTextEventHandler)
      remoteTextEventHandler[2](remoteTextEventHandler, v6);
    goto LABEL_25;
  }
  objc_msgSend(v4, "headerFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Int64Ranged = CFDictionaryGetInt64Ranged();

  if (Int64Ranged > 9u)
    goto LABEL_66;
  if (((1 << Int64Ranged) & 0x23C) != 0)
  {
    if (gLogCategory_SFRemoteInteractionSession > 60
      || gLogCategory_SFRemoteInteractionSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_25;
    }
    goto LABEL_9;
  }
  if (((1 << Int64Ranged) & 0xC0) != 0)
  {
    objc_msgSend(v4, "headerFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[SFRemoteTextSessionInfo initWithDictionary:]([SFRemoteTextSessionInfo alloc], "initWithDictionary:", v10);
    if (!v11)
    {
      if (gLogCategory_SFRemoteInteractionSession <= 60
        && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_26;
    }
    v12 = v11;
    if (Int64Ranged == 7)
    {
      if (self->_textSessionDidEnd)
      {
        if (gLogCategory_SFRemoteInteractionSession <= 30
          && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        textSessionDidEnd = (void (**)(id, SFRemoteTextSessionInfo *))self->_textSessionDidEnd;
        goto LABEL_54;
      }
      if (gLogCategory_SFRemoteInteractionSession > 50
        || gLogCategory_SFRemoteInteractionSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_27;
      }
    }
    else
    {
      if (Int64Ranged != 6)
      {
LABEL_27:
        v15 = 0;
        goto LABEL_28;
      }
      if (self->_agent)
      {
        objc_msgSend(v4, "peerDevice");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          -[SDRemoteInteractionAgent clientTextSessionDidBegin:device:](self->_agent, "clientTextSessionDidBegin:device:", v12, v13);

      }
      if (self->_textSessionDidBegin)
      {
        if (gLogCategory_SFRemoteInteractionSession <= 30
          && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        textSessionDidEnd = (void (**)(id, SFRemoteTextSessionInfo *))self->_textSessionDidBegin;
LABEL_54:
        textSessionDidEnd[2](textSessionDidEnd, v12);
        goto LABEL_27;
      }
      if (gLogCategory_SFRemoteInteractionSession > 50
        || gLogCategory_SFRemoteInteractionSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_27;
      }
    }
    LogPrintF();
    goto LABEL_27;
  }
  if (Int64Ranged != 8)
  {
LABEL_66:
    if (gLogCategory_SFRemoteInteractionSession > 40
      || gLogCategory_SFRemoteInteractionSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_25;
    }
LABEL_9:
    LogPrintF();
LABEL_25:
    v10 = 0;
LABEL_26:
    v12 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v4, "headerFields");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(SFRemoteTextSessionInfo);
  -[SFRemoteTextSessionInfo setText:](v12, "setText:", v15);
  textSessionDidChange = (void (**)(id, SFRemoteTextSessionInfo *))self->_textSessionDidChange;
  if (textSessionDidChange)
    textSessionDidChange[2](textSessionDidChange, v12);
  v10 = 0;
LABEL_28:

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
    v9[2] = __47__SFRemoteInteractionSession__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E482DF78;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __47__SFRemoteInteractionSession__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E482DF78;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DC0A8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_SFRemoteInteractionSession <= 10
      && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __47__SFRemoteInteractionSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __47__SFRemoteInteractionSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
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
  if (gLogCategory_SFRemoteInteractionSession <= 50
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
  if (self->_activateCalled)
  {
    v4 = _os_activity_create(&dword_1A2830000, "Sharing/SFRemoteInteractionSession/remoteInteractionSessionActivate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v6.opaque[0] = 0;
    v6.opaque[1] = 0;
    os_activity_scope_enter(v4, &v6);
    if (gLogCategory_SFRemoteInteractionSession <= 50
      && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFRemoteInteractionSession _ensureXPCStarted](self, "_ensureXPCStarted");
    -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteInteractionSessionActivate:completion:", self, &__block_literal_global_63);

    os_activity_scope_leave(&v6);
  }
}

void __42__SFRemoteInteractionSession__interrupted__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_SFRemoteInteractionSession <= 30
    && ((v5 = v2, gLogCategory_SFRemoteInteractionSession != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)remoteInteractionSessionRemoteTextEvent:(id)a3
{
  void (**remoteTextEventHandler)(id, id);
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteInteractionSession <= 30
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  remoteTextEventHandler = (void (**)(id, id))self->_remoteTextEventHandler;
  v5 = v6;
  if (remoteTextEventHandler)
  {
    remoteTextEventHandler[2](remoteTextEventHandler, v6);
    v5 = v6;
  }

}

- (void)remoteInteractionSessionTextSessionDidBegin:(id)a3
{
  void (**textSessionDidBegin)(id, id);
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteInteractionSession <= 30
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  textSessionDidBegin = (void (**)(id, id))self->_textSessionDidBegin;
  v5 = v6;
  if (textSessionDidBegin)
  {
    textSessionDidBegin[2](textSessionDidBegin, v6);
    v5 = v6;
  }

}

- (void)remoteInteractionSessionTextSessionDidEnd:(id)a3
{
  void (**textSessionDidEnd)(id, id);
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteInteractionSession <= 30
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  textSessionDidEnd = (void (**)(id, id))self->_textSessionDidEnd;
  v5 = v6;
  if (textSessionDidEnd)
  {
    textSessionDidEnd[2](textSessionDidEnd, v6);
    v5 = v6;
  }

}

- (void)remoteInteractionSessionTextSessionDidChange:(id)a3
{
  void (**textSessionDidChange)(id, id);
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteInteractionSession <= 10
    && (gLogCategory_SFRemoteInteractionSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  textSessionDidChange = (void (**)(id, id))self->_textSessionDidChange;
  v5 = v6;
  if (textSessionDidChange)
  {
    textSessionDidChange[2](textSessionDidChange, v6);
    v5 = v6;
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
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

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (id)remoteTextEventHandler
{
  return self->_remoteTextEventHandler;
}

- (void)setRemoteTextEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)textSessionDidBegin
{
  return self->_textSessionDidBegin;
}

- (void)setTextSessionDidBegin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)textSessionDidEnd
{
  return self->_textSessionDidEnd;
}

- (void)setTextSessionDidEnd:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)textSessionDidChange
{
  return self->_textSessionDidChange;
}

- (void)setTextSessionDidChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (SDRemoteInteractionAgent)agent
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
  objc_storeStrong(&self->_textSessionDidChange, 0);
  objc_storeStrong(&self->_textSessionDidEnd, 0);
  objc_storeStrong(&self->_textSessionDidBegin, 0);
  objc_storeStrong(&self->_remoteTextEventHandler, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_remoteSession, 0);
}

@end
