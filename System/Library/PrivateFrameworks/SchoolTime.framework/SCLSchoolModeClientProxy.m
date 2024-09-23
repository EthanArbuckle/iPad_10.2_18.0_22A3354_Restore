@implementation SCLSchoolModeClientProxy

- (SCLSchoolModeClientProxy)initWithConnection:(id)a3
{
  id v5;
  SCLSchoolModeClientProxy *v6;
  SCLSchoolModeClientProxy *v7;
  NSXPCConnection *connection;
  void *v9;
  NSXPCConnection *v10;
  void *v11;
  NSXPCConnection *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SCLSchoolModeClientProxy;
  v6 = -[SCLSchoolModeClientProxy init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    -[NSXPCConnection setExportedObject:](v7->_connection, "setExportedObject:", v7);
    connection = v7->_connection;
    SCLSchoolModeServerXPCInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](connection, "setExportedInterface:", v9);

    v10 = v7->_connection;
    SCLSchoolModeClientXPCInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v10, "setRemoteObjectInterface:", v11);

    objc_initWeak(&location, v7);
    v12 = v7->_connection;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __47__SCLSchoolModeClientProxy_initWithConnection___block_invoke;
    v14[3] = &unk_24E29B8C0;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInvalidationHandler:](v12, "setInvalidationHandler:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __47__SCLSchoolModeClientProxy_initWithConnection___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clientProxyDidInvalidate:", WeakRetained);

}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeClientProxy pairingID](self, "pairingID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("pairingID"));

  -[SCLSchoolModeClientProxy identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("identifier"));

  v8 = (id)objc_msgSend(v3, "appendInt:withName:", -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier"), CFSTR("pid"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)connectWithPairingID:(id)a3 identifier:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *, _QWORD);
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  SCLSchoolModeClientProxy *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(id, void *, _QWORD))a5;
  v9 = a4;
  v10 = a3;
  scl_framework_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, self);

  scl_framework_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v19 = 134217984;
    v20 = self;
    _os_signpost_emit_with_name_impl(&dword_21E4AD000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "Connect Client", "Client: %p", (uint8_t *)&v19, 0xCu);
  }

  -[SCLSchoolModeClientProxy setPairingID:](self, "setPairingID:", v10);
  -[SCLSchoolModeClientProxy setIdentifier:](self, "setIdentifier:", v9);

  -[SCLSchoolModeClientProxy delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clientProxy:didConnectWithPairingID:", self, v10);

  -[SCLSchoolModeClientProxy serverSettings](self, "serverSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v16, 0);

  scl_framework_log();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    v19 = 134217984;
    v20 = self;
    _os_signpost_emit_with_name_impl(&dword_21E4AD000, v18, OS_SIGNPOST_INTERVAL_END, v12, "Connect Client", "Client: %p", (uint8_t *)&v19, 0xCu);
  }

}

- (void)applySchedule:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, id);
  BOOL v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  v17 = 0;
  v8 = -[SCLSchoolModeClientProxy validateBooleanEntitlement:error:](self, "validateBooleanEntitlement:error:", CFSTR("com.apple.schooltime.setschedule"), &v17);
  v9 = v17;
  v10 = v9;
  if (v8)
  {
    v16 = v9;
    v11 = -[SCLSchoolModeClientProxy validatePairing:](self, "validatePairing:", &v16);
    v12 = v16;

    if (v11)
    {
      -[SCLSchoolModeClientProxy coordinator](self, "coordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12;
      v14 = objc_msgSend(v13, "applySchedule:error:", v6, &v15);
      v10 = v15;

      v7[2](v7, v14, v10);
    }
    else
    {
      v7[2](v7, 0, v12);
      v10 = v12;
    }
  }
  else
  {
    v7[2](v7, 0, v9);
  }

}

- (void)setActive:(BOOL)a3 options:(unint64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(id, uint64_t, id);
  BOOL v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v8 = (void (**)(id, uint64_t, id))a5;
  v15 = 0;
  v9 = -[SCLSchoolModeClientProxy validatePairing:](self, "validatePairing:", &v15);
  v10 = v15;
  if (v9)
  {
    -[SCLSchoolModeClientProxy coordinator](self, "coordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10;
    v12 = objc_msgSend(v11, "setActive:options:error:", v6, a4, &v14);
    v13 = v14;

    v8[2](v8, v12, v13);
    v10 = v13;
  }
  else
  {
    v8[2](v8, 0, v10);
  }

}

- (void)addUnlockHistoryItem:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  BOOL v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v15 = 0;
  v8 = -[SCLSchoolModeClientProxy validateBooleanEntitlement:error:](self, "validateBooleanEntitlement:error:", CFSTR("com.apple.schooltime.edithistory"), &v15);
  v9 = v15;
  v10 = v9;
  if (v8)
  {
    v14 = v9;
    v11 = -[SCLSchoolModeClientProxy validatePairing:](self, "validatePairing:", &v14);
    v12 = v14;

    if (v11)
    {
      -[SCLSchoolModeClientProxy coordinator](self, "coordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addUnlockHistoryItem:completion:", v6, v7);

    }
    else
    {
      v7[2](v7, 0, v12);
    }
    v10 = v12;
  }
  else
  {
    v7[2](v7, 0, v9);
  }

}

- (void)deleteHistoryWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  BOOL v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v4 = (void (**)(id, _QWORD, id))a3;
  v12 = 0;
  v5 = -[SCLSchoolModeClientProxy validateBooleanEntitlement:error:](self, "validateBooleanEntitlement:error:", CFSTR("com.apple.schooltime.edithistory"), &v12);
  v6 = v12;
  v7 = v6;
  if (v5)
  {
    v11 = v6;
    v8 = -[SCLSchoolModeClientProxy validatePairing:](self, "validatePairing:", &v11);
    v9 = v11;

    if (v8)
    {
      -[SCLSchoolModeClientProxy coordinator](self, "coordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "deleteHistoryWithCompletion:", v4);

    }
    else
    {
      v4[2](v4, 0, v9);
    }
    v7 = v9;
  }
  else
  {
    v4[2](v4, 0, v6);
  }

}

- (void)fetchRecentUnlockHistoryItemsWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  BOOL v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v4 = (void (**)(id, _QWORD, id))a3;
  v12 = 0;
  v5 = -[SCLSchoolModeClientProxy validateBooleanEntitlement:error:](self, "validateBooleanEntitlement:error:", CFSTR("com.apple.schooltime.unlockhistory"), &v12);
  v6 = v12;
  v7 = v6;
  if (v5)
  {
    v11 = v6;
    v8 = -[SCLSchoolModeClientProxy validatePairing:](self, "validatePairing:", &v11);
    v9 = v11;

    if (v8)
    {
      -[SCLSchoolModeClientProxy coordinator](self, "coordinator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fetchRecentUnlockHistoryItemsWithCompletion:", v4);

    }
    else
    {
      v4[2](v4, MEMORY[0x24BDBD1A8], v9);
    }
    v7 = v9;
  }
  else
  {
    v4[2](v4, MEMORY[0x24BDBD1A8], v6);
  }

}

- (void)triggerRemoteSync
{
  void *v2;
  void *v3;
  id v4;

  -[SCLSchoolModeClientProxy coordinator](self, "coordinator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestRemoteSettings");

}

- (void)dumpState
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E4AD000, log, (os_log_type_t)0x90u, "State dump", v1, 2u);
}

- (void)noteSignificantUserInteraction
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[SCLSchoolModeClientProxy coordinator](self, "coordinator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingsSyncCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "noteSignificantUserInteractionOccured");

}

- (BOOL)validateBooleanEntitlement:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  -[SCLSchoolModeClientProxy connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForEntitlement:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    v9 = 1;
  }
  else if (a4)
  {
    SCLEntitlementError((uint64_t)v6);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)validatePairing:(id *)a3
{
  void *v5;
  char v6;
  void *v7;

  -[SCLSchoolModeClientProxy coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isReady");

  if (a3 && (v6 & 1) == 0)
  {
    -[SCLSchoolModeClientProxy pairingID](self, "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SCLPairingUnavailableError((uint64_t)v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)serverSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  SCLSchoolModeServerSettings *v9;

  -[SCLSchoolModeClientProxy coordinator](self, "coordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLSchoolModeClientProxy coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLSchoolModeClientProxy coordinator](self, "coordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isReady");

  v9 = objc_alloc_init(SCLSchoolModeServerSettings);
  -[SCLSchoolModeServerSettings setState:](v9, "setState:", v4);
  -[SCLSchoolModeServerSettings setScheduleSettings:](v9, "setScheduleSettings:", v6);
  -[SCLSchoolModeServerSettings setLoaded:](v9, "setLoaded:", v8);

  return v9;
}

- (void)sendServerSettings:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCLSchoolModeClientProxy remoteClient](self, "remoteClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applyServerSettings:", v4);

}

- (id)remoteClient
{
  void *v2;
  void *v3;

  -[SCLSchoolModeClientProxy connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didUpdateScheduleSettings:(id)a3 notify:(BOOL)a4
{
  id v5;

  -[SCLSchoolModeClientProxy serverSettings](self, "serverSettings", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeClientProxy sendServerSettings:](self, "sendServerSettings:", v5);

}

- (void)didUpdateState:(id)a3 fromState:(id)a4
{
  id v5;

  -[SCLSchoolModeClientProxy serverSettings](self, "serverSettings", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeClientProxy sendServerSettings:](self, "sendServerSettings:", v5);

}

- (void)unlockHistoryDidChange
{
  id v2;

  -[SCLSchoolModeClientProxy remoteClient](self, "remoteClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didChangeUnlockHistory");

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSUUID)pairingID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPairingID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (SCLSchoolModeCoordinator)coordinator
{
  return (SCLSchoolModeCoordinator *)objc_loadWeakRetained((id *)&self->_coordinator);
}

- (void)setCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_coordinator, a3);
}

- (SCLSchoolModeClientProxyDelegate)delegate
{
  return (SCLSchoolModeClientProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_pairingID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
