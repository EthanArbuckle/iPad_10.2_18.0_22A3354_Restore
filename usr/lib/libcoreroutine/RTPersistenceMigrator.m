@implementation RTPersistenceMigrator

- (RTPersistenceMigrator)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithStore_modelProvider_delegate_);
}

- (RTPersistenceMigrator)initWithStore:(id)a3 modelProvider:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  RTPersistenceMigrator *v12;
  RTPersistenceMigrator *v13;
  RTPersistenceMigrator *v14;
  NSObject *v15;
  const char *v16;
  objc_super v18;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: store";
LABEL_13:
    _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_14;
  }
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: modelProvider";
    goto LABEL_13;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v16 = "Invalid parameter not satisfying: delegate";
      goto LABEL_13;
    }
LABEL_14:

    v14 = 0;
    goto LABEL_15;
  }
  v18.receiver = self;
  v18.super_class = (Class)RTPersistenceMigrator;
  v12 = -[RTPersistenceMigrator init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_store, v8);
    objc_storeWeak((id *)&v13->_modelProvider, v9);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v13->_state = 0;
    v13->_didVacuumStore = 0;
  }
  self = v13;
  v14 = self;
LABEL_15:

  return v14;
}

- (unint64_t)status
{
  unint64_t v3;

  if ((-[RTPersistenceMigrator state](self, "state") & 0x8000000000000000) != 0)
    return 1;
  v3 = -[RTPersistenceMigrator state](self, "state");
  if (v3 == 10)
    return 3;
  else
    return 2 * (v3 == 9);
}

- (unint64_t)run
{
  -[RTPersistenceMigrator _attemptMigration](self, "_attemptMigration");
  return -[RTPersistenceMigrator status](self, "status");
}

- (id)_coordinatorForModel:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSPersistentStoreCoordinator *v7;
  NSPersistentStoreCoordinator *cachedCoordinator;
  NSPersistentStoreCoordinator *v9;

  v4 = a3;
  -[NSPersistentStoreCoordinator managedObjectModel](self->_cachedCoordinator, "managedObjectModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if ((v6 & 1) == 0)
  {
    v7 = (NSPersistentStoreCoordinator *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v4);
    cachedCoordinator = self->_cachedCoordinator;
    self->_cachedCoordinator = v7;

  }
  v9 = self->_cachedCoordinator;

  return v9;
}

- (void)_attemptMigration
{
  id WeakRetained;
  id v4;
  id v5;
  NSDate *v6;
  NSDate *migrationStartDate;
  unint64_t state;
  unint64_t v9;
  BOOL v10;
  NSDate *v11;
  NSDate *migrationEndDate;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!-[RTPersistenceMigrator status](self, "status") || -[RTPersistenceMigrator status](self, "status") == 1)
  {
    self->_state &= ~0x8000000000000000;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = objc_loadWeakRetained((id *)&self->_store);
    if (!v4)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v17 = 136315394;
        v18 = "-[RTPersistenceMigrator _attemptMigration]";
        v19 = 1024;
        v20 = 116;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Migrator cannot run without a store. (in %s:%d)", (uint8_t *)&v17, 0x12u);
      }

      if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), -10000, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "persistenceStore:failedWithError:", 0, v14);

      }
      -[RTPersistenceMigrator setState:](self, "setState:", 10);
      goto LABEL_30;
    }
    v5 = objc_loadWeakRetained((id *)&self->_modelProvider);
    if (v5)
    {
      if (WeakRetained)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
        migrationStartDate = self->_migrationStartDate;
        self->_migrationStartDate = v6;

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "persistenceMigrator:didStartMigratingStore:withModelProvider:", self, v4, v5);
        state = self->_state;
        do
        {
          -[RTPersistenceMigrator _executeSingleMigrationStep](self, "_executeSingleMigrationStep");
          v9 = self->_state;
          if ((v9 & 0x8000000000000000) != 0)
            break;
          v10 = v9 == state;
          state = self->_state;
        }
        while (!v10);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
        migrationEndDate = self->_migrationEndDate;
        self->_migrationEndDate = v11;

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "persistenceMigrator:didFinishMigratingStore:withModelProvider:", self, v4, v5);
        goto LABEL_29;
      }
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = 136315394;
        v18 = "-[RTPersistenceMigrator _attemptMigration]";
        v19 = 1024;
        v20 = 142;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Migrator cannot run without a delegate. (in %s:%d)", (uint8_t *)&v17, 0x12u);
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = 136315394;
        v18 = "-[RTPersistenceMigrator _attemptMigration]";
        v19 = 1024;
        v20 = 130;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Migrator cannot run without a modelProvider. (in %s:%d)", (uint8_t *)&v17, 0x12u);
      }

      if (!WeakRetained || (objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_28;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), -9999, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "persistenceStore:failedWithError:", v4, v16);
    }

LABEL_28:
    -[RTPersistenceMigrator setState:](self, "setState:", 10);
LABEL_29:

LABEL_30:
  }
}

- (void)_executeSingleMigrationStep
{
  unint64_t v3;
  unint64_t v4;

  switch(-[RTPersistenceMigrator state](self, "state"))
  {
    case 0uLL:
      v3 = -[RTPersistenceMigrator _executeOpenStep](self, "_executeOpenStep");
      goto LABEL_13;
    case 1uLL:
      v3 = -[RTPersistenceMigrator _executeVacuumStep](self, "_executeVacuumStep");
      goto LABEL_13;
    case 2uLL:
      v3 = -[RTPersistenceMigrator _executePrepareStep](self, "_executePrepareStep");
      goto LABEL_13;
    case 3uLL:
      v3 = -[RTPersistenceMigrator _executeCacheStep](self, "_executeCacheStep");
      goto LABEL_13;
    case 4uLL:
      v3 = -[RTPersistenceMigrator _executeMigrateStep](self, "_executeMigrateStep");
      goto LABEL_13;
    case 5uLL:
      v3 = -[RTPersistenceMigrator _executeDestroyStep](self, "_executeDestroyStep");
      goto LABEL_13;
    case 6uLL:
      v3 = -[RTPersistenceMigrator _executeRecreateStep](self, "_executeRecreateStep");
      goto LABEL_13;
    case 7uLL:
      v3 = -[RTPersistenceMigrator _executeRekeyStep](self, "_executeRekeyStep");
      goto LABEL_13;
    case 8uLL:
      v3 = -[RTPersistenceMigrator _executeImportStep](self, "_executeImportStep");
      goto LABEL_13;
    case 9uLL:
    case 10uLL:
      v3 = -[RTPersistenceMigrator state](self, "state");
LABEL_13:
      v4 = v3;
      break;
    default:
      v4 = 0;
      break;
  }
  -[RTPersistenceMigrator setState:](self, "setState:", v4);
}

- (unint64_t)_executeOpenStep
{
  id WeakRetained;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v4 = objc_loadWeakRetained((id *)&self->_delegate);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(WeakRetained, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = (uint64_t)v7;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "store, %@, migration step, open", buf, 0xCu);

  }
  v8 = objc_loadWeakRetained((id *)&self->_modelProvider);
  objc_msgSend(v8, "latestModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTPersistenceMigrator _coordinatorForModel:](self, "_coordinatorForModel:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(WeakRetained, "addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:", v10, 0, 0, 0, &v17);
  v11 = v17;
  v12 = v11;
  if (v11)
  {
    v13 = 0;
    switch(objc_msgSend(v11, "code"))
    {
      case 0:
      case 3:
        v13 = 0x8000000000000005;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v4, "persistenceStore:failedWithError:", WeakRetained, v12);
        break;
      case 1:
        break;
      case 2:
        v13 = 0x8000000000000003;
        break;
      default:
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v16 = objc_msgSend(v12, "code");
          *(_DWORD *)buf = 134218498;
          v19 = v16;
          v20 = 2080;
          v21 = "-[RTPersistenceMigrator _executeOpenStep]";
          v22 = 1024;
          v23 = 249;
          _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
        }

        v13 = 0x8000000000000000;
        break;
    }
  }
  else
  {
    v13 = 0x8000000000000001;
  }

  return v13;
}

- (unint64_t)_executeVacuumStep
{
  id WeakRetained;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v29;
  int v30;
  NSObject *v31;
  int v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v4 = objc_loadWeakRetained((id *)&self->_modelProvider);
  v5 = objc_loadWeakRetained((id *)&self->_delegate);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(WeakRetained, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v50 = (uint64_t)v8;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "store, %@, migration step, vacuum", buf, 0xCu);

  }
  objc_msgSend(v4, "latestModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceMigrator _coordinatorForModel:](self, "_coordinatorForModel:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(WeakRetained, "retrieveMetadataWithCoordinator:error:", v10, &v46);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v46;
  if (v11)
    v13 = v11;
  else
    v13 = (void *)MEMORY[0x1E0C9AA70];
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  if (!v12)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("RTPersistentStoreMetadataStoreCorruptKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "BOOLValue");

    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), 3, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "persistenceStore:failedWithError:", WeakRetained, v12);
      goto LABEL_23;
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("RTPersistentStoreMetadataStoreTransactionHistorySizeExceededKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");

    if (v21)
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      -[RTPersistenceMigrator store](self, "store");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "storeBaseName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("Store %@ exceeded maximum transaction history size."), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v50 = (uint64_t)v25;
        _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }

      v47 = *MEMORY[0x1E0CB2D50];
      v48 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), -9997, v27);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "persistenceStore:failedWithError:", WeakRetained, v12);

      goto LABEL_23;
    }
    if (v5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(WeakRetained, "storeBaseName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("Cloud"));

        if (v30)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = objc_msgSend(v5, "shouldResetCloudStore");
            v33 = CFSTR("NO");
            if (v32)
              v33 = CFSTR("YES");
            *(_DWORD *)buf = 138412290;
            v50 = (uint64_t)v33;
            _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_DEFAULT, "force destroy the cloud store for testing only, %@", buf, 0xCu);
          }

          if (objc_msgSend(v5, "shouldResetCloudStore"))
          {
            objc_msgSend(v5, "setShouldResetCloudStore:", 0);
            v12 = 0;
LABEL_23:
            v16 = 5;
            goto LABEL_24;
          }
        }
      }
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("RTPersistentStoreMetadataLastVacuumDateKey"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v34)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[RTPersistenceMigrator __executeVacuumStepWithStore:coordinator:delegate:vacuumDate:](self, "__executeVacuumStepWithStore:coordinator:delegate:vacuumDate:", WeakRetained, v10, v5, v35);
      v12 = 0;
      goto LABEL_52;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1209600.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v34;
    objc_msgSend(v34, "earlierDate:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isEqualToDate:", v35);

    if ((v37 & 1) != 0)
    {
      v12 = 0;
      v16 = 8;
      v34 = v45;
LABEL_52:

      goto LABEL_24;
    }
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v9);
    objc_msgSend(WeakRetained, "performVacuumWithCoordinator:error:");
    v38 = 0;
    v12 = v38;
    if (v38)
    {
      v39 = objc_msgSend(v38, "code");
      v34 = v45;
      if ((unint64_t)(v39 - 2) < 2)
      {
LABEL_43:
        if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v5, "persistenceStore:failedWithError:", WeakRetained, v12);
        v16 = 5;
        goto LABEL_51;
      }
      v16 = v39;
      if (v39 != 1)
      {
        if (v39)
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v43 = objc_msgSend(v12, "code");
            *(_DWORD *)buf = 134218498;
            v50 = v43;
            v51 = 2080;
            v52 = "-[RTPersistenceMigrator _executeVacuumStep]";
            v53 = 1024;
            v54 = 356;
            _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
          }

          v16 = 1;
          goto LABEL_51;
        }
        goto LABEL_43;
      }
    }
    else
    {
      self->_didVacuumStore = 1;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[RTPersistenceMigrator __executeVacuumStepWithStore:coordinator:delegate:vacuumDate:](self, "__executeVacuumStepWithStore:coordinator:delegate:vacuumDate:", WeakRetained, v10, v5, v40);

      v34 = v45;
    }
LABEL_51:

    goto LABEL_52;
  }
  v15 = objc_msgSend(v12, "code");
  if ((unint64_t)(v15 - 2) < 2)
    goto LABEL_15;
  v16 = v15;
  if (v15 == 1)
    goto LABEL_24;
  if (!v15)
    goto LABEL_15;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v41 = objc_msgSend(v12, "code");
    *(_DWORD *)buf = 134218498;
    v50 = v41;
    v51 = 2080;
    v52 = "-[RTPersistenceMigrator _executeVacuumStep]";
    v53 = 1024;
    v54 = 285;
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
  }

  v16 = 1;
LABEL_24:

  return v16;
}

- (unint64_t)__executeVacuumStepWithStore:(id)a3 coordinator:(id)a4 delegate:(id)a5 vacuumDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t v18;
  const char *v19;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: store";
LABEL_15:
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_16;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: coordinator";
    goto LABEL_15;
  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: delegate";
    goto LABEL_15;
  }
  if (v12)
  {
    v31 = CFSTR("RTPersistentStoreMetadataLastVacuumDateKey");
    v32[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v15 = objc_msgSend(v9, "updateMetadata:coordinator:error:", v14, v10, &v24);
    v16 = v24;
    v17 = v16;
    if ((v15 & 1) != 0)
    {
      v18 = 8;
LABEL_27:

      goto LABEL_17;
    }
    v21 = -[NSObject code](v16, "code");
    if ((unint64_t)(v21 - 2) >= 2)
    {
      v18 = v21;
      if (v21 == 1)
        goto LABEL_27;
      if (v21)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = -[NSObject code](v17, "code");
          *(_DWORD *)buf = 134218498;
          v26 = v23;
          v27 = 2080;
          v28 = "-[RTPersistenceMigrator __executeVacuumStepWithStore:coordinator:delegate:vacuumDate:]";
          v29 = 1024;
          v30 = 402;
          _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
        }

        v18 = 1;
        goto LABEL_27;
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "persistenceStore:failedWithError:", v9, v17);
    v18 = 5;
    goto LABEL_27;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: vacuumDate";
    goto LABEL_15;
  }
LABEL_16:
  v18 = 8;
LABEL_17:

  return v18;
}

- (unint64_t)_executePrepareStep
{
  id WeakRetained;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  id v25;
  void *v26;
  NSObject *v27;
  uint64_t v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v4 = objc_loadWeakRetained((id *)&self->_delegate);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(WeakRetained, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = (uint64_t)v7;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "store, %@, migration step, prepare", buf, 0xCu);

  }
  v8 = objc_loadWeakRetained((id *)&self->_modelProvider);
  objc_msgSend(v8, "latestModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTPersistenceMigrator _coordinatorForModel:](self, "_coordinatorForModel:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(WeakRetained, "retrieveMetadataWithCoordinator:error:", v10, &v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v31;
  if (!v12)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("RTPersistentStoreMetadataAppleIDsKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v4, "store:validateAppleIDs:", WeakRetained, v17);

      if ((v18 & 1) != 0)
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
        objc_msgSend(v19, "setPersistentStoreCoordinator:", v10);
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "processName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setName:", v21);

        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "processName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setTransactionAuthor:", v23);

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v30 = 0;
          v24 = objc_msgSend(v4, "prepareStore:withContext:error:", WeakRetained, v19, &v30);
          v25 = v30;
          v13 = v25;
          if (!v24 || v25)
          {
            if (!v4 || (objc_opt_respondsToSelector() & 1) == 0)
            {
              v15 = 5;
              goto LABEL_29;
            }
            v26 = v13;
            goto LABEL_21;
          }
        }
        else
        {
          v13 = 0;
        }
        v15 = 7;
        goto LABEL_29;
      }
    }
    if (!v4 || (objc_opt_respondsToSelector() & 1) == 0)
    {
      v13 = 0;
      v15 = 5;
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), -9998, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v19 = v13;
LABEL_21:
    objc_msgSend(v4, "persistenceStore:failedWithError:", WeakRetained, v13);
    v15 = 5;
    v13 = v26;
LABEL_29:

    goto LABEL_30;
  }
  v13 = v12;
  v14 = objc_msgSend(v12, "code");
  if ((unint64_t)(v14 - 2) >= 2)
  {
    if (v14 != 1)
    {
      if (!v14)
        goto LABEL_7;
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v29 = objc_msgSend(v13, "code");
        *(_DWORD *)buf = 134218498;
        v33 = v29;
        v34 = 2080;
        v35 = "-[RTPersistenceMigrator _executePrepareStep]";
        v36 = 1024;
        v37 = 437;
        _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
      }

    }
    v15 = 2;
    goto LABEL_31;
  }
LABEL_7:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "persistenceStore:failedWithError:", WeakRetained, v13);
  v15 = 5;
LABEL_31:

  return v15;
}

- (unint64_t)_executeRekeyStep
{
  return 9;
}

- (unint64_t)_executeCacheStep
{
  id WeakRetained;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSManagedObjectModel *v14;
  uint64_t v15;
  unint64_t v16;
  NSManagedObjectModel *nextModel;
  NSObject *v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v4 = objc_loadWeakRetained((id *)&self->_modelProvider);
  v5 = objc_loadWeakRetained((id *)&self->_delegate);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(WeakRetained, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v23 = (uint64_t)v8;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "store, %@, migration step, cache", buf, 0xCu);

  }
  v21 = 0;
  objc_msgSend(WeakRetained, "cachedModelWithError:", &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v4, "modelFollowingModel:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend(v4, "latestModel");
      v14 = (NSManagedObjectModel *)objc_claimAutoreleasedReturnValue();
    }
    nextModel = self->_nextModel;
    self->_nextModel = v14;

    v16 = 4;
    goto LABEL_14;
  }
  v15 = objc_msgSend(v10, "code");
  if ((unint64_t)(v15 - 2) >= 2)
  {
    if (v15 != 1)
    {
      if (!v15)
        goto LABEL_9;
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_msgSend(v11, "code");
        *(_DWORD *)buf = 134218498;
        v23 = v20;
        v24 = 2080;
        v25 = "-[RTPersistenceMigrator _executeCacheStep]";
        v26 = 1024;
        v27 = 579;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
      }

    }
    v16 = 3;
    goto LABEL_14;
  }
LABEL_9:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "persistenceStore:failedWithError:", WeakRetained, v11);
  v16 = 5;
LABEL_14:

  return v16;
}

- (unint64_t)_executeMigrateStep
{
  id WeakRetained;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  char v14;
  NSManagedObjectModel *v15;
  NSManagedObjectModel *nextModel;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v4 = objc_loadWeakRetained((id *)&self->_modelProvider);
  v5 = objc_loadWeakRetained((id *)&self->_delegate);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(WeakRetained, "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = (uint64_t)v8;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "store, %@, migration step, migrate", buf, 0xCu);

  }
  if (!self->_nextModel)
  {
    v10 = 0;
    v9 = 0;
    v11 = 1;
    goto LABEL_23;
  }
  v9 = 0;
  v10 = 0;
  v11 = 1;
  while (1)
  {
    v12 = v10;
    v13 = v9;
    -[RTPersistenceMigrator _coordinatorForModel:](self, "_coordinatorForModel:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v12;
    v14 = objc_msgSend(WeakRetained, "addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:", v9, 1, 0, 0, &v22);
    v10 = v22;

    if ((v14 & 1) == 0)
      break;
    objc_msgSend(v4, "modelFollowingModel:", self->_nextModel);
    v15 = (NSManagedObjectModel *)objc_claimAutoreleasedReturnValue();
    nextModel = self->_nextModel;
    self->_nextModel = v15;

    if (!self->_nextModel)
      goto LABEL_23;
  }
  if (!v10)
    goto LABEL_22;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v24 = (uint64_t)v10;
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "error while adding store to coordinator during migrate step, %@", buf, 0xCu);
  }

  v18 = objc_msgSend(v10, "code");
  if ((unint64_t)(v18 - 2) < 2)
    goto LABEL_15;
  if (v18 == 1)
  {
LABEL_22:
    v11 = 4;
    goto LABEL_23;
  }
  if (v18)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = objc_msgSend(v10, "code");
      *(_DWORD *)buf = 134218498;
      v24 = v21;
      v25 = 2080;
      v26 = "-[RTPersistenceMigrator _executeMigrateStep]";
      v27 = 1024;
      v28 = 624;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
    }

    goto LABEL_22;
  }
LABEL_15:
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "persistenceStore:failedWithError:", WeakRetained, v10);
  v11 = 5;
LABEL_23:

  return v11;
}

- (unint64_t)_executeDestroyStep
{
  id WeakRetained;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v4 = objc_loadWeakRetained((id *)&self->_delegate);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(WeakRetained, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = (uint64_t)v7;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "store, %@, migration step, destroy", buf, 0xCu);

  }
  v8 = objc_loadWeakRetained((id *)&self->_modelProvider);
  objc_msgSend(v8, "latestModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTPersistenceMigrator _coordinatorForModel:](self, "_coordinatorForModel:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v11 = objc_msgSend(WeakRetained, "removeFromCoordinator:error:", v10, &v34);
  v12 = v34;
  v13 = v12;
  if (v11 && !v12)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v33 = 0;
      objc_msgSend(v4, "backupPersistenceStore:error:", WeakRetained, &v33);
      v14 = v33;
      if (v14)
      {
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = (uint64_t)v14;
          _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "error while backing up store files, %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v14 = 0;
    }
    v32 = 0;
    v18 = objc_msgSend(WeakRetained, "destroyWithCoordinator:error:", v10, &v32);
    v19 = v32;
    v20 = v19;
    if (!v18 || v19)
    {
      v21 = objc_msgSend(v19, "code");
      if ((unint64_t)(v21 - 2) >= 2 && v21)
      {
        if (v21 == 1)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v4, "persistenceStore:failedWithError:", WeakRetained, v20);
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            v30 = objc_msgSend(v20, "code");
            *(_DWORD *)buf = 134218498;
            v36 = v30;
            v37 = 2080;
            v38 = "-[RTPersistenceMigrator _executeDestroyStep]";
            v39 = 1024;
            v40 = 721;
            _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
          }

        }
        v17 = 5;
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v36 = (uint64_t)v20;
          _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "error while attempting to destroy with coordinator, %@", buf, 0xCu);
        }

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v4, "persistenceStore:failedWithError:", WeakRetained, v20);
        objc_msgSend(WeakRetained, "URL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        objc_msgSend(WeakRetained, "removeStoreAtURL:error:", v23, &v31);
        v24 = v31;

        if (v24 && objc_msgSend(v24, "code") != 0x7FFFFFFFFFFFFFFFLL)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v36 = (uint64_t)v24;
            _os_log_error_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_ERROR, "error while forcing file unlink, %@", buf, 0xCu);
          }

          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v4, "persistenceStore:failedWithError:", WeakRetained, v24);
          v17 = 10;
        }
        else
        {
          v17 = 6;
        }

      }
    }
    else
    {
      v17 = 6;
    }

    goto LABEL_47;
  }
  v16 = objc_msgSend(v12, "code");
  if ((unint64_t)(v16 - 2) >= 2)
  {
    if (v16 != 1)
    {
      if (!v16)
        goto LABEL_13;
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v29 = objc_msgSend(v13, "code");
        *(_DWORD *)buf = 134218498;
        v36 = v29;
        v37 = 2080;
        v38 = "-[RTPersistenceMigrator _executeDestroyStep]";
        v39 = 1024;
        v40 = 664;
        _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
      }

    }
    v17 = 5;
    goto LABEL_47;
  }
LABEL_13:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "persistenceStore:failedWithError:", WeakRetained, v13);
  v17 = 10;
LABEL_47:

  return v17;
}

- (unint64_t)_executeRecreateStep
{
  id WeakRetained;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v4 = objc_loadWeakRetained((id *)&self->_delegate);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(WeakRetained, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = (uint64_t)v7;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "store, %@, migration step, recreate", buf, 0xCu);

  }
  v8 = objc_loadWeakRetained((id *)&self->_modelProvider);
  objc_msgSend(v8, "latestModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTPersistenceMigrator _coordinatorForModel:](self, "_coordinatorForModel:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v11 = objc_msgSend(WeakRetained, "addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:", v10, 0, 0, 0, &v30);
  v12 = v30;
  v13 = v12;
  if (v11 && !v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "appleIDsForStore:", WeakRetained);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "count"))
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("RTPersistentStoreMetadataAppleIDsKey"));

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("RTPersistentStoreMetadataLastVacuumDateKey"));

    v29 = 0;
    v18 = objc_msgSend(WeakRetained, "updateMetadata:coordinator:error:", v14, v10, &v29);
    v19 = v29;
    v20 = v19;
    if (v18 && !v19)
    {
      v21 = 8;
LABEL_33:

      goto LABEL_34;
    }
    v23 = objc_msgSend(v19, "code");
    if ((unint64_t)(v23 - 2) >= 2)
    {
      if (v23 != 1)
      {
        if (!v23)
          goto LABEL_21;
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v28 = objc_msgSend(v20, "code");
          *(_DWORD *)buf = 134218498;
          v32 = v28;
          v33 = 2080;
          v34 = "-[RTPersistenceMigrator _executeRecreateStep]";
          v35 = 1024;
          v36 = 792;
          _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
        }

      }
      v21 = 6;
      goto LABEL_33;
    }
LABEL_21:
    if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "persistenceStore:failedWithError:", WeakRetained, v20);
    v21 = 10;
    goto LABEL_33;
  }
  v22 = objc_msgSend(v12, "code");
  if ((unint64_t)(v22 - 2) < 2)
    goto LABEL_15;
  if (v22 == 1)
  {
LABEL_28:
    v21 = 6;
    goto LABEL_34;
  }
  if (v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v27 = objc_msgSend(v13, "code");
      *(_DWORD *)buf = 134218498;
      v32 = v27;
      v33 = 2080;
      v34 = "-[RTPersistenceMigrator _executeRecreateStep]";
      v35 = 1024;
      v36 = 759;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
    }

    goto LABEL_28;
  }
LABEL_15:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "persistenceStore:failedWithError:", WeakRetained, v13);
  v21 = 10;
LABEL_34:

  return v21;
}

- (unint64_t)_executeImportStep
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  RTPersistenceStore *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  RTPersistenceStore *v27;
  void *v28;
  RTPersistenceStore *v29;
  unint64_t v30;
  RTPersistenceStore *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  RTPersistenceStore *v45;
  uint64_t v46;
  const char *v47;
  void *v48;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  int v56;
  void *v57;
  id v58;
  RTPersistenceStore *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  RTPersistenceStore *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  const __CFString *v74;
  uint64_t v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  const char *v79;
  __int16 v80;
  int v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v4 = objc_loadWeakRetained((id *)&self->_modelProvider);
  objc_msgSend(v4, "latestModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceMigrator _coordinatorForModel:](self, "_coordinatorForModel:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  objc_msgSend(WeakRetained, "retrieveMetadataWithCoordinator:error:", v6, &v73);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v73;
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, "code");
    if (v10 >= 4)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v35 = objc_msgSend(v9, "code");
        *(_DWORD *)buf = 134218498;
        v77 = v35;
        v78 = 2080;
        v79 = "-[RTPersistenceMigrator _executeImportStep]";
        v80 = 1024;
        v81 = 824;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
      }

      v11 = 8;
    }
    else
    {
      v11 = qword_1D1EED308[v10];
    }
    goto LABEL_46;
  }
  objc_msgSend(v7, "objectForKey:", CFSTR("RTPersistentStoreMetadataStoreImportKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  if ((v13 & 1) == 0)
  {
    -[RTPersistenceMigrator __findCandidateStoresForImportStepWithStore:](self, "__findCandidateStoresForImportStepWithStore:", WeakRetained);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v11 = 2;
LABEL_47:

      goto LABEL_48;
    }
    v63 = v6;
    v66 = v4;
    objc_msgSend(WeakRetained, "storeDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    objc_msgSend(v16, "setURL:", v9);
    v65 = v16;
    v17 = -[RTPersistenceStore initWithStoreDescription:]([RTPersistenceStore alloc], "initWithStoreDescription:", v16);
    v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v5);
    objc_msgSend(WeakRetained, "storeDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "fileURLWithPath:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)v21;
    objc_msgSend(v24, "URLByAppendingPathComponent:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "URLByAppendingPathExtension:", CFSTR("sqlite"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setURL:", v26);

    v67 = v19;
    v27 = -[RTPersistenceStore initWithStoreDescription:]([RTPersistenceStore alloc], "initWithStoreDescription:", v19);
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v5);
    v29 = v17;
    v30 = -[RTPersistenceMigrator __prepareImportStepWithSourceStore:sourceCoordinator:destinationStore:destinationCoordinator:model:allowMigration:](self, "__prepareImportStepWithSourceStore:sourceCoordinator:destinationStore:destinationCoordinator:model:allowMigration:", v17, v68, v27, v28, v5, 1);
    v64 = v17;
    if (v30 != 0x8000000000000008)
    {
      v11 = v30;
      if (v30 == 8)
      {
        v31 = v27;
        v4 = v66;
        v32 = v68;
      }
      else
      {
        v32 = v68;
        -[RTPersistenceMigrator __cleanupAfterImportWithStore:coordinator:](self, "__cleanupAfterImportWithStore:coordinator:", v17, v68);
        -[RTPersistenceMigrator __cleanupAfterImportWithStore:coordinator:](self, "__cleanupAfterImportWithStore:coordinator:", v27, v28);
        v31 = v27;
        v4 = v66;
      }
      v34 = v62;
      v6 = v63;
      goto LABEL_45;
    }
    v60 = v28;
    v33 = -[RTPersistenceMigrator __executeImportStepWithSourceStore:sourceCoordinator:destinationStore:destinationCoordinator:model:](self, "__executeImportStepWithSourceStore:sourceCoordinator:destinationStore:destinationCoordinator:model:", v17, v68, v27, v28, v5);
    if (v33 != 0x8000000000000008)
    {
      v11 = v33;
      v6 = v63;
      if (v33 != 8)
      {
        v45 = v29;
        v32 = v68;
        -[RTPersistenceMigrator __cleanupAfterImportWithStore:coordinator:](self, "__cleanupAfterImportWithStore:coordinator:", v45, v68);
        -[RTPersistenceMigrator __cleanupAfterImportWithStore:coordinator:](self, "__cleanupAfterImportWithStore:coordinator:", v27, v28);
        v31 = v27;
        v4 = v66;
        v34 = v62;
LABEL_45:

        v7 = v65;
LABEL_46:

        goto LABEL_47;
      }
      v31 = v27;
      v4 = v66;
      v32 = v68;
      v34 = v62;
LABEL_44:
      v28 = v60;
      goto LABEL_45;
    }
    v72 = 0;
    v6 = v63;
    objc_msgSend(WeakRetained, "removeFromCoordinator:error:", v63, &v72);
    v58 = v72;
    objc_msgSend(WeakRetained, "URL");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "storeDescription");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "options");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "URL");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "options");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x1E0C979E8];
    v71 = 0;
    v59 = v27;
    v56 = objc_msgSend(v68, "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v54, v53, v52, v36, v37, &v71);
    v55 = v71;

    -[RTPersistenceMigrator __cleanupAfterImportWithStore:coordinator:](self, "__cleanupAfterImportWithStore:coordinator:", v29, v68);
    -[RTPersistenceMigrator __cleanupAfterImportWithStore:coordinator:](self, "__cleanupAfterImportWithStore:coordinator:", v27, v28);
    v11 = 0;
    if (v56)
    {
      v4 = v66;
      v38 = v55;
      if (!v55)
      {
        v70 = 0;
        v39 = objc_msgSend(WeakRetained, "addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:", v63, 0, 0, 0, &v70);
        v40 = v70;
        v41 = v40;
        if (!v39 || v40)
        {
          v46 = objc_msgSend(v40, "code");
          v47 = (const char *)v46;
          if ((unint64_t)(v46 - 2) < 2)
            goto LABEL_34;
          if (v46 == 1)
          {
            v11 = 0;
LABEL_42:

            goto LABEL_43;
          }
          if (v46)
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              v51 = objc_msgSend(v41, "code");
              *(_DWORD *)buf = 134218498;
              v77 = v51;
              v78 = 2080;
              v79 = "-[RTPersistenceMigrator _executeImportStep]";
              v80 = 1024;
              v81 = 946;
              _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
            }
            v11 = 8;
          }
          else
          {
LABEL_34:
            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(WeakRetained, "URL");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "lastPathComponent");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v77 = (uint64_t)v48;
              v78 = 2048;
              v79 = v47;
              _os_log_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_INFO, "store %@, could not be opened after import, code, %ld", buf, 0x16u);

            }
            v11 = 5;
          }
        }
        else
        {
          v74 = CFSTR("RTPersistentStoreMetadataStoreImportKey");
          v75 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = 0;
          objc_msgSend(WeakRetained, "updateMetadata:coordinator:error:", v42, v63, &v69);
          v43 = v69;

          if (v43 && (unint64_t)-[NSObject code](v43, "code") >= 4)
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v50 = -[NSObject code](v43, "code");
              *(_DWORD *)buf = 134218498;
              v77 = v50;
              v78 = 2080;
              v79 = "-[RTPersistenceMigrator _executeImportStep]";
              v80 = 1024;
              v81 = 965;
              _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
            }

          }
          v11 = 2;
        }

        v4 = v66;
        goto LABEL_42;
      }
    }
    else
    {
      v4 = v66;
      v38 = v55;
    }
LABEL_43:

    v32 = v68;
    v34 = v62;
    v31 = v59;
    goto LABEL_44;
  }
  v11 = 2;
LABEL_48:

  return v11;
}

- (id)__findCandidateStoresForImportStepWithStore:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _QWORD v49[2];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v6;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "store, %@, migration step, import", buf, 0xCu);

    }
    objc_msgSend(v3, "storeURLsMatchingStoreName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "sortFilesByName:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject count](v8, "count"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v39 = v8;
        v40 = v3;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v9 = v8;
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v42 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              _rt_log_facility_get_os_log(RTLogFacilityDatabase);
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v14, "path");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "lastPathComponent");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v46 = v17;
                _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "import candidate found, %@", buf, 0xCu);

              }
            }
            v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
          }
          while (v11);
        }

        v8 = v39;
        v3 = v40;
      }
      -[NSObject lastObject](v8, "lastObject", v39, v40);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB3620];
      v49[0] = v18;
      objc_msgSend(v3, "URL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sortFilesByName:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "lastObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "URL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v23, "isEqual:", v24);

      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
      if ((v25 & 1) != 0)
      {
        if (v27)
        {
          -[NSObject path](v18, "path");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "lastPathComponent");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v46 = v29;
          _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "choosing store with path %@ to import", buf, 0xCu);

        }
        v30 = v18;
      }
      else
      {
        if (v27)
        {
          -[NSObject path](v18, "path");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "lastPathComponent");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "URL");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "path");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "lastPathComponent");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v46 = v34;
          v47 = 2112;
          v48 = v37;
          _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "import candidate, %@ is a later version that the current version, %@, skipping import.", buf, 0x16u);

        }
        v30 = 0;
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "URL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "lastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v46 = v32;
        _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "no import candidates found for store, %@", buf, 0xCu);

      }
      v30 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: destinationStore", buf, 2u);
    }
    v30 = 0;
  }

  return v30;
}

- (unint64_t)__prepareImportStepWithSourceStore:(id)a3 sourceCoordinator:(id)a4 destinationStore:(id)a5 destinationCoordinator:(id)a6 model:(id)a7 allowMigration:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  unint64_t v25;
  const char *v26;
  uint64_t v28;
  const char *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v8 = a8;
  v47 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = v17;
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: sourceStore";
      goto LABEL_44;
    }
LABEL_20:
    v25 = 2;
    goto LABEL_21;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: sourceCoordinator";
      goto LABEL_44;
    }
    goto LABEL_20;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: destinationStore";
      goto LABEL_44;
    }
    goto LABEL_20;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: destinationCoordinator";
      goto LABEL_44;
    }
    goto LABEL_20;
  }
  if (!v17)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: model";
LABEL_44:
    v25 = 2;
    _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_21;
  }
  v40 = 0;
  v19 = objc_msgSend(v13, "addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:", v14, v8, 0, 0, &v40);
  v20 = v40;
  v21 = v20;
  if (v19 && !v20)
  {
    v39 = 0;
    v22 = objc_msgSend(v15, "addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:", v16, v8, 0, 0, &v39);
    v23 = v39;
    v24 = v23;
    if (v22 && !v23)
    {
      v25 = 0x8000000000000008;
LABEL_42:

      goto LABEL_21;
    }
    v32 = -[NSObject code](v23, "code");
    v33 = (const char *)v32;
    if ((unint64_t)(v32 - 2) < 2)
      goto LABEL_31;
    if (v32 != 1)
    {
      if (v32)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          v37 = -[NSObject code](v24, "code");
          *(_DWORD *)buf = 134218498;
          v42 = v37;
          v43 = 2080;
          v44 = "-[RTPersistenceMigrator __prepareImportStepWithSourceStore:sourceCoordinator:destinationStore:destinatio"
                "nCoordinator:model:allowMigration:]";
          v45 = 1024;
          v46 = 1083;
          _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
        }
        v25 = 8;
        goto LABEL_41;
      }
LABEL_31:
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v13, "URL");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "lastPathComponent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v42 = (uint64_t)v35;
        v43 = 2048;
        v44 = v33;
        _os_log_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_INFO, "destination store %@, could not be prepared for import, code, %ld", buf, 0x16u);

      }
      v25 = 2;
LABEL_41:

      goto LABEL_42;
    }
LABEL_37:
    v25 = 8;
    goto LABEL_42;
  }
  v28 = -[NSObject code](v20, "code");
  v29 = (const char *)v28;
  if ((unint64_t)(v28 - 2) < 2)
  {
LABEL_25:
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "URL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lastPathComponent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v42 = (uint64_t)v31;
      v43 = 2048;
      v44 = v29;
      _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "source store %@, could not be prepared for import, code, %ld", buf, 0x16u);

    }
    v25 = 2;
    goto LABEL_42;
  }
  if (v28 != 1)
  {
    if (v28)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v36 = -[NSObject code](v21, "code");
        *(_DWORD *)buf = 134218498;
        v42 = v36;
        v43 = 2080;
        v44 = "-[RTPersistenceMigrator __prepareImportStepWithSourceStore:sourceCoordinator:destinationStore:destinationC"
              "oordinator:model:allowMigration:]";
        v45 = 1024;
        v46 = 1052;
        _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Unhandled error code, %ld (in %s:%d)", buf, 0x1Cu);
      }
      goto LABEL_37;
    }
    goto LABEL_25;
  }
  v25 = 8;
LABEL_21:

  return v25;
}

- (unint64_t)__executeImportStepWithSourceStore:(id)a3 sourceCoordinator:(id)a4 destinationStore:(id)a5 destinationCoordinator:(id)a6 model:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *WeakRetained;
  void *v19;
  void *v20;
  int v21;
  id v22;
  unint64_t v23;
  const char *v24;
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: sourceStore";
      goto LABEL_25;
    }
LABEL_18:
    v23 = 2;
    goto LABEL_19;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: sourceCoordinator";
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: destinationStore";
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  if (!v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: destinationCoordinator";
      goto LABEL_25;
    }
    goto LABEL_18;
  }
  if (!v16)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: model";
LABEL_25:
    v23 = 2;
    _os_log_error_impl(&dword_1D1A22000, WeakRetained, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_19;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v12, "storeDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v21 = -[NSObject importSourceStore:sourceCoordinator:destinationStore:destinationCoordinator:managedObjectModel:configuration:error:](WeakRetained, "importSourceStore:sourceCoordinator:destinationStore:destinationCoordinator:managedObjectModel:configuration:error:", v12, v13, v14, v15, v17, v20, &v27);
  v22 = v27;

  if (!v21 || v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "error during database import, %@", buf, 0xCu);
    }

    v23 = 2;
  }
  else
  {
    v23 = 0x8000000000000008;
  }

LABEL_19:
  return v23;
}

- (void)__cleanupAfterImportWithStore:(id)a3 coordinator:(id)a4
{
  id v5;
  int v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v5 = a3;
  v6 = objc_msgSend(v5, "removeFromCoordinator:error:", a4, &v15);
  v7 = v15;
  v8 = v7;
  if (!v6 || v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "error attempting to remove store from coordinator, %@", buf, 0xCu);
    }

  }
  objc_msgSend(v5, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v11 = objc_msgSend(v5, "removeStoreAtURL:error:", v10, &v14);

  v12 = v14;
  if (!v11 || v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v12;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "error attempting to remove store from disk, %@", buf, 0xCu);
    }

  }
}

- (NSDate)migrationStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)migrationEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)didVacuumStore
{
  return self->_didVacuumStore;
}

- (RTPersistenceStore)store
{
  return (RTPersistenceStore *)objc_loadWeakRetained((id *)&self->_store);
}

- (RTPersistenceModelProvider)modelProvider
{
  return (RTPersistenceModelProvider *)objc_loadWeakRetained((id *)&self->_modelProvider);
}

- (RTPersistenceDelegate)delegate
{
  return (RTPersistenceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSManagedObjectModel)nextModel
{
  return self->_nextModel;
}

- (void)setNextModel:(id)a3
{
  objc_storeStrong((id *)&self->_nextModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_modelProvider);
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_migrationEndDate, 0);
  objc_storeStrong((id *)&self->_migrationStartDate, 0);
  objc_storeStrong((id *)&self->_cachedCoordinator, 0);
}

@end
