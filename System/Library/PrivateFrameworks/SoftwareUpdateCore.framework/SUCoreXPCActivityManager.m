@implementation SUCoreXPCActivityManager

- (void)eventHandler:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t *v15;
  _QWORD block[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v5 = xpc_activity_copy_identifier();
  if (v5)
  {
    -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__SUCoreXPCActivityManager_eventHandler___block_invoke;
    block[3] = &unk_1EA878B38;
    block[4] = self;
    block[5] = &v17;
    block[6] = v5;
    dispatch_sync(v6, block);

    if (v18[5])
    {
      -[SUCoreXPCActivityManager activityQueue](self, "activityQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __41__SUCoreXPCActivityManager_eventHandler___block_invoke_44;
      v13[3] = &unk_1EA877F20;
      v15 = &v17;
      v14 = v4;
      dispatch_sync(v8, v13);

      v9 = v14;
    }
    else
    {
      -[SUCoreXPCActivityManager logger](self, "logger");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "oslog");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v24 = v5;
        _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "No registered activity found for event %s", buf, 0xCu);
      }
    }

  }
  else
  {
    -[SUCoreXPCActivityManager logger](self, "logger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "Event handler failed to copy identifier for event. Not invoking any callbacks", buf, 2u);
    }

  }
  _Block_object_dispose(&v17, 8);

}

void __41__SUCoreXPCActivityManager_eventHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "activities", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "activityName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *(_QWORD *)(a1 + 48));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "logger");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "oslog");
          v12 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v7, "activityName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v22 = v13;
            _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "Invoking activity handler for %@", buf, 0xCu);

          }
          objc_msgSend(v7, "handler");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v16 = *(void **)(v15 + 40);
          *(_QWORD *)(v15 + 40) = v14;

          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

}

uint64_t __41__SUCoreXPCActivityManager_eventHandler___block_invoke_44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_2);
  return (id)sharedInstance___instance_0;
}

void __42__SUCoreXPCActivityManager_sharedInstance__block_invoke()
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
  void *v13;
  SUCoreXPCActivityManager *v14;
  void *v15;
  void *v16;
  NSObject *v17;

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
      || (v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@.SUCoreXPCActivity.state"), CFSTR("/var/mobile/Library/SoftwareUpdateCore/"), v3)) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "oslog");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __42__SUCoreXPCActivityManager_sharedInstance__block_invoke_cold_2(v6);

      v4 = v1;
    }
    v7 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "executablePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9
      && (objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("/")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "lastObject"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v3))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@.SUCoreXPCActivity.state"), CFSTR("/var/mobile/Library/SoftwareUpdateCore/"), v3);

      if (v7)
        goto LABEL_14;
    }
    else
    {

      v3 = 0;
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), CFSTR("/var/mobile/Library/SoftwareUpdateCore/"), CFSTR("SUCoreXPCActivitySchedulerDefaultSharedState.state"));
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create a file path from bundleIdentifier, falling back to the default of %@"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreXPCActivityScheduler"), v12, 8116, 0);

  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.sucoreXPCActivityScheduler.%@"), v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SUCoreXPCActivityManager initWithNameAndPersistedStateFilePath:persistedStateFilePath:]([SUCoreXPCActivityManager alloc], "initWithNameAndPersistedStateFilePath:persistedStateFilePath:", v13, v7);
  v15 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v14;

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "oslog");
  v17 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    __42__SUCoreXPCActivityManager_sharedInstance__block_invoke_cold_1((uint64_t)v13, (uint64_t)v7, v17);

}

- (SUCoreXPCActivityManager)initWithNameAndPersistedStateFilePath:(id)a3 persistedStateFilePath:(id)a4
{
  SUCoreXPCActivityManager *v7;
  SUCoreXPCActivityManager *v8;
  void *v9;
  void *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *managerQueue;
  void *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *persistedStateDispatchQueue;
  dispatch_queue_t v16;
  OS_dispatch_queue *activityQueue;
  NSMutableArray *v18;
  NSMutableArray *activities;
  uint64_t v20;
  SUCorePersistedState *persistedState;
  NSObject *v22;
  id *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  SUCorePersistedState *v28;
  NSObject *v29;
  SUCoreXPCActivity *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  SUCorePersistedState *v36;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD block[4];
  id *v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  objc_super v54;
  uint8_t buf[4];
  SUCorePersistedState *v56;
  char v57[128];
  char label[16];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[31];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v39 = a4;
  v54.receiver = self;
  v54.super_class = (Class)SUCoreXPCActivityManager;
  v7 = -[SUCoreXPCActivityManager init](&v54, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_managerName, a3);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8960]), "initWithCategory:", CFSTR("SUCoreXPCActivityManager"));
    -[SUCoreXPCActivityManager setLogger:](v8, "setLogger:", v9);

    memset(v72, 0, sizeof(v72));
    v71 = 0u;
    v70 = 0u;
    v69 = 0u;
    v68 = 0u;
    v67 = 0u;
    v66 = 0u;
    v65 = 0u;
    v64 = 0u;
    v63 = 0u;
    v62 = 0u;
    v61 = 0u;
    v60 = 0u;
    v59 = 0u;
    *(_OWORD *)label = 0u;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s.%@"), "com.apple.sucore.sucoreactivitymanagerqueue", v40);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getCString:maxLength:encoding:", label, 254, 4);
    v11 = dispatch_queue_create(label, 0);
    managerQueue = v8->_managerQueue;
    v8->_managerQueue = (OS_dispatch_queue *)v11;

    memset(v72, 0, sizeof(v72));
    v71 = 0u;
    v70 = 0u;
    v69 = 0u;
    v68 = 0u;
    v67 = 0u;
    v66 = 0u;
    v65 = 0u;
    v64 = 0u;
    v63 = 0u;
    v62 = 0u;
    v61 = 0u;
    v60 = 0u;
    v59 = 0u;
    *(_OWORD *)label = 0u;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s.%@"), "com.apple.sucorexpcactivitymanager.persistedStateQueue", v40);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "getCString:maxLength:encoding:", label, 254, 4);
    v14 = dispatch_queue_create(label, 0);
    persistedStateDispatchQueue = v8->_persistedStateDispatchQueue;
    v8->_persistedStateDispatchQueue = (OS_dispatch_queue *)v14;

    memset(v72, 0, sizeof(v72));
    v71 = 0u;
    v70 = 0u;
    v69 = 0u;
    v68 = 0u;
    v67 = 0u;
    v66 = 0u;
    v65 = 0u;
    v64 = 0u;
    v63 = 0u;
    v62 = 0u;
    v61 = 0u;
    v60 = 0u;
    v59 = 0u;
    *(_OWORD *)label = 0u;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s.%@"), "com.apple.sucorexpcactivitymanager.activityQueue", v40);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v38, "getCString:maxLength:encoding:", label, 254, 4);
    v16 = dispatch_queue_create(label, 0);
    activityQueue = v8->_activityQueue;
    v8->_activityQueue = (OS_dispatch_queue *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activities = v8->_activities;
    v8->_activities = v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8970]), "initWithDispatchQueue:withPersistencePath:forPolicyVersion:", v8->_persistedStateDispatchQueue, v39, CFSTR("1.0"));
    persistedState = v8->_persistedState;
    v8->_persistedState = (SUCorePersistedState *)v20;

    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__75;
    v52 = __Block_byref_object_dispose__76;
    v53 = 0;
    -[SUCoreXPCActivityManager persistedStateDispatchQueue](v8, "persistedStateDispatchQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__SUCoreXPCActivityManager_initWithNameAndPersistedStateFilePath_persistedStateFilePath___block_invoke;
    block[3] = &unk_1EA877ED0;
    v23 = v8;
    v46 = v23;
    v47 = &v48;
    dispatch_sync(v22, block);

    if (v49[5])
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v24 = (id)v49[5];
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v42 != v26)
              objc_enumerationMutation(v24);
            v28 = *(SUCorePersistedState **)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v23[2], "oslog");
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v28;
              _os_log_impl(&dword_1DDFDD000, v29, OS_LOG_TYPE_DEFAULT, "Found perisistedActivity %@. Unregistering from XPC", buf, 0xCu);
            }

            v30 = objc_alloc_init(SUCoreXPCActivity);
            -[SUCorePersistedState activityOptions](v28, "activityOptions");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCoreXPCActivity setActivityOptions:](v30, "setActivityOptions:", v31);

            -[SUCorePersistedState activityName](v28, "activityName");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCoreXPCActivity setActivityName:](v30, "setActivityName:", v32);

            -[SUCoreXPCActivity setHandler:](v30, "setHandler:", 0);
            -[SUCoreXPCActivity setIsRegisteredWithXPC:](v30, "setIsRegisteredWithXPC:", 0);
            bzero(buf, 0x400uLL);
            -[SUCorePersistedState activityName](v28, "activityName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "getCString:maxLength:encoding:", buf, 1023, 4);

            xpc_activity_unregister((const char *)buf);
            -[NSMutableArray addObject:](v8->_activities, "addObject:", v30);

          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v57, 16);
        }
        while (v25);
      }

    }
    objc_msgSend(v23, "logger");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "oslog");
    v35 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v8->_persistedState;
      *(_DWORD *)buf = 138412290;
      v56 = v36;
      _os_log_impl(&dword_1DDFDD000, v35, OS_LOG_TYPE_DEFAULT, "Loaded persisted State: %@", buf, 0xCu);
    }

    _Block_object_dispose(&v48, 8);
  }

  return v8;
}

void __89__SUCoreXPCActivityManager_initWithNameAndPersistedStateFilePath_persistedStateFilePath___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "loadPersistedState");
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v13 = (id)objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "secureCodedObjectForKey:ofClass:encodeClasses:", CFSTR("ActivityArray"), objc_opt_class(), v13);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (BOOL)_isActivityTrackedButUnsheduledInternal:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_activities;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1E0DA8920];
        objc_msgSend(v12, "activityName", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "stringIsEqual:to:", v14, v4))
        {
          v15 = objc_msgSend(v12, "isRegisteredWithXPC");

          v9 |= v15 ^ 1;
        }
        else
        {

        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9 & 1;
}

- (BOOL)isActivityTrackedButUnsheduled:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SUCoreXPCActivityManager_isActivityTrackedButUnsheduled___block_invoke;
  block[3] = &unk_1EA878B80;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __59__SUCoreXPCActivityManager_isActivityTrackedButUnsheduled___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isActivityTrackedButUnsheduledInternal:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)isActivityScheduledInternal:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_activities;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "activityName", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v4))
        {
          v14 = objc_msgSend(v12, "isRegisteredWithXPC");

          v9 |= v14;
        }
        else
        {

        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9 & 1;
}

- (BOOL)isActivityScheduled:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SUCoreXPCActivityManager_isActivityScheduled___block_invoke;
  block[3] = &unk_1EA878B80;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

uint64_t __48__SUCoreXPCActivityManager_isActivityScheduled___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isActivityScheduledInternal:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)addActivityInfoToPersistedState:(id)a3
{
  id v4;
  NSObject *v5;
  SUCorePersistedActivity *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  NSObject *v18;
  BOOL v19;
  _QWORD v21[7];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[5];
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__75;
  v33[4] = __Block_byref_object_dispose__76;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__75;
  v31 = __Block_byref_object_dispose__76;
  v32 = 0;
  v6 = objc_alloc_init(SUCorePersistedActivity);
  objc_msgSend(v4, "activityOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedActivity setActivityOptions:](v6, "setActivityOptions:", v7);

  objc_msgSend(v4, "activityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePersistedActivity setActivityName:](v6, "setActivityName:", v8);

  -[SUCoreXPCActivityManager persistedStateDispatchQueue](self, "persistedStateDispatchQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SUCoreXPCActivityManager_addActivityInfoToPersistedState___block_invoke;
  block[3] = &unk_1EA878BA8;
  block[4] = self;
  block[5] = v33;
  block[6] = &v27;
  dispatch_sync(v9, block);

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = (id)v28[5];
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v39, 16);
  if (v12)
  {
    v13 = 0;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v16, "isEqual:", v6))
        {
          v17 = v16;

          v13 = v17;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v39, 16);
    }
    while (v12);

    if (v13)
      objc_msgSend((id)v28[5], "removeObject:", v13);
  }
  else
  {

    v13 = 0;
  }
  objc_msgSend((id)v28[5], "addObject:", v6);
  -[SUCoreXPCActivityManager persistedStateDispatchQueue](self, "persistedStateDispatchQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __60__SUCoreXPCActivityManager_addActivityInfoToPersistedState___block_invoke_2;
  v21[3] = &unk_1EA878BD0;
  v21[4] = self;
  v21[5] = &v27;
  v21[6] = &v35;
  dispatch_sync(v18, v21);

  v19 = *((_BYTE *)v36 + 24) != 0;
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);

  return v19;
}

void __60__SUCoreXPCActivityManager_addActivityInfoToPersistedState___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 56), "secureCodedObjectForKey:ofClass:encodeClasses:", CFSTR("ActivityArray"), objc_opt_class(), v10);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "mutableCopy");
  else
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = *(_QWORD *)(a1[6] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

uint64_t __60__SUCoreXPCActivityManager_addActivityInfoToPersistedState___block_invoke_2(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 56), "persistSecureCodedObject:forKey:shouldPersist:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("ActivityArray"), 1);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  return result;
}

- (BOOL)removeActivityFromPersistedState:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__75;
  v13[4] = __Block_byref_object_dispose__76;
  v14 = 0;
  -[SUCoreXPCActivityManager persistedStateDispatchQueue](self, "persistedStateDispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SUCoreXPCActivityManager_removeActivityFromPersistedState___block_invoke;
  v9[3] = &unk_1EA878BF8;
  v11 = v13;
  v12 = &v15;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  dispatch_sync(v6, v9);

  LOBYTE(v4) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(&v15, 8);
  return (char)v4;
}

void __61__SUCoreXPCActivityManager_removeActivityFromPersistedState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  SUCorePersistedActivity *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[8];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "secureCodedObjectForKey:ofClass:encodeClasses:", CFSTR("ActivityArray"), objc_opt_class(), v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = objc_alloc_init(SUCorePersistedActivity);
    objc_msgSend(*(id *)(a1 + 40), "activityOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedActivity setActivityOptions:](v8, "setActivityOptions:", v9);

    objc_msgSend(*(id *)(a1 + 40), "activityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePersistedActivity setActivityName:](v8, "setActivityName:", v10);

    v11 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "mutableCopy");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v18, "isEqual:", v8))
          {
            v19 = v18;

            v15 = v19;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v14);
    }
    else
    {
      v15 = 0;
    }

    objc_msgSend(v12, "removeObject:", v15);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oslog");
    v21 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v21, OS_LOG_TYPE_DEFAULT, "No persisted activities found", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

- (int)scheduleActivity:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v9;
  SUCoreXPCActivityManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 3;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SUCoreXPCActivityManager_scheduleActivity___block_invoke;
  block[3] = &unk_1EA878C48;
  v9 = v4;
  v10 = self;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return (int)v4;
}

void __45__SUCoreXPCActivityManager_scheduleActivity___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  __CFString *v9;
  uint64_t v10;
  int v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  xpc_object_t v19;
  void *v20;
  int v21;
  const char **v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char isKindOfClass;
  const char *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  BOOL v38;
  void *v39;
  int v40;
  void *v41;
  BOOL v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  __CFString *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  int v58;
  void *v59;
  NSObject *v60;
  _BOOL4 v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  _QWORD handler[5];
  uint8_t v68[4];
  void *v69;
  uint8_t buf[4];
  const __CFString *v71;
  __int16 v72;
  const __CFString *v73;
  __int16 v74;
  const __CFString *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(*(id *)(a1 + 32), "handler"), (v2 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v3 = (void *)v2,
        objc_msgSend(*(id *)(a1 + 32), "activityName"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = CFSTR("OK");
      else
        v14 = CFSTR("Invalid");
      objc_msgSend(*(id *)(a1 + 32), "handler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        v16 = CFSTR("OK");
      else
        v16 = CFSTR("Invalid");
      objc_msgSend(*(id *)(a1 + 32), "activityName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      if (v17)
        v18 = CFSTR("OK");
      else
        v18 = CFSTR("Invalid");
      v71 = v14;
      v72 = 2112;
      v73 = v16;
      v74 = 2112;
      v75 = v18;
      _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "The activity object passed to scheduleActivity is invalid : Class : %@ Handler: %@ Name: %@", buf, 0x20u);

    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = 4;
    goto LABEL_20;
  }
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "activityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isActivityScheduledInternal:", v6);

  if ((_DWORD)v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "activityName");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v71 = v9;
      _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "The activity named %@ is already scheduled", buf, 0xCu);

    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = 5;
LABEL_20:
    *(_DWORD *)(v10 + 24) = v11;
    return;
  }
  v19 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v19, (const char *)*MEMORY[0x1E0C80790], 0);
  objc_msgSend(*(id *)(a1 + 32), "activityOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "priority");
  v22 = (const char **)MEMORY[0x1E0C80878];
  if (!v21)
  {

    goto LABEL_25;
  }
  objc_msgSend(*(id *)(a1 + 32), "activityOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "priority");

  if (v24 == 2)
LABEL_25:
    xpc_dictionary_set_string(v19, *v22, (const char *)*MEMORY[0x1E0C80888]);
  objc_msgSend(*(id *)(a1 + 32), "activityOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "priority");

  if (v26 == 1)
    xpc_dictionary_set_string(v19, *v22, (const char *)*MEMORY[0x1E0C80880]);
  objc_msgSend(*(id *)(a1 + 32), "activityOptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "batteryLevelGreaterThan");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    objc_msgSend(*(id *)(a1 + 32), "activityOptions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "batteryLevelGreaterThan");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      goto LABEL_32;
    v33 = (const char *)*MEMORY[0x1E0C808C0];
    objc_msgSend(*(id *)(a1 + 32), "activityOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "batteryLevelGreaterThan");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_int64(v19, v33, objc_msgSend(v34, "integerValue"));

  }
LABEL_32:
  objc_msgSend(*(id *)(a1 + 32), "activityOptions");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "plugInState");

  if (v36)
  {
    objc_msgSend(*(id *)(a1 + 32), "activityOptions");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "plugInState") == 2;

    xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x1E0C80738], v38);
  }
  objc_msgSend(*(id *)(a1 + 32), "activityOptions");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "networkState");

  if (v40)
  {
    objc_msgSend(*(id *)(a1 + 32), "activityOptions");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "networkState") == 2;

    xpc_dictionary_set_BOOL(v19, (const char *)*MEMORY[0x1E0C808D0], v42);
  }
  objc_msgSend(*(id *)(a1 + 32), "activityOptions");
  v43 = objc_claimAutoreleasedReturnValue();
  -[NSObject runDate](v43, "runDate");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    objc_msgSend(*(id *)(a1 + 32), "activityOptions");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "runDate");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = objc_opt_isKindOfClass();

    v49 = 0.0;
    if ((v48 & 1) == 0)
      goto LABEL_42;
    objc_msgSend(*(id *)(a1 + 32), "activityOptions");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "runDate");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "timeIntervalSinceNow");
    v49 = v52;

    if (v49 >= 0.0)
      goto LABEL_42;
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "oslog");
    v43 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "activityName");
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "activityOptions");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "runDate");
      v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v71 = v54;
      v72 = 2112;
      v73 = v56;
      _os_log_impl(&dword_1DDFDD000, v43, OS_LOG_TYPE_DEFAULT, "The activity named %@ has a requested run date which is in the past(%@). Scheduling to run immediately", buf, 0x16u);

    }
  }

  v49 = 0.0;
LABEL_42:
  xpc_dictionary_set_int64(v19, (const char *)*MEMORY[0x1E0C80760], (uint64_t)v49);
  bzero(buf, 0x400uLL);
  objc_msgSend(*(id *)(a1 + 32), "activityName");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "getCString:maxLength:encoding:", buf, 1023, 4);

  v58 = buf[0];
  objc_msgSend(*(id *)(a1 + 40), "logger");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "oslog");
  v60 = objc_claimAutoreleasedReturnValue();

  v61 = os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT);
  if (v58)
  {
    if (v61)
    {
      objc_msgSend(*(id *)(a1 + 32), "activityName");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v68 = 138412290;
      v69 = v62;
      _os_log_impl(&dword_1DDFDD000, v60, OS_LOG_TYPE_DEFAULT, "Registering Activity %@", v68, 0xCu);

    }
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __45__SUCoreXPCActivityManager_scheduleActivity___block_invoke_89;
    handler[3] = &unk_1EA878C20;
    handler[4] = *(_QWORD *)(a1 + 40);
    xpc_activity_register((const char *)buf, v19, handler);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "addObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "addActivityInfoToPersistedState:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "setIsRegisteredWithXPC:", 1);
    objc_msgSend(*(id *)(a1 + 40), "logger");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "oslog");
    v64 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      v65 = *(void **)(a1 + 32);
      *(_DWORD *)v68 = 138412290;
      v69 = v65;
      _os_log_impl(&dword_1DDFDD000, v64, OS_LOG_TYPE_DEFAULT, "Activity successfully registered : {%@}", v68, 0xCu);
    }

  }
  else
  {
    if (v61)
    {
      v66 = *(void **)(a1 + 32);
      *(_DWORD *)v68 = 138412290;
      v69 = v66;
      _os_log_impl(&dword_1DDFDD000, v60, OS_LOG_TYPE_DEFAULT, "Failed to register activity since we could not extract its name: {%@}", v68, 0xCu);
    }

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 4;
  }

}

uint64_t __45__SUCoreXPCActivityManager_scheduleActivity___block_invoke_89(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "eventHandler:", a2);
}

- (int)unscheduleActivity:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 6;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SUCoreXPCActivityManager_unscheduleActivity___block_invoke;
  block[3] = &unk_1EA878C48;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(v5, block);

  LODWORD(v4) = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return (int)v4;
}

void __47__SUCoreXPCActivityManager_unscheduleActivity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char identifier[1024];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isActivityScheduledInternal:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "_isActivityTrackedButUnsheduledInternal:", *(_QWORD *)(a1 + 40)))
  {
    bzero(identifier, 0x400uLL);
    objc_msgSend(*(id *)(a1 + 40), "getCString:maxLength:encoding:", identifier, 1023, 4);
    if (identifier[0])
    {
      xpc_activity_unregister(identifier);
      objc_msgSend(*(id *)(a1 + 32), "_getActivityForNameInternal:", *(_QWORD *)(a1 + 40));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      if (v2)
      {
        objc_msgSend(v2, "setIsRegisteredWithXPC:", 0);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObject:", v3);
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      objc_msgSend(*(id *)(a1 + 32), "removeActivityFromPersistedState:", v3);

    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (id)getActivityForName:(id)a3
{
  id v4;
  NSObject *v5;
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
  v15 = __Block_byref_object_copy__75;
  v16 = __Block_byref_object_dispose__76;
  v17 = 0;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SUCoreXPCActivityManager_getActivityForName___block_invoke;
  block[3] = &unk_1EA878B80;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __47__SUCoreXPCActivityManager_getActivityForName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_getActivityForNameInternal:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_getActivityForNameInternal:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_activities;
  v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)MEMORY[0x1E0DA8920];
        objc_msgSend(v10, "activityName", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = objc_msgSend(v11, "stringIsEqual:to:", v12, v4);

        if ((v11 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)copyOptionsForActivity:(id)a3
{
  id v4;
  NSObject *v5;
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
  v15 = __Block_byref_object_copy__75;
  v16 = __Block_byref_object_dispose__76;
  v17 = 0;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SUCoreXPCActivityManager_copyOptionsForActivity___block_invoke;
  block[3] = &unk_1EA878C48;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__SUCoreXPCActivityManager_copyOptionsForActivity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_getActivityForNameInternal:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    objc_msgSend(v2, "activityOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "copy");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v2 = v7;
  }

}

- (id)getExpectedRunDateForActivity:(id)a3
{
  id v4;
  NSObject *v5;
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
  v15 = __Block_byref_object_copy__75;
  v16 = __Block_byref_object_dispose__76;
  v17 = 0;
  -[SUCoreXPCActivityManager managerQueue](self, "managerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SUCoreXPCActivityManager_getExpectedRunDateForActivity___block_invoke;
  block[3] = &unk_1EA878C48;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __58__SUCoreXPCActivityManager_getExpectedRunDateForActivity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_getActivityForNameInternal:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "activityOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "runDate");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1 + 32), "logger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "Activity '%@' has a predicted run date of %@", (uint8_t *)&v12, 0x16u);
    }

  }
}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Name: %@ NumActivicies: %lu {\n"), self->_managerName, -[NSMutableArray count](self->_activities, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_activities;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      v9 = v3;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\n\t%@\n}"), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingString:", v10);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v3;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "stringByAppendingString:", CFSTR("}"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)managerName
{
  return self->_managerName;
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (OS_dispatch_queue)managerQueue
{
  return self->_managerQueue;
}

- (void)setManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_managerQueue, a3);
}

- (OS_dispatch_queue)persistedStateDispatchQueue
{
  return self->_persistedStateDispatchQueue;
}

- (void)setPersistedStateDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_persistedStateDispatchQueue, a3);
}

- (OS_dispatch_queue)activityQueue
{
  return self->_activityQueue;
}

- (void)setActivityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_activityQueue, a3);
}

- (NSMutableArray)activities
{
  return self->_activities;
}

- (void)setActivities:(id)a3
{
  objc_storeStrong((id *)&self->_activities, a3);
}

- (SUCorePersistedState)persistedState
{
  return self->_persistedState;
}

- (void)setPersistedState:(id)a3
{
  objc_storeStrong((id *)&self->_persistedState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_activityQueue, 0);
  objc_storeStrong((id *)&self->_persistedStateDispatchQueue, 0);
  objc_storeStrong((id *)&self->_managerQueue, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_managerName, 0);
}

void __42__SUCoreXPCActivityManager_sharedInstance__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1DDFDD000, log, OS_LOG_TYPE_ERROR, "Persisted state file path for manager %@ is %@", (uint8_t *)&v3, 0x16u);
}

void __42__SUCoreXPCActivityManager_sharedInstance__block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DDFDD000, log, OS_LOG_TYPE_ERROR, "Failed to create failPath. Creating failPath with filename set to bundleIdentifier", v1, 2u);
}

@end
