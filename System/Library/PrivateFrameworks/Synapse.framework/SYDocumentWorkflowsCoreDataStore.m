@implementation SYDocumentWorkflowsCoreDataStore

+ (id)_persistentStoreDirURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 14, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("com.apple.synapse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)removePersistentStoreWithError:(id *)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  char v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_persistentStoreDirURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v17 = v6;
    _os_log_impl(&dword_1BCC38000, v7, OS_LOG_TYPE_DEFAULT, "Remove to persistent store directory at: %{private}@", buf, 0xCu);
  }

  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "fileExistsAtPath:", v8);

  if ((v9 & 1) != 0)
  {
    v15 = 0;
    v10 = objc_msgSend(v5, "removeItemAtURL:error:", v6, &v15);
    v11 = v15;
    if ((v10 & 1) == 0)
    {
      v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[SYDocumentWorkflowsCoreDataStore removePersistentStoreWithError:].cold.1();

    }
    if (a3)
      *a3 = objc_retainAutorelease(v11);

  }
  else
  {
    v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v17 = v6;
      _os_log_impl(&dword_1BCC38000, v13, OS_LOG_TYPE_INFO, "Unable to find persistent store directory at: %{private}@", buf, 0xCu);
    }

    if (a3)
      *a3 = 0;
    v10 = 1;
  }

  return v10;
}

- (NSURL)modelURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/Synapse.framework/SYDocumentWorkflowsModel.momd"));
}

- (NSPersistentContainer)persistentContainer
{
  SYDocumentWorkflowsCoreDataStore *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSPersistentContainer *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void (**v21)(_QWORD, _QWORD);
  NSObject *v22;
  int v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  char v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  NSPersistentContainer *persistentContainer;
  NSPersistentContainer *v35;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  void *v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  int v46;
  char v47[24];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_persistentContainer)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYDocumentWorkflowsCoreDataStore modelURL](v2, "modelURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

    if ((v6 & 1) == 0)
    {
      v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        -[SYDocumentWorkflowsCoreDataStore modelURL](v2, "modelURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SYDocumentWorkflowsCoreDataStore persistentContainer].cold.4(v8, (uint64_t)v47, v7);
      }

    }
    v9 = objc_alloc(MEMORY[0x1E0C97B98]);
    -[SYDocumentWorkflowsCoreDataStore modelURL](v2, "modelURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v9, "initWithContentsOfURL:", v10);

    objc_msgSend(MEMORY[0x1E0C97BC8], "persistentContainerWithName:managedObjectModel:", CFSTR("SYDocumentWorkflowsModel"), v37);
    v11 = (NSPersistentContainer *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[SYDocumentWorkflowsCoreDataStore persistentContainer].cold.3(v12);

    }
    objc_msgSend((id)objc_opt_class(), "_persistentStoreDirURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v3, "fileExistsAtPath:", v14);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLForKey:", CFSTR("SYPersistentStoreDirIsClean"));
    v18 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v44 = v15;
      v45 = 1024;
      v46 = v17;
      _os_log_impl(&dword_1BCC38000, v18, OS_LOG_TYPE_DEFAULT, "Persistent store directory exists: %{BOOL}d, isClean: %{BOOL}d", buf, 0xEu);
    }

    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __55__SYDocumentWorkflowsCoreDataStore_persistentContainer__block_invoke;
    v40[3] = &unk_1E757C5D8;
    v19 = v16;
    v41 = v19;
    v20 = MEMORY[0x1BCCFF08C](v40);
    v21 = (void (**)(_QWORD, _QWORD))v20;
    if (((v15 | v17) & 1) != 0)
    {
      if (((v15 ^ 1 | v17) & 1) == 0)
      {
        v22 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BCC38000, v22, OS_LOG_TYPE_DEFAULT, "Persistent store directory needs cleanup.", buf, 2u);
        }

        v39 = 0;
        v23 = objc_msgSend((id)objc_opt_class(), "removePersistentStoreWithError:", &v39);
        v24 = v39;
        v25 = v24;
        if ((v23 & 1) != 0)
        {
          if (v24)
            v21[2](v21, 1);
        }
        else
        {
          v26 = os_log_create("com.apple.synapse", "DocumentWorkflows");
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            -[SYDocumentWorkflowsCoreDataStore persistentContainer].cold.2();

        }
        v27 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v44 = v23;
          _os_log_impl(&dword_1BCC38000, v27, OS_LOG_TYPE_DEFAULT, "Persistent store directory cleaned up successfully: %{BOOL}d", buf, 8u);
        }

      }
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, 1);
    }
    v38 = 0;
    v28 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v38);
    v29 = v38;
    if ((v28 & 1) == 0)
    {
      v30 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        -[SYDocumentWorkflowsCoreDataStore persistentContainer].cold.1();

    }
    objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("SYDocumentWorkflowsModel.sqlite"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C08]), "initWithURL:", v31);
    v42 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPersistentContainer setPersistentStoreDescriptions:](v11, "setPersistentStoreDescriptions:", v33);

    -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](v11, "loadPersistentStoresWithCompletionHandler:", &__block_literal_global_14);
    persistentContainer = v2->_persistentContainer;
    v2->_persistentContainer = v11;
    v35 = v11;

  }
  objc_sync_exit(v2);

  return v2->_persistentContainer;
}

uint64_t __55__SYDocumentWorkflowsCoreDataStore_persistentContainer__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBool:forKey:", a2, CFSTR("SYPersistentStoreDirIsClean"));
}

void __55__SYDocumentWorkflowsCoreDataStore_persistentContainer__block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __55__SYDocumentWorkflowsCoreDataStore_persistentContainer__block_invoke_18_cold_1();

  }
}

- (id)fetchUserActivityWithRelatedUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1BCC38000, v7, OS_LOG_TYPE_INFO, "Fetching userActivity with relatedUniqueIdentifier: %@", buf, 0xCu);
  }

  -[SYDocumentWorkflowsCoreDataStore persistentContainer](self, "persistentContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newBackgroundContext");
  v16 = 0;
  -[SYDocumentWorkflowsCoreDataStore _fetchRecordWithRelatedUniqueIdentifier:context:error:](self, "_fetchRecordWithRelatedUniqueIdentifier:context:error:", v6, v9, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;

  if (v10)
  {
    objc_msgSend(v10, "userActivityData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", v12);
    }
    else
    {
      v14 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SYDocumentWorkflowsCoreDataStore fetchUserActivityWithRelatedUniqueIdentifier:error:].cold.1();

      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  return v13;
}

- (BOOL)saveUserActivity:(id)a3 forRelatedUniqueIdentifier:(id)a4 sourceBundleIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v10;
    v31 = 2112;
    v32 = v11;
    v33 = 2112;
    v34 = v12;
    _os_log_impl(&dword_1BCC38000, v13, OS_LOG_TYPE_INFO, "Saving userActivity: %@, relatedUniqueIdentifier: %@, sourceBundleIdentifier: %@", buf, 0x20u);
  }

  v28 = 0;
  objc_msgSend(v10, "_createUserActivityDataWithSaving:options:error:", 0, 0, &v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v28;
  if (v14)
  {
    v26 = a6;
    -[SYDocumentWorkflowsCoreDataStore persistentContainer](self, "persistentContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "newBackgroundContext");

    v27 = 0;
    -[SYDocumentWorkflowsCoreDataStore _fetchRecordWithRelatedUniqueIdentifier:context:error:](self, "_fetchRecordWithRelatedUniqueIdentifier:context:error:", v11, v17, &v27);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (unint64_t)v27;
    v20 = (void *)v19;
    if (v18 || !v19)
    {
      if (!(v18 | v19))
      {
        v23 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v30 = v11;
          v31 = 2112;
          v32 = v17;
          _os_log_impl(&dword_1BCC38000, v23, OS_LOG_TYPE_INFO, "Creating new record with relatedUniqueIdentifier: %@, context: %@", buf, 0x16u);
        }

        v18 = -[SYUserActivityRecord initWithContext:]([SYUserActivityRecord alloc], "initWithContext:", v17);
        objc_msgSend((id)v18, "setRelatedUniqueIdentifier:", v11);
      }
      if (v18 && !v20)
      {
        v24 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v30 = v11;
          v31 = 2112;
          v32 = v17;
          _os_log_impl(&dword_1BCC38000, v24, OS_LOG_TYPE_INFO, "Found existing record with relatedUniqueIdentifier: %@, context: %@", buf, 0x16u);
        }

      }
      objc_msgSend((id)v18, "setSourceBundleIdentifier:", v12);
      objc_msgSend((id)v18, "setUserActivityData:", v14);
      v21 = -[SYDocumentWorkflowsCoreDataStore _saveContext:error:](self, "_saveContext:error:", v17, v26);

    }
    else
    {
      v21 = 0;
      if (v26)
        *v26 = objc_retainAutorelease((id)v19);
    }

  }
  else
  {
    v22 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[SYDocumentWorkflowsCoreDataStore saveUserActivity:forRelatedUniqueIdentifier:sourceBundleIdentifier:error:].cold.1();

    v21 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v15);
  }

  return v21;
}

- (id)_fetchRecordWithRelatedUniqueIdentifier:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1BCC38000, v9, OS_LOG_TYPE_INFO, "Fetching record with relatedUniqueIdentifier: %@, context: %@", buf, 0x16u);
  }

  +[SYUserActivityRecord createFetchRequest](SYUserActivityRecord, "createFetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("relatedUniqueIdentifier == %@"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  objc_msgSend(v10, "setFetchLimit:", 1);
  v17 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v10, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;
  if (v12)
  {
    objc_msgSend(v12, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v19 = v7;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v13;
      _os_log_error_impl(&dword_1BCC38000, v15, OS_LOG_TYPE_ERROR, "Unable to fetch record with id: %@, context: %@, error: %@", buf, 0x20u);
    }

    v14 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v13);
  }

  return v14;
}

- (BOOL)_saveContext:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  char v7;
  os_log_t v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1BCC38000, v6, OS_LOG_TYPE_INFO, "Saving context: %@", buf, 0xCu);
  }

  if ((objc_msgSend(v5, "hasChanges") & 1) != 0)
  {
    v12 = 0;
    v7 = objc_msgSend(v5, "save:", &v12);
    v8 = (os_log_t)v12;
    v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    v10 = v9;
    if ((v7 & 1) != 0)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl(&dword_1BCC38000, v10, OS_LOG_TYPE_INFO, "Context saved: %@", buf, 0xCu);
      }

    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SYDocumentWorkflowsCoreDataStore _saveContext:error:].cold.1();

      if (a4)
      {
        v8 = objc_retainAutorelease(v8);
        *a4 = v8;
      }
    }
  }
  else
  {
    v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    v7 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1BCC38000, v8, OS_LOG_TYPE_INFO, "Context has no changes: %@", buf, 0xCu);
    }
  }

  return v7;
}

- (void)setPersistentContainer:(id)a3
{
  objc_storeStrong((id *)&self->_persistentContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

+ (void)removePersistentStoreWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_1(&dword_1BCC38000, v0, v1, "Unable to remove persistent store directory at: %{private}@, error: %{private}@");
  OUTLINED_FUNCTION_1_0();
}

- (void)persistentContainer
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3_2(&dword_1BCC38000, a3, (uint64_t)a3, "Model URL doesn't exist, URL: %@", (uint8_t *)a2);

}

void __55__SYDocumentWorkflowsCoreDataStore_persistentContainer__block_invoke_18_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1BCC38000, v0, v1, "Unable to load persistent stores, error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)fetchUserActivityWithRelatedUniqueIdentifier:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1BCC38000, v0, OS_LOG_TYPE_ERROR, "Found nil user activity data for id: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (void)saveUserActivity:forRelatedUniqueIdentifier:sourceBundleIdentifier:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_1BCC38000, v0, v1, "Unable to serialize user activity with id: %@, error: %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)_saveContext:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_1(&dword_1BCC38000, v0, v1, "Unable to save changes in context: %@, error: %@");
  OUTLINED_FUNCTION_1_0();
}

@end
