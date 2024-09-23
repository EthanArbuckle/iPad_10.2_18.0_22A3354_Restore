@implementation PSAppDataUsagePolicyCache

+ (id)sharedInstance
{
  if (qword_253E97678 != -1)
    dispatch_once(&qword_253E97678, &__block_literal_global_4);
  return (id)_MergedGlobals_7;
}

void __43__PSAppDataUsagePolicyCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSAppDataUsagePolicyCache initPrivate]([PSAppDataUsagePolicyCache alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_7;
  _MergedGlobals_7 = (uint64_t)v0;

}

- (id)initPrivate
{
  PSAppDataUsagePolicyCache *v2;
  uint64_t v3;
  NSCache *policyCache;
  id v5;
  void *v6;
  uint64_t v7;
  CoreTelephonyClient *ctClient;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v14;
  uint8_t v15[16];
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PSAppDataUsagePolicyCache;
  v2 = -[PSAppDataUsagePolicyCache init](&v22, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    policyCache = v2->_policyCache;
    v2->_policyCache = (NSCache *)v3;

    -[NSCache setCountLimit:](v2->_policyCache, "setCountLimit:", 1000);
    v5 = objc_alloc(MEMORY[0x24BDC2810]);
    +[SettingsCellularSharedUtils createCTClientSerialQueue:](SettingsCellularSharedUtils, "createCTClientSerialQueue:", CFSTR("app_data_policy_usage_cache"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithQueue:", v6);
    ctClient = v2->_ctClient;
    v2->_ctClient = (CoreTelephonyClient *)v7;

    -[CoreTelephonyClient setDelegate:](v2->_ctClient, "setDelegate:", v2);
    location = 0;
    objc_initWeak(&location, v2);
    v9 = MEMORY[0x24BDAC9B8];
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __40__PSAppDataUsagePolicyCache_initPrivate__block_invoke;
    v19 = &unk_24D96EDE8;
    objc_copyWeak(&v20, &location);
    v2->_ctServerConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    if (!v2->_ctServerConnection)
    {
      -[PSAppDataUsagePolicyCache getLogger](v2, "getLogger");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_error_impl(&dword_2188BE000, v14, OS_LOG_TYPE_ERROR, "Failed to create CT server connection", v15, 2u);
      }

      objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("CT server connection error"), CFSTR("Failed to create CT server connection"), 0));
    }
    _CTServerConnectionRegisterForNotification();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel_willEnterForeground, *MEMORY[0x24BDF75D0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v2, sel_managedConfigurationSettingsDidChange, *MEMORY[0x24BE63740], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_managedConfigurationProfileListDidChange, *MEMORY[0x24BE63B78], 0);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __40__PSAppDataUsagePolicyCache_initPrivate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handlePolicyChangedNotification");

}

- (void)dealloc
{
  __CTServerConnection *ctServerConnection;
  objc_super v4;

  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
    CFRelease(ctServerConnection);
  v4.receiver = self;
  v4.super_class = (Class)PSAppDataUsagePolicyCache;
  -[PSAppDataUsagePolicyCache dealloc](&v4, sel_dealloc);
}

- (void)clearCache
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSAppDataUsagePolicyCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Clearing policy cache", v4, 2u);
  }

  -[NSCache removeAllObjects](self->_policyCache, "removeAllObjects");
}

- (void)handlePolicyChangedNotification
{
  NSObject *v3;
  const char *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[PSAppDataUsagePolicyCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (const char *)*MEMORY[0x24BDC2AD8];
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Received notification %@", (uint8_t *)&v8, 0xCu);
  }

  -[PSAppDataUsagePolicyCache clearCache](self, "clearCache");
  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("PSPerAppNetworkDataAccessPolicyChangedNotification"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAppDataUsagePolicyCache getLogger](self, "getLogger");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[PSAppDataUsagePolicyCache handlePolicyChangedNotification]";
    v10 = 2112;
    v11 = CFSTR("PSPerAppNetworkDataAccessPolicyChangedNotification");
    _os_log_impl(&dword_2188BE000, v6, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_postNotification_, v5, 0);

}

- (void)willEnterForeground
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSAppDataUsagePolicyCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Received willEnterForeground notification", v4, 2u);
  }

  -[PSAppDataUsagePolicyCache clearCache](self, "clearCache");
}

- (void)managedConfigurationSettingsDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSAppDataUsagePolicyCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Received managedConfigurationSettingsDidChange notification", v4, 2u);
  }

  -[PSAppDataUsagePolicyCache clearCache](self, "clearCache");
}

- (void)managedConfigurationProfileListDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSAppDataUsagePolicyCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Received managedConfigurationProfileListDidChange notification", v4, 2u);
  }

  -[PSAppDataUsagePolicyCache clearCache](self, "clearCache");
}

- (PSAppDataUsagePolicyCache)init
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  -[PSAppDataUsagePolicyCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[PSAppDataUsagePolicyCache init]";
    _os_log_error_impl(&dword_2188BE000, v2, OS_LOG_TYPE_ERROR, "Unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (void)addPoliciesToCache:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__PSAppDataUsagePolicyCache_addPoliciesToCache___block_invoke;
  v5[3] = &unk_24D96EE10;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __48__PSAppDataUsagePolicyCache_addPoliciesToCache___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id *v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained(v5);
    objc_msgSend(v7, "policyCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, v9);

  }
  else
  {
    *a3 = 1;
  }

}

- (void)fetchUsagePoliciesFor:(id)a3
{
  id v4;
  NSObject *v5;
  CoreTelephonyClient *ctClient;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _BYTE buf[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSAppDataUsagePolicyCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = objc_msgSend(v4, "count");
    _os_log_impl(&dword_2188BE000, v5, OS_LOG_TYPE_DEFAULT, "Fetching usage policies for %lu apps.", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  ctClient = self->_ctClient;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__PSAppDataUsagePolicyCache_fetchUsagePoliciesFor___block_invoke;
  v9[3] = &unk_24D96EE38;
  v9[4] = self;
  v8 = v4;
  v10 = v8;
  objc_copyWeak(&v11, (id *)buf);
  -[CoreTelephonyClient getLocalPolicies:completion:](ctClient, "getLocalPolicies:completion:", v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

void __51__PSAppDataUsagePolicyCache_fetchUsagePoliciesFor___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *WeakRetained;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = (uint64_t)v6;
      _os_log_error_impl(&dword_2188BE000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to fetch policies, error: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(a1[5], "count");
      v10 = 134217984;
      v11 = v9;
      _os_log_impl(&dword_2188BE000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Policies fetch success for %lu apps.", (uint8_t *)&v10, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained(a1 + 6);
    -[NSObject addPoliciesToCache:](WeakRetained, "addPoliciesToCache:", v5);
  }

}

- (void)fetchUsagePolicyFor:(id)a3
{
  id v4;
  NSObject *v5;
  CoreTelephonyClient *ctClient;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSAppDataUsagePolicyCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v4;
    _os_log_impl(&dword_2188BE000, v5, OS_LOG_TYPE_DEFAULT, "Fetching usage policies for %{public}@", buf, 0xCu);
  }

  ctClient = self->_ctClient;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  -[CoreTelephonyClient getLocalPolicies:error:](ctClient, "getLocalPolicies:error:", v7, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;

  -[PSAppDataUsagePolicyCache getLogger](self, "getLogger");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 || !v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v4;
      v15 = 2112;
      v16 = v9;
      _os_log_error_impl(&dword_2188BE000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch policies for %{public}@, error: %@", buf, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v4;
      _os_log_impl(&dword_2188BE000, v11, OS_LOG_TYPE_DEFAULT, "Policies fetch success for %{public}@", buf, 0xCu);
    }

    -[PSAppDataUsagePolicyCache addPoliciesToCache:](self, "addPoliciesToCache:", v8);
  }

}

- (id)policiesFor:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PSAppDataUsagePolicyCache getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v10 = 138543362;
    v11 = v4;
    _os_log_impl(&dword_2188BE000, v5, OS_LOG_TYPE_INFO, "Requested usage policies for %{public}@", (uint8_t *)&v10, 0xCu);
  }

  -[NSCache objectForKey:](self->_policyCache, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PSAppDataUsagePolicyCache getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_impl(&dword_2188BE000, v7, OS_LOG_TYPE_INFO, "Cache did not have usage policies for %{public}@", (uint8_t *)&v10, 0xCu);
    }

    -[PSAppDataUsagePolicyCache fetchUsagePolicyFor:](self, "fetchUsagePolicyFor:", v4);
  }
  -[NSCache objectForKey:](self->_policyCache, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setPolicies:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CoreTelephonyClient *ctClient;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location[2];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    location[0] = 0;
    objc_initWeak(location, self);
    ctClient = self->_ctClient;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __52__PSAppDataUsagePolicyCache_setPolicies_completion___block_invoke;
    v12[3] = &unk_24D96EE60;
    objc_copyWeak(&v15, location);
    v13 = v6;
    v14 = v7;
    -[CoreTelephonyClient setLocalPolicies:completion:](ctClient, "setLocalPolicies:completion:", v9, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  else
  {
    -[PSAppDataUsagePolicyCache getLogger](self, "getLogger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_2188BE000, v10, OS_LOG_TYPE_ERROR, "Attempted to set nil policies", (uint8_t *)location, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 103, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v11);

  }
}

void __52__PSAppDataUsagePolicyCache_setPolicies_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (v3)
  {
    if (WeakRetained)
    {
      v5 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v5, "getLogger");
      v6 = objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
LABEL_10:

        goto LABEL_11;
      }
      objc_msgSend(*(id *)(a1 + 32), "bundleId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v7;
      v15 = 2112;
      v16 = v3;
      _os_log_error_impl(&dword_2188BE000, v6, OS_LOG_TYPE_ERROR, "Set policy failed for %{public}@, error: %@", (uint8_t *)&v13, 0x16u);
LABEL_9:

      goto LABEL_10;
    }
  }
  else if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v8, "getLogger");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "bundleId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v10;
      _os_log_impl(&dword_2188BE000, v9, OS_LOG_TYPE_DEFAULT, "Set policy success for %{public}@", (uint8_t *)&v13, 0xCu);

    }
    v6 = objc_loadWeakRetained((id *)(a1 + 48));
    -[NSObject policyCache](v6, "policyCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v11, "bundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v11, v12);

    goto LABEL_9;
  }
LABEL_11:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)getLogger
{
  return +[Logger loggerWithCategory:](Logger, "loggerWithCategory:", CFSTR("AppDataUsagePolicy"));
}

- (NSCache)policyCache
{
  return self->_policyCache;
}

- (void)setPolicyCache:(id)a3
{
  objc_storeStrong((id *)&self->_policyCache, a3);
}

- (__CTServerConnection)ctServerConnection
{
  return self->_ctServerConnection;
}

- (void)setCtServerConnection:(__CTServerConnection *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
  objc_storeStrong((id *)&self->_ctClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_policyCache, 0);
}

@end
