@implementation POAgentCoreProcess

- (POAgentCoreProcess)initWithXPCConnection:(id)a3 identifierProvider:(id)a4 jwksStroageProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  POAgentCoreProcess *v12;
  POAuthenticationProcess *v13;
  POAuthenticationProcess *authenticationProcess;
  POTokenHelper *v15;
  POTokenHelper *tokenHelper;
  POKeychainHelper *v17;
  POKeychainHelper *keychainHelper;
  POAgentCoreProcess *v19;
  id v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  PO_LOG_POAgentCoreProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[POAgentCoreProcess initWithXPCConnection:identifierProvider:jwksStroageProvider:].cold.1(v8, (uint64_t)self, v11);

  v22.receiver = self;
  v22.super_class = (Class)POAgentCoreProcess;
  v12 = -[POAgentCoreProcess init](&v22, sel_init);
  if (v12)
  {
    v13 = objc_alloc_init(POAuthenticationProcess);
    authenticationProcess = v12->_authenticationProcess;
    v12->_authenticationProcess = v13;

    -[POAuthenticationProcess setWaitForConnectivity:](v12->_authenticationProcess, "setWaitForConnectivity:", 1);
    -[POAuthenticationProcess setTimeoutIntervalForResource:](v12->_authenticationProcess, "setTimeoutIntervalForResource:", 15.0);
    objc_storeWeak((id *)&v12->_xpcConnection, v8);
    objc_storeStrong((id *)&v12->_userIdentifierProvider, a4);
    objc_storeStrong((id *)&v12->_jwksStorageProvider, a5);
    v15 = -[POTokenHelper initWithIdentifierProvider:]([POTokenHelper alloc], "initWithIdentifierProvider:", v12->_userIdentifierProvider);
    tokenHelper = v12->_tokenHelper;
    v12->_tokenHelper = v15;

    v17 = objc_alloc_init(POKeychainHelper);
    keychainHelper = v12->_keychainHelper;
    v12->_keychainHelper = v17;

  }
  if (-[POAgentCoreProcess verifyAgentEntitlement](v12, "verifyAgentEntitlement")
    || -[POAgentCoreProcess verifyLoginUserEntitlement](v12, "verifyLoginUserEntitlement")
    || -[POAgentCoreProcess verifyPasswordChangeEntitlement](v12, "verifyPasswordChangeEntitlement")
    || -[POAgentCoreProcess verifySecurityEntitlement](v12, "verifySecurityEntitlement"))
  {
    v19 = v12;
  }
  else
  {
    v21 = __83__POAgentCoreProcess_initWithXPCConnection_identifierProvider_jwksStroageProvider___block_invoke();
    v19 = 0;
  }

  return v19;
}

id __83__POAgentCoreProcess_initWithXPCConnection_identifierProvider_jwksStroageProvider___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1002, CFSTR("missing required entitlement"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
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
    dispatch_once(&verifyAgentEntitlement_sOnce, &__block_literal_global_8);
  if ((verifyAgentEntitlement_agentEntitlement & 1) != 0)
  {
LABEL_6:
    v4 = 1;
  }
  else
  {
    PO_LOG_POAgentCoreProcess();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[POAgentCoreProcess verifyAgentEntitlement].cold.1();

    v4 = 0;
  }

  return v4;
}

void __44__POAgentCoreProcess_verifyAgentEntitlement__block_invoke()
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

- (BOOL)verifySecurityEntitlement
{
  id WeakRetained;
  void *v3;
  BOOL v4;
  NSObject *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  objc_msgSend(WeakRetained, "valueForEntitlement:", CFSTR("com.apple.private.platformsso.security"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    PO_LOG_POAgentCoreProcess();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[POAgentCoreProcess verifyAgentEntitlement].cold.1();

    v4 = 0;
  }

  return v4;
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
    PO_LOG_POAgentCoreProcess();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[POAgentCoreProcess verifyAgentEntitlement].cold.1();

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
    PO_LOG_POAgentCoreProcess();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[POAgentCoreProcess verifyAgentEntitlement].cold.1();

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
  POAgentCoreProcess *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentCoreProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[POAgentCoreProcess connectionInvalidated]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_24440D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)getLoginTypeForUser:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  POConfigurationCoreManager *v8;
  void *v9;
  POConfigurationCoreManager *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!-[POAgentCoreProcess verifyAgentEntitlement](self, "verifyAgentEntitlement")
    && !-[POAgentCoreProcess verifyPasswordChangeEntitlement](self, "verifyPasswordChangeEntitlement"))
  {
    __83__POAgentCoreProcess_initWithXPCConnection_identifierProvider_jwksStroageProvider___block_invoke();
    v10 = (POConfigurationCoreManager *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);
LABEL_18:

    goto LABEL_19;
  }
  if (+[POCoreConfigurationUtil platformSSOEnabled](POCoreConfigurationUtil, "platformSSOEnabled"))
  {
    v8 = [POConfigurationCoreManager alloc];
    -[POAgentCoreProcess userIdentifierProvider](self, "userIdentifierProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[POConfigurationCoreManager initWithUserName:identifierProvider:sharedOnly:](v8, "initWithUserName:identifierProvider:sharedOnly:", v6, v9, 0);

    PO_LOG_POAgentCoreProcess();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[POAgentCoreProcess getLoginTypeForUser:completion:].cold.1((uint64_t)v6, (uint64_t)self, v11);

    -[POConfigurationCoreManager currentUserConfiguration](v10, "currentUserConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      if (v7)
        v7[2](v7, objc_msgSend(v12, "loginType"), 0);
    }
    else
    {
      v16 = v6;
      __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v7[2](v7, 0, v15);

    }
    goto LABEL_18;
  }
  PO_LOG_POAgentCoreProcess();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[POAgentCoreProcess getLoginTypeForUser:completion:].cold.2();

  if (v7)
    v7[2](v7, 0, 0);
LABEL_19:

}

id __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("No user configuration for user."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1();

  return v0;
}

- (void)verifyPasswordLogin:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  POConfigurationCoreManager *v12;
  void *v13;
  POConfigurationCoreManager *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  POAgentCoreProcess *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PO_LOG_POAgentCoreProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    +[POCredentialUtil maskName:](POCredentialUtil, "maskName:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v30 = "-[POAgentCoreProcess verifyPasswordLogin:passwordContext:completion:]";
    v31 = 2114;
    v32 = v22;
    v33 = 2114;
    v34 = v9;
    v35 = 2112;
    v36 = self;
    _os_log_debug_impl(&dword_24440D000, v11, OS_LOG_TYPE_DEBUG, "%s loginUserName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);

  }
  v12 = [POConfigurationCoreManager alloc];
  -[POAgentCoreProcess userIdentifierProvider](self, "userIdentifierProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[POConfigurationCoreManager initWithUserName:identifierProvider:sharedOnly:](v12, "initWithUserName:identifierProvider:sharedOnly:", 0, v13, 1);

  -[POConfigurationCoreManager currentDeviceConfiguration](v14, "currentDeviceConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[POConfigurationCoreManager currentLoginConfiguration](v14, "currentLoginConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA938]), "initWithExternalizedContext:", v9);
      +[POCredentialUtil passwordDataFromContext:error:](POCredentialUtil, "passwordDataFromContext:error:", v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18 && objc_msgSend(v18, "length"))
      {
        v24[1] = 3221225472;
        v24[2] = __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_33;
        v24[3] = &unk_251500468;
        v24[0] = MEMORY[0x24BDAC760];
        v27[0] = v10;
        v25 = v15;
        v26 = v17;
        LOBYTE(v23) = 1;
        v20 = (id *)v27;
        -[POAgentCoreProcess _verifyLogin:passwordContext:smartCardContext:tokenId:deviceConfiguration:loginConfiguration:forAuthorization:completion:](self, "_verifyLogin:passwordContext:smartCardContext:tokenId:deviceConfiguration:loginConfiguration:forAuthorization:completion:", v8, v9, 0, 0, v25, v16, v23, v24);

        v21 = v25;
      }
      else
      {
        v27[1] = MEMORY[0x24BDAC760];
        v27[2] = 3221225472;
        v27[3] = __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_30;
        v27[4] = &unk_2514FF9D0;
        v20 = &v28;
        v28 = v8;
        __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_30();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v21);
      }

    }
    else
    {
      __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_25();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v17);
    }

  }
  else
  {
    __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, void *))v10 + 2))(v10, 2, v16);
  }

}

id __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("No device configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_25()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("No login configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_30()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("no credential for user for login"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1();

  return v0;
}

void __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_33(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v10;
  id v11;
  SecKeyRef v12;
  SecKeyRef v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;

  v10 = a3;
  v11 = a7;
  if (a2 == 1)
  {
    v12 = SecKeyCopyPublicKey((SecKeyRef)objc_msgSend(*(id *)(a1 + 32), "deviceEncryptionKey"));
    if (v12)
    {
      v13 = v12;
      +[POCredentialUtil passwordDataFromContext:error:](POCredentialUtil, "passwordDataFromContext:error:", *(_QWORD *)(a1 + 40), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v15 = +[POCredentialUtil encryptPendingSSOTokens:usingPublicKey:sharedData:encryptedTokens:](POCredentialUtil, "encryptPendingSSOTokens:usingPublicKey:sharedData:encryptedTokens:", v10, v13, v14, &v19);
      v16 = v19;
      v17 = objc_retainAutorelease(v14);
      memset_s((void *)objc_msgSend(v17, "mutableBytes"), objc_msgSend(v17, "length"), 0, objc_msgSend(v17, "length"));
      if (v15)
      {
        CFRelease(v13);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
      else
      {
        __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_37();
        v18 = objc_claimAutoreleasedReturnValue();
        CFRelease(v13);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        v16 = (id)v18;
      }

    }
    else
    {
      __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_2();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

id __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_2()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to get public key for encrypting tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_37()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to encrypt login tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)verifyPasswordUser:(id)a3 passwordContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  POConfigurationCoreManager *v12;
  void *v13;
  POConfigurationCoreManager *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id *v26;
  _QWORD v27[4];
  POConfigurationCoreManager *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  POAgentCoreProcess *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PO_LOG_POAgentCoreProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    +[POCredentialUtil maskName:](POCredentialUtil, "maskName:", v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v35 = "-[POAgentCoreProcess verifyPasswordUser:passwordContext:completion:]";
    v36 = 2114;
    v37 = v22;
    v38 = 2114;
    v39 = v9;
    v40 = 2112;
    v41 = self;
    _os_log_debug_impl(&dword_24440D000, v11, OS_LOG_TYPE_DEBUG, "%s loginUserName = %{public}@, passwordContext = %{public}@ on %@", buf, 0x2Au);

  }
  v12 = [POConfigurationCoreManager alloc];
  -[POAgentCoreProcess userIdentifierProvider](self, "userIdentifierProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[POConfigurationCoreManager initWithUserName:identifierProvider:sharedOnly:](v12, "initWithUserName:identifierProvider:sharedOnly:", v8, v13, 1);

  -[POConfigurationCoreManager currentDeviceConfiguration](v14, "currentDeviceConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[POConfigurationCoreManager currentLoginConfiguration](v14, "currentLoginConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[POConfigurationCoreManager currentUserConfiguration](v14, "currentUserConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA938]), "initWithExternalizedContext:", v9);
        +[POCredentialUtil passwordDataFromContext:error:](POCredentialUtil, "passwordDataFromContext:error:", v18, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19 && objc_msgSend(v19, "length"))
        {
          objc_msgSend(v17, "userLoginConfiguration");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "loginUserName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v27[1] = 3221225472;
          v27[2] = __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_52;
          v27[3] = &unk_251500490;
          v26 = (id *)v32;
          v27[0] = MEMORY[0x24BDAC760];
          v32[0] = v10;
          v28 = v14;
          v29 = v8;
          v30 = v15;
          v31 = v18;
          LOBYTE(v23) = 1;
          -[POAgentCoreProcess _verifyLogin:passwordContext:smartCardContext:tokenId:deviceConfiguration:loginConfiguration:forAuthorization:completion:](self, "_verifyLogin:passwordContext:smartCardContext:tokenId:deviceConfiguration:loginConfiguration:forAuthorization:completion:", v24, v9, 0, 0, v30, v16, v23, v27);

          v21 = v28;
        }
        else
        {
          v32[1] = MEMORY[0x24BDAC760];
          v32[2] = 3221225472;
          v32[3] = __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_49;
          v32[4] = &unk_2514FF9D0;
          v26 = &v33;
          v33 = v8;
          __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_49();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))v10 + 2))(v10, 2, 0, 0, 0, 0, v21);
        }

      }
      else
      {
        __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_45();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))v10 + 2))(v10, 2, 0, 0, 0, 0, v18);
      }

    }
    else
    {
      __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_25();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))v10 + 2))(v10, 2, 0, 0, 0, 0, v17);
    }

  }
  else
  {
    __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))v10 + 2))(v10, 2, 0, 0, 0, 0, v16);
  }

}

id __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_45()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1004, CFSTR("No user configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_49()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("no credential for user"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1();

  return v0;
}

void __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_52(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  SecKeyRef v21;
  SecKeyRef v22;
  void *v23;
  BOOL v24;
  id v25;
  id v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (a2 == 1)
  {
    v18 = *(void **)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateLoginStateForUserName:state:loginDate:loginType:", v19, 0, v20, 1);

    v21 = SecKeyCopyPublicKey((SecKeyRef)objc_msgSend(*(id *)(a1 + 48), "deviceEncryptionKey"));
    if (v21)
    {
      v22 = v21;
      v33 = v15;
      v34 = v14;
      +[POCredentialUtil passwordDataFromContext:error:](POCredentialUtil, "passwordDataFromContext:error:", *(_QWORD *)(a1 + 56), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v24 = +[POCredentialUtil encryptPendingSSOTokens:usingPublicKey:sharedData:encryptedTokens:](POCredentialUtil, "encryptPendingSSOTokens:usingPublicKey:sharedData:encryptedTokens:", v13, v22, v23, &v35);
      v25 = v35;
      v26 = objc_retainAutorelease(v23);
      memset_s((void *)objc_msgSend(v26, "mutableBytes"), objc_msgSend(v26, "length"), 0, objc_msgSend(v26, "length"));
      if (v24)
      {
        CFRelease(v22);
        v27 = v25;
        if ((objc_msgSend(*(id *)(a1 + 32), "savePendingSSOTokens:forUserName:", v25, *(_QWORD *)(a1 + 40)) & 1) != 0)
        {
          v28 = objc_msgSend(*(id *)(a1 + 32), "saveStashedSSOTokens:forUserName:", v25, *(_QWORD *)(a1 + 40));
          v15 = v33;
          v14 = v34;
          if ((v28 & 1) != 0)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          }
          else
          {
            __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_61();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

          }
          goto LABEL_12;
        }
        __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_57();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

      }
      else
      {
        __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_37();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(v22);
        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

        v27 = v25;
      }
      v15 = v33;
      v14 = v34;
LABEL_12:

      goto LABEL_13;
    }
    __69__POAgentCoreProcess_verifyPasswordLogin_passwordContext_completion___block_invoke_2();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
LABEL_13:

}

id __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_57()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to save login tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

id __68__POAgentCoreProcess_verifyPasswordUser_passwordContext_completion___block_invoke_61()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Failed to stash login tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (void)_verifyLogin:(id)a3 passwordContext:(id)a4 smartCardContext:(id)a5 tokenId:(id)a6 deviceConfiguration:(id)a7 loginConfiguration:(id)a8 forAuthorization:(BOOL)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  POAuthenticationProcess *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  char v38;
  NSObject *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  os_signpost_id_t spid;
  void *spida;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  POAuthenticationProcess *v63;
  id v64;
  os_signpost_id_t v65;
  uint8_t v66[8];
  uint64_t v67;
  uint64_t v68;
  id (*v69)();
  void *v70;
  id v71;
  _QWORD v72[5];
  id v73;
  uint64_t v74;
  int v75;
  _QWORD v76[4];
  POAuthenticationProcess *v77;
  id v78;
  os_signpost_id_t v79;
  uint64_t v80;
  uint64_t v81;
  id (*v82)();
  void *v83;
  id v84;
  _BYTE buf[12];
  __int16 v86;
  void *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  id v91;
  __int16 v92;
  id v93;
  __int16 v94;
  POAgentCoreProcess *v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  PO_LOG_POAgentCoreProcess();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    +[POCredentialUtil maskName:](POCredentialUtil, "maskName:", v16);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "-[POAgentCoreProcess _verifyLogin:passwordContext:smartCardContext:tokenId:deviceConfiguration:"
                         "loginConfiguration:forAuthorization:completion:]";
    v86 = 2114;
    v87 = v48;
    v88 = 2114;
    v89 = v17;
    v90 = 2114;
    v91 = v18;
    v92 = 2114;
    v93 = v19;
    v94 = 2112;
    v95 = self;
    _os_log_debug_impl(&dword_24440D000, v23, OS_LOG_TYPE_DEBUG, "%s loginUserName = %{public}@, passwordContext = %{public}@, smartcardContext = %{public}@, tokenId = %{public}@ on %@", buf, 0x3Eu);

  }
  if (-[POAgentCoreProcess verifyAgentEntitlement](self, "verifyAgentEntitlement"))
  {
    v24 = objc_alloc_init(POAuthenticationProcess);
    if (!v17 || v18)
    {
      if (v18 && v19)
      {
        spida = v16;
        v75 = 0;
        v34 = objc_alloc_init(MEMORY[0x24BDDA938]);
        objc_msgSend(v34, "setInteractionNotAllowed:", 1);
        v74 = 0;
        v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDA938]), "initWithExternalizedContext:userSession:", v18, &v75);
        +[POCredentialUtil passwordDataFromContext:error:](POCredentialUtil, "passwordDataFromContext:error:");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0;
        v53 = v35;
        if (v35)
        {
          v61 = v21;
          v52 = v20;
          objc_msgSend(v34, "setCredential:type:", v35, -3);
          v36 = objc_retainAutorelease(v35);
          memset_s((void *)objc_msgSend(v36, "mutableBytes"), objc_msgSend(v36, "length"), 0, objc_msgSend(v36, "length"));
          *(_QWORD *)buf = 0;
          v72[0] = 0;
          -[POAgentCoreProcess tokenHelper](self, "tokenHelper");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v34;
          v38 = objc_msgSend(v37, "retrieveCertAndKeyForTokenId:context:certificate:privateKey:", v19, v34, v72, buf);

          if ((v38 & 1) != 0)
          {
            PO_LOG_POAgentCoreProcess();
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = os_signpost_id_generate(v39);

            PO_LOG_POAgentCoreProcess();
            v41 = objc_claimAutoreleasedReturnValue();
            v42 = v41;
            if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
            {
              *(_WORD *)v66 = 0;
              _os_signpost_emit_with_name_impl(&dword_24440D000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "PlatformSSO_SmartCardAuth", " enableTelemetry=YES ", v66, 2u);
            }

            v20 = v52;
            -[POAuthenticationProcess createAuthenticationContextUsingLoginConfiguration:deviceConfiguration:userName:](v24, "createAuthenticationContextUsingLoginConfiguration:deviceConfiguration:userName:", v21, v52, spida);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setEmbeddedAssertionSigningKey:", *(_QWORD *)buf);
            objc_msgSend(v43, "setEmbeddedAssertionCertificate:", v72[0]);
            -[POAgentCoreProcess jwksStorageProvider](self, "jwksStorageProvider");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setJwksStorageProvider:", v44);

            objc_msgSend(v43, "addRequiredScope:", CFSTR("profile"));
            if (a9)
            {
              objc_msgSend(v61, "additionalAuthorizationScopes");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "addRequiredScope:", v45);

            }
            v62[0] = MEMORY[0x24BDAC760];
            v62[1] = 3221225472;
            v62[2] = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_85;
            v62[3] = &unk_2515004B8;
            v65 = v40;
            v63 = v24;
            v64 = v22;
            -[POAuthenticationProcess performSmartCardLoginUsingContext:completion:](v63, "performSmartCardLoginUsingContext:completion:", v43, v62);

          }
          else
          {
            v67 = MEMORY[0x24BDAC760];
            v68 = 3221225472;
            v69 = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_82;
            v70 = &unk_2514FF9D0;
            v71 = v19;
            __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_82();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))v22 + 2))(v22, 3, 0, 0, 0, 0, v50);

            v43 = v71;
            v20 = v52;
          }
          v34 = v51;

          v21 = v61;
        }
        else
        {
          v72[1] = MEMORY[0x24BDAC760];
          v72[2] = 3221225472;
          v72[3] = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_79;
          v72[4] = &unk_2514FF9D0;
          v73 = spida;
          __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_79();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))v22 + 2))(v22, 3, 0, 0, 0, 0, v49);

        }
        v47 = v59;

        v16 = spida;
      }
      else
      {
        __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_89();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))v22 + 2))(v22, 2, 0, 0, 0, 0, v47);
      }
    }
    else
    {
      v60 = v21;
      v58 = objc_msgSend(objc_alloc(MEMORY[0x24BDDA938]), "initWithExternalizedContext:", v17);
      +[POCredentialUtil passwordDataFromContext:error:](POCredentialUtil, "passwordDataFromContext:error:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25 && objc_msgSend(v25, "length"))
      {
        v54 = v19;
        PO_LOG_POAgentCoreProcess();
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = os_signpost_id_generate(v27);

        PO_LOG_POAgentCoreProcess();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v29;
        spid = v28;
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_24440D000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "PlatformSSO_PasswordAuth", " enableTelemetry=YES ", buf, 2u);
        }

        -[POAuthenticationProcess createAuthenticationContextUsingLoginConfiguration:deviceConfiguration:userName:](v24, "createAuthenticationContextUsingLoginConfiguration:deviceConfiguration:userName:", v60, v20, v16);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setPassword:", v26);
        -[POAgentCoreProcess jwksStorageProvider](self, "jwksStorageProvider");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setJwksStorageProvider:", v32);

        objc_msgSend(v31, "addRequiredScope:", CFSTR("profile"));
        v19 = v54;
        if (a9)
        {
          objc_msgSend(v60, "additionalAuthorizationScopes");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addRequiredScope:", v33);

        }
        v76[0] = MEMORY[0x24BDAC760];
        v76[1] = 3221225472;
        v76[2] = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_71;
        v76[3] = &unk_2515004B8;
        v79 = spid;
        v77 = v24;
        v78 = v22;
        -[POAuthenticationProcess performPasswordLoginUsingContext:completion:](v77, "performPasswordLoginUsingContext:completion:", v31, v76);

      }
      else
      {
        v80 = MEMORY[0x24BDAC760];
        v81 = 3221225472;
        v82 = __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_66;
        v83 = &unk_2514FF9D0;
        v84 = v16;
        __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_66();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))v22 + 2))(v22, 3, 0, 0, 0, 0, v46);

      }
      v47 = (void *)v58;
      v21 = v60;
    }

  }
  else
  {
    __83__POAgentCoreProcess_initWithXPCConnection_identifierProvider_jwksStroageProvider___block_invoke();
    v24 = (POAuthenticationProcess *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, POAuthenticationProcess *))v22 + 2))(v22, 2, 0, 0, 0, 0, v24);
  }

}

id __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_66()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Missing password credential for user."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_66_cold_1();

  return v0;
}

void __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_71(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  PO_LOG_POAgentCoreProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24440D000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_PasswordAuth", ", buf, 2u);
  }

  +[POConstantCoreUtil stringForLoginType:](POConstantCoreUtil, "stringForLoginType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[POConstantCoreUtil stringForLoginResult:](POConstantCoreUtil, "stringForLoginResult:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[POAnalytics analyticsForLoginType:result:](POAnalytics, "analyticsForLoginType:result:", v12, v13);

  if ((unint64_t)(a2 - 2) >= 5 && a2)
  {
    if (a2 == 1)
    {
      PO_LOG_POAgentCoreProcess();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24440D000, v18, OS_LOG_TYPE_INFO, "Authentication completed successfully", buf, 2u);
      }

      v19 = (void *)a1[4];
      v22 = 0;
      v23 = 0;
      v21 = 0;
      objc_msgSend(v19, "extractGroupsAndSubUsingAuthorizationWithContext:tokens:returningGroups:identifier:refreshToken:", v7, v8, &v23, &v22, &v21);
      v15 = v23;
      v16 = v22;
      v17 = v21;
    }
    else
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
    }
    v20 = a1[5];
    if (v20)
      (*(void (**)(uint64_t, uint64_t, id, id, id, id, _QWORD))(v20 + 16))(v20, 1, v8, v16, v15, v17, 0);
  }
  else
  {
    __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_74();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a2, 0, 0, 0);

    v15 = 0;
    v16 = 0;
    v17 = 0;
  }

}

id __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_74()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Password login failed"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_74_cold_1();

  return v0;
}

id __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_79()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Missing SmartCard credential for user"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_66_cold_1();

  return v0;
}

id __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_82()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1008, CFSTR("Failed to find smartcard."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1();

  return v0;
}

void __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_85(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  PO_LOG_POAgentCoreProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = a1[6];
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_24440D000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_SmartCardAuth", ", buf, 2u);
  }

  +[POConstantCoreUtil stringForLoginType:](POConstantCoreUtil, "stringForLoginType:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[POConstantCoreUtil stringForLoginResult:](POConstantCoreUtil, "stringForLoginResult:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[POAnalytics analyticsForLoginType:result:](POAnalytics, "analyticsForLoginType:result:", v12, v13);

  if ((unint64_t)(a2 - 2) >= 5 && a2)
  {
    if (a2 == 1)
    {
      PO_LOG_POAgentCoreProcess();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24440D000, v18, OS_LOG_TYPE_INFO, "Authentication completed successfully", buf, 2u);
      }

      v19 = (void *)a1[4];
      v22 = 0;
      v23 = 0;
      v21 = 0;
      objc_msgSend(v19, "extractGroupsAndSubUsingAuthorizationWithContext:tokens:returningGroups:identifier:refreshToken:", v7, v8, &v23, &v22, &v21);
      v15 = v23;
      v16 = v22;
      v17 = v21;
    }
    else
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
    }
    v20 = a1[5];
    if (v20)
      (*(void (**)(uint64_t, uint64_t, id, id, id, id, _QWORD))(v20 + 16))(v20, 1, v8, v16, v15, v17, 0);
  }
  else
  {
    __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_86();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a2, 0, 0, 0);

    v15 = 0;
    v16 = 0;
    v17 = 0;
  }

}

id __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_86()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("SmartCard login failed"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_74_cold_1();

  return v0;
}

id __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_89()
{
  void *v0;
  NSObject *v1;

  +[POError errorWithCode:description:](POError, "errorWithCode:description:", -1001, CFSTR("Invalid login request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentCoreProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __24__POJWT_initWithString___block_invoke_cold_1();

  return v0;
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (POAuthenticationProcess)authenticationProcess
{
  return (POAuthenticationProcess *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAuthenticationProcess:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (POUserIdentifierProvider)userIdentifierProvider
{
  return (POUserIdentifierProvider *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserIdentifierProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (POJWKSStorageProvider)jwksStorageProvider
{
  return (POJWKSStorageProvider *)objc_getProperty(self, a2, 40, 1);
}

- (void)setJwksStorageProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (POTokenHelper)tokenHelper
{
  return (POTokenHelper *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTokenHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (POKeychainHelper)keychainHelper
{
  return (POKeychainHelper *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeychainHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_tokenHelper, 0);
  objc_storeStrong((id *)&self->_jwksStorageProvider, 0);
  objc_storeStrong((id *)&self->_userIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_authenticationProcess, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)initWithXPCConnection:(void *)a1 identifierProvider:(uint64_t)a2 jwksStroageProvider:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
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
  v6 = "-[POAgentCoreProcess initWithXPCConnection:identifierProvider:jwksStroageProvider:]";
  v7 = 1026;
  v8 = objc_msgSend(a1, "auditSessionIdentifier");
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_24440D000, a3, OS_LOG_TYPE_DEBUG, "%s asid= %{public}d on %@", (uint8_t *)&v5, 0x1Cu);
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

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_24440D000, v0, v1, "missing required entitlement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
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
  v4 = "-[POAgentCoreProcess getLoginTypeForUser:completion:]";
  v5 = 2114;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_24440D000, log, OS_LOG_TYPE_DEBUG, "%s userName = %{public}@ on %@", (uint8_t *)&v3, 0x20u);
}

- (void)getLoginTypeForUser:completion:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_24440D000, v0, OS_LOG_TYPE_DEBUG, "Platform SSO is not configured.", v1, 2u);
  OUTLINED_FUNCTION_2_2();
}

void __53__POAgentCoreProcess_getLoginTypeForUser_completion___block_invoke_18_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_14(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_0(&dword_24440D000, v0, (uint64_t)v0, "%{public}@, %{public}@", v1);
  OUTLINED_FUNCTION_1();
}

void __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_66_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  v5 = *MEMORY[0x24BDAC8D0];
  +[POCredentialUtil maskName:](POCredentialUtil, "maskName:", *(_QWORD *)(v1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_24440D000, v0, v3, "%{public}@, %{public}@", v4);

  OUTLINED_FUNCTION_3();
}

void __143__POAgentCoreProcess__verifyLogin_passwordContext_smartCardContext_tokenId_deviceConfiguration_loginConfiguration_forAuthorization_completion___block_invoke_74_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_6();
  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(v1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_24440D000, v0, v3, "%{public}@, %{public}@", v4);

  OUTLINED_FUNCTION_3();
}

@end
