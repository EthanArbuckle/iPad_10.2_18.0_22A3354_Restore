@implementation SUCoreActivityScheduler

- (SUCoreActivityScheduler)initWithPersistedStatePath:(id)a3
{
  id v4;
  SUCoreActivityScheduler *v5;
  uint64_t v6;
  _CDContext *context;
  NSMutableArray *v8;
  NSMutableArray *activityArray;
  NSMutableArray *v10;
  NSMutableArray *registrationArray;
  dispatch_queue_t v12;
  OS_dispatch_queue *stateQueue;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  OS_dispatch_queue *v24;
  void *v25;
  uint64_t v26;
  SUCorePersistedState *persistedState;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v33;
  objc_super v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SUCoreActivityScheduler;
  v5 = -[SUCoreActivityScheduler init](&v34, sel_init);
  if (!v5)
    goto LABEL_19;
  if (!objc_opt_class() || !objc_opt_class())
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "oslog");
    v29 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[SUCoreActivityScheduler initWithPersistedStatePath:].cold.1();

    v15 = v5;
    v5 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0D15C48], "userContext");
  v6 = objc_claimAutoreleasedReturnValue();
  context = v5->_context;
  v5->_context = (_CDContext *)v6;

  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  activityArray = v5->_activityArray;
  v5->_activityArray = v8;

  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  registrationArray = v5->_registrationArray;
  v5->_registrationArray = v10;

  v12 = dispatch_queue_create("com.apple.softwareupdatecore.activityscheduler", 0);
  stateQueue = v5->_stateQueue;
  v5->_stateQueue = (OS_dispatch_queue *)v12;

  if (v4)
  {
    objc_msgSend(v4, "URLByDeletingLastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "fileExistsAtPath:", v15);

    if ((v17 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      objc_msgSend(v18, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v33);
      v19 = v33;

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "oslog");
        v21 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "path");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v22;
          v37 = 2114;
          v38 = v19;
          _os_log_impl(&dword_1DDFDD000, v21, OS_LOG_TYPE_DEFAULT, "Error creating persisted state file %{public}@: %{public}@", buf, 0x16u);

        }
      }

    }
    v23 = objc_alloc(MEMORY[0x1E0DA8970]);
    v24 = v5->_stateQueue;
    objc_msgSend(v4, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v23, "initWithDispatchQueue:withPersistencePath:forPolicyVersion:", v24, v25, CFSTR("1.0"));
    persistedState = v5->_persistedState;
    v5->_persistedState = (SUCorePersistedState *)v26;

    -[SUCoreActivityScheduler _loadPersistedRegistrationMap](v5, "_loadPersistedRegistrationMap");
LABEL_15:

  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "oslog");
  v31 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v4;
    _os_log_impl(&dword_1DDFDD000, v31, OS_LOG_TYPE_DEFAULT, "Created SUCoreActivityScheduler with persisted state path: %{public}@", buf, 0xCu);
  }

LABEL_19:
  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance___instance;
}

void __41__SUCoreActivityScheduler_sharedInstance__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SUCoreActivityScheduler *v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("."));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3
      || (v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@.state"), CFSTR("/var/mobile/Library/SoftwareUpdateCore/"), v3)) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oslog");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __41__SUCoreActivityScheduler_sharedInstance__block_invoke_cold_1();

      v4 = v1;
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executablePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_12:
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), CFSTR("/var/mobile/Library/SoftwareUpdateCore/"), CFSTR("SUCoreActivitySchedulerDefaultSharedState.state"));
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create a file path from bundleIdentifier, falling back to the default of %@"), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreActivityScheduler"), v11, 8116, 0);

LABEL_13:
    goto LABEL_14;
  }
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {

    goto LABEL_12;
  }
  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@.state"), CFSTR("/var/mobile/Library/SoftwareUpdateCore/"), v10);

  if (!v4)
    goto LABEL_12;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SUCoreActivityScheduler initWithPersistedStatePath:]([SUCoreActivityScheduler alloc], "initWithPersistedStatePath:", v12);
  v14 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v13;

}

- (void)_queue_addRegistration:(id)a3 forActivity:(id)a4
{
  NSObject *stateQueue;
  id v7;
  id v8;

  stateQueue = self->_stateQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(stateQueue);
  -[NSMutableArray addObject:](self->_activityArray, "addObject:", v7);

  -[NSMutableArray addObject:](self->_registrationArray, "addObject:", v8);
}

- (void)_queue_removeRegistrationForActivity:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v4 = -[NSMutableArray indexOfObject:](self->_activityArray, "indexOfObject:", v5);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && -[NSMutableArray count](self->_registrationArray, "count") > v4)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_registrationArray, "removeObjectAtIndex:", -[NSMutableArray indexOfObject:](self->_activityArray, "indexOfObject:", v5));
    -[NSMutableArray removeObject:](self->_activityArray, "removeObject:", v5);
  }

}

- (id)_queue_registrationForActivity:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;

  v4 = a3;
  v5 = -[NSMutableArray indexOfObject:](self->_activityArray, "indexOfObject:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || -[NSMutableArray count](self->_registrationArray, "count") <= v5)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_registrationArray, "objectAtIndex:", -[NSMutableArray indexOfObject:](self->_activityArray, "indexOfObject:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)_registerRegistration:(id)a3 forActivity:(id)a4
{
  id v6;
  id v7;
  NSObject *stateQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SUCoreActivityScheduler *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SUCoreActivityScheduler__registerRegistration_forActivity___block_invoke;
  block[3] = &unk_1EA878940;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(stateQueue, block);

}

uint64_t __61__SUCoreActivityScheduler__registerRegistration_forActivity___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "registerCallback:");
    objc_msgSend(*(id *)(a1 + 40), "_queue_addRegistration:forActivity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  return objc_msgSend(*(id *)(a1 + 40), "_queue_persistRegistrationMap");
}

- (void)_unregisterRegistrationForActivity:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SUCoreActivityScheduler__unregisterRegistrationForActivity___block_invoke;
  v7[3] = &unk_1EA878A88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __62__SUCoreActivityScheduler__unregisterRegistrationForActivity___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_queue_registrationForActivity:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deregisterCallback:", v2);
  objc_msgSend(*(id *)(a1 + 32), "_queue_removeRegistrationForActivity:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_queue_persistRegistrationMap");

}

- (void)_unregisterAllActivitiesWithName:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SUCoreActivityScheduler__unregisterAllActivitiesWithName___block_invoke;
  v7[3] = &unk_1EA878A88;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

void __60__SUCoreActivityScheduler__unregisterAllActivitiesWithName___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v8, "activityName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40));

        if (v10)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v2;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 32), "_queue_registrationForActivity:", v16, (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deregisterCallback:", v17);
        objc_msgSend(*(id *)(a1 + 32), "_queue_removeRegistrationForActivity:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_persistRegistrationMap");
}

- (id)_copyRegisteredActivities
{
  NSObject *stateQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__SUCoreActivityScheduler__copyRegisteredActivities__block_invoke;
  v6[3] = &unk_1EA877F20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__SUCoreActivityScheduler__copyRegisteredActivities__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_queue_persistRegistrationMap
{
  SUCoreActivityScheduler *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  SUCoreActivityScheduler *v21;
  void *v22;
  NSObject *v23;
  __int128 v24;
  id v25;
  id v26;
  NSMutableArray *obj;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v2 = self;
  v40 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v2->_activityArray;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v32;
    v7 = 0x1E0CB3000uLL;
    *(_QWORD *)&v4 = 138543618;
    v24 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[SUCoreActivityScheduler _queue_registrationForActivity:](v2, "_queue_registrationForActivity:", v9, v24);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = *(void **)(v7 + 1784);
          v30 = 0;
          objc_msgSend(v11, "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v30);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = v30;
          v28 = (void *)v12;
          if (v13)
          {
            objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "oslog");
            v15 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v24;
              v36 = v10;
              v37 = 2114;
              v38 = v13;
              _os_log_error_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_ERROR, "Error archiving registration:%{public}@ error:%{public}@", buf, 0x16u);
            }

          }
          else
          {
            objc_msgSend(v26, "addObject:", v12);
          }
          v17 = *(void **)(v7 + 1784);
          v29 = v13;
          objc_msgSend(v17, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v29);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v29;

          if (v16)
          {
            v19 = v5;
            v20 = v6;
            v21 = v2;
            objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "oslog");
            v23 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v24;
              v36 = v9;
              v37 = 2114;
              v38 = v16;
              _os_log_error_impl(&dword_1DDFDD000, v23, OS_LOG_TYPE_ERROR, "Error archiving activity:%{public}@ error:%{public}@", buf, 0x16u);
            }

            v2 = v21;
            v6 = v20;
            v5 = v19;
            v7 = 0x1E0CB3000;
          }
          else
          {
            objc_msgSend(v25, "addObject:", v18);
          }

        }
        else
        {
          v16 = 0;
        }

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v5);
  }

  -[SUCorePersistedState persistObject:forKey:](v2->_persistedState, "persistObject:forKey:", v26, CFSTR("RegistrationKey"));
  -[SUCorePersistedState persistObject:forKey:](v2->_persistedState, "persistObject:forKey:", v25, CFSTR("ActivityKey"));

}

- (void)_loadPersistedRegistrationMap
{
  NSObject *stateQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke;
  block[3] = &unk_1EA877EF8;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  NSObject *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  __int128 v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  id v63;
  uint8_t buf[4];
  NSObject *v65;
  __int16 v66;
  void *v67;
  _QWORD v68[6];

  v68[4] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "loadPersistedState") & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:ofClass:", CFSTR("RegistrationKey"), objc_opt_class());
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:ofClass:", CFSTR("ActivityKey"), objc_opt_class());
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v2)
      v5 = v3 == 0;
    else
      v5 = 1;
    if (!v5)
    {
      if (-[NSObject count](v2, "count"))
      {
        v7 = -[NSObject count](v2, "count");
        if (v7 == objc_msgSend(v4, "count"))
        {
          objc_msgSend(*(id *)(a1 + 32), "_contextStoreRegisteredActivities");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "count"))
          {
            v58 = a1;
            v9 = 0;
            v10 = 0x1E0CB3000uLL;
            *(_QWORD *)&v8 = 134217984;
            v57 = v8;
            v59 = v4;
            v60 = v2;
            while (1)
            {
              objc_msgSend(v4, "objectAtIndex:", v9, v57);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject objectAtIndex:](v2, "objectAtIndex:", v9);
              v12 = objc_claimAutoreleasedReturnValue();
              v13 = (void *)v12;
              if (v12)
              {
                if (v11)
                  break;
              }
              if (!v12)
              {
                objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "oslog");
                v32 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v57;
                  v65 = v9;
                  _os_log_error_impl(&dword_1DDFDD000, v32, OS_LOG_TYPE_ERROR, "No registrationData found at index: %lu", buf, 0xCu);
                }

                if (v11)
                  goto LABEL_40;
LABEL_37:
                objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "oslog");
                v26 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v57;
                  v65 = v9;
                  _os_log_error_impl(&dword_1DDFDD000, v26, OS_LOG_TYPE_ERROR, "No activityData found at index: %lu", buf, 0xCu);
                }
LABEL_39:

                goto LABEL_40;
              }
              if (!v11)
                goto LABEL_37;
LABEL_40:

              v9 = ((char *)v9 + 1);
              if ((unint64_t)v9 >= objc_msgSend(v4, "count"))
                goto LABEL_54;
            }
            v14 = *(void **)(v10 + 1808);
            v15 = objc_opt_class();
            v63 = 0;
            objc_msgSend(v14, "unarchivedObjectOfClass:fromData:error:", v15, v13, &v63);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v63;
            if (v17)
            {
              objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "oslog");
              v19 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v65 = v17;
                _os_log_error_impl(&dword_1DDFDD000, v19, OS_LOG_TYPE_ERROR, "Error unarchiving registration: %{public}@", buf, 0xCu);
              }

            }
            v20 = v10;
            v21 = *(void **)(v10 + 1808);
            v22 = (void *)MEMORY[0x1E0C99E60];
            v68[0] = objc_opt_class();
            v68[1] = objc_opt_class();
            v68[2] = objc_opt_class();
            v68[3] = objc_opt_class();
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 4);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setWithArray:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = v17;
            objc_msgSend(v21, "unarchivedObjectOfClasses:fromData:error:", v24, v11, &v62);
            v25 = objc_claimAutoreleasedReturnValue();
            v26 = v62;

            if (v26)
            {
              objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "oslog");
              v28 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v65 = v26;
                _os_log_error_impl(&dword_1DDFDD000, v28, OS_LOG_TYPE_ERROR, "Error unarchiving activity: %{public}@", buf, 0xCu);
              }

            }
            v10 = v20;
            v4 = v59;
            if (objc_msgSend(v61, "containsObject:", v16))
            {
              objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "oslog");
              v30 = objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v65 = v25;
                v66 = 2114;
                v67 = v16;
                _os_log_impl(&dword_1DDFDD000, v30, OS_LOG_TYPE_DEFAULT, "Found matching activity:%{public}@ registration: %{public}@", buf, 0x16u);
              }

              objc_msgSend(*(id *)(v58 + 32), "_queue_addRegistration:forActivity:", v16, v25);
            }

            v2 = v60;
            goto LABEL_39;
          }
          goto LABEL_54;
        }
      }
LABEL_48:
      v52 = -[NSObject count](v2, "count");
      if (v52 == objc_msgSend(v4, "count"))
      {
        if (-[NSObject count](v2, "count"))
        {
LABEL_55:

          goto LABEL_56;
        }
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "oslog");
        v54 = objc_claimAutoreleasedReturnValue();

        v61 = v54;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_1();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "oslog");
        v56 = objc_claimAutoreleasedReturnValue();

        v61 = v56;
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_2(v2, v4, v56);
      }
LABEL_54:

      goto LABEL_55;
    }
    if (v2)
    {
      if (v3)
        goto LABEL_48;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "oslog");
      v35 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_4(v35, v36, v37, v38, v39, v40, v41, v42);

      if (v4)
        goto LABEL_48;
    }
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "oslog");
    v44 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_3(v44, v45, v46, v47, v48, v49, v50, v51);

    goto LABEL_48;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v2 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_5();
LABEL_56:

}

- (id)sharedMemoryStore
{
  if (sharedMemoryStore_once != -1)
    dispatch_once(&sharedMemoryStore_once, &__block_literal_global_44);
  return (id)sharedMemoryStore_sharedMemoryStore;
}

void __44__SUCoreActivityScheduler_sharedMemoryStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D15930], "keyValueStoreWithName:size:", CFSTR("com.apple.contextstored"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedMemoryStore_sharedMemoryStore;
  sharedMemoryStore_sharedMemoryStore = v0;

}

- (id)_contextStoreRegisteredActivities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D158F8], "knowledgeDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C98], "persistenceWithDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D15CB0];
  -[SUCoreActivityScheduler sharedMemoryStore](self, "sharedMemoryStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "persistenceWithSharedMemoryKeyValueStore:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15CA8], "persistenceWithPersistenceSurvivingReboot:persistenceSurvivingRelaunch:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loadRegistrations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)scheduleActivity:(id)a3 withHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *);
  _CDContext *context;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *))a4;
  context = self->_context;
  objc_msgSend(v6, "createContextualPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(context) = -[_CDContext evaluatePredicate:](context, "evaluatePredicate:", v9);

  if (!(_DWORD)context)
  {
    objc_msgSend(v6, "createRegistrationWithHandler:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "oslog");
    v17 = objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v6;
        _os_log_impl(&dword_1DDFDD000, v17, OS_LOG_TYPE_DEFAULT, "Scheduling activity = %{public}@", buf, 0xCu);
      }

      -[SUCoreActivityScheduler _registerRegistration:forActivity:](self, "_registerRegistration:forActivity:", v12, v6);
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[SUCoreActivityScheduler scheduleActivity:withHandler:].cold.1((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);

    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "oslog");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v6;
    _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "Conditions met for activity: %{public}@", buf, 0xCu);
  }

  if (v7)
  {
    objc_msgSend(v6, "activityName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUID", CFSTR("UUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = CFSTR("WasScheduled");
    v25[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v12, v15);

LABEL_13:
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_registrationArray, 0);
  objc_storeStrong((id *)&self->_activityArray, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithPersistedStatePath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "CoreDuet Context Store symbols not recognized. Returning null SUCoreActivityScheduler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void __41__SUCoreActivityScheduler_sharedInstance__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "Failed to create failPath. Creating failPath with filename set to bundleIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "persisted registration and activity arrays contain 0 items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_2(void *a1, void *a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = objc_msgSend(a1, "count");
  v7 = 2048;
  v8 = objc_msgSend(a2, "count");
  _os_log_error_impl(&dword_1DDFDD000, a3, OS_LOG_TYPE_ERROR, "persistedRegistrationArray(%lu) and persistedActivitiesArray(%lu) have differing counts", (uint8_t *)&v5, 0x16u);
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, a1, a3, "No entry found in persisted state file for key %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, a1, a3, "No entry found in persisted state file for key %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __56__SUCoreActivityScheduler__loadPersistedRegistrationMap__block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1DDFDD000, v0, v1, "Failed loading persisted state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

- (void)scheduleActivity:(uint64_t)a3 withHandler:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, a2, a3, "Failed to create _CDContextualChangeRegistration for activity: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
