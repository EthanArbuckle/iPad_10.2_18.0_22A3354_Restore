@implementation PLMigrationHistory

- (BOOL)supportsCloudUpload
{
  return 0;
}

+ (void)initialize
{
  pl_dispatch_once();
}

+ (id)entityName
{
  return CFSTR("MigrationHistory");
}

+ (id)insertCreatedWithManagedObjectContext:(id)a3 index:(int64_t)a4 migrationDate:(id)a5 hardwareModel:(id)a6 deviceUniqueID:(id)a7 cplEnabled:(BOOL)a8 initialSyncDate:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = a8;
  return (id)objc_msgSend(a1, "insertIntoManagedObjectContext:index:sourceModelVersion:migrationType:migrationDate:forceRebuildReason:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:", a3, a4, 0, 3, a5, 0, a6, a7, v10, a9);
}

+ (id)insertLightweightWithManagedObjectContext:(id)a3 index:(int64_t)a4 sourceModelVersion:(unint64_t)a5 migrationDate:(id)a6 hardwareModel:(id)a7 deviceUniqueID:(id)a8 cplEnabled:(BOOL)a9 initialSyncDate:(id)a10
{
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v26;

  v17 = (void *)MEMORY[0x1E0CB37E8];
  v18 = a10;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a3;
  objc_msgSend(v17, "numberWithUnsignedInteger:", a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = a9;
  objc_msgSend(a1, "insertIntoManagedObjectContext:index:sourceModelVersion:migrationType:migrationDate:forceRebuildReason:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:", v22, a4, v23, 2, v21, 0, v20, v19, v26, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)insertRebuildWithManagedObjectContext:(id)a3 index:(int64_t)a4 migrationDate:(id)a5 forceRebuildReason:(id)a6 hardwareModel:(id)a7 deviceUniqueID:(id)a8 cplEnabled:(BOOL)a9 initialSyncDate:(id)a10
{
  uint64_t v11;

  LOBYTE(v11) = a9;
  return (id)objc_msgSend(a1, "insertIntoManagedObjectContext:index:sourceModelVersion:migrationType:migrationDate:forceRebuildReason:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:", a3, a4, 0, 1, a5, a6, a7, a8, v11, a10);
}

+ (id)insertNoopWithManagedObjectContext:(id)a3 index:(int64_t)a4 migrationDate:(id)a5 hardwareModel:(id)a6 deviceUniqueID:(id)a7 cplEnabled:(BOOL)a8 initialSyncDate:(id)a9
{
  uint64_t v10;

  LOBYTE(v10) = a8;
  return (id)objc_msgSend(a1, "insertIntoManagedObjectContext:index:sourceModelVersion:migrationType:migrationDate:forceRebuildReason:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:", a3, a4, 0, 0, a5, 0, a6, a7, v10, a9);
}

+ (id)insertIntoManagedObjectContext:(id)a3 index:(int64_t)a4 sourceModelVersion:(id)a5 migrationType:(int64_t)a6 migrationDate:(id)a7 forceRebuildReason:(id)a8 hardwareModel:(id)a9 deviceUniqueID:(id)a10 cplEnabled:(BOOL)a11 initialSyncDate:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  __int16 v39;
  id v40;

  v39 = a6;
  v17 = a3;
  v18 = a5;
  v19 = a7;
  v20 = a8;
  v40 = a9;
  v21 = a10;
  v22 = a12;
  if (a4 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMigrationHistory.m"), 136, CFSTR("index must be greater than or equal to 0"));

  }
  +[PLManagedObject insertInManagedObjectContext:](PLMigrationHistory, "insertInManagedObjectContext:", v17, a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setIndex:", a4);
  objc_msgSend(v23, "setModelVersion:", +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion"));
  objc_msgSend(MEMORY[0x1E0D73188], "currentBuildVersionString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setOsVersion:", v24);

  v25 = v18;
  objc_msgSend(v23, "setSourceModelVersion:", v18);
  objc_msgSend(v23, "setMigrationType:", v39);
  v26 = v19;
  objc_msgSend(v23, "setMigrationDate:", v19);
  objc_msgSend(v23, "setForceRebuildReason:", v20);
  objc_msgSend(v17, "persistentStoreCoordinator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "persistentStores");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "metadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A08]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setStoreUUID:", v31);

  PLPhotoLibraryServicesBinaryImageUUID();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "UUIDString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrameworkUUID:", v33);

  +[PLGlobalKeyValue dictionaryWithManagedObjectContext:forMigrationHistory:](PLGlobalKeyValue, "dictionaryWithManagedObjectContext:forMigrationHistory:", v17, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "count"))
    v35 = v34;
  else
    v35 = 0;
  objc_msgSend(v23, "setGlobalKeyValues:", v35);
  objc_msgSend(v23, "setHardwareModel:", v40);
  objc_msgSend(v23, "setDeviceUniqueID:", v21);
  objc_msgSend(v23, "setInitialSyncDate:", v22);
  objc_msgSend(v23, "setCplEnabled:", a11);

  return v23;
}

+ (id)migrationHistoryWithManagedObjectContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C97B48];
  v4 = a3;
  +[PLMigrationHistory entityName](PLMigrationHistory, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("index"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v8);

  v13 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v6, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v13;
  if (!v9)
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Error fetching migration history: %@", buf, 0xCu);
    }

  }
  return v9;
}

+ (id)currentMigrationHistoryWithManagedObjectContext:(id)a3
{
  id v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v17;
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = 0;
  v19 = 0;
  v4 = +[PLMigrationHistory currentMigrationHistoryIndex:withManagedObjectContext:error:](PLMigrationHistory, "currentMigrationHistoryIndex:withManagedObjectContext:error:", &v19, v3, &v18);
  v5 = v18;
  if (!v4 || v19 < 0)
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Error querying current migration history index: %@", buf, 0xCu);
    }
    v14 = 0;
    v13 = v5;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C97B48];
    +[PLMigrationHistory entityName](PLMigrationHistory, "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("index"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPredicate:](v8, "setPredicate:", v11);

    v17 = v5;
    objc_msgSend(v3, "executeFetchRequest:error:", v8, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;

    if (v12)
    {
      objc_msgSend(v12, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLBackendGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v13;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Error fetching current migration history: %@", buf, 0xCu);
      }

      v14 = 0;
    }

  }
  return v14;
}

+ (BOOL)currentMigrationHistoryIndex:(int64_t *)a3 withManagedObjectContext:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int64_t v21;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB35D0];
  v8 = a4;
  objc_msgSend(v7, "expressionForKeyPath:", CFSTR("index"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB35D0];
  v24[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "expressionForFunction:arguments:", CFSTR("max:"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(v13, "setName:", CFSTR("maxIndex"));
  objc_msgSend(v13, "setExpression:", v12);
  objc_msgSend(v13, "setExpressionResultType:", 300);
  v14 = (void *)MEMORY[0x1E0C97B48];
  +[PLMigrationHistory entityName](PLMigrationHistory, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchRequestWithEntityName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setResultType:", 2);
  v23 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPropertiesToFetch:", v17);

  objc_msgSend(v8, "executeFetchRequest:error:", v16, a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "valueForKey:", CFSTR("maxIndex"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      v21 = objc_msgSend(v20, "longLongValue");
    else
      v21 = -1;
    *a3 = v21;

  }
  return v18 != 0;
}

+ (id)migrateLegacyMigrationHistoryWithMetadata:(id)a3 index:(int64_t)a4 outGlobalKeyValues:(id)a5 managedObjectContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
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
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (a4 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLMigrationHistory.m"), 212, CFSTR("index must be greater than 0"));

  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ImportedFileSystemAssets"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", _BOOLForKey(v11, (uint64_t)CFSTR("ImportedFileSystemAssets")));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("ImportedFileSystemAssets"));

    objc_msgSend(v11, "removeObjectForKey:", CFSTR("ImportedFileSystemAssets"));
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ImportedFileSystemAssetsDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    PLCompleteDateFormatter();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _dateForKey(v11, (uint64_t)CFSTR("ImportedFileSystemAssetsDate"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("ImportedFileSystemAssetsDate"));

    objc_msgSend(v11, "removeObjectForKey:", CFSTR("ImportedFileSystemAssetsDate"));
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLRebuildRequired"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (_BOOLForKey(v11, (uint64_t)CFSTR("PLRebuildRequired")))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("JournalRebuildRequired"));

    }
    objc_msgSend(v11, "removeObjectForKey:", CFSTR("PLRebuildRequired"));
  }
  PLCompleteDateFormatter();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _dateForKey(v11, (uint64_t)CFSTR("PLMigrationDate"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  _stringForKey(v11, (uint64_t)CFSTR("PLLibraryUpgradeType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lowercaseString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v25, "hasPrefix:", CFSTR("created")) & 1) != 0)
  {
    v26 = 3;
  }
  else if ((objc_msgSend(v25, "hasPrefix:", CFSTR("lightweight")) & 1) != 0)
  {
    v26 = 2;
  }
  else
  {
    v26 = objc_msgSend(v25, "hasPrefix:", CFSTR("rebuil"));
  }
  v48 = v12;
  if ((objc_msgSend(v25, "containsString:", CFSTR(" icloud restore")) & 1) != 0)
    v27 = 2;
  else
    v27 = objc_msgSend(v25, "containsString:", CFSTR(" itunes restore"));
  if (objc_msgSend(v25, "hasSuffix:", CFSTR("(forced)")))
    v28 = &unk_1E375D788;
  else
    v28 = 0;
  v47 = v13;
  +[PLManagedObject insertInManagedObjectContext:](PLMigrationHistory, "insertInManagedObjectContext:", v13);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setIndex:", a4);
  _numberForKey(v11, (uint64_t)CFSTR("PLModelVersion"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setModelVersion:", objc_msgSend(v30, "integerValue"));
  _numberForKey(v11, (uint64_t)CFSTR("PLMigrationSourceModelVersion"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSourceModelVersion:", v31);

  objc_msgSend(v29, "setMigrationType:", v26);
  objc_msgSend(v29, "setMigrationDate:", v23);
  _stringForKey(v11, (uint64_t)CFSTR("PLOSVersion"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", objc_msgSend(objc_retainAutorelease(v32), "UTF8String"));
    objc_msgSend(v29, "setOsVersion:", v33);

  }
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A08]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setStoreUUID:", v34);

  objc_msgSend(v29, "setForceRebuildReason:", v28);
  objc_msgSend(v29, "setOrigin:", v27);
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v14);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setGlobalKeyValues:", v35);

  }
  else
  {
    objc_msgSend(v29, "setGlobalKeyValues:", 0);
  }
  v36 = v48;
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("PLMigrationDate"));
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("PLLibraryUpgradeType"));
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("PLMigrationSourceModelVersion"));
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("PLOSVersion"));
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLGreenValues"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v37, CFSTR("GreenValues"));
    objc_msgSend(v11, "removeObjectForKey:", CFSTR("PLGreenValues"));
  }
  if (v48)
  {
    v46 = v30;
    v38 = v23;
    objc_msgSend(v48, "addEntriesFromDictionary:", v14);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ImportedFileSystemAssets"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "integerValue") == 1)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("JournalRebuildRequired"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "BOOLValue");

      if ((v41 & 1) != 0)
        goto LABEL_34;
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ImportedFileSystemAssetsDate"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v39, CFSTR("RebuildCompleteDate"));
    }

LABEL_34:
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D742E0]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "integerValue");

    v36 = v48;
    v23 = v38;
    v30 = v46;
    if (v43 == 1)
      objc_msgSend(v29, "setOrigin:", 5);
  }

  return v29;
}

+ (BOOL)recordCurrentMigrationStateInManagedObjectContext:(id)a3 withPathManager:(id)a4 migrationType:(int64_t)a5 forceRebuildReason:(id)a6 sourceModelVersion:(id)a7 updateLegacyMigrationState:(BOOL)a8 journalRebuildRequred:(BOOL)a9 origin:(signed __int16)a10 libraryCreateOptions:(unint64_t)a11 hardwareModel:(id)a12 deviceUniqueID:(id)a13 cplEnabled:(BOOL)a14 initialSyncDate:(id)a15
{
  _BOOL4 v15;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  id v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t *v47;
  int64_t v48;
  id v49;
  unint64_t v50;
  signed __int16 v51;
  BOOL v52;
  BOOL v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint8_t buf[4];
  const char *v59;
  uint64_t v60;

  v15 = a8;
  v60 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v21 = a4;
  v22 = a6;
  v23 = a7;
  v24 = a12;
  v35 = a13;
  v25 = a15;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 1;
  objc_msgSend(v20, "persistentStoreCoordinator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "persistentStores");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "metadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    v36 = (void *)objc_msgSend(v28, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v30, CFSTR("PLModelVersion"));

    if (v15)
      objc_msgSend(v36, "setObject:forKeyedSubscript:", &unk_1E375D7A0, *MEMORY[0x1E0D742E0]);
    objc_msgSend(v37, "setMetadata:", v36);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __273__PLMigrationHistory_recordCurrentMigrationStateInManagedObjectContext_withPathManager_migrationType_forceRebuildReason_sourceModelVersion_updateLegacyMigrationState_journalRebuildRequred_origin_libraryCreateOptions_hardwareModel_deviceUniqueID_cplEnabled_initialSyncDate___block_invoke;
    v38[3] = &unk_1E3661EE0;
    v39 = v21;
    v48 = a5;
    v49 = a1;
    v40 = v20;
    v47 = &v54;
    v41 = v22;
    v42 = v24;
    v43 = v35;
    v52 = a14;
    v44 = v25;
    v51 = a10;
    v53 = a9;
    v45 = v23;
    v50 = a11;
    v46 = v29;
    objc_msgSend(v40, "performBlockAndWait:", v38);

    v31 = *((_BYTE *)v55 + 24) != 0;
  }
  else
  {
    PLMigrationGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v59 = "+[PLMigrationHistory recordCurrentMigrationStateInManagedObjectContext:withPathManager:migrationType:forceRe"
            "buildReason:sourceModelVersion:updateLegacyMigrationState:journalRebuildRequred:origin:libraryCreateOptions:"
            "hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:]";
      _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Failed to get store metadata: %{public}s", buf, 0xCu);
    }

    v31 = 0;
    *((_BYTE *)v55 + 24) = 0;
  }

  _Block_object_dispose(&v54, 8);
  return v31;
}

+ (int64_t)_rebuildMigrationHistoryWithJournal:(id)a3 managedObjectContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  char v13;
  NSObject *v14;
  int64_t v15;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = -1;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__PLMigrationHistory__rebuildMigrationHistoryWithJournal_managedObjectContext___block_invoke;
  v19[3] = &unk_1E3661F08;
  v7 = v6;
  v20 = v7;
  v21 = &v22;
  v18 = 0;
  v8 = objc_msgSend(v5, "enumeratePayloadsUsingBlock:error:", v19, &v18);
  v9 = v18;
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    v11 = v9;
    goto LABEL_13;
  }
  if (!PLIsErrorEqualToCode())
  {
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v27 = "+[PLMigrationHistory _rebuildMigrationHistoryWithJournal:managedObjectContext:]";
      v28 = 2112;
      v29 = v10;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to read MigrationHistory journal: %{public}s, %@", buf, 0x16u);
    }
    v11 = v10;
    goto LABEL_12;
  }
  PLMigrationGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v27 = "+[PLMigrationHistory _rebuildMigrationHistoryWithJournal:managedObjectContext:]";
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Not rebuilding MigrationHistory due to too new payload version in the journal: %{public}s, %@", buf, 0x16u);
  }

  v17 = v10;
  v13 = objc_msgSend(v5, "createSnapshotUsingNextPayloadBlock:createOnlyIfNecessary:error:", &__block_literal_global_7631, 0, &v17);
  v11 = v17;

  if ((v13 & 1) == 0)
  {
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v27 = "+[PLMigrationHistory _rebuildMigrationHistoryWithJournal:managedObjectContext:]";
      v28 = 2112;
      v29 = v11;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to snapshot empty MigrationHistory journal: %{public}s, %@", buf, 0x16u);
    }
LABEL_12:

  }
LABEL_13:

  v15 = v23[3];
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __79__PLMigrationHistory__rebuildMigrationHistoryWithJournal_managedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "insertMigrationHistoryFromDataInManagedObjectContext:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "index") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "index");

}

uint64_t __79__PLMigrationHistory__rebuildMigrationHistoryWithJournal_managedObjectContext___block_invoke_67()
{
  return 0;
}

void __273__PLMigrationHistory_recordCurrentMigrationStateInManagedObjectContext_withPathManager_migrationType_forceRebuildReason_sourceModelVersion_updateLegacyMigrationState_journalRebuildRequred_origin_libraryCreateOptions_hardwareModel_deviceUniqueID_cplEnabled_initialSyncDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  PLJournal *v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  __int16 v21;
  void *v22;
  char v23;
  id v24;
  PLJournalEntry *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  NSObject *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v36 = -1;
  v2 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(*(id *)(a1 + 32), "photoDirectoryWithType:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", v4, objc_opt_class());
  if (*(_QWORD *)(a1 + 104) == 2)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v35 = 0;
    v7 = +[PLMigrationHistory currentMigrationHistoryIndex:withManagedObjectContext:error:](PLMigrationHistory, "currentMigrationHistoryIndex:withManagedObjectContext:error:", &v36, v6, &v35);
    v8 = v35;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v7;
  }
  else
  {
    v8 = 0;
    v36 = objc_msgSend(*(id *)(a1 + 112), "_rebuildMigrationHistoryWithJournal:managedObjectContext:", v5, *(_QWORD *)(a1 + 40));
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    v9 = ++v36;
    switch(*(_QWORD *)(a1 + 104))
    {
      case 0:
        v10 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLMigrationHistory insertNoopWithManagedObjectContext:index:migrationDate:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:](PLMigrationHistory, "insertNoopWithManagedObjectContext:index:migrationDate:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:", v10, v9, v11, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 130), *(_QWORD *)(a1 + 72));
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 1:
        v14 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v32) = *(_BYTE *)(a1 + 130);
        +[PLMigrationHistory insertRebuildWithManagedObjectContext:index:migrationDate:forceRebuildReason:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:](PLMigrationHistory, "insertRebuildWithManagedObjectContext:index:migrationDate:forceRebuildReason:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:", v14, v9, v11, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v32, *(_QWORD *)(a1 + 72));
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 2:
        v15 = *(_QWORD *)(a1 + 40);
        v16 = objc_msgSend(*(id *)(a1 + 80), "integerValue");
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v32) = *(_BYTE *)(a1 + 130);
        +[PLMigrationHistory insertLightweightWithManagedObjectContext:index:sourceModelVersion:migrationDate:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:](PLMigrationHistory, "insertLightweightWithManagedObjectContext:index:sourceModelVersion:migrationDate:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:", v15, v9, v16, v17, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v32, *(_QWORD *)(a1 + 72));
        v13 = objc_claimAutoreleasedReturnValue();

        break;
      case 3:
        v18 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLMigrationHistory insertCreatedWithManagedObjectContext:index:migrationDate:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:](PLMigrationHistory, "insertCreatedWithManagedObjectContext:index:migrationDate:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:", v18, v9, v11, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 130), *(_QWORD *)(a1 + 72));
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v13 = v12;

        break;
      default:
        PLMigrationGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = *(const char **)(a1 + 104);
          *(_DWORD *)buf = 134217984;
          v39 = v20;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Unsupported migrationType: %ld", buf, 0xCu);
        }

        v13 = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
        break;
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    {
      v21 = *(_WORD *)(a1 + 128);
      if (!v21)
      {
        if (*(_QWORD *)(a1 + 104) != 3 || v36 < 1)
          goto LABEL_22;
        v21 = 6;
      }
      -[NSObject setOrigin:](v13, "setOrigin:", v21);
LABEL_22:
      if (*(_BYTE *)(a1 + 131))
        +[PLGlobalValues setJournalRebuildRequired:managedObjectContext:](PLGlobalValues, "setJournalRebuildRequired:managedObjectContext:", 1, *(_QWORD *)(a1 + 40));
      +[PLGlobalValues setLibraryCreateOptions:managedObjectContext:](PLGlobalValues, "setLibraryCreateOptions:managedObjectContext:", *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 40));
      v22 = *(void **)(a1 + 40);
      v34 = v8;
      v23 = objc_msgSend(v22, "save:", &v34);
      v24 = v34;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v23;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
      {
        v25 = [PLJournalEntry alloc];
        -[NSObject payloadForChangedKeys:](v13, "payloadForChangedKeys:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[PLJournalEntry initForInsertWithPayload:](v25, "initForInsertWithPayload:", v26);

        v37 = v27;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v24;
        v29 = -[PLJournal appendChangeEntries:error:](v5, "appendChangeEntries:error:", v28, &v33);
        v8 = v33;

        if (!v29)
        {
          PLMigrationGetLog();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            v39 = "+[PLMigrationHistory recordCurrentMigrationStateInManagedObjectContext:withPathManager:migrationType:f"
                  "orceRebuildReason:sourceModelVersion:updateLegacyMigrationState:journalRebuildRequred:origin:libraryCr"
                  "eateOptions:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:]_block_invoke";
            v40 = 2114;
            v41 = v8;
            _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "Failed to update MigrationHistory journal: %{public}s, %{public}@", buf, 0x16u);
          }

        }
      }
      else
      {
        PLMigrationGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v31 = *(_QWORD *)(a1 + 88);
          *(_DWORD *)buf = 136446722;
          v39 = "+[PLMigrationHistory recordCurrentMigrationStateInManagedObjectContext:withPathManager:migrationType:for"
                "ceRebuildReason:sourceModelVersion:updateLegacyMigrationState:journalRebuildRequred:origin:libraryCreate"
                "Options:hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:]_block_invoke";
          v40 = 2114;
          v41 = v24;
          v42 = 2114;
          v43 = v31;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Failed to save store metadata: %{public}s, error: %{public}@, metadata:%{public}@", buf, 0x20u);
        }
        v8 = v24;
      }

    }
  }
  else
  {
    PLMigrationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v39 = "+[PLMigrationHistory recordCurrentMigrationStateInManagedObjectContext:withPathManager:migrationType:forceRe"
            "buildReason:sourceModelVersion:updateLegacyMigrationState:journalRebuildRequred:origin:libraryCreateOptions:"
            "hardwareModel:deviceUniqueID:cplEnabled:initialSyncDate:]_block_invoke";
      v40 = 2114;
      v41 = v8;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to query next migration history index: %{public}s, %{public}@", buf, 0x16u);
    }
  }

}

- (id)payloadID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), -[PLMigrationHistory index](self, "index"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithString:](PLJournalEntryPayloadIDFactory, "payloadIDWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)payloadIDForTombstone:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("index"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithString:](PLJournalEntryPayloadIDFactory, "payloadIDWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  PLMigrationHistoryJournalEntryPayload *v5;

  v4 = a3;
  v5 = -[PLManagedObjectJournalEntryPayload initWithManagedObject:changedKeys:]([PLMigrationHistoryJournalEntryPayload alloc], "initWithManagedObject:changedKeys:", self, v4);

  return v5;
}

@end
