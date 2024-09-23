@implementation SUManagerCore

- (SUManagerCore)init
{
  SUManagerCore *v2;
  SUManagerCore *v3;
  dispatch_semaphore_t v4;
  OS_dispatch_semaphore *resumeFromStateSemaphore;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *workQueue;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *externWorkQueue;
  uint64_t v12;
  NSHashTable *observers;
  uint64_t v14;
  SUState *state;
  NSDictionary *mandatoryUpdateDictionary;
  NSString *sessionID;
  NSString *potentialNextSessionID;
  SUSFollowUpController *followUpController;
  uint64_t v20;
  SUCoreEventReporter *coreReporter;
  NSDate *lastStashbagPersistedDate;
  SUManagerEngine *v23;
  SUManagerEngine *engine;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  SUManagerCore *v33;
  uint64_t v34;
  SUManagedDeviceManager *managedDeviceManager;
  SUDescriptor *updateOfCurrentStorageFollowup;
  uint64_t v38;
  _QWORD block[4];
  SUManagerCore *v40;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)SUManagerCore;
  v2 = -[SUManagerCore init](&v41, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeWeak((id *)&v2->_delegate, 0);
    v4 = dispatch_semaphore_create(0);
    resumeFromStateSemaphore = v3->_resumeFromStateSemaphore;
    v3->_resumeFromStateSemaphore = (OS_dispatch_semaphore *)v4;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.softwareupdateservices.workqueue", v6);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.softwareupdateservices.externWorkqueue", v9);
    externWorkQueue = v3->_externWorkQueue;
    v3->_externWorkQueue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v12 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v12;

    +[SUState currentState](SUState, "currentState");
    v14 = objc_claimAutoreleasedReturnValue();
    state = v3->_state;
    v3->_state = (SUState *)v14;

    mandatoryUpdateDictionary = v3->_mandatoryUpdateDictionary;
    v3->_mandatoryUpdateDictionary = 0;

    sessionID = v3->_sessionID;
    v3->_sessionID = 0;

    potentialNextSessionID = v3->_potentialNextSessionID;
    v3->_potentialNextSessionID = 0;

    followUpController = v3->_followUpController;
    v3->_followUpController = 0;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BEAEA58]), "initStoringToPath:", CFSTR("/var/mobile/Library/SoftwareUpdate"));
    coreReporter = v3->_coreReporter;
    v3->_coreReporter = (SUCoreEventReporter *)v20;

    lastStashbagPersistedDate = v3->_lastStashbagPersistedDate;
    v3->_lastStashbagPersistedDate = 0;

    v3->_reportStartedFromPersistedState = 0;
    v23 = -[SUManagerEngine initWithDelegate:]([SUManagerEngine alloc], "initWithDelegate:", v3);
    engine = v3->_engine;
    v3->_engine = v23;

    if (!v3->_engine)
      SULogInfo(CFSTR("Failed creating SUManagerEngine"), v25, v26, v27, v28, v29, v30, v31, v38);
    v32 = v3->_workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __21__SUManagerCore_init__block_invoke;
    block[3] = &unk_24CE3B5C0;
    v33 = v3;
    v40 = v33;
    dispatch_sync(v32, block);
    +[SUManagedDeviceManager sharedInstance](SUManagedDeviceManager, "sharedInstance");
    v34 = objc_claimAutoreleasedReturnValue();
    managedDeviceManager = v33->_managedDeviceManager;
    v33->_managedDeviceManager = (SUManagedDeviceManager *)v34;

    -[SUManagedDeviceManager setDelegate:](v33->_managedDeviceManager, "setDelegate:", v33);
    updateOfCurrentStorageFollowup = v33->_updateOfCurrentStorageFollowup;
    v33->_updateOfCurrentStorageFollowup = 0;

    v33->_resetDownloadStateOnCleanActivation = 0;
  }
  return v3;
}

uint64_t __21__SUManagerCore_init__block_invoke(uint64_t a1)
{
  SUScanner *v2;
  uint64_t v3;
  void *v4;
  SUDownloader *v5;
  uint64_t v6;
  void *v7;
  SUInstaller *v8;
  uint64_t v9;
  void *v10;
  SURollbackController *v11;
  uint64_t v12;
  void *v13;

  v2 = -[SUScanner initWithCore:]([SUScanner alloc], "initWithCore:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  v5 = -[SUDownloader initWithCore:]([SUDownloader alloc], "initWithCore:", *(_QWORD *)(a1 + 32));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

  v8 = -[SUInstaller initWithCore:]([SUInstaller alloc], "initWithCore:", *(_QWORD *)(a1 + 32));
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 32);
  *(_QWORD *)(v9 + 32) = v8;

  v11 = -[SURollbackController initWithCore:]([SURollbackController alloc], "initWithCore:", *(_QWORD *)(a1 + 32));
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  return objc_msgSend(*(id *)(a1 + 32), "loadSavedState");
}

- (void)loadSavedState
{
  void *v3;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *unlockCallbacks;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSDictionary *v34;
  NSDictionary *mandatoryUpdateDictionary;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUState unlockCallbacks](self->_state, "unlockCallbacks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUState unlockCallbacks](self->_state, "unlockCallbacks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
    unlockCallbacks = self->_unlockCallbacks;
    self->_unlockCallbacks = v5;

  }
  else
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = self->_unlockCallbacks;
    self->_unlockCallbacks = v7;
  }

  -[SUState installPolicy](self->_state, "installPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SUState installPolicy](self->_state, "installPolicy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagerCore setInstallPolicy:](self, "setInstallPolicy:", v9);

    -[SUManagerCore installPolicy](self, "installPolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SULogDebug(CFSTR("Found install policy: %@"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v10);
  }
  else
  {
    -[SUManagerCore installPolicy](self, "installPolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SULogDebug(CFSTR("No install policy saved, using default: %@"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)v10);
  }

  -[SUManagerCore updateInstallPolicyAutoUpdateEnabled:](self, "updateInstallPolicyAutoUpdateEnabled:", -[SUManagerCore isAutoUpdateEnabled](self, "isAutoUpdateEnabled"));
  -[SUManagerCore installPolicy](self, "installPolicy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("reset install policy to: %@"), v26, v27, v28, v29, v30, v31, v32, (uint64_t)v25);

  -[SUState mandatoryUpdateDict](self->_state, "mandatoryUpdateDict");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[SUState mandatoryUpdateDict](self->_state, "mandatoryUpdateDict");
    v34 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    mandatoryUpdateDictionary = self->_mandatoryUpdateDictionary;
    self->_mandatoryUpdateDictionary = v34;

  }
  -[SUState sessionID](self->_state, "sessionID");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[SUState sessionID](self->_state, "sessionID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagerCore setSessionID:](self, "setSessionID:", v37);

    -[SUManagerCore setPotentialNextSessionID:](self, "setPotentialNextSessionID:", 0);
    SULogInfo(CFSTR("loading saved sessionID: %@"), v38, v39, v40, v41, v42, v43, v44, (uint64_t)self->_sessionID);
  }
  else
  {
    -[SUManagerCore createSessionID](self, "createSessionID");
    -[SUState save](self->_state, "save");
  }
}

- (void)resumeOrResetIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;
  int v22;
  __CFString *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  char v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  void *v105;
  int v106;
  xpc_object_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  id WeakRetained;
  char v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  NSObject *workQueue;
  NSObject *v126;
  NSObject *v127;
  dispatch_time_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  __CFString *v136;
  uint64_t v137;
  uint64_t v138;
  const __CFString *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  char v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  _QWORD v151[5];
  id v152;
  _QWORD v153[5];
  _QWORD block[5];
  id v155;
  char v156;
  id v157;
  id v158[2];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUState lastProductBuild](self->_state, "lastProductBuild");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState lastProductVersion](self->_state, "lastProductVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState lastSplatRestoreVersion](self->_state, "lastSplatRestoreVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUState lastRollbackDescriptor](self->_state, "lastRollbackDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility currentProductType](SUUtility, "currentProductType");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility currentProductBuild](SUUtility, "currentProductBuild");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility currentProductVersion](SUUtility, "currentProductVersion");
  v7 = objc_claimAutoreleasedReturnValue();
  +[SUUtility currentReleaseType](SUUtility, "currentReleaseType");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEAEA48], "sharedDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "splatRestoreVersion");
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = 1;
  +[SUUtility setCacheable:](SUUtility, "setCacheable:", 1);
  +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:", self);

  v149 = (void *)v7;
  if (objc_msgSend(v4, "isEqualToString:", v7))
    v10 = objc_msgSend(v3, "isEqualToString:", v150) ^ 1;
  v12 = +[SUUtility compareRestoreVersion:withRestoreVersion:](SUUtility, "compareRestoreVersion:withRestoreVersion:", v5, v9);
  if (v12 == -1)
    v20 = v10;
  else
    v20 = 1;
  v146 = (void *)v9;
  if (v20 == 1)
  {
    if (v12 == 1)
      v21 = v10;
    else
      v21 = 1;
    if ((v21 & 1) != 0)
    {
      v22 = 1;
      goto LABEL_15;
    }
    v23 = CFSTR("Splat RestoreVersion decremented");
  }
  else
  {
    v23 = CFSTR("Splat RestoreVersion incremented");
  }
  v22 = v20 ^ 1;
  SULogInfo(v23, v13, v14, v15, v16, v17, v18, v19, v137);
LABEL_15:
  v143 = v22;
  v24 = v20 & v22 & (v10 ^ 1);
  -[SUState appliedTime](self->_state, "appliedTime");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    +[SUUtility bootTime](SUUtility, "bootTime");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "compare:", v32) != 1)
    {
      v50 = 0;
      goto LABEL_29;
    }
    v144 = v32;
    v141 = v6;
    -[SUState lastDownload](self->_state, "lastDownload");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "descriptor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "productVersion");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = v5;
    v37 = v4;
    v38 = v3;
    if ((objc_msgSend(v36, "isEqualToString:", v149) & 1) != 0)
    {
      objc_msgSend(v35, "productBuildVersion");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", v150);

      if (v40)
      {
        objc_msgSend(v35, "productVersion");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "productBuildVersion");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("Found update (%@.%@) applied at (%@) and then system reboot at (%@), considering as new OS"), v43, v44, v45, v46, v47, v48, v49, (uint64_t)v41);
        goto LABEL_26;
      }
    }
    else
    {

    }
    if (!v24)
    {
      v50 = 0;
      goto LABEL_28;
    }
    objc_msgSend(v35, "productVersion");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "productBuildVersion");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("Found update (%@.%@) applied at (%@) and then system reboot at (%@) to the previous OS (%@.%@), update was consumed, cleaning prior state"), v51, v52, v53, v54, v55, v56, v57, (uint64_t)v41);
LABEL_26:

    v50 = 1;
LABEL_28:
    v3 = v38;
    v4 = v37;
    v6 = v141;
    v5 = v142;

    v32 = v144;
LABEL_29:
    -[SUState setAppliedTime:](self->_state, "setAppliedTime:", 0);
    -[SUState save](self->_state, "save");

    if ((v50 & 1) == 0 && ((v24 ^ 1) & 1) == 0)
      goto LABEL_31;
    SULogInfo(CFSTR("New OS detected; resetting all prior state."), v25, v26, v27, v28, v29, v30, v31, v137);
    if (v50)
    {
      -[SUManagerCore reportOTASucceededEvent](self, "reportOTASucceededEvent");
      v66 = objc_alloc_init(MEMORY[0x24BEAE810]);
      v74 = v66;
      if (v66)
      {
        v75 = v32;
        v76 = v6;
        v158[0] = 0;
        v77 = objc_msgSend(v66, "cleanupNonInstalledDocumentationWithError:", v158);
        v78 = v158[0];
        v86 = v78;
        if ((v77 & 1) == 0)
          SULogInfo(CFSTR("Failed to clean up stashed documentation data: %@"), v79, v80, v81, v82, v83, v84, v85, (uint64_t)v78);

        v6 = v76;
        v32 = v75;
      }
      else
      {
        SULogInfo(CFSTR("Failed to init SUCoreDocumentationDataManager. Unable to clean up stashed documentation data"), v67, v68, v69, v70, v71, v72, v73, v138);
      }

    }
    goto LABEL_39;
  }
  if ((v24 & 1) != 0)
  {
LABEL_31:
    SULogInfo(CFSTR("Attempting to resume from last known state."), v25, v26, v27, v28, v29, v30, v31, v137);
    -[SUManagerCore _resumeFromLastKnownState](self, "_resumeFromLastKnownState");
    v65 = v146;
    goto LABEL_53;
  }
  SULogInfo(CFSTR("New OS detected; resetting all prior state."), v25, v26, v27, v28, v29, v30, v31, v137);
LABEL_39:
  v145 = v32;
  v87 = v6;
  -[SUManagerCore clearBadgeAndBanner](self, "clearBadgeAndBanner");
  -[SUManagerCore removeUnlockCallback:](self, "removeUnlockCallback:", CFSTR("unlockCallbackRecordDataForBrain"));
  SULogInfo(CFSTR("Removing previously stashed ControllerDataForBrain file"), v88, v89, v90, v91, v92, v93, v94, v138);
  v139 = CFSTR("Controller/ControllerDataForBrain.plist");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/MobileSoftwareUpdate/%@"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v96, "fileExistsAtPath:", v95))
  {
    v157 = 0;
    objc_msgSend(v96, "removeItemAtPath:error:", v95, &v157);
    v104 = v157;
    if (v104)
      SULogInfo(CFSTR("Failed to remove old controller data file at %@ : %@"), v97, v98, v99, v100, v101, v102, v103, (uint64_t)v95);
    else
      SULogInfo(CFSTR("Successfully removed old controller data file at %@"), v97, v98, v99, v100, v101, v102, v103, (uint64_t)v95);

  }
  -[SUManagerEngine activateLoadingPersisted:](self->_engine, "activateLoadingPersisted:", 0);
  +[SUUtility currentReleaseType](SUUtility, "currentReleaseType");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = objc_msgSend(v105, "isEqualToString:", CFSTR("Internal"));

  if (v106)
  {
    v107 = xpc_array_create(0, 0);
    xpc_array_set_string(v107, 0xFFFFFFFFFFFFFFFFLL, "basejumper.apple.com");
    xpc_array_set_string(v107, 0xFFFFFFFFFFFFFFFFLL, "cheeserolling.apple.com");
    xpc_array_set_string(v107, 0xFFFFFFFFFFFFFFFFLL, "gdmf-staging-int.apple.com");
    xpc_array_set_string(v107, 0xFFFFFFFFFFFFFFFFLL, "locksmith.apple.com");
    NEHelperSettingsSetArray();
    SULogInfo(CFSTR("Allowing basejumper.apple.com, cheeserolling.apple.com, gdmf-staging-int.apple.com and locksmith.apple.com to trigger VPN On Demand (when installed)"), v108, v109, v110, v111, v112, v113, v114, (uint64_t)v139);

  }
  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "cancelAllAutoInstallTasks");

  -[SUState setLastAutoInstallOperationModel:](self->_state, "setLastAutoInstallOperationModel:", 0);
  -[SUManagerCore clearUnlockCallbacks](self, "clearUnlockCallbacks");
  -[SUManagerCore setMandatoryUpdateDictionary:](self, "setMandatoryUpdateDictionary:", 0);
  -[SUManagerCore createSessionID](self, "createSessionID");
  -[SUManagerCore setPreferredLastScannedDescriptor:](self, "setPreferredLastScannedDescriptor:", 0);
  -[SUManagerCore setAlternateLastScannedDescriptor:](self, "setAlternateLastScannedDescriptor:", 0);
  -[SUState resetAllHistory](self->_state, "resetAllHistory");
  -[SUState setLastProductType:](self->_state, "setLastProductType:", v148);
  -[SUState setLastProductBuild:](self->_state, "setLastProductBuild:", v150);
  -[SUState setLastProductVersion:](self->_state, "setLastProductVersion:", v149);
  -[SUState setLastReleaseType:](self->_state, "setLastReleaseType:", v147);
  -[SUState setLastSplatRestoreVersion:](self->_state, "setLastSplatRestoreVersion:", v146);
  -[SUState setLastRecommendedUpdateVersion:](self->_state, "setLastRecommendedUpdateVersion:", 0);
  -[SUState setLastRecommendedUpdateInterval:](self->_state, "setLastRecommendedUpdateInterval:", 0);
  -[SUState setLastRecommendedUpdateDiscoveryDate:](self->_state, "setLastRecommendedUpdateDiscoveryDate:", 0);
  -[SUState save](self->_state, "save");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v117 = objc_opt_respondsToSelector();

  if ((v117 & 1) != 0)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__SUManagerCore_resumeOrResetIfNecessary__block_invoke;
    block[3] = &unk_24CE3C498;
    block[4] = self;
    v155 = v150;
    v156 = 0;
    dispatch_async(workQueue, block);

  }
  if ((v20 & 1) == 0)
  {
    v126 = self->_workQueue;
    v153[0] = MEMORY[0x24BDAC760];
    v153[1] = 3221225472;
    v153[2] = __41__SUManagerCore_resumeOrResetIfNecessary__block_invoke_2;
    v153[3] = &unk_24CE3B5C0;
    v153[4] = self;
    dispatch_async(v126, v153);
  }
  v6 = v87;
  if ((v143 & 1) == 0)
  {
    v127 = self->_workQueue;
    v151[0] = MEMORY[0x24BDAC760];
    v151[1] = 3221225472;
    v151[2] = __41__SUManagerCore_resumeOrResetIfNecessary__block_invoke_3;
    v151[3] = &unk_24CE3B610;
    v151[4] = self;
    v152 = v87;
    dispatch_async(v127, v151);
    +[SUUtility deleteKeepAliveFile](SUUtility, "deleteKeepAliveFile");

  }
  SULogInfo(CFSTR("State reset complete."), v118, v119, v120, v121, v122, v123, v124, (uint64_t)v139);

  v32 = v145;
  v65 = v146;
LABEL_53:
  SULogInfo(CFSTR("waiting %d seconds to resume from last known state"), v58, v59, v60, v61, v62, v63, v64, 2);
  v128 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_resumeFromStateSemaphore, v128))
    v136 = CFSTR("waiting for resume from last known state timed out, continue anyway");
  else
    v136 = CFSTR("done waiting for resume from last known state, continuing");
  SULogInfo(v136, v129, v130, v131, v132, v133, v134, v135, v140);

}

void __41__SUManagerCore_resumeOrResetIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "newOSDetected:deleteKeepAlive:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

void __41__SUManagerCore_resumeOrResetIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "splatUpdateDetected");

}

void __41__SUManagerCore_resumeOrResetIfNecessary__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "splatRollbackDetected:", *(_QWORD *)(a1 + 40));

}

- (void)_resumeFromLastKnownState
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __CFString *v44;
  SUManagerEngineDownloadDescriptor *v45;
  id v46;
  void *v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  int v68;
  SUManagerEngineDownloadDescriptor *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  int v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUState lastDownload](self->_state, "lastDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  if (!v4 || !objc_msgSend(v4, "isValidDownload"))
  {
    v13 = 0;
    v44 = CFSTR("No previous download recognized; cleaning up all software update assets.");
LABEL_8:
    SULogInfo(v44, v5, v6, v7, v8, v9, v10, v11, v78);
    -[SUManagerCore resetDownloadState](self, "resetDownloadState");
    -[SUManagerEngine activateLoadingPersisted:](self->_engine, "activateLoadingPersisted:", 0);
    v45 = 0;
    v87 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore coreDescriptorForSUDescriptor:](self, "coreDescriptorForSUDescriptor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "getMASoftwareUpdateAsset");
  v87 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v81 = v13;
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Found last download: %@ with descriptor: %@ and matching core descriptor: %@ with asset: %@"), v14, v15, v16, v17, v18, v19, v20, (uint64_t)v4);

  if (!v87)
  {
    v44 = CFSTR("No last asset found; cleaning up all software update assets.");
    goto LABEL_8;
  }
  objc_msgSend(v4, "downloadOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUDownloadPolicyFactory userDownloadPolicyForDescriptor:](SUDownloadPolicyFactory, "userDownloadPolicyForDescriptor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActiveDownloadPolicy:", v23);

  -[SUManagerCore downloader](self, "downloader");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDownload:", v4);

  -[SUManagerCore downloader](self, "downloader");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDownloadAsset:", v87);

  objc_msgSend(v4, "progress");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = objc_msgSend(v26, "isDone");

  v86 = v13;
  if (!(_DWORD)v23)
  {
    SULogInfo(CFSTR("Last known state indicates update was *not* downloaded and prepared. Unregistering unlock callback"), v27, v28, v29, v30, v31, v32, v33, v78);
    -[SUManagerCore removeUnlockCallback:](self, "removeUnlockCallback:", CFSTR("unlockCallbackRecordDataForBrain"));
    -[SUManagerCore setDownloading:](self, "setDownloading:", 1);
    -[SUManagerCore setResetDownloadStateOnCleanActivation:](self, "setResetDownloadStateOnCleanActivation:", 1);
    v46 = +[SUAssetSupport copyInstalledAssets](SUAssetSupport, "copyInstalledAssets");
    if (v46)
    {
      objc_msgSend(v87, "assetId");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v46, "containsObject:", v47);

      if ((v48 & 1) != 0)
      {
LABEL_13:
        SULogInfo(CFSTR("Asset is installed, but prepare was interrupted"), v49, v50, v51, v52, v53, v54, v55, v79);
        v56 = 4;
LABEL_17:
        v82 = v56;

        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(v4, "progress");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "phase");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(CFSTR("SUDownloadPhasePreparingForInstallation"), "isEqualToString:", v67);

      if (v68)
        goto LABEL_13;
    }
    v56 = 2;
    goto LABEL_17;
  }
  objc_msgSend(v4, "progress");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "phase");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(CFSTR("SUDownloadPhasePreparingForInstallation"), "isEqualToString:", v35);

  if (!v36)
  {
    objc_msgSend(v4, "progress");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "phase");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("Download progress is done, but phase is: %@"), v59, v60, v61, v62, v63, v64, v65, (uint64_t)v58);

    v82 = 0;
LABEL_18:
    v83 = 0;
    goto LABEL_19;
  }
  SULogInfo(CFSTR("Last known state indicates update prepared. Re-registering for RecordDataForBrain unlock callback"), v37, v38, v39, v40, v41, v42, v43, v78);
  -[SUManagerCore removeUnlockCallback:](self, "removeUnlockCallback:", CFSTR("unlockCallbackRecordDataForBrain"));
  -[SUManagerCore addUnlockCallback:forKey:](self, "addUnlockCallback:forKey:", sel__recordLastUnlockTimePostPrepare, CFSTR("unlockCallbackRecordDataForBrain"));
  v83 = 1;
  -[SUManagerCore setResetDownloadStateOnCleanActivation:](self, "setResetDownloadStateOnCleanActivation:", 1);
  v82 = 5;
LABEL_19:
  v69 = [SUManagerEngineDownloadDescriptor alloc];
  objc_msgSend(v4, "descriptor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "releaseDate");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v84, "copy");
  -[SUState sessionID](self->_state, "sessionID");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v71, "copy");
  -[SUState lastScannedDescriptorScanOptions](self->_state, "lastScannedDescriptorScanOptions");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend(v73, "copy");
  objc_msgSend(v4, "downloadOptions");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[SUManagerCore newInstallTonightConfig](self, "newInstallTonightConfig");
  v45 = -[SUManagerEngineDownloadDescriptor initWithAsset:releaseDate:sessionID:scanOptions:downloadOptions:installTonightConfig:coreDescriptor:downloadAtPhase:](v69, "initWithAsset:releaseDate:sessionID:scanOptions:downloadOptions:installTonightConfig:coreDescriptor:downloadAtPhase:", v87, v70, v72, v74, v75, v76, v86, v82, v81, v87);

  self->_reportStartedFromPersistedState = 1;
  -[SUManagerEngine activateLoadingPersisted:](self->_engine, "activateLoadingPersisted:", v45);
  if (v83)
  {
    -[SUManagerCore managedDeviceManager](self, "managedDeviceManager");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "refreshAssetAudience");

  }
  v13 = v86;
LABEL_9:

}

- (SUManagerDelegate)delegate
{
  return (SUManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SUManagerEngine)engine
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  return self->_engine;
}

- (SUManagedDeviceManager)managedDeviceManager
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  return self->_managedDeviceManager;
}

- (SUDDMManager)ddmManager
{
  void *v2;
  void *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  +[SUManagerServer sharedInstance](SUManagerServer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ddmManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUDDMManager *)v3;
}

- (SUState)state
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  return self->_state;
}

- (NSHashTable)observers
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  return self->_observers;
}

- (BOOL)isScanning
{
  void *v3;
  char v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isScanning");

  return v4;
}

- (BOOL)isDownloading
{
  void *v3;
  char v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDownloading");

  return v4;
}

- (BOOL)isUpdateDownloaded
{
  void *v3;
  char v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUpdateDownloaded");

  return v4;
}

- (void)setDownloading:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDownloading:", v3);

}

- (BOOL)isForeground
{
  void *v3;
  char v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isForeground");

  return v4;
}

- (void)setForeground:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForeground:", v3);

}

- (BOOL)isClearingSpace
{
  void *v3;
  char v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isClearingSpace");

  return v4;
}

- (BOOL)isInstalling
{
  void *v3;
  char v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore installer](self, "installer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInstalling");

  return v4;
}

- (BOOL)isInstalled
{
  void *v3;
  char v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore installer](self, "installer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInstalled");

  return v4;
}

- (BOOL)isInstallTonight
{
  void *v3;
  char v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore installer](self, "installer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInstallTonight");

  return v4;
}

- (void)setIsInstallTonight:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore installer](self, "installer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsInstallTonight:", v3);

}

- (BOOL)isInstallTonightScheduled
{
  void *v3;
  char v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore installer](self, "installer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInstallTonightScheduled");

  return v4;
}

- (void)setIsInstallTonightScheduled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore installer](self, "installer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsInstallTonightScheduled:", v3);

}

- (MAAsset)preferredAssetToDownloadFromLastScan
{
  void *v3;
  void *v4;
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLastScannedCoreDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getMASoftwareUpdateAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MAAsset *)v5;
}

- (MAAsset)alternateAssetToDownloadFromLastScan
{
  void *v3;
  void *v4;
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alternateLastScannedCoreDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getMASoftwareUpdateAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MAAsset *)v5;
}

- (SUCoreDescriptor)preferredLastScannedDescriptor
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLastScannedCoreDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUCoreDescriptor *)v4;
}

- (void)setPreferredLastScannedDescriptor:(id)a3
{
  NSObject *workQueue;
  id v5;
  id v6;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPreferredLastScannedCoreDescriptor:", v5);

}

- (SUCoreDescriptor)alternateLastScannedDescriptor
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alternateLastScannedCoreDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUCoreDescriptor *)v4;
}

- (void)setAlternateLastScannedDescriptor:(id)a3
{
  NSObject *workQueue;
  id v5;
  id v6;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlternateLastScannedCoreDescriptor:", v5);

}

- (id)discoveryDateForBuildVersion:(id)a3
{
  NSObject *workQueue;
  id v5;
  void *v6;
  void *v7;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "discoveryDateforBuildVersion:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)fullyUnrampedDateForBuildVersion:(id)a3
{
  NSObject *workQueue;
  id v5;
  void *v6;
  void *v7;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fullyUnrampedDateForBuildVersion:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (SUScanOptions)lastScannedDescriptorScanOptions
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastScannedDescriptorScanOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUScanOptions *)v4;
}

- (NSDate)lastStashbagPersistedDate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  return self->_lastStashbagPersistedDate;
}

- (void)setLastStashbagPersistedDate:(id)a3
{
  NSDate *v4;
  NSDate *lastStashbagPersistedDate;

  v4 = (NSDate *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  lastStashbagPersistedDate = self->_lastStashbagPersistedDate;
  self->_lastStashbagPersistedDate = v4;

}

- (SUAutoUpdatePasscodePolicy)passcodePolicy
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore installer](self, "installer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "passcodePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUAutoUpdatePasscodePolicy *)v4;
}

- (void)setPasscodePolicy:(id)a3
{
  NSObject *workQueue;
  id v5;
  id v6;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore installer](self, "installer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPasscodePolicy:", v5);

}

- (SUInstallPolicy)installPolicy
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore installer](self, "installer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "installPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SUInstallPolicy *)v4;
}

- (void)setInstallPolicy:(id)a3
{
  NSObject *workQueue;
  id v5;
  id v6;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore installer](self, "installer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInstallPolicy:", v5);

}

- (SUSFollowUpController)followUpController
{
  SUSFollowUpController *followUpController;
  SUSFollowUpController *v4;
  SUSFollowUpController *v5;

  followUpController = self->_followUpController;
  if (!followUpController)
  {
    +[SUSFollowUpController sharedController](SUSFollowUpController, "sharedController");
    v4 = (SUSFollowUpController *)objc_claimAutoreleasedReturnValue();
    v5 = self->_followUpController;
    self->_followUpController = v4;

    followUpController = self->_followUpController;
  }
  return followUpController;
}

- (void)_presentAutoUpdateBannerOnUnlock
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SUManagerCore__presentAutoUpdateBannerOnUnlock__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __49__SUManagerCore__presentAutoUpdateBannerOnUnlock__block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "removeUnlockCallback:", CFSTR("unlockCallbackPresentAutoUpdateBanner"));
  v2 = dispatch_time(0, 2000000000);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 120);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SUManagerCore__presentAutoUpdateBannerOnUnlock__block_invoke_2;
  block[3] = &unk_24CE3B5C0;
  block[4] = v3;
  dispatch_after(v2, v4, block);
}

uint64_t __49__SUManagerCore__presentAutoUpdateBannerOnUnlock__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentAutoUpdateBanner:", 0);
}

- (void)_recordLastUnlockTimePostPrepare
{
  dispatch_async((dispatch_queue_t)self->_workQueue, &__block_literal_global_20);
}

void __49__SUManagerCore__recordLastUnlockTimePostPrepare__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  id v18;

  v17 = CFSTR("Controller/ControllerDataForBrain.plist");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/MobileSoftwareUpdate/%@"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v0, "fileExistsAtPath:", v18)
    || (SULogInfo(CFSTR("Existing ControllerDataForBrain file found"), v1, v2, v3, v4, v5, v6, v7, (uint64_t)CFSTR("Controller/ControllerDataForBrain.plist")), objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfFile:", v18), (v8 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    SULogInfo(CFSTR("Existing ControllerDataForBrain file not found. Creating"), v1, v2, v3, v4, v5, v6, v7, (uint64_t)v17);
    v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("LastUnlockTimePostPrepare"));
  objc_msgSend(v8, "writeToFile:atomically:", v18, 1);
  SULogInfo(CFSTR("Wrote ControllerDataForBrain to disk %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v8);

}

- (void)_notifyEngineOnUnlock
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SUManagerCore__notifyEngineOnUnlock__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __38__SUManagerCore__notifyEngineOnUnlock__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "engine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "onUnlock");

}

- (void)doUnlockEvents
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  SEL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  SEL v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = self->_unlockCallbacks;
  v4 = -[NSMutableDictionary count](v3, "count");
  SULogInfo(CFSTR("callback count = %lu"), v5, v6, v7, v8, v9, v10, v11, v4);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[NSMutableDictionary allKeys](v3, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        -[NSMutableDictionary objectForKey:](v3, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v16));
        v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("selector string = %@"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)v17);
        if (v17)
        {
          v25 = NSSelectorFromString(v17);
          if (v25 && (v33 = v25, (objc_opt_respondsToSelector() & 1) != 0))
            -[SUManagerCore performSelector:](self, "performSelector:", v33);
          else
            SULogInfo(CFSTR("Unknown selector %@ for SUManagerCore"), v26, v27, v28, v29, v30, v31, v32, (uint64_t)v17);
        }

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v14);
  }

}

- (void)addUnlockCallback:(SEL)a3 forKey:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  uint64_t v24;
  id v25;

  v25 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!a3)
  {
    v23 = CFSTR("Cannot add unlock callback with nil selector");
LABEL_8:
    SULogInfo(v23, v6, v7, v8, v9, v10, v11, v12, v24);
    goto LABEL_9;
  }
  if (!v25)
  {
    v23 = CFSTR("Cannot add unlock callbakc with nil unlockCallbackKey");
    goto LABEL_8;
  }
  NSStringFromSelector(a3);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v23 = CFSTR("Failed to create NSString from selector");
    goto LABEL_8;
  }
  v14 = (void *)v13;
  SULogInfo(CFSTR("Adding unlock callback %@ for key %@"), v6, v7, v8, v9, v10, v11, v12, v13);
  -[NSMutableDictionary setObject:forKey:](self->_unlockCallbacks, "setObject:forKey:", v14, v25);
  v15 = -[NSMutableDictionary count](self->_unlockCallbacks, "count");
  SULogInfo(CFSTR("unlock callback count = %lu"), v16, v17, v18, v19, v20, v21, v22, v15);
  -[SUState setUnlockCallbacks:](self->_state, "setUnlockCallbacks:", self->_unlockCallbacks);
  -[SUState save](self->_state, "save");

LABEL_9:
}

- (void)removeUnlockCallback:(id)a3
{
  NSObject *workQueue;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  SULogInfo(CFSTR("removing unlock callback for key %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  -[NSMutableDictionary removeObjectForKey:](self->_unlockCallbacks, "removeObjectForKey:", v5);

  v13 = -[NSMutableDictionary count](self->_unlockCallbacks, "count");
  SULogInfo(CFSTR("unlock callback count = %lu"), v14, v15, v16, v17, v18, v19, v20, v13);
  -[SUState setUnlockCallbacks:](self->_state, "setUnlockCallbacks:", self->_unlockCallbacks);
  -[SUState save](self->_state, "save");
}

- (void)clearUnlockCallbacks
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  SULogInfo(CFSTR("Clearing unlock callbacks"), v3, v4, v5, v6, v7, v8, v9, v10);
  -[NSMutableDictionary removeAllObjects](self->_unlockCallbacks, "removeAllObjects");
  -[SUState setUnlockCallbacks:](self->_state, "setUnlockCallbacks:", self->_unlockCallbacks);
  -[SUState save](self->_state, "save");
}

- (void)createSessionID
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore setSessionID:](self, "setSessionID:", v4);

  -[SUState setSessionID:](self->_state, "setSessionID:", self->_sessionID);
  -[SUManagerCore setPotentialNextSessionID:](self, "setPotentialNextSessionID:", 0);
  SULogInfo(CFSTR("Created new sessionID: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)self->_sessionID);
}

- (id)createpotentialNextSessionID
{
  uint64_t v3;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v31;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (self->_sessionID
    || (SULogInfo(CFSTR("Creating potentialNextSessionID when no sessionID"), v3, v4, v5, v6, v7, v8, v9, v31),
        -[SUManagerCore createSessionID](self, "createSessionID"),
        -[SUState save](self->_state, "save"),
        self->_sessionID))
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v11, "length") < 4 || -[NSString length](self->_sessionID, "length") < 4)
    {
      -[SUManagerCore setPotentialNextSessionID:](self, "setPotentialNextSessionID:", v11);
    }
    else
    {
      objc_msgSend(v11, "substringWithRange:", 0, objc_msgSend(v11, "length") - 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "overrideScanSessionIDRampingPortion");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        SULogInfo(CFSTR("The ramping portion is set to %@ by default"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)v14);
      }
      else
      {
        -[NSString substringWithRange:](self->_sessionID, "substringWithRange:", -[NSString length](self->_sessionID, "length") - 3, 3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@%@"), v12, v14);
      -[SUManagerCore setPotentialNextSessionID:](self, "setPotentialNextSessionID:", v29);

    }
    SULogInfo(CFSTR("Created new potentialNextSessionID: %@"), v22, v23, v24, v25, v26, v27, v28, (uint64_t)self->_potentialNextSessionID);

  }
  return self->_potentialNextSessionID;
}

- (void)adoptPotentialSessionID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore setSessionID:](self, "setSessionID:", self->_potentialNextSessionID);
  -[SUState setSessionID:](self->_state, "setSessionID:", self->_sessionID);
  -[SUManagerCore setPotentialNextSessionID:](self, "setPotentialNextSessionID:", 0);
  SULogInfo(CFSTR("Adopted potentialNextSessionID as new sessionID: %@"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)self->_sessionID);
}

- (NSString)sessionID
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  return self->_sessionID;
}

- (BOOL)isAutoUpdateEnabled
{
  SUManagerCore *v2;
  void *v3;
  void *v4;

  v2 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUState lastDownload](v2->_state, "lastDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[SUManagerCore isDescriptorAutoUpdatable:](v2, "isDescriptorAutoUpdatable:", v4);

  return (char)v2;
}

- (BOOL)isDescriptorAutoDownloadable:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __CFString *v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v34;

  v11 = a3;
  if (!v11)
  {
    v24 = CFSTR("nil update is not auto downloadable");
    goto LABEL_10;
  }
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "autoDownloadDeletedBuild");

  if ((v13 & 1) != 0)
  {
LABEL_8:
    if (!objc_msgSend(v11, "rampEnabled"))
    {
      if (objc_msgSend(v11, "updateType") == 4)
      {
        -[SUState rolledBackBuildVersions](self->_state, "rolledBackBuildVersions");
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;
          objc_msgSend(v11, "productBuildVersion");
          v28 = objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            v29 = (void *)v28;
            -[SUState rolledBackBuildVersions](self->_state, "rolledBackBuildVersions");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "productBuildVersion");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v30, "containsObject:", v31);

            if (v32)
            {
              v24 = CFSTR("Update not auto downloadable because it was rolled back");
              goto LABEL_10;
            }
          }
          else
          {

          }
        }
      }
      v25 = 1;
      goto LABEL_19;
    }
    v24 = CFSTR("Update not auto downloadable because ramp=YES");
LABEL_10:
    SULogInfo(v24, v4, v5, v6, v7, v8, v9, v10, v34);
    goto LABEL_11;
  }
  -[SUState lastDeletedSUAssetID](self->_state, "lastDeletedSUAssetID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14
    || (objc_msgSend(v11, "assetID"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "isEqualToString:", v14),
        v15,
        !v16))
  {

    goto LABEL_8;
  }
  SULogInfo(CFSTR("Update not auto downloadable because it was previously deleted by the user"), v17, v18, v19, v20, v21, v22, v23, v34);

LABEL_11:
  v25 = 0;
LABEL_19:

  return v25;
}

- (BOOL)isDescriptorAutoUpdatable:(id)a3
{
  id v4;
  char v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  char v12;
  uint64_t v13;
  void *v14;
  int v15;
  char v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = objc_msgSend(v4, "autoUpdateEnabled");
  if (objc_msgSend(v4, "updateType") != 4)
  {
    v13 = objc_msgSend(v4, "upgradeType");
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isAutomaticUpdateV2Enabled");

    if (v13 == 1)
      v16 = v5;
    else
      v16 = 0;
    if (v15)
      v17 = v16;
    else
      v17 = 0;
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "autoUpdateForceOn");

    if ((v19 & 1) == 0)
    {
      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "autoUpdateForceOff");

      v12 = v17 & ~v21;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "autoInstallSecurityResponse");

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "autoInstallSecurityResponseForceOn");

  if ((v9 & 1) != 0)
  {
LABEL_11:
    v12 = 1;
    goto LABEL_13;
  }
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "autoInstallSecurityResponseForceOff");

  v12 = v7 & ~v11 & v5;
LABEL_13:

  return v12;
}

- (void)_loadBrainOnUnlockCallback
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUManagerCore__loadBrainOnUnlockCallback__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __43__SUManagerCore__loadBrainOnUnlockCallback__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "downloader");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_loadBrainOnUnlockCallback");

}

- (void)loadBrainOnUnlock
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore updateToAutoDownload](self, "updateToAutoDownload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadBrainOnUnlockForDescriptor:", v3);

}

- (void)tryAutodownload
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tryAutodownload");

}

- (void)noteAutodownloadFailedToStartWithError:(id)a3
{
  NSObject *workQueue;
  id v5;
  id v6;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteAutodownloadFailedToStartWithError:", v5);

}

- (void)endAutodownloadTasksAndResetState
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endAutodownloadTasksAndResetState");

}

- (void)scanForUpdates:(id)a3 complete:(id)a4
{
  NSObject *workQueue;
  id v7;
  id v8;
  id v9;

  workQueue = self->_workQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scanForUpdates:complete:", v8, v7);

}

- (void)scanForUpdates:(id)a3 shouldUseDDMInState:(BOOL)a4 complete:(id)a5
{
  _BOOL8 v5;
  NSObject *workQueue;
  id v9;
  id v10;
  id v11;

  v5 = a4;
  workQueue = self->_workQueue;
  v9 = a5;
  v10 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scanForUpdates:shouldUseDDMInState:complete:", v10, v5, v9);

}

- (void)autoScanAndDownloadIfAvailable:(int)a3 withResult:(id)a4
{
  uint64_t v4;
  NSObject *workQueue;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  workQueue = self->_workQueue;
  v7 = a4;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "autoScanAndDownloadIfAvailable:withResult:", v4, v7);

}

- (void)autoScanAndDownloadIfAvailable:(int)a3 downloadNow:(BOOL)a4 withResult:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  NSObject *workQueue;
  id v9;
  id v10;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  workQueue = self->_workQueue;
  v9 = a5;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "autoScanAndDownloadIfAvailable:downloadNow:withResult:", v6, v5, v9);

}

- (void)autoUpdateFound:(id)a3 downloadNow:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *workQueue;
  id v7;
  id v8;

  v4 = a4;
  workQueue = self->_workQueue;
  v7 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "autoUpdateFound:downloadNow:", v7, v4);

}

- (void)revokedUpdateFound:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  SURollbackSuggestionInfo *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  SULogInfo(CFSTR("Revoked update found: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  objc_msgSend(v4, "productBuildVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v13 = -[SUManagerCore shouldShowRollbackSuggestionAlert:error:](self, "shouldShowRollbackSuggestionAlert:error:", v12, &v19);

  if (v13)
  {
    v14 = objc_alloc_init(SURollbackSuggestionInfo);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackSuggestionInfo setClientIdentifier:](v14, "setClientIdentifier:", v16);

    -[SURollbackSuggestionInfo setSuggestionReason:](v14, "setSuggestionReason:", 2);
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "restoreVersion");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSuggestedRollbackSplatVersion:", v18);

    -[SUManagerCore presentRollbackSuggestionFollowUpWithCoreDescriptor:info:](self, "presentRollbackSuggestionFollowUpWithCoreDescriptor:info:", v4, v14);
  }

}

- (void)suggestRollback:(id)a3 rollbackDescriptor:(id)a4 withResult:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  SULogInfo(CFSTR("Rollback recommended. Info: %@ \nRollback Descriptor: %@"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v8);
  objc_msgSend(v9, "productBuildVersion");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v19 = -[SUManagerCore shouldShowRollbackSuggestionAlert:error:](self, "shouldShowRollbackSuggestionAlert:error:", v18, &v23);
  v20 = v23;

  if (v19)
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "restoreVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSuggestedRollbackSplatVersion:", v22);

    -[SUManagerCore presentRollbackSuggestionFollowUpWithRollbackDescriptor:info:](self, "presentRollbackSuggestionFollowUpWithRollbackDescriptor:info:", v9, v8);
    if (v10)
      v10[2](v10, 1, 0);
  }
  else if (v10)
  {
    ((void (**)(id, uint64_t, id))v10)[2](v10, 0, v20);
  }

}

- (BOOL)shouldShowRollbackSuggestionAlert:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  char v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v36;
  id v37;

  v6 = a3;
  v37 = 0;
  v7 = -[SUManagerCore isSplatRollbackAllowed:](self, "isSplatRollbackAllowed:", &v37);
  v8 = v37;
  v16 = v8;
  if (!v7)
  {
    SULogInfo(CFSTR("Rollback not allowed. Ignoring revoked update: %@"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);
    if (a4)
    {
      v24 = objc_retainAutorelease(v16);
      goto LABEL_7;
    }
LABEL_8:
    v25 = 0;
    goto LABEL_13;
  }
  if (+[SUUtility isLockdownModeEnabled](SUUtility, "isLockdownModeEnabled"))
  {
    SULogInfo(CFSTR("Device is in Lockdown Mode. Ignoring revoked update"), v17, v18, v19, v20, v21, v22, v23, v36);
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 101, 0);
      v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v25 = 0;
      *a4 = v24;
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  -[SUState lastRollbackRecommendedBuildVersion](self->_state, "lastRollbackRecommendedBuildVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v26, "isEqualToString:", v6);
  if (v34)
  {
    SULogInfo(CFSTR("Rollback already recommended for %@, skipping follow-up"), v27, v28, v29, v30, v31, v32, v33, (uint64_t)v6);
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 100, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v25 = v34 ^ 1;

LABEL_13:
  return v25;
}

- (void)presentRollbackSuggestionFollowUpWithCoreDescriptor:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore presentRollbackSuggestionAlertWithDescriptor:info:](self, "presentRollbackSuggestionAlertWithDescriptor:info:", v8, v6);
  -[SUManagerCore reportRSRRollbackSuggestedEventWithDescriptor:rollbackSuggestionInfo:](self, "reportRSRRollbackSuggestedEventWithDescriptor:rollbackSuggestionInfo:", v7, v6);

}

- (void)presentRollbackSuggestionFollowUpWithRollbackDescriptor:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  +[SUManagerEngine SUDescriptorFromRollbackDescriptor:](SUManagerEngine, "SUDescriptorFromRollbackDescriptor:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore presentRollbackSuggestionAlertWithDescriptor:info:](self, "presentRollbackSuggestionAlertWithDescriptor:info:", v8, v6);
  -[SUManagerCore reportRSRRollbackSuggestedEventWithRollbackDescriptor:rollbackSuggestionInfo:](self, "reportRSRRollbackSuggestedEventWithRollbackDescriptor:rollbackSuggestionInfo:", v7, v6);

}

- (void)presentRollbackSuggestionAlertWithDescriptor:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SUState *state;
  void *v20;
  uint64_t v21;
  _QWORD block[5];
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  -[SUManagerCore delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SUManagerCore externWorkQueue](self, "externWorkQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__SUManagerCore_presentRollbackSuggestionAlertWithDescriptor_info___block_invoke;
    block[3] = &unk_24CE3BB38;
    block[4] = self;
    v23 = v6;
    v24 = v7;
    dispatch_async(v10, block);

  }
  objc_msgSend(v6, "productBuildVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    state = self->_state;
    objc_msgSend(v6, "productBuildVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUState setLastRollbackRecommendedBuildVersion:](state, "setLastRollbackRecommendedBuildVersion:", v20);

    -[SUState save](self->_state, "save");
  }
  else
  {
    SULogInfo(CFSTR("Warning: revoked update has no build version"), v12, v13, v14, v15, v16, v17, v18, v21);
  }

}

void __67__SUManagerCore_presentRollbackSuggestionAlertWithDescriptor_info___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackSuggested:info:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (id)coreDescriptorForSUDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  _BOOL4 v11;
  id v12;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLastScannedCoreDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerCore scanner](self, "scanner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "alternateLastScannedCoreDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (v9 = +[SUManagerEngine SUDescriptor:matchesSUCoreDescriptor:comparisonFlags:](SUManagerEngine, "SUDescriptor:matchesSUCoreDescriptor:comparisonFlags:", v4, v6, 1), v10 = v6, v9)|| v8&& (v11 = +[SUManagerEngine SUDescriptor:matchesSUCoreDescriptor:comparisonFlags:](SUManagerEngine, "SUDescriptor:matchesSUCoreDescriptor:comparisonFlags:", v4, v8, 1), v10 = v8, v11))
  {
    v12 = v10;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)unscheduleRecommendedUpdateNotification
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unscheduleRecommendedUpdateNotification");

}

- (void)startDownloadWithMetadata:(id)a3 withResult:(id)a4
{
  NSObject *workQueue;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  SUScanResults *v12;
  SUDownloadOptions *v13;
  void *v14;
  SUDownloadOptions *v15;
  id v16;

  workQueue = self->_workQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore preferredLastScannedDescriptor](self, "preferredLastScannedDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[SUManagerCore alternateLastScannedDescriptor](self, "alternateLastScannedDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SUScanResults initWithPreferredDescriptor:alternateDescriptor:]([SUScanResults alloc], "initWithPreferredDescriptor:alternateDescriptor:", v16, v11);
  v13 = [SUDownloadOptions alloc];
  -[SUScanResults latestUpdate](v12, "latestUpdate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SUDownloadOptions initWithMetadata:andDescriptor:](v13, "initWithMetadata:andDescriptor:", v8, v14);

  -[SUManagerCore startDownloadWithOptions:withResult:](self, "startDownloadWithOptions:withResult:", v15, v7);
}

- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  workQueue = self->_workQueue;
  v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEAE8C0], "UTF8String"));
  -[SUManagerCore downloader](self, "downloader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__SUManagerCore_startDownloadWithOptions_withResult___block_invoke;
  v11[3] = &unk_24CE3D950;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "startDownloadWithOptions:withResult:", v8, v11);

}

void __53__SUManagerCore_startDownloadWithOptions_withResult___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 128);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__SUManagerCore_startDownloadWithOptions_withResult___block_invoke_2;
    block[3] = &unk_24CE3BC40;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

uint64_t __53__SUManagerCore_startDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)updateDownloadOptions:(id)a3 withResult:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  void *v9;
  char v10;
  id v11;
  NSObject *externWorkQueue;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;
  id v17;

  v6 = a4;
  workQueue = self->_workQueue;
  v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v10 = objc_msgSend(v9, "updateDownloadOptions:error:", v8, &v17);

  v11 = v17;
  if (v6)
  {
    externWorkQueue = self->_externWorkQueue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __50__SUManagerCore_updateDownloadOptions_withResult___block_invoke;
    v13[3] = &unk_24CE3BC40;
    v15 = v6;
    v16 = v10;
    v14 = v11;
    dispatch_async(externWorkQueue, v13);

  }
}

uint64_t __50__SUManagerCore_updateDownloadOptions_withResult___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL8 v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  SUSpacePurgeOptions *v38;
  uint64_t v39;
  id v40;
  id v41;
  SUSpacePurgeOptions *v42;
  uint64_t v43;
  void *v44;
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  SUSpacePurgeOptions *v50;
  id v51;
  id v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[3];
  char v58;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 3, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptor");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "descriptor");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v19)
    {
      v22 = v20 != 0;
      v23 = 1;
    }
    else
    {
      v44 = v18;
      -[SUManagerCore scanner](self, "scanner");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "preferredLastScannedCoreDescriptor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v25);
      v19 = objc_claimAutoreleasedReturnValue();

      -[SUManagerCore scanner](self, "scanner");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "alternateLastScannedCoreDescriptor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v27);
      v28 = objc_claimAutoreleasedReturnValue();

      v23 = v19 != 0;
      v22 = v28 != 0;
      if (!(v19 | v28))
      {
        v18 = v44;
        (*((void (**)(id, _QWORD, _QWORD, void *, void *))v10 + 2))(v10, 0, 0, v44, v44);
        goto LABEL_19;
      }
      v21 = (void *)v28;
      v18 = v44;
    }
    if (!-[SUManagerCore isDownloading](self, "isDownloading"))
    {
      v57[0] = 0;
      v57[1] = v57;
      v57[2] = 0x2020000000;
      v58 = 0;
      v55[0] = 0;
      v55[1] = v55;
      v55[2] = 0x3032000000;
      v55[3] = __Block_byref_object_copy__18;
      v55[4] = __Block_byref_object_dispose__18;
      v56 = 0;
      v38 = objc_alloc_init(SUSpacePurgeOptions);
      -[SUSpacePurgeOptions setCompletionQueue:](v38, "setCompletionQueue:", self->_workQueue);
      -[SUSpacePurgeOptions setNeededBytes:](v38, "setNeededBytes:", +[SUUtility totalDiskSpaceForUpdate:](SUUtility, "totalDiskSpaceForUpdate:", v19));
      -[SUSpacePurgeOptions setEnableCacheDelete:](v38, "setEnableCacheDelete:", 1);
      if ((objc_msgSend(v8, "isAutoDownload") & 1) != 0)
        v39 = 0;
      else
        v39 = objc_msgSend(v8, "isAppOffloadEnabled");
      -[SUSpacePurgeOptions setEnableAppOffload:](v38, "setEnableAppOffload:", v39);
      -[SUSpacePurgeOptions setCacheDeleteUrgency:](v38, "setCacheDeleteUrgency:", 4);
      -[SUSpacePurgeOptions setAppOffloadUrgency:](v38, "setAppOffloadUrgency:", 4);
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke;
      v45[3] = &unk_24CE3E1E0;
      v54 = v55;
      v53 = v57;
      v45[4] = self;
      v40 = (id)v19;
      v46 = v40;
      v47 = v8;
      v41 = v21;
      v48 = v41;
      v49 = v9;
      v42 = v38;
      v50 = v42;
      v52 = v10;
      v51 = v18;
      +[SUSpace hasSufficientSpaceWithOptions:withCompletion:](SUSpace, "hasSufficientSpaceWithOptions:withCompletion:", v42, v45);

      _Block_object_dispose(v55, 8);
      _Block_object_dispose(v57, 8);

      goto LABEL_19;
    }
    SULogInfo(CFSTR("Not performing space check since there is an in-progress download"), v29, v30, v31, v32, v33, v34, v35, v43);
    if (v23)
    {
      v36 = 0;
      if (!v22)
      {
LABEL_10:
        v37 = v18;
LABEL_15:
        (*((void (**)(id, _BOOL8, _BOOL8, id, id))v10 + 2))(v10, v23, v22, v36, v37);

LABEL_19:
        goto LABEL_20;
      }
    }
    else
    {
      v36 = v18;
      if (!v22)
        goto LABEL_10;
    }
    v37 = 0;
    goto LABEL_15;
  }
  SULogError(CFSTR("%s: no reply handler, do nothing"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[SUManagerCore updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:]");
LABEL_20:

}

void __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD *v29;
  __int128 v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[3];
  char v34;
  _QWORD block[5];
  id v36;
  _QWORD v37[5];
  id v38;
  id v39;

  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = objc_msgSend(v5, "hasSufficientFreeSpace");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), a3);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v9 = *(_QWORD *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (!v9)
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v39 = 0;
      v13 = objc_msgSend(v10, "_isUpdateDownloadable:downloadOptions:error:", v11, v12, &v39);
      objc_storeStrong(v8, v39);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v13;
    }
  }
  if (objc_msgSend(v5, "hasSufficientFreeSpace"))
  {
    v37[0] = MEMORY[0x24BDAC760];
    v37[2] = __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_2;
    v37[3] = &unk_24CE3B610;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v16 = *(NSObject **)(v14 + 120);
    v37[1] = 3221225472;
    v37[4] = v14;
    v17 = &v38;
    v38 = v15;
    v18 = v37;
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 48), "isAutoDownload"))
      goto LABEL_9;
    block[0] = MEMORY[0x24BDAC760];
    block[2] = __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_3;
    block[3] = &unk_24CE3B610;
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(a1 + 40);
    v16 = *(NSObject **)(v19 + 120);
    block[1] = 3221225472;
    block[4] = v19;
    v17 = &v36;
    v36 = v20;
    v18 = block;
  }
  dispatch_async(v16, v18);

LABEL_9:
  if (*(_QWORD *)(a1 + 56))
  {
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v34 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__18;
    v31[4] = __Block_byref_object_dispose__18;
    v32 = 0;
    v21 = *(id *)(a1 + 64);
    if (!v21)
      v21 = *(id *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 72), "setNeededBytes:", +[SUUtility totalDiskSpaceForUpdate:](SUUtility, "totalDiskSpaceForUpdate:", *(_QWORD *)(a1 + 56)));
    objc_msgSend(*(id *)(a1 + 72), "setEnableAppOffload:", objc_msgSend(v21, "isAutoDownload") ^ 1);
    objc_msgSend(*(id *)(a1 + 72), "setCacheDeleteUrgency:", 4);
    v22 = *(_QWORD *)(a1 + 72);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_4;
    v24[3] = &unk_24CE3E1B8;
    v28 = v33;
    v29 = v31;
    v24[4] = *(_QWORD *)(a1 + 32);
    v25 = *(id *)(a1 + 56);
    v23 = v21;
    v26 = v23;
    v27 = *(id *)(a1 + 88);
    v30 = *(_OWORD *)(a1 + 96);
    +[SUSpace hasSufficientSpaceWithOptions:withCompletion:](SUSpace, "hasSufficientSpaceWithOptions:withCompletion:", v22, v24);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  }

}

uint64_t __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissInsufficientDiskSpaceFollowupForUpdate:orForce:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDownloading");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isUpdateDownloaded");
    if ((result & 1) == 0)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "isInstalling");
      if ((result & 1) == 0)
        return objc_msgSend(*(id *)(a1 + 32), "showInsufficientDiskSpaceFollowupForUpdate:", *(_QWORD *)(a1 + 40));
    }
  }
  return result;
}

void __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id obj;

  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = objc_msgSend(v5, "hasSufficientFreeSpace");
  objc_storeStrong((id *)(*(_QWORD *)(a1[9] + 8) + 40), a3);
  if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    v7 = *(_QWORD *)(a1[9] + 8);
    v9 = *(_QWORD *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (!v9)
    {
      v10 = (void *)a1[4];
      v11 = a1[5];
      v12 = a1[6];
      obj = 0;
      v13 = objc_msgSend(v10, "_isUpdateDownloadable:downloadOptions:error:", v11, v12, &obj);
      objc_storeStrong(v8, obj);
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v13;
    }
  }
  if (objc_msgSend(v5, "hasSufficientFreeSpace"))
  {
    v14 = a1[4];
    v15 = (void *)a1[5];
    v16 = *(NSObject **)(v14 + 120);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_5;
    block[3] = &unk_24CE3B610;
    block[4] = v14;
    v18 = v15;
    dispatch_async(v16, block);

  }
  (*(void (**)(void))(a1[7] + 16))();

}

uint64_t __86__SUManagerCore_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissInsufficientDiskSpaceFollowupForUpdate:orForce:", *(_QWORD *)(a1 + 40), 0);
}

- (BOOL)_isUpdateDownloadable:(id)a3 downloadOptions:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t v13;

  v13 = 0;
  v7 = a4;
  v8 = a3;
  +[SUDownloadPolicyFactory userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:](SUDownloadPolicyFactory, "userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:", v8, 0, objc_msgSend(v7, "allowUnrestrictedCellularDownload"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "downloadFeeAgreementStatus");
  objc_msgSend(v9, "setCellularFeeAgreementStatus:", v10);
  v11 = objc_msgSend(v9, "isDownloadableForCurrentNetworkConditions:cellularFeesApply:", &v13, 0);
  if (a5 && v13)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), v13, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 descriptor:(id)a4 replyHandler:(id)a5
{
  -[SUManagerCore deviceHasSufficientSpaceForDownloadIncludeAppPurging:descriptor:downloadOption:replyHandler:](self, "deviceHasSufficientSpaceForDownloadIncludeAppPurging:descriptor:downloadOption:replyHandler:", a3, a4, 0, a5);
}

- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 descriptor:(id)a4 downloadOption:(id)a5 replyHandler:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  SUSpacePurgeOptions *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v10)
  {
    v13 = objc_alloc_init(SUSpacePurgeOptions);
    -[SUSpacePurgeOptions setCompletionQueue:](v13, "setCompletionQueue:", self->_workQueue);
    -[SUSpacePurgeOptions setNeededBytes:](v13, "setNeededBytes:", +[SUUtility totalDiskSpaceForUpdate:](SUUtility, "totalDiskSpaceForUpdate:", v10));
    -[SUSpacePurgeOptions setEnableCacheDelete:](v13, "setEnableCacheDelete:", 1);
    if (v8)
      v14 = objc_msgSend(v11, "isAppOffloadEnabled");
    else
      v14 = 0;
    -[SUSpacePurgeOptions setEnableAppOffload:](v13, "setEnableAppOffload:", v14);
    -[SUSpacePurgeOptions setCacheDeleteUrgency:](v13, "setCacheDeleteUrgency:", 4);
    -[SUSpacePurgeOptions setAppOffloadUrgency:](v13, "setAppOffloadUrgency:", 4);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke;
    v15[3] = &unk_24CE3E208;
    v15[4] = self;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    +[SUSpace hasSufficientSpaceWithOptions:withCompletion:](SUSpace, "hasSufficientSpaceWithOptions:withCompletion:", v13, v15);

    goto LABEL_8;
  }
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 3, 0);
    v13 = (SUSpacePurgeOptions *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, SUSpacePurgeOptions *))v12 + 2))(v12, 0, &unk_24CE6E130, v13);
LABEL_8:

  }
}

void __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD block[5];
  id v25;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "hasSufficientFreeSpace");
  if (v6 && (v7 & 1) == 0)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 120);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke_2;
    block[3] = &unk_24CE3B610;
    block[4] = v8;
    v25 = v6;
    dispatch_async(v9, block);

  }
  if (objc_msgSend(v5, "hasSufficientFreeSpace"))
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[2] = __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke_3;
    v22[3] = &unk_24CE3B610;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v12 = *(NSObject **)(v10 + 120);
    v22[1] = 3221225472;
    v22[4] = v10;
    v13 = &v23;
    v23 = v11;
    v14 = v22;
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 48), "isAutoDownload"))
      goto LABEL_9;
    v20[0] = MEMORY[0x24BDAC760];
    v20[2] = __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke_4;
    v20[3] = &unk_24CE3B610;
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    v12 = *(NSObject **)(v15 + 120);
    v20[1] = 3221225472;
    v20[4] = v15;
    v13 = &v21;
    v21 = v16;
    v14 = v20;
  }
  dispatch_async(v12, v14);

LABEL_9:
  v17 = *(_QWORD *)(a1 + 56);
  if (v17)
  {
    v18 = objc_msgSend(v5, "hasSufficientFreeSpace");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v5, "additionalBytesRequired"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *, id))(v17 + 16))(v17, v18, v19, v6);

  }
}

void __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *MEMORY[0x24BEAEAD0];
  objc_msgSend(v2, "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reportPostponedEvent:withStatus:withAdditionalMetrics:", v2, v3, v4);

}

uint64_t __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissInsufficientDiskSpaceFollowupForUpdate:orForce:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __109__SUManagerCore_deviceHasSufficientSpaceForDownloadIncludeAppPurging_descriptor_downloadOption_replyHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDownloading");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isUpdateDownloaded");
    if ((result & 1) == 0)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "isInstalling");
      if ((result & 1) == 0)
        return objc_msgSend(*(id *)(a1 + 32), "showInsufficientDiskSpaceFollowupForUpdate:", *(_QWORD *)(a1 + 40));
    }
  }
  return result;
}

- (void)updateDownloadMetadata:(id)a3 withResult:(id)a4
{
  NSObject *workQueue;
  id v7;
  id v8;
  SUDownloadOptions *v9;
  void *v10;
  void *v11;
  SUDownloadOptions *v12;

  workQueue = self->_workQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  v9 = [SUDownloadOptions alloc];
  -[SUManagerCore download](self, "download");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "descriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SUDownloadOptions initWithMetadata:andDescriptor:](v9, "initWithMetadata:andDescriptor:", v8, v11);

  -[SUManagerCore updateDownloadOptions:withResult:](self, "updateDownloadOptions:withResult:", v12, v7);
}

- (void)sendDownloadInvalidatedForNewDescriptors:(id)a3
{
  NSObject *workQueue;
  id v5;
  id v6;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendDownloadInvalidatedForNewDescriptors:", v5);

}

- (id)download
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "download");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)downloadAsset
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)deviceIsUpToDateForSU:(BOOL)a3 forSplat:(BOOL)a4
{
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  id v17;
  uint64_t v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSplatDownload");

  if (!v8)
  {
    if (!a3)
    {
      v16 = CFSTR("Got up to date report but not for current SU download, keeping it");
      goto LABEL_7;
    }
LABEL_5:
    -[SUManagerCore clearBadgeAndBanner](self, "clearBadgeAndBanner");
    -[SUManagerCore downloader](self, "downloader");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deviceIsUpToDate");

    return;
  }
  if (a4)
    goto LABEL_5;
  v16 = CFSTR("Got up to date report but not for current Splat download, keeping it");
LABEL_7:
  SULogInfo(v16, v9, v10, v11, v12, v13, v14, v15, v18);
}

- (BOOL)cancelDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v11, "cancelDownload:userRequested:keepDocAssets:error:", v9, v8, v7, a6);

  return (char)a6;
}

- (BOOL)killDownload:(BOOL)a3 userRequested:(BOOL)a4 keepDocAssets:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v11, "killDownload:userRequested:keepDocAssets:error:", v9, v8, v7, a6);

  return (char)a6;
}

- (id)updateToAutoDownload
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore scanner](self, "scanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptorToAutoDownload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)cleanupPreviousDownloadState
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanupPreviousDownloadState:", 1);

}

- (void)resetDownloadState
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetDownloadStateOnStartup");

}

- (id)slaVersion
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slaVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateInstallPolicyType:(unint64_t)a3
{
  id v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore installer](self, "installer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateInstallPolicyType:", a3);

}

- (void)updateInstallPolicyAutoUpdateEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore installer](self, "installer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateInstallPolicyAutoUpdateEnabled:", v3);

}

- (id)newInstallTonightConfig
{
  _BOOL4 v3;
  const __CFString *v4;
  _BOOL4 v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  int v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  id v26;
  void *v27;
  void *v28;

  v26 = objc_alloc(MEMORY[0x24BDD17C8]);
  v3 = -[SUManagerCore isInstallTonight](self, "isInstallTonight");
  v4 = CFSTR("false");
  if (v3)
    v4 = CFSTR("true");
  v25 = v4;
  v5 = -[SUManagerCore isAutoUpdateEnabled](self, "isAutoUpdateEnabled");
  v6 = CFSTR("autoOff");
  if (v5)
    v6 = CFSTR("autoOn");
  v24 = v6;
  -[SUManagerCore download](self, "download");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "descriptor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v27, "autoUpdateEnabled");
  v8 = CFSTR("disabled");
  if (v7)
    v8 = CFSTR("enabled");
  v23 = v8;
  -[SUManagerCore download](self, "download");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "downloadOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isAutoDownload"))
    v11 = CFSTR("bg");
  else
    v11 = CFSTR("fg");
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isAutomaticUpdateV2Enabled"))
    v13 = CFSTR("toggleAIOn");
  else
    v13 = CFSTR("toggleAIOff");
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isAutoDownloadDisabled"))
    v15 = CFSTR("toggleADOff");
  else
    v15 = CFSTR("toggleADOn");
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "autoInstallSystemAndDataFiles"))
    v17 = CFSTR("toggleAISDFOn");
  else
    v17 = CFSTR("toggleAISDFOff");
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "autoInstallSecurityResponse");
  v20 = CFSTR("toggleAIRSROff");
  if (v19)
    v20 = CFSTR("toggleAIRSROn");
  v21 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("[LEGACY]%@,%@,%@,%@,%@,%@,%@,%@"), v25, v24, v23, v11, v13, v15, v17, v20);

  return v21;
}

- (id)installTonightConfigDictionary
{
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[7];
  _QWORD v24[8];

  v24[7] = *MEMORY[0x24BDAC8D0];
  v23[0] = CFSTR("installTonightActive");
  v3 = -[SUManagerCore isInstallTonight](self, "isInstallTonight");
  v4 = *MEMORY[0x24BEAEB98];
  v5 = *MEMORY[0x24BEAEB78];
  if (v3)
    v6 = *MEMORY[0x24BEAEB98];
  else
    v6 = *MEMORY[0x24BEAEB78];
  v24[0] = v6;
  v23[1] = CFSTR("autoUpdateEnabledForDescriptor");
  -[SUManagerCore download](self, "download");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "autoUpdateEnabled"))
    v9 = v4;
  else
    v9 = v5;
  v24[1] = v9;
  v23[2] = CFSTR("autoDownload");
  -[SUManagerCore download](self, "download");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "downloadOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isAutoDownload"))
    v12 = v4;
  else
    v12 = v5;
  v24[2] = v12;
  v23[3] = CFSTR("autoUpdateToggleEnabled");
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isAutomaticUpdateV2Enabled"))
    v14 = v4;
  else
    v14 = v5;
  v24[3] = v14;
  v23[4] = CFSTR("autoDownloadToggleEnabled");
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isAutomaticDownloadEnabled"))
    v16 = v4;
  else
    v16 = v5;
  v24[4] = v16;
  v23[5] = CFSTR("autoInstallSystemAndDataFilesToggleEnabled");
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "autoInstallSystemAndDataFiles"))
    v18 = v4;
  else
    v18 = v5;
  v24[5] = v18;
  v23[6] = CFSTR("autoInstallSecurityResponseToggleEnabled");
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "autoInstallSecurityResponse"))
    v20 = v4;
  else
    v20 = v5;
  v24[6] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 replyHandler:(id)a4
{
  NSObject *workQueue;
  id v7;
  id v8;
  id v9;

  workQueue = self->_workQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore installer](self, "installer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "isUpdateReadyForInstallationWithOptions:replyHandler:", v8, v7);

}

- (BOOL)isUpdateReadyForInstallation:(id *)a3
{
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore installer](self, "installer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v5, "isUpdateReadyForInstallation:", a3);

  return (char)a3;
}

- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4
{
  NSObject *workQueue;
  id v7;
  id v8;
  id v9;

  workQueue = self->_workQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore installer](self, "installer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "installUpdateWithInstallOptions:withResult:", v8, v7);

}

- (void)installUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  SUInstallOptions *v9;

  v6 = a4;
  v7 = a3;
  v9 = objc_alloc_init(SUInstallOptions);
  -[SUInstallOptions setDarkBoot:](v9, "setDarkBoot:", objc_msgSend(v7, "containsObject:", CFSTR("SUInstallOptionDarkBoot")));
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("SUInstallOptionRequireUpdate"));

  -[SUInstallOptions setRequired:](v9, "setRequired:", v8);
  -[SUManagerCore installUpdateWithInstallOptions:withResult:](self, "installUpdateWithInstallOptions:withResult:", v9, v6);

}

- (void)autoSUFailedWithError:(id)a3
{
  NSObject *workQueue;
  id v5;
  id v6;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore installer](self, "installer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "autoSUFailedWithError:", v5);

}

- (id)eligibleRollbackWithOptions:(id)a3
{
  BOOL v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v27 = 0;
  v4 = -[SUManagerCore isSplatRollbackAllowed:](self, "isSplatRollbackAllowed:", &v27);
  v5 = v27;
  v13 = v5;
  if (v4)
  {
    -[SUManagerCore engine](self, "engine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "availableRollback");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "fakeSplatInstalled");

    if (v17)
    {
      v18 = objc_alloc_init(MEMORY[0x24BEAE858]);

      SULogInfo(CFSTR("%s: Fake splat installed, generating a fake descriptor."), v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[SUManagerCore eligibleRollbackWithOptions:]");
      v15 = v18;
    }
  }
  else
  {
    SULogInfo(CFSTR("Rollback not allowed. Returning nil rollback descriptor: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    v15 = 0;
  }

  return v15;
}

- (void)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_msgSend(MEMORY[0x24BEAEA48], "sharedDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasSemiSplatActive");

  if (v9)
  {
    SULogInfo(CFSTR("Rollback already applied, just proceed to reboot"), v10, v11, v12, v13, v14, v15, v16, v28);
    v17 = 0;
LABEL_4:
    -[SUManagerCore rollback](self, "rollback");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "rollbackUpdateWithOptions:completion:", v6, v7);

    goto LABEL_5;
  }
  v29 = 0;
  v18 = -[SUManagerCore isSplatRollbackAllowed:](self, "isSplatRollbackAllowed:", &v29);
  v19 = v29;
  v17 = v19;
  if ((v18 & 1) != 0)
    goto LABEL_4;
  SULogInfo(CFSTR("Rollback not allowed. Preventing rollback request: %@"), v20, v21, v22, v23, v24, v25, v26, (uint64_t)v19);
  if (v7)
    (*((void (**)(id, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, v17);
LABEL_5:

}

- (id)previousRollbackWithOptions:(id)a3
{
  void *v4;
  void *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore engine](self, "engine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousRollback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isRollingBack
{
  void *v3;
  char v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore rollback](self, "rollback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRollingBack");

  return v4;
}

- (void)rollbackReadyForReboot
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore rollback](self, "rollback");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore eligibleRollbackWithOptions:](self, "eligibleRollbackWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rollbackReadyForReboot:", v3);

}

- (void)securityResponseRollbackSuggested:(id)a3 withResult:(id)a4
{
  NSObject *workQueue;
  id v7;
  id v8;
  void *v9;
  id v10;

  workQueue = self->_workQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore rollback](self, "rollback");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "availableRollback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore suggestRollback:rollbackDescriptor:withResult:](self, "suggestRollback:rollbackDescriptor:withResult:", v8, v9, v7);

}

- (void)_persistStash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  SULogInfo(CFSTR("entered _persistStash"), v3, v4, v5, v6, v7, v8, v9, v31);
  +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore download](self, "download");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "installationKeybagStateForDescriptor:", v12);

  if ((_DWORD)v13 == 2)
  {
    SULogInfo(CFSTR("Persist the stashbag"), v14, v15, v16, v17, v18, v19, v20, v32);
    +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "persistKeybagStash");

    if (v22)
    {
      SULogInfo(CFSTR("Stashbag persisted"), v23, v24, v25, v26, v27, v28, v29, v33);
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUManagerCore setLastStashbagPersistedDate:](self, "setLastStashbagPersistedDate:", v30);

      -[SUState setStashbagPersisted:](self->_state, "setStashbagPersisted:", 1);
      -[SUState save](self->_state, "save");
    }
    else
    {
      SULogInfo(CFSTR("Stashbag persist failed: %d"), v23, v24, v25, v26, v27, v28, v29, 0);
      -[SUManagerCore setLastStashbagPersistedDate:](self, "setLastStashbagPersistedDate:", 0);
    }
  }
  else
  {
    SULogInfo(CFSTR("installationKeybagState = %d"), v14, v15, v16, v17, v18, v19, v20, v13);
  }
}

- (void)persistStashOnUnlock
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *workQueue;
  uint64_t v19;
  _QWORD block[5];

  SULogInfo(CFSTR("Entering persistStashOnUnlock"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v19);
  +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isPasscodeLocked");

  SULogInfo(CFSTR("isPasscodeLocked = %d"), v11, v12, v13, v14, v15, v16, v17, v10);
  if ((v10 & 1) == 0)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__SUManagerCore_persistStashOnUnlock__block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

uint64_t __37__SUManagerCore_persistStashOnUnlock__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistStash");
}

- (void)createInstallationKeybag:(id)a3 withResult:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  NSObject *externWorkQueue;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void (**v53)(id, uint64_t, _QWORD);
  id v54;
  _QWORD block[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_msgSend(v6, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_6;
  -[SUManagerCore download](self, "download");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SUManagerCore download](self, "download");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "descriptor");
  }
  else
  {
    -[SUManagerCore preferredLastScannedDescriptor](self, "preferredLastScannedDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v10);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_6:
    objc_msgSend(v6, "passcode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {

    }
    else
    {
      objc_msgSend(v6, "laContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        SULogInfo(CFSTR("No passcode or LAContext provided for keybag. Unable to create installation keybag with null passcode and null LAContext"), v20, v21, v22, v23, v24, v25, v26, v51);
        if (!v7)
          goto LABEL_34;
        goto LABEL_29;
      }
    }
    v34 = objc_msgSend(v6, "keybagType");
    if (!v34)
    {
      SULogInfo(CFSTR("createInstallationKeybag - asked to create attended keybag but will create unattended one anyway"), v27, v28, v29, v30, v31, v32, v33, v51);
      v34 = 1;
    }
    objc_msgSend(v6, "laContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v6, "laContext");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "createInstallationKeybagForDescriptor:withLASecret:forUnattendedInstall:", v8, v37, v34 == 1);
    }
    else
    {
      objc_msgSend(v6, "passcode");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "createInstallationKeybagForDescriptor:withSecret:forUnattendedInstall:", v8, v37, v34 == 1);
    }
    v39 = v38;

    -[SUManagerCore setLastStashbagPersistedDate:](self, "setLastStashbagPersistedDate:", 0);
    if (v34 == 1 && v39)
    {
      v52 = v8;
      v53 = v7;
      v54 = v6;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      -[NSHashTable allObjects](self->_observers, "allObjects");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v57;
        v44 = MEMORY[0x24BDAC760];
        do
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v57 != v43)
              objc_enumerationMutation(v40);
            v46 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              externWorkQueue = self->_externWorkQueue;
              block[0] = v44;
              block[1] = 3221225472;
              block[2] = __53__SUManagerCore_createInstallationKeybag_withResult___block_invoke;
              block[3] = &unk_24CE3B5C0;
              block[4] = v46;
              dispatch_async(externWorkQueue, block);
            }
          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        }
        while (v42);
      }

      v7 = v53;
      v6 = v54;
      v8 = v52;
    }
    if (v39)
    {
      v7[2](v7, 1, 0);
      goto LABEL_34;
    }
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 82);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagerCore reportPostponedEvent:withStatus:](self, "reportPostponedEvent:withStatus:", v48, CFSTR("installNotReady"));

LABEL_29:
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 82);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v49);

    goto LABEL_34;
  }
  SULogInfo(CFSTR("No descriptor provided for keybag. Unable to create installation keybag with null descriptor"), v11, v12, v13, v14, v15, v16, v17, v51);
  if (v7)
  {
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 82);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v50);

  }
  v8 = 0;
LABEL_34:

}

uint64_t __53__SUManagerCore_createInstallationKeybag_withResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unattendedInstallationKeybagCreated");
}

- (void)clearKeybagStash
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableKeybagStash");

  v12 = CFSTR("failed");
  if (v4)
    v12 = CFSTR("succeeded");
  SULogInfo(CFSTR("destroying keybag stash %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);
  -[SUManagerCore setLastStashbagPersistedDate:](self, "setLastStashbagPersistedDate:", 0);
  -[SUState setStashbagPersisted:](self->_state, "setStashbagPersisted:", 0);
  -[SUState save](self->_state, "save");
}

- (void)presentAutoUpdateBanner:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  NSObject *externWorkQueue;
  NSObject *workQueue;
  uint64_t v36;
  uint64_t v37;
  _QWORD block[4];
  id v39;
  char v40;
  _QWORD v41[5];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  SULogBadging();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v5, CFSTR("Got request to present AutoUpdateBanner"), v6, v7, v8, v9, v10, v11, v36);

  -[SUManagerCore download](self, "download");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_5;
  v13 = (void *)v12;
  -[SUManagerCore download](self, "download");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_5:
    SULogBadging();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v26, CFSTR("Download/descriptor object is null..Skipping banner"), v27, v28, v29, v30, v31, v32, v37);

    v33 = 0;
    if (!v4)
      goto LABEL_7;
LABEL_6:
    externWorkQueue = self->_externWorkQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__SUManagerCore_presentAutoUpdateBanner___block_invoke_2;
    block[3] = &unk_24CE3E230;
    v39 = v4;
    v40 = v33;
    dispatch_async(externWorkQueue, block);

    goto LABEL_7;
  }
  v16 = dispatch_time(0, 2000000000);
  -[SUManagerCore followUpController](self, "followUpController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isCurrentlyPresentingFollowUpType:", 2);

  if ((v18 & 1) != 0)
  {
    SULogBadging();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v19, CFSTR("Not presenting banner since it is already being presented"), v20, v21, v22, v23, v24, v25, v37);

  }
  else
  {
    workQueue = self->_workQueue;
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __41__SUManagerCore_presentAutoUpdateBanner___block_invoke;
    v41[3] = &unk_24CE3B5C0;
    v41[4] = self;
    dispatch_after(v16, workQueue, v41);
  }
  v33 = 1;
  if (v4)
    goto LABEL_6;
LABEL_7:

}

void __41__SUManagerCore_presentAutoUpdateBanner___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "followUpController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "download");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postFollowUpOfType:withUpdate:userInfo:", 2, v3, 0);

}

uint64_t __41__SUManagerCore_presentAutoUpdateBanner___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)clearBadgeAndBanner
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore dismissAutoUpdateBanner](self, "dismissAutoUpdateBanner");
  -[SUManagerCore unbadgeSettingsForManualSoftwareUpdate](self, "unbadgeSettingsForManualSoftwareUpdate");
  -[SUManagerCore dismissLegacyFollowUps](self, "dismissLegacyFollowUps");
  -[SUManagerCore dismissInsufficientDiskSpaceFollowupForUpdate:orForce:](self, "dismissInsufficientDiskSpaceFollowupForUpdate:orForce:", 0, 1);
}

- (void)dismissAutoUpdateBanner
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPresentAutoUpdateBanner");

  SULogBadging();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v4, CFSTR("Got request to dismiss AutoUpdateBanner"), v5, v6, v7, v8, v9, v10, v11);

  -[SUManagerCore followUpController](self, "followUpController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dismissFollowUpType:", 2);

}

- (void)unbadgeSettingsForManualSoftwareUpdate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  SULogBadging();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v3, CFSTR("Removing settings badge set by manual update flow(if present)"), v4, v5, v6, v7, v8, v9, v10);

  -[SUManagerCore followUpController](self, "followUpController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dismissFollowUpTypes:", &unk_24CE6E378);

}

- (void)dismissLegacyFollowUps
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  SULogBadging();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v3, CFSTR("Removing legacy SU follow up (if present)"), v4, v5, v6, v7, v8, v9, v10);

  -[SUManagerCore followUpController](self, "followUpController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dismissLegacyFollowUps");

}

- (void)badgeSettingsForManualSoftwareUpdate:(id)a3
{
  NSObject *workQueue;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  SULogBadging();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v6, CFSTR("Badging settings for manual update flow"), v7, v8, v9, v10, v11, v12, v13);

  -[SUManagerCore followUpController](self, "followUpController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postFollowUpOfType:withUpdate:userInfo:", 1, v5, 0);

}

- (void)reportOTAAvailableEvent:(id)a3
{
  NSObject *workQueue;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  v17 = *MEMORY[0x24BEAEAB8];
  -[SUManagerCore scanner](self, "scanner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastScannedDescriptorScanOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientName");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("None");
  if (v8)
    v10 = (const __CFString *)v8;
  v18[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *MEMORY[0x24BEAEAF0];
  -[SUManagerCore engine](self, "engine");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updatePolicy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredDescriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alternateDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerCore _reportOTAEvent:withStatus:policy:primaryDescriptor:alternateDescriptor:additionalMetrics:error:](self, "_reportOTAEvent:withStatus:policy:primaryDescriptor:alternateDescriptor:additionalMetrics:error:", v12, 0, v14, v15, v16, v11, 0);
}

- (void)reportOTAStartedDownloadingEvent:(id)a3
{
  NSObject *workQueue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "download");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore coreDescriptorForSUDescriptor:](self, "coreDescriptorForSUDescriptor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isCurrentNetworkTypeCellular");

  v24[0] = *MEMORY[0x24BEAEAB8];
  -[SUManagerCore downloader](self, "downloader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "download");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "downloadOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clientName");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = CFSTR("None");
  if (v15)
    v17 = (const __CFString *)v15;
  v24[1] = *MEMORY[0x24BEAEAD8];
  v18 = (uint64_t *)MEMORY[0x24BEAEB98];
  if (!v11)
    v18 = (uint64_t *)MEMORY[0x24BEAEB78];
  v19 = *v18;
  v25[0] = v17;
  v25[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = *MEMORY[0x24BEAEB10];
  -[SUManagerCore engine](self, "engine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "updatePolicy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore _reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:](self, "_reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:", v21, 0, v23, v9, v20, v5);

}

- (void)reportOTADownloadedEvent:(id)a3
{
  NSObject *workQueue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  workQueue = self->_workQueue;
  v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  v20 = *MEMORY[0x24BEAEAB8];
  -[SUManagerCore downloader](self, "downloader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "download");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "downloadOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientName");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("None");
  if (v9)
    v11 = (const __CFString *)v9;
  v21[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerCore downloader](self, "downloader");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "download");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "descriptor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore coreDescriptorForSUDescriptor:](self, "coreDescriptorForSUDescriptor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *MEMORY[0x24BEAEAF8];
  -[SUManagerCore engine](self, "engine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updatePolicy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore _reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:](self, "_reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:", v17, v5, v19, v16, v12, 0);

}

- (void)reportOTAInstalledEvent
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "download");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore coreDescriptorForSUDescriptor:](self, "coreDescriptorForSUDescriptor:", v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x24BEAEB00];
  -[SUManagerCore engine](self, "engine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updatePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore _reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:](self, "_reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:", v6, 0, v8, v9, 0, 0);

}

- (void)reportOTASucceededEvent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "download");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore coreDescriptorForSUDescriptor:](self, "coreDescriptorForSUDescriptor:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[SUManagerCore _reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:](self, "_reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:", *MEMORY[0x24BEAEB18], 0, 0, v6, 0, 0);
}

- (void)reportOTAAutoTriggeredEvent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "download");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore coreDescriptorForSUDescriptor:](self, "coreDescriptorForSUDescriptor:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[SUManagerCore _reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:](self, "_reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:", *MEMORY[0x24BEAEAE8], 0, 0, v6, 0, 0);
}

- (void)reportOTAAbandonedEvent
{
  -[SUManagerCore reportOTAAbandonedEventWithError:](self, "reportOTAAbandonedEventWithError:", 0);
}

- (void)reportOTAAbandonedEventWithError:(id)a3
{
  -[SUManagerCore reportOTAAbandonedEventWithError:additionalMetrics:](self, "reportOTAAbandonedEventWithError:additionalMetrics:", a3, 0);
}

- (void)reportOTAAbandonedEventWithError:(id)a3 additionalMetrics:(id)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  workQueue = self->_workQueue;
  v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  v21 = *MEMORY[0x24BEAEAB8];
  -[SUManagerCore downloader](self, "downloader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "download");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "downloadOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientName");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("None");
  if (v12)
    v14 = (const __CFString *)v12;
  v22[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v6)
    objc_msgSend(v16, "addEntriesFromDictionary:", v6);
  -[SUManagerCore downloader](self, "downloader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "download");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "descriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore coreDescriptorForSUDescriptor:](self, "coreDescriptorForSUDescriptor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerCore _reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:](self, "_reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:", *MEMORY[0x24BEAEAE0], 0, 0, v20, v16, v8);
}

- (void)reportRSRRollbackSuggestedEventWithDescriptor:(id)a3 rollbackSuggestionInfo:(id)a4
{
  NSObject *workQueue;
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  workQueue = self->_workQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  v9 = *MEMORY[0x24BEAEB20];
  objc_msgSend(v8, "productBuildVersion");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SUManagerCore _reportRollbackEvent:withInfo:buildVersion:](self, "_reportRollbackEvent:withInfo:buildVersion:", v9, v7, v10);
}

- (void)reportRSRRollbackSuggestedEventWithRollbackDescriptor:(id)a3 rollbackSuggestionInfo:(id)a4
{
  NSObject *workQueue;
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  workQueue = self->_workQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(workQueue);
  v9 = *MEMORY[0x24BEAEB20];
  objc_msgSend(v8, "productBuildVersion");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SUManagerCore _reportRollbackEvent:withInfo:buildVersion:](self, "_reportRollbackEvent:withInfo:buildVersion:", v9, v7, v10);
}

- (void)_reportRollbackEvent:(id)a3 withInfo:(id)a4 buildVersion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v9 = (void *)objc_opt_new();
  v17 = v9;
  if (v9)
  {
    v42 = v7;
    objc_msgSend(v9, "setSafeObject:forKey:", v7, *MEMORY[0x24BEAEB80]);
    objc_msgSend(v17, "setSafeObject:forKey:", CFSTR("SUS-2.0"), *MEMORY[0x24BEAEAC8]);
    objc_msgSend(v17, "setSafeObject:forKey:", CFSTR("SUS-2.0"), *MEMORY[0x24BEAEB70]);
    objc_msgSend(v17, "setSafeObject:forKey:", self->_sessionID, *MEMORY[0x24BEAEBA0]);
    -[SUManagerCore rollbackSuggestionReasonFromSUReason:](self, "rollbackSuggestionReasonFromSUReason:", objc_msgSend(v8, "suggestionReason"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSafeObject:forKey:");
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v41 = v8;
    objc_msgSend(v8, "responsibleProcessesInfo");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v46 = *(_QWORD *)v48;
      v44 = *MEMORY[0x24BEAEB50];
      v45 = *MEMORY[0x24BEAEB60];
      v21 = *MEMORY[0x24BEAEB48];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v48 != v46)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          v24 = (v20 + i + 1);
          objc_msgSend(v23, "processName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUManagerCore setRollbackValue:forKey:count:event:](self, "setRollbackValue:forKey:count:event:", v25, v45, v24, v17);

          objc_msgSend(v23, "rollbackSuggestionError");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "domain");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUManagerCore setRollbackValue:forKey:count:event:](self, "setRollbackValue:forKey:count:event:", v27, v44, v24, v17);

          v28 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v23, "rollbackSuggestionError");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "code"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[SUManagerCore setRollbackValue:forKey:count:event:](self, "setRollbackValue:forKey:count:event:", v30, v21, v24, v17);

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        v20 += i;
      }
      while (v19);
    }

    SULogInfo(CFSTR("reporting OTA event: %@"), v31, v32, v33, v34, v35, v36, v37, (uint64_t)v17);
    -[SUManagerCore coreReporter](self, "coreReporter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *MEMORY[0x24BEAEBE0]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sendEvent:toServerURL:", v17, v39);

    v8 = v41;
    v7 = v42;
  }
  else
  {
    SULogInfo(CFSTR("failed to allocate event for %@ event so not reported"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v7);
  }

}

- (void)setRollbackValue:(id)a3 forKey:(id)a4 count:(int)a5 event:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v7 = *(_QWORD *)&a5;
  v14 = a3;
  v9 = a4;
  v10 = a6;
  v11 = v9;
  v12 = v11;
  v13 = v11;
  if ((int)v7 >= 2)
  {
    objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("_%d"), v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "setSafeObject:forKey:", v14, v13);

}

- (id)rollbackSuggestionReasonFromSUReason:(unint64_t)a3
{
  if (a3 <= 2)
    self = (SUManagerCore *)**((id **)&unk_24CE3E308 + a3);
  return self;
}

- (void)reportSimulatedOTAAutoTriggeredEvent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore downloader](self, "downloader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "download");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerCore coreDescriptorForSUDescriptor:](self, "coreDescriptorForSUDescriptor:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[SUManagerCore _reportOTAEvent:withStatus:policy:primaryDescriptor:alternateDescriptor:additionalMetrics:error:](self, "_reportOTAEvent:withStatus:policy:primaryDescriptor:alternateDescriptor:additionalMetrics:error:", CFSTR("otaSimulatedAutoTriggered"), 0, 0, v6, 0, 0, 0);
}

- (void)reportPostponedEvent:(id)a3 withStatus:(id)a4
{
  -[SUManagerCore reportPostponedEvent:withStatus:withAdditionalMetrics:](self, "reportPostponedEvent:withStatus:withAdditionalMetrics:", a3, a4, 0);
}

- (void)reportPostponedEvent:(id)a3 withStatus:(id)a4 withAdditionalMetrics:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore state](self, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastSentOTAPostponedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_msgSend(v12, "timeIntervalSinceNow"), fabs(v20) < 43200.0))
  {
    SULogInfo(CFSTR("%s: Holding off on reporting otaPostponed event because previous event was recently emitted"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUManagerCore reportPostponedEvent:withStatus:withAdditionalMetrics:]");
  }
  else
  {
    v21 = v9;
    v22 = v8;
    v46 = *MEMORY[0x24BEAEAB8];
    -[SUManagerCore downloader](self, "downloader");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "download");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "downloadOptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "clientName");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    v28 = CFSTR("None");
    if (v26)
      v28 = (const __CFString *)v26;
    v47[0] = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
    v45 = v10;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "mutableCopy");

    if (v45)
      objc_msgSend(v30, "addEntriesFromDictionary:", v45);
    -[SUManagerCore lastStashbagPersistedDate](self, "lastStashbagPersistedDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v22;
    v9 = v21;
    if (v31)
    {
      -[SUManagerCore lastStashbagPersistedDate](self, "lastStashbagPersistedDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeIntervalSinceNow");
      v34 = v33;

      if (v34 < 0.0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), (int)(v34 / -600.0));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
          objc_msgSend(v30, "setObject:forKey:", v35, *MEMORY[0x24BEAEB40]);

      }
    }
    -[SUManagerCore downloader](self, "downloader");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "download");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "descriptor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagerCore coreDescriptorForSUDescriptor:](self, "coreDescriptorForSUDescriptor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = *MEMORY[0x24BEAEB08];
    -[SUManagerCore engine](self, "engine");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "updatePolicy");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagerCore _reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:](self, "_reportOTAEvent:withStatus:policy:descriptor:additionalMetrics:error:", v40, v21, v42, v39, v30, v8);

    -[SUManagerCore state](self, "state");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setLastSentOTAPostponedDate:", v44);

    v10 = v45;
  }

}

- (void)_reportOTAEvent:(id)a3 withStatus:(id)a4 policy:(id)a5 descriptor:(id)a6 additionalMetrics:(id)a7 error:(id)a8
{
  -[SUManagerCore _reportOTAEvent:withStatus:policy:primaryDescriptor:alternateDescriptor:additionalMetrics:error:](self, "_reportOTAEvent:withStatus:policy:primaryDescriptor:alternateDescriptor:additionalMetrics:error:", a3, a4, a5, a6, 0, a7, a8);
}

- (void)_reportOTAEvent:(id)a3 withStatus:(id)a4 policy:(id)a5 primaryDescriptor:(id)a6 alternateDescriptor:(id)a7 additionalMetrics:(id)a8 error:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *workQueue;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  _QWORD *v34;
  id v35;

  v35 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  workQueue = self->_workQueue;
  v21 = a3;
  dispatch_assert_queue_V2(workQueue);
  v22 = (void *)objc_opt_new();
  v30 = v22;
  if (v22)
  {
    objc_msgSend(v22, "setSafeObject:forKey:", v21, *MEMORY[0x24BEAEB80]);

    objc_msgSend(v30, "setSafeObject:forKey:", v35, *MEMORY[0x24BEAEAC0]);
    +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    SUStringFromNetworkType(objc_msgSend(v31, "currentNetworkType"));
    v21 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "setSafeObject:forKey:", v21, *MEMORY[0x24BEAEB30]);
    +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "isCurrentNetworkTypeCellular");

    v34 = (_QWORD *)MEMORY[0x24BEAEB98];
    if (!v33)
      v34 = (_QWORD *)MEMORY[0x24BEAEB78];
    objc_msgSend(v30, "setSafeObject:forKey:", *v34, CFSTR("cellular"));
    if (v19)
      objc_msgSend(MEMORY[0x24BEAEA58], "augmentEvent:withError:", v30, v19);
    else
      objc_msgSend(v30, "setSafeObject:forKey:", *MEMORY[0x24BEAEB90], *MEMORY[0x24BEAEB88]);
    -[SUManagerCore _describeAndReportEvent:policy:primaryDescriptor:alternateDescriptor:additionalMetrics:](self, "_describeAndReportEvent:policy:primaryDescriptor:alternateDescriptor:additionalMetrics:", v30, v15, v16, v17, v18);
  }
  else
  {
    SULogInfo(CFSTR("failed to allocate event for %@ event so not reported"), v23, v24, v25, v26, v27, v28, v29, (uint64_t)v21);
  }

}

- (void)_describeAndReportEvent:(id)a3 policy:(id)a4 primaryDescriptor:(id)a5 alternateDescriptor:(id)a6 additionalMetrics:(id)a7
{
  id v12;
  id v13;
  NSObject *workQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  v12 = a5;
  v13 = a7;
  workQueue = self->_workQueue;
  v15 = a6;
  v16 = a4;
  dispatch_assert_queue_V2(workQueue);
  v17 = objc_alloc_init(MEMORY[0x24BEAE818]);
  objc_msgSend(v17, "setPolicy:", v16);

  objc_msgSend(v17, "setPrimaryDescriptor:", v12);
  objc_msgSend(v17, "setAlternateDescriptor:", v15);

  objc_msgSend(v17, "augmentEvent:", v30);
  objc_msgSend(v30, "setSafeObject:forKey:", CFSTR("SUS-2.0"), *MEMORY[0x24BEAEAC8]);
  objc_msgSend(v30, "setSafeObject:forKey:", CFSTR("SUS-2.0"), *MEMORY[0x24BEAEB70]);
  objc_msgSend(v30, "setSafeObject:forKey:", self->_sessionID, *MEMORY[0x24BEAEBA0]);
  v18 = -[SUManagerCore newInstallTonightConfig](self, "newInstallTonightConfig");
  objc_msgSend(v30, "setSafeObject:forKey:", v18, *MEMORY[0x24BEAEB28]);

  v19 = (_QWORD *)MEMORY[0x24BEAEB98];
  if (!self->_reportStartedFromPersistedState)
    v19 = (_QWORD *)MEMORY[0x24BEAEB78];
  objc_msgSend(v30, "setSafeObject:forKey:", *v19, CFSTR("startedFromPersistedState"));
  -[SUManagerCore installTonightConfigDictionary](self, "installTonightConfigDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addEntriesFromDictionary:", v20);

  if (v13)
    objc_msgSend(v30, "addEntriesFromDictionary:", v13);
  -[SUManagerCore eventRecordingServiceURL:](self, "eventRecordingServiceURL:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    SULogInfo(CFSTR("reporting OTA event: %@"), v21, v22, v23, v24, v25, v26, v27, (uint64_t)v30);
    -[SUManagerCore coreReporter](self, "coreReporter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sendEvent:toServerURL:", v30, v28);

  }
  else
  {
    SULogInfo(CFSTR("Unable to create event reporting server URL. Not sending event: %@"), v21, v22, v23, v24, v25, v26, v27, (uint64_t)v30);
  }

}

- (id)eventRecordingServiceURL:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = (void *)MEMORY[0x24BDBCF48];
  v4 = *MEMORY[0x24BEAEBE0];
  v5 = a3;
  objc_msgSend(v3, "URLWithString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getMASoftwareUpdateAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("_EventRecordingServiceURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BEAEA58], "buildSplunkServerURLFromBase:", v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }

  }
  return v6;
}

- (void)reporterFlushEvent
{
  -[SUCoreEventReporter flushEvent](self->_coreReporter, "flushEvent");
}

- (void)reportCoreAnalyticsOTAAvailableEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  SUManagerCore *v15;

  v4 = a3;
  -[SUManagerCore _getAmountDataAvailable](self, "_getAmountDataAvailable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __54__SUManagerCore_reportCoreAnalyticsOTAAvailableEvent___block_invoke;
  v13 = &unk_24CE3E258;
  v14 = v5;
  v15 = self;
  v6 = v5;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BF6094](&v10);
  objc_msgSend(v4, "preferredDescriptor", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v7)[2](v7, v8);

  objc_msgSend(v4, "alternateDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  ((void (**)(_QWORD, void *))v7)[2](v7, v9);
}

void __54__SUManagerCore_reportCoreAnalyticsOTAAvailableEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SUAnalyticsEvent *v4;

  if (a2)
  {
    v3 = a2;
    v4 = -[SUAnalyticsEvent initWithEventName:]([SUAnalyticsEvent alloc], "initWithEventName:", CFSTR("com.apple.massStorage.SoftwareUpdate.OTAEvents_1"));
    -[SUAnalyticsEvent setEventPayloadEntry:stringValue:](v4, "setEventPayloadEntry:stringValue:", CFSTR("eventName"), *MEMORY[0x24BEAEAF0]);
    -[SUAnalyticsEvent setEventPayloadEntry:numberValue:](v4, "setEventPayloadEntry:numberValue:", CFSTR("errorCode"), &unk_24CE6E130);
    -[SUAnalyticsEvent setEventPayloadEntry:BOOLValue:](v4, "setEventPayloadEntry:BOOLValue:", CFSTR("autoDownload"), 0);
    -[SUAnalyticsEvent setEventPayloadEntry:numberValue:](v4, "setEventPayloadEntry:numberValue:", CFSTR("DiskUsageAmountDataAvailable"), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "_augmentCoreAnalyticsEvent:withUpdate:", v4, v3);

    objc_msgSend(*(id *)(a1 + 40), "_submitCoreAnalyticsEvent:", v4);
  }
}

- (void)reportCoreAnalyticsOTAStartedDownloadingEvent:(id)a3
{
  void *v4;
  void *v5;

  -[SUManagerCore _createCoreAnalyticsEventWithCurrentDownloadFor:error:](self, "_createCoreAnalyticsEventWithCurrentDownloadFor:error:", *MEMORY[0x24BEAEB10], a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SUManagerCore _submitCoreAnalyticsEvent:](self, "_submitCoreAnalyticsEvent:", v4);
    v4 = v5;
  }

}

- (void)reportCoreAnalyticsOTAAbandonedEvent:(id)a3
{
  void *v4;
  void *v5;

  -[SUManagerCore _createCoreAnalyticsEventWithCurrentDownloadFor:error:](self, "_createCoreAnalyticsEventWithCurrentDownloadFor:error:", *MEMORY[0x24BEAEAE0], a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SUManagerCore _submitCoreAnalyticsEvent:](self, "_submitCoreAnalyticsEvent:", v4);
    v4 = v5;
  }

}

- (void)reportCoreAnalyticsOTADownloadedEvent
{
  void *v3;
  void *v4;

  -[SUManagerCore _createCoreAnalyticsEventWithCurrentDownloadFor:error:](self, "_createCoreAnalyticsEventWithCurrentDownloadFor:error:", *MEMORY[0x24BEAEAF8], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[SUManagerCore _submitCoreAnalyticsEvent:](self, "_submitCoreAnalyticsEvent:", v3);
    v3 = v4;
  }

}

- (void)_augmentCoreAnalyticsEvent:(id)a3 withUpdate:(id)a4
{
  uint64_t v5;
  NSString *sessionID;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;

  v5 = *MEMORY[0x24BEAEBA0];
  sessionID = self->_sessionID;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "setEventPayloadEntry:stringValue:", v5, sessionID);
  objc_msgSend(v8, "setEventPayloadEntry:BOOLValue:", CFSTR("preSUStagingEnabled"), objc_msgSend(v7, "enablePreSUStaging"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v7, "preSUStagingOptionalSize") >> 20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEventPayloadEntry:numberValue:", CFSTR("preSUStagingOptionalSize"), v9);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v7, "preSUStagingRequiredSize") >> 20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEventPayloadEntry:numberValue:", CFSTR("preSUStagingRequiredSize"), v10);

  objc_msgSend(v7, "productBuildVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEventPayloadEntry:stringValue:", CFSTR("targetOSVersion"), v11);

  objc_msgSend(v7, "updateTypeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEventPayloadEntry:stringValue:", CFSTR("updateType"), v12);

  v13 = (void *)MEMORY[0x24BDD16E0];
  v14 = objc_msgSend(v7, "totalRequiredFreeSpace");

  objc_msgSend(v13, "numberWithUnsignedLongLong:", v14 >> 20);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEventPayloadEntry:numberValue:", CFSTR("totalRequiredFreeSpace"), v15);

}

- (id)_getAmountDataAvailable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (void *)MGCopyAnswer();
  v10 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BED8690]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (unint64_t)objc_msgSend(v11, "unsignedLongLongValue") >> 20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SULogError(CFSTR("%s: failed to get the disk usage dictionary"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerCore _getAmountDataAvailable]");
    v12 = &unk_24CE6E130;
  }

  return v12;
}

- (id)_createCoreAnalyticsEventWithCurrentDownloadFor:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  SUAnalyticsEvent *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore download](self, "download");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = -[SUAnalyticsEvent initWithEventName:]([SUAnalyticsEvent alloc], "initWithEventName:", CFSTR("com.apple.massStorage.SoftwareUpdate.OTAEvents_1"));
    -[SUAnalyticsEvent setEventPayloadEntry:stringValue:](v16, "setEventPayloadEntry:stringValue:", CFSTR("eventName"), v6);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "code"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUAnalyticsEvent setEventPayloadEntry:numberValue:](v16, "setEventPayloadEntry:numberValue:", CFSTR("errorCode"), v17);

    objc_msgSend(v15, "downloadOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "descriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagerCore coreDescriptorForSUDescriptor:](self, "coreDescriptorForSUDescriptor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUAnalyticsEvent setEventPayloadEntry:BOOLValue:](v16, "setEventPayloadEntry:BOOLValue:", CFSTR("autoDownload"), objc_msgSend(v18, "isAutoDownload"));
    -[SUManagerCore _augmentCoreAnalyticsEvent:withUpdate:](self, "_augmentCoreAnalyticsEvent:withUpdate:", v16, v20);
    -[SUManagerCore _getAmountDataAvailable](self, "_getAmountDataAvailable");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUAnalyticsEvent setEventPayloadEntry:numberValue:](v16, "setEventPayloadEntry:numberValue:", CFSTR("DiskUsageAmountDataAvailable"), v21);

  }
  else
  {
    SULogError(CFSTR("%s: current download doesn't exist"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerCore _createCoreAnalyticsEventWithCurrentDownloadFor:error:]");
    v16 = 0;
  }

  return v16;
}

- (void)_submitCoreAnalyticsEvent:(id)a3
{
  NSObject *workQueue;
  id v4;
  void *v5;
  id v6;

  workQueue = self->_workQueue;
  v4 = a3;
  dispatch_assert_queue_V2(workQueue);
  +[SUAnalyticsManager sharedManager](SUAnalyticsManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEvent:", v4);

  +[SUAnalyticsManager sharedManager](SUAnalyticsManager, "sharedManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitEvent:", v4);

}

- (BOOL)isSplatRollbackAllowed:(id *)a3
{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  int v16;
  void *v17;
  BOOL v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fakeSplatInstalled");

  if (v6)
  {
    v14 = CFSTR("Fake splat installed, allowing rollback");
LABEL_5:
    SULogInfo(v14, v7, v8, v9, v10, v11, v12, v13, v51);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BEAEA48], "sharedDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasSemiSplatActive");

  if (v16)
  {
    v14 = CFSTR("Rollback already applied, allow rollback");
    goto LABEL_5;
  }
  if (!+[SUUtility isSplatOnlyUpdateInstalled](SUUtility, "isSplatOnlyUpdateInstalled"))
  {
    SULogInfo(CFSTR("Splat-only update not installed. Unable to rollback update"), v20, v21, v22, v23, v24, v25, v26, v51);
    v35 = 93;
    goto LABEL_15;
  }
  -[SUManagerCore preferredLastScannedDescriptor](self, "preferredLastScannedDescriptor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {

LABEL_14:
    SULogInfo(CFSTR("Splat-only update installed, but new update available. Preventing rollback"), v28, v29, v30, v31, v32, v33, v34, v51);
    v35 = 94;
    goto LABEL_15;
  }
  -[SUManagerCore alternateLastScannedDescriptor](self, "alternateLastScannedDescriptor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
    goto LABEL_14;
  if (!-[SUManagerCore isSplatRollbackEnabled](self, "isSplatRollbackEnabled"))
  {
    SULogInfo(CFSTR("Splat Rollback disabled"), v37, v38, v39, v40, v41, v42, v43, v51);
    v35 = 88;
LABEL_15:
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", v35);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    if (!a3)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (!+[SUUtility isSplatRollbackDirectoryPresent](SUUtility, "isSplatRollbackDirectoryPresent"))
  {
    SULogInfo(CFSTR("Splat Rollback disabled due to missing rollback objects"), v44, v45, v46, v47, v48, v49, v50, v51);
    v35 = 99;
    goto LABEL_15;
  }
LABEL_6:
  v17 = 0;
  v18 = 1;
  if (a3)
LABEL_7:
    *a3 = objc_retainAutorelease(v17);
LABEL_8:

  return v18;
}

- (BOOL)isSplatOnlyUpdateRollbackSuggested
{
  uint64_t v3;
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
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (-[SUManagerCore isSplatRollbackAllowed:](self, "isSplatRollbackAllowed:", 0))
  {
    -[SUManagerCore preferredLastScannedDescriptor](self, "preferredLastScannedDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "suggestedRollbackSplatVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "restoreVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", v12);

    if (v14)
      SULogInfo(CFSTR("%s: Found suggested rollback for %@: %@"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[SUManagerCore isSplatOnlyUpdateRollbackSuggested]");
    else
      SULogInfo(CFSTR("%s: No suggested rollback for %@."), v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[SUManagerCore isSplatOnlyUpdateRollbackSuggested]");

  }
  else
  {
    SULogInfo(CFSTR("%s: Splat rollback is not allowed."), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerCore isSplatOnlyUpdateRollbackSuggested]");
    LOBYTE(v14) = 0;
  }
  return v14;
}

- (BOOL)isManaged
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableManagedRequest");

  if (v4)
  {
    SULogInfo(CFSTR("%s: disableManagedRequest is set; device is considered not managed."),
      v5,
      v6,
      v7,
      v8,
      v9,
      v10,
      v11,
      (uint64_t)"-[SUManagerCore isManaged]");
    return 0;
  }
  else
  {
    -[SUManagerCore ddmManager](self, "ddmManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isManagedByDDM") & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      -[SUManagerCore managedDeviceManager](self, "managedDeviceManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v14, "isManagedByMDM");

    }
  }
  return v12;
}

- (void)amendManagedScanOptions:(id)a3 withResponse:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  void (**v37)(id, id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v7)
  {
    if (v6)
    {
      if (!-[SUManagerCore isManaged](self, "isManaged"))
      {
        SULogInfo(CFSTR("%s: device is not managed. Unset managed scan options"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[SUManagerCore amendManagedScanOptions:withResponse:]");
        objc_msgSend(v6, "setManagedScanOptions:", 0);
        v7[2](v7, v6, 0);
        goto LABEL_11;
      }
      objc_msgSend(v6, "managedScanOptions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        SULogError(CFSTR("%s: missing managed scan options"), v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[SUManagerCore amendManagedScanOptions:withResponse:]");
        v30 = (void *)objc_opt_new();
        objc_msgSend(v6, "setManagedScanOptions:", v30);

      }
      objc_msgSend(v6, "managedScanOptions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUManagerCore ddmManager](self, "ddmManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __54__SUManagerCore_amendManagedScanOptions_withResponse___block_invoke;
      v34[3] = &unk_24CE3E2A8;
      v34[4] = self;
      v35 = v31;
      v36 = v6;
      v37 = v7;
      v33 = v31;
      objc_msgSend(v32, "getActiveDDMDeclarationEnforcedSUWithResponse:", v34);

    }
    else
    {
      SULogError(CFSTR("%s: cannot amend nil scan options"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerCore amendManagedScanOptions:withResponse:]");
      +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 22);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, id, id))v7)[2](v7, 0, v33);
    }

  }
  else
  {
    SULogError(CFSTR("%s: no response provided"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerCore amendManagedScanOptions:withResponse:]");
  }
LABEL_11:

}

void __54__SUManagerCore_amendManagedScanOptions_withResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 120);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SUManagerCore_amendManagedScanOptions_withResponse___block_invoke_2;
  block[3] = &unk_24CE3E280;
  v10 = v3;
  v11 = v4;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v7;
  v14 = *(id *)(a1 + 56);
  v8 = v3;
  dispatch_async(v5, block);

}

uint64_t __54__SUManagerCore_amendManagedScanOptions_withResponse___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v2, "versionString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRequestedProductMarketingVersion:", v4);

    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "buildVersionString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRequestedBuildVersion:", v6);

    objc_msgSend(*(id *)(a1 + 40), "setAllowSplat:", 1);
    objc_msgSend(*(id *)(a1 + 40), "setMDMSoftwareUpdatePath:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setUseDelayPeriod:", 0);
    objc_msgSend(*(id *)(a1 + 40), "setDelayPeriodSeconds:", 0);
    objc_msgSend(*(id *)(a1 + 48), "setScanType:", 2);
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 40), "useDelayPeriod") == 2)
    {
      v14 = objc_msgSend(*(id *)(a1 + 56), "updatesDelayPeriodSeconds");
      objc_msgSend(*(id *)(a1 + 40), "setDelayPeriodSeconds:", v14);
      objc_msgSend(*(id *)(a1 + 40), "setUseDelayPeriod:", v14 != 0);
    }
    if (objc_msgSend(*(id *)(a1 + 40), "MDMSoftwareUpdatePath") == 3)
      objc_msgSend(*(id *)(a1 + 40), "setMDMSoftwareUpdatePath:", objc_msgSend(*(id *)(a1 + 56), "softwareUpdatePathRestriction"));
    if (objc_msgSend(*(id *)(a1 + 40), "allowSplat") == 2)
      objc_msgSend(*(id *)(a1 + 40), "setAllowSplat:", objc_msgSend(*(id *)(a1 + 56), "splatUpdatesAllowed"));
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.mdm"));

    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 40), "setAllowSplat:", 1);
      SULogInfo(CFSTR("MDM initiated scan. Allowing splat scan"), v17, v18, v19, v20, v21, v22, v23, v25);
    }
  }
  SULogDebug(CFSTR("managed scan options after amendment: %@"), v7, v8, v9, v10, v11, v12, v13, *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

- (unint64_t)softwareUpdatePathRestriction
{
  uint64_t v3;
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
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (-[SUManagerCore isManaged](self, "isManaged"))
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "MDMSoftwareUpdatePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "MDMSoftwareUpdatePath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");

      if (v14 < 3)
      {
        SUStringFromMDMSUPath(v14);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("%s: SU path is %@ (set by SU preference)"), v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[SUManagerCore softwareUpdatePathRestriction]");
LABEL_13:

        return v14;
      }
      SULogError(CFSTR("%s: SU preference has an invalid value %lu; ignore it"),
        v15,
        v16,
        v17,
        v18,
        v19,
        v20,
        v21,
        (uint64_t)"-[SUManagerCore softwareUpdatePathRestriction]");
    }
    -[SUManagerCore ddmManager](self, "ddmManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v30, "recommendedCadence");

    if (v14 != 3)
    {
      SUStringFromMDMSUPath(v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("%s: SU path is %@ (set by DDM global settings)"), v39, v40, v41, v42, v43, v44, v45, (uint64_t)"-[SUManagerCore softwareUpdatePathRestriction]");
      goto LABEL_13;
    }
    -[SUManagerCore managedDeviceManager](self, "managedDeviceManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v31, "softwareUpdatePathRestriction");

    if (v14 != 3)
    {
      SUStringFromMDMSUPath(v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("%s: SU path is %@ (set by MDM restriction)"), v46, v47, v48, v49, v50, v51, v52, (uint64_t)"-[SUManagerCore softwareUpdatePathRestriction]");
      goto LABEL_13;
    }
    SULogInfo(CFSTR("%s: device is managed. SU path is default"), v32, v33, v34, v35, v36, v37, v38, (uint64_t)"-[SUManagerCore softwareUpdatePathRestriction]");
  }
  else
  {
    SULogInfo(CFSTR("%s: device is not managed. SU path is default"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerCore softwareUpdatePathRestriction]");
  }
  return 0;
}

- (unint64_t)updatesDelayPeriodSeconds
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!-[SUManagerCore isManaged](self, "isManaged"))
  {
    SULogInfo(CFSTR("%s: device is not managed. Updates are not delayed"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
    return 0;
  }
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldDelayUpdates");

  if (v11)
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateDelayInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "unsignedIntegerValue");

    if (v14)
    {
      +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "shouldDelayInMinutes");

      v31 = 86400;
      if (v23)
        v31 = 60;
      v32 = v31 * v14;
      SULogInfo(CFSTR("%s: Updates are delayed by SU preferences for %lu seconds"), v24, v25, v26, v27, v28, v29, v30, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
      return v32;
    }
    SULogError(CFSTR("%s: No delay period set, ignore SU preferences"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
  }
  -[SUManagerCore ddmManager](self, "ddmManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isDealyingUpdates");

  if (v34)
  {
    -[SUManagerCore ddmManager](self, "ddmManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 86400 * objc_msgSend(v35, "updateDeferralPeriodDays");

    if (!v32)
      SULogError(CFSTR("%s: Updates are delayed by DDM but the delay period is 0"), v36, v37, v38, v39, v40, v41, v42, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
    SULogInfo(CFSTR("%s: Updates are delayed by DDM global settings for %lu seconds"), v36, v37, v38, v39, v40, v41, v42, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
    return v32;
  }
  -[SUManagerCore managedDeviceManager](self, "managedDeviceManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "isDelayingUpdates");

  if (!v44)
  {
    SULogInfo(CFSTR("%s: device is managed. Updates are not delayed"), v45, v46, v47, v48, v49, v50, v51, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
    return 0;
  }
  -[SUManagerCore managedDeviceManager](self, "managedDeviceManager");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 86400 * objc_msgSend(v52, "delayPeriodInDays");

  if (!v32)
    SULogError(CFSTR("%s: Updates are delayed by MDM but the delay period is 0"), v53, v54, v55, v56, v57, v58, v59, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
  SULogInfo(CFSTR("%s: Updates are delayed by MDM restrictions for %lu seconds"), v53, v54, v55, v56, v57, v58, v59, (uint64_t)"-[SUManagerCore updatesDelayPeriodSeconds]");
  return v32;
}

- (BOOL)isDelayingUpdates
{
  return -[SUManagerCore updatesDelayPeriodSeconds](self, "updatesDelayPeriodSeconds") != 0;
}

- (BOOL)isSplatRollbackEnabled
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  int v12;
  __CFString *v13;
  void *v14;
  int v15;
  void *v16;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (-[SUManagerCore isManaged](self, "isManaged"))
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "disableRollback");

    if ((v11 & 1) != 0)
    {
      LOBYTE(v12) = 0;
      v13 = CFSTR("%s: Disabling Splat rollback due to SU Preference");
    }
    else
    {
      -[SUManagerCore ddmManager](self, "ddmManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "enableRapidSecurityResponseRollback");

      if (v15)
      {
        -[SUManagerCore managedDeviceManager](self, "managedDeviceManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v16, "allowSplatRollback");

        if (v12)
          v13 = CFSTR("%s: device is managed. Splat rollback is enabled");
        else
          v13 = CFSTR("%s: Splat rollback is disabled by MDM restrictions");
      }
      else
      {
        LOBYTE(v12) = 0;
        v13 = CFSTR("%s: Splat rollback is disabled by DDM global settings");
      }
    }
  }
  else
  {
    LOBYTE(v12) = 1;
    v13 = CFSTR("%s: device is not managed. Splat rollback is enabled");
  }
  SULogInfo(v13, v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerCore isSplatRollbackEnabled]");
  return v12;
}

- (BOOL)splatUpdatesAllowed
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  __CFString *v16;

  if (-[SUManagerCore isManaged](self, "isManaged"))
  {
    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "allowSplatUpdate");

    if (v11)
    {
      -[SUManagerCore ddmManager](self, "ddmManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "enableRapidSecurityResponse");

      if (v13)
      {
        -[SUManagerCore managedDeviceManager](self, "managedDeviceManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "allowSplat");

        if (v15)
          v16 = CFSTR("%s: device is managed. Splat updates are allowed");
        else
          v16 = CFSTR("%s: Splat updates are disallowed by MDM restrictions");
      }
      else
      {
        LOBYTE(v15) = 0;
        v16 = CFSTR("%s: Splat updates are disallowed by DDM global settings");
      }
    }
    else
    {
      LOBYTE(v15) = 0;
      v16 = CFSTR("%s: Splat updates are disallowed by SU preference");
    }
  }
  else
  {
    LOBYTE(v15) = 1;
    v16 = CFSTR("%s: device is not managed. Splat updates are allowed");
  }
  SULogInfo(v16, v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerCore splatUpdatesAllowed]");
  return v15;
}

- (id)delayEndDate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  return 0;
}

- (void)managedInstallRequested
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[SUManagerCore installer](self, "installer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedInstallRequested");

}

- (NSDictionary)mandatoryUpdateDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mandatorySUFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (!v5)
    return self->_mandatoryUpdateDictionary;
  v6 = (void *)MEMORY[0x24BDD17C8];
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mandatorySUFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v8, "integerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = CFSTR("SoftwareUpdateConfigurationFlags");
  v20[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Overriding mandatoryUpdateDictionary to %@"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v10);

  return (NSDictionary *)v10;
}

- (void)setMandatoryUpdateDictionary:(id)a3
{
  id *p_mandatoryUpdateDictionary;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  p_mandatoryUpdateDictionary = (id *)&self->_mandatoryUpdateDictionary;
  if (!-[NSDictionary isEqualToDictionary:](self->_mandatoryUpdateDictionary, "isEqualToDictionary:", v18))
  {
    if (!v18)
    {
      v6 = *p_mandatoryUpdateDictionary;
      *p_mandatoryUpdateDictionary = 0;
LABEL_9:

      -[SUManagerCore state](self, "state");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setMandatoryUpdateDict:", v18);

      -[SUManagerCore state](self, "state");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "save");

      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)&self->_mandatoryUpdateDictionary, a3);
      objc_msgSend(*p_mandatoryUpdateDictionary, "objectForKey:", CFSTR("DisableAutoUpdate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v6, "BOOLValue"))
          {
            SULogInfo(CFSTR("Mandatory update dictionary is disabling auto updates"), v7, v8, v9, v10, v11, v12, v13, v17);
            +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "enableAutomaticUpdateV2:", 0);

          }
        }
      }
      goto LABEL_9;
    }
  }
LABEL_10:

}

- (void)sendUnlockNotifications:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  BOOL v5;

  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__SUManagerCore_sendUnlockNotifications___block_invoke;
  v4[3] = &unk_24CE3BB60;
  v5 = a3;
  v4[4] = self;
  dispatch_async(workQueue, v4);
}

uint64_t __41__SUManagerCore_sendUnlockNotifications___block_invoke(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    return objc_msgSend(v2, "addUnlockCallback:forKey:", sel__notifyEngineOnUnlock, CFSTR("unlockCallbackEngineUnlockNotification"));
  else
    return objc_msgSend(v2, "removeUnlockCallback:", CFSTR("unlockCallbackEngineUnlockNotification"));
}

- (void)activated:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  if (a3)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __27__SUManagerCore_activated___block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resumeFromStateSemaphore);
}

void __27__SUManagerCore_activated___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "downloader");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isDownloading") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "isUpdateDownloaded"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "resetDownloadStateOnCleanActivation");

    if (v2)
    {
      SULogInfo(CFSTR("Activated to clean state when already downloading, reset download state"), v3, v4, v5, v6, v7, v8, v9, v10);
      objc_msgSend(*(id *)(a1 + 32), "setResetDownloadStateOnCleanActivation:", 0);
      objc_msgSend(*(id *)(a1 + 32), "resetDownloadState");
    }
  }
  else
  {

  }
}

- (void)downloadProgress:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__SUManagerCore_downloadProgress___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __34__SUManagerCore_downloadProgress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "downloader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadProgress:", *(_QWORD *)(a1 + 40));

}

- (void)downloadCompleted:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__SUManagerCore_downloadCompleted___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __35__SUManagerCore_downloadCompleted___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "downloader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadCompleted:", *(_QWORD *)(a1 + 40));

}

- (void)downloadCompleted:(id)a3 informClients:(BOOL)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SUManagerCore_downloadCompleted_informClients___block_invoke;
  block[3] = &unk_24CE3C498;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(workQueue, block);

}

void __49__SUManagerCore_downloadCompleted_informClients___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "downloader");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadCompleted:informClients:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

}

- (void)installCompleted:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__SUManagerCore_installCompleted___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __34__SUManagerCore_installCompleted___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "installer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installCompleted:", *(_QWORD *)(a1 + 40));

}

- (void)rollbackStarted:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SUManagerCore_rollbackStarted___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

void __33__SUManagerCore_rollbackStarted___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "rollback");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackStarted:", *(_QWORD *)(a1 + 40));

}

- (void)rollbackCompleted:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUManagerCore_rollbackCompleted_withError___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

void __45__SUManagerCore_rollbackCompleted_withError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "rollback");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackCompleted:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)assetAudienceChanged:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SUManagerCore_assetAudienceChanged___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __38__SUManagerCore_assetAudienceChanged___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  SULogInfo(CFSTR("Asset audience changed. Kicking off background scan"), a2, a3, a4, a5, a6, a7, a8, v10);
  return objc_msgSend(*(id *)(a1 + 32), "autoScanAndDownloadIfAvailable:withResult:", 0, &__block_literal_global_597);
}

void __38__SUManagerCore_assetAudienceChanged___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  v4 = a3;
  v12 = v4;
  if (v4)
    SULogInfo(CFSTR("Background scan resulted in error: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  if (v21)
  {
    objc_msgSend(v21, "preferredDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("Background scan found preferred descriptor: %@"), v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);

  }
}

- (void)keybagInterface:(id)a3 passcodeLockedStateDidChange:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *workQueue;
  uint64_t v19;
  _QWORD block[5];

  v10 = CFSTR("NO");
  if (a4)
    v10 = CFSTR("YES");
  SULogInfo(CFSTR("Device lock status changed: passcodeLocked = %@"), (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7, (uint64_t)v10);
  if (!a4)
  {
    SULogInfo(CFSTR("Device unlocked"), v11, v12, v13, v14, v15, v16, v17, v19);
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__SUManagerCore_keybagInterface_passcodeLockedStateDidChange___block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(workQueue, block);
  }
}

uint64_t __62__SUManagerCore_keybagInterface_passcodeLockedStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doUnlockEvents");
}

- (void)networkMonitorDetectOverrides
{
  id v2;

  +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detectOverriddenNetwork");

}

- (void)showInsufficientDiskSpaceFollowupForUpdate:(id)a3
{
  _BOOL4 v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = -[SUDescriptor isEqual:](self->_updateOfCurrentStorageFollowup, "isEqual:", v18);
  -[SUManagerCore followUpController](self, "followUpController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCurrentlyPresentingFollowUpType:", 3);

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v16 = *(_QWORD *)&v15;
  if (v5
    && v7
    && vabdd_f64(v15, *(double *)&showInsufficientDiskSpaceFollowupForUpdate____LAST_FOLLOWUP_TIME) <= 86400.0)
  {
    SULogInfo(CFSTR("%s: Don't show the same followup again."), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerCore showInsufficientDiskSpaceFollowupForUpdate:]");
  }
  else
  {
    objc_storeStrong((id *)&self->_updateOfCurrentStorageFollowup, a3);
    showInsufficientDiskSpaceFollowupForUpdate____LAST_FOLLOWUP_TIME = v16;
    -[SUManagerCore followUpController](self, "followUpController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postFollowUpOfType:withUpdate:userInfo:", 3, v18, 0);

  }
}

- (void)dismissInsufficientDiskSpaceFollowupForUpdate:(id)a3 orForce:(BOOL)a4
{
  SUDescriptor *updateOfCurrentStorageFollowup;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!a4 && !-[SUDescriptor isEqual:](self->_updateOfCurrentStorageFollowup, "isEqual:", v18))
  {
    -[SUDescriptor productBuildVersion](self->_updateOfCurrentStorageFollowup, "productBuildVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "productBuildVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("%s: Don't dismiss the followup. Current followup is for %@, not %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUManagerCore dismissInsufficientDiskSpaceFollowupForUpdate:orForce:]");

    goto LABEL_6;
  }
  updateOfCurrentStorageFollowup = self->_updateOfCurrentStorageFollowup;
  self->_updateOfCurrentStorageFollowup = 0;

  -[SUManagerCore followUpController](self, "followUpController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCurrentlyPresentingFollowUpType:", 3);

  if (v8)
  {
    -[SUManagerCore followUpController](self, "followUpController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissFollowUpType:", 3);
LABEL_6:

  }
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)externWorkQueue
{
  return self->_externWorkQueue;
}

- (void)setEngine:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (SUScanner)scanner
{
  return self->_scanner;
}

- (void)setScanner:(id)a3
{
  objc_storeStrong((id *)&self->_scanner, a3);
}

- (SUDownloader)downloader
{
  return self->_downloader;
}

- (void)setDownloader:(id)a3
{
  objc_storeStrong((id *)&self->_downloader, a3);
}

- (SUInstaller)installer
{
  return self->_installer;
}

- (void)setInstaller:(id)a3
{
  objc_storeStrong((id *)&self->_installer, a3);
}

- (SURollbackController)rollback
{
  return self->_rollback;
}

- (void)setRollback:(id)a3
{
  objc_storeStrong((id *)&self->_rollback, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (NSString)potentialNextSessionID
{
  return self->_potentialNextSessionID;
}

- (void)setPotentialNextSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_potentialNextSessionID, a3);
}

- (NSMutableDictionary)unlockCallbacks
{
  return self->_unlockCallbacks;
}

- (void)setFollowUpController:(id)a3
{
  objc_storeStrong((id *)&self->_followUpController, a3);
}

- (SUCoreEventReporter)coreReporter
{
  return self->_coreReporter;
}

- (void)setCoreReporter:(id)a3
{
  objc_storeStrong((id *)&self->_coreReporter, a3);
}

- (BOOL)resetDownloadStateOnCleanActivation
{
  return self->_resetDownloadStateOnCleanActivation;
}

- (void)setResetDownloadStateOnCleanActivation:(BOOL)a3
{
  self->_resetDownloadStateOnCleanActivation = a3;
}

- (void)setIsUpdateDownloaded:(BOOL)a3
{
  self->_isUpdateDownloaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateOfCurrentStorageFollowup, 0);
  objc_storeStrong((id *)&self->_resumeFromStateSemaphore, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_coreReporter, 0);
  objc_storeStrong((id *)&self->_externWorkQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_lastStashbagPersistedDate, 0);
  objc_storeStrong((id *)&self->_potentialNextSessionID, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_mandatoryUpdateDictionary, 0);
  objc_storeStrong((id *)&self->_managedDeviceManager, 0);
  objc_storeStrong((id *)&self->_unlockCallbacks, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_rollback, 0);
  objc_storeStrong((id *)&self->_installer, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
