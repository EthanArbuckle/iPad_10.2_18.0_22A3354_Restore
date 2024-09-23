@implementation HDSPNanoDefaults

- (HDSPNanoDefaults)initWithEnvironment:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  HDSPNanoDefaults *v8;
  HDSPNanoDefaults *v9;
  NPSManager *v10;
  NPSManager *npsManager;
  dispatch_queue_t v12;
  OS_dispatch_queue *npsDomainAccessorQueue;
  id v14;
  uint64_t v15;
  HKSPAccumulator *notifyAccumulator;
  HDSPNanoDefaults *v17;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HDSPNanoDefaults;
  v8 = -[HDSPNanoDefaults init](&v22, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_configuration, a4);
    v10 = (NPSManager *)objc_alloc_init(MEMORY[0x24BE6B2C8]);
    npsManager = v9->_npsManager;
    v9->_npsManager = v10;

    v12 = dispatch_queue_create("com.apple.sleep.NPSDomainAccessor.serial", 0);
    npsDomainAccessorQueue = v9->_npsDomainAccessorQueue;
    v9->_npsDomainAccessorQueue = (OS_dispatch_queue *)v12;

    objc_initWeak(&location, v9);
    v14 = objc_alloc(MEMORY[0x24BEA9838]);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __54__HDSPNanoDefaults_initWithEnvironment_configuration___block_invoke;
    v19[3] = &unk_24D4E4EE0;
    objc_copyWeak(&v20, &location);
    v15 = objc_msgSend(v14, "initWithInterval:updateBlock:", v19, 0.5);
    notifyAccumulator = v9->_notifyAccumulator;
    v9->_notifyAccumulator = (HKSPAccumulator *)v15;

    v17 = v9;
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __54__HDSPNanoDefaults_initWithEnvironment_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = (id)objc_opt_class();
    v13 = 2114;
    v14 = v3;
    v6 = v12;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying for external change for keys: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(WeakRetained, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  objc_msgSend(WeakRetained, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
    objc_msgSend(v9, "syncedUserDefaults:didChangeExternallyForKeys:", WeakRetained, v3);
  else
    objc_msgSend(v9, "syncedUserDefaultsDidChangeExternally:", WeakRetained);

}

- (id)_keysForChangeNotification:(id)a3
{
  id v4;
  HDSPSyncedDefaultsConfiguration *configuration;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.sleep.sync.SleepScheduleDidChange")))
  {
    configuration = self->_configuration;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.sleep.sync.SleepSettingsDidChange")))
  {
    configuration = self->_configuration;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.sleep.sync.SleepRecordDidChange")))
    {
      v9 = objc_alloc_init(MEMORY[0x24BDBCF20]);
      goto LABEL_8;
    }
    configuration = self->_configuration;
  }
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSyncedDefaultsConfiguration keySetForIdentifier:](configuration, "keySetForIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keysToSync");
  v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v9;
}

- (NPSDomainAccessor)npsDomainAccessor
{
  NSObject *npsDomainAccessorQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  npsDomainAccessorQueue = self->_npsDomainAccessorQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__HDSPNanoDefaults_npsDomainAccessor__block_invoke;
  v5[3] = &unk_24D4E34C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(npsDomainAccessorQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NPSDomainAccessor *)v3;
}

void __37__HDSPNanoDefaults_npsDomainAccessor__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = (id)objc_opt_class();
      v4 = v13;
      _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] initializing NPSDomainAccessor", (uint8_t *)&v12, 0xCu);

    }
    v5 = objc_alloc(MEMORY[0x24BE6B2C0]);
    v6 = objc_msgSend(v5, "initWithDomain:", *MEMORY[0x24BEA9390]);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = v6;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      v12 = 138543362;
      v13 = v10;
      v11 = v10;
      _os_log_error_impl(&dword_21610C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create NPSDomainAccessor", (uint8_t *)&v12, 0xCu);

    }
  }
}

- (void)_resetNPSDomainAccessor
{
  NSObject *npsDomainAccessorQueue;
  _QWORD block[5];

  npsDomainAccessorQueue = self->_npsDomainAccessorQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HDSPNanoDefaults__resetNPSDomainAccessor__block_invoke;
  block[3] = &unk_24D4E3498;
  block[4] = self;
  dispatch_sync(npsDomainAccessorQueue, block);
}

void __43__HDSPNanoDefaults__resetNPSDomainAccessor__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v3 = v7;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] re-creating NPSDomainAccessor", (uint8_t *)&v6, 0xCu);

  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.sleep.sync.SleepScheduleDidChange")) & 1) != 0
    || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.sleep.sync.SleepSettingsDidChange")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.sleep.sync.SleepRecordDidChange")))
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v11 = 138543618;
      *(_QWORD *)&v11[4] = objc_opt_class();
      *(_WORD *)&v11[12] = 2114;
      *(_QWORD *)&v11[14] = v5;
      v7 = *(id *)&v11[4];
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", v11, 0x16u);

    }
    -[HDSPNanoDefaults _keysForChangeNotification:](self, "_keysForChangeNotification:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPNanoDefaults _handleNanoPreferencesSync:](self, "_handleNanoPreferencesSync:", v8);

  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_handleActivePairedDeviceDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = (id)objc_opt_class();
    v10 = 2114;
    v11 = v4;
    v6 = v9;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _handleActivePairedDeviceDidChange: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  -[HDSPNanoDefaults _resetNPSDomainAccessor](self, "_resetNPSDomainAccessor");
  -[HDSPNanoDefaults delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncedUserDefaultsDidChangeExternally:", self);

}

- (void)_handleNanoPreferencesSync:(id)a3
{
  id v4;
  void *v5;
  id v6;
  HKSPAccumulator *notifyAccumulator;
  id v8;

  v4 = a3;
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "synchronize");

  notifyAccumulator = self->_notifyAccumulator;
  objc_msgSend(v4, "allObjects");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[HKSPAccumulator accumulateValues:](notifyAccumulator, "accumulateValues:", v8);
}

- (void)hdsp_forceSynchronizeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing full sync", buf, 0xCu);

  }
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__HDSPNanoDefaults_hdsp_forceSynchronizeWithCompletion___block_invoke;
  v9[3] = &unk_24D4E5580;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "synchronizeWithCompletionHandler:", v9);

}

void __56__HDSPNanoDefaults_hdsp_forceSynchronizeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543618;
      v9 = (id)objc_opt_class();
      v10 = 2114;
      v11 = v3;
      v6 = v9;
      _os_log_error_impl(&dword_21610C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] full sync failed with error: %{public}@", (uint8_t *)&v8, 0x16u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v6 = v9;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully completed full sync", (uint8_t *)&v8, 0xCu);
    goto LABEL_6;
  }

  (*(void (**)(_QWORD, BOOL, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3 == 0, v3, v7);
}

- (void)hdsp_setExternalChangeDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 2114;
    v12 = v4;
    v6 = v10;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] hdsp_setExternalChangeDelegate %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[HDSPNanoDefaults setDelegate:](self, "setDelegate:", v4);
  -[HDSPNanoDefaults _registerForNotifications](self, "_registerForNotifications");
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "synchronize");

}

- (void)_registerForNotifications
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "notificationListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:", self);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__handleActivePairedDeviceDidChange_, *MEMORY[0x24BE6B420], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleActivePairedDeviceDidChange_, *MEMORY[0x24BE6B440], 0);

}

- (id)hksp_objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)hksp_setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

- (void)hksp_removeObjectForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (BOOL)hksp_BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", v4);

  return v6;
}

- (void)hksp_setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forKey:", v4, v6);

}

- (float)hksp_floatForKey:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;

  v4 = a3;
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatForKey:", v4);
  v7 = v6;

  return v7;
}

- (void)hksp_setFloat:(float)a3 forKey:(id)a4
{
  id v6;
  double v7;
  id v8;

  v6 = a4;
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v8, "setFloat:forKey:", v6, v7);

}

- (int64_t)hksp_integerForKey:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerForKey:", v4);

  return v6;
}

- (void)hksp_setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteger:forKey:", a3, v6);

}

- (id)hksp_dataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hksp_dictionaryRepresentation
{
  void *v2;
  void *v3;

  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hksp_dictionaryRepresentationForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HDSPNanoDefaults hksp_dictionaryRepresentation](self, "hksp_dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hksp_dictionaryByFilteringKeys:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)hksp_saveDictionary:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__HDSPNanoDefaults_hksp_saveDictionary___block_invoke;
  v3[3] = &unk_24D4E55A8;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

uint64_t __40__HDSPNanoDefaults_hksp_saveDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "hksp_setObject:forKey:", a3, a2);
}

- (void)hksp_removeObjectsForKeys:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__HDSPNanoDefaults_hksp_removeObjectsForKeys___block_invoke;
  v3[3] = &unk_24D4E55D0;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

uint64_t __46__HDSPNanoDefaults_hksp_removeObjectsForKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hksp_removeObjectForKey:", a2);
}

- (void)hksp_synchronize
{
  id v3;

  -[HDSPSyncedDefaultsConfiguration allKeysToSync](self->_configuration, "allKeysToSync");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HDSPNanoDefaults hksp_synchronizeKeys:](self, "hksp_synchronizeKeys:", v3);

}

- (void)hksp_synchronizeKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPNanoDefaults npsDomainAccessor](self, "npsDomainAccessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v22 = 138543618;
      *(_QWORD *)&v22[4] = objc_opt_class();
      *(_WORD *)&v22[12] = 2114;
      *(_QWORD *)&v22[14] = v6;
      v8 = *(id *)&v22[4];
      v9 = "[%{public}@] synchronize failed with error %{public}@";
      v10 = v7;
      v11 = 22;
LABEL_4:
      _os_log_error_impl(&dword_21610C000, v10, OS_LOG_TYPE_ERROR, v9, v22, v11);

    }
  }
  else
  {
    if (!self->_npsManager)
    {
      HKSPLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      *(_DWORD *)v22 = 138543362;
      *(_QWORD *)&v22[4] = objc_opt_class();
      v8 = *(id *)&v22[4];
      v9 = "[%{public}@] npsManager is nil when syncing";
      v10 = v7;
      v11 = 12;
      goto LABEL_4;
    }
    -[HDSPSyncedDefaultsConfiguration allPerGizmoKeys](self->_configuration, "allPerGizmoKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v12);
    v7 = objc_claimAutoreleasedReturnValue();

    v13 = -[NSObject count](v7, "count");
    v14 = (_QWORD *)MEMORY[0x24BEA9390];
    if (v13)
    {
      HKSPLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = objc_opt_class();
        *(_WORD *)&v22[12] = 2114;
        *(_QWORD *)&v22[14] = v7;
        v16 = *(id *)&v22[4];
        _os_log_impl(&dword_21610C000, v15, OS_LOG_TYPE_INFO, "[%{public}@] syncing keys: %{public}@", v22, 0x16u);

      }
      -[NPSManager synchronizeUserDefaultsDomain:keys:](self->_npsManager, "synchronizeUserDefaultsDomain:keys:", *v14, v7);
    }
    -[HDSPSyncedDefaultsConfiguration allPerGizmoKeys](self->_configuration, "allPerGizmoKeys", *(_OWORD *)v22, *(_QWORD *)&v22[16], v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_setByIntersectingWithSet:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "count"))
    {
      HKSPLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_opt_class();
        *(_DWORD *)v22 = 138543618;
        *(_QWORD *)&v22[4] = v20;
        *(_WORD *)&v22[12] = 2114;
        *(_QWORD *)&v22[14] = v18;
        v21 = v20;
        _os_log_impl(&dword_21610C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing per-gizmo keys: %{public}@", v22, 0x16u);

      }
      -[NPSManager synchronizeNanoDomain:keys:](self->_npsManager, "synchronizeNanoDomain:keys:", *v14, v18);
    }

  }
LABEL_16:

}

- (HDSPSyncedUserDefaultsExternalChangeDelegate)delegate
{
  return (HDSPSyncedUserDefaultsExternalChangeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_npsDomainAccessor, 0);
  objc_storeStrong((id *)&self->_notifyAccumulator, 0);
  objc_storeStrong((id *)&self->_npsDomainAccessorQueue, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
