@implementation POLoginManager

- (POLoginManager)init
{
  return -[POLoginManager initWithUid:](self, "initWithUid:", 0);
}

- (POLoginManager)initWithUid:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  POLoginManager *v6;
  POServiceLoginManagerConnection *v7;
  POServiceLoginManagerConnection *serviceConnection;
  objc_super v10;

  v3 = *(_QWORD *)&a3;
  PO_LOG_POLoginManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POLoginManager initWithUid:].cold.1((uint64_t)self, v3, v5);

  v10.receiver = self;
  v10.super_class = (Class)POLoginManager;
  v6 = -[POLoginManager init](&v10, sel_init);
  if (v6)
  {
    v7 = -[POServiceLoginManagerConnection initWithUid:]([POServiceLoginManagerConnection alloc], "initWithUid:", v3);
    serviceConnection = v6->_serviceConnection;
    v6->_serviceConnection = v7;

  }
  return v6;
}

- (void)invalidate
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

- (BOOL)isDeviceRegistered
{
  NSObject *v3;
  POServiceLoginManagerConnection *serviceConnection;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  PO_LOG_POLoginManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POLoginManager isDeviceRegistered].cold.1();

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__POLoginManager_isDeviceRegistered__block_invoke;
  v7[3] = &unk_24EC02550;
  v7[4] = &v8;
  -[POServiceLoginManagerConnection isDeviceRegisteredWithCompletion:](serviceConnection, "isDeviceRegisteredWithCompletion:", v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __36__POLoginManager_isDeviceRegistered__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isUserRegistered
{
  NSObject *v3;
  POServiceLoginManagerConnection *serviceConnection;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  PO_LOG_POLoginManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POLoginManager isUserRegistered].cold.1();

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__POLoginManager_isUserRegistered__block_invoke;
  v7[3] = &unk_24EC02550;
  v7[4] = &v8;
  -[POServiceLoginManagerConnection isUserRegisteredWithCompletion:](serviceConnection, "isUserRegisteredWithCompletion:", v7);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __34__POLoginManager_isUserRegistered__block_invoke(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (NSString)registrationToken
{
  NSObject *v3;
  POServiceLoginManagerConnection *serviceConnection;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  _QWORD v14[5];
  id v15;

  PO_LOG_POLoginManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POLoginManager registrationToken].cold.1();

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__0;
  v14[4] = __Block_byref_object_dispose__0;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__POLoginManager_registrationToken__block_invoke;
  v7[3] = &unk_24EC02848;
  v7[4] = &v8;
  v7[5] = v14;
  -[POServiceLoginManagerConnection registrationTokenWithCompletion:](serviceConnection, "registrationTokenWithCompletion:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
  return (NSString *)v5;
}

void __35__POLoginManager_registrationToken__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (NSString)loginUserName
{
  POServiceLoginManagerConnection *serviceConnection;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  _QWORD v12[5];
  id v13;

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__0;
  v12[4] = __Block_byref_object_dispose__0;
  v13 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  serviceConnection = self->_serviceConnection;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__POLoginManager_loginUserName__block_invoke;
  v5[3] = &unk_24EC02848;
  v5[4] = &v6;
  v5[5] = v12;
  -[POServiceLoginManagerConnection loginUserNameWithCompletion:](serviceConnection, "loginUserNameWithCompletion:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(v12, 8);
  return (NSString *)v3;
}

void __31__POLoginManager_loginUserName__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)setLoginUserName:(id)a3
{
  id v4;
  POServiceLoginManagerConnection *serviceConnection;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[6];
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__0;
  v11[4] = __Block_byref_object_dispose__0;
  v12 = 0;
  serviceConnection = self->_serviceConnection;
  v6 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __35__POLoginManager_setLoginUserName___block_invoke;
  v10[3] = &unk_24EC02870;
  v10[4] = &v13;
  v10[5] = v11;
  -[POServiceLoginManagerConnection setLoginUserName:completion:](serviceConnection, "setLoginUserName:completion:", v4, v10);
  if (*((_BYTE *)v14 + 24))
  {
    PO_LOG_POLoginManager();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[POLoginManager setLoginUserName:].cold.1();

  }
  else
  {
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __35__POLoginManager_setLoginUserName___block_invoke_2;
    v9[3] = &unk_24EC02898;
    v9[4] = v11;
    v8 = __35__POLoginManager_setLoginUserName___block_invoke_2((uint64_t)v9);
  }
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(&v13, 8);
}

void __35__POLoginManager_setLoginUserName___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

id __35__POLoginManager_setLoginUserName___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("failed to save loginUserName"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (POUserLoginConfiguration)userLoginConfiguration
{
  NSObject *v3;
  POServiceLoginManagerConnection *serviceConnection;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  _QWORD v14[5];
  id v15;

  PO_LOG_POLoginManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POLoginManager userLoginConfiguration].cold.1();

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__0;
  v14[4] = __Block_byref_object_dispose__0;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__POLoginManager_userLoginConfiguration__block_invoke;
  v7[3] = &unk_24EC028C0;
  v7[4] = &v8;
  v7[5] = v14;
  -[POServiceLoginManagerConnection userLoginConfigurationWithCompletion:](serviceConnection, "userLoginConfigurationWithCompletion:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
  return (POUserLoginConfiguration *)v5;
}

void __40__POLoginManager_userLoginConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)saveUserLoginConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  POServiceLoginManagerConnection *serviceConnection;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  serviceConnection = self->_serviceConnection;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __51__POLoginManager_saveUserLoginConfiguration_error___block_invoke;
  v16[3] = &unk_24EC02870;
  v16[4] = &v23;
  v16[5] = &v17;
  -[POServiceLoginManagerConnection setUserLoginConfiguration:completion:](serviceConnection, "setUserLoginConfiguration:completion:", v6, v16);
  v8 = *((unsigned __int8 *)v24 + 24);
  if (*((_BYTE *)v24 + 24))
  {
    PO_LOG_POLoginManager();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[POLoginManager saveUserLoginConfiguration:error:].cold.1();
  }
  else
  {
    v10 = v18[5];
    v27 = *MEMORY[0x24BDD1398];
    v28[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1540];
    getASAuthorizationErrorDomain();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 1000, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    PO_LOG_POLoginManager();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[POLoginManager saveUserLoginConfiguration:error:].cold.2();

    if (a4)
      *a4 = objc_retainAutorelease(v13);

  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v8 != 0;
}

void __51__POLoginManager_saveUserLoginConfiguration_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (NSDictionary)ssoTokens
{
  NSObject *v3;
  POServiceLoginManagerConnection *serviceConnection;
  uint64_t v5;
  __SecKey *v6;
  __SecKey *v7;
  CFDataRef v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[5];
  CFErrorRef error;
  _QWORD v23[5];
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[5];
  id v32;

  PO_LOG_POLoginManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POLoginManager ssoTokens].cold.1();

  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__0;
  v31[4] = __Block_byref_object_dispose__0;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  v30 = 0;
  serviceConnection = self->_serviceConnection;
  v5 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __27__POLoginManager_ssoTokens__block_invoke;
  v24[3] = &unk_24EC028E8;
  v24[4] = &v25;
  v24[5] = v31;
  -[POServiceLoginManagerConnection ssoTokensWithCompletion:](serviceConnection, "ssoTokensWithCompletion:", v24);
  if (!v26[5])
    goto LABEL_12;
  v6 = -[POLoginManager copyKeyForKeyType:](self, "copyKeyForKeyType:", 11);
  v7 = v6;
  if (!v6)
  {
    v14 = __27__POLoginManager_ssoTokens__block_invoke_2();
LABEL_12:
    v13 = 0;
    goto LABEL_17;
  }
  if (!SecKeyIsAlgorithmSupported(v6, kSecKeyOperationTypeDecrypt, (SecKeyAlgorithm)*MEMORY[0x24BDE92E8]))
  {
    CFRelease(v7);
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __27__POLoginManager_ssoTokens__block_invoke_12;
    v23[3] = &unk_24EC02898;
    v23[4] = v31;
    v15 = __27__POLoginManager_ssoTokens__block_invoke_12((uint64_t)v23);
    goto LABEL_12;
  }
  error = 0;
  v8 = SecKeyCreateDecryptedData(v7, (SecKeyAlgorithm)*MEMORY[0x24BDE92F8], (CFDataRef)v26[5], &error);
  CFRelease(v7);
  if (error || !v8)
  {
    v21[0] = v5;
    v21[1] = 3221225472;
    v21[2] = __27__POLoginManager_ssoTokens__block_invoke_15;
    v21[3] = &__block_descriptor_40_e14___NSError_8__0l;
    v21[4] = error;
    v16 = __27__POLoginManager_ssoTokens__block_invoke_15((uint64_t)v21);
    v13 = 0;
  }
  else
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 16, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    v11 = v10;
    if (v10)
    {
      v18[0] = v5;
      v18[1] = 3221225472;
      v18[2] = __27__POLoginManager_ssoTokens__block_invoke_19;
      v18[3] = &unk_24EC025A0;
      v19 = v10;
      v12 = __27__POLoginManager_ssoTokens__block_invoke_19((uint64_t)v18);

      v13 = 0;
    }
    else
    {
      v13 = v9;
    }

  }
LABEL_17:
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(v31, 8);
  return (NSDictionary *)v13;
}

void __27__POLoginManager_ssoTokens__block_invoke(uint64_t a1, void *a2, void *a3)
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

id __27__POLoginManager_ssoTokens__block_invoke_2()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1006, CFSTR("missing device encryption key for retrieving sso tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __27__POLoginManager_ssoTokens__block_invoke_12(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("encryption algorithm not supported for retrieving sso tokens"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __27__POLoginManager_ssoTokens__block_invoke_15(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("failed to decrypt tokens for retrieving sso tokens"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POLoginManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v2;
}

id __27__POLoginManager_ssoTokens__block_invoke_19(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("failed to parse sso tokens for retrieving sso tokens"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (void)setSsoTokens:(id)a3
{
  id v4;
  NSObject *v5;
  const __CFData *v6;
  id v7;
  void *v8;
  __SecKey *v9;
  __SecKey *v10;
  __SecKey *v11;
  __SecKey *v12;
  CFDataRef v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  CFErrorRef error;
  _QWORD v23[4];
  id v24;
  id v25;

  v4 = a3;
  PO_LOG_POLoginManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POLoginManager setSsoTokens:].cold.2();

  if (v4)
  {
    if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v4) & 1) != 0)
    {
      v25 = 0;
      objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v4, 1, &v25);
      v6 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v7 = v25;
      v8 = v7;
      if (v7 || !v6)
      {
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __31__POLoginManager_setSsoTokens___block_invoke_30;
        v23[3] = &unk_24EC025A0;
        v24 = v7;
        v16 = __31__POLoginManager_setSsoTokens___block_invoke_30((uint64_t)v23);

      }
      else
      {
        v9 = -[POLoginManager copyKeyForKeyType:](self, "copyKeyForKeyType:", 11);
        if (v9)
        {
          v10 = v9;
          v11 = SecKeyCopyPublicKey(v9);
          if (v11)
          {
            v12 = v11;
            if (SecKeyIsAlgorithmSupported(v11, kSecKeyOperationTypeEncrypt, (SecKeyAlgorithm)*MEMORY[0x24BDE92E8]))
            {
              error = 0;
              v13 = SecKeyCreateEncryptedData(v12, (SecKeyAlgorithm)*MEMORY[0x24BDE92F8], v6, &error);
              CFRelease(v12);
              if (error || !v13)
              {
                v21[0] = MEMORY[0x24BDAC760];
                v21[1] = 3221225472;
                v21[2] = __31__POLoginManager_setSsoTokens___block_invoke_45;
                v21[3] = &__block_descriptor_40_e14___NSError_8__0l;
                v21[4] = error;
                v20 = __31__POLoginManager_setSsoTokens___block_invoke_45((uint64_t)v21);
              }
              else
              {
                -[POServiceLoginManagerConnection setSsoTokens:completion:](self->_serviceConnection, "setSsoTokens:completion:", v13, &__block_literal_global_49);
              }

            }
            else
            {
              CFRelease(v12);
              v19 = __31__POLoginManager_setSsoTokens___block_invoke_41();
            }
          }
          else
          {
            CFRelease(v10);
            v18 = __31__POLoginManager_setSsoTokens___block_invoke_37();
          }
        }
        else
        {
          v17 = __31__POLoginManager_setSsoTokens___block_invoke_33();
        }
      }

    }
    else
    {
      v15 = __31__POLoginManager_setSsoTokens___block_invoke_26();
    }
  }
  else
  {
    PO_LOG_POLoginManager();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[POLoginManager setSsoTokens:].cold.1();

    -[POServiceLoginManagerConnection setSsoTokens:completion:](self->_serviceConnection, "setSsoTokens:completion:", 0, &__block_literal_global_22);
  }

}

void __31__POLoginManager_setSsoTokens___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  NSObject *v9;

  v4 = a3;
  v5 = v4;
  if (a2)
  {
    PO_LOG_POLoginManager();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __31__POLoginManager_setSsoTokens___block_invoke_cold_1();
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __31__POLoginManager_setSsoTokens___block_invoke_23;
    v8[3] = &unk_24EC025A0;
    v9 = v4;
    v7 = __31__POLoginManager_setSsoTokens___block_invoke_23((uint64_t)v8);
    v6 = v9;
  }

}

id __31__POLoginManager_setSsoTokens___block_invoke_23(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("failed to remove sso tokens"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __31__POLoginManager_setSsoTokens___block_invoke_26()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("failed to validate JSON when saving sso tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __31__POLoginManager_setSsoTokens___block_invoke_30(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("failed to encode tokens to JSON when saving sso tokens"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __31__POLoginManager_setSsoTokens___block_invoke_33()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1006, CFSTR("missing device encryption key for saving sso tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __31__POLoginManager_setSsoTokens___block_invoke_37()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1006, CFSTR("missing device encryption public key for saving sso tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __31__POLoginManager_setSsoTokens___block_invoke_41()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("encryption algorithm not supported for saving sso tokens"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __31__POLoginManager_setSsoTokens___block_invoke_45(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, v1, CFSTR("failed to encrypt tokens for saving sso tokens"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POLoginManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v2;
}

void __31__POLoginManager_setSsoTokens___block_invoke_48(uint64_t a1, int a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  NSObject *v9;

  v4 = a3;
  v5 = v4;
  if (a2)
  {
    PO_LOG_POLoginManager();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __31__POLoginManager_setSsoTokens___block_invoke_48_cold_1();
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __31__POLoginManager_setSsoTokens___block_invoke_50;
    v8[3] = &unk_24EC025A0;
    v9 = v4;
    v7 = __31__POLoginManager_setSsoTokens___block_invoke_50((uint64_t)v8);
    v6 = v9;
  }

}

id __31__POLoginManager_setSsoTokens___block_invoke_50(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("failed to save tokens for saving sso tokens"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (POLoginConfiguration)loginConfiguration
{
  NSObject *v3;
  POServiceLoginManagerConnection *serviceConnection;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  _QWORD v14[5];
  id v15;

  PO_LOG_POLoginManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POLoginManager loginConfiguration].cold.1();

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy__0;
  v14[4] = __Block_byref_object_dispose__0;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__0;
  v12 = __Block_byref_object_dispose__0;
  v13 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__POLoginManager_loginConfiguration__block_invoke;
  v7[3] = &unk_24EC02970;
  v7[4] = &v8;
  v7[5] = v14;
  -[POServiceLoginManagerConnection loginConfigurationWithCompletion:](serviceConnection, "loginConfigurationWithCompletion:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
  return (POLoginConfiguration *)v5;
}

void __36__POLoginManager_loginConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)saveLoginConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  POServiceLoginManagerConnection *serviceConnection;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  v22 = 0;
  serviceConnection = self->_serviceConnection;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __47__POLoginManager_saveLoginConfiguration_error___block_invoke;
  v16[3] = &unk_24EC02870;
  v16[4] = &v23;
  v16[5] = &v17;
  -[POServiceLoginManagerConnection setLoginConfiguration:completion:](serviceConnection, "setLoginConfiguration:completion:", v6, v16);
  v8 = *((unsigned __int8 *)v24 + 24);
  if (*((_BYTE *)v24 + 24))
  {
    PO_LOG_POLoginManager();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[POLoginManager saveLoginConfiguration:error:].cold.1();
  }
  else
  {
    v10 = v18[5];
    v27 = *MEMORY[0x24BDD1398];
    v28[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1540];
    getASAuthorizationErrorDomain();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 1000, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    PO_LOG_POLoginManager();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[POLoginManager saveLoginConfiguration:error:].cold.2();

    if (a4)
      *a4 = objc_retainAutorelease(v13);

  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v8 != 0;
}

void __47__POLoginManager_saveLoginConfiguration_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)saveCertificate:(__SecCertificate *)a3 keyType:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  POServiceLoginManagerConnection *serviceConnection;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;

  PO_LOG_POLoginManager();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POLoginManager saveCertificate:keyType:].cold.1();

  objc_msgSend(MEMORY[0x24BE72EF0], "dataForCertificate:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__0;
    v12[4] = __Block_byref_object_dispose__0;
    v13 = 0;
    serviceConnection = self->_serviceConnection;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__POLoginManager_saveCertificate_keyType___block_invoke_58;
    v11[3] = &unk_24EC02550;
    v11[4] = v12;
    -[POServiceLoginManagerConnection setCertificateData:keyType:completion:](serviceConnection, "setCertificateData:keyType:completion:", v8, a4, v11);
    _Block_object_dispose(v12, 8);

  }
  else
  {
    v10 = __42__POLoginManager_saveCertificate_keyType___block_invoke();
  }

}

id __42__POLoginManager_saveCertificate_keyType___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("error with SecCertificateCopyData for saving certificate"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

void __42__POLoginManager_saveCertificate_keyType___block_invoke_58(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (__SecKey)copyKeyForKeyType:(int64_t)a3
{
  NSObject *v5;
  POServiceLoginManagerConnection *serviceConnection;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  __SecKey *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id obj;
  _QWORD v16[5];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  PO_LOG_POLoginManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POLoginManager copyKeyForKeyType:].cold.1();

  v24 = 0;
  v25 = (id *)&v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  serviceConnection = self->_serviceConnection;
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __36__POLoginManager_copyKeyForKeyType___block_invoke;
  v17[3] = &unk_24EC02998;
  v17[4] = &v18;
  v17[5] = &v24;
  -[POServiceLoginManagerConnection secKeyProxyEndpointForKeyType:completion:](serviceConnection, "secKeyProxyEndpointForKeyType:completion:", a3, v17);
  v8 = v19[5];
  if (!v8)
  {
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __36__POLoginManager_copyKeyForKeyType___block_invoke_2;
    v16[3] = &unk_24EC02898;
    v16[4] = &v24;
    v12 = __36__POLoginManager_copyKeyForKeyType___block_invoke_2((uint64_t)v16);
    goto LABEL_7;
  }
  v9 = v25;
  obj = v25[5];
  v10 = (__SecKey *)objc_msgSend(MEMORY[0x24BDE84F0], "createKeyFromEndpoint:error:", v8, &obj);
  objc_storeStrong(v9 + 5, obj);
  if (!v10)
  {
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __36__POLoginManager_copyKeyForKeyType___block_invoke_63;
    v14[3] = &unk_24EC02898;
    v14[4] = &v24;
    v11 = __36__POLoginManager_copyKeyForKeyType___block_invoke_63((uint64_t)v14);
LABEL_7:
    v10 = 0;
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v10;
}

void __36__POLoginManager_copyKeyForKeyType___block_invoke(uint64_t a1, void *a2, void *a3)
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

id __36__POLoginManager_copyKeyForKeyType___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("failed to retrieve SecKeyProxyEndpoint for key"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __36__POLoginManager_copyKeyForKeyType___block_invoke_63(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("failed to create SecKey from SecKeyProxyEndpoint for key"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (__SecIdentity)copyIdentityForKeyType:(int64_t)a3
{
  NSObject *v5;
  POServiceLoginManagerConnection *serviceConnection;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  __SecIdentity *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id obj;
  _QWORD v16[5];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  PO_LOG_POLoginManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POLoginManager copyIdentityForKeyType:].cold.1();

  v24 = 0;
  v25 = (id *)&v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  serviceConnection = self->_serviceConnection;
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __41__POLoginManager_copyIdentityForKeyType___block_invoke;
  v17[3] = &unk_24EC02998;
  v17[4] = &v18;
  v17[5] = &v24;
  -[POServiceLoginManagerConnection secIdentityProxyEndpointForKeyType:completion:](serviceConnection, "secIdentityProxyEndpointForKeyType:completion:", a3, v17);
  v8 = v19[5];
  if (!v8)
  {
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __41__POLoginManager_copyIdentityForKeyType___block_invoke_2;
    v16[3] = &unk_24EC02898;
    v16[4] = &v24;
    v12 = __41__POLoginManager_copyIdentityForKeyType___block_invoke_2((uint64_t)v16);
    goto LABEL_7;
  }
  v9 = v25;
  obj = v25[5];
  v10 = (__SecIdentity *)objc_msgSend(MEMORY[0x24BDE84F0], "createIdentityFromEndpoint:error:", v8, &obj);
  objc_storeStrong(v9 + 5, obj);
  if (!v10)
  {
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __41__POLoginManager_copyIdentityForKeyType___block_invoke_68;
    v14[3] = &unk_24EC02898;
    v14[4] = &v24;
    v11 = __41__POLoginManager_copyIdentityForKeyType___block_invoke_68((uint64_t)v14);
LABEL_7:
    v10 = 0;
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v10;
}

void __41__POLoginManager_copyIdentityForKeyType___block_invoke(uint64_t a1, void *a2, void *a3)
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

id __41__POLoginManager_copyIdentityForKeyType___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("failed to retrieve SecKeyProxyEndpoint for identity"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __41__POLoginManager_copyIdentityForKeyType___block_invoke_68(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("failed to create SecIdentityRef from SecKeyProxyEndpoint for key"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (void)attestKey:(int64_t)a3 clientDataHash:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  POServiceLoginManagerConnection *serviceConnection;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  PO_LOG_POLoginManager();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[POLoginManager attestKey:clientDataHash:completion:].cold.1();

  serviceConnection = self->_serviceConnection;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __54__POLoginManager_attestKey_clientDataHash_completion___block_invoke;
  v13[3] = &unk_24EC029C0;
  v14 = v8;
  v12 = v8;
  -[POServiceLoginManagerConnection attestKey:clientDataHash:completion:](serviceConnection, "attestKey:clientDataHash:completion:", a3, v9, v13);

}

uint64_t __54__POLoginManager_attestKey_clientDataHash_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (__SecCertificate)copyDeviceAttestationCertificate
{
  NSObject *v3;
  POServiceLoginManagerConnection *serviceConnection;
  __SecCertificate *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;

  PO_LOG_POLoginManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POLoginManager copyDeviceAttestationCertificate].cold.1();

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__0;
  v12[4] = __Block_byref_object_dispose__0;
  v13 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  serviceConnection = self->_serviceConnection;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__POLoginManager_copyDeviceAttestationCertificate__block_invoke;
  v7[3] = &unk_24EC029E8;
  v7[4] = &v8;
  v7[5] = v12;
  -[POServiceLoginManagerConnection copyDeviceAttestationCertificateWithCompletion:](serviceConnection, "copyDeviceAttestationCertificateWithCompletion:", v7);
  v5 = (__SecCertificate *)v9[3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v12, 8);

  return v5;
}

void __50__POLoginManager_copyDeviceAttestationCertificate__block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)userNeedsReauthentication
{
  -[POLoginManager userNeedsReauthenticationWithCompletion:](self, "userNeedsReauthenticationWithCompletion:", &__block_literal_global_73);
}

- (void)userNeedsReauthenticationWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  POServiceLoginManagerConnection *serviceConnection;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  PO_LOG_POLoginManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POLoginManager userNeedsReauthenticationWithCompletion:].cold.1();

  -[POLoginManager hostExtensionContext](self, "hostExtensionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[POLoginManager hostExtensionContext](self, "hostExtensionContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[POLoginManager requestIdentifier](self, "requestIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __58__POLoginManager_userNeedsReauthenticationWithCompletion___block_invoke_2;
    v13[3] = &unk_24EC02A58;
    v13[4] = self;
    v14 = v4;
    v9 = v4;
    objc_msgSend(v7, "requestReauthenticationWithRequestIdentifier:completion:", v8, v13);

    v10 = v14;
  }
  else
  {
    serviceConnection = self->_serviceConnection;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __58__POLoginManager_userNeedsReauthenticationWithCompletion___block_invoke;
    v15[3] = &unk_24EC02A30;
    v16 = v4;
    v12 = v4;
    -[POServiceLoginManagerConnection userNeedsReauthenticationWithCompletion:](serviceConnection, "userNeedsReauthenticationWithCompletion:", v15);
    v10 = v16;
  }

}

uint64_t __58__POLoginManager_userNeedsReauthenticationWithCompletion___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
    v4 = 0;
  else
    v4 = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

void __58__POLoginManager_userNeedsReauthenticationWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  switch(a2)
  {
    case 0:
      v8 = *(void **)(a1 + 40);
      v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __58__POLoginManager_userNeedsReauthenticationWithCompletion___block_invoke_3;
      v13[3] = &unk_24EC02A30;
      v14 = v8;
      objc_msgSend(v9, "userNeedsReauthenticationWithCompletion:", v13);

      return;
    case 1:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      return;
    case 2:
    case 3:
    case 4:
      v3 = (void *)MEMORY[0x24BDD1540];
      getASAuthorizationErrorDomain();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v3;
      v6 = v4;
      v7 = 1004;
      goto LABEL_8;
    case 5:
      v10 = (void *)MEMORY[0x24BDD1540];
      getASAuthorizationErrorDomain();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v10;
      v6 = v4;
      v7 = 1000;
      goto LABEL_8;
    case 6:
      v11 = (void *)MEMORY[0x24BDD1540];
      getASAuthorizationErrorDomain();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v11;
      v6 = v4;
      v7 = 1001;
LABEL_8:
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, v7, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v12 = 0;
      break;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __58__POLoginManager_userNeedsReauthenticationWithCompletion___block_invoke_3(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
    v4 = 0;
  else
    v4 = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (void)deviceRegistrationsNeedsRepair
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

- (void)userRegistrationsNeedsRepair
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

- (void)presentRegistrationViewControllerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  POServiceLoginManagerConnection *serviceConnection;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  PO_LOG_POLoginManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POLoginManager presentRegistrationViewControllerWithCompletion:].cold.1();

  serviceConnection = self->_serviceConnection;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__POLoginManager_presentRegistrationViewControllerWithCompletion___block_invoke;
  v8[3] = &unk_24EC02A30;
  v9 = v4;
  v7 = v4;
  -[POServiceLoginManagerConnection presentRegistrationViewControllerWithCompletion:](serviceConnection, "presentRegistrationViewControllerWithCompletion:", v8);

}

uint64_t __66__POLoginManager_presentRegistrationViewControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)resetKeys
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

- (void)resetDeviceKeys
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

- (void)resetUserSecureEnclaveKey
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

- (__SecKey)rotateKeyForKeyType:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  POServiceLoginManagerConnection *serviceConnection;
  uint64_t v8;
  id *v9;
  __SecKey *v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id obj;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  PO_LOG_POLoginManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POLoginManager rotateKeyForKeyType:].cold.1();

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__0;
  v22 = __Block_byref_object_dispose__0;
  v23 = 0;
  v6 = MEMORY[0x24BDAC760];
  serviceConnection = self->_serviceConnection;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __38__POLoginManager_rotateKeyForKeyType___block_invoke;
  v17[3] = &unk_24EC02B40;
  v17[4] = &v24;
  -[POServiceLoginManagerConnection rotateKeyForKeyType:completion:](serviceConnection, "rotateKeyForKeyType:completion:", a3, v17);
  v8 = v25[5];
  if (!v8)
  {
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __38__POLoginManager_rotateKeyForKeyType___block_invoke_2;
    v16[3] = &unk_24EC02898;
    v16[4] = &v18;
    v12 = __38__POLoginManager_rotateKeyForKeyType___block_invoke_2((uint64_t)v16);
    goto LABEL_7;
  }
  v9 = (id *)(v19 + 5);
  obj = (id)v19[5];
  v10 = (__SecKey *)objc_msgSend(MEMORY[0x24BDE84F0], "createKeyFromEndpoint:error:", v8, &obj);
  objc_storeStrong(v9, obj);
  if (!v10)
  {
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __38__POLoginManager_rotateKeyForKeyType___block_invoke_83;
    v14[3] = &unk_24EC02898;
    v14[4] = &v18;
    v11 = __38__POLoginManager_rotateKeyForKeyType___block_invoke_83((uint64_t)v14);
LABEL_7:
    v10 = 0;
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v10;
}

void __38__POLoginManager_rotateKeyForKeyType___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id __38__POLoginManager_rotateKeyForKeyType___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("failed to retrieve SecKeyProxyEndpoint for new key"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __38__POLoginManager_rotateKeyForKeyType___block_invoke_83(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("failed to create SecKey from SecKeyProxyEndpoint for new key"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (void)completeRotationKeyForKeyType:(int64_t)a3
{
  NSObject *v5;

  PO_LOG_POLoginManager();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POLoginManager completeRotationKeyForKeyType:].cold.1();

  -[POServiceLoginManagerConnection completeRotationKeyForKeyType:completion:](self->_serviceConnection, "completeRotationKeyForKeyType:completion:", a3, &__block_literal_global_86);
}

void __48__POLoginManager_completeRotationKeyForKeyType___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  NSObject *v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (a2)
  {
    PO_LOG_POLoginManager();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22307D000, v6, OS_LOG_TYPE_INFO, "rotation completed successfully.", buf, 2u);
    }
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __48__POLoginManager_completeRotationKeyForKeyType___block_invoke_87;
    v8[3] = &unk_24EC025A0;
    v9 = v4;
    v7 = __48__POLoginManager_completeRotationKeyForKeyType___block_invoke_87((uint64_t)v8);
    v6 = v9;
  }

}

id __48__POLoginManager_completeRotationKeyForKeyType___block_invoke_87(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("failed to complete key rotation."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POLoginManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POLoginManager)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)POLoginManager;
  return -[POLoginManager init](&v4, sel_init, a3);
}

- (NSDictionary)extensionData
{
  return self->_extensionData;
}

- (void)setExtensionData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (__SecCertificate)deviceAttestationCertificate
{
  return self->_deviceAttestationCertificate;
}

- (SOHostExtensionContextProtocol)hostExtensionContext
{
  return (SOHostExtensionContextProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHostExtensionContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_hostExtensionContext, 0);
  objc_storeStrong((id *)&self->_extensionData, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

- (void)initWithUid:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[POLoginManager initWithUid:]";
  v5 = 1026;
  v6 = a2;
  v7 = 2112;
  v8 = a1;
  _os_log_debug_impl(&dword_22307D000, log, OS_LOG_TYPE_DEBUG, "%s uid = %{public}d on %@", (uint8_t *)&v3, 0x1Cu);
}

- (void)isDeviceRegistered
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

- (void)isUserRegistered
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

- (void)registrationToken
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

- (void)setLoginUserName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "loginUserName saved", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)userLoginConfiguration
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

- (void)saveUserLoginConfiguration:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "userLoginConfiguration saved", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)saveUserLoginConfiguration:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22307D000, v0, v1, "failed to save userLoginConfiguration: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)ssoTokens
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

- (void)setSsoTokens:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "removing sso tokens", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setSsoTokens:.cold.2()
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

void __31__POLoginManager_setSsoTokens___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "sso tokens removed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __31__POLoginManager_setSsoTokens___block_invoke_48_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "tokens saved", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
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

- (void)saveLoginConfiguration:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "loginConfiguration saved", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)saveLoginConfiguration:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_22307D000, v0, v1, "failed to save loginConfiguration: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)saveCertificate:keyType:.cold.1()
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

- (void)copyKeyForKeyType:.cold.1()
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

- (void)copyIdentityForKeyType:.cold.1()
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

- (void)copyDeviceAttestationCertificate
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

- (void)rotateKeyForKeyType:.cold.1()
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

- (void)completeRotationKeyForKeyType:.cold.1()
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
