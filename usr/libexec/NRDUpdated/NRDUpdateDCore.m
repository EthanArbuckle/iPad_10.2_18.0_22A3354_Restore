@implementation NRDUpdateDCore

- (NRDUpdateDCore)initWithDelegate:(id)a3
{
  id v4;
  NRDUpdateDCore *v5;
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
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  void *v21;
  dispatch_queue_t v22;
  dispatch_queue_t v23;
  dispatch_semaphore_t v24;
  OS_dispatch_semaphore *fsmSemaphore;
  id v26;
  NSObject *v27;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  uint8_t buf[16];
  objc_super v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  uint64_t v62;
  const __CFString *v63;
  uint64_t v64;
  const __CFString *v65;
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  uint64_t v74;
  const __CFString *v75;
  uint64_t v76;
  const __CFString *v77;
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[9];
  _QWORD v115[9];

  v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)NRDUpdateDCore;
  v5 = -[NRDUpdateDCore init](&v55, "init");
  if (v5)
  {
    v53 = v4;
    v52 = kSU_S_Startup;
    v114[0] = kSU_S_Startup;
    v112[0] = CFSTR("ProceedToNextUpdateStep");
    v6 = kSUCoreNextStateKey;
    v7 = kSU_S_LoadingPersisted;
    v8 = kSUCoreActionKey;
    v110[0] = kSUCoreNextStateKey;
    v110[1] = kSUCoreActionKey;
    v9 = kSU_A_LoadPersisted;
    v111[0] = kSU_S_LoadingPersisted;
    v111[1] = kSU_A_LoadPersisted;
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v111, v110, 2));
    v113[0] = v51;
    v112[1] = CFSTR("PeriodicScanRequested");
    v108[0] = v6;
    v108[1] = v8;
    v109[0] = v7;
    v109[1] = v9;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v109, v108, 2));
    v113[1] = v50;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v113, v112, 2));
    v115[0] = v49;
    v114[1] = v7;
    v106[0] = CFSTR("NoLocalBrainFound");
    v104[0] = v6;
    v104[1] = v8;
    v105[0] = CFSTR("ScanningBrain");
    v105[1] = CFSTR("ActionBeginBrainScan");
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v105, v104, 2));
    v107[0] = v48;
    v106[1] = CFSTR("LocalBrainFound");
    v102[0] = v6;
    v102[1] = v8;
    v103[0] = CFSTR("CheckingDeviceUnlockConstraint");
    v103[1] = CFSTR("ActionCheckDeviceUnlockConstraint");
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v103, v102, 2));
    v107[1] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v107, v106, 2));
    v115[1] = v46;
    v114[2] = CFSTR("ScanningBrain");
    v100[0] = CFSTR("NoRemoteBrainFound");
    v98[0] = v6;
    v98[1] = v8;
    v99[0] = CFSTR("SchedulingRetry");
    v99[1] = CFSTR("ActionScheduleRetry");
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v99, v98, 2));
    v101[0] = v45;
    v100[1] = CFSTR("ErrorGeneric");
    v96[0] = v6;
    v96[1] = v8;
    v97[0] = CFSTR("SchedulingRetry");
    v97[1] = CFSTR("ActionScheduleRetry");
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v97, v96, 2));
    v101[1] = v44;
    v100[2] = CFSTR("ProceedToNextUpdateStep");
    v94[0] = v6;
    v94[1] = v8;
    v95[0] = CFSTR("DownloadingBrain");
    v95[1] = CFSTR("ActionDownloadBrain");
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v95, v94, 2));
    v101[2] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v101, v100, 3));
    v115[2] = v42;
    v114[3] = CFSTR("DownloadingBrain");
    v92[0] = CFSTR("ProceedToNextUpdateStep");
    v90[0] = v6;
    v90[1] = v8;
    v91[0] = CFSTR("CheckingDeviceUnlockConstraint");
    v91[1] = CFSTR("ActionCheckDeviceUnlockConstraint");
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v91, v90, 2));
    v93[0] = v41;
    v92[1] = kSU_E_DownloadFailed;
    v88[0] = v6;
    v88[1] = v8;
    v89[0] = CFSTR("SchedulingRetry");
    v89[1] = CFSTR("ActionScheduleRetry");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v89, v88, 2));
    v93[1] = v40;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v93, v92, 2));
    v115[3] = v39;
    v114[4] = CFSTR("CheckingDeviceUnlockConstraint");
    v86[0] = CFSTR("DeviceLocked");
    v84[0] = v6;
    v84[1] = v8;
    v85[0] = CFSTR("WaitingForUnlock");
    v85[1] = CFSTR("ActionWaitForUnlock");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v85, v84, 2));
    v87[0] = v38;
    v86[1] = CFSTR("DeviceUnlocked");
    v82[0] = v6;
    v82[1] = v8;
    v83[0] = CFSTR("LoadingBrain");
    v83[1] = CFSTR("ActionLoadBrain");
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v83, v82, 2));
    v87[1] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v87, v86, 2));
    v115[4] = v36;
    v114[5] = CFSTR("WaitingForUnlock");
    v80[0] = CFSTR("DeviceUnlocked");
    v78[0] = v6;
    v78[1] = v8;
    v79[0] = CFSTR("LoadingBrain");
    v79[1] = CFSTR("ActionLoadBrain");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 2));
    v81[0] = v35;
    v80[1] = CFSTR("PeriodicScanRequested");
    v76 = v8;
    v77 = CFSTR("ActionWaitForUnlock");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1));
    v81[1] = v34;
    v80[2] = CFSTR("ProceedToNextUpdateStep");
    v74 = v8;
    v75 = CFSTR("ActionWaitForUnlock");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1));
    v81[2] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v81, v80, 3));
    v115[5] = v32;
    v114[6] = CFSTR("LoadingBrain");
    v72[0] = CFSTR("ProceedToNextUpdateStep");
    v70[0] = v6;
    v70[1] = v8;
    v71[0] = CFSTR("RunningBrain");
    v71[1] = CFSTR("ActionRunBrain");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v71, v70, 2));
    v72[1] = CFSTR("ErrorGeneric");
    v73[0] = v31;
    v68[0] = v6;
    v68[1] = v8;
    v69[0] = CFSTR("SchedulingRetry");
    v69[1] = CFSTR("ActionScheduleRetry");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 2));
    v73[1] = v30;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v73, v72, 2));
    v115[6] = v29;
    v114[7] = CFSTR("RunningBrain");
    v65 = CFSTR("ActionRunBrain");
    v66[0] = CFSTR("ProceedToNextUpdateStep");
    v64 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1));
    v66[1] = CFSTR("PeriodicScanRequested");
    v67[0] = v10;
    v62 = v8;
    v63 = CFSTR("ActionPeriodicScan");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1));
    v67[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 2));
    v115[7] = v12;
    v114[8] = CFSTR("SchedulingRetry");
    v60[0] = CFSTR("ProceedToNextUpdateStep");
    v58[0] = v6;
    v58[1] = v8;
    v59[0] = CFSTR("ScanningBrain");
    v59[1] = CFSTR("ActionBeginBrainScan");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v59, v58, 2));
    v60[1] = CFSTR("PeriodicScanRequested");
    v61[0] = v13;
    v56[0] = v6;
    v56[1] = v8;
    v57[0] = CFSTR("ScanningBrain");
    v57[1] = CFSTR("ActionBeginBrainScan");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v57, v56, 2));
    v61[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v61, v60, 2));
    v115[8] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v115, v114, 9));

    v17 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:copyItems:", v16, 1);
    -[NRDUpdateDCore setStateTable:](v5, "setStateTable:", v17);

    v18 = nrdSharedLogger();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Creating FSM", buf, 2u);
    }

    v20 = objc_msgSend(objc_alloc((Class)SUCoreFSM), "initMachine:withTable:startingIn:", CFSTR("NRDUpdated"), v5->_stateTable, v52);
    -[NRDUpdateDCore setUpdatedFSM:](v5, "setUpdatedFSM:", v20);

    -[NRDUpdateDCore setScanPolicy:](v5, "setScanPolicy:", 0);
    -[NRDUpdateDCore setDownloadPolicy:](v5, "setDownloadPolicy:", 0);
    -[NRDUpdateDCore registerUpdatedFSMhandlers](v5, "registerUpdatedFSMhandlers");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](v5, "updatedFSM"));
    objc_msgSend(v21, "activateMachine");

    v4 = v53;
    -[NRDUpdateDCore setDelegate:](v5, "setDelegate:", v53);
    v22 = dispatch_queue_create("com.apple.NRDUpdated.keybag", 0);
    -[NRDUpdateDCore setKeyBagQueue:](v5, "setKeyBagQueue:", v22);

    v23 = dispatch_queue_create("com.apple.NRDUpdated.update", 0);
    -[NRDUpdateDCore setUpdateQueue:](v5, "setUpdateQueue:", v23);

    v24 = dispatch_semaphore_create(0);
    fsmSemaphore = v5->_fsmSemaphore;
    v5->_fsmSemaphore = (OS_dispatch_semaphore *)v24;

    v26 = nrdSharedLogger();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Initialization of NRDUpdateDCore complete", buf, 2u);
    }

  }
  return v5;
}

- (Class)_infoClassForAction:(id)a3
{
  uint64_t v4;

  if (objc_msgSend(a3, "compare:", CFSTR("ActionScheduleRetry")))
    return (Class)0;
  v4 = objc_opt_class(NSError);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)registerUpdatedFSMhandlers
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore stateTable](self, "stateTable"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __44__NRDUpdateDCore_registerUpdatedFSMhandlers__block_invoke;
  v4[3] = &unk_1000149F8;
  v4[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __44__NRDUpdateDCore_registerUpdatedFSMhandlers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __44__NRDUpdateDCore_registerUpdatedFSMhandlers__block_invoke_2;
  v7[3] = &unk_1000149D0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __44__NRDUpdateDCore_registerUpdatedFSMhandlers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", kSUCoreActionKey));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "updatedFSM"));
    objc_msgSend(v6, "registerAction:ForEvent:inState:usingDelegate:withInfoClass:", v5, v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "_infoClassForAction:", v5));

  }
}

- (id)findLocalBrainAsset
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  dispatch_semaphore_t v16;
  uint8_t buf[4];
  id v18;

  v2 = objc_msgSend(objc_alloc((Class)SUCorePolicyUpdateBrain), "initWithSoftwareUpdateAssetType:documentationAssetType:usingExtensions:", CFSTR("com.apple.MobileAsset.RecoveryOSUpdateBrain"), 0, 0);
  objc_msgSend(v2, "setAllowSameVersion:", 1);
  objc_msgSend(v2, "setRestrictToFull:", 1);
  objc_msgSend(v2, "setReleaseType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
  objc_msgSend(v2, "setCompatibilityVersion:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "constructSoftwareUpdateMAAssetQuery"));
  objc_msgSend(v4, "returnTypes:", 1);
  objc_msgSend(v4, "setDoNotBlockOnNetworkStatus:", 1);
  if (objc_msgSend(v4, "queryMetaDataSync"))
  {
    v5 = nrdSharedLogger();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NRDUpdateDCore findLocalBrainAsset].cold.1();
    v7 = 0;
    v8 = 0;
    goto LABEL_10;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "results"));
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v9 = nrdSharedLogger();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = objc_msgSend(v8, "count");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Found %lu brain assets.  Removing all...", buf, 0xCu);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke;
    v15[3] = &unk_100014A20;
    v16 = dispatch_semaphore_create(0);
    v6 = v16;
    +[SUCorePurge removeAllAssetsOfType:completion:](SUCorePurge, "removeAllAssetsOfType:completion:", CFSTR("com.apple.MobileAsset.RecoveryOSUpdateBrain"), v15);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v8, "count"))
  {
    v14 = nrdSharedLogger();
    v6 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No local brain asset found", buf, 2u);
    }
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v12 = nrdSharedLogger();
  v6 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
    *(_DWORD *)buf = 138412290;
    v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found local brain asset:%@", buf, 0xCu);

  }
LABEL_10:

  return v7;
}

void __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing all update brain assets succeeded", v7, 2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)cleanReScanScheduler
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore rescanScheduler](self, "rescanScheduler"));

  if (v3)
  {
    v4 = nrdSharedLogger();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore rescanScheduler](self, "rescanScheduler"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore rescanScheduler](self, "rescanScheduler"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Invalidating Activity %@ \"%@\", (uint8_t *)&v10, 0x16u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore rescanScheduler](self, "rescanScheduler"));
    objc_msgSend(v9, "invalidate");

    -[NRDUpdateDCore setRescanScheduler:](self, "setRescanScheduler:", 0);
  }
}

- (int64_t)actionLoadPersisted:(id *)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  int v28;
  void *v29;

  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v28) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionLoadPersisted", (uint8_t *)&v28, 2u);
  }

  v6 = -[NRDUpdateDCore forceBrainUpdate](self, "forceBrainUpdate");
  -[NRDUpdateDCore setForceBrainUpdate:](self, "setForceBrainUpdate:", 0);
  -[NRDUpdateDCore cleanBeforeScan](self, "cleanBeforeScan");
  -[NRDUpdateDCore cleanReScanScheduler](self, "cleanReScanScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("NRDBrainPath")));

  if (!v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateOptions](self, "updateOptions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("__nrd_brain-location_key")));

    if (v12)
    {
      v13 = nrdSharedLogger();
      v10 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateOptions](self, "updateOptions"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("__nrd_brain-location_key")));
        v28 = 138412290;
        v29 = v15;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Brain path specified by options:%@, skipping scan", (uint8_t *)&v28, 0xCu);

      }
      goto LABEL_9;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore findLocalBrainAsset](self, "findLocalBrainAsset"));
    if (v16)
    {
      -[NRDUpdateDCore setLocalBrainAsset:](self, "setLocalBrainAsset:", v16);
      v18 = nrdSharedLogger();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (!v6)
      {
        if (v20)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetId"));
          v28 = 138412290;
          v29 = v27;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found brain asset:%@ on disk, skipping scan", (uint8_t *)&v28, 0xCu);

        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
        v25 = v24;
        v26 = CFSTR("LocalBrainFound");
        goto LABEL_23;
      }
      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetId"));
        v28 = 138412290;
        v29 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found brain asset:%@ on disk but forced to scan again", (uint8_t *)&v28, 0xCu);

      }
    }
    else
    {
      v22 = nrdSharedLogger();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Could not find brain asset on disk, going to scan", (uint8_t *)&v28, 2u);
      }

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    v25 = v24;
    v26 = CFSTR("NoLocalBrainFound");
LABEL_23:
    objc_msgSend(v24, "postEvent:", v26);

    goto LABEL_10;
  }
  v9 = nrdSharedLogger();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138412290;
    v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Brain path specified by a default:%@, skipping scan", (uint8_t *)&v28, 0xCu);
  }
LABEL_9:

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
  objc_msgSend(v16, "postEvent:", CFSTR("LocalBrainFound"));
LABEL_10:

  return 0;
}

- (void)cleanBeforeScan
{
  -[NRDUpdateDCore setUuid:](self, "setUuid:", 0);
  -[NRDUpdateDCore setUpdateBrainAsset:](self, "setUpdateBrainAsset:", 0);
}

- (int64_t)actionBeginBrainScan:(id *)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  id v21;
  NSObject *v22;
  void *v23;
  SUCoreScan *scanner;
  void *v25;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  void *v30;

  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionBeginBrainScan", buf, 2u);
  }

  -[NRDUpdateDCore cleanBeforeScan](self, "cleanBeforeScan");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));

  v8 = objc_msgSend(objc_alloc((Class)SUCoreScan), "initWithUUID:", v7);
  -[NRDUpdateDCore setScanner:](self, "setScanner:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore scanPolicy](self, "scanPolicy"));

  if (!v9)
  {
    v10 = objc_msgSend(objc_alloc((Class)SUCorePolicyUpdateBrain), "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:", CFSTR("com.apple.MobileAsset.RecoveryOSUpdateBrain"), 0, 127, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "softwareUpdateScanPolicy"));
    objc_msgSend(v11, "setAllowSameVersion:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "softwareUpdateScanPolicy"));
    objc_msgSend(v12, "setRestrictToFull:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "softwareUpdateScanPolicy"));
    objc_msgSend(v13, "setDisableUI:", 1);

    objc_msgSend(v10, "setReleaseType:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    objc_msgSend(v10, "setCompatibilityVersion:", v14);

    -[NRDUpdateDCore setScanPolicy:](self, "setScanPolicy:", v10);
  }
  v15 = nrdSharedLogger();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore scanPolicy](self, "scanPolicy"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "description"));
    *(_DWORD *)buf = 138412290;
    v30 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "ScanPolicy: %@", buf, 0xCu);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateAttempt](self, "updateAttempt"));
  v20 = (char *)objc_msgSend(v19, "unsignedLongLongValue") + 1;

  if ((unint64_t)v20 < 4)
  {
    scanner = self->_scanner;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore scanPolicy](self, "scanPolicy"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = __39__NRDUpdateDCore_actionBeginBrainScan___block_invoke;
    v27[3] = &unk_100014A48;
    v27[4] = self;
    v28 = v7;
    -[SUCoreScan locateAvailableUpdateWithPolicy:completion:](scanner, "locateAvailableUpdateWithPolicy:completion:", v25, v27);

  }
  else
  {
    v21 = nrdSharedLogger();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[NRDUpdateDCore actionBeginBrainScan:].cold.1();

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    objc_msgSend(v23, "postEvent:", CFSTR("ErrorGeneric"));

  }
  return 0;
}

void __39__NRDUpdateDCore_actionBeginBrainScan___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = nrdSharedLogger();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __39__NRDUpdateDCore_actionBeginBrainScan___block_invoke_cold_1();

    v25[0] = NSDebugDescriptionErrorKey;
    v25[1] = NSUnderlyingErrorKey;
    v26[0] = CFSTR("brain scan failed");
    v26[1] = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdatedDomain"), 607, v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "updatedFSM"));
    objc_msgSend(v16, "postEvent:withInfo:", CFSTR("ErrorGeneric"), v15);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412546;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Scan returned with success\n primaryUpdateAsset: %@\n secondaryUpdateAsset: %@\n", (uint8_t *)&v21, 0x16u);
    }

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "setUpdateBrainAsset:", v8);
      objc_msgSend(*(id *)(a1 + 32), "setUuid:", *(_QWORD *)(a1 + 40));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "updatedFSM"));
      v15 = v17;
      v18 = CFSTR("ProceedToNextUpdateStep");
    }
    else
    {
      v19 = nrdSharedLogger();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No brain update found", (uint8_t *)&v21, 2u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "updatedFSM"));
      v15 = v17;
      v18 = CFSTR("NoRemoteBrainFound");
    }
    objc_msgSend(v17, "postEvent:", v18);
  }

}

- (int64_t)actionDownloadBrainUpdate:(id *)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
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
  int64_t v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t v36[16];

  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v36 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionDownloadBrainUpdate", v36, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateBrainAsset](self, "updateBrainAsset"));
  if (v6)
  {
    v7 = objc_alloc((Class)SUCoreMobileAsset);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateBrainAsset](self, "updateBrainAsset"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore uuid](self, "uuid"));
    v10 = objc_msgSend(v7, "initWithDelegate:forAsset:updateUUID:", self, v8, v9);

    -[NRDUpdateDCore setMaControl:](self, "setMaControl:", v10);
    v11 = objc_msgSend(objc_alloc((Class)SUCorePolicyUpdateBrain), "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:", CFSTR("com.apple.MobileAsset.RecoveryOSUpdateBrain"), 0, 127, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadBrainPolicy"));
    objc_msgSend(v12, "setDiscretionary:", 0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadBrainPolicy"));
    objc_msgSend(v13, "setDisableUI:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "loadBrainPolicy"));
    objc_msgSend(v14, "setAllowsCellular:", 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "downloadPreflightPolicy"));
    objc_msgSend(v15, "setDiscretionary:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "downloadPreflightPolicy"));
    objc_msgSend(v16, "setDisableUI:", 1);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "downloadPreflightPolicy"));
    objc_msgSend(v17, "setAllowsCellular:", 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "softwareUpdateDownloadPolicy"));
    objc_msgSend(v18, "setDiscretionary:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "softwareUpdateDownloadPolicy"));
    objc_msgSend(v19, "setDisableUI:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "softwareUpdateDownloadPolicy"));
    objc_msgSend(v20, "setAllowsCellular:", 0);

    objc_msgSend(v11, "setReleaseType:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    objc_msgSend(v11, "setCompatibilityVersion:", v21);

    -[NRDUpdateDCore setDownloadPolicy:](self, "setDownloadPolicy:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore maControl](self, "maControl"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore downloadPolicy](self, "downloadPolicy"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore uuid](self, "uuid"));
    objc_msgSend(v22, "downloadSoftwareUpdateAssetWithPolicy:withUUID:", v23, v24);

    v25 = 0;
  }
  else
  {
    v26 = nrdSharedLogger();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[NRDUpdateDCore actionDownloadBrainUpdate:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    objc_msgSend(v10, "postEvent:", CFSTR("ErrorGeneric"));
    v25 = 8700;
  }

  return v25;
}

- (void)maDownloadProgress:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Download progress is : %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)maDownloadStalled:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Download is currently stalled : %@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)maDownloaded:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = nrdSharedLogger();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Update brain asset has downloaded successfully : %@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
  objc_msgSend(v7, "postEvent:", CFSTR("ProceedToNextUpdateStep"));

}

- (void)maDownloadFailed:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v4 = a3;
  v5 = nrdSharedLogger();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[NRDUpdateDCore maDownloadFailed:].cold.1();

  v10[0] = NSDebugDescriptionErrorKey;
  v10[1] = NSUnderlyingErrorKey;
  v11[0] = CFSTR("Update brain asset download failed");
  v11[1] = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdatedDomain"), 608, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
  objc_msgSend(v9, "postEvent:withInfo:", kSU_E_DownloadFailed, v8);

}

- (BOOL)brainLoadRequiresUnlock
{
  return 1;
}

- (int64_t)actionCheckDeviceUnlockConstraint:(id *)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  unsigned __int8 v10;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const char *v17;
  _QWORD handler[5];
  uint8_t buf[16];

  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionCheckDeviceUnlockConstraint", buf, 2u);
  }

  v6 = -[NRDUpdateDCore brainLoadRequiresUnlock](self, "brainLoadRequiresUnlock");
  v7 = nrdSharedLogger();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      v17 = "brain load does not require unlock";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    }
LABEL_15:

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    v15 = v14;
    v16 = CFSTR("DeviceUnlocked");
    goto LABEL_16;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "brain load requires unlock", buf, 2u);
  }

  v10 = -[NRDUpdateDCore isPasscodeLocked](self, "isPasscodeLocked");
  v11 = nrdSharedLogger();
  v8 = objc_claimAutoreleasedReturnValue(v11);
  v12 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) == 0)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      v17 = "device is unlocked";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (v12)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Need to wait for device unlock before loading brain", buf, 2u);
  }

  -[NRDUpdateDCore setKeyBagStateChangedNotifyToken:](self, "setKeyBagStateChangedNotifyToken:", 0xFFFFFFFFLL);
  v13 = objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore keyBagQueue](self, "keyBagQueue"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __52__NRDUpdateDCore_actionCheckDeviceUnlockConstraint___block_invoke;
  handler[3] = &unk_100014A70;
  handler[4] = self;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &self->_keyBagStateChangedNotifyToken, v13, handler);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
  v15 = v14;
  v16 = CFSTR("DeviceLocked");
LABEL_16:
  objc_msgSend(v14, "postEvent:", v16);

  return 0;
}

void __52__NRDUpdateDCore_actionCheckDeviceUnlockConstraint___block_invoke(uint64_t a1)
{
  unsigned int v2;
  id v3;
  NSObject *v4;
  const __CFString *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  const __CFString *v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isPasscodeLocked");
  v3 = nrdSharedLogger();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v2)
      v5 = CFSTR("YES");
    v9 = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device lock status changed: passcodeLocked = %@", (uint8_t *)&v9, 0xCu);
  }

  if ((v2 & 1) == 0)
  {
    v6 = nrdSharedLogger();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device unlocked, sending device unlocked event", (uint8_t *)&v9, 2u);
    }

    notify_cancel((int)objc_msgSend(*(id *)(a1 + 32), "keyBagStateChangedNotifyToken"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "updatedFSM"));
    objc_msgSend(v8, "postEvent:", CFSTR("DeviceUnlocked"));

  }
}

- (int64_t)actionWaitForUnlock:(id *)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v10[8];
  NSErrorUserInfoKey v11;
  const __CFString *v12;

  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionWaitForUnlock", v10, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
  v11 = NSDebugDescriptionErrorKey;
  v12 = CFSTR("Device is locked, unable to load brain");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdatedDomain"), 601, v7));
  objc_msgSend(v6, "updateCompleted:", v8);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_fsmSemaphore);
  return 0;
}

- (int64_t)actionLoadBrain:(id *)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  _QWORD v59[2];
  _QWORD v60[2];
  NSErrorUserInfoKey v61;
  const __CFString *v62;
  NSErrorUserInfoKey v63;
  const __CFString *v64;
  uint8_t buf[4];
  void *v66;

  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionLoadBrain", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("NRDBrainPath")));

  if (v7)
  {
    v8 = nrdSharedLogger();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Defaults specified brain path is %@", buf, 0xCu);
    }

    -[NRDUpdateDCore setUpdateOptions:](self, "setUpdateOptions:", 0);
    goto LABEL_11;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateOptions](self, "updateOptions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("__nrd_brain-location_key")));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateOptions](self, "updateOptions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("__nrd_brain-location_key")));

    v13 = nrdSharedLogger();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Option specified brain path is %@", buf, 0xCu);
    }

    -[NRDUpdateDCore setUpdateOptions:](self, "setUpdateOptions:", 0);
    if (v7)
      goto LABEL_11;
    goto LABEL_29;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateBrainAsset](self, "updateBrainAsset"));

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateBrainAsset](self, "updateBrainAsset"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "getLocalUrl"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "path"));

    v29 = nrdSharedLogger();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v7;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Downloaded brain path is %@", buf, 0xCu);
    }

    v31 = objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateBrainAsset](self, "updateBrainAsset"));
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore localBrainAsset](self, "localBrainAsset"));

    if (!v32)
    {
      v49 = nrdSharedLogger();
      v50 = objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        -[NRDUpdateDCore actionLoadBrain:].cold.1(v50, v51, v52, v53, v54, v55, v56, v57);

      v63 = NSDebugDescriptionErrorKey;
      v64 = CFSTR("LoadingBrain state was reached without either a downloaded brain or an existing local brain");
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
      v48 = 600;
      goto LABEL_32;
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore localBrainAsset](self, "localBrainAsset"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "getLocalUrl"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "path"));

    v35 = nrdSharedLogger();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v7;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Existing local brain path is %@", buf, 0xCu);
    }

    v31 = objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore localBrainAsset](self, "localBrainAsset"));
  }
  v37 = (void *)v31;
  -[NRDUpdateDCore setLoadBrainAsset:](self, "setLoadBrainAsset:", v31);

  if (!v7)
  {
LABEL_29:
    v38 = nrdSharedLogger();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      -[NRDUpdateDCore actionLoadBrain:].cold.2(v39, v40, v41, v42, v43, v44, v45, v46);

    v61 = NSDebugDescriptionErrorKey;
    v62 = CFSTR("brain path is nil");
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
    v48 = 603;
LABEL_32:
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdatedDomain"), v48, v47));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    objc_msgSend(v7, "postEvent:withInfo:", CFSTR("ErrorGeneric"), v17);
    goto LABEL_19;
  }
LABEL_11:
  v15 = nrdSharedLogger();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Trying to load update brain", buf, 2u);
  }

  v58 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NRDUpdateBrainLoader brainAtPath:delegate:error:](NRDUpdateBrainLoader, "brainAtPath:delegate:error:", v7, self, &v58));
  v18 = v58;
  v19 = v18;
  if (v18)
  {
    v59[0] = NSDebugDescriptionErrorKey;
    v59[1] = NSUnderlyingErrorKey;
    v60[0] = CFSTR("load brain failed");
    v60[1] = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v60, v59, 2));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdatedDomain"), 602, v20));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    objc_msgSend(v22, "postEvent:withInfo:", CFSTR("ErrorGeneric"), v21);

  }
  else
  {
    -[NRDUpdateDCore setBrain:](self, "setBrain:", v17);
    v23 = nrdSharedLogger();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "update brain load succeeded", buf, 2u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    objc_msgSend(v21, "postEvent:", CFSTR("ProceedToNextUpdateStep"));
  }

LABEL_19:
  return 0;
}

- (int64_t)actionRunBrain:(id *)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];
  _QWORD block[5];
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[2];

  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionRunBrain", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x2020000000;
  v21 = 3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __33__NRDUpdateDCore_actionRunBrain___block_invoke;
  block[3] = &unk_100014A98;
  block[4] = buf;
  if (actionRunBrain__onceToken != -1)
    dispatch_once(&actionRunBrain__onceToken, block);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateOptions](self, "updateOptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("__nrd_brain-location_key")));

  if (v7 && +[NRDUpdateBrainLoader isBrainLoaded](NRDUpdateBrainLoader, "isBrainLoaded"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
    objc_msgSend(v8, "requestExit:reason:", 0, CFSTR("A new NRD brain will be loaded from an option-specified local path."));

    v22[0] = NSDebugDescriptionErrorKey;
    v22[1] = CFSTR("com.apple.NRD-Resend");
    v23[0] = CFSTR("new local brain load needed");
    v23[1] = &__kCFBooleanTrue;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdatedDomain"), 610, v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
    objc_msgSend(v11, "updateCompleted:", v10);

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_fsmSemaphore);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore brain](self, "brain"));
    v13 = *((_QWORD *)v19 + 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateOptions](self, "updateOptions"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __33__NRDUpdateDCore_actionRunBrain___block_invoke_2;
    v16[3] = &unk_100014A20;
    v16[4] = self;
    objc_msgSend(v12, "run:options:callback:", v13, v14, v16);

  }
  _Block_object_dispose(buf, 8);
  return 0;
}

uint64_t __33__NRDUpdateDCore_actionRunBrain___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

void __33__NRDUpdateDCore_actionRunBrain___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[8];
  _QWORD v17[2];
  _QWORD v18[2];

  v3 = a2;
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("NRDUpdateErrorDomain")) & 1) != 0)
  {
    v6 = objc_msgSend(v4, "code");

    if (v6 == (id)111)
    {
LABEL_4:
      v7 = nrdSharedLogger();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "brain run completed successfully", v16, 2u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "brain"));
      objc_msgSend(*(id *)(a1 + 32), "setRunningBrain:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
      objc_msgSend(v10, "updateCompleted:", 0);

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 8));
      goto LABEL_11;
    }
  }
  else
  {

  }
  v11 = nrdSharedLogger();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __33__NRDUpdateDCore_actionRunBrain___block_invoke_2_cold_1();

  v17[0] = NSDebugDescriptionErrorKey;
  v17[1] = NSUnderlyingErrorKey;
  v18[0] = CFSTR("run brain failed");
  v18[1] = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdatedDomain"), 609, v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v15, "updateCompleted:", v14);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 8));
LABEL_11:

}

- (int64_t)actionScheduleRetry:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v5 = a3;
  v6 = nrdSharedLogger();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "In actionScheduleRetry", buf, 2u);
  }

  v8 = nrdSharedLogger();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removing all update brain assets", buf, 2u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __44__NRDUpdateDCore_actionScheduleRetry_error___block_invoke;
  v12[3] = &unk_100014AC0;
  v12[4] = self;
  v13 = v5;
  v10 = v5;
  +[SUCorePurge removeAllAssetsOfType:completion:](SUCorePurge, "removeAllAssetsOfType:completion:", CFSTR("com.apple.MobileAsset.RecoveryOSUpdateBrain"), v12);

  return 0;
}

void __44__NRDUpdateDCore_actionScheduleRetry_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing all update brain assets succeeded", v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "scheduleNRDUpdateBrainReScan:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v7, "updateCompleted:", *(_QWORD *)(a1 + 40));

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (int64_t)actionPeriodicScan:(id *)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[5];
  uint8_t buf[16];

  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionPeriodicScan", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore runningBrain](self, "runningBrain"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore runningBrain](self, "runningBrain"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __37__NRDUpdateDCore_actionPeriodicScan___block_invoke;
    v11[3] = &unk_100014A20;
    v11[4] = self;
    objc_msgSend(v7, "run:callback:", 4, v11);

  }
  else
  {
    v8 = nrdSharedLogger();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "actionPeriodicScan no running brain", buf, 2u);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_fsmSemaphore);
  }
  return 0;
}

void __37__NRDUpdateDCore_actionPeriodicScan___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;

  v3 = a2;
  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_cold_1();

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 8));
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "brain run idle completed successfully", buf, 2u);
    }

    v7 = objc_alloc((Class)SUCoreScan);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "UUIDString"));
    v10 = objc_msgSend(v7, "initWithUUID:", v9);

    v11 = objc_msgSend(objc_alloc((Class)SUCorePolicyUpdateBrain), "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:", CFSTR("com.apple.MobileAsset.RecoveryOSUpdateBrain"), 0, 127, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "softwareUpdateScanPolicy"));
    objc_msgSend(v12, "setAllowSameVersion:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "softwareUpdateScanPolicy"));
    objc_msgSend(v13, "setRestrictToFull:", 1);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "softwareUpdateScanPolicy"));
    objc_msgSend(v14, "setDisableUI:", 1);

    objc_msgSend(v11, "setReleaseType:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 1));
    objc_msgSend(v11, "setCompatibilityVersion:", v15);

    v16 = nrdSharedLogger();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Periodic ScanPolicy: %@", buf, 0xCu);

    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_281;
    v21[3] = &unk_100014A48;
    v19 = *(_QWORD *)(a1 + 32);
    v22 = v10;
    v23 = v19;
    v20 = v10;
    objc_msgSend(v20, "locateAvailableUpdateWithPolicy:completion:", v11, v21);

  }
}

void __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_281(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  unsigned int v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  id v26;
  void *v27;
  NSObject *v28;
  id v29;
  _BOOL4 v30;
  int v31;
  NSObject *v32;
  __int16 v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = nrdSharedLogger();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_281_cold_1();
    goto LABEL_26;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 138412546;
    v32 = v8;
    v33 = 2112;
    v34 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Periodic Scan returned with success\n primaryUpdateAsset: %@\n secondaryUpdateAsset: %@\n", (uint8_t *)&v31, 0x16u);
  }

  if (v8)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[NSObject assetProperty:](v8, "assetProperty:", CFSTR("Build")));
    if (!v13)
      v13 = objc_claimAutoreleasedReturnValue(-[NSObject assetProperty:](v8, "assetProperty:", CFSTR("_MasteredVersion")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "loadBrainAsset"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetProperty:", CFSTR("Build")));

    if (!v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "loadBrainAsset"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "assetProperty:", CFSTR("_MasteredVersion")));

    }
    v17 = nrdSharedLogger();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v31 = 138412546;
      v32 = v13;
      v33 = 2112;
      v34 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Periodic Scan found brain version:%@, existing version:%@", (uint8_t *)&v31, 0x16u);
    }

    v19 = objc_msgSend(v15, "isEqual:", v13);
    v20 = nrdSharedLogger();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v22)
      {
        LOWORD(v31) = 0;
        v23 = "Periodic Scan returned with the existing brain asset";
        v24 = v21;
        v25 = 2;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v31, v25);
      }
    }
    else
    {
      if (v22)
      {
        LOWORD(v31) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Periodic Scan returned with new brain asset, purging old asset", (uint8_t *)&v31, 2u);
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "loadBrainAsset"));
      v28 = objc_msgSend(v27, "purgeSync");

      v29 = nrdSharedLogger();
      v21 = objc_claimAutoreleasedReturnValue(v29);
      v30 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (!v28)
      {
        if (v30)
        {
          LOWORD(v31) = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Purged old brain asset, send new brain notification", (uint8_t *)&v31, 2u);
        }

        objc_msgSend(*(id *)(a1 + 40), "newBrain:", v13);
        goto LABEL_25;
      }
      if (v30)
      {
        v31 = 134217984;
        v32 = v28;
        v23 = "Purging old brain asset failed with result:%ld";
        v24 = v21;
        v25 = 12;
        goto LABEL_23;
      }
    }

LABEL_25:
    goto LABEL_26;
  }
  v26 = nrdSharedLogger();
  v13 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No brain update found", (uint8_t *)&v31, 2u);
  }
LABEL_26:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 8));
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a3;
  v5 = nrdSharedLogger();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[NRDUpdateDCore actionUnknownAction:error:].cold.1();

  return 8113;
}

- (int64_t)getSchedulerQOS
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  int64_t v8;
  int v10;
  const __CFString *v11;
  __int16 v12;
  void *v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", CFSTR("SchedulerQOS")));

  if (!v3)
    goto LABEL_13;
  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = CFSTR("SchedulerQOS");
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Found %@=%@ in preferences", (uint8_t *)&v10, 0x16u);
  }

  if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("Background")))
  {
    if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("Utility")))
    {
      if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("UserInitiated")))
      {
        if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("UserInteractive")))
        {
          if (objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("Default")))
          {
            v6 = nrdSharedLogger();
            v7 = objc_claimAutoreleasedReturnValue(v6);
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
              -[NRDUpdateDCore getSchedulerQOS].cold.1();

          }
          v8 = -1;
        }
        else
        {
          v8 = 33;
        }
      }
      else
      {
        v8 = 25;
      }
    }
    else
    {
      v8 = 17;
    }
  }
  else
  {
LABEL_13:
    v8 = 9;
  }

  return v8;
}

- (double)_minimumInterval:(double)a3
{
  double v3;
  id v4;
  NSObject *v5;
  int v7;
  double v8;
  __int16 v9;
  uint64_t v10;

  v3 = a3;
  if (a3 < 60.0)
  {
    v4 = nrdSharedLogger();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134218240;
      v8 = v3;
      v9 = 2048;
      v10 = 0x404E000000000000;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "interval of %.1f seconds is too low. clamping to %.1f seconds.", (uint8_t *)&v7, 0x16u);
    }

    return 60.0;
  }
  return v3;
}

- (void)scheduleNRDUpdateBrainReScan:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  xpc_object_t v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  unsigned int v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  NRDUpdateDCore *v22;
  char v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  const __CFString *v28;

  v3 = a3;
  -[NRDUpdateDCore cleanReScanScheduler](self, "cleanReScanScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("NRDBrainReScanInterval")));

  if (v6)
  {
    v7 = nrdSharedLogger();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = CFSTR("NRDBrainReScanInterval");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found %@ in defaults", buf, 0xCu);
    }

    objc_msgSend(v6, "doubleValue");
    -[NRDUpdateDCore _minimumInterval:](self, "_minimumInterval:");
    v10 = v9;
  }
  else
  {
    v10 = (double)XPC_ACTIVITY_INTERVAL_1_HOUR;
  }
  v11 = objc_msgSend(objc_alloc((Class)NSBackgroundActivityScheduler), "initWithIdentifier:", CFSTR("com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_download"));
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setInterval:", v10);
    objc_msgSend(v12, "setQualityOfService:", -[NRDUpdateDCore getSchedulerQOS](self, "getSchedulerQOS"));
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
    objc_msgSend(v12, "_setAdditionalXPCActivityProperties:", v13);
    -[NRDUpdateDCore setRescanScheduler:](self, "setRescanScheduler:", v12);
    v14 = nrdSharedLogger();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Checking in retry activity for brain scan", buf, 2u);
      }

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = __47__NRDUpdateDCore_scheduleNRDUpdateBrainReScan___block_invoke;
      v24[3] = &unk_1000148A0;
      v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
      v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
      v17 = v26;
      v15 = v25;
      objc_msgSend(v12, "setCheckInHandler:", v24);
      objc_msgSend(v12, "setPreregistered:", 1);

    }
    else if (v16)
    {
      *(_DWORD *)buf = 134217984;
      v28 = *(const __CFString **)&v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Scheduling a retry for brain update in %lf seconds", buf, 0xCu);
    }

    v18 = +[NRDUpdateBrainLoader isBrainLoaded](NRDUpdateBrainLoader, "isBrainLoaded");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = __47__NRDUpdateDCore_scheduleNRDUpdateBrainReScan___block_invoke_303;
    v20[3] = &unk_100014AE8;
    v23 = v18;
    v21 = v12;
    v22 = self;
    objc_msgSend(v21, "scheduleWithBlock:", v20);
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
      objc_msgSend(v19, "requestExit:reason:", 0, CFSTR("NRD brain service has already been bootstrapped into the xpc namespace of this process."));

    }
  }
  else
  {
    v13 = (xpc_object_t)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
    objc_msgSend(v13, "requestExit:reason:", 1, CFSTR("Failed to schedule a retry for NRD brain update"));
  }

}

void __47__NRDUpdateDCore_scheduleNRDUpdateBrainReScan___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  v2 = nrdSharedLogger();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" check-in.", (uint8_t *)&v10, 0x16u);
  }

  v6 = nrdSharedLogger();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" check-in complete.", (uint8_t *)&v10, 0x16u);
  }

}

void __47__NRDUpdateDCore_scheduleNRDUpdateBrainReScan___block_invoke_303(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  id v11;
  uint64_t v12;
  int v13;
  void *v14;

  v3 = a2;
  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    v13 = 138412290;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activity %@ fired", (uint8_t *)&v13, 0xCu);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldDefer"))
  {
    v7 = nrdSharedLogger();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
      v13 = 138412290;
      v14 = v9;
      v10 = "Activity %@ is deferred";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);

    }
  }
  else
  {
    if (!*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 40), "performUpdate:", &off_100015AF0);
      v12 = 1;
      goto LABEL_11;
    }
    v11 = nrdSharedLogger();
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
      v13 = 138412290;
      v14 = v9;
      v10 = "Activity %@ will be deferred because daemon needs to exit.";
      goto LABEL_9;
    }
  }

  v12 = 2;
LABEL_11:
  v3[2](v3, v12);

}

- (void)scheduleNRDUpdateBrainPeriodicScan
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  xpc_object_t v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  NRDUpdateDCore *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  NRDUpdateDCore *v22;
  double v23;
  uint8_t buf[4];
  const __CFString *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("NRDBrainPeriodicScanInterval")));

  if (v4)
  {
    v5 = nrdSharedLogger();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = CFSTR("NRDBrainPeriodicScanInterval");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found %@ in defaults", buf, 0xCu);
    }

    objc_msgSend(v4, "doubleValue");
    -[NRDUpdateDCore _minimumInterval:](self, "_minimumInterval:");
    v8 = v7;
  }
  else
  {
    v8 = (double)XPC_ACTIVITY_INTERVAL_7_DAYS;
  }
  v9 = objc_msgSend(objc_alloc((Class)NSBackgroundActivityScheduler), "initWithIdentifier:", CFSTR("com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_autoscan"));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setInterval:", v8);
    objc_msgSend(v10, "setDelay:", v8 * 0.5);
    objc_msgSend(v10, "setQualityOfService:", -[NRDUpdateDCore getSchedulerQOS](self, "getSchedulerQOS"));
    v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v11, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    xpc_dictionary_set_BOOL(v11, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
    objc_msgSend(v10, "_setAdditionalXPCActivityProperties:", v11);
    -[NRDUpdateDCore setPeriodicScheduler:](self, "setPeriodicScheduler:", v10);
    v12 = nrdSharedLogger();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Checking in periodic activity for brain scan", buf, 2u);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __52__NRDUpdateDCore_scheduleNRDUpdateBrainPeriodicScan__block_invoke;
    v19[3] = &unk_100014B10;
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
    v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v22 = self;
    v23 = v8;
    v14 = v21;
    v15 = v20;
    objc_msgSend(v10, "setCheckInHandler:", v19);
    objc_msgSend(v10, "setPreregistered:", 1);
    objc_msgSend(v10, "setRepeats:", 1);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = __52__NRDUpdateDCore_scheduleNRDUpdateBrainPeriodicScan__block_invoke_316;
    v16[3] = &unk_1000147A0;
    v17 = v10;
    v18 = self;
    objc_msgSend(v17, "scheduleWithBlock:", v16);

  }
  else
  {
    v11 = (xpc_object_t)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
    objc_msgSend(v11, "requestExit:reason:", 1, CFSTR("Failed to schedule periodic scan for NRD brain update"));
  }

}

void __52__NRDUpdateDCore_scheduleNRDUpdateBrainPeriodicScan__block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  double v33;

  v2 = nrdSharedLogger();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v28 = 138412546;
    v29 = v4;
    v30 = 2112;
    v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" check-in.", (uint8_t *)&v28, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "periodicScheduler"));
  objc_msgSend(v6, "interval");
  v8 = v7;

  v9 = nrdSharedLogger();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "periodicScheduler"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "periodicScheduler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    v28 = 138412802;
    v29 = v11;
    v30 = 2112;
    v31 = v13;
    v32 = 2048;
    v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" was preregistered with interval: %lf", (uint8_t *)&v28, 0x20u);

  }
  v14 = *(double *)(a1 + 56);
  if (v14 != v8)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "periodicScheduler"));
    objc_msgSend(v15, "setInterval:", v14);

    v16 = *(double *)(a1 + 56) * 0.5;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "periodicScheduler"));
    objc_msgSend(v17, "setDelay:", v16);

    v18 = nrdSharedLogger();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "periodicScheduler"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "periodicScheduler"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
      v23 = *(double *)(a1 + 56);
      v28 = 138412802;
      v29 = v20;
      v30 = 2112;
      v31 = v22;
      v32 = 2048;
      v33 = v23;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" new interval: %lf", (uint8_t *)&v28, 0x20u);

    }
  }
  v24 = nrdSharedLogger();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = *(void **)(a1 + 32);
    v27 = *(void **)(a1 + 40);
    v28 = 138412546;
    v29 = v26;
    v30 = 2112;
    v31 = v27;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" check-in complete.", (uint8_t *)&v28, 0x16u);
  }

}

void __52__NRDUpdateDCore_scheduleNRDUpdateBrainPeriodicScan__block_invoke_316(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;

  v3 = a2;
  v4 = nrdSharedLogger();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
    v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activity %@ fired", (uint8_t *)&v11, 0xCu);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldDefer"))
  {
    v7 = nrdSharedLogger();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
      v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Activity %@ is deferred", (uint8_t *)&v11, 0xCu);

    }
    v10 = 2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "performUpdate:", &off_100015B18);
    v10 = 1;
  }
  v3[2](v3, v10);

}

- (BOOL)isPasscodeLocked
{
  unsigned int v2;
  _QWORD v5[2];
  _QWORD v6[2];

  v5[0] = kMKBUserSessionIDKey;
  v5[1] = CFSTR("ExtendedDeviceLockState");
  v6[0] = &off_100015A80;
  v6[1] = &__kCFBooleanTrue;
  v2 = MKBGetDeviceLockState(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 2));
  return (v2 < 7) & (0x46u >> v2);
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  int64_t v21;
  int64_t v22;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = nrdSharedLogger();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138413058;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    v30 = 2112;
    v31 = v18;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PerformAction: Action:%@ Event:%@ inState:%@ nextState:%@", (uint8_t *)&v24, 0x2Au);
  }

  if ((objc_msgSend(v14, "isEqualToString:", kSUCoreFSMActionNoOp) & 1) != 0)
  {
    v21 = 0;
  }
  else
  {
    if (objc_msgSend(v14, "isEqualToString:", kSU_A_LoadPersisted))
    {
      v22 = -[NRDUpdateDCore actionLoadPersisted:](self, "actionLoadPersisted:", a8);
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("ActionBeginBrainScan")))
    {
      v22 = -[NRDUpdateDCore actionBeginBrainScan:](self, "actionBeginBrainScan:", a8);
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("ActionDownloadBrain")))
    {
      v22 = -[NRDUpdateDCore actionDownloadBrainUpdate:](self, "actionDownloadBrainUpdate:", a8);
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("ActionCheckDeviceUnlockConstraint")))
    {
      v22 = -[NRDUpdateDCore actionCheckDeviceUnlockConstraint:](self, "actionCheckDeviceUnlockConstraint:", a8);
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("ActionWaitForUnlock")))
    {
      v22 = -[NRDUpdateDCore actionWaitForUnlock:](self, "actionWaitForUnlock:", a8);
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("ActionLoadBrain")))
    {
      v22 = -[NRDUpdateDCore actionLoadBrain:](self, "actionLoadBrain:", a8);
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("ActionRunBrain")))
    {
      v22 = -[NRDUpdateDCore actionRunBrain:](self, "actionRunBrain:", a8);
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("ActionScheduleRetry")))
    {
      v22 = -[NRDUpdateDCore actionScheduleRetry:error:](self, "actionScheduleRetry:error:", v17, a8);
    }
    else if (objc_msgSend(v14, "isEqualToString:", CFSTR("ActionPeriodicScan")))
    {
      v22 = -[NRDUpdateDCore actionPeriodicScan:](self, "actionPeriodicScan:", a8);
    }
    else
    {
      v22 = -[NRDUpdateDCore actionUnknownAction:error:](self, "actionUnknownAction:error:", v14, a8);
    }
    v21 = v22;
  }

  return v21;
}

- (void)performUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  NRDUpdateDCore *v9;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateQueue](self, "updateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __32__NRDUpdateDCore_performUpdate___block_invoke;
  v7[3] = &unk_1000148A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

intptr_t __32__NRDUpdateDCore_performUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("TriggeredByDeviceUnlock")));
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    v4 = nrdSharedLogger();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Continuing update on device unlock event", buf, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "updatedFSM"));
    v7 = v6;
    v8 = CFSTR("DeviceUnlocked");
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("TriggeredByPeriodicActivity")));
    v10 = objc_msgSend(v9, "BOOLValue");

    if (v10)
    {
      v11 = nrdSharedLogger();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "perform periodic scan", v14, 2u);
      }

      objc_msgSend(*(id *)(a1 + 40), "setForceBrainUpdate:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "updatedFSM"));
      v7 = v6;
      v8 = CFSTR("PeriodicScanRequested");
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "updatedFSM"));
      v7 = v6;
      v8 = CFSTR("ProceedToNextUpdateStep");
    }
  }
  objc_msgSend(v6, "postEvent:", v8);

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 40) + 8), 0xFFFFFFFFFFFFFFFFLL);
}

- (void)newSchedulerWithIdentifier:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, NRDBackgroundActivitySchedulerServerImpl *);
  NRDBackgroundActivitySchedulerServerImpl *v7;
  id v8;
  NSObject *v9;
  int v10;
  NRDBackgroundActivitySchedulerServerImpl *v11;
  __int16 v12;
  id v13;

  v5 = a3;
  v6 = (void (**)(id, NRDBackgroundActivitySchedulerServerImpl *))a4;
  v7 = -[NRDBackgroundActivitySchedulerServerImpl initWithIdentifier:]([NRDBackgroundActivitySchedulerServerImpl alloc], "initWithIdentifier:", v5);
  v8 = nrdSharedLogger();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activity %@ \"%@\" created.", (uint8_t *)&v10, 0x16u);
  }

  v6[2](v6, v7);
}

- (void)newBrain:(id)a3
{
  __CFString *v4;
  void *v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  const __CFString *v11;

  v4 = (__CFString *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NRDUpdateErrorDomain"), 112, 0));
  v6 = nrdSharedLogger();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("(unversioned)");
    if (v4)
      v8 = v4;
    v10 = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Got newBrain notification, brainVersion:%@", (uint8_t *)&v10, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
  objc_msgSend(v9, "requestExit:reason:relaunchError:", 0, CFSTR("NRD brain has downloaded a new brain (via delegate)"), v5);

}

- (void)connectionInterrupted
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = nrdSharedLogger();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Got connectionInterrupted notification", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
  objc_msgSend(v5, "requestExit:reason:", 1, CFSTR("NRD brain connection has been unexpectedly interrupted"));

}

- (void)connectionInvalidated
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = nrdSharedLogger();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Got connectionInvalidated notification", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
  objc_msgSend(v5, "requestExit:reason:", 1, CFSTR("NRD brain connection has been unexpectedly invalidated"));

}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (void)setStateTable:(id)a3
{
  objc_storeStrong((id *)&self->_stateTable, a3);
}

- (SUCoreFSM)updatedFSM
{
  return self->_updatedFSM;
}

- (void)setUpdatedFSM:(id)a3
{
  objc_storeStrong((id *)&self->_updatedFSM, a3);
}

- (MAAsset)updateBrainAsset
{
  return self->_updateBrainAsset;
}

- (void)setUpdateBrainAsset:(id)a3
{
  objc_storeStrong((id *)&self->_updateBrainAsset, a3);
}

- (MAAsset)localBrainAsset
{
  return self->_localBrainAsset;
}

- (void)setLocalBrainAsset:(id)a3
{
  objc_storeStrong((id *)&self->_localBrainAsset, a3);
}

- (MAAsset)loadBrainAsset
{
  return self->_loadBrainAsset;
}

- (void)setLoadBrainAsset:(id)a3
{
  objc_storeStrong((id *)&self->_loadBrainAsset, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (SUCoreScan)scanner
{
  return self->_scanner;
}

- (void)setScanner:(id)a3
{
  objc_storeStrong((id *)&self->_scanner, a3);
}

- (SUCorePolicyUpdateBrain)scanPolicy
{
  return self->_scanPolicy;
}

- (void)setScanPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_scanPolicy, a3);
}

- (SUCoreMobileAsset)maControl
{
  return self->_maControl;
}

- (void)setMaControl:(id)a3
{
  objc_storeStrong((id *)&self->_maControl, a3);
}

- (SUCorePolicyUpdateBrain)downloadPolicy
{
  return self->_downloadPolicy;
}

- (void)setDownloadPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_downloadPolicy, a3);
}

- (NRDUpdateDCoreDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSNumber)updateAttempt
{
  return self->_updateAttempt;
}

- (void)setUpdateAttempt:(id)a3
{
  objc_storeStrong((id *)&self->_updateAttempt, a3);
}

- (id)brain
{
  return self->_brain;
}

- (void)setBrain:(id)a3
{
  objc_storeStrong(&self->_brain, a3);
}

- (id)runningBrain
{
  return self->_runningBrain;
}

- (void)setRunningBrain:(id)a3
{
  objc_storeStrong(&self->_runningBrain, a3);
}

- (OS_dispatch_queue)keyBagQueue
{
  return self->_keyBagQueue;
}

- (void)setKeyBagQueue:(id)a3
{
  objc_storeStrong((id *)&self->_keyBagQueue, a3);
}

- (int)keyBagStateChangedNotifyToken
{
  return self->_keyBagStateChangedNotifyToken;
}

- (void)setKeyBagStateChangedNotifyToken:(int)a3
{
  self->_keyBagStateChangedNotifyToken = a3;
}

- (NSBackgroundActivityScheduler)rescanScheduler
{
  return self->_rescanScheduler;
}

- (void)setRescanScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_rescanScheduler, a3);
}

- (NSBackgroundActivityScheduler)periodicScheduler
{
  return self->_periodicScheduler;
}

- (void)setPeriodicScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_periodicScheduler, a3);
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_updateQueue, a3);
}

- (BOOL)forceBrainUpdate
{
  return self->_forceBrainUpdate;
}

- (void)setForceBrainUpdate:(BOOL)a3
{
  self->_forceBrainUpdate = a3;
}

- (NSDictionary)updateOptions
{
  return self->_updateOptions;
}

- (void)setUpdateOptions:(id)a3
{
  objc_storeStrong((id *)&self->_updateOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateOptions, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_periodicScheduler, 0);
  objc_storeStrong((id *)&self->_rescanScheduler, 0);
  objc_storeStrong((id *)&self->_keyBagQueue, 0);
  objc_storeStrong(&self->_runningBrain, 0);
  objc_storeStrong(&self->_brain, 0);
  objc_storeStrong((id *)&self->_updateAttempt, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_downloadPolicy, 0);
  objc_storeStrong((id *)&self->_maControl, 0);
  objc_storeStrong((id *)&self->_scanPolicy, 0);
  objc_storeStrong((id *)&self->_scanner, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_loadBrainAsset, 0);
  objc_storeStrong((id *)&self->_localBrainAsset, 0);
  objc_storeStrong((id *)&self->_updateBrainAsset, 0);
  objc_storeStrong((id *)&self->_updatedFSM, 0);
  objc_storeStrong((id *)&self->_stateTable, 0);
  objc_storeStrong((id *)&self->_fsmSemaphore, 0);
}

- (void)findLocalBrainAsset
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Failed to query local brain asset, result:%ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Removing all update brain assets failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)actionBeginBrainScan:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Previous attempts to update the brain failed too many times(%llu)..", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __39__NRDUpdateDCore_actionBeginBrainScan___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Scan returned with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)actionDownloadBrainUpdate:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "No update brain asset present..Cannot download", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)maDownloadFailed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Update brain asset download failed with error:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)actionLoadBrain:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "ANOMALY: LoadingBrain state was reached without either a downloaded brain or an existing local brain", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)actionLoadBrain:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a1, a3, "ANOMALY: brain path is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __33__NRDUpdateDCore_actionRunBrain___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "brain run completed with error:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "brain run idle completed with error:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_281_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Periodic scan returned with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)actionUnknownAction:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_0();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "In unknown state!..action: %@ error:%@", v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)getSchedulerQOS
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "%@ is invalid NSQualityOfService, falling to default", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
