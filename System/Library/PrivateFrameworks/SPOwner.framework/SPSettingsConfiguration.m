@implementation SPSettingsConfiguration

- (NSUUID)baUUID
{
  return 0;
}

- (NSDate)beaconZoneCreationDate
{
  void *v2;
  void *v3;
  id v4;

  -[SPSettingsConfiguration sharedDefaults](self, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SPBeaconZoneCreationDateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSDate *)v4;
}

- (NSNumber)beaconZoneCreationErrorCode
{
  void *v2;
  void *v3;
  id v4;

  -[SPSettingsConfiguration sharedDefaults](self, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SPBeaconZoneCreationDateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSNumber *)v4;
}

- (NSDate)lastKeyRollDate
{
  void *v2;
  void *v3;
  id v4;

  -[SPSettingsConfiguration sharedDefaults](self, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SPLastKeyRollDateKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSDate *)v4;
}

- (id)serviceSettingsConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/private/var/db/searchparty/daemon/savedConfiguration.plist"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v2, 0);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("configurations"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("source"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "isEqualToString:", CFSTR("serviceSettings")) & 1) != 0)
          {
            v11 = v9;

            goto LABEL_12;
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_12:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (SPSettingsConfiguration)init
{
  SPSettingsConfiguration *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSOperationQueue *v6;
  NSOperationQueue *notificationQueue;
  void *v8;
  uint64_t v9;
  FMXPCServiceDescription *serviceDescription;
  uint64_t v11;
  NSUserDefaults *sharedDefaults;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[4];
  SPSettingsConfiguration *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)SPSettingsConfiguration;
  v2 = -[SPSettingsConfiguration init](&v15, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.settingsconfiguration", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = v6;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE27978);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D20238]), "initWithMachServiceName:options:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.beaconmanager"), 0, v8, 0, 0);
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("systemgroup.com.apple.icloud.searchpartyd.sharedsettings"));
    sharedDefaults = v2->_sharedDefaults;
    v2->_sharedDefaults = (NSUserDefaults *)v11;

    LogCategory_ServiceState();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v2;
      _os_log_impl(&dword_1AEA79000, v13, OS_LOG_TYPE_DEFAULT, "SPSettingsConfiguration: Created %@", buf, 0xCu);
    }

  }
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  SPSettingsConfiguration *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  LogCategory_ServiceState();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPSettingsConfiguration: Dealloc %@", buf, 0xCu);
  }

  -[SPSettingsConfiguration _invalidate](self, "_invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SPSettingsConfiguration;
  -[SPSettingsConfiguration dealloc](&v4, sel_dealloc);
}

- (void)_invalidate
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v5;

  -[SPSettingsConfiguration session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SPSettingsConfiguration setSession:](self, "setSession:", 0);
  -[SPSettingsConfiguration serviceSettingsChangedNotificationToken](self, "serviceSettingsChangedNotificationToken");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SPSettingsConfiguration setServiceSettingsChangedNotificationToken:](self, "setServiceSettingsChangedNotificationToken:", 0);
  if (v5)
    -[SPSettingsConfiguration fm_removeNotificationBlockObserver:](self, "fm_removeNotificationBlockObserver:", v5);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.icloud.searchparty.ServiceSettingsChanged"), 0);

}

- (void)beginRefreshingServiceStateWithBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD aBlock[5];
  id v19;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  -[SPSettingsConfiguration serviceSettingsChangedNotificationToken](self, "serviceSettingsChangedNotificationToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    LogCategory_ServiceState();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "beginRefreshingServiceStateWithBlock: already started.", buf, 2u);
    }

  }
  else
  {
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__SPSettingsConfiguration_beginRefreshingServiceStateWithBlock___block_invoke;
    block[3] = &unk_1E5E16668;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    aBlock[0] = v7;
    aBlock[1] = 3221225472;
    aBlock[2] = __64__SPSettingsConfiguration_beginRefreshingServiceStateWithBlock___block_invoke_2;
    aBlock[3] = &unk_1E5E17278;
    aBlock[4] = self;
    v19 = v4;
    v8 = _Block_copy(aBlock);
    v9 = SPServiceSettingsChangedLocalNotification;
    -[SPSettingsConfiguration notificationQueue](self, "notificationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v7;
    v14 = 3221225472;
    v15 = __64__SPSettingsConfiguration_beginRefreshingServiceStateWithBlock___block_invoke_3;
    v16 = &unk_1E5E186F0;
    v17 = v8;
    v11 = v8;
    -[SPSettingsConfiguration fm_addNotificationBlockObserverForName:object:queue:usingBlock:](self, "fm_addNotificationBlockObserverForName:object:queue:usingBlock:", v9, self, v10, &v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPSettingsConfiguration setServiceSettingsChangedNotificationToken:](self, "setServiceSettingsChangedNotificationToken:", v12, v13, v14, v15, v16);

    v11[2](v11);
  }

}

void __64__SPSettingsConfiguration_beginRefreshingServiceStateWithBlock___block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)serviceSettingsChangedTrampoline, CFSTR("com.apple.icloud.searchparty.ServiceSettingsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void __64__SPSettingsConfiguration_beginRefreshingServiceStateWithBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "serviceState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serviceDisabledReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

uint64_t __64__SPSettingsConfiguration_beginRefreshingServiceStateWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setServiceState:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[SPSettingsConfiguration queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__SPSettingsConfiguration_setServiceState_completion___block_invoke;
  v11[3] = &unk_1E5E16748;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __54__SPSettingsConfiguration_setServiceState_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "userAgentProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setServiceState:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (NSString)serviceState
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[SPSettingsConfiguration sharedDefaults](self, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("SPSettingsServiceStateKey"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("SPServiceStateEnabled");
  v5 = v3;

  return v5;
}

- (NSSet)serviceDisabledReasons
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[SPSettingsConfiguration sharedDefaults](self, "sharedDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayForKey:", CFSTR("SPSettingsServiceDisabledReasonsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_opt_new();
  v8 = v7;

  return (NSSet *)v8;
}

- (SPBeaconManagerXPCProtocol)proxy
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SPSettingsConfiguration queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPSettingsConfiguration session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPSettingsConfiguration serviceDescription](self, "serviceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithServiceDescription:", v6);
    -[SPSettingsConfiguration setSession:](self, "setSession:", v7);

    LogCategory_ServiceState();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SPSettingsConfiguration serviceDescription](self, "serviceDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "machService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPSettingsConfiguration: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);

    }
    -[SPSettingsConfiguration session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
  -[SPSettingsConfiguration session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "proxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPBeaconManagerXPCProtocol *)v13;
}

- (NSUserDefaults)sharedDefaults
{
  return self->_sharedDefaults;
}

- (void)setSharedDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_sharedDefaults, a3);
}

- (void)setServiceState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setServiceDisabledReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescription, a3);
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (void)setUserAgentProxy:(id)a3
{
  objc_storeStrong((id *)&self->_userAgentProxy, a3);
}

- (id)serviceSettingsChangedNotificationToken
{
  return objc_loadWeakRetained(&self->_serviceSettingsChangedNotificationToken);
}

- (void)setServiceSettingsChangedNotificationToken:(id)a3
{
  objc_storeWeak(&self->_serviceSettingsChangedNotificationToken, a3);
}

- (NSOperationQueue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_destroyWeak(&self->_serviceSettingsChangedNotificationToken);
  objc_storeStrong((id *)&self->_userAgentProxy, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_serviceDisabledReasons, 0);
  objc_storeStrong((id *)&self->_serviceState, 0);
  objc_storeStrong((id *)&self->_sharedDefaults, 0);
}

@end
