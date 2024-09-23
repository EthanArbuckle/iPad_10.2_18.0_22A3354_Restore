@implementation RTAccountManager

uint64_t __37__RTAccountManager_onDefaultsUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDefaultsUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)onDefaultsUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTDefaultsManagerNotificationDefaultsChanged, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[RTNotifier queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __37__RTAccountManager_onDefaultsUpdate___block_invoke;
    v11[3] = &unk_1E9297540;
    v11[4] = self;
    v12 = v4;
    dispatch_async(v8, v11);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v10;
      v15 = 2080;
      v16 = "-[RTAccountManager onDefaultsUpdate:]";
      v17 = 1024;
      v18 = 458;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "unknown notification name %@ (in %s:%d)", buf, 0x1Cu);

    }
  }

}

- (void)_onDefaultsUpdate:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTDefaultsManagerNotificationDefaultsChanged, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[RTAccountManager _onDefaultsUpdate:]";
      v13 = 1024;
      v14 = 465;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "notification name is not RTDefaultsManagerNotificationDefaultsChanged (in %s:%d)", (uint8_t *)&v11, 0x12u);
    }

  }
  -[RTDefaultsManager objectForKey:](self->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsAccountManagerAuthorizationChangeExitTimeInterval"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "doubleValue");
  else
    v10 = 30.0;
  self->_authorizationChangeExitTimeInterval = v10;

}

- (RTAccountManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithAccountStore_lifecycleManager_defaultsManager_);
}

- (RTAccountManager)initWithLifecycleManager:(id)a3 defaultsManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  RTAccountManager *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = -[RTAccountManager initWithAccountStore:lifecycleManager:defaultsManager:](self, "initWithAccountStore:lifecycleManager:defaultsManager:", v8, v7, v6);

  return v9;
}

- (RTAccountManager)initWithAccountStore:(id)a3 lifecycleManager:(id)a4 defaultsManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  RTAccountManager *v12;
  RTAccountManager *v13;
  RTInvocationDispatcher *v14;
  void *v15;
  uint64_t v16;
  RTInvocationDispatcher *dispatcher;
  uint64_t v18;
  RTDarwinNotificationHelper *notificationHelper;
  uint64_t v20;
  AFPreferences *siriPreferences;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_12:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[RTAccountManager initWithAccountStore:lifecycleManager:defaultsManager:]";
      v29 = 1024;
      v30 = 100;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: lifecycleManager (in %s:%d)", buf, 0x12u);
    }

    if (v11)
      goto LABEL_4;
    goto LABEL_15;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[RTAccountManager initWithAccountStore:lifecycleManager:defaultsManager:]";
    v29 = 1024;
    v30 = 99;
    _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: accountStore (in %s:%d)", buf, 0x12u);
  }

  if (!v10)
    goto LABEL_12;
LABEL_3:
  if (v11)
  {
LABEL_4:
    v12 = 0;
    if (v9 && v10)
    {
      v26.receiver = self;
      v26.super_class = (Class)RTAccountManager;
      v13 = -[RTNotifier init](&v26, sel_init);
      if (v13)
      {
        v14 = [RTInvocationDispatcher alloc];
        -[RTNotifier queue](v13, "queue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[RTInvocationDispatcher initWithQueue:](v14, "initWithQueue:", v15);
        dispatcher = v13->_dispatcher;
        v13->_dispatcher = (RTInvocationDispatcher *)v16;

        objc_storeStrong((id *)&v13->_accountStore, a3);
        objc_storeStrong((id *)&v13->_lifecycleManager, a4);
        objc_storeStrong((id *)&v13->_defaultsManager, a5);
        v13->_cloudSyncAuthorizationState = -1;
        v13->_authorizationChangeExitTimeInterval = 30.0;
        v18 = objc_opt_new();
        notificationHelper = v13->_notificationHelper;
        v13->_notificationHelper = (RTDarwinNotificationHelper *)v18;

        objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
        v20 = objc_claimAutoreleasedReturnValue();
        siriPreferences = v13->_siriPreferences;
        v13->_siriPreferences = (AFPreferences *)v20;

        v13->_siriCloudSyncEnabled = -[AFPreferences cloudSyncEnabled](v13->_siriPreferences, "cloudSyncEnabled");
        -[RTAccountManager updateCloudSyncAuthorizationState:](v13, "updateCloudSyncAuthorizationState:", 0);
        -[RTAccountManager setup](v13, "setup");
      }
      self = v13;
      v12 = self;
    }
    goto LABEL_18;
  }
LABEL_15:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[RTAccountManager initWithAccountStore:lifecycleManager:defaultsManager:]";
    v29 = 1024;
    v30 = 101;
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager (in %s:%d)", buf, 0x12u);
  }

  v12 = 0;
LABEL_18:

  return v12;
}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__RTAccountManager_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __25__RTAccountManager_setup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", CFSTR("RTDefaultsAccountManagerAuthorizationChangeExitTimeInterval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "doubleValue");
  else
    v4 = 30.0;
  *(double *)(*(_QWORD *)(a1 + 32) + 104) = v4;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 64);
  +[RTNotification notificationName](RTDefaultsManagerNotificationDefaultsChanged, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:", v5, sel_onDefaultsUpdate_, v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addObserver:center:key:callback:info:suspensionBehavior:", *(_QWORD *)(a1 + 32), CFNotificationCenterGetDarwinNotifyCenter(), *MEMORY[0x1E0CFEB58], onSiriCloudSyncPreferenceChangedNotification, 0, 1);
  v8 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __25__RTAccountManager_setup__block_invoke_2;
  v9[3] = &unk_1E929C098;
  v9[4] = v8;
  objc_msgSend(v8, "_lookupAccount:", v9);

}

void __25__RTAccountManager_setup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityAccount);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "Finished looking up account, %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_setup");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "invocationsPending"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "dispatchPendingInvocations");

}

- (void)dealloc
{
  objc_super v3;

  -[RTDarwinNotificationHelper removeObserver:center:key:info:](self->_notificationHelper, "removeObserver:center:key:info:", self, CFNotificationCenterGetDarwinNotifyCenter(), *MEMORY[0x1E0CFEB58], 0);
  v3.receiver = self;
  v3.super_class = (Class)RTAccountManager;
  -[RTAccountManager dealloc](&v3, sel_dealloc);
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[RTAccountManager dispatcher](self, "dispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shutdown");

  -[RTDarwinNotificationHelper removeObserver:center:key:info:](self->_notificationHelper, "removeObserver:center:key:info:", self, CFNotificationCenterGetDarwinNotifyCenter(), *MEMORY[0x1E0CFEB58], 0);
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    v5 = v6;
  }

}

- (id)_primaryiCloudAccount
{
  void *v2;
  void *v3;

  -[RTAccountManager accountStore](self, "accountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)lookupAccount:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__RTAccountManager_lookupAccount___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __34__RTAccountManager_lookupAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lookupAccount:", *(_QWORD *)(a1 + 40));
}

- (void)_lookupAccount:(id)a3
{
  void (**v4)(id, RTAccount *);
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  RTAccount *v8;
  NSObject *v9;
  RTAccount *account;
  RTAccount *v11;
  RTAccount *v12;
  RTAccount *v13;
  RTAccountManagerNotificationAccountChanged *v14;
  NSObject *v15;
  RTAccount *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, RTAccount *))a3;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAccount);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "starting lookup for icloud account", (uint8_t *)&v17, 2u);
    }

    -[RTAccountManager _primaryiCloudAccount](self, "_primaryiCloudAccount");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      self->_cloudSyncProvisionedForAccount = -[NSObject coreRoutineDataclassEnabled](v6, "coreRoutineDataclassEnabled");
      -[RTAccountManager _updateCloudSyncAuthorizationState:](self, "_updateCloudSyncAuthorizationState:", 0);
      v8 = -[RTAccount initWithACAccount:]([RTAccount alloc], "initWithACAccount:", v7);
      _rt_log_facility_get_os_log(RTLogFacilityAccount);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = (const char *)v8;
        _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "finished lookup for primary icloud account %@", (uint8_t *)&v17, 0xCu);
      }

      account = self->_account;
      v11 = v8;
      v12 = self->_account;
      self->_account = v11;
      v13 = account;

      v4[2](v4, v11);
      v14 = -[RTAccountManagerNotificationAccountChanged initWithLatestAccount:oldAccount:]([RTAccountManagerNotificationAccountChanged alloc], "initWithLatestAccount:oldAccount:", self->_account, v13);

      if (v14)
        -[RTNotifier postNotification:](self, "postNotification:", v14);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityAccount);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "primary icloud account is nil because there isn't one logged in, returning", (uint8_t *)&v17, 2u);
      }

      v11 = -[RTAccountManagerNotificationAccountChanged initWithLatestAccount:oldAccount:]([RTAccountManagerNotificationAccountChanged alloc], "initWithLatestAccount:oldAccount:", 0, self->_account);
      if (v11)
        -[RTNotifier postNotification:](self, "postNotification:", v11);
      v16 = self->_account;
      self->_account = 0;

      v4[2](v4, 0);
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "-[RTAccountManager _lookupAccount:]";
      v19 = 1024;
      v20 = 207;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", (uint8_t *)&v17, 0x12u);
    }
  }

}

- (void)currentAccount:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  SEL v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[RTNotifier queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__RTAccountManager_currentAccount___block_invoke;
    block[3] = &unk_1E9298E88;
    block[4] = self;
    v9 = v5;
    v10 = a2;
    dispatch_async(v6, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[RTAccountManager currentAccount:]";
      v13 = 1024;
      v14 = 249;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

void __35__RTAccountManager_currentAccount___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityAccount);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "returning current account, %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = *(void **)(v2 + 56);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__RTAccountManager_currentAccount___block_invoke_2;
    v7[3] = &unk_1E9297650;
    v7[4] = v2;
    v8 = *(id *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enqueueBlock:description:", v7, CFSTR("%@"), v6);

  }
}

uint64_t __35__RTAccountManager_currentAccount___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "currentAccount:", *(_QWORD *)(a1 + 40));
}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  RTAccountManagerNotificationCloudSyncAuthorizationStateChanged *v11;
  void *v12;
  int v13;
  RTAccountManagerNotificationAccountChanged *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v7) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAccount);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v7;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v17, 0xCu);
    }

  }
  +[RTNotification notificationName](RTAccountManagerNotificationCloudSyncAuthorizationStateChanged, "notificationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if (v10)
  {
    v11 = -[RTAccountManagerNotificationCloudSyncAuthorizationStateChanged initWithCloudSyncAuthorizationState:]([RTAccountManagerNotificationCloudSyncAuthorizationStateChanged alloc], "initWithCloudSyncAuthorizationState:", self->_cloudSyncAuthorizationState);
    if (!v11)
      goto LABEL_13;
    goto LABEL_10;
  }
  +[RTNotification notificationName](RTAccountManagerNotificationAccountChanged, "notificationName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqualToString:", v12);

  if (v13)
  {
    v14 = [RTAccountManagerNotificationAccountChanged alloc];
    -[RTAccountManager account](self, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTAccountManager account](self, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[RTAccountManagerNotificationAccountChanged initWithLatestAccount:oldAccount:](v14, "initWithLatestAccount:oldAccount:", v15, v16);

    if (v11)
LABEL_10:
      -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v11, v6);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = (RTAccountManagerNotificationCloudSyncAuthorizationStateChanged *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super.super, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412802;
      v18 = v7;
      v19 = 2080;
      v20 = "-[RTAccountManager internalAddObserver:name:]";
      v21 = 1024;
      v22 = 293;
      _os_log_error_impl(&dword_1D1A22000, &v11->super.super, OS_LOG_TYPE_ERROR, "unhandled notification name, %@ (in %s:%d)", (uint8_t *)&v17, 0x1Cu);
    }
  }
LABEL_13:

}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "supportsNotificationName:", v4) & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityAccount);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "unsupported notification, %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

+ (BOOL)supportsNotificationName:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;

  v3 = a3;
  +[RTNotification notificationName](RTAccountManagerNotificationAccountChanged, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[RTNotification notificationName](RTAccountManagerNotificationCloudSyncAuthorizationStateChanged, "notificationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToString:", v6);

  }
  return v5;
}

- (void)fetchCloudSyncAuthorizationState:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  SEL v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    -[RTNotifier queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__RTAccountManager_fetchCloudSyncAuthorizationState___block_invoke;
    block[3] = &unk_1E9298E88;
    block[4] = self;
    v9 = v5;
    v10 = a2;
    dispatch_async(v6, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[RTAccountManager fetchCloudSyncAuthorizationState:]";
      v13 = 1024;
      v14 = 322;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
}

void __53__RTAccountManager_fetchCloudSyncAuthorizationState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 32))
  {
    _rt_log_facility_get_os_log(RTLogFacilityAccount);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      *(_DWORD *)buf = 134217984;
      v10 = v4;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "returning cloud sync auth state, %ld", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = *(void **)(v2 + 56);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__RTAccountManager_fetchCloudSyncAuthorizationState___block_invoke_2;
    v7[3] = &unk_1E9297650;
    v7[4] = v2;
    v8 = *(id *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enqueueBlock:description:", v7, CFSTR("%@"), v6);

  }
}

uint64_t __53__RTAccountManager_fetchCloudSyncAuthorizationState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchCloudSyncAuthorizationState:", *(_QWORD *)(a1 + 40));
}

- (void)updateCloudSyncProvisionedForAccount:(BOOL)a3 handler:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;
  BOOL v13;

  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__RTAccountManager_updateCloudSyncProvisionedForAccount_handler___block_invoke;
  v10[3] = &unk_1E929C0C0;
  v13 = a3;
  v10[4] = self;
  v11 = v7;
  v12 = a2;
  v9 = v7;
  dispatch_async(v8, v10);

}

void __65__RTAccountManager_updateCloudSyncProvisionedForAccount_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  char v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 32))
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    if (*(unsigned __int8 *)(v2 + 34) != v3)
    {
      *(_BYTE *)(v2 + 34) = v3;
      objc_msgSend(*(id *)(a1 + 32), "_updateCloudSyncAuthorizationState:", 1);
    }
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
  else
  {
    v5 = *(void **)(v2 + 56);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__RTAccountManager_updateCloudSyncProvisionedForAccount_handler___block_invoke_2;
    v7[3] = &unk_1E9297848;
    v7[4] = v2;
    v9 = *(_BYTE *)(a1 + 56);
    v8 = *(id *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enqueueBlock:description:", v7, CFSTR("%@"), v6);

  }
}

uint64_t __65__RTAccountManager_updateCloudSyncProvisionedForAccount_handler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateCloudSyncProvisionedForAccount:handler:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)updateCloudSyncAuthorizationState:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__RTAccountManager_updateCloudSyncAuthorizationState___block_invoke;
  v6[3] = &unk_1E9297870;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

uint64_t __54__RTAccountManager_updateCloudSyncAuthorizationState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCloudSyncAuthorizationState:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_updateCloudSyncAuthorizationState:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  RTInvocationDispatcher *dispatcher;
  void *v7;
  RTAccountManagerNotificationCloudSyncAuthorizationStateChanged *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  BOOL v12;
  uint8_t buf[4];
  int64_t v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (self->_ready)
  {
    if (self->_siriCloudSyncEnabled)
    {
      if (self->_cloudSyncProvisionedForAccount)
        v5 = 2;
      else
        v5 = 1;
    }
    else
    {
      v5 = 1;
    }
    if (self->_cloudSyncAuthorizationState != v5)
    {
      self->_cloudSyncAuthorizationState = v5;
      v8 = -[RTAccountManagerNotificationCloudSyncAuthorizationStateChanged initWithCloudSyncAuthorizationState:]([RTAccountManagerNotificationCloudSyncAuthorizationStateChanged alloc], "initWithCloudSyncAuthorizationState:", self->_cloudSyncAuthorizationState);
      if (v8)
        -[RTNotifier postNotification:](self, "postNotification:", v8);
      if (v3)
      {
        _rt_log_facility_get_os_log(RTLogFacilityAccount);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "exiting due to cloud auth sync state change", buf, 2u);
        }

        -[RTLifeCycleManager exitWithDelay:](self->_lifecycleManager, "exitWithDelay:", 30.0);
      }
      _rt_log_facility_get_os_log(RTLogFacilityAccount);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v14 = v5;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "update cloud sync auth state to %lu", buf, 0xCu);
      }

    }
  }
  else
  {
    dispatcher = self->_dispatcher;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __55__RTAccountManager__updateCloudSyncAuthorizationState___block_invoke;
    v11[3] = &unk_1E9297870;
    v11[4] = self;
    v12 = a3;
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTInvocationDispatcher enqueueBlock:description:](dispatcher, "enqueueBlock:description:", v11, CFSTR("%@"), v7);

  }
}

uint64_t __55__RTAccountManager__updateCloudSyncAuthorizationState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCloudSyncAuthorizationState:", *(unsigned __int8 *)(a1 + 40));
}

- (int64_t)accountStatus
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__RTAccountManager_accountStatus__block_invoke;
  v8[3] = &unk_1E92977E0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v3, v8);

  _rt_log_facility_get_os_log(RTLogFacilityAccount);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v10[3];
    *(_DWORD *)buf = 134217984;
    v14 = v5;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "returning account status, %ld", buf, 0xCu);
  }

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __33__RTAccountManager_accountStatus__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  uint64_t v4;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[32])
  {
    objc_msgSend(v2, "_primaryiCloudAccount");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 1;
    if (v3)
      v4 = 2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)handleSiriCloudSyncPreferenceChangedNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__RTAccountManager_handleSiriCloudSyncPreferenceChangedNotification__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __68__RTAccountManager_handleSiriCloudSyncPreferenceChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSiriCloudSyncPreferenceChangedNotification");
}

- (void)_handleSiriCloudSyncPreferenceChangedNotification
{
  RTInvocationDispatcher *dispatcher;
  void *v4;
  _QWORD v5[5];

  if (self->_ready)
  {
    self->_siriCloudSyncEnabled = -[AFPreferences cloudSyncEnabled](self->_siriPreferences, "cloudSyncEnabled");
    -[RTAccountManager _updateCloudSyncAuthorizationState:](self, "_updateCloudSyncAuthorizationState:", 1);
  }
  else
  {
    dispatcher = self->_dispatcher;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __69__RTAccountManager__handleSiriCloudSyncPreferenceChangedNotification__block_invoke;
    v5[3] = &unk_1E92977B8;
    v5[4] = self;
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTInvocationDispatcher enqueueBlock:description:](dispatcher, "enqueueBlock:description:", v5, CFSTR("%@"), v4);

  }
}

uint64_t __69__RTAccountManager__handleSiriCloudSyncPreferenceChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSiriCloudSyncPreferenceChangedNotification");
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (RTAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTLifeCycleManager)lifecycleManager
{
  return self->_lifecycleManager;
}

- (void)setLifecycleManager:(id)a3
{
  objc_storeStrong((id *)&self->_lifecycleManager, a3);
}

- (int64_t)cloudSyncAuthorizationState
{
  return self->_cloudSyncAuthorizationState;
}

- (void)setCloudSyncAuthorizationState:(int64_t)a3
{
  self->_cloudSyncAuthorizationState = a3;
}

- (BOOL)siriCloudSyncEnabled
{
  return self->_siriCloudSyncEnabled;
}

- (void)setSiriCloudSyncEnabled:(BOOL)a3
{
  self->_siriCloudSyncEnabled = a3;
}

- (BOOL)cloudSyncProvisionedForAccount
{
  return self->_cloudSyncProvisionedForAccount;
}

- (void)setCloudSyncProvisionedForAccount:(BOOL)a3
{
  self->_cloudSyncProvisionedForAccount = a3;
}

- (RTDarwinNotificationHelper)notificationHelper
{
  return self->_notificationHelper;
}

- (void)setNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_notificationHelper, a3);
}

- (AFPreferences)siriPreferences
{
  return self->_siriPreferences;
}

- (void)setSiriPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_siriPreferences, a3);
}

- (double)authorizationChangeExitTimeInterval
{
  return self->_authorizationChangeExitTimeInterval;
}

- (void)setAuthorizationChangeExitTimeInterval:(double)a3
{
  self->_authorizationChangeExitTimeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriPreferences, 0);
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_lifecycleManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
