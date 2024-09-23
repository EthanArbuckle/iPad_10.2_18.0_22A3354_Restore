@implementation SUDDMManager

+ (id)statePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;

  +[SUUtility systemContainerURL](SUUtility, "systemContainerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v2, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      SULogInfo(CFSTR("Failed to create state file path"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v14);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SUDDMManager)initWithDelegate:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SUDDMManager *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *workQueue;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *gsWorkQueue;
  uint64_t v20;
  SUCoreDDMActivityScheduler *evaluationScheduler;
  SUCorePolicyDDMConfiguration *ddmConfiguration;
  SUCoreDDMDeclaration *activeDeclarationEnforcedSU;
  SUCoreDDMDeclarationGlobalSettings *globalSettings;
  SUDDMManager *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  void *v35;
  objc_super v36;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("was called"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager initWithDelegate:]");

  if (v5)
  {
    v36.receiver = self;
    v36.super_class = (Class)SUDDMManager;
    v13 = -[SUDDMManager init](&v36, sel_init);
    if (v13)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = dispatch_queue_create("com.apple.softwareupdateservices.ddmWorkQueue", v14);
      workQueue = v13->_workQueue;
      v13->_workQueue = (OS_dispatch_queue *)v15;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = dispatch_queue_create("com.apple.softwareupdateservices.ddmWorkQueue.gs", v17);
      gsWorkQueue = v13->_gsWorkQueue;
      v13->_gsWorkQueue = (OS_dispatch_queue *)v18;

      objc_storeStrong((id *)&v13->_managerServerDelegate, a3);
      v20 = objc_msgSend(objc_alloc(MEMORY[0x24BEAE7F0]), "initWithDelegate:options:", v13, &unk_24CE6E2F0);
      evaluationScheduler = v13->_evaluationScheduler;
      v13->_evaluationScheduler = (SUCoreDDMActivityScheduler *)v20;

      ddmConfiguration = v13->_ddmConfiguration;
      v13->_ddmConfiguration = 0;

      activeDeclarationEnforcedSU = v13->_activeDeclarationEnforcedSU;
      v13->_activeDeclarationEnforcedSU = 0;

      globalSettings = v13->_globalSettings;
      v13->_globalSettings = 0;

    }
    self = v13;
    v25 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SUDDMManager failed to initiate as first call to sharedManager was made without a server delegate"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v26, v27, v28, v29, v30, v31, v32, (uint64_t)"-[SUDDMManager initWithDelegate:]");

    v25 = 0;
  }

  return v25;
}

- (void)resumeOrResetStateIfNecessary
{
  NSObject *workQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUDDMManager_resumeOrResetStateIfNecessary__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __45__SUDDMManager_resumeOrResetStateIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("was called"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUDDMManager resumeOrResetStateIfNecessary]_block_invoke");

  objc_msgSend((id)objc_opt_class(), "statePath");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("_ddmConfiguration persistence path: %@"), v50, v47);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUDDMManager resumeOrResetStateIfNecessary]_block_invoke");

  v17 = objc_msgSend(objc_alloc(MEMORY[0x24BEAE830]), "initWithStatePersistencePath:", v50);
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 48);
  *(_QWORD *)(v18 + 48) = v17;

  v20 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(v20, "activeDeclarationKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "declarationForKey:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "download");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Current active declaration = %@; current download = \n%@"),
    v22,
    v24);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v25, v26, v27, v28, v29, v30, v31, (uint64_t)"-[SUDDMManager resumeOrResetStateIfNecessary]_block_invoke");

  if (v22
    && (objc_msgSend(v24, "descriptor"),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v33 = objc_msgSend(v32, "isRelevantToDeclaration:", v22),
        v32,
        v33))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v22);
    objc_msgSend(v24, "descriptor");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(a1 + 32);
    v36 = *(void **)(v35 + 40);
    *(_QWORD *)(v35 + 40) = v34;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Found declaration %@ and corresponding update %@ from state"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v37, v38, v39, v40, v41, v42, v43, (uint64_t)"-[SUDDMManager resumeOrResetStateIfNecessary]_block_invoke");

    objc_msgSend(*(id *)(a1 + 32), "_notifyUI:", v22);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_evaluateDeclarationsWithNewDeclaration:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "currentGlobalSettingsDeclaration");
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = *(_QWORD *)(a1 + 32);
  v46 = *(void **)(v45 + 72);
  *(_QWORD *)(v45 + 72) = v44;

}

- (BOOL)isManagedByDDM
{
  return -[SUCorePolicyDDMConfiguration hasManagedConfigurations](self->_ddmConfiguration, "hasManagedConfigurations");
}

- (id)manager
{
  SUManagerInterface *manager;
  SUManagerInterface *v4;
  SUManagerInterface *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  manager = self->_manager;
  if (!manager)
  {
    +[SUManagerInterfaceFactory sharedInstance](SUManagerInterfaceFactory, "sharedInstance");
    v4 = (SUManagerInterface *)objc_claimAutoreleasedReturnValue();
    v5 = self->_manager;
    self->_manager = v4;

    -[SUManagerInterface addObserver:](self->_manager, "addObserver:", self);
    manager = self->_manager;
  }
  return manager;
}

- (void)_notifyUI:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sending %@ to UI"), v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager _notifyUI:]");

    -[SUManagerDelegate sendDDMDeclarationToUI:](self->_managerServerDelegate, "sendDDMDeclarationToUI:", v12);
  }

}

- (void)_setActiveDeclaration:(id)a3
{
  SUCorePolicyDDMConfiguration *ddmConfiguration;
  void *v5;
  SUCoreDDMDeclaration *v6;
  void *activeDeclarationEnforcedSU;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  ddmConfiguration = self->_ddmConfiguration;
  objc_msgSend(v15, "declarationKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(ddmConfiguration) = -[SUCorePolicyDDMConfiguration setActiveDeclarationKey:](ddmConfiguration, "setActiveDeclarationKey:", v5);

  if ((_DWORD)ddmConfiguration)
  {
    v6 = (SUCoreDDMDeclaration *)v15;
    activeDeclarationEnforcedSU = self->_activeDeclarationEnforcedSU;
    self->_activeDeclarationEnforcedSU = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to set %@ as active; it must not be valid!!!"),
      v15);
    activeDeclarationEnforcedSU = (void *)objc_claimAutoreleasedReturnValue();
    SULogError(CFSTR("[DDM] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUDDMManager _setActiveDeclaration:]");
  }

}

- (id)_scanForUpdateForDeclaration:(id)a3 retryIfNecessary:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
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
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  SUDDMManager *v98;
  id v99;
  _QWORD v100[4];
  NSObject *v101;
  uint64_t *v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;

  v6 = a3;
  v98 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Don't scan for a null declaration"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v29, v30, v31, v32, v33, v34, v35, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

    v36 = 0;
    goto LABEL_21;
  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setClientName:", CFSTR("com.apple.SoftwareUpdateServices.DDM"));
  objc_msgSend(v7, "setIdentifier:", CFSTR("com.apple.SoftwareUpdateServices.DDM"));
  objc_msgSend(v7, "setForced:", 1);
  objc_msgSend(v7, "setScanType:", 2);
  objc_msgSend(v6, "versionString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRequestedPMV:", v8);

  v99 = v6;
  objc_msgSend(v6, "buildVersionString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRequestedBuild:", v9);

  objc_msgSend(v7, "setMDMUseDelayPeriod:", 0);
  objc_msgSend(v7, "setMDMSoftwareUpdatePath:", 0);
  objc_msgSend(v7, "setMDMShowRapidSecurityResponse:", 1);
  v10 = dispatch_semaphore_create(0);
  v110 = 0;
  v111 = &v110;
  v112 = 0x3032000000;
  v113 = __Block_byref_object_copy__1;
  v114 = __Block_byref_object_dispose__1;
  v115 = 0;
  v104 = 0;
  v105 = &v104;
  v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__1;
  v108 = __Block_byref_object_dispose__1;
  v11 = a4 + 1;
  v109 = 0;
  v12 = MEMORY[0x24BDAC760];
  while (1)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Scanning for update for DDM declaration %@"), v99, v91);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

    -[SUDDMManager manager](v98, "manager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = v12;
    v100[1] = 3221225472;
    v100[2] = __62__SUDDMManager__scanForUpdateForDeclaration_retryIfNecessary___block_invoke;
    v100[3] = &unk_24CE3BBB0;
    v102 = &v110;
    v103 = &v104;
    v21 = v10;
    v101 = v21;
    objc_msgSend(v20, "scanForUpdates:shouldUseDDMInState:complete:", v7, 0, v100);

    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    if (!v105[5])
      break;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Scan hit an error %@, retrying in 5s: %d"), v105[5], (v11 - 2));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v22, v23, v24, v25, v26, v27, v28, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 5.0);
    if (--v11 <= 1)
      goto LABEL_16;
  }
  objc_msgSend((id)v111[5], "preferredDescriptor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    objc_msgSend((id)v111[5], "preferredDescriptor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isRelevantToDeclaration:", v99);

    if (v39)
    {
      objc_msgSend((id)v111[5], "preferredDescriptor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Picked preferred descriptor from scan results"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("[DDM] %s: %@"), v41, v42, v43, v44, v45, v46, v47, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");
      goto LABEL_13;
    }
  }
  objc_msgSend((id)v111[5], "alternateDescriptor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    objc_msgSend((id)v111[5], "alternateDescriptor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "isRelevantToDeclaration:", v99);

    if (v50)
    {
      objc_msgSend((id)v111[5], "alternateDescriptor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Picked alternate descriptor from scan results"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("[DDM] %s: %@"), v51, v52, v53, v54, v55, v56, v57, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");
LABEL_13:

      if (v36)
      {
        v58 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v36, "humanReadableUpdateName");
        v6 = v99;
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "stringWithFormat:", CFSTR("Update found for DDM declaration %@: %@ [%p]"), v99, v59, v36);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("[DDM] %s: %@"), v60, v61, v62, v63, v64, v65, v66, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

        goto LABEL_20;
      }
      goto LABEL_16;
    }
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Scan didn't find anything relevant; don't retry"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v67, v68, v69, v70, v71, v72, v73, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

LABEL_16:
  v6 = v99;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No update found for DDM declaration %@ with error %@"), v99, v105[5]);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v74, v75, v76, v77, v78, v79, v80, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

  if (v105[5])
  {
    +[SUState currentState](SUState, "currentState");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v105[5], "description");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setDdmPersistedErrorDescription:", v82);

    if (!-[SUDDMManager _nonFatalScanError:](v98, "_nonFatalScanError:", v105[5]))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The last scan error %@ is fatal, notifying the status channel."), v105[5], v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("[DDM] %s: %@"), v83, v84, v85, v86, v87, v88, v89, (uint64_t)"-[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:]");

      notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEAE8B8], "UTF8String"));
    }
  }
  v36 = 0;
LABEL_20:
  _Block_object_dispose(&v104, 8);

  _Block_object_dispose(&v110, 8);
LABEL_21:

  return v36;
}

void __62__SUDDMManager__scanForUpdateForDeclaration_retryIfNecessary___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)_nonFatalScanError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.softwareupdateservices.errors")))
      v6 = objc_msgSend(v4, "code") == 3 || objc_msgSend(v4, "code") == 105 || objc_msgSend(v4, "code") == 22;
    else
      v6 = 0;

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)_evaluateAllDeclarations
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  SUDescriptor *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  SUDescriptor *descriptor;
  SUDescriptor *v44;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Let's evaluate all declaraions!"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUDDMManager _evaluateAllDeclarations]");

  v10 = (id)-[SUCorePolicyDDMConfiguration invalidateAllInvalidDeclarationsReturningAllInvalid](self->_ddmConfiguration, "invalidateAllInvalidDeclarationsReturningAllInvalid");
  -[SUCorePolicyDDMConfiguration allDeclarations](self->_ddmConfiguration, "allDeclarations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "count"))
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v50;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v50 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          -[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:](self, "_scanForUpdateForDeclaration:retryIfNecessary:", v18, 3);
          v19 = (SUDescriptor *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Update found! Let's enforce %@"), v18, v46);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            SULogInfo(CFSTR("[DDM] %s: %@"), v36, v37, v38, v39, v40, v41, v42, (uint64_t)"-[SUDDMManager _evaluateAllDeclarations]");

            v27 = v18;
            goto LABEL_15;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No updates found... Let's skip %@"), v18, v46);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          SULogInfo(CFSTR("[DDM] %s: %@"), v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[SUDDMManager _evaluateAllDeclarations]");

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
        if (v15)
          continue;
        break;
      }
      v19 = 0;
      v27 = 0;
    }
    else
    {
      v19 = 0;
      v27 = 0;
    }
LABEL_15:

    -[SUDDMManager _setActiveDeclaration:](self, "_setActiveDeclaration:", v27);
    descriptor = self->_descriptor;
    self->_descriptor = v19;
    v44 = v19;

    v35 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No declarations in configuration %@"), self->_ddmConfiguration, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[SUDDMManager _evaluateAllDeclarations]");

    -[SUDDMManager _setActiveDeclaration:](self, "_setActiveDeclaration:", 0);
    v35 = 0;
  }

  return v35;
}

- (void)_evaluateDeclarationsWithNewDeclaration:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SUCoreDDMDeclaration *v11;
  SUDescriptor *v12;
  SUDescriptor *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
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
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  SUDescriptor *v50;
  void *descriptor;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BOOL4 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  SUCoreDDMDeclaration *v74;
  SUDescriptor *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  SUCoreDDMActivityScheduler *evaluationScheduler;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;

  v101 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("was called"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");

  v11 = self->_activeDeclarationEnforcedSU;
  v12 = self->_descriptor;
  v13 = v12;
  v14 = 0;
  if (v11 && v12)
    v14 = -[SUDescriptor isRelevantToDeclaration:](v12, "isRelevantToDeclaration:", v11);
  v15 = 0;
  v16 = v101;
  if (v101 && v11)
  {
    objc_msgSend(v101, "enforcedInstallDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDDMDeclaration enforcedInstallDate](v11, "enforcedInstallDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v17, "compare:", v18) == -1;

    v16 = v101;
  }
  if (v14)
  {
    objc_msgSend(v16, "declarationKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDDMDeclaration declarationKey](v11, "declarationKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToString:", v20);

    if (!v21)
    {
      if (v15)
      {
        -[SUDDMManager _scanForUpdateForDeclaration:retryIfNecessary:](self, "_scanForUpdateForDeclaration:retryIfNecessary:", v101, 3);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (v42)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Update found for the new declaration %@; let's enforce it!"),
            v101,
            v94);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          SULogInfo(CFSTR("[DDM] %s: %@"), v43, v44, v45, v46, v47, v48, v49, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");

          -[SUDDMManager _setActiveDeclaration:](self, "_setActiveDeclaration:", v101);
          v50 = v42;
          descriptor = self->_descriptor;
          self->_descriptor = v50;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Nothing found for the new declaration %@; let's keep the original one."),
            v101,
            v94);
          descriptor = (void *)objc_claimAutoreleasedReturnValue();
          SULogInfo(CFSTR("[DDM] %s: %@"), v67, v68, v69, v70, v71, v72, v73, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Current declaration is good and the new declaration isn't more urgent. Don't evaluate this time."));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("[DDM] %s: %@"), v60, v61, v62, v63, v64, v65, v66, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");
      }

      goto LABEL_21;
    }
    v22 = (void *)MEMORY[0x24BEAEA28];
    -[SUCoreDDMDeclaration versionString](v11, "versionString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "versionString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "stringIsEqual:to:", v23, v24))
    {
      v25 = (void *)MEMORY[0x24BEAEA28];
      -[SUCoreDDMDeclaration buildVersionString](v11, "buildVersionString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "buildVersionString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v25) = objc_msgSend(v25, "stringIsEqual:to:", v26, v27);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Current declaration changed from %@ to %@"), v11, v101);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("[DDM] %s: %@"), v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");

      if ((v25 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No target versions changed; no need to re-evaluate"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("[DDM] %s: %@"), v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");

        -[SUDDMManager _setActiveDeclaration:](self, "_setActiveDeclaration:", v101);
LABEL_21:
        v59 = 1;
        goto LABEL_22;
      }
    }
    else
    {

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Current declaration changed from %@ to %@"), v11, v101);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("[DDM] %s: %@"), v52, v53, v54, v55, v56, v57, v58, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");

    }
  }
  v59 = -[SUDDMManager _evaluateAllDeclarations](self, "_evaluateAllDeclarations");
LABEL_22:
  v74 = self->_activeDeclarationEnforcedSU;

  v75 = self->_descriptor;
  v76 = (void *)MEMORY[0x24BDD17C8];
  -[SUDescriptor humanReadableUpdateName](v75, "humanReadableUpdateName");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "stringWithFormat:", CFSTR("declarationToEnforce = %@, updateForDeclaration = %@ [%p]"), v74, v77, v75);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v78, v79, v80, v81, v82, v83, v84, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");

  -[SUCoreDDMActivityScheduler disarmActivityScheduler](self->_evaluationScheduler, "disarmActivityScheduler");
  if (v74 && v75)
  {
    -[SUDDMManager _initiateDownloadWithDescriptor:](self, "_initiateDownloadWithDescriptor:", v75);
  }
  else if (v59)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to find any updates for declarations; will re-evaluate later"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v85, v86, v87, v88, v89, v90, v91, (uint64_t)"-[SUDDMManager _evaluateDeclarationsWithNewDeclaration:]");

    evaluationScheduler = self->_evaluationScheduler;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 21600.0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDDMActivityScheduler armActivitySchedulerWithDate:](evaluationScheduler, "armActivitySchedulerWithDate:", v93);

  }
  -[SUDDMManager _notifyUI:](self, "_notifyUI:", v74);

}

- (void)_initiateDownloadWithDescriptor:(id)a3
{
  id v4;
  void *v5;
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
  SUDownloadOptions *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "humanReadableUpdateName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Downloading: %@ [%p]"), v6, v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUDDMManager _initiateDownloadWithDescriptor:]");

  if (v4)
  {
    -[SUDDMManager manager](self, "manager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "download");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[SUDDMManager _handleExistingDownload:](self, "_handleExistingDownload:", v4);
    }
    else
    {
      v16 = -[SUDownloadOptions initWithDescriptor:]([SUDownloadOptions alloc], "initWithDescriptor:", v4);
      -[SUDownloadOptions setAutoDownload:](v16, "setAutoDownload:", 0);
      -[SUDownloadOptions setDownloadOnly:](v16, "setDownloadOnly:", 1);
      -[SUDDMManager manager](self, "manager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __48__SUDDMManager__initiateDownloadWithDescriptor___block_invoke;
      v19[3] = &unk_24CE3BBD8;
      v19[4] = self;
      v20 = v4;
      objc_msgSend(v17, "startDownloadWithOptions:withResult:", v16, v19);

    }
  }

}

uint64_t __48__SUDDMManager__initiateDownloadWithDescriptor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_downloadRequestCompletedWithStatus:error:withDescriptor:", a2, a3, *(_QWORD *)(a1 + 40));
}

- (void)_handleExistingDownload:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v38 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v38)
  {
    -[SUDDMManager manager](self, "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "download");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v38, "isEqual:", v6);

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The current download is what we want."));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("[DDM] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUDDMManager _handleExistingDownload:]");

      -[SUDDMManager manager](self, "manager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isDownloading");

      if (v16)
      {
        -[SUDDMManager manager](self, "manager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "download");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "downloadOptions");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[SUCoreDDMDeclaration isInstallOverdue](self->_activeDeclarationEnforcedSU, "isInstallOverdue")&& ((objc_msgSend(v19, "isAutoDownload") & 1) != 0 || objc_msgSend(v19, "isDownloadOnly")))
        {
          objc_msgSend(v19, "setAutoDownload:", 0);
          objc_msgSend(v19, "setDownloadOnly:", 0);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Overdue. Promoting download and allowing countdown alert"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          SULogInfo(CFSTR("[DDM] %s: %@"), v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[SUDDMManager _handleExistingDownload:]");

          -[SUDDMManager manager](self, "manager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "updateDownloadOptions:withResult:", v19, &__block_literal_global_2);

        }
      }
    }
    else
    {
      -[SUDDMManager _cancelCurrentDownloadAndDownload:](self, "_cancelCurrentDownloadAndDownload:", v38);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannnot handle existing download for a null update"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v28, v29, v30, v31, v32, v33, v34, (uint64_t)"-[SUDDMManager _handleExistingDownload:]");

  }
}

void __40__SUDDMManager__handleExistingDownload___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("updateDownloadOptions finished (result: %d ; error: %@)"),
    a2,
    a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUDDMManager _handleExistingDownload:]_block_invoke");

}

- (void)_cancelCurrentDownloadAndDownload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  SUDDMManager *v18;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "humanReadableUpdateName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Canceling the current download to download %@ [%p]"), v6, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUDDMManager _cancelCurrentDownloadAndDownload:]");

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __50__SUDDMManager__cancelCurrentDownloadAndDownload___block_invoke;
  v16[3] = &unk_24CE3BBD8;
  v17 = v4;
  v18 = self;
  v14 = v4;
  -[SUDDMManager _purgeDownloadWithHandler:](self, "_purgeDownloadWithHandler:", v16);

}

uint64_t __50__SUDDMManager__cancelCurrentDownloadAndDownload___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "_initiateDownloadWithDescriptor:");
  return result;
}

- (void)_purgeDownloadWithHandler:(id)a3
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
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setUserRequested:", 0);
  objc_msgSend(v5, "setNotifyUser:", 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Purging download with options %@"), v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager _purgeDownloadWithHandler:]");

  -[SUDDMManager manager](self, "manager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __42__SUDDMManager__purgeDownloadWithHandler___block_invoke;
  v16[3] = &unk_24CE3BC68;
  v16[4] = self;
  v17 = v4;
  v14 = v4;
  objc_msgSend(v13, "purgeDownloadWithOptions:withResult:", v5, v16);

}

void __42__SUDDMManager__purgeDownloadWithHandler___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  char v20;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Download was purged (result: %d; error: %@)"), a2, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager _purgeDownloadWithHandler:]_block_invoke");

  v13 = *(void **)(a1 + 40);
  v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SUDDMManager__purgeDownloadWithHandler___block_invoke_2;
  block[3] = &unk_24CE3BC40;
  v20 = a2;
  v18 = v5;
  v19 = v13;
  v15 = v5;
  dispatch_async(v14, block);

}

uint64_t __42__SUDDMManager__purgeDownloadWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_downloadRequestCompletedWithStatus:(BOOL)a3 error:(id)a4 withDescriptor:(id)a5
{
  id v8;
  id v9;
  NSObject *workQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  SUDDMManager *v15;
  id v16;
  BOOL v17;

  v8 = a4;
  v9 = a5;
  workQueue = self->_workQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__SUDDMManager__downloadRequestCompletedWithStatus_error_withDescriptor___block_invoke;
  v13[3] = &unk_24CE3BC90;
  v17 = a3;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(workQueue, v13);

}

void __73__SUDDMManager__downloadRequestCompletedWithStatus_error_withDescriptor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
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
  void *v22;
  void *v23;
  void *v24;
  id v25;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Download started with result %d. Error: %@"), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUDDMManager _downloadRequestCompletedWithStatus:error:withDescriptor:]_block_invoke");

  v9 = *(void **)(a1 + 32);
  if (v9)
  {
    if (objc_msgSend(v9, "code") == 41)
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v10, "manager");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "download");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "downloadDidFinish:withInstallPolicy:", v11, 0);

LABEL_12:
      return;
    }
    v12 = *(void **)(a1 + 32);
    if (v12 && objc_msgSend(v12, "code") == 11)
    {
      objc_msgSend(*(id *)(a1 + 40), "_handleExistingDownload:", *(_QWORD *)(a1 + 48));
      return;
    }
  }
  if (!*(_BYTE *)(a1 + 56) || *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Download failed to start  :_( (see error above)"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUDDMManager _downloadRequestCompletedWithStatus:error:withDescriptor:]_block_invoke");

    notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEAE8C0], "UTF8String"));
    v20 = *(_QWORD *)(a1 + 32);
    +[SUState currentState](SUState, "currentState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v21;
    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setDdmPersistedErrorDescription:", v22);

      notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEAE8B8], "UTF8String"));
      return;
    }
    objc_msgSend(v21, "setDdmPersistedError:", 0);
    goto LABEL_12;
  }
}

- (void)_handleScanResults:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  SUCoreDDMDeclaration *v7;
  SUDescriptor *v8;
  SUDescriptor *v9;
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
  id v25;
  void *v26;
  uint64_t (**v27)(_QWORD, _QWORD, _QWORD);
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
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
  void *v48;
  SUCoreDDMDeclaration *v49;
  SUDescriptor *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  objc_msgSend(v4, "preferredDescriptor");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternateDescriptor");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 | v6)
  {
    v7 = self->_activeDeclarationEnforcedSU;
    v8 = self->_descriptor;
    v9 = v8;
    if (v7 && v8 && -[SUDescriptor isRelevantToDeclaration:](v8, "isRelevantToDeclaration:", v7))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Current declaration is good, nothing to do here"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("[DDM] %s: %@"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[SUDDMManager _handleScanResults:]");
    }
    else
    {
      v25 = (id)-[SUCorePolicyDDMConfiguration invalidateAllInvalidDeclarationsReturningAllInvalid](self->_ddmConfiguration, "invalidateAllInvalidDeclarationsReturningAllInvalid");
      -[SUCorePolicyDDMConfiguration allDeclarations](self->_ddmConfiguration, "allDeclarations");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v26;
      if (v26 && objc_msgSend(v26, "count"))
      {
        v50 = v9;
        v55[0] = MEMORY[0x24BDAC760];
        v55[1] = 3221225472;
        v55[2] = __35__SUDDMManager__handleScanResults___block_invoke;
        v55[3] = &unk_24CE3BCB8;
        v55[4] = self;
        v27 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x212BF6094](v55);
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v28 = v10;
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v52;
          v49 = v7;
          while (2)
          {
            for (i = 0; i != v30; ++i)
            {
              if (*(_QWORD *)v52 != v31)
                objc_enumerationMutation(v28);
              v33 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
              if ((v27[2](v27, v33, v5) & 1) != 0 || (v27[2](v27, v33, v6) & 1) != 0)
              {
                v7 = v49;
                goto LABEL_21;
              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
            v7 = v49;
            if (v30)
              continue;
            break;
          }
        }

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Nothing relevant found..."));
        v28 = (id)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("[DDM] %s: %@"), v34, v35, v36, v37, v38, v39, v40, (uint64_t)"-[SUDDMManager _handleScanResults:]");
LABEL_21:

        v9 = v50;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No declarations available, nothing to do here"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("[DDM] %s: %@"), v41, v42, v43, v44, v45, v46, v47, (uint64_t)"-[SUDDMManager _handleScanResults:]");

      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No descriptors available"));
    v7 = (SUCoreDDMDeclaration *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v18, v19, v20, v21, v22, v23, v24, (uint64_t)"-[SUDDMManager _handleScanResults:]");
  }

}

uint64_t __35__SUDDMManager__handleScanResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "isRelevantToDeclaration:", v5);
  if ((_DWORD)v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "humanReadableUpdateName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Update found for declaration: %@ [%p], %@"), v9, v6, v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)"-[SUDDMManager _handleScanResults:]_block_invoke");

    objc_msgSend(*(id *)(a1 + 32), "_setActiveDeclaration:", v5);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), a3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "disarmActivityScheduler");
    objc_msgSend(*(id *)(a1 + 32), "_initiateDownloadWithDescriptor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  }

  return v7;
}

- (BOOL)handleDDMDeclaration:(id)a3 outError:(id *)a4
{
  id v6;
  NSObject *workQueue;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  SUDDMManager *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  workQueue = self->_workQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__SUDDMManager_handleDDMDeclaration_outError___block_invoke;
  v11[3] = &unk_24CE3BCE0;
  v8 = v6;
  v14 = &v16;
  v15 = &v22;
  v12 = v8;
  v13 = self;
  dispatch_sync(workQueue, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v9 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __46__SUDDMManager_handleDDMDeclaration_outError___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD block[5];
  id v30;
  id v31;

  v2 = (void *)a1[4];
  if (v2)
  {
    v3 = *(void **)(a1[5] + 48);
    objc_msgSend(v2, "dictionaryRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1[6] + 8);
    v31 = *(id *)(v5 + 40);
    LOBYTE(v3) = objc_msgSend(v3, "addDeclaration:returningError:", v4, &v31);
    objc_storeStrong((id *)(v5 + 40), v31);
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = (_BYTE)v3;

    if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
      v6 = CFSTR("SUCCESS");
    else
      v6 = CFSTR("FAILURE");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Handled declaration %@: %@"), a1[4], v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUDDMManager handleDDMDeclaration:outError:]_block_invoke");

    if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
      v15 = (void *)a1[4];
      v14 = a1[5];
      v16 = *(NSObject **)(v14 + 8);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__SUDDMManager_handleDDMDeclaration_outError___block_invoke_2;
      block[3] = &unk_24CE3B610;
      block[4] = v14;
      v30 = v15;
      dispatch_async(v16, block);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to handle null declaration"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUDDMManager handleDDMDeclaration:outError:]_block_invoke");

    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 22);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1[6] + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

  }
}

uint64_t __46__SUDDMManager_handleDDMDeclaration_outError___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateDeclarationsWithNewDeclaration:", *(_QWORD *)(a1 + 40));
}

- (BOOL)cancelDDMDeclarationForKey:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *workQueue;
  char v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD block[5];
  id v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v6 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("About to cancel the declaration for key: %@"), v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)"-[SUDDMManager cancelDDMDeclarationForKey:outError:]");

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__1;
  v40 = __Block_byref_object_dispose__1;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  if (!v6)
  {
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 22);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v37[5];
    v37[5] = v17;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot cancel: key is nil"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v19, v20, v21, v22, v23, v24, v25, (uint64_t)"-[SUDDMManager cancelDDMDeclarationForKey:outError:]");

    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__SUDDMManager_cancelDDMDeclarationForKey_outError___block_invoke;
  block[3] = &unk_24CE3BD30;
  block[4] = self;
  v29 = v6;
  v30 = &v36;
  v31 = &v32;
  dispatch_sync(workQueue, block);

  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease((id)v37[5]);
LABEL_4:
  v15 = *((_BYTE *)v33 + 24);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v15;
}

void __52__SUDDMManager_cancelDDMDeclarationForKey_outError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
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
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD block[5];
  _QWORD v51[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "declarationForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeDeclarationForKey:", *(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      if (objc_msgSend(v2, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64)))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The current active declaration was canceled, re-evaluate the declarations"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("[DDM] %s: %@"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUDDMManager cancelDDMDeclarationForKey:outError:]_block_invoke");

        objc_msgSend(*(id *)(a1 + 32), "_setActiveDeclaration:", 0);
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(v10 + 40);
        *(_QWORD *)(v10 + 40) = 0;

        objc_msgSend(*(id *)(a1 + 32), "manager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "download");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "descriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isRelevantToDeclaration:", v2);

        if (v15)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The current download is relevant to the canceled declaration; purge it"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          SULogInfo(CFSTR("[DDM] %s: %@"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[SUDDMManager cancelDDMDeclarationForKey:outError:]_block_invoke");

          v23 = *(void **)(a1 + 32);
          v51[0] = MEMORY[0x24BDAC760];
          v51[1] = 3221225472;
          v51[2] = __52__SUDDMManager_cancelDDMDeclarationForKey_outError___block_invoke_2;
          v51[3] = &unk_24CE3BD08;
          v51[4] = v23;
          objc_msgSend(v23, "_purgeDownloadWithHandler:", v51);
        }
        else
        {
          v44 = *(_QWORD *)(a1 + 32);
          v45 = *(NSObject **)(v44 + 8);
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __52__SUDDMManager_cancelDDMDeclarationForKey_outError___block_invoke_3;
          block[3] = &unk_24CE3B5C0;
          block[4] = v44;
          dispatch_async(v45, block);
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to remove declaration for key %@ from %@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      SULogInfo(CFSTR("[DDM] %s: %@"), v34, v35, v36, v37, v38, v39, v40, (uint64_t)"-[SUDDMManager cancelDDMDeclarationForKey:outError:]_block_invoke");

      +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", -1);
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v43 = *(void **)(v42 + 40);
      *(_QWORD *)(v42 + 40) = v41;

    }
  }
  else
  {
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 102);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot cancel: key is unknown"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v27, v28, v29, v30, v31, v32, v33, (uint64_t)"-[SUDDMManager cancelDDMDeclarationForKey:outError:]_block_invoke");

  }
}

uint64_t __52__SUDDMManager_cancelDDMDeclarationForKey_outError___block_invoke_2(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateDeclarationsWithNewDeclaration:", 0);
}

uint64_t __52__SUDDMManager_cancelDDMDeclarationForKey_outError___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateDeclarationsWithNewDeclaration:", 0);
}

- (id)allDeclarations
{
  NSObject *workQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  workQueue = self->_workQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__SUDDMManager_allDeclarations__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(workQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__SUDDMManager_allDeclarations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allDeclarationsIncludingInvalid");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)scanRequestDidFinishForOptions:(id)a3 results:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *workQueue;
  uint64_t v21;
  void *v22;
  _QWORD block[5];
  id v24;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Scan failed with error %@"), a5);
LABEL_7:
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUDDMManager scanRequestDidFinishForOptions:results:error:]");

    goto LABEL_8;
  }
  objc_msgSend(v8, "clientName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.SoftwareUpdateServices.DDM")))
  {

LABEL_6:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Scan triggered by ddm, nothing to do here"), v21);
    goto LABEL_7;
  }
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.SoftwareUpdateServices.DDM"));

  if (v12)
    goto LABEL_6;
  if (v9)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__SUDDMManager_scanRequestDidFinishForOptions_results_error___block_invoke;
    block[3] = &unk_24CE3B610;
    block[4] = self;
    v24 = v9;
    dispatch_async(workQueue, block);

  }
LABEL_8:

}

uint64_t __61__SUDDMManager_scanRequestDidFinishForOptions_results_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleScanResults:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_notifyUI:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)getDescriptorWithCallback:(id)a3
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
  v7[2] = __42__SUDDMManager_getDescriptorWithCallback___block_invoke;
  v7[3] = &unk_24CE3BD58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

uint64_t __42__SUDDMManager_getDescriptorWithCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  return result;
}

- (void)postDownloadEventWithDownload:(id)a3 withInstallPolicy:(id)a4
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
  block[2] = __64__SUDDMManager_postDownloadEventWithDownload_withInstallPolicy___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(workQueue, block);

}

void __64__SUDDMManager_postDownloadEventWithDownload_withInstallPolicy___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
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
  uint64_t v29;
  uint64_t v30;
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
  void *v41;
  id v42;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("was called"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v2, v3, v4, v5, v6, v7, v8, (uint64_t)"-[SUDDMManager postDownloadEventWithDownload:withInstallPolicy:]_block_invoke");

  v42 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v10 = v9;
  if (v42)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No need to do anything: current declaration: %@, current update to download: %@"), v42, v9);
LABEL_12:
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v30, v31, v32, v33, v34, v35, v36, (uint64_t)"-[SUDDMManager postDownloadEventWithDownload:withInstallPolicy:]_block_invoke");

    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 40), "descriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v10);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_cancelCurrentDownloadAndDownload:", v10);
    goto LABEL_13;
  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v42, "enforcedInstallDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("enforcedInstallDate is: %@"), v15, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[SUDDMManager postDownloadEventWithDownload:withInstallPolicy:]_block_invoke");

  if (!objc_msgSend(v42, "isInstallOverdue"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Not past enforced install date. We'll wait for timer to fire"), v37, v39);
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Triggerring installation"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v23, v24, v25, v26, v27, v28, v29, (uint64_t)"-[SUDDMManager postDownloadEventWithDownload:withInstallPolicy:]_block_invoke");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "managedInstallationRequested:", *(_QWORD *)(a1 + 48));
LABEL_13:

}

- (id)activeDDMDeclarationEnfrocedSU
{
  NSObject *workQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = self->_workQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__SUDDMManager_activeDDMDeclarationEnfrocedSU__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(workQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __46__SUDDMManager_activeDDMDeclarationEnfrocedSU__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)getActiveDDMDeclarationEnforcedSUWithResponse:(id)a3
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
  v7[2] = __62__SUDDMManager_getActiveDDMDeclarationEnforcedSUWithResponse___block_invoke;
  v7[3] = &unk_24CE3BD58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

uint64_t __62__SUDDMManager_getActiveDDMDeclarationEnforcedSUWithResponse___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), 0);
  return result;
}

- (void)downloadWasInvalidated:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *workQueue;
  id v13;
  void *v14;
  _QWORD block[4];
  id v16;
  SUDDMManager *v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("download was killed: %@"), v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUDDMManager downloadWasInvalidated:]");

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SUDDMManager_downloadWasInvalidated___block_invoke;
  block[3] = &unk_24CE3B610;
  v16 = v4;
  v17 = self;
  v13 = v4;
  dispatch_async(workQueue, block);

}

void __39__SUDDMManager_downloadWasInvalidated___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Our download was killed; it's time to re-evaluate the declarations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager downloadWasInvalidated:]_block_invoke");

    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

    objc_msgSend(*(id *)(a1 + 40), "_evaluateDeclarationsWithNewDeclaration:", 0);
  }
}

- (void)installDidFinish:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *workQueue;
  void *v13;
  id v14;
  _QWORD block[4];
  id v16;
  SUDDMManager *v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("update was successfully installed: %@"), v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUDDMManager installDidFinish:]");

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SUDDMManager_installDidFinish___block_invoke;
  block[3] = &unk_24CE3B610;
  v16 = v4;
  v17 = self;
  v14 = v4;
  dispatch_sync(workQueue, block);

}

void __33__SUDDMManager_installDidFinish___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40)))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The enforced update successfully finished; invalidating the declaration ..."));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUDDMManager installDidFinish:]_block_invoke");

    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 48);
    objc_msgSend(*(id *)(v10 + 64), "declarationKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateDeclarationForKey:", v12);

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Declaration invalidated!"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUDDMManager installDidFinish:]_block_invoke");

  }
}

- (void)timeFiredForScheduler:(id)a3 withOptions:(id)a4 replyBlock:(id)a5
{
  id v7;
  id v8;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  SUDDMManager *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SUDDMManager_timeFiredForScheduler_withOptions_replyBlock___block_invoke;
  block[3] = &unk_24CE3B6B0;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(workQueue, block);

}

uint64_t __61__SUDDMManager_timeFiredForScheduler_withOptions_replyBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("com.apple.sus.ddm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", CFSTR("com.apple.sus.ddm.evaluate"));

    if (v4)
      objc_msgSend(*(id *)(a1 + 40), "_evaluateDeclarationsWithNewDeclaration:", 0);
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)setDDMGlobalSettings:(id)a3 outError:(id *)a4
{
  id v6;
  NSObject *gsWorkQueue;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  SUDDMManager *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __46__SUDDMManager_setDDMGlobalSettings_outError___block_invoke;
  v11[3] = &unk_24CE3BD80;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v14 = &v22;
  v15 = &v16;
  dispatch_sync(gsWorkQueue, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v9 = *((_BYTE *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __46__SUDDMManager_setDDMGlobalSettings_outError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int64_t v28;
  uint64_t v29;
  void *v30;
  unint64_t v31;
  void *v32;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 48);
  if (v2)
  {
    objc_msgSend(v2, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v6 + 40);
    v7 = objc_msgSend(v4, "addGlobalSettingsDeclaration:returningError:", v5, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;

  }
  else
  {
    objc_msgSend(*(id *)(v3 + 48), "removeGlobalSettingsDeclaration");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to set global settings from %@ to %@, error: %@"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SULogError(CFSTR("[DDM] %s: %@"), v20, v21, v22, v23, v24, v25, v26, (uint64_t)"-[SUDDMManager setDDMGlobalSettings:outError:]_block_invoke");
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Successfully set global settings from %@ to %@"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72), *(_QWORD *)(a1 + 32));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUDDMManager setDDMGlobalSettings:outError:]_block_invoke");

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 72), *(id *)(a1 + 32));
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
  if (v16)
  {
    objc_msgSend(v16, "automaticallyDownload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = +[SUDDMManager _NSNumberToTriState:](SUDDMManager, "_NSNumberToTriState:", v17);

    if (v18 == 1)
    {
      v19 = 1;
    }
    else
    {
      if (v18)
        goto LABEL_12;
      v19 = 0;
    }
    objc_msgSend(v15, "enableAutomaticDownload:", v19);
LABEL_12:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "automaticallyInstallOSUpdates");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = +[SUDDMManager _NSNumberToTriState:](SUDDMManager, "_NSNumberToTriState:", v27);

    if (v28 == 1)
    {
      v29 = 1;
    }
    else
    {
      if (v28)
        goto LABEL_17;
      v29 = 0;
    }
    objc_msgSend(v15, "enableAutomaticUpdateV2:", v29);
LABEL_17:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "automaticallyInstallSystemAndSecurityUpdates");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = +[SUDDMManager _NSNumberToTriState:](SUDDMManager, "_NSNumberToTriState:", v30);

    if (v31 <= 1)
    {
      objc_msgSend(v15, "enableAutoInstallSystemAndDataFiles:", v31);
      objc_msgSend(v15, "enableAutoInstallSecurityResponse:", v31);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "sendDDMGlobalSettingsToUI:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72));
LABEL_21:

}

- (id)getDDMGlobalSettingsWithError:(id *)a3
{
  NSObject *gsWorkQueue;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  v21 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SUDDMManager_getDDMGlobalSettingsWithError___block_invoke;
  block[3] = &unk_24CE3B5E8;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(gsWorkQueue, block);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("current global settings = %@"), v17[5]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[DDM] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUDDMManager getDDMGlobalSettingsWithError:]");

  v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __46__SUDDMManager_getDDMGlobalSettingsWithError___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

- (BOOL)enableGlobalNotifications
{
  SUDDMManager *v2;
  NSObject *gsWorkQueue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v2 = self;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = v2->_gsWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SUDDMManager_enableGlobalNotifications__block_invoke;
  block[3] = &unk_24CE3B700;
  block[4] = v2;
  block[5] = &v14;
  dispatch_sync(gsWorkQueue, block);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("enableGlobalNotifications: %d"), *((unsigned __int8 *)v15 + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[DDM] %s: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager enableGlobalNotifications]");

  LOBYTE(v2) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v2;
}

void __41__SUDDMManager_enableGlobalNotifications__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "enableGlobalNotifications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "enableGlobalNotifications");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "BOOLValue");

  }
}

- (BOOL)enableRapidSecurityResponse
{
  SUDDMManager *v2;
  NSObject *gsWorkQueue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v2 = self;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = v2->_gsWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUDDMManager_enableRapidSecurityResponse__block_invoke;
  block[3] = &unk_24CE3B700;
  block[4] = v2;
  block[5] = &v14;
  dispatch_sync(gsWorkQueue, block);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("enableRapidSecurityResponse: %d"), *((unsigned __int8 *)v15 + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[DDM] %s: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager enableRapidSecurityResponse]");

  LOBYTE(v2) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v2;
}

void __43__SUDDMManager_enableRapidSecurityResponse__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "enableRapidSecurityResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "enableRapidSecurityResponse");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "BOOLValue");

  }
}

- (BOOL)enableRapidSecurityResponseRollback
{
  SUDDMManager *v2;
  NSObject *gsWorkQueue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v2 = self;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = v2->_gsWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUDDMManager_enableRapidSecurityResponseRollback__block_invoke;
  block[3] = &unk_24CE3B700;
  block[4] = v2;
  block[5] = &v14;
  dispatch_sync(gsWorkQueue, block);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("enableRapidSecurityResponseRollback: %d"), *((unsigned __int8 *)v15 + 24));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[DDM] %s: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager enableRapidSecurityResponseRollback]");

  LOBYTE(v2) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)v2;
}

void __51__SUDDMManager_enableRapidSecurityResponseRollback__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "enableRapidSecurityResponseRollback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "enableRapidSecurityResponseRollback");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "BOOLValue");

  }
}

- (BOOL)isDealyingUpdates
{
  return -[SUDDMManager updateDeferralPeriodDays](self, "updateDeferralPeriodDays") != 0;
}

- (unint64_t)updateDeferralPeriodDays
{
  NSObject *gsWorkQueue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SUDDMManager_updateDeferralPeriodDays__block_invoke;
  block[3] = &unk_24CE3B700;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(gsWorkQueue, block);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("updateDeferralPeriod: %lu"), v16[3]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[DDM] %s: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUDDMManager updateDeferralPeriodDays]");

  v11 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v11;
}

void __40__SUDDMManager_updateDeferralPeriodDays__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "combinedUpdatesDeferralPeriod");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "combinedUpdatesDeferralPeriod");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "unsignedIntegerValue");

  }
}

+ (int64_t)_NSNumberToTriState:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "intValue") == 1)
      v5 = 1;
    else
      v5 = 2 * (objc_msgSend(v4, "intValue") != 0);
  }
  else
  {
    v5 = 2;
  }

  return v5;
}

- (int64_t)alwaysEnableAutoDownload
{
  NSObject *gsWorkQueue;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  void *v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 2;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SUDDMManager_alwaysEnableAutoDownload__block_invoke;
  block[3] = &unk_24CE3B700;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(gsWorkQueue, block);
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BEAEA28], "stringFromTriState:", v18[3]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("alwaysEnableAutoDownload: %@"), v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[DDM] %s: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager alwaysEnableAutoDownload]");

  v13 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v13;
}

void __40__SUDDMManager_alwaysEnableAutoDownload__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
  {
    objc_msgSend(v2, "automaticallyDownload");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = +[SUDDMManager _NSNumberToTriState:](SUDDMManager, "_NSNumberToTriState:", v3);

  }
}

- (int64_t)alwaysEnableAutoInstallOSUpdates
{
  NSObject *gsWorkQueue;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  void *v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 2;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUDDMManager_alwaysEnableAutoInstallOSUpdates__block_invoke;
  block[3] = &unk_24CE3B700;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(gsWorkQueue, block);
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BEAEA28], "stringFromTriState:", v18[3]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("alwaysEnableAutoInstallOSUpdates: %@"), v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[DDM] %s: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager alwaysEnableAutoInstallOSUpdates]");

  v13 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v13;
}

void __48__SUDDMManager_alwaysEnableAutoInstallOSUpdates__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
  {
    objc_msgSend(v2, "automaticallyInstallOSUpdates");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = +[SUDDMManager _NSNumberToTriState:](SUDDMManager, "_NSNumberToTriState:", v3);

  }
}

- (int64_t)alwaysEnableAutoInstallRapidSecurityResponse
{
  NSObject *gsWorkQueue;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  void *v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 2;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SUDDMManager_alwaysEnableAutoInstallRapidSecurityResponse__block_invoke;
  block[3] = &unk_24CE3B700;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(gsWorkQueue, block);
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BEAEA28], "stringFromTriState:", v18[3]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("alwaysEnableAutoInstallRapidSecurityResponse: %@"), v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[DDM] %s: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager alwaysEnableAutoInstallRapidSecurityResponse]");

  v13 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v13;
}

void __60__SUDDMManager_alwaysEnableAutoInstallRapidSecurityResponse__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (v2)
  {
    objc_msgSend(v2, "automaticallyInstallSystemAndSecurityUpdates");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = +[SUDDMManager _NSNumberToTriState:](SUDDMManager, "_NSNumberToTriState:", v3);

  }
}

- (unint64_t)recommendedCadence
{
  NSObject *gsWorkQueue;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v15;
  _QWORD block[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_gsWorkQueue);
  gsWorkQueue = self->_gsWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SUDDMManager_recommendedCadence__block_invoke;
  block[3] = &unk_24CE3B700;
  block[4] = self;
  block[5] = &v17;
  dispatch_sync(gsWorkQueue, block);
  v4 = (void *)MEMORY[0x24BDD17C8];
  SUStringFromMDMSUPath(v18[3]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("recommendedCadence: %@"), v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[DDM] %s: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUDDMManager recommendedCadence]");

  v13 = v18[3];
  _Block_object_dispose(&v17, 8);
  return v13;
}

void __34__SUDDMManager_recommendedCadence__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "recommendationCadence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "recommendationCadence");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "intValue");

    if (v4)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "recommendationCadence");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "intValue");

      if (v6 == 1)
      {
        v7 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "recommendationCadence");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "intValue");

        if (v9 != 2)
          return;
        v7 = 2;
      }
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 3;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSettings, 0);
  objc_storeStrong((id *)&self->_activeDeclarationEnforcedSU, 0);
  objc_storeStrong((id *)&self->_evaluationScheduler, 0);
  objc_storeStrong((id *)&self->_ddmConfiguration, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_managerServerDelegate, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_gsWorkQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
