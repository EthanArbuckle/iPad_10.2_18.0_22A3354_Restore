@implementation PAHMSManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_5);
  return (id)sharedInstance_Manager;
}

void __30__PAHMSManager_sharedInstance__block_invoke()
{
  PAHMSManager *v0;
  void *v1;

  v0 = objc_alloc_init(PAHMSManager);
  v1 = (void *)sharedInstance_Manager;
  sharedInstance_Manager = (uint64_t)v0;

}

- (PAHMSManager)init
{
  PAHMSManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *hmsQueue;
  void *v6;
  id v7;
  id v8;
  objc_super v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v10.receiver = self;
  v10.super_class = (Class)PAHMSManager;
  v2 = -[PAHMSManager init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("hearing_mode_service_queue", v3);
    hmsQueue = v2->_hmsQueue;
    v2->_hmsQueue = (OS_dispatch_queue *)v4;

    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v6 = (void *)getHUAccessoryManagerClass_softClass_0;
    v15 = getHUAccessoryManagerClass_softClass_0;
    if (!getHUAccessoryManagerClass_softClass_0)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getHUAccessoryManagerClass_block_invoke_0;
      v11[3] = &unk_1EA9022F8;
      v11[4] = &v12;
      __getHUAccessoryManagerClass_block_invoke_0((uint64_t)v11);
      v6 = (void *)v13[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v12, 8);
    v8 = (id)objc_msgSend(v7, "sharedInstance");
    -[PAHMSManager setupHearingModeService](v2, "setupHearingModeService");
  }
  return v2;
}

- (void)setupHearingModeService
{
  HMServiceClient *v3;
  HMServiceClient *hmsClient;
  HMServiceClient *v5;
  uint64_t v6;
  HMServiceClient *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = (HMServiceClient *)objc_alloc_init(getHMServiceClientClass());
  hmsClient = self->_hmsClient;
  self->_hmsClient = v3;

  -[HMServiceClient setDispatchQueue:](self->_hmsClient, "setDispatchQueue:", self->_hmsQueue);
  objc_initWeak(&location, self);
  v5 = self->_hmsClient;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__PAHMSManager_setupHearingModeService__block_invoke;
  v10[3] = &unk_1EA902190;
  objc_copyWeak(&v11, &location);
  -[HMServiceClient setInterruptionHandler:](v5, "setInterruptionHandler:", v10);
  v7 = self->_hmsClient;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __39__PAHMSManager_setupHearingModeService__block_invoke_2;
  v8[3] = &unk_1EA902190;
  objc_copyWeak(&v9, &location);
  -[HMServiceClient setInvalidationHandler:](v7, "setInvalidationHandler:", v8);
  -[HMServiceClient setDeviceRecordChangedHandler:](self->_hmsClient, "setDeviceRecordChangedHandler:", &__block_literal_global_3);
  -[HMServiceClient activateWithCompletion:](self->_hmsClient, "activateWithCompletion:", &__block_literal_global_12);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __39__PAHMSManager_setupHearingModeService__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setupHearingModeService");

}

void __39__PAHMSManager_setupHearingModeService__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setupHearingModeService");

}

void __39__PAHMSManager_setupHearingModeService__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "bluetoothAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PAInitializeLogging();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Device Updated %@ = %@, %@"), v3, v5, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAHMSManager setupHearingModeService]_block_invoke_3", 93, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v7);
    v10 = v8;
    *(_DWORD *)buf = 136446210;
    v32 = objc_msgSend(v9, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personalMediaEnabledByRouteUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "objectForKey:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v13, "removeObjectForKey:", v3);
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPersonalMediaEnabledByRouteUID:", v13);

  }
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accommodationTypesByRouteUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v18, "objectForKey:", v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v18, "removeObjectForKey:", v3);
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAccommodationTypesByRouteUID:", v18);

  }
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "personalMediaConfiguration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "personalMediaConfigurationForRouteUID:", v3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPersonalMediaConfiguration:", v25);

  }
  +[PASettings sharedInstance](PASettings, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "personalMediaConfigurationByRouteUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "mutableCopy");

  objc_msgSend(v28, "objectForKey:", v3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v28, "removeObjectForKey:", v3);
    +[PASettings sharedInstance](PASettings, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setPersonalMediaConfigurationByRouteUID:", v28);

  }
}

void __39__PAHMSManager_setupHearingModeService__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Activating client %@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[PAHMSManager setupHearingModeService]_block_invoke", 135, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
}

- (void)sendConfigUpdate:(id)a3 forIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PAHMSManager hmsClient](self, "hmsClient");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "modifyDeviceConfig:identifier:completion:", v10, v9, v8);

}

- (HMServiceClient)hmsClient
{
  return self->_hmsClient;
}

- (void)setHmsClient:(id)a3
{
  objc_storeStrong((id *)&self->_hmsClient, a3);
}

- (OS_dispatch_queue)hmsQueue
{
  return self->_hmsQueue;
}

- (void)setHmsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_hmsQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hmsQueue, 0);
  objc_storeStrong((id *)&self->_hmsClient, 0);
}

@end
