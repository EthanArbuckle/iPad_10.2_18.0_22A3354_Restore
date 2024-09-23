@implementation HDSPSyncedDefaults

- (id)_nanoDefaultsProvider
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__HDSPSyncedDefaults__nanoDefaultsProvider__block_invoke;
  v3[3] = &unk_24D4E4EB8;
  v3[4] = self;
  return (id)MEMORY[0x2199F586C](v3, a2);
}

HDSPNanoDefaults *__43__HDSPSyncedDefaults__nanoDefaultsProvider__block_invoke(uint64_t a1)
{
  HDSPNanoDefaults *v2;
  id WeakRetained;
  HDSPNanoDefaults *v4;

  v2 = [HDSPNanoDefaults alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v4 = -[HDSPNanoDefaults initWithEnvironment:configuration:](v2, "initWithEnvironment:configuration:", WeakRetained, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  return v4;
}

- (id)_cloudDefaultsProvider
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__HDSPSyncedDefaults__cloudDefaultsProvider__block_invoke;
  v3[3] = &unk_24D4E4EB8;
  v3[4] = self;
  return (id)MEMORY[0x2199F586C](v3, a2);
}

HDSPCloudDefaults *__44__HDSPSyncedDefaults__cloudDefaultsProvider__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  HDSPCloudDefaults *v6;
  id v7;
  HDSPCloudDefaults *v8;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "features");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sleepCloudKitSync");

  if (v5)
  {
    v6 = [HDSPCloudDefaults alloc];
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v8 = -[HDSPCloudDefaults initWithEnvironment:configuration:](v6, "initWithEnvironment:configuration:", v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    return v8;
  }
  else
  {
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = (id)objc_opt_class();
      v11 = v13;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] cloud sync is disabled", (uint8_t *)&v12, 0xCu);

    }
    return (HDSPCloudDefaults *)0;
  }
}

- (HDSPSyncedDefaults)initWithEnvironment:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HDSPSyncedDefaults *v10;

  v6 = a4;
  v7 = a3;
  -[HDSPSyncedDefaults _nanoDefaultsProvider](self, "_nanoDefaultsProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSyncedDefaults _cloudDefaultsProvider](self, "_cloudDefaultsProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HDSPSyncedDefaults initWithEnvironment:configuration:nanoDefaultsProvider:cloudDefaultsProvider:throttleInterval:](self, "initWithEnvironment:configuration:nanoDefaultsProvider:cloudDefaultsProvider:throttleInterval:", v7, v6, v8, v9, 0.25);

  return v10;
}

- (HDSPSyncedDefaults)initWithEnvironment:(id)a3 configuration:(id)a4 nanoDefaultsProvider:(id)a5 cloudDefaultsProvider:(id)a6 throttleInterval:(double)a7
{
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void (**v15)(_QWORD);
  HDSPSyncedDefaults *v16;
  HDSPSyncedDefaults *v17;
  uint64_t v18;
  HKSPUserDefaults *localDefaults;
  uint64_t v20;
  HDSPSyncedUserDefaults *nanoDefaults;
  uint64_t v22;
  HDSPSyncedUserDefaults *cloudDefaults;
  NSMutableSet *v24;
  NSMutableSet *keysNeedingSynchronize;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  HKSPAccumulator *syncAccumulator;
  HDSPSyncedDefaults *v31;
  uint64_t v33;
  id v34;
  id location;
  objc_super v36;

  v12 = a3;
  v13 = a4;
  v14 = (void (**)(_QWORD))a5;
  v15 = (void (**)(_QWORD))a6;
  v36.receiver = self;
  v36.super_class = (Class)HDSPSyncedDefaults;
  v16 = -[HDSPSyncedDefaults init](&v36, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_environment, v12);
    objc_storeStrong((id *)&v17->_configuration, a4);
    objc_msgSend(v12, "userDefaults");
    v18 = objc_claimAutoreleasedReturnValue();
    localDefaults = v17->_localDefaults;
    v17->_localDefaults = (HKSPUserDefaults *)v18;

    v14[2](v14);
    v20 = objc_claimAutoreleasedReturnValue();
    nanoDefaults = v17->_nanoDefaults;
    v17->_nanoDefaults = (HDSPSyncedUserDefaults *)v20;

    v15[2](v15);
    v22 = objc_claimAutoreleasedReturnValue();
    cloudDefaults = v17->_cloudDefaults;
    v17->_cloudDefaults = (HDSPSyncedUserDefaults *)v22;

    v24 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    keysNeedingSynchronize = v17->_keysNeedingSynchronize;
    v17->_keysNeedingSynchronize = v24;

    objc_initWeak(&location, v17);
    v26 = objc_alloc(MEMORY[0x24BEA9838]);
    v33 = MEMORY[0x24BDAC760];
    objc_copyWeak(&v34, &location);
    objc_msgSend(v12, "defaultCallbackScheduler", v33, 3221225472, __116__HDSPSyncedDefaults_initWithEnvironment_configuration_nanoDefaultsProvider_cloudDefaultsProvider_throttleInterval___block_invoke, &unk_24D4E4EE0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mutexGenerator");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v26, "initWithInterval:updateBlock:scheduler:mutexGenerator:", &v33, v27, v28, a7);
    syncAccumulator = v17->_syncAccumulator;
    v17->_syncAccumulator = (HKSPAccumulator *)v29;

    v17->_lock._os_unfair_lock_opaque = 0;
    v31 = v17;
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __116__HDSPSyncedDefaults_initWithEnvironment_configuration_nanoDefaultsProvider_cloudDefaultsProvider_throttleInterval___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_throttled_synchronizeKeys:", v3);

}

- (void)_withLock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**v4)(_QWORD);

  p_lock = &self->_lock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)syncDisabled
{
  HDSPSyncedDefaults *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudSyncEnabledKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = !-[HDSPSyncedDefaults hksp_BOOLForKey:](v2, "hksp_BOOLForKey:", v4);

  return (char)v2;
}

- (id)hksp_dictionaryRepresentation
{
  void *v3;
  void *v4;

  -[HDSPSyncedDefaultsConfiguration allKeysToPersist](self->_configuration, "allKeysToPersist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSyncedDefaults hksp_dictionaryRepresentationForKeys:](self, "hksp_dictionaryRepresentationForKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)hksp_dictionaryRepresentationForKeys:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  id obj;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[HDSPSyncedDefaultsConfiguration allDefaultValues](self->_configuration, "allDefaultValues");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSyncedDefaultsConfiguration allPerGizmoKeys](self->_configuration, "allPerGizmoKeys");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v4;
  objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  v42 = v6;
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v51 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        -[HKSPUserDefaults hksp_objectForKey:](self->_localDefaults, "hksp_objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);
        }
        else
        {
          objc_msgSend(v44, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            HKSPLogForCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v15 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v56 = v15;
              v57 = 2114;
              v58 = v13;
              v59 = 2114;
              v60 = v11;
              v16 = v15;
              _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading default value %{public}@ for key: %{public}@", buf, 0x20u);

              v6 = v42;
            }

            objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
    }
    while (v8);
  }
  objc_msgSend(v41, "na_setByIntersectingWithSet:", v40);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v17)
  {
    v18 = v17;
    v45 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v47 != v45)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
        HKSPLogForCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v56 = v22;
          v57 = 2114;
          v58 = v20;
          v23 = v22;
          _os_log_impl(&dword_21610C000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading value for per-gizmo key: %{public}@", buf, 0x16u);

        }
        -[HDSPSyncedUserDefaults hksp_objectForKey:](self->_nanoDefaults, "hksp_objectForKey:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        HKSPLogForCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
        if (v24)
        {
          if (v26)
          {
            v27 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            v56 = v27;
            v57 = 2114;
            v58 = v24;
            v59 = 2114;
            v60 = (uint64_t)v20;
            v28 = v27;
            _os_log_impl(&dword_21610C000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading value %{public}@ for per-gizmo key: %{public}@", buf, 0x20u);

          }
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, v20);
        }
        else
        {
          if (v26)
          {
            v29 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v56 = v29;
            v57 = 2114;
            v58 = v20;
            v30 = v29;
            _os_log_impl(&dword_21610C000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] found nil value for per-gizmo key: %{public}@", buf, 0x16u);

          }
          objc_msgSend(v44, "objectForKeyedSubscript:", v20);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          HKSPLogForCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
          if (v31)
          {
            if (v33)
            {
              v34 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543874;
              v56 = v34;
              v57 = 2114;
              v58 = v31;
              v59 = 2114;
              v60 = (uint64_t)v20;
              v35 = v34;
              _os_log_impl(&dword_21610C000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading default value %{public}@ for per-gizmo key: %{public}@", buf, 0x20u);

            }
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, v20);
          }
          else
          {
            if (v33)
            {
              v36 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v56 = v36;
              v57 = 2114;
              v58 = v20;
              v37 = v36;
              _os_log_impl(&dword_21610C000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] no default value for per-gizmo key: %{public}@", buf, 0x16u);

            }
          }

        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v18);
  }
  v38 = (void *)objc_msgSend(v5, "copy");

  return v38;
}

- (void)hksp_saveDictionary:(id)a3
{
  -[HDSPSyncedDefaults hksp_saveDictionary:syncToCloudKit:](self, "hksp_saveDictionary:syncToCloudKit:", a3, 1);
}

- (void)hksp_saveDictionary:(id)a3 syncToCloudKit:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        HKSPNilify();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __57__HDSPSyncedDefaults_hksp_saveDictionary_syncToCloudKit___block_invoke;
        v15[3] = &unk_24D4E4F08;
        v16 = v13;
        v17 = v11;
        v14 = v13;
        -[HDSPSyncedDefaults _setDefaultForKey:setBlock:syncToCloudKit:](self, "_setDefaultForKey:setBlock:syncToCloudKit:", v11, v15, v4);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

uint64_t __57__HDSPSyncedDefaults_hksp_saveDictionary_syncToCloudKit___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hksp_setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)hksp_removeObjectsForKeys:(id)a3
{
  -[HDSPSyncedDefaults hksp_removeObjectsForKeys:syncToCloudKit:](self, "hksp_removeObjectsForKeys:syncToCloudKit:", a3, 1);
}

- (void)hksp_removeObjectsForKeys:(id)a3 syncToCloudKit:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[HDSPSyncedDefaults _setDefaultForKey:setBlock:syncToCloudKit:](self, "_setDefaultForKey:setBlock:syncToCloudKit:");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

uint64_t __63__HDSPSyncedDefaults_hksp_removeObjectsForKeys_syncToCloudKit___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hksp_removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

- (void)_setDefaultForKey:(id)a3 setBlock:(id)a4
{
  -[HDSPSyncedDefaults _setDefaultForKey:setBlock:syncToCloudKit:](self, "_setDefaultForKey:setBlock:syncToCloudKit:", a3, a4, 1);
}

- (void)_setDefaultForKey:(id)a3 setBlock:(id)a4 syncToCloudKit:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v16;
  const char *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *))a4;
  if (-[HDSPSyncedDefaultsConfiguration shouldPersistKey:](self->_configuration, "shouldPersistKey:", v8))
  {
    -[HDSPSyncedDefaults _defaultsForKey:](self, "_defaultsForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v10);
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    objc_msgSend(WeakRetained, "behavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "features");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "sleepCloudKitSync");

    if (!v14)
    {
LABEL_11:
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __64__HDSPSyncedDefaults__setDefaultForKey_setBlock_syncToCloudKit___block_invoke;
      v25[3] = &unk_24D4E3680;
      v25[4] = self;
      v26 = v8;
      -[HDSPSyncedDefaults _withLock:](self, "_withLock:", v25);

      goto LABEL_12;
    }
    if (-[HDSPSyncedDefaults syncDisabled](self, "syncDisabled"))
    {
      HKSPLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_10:

        goto LABEL_11;
      }
      *(_DWORD *)buf = 138543362;
      v28 = (id)objc_opt_class();
      v16 = v28;
      v17 = "[%{public}@] not syncing to CloudKit because sync disabled";
    }
    else
    {
      if (!-[HDSPSyncedDefaults needsInitialSync](self, "needsInitialSync"))
      {
        -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "cloudSyncEnabledKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v8, "isEqualToString:", v19);

        if (v20)
        {
          HKSPLogForCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v28 = (id)objc_opt_class();
            v22 = v28;
            _os_log_impl(&dword_21610C000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] sync now enabled, syncing from CloudKit", buf, 0xCu);

          }
          -[HDSPSyncedDefaults setNeedsSyncFromCloud:](self, "setNeedsSyncFromCloud:", 1);
        }
        else if (v5 && -[HDSPSyncedDefaultsConfiguration shouldSyncKey:](self->_configuration, "shouldSyncKey:", v8))
        {
          HKSPLogForCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v28 = (id)objc_opt_class();
            v29 = 2112;
            v30 = v8;
            v24 = v28;
            _os_log_impl(&dword_21610C000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing key to CloudKit: %@", buf, 0x16u);

          }
          v9[2](v9, self->_cloudDefaults);
        }
        goto LABEL_11;
      }
      HKSPLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      *(_DWORD *)buf = 138543362;
      v28 = (id)objc_opt_class();
      v16 = v28;
      v17 = "[%{public}@] not syncing to CloudKit because initial sync needed";
    }
    _os_log_impl(&dword_21610C000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);

    goto LABEL_10;
  }
LABEL_12:

}

uint64_t __64__HDSPSyncedDefaults__setDefaultForKey_setBlock_syncToCloudKit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)hdsp_forceSynchronizeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  HDSPSyncedUserDefaults *cloudDefaults;
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
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] doing a full CloudKit sync", buf, 0xCu);

  }
  cloudDefaults = self->_cloudDefaults;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__HDSPSyncedDefaults_hdsp_forceSynchronizeWithCompletion___block_invoke;
  v9[3] = &unk_24D4E4F58;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[HDSPSyncedUserDefaults hdsp_forceSynchronizeWithCompletion:](cloudDefaults, "hdsp_forceSynchronizeWithCompletion:", v9);

}

void __58__HDSPSyncedDefaults_hdsp_forceSynchronizeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsInitialSync:", a2 ^ 1);
  if (((a2 ^ 1) & 1) != 0)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v9 = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 2114;
    v12 = v5;
    v7 = v10;
    _os_log_error_impl(&dword_21610C000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] full CloudKit sync failed: %{public}@", (uint8_t *)&v9, 0x16u);
    goto LABEL_4;
  }
  objc_msgSend(*(id *)(a1 + 32), "_initialCloudKitSync");
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v7 = v10;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] full CloudKit sync completed", (uint8_t *)&v9, 0xCu);
LABEL_4:

  }
LABEL_6:

  (*(void (**)(_QWORD, uint64_t, id, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, v5, v8);
}

- (void)hdsp_setExternalChangeDelegate:(id)a3
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v4;
    v6 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] hdsp_setExternalChangeDelegate %{public}@", (uint8_t *)&v7, 0x16u);

  }
  -[HDSPSyncedDefaults setDelegate:](self, "setDelegate:", v4);
  -[HDSPSyncedUserDefaults hdsp_setExternalChangeDelegate:](self->_nanoDefaults, "hdsp_setExternalChangeDelegate:", self);
  -[HDSPSyncedUserDefaults hdsp_setExternalChangeDelegate:](self->_cloudDefaults, "hdsp_setExternalChangeDelegate:", self);

}

- (id)_defaultsForKey:(id)a3
{
  HDSPSyncedDefaultsConfiguration *configuration;
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;

  configuration = self->_configuration;
  v5 = a3;
  -[HDSPSyncedDefaultsConfiguration allPerGizmoKeys](configuration, "allPerGizmoKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  v8 = 24;
  if (v7)
    v8 = 32;
  v9 = *(id *)((char *)&self->super.isa + v8);

  return v9;
}

- (id)hksp_objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[HDSPSyncedDefaults _defaultsForKey:](self, "_defaultsForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hksp_objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[HDSPSyncedDefaultsConfiguration allDefaultValues](self->_configuration, "allDefaultValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)hksp_setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__HDSPSyncedDefaults_hksp_setObject_forKey___block_invoke;
  v10[3] = &unk_24D4E4F08;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[HDSPSyncedDefaults _setDefaultForKey:setBlock:](self, "_setDefaultForKey:setBlock:", v8, v10);

}

uint64_t __44__HDSPSyncedDefaults_hksp_setObject_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hksp_setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)hksp_removeObjectForKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__HDSPSyncedDefaults_hksp_removeObjectForKey___block_invoke;
  v6[3] = &unk_24D4E4F30;
  v7 = v4;
  v5 = v4;
  -[HDSPSyncedDefaults _setDefaultForKey:setBlock:](self, "_setDefaultForKey:setBlock:", v5, v6);

}

uint64_t __46__HDSPSyncedDefaults_hksp_removeObjectForKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hksp_removeObjectForKey:", *(_QWORD *)(a1 + 32));
}

- (BOOL)hksp_BOOLForKey:(id)a3
{
  void *v3;
  char v4;

  -[HDSPSyncedDefaults hksp_objectForKey:](self, "hksp_objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)hksp_setBool:(BOOL)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__HDSPSyncedDefaults_hksp_setBool_forKey___block_invoke;
  v8[3] = &unk_24D4E4F80;
  v10 = a3;
  v9 = v6;
  v7 = v6;
  -[HDSPSyncedDefaults _setDefaultForKey:setBlock:](self, "_setDefaultForKey:setBlock:", v7, v8);

}

uint64_t __42__HDSPSyncedDefaults_hksp_setBool_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hksp_setBool:forKey:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (float)hksp_floatForKey:(id)a3
{
  void *v3;
  float v4;
  float v5;

  -[HDSPSyncedDefaults hksp_objectForKey:](self, "hksp_objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)hksp_setFloat:(float)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  float v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__HDSPSyncedDefaults_hksp_setFloat_forKey___block_invoke;
  v8[3] = &unk_24D4E4FA8;
  v10 = a3;
  v9 = v6;
  v7 = v6;
  -[HDSPSyncedDefaults _setDefaultForKey:setBlock:](self, "_setDefaultForKey:setBlock:", v7, v8);

}

uint64_t __43__HDSPSyncedDefaults_hksp_setFloat_forKey___block_invoke(uint64_t a1, void *a2, double a3)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(a2, "hksp_setFloat:forKey:", *(_QWORD *)(a1 + 32), a3);
}

- (int64_t)hksp_integerForKey:(id)a3
{
  void *v3;
  int64_t v4;

  -[HDSPSyncedDefaults hksp_objectForKey:](self, "hksp_objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)hksp_setInteger:(int64_t)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__HDSPSyncedDefaults_hksp_setInteger_forKey___block_invoke;
  v8[3] = &unk_24D4E4FD0;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  -[HDSPSyncedDefaults _setDefaultForKey:setBlock:](self, "_setDefaultForKey:setBlock:", v7, v8);

}

uint64_t __45__HDSPSyncedDefaults_hksp_setInteger_forKey___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hksp_setInteger:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)hksp_dataForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HDSPSyncedDefaults _defaultsForKey:](self, "_defaultsForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hksp_dataForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localDefaultsDictionaryRepresentation
{
  return (id)-[HKSPUserDefaults hksp_dictionaryRepresentation](self->_localDefaults, "hksp_dictionaryRepresentation");
}

- (id)cloudKitDefaultsDictionaryRepresentation
{
  return (id)-[HDSPSyncedUserDefaults hksp_dictionaryRepresentation](self->_cloudDefaults, "hksp_dictionaryRepresentation");
}

- (void)hksp_synchronize
{
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__11;
  v8 = __Block_byref_object_dispose__11;
  v9 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__HDSPSyncedDefaults_hksp_synchronize__block_invoke;
  v3[3] = &unk_24D4E3CE8;
  v3[4] = self;
  v3[5] = &v4;
  -[HDSPSyncedDefaults _withLock:](self, "_withLock:", v3);
  -[HDSPSyncedDefaults _hksp_synchronizeKeys:](self, "_hksp_synchronizeKeys:", v5[5]);
  _Block_object_dispose(&v4, 8);

}

void __38__HDSPSyncedDefaults_hksp_synchronize__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_hksp_synchronizeKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKSPAccumulator *syncAccumulator;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPSyncedDefaults saveDataVersion](self, "saveDataVersion");
  -[HDSPSyncedDefaults saveCloudDataVersion](self, "saveCloudDataVersion");
  -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataVersionKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudDataVersionKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  syncAccumulator = self->_syncAccumulator;
  objc_msgSend(v10, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPAccumulator accumulateValues:](syncAccumulator, "accumulateValues:", v12);

}

- (void)_throttled_synchronizeKeys:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = (id)objc_opt_class();
    v22 = 2114;
    v23 = v4;
    v6 = v21;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] synchronizing keys: %{public}@", buf, 0x16u);

  }
  -[HKSPUserDefaults hksp_synchronizeKeys:](self->_localDefaults, "hksp_synchronizeKeys:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "supportsNanoSync");

  if (v9)
    -[HDSPSyncedUserDefaults hksp_synchronizeKeys:](self->_nanoDefaults, "hksp_synchronizeKeys:", v4);
  v10 = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(v10, "behavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "features");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "sleepCloudKitSync");
  v14 = MEMORY[0x24BDAC760];
  if (!v13)
  {

    goto LABEL_10;
  }
  v15 = -[HDSPSyncedDefaults syncDisabled](self, "syncDisabled");

  if (!v15)
  {
    if (-[HDSPSyncedDefaults needsInitialSync](self, "needsInitialSync"))
    {
      v19[0] = v14;
      v19[1] = 3221225472;
      v19[2] = __49__HDSPSyncedDefaults__throttled_synchronizeKeys___block_invoke;
      v19[3] = &unk_24D4E4990;
      v19[4] = self;
      -[HDSPSyncedDefaults hdsp_forceSynchronizeWithCompletion:](self, "hdsp_forceSynchronizeWithCompletion:", v19);
      goto LABEL_11;
    }
    if (!-[HDSPSyncedDefaults needsSyncFromCloud](self, "needsSyncFromCloud"))
    {
      -[HDSPSyncedUserDefaults hksp_synchronizeKeys:](self->_cloudDefaults, "hksp_synchronizeKeys:", v4);
      goto LABEL_11;
    }
    -[HDSPSyncedDefaults setNeedsSyncFromCloud:](self, "setNeedsSyncFromCloud:", 0);
    -[HDSPSyncedDefaults _syncCloudKitToLocal](self, "_syncCloudKitToLocal");
    -[HDSPSyncedDefaults delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "syncedUserDefaultsDidChangeExternally:", self);
LABEL_10:

  }
LABEL_11:
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __49__HDSPSyncedDefaults__throttled_synchronizeKeys___block_invoke_2;
  v17[3] = &unk_24D4E3680;
  v17[4] = self;
  v18 = v4;
  v16 = v4;
  -[HDSPSyncedDefaults _withLock:](self, "_withLock:", v17);

}

void __49__HDSPSyncedDefaults__throttled_synchronizeKeys___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "syncedUserDefaultsDidChangeExternally:", *(_QWORD *)(a1 + 32));

}

uint64_t __49__HDSPSyncedDefaults__throttled_synchronizeKeys___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "minusSet:", *(_QWORD *)(a1 + 40));
}

- (void)saveDataVersion
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  _BYTE v25[24];
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataVersionKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDSPSyncedDefaults hksp_integerForKey:](self, "hksp_integerForKey:", v4);

  -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "currentDataVersion");

  if (v5 >= v7)
  {
    if (v5 <= v7)
      goto LABEL_9;
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v25 = 138543874;
      *(_QWORD *)&v25[4] = objc_opt_class();
      *(_WORD *)&v25[12] = 2048;
      *(_QWORD *)&v25[14] = v5;
      *(_WORD *)&v25[22] = 2048;
      v26 = v7;
      v12 = *(id *)&v25[4];
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] not updating newer stored data version from %lu to %lu", v25, 0x20u);

    }
  }
  else
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v25 = 138543874;
      *(_QWORD *)&v25[4] = objc_opt_class();
      *(_WORD *)&v25[12] = 2048;
      *(_QWORD *)&v25[14] = v5;
      *(_WORD *)&v25[22] = 2048;
      v26 = v7;
      v9 = *(id *)&v25[4];
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating stored data version from %lu to %lu", v25, 0x20u);

    }
    -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject dataVersionKey](v10, "dataVersionKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPSyncedDefaults hksp_setInteger:forKey:](self, "hksp_setInteger:forKey:", v7, v11);

  }
LABEL_9:
  -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info", *(_OWORD *)v25, *(_QWORD *)&v25[16], v26);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localDataVersionKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HDSPSyncedDefaults hksp_integerForKey:](self, "hksp_integerForKey:", v14);

  -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "currentLocalDataVersion");

  if (v15 >= v17)
  {
    if (v15 <= v17)
      return;
    HKSPLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_opt_class();
      *(_DWORD *)v25 = 138543874;
      *(_QWORD *)&v25[4] = v23;
      *(_WORD *)&v25[12] = 2048;
      *(_QWORD *)&v25[14] = v15;
      *(_WORD *)&v25[22] = 2048;
      v26 = v17;
      v24 = v23;
      _os_log_impl(&dword_21610C000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] not updating newer stored local data version from %lu to %lu", v25, 0x20u);

    }
  }
  else
  {
    HKSPLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_opt_class();
      *(_DWORD *)v25 = 138543874;
      *(_QWORD *)&v25[4] = v19;
      *(_WORD *)&v25[12] = 2048;
      *(_QWORD *)&v25[14] = v15;
      *(_WORD *)&v25[22] = 2048;
      v26 = v17;
      v20 = v19;
      _os_log_impl(&dword_21610C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating stored local data version from %lu to %lu", v25, 0x20u);

    }
    -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject localDataVersionKey](v21, "localDataVersionKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPSyncedDefaults hksp_setInteger:forKey:](self, "hksp_setInteger:forKey:", v17, v22);

  }
}

- (void)saveCloudDataVersion
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  int v17;
  id v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "features");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sleepCloudKitSync");

  if (v6
    && !-[HDSPSyncedDefaults syncDisabled](self, "syncDisabled")
    && !-[HDSPSyncedDefaults needsInitialSync](self, "needsInitialSync"))
  {
    -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cloudDataVersionKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HDSPSyncedDefaults hksp_integerForKey:](self, "hksp_integerForKey:", v8);

    -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "currentCloudDataVersion");

    if (v9 >= v11)
    {
      if (v9 <= v11)
        return;
      HKSPLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543874;
        v18 = (id)objc_opt_class();
        v19 = 2048;
        v20 = v9;
        v21 = 2048;
        v22 = v11;
        v16 = v18;
        _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] not updating newer stored cloud data version from %lu to %lu", (uint8_t *)&v17, 0x20u);

      }
    }
    else
    {
      HKSPLogForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138543874;
        v18 = (id)objc_opt_class();
        v19 = 2048;
        v20 = v9;
        v21 = 2048;
        v22 = v11;
        v13 = v18;
        _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating stored cloud data version from %lu to %lu", (uint8_t *)&v17, 0x20u);

      }
      -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject cloudDataVersionKey](v14, "cloudDataVersionKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPSyncedDefaults hksp_setInteger:forKey:](self, "hksp_setInteger:forKey:", v11, v15);

    }
  }
}

- (void)syncedUserDefaultsDidChangeExternally:(id)a3
{
  HDSPSyncedUserDefaults *v4;
  void *v5;
  HDSPSyncedUserDefaults *v6;

  v4 = (HDSPSyncedUserDefaults *)a3;
  v6 = v4;
  if (self->_nanoDefaults == v4)
  {
    -[HDSPSyncedDefaults _nanoDefaultsDidReceiveExternalChange](self, "_nanoDefaultsDidReceiveExternalChange");
  }
  else if (self->_cloudDefaults == v4)
  {
    -[HDSPSyncedDefaults _cloudDefaultsDidReceiveExternalChange](self, "_cloudDefaultsDidReceiveExternalChange");
  }
  -[HDSPSyncedDefaults delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncedUserDefaultsDidChangeExternally:", self);

}

- (void)syncedUserDefaults:(id)a3 didChangeExternallyForKeys:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  HDSPSyncedUserDefaults *v11;

  v11 = (HDSPSyncedUserDefaults *)a3;
  v6 = a4;
  if (self->_nanoDefaults == v11)
  {
    -[HDSPSyncedDefaults _nanoDefaultsDidReceiveExternalChangeForKeys:](self, "_nanoDefaultsDidReceiveExternalChangeForKeys:", v6);
  }
  else if (self->_cloudDefaults == v11)
  {
    -[HDSPSyncedDefaults _cloudDefaultsDidReceiveExternalChangeForKeys:](self, "_cloudDefaultsDidReceiveExternalChangeForKeys:", v6);
  }
  -[HDSPSyncedDefaults delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  -[HDSPSyncedDefaults delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
    objc_msgSend(v9, "syncedUserDefaults:didChangeExternallyForKeys:", self, v6);
  else
    objc_msgSend(v9, "syncedUserDefaultsDidChangeExternally:", self);

}

- (void)_nanoDefaultsDidReceiveExternalChange
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  void *v6;
  char v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v4 = v9;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] _nanoDefaultsDidReceiveExternalChange", (uint8_t *)&v8, 0xCu);

  }
  -[HKSPUserDefaults hksp_synchronize](self->_localDefaults, "hksp_synchronize");
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAppleWatch");

  if ((v7 & 1) == 0)
    -[HDSPSyncedDefaults _differentialCloudKitSync](self, "_differentialCloudKitSync");
}

- (void)_nanoDefaultsDidReceiveExternalChangeForKeys:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id WeakRetained;
  void *v8;
  char v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 2114;
    v13 = v4;
    v6 = v11;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _nanoDefaultsDidReceiveExternalChangeForKeys: %{public}@", (uint8_t *)&v10, 0x16u);

  }
  -[HKSPUserDefaults hksp_synchronizeKeys:](self->_localDefaults, "hksp_synchronizeKeys:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppleWatch");

  if ((v9 & 1) == 0)
    -[HDSPSyncedDefaults _syncKeysToCloudKit:](self, "_syncKeysToCloudKit:", v4);

}

- (void)_cloudDefaultsDidReceiveExternalChange
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] _cloudDefaultsDidReceiveExternalChange", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPSyncedDefaults _differentialCloudKitSync](self, "_differentialCloudKitSync");
}

- (void)_cloudDefaultsDidReceiveExternalChangeForKeys:(id)a3
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
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v4;
    v6 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] _cloudDefaultsDidReceiveExternalChangeForKeys: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  -[HDSPSyncedDefaults _syncKeysFromCloudKit:](self, "_syncKeysFromCloudKit:", v4);

}

- (void)_initialCloudKitSync
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  HDSPSyncedUserDefaults *cloudDefaults;
  void *v10;
  void *v11;
  uint64_t v12;
  HKSPUserDefaults *localDefaults;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  int v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "features");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sleepCloudKitSync");

  if (v6 && !-[HDSPSyncedDefaults syncDisabled](self, "syncDisabled"))
  {
    -[HDSPSyncedDefaults setNeedsInitialSync:](self, "setNeedsInitialSync:", 0);
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543362;
      v24 = (id)objc_opt_class();
      v8 = v24;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing initial sync", (uint8_t *)&v23, 0xCu);

    }
    cloudDefaults = self->_cloudDefaults;
    -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cloudDataVersionKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HDSPSyncedUserDefaults hksp_integerForKey:](cloudDefaults, "hksp_integerForKey:", v11);

    localDefaults = self->_localDefaults;
    -[HDSPSyncedDefaultsConfiguration info](self->_configuration, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cloudDataVersionKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HKSPUserDefaults hksp_integerForKey:](localDefaults, "hksp_integerForKey:", v15);

    HKSPLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_opt_class();
      v23 = 138543618;
      v24 = v18;
      v25 = 2048;
      v26 = v12;
      v19 = v18;
      _os_log_impl(&dword_21610C000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] serverCloudKitDataVersion %lu", (uint8_t *)&v23, 0x16u);

    }
    HKSPLogForCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_opt_class();
      v23 = 138543618;
      v24 = v21;
      v25 = 2048;
      v26 = v16;
      v22 = v21;
      _os_log_impl(&dword_21610C000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] localCloudKitDataVersion %lu", (uint8_t *)&v23, 0x16u);

    }
    if (v12 | v16)
    {
      if (v12)
      {
        if (!v16)
          -[HDSPSyncedDefaults _syncCloudKitToLocal](self, "_syncCloudKitToLocal");
      }
    }
    else
    {
      -[HDSPSyncedDefaults _syncLocalToCloudKit](self, "_syncLocalToCloudKit");
    }
  }
}

- (void)_syncLocalToCloudKit
{
  id v3;

  -[HDSPSyncedDefaultsConfiguration allKeysToSync](self->_configuration, "allKeysToSync");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HDSPSyncedDefaults _syncKeysToCloudKit:](self, "_syncKeysToCloudKit:", v3);

}

- (void)_syncKeysToCloudKit:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "features");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sleepCloudKitSync");

  if (v8 && !-[HDSPSyncedDefaults syncDisabled](self, "syncDisabled"))
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543618;
      v23 = (id)objc_opt_class();
      v24 = 2114;
      v25 = v4;
      v10 = v23;
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing to CloudKit: %{public}@", (uint8_t *)&v22, 0x16u);

    }
    -[HDSPSyncedDefaults hksp_dictionaryRepresentationForKeys:](self, "hksp_dictionaryRepresentationForKeys:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v11, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDSPSyncedUserDefaults hksp_saveDictionary:](self->_cloudDefaults, "hksp_saveDictionary:", v11);
    -[HDSPSyncedUserDefaults hksp_removeObjectsForKeys:](self->_cloudDefaults, "hksp_removeObjectsForKeys:", v15);
    -[HDSPSyncedUserDefaults hksp_synchronizeKeys:](self->_cloudDefaults, "hksp_synchronizeKeys:", v4);
    -[HDSPSyncedDefaults saveCloudDataVersion](self, "saveCloudDataVersion");
    HKSPLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      v22 = 138543618;
      v23 = v17;
      v24 = 2114;
      v25 = v11;
      v18 = v17;
      _os_log_impl(&dword_21610C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] updates: %{public}@", (uint8_t *)&v22, 0x16u);

    }
    HKSPLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_opt_class();
      v22 = 138543618;
      v23 = v20;
      v24 = 2114;
      v25 = v15;
      v21 = v20;
      _os_log_impl(&dword_21610C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] removes: %{public}@", (uint8_t *)&v22, 0x16u);

    }
  }

}

- (void)_syncCloudKitToLocal
{
  id v3;

  -[HDSPSyncedDefaultsConfiguration allKeysToSync](self->_configuration, "allKeysToSync");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[HDSPSyncedDefaults _syncKeysFromCloudKit:](self, "_syncKeysFromCloudKit:", v3);

}

- (void)_syncKeysFromCloudKit:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "features");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sleepCloudKitSync");

  if (v8 && !-[HDSPSyncedDefaults syncDisabled](self, "syncDisabled"))
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543618;
      v23 = (id)objc_opt_class();
      v24 = 2114;
      v25 = v4;
      v10 = v23;
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncing from CloudKit: %{public}@", (uint8_t *)&v22, 0x16u);

    }
    -[HDSPSyncedUserDefaults hksp_dictionaryRepresentationForKeys:](self->_cloudDefaults, "hksp_dictionaryRepresentationForKeys:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v11, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDSPSyncedDefaults hksp_saveDictionary:syncToCloudKit:](self, "hksp_saveDictionary:syncToCloudKit:", v11, 0);
    -[HDSPSyncedDefaults hksp_removeObjectsForKeys:syncToCloudKit:](self, "hksp_removeObjectsForKeys:syncToCloudKit:", v15, 0);
    -[HDSPSyncedDefaults hksp_synchronizeKeys:](self, "hksp_synchronizeKeys:", v4);
    HKSPLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      v22 = 138543618;
      v23 = v17;
      v24 = 2114;
      v25 = v11;
      v18 = v17;
      _os_log_impl(&dword_21610C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] updates: %{public}@", (uint8_t *)&v22, 0x16u);

    }
    HKSPLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_opt_class();
      v22 = 138543618;
      v23 = v20;
      v24 = 2114;
      v25 = v15;
      v21 = v20;
      _os_log_impl(&dword_21610C000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] removes: %{public}@", (uint8_t *)&v22, 0x16u);

    }
  }

}

- (void)_differentialCloudKitSync
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "features");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sleepCloudKitSync");

  if (v6 && !-[HDSPSyncedDefaults syncDisabled](self, "syncDisabled"))
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = (id)objc_opt_class();
      v8 = v12;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing differential sync", buf, 0xCu);

    }
    -[HDSPSyncedDefaultsConfiguration keySets](self->_configuration, "keySets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__HDSPSyncedDefaults__differentialCloudKitSync__block_invoke;
    v10[3] = &unk_24D4E4FF8;
    v10[4] = self;
    objc_msgSend(v9, "na_each:", v10);

  }
}

uint64_t __47__HDSPSyncedDefaults__differentialCloudKitSync__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_differentialCloudKitSyncForKeySet:", a2);
}

- (void)_differentialCloudKitSyncForKeySet:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  HDSPSyncedUserDefaults *cloudDefaults;
  void *v10;
  void *v11;
  HKSPUserDefaults *localDefaults;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v6;
    v30 = 2114;
    v31 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] looking at keySet: %{public}@", (uint8_t *)&v28, 0x16u);

  }
  cloudDefaults = self->_cloudDefaults;
  objc_msgSend(v4, "modificationDateKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSyncedUserDefaults hksp_objectForKey:](cloudDefaults, "hksp_objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  localDefaults = self->_localDefaults;
  objc_msgSend(v4, "modificationDateKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPUserDefaults hksp_objectForKey:](localDefaults, "hksp_objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_opt_class();
    v28 = 138543618;
    v29 = v16;
    v30 = 2114;
    v31 = v14;
    v17 = v16;
    _os_log_impl(&dword_21610C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] local last modified: %{public}@", (uint8_t *)&v28, 0x16u);

  }
  HKSPLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_opt_class();
    v28 = 138543618;
    v29 = v19;
    v30 = 2114;
    v31 = v11;
    v20 = v19;
    _os_log_impl(&dword_21610C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] server last modified: %{public}@", (uint8_t *)&v28, 0x16u);

  }
  if ((NAEqualObjects() & 1) == 0)
  {
    if (v11 && !objc_msgSend(v14, "hksp_isAfterDate:", v11))
    {
      HKSPLogForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_opt_class();
        v28 = 138543362;
        v29 = v26;
        v27 = v26;
        _os_log_impl(&dword_21610C000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@] server modified later, syncing from CloudKit", (uint8_t *)&v28, 0xCu);

      }
      objc_msgSend(v4, "keysToSync");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPSyncedDefaults _syncKeysFromCloudKit:](self, "_syncKeysFromCloudKit:", v24);
    }
    else
    {
      HKSPLogForCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_opt_class();
        v28 = 138543362;
        v29 = v22;
        v23 = v22;
        _os_log_impl(&dword_21610C000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] local modified later, syncing to CloudKit", (uint8_t *)&v28, 0xCu);

      }
      objc_msgSend(v4, "keysToSync");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPSyncedDefaults _syncKeysToCloudKit:](self, "_syncKeysToCloudKit:", v24);
    }

  }
}

- (void)resetCloudData
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetting", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPSyncedUserDefaults hksp_reset](self->_cloudDefaults, "hksp_reset");
}

- (HDSPSyncedUserDefaultsExternalChangeDelegate)delegate
{
  return (HDSPSyncedUserDefaultsExternalChangeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)needsInitialSync
{
  return self->_needsInitialSync;
}

- (void)setNeedsInitialSync:(BOOL)a3
{
  self->_needsInitialSync = a3;
}

- (BOOL)needsSyncFromCloud
{
  return self->_needsSyncFromCloud;
}

- (void)setNeedsSyncFromCloud:(BOOL)a3
{
  self->_needsSyncFromCloud = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncAccumulator, 0);
  objc_storeStrong((id *)&self->_keysNeedingSynchronize, 0);
  objc_storeStrong((id *)&self->_cloudDefaults, 0);
  objc_storeStrong((id *)&self->_nanoDefaults, 0);
  objc_storeStrong((id *)&self->_localDefaults, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
