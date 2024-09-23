@implementation STAdminPersistenceController

+ (STAdminPersistenceController)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__STAdminPersistenceController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, block);
  return (STAdminPersistenceController *)(id)sharedController_sharedController;
}

void __48__STAdminPersistenceController_sharedController__block_invoke()
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  +[STLog persistence](STLog, "persistence");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = (id)objc_opt_class();
    v1 = v5;
    _os_log_impl(&dword_1D22E7000, v0, OS_LOG_TYPE_DEFAULT, "Created shared instance of “%{public}@”", (uint8_t *)&v4, 0xCu);

  }
  v2 = objc_opt_new();
  v3 = (void *)sharedController_sharedController;
  sharedController_sharedController = v2;

}

- (STAdminPersistenceController)init
{
  STAdminPersistenceController *v2;
  uint64_t v3;
  STXPCStoreServerEndpointFactory *storeServerEndpointFactory;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  STAdminPersistenceController *v15;
  objc_super v16;
  void *v17;
  uint8_t buf[4];
  STAdminPersistenceController *v19;
  __int16 v20;
  void *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)STAdminPersistenceController;
  v2 = -[STPersistenceController init](&v16, sel_init);
  if (v2)
  {
    if (_os_feature_enabled_impl())
    {
      v3 = objc_opt_new();
      storeServerEndpointFactory = v2->_storeServerEndpointFactory;
      v2->_storeServerEndpointFactory = (STXPCStoreServerEndpointFactory *)v3;

    }
    -[STPersistenceController persistentContainer](v2, "persistentContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[STAdminPersistenceController isUnitTestRunning](STAdminPersistenceController, "isUnitTestRunning"))
    {
      +[STLog persistence](STLog, "persistence");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D22E7000, v6, OS_LOG_TYPE_INFO, "Device is running in unit test mode. Configuring a test screen time database.", buf, 2u);
      }

      +[STPersistenceConfiguration persistentStoreDescriptionForConfigurationName:type:](STPersistenceConfiguration, "persistentStoreDescriptionForConfigurationName:type:", CFSTR("Local"), *MEMORY[0x1E0C979E8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/dev/null"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setURL:", v8);

      objc_msgSend(v7, "setConfiguration:", CFSTR("Local"));
      objc_msgSend(v7, "setOption:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97900]);
      v22[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPersistentStoreDescriptions:", v9);

      +[STLog persistence](STLog, "persistence");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_13;
    }
    else
    {
      +[STPersistenceConfiguration localPersistentXPCStoreDescription](STPersistenceConfiguration, "localPersistentXPCStoreDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (_os_feature_enabled_impl())
      {
        -[STAdminPersistenceController storeServerEndpointFactory](v2, "storeServerEndpointFactory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setOption:forKey:", v11, *MEMORY[0x1E0C97A58]);

      }
      v17 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPersistentStoreDescriptions:", v12);

      +[STLog persistence](STLog, "persistence");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_13;
    }
    *(_DWORD *)buf = 138543618;
    v19 = v2;
    v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_1D22E7000, v10, OS_LOG_TYPE_INFO, "%{public}@ loading persistent store: %{public}@", buf, 0x16u);
LABEL_13:

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __36__STAdminPersistenceController_init__block_invoke;
    v14[3] = &unk_1E9370850;
    v15 = v2;
    objc_msgSend(v5, "loadPersistentStoresWithCompletionHandler:", v14);

  }
  return v2;
}

void __36__STAdminPersistenceController_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[STLog persistence](STLog, "persistence");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v11 = 138543874;
      v12 = v9;
      v13 = 2114;
      v14 = v5;
      v15 = 2114;
      v16 = v6;
      _os_log_fault_impl(&dword_1D22E7000, v8, OS_LOG_TYPE_FAULT, "%{public}@ unable to load persistent store %{public}@: %{public}@", (uint8_t *)&v11, 0x20u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = 138543618;
    v12 = v10;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1D22E7000, v8, OS_LOG_TYPE_INFO, "%{public}@ loaded persistent store %{public}@", (uint8_t *)&v11, 0x16u);
  }

}

- (BOOL)saveContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[STPersistenceController localStore](self, "localStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasChanges"))
  {
    if (v7)
    {
      -[STPersistenceController persistentContainer](self, "persistentContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "persistentStoreCoordinator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[STPersistenceController localStore](self, "localStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentPersistentHistoryTokenFromStores:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    v14 = +[STConsistencyChecker validateWithManagedObjectContext:error:](_TtC14ScreenTimeCore20STConsistencyChecker, "validateWithManagedObjectContext:error:", v6, a4);
    if (a4)
      v13 = v14;
    else
      v13 = 1;
    if (v13)
    {
      if (!objc_msgSend(v6, "save:", a4))
      {
        v13 = 0;
        goto LABEL_18;
      }
      if (!_os_feature_enabled_impl()
        || +[STAdminPersistenceController isUnitTestRunning](STAdminPersistenceController, "isUnitTestRunning"))
      {
        v13 = 1;
LABEL_18:

        goto LABEL_19;
      }
      v15 = objc_opt_new();
      -[NSObject processSettingsChangesSinceHistoryToken:withCompletion:](v15, "processSettingsChangesSinceHistoryToken:withCompletion:", v12, &__block_literal_global);
    }
    else
    {
      +[STLog persistence](STLog, "persistence");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[STAdminPersistenceController saveContext:error:].cold.1((uint64_t)a4, v15, v16, v17, v18, v19, v20, v21);
    }

    goto LABEL_18;
  }
  v13 = 1;
LABEL_19:

  return v13;
}

void __50__STAdminPersistenceController_saveContext_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[STLog persistence](STLog, "persistence");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __50__STAdminPersistenceController_saveContext_error___block_invoke_cold_1((uint64_t)v2, v3);

}

- (void)performBackgroundTask:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void (*v7)(uint64_t);
  uint64_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = _os_feature_enabled_impl();
  -[STAdminPersistenceController viewContext](self, "viewContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = MEMORY[0x1E0C809B0];
    v7 = __54__STAdminPersistenceController_performBackgroundTask___block_invoke;
    v8 = &v11;
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v7 = __54__STAdminPersistenceController_performBackgroundTask___block_invoke_2;
    v8 = &v10;
  }
  v8[1] = 3221225472;
  v8[2] = (uint64_t)v7;
  v8[3] = (uint64_t)&unk_1E9370898;
  v8[4] = (uint64_t)self;
  v8[5] = (uint64_t)v4;
  v9 = v4;
  objc_msgSend(v6, "performBlock:", v8);

}

void __54__STAdminPersistenceController_performBackgroundTask___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewContext");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __54__STAdminPersistenceController_performBackgroundTask___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewContext");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (void)performBackgroundTaskAndWait:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void (*v7)(uint64_t);
  uint64_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = _os_feature_enabled_impl();
  -[STAdminPersistenceController viewContext](self, "viewContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11 = MEMORY[0x1E0C809B0];
    v7 = __61__STAdminPersistenceController_performBackgroundTaskAndWait___block_invoke;
    v8 = &v11;
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v7 = __61__STAdminPersistenceController_performBackgroundTaskAndWait___block_invoke_2;
    v8 = &v10;
  }
  v8[1] = 3221225472;
  v8[2] = (uint64_t)v7;
  v8[3] = (uint64_t)&unk_1E9370898;
  v8[4] = (uint64_t)self;
  v8[5] = (uint64_t)v4;
  v9 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

void __61__STAdminPersistenceController_performBackgroundTaskAndWait___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewContext");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __61__STAdminPersistenceController_performBackgroundTaskAndWait___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewContext");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

- (id)newBackgroundContext
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 != v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STAdminPersistenceController.m"), 169, CFSTR("new background context is being called from a background thread"));

    }
    -[STPersistenceController persistentContainer](self, "persistentContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[STPersistenceController persistentContainer](self, "persistentContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "newBackgroundContext");

    objc_msgSend(v7, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  }
  return v7;
}

- (id)viewContext
{
  void *v2;
  void *v3;

  -[STPersistenceController persistentContainer](self, "persistentContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAutomaticallyMergesChangesFromParent:", 1);
  objc_msgSend(v3, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  return v3;
}

+ (BOOL)isUnitTestRunning
{
  return NSClassFromString(CFSTR("XCTestProbe")) != 0;
}

- (STXPCStoreServerEndpointFactory)storeServerEndpointFactory
{
  return (STXPCStoreServerEndpointFactory *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStoreServerEndpointFactory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeServerEndpointFactory, 0);
}

- (void)saveContext:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "ManagedObjectContext save failed. Error reported when running ConsistencyChecker: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __50__STAdminPersistenceController_saveContext_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_FAULT, "Screen Time agent failed to process settings changes: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
