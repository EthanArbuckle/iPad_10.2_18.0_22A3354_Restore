@implementation PSUICarrierSpaceManager

+ (id)sharedManager
{
  if (qword_253E97070 != -1)
    dispatch_once(&qword_253E97070, &__block_literal_global_15);
  return (id)_MergedGlobals_66;
}

void __40__PSUICarrierSpaceManager_sharedManager__block_invoke()
{
  PSUICarrierSpaceManager *v0;
  void *v1;

  v0 = objc_alloc_init(PSUICarrierSpaceManager);
  v1 = (void *)_MergedGlobals_66;
  _MergedGlobals_66 = (uint64_t)v0;

}

+ (int)carrierMetricTypeForString:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = 1;
  objc_msgSend(v4, "setNumberStyle:", 1);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v6);

  objc_msgSend(v4, "numberFromString:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v3, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("unlimited"));

    if ((v9 & 1) != 0)
    {
      v5 = 2;
    }
    else
    {
      objc_msgSend(v3, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("-"));

      v5 = v11 - 1;
    }
  }

  return v5;
}

+ (BOOL)isCarrierMetricTypeValid:(int)a3
{
  return (a3 - 1) < 2;
}

+ (int64_t)bytesFromString:(id)a3 carrierSpaceUnits:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  NSObject *v12;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setNumberStyle:", 1);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocale:", v7);

  objc_msgSend(v6, "numberFromString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "floatValue");
  v10 = v9;
  switch(a4)
  {
    case 1:
      break;
    case 2:
      v11 = 1024.0;
      goto LABEL_9;
    case 3:
      v11 = 1048600.0;
      goto LABEL_9;
    case 4:
      v11 = 1073700000.0;
      goto LABEL_9;
    case 5:
      v11 = 1.0995e12;
LABEL_9:
      v10 = v9 * v11;
      break;
    default:
      objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CarrierSpaceManager"));
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v14;
        _os_log_error_impl(&dword_2161C6000, v12, OS_LOG_TYPE_ERROR, "invalid carrier space unit type: %@", (uint8_t *)&v15, 0xCu);

      }
      break;
  }

  return (uint64_t)v10;
}

- (PSUICarrierSpaceManager)init
{
  PSUICarrierSpaceManager *v2;
  void *v3;
  uint64_t v4;
  CoreTelephonyClient *coreTelephonyClient;
  void *v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  CTCarrierSpaceClient *carrierSpaceClient;
  void *v11;
  objc_super v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v13.receiver = self;
  v13.super_class = (Class)PSUICarrierSpaceManager;
  v2 = -[PSUICarrierSpaceManager init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("carrier_space"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", v3);
    coreTelephonyClient = v2->_coreTelephonyClient;
    v2->_coreTelephonyClient = (CoreTelephonyClient *)v4;

    -[CoreTelephonyClient setDelegate:](v2->_coreTelephonyClient, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BE856B8], "createCTClientSerialQueue:", CFSTR("carrier_space_client"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v7 = (void *)getCTCarrierSpaceClientClass_softClass;
    v18 = getCTCarrierSpaceClientClass_softClass;
    if (!getCTCarrierSpaceClientClass_softClass)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __getCTCarrierSpaceClientClass_block_invoke;
      v14[3] = &unk_24D5018D0;
      v14[4] = &v15;
      __getCTCarrierSpaceClientClass_block_invoke((uint64_t)v14);
      v7 = (void *)v16[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v15, 8);
    v9 = objc_msgSend([v8 alloc], "initWithQueue:", v6);
    carrierSpaceClient = v2->_carrierSpaceClient;
    v2->_carrierSpaceClient = (CTCarrierSpaceClient *)v9;

    -[CTCarrierSpaceClient setDelegate:](v2->_carrierSpaceClient, "setDelegate:", v2);
    v2->_serverConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel_refreshAndReload, CFSTR("com.apple.PreferencesApp.willBecomeActive"), 0);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_serverConnection)
  {
    _CTServerConnectionUnregisterForAllNotifications();
    CFRelease(self->_serverConnection);
  }
  v3.receiver = self;
  v3.super_class = (Class)PSUICarrierSpaceManager;
  -[PSUICarrierSpaceManager dealloc](&v3, sel_dealloc);
}

- (BOOL)hasUserConsent
{
  NSObject *v3;
  NSObject *v4;
  NSNumber *hasUserConsent;
  int v7;
  NSNumber *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceManager getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "Fetching user consent", (uint8_t *)&v7, 2u);
  }

  if (!self->_hasUserConsent)
    -[PSUICarrierSpaceManager refresh](self, "refresh");
  -[PSUICarrierSpaceManager getLogger](self, "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    hasUserConsent = self->_hasUserConsent;
    v7 = 138412290;
    v8 = hasUserConsent;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "Has carrier space user consent: %@", (uint8_t *)&v7, 0xCu);
  }

  return -[NSNumber BOOLValue](self->_hasUserConsent, "BOOLValue");
}

- (id)userConsentFlowInfo
{
  CTCarrierSpaceUserConsentFlowInfo *userConsentFlowInfo;
  dispatch_semaphore_t v4;
  CTCarrierSpaceClient *carrierSpaceClient;
  NSObject *v6;
  _QWORD v8[5];
  dispatch_semaphore_t v9;

  userConsentFlowInfo = self->_userConsentFlowInfo;
  if (!userConsentFlowInfo)
  {
    v4 = dispatch_semaphore_create(0);
    carrierSpaceClient = self->_carrierSpaceClient;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __46__PSUICarrierSpaceManager_userConsentFlowInfo__block_invoke;
    v8[3] = &unk_24D502120;
    v8[4] = self;
    v9 = v4;
    v6 = v4;
    -[CTCarrierSpaceClient getUserConsentFlowInfo:](carrierSpaceClient, "getUserConsentFlowInfo:", v8);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

    userConsentFlowInfo = self->_userConsentFlowInfo;
  }
  return userConsentFlowInfo;
}

void __46__PSUICarrierSpaceManager_userConsentFlowInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_2161C6000, v7, OS_LOG_TYPE_ERROR, "Error getting user consent flow info: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 56);
  *(_QWORD *)(v8 + 56) = v5;
  v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)setUserConsent:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  NSNumber *v7;
  NSNumber *userConsentResponse;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceManager getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("did not consent the");
    if (v3)
      v6 = CFSTR("consented the");
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "User %@ terms", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  userConsentResponse = self->_userConsentResponse;
  self->_userConsentResponse = v7;

}

- (void)userConsentAcknowledged:(BOOL)a3
{
  NSNumber *userConsentResponse;
  _BOOL4 v5;
  uint64_t v6;
  NSNumber *v7;
  NSObject *v8;
  const __CFString *v9;
  dispatch_semaphore_t v10;
  CTCarrierSpaceClient *carrierSpaceClient;
  NSObject *v12;
  _QWORD v13[5];
  dispatch_semaphore_t v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  userConsentResponse = self->_userConsentResponse;
  if (userConsentResponse)
  {
    v5 = a3;
    v6 = -[NSNumber BOOLValue](userConsentResponse, "BOOLValue");
    v7 = self->_userConsentResponse;
    self->_userConsentResponse = 0;

    -[PSUICarrierSpaceManager getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("failed");
      if (v5)
        v9 = CFSTR("succeeded");
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "Server %@ in acknowledging user's consent response", buf, 0xCu);
    }

    if (v5)
    {
      v10 = dispatch_semaphore_create(0);
      carrierSpaceClient = self->_carrierSpaceClient;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __51__PSUICarrierSpaceManager_userConsentAcknowledged___block_invoke;
      v13[3] = &unk_24D501858;
      v13[4] = self;
      v14 = v10;
      v12 = v10;
      -[CTCarrierSpaceClient setUserConsent:completion:](carrierSpaceClient, "setUserConsent:completion:", v6, v13);
      dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

    }
  }
}

void __51__PSUICarrierSpaceManager_userConsentAcknowledged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_error_impl(&dword_2161C6000, v4, OS_LOG_TYPE_ERROR, "Error setting user consent: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)reset
{
  CTCarrierSpaceCapabilities *capabilities;
  CTCarrierSpaceUsageInfo *usageInfo;
  CTCarrierSpacePlansInfo *plansInfo;
  CTCarrierSpaceAppsInfo *appsInfo;
  NSNumber *hasUserConsent;
  CTCarrierSpaceUserConsentFlowInfo *userConsentFlowInfo;
  NSNumber *userConsentResponse;

  capabilities = self->_capabilities;
  self->_capabilities = 0;

  usageInfo = self->_usageInfo;
  self->_usageInfo = 0;

  plansInfo = self->_plansInfo;
  self->_plansInfo = 0;

  appsInfo = self->_appsInfo;
  self->_appsInfo = 0;

  hasUserConsent = self->_hasUserConsent;
  self->_hasUserConsent = 0;

  userConsentFlowInfo = self->_userConsentFlowInfo;
  self->_userConsentFlowInfo = 0;

  userConsentResponse = self->_userConsentResponse;
  self->_userConsentResponse = 0;

}

- (void)refreshAndReload
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceManager getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315650;
    v6 = "-[PSUICarrierSpaceManager refreshAndReload]";
    v7 = 2112;
    v8 = CFSTR("com.apple.PreferencesApp.willBecomeActive");
    v9 = 2112;
    v10 = CFSTR("PSUICarrierSpaceChanged");
    _os_log_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification: %@ and will post notification %@", (uint8_t *)&v5, 0x20u);
  }

  -[PSUICarrierSpaceManager refresh](self, "refresh");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PSUICarrierSpaceChanged"), 0);

}

- (void)refresh
{
  NSObject *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  CTCarrierSpaceClient *carrierSpaceClient;
  NSObject *v7;
  char *v8;
  _QWORD v9[5];
  dispatch_semaphore_t v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceManager getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PSUICarrierSpaceManager capabilities](self, "capabilities");
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_debug_impl(&dword_2161C6000, v3, OS_LOG_TYPE_DEBUG, "Refreshing carrier space info, current capabilities: %@", buf, 0xCu);

  }
  if (-[PSUICarrierSpaceManager supportsSweetgum](self, "supportsSweetgum"))
  {
    -[PSUICarrierSpaceManager reset](self, "reset");
    v4 = dispatch_semaphore_create(0);
    -[PSUICarrierSpaceManager getLogger](self, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[PSUICarrierSpaceManager refresh]";
      _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s issuing carrier space refresh request", buf, 0xCu);
    }

    carrierSpaceClient = self->_carrierSpaceClient;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __34__PSUICarrierSpaceManager_refresh__block_invoke;
    v9[3] = &unk_24D501858;
    v9[4] = self;
    v10 = v4;
    v7 = v4;
    -[CTCarrierSpaceClient refreshAllInfo:](carrierSpaceClient, "refreshAllInfo:", v9);
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  }
}

void __34__PSUICarrierSpaceManager_refresh__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "-[PSUICarrierSpaceManager refresh]_block_invoke";
      v11 = "%s refresh request succeeded";
      v12 = v6;
      v13 = 12;
LABEL_10:
      _os_log_impl(&dword_2161C6000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
    }
LABEL_11:

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 48);
    v10 = MEMORY[0x24BDBD1C8];
    goto LABEL_12;
  }
  v5 = objc_msgSend(v3, "code");
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 != 3)
  {
    if (v7)
    {
      v14 = 136315394;
      v15 = "-[PSUICarrierSpaceManager refresh]_block_invoke";
      v16 = 2112;
      v17 = v4;
      v11 = "%s refresh request failed: %@";
      v12 = v6;
      v13 = 22;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v7)
  {
    v14 = 136315138;
    v15 = "-[PSUICarrierSpaceManager refresh]_block_invoke";
    _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s refresh request failed: user consent required", (uint8_t *)&v14, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 48);
  v10 = MEMORY[0x24BDBD1C0];
LABEL_12:
  *(_QWORD *)(v8 + 48) = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)supportsSweetgum
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[PSUICarrierSpaceManager capabilities](self, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "supportsPlans") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[PSUICarrierSpaceManager capabilities](self, "capabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "supportsUsage") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[PSUICarrierSpaceManager capabilities](self, "capabilities");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "supportsServices") & 1) != 0)
      {
        v4 = 1;
      }
      else
      {
        -[PSUICarrierSpaceManager capabilities](self, "capabilities");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_msgSend(v7, "supportsApplications");

      }
    }

  }
  return v4;
}

- (id)capabilities
{
  PSUICarrierSpaceManager *v2;
  CTCarrierSpaceCapabilities *capabilities;
  dispatch_semaphore_t v4;
  NSObject *v5;
  CTCarrierSpaceClient *carrierSpaceClient;
  NSObject *v7;
  CTCarrierSpaceCapabilities *v8;
  _QWORD v10[5];
  NSObject *v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  capabilities = v2->_capabilities;
  if (!capabilities)
  {
    v4 = dispatch_semaphore_create(0);
    -[PSUICarrierSpaceManager getLogger](v2, "getLogger");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[PSUICarrierSpaceManager capabilities]";
      _os_log_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEFAULT, "%s issuing carrier space get capabilities request", buf, 0xCu);
    }

    carrierSpaceClient = v2->_carrierSpaceClient;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __39__PSUICarrierSpaceManager_capabilities__block_invoke;
    v10[3] = &unk_24D502148;
    v10[4] = v2;
    v7 = v4;
    v11 = v7;
    -[CTCarrierSpaceClient getCapabilities:](carrierSpaceClient, "getCapabilities:", v10);
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

    capabilities = v2->_capabilities;
  }
  v8 = capabilities;
  objc_sync_exit(v2);

  return v8;
}

void __39__PSUICarrierSpaceManager_capabilities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[PSUICarrierSpaceManager capabilities]_block_invoke";
      v14 = 2112;
      v15 = v7;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "%s get capabilities request failed: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[PSUICarrierSpaceManager capabilities]_block_invoke";
    _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "%s get capabilities request succeeded", (uint8_t *)&v12, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(const char **)(*(_QWORD *)(a1 + 32) + 8);
    v12 = 138412290;
    v13 = v11;
    _os_log_debug_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEBUG, "Received carrier space capabilities: %@", (uint8_t *)&v12, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)usageInfo
{
  NSObject *v3;
  CTCarrierSpaceUsageInfo *usageInfo;
  dispatch_semaphore_t v5;
  NSObject *v6;
  CTCarrierSpaceClient *carrierSpaceClient;
  _QWORD v9[5];
  dispatch_semaphore_t v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceManager capabilities](self, "capabilities");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject supportsUsage](v3, "supportsUsage"))
  {
LABEL_6:

    return self->_usageInfo;
  }
  usageInfo = self->_usageInfo;

  if (!usageInfo)
  {
    v5 = dispatch_semaphore_create(0);
    -[PSUICarrierSpaceManager getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[PSUICarrierSpaceManager usageInfo]";
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s issuing carrier space fetch usage info request", buf, 0xCu);
    }

    carrierSpaceClient = self->_carrierSpaceClient;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __36__PSUICarrierSpaceManager_usageInfo__block_invoke;
    v9[3] = &unk_24D502170;
    v9[4] = self;
    v10 = v5;
    v3 = v5;
    -[CTCarrierSpaceClient fetchUsageInfo:completion:](carrierSpaceClient, "fetchUsageInfo:completion:", 1, v9);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

    goto LABEL_6;
  }
  return self->_usageInfo;
}

void __36__PSUICarrierSpaceManager_usageInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[PSUICarrierSpaceManager usageInfo]_block_invoke";
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "%s fetch usage info request failed: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[PSUICarrierSpaceManager usageInfo]_block_invoke";
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s fetch usage info request succeeded", (uint8_t *)&v12, 0xCu);
  }

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 16);
  *(_QWORD *)(v9 + 16) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)plansInfo
{
  NSObject *v3;
  CTCarrierSpacePlansInfo *plansInfo;
  dispatch_semaphore_t v5;
  NSObject *v6;
  CTCarrierSpaceClient *carrierSpaceClient;
  _QWORD v9[5];
  dispatch_semaphore_t v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceManager capabilities](self, "capabilities");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject supportsPlans](v3, "supportsPlans"))
  {
LABEL_6:

    return self->_plansInfo;
  }
  plansInfo = self->_plansInfo;

  if (!plansInfo)
  {
    v5 = dispatch_semaphore_create(0);
    -[PSUICarrierSpaceManager getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[PSUICarrierSpaceManager plansInfo]";
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s issuing carrier space fetch plans info request", buf, 0xCu);
    }

    carrierSpaceClient = self->_carrierSpaceClient;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __36__PSUICarrierSpaceManager_plansInfo__block_invoke;
    v9[3] = &unk_24D502198;
    v9[4] = self;
    v10 = v5;
    v3 = v5;
    -[CTCarrierSpaceClient fetchPlansInfo:completion:](carrierSpaceClient, "fetchPlansInfo:completion:", 1, v9);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

    goto LABEL_6;
  }
  return self->_plansInfo;
}

void __36__PSUICarrierSpaceManager_plansInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[PSUICarrierSpaceManager plansInfo]_block_invoke";
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_2161C6000, v8, OS_LOG_TYPE_ERROR, "%s fetch plans info request failed: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[PSUICarrierSpaceManager plansInfo]_block_invoke";
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s fetch plans info request succeeded", (uint8_t *)&v12, 0xCu);
  }

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)subscribedPlanOptions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PSUICarrierSpaceManager plansInfo](self, "plansInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planGroupsList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v10, "groupOptionsList", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              if (objc_msgSend(v16, "planStatus") == 1)
                objc_msgSend(v3, "addObject:", v16);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v13);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_msgSend(v3, "copy");
  return v17;
}

- (id)subscribedDomesticPlanOptions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[PSUICarrierSpaceManager plansInfo](self, "plansInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "planGroupsList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v10, "planCategory") == 1)
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          objc_msgSend(v10, "groupOptionsList", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v20 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
                if (objc_msgSend(v16, "planStatus") == 1)
                  objc_msgSend(v3, "addObject:", v16);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v13);
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_msgSend(v3, "copy");
  return v17;
}

- (id)planMetrics
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[PSUICarrierSpaceManager usageInfo](self, "usageInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v10, "applicablePlans", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++));
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v13);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
}

- (id)appsInfo
{
  NSObject *v3;
  CTCarrierSpaceAppsInfo *appsInfo;
  dispatch_semaphore_t v5;
  NSObject *v6;
  CTCarrierSpaceClient *carrierSpaceClient;
  _QWORD v9[5];
  dispatch_semaphore_t v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceManager capabilities](self, "capabilities");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject supportsApplications](v3, "supportsApplications"))
  {
LABEL_6:

    return self->_appsInfo;
  }
  appsInfo = self->_appsInfo;

  if (!appsInfo)
  {
    v5 = dispatch_semaphore_create(0);
    -[PSUICarrierSpaceManager getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[PSUICarrierSpaceManager appsInfo]";
      _os_log_impl(&dword_2161C6000, v6, OS_LOG_TYPE_DEFAULT, "%s issuing carrier space fetch apps info request", buf, 0xCu);
    }

    carrierSpaceClient = self->_carrierSpaceClient;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __35__PSUICarrierSpaceManager_appsInfo__block_invoke;
    v9[3] = &unk_24D5021C0;
    v9[4] = self;
    v10 = v5;
    v3 = v5;
    -[CTCarrierSpaceClient fetchAppsInfo:completion:](carrierSpaceClient, "fetchAppsInfo:completion:", 1, v9);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

    goto LABEL_6;
  }
  return self->_appsInfo;
}

void __35__PSUICarrierSpaceManager_appsInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[PSUICarrierSpaceManager appsInfo]_block_invoke";
      v14 = 2112;
      v15 = v7;
      _os_log_error_impl(&dword_2161C6000, v9, OS_LOG_TYPE_ERROR, "%s fetch apps info request failed: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[PSUICarrierSpaceManager appsInfo]_block_invoke";
    _os_log_impl(&dword_2161C6000, v9, OS_LOG_TYPE_DEFAULT, "%s fetch apps info request succeeded", (uint8_t *)&v12, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(const char **)(*(_QWORD *)(a1 + 32) + 32);
    v12 = 138412290;
    v13 = v11;
    _os_log_debug_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEBUG, "Received carrier space apps info: %@", (uint8_t *)&v12, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)carrierAppInstallController
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  PSUIAppInstallController *v11;
  void *v12;
  void *v13;
  PSUIAppInstallController *v14;
  PSUIAppInstallController *carrierAppInstallController;
  PSUIAppInstallController *v16;
  CTCarrierSpaceAppsInfo *appsInfo;
  int v19;
  const char *v20;
  __int16 v21;
  CTCarrierSpaceAppsInfo *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceManager appsInfo](self, "appsInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appsList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[PSUICarrierSpaceManager appsInfo](self, "appsInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appsList");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v7, "objectAtIndexedSubscript:", 0);
    v8 = objc_claimAutoreleasedReturnValue();

    -[PSUIAppInstallController appID](self->_carrierAppInstallController, "appID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v9, "isEqualToString:", v8);

    if ((v7 & 1) == 0)
    {
      -[PSUICarrierSpaceManager getLogger](self, "getLogger");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v19 = 138412290;
        v20 = (const char *)v8;
        _os_log_debug_impl(&dword_2161C6000, v10, OS_LOG_TYPE_DEBUG, "Instantiating app install controller with app ID: %@", (uint8_t *)&v19, 0xCu);
      }

      v11 = [PSUIAppInstallController alloc];
      -[PSUICarrierSpaceManager appsInfo](self, "appsInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appsURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PSUIAppInstallController initWithAppID:carrierMoreAppsURL:](v11, "initWithAppID:carrierMoreAppsURL:", v8, v13);
      carrierAppInstallController = self->_carrierAppInstallController;
      self->_carrierAppInstallController = v14;

    }
    v16 = self->_carrierAppInstallController;
  }
  else
  {
    -[PSUICarrierSpaceManager getLogger](self, "getLogger");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      appsInfo = self->_appsInfo;
      v19 = 136315394;
      v20 = "-[PSUICarrierSpaceManager carrierAppInstallController]";
      v21 = 2112;
      v22 = appsInfo;
      _os_log_debug_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEBUG, "%s: appsInfo does not contain any apps: %@", (uint8_t *)&v19, 0x16u);
    }
    v16 = 0;
  }

  return v16;
}

- (BOOL)planChangeIsRestricted
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63850]) == 2;

  return v3;
}

- (id)descriptionForPlanMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  __CFString *v30;
  NSObject *v31;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "dataUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedDataUsed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  objc_msgSend(v4, "dataUsage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "sharedDataUsed");
  else
    objc_msgSend(v8, "thisDeviceDataUsed");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v10);
  if (v11 == 1)
  {
    objc_msgSend(v4, "dataUsage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[PSUICarrierSpaceManager bytesFromString:carrierSpaceUnits:](PSUICarrierSpaceManager, "bytesFromString:carrierSpaceUnits:", v10, objc_msgSend(v12, "units"));

  }
  else
  {
    v13 = 0;
  }
  -[PSUICarrierSpaceManager localizedDataStringFromBytes:](self, "localizedDataStringFromBytes:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "capacity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[PSUICarrierSpaceManager carrierMetricTypeForString:](PSUICarrierSpaceManager, "carrierMetricTypeForString:", v16);

  if (v17 != 1)
  {
    -[PSUICarrierSpaceManager localizedDataStringFromBytes:](self, "localizedDataStringFromBytes:", 0);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v11 == 1)
    {
      v27 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v28;
      if (v17 == 2)
        v29 = CFSTR("USED_%@_OF_UNLIMITED");
      else
        v29 = CFSTR("USED_%@");
      objc_msgSend(v28, "localizedStringForKey:value:table:", v29, &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", v26, v14, v36);
      goto LABEL_20;
    }
    if (!v11)
    {
      if (v17 == 2)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("UNLIMITED"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      -[PSUICarrierSpaceManager getLogger](self, "getLogger");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 136315138;
      v38 = "-[PSUICarrierSpaceManager descriptionForPlanMetrics:]";
      v33 = "%s failed to generate description for plan with hidden used data metric type";
      v34 = v31;
      v35 = 12;
      goto LABEL_28;
    }
LABEL_16:
    -[PSUICarrierSpaceManager getLogger](self, "getLogger");
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      v30 = &stru_24D5028C8;
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136315394;
    v38 = "-[PSUICarrierSpaceManager descriptionForPlanMetrics:]";
    v39 = 1024;
    v40 = v11;
    v33 = "%s failed to generate description for plan with used data metric type of %i";
    v34 = v31;
    v35 = 18;
LABEL_28:
    _os_log_error_impl(&dword_2161C6000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
    goto LABEL_17;
  }
  objc_msgSend(v4, "dataUsage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "capacity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataUsage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = +[PSUICarrierSpaceManager bytesFromString:carrierSpaceUnits:](PSUICarrierSpaceManager, "bytesFromString:carrierSpaceUnits:", v19, objc_msgSend(v20, "units"));

  -[PSUICarrierSpaceManager localizedDataStringFromBytes:](self, "localizedDataStringFromBytes:", v21);
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v11 == 1)
  {
    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("USED_%@_OF_%@"), &stru_24D5028C8, CFSTR("CarrierSpaceUsage"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", v26, v14, v23);
LABEL_20:
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_21:
    goto LABEL_22;
  }
  if (v11)
    goto LABEL_16;
  v23 = v22;
  v30 = v23;
LABEL_22:

  return v30;
}

- (id)localizedDataStringFromBytes:(unint64_t)a3
{
  return (id)NSLocalizedFileSizeDescription();
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSUICarrierSpaceManager getLogger](self, "getLogger", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[PSUICarrierSpaceManager simStatusDidChange:status:]";
    v8 = 2112;
    v9 = CFSTR("PSCarrierSpaceSIMStatusChanged");
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s posting notification %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PSCarrierSpaceSIMStatusChanged"), 0);

}

- (void)capabilitiesDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PSUICarrierSpaceManager_capabilitiesDidChange___block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __49__PSUICarrierSpaceManager_capabilitiesDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "reset");
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[PSUICarrierSpaceManager capabilitiesDidChange:]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("PSUICarrierSpaceChanged");
    _os_log_impl(&dword_2161C6000, v2, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v4, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("PSUICarrierSpaceChanged"), 0);

}

- (void)usageDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__PSUICarrierSpaceManager_usageDidChange__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __41__PSUICarrierSpaceManager_usageDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[PSUICarrierSpaceManager usageDidChange]_block_invoke";
    v8 = 2112;
    v9 = CFSTR("PSUICarrierSpaceChanged");
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PSUICarrierSpaceChanged"), 0);

}

- (void)plansDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__PSUICarrierSpaceManager_plansDidChange__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __41__PSUICarrierSpaceManager_plansDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[PSUICarrierSpaceManager plansDidChange]_block_invoke";
    v8 = 2112;
    v9 = CFSTR("PSUICarrierSpaceChanged");
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PSUICarrierSpaceChanged"), 0);

}

- (void)appsDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__PSUICarrierSpaceManager_appsDidChange__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __40__PSUICarrierSpaceManager_appsDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[PSUICarrierSpaceManager appsDidChange]_block_invoke";
    v8 = 2112;
    v9 = CFSTR("PSUICarrierSpaceChanged");
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("PSUICarrierSpaceChanged"), 0);

}

- (void)userConsentFlowInfoDidChange
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__PSUICarrierSpaceManager_userConsentFlowInfoDidChange__block_invoke;
  block[3] = &unk_24D501660;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __55__PSUICarrierSpaceManager_userConsentFlowInfoDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = 0;

  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[PSUICarrierSpaceManager userConsentFlowInfoDidChange]_block_invoke";
    v12 = 2112;
    v13 = CFSTR("PSUICarrierSpaceChanged");
    _os_log_impl(&dword_2161C6000, v8, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("PSUICarrierSpaceChanged"), 0);

}

+ (id)getNSURLSessionConfiguration
{
  void *v2;
  _QWORD *v3;
  void *v4;
  _Unwind_Exception *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = (_QWORD *)getkCTCarrierSpaceConnectionAccountIdentifierSymbolLoc_ptr;
  v10 = getkCTCarrierSpaceConnectionAccountIdentifierSymbolLoc_ptr;
  if (!getkCTCarrierSpaceConnectionAccountIdentifierSymbolLoc_ptr)
  {
    v4 = (void *)CTCarrierSpaceLibrary();
    v3 = dlsym(v4, "kCTCarrierSpaceConnectionAccountIdentifier");
    v8[3] = (uint64_t)v3;
    getkCTCarrierSpaceConnectionAccountIdentifierSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
  {
    dlerror();
    v6 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  objc_msgSend(v2, "set_sourceApplicationSecondaryIdentifier:", *v3);
  return v2;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("CarrierSpaceManager"));
}

- (CTCarrierSpaceClient)carrierSpaceClient
{
  return self->_carrierSpaceClient;
}

- (void)setCarrierSpaceClient:(id)a3
{
  objc_storeStrong((id *)&self->_carrierSpaceClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierSpaceClient, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_userConsentResponse, 0);
  objc_storeStrong((id *)&self->_userConsentFlowInfo, 0);
  objc_storeStrong((id *)&self->_hasUserConsent, 0);
  objc_storeStrong((id *)&self->_carrierAppInstallController, 0);
  objc_storeStrong((id *)&self->_appsInfo, 0);
  objc_storeStrong((id *)&self->_plansInfo, 0);
  objc_storeStrong((id *)&self->_usageInfo, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end
