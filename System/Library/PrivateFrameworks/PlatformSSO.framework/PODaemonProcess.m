@implementation PODaemonProcess

- (PODaemonProcess)init
{
  PODaemonProcess *v2;
  PODaemonProcess *v3;
  PODirectoryServices *v4;
  PODirectoryServices *directoryServices;
  POUserGroupManager *v6;
  void *v7;
  uint64_t v8;
  POUserGroupManager *userGroupManager;
  id v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PODaemonProcess;
  v2 = -[PODaemonCoreProcess initForBaseSystem:](&v13, sel_initForBaseSystem_, 0);
  v3 = v2;
  if (v2)
  {
    v2->_dataVaultInitialized = 0;
    v4 = objc_alloc_init(PODirectoryServices);
    directoryServices = v3->_directoryServices;
    v3->_directoryServices = v4;

    v6 = [POUserGroupManager alloc];
    -[PODaemonCoreProcess _defaultConfigurationPath](v3, "_defaultConfigurationPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[POUserGroupManager initWithFilePath:](v6, "initWithFilePath:", v7);
    userGroupManager = v3->_userGroupManager;
    v3->_userGroupManager = (POUserGroupManager *)v8;

    if (!_syncLock)
    {
      v10 = objc_alloc_init(MEMORY[0x24BEDCDF0]);
      v11 = (void *)_syncLock;
      _syncLock = (uint64_t)v10;

    }
  }
  return v3;
}

- (PODaemonProcess)initWithXPCConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  PODaemonProcess *v8;
  PODaemonProcess *v9;
  PODaemonProcess *v10;
  id v11;

  v4 = a3;
  PO_LOG_PODaemonProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PODaemonProcess initWithXPCConnection:].cold.1();

  objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.platformsso.agent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    v8 = -[PODaemonProcess init](self, "init");
    v9 = v8;
    if (v8)
      objc_storeWeak((id *)&v8->_xpcConnection, v4);
    self = v9;
    v10 = self;
  }
  else
  {
    v11 = __41__PODaemonProcess_initWithXPCConnection___block_invoke();
    v10 = 0;
  }

  return v10;
}

id __41__PODaemonProcess_initWithXPCConnection___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1002, CFSTR("missing required entitlement"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)connectionInvalidated
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  PODaemonProcess *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  PO_LOG_PODaemonProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[PODaemonProcess connectionInvalidated]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

}

+ (id)_prebootSyncQueue
{
  if (_prebootSyncQueue_onceToken != -1)
    dispatch_once(&_prebootSyncQueue_onceToken, &__block_literal_global_20);
  return (id)_prebootSyncQueue_queue;
}

void __36__PODaemonProcess__prebootSyncQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.PlatformSSO.sync-queue", 0);
  v1 = (void *)_prebootSyncQueue_queue;
  _prebootSyncQueue_queue = (uint64_t)v0;

}

+ (BOOL)syncPending
{
  return _syncPending;
}

+ (void)setSyncPending:(BOOL)a3
{
  _syncPending = a3;
}

+ (NSTimer)syncTimer
{
  return (NSTimer *)(id)_syncTimer;
}

+ (void)setSyncTimer:(id)a3
{
  objc_storeStrong((id *)&_syncTimer, a3);
}

- (POConfigurationManager)configurationManager
{
  POConfigurationManager *configurationManager;
  POConfigurationManager *v4;
  void *v5;
  POConfigurationManager *v6;
  POConfigurationManager *v7;

  configurationManager = self->_configurationManager;
  if (!configurationManager)
  {
    v4 = [POConfigurationManager alloc];
    -[PODaemonProcess directoryServices](self, "directoryServices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[POConfigurationManager initWithUserName:directoryServices:sharedOnly:](v4, "initWithUserName:directoryServices:sharedOnly:", 0, v5, 1);
    v7 = self->_configurationManager;
    self->_configurationManager = v6;

    configurationManager = self->_configurationManager;
  }
  return configurationManager;
}

- (SOConfigurationHost)configurationHost
{
  SOConfigurationHost *configurationHost;
  SOConfigurationHost *v4;
  SOConfigurationHost *v5;

  configurationHost = self->_configurationHost;
  if (!configurationHost)
  {
    v4 = (SOConfigurationHost *)objc_alloc_init((Class)getSOConfigurationHostClass());
    v5 = self->_configurationHost;
    self->_configurationHost = v4;

    configurationHost = self->_configurationHost;
  }
  return configurationHost;
}

- (void)handleStartup
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "handleStartup", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)migrateConfiguration:(BOOL)a3 completion:(id)a4
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;

  v4 = (void (**)(id, uint64_t, _QWORD))a4;
  PO_LOG_PODaemonProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PODaemonProcess migrateConfiguration:completion:].cold.1();

  v4[2](v4, 1, 0);
}

- (void)handleAuthRights
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_0(&dword_22307D000, v0, v1, "%s  on %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __35__PODaemonProcess_handleAuthRights__block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  void *v4;

  if (a2)
  {
    PO_LOG_PODaemonProcess();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __35__PODaemonProcess_handleAuthRights__block_invoke_cold_1();

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("com.apple.AuthRightCheck"));

  }
}

- (BOOL)_removeDeviceConfigurationForIdentifer:(id)a3 syncToPreboot:(BOOL)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  PODaemonProcess *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  PO_LOG_PODaemonProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[PODaemonProcess _removeDeviceConfigurationForIdentifer:syncToPreboot:error:]";
    v27 = 2114;
    v28 = v7;
    v29 = 2112;
    v30 = self;
    _os_log_impl(&dword_22307D000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", *MEMORY[0x24BE72F60], v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v9, "URLByAppendingPathComponent:", *MEMORY[0x24BE72F68]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v14 = objc_msgSend(v13, "removeItemAtURL:error:", v12, &v24);
  v15 = v24;

  if ((v14 & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v15, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("NSUnderlyingError"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "code") == 2)
  {

LABEL_9:
    objc_msgSend(MEMORY[0x24BE72E98], "updateTriggerFile");
    v18 = 1;
    goto LABEL_13;
  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __78__PODaemonProcess__removeDeviceConfigurationForIdentifer_syncToPreboot_error___block_invoke;
  v22[3] = &unk_24EC025A0;
  v23 = v15;
  __78__PODaemonProcess__removeDeviceConfigurationForIdentifer_syncToPreboot_error___block_invoke((uint64_t)v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (a5)
    *a5 = objc_retainAutorelease(v19);

  v18 = 0;
LABEL_13:

  return v18;
}

id __78__PODaemonProcess__removeDeviceConfigurationForIdentifer_syncToPreboot_error___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1007, *(_QWORD *)(a1 + 32), CFSTR("Failed to remove device configuration"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (void)resetStoredConfigurationWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  PODaemonProcess *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, void *))a3;
  PO_LOG_PODaemonProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[PODaemonProcess resetStoredConfigurationWithCompletion:]";
    v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PODaemonProcess setDataVaultInitialized:](self, "setDataVaultInitialized:", 0);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v8 = objc_msgSend(v7, "removeItemAtURL:error:", v6, &v17);
  v9 = v17;

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v9, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NSUnderlyingError"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "code") != 2)
    {
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __58__PODaemonProcess_resetStoredConfigurationWithCompletion___block_invoke;
      v15[3] = &unk_24EC025A0;
      v16 = v9;
      __58__PODaemonProcess_resetStoredConfigurationWithCompletion___block_invoke((uint64_t)v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v14);

      goto LABEL_8;
    }

  }
  -[PODaemonProcess _initDataVaultIfNeededWithError:](self, "_initDataVaultIfNeededWithError:", 0);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", CFSTR("com.apple.AuthRightCheck"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", CFSTR("com.apple.MigrationCheck"));

  objc_msgSend(MEMORY[0x24BE72E98], "updateTriggerFile");
  v4[2](v4, 1, 0);
LABEL_8:

}

id __58__PODaemonProcess_resetStoredConfigurationWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to remove platform sso configuration folder"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (void)removeDeviceConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _BOOL8, id);
  NSObject *v8;
  _BOOL8 v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  PODaemonProcess *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _BOOL8, id))a4;
  PO_LOG_PODaemonProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[PODaemonProcess removeDeviceConfigurationForIdentifer:completion:]";
    v14 = 2114;
    v15 = v6;
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_22307D000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  v11 = 0;
  v9 = -[PODaemonProcess _removeDeviceConfigurationForIdentifer:syncToPreboot:error:](self, "_removeDeviceConfigurationForIdentifer:syncToPreboot:error:", v6, 1, &v11);
  v10 = v11;
  v7[2](v7, v9, v10);

}

- (BOOL)_removeLoginConfigurationForIdentifer:(id)a3 syncToPreboot:(BOOL)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  PODaemonProcess *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  PO_LOG_PODaemonProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "-[PODaemonProcess _removeLoginConfigurationForIdentifer:syncToPreboot:error:]";
    v27 = 2114;
    v28 = v7;
    v29 = 2112;
    v30 = self;
    _os_log_impl(&dword_22307D000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", *MEMORY[0x24BE72F70], v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v9, "URLByAppendingPathComponent:", *MEMORY[0x24BE72F78]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v14 = objc_msgSend(v13, "removeItemAtURL:error:", v12, &v24);
  v15 = v24;

  if ((v14 & 1) != 0)
    goto LABEL_9;
  objc_msgSend(v15, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("NSUnderlyingError"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "code") == 2)
  {

LABEL_9:
    objc_msgSend(MEMORY[0x24BE72E98], "updateTriggerFile");
    v18 = 1;
    goto LABEL_13;
  }
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __77__PODaemonProcess__removeLoginConfigurationForIdentifer_syncToPreboot_error___block_invoke;
  v22[3] = &unk_24EC025A0;
  v23 = v15;
  __77__PODaemonProcess__removeLoginConfigurationForIdentifer_syncToPreboot_error___block_invoke((uint64_t)v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (a5)
    *a5 = objc_retainAutorelease(v19);

  v18 = 0;
LABEL_13:

  return v18;
}

id __77__PODaemonProcess__removeLoginConfigurationForIdentifer_syncToPreboot_error___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1007, *(_QWORD *)(a1 + 32), CFSTR("Failed to remove login configuration"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (void)removeLoginConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _BOOL8, id);
  NSObject *v8;
  _BOOL8 v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  PODaemonProcess *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _BOOL8, id))a4;
  PO_LOG_PODaemonProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[PODaemonProcess removeLoginConfigurationForIdentifer:completion:]";
    v14 = 2114;
    v15 = v6;
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_22307D000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  v11 = 0;
  v9 = -[PODaemonProcess _removeLoginConfigurationForIdentifer:syncToPreboot:error:](self, "_removeLoginConfigurationForIdentifer:syncToPreboot:error:", v6, 1, &v11);
  v10 = v11;
  v7[2](v7, v9, v10);

}

- (BOOL)_removeUserConfigurationForIdentifier:(id)a3 syncToPreboot:(BOOL)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  PODaemonProcess *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  PO_LOG_PODaemonProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[PODaemonProcess _removeUserConfigurationForIdentifier:syncToPreboot:error:]";
    v26 = 2114;
    v27 = v7;
    v28 = 2112;
    v29 = self;
    _os_log_impl(&dword_22307D000, v8, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", *MEMORY[0x24BE72F98], v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v13 = objc_msgSend(v12, "removeItemAtURL:error:", v11, &v23);
  v14 = v23;

  if ((v13 & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v14, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("NSUnderlyingError"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "code") == 2)
  {

LABEL_6:
    objc_msgSend(MEMORY[0x24BE72E98], "updateTriggerFile");
    v17 = 1;
    goto LABEL_10;
  }
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __77__PODaemonProcess__removeUserConfigurationForIdentifier_syncToPreboot_error___block_invoke;
  v21[3] = &unk_24EC025A0;
  v22 = v14;
  __77__PODaemonProcess__removeUserConfigurationForIdentifier_syncToPreboot_error___block_invoke((uint64_t)v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a5)
    *a5 = objc_retainAutorelease(v18);

  v17 = 0;
LABEL_10:

  return v17;
}

id __77__PODaemonProcess__removeUserConfigurationForIdentifier_syncToPreboot_error___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1007, *(_QWORD *)(a1 + 32), CFSTR("Failed to remove user configuration"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (void)removeUserConfigurationForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _BOOL8, id);
  NSObject *v8;
  _BOOL8 v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  PODaemonProcess *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _BOOL8, id))a4;
  PO_LOG_PODaemonProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[PODaemonProcess removeUserConfigurationForIdentifier:completion:]";
    v14 = 2114;
    v15 = v6;
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_22307D000, v8, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  v11 = 0;
  v9 = -[PODaemonProcess _removeUserConfigurationForIdentifier:syncToPreboot:error:](self, "_removeUserConfigurationForIdentifier:syncToPreboot:error:", v6, 1, &v11);
  v10 = v11;
  v7[2](v7, v9, v10);

}

- (BOOL)_saveDeviceConfiguration:(id)a3 identifer:(id)a4 syncToPreboot:(BOOL)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  NSObject *v21;
  char *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  PODaemonProcess *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  PO_LOG_PODaemonProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "-[PODaemonProcess _saveDeviceConfiguration:identifer:syncToPreboot:error:]";
    v31 = 2114;
    v32 = v10;
    v33 = 2112;
    v34 = self;
    _os_log_impl(&dword_22307D000, v11, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  if (objc_msgSend(MEMORY[0x24BE72E98], "platformSSODevModeEnabled"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
    PO_LOG_PODaemonProcess();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PODaemonProcess _saveDeviceConfiguration:identifer:syncToPreboot:error:].cold.1();

  }
  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", *MEMORY[0x24BE72F60], v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v14, "URLByAppendingPathComponent:", *MEMORY[0x24BE72F68]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v28 = 0;
  v18 = -[PODaemonCoreProcess writeData:toPath:saveError:](self, "writeData:toPath:saveError:", v9, v17, &v28);
  v19 = v28;
  v20 = v19;
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BE72E98], "updateTriggerFile");
    PO_LOG_PODaemonProcess();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v17, "path");
      v22 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v22;
      _os_log_impl(&dword_22307D000, v21, OS_LOG_TYPE_INFO, "device config written to file: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __74__PODaemonProcess__saveDeviceConfiguration_identifer_syncToPreboot_error___block_invoke;
    v26[3] = &unk_24EC025A0;
    v27 = v19;
    __74__PODaemonProcess__saveDeviceConfiguration_identifer_syncToPreboot_error___block_invoke((uint64_t)v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a6)
      *a6 = objc_retainAutorelease(v23);

    v21 = v27;
  }

  return v18;
}

id __74__PODaemonProcess__saveDeviceConfiguration_identifer_syncToPreboot_error___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to write device config to disk"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (void)saveDeviceConfiguration:(id)a3 identifer:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _BOOL8, id);
  id v10;
  NSObject *v11;
  _BOOL8 v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  PODaemonProcess *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, _BOOL8, id))a5;
  v10 = a3;
  PO_LOG_PODaemonProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[PODaemonProcess saveDeviceConfiguration:identifer:completion:]";
    v17 = 2114;
    v18 = v8;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_22307D000, v11, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  v14 = 0;
  v12 = -[PODaemonProcess _saveDeviceConfiguration:identifer:syncToPreboot:error:](self, "_saveDeviceConfiguration:identifer:syncToPreboot:error:", v10, v8, 1, &v14);

  v13 = v14;
  v9[2](v9, v12, v13);

}

- (BOOL)_saveLoginConfiguration:(id)a3 identifer:(id)a4 syncToPreboot:(BOOL)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  NSObject *v21;
  char *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  PODaemonProcess *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  PO_LOG_PODaemonProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "-[PODaemonProcess _saveLoginConfiguration:identifer:syncToPreboot:error:]";
    v31 = 2114;
    v32 = v10;
    v33 = 2112;
    v34 = self;
    _os_log_impl(&dword_22307D000, v11, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  if (objc_msgSend(MEMORY[0x24BE72E98], "platformSSODevModeEnabled"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
    PO_LOG_PODaemonProcess();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PODaemonProcess _saveLoginConfiguration:identifer:syncToPreboot:error:].cold.1();

  }
  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", *MEMORY[0x24BE72F70], v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v14, "URLByAppendingPathComponent:", *MEMORY[0x24BE72F78]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v28 = 0;
  v18 = -[PODaemonCoreProcess writeData:toPath:saveError:](self, "writeData:toPath:saveError:", v9, v17, &v28);
  v19 = v28;
  v20 = v19;
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BE72E98], "updateTriggerFile");
    PO_LOG_PODaemonProcess();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v17, "path");
      v22 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v22;
      _os_log_impl(&dword_22307D000, v21, OS_LOG_TYPE_INFO, "login config written to file: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __73__PODaemonProcess__saveLoginConfiguration_identifer_syncToPreboot_error___block_invoke;
    v26[3] = &unk_24EC025A0;
    v27 = v19;
    __73__PODaemonProcess__saveLoginConfiguration_identifer_syncToPreboot_error___block_invoke((uint64_t)v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a6)
      *a6 = objc_retainAutorelease(v23);

    v21 = v27;
  }

  return v18;
}

id __73__PODaemonProcess__saveLoginConfiguration_identifer_syncToPreboot_error___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to write login config to disk"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (void)saveLoginConfiguration:(id)a3 identifer:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, _BOOL8, id);
  id v10;
  NSObject *v11;
  _BOOL8 v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  PODaemonProcess *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, _BOOL8, id))a5;
  v10 = a3;
  PO_LOG_PODaemonProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[PODaemonProcess saveLoginConfiguration:identifer:completion:]";
    v17 = 2114;
    v18 = v8;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_22307D000, v11, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  v14 = 0;
  v12 = -[PODaemonProcess _saveLoginConfiguration:identifer:syncToPreboot:error:](self, "_saveLoginConfiguration:identifer:syncToPreboot:error:", v10, v8, 1, &v14);

  v13 = v14;
  v9[2](v9, v12, v13);

}

- (void)saveUserConfiguration:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  PODaemonProcess *v23;
  uint64_t v24;

  v7 = a5;
  v24 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v12 = a3;
  PO_LOG_PODaemonProcess();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[PODaemonProcess saveUserConfiguration:forIdentifier:syncToPreboot:completion:]";
    v20 = 2114;
    v21 = v10;
    v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_22307D000, v13, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  objc_msgSend(v12, "dataRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __80__PODaemonProcess_saveUserConfiguration_forIdentifier_syncToPreboot_completion___block_invoke;
  v16[3] = &unk_24EC02A30;
  v17 = v11;
  v15 = v11;
  -[PODaemonProcess saveUserConfigurationData:forIdentifier:syncToPreboot:completion:](self, "saveUserConfigurationData:forIdentifier:syncToPreboot:completion:", v14, v10, v7, v16);

}

uint64_t __80__PODaemonProcess_saveUserConfiguration_forIdentifier_syncToPreboot_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_saveUserConfigurationData:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  NSObject *v20;
  char *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  PODaemonProcess *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  PO_LOG_PODaemonProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[PODaemonProcess _saveUserConfigurationData:forIdentifier:syncToPreboot:error:]";
    v30 = 2114;
    v31 = v10;
    v32 = 2112;
    v33 = self;
    _os_log_impl(&dword_22307D000, v11, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  if (objc_msgSend(MEMORY[0x24BE72E98], "platformSSODevModeEnabled"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
    PO_LOG_PODaemonProcess();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PODaemonProcess _saveUserConfigurationData:forIdentifier:syncToPreboot:error:].cold.1();

  }
  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", *MEMORY[0x24BE72F98], v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0;
  v17 = -[PODaemonCoreProcess writeData:toPath:saveError:](self, "writeData:toPath:saveError:", v9, v16, &v27);
  v18 = v27;
  v19 = v18;
  if (v17)
  {
    objc_msgSend(MEMORY[0x24BE72E98], "updateTriggerFile");
    PO_LOG_PODaemonProcess();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v16, "path");
      v21 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v21;
      _os_log_impl(&dword_22307D000, v20, OS_LOG_TYPE_INFO, "user config written to file: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __80__PODaemonProcess__saveUserConfigurationData_forIdentifier_syncToPreboot_error___block_invoke;
    v25[3] = &unk_24EC025A0;
    v26 = v18;
    __80__PODaemonProcess__saveUserConfigurationData_forIdentifier_syncToPreboot_error___block_invoke((uint64_t)v25);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a6)
      *a6 = objc_retainAutorelease(v22);

    v20 = v26;
  }

  return v17;
}

id __80__PODaemonProcess__saveUserConfigurationData_forIdentifier_syncToPreboot_error___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to write user config to disk"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (void)saveUserConfigurationData:(id)a3 forIdentifier:(id)a4 syncToPreboot:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  void (**v11)(id, _BOOL8, id);
  id v12;
  NSObject *v13;
  _BOOL8 v14;
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  PODaemonProcess *v22;
  uint64_t v23;

  v7 = a5;
  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = (void (**)(id, _BOOL8, id))a6;
  v12 = a3;
  PO_LOG_PODaemonProcess();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[PODaemonProcess saveUserConfigurationData:forIdentifier:syncToPreboot:completion:]";
    v19 = 2114;
    v20 = v10;
    v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_22307D000, v13, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  v16 = 0;
  v14 = -[PODaemonProcess _saveUserConfigurationData:forIdentifier:syncToPreboot:error:](self, "_saveUserConfigurationData:forIdentifier:syncToPreboot:error:", v12, v10, v7, &v16);

  v15 = v16;
  v11[2](v11, v14, v15);

}

- (BOOL)_saveUserLoginStateList:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  BOOL v8;
  objc_super v10;

  v6 = a3;
  PO_LOG_PODaemonProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PODaemonProcess _saveUserLoginStateList:error:].cold.1();

  v10.receiver = self;
  v10.super_class = (Class)PODaemonProcess;
  v8 = -[PODaemonCoreProcess _saveUserLoginStateList:error:](&v10, sel__saveUserLoginStateList_error_, v6, a4);

  return v8;
}

- (void)enablePlatformSSORules:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  PO_LOG_PODaemonProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PODaemonProcess enablePlatformSSORules:].cold.1();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__PODaemonProcess_enablePlatformSSORules___block_invoke;
  v7[3] = &unk_24EC03448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PODaemonProcess _enablePlatformSSORuleForLogin:](self, "_enablePlatformSSORuleForLogin:", v7);

}

uint64_t __42__PODaemonProcess_enablePlatformSSORules___block_invoke(uint64_t a1, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_enablePlatformSSORuleForScreensaver:", *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_enablePlatformSSORuleForScreensaver:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  PO_LOG_PODaemonProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PODaemonProcess enablePlatformSSORules:].cold.1();

  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
}

- (void)disablePlatformSSORules:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  PO_LOG_PODaemonProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PODaemonProcess disablePlatformSSORules:].cold.1();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__PODaemonProcess_disablePlatformSSORules___block_invoke;
  v7[3] = &unk_24EC03448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PODaemonProcess _disablePlatformSSORuleForLogin:](self, "_disablePlatformSSORuleForLogin:", v7);

}

uint64_t __43__PODaemonProcess_disablePlatformSSORules___block_invoke(uint64_t a1, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_disablePlatformSSORuleForScreensaver:", *(_QWORD *)(a1 + 40));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_disablePlatformSSORuleForScreensaver:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  PO_LOG_PODaemonProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PODaemonProcess disablePlatformSSORules:].cold.1();

  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
}

- (void)_enablePlatformSSORuleForLogin:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  PO_LOG_PODaemonProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PODaemonProcess _enablePlatformSSORuleForLogin:].cold.1();

  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
}

- (void)_disablePlatformSSORuleForLogin:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  PO_LOG_PODaemonProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PODaemonProcess _enablePlatformSSORuleForLogin:].cold.1();

  (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
}

- (BOOL)_updateGroupForRight:(id)a3 newGroup:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a4;
  PO_LOG_PODaemonProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PODaemonProcess _updateGroupForRight:newGroup:].cold.1();

  return 1;
}

- (void)saveAppSSOConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  PODaemonProcess *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PO_LOG_PODaemonProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[PODaemonProcess saveAppSSOConfiguration:completion:]";
    v16 = 2114;
    v17 = v6;
    v18 = 2112;
    v19 = self;
    _os_log_impl(&dword_22307D000, v8, OS_LOG_TYPE_DEFAULT, "%s configuration = %{public}@ on %@", buf, 0x20u);
  }

  objc_msgSend(getSOConfigurationManagerClass(), "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(getSOConfigurationManagerClass(), "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __54__PODaemonProcess_saveAppSSOConfiguration_completion___block_invoke_51;
    v12[3] = &unk_24EC02A30;
    v13 = v7;
    objc_msgSend(v10, "saveConfigurationData:completion:", v6, v12);

    v11 = v13;
  }
  else
  {
    __54__PODaemonProcess_saveAppSSOConfiguration_completion___block_invoke();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);
  }

}

id __54__PODaemonProcess_saveAppSSOConfiguration_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("missing configuration manager"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

void __54__PODaemonProcess_saveAppSSOConfiguration_completion___block_invoke_51(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  uint8_t buf[16];

  if (a3)
  {
    __54__PODaemonProcess_saveAppSSOConfiguration_completion___block_invoke_2();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    PO_LOG_PODaemonProcess();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22307D000, v4, OS_LOG_TYPE_INFO, "configuration saved", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

id __54__PODaemonProcess_saveAppSSOConfiguration_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save configuration"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)createAppSSOCachePathWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  PODaemonProcess *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  PO_LOG_PODaemonProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[PODaemonProcess createAppSSOCachePathWithCompletion:]";
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6 = objc_alloc_init((Class)getSOConfigurationHostClass());
  objc_msgSend(v6, "_defaultCacheFile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v9 = objc_msgSend(v6, "_initCachePath:ifNeededWithError:", v8, &v12);
  v10 = v12;
  if ((v9 & 1) != 0)
  {
    v4[2](v4, 1, 0);
  }
  else
  {
    PO_LOG_PODaemonProcess();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PODaemonProcess createAppSSOCachePathWithCompletion:].cold.1();

    ((void (**)(id, uint64_t, id))v4)[2](v4, 0, v10);
  }

}

- (BOOL)_initDataVaultIfNeededWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  PODaemonProcess *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  char *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  int v24;
  NSObject *v25;
  int *v26;
  char *v27;
  void *v28;
  void *v29;
  int *v30;
  void *v31;
  id v32;
  id v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  char *v37;
  int *v38;
  char *v39;
  void *v40;
  void *v41;
  int *v42;
  void *v43;
  id v45;
  id v46;
  _QWORD v47[3];
  _QWORD v48[3];
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  PODaemonProcess *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  PO_LOG_PODaemonProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[PODaemonProcess _initDataVaultIfNeededWithError:]";
    v51 = 2112;
    v52 = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self;
  objc_sync_enter(v7);
  if (!-[PODaemonProcess dataVaultInitialized](v7, "dataVaultInitialized"))
  {
    v9 = *MEMORY[0x24BDD0C78];
    v47[0] = *MEMORY[0x24BDD0CB0];
    v47[1] = v9;
    v48[0] = CFSTR("mobile");
    v48[1] = CFSTR("mobile");
    v47[2] = *MEMORY[0x24BDD0CC8];
    v48[2] = &unk_24EC10B70;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v12, 0);

    if ((v13 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      v15 = objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, v10, &v46);
      v16 = v46;

      if (v16)
        v15 = 0;
      PO_LOG_PODaemonProcess();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if ((v15 & 1) == 0)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[PODaemonProcess _initDataVaultIfNeededWithError:].cold.3();

        if (!a3)
          goto LABEL_35;
        v32 = objc_retainAutorelease(v16);
        v16 = v32;
        goto LABEL_25;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "path");
        v19 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v50 = v19;
        _os_log_impl(&dword_22307D000, v18, OS_LOG_TYPE_DEFAULT, "created configuration directory at %{public}@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v22 = objc_msgSend(v20, "setAttributes:ofItemAtPath:error:", v10, v21, &v45);
    v16 = v45;

    if ((v22 & 1) != 0)
    {
      v23 = objc_retainAutorelease(v6);
      objc_msgSend(v23, "fileSystemRepresentation");
      v24 = rootless_check_datavault_flag();
      if (v24)
      {
        if (v24 == -1)
        {
          PO_LOG_PODaemonProcess();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = __error();
            v27 = strerror(*v26);
            -[PODaemonProcess _initDataVaultIfNeededWithError:].cold.2((uint64_t)v27, (uint64_t)buf, v25);
          }

          if (a3)
          {
            v28 = (void *)MEMORY[0x24BE72EB0];
            v29 = (void *)MEMORY[0x24BDD17C8];
            v30 = __error();
            objc_msgSend(v29, "stringWithFormat:", CFSTR("Failed to check the state of datavault: %s"), strerror(*v30));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "internalErrorWithMessage:", v31);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_35;
        }
        v33 = objc_retainAutorelease(v23);
        objc_msgSend(v33, "fileSystemRepresentation");
        v34 = rootless_convert_to_datavault();
        PO_LOG_PODaemonProcess();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v34 == -1)
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v38 = __error();
            v39 = strerror(*v38);
            -[PODaemonProcess _initDataVaultIfNeededWithError:].cold.1((uint64_t)v39, (uint64_t)buf, v36);
          }

          if (a3)
          {
            v40 = (void *)MEMORY[0x24BE72EB0];
            v41 = (void *)MEMORY[0x24BDD17C8];
            v42 = __error();
            objc_msgSend(v41, "stringWithFormat:", CFSTR("Failed to convert to datavault: %s"), strerror(*v42));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "internalErrorWithMessage:", v43);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_35;
        }
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v33, "path");
          v37 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v50 = v37;
          _os_log_impl(&dword_22307D000, v36, OS_LOG_TYPE_DEFAULT, "successfully created datavault at %{public}@", buf, 0xCu);

        }
      }
      v8 = 1;
      -[PODaemonProcess setDataVaultInitialized:](v7, "setDataVaultInitialized:", 1);
LABEL_36:

      goto LABEL_37;
    }
    if (!a3)
    {
LABEL_35:
      v8 = 0;
      goto LABEL_36;
    }
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("Failed to set data vault attributes"));
    v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
    v8 = 0;
    *a3 = v32;
    goto LABEL_36;
  }
  v8 = 1;
LABEL_37:
  objc_sync_exit(v7);

  return v8;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (void)setConfigurationHost:(id)a3
{
  objc_storeStrong((id *)&self->_configurationHost, a3);
}

- (BOOL)dataVaultInitialized
{
  return self->_dataVaultInitialized;
}

- (void)setDataVaultInitialized:(BOOL)a3
{
  self->_dataVaultInitialized = a3;
}

- (PODirectoryServices)directoryServices
{
  return (PODirectoryServices *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDirectoryServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (POUserGroupManager)userGroupManager
{
  return (POUserGroupManager *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUserGroupManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userGroupManager, 0);
  objc_storeStrong((id *)&self->_directoryServices, 0);
  objc_storeStrong((id *)&self->_configurationHost, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)initWithXPCConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_0(&dword_22307D000, v0, v1, "%s  on %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

- (void)migrateConfiguration:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "migrating data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __35__PODaemonProcess_handleAuthRights__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Rule successfully checked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_saveDeviceConfiguration:identifer:syncToPreboot:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_22307D000, v0, v1, "%s data = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_12();
}

- (void)_saveLoginConfiguration:identifer:syncToPreboot:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_22307D000, v0, v1, "%s data = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_12();
}

- (void)_saveUserConfigurationData:forIdentifier:syncToPreboot:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_22307D000, v0, v1, "%s data = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_12();
}

- (void)_saveUserLoginStateList:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "saving user state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)enablePlatformSSORules:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "updating rules database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)disablePlatformSSORules:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "restoring rules database if needed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_enablePlatformSSORuleForLogin:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "updating rules database for login", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_updateGroupForRight:newGroup:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_10_0(&dword_22307D000, v0, (uint64_t)v0, "updating group for right: %{public}@, %{public}@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)createAppSSOCachePathWithCompletion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_2(&dword_22307D000, v0, v1, "failed to create cache directory at %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_initDataVaultIfNeededWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136446210;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_2(&dword_22307D000, a3, (uint64_t)a3, "Failed to convert to datavault: %{public}s", (uint8_t *)a2);
}

- (void)_initDataVaultIfNeededWithError:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136446210;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_2_2(&dword_22307D000, a3, (uint64_t)a3, "Failed to check the state of datavault: %{public}s", (uint8_t *)a2);
}

- (void)_initDataVaultIfNeededWithError:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_2(&dword_22307D000, v0, v1, "Failed to create configuration directory at %{public}@: %{public}@");
  OUTLINED_FUNCTION_1();
}

@end
