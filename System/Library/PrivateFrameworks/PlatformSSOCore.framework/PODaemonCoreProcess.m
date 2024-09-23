@implementation PODaemonCoreProcess

- (id)initForBaseSystem:(BOOL)a3
{
  PODaemonCoreProcess *v4;
  PODaemonCoreProcess *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_class *v13;
  POUserIdentifierProvider *v14;
  POUserIdentifierProvider *userIdentifierProvider;
  POTokenHelper *v16;
  POTokenHelper *tokenHelper;
  NSString *volumeUUID;
  objc_super v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v20.receiver = self;
  v20.super_class = (Class)PODaemonCoreProcess;
  v4 = -[PODaemonCoreProcess init](&v20, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_baseSystem = a3;
    v4->_prebootKey = 0;
    if (!_cachedContexts)
    {
      v6 = objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
      v7 = (void *)_cachedContexts;
      _cachedContexts = v6;

    }
    if (!_cachedStashedTokens)
    {
      v8 = objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
      v9 = (void *)_cachedStashedTokens;
      _cachedStashedTokens = v8;

    }
    if (!_cachedPendingTokens)
    {
      v10 = objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
      v11 = (void *)_cachedPendingTokens;
      _cachedPendingTokens = v10;

    }
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v12 = (void *)getPODirectoryServicesClass_softClass;
    v25 = getPODirectoryServicesClass_softClass;
    if (!getPODirectoryServicesClass_softClass)
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __getPODirectoryServicesClass_block_invoke;
      v21[3] = &unk_2514FFCD8;
      v21[4] = &v22;
      __getPODirectoryServicesClass_block_invoke((uint64_t)v21);
      v12 = (void *)v23[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v22, 8);
    v14 = (POUserIdentifierProvider *)objc_alloc_init(v13);
    userIdentifierProvider = v5->_userIdentifierProvider;
    v5->_userIdentifierProvider = v14;

    v16 = -[POTokenHelper initWithIdentifierProvider:]([POTokenHelper alloc], "initWithIdentifierProvider:", v5->_userIdentifierProvider);
    tokenHelper = v5->_tokenHelper;
    v5->_tokenHelper = v16;

    volumeUUID = v5->_volumeUUID;
    v5->_volumeUUID = 0;

  }
  return v5;
}

- (PODaemonCoreProcess)initWithXPCConnection:(id)a3 baseSystem:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id *v10;
  id *v11;
  id *v12;
  PODaemonCoreProcess *v13;
  id v14;
  _QWORD activity_block[4];
  id *v17;

  v4 = a4;
  v6 = a3;
  PO_LOG_PODaemonCoreProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PODaemonCoreProcess initWithXPCConnection:baseSystem:].cold.1((uint64_t)self, v7);

  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.platformsso.agent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    v10 = -[PODaemonCoreProcess initForBaseSystem:](self, "initForBaseSystem:", v4);
    v11 = v10;
    if (v10)
      objc_storeWeak(v10 + 1, v6);
    activity_block[0] = MEMORY[0x24BDAC760];
    activity_block[1] = 3221225472;
    activity_block[2] = __56__PODaemonCoreProcess_initWithXPCConnection_baseSystem___block_invoke_5;
    activity_block[3] = &unk_2514FFC88;
    v12 = v11;
    v17 = v12;
    _os_activity_initiate(&dword_24440D000, "DaemonStartup", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    self = v12;
    v13 = self;
  }
  else
  {
    v14 = __56__PODaemonCoreProcess_initWithXPCConnection_baseSystem___block_invoke();
    v13 = 0;
  }

  return v13;
}

id __56__PODaemonCoreProcess_initWithXPCConnection_baseSystem___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1002, CFSTR("missing required entitlement"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

uint64_t __56__PODaemonCoreProcess_initWithXPCConnection_baseSystem___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleStartup");
}

- (void)connectionInvalidated
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  PODaemonCoreProcess *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  PO_LOG_PODaemonCoreProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[PODaemonCoreProcess connectionInvalidated]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_24440D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

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

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "handleStartup", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (BOOL)writeData:(id)a3 toPath:(id)a4 saveError:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  PO_LOG_PODaemonCoreProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PODaemonCoreProcess writeData:toPath:saveError:].cold.2();

  if (v7)
  {
    v34 = 0;
    v10 = objc_msgSend(v7, "writeToURL:options:error:", v8, 0x10000000, &v34);
    v11 = v34;
    v12 = v11;
    if ((v10 & 1) != 0)
    {
      v38 = *MEMORY[0x24BDD0CC8];
      v39[0] = &unk_251520ED0;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v12;
      v16 = objc_msgSend(v14, "setAttributes:ofItemAtPath:error:", v13, v15, &v31);
      v17 = v31;

      if ((v16 & 1) != 0)
      {
        PO_LOG_PODaemonCoreProcess();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[PODaemonCoreProcess writeData:toPath:saveError:].cold.1();
      }
      else
      {
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke_17;
        v29[3] = &unk_2514FF9D0;
        v30 = v17;
        __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke_17((uint64_t)v29);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (a5)
          *a5 = objc_retainAutorelease(v24);

        v18 = v30;
      }

    }
    else
    {
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke_12;
      v32[3] = &unk_2514FF9D0;
      v17 = v11;
      v33 = v17;
      __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke_12((uint64_t)v32);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (a5)
        *a5 = objc_retainAutorelease(v21);

      v16 = 0;
      v13 = v33;
    }
LABEL_22:

    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v20 = objc_msgSend(v19, "removeItemAtURL:error:", v8, &v37);
  v17 = v37;

  if ((v20 & 1) == 0)
  {
    objc_msgSend(v17, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("NSUnderlyingError"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "code") == 2)
    {
      v16 = 1;
    }
    else
    {
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke;
      v35[3] = &unk_2514FF9D0;
      v17 = v17;
      v36 = v17;
      __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke((uint64_t)v35);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (a5)
        *a5 = objc_retainAutorelease(v26);

      v16 = 0;
    }
    goto LABEL_22;
  }
  v16 = 1;
LABEL_23:

  return v16;
}

id __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1007, *(_QWORD *)(a1 + 32), CFSTR("Failed to remove configuration"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

id __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke_12(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to write config to disk"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

id __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke_17(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to set configuration attributes"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (id)_deviceConfigurationForIdentifer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  PODaemonCoreProcess *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  PODaemonCoreProcess *v23;
  __int16 v24;
  PODaemonCoreProcess *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_PODaemonCoreProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[PODaemonCoreProcess _deviceConfigurationForIdentifer:]";
    v20 = 2114;
    v21 = v4;
    v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_24440D000, v5, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PlatformSSO.device.%@.txt"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("com.apple.PlatformSSO.device.txt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  PO_LOG_PODaemonCoreProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[PODaemonCoreProcess _deviceConfigurationForIdentifer:].cold.1();

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
  {
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    v13 = v12;
    if (v11)
    {
      v14 = (PODaemonCoreProcess *)objc_msgSend(v12, "initWithData:encoding:", v11, 4);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (PODaemonCoreProcess *)objc_msgSend(v13, "initWithData:encoding:", v15, 4);

    }
    PO_LOG_PODaemonCoreProcess();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[PODaemonCoreProcess _deviceConfigurationForIdentifer:]";
      v20 = 2114;
      v21 = v4;
      v22 = 2114;
      v23 = v14;
      v24 = 2112;
      v25 = self;
      _os_log_debug_impl(&dword_24440D000, v16, OS_LOG_TYPE_DEBUG, "%s identifer = %{public}@, data = %{public}@ on %@", buf, 0x2Au);
    }

  }
  return v11;
}

- (void)deviceConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  PODaemonCoreProcess *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  PO_LOG_PODaemonCoreProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "-[PODaemonCoreProcess deviceConfigurationForIdentifer:completion:]";
    v15 = 2114;
    v16 = v6;
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  -[PODaemonCoreProcess _deviceConfigurationForIdentifer:](self, "_deviceConfigurationForIdentifer:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v7[2](v7, v9, 0);
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __66__PODaemonCoreProcess_deviceConfigurationForIdentifer_completion___block_invoke;
    v11[3] = &unk_2514FF9D0;
    v12 = v6;
    __66__PODaemonCoreProcess_deviceConfigurationForIdentifer_completion___block_invoke((uint64_t)v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v10);

  }
}

id __66__PODaemonCoreProcess_deviceConfigurationForIdentifer_completion___block_invoke(uint64_t a1)
{
  const char *v1;
  void *v2;
  void *v3;
  NSObject *v4;

  if (*(_QWORD *)(a1 + 32))
    v1 = "no user device configuration data to load";
  else
    v1 = "no device configuration data to load";
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_PODaemonCoreProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v3;
}

- (id)_loginConfigurationForIdentifer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  PODaemonCoreProcess *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_PODaemonCoreProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[PODaemonCoreProcess _loginConfigurationForIdentifer:]";
    v20 = 2114;
    v21 = v4;
    v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_24440D000, v5, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PlatformSSO.login.%@.txt"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("com.apple.PlatformSSO.login.txt"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  PO_LOG_PODaemonCoreProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[PODaemonCoreProcess _deviceConfigurationForIdentifer:].cold.1();

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
  {
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    v13 = v12;
    if (v11)
    {
      v14 = (void *)objc_msgSend(v12, "initWithData:encoding:", v11, 4);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "initWithData:encoding:", v15, 4);

    }
    PO_LOG_PODaemonCoreProcess();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[PODaemonCoreProcess _loginConfigurationForIdentifer:].cold.1();

  }
  return v11;
}

- (void)loginConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  PODaemonCoreProcess *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  PO_LOG_PODaemonCoreProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[PODaemonCoreProcess loginConfigurationForIdentifer:completion:]";
    v13 = 2114;
    v14 = v6;
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", (uint8_t *)&v11, 0x20u);
  }

  -[PODaemonCoreProcess _loginConfigurationForIdentifer:](self, "_loginConfigurationForIdentifer:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v7[2](v7, v9, 0);
  }
  else
  {
    __65__PODaemonCoreProcess_loginConfigurationForIdentifer_completion___block_invoke();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v10);

  }
}

id __65__PODaemonCoreProcess_loginConfigurationForIdentifer_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("no login configuration data to load"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)_userConfigurationForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  POUserConfiguration *v14;
  void *v15;
  void *v16;

  v6 = a3;
  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PlatformSSO.user.%@.txt"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_PODaemonCoreProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[PODaemonCoreProcess _deviceConfigurationForIdentifer:].cold.1();

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v11, 4);
      PO_LOG_PODaemonCoreProcess();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PODaemonCoreProcess _userConfigurationForIdentifier:error:].cold.1();

    }
    v14 = -[POUserConfiguration initWithData:]([POUserConfiguration alloc], "initWithData:", v11);
  }
  else
  {
    __61__PODaemonCoreProcess__userConfigurationForIdentifier_error___block_invoke();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a4)
      *a4 = objc_retainAutorelease(v15);

    v14 = 0;
  }

  return v14;
}

id __61__PODaemonCoreProcess__userConfigurationForIdentifier_error___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("no user configuration data to load"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)userConfigurationForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  PODaemonCoreProcess *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  PO_LOG_PODaemonCoreProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[PODaemonCoreProcess userConfigurationForIdentifier:completion:]";
    v14 = 2114;
    v15 = v6;
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  v11 = 0;
  -[PODaemonCoreProcess _userConfigurationForIdentifier:error:](self, "_userConfigurationForIdentifier:error:", v6, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  v7[2](v7, v9, v10);

}

- (id)_userLoginStateListDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;

  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("com.apple.PlatformSSO.userstate.txt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_PODaemonCoreProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PODaemonCoreProcess _deviceConfigurationForIdentifer:].cold.1();

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
      PO_LOG_PODaemonCoreProcess();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PODaemonCoreProcess _userLoginStateListDataWithError:].cold.1();

    }
    v10 = v7;
  }
  else
  {
    __56__PODaemonCoreProcess__userLoginStateListDataWithError___block_invoke();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a3)
      *a3 = objc_retainAutorelease(v11);

  }
  return v7;
}

id __56__PODaemonCoreProcess__userLoginStateListDataWithError___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("no user state data to load"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)_parseUserLoginStateListData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  char isKindOfClass;
  POUserLoginState *v21;
  void *v22;
  POUserLoginState *v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v36 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 16, &v36);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v36;
  v7 = v6;
  if (v6)
  {
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke;
    v34[3] = &unk_2514FF9D0;
    v35 = v6;
    __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke((uint64_t)v34);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a4)
      *a4 = objc_retainAutorelease(v8);

    v10 = 0;
    v11 = v35;
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v5, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            v21 = [POUserLoginState alloc];
            objc_msgSend(v5, "objectForKeyedSubscript:", v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[POUserLoginState initWithDictionary:](v21, "initWithDictionary:", v22);

            if (v23)
            {
              -[POUserLoginState uniqueIdentifier](v23, "uniqueIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, v24);
            }
            else
            {
              v27[0] = MEMORY[0x24BDAC760];
              v27[1] = 3221225472;
              v27[2] = __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke_40;
              v27[3] = &unk_2514FFCB0;
              v28 = 0;
              v29 = v18;
              v25 = __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke_40((uint64_t)v27);
              v24 = v28;
            }

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
      }
      while (v15);
    }

    v11 = v12;
    v10 = (void *)objc_msgSend(v12, "copy");
    v7 = 0;
  }

  return v10;
}

id __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error deserializing user state list."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

id __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke_40(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error deserializing user state."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke_40_cold_1();

  return v1;
}

- (id)_userLoginStateListWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v14 = 0;
  -[PODaemonCoreProcess _userLoginStateListDataWithError:](self, "_userLoginStateListDataWithError:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__PODaemonCoreProcess__userLoginStateListWithError___block_invoke;
    v12[3] = &unk_2514FF9D0;
    v13 = v6;
    __52__PODaemonCoreProcess__userLoginStateListWithError___block_invoke((uint64_t)v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a3)
      *a3 = objc_retainAutorelease(v8);

    v10 = 0;
  }
  else
  {
    -[PODaemonCoreProcess _parseUserLoginStateListData:error:](self, "_parseUserLoginStateListData:error:", v5, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id __52__PODaemonCoreProcess__userLoginStateListWithError___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error loading user state list."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (id)_stashedUserLoginStateListDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;

  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("com.apple.PlatformSSO.stashed.userstate.txt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_PODaemonCoreProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PODaemonCoreProcess _deviceConfigurationForIdentifer:].cold.1();

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);
      PO_LOG_PODaemonCoreProcess();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PODaemonCoreProcess _stashedUserLoginStateListDataWithError:].cold.1();

    }
    v10 = v7;
  }
  else
  {
    __56__PODaemonCoreProcess__userLoginStateListDataWithError___block_invoke();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a3)
      *a3 = objc_retainAutorelease(v11);

  }
  return v7;
}

- (id)_stashedUserLoginStateListWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v14 = 0;
  -[PODaemonCoreProcess _stashedUserLoginStateListDataWithError:](self, "_stashedUserLoginStateListDataWithError:", &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__PODaemonCoreProcess__stashedUserLoginStateListWithError___block_invoke;
    v12[3] = &unk_2514FF9D0;
    v13 = v6;
    __59__PODaemonCoreProcess__stashedUserLoginStateListWithError___block_invoke((uint64_t)v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (a3)
      *a3 = objc_retainAutorelease(v8);

    v10 = 0;
  }
  else
  {
    -[PODaemonCoreProcess _parseUserLoginStateListData:error:](self, "_parseUserLoginStateListData:error:", v5, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

id __59__PODaemonCoreProcess__stashedUserLoginStateListWithError___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error loading user state list."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (BOOL)_removeStashedUserLoginStateListDataWithError:(id *)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;

  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("com.apple.PlatformSSO.stashed.userstate.txt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_PODaemonCoreProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PODaemonCoreProcess _removeStashedUserLoginStateListDataWithError:].cold.1();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v8 = objc_msgSend(v7, "removeItemAtURL:error:", v5, &v19);
  v9 = v19;

  if ((v8 & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v9, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("NSUnderlyingError"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "code");
    v10 = v13 == 2;
    if (v13 != 2)
    {
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __69__PODaemonCoreProcess__removeStashedUserLoginStateListDataWithError___block_invoke;
      v17[3] = &unk_2514FF9D0;
      v18 = v9;
      __69__PODaemonCoreProcess__removeStashedUserLoginStateListDataWithError___block_invoke((uint64_t)v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (a3)
        *a3 = objc_retainAutorelease(v14);

    }
  }

  return v10;
}

id __69__PODaemonCoreProcess__removeStashedUserLoginStateListDataWithError___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1007, *(_QWORD *)(a1 + 32), CFSTR("Failed to remove stashed login state list"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (id)_dataForUserLoginStateList:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dictionaryRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  v24 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v6, 11, &v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v24;
  v17 = v16;
  if (v16)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __56__PODaemonCoreProcess__dataForUserLoginStateList_error___block_invoke;
    v22[3] = &unk_2514FF9D0;
    v23 = v16;
    __56__PODaemonCoreProcess__dataForUserLoginStateList_error___block_invoke((uint64_t)v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a4)
      *a4 = objc_retainAutorelease(v18);

    v20 = 0;
  }
  else
  {
    v20 = v15;
  }

  return v20;
}

id __56__PODaemonCoreProcess__dataForUserLoginStateList_error___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error serializing user state list."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (BOOL)_saveUserLoginStateList:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  BOOL v18;
  NSObject *v19;
  char *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  PODaemonCoreProcess *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  PO_LOG_PODaemonCoreProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[PODaemonCoreProcess _saveUserLoginStateList:error:]";
    v32 = 2112;
    v33 = self;
    _os_log_impl(&dword_24440D000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
  {
    PO_LOG_PODaemonCoreProcess();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PODaemonCoreProcess _saveUserLoginStateList:error:].cold.1();

  }
  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("com.apple.PlatformSSO.userstate.txt"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  -[PODaemonCoreProcess _dataForUserLoginStateList:error:](self, "_dataForUserLoginStateList:error:", v6, &v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v29;
  if (v12)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __53__PODaemonCoreProcess__saveUserLoginStateList_error___block_invoke;
    v27[3] = &unk_2514FF9D0;
    v13 = v12;
    v28 = v13;
    __53__PODaemonCoreProcess__saveUserLoginStateList_error___block_invoke((uint64_t)v27);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a4)
      *a4 = objc_retainAutorelease(v14);

    v16 = 0;
    v17 = v28;
  }
  else
  {
    v26 = 0;
    v18 = -[PODaemonCoreProcess writeData:toPath:saveError:](self, "writeData:toPath:saveError:", v11, v10, &v26);
    v19 = v26;
    v13 = v19;
    if (v18)
    {
      PO_LOG_PODaemonCoreProcess();
      v17 = objc_claimAutoreleasedReturnValue();
      v16 = 1;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "path");
        v20 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v31 = v20;
        _os_log_impl(&dword_24440D000, v17, OS_LOG_TYPE_INFO, "user state list written to file: %{public}@", buf, 0xCu);

      }
    }
    else
    {
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __53__PODaemonCoreProcess__saveUserLoginStateList_error___block_invoke_50;
      v24[3] = &unk_2514FF9D0;
      v13 = v19;
      v25 = v13;
      __53__PODaemonCoreProcess__saveUserLoginStateList_error___block_invoke_50((uint64_t)v24);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (a4)
        *a4 = objc_retainAutorelease(v21);

      v16 = 0;
      v17 = v25;
    }
  }

  return v16;
}

id __53__PODaemonCoreProcess__saveUserLoginStateList_error___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error serializing user state list."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

id __53__PODaemonCoreProcess__saveUserLoginStateList_error___block_invoke_50(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to write user state list to disk"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (id)_userLoginStateForIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PODaemonCoreProcess _userLoginStateListWithError:](self, "_userLoginStateListWithError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)userLoginStateForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  PODaemonCoreProcess *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  PO_LOG_PODaemonCoreProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[PODaemonCoreProcess userLoginStateForIdentifier:completion:]";
    v14 = 2114;
    v15 = v6;
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  v11 = 0;
  -[PODaemonCoreProcess _userLoginStateForIdentifier:error:](self, "_userLoginStateForIdentifier:error:", v6, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  v7[2](v7, v9, v10);

}

- (void)updateLoginStateForIdentifier:(id)a3 state:(id)a4 loginDate:(id)a5 loginType:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, uint64_t, _QWORD);
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  POUserLoginState *v24;
  NSObject *v25;
  BOOL v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  PODaemonCoreProcess *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, uint64_t, _QWORD))a7;
  PO_LOG_PODaemonCoreProcess();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[PODaemonCoreProcess updateLoginStateForIdentifier:state:loginDate:loginType:completion:]";
    v34 = 2114;
    v35 = v12;
    v36 = 2112;
    v37 = self;
    _os_log_impl(&dword_24440D000, v17, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  v31 = 0;
  -[PODaemonCoreProcess _userLoginStateListWithError:](self, "_userLoginStateListWithError:", &v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v31;
  v20 = (void *)objc_msgSend(v18, "mutableCopy");
  v21 = v20;
  if (v20)
    v22 = v20;
  else
    v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = v22;

  objc_msgSend(v23, "objectForKeyedSubscript:", v12);
  v24 = (POUserLoginState *)objc_claimAutoreleasedReturnValue();
  if (!v24)
    v24 = -[POUserLoginState initWithUniqueIdentifier:]([POUserLoginState alloc], "initWithUniqueIdentifier:", v12);
  if (v13)
    -[POUserLoginState setState:](v24, "setState:", objc_msgSend(v13, "unsignedIntValue"));
  if (v14)
    -[POUserLoginState setLastLogin:](v24, "setLastLogin:", v14);
  if (v15)
    -[POUserLoginState setLoginType:](v24, "setLoginType:", objc_msgSend(v15, "unsignedIntValue"));
  PO_LOG_PODaemonCoreProcess();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[PODaemonCoreProcess updateLoginStateForIdentifier:state:loginDate:loginType:completion:].cold.1();

  objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, v12);
  v30 = v19;
  v26 = -[PODaemonCoreProcess _saveUserLoginStateList:error:](self, "_saveUserLoginStateList:error:", v23, &v30);
  v27 = v30;

  if (v26)
  {
    v28 = 1;
    v29 = 0;
  }
  else
  {
    v28 = 0;
    v29 = v27;
  }
  ((void (**)(id, uint64_t, id))v16)[2](v16, v28, v29);

}

- (void)savePendingSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5
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
  PODaemonCoreProcess *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, _BOOL8, id))a5;
  v10 = a3;
  PO_LOG_PODaemonCoreProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[PODaemonCoreProcess savePendingSSOTokens:identifer:completion:]";
    v17 = 2114;
    v18 = v8;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_24440D000, v11, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  v14 = 0;
  v12 = -[PODaemonCoreProcess _savePendingSSOTokensData:forIdentifier:error:](self, "_savePendingSSOTokensData:forIdentifier:error:", v10, v8, &v14);

  v13 = v14;
  v9[2](v9, v12, v13);

}

- (BOOL)_savePendingSSOTokensData:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  PODaemonCoreProcess *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  PO_LOG_PODaemonCoreProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v31 = "-[PODaemonCoreProcess _savePendingSSOTokensData:forIdentifier:error:]";
    v32 = 2114;
    v33 = v9;
    v34 = 2112;
    v35 = self;
    _os_log_impl(&dword_24440D000, v10, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
    PO_LOG_PODaemonCoreProcess();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PODaemonCoreProcess _savePendingSSOTokensData:forIdentifier:error:].cold.2();

  }
  if (!-[PODaemonCoreProcess baseSystem](self, "baseSystem"))
  {
    -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PlatformSSO.pending.%@.txt"), v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16, "URLByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0;
    LOBYTE(v16) = -[PODaemonCoreProcess writeData:toPath:saveError:](self, "writeData:toPath:saveError:", v8, v18, &v29);
    v19 = v29;
    v20 = v19;
    if ((v16 & 1) == 0)
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __69__PODaemonCoreProcess__savePendingSSOTokensData_forIdentifier_error___block_invoke;
      v27[3] = &unk_2514FF9D0;
      v20 = v19;
      v28 = v20;
      __69__PODaemonCoreProcess__savePendingSSOTokensData_forIdentifier_error___block_invoke((uint64_t)v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (a5)
        *a5 = objc_retainAutorelease(v23);

      v15 = 0;
      goto LABEL_21;
    }
    PO_LOG_PODaemonCoreProcess();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v18, "path");
      v22 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v22;
      _os_log_impl(&dword_24440D000, v21, OS_LOG_TYPE_INFO, "pending tokens written to file: %{public}@", buf, 0xCu);

    }
LABEL_20:
    v15 = 1;
LABEL_21:

    goto LABEL_22;
  }
  PO_LOG_PODaemonCoreProcess();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PODaemonCoreProcess _savePendingSSOTokensData:forIdentifier:error:].cold.1();

  v14 = (id)_cachedPendingTokens;
  objc_sync_enter(v14);
  objc_msgSend((id)_cachedPendingTokens, "setObject:forKeyedSubscript:", v8, v9);
  objc_sync_exit(v14);

  if (!_cacheTransaction)
  {
    v25 = os_transaction_create();
    v20 = (id)_cacheTransaction;
    _cacheTransaction = v25;
    goto LABEL_20;
  }
  v15 = 1;
LABEL_22:

  return v15;
}

id __69__PODaemonCoreProcess__savePendingSSOTokensData_forIdentifier_error___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to write pending tokens to disk"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (void)retrievePendingSSOTokenForIdentifer:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  PODaemonCoreProcess *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  PO_LOG_PODaemonCoreProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[PODaemonCoreProcess retrievePendingSSOTokenForIdentifer:completion:]";
    v14 = 2114;
    v15 = v6;
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  v11 = 0;
  -[PODaemonCoreProcess _pendingSSOTokensForIdentifer:error:](self, "_pendingSSOTokensForIdentifer:error:", v6, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  v7[2](v7, v9, v10);

}

- (id)_pendingSSOTokensForIdentifer:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;

  v6 = a3;
  if (-[PODaemonCoreProcess baseSystem](self, "baseSystem"))
  {
    PO_LOG_PODaemonCoreProcess();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PODaemonCoreProcess _pendingSSOTokensForIdentifer:error:].cold.1();

    v8 = (id)_cachedPendingTokens;
    objc_sync_enter(v8);
    objc_msgSend((id)_cachedPendingTokens, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v8);
  }
  else
  {
    -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PlatformSSO.pending.%@.txt"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
        PO_LOG_PODaemonCoreProcess();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PODaemonCoreProcess _pendingSSOTokensForIdentifer:error:].cold.2();

      }
      v14 = v9;
    }
    else
    {
      __59__PODaemonCoreProcess__pendingSSOTokensForIdentifer_error___block_invoke();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (a4)
        *a4 = objc_retainAutorelease(v15);

    }
  }

  return v9;
}

id __59__PODaemonCoreProcess__pendingSSOTokensForIdentifer_error___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("no pending tokens data to load"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)saveStashedSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5
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
  PODaemonCoreProcess *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, _BOOL8, id))a5;
  v10 = a3;
  PO_LOG_PODaemonCoreProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[PODaemonCoreProcess saveStashedSSOTokens:identifer:completion:]";
    v17 = 2114;
    v18 = v8;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_24440D000, v11, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  v14 = 0;
  v12 = -[PODaemonCoreProcess _saveStashedSSOTokensData:forIdentifier:error:](self, "_saveStashedSSOTokensData:forIdentifier:error:", v10, v8, &v14);

  v13 = v14;
  v9[2](v9, v12, v13);

}

- (BOOL)_saveStashedSSOTokensData:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  PODaemonCoreProcess *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  PO_LOG_PODaemonCoreProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v31 = "-[PODaemonCoreProcess _saveStashedSSOTokensData:forIdentifier:error:]";
    v32 = 2114;
    v33 = v9;
    v34 = 2112;
    v35 = self;
    _os_log_impl(&dword_24440D000, v10, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
    PO_LOG_PODaemonCoreProcess();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PODaemonCoreProcess _saveStashedSSOTokensData:forIdentifier:error:].cold.2();

  }
  if (!-[PODaemonCoreProcess baseSystem](self, "baseSystem"))
  {
    -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PlatformSSO.stashed.%@.txt"), v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16, "URLByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0;
    LOBYTE(v16) = -[PODaemonCoreProcess writeData:toPath:saveError:](self, "writeData:toPath:saveError:", v8, v18, &v29);
    v19 = v29;
    v20 = v19;
    if ((v16 & 1) == 0)
    {
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __69__PODaemonCoreProcess__saveStashedSSOTokensData_forIdentifier_error___block_invoke;
      v27[3] = &unk_2514FF9D0;
      v20 = v19;
      v28 = v20;
      __69__PODaemonCoreProcess__saveStashedSSOTokensData_forIdentifier_error___block_invoke((uint64_t)v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (a5)
        *a5 = objc_retainAutorelease(v23);

      v15 = 0;
      goto LABEL_21;
    }
    PO_LOG_PODaemonCoreProcess();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v18, "path");
      v22 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v22;
      _os_log_impl(&dword_24440D000, v21, OS_LOG_TYPE_INFO, "stashed tokens written to file: %{public}@", buf, 0xCu);

    }
LABEL_20:
    v15 = 1;
LABEL_21:

    goto LABEL_22;
  }
  PO_LOG_PODaemonCoreProcess();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PODaemonCoreProcess _savePendingSSOTokensData:forIdentifier:error:].cold.1();

  v14 = (id)_cachedStashedTokens;
  objc_sync_enter(v14);
  objc_msgSend((id)_cachedStashedTokens, "setObject:forKeyedSubscript:", v8, v9);
  objc_sync_exit(v14);

  if (!_cacheTransaction)
  {
    v25 = os_transaction_create();
    v20 = (id)_cacheTransaction;
    _cacheTransaction = v25;
    goto LABEL_20;
  }
  v15 = 1;
LABEL_22:

  return v15;
}

id __69__PODaemonCoreProcess__saveStashedSSOTokensData_forIdentifier_error___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to write stashed tokens to disk"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (void)retrieveStashedSSOTokenForIdentifer:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  PODaemonCoreProcess *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  PO_LOG_PODaemonCoreProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[PODaemonCoreProcess retrieveStashedSSOTokenForIdentifer:completion:]";
    v14 = 2114;
    v15 = v6;
    v16 = 2112;
    v17 = self;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  v11 = 0;
  -[PODaemonCoreProcess _stashedSSOTokensForIdentifer:error:](self, "_stashedSSOTokensForIdentifer:error:", v6, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v11;
  v7[2](v7, v9, v10);

}

- (id)_stashedSSOTokensForIdentifer:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;

  v6 = a3;
  if (-[PODaemonCoreProcess baseSystem](self, "baseSystem"))
  {
    PO_LOG_PODaemonCoreProcess();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PODaemonCoreProcess _pendingSSOTokensForIdentifer:error:].cold.1();

    v8 = (id)_cachedStashedTokens;
    objc_sync_enter(v8);
    objc_msgSend((id)_cachedStashedTokens, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v8);
  }
  else
  {
    -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PlatformSSO.stashed.%@.txt"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
        PO_LOG_PODaemonCoreProcess();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PODaemonCoreProcess _stashedSSOTokensForIdentifer:error:].cold.2();

      }
      v14 = v9;
    }
    else
    {
      __59__PODaemonCoreProcess__stashedSSOTokensForIdentifer_error___block_invoke();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (a4)
        *a4 = objc_retainAutorelease(v15);

    }
  }

  return v9;
}

id __59__PODaemonCoreProcess__stashedSSOTokensForIdentifer_error___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("no stashed token data to load"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)saveStashedDecryptionContext:(id)a3 identifer:(id)a4 completion:(id)a5
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
  PODaemonCoreProcess *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, _BOOL8, id))a5;
  v10 = a3;
  PO_LOG_PODaemonCoreProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[PODaemonCoreProcess saveStashedDecryptionContext:identifer:completion:]";
    v17 = 2114;
    v18 = v8;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_24440D000, v11, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  v14 = 0;
  v12 = -[PODaemonCoreProcess _saveStashedDecryptionContextData:forIdentifier:error:](self, "_saveStashedDecryptionContextData:forIdentifier:error:", v10, v8, &v14);

  v13 = v14;
  v9[2](v9, v12, v13);

}

- (BOOL)_saveStashedDecryptionContextData:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  void *v18;
  NSObject *v19;
  char *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  PODaemonCoreProcess *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  PO_LOG_PODaemonCoreProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[PODaemonCoreProcess _saveStashedDecryptionContextData:forIdentifier:error:]";
    v29 = 2114;
    v30 = v9;
    v31 = 2112;
    v32 = self;
    _os_log_impl(&dword_24440D000, v10, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  if (+[POCoreConfigurationUtil platformSSODevModeEnabled](POCoreConfigurationUtil, "platformSSODevModeEnabled"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
    PO_LOG_PODaemonCoreProcess();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PODaemonCoreProcess _saveStashedDecryptionContextData:forIdentifier:error:].cold.1();

  }
  -[PODaemonCoreProcess _defaultConfigurationPath](self, "_defaultConfigurationPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.PlatformSSO.context.%@.txt"), v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v16 = -[PODaemonCoreProcess writeData:toPath:saveError:](self, "writeData:toPath:saveError:", v8, v15, &v26);
  v17 = v26;
  v18 = v17;
  if (v16)
  {
    PO_LOG_PODaemonCoreProcess();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v15, "path");
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v20;
      _os_log_impl(&dword_24440D000, v19, OS_LOG_TYPE_INFO, "stashed context written to file: %{public}@", buf, 0xCu);

    }
  }
  else
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __77__PODaemonCoreProcess__saveStashedDecryptionContextData_forIdentifier_error___block_invoke;
    v24[3] = &unk_2514FF9D0;
    v25 = v17;
    __77__PODaemonCoreProcess__saveStashedDecryptionContextData_forIdentifier_error___block_invoke((uint64_t)v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a5)
      *a5 = objc_retainAutorelease(v21);

    v19 = v25;
  }

  return v16;
}

id __77__PODaemonCoreProcess__saveStashedDecryptionContextData_forIdentifier_error___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  +[POError errorWithCode:underlyingError:description:](POError, "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to write stashed context to disk"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_PODaemonCoreProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v1;
}

- (id)_defaultConfigurationPath
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/Library/ExtensibleSSO/Configuration/PlatformSSO"));
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (BOOL)baseSystem
{
  return self->_baseSystem;
}

- (void)setBaseSystem:(BOOL)a3
{
  self->_baseSystem = a3;
}

- (__SecKey)prebootKey
{
  return self->_prebootKey;
}

- (void)setPrebootKey:(__SecKey *)a3
{
  self->_prebootKey = a3;
}

- (POTokenHelper)tokenHelper
{
  return (POTokenHelper *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTokenHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (POUserIdentifierProvider)userIdentifierProvider
{
  return (POUserIdentifierProvider *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserIdentifierProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)volumeUUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVolumeUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeUUID, 0);
  objc_storeStrong((id *)&self->_userIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_tokenHelper, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)initWithXPCConnection:(uint64_t)a1 baseSystem:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[PODaemonCoreProcess initWithXPCConnection:baseSystem:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_24440D000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)writeData:toPath:saveError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9(&dword_24440D000, v0, v1, "Completed saving data to: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)writeData:toPath:saveError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9(&dword_24440D000, v0, v1, "Saving data to: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_deviceConfigurationForIdentifer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9(&dword_24440D000, v0, v1, "loading = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_loginConfigurationForIdentifer:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s data = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_userConfigurationForIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s data = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_userLoginStateListDataWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s data = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

void __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke_40_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_24440D000, v1, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_stashedUserLoginStateListDataWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s data = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_removeStashedUserLoginStateListDataWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9(&dword_24440D000, v0, v1, "removing = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_saveUserLoginStateList:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s stateList = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)updateLoginStateForIdentifier:state:loginDate:loginType:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9(&dword_24440D000, v0, v1, "Updated login state = %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_savePendingSSOTokensData:forIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "saving to cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_savePendingSSOTokensData:forIdentifier:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s data = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_pendingSSOTokensForIdentifer:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6_0(&dword_24440D000, v0, v1, "using cached data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_pendingSSOTokensForIdentifer:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s data = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_saveStashedSSOTokensData:forIdentifier:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s data = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_stashedSSOTokensForIdentifer:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s data = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_saveStashedDecryptionContextData:forIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_3(&dword_24440D000, v0, v1, "%s data = %{public}@ on %@", v2);
  OUTLINED_FUNCTION_7();
}

@end
