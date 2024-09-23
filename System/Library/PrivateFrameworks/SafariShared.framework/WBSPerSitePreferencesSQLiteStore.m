@implementation WBSPerSitePreferencesSQLiteStore

- (id)_defaultValueForPreference:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  -[WBSPerSitePreferencesSQLiteStore _openDatabaseIfNecessary](self, "_openDatabaseIfNecessary");
  if (-[WBSPerSitePreferencesSQLiteStore _isDatabaseOpen](self, "_isDatabaseOpen"))
  {
    SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_database, CFSTR("SELECT default_value FROM default_preferences WHERE preference = ?"), &v18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(v4, "statement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    v11 = objc_msgSend(v4, "lastResultCode");
    if ((v11 & 0xFFFFFFFE) != 0x64)
    {
      v12 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v16 = v18;
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v20 = v16;
        v21 = 2114;
        v22 = v17;
        v23 = 1024;
        v24 = v11;
        _os_log_error_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch default value for preference: %@: %{public}@ (%d)", buf, 0x1Cu);

      }
    }
    v13 = objc_alloc(MEMORY[0x1E0D89C18]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v11 & 0xFFFFFFFE) == 100);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v13, "initWithFirst:second:", v14, v7);

  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0D89C18]);
    v9 = (void *)objc_msgSend(v8, "initWithFirst:second:", MEMORY[0x1E0C9AAA0], 0);
  }

  return v9;
}

void __95__WBSPerSitePreferencesSQLiteStore_getAllPreferenceInformationForPreference_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WBSPerSitePreferenceValueInformation *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id obj;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    v17 = a1;
    SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(*(_QWORD *)(a1 + 32) + 24), CFSTR("SELECT domain, preference_value, strftime('%s', timestamp) FROM preference_values WHERE preference = ?"), (_QWORD *)(a1 + 40));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    obj = v16;
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v22;
      do
      {
        v7 = 0;
        v8 = v2;
        v9 = v3;
        v10 = v4;
        do
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
          objc_msgSend(v11, "stringAtIndex:", 0);
          v2 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "intAtIndex:", 1));
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v11, "intAtIndex:", 2));
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = -[WBSPerSitePreferenceValueInformation initWithDomain:value:creationDate:]([WBSPerSitePreferenceValueInformation alloc], "initWithDomain:value:creationDate:", v2, v3, v4);
          objc_msgSend(v19, "addObject:", v12);

          ++v7;
          v8 = v2;
          v9 = v3;
          v10 = v4;
        }
        while (v5 != v7);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v5);
    }

    objc_msgSend(obj, "statement");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidate");

    if (objc_msgSend(obj, "lastResultCode") != 101)
    {
      v14 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(v17 + 32) + 24), "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        __95__WBSPerSitePreferencesSQLiteStore_getAllPreferenceInformationForPreference_completionHandler___block_invoke_cold_1();
      }

    }
    (*(void (**)(void))(*(_QWORD *)(v17 + 48) + 16))();

  }
  else
  {
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v15 + 16))(v15);

  }
}

- (void)_openDatabaseIfNecessary
{
  if (!-[WBSPerSitePreferencesSQLiteStore _isDatabaseOpen](self, "_isDatabaseOpen"))
    -[WBSPerSitePreferencesSQLiteStore _openDatabase](self, "_openDatabase");
}

- (BOOL)_isDatabaseOpen
{
  return self->_database != 0;
}

- (int)_migrateToCurrentSchemaVersionIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  BOOL v7;

  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("PRAGMA user_version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intAtIndex:", 0);

  objc_msgSend(v3, "statement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  if (v5 <= 5)
  {
    if (v5)
    {
      --v5;
      while (v5 != 5)
      {
        v7 = -[WBSPerSitePreferencesSQLiteStore _migrateToSchemaVersion:](self, "_migrateToSchemaVersion:", (v5 + 2));
        ++v5;
        if (!v7)
          goto LABEL_11;
      }
      v5 = 6;
    }
    else if (-[WBSPerSitePreferencesSQLiteStore _createFreshDatabaseSchema](self, "_createFreshDatabaseSchema") == 101)
    {
      v5 = 6;
      -[WBSPerSitePreferencesSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", 6);
    }
    else
    {
      v5 = 0;
    }
  }
LABEL_11:

  return v5;
}

- (void)_openDatabase
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_10(&dword_1A3D90000, v6, v4, "Failed to open Per Site Preferences store at %{private}@: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __47__WBSPerSitePreferencesSQLiteStore_sharedStore__block_invoke(uint64_t a1)
{
  WBSPerSitePreferencesSQLiteStore *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = [WBSPerSitePreferencesSQLiteStore alloc];
  objc_msgSend(*(id *)(a1 + 32), "defaultDatabaseURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[WBSPerSitePreferencesSQLiteStore initWithDatabaseURL:](v2, "initWithDatabaseURL:");
  v4 = (void *)+[WBSPerSitePreferencesSQLiteStore sharedStore]::sharedStore;
  +[WBSPerSitePreferencesSQLiteStore sharedStore]::sharedStore = v3;

  objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)+[WBSPerSitePreferencesSQLiteStore sharedStore]::sharedStore, "setSyncProxy:");

}

- (void)setSyncProxy:(id)a3
{
  objc_storeStrong((id *)&self->_syncProxy, a3);
}

- (WBSPerSitePreferencesSQLiteStore)initWithDatabaseURL:(id)a3
{
  id v4;
  WBSPerSitePreferencesSQLiteStore *v5;
  NSURL *v6;
  NSURL *databaseURL;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *databaseQueue;
  WBSPerSitePreferencesSQLiteStore *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSPerSitePreferencesSQLiteStore;
  v5 = -[WBSPerSitePreferencesSQLiteStore init](&v13, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (NSURL *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D89CC0], "inMemoryDatabaseURL");
      v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = v6;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.SafariShared.WBSPerSitePreferencesSQLiteStore", v8);
    databaseQueue = v5->_databaseQueue;
    v5->_databaseQueue = (OS_dispatch_queue *)v9;

    v11 = v5;
  }

  return v5;
}

+ (id)defaultDatabaseURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_settingsDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("PerSitePreferences.db"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)getDefaultValueForPreference:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__WBSPerSitePreferencesSQLiteStore_getDefaultValueForPreference_completionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

void __83__WBSPerSitePreferencesSQLiteStore_getDefaultValueForPreference_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_defaultValueForPreference:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  v6 = v2;
  objc_msgSend(v2, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v4, objc_msgSend(v5, "BOOLValue"));

}

+ (id)sharedStore
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__WBSPerSitePreferencesSQLiteStore_sharedStore__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WBSPerSitePreferencesSQLiteStore sharedStore]::onceToken != -1)
    dispatch_once(&+[WBSPerSitePreferencesSQLiteStore sharedStore]::onceToken, block);
  return (id)+[WBSPerSitePreferencesSQLiteStore sharedStore]::sharedStore;
}

- (void)getAllPreferenceInformationForPreference:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__WBSPerSitePreferencesSQLiteStore_getAllPreferenceInformationForPreference_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A278;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

}

+ (id)staticSyncablePerSiteSettings
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("PerSitePreferencesContentBlockers");
  v6[1] = CFSTR("PerSitePreferencesUseReader");
  v6[2] = CFSTR("PerSitePreferencesRequestDesktopSite");
  v6[3] = CFSTR("PerSitePreferencesPageZoom");
  v6[4] = CFSTR("PerSitePreferencesProfile");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isPreferenceSyncable:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "staticSyncablePerSiteSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (WBSPerSitePreferencesSQLiteStore)init
{

  return 0;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WBSPerSitePreferencesSQLiteStore;
  -[WBSPerSitePreferencesSQLiteStore dealloc](&v2, sel_dealloc);
}

- (void)closeDatabase
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__WBSPerSitePreferencesSQLiteStore_closeDatabase__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __49__WBSPerSitePreferencesSQLiteStore_closeDatabase__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDatabase");
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 completionHandler:(id)a6
{
  -[WBSPerSitePreferencesSQLiteStore setValue:ofPreference:forDomain:includeTimestamp:completionHandler:](self, "setValue:ofPreference:forDomain:includeTimestamp:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 includeTimestamp:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v8 = a6;
  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  -[WBSPerSitePreferencesSQLiteStore setValue:ofPreference:forDomain:withTimestamp:completionHandler:](self, "setValue:ofPreference:forDomain:withTimestamp:completionHandler:", v16, v12, v13, v15, v14);

}

- (void)setValue:(id)a3 ofPreference:(id)a4 forDomain:(id)a5 withTimestamp:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *databaseQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  databaseQueue = self->_databaseQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __100__WBSPerSitePreferencesSQLiteStore_setValue_ofPreference_forDomain_withTimestamp_completionHandler___block_invoke;
  v23[3] = &unk_1E4B3DF80;
  v23[4] = self;
  v24 = v15;
  v25 = v12;
  v26 = v14;
  v27 = v13;
  v28 = v16;
  v18 = v13;
  v19 = v14;
  v20 = v12;
  v21 = v15;
  v22 = v16;
  dispatch_async(databaseQueue, v23);

}

void __100__WBSPerSitePreferencesSQLiteStore_setValue_ofPreference_forDomain_withTimestamp_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  _QWORD v26[3];
  _QWORD v27[3];
  _BYTE buf[12];
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setLocale:", v3);

    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setTimeZone:", v4);

    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v2, "stringFromDate:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    v25 = v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("INSERT INTO preference_values (domain, preference, preference_value, timestamp)VALUES (?, ?, ?, ?)ON CONFLICT (domain, preference)DO UPDATE SET domain = excluded.domain, preference = excluded.preference, preference_value = excluded.preference_value, timestamp = excluded.timestamp"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(_QWORD *)buf = objc_msgSend(*(id *)(a1 + 48), "integerValue");
      SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * const {__strong}&,NSString * const {__strong},long,NSString * {__strong}&>(v7, (_QWORD *)(a1 + 56), (_QWORD *)(a1 + 64), buf, &v25);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = *(id *)(a1 + 48);
        SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * const {__strong}&,NSString * const {__strong},NSString * {__strong},NSString * const {__strong}&&>(v7, (_QWORD *)(a1 + 56), (_QWORD *)(a1 + 64), &v24, &v25);

      }
    }
    v8 = objc_msgSend(v7, "execute");
    objc_msgSend(v7, "invalidate");
    if (v8 != 101)
    {
      v9 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 56);
        v20 = *(_QWORD *)(a1 + 64);
        v21 = *(_QWORD *)(a1 + 48);
        v22 = v25;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastErrorMessage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        *(_QWORD *)&buf[4] = v21;
        v29 = 2112;
        v30 = v20;
        v31 = 2112;
        v32 = v19;
        v33 = 2112;
        v34 = v22;
        v35 = 2114;
        v36 = v23;
        v37 = 1024;
        v38 = v8;
        _os_log_error_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_ERROR, "Failed to insert or replace preference value: %@ for preference: %@ for domain: %@ with date: %@: %{public}@ (%d)", buf, 0x3Au);

      }
    }
    v10 = *(_QWORD *)(a1 + 72);
    if (v10)
    {
      (*(void (**)(uint64_t, BOOL))(v10 + 16))(v10, v8 == 101);
      if (v8 == 101
        && *(_QWORD *)(a1 + 64)
        && *(_QWORD *)(a1 + 48)
        && *(_QWORD *)(a1 + 56)
        && objc_msgSend((id)objc_opt_class(), "isPreferenceSyncable:", *(_QWORD *)(a1 + 64))
        && objc_msgSend(MEMORY[0x1E0D89BE8], "isPerSiteSettingSyncEnabled"))
      {
        v11 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
        objc_msgSend(MEMORY[0x1E0D89CC0], "inMemoryDatabaseURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend(v11, "isEqual:", v12);

        if ((v11 & 1) == 0)
        {
          v26[0] = CFSTR("PerSiteSettingName");
          v26[1] = CFSTR("Domain");
          v13 = *(_QWORD *)(a1 + 56);
          v14 = *(_QWORD *)(a1 + 48);
          v27[0] = *(_QWORD *)(a1 + 64);
          v27[1] = v13;
          v26[2] = CFSTR("Value");
          v27[2] = v14;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "mutableCopy");

          v17 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
          v18 = (void *)objc_msgSend(v16, "copy");
          objc_msgSend(v17, "saveCloudPerSiteSettingWithDictionaryRepresentation:successCompletionHandler:", v18, &__block_literal_global_82);

        }
      }
    }

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 72);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }
}

void __100__WBSPerSitePreferencesSQLiteStore_setValue_ofPreference_forDomain_withTimestamp_completionHandler___block_invoke_20()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A3D90000, v0, OS_LOG_TYPE_INFO, "Safari's per-site settings have been updated in CloudKit", v1, 2u);
  }
}

- (void)getValueOfPreference:(id)a3 forDomain:(id)a4 withTimeoutInterval:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__WBSPerSitePreferencesSQLiteStore_getValueOfPreference_forDomain_withTimeoutInterval_completionHandler___block_invoke;
  v16[3] = &unk_1E4B3DFA8;
  v14 = v12;
  v18 = v14;
  v15 = v10;
  v17 = v15;
  -[WBSPerSitePreferencesSQLiteStore getValuesOfPreferences:forDomain:withTimeoutInterval:completionHandler:](self, "getValuesOfPreferences:forDomain:withTimeoutInterval:completionHandler:", v13, v11, v16, a5);

}

void __105__WBSPerSitePreferencesSQLiteStore_getValueOfPreference_forDomain_withTimeoutInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v2 + 16))(v2);

}

- (id)_valueOfPreferences:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v25 = WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[WBSPerSitePreferencesSQLiteStore _valueOfPreferences:forDomain:].cold.1();
    goto LABEL_16;
  }
  -[WBSPerSitePreferencesSQLiteStore _openDatabaseIfNecessary](self, "_openDatabaseIfNecessary");
  if (!-[WBSPerSitePreferencesSQLiteStore _isDatabaseOpen](self, "_isDatabaseOpen"))
  {
LABEL_16:
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89C18]), "initWithFirst:second:", &unk_1E4B87BE0, 0);
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(CFSTR("?"), "safari_stringByRepeatingWithCount:joinedByString:", objc_msgSend(v6, "count"), CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("preference IN (%@)"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendString:", v11);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT preference_value, preference FROM preference_values WHERE domain = ? AND (%@)"), v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSQLiteDatabase fetchQuery:stringArguments:](self->_database, "fetchQuery:stringArguments:", v12, v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = v28;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v18, "stringAtIndex:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v18, "objectAtIndex:", 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, v19);

        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v15);
  }

  objc_msgSend(v14, "statement");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "invalidate");

  if (objc_msgSend(v14, "lastResultCode") == 101)
  {
    v22 = objc_alloc(MEMORY[0x1E0D89C18]);
    v23 = &unk_1E4B87BF8;
    v24 = v13;
  }
  else
  {
    v22 = objc_alloc(MEMORY[0x1E0D89C18]);
    v24 = 0;
    v23 = &unk_1E4B87BE0;
  }
  v26 = (void *)objc_msgSend(v22, "initWithFirst:second:", v23, v24);

LABEL_19:
  return v26;
}

- (id)valueOfPreference:(id)a3 forDomain:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__30;
  v21 = __Block_byref_object_dispose__30;
  v22 = 0;
  databaseQueue = self->_databaseQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__WBSPerSitePreferencesSQLiteStore_valueOfPreference_forDomain___block_invoke;
  v13[3] = &unk_1E4B3DFD0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(databaseQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __64__WBSPerSitePreferencesSQLiteStore_valueOfPreference_forDomain___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v9[0] = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_valueOfPreferences:forDomain:", v3, a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", a1[5]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)getValuesOfPreferences:(id)a3 forDomain:(id)a4 withTimeoutInterval:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  dispatch_block_t v19;
  dispatch_block_t v20;
  dispatch_time_t v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  id *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  id *v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[5];
  id v45;
  uint64_t *v46;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v38 = 0;
  v39 = (id *)&v38;
  v40 = 0x2020000000;
  LOBYTE(v41) = 0;
  v13 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreferences_forDomain_withTimeoutInterval_completionHandler___block_invoke;
  v44[3] = &unk_1E4B3DFF8;
  v44[4] = self;
  v46 = &v38;
  v14 = v12;
  v45 = v14;
  v15 = (void *)MEMORY[0x1A8599ED0](v44);

  _Block_object_dispose(&v38, 8);
  v38 = 0;
  v39 = (id *)&v38;
  v40 = 0x3042000000;
  v41 = __Block_byref_object_copy__35;
  v42 = __Block_byref_object_dispose__36;
  v43 = 0;
  v32 = 0;
  v33 = (id *)&v32;
  v34 = 0x3042000000;
  v35 = __Block_byref_object_copy__35;
  v36 = __Block_byref_object_dispose__36;
  v37 = 0;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreferences_forDomain_withTimeoutInterval_completionHandler___block_invoke_37;
  block[3] = &unk_1E4B3E020;
  v30 = &v38;
  v31 = &v32;
  block[4] = self;
  v16 = v10;
  v27 = v16;
  v17 = v11;
  v28 = v17;
  v18 = v15;
  v29 = v18;
  v19 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  objc_storeWeak(v33 + 5, v19);
  if (a5 != 1.79769313e308)
  {
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreferences_forDomain_withTimeoutInterval_completionHandler___block_invoke_2;
    v23[3] = &unk_1E4B3E048;
    v25 = &v32;
    v24 = v18;
    v20 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v23);
    objc_storeWeak(v39 + 5, v20);
    v21 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    dispatch_get_global_queue(21, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v21, v22, v20);

  }
  dispatch_async((dispatch_queue_t)self->_databaseQueue, v19);

  _Block_object_dispose(&v32, 8);
  objc_destroyWeak(&v37);

  _Block_object_dispose(&v38, 8);
  objc_destroyWeak(&v43);

}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreferences_forDomain_withTimeoutInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    objc_sync_exit(v3);

  }
  else
  {
    *(_BYTE *)(v4 + 24) = 1;
    objc_sync_exit(v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreferences_forDomain_withTimeoutInterval_completionHandler___block_invoke_37(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id block;

  block = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v3 = WeakRetained;
  if (WeakRetained && !dispatch_block_testcancel(WeakRetained))
  {
    objc_msgSend(*(id *)(a1 + 32), "_valueOfPreferences:forDomain:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!dispatch_block_testcancel(v3))
    {
      if (v4)
      {
        v5 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v4, "second");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "first");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v6, objc_msgSend(v7, "integerValue"));

      }
      if (block)
        dispatch_block_cancel(block);
    }

  }
}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreferences_forDomain_withTimeoutInterval_completionHandler___block_invoke_2(uint64_t a1)
{
  id block;

  block = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (block)
    dispatch_block_cancel(block);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getValuesOfPreference:(id)a3 forDomains:(id)a4 withTimeoutInterval:(double)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  dispatch_block_t v19;
  dispatch_block_t v20;
  dispatch_time_t v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  id *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  id *v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[5];
  id v45;
  uint64_t *v46;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v38 = 0;
  v39 = (id *)&v38;
  v40 = 0x2020000000;
  LOBYTE(v41) = 0;
  v13 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke;
  v44[3] = &unk_1E4B3DFF8;
  v44[4] = self;
  v46 = &v38;
  v14 = v12;
  v45 = v14;
  v15 = (void *)MEMORY[0x1A8599ED0](v44);

  _Block_object_dispose(&v38, 8);
  v38 = 0;
  v39 = (id *)&v38;
  v40 = 0x3042000000;
  v41 = __Block_byref_object_copy__35;
  v42 = __Block_byref_object_dispose__36;
  v43 = 0;
  v32 = 0;
  v33 = (id *)&v32;
  v34 = 0x3042000000;
  v35 = __Block_byref_object_copy__35;
  v36 = __Block_byref_object_dispose__36;
  v37 = 0;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke_2;
  block[3] = &unk_1E4B3E070;
  v30 = &v38;
  v31 = &v32;
  block[4] = self;
  v16 = v15;
  v29 = v16;
  v17 = v10;
  v27 = v17;
  v18 = v11;
  v28 = v18;
  v19 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
  objc_storeWeak(v33 + 5, v19);
  if (a5 != 1.79769313e308)
  {
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke_4;
    v23[3] = &unk_1E4B3E048;
    v25 = &v32;
    v24 = v16;
    v20 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v23);
    objc_storeWeak(v39 + 5, v20);
    v21 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    dispatch_get_global_queue(21, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_after(v21, v22, v20);

  }
  dispatch_async((dispatch_queue_t)self->_databaseQueue, v19);

  _Block_object_dispose(&v32, 8);
  objc_destroyWeak(&v37);

  _Block_object_dispose(&v38, 8);
  objc_destroyWeak(&v43);

}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    objc_sync_exit(v3);

  }
  else
  {
    *(_BYTE *)(v4 + 24) = 1;
    objc_sync_exit(v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if (v3 && !dispatch_block_testcancel(v3))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke_3;
      v28[3] = &unk_1E4B39400;
      v7 = v4;
      v29 = v7;
      v22 = v5;
      v30 = v22;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v28);

      v20 = v7;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT preference_value, domain FROM preference_values WHERE preference = ? AND (%@)"), v7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "fetchQuery:stringArguments:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (dispatch_block_testcancel(v3))
      {
        objc_msgSend(v23, "statement");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invalidate");

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = v23;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v25 != v12)
                objc_enumerationMutation(v10);
              v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_msgSend(v14, "objectAtIndex:", 0);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "stringAtIndex:", 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
          }
          while (v11);
        }

        objc_msgSend(v10, "statement");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "invalidate");

        if (!dispatch_block_testcancel(v3))
        {
          v18 = objc_msgSend(v10, "lastResultCode");
          if (v18 == 101)
            v19 = v9;
          else
            v19 = 0;
          (*(void (**)(_QWORD, void *, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v19, v18 != 101);
          if (WeakRetained)
            dispatch_block_cancel(WeakRetained);
        }

      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }

}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  const __CFString *v5;
  id v6;

  v6 = a2;
  if (a3)
    v5 = CFSTR(" OR domain = ?");
  else
    v5 = CFSTR("domain = ?");
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __107__WBSPerSitePreferencesSQLiteStore_getValuesOfPreference_forDomains_withTimeoutInterval_completionHandler___block_invoke_4(uint64_t a1)
{
  id block;

  block = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (block)
    dispatch_block_cancel(block);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)getAllDomainsConfiguredForPreference:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__WBSPerSitePreferencesSQLiteStore_getAllDomainsConfiguredForPreference_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A278;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

}

void __91__WBSPerSitePreferencesSQLiteStore_getAllDomainsConfiguredForPreference_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(*(_QWORD *)(a1 + 32) + 24), CFSTR("SELECT domain FROM preference_values WHERE preference = ?"), (_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v17;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v7), "stringAtIndex:", 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v8);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      }
      while (v5);
    }

    objc_msgSend(v4, "statement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    v10 = objc_msgSend(v4, "lastResultCode");
    if (v10 != 101)
    {
      v11 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastErrorMessage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v21 = v13;
        v22 = 2114;
        v23 = v14;
        v24 = 1024;
        v25 = v10;
        _os_log_error_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_ERROR, "Failed to get all domains configured for preference: %@: %{public}@ (%d)", buf, 0x1Cu);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v12 + 16))(v12);

  }
}

- (void)removePreferenceValuesForDomains:(id)a3 fromPreference:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *databaseQueue;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = operator new();
    MEMORY[0x1A8599720](v11, CFSTR("com.apple.SafariShared.WBSPerSitePreferencesSQLiteStore"));
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke;
    block[3] = &unk_1E4B39248;
    block[4] = self;
    v14 = v8;
    v15 = v9;
    v17 = v11;
    v16 = v10;
    dispatch_async(databaseQueue, block);

  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }

}

void __102__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __102__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_2;
  v8[3] = &unk_1E4B391F8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v4;
  v11 = *(id *)(a1 + 48);
  v5 = objc_msgSend(v2, "_tryToPerformTransactionInBlock:", v8);
  v6 = *(id **)(a1 + 64);
  if (v6)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v6);
    MEMORY[0x1A85998AC]();
  }
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v5);

}

uint64_t __102__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v21;
  void *v22;
  __int128 v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _QWORD v30[3];
  _QWORD v31[3];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
  if (v2)
  {
    v4 = *(_QWORD *)v26;
    v5 = (_QWORD *)(a1 + 48);
    *(_QWORD *)&v3 = 141558787;
    v23 = v3;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(obj);
        v29 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&,NSString * const {__strong}>(*(void **)(*(_QWORD *)(a1 + 40) + 24), CFSTR("SELECT sync_data FROM preference_values WHERE preference = ? AND domain = ?"), (_QWORD *)(a1 + 48), &v29);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "nextObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "dataAtIndex:", 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }

        objc_msgSend(v7, "statement");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "invalidate");

        if ((objc_msgSend(v7, "lastResultCode") & 0xFFFFFFFE) != 0x64)
        {
          v12 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v17 = (void *)*v5;
            *(_DWORD *)buf = v23;
            v33 = 1752392040;
            v34 = 2117;
            v35 = v17;
            v36 = 2160;
            v37 = 1752392040;
            v38 = 2117;
            v39 = v29;
            _os_log_error_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch sync data before deletion for preference: %{sensitive, mask.hash}@ and domain: %{sensitive, mask.hash}@", buf, 0x2Au);
          }
        }
        v13 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&,NSString * const {__strong}>(*(void **)(*(_QWORD *)(a1 + 40) + 24), 0, CFSTR("DELETE from preference_values WHERE preference = ? AND domain = ?"), (_QWORD *)(a1 + 48), &v29);
        if (v13 != 101)
        {
          v19 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v21 = v29;
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "lastErrorMessage");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v33 = v21;
            v34 = 2114;
            v35 = v22;
            v36 = 1024;
            LODWORD(v37) = v13;
            _os_log_error_impl(&dword_1A3D90000, v19, OS_LOG_TYPE_ERROR, "Failed to delete domain: %@ from preference_values: %{public}@ (%d)", buf, 0x1Cu);

          }
          v18 = 0;
          goto LABEL_24;
        }
        if (objc_msgSend((id)objc_opt_class(), "isPreferenceSyncable:", *v5)
          && objc_msgSend(MEMORY[0x1E0D89BE8], "isPerSiteSettingSyncEnabled"))
        {
          v30[0] = CFSTR("UseDefaultValue");
          v30[1] = CFSTR("PerSiteSettingName");
          v14 = (void *)*v5;
          v31[0] = MEMORY[0x1E0C9AAB0];
          v31[1] = v14;
          v30[2] = CFSTR("Domain");
          v31[2] = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "mutableCopy");

          if (v10)
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, CFSTR("SyncData"));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "saveCloudPerSiteSettingWithDictionaryRepresentation:successCompletionHandler:", v16, &__block_literal_global_54, v23);

        }
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v40, 16);
      if (v2)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_24:

  return v18;
}

void __102__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomains_fromPreference_completionHandler___block_invoke_53()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A3D90000, v0, OS_LOG_TYPE_INFO, "Safari's per-site settings have been updated in CloudKit", v1, 2u);
  }
}

- (void)removePreferenceValuesForDomainPrefixes:(id)a3 fromPreferences:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *databaseQueue;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") && objc_msgSend(v9, "count"))
  {
    v11 = operator new();
    MEMORY[0x1A8599720](v11, CFSTR("com.apple.SafariShared.WBSPerSitePreferencesSQLiteStore"));
    databaseQueue = self->_databaseQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __110__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomainPrefixes_fromPreferences_completionHandler___block_invoke;
    block[3] = &unk_1E4B39248;
    block[4] = self;
    v14 = v9;
    v15 = v8;
    v17 = v11;
    v16 = v10;
    dispatch_async(databaseQueue, block);

  }
  else if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }

}

void __110__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomainPrefixes_fromPreferences_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __110__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomainPrefixes_fromPreferences_completionHandler___block_invoke_2;
  v6[3] = &unk_1E4B391F8;
  v2 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v2;
  v9 = *(id *)(a1 + 48);
  v3 = objc_msgSend(v7, "_tryToPerformTransactionInBlock:", v6);
  v4 = *(id **)(a1 + 64);
  if (v4)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v4);
    MEMORY[0x1A85998AC]();
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v3);

}

uint64_t __110__WBSPerSitePreferencesSQLiteStore_removePreferenceValuesForDomainPrefixes_fromPreferences_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  void *v12;
  id obj;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_queryListForPreferences:", *(_QWORD *)(a1 + 40));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 48);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v17;
    while (2)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v17 != v3)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v4);
        v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE from preference_values WHERE preference in (%@) AND domain LIKE ?"), v14);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%%"), v5);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}>(v6, 0, v7, &v15);

        if (v8 != 101)
        {
          v10 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastErrorMessage");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v21 = v5;
            v22 = 2114;
            v23 = v12;
            v24 = 1024;
            v25 = v8;
            _os_log_error_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_ERROR, "Failed to delete domain prefix: %@ from preference_values: %{public}@ (%d)", buf, 0x1Cu);

          }
          v9 = 0;
          goto LABEL_13;
        }
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      if (v2)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_13:

  return v9;
}

- (id)defaultValueForPreference:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__30;
  v16 = __Block_byref_object_dispose__30;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WBSPerSitePreferencesSQLiteStore_defaultValueForPreference___block_invoke;
  block[3] = &unk_1E4B384C0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(databaseQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __62__WBSPerSitePreferencesSQLiteStore_defaultValueForPreference___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_defaultValueForPreference:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "second");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDefaultValue:(id)a3 forPreference:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__WBSPerSitePreferencesSQLiteStore_setDefaultValue_forPreference_completionHandler___block_invoke;
  v15[3] = &unk_1E4B2A2A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(databaseQueue, v15);

}

void __84__WBSPerSitePreferencesSQLiteStore_setDefaultValue_forPreference_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _BYTE buf[12];
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      *(_QWORD *)buf = objc_msgSend(*(id *)(a1 + 40), "integerValue");
      v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&,long>(v2, 0, CFSTR("INSERT INTO default_preferences (preference, default_value) VALUES (?, ?) ON CONFLICT (preference) DO UPDATE SET preference = excluded.preference, default_value = excluded.default_value"), (_QWORD *)(a1 + 48), buf);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v3 = 1;
        goto LABEL_11;
      }
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      v14 = *(id *)(a1 + 40);
      v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&,NSString * {__strong}>(v5, 0, CFSTR("INSERT INTO default_preferences (preference, default_value) VALUES (?, ?) ON CONFLICT (preference) DO UPDATE SET preference = excluded.preference, default_value = excluded.default_value"), (_QWORD *)(a1 + 48), &v14);

    }
    if (v3 == 101)
    {
      v6 = 1;
LABEL_14:
      v8 = *(_QWORD *)(a1 + 56);
      if (v8)
        (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v6);
      if ((_DWORD)v6
        && *(_QWORD *)(a1 + 48)
        && *(_QWORD *)(a1 + 40)
        && objc_msgSend((id)objc_opt_class(), "isPreferenceSyncable:", *(_QWORD *)(a1 + 48)))
      {
        if (objc_msgSend(MEMORY[0x1E0D89BE8], "isPerSiteSettingSyncEnabled"))
        {
          v15[0] = CFSTR("PerSiteSettingName");
          v15[1] = CFSTR("Value");
          v9 = *(_QWORD *)(a1 + 40);
          v16[0] = *(_QWORD *)(a1 + 48);
          v16[1] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "saveCloudPerSiteSettingWithDictionaryRepresentation:successCompletionHandler:", v10, &__block_literal_global_65_0);

        }
      }
      return;
    }
LABEL_11:
    v7 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastErrorMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v12;
      v18 = 2112;
      v19 = v11;
      v20 = 2114;
      v21 = v13;
      v22 = 1024;
      v23 = v3;
      _os_log_error_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_ERROR, "Failed to set default value: %@ for preference: %@: %{public}@ (%d)", buf, 0x26u);

    }
    v6 = 0;
    goto LABEL_14;
  }
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
}

void __84__WBSPerSitePreferencesSQLiteStore_setDefaultValue_forPreference_completionHandler___block_invoke_64()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A3D90000, v0, OS_LOG_TYPE_INFO, "Safari's per-site settings have been updated in CloudKit", v1, 2u);
  }
}

- (void)getTimestampAndValueOfPreference:(id)a3 forDomain:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__WBSPerSitePreferencesSQLiteStore_getTimestampAndValueOfPreference_forDomain_completionHandler___block_invoke;
  v15[3] = &unk_1E4B2A2A0;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(databaseQueue, v15);

}

void __97__WBSPerSitePreferencesSQLiteStore_getTimestampAndValueOfPreference_forDomain_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&,NSString * const {__strong}>(*(void **)(*(_QWORD *)(a1 + 32) + 24), CFSTR("SELECT preference_value, strftime('%s', timestamp) FROM preference_values WHERE domain = ? AND preference = ?"), (_QWORD *)(a1 + 40), (_QWORD *)(a1 + 48));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "objectAtIndex:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v3, "intAtIndex:", 1));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
      v4 = 0;
    }

    objc_msgSend(v7, "statement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)removeAllPreferenceValuesFromPreference:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValuesFromPreference_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A278;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

}

uint64_t __94__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValuesFromPreference_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t result;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&>(*(void **)(*(_QWORD *)(a1 + 32) + 24), 0, CFSTR("DELETE FROM preference_values WHERE preference = ?"), (_QWORD *)(a1 + 40));
    if (v2 != 101)
    {
      v3 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v5 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastErrorMessage");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412802;
        v8 = v5;
        v9 = 2114;
        v10 = v6;
        v11 = 1024;
        v12 = v2;
        _os_log_error_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_ERROR, "Failed to delete all preference values from preference %@: %{public}@ (%d)", (uint8_t *)&v7, 0x1Cu);

      }
    }
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 101);
  }
  else
  {
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

- (void)removeAllPreferenceValuesFromPreferences:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValuesFromPreferences_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A278;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

}

void __95__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValuesFromPreferences_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queryListForPreferences:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM preference_values WHERE preference in (%@)"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, v4);

    if (v5 != 101)
    {
      v6 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastErrorMessage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v11 = v2;
        v12 = 2114;
        v13 = v9;
        v14 = 1024;
        v15 = v5;
        _os_log_error_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_ERROR, "Failed to delete all preference values from preferences (%@): %{public}@ (%d)", buf, 0x1Cu);

      }
    }
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v5 == 101);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }
}

- (void)removeAllPreferenceValues:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValues___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __62__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValues___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 24), 0, CFSTR("DELETE FROM preference_values"));
    if (v2 != 101)
    {
      v3 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastErrorMessage");
        objc_claimAutoreleasedReturnValue();
        __62__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValues___block_invoke_cold_1();
      }

    }
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 101);
  }
  else
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

- (void)savePerSiteSettingCloudKitRecordToDisk:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UseDefaultValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "safari_encodedRecordData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "recordName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 141558531;
      v29 = 1752392040;
      v30 = 2117;
      v31 = v10;
      v32 = 2114;
      v33 = v12;
      _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_INFO, "Saving deleted CloudKit sync data: %{sensitive, mask.hash}@ with record name: %{public}@.", (uint8_t *)&v28, 0x20u);

    }
    objc_msgSend(v6, "safari_encodedRecordData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "recordName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSPerSitePreferencesSQLiteStore _setDeletedCloudKitSyncData:forRecordName:completionHandler:](self, "_setDeletedCloudKitSyncData:forRecordName:completionHandler:", v13, v15, v7);
  }
  else
  {
    objc_msgSend(v6, "safari_encryptedValues");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Domain"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "safari_encryptedValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PerSiteSettingName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v18 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "recordID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "recordName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "safari_encodedRecordData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 141559555;
        v29 = 1752392040;
        v30 = 2117;
        v31 = v20;
        v32 = 2114;
        v33 = v21;
        v34 = 2160;
        v35 = 1752392040;
        v36 = 2117;
        v37 = v14;
        v38 = 2160;
        v39 = 1752392040;
        v40 = 2117;
        v41 = v13;
        _os_log_impl(&dword_1A3D90000, v18, OS_LOG_TYPE_INFO, "Saving sync data: %{sensitive, mask.hash}@ and record name: %{public}@ for preference: %{sensitive, mask.hash}@ and domain: %{sensitive, mask.hash}@.", (uint8_t *)&v28, 0x48u);

      }
      objc_msgSend(v6, "safari_encodedRecordData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "recordName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _setSyncData:forPreference:domain:recordName:completionHandler:](self, "_setSyncData:forPreference:domain:recordName:completionHandler:", v15, v14, v13, v23, v7);

    }
    else
    {
      v24 = (id)WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "recordID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "recordName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "safari_encodedRecordData");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 141559043;
        v29 = 1752392040;
        v30 = 2117;
        v31 = v26;
        v32 = 2114;
        v33 = v27;
        v34 = 2160;
        v35 = 1752392040;
        v36 = 2117;
        v37 = v14;
        _os_log_impl(&dword_1A3D90000, v24, OS_LOG_TYPE_INFO, "Saving sync data: %{sensitive, mask.hash}@ and record name: %{public}@ for preference: %{sensitive, mask.hash}@.", (uint8_t *)&v28, 0x34u);

      }
      objc_msgSend(v6, "safari_encodedRecordData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _setSyncData:forPreference:completionHandler:](self, "_setSyncData:forPreference:completionHandler:", v15, v14, v7);
    }
  }

}

- (void)getSyncDataForPreference:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A278;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

}

void __79__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(*(_QWORD *)(a1 + 32) + 24), CFSTR("SELECT sync_data FROM default_preferences WHERE preference = ?"), (_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nextObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "dataAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

    objc_msgSend(v2, "statement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    v7 = objc_msgSend(v2, "lastResultCode") & 0xFFFFFFFE;
    if (v7 != 100)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __79__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_completionHandler___block_invoke_cold_1();
    }
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, void *, BOOL))(v9 + 16))(v9, v5, v7 == 100);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)getSyncDataForPreference:(id)a3 domain:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __86__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_domain_completionHandler___block_invoke;
  v15[3] = &unk_1E4B2A2A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(databaseQueue, v15);

}

void __86__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_domain_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&,NSString * const {__strong}>(*(void **)(*(_QWORD *)(a1 + 32) + 24), CFSTR("SELECT sync_data FROM preference_values WHERE preference = ? AND domain = ?"), (_QWORD *)(a1 + 40), (_QWORD *)(a1 + 48));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nextObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "dataAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

    objc_msgSend(v2, "statement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    v7 = objc_msgSend(v2, "lastResultCode") & 0xFFFFFFFE;
    if (v7 != 100)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __86__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_domain_completionHandler___block_invoke_cold_1();
    }
    v9 = *(_QWORD *)(a1 + 56);
    if (v9)
      (*(void (**)(uint64_t, void *, BOOL))(v9 + 16))(v9, v5, v7 == 100);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (void)getDeletedCloudKitSyncDataForRecordName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__WBSPerSitePreferencesSQLiteStore_getDeletedCloudKitSyncDataForRecordName_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A278;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

}

void __94__WBSPerSitePreferencesSQLiteStore_getDeletedCloudKitSyncDataForRecordName_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(*(void **)(*(_QWORD *)(a1 + 32) + 24), CFSTR("SELECT sync_data FROM deleted_cloudkit_records WHERE record_name = ?"), (_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "nextObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "dataAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

    objc_msgSend(v2, "statement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    v7 = objc_msgSend(v2, "lastResultCode") & 0xFFFFFFFE;
    if (v7 != 100)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __94__WBSPerSitePreferencesSQLiteStore_getDeletedCloudKitSyncDataForRecordName_completionHandler___block_invoke_cold_1();
    }
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, void *, BOOL))(v9 + 16))(v9, v5, v7 == 100);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (void)removePreferenceValueWithRecordName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__WBSPerSitePreferencesSQLiteStore_removePreferenceValueWithRecordName_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A278;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

}

uint64_t __90__WBSPerSitePreferencesSQLiteStore_removePreferenceValueWithRecordName_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&>(*(void **)(*(_QWORD *)(a1 + 32) + 24), 0, CFSTR("DELETE FROM preference_values WHERE record_name = ?"), (_QWORD *)(a1 + 40));
    if (v2 != 101)
    {
      v3 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __90__WBSPerSitePreferencesSQLiteStore_removePreferenceValueWithRecordName_completionHandler___block_invoke_cold_1();
    }
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 == 101);
  }
  else
  {
    result = *(_QWORD *)(a1 + 48);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

- (void)removeAllCloudKitRecordsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 24), 0, CFSTR("UPDATE default_preferences SET sync_data = NULL"));
    if ((_DWORD)v2 != 101)
    {
      v3 = v2;
      v4 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke_cold_3(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 24), 0, CFSTR("UPDATE preference_values SET sync_data = NULL"));
    if ((_DWORD)v11 != 101)
    {
      v12 = v11;
      v13 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke_cold_2(v12, v13, v14, v15, v16, v17, v18, v19);
    }
    v20 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 24), 0, CFSTR("DROP TABLE IF EXISTS deleted_cloudkit_records"));
    if ((_DWORD)v20 != 101)
    {
      v21 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
    }
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, (_DWORD)v20 == 101);
  }
  else
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

- (void)removeTombstoneWithRecordName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__WBSPerSitePreferencesSQLiteStore_removeTombstoneWithRecordName_completionHandler___block_invoke;
  block[3] = &unk_1E4B2A278;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(databaseQueue, block);

}

uint64_t __84__WBSPerSitePreferencesSQLiteStore_removeTombstoneWithRecordName_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0
    && SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&>(*(void **)(*(_QWORD *)(a1 + 32) + 24), 0, CFSTR("DELETE FROM deleted_cloudkit_records WHERE record_name = ?"), (_QWORD *)(a1 + 40)) != 101)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __84__WBSPerSitePreferencesSQLiteStore_removeTombstoneWithRecordName_completionHandler___block_invoke_cold_1();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)removeAllSyncData
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "staticSyncablePerSiteSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSPerSitePreferencesSQLiteStore removeAllPreferenceValuesFromPreferences:completionHandler:](self, "removeAllPreferenceValuesFromPreferences:completionHandler:", v4, &__block_literal_global_92);

  -[WBSPerSitePreferencesSQLiteStore removeAllCloudKitRecordsWithCompletionHandler:](self, "removeAllCloudKitRecordsWithCompletionHandler:", &__block_literal_global_94_0);
}

void __53__WBSPerSitePreferencesSQLiteStore_removeAllSyncData__block_invoke(uint64_t a1, int a2)
{
  NSObject *v2;

  if (a2)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __53__WBSPerSitePreferencesSQLiteStore_removeAllSyncData__block_invoke_cold_1();
  }
}

void __53__WBSPerSitePreferencesSQLiteStore_removeAllSyncData__block_invoke_93(uint64_t a1, int a2)
{
  NSObject *v2;

  if (a2)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __53__WBSPerSitePreferencesSQLiteStore_removeAllSyncData__block_invoke_93_cold_1();
  }
}

- (void)_setSyncData:(id)a3 forPreference:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__WBSPerSitePreferencesSQLiteStore__setSyncData_forPreference_completionHandler___block_invoke;
  v15[3] = &unk_1E4B2A2A0;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(databaseQueue, v15);

}

void __81__WBSPerSitePreferencesSQLiteStore__setSyncData_forPreference_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("INSERT INTO default_preferences (preference, sync_data) VALUES (?, ?) ON CONFLICT (preference) DO UPDATE SET sync_data = excluded.sync_data"));
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * const {__strong}&,NSData * const {__strong}&>(v2, (_QWORD *)(a1 + 40), (_QWORD *)(a1 + 48));
    v3 = objc_msgSend(v2, "execute");
    objc_msgSend(v2, "invalidate");
    if (v3 != 101)
    {
      v4 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v8 = 141558275;
        v9 = 1752392040;
        v10 = 2117;
        v11 = v5;
        _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Failed to insert default sync data for preference: %{sensitive, mask.hash}@", (uint8_t *)&v8, 0x16u);
      }
    }
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3 == 101);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
}

- (void)_setSyncData:(id)a3 forPreference:(id)a4 domain:(id)a5 recordName:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *databaseQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  databaseQueue = self->_databaseQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __99__WBSPerSitePreferencesSQLiteStore__setSyncData_forPreference_domain_recordName_completionHandler___block_invoke;
  v23[3] = &unk_1E4B3DF80;
  v23[4] = self;
  v24 = v14;
  v25 = v13;
  v26 = v12;
  v27 = v15;
  v28 = v16;
  v18 = v15;
  v19 = v12;
  v20 = v13;
  v21 = v14;
  v22 = v16;
  dispatch_async(databaseQueue, v23);

}

void __99__WBSPerSitePreferencesSQLiteStore__setSyncData_forPreference_domain_recordName_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("INSERT INTO preference_values (domain, preference, sync_data, record_name) VALUES (?, ?, ?, ?) ON CONFLICT (domain, preference) DO UPDATE SET sync_data = excluded.sync_data, record_name = excluded.record_name"));
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * const {__strong}&,NSString * const {__strong},NSData * const {__strong}&,NSString * const {__strong}>(v2, (_QWORD *)(a1 + 40), (_QWORD *)(a1 + 48), (_QWORD *)(a1 + 56), (_QWORD *)(a1 + 64));
    v3 = objc_msgSend(v2, "execute");
    objc_msgSend(v2, "invalidate");
    if (v3 != 101)
    {
      v4 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __99__WBSPerSitePreferencesSQLiteStore__setSyncData_forPreference_domain_recordName_completionHandler___block_invoke_cold_1();
    }
    v5 = *(_QWORD *)(a1 + 72);
    if (v5)
      (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v3 == 101);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 72);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }
}

- (void)_setDeletedCloudKitSyncData:(id)a3 forRecordName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *databaseQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __96__WBSPerSitePreferencesSQLiteStore__setDeletedCloudKitSyncData_forRecordName_completionHandler___block_invoke;
  v15[3] = &unk_1E4B2A2A0;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(databaseQueue, v15);

}

void __96__WBSPerSitePreferencesSQLiteStore__setDeletedCloudKitSyncData_forRecordName_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[16];

  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNecessary");
  if ((objc_msgSend(*(id *)(a1 + 32), "_isDatabaseOpen") & 1) != 0)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC8]), "initWithDatabase:query:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("INSERT INTO deleted_cloudkit_records (record_name, sync_data) VALUES (?, ?) ON CONFLICT (record_name) DO UPDATE SET sync_data = excluded.sync_data"));
    SafariShared::_WBSSQLiteStatementBindAllParameters<1,NSString * const {__strong}&,NSData * const {__strong}&>(v2, (_QWORD *)(a1 + 40), (_QWORD *)(a1 + 48));
    v3 = objc_msgSend(v2, "execute");
    objc_msgSend(v2, "invalidate");
    if (v3 != 101)
    {
      v4 = WBS_LOG_CHANNEL_PREFIXCloudSettings();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Failed to insert deleted CloudKit sync data.", v7, 2u);
      }
    }
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
      (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v3 == 101);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 56);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
  }
}

- (id)_queryListForPreferences:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_102);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __61__WBSPerSitePreferencesSQLiteStore__queryListForPreferences___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@'"), a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_migrateToSchemaVersion:(int)a3
{
  NSString *v5;
  SEL v6;
  _QWORD v8[6];
  int v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_migrateToSchemaVersion_%d"), *(_QWORD *)&a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = NSSelectorFromString(v5);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__WBSPerSitePreferencesSQLiteStore__migrateToSchemaVersion___block_invoke;
  v8[3] = &unk_1E4B3E138;
  v8[4] = self;
  v8[5] = v6;
  v9 = a3;
  return -[WBSPerSitePreferencesSQLiteStore _tryToPerformTransactionInBlock:](self, "_tryToPerformTransactionInBlock:", v8);
}

BOOL __60__WBSPerSitePreferencesSQLiteStore__migrateToSchemaVersion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  int v6;

  objc_msgSend(*(id *)(a1 + 32), "methodSignatureForSelector:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelector:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "invokeWithTarget:", *(_QWORD *)(a1 + 32));
  v6 = 0;
  objc_msgSend(v3, "getReturnValue:", &v6);
  v4 = v6 == 101
    && objc_msgSend(*(id *)(a1 + 32), "_setDatabaseSchemaVersion:", *(unsigned int *)(a1 + 48)) != 0;

  return v4;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  WBSSQLiteDatabase *database;
  void *v6;
  int v7;
  NSObject *v8;
  void *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  database = self->_database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA user_version = %d"), *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v12 = a3;
      v13 = 2114;
      v14 = v10;
      v15 = 1024;
      v16 = v7;
      _os_log_error_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_ERROR, "Failed to set the Per Site Preferences store database schema version to %d: %{public}@ (%d)", buf, 0x18u);

    }
  }
  return v7;
}

- (int)_createFreshDatabaseSchema
{
  int v3;
  int v4;
  int v5;
  NSObject *v6;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE default_preferences (id INTEGER PRIMARY KEY AUTOINCREMENT,preference TEXT NOT NULL UNIQUE,default_value NUMERIC,sync_data BLOB NULL)"));
  if (v3 != 101)
  {
    v5 = v3;
    v6 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _createFreshDatabaseSchema].cold.3();
    }
    goto LABEL_10;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE preference_values (id INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL,preference TEXT NOT NULL,preference_value NUMERIC,timestamp TEXT NULL,sync_data BLOB NULL,record_name TEXT NULL,UNIQUE(domain, preference))"));
  if (v4 != 101)
  {
    v5 = v4;
    v6 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _createFreshDatabaseSchema].cold.2();
    }
    goto LABEL_10;
  }
  v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE deleted_cloudkit_records (record_name TEXT NOT NULL UNIQUE,sync_data BLOB)"));
  if (v5 != 101)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _createFreshDatabaseSchema].cold.1();
    }
LABEL_10:

  }
  return v5;
}

- (int)_migrateToSchemaVersion_2
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE preference_values ADD COLUMN timestamp TEXT"));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _migrateToSchemaVersion_2].cold.1();
    }

  }
  return v3;
}

- (int)_migrateToSchemaVersion_3
{
  int v3;
  int v4;
  NSObject *v5;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE preference_values ADD COLUMN sync_data BLOB"));
  if (v3 != 101)
  {
    v4 = v3;
    v5 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _migrateToSchemaVersion_3].cold.2();
    }
    goto LABEL_7;
  }
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE preference_values ADD COLUMN record_name TEXT"));
  if (v4 != 101)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _migrateToSchemaVersion_3].cold.1();
    }
LABEL_7:

  }
  return v4;
}

- (int)_migrateToSchemaVersion_4
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ALTER TABLE default_preferences ADD COLUMN sync_data BLOB"));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _migrateToSchemaVersion_4].cold.1();
    }

  }
  return v3;
}

- (int)_migrateToSchemaVersion_5
{
  return 101;
}

- (int)_migrateToSchemaVersion_6
{
  int v3;
  NSObject *v4;

  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE IF NOT EXISTS deleted_cloudkit_records (record_name TEXT NOT NULL UNIQUE,sync_data BLOB)"));
  if (v3 != 101)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _createFreshDatabaseSchema].cold.1();
    }

  }
  return v3;
}

- (void)_closeDatabase
{
  WBSSQLiteDatabase *database;

  -[WBSSQLiteDatabase close](self->_database, "close");
  database = self->_database;
  self->_database = 0;

}

- (BOOL)_tryToPerformTransactionInBlock:(id)a3
{
  unsigned int (**v4)(_QWORD);
  BOOL v5;
  NSObject *v6;
  NSObject *v7;

  v4 = (unsigned int (**)(_QWORD))a3;
  if (!-[WBSPerSitePreferencesSQLiteStore _isDatabaseOpen](self, "_isDatabaseOpen"))
    goto LABEL_15;
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("BEGIN TRANSACTION")) != 101)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _tryToPerformTransactionInBlock:].cold.3();
    }
    goto LABEL_14;
  }
  if (!v4[2](v4))
  {
LABEL_11:
    if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("ROLLBACK TRANSACTION")) == 101)
    {
LABEL_15:
      v5 = 0;
      goto LABEL_16;
    }
    v6 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _tryToPerformTransactionInBlock:].cold.1();
    }
LABEL_14:

    goto LABEL_15;
  }
  if (SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("COMMIT TRANSACTION")) != 101)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXPerSitePreferences();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      objc_claimAutoreleasedReturnValue();
      -[WBSPerSitePreferencesSQLiteStore _tryToPerformTransactionInBlock:].cold.2();
    }

    goto LABEL_11;
  }
  v5 = 1;
LABEL_16:

  return v5;
}

- (WBSSafariBookmarksSyncAgentProxy)syncProxy
{
  return self->_syncProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncProxy, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)_valueOfPreferences:forDomain:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Requested value of preferences for nil domain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __95__WBSPerSitePreferencesSQLiteStore_getAllPreferenceInformationForPreference_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to get all preference information: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __62__WBSPerSitePreferencesSQLiteStore_removeAllPreferenceValues___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to delete all preference values.: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __79__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_10(&dword_1A3D90000, v0, v1, "Failed to fetch default sync data for preference: %{sensitive, mask.hash}@", v2);
  OUTLINED_FUNCTION_2();
}

void __86__WBSPerSitePreferencesSQLiteStore_getSyncDataForPreference_domain_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_9(&dword_1A3D90000, v0, v1, "Failed to fetch sync data for preference: %{sensitive, mask.hash}@ and domain: %{sensitive, mask.hash}@");
}

void __94__WBSPerSitePreferencesSQLiteStore_getDeletedCloudKitSyncDataForRecordName_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, v0, v1, "Failed to fetch deleted CloudKit sync data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __90__WBSPerSitePreferencesSQLiteStore_removePreferenceValueWithRecordName_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_10(&dword_1A3D90000, v0, v1, "Failed to delete the preference values using record name %{sensitive, mask.hash}@", v2);
  OUTLINED_FUNCTION_2();
}

void __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1A3D90000, a2, a3, "Failed to drop deleted_cloudkit_records database table for Per-Site Settings: (%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1A3D90000, a2, a3, "Failed to clear the sync_data column in preference_values for Per-Site Settings: (%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __82__WBSPerSitePreferencesSQLiteStore_removeAllCloudKitRecordsWithCompletionHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1A3D90000, a2, a3, "Failed to clear the sync_data column in default_preferences for Per-Site Settings: (%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __84__WBSPerSitePreferencesSQLiteStore_removeTombstoneWithRecordName_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_10(&dword_1A3D90000, v0, v1, "Failed to delete the CloudKit tombstone using record name %{sensitive, mask.hash}@", v2);
  OUTLINED_FUNCTION_2();
}

void __53__WBSPerSitePreferencesSQLiteStore_removeAllSyncData__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Removing Safari's Per-Site Settings sync data from the preference_values table was successful.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __53__WBSPerSitePreferencesSQLiteStore_removeAllSyncData__block_invoke_93_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_5_0(&dword_1A3D90000, v0, v1, "Removing Safari's Per-Site Settings CloudKit records was successful.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __99__WBSPerSitePreferencesSQLiteStore__setSyncData_forPreference_domain_recordName_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_9(&dword_1A3D90000, v0, v1, "Failed to insert sync data for preference: %{sensitive, mask.hash}@ and domain: %{sensitive, mask.hash}@");
}

- (void)_createFreshDatabaseSchema
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to create the default_preferences table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_2
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to add timestamp column to preference_values table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_3
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to add sync_data column to preference_values table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_migrateToSchemaVersion_4
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to add sync_data column to default_preferences table: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_tryToPerformTransactionInBlock:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to rollback transaction: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_tryToPerformTransactionInBlock:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to commit transaction: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_tryToPerformTransactionInBlock:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_9(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1_5(&dword_1A3D90000, "Failed to begin transaction: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

@end
