@implementation PSSimStatusCache

+ (id)sharedInstance
{
  if (qword_253E97618 != -1)
    dispatch_once(&qword_253E97618, &__block_literal_global_1);
  return (id)_MergedGlobals_4;
}

void __34__PSSimStatusCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSSimStatusCache initPrivate]([PSSimStatusCache alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_4;
  _MergedGlobals_4 = (uint64_t)v0;

}

- (id)initPrivate
{
  id v3;
  void *v4;
  void *v5;
  PSSimStatusCache *v6;

  v3 = objc_alloc(MEMORY[0x24BDC2810]);
  +[SettingsCellularSharedUtils createCTClientSerialQueue:](SettingsCellularSharedUtils, "createCTClientSerialQueue:", CFSTR("sim_status"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithQueue:", v4);

  v6 = -[PSSimStatusCache initWithCoreTelephonyClient:](self, "initWithCoreTelephonyClient:", v5);
  return v6;
}

- (PSSimStatusCache)initWithCoreTelephonyClient:(id)a3
{
  id v5;
  PSSimStatusCache *v6;
  PSSimStatusCache *v7;
  CTXPCServiceSubscriptionInfo *subscriptionInfo;
  NSMutableDictionary *simStatusDict;
  CTXPCServiceSubscriptionContext *currentDataSubscriptionContext;
  CTXPCServiceSubscriptionContext *userDefaultVoiceSubscriptionContext;
  NSMutableDictionary *simHardwareTypeDict;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PSSimStatusCache;
  v6 = -[PSSimStatusCache init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreTelephonyClient, a3);
    -[CoreTelephonyClient setDelegate:](v7->_coreTelephonyClient, "setDelegate:", v7);
    subscriptionInfo = v7->_subscriptionInfo;
    v7->_subscriptionInfo = 0;

    simStatusDict = v7->_simStatusDict;
    v7->_simStatusDict = 0;

    currentDataSubscriptionContext = v7->_currentDataSubscriptionContext;
    v7->_currentDataSubscriptionContext = 0;

    userDefaultVoiceSubscriptionContext = v7->_userDefaultVoiceSubscriptionContext;
    v7->_userDefaultVoiceSubscriptionContext = 0;

    simHardwareTypeDict = v7->_simHardwareTypeDict;
    v7->_simHardwareTypeDict = 0;

    -[PSSimStatusCache updateIsAnySimPresent](v7, "updateIsAnySimPresent");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel_willEnterForeground, *MEMORY[0x24BDF75D0], 0);

  }
  return v7;
}

- (void)fetchSimStatus
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  CoreTelephonyClient *coreTelephonyClient;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  PSSimStatusCache *v16;
  __int128 v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[PSSimStatusCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Fetching SIM status", buf, 2u);
  }

  -[PSSimStatusCache subscriptionContexts](self, "subscriptionContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v21;
    *(_QWORD *)&v7 = 138412546;
    v17 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        coreTelephonyClient = self->_coreTelephonyClient;
        v19 = 0;
        -[CoreTelephonyClient getSIMStatus:error:](coreTelephonyClient, "getSIMStatus:error:", v10, &v19, v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v19;
        -[PSSimStatusCache getLogger](self, "getLogger");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v25 = v10;
            v26 = 2114;
            v27 = v13;
            _os_log_error_impl(&dword_2188BE000, v15, OS_LOG_TYPE_ERROR, "Fetch failed: %@, %{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            v25 = v10;
            v26 = 2114;
            v27 = v12;
            _os_log_impl(&dword_2188BE000, v15, OS_LOG_TYPE_DEFAULT, "Fetch succeeded: %@, %{public}@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "slotID"));
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, v15);
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v6);
  }

  v16 = self;
  objc_sync_enter(v16);
  -[PSSimStatusCache setSimStatusDict:](v16, "setSimStatusDict:", v18);
  objc_sync_exit(v16);

}

- (id)getLogger
{
  return +[Logger loggerWithCategory:](Logger, "loggerWithCategory:", CFSTR("SIMCache"));
}

- (void)updateIsAnySimPresent
{
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t i;
  const char *v12;
  __CFString *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const __CFString *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[PSSimStatusCache subscriptionContexts](self, "subscriptionContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isAnySimPresent = 0;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v19;
    v9 = (void *)*MEMORY[0x24BDC2CD0];
    v10 = (void *)*MEMORY[0x24BDC2D10];
    *(_QWORD *)&v6 = 138412546;
    v17 = v6;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        v12 = *(const char **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[PSSimStatusCache simStatus:](self, "simStatus:", v12, v17, (_QWORD)v18);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[PSSimStatusCache getLogger](self, "getLogger");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v17;
          v23 = v12;
          v24 = 2114;
          v25 = v13;
          _os_log_impl(&dword_2188BE000, v14, OS_LOG_TYPE_DEFAULT, "SIM status fetch succeeded: %@, %{public}@", buf, 0x16u);
        }

        if ((objc_msgSend(v9, "isEqualToString:", v13) & 1) == 0)
          self->_isAnySimPresent = 1;
        if (objc_msgSend(v10, "isEqualToString:", v13))
        {
          -[PSSimStatusCache getLogger](self, "getLogger");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v23 = "-[PSSimStatusCache updateIsAnySimPresent]";
            v24 = 2112;
            v25 = CFSTR("PSSimStatusChangedToReadyNotification");
            _os_log_impl(&dword_2188BE000, v15, OS_LOG_TYPE_DEFAULT, "%s posting notification %@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "postNotificationName:object:", CFSTR("PSSimStatusChangedToReadyNotification"), 0);

          goto LABEL_17;
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_17:

}

- (id)subscriptionContexts
{
  CTXPCServiceSubscriptionInfo *subscriptionInfo;

  subscriptionInfo = self->_subscriptionInfo;
  if (!subscriptionInfo)
  {
    -[PSSimStatusCache fetchSubscriptionContexts](self, "fetchSubscriptionContexts");
    subscriptionInfo = self->_subscriptionInfo;
  }
  return (id)-[CTXPCServiceSubscriptionInfo subscriptions](subscriptionInfo, "subscriptions");
}

- (id)simStatus:(id)a3
{
  id v4;
  PSSimStatusCache *v5;
  NSMutableDictionary *simStatusDict;
  void *v7;
  void *v8;

  v4 = a3;
  if (!self->_simStatusDict)
    -[PSSimStatusCache fetchSimStatus](self, "fetchSimStatus");
  v5 = self;
  objc_sync_enter(v5);
  simStatusDict = self->_simStatusDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](simStatusDict, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v8;
}

- (void)setSimStatusDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)fetchSubscriptionContexts
{
  NSObject *v3;
  CoreTelephonyClient *coreTelephonyClient;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[PSSimStatusCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "executing fetch", buf, 2u);
  }

  coreTelephonyClient = self->_coreTelephonyClient;
  v9 = 0;
  -[CoreTelephonyClient getSubscriptionInfoWithError:](coreTelephonyClient, "getSubscriptionInfoWithError:", &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  -[PSSimStatusCache getLogger](self, "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_error_impl(&dword_2188BE000, v8, OS_LOG_TYPE_ERROR, "fetch failed: %@", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_2188BE000, v8, OS_LOG_TYPE_DEFAULT, "fetch succeeded: %@", buf, 0xCu);
    }

    -[PSSimStatusCache setSubscriptionInfo:](self, "setSubscriptionInfo:", v5);
  }

}

- (void)setSubscriptionInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (PSSimStatusCache)init
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  -[PSSimStatusCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[PSSimStatusCache init]";
    _os_log_error_impl(&dword_2188BE000, v2, OS_LOG_TYPE_ERROR, "unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (void)clearSubscriptionContextCache
{
  NSObject *v3;
  PSSimStatusCache *v4;
  uint8_t v5[16];

  -[PSSimStatusCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Clearing sim status cache", v5, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[PSSimStatusCache setCurrentDataSubscriptionContext:](v4, "setCurrentDataSubscriptionContext:", 0);
  -[PSSimStatusCache setUserDefaultVoiceSubscriptionContext:](v4, "setUserDefaultVoiceSubscriptionContext:", 0);
  objc_sync_exit(v4);

}

- (void)clearSimHardwareInfoCache
{
  NSObject *v3;
  PSSimStatusCache *v4;
  uint8_t v5[16];

  -[PSSimStatusCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Clearing sim hardware info cache", v5, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[PSSimStatusCache setSimHardwareTypeDict:](v4, "setSimHardwareTypeDict:", 0);
  objc_sync_exit(v4);

}

- (void)willEnterForeground
{
  NSObject *v3;
  CTXPCServiceSubscriptionInfo *subscriptionInfo;
  NSMutableDictionary *simStatusDict;
  uint8_t v6[16];

  -[PSSimStatusCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Entering foreground", v6, 2u);
  }

  subscriptionInfo = self->_subscriptionInfo;
  self->_subscriptionInfo = 0;

  simStatusDict = self->_simStatusDict;
  self->_simStatusDict = 0;

  -[PSSimStatusCache clearSubscriptionContextCache](self, "clearSubscriptionContextCache");
  -[PSSimStatusCache clearSimHardwareInfoCache](self, "clearSimHardwareInfoCache");
  -[PSSimStatusCache fetchSubscriptionContexts](self, "fetchSubscriptionContexts");
  -[PSSimStatusCache fetchSimStatus](self, "fetchSimStatus");
  -[PSSimStatusCache updateIsAnySimPresent](self, "updateIsAnySimPresent");
}

- (void)fetchActiveDataSubscriptionContextIfNeeded
{
  PSSimStatusCache *v2;
  void *v3;
  NSObject *v4;
  PSSimStatusCache *v5;
  NSObject *v6;
  CoreTelephonyClient *coreTelephonyClient;
  PSSimStatusCache *v8;
  PSSimStatusCache *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  PSSimStatusCache *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[PSSimStatusCache currentDataSubscriptionContext](v2, "currentDataSubscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PSSimStatusCache getLogger](v2, "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[PSSimStatusCache currentDataSubscriptionContext](v2, "currentDataSubscriptionContext");
      v5 = (PSSimStatusCache *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_2188BE000, v4, OS_LOG_TYPE_DEFAULT, "No fetch needed, active data subscription context is: %@", buf, 0xCu);

    }
    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    -[PSSimStatusCache getLogger](v2, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188BE000, v6, OS_LOG_TYPE_DEFAULT, "Executing fetch for active data subscription", buf, 2u);
    }

    coreTelephonyClient = v2->_coreTelephonyClient;
    v12 = 0;
    -[CoreTelephonyClient getCurrentDataSubscriptionContextSync:](coreTelephonyClient, "getCurrentDataSubscriptionContextSync:", &v12);
    v8 = (PSSimStatusCache *)objc_claimAutoreleasedReturnValue();
    v9 = (PSSimStatusCache *)v12;
    -[PSSimStatusCache getLogger](v2, "getLogger");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_error_impl(&dword_2188BE000, v11, OS_LOG_TYPE_ERROR, "Fetch failed: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_impl(&dword_2188BE000, v11, OS_LOG_TYPE_DEFAULT, "Fetch succeeded: %@", buf, 0xCu);
      }

      v11 = v2;
      objc_sync_enter(v11);
      -[NSObject setCurrentDataSubscriptionContext:](v11, "setCurrentDataSubscriptionContext:", v8);
      objc_sync_exit(v11);
    }

    v2 = v9;
  }

}

- (void)fetchDefaultVoiceSubscriptionContextIfNeeded
{
  PSSimStatusCache *v2;
  void *v3;
  NSObject *v4;
  PSSimStatusCache *v5;
  NSObject *v6;
  CoreTelephonyClient *coreTelephonyClient;
  PSSimStatusCache *v8;
  PSSimStatusCache *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  PSSimStatusCache *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[PSSimStatusCache userDefaultVoiceSubscriptionContext](v2, "userDefaultVoiceSubscriptionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PSSimStatusCache getLogger](v2, "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[PSSimStatusCache userDefaultVoiceSubscriptionContext](v2, "userDefaultVoiceSubscriptionContext");
      v5 = (PSSimStatusCache *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_2188BE000, v4, OS_LOG_TYPE_DEFAULT, "No fetch needed, default voice subscription context is: %@", buf, 0xCu);

    }
    objc_sync_exit(v2);
  }
  else
  {
    objc_sync_exit(v2);

    -[PSSimStatusCache getLogger](v2, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188BE000, v6, OS_LOG_TYPE_DEFAULT, "Executing fetch for default voice subscription", buf, 2u);
    }

    coreTelephonyClient = v2->_coreTelephonyClient;
    v12 = 0;
    -[CoreTelephonyClient getUserDefaultVoiceSubscriptionContext:](coreTelephonyClient, "getUserDefaultVoiceSubscriptionContext:", &v12);
    v8 = (PSSimStatusCache *)objc_claimAutoreleasedReturnValue();
    v9 = (PSSimStatusCache *)v12;
    -[PSSimStatusCache getLogger](v2, "getLogger");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_error_impl(&dword_2188BE000, v11, OS_LOG_TYPE_ERROR, "Fetch failed: %@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v8;
        _os_log_impl(&dword_2188BE000, v11, OS_LOG_TYPE_DEFAULT, "Fetch succeeded: %@", buf, 0xCu);
      }

      v11 = v2;
      objc_sync_enter(v11);
      -[NSObject setUserDefaultVoiceSubscriptionContext:](v11, "setUserDefaultVoiceSubscriptionContext:", v8);
      objc_sync_exit(v11);
    }

    v2 = v9;
  }

}

- (id)subscriptionsInUse
{
  CTXPCServiceSubscriptionInfo *subscriptionInfo;

  subscriptionInfo = self->_subscriptionInfo;
  if (!subscriptionInfo)
  {
    -[PSSimStatusCache fetchSubscriptionContexts](self, "fetchSubscriptionContexts");
    subscriptionInfo = self->_subscriptionInfo;
  }
  return (id)-[CTXPCServiceSubscriptionInfo subscriptionsInUse](subscriptionInfo, "subscriptionsInUse");
}

- (void)subscriptionInfoDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSSimStatusCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Subscription info changed", v4, 2u);
  }

  -[PSSimStatusCache fetchSubscriptionContexts](self, "fetchSubscriptionContexts");
}

- (id)defaultVoiceSubscriptionContext
{
  PSSimStatusCache *v3;
  void *v4;

  -[PSSimStatusCache fetchDefaultVoiceSubscriptionContextIfNeeded](self, "fetchDefaultVoiceSubscriptionContextIfNeeded");
  v3 = self;
  objc_sync_enter(v3);
  -[PSSimStatusCache userDefaultVoiceSubscriptionContext](v3, "userDefaultVoiceSubscriptionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (id)activeDataSubscriptionContext
{
  PSSimStatusCache *v3;
  void *v4;

  -[PSSimStatusCache fetchActiveDataSubscriptionContextIfNeeded](self, "fetchActiveDataSubscriptionContextIfNeeded");
  v3 = self;
  objc_sync_enter(v3);
  -[PSSimStatusCache currentDataSubscriptionContext](v3, "currentDataSubscriptionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v3);

  return v4;
}

- (BOOL)isSlotActiveDataSlot:(int64_t)a3
{
  PSSimStatusCache *v5;
  void *v6;

  -[PSSimStatusCache fetchActiveDataSubscriptionContextIfNeeded](self, "fetchActiveDataSubscriptionContextIfNeeded");
  v5 = self;
  objc_sync_enter(v5);
  -[PSSimStatusCache currentDataSubscriptionContext](v5, "currentDataSubscriptionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v6, "slotID") == a3;

  objc_sync_exit(v5);
  return a3;
}

- (void)fetchSimHardwareInfo
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  CoreTelephonyClient *coreTelephonyClient;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  PSSimStatusCache *v17;
  __int128 v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[PSSimStatusCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Fetching SIM hardware info", buf, 2u);
  }

  -[PSSimStatusCache subscriptionContexts](self, "subscriptionContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v22;
    *(_QWORD *)&v7 = 138412546;
    v18 = v7;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        coreTelephonyClient = self->_coreTelephonyClient;
        v20 = 0;
        -[CoreTelephonyClient getSimHardwareInfo:error:](coreTelephonyClient, "getSimHardwareInfo:error:", v10, &v20, v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v20;
        -[PSSimStatusCache getLogger](self, "getLogger");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v18;
            v26 = v10;
            v27 = 2114;
            v28 = v13;
            _os_log_error_impl(&dword_2188BE000, v15, OS_LOG_TYPE_ERROR, "Fetch failed: %@, %{public}@", buf, 0x16u);
          }
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            v26 = v10;
            v27 = 2114;
            v28 = v12;
            _os_log_impl(&dword_2188BE000, v15, OS_LOG_TYPE_DEFAULT, "Fetch succeeded: %@, %{public}@", buf, 0x16u);
          }

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v12, "hardwareType"));
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "slotID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v16);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v6);
  }

  v17 = self;
  objc_sync_enter(v17);
  -[PSSimStatusCache setSimHardwareTypeDict:](v17, "setSimHardwareTypeDict:", v19);
  objc_sync_exit(v17);

}

- (int64_t)simHardwareInfo:(id)a3
{
  id v4;
  PSSimStatusCache *v5;
  NSMutableDictionary *simHardwareTypeDict;
  void *v7;
  void *v8;
  int v9;
  int64_t v10;

  v4 = a3;
  if (!self->_simHardwareTypeDict)
    -[PSSimStatusCache fetchSimHardwareInfo](self, "fetchSimHardwareInfo");
  v5 = self;
  objc_sync_enter(v5);
  simHardwareTypeDict = self->_simHardwareTypeDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "slotID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](simHardwareTypeDict, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  v9 = objc_msgSend(v8, "intValue");
  if (v9 == 1)
    v10 = 1;
  else
    v10 = 2 * (v9 == 2);

  return v10;
}

- (BOOL)isDualSimCapable
{
  void *v2;
  BOOL v3;

  -[PSSimStatusCache subscriptionContexts](self, "subscriptionContexts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (BOOL)isSIMMissing
{
  int v3;

  v3 = MGGetBoolAnswer();
  if (v3)
    LOBYTE(v3) = !self->_isAnySimPresent;
  return v3;
}

- (void)simStatusDidChange:(id)a3 status:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PSSimStatusCache *v9;
  NSMutableDictionary *simStatusDict;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[PSSimStatusCache getLogger](self, "getLogger");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_2188BE000, v8, OS_LOG_TYPE_DEFAULT, "Context: %@, status: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  v9 = self;
  objc_sync_enter(v9);
  simStatusDict = v9->_simStatusDict;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "slotID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](simStatusDict, "setObject:forKeyedSubscript:", v7, v11);

  objc_sync_exit(v9);
  -[PSSimStatusCache clearSubscriptionContextCache](v9, "clearSubscriptionContextCache");
  -[PSSimStatusCache clearSimHardwareInfoCache](v9, "clearSimHardwareInfoCache");
  -[PSSimStatusCache updateIsAnySimPresent](v9, "updateIsAnySimPresent");

}

- (void)preferredDataSimChanged:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  -[PSSimStatusCache getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188BE000, v4, OS_LOG_TYPE_DEFAULT, "Received Preferred Data SIM Changed, clearing cached subscription contexts", v5, 2u);
  }

  -[PSSimStatusCache clearSubscriptionContextCache](self, "clearSubscriptionContextCache");
}

- (void)currentDataSimChanged:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  -[PSSimStatusCache getLogger](self, "getLogger", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188BE000, v4, OS_LOG_TYPE_DEFAULT, "Recieved Current Data SIM Changed, clearing cached subscription contexts", v5, 2u);
  }

  -[PSSimStatusCache clearSubscriptionContextCache](self, "clearSubscriptionContextCache");
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
  objc_storeStrong((id *)&self->_coreTelephonyClient, a3);
}

- (CTXPCServiceSubscriptionInfo)subscriptionInfo
{
  return (CTXPCServiceSubscriptionInfo *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)simStatusDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (CTXPCServiceSubscriptionContext)currentDataSubscriptionContext
{
  return (CTXPCServiceSubscriptionContext *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentDataSubscriptionContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (CTXPCServiceSubscriptionContext)userDefaultVoiceSubscriptionContext
{
  return (CTXPCServiceSubscriptionContext *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserDefaultVoiceSubscriptionContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)simHardwareTypeDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSimHardwareTypeDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)isAnySimPresent
{
  return self->_isAnySimPresent;
}

- (void)setIsAnySimPresent:(BOOL)a3
{
  self->_isAnySimPresent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simHardwareTypeDict, 0);
  objc_storeStrong((id *)&self->_userDefaultVoiceSubscriptionContext, 0);
  objc_storeStrong((id *)&self->_currentDataSubscriptionContext, 0);
  objc_storeStrong((id *)&self->_simStatusDict, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end
