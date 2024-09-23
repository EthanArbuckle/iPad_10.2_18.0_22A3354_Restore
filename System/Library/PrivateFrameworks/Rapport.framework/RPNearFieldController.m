@implementation RPNearFieldController

- (RPNearFieldController)initWithDispatchQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  RPNearFieldController *v9;
  objc_super v11;

  v7 = a3;
  v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RPNearFieldController;
  v9 = -[RPNearFieldController init](&v11, sel_init);
  if (v9)
  {
    if (gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)&v9->_dispatchQueue, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
  }

  return v9;
}

- (NSString)currentApplicationLabel
{
  void *v2;
  void *v3;

  -[RPNearFieldController currentContext](self, "currentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  _QWORD v9[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcConnection)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.rapport.nearfield.service"), 0);
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v3;

    -[RPNearFieldController _exportedInterface](self, "_exportedInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    -[RPNearFieldController _remoteObjectInterface](self, "_remoteObjectInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection _setQueue:](self->_xpcConnection, "_setQueue:", self->_dispatchQueue);
    v7 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__RPNearFieldController__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E5F4EC60;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v9);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __42__RPNearFieldController__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E5F4EC60;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v8);
    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    if (gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __42__RPNearFieldController__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __42__RPNearFieldController__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (id)_exportedInterface
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE42D98);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didBeginTransaction_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didUpdateTransaction_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didInterruptTransaction_withError_, 0, 0);
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didInterruptTransaction_withError_, 1, 0);
  return v2;
}

- (id)_remoteObjectInterface
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4AC38);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_startPolling_context_, 1, 0);
  return v2;
}

- (void)_interrupted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPNearFieldController <= 30
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[RPNearFieldController currentTransaction](self, "currentTransaction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[RPNearFieldController setCurrentTransaction:](self, "setCurrentTransaction:", 0);
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("XPC connection was interrupted.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("RPNearFieldControllerErrorDomain"), 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[RPNearFieldController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nearFieldController:didInterruptTransaction:error:", self, v3, v6);

  }
  if (self->_didStart)
    -[RPNearFieldController _startPolling](self, "_startPolling");

}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[RPNearFieldController stop](self, "stop");
    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
    -[RPNearFieldController _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  NSXPCConnection *xpcConnection;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPNearFieldController <= 30
      && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (id)_remoteObjectProxy
{
  NSXPCConnection *xpcConnection;
  _QWORD v4[5];

  xpcConnection = self->_xpcConnection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__RPNearFieldController__remoteObjectProxy__block_invoke;
  v4[3] = &unk_1E5F4ECD0;
  v4[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcConnection, "remoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __43__RPNearFieldController__remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  if (gLogCategory_RPNearFieldController <= 90
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    v4 = v5;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nearFieldController:didInvalidateWithError:", *(_QWORD *)(a1 + 32), v5);

}

- (id)_synchronousRemoteObjectProxy
{
  NSXPCConnection *xpcConnection;
  _QWORD v4[5];

  xpcConnection = self->_xpcConnection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__RPNearFieldController__synchronousRemoteObjectProxy__block_invoke;
  v4[3] = &unk_1E5F4ECD0;
  v4[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](xpcConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __54__RPNearFieldController__synchronousRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = a2;
  if (gLogCategory_RPNearFieldController <= 90
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    v4 = v5;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nearFieldController:didInvalidateWithError:", *(_QWORD *)(a1 + 32), v5);

}

- (void)startPolling:(int64_t)a3 forApplicationLabel:(id)a4
{
  NSObject *dispatchQueue;
  id v7;
  id v8;

  dispatchQueue = self->_dispatchQueue;
  v7 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  v8 = -[RPNearFieldContext initWitApplicationLabel:]([RPNearFieldContext alloc], "initWitApplicationLabel:", v7);

  -[RPNearFieldController startPolling:context:](self, "startPolling:context:", a3, v8);
}

- (void)startPolling:(int64_t)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;

  v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[RPNearFieldController currentPreferredPollingType](self, "currentPreferredPollingType") != a3)
  {
LABEL_8:
    self->_didStart = 1;
    *(_WORD *)&self->_invalidateCalled = 0;
    -[RPNearFieldController setCurrentContext:](self, "setCurrentContext:", v10);
    -[RPNearFieldController setCurrentPreferredPollingType:](self, "setCurrentPreferredPollingType:", a3);
    -[RPNearFieldController _ensureXPCStarted](self, "_ensureXPCStarted");
    -[RPNearFieldController _startPolling](self, "_startPolling");
    goto LABEL_9;
  }
  -[RPNearFieldController currentContext](self, "currentContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  v8 = v7;
  if (v6 != v7)
  {
    if ((v7 != 0) != (v6 == 0))
    {
      v9 = objc_msgSend(v6, "isEqual:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    goto LABEL_8;
  }

LABEL_9:
}

- (void)_startPolling
{
  int64_t v3;
  void *v4;
  void *v5;
  int64_t v6;
  id v7;

  if (gLogCategory_RPNearFieldController <= 30
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    -[RPNearFieldController currentApplicationLabel](self, "currentApplicationLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[RPNearFieldController currentPreferredPollingType](self, "currentPreferredPollingType");
    LogPrintF();

  }
  -[RPNearFieldController _synchronousRemoteObjectProxy](self, "_synchronousRemoteObjectProxy", v5, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[RPNearFieldController currentPreferredPollingType](self, "currentPreferredPollingType");
  -[RPNearFieldController currentContext](self, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startPolling:context:", v3, v4);

}

- (void)stop
{
  void *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[RPNearFieldController _ensureXPCStarted](self, "_ensureXPCStarted");
  if (self->_didStart)
  {
    self->_didStart = 0;
    -[RPNearFieldController _remoteObjectProxy](self, "_remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stop");

    -[RPNearFieldController setCurrentTransaction:](self, "setCurrentTransaction:", 0);
    -[RPNearFieldController setCurrentContext:](self, "setCurrentContext:", 0);
    -[RPNearFieldController setCurrentPreferredPollingType:](self, "setCurrentPreferredPollingType:", 0);
  }
}

- (void)invalidateTransaction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RPNearFieldController currentContext](self, "currentContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[RPNearFieldController invalidateTransaction:context:](self, "invalidateTransaction:context:", v4, v5);

}

- (void)invalidateTransaction:(id)a3 context:(id)a4
{
  NSObject *dispatchQueue;
  id v7;
  id v8;
  void *v9;
  id v10;

  dispatchQueue = self->_dispatchQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  -[RPNearFieldController _remoteObjectProxy](self, "_remoteObjectProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "invalidateTransactionWithIdentifier:context:", v9, v7);
}

- (void)didDetectDeviceNearbyWithInitiatorRole:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[RPNearFieldController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nearFieldController:didDetectDeviceNearbyWithInitiatorRole:", self, v3);

}

- (void)didBeginTransaction:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  id v6;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  -[RPNearFieldController setCurrentTransaction:](self, "setCurrentTransaction:", v5);
  -[RPNearFieldController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nearFieldController:didBeginTransaction:", self, v5);

}

- (void)didUpdateTransaction:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(v13, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPNearFieldController currentTransaction](self, "currentTransaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) != 0)
  {
    -[RPNearFieldController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "state") == 1)
    {
      -[RPNearFieldController setCurrentTransaction:](self, "setCurrentTransaction:", 0);
      objc_msgSend(v13, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nearFieldController:didInterruptTransaction:error:", self, v13, v10);
LABEL_11:

      goto LABEL_12;
    }
    if (objc_msgSend(v13, "state") == 2)
    {
      objc_msgSend(v13, "tapEvent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RPNearFieldController.m"), 266, CFSTR("tapEvent is nil for transaction:%@"), v13);

      }
      objc_msgSend(v13, "tapEvent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "nearFieldController:transaction:didReceiveTapEvent:", self, v13, v10);
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (gLogCategory_RPNearFieldController <= 90
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    -[RPNearFieldController currentTransaction](self, "currentTransaction");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
    goto LABEL_12;
  }
LABEL_13:

}

- (void)didInterruptTransaction:(id)a3 withError:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(v12, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPNearFieldController currentTransaction](self, "currentTransaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) != 0)
  {
    -[RPNearFieldController setCurrentTransaction:](self, "setCurrentTransaction:", 0);
    -[RPNearFieldController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "nearFieldController:didInterruptTransaction:error:", self, v12, v6);
LABEL_6:

    goto LABEL_7;
  }
  if (gLogCategory_RPNearFieldController <= 90
    && (gLogCategory_RPNearFieldController != -1 || _LogCategory_Initialize()))
  {
    -[RPNearFieldController currentTransaction](self, "currentTransaction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
    goto LABEL_6;
  }
LABEL_7:

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (RPNearFieldControllerDelegate)delegate
{
  return (RPNearFieldControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)currentPreferredPollingType
{
  return self->_currentPreferredPollingType;
}

- (void)setCurrentPreferredPollingType:(int64_t)a3
{
  self->_currentPreferredPollingType = a3;
}

- (RPNearFieldContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentContext, a3);
}

- (RPNearFieldTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransaction, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
