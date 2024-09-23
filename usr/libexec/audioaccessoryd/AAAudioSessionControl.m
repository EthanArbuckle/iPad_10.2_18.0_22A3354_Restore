@implementation AAAudioSessionControl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAAudioSessionControl)initWithCoder:(id)a3
{
  id v4;
  AAAudioSessionControl *v5;
  AAAudioSessionControl *v6;
  uint64_t v8;

  v4 = a3;
  v5 = -[AAAudioSessionControl init](self, "init");
  if (v5)
  {
    v8 = 0;
    if (NSDecodeSInt64RangedIfPresent(v4, CFSTR("cid"), 0, 0xFFFFFFFFLL, &v8))
      v5->_clientID = v8;
    v8 = 0;
    if (NSDecodeSInt64RangedIfPresent(v4, CFSTR("cds"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v8))
      v5->_conversationDetectSignal = v8;
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t clientID;
  uint64_t conversationDetectSignal;
  id v7;

  v4 = a3;
  clientID = self->_clientID;
  v7 = v4;
  if ((_DWORD)clientID)
  {
    objc_msgSend(v4, "encodeInt64:forKey:", clientID, CFSTR("cid"));
    v4 = v7;
  }
  conversationDetectSignal = self->_conversationDetectSignal;
  if ((_DWORD)conversationDetectSignal)
  {
    objc_msgSend(v7, "encodeInteger:forKey:", conversationDetectSignal, CFSTR("cds"));
    v4 = v7;
  }

}

- (id)description
{
  uint64_t conversationDetectSignal;
  const char *v4;
  id v5;
  void *v6;
  id v7;
  id v9;
  id v10;

  v10 = 0;
  conversationDetectSignal = self->_conversationDetectSignal;
  if (conversationDetectSignal > 0xB)
    v4 = "?";
  else
    v4 = (&off_1001E2130)[conversationDetectSignal];
  NSAppendPrintF(&v10, "AAAudioSessionControl, CID 0x%X, cds %s", self->_clientID, v4);
  v5 = v10;
  v6 = v5;
  if (self->_direct)
  {
    v9 = v5;
    NSAppendPrintF_safe(&v9, ", direct");
    v7 = v9;

    v6 = v7;
  }
  return v6;
}

- (AAAudioSessionControl)init
{
  AAAudioSessionControl *v2;
  AAAudioSessionControl *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AAAudioSessionControl;
  v2 = -[AAAudioSessionControl init](&v5, "init");
  if (v2)
  {
    v2->_clientID = sub_1000074F8();
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3 = v2;
  }

  return v2;
}

- (void)setConversationDetectSignal:(int)a3
{
  AAAudioSessionControl *v4;
  NSObject *dispatchQueue;
  _QWORD v6[5];
  int v7;

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = v4->_dispatchQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000060AC;
    v6[3] = &unk_1001E1FA8;
    v6[4] = v4;
    v7 = a3;
    dispatch_async(dispatchQueue, v6);
  }
  else
  {
    v4->_conversationDetectSignal = a3;
  }
  objc_sync_exit(v4);

}

- (void)setMuteAction:(int)a3 auditToken:(id *)a4
{
  __int128 v4;
  _OWORD v5[2];

  v4 = *(_OWORD *)&a4->var0[4];
  v5[0] = *(_OWORD *)a4->var0;
  v5[1] = v4;
  -[AAAudioSessionControl setMuteAction:auditToken:bundleIdentifier:](self, "setMuteAction:auditToken:bundleIdentifier:", *(_QWORD *)&a3, v5, 0);
}

- (void)setMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5
{
  id v8;
  const char *v9;
  AAAudioSessionControl *v10;
  NSObject *dispatchQueue;
  __int128 v12;
  _QWORD block[5];
  id v14;
  int v15;
  __int128 v16;
  __int128 v17;

  v8 = a5;
  if (dword_10020F510 <= 30 && (dword_10020F510 != -1 || _LogCategory_Initialize(&dword_10020F510, 30)))
  {
    if (a3 > 6)
      v9 = "?";
    else
      v9 = (&off_1001E2190)[a3];
    LogPrintF(&dword_10020F510, "-[AAAudioSessionControl setMuteAction:auditToken:bundleIdentifier:]", 30, "Mute Control: setMuteAction: %s", v9);
  }
  v10 = self;
  objc_sync_enter(v10);
  if (v10->_activateCalled)
  {
    dispatchQueue = v10->_dispatchQueue;
    block[1] = 3221225472;
    v12 = *(_OWORD *)&a4->var0[4];
    v16 = *(_OWORD *)a4->var0;
    block[0] = _NSConcreteStackBlock;
    block[2] = sub_1000062EC;
    block[3] = &unk_1001E1FD0;
    block[4] = v10;
    v15 = a3;
    v17 = v12;
    v14 = v8;
    dispatch_async(dispatchQueue, block);

  }
  else if (dword_10020F510 <= 90
         && (dword_10020F510 != -1 || _LogCategory_Initialize(&dword_10020F510, 90)))
  {
    LogPrintF(&dword_10020F510, "-[AAAudioSessionControl setMuteAction:auditToken:bundleIdentifier:]", 90, "### setMuteAction failed: AAudioSessionControl not activated");
  }
  objc_sync_exit(v10);

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006474;
  v7[3] = &unk_1001E1FF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async((dispatch_queue_t)dispatchQueue, v7);

}

- (void)_activate:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  _QWORD *v8;
  void (**v9)(id, id);
  id activateCompletion;
  id v11;
  _QWORD v12[5];
  BOOL v13;

  v3 = a3;
  if (dword_10020F510 <= 30 && (dword_10020F510 != -1 || _LogCategory_Initialize(&dword_10020F510, 30)))
    LogPrintF(&dword_10020F510, "-[AAAudioSessionControl _activate:]", 30, "Is gAAservicesDaemon %@", qword_100218BD0);
  if (self->_testListenerEndpoint)
    v5 = 1;
  else
    v5 = qword_100218BD0 == 0;
  v6 = !v5;
  self->_direct = v6;
  if (self->_invalidateCalled)
  {
    v7 = NSErrorF(NSOSStatusErrorDomain, 4294896148, "Activate after invalidate");
    v11 = (id)objc_claimAutoreleasedReturnValue(v7);
    if (dword_10020F510 <= 90
      && (dword_10020F510 != -1 || _LogCategory_Initialize(&dword_10020F510, 90)))
    {
      LogPrintF(&dword_10020F510, "-[AAAudioSessionControl _activate:]", 90, "### Activate failed: %@, %@", self, v11);
    }
    v9 = (void (**)(id, id))objc_retainBlock(self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v9)
      v9[2](v9, v11);

  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100006750;
    v12[3] = &unk_1001E2020;
    v12[4] = self;
    v13 = v3;
    v8 = objc_retainBlock(v12);
    if (self->_direct)
      -[AAAudioSessionControl _activateDirect:](self, "_activateDirect:", v8);
    else
      -[AAAudioSessionControl _activateXPC:reactivate:](self, "_activateXPC:reactivate:", v8, v3);

  }
}

- (void)_activateDirect:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (dword_10020F510 <= 30 && (dword_10020F510 != -1 || _LogCategory_Initialize(&dword_10020F510, 30)))
    LogPrintF(&dword_10020F510, "-[AAAudioSessionControl _activateDirect:]", 30, "Activate direct, CID 0x%X", self->_clientID);
  v5 = (void *)qword_100218BD0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000069A4;
  v7[3] = &unk_1001E2070;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "activateAudioSessionControl:completion:", self, v7);

}

- (void)_activateXPC:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *);
  void *v7;
  NSXPCConnection *xpcCnx;
  void (**v9)(id, void *);
  void *v10;
  _QWORD v11[4];
  void (**v12)(id, void *);
  _QWORD v13[4];
  void (**v14)(id, void *);
  BOOL v15;

  v4 = a4;
  v6 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (dword_10020F510 > 30)
      goto LABEL_15;
    if (dword_10020F510 != -1 || _LogCategory_Initialize(&dword_10020F510, 30))
      LogPrintF(&dword_10020F510, "-[AAAudioSessionControl _activateXPC:reactivate:]", 30, "Re-activate XPC");
  }
  else
  {
    if (dword_10020F510 > 30)
      goto LABEL_15;
    if (dword_10020F510 != -1 || _LogCategory_Initialize(&dword_10020F510, 30))
      LogPrintF(&dword_10020F510, "-[AAAudioSessionControl _activateXPC:reactivate:]", 30, "Activate XPC");
  }
  if (dword_10020F510 <= 30 && (dword_10020F510 != -1 || _LogCategory_Initialize(&dword_10020F510, 30)))
    LogPrintF(&dword_10020F510, "-[AAAudioSessionControl _activateXPC:reactivate:]", 30, "Activate XPC, CID 0x%X", self->_clientID);
LABEL_15:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AAAudioSessionControl _ensureXPCStarted](self, "_ensureXPCStarted"));
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100006C3C;
    v13[3] = &unk_1001E2098;
    v15 = v4;
    v9 = v6;
    v14 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v13));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100006D30;
    v11[3] = &unk_1001E20C0;
    v12 = v9;
    objc_msgSend(v10, "audioSessionControlActivate:completion:", self, v11);

  }
}

- (id)_ensureXPCStarted
{
  NSXPCListenerEndpoint *v3;
  id v4;
  NSXPCConnection *v5;
  NSXPCConnection *xpcCnx;
  void *v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];

  if (!self->_xpcCnx)
  {
    v3 = self->_testListenerEndpoint;
    v4 = objc_alloc((Class)NSXPCConnection);
    if (v3)
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithListenerEndpoint:", v3);
    else
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.AudioAccessoryServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___AAServicesXPCClientInterface));
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100006EA0;
    v11[3] = &unk_1001E20E8;
    v11[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v11);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100006EA8;
    v10[3] = &unk_1001E20E8;
    v10[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___AAServicesXPCDaemonInterface));
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
  }
  return 0;
}

- (void)_interrupted
{
  uint64_t v3;
  void *v4;
  id activateCompletion;
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_10020F510 <= 50 && (dword_10020F510 != -1 || _LogCategory_Initialize(&dword_10020F510, 50)))
    LogPrintF(&dword_10020F510, "-[AAAudioSessionControl _interrupted]", 50, "### Interrupted");
  v3 = BTErrorF(4294960596, "XPC interrupted");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[AAAudioSessionControl _reportError:](self, "_reportError:", v4);

  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (self->_activateCalled)
    -[AAAudioSessionControl _activate:](self, "_activate:", 1);
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)invalidate
{
  OS_dispatch_queue *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007004;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidateDirect
{
  objc_msgSend((id)qword_100218BD0, "invalidateAudioSessionControl:completion:");
}

- (void)_invalidated
{
  id activateCompletion;
  uint64_t v4;
  void *v5;
  void (**v6)(_QWORD);
  id invalidationHandler;
  NSXPCConnection *xpcCnx;
  void (**v9)(id, void *);

  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && dword_10020F510 <= 50
      && (dword_10020F510 != -1 || _LogCategory_Initialize(&dword_10020F510, 50)))
    {
      LogPrintF(&dword_10020F510, "-[AAAudioSessionControl _invalidated]", 50, "### XPC connection unexpectedly invalidated");
    }
    if (!self->_direct && !self->_xpcCnx)
    {
      v9 = (void (**)(id, void *))objc_retainBlock(self->_activateCompletion);
      activateCompletion = self->_activateCompletion;
      self->_activateCompletion = 0;

      if (v9)
      {
        v4 = BTErrorF(4294896148, "Unexpectedly invalidated");
        v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
        v9[2](v9, v5);

      }
      v6 = (void (**)(_QWORD))objc_retainBlock(self->_invalidationHandler);
      invalidationHandler = self->_invalidationHandler;
      self->_invalidationHandler = 0;

      if (v6)
        v6[2](v6);
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (dword_10020F510 <= 10
        && (dword_10020F510 != -1 || _LogCategory_Initialize(&dword_10020F510, 10)))
      {
        LogPrintF(&dword_10020F510, "-[AAAudioSessionControl _invalidated]", 10, "Invalidated");
      }

    }
  }
}

- (void)_reportError:(id)a3
{
  void (**v4)(id, id);
  id activateCompletion;
  id v6;

  v6 = a3;
  if (dword_10020F510 <= 90 && (dword_10020F510 != -1 || _LogCategory_Initialize(&dword_10020F510, 90)))
    LogPrintF(&dword_10020F510, "-[AAAudioSessionControl _reportError:]", 90, "### Error: %{error}", v6);
  v4 = (void (**)(id, id))objc_retainBlock(self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v4)
    v4[2](v4, v6);

}

- (int)conversationDetectSignal
{
  return self->_conversationDetectSignal;
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

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
