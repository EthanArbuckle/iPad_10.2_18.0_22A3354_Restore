@implementation POAgentProcess

- (POAgentProcess)initWithXPCConnection:(id)a3 authenticationProcess:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PODirectoryServices *v9;
  POKeychainJWKSStorageProvider *v10;
  POAgentProcess *v11;
  POKeyWrap *v12;
  POKeyWrap *keyWrap;
  POKeychainHelper *v14;
  POKeychainHelper *keychainHelper;
  uint64_t v16;
  NSDistributedNotificationCenter *distributedNotificationCenter;
  POAgentProcess *v18;
  id v20;
  objc_super v21;

  v6 = a3;
  v7 = a4;
  PO_LOG_POAgentProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POAgentProcess initWithXPCConnection:authenticationProcess:].cold.1(v6, (uint64_t)self, v8);

  v9 = objc_alloc_init(PODirectoryServices);
  v10 = -[POKeychainJWKSStorageProvider initWithSystem:]([POKeychainJWKSStorageProvider alloc], "initWithSystem:", 0);
  v21.receiver = self;
  v21.super_class = (Class)POAgentProcess;
  v11 = -[POAgentCoreProcess initWithXPCConnection:identifierProvider:jwksStroageProvider:](&v21, sel_initWithXPCConnection_identifierProvider_jwksStroageProvider_, v6, v9, v10);

  if (v11)
  {
    objc_storeWeak((id *)&v11->_xpcConnection, v6);
    objc_storeStrong((id *)&v11->_process, a4);
    objc_storeStrong((id *)&v11->_directoryServices, v9);
    v12 = (POKeyWrap *)objc_alloc_init(MEMORY[0x24BE72ED0]);
    keyWrap = v11->_keyWrap;
    v11->_keyWrap = v12;

    v14 = (POKeychainHelper *)objc_alloc_init(MEMORY[0x24BE72ED8]);
    keychainHelper = v11->_keychainHelper;
    v11->_keychainHelper = v14;

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v16 = objc_claimAutoreleasedReturnValue();
    distributedNotificationCenter = v11->_distributedNotificationCenter;
    v11->_distributedNotificationCenter = (NSDistributedNotificationCenter *)v16;

  }
  if (-[POAgentProcess verifyAgentEntitlement](v11, "verifyAgentEntitlement")
    || -[POAgentProcess verifyLoginUserEntitlement](v11, "verifyLoginUserEntitlement")
    || -[POAgentProcess verifyPasswordChangeEntitlement](v11, "verifyPasswordChangeEntitlement"))
  {
    v18 = v11;
  }
  else
  {
    v20 = __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    v18 = 0;
  }

  return v18;
}

id __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1002, CFSTR("missing required entitlement"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (POAgentProcess)initWithAuthenticationProcess:(id)a3
{
  id v4;
  NSObject *v5;
  POAgentProcess *v6;

  v4 = a3;
  PO_LOG_POAgentProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POAgentProcess initWithAuthenticationProcess:].cold.1((uint64_t)self, v5);

  v6 = -[POAgentProcess initWithXPCConnection:authenticationProcess:](self, "initWithXPCConnection:authenticationProcess:", 0, v4);
  return v6;
}

+ (NSMutableDictionary)retainedContexts
{
  if (retainedContexts_onceToken != -1)
    dispatch_once(&retainedContexts_onceToken, &__block_literal_global_8);
  return (NSMutableDictionary *)(id)retainedContexts_instance;
}

void __34__POAgentProcess_retainedContexts__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)retainedContexts_instance;
  retainedContexts_instance = (uint64_t)v0;

}

- (BOOL)verifyAgentEntitlement
{
  id WeakRetained;
  void *v3;
  BOOL v4;
  NSObject *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  objc_msgSend(WeakRetained, "valueForEntitlement:", CFSTR("com.apple.private.platformsso.agent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
    goto LABEL_6;
  if (verifyAgentEntitlement_sOnce != -1)
    dispatch_once(&verifyAgentEntitlement_sOnce, &__block_literal_global_12);
  if ((verifyAgentEntitlement_agentEntitlement & 1) != 0)
  {
LABEL_6:
    v4 = 1;
  }
  else
  {
    PO_LOG_POAgentProcess();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[POAgentProcess verifyAgentEntitlement].cold.1();

    v4 = 0;
  }

  return v4;
}

void __40__POAgentProcess_verifyAgentEntitlement__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  CFTypeRef v2;
  CFTypeID v3;

  v0 = SecTaskCreateFromSelf(0);
  if (v0)
  {
    v1 = v0;
    v2 = SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.private.platformsso.agent"), 0);
    CFRelease(v1);
    if (v2)
    {
      v3 = CFGetTypeID(v2);
      if (v3 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v2))
      {
        CFRelease(v2);
        verifyAgentEntitlement_agentEntitlement = 1;
      }
      else
      {
        CFRelease(v2);
      }
    }
  }
}

- (BOOL)verifyLoginUserEntitlement
{
  id WeakRetained;
  void *v3;
  BOOL v4;
  NSObject *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  objc_msgSend(WeakRetained, "valueForEntitlement:", CFSTR("com.apple.private.platformsso.loginuser"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    PO_LOG_POAgentProcess();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[POAgentProcess verifyAgentEntitlement].cold.1();

    v4 = 0;
  }

  return v4;
}

- (BOOL)verifyPasswordChangeEntitlement
{
  id WeakRetained;
  void *v3;
  BOOL v4;
  NSObject *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  objc_msgSend(WeakRetained, "valueForEntitlement:", CFSTR("com.apple.private.platformsso.passwordchange"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    PO_LOG_POAgentProcess();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[POAgentProcess verifyAgentEntitlement].cold.1();

    v4 = 0;
  }

  return v4;
}

- (void)connectionInvalidated
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  POAgentProcess *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[POAgentProcess connectionInvalidated]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)getLoginTypeForUser:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, POConfigurationManager *);
  POConfigurationManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  POConfigurationManager *v13;
  id v14;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, POConfigurationManager *))a4;
  if (!-[POAgentProcess verifyAgentEntitlement](self, "verifyAgentEntitlement")
    && !-[POAgentProcess verifyPasswordChangeEntitlement](self, "verifyPasswordChangeEntitlement"))
  {
    __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    v8 = (POConfigurationManager *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v8);
LABEL_18:

    goto LABEL_19;
  }
  if (+[POConfigurationUtil platformSSOEnabled](POConfigurationUtil, "platformSSOEnabled"))
  {
    v8 = -[POConfigurationManager initWithUserName:]([POConfigurationManager alloc], "initWithUserName:", v6);
    PO_LOG_POAgentProcess();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[POAgentProcess getLoginTypeForUser:completion:].cold.1((uint64_t)v6, (uint64_t)self, v9);

    -[POConfigurationManager currentUserConfiguration](v8, "currentUserConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (v7)
        v7[2](v7, objc_msgSend(v10, "loginType"), 0);
    }
    else
    {
      v14 = v6;
      __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20();
      v13 = (POConfigurationManager *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v7[2](v7, 0, v13);

    }
    goto LABEL_18;
  }
  PO_LOG_POAgentProcess();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[POAgentProcess getLoginTypeForUser:completion:].cold.2();

  if (v7)
    v7[2](v7, 0, 0);
LABEL_19:

}

id __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("No user configuration for user."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

- (void)performPasswordLogin:(id)a3 passwordContext:(id)a4 updateLocalAccountPassword:(BOOL)a5 completion:(id)a6
{
  -[POAgentProcess performPasswordLogin:loginUserName:passwordContext:updateLocalAccountPassword:completion:](self, "performPasswordLogin:loginUserName:passwordContext:updateLocalAccountPassword:completion:", a3, 0, a4, a5, a6);
}

- (void)performPasswordLogin:(id)a3 loginUserName:(id)a4 passwordContext:(id)a5 updateLocalAccountPassword:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  POConfigurationManager *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  os_signpost_id_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  POConfigurationManager *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  POAgentProcess *v56;
  id v57;
  id v58;
  id v59;
  os_signpost_id_t v60;
  uint64_t v61;
  uint64_t v62;
  id (*v63)();
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  id (*v68)();
  void *v69;
  id v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  id v74;
  __int16 v75;
  id v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  POAgentProcess *v80;
  uint64_t v81;

  v8 = a6;
  v81 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  PO_LOG_POAgentProcess();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316162;
    v72 = "-[POAgentProcess performPasswordLogin:loginUserName:passwordContext:updateLocalAccountPassword:completion:]";
    v73 = 2114;
    v74 = v12;
    v75 = 2114;
    v76 = v14;
    v77 = 2114;
    v78 = v32;
    v79 = 2112;
    v80 = self;
    _os_log_debug_impl(&dword_22307D000, v16, OS_LOG_TYPE_DEBUG, "%s userName = %{public}@, passwordContext = %{public}@, updateLocalAccountPassword = %{public}@ on %@", buf, 0x34u);

  }
  if (-[POAgentProcess verifyAgentEntitlement](self, "verifyAgentEntitlement"))
  {
    v17 = -[POConfigurationManager initWithUserName:]([POConfigurationManager alloc], "initWithUserName:", v12);
    -[POConfigurationManager currentDeviceConfiguration](v17, "currentDeviceConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[POConfigurationManager currentLoginConfiguration](v17, "currentLoginConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[POConfigurationManager userConfigurationForUserName:](v17, "userConfigurationForUserName:", v12);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v20)
        {
          v47 = (void *)v20;
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA938]), "initWithExternalizedContext:", v14);
          objc_msgSend(MEMORY[0x24BE72EA0], "passwordDataFromContext:error:", v22, 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          if (v48 && objc_msgSend(v48, "length"))
          {
            v45 = v22;
            PO_LOG_POAgentProcess();
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = os_signpost_id_generate(v23);

            PO_LOG_POAgentProcess();
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = v25;
            if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
            {
              *(_WORD *)buf = 0;
              _os_signpost_emit_with_name_impl(&dword_22307D000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PlatformSSO_PasswordAuth", " enableTelemetry=YES ", buf, 2u);
            }
            v42 = v24;

            objc_msgSend(v47, "userLoginConfiguration");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "mergedConfigurationWithUserLoginConfiguration:", v27);
            v46 = objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              v28 = v13;
            }
            else
            {
              objc_msgSend(v47, "userLoginConfiguration");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "loginUserName");
              v33 = objc_claimAutoreleasedReturnValue();
              v34 = (void *)v33;
              if (v33)
                v35 = (void *)v33;
              else
                v35 = v12;
              v28 = v35;

            }
            -[POAgentCoreProcess authenticationProcess](self, "authenticationProcess");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v28;
            objc_msgSend(v36, "createAuthenticationContextUsingLoginConfiguration:deviceConfiguration:userName:", v46, v18, v28);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v37, "setPassword:", v48);
            -[POAgentCoreProcess jwksStorageProvider](self, "jwksStorageProvider");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setJwksStorageProvider:", v38);

            -[POConfigurationManager currentRefreshToken](v17, "currentRefreshToken");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setRefreshToken:", v39);

            -[POAgentCoreProcess authenticationProcess](self, "authenticationProcess");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v49[0] = MEMORY[0x24BDAC760];
            v49[1] = 3221225472;
            v49[2] = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_39;
            v49[3] = &unk_24EC02C68;
            v60 = v42;
            v50 = v47;
            v51 = v17;
            v52 = v12;
            v53 = v37;
            v54 = v18;
            v59 = v15;
            v22 = v45;
            v55 = v45;
            v56 = self;
            v57 = v19;
            v58 = v13;
            v40 = v37;
            objc_msgSend(v41, "performPasswordLoginUsingContext:completion:", v40, v49);

            v30 = (void *)v46;
          }
          else
          {
            v61 = MEMORY[0x24BDAC760];
            v62 = 3221225472;
            v63 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_36;
            v64 = &unk_24EC025A0;
            v65 = v12;
            __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_36();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, uint64_t, void *))v15 + 2))(v15, 2, v29);

            v30 = v65;
          }

          v21 = v47;
        }
        else
        {
          v66 = MEMORY[0x24BDAC760];
          v67 = 3221225472;
          v68 = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_33;
          v69 = &unk_24EC025A0;
          v70 = v12;
          __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_33();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, uint64_t, void *))v15 + 2))(v15, 2, v31);

          v22 = v70;
        }

      }
      else
      {
        __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_29();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, uint64_t, void *))v15 + 2))(v15, 2, v21);
      }

    }
    else
    {
      __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_25();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, void *))v15 + 2))(v15, 2, v19);
    }

  }
  else
  {
    __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    v17 = (POConfigurationManager *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, POConfigurationManager *))v15 + 2))(v15, 2, v17);
  }

}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_25()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("No device configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_29()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("No login configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_33()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("No user configuration for user."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_36()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("no credential for user for login"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

void __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_39(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SecKeyRef v26;
  SecKeyRef v27;
  void *v28;
  char v29;
  id v30;
  id v31;
  uid_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void (*v36)(void);
  id v37;
  void *v38;
  int v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  _QWORD v55[5];
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  PO_LOG_POAgentProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 112);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22307D000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_PasswordAuth", (const char *)&unk_2230CFE32, buf, 2u);
  }

  v12 = (void *)MEMORY[0x24BE72E78];
  objc_msgSend(MEMORY[0x24BE72E90], "stringForLoginType:", objc_msgSend(*(id *)(a1 + 32), "loginType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE72E90], "stringForLoginResult:", a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "analyticsForLoginType:result:", v13, v14);

  if (PO_LOG_PODiagnostics_once != -1)
    dispatch_once(&PO_LOG_PODiagnostics_once, &__block_literal_global_211);
  v15 = (void *)PO_LOG_PODiagnostics_log;
  if (os_log_type_enabled((os_log_t)PO_LOG_PODiagnostics_log, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)MEMORY[0x24BE72E90];
    v17 = v15;
    objc_msgSend(v16, "stringForLoginResult:", a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v61 = v18;
    _os_log_impl(&dword_22307D000, v17, OS_LOG_TYPE_DEFAULT, "Login Result = %{public}@", buf, 0xCu);

  }
  switch(a2)
  {
    case 0:
    case 3:
    case 4:
    case 5:
    case 6:
      goto LABEL_9;
    case 1:
      v20 = *(void **)(a1 + 40);
      v21 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateLoginStateForUserName:state:loginDate:loginType:", v21, 0, v22, objc_msgSend(*(id *)(a1 + 56), "loginType"));

      objc_msgSend(*(id *)(a1 + 40), "currentUserConfiguration");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setState:", 0);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "currentUserConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setLastLoginDate:", v24);

      v26 = SecKeyCopyPublicKey((SecKeyRef)objc_msgSend(*(id *)(a1 + 64), "deviceEncryptionKey"));
      if (!v26)
      {
        __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_43();
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v36 = *(void (**)(void))(*(_QWORD *)(a1 + 104) + 16);
        goto LABEL_19;
      }
      v27 = v26;
      objc_msgSend(MEMORY[0x24BE72EA0], "passwordDataFromContext:error:", *(_QWORD *)(a1 + 72), 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 0;
      v29 = objc_msgSend(MEMORY[0x24BE72EA0], "encryptPendingSSOTokens:usingPublicKey:sharedData:encryptedTokens:", v8, v27, v28, &v59);
      v30 = v59;
      v31 = objc_retainAutorelease(v28);
      memset_s((void *)objc_msgSend(v31, "mutableBytes"), objc_msgSend(v31, "length"), 0, objc_msgSend(v31, "length"));
      if ((v29 & 1) == 0)
      {
        __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_47();
        v37 = (id)objc_claimAutoreleasedReturnValue();
        CFRelease(v27);
LABEL_36:
        (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
        goto LABEL_37;
      }
      CFRelease(v27);
      if ((objc_msgSend(*(id *)(a1 + 40), "saveStashedSSOTokens:forUserName:", v30, *(_QWORD *)(a1 + 48)) & 1) == 0)
      {
        __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_51();
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      v32 = getuid();
      v33 = *(void **)(a1 + 40);
      if (v32 == 92)
      {
        if ((objc_msgSend(*(id *)(a1 + 40), "savePendingSSOTokens:forUserName:", v30, *(_QWORD *)(a1 + 48)) & 1) == 0)
        {
          __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_58();
          v34 = objc_claimAutoreleasedReturnValue();
LABEL_35:
          v37 = (id)v34;
          goto LABEL_36;
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 64), "extensionIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0;
        v39 = objc_msgSend(v33, "setTokens:extensionIdentifier:returningError:", v8, v38, &v58);
        v40 = v58;

        if (!v39)
        {
          v56[0] = MEMORY[0x24BDAC760];
          v56[1] = 3221225472;
          v56[2] = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_55;
          v56[3] = &unk_24EC025A0;
          v57 = v40;
          v37 = v40;
          __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_55((uint64_t)v56);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();

LABEL_37:
          goto LABEL_38;
        }
        objc_msgSend(*(id *)(a1 + 80), "process");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setupTimerForAuthentication");

        objc_msgSend(*(id *)(a1 + 80), "process");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleKerberosMappingForTokens:loginConfiguration:userConfiguration:", v8, *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32));

        objc_msgSend(*(id *)(a1 + 80), "distributedNotificationCenter");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.UserRegistrationStatusDidChange"), 0, 0, 1);

      }
      v44 = *(void **)(a1 + 96);
      if (v44)
      {
        objc_msgSend(*(id *)(a1 + 32), "userLoginConfiguration");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "loginUserName");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v44, "isEqualToString:", v46);

        if ((v47 & 1) == 0)
        {
          v48 = *(_QWORD *)(a1 + 96);
          objc_msgSend(*(id *)(a1 + 40), "currentUserConfiguration");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "userLoginConfiguration");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setLoginUserName:", v48);

        }
      }
      if ((objc_msgSend(*(id *)(a1 + 40), "saveCurrentUserConfigurationAndSyncToPreboot:", 1) & 1) == 0)
      {
        __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_60();
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
      objc_msgSend(*(id *)(a1 + 80), "process");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "handleUserAuthorizationUsing:userName:tokens:configurationManager:", v7, *(_QWORD *)(a1 + 48), v8, *(_QWORD *)(a1 + 40));

      PO_LOG_POAgentProcess();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v52, OS_LOG_TYPE_INFO, "Authentication completed successfully", buf, 2u);
      }

LABEL_31:
      v53 = *(_QWORD *)(a1 + 104);
      if (v53)
        (*(void (**)(uint64_t, uint64_t, _QWORD))(v53 + 16))(v53, 1, 0);
LABEL_39:

      return;
    case 2:
      objc_msgSend(*(id *)(a1 + 40), "currentUserConfiguration");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setState:", 2);

      if ((objc_msgSend(*(id *)(a1 + 40), "saveCurrentUserConfigurationAndSyncToPreboot:", 1) & 1) != 0)
      {
LABEL_9:
        v55[0] = MEMORY[0x24BDAC760];
        v55[1] = 3221225472;
        v55[2] = __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_68;
        v55[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v55[4] = a2;
        __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_68((uint64_t)v55);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();

      }
      else
      {
        __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_64();
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v36 = *(void (**)(void))(*(_QWORD *)(a1 + 104) + 16);
LABEL_19:
        v36();
LABEL_38:

      }
      goto LABEL_39;
    default:
      goto LABEL_31;
  }
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_43()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to get public key for encrypting tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_47()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to encrypt login tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_51()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to stash login tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_55(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to save login tokens"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_58()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save login tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_60()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after login success."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_64()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after permanent failure."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_68(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Login failed"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_68_cold_1((uint64_t)v2, a1, v3);

  return v2;
}

- (void)updateLocalAccountPassword:(id)a3 passwordContextData:(id)a4 completion:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v8 = (objc_class *)MEMORY[0x24BDDA938];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (id)objc_msgSend([v8 alloc], "initWithExternalizedContext:", v10);

  -[POAgentProcess updateLocalAccountPassword:passwordContext:completion:](self, "updateLocalAccountPassword:passwordContext:completion:", v11, v12, v9);
}

- (void)updateLocalAccountPassword:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  void (**v5)(id, uint64_t, _QWORD);
  NSObject *v6;
  uint8_t v7[16];

  v5 = (void (**)(id, uint64_t, _QWORD))a5;
  PO_LOG_POAgentProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_22307D000, v6, OS_LOG_TYPE_INFO, "Checking local account", v7, 2u);
  }

  if (v5)
    v5[2](v5, 3, 0);

}

- (void)verifyPasswordLogin:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  POConfigurationManager *v12;
  void *v13;
  POConfigurationManager *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  POAgentProcess *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PO_LOG_POAgentProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x24BE72EA0], "maskName:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v23 = "-[POAgentProcess verifyPasswordLogin:passwordContext:completion:]";
    v24 = 2114;
    v25 = v18;
    v26 = 2114;
    v27 = v9;
    v28 = 2112;
    v29 = self;
    _os_log_debug_impl(&dword_22307D000, v11, OS_LOG_TYPE_DEBUG, "%s loginUserName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);

  }
  v12 = [POConfigurationManager alloc];
  -[POAgentProcess directoryServices](self, "directoryServices");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[POConfigurationManager initWithUserName:directoryServices:sharedOnly:](v12, "initWithUserName:directoryServices:sharedOnly:", 0, v13, 1);

  -[POConfigurationManager currentDeviceConfiguration](v14, "currentDeviceConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[POConfigurationManager currentLoginConfiguration](v14, "currentLoginConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __65__POAgentProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_75;
      v20[3] = &unk_24EC02C90;
      v21 = v10;
      v19.receiver = self;
      v19.super_class = (Class)POAgentProcess;
      -[POAgentCoreProcess _verifyLogin:passwordContext:smartCardContext:tokenId:deviceConfiguration:loginConfiguration:forAuthorization:completion:](&v19, sel__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion_, v8, v9, 0, 0, v15, v16, 1, v20);
      v17 = v21;
    }
    else
    {
      __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_29();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v17);
    }

  }
  else
  {
    __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_25();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v16);
  }

}

uint64_t __65__POAgentProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_75(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveCredentialForUserName:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  POAgentProcess *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  PO_LOG_POAgentProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315906;
    v14 = "-[POAgentProcess saveCredentialForUserName:passwordContext:completion:]";
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_22307D000, v11, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, passwordContext = %{public}@ on %@", (uint8_t *)&v13, 0x2Au);
  }

  if (-[POAgentProcess verifyAgentEntitlement](self, "verifyAgentEntitlement")
    || -[POAgentProcess verifyLoginUserEntitlement](self, "verifyLoginUserEntitlement"))
  {
    -[POAgentProcess _saveCredentialForUserName:passwordContext:completion:](self, "_saveCredentialForUserName:passwordContext:completion:", v8, v9, v10);
  }
  else
  {
    __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v12);

  }
}

- (void)_saveCredentialForUserName:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  POConfigurationManager *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  POAgentProcess *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  PO_LOG_POAgentProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v28 = "-[POAgentProcess _saveCredentialForUserName:passwordContext:completion:]";
    v29 = 2114;
    v30 = v8;
    v31 = 2114;
    v32 = v9;
    v33 = 2112;
    v34 = self;
    _os_log_debug_impl(&dword_22307D000, v11, OS_LOG_TYPE_DEBUG, "%s userName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);
  }

  v12 = -[POConfigurationManager initWithUserName:]([POConfigurationManager alloc], "initWithUserName:", v8);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA938]), "initWithExternalizedContext:", v9);
  v26 = 0;
  objc_msgSend(MEMORY[0x24BE72EA0], "passwordDataFromContext:error:", v13, &v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v26;
  v16 = v15;
  if (v15)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __72__POAgentProcess__saveCredentialForUserName_passwordContext_completion___block_invoke;
    v24[3] = &unk_24EC025A0;
    v25 = v15;
    __72__POAgentProcess__saveCredentialForUserName_passwordContext_completion___block_invoke((uint64_t)v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v10[2](v10, 0, v17);

  }
  else
  {
    -[POAgentProcess keyWrap](self, "keyWrap");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "wrapBlob:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[POConfigurationManager currentUserConfiguration](v12, "currentUserConfiguration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "set_credential:", v19);

    v21 = objc_retainAutorelease(v14);
    memset_s((void *)objc_msgSend(v21, "mutableBytes"), objc_msgSend(v21, "length"), 0, objc_msgSend(v21, "length"));

    if (-[POConfigurationManager saveCurrentUserConfigurationAndSyncToPreboot:](v12, "saveCurrentUserConfigurationAndSyncToPreboot:", 0))
    {
      if (v10)
        v10[2](v10, 1, 0);
    }
    else
    {
      v23 = v8;
      __72__POAgentProcess__saveCredentialForUserName_passwordContext_completion___block_invoke_82();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v10[2](v10, 0, v22);

    }
  }

}

id __72__POAgentProcess__saveCredentialForUserName_passwordContext_completion___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Credential not found when saving credential for user"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __72__POAgentProcess__saveCredentialForUserName_passwordContext_completion___block_invoke_82()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user credential."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1();

  return v0;
}

- (void)passwordDidChangeForUsername:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  POAgentProcess *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  PO_LOG_POAgentProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315906;
    v14 = "-[POAgentProcess passwordDidChangeForUsername:passwordContext:completion:]";
    v15 = 2114;
    v16 = v8;
    v17 = 2114;
    v18 = v9;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_22307D000, v11, OS_LOG_TYPE_DEFAULT, "%s userName = %{public}@, passwordContext = %{public}@ on %@", (uint8_t *)&v13, 0x2Au);
  }

  if (-[POAgentProcess verifyPasswordChangeEntitlement](self, "verifyPasswordChangeEntitlement"))
  {
    -[POAgentProcess _saveCredentialForUserName:passwordContext:completion:](self, "_saveCredentialForUserName:passwordContext:completion:", v8, v9, v10);
  }
  else
  {
    __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v12);

  }
}

- (void)screenDidUnlockWithCredentialContext:(id)a3 smartCardContext:(id)a4 biometricContext:(id)a5 tokenId:(id)a6 atLogin:(BOOL)a7 tokenUnlock:(BOOL)a8 completion:(id)a9
{
  uint64_t v9;
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, _QWORD);
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void (**v30)(id, _QWORD);
  void *v31;
  uint64_t v32;
  rsize_t v33;
  void *v34;
  rsize_t v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  POAgentProcess *v44;
  void *v45;
  id v46;
  id v47;
  unsigned int v48;
  _BOOL4 v49;
  id v50;
  id v51;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  uid_t v55;
  __int16 v56;
  id v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  POAgentProcess *v63;
  uint64_t v64;

  v9 = a8;
  v10 = a7;
  v64 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = (void (**)(id, _QWORD))a9;
  PO_LOG_POAgentProcess();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v53 = "-[POAgentProcess screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenU"
          "nlock:completion:]";
    v54 = 1026;
    v55 = getuid();
    v56 = 2114;
    v57 = v15;
    v58 = 2114;
    v59 = v16;
    v60 = 2114;
    v61 = v17;
    v62 = 2112;
    v63 = self;
    _os_log_impl(&dword_22307D000, v20, OS_LOG_TYPE_DEFAULT, "%s uid = %{public}d, context = %{public}@, sccontext = %{public}@, bcontext = %{public}@ on %@", buf, 0x3Au);
  }

  if (-[POAgentProcess verifyAgentEntitlement](self, "verifyAgentEntitlement"))
  {
    *(_DWORD *)buf = 0;
    v21 = objc_alloc_init(MEMORY[0x24BDDA938]);
    v48 = v9;
    v49 = v10;
    if (v15)
    {
      v46 = v18;
      v47 = v17;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA938]), "initWithExternalizedContext:userSession:", v15, buf);
      v51 = 0;
      objc_msgSend(MEMORY[0x24BE72EA0], "passwordDataFromContext:error:", v22, &v51);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v51;
      if (v23)
      {
        objc_msgSend(v21, "setCredential:type:", v23, -9);
        v25 = objc_retainAutorelease(v23);
        v44 = self;
        v26 = v15;
        v27 = v16;
        v28 = v21;
        v29 = objc_msgSend(v25, "mutableBytes");
        v30 = v19;
        v31 = v22;
        v32 = objc_msgSend(v25, "length");
        v33 = objc_msgSend(v25, "length");
        v34 = (void *)v29;
        v21 = v28;
        v16 = v27;
        v15 = v26;
        self = v44;
        v35 = v32;
        v22 = v31;
        v19 = v30;
LABEL_11:
        memset_s(v34, v35, 0, v33);
LABEL_19:
        objc_msgSend(v22, "invalidate");

        v18 = v46;
        v17 = v47;
        goto LABEL_20;
      }
      PO_LOG_POAgentProcess();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[POAgentProcess screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenUnlock:completion:].cold.2();
    }
    else
    {
      if (!v16)
      {
        if (!v17)
        {
          v24 = 0;
          goto LABEL_21;
        }
        v24 = 0;
        v22 = v21;
        v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDA938]), "initWithExternalizedContext:userSession:", v17, buf);
LABEL_20:

        v9 = v48;
LABEL_21:
        -[POAgentProcess process](self, "process");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleScreenUnlockWithCredentialContext:tokenId:atLogin:tokenUnlock:", v21, v18, v49, v9);

        v19[2](v19, 0);
        goto LABEL_22;
      }
      v46 = v18;
      v47 = v17;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA938]), "initWithExternalizedContext:userSession:", v16, buf);
      v50 = 0;
      objc_msgSend(MEMORY[0x24BE72EA0], "passwordDataFromContext:error:", v22, &v50);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v50;
      if (v23)
      {
        objc_msgSend(v21, "setCredential:type:", v23, -3);
        v45 = v22;
        v36 = objc_retainAutorelease(v23);
        v37 = objc_msgSend(v36, "mutableBytes");
        v38 = v16;
        v39 = v21;
        v40 = objc_msgSend(v36, "length");
        v41 = v36;
        v22 = v45;
        v33 = objc_msgSend(v41, "length");
        v34 = (void *)v37;
        v35 = v40;
        v21 = v39;
        v16 = v38;
        v15 = 0;
        goto LABEL_11;
      }
      PO_LOG_POAgentProcess();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[POAgentProcess screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenUnlock:completion:].cold.1();
    }

    goto LABEL_19;
  }
  __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
  v24 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, id))v19)[2](v19, v24);
LABEL_22:

}

- (void)retainContextForUserName:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  POAgentProcess *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  PO_LOG_POAgentProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315650;
    v16 = "-[POAgentProcess retainContextForUserName:context:completion:]";
    v17 = 2114;
    v18 = v9;
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_22307D000, v11, OS_LOG_TYPE_DEFAULT, "%s context = %{public}@ on %@", (uint8_t *)&v15, 0x20u);
  }

  if (-[POAgentProcess verifyAgentEntitlement](self, "verifyAgentEntitlement"))
  {
    if (v9)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA938]), "initWithExternalizedContext:", v9);
      objc_msgSend((id)objc_opt_class(), "retainedContexts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v8);

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "retainedContexts");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v8);
    }

    v10[2](v10, 0);
  }
  else
  {
    __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v10)[2](v10, v14);

  }
}

- (void)configurationDidChangeAndRemovedExtension:(id)a3 removed:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  void (**v8)(id, uint64_t, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v6 = a4;
  v12 = a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  if (-[POAgentProcess verifyAgentEntitlement](self, "verifyAgentEntitlement"))
  {
    if (v6)
    {
      -[POAgentProcess process](self, "process");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configurationRemovedForExtension:", v12);

    }
    -[POAgentProcess process](self, "process");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "configurationChanged");

    v8[2](v8, 1, 0);
  }
  else
  {
    __62__POAgentProcess_initWithXPCConnection_authenticationProcess___block_invoke();
    v11 = objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v11);

    v8 = (void (**)(id, uint64_t, _QWORD))v11;
  }

}

- (PODirectoryServices)directoryServices
{
  return (PODirectoryServices *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDirectoryServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (POAgentAuthenticationProcess)process
{
  return (POAgentAuthenticationProcess *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProcess:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (POKeyWrap)keyWrap
{
  return (POKeyWrap *)objc_getProperty(self, a2, 88, 1);
}

- (void)setKeyWrap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (POKeychainHelper)keychainHelper
{
  return (POKeychainHelper *)objc_getProperty(self, a2, 96, 1);
}

- (void)setKeychainHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDistributedNotificationCenter)distributedNotificationCenter
{
  return (NSDistributedNotificationCenter *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDistributedNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributedNotificationCenter, 0);
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_keyWrap, 0);
  objc_storeStrong((id *)&self->_process, 0);
  objc_storeStrong((id *)&self->_directoryServices, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)initWithXPCConnection:(NSObject *)a3 authenticationProcess:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = 136315650;
  v6 = "-[POAgentProcess initWithXPCConnection:authenticationProcess:]";
  v7 = 1026;
  v8 = objc_msgSend(a1, "auditSessionIdentifier");
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_22307D000, a3, OS_LOG_TYPE_DEBUG, "%s asid= %{public}d on %@", (uint8_t *)&v5, 0x1Cu);
}

- (void)initWithAuthenticationProcess:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[POAgentProcess initWithAuthenticationProcess:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_22307D000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)verifyAgentEntitlement
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6_0(&dword_22307D000, v0, v1, "missing required entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)getLoginTypeForUser:(os_log_t)log completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[POAgentProcess getLoginTypeForUser:completion:]";
  v5 = 2114;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_22307D000, log, OS_LOG_TYPE_DEBUG, "%s userName = %{public}@ on %@", (uint8_t *)&v3, 0x20u);
}

- (void)getLoginTypeForUser:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Platform SSO is not configured.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __49__POAgentProcess_getLoginTypeForUser_completion___block_invoke_20_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_2(&dword_22307D000, v0, v1, "%{public}@, %{public}@");
  OUTLINED_FUNCTION_1();
}

void __107__POAgentProcess_performPasswordLogin_loginUserName_passwordContext_updateLocalAccountPassword_completion___block_invoke_68_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a2 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_22307D000, a3, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenUnlock:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "PIN is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)screenDidUnlockWithCredentialContext:smartCardContext:biometricContext:tokenId:atLogin:tokenUnlock:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Password is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
