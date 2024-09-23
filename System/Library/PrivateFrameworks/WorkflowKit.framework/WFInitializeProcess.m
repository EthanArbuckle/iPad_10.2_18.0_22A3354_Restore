@implementation WFInitializeProcess

void __WFInitializeProcess_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  WFDatabase *v10;
  void *v11;
  WFDatabase *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  WFDatabase *v16;
  void *v17;
  WFDatabase *v18;
  WFDatabase *v19;
  int v20;
  id v21;
  char v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BB3598]();
  if (!*(_BYTE *)(a1 + 40))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "wf_shortcutsDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v22);

  if (!v6)
  {
    v21 = 0;
    v8 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v21);
    v7 = v21;
    if ((v8 & 1) == 0)
    {
      getWFGeneralLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "WFCreateShortcutsDataVaultIfNecessary";
        v25 = 2114;
        v26 = v7;
        _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_FAULT, "%s Cannot create Shortcuts data vault: %{public}@", buf, 0x16u);
      }

    }
    goto LABEL_11;
  }
  if (!v22)
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v24 = "WFCreateShortcutsDataVaultIfNecessary";
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s A file exists where Shortcuts directory should be", buf, 0xCu);
    }
LABEL_11:

  }
  v10 = [WFDatabase alloc];
  objc_msgSend(MEMORY[0x1E0C97C08], "wf_shortcutsConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v12 = -[WFDatabase initWithStoreDescription:runMigrationsIfNecessary:useLockFile:error:](v10, "initWithStoreDescription:runMigrationsIfNecessary:useLockFile:error:", v11, 1, 1, &v21);
  v13 = v21;

  if (v12)
  {
    v14 = 0;
  }
  else
  {
    getWFDatabaseLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "WFInitializeDatabase";
      v25 = 2114;
      v26 = v13;
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s Failed to initialize database: %{public}@", buf, 0x16u);
    }

    v16 = [WFDatabase alloc];
    objc_msgSend(MEMORY[0x1E0C97C08], "wf_inMemoryConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFDatabase initWithStoreDescription:runMigrationsIfNecessary:useLockFile:error:](v16, "initWithStoreDescription:runMigrationsIfNecessary:useLockFile:error:", v17, 0, 1, 0);

    v14 = 2;
  }
  +[WFDatabase setDefaultDatabase:](WFDatabase, "setDefaultDatabase:", v12);
  v18 = objc_retainAutorelease(v12);

  v19 = v18;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v14;

LABEL_18:
  v20 = *(unsigned __int8 *)(a1 + 41);
  WFInitializeDisallowedDirectories();
  objc_msgSend(MEMORY[0x1E0D140A0], "setUpDirectories");
  if (!v20)
    objc_msgSend(MEMORY[0x1E0D140A0], "clearTemporaryFiles");
  objc_autoreleasePoolPop(v2);
}

@end
