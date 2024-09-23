@implementation RTStore

void __41__RTStore__storeWritableObjects_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  char v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = (id)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v8++), "managedObjectWithContext:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v6);
  }

  v15 = 0;
  v10 = objc_msgSend(v3, "save:", &v15);
  v11 = v15;
  if ((v10 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v14;
      v22 = 2112;
      v23 = v11;
      _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, id))(v13 + 16))(v13, v11);

}

uint64_t __40__RTStore_storeWritableObjects_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_storeWritableObjects:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)storeWritableObjects:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__RTStore_storeWritableObjects_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)_performBlock:(id)a3 contextType:(unint64_t)a4 errorHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  objc_class *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[5];
  void (**v45)(_QWORD, _QWORD);
  SEL v46;
  _QWORD v47[5];
  id v48;
  void (**v49)(_QWORD, _QWORD);
  unint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  _QWORD v56[3];

  v56[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD))v10;
  if (v9)
  {
    -[RTStore contexts](self, "contexts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __50__RTStore__performBlock_contextType_errorHandler___block_invoke_63;
      v41[3] = &unk_1E9297678;
      v43 = v9;
      v15 = v14;
      v42 = v15;
      objc_msgSend(v15, "performBlock:", v41);

    }
    else
    {
      if (-[RTStore availability](self, "availability"))
      {
        if (v11)
        {
          v22 = -[RTStore availability](self, "availability");
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v24 = *MEMORY[0x1E0D18598];
          if (v22 == 1)
          {
            v53 = *MEMORY[0x1E0CB2D50];
            v25 = (void *)MEMORY[0x1E0CB3940];
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTStore availabilityToString:](RTStore, "availabilityToString:", -[RTStore availability](self, "availability"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("%@, %@, availability, %@"), v27, v28, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v30;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 5, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v51 = *MEMORY[0x1E0CB2D50];
            v38 = (void *)MEMORY[0x1E0CB3940];
            v39 = (objc_class *)objc_opt_class();
            NSStringFromClass(v39);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromSelector(a2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTStore availabilityToString:](RTStore, "availabilityToString:", -[RTStore availability](self, "availability"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[RTStore contextTypeToString:](RTStore, "contextTypeToString:", a4);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "stringWithFormat:", CFSTR("%@, %@, availability, %@, invalid context of type, %@"), v27, v28, v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v31;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 7, v40);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

          }
          ((void (**)(_QWORD, void *))v11)[2](v11, v32);

        }
      }
      else
      {
        -[RTStore dispatcher](self, "dispatcher");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = MEMORY[0x1E0C809B0];
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __50__RTStore__performBlock_contextType_errorHandler___block_invoke;
        v47[3] = &unk_1E929FE80;
        v47[4] = self;
        v48 = v9;
        v50 = a4;
        v49 = v11;
        v44[0] = v34;
        v44[1] = 3221225472;
        v44[2] = __50__RTStore__performBlock_contextType_errorHandler___block_invoke_2;
        v44[3] = &unk_1E9298E88;
        v44[4] = self;
        v46 = a2;
        v45 = v49;
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "enqueueBlock:failureBlock:description:", v47, v44, CFSTR("%@-%@"), v36, v37);

      }
      v15 = 0;
    }
    goto LABEL_14;
  }
  if (v10)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D18598];
    v55 = *MEMORY[0x1E0CB2D50];
    v18 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@, required block"), v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 7, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v21);

LABEL_14:
  }

}

- (NSMutableDictionary)contexts
{
  return self->_contexts;
}

- (void)_storeWritableObjects:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__RTStore__storeWritableObjects_handler___block_invoke;
  v12[3] = &unk_1E9297A08;
  v14 = v8;
  v15 = a2;
  v13 = v7;
  v9 = v8;
  v10 = v7;
  v11 = (void *)MEMORY[0x1D8232094](v12);
  -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v11, 2, v9);

}

+ (id)availabilityToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Unavailable");
  if (a3 == 2)
    return CFSTR("Available");
  else
    return (id)v3;
}

+ (id)contextTypeToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Delete");
  if (a3 == 1)
    v3 = CFSTR("Fetch");
  if (a3 == 2)
    return CFSTR("Insert");
  else
    return (id)v3;
}

- (RTStore)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPersistenceManager_);
}

- (RTStore)initWithPersistenceManager:(id)a3
{
  id v5;
  RTStore *v6;
  RTStore *v7;
  uint64_t v8;
  NSMutableDictionary *contexts;
  RTInvocationDispatcher *v10;
  void *v11;
  uint64_t v12;
  RTInvocationDispatcher *dispatcher;
  RTPersistenceManager *persistenceManager;
  void *v15;
  RTStore *v16;
  NSObject *v17;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v19.receiver = self;
    v19.super_class = (Class)RTStore;
    v6 = -[RTNotifier init](&v19, sel_init);
    v7 = v6;
    if (v6)
    {
      v6->_availability = 0;
      objc_storeStrong((id *)&v6->_persistenceManager, a3);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = objc_claimAutoreleasedReturnValue();
      contexts = v7->_contexts;
      v7->_contexts = (NSMutableDictionary *)v8;

      v10 = [RTInvocationDispatcher alloc];
      -[RTNotifier queue](v7, "queue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[RTInvocationDispatcher initWithQueue:](v10, "initWithQueue:", v11);
      dispatcher = v7->_dispatcher;
      v7->_dispatcher = (RTInvocationDispatcher *)v12;

      persistenceManager = v7->_persistenceManager;
      +[RTNotification notificationName](RTPersistenceManagerNotificationAvailabilityDidChange, "notificationName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTNotifier addObserver:selector:name:](persistenceManager, "addObserver:selector:name:", v7, sel_onPersistenceManagerNotification_, v15);

      -[RTService setup](v7, "setup");
    }
    self = v7;
    v16 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[RTStore initWithPersistenceManager:]";
      v22 = 1024;
      v23 = 81;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: persistenceManager (in %s:%d)", buf, 0x12u);
    }

    v16 = 0;
  }

  return v16;
}

- (void)_setupContextsHandler:(id)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD block[4];
  id v19;
  _QWORD v20[6];
  NSObject *v21;
  SEL v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v5 = dispatch_group_create();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = objc_msgSend(&unk_1E932C790, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(&unk_1E932C790);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
        -[RTStore contexts](self, "contexts", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          dispatch_group_enter(v5);
          -[RTStore persistenceManager](self, "persistenceManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __33__RTStore__setupContextsHandler___block_invoke;
          v20[3] = &unk_1E929FE58;
          v20[4] = self;
          v20[5] = v10;
          v22 = a2;
          v21 = v5;
          objc_msgSend(v13, "createManagedObjectContext:", v20);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(&unk_1E932C790, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }
  -[RTNotifier queue](self, "queue", v16);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__RTStore__setupContextsHandler___block_invoke_35;
  block[3] = &unk_1E9297178;
  v19 = v17;
  v15 = v17;
  dispatch_group_notify(v5, v14, block);

}

void __33__RTStore__setupContextsHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD block[4];
  id v9;
  __int128 v10;
  __int128 v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472;
  v7 = *(_OWORD *)(a1 + 48);
  v10 = *(_OWORD *)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __33__RTStore__setupContextsHandler___block_invoke_2;
  block[3] = &unk_1E92978E8;
  v9 = v3;
  v5 = (id)v7;
  v11 = v7;
  v6 = v3;
  dispatch_async(v4, block);

}

void __33__RTStore__setupContextsHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
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
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "contexts");
    v2 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v2, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = (objc_class *)objc_opt_class();
      NSStringFromClass(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 64));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTStore contextTypeToString:](RTStore, "contextTypeToString:", objc_msgSend(*(id *)(a1 + 48), "integerValue"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412802;
      v8 = v4;
      v9 = 2112;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "%@, %@, failed to create context, %@", (uint8_t *)&v7, 0x20u);

    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __33__RTStore__setupContextsHandler___block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_onPersistenceManagerNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTPersistenceManagerNotificationAvailabilityDidChange, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v8 = objc_msgSend(v4, "availability");
    if (v8 == 2)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __45__RTStore__onPersistenceManagerNotification___block_invoke;
      v11[3] = &unk_1E9297150;
      v11[4] = self;
      -[RTStore _setupContextsHandler:](self, "_setupContextsHandler:", v11);
    }
    else
    {
      v9 = v8;
      -[RTStore contexts](self, "contexts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeAllObjects");

      -[RTStore setAvailability:](self, "setAvailability:", v9 == 1);
    }
  }

}

uint64_t __45__RTStore__onPersistenceManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAvailability:", 2);
}

- (void)onPersistenceManagerNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__RTStore_onPersistenceManagerNotification___block_invoke;
  block[3] = &unk_1E9297540;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __44__RTStore_onPersistenceManagerNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onPersistenceManagerNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[RTStore persistenceManager](self, "persistenceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTPersistenceManagerNotificationAvailabilityDidChange, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:fromNotification:", self, v5);

  -[RTStore contexts](self, "contexts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[RTStore dispatcher](self, "dispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shutdown");

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    v8 = v9;
  }

}

- (void)internalAddObserver:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  RTStoreNotificationAvailabilityDidChange *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    v10 = -[RTStoreNotificationAvailabilityDidChange initWithAvailability:]([RTStoreNotificationAvailabilityDidChange alloc], "initWithAvailability:", -[RTStore availability](self, "availability"));
    -[RTNotifier postNotification:toObserver:](self, "postNotification:toObserver:", v10, v6);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)internalRemoveObserver:(id)a3 name:(id)a4
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  +[RTNotification notificationName](RTStoreNotificationAvailabilityDidChange, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "unhandled notification %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)setAvailability:(unint64_t)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  RTStoreNotificationAvailabilityDidChange *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_availability != a3)
  {
    self->_availability = a3;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTStore availabilityToString:](RTStore, "availabilityToString:", self->_availability);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, availability, %@", (uint8_t *)&v12, 0x16u);

    }
    v8 = -[RTStoreNotificationAvailabilityDidChange initWithAvailability:]([RTStoreNotificationAvailabilityDidChange alloc], "initWithAvailability:", self->_availability);
    -[RTNotifier postNotification:](self, "postNotification:", v8);

    -[RTStore dispatcher](self, "dispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "invocationsPending");

    if (v10)
    {
      -[RTStore dispatcher](self, "dispatcher");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dispatchPendingInvocations");

    }
  }
}

- (void)fetchAvailabilityWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  NSObject *v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__RTStore_fetchAvailabilityWithHandler___block_invoke;
    v7[3] = &unk_1E9297678;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

    v6 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

uint64_t __40__RTStore_fetchAvailabilityWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 0);
}

- (void)_updateWritableObjects:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  SEL v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSSelectorFromString(CFSTR("updateManagedObject:"));
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __42__RTStore__updateWritableObjects_handler___block_invoke;
      v24[3] = &unk_1E9297A08;
      v25 = v7;
      v27 = a2;
      v11 = v8;
      v26 = v11;
      v12 = (void *)MEMORY[0x1D8232094](v24);
      -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v12, 2, v11);

    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@, %@ does not support update protocol"), v14, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v31 = v18;
        v32 = 2080;
        v33 = "-[RTStore _updateWritableObjects:handler:]";
        v34 = 1024;
        v35 = 313;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "%@ (in %s:%d)", buf, 0x1Cu);
      }

      if (v8)
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0D18598];
        v28 = *MEMORY[0x1E0CB2D50];
        v29 = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 7, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v8 + 2))(v8, v23);

      }
    }
  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

void __42__RTStore__updateWritableObjects_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "mergePolicy");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMergePolicy:", *MEMORY[0x1E0C978C0]);
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("MO"));
  v7 = objc_claimAutoreleasedReturnValue();

  v39 = (void *)v7;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("identifier"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v11);

  objc_msgSend(v8, "setReturnsObjectsAsFaults:", 0);
  v51 = 0;
  objc_msgSend(v8, "execute:", &v51);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v51;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 138413058;
    v55 = v35;
    v56 = 2112;
    v57 = v8;
    v58 = 2048;
    v59 = v36;
    v60 = 2112;
    v61 = v13;
    _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  v38 = v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v40 = a1;
  v16 = *(id *)(a1 + 32);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v48 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v21, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, v22);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v18);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v23 = v12;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v44 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend(v28, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "updateManagedObject:", v28);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v25);
  }

  v42 = v38;
  v31 = objc_msgSend(v3, "save:", &v42);
  v32 = v42;

  if ((v31 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(v40 + 48));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v55 = v37;
      v56 = 2112;
      v57 = v32;
      _os_log_error_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
  }
  objc_msgSend(v3, "setMergePolicy:", v41);
  v34 = *(_QWORD *)(v40 + 40);
  if (v34)
    (*(void (**)(uint64_t, id))(v34 + 16))(v34, v32);

}

- (void)updateWritableObjects:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__RTStore_updateWritableObjects_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __41__RTStore_updateWritableObjects_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateWritableObjects:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __50__RTStore__performBlock_contextType_errorHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performBlock:contextType:errorHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __50__RTStore__performBlock_contextType_errorHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(*(SEL *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@, failed invoking pending invocation"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D18598];
    v13 = *MEMORY[0x1E0CB2D50];
    v14 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);

  }
}

uint64_t __50__RTStore__performBlock_contextType_errorHandler___block_invoke_63(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (void)removeAll:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__RTStore_removeAll_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __29__RTStore_removeAll_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAll:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_removeAll:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  RTStore *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTStore _removeAll:handler:]";
      v17 = 1024;
      v18 = 463;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: classes (in %s:%d)", buf, 0x12u);
    }

  }
  if (objc_msgSend(v6, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __30__RTStore__removeAll_handler___block_invoke;
    v11[3] = &unk_1E9297A30;
    v12 = v6;
    v13 = self;
    v9 = v7;
    v14 = v9;
    v10 = (void *)MEMORY[0x1D8232094](v11);
    -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v10, 0, v9);

  }
}

void __30__RTStore__removeAll_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        if (objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()))
        {
          objc_msgSend(v9, "fetchRequest");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v10);
          objc_msgSend(v11, "setResultType:", 2);
          objc_msgSend(v3, "addObject:", v11);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "executeDeleteRequests:context:handler:", v3, v12, *(_QWORD *)(a1 + 48));
}

- (void)purgePredating:(id)a3 predicateMappings:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__RTStore_purgePredating_predicateMappings_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __52__RTStore_purgePredating_predicateMappings_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v5, a1[5]);
  objc_msgSend(v2, "_purgeDateInterval:predicateMappings:limit:handler:", v4, a1[6], 0, a1[7]);

}

- (void)purgePredating:(id)a3 predicateMappings:(id)a4 purgeLimit:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__RTStore_purgePredating_predicateMappings_purgeLimit_handler___block_invoke;
  block[3] = &unk_1E9297910;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

void __63__RTStore_purgePredating_predicateMappings_purgeLimit_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)a1[4];
  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v5, a1[5]);
  objc_msgSend(v2, "_purgeDateInterval:predicateMappings:limit:handler:", v4, a1[6], a1[8], a1[7]);

}

- (void)purgeDateInterval:(id)a3 predicateMappings:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  -[RTNotifier queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__RTStore_purgeDateInterval_predicateMappings_handler___block_invoke;
  v15[3] = &unk_1E9297EB8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

uint64_t __55__RTStore_purgeDateInterval_predicateMappings_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeDateInterval:predicateMappings:limit:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
}

- (void)purgeDateInterval:(id)a3 predicateMappings:(id)a4 purgeLimit:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[RTNotifier queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__RTStore_purgeDateInterval_predicateMappings_purgeLimit_handler___block_invoke;
  block[3] = &unk_1E9297910;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, block);

}

uint64_t __66__RTStore_purgeDateInterval_predicateMappings_purgeLimit_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_purgeDateInterval:predicateMappings:limit:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)_purgeDateInterval:(id)a3 predicateMappings:(id)a4 limit:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString **v21;
  uint64_t *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;
  id v30;
  RTStore *v31;
  id v32;
  unint64_t v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10)
  {
    if (v11)
    {
      objc_msgSend(v11, "allKeys");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        v24 = MEMORY[0x1E0C809B0];
        v25 = 3221225472;
        v26 = __62__RTStore__purgeDateInterval_predicateMappings_limit_handler___block_invoke;
        v27 = &unk_1E929FEA8;
        v13 = v13;
        v28 = v13;
        v29 = v11;
        v33 = a5;
        v30 = v10;
        v31 = self;
        v14 = v12;
        v32 = v14;
        v15 = (void *)MEMORY[0x1D8232094](&v24);
        -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v15, 0, v14, v24, v25, v26, v27);

      }
      else if (v12)
      {
        (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
      }
      goto LABEL_15;
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[RTStore _purgeDateInterval:predicateMappings:limit:handler:]";
      v40 = 1024;
      v41 = 540;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval (in %s:%d)", buf, 0x12u);
    }

    if (v11)
      goto LABEL_12;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[RTStore _purgeDateInterval:predicateMappings:limit:handler:]";
    v40 = 1024;
    v41 = 541;
    _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mappings (in %s:%d)", buf, 0x12u);
  }

  if (v10)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D18598];
    v34 = *MEMORY[0x1E0CB2D50];
    v35 = CFSTR("requires a non-nil mappings.");
    v20 = (void *)MEMORY[0x1E0C99D80];
    v21 = &v35;
    v22 = &v34;
    goto LABEL_13;
  }
LABEL_12:
  v18 = (void *)MEMORY[0x1E0CB35C8];
  v19 = *MEMORY[0x1E0D18598];
  v36 = *MEMORY[0x1E0CB2D50];
  v37 = CFSTR("requires a non-nil dateInterval.");
  v20 = (void *)MEMORY[0x1E0C99D80];
  v21 = &v37;
  v22 = &v36;
LABEL_13:
  objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 7, v23);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
    (*((void (**)(id, id))v12 + 2))(v12, v13);
LABEL_15:

}

void __62__RTStore__purgeDateInterval_predicateMappings_limit_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
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
  id v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  void *context;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v16 = a2;
  v3 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = *(id *)(a1 + 32);
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v28;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(obj);
        v21 = v4;
        v5 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v4);
        context = (void *)MEMORY[0x1D8231EA8]();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v24;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v24 != v8)
                objc_enumerationMutation(v22);
              objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "fetchRequest");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setFetchLimit:", *(_QWORD *)(a1 + 72));
              v11 = (void *)MEMORY[0x1E0CB3880];
              objc_msgSend(*(id *)(a1 + 48), "startDate");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 48), "endDate");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "predicateWithFormat:", CFSTR("%@ < %K AND %K < %@"), v12, v5, v5, v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "setPredicate:", v14);

              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v10);
              objc_msgSend(v15, "setResultType:", 2);
              objc_msgSend(v3, "addObject:", v15);

              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v7);
        }

        objc_autoreleasePoolPop(context);
        v4 = v21 + 1;
      }
      while (v21 + 1 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v19);
  }

  objc_msgSend(*(id *)(a1 + 56), "executeDeleteRequests:context:handler:", v3, v16, *(_QWORD *)(a1 + 64));
}

- (void)executeDeleteRequests:(id)a3 context:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void (**v30)(id, void *);
  id obj;
  uint64_t v33;
  uint64_t v34;
  void *context;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v30 = (void (**)(id, void *))a5;
  v9 = (void *)objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v7;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
  if (v34)
  {
    v33 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v39 != v33)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        context = (void *)MEMORY[0x1D8231EA8]();
        v12 = 0;
        while (1)
        {
          v13 = v12;
          v14 = (void *)MEMORY[0x1D8231EA8]();
          v37 = v12;
          objc_msgSend(v8, "executeRequest:error:", v11, &v37);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v37;

          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "result");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v45 = v20;
            v46 = 2112;
            v47 = v11;
            v48 = 2112;
            v49 = v21;
            v50 = 2112;
            v51 = v12;
            _os_log_debug_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_DEBUG, "%@, request, %@, deleted count, %@, error, %@", buf, 0x2Au);

          }
          if (v12)
            objc_msgSend(v9, "addObject:", v12);
          if (objc_msgSend(v9, "count", v30))
            break;
          objc_msgSend(v11, "fetchRequest");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v17, "fetchLimit"))
          {

            break;
          }
          objc_msgSend(v15, "result");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "unsignedIntegerValue");

          objc_autoreleasePoolPop(v14);
          if (!v19)
            goto LABEL_17;
        }

        objc_autoreleasePoolPop(v14);
LABEL_17:

        objc_autoreleasePoolPop(context);
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
    }
    while (v34);
  }

  v36 = 0;
  v22 = objc_msgSend(v8, "save:", &v36);
  v23 = v36;
  if ((v22 & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v29;
      v46 = 2112;
      v47 = v23;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

    }
    objc_msgSend(v9, "addObject:", v23);
  }
  if (v30)
  {
    if ((unint64_t)objc_msgSend(v9, "count") > 1)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v27 = *MEMORY[0x1E0D18598];
      v42 = *MEMORY[0x1E0D18590];
      v43 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, 9, v28);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v9, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v30[2](v30, v25);

  }
}

- (void)fetchEnumerableObjectsWithOptions:(id)a3 offset:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  RTStore *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString **v19;
  uint64_t *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  unint64_t v25;
  id v26;
  uint8_t buf[8];
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v9)
  {
    if ((-[RTStore conformsToProtocol:](self, "conformsToProtocol:", &unk_1EFC75978) & 1) != 0)
    {
      v10 = objc_msgSend(v8, "enumeratedType");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v11 = self;
        v26 = 0;
        -[RTStore fetchRequestFromOptions:offset:error:](v11, "fetchRequestFromOptions:offset:error:", v8, a4, &v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v26;
        if (v12)
        {
          objc_msgSend(v8, "processingBlock");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __60__RTStore_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke;
          v22[3] = &unk_1E929FED0;
          v25 = a4;
          v23 = v14;
          v24 = v9;
          v15 = v14;
          -[RTStore fetchReadableObjectsOfType:fetchRequest:handler:](v11, "fetchReadableObjectsOfType:fetchRequest:handler:", v10, v12, v22);

        }
        else
        {
          (*((void (**)(id, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, v13);
        }

        goto LABEL_13;
      }
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D18598];
      v28 = *MEMORY[0x1E0CB2D50];
      v29 = CFSTR("the enumerated type is not a CoreDataReadable");
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = &v29;
      v20 = &v28;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0D18598];
      v30 = *MEMORY[0x1E0CB2D50];
      v31[0] = CFSTR("this store does not conform to RTEnumerableStore");
      v18 = (void *)MEMORY[0x1E0C99D80];
      v19 = (const __CFString **)v31;
      v20 = &v30;
    }
    objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 7, v21);
    v11 = (RTStore *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, RTStore *))v9 + 2))(v9, 0, 0, v11);
    goto LABEL_13;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v11 = (RTStore *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v11->super.super.super, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, &v11->super.super.super, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_13:

}

void __60__RTStore_fetchEnumerableObjectsWithOptions_offset_handler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v10 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count") + a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a1[4];
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v10);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v8;
  }
  else
  {
    v9 = v10;
  }
  v11 = v9;
  (*(void (**)(void))(a1[5] + 16))();

}

- (void)enumerateType:(Class)a3 fetchRequest:(id)a4 enumerationBlock:(id)a5
{
  void (**v7)(id, _QWORD, id, char *);
  void *v8;
  NSObject *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  id v29;
  NSObject *v30;
  id v31;
  char v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v49;
  uint64_t v50;
  id v51;
  Class v52;
  uint64_t v53;
  void *v55;
  _QWORD v56[4];
  NSObject *v57;
  _BYTE *v58;
  uint64_t *v59;
  uint64_t v60;
  id *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  char v66;
  _BYTE buf[12];
  __int16 v68;
  Class v69;
  __int16 v70;
  void *v71;
  _BYTE v72[24];
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;
  const __CFString *v77;
  uint64_t v78;
  const __CFString *v79;
  uint64_t v80;
  const __CFString *v81;
  uint64_t v82;
  const __CFString *v83;
  _QWORD v84[4];

  v84[1] = *MEMORY[0x1E0C80C00];
  v51 = a4;
  v7 = (void (**)(id, _QWORD, id, char *))a5;
  if (v7)
  {
    v66 = 0;
    if (a3)
    {
      if ((-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_1EFC70960) & 1) != 0)
      {
        if (-[RTStore availability](self, "availability") == 2)
        {
          if (v51)
          {
            v52 = a3;
            v55 = (void *)objc_msgSend(v51, "copy");
            v53 = 0;
            *(_QWORD *)v72 = 0;
            *(_QWORD *)&v72[8] = v72;
            *(_QWORD *)&v72[16] = 0x3032000000;
            v73 = __Block_byref_object_copy__82;
            v74 = __Block_byref_object_dispose__82;
            v75 = 0;
            v60 = 0;
            v61 = (id *)&v60;
            v62 = 0x3032000000;
            v63 = __Block_byref_object_copy__82;
            v64 = __Block_byref_object_dispose__82;
            v65 = 0;
            v49 = *MEMORY[0x1E0D18598];
            v50 = *MEMORY[0x1E0CB2D50];
            while (1)
            {
              v8 = (void *)MEMORY[0x1D8231EA8]();
              objc_msgSend(v55, "setFetchOffset:", v53);
              _rt_log_facility_get_os_log(RTLogFacilityStore);
              v9 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              {
                NSStringFromSelector(a2);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v33;
                v68 = 2112;
                v69 = v52;
                v70 = 2112;
                v71 = v55;
                _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "%@, iterating type %@, with fetchRequest, %@", buf, 0x20u);

              }
              v10 = dispatch_semaphore_create(0);
              v56[0] = MEMORY[0x1E0C809B0];
              v56[1] = 3221225472;
              v56[2] = __55__RTStore_enumerateType_fetchRequest_enumerationBlock___block_invoke;
              v56[3] = &unk_1E9296EE0;
              v58 = v72;
              v59 = &v60;
              v11 = v10;
              v57 = v11;
              -[RTStore fetchReadableObjectsOfType:fetchRequest:handler:](self, "fetchReadableObjectsOfType:fetchRequest:handler:", v52, v55, v56);
              v12 = v11;
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = dispatch_time(0, 3600000000000);
              if (!dispatch_semaphore_wait(v12, v14))
                goto LABEL_14;
              objc_msgSend(MEMORY[0x1E0C99D68], "now");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "timeIntervalSinceDate:", v13);
              v17 = v16;
              v18 = (void *)objc_opt_new();
              objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_67);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "firstObject");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
              }

              v24 = (void *)MEMORY[0x1E0CB35C8];
              v84[0] = v50;
              *(_QWORD *)buf = CFSTR("semaphore wait timeout");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v84, 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "errorWithDomain:code:userInfo:", v49, 15, v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v26)
              {
                v27 = objc_retainAutorelease(v26);

                v28 = 0;
              }
              else
              {
LABEL_14:
                v27 = 0;
                v28 = 1;
              }

              v29 = v27;
              if ((v28 & 1) == 0)
                objc_storeStrong(v61 + 5, v27);
              v7[2](v7, *(_QWORD *)(*(_QWORD *)&v72[8] + 40), v61[5], &v66);
              if (v66)
                break;
              if (v61[5])
              {
                _rt_log_facility_get_os_log(RTLogFacilityStore);
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  v31 = v61[5];
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v31;
                  _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "received error while enumerating, %@", buf, 0xCu);
                }
                goto LABEL_24;
              }
              if (objc_msgSend(*(id *)(*(_QWORD *)&v72[8] + 40), "count"))
              {
                v53 += objc_msgSend(*(id *)(*(_QWORD *)&v72[8] + 40), "count");
                v32 = 1;
                goto LABEL_26;
              }
LABEL_25:
              v32 = 0;
LABEL_26:

              objc_autoreleasePoolPop(v8);
              if ((v32 & 1) == 0)
              {
                _Block_object_dispose(&v60, 8);

                _Block_object_dispose(v72, 8);
                goto LABEL_45;
              }
            }
            _rt_log_facility_get_os_log(RTLogFacilityStore);
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "client set stop bit while enumerating, breaking out.", buf, 2u);
            }
LABEL_24:

            goto LABEL_25;
          }
          v43 = (void *)MEMORY[0x1E0CB35C8];
          v76 = *MEMORY[0x1E0CB2D50];
          v77 = CFSTR("requires non-nil fetchRequest");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v44);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityStore);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v72 = 138412546;
            *(_QWORD *)&v72[4] = v47;
            *(_WORD *)&v72[12] = 2112;
            *(_QWORD *)&v72[14] = v55;
            _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, error, %@", v72, 0x16u);

          }
        }
        else
        {
          v40 = (void *)MEMORY[0x1E0CB35C8];
          v78 = *MEMORY[0x1E0CB2D50];
          v79 = CFSTR("resource temporarily unavailable.");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 5, v41);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          _rt_log_facility_get_os_log(RTLogFacilityStore);
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v72 = 138412546;
            *(_QWORD *)&v72[4] = v42;
            *(_WORD *)&v72[12] = 2112;
            *(_QWORD *)&v72[14] = v55;
            _os_log_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_INFO, "%@, error, %@", v72, 0x16u);

          }
        }
      }
      else
      {
        v38 = (void *)MEMORY[0x1E0CB35C8];
        v80 = *MEMORY[0x1E0CB2D50];
        v81 = CFSTR("requires a type that conforms to RTCoreDataReadable.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v39);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        _rt_log_facility_get_os_log(RTLogFacilityStore);
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v72 = 138412546;
          *(_QWORD *)&v72[4] = v46;
          *(_WORD *)&v72[12] = 2112;
          *(_QWORD *)&v72[14] = v55;
          _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, error, %@", v72, 0x16u);

        }
      }
    }
    else
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v82 = *MEMORY[0x1E0CB2D50];
      v83 = CFSTR("requires non-nil type");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 7, v36);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      _rt_log_facility_get_os_log(RTLogFacilityStore);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v72 = 138412546;
        *(_QWORD *)&v72[4] = v45;
        *(_WORD *)&v72[12] = 2112;
        *(_QWORD *)&v72[14] = v55;
        _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, "%@, error, %@", v72, 0x16u);

      }
    }

    v66 = 1;
    v7[2](v7, 0, v55, &v66);
LABEL_45:

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v72 = 0;
      _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: enumerationBlock", v72, 2u);
    }

  }
}

void __55__RTStore_enumerateType_fetchRequest_enumerationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)fetchReadableObjectsOfType:(Class)a3 fetchRequest:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  Class v15;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  if (v9)
  {
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __59__RTStore_fetchReadableObjectsOfType_fetchRequest_handler___block_invoke;
    v12[3] = &unk_1E929FEF8;
    v12[4] = self;
    v15 = a3;
    v13 = v8;
    v14 = v9;
    dispatch_async(v10, v12);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

uint64_t __59__RTStore_fetchReadableObjectsOfType_fetchRequest_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchReadableObjectsOfType:fetchRequest:handler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_fetchReadableObjectsOfType:(Class)a3 fetchRequest:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString **v18;
  uint64_t *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  SEL v26;
  Class v27;
  uint8_t buf[8];
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    if (a3)
    {
      if (v9)
      {
        v11 = MEMORY[0x1E0C809B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __60__RTStore__fetchReadableObjectsOfType_fetchRequest_handler___block_invoke;
        v23[3] = &unk_1E929FF40;
        v24 = v9;
        v26 = a2;
        v12 = v10;
        v25 = v12;
        v27 = a3;
        v13 = (void *)MEMORY[0x1D8232094](v23);
        v21[0] = v11;
        v21[1] = 3221225472;
        v21[2] = __60__RTStore__fetchReadableObjectsOfType_fetchRequest_handler___block_invoke_147;
        v21[3] = &unk_1E9297568;
        v22 = v12;
        -[RTStore _performBlock:contextType:errorHandler:](self, "_performBlock:contextType:errorHandler:", v13, 1, v21);

        v14 = v24;
        goto LABEL_10;
      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v29 = *MEMORY[0x1E0CB2D50];
      v30 = CFSTR("requires a non-nil fetchRequest");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = &v30;
      v19 = &v29;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D18598];
      v31 = *MEMORY[0x1E0CB2D50];
      v32[0] = CFSTR("requires a non-nil type");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = (const __CFString **)v32;
      v19 = &v31;
    }
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 7, v20);
    v14 = objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, NSObject *))v10 + 2))(v10, 0, v14);
    goto LABEL_10;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
  }
LABEL_10:

}

void __60__RTStore__fetchReadableObjectsOfType_fetchRequest_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _RTMap *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v12 = 0;
  objc_msgSend(v2, "execute:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  _rt_log_facility_get_os_log(RTLogFacilityStore);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 138413058;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2048;
    v18 = v10;
    v19 = 2112;
    v20 = v4;
    _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@, request, %@, results count, %lu, error, %@", buf, 0x2Au);

  }
  if (v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v6 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v3);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__RTStore__fetchReadableObjectsOfType_fetchRequest_handler___block_invoke_143;
    v11[3] = &__block_descriptor_40_e47____RTCoreDataReadable__16__0__NSManagedObject_8lu32l8;
    v11[4] = *(_QWORD *)(a1 + 56);
    -[_RTMap withBlock:](v6, "withBlock:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

id __60__RTStore__fetchReadableObjectsOfType_fetchRequest_handler___block_invoke_143(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "createWithManagedObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityStore);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_fault_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_FAULT, "nil initialization of object of type, %@, using managedObject, %@", (uint8_t *)&v8, 0x16u);
    }

  }
  return v4;
}

uint64_t __60__RTStore__fetchReadableObjectsOfType_fetchRequest_handler___block_invoke_147(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setContexts:(id)a3
{
  objc_storeStrong((id *)&self->_contexts, a3);
}

- (RTInvocationDispatcher)dispatcher
{
  return self->_dispatcher;
}

- (void)setDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_dispatcher, a3);
}

- (unint64_t)availability
{
  return self->_availability;
}

- (RTPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
}

@end
