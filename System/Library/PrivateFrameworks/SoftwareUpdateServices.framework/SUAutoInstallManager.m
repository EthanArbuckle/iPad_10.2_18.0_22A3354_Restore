@implementation SUAutoInstallManager

- (SUAutoInstallManager)initWithManager:(id)a3
{
  id v5;
  SUAutoInstallManager *v6;
  unsigned int v7;
  uint64_t v8;
  SUState *state;
  uint64_t v10;
  SUAutoUpdatePasscodePolicy *passcodePolicy;
  _SUAutoInstallOperationModel *operationModel;
  void *v13;
  uint64_t v14;
  SUSFollowUpController *followUpController;
  dispatch_queue_t v16;
  OS_dispatch_queue *stateQueue;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUAutoInstallManager;
  v6 = -[SUAutoInstallManager init](&v19, sel_init);
  if (v6)
  {
    v7 = time(0);
    srand(v7);
    +[SUState currentState](SUState, "currentState");
    v8 = objc_claimAutoreleasedReturnValue();
    state = v6->_state;
    v6->_state = (SUState *)v8;

    objc_storeStrong((id *)&v6->_manager, a3);
    +[SUAutoUpdatePasscodePolicy sharedInstance](SUAutoUpdatePasscodePolicy, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    passcodePolicy = v6->_passcodePolicy;
    v6->_passcodePolicy = (SUAutoUpdatePasscodePolicy *)v10;

    operationModel = v6->_operationModel;
    v6->_operationModel = 0;

    -[SUManagerInterface setPasscodePolicy:](v6->_manager, "setPasscodePolicy:", v6->_passcodePolicy);
    -[SUAutoUpdatePasscodePolicy addObserver:](v6->_passcodePolicy, "addObserver:", v6);
    -[SUManagerInterface addObserver:](v6->_manager, "addObserver:", v6);
    +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:", v6);

    +[SUSFollowUpController sharedController](SUSFollowUpController, "sharedController");
    v14 = objc_claimAutoreleasedReturnValue();
    followUpController = v6->_followUpController;
    v6->_followUpController = (SUSFollowUpController *)v14;

    v16 = dispatch_queue_create("com.apple.softwareupdateservices.autoInstallManager.stateQueue", 0);
    stateQueue = v6->_stateQueue;
    v6->_stateQueue = (OS_dispatch_queue *)v16;

    v6->_autoInstallAttempted = 0;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[SUManagerInterface removeObserver:](self->_manager, "removeObserver:", self);
  -[SUAutoUpdatePasscodePolicy removeObserver:](self->_passcodePolicy, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SUAutoInstallManager;
  -[SUAutoInstallManager dealloc](&v3, sel_dealloc);
}

- (void)resumeOrResetStateIfNecessary
{
  NSObject *stateQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SUAutoInstallManager_resumeOrResetStateIfNecessary__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __53__SUAutoInstallManager_resumeOrResetStateIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resumeOrResetStateIfNecessary");
}

- (void)_queue_resumeOrResetStateIfNecessary
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
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
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
  void *v44;
  void *v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _SUAutoInstallOperationModel *v72;
  id v73;
  _SUAutoInstallOperationModel *operationModel;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  _SUAutoInstallOperationModel **p_operationModel;
  _SUAutoInstallOperationModel *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  id v121;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleSimulatedAutoInstallTask");

  -[SUState lastAutoInstallOperationModel](self->_state, "lastAutoInstallOperationModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("%s: lastOperation = %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUAutoInstallManager _queue_resumeOrResetStateIfNecessary]");
  if (v4)
  {
    -[SUState lastProductBuild](self->_state, "lastProductBuild");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUState lastProductVersion](self->_state, "lastProductVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUtility currentProductBuild](SUUtility, "currentProductBuild");
    v14 = objc_claimAutoreleasedReturnValue();
    +[SUUtility currentProductVersion](SUUtility, "currentProductVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = (void *)v14;
    v120 = v12;
    if (objc_msgSend(v13, "isEqualToString:", v15)
      && (objc_msgSend(v12, "isEqualToString:", v14) & 1) != 0)
    {
      v23 = 0;
    }
    else
    {
      SULogInfo(CFSTR("New OS detected. Clearing last SUAutoInstallOperation"), v16, v17, v18, v19, v20, v21, v22, v116);
      v23 = 1;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "forecast");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "suEndDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "compare:", v26);

    if (v27 == 1)
    {
      SULogInfo(CFSTR("Saved SUAutoInstallOperation is expired"), v28, v29, v30, v31, v32, v33, v34, v116);
      v23 = 1;
    }
    -[SUManagerInterface download](self->_manager, "download");
    v35 = objc_claimAutoreleasedReturnValue();
    if (!v35)
      goto LABEL_12;
    v43 = (void *)v35;
    -[SUManagerInterface download](self->_manager, "download");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "progress");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "isDone");

    if ((v46 & 1) != 0)
    {
      if (!v23)
      {
        SULogInfo(CFSTR("Last AutoInstall operation found\n %@"), v36, v37, v38, v39, v40, v41, v42, (uint64_t)v4);
        objc_storeStrong((id *)&self->_operationModel, v4);
        -[SUAutoUpdatePasscodePolicy setCurrentPolicyType:](self->_passcodePolicy, "setCurrentPolicyType:", 1);
        goto LABEL_20;
      }
    }
    else
    {
LABEL_12:
      SULogInfo(CFSTR("There is no downloaded asset. Clearing last SUAutoInstallOperation"), v36, v37, v38, v39, v40, v41, v42, v116);
    }
    if (-[SUAutoInstallManager isAutoUpdateEnabled](self, "isAutoUpdateEnabled"))
    {
      -[SUManagerInterface download](self->_manager, "download");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "progress");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "isDone");

      SULogInfo(CFSTR("%s: canceling %@"), v57, v58, v59, v60, v61, v62, v63, (uint64_t)"-[SUAutoInstallManager _queue_resumeOrResetStateIfNecessary]");
      +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "cancelAllAutoInstallTasks");

      -[SUAutoUpdatePasscodePolicy setCurrentPolicyType:](self->_passcodePolicy, "setCurrentPolicyType:", 0);
      if ((v56 & 1) != 0)
      {
        -[SUState setLastAutoInstallOperationModel:](self->_state, "setLastAutoInstallOperationModel:", 0);
        -[SUState save](self->_state, "save");
        SULogInfo(CFSTR("Last AutoInstall operation found\n %@"), v65, v66, v67, v68, v69, v70, v71, (uint64_t)v4);
        if (-[SUAutoInstallManager isAutoUpdateEnabled](self, "isAutoUpdateEnabled"))
        {
          v121 = 0;
          -[SUAutoInstallManager _queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:](self, "_queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:", 1, 1, &v121);
          v72 = (_SUAutoInstallOperationModel *)objc_claimAutoreleasedReturnValue();
          v73 = v121;
          operationModel = self->_operationModel;
          self->_operationModel = v72;

          if (v73)
          {
            SULogInfo(CFSTR("Error creating new autoInstallOperationModel: %@"), v75, v76, v77, v78, v79, v80, v81, (uint64_t)v73);
LABEL_27:

            goto LABEL_28;
          }
        }
LABEL_20:
        if (objc_msgSend(v4, "agreementStatus") == 1)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "forecast");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "unlockStartDate");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = objc_msgSend(v90, "compare:", v92);

          if (v93 == 1)
          {
            SULogInfo(CFSTR("Unlock window passed. Firing unlock window timer manually"), v94, v95, v96, v97, v98, v99, v100, v117);
            -[SUAutoInstallManager noteAutoInstallOperationUnlockWindowDidBegin](self, "noteAutoInstallOperationUnlockWindowDidBegin");
          }
        }
        -[SUManagerInterface download](self->_manager, "download");
        v73 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "progress");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = objc_msgSend(v101, "isDone");

        if (v102)
        {
          SULogInfo(CFSTR("%s: Scheduling tonight activity because the download is finished"), v103, v104, v105, v106, v107, v108, v109, (uint64_t)"-[SUAutoInstallManager _queue_resumeOrResetStateIfNecessary]");
          +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = self->_operationModel;
          p_operationModel = &self->_operationModel;
          -[_SUAutoInstallOperationModel forecast](v112, "forecast");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          -[_SUAutoInstallOperationModel download](*(p_operationModel - 2), "download");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "descriptor");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "scheduleAllAutoInstallUpdateTasks:descriptor:", v113, v115);

          -[_SUAutoInstallOperationModel setIsInstallTonightScheduled:](*(p_operationModel - 2), "setIsInstallTonightScheduled:", 1);
        }
        else
        {
          SULogInfo(CFSTR("%s: Do not schedule tonight activity because the download is not finished"), v103, v104, v105, v106, v107, v108, v109, (uint64_t)"-[SUAutoInstallManager _queue_resumeOrResetStateIfNecessary]");
          p_operationModel = &self->_operationModel;
        }
        -[_SUAutoInstallOperationModel setWaitingUntilDownloadComplete:](*p_operationModel, "setWaitingUntilDownloadComplete:", v102 ^ 1u);
        goto LABEL_27;
      }
    }
    else
    {
      SULogInfo(CFSTR("%s: canceling %@"), v47, v48, v49, v50, v51, v52, v53, (uint64_t)"-[SUAutoInstallManager _queue_resumeOrResetStateIfNecessary]");
      +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "cancelAllAutoInstallTasks");

      -[SUAutoUpdatePasscodePolicy setCurrentPolicyType:](self->_passcodePolicy, "setCurrentPolicyType:", 0);
    }
    SULogBadging();
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v83, CFSTR("resumeOrResetStateIfNecessary: Dismissing AutoUpdateBanner if present"), v84, v85, v86, v87, v88, v89, v118);

    -[SUManagerInterface dismissAutoUpdateBanner](self->_manager, "dismissAutoUpdateBanner");
    -[SUState setLastAutoInstallOperationModel:](self->_state, "setLastAutoInstallOperationModel:", 0);
    -[SUState save](self->_state, "save");
LABEL_28:

  }
}

- (BOOL)isAutoDownload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  -[SUManagerInterface download](self->_manager, "download");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerInterface download](self->_manager, "download");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "downloadOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = v7;
    v10 = objc_msgSend(v7, "isAutoDownload");

    return v10;
  }
  objc_msgSend(v5, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SUManagerInterface download](self->_manager, "download");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  return 0;
}

- (BOOL)isAutoUpdateEnabled
{
  return -[SUManagerInterface isAutoUpdateEnabled](self->_manager, "isAutoUpdateEnabled");
}

- (BOOL)isCurrentUpdateAutoUpdate
{
  return -[SUManagerInterface isCurrentUpdateAutoUpdate](self->_manager, "isCurrentUpdateAutoUpdate");
}

- (id)currentAutoInstallOperationCreatingIfNecessary:(BOOL)a3 error:(id *)a4
{
  NSObject *stateQueue;
  id v8;
  _QWORD v10[7];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  v16 = __Block_byref_object_dispose__20;
  v17 = 0;
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __77__SUAutoInstallManager_currentAutoInstallOperationCreatingIfNecessary_error___block_invoke;
  v10[3] = &unk_24CE3E440;
  v10[4] = self;
  v10[5] = &v12;
  v11 = a3;
  v10[6] = a4;
  dispatch_sync(stateQueue, v10);
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __77__SUAutoInstallManager_currentAutoInstallOperationCreatingIfNecessary_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:", *(unsigned __int8 *)(a1 + 56), 1, *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)copyAutoInstallOperationForecast:(id *)a3 error:(id *)a4
{
  NSObject *stateQueue;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__20;
  v14 = __Block_byref_object_dispose__20;
  v15 = 0;
  stateQueue = self->_stateQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__SUAutoInstallManager_copyAutoInstallOperationForecast_error___block_invoke;
  v9[3] = &unk_24CE3B700;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(stateQueue, v9);
  v8 = 0;
  if (!v11[5])
  {
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 49);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v11[5]);
  if (a4)
    *a4 = objc_retainAutorelease(v8);

  _Block_object_dispose(&v10, 8);
}

void __63__SUAutoInstallManager_copyAutoInstallOperationForecast_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  if (objc_msgSend(*(id *)(a1 + 32), "_queue_canGetAutoInstallOperation"))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (v2)
    {
      objc_msgSend(v2, "forecast");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "forecast");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "copy");
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v7 = *(void **)(v6 + 40);
        *(_QWORD *)(v6 + 40) = v5;

      }
    }
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v8 || objc_msgSend(v8, "_isForecastExpired"))
    {
      +[SUAutoInstallForecast createForecast](SUAutoInstallForecast, "createForecast");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
  }
}

- (BOOL)_queue_canGetAutoInstallOperation
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAutoSUDisabled");

  if (v4)
  {
    SULogInfo(CFSTR("AutoSU disabled. Not scheduling AutoSU timers"), v5, v6, v7, v8, v9, v10, v11, v26);
    return 0;
  }
  else
  {
    -[SUManagerInterface preferredLastScannedDescriptor](self->_manager, "preferredLastScannedDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && objc_msgSend(v14, "installTonightDisabled"))
    {
      SULogInfo(CFSTR("AutoSU disabled for this update. Not scheduling AutoSU timers"), v15, v16, v17, v18, v19, v20, v21, v26);
      v12 = 0;
    }
    else
    {
      -[SUManagerInterface download](self->_manager, "download");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "progress");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v24, "isDone") & 1) != 0)
          v12 = 1;
        else
          v12 = -[SUManagerInterface isDownloading](self->_manager, "isDownloading");

      }
      else
      {
        v12 = 0;
      }

    }
  }
  return v12;
}

- (id)_queue_currentAutoInstallOperationCreatingIfNecessary:(BOOL)a3 notifyIfExpired:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v9;
  _SUAutoInstallOperationModel *v10;
  _SUAutoInstallOperationModel *v11;
  _SUAutoInstallOperationModel *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
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
  void *v31;
  int v32;
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
  _SUAutoInstallOperationModel *operationModel;
  void *v48;
  void *v49;
  void *v50;
  _SUAutoInstallOperationModel *v51;
  void *v53;
  void *v54;
  void *v55;
  _SUAutoInstallOperationModel *v56;

  v6 = a4;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (!-[SUAutoInstallManager _queue_canGetAutoInstallOperation](self, "_queue_canGetAutoInstallOperation"))
    goto LABEL_25;
  -[SUManagerInterface download](self->_manager, "download");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_operationModel;
  if (!v10)
  {
LABEL_6:
    if (v7)
      goto LABEL_7;
    goto LABEL_24;
  }
  if (!-[SUAutoInstallManager _queue_isExpired](self, "_queue_isExpired"))
  {
    objc_msgSend(v9, "progress");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "isDone");

    if (v32)
    {
      if (-[SUManagerInterface isInstallTonightScheduled](self->_manager, "isInstallTonightScheduled"))
      {
        SULogInfo(CFSTR("%s: Do not schedule tonight activity because it has been scheduled"), v40, v41, v42, v43, v44, v45, v46, (uint64_t)"-[SUAutoInstallManager _queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:]");
      }
      else
      {
        SULogInfo(CFSTR("%s: Scheduling tonight activity because the download is finished"), v40, v41, v42, v43, v44, v45, v46, (uint64_t)"-[SUAutoInstallManager _queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:]");
        +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SUAutoInstallOperationModel forecast](self->_operationModel, "forecast");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "descriptor");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "scheduleAllAutoInstallUpdateTasks:descriptor:", v49, v50);

        -[SUManagerInterface setIsInstallTonightScheduled:](self->_manager, "setIsInstallTonightScheduled:", 1);
      }
    }
    else
    {
      SULogInfo(CFSTR("%s: Do not schedule tonight activity because the download is not finished"), v33, v34, v35, v36, v37, v38, v39, (uint64_t)"-[SUAutoInstallManager _queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:]");
    }
    -[_SUAutoInstallOperationModel setWaitingUntilDownloadComplete:](self->_operationModel, "setWaitingUntilDownloadComplete:", v32 ^ 1u);
    v51 = self->_operationModel;

    return v51;
  }
  if (v6)
  {
    -[SUAutoInstallManager _queue_noteAutoInstallOperationDidExpire](self, "_queue_noteAutoInstallOperationDidExpire");
    goto LABEL_6;
  }
  operationModel = self->_operationModel;
  self->_operationModel = 0;

  if (v7)
  {
LABEL_7:
    -[SUAutoInstallManager _createOperationModel](self, "_createOperationModel");
    v11 = (_SUAutoInstallOperationModel *)objc_claimAutoreleasedReturnValue();
    v12 = self->_operationModel;
    self->_operationModel = v11;

    if (self->_operationModel)
    {
      objc_msgSend(v9, "downloadOptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "termsAndConditionsAgreementStatus");

      if (v14 == 1)
        -[_SUAutoInstallOperationModel setAgreementStatus:](self->_operationModel, "setAgreementStatus:", 1);
      objc_msgSend(v9, "progress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isDone");

      if (v16)
      {
        if (-[SUManagerInterface isInstallTonightScheduled](self->_manager, "isInstallTonightScheduled"))
        {
          SULogInfo(CFSTR("%s: Do not schedule tonight activity because it has been scheduled"), v24, v25, v26, v27, v28, v29, v30, (uint64_t)"-[SUAutoInstallManager _queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:]");
        }
        else
        {
          SULogInfo(CFSTR("%s: Scheduling tonight activity because the download is finished"), v24, v25, v26, v27, v28, v29, v30, (uint64_t)"-[SUAutoInstallManager _queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:]");
          +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[_SUAutoInstallOperationModel forecast](self->_operationModel, "forecast");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "descriptor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "scheduleAllAutoInstallUpdateTasks:descriptor:", v54, v55);

          -[SUManagerInterface setIsInstallTonightScheduled:](self->_manager, "setIsInstallTonightScheduled:", 1);
        }
      }
      else
      {
        SULogInfo(CFSTR("%s: Do not schedule tonight activity because the download is not finished"), v17, v18, v19, v20, v21, v22, v23, (uint64_t)"-[SUAutoInstallManager _queue_currentAutoInstallOperationCreatingIfNecessary:notifyIfExpired:error:]");
      }
      -[_SUAutoInstallOperationModel setWaitingUntilDownloadComplete:](self->_operationModel, "setWaitingUntilDownloadComplete:", v16 ^ 1u);
      -[SUState setLastAutoInstallOperationModel:](self->_state, "setLastAutoInstallOperationModel:", self->_operationModel);
      -[SUState save](self->_state, "save");
    }
  }
LABEL_24:

LABEL_25:
  v56 = self->_operationModel;
  if (a5 && !v56 && v7)
  {
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 45);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    v56 = self->_operationModel;
  }
  return v56;
}

- (void)cancelAutoInstallOperation:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SUAutoInstallManager_cancelAutoInstallOperation___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

uint64_t __51__SUAutoInstallManager_cancelAutoInstallOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_cancelAutoInstallOperation:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_cancelAutoInstallOperation:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  id v15;

  v15 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[_SUAutoInstallOperationModel id](self->_operationModel, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v15);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("SUAutoInstallOperationCancelledNotification"), 0);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "autoInstallManager:didCancelOperation:", self, self->_operationModel);

    -[SUAutoInstallManager _queue_clearAutoInstallOperationForReason:disableKeybagStash:](self, "_queue_clearAutoInstallOperationForReason:disableKeybagStash:", CFSTR("Canceled"), 0);
  }
  else
  {
    SULogInfo(CFSTR("%s: unknown operationID: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUAutoInstallManager _queue_cancelAutoInstallOperation:]");
  }

}

- (void)consentToAutoInstallOperation:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__SUAutoInstallManager_consentToAutoInstallOperation___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(stateQueue, v7);

}

uint64_t __54__SUAutoInstallManager_consentToAutoInstallOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_consentToAutoInstallOperation:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_consentToAutoInstallOperation:(id)a3
{
  NSObject *stateQueue;
  id v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __CFString *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id WeakRetained;

  stateQueue = self->_stateQueue;
  v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  -[_SUAutoInstallOperationModel id](self->_operationModel, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  if (v7)
  {
    SULogInfo(CFSTR("AutoSU consented"), v8, v9, v10, v11, v12, v13, v14, v45);
    -[_SUAutoInstallOperationModel setAgreementStatus:](self->_operationModel, "setAgreementStatus:", 1);
    -[_SUAutoInstallOperationModel forecast](self->_operationModel, "forecast");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unlockStartDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "compare:", v17) == -1)
    {
      -[_SUAutoInstallOperationModel forecast](self->_operationModel, "forecast");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "unlockEndDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "compare:", v20);

      if (v21 == 1)
      {
        SULogInfo(CFSTR("User consented during unlock window. Persisting stash"), v22, v23, v24, v25, v26, v27, v28, v46);
        -[SUManagerInterface persistStashOnUnlock](self->_manager, "persistStashOnUnlock");
      }
    }
    else
    {

    }
    -[SUState setLastAutoInstallOperationModel:](self->_state, "setLastAutoInstallOperationModel:", self->_operationModel);
    -[SUState save](self->_state, "save");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "postNotificationName:object:", CFSTR("SUAutoInstallOperationDidConsentNotification"), 0);

    if (-[SUManagerInterface isAutoUpdateEnabled](self->_manager, "isAutoUpdateEnabled")
      && (+[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance"),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v31 = objc_msgSend(v30, "hasPasscodeSet"),
          v30,
          (v31 & 1) == 0))
    {
      SULogBadging();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v35;
      v43 = CFSTR("Auto update consented and no passcode set. Displaying banner");
    }
    else
    {
      if (!-[SUManagerInterface isInstallTonightScheduled](self->_manager, "isInstallTonightScheduled"))
        goto LABEL_14;
      -[SUManagerInterface download](self->_manager, "download");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "progress");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isDone");

      if (!v34)
        goto LABEL_14;
      SULogBadging();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v35;
      v43 = CFSTR("Install tonight is scheduled and download is done. Displaying banner");
    }
    SULogInfoForSubsystem(v35, v43, v36, v37, v38, v39, v40, v41, v46);

    +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "schedulePresentAutoUpdateBanner");

LABEL_14:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "autoInstallManager:operationWasConsented:", self, self->_operationModel);

  }
}

- (void)trySchedulingAutoInstallAgainLater
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
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
  id v36;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "autoInstallRetryDelay");
  v36 = (id)objc_claimAutoreleasedReturnValue();

  SULogDebug(CFSTR("defaultDelay = %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v36);
  v11 = 900.0;
  if (v36 && (int)objc_msgSend(v36, "intValue") >= 1)
  {
    v12 = objc_msgSend(v36, "intValue");
    v11 = (double)(int)v12;
    SULogInfo(CFSTR("delay is set to %d seconds by default"), v13, v14, v15, v16, v17, v18, v19, v12);
  }
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "disableAutoInstallJitter");

  if (v21)
    SULogInfo(CFSTR("%s: disableAutoInstallJitter default is set, ignoring jitter"), v22, v23, v24, v25, v26, v27, v28, (uint64_t)"-[SUAutoInstallManager trySchedulingAutoInstallAgainLater]");
  else
    v11 = v11
        + (double)+[SUUtility randomIntWithMinVal:maxVal:](SUUtility, "randomIntWithMinVal:maxVal:", 0, 300);
  SULogInfo(CFSTR("Will retry to auto install in %d seconds"), v29, v30, v31, v32, v33, v34, v35, (int)v11);
  -[SUAutoInstallManager trySchedulingAnotherTimeInInstallWindow:](self, "trySchedulingAnotherTimeInInstallWindow:", v11);

}

- (void)trySchedulingAnotherTimeInInstallWindow:(double)a3
{
  NSObject *stateQueue;
  _QWORD v6[6];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __64__SUAutoInstallManager_trySchedulingAnotherTimeInInstallWindow___block_invoke;
  v6[3] = &unk_24CE3B798;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  dispatch_async(stateQueue, v6);
}

uint64_t __64__SUAutoInstallManager_trySchedulingAnotherTimeInInstallWindow___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_trySchedulingAnotherTimeInInstallWindow:", *(double *)(a1 + 40));
}

- (void)_queue_trySchedulingAnotherTimeInInstallWindow:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[_SUAutoInstallOperationModel forecast](self->_operationModel, "forecast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suEndDate");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v20, 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1500], "localizedStringFromDate:dateStyle:timeStyle:", v6, 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "compare:", v20) == -1)
  {
    +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagerInterface download](self->_manager, "download");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "descriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "scheduleAutoInstallStartInstallTaskWithDate:descriptor:fromFailure:", v6, v19, 1);

    v16 = CFSTR("Window ends on %@; attempting to reschedule auto install on %@");
  }
  else
  {
    v16 = CFSTR("Window ends on %@; cannot reschedule auto install on %@");
  }
  SULogInfo(v16, v9, v10, v11, v12, v13, v14, v15, (uint64_t)v7);

}

- (void)noteAutoInstallOperationUnlockWindowDidBegin
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  SULogInfo(CFSTR("Unlock window did begin"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
  -[SUManagerInterface addUnlockCallback:forKey:](self->_manager, "addUnlockCallback:forKey:", sel_persistStashOnUnlock, CFSTR("unlockCallbackPersistStash"));
}

- (BOOL)isAutoInstallOperationReadyToBegin
{
  SUAutoInstallManager *v2;
  NSObject *stateQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = v2->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__SUAutoInstallManager_isAutoInstallOperationReadyToBegin__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __58__SUAutoInstallManager_isAutoInstallOperationReadyToBegin__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queue_isAutoInstallOperationReadyToBegin");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_queue_isAutoInstallOperationReadyToBegin
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _SUAutoInstallOperationModel *operationModel;
  __CFString *v11;
  uint64_t v13;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  operationModel = self->_operationModel;
  if (operationModel)
  {
    if (-[_SUAutoInstallOperationModel agreementStatus](operationModel, "agreementStatus") != 1)
      SULogInfo(CFSTR("Anomaly: Ready to install timer fired, but operation was not agreed to. (Proceeding to anyway)"), v3, v4, v5, v6, v7, v8, v9, v13);
    v11 = CFSTR("Auto install operation is ready");
  }
  else
  {
    v11 = CFSTR("Ready to install timer fired, but operation model is nil");
  }
  SULogInfo(v11, v3, v4, v5, v6, v7, v8, v9, v13);
  return operationModel != 0;
}

- (void)noteAutoInstallOperationWantsToBegin
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
  NSObject *stateQueue;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  dispatch_time_t v22;
  NSObject *v23;
  _QWORD v24[5];
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableAutoInstallJitter");

  if (v4)
  {
    SULogInfo(CFSTR("%s: disableAutoInstallJitter default is set, ignoring jitter"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUAutoInstallManager noteAutoInstallOperationWantsToBegin]");
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__SUAutoInstallManager_noteAutoInstallOperationWantsToBegin__block_invoke;
    block[3] = &unk_24CE3B5C0;
    block[4] = self;
    dispatch_async(stateQueue, block);
  }
  else
  {
    v13 = +[SUUtility randomIntWithMinVal:maxVal:](SUUtility, "randomIntWithMinVal:maxVal:", 0, 300);
    v14 = (double)(int)v13;
    SULogInfo(CFSTR("[Auto Install Jitter] Starting auto installation in %d seconds"), v15, v16, v17, v18, v19, v20, v21, v13);
    v22 = dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    v23 = self->_stateQueue;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __60__SUAutoInstallManager_noteAutoInstallOperationWantsToBegin__block_invoke_2;
    v24[3] = &unk_24CE3B5C0;
    v24[4] = self;
    dispatch_after(v22, v23, v24);
  }
}

uint64_t __60__SUAutoInstallManager_noteAutoInstallOperationWantsToBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteAutoInstallOperationWantsToBegin");
}

uint64_t __60__SUAutoInstallManager_noteAutoInstallOperationWantsToBegin__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteAutoInstallOperationWantsToBegin");
}

- (void)_queue_noteAutoInstallOperationWantsToBegin
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SUInstallOptions *v10;
  SUManagerInterface *manager;
  uint64_t v12;
  _QWORD v13[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  SULogInfo(CFSTR("AutoInstallOperation wants to begin"), v3, v4, v5, v6, v7, v8, v9, v12);
  -[SUManagerInterface reportOTAAutoTriggeredEvent](self->_manager, "reportOTAAutoTriggeredEvent");
  self->_autoInstallAttempted = 1;
  if (-[SUAutoInstallManager _queue_isAutoInstallOperationReadyToBegin](self, "_queue_isAutoInstallOperationReadyToBegin"))
  {
    -[SUManagerInterface setIsInstallTonight:](self->_manager, "setIsInstallTonight:", 1);
    v10 = objc_alloc_init(SUInstallOptions);
    -[SUInstallOptions setAutomaticInstallation:](v10, "setAutomaticInstallation:", 1);
    manager = self->_manager;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __67__SUAutoInstallManager__queue_noteAutoInstallOperationWantsToBegin__block_invoke;
    v13[3] = &unk_24CE3E490;
    v13[4] = self;
    -[SUManagerInterface isUpdateReadyForInstallationWithOptions:withResult:](manager, "isUpdateReadyForInstallationWithOptions:withResult:", v10, v13);

  }
}

void __67__SUAutoInstallManager__queue_noteAutoInstallOperationWantsToBegin__block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD block[5];
  id v12;
  char v13;
  char v14;

  v7 = a4;
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SUAutoInstallManager__queue_noteAutoInstallOperationWantsToBegin__block_invoke_2;
  block[3] = &unk_24CE3E468;
  v9 = *(_QWORD *)(a1 + 32);
  v13 = a2;
  block[4] = v9;
  v12 = v7;
  v14 = a3;
  v10 = v7;
  dispatch_async(v8, block);

}

void __67__SUAutoInstallManager__queue_noteAutoInstallOperationWantsToBegin__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  const __CFString *v22;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[5];

  if ((objc_msgSend(*(id *)(a1 + 32), "isAutoInstallOperationReadyToBegin") & 1) != 0)
  {
    v17 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v17, "setFailedToInstallError:", 0);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:", CFSTR("SUAutoInstallOperationIsReadyToInstallNotification"), 0);

      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      v20 = *(void **)(a1 + 32);
      objc_msgSend(v20, "operationModel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __67__SUAutoInstallManager__queue_noteAutoInstallOperationWantsToBegin__block_invoke_3;
      v39[3] = &unk_24CE3BD08;
      v39[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "autoInstallManager:isReadyToInstall:withResult:", v20, v21, v39);

    }
    else
    {
      objc_msgSend(v17, "setFailedToInstallError:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "_installAttemptDone");
      if (*(_BYTE *)(a1 + 49))
      {
        SULogInfo(CFSTR("Could not install due to %@."), v23, v24, v25, v26, v27, v28, v29, *(_QWORD *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 32), "trySchedulingAutoInstallAgainLater");
      }
      else
      {
        SULogInfo(CFSTR("Could not install due to %@, and should not retry. Canceling auto install"), v23, v24, v25, v26, v27, v28, v29, *(_QWORD *)(a1 + 40));
        +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "cancelAutoInstallStartInstallTask");

      }
      if (objc_msgSend(*(id *)(a1 + 32), "isCurrentUpdateAutoUpdate")
        && !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isCurrentlyPresentingFollowUpType:", 2))
      {
        SULogInfo(CFSTR("AutoUpdate cannot be installed, but user is not yet aware of the same..NOT presenting error alert"), v31, v32, v33, v34, v35, v36, v37, a9);
      }
      else
      {
        SULogInfo(CFSTR("AutoUpdate cannot be installed and user has been informed of the update..Presenting error alert"), v31, v32, v33, v34, v35, v36, v37, v38);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "autoSUFailedWithError:", *(_QWORD *)(a1 + 40));
      }
    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 48))
      v22 = CFSTR("Yes");
    else
      v22 = CFSTR("No");
    SULogInfo(CFSTR("Not ready to begin AutoInstall operation. Is update ready for install? %@"), v10, v11, v12, v13, v14, v15, v16, (uint64_t)v22);
  }
}

void __67__SUAutoInstallManager__queue_noteAutoInstallOperationWantsToBegin__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  void *v5;
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
  void *v20;
  int v21;
  const __CFString *v22;
  uint64_t v23;
  __CFString *v24;

  v24 = a3;
  v5 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v5, "setFailedToInstallError:", 0);
    SULogInfo(CFSTR("isReadyToInstall Returned YES"), v6, v7, v8, v9, v10, v11, v12, v23);
    goto LABEL_11;
  }
  objc_msgSend(v5, "setFailedToInstallError:", v24);
  objc_msgSend(*(id *)(a1 + 32), "_installAttemptDone");
  if (!v24)
  {
    v22 = CFSTR("nil");
    goto LABEL_9;
  }
  -[__CFString domain](v24, "domain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.softwareupdateservices.errors"));

  v13 = (uint64_t)v24;
  v22 = v24;
  if (!v21)
  {
LABEL_9:
    SULogInfo(CFSTR("isReadyToInstall (SB) Returned NO. Error: %@"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)v22);
LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "trySchedulingAutoInstallAgainLater");
    goto LABEL_11;
  }
  SULogInfo(CFSTR("isReadyToInstall (SUS) Returned NO. Error: %@"), (uint64_t)v24, v14, v15, v16, v17, v18, v19, (uint64_t)v24);
  if (-[__CFString code](v24, "code") != 49 && -[__CFString code](v24, "code") != 48)
    goto LABEL_10;
LABEL_11:

}

- (void)noteAutoInstallOperationDidExpire
{
  NSObject *stateQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SUAutoInstallManager_noteAutoInstallOperationDidExpire__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __57__SUAutoInstallManager_noteAutoInstallOperationDidExpire__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteAutoInstallOperationDidExpire");
}

- (void)_queue_noteAutoInstallOperationDidExpire
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id WeakRetained;
  uint64_t v26;
  uint64_t v27;
  NSError *v28;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  SULogInfo(CFSTR("AutoInstallOperation expired"), v3, v4, v5, v6, v7, v8, v9, v26);
  v28 = self->_failedToInstallError;
  if (!v28)
  {
    if (self->_autoInstallAttempted)
    {
      v28 = 0;
    }
    else
    {
      SULogInfo(CFSTR("DAS failed to run auto install activity"), v10, v11, v12, v13, v14, v15, v16, v27);
      +[SUUtility errorWithCode:originalError:](SUUtility, "errorWithCode:originalError:", 77, 0);
      v28 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
  }
  if (-[SUAutoInstallManager isCurrentUpdateAutoUpdate](self, "isCurrentUpdateAutoUpdate")
    && !-[SUSFollowUpController isCurrentlyPresentingFollowUpType:](self->_followUpController, "isCurrentlyPresentingFollowUpType:", 2))
  {
    SULogInfo(CFSTR("AutoUpdate install operation expired but user is not aware of the update..NOT Presenting error alert"), v17, v18, v19, v20, v21, v22, v23, v27);
  }
  else
  {
    SULogInfo(CFSTR("AutoUpdate install operation expired and user has been informed of update..Presenting error alert"), v17, v18, v19, v20, v21, v22, v23, v27);
    if (-[_SUAutoInstallOperationModel agreementStatus](self->_operationModel, "agreementStatus") == 1)
      -[SUManagerInterface autoSUFailedWithError:](self->_manager, "autoSUFailedWithError:", v28);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "postNotificationName:object:", CFSTR("SUAutoInstallOperationDidExpireNotification"), 0);

  }
  -[SUManagerInterface reportPostponedEvent:withStatus:](self->_manager, "reportPostponedEvent:withStatus:", v28, *MEMORY[0x24BEAEB38]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "autoInstallManager:didExpireOperation:withError:", self, self->_operationModel, v28);

  -[SUAutoInstallManager _queue_clearAutoInstallOperationForReason:disableKeybagStash:](self, "_queue_clearAutoInstallOperationForReason:disableKeybagStash:", CFSTR("Expired"), -[SUAutoInstallManager isCurrentUpdateAutoUpdate](self, "isCurrentUpdateAutoUpdate") ^ 1);
}

- (void)keybagInterfacePasscodeDidChange:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *stateQueue;
  uint64_t v10;
  _QWORD block[5];

  SULogInfo(CFSTR("Device passcode changed"), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, v10);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SUAutoInstallManager_keybagInterfacePasscodeDidChange___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

uint64_t __57__SUAutoInstallManager_keybagInterfacePasscodeDidChange___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 32))
  {
    v2 = result;
    result = objc_msgSend(*(id *)(v1 + 40), "currentPolicyType");
    if (!result)
      return objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 40), "setCurrentPolicyType:", 1);
  }
  return result;
}

- (void)passcodePolicyInterface:(id)a3 passcodePolicyTypeChanged:(unint64_t)a4
{
  SUAutoInstallManagerDelegate **p_delegate;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)p_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v11, "autoInstallManager:passcodePolicyChanged:forOperation:", self, a4, self->_operationModel);

    }
  }
}

- (void)downloadWasInvalidated:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__SUAutoInstallManager_downloadWasInvalidated___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

void __47__SUAutoInstallManager_downloadWasInvalidated___block_invoke(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 32);
  objc_msgSend(v1[4], "id");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_queue_cancelAutoInstallOperation:", v2);

}

- (void)unattendedInstallationKeybagCreated
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SUAutoInstallManager_unattendedInstallationKeybagCreated__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

uint64_t __59__SUAutoInstallManager_unattendedInstallationKeybagCreated__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addUnlockCallback:forKey:", sel_persistStashOnUnlock, CFSTR("unlockCallbackPersistStash"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "persistStashOnUnlock");
  result = objc_msgSend(*(id *)(a1 + 32), "isCurrentUpdateAutoUpdate");
  if ((_DWORD)result)
  {
    SULogBadging();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfoForSubsystem(v3, CFSTR("unattendedInstallationKeybagCreated: isAutoUpdate and isAutoDownload are true..Scheduling presentation of AutoUpdateBanner"), v4, v5, v6, v7, v8, v9, v11);

    +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "schedulePresentAutoUpdateBanner");

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setCurrentPolicyType:", 0);
  }
  return result;
}

- (void)noteInstallDidFinish:(id)a3
{
  dispatch_time_t v4;
  uint64_t v5;
  NSObject *stateQueue;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[5];

  v4 = dispatch_time(0, 60000000000);
  v5 = MEMORY[0x24BDAC760];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUAutoInstallManager_noteInstallDidFinish___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_after(v4, stateQueue, block);
  v7 = self->_stateQueue;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __45__SUAutoInstallManager_noteInstallDidFinish___block_invoke_2;
  v8[3] = &unk_24CE3B5C0;
  v8[4] = self;
  dispatch_async(v7, v8);
}

void __45__SUAutoInstallManager_noteInstallDidFinish___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_installAttemptDone");
  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cancelAutoInstallStartInstallTask");

}

uint64_t __45__SUAutoInstallManager_noteInstallDidFinish___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_clearAutoInstallOperationForReason:disableKeybagStash:", CFSTR("InstallDidFinish"), 0);
}

- (void)noteInstallDidFail:(id)a3 withError:(id)a4
{
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
  id v15;

  v15 = a4;
  -[SUAutoInstallManager _installAttemptDone](self, "_installAttemptDone");
  objc_msgSend(v15, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeObjectForKey:ofClass:", CFSTR("SUAutomaticInstallation"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    SULogInfo(CFSTR("[SUAutoInstallManager] A previous auto installation failed due to error %@, retrying..."), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v15);

    -[SUAutoInstallManager trySchedulingAutoInstallAgainLater](self, "trySchedulingAutoInstallAgainLater");
  }
  else
  {
    SULogInfo(CFSTR("[SUAutoInstallManager] A previous manual installation failed due to error %@, nothing to do here"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v15);

  }
}

- (BOOL)_queue_isExpired
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[_SUAutoInstallOperationModel forecast](self->_operationModel, "forecast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5) == -1;

  return v6;
}

- (void)_queue_clearAutoInstallOperationForReason:(id)a3 disableKeybagStash:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *stateQueue;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  SUManagerInterface *manager;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  _SUAutoInstallOperationModel *operationModel;
  uint64_t v36;
  uint64_t v37;

  v4 = a4;
  stateQueue = self->_stateQueue;
  v7 = a3;
  dispatch_assert_queue_V2(stateQueue);
  SULogInfo(CFSTR("clearing autoInstallOperation for reason: %@, destroying keybag stash: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);
  LODWORD(stateQueue) = objc_msgSend(v7, "isEqualToString:", CFSTR("InstallDidFinish"));

  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cancelAllAutoInstallTasksIncludingStartInstallTask:", stateQueue ^ 1);

  -[SUManagerInterface setIsInstallTonight:](self->_manager, "setIsInstallTonight:", 0);
  -[SUManagerInterface setIsInstallTonightScheduled:](self->_manager, "setIsInstallTonightScheduled:", 0);
  SULogInfo(CFSTR("Setting isInstallTonightScheduled to NO"), v16, v17, v18, v19, v20, v21, v22, v36);
  -[SUAutoUpdatePasscodePolicy setCurrentPolicyType:](self->_passcodePolicy, "setCurrentPolicyType:", 0);
  self->_autoInstallAttempted = 0;
  -[SUManagerInterface dismissAutoUpdateBanner](self->_manager, "dismissAutoUpdateBanner");
  if ((stateQueue & 1) == 0)
  {
    manager = self->_manager;
    -[SUManagerInterface download](manager, "download");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "descriptor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagerInterface badgeSettingsForManualSoftwareUpdate:](manager, "badgeSettingsForManualSoftwareUpdate:", v25);

  }
  if (!-[SUState stashbagPersisted](self->_state, "stashbagPersisted"))
  {
    v34 = CFSTR("No stashbag has been persisted.");
    goto LABEL_8;
  }
  if (v4)
  {
    -[SUState setStashbagPersisted:](self->_state, "setStashbagPersisted:", 0);
    -[SUState save](self->_state, "save");
    v33 = MKBKeyBagKeyStashCreateWithMode();
    if ((_DWORD)v33)
    {
      SULogInfo(CFSTR("MKBKeyBagKeyStashCreateWithMode returned error %d, continuing.."), v26, v27, v28, v29, v30, v31, v32, v33);
      goto LABEL_9;
    }
    v34 = CFSTR("Stashbag un-persisted successfully");
LABEL_8:
    SULogInfo(v34, v26, v27, v28, v29, v30, v31, v32, v37);
  }
LABEL_9:
  -[SUManagerInterface removeUnlockCallback:](self->_manager, "removeUnlockCallback:", CFSTR("unlockCallbackPersistStash"));
  operationModel = self->_operationModel;
  self->_operationModel = 0;

  -[SUState setLastAutoInstallOperationModel:](self->_state, "setLastAutoInstallOperationModel:", 0);
  -[SUState save](self->_state, "save");
}

- (id)_createOperationModel
{
  void *v2;
  _SUAutoInstallOperationModel *v3;
  void *v4;

  +[SUAutoInstallForecast createForecast](SUAutoInstallForecast, "createForecast");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(_SUAutoInstallOperationModel);
    -[_SUAutoInstallOperationModel setForecast:](v3, "setForecast:", v2);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUAutoInstallOperationModel setId:](v3, "setId:", v4);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (_SUAutoInstallOperationModel)operationModel
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
  v10 = __Block_byref_object_copy__20;
  v11 = __Block_byref_object_dispose__20;
  v12 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__SUAutoInstallManager_operationModel__block_invoke;
  v6[3] = &unk_24CE3B5E8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (_SUAutoInstallOperationModel *)v4;
}

void __38__SUAutoInstallManager_operationModel__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)_installAttemptDone
{
  id v2;

  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAutoInstallActivityStateDone");

}

- (void)setFailedToInstallError:(id)a3
{
  id v4;
  NSObject *stateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUAutoInstallManager_setFailedToInstallError___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(stateQueue, block);

}

uint64_t __48__SUAutoInstallManager_setFailedToInstallError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setFailedToInstallError:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_setFailedToInstallError:(id)a3
{
  NSError *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSError *failedToInstallError;

  v4 = (NSError *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  SULogInfo(CFSTR("_failedToInstallError changed from %@ to %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)self->_failedToInstallError);
  failedToInstallError = self->_failedToInstallError;
  self->_failedToInstallError = v4;

}

+ (id)rollbackRebootLaterTime
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;

  v2 = objc_alloc_init(MEMORY[0x24BE1AFD8]);
  v10 = v2;
  if (v2)
  {
    objc_msgSend(v2, "getUnlockAndSoftwareUpdateTimes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v11;
    if (v11)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE1B160]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SULogInfo(CFSTR("No SoftwareUpdate times found from _CDSleepForAutoSu"), v12, v13, v14, v15, v16, v17, v18, v22);
      v20 = 0;
    }

  }
  else
  {
    SULogInfo(CFSTR("Unable to allocate _CDSleepForAutoSu to get rollback reboot time"), v3, v4, v5, v6, v7, v8, v9, v22);
    v20 = 0;
  }

  return v20;
}

- (SUAutoInstallManagerDelegate)delegate
{
  return (SUAutoInstallManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUState)state
{
  return self->_state;
}

- (SUAutoUpdatePasscodePolicy)passcodePolicy
{
  return self->_passcodePolicy;
}

- (SUSFollowUpController)followUpController
{
  return self->_followUpController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedToInstallError, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_passcodePolicy, 0);
  objc_storeStrong((id *)&self->_operationModel, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
