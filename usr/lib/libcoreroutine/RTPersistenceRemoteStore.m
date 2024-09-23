@implementation RTPersistenceRemoteStore

- (RTPersistenceRemoteStore)init
{
  return -[RTPersistenceRemoteStore initWithReadOnly:](self, "initWithReadOnly:", 1);
}

- (RTPersistenceRemoteStore)initWithReadOnly:(BOOL)a3
{
  _BOOL8 v3;
  RTPersistenceRemoteStore *v4;
  uint64_t v5;
  RTDarwinNotificationHelper *notificationHelper;
  RTDarwinNotificationHelper *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSPersistentStoreCoordinator *coordinator;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSPersistentStoreCoordinator *v24;
  uint64_t v25;
  NSPersistentStoreCoordinator *v26;
  int v27;
  RTPersistenceRemoteStore *v28;
  void *v30;
  id *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _QWORD v46[4];
  id v47;
  id location;
  objc_super v49;

  v3 = a3;
  v49.receiver = self;
  v49.super_class = (Class)RTPersistenceRemoteStore;
  v4 = -[RTPersistenceRemoteStore init](&v49, sel_init);
  if (!v4)
    goto LABEL_7;
  v5 = objc_opt_new();
  notificationHelper = v4->_notificationHelper;
  v4->_notificationHelper = (RTDarwinNotificationHelper *)v5;

  objc_initWeak(&location, v4);
  v7 = v4->_notificationHelper;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __45__RTPersistenceRemoteStore_initWithReadOnly___block_invoke;
  v46[3] = &unk_1E92983E8;
  v31 = &v47;
  objc_copyWeak(&v47, &location);
  -[RTDarwinNotificationHelper addObserverForNotificationName:handler:](v7, "addObserverForNotificationName:handler:", CFSTR("kRTPersistenceDeviceIdentityChanged"), v46);
  v8 = (void *)objc_opt_new();
  v9 = objc_alloc(MEMORY[0x1E0C97C00]);
  objc_msgSend(v8, "latestModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "initWithManagedObjectModel:", v10);
  coordinator = v4->_coordinator;
  v4->_coordinator = (NSPersistentStoreCoordinator *)v11;

  +[RTPersistenceManager defaultStoresDirectory](RTPersistenceManager, "defaultStoresDirectory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("Cache"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathExtension:", CFSTR("sqlite"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[RTPersistenceManager defaultStoresDirectory](RTPersistenceManager, "defaultStoresDirectory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:", CFSTR("Cloud-V2"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLByAppendingPathExtension:", CFSTR("sqlite"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C08]), "initWithURL:", v15);
  v20 = *MEMORY[0x1E0C97A70];
  objc_msgSend(v19, "setType:", *MEMORY[0x1E0C97A70]);
  objc_msgSend(v19, "setConfiguration:", CFSTR("Cache"));
  objc_msgSend(v19, "setShouldInferMappingModelAutomatically:", 1);
  objc_msgSend(v19, "setShouldMigrateStoreAutomatically:", 0);
  objc_msgSend(v19, "setShouldAddStoreAsynchronously:", 0);
  objc_msgSend(v19, "setReadOnly:", v3);
  v21 = *MEMORY[0x1E0C97A60];
  objc_msgSend(v19, "setOption:forKey:", CFSTR("com.apple.routined.store.cache"), *MEMORY[0x1E0C97A60]);
  v22 = *MEMORY[0x1E0C97A40];
  objc_msgSend(v19, "setOption:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97A40]);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C08]), "initWithURL:", v18);
  objc_msgSend(v23, "setType:", v20);
  objc_msgSend(v23, "setConfiguration:", CFSTR("Cloud"));
  objc_msgSend(v23, "setShouldInferMappingModelAutomatically:", 1);
  objc_msgSend(v23, "setShouldMigrateStoreAutomatically:", 0);
  objc_msgSend(v23, "setShouldAddStoreAsynchronously:", 0);
  objc_msgSend(v23, "setReadOnly:", v3);
  objc_msgSend(v23, "setOption:forKey:", CFSTR("com.apple.routined.store.cloud"), v21);
  objc_msgSend(v23, "setOption:forKey:", MEMORY[0x1E0C9AAB0], v22);
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__108;
  v44 = __Block_byref_object_dispose__108;
  v45 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__108;
  v38 = __Block_byref_object_dispose__108;
  v39 = 0;
  v24 = v4->_coordinator;
  v25 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __45__RTPersistenceRemoteStore_initWithReadOnly___block_invoke_5;
  v33[3] = &unk_1E92A2058;
  v33[4] = &v34;
  -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:](v24, "addPersistentStoreWithDescription:completionHandler:", v19, v33);
  v26 = v4->_coordinator;
  v32[0] = v25;
  v32[1] = 3221225472;
  v32[2] = __45__RTPersistenceRemoteStore_initWithReadOnly___block_invoke_7;
  v32[3] = &unk_1E92A2058;
  v32[4] = &v40;
  -[NSPersistentStoreCoordinator addPersistentStoreWithDescription:completionHandler:](v26, "addPersistentStoreWithDescription:completionHandler:", v23, v32);
  if (v35[5] || v41[5])
  {
    v27 = 1;
  }
  else
  {
    -[RTPersistenceRemoteStore _createManagedObjectContext](v4, "_createManagedObjectContext", &v47);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPersistenceRemoteStore updateCurrentDeviceMOIDWithContext:](v4, "updateCurrentDeviceMOIDWithContext:", v30);
    if (v4->_currentDeviceManagedObjectId)
    {
      v27 = 0;
    }
    else
    {

      v4 = 0;
      v27 = 1;
    }

  }
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  if (v27)
  {
    v28 = 0;
  }
  else
  {
LABEL_7:
    v4 = v4;
    v28 = v4;
  }

  return v28;
}

void __45__RTPersistenceRemoteStore_initWithReadOnly___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_createManagedObjectContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateCurrentDeviceMOIDWithContext:", v2);

    WeakRetained = v3;
  }

}

void __45__RTPersistenceRemoteStore_initWithReadOnly___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

void __45__RTPersistenceRemoteStore_initWithReadOnly___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (void)updateCurrentDeviceMOIDWithContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  RTPersistenceRemoteStore *v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__RTPersistenceRemoteStore_updateCurrentDeviceMOIDWithContext___block_invoke;
    v7[3] = &unk_1E9297540;
    v8 = v4;
    v9 = self;
    objc_msgSend(v8, "performBlockAndWait:", v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

  }
}

void __63__RTPersistenceRemoteStore_updateCurrentDeviceMOIDWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[RTPersistenceManager defaultStoresDirectory](RTPersistenceManager, "defaultStoresDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Cloud-V2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("sqlite"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistentStoreForURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "metadataForPersistentStore:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v8 = (void *)MEMORY[0x1E0C9AA70];
  v10 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("RTPersistentStoreMetadataDeviceRecordIDKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTDeviceMO fetchRequest](RTDeviceMO, "fetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3880];
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11);
  objc_msgSend(v13, "predicateWithFormat:", CFSTR("identifier == %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v15);

  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v11;
    _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "fetching device record with identifier %@", buf, 0xCu);
  }

  v17 = *(void **)(a1 + 32);
  v24 = 0;
  objc_msgSend(v17, "executeFetchRequest:error:", v12, &v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v24;
  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v18, "firstObject");
    v20 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectID](v20, "objectID");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 40);
    v23 = *(void **)(v22 + 16);
    *(_QWORD *)(v22 + 16) = v21;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v11;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "failed to fetch device record with identifier %@", buf, 0xCu);
    }
  }

}

- (id)_createManagedObjectContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
  objc_msgSend(MEMORY[0x1E0C97BA8], "mergeByPropertyObjectTrumpMergePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMergePolicy:", v4);

  objc_msgSend(v3, "setPersistentStoreCoordinator:", self->_coordinator);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransactionAuthor:", v6);

  return v3;
}

- (id)createManagedObjectContext
{
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  RTPersistenceRemoteStore *v9;

  -[RTPersistenceRemoteStore _createManagedObjectContext](self, "_createManagedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__RTPersistenceRemoteStore_createManagedObjectContext__block_invoke;
  v7[3] = &unk_1E9297540;
  v4 = v3;
  v8 = v4;
  v9 = self;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = v4;

  return v5;
}

void __54__RTPersistenceRemoteStore_createManagedObjectContext__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
  v5 = CFSTR("RTPersistenceDriverUserInfoDeviceMOIDKey");
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationHelper, 0);
  objc_storeStrong((id *)&self->_currentDeviceManagedObjectId, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
