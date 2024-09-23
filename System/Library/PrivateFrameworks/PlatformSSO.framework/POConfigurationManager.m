@implementation POConfigurationManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_83);
  return (id)sharedInstance_defaultManager;
}

void __40__POConfigurationManager_sharedInstance__block_invoke()
{
  POConfigurationManager *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [POConfigurationManager alloc];
  NSUserName();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[POConfigurationManager initWithUserName:](v0, "initWithUserName:", v3);
  v2 = (void *)sharedInstance_defaultManager;
  sharedInstance_defaultManager = v1;

}

- (POConfigurationManager)initWithUserName:(id)a3
{
  id v4;
  PODirectoryServices *v5;
  POConfigurationManager *v6;

  v4 = a3;
  v5 = objc_alloc_init(PODirectoryServices);
  v6 = -[POConfigurationManager initWithUserName:directoryServices:sharedOnly:](self, "initWithUserName:directoryServices:sharedOnly:", v4, v5, 0);

  return v6;
}

- (POConfigurationManager)initWithUserName:(id)a3 directoryServices:(id)a4 sharedOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  POConfigurationManager *v10;
  PODaemonConnection *v11;
  PODaemonConnection *serviceConnection;
  uint64_t v13;
  POConfigurationVersion *userConfigurationVersion;
  uint64_t v15;
  POConfigurationVersion *loginConfigurationVersion;
  uint64_t v17;
  POConfigurationVersion *deviceConfigurationVersion;
  POKeychainHelper *v19;
  POKeychainHelper *keychainHelper;
  objc_super v22;

  v5 = a5;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)POConfigurationManager;
  v10 = -[POConfigurationCoreManager initWithUserName:identifierProvider:sharedOnly:](&v22, sel_initWithUserName_identifierProvider_sharedOnly_, a3, v9, v5);
  if (v10)
  {
    v11 = objc_alloc_init(PODaemonConnection);
    serviceConnection = v10->_serviceConnection;
    v10->_serviceConnection = v11;

    objc_storeStrong((id *)&v10->_directoryServices, a4);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BE72E88]), "initWithConfigurationType:", 0);
    userConfigurationVersion = v10->_userConfigurationVersion;
    v10->_userConfigurationVersion = (POConfigurationVersion *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BE72E88]), "initWithConfigurationType:", 1);
    loginConfigurationVersion = v10->_loginConfigurationVersion;
    v10->_loginConfigurationVersion = (POConfigurationVersion *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BE72E88]), "initWithConfigurationType:", 2);
    deviceConfigurationVersion = v10->_deviceConfigurationVersion;
    v10->_deviceConfigurationVersion = (POConfigurationVersion *)v17;

    v19 = (POKeychainHelper *)objc_alloc_init(MEMORY[0x24BE72ED8]);
    keychainHelper = v10->_keychainHelper;
    v10->_keychainHelper = v19;

  }
  return v10;
}

- (id)currentUserConfiguration
{
  POConfigurationManager *v2;
  void *v3;
  uint64_t v4;
  POUserConfiguration *currentUserConfiguration;
  void *v6;
  uint64_t v7;
  POUserConfiguration *v8;
  id v9;
  void *v10;
  uint64_t v11;
  POUserConfiguration *v12;
  id v13;
  POUserConfiguration *v14;

  v2 = self;
  objc_sync_enter(v2);
  -[POConfigurationManager userConfigurationVersion](v2, "userConfigurationVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "checkVersion");

  currentUserConfiguration = v2->_currentUserConfiguration;
  if (currentUserConfiguration)
  {
    if (v4)
    {
      if (v4 != 1)
      {
        v14 = 0;
        goto LABEL_11;
      }
      -[POConfigurationCoreManager userName](v2, "userName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[POConfigurationManager userConfigurationForUserName:](v2, "userConfigurationForUserName:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v2->_currentUserConfiguration;
      v2->_currentUserConfiguration = (POUserConfiguration *)v7;

      currentUserConfiguration = v2->_currentUserConfiguration;
      if (!currentUserConfiguration)
      {
        v9 = __50__POConfigurationManager_currentUserConfiguration__block_invoke_93();
LABEL_8:
        currentUserConfiguration = v2->_currentUserConfiguration;
      }
    }
  }
  else
  {
    -[POConfigurationCoreManager userName](v2, "userName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[POConfigurationManager userConfigurationForUserName:](v2, "userConfigurationForUserName:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v2->_currentUserConfiguration;
    v2->_currentUserConfiguration = (POUserConfiguration *)v11;

    currentUserConfiguration = v2->_currentUserConfiguration;
    if (!currentUserConfiguration)
    {
      v13 = __50__POConfigurationManager_currentUserConfiguration__block_invoke();
      goto LABEL_8;
    }
  }
  v14 = currentUserConfiguration;
LABEL_11:
  objc_sync_exit(v2);

  return v14;
}

id __50__POConfigurationManager_currentUserConfiguration__block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("no user configuration for user"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __50__POConfigurationManager_currentUserConfiguration__block_invoke_93()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("no user configuration for user"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (BOOL)saveCurrentUserConfigurationAndSyncToPreboot:(BOOL)a3
{
  _BOOL8 v3;
  POConfigurationManager *v4;
  POUserConfiguration *currentUserConfiguration;
  void *v6;
  BOOL v7;
  BOOL v8;
  id v9;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  currentUserConfiguration = v4->_currentUserConfiguration;
  if (currentUserConfiguration
    && (-[POConfigurationCoreManager userName](v4, "userName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = -[POConfigurationManager saveUserConfiguration:forUserName:syncToPreboot:](v4, "saveUserConfiguration:forUserName:syncToPreboot:", currentUserConfiguration, v6, v3), v6, !v7))
  {
    v9 = __71__POConfigurationManager_saveCurrentUserConfigurationAndSyncToPreboot___block_invoke();
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  objc_sync_exit(v4);

  return v8;
}

id __71__POConfigurationManager_saveCurrentUserConfigurationAndSyncToPreboot___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("failed to save user configuration"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (id)currentDeviceConfiguration
{
  POConfigurationManager *v2;
  void *v3;
  uint64_t v4;
  PODeviceConfiguration *currentDeviceConfiguration;
  uint64_t v6;
  PODeviceConfiguration *v7;
  id v8;
  uint64_t v9;
  PODeviceConfiguration *v10;
  id v11;
  PODeviceConfiguration *v12;

  v2 = self;
  objc_sync_enter(v2);
  -[POConfigurationManager deviceConfigurationVersion](v2, "deviceConfigurationVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "checkVersion");

  currentDeviceConfiguration = v2->_currentDeviceConfiguration;
  if (currentDeviceConfiguration)
  {
    if (v4)
    {
      if (v4 != 1)
      {
        v12 = 0;
        goto LABEL_11;
      }
      -[POConfigurationManager deviceConfiguration](v2, "deviceConfiguration");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v2->_currentDeviceConfiguration;
      v2->_currentDeviceConfiguration = (PODeviceConfiguration *)v6;

      currentDeviceConfiguration = v2->_currentDeviceConfiguration;
      if (!currentDeviceConfiguration)
      {
        v8 = __52__POConfigurationManager_currentDeviceConfiguration__block_invoke_99();
LABEL_8:
        currentDeviceConfiguration = v2->_currentDeviceConfiguration;
      }
    }
  }
  else
  {
    -[POConfigurationManager deviceConfiguration](v2, "deviceConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v2->_currentDeviceConfiguration;
    v2->_currentDeviceConfiguration = (PODeviceConfiguration *)v9;

    currentDeviceConfiguration = v2->_currentDeviceConfiguration;
    if (!currentDeviceConfiguration)
    {
      v11 = __52__POConfigurationManager_currentDeviceConfiguration__block_invoke();
      goto LABEL_8;
    }
  }
  v12 = currentDeviceConfiguration;
LABEL_11:
  objc_sync_exit(v2);

  return v12;
}

id __52__POConfigurationManager_currentDeviceConfiguration__block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("no device configuration"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __52__POConfigurationManager_currentDeviceConfiguration__block_invoke_99()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("no device configuration"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (id)currentLoginConfiguration
{
  POConfigurationManager *v2;
  void *v3;
  uint64_t v4;
  POLoginConfiguration *currentLoginConfiguration;
  uint64_t v6;
  POLoginConfiguration *v7;
  id v8;
  uint64_t v9;
  POLoginConfiguration *v10;
  id v11;
  POLoginConfiguration *v12;

  v2 = self;
  objc_sync_enter(v2);
  -[POConfigurationManager loginConfigurationVersion](v2, "loginConfigurationVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "checkVersion");

  currentLoginConfiguration = v2->_currentLoginConfiguration;
  if (currentLoginConfiguration)
  {
    if (v4)
    {
      if (v4 != 1)
      {
        v12 = 0;
        goto LABEL_11;
      }
      -[POConfigurationManager loginConfiguration](v2, "loginConfiguration");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v2->_currentLoginConfiguration;
      v2->_currentLoginConfiguration = (POLoginConfiguration *)v6;

      currentLoginConfiguration = v2->_currentLoginConfiguration;
      if (!currentLoginConfiguration)
      {
        v8 = __51__POConfigurationManager_currentLoginConfiguration__block_invoke_102();
LABEL_8:
        currentLoginConfiguration = v2->_currentLoginConfiguration;
      }
    }
  }
  else
  {
    -[POConfigurationManager loginConfiguration](v2, "loginConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v2->_currentLoginConfiguration;
    v2->_currentLoginConfiguration = (POLoginConfiguration *)v9;

    currentLoginConfiguration = v2->_currentLoginConfiguration;
    if (!currentLoginConfiguration)
    {
      v11 = __51__POConfigurationManager_currentLoginConfiguration__block_invoke();
      goto LABEL_8;
    }
  }
  v12 = currentLoginConfiguration;
LABEL_11:
  objc_sync_exit(v2);

  return v12;
}

id __51__POConfigurationManager_currentLoginConfiguration__block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("no login configuration for user"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __51__POConfigurationManager_currentLoginConfiguration__block_invoke_102()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("no login configuration for user"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (id)deviceConfiguration
{
  NSObject *v3;
  PODaemonConnection *serviceConnection;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  PODaemonConnection *v9;
  id v10;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[5];
  id v21;

  PO_LOG_POConfigurationManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager deviceConfiguration].cold.1();

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__1;
  v20[4] = __Block_byref_object_dispose__1;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  serviceConnection = self->_serviceConnection;
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __45__POConfigurationManager_deviceConfiguration__block_invoke;
  v13[3] = &unk_24EC028E8;
  v13[4] = &v14;
  v13[5] = v20;
  -[PODaemonConnection deviceConfigurationForIdentifer:completion:](serviceConnection, "deviceConfigurationForIdentifer:completion:", 0, v13);
  if (objc_msgSend((id)v15[5], "sharedDeviceKeys")
    && objc_msgSend((id)v15[5], "registrationCompleted"))
  {
    -[POConfigurationCoreManager setSharedOnly:](self, "setSharedOnly:", 1);
  }
  if (!v15[5] && !-[POConfigurationCoreManager sharedOnly](self, "sharedOnly"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[POConfigurationManager userIdentifier](self, "userIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = self->_serviceConnection;
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __45__POConfigurationManager_deviceConfiguration__block_invoke_2;
    v12[3] = &unk_24EC028E8;
    v12[4] = &v14;
    v12[5] = v20;
    -[PODaemonConnection deviceConfigurationForIdentifer:completion:](v9, "deviceConfigurationForIdentifer:completion:", v8, v12);

  }
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(v20, 8);
  return v10;
}

void __45__POConfigurationManager_deviceConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  if (a2)
  {
    v6 = (objc_class *)MEMORY[0x24BE72EA8];
    v7 = a2;
    v8 = objc_msgSend([v6 alloc], "initWithData:", v7);

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;

}

void __45__POConfigurationManager_deviceConfiguration__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  if (a2)
  {
    v6 = (objc_class *)MEMORY[0x24BE72EA8];
    v7 = a2;
    v8 = objc_msgSend([v6 alloc], "initWithData:", v7);

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;

}

- (id)userDeviceConfiguration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  PODaemonConnection *serviceConnection;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[5];
  id v18;

  PO_LOG_POConfigurationManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager userDeviceConfiguration].cold.1();

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[POConfigurationManager userIdentifier](self, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__1;
  v17[4] = __Block_byref_object_dispose__1;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  serviceConnection = self->_serviceConnection;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__POConfigurationManager_userDeviceConfiguration__block_invoke;
  v10[3] = &unk_24EC028E8;
  v10[4] = &v11;
  v10[5] = v17;
  -[PODaemonConnection deviceConfigurationForIdentifer:completion:](serviceConnection, "deviceConfigurationForIdentifer:completion:", v6, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);
  return v8;
}

void __49__POConfigurationManager_userDeviceConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  if (a2)
  {
    v6 = (objc_class *)MEMORY[0x24BE72EA8];
    v7 = a2;
    v8 = objc_msgSend([v6 alloc], "initWithData:", v7);

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;

}

- (BOOL)saveDeviceConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  PODaemonConnection *serviceConnection;
  void *v10;
  POConfigurationManager *v11;
  PODeviceConfiguration *currentDeviceConfiguration;
  void *v13;
  BOOL v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager saveDeviceConfiguration:].cold.1();

  if ((objc_msgSend(v4, "sharedDeviceKeys") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[POConfigurationManager userIdentifier](self, "userIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  serviceConnection = self->_serviceConnection;
  objc_msgSend(v4, "dataRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __50__POConfigurationManager_saveDeviceConfiguration___block_invoke;
  v16[3] = &unk_24EC02550;
  v16[4] = &v17;
  -[PODaemonConnection saveDeviceConfiguration:identifer:completion:](serviceConnection, "saveDeviceConfiguration:identifer:completion:", v10, v6, v16);

  if (*((_BYTE *)v18 + 24))
  {
    v11 = self;
    objc_sync_enter(v11);
    currentDeviceConfiguration = v11->_currentDeviceConfiguration;
    v11->_currentDeviceConfiguration = 0;

    objc_sync_exit(v11);
    -[POConfigurationManager deviceConfigurationVersion](v11, "deviceConfigurationVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "increaseVersionWithMessage:", CFSTR("deviceConfiguration updated"));

    v14 = *((_BYTE *)v18 + 24) != 0;
  }
  else
  {
    v14 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v14;
}

uint64_t __50__POConfigurationManager_saveDeviceConfiguration___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)removeDeviceConfiguration
{
  NSObject *v3;

  PO_LOG_POConfigurationManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager removeDeviceConfiguration].cold.1();

  return -[POConfigurationManager __removeDeviceConfigurationWithIdentifier:](self, "__removeDeviceConfigurationWithIdentifier:", 0);
}

- (BOOL)removeUserDeviceConfiguration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  PO_LOG_POConfigurationManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager removeUserDeviceConfiguration].cold.1();

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[POConfigurationManager userIdentifier](self, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[POConfigurationManager __removeDeviceConfigurationWithIdentifier:](self, "__removeDeviceConfigurationWithIdentifier:", v6);
  return v7;
}

- (BOOL)__removeDeviceConfigurationWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  PODaemonConnection *serviceConnection;
  void *v7;
  POConfigurationManager *v8;
  PODeviceConfiguration *currentDeviceConfiguration;
  BOOL v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager __removeDeviceConfigurationWithIdentifier:].cold.1();

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  serviceConnection = self->_serviceConnection;
  v16 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__POConfigurationManager___removeDeviceConfigurationWithIdentifier___block_invoke;
  v12[3] = &unk_24EC02550;
  v12[4] = &v13;
  -[PODaemonConnection removeDeviceConfigurationForIdentifer:completion:](serviceConnection, "removeDeviceConfigurationForIdentifer:completion:", v4, v12);
  if (*((_BYTE *)v14 + 24))
  {
    -[POConfigurationManager deviceConfigurationVersion](self, "deviceConfigurationVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "increaseVersionWithMessage:", CFSTR("deviceConfiguration updated"));

    v8 = self;
    objc_sync_enter(v8);
    currentDeviceConfiguration = v8->_currentDeviceConfiguration;
    v8->_currentDeviceConfiguration = 0;

    objc_sync_exit(v8);
    v10 = *((_BYTE *)v14 + 24) != 0;
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __68__POConfigurationManager___removeDeviceConfigurationWithIdentifier___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)loginConfiguration
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  PODaemonConnection *serviceConnection;
  id v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  id v20;

  PO_LOG_POConfigurationManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager loginConfiguration].cold.1();

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  -[POConfigurationManager currentDeviceConfiguration](self, "currentDeviceConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sharedDeviceKeys");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[POConfigurationManager userIdentifier](self, "userIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  serviceConnection = self->_serviceConnection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__POConfigurationManager_loginConfiguration__block_invoke;
  v12[3] = &unk_24EC028E8;
  v12[4] = &v13;
  v12[5] = v19;
  -[PODaemonConnection loginConfigurationForIdentifer:completion:](serviceConnection, "loginConfigurationForIdentifer:completion:", v6, v12);
  v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v19, 8);

  return v10;
}

void __44__POConfigurationManager_loginConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  if (a2)
  {
    v6 = (objc_class *)MEMORY[0x24BE72EE0];
    v7 = a2;
    v8 = objc_msgSend([v6 alloc], "initWithData:", v7);

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;

}

- (BOOL)saveLoginConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  PODaemonConnection *serviceConnection;
  void *v12;
  void *v13;
  POConfigurationManager *v14;
  POLoginConfiguration *currentLoginConfiguration;
  BOOL v16;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager saveLoginConfiguration:].cold.1();

  -[POConfigurationManager currentDeviceConfiguration](self, "currentDeviceConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sharedDeviceKeys");

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[POConfigurationManager userIdentifier](self, "userIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@"), v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  serviceConnection = self->_serviceConnection;
  objc_msgSend(v4, "dataRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __49__POConfigurationManager_saveLoginConfiguration___block_invoke;
  v18[3] = &unk_24EC02550;
  v18[4] = &v19;
  -[PODaemonConnection saveLoginConfiguration:identifer:completion:](serviceConnection, "saveLoginConfiguration:identifer:completion:", v12, v8, v18);

  if (*((_BYTE *)v20 + 24))
  {
    -[POConfigurationManager loginConfigurationVersion](self, "loginConfigurationVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "increaseVersionWithMessage:", CFSTR("loginConfiguration updated"));

    v14 = self;
    objc_sync_enter(v14);
    currentLoginConfiguration = v14->_currentLoginConfiguration;
    v14->_currentLoginConfiguration = 0;

    objc_sync_exit(v14);
    v16 = *((_BYTE *)v20 + 24) != 0;
  }
  else
  {
    v16 = 0;
  }
  _Block_object_dispose(&v19, 8);

  return v16;
}

uint64_t __49__POConfigurationManager_saveLoginConfiguration___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)removeUserLoginConfiguration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  PO_LOG_POConfigurationManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager removeUserLoginConfiguration].cold.1();

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[POConfigurationManager userIdentifier](self, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[POConfigurationManager __removeLoginConfigurationForIdentifier:](self, "__removeLoginConfigurationForIdentifier:", v6);
  return v7;
}

- (BOOL)removeLoginConfiguration
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  PO_LOG_POConfigurationManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager removeLoginConfiguration].cold.1();

  -[POConfigurationManager currentDeviceConfiguration](self, "currentDeviceConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sharedDeviceKeys");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[POConfigurationManager userIdentifier](self, "userIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v9 = -[POConfigurationManager __removeLoginConfigurationForIdentifier:](self, "__removeLoginConfigurationForIdentifier:", v6);

  return v9;
}

- (BOOL)__removeLoginConfigurationForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  PODaemonConnection *serviceConnection;
  void *v7;
  POConfigurationManager *v8;
  POLoginConfiguration *currentLoginConfiguration;
  BOOL v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager __removeLoginConfigurationForIdentifier:].cold.1();

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  serviceConnection = self->_serviceConnection;
  v16 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__POConfigurationManager___removeLoginConfigurationForIdentifier___block_invoke;
  v12[3] = &unk_24EC02550;
  v12[4] = &v13;
  -[PODaemonConnection removeLoginConfigurationForIdentifer:completion:](serviceConnection, "removeLoginConfigurationForIdentifer:completion:", v4, v12);
  if (*((_BYTE *)v14 + 24))
  {
    -[POConfigurationManager loginConfigurationVersion](self, "loginConfigurationVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "increaseVersionWithMessage:", CFSTR("loginConfiguration updated"));

    v8 = self;
    objc_sync_enter(v8);
    currentLoginConfiguration = v8->_currentLoginConfiguration;
    v8->_currentLoginConfiguration = 0;

    objc_sync_exit(v8);
    v10 = *((_BYTE *)v14 + 24) != 0;
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v10;
}

uint64_t __66__POConfigurationManager___removeLoginConfigurationForIdentifier___block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)userConfigurationForUserName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PODaemonConnection *serviceConnection;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[5];
  id v24;
  uint64_t v25;
  uint64_t v26;
  id (*v27)();
  void *v28;
  id v29;

  v4 = a3;
  if (v4)
  {
    -[POConfigurationManager directoryServices](self, "directoryServices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifierForUserName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v25 = MEMORY[0x24BDAC760];
      v26 = 3221225472;
      v27 = __55__POConfigurationManager_userConfigurationForUserName___block_invoke;
      v28 = &unk_24EC025A0;
      v29 = v4;
      v13 = __55__POConfigurationManager_userConfigurationForUserName___block_invoke();

      v12 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__1;
    v23[4] = __Block_byref_object_dispose__1;
    v24 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__1;
    v21 = __Block_byref_object_dispose__1;
    v22 = 0;
    serviceConnection = self->_serviceConnection;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __55__POConfigurationManager_userConfigurationForUserName___block_invoke_116;
    v16[3] = &unk_24EC02D20;
    v16[4] = &v17;
    v16[5] = v23;
    -[PODaemonConnection userConfigurationForIdentifier:completion:](serviceConnection, "userConfigurationForIdentifier:completion:", v6, v16);
    v8 = (void *)v18[5];
    if (v8)
    {
      objc_msgSend(v8, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "isEqualToString:", v9);

      if (!v10)
      {
        v14 = __55__POConfigurationManager_userConfigurationForUserName___block_invoke_2();
        v12 = 0;
        goto LABEL_11;
      }
      v11 = (void *)v18[5];
    }
    else
    {
      v11 = 0;
    }
    v12 = v11;
LABEL_11:
    _Block_object_dispose(&v17, 8);

    _Block_object_dispose(v23, 8);
    goto LABEL_12;
  }
  v12 = 0;
LABEL_13:

  return v12;
}

id __55__POConfigurationManager_userConfigurationForUserName___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("identifier for user not found when retrieving user configuration"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __55__POConfigurationManager_userConfigurationForUserName___block_invoke_cold_1();

  return v0;
}

void __55__POConfigurationManager_userConfigurationForUserName___block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a3;
  if (v9)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

id __55__POConfigurationManager_userConfigurationForUserName___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("user identifier mismatch"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (BOOL)saveUserConfiguration:(id)a3 forUserName:(id)a4 syncToPreboot:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  PODaemonConnection *serviceConnection;
  POConfigurationManager *v14;
  POUserConfiguration *currentUserConfiguration;
  void *v16;
  BOOL v17;
  id v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  id (*v27)();
  void *v28;
  id v29;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  PO_LOG_POConfigurationManager();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager saveUserConfiguration:forUserName:syncToPreboot:].cold.1();

  -[POConfigurationManager directoryServices](self, "directoryServices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifierForUserName:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "setUniqueIdentifier:", v12);
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    serviceConnection = self->_serviceConnection;
    v24 = 0;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __74__POConfigurationManager_saveUserConfiguration_forUserName_syncToPreboot___block_invoke_122;
    v20[3] = &unk_24EC02550;
    v20[4] = &v21;
    -[PODaemonConnection saveUserConfiguration:forIdentifier:syncToPreboot:completion:](serviceConnection, "saveUserConfiguration:forIdentifier:syncToPreboot:completion:", v8, v12, v5, v20);
    if (*((_BYTE *)v22 + 24))
    {
      v14 = self;
      objc_sync_enter(v14);
      currentUserConfiguration = v14->_currentUserConfiguration;
      v14->_currentUserConfiguration = 0;

      objc_sync_exit(v14);
      -[POConfigurationManager userConfigurationVersion](v14, "userConfigurationVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "increaseVersionWithMessage:", CFSTR("userConfiguration updated"));

      v17 = *((_BYTE *)v22 + 24) != 0;
    }
    else
    {
      v17 = 0;
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = __74__POConfigurationManager_saveUserConfiguration_forUserName_syncToPreboot___block_invoke;
    v28 = &unk_24EC025A0;
    v29 = v9;
    v18 = __74__POConfigurationManager_saveUserConfiguration_forUserName_syncToPreboot___block_invoke();

    v17 = 0;
  }

  return v17;
}

id __74__POConfigurationManager_saveUserConfiguration_forUserName_syncToPreboot___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("identifier for user not found when saving user configuration"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __55__POConfigurationManager_userConfigurationForUserName___block_invoke_cold_1();

  return v0;
}

uint64_t __74__POConfigurationManager_saveUserConfiguration_forUserName_syncToPreboot___block_invoke_122(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)removeUserConfigurationForUserName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  PODaemonConnection *serviceConnection;
  void *v9;
  POConfigurationManager *v10;
  POUserConfiguration *currentUserConfiguration;
  BOOL v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  id (*v22)();
  void *v23;
  id v24;

  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager removeUserConfigurationForUserName:].cold.1();

  -[POConfigurationManager directoryServices](self, "directoryServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifierForUserName:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    serviceConnection = self->_serviceConnection;
    v19 = 0;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __61__POConfigurationManager_removeUserConfigurationForUserName___block_invoke_127;
    v15[3] = &unk_24EC02550;
    v15[4] = &v16;
    -[PODaemonConnection removeUserConfigurationForIdentifier:completion:](serviceConnection, "removeUserConfigurationForIdentifier:completion:", v7, v15);
    if (*((_BYTE *)v17 + 24))
    {
      -[POConfigurationManager loginConfigurationVersion](self, "loginConfigurationVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "increaseVersionWithMessage:", CFSTR("userConfiguration updated"));

      v10 = self;
      objc_sync_enter(v10);
      currentUserConfiguration = v10->_currentUserConfiguration;
      v10->_currentUserConfiguration = 0;

      objc_sync_exit(v10);
      v12 = *((_BYTE *)v17 + 24) != 0;
    }
    else
    {
      v12 = 0;
    }
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __61__POConfigurationManager_removeUserConfigurationForUserName___block_invoke;
    v23 = &unk_24EC025A0;
    v24 = v4;
    v13 = __61__POConfigurationManager_removeUserConfigurationForUserName___block_invoke();

    v12 = 0;
  }

  return v12;
}

id __61__POConfigurationManager_removeUserConfigurationForUserName___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("identifier for user not found when removing user configuration"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __55__POConfigurationManager_userConfigurationForUserName___block_invoke_cold_1();

  return v0;
}

uint64_t __61__POConfigurationManager_removeUserConfigurationForUserName___block_invoke_127(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)resetStoredConfiguration
{
  PODaemonConnection *serviceConnection;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  serviceConnection = self->_serviceConnection;
  v13 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__POConfigurationManager_resetStoredConfiguration__block_invoke;
  v9[3] = &unk_24EC02550;
  v9[4] = &v10;
  -[PODaemonConnection resetStoredConfigurationWithCompletion:](serviceConnection, "resetStoredConfigurationWithCompletion:", v9);
  if (*((_BYTE *)v11 + 24))
  {
    -[POConfigurationManager userConfigurationVersion](self, "userConfigurationVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reset");

    -[POConfigurationManager loginConfigurationVersion](self, "loginConfigurationVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reset");

    -[POConfigurationManager deviceConfigurationVersion](self, "deviceConfigurationVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reset");

    v7 = *((_BYTE *)v11 + 24) != 0;
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __50__POConfigurationManager_resetStoredConfiguration__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)enablePlatformSSORulesIfNeeded:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  PODaemonConnection *serviceConnection;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  serviceConnection = self->_serviceConnection;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__POConfigurationManager_enablePlatformSSORulesIfNeeded___block_invoke;
  v6[3] = &unk_24EC02870;
  v6[4] = &v13;
  v6[5] = &v7;
  -[PODaemonConnection enablePlatformSSORules:](serviceConnection, "enablePlatformSSORules:", v6);
  if (v4)
    v4[2](v4, *((unsigned __int8 *)v14 + 24), v8[5]);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
}

void __57__POConfigurationManager_enablePlatformSSORulesIfNeeded___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)restorePlatformSSORulesIfNeeded
{
  PODaemonConnection *serviceConnection;
  _QWORD v3[5];
  _QWORD v4[3];
  char v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  serviceConnection = self->_serviceConnection;
  v5 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__POConfigurationManager_restorePlatformSSORulesIfNeeded__block_invoke;
  v3[3] = &unk_24EC02550;
  v3[4] = v4;
  -[PODaemonConnection disablePlatformSSORules:](serviceConnection, "disablePlatformSSORules:", v3);
  _Block_object_dispose(v4, 8);
}

uint64_t __57__POConfigurationManager_restorePlatformSSORulesIfNeeded__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (NSString)userIdentifier
{
  NSString *userIdentifier;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;
  id v8;

  userIdentifier = self->_userIdentifier;
  if (!userIdentifier)
  {
    -[POConfigurationManager directoryServices](self, "directoryServices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[POConfigurationCoreManager userName](self, "userName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifierForUserName:", v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_userIdentifier;
    self->_userIdentifier = v6;

    userIdentifier = self->_userIdentifier;
    if (!userIdentifier)
    {
      v8 = __40__POConfigurationManager_userIdentifier__block_invoke();
      userIdentifier = self->_userIdentifier;
    }
  }
  return userIdentifier;
}

id __40__POConfigurationManager_userIdentifier__block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("id for user not found."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (NSDate)tokenExpiration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  void *v11;
  id v13;

  -[POConfigurationManager keychainHelper](self, "keychainHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[POConfigurationManager currentDeviceConfiguration](self, "currentDeviceConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POConfigurationManager currentUserConfiguration](self, "currentUserConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend(v3, "retrieveTokensFromKeychainForService:username:returningTokens:metaData:", v5, v7, 0, &v13);
  v9 = v13;

  if (v8)
  {
    v10 = __41__POConfigurationManager_tokenExpiration__block_invoke();
  }
  else if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BE72F88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v11 = 0;
LABEL_6:

  return (NSDate *)v11;
}

id __41__POConfigurationManager_tokenExpiration__block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("SSO tokens not found."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

- (NSDate)tokenReceived
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  void *v16;
  id v18;

  -[POConfigurationManager currentUserConfiguration](self, "currentUserConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    return (NSDate *)0;
  }
  v5 = (void *)v4;
  -[POConfigurationManager currentDeviceConfiguration](self, "currentDeviceConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    return (NSDate *)0;
  -[POConfigurationManager keychainHelper](self, "keychainHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[POConfigurationManager currentDeviceConfiguration](self, "currentDeviceConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extensionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[POConfigurationManager currentUserConfiguration](self, "currentUserConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v13 = objc_msgSend(v8, "retrieveTokensFromKeychainForService:username:returningTokens:metaData:", v10, v12, 0, &v18);
  v14 = v18;

  if (v13)
  {
    v15 = __39__POConfigurationManager_tokenReceived__block_invoke();
  }
  else if (v14)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE72F90]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v16 = 0;
LABEL_10:

  return (NSDate *)v16;
}

id __39__POConfigurationManager_tokenReceived__block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("Error retrieving tokens for token received"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

- (id)currentRefreshToken
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[POConfigurationManager currentDeviceConfiguration](self, "currentDeviceConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[POConfigurationManager currentDeviceConfiguration](self, "currentDeviceConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[POConfigurationManager tokensForExtensionIdentifier:](self, "tokensForExtensionIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[POConfigurationManager refreshTokenFromTokens:](self, "refreshTokenFromTokens:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)refreshTokenFromTokens:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 16, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __49__POConfigurationManager_refreshTokenFromTokens___block_invoke;
    v9[3] = &unk_24EC025A0;
    v10 = v4;
    v6 = __49__POConfigurationManager_refreshTokenFromTokens___block_invoke((uint64_t)v9);

    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("refresh_token"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id __49__POConfigurationManager_refreshTokenFromTokens___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1004, *(_QWORD *)(a1 + 32), CFSTR("Error deserializing tokens for refresh token"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (id)tokensForExtensionIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  id v17;

  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager tokensForExtensionIdentifier:].cold.2();

  -[POConfigurationManager currentUserConfiguration](self, "currentUserConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PO_LOG_POConfigurationManager();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[POConfigurationManager tokensForExtensionIdentifier:].cold.1();
    goto LABEL_11;
  }
  -[POConfigurationManager keychainHelper](self, "keychainHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[POConfigurationManager currentUserConfiguration](self, "currentUserConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v11 = objc_msgSend(v8, "retrieveTokensFromKeychainForService:username:returningTokens:metaData:", v4, v10, &v17, 0);
  v12 = v17;

  if (v11)
  {
    if (v11 == -25300)
      v13 = __55__POConfigurationManager_tokensForExtensionIdentifier___block_invoke();
    else
      v15 = __55__POConfigurationManager_tokensForExtensionIdentifier___block_invoke_141();
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v12 = v12;
  v14 = v12;
LABEL_12:

  return v14;
}

id __55__POConfigurationManager_tokensForExtensionIdentifier___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("SSO Tokens not found on keychain"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __55__POConfigurationManager_tokensForExtensionIdentifier___block_invoke_141()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Error retrieving tokens from keychain"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

- (BOOL)setTokens:(id)a3 extensionIdentifier:(id)a4 returningError:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  PO_LOG_POConfigurationManager();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager setTokens:extensionIdentifier:returningError:].cold.2();

  -[POConfigurationManager currentUserConfiguration](self, "currentUserConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    PO_LOG_POConfigurationManager();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[POConfigurationManager tokensForExtensionIdentifier:].cold.1();

LABEL_22:
    v23 = 0;
    goto LABEL_23;
  }
  if (a5)
    *a5 = 0;
  if (v8)
  {
    -[POConfigurationManager calculateExpirationForTokens:](self, "calculateExpirationForTokens:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
    {
      v15 = *MEMORY[0x24BE72F90];
      v33[0] = *MEMORY[0x24BE72F88];
      v33[1] = v15;
      v34[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    -[POConfigurationManager keychainHelper](self, "keychainHelper");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[POConfigurationManager currentUserConfiguration](self, "currentUserConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "uniqueIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v26, "addTokens:metaData:toKeychainForService:username:", v8, v17, v9, v28);

    if (!v29)
    {

      v23 = 1;
      goto LABEL_23;
    }
    __71__POConfigurationManager_setTokens_extensionIdentifier_returningError___block_invoke();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (a5)
      *a5 = objc_retainAutorelease(v30);

    goto LABEL_22;
  }
  -[POConfigurationManager keychainHelper](self, "keychainHelper");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[POConfigurationManager currentUserConfiguration](self, "currentUserConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "uniqueIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v19, "removeTokensFromKeychainWithService:username:", v9, v21);

  v23 = 1;
  if (v22 != -25300 && v22)
  {
    __71__POConfigurationManager_setTokens_extensionIdentifier_returningError___block_invoke_148();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a5)
      *a5 = objc_retainAutorelease(v24);

    v23 = v22 == -25300;
  }
LABEL_23:

  return v23;
}

id __71__POConfigurationManager_setTokens_extensionIdentifier_returningError___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Error saving tokens to keychain"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

id __71__POConfigurationManager_setTokens_extensionIdentifier_returningError___block_invoke_148()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Error removing tokens from keychain"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __46__POKerberosHelper_importKerberosEntry_error___block_invoke_cold_1();

  return v0;
}

- (id)calculateExpirationForTokens:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 16, &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  v5 = v4;
  if (v4)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __55__POConfigurationManager_calculateExpirationForTokens___block_invoke;
    v11[3] = &unk_24EC025A0;
    v12 = v4;
    v6 = __55__POConfigurationManager_calculateExpirationForTokens___block_invoke((uint64_t)v11);
    v7 = 0;
    v8 = v12;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("refresh_token_expires_in"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("expires_in"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v7 = 0;
        goto LABEL_7;
      }
    }
    v9 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v9, "dateWithTimeIntervalSinceNow:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v7;
}

id __55__POConfigurationManager_calculateExpirationForTokens___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1008, *(_QWORD *)(a1 + 32), CFSTR("failed to deserialize tokens to calculate expiration date."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (BOOL)saveAppSSOConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  PODaemonConnection *serviceConnection;
  char v11;
  _QWORD v13[7];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager saveAppSSOConfiguration:].cold.1();

  PO_LOG_POConfigurationManager();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  PO_LOG_POConfigurationManager();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22307D000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PlatformSSO_SaveConfig", " enableTelemetry=YES ", buf, 2u);
  }

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  *(_QWORD *)buf = 0;
  v15 = buf;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  serviceConnection = self->_serviceConnection;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__POConfigurationManager_saveAppSSOConfiguration___block_invoke;
  v13[3] = &unk_24EC02D48;
  v13[4] = &v20;
  v13[5] = buf;
  v13[6] = v7;
  -[PODaemonConnection saveAppSSOConfiguration:completion:](serviceConnection, "saveAppSSOConfiguration:completion:", v4, v13);
  v11 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __50__POConfigurationManager_saveAppSSOConfiguration___block_invoke(_QWORD *a1, char a2, id obj)
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), obj);
  PO_LOG_POConfigurationManager();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = a1[6];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_22307D000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PlatformSSO_SaveConfig", (const char *)&unk_2230CFE32, v7, 2u);
  }

}

- (BOOL)createAppSSOCachePath
{
  NSObject *v3;
  PODaemonConnection *serviceConnection;
  char v5;
  _QWORD v7[6];
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  PO_LOG_POConfigurationManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POConfigurationManager createAppSSOCachePath].cold.1();

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__1;
  v8[4] = __Block_byref_object_dispose__1;
  v9 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__POConfigurationManager_createAppSSOCachePath__block_invoke;
  v7[3] = &unk_24EC02870;
  v7[4] = &v10;
  v7[5] = v8;
  -[PODaemonConnection createAppSSOCachePathWithCompletion:](serviceConnection, "createAppSSOCachePathWithCompletion:", v7);
  v5 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(v8, 8);

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __47__POConfigurationManager_createAppSSOCachePath__block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (PODirectoryServices)directoryServices
{
  return (PODirectoryServices *)objc_getProperty(self, a2, 136, 1);
}

- (void)setDirectoryServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (POConfigurationVersion)userConfigurationVersion
{
  return (POConfigurationVersion *)objc_getProperty(self, a2, 144, 1);
}

- (void)setUserConfigurationVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (POConfigurationVersion)loginConfigurationVersion
{
  return (POConfigurationVersion *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLoginConfigurationVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (POConfigurationVersion)deviceConfigurationVersion
{
  return (POConfigurationVersion *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDeviceConfigurationVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (POKeychainHelper)keychainHelper
{
  return (POKeychainHelper *)objc_getProperty(self, a2, 168, 1);
}

- (void)setKeychainHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_deviceConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_loginConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_userConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_directoryServices, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_currentDeviceConfiguration, 0);
  objc_storeStrong((id *)&self->_currentLoginConfiguration, 0);
  objc_storeStrong((id *)&self->_currentUserConfiguration, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_1();
  objc_msgSend((id)OUTLINED_FUNCTION_11(v0, v1), "userName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_22307D000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

- (void)deviceConfiguration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)userDeviceConfiguration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)saveDeviceConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeDeviceConfiguration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeUserDeviceConfiguration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)__removeDeviceConfigurationWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)loginConfiguration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)saveLoginConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeUserLoginConfiguration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeLoginConfiguration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)__removeLoginConfigurationForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __55__POConfigurationManager_userConfigurationForUserName___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_22307D000, v0, (uint64_t)v0, "%{public}@, %{public}@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)saveUserConfiguration:forUserName:syncToPreboot:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeUserConfigurationForUserName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)tokensForExtensionIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "no uniqueIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)tokensForExtensionIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "retrieving sso tokens", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setTokens:extensionIdentifier:returningError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "setting sso tokens", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)saveAppSSOConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createAppSSOCachePath
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3(&dword_22307D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
