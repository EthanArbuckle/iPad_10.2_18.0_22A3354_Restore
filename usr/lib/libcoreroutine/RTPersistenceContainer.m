@implementation RTPersistenceContainer

- (RTPersistenceContainer)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithName_model_configurations_);
}

- (RTPersistenceContainer)initWithName:(id)a3 model:(id)a4 configurations:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  RTPersistenceContainer *v16;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  NSArray *configurations;
  uint64_t v21;
  NSPersistentStoreCoordinator *coordinator;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  NSObject *v30;
  RTPersistenceContainer *v31;
  id v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *contextRequestsQueue;
  objc_super v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[RTPersistenceContainer initWithName:model:configurations:]";
      v39 = 1024;
      v40 = 46;
      _os_log_error_impl(&dword_1D1A22000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name (in %s:%d)", buf, 0x12u);
    }

    if (v9)
      goto LABEL_18;
    goto LABEL_15;
  }
  if (!v9)
  {
LABEL_15:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[RTPersistenceContainer initWithName:model:configurations:]";
      v39 = 1024;
      v40 = 47;
      _os_log_error_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: model (in %s:%d)", buf, 0x12u);
    }

    goto LABEL_18;
  }
  if (!-[RTPersistenceContainer _validateConfigurations:](self, "_validateConfigurations:", v10))
    goto LABEL_18;
  objc_msgSend(v9, "versionIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 != 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[RTPersistenceContainer initWithName:model:configurations:]";
      v39 = 1024;
      v40 = 56;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Containers require model with exactly one version identifier (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(v9, "versionIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 != 1)
  {
LABEL_18:
    v31 = 0;
    goto LABEL_19;
  }
  v36.receiver = self;
  v36.super_class = (Class)RTPersistenceContainer;
  v16 = -[RTPersistenceContainer init](&v36, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v8, "copy");
    name = v16->_name;
    v16->_name = (NSString *)v17;

    v19 = objc_msgSend(v10, "copy");
    configurations = v16->_configurations;
    v16->_configurations = (NSArray *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v9);
    coordinator = v16->_coordinator;
    v16->_coordinator = (NSPersistentStoreCoordinator *)v21;

    -[NSPersistentStoreCoordinator setName:](v16->_coordinator, "setName:", v8);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@-%p"), objc_opt_class(), v16->_name, v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_overcommit();
    v24 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v23;
    v27 = v25;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = (const char *)objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v26);
      v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = (const char *)objc_msgSend(v33, "UTF8String");

    }
    v34 = dispatch_queue_create(v28, v27);

    contextRequestsQueue = v16->_contextRequestsQueue;
    v16->_contextRequestsQueue = (OS_dispatch_queue *)v34;

    v16->_serveContexts = 0;
  }
  self = v16;
  v31 = self;
LABEL_19:

  return v31;
}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;

  -[RTPersistenceContainer contextRequestsQueue](self, "contextRequestsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    dispatch_activate(v3);
    -[RTPersistenceContainer setContextRequestsQueue:](self, "setContextRequestsQueue:", 0);
  }

  v5.receiver = self;
  v5.super_class = (Class)RTPersistenceContainer;
  -[RTPersistenceContainer dealloc](&v5, sel_dealloc);
}

- (BOOL)_validateConfigurations:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTPersistenceContainer _validateConfigurations:]";
      v27 = 1024;
      LODWORD(v28) = 91;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configurations.count (in %s:%d)", buf, 0x12u);
    }

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "store", (_QWORD)v21);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "URL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v6, "addObject:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v9);
    }

    v14 = objc_msgSend(v6, "count");
    if (v14 != objc_msgSend(v7, "count"))
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[RTPersistenceContainer _validateConfigurations:]";
        v27 = 1024;
        LODWORD(v28) = 105;
        _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Containers require each store to have a unique URL (in %s:%d)", buf, 0x12u);
      }

    }
    v16 = objc_msgSend(v6, "count", (_QWORD)v21);
    v17 = v16 == objc_msgSend(v7, "count");
    if (v17)
    {
      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        -[RTPersistenceContainer name](self, "name");
        v20 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v26 = v20;
        v27 = 2112;
        v28 = v7;
        _os_log_debug_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_DEBUG, "container named, %@, updating configurations, %@", buf, 0x16u);

      }
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)suspendPersistenceStores
{
  NSObject *v3;
  uint8_t v4[16];

  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "suspending persistence stores.", v4, 2u);
  }

  -[RTPersistenceContainer setServeContexts:](self, "setServeContexts:", 0);
}

- (void)resumePersistenceStores
{
  NSObject *v3;
  uint8_t v4[16];

  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "resuming persistence stores.", v4, 2u);
  }

  -[RTPersistenceContainer setServeContexts:](self, "setServeContexts:", 1);
}

- (BOOL)storesNeedSetup
{
  void *v2;
  BOOL v3;

  -[RTPersistenceContainer contextRequestsQueue](self, "contextRequestsQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)tearDownPersistenceStack
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  NSArray *configurations;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v18 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = self->_configurations;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v7), "store");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTPersistenceContainer coordinator](self, "coordinator");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        v10 = objc_msgSend(v8, "removeFromCoordinator:error:", v9, &v19);
        v11 = v19;

        if (v10)
          v12 = v11 == 0;
        else
          v12 = 0;
        if (!v12)
        {
          _rt_log_facility_get_os_log(RTLogFacilityDatabase);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v11;
            _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "error closing store, %@", buf, 0xCu);
          }

          if (v11)
            objc_msgSend(v18, "addObject:", v11);
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v5);
  }

  configurations = self->_configurations;
  self->_configurations = 0;

  _RTSafeArray();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setupPersistenceStores
{
  NSObject *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id WeakRetained;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  char v35;
  uint64_t v36;
  id obj;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (-[RTPersistenceContainer storesNeedSetup](self, "storesNeedSetup"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      -[RTPersistenceContainer name](self, "name");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v45 = (uint64_t)v31;
      _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "container named, %@, opening stores", buf, 0xCu);

    }
    v4 = (void *)-[NSArray mutableCopy](self->_configurations, "mutableCopy");
    if (objc_msgSend(v4, "count"))
    {
      v35 = 0;
      *(_QWORD *)&v5 = 134218498;
      v34 = v5;
      v38 = v4;
      do
      {
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        obj = (id)objc_msgSend(v4, "copy", v34);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v41;
          while (2)
          {
            v9 = 0;
            v36 = v7;
            do
            {
              if (*(_QWORD *)v41 != v8)
                objc_enumerationMutation(obj);
              v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
              v11 = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v10, "store");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTPersistenceContainer coordinator](self, "coordinator");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "URL");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "persistentStoreForURL:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                objc_msgSend(v38, "removeObject:", v10);
              }
              else
              {
                -[RTPersistenceContainer coordinator](self, "coordinator");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = 0;
                v17 = objc_msgSend(v12, "openWithCoordinator:configuration:error:", v16, v10, &v39);
                v18 = v39;

                if (objc_msgSend(v18, "code") == 1)
                {
                  _rt_log_facility_get_os_log(RTLogFacilityDatabase);
                  v19 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                  {
                    -[RTPersistenceContainer name](self, "name");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v45 = (uint64_t)v21;
                    _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "container named, %@, currently unavailable", buf, 0xCu);

                  }
                  objc_msgSend(v38, "removeObject:", v10);
                  v35 = 1;
                }
                else
                {
                  if (v18)
                  {
                    objc_msgSend(v38, "removeAllObjects");
                    -[RTPersistenceContainer setSetupFailed:](self, "setSetupFailed:", 1);

                    objc_autoreleasePoolPop(v11);
                    goto LABEL_32;
                  }
                  if ((v17 & 1) != 0)
                  {
                    objc_msgSend(v38, "removeObject:", v10);
                  }
                  else
                  {
                    if (objc_msgSend(v12, "state") == 2)
                    {
                      _rt_log_facility_get_os_log(RTLogFacilityDatabase);
                      v20 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                      {
                        -[RTPersistenceContainer name](self, "name");
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        v45 = (uint64_t)v22;
                        _os_log_debug_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_DEBUG, "container named, %@, currently yielding", buf, 0xCu);

                      }
                    }
                    else
                    {
                      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                      v20 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                      {
                        v23 = objc_msgSend(v12, "state");
                        *(_DWORD *)buf = v34;
                        v45 = v23;
                        v46 = 2080;
                        v47 = "-[RTPersistenceContainer setupPersistenceStores]";
                        v48 = 1024;
                        v49 = 203;
                        _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "unknown store state, %lu (in %s:%d)", buf, 0x1Cu);
                      }
                    }

                  }
                }
                v7 = v36;

              }
              objc_autoreleasePoolPop(v11);
              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
            if (v7)
              continue;
            break;
          }
        }
LABEL_32:

        v4 = v38;
      }
      while (objc_msgSend(v38, "count"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((v35 & 1) != 0 && !-[RTPersistenceContainer setupFailed](self, "setupFailed"))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[RTPersistenceContainer contextRequestsQueue](self, "contextRequestsQueue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "container:failedToActivateRequestsQueue:", self, v25);

        }
LABEL_48:

        return;
      }
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    }
    v26 = -[RTPersistenceContainer setupFailed](self, "setupFailed");
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);
    if (v26)
    {
      if (v28)
      {
        -[RTPersistenceContainer name](self, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = (uint64_t)v32;
        _os_log_debug_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEBUG, "container named, %@, failed to open all stores", buf, 0xCu);

      }
    }
    else
    {
      if (v28)
      {
        -[RTPersistenceContainer name](self, "name");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v45 = (uint64_t)v33;
        _os_log_debug_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_DEBUG, "container named, %@, successfully opened all stores", buf, 0xCu);

      }
      -[RTPersistenceContainer setServeContexts:](self, "setServeContexts:", 1);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[RTPersistenceContainer contextRequestsQueue](self, "contextRequestsQueue");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "container:willActivateRequestsQueue:", self, v29);

    }
    -[RTPersistenceContainer contextRequestsQueue](self, "contextRequestsQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v30);

    -[RTPersistenceContainer setContextRequestsQueue:](self, "setContextRequestsQueue:", 0);
    goto LABEL_48;
  }
}

- (BOOL)updateContainerConfigurations:(id)a3
{
  id v4;
  NSObject *v5;
  NSArray *v6;
  NSArray *configurations;
  BOOL v8;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[RTPersistenceContainer _validateConfigurations:](self, "_validateConfigurations:", v4)
    && -[RTPersistenceContainer storesNeedSetup](self, "storesNeedSetup"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[RTPersistenceContainer name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v4;
      _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "container named, %@, updating configurations, %@", (uint8_t *)&v11, 0x16u);

    }
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    configurations = self->_configurations;
    self->_configurations = v6;

    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)persistenceContextWithHandler:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _BYTE location[12];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[RTPersistenceContainer contextRequestsQueue](self, "contextRequestsQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      objc_initWeak((id *)location, self);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __56__RTPersistenceContainer_persistenceContextWithHandler___block_invoke;
      v8[3] = &unk_1E929C678;
      v9 = v4;
      objc_copyWeak(&v10, (id *)location);
      dispatch_async(v6, v8);
      objc_destroyWeak(&v10);

      objc_destroyWeak((id *)location);
    }
    else
    {
      -[RTPersistenceContainer _persistenceContext](self, "_persistenceContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v7);

      v6 = 0;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315394;
      *(_QWORD *)&location[4] = "-[RTPersistenceContainer persistenceContextWithHandler:]";
      v12 = 1024;
      v13 = 259;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", location, 0x12u);
    }
  }

}

void __56__RTPersistenceContainer_persistenceContextWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_persistenceContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

- (id)persistenceContext
{
  void *v3;
  void *v4;

  -[RTPersistenceContainer contextRequestsQueue](self, "contextRequestsQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[RTPersistenceContainer _persistenceContext](self, "_persistenceContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)waitForPersistenceContext
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__54;
  v14 = __Block_byref_object_dispose__54;
  v15 = 0;
  -[RTPersistenceContainer contextRequestsQueue](self, "contextRequestsQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __51__RTPersistenceContainer_waitForPersistenceContext__block_invoke;
    v9[3] = &unk_1E929A690;
    v9[4] = self;
    v9[5] = &v10;
    dispatch_sync(v3, v9);
  }
  else
  {
    -[RTPersistenceContainer _persistenceContext](self, "_persistenceContext");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v11[5];
    v11[5] = v5;

  }
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __51__RTPersistenceContainer_waitForPersistenceContext__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_persistenceContext");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_persistenceContext
{
  return -[RTPersistenceContainer persistenceContextWithOptions:](self, "persistenceContextWithOptions:", 0);
}

- (id)persistenceContextWithOptions:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  RTPersistenceContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  RTPersistenceContext *v14;
  NSObject *v15;
  RTPersistenceContext *v16;
  _QWORD v18[5];
  RTPersistenceContext *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[RTPersistenceContainer setupFailed](self, "setupFailed"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTPersistenceContainer persistenceContextWithOptions:]";
      v22 = 1024;
      v23 = 312;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Unable to vend managed object context due to setup failure. (in %s:%d)", buf, 0x12u);
    }
LABEL_4:
    v6 = 0;
    goto LABEL_12;
  }
  if ((a3 & 1) == 0 && !-[RTPersistenceContainer serveContexts](self, "serveContexts"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityDatabase);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "Not serving contexts due to suspension.", buf, 2u);
    }
    goto LABEL_4;
  }
  v7 = -[RTPersistenceContext initWithConcurrencyType:options:]([RTPersistenceContext alloc], "initWithConcurrencyType:options:", 1, a3);
  objc_msgSend(MEMORY[0x1E0C97BA8], "mergeByPropertyStoreTrumpMergePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceContext setMergePolicy:](v7, "setMergePolicy:", v8);

  -[RTPersistenceContainer coordinator](self, "coordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceContext setPersistentStoreCoordinator:](v7, "setPersistentStoreCoordinator:", v9);

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "processName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceContext setName:](v7, "setName:", v11);

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "processName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceContext setTransactionAuthor:](v7, "setTransactionAuthor:", v13);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __56__RTPersistenceContainer_persistenceContextWithOptions___block_invoke;
  v18[3] = &unk_1E9297540;
  v18[4] = self;
  v14 = v7;
  v19 = v14;
  -[RTPersistenceContext performBlockAndWait:](v14, "performBlockAndWait:", v18);
  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTPersistenceContainer persistenceContextWithOptions:]";
      v22 = 1024;
      v23 = 337;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Failed to return a valid managed object context. (in %s:%d)", buf, 0x12u);
    }

  }
  v16 = v19;
  v5 = v14;

  v6 = v5;
LABEL_12:

  return v6;
}

void __56__RTPersistenceContainer_persistenceContextWithOptions___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "userInfo", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "store");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addEntriesFromDictionary:", v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

}

- (RTPersistenceContainerDelegate)delegate
{
  return (RTPersistenceContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)contextRequestsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setContextRequestsQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)serveContexts
{
  return self->_serveContexts;
}

- (void)setServeContexts:(BOOL)a3
{
  self->_serveContexts = a3;
}

- (BOOL)setupFailed
{
  return self->_setupFailed;
}

- (void)setSetupFailed:(BOOL)a3
{
  self->_setupFailed = a3;
}

- (NSPersistentStoreCoordinator)coordinator
{
  return (NSPersistentStoreCoordinator *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCoordinator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_contextRequestsQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configurations, 0);
}

@end
