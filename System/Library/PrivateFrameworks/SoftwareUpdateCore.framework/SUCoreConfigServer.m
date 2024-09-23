@implementation SUCoreConfigServer

+ (id)sharedServerSettings
{
  if (sharedServerSettings_onceInit != -1)
    dispatch_once(&sharedServerSettings_onceInit, &__block_literal_global_11);
  return (id)sharedServerSettings___sharedConfig;
}

void __42__SUCoreConfigServer_sharedServerSettings__block_invoke()
{
  SUCoreConfigServer *v0;
  void *v1;

  v0 = objc_alloc_init(SUCoreConfigServer);
  v1 = (void *)sharedServerSettings___sharedConfig;
  sharedServerSettings___sharedConfig = (uint64_t)v0;

}

- (SUCoreConfigServer)init
{
  SUCoreConfigServer *v2;
  SUCoreConfigServer *v3;
  NSString *uuidString;
  NSDate *lastScanTime;
  MAAsset *lastLocatedAsset;
  NSTimer *timer;
  SUCoreFSM *stateMachine;
  SUCorePersistedState *persistedState;
  NSMutableDictionary *v10;
  NSMutableDictionary *listenerDelegates;
  id v12;
  uint64_t v13;
  SUCoreConfig *coreConfig;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *clientDelegateQueue;
  void *v18;
  uint64_t v19;
  SUCoreFSM *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  SUCorePersistedState *v28;
  SUCoreFSM *v29;
  SUCoreConfigParam *v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *, void *);
  void *v35;
  SUCoreConfigServer *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)SUCoreConfigServer;
  v2 = -[SUCoreConfigServer init](&v37, sel_init);
  v3 = v2;
  if (v2)
  {
    uuidString = v2->_uuidString;
    v2->_uuidString = 0;

    lastScanTime = v3->_lastScanTime;
    v3->_lastScanTime = 0;

    lastLocatedAsset = v3->_lastLocatedAsset;
    v3->_lastLocatedAsset = 0;

    timer = v3->_timer;
    v3->_timer = 0;

    stateMachine = v3->_stateMachine;
    v3->_stateMachine = 0;

    persistedState = v3->_persistedState;
    v3->_persistedState = 0;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    listenerDelegates = v3->_listenerDelegates;
    v3->_listenerDelegates = v10;

    v12 = objc_alloc(MEMORY[0x1E0DA8928]);
    v13 = objc_msgSend(v12, "initWithProjectName:", *MEMORY[0x1E0DA8A10]);
    coreConfig = v3->_coreConfig;
    v3->_coreConfig = (SUCoreConfig *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("SUCoreConfigClientDelegateQueue", v15);
    clientDelegateQueue = v3->_clientDelegateQueue;
    v3->_clientDelegateQueue = (OS_dispatch_queue *)v16;

    +[SUCoreConfigServer _generateStateTable](SUCoreConfigServer, "_generateStateTable");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8958]), "initMachine:withTable:startingIn:", CFSTR("SUCoreConfigServer"), v18, CFSTR("ConfigIdle"));
    v20 = v3->_stateMachine;
    v3->_stateMachine = (SUCoreFSM *)v19;

    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __26__SUCoreConfigServer_init__block_invoke;
    v35 = &unk_1EA879DB0;
    v36 = v3;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", &v32);
    v21 = objc_alloc(MEMORY[0x1E0DA8970]);
    -[SUCoreFSM extendedStateQueue](v3->_stateMachine, "extendedStateQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreConfigServer persistedStateFilePath](SUCoreConfigServer, "persistedStateFilePath");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
      v25 = (const __CFString *)v23;
    else
      v25 = CFSTR("/private/var/tmp/SUCoreConfig.state");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 1, v32, v33, v34, v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v21, "initWithDispatchQueue:withPersistencePath:forPolicyVersion:", v22, v25, v26);
    v28 = v3->_persistedState;
    v3->_persistedState = (SUCorePersistedState *)v27;

    -[SUCoreFSM activateMachine](v3->_stateMachine, "activateMachine");
    v29 = v3->_stateMachine;
    v30 = objc_alloc_init(SUCoreConfigParam);
    -[SUCoreFSM postEvent:withInfo:](v29, "postEvent:withInfo:", CFSTR("ConfigAPIInstall"), v30);

  }
  return v3;
}

void __26__SUCoreConfigServer_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__SUCoreConfigServer_init__block_invoke_2;
  v7[3] = &unk_1EA879D88;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __26__SUCoreConfigServer_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *MEMORY[0x1E0DA8990];
  v6 = a2;
  objc_msgSend(a3, "safeStringForKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "registerAction:ForEvent:inState:usingDelegate:withInfoClass:", v7, v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), objc_opt_class());

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SUCoreConfigServer timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)SUCoreConfigServer;
  -[SUCoreConfigServer dealloc](&v4, sel_dealloc);
}

- (void)installServerSettings
{
  void *v3;
  NSObject *v4;
  void *v5;
  SUCoreConfigParam *v6;
  uint8_t v7[16];

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oslog");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DDFDD000, v4, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] API: Install server settings API request issued; posting install event",
      v7,
      2u);
  }

  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(SUCoreConfigParam);
  objc_msgSend(v5, "postEvent:withInfo:", CFSTR("ConfigAPIInstall"), v6);

}

- (void)listenForConfigChanges:(id)a3 withName:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  SUCoreConfigServer *v16;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extendedStateQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SUCoreConfigServer_listenForConfigChanges_withName___block_invoke;
  block[3] = &unk_1EA878940;
  v14 = v8;
  v15 = v7;
  v16 = self;
  v11 = v7;
  v12 = v8;
  dispatch_async(v10, block);

}

void __54__SUCoreConfigServer_listenForConfigChanges_withName___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "oslog");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("YES");
    v5 = *(_QWORD *)(a1 + 40);
    if (!*(_QWORD *)(a1 + 32))
      v4 = CFSTR("NO");
    v12 = 138543618;
    v13 = v4;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_1DDFDD000, v3, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] API: Adding listener delegate (present=%{public}@) with name: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "listenerDelegates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSafeObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "listenerDelegates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] API: Known listeners still active: %{public}@", (uint8_t *)&v12, 0xCu);

  }
}

- (id)scheduledActivityName
{
  if (scheduledActivityName_onceToken != -1)
    dispatch_once(&scheduledActivityName_onceToken, &__block_literal_global_253);
  return (id)scheduledActivityName___activityName;
}

void __43__SUCoreConfigServer_scheduledActivityName__block_invoke()
{
  void *v0;
  const __CFString *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = CFSTR("SUCoreConfigScheduledScan");
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v3, CFSTR("SUCoreConfigScheduledScan"));
    v1 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v2 = (void *)scheduledActivityName___activityName;
  scheduledActivityName___activityName = (uint64_t)v1;

}

+ (id)allowedServerProjects
{
  if (allowedServerProjects_onceToken != -1)
    dispatch_once(&allowedServerProjects_onceToken, &__block_literal_global_259);
  return (id)allowedServerProjects___allowedProjects;
}

void __43__SUCoreConfigServer_allowedServerProjects__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DA8A20];
  v5[0] = *MEMORY[0x1E0DA8A10];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0DA8A18];
  v5[2] = *MEMORY[0x1E0DA8A08];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0DA8A00];
  v5[4] = *MEMORY[0x1E0DA89F8];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)allowedServerProjects___allowedProjects;
  allowedServerProjects___allowedProjects = v3;

}

+ (id)allowedServerKeys
{
  if (allowedServerKeys_onceToken != -1)
    dispatch_once(&allowedServerKeys_onceToken, &__block_literal_global_261);
  return (id)allowedServerKeys___allowedKeys;
}

void __39__SUCoreConfigServer_allowedServerKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[11];

  v7[10] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0DA89E8];
  v7[0] = *MEMORY[0x1E0DA89D8];
  v7[1] = v0;
  v1 = *MEMORY[0x1E0DA89C0];
  v7[2] = *MEMORY[0x1E0DA8998];
  v7[3] = v1;
  v2 = *MEMORY[0x1E0DA89A8];
  v7[4] = *MEMORY[0x1E0DA89A0];
  v7[5] = v2;
  v3 = *MEMORY[0x1E0DA89B8];
  v7[6] = *MEMORY[0x1E0DA89B0];
  v7[7] = v3;
  v4 = *MEMORY[0x1E0DA89D0];
  v7[8] = *MEMORY[0x1E0DA89F0];
  v7[9] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 10);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)allowedServerKeys___allowedKeys;
  allowedServerKeys___allowedKeys = v5;

}

+ (id)persistedStateFilePath
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore"));

  if ((v3 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = 0,
        objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore"), 1, 0, &v10), v5 = v10, v4, !v5))
  {
    objc_msgSend(CFSTR("/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore"), "stringByAppendingPathComponent:", CFSTR("SUCoreConfig.state"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[SUCoreConfigServer persistedStateFilePath].cold.1((uint64_t)v5, v7, v8);

    return 0;
  }
}

+ (id)_generateStateTable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[2];
  _QWORD v76[2];
  const __CFString *v77;
  void *v78;
  _QWORD v79[7];
  _QWORD v80[9];

  v80[7] = *MEMORY[0x1E0C80C00];
  v79[0] = CFSTR("ConfigIdle");
  v77 = CFSTR("ConfigAPIInstall");
  v3 = *MEMORY[0x1E0DA8990];
  v75[0] = *MEMORY[0x1E0DA8B88];
  v2 = v75[0];
  v75[1] = v3;
  v76[0] = CFSTR("ConfigScheduled");
  v76[1] = CFSTR("ConfigScheduleScan");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v29;
  v79[1] = CFSTR("ConfigDownloadingCatalog");
  v73[0] = CFSTR("ConfigAPIInstall");
  v71 = v3;
  v72 = *MEMORY[0x1E0DA8B68];
  v4 = v72;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v28;
  v73[1] = CFSTR("ConfigPhaseComplete");
  v69[0] = v2;
  v69[1] = v3;
  v70[0] = CFSTR("ConfigQueryingAsset");
  v70[1] = CFSTR("ConfigQueryAsset");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v27;
  v73[2] = CFSTR("ConfigPhaseFailed");
  v67[0] = v2;
  v67[1] = v3;
  v68[0] = CFSTR("ConfigScheduled");
  v68[1] = CFSTR("ConfigScheduleScan");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v25;
  v79[2] = CFSTR("ConfigQueryingAsset");
  v65[0] = CFSTR("ConfigAPIInstall");
  v63 = v3;
  v64 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v24;
  v65[1] = CFSTR("ConfigPhaseComplete");
  v61[0] = v2;
  v61[1] = v3;
  v62[0] = CFSTR("ConfigDownloadingAsset");
  v62[1] = CFSTR("ConfigDownloadAsset");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v23;
  v65[2] = CFSTR("ConfigPhaseFailed");
  v59[0] = v2;
  v59[1] = v3;
  v60[0] = CFSTR("ConfigScheduled");
  v60[1] = CFSTR("ConfigScheduleScan");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v21;
  v79[3] = CFSTR("ConfigDownloadingAsset");
  v56 = v4;
  v57[0] = CFSTR("ConfigAPIInstall");
  v55 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v20;
  v57[1] = CFSTR("ConfigPhaseComplete");
  v53[0] = v2;
  v53[1] = v3;
  v54[0] = CFSTR("ConfigAdjusting");
  v54[1] = CFSTR("ConfigAdjustSettings");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v19;
  v57[2] = CFSTR("ConfigPhaseFailed");
  v51[0] = v2;
  v51[1] = v3;
  v52[0] = CFSTR("ConfigScheduled");
  v52[1] = CFSTR("ConfigScheduleScan");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v80[3] = v17;
  v79[4] = CFSTR("ConfigAdjusting");
  v48 = v4;
  v49[0] = CFSTR("ConfigAPIInstall");
  v47 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v16;
  v49[1] = CFSTR("ConfigPhaseComplete");
  v45[0] = v2;
  v45[1] = v3;
  v46[0] = CFSTR("ConfigScheduled");
  v46[1] = CFSTR("ConfigScheduleScan");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v5;
  v49[2] = CFSTR("ConfigPhaseFailed");
  v43[0] = v2;
  v43[1] = v3;
  v44[0] = CFSTR("ConfigScheduled");
  v44[1] = CFSTR("ConfigScheduleScan");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v80[4] = v7;
  v79[5] = CFSTR("ConfigScheduled");
  v39[0] = v2;
  v39[1] = v3;
  v40[0] = CFSTR("ConfigDownloadingCatalog");
  v40[1] = CFSTR("ConfigDownloadCatalog");
  v41[0] = CFSTR("ConfigAPIInstall");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v8;
  v41[1] = CFSTR("ConfigPhaseComplete");
  v37 = v3;
  v38 = CFSTR("ConfigScheduleScan");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v9;
  v41[2] = CFSTR("ConfigPhaseFailed");
  v35 = v3;
  v36 = CFSTR("ConfigScheduleScan");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v80[5] = v11;
  v79[6] = *MEMORY[0x1E0DA8B78];
  v33 = *MEMORY[0x1E0DA8B70];
  v31 = v2;
  v32 = *MEMORY[0x1E0DA8B80];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v80[6] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;

  v11 = a3;
  v12 = a6;
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0DA8B68]) & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("ConfigDownloadCatalog")))
    {
      v14 = -[SUCoreConfigServer actionConfigDownloadCatalog:error:](self, "actionConfigDownloadCatalog:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ConfigQueryAsset")))
    {
      v14 = -[SUCoreConfigServer actionConfigQueryAsset:error:](self, "actionConfigQueryAsset:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ConfigDownloadAsset")))
    {
      v14 = -[SUCoreConfigServer actionConfigDownloadAsset:error:](self, "actionConfigDownloadAsset:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ConfigAdjustSettings")))
    {
      v14 = -[SUCoreConfigServer actionConfigAdjustSettings:error:](self, "actionConfigAdjustSettings:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ConfigScheduleScan")))
    {
      v14 = -[SUCoreConfigServer actionConfigScheduleScan:error:](self, "actionConfigScheduleScan:error:", v12, a8);
    }
    else
    {
      v14 = -[SUCoreConfigServer actionUnknownAction:error:](self, "actionUnknownAction:error:", v11, a8);
    }
    v13 = v14;
  }

  return v13;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = (void *)MEMORY[0x1E0DA8920];
  v7 = a3;
  objc_msgSend(v6, "sharedCore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyCurrentStateProtected");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("SUCoreConfig Unknown Action %@ for state %@"), v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "buildError:underlying:description:", 8102, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreConfig"), v15, objc_msgSend(v13, "code"), v13);

  if (a4)
    *a4 = objc_retainAutorelease(v13);

  return 8102;
}

- (int64_t)actionConfigDownloadCatalog:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[SUCoreConfigServer _stateSafeResetState](self, "_stateSafeResetState", a3, a4);
  -[SUCoreConfigServer _stateSafeDownloadOptions](self, "_stateSafeDownloadOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Catalog: Starting download of configuration asset catalog with options: %{public}@", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__SUCoreConfigServer_actionConfigDownloadCatalog_error___block_invoke;
  v9[3] = &unk_1EA879B78;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0D4E038], "startCatalogDownload:options:completionWithError:", CFSTR("com.apple.MobileAsset.SoftwareUpdateConfiguration"), v5, v9);

  return 0;
}

void __56__SUCoreConfigServer_actionConfigDownloadCatalog_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  SUCoreConfigParam *v13;
  SUCoreConfigParam *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    MEMORY[0x1DF0E6840](a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v8;
    v17 = 2048;
    v18 = a2;
    _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Catalog: Catalog download completed with MADownloadResult: %{public}@ (%ld)", (uint8_t *)&v15, 0x16u);

  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildError:underlying:description:", 8400, v5, CFSTR("Software update configuration catalog download failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __56__SUCoreConfigServer_actionConfigDownloadCatalog_error___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "stateMachine");
    v13 = (SUCoreConfigParam *)objc_claimAutoreleasedReturnValue();
    v14 = -[SUCoreConfigParam initWithError:operation:]([SUCoreConfigParam alloc], "initWithError:operation:", v10, 1);
    -[SUCoreConfigParam postEvent:withInfo:](v13, "postEvent:withInfo:", CFSTR("ConfigPhaseFailed"), v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(SUCoreConfigParam);
    objc_msgSend(v10, "postEvent:withInfo:", CFSTR("ConfigPhaseComplete"), v13);
  }

}

- (int64_t)actionConfigQueryAsset:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  void *v36;
  void *v37;
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
  NSObject *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  SUCoreConfigParam *v63;
  int64_t v64;
  void *v65;
  SUCoreConfigParam *v66;
  void *v69;
  id v71;
  uint8_t buf[4];
  _BYTE v73[18];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[4];

  v79[2] = *MEMORY[0x1E0C80C00];
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("|"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E050]), "initWithType:", CFSTR("com.apple.MobileAsset.SoftwareUpdateConfiguration"));
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v5;
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v4, "addKeyValueArray:with:", CFSTR("PrerequisiteBuilds"), v9);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v10;
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "productVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v4, "addKeyValueArray:with:", CFSTR("PrerequisiteOSVersions"), v14);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v15;
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hwModelString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(v4, "addKeyValueArray:with:", CFSTR("SupportedDeviceModels"), v19);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v20;
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "buildVersion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "componentsJoinedByString:", CFSTR(","));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "appendFormat:", CFSTR("%@:%@|"), CFSTR("PrerequisiteBuilds"), v24);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v25;
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "productVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "componentsJoinedByString:", CFSTR(","));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "appendFormat:", CFSTR("%@:%@|"), CFSTR("PrerequisiteOSVersions"), v29);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v30;
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "hwModelString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "componentsJoinedByString:", CFSTR(","));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "appendFormat:", CFSTR("%@:%@|"), CFSTR("SupportedDeviceModels"), v34);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addKeyValuePair:with:", CFSTR("_CompatibilityVersion"), v35);

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "deviceClass");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addKeyValuePair:with:", CFSTR("Device"), v37);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "appendFormat:", CFSTR("%@:%@|"), CFSTR("_CompatibilityVersion"), v38);

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "deviceClass");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "appendFormat:", CFSTR("%@:%@|"), CFSTR("Device"), v40);

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "releaseType");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "releaseType");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addKeyValuePair:with:", CFSTR("ReleaseType"), v44);

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "releaseType");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "appendFormat:", CFSTR("%@:%@|"), CFSTR("ReleaseType"), v46);

  }
  else
  {
    objc_msgSend(v4, "addKeyValueNull:", CFSTR("ReleaseType"));
    objc_msgSend(v69, "appendFormat:", CFSTR("%@:Customer(null)|"), CFSTR("ReleaseType"));
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "oslog");
  v48 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v73 = 1;
    *(_WORD *)&v73[4] = 2114;
    *(_QWORD *)&v73[6] = v49;
    _os_log_impl(&dword_1DDFDD000, v48, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Query: Current device state (COMPATIBILITY_VERSION:%d): %{public}@", buf, 0x12u);

  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "oslog");
  v51 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v73 = v69;
    _os_log_impl(&dword_1DDFDD000, v51, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Query: Starting metadata query: %{public}@", buf, 0xCu);
  }

  v52 = objc_msgSend(v4, "queryMetaDataSync");
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "oslog");
  v54 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    MEMORY[0x1DF0E684C](v52);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)v73 = v55;
    *(_WORD *)&v73[8] = 2048;
    *(_QWORD *)&v73[10] = v52;
    _os_log_impl(&dword_1DDFDD000, v54, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Query: Metadata query completed with result: %{public}@ %ld", buf, 0x16u);

  }
  if (v52)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.MobileAssetError.Query"), v52, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "buildError:underlying:description:", 8401, v57, CFSTR("No available configuration assets found (failed to query metadata)"));
    v58 = (id)objc_claimAutoreleasedReturnValue();

    v59 = 0;
  }
  else
  {
    objc_msgSend(v4, "results");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0;
    -[SUCoreConfigServer _stateSafeSelectBestAssetFromArray:error:](self, "_stateSafeSelectBestAssetFromArray:error:", v56, &v71);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v71;
  }

  if (v58)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "oslog");
    v61 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      -[SUCoreConfigServer actionConfigQueryAsset:error:].cold.1();

    -[SUCoreConfigServer stateMachine](self, "stateMachine");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = -[SUCoreConfigParam initWithError:operation:]([SUCoreConfigParam alloc], "initWithError:operation:", v58, 1);
    objc_msgSend(v62, "postEvent:withInfo:", CFSTR("ConfigPhaseFailed"), v63);

    if (a4)
      *a4 = objc_retainAutorelease(v58);
    v64 = objc_msgSend(v58, "code");
  }
  else
  {
    -[SUCoreConfigServer stateMachine](self, "stateMachine");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = -[SUCoreConfigParam initWithLocatedAsset:]([SUCoreConfigParam alloc], "initWithLocatedAsset:", v59);
    objc_msgSend(v65, "followupEvent:withInfo:", CFSTR("ConfigPhaseComplete"), v66);

    v64 = 0;
  }

  return v64;
}

- (id)_stateSafeSelectBestAssetFromArray:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v23;
  id v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extendedStateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("No available configuration assets found (query not present)");
    v14 = 8402;
    goto LABEL_7;
  }
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("No available configuration assets found (query returned no assets)");
    v14 = 8406;
LABEL_7:
    objc_msgSend(v11, "buildError:underlying:description:", v14, 0, v13);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    v10 = 0;
    if (!v15)
      goto LABEL_13;
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("OnlyAsset");
LABEL_13:
    -[SUCoreConfigServer setLastLocatedAsset:](self, "setLastLocatedAsset:", v9);
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "attributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v10;
      v27 = 2114;
      v28 = v9;
      v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_1DDFDD000, v19, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: Located asset (reason: '%{public}@'): %{public}@; attributes: %{public}@",
        buf,
        0x20u);

    }
    v15 = 0;
    goto LABEL_16;
  }
  v23 = 0;
  v24 = 0;
  -[SUCoreConfigServer _stateSafeSelectBestAssetFromMultipleAssetArray:bestAsset:selectionReason:](self, "_stateSafeSelectBestAssetFromMultipleAssetArray:bestAsset:selectionReason:", v6, &v24, &v23);
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  v10 = (__CFString *)v23;
  if (!v15)
    goto LABEL_13;
LABEL_8:
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "oslog");
  v17 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v15;
    _os_log_impl(&dword_1DDFDD000, v17, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: Failed to locate asset with error: %{public}@", buf, 0xCu);
  }

  if (a4)
  {
    v15 = objc_retainAutorelease(v15);
    *a4 = v15;
  }
LABEL_16:
  v21 = v9;

  return v21;
}

- (id)_stateSafeSelectBestAssetFromMultipleAssetArray:(id)a3 bestAsset:(id *)a4 selectionReason:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v8 = a3;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extendedStateQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  *a4 = 0;
  *a5 = 0;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_303);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v12, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_307);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filteredArrayUsingPredicate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count"))
    {
      objc_msgSend(v16, "objectAtIndex:", 0);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("BuildVersion&HWModelStr");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_311);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filteredArrayUsingPredicate:", v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v12, "objectAtIndex:", 0);
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("BuildVersion&ProductVersion");
        goto LABEL_3;
      }
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_315);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "filteredArrayUsingPredicate:", v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v16, "objectAtIndex:", 0);
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("HWModelStr&ProductVersion");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_319);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "filteredArrayUsingPredicate:", v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "count"))
        {
          objc_msgSend(v12, "objectAtIndex:", 0);
          v13 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          v14 = CFSTR("BuildVersionOnly");
          goto LABEL_3;
        }
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_323);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "filteredArrayUsingPredicate:", v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v16, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_327);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "filteredArrayUsingPredicate:", v23);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v12, "count"))
          {
            objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "buildError:underlying:description:", 8409, 0, CFSTR("No available configuration assets found (multiple selection logic found no asset)"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_7;
          }
          objc_msgSend(v12, "objectAtIndex:", 0);
          v13 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          v14 = CFSTR("ProductVersionOnly");
          goto LABEL_3;
        }
        objc_msgSend(v16, "objectAtIndex:", 0);
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("HWModelStrOnly");
      }
    }
    *a5 = v17;
    v12 = v16;
    goto LABEL_7;
  }
  objc_msgSend(v12, "objectAtIndex:", 0);
  v13 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("FullMatch");
LABEL_3:
  *a5 = v14;
LABEL_7:

  return v13;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  const __CFString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeObjectForKey:ofClass:", CFSTR("SupportedDeviceModels"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeObjectForKey:ofClass:", CFSTR("PrerequisiteBuilds"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safeObjectForKey:ofClass:", CFSTR("PrerequisiteOSVersions"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hwModelString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v10))
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "buildVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "containsObject:", v12))
    {
      objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "productVersion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v8, "containsObject:", v14);

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "oslog");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "hwModelString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "buildVersion");
    v31 = v4;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v30 = v6;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "productVersion");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(","));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    *(_DWORD *)buf = 138544898;
    v27 = CFSTR("NO");
    v34 = v17;
    if (v32)
      v27 = CFSTR("YES");
    v35 = 2114;
    v36 = v19;
    v37 = 2114;
    v38 = v21;
    v39 = 2114;
    v40 = v22;
    v41 = 2114;
    v42 = v24;
    v43 = 2114;
    v44 = v25;
    v45 = 2114;
    v46 = v27;
    _os_log_impl(&dword_1DDFDD000, v16, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: FullMatch Predicate (Device:Asset) - HWModelString %{public}@:%{public}@; BuildVer"
      "sion %{public}@:%{public}@; ProductVersion %{public}@:%{public}@ | keep=%{public}@",
      buf,
      0x48u);

    v8 = v18;
    v6 = v30;

    v4 = v31;
  }

  return v32;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_306(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeObjectForKey:ofClass:", CFSTR("SupportedDeviceModels"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeObjectForKey:ofClass:", CFSTR("PrerequisiteBuilds"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hwModelString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v8))
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "containsObject:", v10);

  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oslog");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hwModelString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "buildVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v23 = 138544386;
    v21 = CFSTR("NO");
    v24 = v15;
    if ((_DWORD)v11)
      v21 = CFSTR("YES");
    v25 = 2114;
    v26 = v16;
    v27 = 2114;
    v28 = v18;
    v29 = 2114;
    v30 = v19;
    v31 = 2114;
    v32 = v21;
    _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: BuildVersion&HWModelStr Predicate (Device:Asset) - HWModelString %{public}@:%{public}@; BuildVersion %{public}@:%{public}@ | keep=%{public}@",
      (uint8_t *)&v23,
      0x34u);

  }
  return v11;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_310(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeObjectForKey:ofClass:", CFSTR("PrerequisiteBuilds"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeObjectForKey:ofClass:", CFSTR("PrerequisiteOSVersions"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "buildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v8))
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "productVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "containsObject:", v10);

  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oslog");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "buildVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "productVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v23 = 138544386;
    v21 = CFSTR("NO");
    v24 = v15;
    if ((_DWORD)v11)
      v21 = CFSTR("YES");
    v25 = 2114;
    v26 = v16;
    v27 = 2114;
    v28 = v18;
    v29 = 2114;
    v30 = v19;
    v31 = 2114;
    v32 = v21;
    _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: BuildVersion&ProductVersion Predicate (Device:Asset) - BuildVersion %{public}@:%{public}@; ProductVersion %{public}@:%{public}@ | keep=%{public}@",
      (uint8_t *)&v23,
      0x34u);

  }
  return v11;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_314(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeObjectForKey:ofClass:", CFSTR("SupportedDeviceModels"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeObjectForKey:ofClass:", CFSTR("PrerequisiteOSVersions"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hwModelString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v8))
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "productVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "containsObject:", v10);

  }
  else
  {
    v11 = 0;
  }

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oslog");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hwModelString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "productVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(","));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v23 = 138544386;
    v21 = CFSTR("NO");
    v24 = v15;
    if ((_DWORD)v11)
      v21 = CFSTR("YES");
    v25 = 2114;
    v26 = v16;
    v27 = 2114;
    v28 = v18;
    v29 = 2114;
    v30 = v19;
    v31 = 2114;
    v32 = v21;
    _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: HWModelStr&ProductVersion Predicate (Device:Asset) - HWModelString %{public}@:%{public}@; ProductVersion %{public}@:%{public}@ | keep=%{public}@",
      (uint8_t *)&v23,
      0x34u);

  }
  return v11;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_318(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeObjectForKey:ofClass:", CFSTR("PrerequisiteBuilds"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("NO");
    v15 = 138543874;
    v16 = v10;
    v17 = 2114;
    if ((_DWORD)v6)
      v13 = CFSTR("YES");
    v18 = v11;
    v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: BuildVersionOnly Predicate (Device:Asset) - BuildVersion %{public}@:%{public}@ | keep=%{public}@", (uint8_t *)&v15, 0x20u);

  }
  return v6;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_322(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeObjectForKey:ofClass:", CFSTR("SupportedDeviceModels"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hwModelString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hwModelString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("NO");
    v15 = 138543874;
    v16 = v10;
    v17 = 2114;
    if ((_DWORD)v6)
      v13 = CFSTR("YES");
    v18 = v11;
    v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: HWModelStrOnly Predicate (Device:Asset) - HWModelString %{public}@:%{public}@ | keep=%{public}@", (uint8_t *)&v15, 0x20u);

  }
  return v6;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_326(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeObjectForKey:ofClass:", CFSTR("PrerequisiteOSVersions"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "containsObject:", v5);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "productVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("NO");
    v15 = 138543874;
    v16 = v10;
    v17 = 2114;
    if ((_DWORD)v6)
      v13 = CFSTR("YES");
    v18 = v11;
    v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] SelectBestAsset: ProductVersionOnly Predicate (Device:Asset) - ProductVersion %{public}@:%{public}@ | keep=%{public}@", (uint8_t *)&v15, 0x20u);

  }
  return v6;
}

- (int64_t)actionConfigDownloadAsset:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  SUCoreConfigParam *v16;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "locatedAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreConfigServer _stateSafeDownloadOptions](self, "_stateSafeDownloadOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v7;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Download: Starting download of configuration asset with options: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v5, "locatedAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __54__SUCoreConfigServer_actionConfigDownloadAsset_error___block_invoke;
    v18[3] = &unk_1EA878800;
    v18[4] = self;
    v19 = v5;
    objc_msgSend(v10, "startDownload:completionWithError:", v7, v18);

    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "buildError:underlying:description:", 8116, 0, CFSTR("No located configuration asset for download"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SUCoreConfigServer actionConfigDownloadAsset:error:].cold.1();

    -[SUCoreConfigServer stateMachine](self, "stateMachine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SUCoreConfigParam initWithError:operation:]([SUCoreConfigParam alloc], "initWithError:operation:", v7, 2);
    objc_msgSend(v15, "postEvent:withInfo:", CFSTR("ConfigPhaseFailed"), v16);

    v11 = 8116;
  }

  return v11;
}

void __54__SUCoreConfigServer_actionConfigDownloadAsset_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  SUCoreConfigParam *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    MEMORY[0x1DF0E6840](a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v8;
    _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Download: Asset download completed with MADownloadResult: %{public}@", (uint8_t *)&v15, 0xCu);

  }
  if (a2 != 10 && a2)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "buildError:underlying:description:", 8700, v5, CFSTR("Software update configuration asset download failed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SUCoreConfigServer actionConfigDownloadAsset:error:].cold.1();

    objc_msgSend(*(id *)(a1 + 32), "stateMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SUCoreConfigParam initWithError:operation:]([SUCoreConfigParam alloc], "initWithError:operation:", v9, 2);
    objc_msgSend(v13, "postEvent:withInfo:", CFSTR("ConfigPhaseFailed"), v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "stateMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postEvent:withInfo:", CFSTR("ConfigPhaseComplete"), *(_QWORD *)(a1 + 40));
  }

}

- (int64_t)actionConfigAdjustSettings:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  SUCoreConfigParam *v22;
  int64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  SUCoreConfigParam *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  SUCoreConfigParam *v52;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Adjust: Adjusting configuration with server settings", buf, 2u);
  }

  objc_msgSend(v6, "locatedAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "locatedAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "refreshState");

    if ((v11 & 1) != 0)
    {
      objc_msgSend(v6, "locatedAsset");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "wasLocal");

      if ((v13 & 1) != 0)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("Asset is not downloaded (wasLocal returned false)");
      v17 = 8707;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("Asset is not available (refreshState returned false)");
      v17 = 8706;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("Asset was not located (asset not present)");
    v17 = 8116;
  }
  objc_msgSend(v14, "buildError:underlying:description:", v17, 0, v16);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "oslog");
    v20 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SUCoreConfigServer actionConfigAdjustSettings:error:].cold.2();

    -[SUCoreConfigServer stateMachine](self, "stateMachine");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SUCoreConfigParam initWithError:operation:]([SUCoreConfigParam alloc], "initWithError:operation:", v18, 3);
    objc_msgSend(v21, "followupEvent:withInfo:", CFSTR("ConfigPhaseFailed"), v22);

    if (a4)
    {
      v18 = objc_retainAutorelease(v18);
      *a4 = v18;
    }
    v23 = 8406;
    goto LABEL_29;
  }
LABEL_15:
  objc_msgSend(v6, "locatedAsset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "attributes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "safeStringForKey:", CFSTR("ConfigurationPlist"));
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  v28 = CFSTR("Configuration.plist");
  if (v26)
    v28 = (__CFString *)v26;
  v29 = v28;

  objc_msgSend(v6, "locatedAsset");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "getLocalUrl");
  v31 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v31, "path");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringByAppendingPathComponent:", v29);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v31) = objc_msgSend(v34, "fileExistsAtPath:", v33);

  if ((v31 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "safeObjectForKey:ofClass:", CFSTR("Projects"), objc_opt_class());
    v36 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "oslog");
    v38 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v55 = v36;
      _os_log_impl(&dword_1DDFDD000, v38, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Adjust: Updating configuration for projects: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_350);
    -[SUCoreConfigServer _stateSafeInformDelegatesOfConfiguration:error:](self, "_stateSafeInformDelegatesOfConfiguration:error:", v35, 0);
    -[SUCoreConfigServer _stateSafeSendInstalledEventWithSuccess:error:](self, "_stateSafeSendInstalledEventWithSuccess:error:", 1, 0);
    v59 = CFSTR("com.apple.MobileAsset.SoftwareUpdateConfiguration");
    objc_msgSend(v6, "locatedAsset");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "assetId");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v41;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "oslog");
    v44 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(&unk_1EA89ABF0, "componentsJoinedByString:", CFSTR(", "));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v45;
      v56 = 2114;
      v57 = v42;
      _os_log_impl(&dword_1DDFDD000, v44, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Purge: Purging all assets (via MAPurgeAllExceptGivenIds) of type %{public}@ except: %{public}@", buf, 0x16u);

    }
    MAPurgeAllExceptGivenIds();
    -[SUCoreConfigServer stateMachine](self, "stateMachine");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_alloc_init(SUCoreConfigParam);
    objc_msgSend(v46, "postEvent:withInfo:", CFSTR("ConfigPhaseComplete"), v47);

    v23 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asset configuration plist does not exist at expected path: %@"), v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "buildError:underlying:description:", 8125, 0, v35);
    v36 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "oslog");
    v50 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      -[SUCoreConfigServer actionConfigAdjustSettings:error:].cold.1();

    -[SUCoreConfigServer stateMachine](self, "stateMachine");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[SUCoreConfigParam initWithError:operation:]([SUCoreConfigParam alloc], "initWithError:operation:", v36, 3);
    objc_msgSend(v51, "followupEvent:withInfo:", CFSTR("ConfigPhaseFailed"), v52);

    if (a4)
    {
      v36 = objc_retainAutorelease(v36);
      *a4 = v36;
    }
    v23 = 8406;
  }

  v18 = 0;
LABEL_29:

  return v23;
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v4
    && (+[SUCoreConfigServer allowedServerProjects](SUCoreConfigServer, "allowedServerProjects"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "containsObject:", v4),
        v6,
        v7))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8928]), "initWithProjectName:", v4);
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v4;
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Adjust: Updating configuration for project: %{public}@, with configuration: %{public}@", buf, 0x16u);
    }

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_351;
    v13[3] = &unk_1EA879F78;
    v14 = v8;
    v15 = v4;
    v11 = v8;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_cold_1();
  }

}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_351(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  if (v5
    && (+[SUCoreConfigServer allowedServerKeys](SUCoreConfigServer, "allowedServerKeys"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsObject:", v5),
        v7,
        v8))
  {
    objc_msgSend(*(id *)(a1 + 32), "setConfig:forKey:", v6, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_351_cold_1();

  }
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_353(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  SUCoreConfigParam *v7;
  uint8_t v8[16];

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_353_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Purge: Purge (MAPurgeAllExceptGivenIds) completed successfully", v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(SUCoreConfigParam);
  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("ConfigPhaseComplete"), v7);

}

- (void)_stateSafeInformDelegatesOfConfiguration:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extendedStateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "oslog");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreConfigServer listenerDelegates](self, "listenerDelegates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v20 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Delegate: Informing %ld listener delegates of updated config", buf, 0xCu);

  }
  -[SUCoreConfigServer listenerDelegates](self, "listenerDelegates");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__SUCoreConfigServer__stateSafeInformDelegatesOfConfiguration_error___block_invoke;
  v16[3] = &unk_1EA879FA0;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v14 = v7;
  v15 = v6;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v16);

}

void __69__SUCoreConfigServer__stateSafeInformDelegatesOfConfiguration_error___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD block[4];
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Delegate: Sending updated config notification to delegate with name: %{public}@", buf, 0xCu);
    }

    objc_msgSend(a1[4], "clientDelegateQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__SUCoreConfigServer__stateSafeInformDelegatesOfConfiguration_error___block_invoke_357;
    block[3] = &unk_1EA878940;
    v13 = v6;
    v14 = a1[5];
    v15 = a1[6];
    dispatch_async(v9, block);

    v10 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Delegate: Delegate does not respond to updated config callbacks (%{public}@)", buf, 0xCu);
    }
  }

}

uint64_t __69__SUCoreConfigServer__stateSafeInformDelegatesOfConfiguration_error___block_invoke_357(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "coreConfigServerSettingsUpdated:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (int64_t)actionConfigScheduleScan:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SUCoreActivityOptions *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  SUCoreActivity *v27;
  void *v28;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreConfigServer _stateSafeSendInstalledEventWithSuccess:error:](self, "_stateSafeSendInstalledEventWithSuccess:error:", 0, v7);

    objc_msgSend(v5, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreConfigServer _stateSafeInformDelegatesOfConfiguration:error:](self, "_stateSafeInformDelegatesOfConfiguration:error:", 0, v8);

  }
  if (actionConfigScheduleScan_error__schedulerDefaultOnce != -1)
    dispatch_once(&actionConfigScheduleScan_error__schedulerDefaultOnce, &__block_literal_global_359);
  v9 = objc_alloc_init(SUCoreActivityOptions);
  -[SUCoreConfigServer _stateSafeDetermineNextScanTime](self, "_stateSafeDetermineNextScanTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreActivityOptions setRunDate:](v9, "setRunDate:", v10);

  -[SUCoreActivityOptions setNetworkState:](v9, "setNetworkState:", 2);
  -[SUCoreActivityOptions setWaking:](v9, "setWaking:", 2);
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (void *)MEMORY[0x1E0DA8920];
  -[SUCoreActivityOptions runDate](v9, "runDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreActivityOptions waking](v9, "waking"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  if (-[SUCoreActivityOptions networkState](v9, "networkState"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  objc_msgSend(v11, "stringWithFormat:", CFSTR("runDate=%@ waking=%@ networkState=%@"), v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreConfigServer scheduledActivityName](self, "scheduledActivityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "oslog");
  v20 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v18;
    _os_log_impl(&dword_1DDFDD000, v20, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Schedule: Unregistering all activities with name: %{public}@", buf, 0xCu);
  }

  if (actionConfigScheduleScan_error__useXPCActivityScheduler)
  {
    +[SUCoreXPCActivityManager sharedInstance](SUCoreXPCActivityManager, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "unscheduleActivity:", v18);
  }
  else
  {
    +[SUCoreActivityScheduler sharedInstance](SUCoreActivityScheduler, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "unregisterActivitiesWithName:", v18);
  }

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "oslog");
  v23 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (void *)MEMORY[0x1E0DA8920];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringFromDate:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v17;
    v32 = 2114;
    v33 = v26;
    _os_log_impl(&dword_1DDFDD000, v23, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Schedule: Scheduling activity with options: %{public}@; current date: %{public}@",
      buf,
      0x16u);

  }
  if (actionConfigScheduleScan_error__useXPCActivityScheduler)
  {
    v27 = -[SUCoreXPCActivity init:options:handler:]([SUCoreXPCActivity alloc], "init:options:handler:", v18, v9, &__block_literal_global_375);
    +[SUCoreXPCActivityManager sharedInstance](SUCoreXPCActivityManager, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "scheduleActivity:", v27);
  }
  else
  {
    v27 = -[SUCoreActivity initWithActivityName:options:]([SUCoreActivity alloc], "initWithActivityName:options:", v18, v9);
    +[SUCoreActivityScheduler sharedInstance](SUCoreActivityScheduler, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "scheduleActivity:withHandler:", v27, &__block_literal_global_381);
  }

  -[SUCoreConfigServer _stateSafeSendScheduledEventWithSuccess:error:](self, "_stateSafeSendScheduledEventWithSuccess:error:", 1, 0);
  return 0;
}

void __53__SUCoreConfigServer_actionConfigScheduleScan_error___block_invoke()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;
  int v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;

  v0 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("SUUseXPCActivityScheduler"), CFSTR("com.apple.softwareupdateservicesd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v1 = v0;
  if (v0 && (v2 = CFGetTypeID(v0), v2 == CFBooleanGetTypeID()))
  {
    v3 = CFBooleanGetValue(v1) == 1;
    actionConfigScheduleScan_error__useXPCActivityScheduler = v3;
  }
  else
  {
    v3 = actionConfigScheduleScan_error__useXPCActivityScheduler;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v6)
      goto LABEL_11;
    v10 = 0;
    v7 = "[SUCoreConfig]: Using SUCoreXPCActivityScheduler for scheduling";
    v8 = (uint8_t *)&v10;
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    v9 = 0;
    v7 = "[SUCoreConfig]: Using default scheduler for scheduling";
    v8 = (uint8_t *)&v9;
  }
  _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
LABEL_11:

  if (v1)
    CFRelease(v1);
}

void __53__SUCoreConfigServer_actionConfigScheduleScan_error___block_invoke_373()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  __CFString *v3;
  void *v4;
  int v5;
  __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v0 = xpc_activity_copy_identifier();
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "oslog");
  v2 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (v0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v0);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = CFSTR("(Unknown activity)");
    }
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DDFDD000, v2, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Schedule: Scheduled activity %@ fired! Scanning for new confibutration updates", (uint8_t *)&v5, 0xCu);
    if (v0)

  }
  +[SUCoreConfigServer sharedServerSettings](SUCoreConfigServer, "sharedServerSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installServerSettings");

}

void __53__SUCoreConfigServer_actionConfigScheduleScan_error___block_invoke_379(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)MEMORY[0x1E0DA8920];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringFromDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v4;
    v14 = 2114;
    v15 = v5;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Schedule: Scheduled activity fired! Scanning for new configuration updates (registrationID=%{public}@ info=%{public}@ currentDate=%{public}@)", (uint8_t *)&v12, 0x20u);

  }
  +[SUCoreConfigServer sharedServerSettings](SUCoreConfigServer, "sharedServerSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "installServerSettings");

}

- (id)_stateSafeDownloadOptions
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;

  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v5 = objc_alloc_init(MEMORY[0x1E0D4E088]);
  objc_msgSend(v5, "setDiscretionary:", 0);
  objc_msgSend(v5, "setAllowsCellularAccess:", 1);
  objc_msgSend(v5, "setAllowsExpensiveAccess:", 1);
  -[SUCoreConfigServer uuidString](self, "uuidString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionId:", v6);

  return v5;
}

- (void)_stateSafeResetState
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConfigServer setLastScanTime:](self, "setLastScanTime:", v3);

  -[SUCoreConfigServer setNextScanTime:](self, "setNextScanTime:", 0);
  -[SUCoreConfigServer _stateSafeUpdateState](self, "_stateSafeUpdateState");
  -[SUCoreConfigServer scheduledActivityName](self, "scheduledActivityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] ResetState: Unregistering all activities with name: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (_stateSafeResetState_schedulerDefaultOnce != -1)
    dispatch_once(&_stateSafeResetState_schedulerDefaultOnce, &__block_literal_global_383);
  if (_stateSafeResetState_useXPCActivityScheduler)
  {
    +[SUCoreXPCActivityManager sharedInstance](SUCoreXPCActivityManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unscheduleActivity:", v4);
  }
  else
  {
    +[SUCoreActivityScheduler sharedInstance](SUCoreActivityScheduler, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unregisterActivitiesWithName:", v4);
  }

}

void __42__SUCoreConfigServer__stateSafeResetState__block_invoke()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;
  int v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;

  v0 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("SUUseXPCActivityScheduler"), CFSTR("com.apple.softwareupdateservicesd"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  v1 = v0;
  if (v0 && (v2 = CFGetTypeID(v0), v2 == CFBooleanGetTypeID()))
  {
    v3 = CFBooleanGetValue(v1) == 1;
    _stateSafeResetState_useXPCActivityScheduler = v3;
  }
  else
  {
    v3 = _stateSafeResetState_useXPCActivityScheduler;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oslog");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v6)
      goto LABEL_11;
    v10 = 0;
    v7 = "[SUCoreConfig]: Using SUCoreXPCActivityScheduler for scheduling";
    v8 = (uint8_t *)&v10;
  }
  else
  {
    if (!v6)
      goto LABEL_11;
    v9 = 0;
    v7 = "[SUCoreConfig]: Using default scheduler for scheduling";
    v8 = (uint8_t *)&v9;
  }
  _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
LABEL_11:

  if (v1)
    CFRelease(v1);
}

- (void)_stateSafeUpdateState
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUCoreConfigServer persistedState](self, "persistedState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "loadPersistedState");

  if ((_DWORD)v4)
  {
    -[SUCoreConfigServer persistedState](self, "persistedState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreConfigServer lastScanTime](self, "lastScanTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistDate:forKey:", v7, CFSTR("LastScanTime"));

    -[SUCoreConfigServer persistedState](self, "persistedState");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SUCoreConfigServer nextScanTime](self, "nextScanTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "persistDate:forKey:", v8, CFSTR("NextScanTime"));

  }
}

- (id)_stateSafeDetermineNextScanTime
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUCoreConfigServer persistedState](self, "persistedState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "loadPersistedState");

  if ((_DWORD)v4)
  {
    -[SUCoreConfigServer persistedState](self, "persistedState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateForKey:", CFSTR("LastScanTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreConfigServer persistedState](self, "persistedState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateForKey:", CFSTR("NextScanTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
    v7 = 0;
  }
  -[SUCoreConfigServer coreConfig](self, "coreConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getNumberConfigForKey:", *MEMORY[0x1E0DA89A8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreConfigServer _nextScanTimeFromDate:](self, "_nextScanTimeFromDate:", v7);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v11)
  {
    v14 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v11, "doubleValue");
    objc_msgSend(v14, "dateWithTimeIntervalSinceNow:", v15 * 60.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "oslog");
    v18 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0DA8920], "stringFromDate:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543618;
      v40 = v11;
      v41 = 2114;
      v42 = v19;
      _os_log_impl(&dword_1DDFDD000, v18, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] NextScanTime: Using nextScanTime scan interval override (%{public}@) for proposed scan: %{public}@", (uint8_t *)&v39, 0x16u);

    }
  }
  else
  {
    v16 = (void *)v12;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v9, "compare:", v20);

  if (v21 == -1)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "oslog");
    v32 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0DA8920], "stringFromDate:", v9);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543362;
      v40 = v33;
      _os_log_impl(&dword_1DDFDD000, v32, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] NextScanTime: Previous nextScanTime (%{public}@) has already passed, removing now", (uint8_t *)&v39, 0xCu);

    }
    v9 = 0;
  }
  else if (v9 && objc_msgSend(v9, "compare:", v16) == -1)
  {
    -[SUCoreConfigServer setNextScanTime:](self, "setNextScanTime:", v9);
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "oslog");
    v23 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)MEMORY[0x1E0DA8920];
      -[SUCoreConfigServer nextScanTime](self, "nextScanTime");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringFromDate:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0DA8920];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringFromDate:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543618;
      v40 = v26;
      v41 = 2114;
      v42 = v29;
      v30 = "[SUCoreConfig] NextScanTime: Using nextScanTime (via previous): %{public}@, current time: %{public}@";
LABEL_19:
      _os_log_impl(&dword_1DDFDD000, v23, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v39, 0x16u);

      goto LABEL_20;
    }
    goto LABEL_20;
  }
  -[SUCoreConfigServer setNextScanTime:](self, "setNextScanTime:", v16);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "oslog");
  v23 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v35 = (void *)MEMORY[0x1E0DA8920];
    -[SUCoreConfigServer nextScanTime](self, "nextScanTime");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringFromDate:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0DA8920];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringFromDate:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138543618;
    v40 = v26;
    v41 = 2114;
    v42 = v29;
    v30 = "[SUCoreConfig] NextScanTime: Using nextScanTime (via proposed): %{public}@, current time: %{public}@";
    goto LABEL_19;
  }
LABEL_20:

  -[SUCoreConfigServer _stateSafeUpdateState](self, "_stateSafeUpdateState");
  -[SUCoreConfigServer nextScanTime](self, "nextScanTime");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)_nextScanTimeFromDate:(id)a3
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isBootedOSSecureInternal"))
    v5 = 86400.0;
  else
    v5 = 604800.0;

  v6 = (void *)MEMORY[0x1E0C99D68];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateWithTimeInterval:sinceDate:", v8, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)_stateSafeSendScheduledEventWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v6;
  NSObject *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreConfigServer _stateSafeSendNewEvent:success:error:](self, "_stateSafeSendNewEvent:success:error:", CFSTR("SUCoreConfigScheduled"), v4, v8);
}

- (void)_stateSafeSendInstalledEventWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v6;
  NSObject *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreConfigServer _stateSafeSendNewEvent:success:error:](self, "_stateSafeSendNewEvent:success:error:", CFSTR("SUCoreConfigInstalled"), v4, v8);
}

- (void)_stateSafeSendNewEvent:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
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
  void *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  NSObject *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extendedStateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  v12 = (id)*MEMORY[0x1E0DA8B28];
  if (!a4)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ - %ld"), v14, objc_msgSend(v9, "code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0DA8AD8]);

    if ((_DWORD)v14)
    {
      objc_msgSend(MEMORY[0x1E0DA8920], "errorNameForCode:", objc_msgSend(v9, "code"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingFormat:", CFSTR(" (%@)"), v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v18;
    }
    objc_msgSend(v9, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0CB3388];
    objc_msgSend(v19, "safeObjectForKey:ofClass:", *MEMORY[0x1E0CB3388], objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v9, "userInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "safeObjectForKey:ofClass:", v20, objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "checkedNameForCode");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingFormat:", CFSTR(" [%@]"), v24);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = v15;
    }
  }
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v25, "setSafeObject:forKey:", v12, *MEMORY[0x1E0DA8B20]);
  v66 = v9;
  objc_msgSend(v9, "checkedSummary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSafeObject:forKey:", v26, *MEMORY[0x1E0DA8B08]);

  objc_msgSend(v25, "setSafeObject:forKey:", v8, *MEMORY[0x1E0DA8B18]);
  -[SUCoreConfigServer _stateSafeLoadUUIDString](self, "_stateSafeLoadUUIDString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSafeObject:forKey:", v27, *MEMORY[0x1E0DA8B58]);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSafeObject:forKey:", v28, CFSTR("compatibilityVersion"));

  v29 = (void *)MEMORY[0x1E0DA8920];
  -[SUCoreConfigServer lastScanTime](self, "lastScanTime");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringFromDate:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSafeObject:forKey:", v31, CFSTR("lastScanTime"));

  v32 = (void *)MEMORY[0x1E0DA8920];
  -[SUCoreConfigServer nextScanTime](self, "nextScanTime");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringFromDate:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSafeObject:forKey:", v34, CFSTR("nextScanTime"));

  objc_msgSend(v25, "setSafeObject:forKey:", CFSTR("CoreDuet"), CFSTR("scannerMethod"));
  v35 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreConfigServer lastLocatedAsset](self, "lastLocatedAsset");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "assetId");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  if (v37)
    v39 = (const __CFString *)v37;
  else
    v39 = CFSTR("none");
  objc_msgSend(v35, "stringWithFormat:", CFSTR("%@"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSafeObject:forKey:", v40, CFSTR("lastLocatedAssetId"));

  v41 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreConfigServer lastLocatedAsset](self, "lastLocatedAsset");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "attributes");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "safeStringForKey:", CFSTR("GenerationDate"));
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = v8;
  v46 = (void *)v44;
  if (v44)
    v47 = (const __CFString *)v44;
  else
    v47 = CFSTR("none");
  objc_msgSend(v41, "stringWithFormat:", CFSTR("%@"), v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSafeObject:forKey:", v48, CFSTR("lastLocatedAssetGenerationDate"));

  v49 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreConfigServer lastLocatedAsset](self, "lastLocatedAsset");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "attributes");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "safeStringForKey:", CFSTR("UniqueID"));
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = (void *)v52;
  if (v52)
    v54 = (const __CFString *)v52;
  else
    v54 = CFSTR("none");
  objc_msgSend(v49, "stringWithFormat:", CFSTR("%@"), v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSafeObject:forKey:", v55, CFSTR("lastLocatedAssetUniqueID"));

  +[SUCoreConfigServer allowedServerProjects](SUCoreConfigServer, "allowedServerProjects");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __59__SUCoreConfigServer__stateSafeSendNewEvent_success_error___block_invoke;
  v67[3] = &unk_1EA87A0B0;
  v57 = v25;
  v68 = v57;
  objc_msgSend(v56, "enumerateObjectsUsingBlock:", v67);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "oslog");
  v59 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v70 = v45;
    v71 = 2114;
    v72 = v12;
    _os_log_impl(&dword_1DDFDD000, v59, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Sending event '%{public}@' with result: %{public}@", buf, 0x16u);
  }

  v60 = objc_alloc(MEMORY[0x1E0DA8948]);
  v61 = objc_alloc(MEMORY[0x1E0C99E98]);
  v62 = (void *)objc_msgSend(v61, "initWithString:", *MEMORY[0x1E0DA8B98]);
  v63 = (void *)objc_msgSend(v60, "initWithEventDictionary:extendingWith:reportingToServer:", v57, 0, v62);

  objc_msgSend(MEMORY[0x1E0DA8950], "sharedReporter");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "getAugmentedEvent");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "sendEvent:", v65);

}

void __59__SUCoreConfigServer__stateSafeSendNewEvent_success_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a2;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8928]), "initWithProjectName:", v9);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("|"));
  objc_msgSend(v3, "getConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__SUCoreConfigServer__stateSafeSendNewEvent_success_error___block_invoke_2;
  v10[3] = &unk_1EA87A088;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  if ((unint64_t)objc_msgSend(v6, "length") >= 2)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("currentConfig%@"), v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSafeObject:forKey:", v6, v8);

  }
}

void __59__SUCoreConfigServer__stateSafeSendNewEvent_success_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@=%@|"), v11, v5);
  }
  else
  {
    v6 = objc_opt_respondsToSelector();
    v7 = *(void **)(a1 + 32);
    if ((v6 & 1) != 0)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR("%@=%@|"), v11, v9);

    }
    else
    {
      objc_msgSend(v7, "appendFormat:", CFSTR("%@=unknown|"), v11, v10);
    }
  }

}

- (id)_stateSafeLoadUUIDString
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUCoreConfigServer persistedState](self, "persistedState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "loadPersistedState");

  if ((_DWORD)v4)
  {
    -[SUCoreConfigServer persistedState](self, "persistedState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringForKey:", CFSTR("UUIDString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreConfigServer setUuidString:](self, "setUuidString:", v7);

  }
  -[SUCoreConfigServer uuidString](self, "uuidString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreConfigServer setUuidString:](self, "setUuidString:", v10);

    -[SUCoreConfigServer persistedState](self, "persistedState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v11, "loadPersistedState");

    if ((_DWORD)v10)
    {
      -[SUCoreConfigServer persistedState](self, "persistedState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreConfigServer uuidString](self, "uuidString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "persistString:forKey:", v13, CFSTR("UUIDString"));

    }
  }
  return -[SUCoreConfigServer uuidString](self, "uuidString");
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
  objc_storeStrong((id *)&self->_uuidString, a3);
}

- (NSDate)lastScanTime
{
  return self->_lastScanTime;
}

- (void)setLastScanTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastScanTime, a3);
}

- (NSDate)nextScanTime
{
  return self->_nextScanTime;
}

- (void)setNextScanTime:(id)a3
{
  objc_storeStrong((id *)&self->_nextScanTime, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (MAAsset)lastLocatedAsset
{
  return self->_lastLocatedAsset;
}

- (void)setLastLocatedAsset:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocatedAsset, a3);
}

- (SUCoreFSM)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (SUCorePersistedState)persistedState
{
  return self->_persistedState;
}

- (void)setPersistedState:(id)a3
{
  objc_storeStrong((id *)&self->_persistedState, a3);
}

- (NSMutableDictionary)listenerDelegates
{
  return self->_listenerDelegates;
}

- (void)setListenerDelegates:(id)a3
{
  objc_storeStrong((id *)&self->_listenerDelegates, a3);
}

- (SUCoreConfig)coreConfig
{
  return self->_coreConfig;
}

- (void)setCoreConfig:(id)a3
{
  objc_storeStrong((id *)&self->_coreConfig, a3);
}

- (OS_dispatch_queue)clientDelegateQueue
{
  return self->_clientDelegateQueue;
}

- (void)setClientDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientDelegateQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDelegateQueue, 0);
  objc_storeStrong((id *)&self->_coreConfig, 0);
  objc_storeStrong((id *)&self->_listenerDelegates, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_lastLocatedAsset, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_nextScanTime, 0);
  objc_storeStrong((id *)&self->_lastScanTime, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
}

+ (void)persistedStateFilePath
{
  int v3;
  const __CFString *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = CFSTR("/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore");
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_0_5(&dword_1DDFDD000, a2, a3, "[SUCoreConfig] PersistedStateFilePath: Failed to create cache directory at path: %{public}@, error: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

void __56__SUCoreConfigServer_actionConfigDownloadCatalog_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, v0, v1, "[SUCoreConfig] Catalog: Failed to download software update configuration catalog: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)actionConfigQueryAsset:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, v0, v1, "[SUCoreConfig] Query: Failed to locate config: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)actionConfigDownloadAsset:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, v0, v1, "[SUCoreConfig] Download: Failed to download software update configuration asset: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)actionConfigAdjustSettings:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, v0, v1, "[SUCoreConfig] Adjust: Failed adjust configuration: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)actionConfigAdjustSettings:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, v0, v1, "[SUCoreConfig] Adjust: Failed to adjust configuration: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, v0, v1, "[SUCoreConfig] Adjust: Not processing non-allowed project '%{public}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_351_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_3();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_0_5(&dword_1DDFDD000, v1, (uint64_t)v1, "[SUCoreConfig] Adjust: Not processing non-allowed key '%{public}@' for project '%{public}@'", v2);
  OUTLINED_FUNCTION_2_0();
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_353_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, v0, v1, "[SUCoreConfig] Purge: Purge (MAPurgeAllExceptGivenIds) failed to complete successfully: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
