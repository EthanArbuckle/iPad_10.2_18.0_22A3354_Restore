@implementation RTPersistenceStore

- (RTPersistenceStore)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithStoreDescription_);
}

- (RTPersistenceStore)initWithStoreDescription:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  RTPersistenceStore *v9;
  uint64_t v10;
  NSPersistentStoreDescription *storeDescription;
  uint64_t v12;
  NSMutableDictionary *userInfo;
  RTPersistenceStore *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "shouldAddStoreAsynchronously"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[RTPersistenceStore initWithStoreDescription:]";
        v20 = 1024;
        v21 = 53;
        _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !storeDescription.shouldAddStoreAsynchronously (in %s:%d)", buf, 0x12u);
      }

    }
    if (objc_msgSend(v5, "shouldMigrateStoreAutomatically"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[RTPersistenceStore initWithStoreDescription:]";
        v20 = 1024;
        v21 = 54;
        _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !storeDescription.shouldMigrateStoreAutomatically (in %s:%d)", buf, 0x12u);
      }

    }
    if (objc_msgSend(v5, "shouldInferMappingModelAutomatically"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[RTPersistenceStore initWithStoreDescription:]";
        v20 = 1024;
        v21 = 55;
        _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: !storeDescription.shouldInferMappingModelAutomatically (in %s:%d)", buf, 0x12u);
      }

    }
    v17.receiver = self;
    v17.super_class = (Class)RTPersistenceStore;
    v9 = -[RTPersistenceStore init](&v17, sel_init);
    if (v9)
    {
      v10 = objc_msgSend(v5, "copy");
      storeDescription = v9->_storeDescription;
      v9->_storeDescription = (NSPersistentStoreDescription *)v10;

      -[NSPersistentStoreDescription setShouldAddStoreAsynchronously:](v9->_storeDescription, "setShouldAddStoreAsynchronously:", 0);
      -[NSPersistentStoreDescription setShouldMigrateStoreAutomatically:](v9->_storeDescription, "setShouldMigrateStoreAutomatically:", 0);
      -[NSPersistentStoreDescription setShouldInferMappingModelAutomatically:](v9->_storeDescription, "setShouldInferMappingModelAutomatically:", 0);
      v9->_state = 0;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = objc_claimAutoreleasedReturnValue();
      userInfo = v9->_userInfo;
      v9->_userInfo = (NSMutableDictionary *)v12;

      v9->_mirroringDelegateState = 0;
    }
    self = v9;
    v14 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: storeDescription", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RTPersistenceStore;
  -[RTPersistenceStore dealloc](&v4, sel_dealloc);
}

- (NSURL)URL
{
  return -[NSPersistentStoreDescription URL](self->_storeDescription, "URL");
}

- (id)storeName
{
  void *v2;
  void *v3;

  -[NSPersistentStoreDescription URL](self->_storeDescription, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)error:(id *)a3 code:(unint64_t)a4
{
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), a4, 0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)error:(id *)a3 inError:(id)a4
{
  if (a3 && a4)
    *a3 = objc_retainAutorelease(a4);
  return a4 == 0;
}

- (id)_normalizeError:(id)a3 storeDescription:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C979C8];
  v9 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C979C8]);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "code"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(v5, "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
LABEL_3:
      v11 = objc_msgSend(v10, "intValue");
      if (v11 != 11)
      {
        if (v11 != 23)
        {
          if (v11 == 26)
            goto LABEL_16;
          goto LABEL_13;
        }
LABEL_17:
        v28 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "URL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "path");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("Unable to add persistent store, %@, reason, unavailable"), v30);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = 1;
        goto LABEL_18;
      }
LABEL_16:
      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "URL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringWithFormat:", CFSTR("Unable to add persistent store, %@, reason, corrupt"), v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = 3;
      goto LABEL_18;
    }
  }
  objc_msgSend(v5, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

  if (v14)
  {
    v15 = objc_msgSend(v5, "code");
    switch(v15)
    {
      case 259:
        goto LABEL_16;
      case 134090:
        goto LABEL_17;
      case 134100:
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "URL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("Unable to add persistent store, %@, reason, incompatible"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = 2;
        goto LABEL_18;
    }
  }
LABEL_13:
  v21 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "URL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "path");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("Unable to add persistent store, %@, error, %@"), v23, v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v19;
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v20 = 0;
LABEL_18:
  v31 = (void *)objc_opt_new();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CB2D50]);
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), v20, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (BOOL)openWithCoordinator:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t state;
  NSObject *v13;
  void *v14;
  RTPersistenceStore *v15;
  id *v16;
  uint64_t v17;
  BOOL v18;
  _BOOL4 v19;
  id v20;
  void *v21;
  NSObject *p_super;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPersistentStoreDescription setConfiguration:](self->_storeDescription, "setConfiguration:", v10);

  v11 = objc_msgSend(v9, "isReadOnly");
  -[NSPersistentStoreDescription setReadOnly:](self->_storeDescription, "setReadOnly:", v11);
  state = self->_state;
  if (state > 2)
  {
LABEL_11:
    if (state == 4)
    {
LABEL_12:
      v15 = self;
      v16 = a5;
      v17 = 0;
LABEL_13:
      v18 = -[RTPersistenceStore error:code:](v15, "error:code:", v16, v17);
      goto LABEL_31;
    }
LABEL_14:
    v28 = 0;
    v19 = -[RTPersistenceStore addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:](self, "addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:", v8, 0, 0, 1, &v28);
    v20 = v28;
    v21 = v20;
    v18 = v20 == 0;
    if (!v19 || v20)
    {
      v23 = objc_msgSend(v20, "code");
      if ((unint64_t)(v23 - 2) >= 2 && v23)
      {
        if (v23 != 1)
        {
LABEL_28:
          if (a5)
            *a5 = objc_retainAutorelease(v21);

          goto LABEL_31;
        }
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
        {
          -[RTPersistenceStore storeName](self, "storeName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v30 = v24;
          _os_log_impl(&dword_1D1A22000, p_super, OS_LOG_TYPE_INFO, "store, %@, is currently unavailable", buf, 0xCu);

        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          -[RTPersistenceStore storeName](self, "storeName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v30 = v26;
          _os_log_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_INFO, "store, %@, couldn't be opened", buf, 0xCu);

        }
        -[RTPersistenceMigrator delegate](self->_migrator, "delegate");
        p_super = objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[NSObject persistenceStore:failedWithError:](p_super, "persistenceStore:failedWithError:", self, v21);
        self->_state = 4;
      }
    }
    else
    {
      self->_state = 5;
      p_super = &self->_migrator->super;
      self->_migrator = 0;
    }

    goto LABEL_28;
  }
  self->_state = 1;
  if (!self->_migrator)
  {
LABEL_7:
    self->_state = 4;
    goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    -[RTPersistenceStore storeName](self, "storeName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v14;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "store, %@, running migrator", buf, 0xCu);

  }
  switch(-[RTPersistenceMigrator run](self->_migrator, "run"))
  {
    case 0uLL:
      v15 = self;
      v16 = a5;
      v17 = 1;
      goto LABEL_13;
    case 1uLL:
      v18 = 0;
      self->_state = 2;
      break;
    case 2uLL:
      self->_state = 3;
      goto LABEL_14;
    case 3uLL:
      goto LABEL_7;
    default:
      state = self->_state;
      goto LABEL_11;
  }
LABEL_31:

  return v18;
}

- (BOOL)addToCoordinator:(id)a3 lightweightMigration:(BOOL)a4 vacuum:(BOOL)a5 allowMirroring:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL8 v10;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSCloudKitMirroringDelegate *mirroringDelegate;
  NSObject *v26;
  NSCloudKitMirroringDelegate *v27;
  NSCloudKitMirroringDelegate *v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  BOOL v34;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[5];
  uint8_t v41[4];
  id v42;
  __int16 v43;
  void *v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  -[RTPersistenceStore storeDescription](self, "storeDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "shouldAddStoreAsynchronously");

  if (v15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTPersistenceStore addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 289;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Expected shouldAddStoreAsynchronously to be NO (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTPersistenceStore storeDescription](self, "storeDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "shouldAddStoreAsynchronously");

  if (v18)
  {
    -[RTPersistenceStore storeDescription](self, "storeDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShouldAddStoreAsynchronously:", 0);

  }
  -[RTPersistenceStore storeDescription](self, "storeDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copy");

  objc_msgSend(v21, "setShouldMigrateStoreAutomatically:", v10);
  objc_msgSend(v21, "setShouldInferMappingModelAutomatically:", v10);
  objc_msgSend(v21, "setValue:forPragmaNamed:", &unk_1E9328BF8, CFSTR("cache_spill"));
  if (v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "allowing mirroring", buf, 2u);
    }

    if (self->_mirroringDelegateOptions)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "mirroring options are set", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObserver:selector:name:object:", self, sel_onMirroringDelegateInitialization_, CFSTR("NSPersistentCloudKitContainerEventChangedNotification"), 0);

      mirroringDelegate = self->_mirroringDelegate;
      if (!mirroringDelegate)
      {
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "creating a new mirroring delegate", buf, 2u);
        }

        v27 = (NSCloudKitMirroringDelegate *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97AC8]), "initWithOptions:", self->_mirroringDelegateOptions);
        v28 = self->_mirroringDelegate;
        self->_mirroringDelegate = v27;

        mirroringDelegate = self->_mirroringDelegate;
      }
      objc_msgSend(v21, "setOption:forMirroringKey:", mirroringDelegate, *MEMORY[0x1E0C97950]);
    }
  }
  if (v9)
    objc_msgSend(v21, "setOption:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C979D0]);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v21;
    _os_log_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_INFO, "add persistent store with description, %@", buf, 0xCu);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v46 = __Block_byref_object_copy__111;
  v47 = __Block_byref_object_dispose__111;
  v48 = 0;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __88__RTPersistenceStore_addToCoordinator_lightweightMigration_vacuum_allowMirroring_error___block_invoke;
  v40[3] = &unk_1E92A2058;
  v40[4] = buf;
  objc_msgSend(v13, "addPersistentStoreWithDescription:completionHandler:", v21, v40);
  v30 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v30)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v41 = 138412546;
      v42 = v36;
      v43 = 2112;
      v44 = v37;
      _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "%@ failed, error, %@", v41, 0x16u);

    }
    -[RTPersistenceStore _normalizeError:storeDescription:](self, "_normalizeError:storeDescription:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v21);
    v33 = objc_claimAutoreleasedReturnValue();
    v32 = *(NSObject **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v33;
  }
  else if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "URL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v41 = 138412546;
    v42 = v38;
    v43 = 2112;
    v44 = v39;
    _os_log_debug_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_DEBUG, "%@ success, added, %@", v41, 0x16u);

  }
  v34 = -[RTPersistenceStore error:inError:](self, "error:inError:", a7, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  _Block_object_dispose(buf, 8);

  return v34;
}

void __88__RTPersistenceStore_addToCoordinator_lightweightMigration_vacuum_allowMirroring_error___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

- (BOOL)removeStoreAtURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  BOOL v24;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "remove store at URL, %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v8, "removeItemAtURL:error:", v6, &v28);
    v9 = v28;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", CFSTR("-wal"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v10, "removeItemAtURL:error:", v14, &v27);
    v15 = v27;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByAppendingString:", CFSTR("-shm"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fileURLWithPath:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v16, "removeItemAtURL:error:", v20, &v26);
    v21 = v26;

    _RTSafeArray();
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    _RTMultiErrorCreate();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = -[RTPersistenceStore error:inError:](self, "error:inError:", a4, v23, v15, v21, 1);
  }
  else
  {
    v24 = 1;
  }

  return v24;
}

- (BOOL)removeFromCoordinator:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSCloudKitMirroringDelegate *mirroringDelegate;
  BOOL v18;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[RTPersistenceStore storeDescription](self, "storeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentStoreForURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v8;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "remove from coordinator, %@", buf, 0xCu);
    }

    v21 = 0;
    v12 = objc_msgSend(v7, "removePersistentStore:error:", v10, &v21);
    v13 = v21;
    v14 = v13;
    if (!v12 || (v15 = 0, v13))
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v20;
        v24 = 2112;
        v25 = v14;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@ failed, error, %@", buf, 0x16u);

      }
      -[RTPersistenceStore _normalizeError:storeDescription:](self, "_normalizeError:storeDescription:", v14, v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    mirroringDelegate = self->_mirroringDelegate;
    self->_mirroringDelegate = 0;

    v18 = -[RTPersistenceStore error:inError:](self, "error:inError:", a4, v15);
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (BOOL)destroyWithCoordinator:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSCloudKitMirroringDelegate *mirroringDelegate;
  BOOL v18;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[RTPersistenceStore storeDescription](self, "storeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v8;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "destroy with coordinator, %@", buf, 0xCu);
  }

  objc_msgSend(v8, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v13 = objc_msgSend(v7, "destroyPersistentStoreAtURL:withType:options:error:", v10, v11, v12, &v21);

  v14 = v21;
  if (!v13 || (v15 = 0, v14))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v20;
      v24 = 2112;
      v25 = v14;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "%@ failed, error, %@", buf, 0x16u);

    }
    -[RTPersistenceStore _normalizeError:storeDescription:](self, "_normalizeError:storeDescription:", v14, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  mirroringDelegate = self->_mirroringDelegate;
  self->_mirroringDelegate = 0;

  v18 = -[RTPersistenceStore error:inError:](self, "error:inError:", a4, v15);
  return v18;
}

- (BOOL)rekeyWithCoordinator:(id)a3 keyData:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  const __CFString *v23;
  NSObject *v24;
  void *v26;
  const char *aSelector;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: coordinator", buf, 2u);
    }

    if (a5)
    {
      v23 = CFSTR("coordinator");
LABEL_19:
      _RTErrorInvalidParameterCreate((uint64_t)v23);
      v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_20:
    v21 = 0;
    goto LABEL_21;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keyData", buf, 2u);
    }

    if (a5)
    {
      v23 = CFSTR("keyData");
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  aSelector = a2;
  -[RTPersistenceStore storeDescription](self, "storeDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v12;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "rekey with coordinator, %@", buf, 0xCu);
  }

  objc_msgSend(v12, "URL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "options");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v17 = objc_msgSend(v9, "_rekeyPersistentStoreAtURL:type:options:withKey:error:", v14, v15, v16, v11, &v28);
  v18 = v28;

  if (!v17 || (v19 = 0, v18))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(aSelector);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v26;
      v31 = 2112;
      v32 = v18;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "%@ failed, error, %@", buf, 0x16u);

    }
    -[RTPersistenceStore _normalizeError:storeDescription:](self, "_normalizeError:storeDescription:", v18, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v21 = -[RTPersistenceStore error:inError:](self, "error:inError:", a5, v19);

LABEL_21:
  return v21;
}

- (id)cachedModelWithError:(id *)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[RTPersistenceStore storeDescription](self, "storeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C97BF8];
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v7, "cachedModelForPersistentStoreWithURL:options:error:", v8, v9, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;

  v12 = 0;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 0;
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v18;
      v22 = 2112;
      v23 = v11;
      _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "%@ failed, error, %@", buf, 0x16u);

    }
    -[RTPersistenceStore _normalizeError:storeDescription:](self, "_normalizeError:storeDescription:", v11, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[RTPersistenceStore error:inError:](self, "error:inError:", a3, v12))
    v15 = v10;
  else
    v15 = 0;
  v16 = v15;

  return v16;
}

- (BOOL)performVacuumWithCoordinator:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  uint8_t buf[4];
  double v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = COERCE_DOUBLE("-[RTPersistenceStore performVacuumWithCoordinator:error:]");
      v33 = 1024;
      v34 = 478;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: coordinator (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[RTPersistenceStore URL](self, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 138412290;
    v32 = v10;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "vacuuming store %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v12;

  if (v6)
  {
    -[RTPersistenceStore URL](self, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistentStoreForURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v28 = 0;
      v16 = -[RTPersistenceStore removeFromCoordinator:error:](self, "removeFromCoordinator:error:", v6, &v28);
      v17 = v28;
      v18 = v17;
      if (!v16 || v17)
        goto LABEL_18;
    }
    v27 = 0;
    v16 = -[RTPersistenceStore addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:](self, "addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:", v6, 0, 1, 0, &v27);
    v19 = v27;
    v18 = v19;
    if (!v16
      || v19
      || (v26 = 0,
          v16 = -[RTPersistenceStore removeFromCoordinator:error:](self, "removeFromCoordinator:error:", v6, &v26),
          v20 = v26,
          v18 = v20,
          !v16)
      || v20)
    {
LABEL_18:
      if (a4)
      {
        v18 = objc_retainAutorelease(v18);
        *a4 = v18;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceReferenceDate");
      v23 = v22;

      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v32 = v23 - v13;
        _os_log_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_INFO, "vacuum duration, %lf", buf, 0xCu);
      }

      v18 = 0;
      LOBYTE(v16) = 1;
    }

  }
  else
  {
    if (!a4)
    {
      LOBYTE(v16) = 0;
      goto LABEL_24;
    }
    v29 = *MEMORY[0x1E0CB2D50];
    v30 = CFSTR("Must pass a valid non-nil coordinator.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), 1, v18);
    LOBYTE(v16) = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_24:
  return v16;
}

- (id)_validateKeys:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasPrefix:", CFSTR("RT"), (_QWORD)v12) & 1) == 0)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)retrieveMetadataWithCoordinator:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char *v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTPersistenceStore retrieveMetadataWithCoordinator:error:]";
      v27 = 1024;
      v28 = 554;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: coordinator (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[RTPersistenceStore URL](self, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v10;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "retrieving metadata of store %@", buf, 0xCu);

  }
  if (v6)
  {
    -[RTPersistenceStore URL](self, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistentStoreForURL:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_13;
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[RTPersistenceStore URL](self, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "Coordinator did not have any persistent stores with URL %@, adding store", buf, 0xCu);

    }
    v22 = 0;
    v16 = -[RTPersistenceStore addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:](self, "addToCoordinator:lightweightMigration:vacuum:allowMirroring:error:", v6, 0, 0, 0, &v22);
    v17 = v22;
    v18 = v17;
    if (v16 && !v17)
    {
LABEL_13:
      objc_msgSend(v6, "metadataForPersistentStore:", v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4)
        *a4 = objc_retainAutorelease(v17);

      v12 = 0;
      v19 = 0;
    }
    goto LABEL_22;
  }
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Must pass a valid non-nil coordinator, returning nil.", buf, 2u);
  }

  if (a4)
  {
    v23 = *MEMORY[0x1E0CB2D50];
    v24 = CFSTR("Must pass a valid non-nil coordinator.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), 1, v12);
    v19 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

    goto LABEL_23;
  }
  v19 = 0;
LABEL_23:

  return v19;
}

- (BOOL)updateMetadata:(id)a3 context:(id)a4 coordinator:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  BOOL v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51;
  id v52;
  _BYTE *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  _BYTE buf[24];
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  const __CFString *v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  _QWORD v72[4];

  v72[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    -[RTPersistenceStore URL](self, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "updating metadata %@ of store %@", buf, 0x16u);

  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTPersistenceStore updateMetadata:context:coordinator:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 600;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: keysAndValues (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v11)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTPersistenceStore updateMetadata:context:coordinator:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 601;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context (in %s:%d)", buf, 0x12u);
    }

  }
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTPersistenceStore updateMetadata:context:coordinator:error:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 602;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: coordinator (in %s:%d)", buf, 0x12u);
    }

  }
  if (objc_msgSend(v10, "count"))
  {
    if (v11)
    {
      if (v12)
      {
        if ((objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v10, 200) & 1) != 0)
        {
          objc_msgSend(v10, "allKeys");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTPersistenceStore _validateKeys:](self, "_validateKeys:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v20, "count"))
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v20;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[RTPersistenceStore updateMetadata:context:coordinator:error:]";
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v60) = 652;
              _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Trying to update store metadata with keys that are not owned by you.  Keys: %@ (in %s:%d)", buf, 0x1Cu);
            }

          }
          if (objc_msgSend(v20, "count"))
          {
            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v20;
              _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Error updating metadata, caller passed bad keys, %@", buf, 0xCu);
            }

            if (a6)
            {
              v65 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trying to update store metadata with keys that are not owned by you.  Keys: %@"), v20);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = v23;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
              v24 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), 0, v24);
              v25 = 0;
              *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_61:

              goto LABEL_62;
            }
            v25 = 0;
LABEL_62:

            goto LABEL_63;
          }
          -[RTPersistenceStore URL](self, "URL");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "persistentStoreForURL:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              -[RTPersistenceStore URL](self, "URL");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "lastPathComponent");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v45;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[RTPersistenceStore updateMetadata:context:coordinator:error:]";
              *(_WORD *)&buf[22] = 1024;
              LODWORD(v60) = 667;
              _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Coordinator did not have any persistent stores with URL %@ (in %s:%d)", buf, 0x1Cu);

            }
            _rt_log_facility_get_os_log(RTLogFacilityDatabase);
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              -[RTPersistenceStore URL](self, "URL");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "lastPathComponent");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v47;
              _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Coordinator did not have any persistent stores with URL %@, returning nil", buf, 0xCu);

            }
            if (a6)
            {
              v63 = *MEMORY[0x1E0CB2D50];
              v36 = (void *)MEMORY[0x1E0CB3940];
              -[RTPersistenceStore URL](self, "URL");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "lastPathComponent");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "stringWithFormat:", CFSTR("Coordinator did not have any persistent stores with URL %@"), v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v39;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), 0, v40);
              *a6 = (id)objc_claimAutoreleasedReturnValue();

            }
            v24 = 0;
            v25 = 0;
            goto LABEL_61;
          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v60 = __Block_byref_object_copy__111;
          v61 = __Block_byref_object_dispose__111;
          v62 = 0;
          v55 = 0;
          v56 = &v55;
          v57 = 0x2020000000;
          v58 = 0;
          v48[0] = MEMORY[0x1E0C809B0];
          v48[1] = 3221225472;
          v48[2] = __63__RTPersistenceStore_updateMetadata_context_coordinator_error___block_invoke;
          v48[3] = &unk_1E92A2270;
          v48[4] = self;
          v49 = v12;
          v53 = buf;
          v50 = v10;
          v24 = v31;
          v51 = v24;
          v52 = v11;
          v54 = &v55;
          objc_msgSend(v49, "performBlockAndWait:", v48);
          if (*((_BYTE *)v56 + 24) && !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            v25 = 1;
            goto LABEL_60;
          }
          if (a6)
          {
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "domain");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("RTPersistenceErrorDomain"));

            if ((v33 & 1) != 0)
            {
              v25 = 0;
              *a6 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
LABEL_60:

              _Block_object_dispose(&v55, 8);
              _Block_object_dispose(buf, 8);

              goto LABEL_61;
            }
            v41 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "userInfo");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), 0, v42);
            *a6 = (id)objc_claimAutoreleasedReturnValue();

          }
          v25 = 0;
          goto LABEL_60;
        }
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "An object or key in the metadata is invalid for serialization to store metadata.", buf, 2u);
        }

        if (a6)
        {
          v67 = *MEMORY[0x1E0CB2D50];
          v68 = CFSTR("An object or key in the metadata is invalid for serialization to store metadata.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), 0, v20);
          v27 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_41;
        }
        goto LABEL_42;
      }
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Error updating metadata, caller must pass a valid non-nil coordinator.", buf, 2u);
      }

      if (a6)
      {
        v69 = *MEMORY[0x1E0CB2D50];
        v70 = CFSTR("Must pass a valid non-nil coordinator.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), 1, v20);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_ERROR, "Error updating metadata, caller must pass a valid non-nil context.", buf, 2u);
      }

      if (a6)
      {
        v71 = *MEMORY[0x1E0CB2D50];
        v72[0] = CFSTR("Must pass a valid non-nil context.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("RTPersistenceErrorDomain"), 1, v20);
        v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:
        v25 = 0;
        *a6 = v27;
        goto LABEL_62;
      }
    }
LABEL_42:
    v25 = 0;
    goto LABEL_63;
  }
  v25 = 1;
LABEL_63:

  return v25;
}

void __63__RTPersistenceStore_updateMetadata_context_coordinator_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  id v24;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v24 = *(id *)(v4 + 40);
  objc_msgSend(v2, "retrieveMetadataWithCoordinator:error:", v3, &v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), v24);
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    objc_msgSend(v6, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "setMetadata:forPersistentStore:", v6, *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_opt_new();
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__111;
    v22 = __Block_byref_object_dispose__111;
    v23 = 0;
    v8 = *(void **)(a1 + 64);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __63__RTPersistenceStore_updateMetadata_context_coordinator_error___block_invoke_2;
    v12[3] = &unk_1E929E848;
    v16 = &v18;
    v13 = *(id *)(a1 + 40);
    v9 = v7;
    v14 = v9;
    v10 = *(id *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 72);
    v15 = v10;
    v17 = v11;
    objc_msgSend(v8, "performBlockAndWait:", v12);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v19[5] != 0;

    _Block_object_dispose(&v18, 8);
  }

}

void __63__RTPersistenceStore_updateMetadata_context_coordinator_error___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "executeRequest:withContext:error:", v3, v4, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[7] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (BOOL)updateMetadata:(id)a3 coordinator:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (objc_class *)MEMORY[0x1E0C97B88];
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v8 alloc], "initWithConcurrencyType:", 1);
  objc_msgSend(v11, "setPersistentStoreCoordinator:", v9);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "processName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTransactionAuthor:", v13);

  LOBYTE(a5) = -[RTPersistenceStore updateMetadata:context:coordinator:error:](self, "updateMetadata:context:coordinator:error:", v10, v11, v9, a5);
  return (char)a5;
}

- (void)onMirroringDelegateInitialization:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v6;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "onMirroringDelegateInitialization: notification name, %@", (uint8_t *)&v20, 0xCu);

  }
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", CFSTR("NSPersistentCloudKitContainerEventChangedNotification"));

  if (v8)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0C978E0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v12;
      v22 = 2112;
      v23 = v10;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "notification name, %@, event, %@", (uint8_t *)&v20, 0x16u);

    }
    if (!objc_msgSend(v10, "type"))
    {
      objc_msgSend(v10, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = objc_msgSend(v10, "succeeded");
        _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v14)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            LOWORD(v20) = 0;
            _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "mirroring delegate did initialize", (uint8_t *)&v20, 2u);
          }

          -[RTPersistenceStore setMirroringDelegateState:](self, "setMirroringDelegateState:", 1);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "userInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = CFSTR("RTPersistenceStoreMirroringDelegateDidInitializeNotificationName");
        }
        else
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v20) = 0;
            _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "mirroring delegate failed to initialize", (uint8_t *)&v20, 2u);
          }

          -[RTPersistenceStore setMirroringDelegateState:](self, "setMirroringDelegateState:", 2);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "userInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = CFSTR("RTPersistenceStoreMirroringDelegateFailedToInitializeNotificationName");
        }
        objc_msgSend(v17, "postNotificationName:object:userInfo:", v19, self, v18);

      }
    }

  }
}

- (id)storeURLsMatchingStoreName
{
  void *v3;
  void *v4;

  -[RTPersistenceStore URL](self, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceStore storeURLsMatchingStoreNameAtURL:](self, "storeURLsMatchingStoreNameAtURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)storeURLsMatchingStoreNameAtURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, void *);
  void *v18;
  RTPersistenceStore *v19;
  NSObject *v20;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "hasDirectoryPath");
    v7 = v5;
    v8 = v7;
    v9 = v7;
    if ((v6 & 1) == 0)
    {
      -[NSObject URLByDeletingLastPathComponent](v7, "URLByDeletingLastPathComponent");
      v9 = objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "sortedContentsOfDirectoryAtURL:withExtension:", v9, CFSTR("sqlite"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3880];
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __54__RTPersistenceStore_storeURLsMatchingStoreNameAtURL___block_invoke;
    v18 = &unk_1E92A2298;
    v19 = self;
    v20 = v8;
    objc_msgSend(v11, "predicateWithBlock:", &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filteredArrayUsingPredicate:", v12, v15, v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fileSystemURL", buf, 2u);
    }
    v13 = 0;
  }

  return v13;
}

uint64_t __54__RTPersistenceStore_storeURLsMatchingStoreNameAtURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;

  v3 = a2;
  +[RTPersistenceStore storeBaseName:](RTPersistenceStore, "storeBaseName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "storeBaseName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6
    && (objc_msgSend(v3, "lastPathComponent"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsString:", CFSTR(".bak")),
        v7,
        (v8 & 1) == 0))
  {
    objc_msgSend(v3, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    v9 = v12 ^ 1u;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)storeBaseName
{
  void *v2;
  void *v3;

  -[RTPersistenceStore URL](self, "URL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTPersistenceStore storeBaseName:](RTPersistenceStore, "storeBaseName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)storeBaseName:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v11;
  uint8_t v12[16];

  if (a3)
  {
    objc_msgSend(a3, "lastPathComponent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByDeletingPathExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("-V"));
    v7 = v6;

    if (v5 != 0x7FFFFFFFFFFFFFFFLL || v7)
    {
      objc_msgSend(v3, "substringWithRange:", 0, v5);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "stringByDeletingPathExtension");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v8;

    return v11;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: storeURL", v12, 2u);
    }

    return 0;
  }
}

- (RTPersistenceMigrator)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
  objc_storeStrong((id *)&self->_migrator, a3);
}

- (NSPersistentStoreDescription)storeDescription
{
  return (NSPersistentStoreDescription *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)userInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSCloudKitMirroringDelegate)mirroringDelegate
{
  return self->_mirroringDelegate;
}

- (void)setMirroringDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_mirroringDelegate, a3);
}

- (NSCloudKitMirroringDelegateOptions)mirroringDelegateOptions
{
  return self->_mirroringDelegateOptions;
}

- (void)setMirroringDelegateOptions:(id)a3
{
  objc_storeStrong((id *)&self->_mirroringDelegateOptions, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (int64_t)mirroringDelegateState
{
  return self->_mirroringDelegateState;
}

- (void)setMirroringDelegateState:(int64_t)a3
{
  self->_mirroringDelegateState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroringDelegateOptions, 0);
  objc_storeStrong((id *)&self->_mirroringDelegate, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_storeDescription, 0);
}

@end
