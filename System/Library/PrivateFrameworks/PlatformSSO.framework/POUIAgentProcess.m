@implementation POUIAgentProcess

- (POUIAgentProcess)initWithXPCConnection:(id)a3 authenticationProcess:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  POUIAgentProcess *v10;
  uint64_t v11;
  POConfigurationManager *configurationManager;
  uint64_t v13;
  SOConfigurationHost *configurationHost;
  id v15;
  POUIAgentProcess *v16;
  NSObject *v17;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.platformsso.settings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    v19.receiver = self;
    v19.super_class = (Class)POUIAgentProcess;
    v10 = -[POUIAgentProcess init](&v19, sel_init);
    if (v10)
    {
      +[POConfigurationManager sharedInstance](POConfigurationManager, "sharedInstance");
      v11 = objc_claimAutoreleasedReturnValue();
      configurationManager = v10->_configurationManager;
      v10->_configurationManager = (POConfigurationManager *)v11;

      objc_msgSend(MEMORY[0x24BE04368], "defaultManager");
      v13 = objc_claimAutoreleasedReturnValue();
      configurationHost = v10->_configurationHost;
      v10->_configurationHost = (SOConfigurationHost *)v13;

      v15 = objc_storeWeak((id *)&v10->_xpcConnection, v6);
      objc_msgSend(v6, "setInterruptionHandler:", &__block_literal_global_10);

      objc_storeStrong((id *)&v10->_agentProcess, a4);
    }
    self = v10;
    v16 = self;
  }
  else
  {
    PO_LOG_POAgentProcess_0();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[POUIAgentProcess initWithXPCConnection:authenticationProcess:].cold.1(v17);

    v16 = 0;
  }

  return v16;
}

- (void)connectionInvalidated
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  POUIAgentProcess *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POAgentProcess_0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[POUIAgentProcess connectionInvalidated]";
    v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_22307D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)deviceStatusWithCompletion:(id)a3
{
  void (**v4)(id, PODeviceRegistrationStatus *, _QWORD);
  NSObject *v5;
  PODeviceRegistrationStatus *v6;
  void *v7;
  void *v8;
  id v9;
  POProfile *v10;
  void *v11;
  void *v12;
  POProfile *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  NSObject *v34;
  id v35;

  v4 = (void (**)(id, PODeviceRegistrationStatus *, _QWORD))a3;
  PO_LOG_POAgentProcess_0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POUIAgentProcess deviceStatusWithCompletion:].cold.2();

  v6 = objc_alloc_init(PODeviceRegistrationStatus);
  -[PODeviceRegistrationStatus setPlatformSSOEnabled:](v6, "setPlatformSSOEnabled:", +[POConfigurationUtil platformSSOEnabled](POConfigurationUtil, "platformSSOEnabled"));
  if (-[PODeviceRegistrationStatus isPlatformSSOEnabled](v6, "isPlatformSSOEnabled"))
  {
    -[POUIAgentProcess configurationManager](self, "configurationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentDeviceConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      v9 = __47__POUIAgentProcess_deviceStatusWithCompletion___block_invoke();
    v10 = [POProfile alloc];
    -[POUIAgentProcess configurationHost](self, "configurationHost");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "validatedProfileForPlatformSSO");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[POProfile initWithProfile:](v10, "initWithProfile:", v12);

    if (!v13)
      v14 = __47__POUIAgentProcess_deviceStatusWithCompletion___block_invoke_11();
    objc_msgSend(v8, "accountDisplayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[PODeviceRegistrationStatus setAccountName:](v6, "setAccountName:", v15);
    }
    else
    {
      -[POUIAgentProcess configurationManager](self, "configurationManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentLoginConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accountDisplayName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PODeviceRegistrationStatus setAccountName:](v6, "setAccountName:", v18);

    }
    objc_msgSend(v8, "extensionIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[PODeviceRegistrationStatus setRegisteredBundleIdentifier:](v6, "setRegisteredBundleIdentifier:", v19);
    }
    else
    {
      -[POProfile extensionBundleIdentifier](v13, "extensionBundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PODeviceRegistrationStatus setRegisteredBundleIdentifier:](v6, "setRegisteredBundleIdentifier:", v20);

    }
    v21 = (void *)MEMORY[0x24BDC1558];
    -[PODeviceRegistrationStatus registeredBundleIdentifier](v6, "registeredBundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v21, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v22, 1, &v35);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v35;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v23, "localizedName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PODeviceRegistrationStatus setRegisteredExtensionName:](v6, "setRegisteredExtensionName:", v25);

    }
    -[POUIAgentProcess agentProcess](self, "agentProcess");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "registrationState");

    v29 = v27;
    v28 = 1;
    v30 = 2;
    v31 = 2;
    switch(v29)
    {
      case 0:
        if (v8 && (objc_msgSend(v8, "registrationCompleted", 2) & 1) != 0)
        {
          v28 = 1;
          v30 = 2;
          v31 = 2;
          goto LABEL_29;
        }
        -[POUIAgentProcess agentProcess](self, "agentProcess", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "registrationFailed");

        if (v33)
          v30 = 3;
        else
          v30 = 0;
        v28 = 1;
        goto LABEL_28;
      case 1:
      case 6:
      case 7:
      case 8:
        goto LABEL_29;
      case 2:
      case 4:
        v28 = 0;
        v30 = 1;
        goto LABEL_28;
      case 3:
        v30 = 1;
        v28 = 1;
LABEL_28:
        v31 = 1;
        goto LABEL_29;
      case 5:
        v31 = 1;
        v30 = 3;
        v28 = 1;
LABEL_29:
        -[PODeviceRegistrationStatus setDeviceRegistrationStatus:](v6, "setDeviceRegistrationStatus:", v30);
        -[PODeviceRegistrationStatus setActionButtonEnabled:](v6, "setActionButtonEnabled:", v28);
        -[PODeviceRegistrationStatus setActionButtonAction:](v6, "setActionButtonAction:", v31);
        break;
      default:
        break;
    }
    PO_LOG_POAgentProcess_0();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[POUIAgentProcess deviceStatusWithCompletion:].cold.1();

    v4[2](v4, v6, 0);
  }
  else
  {
    v4[2](v4, v6, 0);
  }

}

id __47__POUIAgentProcess_deviceStatusWithCompletion___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("Device configuration not found when retrieving device UI status."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess_0();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __47__POUIAgentProcess_deviceStatusWithCompletion___block_invoke_11()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("No validated Platform SSO Profiles found when retrieving device UI status."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess_0();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)startDeviceAction:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  int64_t v12;

  v6 = a4;
  PO_LOG_POAgentProcess_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[POUIAgentProcess startDeviceAction:completion:].cold.1(a3);

  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__POUIAgentProcess_startDeviceAction_completion___block_invoke;
  block[3] = &unk_24EC034C8;
  v11 = v6;
  v12 = a3;
  block[4] = self;
  v9 = v6;
  dispatch_async(v8, block);

}

uint64_t __49__POUIAgentProcess_startDeviceAction_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "agentProcess");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 1;
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "agentProcess");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = 0;
LABEL_5:
    objc_msgSend(v3, "handleDeviceAndUserRegistrationForRepair:newPasswordUser:newSmartCardUser:notified:profile:", v5, 0, 0, 1, 0);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)statusForUser:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, POUserRegistrationStatus *, _QWORD);
  NSObject *v8;
  POUserRegistrationStatus *v9;
  void *v10;
  void *v11;
  char v12;
  POConfigurationManager *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  POUserRegistrationStatus *v21;
  uint64_t v22;
  id v23;
  void *v24;
  int v25;
  POUserRegistrationStatus *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  char v38;
  NSObject *v39;

  v6 = a3;
  v7 = (void (**)(id, POUserRegistrationStatus *, _QWORD))a4;
  PO_LOG_POAgentProcess_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[POUIAgentProcess statusForUser:completion:].cold.2();

  v9 = objc_alloc_init(POUserRegistrationStatus);
  -[POUserRegistrationStatus setPlatformSSOEnabled:](v9, "setPlatformSSOEnabled:", +[POConfigurationUtil platformSSOEnabled](POConfigurationUtil, "platformSSOEnabled"));
  if (-[POUserRegistrationStatus isPlatformSSOEnabled](v9, "isPlatformSSOEnabled"))
  {
    -[POUIAgentProcess configurationManager](self, "configurationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSUserName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      v13 = -[POConfigurationManager initWithUserName:]([POConfigurationManager alloc], "initWithUserName:", v6);

      v10 = v13;
    }
    objc_msgSend(v10, "currentDeviceConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v10, "currentUserConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
        v16 = __45__POUIAgentProcess_statusForUser_completion___block_invoke_22();
      objc_msgSend(v15, "userLoginConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "loginUserName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[POUserRegistrationStatus setLoginUserName:](v9, "setLoginUserName:", v18);

      -[POUserRegistrationStatus setAuthenticationMethod:](v9, "setAuthenticationMethod:", objc_msgSend(v15, "loginType"));
      -[POUIAgentProcess agentProcess](self, "agentProcess");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "registrationState");

      switch(v20)
      {
        case 0:
        case 1:
          -[POUIAgentProcess agentProcess](self, "agentProcess");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "registrationFailed");

          if (v25)
            goto LABEL_14;
          -[POUserRegistrationStatus setUserRegistrationStatus:](v9, "setUserRegistrationStatus:", 2);
          -[POUserRegistrationStatus setActionButtonEnabled:](v9, "setActionButtonEnabled:", 1);
          -[POUserRegistrationStatus setActionButtonAction:](v9, "setActionButtonAction:", 2);
          -[POUserRegistrationStatus setAuthenticateButtonEnabled:](v9, "setAuthenticateButtonEnabled:", 1);
          break;
        case 2:
        case 3:
        case 4:
        case 5:
          -[POUserRegistrationStatus setPlatformSSOEnabled:](v9, "setPlatformSSOEnabled:", 1);
          v21 = v9;
          v22 = 0;
          goto LABEL_16;
        case 6:
        case 7:
          v21 = v9;
          v22 = 1;
LABEL_16:
          -[POUserRegistrationStatus setUserRegistrationStatus:](v21, "setUserRegistrationStatus:", v22);
          v26 = v9;
          v27 = 0;
          goto LABEL_17;
        case 8:
LABEL_14:
          -[POUserRegistrationStatus setUserRegistrationStatus:](v9, "setUserRegistrationStatus:", 3);
          v26 = v9;
          v27 = 1;
LABEL_17:
          -[POUserRegistrationStatus setActionButtonEnabled:](v26, "setActionButtonEnabled:", v27);
          -[POUserRegistrationStatus setActionButtonAction:](v9, "setActionButtonAction:", 1);
          break;
        default:
          break;
      }
      objc_msgSend(v10, "currentRefreshToken");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v10, "tokenExpiration");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSinceNow");
        v31 = v30;

        if (v31 > 0.0)
          v32 = 1;
        else
          v32 = 2;
      }
      else
      {
        v32 = 0;
      }
      -[POUserRegistrationStatus setUserTokenStatus:](v9, "setUserTokenStatus:", v32);
      objc_msgSend(v14, "nonPlatformSSOAccounts");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSUserName();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lowercaseString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v33, "containsObject:", v35);

      if (v36)
      {
        -[POUserRegistrationStatus setPlatformSSOEnabled:](v9, "setPlatformSSOEnabled:", 0);
        -[POUserRegistrationStatus setUserRegistrationStatus:](v9, "setUserRegistrationStatus:", 0);
        -[POUserRegistrationStatus setActionButtonAction:](v9, "setActionButtonAction:", 0);
        -[POUserRegistrationStatus setActionButtonEnabled:](v9, "setActionButtonEnabled:", 0);
        -[POUserRegistrationStatus setAuthenticateButtonEnabled:](v9, "setAuthenticateButtonEnabled:", 0);
      }
      NSUserName();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v6, "isEqualToString:", v37);

      if ((v38 & 1) == 0)
      {
        -[POUserRegistrationStatus setActionButtonEnabled:](v9, "setActionButtonEnabled:", 0);
        -[POUserRegistrationStatus setAuthenticateButtonEnabled:](v9, "setAuthenticateButtonEnabled:", 0);
      }
      PO_LOG_POAgentProcess_0();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        -[POUIAgentProcess statusForUser:completion:].cold.1();

      v7[2](v7, v9, 0);
    }
    else
    {
      v23 = __45__POUIAgentProcess_statusForUser_completion___block_invoke();
      -[POUserRegistrationStatus setPlatformSSOEnabled:](v9, "setPlatformSSOEnabled:", 0);
      v7[2](v7, v9, 0);
    }

  }
  else
  {
    v7[2](v7, v9, 0);
  }

}

id __45__POUIAgentProcess_statusForUser_completion___block_invoke()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("Device configuration not found when retrieving user UI status."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess_0();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

id __45__POUIAgentProcess_statusForUser_completion___block_invoke_22()
{
  void *v0;
  NSObject *v1;

  objc_msgSend(MEMORY[0x24BE72EB0], "errorWithCode:description:", -1004, CFSTR("User configuration not found when retrieving user UI status."));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PO_LOG_POAgentProcess_0();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __40__POConfigurationUtil_updateTriggerFile__block_invoke_cold_1();

  return v0;
}

- (void)startAction:(int64_t)a3 forUserName:(id)a4 completion:(id)a5
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
  int64_t v17;

  v8 = a4;
  v9 = a5;
  PO_LOG_POAgentProcess_0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[POUIAgentProcess startAction:forUserName:completion:].cold.1(a3);

  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__POUIAgentProcess_startAction_forUserName_completion___block_invoke;
  v14[3] = &unk_24EC034F0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a3;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

}

uint64_t __55__POUIAgentProcess_startAction_forUserName_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  POConfigurationManager *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 56);
  switch(v2)
  {
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "agentProcess");
      v3 = (POConfigurationManager *)objc_claimAutoreleasedReturnValue();
      -[POConfigurationManager requestUserAuthenticationWithUserInfo:](v3, "requestUserAuthenticationWithUserInfo:", 0);
      goto LABEL_7;
    case 2:
      v3 = -[POConfigurationManager initWithUserName:]([POConfigurationManager alloc], "initWithUserName:", *(_QWORD *)(a1 + 40));
      -[POConfigurationManager currentUserConfiguration](v3, "currentUserConfiguration");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userLoginConfiguration");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "loginUserName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "agentProcess");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleUserRegistrationForUser:repair:newPasswordUser:newSmartCardUser:notified:profile:", v6, 1, 0, 0, 1, 0);

      goto LABEL_7;
    case 1:
      objc_msgSend(*(id *)(a1 + 32), "agentProcess");
      v3 = (POConfigurationManager *)objc_claimAutoreleasedReturnValue();
      -[POConfigurationManager handleUserRegistrationForUser:repair:newPasswordUser:newSmartCardUser:notified:profile:](v3, "handleUserRegistrationForUser:repair:newPasswordUser:newSmartCardUser:notified:profile:", 0, 0, 0, 0, 1, 0);
LABEL_7:

      break;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
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

- (SOConfigurationHost)configurationHost
{
  return (SOConfigurationHost *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfigurationHost:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationHost, 0);
  objc_storeStrong((id *)&self->_agentProcess, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)initWithXPCConnection:(os_log_t)log authenticationProcess:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22307D000, log, OS_LOG_TYPE_ERROR, "missing required entitlement", v1, 2u);
}

- (void)deviceStatusWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_22307D000, v0, v1, "Device Status: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)deviceStatusWithCompletion:.cold.2()
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

- (void)startDeviceAction:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[POConstantUtil stringForDeviceAction:](POConstantUtil, "stringForDeviceAction:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_4_1(&dword_22307D000, v2, v3, "%s action=%{public}@ on %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5_1();
}

- (void)statusForUser:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0(&dword_22307D000, v0, v1, "User Status: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)statusForUser:completion:.cold.2()
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

- (void)startAction:(uint64_t)a1 forUserName:completion:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[POConstantUtil stringForUserAction:](POConstantUtil, "stringForUserAction:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_4_1(&dword_22307D000, v2, v3, "%s action=%{public}@ on %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5_1();
}

@end
