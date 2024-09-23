@implementation STPersistenceController

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (STPersistenceController)initWithPersistentContainer:(id)a3 persistentStoreChangeHandler:(id)a4 notificationDebouncer:(id)a5
{
  id v9;
  id v10;
  id v11;
  STPersistenceController *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *coreDataQueue;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)STPersistenceController;
  v12 = -[STPersistenceController init](&v20, sel_init);
  objc_storeStrong((id *)&v12->_persistentContainer, a3);
  v13 = dispatch_queue_create("com.apple.ScreenTimeAgent.core-data", 0);
  coreDataQueue = v12->_coreDataQueue;
  v12->_coreDataQueue = (OS_dispatch_queue *)v13;

  objc_storeStrong((id *)&v12->_changeHandler, a4);
  objc_storeStrong((id *)&v12->_changeNotificationDebouncer, a5);
  -[NSPersistentContainer persistentStoreCoordinator](v12->_persistentContainer, "persistentStoreCoordinator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:object:", v12, sel_remotePersistentStoreDidChange_, *MEMORY[0x1E0C97968], v15);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", v12, sel_remotePersistentStoreDidChange_, *MEMORY[0x1E0C979B0], v15);

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v12, sel__persistentStoreCoordinatorStoresDidChange_, *MEMORY[0x1E0C97920], v15);

  }
  return v12;
}

- (STPersistenceController)init
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  STConcretePersistentStoreChangeHandler *v8;
  STDebouncer *v9;
  STPersistenceController *v10;

  v3 = objc_alloc(MEMORY[0x1E0C97BC8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STPersistenceConfiguration managedObjectModel](STPersistenceConfiguration, "managedObjectModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithName:managedObjectModel:", v5, v6);

  v8 = -[STConcretePersistentStoreChangeHandler initWithPersistentContainer:]([STConcretePersistentStoreChangeHandler alloc], "initWithPersistentContainer:", v7);
  v9 = -[STDebouncer initWithMinCoalescenceInterval:maxCoalescenceInterval:]([STDebouncer alloc], "initWithMinCoalescenceInterval:maxCoalescenceInterval:", 1.0, 5.0);
  -[STDebouncer setDelegate:](v9, "setDelegate:", self);
  v10 = -[STPersistenceController initWithPersistentContainer:persistentStoreChangeHandler:notificationDebouncer:](self, "initWithPersistentContainer:persistentStoreChangeHandler:notificationDebouncer:", v7, v8, v9);

  return v10;
}

- (BOOL)saveContext:(id)a3 error:(id *)a4
{
  id v5;
  char v6;

  v5 = a3;
  if (objc_msgSend(v5, "hasChanges"))
    v6 = objc_msgSend(v5, "save:", a4);
  else
    v6 = 1;

  return v6;
}

- (void)performBackgroundTask:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[STPersistenceController coreDataQueue](self, "coreDataQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__STPersistenceController_performBackgroundTask___block_invoke;
  v7[3] = &unk_1E9370C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __49__STPersistenceController_performBackgroundTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performBackgroundTaskAndWait:", *(_QWORD *)(a1 + 40));
}

- (void)performBackgroundTaskAndWait:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  OS_dispatch_queue *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v4 = a3;
  +[STLog persistence](STLog, "persistence");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  +[STLog persistence](STLog, "persistence");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D22E7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CoreData Task", ", buf, 2u);
  }

  v9 = self->_coreDataQueue;
  objc_sync_enter(v9);
  v10 = -[STPersistenceController newBackgroundContext](self, "newBackgroundContext");
  objc_msgSend(v10, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __56__STPersistenceController_performBackgroundTaskAndWait___block_invoke;
  v18 = &unk_1E9370898;
  v11 = v4;
  v20 = v11;
  v12 = v10;
  v19 = v12;
  objc_msgSend(v12, "performBlockAndWait:", &v15);

  objc_sync_exit(v9);
  +[STLog persistence](STLog, "persistence", v15, v16, v17, v18);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D22E7000, v14, OS_SIGNPOST_INTERVAL_END, v6, "CoreData Task", ", buf, 2u);
  }

}

uint64_t __56__STPersistenceController_performBackgroundTaskAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)newBackgroundContext
{
  void *v2;
  void *v3;

  -[STPersistenceController persistentContainer](self, "persistentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newBackgroundContext");

  objc_msgSend(v3, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  return v3;
}

- (NSManagedObjectContext)viewContext
{
  void *v2;
  void *v3;

  -[STPersistenceController persistentContainer](self, "persistentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSManagedObjectContext *)v3;
}

- (NSPersistentStore)localStore
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[STPersistenceController persistentContainer](self, "persistentContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
      objc_msgSend(v11, "configurationName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Local"));

      if ((v13 & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v11;

    if (v14)
      goto LABEL_22;
  }
  else
  {
LABEL_9:

  }
  -[STPersistenceController _logAboutMissingStoreName:](self, "_logAboutMissingStoreName:", v6);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v20, "URL", (_QWORD)v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastPathComponent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "containsString:", CFSTR("Local"));

        if (v23)
        {
          v14 = v20;
          goto LABEL_21;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v17)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_21:

LABEL_22:
  return (NSPersistentStore *)v14;
}

- (NSPersistentStore)cloudStore
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[STPersistenceController persistentContainer](self, "persistentContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentStores");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
      objc_msgSend(v11, "configurationName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Cloud"));

      if ((v13 & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v14 = v11;

    if (v14)
      goto LABEL_22;
  }
  else
  {
LABEL_9:

  }
  -[STPersistenceController _logAboutMissingStoreName:](self, "_logAboutMissingStoreName:", v6);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v20, "URL", (_QWORD)v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastPathComponent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "containsString:", CFSTR("Cloud"));

        if (v23)
        {
          v14 = v20;
          goto LABEL_21;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v17)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_21:

LABEL_22:
  return (NSPersistentStore *)v14;
}

- (BOOL)hasStoreLoaded
{
  return 1;
}

- (void)debouncer:(id)a3 didDebounce:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a4;
  v6 = a3;
  -[STPersistenceController changeNotificationDebouncer](self, "changeNotificationDebouncer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v7 == v6 && v9)
  {
    -[STPersistenceController _remotePersistentStoreChangesDidCoalesce:](self, "_remotePersistentStoreChangesDidCoalesce:", v9);
    v8 = v9;
  }

}

- (id)descriptionForPersistentStore:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "configurationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/dev/null"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
    objc_msgSend(v3, "type");
  else
    objc_msgSend(v5, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)remotePersistentStoreDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  +[STLog persistence](STLog, "persistence");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[STPersistenceController remotePersistentStoreDidChange:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  -[STPersistenceController changeNotificationDebouncer](self, "changeNotificationDebouncer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounce:", v4);

}

- (void)_remotePersistentStoreChangesDidCoalesce:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  +[STLog persistence](STLog, "persistence");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[STPersistenceController _remotePersistentStoreChangesDidCoalesce:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  -[STPersistenceController coreDataQueue](self, "coreDataQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__STPersistenceController__remotePersistentStoreChangesDidCoalesce___block_invoke;
  v15[3] = &unk_1E93719C8;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  dispatch_async(v13, v15);

}

void __68__STPersistenceController__remotePersistentStoreChangesDidCoalesce___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "persistentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "newBackgroundContext");

  objc_msgSend(v4, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  objc_msgSend(*(id *)(a1 + 32), "changeHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleRemotePersistentStoreDidChange:inContext:", *(_QWORD *)(a1 + 40), v4);

}

- (void)_persistentStoreCoordinatorStoresDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[STPersistenceController changeHandler](self, "changeHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handlePersistentStoreCoordinatorStoresDidChange:", v4);

}

- (void)_logAboutMissingStoreName:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__STPersistenceController__logAboutMissingStoreName___block_invoke;
  block[3] = &unk_1E93719F0;
  v7 = v3;
  v4 = _logAboutMissingStoreName__onceToken[0];
  v5 = v3;
  if (v4 != -1)
    dispatch_once(_logAboutMissingStoreName__onceToken, block);

}

void __53__STPersistenceController__logAboutMissingStoreName___block_invoke(uint64_t a1)
{
  NSObject *v2;

  +[STLog mirroring](STLog, "mirroring");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __53__STPersistenceController__logAboutMissingStoreName___block_invoke_cold_1(a1, v2);

}

- (void)setPersistentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentContainer, a3);
}

- (OS_dispatch_queue)coreDataQueue
{
  return self->_coreDataQueue;
}

- (void)setCoreDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_coreDataQueue, a3);
}

- (STPersistentStoreChangeHandler)changeHandler
{
  return (STPersistentStoreChangeHandler *)objc_getProperty(self, a2, 24, 1);
}

- (STDebouncer)changeNotificationDebouncer
{
  return (STDebouncer *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeNotificationDebouncer, 0);
  objc_storeStrong((id *)&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_coreDataQueue, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (void)remotePersistentStoreDidChange:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, a1, a3, "STPersistenceController received remote store change notification", a5, a6, a7, a8, 0);
}

- (void)_remotePersistentStoreChangesDidCoalesce:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1D22E7000, a1, a3, "STPersistenceController remote store change notifications did coalesce", a5, a6, a7, a8, 0);
}

void __53__STPersistenceController__logAboutMissingStoreName___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "valueForKey:", CFSTR("configurationName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", CFSTR("metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_ERROR, "Unexpectedly missing store configuration names.\nStores: %@\nNames: %@\nMeta: %@", (uint8_t *)&v7, 0x20u);

}

@end
