@implementation RPNearFieldDaemonController

- (BOOL)hasCurrentTransaction
{
  RPNearFieldDaemonController *v2;
  NSObject *v3;
  void *v4;

  v2 = self;
  v3 = objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController dispatchQueue](self, "dispatchQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](v2, "currentTransaction"));
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (RPNFCTransaction)currentTransaction
{
  return self->_currentTransaction;
}

+ (id)_legacyApplicationLabels
{
  if (qword_100131FA0 != -1)
    dispatch_once(&qword_100131FA0, &stru_100112768);
  return (id)qword_100131F98;
}

- (RPNearFieldDaemonController)initWithConnection:(id)a3 dispatchQueue:(id)a4
{
  id v7;
  id v8;
  RPNearFieldDaemonController *v9;
  RPNearFieldDataSource *v10;
  RPNearFieldDataSource *dataSource;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)RPNearFieldDaemonController;
  v9 = -[RPNearFieldDaemonController init](&v13, "init");
  if (v9)
  {
    if (dword_1001304C8 <= 30
      && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
    {
      LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController initWithConnection:dispatchQueue:]", 30, "init");
    }
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v9->_dispatchQueue, a4);
    v10 = -[RPNearFieldDataSource initWithDispatchQueue:]([RPNearFieldDataSource alloc], "initWithDispatchQueue:", v8);
    dataSource = v9->_dataSource;
    v9->_dataSource = v10;

  }
  return v9;
}

- (void)invalidate
{
  void *v3;

  if (dword_1001304C8 <= 30 && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
    LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController invalidate]", 30, "Invalidate");
  -[RPNearFieldDaemonController stop](self, "stop");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController connection](self, "connection"));
  objc_msgSend(v3, "invalidate");

  -[RPNearFieldDaemonController setConnection:](self, "setConnection:", 0);
  -[RPNearFieldDaemonController setTransactionChangedHandler:](self, "setTransactionChangedHandler:", 0);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 enabled;
  const char *v6;
  BOOL v7;
  const char *v8;

  if (self->_enabled != a3)
  {
    v3 = a3;
    self->_enabled = a3;
    if (dword_1001304C8 <= 30)
    {
      enabled = a3;
      if (dword_1001304C8 != -1)
      {
LABEL_4:
        v6 = "no";
        v7 = !enabled;
        if (enabled)
          v8 = "no";
        else
          v8 = "yes";
        if (!v7)
          v6 = "yes";
        LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController setEnabled:]", 30, "NFC Discovery enabled: %s -> %s\n", v8, v6);
        goto LABEL_11;
      }
      if (_LogCategory_Initialize(&dword_1001304C8, 30))
      {
        enabled = self->_enabled;
        goto LABEL_4;
      }
    }
LABEL_11:
    if (v3)
      -[RPNearFieldDaemonController _startTransactionControllerIfNeeded](self, "_startTransactionControllerIfNeeded");
    else
      -[RPNearFieldDaemonController _stopTransactionControllerIfNeeded](self, "_stopTransactionControllerIfNeeded");
  }
}

- (void)startPolling:(int64_t)a3 context:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  if (dword_1001304C8 <= 30 && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "applicationLabel"));
    LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController startPolling:context:]", 30, "Start polling for applicationLabel:%@ pollingType:%d\n", v6, a3);

  }
  if (!-[RPNearFieldDaemonController isActive](self, "isActive"))
    goto LABEL_15;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
  v8 = v17;
  v9 = v8;
  if (v7 == v8)
    v10 = 0;
  else
    v10 = (v8 != 0) == (v7 == 0) ? 1 : objc_msgSend(v7, "isEqual:", v8) ^ 1;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
    v13 = objc_msgSend(v12, "preferredPollingType") != (id)a3;

  }
  else
  {
    v13 = 0;
  }

  if (((v10 | v13) & 1) == 0)
  {
    if (dword_1001304C8 <= 30
      && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
    {
      LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController startPolling:context:]", 30, "We are already polling with this configuration.\n");
    }
  }
  else
  {
LABEL_15:
    -[RPNearFieldDaemonController setCurrentContext:](self, "setCurrentContext:", v17);
    -[RPNearFieldDaemonController setCurrentPreferredPollingType:](self, "setCurrentPreferredPollingType:", a3);
    -[RPNearFieldDaemonController setIsActive:](self, "setIsActive:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
      -[RPNearFieldDaemonController invalidateTransactionWithIdentifier:](self, "invalidateTransactionWithIdentifier:", v16);

    }
    else
    {
      -[RPNearFieldDaemonController _startTransactionControllerIfNeeded](self, "_startTransactionControllerIfNeeded");
    }
  }

}

- (void)setCurrentPreferredPollingType:(int64_t)a3
{
  id v4;

  if (self->_currentPreferredPollingType != a3)
  {
    self->_currentPreferredPollingType = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
    objc_msgSend(v4, "setPreferredPollingType:", a3);

  }
}

- (void)stop
{
  void *v3;
  void *v4;
  id v5;

  if (-[RPNearFieldDaemonController isActive](self, "isActive"))
  {
    if (dword_1001304C8 <= 30
      && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
    {
      LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController stop]", 30, "Stop\n");
    }
    -[RPNearFieldDaemonController setIsActive:](self, "setIsActive:", 0);
    -[RPNearFieldDaemonController setCurrentContext:](self, "setCurrentContext:", 0);
    -[RPNearFieldDaemonController setCurrentPreferredPollingType:](self, "setCurrentPreferredPollingType:", 0);
    -[RPNearFieldDaemonController _stopTransactionControllerIfNeeded](self, "_stopTransactionControllerIfNeeded");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

    if (v3)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      -[RPNearFieldDaemonController invalidateTransactionWithIdentifier:](self, "invalidateTransactionWithIdentifier:", v4);

    }
  }
}

- (void)invalidateTransactionWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
  -[RPNearFieldDaemonController invalidateTransactionWithIdentifier:context:](self, "invalidateTransactionWithIdentifier:context:", v4, v5);

}

- (void)invalidateTransactionWithIdentifier:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  if (dword_1001304C8 <= 30 && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController invalidateTransactionWithIdentifier:context:]", 30, "invalidate transaction with identifier:%@\n current transaction identifier:%@\n context:%@\n", v16, v8, v6);

  }
  -[RPNearFieldDaemonController setCurrentContext:](self, "setCurrentContext:", v6);
  v9 = objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  if (v9
    && (v10 = (void *)v9,
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier")),
        v13 = objc_msgSend(v12, "isEqual:", v16),
        v12,
        v11,
        v10,
        (v13 & 1) != 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
    objc_msgSend(v14, "invalidateTransaction:", v15);

    -[RPNearFieldDaemonController _clearCurrentTransaction](self, "_clearCurrentTransaction");
    -[RPNearFieldDaemonController _startTransactionControllerIfNeeded](self, "_startTransactionControllerIfNeeded");
  }
  else if (dword_1001304C8 <= 90
         && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 90)))
  {
    LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController invalidateTransactionWithIdentifier:context:]", 90, "failed to invalidate transaction with identifier:%@\n", v16);
  }

}

- (void)_startTransactionControllerIfNeeded
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  const char *v6;
  void *v7;
  RPNFCTransactionController *v8;
  RPNFCTransactionController *transactionController;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
  v4 = objc_msgSend(v3, "isRunning");

  if ((v4 & 1) == 0 && -[RPNearFieldDaemonController isActive](self, "isActive"))
  {
    if (dword_1001304C8 <= 30
      && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
    {
      LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController _startTransactionControllerIfNeeded]", 30, "start transaction controller\n");
    }
    if (-[RPNearFieldDaemonController enabled](self, "enabled"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

      if (v5)
      {
        if (dword_1001304C8 > 90
          || dword_1001304C8 == -1 && !_LogCategory_Initialize(&dword_1001304C8, 90))
        {
          return;
        }
        v6 = "failed to start transaction controller: we already have an active transaction\n";
LABEL_15:
        LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController _startTransactionControllerIfNeeded]", 90, v6);
        return;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));

      if (!v7)
      {
        v8 = -[RPNFCTransactionController initWithPreferredPollingType:dispatchQueue:]([RPNFCTransactionController alloc], "initWithPreferredPollingType:dispatchQueue:", -[RPNearFieldDaemonController currentPreferredPollingType](self, "currentPreferredPollingType"), self->_dispatchQueue);
        transactionController = self->_transactionController;
        self->_transactionController = v8;

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
      objc_msgSend(v10, "setDataSource:", self);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
      objc_msgSend(v11, "setDelegate:", self);

      v12 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
      objc_msgSend(v12, "start");

    }
    else if (dword_1001304C8 <= 90
           && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 90)))
    {
      v6 = "Failed to start transaction controller: NFC Discovery is disabled.\n";
      goto LABEL_15;
    }
  }
}

- (void)_stopTransactionControllerIfNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
  v4 = objc_msgSend(v3, "isRunning");

  if (v4)
  {
    if (dword_1001304C8 <= 30
      && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
    {
      LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController _stopTransactionControllerIfNeeded]", 30, "stop transaction controller\n");
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
    objc_msgSend(v5, "setDataSource:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
    objc_msgSend(v6, "setDelegate:", 0);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionController](self, "transactionController"));
    objc_msgSend(v7, "stop");

  }
}

- (void)_clearCurrentTransaction
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);

  if (dword_1001304C8 <= 30 && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
    LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController _clearCurrentTransaction]", 30, "clearing current transaction:%@\n", v3);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  objc_msgSend(v4, "setDelegate:", 0);

  -[RPNearFieldDaemonController setCurrentTransaction:](self, "setCurrentTransaction:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionChangedHandler](self, "transactionChangedHandler"));

  if (v5)
  {
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionChangedHandler](self, "transactionChangedHandler"));
    v6[2]();

  }
}

- (id)_remoteObjectProxy
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController connection](self, "connection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &stru_100112788));

  return v3;
}

- (void)didChangeStateForTransaction:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

  if (v5 == v4)
  {
    if (dword_1001304C8 <= 30
      && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
    {
      LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController didChangeStateForTransaction:]", 30, "did change state for transaction:%@\n", v4);
    }
    if (objc_msgSend(v4, "state") == (id)2)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[RPIdentityDaemon sharedIdentityDaemon](RPIdentityDaemon, "sharedIdentityDaemon"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteIdentity"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000408EC;
      v9[3] = &unk_1001127B0;
      v9[4] = self;
      v10 = v4;
      objc_msgSend(v6, "isContactValidForIdentity:completionBlock:", v7, v9);

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _remoteObjectProxy](self, "_remoteObjectProxy"));
      objc_msgSend(v8, "didUpdateTransaction:", v4);

    }
  }

}

- (void)transactionController:(id)a3 didDetectDeviceNearbyWithInitiatorRole:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction", a3));

  if (!v6)
  {
    if (dword_1001304C8 <= 30
      && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
    {
      LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController transactionController:didDetectDeviceNearbyWithInitiatorRole:]", 30, "did detect device nearby\n");
    }
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _remoteObjectProxy](self, "_remoteObjectProxy"));
    objc_msgSend(v7, "didDetectDeviceNearbyWithInitiatorRole:", v4);

  }
}

- (void)transactionController:(id)a3 didBeginTransaction:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void);
  id v9;

  v9 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

  if (!v5)
  {
    if (dword_1001304C8 <= 30
      && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
    {
      LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController transactionController:didBeginTransaction:]", 30, "did begin new transaction:%@\n", v9);
    }
    -[RPNearFieldDaemonController setCurrentTransaction:](self, "setCurrentTransaction:", v9);
    objc_msgSend(v9, "setDelegate:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _remoteObjectProxy](self, "_remoteObjectProxy"));
    objc_msgSend(v6, "didBeginTransaction:", v9);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionChangedHandler](self, "transactionChangedHandler"));
    if (v7)
    {
      v8 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController transactionChangedHandler](self, "transactionChangedHandler"));
      v8[2]();

    }
  }

}

- (void)transactionController:(id)a3 didFinishTransaction:(id)a4 error:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

  v7 = v8;
  if (v6 == v8)
  {
    if (objc_msgSend(v8, "state") == (id)2)
    {
      if (dword_1001304C8 <= 30
        && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
      {
        LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController transactionController:didFinishTransaction:error:]", 30, "exchange completed for current transaction:%@\nstop listening for new transactions until client invalidates the current one.", v8);
      }
      -[RPNearFieldDaemonController _stopTransactionControllerIfNeeded](self, "_stopTransactionControllerIfNeeded");
    }
    else
    {
      -[RPNearFieldDaemonController _clearCurrentTransaction](self, "_clearCurrentTransaction");
    }
    v7 = v8;
  }

}

- (id)_createAuthenticationPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pkData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bonjourListenerUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "createAuthenticationPayloadWithPkData:bonjourListenerUUID:", v5, v7));

  return v8;
}

- (BOOL)_supportsApplicationLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "supportedApplicationLabels"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "supportedApplicationLabels"));

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          if (objc_msgSend(v4, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i)))
          {
            if (dword_1001304C8 <= 30
              && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
            {
              LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController _supportsApplicationLabel:]", 30, "applicationLabel:%@ is supported.\n", v4);
            }
            LOBYTE(v10) = 1;
            goto LABEL_17;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_17:

  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return (char)v10;
}

- (id)_createValidationPayload
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

  if (!v3
    && dword_1001304C8 <= 115
    && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 115)))
  {
    LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController _createValidationPayload]", 115, "creating validation payload with a nil current transaction.");
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteIdentity"));
  v6 = v5 != 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteAuthenticationMessage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "applicationLabel"));

  v10 = -[RPNearFieldDaemonController _supportsApplicationLabel:](self, "_supportsApplicationLabel:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController dataSource](self, "dataSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "createValidationPayloadWithKnownIdentity:supportsApplicationLabel:", v6, v10));

  return v12;
}

- (id)_payloadForType:(int64_t)a3
{
  void *v5;

  if (sub_100050908(a3))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _createAuthenticationPayload](self, "_createAuthenticationPayload"));
  }
  else if (a3 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _createValidationPayload](self, "_createValidationPayload"));
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_convertToLegacyApplicationLabelIfNeeded:(id)a3 forVersion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (qword_100131FB0 != -1)
    dispatch_once(&qword_100131FB0, &stru_1001127D0);
  v7 = v5;
  v8 = v7;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("1.0")))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100131FA8, "objectForKeyedSubscript:", v7));
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v7;
    v8 = v11;

  }
  return v8;
}

- (id)_convertToUpdatedApplicationLabelIfNeeded:(id)a3 forVersion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (qword_100131FC0 != -1)
    dispatch_once(&qword_100131FC0, &stru_1001127F0);
  v7 = v5;
  v8 = v7;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("1.0")))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100131FB8, "objectForKeyedSubscript:", v7));
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v7;
    v8 = v11;

  }
  return v8;
}

- (id)transactionController:(id)a3 requestMessageForType:(int64_t)a4
{
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction", a3));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _payloadForType:](self, "_payloadForType:", a4));
    v8 = CFSTR("1.1");
    if (a4 == 2)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "remoteAuthenticationMessage"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "version"));

      v8 = (__CFString *)v11;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "applicationLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _convertToLegacyApplicationLabelIfNeeded:forVersion:](self, "_convertToLegacyApplicationLabelIfNeeded:forVersion:", v13, v8));

    if (dword_1001304C8 <= 30
      && (dword_1001304C8 != -1 || _LogCategory_Initialize(&dword_1001304C8, 30)))
    {
      LogPrintF(&dword_1001304C8, "-[RPNearFieldDaemonController transactionController:requestMessageForType:]", 30, "type:%d version:%@ applicationLabel:%@\n", a4, v8, v14);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController dataSource](self, "dataSource"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "createRequestMessageWithApplicationLabel:payload:", v14, v7));

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)transactionController:(id)a3 responseMessageForRequestMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "payload"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _payloadForType:](self, "_payloadForType:", objc_msgSend(v7, "type")));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "applicationLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "version"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _convertToLegacyApplicationLabelIfNeeded:forVersion:](self, "_convertToLegacyApplicationLabelIfNeeded:forVersion:", v10, v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController dataSource](self, "dataSource"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "createResponseWithApplicationLabel:payload:forRequestMessage:", v12, v8, v5));

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)transactionController:(id)a3 tapEventForApplicationLabel:(id)a4 singleBandAWDLModeRequested:(BOOL)a5 pkData:(id)a6 bonjourListenerUUID:(id)a7 identity:(id)a8
{
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v48;
  void *v49;
  _BOOL4 v50;
  void *v51;

  v10 = a5;
  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localValidationMessage"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "payload"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "remoteValidationMessage"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "payload"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "supportsApplicationLabel"));
  LODWORD(v21) = objc_msgSend(v23, "BOOLValue");

  v51 = v13;
  v50 = v10;
  if ((_DWORD)v21)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "supportsApplicationLabel"));

    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "supportsApplicationLabel"));
      v26 = objc_msgSend(v25, "BOOLValue") ^ 1;
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentContext](self, "currentContext"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "applicationLabel"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _convertToLegacyApplicationLabelIfNeeded:forVersion:](self, "_convertToLegacyApplicationLabelIfNeeded:forVersion:", v28, CFSTR("1.0")));

      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "remoteValidationMessage"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "applicationLabel"));

      v33 = objc_msgSend((id)objc_opt_class(self, v31, v32), "_legacyApplicationLabels");
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      if ((objc_msgSend(v34, "containsObject:", v25) & 1) != 0)
        v35 = 0;
      else
        v35 = objc_msgSend(v25, "hasPrefix:", CFSTR("com.apple.airdrop")) ^ 1;
      HIDWORD(v48) = v35;

      v38 = objc_msgSend((id)objc_opt_class(self, v36, v37), "_legacyApplicationLabels");
      v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
      v40 = objc_msgSend(v39, "containsObject:", v49);

      v26 = HIDWORD(v48) | v40 ^ 1;
    }

  }
  else
  {
    v26 = 1;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController currentTransaction](self, "currentTransaction"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "remoteValidationMessage"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "version"));

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController _convertToUpdatedApplicationLabelIfNeeded:forVersion:](self, "_convertToUpdatedApplicationLabelIfNeeded:forVersion:", v16, v43));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RPNearFieldDaemonController dataSource](self, "dataSource"));
  LODWORD(v48) = -[RPNearFieldDaemonController _flagsForVersion:](self, "_flagsForVersion:", v43);
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "createTapEventWithApplicationLabel:singleBandAWDLModeRequested:pkData:bonjourListenerUUID:identity:isUnsupportedApplicationLabel:flags:", v44, v50, v15, v14, v51, v26, v48));

  return v46;
}

- (unsigned)_flagsForVersion:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("1.1"));
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (id)transactionChangedHandler
{
  return self->_transactionChangedHandler;
}

- (void)setTransactionChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (RPNearFieldContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentContext, a3);
}

- (int64_t)currentPreferredPollingType
{
  return self->_currentPreferredPollingType;
}

- (RPNearFieldDataSource)dataSource
{
  return self->_dataSource;
}

- (RPNFCTransactionController)transactionController
{
  return self->_transactionController;
}

- (void)setCurrentTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransaction, a3);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_transactionController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong(&self->_transactionChangedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
