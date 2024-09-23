@implementation SOSStatusReporter

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SOSStatusReporter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, block);
  return (id)sharedInstance_sosStatusReporter;
}

void __35__SOSStatusReporter_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sosStatusReporter;
  sharedInstance_sosStatusReporter = (uint64_t)v1;

}

- (SOSStatusReporter)init
{
  SOSStatusReporter *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  id v7;
  SOSStatusReporter *v8;
  _QWORD handler[4];
  id v11;
  id buf[2];
  objc_super v13;

  if (+[SOSEntitlement currentProcessHasEntitlement:](SOSEntitlement, "currentProcessHasEntitlement:", CFSTR("com.apple.sos.trigger")))
  {
    v13.receiver = self;
    v13.super_class = (Class)SOSStatusReporter;
    v3 = -[SOSStatusReporter init](&v13, sel_init);
    if (v3)
    {
      sos_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "initializing SOSStatusReporter", (uint8_t *)buf, 2u);
      }

      v3->_flowState = 0;
      objc_initWeak(buf, v3);
      v5 = SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME;
      v6 = MEMORY[0x1E0C80D38];
      v7 = MEMORY[0x1E0C80D38];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __25__SOSStatusReporter_init__block_invoke;
      handler[3] = &unk_1E5F76CA8;
      objc_copyWeak(&v11, buf);
      notify_register_dispatch(v5, &v3->_connectionRequestNotificationToken, v6, handler);

      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
    }
    self = v3;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __25__SOSStatusReporter_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _BYTE v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)&v4[4] = SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by requesting current state", v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(_QWORD *)v4 = 0;
  notify_get_state(objc_msgSend(WeakRetained, "connectionRequestNotificationToken"), (uint64_t *)v4);
  if (*(_QWORD *)v4)
    objc_msgSend(WeakRetained, "handleSosdLaunch");

}

- (void)handleSosdLaunch
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[SOSStatusReporter flowState](self, "flowState"))
  {
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      SOSStringForSOSFlowState(-[SOSStatusReporter flowState](self, "flowState"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOSStatusReporter, sosd launched, updating state %@", (uint8_t *)&v5, 0xCu);

    }
    -[SOSStatusReporter _updateSOSFlowState](self, "_updateSOSFlowState");
  }
}

- (void)updateSOSFlowState:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__SOSStatusReporter_updateSOSFlowState___block_invoke;
  v3[3] = &unk_1E5F76C80;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

uint64_t __40__SOSStatusReporter_updateSOSFlowState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    SOSStringForSOSFlowState(*(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "SOSStatusReporter, updateSOSFlowState with state %@", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setFlowState:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateSOSFlowState");
}

- (void)_updateSOSFlowState
{
  void *v3;
  id v4;

  -[SOSStatusReporter connection](self, "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateSOSFlowState:", -[SOSStatusReporter flowState](self, "flowState"));

}

void __40__SOSStatusReporter__updateSOSFlowState__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__SOSStatusReporter__updateSOSFlowState__block_invoke_cold_1((uint64_t)v2, v3);

}

- (void)setConnection:(id)a3
{
  NSXPCConnection *v5;
  NSObject *v6;
  NSXPCConnection *v7;
  NSXPCConnection **p_connection;
  NSXPCConnection *connection;
  uint8_t v10[16];

  v5 = (NSXPCConnection *)a3;
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSStatusReporter, setting connection", v10, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  connection = self->_connection;
  p_connection = &self->_connection;
  v7 = connection;
  if (connection != v5)
  {
    if (v7)
    {
      -[NSXPCConnection invalidate](v7, "invalidate");
      -[NSXPCConnection setInvalidationHandler:](*p_connection, "setInvalidationHandler:", 0);
      -[NSXPCConnection setInterruptionHandler:](*p_connection, "setInterruptionHandler:", 0);
    }
    objc_storeStrong((id *)p_connection, a3);
  }

}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.sos.status"), 4096);
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    SOSStatusManagerServerInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    v8 = self->_connection;
    SOSStatusManagerClientInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_4);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __31__SOSStatusReporter_connection__block_invoke_5;
    v14 = &unk_1E5F76638;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", &v11);
    -[NSXPCConnection resume](self->_connection, "resume", v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __31__SOSStatusReporter_connection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  sos_default_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AF4DC000, v0, OS_LOG_TYPE_DEFAULT, "SOSStatusReporter, connection interrupted", v1, 2u);
  }

}

void __31__SOSStatusReporter_connection__block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  uint8_t buf[16];

  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "SOSStatusReporter, connection invalidated", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SOSStatusReporter_connection__block_invoke_6;
  block[3] = &unk_1E5F76638;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __31__SOSStatusReporter_connection__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnection:", 0);

}

- (int)connectionRequestNotificationToken
{
  return self->_connectionRequestNotificationToken;
}

- (void)setConnectionRequestNotificationToken:(int)a3
{
  self->_connectionRequestNotificationToken = a3;
}

- (int64_t)flowState
{
  return self->_flowState;
}

- (void)setFlowState:(int64_t)a3
{
  self->_flowState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __40__SOSStatusReporter__updateSOSFlowState__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AF4DC000, a2, OS_LOG_TYPE_ERROR, "Could not send a flow state update due to connection error %@", (uint8_t *)&v2, 0xCu);
}

@end
