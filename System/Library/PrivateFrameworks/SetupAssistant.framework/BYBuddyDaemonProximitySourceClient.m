@implementation BYBuddyDaemonProximitySourceClient

- (BYBuddyDaemonProximitySourceClient)init
{
  BYBuddyDaemonProximitySourceClient *v2;
  BYBuddyDaemonProximitySourceClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BYBuddyDaemonProximitySourceClient;
  v2 = -[BYBuddyDaemonProximitySourceClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BYBuddyDaemonProximitySourceClient connectToDaemon](v2, "connectToDaemon");
  return v3;
}

+ (id)proximitySourceClientInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE794B68);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_syncCompletedWithErrors_, 0, 0);

  return v2;
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
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.purplebuddy.budd.proximity.source.xpc"), 0);
  -[BYBuddyDaemonProximitySourceClient setConnection:](self, "setConnection:", v3);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7952B8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYBuddyDaemonProximitySourceClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v4);

  objc_msgSend((id)objc_opt_class(), "proximitySourceClientInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BYBuddyDaemonProximitySourceClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v6);

  -[BYBuddyDaemonProximitySourceClient connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExportedObject:", self);

  objc_initWeak(&location, self);
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__BYBuddyDaemonProximitySourceClient_connectToDaemon__block_invoke;
  v15[3] = &unk_1E4E26980;
  objc_copyWeak(&v16, &location);
  -[BYBuddyDaemonProximitySourceClient connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInvalidationHandler:", v15);

  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __53__BYBuddyDaemonProximitySourceClient_connectToDaemon__block_invoke_65;
  v13[3] = &unk_1E4E26980;
  objc_copyWeak(&v14, &location);
  -[BYBuddyDaemonProximitySourceClient connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInterruptionHandler:", v13);

  -[BYBuddyDaemonProximitySourceClient connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __53__BYBuddyDaemonProximitySourceClient_connectToDaemon__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  uint8_t v6[16];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Proximity source client connection invalidated!", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BYBuddyDaemonProximitySourceClientErrorDomain"), -1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishedWithError:", v3);

}

void __53__BYBuddyDaemonProximitySourceClient_connectToDaemon__block_invoke_65(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  uint8_t v6[16];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Proximity source client connection interruption!", v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("BYBuddyDaemonProximitySourceClientErrorDomain"), -2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishedWithError:", v3);

}

- (void)activateWithSharingChannel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BYBuddyDaemonProximitySourceClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateWithSharingChannel:", v4);

}

- (void)invalidate
{
  void *v2;
  id v3;

  -[BYBuddyDaemonProximitySourceClient connection](self, "connection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)receivedData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BYBuddyDaemonProximitySourceClient connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "receivedData:", v4);

}

- (void)finishedWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BYBuddyDaemonProximitySourceClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishedWithError:", v4);

}

- (void)backupProgress:(double)a3 estimatedTimeRemaining:(int64_t)a4
{
  id v6;

  -[BYBuddyDaemonProximitySourceClient delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backupProgress:estimatedTimeRemaining:", a4, a3);

}

- (void)backupCompletedWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BYBuddyDaemonProximitySourceClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backupCompletedWithError:", v4);

}

- (void)syncProgress:(double)a3
{
  id v4;

  -[BYBuddyDaemonProximitySourceClient delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncProgress:", a3);

}

- (void)syncCompletedWithErrors:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BYBuddyDaemonProximitySourceClient delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncCompletedWithErrors:", v4);

}

- (BYBuddyDaemonProximitySourceProtocol)delegate
{
  return (BYBuddyDaemonProximitySourceProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
