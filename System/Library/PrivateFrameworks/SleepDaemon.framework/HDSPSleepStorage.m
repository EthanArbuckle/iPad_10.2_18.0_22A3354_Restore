@implementation HDSPSleepStorage

+ (id)standardConfiguration
{
  HDSPSyncedDefaultsInfo *v2;
  HDSPSyncedDefaultsKeySet *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HDSPSyncedDefaultsKeySet *v22;
  HDSPSyncedDefaultsKeySet *v23;
  objc_class *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HDSPSyncedDefaultsKeySet *v31;
  HDSPSyncedDefaultsConfiguration *v32;
  void *v33;
  HDSPSyncedDefaultsConfiguration *v34;
  HDSPSyncedDefaultsKeySet *v36;
  HDSPSyncedDefaultsKeySet *v37;
  HDSPSyncedDefaultsInfo *v38;
  _QWORD v39[4];

  v39[3] = *MEMORY[0x24BDAC8D0];
  v2 = [HDSPSyncedDefaultsInfo alloc];
  v38 = -[HDSPSyncedDefaultsInfo initWithDataVersionKey:currentDataVersion:cloudDataVersionKey:currentCloudDataVersion:cloudSyncEnabledKey:localDataVersionKey:currentLocalDataVersion:](v2, "initWithDataVersionKey:currentDataVersion:cloudDataVersionKey:currentCloudDataVersion:cloudSyncEnabledKey:localDataVersionKey:currentLocalDataVersion:", CFSTR("DataVersion"), 8, CFSTR("CloudStorageDataVersion"), 1, *MEMORY[0x24BEA9560], CFSTR("LocalDataVersion"), 1);
  v3 = [HDSPSyncedDefaultsKeySet alloc];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BEA9528];
  HKSPSleepScheduleProperties();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertyIdentifiersForProperties();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPSleepScheduleProperties();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertyIdentifiersForProperties();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[HDSPSyncedDefaultsKeySet initWithIdentifier:modficationDateKey:keysToPersist:keysToSync:](v3, "initWithIdentifier:modficationDateKey:keysToPersist:keysToSync:", v5, v6, v8, v10);

  v36 = [HDSPSyncedDefaultsKeySet alloc];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BEA9550];
  HKSPSleepSettingsPropertiesForPersist();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertyIdentifiersForProperties();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPSleepSettingsPropertiesForSync();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertyIdentifiersForProperties();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPSleepSettingsPerGizmoProperties();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertyIdentifiersForProperties();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPSleepSettingsDefaultValues();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPDefaultValuesByIdentifier();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HDSPSyncedDefaultsKeySet initWithIdentifier:modficationDateKey:keysToPersist:keysToSync:perGizmoKeys:defaultValues:](v36, "initWithIdentifier:modficationDateKey:keysToPersist:keysToSync:perGizmoKeys:defaultValues:", v12, v13, v15, v17, v19, v21);

  v23 = [HDSPSyncedDefaultsKeySet alloc];
  v24 = (objc_class *)objc_opt_class();
  NSStringFromClass(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x24BEA93B8];
  HKSPSleepEventRecordProperties();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertyIdentifiersForProperties();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPSleepEventRecordProperties();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertyIdentifiersForProperties();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[HDSPSyncedDefaultsKeySet initWithIdentifier:modficationDateKey:keysToPersist:keysToSync:](v23, "initWithIdentifier:modficationDateKey:keysToPersist:keysToSync:", v25, v26, v28, v30);

  v32 = [HDSPSyncedDefaultsConfiguration alloc];
  v39[0] = v37;
  v39[1] = v22;
  v39[2] = v31;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[HDSPSyncedDefaultsConfiguration initWithInfo:keySets:](v32, "initWithInfo:keySets:", v38, v33);

  return v34;
}

- (HDSPSleepStorage)initWithEnvironment:(id)a3
{
  id v4;
  void *v5;
  HDSPSyncedDefaults *v6;
  HDSPSleepStorage *v7;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "standardConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDSPSyncedDefaults initWithEnvironment:configuration:]([HDSPSyncedDefaults alloc], "initWithEnvironment:configuration:", v4, v5);
  v7 = -[HDSPSleepStorage initWithEnvironment:configuration:syncedDefaults:](self, "initWithEnvironment:configuration:syncedDefaults:", v4, v5, v6);

  return v7;
}

- (HDSPSleepStorage)initWithEnvironment:(id)a3 configuration:(id)a4 syncedDefaults:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDSPSleepStorage *v11;
  HDSPSleepStorage *v12;
  id v13;
  void *v14;
  uint64_t v15;
  HKSPObserverSet *observers;
  HDSPSleepStorage *v17;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDSPSleepStorage;
  v11 = -[HDSPSleepStorage init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_environment, v8);
    v13 = objc_alloc(MEMORY[0x24BEA98C8]);
    objc_msgSend(v8, "defaultCallbackScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithCallbackScheduler:", v14);
    observers = v12->_observers;
    v12->_observers = (HKSPObserverSet *)v15;

    objc_storeStrong((id *)&v12->_syncedDefaults, a5);
    objc_storeStrong((id *)&v12->_configuration, a4);
    v17 = v12;
  }

  return v12;
}

- (unint64_t)dataVersion
{
  void *v2;
  unint64_t v3;

  -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hksp_integerForKey:", CFSTR("DataVersion"));

  return v3;
}

- (unint64_t)cloudStorageDataVersion
{
  void *v2;
  unint64_t v3;

  -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hksp_integerForKey:", CFSTR("CloudStorageDataVersion"));

  return v3;
}

- (unint64_t)localDataVersion
{
  void *v2;
  unint64_t v3;

  -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hksp_integerForKey:", CFSTR("LocalDataVersion"));

  return v3;
}

- (BOOL)needsMigration
{
  id WeakRetained;
  void *v4;
  void *v5;
  BOOL v6;

  if (-[HDSPSleepStorage dataVersion](self, "dataVersion") < 8)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "features");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sleepCloudKitSync")
    && !-[HDSPSleepStorage cloudStorageDataVersion](self, "cloudStorageDataVersion")
    || -[HDSPSleepStorage localDataVersion](self, "localDataVersion") == 0;

  return v6;
}

- (void)performInitialSyncWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v6 = v9;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing initial sync", (uint8_t *)&v8, 0xCu);

  }
  -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hdsp_forceSynchronizeWithCompletion:", v4);

}

- (void)saveDataVersion
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] saving data version", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveDataVersion");

}

- (id)loadSleepSchedule:(id *)a3
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = (id)objc_opt_class();
    v6 = v15;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading schedule", (uint8_t *)&v14, 0xCu);

  }
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEA9928], "innerClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPSleepScheduleProperties();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepStorage _loadObjectOfClass:allowedClasses:propertiesToLoad:error:](self, "_loadObjectOfClass:allowedClasses:propertiesToLoad:error:", v7, v10, v11, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)saveSleepSchedule:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = (id)objc_opt_class();
    v13 = 2114;
    v14 = v6;
    v8 = v12;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting schedule %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v9 = -[HDSPSleepStorage _saveObject:error:](self, "_saveObject:error:", v6, a4);

  return v9;
}

- (BOOL)saveSleepScheduleChanges:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = (id)objc_opt_class();
    v13 = 2114;
    v14 = v6;
    v8 = v12;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting schedule changes %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v9 = -[HDSPSleepStorage _saveObjectChanges:versionKey:currentVersion:error:](self, "_saveObjectChanges:versionKey:currentVersion:error:", v6, *MEMORY[0x24BEA9530], 1, a4);

  return v9;
}

- (BOOL)removeSleepScheduleWithError:(id *)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  BOOL v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = (id)objc_opt_class();
    v6 = v11;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing sleep schedule", (uint8_t *)&v10, 0xCu);

  }
  HKSPSleepScheduleProperties();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDSPSleepStorage _removeObjectProperties:error:](self, "_removeObjectProperties:error:", v7, a3);

  return v8;
}

- (id)loadSleepSettings:(id *)a3
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = (id)objc_opt_class();
    v6 = v13;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading settings", (uint8_t *)&v12, 0xCu);

  }
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPSleepSettingsPropertiesForPersist();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepStorage _loadObjectOfClass:allowedClasses:propertiesToLoad:error:](self, "_loadObjectOfClass:allowedClasses:propertiesToLoad:error:", v7, v8, v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)saveSleepSettings:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = (id)objc_opt_class();
    v13 = 2114;
    v14 = v6;
    v8 = v12;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting settings %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v9 = -[HDSPSleepStorage _saveObject:error:](self, "_saveObject:error:", v6, a4);

  return v9;
}

- (BOOL)saveSleepSettingsChanges:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = (id)objc_opt_class();
    v13 = 2114;
    v14 = v6;
    v8 = v12;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting settings changes %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v9 = -[HDSPSleepStorage _saveObjectChanges:versionKey:currentVersion:error:](self, "_saveObjectChanges:versionKey:currentVersion:error:", v6, *MEMORY[0x24BEA9558], 11, a4);

  return v9;
}

- (BOOL)removeSleepSettingsWithError:(id *)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  BOOL v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = (id)objc_opt_class();
    v6 = v11;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing sleep settings", (uint8_t *)&v10, 0xCu);

  }
  HKSPSleepSettingsPropertiesForPersist();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDSPSleepStorage _removeObjectProperties:error:](self, "_removeObjectProperties:error:", v7, a3);

  return v8;
}

- (id)loadSleepEventRecord:(id *)a3
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = (id)objc_opt_class();
    v6 = v16;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading event record", (uint8_t *)&v15, 0xCu);

  }
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPSleepEventRecordProperties();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepStorage _loadObjectOfClass:allowedClasses:propertiesToLoad:error:](self, "_loadObjectOfClass:allowedClasses:propertiesToLoad:error:", v7, v8, v9, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    HKSPLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      v15 = 138543362;
      v16 = v12;
      v13 = v12;
      _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating default event record", (uint8_t *)&v15, 0xCu);

    }
    v10 = objc_alloc_init(MEMORY[0x24BEA9900]);
  }
  return v10;
}

- (BOOL)saveSleepEventRecord:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = (id)objc_opt_class();
    v13 = 2114;
    v14 = v6;
    v8 = v12;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting event record %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v9 = -[HDSPSleepStorage _saveObject:error:](self, "_saveObject:error:", v6, a4);

  return v9;
}

- (BOOL)saveSleepEventRecordChanges:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = (id)objc_opt_class();
    v13 = 2114;
    v14 = v6;
    v8 = v12;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting event record changes %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v9 = -[HDSPSleepStorage _saveObjectChanges:versionKey:currentVersion:error:](self, "_saveObjectChanges:versionKey:currentVersion:error:", v6, *MEMORY[0x24BEA93C0], 1, a4);

  return v9;
}

- (BOOL)removeSleepEventRecordWithError:(id *)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  BOOL v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = (id)objc_opt_class();
    v6 = v11;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] removing sleep event record", (uint8_t *)&v10, 0xCu);

  }
  HKSPSleepEventRecordProperties();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDSPSleepStorage _removeObjectProperties:error:](self, "_removeObjectProperties:error:", v7, a3);

  return v8;
}

- (id)loadSleepScheduleModel:(id *)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = (id)objc_opt_class();
    v6 = v22;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] loading model", buf, 0xCu);

  }
  v20 = 0;
  -[HDSPSleepStorage loadSleepSchedule:](self, "loadSleepSchedule:", &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }
  else
  {
    v19 = 0;
    -[HDSPSleepStorage loadSleepSettings:](self, "loadSleepSettings:", &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;
    v13 = v12;
    if (v12)
    {
      v10 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v12);
    }
    else
    {
      v18 = 0;
      -[HDSPSleepStorage loadSleepEventRecord:](self, "loadSleepEventRecord:", &v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v18;
      v16 = v15;
      if (v15)
      {
        v10 = 0;
        if (a3)
          *a3 = objc_retainAutorelease(v15);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEA9930], "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", v7, v11, v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }

  return v10;
}

- (BOOL)saveSleepScheduleModel:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  BOOL v16;
  id v17;
  id v18;
  void *v19;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = (id)objc_opt_class();
    v8 = v25;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] persisting model", buf, 0xCu);

  }
  objc_msgSend(v6, "sleepSchedule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v10 = -[HDSPSleepStorage saveSleepSchedule:error:](self, "saveSleepSchedule:error:", v9, &v23);
  v11 = v23;

  objc_msgSend(v6, "sleepSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v13 = -[HDSPSleepStorage saveSleepSettings:error:](self, "saveSleepSettings:error:", v12, &v22);
  v14 = v22;

  objc_msgSend(v6, "sleepEventRecord");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v16 = -[HDSPSleepStorage saveSleepEventRecord:error:](self, "saveSleepEventRecord:error:", v15, &v21);
  v17 = v21;

  if (a4)
  {
    if (v14)
      v18 = v14;
    else
      v18 = v17;
    if (v11)
      v19 = v11;
    else
      v19 = v18;
    *a4 = objc_retainAutorelease(v19);
  }

  return v10 && v13 && v16;
}

- (id)_loadObjectOfClass:(Class)a3 allowedClasses:(id)a4 propertiesToLoad:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  Class v29;
  __int16 v30;
  id v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertyIdentifiersForProperties();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "hksp_dictionaryRepresentationForKeys:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
  {
    HKSPSerializableKeyForClass();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v15;
    v33[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA9878]), "initWithAllowedClasses:serializedDictionary:", v10, v16);
    v25 = 0;
    objc_msgSend(v17, "deserializeObjectOfClass:error:", a3, &v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v25;
    if (v19)
    {
      HKSPLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v27 = v23;
        v28 = 2114;
        v29 = a3;
        v30 = 2114;
        v31 = v19;
        v24 = v23;
        _os_log_error_impl(&dword_21610C000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] failed deserialization of class %{public}@ with error %{public}@", buf, 0x20u);

      }
      if (a6)
        *a6 = objc_retainAutorelease(v19);
    }

  }
  else
  {
    HKSPLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v27 = (id)objc_opt_class();
      v28 = 2114;
      v29 = a3;
      v21 = v27;
      _os_log_impl(&dword_21610C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] nothing persisted for properties of class %{public}@", buf, 0x16u);

    }
    v18 = 0;
  }

  return v18;
}

- (BOOL)_saveObject:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  id v11;
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
  BOOL v26;
  NSObject *v27;
  void *v29;
  id v30;
  void *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x24BEA9880]);
  v8 = v7;
  if (!v6)
  {
    objc_msgSend(v7, "serializedDictionary", 0);
    goto LABEL_5;
  }
  v32 = 0;
  v9 = objc_msgSend(v7, "serialize:error:", v6, &v32);
  v10 = v32;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v8, "serializedDictionary", v10);
LABEL_5:
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hksp_serializedProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hksp_saveDictionary:", v14);

    objc_msgSend(v8, "serializedDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hksp_serializedClassName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDSPSyncedDefaultsConfiguration keySetForIdentifier:](self->_configuration, "keySetForIdentifier:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keysToPersist");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v14, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "na_setByRemovingObjectsFromSet:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "hksp_removeObjectsForKeys:", v23);

    -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "hksp_synchronize");

    v26 = 1;
    v11 = v31;
    goto LABEL_11;
  }
  HKSPLogForCategory();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v29 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v34 = v29;
    v35 = 2114;
    v36 = v11;
    v30 = v29;
    _os_log_error_impl(&dword_21610C000, v27, OS_LOG_TYPE_ERROR, "[%{public}@] failed serialization with error %{public}@", buf, 0x16u);

  }
  if (a4)
  {
    v11 = objc_retainAutorelease(v11);
    v26 = 0;
    *a4 = v11;
  }
  else
  {
    v26 = 0;
  }
LABEL_11:

  return v26;
}

- (BOOL)_saveObjectChanges:(id)a3 versionKey:(id)a4 currentVersion:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  BOOL v23;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(_QWORD *, void *);
  void *v31;
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 1;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  v41 = 0;
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v10, "changes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = MEMORY[0x24BDAC760];
  v29 = 3221225472;
  v30 = __71__HDSPSleepStorage__saveObjectChanges_versionKey_currentVersion_error___block_invoke;
  v31 = &unk_24D4E3500;
  v34 = &v36;
  v15 = v12;
  v32 = v15;
  v35 = &v42;
  v16 = v13;
  v33 = v16;
  objc_msgSend(v14, "na_each:", &v28);

  if (*((_BYTE *)v43 + 24))
  {
    -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults", v28, v29, v30, v31, v32);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hksp_setObject:forKey:", v18, v11);

    -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hksp_saveDictionary:", v15);

    -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hksp_removeObjectsForKeys:", v16);

    -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hksp_synchronize");

  }
  else
  {
    HKSPLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)objc_opt_class();
      v26 = v37[5];
      *(_DWORD *)buf = 138543618;
      v47 = v25;
      v48 = 2114;
      v49 = v26;
      v27 = v25;
      _os_log_error_impl(&dword_21610C000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] failed serialization with error %{public}@", buf, 0x16u);

    }
    if (a6)
      *a6 = objc_retainAutorelease((id)v37[5]);
  }
  v23 = *((_BYTE *)v43 + 24) != 0;

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v23;
}

void __71__HDSPSleepStorage__saveObjectChanges_versionKey_currentVersion_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
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
  id obj;

  v3 = a2;
  objc_msgSend(v3, "changedValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v3;
    if ((objc_msgSend(v5, "isAdd") & 1) != 0 || objc_msgSend(v5, "isUpdate"))
    {
      v6 = objc_alloc_init(MEMORY[0x24BEA9880]);
      objc_msgSend(v5, "changedValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "copyWithZone:", 0);
      v9 = *(_QWORD *)(a1[6] + 8);
      obj = *(id *)(v9 + 40);
      v10 = objc_msgSend(v6, "serialize:error:", v8, &obj);
      objc_storeStrong((id *)(v9 + 40), obj);

      if (v10)
      {
        objc_msgSend(v6, "serializedDictionary");
        v11 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)a1[4];
        objc_msgSend(v5, "property");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v14);

        v4 = (void *)v11;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
      }
    }
    else
    {
      v21 = (void *)a1[5];
      objc_msgSend(v5, "property");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addObject:", v22);

    }
    goto LABEL_12;
  }
  if (v4)
  {
    v15 = (void *)a1[4];
    objc_msgSend(v3, "property");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v4, v17);

LABEL_12:
    goto LABEL_13;
  }
  v18 = (void *)a1[5];
  objc_msgSend(v3, "property");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v20);

LABEL_13:
}

- (BOOL)_removeObjectProperties:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPPropertyIdentifiersForProperties();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "hksp_removeObjectsForKeys:", v7);
  -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hksp_synchronize");

  return 1;
}

- (void)addObserver:(id)a3
{
  -[HKSPObserverSet addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:", a3);
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = (id)objc_opt_class();
    v6 = v11;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v10, 0xCu);

  }
  objc_msgSend(v4, "diagnostics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addProvider:", self);

  objc_msgSend(v4, "notificationListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObserver:", self);
  -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hdsp_setExternalChangeDelegate:", self);

}

- (void)resetCloudStorage
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetting Cloud storage", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetCloudData");

}

- (void)syncedUserDefaultsDidChangeExternally:(id)a3
{
  NSObject *v4;
  id v5;
  HKSPObserverSet *observers;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = (id)objc_opt_class();
    v5 = v9;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] syncedDefaultsDidChangeExternally", buf, 0xCu);

  }
  observers = self->_observers;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__HDSPSleepStorage_syncedUserDefaultsDidChangeExternally___block_invoke;
  v7[3] = &unk_24D4E3528;
  v7[4] = self;
  -[HKSPObserverSet enumerateObserversWithBlock:](observers, "enumerateObserversWithBlock:", v7);
}

uint64_t __58__HDSPSleepStorage_syncedUserDefaultsDidChangeExternally___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sleepStorageDidChangeExternally:", *(_QWORD *)(a1 + 32));
}

- (NSString)sourceIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
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
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.sleepd.cloudkit.reset")))
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
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", v10, 0x16u);

    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.sleepd.cloudkit.reset")))
      -[HDSPSleepStorage resetCloudStorage](self, "resetCloudStorage");
  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult", *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)diagnosticDescription
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "features");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sleepCloudKitSync");

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localDefaultsDictionaryRepresentation");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v6)
  {
    -[HDSPSleepStorage syncedDefaults](self, "syncedDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cloudKitDefaultsDictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Local Data: %@\nCloudKit Data %@"), v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Data: %@"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HDSPSyncedDefaults)syncedDefaults
{
  return self->_syncedDefaults;
}

- (HDSPSyncedDefaultsConfiguration)configuration
{
  return self->_configuration;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_syncedDefaults, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
