@implementation POExtensionAgentProcess

- (POExtensionAgentProcess)initWithXPCConnection:(id)a3 authenticationProcess:(id)a4
{
  id v6;
  id v7;
  POExtensionAgentProcess *v8;
  uint64_t v9;
  POConfigurationManager *configurationManager;
  uint64_t v11;
  SOConfigurationHost *configurationHost;
  POExtensionAgentProcess *v13;
  id WeakRetained;
  uint64_t v15;
  NSMutableArray *keyProxies;
  POKeychainHelper *v17;
  POKeychainHelper *keychainHelper;
  NSMutableDictionary *v19;
  NSMutableDictionary *analytics;
  _QWORD v22[4];
  POExtensionAgentProcess *v23;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)POExtensionAgentProcess;
  v8 = -[POExtensionAgentProcess init](&v24, sel_init);
  if (v8)
  {
    +[POConfigurationManager sharedInstance](POConfigurationManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    configurationManager = v8->_configurationManager;
    v8->_configurationManager = (POConfigurationManager *)v9;

    objc_msgSend(MEMORY[0x24BE04368], "defaultManager");
    v11 = objc_claimAutoreleasedReturnValue();
    configurationHost = v8->_configurationHost;
    v8->_configurationHost = (SOConfigurationHost *)v11;

    objc_storeWeak((id *)&v8->_xpcConnection, v6);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __71__POExtensionAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke;
    v22[3] = &unk_24EC02ED0;
    v13 = v8;
    v23 = v13;
    WeakRetained = objc_loadWeakRetained((id *)&v8->_xpcConnection);
    objc_msgSend(WeakRetained, "setInterruptionHandler:", v22);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    keyProxies = v13->_keyProxies;
    v13->_keyProxies = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v13->_agentProcess, a4);
    v17 = (POKeychainHelper *)objc_alloc_init(MEMORY[0x24BE72ED8]);
    keychainHelper = v13->_keychainHelper;
    v13->_keychainHelper = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    analytics = v13->__analytics;
    v13->__analytics = v19;

  }
  return v8;
}

void __71__POExtensionAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "invalidateAllKeyProxies");
  objc_msgSend(*(id *)(a1 + 32), "authenticationObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "authenticationObserver");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v3);

  }
}

- (void)connectionInvalidated
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  POExtensionAgentProcess *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POExtensionAgentProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[POExtensionAgentProcess connectionInvalidated]";
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v9, 0x16u);
  }

  v4 = (void *)MEMORY[0x24BE72E78];
  -[POExtensionAgentProcess _analytics](self, "_analytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyticsForLoginManager:", v5);

  -[POExtensionAgentProcess invalidateAllKeyProxies](self, "invalidateAllKeyProxies");
  -[POExtensionAgentProcess authenticationObserver](self, "authenticationObserver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[POExtensionAgentProcess authenticationObserver](self, "authenticationObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", v8);

  }
}

- (id)keyProxyEndpointForKeyType:(int64_t)a3
{
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  POExtensionAgentProcess *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  CFTypeRef cf;
  _QWORD v47[5];
  id v48;

  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess keyProxyEndpointForKeyType:].cold.1();

  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentDeviceConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && -[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
    {
      v47[0] = 0;
      switch(a3)
      {
        case 1:
          -[POExtensionAgentProcess configurationManager](self, "configurationManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "userDeviceConfiguration");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
            goto LABEL_7;
          -[POExtensionAgentProcess configurationManager](self, "configurationManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "userDeviceConfiguration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "deviceSigningKey");
          goto LABEL_18;
        case 2:
          -[POExtensionAgentProcess configurationManager](self, "configurationManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "userDeviceConfiguration");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
            goto LABEL_14;
          -[POExtensionAgentProcess configurationManager](self, "configurationManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "userDeviceConfiguration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "deviceEncryptionKey");
LABEL_18:
          v21 = v18;
          v47[0] = v18;

          if (v21)
            goto LABEL_19;
          goto LABEL_28;
        case 3:
          -[POExtensionAgentProcess configurationManager](self, "configurationManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "currentUserConfiguration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "sepKey");
          goto LABEL_18;
        case 4:
        case 10:
LABEL_7:
          v10 = objc_msgSend(v9, "deviceSigningKey");
          goto LABEL_15;
        case 5:
        case 11:
LABEL_14:
          v10 = objc_msgSend(v9, "deviceEncryptionKey");
LABEL_15:
          v47[0] = v10;
          if (!v10)
            goto LABEL_28;
          goto LABEL_19;
        case 20:
          cf = 0;
          v26 = objc_alloc_init(MEMORY[0x24BDDA938]);
          v44 = 0u;
          v45 = 0u;
          v27 = objc_loadWeakRetained((id *)&self->_xpcConnection);
          v28 = v27;
          if (v27)
          {
            objc_msgSend(v27, "auditToken");
          }
          else
          {
            v44 = 0u;
            v45 = 0u;
          }

          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v44, 32);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setOptionCallerAuditToken:", v29);

          -[POExtensionAgentProcess keychainHelper](self, "keychainHelper");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[POExtensionAgentProcess configurationManager](self, "configurationManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "currentUserConfiguration");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "smartCardTokenId");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[POExtensionAgentProcess configurationManager](self, "configurationManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "currentUserConfiguration");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "smartCardHash");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v41, "retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:", v30, v26, 1, v33, &cf, v47);

          if ((v34 & 1) == 0)
            v35 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_15();
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }

          if (!v47[0])
            goto LABEL_28;
LABEL_19:
          v22 = objc_alloc(MEMORY[0x24BDE84F0]);
          v23 = (id)objc_msgSend(v22, "initWithKey:", v47[0]);
          v24 = self;
          objc_sync_enter(v24);
          -[POExtensionAgentProcess keyProxies](v24, "keyProxies");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v23);

          objc_sync_exit(v24);
          objc_msgSend(v23, "endpoint");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
LABEL_28:
          v36 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringWithFormat:", CFSTR("%@, %@"), v7, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = v38;
          v39 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_23();

          v12 = 0;
          break;
      }

    }
    else
    {
      v47[1] = MEMORY[0x24BDAC760];
      v47[2] = 3221225472;
      v47[3] = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_10;
      v47[4] = &unk_24EC025A0;
      v48 = v7;
      v11 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_10();

      v12 = 0;
    }

  }
  else
  {
    v13 = __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    v12 = 0;
  }

  return v12;
}

id __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to retrieve extension identifier."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_10()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Failed to retrieve device configuration for extension."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

id __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_15()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to find SmartCard."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke_23()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("Key not found for extension identifier."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

- (id)identityForKeyType:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  POExtensionAgentProcess *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess identityForKeyType:].cold.1();

  -[POExtensionAgentProcess configurationManager](self, "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDeviceConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v40 = 0;
    switch(a3)
    {
      case 1:
        -[POExtensionAgentProcess configurationManager](self, "configurationManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "userDeviceConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          goto LABEL_5;
        -[POExtensionAgentProcess configurationManager](self, "configurationManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "userDeviceConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "deviceSigningIdentity");
        goto LABEL_14;
      case 2:
        -[POExtensionAgentProcess configurationManager](self, "configurationManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "userDeviceConfiguration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          goto LABEL_17;
        -[POExtensionAgentProcess configurationManager](self, "configurationManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "userDeviceConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "deviceEncryptionIdentity");
LABEL_14:
        v19 = v16;
        v40 = v16;

        if (!v19)
          goto LABEL_15;
        goto LABEL_19;
      case 3:
      case 6:
      case 7:
      case 8:
      case 9:
        goto LABEL_15;
      case 4:
      case 10:
LABEL_5:
        v8 = objc_msgSend(v7, "deviceSigningIdentity");
        goto LABEL_18;
      case 5:
      case 11:
LABEL_17:
        v8 = objc_msgSend(v7, "deviceEncryptionIdentity");
LABEL_18:
        v40 = v8;
        if (v8)
          goto LABEL_19;
        goto LABEL_15;
      default:
        if (a3 != 20)
          goto LABEL_15;
        v36 = objc_alloc_init(MEMORY[0x24BDDA938]);
        v38 = 0u;
        v39 = 0u;
        WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
        v11 = WeakRetained;
        if (WeakRetained)
        {
          objc_msgSend(WeakRetained, "auditToken");
        }
        else
        {
          v38 = 0u;
          v39 = 0u;
        }

        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v38, 32);
        v27 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setOptionCallerAuditToken:", v27);

        -[POExtensionAgentProcess keychainHelper](self, "keychainHelper");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[POExtensionAgentProcess configurationManager](self, "configurationManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "currentUserConfiguration");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "smartCardTokenId");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[POExtensionAgentProcess configurationManager](self, "configurationManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "currentUserConfiguration");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "smartCardHash");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v27) = objc_msgSend(v34, "retrieveIdentityForTokenId:context:forSigning:hash:identity:", v29, v36, 1, v32, &v40);

        if ((v27 & 1) == 0)
          v33 = __46__POExtensionAgentProcess_identityForKeyType___block_invoke_30();

        if (!v40)
        {
LABEL_15:
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __46__POExtensionAgentProcess_identityForKeyType___block_invoke_34;
          v37[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v37[4] = a3;
          v20 = __46__POExtensionAgentProcess_identityForKeyType___block_invoke_34((uint64_t)v37);
          goto LABEL_16;
        }
LABEL_19:
        v22 = objc_alloc(MEMORY[0x24BDE84F0]);
        v23 = (void *)objc_msgSend(v22, "initWithIdentity:", v40);
        v24 = self;
        objc_sync_enter(v24);
        -[POExtensionAgentProcess keyProxies](v24, "keyProxies");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addObject:", v23);

        objc_sync_exit(v24);
        objc_msgSend(v23, "endpoint");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        break;
    }
  }
  else
  {
    v9 = __46__POExtensionAgentProcess_identityForKeyType___block_invoke();
LABEL_16:
    v21 = 0;
  }

  return v21;
}

id __46__POExtensionAgentProcess_identityForKeyType___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("No device configuration for identity."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __46__POExtensionAgentProcess_identityForKeyType___block_invoke_30()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("Failed to find SmartCard identity."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __46__POExtensionAgentProcess_identityForKeyType___block_invoke_34(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("Key not found."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __46__POExtensionAgentProcess_identityForKeyType___block_invoke_34_cold_1((uint64_t)v2, a1, v3);

  return v2;
}

- (void)invalidateAllKeyProxies
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

- (id)bundleIdentiferForXPCConnection:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v8;
  __SecTask *v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD v13[5];
  CFErrorRef error;
  NSObject *v15;
  audit_token_t v16;
  audit_token_t buf;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  memset(&v16, 0, sizeof(v16));
  if (v3)
    objc_msgSend(v3, "auditToken");
  v15 = 0;
  buf = v16;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken())
  {
    v5 = v15;
    PO_LOG_POExtensionAgentProcess();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[POExtensionAgentProcess bundleIdentiferForXPCConnection:].cold.1();
  }
  else
  {
    PO_LOG_POExtensionAgentProcess();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.val[0]) = 0;
      _os_log_impl(&dword_22307D000, v8, OS_LOG_TYPE_DEFAULT, "bundleIdentifier: CPCopyBundleIdentifierAndTeamFromAuditToken() failed, trying SecTaskCopySigningIdentifier().", (uint8_t *)&buf, 2u);
    }

    buf = v16;
    v9 = SecTaskCreateWithAuditToken(0, &buf);
    v5 = v9;
    if (!v9)
    {
      v11 = __59__POExtensionAgentProcess_bundleIdentiferForXPCConnection___block_invoke_39();
      goto LABEL_7;
    }
    error = 0;
    v6 = SecTaskCopySigningIdentifier(v9, &error);
    CFRelease(v5);
    if (error)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __59__POExtensionAgentProcess_bundleIdentiferForXPCConnection___block_invoke;
      v13[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v13[4] = error;
      v10 = __59__POExtensionAgentProcess_bundleIdentiferForXPCConnection___block_invoke((uint64_t)v13);
      v5 = 0;
    }
    else
    {
      PO_LOG_POExtensionAgentProcess();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        buf.val[0] = 138543362;
        *(_QWORD *)&buf.val[1] = v6;
        _os_log_impl(&dword_22307D000, v12, OS_LOG_TYPE_INFO, "bundleIdentifier: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      v5 = v6;
    }
  }

LABEL_7:
  return v5;
}

id __59__POExtensionAgentProcess_bundleIdentiferForXPCConnection___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("bundleIdentifier: SecTaskCopySigningIdentifier() failed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POExtensionAgentProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v2;
}

id __59__POExtensionAgentProcess_bundleIdentiferForXPCConnection___block_invoke_39()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("bundleIdentifier: SecTaskCreateWithAuditToken() failed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (BOOL)isCallerCurrentSSOExtension
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  char v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id *v16;
  id v17;
  id v18;
  _QWORD v20[5];
  id v21;

  PO_LOG_POExtensionAgentProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess isCallerCurrentSSOExtension].cold.1();

  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  objc_msgSend(WeakRetained, "valueForEntitlement:", CFSTR("com.apple.private.platformsso.loginmanager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) == 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_xpcConnection);
    -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentDeviceConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[POExtensionAgentProcess configurationManager](self, "configurationManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentDeviceConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "extensionIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v9);

      if ((v15 & 1) != 0)
      {
        v7 = 1;
LABEL_11:

        return v7;
      }
      v16 = (id *)v20;
      v20[0] = v9;
      v18 = __54__POExtensionAgentProcess_isCallerCurrentSSOExtension__block_invoke_45();
    }
    else
    {
      v20[1] = MEMORY[0x24BDAC760];
      v20[2] = 3221225472;
      v20[3] = __54__POExtensionAgentProcess_isCallerCurrentSSOExtension__block_invoke;
      v20[4] = &unk_24EC025A0;
      v16 = &v21;
      v21 = v9;
      v17 = __54__POExtensionAgentProcess_isCallerCurrentSSOExtension__block_invoke();
    }

    v7 = 0;
    goto LABEL_11;
  }
  return 1;
}

id __54__POExtensionAgentProcess_isCallerCurrentSSOExtension__block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Failed to retrieve device configuration for extension."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

id __54__POExtensionAgentProcess_isCallerCurrentSSOExtension__block_invoke_45()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Caller is not current extension"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

- (void)isDeviceRegisteredWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;

  v4 = (void (**)(id, _QWORD, void *))a3;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess isDeviceRegisteredWithCompletion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("isDeviceRegistered"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v4[2](v4, 0, v15);
    goto LABEL_11;
  }
  -[POExtensionAgentProcess configurationManager](self, "configurationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDeviceConfiguration");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_13;
  v10 = (void *)v9;
  -[POExtensionAgentProcess configurationManager](self, "configurationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentDeviceConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "registrationCompleted"))
  {

LABEL_13:
    goto LABEL_14;
  }
  v13 = -[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension");

  if (v13)
  {
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentLoginConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      ((void (**)(id, BOOL, void *))v4)[2](v4, v15 != 0, 0);
LABEL_11:

    goto LABEL_16;
  }
LABEL_14:
  if (v4)
    v4[2](v4, 0, 0);
LABEL_16:

}

- (void)isUserRegisteredWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void (**)(id, _QWORD, void *))a3;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess isUserRegisteredWithCompletion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("isUserRegistered"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v4[2](v4, 0, v9);
    goto LABEL_9;
  }
  if (-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
  {
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentUserConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      ((void (**)(id, BOOL, void *))v4)[2](v4, v9 != 0, 0);
LABEL_9:

    goto LABEL_12;
  }
  if (v4)
    v4[2](v4, 0, 0);
LABEL_12:

}

- (void)registrationTokenWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  POProfile *v8;
  void *v9;
  void *v10;
  POProfile *v11;
  void *v12;

  v4 = a3;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess registrationTokenWithCompletion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("registrationToken"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [POProfile alloc];
    -[POExtensionAgentProcess configurationHost](self, "configurationHost");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "validatedProfileForPlatformSSO");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[POProfile initWithProfile:](v8, "initWithProfile:", v10);

    if (v11)
    {
      if (!-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
      {
        (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
        goto LABEL_12;
      }
      -[POProfile registrationToken](v11, "registrationToken");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v12, 0);
    }
    else
    {
      __59__POExtensionAgentProcess_registrationTokenWithCompletion___block_invoke_58();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v12);
    }

  }
  else
  {
    __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    v11 = (POProfile *)objc_claimAutoreleasedReturnValue();
    if (v4)
      (*((void (**)(id, _QWORD, POProfile *))v4 + 2))(v4, 0, v11);
  }
LABEL_12:

}

id __59__POExtensionAgentProcess_registrationTokenWithCompletion___block_invoke_58()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("No platform SSO Profiles."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)setRegistrationToken:(id)a3 completion:(id)a4
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;

  v4 = (void (**)(id, _QWORD, void *))a4;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess setRegistrationToken:completion:].cold.1();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("not impl"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v6);

  }
}

- (void)ssoTokensWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFData *v12;
  __SecKey *v13;
  __SecKey *v14;
  CFDataRef EncryptedData;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  CFErrorRef error[5];
  const __CFData *v22;

  v4 = (void (**)(id, _QWORD, void *))a3;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess ssoTokensWithCompletion:].cold.2();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("SSOTokens"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentDeviceConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9 || !-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
    {
      error[1] = (CFErrorRef)MEMORY[0x24BDAC760];
      error[2] = (CFErrorRef)3221225472;
      error[3] = (CFErrorRef)__51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_67;
      error[4] = (CFErrorRef)&unk_24EC025A0;
      v22 = v7;
      __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_67();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        v4[2](v4, 0, v16);

      v12 = v22;
      goto LABEL_29;
    }
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extensionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tokensForExtensionIdentifier:", v11);
    v12 = (const __CFData *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      PO_LOG_POExtensionAgentProcess();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[POExtensionAgentProcess ssoTokensWithCompletion:].cold.1(v17);

      if (v4)
        v4[2](v4, 0, 0);
      goto LABEL_29;
    }
    if (objc_msgSend(v9, "deviceEncryptionKey"))
    {
      v13 = SecKeyCopyPublicKey((SecKeyRef)objc_msgSend(v9, "deviceEncryptionKey"));
      if (v13)
      {
        v14 = v13;
        if (SecKeyIsAlgorithmSupported(v13, kSecKeyOperationTypeEncrypt, (SecKeyAlgorithm)*MEMORY[0x24BDE92E8]))
        {
          error[0] = 0;
          EncryptedData = SecKeyCreateEncryptedData(v14, (SecKeyAlgorithm)*MEMORY[0x24BDE92F8], v12, error);
          CFRelease(v14);
          if (error[0] || !EncryptedData)
          {
            v20[0] = MEMORY[0x24BDAC760];
            v20[1] = 3221225472;
            v20[2] = __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_80;
            v20[3] = &__block_descriptor_40_e14___NSError_8__0l;
            v20[4] = error[0];
            __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_80((uint64_t)v20);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v4)
              v4[2](v4, 0, v19);

          }
          else if (v4)
          {
            ((void (**)(id, CFDataRef, void *))v4)[2](v4, EncryptedData, 0);
          }
LABEL_28:

LABEL_29:
          goto LABEL_30;
        }
        CFRelease(v14);
        __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_76();
        v18 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_72();
        v18 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_68();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    EncryptedData = (CFDataRef)v18;
    if (v4)
      v4[2](v4, 0, (void *)v18);
    goto LABEL_28;
  }
  __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v4[2](v4, 0, v9);
LABEL_30:

}

id __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_67()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Failed to retrieve device configuration for extension."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

id __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_68()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("Missing device encryption key."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_72()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("Missing device encryption public key."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_76()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Encryption algorithm not supported."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_80(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Failed to encrypt tokens."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POExtensionAgentProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v2;
}

- (void)setSsoTokens:(id)a3 completion:(id)a4
{
  const __CFData *v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  __SecKey *v13;
  __SecKey *v14;
  CFDataRef v15;
  CFDataRef v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  const __CFData *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFData *v38;
  char v39;
  _QWORD block[5];
  const __CFData *v41;
  id v42;
  _QWORD v43[4];
  const __CFData *v44;
  _QWORD v45[4];
  const __CFData *v46;
  id v47;
  _QWORD v48[5];
  CFErrorRef error;
  _QWORD v50[4];
  const __CFData *v51;
  id v52[5];
  id v53;

  v6 = (const __CFData *)a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  PO_LOG_POExtensionAgentProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess setSsoTokens:completion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("setSSOTokens"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v7[2](v7, 0, v12);
    goto LABEL_38;
  }
  -[POExtensionAgentProcess configurationManager](self, "configurationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentDeviceConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || !-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
  {
    v52[1] = (id)MEMORY[0x24BDAC760];
    v52[2] = (id)3221225472;
    v52[3] = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_86;
    v52[4] = &unk_24EC025A0;
    v53 = v10;
    __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_86();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v7[2](v7, 0, v26);

    goto LABEL_38;
  }
  if (!v6)
  {
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "extensionIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = 0;
    v29 = objc_msgSend(v27, "setTokens:extensionIdentifier:returningError:", 0, v28, v52);
    v16 = (CFDataRef)v52[0];
    if (v29)
    {
      -[POExtensionAgentProcess configurationManager](self, "configurationManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSUserName();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "savePendingSSOTokens:forUserName:", 0, v31))
      {
        -[POExtensionAgentProcess configurationManager](self, "configurationManager");
        v38 = v16;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        NSUserName();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v32, "saveStashedSSOTokens:forUserName:", 0, v33);

        v16 = v38;
        if ((v39 & 1) != 0)
        {
          if (v7)
            v7[2](v7, 1, 0);
          goto LABEL_37;
        }
        goto LABEL_33;
      }

    }
LABEL_33:
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_87;
    v50[3] = &unk_24EC025A0;
    v51 = v16;
    __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_87((uint64_t)v50);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v36);

LABEL_37:
    goto LABEL_38;
  }
  v13 = (__SecKey *)objc_msgSend(v12, "deviceEncryptionKey");
  if (SecKeyIsAlgorithmSupported(v13, kSecKeyOperationTypeDecrypt, (SecKeyAlgorithm)*MEMORY[0x24BDE92E8]))
  {
    error = 0;
    v14 = (__SecKey *)objc_msgSend(v12, "deviceEncryptionKey");
    v15 = SecKeyCreateDecryptedData(v14, (SecKeyAlgorithm)*MEMORY[0x24BDE92F8], v6, &error);
    v16 = v15;
    if (error || !v15)
    {
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_92;
      v48[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v48[4] = error;
      __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_92((uint64_t)v48);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
        v7[2](v7, 0, v20);
    }
    else
    {
      -[POExtensionAgentProcess configurationManager](self, "configurationManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "extensionIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      v19 = objc_msgSend(v17, "setTokens:extensionIdentifier:returningError:", v16, v18, &v47);
      v20 = v47;

      if ((v19 & 1) != 0)
      {
        -[POExtensionAgentProcess configurationManager](self, "configurationManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        NSUserName();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "saveStashedSSOTokens:forUserName:", v16, v22);

        if ((v23 & 1) != 0)
        {
          dispatch_get_global_queue(0, 0);
          v24 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_101;
          block[3] = &unk_24EC037F0;
          block[4] = self;
          v41 = v16;
          v42 = v10;
          dispatch_async(v24, block);

          if (v7)
            v7[2](v7, 1, 0);

          v25 = v41;
        }
        else
        {
          v43[0] = MEMORY[0x24BDAC760];
          v43[1] = 3221225472;
          v43[2] = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_98;
          v43[3] = &unk_24EC025A0;
          v20 = v20;
          v44 = (const __CFData *)v20;
          __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_98((uint64_t)v43);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v7[2](v7, 0, v37);

          v25 = v44;
        }
      }
      else
      {
        v45[0] = MEMORY[0x24BDAC760];
        v45[1] = 3221225472;
        v45[2] = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_95;
        v45[3] = &unk_24EC025A0;
        v20 = v20;
        v46 = (const __CFData *)v20;
        __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_95((uint64_t)v45);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, v35);

        v25 = v46;
      }

    }
    goto LABEL_37;
  }
  __51__POExtensionAgentProcess_ssoTokensWithCompletion___block_invoke_76();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v7[2](v7, 0, v34);

LABEL_38:
}

id __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_86()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Failed to retrieve device configuration for extension."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

id __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_87(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to remove tokens."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_92(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("Failed to decrypt tokens."));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POExtensionAgentProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v2;
}

id __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_95(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to save tokens."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_98(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to stash tokens."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

void __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_101(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "agentProcess");
  v2 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentUserConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v2, "handleKerberosMappingForTokens:extensionIdentifier:userConfiguration:", v4, v3, v6);

  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v7, "saveCurrentUserConfigurationAndSyncToPreboot:", 0);

  if ((v2 & 1) == 0)
    v8 = __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_2();
}

id __51__POExtensionAgentProcess_setSsoTokens_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after handling kerberos mapping."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)loginConfigurationWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void (**)(id, void *, _QWORD))a3;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess loginConfigurationWithCompletion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("loginConfiguration"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentLoginConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v4[2](v4, v9, 0);
  }
  else
  {
    __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v9);
  }

}

- (void)setLoginConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  NSObject *v8;
  id WeakRetained;
  void *v10;
  POProfile *v11;
  void *v12;
  void *v13;
  POProfile *v14;
  void *v15;
  BOOL v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  char v58;
  void *v59;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  PO_LOG_POExtensionAgentProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess setLoginConfiguration:completion:].cold.3();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("setLoginConfiguration"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    v38 = objc_claimAutoreleasedReturnValue();
    goto LABEL_63;
  }
  if (!objc_msgSend(MEMORY[0x24BE04378], "isAssociatedDomainValidated"))
    goto LABEL_11;
  v11 = [POProfile alloc];
  -[POExtensionAgentProcess configurationHost](self, "configurationHost");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "validatedProfileForPlatformSSO");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[POProfile initWithProfile:](v11, "initWithProfile:", v13);

  if (!v14)
  {
    __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_112();
    v39 = objc_claimAutoreleasedReturnValue();
LABEL_47:
    v50 = (void *)v39;
    if (v7)
      v7[2](v7, 0, v39);

    goto LABEL_66;
  }
  objc_msgSend(v6, "tokenEndpointURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[POExtensionAgentProcess isURL:validForProfile:](self, "isURL:validForProfile:", v15, v14);

  if (!v16)
  {
    __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_116();
    v39 = objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  objc_msgSend(v6, "nonceEndpointURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[POExtensionAgentProcess isURL:validForProfile:](self, "isURL:validForProfile:", v17, v14);

  if (!v18)
  {
    __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_120();
    v39 = objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }
  objc_msgSend(v6, "refreshEndpointURL");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    objc_msgSend(v6, "refreshEndpointURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[POExtensionAgentProcess isURL:validForProfile:](self, "isURL:validForProfile:", v21, v14);

    if (!v22)
    {
      __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_124();
      v39 = objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    }
  }

LABEL_11:
  objc_msgSend(v6, "invalidCredentialPredicate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v6, "invalidCredentialPredicate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "predicateWithFormat:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "evaluateWithObject:", MEMORY[0x24BDBD1B8]);
  }
  if (objc_msgSend(v6, "federationType") == 1 || objc_msgSend(v6, "federationType") == 2)
  {
    objc_msgSend(v6, "federationRequestURN");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_133();
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    }
  }
  if (objc_msgSend(v6, "federationType") == 2)
  {
    objc_msgSend(v6, "federationUserPreauthenticationURL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_137();
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    }
    objc_msgSend(v6, "federationMexURLKeypath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_141();
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    }
    v31 = (void *)MEMORY[0x24BDD1758];
    objc_msgSend(v6, "federationPredicate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "predicateWithFormat:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "evaluateWithObject:", MEMORY[0x24BDBD1B8]);
  }
  if (objc_msgSend(v6, "federationType") == 1)
  {
    objc_msgSend(v6, "federationMexURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v34)
    {
      __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_149();
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    }
  }
  objc_msgSend(v6, "hpkePsk");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v6, "hpkePsk");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "length");

    if (v37 <= 0x1F)
    {
      __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_153();
      v38 = objc_claimAutoreleasedReturnValue();
LABEL_63:
      v59 = (void *)v38;
      if (v7)
        v7[2](v7, 0, v38);

      goto LABEL_66;
    }
    objc_msgSend(v6, "hpkePsk_id");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "length");

    if (!v41)
    {
      __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_157();
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    }
  }
  objc_msgSend(v6, "hpkePsk_id");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "length"))
  {
    objc_msgSend(v6, "hpkePsk");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "length");

    if (!v44)
    {
      __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_161();
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    }
  }
  else
  {

  }
  if (!objc_msgSend(v6, "hpkeAuthPublicKey"))
    goto LABEL_40;
  -[POExtensionAgentProcess configurationManager](self, "configurationManager");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "currentDeviceConfiguration");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "encryptionAlgorithm");
  v14 = (POProfile *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BE72EF0], "isEncryptionAlgorithm:validForKey:", v14, objc_msgSend(v6, "hpkeAuthPublicKey")) & 1) == 0)
  {
    __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_166();
    v39 = objc_claimAutoreleasedReturnValue();
    goto LABEL_47;
  }

LABEL_40:
  objc_msgSend(v6, "loginRequestHpkePsk");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend(v6, "loginRequestHpkePsk");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "length");

    if (v49 <= 0x1F)
    {
      __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_170();
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    }
    objc_msgSend(v6, "loginRequestHpkePsk_id");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "length");

    if (!v52)
    {
      __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_174();
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    }
  }
  objc_msgSend(v6, "loginRequestHpkePsk_id");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v53, "length"))
  {
    objc_msgSend(v6, "loginRequestHpkePsk");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "length");

    if (!v55)
    {
      __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_178();
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    }
  }
  else
  {

  }
  if (objc_msgSend(v6, "userSEPKeyBiometricPolicy"))
  {
    v56 = objc_msgSend(v6, "userSEPKeyBiometricPolicy") & 2;
    if (!(v56 & 0xFFFFFFFFFFFFFFFELL | objc_msgSend(v6, "userSEPKeyBiometricPolicy") & 1))
    {
      __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_182();
      v38 = objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    }
  }
  -[POExtensionAgentProcess configurationManager](self, "configurationManager");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "saveLoginConfiguration:", v6);

  if ((v58 & 1) == 0)
  {
    __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_186();
    v38 = objc_claimAutoreleasedReturnValue();
    goto LABEL_63;
  }
  objc_msgSend(MEMORY[0x24BE72E78], "analyticsForLoginConfiguration:", v6);
  if (v7)
    v7[2](v7, 1, 0);
LABEL_66:

}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_112()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("No validated Platform SSO Profiles."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_116()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Token endpoint URL is not approved profile URL."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_120()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Nonce endpoint URL is not approved profile URL."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_124()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Refresh endpoint URL is not approved profile URL."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_129()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("The invalidCredentialPredicate is not formatted correctly."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_133()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("The federationRequestURN is missing."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_137()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("The federationUserPreauthenticationURL is missing."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_141()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("The federationMexURLKeypath is missing."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_145()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("The federationPredicate is not formatted correctly."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_149()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("The federationMexURL is missing."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_153()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("The HPKE PSK must be at least 32 bytes."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_157()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("The HPKE PSK_id is required when the PSK is set."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_161()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("The HPKE PSK is required when the PSK_id is set."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_166()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("The HPKE Auth Key is not valid for current encryption algorithm."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_170()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("The login request HPKE PSK must be at least 32 bytes."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_174()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("The login request HPKE PSK_id is required when the PSK is set."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_178()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("The login request HPKE PSK is required when the login request PSK_id is set."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_182()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Invalid user secure enclave key biometric policy."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_186()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save the login configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (BOOL)isURL:(id)a3 validForProfile:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "URLPrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v17 = v5;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "stringByAppendingString:", CFSTR("*"));
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "predicateWithFormat:", CFSTR("SELF LIKE[c] %@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v13) = objc_msgSend(v14, "evaluateWithObject:", v6);
        if ((v13 & 1) != 0)
        {
          v15 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
    v15 = 0;
LABEL_11:
    v5 = v17;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)setCertificateData:(id)a3 keyType:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  NSObject *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;

  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  PO_LOG_POExtensionAgentProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess setCertificateData:keyType:completion:].cold.1();

  -[POExtensionAgentProcess addEvent:forKeyType:](self, "addEvent:forKeyType:", CFSTR("setCertificateData"), a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentDeviceConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && -[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
    {
      if ((unint64_t)a4 <= 0xB)
      {
        if (((1 << a4) & 0x412) != 0)
        {
          objc_msgSend(v14, "setDeviceSigningCertificate:", objc_msgSend(MEMORY[0x24BE72EF0], "certificateForData:", v8));
          goto LABEL_16;
        }
        if (((1 << a4) & 0x824) != 0)
        {
          objc_msgSend(v14, "setDeviceEncryptionCertificate:", objc_msgSend(MEMORY[0x24BE72EF0], "certificateForData:", v8));
          goto LABEL_16;
        }
      }
      if (v9)
      {
        __65__POExtensionAgentProcess_setCertificateData_keyType_completion___block_invoke_198();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
LABEL_16:
      -[POExtensionAgentProcess configurationManager](self, "configurationManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "saveDeviceConfiguration:", v14);

      if ((v17 & 1) != 0)
      {
        if (v9)
          v9[2](v9, 1, 0);
        goto LABEL_25;
      }
      __65__POExtensionAgentProcess_setCertificateData_keyType_completion___block_invoke_202();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
LABEL_24:

        goto LABEL_25;
      }
LABEL_23:
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v18);
      goto LABEL_24;
    }
    v19 = v12;
    __65__POExtensionAgentProcess_setCertificateData_keyType_completion___block_invoke_197();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v15);

  }
  else
  {
    __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v14);
  }
LABEL_25:

}

id __65__POExtensionAgentProcess_setCertificateData_keyType_completion___block_invoke_197()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Failed to retrieve device configuration for extension."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

id __65__POExtensionAgentProcess_setCertificateData_keyType_completion___block_invoke_198()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Invalid key type for certificate."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __65__POExtensionAgentProcess_setCertificateData_keyType_completion___block_invoke_202()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save the device configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)secKeyProxyEndpointForKeyType:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  NSObject *v7;
  void *v8;
  void *v9;

  v6 = (void (**)(id, void *, _QWORD))a4;
  PO_LOG_POExtensionAgentProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess secKeyProxyEndpointForKeyType:completion:].cold.1();

  -[POExtensionAgentProcess keyProxyEndpointForKeyType:](self, "keyProxyEndpointForKeyType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6)
      v6[2](v6, v8, 0);
  }
  else
  {
    __68__POExtensionAgentProcess_secKeyProxyEndpointForKeyType_completion___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      ((void (**)(id, void *, void *))v6)[2](v6, 0, v9);

  }
}

id __68__POExtensionAgentProcess_secKeyProxyEndpointForKeyType_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to receive key proxy endpoint."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)secIdentityProxyEndpointForKeyType:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  NSObject *v7;
  void *v8;
  void *v9;

  v6 = (void (**)(id, void *, _QWORD))a4;
  PO_LOG_POExtensionAgentProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess secIdentityProxyEndpointForKeyType:completion:].cold.1();

  -[POExtensionAgentProcess identityForKeyType:](self, "identityForKeyType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6)
      v6[2](v6, v8, 0);
  }
  else
  {
    __73__POExtensionAgentProcess_secIdentityProxyEndpointForKeyType_completion___block_invoke();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      ((void (**)(id, void *, void *))v6)[2](v6, 0, v9);

  }
}

id __73__POExtensionAgentProcess_secIdentityProxyEndpointForKeyType_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to receive identity key proxy endpoint."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)attestKey:(int64_t)a3 clientDataHash:(id)a4 completion:(id)a5
{
  void (**v5)(id, _QWORD, void *);
  NSObject *v6;
  void *v7;

  v5 = (void (**)(id, _QWORD, void *))a5;
  PO_LOG_POExtensionAgentProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess attestKey:clientDataHash:completion:].cold.1();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("not impl"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, v7);

  }
}

- (void)copyDeviceAttestationCertificateWithCompletion:(id)a3
{
  void (**v3)(id, _QWORD, void *);
  NSObject *v4;
  void *v5;

  v3 = (void (**)(id, _QWORD, void *))a3;
  PO_LOG_POExtensionAgentProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess copyDeviceAttestationCertificateWithCompletion:].cold.1();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE72EB0], "internalErrorWithMessage:", CFSTR("not impl"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0, v5);

  }
}

- (void)userNeedsReauthenticationWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];

  v4 = (void (**)(id, _QWORD, void *))a3;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess userNeedsReauthenticationWithCompletion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("userNeedsReauthentication"));
  if (-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
  {
    -[POExtensionAgentProcess authenticationCompletion](self, "authenticationCompletion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[POExtensionAgentProcess authenticationCompletion](self, "authenticationCompletion");
      v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BDD1540];
      getASAuthorizationErrorDomain_0();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 1001, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v10);

      -[POExtensionAgentProcess setAuthenticationCompletion:](self, "setAuthenticationCompletion:", 0);
    }
    -[POExtensionAgentProcess setAuthenticationCompletion:](self, "setAuthenticationCompletion:", v4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke_218;
    v17[3] = &unk_24EC03818;
    v17[4] = self;
    objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.PlatformSSO.authenticationCompleted"), 0, 0, v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[POExtensionAgentProcess setAuthenticationObserver:](self, "setAuthenticationObserver:", v13);

    dispatch_get_global_queue(0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke_2;
    v16[3] = &unk_24EC02ED0;
    v16[4] = self;
    dispatch_async(v14, v16);

  }
  else
  {
    __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v15);

  }
}

id __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Caller is not current SSO extension."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

void __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke_218(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  id v17;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("authenticationResult"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v17, "intValue"))
  {
    case 0u:
    case 5u:
      v9 = (void *)MEMORY[0x24BDD1540];
      getASAuthorizationErrorDomain_0();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v9;
      v7 = v5;
      v8 = 1000;
      goto LABEL_7;
    case 1u:
      v10 = 0;
      v11 = 1;
      goto LABEL_9;
    case 2u:
    case 3u:
    case 4u:
      v4 = (void *)MEMORY[0x24BDD1540];
      getASAuthorizationErrorDomain_0();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v4;
      v7 = v5;
      v8 = 1004;
      goto LABEL_7;
    case 6u:
      v12 = (void *)MEMORY[0x24BDD1540];
      getASAuthorizationErrorDomain_0();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v12;
      v7 = v5;
      v8 = 1001;
LABEL_7:
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v10 = 0;
      break;
  }
  v11 = 0;
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "authenticationCompletion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "authenticationCompletion");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v14)[2](v14, v11, v10);

    objc_msgSend(*(id *)(a1 + 32), "setAuthenticationCompletion:", 0);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "authenticationObserver");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeObserver:", v16);

  objc_msgSend(*(id *)(a1 + 32), "setAuthenticationObserver:", 0);
}

void __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "agentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "handleUserNeedsReauthenticationAfterDelay:", 1.0);

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "authenticationObserver");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", v5);

    objc_msgSend(*(id *)(a1 + 32), "setAuthenticationObserver:", 0);
    objc_msgSend(*(id *)(a1 + 32), "authenticationCompletion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "authenticationCompletion");
      v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BDD1540];
      getASAuthorizationErrorDomain_0();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 1004, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v10);

      objc_msgSend(*(id *)(a1 + 32), "setAuthenticationCompletion:", 0);
    }
  }
}

- (void)deviceRegistrationsNeedsRepairWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _QWORD block[5];

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess deviceRegistrationsNeedsRepairWithCompletion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("deviceRegistrationNeedsRepair"));
  if (-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
  {
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__POExtensionAgentProcess_deviceRegistrationsNeedsRepairWithCompletion___block_invoke_223;
    block[3] = &unk_24EC02ED0;
    block[4] = self;
    dispatch_async(v6, block);

    if (v4)
      v4[2](v4, 1, 0);
  }
  else
  {
    __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v7);

  }
}

void __72__POExtensionAgentProcess_deviceRegistrationsNeedsRepairWithCompletion___block_invoke_223(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "agentProcess");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleDeviceAndUserRegistrationForRepair:", 1);

}

- (void)userRegistrationsNeedsRepairWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess userRegistrationsNeedsRepairWithCompletion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("userRegistrationNeedsRepair"));
  if (-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
  {
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSUserName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userConfigurationForUserName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "userLoginConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loginUserName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __70__POExtensionAgentProcess_userRegistrationsNeedsRepairWithCompletion___block_invoke_227;
    v13[3] = &unk_24EC031A8;
    v13[4] = self;
    v14 = v10;
    v12 = v10;
    dispatch_async(v11, v13);

    if (v4)
      v4[2](v4, 1, 0);

  }
  else
  {
    __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v8);
  }

}

void __70__POExtensionAgentProcess_userRegistrationsNeedsRepairWithCompletion___block_invoke_227(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "agentProcess");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleUserRegistrationForUser:repair:", *(_QWORD *)(a1 + 40), 1);

}

- (void)presentRegistrationViewControllerWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;

  v4 = (void (**)(id, _QWORD, void *))a3;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess presentRegistrationViewControllerWithCompletion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("presentRegistrationViewController"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[POExtensionAgentProcess agentProcess](self, "agentProcess");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleRegistrationViewControllerForExtensionIdentifier:completion:", v7, v4);
  }
  else
  {
    __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v4[2](v4, 0, v8);
  }

}

- (void)resetDeviceKeysWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess resetDeviceKeysWithCompletion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("resetDeviceKeys"));
  if (-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
    -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[POExtensionAgentProcess configurationManager](self, "configurationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentDeviceConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 && -[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
      {
        -[POExtensionAgentProcess invalidateAllKeyProxies](self, "invalidateAllKeyProxies");
        v10 = (void *)MEMORY[0x24BE72EF0];
        objc_msgSend(v9, "signingAlgorithm");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setDeviceSigningKey:", objc_msgSend(v10, "createSEPSigningKeyForAlgorithm:shared:", v11, objc_msgSend(v9, "sharedDeviceKeys")));

        v12 = (void *)MEMORY[0x24BE72EF0];
        objc_msgSend(v9, "encryptionAlgorithm");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setDeviceEncryptionKey:", objc_msgSend(v12, "createSEPEncryptionKeyForAlgorithm:shared:", v13, objc_msgSend(v9, "sharedDeviceKeys")));

        -[POExtensionAgentProcess configurationManager](self, "configurationManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v12) = objc_msgSend(v14, "saveDeviceConfiguration:", v9);

        if ((v12 & 1) != 0)
        {
          if (v4)
            v4[2](v4, 1, 0);
        }
        else
        {
          __57__POExtensionAgentProcess_resetDeviceKeysWithCompletion___block_invoke_237();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v4)
            ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v16);

        }
      }
      else
      {
        v17 = v7;
        __57__POExtensionAgentProcess_resetDeviceKeysWithCompletion___block_invoke_236();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v15);

      }
    }
    else
    {
      __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v9);
    }

  }
  else
  {
    __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v7);
  }

}

id __57__POExtensionAgentProcess_resetDeviceKeysWithCompletion___block_invoke_236()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Failed to retrieve device configuration for extension."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

id __57__POExtensionAgentProcess_resetDeviceKeysWithCompletion___block_invoke_237()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save device configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)resetUserSecureEnclaveKeyWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  id v33;

  v4 = (void (**)(id, _QWORD, void *))a3;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess resetUserSecureEnclaveKeyWithCompletion:].cold.2();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("resetUserSecureEnclaveKey"));
  if (-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
    -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        v4[2](v4, 0, v9);
      goto LABEL_38;
    }
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentDeviceConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9 || !-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
    {
      v33 = v7;
      __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_246();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        v4[2](v4, 0, v22);

      v12 = v33;
      goto LABEL_37;
    }
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSUserName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userConfigurationForUserName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_247();
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    -[POExtensionAgentProcess invalidateAllKeyProxies](self, "invalidateAllKeyProxies");
    if (!objc_msgSend(v12, "sepKey") || objc_msgSend(v12, "loginType") != 2)
    {
      objc_msgSend(v12, "setSepKey:", 0);
LABEL_30:
      -[POExtensionAgentProcess configurationManager](self, "configurationManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      NSUserName();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "saveUserConfiguration:forUserName:syncToPreboot:", v12, v30, 1);

      if ((v31 & 1) != 0)
      {
        if (v4)
          v4[2](v4, 1, 0);
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_255();
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_34:
      v32 = (void *)v23;
      if (v4)
        v4[2](v4, 0, (void *)v23);

      goto LABEL_37;
    }
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentLoginConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "userSEPKeyBiometricPolicy");

    PO_LOG_POExtensionAgentProcess();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[POExtensionAgentProcess resetUserSecureEnclaveKeyWithCompletion:].cold.1(v15, v16);

    if (!v15)
      goto LABEL_16;
    v17 = objc_alloc_init(MEMORY[0x24BDDA938]);
    v18 = objc_msgSend(v17, "canEvaluatePolicy:error:", 1, 0);

    if ((v18 & 1) == 0)
    {
      __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_251();
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    if ((v15 & 1) != 0)
    {
      v24 = (void *)MEMORY[0x24BE72EF0];
      objc_msgSend(v12, "signingAlgorithm");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      v26 = v20;
      v27 = 1;
    }
    else
    {
      if ((v15 & 2) == 0)
      {
LABEL_16:
        v19 = (void *)MEMORY[0x24BE72EF0];
        objc_msgSend(v12, "signingAlgorithm");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "createUserSEPSigningKeyForAlgorithm:", v20);
LABEL_29:
        objc_msgSend(v12, "setSepKey:", v21);

        goto LABEL_30;
      }
      v28 = (void *)MEMORY[0x24BE72EF0];
      objc_msgSend(v12, "signingAlgorithm");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v28;
      v26 = v20;
      v27 = 0;
    }
    v21 = objc_msgSend(v25, "createUserSEPSigningKeyForAlgorithm:userPresence:currentSet:", v26, 1, v27);
    goto LABEL_29;
  }
  __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v7);
LABEL_39:

}

id __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_246()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Failed to retrieve device configuration for extension."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

id __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_247()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("Failed to retrieve user configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_251()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to create key during reset key because companion is not available."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_255()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)loginUserNameWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void (**)(id, _QWORD, void *))a3;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess loginUserNameWithCompletion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("loginUserName"));
  if (-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
  {
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSUserName();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userConfigurationForUserName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      __55__POExtensionAgentProcess_loginUserNameWithCompletion___block_invoke_262();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        v4[2](v4, 0, v9);
      goto LABEL_10;
    }
    if (v4)
    {
      objc_msgSend(v8, "userLoginConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "loginUserName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v4)[2](v4, v10, 0);

LABEL_10:
    }
  }
  else
  {
    __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v8);
  }

}

id __55__POExtensionAgentProcess_loginUserNameWithCompletion___block_invoke_262()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to retrieve user configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)setLoginUserName:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  PO_LOG_POExtensionAgentProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess setLoginUserName:completion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("setLoginUserName"));
  if (!-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
  {
    __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v11);
    goto LABEL_17;
  }
  -[POExtensionAgentProcess configurationManager](self, "configurationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSUserName();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userConfigurationForUserName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "userLoginConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v11, "userLoginConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLoginUserName:", v6);
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72F08]), "initWithLoginUserName:", v6);
      objc_msgSend(v11, "setUserLoginConfiguration:", v13);
    }

    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    NSUserName();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "saveUserConfiguration:forUserName:syncToPreboot:", v11, v16, 1);

    if ((v17 & 1) != 0)
    {
      if (v7)
        v7[2](v7, 1, 0);
      goto LABEL_17;
    }
    __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_255();
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __55__POExtensionAgentProcess_loginUserNameWithCompletion___block_invoke_262();
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v14;
  if (v7)
    v7[2](v7, 0, (void *)v14);

LABEL_17:
}

- (void)userLoginConfigurationWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void (**)(id, _QWORD, void *))a3;
  PO_LOG_POExtensionAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess userLoginConfigurationWithCompletion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("userLoginConfiguration"));
  -[POExtensionAgentProcess configurationManager](self, "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentUserConfiguration");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    goto LABEL_7;
  }
  v8 = (void *)v7;
  v9 = -[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension");

  if (!v9)
  {
LABEL_7:
    __64__POExtensionAgentProcess_userLoginConfigurationWithCompletion___block_invoke();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v12);
    goto LABEL_8;
  }
  -[POExtensionAgentProcess configurationManager](self, "configurationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentUserConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userLoginConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(id, void *, void *))v4)[2](v4, v12, 0);
LABEL_8:

}

id __64__POExtensionAgentProcess_userLoginConfigurationWithCompletion___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to retrieve user login configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)setUserLoginConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  PO_LOG_POExtensionAgentProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess setUserLoginConfiguration:completion:].cold.1();

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("setUserLoginConfiguration"));
  -[POExtensionAgentProcess configurationManager](self, "configurationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentUserConfiguration");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    goto LABEL_8;
  }
  v11 = (void *)v10;
  v12 = -[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension");

  if (!v12)
  {
LABEL_8:
    __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_247();
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v17 = (void *)v16;
    v7[2](v7, 0, v16);

    goto LABEL_10;
  }
  -[POExtensionAgentProcess configurationManager](self, "configurationManager");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v13, "currentUserConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUserLoginConfiguration:", v6);

  -[POExtensionAgentProcess configurationManager](self, "configurationManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v15, "saveCurrentUserConfigurationAndSyncToPreboot:", 1);

  if ((v13 & 1) == 0)
  {
    __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_255();
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v7[2](v7, 1, 0);
LABEL_10:

}

- (void)rotateKeyForKeyType:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  POExtensionAgentProcess *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  POExtensionAgentProcess *v42;
  POExtensionAgentProcess *v43;
  void *v44;
  void *v45;
  POExtensionAgentProcess *v46;
  char v47[24];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, void *))a4;
  PO_LOG_POExtensionAgentProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess rotateKeyForKeyType:completion:].cold.2(a3);

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("rotateKeyForKeyType"));
  if (-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
    -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v6[2](v6, 0, v11);
      goto LABEL_30;
    }
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentDeviceConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11 || !-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
    {
      v46 = v9;
      __58__POExtensionAgentProcess_rotateKeyForKeyType_completion___block_invoke_287();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v6[2](v6, 0, v27);

      v12 = v46;
      goto LABEL_27;
    }
    v12 = self;
    objc_sync_enter(v12);
    if (a3 == 11)
    {
      objc_msgSend(v11, "pendingEncryptionAlgorithm");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (!v28)
      {
        objc_msgSend(v11, "encryptionAlgorithm");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[POExtensionAgentProcess setPendingEncryptionAlgorithm:](v12, "setPendingEncryptionAlgorithm:", v29);
      if (!v28)

      v30 = (void *)MEMORY[0x24BE72EF0];
      -[POExtensionAgentProcess pendingEncryptionAlgorithm](v12, "pendingEncryptionAlgorithm");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "createSEPEncryptionKeyForAlgorithm:shared:", v31, objc_msgSend(v11, "sharedDeviceKeys"));
      objc_msgSend(v11, "setDeviceEncryptionKey:", v32);
      -[POExtensionAgentProcess setPendingEncryptionKey:](v12, "setPendingEncryptionKey:", v32);

      v33 = -[POExtensionAgentProcess pendingEncryptionKey](v12, "pendingEncryptionKey");
    }
    else
    {
      if (a3 != 10)
      {
        if (a3 == 3)
        {
          -[POExtensionAgentProcess configurationManager](v12, "configurationManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          NSUserName();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "userConfigurationForUserName:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            if (objc_msgSend(v15, "loginType") != 2)
            {
              -[POExtensionAgentProcess setPendingUserSEPKey:](v12, "setPendingUserSEPKey:", 0);
              v38 = 0;
LABEL_54:

LABEL_55:
              objc_sync_exit(v12);

              if (v38)
              {
                v42 = (POExtensionAgentProcess *)objc_msgSend(objc_alloc(MEMORY[0x24BDE84F0]), "initWithKey:", v38);
                v43 = v12;
                objc_sync_enter(v43);
                -[POExtensionAgentProcess keyProxies](v43, "keyProxies");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "addObject:", v42);

                objc_sync_exit(v43);
                -[POExtensionAgentProcess endpoint](v42, "endpoint");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(id, void *, void *))v6)[2](v6, v45, 0);

                v12 = v42;
              }
              else
              {
                __58__POExtensionAgentProcess_rotateKeyForKeyType_completion___block_invoke_296();
                v12 = (POExtensionAgentProcess *)objc_claimAutoreleasedReturnValue();
                v6[2](v6, 0, v12);
              }
              goto LABEL_27;
            }
            objc_msgSend(v15, "pendingSigningAlgorithm");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (!v16)
            {
              objc_msgSend(v15, "signingAlgorithm");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
            }
            -[POExtensionAgentProcess setPendingUserSEPSigningAlgorithm:](v12, "setPendingUserSEPSigningAlgorithm:", v17);
            if (!v16)

            -[POExtensionAgentProcess configurationManager](v12, "configurationManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "currentLoginConfiguration");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "userSEPKeyBiometricPolicy");

            PO_LOG_POExtensionAgentProcess();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[POExtensionAgentProcess rotateKeyForKeyType:completion:].cold.1(v22, (uint64_t)v47, v21);
            }

            if (!v20)
              goto LABEL_22;
            v23 = objc_alloc_init(MEMORY[0x24BDDA938]);
            v24 = objc_msgSend(v23, "canEvaluatePolicy:error:", 1, 0);

            if ((v24 & 1) != 0)
            {
              if ((v20 & 1) != 0)
              {
                v40 = (void *)MEMORY[0x24BE72EF0];
                -[POExtensionAgentProcess pendingUserSEPSigningAlgorithm](v12, "pendingUserSEPSigningAlgorithm");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[POExtensionAgentProcess setPendingUserSEPKey:](v12, "setPendingUserSEPKey:", objc_msgSend(v40, "createUserSEPSigningKeyForAlgorithm:userPresence:currentSet:", v26, 1, 1));
                goto LABEL_53;
              }
              if ((v20 & 2) != 0)
              {
                v41 = (void *)MEMORY[0x24BE72EF0];
                -[POExtensionAgentProcess pendingUserSEPSigningAlgorithm](v12, "pendingUserSEPSigningAlgorithm");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[POExtensionAgentProcess setPendingUserSEPKey:](v12, "setPendingUserSEPKey:", objc_msgSend(v41, "createUserSEPSigningKeyForAlgorithm:userPresence:currentSet:", v26, 1, 0));
                goto LABEL_53;
              }
LABEL_22:
              v25 = (void *)MEMORY[0x24BE72EF0];
              -[POExtensionAgentProcess pendingUserSEPSigningAlgorithm](v12, "pendingUserSEPSigningAlgorithm");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[POExtensionAgentProcess setPendingUserSEPKey:](v12, "setPendingUserSEPKey:", objc_msgSend(v25, "createUserSEPSigningKeyForAlgorithm:", v26));
LABEL_53:

              v38 = -[POExtensionAgentProcess pendingUserSEPKey](v12, "pendingUserSEPKey");
              goto LABEL_54;
            }
            __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_251();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (v6)
              v6[2](v6, 0, v39);
          }
          else
          {
            __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_247();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (v6)
              v6[2](v6, 0, v39);
          }

        }
        else
        {
          __58__POExtensionAgentProcess_rotateKeyForKeyType_completion___block_invoke_292();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v6[2](v6, 0, v15);
        }

        objc_sync_exit(v12);
LABEL_27:

LABEL_30:
        goto LABEL_31;
      }
      objc_msgSend(v11, "pendingSigningAlgorithm");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (!v34)
      {
        objc_msgSend(v11, "signingAlgorithm");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[POExtensionAgentProcess setPendingSigningAlgorithm:](v12, "setPendingSigningAlgorithm:", v35);
      if (!v34)

      v36 = (void *)MEMORY[0x24BE72EF0];
      -[POExtensionAgentProcess pendingSigningAlgorithm](v12, "pendingSigningAlgorithm");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[POExtensionAgentProcess setPendingSigningKey:](v12, "setPendingSigningKey:", objc_msgSend(v36, "createSEPSigningKeyForAlgorithm:shared:", v37, objc_msgSend(v11, "sharedDeviceKeys")));

      v33 = -[POExtensionAgentProcess pendingSigningKey](v12, "pendingSigningKey");
    }
    v38 = v33;
    goto LABEL_55;
  }
  __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v9);
LABEL_31:

}

id __58__POExtensionAgentProcess_rotateKeyForKeyType_completion___block_invoke_287()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Failed to retrieve device configuration for extension."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

id __58__POExtensionAgentProcess_rotateKeyForKeyType_completion___block_invoke_292()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Invalid key type for rotation."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __58__POExtensionAgentProcess_rotateKeyForKeyType_completion___block_invoke_296()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Missing key for rotation."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)completeRotationKeyForKeyType:(int64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  NSObject *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  POExtensionAgentProcess *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  POExtensionAgentProcess *v32;

  v6 = (void (**)(id, _QWORD, void *))a4;
  PO_LOG_POExtensionAgentProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POExtensionAgentProcess completeRotationKeyForKeyType:completion:].cold.1(a3);

  -[POExtensionAgentProcess addEvent:](self, "addEvent:", CFSTR("completeRotationKeyForKeyType"));
  if (-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
    -[POExtensionAgentProcess bundleIdentiferForXPCConnection:](self, "bundleIdentiferForXPCConnection:", WeakRetained);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      __54__POExtensionAgentProcess_keyProxyEndpointForKeyType___block_invoke();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v6[2](v6, 0, v11);
      goto LABEL_34;
    }
    -[POExtensionAgentProcess configurationManager](self, "configurationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentDeviceConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11 || !-[POExtensionAgentProcess isCallerCurrentSSOExtension](self, "isCallerCurrentSSOExtension"))
    {
      v32 = v9;
      __68__POExtensionAgentProcess_completeRotationKeyForKeyType_completion___block_invoke_305();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v6[2](v6, 0, v21);

      v12 = v32;
      goto LABEL_33;
    }
    v12 = self;
    objc_sync_enter(v12);
    if (a3 == 11)
    {
      if (!-[POExtensionAgentProcess pendingEncryptionKey](v12, "pendingEncryptionKey"))
        goto LABEL_30;
      -[POExtensionAgentProcess pendingEncryptionAlgorithm](v12, "pendingEncryptionAlgorithm");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        goto LABEL_30;
      objc_msgSend(v11, "setDeviceEncryptionKey:", -[POExtensionAgentProcess pendingEncryptionKey](v12, "pendingEncryptionKey"));
      -[POExtensionAgentProcess pendingEncryptionAlgorithm](v12, "pendingEncryptionAlgorithm");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEncryptionAlgorithm:", v23);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLastEncryptionKeyChange:", v24);

      objc_msgSend(v11, "setPendingEncryptionAlgorithm:", 0);
      -[POExtensionAgentProcess configurationManager](v12, "configurationManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "saveDeviceConfiguration:", v11);

      if ((v26 & 1) != 0)
      {
        -[POExtensionAgentProcess setPendingEncryptionKey:](v12, "setPendingEncryptionKey:", 0);
        -[POExtensionAgentProcess setPendingEncryptionAlgorithm:](v12, "setPendingEncryptionAlgorithm:", 0);
LABEL_29:
        v6[2](v6, 1, 0);
LABEL_32:
        objc_sync_exit(v12);
LABEL_33:

LABEL_34:
        goto LABEL_35;
      }
      __57__POExtensionAgentProcess_resetDeviceKeysWithCompletion___block_invoke_237();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_31;
    }
    else
    {
      if (a3 != 10)
      {
        if (a3 == 3)
        {
          if (-[POExtensionAgentProcess pendingUserSEPKey](v12, "pendingUserSEPKey"))
          {
            -[POExtensionAgentProcess pendingUserSEPSigningAlgorithm](v12, "pendingUserSEPSigningAlgorithm");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              -[POExtensionAgentProcess configurationManager](v12, "configurationManager");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              NSUserName();
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "userConfigurationForUserName:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                objc_msgSend(v16, "setSepKey:", -[POExtensionAgentProcess pendingUserSEPKey](v12, "pendingUserSEPKey"));
                -[POExtensionAgentProcess pendingUserSEPSigningAlgorithm](v12, "pendingUserSEPSigningAlgorithm");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "setSigningAlgorithm:", v17);

                objc_msgSend(v16, "setPendingSigningAlgorithm:", 0);
                -[POExtensionAgentProcess configurationManager](v12, "configurationManager");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                NSUserName();
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v18, "saveUserConfiguration:forUserName:syncToPreboot:", v16, v19, 1);

                if ((v20 & 1) != 0)
                {
                  -[POExtensionAgentProcess setPendingUserSEPKey:](v12, "setPendingUserSEPKey:", 0);
                  -[POExtensionAgentProcess setPendingUserSEPSigningAlgorithm:](v12, "setPendingUserSEPSigningAlgorithm:", 0);
                  v6[2](v6, 1, 0);
LABEL_31:

                  goto LABEL_32;
                }
                __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_255();
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v6[2](v6, 0, v31);
              }
              else
              {
                __67__POExtensionAgentProcess_resetUserSecureEnclaveKeyWithCompletion___block_invoke_247();
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v6[2](v6, 0, v31);
              }

              goto LABEL_31;
            }
          }
        }
LABEL_30:
        __68__POExtensionAgentProcess_completeRotationKeyForKeyType_completion___block_invoke_315();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, 0, v16);
        goto LABEL_31;
      }
      if (!-[POExtensionAgentProcess pendingSigningKey](v12, "pendingSigningKey"))
        goto LABEL_30;
      -[POExtensionAgentProcess pendingSigningAlgorithm](v12, "pendingSigningAlgorithm");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        goto LABEL_30;
      objc_msgSend(v11, "setDeviceSigningKey:", -[POExtensionAgentProcess pendingSigningKey](v12, "pendingSigningKey"));
      -[POExtensionAgentProcess pendingSigningAlgorithm](v12, "pendingSigningAlgorithm");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSigningAlgorithm:", v28);

      objc_msgSend(v11, "setPendingSigningAlgorithm:", 0);
      -[POExtensionAgentProcess configurationManager](v12, "configurationManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "saveDeviceConfiguration:", v11);

      if ((v30 & 1) != 0)
      {
        -[POExtensionAgentProcess setPendingSigningKey:](v12, "setPendingSigningKey:", 0);
        -[POExtensionAgentProcess setPendingSigningAlgorithm:](v12, "setPendingSigningAlgorithm:", 0);
        goto LABEL_29;
      }
      __57__POExtensionAgentProcess_resetDeviceKeysWithCompletion___block_invoke_237();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_31;
    }
    v6[2](v6, 0, v16);
    goto LABEL_31;
  }
  __67__POExtensionAgentProcess_userNeedsReauthenticationWithCompletion___block_invoke();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, 0, v9);
LABEL_35:

}

id __68__POExtensionAgentProcess_completeRotationKeyForKeyType_completion___block_invoke_305()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Failed to retrieve device configuration for extension."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

id __68__POExtensionAgentProcess_completeRotationKeyForKeyType_completion___block_invoke_315()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Invalid key type for rotation completion."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POExtensionAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)addEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[POExtensionAgentProcess _analytics](self, "_analytics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[POExtensionAgentProcess _analytics](self, "_analytics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  else
  {
    -[POExtensionAgentProcess _analytics](self, "_analytics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_24EC10B88, v8);
  }

}

- (void)addEvent:(id)a3 forKeyType:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = (void *)MEMORY[0x24BE72E90];
  v7 = a3;
  objc_msgSend(v6, "stringForKeyType:", a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[POExtensionAgentProcess _analytics](self, "_analytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v10, "intValue") + 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[POExtensionAgentProcess _analytics](self, "_analytics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v8);

  }
  else
  {
    -[POExtensionAgentProcess _analytics](self, "_analytics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_24EC10B88, v8);
  }

}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (POConfigurationManager)configurationManager
{
  return (POConfigurationManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfigurationManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (POAgentAuthenticationProcess)agentProcess
{
  return (POAgentAuthenticationProcess *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAgentProcess:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)keyProxies
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setKeyProxies:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSObject)authenticationObserver
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setAuthenticationObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (id)authenticationCompletion
{
  return objc_getProperty(self, a2, 56, 1);
}

- (void)setAuthenticationCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (SOConfigurationHost)configurationHost
{
  return (SOConfigurationHost *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConfigurationHost:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (POKeychainHelper)keychainHelper
{
  return (POKeychainHelper *)objc_getProperty(self, a2, 72, 1);
}

- (void)setKeychainHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (__SecKey)pendingEncryptionKey
{
  return self->_pendingEncryptionKey;
}

- (void)setPendingEncryptionKey:(__SecKey *)a3
{
  self->_pendingEncryptionKey = a3;
}

- (__SecKey)pendingSigningKey
{
  return self->_pendingSigningKey;
}

- (void)setPendingSigningKey:(__SecKey *)a3
{
  self->_pendingSigningKey = a3;
}

- (__SecKey)pendingUserSEPKey
{
  return self->_pendingUserSEPKey;
}

- (void)setPendingUserSEPKey:(__SecKey *)a3
{
  self->_pendingUserSEPKey = a3;
}

- (NSNumber)pendingEncryptionAlgorithm
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPendingEncryptionAlgorithm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSNumber)pendingSigningAlgorithm
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPendingSigningAlgorithm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSNumber)pendingUserSEPSigningAlgorithm
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPendingUserSEPSigningAlgorithm:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSMutableDictionary)_analytics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)set_analytics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__analytics, 0);
  objc_storeStrong((id *)&self->_pendingUserSEPSigningAlgorithm, 0);
  objc_storeStrong((id *)&self->_pendingSigningAlgorithm, 0);
  objc_storeStrong((id *)&self->_pendingEncryptionAlgorithm, 0);
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_configurationHost, 0);
  objc_storeStrong(&self->_authenticationCompletion, 0);
  objc_storeStrong((id *)&self->_authenticationObserver, 0);
  objc_storeStrong((id *)&self->_keyProxies, 0);
  objc_storeStrong((id *)&self->_agentProcess, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)keyProxyEndpointForKeyType:.cold.1()
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

- (void)identityForKeyType:.cold.1()
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

void __46__POExtensionAgentProcess_identityForKeyType___block_invoke_34_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a2 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_22307D000, a3, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)bundleIdentiferForXPCConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_16(&dword_22307D000, v0, v1, "bundleIdentifier: CPCopyBundleIdentifierAndTeamFromAuditToken(): %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)isCallerCurrentSSOExtension
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

- (void)isDeviceRegisteredWithCompletion:.cold.1()
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

- (void)isUserRegisteredWithCompletion:.cold.1()
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

- (void)registrationTokenWithCompletion:.cold.1()
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

- (void)setRegistrationToken:completion:.cold.1()
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

- (void)ssoTokensWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22307D000, log, OS_LOG_TYPE_DEBUG, "No stored SSO Tokens.", v1, 2u);
}

- (void)ssoTokensWithCompletion:.cold.2()
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

- (void)setSsoTokens:completion:.cold.1()
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

- (void)loginConfigurationWithCompletion:.cold.1()
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

- (void)setLoginConfiguration:(uint64_t)a3 completion:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  objc_begin_catch(a1);
  objc_end_catch();
  __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_145();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    OUTLINED_FUNCTION_13();

  OUTLINED_FUNCTION_15();
}

- (void)setLoginConfiguration:(uint64_t)a3 completion:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  objc_begin_catch(a1);
  objc_end_catch();
  __60__POExtensionAgentProcess_setLoginConfiguration_completion___block_invoke_129();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    OUTLINED_FUNCTION_13();

  OUTLINED_FUNCTION_15();
}

- (void)setLoginConfiguration:completion:.cold.3()
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

- (void)setCertificateData:keyType:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_4_1(&dword_22307D000, v1, v2, "%s keyType = %{public}@ on %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_5_1();
}

- (void)secKeyProxyEndpointForKeyType:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_4_1(&dword_22307D000, v1, v2, "%s keyType = %{public}@ on %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_5_1();
}

- (void)secIdentityProxyEndpointForKeyType:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_14();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_4_1(&dword_22307D000, v1, v2, "%s keyType = %{public}@ on %@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_5_1();
}

- (void)attestKey:clientDataHash:completion:.cold.1()
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

- (void)copyDeviceAttestationCertificateWithCompletion:.cold.1()
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

- (void)userNeedsReauthenticationWithCompletion:.cold.1()
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

- (void)deviceRegistrationsNeedsRepairWithCompletion:.cold.1()
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

- (void)userRegistrationsNeedsRepairWithCompletion:.cold.1()
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

- (void)presentRegistrationViewControllerWithCompletion:.cold.1()
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

- (void)resetDeviceKeysWithCompletion:.cold.1()
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

- (void)resetUserSecureEnclaveKeyWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_16(&dword_22307D000, a2, v4, "Key policy = %{public}@", v5);

}

- (void)resetUserSecureEnclaveKeyWithCompletion:.cold.2()
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

- (void)loginUserNameWithCompletion:.cold.1()
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

- (void)setLoginUserName:completion:.cold.1()
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

- (void)userLoginConfigurationWithCompletion:.cold.1()
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

- (void)setUserLoginConfiguration:completion:.cold.1()
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

- (void)rotateKeyForKeyType:(NSObject *)a3 completion:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_16(&dword_22307D000, a3, (uint64_t)a3, "Key policy = %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_15();
}

- (void)rotateKeyForKeyType:(uint64_t)a1 completion:.cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1(&dword_22307D000, v2, v3, "%s keyType = %{public}@ on %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5_1();
}

- (void)completeRotationKeyForKeyType:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_1(&dword_22307D000, v2, v3, "%s keyType = %{public}@ on %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5_1();
}

@end
