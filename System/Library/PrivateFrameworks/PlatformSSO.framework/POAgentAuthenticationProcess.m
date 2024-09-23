@implementation POAgentAuthenticationProcess

- (POAgentAuthenticationProcess)initWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  POAgentAuthenticationProcess *v6;
  POAgentAuthenticationProcess *v7;
  POAuthenticationProcess *v8;
  POAuthenticationProcess *authenticationProcess;
  uint64_t v10;
  POConfigurationManager *configurationManager;
  POKeyBag *v12;
  POKeyBag *keyBag;
  POKeyWrap *v14;
  POKeyWrap *keyWrap;
  uint64_t v16;
  SOConfigurationHost *configurationHost;
  uint64_t v18;
  SOExtensionManager *extensionManager;
  POKerberosHelper *v20;
  POKerberosHelper *kerberosHelper;
  uint64_t v22;
  UNUserNotificationCenter *userNotificationCenter;
  uint64_t v24;
  NSString *userName;
  uint64_t v26;
  NSNotificationCenter *notificationCenter;
  uint64_t v28;
  NSDistributedNotificationCenter *distributedNotificationCenter;
  PODirectoryServices *v30;
  PODirectoryServices *directoryServices;
  uint64_t v32;
  POTokenHelper *tokenHelper;
  POKeychainHelper *v34;
  POKeychainHelper *keychainHelper;
  POKeychainJWKSStorageProvider *v36;
  POJWKSStorageProvider *jwksStorageProvider;
  dispatch_queue_t v38;
  OS_dispatch_queue *loginQueue;
  objc_super v41;

  v4 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess initWithDelegate:].cold.1();

  v41.receiver = self;
  v41.super_class = (Class)POAgentAuthenticationProcess;
  v6 = -[POAgentAuthenticationProcess init](&v41, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_kerberosDelegate, v4);
    v8 = (POAuthenticationProcess *)objc_alloc_init(MEMORY[0x24BE72E80]);
    authenticationProcess = v7->_authenticationProcess;
    v7->_authenticationProcess = v8;

    -[POAuthenticationProcess setWaitForConnectivity:](v7->_authenticationProcess, "setWaitForConnectivity:", 1);
    +[POConfigurationManager sharedInstance](POConfigurationManager, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    configurationManager = v7->_configurationManager;
    v7->_configurationManager = (POConfigurationManager *)v10;

    v12 = (POKeyBag *)objc_alloc_init(MEMORY[0x24BE72EC8]);
    keyBag = v7->_keyBag;
    v7->_keyBag = v12;

    -[POKeyBag startObservingKeyBagLockStatusChanges](v7->_keyBag, "startObservingKeyBagLockStatusChanges");
    v14 = (POKeyWrap *)objc_alloc_init(MEMORY[0x24BE72ED0]);
    keyWrap = v7->_keyWrap;
    v7->_keyWrap = v14;

    objc_msgSend(MEMORY[0x24BE04368], "defaultManager");
    v16 = objc_claimAutoreleasedReturnValue();
    configurationHost = v7->_configurationHost;
    v7->_configurationHost = (SOConfigurationHost *)v16;

    objc_msgSend(MEMORY[0x24BE04370], "sharedInstance");
    v18 = objc_claimAutoreleasedReturnValue();
    extensionManager = v7->_extensionManager;
    v7->_extensionManager = (SOExtensionManager *)v18;

    v20 = objc_alloc_init(POKerberosHelper);
    kerberosHelper = v7->_kerberosHelper;
    v7->_kerberosHelper = v20;

    v7->_registrationFailed = 0;
    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.PlatformSSO.notifications"));
    userNotificationCenter = v7->_userNotificationCenter;
    v7->_userNotificationCenter = (UNUserNotificationCenter *)v22;

    -[UNUserNotificationCenter setDelegate:](v7->_userNotificationCenter, "setDelegate:", v7);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v7->_userNotificationCenter, "setWantsNotificationResponsesDelivered");
    -[POAgentAuthenticationProcess setupNotificationCategories](v7, "setupNotificationCategories");
    NSUserName();
    v24 = objc_claimAutoreleasedReturnValue();
    userName = v7->_userName;
    v7->_userName = (NSString *)v24;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v26 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v7->_notificationCenter;
    v7->_notificationCenter = (NSNotificationCenter *)v26;

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v28 = objc_claimAutoreleasedReturnValue();
    distributedNotificationCenter = v7->_distributedNotificationCenter;
    v7->_distributedNotificationCenter = (NSDistributedNotificationCenter *)v28;

    v30 = objc_alloc_init(PODirectoryServices);
    directoryServices = v7->_directoryServices;
    v7->_directoryServices = v30;

    *(_WORD *)&v7->_platformSSOActive = 0;
    v7->_shouldRunConfigurationChangeWhenUnlocked = 0;
    v32 = objc_msgSend(objc_alloc(MEMORY[0x24BE72EF8]), "initWithIdentifierProvider:", v7->_directoryServices);
    tokenHelper = v7->_tokenHelper;
    v7->_tokenHelper = (POTokenHelper *)v32;

    v34 = (POKeychainHelper *)objc_alloc_init(MEMORY[0x24BE72ED8]);
    keychainHelper = v7->_keychainHelper;
    v7->_keychainHelper = v34;

    v36 = -[POKeychainJWKSStorageProvider initWithSystem:]([POKeychainJWKSStorageProvider alloc], "initWithSystem:", 0);
    jwksStorageProvider = v7->_jwksStorageProvider;
    v7->_jwksStorageProvider = (POJWKSStorageProvider *)v36;

    v38 = dispatch_queue_create("com.apple.AppSSOAgent.PlatformSSO.login", 0);
    loginQueue = v7->_loginQueue;
    v7->_loginQueue = (OS_dispatch_queue *)v38;

    *(_WORD *)&v7->_screenUnlocked = 0;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[POAgentAuthenticationProcess authenticationTimer](self, "authenticationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[POAgentAuthenticationProcess authenticationTimer](self, "authenticationTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[POAgentAuthenticationProcess setAuthenticationTimer:](self, "setAuthenticationTimer:", 0);
  }
  -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)POAgentAuthenticationProcess;
  -[POAgentAuthenticationProcess dealloc](&v6, sel_dealloc);
}

- (int64_t)registrationState
{
  void *v2;
  int64_t v3;

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return v3;
}

- (void)handleScreenUnlockWithCredentialContext:(id)a3 tokenId:(id)a4 atLogin:(BOOL)a5 tokenUnlock:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v10;
  id v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BOOL8 v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  char v31;
  id location;
  _QWORD v33[4];
  id v34;
  id v35;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  PO_LOG_POAgentAuthenticationProcess();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess handleScreenUnlockWithCredentialContext:tokenId:atLogin:tokenUnlock:].cold.3();

  v13 = objc_msgSend(v10, "isCredentialSet:", -3);
  if (v13)
  {
    PO_LOG_POAgentAuthenticationProcess();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[POAgentAuthenticationProcess handleScreenUnlockWithCredentialContext:tokenId:atLogin:tokenUnlock:].cold.1();
    goto LABEL_9;
  }
  if (objc_msgSend(v10, "isCredentialSet:", -9))
  {
    PO_LOG_POAgentAuthenticationProcess();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[POAgentAuthenticationProcess handleScreenUnlockWithCredentialContext:tokenId:atLogin:tokenUnlock:].cold.2();
LABEL_9:
    v15 = v13 ^ 1;

    if (!(_DWORD)v7)
      goto LABEL_10;
LABEL_13:
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager", __PAIR64__(v7, v6), v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentDeviceConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "extensionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v20 = objc_msgSend(v16, "setTokens:extensionIdentifier:returningError:", 0, v19, &v35);
    v21 = v35;

    if ((v20 & 1) == 0)
    {
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __100__POAgentAuthenticationProcess_handleScreenUnlockWithCredentialContext_tokenId_atLogin_tokenUnlock___block_invoke;
      v33[3] = &unk_24EC025A0;
      v34 = v21;
      v22 = __100__POAgentAuthenticationProcess_handleScreenUnlockWithCredentialContext_tokenId_atLogin_tokenUnlock___block_invoke((uint64_t)v33);

    }
    v11 = v27;
    v6 = v26;
    v7 = HIDWORD(v26);
    if (v13)
      goto LABEL_11;
    goto LABEL_16;
  }
  v15 = 0;
  if ((_DWORD)v7)
    goto LABEL_13;
LABEL_10:
  if (v13)
  {
LABEL_11:
    -[POAgentAuthenticationProcess doUnlockForSmartCardWithCredentialContext:tokenId:atLogin:](self, "doUnlockForSmartCardWithCredentialContext:tokenId:atLogin:", v10, v11, v7);
    goto LABEL_26;
  }
LABEL_16:
  if (v15)
  {
    if (v6
      && (-[POAgentAuthenticationProcess configurationManager](self, "configurationManager"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v23, "currentUserConfiguration"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "loginType"),
          v24,
          v23,
          v25 == 1))
    {
      if ((_DWORD)v7)
        -[POAgentAuthenticationProcess doUnlockForTokenLoginWithCredentialContext:atLogin:](self, "doUnlockForTokenLoginWithCredentialContext:atLogin:", v10, 1);
      else
        -[POAgentAuthenticationProcess doUnlockForTokenUnlockWithCredentialContext:atLogin:](self, "doUnlockForTokenUnlockWithCredentialContext:atLogin:", v10, 0);
    }
    else
    {
      -[POAgentAuthenticationProcess doUnlockForPasswordWithCredentialContext:atLogin:](self, "doUnlockForPasswordWithCredentialContext:atLogin:", v10, v7);
    }
  }
  else if ((_DWORD)v7)
  {
    -[POAgentAuthenticationProcess doUnlockWithEmptyCredentialContext:atLogin:](self, "doUnlockWithEmptyCredentialContext:atLogin:", 0, 1);
  }
  else
  {
    objc_initWeak(&location, self);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __100__POAgentAuthenticationProcess_handleScreenUnlockWithCredentialContext_tokenId_atLogin_tokenUnlock___block_invoke_51;
    v28[3] = &unk_24EC02E30;
    objc_copyWeak(&v30, &location);
    v29 = v10;
    v31 = 0;
    -[POAgentAuthenticationProcess waitForScreenUnlockithCompletion:](self, "waitForScreenUnlockithCompletion:", v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
LABEL_26:

}

id __100__POAgentAuthenticationProcess_handleScreenUnlockWithCredentialContext_tokenId_atLogin_tokenUnlock___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to clear SSO tokens after login."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

void __100__POAgentAuthenticationProcess_handleScreenUnlockWithCredentialContext_tokenId_atLogin_tokenUnlock___block_invoke_51(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "doUnlockWithEmptyCredentialContext:atLogin:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)doUnlockForSmartCardWithCredentialContext:(id)a3 tokenId:(id)a4 atLogin:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  PO_LOG_POAgentAuthenticationProcess();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess doUnlockForSmartCardWithCredentialContext:tokenId:atLogin:].cold.1();

  -[POAgentAuthenticationProcess loginQueue](self, "loginQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __90__POAgentAuthenticationProcess_doUnlockForSmartCardWithCredentialContext_tokenId_atLogin___block_invoke;
  v14[3] = &unk_24EC02E58;
  v17 = a5;
  v14[4] = self;
  v15 = v9;
  v16 = v8;
  v12 = v8;
  v13 = v9;
  dispatch_async(v11, v14);

}

void __90__POAgentAuthenticationProcess_doUnlockForSmartCardWithCredentialContext_tokenId_atLogin___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "keyBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[2] = __90__POAgentAuthenticationProcess_doUnlockForSmartCardWithCredentialContext_tokenId_atLogin___block_invoke_2;
  v4[3] = &unk_24EC02E58;
  v7 = *(_BYTE *)(a1 + 56);
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[1] = 3221225472;
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "waitForKeyBagUnlockWithCompletion:", v4);

}

uint64_t __90__POAgentAuthenticationProcess_doUnlockForSmartCardWithCredentialContext_tokenId_atLogin___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "handleRemovingSSOTokens");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handlePendingSSOTokensWithSharedData:", v3);

  objc_msgSend(*(id *)(a1 + 32), "performLoginForCurrentUserWithPasswordContext:tokenId:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "handleUnfinishedTGTExchanges");
  result = objc_msgSend(*(id *)(a1 + 32), "shouldRunConfigurationChangeWhenUnlocked");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "handleConfigurationChanged:", 0);
  return result;
}

- (void)doUnlockForPasswordWithCredentialContext:(id)a3 atLogin:(BOOL)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v6 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess doUnlockForPasswordWithCredentialContext:atLogin:].cold.1();

  -[POAgentAuthenticationProcess loginQueue](self, "loginQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke;
  block[3] = &unk_24EC02E80;
  v12 = a4;
  block[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, block);

}

void __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("com.apple.PlatformSSO.passwordchanged");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removePendingNotificationRequestsWithIdentifiers:", v3);

  objc_msgSend(*(id *)(a1 + 32), "userNotificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("com.apple.PlatformSSO.passwordchanged");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDeliveredNotificationsWithIdentifiers:", v5);

  objc_msgSend(*(id *)(a1 + 32), "keyBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke_2;
  v8[3] = &unk_24EC02E80;
  v10 = *(_BYTE *)(a1 + 48);
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v6, "waitForKeyBagUnlockWithCompletion:", v8);

}

void __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "handleRemovingSSOTokens");
  v2 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  objc_msgSend(MEMORY[0x24BE72EA0], "passwordDataFromContext:error:", v2, &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "keyWrap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wrapBlob:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configurationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentUserConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "set_credential:", v6);

    objc_msgSend(*(id *)(a1 + 32), "configurationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v9, "saveCurrentUserConfigurationAndSyncToPreboot:", 0);

    if ((v6 & 1) == 0)
      v10 = __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke_3();
    objc_msgSend(*(id *)(a1 + 32), "handlePendingSSOTokensWithSharedData:", v3);
    v11 = objc_retainAutorelease(v3);
    memset_s((void *)objc_msgSend(v11, "mutableBytes"), objc_msgSend(v11, "length"), 0, objc_msgSend(v11, "length"));
  }
  else
  {
    v12 = __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke_57();
  }
  objc_msgSend(*(id *)(a1 + 32), "performLoginForCurrentUserWithPasswordContext:tokenId:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "handleUnfinishedTGTExchanges");
  if (objc_msgSend(*(id *)(a1 + 32), "shouldRunConfigurationChangeWhenUnlocked"))
    objc_msgSend(*(id *)(a1 + 32), "handleConfigurationChanged:", 0);

}

id __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke_3()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after password unlock."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __81__POAgentAuthenticationProcess_doUnlockForPasswordWithCredentialContext_atLogin___block_invoke_57()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to find credential after password unlock."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)doUnlockForTokenUnlockWithCredentialContext:(id)a3 atLogin:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess doUnlockForTokenUnlockWithCredentialContext:atLogin:].cold.1();

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__POAgentAuthenticationProcess_doUnlockForTokenUnlockWithCredentialContext_atLogin___block_invoke;
  v9[3] = &unk_24EC02E30;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  v12 = a4;
  -[POAgentAuthenticationProcess waitForScreenUnlockithCompletion:](self, "waitForScreenUnlockithCompletion:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __84__POAgentAuthenticationProcess_doUnlockForTokenUnlockWithCredentialContext_atLogin___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_doUnlockForTokenWithCredentialContext:atLogin:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)doUnlockForTokenLoginWithCredentialContext:(id)a3 atLogin:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess doUnlockForTokenLoginWithCredentialContext:atLogin:].cold.1();

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __83__POAgentAuthenticationProcess_doUnlockForTokenLoginWithCredentialContext_atLogin___block_invoke;
  v9[3] = &unk_24EC02E30;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  v12 = a4;
  -[POAgentAuthenticationProcess waitForShieldLoweredWithCompletion:](self, "waitForShieldLoweredWithCompletion:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __83__POAgentAuthenticationProcess_doUnlockForTokenLoginWithCredentialContext_atLogin___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_doUnlockForTokenWithCredentialContext:atLogin:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)_doUnlockForTokenWithCredentialContext:(id)a3 atLogin:(BOOL)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v6 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess _doUnlockForTokenWithCredentialContext:atLogin:].cold.1();

  -[POAgentAuthenticationProcess loginQueue](self, "loginQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke;
  block[3] = &unk_24EC02E80;
  v12 = a4;
  block[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, block);

}

void __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  char v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "userNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = CFSTR("com.apple.PlatformSSO.passwordchanged");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removePendingNotificationRequestsWithIdentifiers:", v3);

  objc_msgSend(*(id *)(a1 + 32), "userNotificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("com.apple.PlatformSSO.passwordchanged");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDeliveredNotificationsWithIdentifiers:", v5);

  objc_msgSend(*(id *)(a1 + 32), "keyBag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_2;
  v8[3] = &unk_24EC02E80;
  v10 = *(_BYTE *)(a1 + 48);
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v6, "waitForKeyBagUnlockWithCompletion:", v8);

}

void __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  POAgentProcess *v7;
  dispatch_semaphore_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  dispatch_semaphore_t v17;
  id v18;

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "handleRemovingSSOTokens");
  v2 = *(_QWORD *)(a1 + 40);
  v18 = 0;
  objc_msgSend(MEMORY[0x24BE72EA0], "passwordDataFromContext:error:", v2, &v18);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v18;
  if (!v3)
    v5 = __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_3();
  PO_LOG_POAgentAuthenticationProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_2_cold_1();

  v7 = -[POAgentProcess initWithAuthenticationProcess:]([POAgentProcess alloc], "initWithAuthenticationProcess:", *(_QWORD *)(a1 + 32));
  v8 = dispatch_semaphore_create(0);
  NSUserName();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_65;
  v14[3] = &unk_24EC02EA8;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v14[4] = v10;
  v15 = v3;
  v16 = v11;
  v17 = v8;
  v12 = v8;
  v13 = v3;
  -[POAgentProcess updateLocalAccountPassword:passwordContext:completion:](v7, "updateLocalAccountPassword:passwordContext:completion:", v9, v11, v14);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

id __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_3()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to find credential after token unlock."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

intptr_t __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_65(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  PO_LOG_POAgentAuthenticationProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_65_cold_1(a2, v4);

  objc_msgSend(*(id *)(a1 + 32), "handlePendingSSOTokensWithSharedData:", *(_QWORD *)(a1 + 40));
  memset_s((void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "mutableBytes"), objc_msgSend(*(id *)(a1 + 40), "length"), 0, objc_msgSend(*(id *)(a1 + 40), "length"));
  objc_msgSend(*(id *)(a1 + 32), "performLoginForCurrentUserWithPasswordContext:tokenId:", *(_QWORD *)(a1 + 48), 0);
  objc_msgSend(*(id *)(a1 + 32), "handleUnfinishedTGTExchanges");
  if (objc_msgSend(*(id *)(a1 + 32), "shouldRunConfigurationChangeWhenUnlocked"))
    objc_msgSend(*(id *)(a1 + 32), "handleConfigurationChanged:", 0);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

- (void)doUnlockWithEmptyCredentialContext:(id)a3 atLogin:(BOOL)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  BOOL v12;

  v6 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess doUnlockWithEmptyCredentialContext:atLogin:].cold.1();

  -[POAgentAuthenticationProcess loginQueue](self, "loginQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__POAgentAuthenticationProcess_doUnlockWithEmptyCredentialContext_atLogin___block_invoke;
  block[3] = &unk_24EC02E80;
  v12 = a4;
  block[4] = self;
  v11 = v6;
  v9 = v6;
  dispatch_async(v8, block);

}

void __75__POAgentAuthenticationProcess_doUnlockWithEmptyCredentialContext_atLogin___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "keyBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __75__POAgentAuthenticationProcess_doUnlockWithEmptyCredentialContext_atLogin___block_invoke_2;
  v4[3] = &unk_24EC02E80;
  v6 = *(_BYTE *)(a1 + 48);
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "waitForKeyBagUnlockWithCompletion:", v4);

}

uint64_t __75__POAgentAuthenticationProcess_doUnlockWithEmptyCredentialContext_atLogin___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "handleRemovingSSOTokens");
  objc_msgSend(*(id *)(a1 + 32), "performLoginForCurrentUserWithPasswordContext:tokenId:", *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(*(id *)(a1 + 32), "handleUnfinishedTGTExchanges");
  result = objc_msgSend(*(id *)(a1 + 32), "shouldRunConfigurationChangeWhenUnlocked");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "handleConfigurationChanged:", 0);
  return result;
}

- (void)handleAgentStartup
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

void __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke(uint64_t a1)
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_2;
  activity_block[3] = &unk_24EC02ED0;
  activity_block[4] = *(_QWORD *)(a1 + 32);
  _os_activity_initiate(&dword_22307D000, "PSSOAgentStartup", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_3;
  v11[3] = &unk_24EC02630;
  objc_copyWeak(&v12, &location);
  objc_msgSend(*(id *)(a1 + 32), "keyBag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLockHandler:", v11);

  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_configurationChanged_, *MEMORY[0x24BE04388], 0);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", getuid());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "distributedNotificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handleScreenUnlock, CFSTR("com.apple.screenIsUnlocked"), v6);

  objc_msgSend(*(id *)(a1 + 32), "distributedNotificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handleScreenLock, CFSTR("com.apple.screenIsLocked"), v6);

  objc_msgSend(*(id *)(a1 + 32), "checkIfPlatformSSOIsActive");
  objc_msgSend(*(id *)(a1 + 32), "keyBag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_4;
  v10[3] = &unk_24EC02ED0;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "waitForKeyBagFirstUnlockOnStartupWithCompletion:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEnableNetworkChanges:", 0);

}

void __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "loginQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_5;
  block[3] = &unk_24EC02ED0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_5_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "handleConfigurationChanged:", 0);
  v3 = objc_msgSend(*(id *)(a1 + 32), "platformSSOActive");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "configurationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentDeviceConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "supportsTokenUnlock"))
    {
      objc_msgSend(*(id *)(a1 + 32), "configurationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "currentUserConfiguration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "loginType");

      if (v9 != 1)
      {
LABEL_8:
        objc_msgSend(*(id *)(a1 + 32), "setupTimerForAuthentication");
        return;
      }
      objc_msgSend(*(id *)(a1 + 32), "tokenHelper");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      NSUserName();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "insertTokenForUser:", v6);
    }

    goto LABEL_8;
  }
  objc_msgSend(v4, "userNotificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllDeliveredNotifications");

  objc_msgSend(*(id *)(a1 + 32), "userNotificationCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllPendingNotificationRequests");

}

- (void)handleNetworkChange
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

void __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD activity_block[5];

  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_cold_1();

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_79;
  activity_block[3] = &unk_24EC02ED0;
  activity_block[4] = *(_QWORD *)(a1 + 32);
  _os_activity_initiate(&dword_22307D000, "PSSONetworkChange", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_79(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "enableNetworkChanges") & 1) == 0)
  {
    PO_LOG_POAgentAuthenticationProcess();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_79_cold_3();
    goto LABEL_12;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "platformSSOActive") & 1) == 0)
  {
    PO_LOG_POAgentAuthenticationProcess();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_79_cold_2();
    goto LABEL_12;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "platformSSOAccount") & 1) == 0)
  {
    PO_LOG_POAgentAuthenticationProcess();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_79_cold_1();
LABEL_12:

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "keyBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserKeybagUnlocked");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "performLoginForCurrentUserWithPasswordContext:", 0);
    objc_msgSend(*(id *)(a1 + 32), "handleUnfinishedTGTExchanges");
  }
}

- (void)waitForShieldLoweredWithCompletion:(id)a3
{
  POAgentAuthenticationProcess *v4;
  void (**v5)(_QWORD);

  v5 = (void (**)(_QWORD))a3;
  v4 = self;
  objc_sync_enter(v4);
  if (-[POAgentAuthenticationProcess shieldLowered](v4, "shieldLowered"))
    v5[2](v5);
  else
    -[POAgentAuthenticationProcess set__shieldLoweredHandler:](v4, "set__shieldLoweredHandler:", v5);
  objc_sync_exit(v4);

}

- (void)handleScreenUnlock
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

- (void)handleScreenLock
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

- (void)waitForScreenUnlockithCompletion:(id)a3
{
  POAgentAuthenticationProcess *v4;
  void (**v5)(_QWORD);

  v5 = (void (**)(_QWORD))a3;
  v4 = self;
  objc_sync_enter(v4);
  if (-[POAgentAuthenticationProcess screenUnlocked](v4, "screenUnlocked"))
    v5[2](v5);
  else
    -[POAgentAuthenticationProcess set__screenUnlockHandler:](v4, "set__screenUnlockHandler:", v5);
  objc_sync_exit(v4);

}

- (BOOL)performLoginForCurrentUserWithPasswordContext:(id)a3
{
  return -[POAgentAuthenticationProcess performLoginForCurrentUserWithPasswordContext:tokenId:](self, "performLoginForCurrentUserWithPasswordContext:tokenId:", a3, 0);
}

- (BOOL)performLoginForCurrentUserWithPasswordContext:(id)a3 tokenId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  POAgentAuthenticationProcess *v9;
  BOOL v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  BOOL v18;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  void *v32;
  double v33;
  _BOOL4 v34;
  NSObject *v35;
  void *v36;
  int v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  _BOOL4 v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  BOOL v51;
  BOOL v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  double v58;
  _BOOL4 v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  NSObject *v68;
  NSObject *v69;
  BOOL v70;
  NSObject *obj;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  id (*v78)();
  void *v79;
  POAgentAuthenticationProcess *v80;
  uint8_t v81[128];
  uint8_t buf[4];
  const char *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  POAgentAuthenticationProcess *v87;
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PO_LOG_POAgentAuthenticationProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess performLoginForCurrentUserWithPasswordContext:tokenId:].cold.3();

  v9 = self;
  objc_sync_enter(v9);
  if (!-[POAgentAuthenticationProcess platformSSOActive](v9, "platformSSOActive"))
  {
    PO_LOG_POAgentAuthenticationProcess();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_79_cold_2();
    goto LABEL_20;
  }
  v10 = -[POAgentAuthenticationProcess platformSSOAccount](v9, "platformSSOAccount");
  PO_LOG_POAgentAuthenticationProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (!v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22307D000, v11, OS_LOG_TYPE_INFO, "not a PlatformSSO account", buf, 2u);
    }
    goto LABEL_20;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22307D000, v11, OS_LOG_TYPE_INFO, "Checking Login for user", buf, 2u);
  }

  -[POAgentAuthenticationProcess configurationManager](v9, "configurationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentUserConfiguration");
  v11 = objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    PO_LOG_POAgentAuthenticationProcess();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[NSObject state](v11, "state"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v83 = "-[POAgentAuthenticationProcess performLoginForCurrentUserWithPasswordContext:tokenId:]";
      v84 = 2114;
      v85 = v15;
      v86 = 2112;
      v87 = v9;
      _os_log_impl(&dword_22307D000, v14, OS_LOG_TYPE_DEFAULT, "%s user state = %{public}@ on %@", buf, 0x20u);

    }
    if (-[NSObject state](v11, "state") == 2 || -[NSObject state](v11, "state") == 5)
    {
      PO_LOG_POAgentAuthenticationProcess();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v16, OS_LOG_TYPE_INFO, "User state is needs registration or key is invalid", buf, 2u);
      }

      goto LABEL_20;
    }
    v20 = -[NSObject state](v11, "state");
    if (v20 == 1)
    {
      PO_LOG_POAgentAuthenticationProcess();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v21, OS_LOG_TYPE_INFO, "User state is needs authentication", buf, 2u);
      }

    }
    -[NSObject lastLoginDate](v11, "lastLoginDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[NSObject lastLoginDate](v11, "lastLoginDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceNow");
      v25 = v24;
      -[POAgentAuthenticationProcess configurationManager](v9, "configurationManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "currentDeviceConfiguration");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "loginFrequency");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = v25 < (double)-(int)objc_msgSend(v28, "intValue");

    }
    else
    {
      v70 = 1;
    }

    if (v20 != 1 && v70)
    {
      PO_LOG_POAgentAuthenticationProcess();
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
LABEL_33:

        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      v30 = "Time for user authentication";
    }
    else
    {
      if (v20 == 1)
      {
LABEL_38:
        PO_LOG_POAgentAuthenticationProcess();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22307D000, v35, OS_LOG_TYPE_INFO, "Attempting authentication", buf, 2u);
        }

        -[POAgentAuthenticationProcess authenticationProcess](v9, "authenticationProcess");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "waitForConnectivity");

        if (v37)
          v38 = 180.0;
        else
          v38 = 2.0;
        -[POAgentAuthenticationProcess lastAuthenticationAttempt](v9, "lastAuthenticationAttempt");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (v39)
        {
          -[POAgentAuthenticationProcess lastAuthenticationAttempt](v9, "lastAuthenticationAttempt");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "timeIntervalSinceNow");
          v42 = v41 > -v38;

          if (v42)
          {
            PO_LOG_POAgentAuthenticationProcess();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              -[POAgentAuthenticationProcess performLoginForCurrentUserWithPasswordContext:tokenId:].cold.1();

            goto LABEL_20;
          }
        }
        -[POAgentAuthenticationProcess configurationManager](v9, "configurationManager");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "currentLoginConfiguration");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v45)
        {
          v53 = __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke_82();
          v18 = 0;
LABEL_66:

          goto LABEL_21;
        }
        -[POAgentAuthenticationProcess configurationManager](v9, "configurationManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "currentDeviceConfiguration");
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          if ((objc_msgSend(v47, "registrationCompleted") & 1) != 0)
          {
            if (v70)
              goto LABEL_63;
            if (-[NSObject loginType](v11, "loginType") == 2)
              goto LABEL_63;
            objc_msgSend(v45, "refreshEndpointURL");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v48)
              goto LABEL_63;
            -[POAgentAuthenticationProcess configurationManager](v9, "configurationManager");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "currentRefreshToken");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v50 == 0;

            if (v51)
LABEL_63:
              v52 = -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:](v9, "_doLoginWithPasswordContext:tokenId:", v6, v7);
            else
              v52 = -[POAgentAuthenticationProcess _doRefreshWithPasswordContext:tokenId:](v9, "_doRefreshWithPasswordContext:tokenId:", v6, v7);
            v18 = v52;
            goto LABEL_65;
          }
          v55 = __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke_88();
        }
        else
        {
          v54 = __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke_85();
        }
        v18 = 0;
LABEL_65:

        goto LABEL_66;
      }
      -[POAgentAuthenticationProcess configurationManager](v9, "configurationManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "tokenReceived");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSinceNow");
      v34 = v33 < -14400.0;

      if (v34)
      {
        PO_LOG_POAgentAuthenticationProcess();
        v29 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          goto LABEL_33;
        *(_WORD *)buf = 0;
        v30 = "Tokens issued more than 4 hours ago";
      }
      else
      {
        -[POAgentAuthenticationProcess configurationManager](v9, "configurationManager");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "tokenExpiration");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "timeIntervalSinceNow");
        v59 = v58 < 600.0;

        if (!v59)
        {
          v74 = 0u;
          v75 = 0u;
          v73 = 0u;
          v72 = 0u;
          -[NSObject kerberosStatus](v11, "kerberosStatus");
          v60 = objc_claimAutoreleasedReturnValue();
          v61 = -[NSObject countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
          obj = v60;
          if (v61)
          {
            v62 = *(_QWORD *)v73;
            while (2)
            {
              for (i = 0; i != v61; ++i)
              {
                if (*(_QWORD *)v73 != v62)
                  objc_enumerationMutation(obj);
                v64 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
                if (objc_msgSend(v64, "importSuccessful"))
                {
                  if ((objc_msgSend(v64, "exchangeRequired") & 1) == 0)
                  {
                    -[POAgentAuthenticationProcess kerberosHelper](v9, "kerberosHelper");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "cacheName");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    v67 = objc_msgSend(v65, "checkForValidKerberosTGT:", v66);

                    if ((v67 & 1) == 0)
                    {
                      PO_LOG_POAgentAuthenticationProcess();
                      v69 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_22307D000, v69, OS_LOG_TYPE_INFO, "Kerberos cache not valid", buf, 2u);
                      }

                      v29 = obj;
                      goto LABEL_33;
                    }
                  }
                }
              }
              v61 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
              if (v61)
                continue;
              break;
            }
          }

          PO_LOG_POAgentAuthenticationProcess();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22307D000, v68, OS_LOG_TYPE_INFO, "User does not need authentication", buf, 2u);
          }

          -[POAgentAuthenticationProcess handleKeyUpdatesWithPasswordContext:](v9, "handleKeyUpdatesWithPasswordContext:", v6);
          goto LABEL_20;
        }
        PO_LOG_POAgentAuthenticationProcess();
        v29 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          goto LABEL_33;
        *(_WORD *)buf = 0;
        v30 = "Tokens expire soon";
      }
    }
    _os_log_impl(&dword_22307D000, v29, OS_LOG_TYPE_INFO, v30, buf, 2u);
    goto LABEL_33;
  }
  v76 = MEMORY[0x24BDAC760];
  v77 = 3221225472;
  v78 = __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke;
  v79 = &unk_24EC025A0;
  v80 = v9;
  v17 = __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke();
LABEL_20:
  v18 = 0;
LABEL_21:

  objc_sync_exit(v9);
  return v18;
}

id __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No user configuration for user for login."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke_82()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No login configuration for user for login."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke_85()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No device configuration for user for login."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __86__POAgentAuthenticationProcess_performLoginForCurrentUserWithPasswordContext_tokenId___block_invoke_88()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("Registration is not complete for user for login."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (BOOL)_doRefreshWithPasswordContext:(id)a3 tokenId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v39;
  void *v40;
  void *v41;
  os_signpost_id_t v42;
  _QWORD v43[5];
  id v44;
  id v45;
  id v46;
  os_signpost_id_t v47;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  PO_LOG_POAgentAuthenticationProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess _doRefreshWithPasswordContext:tokenId:].cold.1();

  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentUserConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentDeviceConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentLoginConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v14 != 0;
      if (v14)
      {
        v41 = v6;
        -[POAgentAuthenticationProcess notifyKerberosDelegateTGTDidBegin](self, "notifyKerberosDelegateTGTDidBegin");
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[POAgentAuthenticationProcess setLastAuthenticationAttempt:](self, "setLastAuthenticationAttempt:", v16);

        PO_LOG_POAgentAuthenticationProcess();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_signpost_id_generate(v17);

        PO_LOG_POAgentAuthenticationProcess();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22307D000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PlatformSSO_RefreshAuth", " enableTelemetry=YES ", buf, 2u);
        }

        objc_msgSend(v10, "userLoginConfiguration");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "mergedConfigurationWithUserLoginConfiguration:", v21);
        v22 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "userLoginConfiguration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "loginUserName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        v42 = v18;
        if (v24)
        {
          v26 = v24;
        }
        else
        {
          -[POAgentAuthenticationProcess userName](self, "userName");
          v26 = (id)objc_claimAutoreleasedReturnValue();
        }
        v30 = v26;
        v39 = v26;

        -[POAgentAuthenticationProcess authenticationProcess](self, "authenticationProcess");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)v22;
        objc_msgSend(v31, "createAuthenticationContextUsingLoginConfiguration:deviceConfiguration:userName:", v22, v12, v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        -[POAgentAuthenticationProcess jwksStorageProvider](self, "jwksStorageProvider");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setJwksStorageProvider:", v33);

        -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "currentRefreshToken");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setRefreshToken:", v35);

        -[POAgentAuthenticationProcess authenticationProcess](self, "authenticationProcess");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v43[0] = MEMORY[0x24BDAC760];
        v43[1] = 3221225472;
        v43[2] = __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke_103;
        v43[3] = &unk_24EC02EF8;
        v6 = v41;
        v47 = v42;
        v43[4] = self;
        v44 = v32;
        v45 = v41;
        v46 = v7;
        v37 = v32;
        objc_msgSend(v36, "performTokenRefreshUsingContext:completion:", v37, v43);

      }
      else
      {
        v29 = __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke_98();
      }

    }
    else
    {
      v28 = __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke_94();
      v15 = 0;
    }

  }
  else
  {
    v27 = __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke();
    v15 = 0;
  }

  return v15;
}

id __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No user configuration for refresh."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke_94()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No device configuration for refresh."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke_98()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No login configuration for refresh."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

void __70__POAgentAuthenticationProcess__doRefreshWithPasswordContext_tokenId___block_invoke_103(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  const char *v12;
  uint8_t *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  __int16 v19;
  uint8_t buf[2];
  __int16 v21;
  __int16 v22;

  v7 = a3;
  v8 = a4;
  switch(a2)
  {
    case 0:
    case 3:
    case 6:
      PO_LOG_POAgentAuthenticationProcess();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = *(_QWORD *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
        goto LABEL_18;
      LOWORD(v18) = 0;
      v12 = "Failed";
      v13 = (uint8_t *)&v18;
      break;
    case 1:
      PO_LOG_POAgentAuthenticationProcess();
      v14 = objc_claimAutoreleasedReturnValue();
      v10 = v14;
      v11 = *(_QWORD *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14))
        goto LABEL_18;
      v22 = 0;
      v12 = "Success";
      v13 = (uint8_t *)&v22;
      break;
    case 2:
      PO_LOG_POAgentAuthenticationProcess();
      v17 = objc_claimAutoreleasedReturnValue();
      v10 = v17;
      v11 = *(_QWORD *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v17))
        goto LABEL_18;
      *(_WORD *)buf = 0;
      v12 = "PermanentFailure";
      v13 = buf;
      break;
    case 4:
      PO_LOG_POAgentAuthenticationProcess();
      v15 = objc_claimAutoreleasedReturnValue();
      v10 = v15;
      v11 = *(_QWORD *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v15))
        goto LABEL_18;
      v21 = 0;
      v12 = "CredentialFailure";
      v13 = (uint8_t *)&v21;
      break;
    case 5:
      PO_LOG_POAgentAuthenticationProcess();
      v16 = objc_claimAutoreleasedReturnValue();
      v10 = v16;
      v11 = *(_QWORD *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16))
        goto LABEL_18;
      v19 = 0;
      v12 = "Unavailable";
      v13 = (uint8_t *)&v19;
      break;
    default:
      goto LABEL_19;
  }
  _os_signpost_emit_with_name_impl(&dword_22307D000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_RefreshAuth", v12, v13, 2u);
LABEL_18:

LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "_handleLoginResult:authenticationContext:tokens:passwordContext:tokenId:tokenHash:", a2, *(_QWORD *)(a1 + 40), v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, v18);

}

- (BOOL)_doLoginWithPasswordContext:(id)a3 tokenId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  char v35;
  NSObject *v36;
  id v37;
  void *v38;
  NSObject *v39;
  os_signpost_id_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v65;
  void *v66;
  char v67;
  NSObject *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  unint64_t v76;
  void *v77;
  BOOL v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  BOOL v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  BOOL v93;
  void *v94;
  void *v95;
  BOOL v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  os_signpost_id_t v113;
  NSObject *v114;
  NSObject *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  NSObject *v121;
  unint64_t v122;
  id v123;
  void *v124;
  char v125;
  NSObject *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  id v134;
  id v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  NSObject *v155;
  NSObject *v156;
  NSObject *v157;
  _BOOL4 v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  BOOL v168;
  void *v169;
  void *v170;
  CFDictionaryRef v171;
  id v172;
  void *v173;
  id v174;
  unint64_t v175;
  id v176;
  id v177;
  void *v178;
  void *v179;
  _QWORD v180[5];
  id v181;
  id v182;
  id v183;
  os_signpost_id_t v184;
  id v185;
  uint8_t v186[8];
  id v187;
  id v188[6];
  id v189;
  id v190;
  _QWORD v191[5];
  id v192;
  id v193;
  os_signpost_id_t v194;
  _QWORD v195[5];
  id v196;
  char v197;
  _QWORD v198[5];
  uint8_t v199[16];
  id obj;
  _QWORD v201[5];
  id v202;
  id v203;
  _BYTE *v204;
  os_signpost_id_t v205;
  uint64_t v206;
  uint64_t v207;
  id (*v208)();
  void *v209;
  POAgentAuthenticationProcess *v210;
  uint64_t v211;
  uint64_t v212;
  id (*v213)();
  void *v214;
  POAgentAuthenticationProcess *v215;
  uint64_t v216;
  uint64_t v217;
  id (*v218)();
  void *v219;
  POAgentAuthenticationProcess *v220;
  uint64_t v221;
  uint64_t v222;
  id (*v223)();
  void *v224;
  POAgentAuthenticationProcess *v225;
  _BYTE buf[24];
  POAgentAuthenticationProcess *v227;
  void (*v228)(uint64_t);
  id v229;
  uint64_t v230;

  v230 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  PO_LOG_POAgentAuthenticationProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:].cold.8();

  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentUserConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentDeviceConfiguration");
    v179 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v179)
    {
      v216 = MEMORY[0x24BDAC760];
      v217 = 3221225472;
      v218 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_107;
      v219 = &unk_24EC025A0;
      v220 = self;
      v33 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_107();
      LOBYTE(v32) = 0;
LABEL_45:

      goto LABEL_46;
    }
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentLoginConfiguration");
    v178 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v178)
    {
      v211 = MEMORY[0x24BDAC760];
      v212 = 3221225472;
      v213 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_110;
      v214 = &unk_24EC025A0;
      v215 = self;
      v34 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_110();
      goto LABEL_21;
    }
    PO_LOG_POAgentAuthenticationProcess();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "loginType"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v227 = self;
      _os_log_impl(&dword_22307D000, v13, OS_LOG_TYPE_DEFAULT, "%s loginType = %{public}@ on %@", buf, 0x20u);

    }
    if (objc_msgSend(v10, "loginType") == 1)
    {
      PO_LOG_POAgentAuthenticationProcess();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v15, OS_LOG_TYPE_INFO, "Password authentication", buf, 2u);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v227 = (POAgentAuthenticationProcess *)__Block_byref_object_copy__2;
      v228 = __Block_byref_object_dispose__2;
      objc_msgSend(MEMORY[0x24BE72EA0], "passwordDataFromContext:error:", v6, 0);
      v229 = (id)objc_claimAutoreleasedReturnValue();
      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        goto LABEL_13;
      -[POAgentAuthenticationProcess keyWrap](self, "keyWrap");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_credential");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "unwrapBlob:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v18;

      if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
      {
LABEL_13:
        -[POAgentAuthenticationProcess notifyKerberosDelegateTGTDidBegin](self, "notifyKerberosDelegateTGTDidBegin");
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[POAgentAuthenticationProcess setLastAuthenticationAttempt:](self, "setLastAuthenticationAttempt:", v20);

        PO_LOG_POAgentAuthenticationProcess();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = os_signpost_id_generate(v21);

        PO_LOG_POAgentAuthenticationProcess();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
        {
          *(_WORD *)v186 = 0;
          _os_signpost_emit_with_name_impl(&dword_22307D000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "PlatformSSO_PasswordAuth", " enableTelemetry=YES ", v186, 2u);
        }

        objc_msgSend(v10, "userLoginConfiguration");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "mergedConfigurationWithUserLoginConfiguration:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "userLoginConfiguration");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "loginUserName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v28)
        {
          v30 = v28;
        }
        else
        {
          -[POAgentAuthenticationProcess userName](self, "userName");
          v30 = (id)objc_claimAutoreleasedReturnValue();
        }
        v49 = v30;

        -[POAgentAuthenticationProcess authenticationProcess](self, "authenticationProcess");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "createAuthenticationContextUsingLoginConfiguration:deviceConfiguration:userName:", v26, v179, v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v51, "setPassword:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        -[POAgentAuthenticationProcess jwksStorageProvider](self, "jwksStorageProvider");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setJwksStorageProvider:", v52);

        -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "currentRefreshToken");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setRefreshToken:", v54);

        -[POAgentAuthenticationProcess authenticationProcess](self, "authenticationProcess");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v201[0] = MEMORY[0x24BDAC760];
        v201[1] = 3221225472;
        v201[2] = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_116;
        v201[3] = &unk_24EC02F20;
        v204 = buf;
        v205 = v22;
        v201[4] = self;
        v202 = v6;
        v203 = v7;
        objc_msgSend(v55, "performPasswordLoginUsingContext:completion:", v51, v201);

        _Block_object_dispose(buf, 8);
        goto LABEL_43;
      }
      v206 = MEMORY[0x24BDAC760];
      v207 = 3221225472;
      v208 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_113;
      v209 = &unk_24EC025A0;
      v210 = self;
      v65 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_113();
      -[POAgentAuthenticationProcess handleUserNeedsReauthenticationAfterDelay:](self, "handleUserNeedsReauthenticationAfterDelay:", 1.0);
      _Block_object_dispose(buf, 8);

LABEL_21:
      LOBYTE(v32) = 0;
LABEL_44:

      goto LABEL_45;
    }
    if (objc_msgSend(v10, "loginType") == 2)
    {
      -[POAgentAuthenticationProcess notifyKerberosDelegateTGTDidBegin](self, "notifyKerberosDelegateTGTDidBegin");
      v171 = SecKeyCopyAttributes((SecKeyRef)objc_msgSend(v10, "sepKey"));
      -[__CFDictionary objectForKeyedSubscript:](v171, "objectForKeyedSubscript:", *MEMORY[0x24BDE8F48]);
      v173 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v173 || !objc_msgSend(MEMORY[0x24BE72EF0], "checkIfBiometricConstraintsForSigning:"))
      {
        v176 = 0;
LABEL_34:
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[POAgentAuthenticationProcess setLastAuthenticationAttempt:](self, "setLastAuthenticationAttempt:", v38);

        PO_LOG_POAgentAuthenticationProcess();
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = os_signpost_id_generate(v39);

        PO_LOG_POAgentAuthenticationProcess();
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_22307D000, v42, OS_SIGNPOST_INTERVAL_BEGIN, v40, "PlatformSSO_UserSEPKeyAuth", " enableTelemetry=YES ", buf, 2u);
        }

        objc_msgSend(v10, "userLoginConfiguration");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "mergedConfigurationWithUserLoginConfiguration:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "userLoginConfiguration");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "loginUserName");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v46;
        if (v46)
        {
          v48 = v46;
        }
        else
        {
          -[POAgentAuthenticationProcess userName](self, "userName");
          v48 = (id)objc_claimAutoreleasedReturnValue();
        }
        v56 = v48;

        -[POAgentAuthenticationProcess authenticationProcess](self, "authenticationProcess");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "createAuthenticationContextUsingLoginConfiguration:deviceConfiguration:userName:", v44, v179, v56);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        -[POAgentAuthenticationProcess jwksStorageProvider](self, "jwksStorageProvider");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setJwksStorageProvider:", v59);

        -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "currentRefreshToken");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setRefreshToken:", v61);

        objc_msgSend(v58, "setEmbeddedAssertionSigningKey:", objc_msgSend(v10, "sepKeyWithContext:", v176));
        objc_msgSend(v58, "setEmbeddedAssertionCertificate:", objc_msgSend(v10, "sepKeyCertificate"));
        objc_msgSend(v10, "signingAlgorithm");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setUserSepSigningAlgorithm:", v62);

        -[POAgentAuthenticationProcess authenticationProcess](self, "authenticationProcess");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v191[0] = MEMORY[0x24BDAC760];
        v191[1] = 3221225472;
        v191[2] = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_149;
        v191[3] = &unk_24EC02FD0;
        v194 = v40;
        v191[4] = self;
        v192 = v6;
        v193 = v7;
        objc_msgSend(v63, "performSEPKeyLoginUsingContext:completion:", v58, v191);

        goto LABEL_43;
      }
      v35 = objc_msgSend(v178, "userSEPKeyBiometricPolicy");
      if (v6 && (v35 & 4) != 0)
      {
        PO_LOG_POAgentAuthenticationProcess();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:].cold.1();

        v176 = v6;
        goto LABEL_34;
      }
      v176 = objc_alloc_init(MEMORY[0x24BDDA938]);
      objc_msgSend(v179, "accountDisplayName");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v77, "length") == 0;

      if (v78)
      {
        objc_msgSend(v178, "accountDisplayName");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = objc_msgSend(v95, "length") == 0;

        v97 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("SMARTCARD_LOGIN_REASON_TEXT"), &stru_24EC04270, 0);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        if (v96)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "localizedStringForKey:value:table:", CFSTR("IDENTITY_PROVIDER_TEXT"), &stru_24EC04270, 0);
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "localizedStringWithFormat:", v99, v137);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "setLocalizedReason:", v138);

          v169 = 0;
        }
        else
        {
          objc_msgSend(v178, "accountDisplayName");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "localizedStringWithFormat:", v99, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "setLocalizedReason:", v101);

          objc_msgSend(v178, "accountDisplayName");
          v169 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v79 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("SMARTCARD_LOGIN_REASON_TEXT"), &stru_24EC04270, 0);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "accountDisplayName");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "localizedStringWithFormat:", v81, v82);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "setLocalizedReason:", v83);

        objc_msgSend(v179, "accountDisplayName");
        v169 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "localizedStringForKey:value:table:", CFSTR("DEFAULT_LOGIN_PROMPT_NAME"), &stru_24EC04270, 0);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "setOptionCallerName:", v140);

      v141 = (void *)MEMORY[0x24BDD1488];
      objc_msgSend(v179, "extensionIdentifier");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "bundleWithIdentifier:", v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "bundlePath");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "setOptionCallerIconPath:", v144);

      objc_msgSend(v176, "setInteractionNotAllowed:", 0);
      if ((objc_msgSend(v178, "userSEPKeyBiometricPolicy") & 8) != 0)
      {
        if (!v169 || (unint64_t)objc_msgSend(v169, "length") >= 0x13)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v145, "localizedStringForKey:value:table:", CFSTR("IDENTITY_PROVIDER_TEXT"), &stru_24EC04270, 0);
          v146 = objc_claimAutoreleasedReturnValue();

          v169 = (void *)v146;
        }
        v147 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "localizedStringForKey:value:table:", CFSTR("CUSTOM_FALLBACK_BUTTON_TEXT"), &stru_24EC04270, 0);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "localizedStringWithFormat:", v149, v169);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v176, "setLocalizedFallbackTitle:", v150);

        objc_msgSend(v176, "setOptionFallbackVisible:", MEMORY[0x24BDBD1C8]);
      }
      v151 = 0;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v227 = (POAgentAuthenticationProcess *)__Block_byref_object_copy__2;
      v228 = __Block_byref_object_dispose__2;
      v229 = 0;
      LODWORD(v32) = 10;
      v152 = (void *)0x24BDD1000;
      while (1)
      {
        v153 = *(_QWORD *)&buf[8];
        obj = *(id *)(*(_QWORD *)&buf[8] + 40);
        objc_msgSend(v176, "evaluateAccessControl:operation:options:error:", v173, 3, MEMORY[0x24BDBD1B8], &obj);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v153 + 40), obj);

        if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code") == -1004)
        {
          PO_LOG_POAgentAuthenticationProcess();
          v155 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v155, OS_LOG_TYPE_DEBUG))
            -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:].cold.5(v186, &v186[1]);

          objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 2.0);
        }
        if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code") != -4)
          break;
        PO_LOG_POAgentAuthenticationProcess();
        v156 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG))
          -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:].cold.2(v199, &v199[1]);

        objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 5.0);
        v151 = v154;
        LODWORD(v32) = v32 - 1;
        if (!(_DWORD)v32)
          goto LABEL_116;
      }
      v32 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      PO_LOG_POAgentAuthenticationProcess();
      v157 = objc_claimAutoreleasedReturnValue();
      v158 = os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG);
      if (v32)
      {
        if (v158)
          -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:].cold.4();
      }
      else if (v158)
      {
        -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:].cold.3();
      }

LABEL_116:
      if (!v154)
      {
        v159 = MEMORY[0x24BDAC760];
        v198[0] = MEMORY[0x24BDAC760];
        v198[1] = 3221225472;
        v198[2] = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_132;
        v198[3] = &unk_24EC02898;
        v198[4] = buf;
        v160 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_132((uint64_t)v198);
        v161 = objc_msgSend(v178, "userSEPKeyBiometricPolicy");
        v162 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code");
        v175 = v161 & 8;
        if (v162 == -1)
        {
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "userInfo");
          v161 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v161, "objectForKeyedSubscript:", CFSTR("Subcode"));
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v152, "intValue") == 6)
          {

LABEL_122:
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v164, "localizedStringForKey:value:table:", CFSTR("BIOMETRIC_CHANGED_TEXT"), &stru_24EC04270, 0);
            v165 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v166, "localizedStringForKey:value:table:", CFSTR("DEFAULT_REGISTRATION_REQUIRED_TEXT"), &stru_24EC04270, 0);
            v167 = (void *)objc_claimAutoreleasedReturnValue();

            v195[0] = v159;
            v195[1] = 3221225472;
            v195[2] = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_141;
            v195[3] = &unk_24EC02F88;
            v197 = v175 >> 3;
            v195[4] = self;
            v196 = v10;
            -[POAgentAuthenticationProcess showAlertMessage:messageText:completion:](self, "showAlertMessage:messageText:completion:", v165, v167, v195);

LABEL_125:
            LOBYTE(v32) = 0;
            goto LABEL_127;
          }
        }
        v163 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "code");
        if (v162 == -1)
        {
          v168 = v163 == -7;

          if (v168)
            goto LABEL_122;
        }
        else if (v163 == -7)
        {
          goto LABEL_122;
        }
        if (!v175)
          goto LABEL_125;
        -[POAgentAuthenticationProcess requestUserAuthenticationSyncPassword:completion:](self, "requestUserAuthenticationSyncPassword:completion:", 0, &__block_literal_global_148);
        LOBYTE(v32) = 1;
      }
LABEL_127:

      _Block_object_dispose(buf, 8);
      if (!v154)
      {

        goto LABEL_44;
      }
      goto LABEL_34;
    }
    if (objc_msgSend(v10, "loginType") != 3)
    {
LABEL_43:
      LOBYTE(v32) = 1;
      goto LABEL_44;
    }
    if (v7)
    {
      v37 = v7;
    }
    else
    {
      objc_msgSend(v10, "smartCardTokenId");
      v37 = (id)objc_claimAutoreleasedReturnValue();
      if (!v37)
        goto LABEL_56;
    }
    -[POAgentAuthenticationProcess tokenHelper](self, "tokenHelper");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "waitForTokenAvailable:", v37);

    if ((v67 & 1) != 0)
    {
LABEL_50:
      PO_LOG_POAgentAuthenticationProcess();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:].cold.7();

      -[POAgentAuthenticationProcess tokenHelper](self, "tokenHelper");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess userName](self, "userName");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v188[0] = 0;
      objc_msgSend(v69, "findTokenIdForSmartCardBoundUser:tokenHash:", v70, v188);
      v177 = (id)objc_claimAutoreleasedReturnValue();
      v174 = v188[0];

      if (!objc_msgSend(v177, "length"))
      {
        PO_LOG_POAgentAuthenticationProcess();
        v71 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
          -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:].cold.6();

        -[POAgentAuthenticationProcess tokenHelper](self, "tokenHelper");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[POAgentAuthenticationProcess userName](self, "userName");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v187 = v174;
        objc_msgSend(v72, "findTokenIdForSmartCardAMUser:tokenHash:", v73, &v187);
        v74 = objc_claimAutoreleasedReturnValue();
        v75 = v187;

        v174 = v75;
        v177 = (id)v74;
      }
LABEL_59:
      if (v6)
        v172 = v6;
      else
        v172 = objc_alloc_init(MEMORY[0x24BDDA938]);
      objc_msgSend(v179, "accountDisplayName");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "length") == 0;

      if (v86)
      {
        objc_msgSend(v178, "accountDisplayName");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend(v92, "length") == 0;

        v94 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("SMARTCARD_LOGIN_REASON_TEXT"), &stru_24EC04270, 0);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        if (v93)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "localizedStringForKey:value:table:", CFSTR("IDENTITY_PROVIDER_TEXT"), &stru_24EC04270, 0);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "localizedStringWithFormat:", v89, v91);
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "setOptionAuthenticationTitle:", v103);

        }
        else
        {
          objc_msgSend(v178, "accountDisplayName");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "localizedStringWithFormat:", v89, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "setOptionAuthenticationTitle:", v91);
        }
      }
      else
      {
        v87 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("SMARTCARD_LOGIN_REASON_TEXT"), &stru_24EC04270, 0);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "accountDisplayName");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "localizedStringWithFormat:", v89, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v172, "setOptionAuthenticationTitle:", v91);
      }

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "localizedStringForKey:value:table:", CFSTR("DEFAULT_LOGIN_PROMPT_NAME"), &stru_24EC04270, 0);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "setOptionCallerName:", v105);

      v106 = (void *)MEMORY[0x24BDD1488];
      objc_msgSend(v179, "extensionIdentifier");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "bundleWithIdentifier:", v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "bundlePath");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "setOptionCallerIconPath:", v109);

      *(_QWORD *)buf = 0;
      *(_QWORD *)v186 = 0;
      -[POAgentAuthenticationProcess keychainHelper](self, "keychainHelper");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v106) = objc_msgSend(v110, "retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:", v177, v172, 1, v174, v186, buf);

      if ((v106 & 1) != 0)
        goto LABEL_77;
      PO_LOG_POAgentAuthenticationProcess();
      v121 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v199 = 0;
        _os_log_impl(&dword_22307D000, v121, OS_LOG_TYPE_INFO, "Smartcard not found.", v199, 2u);
      }

      v185 = v174;
      v122 = -[POAgentAuthenticationProcess requestSmartCardForBinding:tokenId:tokenHash:wrapTokenHash:](self, "requestSmartCardForBinding:tokenId:tokenHash:wrapTokenHash:", 1, 0, &v185, 0);
      v123 = v185;

      if (v122 == 1)
      {
        -[POAgentAuthenticationProcess keychainHelper](self, "keychainHelper");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = objc_msgSend(v124, "retrieveCertAndKeyForTokenId:context:forSigning:hash:certificate:privateKey:", v177, v172, 1, v123, v186, buf);

        if ((v125 & 1) != 0)
        {
          v174 = v123;
LABEL_77:
          -[POAgentAuthenticationProcess notifyKerberosDelegateTGTDidBegin](self, "notifyKerberosDelegateTGTDidBegin");
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          -[POAgentAuthenticationProcess setLastAuthenticationAttempt:](self, "setLastAuthenticationAttempt:", v111);

          PO_LOG_POAgentAuthenticationProcess();
          v112 = objc_claimAutoreleasedReturnValue();
          v113 = os_signpost_id_generate(v112);

          PO_LOG_POAgentAuthenticationProcess();
          v114 = objc_claimAutoreleasedReturnValue();
          v115 = v114;
          if (v113 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v114))
          {
            *(_WORD *)v199 = 0;
            _os_signpost_emit_with_name_impl(&dword_22307D000, v115, OS_SIGNPOST_INTERVAL_BEGIN, v113, "PlatformSSO_SmartCard", " enableTelemetry=YES ", v199, 2u);
          }

          objc_msgSend(v10, "userLoginConfiguration");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v178, "mergedConfigurationWithUserLoginConfiguration:", v116);
          v170 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "userLoginConfiguration");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "loginUserName");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = v118;
          if (v118)
          {
            v120 = v118;
          }
          else
          {
            -[POAgentAuthenticationProcess userName](self, "userName");
            v120 = (id)objc_claimAutoreleasedReturnValue();
          }
          v127 = v120;

          -[POAgentAuthenticationProcess authenticationProcess](self, "authenticationProcess");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "createAuthenticationContextUsingLoginConfiguration:deviceConfiguration:userName:", v170, v179, v127);
          v129 = (void *)objc_claimAutoreleasedReturnValue();

          -[POAgentAuthenticationProcess jwksStorageProvider](self, "jwksStorageProvider");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "setJwksStorageProvider:", v130);

          -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "currentRefreshToken");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "setRefreshToken:", v132);

          objc_msgSend(v129, "setEmbeddedAssertionSigningKey:", *(_QWORD *)buf);
          objc_msgSend(v129, "setEmbeddedAssertionCertificate:", *(_QWORD *)v186);
          -[POAgentAuthenticationProcess authenticationProcess](self, "authenticationProcess");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          v180[0] = MEMORY[0x24BDAC760];
          v180[1] = 3221225472;
          v180[2] = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_157;
          v180[3] = &unk_24EC02EF8;
          v184 = v113;
          v180[4] = self;
          v181 = v6;
          v182 = v7;
          v183 = v174;
          v134 = v174;
          objc_msgSend(v133, "performSmartCardLoginUsingContext:completion:", v129, v180);

          goto LABEL_43;
        }
        v135 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_153();
      }
      else
      {
        PO_LOG_POAgentAuthenticationProcess();
        v126 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v199 = 0;
          _os_log_impl(&dword_22307D000, v126, OS_LOG_TYPE_INFO, "Smartcard dialog cancelled", v199, 2u);
        }

      }
      goto LABEL_21;
    }
LABEL_56:
    v189 = 0;
    v190 = v37;
    v76 = -[POAgentAuthenticationProcess requestSmartCardForBinding:tokenId:tokenHash:wrapTokenHash:](self, "requestSmartCardForBinding:tokenId:tokenHash:wrapTokenHash:", 1, &v190, &v189, 0);
    v177 = v190;

    v174 = v189;
    if (v76 == 1)
    {
      v37 = v177;
      if (v177)
      {
        if (v174)
          goto LABEL_59;
        goto LABEL_50;
      }
      v188[1] = (id)MEMORY[0x24BDAC760];
      v188[2] = (id)3221225472;
      v188[3] = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_150;
      v188[4] = &unk_24EC025A0;
      v188[5] = self;
      v102 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_150();
      v177 = 0;
    }
    else
    {
      PO_LOG_POAgentAuthenticationProcess();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v84, OS_LOG_TYPE_INFO, "Smartcard dialog cancelled", buf, 2u);
      }

    }
    goto LABEL_21;
  }
  v221 = MEMORY[0x24BDAC760];
  v222 = 3221225472;
  v223 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke;
  v224 = &unk_24EC025A0;
  v225 = self;
  v31 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke();
  LOBYTE(v32) = 0;
LABEL_46:

  return v32 & 1;
}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No user configuration for user for password login."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_107()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No device configuration for user for password login."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_110()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No login configuration for user for password login."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_113()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No credential for user for password login."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

void __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_116(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  const char *v14;
  uint8_t *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  __int16 v21;
  uint8_t buf[2];
  __int16 v23;
  __int16 v24;

  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

  switch(a2)
  {
    case 0:
    case 3:
    case 6:
      PO_LOG_POAgentAuthenticationProcess();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = *(_QWORD *)(a1 + 64);
      if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v11))
        goto LABEL_18;
      LOWORD(v20) = 0;
      v14 = "Failed";
      v15 = (uint8_t *)&v20;
      break;
    case 1:
      PO_LOG_POAgentAuthenticationProcess();
      v16 = objc_claimAutoreleasedReturnValue();
      v12 = v16;
      v13 = *(_QWORD *)(a1 + 64);
      if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16))
        goto LABEL_18;
      v24 = 0;
      v14 = "Success";
      v15 = (uint8_t *)&v24;
      break;
    case 2:
      PO_LOG_POAgentAuthenticationProcess();
      v19 = objc_claimAutoreleasedReturnValue();
      v12 = v19;
      v13 = *(_QWORD *)(a1 + 64);
      if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v19))
        goto LABEL_18;
      *(_WORD *)buf = 0;
      v14 = "PermanentFailure";
      v15 = buf;
      break;
    case 4:
      PO_LOG_POAgentAuthenticationProcess();
      v17 = objc_claimAutoreleasedReturnValue();
      v12 = v17;
      v13 = *(_QWORD *)(a1 + 64);
      if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v17))
        goto LABEL_18;
      v23 = 0;
      v14 = "CredentialFailure";
      v15 = (uint8_t *)&v23;
      break;
    case 5:
      PO_LOG_POAgentAuthenticationProcess();
      v18 = objc_claimAutoreleasedReturnValue();
      v12 = v18;
      v13 = *(_QWORD *)(a1 + 64);
      if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v18))
        goto LABEL_18;
      v21 = 0;
      v14 = "Unavailable";
      v15 = (uint8_t *)&v21;
      break;
    default:
      goto LABEL_19;
  }
  _os_signpost_emit_with_name_impl(&dword_22307D000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PlatformSSO_PasswordAuth", v14, v15, 2u);
LABEL_18:

LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "_handleLoginResult:authenticationContext:tokens:passwordContext:tokenId:tokenHash:", a2, v7, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, v20);

}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_132(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), CFSTR("Error evaluating context for User Secure Enclave Key authentication"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

void __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_141(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "requestUserAuthenticationSyncPassword:completion:", 0, &__block_literal_global_143);
  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUserConfiguration");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "setState:", 5);

  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "saveCurrentUserConfigurationAndSyncToPreboot:", 0);

  if ((v3 & 1) == 0)
    v5 = __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_3();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userLoginConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loginUserName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleUserRegistrationForUser:repair:", v7, 1);

}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_3()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after biometric failure."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

void __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_149(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  const char *v12;
  uint8_t *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  __int16 v19;
  uint8_t buf[2];
  __int16 v21;
  __int16 v22;

  v7 = a3;
  v8 = a4;
  switch(a2)
  {
    case 0:
    case 3:
    case 6:
      PO_LOG_POAgentAuthenticationProcess();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = *(_QWORD *)(a1 + 56);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
        goto LABEL_18;
      LOWORD(v18) = 0;
      v12 = "Failed";
      v13 = (uint8_t *)&v18;
      break;
    case 1:
      PO_LOG_POAgentAuthenticationProcess();
      v14 = objc_claimAutoreleasedReturnValue();
      v10 = v14;
      v11 = *(_QWORD *)(a1 + 56);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14))
        goto LABEL_18;
      v22 = 0;
      v12 = "Success";
      v13 = (uint8_t *)&v22;
      break;
    case 2:
      PO_LOG_POAgentAuthenticationProcess();
      v17 = objc_claimAutoreleasedReturnValue();
      v10 = v17;
      v11 = *(_QWORD *)(a1 + 56);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v17))
        goto LABEL_18;
      *(_WORD *)buf = 0;
      v12 = "PermanentFailure";
      v13 = buf;
      break;
    case 4:
      PO_LOG_POAgentAuthenticationProcess();
      v15 = objc_claimAutoreleasedReturnValue();
      v10 = v15;
      v11 = *(_QWORD *)(a1 + 56);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v15))
        goto LABEL_18;
      v21 = 0;
      v12 = "CredentialFailure";
      v13 = (uint8_t *)&v21;
      break;
    case 5:
      PO_LOG_POAgentAuthenticationProcess();
      v16 = objc_claimAutoreleasedReturnValue();
      v10 = v16;
      v11 = *(_QWORD *)(a1 + 56);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16))
        goto LABEL_18;
      v19 = 0;
      v12 = "Unavailable";
      v13 = (uint8_t *)&v19;
      break;
    default:
      goto LABEL_19;
  }
  _os_signpost_emit_with_name_impl(&dword_22307D000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_UserSEPKeyAuth", v12, v13, 2u);
LABEL_18:

LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "_handleLoginResult:authenticationContext:tokens:passwordContext:tokenId:tokenHash:", a2, v7, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, v18);

}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_150()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No SmartCard to use for SmartCard login."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_153()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("Failed to retrieve certificate and key from SmartCard for SmartCard login."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

void __68__POAgentAuthenticationProcess__doLoginWithPasswordContext_tokenId___block_invoke_157(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  const char *v12;
  uint8_t *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  __int16 v19;
  uint8_t buf[2];
  __int16 v21;
  __int16 v22;

  v7 = a3;
  v8 = a4;
  switch(a2)
  {
    case 0:
    case 3:
    case 6:
      PO_LOG_POAgentAuthenticationProcess();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = *(_QWORD *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v9))
        goto LABEL_18;
      LOWORD(v18) = 0;
      v12 = "Failed";
      v13 = (uint8_t *)&v18;
      break;
    case 1:
      PO_LOG_POAgentAuthenticationProcess();
      v14 = objc_claimAutoreleasedReturnValue();
      v10 = v14;
      v11 = *(_QWORD *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v14))
        goto LABEL_18;
      v22 = 0;
      v12 = "Success";
      v13 = (uint8_t *)&v22;
      break;
    case 2:
      PO_LOG_POAgentAuthenticationProcess();
      v17 = objc_claimAutoreleasedReturnValue();
      v10 = v17;
      v11 = *(_QWORD *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v17))
        goto LABEL_18;
      *(_WORD *)buf = 0;
      v12 = "PermanentFailure";
      v13 = buf;
      break;
    case 4:
      PO_LOG_POAgentAuthenticationProcess();
      v15 = objc_claimAutoreleasedReturnValue();
      v10 = v15;
      v11 = *(_QWORD *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v15))
        goto LABEL_18;
      v21 = 0;
      v12 = "CredentialFailure";
      v13 = (uint8_t *)&v21;
      break;
    case 5:
      PO_LOG_POAgentAuthenticationProcess();
      v16 = objc_claimAutoreleasedReturnValue();
      v10 = v16;
      v11 = *(_QWORD *)(a1 + 64);
      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v16))
        goto LABEL_18;
      v19 = 0;
      v12 = "Unavailable";
      v13 = (uint8_t *)&v19;
      break;
    default:
      goto LABEL_19;
  }
  _os_signpost_emit_with_name_impl(&dword_22307D000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PlatformSSO_SmartCard", v12, v13, 2u);
LABEL_18:

LABEL_19:
  objc_msgSend(*(id *)(a1 + 32), "_handleLoginResult:authenticationContext:tokens:passwordContext:tokenId:tokenHash:", a2, v7, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v18);

}

- (void)_handleLoginResult:(unint64_t)a3 authenticationContext:(id)a4 tokens:(id)a5 passwordContext:(id)a6 tokenId:(id)a7 tokenHash:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  POAgentAuthenticationProcess *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
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
  void *v37;
  char v38;
  void *v39;
  void *v40;
  char v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  NSObject *v56;
  NSObject *v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  char v72;
  id v73;
  void *v74;
  void *v75;
  NSObject *v76;
  id v77;
  id v78;
  const __CFString *v79;
  const __CFString *v80;
  uint8_t buf[4];
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = self;
  objc_sync_enter(v19);
  if (PO_LOG_PODiagnostics_once_0 != -1)
    dispatch_once(&PO_LOG_PODiagnostics_once_0, &__block_literal_global_867);
  v20 = (id)PO_LOG_PODiagnostics_log_0;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BE72E90], "stringForLoginResult:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v82 = v21;
    _os_log_impl(&dword_22307D000, v20, OS_LOG_TYPE_DEFAULT, "Login Result = %{public}@", buf, 0xCu);

  }
  v22 = (void *)MEMORY[0x24BE72E78];
  objc_msgSend(MEMORY[0x24BE72E90], "stringForLoginType:", objc_msgSend(v14, "loginType"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE72E90], "stringForLoginResult:", a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "analyticsForLoginType:result:", v23, v24);

  -[POAgentAuthenticationProcess setLastAuthenticationAttempt:](v19, "setLastAuthenticationAttempt:", 0);
  -[POAgentAuthenticationProcess setEnableNetworkChanges:](v19, "setEnableNetworkChanges:", 0);
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
    case 6uLL:
      PO_LOG_POAgentAuthenticationProcess();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v25, OS_LOG_TYPE_INFO, "Authentication failed", buf, 2u);
      }

      v26 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_182();
      if (objc_msgSend(v14, "loginType") == 100)
        -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:](v19, "_doLoginWithPasswordContext:tokenId:", v16, v17);
      goto LABEL_43;
    case 1uLL:
      -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      NSUserName();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "updateLoginStateForUserName:state:loginDate:loginType:", v28, 0, v29, objc_msgSend(v14, "loginType"));

      -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "currentUserConfiguration");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setState:", 0);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "currentUserConfiguration");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setLastLoginDate:", v32);

      -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "deviceConfiguration");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "extensionIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 0;
      v38 = objc_msgSend(v35, "setTokens:extensionIdentifier:returningError:", v15, v37, &v78);
      v77 = v78;

      if ((v38 & 1) != 0)
      {
        -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        NSUserName();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v39, "saveStashedSSOTokens:forUserName:", v15, v40);

        if ((v41 & 1) == 0)
          v42 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_162();
        -[POAgentAuthenticationProcess userNotificationCenter](v19, "userNotificationCenter");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = CFSTR("com.apple.PlatformSSO.authentication");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v80, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "removeDeliveredNotificationsWithIdentifiers:", v44);

        -[POAgentAuthenticationProcess userNotificationCenter](v19, "userNotificationCenter");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = CFSTR("com.apple.PlatformSSO.authentication");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v79, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "removePendingNotificationRequestsWithIdentifiers:", v46);

        -[POAgentAuthenticationProcess setupTimerForAuthentication](v19, "setupTimerForAuthentication");
        objc_msgSend(v14, "loginConfiguration");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "currentUserConfiguration");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[POAgentAuthenticationProcess handleKerberosMappingForTokens:loginConfiguration:userConfiguration:](v19, "handleKerberosMappingForTokens:loginConfiguration:userConfiguration:", v15, v47, v49);

        if (objc_msgSend(v14, "loginType") == 3)
        {
          -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "currentUserConfiguration");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setSmartCardTokenId:", v17);

          -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "currentUserConfiguration");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setSmartCardHash:", v18);

        }
        -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "saveCurrentUserConfigurationAndSyncToPreboot:", 1);

        if ((v55 & 1) != 0)
        {
          a3 = 1;
        }
        else
        {
          v69 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_166();
          a3 = 3;
        }
        -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        NSUserName();
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v70, "savePendingSSOTokens:forUserName:", 0, v71);

        if ((v72 & 1) == 0)
          v73 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_170();
        NSUserName();
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[POAgentAuthenticationProcess handleUserAuthorizationUsing:userName:tokens:configurationManager:](v19, "handleUserAuthorizationUsing:userName:tokens:configurationManager:", v14, v74, v15, v75);

        -[POAgentAuthenticationProcess handleKeyUpdatesWithPasswordContext:](v19, "handleKeyUpdatesWithPasswordContext:", v16);
        -[POAgentAuthenticationProcess handleEncryptionKeyRotation](v19, "handleEncryptionKeyRotation");
        PO_LOG_POAgentAuthenticationProcess();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22307D000, v76, OS_LOG_TYPE_INFO, "Authentication completed successfully", buf, 2u);
        }

LABEL_43:
        -[POAgentAuthenticationProcess notifyKerberosDelegateTGTDidComplete](v19, "notifyKerberosDelegateTGTDidComplete");
        -[POAgentAuthenticationProcess postAuthenticationNotification:](v19, "postAuthenticationNotification:", a3);
      }
      else
      {
        v68 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke();
        -[POAgentAuthenticationProcess postAuthenticationNotification:](v19, "postAuthenticationNotification:", 3);

      }
      objc_sync_exit(v19);

      return;
    case 2uLL:
      PO_LOG_POAgentAuthenticationProcess();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v56, OS_LOG_TYPE_INFO, "Authentication failed and needs repair", buf, 2u);
      }

      -[POAgentAuthenticationProcess handleDeviceAndUserRegistrationForRepair:](v19, "handleDeviceAndUserRegistrationForRepair:", 1);
      a3 = 2;
      goto LABEL_43;
    case 4uLL:
      PO_LOG_POAgentAuthenticationProcess();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v57, OS_LOG_TYPE_INFO, "Authentication failed with invalid credential", buf, 2u);
      }

      if (objc_msgSend(v14, "loginType") == 100)
      {
        -[POAgentAuthenticationProcess _doLoginWithPasswordContext:tokenId:](v19, "_doLoginWithPasswordContext:tokenId:", v16, v17);
      }
      else if (objc_msgSend(v14, "loginType") == 2 || objc_msgSend(v14, "loginType") == 3)
      {
        -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "currentUserConfiguration");
        v64 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v64, "setState:", 5);

        -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v64) = objc_msgSend(v65, "saveCurrentUserConfigurationAndSyncToPreboot:", 1);

        if ((v64 & 1) == 0)
        {
          v66 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_174();
          -[POAgentAuthenticationProcess postAuthenticationNotification:](v19, "postAuthenticationNotification:", 4);
        }
        objc_msgSend(v14, "userName");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[POAgentAuthenticationProcess handleUserRegistrationForUser:repair:newPasswordUser:newSmartCardUser:notified:profile:](v19, "handleUserRegistrationForUser:repair:newPasswordUser:newSmartCardUser:notified:profile:", v67, 1, 0, 0, 0, 0);

      }
      else
      {
        -[POAgentAuthenticationProcess handleUserNeedsReauthenticationAfterDelay:](v19, "handleUserNeedsReauthenticationAfterDelay:", 1.0);
      }
      a3 = 4;
      goto LABEL_43;
    case 5uLL:
      PO_LOG_POAgentAuthenticationProcess();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v58, OS_LOG_TYPE_INFO, "Authentication failed because network is unavailable", buf, 2u);
      }

      -[POAgentAuthenticationProcess setEnableNetworkChanges:](v19, "setEnableNetworkChanges:", 1);
      -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "currentUserConfiguration");
      v60 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v60, "setState:", 1);

      -[POAgentAuthenticationProcess configurationManager](v19, "configurationManager");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v60) = objc_msgSend(v61, "saveCurrentUserConfigurationAndSyncToPreboot:", 0);

      if ((v60 & 1) == 0)
        v62 = __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_178();
      a3 = 5;
      goto LABEL_43;
    default:
      goto LABEL_43;
  }
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save SSO tokens after authentication."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_162()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to stash SSO tokens after successful authentication."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_166()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after successful authentication."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_170()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to clear SSO tokens after successful authentication."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_174()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after credential failure."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_178()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after authentication unavailable."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __114__POAgentAuthenticationProcess__handleLoginResult_authenticationContext_tokens_passwordContext_tokenId_tokenHash___block_invoke_182()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to authenticate user."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (void)handleEncryptionKeyRotation
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

id __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No device configuration for key rotation."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_189()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("No platform SSO Profiles in key rotation."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_193()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Platform SSO extension has changed for key rotation."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_197()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Platform SSO extension not found for key rotation."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

void __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_201(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  if (a2 == 1)
  {
    PO_LOG_POAgentAuthenticationProcess();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_201_cold_2();
    goto LABEL_7;
  }
  if (a2 == 10)
  {
    PO_LOG_POAgentAuthenticationProcess();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_201_cold_1();
LABEL_7:

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDeviceConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDeviceEncryptionKey:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v8, "setEncryptionAlgorithm:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLastEncryptionKeyChange:", v5);

  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v6, "saveDeviceConfiguration:", v8);

  if ((v5 & 1) == 0)
    v7 = __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_202();

}

id __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_202()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save new device configuration during key rotation"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)handleKeyUpdatesWithPasswordContext:(id)a3
{
  NSObject *v3;

  PO_LOG_POAgentAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess handleKeyUpdatesWithPasswordContext:].cold.1();

}

- (void)requestUserAuthenticationWithUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess requestUserAuthenticationWithUserInfo:].cold.1();

  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentUserConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "loginType");

  if (v8 == 1)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __70__POAgentAuthenticationProcess_requestUserAuthenticationWithUserInfo___block_invoke;
    v10[3] = &unk_24EC03020;
    v10[4] = self;
    v11 = v4;
    -[POAgentAuthenticationProcess requestUserAuthenticationSyncPassword:completion:](self, "requestUserAuthenticationSyncPassword:completion:", 1, v10);

  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x24BDDA938]);
    -[POAgentAuthenticationProcess performLoginForCurrentUserWithPasswordContext:tokenId:](self, "performLoginForCurrentUserWithPasswordContext:tokenId:", v9, 0);

  }
}

uint64_t __70__POAgentAuthenticationProcess_requestUserAuthenticationWithUserInfo___block_invoke(uint64_t result, unint64_t a2)
{
  if (a2 <= 6)
  {
    if (((1 << a2) & 0x59) != 0)
    {
      if (*(_QWORD *)(result + 40))
        return objc_msgSend(*(id *)(result + 32), "handleUserNeedsReauthenticationAfterDelay:", 1.0);
    }
    else if (a2 == 2)
    {
      return objc_msgSend(*(id *)(result + 32), "handleDeviceAndUserRegistrationForRepair:", 1);
    }
  }
  return result;
}

- (void)requestUserAuthenticationSyncPassword:(BOOL)a3 completion:(id)a4
{
  NSObject *v4;

  PO_LOG_POAgentAuthenticationProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess requestUserAuthenticationSyncPassword:completion:].cold.1();

}

- (unint64_t)requestSmartCardForBinding:(BOOL)a3 tokenId:(id *)a4 tokenHash:(id *)a5 wrapTokenHash:(id *)a6
{
  NSObject *v6;

  PO_LOG_POAgentAuthenticationProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess requestSmartCardForBinding:tokenId:tokenHash:wrapTokenHash:].cold.1();

  return 0;
}

- (void)requestUserAuthenticationWithWindow:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t);
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  uint8_t v18[16];

  v5 = (void (**)(id, uint64_t))a4;
  PO_LOG_POAgentAuthenticationProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess requestUserAuthenticationWithWindow:completion:].cold.1();

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "state");

    if (v10 != 1)
    {
      v16 = __79__POAgentAuthenticationProcess_requestUserAuthenticationWithWindow_completion___block_invoke();
      goto LABEL_10;
    }
  }
  if (!-[POAgentAuthenticationProcess platformSSOAccount](self, "platformSSOAccount"))
  {
    v15 = __79__POAgentAuthenticationProcess_requestUserAuthenticationWithWindow_completion___block_invoke_210();
LABEL_10:
    v14 = 6;
    goto LABEL_14;
  }
  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentUserConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "loginType");

  if (v13 == 1)
  {
    v14 = 3;
  }
  else
  {
    PO_LOG_POAgentAuthenticationProcess();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_22307D000, v17, OS_LOG_TYPE_INFO, "Not a password user", v18, 2u);
    }

    v14 = 0;
  }
LABEL_14:
  v5[2](v5, v14);

}

id __79__POAgentAuthenticationProcess_requestUserAuthenticationWithWindow_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("No user authentication during registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __79__POAgentAuthenticationProcess_requestUserAuthenticationWithWindow_completion___block_invoke_210()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Not a PlatformSSO account for user authentication."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)showAlertMessage:(id)a3 messageText:(id)a4 completion:(id)a5
{
  void (**v5)(id, uint64_t);
  NSObject *v6;

  v5 = (void (**)(id, uint64_t))a5;
  PO_LOG_POAgentAuthenticationProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess showAlertMessage:messageText:completion:].cold.1();

  v5[2](v5, 3);
}

- (void)showAlertWithError:(id)a3 completion:(id)a4
{
  void (**v4)(id, uint64_t);
  NSObject *v5;

  v4 = (void (**)(id, uint64_t))a4;
  PO_LOG_POAgentAuthenticationProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess showAlertWithError:completion:].cold.1();

  v4[2](v4, 3);
}

- (unint64_t)handleKeyRequestSync
{
  NSObject *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  unint64_t v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  PO_LOG_POAgentAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess handleKeyRequestSync].cold.1();

  v4 = dispatch_semaphore_create(0);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__POAgentAuthenticationProcess_handleKeyRequestSync__block_invoke;
  v8[3] = &unk_24EC03048;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[POAgentAuthenticationProcess handleKeyRequestWithCompletion:](self, "handleKeyRequestWithCompletion:", v8);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

intptr_t __52__POAgentAuthenticationProcess_handleKeyRequestSync__block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)handleKeyRequestWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  os_signpost_id_t v32;
  _QWORD v33[5];
  id v34;
  os_signpost_id_t v35;
  uint64_t v36;
  uint64_t v37;
  id (*v38)();
  void *v39;
  POAgentAuthenticationProcess *v40;
  uint64_t v41;
  uint64_t v42;
  id (*v43)();
  void *v44;
  POAgentAuthenticationProcess *v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  POAgentAuthenticationProcess *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v47 = "-[POAgentAuthenticationProcess handleKeyRequestWithCompletion:]";
    v48 = 2112;
    v49 = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDeviceConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_msgSend(v7, "registrationCompleted") & 1) != 0)
  {
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentLoginConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "currentUserConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "currentRefreshToken");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          PO_LOG_POAgentAuthenticationProcess();
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = os_signpost_id_generate(v14);

          PO_LOG_POAgentAuthenticationProcess();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_22307D000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PlatformSSO_KeyRequest", " enableTelemetry=YES ", buf, 2u);
          }
          v32 = v15;

          objc_msgSend(v11, "userLoginConfiguration");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "mergedConfigurationWithUserLoginConfiguration:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "userLoginConfiguration");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "loginUserName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
          {
            v23 = v21;
          }
          else
          {
            -[POAgentAuthenticationProcess userName](self, "userName");
            v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          v28 = v23;

          -[POAgentAuthenticationProcess authenticationProcess](self, "authenticationProcess");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "createAuthenticationContextUsingLoginConfiguration:deviceConfiguration:userName:", v19, v7, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "setRefreshToken:", v13);
          -[POAgentAuthenticationProcess authenticationProcess](self, "authenticationProcess");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v33[0] = MEMORY[0x24BDAC760];
          v33[1] = 3221225472;
          v33[2] = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_227;
          v33[3] = &unk_24EC03070;
          v35 = v32;
          v33[4] = self;
          v34 = v4;
          objc_msgSend(v31, "performKeyRequestUsingContext:completion:", v30, v33);

        }
        else
        {
          v36 = MEMORY[0x24BDAC760];
          v37 = 3221225472;
          v38 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_224;
          v39 = &unk_24EC025A0;
          v40 = self;
          v27 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_224();
          (*((void (**)(id, uint64_t))v4 + 2))(v4, 3);
        }

      }
      else
      {
        v41 = MEMORY[0x24BDAC760];
        v42 = 3221225472;
        v43 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_221;
        v44 = &unk_24EC025A0;
        v45 = self;
        v26 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_221();
        (*((void (**)(id, uint64_t))v4 + 2))(v4, 3);
      }

    }
    else
    {
      v25 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_217();
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 3);
    }

  }
  else
  {
    v24 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke();
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 3);
  }

}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No device configuration or registration not complete during key request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_217()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No login configuration during key request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_221()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No user configuration during key request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_224()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No refresh token for user during key request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

void __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_227(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  NSObject *v33;
  os_signpost_id_t v34;
  __SecCertificate *v35;
  SecKeyRef v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  NSObject *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  uint8_t v59[16];
  uint64_t v60;
  uint64_t v61;
  id (*v62)();
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id (*v67)();
  void *v68;
  uint64_t v69;
  id v70;
  id v71;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  switch(a2)
  {
    case 0:
    case 3:
    case 4:
    case 6:
      PO_LOG_POAgentAuthenticationProcess();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v15, OS_LOG_TYPE_INFO, "Key request failed", buf, 2u);
      }

      PO_LOG_POAgentAuthenticationProcess();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v16;
      v18 = *(_QWORD *)(a1 + 48);
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22307D000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PlatformSSO_KeyRequest", "Failed", buf, 2u);
      }

      v19 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_238();
      goto LABEL_32;
    case 1:
      PO_LOG_POAgentAuthenticationProcess();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      v34 = *(_QWORD *)(a1 + 48);
      if (v34 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22307D000, v33, OS_SIGNPOST_INTERVAL_END, v34, "PlatformSSO_KeyRequest", "Success", buf, 2u);
      }

      v35 = (__SecCertificate *)objc_msgSend(MEMORY[0x24BE72EF0], "certificateForData:", v13);
      v36 = SecCertificateCopyKey(v35);
      *(_QWORD *)buf = 0;
      v37 = (void *)MEMORY[0x24BE72F10];
      NSUserName();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = 0;
      v71 = 0;
      LOBYTE(v37) = objc_msgSend(v37, "createUnlockKeyWithPublicKey:userName:returningCertificate:hash:encryptedData:", v36, v38, buf, &v71, &v70);
      v58 = v71;
      v56 = v70;

      if ((v37 & 1) != 0)
      {
        if (v36)
          CFRelease(v36);
        objc_msgSend(*(id *)(a1 + 32), "configurationManager", v56);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "currentUserConfiguration");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setUserDecryptionKeyHash:", v58);

        v41 = *(_QWORD *)buf;
        objc_msgSend(*(id *)(a1 + 32), "configurationManager");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "currentUserConfiguration");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setUserDecryptionCertificate:", v41);

        objc_msgSend(*(id *)(a1 + 32), "configurationManager");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "currentUserConfiguration");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setUserDecryptionContext:", v14);

        objc_msgSend(*(id *)(a1 + 32), "configurationManager");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "currentUserConfiguration");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setUserUnlockData:", v57);

        objc_msgSend(*(id *)(a1 + 32), "configurationManager");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "currentUserConfiguration");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setUserUnlockHash:", v12);

        objc_msgSend(*(id *)(a1 + 32), "configurationManager");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "currentUserConfiguration");
        v51 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v51, "setUserUnlockCertificate:", v35);

        objc_msgSend(*(id *)(a1 + 32), "configurationManager");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v51) = objc_msgSend(v52, "saveCurrentUserConfigurationAndSyncToPreboot:", 1);

        if ((v51 & 1) == 0)
        {
          v60 = MEMORY[0x24BDAC760];
          v61 = 3221225472;
          v62 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_232;
          v63 = &unk_24EC025A0;
          v64 = *(_QWORD *)(a1 + 32);
          v53 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_232();
        }
        PO_LOG_POAgentAuthenticationProcess();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v59 = 0;
          _os_log_impl(&dword_22307D000, v54, OS_LOG_TYPE_INFO, "Key request completed successfully", v59, 2u);
        }

LABEL_32:
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        if (v36)
          CFRelease(v36);
        if (v35)
          CFRelease(v35);
        v65 = MEMORY[0x24BDAC760];
        v66 = 3221225472;
        v67 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_229;
        v68 = &unk_24EC025A0;
        v69 = *(_QWORD *)(a1 + 32);
        v55 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_229();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
      return;
    case 2:
      PO_LOG_POAgentAuthenticationProcess();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v20, OS_LOG_TYPE_INFO, "Authentication failed and needs repair", buf, 2u);
      }

      PO_LOG_POAgentAuthenticationProcess();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = *(_QWORD *)(a1 + 48);
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22307D000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PlatformSSO_KeyRequest", "PermanentFailure", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "configurationManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "currentUserConfiguration");
      v25 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v25, "setState:", 2);

      objc_msgSend(*(id *)(a1 + 32), "configurationManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v25) = objc_msgSend(v26, "saveCurrentUserConfigurationAndSyncToPreboot:", 1);

      if ((v25 & 1) == 0)
        v27 = __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_235();
      goto LABEL_32;
    case 5:
      PO_LOG_POAgentAuthenticationProcess();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v28, OS_LOG_TYPE_INFO, "Key request failed because network is unavailable", buf, 2u);
      }

      PO_LOG_POAgentAuthenticationProcess();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = *(_QWORD *)(a1 + 48);
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_22307D000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PlatformSSO_KeyRequest", "Unavailable", buf, 2u);
      }

      goto LABEL_32;
    default:
      goto LABEL_32;
  }
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_229()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to create unlock key."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_232()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after successful key request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_235()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after failed key request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

id __63__POAgentAuthenticationProcess_handleKeyRequestWithCompletion___block_invoke_238()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed key request."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__POConfigurationManager_currentUserConfiguration__block_invoke_cold_1();

  return v0;
}

- (unint64_t)handleTokenBindingWithPasswordContext:(id)a3
{
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  POAgentAuthenticationProcess *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[POAgentAuthenticationProcess handleTokenBindingWithPasswordContext:]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_22307D000, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  return 1;
}

- (void)postAuthenticationNotification:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess postAuthenticationNotification:].cold.1();

  -[POAgentAuthenticationProcess notificationCenter](self, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("authenticationResult");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("com.apple.PlatformSSO.authenticationCompleted"), 0, v8);

  -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.UserRegistrationStatusDidChange"), 0, 0, 1);

}

- (void)showRegistrationUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ssoExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess loadSSOExtensionWithExtensionBundleIdentifier:](self, "loadSSOExtensionWithExtensionBundleIdentifier:", v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setSsoExtension:", v13);

      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ssoExtension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDelegate:", self);

    }
    else
    {
      -[POAgentAuthenticationProcess setRegistrationFailed:](self, "setRegistrationFailed:", 1);
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setState:", 8);

      -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.DeviceRegistrationStatusDidChange"), 0, 0, 1);

      v12 = __50__POAgentAuthenticationProcess_showRegistrationUI__block_invoke();
    }

  }
}

id __50__POAgentAuthenticationProcess_showRegistrationUI__block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Platform SSO extension not found in user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)continueDeviceRegistration:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__POAgentAuthenticationProcess_continueDeviceRegistration___block_invoke;
  block[3] = &unk_24EC02ED0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __59__POAgentAuthenticationProcess_continueDeviceRegistration___block_invoke(uint64_t a1)
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __59__POAgentAuthenticationProcess_continueDeviceRegistration___block_invoke_2;
  activity_block[3] = &unk_24EC02ED0;
  activity_block[4] = *(_QWORD *)(a1 + 32);
  _os_activity_initiate(&dword_22307D000, "PSSODeviceRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __59__POAgentAuthenticationProcess_continueDeviceRegistration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDeviceRegistration");
}

- (void)continueUserRegistration:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__POAgentAuthenticationProcess_continueUserRegistration___block_invoke;
  block[3] = &unk_24EC02ED0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __57__POAgentAuthenticationProcess_continueUserRegistration___block_invoke(uint64_t a1)
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __57__POAgentAuthenticationProcess_continueUserRegistration___block_invoke_2;
  activity_block[3] = &unk_24EC02ED0;
  activity_block[4] = *(_QWORD *)(a1 + 32);
  _os_activity_initiate(&dword_22307D000, "PSSOUserRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __57__POAgentAuthenticationProcess_continueUserRegistration___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startUserRegistration");
}

- (void)exitDeviceRegistration:(id)a3
{
  void *v4;

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrationUI");

  -[POAgentAuthenticationProcess failDeviceRegistrationBeforeAuthorization](self, "failDeviceRegistrationBeforeAuthorization");
  -[POAgentAuthenticationProcess setRegistrationContext:](self, "setRegistrationContext:", 0);
}

- (void)exitUserRegistration:(id)a3
{
  void *v4;

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrationUI");

  -[POAgentAuthenticationProcess failUserRegistrationBeforeAuthorization](self, "failUserRegistrationBeforeAuthorization");
  -[POAgentAuthenticationProcess setRegistrationContext:](self, "setRegistrationContext:", 0);
}

- (void)exitRegistration:(id)a3
{
  void *v4;
  void *v5;

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrationUI");

  -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.DeviceRegistrationStatusDidChange"), 0, 0, 1);

  -[POAgentAuthenticationProcess setRegistrationContext:](self, "setRegistrationContext:", 0);
}

- (BOOL)handleUserNeedsReauthenticationAfterDelay:(double)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
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
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  NSObject *v44;
  id v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  uint64_t v51;
  id (*v52)();
  void *v53;
  id v54;
  uint8_t buf[8];
  uint64_t v56;
  uint64_t v57;
  id (*v58)();
  void *v59;
  id v60;
  const __CFString *v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess handleUserNeedsReauthenticationAfterDelay:].cold.1();

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        -[POAgentAuthenticationProcess registrationContext](self, "registrationContext"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "state"),
        v8,
        v7,
        v9 == 1))
  {
    NSUserName();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[POAgentAuthenticationProcess platformSSOAccount](self, "platformSSOAccount"))
    {
      -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentUserConfiguration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "currentUserConfiguration");
        v14 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v14, "setState:", 1);

        -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v14) = objc_msgSend(v15, "saveCurrentUserConfigurationAndSyncToPreboot:", 0);

        if ((v14 & 1) != 0)
        {
          -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "currentUserConfiguration");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "loginType");

          if (v18 == 1)
          {
            -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "currentLoginConfiguration");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = v20 != 0;
            if (v20)
            {
              -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "currentDeviceConfiguration");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "accountDisplayName");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v24;
              if (!v24)
              {
                objc_msgSend(v20, "accountDisplayName");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v47 = v20;
              -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "currentDeviceConfiguration");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "extensionIdentifier");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[POAgentAuthenticationProcess createSignInNotificationWithAccountName:extensionIdentifier:](self, "createSignInNotificationWithAccountName:extensionIdentifier:", v25, v28);
              v46 = objc_claimAutoreleasedReturnValue();

              if (!v24)
              -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v62[0] = CFSTR("com.apple.PlatformSSO.authentication");
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "removeDeliveredNotificationsWithIdentifiers:", v30);

              -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v61 = CFSTR("com.apple.PlatformSSO.authentication");
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v61, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "removePendingNotificationRequestsWithIdentifiers:", v32);

              v33 = (void *)MEMORY[0x24BDF8858];
              objc_msgSend(MEMORY[0x24BDF88B0], "triggerWithTimeInterval:repeats:", 0, a3);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.PlatformSSO.authentication"), v46, v34, 5);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              PO_LOG_POAgentAuthenticationProcess();
              v36 = objc_claimAutoreleasedReturnValue();
              v37 = (void *)v46;
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_22307D000, v36, OS_LOG_TYPE_INFO, "Sending login notification", buf, 2u);
              }

              -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v48[0] = MEMORY[0x24BDAC760];
              v48[1] = 3221225472;
              v48[2] = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_263;
              v48[3] = &unk_24EC030C0;
              v49 = v10;
              objc_msgSend(v38, "addNotificationRequest:withCompletionHandler:", v35, v48);

              v20 = v47;
            }
            else
            {
              v50 = MEMORY[0x24BDAC760];
              v51 = 3221225472;
              v52 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_258;
              v53 = &unk_24EC025A0;
              v54 = v10;
              v45 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_258();
              v37 = v54;
            }

          }
          else
          {
            PO_LOG_POAgentAuthenticationProcess();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_22307D000, v44, OS_LOG_TYPE_INFO, "Not a password user", buf, 2u);
            }

            -[POAgentAuthenticationProcess performLoginForCurrentUserWithPasswordContext:](self, "performLoginForCurrentUserWithPasswordContext:", 0);
            v21 = 1;
          }
          goto LABEL_22;
        }
        v42 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_254();
      }
      else
      {
        v56 = MEMORY[0x24BDAC760];
        v57 = 3221225472;
        v58 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_251;
        v59 = &unk_24EC025A0;
        v60 = v10;
        v41 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_251();

      }
    }
    else
    {
      v39 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_247();
    }
    v21 = 0;
LABEL_22:

    return v21;
  }
  v40 = __79__POAgentAuthenticationProcess_requestUserAuthenticationWithWindow_completion___block_invoke();
  return 0;
}

id __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_247()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Not a PlatformSSO account during authentication notification."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_251()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No user configuration for user for authentication notification."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __55__POConfigurationManager_userConfigurationForUserName___block_invoke_cold_1();

  return v0;
}

id __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_254()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration before authentication notification."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_258()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No login configuration for user for authentication notification."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __55__POConfigurationManager_userConfigurationForUserName___block_invoke_cold_1();

  return v0;
}

void __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_263(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    v6[1] = 3221225472;
    v6[2] = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_2;
    v6[3] = &unk_24EC03098;
    v5 = v3;
    v6[0] = MEMORY[0x24BDAC760];
    v7 = v3;
    v8 = *(id *)(a1 + 32);
    v4 = __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_2((uint64_t)v6);

    v3 = v5;
  }

}

id __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error sending authentication notification."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_2_cold_1();

  return v1;
}

- (unint64_t)requestUserPasswordChangePreference
{
  NSObject *v2;

  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess requestUserPasswordChangePreference].cold.1();

  return 0;
}

- (void)handleUserCredentialNeededAtLogin:(BOOL)a3 smartCard:(BOOL)a4 accountDisplayName:(id)a5 bundleIdentifier:(id)a6 returningContext:(id *)a7
{
  NSObject *v8;

  PO_LOG_POAgentAuthenticationProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess handleUserCredentialNeededAtLogin:smartCard:accountDisplayName:bundleIdentifier:returningContext:].cold.1();

  if (a7)
    *a7 = 0;
}

- (BOOL)handleUserAuthorizationNeededForAccountDisplayName:(id)a3 bundleIdentifier:(id)a4
{
  NSObject *v4;

  PO_LOG_POAgentAuthenticationProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess handleUserAuthorizationNeededForAccountDisplayName:bundleIdentifier:].cold.1();

  return 1;
}

- (void)_startDeviceRegistration
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  BOOL v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  const char *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  void *v89;
  void *v90;
  int v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  char v151;
  NSObject *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  char v165;
  NSObject *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  int v180;
  NSObject *v181;
  void *v182;
  void *v183;
  void *v184;
  char v185;
  void *v186;
  void *v187;
  void *v188;
  _BOOL4 v189;
  id v190;
  void *v191;
  void *v192;
  void *v193;
  uint64_t v194;
  void *v195;
  NSObject *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  char v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  BOOL v210;
  uint64_t v211;
  _QWORD v212[6];
  char v213;
  id v214;
  id v215;
  id v216;
  id v217;
  uint8_t buf[4];
  const char *v219;
  __int16 v220;
  POAgentAuthenticationProcess *v221;
  uint64_t v222;

  v222 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v219 = "-[POAgentAuthenticationProcess _startDeviceRegistration]";
    v220 = 2112;
    v221 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setState:", 4);

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ssoExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extensionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess loadSSOExtensionWithExtensionBundleIdentifier:](self, "loadSSOExtensionWithExtensionBundleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[POAgentAuthenticationProcess setRegistrationFailed:](self, "setRegistrationFailed:", 1);
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setState:", 5);

      -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.DeviceRegistrationStatusDidChange"), 0, 0, 1);

      v70 = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke();
      return;
    }
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSsoExtension:", v9);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ssoExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

  }
  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enablePlatformSSORulesIfNeeded:", &__block_literal_global_272);

  -[POAgentAuthenticationProcess jwksStorageProvider](self, "jwksStorageProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "extensionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setJwksCache:forExtensionIdentifier:", 0, v16);

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = objc_msgSend(v17, "isRepair");

  if ((_DWORD)v15)
    v18 = 2;
  else
    v18 = 0;
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "userNotified");

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "userNotified"))
  {

    if ((v20 & 1) == 0)
    {
LABEL_11:
      v20 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "registrationToken");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v20 ^ 1;
    if (v23)
      v24 = 1;
    if ((v24 & 1) != 0)
      goto LABEL_11;
  }
  v18 |= 1uLL;
LABEL_16:
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "useSharedDeviceKeys");

  if (v26)
    v27 = v18 | 4;
  else
    v27 = v18;
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "migratingDeviceKeys");

  if (v29)
    v30 = v27 | 8;
  else
    v30 = v27;
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "authMethod");

  if (v32 == 3)
  {
    -[POAgentAuthenticationProcess tokenHelper](self, "tokenHelper");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "userName");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = 0;
    objc_msgSend(v33, "findTokenIdForSmartCardBoundUser:tokenHash:", v35, &v217);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v217;
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setSmartCardTokenId:", v36);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "smartCardTokenId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "length");

    if (!v41)
    {
      -[POAgentAuthenticationProcess tokenHelper](self, "tokenHelper");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "userName");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v216 = v37;
      objc_msgSend(v42, "findTokenIdForSmartCardAMUser:tokenHash:", v44, &v216);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v216;

      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setSmartCardTokenId:", v45);

      v37 = v46;
    }
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setSmartCardHash:", v37);

  }
  if (v20)
  {
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "userIsPlatformSSOUser");

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if ((v50 & 1) == 0)
    {
      objc_msgSend(v51, "profile");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "accountDisplayName");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "extensionIdentifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = -[POAgentAuthenticationProcess handleUserAuthorizationNeededForAccountDisplayName:bundleIdentifier:](self, "handleUserAuthorizationNeededForAccountDisplayName:bundleIdentifier:", v64, v66);

      if (!v67)
      {
        PO_LOG_POAgentAuthenticationProcess();
        v78 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          goto LABEL_100;
        *(_WORD *)buf = 0;
        v79 = "Authorization not provided, starting over.";
        goto LABEL_99;
      }
LABEL_32:
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v60 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setAuthorizationProvided:", 1);
      goto LABEL_43;
    }
    v53 = objc_msgSend(v51, "authMethod");

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if (v53 == 1)
    {
      objc_msgSend(v54, "profile");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "accountDisplayName");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "extensionIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v215 = 0;
      -[POAgentAuthenticationProcess handleUserCredentialNeededAtLogin:smartCard:accountDisplayName:bundleIdentifier:returningContext:](self, "handleUserCredentialNeededAtLogin:smartCard:accountDisplayName:bundleIdentifier:returningContext:", 0, 0, v57, v59, &v215);
      v60 = v215;

      if (v60)
      {
LABEL_30:
        -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setCredentialContext:", v60);

        -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setAuthorizationProvided:", 1);

LABEL_43:
        goto LABEL_44;
      }
      PO_LOG_POAgentAuthenticationProcess();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v79 = "Credential not provided, starting over.";
        goto LABEL_99;
      }
LABEL_100:

      -[POAgentAuthenticationProcess failDeviceRegistrationBeforeAuthorization](self, "failDeviceRegistrationBeforeAuthorization");
      return;
    }
    if (objc_msgSend(v54, "authMethod") == 3)
    {
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "smartCardTokenId");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v72)
      {
        -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "profile");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "accountDisplayName");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "extensionIdentifier");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v214 = 0;
        -[POAgentAuthenticationProcess handleUserCredentialNeededAtLogin:smartCard:accountDisplayName:bundleIdentifier:returningContext:](self, "handleUserCredentialNeededAtLogin:smartCard:accountDisplayName:bundleIdentifier:returningContext:", 0, 1, v75, v77, &v214);
        v60 = v214;

        if (v60)
          goto LABEL_30;
        PO_LOG_POAgentAuthenticationProcess();
        v78 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          goto LABEL_100;
        *(_WORD *)buf = 0;
        v79 = "Credential not provided, starting over.";
LABEL_99:
        _os_log_impl(&dword_22307D000, v78, OS_LOG_TYPE_INFO, v79, buf, 2u);
        goto LABEL_100;
      }
    }
    else
    {

    }
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v60 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v60, "authMethod") == 1)
      goto LABEL_43;
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    v204 = objc_msgSend(v203, "isNewPasswordUser");

    if ((v204 & 1) == 0)
    {
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "profile");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v206, "accountDisplayName");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v208, "extensionIdentifier");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      v210 = -[POAgentAuthenticationProcess handleUserAuthorizationNeededForAccountDisplayName:bundleIdentifier:](self, "handleUserAuthorizationNeededForAccountDisplayName:bundleIdentifier:", v207, v209);

      if (!v210)
      {
        PO_LOG_POAgentAuthenticationProcess();
        v78 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          goto LABEL_100;
        *(_WORD *)buf = 0;
        v79 = "Authorization not provided, starting over.";
        goto LABEL_99;
      }
      goto LABEL_32;
    }
  }
LABEL_44:
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "userNotified");

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v81, "isRepair"))
  {
    v88 = 1;
    v91 = 1;
LABEL_50:

    goto LABEL_51;
  }
  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "currentDeviceConfiguration");
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  if (v83)
  {
    PO_LOG_POAgentAuthenticationProcess();
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22307D000, v84, OS_LOG_TYPE_INFO, "Verifying device keys", buf, 2u);
    }

    v85 = (void *)MEMORY[0x24BE72EF0];
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "currentDeviceConfiguration");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v85, "verifyKey:", objc_msgSend(v87, "deviceEncryptionKey"));

    v89 = (void *)MEMORY[0x24BE72EF0];
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "currentDeviceConfiguration");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v89, "verifyKey:", objc_msgSend(v90, "deviceSigningKey"));

    goto LABEL_50;
  }
  v88 = 1;
  v91 = 1;
LABEL_51:
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext", v30);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v92, "isRepair"))
  {
LABEL_56:

LABEL_57:
    PO_LOG_POAgentAuthenticationProcess();
    v97 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v219 = "-[POAgentAuthenticationProcess _startDeviceRegistration]";
      v220 = 2112;
      v221 = self;
      _os_log_impl(&dword_22307D000, v97, OS_LOG_TYPE_DEFAULT, "%s creating new device configuration on %@", buf, 0x16u);
    }

    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "currentDeviceConfiguration");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v99;
    if (v99)
      v101 = v99;
    else
      v101 = objc_alloc_init(MEMORY[0x24BE72EA8]);
    v102 = v101;

    objc_msgSend(v102, "setRegistrationCompleted:", 0);
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "extensionIdentifier");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setExtensionIdentifier:", v104);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setProtocolVersion:", objc_msgSend(v105, "protocolVersion"));

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "profile");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setCreateUsersEnabled:", objc_msgSend(v107, "createUsersEnabled"));

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "profile");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setAuthorizationEnabled:", objc_msgSend(v109, "authorizationEnabled"));

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "profile");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "tokenToUserMapping");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setTokenToUserMapping:", v112);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "profile");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setNewUserAuthorizationMode:", objc_msgSend(v114, "newUserAuthorizationMode"));

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "profile");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setUserAuthorizationMode:", objc_msgSend(v116, "userAuthorizationMode"));

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "profile");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "administratorGroups");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setAdministratorGroups:", v119);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "profile");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v121, "authorizationGroups");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setAuthorizationGroups:", v122);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "profile");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "otherGroups");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setOtherGroups:", v125);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "profile");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "accountDisplayName");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setAccountDisplayName:", v128);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "profile");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "loginFrequency");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setLoginFrequency:", v131);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "ssoExtension");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "sdkVersionString");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setSdkVersionString:", v134);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setLoginType:", (int)objc_msgSend(v135, "authMethod"));

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "profile");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setFileVaultPolicy:", objc_msgSend(v137, "fileVaultPolicy"));

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "profile");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setLoginPolicy:", objc_msgSend(v139, "loginPolicy"));

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "profile");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setUnlockPolicy:", objc_msgSend(v141, "unlockPolicy"));

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "profile");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setOfflineGracePeriod:", objc_msgSend(v143, "offlineGracePeriod"));

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "profile");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v145, "nonPlatformSSOAccounts");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setNonPlatformSSOAccounts:", v146);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "profile");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setRequireAuthGracePeriod:", objc_msgSend(v148, "requireAuthGracePeriod"));

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setAuthGracePeriodStart:", v149);

    if (!objc_msgSend(v102, "deviceSigningKey")
      || (-[POAgentAuthenticationProcess registrationContext](self, "registrationContext"),
          v150 = (void *)objc_claimAutoreleasedReturnValue(),
          v151 = objc_msgSend(v150, "deviceKeysShouldChange"),
          v150,
          (v151 & 1) != 0)
      || v91 != 1)
    {
      PO_LOG_POAgentAuthenticationProcess();
      v152 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v152, OS_LOG_TYPE_INFO, "Creating new signing key", buf, 2u);
      }

      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "ssoExtension");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess deviceSigningAlgorithmToUse:deviceConfiguration:](self, "deviceSigningAlgorithmToUse:deviceConfiguration:", v154, v102);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "setSigningAlgorithm:", v155);

      v157 = (void *)MEMORY[0x24BE72EF0];
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "signingAlgorithm");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setDeviceSigningKey:", objc_msgSend(v157, "createSEPSigningKeyForAlgorithm:shared:", v159, objc_msgSend(v160, "useSharedDeviceKeys")));

      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setSharedDeviceKeys:", objc_msgSend(v161, "useSharedDeviceKeys"));

      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "signingAlgorithm");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setSigningAlgorithm:", v163);

      objc_msgSend(v102, "setPendingSigningAlgorithm:", 0);
    }
    if (!objc_msgSend(v102, "deviceEncryptionKey")
      || (-[POAgentAuthenticationProcess registrationContext](self, "registrationContext"),
          v164 = (void *)objc_claimAutoreleasedReturnValue(),
          v165 = objc_msgSend(v164, "deviceKeysShouldChange"),
          v164,
          (v165 & 1) != 0)
      || v88 != 1)
    {
      PO_LOG_POAgentAuthenticationProcess();
      v166 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v166, OS_LOG_TYPE_INFO, "Creating new encryption key", buf, 2u);
      }

      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "ssoExtension");
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess deviceEncryptionAlgorithmToUse:deviceConfiguration:](self, "deviceEncryptionAlgorithmToUse:deviceConfiguration:", v168, v102);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "setEncryptionAlgorithm:", v169);

      v171 = (void *)MEMORY[0x24BE72EF0];
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v172, "encryptionAlgorithm");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setDeviceEncryptionKey:", objc_msgSend(v171, "createSEPEncryptionKeyForAlgorithm:shared:", v173, objc_msgSend(v174, "useSharedDeviceKeys")));

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setLastEncryptionKeyChange:", v175);

      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setSharedDeviceKeys:", objc_msgSend(v176, "useSharedDeviceKeys"));

      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "encryptionAlgorithm");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setEncryptionAlgorithm:", v178);

      objc_msgSend(v102, "setPendingEncryptionAlgorithm:", 0);
    }
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = objc_msgSend(v179, "deviceKeysShouldChange");

    if (v180)
    {
      PO_LOG_POAgentAuthenticationProcess();
      v181 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v181, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v181, OS_LOG_TYPE_INFO, "Keys have changed", buf, 2u);
      }

      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "setDeviceKeysShouldChange:", 0);

    }
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "setSharedOnly:", 0);

    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = objc_msgSend(v184, "saveDeviceConfiguration:", v102);

    if ((v185 & 1) == 0)
    {
      v190 = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_274();
      -[POAgentAuthenticationProcess handleDeviceAndUserRegistrationForRepair:](self, "handleDeviceAndUserRegistrationForRepair:", 1);

      return;
    }

    goto LABEL_80;
  }
  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "currentDeviceConfiguration");
  v94 = objc_claimAutoreleasedReturnValue();
  if (!v94)
  {
LABEL_55:

    goto LABEL_56;
  }
  v95 = (void *)v94;
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v96, "deviceKeysShouldChange") & 1) != 0)
  {

    goto LABEL_55;
  }

  if ((v88 & v91 & 1) == 0)
    goto LABEL_57;
LABEL_80:
  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v186, "currentDeviceConfiguration");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v187, "pendingSigningAlgorithm");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  if (v188)
  {
    v189 = 1;
  }
  else
  {
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v191, "currentDeviceConfiguration");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v192, "pendingEncryptionAlgorithm");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = v193 != 0;

  }
  if (v189)
    v194 = v211 | 0x10;
  else
    v194 = v211;
  -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v195, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.DeviceRegistrationStatusDidChange"), 0, 0, 1);

  PO_LOG_POAgentAuthenticationProcess();
  v196 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22307D000, v196, OS_LOG_TYPE_INFO, "Sending beginDeviceRegistration", buf, 2u);
  }

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v197, "setOptions:", v194);

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v198, "ssoExtension");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v200, "profile");
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v201, "extensionData");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v212[0] = MEMORY[0x24BDAC760];
  v212[1] = 3221225472;
  v212[2] = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_278;
  v212[3] = &unk_24EC03130;
  v212[4] = self;
  v212[5] = v194;
  v213 = v20;
  objc_msgSend(v199, "beginDeviceRegistrationUsingOptions:extensionData:completion:", v194, v202, v212);

}

id __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Platform SSO extension not found in device registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_274()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save new device configuration during device registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

void __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_278(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  char v40;
  _QWORD v41[5];
  char v42;
  _QWORD activity_block[5];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v45 = v5;
    _os_log_impl(&dword_22307D000, v4, OS_LOG_TYPE_INFO, "registrationResult = %{public}@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BE72E78], "analyticsForRegistrationType:options:result:", CFSTR("device"), *(_QWORD *)(a1 + 40), a2);
  switch(a2)
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "configurationManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentDeviceConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v33 = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_281();
LABEL_24:
        objc_msgSend(*(id *)(a1 + 32), "handleDeviceAndUserRegistrationForRepair:", 1);
        goto LABEL_21;
      }
      objc_msgSend(v7, "setRegistrationCompleted:", 1);
      objc_msgSend(*(id *)(a1 + 32), "configurationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "saveDeviceConfiguration:", v7);

      if ((v9 & 1) == 0)
      {
        v34 = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_285();
        goto LABEL_24;
      }
      objc_msgSend(*(id *)(a1 + 32), "registrationContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "userIsPlatformSSOUser");

      if ((v11 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "registrationContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setState:", 6);

        objc_msgSend(*(id *)(a1 + 32), "registrationContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "userNotified");

        if (v14)
        {
          activity_block[0] = MEMORY[0x24BDAC760];
          activity_block[1] = 3221225472;
          activity_block[2] = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_289;
          activity_block[3] = &unk_24EC02ED0;
          activity_block[4] = *(_QWORD *)(a1 + 32);
          _os_activity_initiate(&dword_22307D000, "PSSOUserRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "promptUserForRegistration");
        }

LABEL_20:
        objc_msgSend(*(id *)(a1 + 32), "distributedNotificationCenter");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.DeviceRegistrationStatusDidChange"), 0, 0, 1);
      }
      else
      {
        PO_LOG_POAgentAuthenticationProcess();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_278_cold_1();

        objc_msgSend(*(id *)(a1 + 32), "registrationContext");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "ssoExtension");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "close");

        objc_msgSend(*(id *)(a1 + 32), "finishRegistrationWithStatus:", 1);
        objc_msgSend(*(id *)(a1 + 32), "distributedNotificationCenter");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.DeviceRegistrationStatusDidChange"), 0, 0, 1);

      }
LABEL_21:

      return;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "registrationContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setRetry:", 1);

      v16 = *(unsigned __int8 *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "registrationContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16)
        v19 = 3;
      else
        v19 = 5;
      objc_msgSend(v17, "setState:", v19);

      PO_LOG_POAgentAuthenticationProcess();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v45 = "-[POAgentAuthenticationProcess _startDeviceRegistration]_block_invoke_2";
        v46 = 2112;
        v47 = v21;
        _os_log_impl(&dword_22307D000, v20, OS_LOG_TYPE_DEFAULT, "%s calling registrationDidComplete on %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("REGISTRATION_FAILED_RETRY_TEXT"), &stru_24EC04270, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "registrationContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "ssoExtension");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_292;
      v41[3] = &unk_24EC03108;
      v41[4] = *(_QWORD *)(a1 + 32);
      v42 = *(_BYTE *)(a1 + 48);
      v27 = v41;
      goto LABEL_19;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "registrationContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setState:", 3);

      objc_msgSend(*(id *)(a1 + 32), "promptUserForRegistration");
      goto LABEL_20;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "setRegistrationFailed:", 1);
      objc_msgSend(*(id *)(a1 + 32), "registrationContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setState:", 5);

      PO_LOG_POAgentAuthenticationProcess();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v45 = "-[POAgentAuthenticationProcess _startDeviceRegistration]_block_invoke_2";
        v46 = 2112;
        v47 = v31;
        _os_log_impl(&dword_22307D000, v30, OS_LOG_TYPE_DEFAULT, "%s calling registrationDidComplete on %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("REGISTRATION_FAILED_NO_RETRY_TEXT"), &stru_24EC04270, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "registrationContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "ssoExtension");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_295;
      v39[3] = &unk_24EC03108;
      v39[4] = *(_QWORD *)(a1 + 32);
      v40 = *(_BYTE *)(a1 + 48);
      v27 = v39;
LABEL_19:
      objc_msgSend(v25, "registrationDidCompleteWithCompletion:", v27);

      goto LABEL_20;
    case 10:
      return;
    default:
      goto LABEL_20;
  }
}

id __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_281()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("Failed to find device configuration after successful device registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_285()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save device configuration after successful device registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

uint64_t __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_289(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startUserRegistration");
}

void __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_292(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ssoExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unload");

  v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v4, "promptUserForRegistration");
  }
  else
  {
    objc_msgSend(v4, "registrationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registrationUI");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      objc_msgSend(*(id *)(a1 + 32), "setRegistrationContext:", 0);
  }
}

void __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_295(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ssoExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unload");

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "registrationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registrationUI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      objc_msgSend(*(id *)(a1 + 32), "setRegistrationContext:", 0);
  }
}

- (void)failDeviceRegistrationBeforeAuthorization
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  POAgentAuthenticationProcess *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[POAgentAuthenticationProcess failDeviceRegistrationBeforeAuthorization]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v10, 0x16u);
  }

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRetry:", 1);

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", 5);

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAuthorizationProvided:", 0);

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registrationUI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[POAgentAuthenticationProcess promptUserForRegistration](self, "promptUserForRegistration");
  -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.DeviceRegistrationStatusDidChange"), 0, 0, 1);

}

- (void)_startUserRegistration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "New user binding failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_298()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to create key durng user user registration because touchID or watch is not available."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_304()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save new user configuration during user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

void __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_308(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  char v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[5];
  _QWORD v81[5];
  id v82;
  _QWORD v83[5];
  _QWORD v84[4];
  id v85;
  id v86;
  uint8_t buf[4];
  const char *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  uint64_t v92;
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    v88 = "-[POAgentAuthenticationProcess _startUserRegistration]_block_invoke";
    v89 = 2114;
    v90 = v5;
    v91 = 2112;
    v92 = v6;
    _os_log_impl(&dword_22307D000, v4, OS_LOG_TYPE_DEFAULT, "%s registrationResult = %{public}@ on %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BE72E78], "analyticsForRegistrationType:options:result:", CFSTR("user"), *(_QWORD *)(a1 + 40), a2);
  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ssoExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "close");

  switch(a2)
  {
    case 0:
      if ((*(_BYTE *)(a1 + 40) & 8) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "configurationManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "removeUserDeviceConfiguration");

        if ((v10 & 1) == 0)
          v11 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_311();
        objc_msgSend(*(id *)(a1 + 32), "configurationManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "removeUserLoginConfiguration");

        if ((v13 & 1) == 0)
          v14 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_315();
      }
      objc_msgSend(*(id *)(a1 + 32), "configurationManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "currentUserConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "registrationContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "authMethod");

      if (v18 == 1)
      {
        v19 = (void *)MEMORY[0x24BE72EA0];
        objc_msgSend(*(id *)(a1 + 32), "registrationContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "credentialContext");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = 0;
        objc_msgSend(v19, "passwordDataFromContext:error:", v21, &v86);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v86;

        if (v22)
        {
          objc_msgSend(*(id *)(a1 + 32), "keyWrap");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "wrapBlob:", v22);
          v25 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "set_credential:", v25);

          v26 = objc_retainAutorelease(v22);
          memset_s((void *)objc_msgSend(v26, "mutableBytes"), objc_msgSend(v26, "length"), 0, objc_msgSend(v26, "length"));
          objc_msgSend(*(id *)(a1 + 32), "configurationManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v25) = objc_msgSend(v27, "saveCurrentUserConfigurationAndSyncToPreboot:", 0);

          if ((v25 & 1) == 0)
            v28 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_322();
        }
        else
        {
          v84[0] = MEMORY[0x24BDAC760];
          v84[1] = 3221225472;
          v84[2] = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_319;
          v84[3] = &unk_24EC025A0;
          v85 = v23;
          v38 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_319((uint64_t)v84);

        }
      }
      else
      {
        v23 = 0;
      }
      objc_msgSend(*(id *)(a1 + 32), "registrationContext");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "ssoExtension");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "sdkVersionString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "compare:", &unk_24EC10BA0);

      objc_msgSend(*(id *)(a1 + 32), "registrationContext");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isNewPasswordUser");
      if (v42 == -1)
      {
        if ((v44 & 1) != 0)
        {
          v47 = 0;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "registrationContext");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "isNewSmartCarddUser");

          v47 = v55 ^ 1u;
        }

        PO_LOG_POAgentAuthenticationProcess();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          v57 = *(void **)(a1 + 32);
          *(_DWORD *)buf = 136315394;
          v88 = "-[POAgentAuthenticationProcess _startUserRegistration]_block_invoke";
          v89 = 2112;
          v90 = v57;
          _os_log_impl(&dword_22307D000, v56, OS_LOG_TYPE_DEFAULT, "%s calling registrationDidComplete on %@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 32), "registrationContext");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "ssoExtension");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v83[0] = MEMORY[0x24BDAC760];
        v83[1] = 3221225472;
        v83[2] = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_326;
        v83[3] = &unk_24EC02ED0;
        v83[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v59, "registrationDidCompleteWithCompletion:", v83);

        objc_msgSend(*(id *)(a1 + 32), "setRegistrationFailed:", 0);
        objc_msgSend(*(id *)(a1 + 32), "distributedNotificationCenter");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.UserRegistrationStatusDidChange"), 0, 0, 1);

        objc_msgSend(*(id *)(a1 + 32), "registrationContext");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setState:", 1);

        objc_msgSend(*(id *)(a1 + 32), "configurationManager");
        v62 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v62, "currentUserConfiguration");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setState:", v47);

        objc_msgSend(*(id *)(a1 + 32), "configurationManager");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v62) = objc_msgSend(v64, "saveCurrentUserConfigurationAndSyncToPreboot:", 0);

        if ((v62 & 1) == 0)
          v65 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2();
        objc_msgSend(*(id *)(a1 + 32), "registrationContext");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = objc_msgSend(v66, "isRepair");

        v68 = *(void **)(a1 + 32);
        if (v67)
        {
          objc_msgSend(v68, "registrationContext");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "credentialContext");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "performLoginForCurrentUserWithPasswordContext:", v70);

        }
        else
        {
          objc_msgSend(v68, "performLoginForCurrentUserWithPasswordContext:", 0);
        }
      }
      else
      {
        if ((v44 & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "registrationContext");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "newUserBindingComplete");

          if (v46)
            goto LABEL_47;
        }
        else
        {

        }
        objc_msgSend(*(id *)(a1 + 32), "configurationManager");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "currentDeviceConfiguration");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v49, "supportsTokenUnlock") & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "registrationContext");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "authMethod");

          if (v51 == 1)
          {
            v52 = *(void **)(a1 + 32);
            v81[0] = MEMORY[0x24BDAC760];
            v81[1] = 3221225472;
            v81[2] = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_330;
            v81[3] = &unk_24EC03020;
            v81[4] = v52;
            v82 = v23;
            objc_msgSend(v52, "requestUserAuthenticationSyncPassword:completion:", 1, v81);

            goto LABEL_49;
          }
        }
        else
        {

        }
        objc_msgSend(*(id *)(a1 + 32), "registrationContext");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v53, "isNewPasswordUser"))
        {

LABEL_47:
          objc_msgSend(*(id *)(a1 + 32), "configurationManager");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "currentUserConfiguration");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "setState:", 0);

LABEL_48:
          objc_msgSend(*(id *)(a1 + 32), "finishRegistrationWithStatus:", 1);
          goto LABEL_49;
        }
        objc_msgSend(*(id *)(a1 + 32), "registrationContext");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(v71, "isNewSmartCarddUser");

        if (v72)
          goto LABEL_47;
        objc_msgSend(*(id *)(a1 + 32), "registrationContext");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v75, "authMethod");

        v77 = *(void **)(a1 + 32);
        if (v76 != 1)
        {
          objc_msgSend(v77, "configurationManager");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "currentUserConfiguration");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setState:", 1);

          objc_msgSend(*(id *)(a1 + 32), "performLoginForCurrentUserWithPasswordContext:", 0);
          goto LABEL_48;
        }
        v80[0] = MEMORY[0x24BDAC760];
        v80[1] = 3221225472;
        v80[2] = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_343;
        v80[3] = &unk_24EC03158;
        v80[4] = v77;
        objc_msgSend(v77, "requestUserAuthenticationSyncPassword:completion:", 1, v80);
      }
LABEL_49:

      return;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "finishRegistrationWithRetry");
      return;
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "registrationContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setState:", 6);

      objc_msgSend(*(id *)(a1 + 32), "promptUserForRegistration");
      return;
    case 3:
      PO_LOG_POAgentAuthenticationProcess();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v88 = "-[POAgentAuthenticationProcess _startUserRegistration]_block_invoke_2";
        v89 = 2112;
        v90 = v31;
        _os_log_impl(&dword_22307D000, v30, OS_LOG_TYPE_DEFAULT, "%s removing user configuration on %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "registrationContext");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "isRetry"))
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "configurationManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "registrationContext");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "userName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v33, "removeUserConfigurationForUserName:", v35);

        if ((v36 & 1) == 0)
          v37 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_345();
      }
      objc_msgSend(*(id *)(a1 + 32), "finishRegistrationWithStatus:", 0);
      return;
    default:
      return;
  }
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_311()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to remove user device configuration after successful user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_315()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to remove user login configuration after successful user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_319(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to find user credential after successful user registration."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_322()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after successful user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

void __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_326(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ssoExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unload");

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrationUI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "setRegistrationContext:", 0);
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after successful SDK 13 user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

void __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_330(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;

  if (a2 == 1)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDDA938]);
    objc_msgSend(*(id *)(a1 + 32), "registrationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCredentialContext:", v3);

    objc_msgSend(*(id *)(a1 + 32), "keyWrap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configurationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentUserConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_credential");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unwrapBlob:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "setCredential:type:", v9, -9);
      v10 = objc_retainAutorelease(v9);
      memset_s((void *)objc_msgSend(v10, "mutableBytes"), objc_msgSend(v10, "length"), 0, objc_msgSend(v10, "length"));
      v11 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_334;
      v17[3] = &unk_24EC03158;
      v17[4] = v11;
      objc_msgSend(v11, "handleKeyRequestWithCompletion:", v17);
    }
    else
    {
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2_331;
      v18[3] = &unk_24EC025A0;
      v19 = *(id *)(a1 + 40);
      v16 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2_331((uint64_t)v18);
      objc_msgSend(*(id *)(a1 + 32), "finishRegistrationWithRetry");

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRegistrationWithRetry");
    objc_msgSend(*(id *)(a1 + 32), "configurationManager");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v12, "currentUserConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setState:", 3);

    objc_msgSend(*(id *)(a1 + 32), "configurationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v14, "saveCurrentUserConfigurationAndSyncToPreboot:", 1);

    if ((v12 & 1) == 0)
      v15 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_339();
  }
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2_331(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to find user credential after successful authentication during user registration."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

void __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_334(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "registrationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "credentialContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "handleTokenBindingWithPasswordContext:", v5);

    v7 = *(void **)(a1 + 32);
    if (v6 == 1)
    {
      objc_msgSend(v7, "finishRegistrationWithStatus:", 1);
      objc_msgSend(*(id *)(a1 + 32), "configurationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentUserConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v7 = *(void **)(a1 + 32);
  }
  objc_msgSend(v7, "finishRegistrationWithRetry");
  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentUserConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = 3;
LABEL_6:
  objc_msgSend(v9, "setState:", v11);

  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "saveCurrentUserConfigurationAndSyncToPreboot:", 1);

  if ((v13 & 1) == 0)
    v14 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2_335();
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_2_335()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after key request during user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_339()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after failed authentication during user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

uint64_t __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_343(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRegistrationWithStatus:", 1);
}

id __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_345()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to remove user configuration after failed no retry during user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)failUserRegistrationBeforeAuthorization
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  POAgentAuthenticationProcess *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[POAgentAuthenticationProcess failUserRegistrationBeforeAuthorization]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v10, 0x16u);
  }

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRetry:", 1);

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", 8);

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAuthorizationProvided:", 0);

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registrationUI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[POAgentAuthenticationProcess promptUserForRegistration](self, "promptUserForRegistration");
  -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.DeviceRegistrationStatusDidChange"), 0, 0, 1);

}

- (void)finishRegistrationWithStatus:(BOOL)a3
{
  -[POAgentAuthenticationProcess finishRegistrationWithStatus:message:](self, "finishRegistrationWithStatus:message:", a3, 0);
}

- (void)finishRegistrationWithStatus:(BOOL)a3 message:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  POAgentAuthenticationProcess *v28;
  uint64_t v29;

  v4 = a3;
  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  PO_LOG_POAgentAuthenticationProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v24 = "-[POAgentAuthenticationProcess finishRegistrationWithStatus:message:]";
    v25 = 2114;
    v26 = v8;
    v27 = 2112;
    v28 = self;
    _os_log_impl(&dword_22307D000, v7, OS_LOG_TYPE_DEFAULT, "%s success = %{public}@ on %@", buf, 0x20u);

  }
  v9 = v6;
  v10 = v9;
  if (!v9)
  {
    v10 = 0;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("REGISTRATION_FAILED_NO_RETRY_TEXT"), &stru_24EC04270, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12, "ssoExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __69__POAgentAuthenticationProcess_finishRegistrationWithStatus_message___block_invoke;
  v22[3] = &unk_24EC02ED0;
  v22[4] = self;
  objc_msgSend(v13, "registrationDidCompleteWithCompletion:", v22);

  LOBYTE(v12) = !v4;
  -[POAgentAuthenticationProcess setRegistrationFailed:](self, "setRegistrationFailed:", v4 ^ 1);
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v12 & 1) != 0)
  {
    objc_msgSend(v14, "registrationUI");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
      -[POAgentAuthenticationProcess showAlertMessage:messageText:completion:](self, "showAlertMessage:messageText:completion:", v10, 0, 0);
  }
  else
  {
    objc_msgSend(v14, "setState:", 1);

    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "currentUserConfiguration");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v17, "setState:", 0);

    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v18, "saveCurrentUserConfigurationAndSyncToPreboot:", 1);

    if ((v17 & 1) == 0)
      v19 = __54__POAgentAuthenticationProcess__startUserRegistration__block_invoke_322();
  }
  -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.UserRegistrationStatusDidChange"), 0, 0, 1);

}

void __69__POAgentAuthenticationProcess_finishRegistrationWithStatus_message___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ssoExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unload");

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrationUI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "setRegistrationContext:", 0);
}

- (void)finishRegistrationWithRetry
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  POAgentAuthenticationProcess *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  POAgentAuthenticationProcess *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[POAgentAuthenticationProcess finishRegistrationWithRetry]";
    v25 = 2112;
    v26 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRetry:", 1);

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setState:", 8);

  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentUserConfiguration");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "setState:", 2);

  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v8, "saveCurrentUserConfigurationAndSyncToPreboot:", 1);

  if ((v7 & 1) == 0)
    v9 = __59__POAgentAuthenticationProcess_finishRegistrationWithRetry__block_invoke();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REGISTRATION_FAILED_RETRY_TEXT"), &stru_24EC04270, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PO_LOG_POAgentAuthenticationProcess();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[POAgentAuthenticationProcess finishRegistrationWithRetry]";
    v25 = 2112;
    v26 = self;
    _os_log_impl(&dword_22307D000, v12, OS_LOG_TYPE_DEFAULT, "%s calling registrationDidComplete on %@", buf, 0x16u);
  }

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ssoExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __59__POAgentAuthenticationProcess_finishRegistrationWithRetry__block_invoke_353;
  v20 = &unk_24EC031A8;
  v21 = self;
  v22 = v11;
  v15 = v11;
  objc_msgSend(v14, "registrationDidCompleteWithCompletion:", &v17);

  -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter", v17, v18, v19, v20, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.UserRegistrationStatusDidChange"), 0, 0, 1);

}

id __59__POAgentAuthenticationProcess_finishRegistrationWithRetry__block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after failed user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

uint64_t __59__POAgentAuthenticationProcess_finishRegistrationWithRetry__block_invoke_353(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registrationUI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "showAlertMessage:messageText:completion:", *(_QWORD *)(a1 + 40), 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "promptUserForRegistration");
}

- (void)handleDeviceAndUserRegistrationForRepair:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  POAgentAuthenticationProcess *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[POAgentAuthenticationProcess handleDeviceAndUserRegistrationForRepair:]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  -[POAgentAuthenticationProcess handleDeviceAndUserRegistrationForRepair:newPasswordUser:newSmartCardUser:notified:profile:](self, "handleDeviceAndUserRegistrationForRepair:newPasswordUser:newSmartCardUser:notified:profile:", v3, 0, 0, 0, 0);
}

- (void)handleDeviceAndUserRegistrationForRepair:(BOOL)a3 newPasswordUser:(BOOL)a4 newSmartCardUser:(BOOL)a5 notified:(BOOL)a6 profile:(id)a7
{
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  POProfile *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  _BOOL8 v24;
  void *v25;
  POProfile *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  PORegistrationContext *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _BOOL8 v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  _BOOL4 v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  char *v94;
  uint64_t v95;
  unsigned int v96;
  _BOOL4 v97;
  _QWORD block[5];
  _QWORD activity_block[5];
  const __CFString *v100;
  const __CFString *v101;
  uint8_t buf[4];
  const char *v103;
  __int16 v104;
  POAgentAuthenticationProcess *v105;
  uint64_t v106;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v106 = *MEMORY[0x24BDAC8D0];
  v12 = (POProfile *)a7;
  PO_LOG_POAgentAuthenticationProcess();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v103 = "-[POAgentAuthenticationProcess handleDeviceAndUserRegistrationForRepair:newPasswordUser:newSmartCardUser:notified:profile:]";
    v104 = 2112;
    v105 = self;
    _os_log_impl(&dword_22307D000, v13, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = CFSTR("com.apple.PlatformSSO.registration");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v101, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeDeliveredNotificationsWithIdentifiers:", v15);

  -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = CFSTR("com.apple.PlatformSSO.registration");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v100, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removePendingNotificationRequestsWithIdentifiers:", v17);

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "state") == 5)
    {
LABEL_9:

      goto LABEL_10;
    }
    v21 = v10;
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "state") == 3)
    {
LABEL_8:

      v10 = v21;
      goto LABEL_9;
    }
    v96 = v9;
    v23 = v8;
    v24 = v7;
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "state") == 8)
    {

      v7 = v24;
      v8 = v23;
      v9 = v96;
      goto LABEL_8;
    }
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v91, "state");

    v7 = v24;
    v8 = v23;
    v9 = v96;
    v10 = v21;
    if (v95 != 6)
    {
      PO_LOG_POAgentAuthenticationProcess();
      v30 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        goto LABEL_41;
      v92 = (void *)MEMORY[0x24BDD16E0];
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "numberWithInteger:", objc_msgSend(v93, "state"));
      v94 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v103 = v94;
      _os_log_impl(&dword_22307D000, v30, OS_LOG_TYPE_INFO, "registration already in progress: %{public}@", buf, 0xCu);

LABEL_40:
      goto LABEL_41;
    }
  }
LABEL_10:
  if (!v12)
  {
    v26 = [POProfile alloc];
    -[POAgentAuthenticationProcess configurationHost](self, "configurationHost");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "validatedProfileForPlatformSSO");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[POProfile initWithProfile:](v26, "initWithProfile:", v28);

    if (!v12)
    {
      v72 = __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke();
      return;
    }
  }
  -[POProfile extensionBundleIdentifier](v12, "extensionBundleIdentifier", v95);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[POAgentAuthenticationProcess loadSSOExtensionWithExtensionBundleIdentifier:](self, "loadSSOExtensionWithExtensionBundleIdentifier:", v29);
  v30 = objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    v33 = __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke();
    goto LABEL_41;
  }
  v31 = -[POAgentAuthenticationProcess ssoMethodToUse:profile:](self, "ssoMethodToUse:profile:", v30, v12);
  if ((_DWORD)v31 != 1000)
  {
    v34 = v31;
    v97 = v10;
    PO_LOG_POAgentAuthenticationProcess();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[POAgentAuthenticationProcess handleDeviceAndUserRegistrationForRepair:newPasswordUser:newSmartCardUser:notified:profile:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);

    v42 = objc_alloc_init(PORegistrationContext);
    -[POAgentAuthenticationProcess setRegistrationContext:](self, "setRegistrationContext:", v42);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setState:", 4);

    -[POProfile extensionBundleIdentifier](v12, "extensionBundleIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setExtensionIdentifier:", v44);

    -[POProfile registrationToken](v12, "registrationToken");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setRegistrationToken:", v46);

    -[NSObject containerAppBundleIdentifier](v30, "containerAppBundleIdentifier");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setContainerAppBundleIdentifier:", v48);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setAuthMethod:", v34);

    NSUserName();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setUserName:", v51);

    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    NSUserName();
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v53, "isPlatformSSOUserName:", v54);
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setUserIsPlatformSSOUser:", v55);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setRepair:", v97);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setNewPasswordUser:", v9);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setNewSmartCardUser:", v8);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setUserNotified:", v7);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setSsoExtension:", v30);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "ssoExtension");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setDelegate:", self);

    v64 = -[POProfile useSharedDeviceKeys](v12, "useSharedDeviceKeys");
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setUseSharedDeviceKeys:", v64);

    v66 = -[NSObject protocolVersion](v30, "protocolVersion");
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setProtocolVersion:", v66);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setProfile:", v12);

    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "currentUserConfiguration");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v8, "currentUserConfiguration");
      v9 = objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend((id)v9, "state") == 5;
    }
    else
    {
      v71 = 0;
    }
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setUserSEPKeyInvalid:", v71);

    if (v70)
    {

    }
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "currentDeviceConfiguration");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v75)
    {
      v76 = -[POProfile useSharedDeviceKeys](v12, "useSharedDeviceKeys");
      -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "currentDeviceConfiguration");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v76 ^ objc_msgSend(v78, "sharedDeviceKeys");
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "setDeviceKeysShouldChange:", v79);

    }
    else
    {
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setDeviceKeysShouldChange:", 1);
    }

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v81, "useSharedDeviceKeys"))
    {
      -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "userDeviceConfiguration");
      v83 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v83)
      {
LABEL_31:
        -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "userNotified");

        if (v85)
        {
          activity_block[0] = MEMORY[0x24BDAC760];
          activity_block[1] = 3221225472;
          activity_block[2] = __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_364;
          activity_block[3] = &unk_24EC02ED0;
          activity_block[4] = self;
          _os_activity_initiate(&dword_22307D000, "PSSODeviceRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
        }
        else
        {
          -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "registrationToken");
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v88;
          if (v87)
          {
            objc_msgSend(v88, "setState:", 4);

            dispatch_get_global_queue(0, 0);
            v90 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_2;
            block[3] = &unk_24EC02ED0;
            block[4] = self;
            dispatch_async(v90, block);

          }
          else
          {
            objc_msgSend(v88, "setState:", 3);

            -[POAgentAuthenticationProcess promptUserForRegistration](self, "promptUserForRegistration");
          }
        }
        -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.DeviceRegistrationStatusDidChange"), 0, 0, 1);
        goto LABEL_40;
      }
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "setMigratingDeviceKeys:", 1);
    }

    goto LABEL_31;
  }
  v32 = __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_359();
LABEL_41:

}

id __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("No platform SSO Profiles in device registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_359()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("No supported authentication methods in device registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

uint64_t __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_364(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:", 4);

  return objc_msgSend(*(id *)(a1 + 32), "showRegistrationUI");
}

void __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_2(uint64_t a1)
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_3;
  activity_block[3] = &unk_24EC02ED0;
  activity_block[4] = *(_QWORD *)(a1 + 32);
  _os_activity_initiate(&dword_22307D000, "PSSODeviceRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __123__POAgentAuthenticationProcess_handleDeviceAndUserRegistrationForRepair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDeviceRegistration");
}

- (void)handleUserRegistrationForUser:(id)a3 repair:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  POAgentAuthenticationProcess *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[POAgentAuthenticationProcess handleUserRegistrationForUser:repair:]";
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_22307D000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v8, 0x16u);
  }

  -[POAgentAuthenticationProcess handleUserRegistrationForUser:repair:newPasswordUser:newSmartCardUser:notified:profile:](self, "handleUserRegistrationForUser:repair:newPasswordUser:newSmartCardUser:notified:profile:", v6, v4, 0, 0, 0, 0);
}

- (void)handleUserRegistrationForUser:(id)a3 repair:(BOOL)a4 newPasswordUser:(BOOL)a5 newSmartCardUser:(BOOL)a6 notified:(BOOL)a7 profile:(id)a8
{
  _BOOL8 v9;
  uint64_t v10;
  _BOOL8 v11;
  id v13;
  POProfile *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  int v30;
  BOOL v31;
  POProfile *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  PORegistrationContext *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL8 v79;
  NSObject *v80;
  void *v82;
  void *v83;
  char *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  unsigned int v90;
  void *v91;
  int v92;
  _QWORD *v93;
  void *v94;
  unsigned int v95;
  _BOOL4 v96;
  _QWORD activity_block[5];
  _QWORD v98[5];
  const __CFString *v99;
  const __CFString *v100;
  uint8_t buf[4];
  const char *v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  POAgentAuthenticationProcess *v108;
  uint64_t v109;

  v9 = a7;
  v10 = a6;
  v96 = a5;
  v11 = a4;
  v109 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = (POProfile *)a8;
  PO_LOG_POAgentAuthenticationProcess();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v96);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v102 = "-[POAgentAuthenticationProcess handleUserRegistrationForUser:repair:newPasswordUser:newSmartCardUser:notified:profile:]";
    v103 = 2114;
    v104 = v16;
    v105 = 2114;
    v106 = v17;
    v107 = 2112;
    v108 = self;
    _os_log_impl(&dword_22307D000, v15, OS_LOG_TYPE_DEFAULT, "%s New Password User = %{public}@, New SmartCard User = %{public}@ on %@", buf, 0x2Au);

  }
  -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = CFSTR("com.apple.PlatformSSO.registration");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v100, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeDeliveredNotificationsWithIdentifiers:", v19);

  -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = CFSTR("com.apple.PlatformSSO.registration");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v99, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removePendingNotificationRequestsWithIdentifiers:", v21);

  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "currentDeviceConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "registrationCompleted");

  if ((v24 & 1) == 0)
  {
    v28 = __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke();
LABEL_40:

    goto LABEL_41;
  }
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "state") == 8)
    {

    }
    else
    {
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v10;
      v10 = objc_msgSend(v29, "state");

      v31 = v10 == 6;
      LODWORD(v10) = v30;
      if (!v31)
      {
        PO_LOG_POAgentAuthenticationProcess();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          v82 = (void *)MEMORY[0x24BDD16E0];
          -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "numberWithInteger:", objc_msgSend(v83, "state"));
          v84 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v102 = v84;
          _os_log_impl(&dword_22307D000, v80, OS_LOG_TYPE_INFO, "User registration already in progress: %{public}@", buf, 0xCu);

        }
        goto LABEL_40;
      }
    }
  }
  if (v14)
    goto LABEL_12;
  v32 = [POProfile alloc];
  -[POAgentAuthenticationProcess configurationHost](self, "configurationHost");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "validatedProfileForPlatformSSO");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[POProfile initWithProfile:](v32, "initWithProfile:", v34);

  if (v14)
  {
LABEL_12:
    -[POProfile extensionBundleIdentifier](v14, "extensionBundleIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess loadSSOExtensionWithExtensionBundleIdentifier:](self, "loadSSOExtensionWithExtensionBundleIdentifier:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      v39 = __50__POAgentAuthenticationProcess_showRegistrationUI__block_invoke();
      goto LABEL_39;
    }
    v37 = -[POAgentAuthenticationProcess ssoMethodToUse:profile:](self, "ssoMethodToUse:profile:", v36, v14);
    if ((_DWORD)v37 == 1000)
    {
      v38 = __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_374();
LABEL_39:

      goto LABEL_40;
    }
    v40 = v37;
    v95 = v10;
    PO_LOG_POAgentAuthenticationProcess();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      -[POAgentAuthenticationProcess handleDeviceAndUserRegistrationForRepair:newPasswordUser:newSmartCardUser:notified:profile:].cold.1(v40, v41, v42, v43, v44, v45, v46, v47);

    v48 = objc_alloc_init(PORegistrationContext);
    -[POAgentAuthenticationProcess setRegistrationContext:](self, "setRegistrationContext:", v48);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setState:", 7);

    -[POProfile extensionBundleIdentifier](v14, "extensionBundleIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setExtensionIdentifier:", v50);

    -[POProfile registrationToken](v14, "registrationToken");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setRegistrationToken:", v52);

    objc_msgSend(v36, "containerAppBundleIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setContainerAppBundleIdentifier:", v54);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setAuthMethod:", v40);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setRepair:", v11);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setNewPasswordUser:", v96);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setNewSmartCardUser:", v95);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setUserNotified:", v9);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setLoginUserName:", v13);

    NSUserName();
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setUserName:", v62);

    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    NSUserName();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v64, "isPlatformSSOUserName:", v65);
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setUserIsPlatformSSOUser:", v66);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setState:", 6);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setSsoExtension:", v36);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "ssoExtension");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setDelegate:", self);

    v72 = -[POProfile useSharedDeviceKeys](v14, "useSharedDeviceKeys");
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "setUseSharedDeviceKeys:", v72);

    v74 = objc_msgSend(v36, "protocolVersion");
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setProtocolVersion:", v74);

    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setProfile:", v14);

    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "currentUserConfiguration");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (v78)
    {
      -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "currentUserConfiguration");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v55, "state") == 5;
    }
    else
    {
      v79 = 0;
    }
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setUserSEPKeyInvalid:", v79);

    if (v78)
    {

    }
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v87, "useSharedDeviceKeys"))
    {
      -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "userDeviceConfiguration");
      v89 = (void *)objc_claimAutoreleasedReturnValue();

      v90 = v95;
      if (!v89)
        goto LABEL_32;
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setMigratingDeviceKeys:", 1);
    }
    else
    {
      v90 = v95;
    }

LABEL_32:
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "userNotified");

    if (v92)
    {
      v98[0] = MEMORY[0x24BDAC760];
      v98[1] = 3221225472;
      v98[2] = __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_378;
      v98[3] = &unk_24EC02ED0;
      v98[4] = self;
      v93 = v98;
    }
    else
    {
      if (!v96 && !v90)
      {
        -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "setState:", 6);

        -[POAgentAuthenticationProcess promptUserForRegistration](self, "promptUserForRegistration");
        goto LABEL_39;
      }
      activity_block[0] = MEMORY[0x24BDAC760];
      activity_block[1] = 3221225472;
      activity_block[2] = __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_2;
      activity_block[3] = &unk_24EC02ED0;
      activity_block[4] = self;
      v93 = activity_block;
    }
    _os_activity_initiate(&dword_22307D000, "PSSOUserRegistration", OS_ACTIVITY_FLAG_DEFAULT, v93);
    goto LABEL_39;
  }
  v85 = __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_368();
LABEL_41:

}

id __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Device registration not complete in user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_368()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("No platform SSO Profiles in user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_374()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("No supported authentication methods in user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

uint64_t __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_378(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:", 7);

  return objc_msgSend(*(id *)(a1 + 32), "showRegistrationUI");
}

uint64_t __119__POAgentAuthenticationProcess_handleUserRegistrationForUser_repair_newPasswordUser_newSmartCardUser_notified_profile___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startUserRegistration");
}

- (void)promptUserForRegistration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "There is not an active Platform SSO registration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __57__POAgentAuthenticationProcess_promptUserForRegistration__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  if (v2)
  {
    v5[1] = 3221225472;
    v5[2] = __57__POAgentAuthenticationProcess_promptUserForRegistration__block_invoke_2;
    v5[3] = &unk_24EC025A0;
    v4 = v2;
    v5[0] = MEMORY[0x24BDAC760];
    v6 = v2;
    v3 = __57__POAgentAuthenticationProcess_promptUserForRegistration__block_invoke_2((uint64_t)v5);

    v2 = v4;
  }

}

id __57__POAgentAuthenticationProcess_promptUserForRegistration__block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error sending local notification for registration."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (void)checkIfPlatformSSOIsActive
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "no existing device configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)configurationChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  POAgentAuthenticationProcess *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[POAgentAuthenticationProcess configurationChanged:]";
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess configurationChanged:].cold.1();

  -[POAgentAuthenticationProcess configurationChanged](self, "configurationChanged");
}

- (void)configurationChanged
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  POAgentAuthenticationProcess *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[POAgentAuthenticationProcess configurationChanged]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__POAgentAuthenticationProcess_configurationChanged__block_invoke;
  block[3] = &unk_24EC02ED0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __52__POAgentAuthenticationProcess_configurationChanged__block_invoke(uint64_t a1)
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __52__POAgentAuthenticationProcess_configurationChanged__block_invoke_2;
  activity_block[3] = &unk_24EC02ED0;
  activity_block[4] = *(_QWORD *)(a1 + 32);
  _os_activity_initiate(&dword_22307D000, "configurationChanged", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __52__POAgentAuthenticationProcess_configurationChanged__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "keyBag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserKeybagUnlocked");

  v4 = *(void **)(a1 + 32);
  if (v3)
    return objc_msgSend(v4, "handleConfigurationChanged:", 0);
  else
    return objc_msgSend(v4, "setShouldRunConfigurationChangeWhenUnlocked:", 1);
}

- (void)handleConfigurationChanged:(BOOL)a3
{
  NSObject *v5;
  NSObject *v6;
  POAgentAuthenticationProcess *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  POProfile *v23;
  void *v24;
  void *v25;
  POProfile *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  POAgentAuthenticationProcess *v33;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  char v50;
  id v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  _BOOL4 v62;
  BOOL v63;
  char v64;
  int v65;
  id v66;
  void *v67;
  void *v68;
  int v69;
  id v70;
  _BOOL4 v71;
  void *v72;
  void *v73;
  uint64_t v74;
  int v75;
  char v76;
  int v77;
  void *v78;
  char v79;
  POAgentAuthenticationProcess *v80;
  int v81;
  _QWORD v82[5];
  id v83;
  POProfile *v84;
  BOOL v85;
  char v86;
  BOOL v87;
  _QWORD v88[5];
  POProfile *v89;
  BOOL v90;
  char v91;
  BOOL v92;
  uint8_t buf[4];
  const char *v94;
  __int16 v95;
  POAgentAuthenticationProcess *v96;
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v94 = "-[POAgentAuthenticationProcess handleConfigurationChanged:]";
    v95 = 2112;
    v96 = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  PO_LOG_POAgentAuthenticationProcess();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22307D000, v6, OS_LOG_TYPE_INFO, "Configuration changed", buf, 2u);
  }

  -[POAgentAuthenticationProcess setShouldRunConfigurationChangeWhenUnlocked:](self, "setShouldRunConfigurationChangeWhenUnlocked:", 0);
  v7 = self;
  objc_sync_enter(v7);
  -[POAgentAuthenticationProcess configurationManager](v7, "configurationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDeviceConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    PO_LOG_POAgentAuthenticationProcess();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[POAgentAuthenticationProcess handleConfigurationChanged:].cold.3();

  }
  -[POAgentAuthenticationProcess configurationManager](v7, "configurationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentUserConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    PO_LOG_POAgentAuthenticationProcess();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[POAgentAuthenticationProcess handleConfigurationChanged:].cold.2();

  }
  -[POAgentAuthenticationProcess configurationManager](v7, "configurationManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentLoginConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    goto LABEL_17;
  PO_LOG_POAgentAuthenticationProcess();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess handleConfigurationChanged:].cold.1();

  if (v9 != 0 || v12 != 0)
  {
LABEL_17:
    v17 = 1;
    -[POAgentAuthenticationProcess setPlatformSSOActive:](v7, "setPlatformSSOActive:", 1);
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(v9, "extensionIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18
    || (-[POAgentAuthenticationProcess registrationContext](v7, "registrationContext"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "extensionIdentifier"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v18))
  {
    -[POAgentAuthenticationProcess configurationHost](v7, "configurationHost");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hasAnyMDMProfileForExtension:", v18);

    if ((v17 & (v21 ^ 1)) != 0)
    {
      PO_LOG_POAgentAuthenticationProcess();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22307D000, v22, OS_LOG_TYPE_INFO, "Removing registration", buf, 2u);
      }

      -[POAgentAuthenticationProcess handleRemovingRegistrationForExtension:alreadyDeleted:](v7, "handleRemovingRegistrationForExtension:alreadyDeleted:", v18, 0);
      v15 = 0;
      v12 = 0;
      v9 = 0;
    }
  }

  objc_sync_exit(v7);
  v23 = [POProfile alloc];
  -[POAgentAuthenticationProcess configurationHost](v7, "configurationHost");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "validatedProfileForPlatformSSO");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[POProfile initWithProfile:](v23, "initWithProfile:", v25);

  if (v26)
  {
    -[POProfile extensionBundleIdentifier](v26, "extensionBundleIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess loadSSOExtensionWithExtensionBundleIdentifier:](v7, "loadSSOExtensionWithExtensionBundleIdentifier:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      v31 = __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_387();
      goto LABEL_81;
    }
    if ((objc_msgSend(v28, "canPerformRegistration") & 1) == 0)
    {
      v32 = __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_391();
      goto LABEL_81;
    }
    v81 = -[POAgentAuthenticationProcess ssoMethodToUse:profile:](v7, "ssoMethodToUse:profile:", v28, v26);
    if (v81 == 1000)
    {
      v29 = __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_395();
      goto LABEL_81;
    }
    if (!-[POProfile useSharedDeviceKeys](v26, "useSharedDeviceKeys")
      && (-[POProfile createUsersEnabled](v26, "createUsersEnabled")
       || -[POProfile authorizationEnabled](v26, "authorizationEnabled")))
    {
      v66 = __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_399();
      goto LABEL_81;
    }
    v33 = v7;
    objc_sync_enter(v33);
    -[POAgentAuthenticationProcess setPlatformSSOActive:](v33, "setPlatformSSOActive:", 1);
    objc_sync_exit(v33);
    v80 = v33;

    if (v9)
    {
      -[POAgentAuthenticationProcess deviceSigningAlgorithmToUse:deviceConfiguration:](v33, "deviceSigningAlgorithmToUse:deviceConfiguration:", v28, v9);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "signingAlgorithm");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "isEqualToNumber:", v35);

      if ((v36 & 1) == 0)
        objc_msgSend(v9, "setPendingSigningAlgorithm:", v34);
      -[POAgentAuthenticationProcess deviceEncryptionAlgorithmToUse:deviceConfiguration:](v80, "deviceEncryptionAlgorithmToUse:deviceConfiguration:", v28, v9);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "encryptionAlgorithm");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "isEqualToNumber:", v38);

      if ((v39 & 1) == 0)
        objc_msgSend(v9, "setPendingEncryptionAlgorithm:", v37);
      objc_msgSend(v9, "setCreateUsersEnabled:", -[POProfile createUsersEnabled](v26, "createUsersEnabled"));
      objc_msgSend(v9, "setAuthorizationEnabled:", -[POProfile authorizationEnabled](v26, "authorizationEnabled"));
      -[POProfile tokenToUserMapping](v26, "tokenToUserMapping");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTokenToUserMapping:", v40);

      objc_msgSend(v9, "setNewUserAuthorizationMode:", -[POProfile newUserAuthorizationMode](v26, "newUserAuthorizationMode"));
      objc_msgSend(v9, "setUserAuthorizationMode:", -[POProfile userAuthorizationMode](v26, "userAuthorizationMode"));
      -[POProfile accountDisplayName](v26, "accountDisplayName");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccountDisplayName:", v41);

      -[POProfile loginFrequency](v26, "loginFrequency");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLoginFrequency:", v42);

      objc_msgSend(v28, "sdkVersionString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSdkVersionString:", v43);

      objc_msgSend(v9, "setProtocolVersion:", objc_msgSend(v28, "protocolVersion"));
      objc_msgSend(v9, "setLoginType:", v81);
      objc_msgSend(v9, "setFileVaultPolicy:", -[POProfile fileVaultPolicy](v26, "fileVaultPolicy"));
      objc_msgSend(v9, "setLoginPolicy:", -[POProfile loginPolicy](v26, "loginPolicy"));
      objc_msgSend(v9, "setUnlockPolicy:", -[POProfile unlockPolicy](v26, "unlockPolicy"));
      objc_msgSend(v9, "setOfflineGracePeriod:", -[POProfile offlineGracePeriod](v26, "offlineGracePeriod"));
      -[POProfile nonPlatformSSOAccounts](v26, "nonPlatformSSOAccounts");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setNonPlatformSSOAccounts:", v44);

      objc_msgSend(v9, "setRequireAuthGracePeriod:", -[POProfile requireAuthGracePeriod](v26, "requireAuthGracePeriod"));
      v45 = objc_msgSend(v9, "fileVaultPolicy");
      if (v45 != -[POProfile fileVaultPolicy](v26, "fileVaultPolicy")
        && (-[POProfile fileVaultPolicy](v26, "fileVaultPolicy") & 8) != 0
        || (v46 = objc_msgSend(v9, "loginPolicy"), v46 != -[POProfile loginPolicy](v26, "loginPolicy"))
        && (-[POProfile loginPolicy](v26, "loginPolicy") & 8) != 0
        || (v47 = objc_msgSend(v9, "unlockPolicy"), v47 != -[POProfile unlockPolicy](v26, "unlockPolicy"))
        && (-[POProfile unlockPolicy](v26, "unlockPolicy") & 8) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAuthGracePeriodStart:", v48);

      }
      -[POAgentAuthenticationProcess configurationManager](v80, "configurationManager");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "saveDeviceConfiguration:", v9);

      if ((v50 & 1) == 0)
        v51 = __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_403();

    }
    if (v12)
    {
      if (objc_msgSend(v12, "loginType") == 2)
      {
        -[POAgentAuthenticationProcess configurationManager](v80, "configurationManager");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "currentUserConfiguration");
        v53 = objc_claimAutoreleasedReturnValue();
        -[POAgentAuthenticationProcess userSigningAlgorithmToUse:userConfiguration:](v80, "userSigningAlgorithmToUse:userConfiguration:", v28, v53);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        -[POAgentAuthenticationProcess configurationManager](v80, "configurationManager");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "currentUserConfiguration");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "signingAlgorithm");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v53) = objc_msgSend(v78, "isEqualToNumber:", v56);

        if ((v53 & 1) == 0)
        {
          -[POAgentAuthenticationProcess configurationManager](v80, "configurationManager");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "currentUserConfiguration");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setPendingSigningAlgorithm:", v78);

          -[POAgentAuthenticationProcess configurationManager](v80, "configurationManager");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "saveCurrentUserConfigurationAndSyncToPreboot:", 1);

          if ((v60 & 1) == 0)
          {
            v70 = __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_407();

            goto LABEL_81;
          }
        }

      }
      v62 = objc_msgSend(v12, "state") == 4 && v81 == 1;
      v63 = objc_msgSend(v12, "state") == 6 && v81 == 3;
      v64 = v63;
      v65 = v63 || v62;
      v77 = v65;
      v79 = v64;
      if (!v9)
        goto LABEL_80;
    }
    else
    {
      LOBYTE(v62) = 0;
      v77 = 0;
      v79 = 0;
      if (!v9)
        goto LABEL_80;
    }
    if (!v15 || !objc_msgSend(v9, "registrationCompleted"))
      goto LABEL_80;
    objc_msgSend(v9, "extensionIdentifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[POProfile extensionBundleIdentifier](v26, "extensionBundleIdentifier");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v67, "isEqualToString:", v68))
    {
      v69 = -[POProfile useSharedDeviceKeys](v26, "useSharedDeviceKeys");
      if (v69 == objc_msgSend(v9, "sharedDeviceKeys"))
      {
        if (objc_msgSend(v9, "sharedDeviceKeys"))
        {

        }
        else
        {
          v71 = objc_msgSend(v12, "state") == 2;

          if (v71)
            goto LABEL_80;
        }
        if (v12 && objc_msgSend(v12, "loginType") == v81)
        {
          if (objc_msgSend(v9, "sharedDeviceKeys"))
          {
            -[POAgentAuthenticationProcess configurationManager](v80, "configurationManager");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "userDeviceConfiguration");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            if (v73 || objc_msgSend(v12, "state") == 2)
            {

            }
            else
            {
              if (objc_msgSend(v12, "state") == 5)
                v76 = 1;
              else
                v76 = v77;

              if ((v76 & 1) == 0)
                goto LABEL_81;
            }
          }
          else if (objc_msgSend(v12, "state") != 2)
          {
            v74 = objc_msgSend(v12, "state");
            v75 = v77;
            if (v74 == 5)
              v75 = 1;
            if (v75 != 1)
              goto LABEL_81;
          }
        }
        v82[0] = MEMORY[0x24BDAC760];
        v82[1] = 3221225472;
        v82[2] = __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_3;
        v82[3] = &unk_24EC03218;
        v82[4] = v80;
        v83 = v12;
        v85 = v62;
        v86 = v79;
        v87 = a3;
        v84 = v26;
        -[POAgentAuthenticationProcess resetRegistrationWithCompletion:](v80, "resetRegistrationWithCompletion:", v82);

LABEL_81:
        goto LABEL_82;
      }
    }

LABEL_80:
    v88[0] = MEMORY[0x24BDAC760];
    v88[1] = 3221225472;
    v88[2] = __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_409;
    v88[3] = &unk_24EC031F0;
    v88[4] = v80;
    v90 = v62;
    v91 = v79;
    v92 = a3;
    v89 = v26;
    -[POAgentAuthenticationProcess resetRegistrationWithCompletion:](v80, "resetRegistrationWithCompletion:", v88);

    goto LABEL_81;
  }
  v30 = __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke();
LABEL_82:

}

id __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("No validated Platform SSO Profiles in configuration changed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_387()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Platform SSO extension not found in configuration changed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_391()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Platform SSO extension does not implement registration protocol in configuration changed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_395()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("No supported authentication methods in configuration changed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_399()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Shared device keys required for creating or authorizing users in configuration changed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_403()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed save device configuration with profile changes in configuration changed."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_407()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save new user configuration during user registration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

void __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_409(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  char v6;
  __int16 v7;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[2] = __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_2;
  block[3] = &unk_24EC031F0;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 48);
  block[1] = 3221225472;
  v7 = *(_WORD *)(a1 + 49);
  v5 = v3;
  dispatch_async(v2, block);

}

uint64_t __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDeviceAndUserRegistrationForRepair:newPasswordUser:newSmartCardUser:notified:profile:", 0, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50), *(_QWORD *)(a1 + 40));
}

void __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  char v7;
  __int16 v8;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_4;
  v4[3] = &unk_24EC03218;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v7 = *(_BYTE *)(a1 + 56);
  v8 = *(_WORD *)(a1 + 57);
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, v4);

}

void __59__POAgentAuthenticationProcess_handleConfigurationChanged___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userLoginConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loginUserName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleUserRegistrationForUser:repair:newPasswordUser:newSmartCardUser:notified:profile:", v3, 0, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(unsigned __int8 *)(a1 + 58), *(_QWORD *)(a1 + 48));

}

- (void)resetRegistrationWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD);
  const __CFString *v16;
  const __CFString *v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  POAgentAuthenticationProcess *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  PO_LOG_POAgentAuthenticationProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[POAgentAuthenticationProcess resetRegistrationWithCompletion:]";
    v20 = 2112;
    v21 = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = CFSTR("com.apple.PlatformSSO.registration");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeDeliveredNotificationsWithIdentifiers:", v7);

  -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("com.apple.PlatformSSO.registration");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removePendingNotificationRequestsWithIdentifiers:", v9);

  -[POAgentAuthenticationProcess setRegistrationFailed:](self, "setRegistrationFailed:", 0);
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ssoExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registrationUI");

  -[POAgentAuthenticationProcess setRegistrationContext:](self, "setRegistrationContext:", 0);
  if (v11)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __64__POAgentAuthenticationProcess_resetRegistrationWithCompletion___block_invoke;
    v14[3] = &unk_24EC03240;
    v14[4] = self;
    v15 = v4;
    objc_msgSend(v11, "registrationDidCancelWithCompletion:", v14);

  }
  else
  {
    -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.UserRegistrationStatusDidChange"), 0, 0, 1);

    v4[2](v4);
  }

}

uint64_t __64__POAgentAuthenticationProcess_resetRegistrationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "distributedNotificationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.UserRegistrationStatusDidChange"), 0, 0, 1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)handleDeviceRegistrationNotification
{
  void *v3;
  void *v4;
  _QWORD activity_block[5];

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserNotified:", 1);

    activity_block[0] = MEMORY[0x24BDAC760];
    activity_block[1] = 3221225472;
    activity_block[2] = __68__POAgentAuthenticationProcess_handleDeviceRegistrationNotification__block_invoke;
    activity_block[3] = &unk_24EC02ED0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_22307D000, "PSSODeviceRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  else
  {
    -[POAgentAuthenticationProcess handleConfigurationChanged:](self, "handleConfigurationChanged:", 1);
  }
}

uint64_t __68__POAgentAuthenticationProcess_handleDeviceRegistrationNotification__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:", 4);

  return objc_msgSend(*(id *)(a1 + 32), "showRegistrationUI");
}

- (void)handleUserRegistrationNotification
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD activity_block[5];

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[POAgentAuthenticationProcess registrationContext](self, "registrationContext"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "state"),
        v5,
        v4,
        v6 != 1))
  {
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUserNotified:", 1);

    activity_block[0] = MEMORY[0x24BDAC760];
    activity_block[1] = 3221225472;
    activity_block[2] = __66__POAgentAuthenticationProcess_handleUserRegistrationNotification__block_invoke;
    activity_block[3] = &unk_24EC02ED0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_22307D000, "PSSOUserRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  else
  {
    -[POAgentAuthenticationProcess handleConfigurationChanged:](self, "handleConfigurationChanged:", 1);
  }
}

uint64_t __66__POAgentAuthenticationProcess_handleUserRegistrationNotification__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:", 7);

  return objc_msgSend(*(id *)(a1 + 32), "showRegistrationUI");
}

- (int)ssoMethodToUse:(id)a3 profile:(id)a4
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  char v9;
  int v10;
  void *v11;
  void *v12;
  int v13;

  v5 = a3;
  v6 = a4;
  v7 = 1000;
  if (objc_msgSend(v6, "authenticationMethod") == 1000)
  {
LABEL_13:
    v10 = v7;
    goto LABEL_14;
  }
  v8 = objc_msgSend(v5, "supportedGrantTypes");
  if (!v8)
  {
    objc_msgSend(v5, "authenticationMethods");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v6, "authenticationMethod"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "containsObject:", v12);

    if (v13)
      v7 = objc_msgSend(v6, "authenticationMethod");

    goto LABEL_13;
  }
  v9 = v8;
  if ((v8 & 1) == 0 || (v10 = objc_msgSend(v6, "authenticationMethod"), v10 != 1))
  {
    v10 = 1000;
    if ((v9 & 2) != 0)
    {
      v10 = objc_msgSend(v6, "authenticationMethod");
      if (v10 != 2)
      {
        if (objc_msgSend(v6, "authenticationMethod") == 3)
          v10 = 3;
        else
          v10 = 1000;
      }
    }
  }
LABEL_14:

  return v10;
}

- (id)loadSSOExtensionWithExtensionBundleIdentifier:(id)a3
{
  id v4;
  POExtension *v5;
  void *v6;
  POExtension *v7;

  v4 = a3;
  v5 = [POExtension alloc];
  -[POAgentAuthenticationProcess extensionManager](self, "extensionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[POExtension initWithExtensionBundleIdentifier:extensionManager:](v5, "initWithExtensionBundleIdentifier:extensionManager:", v4, v6);

  return v7;
}

- (void)handleRegistrationViewControllerForExtensionIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extensionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v18);

    if ((v11 & 1) != 0)
    {
LABEL_6:
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "options");

      if ((v15 & 1) == 0)
      {
        __98__POAgentAuthenticationProcess_handleRegistrationViewControllerForExtensionIdentifier_completion___block_invoke_414();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v6)
        {
          v6[2](v6, 0, v16);

          goto LABEL_11;
        }

      }
      dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_419);
      goto LABEL_11;
    }
  }
  __98__POAgentAuthenticationProcess_handleRegistrationViewControllerForExtensionIdentifier_completion___block_invoke();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v6)
  {

    goto LABEL_6;
  }
  v6[2](v6, 0, v12);

LABEL_11:
}

id __98__POAgentAuthenticationProcess_handleRegistrationViewControllerForExtensionIdentifier_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Registration not in progress when presenting registration view controller."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __98__POAgentAuthenticationProcess_handleRegistrationViewControllerForExtensionIdentifier_completion___block_invoke_414()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("User interaction not allowed when presenting registration view controller."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)handleRemovingRegistrationForExtension:(id)a3 alreadyDeleted:(BOOL)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  char *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  POAgentAuthenticationProcess *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[POAgentAuthenticationProcess handleRemovingRegistrationForExtension:alreadyDeleted:]";
    v38 = 2112;
    v39 = self;
    _os_log_impl(&dword_22307D000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (!a4)
  {
    v30 = v6;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentUserConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "kerberosStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          PO_LOG_POAgentAuthenticationProcess();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v15, "cacheName");
            v17 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v37 = v17;
            _os_log_impl(&dword_22307D000, v16, OS_LOG_TYPE_INFO, "Removing kerberos tickets for cache: %{public}@", buf, 0xCu);

          }
          -[POAgentAuthenticationProcess kerberosHelper](self, "kerberosHelper");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "cacheName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "destroyCredentialForUUID:", v19);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v12);
    }

    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "resetStoredConfiguration");

    v6 = v30;
    if ((v21 & 1) == 0)
      v22 = __86__POAgentAuthenticationProcess_handleRemovingRegistrationForExtension_alreadyDeleted___block_invoke();
  }
  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTokens:extensionIdentifier:returningError:", 0, v6, 0);

  -[POAgentAuthenticationProcess setupTimerForAuthentication](self, "setupTimerForAuthentication");
  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSharedOnly:", 0);

  -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeAllDeliveredNotifications");

  -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeAllPendingNotificationRequests");

  -[POAgentAuthenticationProcess setPlatformSSOActive:](self, "setPlatformSSOActive:", 0);
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "registrationUI");

  -[POAgentAuthenticationProcess setRegistrationContext:](self, "setRegistrationContext:", 0);
  -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.DeviceRegistrationStatusDidChange"), 0, 0, 1);

  -[POAgentAuthenticationProcess distributedNotificationCenter](self, "distributedNotificationCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.UserRegistrationStatusDidChange"), 0, 0, 1);

}

id __86__POAgentAuthenticationProcess_handleRemovingRegistrationForExtension_alreadyDeleted___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to remove Platform SSO configuration folder when removing configuration."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)sendPasswordChangedNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t v21[8];
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLoginConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDeviceConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(v4, "accountDisplayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentDeviceConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extensionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[POAgentAuthenticationProcess createPasswordChangedNotificationWithAccountName:extensionIdentifier:](self, "createPasswordChangedNotificationWithAccountName:extensionIdentifier:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("com.apple.PlatformSSO.passwordchanged");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removePendingNotificationRequestsWithIdentifiers:", v14);

  -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = CFSTR("com.apple.PlatformSSO.passwordchanged");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeDeliveredNotificationsWithIdentifiers:", v16);

  objc_msgSend(MEMORY[0x24BDF88B0], "triggerWithTimeInterval:repeats:", 0, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF8858], "requestWithIdentifier:content:trigger:destinations:", CFSTR("com.apple.PlatformSSO.passwordchanged"), v12, v17, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_22307D000, v19, OS_LOG_TYPE_INFO, "Sending password changed notification", v21, 2u);
  }

  -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addNotificationRequest:withCompletionHandler:", v18, &__block_literal_global_423);

}

void __63__POAgentAuthenticationProcess_sendPasswordChangedNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = a2;
  if (v2)
  {
    v5[1] = 3221225472;
    v5[2] = __63__POAgentAuthenticationProcess_sendPasswordChangedNotification__block_invoke_2;
    v5[3] = &unk_24EC025A0;
    v4 = v2;
    v5[0] = MEMORY[0x24BDAC760];
    v6 = v2;
    v3 = __63__POAgentAuthenticationProcess_sendPasswordChangedNotification__block_invoke_2((uint64_t)v5);

    v2 = v4;
  }

}

id __63__POAgentAuthenticationProcess_sendPasswordChangedNotification__block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error sending local notification for password changed."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (void)handleKerberosMappingForTokens:(id)a3 extensionIdentifier:(id)a4 userConfiguration:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v7 = a5;
  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentLoginConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[POAgentAuthenticationProcess handleKerberosMappingForTokens:loginConfiguration:userConfiguration:](self, "handleKerberosMappingForTokens:loginConfiguration:userConfiguration:", v11, v9, v7);
  else
    v10 = __101__POAgentAuthenticationProcess_handleKerberosMappingForTokens_extensionIdentifier_userConfiguration___block_invoke();

}

id __101__POAgentAuthenticationProcess_handleKerberosMappingForTokens_extensionIdentifier_userConfiguration___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("No login configuration when handling kerberos mapping."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)exchangeTGTForStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  char *v17;
  void *v18;
  NSObject *v19;
  char *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  POAgentAuthenticationProcess *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[POAgentAuthenticationProcess kerberosDelegate](self, "kerberosDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "realm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isRealmConfiguredForKerberosExtension:", v6);

  -[POAgentAuthenticationProcess kerberosDelegate](self, "kerberosDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "realm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "triggerVPNForRealm:", v9);

  if ((_DWORD)v7)
  {
    -[POAgentAuthenticationProcess kerberosDelegate](self, "kerberosDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "realm");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isNetworkConnectedForRealm:", v11);

  }
  else
  {
    v12 = 1;
  }
  PO_LOG_POAgentAuthenticationProcess();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 136315906;
    v22 = "-[POAgentAuthenticationProcess exchangeTGTForStatus:]";
    v23 = 2114;
    v24 = v14;
    v25 = 2114;
    v26 = v15;
    v27 = 2112;
    v28 = self;
    _os_log_impl(&dword_22307D000, v13, OS_LOG_TYPE_DEFAULT, "%s kerberos extension = %{public}@, isNetworkConnected = %{public}@ on %@", (uint8_t *)&v21, 0x2Au);

  }
  if ((_DWORD)v12)
  {
    PO_LOG_POAgentAuthenticationProcess();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "realm");
      v17 = (char *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v17;
      _os_log_impl(&dword_22307D000, v16, OS_LOG_TYPE_INFO, "Exchanging TGT for realm: %{public}@", (uint8_t *)&v21, 0xCu);

    }
    -[POAgentAuthenticationProcess kerberosHelper](self, "kerberosHelper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "exchangeKerberosTGTForEntry:", v4);

  }
  PO_LOG_POAgentAuthenticationProcess();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "realm");
    v20 = (char *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v20;
    _os_log_impl(&dword_22307D000, v19, OS_LOG_TYPE_INFO, "Successfully imported Kerberos ticket for realm: %{public}@", (uint8_t *)&v21, 0xCu);

  }
}

- (void)handleKerberosMappingForTokens:(id)a3 loginConfiguration:(id)a4 userConfiguration:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  char *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  POKerberosEntry *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  char *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  NSObject *v50;
  char *v51;
  NSObject *v52;
  char *v53;
  void *v54;
  void *v55;
  POAgentAuthenticationProcess *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  id obj;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD v71[4];
  id v72;
  void *v73;
  id v74[6];
  id v75;
  char v76;
  _BYTE v77[15];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD v82[4];
  id v83;
  id v84;
  uint8_t v85[128];
  uint8_t buf[4];
  const char *v87;
  __int16 v88;
  POAgentAuthenticationProcess *v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PO_LOG_POAgentAuthenticationProcess();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v87 = "-[POAgentAuthenticationProcess handleKerberosMappingForTokens:loginConfiguration:userConfiguration:]";
    v88 = 2112;
    v89 = self;
    _os_log_impl(&dword_22307D000, v11, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v84 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v8, 16, &v84);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v84;
  if (v13)
  {
    v82[0] = MEMORY[0x24BDAC760];
    v82[1] = 3221225472;
    v82[2] = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke;
    v82[3] = &unk_24EC025A0;
    v14 = v13;
    v83 = v14;
    v15 = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke((uint64_t)v82);
    v16 = v83;
  }
  else
  {
    v61 = v10;
    v63 = v8;
    v65 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v62 = v9;
    objc_msgSend(v9, "kerberosTicketMappings");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
    if (v70)
    {
      v68 = 0;
      v69 = *(_QWORD *)v79;
      v66 = v12;
      do
      {
        for (i = 0; i != v70; ++i)
        {
          if (*(_QWORD *)v79 != v69)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
          PO_LOG_POAgentAuthenticationProcess();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v18, "ticketKeyPath");
            v20 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v87 = v20;
            _os_log_impl(&dword_22307D000, v19, OS_LOG_TYPE_INFO, "Mapping Kerberos TGT for %{public}@", buf, 0xCu);

          }
          objc_msgSend(v18, "ticketKeyPath");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "valueForKeyPath:", v21);
          v22 = objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v23 = (void *)MEMORY[0x24BDD1608];
              -[NSObject dataUsingEncoding:](v22, "dataUsingEncoding:", 4);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = v68;
              objc_msgSend(v23, "JSONObjectWithData:options:error:", v24, 16, &v75);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v75;

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v27 = v25;

                v22 = v27;
              }

              v68 = v26;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = v22;
              v28 = objc_alloc_init(POKerberosEntry);
              objc_msgSend(v18, "ticketKeyPath");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[POKerberosEntry setTicketKeyPath:](v28, "setTicketKeyPath:", v29);

              objc_msgSend(v18, "messageBufferKeyName");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v31, 0);
                -[POKerberosEntry setMessageBuffer:](v28, "setMessageBuffer:", v32);

              }
              objc_msgSend(v18, "realmKeyName");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                -[POKerberosEntry setRealm:](v28, "setRealm:", v34);
              objc_msgSend(v18, "serviceNameKeyName");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                -[POKerberosEntry setServiceName:](v28, "setServiceName:", v36);
              objc_msgSend(v18, "clientNameKeyName");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                -[POKerberosEntry setClientName:](v28, "setClientName:", v38);
              objc_msgSend(v18, "encryptionKeyTypeKeyName");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                -[POKerberosEntry setEncryptionKeyType:](v28, "setEncryptionKeyType:", objc_msgSend(v40, "intValue"));
              objc_msgSend(v18, "sessionKeyKeyName");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v42, 0);
                -[POKerberosEntry setSessionKey:](v28, "setSessionKey:", v43);

              }
              if (-[POKerberosEntry hasAllRequiredValues](v28, "hasAllRequiredValues"))
              {
                PO_LOG_POAgentAuthenticationProcess();
                v44 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  -[POKerberosEntry realm](v28, "realm");
                  v45 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v87 = v45;
                  _os_log_impl(&dword_22307D000, v44, OS_LOG_TYPE_INFO, "Importing Kerberos TGT for %{public}@", buf, 0xCu);

                }
                -[POAgentAuthenticationProcess kerberosHelper](self, "kerberosHelper");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v74[0] = 0;
                objc_msgSend(v46, "importKerberosEntry:error:", v28, v74);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = v74[0];

                objc_msgSend(v65, "addObject:", v47);
                if ((objc_msgSend(v47, "importSuccessful") & 1) == 0)
                {
                  v71[0] = MEMORY[0x24BDAC760];
                  v71[1] = 3221225472;
                  v71[2] = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_438;
                  v71[3] = &unk_24EC03098;
                  v72 = v48;
                  v73 = v18;
                  v49 = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_438((uint64_t)v71);

                }
                v12 = v66;
                if (objc_msgSend(v47, "exchangeRequired"))
                {
                  PO_LOG_POAgentAuthenticationProcess();
                  v50 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                  {
                    -[POKerberosEntry realm](v28, "realm");
                    v51 = (char *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v87 = v51;
                    _os_log_impl(&dword_22307D000, v50, OS_LOG_TYPE_INFO, "Exchanging Kerberos TGT for %{public}@", buf, 0xCu);

                    v12 = v66;
                  }

                  -[POAgentAuthenticationProcess exchangeTGTForStatus:](self, "exchangeTGTForStatus:", v47);
                }
                if (objc_msgSend(v47, "failedToConnect"))
                  -[POAgentAuthenticationProcess setEnableNetworkChanges:](self, "setEnableNetworkChanges:", 1);
                if ((objc_msgSend(v47, "exchangeRequired") & 1) == 0)
                {
                  v64 = v48;
                  PO_LOG_POAgentAuthenticationProcess();
                  v52 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v47, "realm");
                    v53 = (char *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v87 = v53;
                    _os_log_impl(&dword_22307D000, v52, OS_LOG_TYPE_INFO, "Notifying TGT delegate for realm: %{public}@", buf, 0xCu);

                  }
                  -[POAgentAuthenticationProcess kerberosDelegate](self, "kerberosDelegate");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "realm");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "upn");
                  v56 = self;
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "cacheName");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "TGTReceivedForRealm:upn:cache:", v55, v57, v58);

                  self = v56;
                  v12 = v66;
                  v48 = v64;
                }

              }
              else
              {
                v60 = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_441();
              }

            }
            else
            {
              v74[1] = (id)MEMORY[0x24BDAC760];
              v74[2] = (id)3221225472;
              v74[3] = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_433;
              v74[4] = &unk_24EC025A0;
              v74[5] = v18;
              v59 = __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_433();
            }
          }
          else
          {
            PO_LOG_POAgentAuthenticationProcess();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              -[POAgentAuthenticationProcess handleKerberosMappingForTokens:loginConfiguration:userConfiguration:].cold.1(&v76, v77);
          }

        }
        v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
      }
      while (v70);
    }
    else
    {
      v68 = 0;
    }

    v10 = v61;
    v16 = v65;
    objc_msgSend(v61, "setKerberosStatus:", v65);
    v9 = v62;
    v8 = v63;
    v14 = v68;
  }

}

id __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Error deserializing mapping when handling kerberos mapping."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_433()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Ticket key path not NSDictionary when handling kerberos mapping."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_433_cold_1();

  return v0;
}

id __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_438(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to import kerberos ticketmapping when handling kerberos mapping."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_438_cold_1();

  return v1;
}

id __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_441()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1008, CFSTR("Kerberos mapping is missing all required values when handling kerberos mapping."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)handleRemovingSSOTokens
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  POAgentAuthenticationProcess *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[POAgentAuthenticationProcess handleRemovingSSOTokens]";
    v19 = 2112;
    v20 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDeviceConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentDeviceConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extensionIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v11 = objc_msgSend(v7, "setTokens:extensionIdentifier:returningError:", 0, v10, &v16);
    v12 = v16;

    if ((v11 & 1) == 0)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __55__POAgentAuthenticationProcess_handleRemovingSSOTokens__block_invoke;
      v14[3] = &unk_24EC025A0;
      v12 = v12;
      v15 = v12;
      v13 = __55__POAgentAuthenticationProcess_handleRemovingSSOTokens__block_invoke((uint64_t)v14);

    }
  }
  else
  {
    v12 = 0;
  }

}

id __55__POAgentAuthenticationProcess_handleRemovingSSOTokens__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to save pending SSO tokens."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

- (void)handlePendingSSOTokensWithSharedData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  const __CFString *v48;
  const __CFString *v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  POAgentAuthenticationProcess *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v51 = "-[POAgentAuthenticationProcess handlePendingSSOTokensWithSharedData:]";
    v52 = 2112;
    v53 = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSUserName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "retrievePendingSSOTokensForUserName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x24BE72EA0];
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentDeviceConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "decryptPendingSSOTokens:UsingPrivateKey:sharedData:", v8, objc_msgSend(v11, "deviceEncryptionKey"), v4);
    v12 = objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "migratingDeviceKeys"))
      {
        -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "userDeviceConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          v12 = 0;
          goto LABEL_14;
        }
        PO_LOG_POAgentAuthenticationProcess();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22307D000, v16, OS_LOG_TYPE_INFO, "Handling Pending SSO During Migration", buf, 2u);
        }

        v17 = (void *)MEMORY[0x24BE72EA0];
        -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "userDeviceConfiguration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "decryptPendingSSOTokens:UsingPrivateKey:sharedData:", v8, objc_msgSend(v18, "deviceEncryptionKey"), v4);
        v12 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = 0;
      }

    }
LABEL_14:
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "currentDeviceConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "extensionIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v23 = objc_msgSend(v19, "setTokens:extensionIdentifier:returningError:", v12, v22, &v47);
    v24 = v47;

    if ((v23 & 1) != 0)
    {
      -[POAgentAuthenticationProcess setupTimerForAuthentication](self, "setupTimerForAuthentication");
      if (v12)
      {
        PO_LOG_POAgentAuthenticationProcess();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22307D000, v25, OS_LOG_TYPE_INFO, "Pending SSO Tokens Saved", buf, 2u);
        }

        -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "currentUserConfiguration");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "state");

        if (v28 == 1)
        {
          -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "currentUserConfiguration");
          v30 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v30, "setState:", 0);

          -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v30) = objc_msgSend(v31, "saveCurrentUserConfigurationAndSyncToPreboot:", 0);

          if ((v30 & 1) == 0)
            v32 = __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke_447();
        }
        -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "currentLoginConfiguration");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
        v35 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v35, "currentUserConfiguration");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[POAgentAuthenticationProcess handleKerberosMappingForTokens:loginConfiguration:userConfiguration:](self, "handleKerberosMappingForTokens:loginConfiguration:userConfiguration:", v12, v34, v36);

        -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        NSUserName();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v35) = objc_msgSend(v37, "savePendingSSOTokens:forUserName:", 0, v38);

        if ((v35 & 1) != 0)
        {
          -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = CFSTR("com.apple.PlatformSSO.authentication");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "removeDeliveredNotificationsWithIdentifiers:", v40);

          -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = CFSTR("com.apple.PlatformSSO.authentication");
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "removePendingNotificationRequestsWithIdentifiers:", v42);

        }
        else
        {
          v44 = __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke_451();
        }
      }
    }
    else
    {
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke;
      v45[3] = &unk_24EC025A0;
      v46 = v24;
      v43 = __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke((uint64_t)v45);

    }
    goto LABEL_26;
  }
  PO_LOG_POAgentAuthenticationProcess();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess handlePendingSSOTokensWithSharedData:].cold.1();
LABEL_26:

}

id __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:underlyingError:description:", -1001, *(_QWORD *)(a1 + 32), CFSTR("Failed to save pending SSO tokens."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v1;
}

id __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke_447()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration after saving pending SSO tokens."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __69__POAgentAuthenticationProcess_handlePendingSSOTokensWithSharedData___block_invoke_451()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to clear pending SSO tokens."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)handleUnfinishedTGTExchanges
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  char *v14;
  NSObject *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  POAgentAuthenticationProcess *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[POAgentAuthenticationProcess handleUnfinishedTGTExchanges]";
    v33 = 2112;
    v34 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUserConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v5, "kerberosStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v7)
    {
      v8 = v7;
      v25 = v5;
      v9 = 0;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v12, "exchangeRequired"))
          {
            PO_LOG_POAgentAuthenticationProcess();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v12, "realm");
              v14 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v32 = v14;
              _os_log_impl(&dword_22307D000, v13, OS_LOG_TYPE_INFO, "Exchanging Kerberos TGT for %{public}@", buf, 0xCu);

            }
            -[POAgentAuthenticationProcess exchangeTGTForStatus:](self, "exchangeTGTForStatus:", v12);
            if (objc_msgSend(v12, "failedToConnect"))
              -[POAgentAuthenticationProcess setEnableNetworkChanges:](self, "setEnableNetworkChanges:", 1);
            if ((objc_msgSend(v12, "exchangeRequired") & 1) == 0)
            {
              PO_LOG_POAgentAuthenticationProcess();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v12, "realm");
                v16 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v32 = v16;
                _os_log_impl(&dword_22307D000, v15, OS_LOG_TYPE_INFO, "Notifying TGT delegate for realm: %{public}@", buf, 0xCu);

              }
              -[POAgentAuthenticationProcess kerberosDelegate](self, "kerberosDelegate");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "realm");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "upn");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "cacheName");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "TGTReceivedForRealm:upn:cache:", v18, v19, v20);

              v9 = 1;
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v8);

      v5 = v25;
      if ((v9 & 1) != 0)
      {
        -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "saveCurrentUserConfigurationAndSyncToPreboot:", 0);

        if ((v22 & 1) == 0)
          v23 = __60__POAgentAuthenticationProcess_handleUnfinishedTGTExchanges__block_invoke_458();
      }
    }
    else
    {

    }
  }
  else
  {
    v24 = __60__POAgentAuthenticationProcess_handleUnfinishedTGTExchanges__block_invoke();
  }

}

id __60__POAgentAuthenticationProcess_handleUnfinishedTGTExchanges__block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("No user configuration when handling unfinished TGT exchanges."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POAgentAuthenticationProcess_handleUnfinishedTGTExchanges__block_invoke_458()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to save user configuration when handling unfinished TGT exchanges."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)notifyKerberosDelegateTGTDidBegin
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  POAgentAuthenticationProcess *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[POAgentAuthenticationProcess notifyKerberosDelegateTGTDidBegin]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v5, 0x16u);
  }

  -[POAgentAuthenticationProcess kerberosDelegate](self, "kerberosDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "TGTRequestDidBegin");

}

- (void)notifyKerberosDelegateTGTDidComplete
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  POAgentAuthenticationProcess *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[POAgentAuthenticationProcess notifyKerberosDelegateTGTDidComplete]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v5, 0x16u);
  }

  -[POAgentAuthenticationProcess kerberosDelegate](self, "kerberosDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "TGTRequestDidComplete");

}

- (void)setupTimerForAuthentication
{
  NSObject *v3;
  POAgentAuthenticationProcess *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  POAgentAuthenticationProcess *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315394;
    v21 = "-[POAgentAuthenticationProcess setupTimerForAuthentication]";
    v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v20, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[POAgentAuthenticationProcess authenticationTimer](v4, "authenticationTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[POAgentAuthenticationProcess authenticationTimer](v4, "authenticationTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    -[POAgentAuthenticationProcess setAuthenticationTimer:](v4, "setAuthenticationTimer:", 0);
  }
  -[POAgentAuthenticationProcess configurationManager](v4, "configurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentUserConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[POAgentAuthenticationProcess configurationManager](v4, "configurationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tokenReceived");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "timeIntervalSinceNow");
    if (v11 >= -14400.0)
    {
      objc_msgSend(v10, "dateByAddingTimeInterval:", 14400.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      -[POAgentAuthenticationProcess configurationManager](v4, "configurationManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tokenExpiration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        goto LABEL_14;
    }
    PO_LOG_POAgentAuthenticationProcess();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v20 = 138543362;
      v21 = (const char *)v13;
      _os_log_impl(&dword_22307D000, v15, OS_LOG_TYPE_INFO, "Refresh token timer set: %{public}@", (uint8_t *)&v20, 0xCu);
    }

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF40]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v13, v4, sel_performLoginForCurrentUserWithPasswordContext_, 0, 0, 0.0);
    -[POAgentAuthenticationProcess setAuthenticationTimer:](v4, "setAuthenticationTimer:", v16);

    -[POAgentAuthenticationProcess authenticationTimer](v4, "authenticationTimer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTolerance:", 300.0);

    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[POAgentAuthenticationProcess authenticationTimer](v4, "authenticationTimer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addTimer:forMode:", v19, *MEMORY[0x24BDBCA90]);

    goto LABEL_14;
  }
  v14 = __59__POAgentAuthenticationProcess_setupTimerForAuthentication__block_invoke();
LABEL_15:

  objc_sync_exit(v4);
}

id __59__POAgentAuthenticationProcess_setupTimerForAuthentication__block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("No user configuration when handling setting up authentication timer."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (BOOL)isCurrentSSOExtension:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  BOOL v12;
  id v13;
  id v14;
  id v16;

  v4 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess isCurrentSSOExtension:].cold.1();

  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDeviceConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v13 = __54__POAgentAuthenticationProcess_isCurrentSSOExtension___block_invoke();
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  -[POAgentAuthenticationProcess configurationManager](self, "configurationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDeviceConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extensionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v4);

  if ((v11 & 1) == 0)
  {
    v16 = v4;
    v14 = __54__POAgentAuthenticationProcess_isCurrentSSOExtension___block_invoke_472();

    goto LABEL_8;
  }
  v12 = 1;
LABEL_9:

  return v12;
}

id __54__POAgentAuthenticationProcess_isCurrentSSOExtension___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("No device configuration when checking sso extension."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __54__POAgentAuthenticationProcess_isCurrentSSOExtension___block_invoke_472()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1005, CFSTR("Caller is not current extension when checking sso extension."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __55__POConfigurationManager_userConfigurationForUserName___block_invoke_cold_1();

  return v0;
}

- (id)deviceSigningAlgorithmToUse:(id)a3 deviceConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;

  v6 = a4;
  objc_msgSend(a3, "supportedDeviceSigningAlgorithms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "signingAlgorithm");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = (void *)*MEMORY[0x24BE72F38];
    if (v11)
      v13 = (void *)v11;
    v14 = v13;
LABEL_8:
    v10 = v14;

    goto LABEL_9;
  }
  v8 = (void *)*MEMORY[0x24BE72F40];
  if (!objc_msgSend(v7, "containsObject:", *MEMORY[0x24BE72F40]))
  {
    v8 = (void *)*MEMORY[0x24BE72F38];
    if (!objc_msgSend(v7, "containsObject:", *MEMORY[0x24BE72F38]))
    {
      v16 = *MEMORY[0x24BE72F48];
      if (!objc_msgSend(v7, "containsObject:", *MEMORY[0x24BE72F48]))
      {
        v10 = v8;
        goto LABEL_9;
      }
      objc_msgSend(v6, "signingAlgorithm");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess bestSigningAlgorithm:or:](self, "bestSigningAlgorithm:or:", v16, v12);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  objc_msgSend(v6, "signingAlgorithm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[POAgentAuthenticationProcess bestSigningAlgorithm:or:](self, "bestSigningAlgorithm:or:", v8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v10;
}

- (id)bestSigningAlgorithm:(id)a3 or:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  char v13;
  uint64_t v14;
  char v15;
  id v16;

  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x24BE72F40];
  v8 = objc_msgSend(v5, "isEqualToNumber:", *MEMORY[0x24BE72F40]);
  v9 = v5;
  if ((v8 & 1) == 0)
  {
    v10 = objc_msgSend(v6, "isEqualToNumber:", v7);
    v9 = v6;
    if ((v10 & 1) == 0)
    {
      v11 = (void *)*MEMORY[0x24BE72F38];
      v12 = objc_msgSend(v5, "isEqualToNumber:", *MEMORY[0x24BE72F38]);
      v9 = v5;
      if ((v12 & 1) == 0)
      {
        v13 = objc_msgSend(v6, "isEqualToNumber:", v11);
        v9 = v6;
        if ((v13 & 1) == 0)
        {
          v14 = *MEMORY[0x24BE72F48];
          v15 = objc_msgSend(v5, "isEqualToNumber:", *MEMORY[0x24BE72F48]);
          v9 = v5;
          if ((v15 & 1) == 0)
          {
            if (objc_msgSend(v6, "isEqualToNumber:", v14))
              v9 = v6;
            else
              v9 = v11;
          }
        }
      }
    }
  }
  v16 = v9;

  return v16;
}

- (id)deviceEncryptionAlgorithmToUse:(id)a3 deviceConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "supportedDeviceEncryptionAlgorithms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)*MEMORY[0x24BE72F30];
    if (objc_msgSend(v7, "containsObject:", *MEMORY[0x24BE72F30])
      || (v8 = (void *)*MEMORY[0x24BE72F28], objc_msgSend(v7, "containsObject:", *MEMORY[0x24BE72F28]))
      || (v8 = (void *)*MEMORY[0x24BE72F20], objc_msgSend(v7, "containsObject:", *MEMORY[0x24BE72F20]))
      || (v8 = (void *)*MEMORY[0x24BE72F18], objc_msgSend(v7, "containsObject:", *MEMORY[0x24BE72F18])))
    {
      objc_msgSend(v6, "encryptionAlgorithm");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess bestEncryptionAlgorithm:or:](self, "bestEncryptionAlgorithm:or:", v8, v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = v8;
    }
  }
  else
  {
    objc_msgSend(v6, "encryptionAlgorithm");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = (void *)*MEMORY[0x24BE72F18];
    if (v11)
      v13 = (void *)v11;
    v10 = v13;

  }
  return v10;
}

- (id)bestEncryptionAlgorithm:(id)a3 or:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  void *v9;
  char v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  char v15;
  char v16;
  void *v17;
  char v18;
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x24BE72F30];
  v8 = objc_msgSend(v5, "isEqualToNumber:", *MEMORY[0x24BE72F30]);
  v9 = v5;
  if ((v8 & 1) == 0)
  {
    v10 = objc_msgSend(v6, "isEqualToNumber:", v7);
    v9 = v6;
    if ((v10 & 1) == 0)
    {
      v11 = *MEMORY[0x24BE72F28];
      v12 = objc_msgSend(v5, "isEqualToNumber:", *MEMORY[0x24BE72F28]);
      v9 = v5;
      if ((v12 & 1) == 0)
      {
        v13 = objc_msgSend(v6, "isEqualToNumber:", v11);
        v9 = v6;
        if ((v13 & 1) == 0)
        {
          v14 = *MEMORY[0x24BE72F20];
          v15 = objc_msgSend(v5, "isEqualToNumber:", *MEMORY[0x24BE72F20]);
          v9 = v5;
          if ((v15 & 1) == 0)
          {
            v16 = objc_msgSend(v6, "isEqualToNumber:", v14);
            v9 = v6;
            if ((v16 & 1) == 0)
            {
              v17 = (void *)*MEMORY[0x24BE72F18];
              v18 = objc_msgSend(v5, "isEqualToNumber:", *MEMORY[0x24BE72F18]);
              v9 = v5;
              if ((v18 & 1) == 0)
              {
                if (objc_msgSend(v6, "isEqualToNumber:", v17))
                  v9 = v6;
                else
                  v9 = v17;
              }
            }
          }
        }
      }
    }
  }
  v19 = v9;

  return v19;
}

- (id)userSigningAlgorithmToUse:(id)a3 userConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;

  v6 = a4;
  objc_msgSend(a3, "supportedUserSecureEnclaveKeySigningAlgorithms");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "signingAlgorithm");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = (void *)*MEMORY[0x24BE72F38];
    if (v11)
      v13 = (void *)v11;
    v14 = v13;
LABEL_8:
    v10 = v14;

    goto LABEL_9;
  }
  v8 = (void *)*MEMORY[0x24BE72F40];
  if (!objc_msgSend(v7, "containsObject:", *MEMORY[0x24BE72F40]))
  {
    v8 = (void *)*MEMORY[0x24BE72F38];
    if (!objc_msgSend(v7, "containsObject:", *MEMORY[0x24BE72F38]))
    {
      v16 = *MEMORY[0x24BE72F48];
      if (!objc_msgSend(v7, "containsObject:", *MEMORY[0x24BE72F48]))
      {
        v10 = v8;
        goto LABEL_9;
      }
      objc_msgSend(v6, "signingAlgorithm");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[POAgentAuthenticationProcess bestSigningAlgorithm:or:](self, "bestSigningAlgorithm:or:", v16, v12);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  objc_msgSend(v6, "signingAlgorithm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[POAgentAuthenticationProcess bestSigningAlgorithm:or:](self, "bestSigningAlgorithm:or:", v8, v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v10;
}

- (void)windowDidClose
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  POAgentAuthenticationProcess *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD16E0];
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "failureCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315906;
    v12 = "-[POAgentAuthenticationProcess windowDidClose]";
    v13 = 2114;
    v14 = v6;
    v15 = 2114;
    v16 = v9;
    v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s state = %{public}@, failureCount = %{public}@ on %@", (uint8_t *)&v11, 0x2Au);

  }
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "state");

}

- (void)requestDidCompleteWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  POAgentAuthenticationProcess *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  POAgentAuthenticationProcess *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PO_LOG_POAgentAuthenticationProcess();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v7, "state"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD16E0];
    -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "failureCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v23 = "-[POAgentAuthenticationProcess requestDidCompleteWithError:]";
    v24 = 2114;
    v25 = v8;
    v26 = 2114;
    v27 = v11;
    v28 = 2112;
    v29 = self;
    _os_log_impl(&dword_22307D000, v5, OS_LOG_TYPE_DEFAULT, "%s state = %{public}@, failureCount = %{public}@ on %@", buf, 0x2Au);

  }
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "state") == 1;

  if (!v13)
  {
    v14 = self;
    objc_sync_enter(v14);
    -[POAgentAuthenticationProcess registrationContext](v14, "registrationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ssoExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (v17)
    {
      objc_sync_exit(v14);

    }
    else
    {
      -[POAgentAuthenticationProcess registrationContext](v14, "registrationContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "ssoExtension");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "unload");

      -[POAgentAuthenticationProcess registrationContext](v14, "registrationContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setSsoExtension:", 0);

      objc_sync_exit(v14);
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke;
      v21[3] = &unk_24EC03158;
      v21[4] = v14;
      -[POAgentAuthenticationProcess showAlertWithError:completion:](v14, "showAlertWithError:completion:", v4, v21);
    }
  }

}

void __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD block[5];
  _QWORD v37[5];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFailureCount:", objc_msgSend(v2, "failureCount") + 1);

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "failureCount");

  v5 = *(void **)(a1 + 32);
  if (v4 < 2)
  {
    objc_msgSend(v5, "registrationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "state");

    if (v8 == 4)
    {
      dispatch_get_global_queue(0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_483;
      v37[3] = &unk_24EC02ED0;
      v37[4] = *(_QWORD *)(a1 + 32);
      v11 = v37;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "registrationContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "state");

      if (v21 != 7)
      {
        objc_msgSend(*(id *)(a1 + 32), "setRegistrationFailed:", 1);
        objc_msgSend(*(id *)(a1 + 32), "distributedNotificationCenter");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.UserRegistrationStatusDidChange"), 0, 0, 1);

        objc_msgSend(*(id *)(a1 + 32), "distributedNotificationCenter");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.DeviceRegistrationStatusDidChange"), 0, 0, 1);

        return;
      }
      dispatch_get_global_queue(0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_3;
      block[3] = &unk_24EC02ED0;
      block[4] = *(_QWORD *)(a1 + 32);
      v11 = block;
    }
    dispatch_async(v9, v11);

    return;
  }
  objc_msgSend(v5, "setRegistrationFailed:", 1);
  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isRetry"))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "registrationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "state");

    if (v13 == 4)
    {
      PO_LOG_POAgentAuthenticationProcess();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v39 = "-[POAgentAuthenticationProcess requestDidCompleteWithError:]_block_invoke";
        v40 = 2112;
        v41 = v15;
        _os_log_impl(&dword_22307D000, v14, OS_LOG_TYPE_DEFAULT, "%s removing login configuration on %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "configurationManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "removeLoginConfiguration");

      if ((v17 & 1) == 0)
        v18 = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_475();
      goto LABEL_21;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isRetry"))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "registrationContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "state");

    if (v23 == 7)
    {
      PO_LOG_POAgentAuthenticationProcess();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v39 = "-[POAgentAuthenticationProcess requestDidCompleteWithError:]_block_invoke";
        v40 = 2112;
        v41 = v25;
        _os_log_impl(&dword_22307D000, v24, OS_LOG_TYPE_DEFAULT, "%s removing user configuration on %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 32), "configurationManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "currentUserConfiguration");
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v27, "setState:", 2);

      objc_msgSend(*(id *)(a1 + 32), "configurationManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v27) = objc_msgSend(v28, "saveCurrentUserConfigurationAndSyncToPreboot:", 1);

      if ((v27 & 1) == 0)
        v29 = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_479();
    }
  }
LABEL_21:
  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "registrationUI");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
    objc_msgSend(*(id *)(a1 + 32), "setRegistrationContext:", 0);
  objc_msgSend(*(id *)(a1 + 32), "distributedNotificationCenter");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.UserRegistrationStatusDidChange"), 0, 0, 1);

  objc_msgSend(*(id *)(a1 + 32), "distributedNotificationCenter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.platformSSO.DeviceRegistrationStatusDidChange"), 0, 0, 1);

}

id __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_475()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to remove login configuration after extension crash."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_479()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1001, CFSTR("Failed to remove user configuration after extension crash."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentAuthenticationProcess();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

void __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_483(uint64_t a1)
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_2;
  activity_block[3] = &unk_24EC02ED0;
  activity_block[4] = *(_QWORD *)(a1 + 32);
  _os_activity_initiate(&dword_22307D000, "PSSODeviceRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userNotified");

  v4 = *(void **)(a1 + 32);
  if (v3)
    return objc_msgSend(v4, "_startDeviceRegistration");
  else
    return objc_msgSend(v4, "showRegistrationUI");
}

void __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_3(uint64_t a1)
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_4;
  activity_block[3] = &unk_24EC02ED0;
  activity_block[4] = *(_QWORD *)(a1 + 32);
  _os_activity_initiate(&dword_22307D000, "PSSOUserRegistration", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __60__POAgentAuthenticationProcess_requestDidCompleteWithError___block_invoke_4(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userNotified");

  v4 = *(void **)(a1 + 32);
  if (v3)
    return objc_msgSend(v4, "_startUserRegistration");
  else
    return objc_msgSend(v4, "showRegistrationUI");
}

- (id)createSignInNotificationWithAccountName:(id)a3 extensionIdentifier:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = a4;
  -[POAgentAuthenticationProcess loadSSOExtensionWithExtensionBundleIdentifier:](self, "loadSSOExtensionWithExtensionBundleIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDF8800]);
  if (v6)
    v10 = v6;
  else
    v10 = &stru_24EC04270;
  v22[0] = CFSTR("account_name");
  v22[1] = CFSTR("extension_identifier");
  v23[0] = v10;
  v23[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInfo:", v11);

  objc_msgSend(v9, "setShouldBackgroundDefaultAction:", 1);
  v12 = (void *)MEMORY[0x24BDF8850];
  objc_msgSend(v8, "containerAppBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconForApplicationIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIcon:", v14);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SIGNIN_TITLE"), &stru_24EC04270, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v16);

  if (-[__CFString length](v6, "length"))
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CUSTOM_NOTIFICATION_SIGNIN_BODY"), &stru_24EC04270, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringWithFormat:", v19, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBody:", v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("DEFAULT_NOTIFICATION_SIGNIN_BODY"), &stru_24EC04270, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBody:", v19);
  }

  objc_msgSend(v9, "setCategoryIdentifier:", CFSTR("LOGIN_USER"));
  objc_msgSend(v9, "setInterruptionLevel:", 2);
  objc_msgSend(v9, "setShouldPreventNotificationDismissalAfterDefaultAction:", 1);

  return v9;
}

- (id)createRegistrationNotificationWithAccountName:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  const __CFString *v26;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(v5, "setShouldBackgroundDefaultAction:", 1);
  v6 = (void *)MEMORY[0x24BDF8850];
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerAppBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconForApplicationIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIcon:", v9);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REGISTRATION_TITLE"), &stru_24EC04270, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v11);

  v12 = objc_msgSend(v4, "length");
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isNewPasswordUser");

  if (v12)
  {
    if ((v14 & 1) != 0)
    {
      v15 = CFSTR("CUSTOM_NOTIFICATION_COMPLETE_REGISTRATION_BODY");
    }
    else
    {
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "authMethod");

      if (v18 == 1)
        v15 = CFSTR("CUSTOM_PASSWORD_NOTIFICATION_REGISTRATION_BODY");
      else
        v15 = CFSTR("CUSTOM_NOTIFICATION_REGISTRATION_BODY");
    }
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", v15, &stru_24EC04270, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringWithFormat:", v21, v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBody:", v22);

  }
  else
  {
    if ((v14 & 1) != 0)
    {
      v16 = CFSTR("DEFAULT_NOTIFICATION_COMPLETE_REGISTRATION_BODY");
    }
    else
    {
      -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "authMethod");

      if (v24 == 1)
        v16 = CFSTR("DEFAULT_PASSWORD_NOTIFICATION_REGISTRATION_BODY");
      else
        v16 = CFSTR("DEFAULT_NOTIFICATION_REGISTRATION_BODY");
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", v16, &stru_24EC04270, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBody:", v21);
  }

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "isUserNotification"))
    v26 = CFSTR("REGISTER_USER");
  else
    v26 = CFSTR("REGISTER_DEVICE");
  objc_msgSend(v5, "setCategoryIdentifier:", v26);

  objc_msgSend(v5, "setInterruptionLevel:", 2);
  objc_msgSend(v5, "setShouldPreventNotificationDismissalAfterDefaultAction:", 1);

  return v5;
}

- (id)createRegistrationUpdateNotificationWithAccountName:(id)a3
{
  id v4;
  id v5;
  void *v6;
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
  const __CFString *v17;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(v5, "setShouldBackgroundDefaultAction:", 1);
  v6 = (void *)MEMORY[0x24BDF8850];
  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerAppBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconForApplicationIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIcon:", v9);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REGISTRATION_UPDATE_TITLE"), &stru_24EC04270, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v11);

  if (objc_msgSend(v4, "length"))
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CUSTOM_NOTIFICATION_REGISTRATION_UPDATE_BODY"), &stru_24EC04270, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v14, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBody:", v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DEFAULT_NOTIFICATION_REGISTRATION_UPDATE_BODY"), &stru_24EC04270, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBody:", v14);
  }

  -[POAgentAuthenticationProcess registrationContext](self, "registrationContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isUserNotification"))
    v17 = CFSTR("REGISTER_USER");
  else
    v17 = CFSTR("REGISTER_DEVICE");
  objc_msgSend(v5, "setCategoryIdentifier:", v17);

  objc_msgSend(v5, "setInterruptionLevel:", 2);
  objc_msgSend(v5, "setShouldPreventNotificationDismissalAfterDefaultAction:", 1);

  return v5;
}

- (id)createPasswordChangedNotificationWithAccountName:(id)a3 extensionIdentifier:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v5 = a3;
  v6 = (objc_class *)MEMORY[0x24BDF8800];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setShouldBackgroundDefaultAction:", 1);
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v7, 0, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "containingBundleRecord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF8850], "iconForApplicationIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIcon:", v12);

  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_PASSWORDCHANGED_TITLE"), &stru_24EC04270, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v14);

  if (objc_msgSend(v5, "length"))
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CUSTOM_NOTIFICATION_PASSWORDCHANGED_BODY"), &stru_24EC04270, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v17, v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBody:", v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DEFAULT_NOTIFICATION_PASSWORDCHANGED_BODY"), &stru_24EC04270, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBody:", v17);
  }

  objc_msgSend(v8, "setInterruptionLevel:", 2);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 180.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExpirationDate:", v19);

  return v8;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  POAgentAuthenticationProcess *v15;
  id v16;

  v7 = a4;
  v8 = a5;
  PO_LOG_POAgentAuthenticationProcess();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[POAgentAuthenticationProcess userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:].cold.1();

  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke;
  block[3] = &unk_24EC032A8;
  v14 = v7;
  v15 = self;
  v16 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, block);

}

void __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
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
  char v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t (*v39)(uint64_t);
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  NSObject *v54;
  NSObject *v55;
  uint64_t (*v56)(uint64_t);
  uint64_t *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD block[5];
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentAuthenticationProcess();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "actionIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "notification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "content");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "categoryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v81 = v3;
    v82 = 2114;
    v83 = v7;
    _os_log_impl(&dword_22307D000, v2, OS_LOG_TYPE_INFO, "%{public}@, %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "notification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "categoryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("LOGIN_USER"));
  v13 = (_QWORD *)MEMORY[0x24BDF8A70];
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "actionIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDF8A60]))
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "actionIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("LOGIN"));

      if (!v16)
      {
LABEL_8:
        objc_msgSend(*(id *)(a1 + 32), "actionIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", *v13);

        if (v23)
        {
          dispatch_get_global_queue(0, 0);
          v24 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_520;
          block[3] = &unk_24EC02ED0;
          block[4] = *(_QWORD *)(a1 + 40);
          dispatch_async(v24, block);

        }
        objc_msgSend(*(id *)(a1 + 40), "userNotificationCenter");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "notification");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "request");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v28;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v79, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "removeDeliveredNotificationsWithIdentifiers:", v29);

        objc_msgSend(*(id *)(a1 + 40), "userNotificationCenter");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "notification");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "request");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v33;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v78, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removePendingNotificationRequestsWithIdentifiers:", v34);

        goto LABEL_11;
      }
    }
    v17 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "notification");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "request");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "content");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "userInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "requestUserAuthenticationWithUserInfo:", v21);

    goto LABEL_8;
  }
LABEL_11:
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("REGISTER_DEVICE")))
  {
    objc_msgSend(*(id *)(a1 + 32), "actionIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isEqualToString:", *v13);

    dispatch_get_global_queue(0, 0);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if ((v36 & 1) != 0)
    {
      v71 = MEMORY[0x24BDAC760];
      v39 = __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_3;
      v40 = &v71;
    }
    else
    {
      v72 = MEMORY[0x24BDAC760];
      v39 = __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2;
      v40 = &v72;
    }
    v40[1] = 3221225472;
    v40[2] = (uint64_t)v39;
    v41 = *(_QWORD *)(a1 + 40);
    v40[3] = (uint64_t)&unk_24EC02ED0;
    v40[4] = v41;
    dispatch_async(v37, v40);

    objc_msgSend(*(id *)(a1 + 40), "userNotificationCenter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "notification");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "request");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "identifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v45;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v77, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "removeDeliveredNotificationsWithIdentifiers:", v46);

    objc_msgSend(*(id *)(a1 + 40), "userNotificationCenter");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "notification");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "request");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "identifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v50;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v76, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "removePendingNotificationRequestsWithIdentifiers:", v51);

  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("REGISTER_USER")))
  {
    objc_msgSend(*(id *)(a1 + 32), "actionIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "isEqualToString:", *v13);

    dispatch_get_global_queue(0, 0);
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if ((v53 & 1) != 0)
    {
      v69 = MEMORY[0x24BDAC760];
      v56 = __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_5;
      v57 = &v69;
    }
    else
    {
      v70 = MEMORY[0x24BDAC760];
      v56 = __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_4;
      v57 = &v70;
    }
    v57[1] = 3221225472;
    v57[2] = (uint64_t)v56;
    v58 = *(_QWORD *)(a1 + 40);
    v57[3] = (uint64_t)&unk_24EC02ED0;
    v57[4] = v58;
    dispatch_async(v54, v57);

    objc_msgSend(*(id *)(a1 + 40), "userNotificationCenter");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "notification");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "request");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "identifier");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v62;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v75, 1);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "removeDeliveredNotificationsWithIdentifiers:", v63);

    objc_msgSend(*(id *)(a1 + 40), "userNotificationCenter");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "notification");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "request");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "identifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v67;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v74, 1);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "removePendingNotificationRequestsWithIdentifiers:", v68);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_520(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleUserNeedsReauthenticationAfterDelay:", 30.0);
}

uint64_t __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDeviceRegistrationNotification");
}

uint64_t __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRetry:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "promptUserForRegistration");
}

uint64_t __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleUserRegistrationNotification");
}

uint64_t __108__POAgentAuthenticationProcess_userNotificationCenter_didReceiveNotificationResponse_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "registrationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRetry:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "promptUserForRegistration");
}

- (void)setupNotificationCategories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[3];
  void *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDF8820];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_SIGNIN_BUTTON"), &stru_24EC04270, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionWithIdentifier:title:options:", CFSTR("LOGIN"), v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDF8820];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_REGISTER_BUTTON"), &stru_24EC04270, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithIdentifier:title:options:", CFSTR("REGISTER"), v9, 65537);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDF8838];
  v28[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v11, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("LOGIN_USER"), v12, MEMORY[0x24BDBD1A8], 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x24BDF8838];
  v27 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("REGISTER_USER"), v16, v13, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x24BDF8838];
  v26 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("REGISTER_DEVICE"), v19, v13, 5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[POAgentAuthenticationProcess userNotificationCenter](self, "userNotificationCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BDBCF20];
  v25[0] = v14;
  v25[1] = v17;
  v25[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setNotificationCategories:", v24);

}

- (BOOL)registrationFailed
{
  return self->_registrationFailed;
}

- (void)setRegistrationFailed:(BOOL)a3
{
  self->_registrationFailed = a3;
}

- (POConfigurationManager)configurationManager
{
  return (POConfigurationManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfigurationManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (POAuthenticationProcess)authenticationProcess
{
  return (POAuthenticationProcess *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAuthenticationProcess:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (POJWKSStorageProvider)jwksStorageProvider
{
  return (POJWKSStorageProvider *)objc_getProperty(self, a2, 32, 1);
}

- (void)setJwksStorageProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (SOConfigurationHost)configurationHost
{
  return (SOConfigurationHost *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfigurationHost:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (SOExtensionManager)extensionManager
{
  return (SOExtensionManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtensionManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (POKeyBag)keyBag
{
  return (POKeyBag *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeyBag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (POKeyWrap)keyWrap
{
  return (POKeyWrap *)objc_getProperty(self, a2, 64, 1);
}

- (void)setKeyWrap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return (UNUserNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setUserNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 80, 1);
}

- (void)setNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDistributedNotificationCenter)distributedNotificationCenter
{
  return (NSDistributedNotificationCenter *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDistributedNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (POKerberosHelper)kerberosHelper
{
  return (POKerberosHelper *)objc_getProperty(self, a2, 96, 1);
}

- (void)setKerberosHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PODirectoryServices)directoryServices
{
  return (PODirectoryServices *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDirectoryServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (POTokenHelper)tokenHelper
{
  return (POTokenHelper *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTokenHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (POKeychainHelper)keychainHelper
{
  return (POKeychainHelper *)objc_getProperty(self, a2, 120, 1);
}

- (void)setKeychainHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PORegistrationContext)registrationContext
{
  return (PORegistrationContext *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRegistrationContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSTimer)authenticationTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAuthenticationTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSDate)lastAuthenticationAttempt
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastAuthenticationAttempt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSString)userName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setUserName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (BOOL)platformSSOAccount
{
  return self->_platformSSOAccount;
}

- (void)setPlatformSSOAccount:(BOOL)a3
{
  self->_platformSSOAccount = a3;
}

- (BOOL)platformSSOActive
{
  return self->_platformSSOActive;
}

- (void)setPlatformSSOActive:(BOOL)a3
{
  self->_platformSSOActive = a3;
}

- (BOOL)enableNetworkChanges
{
  return self->_enableNetworkChanges;
}

- (void)setEnableNetworkChanges:(BOOL)a3
{
  self->_enableNetworkChanges = a3;
}

- (BOOL)shouldRunConfigurationChangeWhenUnlocked
{
  return self->_shouldRunConfigurationChangeWhenUnlocked;
}

- (void)setShouldRunConfigurationChangeWhenUnlocked:(BOOL)a3
{
  self->_shouldRunConfigurationChangeWhenUnlocked = a3;
}

- (OS_dispatch_queue)loginQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLoginQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (id)__screenUnlockHandler
{
  return self->___screenUnlockHandler;
}

- (void)set__screenUnlockHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)screenUnlocked
{
  return self->_screenUnlocked;
}

- (void)setScreenUnlocked:(BOOL)a3
{
  self->_screenUnlocked = a3;
}

- (id)__shieldLoweredHandler
{
  return self->___shieldLoweredHandler;
}

- (void)set__shieldLoweredHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)shieldLowered
{
  return self->_shieldLowered;
}

- (void)setShieldLowered:(BOOL)a3
{
  self->_shieldLowered = a3;
}

- (POAgentAuthenticationProcessKerberosDelegate)kerberosDelegate
{
  return (POAgentAuthenticationProcessKerberosDelegate *)objc_loadWeakRetained((id *)&self->_kerberosDelegate);
}

- (void)setKerberosDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_kerberosDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_kerberosDelegate);
  objc_storeStrong(&self->___shieldLoweredHandler, 0);
  objc_storeStrong(&self->___screenUnlockHandler, 0);
  objc_storeStrong((id *)&self->_loginQueue, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_lastAuthenticationAttempt, 0);
  objc_storeStrong((id *)&self->_authenticationTimer, 0);
  objc_storeStrong((id *)&self->_registrationContext, 0);
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_tokenHelper, 0);
  objc_storeStrong((id *)&self->_directoryServices, 0);
  objc_storeStrong((id *)&self->_kerberosHelper, 0);
  objc_storeStrong((id *)&self->_distributedNotificationCenter, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_keyWrap, 0);
  objc_storeStrong((id *)&self->_keyBag, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_configurationHost, 0);
  objc_storeStrong((id *)&self->_jwksStorageProvider, 0);
  objc_storeStrong((id *)&self->_authenticationProcess, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

- (void)initWithDelegate:.cold.1()
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

- (void)handleScreenUnlockWithCredentialContext:tokenId:atLogin:tokenUnlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "PIN is set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleScreenUnlockWithCredentialContext:tokenId:atLogin:tokenUnlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Password is set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleScreenUnlockWithCredentialContext:tokenId:atLogin:tokenUnlock:.cold.3()
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

- (void)doUnlockForSmartCardWithCredentialContext:tokenId:atLogin:.cold.1()
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

- (void)doUnlockForPasswordWithCredentialContext:atLogin:.cold.1()
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

- (void)doUnlockForTokenUnlockWithCredentialContext:atLogin:.cold.1()
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

- (void)doUnlockForTokenLoginWithCredentialContext:atLogin:.cold.1()
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

- (void)_doUnlockForTokenWithCredentialContext:atLogin:.cold.1()
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

void __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Updating local account password", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __79__POAgentAuthenticationProcess__doUnlockForTokenWithCredentialContext_atLogin___block_invoke_65_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE72E90], "stringForLoginResult:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_16(&dword_22307D000, a2, v4, "Password update result: %{public}@", v5);

  OUTLINED_FUNCTION_9();
}

- (void)doUnlockWithEmptyCredentialContext:atLogin:.cold.1()
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

void __50__POAgentAuthenticationProcess_handleAgentStartup__block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "First Unlock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Network Changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_79_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "not a PlatformSSO account", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_79_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Platform SSO not enabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __51__POAgentAuthenticationProcess_handleNetworkChange__block_invoke_79_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Nothing to do", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)performLoginForCurrentUserWithPasswordContext:tokenId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Auth in progress, skipping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)performLoginForCurrentUserWithPasswordContext:tokenId:.cold.3()
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

- (void)_doRefreshWithPasswordContext:tokenId:.cold.1()
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

- (void)_doLoginWithPasswordContext:tokenId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Using context from unlock.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_doLoginWithPasswordContext:(_BYTE *)a1 tokenId:(_BYTE *)a2 .cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_17(a1, a2);
  OUTLINED_FUNCTION_8_0(&dword_22307D000, v2, (uint64_t)v2, "System cancelled context", v3);
}

- (void)_doLoginWithPasswordContext:tokenId:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "UI is available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_doLoginWithPasswordContext:tokenId:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Error evaluating context", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_doLoginWithPasswordContext:(_BYTE *)a1 tokenId:(_BYTE *)a2 .cold.5(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_17(a1, a2);
  OUTLINED_FUNCTION_8_0(&dword_22307D000, v2, (uint64_t)v2, "Waiting for UI to be available", v3);
}

- (void)_doLoginWithPasswordContext:tokenId:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "find attribute mapping token id hash", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_doLoginWithPasswordContext:tokenId:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "find bound token id hash", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_doLoginWithPasswordContext:tokenId:.cold.8()
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

void __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_201_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Key rotation was cancelled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __59__POAgentAuthenticationProcess_handleEncryptionKeyRotation__block_invoke_201_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Key rotation failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleKeyUpdatesWithPasswordContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Checking for key updates", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)requestUserAuthenticationWithUserInfo:.cold.1()
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

- (void)requestUserAuthenticationSyncPassword:completion:.cold.1()
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

- (void)requestSmartCardForBinding:tokenId:tokenHash:wrapTokenHash:.cold.1()
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

- (void)requestUserAuthenticationWithWindow:completion:.cold.1()
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

- (void)showAlertMessage:messageText:completion:.cold.1()
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

- (void)showAlertWithError:completion:.cold.1()
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

- (void)handleKeyRequestSync
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

- (void)postAuthenticationNotification:.cold.1()
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

- (void)handleUserNeedsReauthenticationAfterDelay:.cold.1()
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

void __74__POAgentAuthenticationProcess_handleUserNeedsReauthenticationAfterDelay___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_22307D000, v0, (uint64_t)v0, "%{public}@, %{public}@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)requestUserPasswordChangePreference
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

- (void)handleUserCredentialNeededAtLogin:smartCard:accountDisplayName:bundleIdentifier:returningContext:.cold.1()
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

- (void)handleUserAuthorizationNeededForAccountDisplayName:bundleIdentifier:.cold.1()
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

void __56__POAgentAuthenticationProcess__startDeviceRegistration__block_invoke_278_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "Registration is repair or non PlatformSSO User, completing registration.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleDeviceAndUserRegistrationForRepair:(uint64_t)a3 newPasswordUser:(uint64_t)a4 newSmartCardUser:(uint64_t)a5 notified:(uint64_t)a6 profile:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_18(&dword_22307D000, a2, a3, "Using authentication method %{public}d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)configurationChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_16(&dword_22307D000, v0, v1, "configurationChanged reason: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)handleConfigurationChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "no existing login configuration for config changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleConfigurationChanged:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "no existing user configuration for config changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleConfigurationChanged:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "no existing device configuration for config changed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleKerberosMappingForTokens:(_BYTE *)a1 loginConfiguration:(_BYTE *)a2 userConfiguration:.cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_17(a1, a2);
  OUTLINED_FUNCTION_8_0(&dword_22307D000, v2, (uint64_t)v2, "TGT mapping not found", v3);
}

void __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_433_cold_1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_11(v0, v1), "ticketKeyPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_22307D000, v3, v4, "%{public}@, %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_1();
}

void __100__POAgentAuthenticationProcess_handleKerberosMappingForTokens_loginConfiguration_userConfiguration___block_invoke_438_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_1();
  objc_msgSend(*(id *)(v0 + 40), "ticketKeyPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_22307D000, v2, v3, "%{public}@, %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)handlePendingSSOTokensWithSharedData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_22307D000, v0, v1, "no stored tokens", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)isCurrentSSOExtension:.cold.1()
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

- (void)userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:.cold.1()
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
