@implementation POConfigurationCoreManager

- (POConfigurationCoreManager)initWithUserName:(id)a3 identifierProvider:(id)a4 sharedOnly:(BOOL)a5 volume:(id)a6
{
  id v11;
  id v12;
  id v13;
  POConfigurationCoreManager *v14;
  POConfigurationCoreManager *v15;
  PODaemonCoreConnection *v16;
  PODaemonCoreConnection *serviceConnection;
  POConfigurationVersion *v18;
  POConfigurationVersion *userConfigurationVersion;
  POConfigurationVersion *v20;
  POConfigurationVersion *loginConfigurationVersion;
  POConfigurationVersion *v22;
  POConfigurationVersion *deviceConfigurationVersion;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)POConfigurationCoreManager;
  v14 = -[POConfigurationCoreManager init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_userName, a3);
    v16 = -[PODaemonCoreConnection initWithVolume:]([PODaemonCoreConnection alloc], "initWithVolume:", v13);
    serviceConnection = v15->_serviceConnection;
    v15->_serviceConnection = v16;

    objc_storeStrong((id *)&v15->_userIdentifierProvider, a4);
    v18 = -[POConfigurationVersion initWithConfigurationType:]([POConfigurationVersion alloc], "initWithConfigurationType:", 0);
    userConfigurationVersion = v15->_userConfigurationVersion;
    v15->_userConfigurationVersion = v18;

    v20 = -[POConfigurationVersion initWithConfigurationType:]([POConfigurationVersion alloc], "initWithConfigurationType:", 1);
    loginConfigurationVersion = v15->_loginConfigurationVersion;
    v15->_loginConfigurationVersion = v20;

    v22 = -[POConfigurationVersion initWithConfigurationType:]([POConfigurationVersion alloc], "initWithConfigurationType:", 2);
    deviceConfigurationVersion = v15->_deviceConfigurationVersion;
    v15->_deviceConfigurationVersion = v22;

    v15->_sharedOnly = a5;
  }

  return v15;
}

- (POConfigurationCoreManager)initWithUserName:(id)a3 identifierProvider:(id)a4 sharedOnly:(BOOL)a5
{
  return -[POConfigurationCoreManager initWithUserName:identifierProvider:sharedOnly:volume:](self, "initWithUserName:identifierProvider:sharedOnly:volume:", a3, a4, a5, 0);
}

- (POUserConfiguration)currentUserConfiguration
{
  POConfigurationCoreManager *v2;
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
  -[POConfigurationCoreManager userConfigurationVersion](v2, "userConfigurationVersion");
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
      -[POConfigurationCoreManager userConfigurationForUserName:](v2, "userConfigurationForUserName:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v2->_currentUserConfiguration;
      v2->_currentUserConfiguration = (POUserConfiguration *)v7;

      currentUserConfiguration = v2->_currentUserConfiguration;
      if (!currentUserConfiguration)
      {
        v9 = __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_65();
LABEL_8:
        currentUserConfiguration = v2->_currentUserConfiguration;
      }
    }
  }
  else
  {
    -[POConfigurationCoreManager userName](v2, "userName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[POConfigurationCoreManager userConfigurationForUserName:](v2, "userConfigurationForUserName:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v2->_currentUserConfiguration;
    v2->_currentUserConfiguration = (POUserConfiguration *)v11;

    currentUserConfiguration = v2->_currentUserConfiguration;
    if (!currentUserConfiguration)
    {
      v13 = __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke();
      goto LABEL_8;
    }
  }
  v14 = currentUserConfiguration;
LABEL_11:
  objc_sync_exit(v2);

  return v14;
}

id __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("no user configuration for user"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_65()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1005, CFSTR("no user configuration for user"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (PODeviceConfiguration)currentDeviceConfiguration
{
  POConfigurationCoreManager *v2;
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
  -[POConfigurationCoreManager deviceConfigurationVersion](v2, "deviceConfigurationVersion");
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
      -[POConfigurationCoreManager deviceConfiguration](v2, "deviceConfiguration");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v2->_currentDeviceConfiguration;
      v2->_currentDeviceConfiguration = (PODeviceConfiguration *)v6;

      currentDeviceConfiguration = v2->_currentDeviceConfiguration;
      if (!currentDeviceConfiguration)
      {
        v8 = __56__POConfigurationCoreManager_currentDeviceConfiguration__block_invoke_68();
LABEL_8:
        currentDeviceConfiguration = v2->_currentDeviceConfiguration;
      }
    }
  }
  else
  {
    -[POConfigurationCoreManager deviceConfiguration](v2, "deviceConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v2->_currentDeviceConfiguration;
    v2->_currentDeviceConfiguration = (PODeviceConfiguration *)v9;

    currentDeviceConfiguration = v2->_currentDeviceConfiguration;
    if (!currentDeviceConfiguration)
    {
      v11 = __56__POConfigurationCoreManager_currentDeviceConfiguration__block_invoke();
      goto LABEL_8;
    }
  }
  v12 = currentDeviceConfiguration;
LABEL_11:
  objc_sync_exit(v2);

  return v12;
}

id __56__POConfigurationCoreManager_currentDeviceConfiguration__block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("no device configuration"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __56__POConfigurationCoreManager_currentDeviceConfiguration__block_invoke_68()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1005, CFSTR("no device configuration"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (POLoginConfiguration)currentLoginConfiguration
{
  POConfigurationCoreManager *v2;
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
  -[POConfigurationCoreManager loginConfigurationVersion](v2, "loginConfigurationVersion");
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
      -[POConfigurationCoreManager loginConfiguration](v2, "loginConfiguration");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = v2->_currentLoginConfiguration;
      v2->_currentLoginConfiguration = (POLoginConfiguration *)v6;

      currentLoginConfiguration = v2->_currentLoginConfiguration;
      if (!currentLoginConfiguration)
      {
        v8 = __55__POConfigurationCoreManager_currentLoginConfiguration__block_invoke_71();
LABEL_8:
        currentLoginConfiguration = v2->_currentLoginConfiguration;
      }
    }
  }
  else
  {
    -[POConfigurationCoreManager loginConfiguration](v2, "loginConfiguration");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v2->_currentLoginConfiguration;
    v2->_currentLoginConfiguration = (POLoginConfiguration *)v9;

    currentLoginConfiguration = v2->_currentLoginConfiguration;
    if (!currentLoginConfiguration)
    {
      v11 = __55__POConfigurationCoreManager_currentLoginConfiguration__block_invoke();
      goto LABEL_8;
    }
  }
  v12 = currentLoginConfiguration;
LABEL_11:
  objc_sync_exit(v2);

  return v12;
}

id __55__POConfigurationCoreManager_currentLoginConfiguration__block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("no login configuration for user"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __55__POConfigurationCoreManager_currentLoginConfiguration__block_invoke_71()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1005, CFSTR("no login configuration for user"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (id)deviceConfiguration
{
  NSObject *v3;
  PODaemonCoreConnection *serviceConnection;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  PODaemonCoreConnection *v9;
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
    -[POConfigurationCoreManager deviceConfiguration].cold.1();

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
  v13[2] = __49__POConfigurationCoreManager_deviceConfiguration__block_invoke;
  v13[3] = &unk_251500628;
  v13[4] = &v14;
  v13[5] = v20;
  -[PODaemonCoreConnection deviceConfigurationForIdentifer:completion:](serviceConnection, "deviceConfigurationForIdentifer:completion:", 0, v13);
  if (objc_msgSend((id)v15[5], "sharedDeviceKeys")
    && objc_msgSend((id)v15[5], "registrationCompleted"))
  {
    -[POConfigurationCoreManager setSharedOnly:](self, "setSharedOnly:", 1);
  }
  if (!v15[5] && !-[POConfigurationCoreManager sharedOnly](self, "sharedOnly"))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[POConfigurationCoreManager userIdentifier](self, "userIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = self->_serviceConnection;
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __49__POConfigurationCoreManager_deviceConfiguration__block_invoke_2;
    v12[3] = &unk_251500628;
    v12[4] = &v14;
    v12[5] = v20;
    -[PODaemonCoreConnection deviceConfigurationForIdentifer:completion:](v9, "deviceConfigurationForIdentifer:completion:", v8, v12);

  }
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(v20, 8);
  return v10;
}

void __49__POConfigurationCoreManager_deviceConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PODeviceConfiguration *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  if (a2)
  {
    v6 = a2;
    v7 = -[PODeviceConfiguration initWithData:]([PODeviceConfiguration alloc], "initWithData:", v6);

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

void __49__POConfigurationCoreManager_deviceConfiguration__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PODeviceConfiguration *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  if (a2)
  {
    v6 = a2;
    v7 = -[PODeviceConfiguration initWithData:]([PODeviceConfiguration alloc], "initWithData:", v6);

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (PODeviceConfiguration)userDeviceConfiguration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  PODaemonCoreConnection *serviceConnection;
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
    -[POConfigurationCoreManager userDeviceConfiguration].cold.1();

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[POConfigurationCoreManager userIdentifier](self, "userIdentifier");
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
  v10[2] = __53__POConfigurationCoreManager_userDeviceConfiguration__block_invoke;
  v10[3] = &unk_251500628;
  v10[4] = &v11;
  v10[5] = v17;
  -[PODaemonCoreConnection deviceConfigurationForIdentifer:completion:](serviceConnection, "deviceConfigurationForIdentifer:completion:", v6, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);
  return (PODeviceConfiguration *)v8;
}

void __53__POConfigurationCoreManager_userDeviceConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  PODeviceConfiguration *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  if (a2)
  {
    v6 = a2;
    v7 = -[PODeviceConfiguration initWithData:]([PODeviceConfiguration alloc], "initWithData:", v6);

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (id)loginConfiguration
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  PODaemonCoreConnection *serviceConnection;
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
    -[POConfigurationCoreManager loginConfiguration].cold.1();

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
  -[POConfigurationCoreManager currentDeviceConfiguration](self, "currentDeviceConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sharedDeviceKeys");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    -[POConfigurationCoreManager userIdentifier](self, "userIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  serviceConnection = self->_serviceConnection;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__POConfigurationCoreManager_loginConfiguration__block_invoke;
  v12[3] = &unk_251500628;
  v12[4] = &v13;
  v12[5] = v19;
  -[PODaemonCoreConnection loginConfigurationForIdentifer:completion:](serviceConnection, "loginConfigurationForIdentifer:completion:", v6, v12);
  v10 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v19, 8);

  return v10;
}

void __48__POConfigurationCoreManager_loginConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  POLoginConfiguration *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  if (a2)
  {
    v6 = a2;
    v7 = -[POLoginConfiguration initWithData:]([POLoginConfiguration alloc], "initWithData:", v6);

    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;

}

- (id)userConfigurationForUserName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PODaemonCoreConnection *serviceConnection;
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
    -[POConfigurationCoreManager userIdentifierProvider](self, "userIdentifierProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueIdentifierForUserName:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v25 = MEMORY[0x24BDAC760];
      v26 = 3221225472;
      v27 = __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke;
      v28 = &unk_2514FF9D0;
      v29 = v4;
      v13 = __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke();

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
    v16[2] = __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke_80;
    v16[3] = &unk_251500650;
    v16[4] = &v17;
    v16[5] = v23;
    -[PODaemonCoreConnection userConfigurationForIdentifier:completion:](serviceConnection, "userConfigurationForIdentifier:completion:", v6, v16);
    v8 = (void *)v18[5];
    if (v8)
    {
      objc_msgSend(v8, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "isEqualToString:", v9);

      if (!v10)
      {
        v14 = __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke_2();
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

id __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("identifier for user not found when retrieving user configuration"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1();

  return v0;
}

void __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke_80(uint64_t a1, void *a2, void *a3)
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

id __59__POConfigurationCoreManager_userConfigurationForUserName___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("user identifier mismatch"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (id)userLoginStateForUserName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  PODaemonCoreConnection *serviceConnection;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  uint64_t v27;
  id (*v28)();
  void *v29;
  id v30;

  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POConfigurationCoreManager userLoginStateForUserName:].cold.1();

  -[POConfigurationCoreManager userIdentifierProvider](self, "userIdentifierProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifierForUserName:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__1;
    v24[4] = __Block_byref_object_dispose__1;
    v25 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__1;
    v22 = __Block_byref_object_dispose__1;
    v23 = 0;
    serviceConnection = self->_serviceConnection;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke_86;
    v17[3] = &unk_251500678;
    v17[4] = &v18;
    v17[5] = v24;
    -[PODaemonCoreConnection userLoginStateForIdentifier:completion:](serviceConnection, "userLoginStateForIdentifier:completion:", v7, v17);
    v9 = (void *)v19[5];
    if (v9)
    {
      objc_msgSend(v9, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "isEqualToString:", v10);

      if (!v11)
      {
        v15 = __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke_2();
        v14 = 0;
        goto LABEL_11;
      }
      v12 = (void *)v19[5];
    }
    else
    {
      v12 = 0;
    }
    v14 = v12;
LABEL_11:
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(v24, 8);
    goto LABEL_12;
  }
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke;
  v29 = &unk_2514FF9D0;
  v30 = v4;
  v13 = __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke();

  v14 = 0;
LABEL_12:

  return v14;
}

id __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("identifier for user not found when retrieving login state"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1();

  return v0;
}

void __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke_86(uint64_t a1, void *a2, void *a3)
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

id __56__POConfigurationCoreManager_userLoginStateForUserName___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("user identifier mismatch"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (BOOL)updateLoginStateForUserName:(id)a3 state:(unint64_t)a4 loginDate:(id)a5 loginType:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  PODaemonCoreConnection *serviceConnection;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  id v20;
  void *v22;
  void *v23;
  _QWORD v24[14];
  id v25;
  _BYTE buf[24];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  POConfigurationCoreManager *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  PO_LOG_POConfigurationManager();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    +[POConstantCoreUtil stringForLoginPolicyState:](POConstantCoreUtil, "stringForLoginPolicyState:", a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[POConstantCoreUtil stringForLoginType:](POConstantCoreUtil, "stringForLoginType:", a6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "-[POConfigurationCoreManager updateLoginStateForUserName:state:loginDate:loginType:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2114;
    v27 = v11;
    v28 = 2114;
    v29 = v23;
    v30 = 2112;
    v31 = self;
    _os_log_debug_impl(&dword_24440D000, v12, OS_LOG_TYPE_DEBUG, "%s state: %{public}@, loginDate: %{public}@, loginDate: %{public}@ on %@", buf, 0x34u);

  }
  -[POConfigurationCoreManager userIdentifierProvider](self, "userIdentifierProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uniqueIdentifierForUserName:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v24[10] = MEMORY[0x24BDAC760];
    v24[11] = 3221225472;
    v24[12] = __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke;
    v24[13] = &unk_2514FF9D0;
    v25 = v10;
    v19 = __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke();

LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  if (a4 >= 3)
  {
    v24[5] = MEMORY[0x24BDAC760];
    v24[6] = 3221225472;
    v24[7] = __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke_91;
    v24[8] = &__block_descriptor_40_e14___NSError_8__0l;
    v24[9] = a4;
    v20 = __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke_91();
    goto LABEL_8;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v27) = 0;
  serviceConnection = self->_serviceConnection;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke_96;
  v24[3] = &unk_2515006A0;
  v24[4] = buf;
  -[PODaemonCoreConnection updateLoginStateForIdentifier:state:loginDate:loginType:completion:](serviceConnection, "updateLoginStateForIdentifier:state:loginDate:loginType:completion:", v14, v16, v11, v17, v24);

  v18 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
  _Block_object_dispose(buf, 8);
LABEL_9:

  return v18;
}

id __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("identifier for user not found when saving pending tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1();

  return v0;
}

id __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke_91()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("invalid login state"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_74_cold_1();

  return v0;
}

uint64_t __84__POConfigurationCoreManager_updateLoginStateForUserName_state_loginDate_loginType___block_invoke_96(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isPlatformSSOUserName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POConfigurationCoreManager isPlatformSSOUserName:].cold.2();

  -[POConfigurationCoreManager currentDeviceConfiguration](self, "currentDeviceConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nonPlatformSSOAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "containsObject:", v8);
  if (v9)
  {
    PO_LOG_POConfigurationManager();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[POConfigurationCoreManager isPlatformSSOUserName:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

  }
  return v9 ^ 1;
}

- (BOOL)savePendingSSOTokens:(id)a3 forUserName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  PODaemonCoreConnection *serviceConnection;
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

  v6 = a3;
  v7 = a4;
  PO_LOG_POConfigurationManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POConfigurationCoreManager savePendingSSOTokens:forUserName:].cold.1();

  -[POConfigurationCoreManager userIdentifierProvider](self, "userIdentifierProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifierForUserName:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    serviceConnection = self->_serviceConnection;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __63__POConfigurationCoreManager_savePendingSSOTokens_forUserName___block_invoke_98;
    v15[3] = &unk_2515006A0;
    v15[4] = &v16;
    -[PODaemonCoreConnection savePendingSSOTokens:identifer:completion:](serviceConnection, "savePendingSSOTokens:identifer:completion:", v6, v10, v15);
    v12 = *((_BYTE *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __63__POConfigurationCoreManager_savePendingSSOTokens_forUserName___block_invoke;
    v23 = &unk_2514FF9D0;
    v24 = v7;
    v13 = __63__POConfigurationCoreManager_savePendingSSOTokens_forUserName___block_invoke();

    v12 = 0;
  }

  return v12;
}

id __63__POConfigurationCoreManager_savePendingSSOTokens_forUserName___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("identifier for user not found when saving pending tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1();

  return v0;
}

uint64_t __63__POConfigurationCoreManager_savePendingSSOTokens_forUserName___block_invoke_98(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)retrievePendingSSOTokensForUserName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  PODaemonCoreConnection *serviceConnection;
  id v9;
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
  uint64_t v21;
  uint64_t v22;
  id (*v23)();
  void *v24;
  id v25;

  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POConfigurationCoreManager retrievePendingSSOTokensForUserName:].cold.1();

  -[POConfigurationCoreManager userIdentifierProvider](self, "userIdentifierProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifierForUserName:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
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
    serviceConnection = self->_serviceConnection;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __66__POConfigurationCoreManager_retrievePendingSSOTokensForUserName___block_invoke_101;
    v12[3] = &unk_251500628;
    v12[4] = &v13;
    v12[5] = v19;
    -[PODaemonCoreConnection retrievePendingSSOTokenForIdentifer:completion:](serviceConnection, "retrievePendingSSOTokenForIdentifer:completion:", v7, v12);
    v9 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(v19, 8);
  }
  else
  {
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __66__POConfigurationCoreManager_retrievePendingSSOTokensForUserName___block_invoke;
    v24 = &unk_2514FF9D0;
    v25 = v4;
    v10 = __66__POConfigurationCoreManager_retrievePendingSSOTokensForUserName___block_invoke();

    v9 = 0;
  }

  return v9;
}

id __66__POConfigurationCoreManager_retrievePendingSSOTokensForUserName___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("identifier for user not found when retrieving pending tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1();

  return v0;
}

void __66__POConfigurationCoreManager_retrievePendingSSOTokensForUserName___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)saveStashedSSOTokens:(id)a3 forUserName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  PODaemonCoreConnection *serviceConnection;
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

  v6 = a3;
  v7 = a4;
  PO_LOG_POConfigurationManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POConfigurationCoreManager saveStashedSSOTokens:forUserName:].cold.1();

  -[POConfigurationCoreManager userIdentifierProvider](self, "userIdentifierProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifierForUserName:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    serviceConnection = self->_serviceConnection;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __63__POConfigurationCoreManager_saveStashedSSOTokens_forUserName___block_invoke_104;
    v15[3] = &unk_2515006A0;
    v15[4] = &v16;
    -[PODaemonCoreConnection saveStashedSSOTokens:identifer:completion:](serviceConnection, "saveStashedSSOTokens:identifer:completion:", v6, v10, v15);
    v12 = *((_BYTE *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __63__POConfigurationCoreManager_saveStashedSSOTokens_forUserName___block_invoke;
    v23 = &unk_2514FF9D0;
    v24 = v7;
    v13 = __63__POConfigurationCoreManager_saveStashedSSOTokens_forUserName___block_invoke();

    v12 = 0;
  }

  return v12;
}

id __63__POConfigurationCoreManager_saveStashedSSOTokens_forUserName___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("identifier for user not found when saving stashed tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1();

  return v0;
}

uint64_t __63__POConfigurationCoreManager_saveStashedSSOTokens_forUserName___block_invoke_104(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)retrieveStashedSSOTokensForUserName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  PODaemonCoreConnection *serviceConnection;
  id v9;
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
  uint64_t v21;
  uint64_t v22;
  id (*v23)();
  void *v24;
  id v25;

  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POConfigurationCoreManager retrieveStashedSSOTokensForUserName:].cold.1();

  -[POConfigurationCoreManager userIdentifierProvider](self, "userIdentifierProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifierForUserName:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
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
    serviceConnection = self->_serviceConnection;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __66__POConfigurationCoreManager_retrieveStashedSSOTokensForUserName___block_invoke_107;
    v12[3] = &unk_251500628;
    v12[4] = &v13;
    v12[5] = v19;
    -[PODaemonCoreConnection retrieveStashedSSOTokenForIdentifer:completion:](serviceConnection, "retrieveStashedSSOTokenForIdentifer:completion:", v7, v12);
    v9 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(v19, 8);
  }
  else
  {
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __66__POConfigurationCoreManager_retrieveStashedSSOTokensForUserName___block_invoke;
    v24 = &unk_2514FF9D0;
    v25 = v4;
    v10 = __66__POConfigurationCoreManager_retrieveStashedSSOTokensForUserName___block_invoke();

    v9 = 0;
  }

  return v9;
}

id __66__POConfigurationCoreManager_retrieveStashedSSOTokensForUserName___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("identifier for user not found when retrieving stashed tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1();

  return v0;
}

void __66__POConfigurationCoreManager_retrieveStashedSSOTokensForUserName___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)saveStashedDecryptionContext:(id)a3 forUserName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  PODaemonCoreConnection *serviceConnection;
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

  v6 = a3;
  v7 = a4;
  PO_LOG_POConfigurationManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POConfigurationCoreManager saveStashedDecryptionContext:forUserName:].cold.1();

  -[POConfigurationCoreManager userIdentifierProvider](self, "userIdentifierProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifierForUserName:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    serviceConnection = self->_serviceConnection;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __71__POConfigurationCoreManager_saveStashedDecryptionContext_forUserName___block_invoke_110;
    v15[3] = &unk_2515006A0;
    v15[4] = &v16;
    -[PODaemonCoreConnection saveStashedDecryptionContext:identifer:completion:](serviceConnection, "saveStashedDecryptionContext:identifer:completion:", v6, v10, v15);
    v12 = *((_BYTE *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __71__POConfigurationCoreManager_saveStashedDecryptionContext_forUserName___block_invoke;
    v23 = &unk_2514FF9D0;
    v24 = v7;
    v13 = __71__POConfigurationCoreManager_saveStashedDecryptionContext_forUserName___block_invoke();

    v12 = 0;
  }

  return v12;
}

id __71__POConfigurationCoreManager_saveStashedDecryptionContext_forUserName___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("identifier for user not found when saving stashed context"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1();

  return v0;
}

uint64_t __71__POConfigurationCoreManager_saveStashedDecryptionContext_forUserName___block_invoke_110(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)retrieveStashedDecryptionContextForUserName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  PODaemonCoreConnection *serviceConnection;
  id v9;
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
  uint64_t v21;
  uint64_t v22;
  id (*v23)();
  void *v24;
  id v25;

  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POConfigurationCoreManager retrieveStashedDecryptionContextForUserName:].cold.1();

  -[POConfigurationCoreManager userIdentifierProvider](self, "userIdentifierProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifierForUserName:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
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
    serviceConnection = self->_serviceConnection;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __74__POConfigurationCoreManager_retrieveStashedDecryptionContextForUserName___block_invoke_111;
    v12[3] = &unk_251500628;
    v12[4] = &v13;
    v12[5] = v19;
    -[PODaemonCoreConnection retrieveStashedDecryptionContextForIdentifer:completion:](serviceConnection, "retrieveStashedDecryptionContextForIdentifer:completion:", v7, v12);
    v9 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

    _Block_object_dispose(v19, 8);
  }
  else
  {
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __74__POConfigurationCoreManager_retrieveStashedDecryptionContextForUserName___block_invoke;
    v24 = &unk_2514FF9D0;
    v25 = v4;
    v10 = __74__POConfigurationCoreManager_retrieveStashedDecryptionContextForUserName___block_invoke();

    v9 = 0;
  }

  return v9;
}

id __74__POConfigurationCoreManager_retrieveStashedDecryptionContextForUserName___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("identifier for user not found when retrieving stashed tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1();

  return v0;
}

void __74__POConfigurationCoreManager_retrieveStashedDecryptionContextForUserName___block_invoke_111(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)saveCachedContextsToDisk
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

uint64_t __54__POConfigurationCoreManager_saveCachedContextsToDisk__block_invoke(uint64_t result, char a2)
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
    -[POConfigurationCoreManager userIdentifierProvider](self, "userIdentifierProvider");
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
      v8 = __44__POConfigurationCoreManager_userIdentifier__block_invoke();
      userIdentifier = self->_userIdentifier;
    }
  }
  return userIdentifier;
}

id __44__POConfigurationCoreManager_userIdentifier__block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("id for user not found."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POConfigurationManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (void)insertTokenForUserName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  POConfigurationCoreManager *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_POConfigurationManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[POConfigurationCoreManager insertTokenForUserName:]";
    v11 = 2114;
    v12 = v4;
    v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_24440D000, v5, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@ on %@", buf, 0x20u);
  }

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke;
  v7[3] = &unk_2515006E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  _os_activity_initiate(&dword_24440D000, "PSSOInsertToken", OS_ACTIVITY_FLAG_DEFAULT, v7);

}

uint64_t __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "insertTokenForUserName:completion:", *(_QWORD *)(a1 + 40), &__block_literal_global_10);
}

void __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  PO_LOG_POConfigurationManager();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke_2_cold_2((uint64_t)v2, v4);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }

}

- (BOOL)verifyTokenForUserName:(id)a3 passwordContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  char v11;
  _QWORD v13[5];
  id v14;
  id v15;
  _BYTE *v16;
  _BYTE buf[24];
  id v18;
  __int16 v19;
  POConfigurationCoreManager *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PO_LOG_POConfigurationManager();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[POConfigurationCoreManager verifyTokenForUserName:passwordContext:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v18 = v7;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, context = %{public}@ on %@", buf, 0x2Au);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v18) = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__POConfigurationCoreManager_verifyTokenForUserName_passwordContext___block_invoke;
  v13[3] = &unk_251500710;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = buf;
  v9 = v7;
  v10 = v6;
  _os_activity_initiate(&dword_24440D000, "PSSOVerifyToken", OS_ACTIVITY_FLAG_DEFAULT, v13);

  v11 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v11;
}

uint64_t __69__POConfigurationCoreManager_verifyTokenForUserName_passwordContext___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 8);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__POConfigurationCoreManager_verifyTokenForUserName_passwordContext___block_invoke_2;
  v5[3] = &unk_2515006A0;
  v3 = a1[6];
  v5[4] = a1[7];
  return objc_msgSend(v2, "verifyTokenForUserName:passwordContext:completion:", v1, v3, v5);
}

uint64_t __69__POConfigurationCoreManager_verifyTokenForUserName_passwordContext___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (NSString)userName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)sharedOnly
{
  return self->_sharedOnly;
}

- (void)setSharedOnly:(BOOL)a3
{
  self->_sharedOnly = a3;
}

- (POConfigurationVersion)userConfigurationVersion
{
  return (POConfigurationVersion *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUserConfigurationVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (POConfigurationVersion)loginConfigurationVersion
{
  return (POConfigurationVersion *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLoginConfigurationVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (POConfigurationVersion)deviceConfigurationVersion
{
  return (POConfigurationVersion *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDeviceConfigurationVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (POUserIdentifierProvider)userIdentifierProvider
{
  return (POUserIdentifierProvider *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUserIdentifierProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_deviceConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_loginConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_userConfigurationVersion, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_currentDeviceConfiguration, 0);
  objc_storeStrong((id *)&self->_currentLoginConfiguration, 0);
  objc_storeStrong((id *)&self->_currentUserConfiguration, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __54__POConfigurationCoreManager_currentUserConfiguration__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_6();
  objc_msgSend((id)OUTLINED_FUNCTION_4_2(v1, v2), "userName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_24440D000, v0, v4, "%{public}@, %{public}@", v5);

  OUTLINED_FUNCTION_3();
}

- (void)deviceConfiguration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
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

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
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

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)userLoginStateForUserName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)isPlatformSSOUserName:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_24440D000, a1, a3, "Not a Platform SSO User", a5, a6, a7, a8, 0);
}

- (void)isPlatformSSOUserName:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)savePendingSSOTokens:forUserName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)retrievePendingSSOTokensForUserName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)saveStashedSSOTokens:forUserName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)retrieveStashedSSOTokensForUserName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)saveStashedDecryptionContext:forUserName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)retrieveStashedDecryptionContextForUserName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_24440D000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_24440D000, a1, a3, "insertTokenForUserName complete", a5, a6, a7, a8, 0);
}

void __53__POConfigurationCoreManager_insertTokenForUserName___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_24440D000, a2, OS_LOG_TYPE_ERROR, "insertTokenForUserName error = %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
