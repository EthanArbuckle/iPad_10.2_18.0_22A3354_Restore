@implementation HDSPCloudDefaults

- (HDSPCloudDefaults)initWithEnvironment:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  HDSPCloudDefaults *v9;
  HDSPCloudDefaults *v10;
  uint64_t v11;
  NSUbiquitousKeyValueStore *store;
  id v13;
  uint64_t v14;
  HKSPAccumulator *accumulator;
  HDSPCloudDefaults *v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HDSPCloudDefaults;
  v9 = -[HDSPCloudDefaults init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_environment, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    -[HDSPCloudDefaults _createKVS](v10, "_createKVS");
    v11 = objc_claimAutoreleasedReturnValue();
    store = v10->_store;
    v10->_store = (NSUbiquitousKeyValueStore *)v11;

    objc_initWeak(&location, v10);
    v13 = objc_alloc(MEMORY[0x24BEA9838]);
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __55__HDSPCloudDefaults_initWithEnvironment_configuration___block_invoke;
    v18[3] = &unk_24D4E4EE0;
    objc_copyWeak(&v19, &location);
    v14 = objc_msgSend(v13, "initWithInterval:updateBlock:", v18, 0.5);
    accumulator = v10->_accumulator;
    v10->_accumulator = (HKSPAccumulator *)v14;

    v16 = v10;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __55__HDSPCloudDefaults_initWithEnvironment_configuration___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  objc_msgSend(WeakRetained, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 & 1) != 0)
    objc_msgSend(v6, "syncedUserDefaults:didChangeExternallyForKeys:", WeakRetained, v8);
  else
    objc_msgSend(v6, "syncedUserDefaultsDidChangeExternally:", WeakRetained);

}

- (id)_createKVS
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDD1888]);
  -[HDSPEnvironment behavior](self->_environment, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "features");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "_initWithStoreIdentifier:usingEndToEndEncryption:", CFSTR("com.apple.sleepd"), objc_msgSend(v5, "sleepCloudKitManatee"));

  if (!v6)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v10 = 138543362;
      *(_QWORD *)&v10[4] = objc_opt_class();
      v9 = *(id *)&v10[4];
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create NSUbiquitousKeyValueStore", v10, 0xCu);

    }
  }
  objc_msgSend(v6, "synchronize", *(_OWORD *)v10);
  return v6;
}

- (void)keyValueStoreDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543618;
    v17 = (id)objc_opt_class();
    v18 = 2114;
    v19 = v4;
    v6 = v17;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] keyValueStoreDidChange: %{public}@", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDD1368]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD1370]);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = (void *)MEMORY[0x24BDBD1A8];
  if (v11)
    v13 = (void *)v11;
  v14 = v13;

  if ((unint64_t)(v9 - 1) >= 3)
  {
    if (!v9)
      -[HKSPAccumulator accumulateValues:](self->_accumulator, "accumulateValues:", v14);
  }
  else
  {
    -[HDSPCloudDefaults delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "syncedUserDefaultsDidChangeExternally:", self);

  }
}

- (void)hdsp_forceSynchronizeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSUbiquitousKeyValueStore *store;
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
  store = self->_store;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__HDSPCloudDefaults_hdsp_forceSynchronizeWithCompletion___block_invoke;
  v9[3] = &unk_24D4E5580;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[NSUbiquitousKeyValueStore synchronizeWithCompletionHandler:](store, "synchronizeWithCompletionHandler:", v9);

}

void __57__HDSPCloudDefaults_hdsp_forceSynchronizeWithCompletion___block_invoke(uint64_t a1, void *a2)
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
  void *v8;
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
  -[HDSPCloudDefaults setDelegate:](self, "setDelegate:", v4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_keyValueStoreDidChange_, *MEMORY[0x24BDD1378], self->_store);

  -[HDSPEnvironment notificationListener](self->_environment, "notificationListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:", self);

}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.kvs.store-did-change.com.apple.sleepd")))
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v10 = 138543618;
      *(_QWORD *)&v10[4] = objc_opt_class();
      *(_WORD *)&v10[12] = 2114;
      *(_QWORD *)&v10[14] = v5;
      v7 = *(id *)&v10[4];
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@, synchronizing...", v10, 0x16u);

    }
    -[HDSPCloudDefaults hksp_synchronize](self, "hksp_synchronize");
  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult", *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hksp_objectForKey:(id)a3
{
  return -[NSUbiquitousKeyValueStore objectForKey:](self->_store, "objectForKey:", a3);
}

- (void)hksp_setObject:(id)a3 forKey:(id)a4
{
  -[NSUbiquitousKeyValueStore setObject:forKey:](self->_store, "setObject:forKey:", a3, a4);
}

- (void)hksp_removeObjectForKey:(id)a3
{
  -[NSUbiquitousKeyValueStore removeObjectForKey:](self->_store, "removeObjectForKey:", a3);
}

- (BOOL)hksp_BOOLForKey:(id)a3
{
  return -[NSUbiquitousKeyValueStore BOOLForKey:](self->_store, "BOOLForKey:", a3);
}

- (void)hksp_setBool:(BOOL)a3 forKey:(id)a4
{
  -[NSUbiquitousKeyValueStore setBool:forKey:](self->_store, "setBool:forKey:", a3, a4);
}

- (float)hksp_floatForKey:(id)a3
{
  void *v3;
  float v4;
  float v5;

  -[NSUbiquitousKeyValueStore objectForKey:](self->_store, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)hksp_setFloat:(float)a3 forKey:(id)a4
{
  NSUbiquitousKeyValueStore *store;
  void *v6;
  id v7;
  double v8;
  id v9;

  store = self->_store;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  *(float *)&v8 = a3;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUbiquitousKeyValueStore setObject:forKey:](store, "setObject:forKey:", v9, v7);

}

- (int64_t)hksp_integerForKey:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSUbiquitousKeyValueStore objectForKey:](self->_store, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)hksp_setInteger:(int64_t)a3 forKey:(id)a4
{
  NSUbiquitousKeyValueStore *store;
  void *v6;
  id v7;
  id v8;

  store = self->_store;
  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUbiquitousKeyValueStore setObject:forKey:](store, "setObject:forKey:", v8, v7);

}

- (id)hksp_dataForKey:(id)a3
{
  return -[NSUbiquitousKeyValueStore dataForKey:](self->_store, "dataForKey:", a3);
}

- (id)hksp_dictionaryRepresentation
{
  return -[NSUbiquitousKeyValueStore dictionaryRepresentation](self->_store, "dictionaryRepresentation");
}

- (id)hksp_dictionaryRepresentationForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HDSPCloudDefaults hksp_dictionaryRepresentation](self, "hksp_dictionaryRepresentation");
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
  v3[2] = __41__HDSPCloudDefaults_hksp_saveDictionary___block_invoke;
  v3[3] = &unk_24D4E55A8;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

uint64_t __41__HDSPCloudDefaults_hksp_saveDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "hksp_setObject:forKey:", a3, a2);
}

- (void)hksp_removeObjectsForKeys:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__HDSPCloudDefaults_hksp_removeObjectsForKeys___block_invoke;
  v3[3] = &unk_24D4E55D0;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

uint64_t __47__HDSPCloudDefaults_hksp_removeObjectsForKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hksp_removeObjectForKey:", a2);
}

- (void)hksp_synchronize
{
  -[NSUbiquitousKeyValueStore synchronize](self->_store, "synchronize");
}

- (void)hksp_synchronizeKeys:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v4;
    v6 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_INFO, "[%{public}@] syncing keys: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  -[HDSPCloudDefaults hksp_synchronize](self, "hksp_synchronize");

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
  objc_storeStrong((id *)&self->_accumulator, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
