@implementation RPNearFieldDaemon

- (BOOL)hasCurrentTransaction
{
  void *v3;
  unsigned __int8 v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemon nearFieldController](self, "nearFieldController"));
  v4 = objc_msgSend(v3, "hasCurrentTransaction");

  return v4;
}

- (RPNearFieldDaemonController)nearFieldController
{
  return self->_nearFieldController;
}

+ (id)sharedNearFieldDaemon
{
  if (qword_100132030 != -1)
    dispatch_once(&qword_100132030, &stru_100112BE0);
  return (id)qword_100132028;
}

- (RPNearFieldDaemon)init
{
  RPNearFieldDaemon *v2;
  RPNearFieldDaemon *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPNearFieldDaemon;
  v2 = -[RPNearFieldDaemon init](&v5, "init");
  v3 = v2;
  if (v2)
    -[RPNearFieldDaemon _updateNearFieldDiscoveryPref](v2, "_updateNearFieldDiscoveryPref");
  return v3;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004FEC4;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  NSXPCListener *v3;
  NSXPCListener *xpcListener;
  const char *v5;
  uint64_t v6;

  if (dword_1001309B0 <= 30 && (dword_1001309B0 != -1 || _LogCategory_Initialize(&dword_1001309B0, 30)))
    LogPrintF(&dword_1001309B0, "-[RPNearFieldDaemon _activate]", 30, "Activating\n");
  if ((sub_100050794() & 1) != 0)
  {
    if (!self->_xpcListener)
    {
      v3 = (NSXPCListener *)objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.rapport.nearfield.service"));
      xpcListener = self->_xpcListener;
      self->_xpcListener = v3;

      -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
      -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
      -[NSXPCListener resume](self->_xpcListener, "resume");
    }
    self->_invalidateCalled = 0;
    if (dword_1001309B0 <= 30
      && (dword_1001309B0 != -1 || _LogCategory_Initialize(&dword_1001309B0, 30)))
    {
      v5 = "Activated\n";
      v6 = 30;
LABEL_14:
      LogPrintF(&dword_1001309B0, "-[RPNearFieldDaemon _activate]", v6, v5);
    }
  }
  else if (dword_1001309B0 <= 90
         && (dword_1001309B0 != -1 || _LogCategory_Initialize(&dword_1001309B0, 90)))
  {
    v5 = "Failed to activate: not supported on this platform.\n";
    v6 = 90;
    goto LABEL_14;
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  if (dword_1001309B0 <= 30 && (dword_1001309B0 != -1 || _LogCategory_Initialize(&dword_1001309B0, 30)))
    LogPrintF(&dword_1001309B0, "-[RPNearFieldDaemon invalidate]", 30, "Invalidate\n");
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000500F0;
  block[3] = &unk_1001110F8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  NSXPCListener *xpcListener;
  RPNearFieldDaemonController *nearFieldController;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (dword_1001309B0 <= 30
      && (dword_1001309B0 != -1 || _LogCategory_Initialize(&dword_1001309B0, 30)))
    {
      LogPrintF(&dword_1001309B0, "-[RPNearFieldDaemon _invalidate]", 30, "Invalidating\n");
    }
    -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
    xpcListener = self->_xpcListener;
    self->_xpcListener = 0;

    -[RPNearFieldDaemonController invalidate](self->_nearFieldController, "invalidate");
    nearFieldController = self->_nearFieldController;
    self->_nearFieldController = 0;

    -[RPNearFieldDaemon _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_nearFieldController && !self->_xpcListener)
  {
    self->_invalidateDone = 1;
    self->_activateCalled = 0;
    if (dword_1001309B0 <= 30
      && (dword_1001309B0 != -1 || _LogCategory_Initialize(&dword_1001309B0, 30)))
    {
      LogPrintF(&dword_1001309B0, "-[RPNearFieldDaemon _invalidated]", 30, "Invalidated\n");
    }
  }
}

- (void)_updateNearFieldDiscoveryPref
{
  uint64_t Int64;
  BOOL v4;
  _BOOL8 v5;
  void *v6;
  int v7;

  v7 = 0;
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.rapport"), CFSTR("nearFieldSeverDiscoveryEnabled"), &v7);
  if (v7)
    v4 = 0;
  else
    v4 = Int64 == 0;
  v5 = !v4;
  self->_prefEnableDiscovery = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemon nearFieldController](self, "nearFieldController"));
  objc_msgSend(v6, "setEnabled:", v5);

}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  return 0;
}

- (BOOL)addXPCMatchingToken:(unint64_t)a3 event:(id)a4 handler:(id)a5
{
  return 0;
}

- (BOOL)removeXPCMatchingToken:(unint64_t)a3
{
  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  RPNearFieldDaemonController *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cuValueForEntitlementNoCache:", CFSTR("com.apple.rapport.nearfield")));
  v7 = objc_msgSend(v6, "isEqual:", &__kCFBooleanFalse);

  if (v7)
  {
    if (dword_1001309B0 <= 90
      && (dword_1001309B0 != -1 || _LogCategory_Initialize(&dword_1001309B0, 90)))
    {
      LogPrintF(&dword_1001309B0, "-[RPNearFieldDaemon listener:shouldAcceptNewConnection:]", 90, "### %#{pid} missing entitlement '%@'\n", objc_msgSend(v5, "processIdentifier"), CFSTR("com.apple.rapport.nearfield"));
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemon nearFieldController](self, "nearFieldController"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemon nearFieldController](self, "nearFieldController"));
      objc_msgSend(v9, "invalidate");

    }
    v10 = -[RPNearFieldDaemonController initWithConnection:dispatchQueue:]([RPNearFieldDaemonController alloc], "initWithConnection:dispatchQueue:", v5, self->_dispatchQueue);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100050554;
    v15[3] = &unk_1001110F8;
    v15[4] = self;
    -[RPNearFieldDaemonController setTransactionChangedHandler:](v10, "setTransactionChangedHandler:", v15);
    -[RPNearFieldDaemonController setEnabled:](v10, "setEnabled:", self->_prefEnableDiscovery);
    -[RPNearFieldDaemon setNearFieldController:](self, "setNearFieldController:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemon _exportedInterface](self, "_exportedInterface"));
    objc_msgSend(v5, "setExportedInterface:", v11);

    objc_msgSend(v5, "setExportedObject:", v10);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000505BC;
    v14[3] = &unk_1001110F8;
    v14[4] = self;
    objc_msgSend(v5, "setInvalidationHandler:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemon _remoteObjectInterface](self, "_remoteObjectInterface"));
    objc_msgSend(v5, "setRemoteObjectInterface:", v12);

    objc_msgSend(v5, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(v5, "resume");
    if (dword_1001309B0 <= 30
      && (dword_1001309B0 != -1 || _LogCategory_Initialize(&dword_1001309B0, 30)))
    {
      LogPrintF(&dword_1001309B0, "-[RPNearFieldDaemon listener:shouldAcceptNewConnection:]", 30, "XPC connection started from %#{pid}\n", objc_msgSend(v5, "processIdentifier"));
    }

  }
  return v7 ^ 1;
}

- (id)_remoteObjectInterface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPNearFieldXPCClientInterface));
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(RPNFCTransaction, v3, v4), "didBeginTransaction:", 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(RPNFCTransaction, v5, v6), "didUpdateTransaction:", 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(RPNFCTransaction, v7, v8), "didInterruptTransaction:withError:", 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(NSError, v9, v10), "didInterruptTransaction:withError:", 1, 0);
  return v2;
}

- (id)_exportedInterface
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___RPNearFieldXPCDaemonInterface));
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(RPNearFieldContext, v3, v4), "startPolling:context:", 1, 0);
  return v2;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)transactionChangedHandler
{
  return self->_transactionChangedHandler;
}

- (void)setTransactionChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setNearFieldController:(id)a3
{
  objc_storeStrong((id *)&self->_nearFieldController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearFieldController, 0);
  objc_storeStrong(&self->_transactionChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end
