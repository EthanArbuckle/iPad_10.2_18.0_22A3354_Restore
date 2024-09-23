@implementation SUSettingsScanOperation

+ (id)_generateStateTable
{
  id v2;
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37[3];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[4];
  _QWORD v59[4];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[5];
  _QWORD v71[5];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  uint64_t v82;
  const __CFString *v83;
  _QWORD v84[6];
  _QWORD v85[6];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[4];
  _QWORD v95[4];
  _QWORD v96[6];
  _QWORD v97[7];

  v97[6] = *MEMORY[0x24BDAC8D0];
  v37[2] = a1;
  v37[1] = (id)a2;
  v96[0] = CFSTR("Idle");
  v94[0] = CFSTR("CheckForAvailableUpdate");
  v5 = (_QWORD *)MEMORY[0x24BEAEBD0];
  v92[0] = *MEMORY[0x24BEAEBD0];
  v93[0] = CFSTR("CheckingForAvailableUpdate");
  v4 = (_QWORD *)MEMORY[0x24BEAEA98];
  v92[1] = *MEMORY[0x24BEAEA98];
  v93[1] = CFSTR("QueryFullScanMetadata");
  v34 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v93, v92);
  v95[0] = v34;
  v94[1] = CFSTR("RefreshScanResults");
  v90[0] = *v5;
  v91[0] = CFSTR("QueryingCurrentDownload");
  v90[1] = *v4;
  v91[1] = CFSTR("QueryCurrentDownload");
  v33 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
  v95[1] = v33;
  v94[2] = CFSTR("RefreshScanResultsPostDownload");
  v88[0] = *v5;
  v89[0] = CFSTR("QueryingUpdatesInfo");
  v88[1] = *v4;
  v89[1] = CFSTR("QueryUpdatesInfo");
  v32 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v89, v88, 2);
  v95[2] = v32;
  v94[3] = CFSTR("CancelScan");
  v86[0] = *v5;
  v87[0] = CFSTR("Idle");
  v86[1] = *v4;
  v87[1] = CFSTR("ReportScanCanceled");
  v31 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
  v95[3] = v31;
  v30 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v95, v94);
  v97[0] = v30;
  v96[1] = CFSTR("CheckingForAvailableUpdate");
  v84[0] = CFSTR("PerformFullScan");
  v82 = *v4;
  v83 = CFSTR("CheckForAvailableUpdate");
  v29 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v83, &v82);
  v85[0] = v29;
  v84[1] = CFSTR("UpdatesAvailable");
  v80[0] = *v5;
  v81[0] = CFSTR("QueryingCurrentDownload");
  v80[1] = *v4;
  v81[1] = CFSTR("QueryCurrentDownload");
  v28 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
  v85[1] = v28;
  v84[2] = CFSTR("NoUpdateAvailable");
  v78[0] = *v5;
  v79[0] = CFSTR("QueryingCurrentDownload");
  v78[1] = *v4;
  v79[1] = CFSTR("QueryCurrentDownload");
  v27 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
  v85[2] = v27;
  v84[3] = CFSTR("CheckingForUpdatesFailed");
  v76[0] = *v5;
  v77[0] = CFSTR("Idle");
  v76[1] = *v4;
  v77[1] = CFSTR("ReportScanOutcome");
  v26 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
  v85[3] = v26;
  v84[4] = CFSTR("ConcurrentActionFailed");
  v74[0] = *v5;
  v75[0] = CFSTR("Idle");
  v74[1] = *v4;
  v75[1] = CFSTR("ReportScanOutcome");
  v25 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
  v85[4] = v25;
  v84[5] = CFSTR("CancelScan");
  v72[0] = *v5;
  v73[0] = CFSTR("Idle");
  v72[1] = *v4;
  v73[1] = CFSTR("ReportScanCanceled");
  v24 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v85[5] = v24;
  v23 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, v84);
  v97[1] = v23;
  v96[2] = CFSTR("QueryingCurrentDownload");
  v70[0] = CFSTR("QueryCurrentDownloadSuccess");
  v68[0] = *v5;
  v69[0] = CFSTR("QueryingUpdatesInfo");
  v68[1] = *v4;
  v69[1] = CFSTR("QueryUpdatesInfo");
  v22 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
  v71[0] = v22;
  v70[1] = CFSTR("QueryCurrentDownloadFailed");
  v66[0] = *v5;
  v67[0] = CFSTR("Idle");
  v66[1] = *v4;
  v67[1] = CFSTR("ReportScanFailed");
  v21 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
  v71[1] = v21;
  v70[2] = CFSTR("NoUpdateAvailable");
  v64[0] = *v5;
  v65[0] = CFSTR("ObservingConcurrentQueries");
  v64[1] = *v4;
  v65[1] = CFSTR("ObserveConcurrentQueries");
  v20 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
  v71[2] = v20;
  v70[3] = CFSTR("ConcurrentActionFailed");
  v62[0] = *v5;
  v63[0] = CFSTR("Idle");
  v62[1] = *v4;
  v63[1] = CFSTR("ReportScanOutcome");
  v19 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
  v71[3] = v19;
  v70[4] = CFSTR("CancelScan");
  v60[0] = *v5;
  v61[0] = CFSTR("Idle");
  v60[1] = *v4;
  v61[1] = CFSTR("ReportScanCanceled");
  v18 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
  v71[4] = v18;
  v17 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 5);
  v97[2] = v17;
  v96[3] = CFSTR("QueryingUpdatesInfo");
  v58[0] = CFSTR("QueryUpdatesInfoSuccess");
  v56[0] = *v5;
  v57[0] = CFSTR("ObservingConcurrentQueries");
  v56[1] = *v4;
  v57[1] = CFSTR("ObserveConcurrentQueries");
  v16 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v59[0] = v16;
  v58[1] = CFSTR("QueryUpdatesInfoFailed");
  v54[0] = *v5;
  v55[0] = CFSTR("Idle");
  v54[1] = *v4;
  v55[1] = CFSTR("ReportScanOutcome");
  v15 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v59[1] = v15;
  v58[2] = CFSTR("ConcurrentActionFailed");
  v52[0] = *v5;
  v53[0] = CFSTR("Idle");
  v52[1] = *v4;
  v53[1] = CFSTR("ReportScanOutcome");
  v14 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
  v59[2] = v14;
  v58[3] = CFSTR("CancelScan");
  v50[0] = *v5;
  v51[0] = CFSTR("Idle");
  v50[1] = *v4;
  v51[1] = CFSTR("ReportScanCanceled");
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  v59[3] = v13;
  v12 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 4);
  v97[3] = v12;
  v96[4] = CFSTR("ObservingConcurrentQueries");
  v48[0] = CFSTR("AllConcurrentActionsFinished");
  v46[0] = *v5;
  v47[0] = CFSTR("Idle");
  v46[1] = *v4;
  v47[1] = CFSTR("ReportScanOutcome");
  v11 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v49[0] = v11;
  v48[1] = CFSTR("ConcurrentActionFailed");
  v44[0] = *v5;
  v45[0] = CFSTR("Idle");
  v44[1] = *v4;
  v45[1] = CFSTR("ReportScanOutcome");
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
  v49[1] = v10;
  v48[2] = CFSTR("CancelScan");
  v42[0] = *v5;
  v43[0] = CFSTR("Idle");
  v42[1] = *v4;
  v43[1] = CFSTR("ReportScanCanceled");
  v9 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v49[2] = v9;
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
  v97[4] = v8;
  v96[5] = *MEMORY[0x24BEAEBC0];
  v40 = *MEMORY[0x24BEAEBB8];
  v38 = *v5;
  v39 = *MEMORY[0x24BEAEBC8];
  v7 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v41 = v7;
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
  v97[5] = v6;
  v37[0] = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v97, v96, 6);

  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  v36 = (id)objc_msgSend(v2, "initWithDictionary:copyItems:", v37[0], 1);
  v35 = v36;
  objc_storeStrong(&v36, 0);
  objc_storeStrong(v37, 0);
  return v35;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  NSObject *v14;
  SUCoreFSM *v15;
  SUCoreFSM *v16;
  uint64_t v17;
  int v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location[2];
  SUSettingsScanOperation *v24;
  int64_t v25;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v20 = 0;
  objc_storeStrong(&v20, a6);
  v19 = 0;
  objc_storeStrong(&v19, a7);
  v15 = -[SUSettingsScanOperation scanFSM](v24, "scanFSM");
  v14 = (id)-[SUCoreFSM extendedStateQueue](v15, "extendedStateQueue");
  dispatch_assert_queue_V2(v14);

  v16 = v24->_scanFSM;
  objc_sync_enter(v16);
  if (!v24->_canceled || (objc_msgSend(location[0], "isEqualToString:", CFSTR("ReportScanCanceled")) & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    v25 = 0;
    v18 = 1;
  }
  objc_sync_exit(v16);

  if (!v18)
  {
    if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x24BEAEBB0]) & 1) != 0)
    {
      v17 = 0;
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("QueryFullScanMetadata")) & 1) != 0)
    {
      v17 = -[SUSettingsScanOperation action_QueryFullScanMetadata:error:](v24, "action_QueryFullScanMetadata:error:", v20, a8);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("CheckForAvailableUpdate")) & 1) != 0)
    {
      v17 = -[SUSettingsScanOperation action_CheckForAvailableUpdate:error:](v24, "action_CheckForAvailableUpdate:error:", v20, a8);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("QueryCurrentDownload")) & 1) != 0)
    {
      v17 = -[SUSettingsScanOperation action_QueryCurrentDownload:error:](v24, "action_QueryCurrentDownload:error:", v20, a8);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("QueryUpdatesInfo")) & 1) != 0)
    {
      v17 = -[SUSettingsScanOperation action_QueryUpdatesInfo:error:](v24, "action_QueryUpdatesInfo:error:", v20, a8);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("ObserveConcurrentQueries")) & 1) != 0)
    {
      v17 = -[SUSettingsScanOperation action_ObserveConcurrentQueries:error:](v24, "action_ObserveConcurrentQueries:error:", v20, a8);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("ReportScanOutcome")) & 1) != 0)
    {
      v17 = -[SUSettingsScanOperation action_ReportScanOutcome:error:](v24, "action_ReportScanOutcome:error:", v20, a8);
    }
    else
    {
      v17 = -[SUSettingsScanOperation actionUnknownAction:error:](v24, "actionUnknownAction:error:", location[0], a8);
    }
    v25 = v17;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v25;
}

- (int64_t)action_QueryFullScanMetadata:(id)a3 error:(id *)a4
{
  id v5;
  SUCoreFSM *v6;
  NSObject *v7;
  SUCoreFSM *v8;
  id location[2];
  SUSettingsScanOperation *v10;
  int64_t v11;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = -[SUSettingsScanOperation scanFSM](v10, "scanFSM");
  v7 = (id)-[SUCoreFSM extendedStateQueue](v8, "extendedStateQueue");
  dispatch_assert_queue_V2(v7);

  if (location[0])
  {
    -[SUSettingsScanOperation scheduleConcurrentActionWithSelector:eventInfo:](v10, "scheduleConcurrentActionWithSelector:eventInfo:", sel_queryDDMDeclaration_withReplyHandler_, location[0]);
    -[SUSettingsScanOperation scheduleConcurrentActionWithSelector:eventInfo:](v10, "scheduleConcurrentActionWithSelector:eventInfo:", sel_checkForMDMRestrictions_withReplyHandler_, location[0]);
    -[SUSettingsScanOperation scheduleConcurrentActionWithSelector:eventInfo:](v10, "scheduleConcurrentActionWithSelector:eventInfo:", sel_checkForBetaPrograms_withReplyHandler_, location[0]);
    -[SUSettingsScanOperation scheduleConcurrentActionWithSelector:eventInfo:](v10, "scheduleConcurrentActionWithSelector:eventInfo:", sel_queryRollbackStatus_withReplyHandler_, location[0]);
    -[SUSettingsScanOperation scheduleConcurrentActionWithSelector:eventInfo:](v10, "scheduleConcurrentActionWithSelector:eventInfo:", sel_checkIsEligibleForRollback_withReplyHandler_, location[0]);
    -[SUCoreFSM followupEvent:withInfo:](v10->_scanFSM, "followupEvent:withInfo:", CFSTR("PerformFullScan"), location[0]);
    v11 = 0;
  }
  else
  {
    v6 = -[SUSettingsScanOperation scanFSM](v10, "scanFSM");
    v5 = (id)-[SUCoreFSM diag](v6, "diag");
    objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v11 = 8102;
  }
  objc_storeStrong(location, 0);
  return v11;
}

- (int64_t)action_CheckForAvailableUpdate:(id)a3 error:(id *)a4
{
  void (**v5)(id, id);
  id v6;
  id v7;
  NSString *v8;
  SUCoreLog *v9;
  id v10;
  id v11;
  SUManagerClient *v12;
  id v13;
  BOOL v14;
  id v15;
  SUCoreFSM *v16;
  id v17;
  BOOL v18;
  id v19;
  SUCoreFSM *v20;
  NSObject *v22;
  SUCoreFSM *v23;
  id v24;
  char v25;
  id v26;
  uint64_t v27;
  int v28;
  int v29;
  void (*v30)(id *, void *, void *);
  void *v31;
  SUSettingsScanOperation *v32;
  id v33;
  id v34;
  char v35;
  id v36;
  char v37;
  id v38;
  int v39;
  id *v40;
  id location[2];
  SUSettingsScanOperation *v42;
  int64_t v43;
  uint8_t v44[24];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v40 = a4;
  v23 = -[SUSettingsScanOperation scanFSM](v42, "scanFSM");
  v22 = (id)-[SUCoreFSM extendedStateQueue](v23, "extendedStateQueue");
  dispatch_assert_queue_V2(v22);

  if (location[0])
  {
    v17 = (id)objc_msgSend(location[0], "options");
    v37 = 0;
    v35 = 0;
    v18 = 1;
    if (v17)
    {
      v38 = (id)objc_msgSend(location[0], "options");
      v37 = 1;
      v36 = (id)objc_msgSend(v38, "scanOptions");
      v35 = 1;
      v18 = v36 == 0;
    }
    if ((v35 & 1) != 0)

    if ((v37 & 1) != 0)
    if (v18)
    {
      v16 = -[SUSettingsScanOperation scanFSM](v42, "scanFSM");
      v15 = (id)-[SUCoreFSM diag](v16, "diag");
      objc_msgSend(v15, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("Missing eventInfo parameter: scanOptions."));

      v43 = 8102;
      v39 = 1;
    }
    else
    {
      v27 = MEMORY[0x24BDAC760];
      v28 = -1073741824;
      v29 = 0;
      v30 = __64__SUSettingsScanOperation_action_CheckForAvailableUpdate_error___block_invoke;
      v31 = &unk_24DFFD3E0;
      v32 = v42;
      v33 = location[0];
      v34 = (id)MEMORY[0x220773A28](&v27);
      v13 = (id)objc_msgSend(location[0], "thirdPartyDiscoveredScanResults");
      v25 = 0;
      v14 = 0;
      if (!v13)
      {
        v26 = (id)objc_msgSend(location[0], "thirdPartyDiscoveredScanError");
        v25 = 1;
        v14 = v26 == 0;
      }
      if ((v25 & 1) != 0)

      if (v14)
      {
        v12 = -[SUSettingsScanOperation suClient](v42, "suClient");
        v11 = (id)objc_msgSend(location[0], "options");
        v10 = (id)objc_msgSend(v11, "scanOptions");
        -[SUManagerClient scanForUpdates:withScanResults:](v12, "scanForUpdates:withScanResults:");

      }
      else
      {
        v9 = -[SUSettingsScanOperation log](v42, "log");
        v24 = (id)-[SUCoreLog oslog](v9, "oslog");

        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
        {
          v8 = -[SUSettingsScanOperation scanUUID](v42, "scanUUID");
          __os_log_helper_16_2_2_8_32_8_66((uint64_t)v44, (uint64_t)"-[SUSettingsScanOperation action_CheckForAvailableUpdate:error:]", (uint64_t)v8);
          _os_log_impl(&dword_21BF33000, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: Got third-party discovered scan results. Using them instead of performing a new scan.", v44, 0x16u);

        }
        objc_storeStrong(&v24, 0);
        v5 = (void (**)(id, id))v34;
        v7 = (id)objc_msgSend(location[0], "thirdPartyDiscoveredScanResults");
        v6 = (id)objc_msgSend(location[0], "thirdPartyDiscoveredScanError");
        v5[2](v5, v7);

      }
      v43 = 0;
      v39 = 1;
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong((id *)&v32, 0);
    }
  }
  else
  {
    v20 = -[SUSettingsScanOperation scanFSM](v42, "scanFSM");
    v19 = (id)-[SUCoreFSM diag](v20, "diag");
    objc_msgSend(v19, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v43 = 8102;
    v39 = 1;
  }
  objc_storeStrong(location, 0);
  return v43;
}

void __64__SUSettingsScanOperation_action_CheckForAvailableUpdate_error___block_invoke(id *a1, void *a2, void *a3)
{
  SUSettingsScanParam *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  SUSettingsScanParam *v12;
  id v13;
  id v14;
  id v15;
  char v18;
  id v19;
  id v20[2];
  id v21;
  id location[2];
  uint8_t v23[56];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v21 = 0;
  objc_storeStrong(&v21, a3);
  v20[1] = a1;
  v15 = (id)objc_msgSend(a1[4], "log");
  v20[0] = (id)objc_msgSend(v15, "oslog");

  if (os_log_type_enabled((os_log_t)v20[0], OS_LOG_TYPE_DEFAULT))
  {
    v14 = (id)objc_msgSend(a1[4], "scanUUID");
    __os_log_helper_16_2_4_8_32_8_66_8_66_8_64((uint64_t)v23, (uint64_t)"-[SUSettingsScanOperation action_CheckForAvailableUpdate:error:]_block_invoke", (uint64_t)v14, (uint64_t)v21, (uint64_t)location[0]);
    _os_log_impl(&dword_21BF33000, (os_log_t)v20[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: scanForUpdates results: error: %{public}@; SUScanResults: %@",
      v23,
      0x2Au);

  }
  objc_storeStrong(v20, 0);
  objc_msgSend(a1[5], "setScanError:", v21);
  if (!v21 || (objc_msgSend(a1[4], "shouldConsiderErrorAsSuccessfulCase:", v21) & 1) != 0)
  {
    if (location[0])
    {
      objc_msgSend(a1[5], "setEmptyScanResults:", 0);
      v6 = a1[5];
      v7 = (id)objc_msgSend(location[0], "preferredDescriptor");
      objc_msgSend(v6, "setPreferredDescriptor:");

      v8 = a1[5];
      v9 = (id)objc_msgSend(location[0], "alternateDescriptor");
      objc_msgSend(v8, "setAlternateDescriptor:");

      v10 = (id)objc_msgSend(location[0], "preferredDescriptor");
      v18 = 0;
      v11 = 1;
      if (!v10)
      {
        v19 = (id)objc_msgSend(location[0], "alternateDescriptor");
        v18 = 1;
        v11 = v19 != 0;
      }
      if ((v18 & 1) != 0)

      if (v11)
      {
        v5 = (id)objc_msgSend(a1[4], "scanFSM");
        objc_msgSend(v5, "postEvent:withInfo:", CFSTR("UpdatesAvailable"), a1[5]);

        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(a1[5], "setEmptyScanResults:", 1);
    }
    v4 = (id)objc_msgSend(a1[4], "scanFSM");
    objc_msgSend(v4, "postEvent:withInfo:", CFSTR("NoUpdateAvailable"), a1[5]);

    goto LABEL_16;
  }
  v13 = (id)objc_msgSend(a1[4], "scanFSM");
  v3 = [SUSettingsScanParam alloc];
  v12 = -[SUSettingsScanParam initWithError:](v3, "initWithError:", v21);
  objc_msgSend(v13, "postEvent:withInfo:", CFSTR("CheckingForUpdatesFailed"));

LABEL_16:
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)action_QueryCurrentDownload:(id)a3 error:(id *)a4
{
  id v4;
  void (**v6)(id, id);
  id v7;
  id v8;
  id v9;
  NSObject *log;
  os_log_type_t type;
  id v12;
  id v13;
  id v14;
  id v15;
  NSString *v16;
  SUCoreLog *v17;
  SUManagerClient *v18;
  BOOL v19;
  id v20;
  SUCoreFSM *v21;
  NSObject *v23;
  SUCoreFSM *v24;
  id v25;
  os_log_type_t v26;
  id v27;
  uint64_t v28;
  int v29;
  int v30;
  void (*v31)(id *, void *, void *);
  void *v32;
  SUSettingsScanOperation *v33;
  id v34;
  id v35;
  int v36;
  id *v37;
  id location[2];
  SUSettingsScanOperation *v39;
  int64_t v40;
  uint8_t v41[56];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = a4;
  v24 = -[SUSettingsScanOperation scanFSM](v39, "scanFSM");
  v23 = (id)-[SUCoreFSM extendedStateQueue](v24, "extendedStateQueue");
  dispatch_assert_queue_V2(v23);

  if (location[0])
  {
    v28 = MEMORY[0x24BDAC760];
    v29 = -1073741824;
    v30 = 0;
    v31 = __61__SUSettingsScanOperation_action_QueryCurrentDownload_error___block_invoke;
    v32 = &unk_24DFFAA18;
    v33 = v39;
    v34 = location[0];
    v35 = (id)MEMORY[0x220773A28](&v28);
    v4 = (id)objc_msgSend(location[0], "currentDownload");
    v19 = v4 != 0;

    if (v19)
    {
      v17 = -[SUSettingsScanOperation log](v39, "log");
      v27 = (id)-[SUCoreLog oslog](v17, "oslog");

      v26 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
      {
        log = v27;
        type = v26;
        v16 = -[SUSettingsScanOperation scanUUID](v39, "scanUUID");
        v15 = (id)objc_msgSend(location[0], "currentDownload");
        v14 = (id)objc_msgSend(v15, "descriptor");
        v13 = (id)objc_msgSend(v14, "humanReadableUpdateName");
        v9 = v13;
        v25 = v9;
        v12 = (id)objc_msgSend(location[0], "currentDownload");
        __os_log_helper_16_2_4_8_32_8_66_8_66_8_0((uint64_t)v41, (uint64_t)"-[SUSettingsScanOperation action_QueryCurrentDownload:error:]", (uint64_t)v16, (uint64_t)v9, (uint64_t)v12);
        _os_log_impl(&dword_21BF33000, log, type, "%s [%{public}@]: Scan operation has already been given a download (%{public}@, %p) - skipping on the download lookup.", v41, 0x2Au);

        objc_storeStrong(&v25, 0);
      }
      objc_storeStrong(&v27, 0);
      v6 = (void (**)(id, id))v35;
      v8 = (id)objc_msgSend(location[0], "currentDownload");
      v7 = (id)objc_msgSend(location[0], "operationError");
      v6[2](v6, v8);

    }
    else
    {
      v18 = -[SUSettingsScanOperation suClient](v39, "suClient");
      -[SUManagerClient download:](v18, "download:", v35);

    }
    v40 = 0;
    v36 = 1;
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong((id *)&v33, 0);
  }
  else
  {
    v21 = -[SUSettingsScanOperation scanFSM](v39, "scanFSM");
    v20 = (id)-[SUCoreFSM diag](v21, "diag");
    objc_msgSend(v20, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v40 = 8102;
    v36 = 1;
  }
  objc_storeStrong(location, 0);
  return v40;
}

void __61__SUSettingsScanOperation_action_QueryCurrentDownload_error___block_invoke(id *a1, void *a2, void *a3)
{
  SUSettingsScanParam *v3;
  SUSUIUninitializedDownload *v4;
  id v5;
  unsigned int v6;
  SUSUIUpdateAgreementManager *v7;
  id v8;
  id v9;
  unsigned int v10;
  SUSUIUpdateAgreementManager *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  char v17;
  char v18;
  id v19;
  id v20;
  BOOL v21;
  SUSettingsScanParam *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v28;
  int v29;
  int v30;
  void (*v31)(id *, char, id);
  void *v32;
  id v33;
  id v34;
  SUSUIUpdateAgreementManager *v35;
  char v36;
  id v37;
  char v38;
  id v39;
  os_log_type_t v40;
  id v41;
  char v42;
  id v43;
  int v44;
  os_log_type_t v45;
  id v46[2];
  id v47;
  id location[2];
  uint8_t v49[48];
  uint8_t v50[56];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v47 = 0;
  objc_storeStrong(&v47, a3);
  v46[1] = a1;
  v25 = (id)objc_msgSend(a1[4], "log");
  v46[0] = (id)objc_msgSend(v25, "oslog");

  v45 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v46[0], OS_LOG_TYPE_DEFAULT))
  {
    v24 = (id)objc_msgSend(a1[4], "scanUUID");
    __os_log_helper_16_2_5_8_32_8_66_8_66_8_0_8_66((uint64_t)v50, (uint64_t)"-[SUSettingsScanOperation action_QueryCurrentDownload:error:]_block_invoke", (uint64_t)v24, (uint64_t)v47, (uint64_t)location[0], (uint64_t)location[0]);
    _os_log_impl(&dword_21BF33000, (os_log_t)v46[0], v45, "%s [%{public}@]: error: %{public}@, download: <%p> %{public}@", v50, 0x34u);

  }
  objc_storeStrong(v46, 0);
  if (!v47 || (objc_msgSend(a1[4], "shouldConsiderErrorAsSuccessfulCase:", v47) & 1) != 0)
  {
    v42 = 0;
    v21 = 0;
    if (!location[0])
    {
      v43 = (id)objc_msgSend(v47, "domain");
      v42 = 1;
      v21 = 0;
      if ((objc_msgSend(v43, "isEqualToString:", *MEMORY[0x24BEAED98]) & 1) != 0)
        v21 = objc_msgSend(v47, "code") == 11;
    }
    if ((v42 & 1) != 0)

    if (v21)
    {
      v4 = -[SUSUIUninitializedDownload initWithDescriptor:]([SUSUIUninitializedDownload alloc], "initWithDescriptor:", 0);
      v5 = location[0];
      location[0] = v4;

      v20 = (id)objc_msgSend(a1[4], "log");
      v41 = (id)objc_msgSend(v20, "oslog");

      v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (id)objc_msgSend(a1[4], "scanUUID");
        __os_log_helper_16_2_4_8_32_8_66_8_66_8_66((uint64_t)v49, (uint64_t)"-[SUSettingsScanOperation action_QueryCurrentDownload:error:]_block_invoke", (uint64_t)v19, (uint64_t)v47, (uint64_t)location[0]);
        _os_log_impl(&dword_21BF33000, (os_log_t)v41, v40, "%s [%{public}@]: Received a nil download and SUErrorCodeDownloadInProgress error (%{public}@) - assigned SUDownloadUninitialized to the download object: %{public}@", v49, 0x2Au);

      }
      objc_storeStrong(&v41, 0);
    }
    v38 = 0;
    v36 = 0;
    v18 = 0;
    if (!location[0])
    {
      v17 = 1;
      if ((objc_msgSend(a1[5], "emptyScanResults") & 1) == 0)
      {
        v39 = (id)objc_msgSend(a1[5], "preferredDescriptor");
        v38 = 1;
        v16 = 0;
        if (!v39)
        {
          v37 = (id)objc_msgSend(a1[5], "alternateDescriptor");
          v36 = 1;
          v16 = v37 == 0;
        }
        v17 = v16;
      }
      v18 = v17;
    }
    if ((v36 & 1) != 0)

    if ((v38 & 1) != 0)
    if ((v18 & 1) != 0)
    {
      v15 = (id)objc_msgSend(a1[4], "scanFSM");
      objc_msgSend(v15, "postEvent:withInfo:", CFSTR("NoUpdateAvailable"), a1[5]);

      v44 = 1;
    }
    else
    {
      objc_msgSend(a1[5], "setCurrentDownload:", location[0]);
      v35 = objc_alloc_init(SUSUIUpdateAgreementManager);
      v7 = v35;
      v9 = (id)objc_msgSend(location[0], "downloadOptions");
      v6 = objc_msgSend(v9, "downloadFeeAgreementStatus");
      v8 = (id)objc_msgSend(location[0], "descriptor");
      -[SUSUIUpdateAgreementManager setCellularFeeAgreementStatus:forUpdate:](v7, "setCellularFeeAgreementStatus:forUpdate:", v6);

      v11 = v35;
      v13 = (id)objc_msgSend(location[0], "downloadOptions");
      v10 = objc_msgSend(v13, "termsAndConditionsAgreementStatus");
      v12 = (id)objc_msgSend(location[0], "descriptor");
      -[SUSUIUpdateAgreementManager setTermsAgreementStatus:forUpdate:](v11, "setTermsAgreementStatus:forUpdate:", v10);

      objc_msgSend(a1[4], "scheduleConcurrentActionWithSelector:eventInfo:", sel_checkIfAutoUpdateScheduled_withReplyHandler_, a1[5]);
      v14 = (id)objc_msgSend(a1[4], "suClient");
      v28 = MEMORY[0x24BDAC760];
      v29 = -1073741824;
      v30 = 0;
      v31 = __61__SUSettingsScanOperation_action_QueryCurrentDownload_error___block_invoke_207;
      v32 = &unk_24DFF7E00;
      v33 = a1[4];
      v34 = a1[5];
      objc_msgSend(v14, "isClearingSpaceForDownload:", &v28);

      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong((id *)&v35, 0);
      v44 = 0;
    }
  }
  else
  {
    v23 = (id)objc_msgSend(a1[4], "scanFSM");
    v3 = [SUSettingsScanParam alloc];
    v22 = -[SUSettingsScanParam initWithError:](v3, "initWithError:", v47);
    objc_msgSend(v23, "postEvent:withInfo:", CFSTR("QueryCurrentDownloadFailed"));

    v44 = 1;
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(location, 0);
}

void __61__SUSettingsScanOperation_action_QueryCurrentDownload_error___block_invoke_207(id *a1, char a2, id obj)
{
  SUSettingsScanParam *v3;
  id v4;
  SUSettingsScanParam *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];
  id location;
  char v12;
  id *v13;
  uint8_t v14[40];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = a1;
  v12 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v10[1] = a1;
  v8 = (id)objc_msgSend(a1[4], "log");
  v10[0] = (id)objc_msgSend(v8, "oslog");

  if (os_log_type_enabled((os_log_t)v10[0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (id)objc_msgSend(a1[4], "scanUUID");
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v14, (uint64_t)"-[SUSettingsScanOperation action_QueryCurrentDownload:error:]_block_invoke", (uint64_t)v7, v12 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, (os_log_t)v10[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: isClearingSpaceForDownload? %d, isClearingSpaceError: %{public}@", v14, 0x26u);

  }
  objc_storeStrong(v10, 0);
  if (location)
  {
    v6 = (id)objc_msgSend(a1[4], "scanFSM");
    v3 = [SUSettingsScanParam alloc];
    v5 = -[SUSettingsScanParam initWithError:](v3, "initWithError:", location);
    objc_msgSend(v6, "postEvent:withInfo:", CFSTR("QueryCurrentDownloadFailed"));

  }
  else
  {
    objc_msgSend(a1[5], "setClearingSpaceForDownload:", v12 & 1);
    v4 = (id)objc_msgSend(a1[4], "scanFSM");
    objc_msgSend(v4, "postEvent:withInfo:", CFSTR("QueryCurrentDownloadSuccess"), a1[5]);

  }
  objc_storeStrong(&location, 0);
}

- (int64_t)action_QueryUpdatesInfo:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  SUManagerClient *v21;
  id v22;
  SUCoreFSM *v23;
  BOOL v24;
  id v25;
  id v26;
  SUCoreFSM *v27;
  NSObject *v29;
  SUCoreFSM *v30;
  uint64_t v31;
  int v32;
  int v33;
  void (*v34)(id *, char, char, id, void *);
  void *v35;
  SUSettingsScanOperation *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  id v41;
  char v42;
  id v43;
  int v44;
  id *v45;
  id location[2];
  SUSettingsScanOperation *v47;
  int64_t v48;

  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v45 = a4;
  v30 = -[SUSettingsScanOperation scanFSM](v47, "scanFSM");
  v29 = (id)-[SUCoreFSM extendedStateQueue](v30, "extendedStateQueue");
  dispatch_assert_queue_V2(v29);

  if (location[0])
  {
    v25 = (id)objc_msgSend(location[0], "preferredDescriptor");
    v42 = 0;
    v40 = 0;
    if (v25
      || (v43 = (id)objc_msgSend(location[0], "alternateDescriptor"),
          v42 = 1,
          v24 = 1,
          v43))
    {
      v41 = (id)objc_msgSend(location[0], "agreementManager");
      v40 = 1;
      v24 = v41 != 0;
    }
    if ((v40 & 1) != 0)

    if ((v42 & 1) != 0)
    if (v24)
    {
      v23 = -[SUSettingsScanOperation scanFSM](v47, "scanFSM");
      v22 = (id)-[SUCoreFSM diag](v23, "diag");
      objc_msgSend(v22, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("Both the preferredUpdate and alternateUpdate are empty, or agreementManager is missing."));

      v48 = 8102;
      v44 = 1;
    }
    else
    {
      v5 = objc_alloc(MEMORY[0x24BEAEC18]);
      v6 = (id)objc_msgSend(location[0], "preferredDescriptor");
      v39 = objc_msgSend(v5, "initWithDescriptor:");

      v7 = (id)v39;
      v8 = (id)objc_msgSend(location[0], "options");
      objc_msgSend(v7, "setAllowUnrestrictedCellularDownload:", objc_msgSend(v8, "allowUnrestrictedCellularDownload") & 1);

      v9 = (id)v39;
      v11 = (id)objc_msgSend(location[0], "agreementManager");
      v10 = (id)objc_msgSend(location[0], "preferredDescriptor");
      objc_msgSend(v9, "setDownloadFeeAgreementStatus:", objc_msgSend(v11, "cellularFeeAgreementStatusForUpdate:"));

      v12 = objc_alloc(MEMORY[0x24BEAEC18]);
      v13 = (id)objc_msgSend(location[0], "alternateDescriptor");
      v38 = objc_msgSend(v12, "initWithDescriptor:");

      v14 = (id)v38;
      v15 = (id)objc_msgSend(location[0], "options");
      objc_msgSend(v14, "setAllowUnrestrictedCellularDownload:", objc_msgSend(v15, "allowUnrestrictedCellularDownload") & 1);

      v16 = (id)v38;
      v18 = (id)objc_msgSend(location[0], "agreementManager");
      v17 = (id)objc_msgSend(location[0], "alternateDescriptor");
      objc_msgSend(v16, "setDownloadFeeAgreementStatus:", objc_msgSend(v18, "cellularFeeAgreementStatusForUpdate:"));

      v21 = -[SUSettingsScanOperation suClient](v47, "suClient");
      v19 = (id)v39;
      v20 = (id)v38;
      v31 = MEMORY[0x24BDAC760];
      v32 = -1073741824;
      v33 = 0;
      v34 = __57__SUSettingsScanOperation_action_QueryUpdatesInfo_error___block_invoke;
      v35 = &unk_24DFFD408;
      v36 = v47;
      v37 = location[0];
      -[SUManagerClient updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:](v21, "updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:", v19, v20, &v31);

      v48 = 0;
      v44 = 1;
      objc_storeStrong(&v37, 0);
      objc_storeStrong((id *)&v36, 0);
      objc_storeStrong((id *)&v38, 0);
      objc_storeStrong((id *)&v39, 0);
    }
  }
  else
  {
    v27 = -[SUSettingsScanOperation scanFSM](v47, "scanFSM");
    v26 = (id)-[SUCoreFSM diag](v27, "diag");
    objc_msgSend(v26, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v48 = 8102;
    v44 = 1;
  }
  objc_storeStrong(location, 0);
  return v48;
}

void __57__SUSettingsScanOperation_action_QueryUpdatesInfo_error___block_invoke(id *a1, char a2, char a3, id obj, void *a5)
{
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v15;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(NSObject *, char, id);
  void *v22;
  id v23;
  id v24;
  id v25;
  char v26;
  id v27;
  char v28;
  id v29;
  os_log_type_t v30;
  id v31[2];
  id v32;
  id location;
  char v34;
  char v35;
  id *v36;
  uint8_t v37[72];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v36 = a1;
  v35 = a2 & 1;
  v34 = a3 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v32 = 0;
  objc_storeStrong(&v32, a5);
  v31[1] = a1;
  v15 = (id)objc_msgSend(a1[4], "log");
  v31[0] = (id)objc_msgSend(v15, "oslog");

  v30 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v31[0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (id)objc_msgSend(a1[4], "scanUUID");
    v14 = v5;
    if ((v35 & 1) != 0)
      v6 = "YES";
    else
      v6 = "NO";
    if ((v34 & 1) != 0)
      v7 = "YES";
    else
      v7 = "NO";
    __os_log_helper_16_2_6_8_32_8_66_8_32_8_66_8_32_8_66((uint64_t)v37, (uint64_t)"-[SUSettingsScanOperation action_QueryUpdatesInfo:error:]_block_invoke", (uint64_t)v5, (uint64_t)v6, (uint64_t)location, (uint64_t)v7, (uint64_t)v32);
    _os_log_impl(&dword_21BF33000, (os_log_t)v31[0], v30, "%s [%{public}@]: preferredDownloadable: %s, preferredError: %{public}@, alternateDownloadable: %s, alternateError: %{public}@", v37, 0x3Eu);

  }
  objc_storeStrong(v31, 0);
  objc_msgSend(a1[5], "setPreferredUpdateDownloadable:", v35 & 1);
  objc_msgSend(a1[5], "setAlternateUpdateDownloadable:", v34 & 1);
  objc_msgSend(a1[5], "setPreferredUpdateDownloadError:", location);
  objc_msgSend(a1[5], "setAlternateUpdateDownloadError:", v32);
  v12 = (id)objc_msgSend(a1[5], "currentDownload");
  v28 = 0;
  v26 = 0;
  v13 = 0;
  if (v12)
  {
    v29 = (id)objc_msgSend(a1[5], "currentDownload");
    v28 = 1;
    v27 = (id)objc_msgSend(v29, "progress");
    v26 = 1;
    v13 = objc_msgSend(v27, "isDone");
  }
  if ((v26 & 1) != 0)

  if ((v28 & 1) != 0)
  if ((v13 & 1) != 0)
  {
    v25 = objc_alloc_init(MEMORY[0x24BEAEC20]);
    v8 = objc_msgSend((id)objc_opt_class(), "installationIgnorableConstraints");
    objc_msgSend(v25, "setIgnorableConstraints:", v8);
    v11 = (void *)*((_QWORD *)a1[4] + 11);
    v10 = v25;
    v18 = MEMORY[0x24BDAC760];
    v19 = -1073741824;
    v20 = 0;
    v21 = __57__SUSettingsScanOperation_action_QueryUpdatesInfo_error___block_invoke_216;
    v22 = &unk_24DFF7E00;
    v23 = a1[4];
    v24 = a1[5];
    objc_msgSend(v11, "isUpdateReadyForInstallationWithOptions:withResult:", v10, &v18);
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v25, 0);
  }
  else
  {
    v9 = (id)objc_msgSend(a1[4], "scanFSM");
    objc_msgSend(v9, "postEvent:withInfo:", CFSTR("QueryUpdatesInfoSuccess"), a1[5]);

  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&location, 0);
}

void __57__SUSettingsScanOperation_action_QueryUpdatesInfo_error___block_invoke_216(NSObject *a1, char a2, id obj)
{
  id v3;
  id v4;
  id v5;
  os_log_t oslog[2];
  id location;
  char v9;
  NSObject *v10;
  uint8_t v11[40];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = a1;
  v9 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  v5 = (id)-[objc_class log](a1[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v5, "oslog");

  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (id)-[objc_class scanUUID](a1[4].isa, "scanUUID");
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v11, (uint64_t)"-[SUSettingsScanOperation action_QueryUpdatesInfo:error:]_block_invoke", (uint64_t)v4, v9 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: Ready to install: %d; error: %{public}@",
      v11,
      0x26u);

  }
  objc_storeStrong((id *)oslog, 0);
  -[objc_class setIsUpdateReadyForInstallation:](a1[5].isa, "setIsUpdateReadyForInstallation:", v9 & 1);
  -[objc_class setUpdateInstallationError:](a1[5].isa, "setUpdateInstallationError:", location);
  v3 = (id)-[objc_class scanFSM](a1[4].isa, "scanFSM");
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("QueryUpdatesInfoSuccess"), a1[5].isa);

  objc_storeStrong(&location, 0);
}

- (int64_t)action_ObserveConcurrentQueries:(id)a3 error:(id *)a4
{
  NSObject *queue;
  NSObject *group;
  id v7;
  SUCoreFSM *v8;
  NSObject *v10;
  SUCoreFSM *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t (*v15)(id *);
  void *v16;
  SUSettingsScanOperation *v17;
  id v18;
  int v19;
  id *v20;
  id location[2];
  SUSettingsScanOperation *v22;
  int64_t v23;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = a4;
  v11 = -[SUSettingsScanOperation scanFSM](v22, "scanFSM");
  v10 = (id)-[SUCoreFSM extendedStateQueue](v11, "extendedStateQueue");
  dispatch_assert_queue_V2(v10);

  if (location[0])
  {
    group = v22->_scanGroup;
    queue = v22->_concurrentQueue;
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __65__SUSettingsScanOperation_action_ObserveConcurrentQueries_error___block_invoke;
    v16 = &unk_24DFF7B80;
    v17 = v22;
    v18 = location[0];
    dispatch_group_notify(group, queue, &v12);
    v23 = 0;
    v19 = 1;
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v17, 0);
  }
  else
  {
    v8 = -[SUSettingsScanOperation scanFSM](v22, "scanFSM");
    v7 = (id)-[SUCoreFSM diag](v8, "diag");
    objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v23 = 8102;
    v19 = 1;
  }
  objc_storeStrong(location, 0);
  return v23;
}

uint64_t __65__SUSettingsScanOperation_action_ObserveConcurrentQueries_error___block_invoke(id *a1)
{
  id v1;
  BOOL v3;
  id v4;
  id v5;
  id v6;
  id location[3];
  uint8_t v9[40];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  location[2] = a1;
  location[1] = a1;
  v6 = (id)objc_msgSend(a1[4], "log");
  location[0] = (id)objc_msgSend(v6, "oslog");

  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (id)objc_msgSend(a1[4], "scanUUID");
    v4 = (id)objc_msgSend(a1[5], "operationError");
    __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v9, (uint64_t)"-[SUSettingsScanOperation action_ObserveConcurrentQueries:error:]_block_invoke", (uint64_t)v5, (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: All of the concurrent operations has been finished. Current operation error: %{public}@", v9, 0x20u);

  }
  objc_storeStrong(location, 0);
  v1 = (id)objc_msgSend(a1[5], "operationError");
  v3 = v1 == 0;

  if (v3)
    return objc_msgSend(*((id *)a1[4] + 10), "postEvent:withInfo:", CFSTR("AllConcurrentActionsFinished"), a1[5]);
  else
    return objc_msgSend(*((id *)a1[4] + 10), "postEvent:withInfo:", CFSTR("ConcurrentActionFailed"), a1[5]);
}

- (int64_t)action_ReportScanOutcome:(id)a3 error:(id *)a4
{
  const char *v4;
  NSObject *v6;
  NSObject *queue;
  id v8;
  SUCoreFSM *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *log;
  os_log_type_t type;
  __CFString *v14;
  id v15;
  NSString *v16;
  SUCoreLog *v17;
  id v18;
  SUCoreFSM *v19;
  NSObject *v21;
  SUCoreFSM *v22;
  uint64_t v23;
  int v24;
  int v25;
  void (*v26)(id *);
  void *v27;
  id v28;
  SUSettingsScanOperation *v29;
  uint64_t v30;
  int v31;
  int v32;
  void (*v33)(id *);
  void *v34;
  id v35;
  SUSettingsScanOperation *v36;
  __CFString *v37;
  os_log_type_t v38;
  id v39;
  int v40;
  id *v41;
  id location[2];
  SUSettingsScanOperation *v43;
  int64_t v44;
  uint8_t v45[56];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v41 = a4;
  v22 = -[SUSettingsScanOperation scanFSM](v43, "scanFSM");
  v21 = (id)-[SUCoreFSM extendedStateQueue](v22, "extendedStateQueue");
  dispatch_assert_queue_V2(v21);

  if (location[0])
  {
    v17 = -[SUSettingsScanOperation log](v43, "log");
    v39 = (id)-[SUCoreLog oslog](v17, "oslog");

    v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
    {
      log = v39;
      type = v38;
      v16 = -[SUSettingsScanOperation scanUUID](v43, "scanUUID");
      v15 = (id)objc_msgSend(location[0], "operationError");
      v4 = "successful";
      if (v15)
        v4 = "failed";
      v11 = (uint64_t)v4;
      v14 = SUSettingsScanOperationTypeToString(-[SUSettingsScanOperation operationType](v43, "operationType"));
      v37 = v14;
      __os_log_helper_16_2_4_8_32_8_66_8_32_8_66((uint64_t)v45, (uint64_t)"-[SUSettingsScanOperation action_ReportScanOutcome:error:]", (uint64_t)v16, v11, (uint64_t)v37);
      _os_log_impl(&dword_21BF33000, log, type, "%s [%{public}@]: Reporting a %s scan of type: %{public}@", v45, 0x2Au);

      objc_storeStrong((id *)&v37, 0);
    }
    objc_storeStrong(&v39, 0);
    v10 = -[SUSettingsScanOperation operationType](v43, "operationType");
    if (v10)
    {
      if (v10 == 1)
      {
        queue = -[SUSettingsScanOperation clientCompletionQueue](v43, "clientCompletionQueue");
        v30 = MEMORY[0x24BDAC760];
        v31 = -1073741824;
        v32 = 0;
        v33 = __58__SUSettingsScanOperation_action_ReportScanOutcome_error___block_invoke;
        v34 = &unk_24DFF7B80;
        v35 = location[0];
        v36 = v43;
        dispatch_async(queue, &v30);

        objc_storeStrong((id *)&v36, 0);
        objc_storeStrong(&v35, 0);
      }
      else if (v10 == 2)
      {
        v6 = -[SUSettingsScanOperation clientCompletionQueue](v43, "clientCompletionQueue");
        v23 = MEMORY[0x24BDAC760];
        v24 = -1073741824;
        v25 = 0;
        v26 = __58__SUSettingsScanOperation_action_ReportScanOutcome_error___block_invoke_2;
        v27 = &unk_24DFF7B80;
        v28 = location[0];
        v29 = v43;
        dispatch_async(v6, &v23);

        objc_storeStrong((id *)&v29, 0);
        objc_storeStrong(&v28, 0);
      }
    }
    else
    {
      v9 = -[SUSettingsScanOperation scanFSM](v43, "scanFSM");
      v8 = (id)-[SUCoreFSM diag](v9, "diag");
      objc_msgSend(v8, "dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:", CFSTR("Could not invoke a completion handler for a 'None' operation type."), 5, 0, 0, 0);

      -[SUSettingsScanOperation invalidateMachine](v43, "invalidateMachine");
    }
    v44 = 0;
    v40 = 1;
  }
  else
  {
    v19 = -[SUSettingsScanOperation scanFSM](v43, "scanFSM");
    v18 = (id)-[SUCoreFSM diag](v19, "diag");
    objc_msgSend(v18, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v44 = 8102;
    v40 = 1;
  }
  objc_storeStrong(location, 0);
  return v44;
}

void __58__SUSettingsScanOperation_action_ReportScanOutcome_error___block_invoke(id *a1)
{
  id v1;
  id v2;
  id v3;
  void (**v4)(id, id);
  id v5;
  SUSettingsFullScanResults *v6;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  id v13[3];

  v13[2] = a1;
  v13[1] = a1;
  v8 = (id)objc_msgSend(a1[4], "operationError");
  v11 = 0;
  v9 = 0;
  if (v8)
  {
    v1 = 0;
  }
  else
  {
    v6 = [SUSettingsFullScanResults alloc];
    v5 = a1[4];
    v12 = (id)objc_msgSend(a1[5], "scanUUID");
    v11 = 1;
    v10 = -[SUSettingsFullScanResults initFromScanParam:withUUID:](v6, "initFromScanParam:withUUID:", v5);
    v9 = 1;
    v1 = v10;
  }
  v13[0] = v1;
  if ((v9 & 1) != 0)

  if ((v11 & 1) != 0)
  v4 = (void (**)(id, id))(id)objc_msgSend(a1[5], "fullScanCompletionHandler");
  v2 = v13[0];
  v3 = (id)objc_msgSend(a1[4], "operationError");
  v4[2](v4, v2);

  objc_msgSend(a1[5], "invalidateMachine");
  objc_storeStrong(v13, 0);
}

void __58__SUSettingsScanOperation_action_ReportScanOutcome_error___block_invoke_2(id *a1)
{
  id v1;
  id v2;
  id v3;
  void (**v4)(id, id);
  id v5;
  SUSettingsScanResults *v6;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  id v13[3];

  v13[2] = a1;
  v13[1] = a1;
  v8 = (id)objc_msgSend(a1[4], "operationError");
  v11 = 0;
  v9 = 0;
  if (v8)
  {
    v1 = 0;
  }
  else
  {
    v6 = [SUSettingsScanResults alloc];
    v5 = a1[4];
    v12 = (id)objc_msgSend(a1[5], "scanUUID");
    v11 = 1;
    v10 = -[SUSettingsScanResults initFromScanParam:withUUID:](v6, "initFromScanParam:withUUID:", v5);
    v9 = 1;
    v1 = v10;
  }
  v13[0] = v1;
  if ((v9 & 1) != 0)

  if ((v11 & 1) != 0)
  v4 = (void (**)(id, id))(id)objc_msgSend(a1[5], "refreshScanCompletionHandler");
  v2 = v13[0];
  v3 = (id)objc_msgSend(a1[4], "operationError");
  v4[2](v4, v2);

  objc_msgSend(a1[5], "invalidateMachine");
  objc_storeStrong(v13, 0);
}

- (int64_t)action_ReportScanCanceled:(id)a3 error:(id *)a4
{
  id v4;
  NSObject *queue;
  BOOL v7;
  NSString *v8;
  SUCoreLog *v9;
  id v10;
  SUCoreFSM *v11;
  NSObject *v13;
  SUCoreFSM *v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  SUSettingsScanOperation *v20;
  os_log_type_t v21;
  id v22;
  int v23;
  id *v24;
  id location[2];
  SUSettingsScanOperation *v26;
  int64_t v27;
  uint8_t v28[24];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = a4;
  v14 = -[SUSettingsScanOperation scanFSM](v26, "scanFSM");
  v13 = (id)-[SUCoreFSM extendedStateQueue](v14, "extendedStateQueue");
  dispatch_assert_queue_V2(v13);

  if (location[0])
  {
    v9 = -[SUSettingsScanOperation log](v26, "log");
    v22 = (id)-[SUCoreLog oslog](v9, "oslog");

    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[SUSettingsScanOperation scanUUID](v26, "scanUUID");
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v28, (uint64_t)"-[SUSettingsScanOperation action_ReportScanCanceled:error:]", (uint64_t)v8);
      _os_log_impl(&dword_21BF33000, (os_log_t)v22, v21, "%s [%{public}@]: The scan was canceled. Calling the cancelation handler.", v28, 0x16u);

    }
    objc_storeStrong(&v22, 0);
    v4 = -[SUSettingsScanOperation cancelHandler](v26, "cancelHandler");
    v7 = v4 == 0;

    if (v7)
    {
      -[SUSettingsScanOperation invalidateMachine](v26, "invalidateMachine");
    }
    else
    {
      queue = -[SUSettingsScanOperation clientCompletionQueue](v26, "clientCompletionQueue");
      v15 = MEMORY[0x24BDAC760];
      v16 = -1073741824;
      v17 = 0;
      v18 = __59__SUSettingsScanOperation_action_ReportScanCanceled_error___block_invoke;
      v19 = &unk_24DFF7B58;
      v20 = v26;
      dispatch_async(queue, &v15);

      objc_storeStrong((id *)&v20, 0);
    }
    v27 = 0;
    v23 = 1;
  }
  else
  {
    v11 = -[SUSettingsScanOperation scanFSM](v26, "scanFSM");
    v10 = (id)-[SUCoreFSM diag](v11, "diag");
    objc_msgSend(v10, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v27 = 8102;
    v23 = 1;
  }
  objc_storeStrong(location, 0);
  return v27;
}

uint64_t __59__SUSettingsScanOperation_action_ReportScanCanceled_error___block_invoke(uint64_t a1)
{
  void (**v2)(void);

  v2 = (void (**)(void))(id)objc_msgSend(*(id *)(a1 + 32), "cancelHandler");
  v2[2]();

  return objc_msgSend(*(id *)(a1 + 32), "invalidateMachine");
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  uint64_t v6;
  id v9;
  id v10;
  SUCoreFSM *v11;
  id v12;
  id v13;
  SUCoreFSM *v14;
  id v15;
  id v16[2];
  id location[2];
  SUSettingsScanOperation *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16[1] = a4;
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v16[0] = (id)objc_msgSend(v4, "initWithFormat:", location[0]);
  v11 = -[SUSettingsScanOperation scanFSM](v18, "scanFSM");
  v10 = (id)-[SUCoreFSM diag](v11, "diag");
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  v9 = (id)objc_msgSend(v5, "initWithFormat:", CFSTR("unknown action(%@)"), location[0]);
  objc_msgSend(v10, "dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:");

  v12 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
  v15 = (id)objc_msgSend(v12, "buildError:underlying:description:", 8116, 0, v16[0]);

  v14 = -[SUSettingsScanOperation scanFSM](v18, "scanFSM");
  v13 = (id)-[SUCoreFSM diag](v14, "diag");
  v6 = objc_msgSend(v15, "code");
  objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("Scan FSM has reported an anomaly"), v6, v15);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (SUSettingsScanOperation)initWithUUID:(id)a3 usingSUManagerClient:(id)a4 andBetaManager:(id)a5 withCompletionQueue:(id)a6
{
  id v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  id v18;
  id v19;
  NSString *v20;
  id v21;
  id v22;
  SUSettingsScanOperation *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int v31;
  os_log_type_t v32;
  id v33;
  objc_super v34;
  id v35;
  id v36;
  id v37;
  id location[2];
  id v39;
  SUSettingsScanOperation *v40;
  id v41;
  id v42;
  uint8_t v43[16];
  uint8_t v44[24];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  objc_storeStrong(&v37, a4);
  v36 = 0;
  objc_storeStrong(&v36, a5);
  v35 = 0;
  objc_storeStrong(&v35, a6);
  v6 = v39;
  v39 = 0;
  v34.receiver = v6;
  v34.super_class = (Class)SUSettingsScanOperation;
  v26 = -[SUSettingsScanOperation init](&v34, sel_init);
  v39 = v26;
  objc_storeStrong(&v39, v26);
  if (!v26)
    goto LABEL_12;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEAEA70]), "initWithCategory:", CFSTR("SUSettingsScanOperation"));
  v8 = (void *)*((_QWORD *)v39 + 3);
  *((_QWORD *)v39 + 3) = v7;

  if (!*((_QWORD *)v39 + 3))
  {
    v22 = SUSettingsSharedLogger();
    v33 = (id)objc_msgSend(v22, "oslog");

    v32 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v44, (uint64_t)"-[SUSettingsScanOperation initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:]", (uint64_t)CFSTR("SUSettingsScanOperation"));
      _os_log_impl(&dword_21BF33000, (os_log_t)v33, v32, "%s: Could not create a log category for %@", v44, 0x16u);
    }
    objc_storeStrong(&v33, 0);
    v40 = 0;
    v31 = 1;
    goto LABEL_13;
  }
  v42 = (id)MGCopyAnswer();
  v30 = v42;
  v41 = (id)MGCopyAnswer();
  v29 = v41;
  v19 = objc_alloc(MEMORY[0x24BDD17C8]);
  v9 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v9);
  v28 = (id)objc_msgSend(v19, "initWithFormat:", CFSTR("%@:%@(%@,%@)"), v20, v30, v29, location[0]);

  objc_storeStrong((id *)v39 + 2, location[0]);
  objc_storeStrong((id *)v39 + 11, v37);
  objc_storeStrong((id *)v39 + 12, v36);
  v10 = (id)objc_msgSend((id)objc_opt_class(), "_generateStateTable");
  v11 = (void *)*((_QWORD *)v39 + 13);
  *((_QWORD *)v39 + 13) = v10;

  *((_QWORD *)v39 + 9) = 0;
  v21 = objc_alloc(MEMORY[0x24BEAEA60]);
  v12 = objc_msgSend(v21, "initMachine:withTable:startingIn:usingDelegate:registeringAllInfoClass:", v28, *((_QWORD *)v39 + 13), CFSTR("Idle"), v39, objc_opt_class());
  v13 = (void *)*((_QWORD *)v39 + 10);
  *((_QWORD *)v39 + 10) = v12;

  if (*((_QWORD *)v39 + 10))
  {
    v17 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    v14 = (id)objc_msgSend(v17, "selectCompletionQueue:", v35);
    v15 = (void *)*((_QWORD *)v39 + 14);
    *((_QWORD *)v39 + 14) = v14;

    v31 = 0;
  }
  else
  {
    v18 = SUSettingsSharedLogger();
    v27 = (id)objc_msgSend(v18, "oslog");

    if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v43, (uint64_t)"-[SUSettingsScanOperation initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:]");
      _os_log_impl(&dword_21BF33000, (os_log_t)v27, OS_LOG_TYPE_DEFAULT, "%s: Failed creating a scan FSM", v43, 0xCu);
    }
    objc_storeStrong(&v27, 0);
    v40 = 0;
    v31 = 1;
  }
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  if (!v31)
  {
LABEL_12:
    v40 = (SUSettingsScanOperation *)v39;
    v31 = 1;
  }
LABEL_13:
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v39, 0);
  return v40;
}

- (void)checkForAvailableUpdatesWithCompletionHandler:(id)a3
{
  id location[2];
  SUSettingsScanOperation *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSettingsScanOperation checkForAvailableUpdatesWithOptions:usingCompletionHandler:usingThirdPartyScanResults:andScanError:](v4, "checkForAvailableUpdatesWithOptions:usingCompletionHandler:usingThirdPartyScanResults:andScanError:", 0, location[0], 0);
  objc_storeStrong(location, 0);
}

- (void)checkForAvailableUpdatesWithOptions:(id)a3 usingCompletionHandler:(id)a4
{
  id v5;
  id location[2];
  SUSettingsScanOperation *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[SUSettingsScanOperation checkForAvailableUpdatesWithOptions:usingCompletionHandler:usingThirdPartyScanResults:andScanError:](v7, "checkForAvailableUpdatesWithOptions:usingCompletionHandler:usingThirdPartyScanResults:andScanError:", location[0], v5, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)checkForAvailableUpdatesWithOptions:(id)a3 usingCompletionHandler:(id)a4 usingThirdPartyScanResults:(id)a5 andScanError:(id)a6
{
  uint64_t v6;
  id fullScanCompletionHandler;
  dispatch_group_t v8;
  OS_dispatch_group *scanGroup;
  dispatch_queue_t v10;
  OS_dispatch_queue *concurrentQueue;
  SUSettingsScanOptions *v12;
  SUSettingsScanParam *v13;
  id v14;
  char *label;
  id v16;
  void *v17;
  id v18;
  SUCoreFSM *v19;
  SUCoreFSM *v23;
  char v24;
  SUSettingsScanOptions *v25;
  id v26;
  int v27;
  id v28;
  id v29;
  id v30;
  id location[2];
  SUSettingsScanOperation *v32;

  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v30 = 0;
  objc_storeStrong(&v30, a4);
  v29 = 0;
  objc_storeStrong(&v29, a5);
  v28 = 0;
  objc_storeStrong(&v28, a6);
  v23 = v32->_scanFSM;
  objc_sync_enter(v23);
  if (-[SUSettingsScanOperation isActive](v32, "isActive"))
  {
    v19 = -[SUSettingsScanOperation scanFSM](v32, "scanFSM");
    v18 = (id)-[SUCoreFSM diag](v19, "diag");
    objc_msgSend(v18, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("This scan machine is currently process another scan request. Queuing requests is not currently supported."), 8102, 0);

    v27 = 1;
  }
  else
  {
    v6 = MEMORY[0x220773A28](v30);
    fullScanCompletionHandler = v32->_fullScanCompletionHandler;
    v32->_fullScanCompletionHandler = (id)v6;

    v32->_operationType = 1;
    v8 = dispatch_group_create();
    scanGroup = v32->_scanGroup;
    v32->_scanGroup = (OS_dispatch_group *)v8;

    v17 = (void *)MEMORY[0x24BDD17C8];
    v16 = -[SUSettingsScanOperation baseDomain](v32, "baseDomain");
    v14 = (id)objc_msgSend(v17, "stringWithFormat:", CFSTR("%@.concurrentQueue"), v16);
    label = (char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    v10 = dispatch_queue_create(label, MEMORY[0x24BDAC9C0]);
    concurrentQueue = v32->_concurrentQueue;
    v32->_concurrentQueue = (OS_dispatch_queue *)v10;

    -[SUCoreFSM activateMachine](v32->_scanFSM, "activateMachine");
    v13 = [SUSettingsScanParam alloc];
    v24 = 0;
    if (location[0])
    {
      v12 = (SUSettingsScanOptions *)location[0];
    }
    else
    {
      v25 = objc_alloc_init(SUSettingsScanOptions);
      v24 = 1;
      v12 = v25;
    }
    v26 = -[SUSettingsScanParam initWithScanOptions:](v13, "initWithScanOptions:", v12);
    if ((v24 & 1) != 0)

    objc_msgSend(v26, "setThirdPartyDiscoveredScanResults:", v29);
    objc_msgSend(v26, "setThirdPartyDiscoveredScanError:", v28);
    -[SUCoreFSM postEvent:withInfo:](v32->_scanFSM, "postEvent:withInfo:", CFSTR("CheckForAvailableUpdate"), v26);
    objc_storeStrong(&v26, 0);
    v27 = 0;
  }
  objc_sync_exit(v23);

  if (!v27)
    v27 = 0;
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)refreshScanResultsWithPreferredUpdate:(id)a3 alternateUpdate:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  SUSettingsScanParam *v6;
  SUSettingsScanOperation *v10;
  SUSettingsScanParam *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSettingsScanOperation *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  v12 = 0;
  objc_storeStrong(&v12, a6);
  v10 = v16;
  v6 = [SUSettingsScanParam alloc];
  v11 = -[SUSettingsScanParam initWithPreferredDescriptor:andAlternateDescriptor:](v6, "initWithPreferredDescriptor:andAlternateDescriptor:", location[0], v14);
  -[SUSettingsScanOperation startRefreshOperation:withEventInfo:completionHandler:](v10, "startRefreshOperation:withEventInfo:completionHandler:", CFSTR("RefreshScanResults"));

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)refreshScanResultsWithPreferredUpdate:(id)a3 alternateUpdate:(id)a4 options:(id)a5 previouslyDiscoveredDownload:(id)a6 encounteredError:(id)a7 completionHandler:(id)a8
{
  SUSettingsScanParam *v8;
  SUSettingsScanOperation *v14;
  SUSettingsScanParam *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  SUSettingsScanOperation *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v18 = 0;
  objc_storeStrong(&v18, a6);
  v17 = 0;
  objc_storeStrong(&v17, a7);
  v16 = 0;
  objc_storeStrong(&v16, a8);
  v14 = v22;
  v8 = [SUSettingsScanParam alloc];
  v15 = -[SUSettingsScanParam initWithPreferredDescriptor:andAlternateDescriptor:previouslyDiscoveredDownloadedUpdate:encounteredError:](v8, "initWithPreferredDescriptor:andAlternateDescriptor:previouslyDiscoveredDownloadedUpdate:encounteredError:", location[0], v20, v18, v17);
  -[SUSettingsScanOperation startRefreshOperation:withEventInfo:completionHandler:](v14, "startRefreshOperation:withEventInfo:completionHandler:", CFSTR("RefreshScanResults"));

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)refreshScanResultsWithPreferredUpdate:(id)a3 alternateUpdate:(id)a4 options:(id)a5 previouslyDiscoveredDownload:(id)a6 previouslyDiscoveredAutoInstallOperation:(id)a7 encounteredError:(id)a8 completionHandler:(id)a9
{
  SUSettingsScanParam *v9;
  SUSettingsScanOperation *v15;
  SUSettingsScanParam *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location[2];
  SUSettingsScanOperation *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v20 = 0;
  objc_storeStrong(&v20, a6);
  v19 = 0;
  objc_storeStrong(&v19, a7);
  v18 = 0;
  objc_storeStrong(&v18, a8);
  v17 = 0;
  objc_storeStrong(&v17, a9);
  v15 = v24;
  v9 = [SUSettingsScanParam alloc];
  v16 = -[SUSettingsScanParam initWithPreferredDescriptor:andAlternateDescriptor:previouslyDiscoveredDownloadedUpdate:previouslyDiscoveredAutoInstallOperation:encounteredError:](v9, "initWithPreferredDescriptor:andAlternateDescriptor:previouslyDiscoveredDownloadedUpdate:previouslyDiscoveredAutoInstallOperation:encounteredError:", location[0], v22, v20, v19, v18);
  -[SUSettingsScanOperation startRefreshOperation:withEventInfo:completionHandler:](v15, "startRefreshOperation:withEventInfo:completionHandler:", CFSTR("RefreshScanResultsPostDownload"));

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (void)refreshBetaProgramsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v4;
  SUSettingsScanOperation *v5;
  SUSettingsScanOptions *v6;
  SUSettingsScanParam *v7;
  id v8;
  SUCoreFSM *v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(id *, char, id);
  void *v15;
  SUSettingsScanOperation *v16;
  id v17;
  id v18;
  char v19;
  SUSettingsScanOptions *v20;
  id v21;
  int v22;
  id v23;
  id location[2];
  SUSettingsScanOperation *v25;

  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v10 = v25->_scanFSM;
  objc_sync_enter(v10);
  if (-[SUSettingsScanOperation isActive](v25, "isActive"))
  {
    v8 = (id)-[SUCoreFSM diag](v25->_scanFSM, "diag");
    objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("The scan machine is currently active"), 8102, 0);

    v22 = 1;
  }
  else
  {
    v7 = [SUSettingsScanParam alloc];
    v19 = 0;
    if (location[0])
    {
      v6 = (SUSettingsScanOptions *)location[0];
    }
    else
    {
      v20 = objc_alloc_init(SUSettingsScanOptions);
      v19 = 1;
      v6 = v20;
    }
    v21 = -[SUSettingsScanParam initWithScanOptions:](v7, "initWithScanOptions:", v6);
    if ((v19 & 1) != 0)

    v5 = v25;
    v4 = v21;
    v11 = MEMORY[0x24BDAC760];
    v12 = -1073741824;
    v13 = 0;
    v14 = __76__SUSettingsScanOperation_refreshBetaProgramsWithOptions_completionHandler___block_invoke;
    v15 = &unk_24DFF7D88;
    v16 = v25;
    v18 = v23;
    v17 = v21;
    -[SUSettingsScanOperation checkForBetaPrograms:withReplyHandler:](v5, "checkForBetaPrograms:withReplyHandler:", v4, &v11);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v16, 0);
    objc_storeStrong(&v21, 0);
    v22 = 0;
  }
  objc_sync_exit(v10);

  if (!v22)
    v22 = 0;
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __76__SUSettingsScanOperation_refreshBetaProgramsWithOptions_completionHandler___block_invoke(id *a1, char a2, id obj)
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13[2];
  id location;
  char v15;
  id *v16;

  v16 = a1;
  v15 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v13[1] = a1;
  queue = (id)objc_msgSend(a1[4], "clientCompletionQueue");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __76__SUSettingsScanOperation_refreshBetaProgramsWithOptions_completionHandler___block_invoke_2;
  v9 = &unk_24DFFD430;
  v13[0] = a1[6];
  v10 = a1[5];
  v11 = a1[4];
  v12 = location;
  dispatch_async(queue, &v5);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(&location, 0);
}

void __76__SUSettingsScanOperation_refreshBetaProgramsWithOptions_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  SUSettingsBetaUpdatesScanResults *v2;
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 56);
  v2 = [SUSettingsBetaUpdatesScanResults alloc];
  v1 = *(_QWORD *)(a1 + 32);
  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "scanUUID");
  v5 = -[SUSettingsBetaUpdatesScanResults initFromScanParam:withUUID:](v2, "initFromScanParam:withUUID:", v1);
  (*(void (**)(void))(v4 + 16))();

}

- (void)cancel:(id)a3
{
  SUCoreFSM *scanFSM;
  SUSettingsScanParam *v4;
  id v5;
  SUCoreFSM *obj;
  id location[2];
  SUSettingsScanOperation *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = v8->_scanFSM;
  objc_sync_enter(obj);
  if (-[SUSettingsScanOperation isActive](v8, "isActive"))
  {
    if (!-[SUSettingsScanOperation isCanceled](v8, "isCanceled"))
    {
      -[SUSettingsScanOperation setCanceled:](v8, "setCanceled:", 1);
      -[SUSettingsScanOperation setCancelHandler:](v8, "setCancelHandler:", location[0]);
      scanFSM = v8->_scanFSM;
      v4 = objc_alloc_init(SUSettingsScanParam);
      -[SUCoreFSM postEvent:withInfo:](scanFSM, "postEvent:withInfo:", CFSTR("CancelScan"), v4);

    }
  }
  else
  {
    v5 = (id)-[SUCoreFSM diag](v8->_scanFSM, "diag");
    objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("There is no active search to cancel"), 8102, 0);

  }
  objc_sync_exit(obj);

  objc_storeStrong(location, 0);
}

- (BOOL)isActive
{
  return -[SUSettingsScanOperation operationType](self, "operationType", a2, self) != 0;
}

+ (unint64_t)installationIgnorableConstraints
{
  return 3072;
}

- (void)scheduleConcurrentActionWithSelector:(SEL)a3 eventInfo:(id)a4
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  dispatch_group_t *v10;
  id v11[2];
  id location;
  SEL v13;
  SEL v14;
  dispatch_group_t *v15;

  v15 = (dispatch_group_t *)self;
  v14 = a2;
  v13 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  dispatch_group_enter(v15[7]);
  queue = v15[8];
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __74__SUSettingsScanOperation_scheduleConcurrentActionWithSelector_eventInfo___block_invoke;
  v9 = &unk_24DFF8080;
  v10 = v15;
  v11[0] = location;
  v11[1] = (id)v13;
  dispatch_async(queue, &v5);
  objc_storeStrong(v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&location, 0);
}

void __74__SUSettingsScanOperation_scheduleConcurrentActionWithSelector_eventInfo___block_invoke(uint64_t a1)
{
  id v1;
  NSObject *log;
  os_log_type_t type;
  NSString *v4;
  id v5;
  id v6;
  BOOL v8;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(id *, char, id);
  void *v13;
  id v14;
  id v15[2];
  uint64_t v16;
  NSString *v17;
  os_log_type_t v18;
  id v19;
  id v20;
  id v21[3];
  uint8_t v22[40];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21[2] = (id)a1;
  v21[1] = (id)a1;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 64));
  v1 = (id)objc_msgSend(*(id *)(a1 + 40), "operationError");
  v8 = v1 == 0;

  if (v8)
  {
    v21[0] = (id)objc_msgSend(*(id *)(a1 + 32), "methodSignatureForSelector:", *(_QWORD *)(a1 + 48));
    v20 = (id)objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", v21[0]);
    objc_msgSend(v20, "setTarget:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v20, "setSelector:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v20, "setArgument:atIndex:", a1 + 40, 2);
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "log");
    v19 = (id)objc_msgSend(v6, "oslog");

    v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      log = v19;
      type = v18;
      v5 = (id)objc_msgSend(*(id *)(a1 + 32), "scanUUID");
      v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
      v17 = v4;
      __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v22, (uint64_t)"-[SUSettingsScanOperation scheduleConcurrentActionWithSelector:eventInfo:]_block_invoke", (uint64_t)v5, (uint64_t)v17);
      _os_log_impl(&dword_21BF33000, log, type, "%s [%{public}@]: Starting to execute concurrent action: %{public}@", v22, 0x20u);

      objc_storeStrong((id *)&v17, 0);
    }
    objc_storeStrong(&v19, 0);
    v9 = MEMORY[0x24BDAC760];
    v10 = -1073741824;
    v11 = 0;
    v12 = __74__SUSettingsScanOperation_scheduleConcurrentActionWithSelector_eventInfo___block_invoke_252;
    v13 = &unk_24DFFD458;
    v14 = *(id *)(a1 + 32);
    v15[1] = *(id *)(a1 + 48);
    v15[0] = *(id *)(a1 + 40);
    v16 = MEMORY[0x220773A28](&v9);
    objc_msgSend(v20, "setArgument:atIndex:");
    objc_msgSend(v20, "invoke");
    objc_storeStrong((id *)&v16, 0);
    objc_storeStrong(v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(v21, 0);
  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
  }
}

void __74__SUSettingsScanOperation_scheduleConcurrentActionWithSelector_eventInfo___block_invoke_252(id *a1, char a2, id obj)
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id v12[2];
  char v13;
  id *v14;
  id location;
  char v16;
  id *v17;

  v17 = a1;
  v16 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v14 = a1;
  queue = *((_QWORD *)a1[4] + 8);
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __74__SUSettingsScanOperation_scheduleConcurrentActionWithSelector_eventInfo___block_invoke_2;
  v9 = &unk_24DFFAA90;
  v10 = a1[4];
  v12[1] = a1[6];
  v13 = v16 & 1;
  v11 = location;
  v12[0] = a1[5];
  dispatch_barrier_async(queue, &v5);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
}

void __74__SUSettingsScanOperation_scheduleConcurrentActionWithSelector_eventInfo___block_invoke_2(uint64_t a1)
{
  const char *v1;
  id v2;
  uint64_t v3;
  BOOL v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *log;
  os_log_type_t type;
  id v10;
  NSString *v11;
  id v12;
  id v13;
  char v15;
  id v16;
  NSString *v17;
  os_log_type_t v18;
  id v19[3];
  uint8_t v20[72];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19[2] = (id)a1;
  v19[1] = (id)a1;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 64));
  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "log");
  v19[0] = (id)objc_msgSend(v13, "oslog");

  v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v19[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v19[0];
    type = v18;
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "scanUUID");
    v11 = NSStringFromSelector(*(SEL *)(a1 + 56));
    v5 = v11;
    v17 = v5;
    v1 = "YES";
    if ((*(_BYTE *)(a1 + 64) & 1) == 0)
      v1 = "NO";
    v6 = (uint64_t)v1;
    v7 = *(_QWORD *)(a1 + 40);
    v10 = (id)objc_msgSend(*(id *)(a1 + 48), "operationError");
    __os_log_helper_16_2_6_8_32_8_66_8_66_8_32_8_66_8_66((uint64_t)v20, (uint64_t)"-[SUSettingsScanOperation scheduleConcurrentActionWithSelector:eventInfo:]_block_invoke_2", (uint64_t)v12, (uint64_t)v5, v6, v7, (uint64_t)v10);
    _os_log_impl(&dword_21BF33000, log, type, "%s [%{public}@]: Concurrent operation \"%{public}@\" has been finished. Success: %s; error: %{public}@. Previous e"
      "rror: %{public}@",
      v20,
      0x3Eu);

    objc_storeStrong((id *)&v17, 0);
  }
  objc_storeStrong(v19, 0);
  v2 = (id)objc_msgSend(*(id *)(a1 + 48), "operationError");
  v4 = v2 == 0;

  if (!v4 || (*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    v15 = 0;
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 48), "setOperationError:", v3, v3);
    }
    else
    {
      v16 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAEF50], 5, 0);
      v15 = 1;
      objc_msgSend(*(id *)(a1 + 48), "setOperationError:", v16, v16);
    }
    if ((v15 & 1) != 0)

    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "postEvent:withInfo:", CFSTR("ConcurrentActionFailed"), *(_QWORD *)(a1 + 48));
  }
}

- (void)checkForMDMRestrictions:(id)a3 withReplyHandler:(id)a4
{
  SUManagerClient *suClient;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *, void *, id);
  void *v10;
  SUSettingsScanOperation *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSettingsScanOperation *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  suClient = v16->_suClient;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __68__SUSettingsScanOperation_checkForMDMRestrictions_withReplyHandler___block_invoke;
  v10 = &unk_24DFFD4A8;
  v11 = v16;
  v13 = v14;
  v12 = location[0];
  -[SUManagerClient softwareUpdatePathRestriction:](suClient, "softwareUpdatePathRestriction:");
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __68__SUSettingsScanOperation_checkForMDMRestrictions_withReplyHandler___block_invoke(id *a1, void *a2, id obj)
{
  void *v3;
  NSObject *log;
  os_log_type_t type;
  id v6;
  id v7;
  id v8;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(NSObject *, char, id);
  void *v14;
  id v15;
  id v16;
  id v17[2];
  int v18;
  id v19;
  os_log_type_t v20;
  id v21[2];
  id location;
  void *v23;
  id *v24;
  uint8_t v25[56];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = a1;
  v23 = a2;
  location = 0;
  objc_storeStrong(&location, obj);
  v21[1] = a1;
  v8 = (id)objc_msgSend(a1[4], "log");
  v21[0] = (id)objc_msgSend(v8, "oslog");

  v20 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v21[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v21[0];
    type = v20;
    v7 = (id)objc_msgSend(a1[4], "scanUUID");
    v6 = (id)SUStringFromMDMSUPath();
    v19 = v6;
    __os_log_helper_16_2_5_8_32_8_66_8_64_8_0_8_66((uint64_t)v25, (uint64_t)"-[SUSettingsScanOperation checkForMDMRestrictions:withReplyHandler:]_block_invoke", (uint64_t)v7, (uint64_t)v19, (uint64_t)v23, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, type, "%s [%{public}@]: Found path restriction: %@ (%ld); error: %{public}@",
      v25,
      0x34u);

    objc_storeStrong(&v19, 0);
  }
  objc_storeStrong(v21, 0);
  if (location)
  {
    (*((void (**)(void))a1[6] + 2))();
    v18 = 1;
  }
  else
  {
    v3 = (void *)*((_QWORD *)a1[4] + 11);
    v10 = MEMORY[0x24BDAC760];
    v11 = -1073741824;
    v12 = 0;
    v13 = __68__SUSettingsScanOperation_checkForMDMRestrictions_withReplyHandler___block_invoke_254;
    v14 = &unk_24DFFD480;
    v15 = a1[4];
    v17[0] = a1[6];
    v16 = a1[5];
    v17[1] = v23;
    objc_msgSend(v3, "isDelayingUpdates:", &v10);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(v17, 0);
    objc_storeStrong(&v15, 0);
    v18 = 0;
  }
  objc_storeStrong(&location, 0);
}

void __68__SUSettingsScanOperation_checkForMDMRestrictions_withReplyHandler___block_invoke_254(NSObject *a1, char a2, id obj)
{
  id v3;
  id v4;
  os_log_t oslog[2];
  id location;
  char v8;
  NSObject *v9;
  uint8_t v10[40];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9 = a1;
  v8 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  v4 = (id)-[objc_class log](a1[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v4, "oslog");

  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = (id)-[objc_class scanUUID](a1[4].isa, "scanUUID");
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v10, (uint64_t)"-[SUSettingsScanOperation checkForMDMRestrictions:withReplyHandler:]_block_invoke", (uint64_t)v3, v8 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: Is delaying updates: %d; error: %{public}@",
      v10,
      0x26u);

  }
  objc_storeStrong((id *)oslog, 0);
  if (!location)
  {
    -[objc_class setMdmPathRestrictions:](a1[5].isa, "setMdmPathRestrictions:", a1[7].isa);
    -[objc_class setIsDelayingUpdate:](a1[5].isa, "setIsDelayingUpdate:", v8 & 1);
  }
  (*((void (**)(void))a1[6].isa + 2))();
  objc_storeStrong(&location, 0);
}

- (void)queryDDMDeclaration:(id)a3 withReplyHandler:(id)a4
{
  SUManagerClient *suClient;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id v12;
  id v13;
  id location[2];
  SUSettingsScanOperation *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  suClient = v15->_suClient;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __64__SUSettingsScanOperation_queryDDMDeclaration_withReplyHandler___block_invoke;
  v10 = &unk_24DFFC540;
  v12 = v13;
  v11 = location[0];
  -[SUManagerClient getDDMDeclarationWithHandler:](suClient, "getDDMDeclarationWithHandler:");
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __64__SUSettingsScanOperation_queryDDMDeclaration_withReplyHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BOOL v3;
  BOOL v6;
  char v7;
  id v8;
  id v9;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  v7 = 0;
  v6 = 0;
  if (v9)
  {
    v8 = (id)objc_msgSend(v9, "domain");
    v7 = 1;
    v3 = 0;
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEAED98]) & 1) != 0)
      v3 = objc_msgSend(v9, "code") == 102;
    v6 = !v3;
  }
  if ((v7 & 1) != 0)

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "setDDMDeclaration:", location[0]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)checkForBetaPrograms:(id)a3 withReplyHandler:(id)a4
{
  void *v4;
  id v5;
  NSString *v6;
  SUCoreLog *v7;
  id v8;
  char v9;
  NSString *v10;
  SUCoreLog *v11;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  SUSettingsScanOperation *v19;
  id v20;
  os_log_type_t v21;
  id v22;
  int v23;
  os_log_type_t v24;
  id v25;
  id v26;
  id location[2];
  SUSettingsScanOperation *v28;
  uint8_t v29[32];
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v8 = (id)objc_msgSend(location[0], "options");
    v9 = objc_msgSend(v8, "clientIsBuddy");

    if ((v9 & 1) != 0)
    {
      v7 = -[SUSettingsScanOperation log](v28, "log");
      v22 = (id)-[SUCoreLog oslog](v7, "oslog");

      v21 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
      {
        v6 = -[SUSettingsScanOperation scanUUID](v28, "scanUUID");
        __os_log_helper_16_2_2_8_32_8_66((uint64_t)v29, (uint64_t)"-[SUSettingsScanOperation checkForBetaPrograms:withReplyHandler:]", (uint64_t)v6);
        _os_log_impl(&dword_21BF33000, (os_log_t)v22, v21, "%s [%{public}@]: The client is Buddy - skipping on the Seeding feature.", v29, 0x16u);

      }
      objc_storeStrong(&v22, 0);
      (*((void (**)(id, uint64_t, _QWORD))v26 + 2))(v26, 1, 0);
      v23 = 1;
    }
    else
    {
      v5 = (id)objc_msgSend(location[0], "currentSeedingDevice");

      if (v5)
      {
        -[SUSettingsScanOperation scanForDeviceEligibleBetaPrograms:withReplyHandler:](v28, "scanForDeviceEligibleBetaPrograms:withReplyHandler:", location[0], v26);
      }
      else
      {
        v4 = (void *)MEMORY[0x24BE85340];
        v13 = MEMORY[0x24BDAC760];
        v14 = -1073741824;
        v15 = 0;
        v16 = __65__SUSettingsScanOperation_checkForBetaPrograms_withReplyHandler___block_invoke;
        v17 = &unk_24DFFD4D0;
        v18 = location[0];
        v19 = v28;
        v20 = v26;
        objc_msgSend(v4, "getCurrentDevice:", &v13);
        objc_storeStrong(&v20, 0);
        objc_storeStrong((id *)&v19, 0);
        objc_storeStrong(&v18, 0);
      }
      v23 = 0;
    }
  }
  else
  {
    v11 = -[SUSettingsScanOperation log](v28, "log");
    v25 = (id)-[SUCoreLog oslog](v11, "oslog");

    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[SUSettingsScanOperation scanUUID](v28, "scanUUID");
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v30, (uint64_t)"-[SUSettingsScanOperation checkForBetaPrograms:withReplyHandler:]", (uint64_t)v10);
      _os_log_impl(&dword_21BF33000, (os_log_t)v25, v24, "%s [%{public}@]: The Seeding feature is unavailable.", v30, 0x16u);

    }
    objc_storeStrong(&v25, 0);
    (*((void (**)(id, uint64_t, _QWORD))v26 + 2))(v26, 1, 0);
    v23 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

void __65__SUSettingsScanOperation_checkForBetaPrograms_withReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentSeedingDevice:", location[0]);
  objc_msgSend(*(id *)(a1 + 40), "scanForDeviceEligibleBetaPrograms:withReplyHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  objc_storeStrong(location, 0);
}

- (void)scanForDeviceEligibleBetaPrograms:(id)a3 withReplyHandler:(id)a4
{
  id v4;
  uint64_t v5;
  SDBetaManager *seedingBetaManager;
  id v7;
  NSString *v8;
  SUCoreLog *v9;
  BOOL v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(id *, void *, uint64_t);
  void *v16;
  id v17;
  SUSettingsScanOperation *v18;
  id v19;
  int v20;
  os_log_type_t v21;
  id v22;
  id v23;
  id location[2];
  SUSettingsScanOperation *v25;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v4 = (id)objc_msgSend(location[0], "currentSeedingDevice");
  v11 = v4 != 0;

  if (v11)
  {
    seedingBetaManager = v25->_seedingBetaManager;
    v7 = (id)objc_msgSend(location[0], "currentSeedingDevice");
    v5 = objc_msgSend(v7, "platform");
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __78__SUSettingsScanOperation_scanForDeviceEligibleBetaPrograms_withReplyHandler___block_invoke;
    v16 = &unk_24DFFD520;
    v17 = location[0];
    v18 = v25;
    v19 = v23;
    -[SDBetaManager queryProgramsForSystemAccountsWithPlatforms:completion:](seedingBetaManager, "queryProgramsForSystemAccountsWithPlatforms:completion:", v5, &v12);

    objc_storeStrong(&v19, 0);
    objc_storeStrong((id *)&v18, 0);
    objc_storeStrong(&v17, 0);
    v20 = 0;
  }
  else
  {
    v9 = -[SUSettingsScanOperation log](v25, "log");
    v22 = (id)-[SUCoreLog oslog](v9, "oslog");

    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[SUSettingsScanOperation scanUUID](v25, "scanUUID");
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v26, (uint64_t)"-[SUSettingsScanOperation scanForDeviceEligibleBetaPrograms:withReplyHandler:]", (uint64_t)v8);
      _os_log_impl(&dword_21BF33000, (os_log_t)v22, v21, "%s [%{public}@]: Tried to scan for beta programs without a seeding device.", v26, 0x16u);

    }
    objc_storeStrong(&v22, 0);
    (*((void (**)(id, _QWORD, _QWORD))v23 + 2))(v23, 0, 0);
    v20 = 1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __78__SUSettingsScanOperation_scanForDeviceEligibleBetaPrograms_withReplyHandler___block_invoke(id *a1, void *a2, uint64_t a3)
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  os_log_type_t v24;
  id v25;
  int v26;
  os_log_type_t v27;
  id v28[2];
  uint64_t v29;
  id location[2];
  uint8_t v31[48];
  uint8_t v32[40];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v29 = a3;
  v28[1] = a1;
  if (a3)
  {
    objc_msgSend(a1[4], "setBetaPrograms:", MEMORY[0x24BDBD1A8]);
    v12 = (id)objc_msgSend(a1[5], "log");
    v28[0] = (id)objc_msgSend(v12, "oslog");

    v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v28[0], OS_LOG_TYPE_DEFAULT))
    {
      v11 = (id)objc_msgSend(a1[5], "scanUUID");
      __os_log_helper_16_2_3_8_32_8_66_8_0((uint64_t)v32, (uint64_t)"-[SUSettingsScanOperation scanForDeviceEligibleBetaPrograms:withReplyHandler:]_block_invoke", (uint64_t)v11, v29);
      _os_log_impl(&dword_21BF33000, (os_log_t)v28[0], v27, "%s [%{public}@]: Could not fetch new beta programs: %ld", v32, 0x20u);

    }
    objc_storeStrong(v28, 0);
    (*((void (**)(void))a1[6] + 2))();
    v26 = 1;
  }
  else
  {
    objc_msgSend(a1[4], "setBetaPrograms:", location[0]);
    v10 = (id)objc_msgSend(a1[5], "log");
    v25 = (id)objc_msgSend(v10, "oslog");

    v24 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v25;
      v7 = v24;
      v9 = (id)objc_msgSend(a1[5], "scanUUID");
      v5 = objc_msgSend(location[0], "count");
      v8 = (id)objc_msgSend(location[0], "valueForKey:", CFSTR("programID"));
      v23 = v8;
      __os_log_helper_16_2_4_8_32_8_66_8_0_8_64((uint64_t)v31, (uint64_t)"-[SUSettingsScanOperation scanForDeviceEligibleBetaPrograms:withReplyHandler:]_block_invoke", (uint64_t)v9, v5, (uint64_t)v23);
      _os_log_impl(&dword_21BF33000, v6, v7, "%s [%{public}@]: Got the device available Beta Programs (count: %ld): %@", v31, 0x2Au);

      objc_storeStrong(&v23, 0);
    }
    objc_storeStrong(&v25, 0);
    v3 = (void *)*((_QWORD *)a1[5] + 12);
    v4 = (id)objc_msgSend(a1[4], "currentSeedingDevice");
    v15 = MEMORY[0x24BDAC760];
    v16 = -1073741824;
    v17 = 0;
    v18 = __78__SUSettingsScanOperation_scanForDeviceEligibleBetaPrograms_withReplyHandler___block_invoke_263;
    v19 = &unk_24DFFD4F8;
    v20 = a1[4];
    v21 = a1[5];
    v22 = a1[6];
    objc_msgSend(v3, "enrolledBetaProgramForDevice:completion:", v4, &v15);

    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    v26 = 0;
  }
  objc_storeStrong(location, 0);
}

void __78__SUSettingsScanOperation_scanForDeviceEligibleBetaPrograms_withReplyHandler___block_invoke_263(uint64_t a1, void *a2)
{
  const __CFString *v2;
  id v3;
  id v4;
  id v5;
  char v7;
  __CFString *v8;
  id v9[2];
  id location[2];
  uint8_t v11[56];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[1] = (id)a1;
  objc_msgSend(*(id *)(a1 + 32), "setEnrolledBetaProgram:", location[0]);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "log");
  v9[0] = (id)objc_msgSend(v5, "oslog");

  if (os_log_type_enabled((os_log_t)v9[0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 40), "scanUUID");
    v4 = location[0];
    v7 = 0;
    if (location[0])
    {
      v8 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(location[0], "programID"));
      v7 = 1;
      v2 = v8;
    }
    else
    {
      v2 = CFSTR("(null)");
    }
    __os_log_helper_16_2_4_8_32_8_66_8_64_8_66((uint64_t)v11, (uint64_t)"-[SUSettingsScanOperation scanForDeviceEligibleBetaPrograms:withReplyHandler:]_block_invoke", (uint64_t)v3, (uint64_t)v4, (uint64_t)v2);
    _os_log_impl(&dword_21BF33000, (os_log_t)v9[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: Refreshed current beta program: %@ (program ID: %{public}@", v11, 0x2Au);
    if ((v7 & 1) != 0)

  }
  objc_storeStrong(v9, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_storeStrong(location, 0);
}

- (void)queryRollbackStatus:(id)a3 withReplyHandler:(id)a4
{
  SUManagerClient *suClient;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *, char, id, void *);
  void *v10;
  SUSettingsScanOperation *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSettingsScanOperation *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  suClient = v16->_suClient;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __64__SUSettingsScanOperation_queryRollbackStatus_withReplyHandler___block_invoke;
  v10 = &unk_24DFFD548;
  v11 = v16;
  v13 = v14;
  v12 = location[0];
  -[SUManagerClient isRollingBack:](suClient, "isRollingBack:");
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __64__SUSettingsScanOperation_queryRollbackStatus_withReplyHandler___block_invoke(id *a1, char a2, id obj, void *a4)
{
  NSObject *queue;
  id v5;
  id v6;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  int v18;
  os_log_type_t v19;
  id v20[2];
  id v21;
  id location;
  char v23;
  id *v24;
  uint8_t v25[56];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = a1;
  v23 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  v20[1] = a1;
  v6 = (id)objc_msgSend(a1[4], "log");
  v20[0] = (id)objc_msgSend(v6, "oslog");

  v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v20[0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (id)objc_msgSend(a1[4], "scanUUID");
    __os_log_helper_16_2_5_8_32_8_66_4_0_8_66_8_64((uint64_t)v25, (uint64_t)"-[SUSettingsScanOperation queryRollbackStatus:withReplyHandler:]_block_invoke", (uint64_t)v5, v23 & 1, (uint64_t)location, (uint64_t)v21);
    _os_log_impl(&dword_21BF33000, (os_log_t)v20[0], v19, "%s [%{public}@]: Is rolling back? %d; error: %{public}@; rollback descriptor: %@",
      v25,
      0x30u);

  }
  objc_storeStrong(v20, 0);
  if (v21)
  {
    (*((void (**)(void))a1[6] + 2))();
    v18 = 1;
  }
  else
  {
    objc_msgSend(a1[5], "setIsRollingBack:", v23 & 1);
    queue = *((_QWORD *)a1[4] + 8);
    v9 = MEMORY[0x24BDAC760];
    v10 = -1073741824;
    v11 = 0;
    v12 = __64__SUSettingsScanOperation_queryRollbackStatus_withReplyHandler___block_invoke_269;
    v13 = &unk_24DFFC450;
    v14 = location;
    v15 = a1[4];
    v16 = a1[5];
    v17 = a1[6];
    dispatch_barrier_async(queue, &v9);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
    v18 = 0;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&location, 0);
}

uint64_t __64__SUSettingsScanOperation_queryRollbackStatus_withReplyHandler___block_invoke_269(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id location[3];
  uint8_t v8[56];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  location[2] = (id)a1;
  location[1] = (id)a1;
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "log");
    location[0] = (id)objc_msgSend(v5, "oslog");

    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      v2 = *(_QWORD *)(a1 + 32);
      v4 = (id)objc_msgSend(*(id *)(a1 + 48), "rollbackDescriptor");
      v3 = (id)objc_msgSend(*(id *)(a1 + 48), "rollbackDescriptor");
      __os_log_helper_16_2_5_8_32_8_64_8_0_8_64_8_0((uint64_t)v8, (uint64_t)"-[SUSettingsScanOperation queryRollbackStatus:withReplyHandler:]_block_invoke", v2, v2, (uint64_t)v4, (uint64_t)v3);
      _os_log_impl(&dword_21BF33000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "%s: Assigning roolback descriptor %@ (%p) instead of %@ (%p)", v8, 0x34u);

    }
    objc_storeStrong(location, 0);
    objc_msgSend(*(id *)(a1 + 48), "setRollbackDescriptor:", *(_QWORD *)(a1 + 32));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)checkIsEligibleForRollback:(id)a3 withReplyHandler:(id)a4
{
  SUManagerClient *suClient;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *, void *, void *);
  void *v10;
  SUSettingsScanOperation *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSettingsScanOperation *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  suClient = v16->_suClient;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __71__SUSettingsScanOperation_checkIsEligibleForRollback_withReplyHandler___block_invoke;
  v10 = &unk_24DFFD570;
  v11 = v16;
  v13 = v14;
  v12 = location[0];
  -[SUManagerClient eligibleRollbackWithOptions:withResult:](suClient, "eligibleRollbackWithOptions:withResult:", 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSettingsScanOperation_checkIsEligibleForRollback_withReplyHandler___block_invoke(id *a1, void *a2, void *a3)
{
  NSObject *queue;
  id v4;
  id v5;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  os_log_type_t v18;
  id v19[2];
  id v20;
  id location[2];
  uint8_t v22[56];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v20 = 0;
  objc_storeStrong(&v20, a3);
  v19[1] = a1;
  v5 = (id)objc_msgSend(a1[4], "log");
  v19[0] = (id)objc_msgSend(v5, "oslog");

  v18 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v19[0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (id)objc_msgSend(a1[4], "scanUUID");
    __os_log_helper_16_2_4_8_32_8_66_8_66_8_64((uint64_t)v22, (uint64_t)"-[SUSettingsScanOperation checkIsEligibleForRollback:withReplyHandler:]_block_invoke", (uint64_t)v4, (uint64_t)v20, (uint64_t)location[0]);
    _os_log_impl(&dword_21BF33000, (os_log_t)v19[0], v18, "%s [%{public}@]: error: %{public}@; eligible rollback descriptor: %@",
      v22,
      0x2Au);

  }
  objc_storeStrong(v19, 0);
  if (v20)
  {
    (*((void (**)(void))a1[6] + 2))();
    v17 = 1;
  }
  else
  {
    queue = *((_QWORD *)a1[4] + 8);
    v8 = MEMORY[0x24BDAC760];
    v9 = -1073741824;
    v10 = 0;
    v11 = __71__SUSettingsScanOperation_checkIsEligibleForRollback_withReplyHandler___block_invoke_271;
    v12 = &unk_24DFFC450;
    v13 = location[0];
    v14 = a1[4];
    v15 = a1[5];
    v16 = a1[6];
    dispatch_barrier_async(queue, &v8);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v13, 0);
    v17 = 0;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

uint64_t __71__SUSettingsScanOperation_checkIsEligibleForRollback_withReplyHandler___block_invoke_271(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id location[3];
  uint8_t v8[56];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  location[2] = (id)a1;
  location[1] = (id)a1;
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "log");
    location[0] = (id)objc_msgSend(v5, "oslog");

    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      v2 = *(_QWORD *)(a1 + 32);
      v4 = (id)objc_msgSend(*(id *)(a1 + 48), "rollbackDescriptor");
      v3 = (id)objc_msgSend(*(id *)(a1 + 48), "rollbackDescriptor");
      __os_log_helper_16_2_5_8_32_8_64_8_0_8_64_8_0((uint64_t)v8, (uint64_t)"-[SUSettingsScanOperation checkIsEligibleForRollback:withReplyHandler:]_block_invoke", v2, v2, (uint64_t)v4, (uint64_t)v3);
      _os_log_impl(&dword_21BF33000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "%s: Assigning roolback descriptor %@ (%p) instead of %@ (%p)", v8, 0x34u);

    }
    objc_storeStrong(location, 0);
    objc_msgSend(*(id *)(a1 + 48), "setRollbackDescriptor:", *(_QWORD *)(a1 + 32));
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)checkIfAutoUpdateScheduled:(id)a3 withReplyHandler:(id)a4
{
  SUManagerClient *suClient;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *, char, id);
  void *v10;
  SUSettingsScanOperation *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  SUSettingsScanOperation *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  suClient = v16->_suClient;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __71__SUSettingsScanOperation_checkIfAutoUpdateScheduled_withReplyHandler___block_invoke;
  v10 = &unk_24DFF7D88;
  v11 = v16;
  v13 = v14;
  v12 = location[0];
  -[SUManagerClient isAutoUpdateScheduled:](suClient, "isAutoUpdateScheduled:");
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __71__SUSettingsScanOperation_checkIfAutoUpdateScheduled_withReplyHandler___block_invoke(id *a1, char a2, id obj)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  id v13;
  id v14;
  char v15;
  int v16;
  os_log_type_t v17;
  id v18[2];
  id location;
  char v20;
  id *v21;
  uint8_t v22[40];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21 = a1;
  v20 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v18[1] = a1;
  v5 = (id)objc_msgSend(a1[4], "log");
  v18[0] = (id)objc_msgSend(v5, "oslog");

  v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v18[0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = (id)objc_msgSend(a1[4], "scanUUID");
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v22, (uint64_t)"-[SUSettingsScanOperation checkIfAutoUpdateScheduled:withReplyHandler:]_block_invoke", (uint64_t)v4, v20 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, (os_log_t)v18[0], v17, "%s [%{public}@]: isAutoUpdateScheduled - result: %d, error: %{public}@", v22, 0x26u);

  }
  objc_storeStrong(v18, 0);
  if (location || (objc_msgSend(a1[5], "setIsAutoUpdateScheduled:", v20 & 1), (v20 & 1) == 0))
  {
    (*((void (**)(void))a1[6] + 2))();
    v16 = 1;
  }
  else
  {
    v3 = (void *)*((_QWORD *)a1[4] + 11);
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __71__SUSettingsScanOperation_checkIfAutoUpdateScheduled_withReplyHandler___block_invoke_273;
    v11 = &unk_24DFFD598;
    v12 = a1[4];
    v15 = v20 & 1;
    v14 = a1[6];
    v13 = a1[5];
    objc_msgSend(v3, "currentAutoInstallOperation:withResult:", 0, &v7);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v12, 0);
    v16 = 0;
  }
  objc_storeStrong(&location, 0);
}

void __71__SUSettingsScanOperation_checkIfAutoUpdateScheduled_withReplyHandler___block_invoke_273(uint64_t a1, void *a2, void *a3)
{
  id v3;
  id v4;
  os_log_t oslog[2];
  id v8;
  id location[2];
  uint8_t v10[56];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8 = 0;
  objc_storeStrong(&v8, a3);
  oslog[1] = (os_log_t)a1;
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v4, "oslog");

  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = (id)objc_msgSend(*(id *)(a1 + 32), "scanUUID");
    __os_log_helper_16_2_5_8_32_8_66_8_66_8_66_4_0((uint64_t)v10, (uint64_t)"-[SUSettingsScanOperation checkIfAutoUpdateScheduled:withReplyHandler:]_block_invoke", (uint64_t)v3, (uint64_t)location[0], (uint64_t)v8, *(_BYTE *)(a1 + 56) & 1);
    _os_log_impl(&dword_21BF33000, oslog[0], OS_LOG_TYPE_DEFAULT, "%s [%{public}@]: currentAutoInstallOperation - result: %{public}@, error: %{public}@; was scheduled: %d",
      v10,
      0x30u);

  }
  objc_storeStrong((id *)oslog, 0);
  if (!v8)
    objc_msgSend(*(id *)(a1 + 40), "setCurrentAutoInstallOperation:", location[0]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)startRefreshOperation:(id)a3 withEventInfo:(id)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id refreshScanCompletionHandler;
  dispatch_group_t v7;
  OS_dispatch_group *scanGroup;
  dispatch_queue_t v9;
  OS_dispatch_queue *concurrentQueue;
  id v11;
  char *label;
  id v13;
  void *v14;
  id v15;
  SUCoreFSM *v18;
  id v19;
  id v20;
  id location[2];
  SUSettingsScanOperation *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = 0;
  objc_storeStrong(&v19, a5);
  v18 = v22->_scanFSM;
  objc_sync_enter(v18);
  if (-[SUSettingsScanOperation isActive](v22, "isActive"))
  {
    v15 = (id)-[SUCoreFSM diag](v22->_scanFSM, "diag");
    objc_msgSend(v15, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsScanOperation]"), CFSTR("The scan machine is currently active"), 8102, 0);

  }
  else
  {
    v5 = MEMORY[0x220773A28](v19);
    refreshScanCompletionHandler = v22->_refreshScanCompletionHandler;
    v22->_refreshScanCompletionHandler = (id)v5;

    v22->_operationType = 2;
    v7 = dispatch_group_create();
    scanGroup = v22->_scanGroup;
    v22->_scanGroup = (OS_dispatch_group *)v7;

    v14 = (void *)MEMORY[0x24BDD17C8];
    v13 = -[SUSettingsScanOperation baseDomain](v22, "baseDomain");
    v11 = (id)objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.concurrentQueue"), v13);
    label = (char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    v9 = dispatch_queue_create(label, MEMORY[0x24BDAC9C0]);
    concurrentQueue = v22->_concurrentQueue;
    v22->_concurrentQueue = (OS_dispatch_queue *)v9;

    -[SUCoreFSM activateMachine](v22->_scanFSM, "activateMachine");
    -[SUCoreFSM postEvent:withInfo:](v22->_scanFSM, "postEvent:withInfo:", location[0], v20);
  }
  objc_sync_exit(v18);

  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldConsiderErrorAsSuccessfulCase:(id)a3
{
  BOOL v4;
  id v5;
  char v6;
  uint64_t v7;
  id location[3];
  char v9;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v5 = (id)objc_msgSend(location[0], "domain");
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEAED98]);

    if ((v6 & 1) != 0)
    {
      v7 = objc_msgSend(location[0], "code");
      v4 = 1;
      if (v7 != 3)
      {
        v4 = 1;
        if (v7 != 55)
        {
          v4 = 1;
          if (v7 != 13)
          {
            v4 = 1;
            if (v7 != 11)
              v4 = v7 == 14;
          }
        }
      }
      v9 = v4;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 1;
  }
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (void)invalidateMachine
{
  -[SUSettingsScanOperation setFullScanCompletionHandler:](self, "setFullScanCompletionHandler:");
  -[SUSettingsScanOperation setRefreshScanCompletionHandler:](self, "setRefreshScanCompletionHandler:", 0);
  -[SUSettingsScanOperation setCancelHandler:](self, "setCancelHandler:", 0);
  -[SUSettingsScanOperation setOperationType:](self, "setOperationType:", 0);
}

- (id)baseDomain
{
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v5 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
  v4 = (id)objc_msgSend(v5, "commonDomain");
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@.susettings.fsm.scan.%@"), v4, self->_scanUUID);

  return v6;
}

- (NSString)scanUUID
{
  return self->_scanUUID;
}

- (SUCoreLog)log
{
  return self->_log;
}

- (id)fullScanCompletionHandler
{
  return self->_fullScanCompletionHandler;
}

- (void)setFullScanCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)refreshScanCompletionHandler
{
  return self->_refreshScanCompletionHandler;
}

- (void)setRefreshScanCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (OS_dispatch_group)scanGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 56, 1);
}

- (void)setScanGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)concurrentQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConcurrentQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(unint64_t)a3
{
  self->_operationType = a3;
}

- (BOOL)isCanceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (SUCoreFSM)scanFSM
{
  return self->_scanFSM;
}

- (SUManagerClient)suClient
{
  return self->_suClient;
}

- (SDBetaManager)seedingBetaManager
{
  return self->_seedingBetaManager;
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (OS_dispatch_queue)clientCompletionQueue
{
  return self->_clientCompletionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCompletionQueue, 0);
  objc_storeStrong((id *)&self->_stateTable, 0);
  objc_storeStrong((id *)&self->_seedingBetaManager, 0);
  objc_storeStrong((id *)&self->_suClient, 0);
  objc_storeStrong((id *)&self->_scanFSM, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_scanGroup, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_refreshScanCompletionHandler, 0);
  objc_storeStrong(&self->_fullScanCompletionHandler, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_scanUUID, 0);
}

@end
