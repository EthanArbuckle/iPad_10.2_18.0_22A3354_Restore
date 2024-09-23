@implementation STManagementStateObserver

- (id)_initWithDSID:(id)a3
{
  id v4;
  STManagementStateObserver *v5;
  uint64_t v6;
  NSNumber *dsid;
  uint64_t v8;
  STManagementState *managementState;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *screenTimeSettingsChangeQueue;
  NSObject *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STManagementStateObserver;
  v5 = -[STManagementStateObserver init](&v19, sel_init);
  v6 = objc_msgSend(v4, "copy");
  dsid = v5->_dsid;
  v5->_dsid = (NSNumber *)v6;

  v8 = objc_opt_new();
  managementState = v5->_managementState;
  v5->_managementState = (STManagementState *)v8;

  v5->_contactManagementState = 0;
  objc_initWeak(&location, v5);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_DEFAULT, 0);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.ScreenTimeAgent.contact-management-state-observer-screentime-settings"), "UTF8String"), v11);
  screenTimeSettingsChangeQueue = v5->_screenTimeSettingsChangeQueue;
  v5->_screenTimeSettingsChangeQueue = (OS_dispatch_queue *)v12;

  v14 = v5->_screenTimeSettingsChangeQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __43__STManagementStateObserver__initWithDSID___block_invoke;
  v16[3] = &unk_1E9371288;
  objc_copyWeak(&v17, &location);
  notify_register_dispatch("com.apple.ScreenTimeAgent.SettingsDidChangeNotification", &v5->_screenTimeSettingsChangeNotifyToken, v14, v16);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
  return v5;
}

void __43__STManagementStateObserver__initWithDSID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_screenTimeSettingsDidChange");

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_screenTimeSettingsChangeNotifyToken);
  v3.receiver = self;
  v3.super_class = (Class)STManagementStateObserver;
  -[STManagementStateObserver dealloc](&v3, sel_dealloc);
}

+ (void)createObserverWithDSID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDSID:", v7);
  objc_msgSend(v8, "managementState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__STManagementStateObserver_createObserverWithDSID_completionHandler___block_invoke;
  v12[3] = &unk_1E93718C0;
  v13 = v8;
  v14 = v6;
  v10 = v8;
  v11 = v6;
  objc_msgSend(v9, "contactManagementStateForDSID:completionHandler:", v7, v12);

}

void __70__STManagementStateObserver_createObserverWithDSID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(void);

  v5 = a3;
  if (v5)
  {
    +[STLog managementStateObserver](STLog, "managementStateObserver");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __70__STManagementStateObserver_createObserverWithDSID_completionHandler___block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setContactManagementState:", a2);
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v13();

}

- (void)_screenTimeSettingsDidChange
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[STManagementStateObserver managementState](self, "managementState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STManagementStateObserver dsid](self, "dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__STManagementStateObserver__screenTimeSettingsDidChange__block_invoke;
  v5[3] = &unk_1E93718E8;
  v5[4] = self;
  objc_msgSend(v3, "contactManagementStateForDSID:completionHandler:", v4, v5);

}

void __57__STManagementStateObserver__screenTimeSettingsDidChange__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    +[STLog managementStateObserver](STLog, "managementStateObserver");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __57__STManagementStateObserver__screenTimeSettingsDidChange__block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  else if (objc_msgSend(*(id *)(a1 + 32), "contactManagementState") != a2)
  {
    +[STLog managementStateObserver](STLog, "managementStateObserver");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(*(id *)(a1 + 32), "contactManagementState");
      v15 = 134218240;
      v16 = v14;
      v17 = 2048;
      v18 = a2;
      _os_log_impl(&dword_1D22E7000, v13, OS_LOG_TYPE_DEFAULT, "Contact management state changed from %lld to %lld", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setContactManagementState:", a2);
  }

}

- (int64_t)contactManagementState
{
  return self->_contactManagementState;
}

- (void)setContactManagementState:(int64_t)a3
{
  self->_contactManagementState = a3;
}

- (NSNumber)dsid
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (STManagementState)managementState
{
  return (STManagementState *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManagementState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (STManagementStateObserver)me
{
  return (STManagementStateObserver *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMe:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)screenTimeSettingsChangeQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (int)screenTimeSettingsChangeNotifyToken
{
  return self->_screenTimeSettingsChangeNotifyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTimeSettingsChangeQueue, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_managementState, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
}

void __70__STManagementStateObserver_createObserverWithDSID_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Failed to fetch initial contact management state: %{public}@", a5, a6, a7, a8, 2u);
}

void __57__STManagementStateObserver__screenTimeSettingsDidChange__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Failed to fetch contact management state: %{public}@", a5, a6, a7, a8, 2u);
}

@end
