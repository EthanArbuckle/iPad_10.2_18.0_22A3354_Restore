@implementation BYBuddyDaemonCloudSyncClient

- (BYBuddyDaemonCloudSyncClient)init
{
  BYBuddyDaemonCloudSyncClient *v2;
  BYBuddyDaemonCloudSyncClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BYBuddyDaemonCloudSyncClient;
  v2 = -[BYBuddyDaemonCloudSyncClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BYBuddyDaemonCloudSyncClient connectToDaemon](v2, "connectToDaemon");
  return v3;
}

+ (id)clientInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78EBA0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_syncCompletedWithErrors_, 0, 0);

  return v2;
}

- (void)needsToSync:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BYBuddyDaemonCloudSyncClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "needsToSync:", v4);

}

- (void)startSync
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[BYBuddyDaemonCloudSyncClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__BYBuddyDaemonCloudSyncClient_startSync__block_invoke_53;
  v5[3] = &unk_1E4E26958;
  v5[4] = self;
  objc_msgSend(v4, "startSync:", v5);

}

void __41__BYBuddyDaemonCloudSyncClient_startSync__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  NSObject *v4;
  int v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v5 = 0;
      v6 = v3;
    }
    else if (v3)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "domain");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(v3, "code"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 1;
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Failed to communicate with daemon for cloud sync: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

uint64_t __41__BYBuddyDaemonCloudSyncClient_startSync__block_invoke_53(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSyncDidStart:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setSyncDidComplete:", 0);
}

- (void)cancelSync
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[BYBuddyDaemonCloudSyncClient connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_55);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__BYBuddyDaemonCloudSyncClient_cancelSync__block_invoke_56;
  v5[3] = &unk_1E4E26958;
  v5[4] = self;
  objc_msgSend(v4, "cancelSync:", v5);

}

void __42__BYBuddyDaemonCloudSyncClient_cancelSync__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  NSObject *v4;
  int v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v5 = 0;
      v6 = v3;
    }
    else if (v3)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "domain");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(v3, "code"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 1;
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Failed to communicate with daemon for cloud sync: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

uint64_t __42__BYBuddyDaemonCloudSyncClient_cancelSync__block_invoke_56(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSyncDidStart:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setSyncDidComplete:", 0);
}

- (void)isSyncInProgress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[BYBuddyDaemonCloudSyncClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__BYBuddyDaemonCloudSyncClient_isSyncInProgress___block_invoke;
  v8[3] = &unk_1E4E26A50;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "isSyncInProgress:", v8);

}

uint64_t __49__BYBuddyDaemonCloudSyncClient_isSyncInProgress___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchCurrentSyncState:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BYBuddyDaemonCloudSyncClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isSyncInProgress:", v4);

}

- (void)cloudSyncProgressUpdate:(int64_t)a3 completedClients:(int64_t)a4 errors:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  -[BYBuddyDaemonCloudSyncClient connection](self, "connection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_58);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cloudSyncProgressUpdate:completedClients:errors:completion:", a3, a4, v8, &__block_literal_global_60);

}

void __80__BYBuddyDaemonCloudSyncClient_cloudSyncProgressUpdate_completedClients_errors___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  NSObject *v4;
  int v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _BYLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v5 = 0;
      v6 = v3;
    }
    else if (v3)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v3, "domain");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v2, objc_msgSend(v3, "code"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 1;
    }
    else
    {
      v5 = 0;
      v6 = 0;
    }
    *(_DWORD *)buf = 138543362;
    v9 = v6;
    _os_log_error_impl(&dword_1A4E92000, v4, OS_LOG_TYPE_ERROR, "Failed to communicate with daemon for cloud sync: %{public}@", buf, 0xCu);
    if (v5)
    {

    }
  }

}

- (void)connectToDaemon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.purplebuddy.budd.cloud.xpc"), 0);
  -[BYBuddyDaemonCloudSyncClient setConnection:](self, "setConnection:", v3);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE799770);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYBuddyDaemonCloudSyncClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v4);

  objc_msgSend((id)objc_opt_class(), "clientInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYBuddyDaemonCloudSyncClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v6);

  -[BYBuddyDaemonCloudSyncClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedObject:", self);

  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__BYBuddyDaemonCloudSyncClient_connectToDaemon__block_invoke;
  v15[3] = &unk_1E4E269A8;
  objc_copyWeak(&v16, &location);
  v15[4] = self;
  -[BYBuddyDaemonCloudSyncClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInvalidationHandler:", v15);

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __47__BYBuddyDaemonCloudSyncClient_connectToDaemon__block_invoke_76;
  v13[3] = &unk_1E4E269A8;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  -[BYBuddyDaemonCloudSyncClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInterruptionHandler:", v13);

  -[BYBuddyDaemonCloudSyncClient connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __47__BYBuddyDaemonCloudSyncClient_connectToDaemon__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Cloud sync client connection invalidated!", v7, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "syncDidStart")
    && (objc_msgSend(*(id *)(a1 + 32), "syncDidComplete") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BYCloudSyncErrorDomain"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncCompletedWithErrors:", v6);

  }
}

void __47__BYBuddyDaemonCloudSyncClient_connectToDaemon__block_invoke_76(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Cloud sync client connection interruption!", v7, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "syncDidStart")
    && (objc_msgSend(*(id *)(a1 + 32), "syncDidComplete") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BYCloudSyncErrorDomain"), 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "syncCompletedWithErrors:", v6);

  }
}

- (void)syncProgress:(double)a3
{
  id v4;

  -[BYBuddyDaemonCloudSyncClient delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncProgress:", a3);

}

- (void)syncCompletedWithErrors:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BYBuddyDaemonCloudSyncClient setSyncDidComplete:](self, "setSyncDidComplete:", 1);
  -[BYBuddyDaemonCloudSyncClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncCompletedWithErrors:", v4);

}

- (BYClientDaemonCloudSyncProtocol)delegate
{
  return (BYClientDaemonCloudSyncProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)syncDidStart
{
  return self->_syncDidStart;
}

- (void)setSyncDidStart:(BOOL)a3
{
  self->_syncDidStart = a3;
}

- (BOOL)syncDidComplete
{
  return self->_syncDidComplete;
}

- (void)setSyncDidComplete:(BOOL)a3
{
  self->_syncDidComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
