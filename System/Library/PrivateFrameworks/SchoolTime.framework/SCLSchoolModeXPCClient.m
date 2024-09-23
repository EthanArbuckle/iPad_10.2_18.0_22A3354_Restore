@implementation SCLSchoolModeXPCClient

- (SCLSchoolModeXPCClient)initWithDelegate:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  SCLSchoolModeXPCClient *v8;
  SCLSchoolModeXPCClient *v9;
  kern_return_t v10;
  NSObject *v11;
  SCLSchoolModeServerSettings *v12;
  SCLSchoolModeServerSettings *serverSettings;
  SCLMutableScheduleSettings *v14;
  SCLSchedule *v15;
  SCLState *v16;
  void *v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  _QWORD handler[4];
  id v27;
  id v28;
  id location;
  objc_super v30;
  uint8_t buf[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)SCLSchoolModeXPCClient;
  v8 = -[SCLSchoolModeXPCClient init](&v30, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_configuration, a4);
    v9->_connectionLock._os_unfair_lock_opaque = 0;
    v9->_connectionState = 0;
    v9->_clientState = 0;
    v10 = mach_timebase_info(&v9->_timebase);
    if (v10)
    {
      scl_framework_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SCLSchoolModeXPCClient initWithDelegate:configuration:].cold.2(v7, v10, v11);

    }
    v12 = objc_alloc_init(SCLSchoolModeServerSettings);
    serverSettings = v9->_serverSettings;
    v9->_serverSettings = v12;

    v14 = objc_alloc_init(SCLMutableScheduleSettings);
    v15 = objc_alloc_init(SCLSchedule);
    -[SCLMutableScheduleSettings setSchedule:](v14, "setSchedule:", v15);

    -[SCLSchoolModeServerSettings setScheduleSettings:](v9->_serverSettings, "setScheduleSettings:", v14);
    v16 = -[SCLState initWithActiveState:scheduleEnabled:inSchedule:]([SCLState alloc], "initWithActiveState:scheduleEnabled:inSchedule:", 0, 0, 0);
    -[SCLSchoolModeServerSettings setState:](v9->_serverSettings, "setState:", v16);
    -[SCLSchoolModeXPCClient _makeConnection:](v9, "_makeConnection:", v7);
    objc_msgSend(v7, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v9);
    v18 = (const char *)objc_msgSend(CFSTR("SCLServerStartNotification"), "UTF8String");
    -[SCLSchoolModeXPCClient configuration](v9, "configuration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "targetQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __57__SCLSchoolModeXPCClient_initWithDelegate_configuration___block_invoke;
    handler[3] = &unk_24E29B508;
    v21 = v17;
    v27 = v21;
    objc_copyWeak(&v28, &location);
    v22 = notify_register_dispatch(v18, &v9->_restartNotificationToken, v20, handler);

    if ((_DWORD)v22)
    {
      scl_framework_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCLSchoolModeXPCClient initWithDelegate:configuration:].cold.1((uint64_t)v21, v24, buf, v23);
      }

    }
    objc_destroyWeak(&v28);

    objc_destroyWeak(&location);
  }

  return v9;
}

void __57__SCLSchoolModeXPCClient_initWithDelegate_configuration___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  scl_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_21E4AD000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] received server restart notification", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setLastServerRestartTime:", mach_continuous_time());
  objc_msgSend(WeakRetained, "_reconnectToServer");

}

- (void)dealloc
{
  int restartNotificationToken;
  objc_super v4;

  restartNotificationToken = self->_restartNotificationToken;
  if (restartNotificationToken != -1)
    notify_cancel(restartNotificationToken);
  v4.receiver = self;
  v4.super_class = (Class)SCLSchoolModeXPCClient;
  -[SCLSchoolModeXPCClient dealloc](&v4, sel_dealloc);
}

- (BOOL)_makeConnection:(id)a3
{
  id v4;
  os_unfair_lock_s *p_connectionLock;
  BOOL v6;
  NSXPCConnection *v7;
  NSXPCConnection *connection;
  NSXPCConnection *v9;
  NSXPCConnection *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSXPCConnection *v15;
  NSXPCConnection *v16;
  NSXPCConnection *v17;
  void *v18;
  NSXPCConnection *v19;
  void *v20;
  NSXPCConnection *v21;
  void *v22;
  NSXPCConnection *v23;
  void *v24;
  NSXPCConnection *v25;
  uint64_t v26;
  id v27;
  NSXPCConnection *v28;
  id v29;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id location;

  v4 = a3;
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  if (-[SCLSchoolModeXPCClient clientState](self, "clientState") == 2)
  {
    os_unfair_lock_unlock(&self->_connectionLock);
    v6 = 0;
    v7 = 0;
  }
  else
  {
    if ((unint64_t)(self->_connectionState - 3) <= 1)
    {
      -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", 0);
      -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", 0);
      -[NSXPCConnection invalidate](self->_connection, "invalidate");
      connection = self->_connection;
      self->_connection = 0;

      self->_connectionState = 2;
    }
    v9 = self->_connection;
    v10 = v9;
    if (!v9)
    {
      objc_msgSend(v4, "testingEndpoint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_alloc(MEMORY[0x24BDD1988]);
      v13 = v12;
      if (v11)
      {
        objc_msgSend(v4, "testingEndpoint");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (NSXPCConnection *)objc_msgSend(v13, "initWithListenerEndpoint:", v14);
        v16 = self->_connection;
        self->_connection = v15;

      }
      else
      {
        v17 = (NSXPCConnection *)objc_msgSend(v12, "initWithMachServiceName:options:", CFSTR("com.apple.schooltime.schedule"), 0);
        v14 = self->_connection;
        self->_connection = v17;
      }

      objc_msgSend(v4, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
      v19 = self->_connection;
      SCLSchoolModeClientXPCInterface();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setExportedInterface:](v19, "setExportedInterface:", v20);

      v21 = self->_connection;
      SCLSchoolModeServerXPCInterface();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection setRemoteObjectInterface:](v21, "setRemoteObjectInterface:", v22);

      v23 = self->_connection;
      objc_msgSend(v4, "targetQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSXPCConnection _setQueue:](v23, "_setQueue:", v24);

      objc_initWeak(&location, self);
      v25 = self->_connection;
      v26 = MEMORY[0x24BDAC760];
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __42__SCLSchoolModeXPCClient__makeConnection___block_invoke;
      v34[3] = &unk_24E29B530;
      objc_copyWeak(&v36, &location);
      v27 = v18;
      v35 = v27;
      -[NSXPCConnection setInterruptionHandler:](v25, "setInterruptionHandler:", v34);
      v28 = self->_connection;
      v31[0] = v26;
      v31[1] = 3221225472;
      v31[2] = __42__SCLSchoolModeXPCClient__makeConnection___block_invoke_10;
      v31[3] = &unk_24E29B530;
      objc_copyWeak(&v33, &location);
      v29 = v27;
      v32 = v29;
      -[NSXPCConnection setInvalidationHandler:](v28, "setInvalidationHandler:", v31);

      objc_destroyWeak(&v33);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&location);

      v10 = self->_connection;
    }
    v7 = v10;
    os_unfair_lock_unlock(p_connectionLock);
    if (v9)
    {
      v6 = 0;
    }
    else
    {
      -[NSXPCConnection resume](v7, "resume");
      v6 = 1;
    }
  }

  return v6;
}

void __42__SCLSchoolModeXPCClient__makeConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  scl_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_21E4AD000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Connection was interrupted.", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(WeakRetained, "_connectionDidInterrupt");
}

void __42__SCLSchoolModeXPCClient__makeConnection___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  scl_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __42__SCLSchoolModeXPCClient__makeConnection___block_invoke_10_cold_1(a1, v3, v4);

  objc_msgSend(WeakRetained, "_connectionDidInvalidate");
}

- (void)resume
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3(&dword_21E4AD000, a3, (uint64_t)a3, "Cannot resume an invalidated client %{public}@", (uint8_t *)a2);

}

void __32__SCLSchoolModeXPCClient_resume__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  SCLState *v10;

  v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 40);
  scl_framework_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
      __32__SCLSchoolModeXPCClient_resume__block_invoke_cold_2();

  }
  else
  {
    if (v9)
      __32__SCLSchoolModeXPCClient_resume__block_invoke_cold_1();

    v10 = -[SCLState initWithActiveState:scheduleEnabled:inSchedule:]([SCLState alloc], "initWithActiveState:scheduleEnabled:inSchedule:", 0, 0, 0);
    objc_msgSend(v4, "setState:", v10);

    objc_msgSend(*(id *)(a1 + 32), "applyServerSettings:", v4);
  }

}

void __32__SCLSchoolModeXPCClient_resume__block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
  {
    scl_framework_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21E4AD000, v4, OS_LOG_TYPE_INFO, "synchronous, updating server settings before applying", v7, 2u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(v3, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setState:", v6);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  }
  objc_msgSend(*(id *)(a1 + 32), "applyServerSettings:", v3);

}

- (void)_reconnectToServer
{
  NSObject *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  unint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v11;
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = _os_activity_create(&dword_21E4AD000, "Reconnect SCLSchoolMode", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v3, &v12);
  -[SCLSchoolModeConfiguration identifier](self->_configuration, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSchoolModeXPCClient configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCLSchoolModeXPCClient _makeConnection:](self, "_makeConnection:", v5);

  os_unfair_lock_lock(&self->_connectionLock);
  v7 = -[SCLSchoolModeXPCClient clientState](self, "clientState");
  os_unfair_lock_unlock(&self->_connectionLock);
  scl_framework_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 2)
      v9 = &stru_24E29C4C8;
    else
      v9 = off_24E29B698[v7];
    *(_DWORD *)buf = 138543874;
    v14 = v4;
    v15 = 1024;
    v16 = v6;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_21E4AD000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] made new connection for reconnect: %{BOOL}d; clientState: %@",
      buf,
      0x1Cu);
  }

  if (v7 == 1 && v6)
  {
    scl_framework_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v4;
      _os_log_impl(&dword_21E4AD000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] new connection and previously running, resuming", buf, 0xCu);
    }

    -[SCLSchoolModeXPCClient resume](self, "resume");
  }

  os_activity_scope_leave(&v12);
}

- (SCLState)state
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SCLSchoolModeServerSettings state](self->_serverSettings, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (SCLState *)v4;
}

- (SCLScheduleSettings)scheduleSettings
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[SCLSchoolModeServerSettings scheduleSettings](self->_serverSettings, "scheduleSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (SCLScheduleSettings *)v4;
}

- (BOOL)isLoaded
{
  SCLSchoolModeXPCClient *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = -[SCLSchoolModeServerSettings isLoaded](v2->_serverSettings, "isLoaded");
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  os_unfair_lock_s *p_connectionLock;
  id v4;

  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  -[SCLSchoolModeXPCClient setClientState:](self, "setClientState:", 2);
  notify_cancel(self->_restartNotificationToken);
  self->_restartNotificationToken = -1;
  -[SCLSchoolModeXPCClient connection](self, "connection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterruptionHandler:", 0);
  objc_msgSend(v4, "setInvalidationHandler:", 0);
  os_unfair_lock_unlock(p_connectionLock);
  objc_msgSend(v4, "invalidate");

}

- (void)applyScheduleSettings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __59__SCLSchoolModeXPCClient_applyScheduleSettings_completion___block_invoke;
  v11[3] = &unk_24E29B5A8;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  -[SCLSchoolModeXPCClient serverWithErrorHandler:](self, "serverWithErrorHandler:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "copy");

  objc_msgSend(v9, "applySchedule:completion:", v10, v7);
}

uint64_t __59__SCLSchoolModeXPCClient_applyScheduleSettings_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setActive:(BOOL)a3 options:(unint64_t)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;

  v6 = a3;
  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __55__SCLSchoolModeXPCClient_setActive_options_completion___block_invoke;
  v16[3] = &unk_24E29B5D0;
  v16[4] = self;
  v18 = v6;
  v10 = v8;
  v17 = v10;
  -[SCLSchoolModeXPCClient serverWithErrorHandler:](self, "serverWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __55__SCLSchoolModeXPCClient_setActive_options_completion___block_invoke_14;
  v13[3] = &unk_24E29B5F8;
  v15 = v6;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "setActive:options:completion:", v6, a4, v13);

}

void __55__SCLSchoolModeXPCClient_setActive_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  scl_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(unsigned __int8 *)(a1 + 48);
    v8 = 138412802;
    v9 = v6;
    v10 = 1024;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_21E4AD000, v4, OS_LOG_TYPE_INFO, "[%@] setActive %{BOOL}u error %@", (uint8_t *)&v8, 0x1Cu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __55__SCLSchoolModeXPCClient_setActive_options_completion___block_invoke_14(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  scl_framework_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 48);
    v10 = 138413058;
    v11 = v8;
    v12 = 1024;
    v13 = v9;
    v14 = 1024;
    v15 = a2;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_INFO, "[%@] setActive %{BOOL}u success %{BOOL}u error %@", (uint8_t *)&v10, 0x22u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fetchRecentUnlockHistoryItemsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__SCLSchoolModeXPCClient_fetchRecentUnlockHistoryItemsWithCompletion___block_invoke;
  v7[3] = &unk_24E29B5A8;
  v8 = v4;
  v5 = v4;
  -[SCLSchoolModeXPCClient serverWithErrorHandler:](self, "serverWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRecentUnlockHistoryItemsWithCompletion:", v5);

}

uint64_t __70__SCLSchoolModeXPCClient_fetchRecentUnlockHistoryItemsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addUnlockHistoryItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__SCLSchoolModeXPCClient_addUnlockHistoryItem_completion___block_invoke;
  v10[3] = &unk_24E29B5A8;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[SCLSchoolModeXPCClient serverWithErrorHandler:](self, "serverWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addUnlockHistoryItem:completion:", v8, v7);

}

uint64_t __58__SCLSchoolModeXPCClient_addUnlockHistoryItem_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deleteHistoryWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__SCLSchoolModeXPCClient_deleteHistoryWithCompletion___block_invoke;
  v7[3] = &unk_24E29B5A8;
  v8 = v4;
  v5 = v4;
  -[SCLSchoolModeXPCClient serverWithErrorHandler:](self, "serverWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteHistoryWithCompletion:", v5);

}

uint64_t __54__SCLSchoolModeXPCClient_deleteHistoryWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)noteSignificantUserInteraction
{
  id v2;

  -[SCLSchoolModeXPCClient serverWithErrorHandler:](self, "serverWithErrorHandler:", &__block_literal_global_0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteSignificantUserInteraction");

}

- (void)triggerRemoteSync
{
  id v2;

  -[SCLSchoolModeXPCClient serverWithErrorHandler:](self, "serverWithErrorHandler:", &__block_literal_global_16);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "triggerRemoteSync");

}

- (void)dumpState
{
  id v2;

  -[SCLSchoolModeXPCClient serverWithErrorHandler:](self, "serverWithErrorHandler:", &__block_literal_global_17);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dumpState");

}

- (id)serverWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SCLSchoolModeXPCClient configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCLSchoolModeXPCClient _makeConnection:](self, "_makeConnection:", v5);

  if (v6)
    -[SCLSchoolModeXPCClient resume](self, "resume");
  -[SCLSchoolModeXPCClient connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_connectionDidInvalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  scl_framework_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SCLSchoolModeXPCClient configuration](self, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLSchoolModeXPCClient configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pairingID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_21E4AD000, v3, OS_LOG_TYPE_DEFAULT, "Marking connection as interrupted and NOT reconnecting %@ - %@", (uint8_t *)&v8, 0x16u);

  }
  os_unfair_lock_lock(&self->_connectionLock);
  self->_connectionState = 4;
  os_unfair_lock_unlock(&self->_connectionLock);
}

- (void)_connectionDidInterrupt
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[SCLSchoolModeXPCClient configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[SCLSchoolModeXPCClient lastServerRestartTime](self, "lastServerRestartTime")
    && (v5 = mach_continuous_time(),
        (v5 - -[SCLSchoolModeXPCClient lastServerRestartTime](self, "lastServerRestartTime"))
      * self->_timebase.numer
      / self->_timebase.denom <= 0x773593FF))
  {
    scl_framework_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[SCLSchoolModeXPCClient configuration](self, "configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLSchoolModeXPCClient configuration](self, "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pairingID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_DEFAULT, "Marking connection as interrupted and reconnecting %@ - %@ because server recently restarted", (uint8_t *)&v16, 0x16u);

    }
    os_unfair_lock_lock(&self->_connectionLock);
    self->_connectionState = 3;
    os_unfair_lock_unlock(&self->_connectionLock);
    -[SCLSchoolModeXPCClient _reconnectToServer](self, "_reconnectToServer");
  }
  else
  {
    scl_framework_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[SCLSchoolModeXPCClient configuration](self, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLSchoolModeXPCClient configuration](self, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pairingID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_21E4AD000, v11, OS_LOG_TYPE_DEFAULT, "Marking connection as interrupted and NOT reconnecting %@ - %@", (uint8_t *)&v16, 0x16u);

    }
    os_unfair_lock_lock(&self->_connectionLock);
    self->_connectionState = 3;
    os_unfair_lock_unlock(&self->_connectionLock);
  }
}

- (void)applyServerSettings:(id)a3
{
  id v4;
  SCLSchoolModeServerSettings *v5;
  SCLSchoolModeServerSettings *v6;
  SCLSchoolModeServerSettings *serverSettings;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_serverSettings;
  v6 = (SCLSchoolModeServerSettings *)objc_msgSend(v4, "copy");
  serverSettings = self->_serverSettings;
  self->_serverSettings = v6;

  os_unfair_lock_unlock(&self->_lock);
  -[SCLSchoolModeServerSettings state](v5, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  scl_framework_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    -[SCLSchoolModeXPCClient configuration](self, "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v12;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_21E4AD000, v10, OS_LOG_TYPE_INFO, "[%{public}@] Applying server settings, oldState %@, newState %@", (uint8_t *)&v18, 0x20u);

  }
  if (v8 != v9 && (objc_msgSend(v8, "isEqual:", v9) & 1) == 0)
  {
    -[SCLSchoolModeXPCClient delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "client:didUpdateToState:fromState:", self, v9, v8);

  }
  -[SCLSchoolModeServerSettings scheduleSettings](v5, "scheduleSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SCLSchoolModeServerSettings isLoaded](v5, "isLoaded") && objc_msgSend(v4, "isLoaded"))
  {
    -[SCLSchoolModeXPCClient delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "client:didLoadScheduleSettings:", self, v15);

  }
  if ((objc_msgSend(v14, "isEqual:", v15) & 1) == 0
    && -[SCLSchoolModeServerSettings isLoaded](v5, "isLoaded")
    && objc_msgSend(v4, "isLoaded"))
  {
    -[SCLSchoolModeXPCClient delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "client:didUpdateScheduleSettings:", self, v15);

  }
}

- (void)didChangeUnlockHistory
{
  id v3;

  -[SCLSchoolModeXPCClient delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDidChangeUnlockHistory:", self);

}

- (SCLSchoolModeXPCClientDelegate)delegate
{
  return (SCLSchoolModeXPCClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (SCLSchoolModeConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (int64_t)connectionState
{
  return self->_connectionState;
}

- (void)setConnectionState:(int64_t)a3
{
  self->_connectionState = a3;
}

- (int64_t)clientState
{
  return self->_clientState;
}

- (void)setClientState:(int64_t)a3
{
  self->_clientState = a3;
}

- (unint64_t)lastServerRestartTime
{
  return self->_lastServerRestartTime;
}

- (void)setLastServerRestartTime:(unint64_t)a3
{
  self->_lastServerRestartTime = a3;
}

- (mach_timebase_info)timebase
{
  return self->_timebase;
}

- (void)setTimebase:(mach_timebase_info)a3
{
  self->_timebase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverSettings, 0);
}

- (void)initWithDelegate:(uint8_t *)buf configuration:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_21E4AD000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Could not register for server restart notification: %@", buf, 0x16u);

}

- (void)initWithDelegate:(NSObject *)a3 configuration:.cold.2(void *a1, int a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 1024;
  v9 = a2;
  _os_log_error_impl(&dword_21E4AD000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Error getting timebase info: %{errno}d", (uint8_t *)&v6, 0x12u);

}

void __42__SCLSchoolModeXPCClient__makeConnection___block_invoke_10_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_3(&dword_21E4AD000, a2, a3, "[%{public}@] Connection was invalidated remotely.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __32__SCLSchoolModeXPCClient_resume__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E4AD000, v0, v1, "[%{public}@] Failed to get initial settings for school mode: %@");
  OUTLINED_FUNCTION_2();
}

void __32__SCLSchoolModeXPCClient_resume__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E4AD000, v0, v1, "[%{public}@] Failed to get settings for reconnecting to school mode: %@");
  OUTLINED_FUNCTION_2();
}

@end
