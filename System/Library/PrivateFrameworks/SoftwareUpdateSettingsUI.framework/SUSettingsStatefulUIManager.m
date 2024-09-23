@implementation SUSettingsStatefulUIManager

+ (id)_generateStateTable
{
  id v2;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v6;
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
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56[3];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const __CFString *v60;
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[6];
  _QWORD v70[6];
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[6];
  _QWORD v84[6];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  uint64_t v91;
  const __CFString *v92;
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[6];
  _QWORD v98[6];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  uint64_t v105;
  const __CFString *v106;
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[6];
  _QWORD v112[6];
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  uint64_t v119;
  const __CFString *v120;
  _QWORD v121[2];
  _QWORD v122[2];
  _QWORD v123[2];
  _QWORD v124[2];
  _QWORD v125[6];
  _QWORD v126[6];
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  _QWORD v137[2];
  _QWORD v138[2];
  _QWORD v139[6];
  _QWORD v140[6];
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  _QWORD v145[2];
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[2];
  _QWORD v149[4];
  _QWORD v150[4];
  _QWORD v151[7];
  _QWORD v152[8];

  v152[7] = *MEMORY[0x24BDAC8D0];
  v56[2] = a1;
  v56[1] = (id)a2;
  v151[0] = CFSTR("Idle");
  v149[0] = CFSTR("CheckForAvailableUpdate");
  v4 = (_QWORD *)MEMORY[0x24BEAEBD0];
  v147[0] = *MEMORY[0x24BEAEBD0];
  v148[0] = CFSTR("CheckingForAvailableUpdate");
  v5 = (_QWORD *)MEMORY[0x24BEAEA98];
  v147[1] = *MEMORY[0x24BEAEA98];
  v148[1] = CFSTR("CheckForAvailableUpdate");
  v53 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v148, v147);
  v150[0] = v53;
  v149[1] = CFSTR("RefreshScanResults");
  v145[0] = *v4;
  v146[0] = CFSTR("RefreshingScanResults");
  v145[1] = *v5;
  v146[1] = CFSTR("RefreshScanResults");
  v52 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v146, v145, 2);
  v150[1] = v52;
  v149[2] = CFSTR("RefreshScanResults");
  v143 = *v5;
  v6 = (uint64_t *)MEMORY[0x24BEAEBB0];
  v144 = *MEMORY[0x24BEAEBB0];
  v51 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v144, &v143);
  v150[2] = v51;
  v149[3] = CFSTR("PerformThirdPartyScan");
  v141 = *v5;
  v142 = *v6;
  v50 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
  v150[3] = v50;
  v49 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v150, v149, 4);
  v152[0] = v49;
  v151[1] = CFSTR("CheckingForAvailableUpdate");
  v139[0] = CFSTR("UpdatesAvailable");
  v137[0] = *v4;
  v138[0] = CFSTR("UpdatesAvailable");
  v137[1] = *v5;
  v138[1] = CFSTR("ReportUpdatesAvailable");
  v48 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v138, v137, 2);
  v140[0] = v48;
  v139[1] = CFSTR("NoUpdateAvailable");
  v135[0] = *v4;
  v136[0] = CFSTR("NoUpdateFound");
  v135[1] = *v5;
  v136[1] = CFSTR("ReportNoUpdateFound");
  v47 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v136, v135, 2);
  v140[1] = v47;
  v139[2] = CFSTR("CheckingForUpdatesFailed");
  v133[0] = *v4;
  v134[0] = CFSTR("ScanFailed");
  v133[1] = *v5;
  v134[1] = CFSTR("ReportScanFailed");
  v46 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v134, v133, 2);
  v140[2] = v46;
  v139[3] = CFSTR("CheckForAvailableUpdate");
  v131 = *v5;
  v132 = *v6;
  v45 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
  v140[3] = v45;
  v139[4] = CFSTR("RefreshScanResults");
  v129 = *v5;
  v130 = *v6;
  v44 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
  v140[4] = v44;
  v139[5] = CFSTR("PerformThirdPartyScan");
  v127 = *v5;
  v128 = *v6;
  v43 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
  v140[5] = v43;
  v42 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v140, v139);
  v152[1] = v42;
  v151[2] = CFSTR("NoUpdateFound");
  v125[0] = CFSTR("CheckForAvailableUpdate");
  v123[0] = *v4;
  v124[0] = CFSTR("CheckingForAvailableUpdate");
  v123[1] = *v5;
  v124[1] = CFSTR("CheckForAvailableUpdate");
  v41 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v124, v123, 2);
  v126[0] = v41;
  v125[1] = CFSTR("RefreshScanResults");
  v121[0] = *v4;
  v122[0] = CFSTR("RefreshingScanResults");
  v121[1] = *v5;
  v122[1] = CFSTR("RefreshScanResults");
  v40 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v122, v121, 2);
  v126[1] = v40;
  v125[2] = CFSTR("PerformThirdPartyScan");
  v119 = *v4;
  v120 = CFSTR("PerformingThirdPartyScan");
  v39 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
  v126[2] = v39;
  v125[3] = CFSTR("UpdatesAvailable");
  v117[0] = *v4;
  v118[0] = CFSTR("UpdatesAvailable");
  v117[1] = *v5;
  v118[1] = CFSTR("ReportUpdatesAvailable");
  v38 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v118, v117, 2);
  v126[3] = v38;
  v125[4] = CFSTR("NoUpdateAvailable");
  v115[0] = *v4;
  v116[0] = CFSTR("NoUpdateFound");
  v115[1] = *v5;
  v116[1] = CFSTR("ReportNoUpdateFound");
  v37 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
  v126[4] = v37;
  v125[5] = CFSTR("CheckingForUpdatesFailed");
  v113[0] = *v4;
  v114[0] = CFSTR("ScanFailed");
  v113[1] = *v5;
  v114[1] = CFSTR("ReportScanFailed");
  v36 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
  v126[5] = v36;
  v35 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v126, v125, 6);
  v152[2] = v35;
  v151[3] = CFSTR("UpdatesAvailable");
  v111[0] = CFSTR("CheckForAvailableUpdate");
  v109[0] = *v4;
  v110[0] = CFSTR("CheckingForAvailableUpdate");
  v109[1] = *v5;
  v110[1] = CFSTR("CheckForAvailableUpdate");
  v34 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
  v112[0] = v34;
  v111[1] = CFSTR("RefreshScanResults");
  v107[0] = *v4;
  v108[0] = CFSTR("RefreshingScanResults");
  v107[1] = *v5;
  v108[1] = CFSTR("RefreshScanResults");
  v33 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
  v112[1] = v33;
  v111[2] = CFSTR("PerformThirdPartyScan");
  v105 = *v4;
  v106 = CFSTR("PerformingThirdPartyScan");
  v32 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
  v112[2] = v32;
  v111[3] = CFSTR("UpdatesAvailable");
  v103[0] = *v4;
  v104[0] = CFSTR("UpdatesAvailable");
  v103[1] = *v5;
  v104[1] = CFSTR("ReportUpdatesAvailable");
  v31 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
  v112[3] = v31;
  v111[4] = CFSTR("NoUpdateAvailable");
  v101[0] = *v4;
  v102[0] = CFSTR("NoUpdateFound");
  v101[1] = *v5;
  v102[1] = CFSTR("ReportNoUpdateFound");
  v30 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
  v112[4] = v30;
  v111[5] = CFSTR("CheckingForUpdatesFailed");
  v99[0] = *v4;
  v100[0] = CFSTR("ScanFailed");
  v99[1] = *v5;
  v100[1] = CFSTR("ReportScanFailed");
  v29 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v100, v99, 2);
  v112[5] = v29;
  v28 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v112, v111, 6);
  v152[3] = v28;
  v151[4] = CFSTR("ScanFailed");
  v97[0] = CFSTR("CheckForAvailableUpdate");
  v95[0] = *v4;
  v96[0] = CFSTR("CheckingForAvailableUpdate");
  v95[1] = *v5;
  v96[1] = CFSTR("CheckForAvailableUpdate");
  v27 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
  v98[0] = v27;
  v97[1] = CFSTR("RefreshScanResults");
  v93[0] = *v4;
  v94[0] = CFSTR("RefreshingScanResults");
  v93[1] = *v5;
  v94[1] = CFSTR("RefreshScanResults");
  v26 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
  v98[1] = v26;
  v97[2] = CFSTR("PerformThirdPartyScan");
  v91 = *v4;
  v92 = CFSTR("PerformingThirdPartyScan");
  v25 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
  v98[2] = v25;
  v97[3] = CFSTR("UpdatesAvailable");
  v89[0] = *v4;
  v90[0] = CFSTR("UpdatesAvailable");
  v89[1] = *v5;
  v90[1] = CFSTR("ReportUpdatesAvailable");
  v24 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
  v98[3] = v24;
  v97[4] = CFSTR("NoUpdateAvailable");
  v87[0] = *v4;
  v88[0] = CFSTR("NoUpdateFound");
  v87[1] = *v5;
  v88[1] = CFSTR("ReportNoUpdateFound");
  v23 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
  v98[4] = v23;
  v97[5] = CFSTR("CheckingForUpdatesFailed");
  v85[0] = *v4;
  v86[0] = CFSTR("ScanFailed");
  v85[1] = *v5;
  v86[1] = CFSTR("ReportScanFailed");
  v22 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
  v98[5] = v22;
  v21 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v98, v97, 6);
  v152[4] = v21;
  v151[5] = CFSTR("PerformingThirdPartyScan");
  v83[0] = CFSTR("CheckForAvailableUpdate");
  v81[0] = *v4;
  v82[0] = CFSTR("CheckingForAvailableUpdate");
  v81[1] = *v5;
  v82[1] = CFSTR("CheckForAvailableUpdate");
  v20 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
  v84[0] = v20;
  v83[1] = CFSTR("RefreshScanResults");
  v79[0] = *v4;
  v80[0] = CFSTR("RefreshingScanResults");
  v79[1] = *v5;
  v80[1] = CFSTR("RefreshScanResults");
  v19 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
  v84[1] = v19;
  v83[2] = CFSTR("UpdatesAvailable");
  v77[0] = *v4;
  v78[0] = CFSTR("UpdatesAvailable");
  v77[1] = *v5;
  v78[1] = CFSTR("ReportUpdatesAvailable");
  v18 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
  v84[2] = v18;
  v83[3] = CFSTR("NoUpdateAvailable");
  v75[0] = *v4;
  v76[0] = CFSTR("NoUpdateFound");
  v75[1] = *v5;
  v76[1] = CFSTR("ReportNoUpdateFound");
  v17 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
  v84[3] = v17;
  v83[4] = CFSTR("CheckingForUpdatesFailed");
  v73[0] = *v4;
  v74[0] = CFSTR("ScanFailed");
  v73[1] = *v5;
  v74[1] = CFSTR("ReportScanFailed");
  v16 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
  v84[4] = v16;
  v83[5] = CFSTR("PerformThirdPartyScan");
  v71 = *v5;
  v72 = *v6;
  v15 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
  v84[5] = v15;
  v14 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v84, v83, 6);
  v152[5] = v14;
  v151[6] = CFSTR("RefreshingScanResults");
  v69[0] = CFSTR("CheckForAvailableUpdate");
  v67[0] = *v4;
  v68[0] = CFSTR("CheckingForAvailableUpdate");
  v67[1] = *v5;
  v68[1] = CFSTR("CheckForAvailableUpdate");
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
  v70[0] = v13;
  v69[1] = CFSTR("UpdatesAvailable");
  v65[0] = *v4;
  v66[0] = CFSTR("UpdatesAvailable");
  v65[1] = *v5;
  v66[1] = CFSTR("ReportRefreshScanResults");
  v12 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
  v70[1] = v12;
  v69[2] = CFSTR("NoUpdateAvailable");
  v63[0] = *v4;
  v64[0] = CFSTR("NoUpdateFound");
  v63[1] = *v5;
  v64[1] = CFSTR("ReportRefreshScanResults");
  v11 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
  v70[2] = v11;
  v69[3] = CFSTR("PerformThirdPartyScan");
  v61[0] = *v4;
  v62[0] = CFSTR("PerformingThirdPartyScan");
  v61[1] = *v5;
  v62[1] = CFSTR("ThirdPartyScanDuringRefresh");
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
  v70[3] = v10;
  v69[4] = CFSTR("RefreshScanResultsFailed");
  v59 = *v5;
  v60 = CFSTR("ReportRefreshScanResultsFailed");
  v9 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
  v70[4] = v9;
  v69[5] = CFSTR("RefreshScanResults");
  v57 = *v5;
  v58 = *v6;
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v70[5] = v8;
  v7 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 6);
  v152[6] = v7;
  v56[0] = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v152, v151, 7);

  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  v55 = (id)objc_msgSend(v2, "initWithDictionary:copyItems:", v56[0], 1);
  v54 = v55;
  objc_storeStrong(&v55, 0);
  objc_storeStrong(v56, 0);
  return v54;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  SUSettingsStatefulUIManager *v9;
  NSObject *v15;
  SUCoreFSM *v16;
  int64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23[3];
  void *v24;
  void *v25;
  id *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id location[2];
  SUSettingsStatefulUIManager *v32;

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
  v27 = 0;
  objc_storeStrong(&v27, a7);
  v26 = a8;
  v16 = -[SUSettingsStatefulUIManager managerFSM](v32, "managerFSM");
  v15 = (id)-[SUCoreFSM extendedStateQueue](v16, "extendedStateQueue");
  dispatch_assert_queue_V2(v15);

  if (v27)
  {
    v25 = -[SUSettingsStatefulUIManager convertFSMStateToUIState:](v32, "convertFSMStateToUIState:", v27);
    if (v25 != (void *)0x7FFFFFFFFFFFFFFFLL
      && (void *)-[SUSettingsStatefulUIManager currentState](v32, "currentState") != v25)
    {
      v24 = -[SUSettingsStatefulUIManager currentState](v32, "currentState");
      -[SUSettingsStatefulUIManager setCurrentState:](v32, "setCurrentState:", v25);
      v9 = v32;
      v18 = MEMORY[0x24BDAC760];
      v19 = -1073741824;
      v20 = 0;
      v21 = __86__SUSettingsStatefulUIManager_performAction_onEvent_inState_withInfo_nextState_error___block_invoke;
      v22 = &unk_24DFF7B30;
      v23[0] = v32;
      v23[1] = v24;
      v23[2] = v25;
      -[SUSettingsStatefulUIManager executeOperationOnDelegate:usingBlock:](v9, "executeOperationOnDelegate:usingBlock:", sel_statefulUIManager_didTransitionFromUIState_toState_, &v18);
      objc_storeStrong(v23, 0);
    }
  }
  if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x24BEAEBB0]) & 1) != 0)
  {
    v17 = 0;
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("CheckForAvailableUpdate")) & 1) != 0)
  {
    v17 = -[SUSettingsStatefulUIManager action_CheckForAvailableUpdate:error:](v32, "action_CheckForAvailableUpdate:error:", v28, v26);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("ReportScanFailed")) & 1) != 0)
  {
    v17 = -[SUSettingsStatefulUIManager action_ReportScanFailed:error:](v32, "action_ReportScanFailed:error:", v28, v26);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("ReportUpdatesAvailable")) & 1) != 0)
  {
    v17 = -[SUSettingsStatefulUIManager action_ReportUpdatesAvailable:error:](v32, "action_ReportUpdatesAvailable:error:", v28, v26);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("ReportNoUpdateFound")) & 1) != 0)
  {
    v17 = -[SUSettingsStatefulUIManager action_ReportNoUpdateFound:error:](v32, "action_ReportNoUpdateFound:error:", v28, v26);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("RefreshScanResults")) & 1) != 0)
  {
    v17 = -[SUSettingsStatefulUIManager action_RefreshScanResults:error:](v32, "action_RefreshScanResults:error:", v28, v26);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("ReportRefreshScanResults")) & 1) != 0)
  {
    v17 = -[SUSettingsStatefulUIManager action_ReportRefreshScanResults:error:](v32, "action_ReportRefreshScanResults:error:", v28, v26);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("ReportRefreshScanResultsFailed")) & 1) != 0)
  {
    v17 = -[SUSettingsStatefulUIManager action_ReportRefreshScanResultsFailed:error:](v32, "action_ReportRefreshScanResultsFailed:error:", v28, v26);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("ThirdPartyScanDuringRefresh")) & 1) != 0)
  {
    v17 = -[SUSettingsStatefulUIManager action_ThirdPartyScanDuringRefresh:error:](v32, "action_ThirdPartyScanDuringRefresh:error:", v28, v26);
  }
  else
  {
    v17 = -[SUSettingsStatefulUIManager actionUnknownAction:error:](v32, "actionUnknownAction:error:", location[0], v26);
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
  return v17;
}

void __86__SUSettingsStatefulUIManager_performAction_onEvent_inState_withInfo_nextState_error___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManager:didTransitionFromUIState:toState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (int64_t)action_CheckForAvailableUpdate:(id)a3 error:(id *)a4
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  id v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  _Unwind_Exception *v15[18];
  uint8_t *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  const char *v37;
  id v38;
  id v39;
  id v40;
  int v41;
  const char *v42;
  id v43;
  const char *v44;
  int v45;
  const char *v46;
  int v47;
  id v48;
  int v49;
  const __CFString *v50;
  id v51;
  const __CFString *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  const __CFString *v65;
  id v66;
  const __CFString *v67;
  id v68;
  Class v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  os_log_t v77;
  os_log_type_t v78[4];
  unint64_t v79;
  id v80;
  id v81;
  id v82;
  _BOOL4 v83;
  id v84;
  id *v85;
  uint64_t *v86;
  id v87;
  _Unwind_Exception **v88;
  uint8_t *buf;
  id v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  const char *v110;
  id v111;
  id v112;
  id v113;
  int v114;
  const char *v115;
  id v116;
  const char *v117;
  int v118;
  const char *v119;
  int v120;
  id v121;
  int v122;
  const __CFString *v123;
  id v124;
  const __CFString *v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  const __CFString *v138;
  id v139;
  const __CFString *v140;
  id v141;
  Class aClass;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  uint64_t v148;
  id v149;
  os_log_t log;
  os_log_type_t v151[4];
  unint64_t v152;
  id v153;
  id v154;
  id v155;
  _BOOL4 v156;
  id obj;
  id v158;
  id v159;
  id v160;
  NSObject *v161;
  const char *v162;
  int v163;
  char v164;
  id v165;
  id v166;
  id v167;
  char v168;
  id v169;
  char v170;
  id v171;
  char v172;
  id v173;
  char v174;
  id v175;
  char v176;
  id v177;
  id v178;
  os_log_type_t v179;
  os_log_t v180;
  uint64_t v181;
  int v182;
  int v183;
  uint64_t (*v184)(uint64_t);
  void *v185;
  id v186;
  char v187;
  id v188;
  id v189;
  id v190;
  char v191;
  id v192;
  char v193;
  id v194;
  char v195;
  id v196;
  char v197;
  id v198;
  char v199;
  id v200;
  id v201;
  os_log_type_t type;
  os_log_t oslog[4];
  id location[2];
  id v205;
  int64_t v206;
  _BYTE v207[224];
  _BYTE v208[232];
  uint64_t v209;

  v161 = a4;
  v162 = "-[SUSettingsStatefulUIManager action_CheckForAvailableUpdate:error:]";
  v209 = *MEMORY[0x24BDAC8D0];
  v205 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog[3] = v161;
  v160 = (id)objc_msgSend(*((id *)v205 + 27), "extendedStateQueue");
  v159 = v160;
  dispatch_assert_queue_V2((dispatch_queue_t)v159);

  obj = *((id *)v205 + 27);
  objc_sync_enter(obj);
  v158 = (id)objc_msgSend(v205, "currentRefreshScanOperation");
  v4 = v158;
  v156 = v4 == 0;

  if (!v156)
  {
    v155 = (id)objc_msgSend(v205, "log");
    v153 = v155;
    v154 = (id)objc_msgSend(v153, "oslog");
    oslog[0] = (os_log_t)v154;

    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      log = oslog[0];
      *(_DWORD *)v151 = type;
      v152 = objc_msgSend(v205, "currentState");
      v149 = SUSettingsUIStateToString(v152);
      v146 = v149;
      v147 = v146;
      v201 = v147;
      v148 = objc_msgSend(v205, "currentState");
      v199 = 0;
      v197 = 0;
      v145 = (id)objc_msgSend(v205, "delegate");
      v144 = v145;
      if (v144)
      {
        v143 = (id)objc_msgSend(v205, "delegate");
        v200 = v143;
        v199 = 1;
        aClass = (Class)objc_opt_class();
        v141 = NSStringFromClass(aClass);
        v198 = v141;
        v197 = 1;
        v140 = (const __CFString *)v198;
      }
      else
      {
        v140 = CFSTR("(null)");
      }
      v138 = v140;
      v139 = (id)objc_msgSend(v205, "delegate");
      v136 = v139;
      v137 = (id)objc_msgSend(v205, "scanError");
      v134 = v137;
      v135 = (id)objc_msgSend(v205, "preferredStatefulDescriptor");
      v132 = v135;
      v133 = (id)objc_msgSend(v205, "alternateStatefulDescriptor");
      v130 = v133;
      v195 = 0;
      v193 = 0;
      v191 = 0;
      v131 = (id)objc_msgSend(v205, "currentDownload");
      v129 = v131;
      if (v129)
      {
        v128 = (id)objc_msgSend(v205, "currentDownload");
        v196 = v128;
        v195 = 1;
        v127 = (id)objc_msgSend(v196, "descriptor");
        v194 = v127;
        v193 = 1;
        v126 = (id)objc_msgSend(v194, "humanReadableUpdateName");
        v192 = v126;
        v191 = 1;
        v125 = (const __CFString *)v192;
      }
      else
      {
        v125 = CFSTR("(null)");
      }
      v123 = v125;
      v124 = (id)objc_msgSend(v205, "currentDownload");
      v121 = v124;
      v122 = objc_msgSend(v205, "performThirdPartyScan");
      v5 = "YES";
      if ((v122 & 1) == 0)
        v5 = "NO";
      v119 = v5;
      v120 = objc_msgSend(v205, "isTargetedUpdateScheduledForAutoInstall");
      v6 = "YES";
      if ((v120 & 1) == 0)
        v6 = "NO";
      v117 = v6;
      v118 = objc_msgSend(v205, "hidingPreferredDescriptor");
      v7 = "YES";
      if ((v118 & 1) == 0)
        v7 = "NO";
      v115 = v7;
      v116 = (id)objc_msgSend(*((id *)v205 + 32), "humanReadableUpdateName");
      v112 = v116;
      v113 = v112;
      v190 = v113;
      v114 = objc_msgSend(v205, "hidingAlternateDescriptor");
      v8 = "YES";
      if ((v114 & 1) == 0)
        v8 = "NO";
      v110 = v8;
      v111 = (id)objc_msgSend(*((id *)v205 + 33), "humanReadableUpdateName");
      v107 = v111;
      v108 = v107;
      v189 = v108;
      v187 = 0;
      v109 = (id)objc_msgSend(v205, "enrolledBetaProgram");
      v106 = v109;
      if (v106)
      {
        v105 = (id)objc_msgSend(v205, "enrolledBetaProgram");
        v188 = v105;
        v187 = 1;
        v104 = objc_msgSend(v188, "programID");
        v103 = v104;
      }
      else
      {
        v103 = 0;
      }
      v101 = v103;
      v102 = (id)objc_msgSend(v205, "betaPrograms");
      v99 = v102;
      v100 = objc_msgSend(v99, "count");
      v98 = (id)objc_msgSend(v205, "currentFullScanOperation");
      v96 = v98;
      v97 = (id)objc_msgSend(v205, "currentRefreshScanOperation");
      v94 = v97;
      v95 = (id)objc_msgSend(v205, "currentUpdateOperation");
      v92 = v95;
      v93 = (id)objc_msgSend(v205, "auxiliaryOperations");
      v90 = v93;
      v91 = objc_msgSend(v90, "count");
      v88 = v15;
      buf = v208;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v208, (uint64_t)v162, (uint64_t)v147, v148, (uint64_t)v138, (uint64_t)v136, (uint64_t)v134, (uint64_t)v132, (uint64_t)v130, (uint64_t)v123, (uint64_t)v121, (uint64_t)v119, (uint64_t)v117, (uint64_t)v115, (uint64_t)v113, (uint64_t)v110, (uint64_t)v108, v103, v100,
        (uint64_t)v96,
        (uint64_t)v94,
        (uint64_t)v92,
        v91);
      _os_log_impl(&dword_21BF33000, log, v151[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A refresh operation is currently running. Canceling it as we start a full-scan.",
        buf,
        0xDEu);

      if ((v187 & 1) != 0)
      if ((v191 & 1) != 0)

      if ((v193 & 1) != 0)
      if ((v195 & 1) != 0)

      if ((v197 & 1) != 0)
      if ((v199 & 1) != 0)

      objc_storeStrong(&v189, 0);
      objc_storeStrong(&v190, 0);
      objc_storeStrong(&v201, 0);
    }
    objc_storeStrong((id *)oslog, 0);
    v87 = (id)*((_QWORD *)v205 + 24);
    v86 = &v181;
    v181 = MEMORY[0x24BDAC760];
    v182 = -1073741824;
    v183 = 0;
    v184 = __68__SUSettingsStatefulUIManager_action_CheckForAvailableUpdate_error___block_invoke;
    v185 = &unk_24DFF7B58;
    v85 = &v186;
    v186 = v205;
    objc_msgSend(v87, "cancel:", v86);
    objc_storeStrong(v85, 0);
  }
  v84 = (id)objc_msgSend(v205, "currentFullScanOperation");
  v9 = v84;
  v83 = v9 == 0;

  if (v83)
  {
    v163 = 0;
  }
  else
  {
    v82 = (id)objc_msgSend(v205, "log");
    v80 = v82;
    v81 = (id)objc_msgSend(v80, "oslog");
    v180 = (os_log_t)v81;

    v179 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v180, OS_LOG_TYPE_DEFAULT))
    {
      v77 = v180;
      *(_DWORD *)v78 = v179;
      v79 = objc_msgSend(v205, "currentState");
      v76 = SUSettingsUIStateToString(v79);
      v73 = v76;
      v74 = v73;
      v178 = v74;
      v75 = objc_msgSend(v205, "currentState");
      v176 = 0;
      v174 = 0;
      v72 = (id)objc_msgSend(v205, "delegate");
      v71 = v72;
      if (v71)
      {
        v70 = (id)objc_msgSend(v205, "delegate");
        v177 = v70;
        v176 = 1;
        v69 = (Class)objc_opt_class();
        v68 = NSStringFromClass(v69);
        v175 = v68;
        v174 = 1;
        v67 = (const __CFString *)v175;
      }
      else
      {
        v67 = CFSTR("(null)");
      }
      v65 = v67;
      v66 = (id)objc_msgSend(v205, "delegate");
      v63 = v66;
      v64 = (id)objc_msgSend(v205, "scanError");
      v61 = v64;
      v62 = (id)objc_msgSend(v205, "preferredStatefulDescriptor");
      v59 = v62;
      v60 = (id)objc_msgSend(v205, "alternateStatefulDescriptor");
      v57 = v60;
      v172 = 0;
      v170 = 0;
      v168 = 0;
      v58 = (id)objc_msgSend(v205, "currentDownload");
      v56 = v58;
      if (v56)
      {
        v55 = (id)objc_msgSend(v205, "currentDownload");
        v173 = v55;
        v172 = 1;
        v54 = (id)objc_msgSend(v173, "descriptor");
        v171 = v54;
        v170 = 1;
        v53 = (id)objc_msgSend(v171, "humanReadableUpdateName");
        v169 = v53;
        v168 = 1;
        v52 = (const __CFString *)v169;
      }
      else
      {
        v52 = CFSTR("(null)");
      }
      v50 = v52;
      v51 = (id)objc_msgSend(v205, "currentDownload");
      v48 = v51;
      v49 = objc_msgSend(v205, "performThirdPartyScan");
      v10 = "YES";
      if ((v49 & 1) == 0)
        v10 = "NO";
      v46 = v10;
      v47 = objc_msgSend(v205, "isTargetedUpdateScheduledForAutoInstall");
      v11 = "YES";
      if ((v47 & 1) == 0)
        v11 = "NO";
      v44 = v11;
      v45 = objc_msgSend(v205, "hidingPreferredDescriptor");
      v12 = "YES";
      if ((v45 & 1) == 0)
        v12 = "NO";
      v42 = v12;
      v43 = (id)objc_msgSend(*((id *)v205 + 32), "humanReadableUpdateName");
      v39 = v43;
      v40 = v39;
      v167 = v40;
      v41 = objc_msgSend(v205, "hidingAlternateDescriptor");
      v13 = "YES";
      if ((v41 & 1) == 0)
        v13 = "NO";
      v37 = v13;
      v38 = (id)objc_msgSend(*((id *)v205 + 33), "humanReadableUpdateName");
      v34 = v38;
      v35 = v34;
      v166 = v35;
      v164 = 0;
      v36 = (id)objc_msgSend(v205, "enrolledBetaProgram");
      v33 = v36;
      if (v33)
      {
        v32 = (id)objc_msgSend(v205, "enrolledBetaProgram");
        v165 = v32;
        v164 = 1;
        v31 = objc_msgSend(v165, "programID");
        v30 = v31;
      }
      else
      {
        v30 = 0;
      }
      v28 = v30;
      v29 = (id)objc_msgSend(v205, "betaPrograms");
      v26 = v29;
      v27 = objc_msgSend(v26, "count");
      v25 = (id)objc_msgSend(v205, "currentFullScanOperation");
      v23 = v25;
      v24 = (id)objc_msgSend(v205, "currentRefreshScanOperation");
      v21 = v24;
      v22 = (id)objc_msgSend(v205, "currentUpdateOperation");
      v19 = v22;
      v20 = (id)objc_msgSend(v205, "auxiliaryOperations");
      v17 = v20;
      v18 = objc_msgSend(v17, "count");
      v15[17] = (_Unwind_Exception *)v15;
      v16 = v207;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v207, (uint64_t)v162, (uint64_t)v74, v75, (uint64_t)v65, (uint64_t)v63, (uint64_t)v61, (uint64_t)v59, (uint64_t)v57, (uint64_t)v50, (uint64_t)v48, (uint64_t)v46, (uint64_t)v44, (uint64_t)v42, (uint64_t)v40, (uint64_t)v37, (uint64_t)v35, v28, v27,
        (uint64_t)v23,
        (uint64_t)v21,
        (uint64_t)v19,
        v18);
      _os_log_impl(&dword_21BF33000, v77, v78[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A full-scan operation is already running. Skipping on this full-scan request.",
        v16,
        0xDEu);

      if ((v164 & 1) != 0)
      if ((v168 & 1) != 0)

      if ((v170 & 1) != 0)
      if ((v172 & 1) != 0)

      if ((v174 & 1) != 0)
      if ((v176 & 1) != 0)

      objc_storeStrong(&v166, 0);
      objc_storeStrong(&v167, 0);
      objc_storeStrong(&v178, 0);
    }
    objc_storeStrong((id *)&v180, 0);
    v206 = 0;
    v163 = 1;
  }
  objc_sync_exit(obj);

  if (!v163)
  {
    objc_msgSend(v205, "performFullScan:", location[0]);
    v206 = 0;
    v163 = 1;
  }
  objc_storeStrong(location, 0);
  return v206;
}

uint64_t __68__SUSettingsStatefulUIManager_action_CheckForAvailableUpdate_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentRefreshScanOperation:", 0, a1, a1);
}

- (int64_t)action_ReportUpdatesAvailable:(id)a3 error:(id *)a4
{
  objc_class *v4;
  char v5;
  const char *v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  id WeakRetained;
  uint64_t v15;
  id v16;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v19;
  id *v20;
  id *v21;
  id v22;
  id v23;
  int v24;
  _BOOL4 v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint8_t *buf;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  const __CFString *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  id v56;
  const char *v57;
  const char *v58;
  uint64_t v59;
  id v60;
  id v61;
  int v62;
  id v63;
  int v64;
  const __CFString *v65;
  const __CFString *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  int v72;
  const __CFString *v73;
  os_log_t log;
  os_log_type_t v75[4];
  id v76;
  id v77;
  uint64_t v78;
  id v79;
  id v80;
  const char *v81;
  NSObject *v82;
  id v83;
  uint64_t v84;
  int v85;
  int v86;
  void (*v87)(uint64_t);
  void *v88;
  _QWORD v89[2];
  id v90;
  id v91;
  char v92;
  id v93;
  id v94;
  id v95;
  char v96;
  id v97;
  char v98;
  id v99;
  char v100;
  id v101;
  char v102;
  id v103;
  char v104;
  id v105;
  id v106;
  os_log_type_t type;
  os_log_t oslog[2];
  id location[2];
  id v110;
  _BYTE v111[264];
  uint64_t v112;

  v82 = a4;
  v81 = "-[SUSettingsStatefulUIManager action_ReportUpdatesAvailable:error:]";
  v112 = *MEMORY[0x24BDAC8D0];
  v110 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog[1] = v82;
  v83 = (id)objc_msgSend(*((id *)v110 + 27), "extendedStateQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v83);

  v80 = (id)objc_msgSend(v110, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v80, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v75 = type;
    v76 = SUSettingsUIStateToString(objc_msgSend(v110, "currentState"));
    v77 = v76;
    v106 = v77;
    v78 = objc_msgSend(v110, "currentState");
    v79 = (id)objc_msgSend(v110, "delegate");
    v104 = 0;
    v102 = 0;
    if (v79)
    {
      v105 = (id)objc_msgSend(v110, "delegate");
      v72 = 1;
      v104 = 1;
      v4 = (objc_class *)objc_opt_class();
      v103 = NSStringFromClass(v4);
      v102 = 1;
      v73 = (const __CFString *)v103;
    }
    else
    {
      v73 = CFSTR("(null)");
    }
    v66 = v73;
    v67 = (id)objc_msgSend(v110, "delegate");
    v68 = (id)objc_msgSend(v110, "scanError");
    v69 = (id)objc_msgSend(v110, "preferredStatefulDescriptor");
    v70 = (id)objc_msgSend(v110, "alternateStatefulDescriptor");
    v71 = (id)objc_msgSend(v110, "currentDownload");
    v100 = 0;
    v98 = 0;
    v96 = 0;
    if (v71)
    {
      v101 = (id)objc_msgSend(v110, "currentDownload");
      v64 = 1;
      v100 = 1;
      v99 = (id)objc_msgSend(v101, "descriptor");
      v98 = 1;
      v97 = (id)objc_msgSend(v99, "humanReadableUpdateName");
      v96 = 1;
      v65 = (const __CFString *)v97;
    }
    else
    {
      v65 = CFSTR("(null)");
    }
    v50 = v65;
    v51 = (id)objc_msgSend(v110, "currentDownload");
    v5 = objc_msgSend(v110, "performThirdPartyScan");
    v57 = "NO";
    v6 = "YES";
    v58 = "YES";
    v62 = 1;
    if ((v5 & 1) == 0)
      v6 = "NO";
    v52 = v6;
    v7 = objc_msgSend(v110, "isTargetedUpdateScheduledForAutoInstall");
    v8 = (uint64_t)v58;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v57;
    v53 = v8;
    v9 = objc_msgSend(v110, "hidingPreferredDescriptor");
    v10 = (uint64_t)v58;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v57;
    v54 = v10;
    v55 = (id)objc_msgSend(*((id *)v110 + 32), "humanReadableUpdateName");
    v56 = v55;
    v95 = v56;
    v11 = objc_msgSend(v110, "hidingAlternateDescriptor");
    v12 = (uint64_t)v58;
    if ((v11 & 1) == 0)
      v12 = (uint64_t)v57;
    v59 = v12;
    v60 = (id)objc_msgSend(*((id *)v110 + 33), "humanReadableUpdateName");
    v61 = v60;
    v94 = v61;
    v63 = (id)objc_msgSend(v110, "enrolledBetaProgram");
    v92 = 0;
    if (v63)
    {
      v93 = (id)objc_msgSend(v110, "enrolledBetaProgram");
      v92 = 1;
      v49 = objc_msgSend(v93, "programID");
    }
    else
    {
      v49 = 0;
    }
    v27 = v49;
    v48 = (id)objc_msgSend(v110, "betaPrograms");
    v28 = objc_msgSend(v48, "count");
    v47 = (id)objc_msgSend(v110, "currentFullScanOperation");
    v46 = (id)objc_msgSend(v110, "currentRefreshScanOperation");
    v45 = (id)objc_msgSend(v110, "currentUpdateOperation");
    v44 = (id)objc_msgSend(v110, "auxiliaryOperations");
    v29 = objc_msgSend(v44, "count");
    v43 = (id)objc_msgSend(location[0], "fullScanResults");
    v42 = (id)objc_msgSend(v43, "preferredDescriptor");
    v41 = (id)objc_msgSend(v42, "humanReadableUpdateName");
    v30 = v41;
    v91 = v30;
    v40 = (id)objc_msgSend(location[0], "fullScanResults");
    v39 = (id)objc_msgSend(v40, "preferredDescriptor");
    v38 = (id)objc_msgSend(location[0], "fullScanResults");
    v37 = (id)objc_msgSend(v38, "alternateDescriptor");
    v36 = (id)objc_msgSend(v37, "humanReadableUpdateName");
    v31 = v36;
    v90 = v31;
    v35 = (id)objc_msgSend(location[0], "fullScanResults");
    v34 = (id)objc_msgSend(v35, "alternateDescriptor");
    v32 = &v15;
    buf = v111;
    __os_log_helper_16_2_26_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_66_8_0((uint64_t)v111, (uint64_t)v81, (uint64_t)v77, v78, (uint64_t)v66, (uint64_t)v67, (uint64_t)v68, (uint64_t)v69, (uint64_t)v70, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, v53, v54, (uint64_t)v56, v59, (uint64_t)v61, v49, v28,
      (uint64_t)v47,
      (uint64_t)v46,
      (uint64_t)v45,
      v29,
      (uint64_t)v30,
      (uint64_t)v39,
      (uint64_t)v31,
      (uint64_t)v34);
    _os_log_impl(&dword_21BF33000, log, v75[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Reporting on available updates:\n"
      "\tPreferred update: %{public}@ (%p)\n"
      "\tAlternate update: %{public}@ (%p)",
      buf,
      0x106u);

    if ((v92 & 1) != 0)
    if ((v96 & 1) != 0)

    if ((v98 & 1) != 0)
    if ((v100 & 1) != 0)

    if ((v102 & 1) != 0)
    if ((v104 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v90, 0);
    objc_storeStrong(&v91, obj);
    objc_storeStrong(&v94, obj);
    objc_storeStrong(&v95, obj);
    objc_storeStrong(&v106, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  WeakRetained = objc_loadWeakRetained((id *)v110 + 4);
  v25 = WeakRetained == 0;

  if (!v25)
  {
    v23 = objc_loadWeakRetained((id *)v110 + 4);
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      v19 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      queue = (dispatch_queue_t)(id)objc_msgSend(v19, "selectDelegateCallbackQueue:", *((_QWORD *)v110 + 5));
      block = &v84;
      v84 = MEMORY[0x24BDAC760];
      v85 = -1073741824;
      v86 = 0;
      v87 = __67__SUSettingsStatefulUIManager_action_ReportUpdatesAvailable_error___block_invoke;
      v88 = &unk_24DFF7B80;
      v21 = (id *)v89;
      v89[0] = v110;
      v20 = (id *)((char *)block + 40);
      v89[1] = location[0];
      dispatch_async(queue, block);

      v22 = 0;
      objc_storeStrong(v20, 0);
      objc_storeStrong(v21, v22);
    }
  }
  v16 = 0;
  objc_storeStrong((id *)v110 + 23, 0);
  objc_storeStrong((id *)v110 + 24, v16);
  objc_msgSend(v110, "setPerformThirdPartyScan:", 0);
  objc_storeStrong(location, v16);
  return 0;
}

void __67__SUSettingsStatefulUIManager_action_ReportUpdatesAvailable_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "fullScanResults");
  objc_msgSend(WeakRetained, "statefulUIManager:didFinishScanningForUpdatesWithResults:", v2);

}

- (int64_t)action_ReportNoUpdateFound:(id)a3 error:(id *)a4
{
  objc_class *v4;
  char v5;
  const char *v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  id WeakRetained;
  uint64_t v15;
  id v16;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v19;
  id *v20;
  id *v21;
  id v22;
  id v23;
  int v24;
  _BOOL4 v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint8_t *buf;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  id v47;
  id v48;
  int v49;
  id v50;
  int v51;
  const __CFString *v52;
  const __CFString *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  int v59;
  const __CFString *v60;
  os_log_t log;
  os_log_type_t v62[4];
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  const char *v68;
  NSObject *v69;
  id v70;
  uint64_t v71;
  int v72;
  int v73;
  void (*v74)(uint64_t);
  void *v75;
  _QWORD v76[2];
  char v77;
  id v78;
  id v79;
  id v80;
  char v81;
  id v82;
  char v83;
  id v84;
  char v85;
  id v86;
  char v87;
  id v88;
  char v89;
  id v90;
  id v91;
  os_log_type_t type;
  os_log_t oslog[2];
  id location[2];
  id v95;
  _BYTE v96[232];
  uint64_t v97;

  v69 = a4;
  v68 = "-[SUSettingsStatefulUIManager action_ReportNoUpdateFound:error:]";
  v97 = *MEMORY[0x24BDAC8D0];
  v95 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog[1] = v69;
  v70 = (id)objc_msgSend(*((id *)v95 + 27), "extendedStateQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v70);

  v67 = (id)objc_msgSend(v95, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v67, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v62 = type;
    v63 = SUSettingsUIStateToString(objc_msgSend(v95, "currentState"));
    v64 = v63;
    v91 = v64;
    v65 = objc_msgSend(v95, "currentState");
    v66 = (id)objc_msgSend(v95, "delegate");
    v89 = 0;
    v87 = 0;
    if (v66)
    {
      v90 = (id)objc_msgSend(v95, "delegate");
      v59 = 1;
      v89 = 1;
      v4 = (objc_class *)objc_opt_class();
      v88 = NSStringFromClass(v4);
      v87 = 1;
      v60 = (const __CFString *)v88;
    }
    else
    {
      v60 = CFSTR("(null)");
    }
    v53 = v60;
    v54 = (id)objc_msgSend(v95, "delegate");
    v55 = (id)objc_msgSend(v95, "scanError");
    v56 = (id)objc_msgSend(v95, "preferredStatefulDescriptor");
    v57 = (id)objc_msgSend(v95, "alternateStatefulDescriptor");
    v58 = (id)objc_msgSend(v95, "currentDownload");
    v85 = 0;
    v83 = 0;
    v81 = 0;
    if (v58)
    {
      v86 = (id)objc_msgSend(v95, "currentDownload");
      v51 = 1;
      v85 = 1;
      v84 = (id)objc_msgSend(v86, "descriptor");
      v83 = 1;
      v82 = (id)objc_msgSend(v84, "humanReadableUpdateName");
      v81 = 1;
      v52 = (const __CFString *)v82;
    }
    else
    {
      v52 = CFSTR("(null)");
    }
    v37 = v52;
    v38 = (id)objc_msgSend(v95, "currentDownload");
    v5 = objc_msgSend(v95, "performThirdPartyScan");
    v44 = "NO";
    v6 = "YES";
    v45 = "YES";
    v49 = 1;
    if ((v5 & 1) == 0)
      v6 = "NO";
    v39 = v6;
    v7 = objc_msgSend(v95, "isTargetedUpdateScheduledForAutoInstall");
    v8 = (uint64_t)v45;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v44;
    v40 = v8;
    v9 = objc_msgSend(v95, "hidingPreferredDescriptor");
    v10 = (uint64_t)v45;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v44;
    v41 = v10;
    v42 = (id)objc_msgSend(*((id *)v95 + 32), "humanReadableUpdateName");
    v43 = v42;
    v80 = v43;
    v11 = objc_msgSend(v95, "hidingAlternateDescriptor");
    v12 = (uint64_t)v45;
    if ((v11 & 1) == 0)
      v12 = (uint64_t)v44;
    v46 = v12;
    v47 = (id)objc_msgSend(*((id *)v95 + 33), "humanReadableUpdateName");
    v48 = v47;
    v79 = v48;
    v50 = (id)objc_msgSend(v95, "enrolledBetaProgram");
    v77 = 0;
    if (v50)
    {
      v78 = (id)objc_msgSend(v95, "enrolledBetaProgram");
      v77 = 1;
      v36 = objc_msgSend(v78, "programID");
    }
    else
    {
      v36 = 0;
    }
    v27 = v36;
    v35 = (id)objc_msgSend(v95, "betaPrograms");
    v28 = objc_msgSend(v35, "count");
    v34 = (id)objc_msgSend(v95, "currentFullScanOperation");
    v33 = (id)objc_msgSend(v95, "currentRefreshScanOperation");
    v32 = (id)objc_msgSend(v95, "currentUpdateOperation");
    v31 = (id)objc_msgSend(v95, "auxiliaryOperations");
    v29 = &v15;
    buf = v96;
    __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v96, (uint64_t)v68, (uint64_t)v64, v65, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v43, v46, (uint64_t)v48, v36, v28,
      (uint64_t)v34,
      (uint64_t)v33,
      (uint64_t)v32,
      objc_msgSend(v31, "count"));
    _os_log_impl(&dword_21BF33000, log, v62[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n",
      buf,
      0xDEu);

    if ((v77 & 1) != 0)
    if ((v81 & 1) != 0)

    if ((v83 & 1) != 0)
    if ((v85 & 1) != 0)

    if ((v87 & 1) != 0)
    if ((v89 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v80, obj);
    objc_storeStrong(&v91, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  WeakRetained = objc_loadWeakRetained((id *)v95 + 4);
  v25 = WeakRetained == 0;

  if (!v25)
  {
    v23 = objc_loadWeakRetained((id *)v95 + 4);
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      v19 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      queue = (dispatch_queue_t)(id)objc_msgSend(v19, "selectDelegateCallbackQueue:", *((_QWORD *)v95 + 5));
      block = &v71;
      v71 = MEMORY[0x24BDAC760];
      v72 = -1073741824;
      v73 = 0;
      v74 = __64__SUSettingsStatefulUIManager_action_ReportNoUpdateFound_error___block_invoke;
      v75 = &unk_24DFF7B80;
      v21 = (id *)v76;
      v76[0] = v95;
      v20 = (id *)((char *)block + 40);
      v76[1] = location[0];
      dispatch_async(queue, block);

      v22 = 0;
      objc_storeStrong(v20, 0);
      objc_storeStrong(v21, v22);
    }
  }
  v16 = 0;
  objc_storeStrong((id *)v95 + 23, 0);
  objc_storeStrong((id *)v95 + 24, v16);
  objc_msgSend(v95, "setPerformThirdPartyScan:", 0);
  objc_storeStrong(location, v16);
  return 0;
}

void __64__SUSettingsStatefulUIManager_action_ReportNoUpdateFound_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "fullScanResults");
  objc_msgSend(WeakRetained, "statefulUIManager:didFinishScanningForUpdatesWithResults:", v2);

}

- (int64_t)action_ReportScanFailed:(id)a3 error:(id *)a4
{
  objc_class *v4;
  char v5;
  const char *v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  id WeakRetained;
  uint64_t v15;
  id v16;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v19;
  id *v20;
  id *v21;
  id v22;
  id v23;
  int v24;
  _BOOL4 v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint8_t *buf;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  id v47;
  id v48;
  int v49;
  id v50;
  int v51;
  const __CFString *v52;
  const __CFString *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  int v59;
  const __CFString *v60;
  os_log_t log;
  os_log_type_t v62[4];
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  const char *v68;
  NSObject *v69;
  id v70;
  uint64_t v71;
  int v72;
  int v73;
  void (*v74)(uint64_t);
  void *v75;
  _QWORD v76[2];
  char v77;
  id v78;
  id v79;
  id v80;
  char v81;
  id v82;
  char v83;
  id v84;
  char v85;
  id v86;
  char v87;
  id v88;
  char v89;
  id v90;
  id v91;
  os_log_type_t type;
  os_log_t oslog[2];
  id location[2];
  id v95;
  _BYTE v96[232];
  uint64_t v97;

  v69 = a4;
  v68 = "-[SUSettingsStatefulUIManager action_ReportScanFailed:error:]";
  v97 = *MEMORY[0x24BDAC8D0];
  v95 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog[1] = v69;
  v70 = (id)objc_msgSend(*((id *)v95 + 27), "extendedStateQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v70);

  v67 = (id)objc_msgSend(v95, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v67, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v62 = type;
    v63 = SUSettingsUIStateToString(objc_msgSend(v95, "currentState"));
    v64 = v63;
    v91 = v64;
    v65 = objc_msgSend(v95, "currentState");
    v66 = (id)objc_msgSend(v95, "delegate");
    v89 = 0;
    v87 = 0;
    if (v66)
    {
      v90 = (id)objc_msgSend(v95, "delegate");
      v59 = 1;
      v89 = 1;
      v4 = (objc_class *)objc_opt_class();
      v88 = NSStringFromClass(v4);
      v87 = 1;
      v60 = (const __CFString *)v88;
    }
    else
    {
      v60 = CFSTR("(null)");
    }
    v53 = v60;
    v54 = (id)objc_msgSend(v95, "delegate");
    v55 = (id)objc_msgSend(v95, "scanError");
    v56 = (id)objc_msgSend(v95, "preferredStatefulDescriptor");
    v57 = (id)objc_msgSend(v95, "alternateStatefulDescriptor");
    v58 = (id)objc_msgSend(v95, "currentDownload");
    v85 = 0;
    v83 = 0;
    v81 = 0;
    if (v58)
    {
      v86 = (id)objc_msgSend(v95, "currentDownload");
      v51 = 1;
      v85 = 1;
      v84 = (id)objc_msgSend(v86, "descriptor");
      v83 = 1;
      v82 = (id)objc_msgSend(v84, "humanReadableUpdateName");
      v81 = 1;
      v52 = (const __CFString *)v82;
    }
    else
    {
      v52 = CFSTR("(null)");
    }
    v37 = v52;
    v38 = (id)objc_msgSend(v95, "currentDownload");
    v5 = objc_msgSend(v95, "performThirdPartyScan");
    v44 = "NO";
    v6 = "YES";
    v45 = "YES";
    v49 = 1;
    if ((v5 & 1) == 0)
      v6 = "NO";
    v39 = v6;
    v7 = objc_msgSend(v95, "isTargetedUpdateScheduledForAutoInstall");
    v8 = (uint64_t)v45;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v44;
    v40 = v8;
    v9 = objc_msgSend(v95, "hidingPreferredDescriptor");
    v10 = (uint64_t)v45;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v44;
    v41 = v10;
    v42 = (id)objc_msgSend(*((id *)v95 + 32), "humanReadableUpdateName");
    v43 = v42;
    v80 = v43;
    v11 = objc_msgSend(v95, "hidingAlternateDescriptor");
    v12 = (uint64_t)v45;
    if ((v11 & 1) == 0)
      v12 = (uint64_t)v44;
    v46 = v12;
    v47 = (id)objc_msgSend(*((id *)v95 + 33), "humanReadableUpdateName");
    v48 = v47;
    v79 = v48;
    v50 = (id)objc_msgSend(v95, "enrolledBetaProgram");
    v77 = 0;
    if (v50)
    {
      v78 = (id)objc_msgSend(v95, "enrolledBetaProgram");
      v77 = 1;
      v36 = objc_msgSend(v78, "programID");
    }
    else
    {
      v36 = 0;
    }
    v27 = v36;
    v35 = (id)objc_msgSend(v95, "betaPrograms");
    v28 = objc_msgSend(v35, "count");
    v34 = (id)objc_msgSend(v95, "currentFullScanOperation");
    v33 = (id)objc_msgSend(v95, "currentRefreshScanOperation");
    v32 = (id)objc_msgSend(v95, "currentUpdateOperation");
    v31 = (id)objc_msgSend(v95, "auxiliaryOperations");
    v29 = &v15;
    buf = v96;
    __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v96, (uint64_t)v68, (uint64_t)v64, v65, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v43, v46, (uint64_t)v48, v36, v28,
      (uint64_t)v34,
      (uint64_t)v33,
      (uint64_t)v32,
      objc_msgSend(v31, "count"));
    _os_log_impl(&dword_21BF33000, log, v62[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n",
      buf,
      0xDEu);

    if ((v77 & 1) != 0)
    if ((v81 & 1) != 0)

    if ((v83 & 1) != 0)
    if ((v85 & 1) != 0)

    if ((v87 & 1) != 0)
    if ((v89 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v80, obj);
    objc_storeStrong(&v91, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  WeakRetained = objc_loadWeakRetained((id *)v95 + 4);
  v25 = WeakRetained == 0;

  if (!v25)
  {
    v23 = objc_loadWeakRetained((id *)v95 + 4);
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      v19 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      queue = (dispatch_queue_t)(id)objc_msgSend(v19, "selectDelegateCallbackQueue:", *((_QWORD *)v95 + 5));
      block = &v71;
      v71 = MEMORY[0x24BDAC760];
      v72 = -1073741824;
      v73 = 0;
      v74 = __61__SUSettingsStatefulUIManager_action_ReportScanFailed_error___block_invoke;
      v75 = &unk_24DFF7B80;
      v21 = (id *)v76;
      v76[0] = v95;
      v20 = (id *)((char *)block + 40);
      v76[1] = location[0];
      dispatch_async(queue, block);

      v22 = 0;
      objc_storeStrong(v20, 0);
      objc_storeStrong(v21, v22);
    }
  }
  v16 = 0;
  objc_storeStrong((id *)v95 + 23, 0);
  objc_storeStrong((id *)v95 + 24, v16);
  objc_msgSend(v95, "setPerformThirdPartyScan:", 0);
  objc_storeStrong(location, v16);
  return 0;
}

void __61__SUSettingsStatefulUIManager_action_ReportScanFailed_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "error");
  objc_msgSend(WeakRetained, "statefulUIManager:didFailToScanForUpdatesWithError:", v2);

}

- (int64_t)action_RefreshScanResults:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  id *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  id v12;
  const __CFString *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  id v17;
  id *v18;
  const char *v19;
  id v20;
  char *v21;
  void *v22;
  id v23;
  char *v24;
  void *v25;
  void *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  void *v31;
  char *v32;
  char *v33;
  _Unwind_Exception *v35[18];
  uint8_t *v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  const char *v57;
  id v58;
  id v59;
  id v60;
  int v61;
  const char *v62;
  id v63;
  const char *v64;
  int v65;
  const char *v66;
  int v67;
  id v68;
  int v69;
  const __CFString *v70;
  id v71;
  const __CFString *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  const __CFString *v85;
  id v86;
  const __CFString *v87;
  id v88;
  Class v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  uint64_t v95;
  id v96;
  os_log_t v97;
  os_log_type_t v98[4];
  unint64_t v99;
  id v100;
  id v101;
  id v102;
  _Unwind_Exception **v103;
  uint8_t *buf;
  id v105;
  uint64_t v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  id v121;
  id v122;
  uint64_t v123;
  id v124;
  const char *v125;
  id v126;
  id v127;
  uint64_t v128;
  int v129;
  const char *v130;
  id v131;
  const char *v132;
  int v133;
  const char *v134;
  int v135;
  id v136;
  int v137;
  const __CFString *v138;
  id v139;
  const __CFString *v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  id v152;
  const __CFString *v153;
  id v154;
  const __CFString *v155;
  id v156;
  Class aClass;
  id v158;
  id v159;
  id v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  id v164;
  os_log_t log;
  os_log_type_t v166[4];
  unint64_t v167;
  id v168;
  id v169;
  id v170;
  id obj;
  id v172;
  id v173;
  char *v174;
  id *v175;
  const char *v176;
  char v177;
  id v178;
  id v179;
  id v180;
  char v181;
  id v182;
  char v183;
  id v184;
  char v185;
  id v186;
  char v187;
  id v188;
  char v189;
  id v190;
  id v191;
  os_log_type_t v192;
  os_log_t oslog;
  char v194;
  char v195;
  id v196;
  id v197;
  char v198;
  char v199;
  char v200;
  char v201;
  char v202;
  id v203;
  os_log_type_t type;
  id v205[2];
  id location[2];
  SUSettingsStatefulUIManager *v207;
  _BYTE v208[224];
  _BYTE v209[232];
  uint64_t v210;

  v174 = &v194;
  v175 = a4;
  v176 = "-[SUSettingsStatefulUIManager action_RefreshScanResults:error:]";
  v210 = *MEMORY[0x24BDAC8D0];
  v207 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v205[1] = v175;
  v173 = (id)-[SUCoreFSM extendedStateQueue](v207->_managerFSM, "extendedStateQueue");
  v172 = v173;
  dispatch_assert_queue_V2((dispatch_queue_t)v172);

  obj = v207->_managerFSM;
  objc_sync_enter(obj);
  if (v207->_currentRefreshScanOperation)
  {
    v170 = (id)objc_msgSend(*((id *)v174 + 21), "log");
    v168 = v170;
    v169 = (id)objc_msgSend(v168, "oslog");
    v4 = v169;
    v5 = v168;
    *((_QWORD *)v174 + 17) = v4;

    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(*((os_log_t *)v174 + 17), OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_t)*((_QWORD *)v174 + 17);
      *(_DWORD *)v166 = type;
      v167 = objc_msgSend(*((id *)v174 + 21), "currentState");
      v164 = SUSettingsUIStateToString(v167);
      v161 = v164;
      v6 = v161;
      v7 = (id *)v174;
      v162 = (uint64_t)v6;
      *((_QWORD *)v174 + 14) = v6;
      v163 = objc_msgSend(v7[21], "currentState");
      v8 = (void *)*((_QWORD *)v174 + 21);
      v202 = 0;
      v201 = 0;
      v160 = (id)objc_msgSend(v8, "delegate");
      v159 = v160;
      if (v159)
      {
        v158 = (id)objc_msgSend(*((id *)v174 + 21), "delegate");
        *((_QWORD *)v174 + 13) = v158;
        v202 = 1;
        aClass = (Class)objc_opt_class();
        v156 = NSStringFromClass(aClass);
        v9 = (const __CFString *)v156;
        *((_QWORD *)v174 + 11) = v9;
        v201 = 1;
        v155 = v9;
      }
      else
      {
        v155 = CFSTR("(null)");
      }
      v153 = v155;
      v154 = (id)objc_msgSend(*((id *)v174 + 21), "delegate");
      v151 = v154;
      v152 = (id)objc_msgSend(*((id *)v174 + 21), "scanError");
      v149 = v152;
      v150 = (id)objc_msgSend(*((id *)v174 + 21), "preferredStatefulDescriptor");
      v147 = v150;
      v148 = (id)objc_msgSend(*((id *)v174 + 21), "alternateStatefulDescriptor");
      v145 = v148;
      v10 = (void *)*((_QWORD *)v174 + 21);
      v200 = 0;
      v199 = 0;
      v198 = 0;
      v146 = (id)objc_msgSend(v10, "currentDownload");
      v144 = v146;
      if (v144)
      {
        v143 = (id)objc_msgSend(*((id *)v174 + 21), "currentDownload");
        v11 = v143;
        *((_QWORD *)v174 + 9) = v11;
        v200 = 1;
        v142 = (id)objc_msgSend(v11, "descriptor");
        v12 = v142;
        *((_QWORD *)v174 + 7) = v12;
        v199 = 1;
        v141 = (id)objc_msgSend(v12, "humanReadableUpdateName");
        v13 = (const __CFString *)v141;
        *((_QWORD *)v174 + 5) = v13;
        v198 = 1;
        v140 = v13;
      }
      else
      {
        v140 = CFSTR("(null)");
      }
      v138 = v140;
      v139 = (id)objc_msgSend(*((id *)v174 + 21), "currentDownload");
      v136 = v139;
      v137 = objc_msgSend(*((id *)v174 + 21), "performThirdPartyScan");
      v14 = "YES";
      if ((v137 & 1) == 0)
        v14 = "NO";
      v134 = v14;
      v135 = objc_msgSend(*((id *)v174 + 21), "isTargetedUpdateScheduledForAutoInstall");
      v15 = "YES";
      if ((v135 & 1) == 0)
        v15 = "NO";
      v132 = v15;
      v133 = objc_msgSend(*((id *)v174 + 21), "hidingPreferredDescriptor");
      v16 = "YES";
      if ((v133 & 1) == 0)
        v16 = "NO";
      v130 = v16;
      v131 = (id)objc_msgSend(*(id *)(*((_QWORD *)v174 + 21) + 256), "humanReadableUpdateName");
      v127 = v131;
      v17 = v127;
      v18 = (id *)v174;
      v128 = (uint64_t)v17;
      *((_QWORD *)v174 + 3) = v17;
      v129 = objc_msgSend(v18[21], "hidingAlternateDescriptor");
      v19 = "YES";
      if ((v129 & 1) == 0)
        v19 = "NO";
      v125 = v19;
      v126 = (id)objc_msgSend(*(id *)(*((_QWORD *)v174 + 21) + 264), "humanReadableUpdateName");
      v122 = v126;
      v20 = v122;
      v21 = v174;
      v123 = (uint64_t)v20;
      *((_QWORD *)v174 + 2) = v20;
      v22 = (void *)*((_QWORD *)v21 + 21);
      v195 = 0;
      v124 = (id)objc_msgSend(v22, "enrolledBetaProgram");
      v121 = v124;
      if (v121)
      {
        v120 = (id)objc_msgSend(*((id *)v174 + 21), "enrolledBetaProgram");
        v23 = v120;
        *((_QWORD *)v174 + 1) = v23;
        v195 = 1;
        v119 = objc_msgSend(v23, "programID");
        v118 = v119;
      }
      else
      {
        v118 = 0;
      }
      v116 = v118;
      v117 = (id)objc_msgSend(*((id *)v174 + 21), "betaPrograms");
      v114 = v117;
      v115 = objc_msgSend(v114, "count");
      v113 = (id)objc_msgSend(*((id *)v174 + 21), "currentFullScanOperation");
      v111 = v113;
      v112 = (id)objc_msgSend(*((id *)v174 + 21), "currentRefreshScanOperation");
      v109 = v112;
      v110 = (id)objc_msgSend(*((id *)v174 + 21), "currentUpdateOperation");
      v107 = v110;
      v108 = (id)objc_msgSend(*((id *)v174 + 21), "auxiliaryOperations");
      v105 = v108;
      v106 = objc_msgSend(v105, "count");
      v103 = v35;
      buf = v209;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v209, (uint64_t)v176, v162, v163, (uint64_t)v153, (uint64_t)v151, (uint64_t)v149, (uint64_t)v147, (uint64_t)v145, (uint64_t)v138, (uint64_t)v136, (uint64_t)v134, (uint64_t)v132, (uint64_t)v130, v128, (uint64_t)v125, v123, v118, v115,
        (uint64_t)v111,
        (uint64_t)v109,
        (uint64_t)v107,
        v106);
      _os_log_impl(&dword_21BF33000, log, v166[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A refresh operation is already running. Skipping on this refresh request. This should never happen.",
        buf,
        0xDEu);

      if ((v195 & 1) != 0)
      if ((v198 & 1) != 0)

      if ((v199 & 1) != 0)
      if ((v200 & 1) != 0)

      if ((v201 & 1) != 0)
      if ((v202 & 1) != 0)

      objc_storeStrong(&v196, 0);
      objc_storeStrong(&v197, 0);
      objc_storeStrong(&v203, 0);
    }
    objc_storeStrong(v205, 0);
    v24 = v174;
    *((_QWORD *)v174 + 22) = 0;
    *(_DWORD *)v24 = 1;
  }
  else if (*(_QWORD *)(*((_QWORD *)v174 + 21) + 184))
  {
    v102 = (id)objc_msgSend(*((id *)v174 + 21), "log");
    v100 = v102;
    v101 = (id)objc_msgSend(v100, "oslog");
    oslog = (os_log_t)v101;

    v192 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v97 = oslog;
      *(_DWORD *)v98 = v192;
      v99 = objc_msgSend(*((id *)v174 + 21), "currentState");
      v96 = SUSettingsUIStateToString(v99);
      v93 = v96;
      v94 = v93;
      v191 = v94;
      v95 = objc_msgSend(*((id *)v174 + 21), "currentState");
      v25 = (void *)*((_QWORD *)v174 + 21);
      v189 = 0;
      v187 = 0;
      v92 = (id)objc_msgSend(v25, "delegate");
      v91 = v92;
      if (v91)
      {
        v90 = (id)objc_msgSend(*((id *)v174 + 21), "delegate");
        v190 = v90;
        v189 = 1;
        v89 = (Class)objc_opt_class();
        v88 = NSStringFromClass(v89);
        v188 = v88;
        v187 = 1;
        v87 = (const __CFString *)v188;
      }
      else
      {
        v87 = CFSTR("(null)");
      }
      v85 = v87;
      v86 = (id)objc_msgSend(*((id *)v174 + 21), "delegate");
      v83 = v86;
      v84 = (id)objc_msgSend(*((id *)v174 + 21), "scanError");
      v81 = v84;
      v82 = (id)objc_msgSend(*((id *)v174 + 21), "preferredStatefulDescriptor");
      v79 = v82;
      v80 = (id)objc_msgSend(*((id *)v174 + 21), "alternateStatefulDescriptor");
      v77 = v80;
      v26 = (void *)*((_QWORD *)v174 + 21);
      v185 = 0;
      v183 = 0;
      v181 = 0;
      v78 = (id)objc_msgSend(v26, "currentDownload");
      v76 = v78;
      if (v76)
      {
        v75 = (id)objc_msgSend(*((id *)v174 + 21), "currentDownload");
        v186 = v75;
        v185 = 1;
        v74 = (id)objc_msgSend(v186, "descriptor");
        v184 = v74;
        v183 = 1;
        v73 = (id)objc_msgSend(v184, "humanReadableUpdateName");
        v182 = v73;
        v181 = 1;
        v72 = (const __CFString *)v182;
      }
      else
      {
        v72 = CFSTR("(null)");
      }
      v70 = v72;
      v71 = (id)objc_msgSend(*((id *)v174 + 21), "currentDownload");
      v68 = v71;
      v69 = objc_msgSend(*((id *)v174 + 21), "performThirdPartyScan");
      v27 = "YES";
      if ((v69 & 1) == 0)
        v27 = "NO";
      v66 = v27;
      v67 = objc_msgSend(*((id *)v174 + 21), "isTargetedUpdateScheduledForAutoInstall");
      v28 = "YES";
      if ((v67 & 1) == 0)
        v28 = "NO";
      v64 = v28;
      v65 = objc_msgSend(*((id *)v174 + 21), "hidingPreferredDescriptor");
      v29 = "YES";
      if ((v65 & 1) == 0)
        v29 = "NO";
      v62 = v29;
      v63 = (id)objc_msgSend(*(id *)(*((_QWORD *)v174 + 21) + 256), "humanReadableUpdateName");
      v59 = v63;
      v60 = v59;
      v180 = v60;
      v61 = objc_msgSend(*((id *)v174 + 21), "hidingAlternateDescriptor");
      v30 = "YES";
      if ((v61 & 1) == 0)
        v30 = "NO";
      v57 = v30;
      v58 = (id)objc_msgSend(*(id *)(*((_QWORD *)v174 + 21) + 264), "humanReadableUpdateName");
      v54 = v58;
      v55 = v54;
      v179 = v55;
      v31 = (void *)*((_QWORD *)v174 + 21);
      v177 = 0;
      v56 = (id)objc_msgSend(v31, "enrolledBetaProgram");
      v53 = v56;
      if (v53)
      {
        v52 = (id)objc_msgSend(*((id *)v174 + 21), "enrolledBetaProgram");
        v178 = v52;
        v177 = 1;
        v51 = objc_msgSend(v178, "programID");
        v50 = v51;
      }
      else
      {
        v50 = 0;
      }
      v48 = v50;
      v49 = (id)objc_msgSend(*((id *)v174 + 21), "betaPrograms");
      v46 = v49;
      v47 = objc_msgSend(v46, "count");
      v45 = (id)objc_msgSend(*((id *)v174 + 21), "currentFullScanOperation");
      v43 = v45;
      v44 = (id)objc_msgSend(*((id *)v174 + 21), "currentRefreshScanOperation");
      v41 = v44;
      v42 = (id)objc_msgSend(*((id *)v174 + 21), "currentUpdateOperation");
      v39 = v42;
      v40 = (id)objc_msgSend(*((id *)v174 + 21), "auxiliaryOperations");
      v37 = v40;
      v38 = objc_msgSend(v37, "count");
      v35[17] = (_Unwind_Exception *)v35;
      v36 = v208;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v208, (uint64_t)v176, (uint64_t)v94, v95, (uint64_t)v85, (uint64_t)v83, (uint64_t)v81, (uint64_t)v79, (uint64_t)v77, (uint64_t)v70, (uint64_t)v68, (uint64_t)v66, (uint64_t)v64, (uint64_t)v62, (uint64_t)v60, (uint64_t)v57, (uint64_t)v55, v50, v47,
        (uint64_t)v43,
        (uint64_t)v41,
        (uint64_t)v39,
        v38);
      _os_log_impl(&dword_21BF33000, v97, v98[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A full scan operation is already running. Skipping on this refresh request. This should never happen.",
        v36,
        0xDEu);

      if ((v177 & 1) != 0)
      if ((v181 & 1) != 0)

      if ((v183 & 1) != 0)
      if ((v185 & 1) != 0)

      if ((v187 & 1) != 0)
      if ((v189 & 1) != 0)

      objc_storeStrong(&v179, 0);
      objc_storeStrong(&v180, 0);
      objc_storeStrong(&v191, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v32 = v174;
    *((_QWORD *)v174 + 22) = 0;
    *(_DWORD *)v32 = 1;
  }
  else
  {
    *(_DWORD *)v174 = 0;
  }
  objc_sync_exit(obj);

  if (!*(_DWORD *)v174)
  {
    objc_msgSend(*((id *)v174 + 21), "performRefreshScan:", *((_QWORD *)v174 + 19));
    v33 = v174;
    *((_QWORD *)v174 + 22) = 0;
    *(_DWORD *)v33 = 1;
  }
  objc_storeStrong(location, 0);
  return *((_QWORD *)v174 + 22);
}

- (int64_t)action_ReportRefreshScanResults:(id)a3 error:(id *)a4
{
  objc_class *v4;
  char v5;
  const char *v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  objc_class *v13;
  char v14;
  const char *v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v23;
  char *v24;
  uint64_t *v25;
  id v26;
  id *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint8_t *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  const __CFString *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  id v50;
  id v51;
  int v52;
  id v53;
  int v54;
  const __CFString *v55;
  const __CFString *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  int v62;
  const __CFString *v63;
  os_log_t v64;
  os_log_type_t v65[4];
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  id v70;
  id obj;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint8_t *buf;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  const __CFString *v82;
  id v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  id v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  id v92;
  id v93;
  int v94;
  id v95;
  int v96;
  const __CFString *v97;
  const __CFString *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  int v104;
  const __CFString *v105;
  os_log_t log;
  os_log_type_t v107[4];
  id v108;
  id v109;
  uint64_t v110;
  id v111;
  id v112;
  _BOOL4 v113;
  const char *v114;
  id *v115;
  id v116;
  uint64_t v117;
  _BOOL4 v118;
  uint64_t v119;
  int v120;
  int v121;
  void (*v122)(uint64_t);
  void *v123;
  id v124;
  char v125;
  id v126;
  id v127;
  id v128;
  char v129;
  id v130;
  char v131;
  id v132;
  char v133;
  id v134;
  char v135;
  id v136;
  char v137;
  id v138;
  id v139;
  os_log_type_t v140;
  os_log_t v141;
  int v142;
  char v143;
  id v144;
  id v145;
  id v146;
  char v147;
  id v148;
  char v149;
  id v150;
  char v151;
  id v152;
  char v153;
  id v154;
  char v155;
  id v156;
  id v157;
  os_log_type_t type;
  os_log_t oslog;
  char v160;
  id v161;
  id *v162;
  id location[2];
  id v164;
  int64_t v165;
  _BYTE v166[224];
  _BYTE v167[232];
  uint64_t v168;

  v115 = a4;
  v114 = "-[SUSettingsStatefulUIManager action_ReportRefreshScanResults:error:]";
  v168 = *MEMORY[0x24BDAC8D0];
  v164 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v162 = v115;
  v116 = (id)objc_msgSend(*((id *)v164 + 27), "extendedStateQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v116);

  v117 = objc_msgSend(v164, "currentState");
  v160 = 0;
  v118 = 0;
  if (v117 == objc_msgSend(location[0], "refreshPreviousState"))
  {
    v118 = 0;
    if ((objc_msgSend(location[0], "refreshHasAnyChanges") & 1) == 0)
    {
      v161 = (id)objc_msgSend(v164, "scanError");
      v160 = 1;
      v118 = v161 == 0;
    }
  }
  v113 = v118;
  if ((v160 & 1) != 0)

  if (!v113)
    goto LABEL_72;
  if ((objc_msgSend(location[0], "forceReload") & 1) != 0)
  {
    v70 = (id)objc_msgSend(v164, "log");
    v141 = (os_log_t)(id)objc_msgSend(v70, "oslog");

    v140 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
    {
      v64 = v141;
      *(_DWORD *)v65 = v140;
      v66 = SUSettingsUIStateToString(objc_msgSend(v164, "currentState"));
      v67 = v66;
      v139 = v67;
      v68 = objc_msgSend(v164, "currentState");
      v69 = (id)objc_msgSend(v164, "delegate");
      v137 = 0;
      v135 = 0;
      if (v69)
      {
        v138 = (id)objc_msgSend(v164, "delegate");
        v62 = 1;
        v137 = 1;
        v13 = (objc_class *)objc_opt_class();
        v136 = NSStringFromClass(v13);
        v135 = 1;
        v63 = (const __CFString *)v136;
      }
      else
      {
        v63 = CFSTR("(null)");
      }
      v56 = v63;
      v57 = (id)objc_msgSend(v164, "delegate");
      v58 = (id)objc_msgSend(v164, "scanError");
      v59 = (id)objc_msgSend(v164, "preferredStatefulDescriptor");
      v60 = (id)objc_msgSend(v164, "alternateStatefulDescriptor");
      v61 = (id)objc_msgSend(v164, "currentDownload");
      v133 = 0;
      v131 = 0;
      v129 = 0;
      if (v61)
      {
        v134 = (id)objc_msgSend(v164, "currentDownload");
        v54 = 1;
        v133 = 1;
        v132 = (id)objc_msgSend(v134, "descriptor");
        v131 = 1;
        v130 = (id)objc_msgSend(v132, "humanReadableUpdateName");
        v129 = 1;
        v55 = (const __CFString *)v130;
      }
      else
      {
        v55 = CFSTR("(null)");
      }
      v40 = v55;
      v41 = (id)objc_msgSend(v164, "currentDownload");
      v14 = objc_msgSend(v164, "performThirdPartyScan");
      v47 = "NO";
      v15 = "YES";
      v48 = "YES";
      v52 = 1;
      if ((v14 & 1) == 0)
        v15 = "NO";
      v42 = v15;
      v16 = objc_msgSend(v164, "isTargetedUpdateScheduledForAutoInstall");
      v17 = (uint64_t)v48;
      if ((v16 & 1) == 0)
        v17 = (uint64_t)v47;
      v43 = v17;
      v18 = objc_msgSend(v164, "hidingPreferredDescriptor");
      v19 = (uint64_t)v48;
      if ((v18 & 1) == 0)
        v19 = (uint64_t)v47;
      v44 = v19;
      v45 = (id)objc_msgSend(*((id *)v164 + 32), "humanReadableUpdateName");
      v46 = v45;
      v128 = v46;
      v20 = objc_msgSend(v164, "hidingAlternateDescriptor");
      v21 = (uint64_t)v48;
      if ((v20 & 1) == 0)
        v21 = (uint64_t)v47;
      v49 = v21;
      v50 = (id)objc_msgSend(*((id *)v164 + 33), "humanReadableUpdateName");
      v51 = v50;
      v127 = v51;
      v53 = (id)objc_msgSend(v164, "enrolledBetaProgram");
      v125 = 0;
      if (v53)
      {
        v126 = (id)objc_msgSend(v164, "enrolledBetaProgram");
        v125 = 1;
        v39 = objc_msgSend(v126, "programID");
      }
      else
      {
        v39 = 0;
      }
      v30 = v39;
      v38 = (id)objc_msgSend(v164, "betaPrograms");
      v31 = objc_msgSend(v38, "count");
      v37 = (id)objc_msgSend(v164, "currentFullScanOperation");
      v36 = (id)objc_msgSend(v164, "currentRefreshScanOperation");
      v35 = (id)objc_msgSend(v164, "currentUpdateOperation");
      v34 = (id)objc_msgSend(v164, "auxiliaryOperations");
      v32 = &v23;
      v33 = v166;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v166, (uint64_t)v114, (uint64_t)v67, v68, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v40, (uint64_t)v41, (uint64_t)v42, v43, v44, (uint64_t)v46, v49, (uint64_t)v51, v39, v31,
        (uint64_t)v37,
        (uint64_t)v36,
        (uint64_t)v35,
        objc_msgSend(v34, "count"));
      _os_log_impl(&dword_21BF33000, v64, v65[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "The descriptors states and errors are identical to the previous values (refreshHasAnyChanges = YES). Force load "
        "was requested - proceeding to ask the delegate to reload the UI.",
        v33,
        0xDEu);

      if ((v125 & 1) != 0)
      if ((v129 & 1) != 0)

      if ((v131 & 1) != 0)
      if ((v133 & 1) != 0)

      if ((v135 & 1) != 0)
      if ((v137 & 1) != 0)

      v29 = 0;
      objc_storeStrong(&v127, 0);
      objc_storeStrong(&v128, v29);
      objc_storeStrong(&v139, v29);
    }
    objc_storeStrong((id *)&v141, 0);
LABEL_72:
    v26 = v164;
    v24 = sel_statefulUIManagerDidRefreshState_;
    v25 = &v119;
    v119 = MEMORY[0x24BDAC760];
    v120 = -1073741824;
    v121 = 0;
    v122 = __69__SUSettingsStatefulUIManager_action_ReportRefreshScanResults_error___block_invoke;
    v123 = &unk_24DFF7B58;
    v27 = &v124;
    v124 = v164;
    objc_msgSend(v26, "executeOperationOnDelegate:usingBlock:", v24, v25);
    v28 = 0;
    objc_storeStrong((id *)v164 + 24, 0);
    v165 = 0;
    v142 = 1;
    objc_storeStrong(v27, v28);
    goto LABEL_73;
  }
  v112 = (id)objc_msgSend(v164, "log");
  oslog = (os_log_t)(id)objc_msgSend(v112, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v107 = type;
    v108 = SUSettingsUIStateToString(objc_msgSend(v164, "currentState"));
    v109 = v108;
    v157 = v109;
    v110 = objc_msgSend(v164, "currentState");
    v111 = (id)objc_msgSend(v164, "delegate");
    v155 = 0;
    v153 = 0;
    if (v111)
    {
      v156 = (id)objc_msgSend(v164, "delegate");
      v104 = 1;
      v155 = 1;
      v4 = (objc_class *)objc_opt_class();
      v154 = NSStringFromClass(v4);
      v153 = 1;
      v105 = (const __CFString *)v154;
    }
    else
    {
      v105 = CFSTR("(null)");
    }
    v98 = v105;
    v99 = (id)objc_msgSend(v164, "delegate");
    v100 = (id)objc_msgSend(v164, "scanError");
    v101 = (id)objc_msgSend(v164, "preferredStatefulDescriptor");
    v102 = (id)objc_msgSend(v164, "alternateStatefulDescriptor");
    v103 = (id)objc_msgSend(v164, "currentDownload");
    v151 = 0;
    v149 = 0;
    v147 = 0;
    if (v103)
    {
      v152 = (id)objc_msgSend(v164, "currentDownload");
      v96 = 1;
      v151 = 1;
      v150 = (id)objc_msgSend(v152, "descriptor");
      v149 = 1;
      v148 = (id)objc_msgSend(v150, "humanReadableUpdateName");
      v147 = 1;
      v97 = (const __CFString *)v148;
    }
    else
    {
      v97 = CFSTR("(null)");
    }
    v82 = v97;
    v83 = (id)objc_msgSend(v164, "currentDownload");
    v5 = objc_msgSend(v164, "performThirdPartyScan");
    v89 = "NO";
    v6 = "YES";
    v90 = "YES";
    v94 = 1;
    if ((v5 & 1) == 0)
      v6 = "NO";
    v84 = v6;
    v7 = objc_msgSend(v164, "isTargetedUpdateScheduledForAutoInstall");
    v8 = (uint64_t)v90;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v89;
    v85 = v8;
    v9 = objc_msgSend(v164, "hidingPreferredDescriptor");
    v10 = (uint64_t)v90;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v89;
    v86 = v10;
    v87 = (id)objc_msgSend(*((id *)v164 + 32), "humanReadableUpdateName");
    v88 = v87;
    v146 = v88;
    v11 = objc_msgSend(v164, "hidingAlternateDescriptor");
    v12 = (uint64_t)v90;
    if ((v11 & 1) == 0)
      v12 = (uint64_t)v89;
    v91 = v12;
    v92 = (id)objc_msgSend(*((id *)v164 + 33), "humanReadableUpdateName");
    v93 = v92;
    v145 = v93;
    v95 = (id)objc_msgSend(v164, "enrolledBetaProgram");
    v143 = 0;
    if (v95)
    {
      v144 = (id)objc_msgSend(v164, "enrolledBetaProgram");
      v143 = 1;
      v81 = objc_msgSend(v144, "programID");
    }
    else
    {
      v81 = 0;
    }
    v72 = v81;
    v80 = (id)objc_msgSend(v164, "betaPrograms");
    v73 = objc_msgSend(v80, "count");
    v79 = (id)objc_msgSend(v164, "currentFullScanOperation");
    v78 = (id)objc_msgSend(v164, "currentRefreshScanOperation");
    v77 = (id)objc_msgSend(v164, "currentUpdateOperation");
    v76 = (id)objc_msgSend(v164, "auxiliaryOperations");
    v74 = &v23;
    buf = v167;
    __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v167, (uint64_t)v114, (uint64_t)v109, v110, (uint64_t)v98, (uint64_t)v99, (uint64_t)v100, (uint64_t)v101, (uint64_t)v102, (uint64_t)v82, (uint64_t)v83, (uint64_t)v84, v85, v86, (uint64_t)v88, v91, (uint64_t)v93, v81, v73,
      (uint64_t)v79,
      (uint64_t)v78,
      (uint64_t)v77,
      objc_msgSend(v76, "count"));
    _os_log_impl(&dword_21BF33000, log, v107[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "The descriptors states and errors are identical to the previous values (refreshHasAnyChanges = YES). Dropping the "
      "refresh request.",
      buf,
      0xDEu);

    if ((v143 & 1) != 0)
    if ((v147 & 1) != 0)

    if ((v149 & 1) != 0)
    if ((v151 & 1) != 0)

    if ((v153 & 1) != 0)
    if ((v155 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v145, 0);
    objc_storeStrong(&v146, obj);
    objc_storeStrong(&v157, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong((id *)v164 + 24, 0);
  v165 = 0;
  v142 = 1;
LABEL_73:
  objc_storeStrong(location, 0);
  return v165;
}

void __69__SUSettingsStatefulUIManager_action_ReportRefreshScanResults_error___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManagerDidRefreshState:", *(_QWORD *)(a1 + 32));

}

- (int64_t)action_ReportRefreshScanResultsFailed:(id)a3 error:(id *)a4
{
  NSObject *v6;
  SUSettingsStatefulUIManager *v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13[2];
  id location[2];
  SUSettingsStatefulUIManager *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13[1] = a4;
  v6 = (id)-[SUCoreFSM extendedStateQueue](v15->_managerFSM, "extendedStateQueue");
  dispatch_assert_queue_V2(v6);

  v7 = v15;
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __75__SUSettingsStatefulUIManager_action_ReportRefreshScanResultsFailed_error___block_invoke;
  v12 = &unk_24DFF7B58;
  v13[0] = v15;
  -[SUSettingsStatefulUIManager executeOperationOnDelegate:usingBlock:](v7, "executeOperationOnDelegate:usingBlock:", sel_statefulUIManagerDidRefreshState_);
  objc_storeStrong((id *)&v15->_currentRefreshScanOperation, 0);
  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);
  return 0;
}

void __75__SUSettingsStatefulUIManager_action_ReportRefreshScanResultsFailed_error___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManagerDidRefreshState:", *(_QWORD *)(a1 + 32));

}

- (int64_t)action_ThirdPartyScanDuringRefresh:(id)a3 error:(id *)a4
{
  objc_class *v4;
  BOOL v5;
  const char *v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v14;
  id v15;
  SUSettingsScanOperation *v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t *v22;
  uint8_t *buf;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  id v43;
  id v44;
  int v45;
  id v46;
  int v47;
  const __CFString *v48;
  const __CFString *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  int v55;
  const __CFString *v56;
  os_log_t log;
  os_log_type_t v58[4];
  id v59;
  id v60;
  unint64_t v61;
  id v62;
  id v63;
  const char *v64;
  NSObject *v65;
  id v66;
  id v67;
  char v68;
  id v69;
  id v70;
  id v71;
  char v72;
  id v73;
  char v74;
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  id v82;
  os_log_type_t type;
  os_log_t oslog[2];
  id location[2];
  SUSettingsStatefulUIManager *v86;
  _BYTE v87[248];
  uint64_t v88;

  v65 = a4;
  v64 = "-[SUSettingsStatefulUIManager action_ThirdPartyScanDuringRefresh:error:]";
  v88 = *MEMORY[0x24BDAC8D0];
  v86 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  oslog[1] = v65;
  v66 = (id)-[SUCoreFSM extendedStateQueue](v86->_managerFSM, "extendedStateQueue");
  dispatch_assert_queue_V2((dispatch_queue_t)v66);

  v63 = -[SUSettingsStatefulUIManager log](v86, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v63, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v58 = type;
    v59 = SUSettingsUIStateToString(-[SUSettingsStatefulUIManager currentState](v86, "currentState"));
    v60 = v59;
    v82 = v60;
    v61 = -[SUSettingsStatefulUIManager currentState](v86, "currentState");
    v62 = -[SUSettingsStatefulUIManager delegate](v86, "delegate");
    v80 = 0;
    v78 = 0;
    if (v62)
    {
      v81 = -[SUSettingsStatefulUIManager delegate](v86, "delegate");
      v55 = 1;
      v80 = 1;
      v4 = (objc_class *)objc_opt_class();
      v79 = NSStringFromClass(v4);
      v78 = 1;
      v56 = (const __CFString *)v79;
    }
    else
    {
      v56 = CFSTR("(null)");
    }
    v49 = v56;
    v50 = -[SUSettingsStatefulUIManager delegate](v86, "delegate");
    v51 = -[SUSettingsStatefulUIManager scanError](v86, "scanError");
    v52 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](v86, "preferredStatefulDescriptor");
    v53 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](v86, "alternateStatefulDescriptor");
    v54 = -[SUSettingsStatefulUIManager currentDownload](v86, "currentDownload");
    v76 = 0;
    v74 = 0;
    v72 = 0;
    if (v54)
    {
      v77 = -[SUSettingsStatefulUIManager currentDownload](v86, "currentDownload");
      v47 = 1;
      v76 = 1;
      v75 = (id)objc_msgSend(v77, "descriptor");
      v74 = 1;
      v73 = (id)objc_msgSend(v75, "humanReadableUpdateName");
      v72 = 1;
      v48 = (const __CFString *)v73;
    }
    else
    {
      v48 = CFSTR("(null)");
    }
    v33 = v48;
    v34 = -[SUSettingsStatefulUIManager currentDownload](v86, "currentDownload");
    v5 = -[SUSettingsStatefulUIManager performThirdPartyScan](v86, "performThirdPartyScan");
    v40 = "NO";
    v6 = "YES";
    v41 = "YES";
    v45 = 1;
    if (!v5)
      v6 = "NO";
    v35 = v6;
    v7 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v86, "isTargetedUpdateScheduledForAutoInstall");
    v8 = (uint64_t)v41;
    if (!v7)
      v8 = (uint64_t)v40;
    v36 = v8;
    v9 = -[SUSettingsStatefulUIManager hidingPreferredDescriptor](v86, "hidingPreferredDescriptor");
    v10 = (uint64_t)v41;
    if (!v9)
      v10 = (uint64_t)v40;
    v37 = v10;
    v38 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v86->_hiddenPreferredStatefulDescriptor, "humanReadableUpdateName");
    v39 = v38;
    v71 = v39;
    v11 = -[SUSettingsStatefulUIManager hidingAlternateDescriptor](v86, "hidingAlternateDescriptor");
    v12 = (uint64_t)v41;
    if (!v11)
      v12 = (uint64_t)v40;
    v42 = v12;
    v43 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v86->_hiddenAlternateStatefulDescriptor, "humanReadableUpdateName");
    v44 = v43;
    v70 = v44;
    v46 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v86, "enrolledBetaProgram");
    v68 = 0;
    if (v46)
    {
      v69 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v86, "enrolledBetaProgram");
      v68 = 1;
      v32 = objc_msgSend(v69, "programID");
    }
    else
    {
      v32 = 0;
    }
    v18 = v32;
    v31 = -[SUSettingsStatefulUIManager betaPrograms](v86, "betaPrograms");
    v19 = objc_msgSend(v31, "count");
    v30 = -[SUSettingsStatefulUIManager currentFullScanOperation](v86, "currentFullScanOperation");
    v29 = -[SUSettingsStatefulUIManager currentRefreshScanOperation](v86, "currentRefreshScanOperation");
    v28 = -[SUSettingsStatefulUIManager currentUpdateOperation](v86, "currentUpdateOperation");
    v27 = -[SUSettingsStatefulUIManager auxiliaryOperations](v86, "auxiliaryOperations");
    v20 = objc_msgSend(v27, "count");
    v26 = -[SUSettingsStatefulUIManager currentRefreshScanOperation](v86, "currentRefreshScanOperation");
    v25 = (id)objc_msgSend(v26, "scanUUID");
    v21 = v25;
    v67 = v21;
    v24 = -[SUSettingsStatefulUIManager currentRefreshScanOperation](v86, "currentRefreshScanOperation");
    v22 = &v14;
    buf = v87;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_2((uint64_t)v87, (uint64_t)v64, (uint64_t)v60, v61, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, (uint64_t)v53, (uint64_t)v33, (uint64_t)v34, (uint64_t)v35, v36, v37, (uint64_t)v39, v42, (uint64_t)v44, v32, v19,
      (uint64_t)v30,
      (uint64_t)v29,
      (uint64_t)v28,
      v20,
      (uint64_t)v21,
      (uint64_t)v24);
    _os_log_impl(&dword_21BF33000, log, v58[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Cancelling a refresh request as a third-party scan has been initiated.\n"
      "Refresh scan UUID: %{public}@; Refresh Scan: %{public}p",
      buf,
      0xF2u);

    if ((v68 & 1) != 0)
    if ((v72 & 1) != 0)

    if ((v74 & 1) != 0)
    if ((v76 & 1) != 0)

    if ((v78 & 1) != 0)
    if ((v80 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v70, obj);
    objc_storeStrong(&v71, obj);
    objc_storeStrong(&v82, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  v16 = -[SUSettingsStatefulUIManager currentRefreshScanOperation](v86, "currentRefreshScanOperation");

  if (v16)
  {
    v15 = -[SUSettingsStatefulUIManager currentRefreshScanOperation](v86, "currentRefreshScanOperation");
    objc_msgSend(v15, "cancel:", 0);

  }
  objc_storeStrong(location, 0);
  return 0;
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
  SUSettingsStatefulUIManager *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16[1] = a4;
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v16[0] = (id)objc_msgSend(v4, "initWithFormat:", location[0]);
  v11 = -[SUSettingsStatefulUIManager managerFSM](v18, "managerFSM");
  v10 = (id)-[SUCoreFSM diag](v11, "diag");
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  v9 = (id)objc_msgSend(v5, "initWithFormat:", CFSTR("unknown action(%@)"), location[0]);
  objc_msgSend(v10, "dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:");

  v12 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
  v15 = (id)objc_msgSend(v12, "buildError:underlying:description:", 8116, 0, v16[0]);

  v14 = -[SUSettingsStatefulUIManager managerFSM](v18, "managerFSM");
  v13 = (id)-[SUCoreFSM diag](v14, "diag");
  v6 = objc_msgSend(v15, "code");
  objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsStatefulUIManager]"), CFSTR("Stateful UI FSM has reported an anomaly"), v6, v15);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (SUSettingsStatefulUIManager)initWithManagerClient:(id)a3
{
  id v4;
  SUSettingsStatefulUIManager *v5;
  id v6;
  id v7;
  SUSettingsStatefulUIManager *v8;
  id location[2];
  SUSettingsStatefulUIManager *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = v10;
  v4 = location[0];
  v7 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
  v6 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  v10 = 0;
  v10 = -[SUSettingsStatefulUIManager initWithManagerClient:betaManager:preferences:options:](v5, "initWithManagerClient:betaManager:preferences:options:", v4, v7);
  v8 = v10;

  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v10, 0);
  return v8;
}

- (SUSettingsStatefulUIManager)initWithManagerClient:(id)a3 options:(id)a4
{
  id v6;
  SUSettingsStatefulUIManager *v7;
  id v8;
  id v9;
  SUSettingsStatefulUIManager *v10;
  id v11;
  id location[2];
  SUSettingsStatefulUIManager *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v7 = v13;
  v6 = location[0];
  v9 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
  v8 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
  v13 = 0;
  v13 = -[SUSettingsStatefulUIManager initWithManagerClient:betaManager:preferences:options:](v7, "initWithManagerClient:betaManager:preferences:options:", v6, v9);
  v10 = v13;

  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v10;
}

- (SUSettingsStatefulUIManager)initWithManagerClient:(id)a3 betaManager:(id)a4 preferences:(id)a5 options:(id)a6
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  dispatch_queue_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  SUSettingsSUPreferencesManager *v23;
  uint64_t v24;
  id v25;
  SUSettingsStatefulUIManager *v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  char v35;
  SUSettingsStatefulUIOptions *v36;
  int v37;
  os_log_type_t v38;
  id v39;
  objc_super v40;
  id v41;
  id v42;
  id v43;
  id location[2];
  id v45;
  SUSettingsStatefulUIManager *v46;
  uint8_t v47[16];
  uint8_t v48[24];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = 0;
  objc_storeStrong(&v43, a4);
  v42 = 0;
  objc_storeStrong(&v42, a5);
  v41 = 0;
  objc_storeStrong(&v41, a6);
  v6 = v45;
  v45 = 0;
  v40.receiver = v6;
  v40.super_class = (Class)SUSettingsStatefulUIManager;
  v29 = -[SUSettingsStatefulUIManager init](&v40, sel_init);
  v45 = v29;
  objc_storeStrong(&v45, v29);
  if (!v29)
    goto LABEL_25;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEAEA70]), "initWithCategory:", CFSTR("SUSettingsStatefulUIManager"));
  v8 = (void *)*((_QWORD *)v45 + 20);
  *((_QWORD *)v45 + 20) = v7;

  if (!*((_QWORD *)v45 + 20))
  {
    v25 = SUSettingsSharedLogger();
    v39 = (id)objc_msgSend(v25, "oslog");

    v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v48, (uint64_t)"-[SUSettingsStatefulUIManager initWithManagerClient:betaManager:preferences:options:]", (uint64_t)CFSTR("SUSettingsStatefulUIManager"));
      _os_log_impl(&dword_21BF33000, (os_log_t)v39, v38, "%s: Could not create a log category for %@", v48, 0x16u);
    }
    objc_storeStrong(&v39, 0);
    v46 = 0;
    v37 = 1;
    goto LABEL_26;
  }
  v35 = 0;
  if (v41)
  {
    objc_storeStrong((id *)v45 + 6, v41);
  }
  else
  {
    v36 = objc_alloc_init(SUSettingsStatefulUIOptions);
    v35 = 1;
    objc_storeStrong((id *)v45 + 6, v36);
  }
  if ((v35 & 1) != 0)

  v9 = -[SUSettingsStatefulErrorContextProvider initForManager:]([SUSettingsStatefulErrorContextProvider alloc], "initForManager:", v45);
  v10 = (void *)*((_QWORD *)v45 + 7);
  *((_QWORD *)v45 + 7) = v9;

  v20 = (void *)MEMORY[0x24BDD17C8];
  v22 = (id)objc_msgSend(v45, "baseDomain");
  v21 = (id)objc_msgSend(v20, "stringWithFormat:", CFSTR("%@.stateful-ui-manager.preferences"), v22);
  v11 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(v21), "UTF8String"), 0);
  v12 = (void *)*((_QWORD *)v45 + 22);
  *((_QWORD *)v45 + 22) = v11;

  v23 = [SUSettingsSUPreferencesManager alloc];
  v24 = *((_QWORD *)v45 + 22);
  v33 = 0;
  if (v42)
  {
    v19 = v42;
  }
  else
  {
    v34 = (id)objc_msgSend(MEMORY[0x24BEAEC50], "sharedInstance");
    v33 = 1;
    v19 = v34;
  }
  v13 = -[SUSettingsSUPreferencesManager initWithDispatchQueue:forSUPreferencesInstance:](v23, "initWithDispatchQueue:forSUPreferencesInstance:", v24, v19);
  v14 = (void *)*((_QWORD *)v45 + 8);
  *((_QWORD *)v45 + 8) = v13;

  if ((v33 & 1) != 0)
  objc_storeStrong((id *)v45 + 28, location[0]);
  objc_msgSend(*((id *)v45 + 28), "setDelegate:", v45);
  *((_QWORD *)v45 + 9) = 0;
  v31 = 0;
  if (v43)
  {
    objc_storeStrong((id *)v45 + 29, v43);
  }
  else
  {
    v32 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
    v31 = 1;
    objc_storeStrong((id *)v45 + 29, v32);
  }
  if ((v31 & 1) != 0)

  v15 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v16 = (void *)*((_QWORD *)v45 + 26);
  *((_QWORD *)v45 + 26) = v15;

  objc_msgSend(v45, "setupFSM");
  objc_msgSend(v45, "setupNetworkMonitoring");
  objc_msgSend(v45, "setupBatteryMonitoring");
  objc_msgSend(v45, "setupObservers");
  if (*((_QWORD *)v45 + 27))
  {
LABEL_25:
    v46 = (SUSettingsStatefulUIManager *)v45;
    v37 = 1;
    goto LABEL_26;
  }
  v18 = (id)objc_msgSend(v45, "log");
  v30 = (id)objc_msgSend(v18, "oslog");

  if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v47, (uint64_t)"-[SUSettingsStatefulUIManager initWithManagerClient:betaManager:preferences:options:]");
    _os_log_error_impl(&dword_21BF33000, (os_log_t)v30, OS_LOG_TYPE_ERROR, "%s: Failed creating the manager FSM", v47, 0xCu);
  }
  objc_storeStrong(&v30, 0);
  v46 = 0;
  v37 = 1;
LABEL_26:
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v45, 0);
  return v46;
}

- (void)dealloc
{
  uint64_t v2;
  id v3;
  id v4;
  objc_super v5;
  SEL v6;
  SUSettingsStatefulUIManager *v7;

  v7 = self;
  v6 = a2;
  v2 = SBSSpringBoardServerPort();
  MEMORY[0x220773704](v2, v7->_originalCellFlag, v7->_originalWifiFlag);
  v3 = (id)objc_msgSend(getSUNetworkMonitorClass(), "sharedInstance");
  objc_msgSend(v3, "removeObserver:", v7);

  PSSetBatteryMonitoringEnabled();
  v4 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v4, "removeObserver:", v7);

  v5.receiver = v7;
  v5.super_class = (Class)SUSettingsStatefulUIManager;
  -[SUSettingsStatefulUIManager dealloc](&v5, sel_dealloc);
}

- (void)checkForAvailableUpdates
{
  objc_class *v2;
  BOOL v3;
  const char *v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  id v13;
  id v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint8_t *buf;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  const __CFString *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  id v38;
  id v39;
  int v40;
  id v41;
  int v42;
  const __CFString *v43;
  const __CFString *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  int v50;
  const __CFString *v51;
  os_log_t log;
  os_log_type_t v53[4];
  id v54;
  id v55;
  unint64_t v56;
  id v57;
  id v58;
  const char *v59;
  id location;
  char v61;
  id v62;
  id v63;
  id v64;
  char v65;
  id v66;
  char v67;
  id v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  id v75;
  os_log_type_t type;
  os_log_t oslog[2];
  SUSettingsStatefulUIManager *v78;
  _BYTE v79[232];
  uint64_t v80;

  v59 = "-[SUSettingsStatefulUIManager checkForAvailableUpdates]";
  v80 = *MEMORY[0x24BDAC8D0];
  v78 = self;
  oslog[1] = (os_log_t)a2;
  v58 = -[SUSettingsStatefulUIManager log](self, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v58, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v53 = type;
    v54 = SUSettingsUIStateToString(-[SUSettingsStatefulUIManager currentState](v78, "currentState"));
    v55 = v54;
    v75 = v55;
    v56 = -[SUSettingsStatefulUIManager currentState](v78, "currentState");
    v57 = -[SUSettingsStatefulUIManager delegate](v78, "delegate");
    v73 = 0;
    v71 = 0;
    if (v57)
    {
      v74 = -[SUSettingsStatefulUIManager delegate](v78, "delegate");
      v50 = 1;
      v73 = 1;
      v2 = (objc_class *)objc_opt_class();
      v72 = NSStringFromClass(v2);
      v71 = 1;
      v51 = (const __CFString *)v72;
    }
    else
    {
      v51 = CFSTR("(null)");
    }
    v44 = v51;
    v45 = -[SUSettingsStatefulUIManager delegate](v78, "delegate");
    v46 = -[SUSettingsStatefulUIManager scanError](v78, "scanError");
    v47 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](v78, "preferredStatefulDescriptor");
    v48 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](v78, "alternateStatefulDescriptor");
    v49 = -[SUSettingsStatefulUIManager currentDownload](v78, "currentDownload");
    v69 = 0;
    v67 = 0;
    v65 = 0;
    if (v49)
    {
      v70 = -[SUSettingsStatefulUIManager currentDownload](v78, "currentDownload");
      v42 = 1;
      v69 = 1;
      v68 = (id)objc_msgSend(v70, "descriptor");
      v67 = 1;
      v66 = (id)objc_msgSend(v68, "humanReadableUpdateName");
      v65 = 1;
      v43 = (const __CFString *)v66;
    }
    else
    {
      v43 = CFSTR("(null)");
    }
    v28 = v43;
    v29 = -[SUSettingsStatefulUIManager currentDownload](v78, "currentDownload");
    v3 = -[SUSettingsStatefulUIManager performThirdPartyScan](v78, "performThirdPartyScan");
    v35 = "NO";
    v4 = "YES";
    v36 = "YES";
    v40 = 1;
    if (!v3)
      v4 = "NO";
    v30 = v4;
    v5 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v78, "isTargetedUpdateScheduledForAutoInstall");
    v6 = (uint64_t)v36;
    if (!v5)
      v6 = (uint64_t)v35;
    v31 = v6;
    v7 = -[SUSettingsStatefulUIManager hidingPreferredDescriptor](v78, "hidingPreferredDescriptor");
    v8 = (uint64_t)v36;
    if (!v7)
      v8 = (uint64_t)v35;
    v32 = v8;
    v33 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v78->_hiddenPreferredStatefulDescriptor, "humanReadableUpdateName");
    v34 = v33;
    v64 = v34;
    v9 = -[SUSettingsStatefulUIManager hidingAlternateDescriptor](v78, "hidingAlternateDescriptor");
    v10 = (uint64_t)v36;
    if (!v9)
      v10 = (uint64_t)v35;
    v37 = v10;
    v38 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v78->_hiddenAlternateStatefulDescriptor, "humanReadableUpdateName");
    v39 = v38;
    v63 = v39;
    v41 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v78, "enrolledBetaProgram");
    v61 = 0;
    if (v41)
    {
      v62 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v78, "enrolledBetaProgram");
      v61 = 1;
      v27 = objc_msgSend(v62, "programID");
    }
    else
    {
      v27 = 0;
    }
    v16 = v27;
    v26 = -[SUSettingsStatefulUIManager betaPrograms](v78, "betaPrograms");
    v17 = objc_msgSend(v26, "count");
    v25 = -[SUSettingsStatefulUIManager currentFullScanOperation](v78, "currentFullScanOperation");
    v24 = -[SUSettingsStatefulUIManager currentRefreshScanOperation](v78, "currentRefreshScanOperation");
    v23 = -[SUSettingsStatefulUIManager currentUpdateOperation](v78, "currentUpdateOperation");
    v22 = -[SUSettingsStatefulUIManager auxiliaryOperations](v78, "auxiliaryOperations");
    v18 = objc_msgSend(v22, "count");
    v21 = (id)-[SUCoreFSM copyCurrentState](v78->_managerFSM, "copyCurrentState");
    location = v21;
    v19 = &v11;
    buf = v79;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v79, (uint64_t)v59, (uint64_t)v55, v56, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48, (uint64_t)v28, (uint64_t)v29, (uint64_t)v30, v31, v32, (uint64_t)v34, v37, (uint64_t)v39, v27, v17,
      (uint64_t)v25,
      (uint64_t)v24,
      (uint64_t)v23,
      v18,
      (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, v53[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Current FSM state: %{public}@",
      buf,
      0xE8u);

    if ((v61 & 1) != 0)
    if ((v65 & 1) != 0)

    if ((v67 & 1) != 0)
    if ((v69 & 1) != 0)

    if ((v71 & 1) != 0)
    if ((v73 & 1) != 0)

    obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v63, obj);
    objc_storeStrong(&v64, obj);
    objc_storeStrong(&v75, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  v14 = -[SUSettingsStatefulUIManager managerFSM](v78, "managerFSM");
  v12 = CFSTR("CheckForAvailableUpdate");
  v13 = objc_alloc_init(SUSettingsStatefulUIManagerFSMParam);
  objc_msgSend(v14, "postEvent:withInfo:", v12);

}

- (void)refreshState
{
  -[SUSettingsStatefulUIManager refreshState:](self, "refreshState:", 0, a2, self);
}

- (void)refreshState:(BOOL)a3
{
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  SUSettingsStatefulUIManagerFSMParam *v19;
  uint64_t *v20;
  uint8_t *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  const char *v42;
  id v43;
  id v44;
  id v45;
  _BOOL4 v46;
  const char *v47;
  id v48;
  const char *v49;
  _BOOL4 v50;
  const char *v51;
  _BOOL4 v52;
  id v53;
  _BOOL4 v54;
  const __CFString *v55;
  id v56;
  const __CFString *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  const __CFString *v70;
  id v71;
  const __CFString *v72;
  id v73;
  Class v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  unint64_t v80;
  id v81;
  os_log_t v82;
  os_log_type_t v83[4];
  unint64_t v84;
  id v85;
  id v86;
  id v87;
  uint64_t *v88;
  uint8_t *v89;
  id v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  const char *v110;
  id v111;
  id v112;
  id v113;
  _BOOL4 v114;
  const char *v115;
  id v116;
  const char *v117;
  _BOOL4 v118;
  const char *v119;
  _BOOL4 v120;
  id v121;
  _BOOL4 v122;
  const __CFString *v123;
  id v124;
  const __CFString *v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  const __CFString *v138;
  id v139;
  const __CFString *v140;
  id v141;
  Class v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  unint64_t v148;
  id v149;
  os_log_t v150;
  os_log_type_t v151[4];
  unint64_t v152;
  id v153;
  id v154;
  id v155;
  uint64_t *v156;
  uint8_t *buf;
  id v158;
  id v159;
  uint64_t v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  const char *v179;
  id v180;
  id v181;
  id v182;
  _BOOL4 v183;
  const char *v184;
  id v185;
  const char *v186;
  _BOOL4 v187;
  const char *v188;
  _BOOL4 v189;
  id v190;
  _BOOL4 v191;
  const __CFString *v192;
  id v193;
  const __CFString *v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  const __CFString *v207;
  id v208;
  const __CFString *v209;
  id v210;
  Class aClass;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  unint64_t v217;
  id v218;
  os_log_t log;
  os_log_type_t v220[4];
  unint64_t v221;
  id v222;
  id v223;
  id v224;
  const char *v225;
  id obj;
  id v227;
  char v228;
  id v229;
  id v230;
  id v231;
  char v232;
  id v233;
  char v234;
  id v235;
  char v236;
  id v237;
  char v238;
  id v239;
  char v240;
  id v241;
  id v242;
  os_log_type_t v243;
  os_log_t v244;
  int v245;
  char v246;
  id v247;
  id v248;
  id v249;
  char v250;
  id v251;
  char v252;
  id v253;
  char v254;
  id v255;
  char v256;
  id v257;
  char v258;
  id v259;
  id v260;
  os_log_type_t v261;
  os_log_t v262;
  id location;
  char v264;
  id v265;
  id v266;
  id v267;
  char v268;
  id v269;
  char v270;
  id v271;
  char v272;
  id v273;
  char v274;
  id v275;
  char v276;
  id v277;
  id v278;
  os_log_type_t type;
  os_log_t oslog;
  BOOL v281;
  SEL v282;
  SUSettingsStatefulUIManager *v283;
  _BYTE v284[224];
  _BYTE v285[224];
  _BYTE v286[232];
  uint64_t v287;

  v225 = "-[SUSettingsStatefulUIManager refreshState:]";
  v287 = *MEMORY[0x24BDAC8D0];
  v283 = self;
  v282 = a2;
  v281 = a3;
  obj = self->_currentRefreshScanOperation;
  objc_sync_enter(obj);
  v224 = -[SUSettingsStatefulUIManager log](v283, "log");
  v222 = v224;
  v223 = (id)objc_msgSend(v222, "oslog");
  oslog = (os_log_t)v223;

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v220 = type;
    v221 = -[SUSettingsStatefulUIManager currentState](v283, "currentState");
    v218 = SUSettingsUIStateToString(v221);
    v215 = v218;
    v216 = v215;
    v278 = v216;
    v217 = -[SUSettingsStatefulUIManager currentState](v283, "currentState");
    v276 = 0;
    v274 = 0;
    v214 = -[SUSettingsStatefulUIManager delegate](v283, "delegate");
    v213 = v214;
    if (v213)
    {
      v212 = -[SUSettingsStatefulUIManager delegate](v283, "delegate");
      v277 = v212;
      v276 = 1;
      aClass = (Class)objc_opt_class();
      v210 = NSStringFromClass(aClass);
      v275 = v210;
      v274 = 1;
      v209 = (const __CFString *)v275;
    }
    else
    {
      v209 = CFSTR("(null)");
    }
    v207 = v209;
    v208 = -[SUSettingsStatefulUIManager delegate](v283, "delegate");
    v205 = v208;
    v206 = -[SUSettingsStatefulUIManager scanError](v283, "scanError");
    v203 = v206;
    v204 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](v283, "preferredStatefulDescriptor");
    v201 = v204;
    v202 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](v283, "alternateStatefulDescriptor");
    v199 = v202;
    v272 = 0;
    v270 = 0;
    v268 = 0;
    v200 = -[SUSettingsStatefulUIManager currentDownload](v283, "currentDownload");
    v198 = v200;
    if (v198)
    {
      v197 = -[SUSettingsStatefulUIManager currentDownload](v283, "currentDownload");
      v273 = v197;
      v272 = 1;
      v196 = (id)objc_msgSend(v273, "descriptor");
      v271 = v196;
      v270 = 1;
      v195 = (id)objc_msgSend(v271, "humanReadableUpdateName");
      v269 = v195;
      v268 = 1;
      v194 = (const __CFString *)v269;
    }
    else
    {
      v194 = CFSTR("(null)");
    }
    v192 = v194;
    v193 = -[SUSettingsStatefulUIManager currentDownload](v283, "currentDownload");
    v190 = v193;
    v191 = -[SUSettingsStatefulUIManager performThirdPartyScan](v283, "performThirdPartyScan");
    v3 = "YES";
    if (!v191)
      v3 = "NO";
    v188 = v3;
    v189 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v283, "isTargetedUpdateScheduledForAutoInstall");
    v4 = "YES";
    if (!v189)
      v4 = "NO";
    v186 = v4;
    v187 = -[SUSettingsStatefulUIManager hidingPreferredDescriptor](v283, "hidingPreferredDescriptor");
    v5 = "YES";
    if (!v187)
      v5 = "NO";
    v184 = v5;
    v185 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v283->_hiddenPreferredStatefulDescriptor, "humanReadableUpdateName");
    v181 = v185;
    v182 = v181;
    v267 = v182;
    v183 = -[SUSettingsStatefulUIManager hidingAlternateDescriptor](v283, "hidingAlternateDescriptor");
    v6 = "YES";
    if (!v183)
      v6 = "NO";
    v179 = v6;
    v180 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v283->_hiddenAlternateStatefulDescriptor, "humanReadableUpdateName");
    v176 = v180;
    v177 = v176;
    v266 = v177;
    v264 = 0;
    v178 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v283, "enrolledBetaProgram");
    v175 = v178;
    if (v175)
    {
      v174 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v283, "enrolledBetaProgram");
      v265 = v174;
      v264 = 1;
      v173 = objc_msgSend(v265, "programID");
      v172 = v173;
    }
    else
    {
      v172 = 0;
    }
    v170 = v172;
    v171 = -[SUSettingsStatefulUIManager betaPrograms](v283, "betaPrograms");
    v168 = v171;
    v169 = objc_msgSend(v168, "count");
    v167 = -[SUSettingsStatefulUIManager currentFullScanOperation](v283, "currentFullScanOperation");
    v165 = v167;
    v166 = -[SUSettingsStatefulUIManager currentRefreshScanOperation](v283, "currentRefreshScanOperation");
    v163 = v166;
    v164 = -[SUSettingsStatefulUIManager currentUpdateOperation](v283, "currentUpdateOperation");
    v161 = v164;
    v162 = -[SUSettingsStatefulUIManager auxiliaryOperations](v283, "auxiliaryOperations");
    v159 = v162;
    v160 = objc_msgSend(v159, "count");
    v158 = (id)-[SUCoreFSM copyCurrentState](v283->_managerFSM, "copyCurrentState");
    location = v158;
    v156 = &v15;
    buf = v286;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v286, (uint64_t)v225, (uint64_t)v216, v217, (uint64_t)v207, (uint64_t)v205, (uint64_t)v203, (uint64_t)v201, (uint64_t)v199, (uint64_t)v192, (uint64_t)v190, (uint64_t)v188, (uint64_t)v186, (uint64_t)v184, (uint64_t)v182, (uint64_t)v179, (uint64_t)v177, v172, v169,
      (uint64_t)v165,
      (uint64_t)v163,
      (uint64_t)v161,
      v160,
      (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, v220[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Current FSM state: %{public}@",
      buf,
      0xE8u);

    if ((v264 & 1) != 0)
    if ((v268 & 1) != 0)

    if ((v270 & 1) != 0)
    if ((v272 & 1) != 0)

    if ((v274 & 1) != 0)
    if ((v276 & 1) != 0)

    objc_storeStrong(&location, 0);
    objc_storeStrong(&v266, 0);
    objc_storeStrong(&v267, 0);
    objc_storeStrong(&v278, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v283->_currentRefreshScanOperation)
  {
    v155 = -[SUSettingsStatefulUIManager log](v283, "log");
    v153 = v155;
    v154 = (id)objc_msgSend(v153, "oslog");
    v262 = (os_log_t)v154;

    v261 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v262, OS_LOG_TYPE_DEFAULT))
    {
      v150 = v262;
      *(_DWORD *)v151 = v261;
      v152 = -[SUSettingsStatefulUIManager currentState](v283, "currentState");
      v149 = SUSettingsUIStateToString(v152);
      v146 = v149;
      v147 = v146;
      v260 = v147;
      v148 = -[SUSettingsStatefulUIManager currentState](v283, "currentState");
      v258 = 0;
      v256 = 0;
      v145 = -[SUSettingsStatefulUIManager delegate](v283, "delegate");
      v144 = v145;
      if (v144)
      {
        v143 = -[SUSettingsStatefulUIManager delegate](v283, "delegate");
        v259 = v143;
        v258 = 1;
        v142 = (Class)objc_opt_class();
        v141 = NSStringFromClass(v142);
        v257 = v141;
        v256 = 1;
        v140 = (const __CFString *)v257;
      }
      else
      {
        v140 = CFSTR("(null)");
      }
      v138 = v140;
      v139 = -[SUSettingsStatefulUIManager delegate](v283, "delegate");
      v136 = v139;
      v137 = -[SUSettingsStatefulUIManager scanError](v283, "scanError");
      v134 = v137;
      v135 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](v283, "preferredStatefulDescriptor");
      v132 = v135;
      v133 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](v283, "alternateStatefulDescriptor");
      v130 = v133;
      v254 = 0;
      v252 = 0;
      v250 = 0;
      v131 = -[SUSettingsStatefulUIManager currentDownload](v283, "currentDownload");
      v129 = v131;
      if (v129)
      {
        v128 = -[SUSettingsStatefulUIManager currentDownload](v283, "currentDownload");
        v255 = v128;
        v254 = 1;
        v127 = (id)objc_msgSend(v255, "descriptor");
        v253 = v127;
        v252 = 1;
        v126 = (id)objc_msgSend(v253, "humanReadableUpdateName");
        v251 = v126;
        v250 = 1;
        v125 = (const __CFString *)v251;
      }
      else
      {
        v125 = CFSTR("(null)");
      }
      v123 = v125;
      v124 = -[SUSettingsStatefulUIManager currentDownload](v283, "currentDownload");
      v121 = v124;
      v122 = -[SUSettingsStatefulUIManager performThirdPartyScan](v283, "performThirdPartyScan");
      v7 = "YES";
      if (!v122)
        v7 = "NO";
      v119 = v7;
      v120 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v283, "isTargetedUpdateScheduledForAutoInstall");
      v8 = "YES";
      if (!v120)
        v8 = "NO";
      v117 = v8;
      v118 = -[SUSettingsStatefulUIManager hidingPreferredDescriptor](v283, "hidingPreferredDescriptor");
      v9 = "YES";
      if (!v118)
        v9 = "NO";
      v115 = v9;
      v116 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v283->_hiddenPreferredStatefulDescriptor, "humanReadableUpdateName");
      v112 = v116;
      v113 = v112;
      v249 = v113;
      v114 = -[SUSettingsStatefulUIManager hidingAlternateDescriptor](v283, "hidingAlternateDescriptor");
      v10 = "YES";
      if (!v114)
        v10 = "NO";
      v110 = v10;
      v111 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v283->_hiddenAlternateStatefulDescriptor, "humanReadableUpdateName");
      v107 = v111;
      v108 = v107;
      v248 = v108;
      v246 = 0;
      v109 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v283, "enrolledBetaProgram");
      v106 = v109;
      if (v106)
      {
        v105 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v283, "enrolledBetaProgram");
        v247 = v105;
        v246 = 1;
        v104 = objc_msgSend(v247, "programID");
        v103 = v104;
      }
      else
      {
        v103 = 0;
      }
      v101 = v103;
      v102 = -[SUSettingsStatefulUIManager betaPrograms](v283, "betaPrograms");
      v99 = v102;
      v100 = objc_msgSend(v99, "count");
      v98 = -[SUSettingsStatefulUIManager currentFullScanOperation](v283, "currentFullScanOperation");
      v96 = v98;
      v97 = -[SUSettingsStatefulUIManager currentRefreshScanOperation](v283, "currentRefreshScanOperation");
      v94 = v97;
      v95 = -[SUSettingsStatefulUIManager currentUpdateOperation](v283, "currentUpdateOperation");
      v92 = v95;
      v93 = -[SUSettingsStatefulUIManager auxiliaryOperations](v283, "auxiliaryOperations");
      v90 = v93;
      v91 = objc_msgSend(v90, "count");
      v88 = &v15;
      v89 = v285;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v285, (uint64_t)v225, (uint64_t)v147, v148, (uint64_t)v138, (uint64_t)v136, (uint64_t)v134, (uint64_t)v132, (uint64_t)v130, (uint64_t)v123, (uint64_t)v121, (uint64_t)v119, (uint64_t)v117, (uint64_t)v115, (uint64_t)v113, (uint64_t)v110, (uint64_t)v108, v101, v100,
        (uint64_t)v96,
        (uint64_t)v94,
        (uint64_t)v92,
        v91);
      _os_log_impl(&dword_21BF33000, v150, v151[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A refresh operation is already running. Skipping on this refresh request without transitioning to the Refreshing"
        "ScanResults state.",
        v89,
        0xDEu);

      if ((v246 & 1) != 0)
      if ((v250 & 1) != 0)

      if ((v252 & 1) != 0)
      if ((v254 & 1) != 0)

      if ((v256 & 1) != 0)
      if ((v258 & 1) != 0)

      objc_storeStrong(&v248, 0);
      objc_storeStrong(&v249, 0);
      objc_storeStrong(&v260, 0);
    }
    objc_storeStrong((id *)&v262, 0);
    v245 = 1;
  }
  else if (v283->_currentFullScanOperation)
  {
    v87 = -[SUSettingsStatefulUIManager log](v283, "log");
    v85 = v87;
    v86 = (id)objc_msgSend(v85, "oslog");
    v244 = (os_log_t)v86;

    v243 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
    {
      v82 = v244;
      *(_DWORD *)v83 = v243;
      v84 = -[SUSettingsStatefulUIManager currentState](v283, "currentState");
      v81 = SUSettingsUIStateToString(v84);
      v78 = v81;
      v79 = v78;
      v242 = v79;
      v80 = -[SUSettingsStatefulUIManager currentState](v283, "currentState");
      v240 = 0;
      v238 = 0;
      v77 = -[SUSettingsStatefulUIManager delegate](v283, "delegate");
      v76 = v77;
      if (v76)
      {
        v75 = -[SUSettingsStatefulUIManager delegate](v283, "delegate");
        v241 = v75;
        v240 = 1;
        v74 = (Class)objc_opt_class();
        v73 = NSStringFromClass(v74);
        v239 = v73;
        v238 = 1;
        v72 = (const __CFString *)v239;
      }
      else
      {
        v72 = CFSTR("(null)");
      }
      v70 = v72;
      v71 = -[SUSettingsStatefulUIManager delegate](v283, "delegate");
      v68 = v71;
      v69 = -[SUSettingsStatefulUIManager scanError](v283, "scanError");
      v66 = v69;
      v67 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](v283, "preferredStatefulDescriptor");
      v64 = v67;
      v65 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](v283, "alternateStatefulDescriptor");
      v62 = v65;
      v236 = 0;
      v234 = 0;
      v232 = 0;
      v63 = -[SUSettingsStatefulUIManager currentDownload](v283, "currentDownload");
      v61 = v63;
      if (v61)
      {
        v60 = -[SUSettingsStatefulUIManager currentDownload](v283, "currentDownload");
        v237 = v60;
        v236 = 1;
        v59 = (id)objc_msgSend(v237, "descriptor");
        v235 = v59;
        v234 = 1;
        v58 = (id)objc_msgSend(v235, "humanReadableUpdateName");
        v233 = v58;
        v232 = 1;
        v57 = (const __CFString *)v233;
      }
      else
      {
        v57 = CFSTR("(null)");
      }
      v55 = v57;
      v56 = -[SUSettingsStatefulUIManager currentDownload](v283, "currentDownload");
      v53 = v56;
      v54 = -[SUSettingsStatefulUIManager performThirdPartyScan](v283, "performThirdPartyScan");
      v11 = "YES";
      if (!v54)
        v11 = "NO";
      v51 = v11;
      v52 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v283, "isTargetedUpdateScheduledForAutoInstall");
      v12 = "YES";
      if (!v52)
        v12 = "NO";
      v49 = v12;
      v50 = -[SUSettingsStatefulUIManager hidingPreferredDescriptor](v283, "hidingPreferredDescriptor");
      v13 = "YES";
      if (!v50)
        v13 = "NO";
      v47 = v13;
      v48 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v283->_hiddenPreferredStatefulDescriptor, "humanReadableUpdateName");
      v44 = v48;
      v45 = v44;
      v231 = v45;
      v46 = -[SUSettingsStatefulUIManager hidingAlternateDescriptor](v283, "hidingAlternateDescriptor");
      v14 = "YES";
      if (!v46)
        v14 = "NO";
      v42 = v14;
      v43 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v283->_hiddenAlternateStatefulDescriptor, "humanReadableUpdateName");
      v39 = v43;
      v40 = v39;
      v230 = v40;
      v228 = 0;
      v41 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v283, "enrolledBetaProgram");
      v38 = v41;
      if (v38)
      {
        v37 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v283, "enrolledBetaProgram");
        v229 = v37;
        v228 = 1;
        v36 = objc_msgSend(v229, "programID");
        v35 = v36;
      }
      else
      {
        v35 = 0;
      }
      v33 = v35;
      v34 = -[SUSettingsStatefulUIManager betaPrograms](v283, "betaPrograms");
      v31 = v34;
      v32 = objc_msgSend(v31, "count");
      v30 = -[SUSettingsStatefulUIManager currentFullScanOperation](v283, "currentFullScanOperation");
      v28 = v30;
      v29 = -[SUSettingsStatefulUIManager currentRefreshScanOperation](v283, "currentRefreshScanOperation");
      v26 = v29;
      v27 = -[SUSettingsStatefulUIManager currentUpdateOperation](v283, "currentUpdateOperation");
      v24 = v27;
      v25 = -[SUSettingsStatefulUIManager auxiliaryOperations](v283, "auxiliaryOperations");
      v22 = v25;
      v23 = objc_msgSend(v22, "count");
      v20 = &v15;
      v21 = v284;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v284, (uint64_t)v225, (uint64_t)v79, v80, (uint64_t)v70, (uint64_t)v68, (uint64_t)v66, (uint64_t)v64, (uint64_t)v62, (uint64_t)v55, (uint64_t)v53, (uint64_t)v51, (uint64_t)v49, (uint64_t)v47, (uint64_t)v45, (uint64_t)v42, (uint64_t)v40, v33, v32,
        (uint64_t)v28,
        (uint64_t)v26,
        (uint64_t)v24,
        v23);
      _os_log_impl(&dword_21BF33000, v82, v83[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A full scan operation is already running. Skipping on this refresh requestwithout transitioning to the Refreshin"
        "gScanResults state.",
        v21,
        0xDEu);

      if ((v228 & 1) != 0)
      if ((v232 & 1) != 0)

      if ((v234 & 1) != 0)
      if ((v236 & 1) != 0)

      if ((v238 & 1) != 0)
      if ((v240 & 1) != 0)

      objc_storeStrong(&v230, 0);
      objc_storeStrong(&v231, 0);
      objc_storeStrong(&v242, 0);
    }
    objc_storeStrong((id *)&v244, 0);
    v245 = 1;
  }
  else
  {
    v19 = objc_alloc_init(SUSettingsStatefulUIManagerFSMParam);
    v227 = v19;
    -[SUSettingsStatefulUIManagerFSMParam setForceReload:](v19, "setForceReload:", v281);
    objc_msgSend(v227, "setRefreshHasAnyChanges:", 0);
    v18 = -[SUSettingsStatefulUIManager currentState](v283, "currentState");
    objc_msgSend(v227, "setRefreshPreviousState:", v18);
    v17 = -[SUSettingsStatefulUIManager managerFSM](v283, "managerFSM");
    v16 = v17;
    objc_msgSend(v16, "postEvent:withInfo:", CFSTR("RefreshScanResults"), v227);

    objc_storeStrong(&v227, 0);
    v245 = 0;
  }
  objc_sync_exit(obj);

}

- (void)checkForUpdatesInBackground
{
  objc_class *v2;
  BOOL v3;
  const char *v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  SUSettingsStatefulUIManager *v12;
  id v13;
  id obj;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint8_t *buf;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  const __CFString *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  id v37;
  id v38;
  int v39;
  id v40;
  int v41;
  const __CFString *v42;
  const __CFString *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  int v49;
  const __CFString *v50;
  os_log_t log;
  os_log_type_t v52[4];
  id v53;
  id v54;
  unint64_t v55;
  id v56;
  id v57;
  const char *v58;
  id location;
  char v60;
  id v61;
  id v62;
  id v63;
  char v64;
  id v65;
  char v66;
  id v67;
  char v68;
  id v69;
  char v70;
  id v71;
  char v72;
  id v73;
  id v74;
  os_log_type_t type;
  os_log_t oslog[2];
  SUSettingsStatefulUIManager *v77;
  _BYTE v78[232];
  uint64_t v79;

  v58 = "-[SUSettingsStatefulUIManager checkForUpdatesInBackground]";
  v79 = *MEMORY[0x24BDAC8D0];
  v77 = self;
  oslog[1] = (os_log_t)a2;
  v57 = -[SUSettingsStatefulUIManager log](self, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v57, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v52 = type;
    v53 = SUSettingsUIStateToString(-[SUSettingsStatefulUIManager currentState](v77, "currentState"));
    v54 = v53;
    v74 = v54;
    v55 = -[SUSettingsStatefulUIManager currentState](v77, "currentState");
    v56 = -[SUSettingsStatefulUIManager delegate](v77, "delegate");
    v72 = 0;
    v70 = 0;
    if (v56)
    {
      v73 = -[SUSettingsStatefulUIManager delegate](v77, "delegate");
      v49 = 1;
      v72 = 1;
      v2 = (objc_class *)objc_opt_class();
      v71 = NSStringFromClass(v2);
      v70 = 1;
      v50 = (const __CFString *)v71;
    }
    else
    {
      v50 = CFSTR("(null)");
    }
    v43 = v50;
    v44 = -[SUSettingsStatefulUIManager delegate](v77, "delegate");
    v45 = -[SUSettingsStatefulUIManager scanError](v77, "scanError");
    v46 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](v77, "preferredStatefulDescriptor");
    v47 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](v77, "alternateStatefulDescriptor");
    v48 = -[SUSettingsStatefulUIManager currentDownload](v77, "currentDownload");
    v68 = 0;
    v66 = 0;
    v64 = 0;
    if (v48)
    {
      v69 = -[SUSettingsStatefulUIManager currentDownload](v77, "currentDownload");
      v41 = 1;
      v68 = 1;
      v67 = (id)objc_msgSend(v69, "descriptor");
      v66 = 1;
      v65 = (id)objc_msgSend(v67, "humanReadableUpdateName");
      v64 = 1;
      v42 = (const __CFString *)v65;
    }
    else
    {
      v42 = CFSTR("(null)");
    }
    v27 = v42;
    v28 = -[SUSettingsStatefulUIManager currentDownload](v77, "currentDownload");
    v3 = -[SUSettingsStatefulUIManager performThirdPartyScan](v77, "performThirdPartyScan");
    v34 = "NO";
    v4 = "YES";
    v35 = "YES";
    v39 = 1;
    if (!v3)
      v4 = "NO";
    v29 = v4;
    v5 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v77, "isTargetedUpdateScheduledForAutoInstall");
    v6 = (uint64_t)v35;
    if (!v5)
      v6 = (uint64_t)v34;
    v30 = v6;
    v7 = -[SUSettingsStatefulUIManager hidingPreferredDescriptor](v77, "hidingPreferredDescriptor");
    v8 = (uint64_t)v35;
    if (!v7)
      v8 = (uint64_t)v34;
    v31 = v8;
    v32 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v77->_hiddenPreferredStatefulDescriptor, "humanReadableUpdateName");
    v33 = v32;
    v63 = v33;
    v9 = -[SUSettingsStatefulUIManager hidingAlternateDescriptor](v77, "hidingAlternateDescriptor");
    v10 = (uint64_t)v35;
    if (!v9)
      v10 = (uint64_t)v34;
    v36 = v10;
    v37 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v77->_hiddenAlternateStatefulDescriptor, "humanReadableUpdateName");
    v38 = v37;
    v62 = v38;
    v40 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v77, "enrolledBetaProgram");
    v60 = 0;
    if (v40)
    {
      v61 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v77, "enrolledBetaProgram");
      v60 = 1;
      v26 = objc_msgSend(v61, "programID");
    }
    else
    {
      v26 = 0;
    }
    v15 = v26;
    v25 = -[SUSettingsStatefulUIManager betaPrograms](v77, "betaPrograms");
    v16 = objc_msgSend(v25, "count");
    v24 = -[SUSettingsStatefulUIManager currentFullScanOperation](v77, "currentFullScanOperation");
    v23 = -[SUSettingsStatefulUIManager currentRefreshScanOperation](v77, "currentRefreshScanOperation");
    v22 = -[SUSettingsStatefulUIManager currentUpdateOperation](v77, "currentUpdateOperation");
    v21 = -[SUSettingsStatefulUIManager auxiliaryOperations](v77, "auxiliaryOperations");
    v17 = objc_msgSend(v21, "count");
    v20 = (id)-[SUCoreFSM copyCurrentState](v77->_managerFSM, "copyCurrentState");
    location = v20;
    v18 = &v11;
    buf = v78;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v78, (uint64_t)v58, (uint64_t)v54, v55, (uint64_t)v43, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, (uint64_t)v27, (uint64_t)v28, (uint64_t)v29, v30, v31, (uint64_t)v33, v36, (uint64_t)v38, v26, v16,
      (uint64_t)v24,
      (uint64_t)v23,
      (uint64_t)v22,
      v17,
      (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, v52[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Starting to perform a full-scan in the background with FSM state: %{public}@",
      buf,
      0xE8u);

    if ((v60 & 1) != 0)
    if ((v64 & 1) != 0)

    if ((v66 & 1) != 0)
    if ((v68 & 1) != 0)

    if ((v70 & 1) != 0)
    if ((v72 & 1) != 0)

    obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v62, obj);
    objc_storeStrong(&v63, obj);
    objc_storeStrong(&v74, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  v12 = v77;
  v13 = objc_alloc_init(SUSettingsStatefulUIManagerFSMParam);
  -[SUSettingsStatefulUIManager performFullScan:](v12, "performFullScan:");

}

- (BOOL)isTargetedUpdateScheduledForAutoInstall
{
  int v3;

  LOBYTE(v3) = 0;
  if (self->_isAutoUpdateScheduled)
  {
    LOBYTE(v3) = 0;
    if (self->_currentAutoInstallOperation)
    {
      LOBYTE(v3) = 0;
      if ((-[SUAutoInstallOperation isCanceled](self->_currentAutoInstallOperation, "isCanceled") & 1) == 0)
        v3 = -[SUAutoInstallOperation isExpired](self->_currentAutoInstallOperation, "isExpired") ^ 1;
    }
  }
  return v3 & 1;
}

- (BOOL)doesTargetedUpdateMatchDescriptorType:(unint64_t)a3
{
  SUSettingsStatefulDescriptor *v4;
  NSObject *log;
  os_log_type_t type;
  __CFString *v7;
  SUCoreLog *v8;
  char v9;
  SUSettingsStatefulDescriptor *v10;
  char v11;
  SUSettingsStatefulDescriptor *v12;
  __CFString *v13;
  char v14;
  id v15;
  unint64_t v16;
  SEL v17;
  SUSettingsStatefulUIManager *v18;
  char v19;
  uint8_t v20[40];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v18 = self;
  v17 = a2;
  v16 = a3;
  if (!a3 || v16 == 1)
  {
    v11 = 0;
    v9 = 0;
    if (v16)
    {
      v10 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](v18, "alternateStatefulDescriptor");
      v9 = 1;
      v4 = v10;
    }
    else
    {
      v12 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](v18, "preferredStatefulDescriptor");
      v11 = 1;
      v4 = v12;
    }
    v19 = -[SUSettingsStatefulUIManager doesTargetedUpdateMatchDescriptor:](v18, "doesTargetedUpdateMatchDescriptor:", v4);
    if ((v9 & 1) != 0)

    if ((v11 & 1) != 0)
  }
  else
  {
    v8 = -[SUSettingsStatefulUIManager log](v18, "log");
    v15 = (id)-[SUCoreLog oslog](v8, "oslog");

    v14 = 16;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      log = v15;
      type = v14;
      v7 = SUSettingsDescriptorTypeToString(v16);
      v13 = v7;
      __os_log_helper_16_2_3_8_32_8_64_8_0((uint64_t)v20, (uint64_t)"-[SUSettingsStatefulUIManager doesTargetedUpdateMatchDescriptorType:]", (uint64_t)v13, v16);
      _os_log_error_impl(&dword_21BF33000, log, type, "%s: The given descriptor type, %@ (%ld), is invalid.", v20, 0x20u);

      objc_storeStrong((id *)&v13, 0);
    }
    objc_storeStrong(&v15, 0);
    v19 = 0;
  }
  return v19 & 1;
}

- (BOOL)doesTargetedUpdateMatchDescriptor:(id)a3
{
  SUDownload *v4;
  char v5;
  char v6;
  id v7;
  char v8;
  SUDescriptor *v9;
  char v10;
  SUDownload *v11;
  id location[2];
  SUSettingsStatefulUIManager *v13;
  char v14;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[SUSettingsStatefulUIManager currentDownload](v13, "currentDownload");
  v10 = 0;
  v8 = 0;
  v6 = 0;
  v5 = 0;
  if (v4)
  {
    v11 = -[SUSettingsStatefulUIManager currentDownload](v13, "currentDownload");
    v10 = 1;
    v9 = -[SUDownload descriptor](v11, "descriptor");
    v8 = 1;
    v7 = (id)objc_msgSend(location[0], "descriptor");
    v6 = 1;
    v5 = -[SUDescriptor isEqual:](v9, "isEqual:");
  }
  v14 = v5 & 1;
  if ((v6 & 1) != 0)

  if ((v8 & 1) != 0)
  if ((v10 & 1) != 0)

  objc_storeStrong(location, 0);
  return v14 & 1;
}

- (id)targetedUpdateStatefulDescriptor
{
  return -[SUSettingsStatefulUIManager targetedUpdateForDownload:](self, "targetedUpdateForDownload:", self->_currentDownload, a2, self);
}

- (void)downloadUpdate:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6
{
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(NSObject *, void *);
  void *v13;
  SUSettingsStatefulUIManager *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  SUSettingsStatefulUIManager *v22;

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
  v9 = MEMORY[0x24BDAC760];
  v10 = -1073741824;
  v11 = 0;
  v12 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke;
  v13 = &unk_24DFF7C98;
  v14 = v22;
  v15 = location[0];
  v16 = v20;
  v17 = (id)MEMORY[0x220773A28]();
  -[SUSettingsStatefulUIManager beginUpdateOperationWithDescriptor:operationDelegate:delegateCallbackQueue:operationTypeBlock:](v22, "beginUpdateOperationWithDescriptor:operationDelegate:delegateCallbackQueue:operationTypeBlock:", location[0], v19, v18, v17);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke(NSObject *a1, void *a2)
{
  objc_class *v2;
  char v3;
  const char *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t isa;
  uint64_t v13;
  uint64_t *v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  id *v19;
  id *v20;
  id v21;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v24;
  id *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint8_t *buf;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  id v47;
  id v48;
  int v49;
  id v50;
  int v51;
  const __CFString *v52;
  const __CFString *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  int v59;
  const __CFString *v60;
  os_log_t log;
  os_log_type_t v62[4];
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  const char *v68;
  NSObject *v69;
  uint64_t v70;
  int v71;
  int v72;
  void (*v73)(NSObject *, char, id, void *);
  void *v74;
  _QWORD v75[3];
  int v76;
  uint64_t v77;
  int v78;
  int v79;
  void (*v80)(uint64_t);
  void *v81;
  objc_class *v82;
  char v83;
  id v84;
  id v85;
  id v86;
  char v87;
  id v88;
  char v89;
  id v90;
  char v91;
  id v92;
  char v93;
  id v94;
  char v95;
  id v96;
  id v97;
  os_log_type_t type;
  os_log_t oslog[2];
  id location[2];
  _BYTE v101[232];
  uint64_t v102;

  v69 = a1;
  v68 = "-[SUSettingsStatefulUIManager downloadUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke";
  v102 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = v69;
  v67 = (id)-[objc_class log](v69[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v67, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v62 = type;
    v63 = SUSettingsUIStateToString(-[objc_class currentState](v69[4].isa, "currentState"));
    v64 = v63;
    v97 = v64;
    v65 = -[objc_class currentState](v69[4].isa, "currentState");
    v66 = (id)-[objc_class delegate](v69[4].isa, "delegate");
    v95 = 0;
    v93 = 0;
    if (v66)
    {
      v96 = (id)-[objc_class delegate](v69[4].isa, "delegate");
      v59 = 1;
      v95 = 1;
      v2 = (objc_class *)objc_opt_class();
      v94 = NSStringFromClass(v2);
      v93 = 1;
      v60 = (const __CFString *)v94;
    }
    else
    {
      v60 = CFSTR("(null)");
    }
    v53 = v60;
    v54 = (id)-[objc_class delegate](v69[4].isa, "delegate");
    v55 = (id)-[objc_class scanError](v69[4].isa, "scanError");
    v56 = (id)-[objc_class preferredStatefulDescriptor](v69[4].isa, "preferredStatefulDescriptor");
    v57 = (id)-[objc_class alternateStatefulDescriptor](v69[4].isa, "alternateStatefulDescriptor");
    v58 = (id)-[objc_class currentDownload](v69[4].isa, "currentDownload");
    v91 = 0;
    v89 = 0;
    v87 = 0;
    if (v58)
    {
      v92 = (id)-[objc_class currentDownload](v69[4].isa, "currentDownload");
      v51 = 1;
      v91 = 1;
      v90 = (id)objc_msgSend(v92, "descriptor");
      v89 = 1;
      v88 = (id)objc_msgSend(v90, "humanReadableUpdateName");
      v87 = 1;
      v52 = (const __CFString *)v88;
    }
    else
    {
      v52 = CFSTR("(null)");
    }
    v37 = v52;
    v38 = (id)-[objc_class currentDownload](v69[4].isa, "currentDownload");
    v3 = -[objc_class performThirdPartyScan](v69[4].isa, "performThirdPartyScan");
    v44 = "NO";
    v4 = "YES";
    v45 = "YES";
    v49 = 1;
    if ((v3 & 1) == 0)
      v4 = "NO";
    v39 = v4;
    v5 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v69[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v6 = (uint64_t)v45;
    if ((v5 & 1) == 0)
      v6 = (uint64_t)v44;
    v40 = v6;
    v7 = -[objc_class hidingPreferredDescriptor](v69[4].isa, "hidingPreferredDescriptor");
    v8 = (uint64_t)v45;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v44;
    v41 = v8;
    v42 = (id)objc_msgSend(*((id *)v69[4].isa + 32), "humanReadableUpdateName");
    v43 = v42;
    v86 = v43;
    v9 = -[objc_class hidingAlternateDescriptor](v69[4].isa, "hidingAlternateDescriptor");
    v10 = (uint64_t)v45;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v44;
    v46 = v10;
    v47 = (id)objc_msgSend(*((id *)v69[4].isa + 33), "humanReadableUpdateName");
    v48 = v47;
    v85 = v48;
    v50 = (id)-[objc_class enrolledBetaProgram](v69[4].isa, "enrolledBetaProgram");
    v83 = 0;
    if (v50)
    {
      v84 = (id)-[objc_class enrolledBetaProgram](v69[4].isa, "enrolledBetaProgram");
      v83 = 1;
      v36 = objc_msgSend(v84, "programID");
    }
    else
    {
      v36 = 0;
    }
    v27 = v36;
    v35 = (id)-[objc_class betaPrograms](v69[4].isa, "betaPrograms");
    v28 = objc_msgSend(v35, "count");
    v34 = (id)-[objc_class currentFullScanOperation](v69[4].isa, "currentFullScanOperation");
    v33 = (id)-[objc_class currentRefreshScanOperation](v69[4].isa, "currentRefreshScanOperation");
    v32 = (id)-[objc_class currentUpdateOperation](v69[4].isa, "currentUpdateOperation");
    v31 = (id)-[objc_class auxiliaryOperations](v69[4].isa, "auxiliaryOperations");
    v11 = objc_msgSend(v31, "count");
    isa = (uint64_t)v69[5].isa;
    v29 = &v13;
    buf = v101;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v101, (uint64_t)v68, (uint64_t)v64, v65, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v43, v46, (uint64_t)v48, v36, v28,
      (uint64_t)v34,
      (uint64_t)v33,
      (uint64_t)v32,
      v11,
      isa);
    _os_log_impl(&dword_21BF33000, log, v62[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Starting to download (Download Only) the update: %{public}@",
      buf,
      0xE8u);

    if ((v83 & 1) != 0)
    if ((v87 & 1) != 0)

    if ((v89 & 1) != 0)
    if ((v91 & 1) != 0)

    if ((v93 & 1) != 0)
    if ((v95 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v85, 0);
    objc_storeStrong(&v86, obj);
    objc_storeStrong(&v97, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (location[0])
  {
    v15 = (id)*((_QWORD *)v69[4].isa + 25);
    v17 = (id)-[objc_class descriptor](v69[5].isa, "descriptor");
    v16 = (id)-[objc_class createUpdateOperationOptions](v69[4].isa, "createUpdateOperationOptions");
    v14 = &v70;
    v70 = MEMORY[0x24BDAC760];
    v71 = -1073741824;
    v72 = 0;
    v73 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2;
    v74 = &unk_24DFF7C70;
    v20 = (id *)v75;
    v75[0] = v69[4].isa;
    v19 = (id *)(v14 + 6);
    v75[2] = v69[6].isa;
    v18 = (id *)(v14 + 5);
    v75[1] = v69[5].isa;
    objc_msgSend(v15, "downloadUpdate:withOptions:completionHandler:", v17, v16, v14);

    v21 = 0;
    objc_storeStrong(v18, 0);
    objc_storeStrong(v19, v21);
    objc_storeStrong(v20, v21);
    v76 = 0;
  }
  else
  {
    if (v69[6].isa)
    {
      v24 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      queue = (dispatch_queue_t)(id)objc_msgSend(v24, "selectDelegateCallbackQueue:", *((_QWORD *)v69[4].isa + 5));
      block = &v77;
      v77 = MEMORY[0x24BDAC760];
      v78 = -1073741824;
      v79 = 0;
      v80 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_227;
      v81 = &unk_24DFF7BA8;
      v25 = (id *)&v82;
      v82 = v69[6].isa;
      dispatch_async(queue, block);

      objc_storeStrong(v25, 0);
    }
    v76 = 1;
  }
  objc_storeStrong(location, 0);
}

void __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_227(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAED98], 8102);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, 0, 0);

}

void __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2(NSObject *a1, char a2, id obj, void *a4)
{
  objc_class *v4;
  char v5;
  const char *v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int v16;
  id v17;
  int v18;
  id v19;
  id *v20;
  Class isa;
  id *v22;
  id *v23;
  id *v24;
  id *v25;
  id *v26;
  id v27;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v30;
  id *v31;
  id *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint8_t *buf;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  const __CFString *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  id v55;
  id v56;
  int v57;
  id v58;
  int v59;
  const __CFString *v60;
  const __CFString *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  int v67;
  const __CFString *v68;
  os_log_t log;
  os_log_type_t v70[4];
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  const char *v76;
  id obja;
  NSObject *v78;
  uint64_t v79;
  int v80;
  int v81;
  void (*v82)(NSObject *, char);
  void *v83;
  _QWORD v84[5];
  char v85;
  int v86;
  uint64_t v87;
  int v88;
  int v89;
  uint64_t (*v90)(uint64_t);
  void *v91;
  id v92;
  objc_class *v93;
  char v94;
  id v95;
  id v96;
  id v97;
  char v98;
  id v99;
  char v100;
  id v101;
  char v102;
  id v103;
  char v104;
  id v105;
  char v106;
  id v107;
  id v108;
  os_log_type_t type;
  os_log_t oslog[2];
  id v111;
  id location;
  unsigned __int8 v113;
  NSObject *v114;
  _BYTE v115[248];
  uint64_t v116;

  v78 = a1;
  obja = a4;
  v76 = "-[SUSettingsStatefulUIManager downloadUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke_2";
  v116 = *MEMORY[0x24BDAC8D0];
  v114 = a1;
  v113 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v111 = 0;
  objc_storeStrong(&v111, obja);
  oslog[1] = v78;
  v75 = (id)-[objc_class log](v78[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v75, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v70 = type;
    v71 = SUSettingsUIStateToString(-[objc_class currentState](v78[4].isa, "currentState"));
    v72 = v71;
    v108 = v72;
    v73 = -[objc_class currentState](v78[4].isa, "currentState");
    v74 = (id)-[objc_class delegate](v78[4].isa, "delegate");
    v106 = 0;
    v104 = 0;
    if (v74)
    {
      v107 = (id)-[objc_class delegate](v78[4].isa, "delegate");
      v67 = 1;
      v106 = 1;
      v4 = (objc_class *)objc_opt_class();
      v105 = NSStringFromClass(v4);
      v104 = 1;
      v68 = (const __CFString *)v105;
    }
    else
    {
      v68 = CFSTR("(null)");
    }
    v61 = v68;
    v62 = (id)-[objc_class delegate](v78[4].isa, "delegate");
    v63 = (id)-[objc_class scanError](v78[4].isa, "scanError");
    v64 = (id)-[objc_class preferredStatefulDescriptor](v78[4].isa, "preferredStatefulDescriptor");
    v65 = (id)-[objc_class alternateStatefulDescriptor](v78[4].isa, "alternateStatefulDescriptor");
    v66 = (id)-[objc_class currentDownload](v78[4].isa, "currentDownload");
    v102 = 0;
    v100 = 0;
    v98 = 0;
    if (v66)
    {
      v103 = (id)-[objc_class currentDownload](v78[4].isa, "currentDownload");
      v59 = 1;
      v102 = 1;
      v101 = (id)objc_msgSend(v103, "descriptor");
      v100 = 1;
      v99 = (id)objc_msgSend(v101, "humanReadableUpdateName");
      v98 = 1;
      v60 = (const __CFString *)v99;
    }
    else
    {
      v60 = CFSTR("(null)");
    }
    v45 = v60;
    v46 = (id)-[objc_class currentDownload](v78[4].isa, "currentDownload");
    v5 = -[objc_class performThirdPartyScan](v78[4].isa, "performThirdPartyScan");
    v52 = "NO";
    v6 = "YES";
    v53 = "YES";
    v57 = 1;
    if ((v5 & 1) == 0)
      v6 = "NO";
    v47 = v6;
    v7 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v78[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v8 = (uint64_t)v53;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v52;
    v48 = v8;
    v9 = -[objc_class hidingPreferredDescriptor](v78[4].isa, "hidingPreferredDescriptor");
    v10 = (uint64_t)v53;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v52;
    v49 = v10;
    v50 = (id)objc_msgSend(*((id *)v78[4].isa + 32), "humanReadableUpdateName");
    v51 = v50;
    v97 = v51;
    v11 = -[objc_class hidingAlternateDescriptor](v78[4].isa, "hidingAlternateDescriptor");
    v12 = (uint64_t)v53;
    if ((v11 & 1) == 0)
      v12 = (uint64_t)v52;
    v54 = v12;
    v55 = (id)objc_msgSend(*((id *)v78[4].isa + 33), "humanReadableUpdateName");
    v56 = v55;
    v96 = v56;
    v58 = (id)-[objc_class enrolledBetaProgram](v78[4].isa, "enrolledBetaProgram");
    v94 = 0;
    if (v58)
    {
      v95 = (id)-[objc_class enrolledBetaProgram](v78[4].isa, "enrolledBetaProgram");
      v94 = 1;
      v44 = objc_msgSend(v95, "programID");
    }
    else
    {
      v44 = 0;
    }
    v35 = v44;
    v43 = (id)-[objc_class betaPrograms](v78[4].isa, "betaPrograms");
    v36 = objc_msgSend(v43, "count");
    v42 = (id)-[objc_class currentFullScanOperation](v78[4].isa, "currentFullScanOperation");
    v41 = (id)-[objc_class currentRefreshScanOperation](v78[4].isa, "currentRefreshScanOperation");
    v40 = (id)-[objc_class currentUpdateOperation](v78[4].isa, "currentUpdateOperation");
    v39 = (id)-[objc_class auxiliaryOperations](v78[4].isa, "auxiliaryOperations");
    v13 = objc_msgSend(v39, "count");
    v37 = &v14;
    buf = v115;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_8_66((uint64_t)v115, (uint64_t)v76, (uint64_t)v72, v73, (uint64_t)v61, (uint64_t)v62, (uint64_t)v63, (uint64_t)v64, (uint64_t)v65, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, v48, v49, (uint64_t)v51, v54, (uint64_t)v56, v44, v36,
      (uint64_t)v42,
      (uint64_t)v41,
      (uint64_t)v40,
      v13,
      v113 & 1,
      (uint64_t)v111);
    _os_log_impl(&dword_21BF33000, log, v70[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Download (Download Only) operation completed with result: %d; error: %{public}@",
      buf,
      0xEEu);

    if ((v94 & 1) != 0)
    if ((v98 & 1) != 0)

    if ((v100 & 1) != 0)
    if ((v102 & 1) != 0)

    if ((v104 & 1) != 0)
    if ((v106 & 1) != 0)

    v34 = 0;
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, v34);
    objc_storeStrong(&v108, v34);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)v78[4].isa + 25, 0);
  if ((v113 & 1) != 0)
  {
    objc_storeStrong((id *)v78[4].isa + 13, location);
    isa = v78[4].isa;
    v16 = v113;
    v17 = location;
    v19 = v111;
    v20 = (id *)&v79;
    v79 = MEMORY[0x24BDAC760];
    v80 = -1073741824;
    v18 = 0;
    v81 = 0;
    v82 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_230;
    v83 = &unk_24DFF7C48;
    v26 = (id *)v84;
    v84[0] = v78[4].isa;
    v85 = v113 & 1;
    v25 = v20 + 8;
    v84[4] = v78[6].isa;
    v24 = v20 + 5;
    v84[1] = location;
    v23 = v20 + 6;
    v84[2] = v111;
    v22 = v20 + 7;
    v84[3] = v78[5].isa;
    v27 = 0;
    -[objc_class performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:](isa, "performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:", v16 & 1, v17, v18 & 1);
    objc_storeStrong(v22, v27);
    objc_storeStrong(v23, v27);
    objc_storeStrong(v24, v27);
    objc_storeStrong(v25, v27);
    objc_storeStrong(v26, v27);
    v86 = 0;
  }
  else
  {
    if (v78[6].isa)
    {
      v30 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      queue = (dispatch_queue_t)(id)objc_msgSend(v30, "selectDelegateCallbackQueue:", *((_QWORD *)v78[4].isa + 5));
      block = &v87;
      v87 = MEMORY[0x24BDAC760];
      v88 = -1073741824;
      v89 = 0;
      v90 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_229;
      v91 = &unk_24DFF7BD0;
      v32 = (id *)&v93;
      v93 = v78[6].isa;
      v31 = (id *)((char *)block + 32);
      v92 = v111;
      dispatch_async(queue, block);

      v33 = 0;
      objc_storeStrong(v31, 0);
      objc_storeStrong(v32, v33);
    }
    v86 = 1;
  }
  v15 = 0;
  objc_storeStrong(&v111, 0);
  objc_storeStrong(&location, v15);
}

uint64_t __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_229(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
}

void __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_230(NSObject *a1, char a2)
{
  objc_class *v2;
  char v3;
  const char *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char isa;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  Class v15;
  id *v16;
  id *v17;
  id *v18;
  id v19;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v22;
  id *v23;
  id *v24;
  id *v25;
  id v26;
  id obj;
  uint64_t *v28;
  uint8_t *buf;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  const __CFString *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  id v50;
  id v51;
  int v52;
  id v53;
  int v54;
  const __CFString *v55;
  const __CFString *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  int v62;
  const __CFString *v63;
  os_log_t log;
  os_log_type_t v65[4];
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  id v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  int v74;
  int v75;
  void (*v76)(uint64_t);
  void *v77;
  _QWORD v78[3];
  uint64_t v79;
  int v80;
  int v81;
  uint64_t (*v82)(uint64_t);
  void *v83;
  objc_class *v84;
  objc_class *v85;
  objc_class *v86;
  char v87;
  char v88;
  char v89;
  id v90;
  id location;
  id v92;
  char v93;
  id v94;
  char v95;
  id v96;
  char v97;
  id v98;
  char v99;
  id v100;
  char v101;
  id v102;
  id v103;
  os_log_type_t type;
  os_log_t oslog[2];
  unsigned __int8 v106;
  NSObject *v107;
  _BYTE v108[232];
  uint64_t v109;

  v71 = a1;
  v72 = "-[SUSettingsStatefulUIManager downloadUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke_2";
  v109 = *MEMORY[0x24BDAC8D0];
  v107 = a1;
  v106 = a2 & 1;
  oslog[1] = a1;
  v70 = (id)-[objc_class log](a1[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v70, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v65 = type;
    v66 = SUSettingsUIStateToString(-[objc_class currentState](v71[4].isa, "currentState"));
    v67 = v66;
    v103 = v67;
    v68 = -[objc_class currentState](v71[4].isa, "currentState");
    v69 = (id)-[objc_class delegate](v71[4].isa, "delegate");
    v101 = 0;
    v99 = 0;
    if (v69)
    {
      v102 = (id)-[objc_class delegate](v71[4].isa, "delegate");
      v62 = 1;
      v101 = 1;
      v2 = (objc_class *)objc_opt_class();
      v100 = NSStringFromClass(v2);
      v99 = 1;
      v63 = (const __CFString *)v100;
    }
    else
    {
      v63 = CFSTR("(null)");
    }
    v56 = v63;
    v57 = (id)-[objc_class delegate](v71[4].isa, "delegate");
    v58 = (id)-[objc_class scanError](v71[4].isa, "scanError");
    v59 = (id)-[objc_class preferredStatefulDescriptor](v71[4].isa, "preferredStatefulDescriptor");
    v60 = (id)-[objc_class alternateStatefulDescriptor](v71[4].isa, "alternateStatefulDescriptor");
    v61 = (id)-[objc_class currentDownload](v71[4].isa, "currentDownload");
    v97 = 0;
    v95 = 0;
    v93 = 0;
    if (v61)
    {
      v98 = (id)-[objc_class currentDownload](v71[4].isa, "currentDownload");
      v54 = 1;
      v97 = 1;
      v96 = (id)objc_msgSend(v98, "descriptor");
      v95 = 1;
      v94 = (id)objc_msgSend(v96, "humanReadableUpdateName");
      v93 = 1;
      v55 = (const __CFString *)v94;
    }
    else
    {
      v55 = CFSTR("(null)");
    }
    v40 = v55;
    v41 = (id)-[objc_class currentDownload](v71[4].isa, "currentDownload");
    v3 = -[objc_class performThirdPartyScan](v71[4].isa, "performThirdPartyScan");
    v47 = "NO";
    v4 = "YES";
    v48 = "YES";
    v52 = 1;
    if ((v3 & 1) == 0)
      v4 = "NO";
    v42 = v4;
    v5 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v71[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v6 = (uint64_t)v48;
    if ((v5 & 1) == 0)
      v6 = (uint64_t)v47;
    v43 = v6;
    v7 = -[objc_class hidingPreferredDescriptor](v71[4].isa, "hidingPreferredDescriptor");
    v8 = (uint64_t)v48;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v47;
    v44 = v8;
    v45 = (id)objc_msgSend(*((id *)v71[4].isa + 32), "humanReadableUpdateName");
    v46 = v45;
    v92 = v46;
    v9 = -[objc_class hidingAlternateDescriptor](v71[4].isa, "hidingAlternateDescriptor");
    v10 = (uint64_t)v48;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v47;
    v49 = v10;
    v50 = (id)objc_msgSend(*((id *)v71[4].isa + 33), "humanReadableUpdateName");
    v51 = v50;
    location = v51;
    v53 = (id)-[objc_class enrolledBetaProgram](v71[4].isa, "enrolledBetaProgram");
    v89 = 0;
    if (v53)
    {
      v90 = (id)-[objc_class enrolledBetaProgram](v71[4].isa, "enrolledBetaProgram");
      v89 = 1;
      v39 = objc_msgSend(v90, "programID");
    }
    else
    {
      v39 = 0;
    }
    v30 = v39;
    v31 = (id)-[objc_class betaPrograms](v71[4].isa, "betaPrograms");
    v32 = objc_msgSend(v31, "count");
    v33 = (id)-[objc_class currentFullScanOperation](v71[4].isa, "currentFullScanOperation");
    v34 = (id)-[objc_class currentRefreshScanOperation](v71[4].isa, "currentRefreshScanOperation");
    v35 = (id)-[objc_class currentUpdateOperation](v71[4].isa, "currentUpdateOperation");
    v36 = (id)-[objc_class auxiliaryOperations](v71[4].isa, "auxiliaryOperations");
    v37 = objc_msgSend(v36, "count");
    isa = (char)v71[9].isa;
    v38 = 0;
    if ((isa & 1) != 0)
      v38 = v106;
    v28 = &v12;
    buf = v108;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0((uint64_t)v108, (uint64_t)v72, (uint64_t)v67, v68, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v40, (uint64_t)v41, (uint64_t)v42, v43, v44, (uint64_t)v46, v49, (uint64_t)v51, v30, v32,
      (uint64_t)v33,
      (uint64_t)v34,
      (uint64_t)v35,
      v37,
      v38 & 1);
    _os_log_impl(&dword_21BF33000, log, v65[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform an update of type \"Download Only\" with result: %d",
      buf,
      0xE4u);

    if ((v89 & 1) != 0)
    if ((v93 & 1) != 0)

    if ((v95 & 1) != 0)
    if ((v97 & 1) != 0)

    if ((v99 & 1) != 0)
    if ((v101 & 1) != 0)

    obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v92, obj);
    objc_storeStrong(&v103, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v71[8].isa)
  {
    v22 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    queue = (dispatch_queue_t)(id)objc_msgSend(v22, "selectDelegateCallbackQueue:", *((_QWORD *)v71[4].isa + 5));
    block = &v79;
    v79 = MEMORY[0x24BDAC760];
    v80 = -1073741824;
    v81 = 0;
    v82 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_231;
    v83 = &unk_24DFF7BF8;
    v25 = (id *)&v86;
    v86 = v71[8].isa;
    v87 = (uint64_t)v71[9].isa & 1;
    v88 = v106 & 1;
    v24 = (id *)((char *)block + 32);
    v84 = v71[5].isa;
    v23 = (id *)((char *)block + 40);
    v85 = v71[6].isa;
    dispatch_async(queue, block);

    v26 = 0;
    objc_storeStrong(v23, 0);
    objc_storeStrong(v24, v26);
    objc_storeStrong(v25, v26);
  }
  v15 = v71[4].isa;
  v13 = sel_statefulUIManager_didStartDownloadForDescriptor_withDownload_;
  v14 = &v73;
  v73 = MEMORY[0x24BDAC760];
  v74 = -1073741824;
  v75 = 0;
  v76 = __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_234;
  v77 = &unk_24DFF7C20;
  v18 = (id *)v78;
  v78[0] = v71[4].isa;
  v17 = (id *)(v14 + 5);
  v78[1] = v71[7].isa;
  v16 = (id *)(v14 + 6);
  v78[2] = v71[5].isa;
  -[objc_class executeOperationOnDelegate:usingBlock:](v15, "executeOperationOnDelegate:usingBlock:", v13, v14);
  v19 = 0;
  objc_storeStrong(v16, 0);
  objc_storeStrong(v17, v19);
  objc_storeStrong(v18, v19);
}

uint64_t __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_231(uint64_t a1)
{
  char v2;

  v2 = 0;
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    v2 = *(_BYTE *)(a1 + 57);
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v2 & 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __104__SUSettingsStatefulUIManager_downloadUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_234(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManager:didStartDownloadForDescriptor:withDownload:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)downloadAndInstall:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6
{
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(NSObject *, void *);
  void *v13;
  SUSettingsStatefulUIManager *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  SUSettingsStatefulUIManager *v22;

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
  v9 = MEMORY[0x24BDAC760];
  v10 = -1073741824;
  v11 = 0;
  v12 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke;
  v13 = &unk_24DFF7C98;
  v14 = v22;
  v15 = location[0];
  v16 = v20;
  v17 = (id)MEMORY[0x220773A28]();
  -[SUSettingsStatefulUIManager beginUpdateOperationWithDescriptor:operationDelegate:delegateCallbackQueue:operationTypeBlock:](v22, "beginUpdateOperationWithDescriptor:operationDelegate:delegateCallbackQueue:operationTypeBlock:", location[0], v19, v18, v17);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke(NSObject *a1, void *a2)
{
  objc_class *v2;
  char v3;
  const char *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t isa;
  uint64_t v13;
  uint64_t *v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  id *v19;
  id *v20;
  id v21;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v24;
  id *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint8_t *buf;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  id v47;
  id v48;
  int v49;
  id v50;
  int v51;
  const __CFString *v52;
  const __CFString *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  int v59;
  const __CFString *v60;
  os_log_t log;
  os_log_type_t v62[4];
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  const char *v68;
  NSObject *v69;
  uint64_t v70;
  int v71;
  int v72;
  void (*v73)(NSObject *, char, id, void *);
  void *v74;
  _QWORD v75[3];
  int v76;
  uint64_t v77;
  int v78;
  int v79;
  void (*v80)(uint64_t);
  void *v81;
  objc_class *v82;
  char v83;
  id v84;
  id v85;
  id v86;
  char v87;
  id v88;
  char v89;
  id v90;
  char v91;
  id v92;
  char v93;
  id v94;
  char v95;
  id v96;
  id v97;
  os_log_type_t type;
  os_log_t oslog[2];
  id location[2];
  _BYTE v101[232];
  uint64_t v102;

  v69 = a1;
  v68 = "-[SUSettingsStatefulUIManager downloadAndInstall:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke";
  v102 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = v69;
  v67 = (id)-[objc_class log](v69[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v67, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v62 = type;
    v63 = SUSettingsUIStateToString(-[objc_class currentState](v69[4].isa, "currentState"));
    v64 = v63;
    v97 = v64;
    v65 = -[objc_class currentState](v69[4].isa, "currentState");
    v66 = (id)-[objc_class delegate](v69[4].isa, "delegate");
    v95 = 0;
    v93 = 0;
    if (v66)
    {
      v96 = (id)-[objc_class delegate](v69[4].isa, "delegate");
      v59 = 1;
      v95 = 1;
      v2 = (objc_class *)objc_opt_class();
      v94 = NSStringFromClass(v2);
      v93 = 1;
      v60 = (const __CFString *)v94;
    }
    else
    {
      v60 = CFSTR("(null)");
    }
    v53 = v60;
    v54 = (id)-[objc_class delegate](v69[4].isa, "delegate");
    v55 = (id)-[objc_class scanError](v69[4].isa, "scanError");
    v56 = (id)-[objc_class preferredStatefulDescriptor](v69[4].isa, "preferredStatefulDescriptor");
    v57 = (id)-[objc_class alternateStatefulDescriptor](v69[4].isa, "alternateStatefulDescriptor");
    v58 = (id)-[objc_class currentDownload](v69[4].isa, "currentDownload");
    v91 = 0;
    v89 = 0;
    v87 = 0;
    if (v58)
    {
      v92 = (id)-[objc_class currentDownload](v69[4].isa, "currentDownload");
      v51 = 1;
      v91 = 1;
      v90 = (id)objc_msgSend(v92, "descriptor");
      v89 = 1;
      v88 = (id)objc_msgSend(v90, "humanReadableUpdateName");
      v87 = 1;
      v52 = (const __CFString *)v88;
    }
    else
    {
      v52 = CFSTR("(null)");
    }
    v37 = v52;
    v38 = (id)-[objc_class currentDownload](v69[4].isa, "currentDownload");
    v3 = -[objc_class performThirdPartyScan](v69[4].isa, "performThirdPartyScan");
    v44 = "NO";
    v4 = "YES";
    v45 = "YES";
    v49 = 1;
    if ((v3 & 1) == 0)
      v4 = "NO";
    v39 = v4;
    v5 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v69[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v6 = (uint64_t)v45;
    if ((v5 & 1) == 0)
      v6 = (uint64_t)v44;
    v40 = v6;
    v7 = -[objc_class hidingPreferredDescriptor](v69[4].isa, "hidingPreferredDescriptor");
    v8 = (uint64_t)v45;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v44;
    v41 = v8;
    v42 = (id)objc_msgSend(*((id *)v69[4].isa + 32), "humanReadableUpdateName");
    v43 = v42;
    v86 = v43;
    v9 = -[objc_class hidingAlternateDescriptor](v69[4].isa, "hidingAlternateDescriptor");
    v10 = (uint64_t)v45;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v44;
    v46 = v10;
    v47 = (id)objc_msgSend(*((id *)v69[4].isa + 33), "humanReadableUpdateName");
    v48 = v47;
    v85 = v48;
    v50 = (id)-[objc_class enrolledBetaProgram](v69[4].isa, "enrolledBetaProgram");
    v83 = 0;
    if (v50)
    {
      v84 = (id)-[objc_class enrolledBetaProgram](v69[4].isa, "enrolledBetaProgram");
      v83 = 1;
      v36 = objc_msgSend(v84, "programID");
    }
    else
    {
      v36 = 0;
    }
    v27 = v36;
    v35 = (id)-[objc_class betaPrograms](v69[4].isa, "betaPrograms");
    v28 = objc_msgSend(v35, "count");
    v34 = (id)-[objc_class currentFullScanOperation](v69[4].isa, "currentFullScanOperation");
    v33 = (id)-[objc_class currentRefreshScanOperation](v69[4].isa, "currentRefreshScanOperation");
    v32 = (id)-[objc_class currentUpdateOperation](v69[4].isa, "currentUpdateOperation");
    v31 = (id)-[objc_class auxiliaryOperations](v69[4].isa, "auxiliaryOperations");
    v11 = objc_msgSend(v31, "count");
    isa = (uint64_t)v69[5].isa;
    v29 = &v13;
    buf = v101;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v101, (uint64_t)v68, (uint64_t)v64, v65, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v43, v46, (uint64_t)v48, v36, v28,
      (uint64_t)v34,
      (uint64_t)v33,
      (uint64_t)v32,
      v11,
      isa);
    _os_log_impl(&dword_21BF33000, log, v62[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Starting to download and install (Update Now) the update: %{public}@",
      buf,
      0xE8u);

    if ((v83 & 1) != 0)
    if ((v87 & 1) != 0)

    if ((v89 & 1) != 0)
    if ((v91 & 1) != 0)

    if ((v93 & 1) != 0)
    if ((v95 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v85, 0);
    objc_storeStrong(&v86, obj);
    objc_storeStrong(&v97, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (location[0])
  {
    v15 = (id)*((_QWORD *)v69[4].isa + 25);
    v17 = (id)-[objc_class descriptor](v69[5].isa, "descriptor");
    v16 = (id)-[objc_class createUpdateOperationOptions](v69[4].isa, "createUpdateOperationOptions");
    v14 = &v70;
    v70 = MEMORY[0x24BDAC760];
    v71 = -1073741824;
    v72 = 0;
    v73 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2;
    v74 = &unk_24DFF7C70;
    v20 = (id *)v75;
    v75[0] = v69[4].isa;
    v19 = (id *)(v14 + 6);
    v75[2] = v69[6].isa;
    v18 = (id *)(v14 + 5);
    v75[1] = v69[5].isa;
    objc_msgSend(v15, "downloadAndInstall:withOptions:completionHandler:", v17, v16, v14);

    v21 = 0;
    objc_storeStrong(v18, 0);
    objc_storeStrong(v19, v21);
    objc_storeStrong(v20, v21);
    v76 = 0;
  }
  else
  {
    if (v69[6].isa)
    {
      v24 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      queue = (dispatch_queue_t)(id)objc_msgSend(v24, "selectDelegateCallbackQueue:", *((_QWORD *)v69[4].isa + 5));
      block = &v77;
      v77 = MEMORY[0x24BDAC760];
      v78 = -1073741824;
      v79 = 0;
      v80 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_238;
      v81 = &unk_24DFF7BA8;
      v25 = (id *)&v82;
      v82 = v69[6].isa;
      dispatch_async(queue, block);

      objc_storeStrong(v25, 0);
    }
    v76 = 1;
  }
  objc_storeStrong(location, 0);
}

void __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_238(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAED98], 8102);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, 0, 0);

}

void __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2(NSObject *a1, char a2, id obj, void *a4)
{
  objc_class *v4;
  char v5;
  const char *v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int v16;
  id v17;
  int v18;
  id v19;
  id *v20;
  Class isa;
  id *v22;
  id *v23;
  id *v24;
  id *v25;
  id *v26;
  id v27;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v30;
  id *v31;
  id *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint8_t *buf;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  const __CFString *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  id v55;
  id v56;
  int v57;
  id v58;
  int v59;
  const __CFString *v60;
  const __CFString *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  int v67;
  const __CFString *v68;
  os_log_t log;
  os_log_type_t v70[4];
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  const char *v76;
  id obja;
  NSObject *v78;
  uint64_t v79;
  int v80;
  int v81;
  void (*v82)(NSObject *, char);
  void *v83;
  _QWORD v84[5];
  char v85;
  int v86;
  uint64_t v87;
  int v88;
  int v89;
  uint64_t (*v90)(uint64_t);
  void *v91;
  id v92;
  objc_class *v93;
  char v94;
  id v95;
  id v96;
  id v97;
  char v98;
  id v99;
  char v100;
  id v101;
  char v102;
  id v103;
  char v104;
  id v105;
  char v106;
  id v107;
  id v108;
  os_log_type_t type;
  os_log_t oslog[2];
  id v111;
  id location;
  unsigned __int8 v113;
  NSObject *v114;
  _BYTE v115[248];
  uint64_t v116;

  v78 = a1;
  obja = a4;
  v76 = "-[SUSettingsStatefulUIManager downloadAndInstall:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke_2";
  v116 = *MEMORY[0x24BDAC8D0];
  v114 = a1;
  v113 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v111 = 0;
  objc_storeStrong(&v111, obja);
  oslog[1] = v78;
  v75 = (id)-[objc_class log](v78[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v75, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v70 = type;
    v71 = SUSettingsUIStateToString(-[objc_class currentState](v78[4].isa, "currentState"));
    v72 = v71;
    v108 = v72;
    v73 = -[objc_class currentState](v78[4].isa, "currentState");
    v74 = (id)-[objc_class delegate](v78[4].isa, "delegate");
    v106 = 0;
    v104 = 0;
    if (v74)
    {
      v107 = (id)-[objc_class delegate](v78[4].isa, "delegate");
      v67 = 1;
      v106 = 1;
      v4 = (objc_class *)objc_opt_class();
      v105 = NSStringFromClass(v4);
      v104 = 1;
      v68 = (const __CFString *)v105;
    }
    else
    {
      v68 = CFSTR("(null)");
    }
    v61 = v68;
    v62 = (id)-[objc_class delegate](v78[4].isa, "delegate");
    v63 = (id)-[objc_class scanError](v78[4].isa, "scanError");
    v64 = (id)-[objc_class preferredStatefulDescriptor](v78[4].isa, "preferredStatefulDescriptor");
    v65 = (id)-[objc_class alternateStatefulDescriptor](v78[4].isa, "alternateStatefulDescriptor");
    v66 = (id)-[objc_class currentDownload](v78[4].isa, "currentDownload");
    v102 = 0;
    v100 = 0;
    v98 = 0;
    if (v66)
    {
      v103 = (id)-[objc_class currentDownload](v78[4].isa, "currentDownload");
      v59 = 1;
      v102 = 1;
      v101 = (id)objc_msgSend(v103, "descriptor");
      v100 = 1;
      v99 = (id)objc_msgSend(v101, "humanReadableUpdateName");
      v98 = 1;
      v60 = (const __CFString *)v99;
    }
    else
    {
      v60 = CFSTR("(null)");
    }
    v45 = v60;
    v46 = (id)-[objc_class currentDownload](v78[4].isa, "currentDownload");
    v5 = -[objc_class performThirdPartyScan](v78[4].isa, "performThirdPartyScan");
    v52 = "NO";
    v6 = "YES";
    v53 = "YES";
    v57 = 1;
    if ((v5 & 1) == 0)
      v6 = "NO";
    v47 = v6;
    v7 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v78[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v8 = (uint64_t)v53;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v52;
    v48 = v8;
    v9 = -[objc_class hidingPreferredDescriptor](v78[4].isa, "hidingPreferredDescriptor");
    v10 = (uint64_t)v53;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v52;
    v49 = v10;
    v50 = (id)objc_msgSend(*((id *)v78[4].isa + 32), "humanReadableUpdateName");
    v51 = v50;
    v97 = v51;
    v11 = -[objc_class hidingAlternateDescriptor](v78[4].isa, "hidingAlternateDescriptor");
    v12 = (uint64_t)v53;
    if ((v11 & 1) == 0)
      v12 = (uint64_t)v52;
    v54 = v12;
    v55 = (id)objc_msgSend(*((id *)v78[4].isa + 33), "humanReadableUpdateName");
    v56 = v55;
    v96 = v56;
    v58 = (id)-[objc_class enrolledBetaProgram](v78[4].isa, "enrolledBetaProgram");
    v94 = 0;
    if (v58)
    {
      v95 = (id)-[objc_class enrolledBetaProgram](v78[4].isa, "enrolledBetaProgram");
      v94 = 1;
      v44 = objc_msgSend(v95, "programID");
    }
    else
    {
      v44 = 0;
    }
    v35 = v44;
    v43 = (id)-[objc_class betaPrograms](v78[4].isa, "betaPrograms");
    v36 = objc_msgSend(v43, "count");
    v42 = (id)-[objc_class currentFullScanOperation](v78[4].isa, "currentFullScanOperation");
    v41 = (id)-[objc_class currentRefreshScanOperation](v78[4].isa, "currentRefreshScanOperation");
    v40 = (id)-[objc_class currentUpdateOperation](v78[4].isa, "currentUpdateOperation");
    v39 = (id)-[objc_class auxiliaryOperations](v78[4].isa, "auxiliaryOperations");
    v13 = objc_msgSend(v39, "count");
    v37 = &v14;
    buf = v115;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_8_66((uint64_t)v115, (uint64_t)v76, (uint64_t)v72, v73, (uint64_t)v61, (uint64_t)v62, (uint64_t)v63, (uint64_t)v64, (uint64_t)v65, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, v48, v49, (uint64_t)v51, v54, (uint64_t)v56, v44, v36,
      (uint64_t)v42,
      (uint64_t)v41,
      (uint64_t)v40,
      v13,
      v113 & 1,
      (uint64_t)v111);
    _os_log_impl(&dword_21BF33000, log, v70[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Download and Install (Update Now) operation completed with result: %d; error: %{public}@",
      buf,
      0xEEu);

    if ((v94 & 1) != 0)
    if ((v98 & 1) != 0)

    if ((v100 & 1) != 0)
    if ((v102 & 1) != 0)

    if ((v104 & 1) != 0)
    if ((v106 & 1) != 0)

    v34 = 0;
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, v34);
    objc_storeStrong(&v108, v34);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)v78[4].isa + 25, 0);
  if ((v113 & 1) != 0)
  {
    objc_storeStrong((id *)v78[4].isa + 13, location);
    isa = v78[4].isa;
    v16 = v113;
    v17 = location;
    v19 = v111;
    v20 = (id *)&v79;
    v79 = MEMORY[0x24BDAC760];
    v80 = -1073741824;
    v18 = 0;
    v81 = 0;
    v82 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_240;
    v83 = &unk_24DFF7C48;
    v26 = (id *)v84;
    v84[0] = v78[4].isa;
    v85 = v113 & 1;
    v25 = v20 + 8;
    v84[4] = v78[6].isa;
    v24 = v20 + 5;
    v84[1] = location;
    v23 = v20 + 6;
    v84[2] = v111;
    v22 = v20 + 7;
    v84[3] = v78[5].isa;
    v27 = 0;
    -[objc_class performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:](isa, "performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:", v16 & 1, v17, v18 & 1);
    objc_storeStrong(v22, v27);
    objc_storeStrong(v23, v27);
    objc_storeStrong(v24, v27);
    objc_storeStrong(v25, v27);
    objc_storeStrong(v26, v27);
    v86 = 0;
  }
  else
  {
    if (v78[6].isa)
    {
      v30 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      queue = (dispatch_queue_t)(id)objc_msgSend(v30, "selectDelegateCallbackQueue:", *((_QWORD *)v78[4].isa + 5));
      block = &v87;
      v87 = MEMORY[0x24BDAC760];
      v88 = -1073741824;
      v89 = 0;
      v90 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_239;
      v91 = &unk_24DFF7BD0;
      v32 = (id *)&v93;
      v93 = v78[6].isa;
      v31 = (id *)((char *)block + 32);
      v92 = v111;
      dispatch_async(queue, block);

      v33 = 0;
      objc_storeStrong(v31, 0);
      objc_storeStrong(v32, v33);
    }
    v86 = 1;
  }
  v15 = 0;
  objc_storeStrong(&v111, 0);
  objc_storeStrong(&location, v15);
}

uint64_t __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_239(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
}

void __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_240(NSObject *a1, char a2)
{
  objc_class *v2;
  char v3;
  const char *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char isa;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  Class v15;
  id *v16;
  id *v17;
  id *v18;
  id v19;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v22;
  id *v23;
  id *v24;
  id *v25;
  id v26;
  id obj;
  uint64_t *v28;
  uint8_t *buf;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  const __CFString *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  id v50;
  id v51;
  int v52;
  id v53;
  int v54;
  const __CFString *v55;
  const __CFString *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  int v62;
  const __CFString *v63;
  os_log_t log;
  os_log_type_t v65[4];
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  id v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  int v74;
  int v75;
  void (*v76)(uint64_t);
  void *v77;
  _QWORD v78[3];
  uint64_t v79;
  int v80;
  int v81;
  uint64_t (*v82)(uint64_t);
  void *v83;
  objc_class *v84;
  objc_class *v85;
  objc_class *v86;
  char v87;
  char v88;
  char v89;
  id v90;
  id location;
  id v92;
  char v93;
  id v94;
  char v95;
  id v96;
  char v97;
  id v98;
  char v99;
  id v100;
  char v101;
  id v102;
  id v103;
  os_log_type_t type;
  os_log_t oslog[2];
  unsigned __int8 v106;
  NSObject *v107;
  _BYTE v108[232];
  uint64_t v109;

  v71 = a1;
  v72 = "-[SUSettingsStatefulUIManager downloadAndInstall:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke_2";
  v109 = *MEMORY[0x24BDAC8D0];
  v107 = a1;
  v106 = a2 & 1;
  oslog[1] = a1;
  v70 = (id)-[objc_class log](a1[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v70, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v65 = type;
    v66 = SUSettingsUIStateToString(-[objc_class currentState](v71[4].isa, "currentState"));
    v67 = v66;
    v103 = v67;
    v68 = -[objc_class currentState](v71[4].isa, "currentState");
    v69 = (id)-[objc_class delegate](v71[4].isa, "delegate");
    v101 = 0;
    v99 = 0;
    if (v69)
    {
      v102 = (id)-[objc_class delegate](v71[4].isa, "delegate");
      v62 = 1;
      v101 = 1;
      v2 = (objc_class *)objc_opt_class();
      v100 = NSStringFromClass(v2);
      v99 = 1;
      v63 = (const __CFString *)v100;
    }
    else
    {
      v63 = CFSTR("(null)");
    }
    v56 = v63;
    v57 = (id)-[objc_class delegate](v71[4].isa, "delegate");
    v58 = (id)-[objc_class scanError](v71[4].isa, "scanError");
    v59 = (id)-[objc_class preferredStatefulDescriptor](v71[4].isa, "preferredStatefulDescriptor");
    v60 = (id)-[objc_class alternateStatefulDescriptor](v71[4].isa, "alternateStatefulDescriptor");
    v61 = (id)-[objc_class currentDownload](v71[4].isa, "currentDownload");
    v97 = 0;
    v95 = 0;
    v93 = 0;
    if (v61)
    {
      v98 = (id)-[objc_class currentDownload](v71[4].isa, "currentDownload");
      v54 = 1;
      v97 = 1;
      v96 = (id)objc_msgSend(v98, "descriptor");
      v95 = 1;
      v94 = (id)objc_msgSend(v96, "humanReadableUpdateName");
      v93 = 1;
      v55 = (const __CFString *)v94;
    }
    else
    {
      v55 = CFSTR("(null)");
    }
    v40 = v55;
    v41 = (id)-[objc_class currentDownload](v71[4].isa, "currentDownload");
    v3 = -[objc_class performThirdPartyScan](v71[4].isa, "performThirdPartyScan");
    v47 = "NO";
    v4 = "YES";
    v48 = "YES";
    v52 = 1;
    if ((v3 & 1) == 0)
      v4 = "NO";
    v42 = v4;
    v5 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v71[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v6 = (uint64_t)v48;
    if ((v5 & 1) == 0)
      v6 = (uint64_t)v47;
    v43 = v6;
    v7 = -[objc_class hidingPreferredDescriptor](v71[4].isa, "hidingPreferredDescriptor");
    v8 = (uint64_t)v48;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v47;
    v44 = v8;
    v45 = (id)objc_msgSend(*((id *)v71[4].isa + 32), "humanReadableUpdateName");
    v46 = v45;
    v92 = v46;
    v9 = -[objc_class hidingAlternateDescriptor](v71[4].isa, "hidingAlternateDescriptor");
    v10 = (uint64_t)v48;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v47;
    v49 = v10;
    v50 = (id)objc_msgSend(*((id *)v71[4].isa + 33), "humanReadableUpdateName");
    v51 = v50;
    location = v51;
    v53 = (id)-[objc_class enrolledBetaProgram](v71[4].isa, "enrolledBetaProgram");
    v89 = 0;
    if (v53)
    {
      v90 = (id)-[objc_class enrolledBetaProgram](v71[4].isa, "enrolledBetaProgram");
      v89 = 1;
      v39 = objc_msgSend(v90, "programID");
    }
    else
    {
      v39 = 0;
    }
    v30 = v39;
    v31 = (id)-[objc_class betaPrograms](v71[4].isa, "betaPrograms");
    v32 = objc_msgSend(v31, "count");
    v33 = (id)-[objc_class currentFullScanOperation](v71[4].isa, "currentFullScanOperation");
    v34 = (id)-[objc_class currentRefreshScanOperation](v71[4].isa, "currentRefreshScanOperation");
    v35 = (id)-[objc_class currentUpdateOperation](v71[4].isa, "currentUpdateOperation");
    v36 = (id)-[objc_class auxiliaryOperations](v71[4].isa, "auxiliaryOperations");
    v37 = objc_msgSend(v36, "count");
    isa = (char)v71[9].isa;
    v38 = 0;
    if ((isa & 1) != 0)
      v38 = v106;
    v28 = &v12;
    buf = v108;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0((uint64_t)v108, (uint64_t)v72, (uint64_t)v67, v68, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v40, (uint64_t)v41, (uint64_t)v42, v43, v44, (uint64_t)v46, v49, (uint64_t)v51, v30, v32,
      (uint64_t)v33,
      (uint64_t)v34,
      (uint64_t)v35,
      v37,
      v38 & 1);
    _os_log_impl(&dword_21BF33000, log, v65[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform an update of type \"Update Now\" with result: %d",
      buf,
      0xE4u);

    if ((v89 & 1) != 0)
    if ((v93 & 1) != 0)

    if ((v95 & 1) != 0)
    if ((v97 & 1) != 0)

    if ((v99 & 1) != 0)
    if ((v101 & 1) != 0)

    obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v92, obj);
    objc_storeStrong(&v103, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v71[8].isa)
  {
    v22 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    queue = (dispatch_queue_t)(id)objc_msgSend(v22, "selectDelegateCallbackQueue:", *((_QWORD *)v71[4].isa + 5));
    block = &v79;
    v79 = MEMORY[0x24BDAC760];
    v80 = -1073741824;
    v81 = 0;
    v82 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_241;
    v83 = &unk_24DFF7BF8;
    v25 = (id *)&v86;
    v86 = v71[8].isa;
    v87 = (uint64_t)v71[9].isa & 1;
    v88 = v106 & 1;
    v24 = (id *)((char *)block + 32);
    v84 = v71[5].isa;
    v23 = (id *)((char *)block + 40);
    v85 = v71[6].isa;
    dispatch_async(queue, block);

    v26 = 0;
    objc_storeStrong(v23, 0);
    objc_storeStrong(v24, v26);
    objc_storeStrong(v25, v26);
  }
  v15 = v71[4].isa;
  v13 = sel_statefulUIManager_didStartDownloadForDescriptor_withDownload_;
  v14 = &v73;
  v73 = MEMORY[0x24BDAC760];
  v74 = -1073741824;
  v75 = 0;
  v76 = __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_242;
  v77 = &unk_24DFF7C20;
  v18 = (id *)v78;
  v78[0] = v71[4].isa;
  v17 = (id *)(v14 + 5);
  v78[1] = v71[7].isa;
  v16 = (id *)(v14 + 6);
  v78[2] = v71[5].isa;
  -[objc_class executeOperationOnDelegate:usingBlock:](v15, "executeOperationOnDelegate:usingBlock:", v13, v14);
  v19 = 0;
  objc_storeStrong(v16, 0);
  objc_storeStrong(v17, v19);
  objc_storeStrong(v18, v19);
}

uint64_t __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_241(uint64_t a1)
{
  char v2;

  v2 = 0;
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    v2 = *(_BYTE *)(a1 + 57);
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v2 & 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __108__SUSettingsStatefulUIManager_downloadAndInstall_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_242(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManager:didStartDownloadForDescriptor:withDownload:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)downloadAndScheduleUpdate:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6
{
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(NSObject *, void *);
  void *v13;
  SUSettingsStatefulUIManager *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  SUSettingsStatefulUIManager *v22;

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
  v9 = MEMORY[0x24BDAC760];
  v10 = -1073741824;
  v11 = 0;
  v12 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke;
  v13 = &unk_24DFF7C98;
  v14 = v22;
  v15 = location[0];
  v16 = v20;
  v17 = (id)MEMORY[0x220773A28]();
  -[SUSettingsStatefulUIManager beginUpdateOperationWithDescriptor:operationDelegate:delegateCallbackQueue:operationTypeBlock:](v22, "beginUpdateOperationWithDescriptor:operationDelegate:delegateCallbackQueue:operationTypeBlock:", location[0], v19, v18, v17);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke(NSObject *a1, void *a2)
{
  objc_class *v2;
  char v3;
  const char *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t isa;
  uint64_t v13;
  uint64_t *v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  id *v19;
  id *v20;
  id v21;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v24;
  id *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint8_t *buf;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  id v47;
  id v48;
  int v49;
  id v50;
  int v51;
  const __CFString *v52;
  const __CFString *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  int v59;
  const __CFString *v60;
  os_log_t log;
  os_log_type_t v62[4];
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  const char *v68;
  NSObject *v69;
  uint64_t v70;
  int v71;
  int v72;
  void (*v73)(NSObject *, char, id, int, void *, void *);
  void *v74;
  _QWORD v75[3];
  int v76;
  uint64_t v77;
  int v78;
  int v79;
  void (*v80)(uint64_t);
  void *v81;
  objc_class *v82;
  char v83;
  id v84;
  id v85;
  id v86;
  char v87;
  id v88;
  char v89;
  id v90;
  char v91;
  id v92;
  char v93;
  id v94;
  char v95;
  id v96;
  id v97;
  os_log_type_t type;
  os_log_t oslog[2];
  id location[2];
  _BYTE v101[232];
  uint64_t v102;

  v69 = a1;
  v68 = "-[SUSettingsStatefulUIManager downloadAndScheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueu"
        "e:]_block_invoke";
  v102 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = v69;
  v67 = (id)-[objc_class log](v69[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v67, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v62 = type;
    v63 = SUSettingsUIStateToString(-[objc_class currentState](v69[4].isa, "currentState"));
    v64 = v63;
    v97 = v64;
    v65 = -[objc_class currentState](v69[4].isa, "currentState");
    v66 = (id)-[objc_class delegate](v69[4].isa, "delegate");
    v95 = 0;
    v93 = 0;
    if (v66)
    {
      v96 = (id)-[objc_class delegate](v69[4].isa, "delegate");
      v59 = 1;
      v95 = 1;
      v2 = (objc_class *)objc_opt_class();
      v94 = NSStringFromClass(v2);
      v93 = 1;
      v60 = (const __CFString *)v94;
    }
    else
    {
      v60 = CFSTR("(null)");
    }
    v53 = v60;
    v54 = (id)-[objc_class delegate](v69[4].isa, "delegate");
    v55 = (id)-[objc_class scanError](v69[4].isa, "scanError");
    v56 = (id)-[objc_class preferredStatefulDescriptor](v69[4].isa, "preferredStatefulDescriptor");
    v57 = (id)-[objc_class alternateStatefulDescriptor](v69[4].isa, "alternateStatefulDescriptor");
    v58 = (id)-[objc_class currentDownload](v69[4].isa, "currentDownload");
    v91 = 0;
    v89 = 0;
    v87 = 0;
    if (v58)
    {
      v92 = (id)-[objc_class currentDownload](v69[4].isa, "currentDownload");
      v51 = 1;
      v91 = 1;
      v90 = (id)objc_msgSend(v92, "descriptor");
      v89 = 1;
      v88 = (id)objc_msgSend(v90, "humanReadableUpdateName");
      v87 = 1;
      v52 = (const __CFString *)v88;
    }
    else
    {
      v52 = CFSTR("(null)");
    }
    v37 = v52;
    v38 = (id)-[objc_class currentDownload](v69[4].isa, "currentDownload");
    v3 = -[objc_class performThirdPartyScan](v69[4].isa, "performThirdPartyScan");
    v44 = "NO";
    v4 = "YES";
    v45 = "YES";
    v49 = 1;
    if ((v3 & 1) == 0)
      v4 = "NO";
    v39 = v4;
    v5 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v69[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v6 = (uint64_t)v45;
    if ((v5 & 1) == 0)
      v6 = (uint64_t)v44;
    v40 = v6;
    v7 = -[objc_class hidingPreferredDescriptor](v69[4].isa, "hidingPreferredDescriptor");
    v8 = (uint64_t)v45;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v44;
    v41 = v8;
    v42 = (id)objc_msgSend(*((id *)v69[4].isa + 32), "humanReadableUpdateName");
    v43 = v42;
    v86 = v43;
    v9 = -[objc_class hidingAlternateDescriptor](v69[4].isa, "hidingAlternateDescriptor");
    v10 = (uint64_t)v45;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v44;
    v46 = v10;
    v47 = (id)objc_msgSend(*((id *)v69[4].isa + 33), "humanReadableUpdateName");
    v48 = v47;
    v85 = v48;
    v50 = (id)-[objc_class enrolledBetaProgram](v69[4].isa, "enrolledBetaProgram");
    v83 = 0;
    if (v50)
    {
      v84 = (id)-[objc_class enrolledBetaProgram](v69[4].isa, "enrolledBetaProgram");
      v83 = 1;
      v36 = objc_msgSend(v84, "programID");
    }
    else
    {
      v36 = 0;
    }
    v27 = v36;
    v35 = (id)-[objc_class betaPrograms](v69[4].isa, "betaPrograms");
    v28 = objc_msgSend(v35, "count");
    v34 = (id)-[objc_class currentFullScanOperation](v69[4].isa, "currentFullScanOperation");
    v33 = (id)-[objc_class currentRefreshScanOperation](v69[4].isa, "currentRefreshScanOperation");
    v32 = (id)-[objc_class currentUpdateOperation](v69[4].isa, "currentUpdateOperation");
    v31 = (id)-[objc_class auxiliaryOperations](v69[4].isa, "auxiliaryOperations");
    v11 = objc_msgSend(v31, "count");
    isa = (uint64_t)v69[5].isa;
    v29 = &v13;
    buf = v101;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v101, (uint64_t)v68, (uint64_t)v64, v65, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v43, v46, (uint64_t)v48, v36, v28,
      (uint64_t)v34,
      (uint64_t)v33,
      (uint64_t)v32,
      v11,
      isa);
    _os_log_impl(&dword_21BF33000, log, v62[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Starting to download and schedule (Update Tonight) the update: %{public}@",
      buf,
      0xE8u);

    if ((v83 & 1) != 0)
    if ((v87 & 1) != 0)

    if ((v89 & 1) != 0)
    if ((v91 & 1) != 0)

    if ((v93 & 1) != 0)
    if ((v95 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v85, 0);
    objc_storeStrong(&v86, obj);
    objc_storeStrong(&v97, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (location[0])
  {
    v15 = (id)*((_QWORD *)v69[4].isa + 25);
    v17 = (id)-[objc_class descriptor](v69[5].isa, "descriptor");
    v16 = (id)-[objc_class createUpdateOperationOptions](v69[4].isa, "createUpdateOperationOptions");
    v14 = &v70;
    v70 = MEMORY[0x24BDAC760];
    v71 = -1073741824;
    v72 = 0;
    v73 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2;
    v74 = &unk_24DFF7D38;
    v20 = (id *)v75;
    v75[0] = v69[4].isa;
    v19 = (id *)(v14 + 6);
    v75[2] = v69[6].isa;
    v18 = (id *)(v14 + 5);
    v75[1] = v69[5].isa;
    objc_msgSend(v15, "downloadAndScheduleUpdate:forInstallationTonightWithOptions:completionHandler:", v17, v16, v14);

    v21 = 0;
    objc_storeStrong(v18, 0);
    objc_storeStrong(v19, v21);
    objc_storeStrong(v20, v21);
    v76 = 0;
  }
  else
  {
    if (v69[6].isa)
    {
      v24 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      queue = (dispatch_queue_t)(id)objc_msgSend(v24, "selectDelegateCallbackQueue:", *((_QWORD *)v69[4].isa + 5));
      block = &v77;
      v77 = MEMORY[0x24BDAC760];
      v78 = -1073741824;
      v79 = 0;
      v80 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_243;
      v81 = &unk_24DFF7BA8;
      v25 = (id *)&v82;
      v82 = v69[6].isa;
      dispatch_async(queue, block);

      objc_storeStrong(v25, 0);
    }
    v76 = 1;
  }
  objc_storeStrong(location, 0);
}

void __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_243(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAED98], 8102);
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, 0, 0, 0);

}

void __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2(NSObject *a1, char a2, id obj, int a4, void *a5, void *a6)
{
  objc_class *v6;
  char v7;
  const char *v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  int v19;
  int v20;
  id v21;
  int v22;
  id v23;
  id v24;
  id *v25;
  Class isa;
  id *v27;
  id *v28;
  id *v29;
  id *v30;
  id *v31;
  id *v32;
  id v33;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v36;
  id *v37;
  id *v38;
  id *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint8_t *buf;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  const __CFString *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  id v62;
  id v63;
  int v64;
  id v65;
  int v66;
  const __CFString *v67;
  const __CFString *v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  int v74;
  const __CFString *v75;
  os_log_t log;
  os_log_type_t v77[4];
  id v78;
  id v79;
  uint64_t v80;
  id v81;
  id v82;
  const char *v83;
  int v84;
  id obja;
  id v86;
  NSObject *v87;
  uint64_t v88;
  int v89;
  int v90;
  void (*v91)(NSObject *, char);
  void *v92;
  _QWORD v93[6];
  char v94;
  char v95;
  int v96;
  uint64_t v97;
  int v98;
  int v99;
  uint64_t (*v100)(uint64_t);
  void *v101;
  id v102;
  id v103;
  objc_class *v104;
  char v105;
  char v106;
  id v107;
  id v108;
  id v109;
  char v110;
  id v111;
  char v112;
  id v113;
  char v114;
  id v115;
  char v116;
  id v117;
  char v118;
  id v119;
  id v120;
  os_log_type_t type;
  os_log_t oslog[2];
  id v123;
  id v124;
  unsigned __int8 v125;
  id location;
  unsigned __int8 v127;
  NSObject *v128;
  _BYTE v129[248];
  uint64_t v130;

  v87 = a1;
  v84 = a4;
  obja = a5;
  v86 = a6;
  v83 = "-[SUSettingsStatefulUIManager downloadAndScheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueu"
        "e:]_block_invoke_2";
  v130 = *MEMORY[0x24BDAC8D0];
  v128 = a1;
  v127 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v125 = v84 & 1;
  v124 = 0;
  objc_storeStrong(&v124, obja);
  v123 = 0;
  objc_storeStrong(&v123, v86);
  oslog[1] = v87;
  v82 = (id)-[objc_class log](v87[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v82, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v77 = type;
    v78 = SUSettingsUIStateToString(-[objc_class currentState](v87[4].isa, "currentState"));
    v79 = v78;
    v120 = v79;
    v80 = -[objc_class currentState](v87[4].isa, "currentState");
    v81 = (id)-[objc_class delegate](v87[4].isa, "delegate");
    v118 = 0;
    v116 = 0;
    if (v81)
    {
      v119 = (id)-[objc_class delegate](v87[4].isa, "delegate");
      v74 = 1;
      v118 = 1;
      v6 = (objc_class *)objc_opt_class();
      v117 = NSStringFromClass(v6);
      v116 = 1;
      v75 = (const __CFString *)v117;
    }
    else
    {
      v75 = CFSTR("(null)");
    }
    v68 = v75;
    v69 = (id)-[objc_class delegate](v87[4].isa, "delegate");
    v70 = (id)-[objc_class scanError](v87[4].isa, "scanError");
    v71 = (id)-[objc_class preferredStatefulDescriptor](v87[4].isa, "preferredStatefulDescriptor");
    v72 = (id)-[objc_class alternateStatefulDescriptor](v87[4].isa, "alternateStatefulDescriptor");
    v73 = (id)-[objc_class currentDownload](v87[4].isa, "currentDownload");
    v114 = 0;
    v112 = 0;
    v110 = 0;
    if (v73)
    {
      v115 = (id)-[objc_class currentDownload](v87[4].isa, "currentDownload");
      v66 = 1;
      v114 = 1;
      v113 = (id)objc_msgSend(v115, "descriptor");
      v112 = 1;
      v111 = (id)objc_msgSend(v113, "humanReadableUpdateName");
      v110 = 1;
      v67 = (const __CFString *)v111;
    }
    else
    {
      v67 = CFSTR("(null)");
    }
    v52 = v67;
    v53 = (id)-[objc_class currentDownload](v87[4].isa, "currentDownload");
    v7 = -[objc_class performThirdPartyScan](v87[4].isa, "performThirdPartyScan");
    v59 = "NO";
    v8 = "YES";
    v60 = "YES";
    v64 = 1;
    if ((v7 & 1) == 0)
      v8 = "NO";
    v54 = v8;
    v9 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v87[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v10 = (uint64_t)v60;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v59;
    v55 = v10;
    v11 = -[objc_class hidingPreferredDescriptor](v87[4].isa, "hidingPreferredDescriptor");
    v12 = (uint64_t)v60;
    if ((v11 & 1) == 0)
      v12 = (uint64_t)v59;
    v56 = v12;
    v57 = (id)objc_msgSend(*((id *)v87[4].isa + 32), "humanReadableUpdateName");
    v58 = v57;
    v109 = v58;
    v13 = -[objc_class hidingAlternateDescriptor](v87[4].isa, "hidingAlternateDescriptor");
    v14 = (uint64_t)v60;
    if ((v13 & 1) == 0)
      v14 = (uint64_t)v59;
    v61 = v14;
    v62 = (id)objc_msgSend(*((id *)v87[4].isa + 33), "humanReadableUpdateName");
    v63 = v62;
    v108 = v63;
    v65 = (id)-[objc_class enrolledBetaProgram](v87[4].isa, "enrolledBetaProgram");
    v106 = 0;
    if (v65)
    {
      v107 = (id)-[objc_class enrolledBetaProgram](v87[4].isa, "enrolledBetaProgram");
      v106 = 1;
      v51 = objc_msgSend(v107, "programID");
    }
    else
    {
      v51 = 0;
    }
    v42 = v51;
    v50 = (id)-[objc_class betaPrograms](v87[4].isa, "betaPrograms");
    v43 = objc_msgSend(v50, "count");
    v49 = (id)-[objc_class currentFullScanOperation](v87[4].isa, "currentFullScanOperation");
    v48 = (id)-[objc_class currentRefreshScanOperation](v87[4].isa, "currentRefreshScanOperation");
    v47 = (id)-[objc_class currentUpdateOperation](v87[4].isa, "currentUpdateOperation");
    v46 = (id)-[objc_class auxiliaryOperations](v87[4].isa, "auxiliaryOperations");
    v15 = objc_msgSend(v46, "count");
    v44 = &v17;
    buf = v129;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_4_0_8_66((uint64_t)v129, (uint64_t)v83, (uint64_t)v79, v80, (uint64_t)v68, (uint64_t)v69, (uint64_t)v70, (uint64_t)v71, (uint64_t)v72, (uint64_t)v52, (uint64_t)v53, (uint64_t)v54, v55, v56, (uint64_t)v58, v61, (uint64_t)v63, v51, v43,
      (uint64_t)v49,
      (uint64_t)v48,
      (uint64_t)v47,
      v15,
      v127 & 1,
      v125 & 1,
      (uint64_t)v123);
    _os_log_impl(&dword_21BF33000, log, v77[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Update and Schedule (Update Tonight) operation completed with download result: %d; schedule success: %d; error: %{public}@",
      buf,
      0xF4u);

    if ((v106 & 1) != 0)
    if ((v110 & 1) != 0)

    if ((v112 & 1) != 0)
    if ((v114 & 1) != 0)

    if ((v116 & 1) != 0)
    if ((v118 & 1) != 0)

    v41 = 0;
    objc_storeStrong(&v108, 0);
    objc_storeStrong(&v109, v41);
    objc_storeStrong(&v120, v41);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)v87[4].isa + 25, 0);
  if ((v127 & 1) != 0)
  {
    objc_storeStrong((id *)v87[4].isa + 13, location);
    objc_storeStrong((id *)v87[4].isa + 31, v124);
    v16 = v87;
    *((_BYTE *)v87[4].isa + 14) = v125 & 1;
    if (*((_QWORD *)v16[4].isa + 31))
      objc_msgSend(*((id *)v87[4].isa + 31), "setDelegate:", v87[4].isa);
    isa = v87[4].isa;
    v20 = v127;
    v21 = location;
    v22 = v125;
    v23 = v124;
    v24 = v123;
    v25 = (id *)&v88;
    v88 = MEMORY[0x24BDAC760];
    v89 = -1073741824;
    v90 = 0;
    v91 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_245;
    v92 = &unk_24DFF7D10;
    v32 = (id *)v93;
    v93[0] = v87[4].isa;
    v19 = 1;
    v94 = v127 & 1;
    v31 = v25 + 9;
    v93[5] = v87[6].isa;
    v30 = v25 + 5;
    v93[1] = location;
    v95 = v125 & v19;
    v29 = v25 + 6;
    v93[2] = v124;
    v28 = v25 + 7;
    v93[3] = v123;
    v27 = v25 + 8;
    v93[4] = v87[5].isa;
    -[objc_class performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:](isa, "performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:", v20 & 1, v21, v22 & 1, v23, v24, v25);
    v33 = 0;
    objc_storeStrong(v27, 0);
    objc_storeStrong(v28, v33);
    objc_storeStrong(v29, v33);
    objc_storeStrong(v30, v33);
    objc_storeStrong(v31, v33);
    objc_storeStrong(v32, v33);
    v96 = 0;
  }
  else
  {
    if (v87[6].isa)
    {
      v36 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      queue = (dispatch_queue_t)(id)objc_msgSend(v36, "selectDelegateCallbackQueue:", *((_QWORD *)v87[4].isa + 5));
      block = &v97;
      v97 = MEMORY[0x24BDAC760];
      v98 = -1073741824;
      v99 = 0;
      v100 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_244;
      v101 = &unk_24DFF7CC0;
      v39 = (id *)&v104;
      v104 = v87[6].isa;
      v105 = v125 & 1;
      v38 = (id *)((char *)block + 32);
      v102 = v124;
      v37 = (id *)((char *)block + 40);
      v103 = v123;
      dispatch_async(queue, block);

      v40 = 0;
      objc_storeStrong(v37, 0);
      objc_storeStrong(v38, v40);
      objc_storeStrong(v39, v40);
    }
    v96 = 1;
  }
  v18 = 0;
  objc_storeStrong(&v123, 0);
  objc_storeStrong(&v124, v18);
  objc_storeStrong(&location, v18);
}

uint64_t __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_244(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
}

void __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_245(NSObject *a1, char a2)
{
  objc_class *v2;
  char v3;
  const char *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char isa;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  Class v15;
  id *v16;
  id *v17;
  id *v18;
  id v19;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v22;
  id *v23;
  id *v24;
  id *v25;
  id *v26;
  id v27;
  id obj;
  uint64_t *v29;
  uint8_t *buf;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  const __CFString *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  id v51;
  id v52;
  int v53;
  id v54;
  int v55;
  const __CFString *v56;
  const __CFString *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  int v63;
  const __CFString *v64;
  os_log_t log;
  os_log_type_t v66[4];
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  int v75;
  int v76;
  void (*v77)(uint64_t);
  void *v78;
  _QWORD v79[3];
  uint64_t v80;
  int v81;
  int v82;
  uint64_t (*v83)(uint64_t);
  void *v84;
  objc_class *v85;
  objc_class *v86;
  objc_class *v87;
  objc_class *v88;
  char v89;
  char v90;
  char v91;
  char v92;
  id v93;
  id location;
  id v95;
  char v96;
  id v97;
  char v98;
  id v99;
  char v100;
  id v101;
  char v102;
  id v103;
  char v104;
  id v105;
  id v106;
  os_log_type_t type;
  os_log_t oslog[2];
  unsigned __int8 v109;
  NSObject *v110;
  _BYTE v111[232];
  uint64_t v112;

  v72 = a1;
  v73 = "-[SUSettingsStatefulUIManager downloadAndScheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueu"
        "e:]_block_invoke_2";
  v112 = *MEMORY[0x24BDAC8D0];
  v110 = a1;
  v109 = a2 & 1;
  oslog[1] = a1;
  v71 = (id)-[objc_class log](a1[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v71, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v66 = type;
    v67 = SUSettingsUIStateToString(-[objc_class currentState](v72[4].isa, "currentState"));
    v68 = v67;
    v106 = v68;
    v69 = -[objc_class currentState](v72[4].isa, "currentState");
    v70 = (id)-[objc_class delegate](v72[4].isa, "delegate");
    v104 = 0;
    v102 = 0;
    if (v70)
    {
      v105 = (id)-[objc_class delegate](v72[4].isa, "delegate");
      v63 = 1;
      v104 = 1;
      v2 = (objc_class *)objc_opt_class();
      v103 = NSStringFromClass(v2);
      v102 = 1;
      v64 = (const __CFString *)v103;
    }
    else
    {
      v64 = CFSTR("(null)");
    }
    v57 = v64;
    v58 = (id)-[objc_class delegate](v72[4].isa, "delegate");
    v59 = (id)-[objc_class scanError](v72[4].isa, "scanError");
    v60 = (id)-[objc_class preferredStatefulDescriptor](v72[4].isa, "preferredStatefulDescriptor");
    v61 = (id)-[objc_class alternateStatefulDescriptor](v72[4].isa, "alternateStatefulDescriptor");
    v62 = (id)-[objc_class currentDownload](v72[4].isa, "currentDownload");
    v100 = 0;
    v98 = 0;
    v96 = 0;
    if (v62)
    {
      v101 = (id)-[objc_class currentDownload](v72[4].isa, "currentDownload");
      v55 = 1;
      v100 = 1;
      v99 = (id)objc_msgSend(v101, "descriptor");
      v98 = 1;
      v97 = (id)objc_msgSend(v99, "humanReadableUpdateName");
      v96 = 1;
      v56 = (const __CFString *)v97;
    }
    else
    {
      v56 = CFSTR("(null)");
    }
    v41 = v56;
    v42 = (id)-[objc_class currentDownload](v72[4].isa, "currentDownload");
    v3 = -[objc_class performThirdPartyScan](v72[4].isa, "performThirdPartyScan");
    v48 = "NO";
    v4 = "YES";
    v49 = "YES";
    v53 = 1;
    if ((v3 & 1) == 0)
      v4 = "NO";
    v43 = v4;
    v5 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v72[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v6 = (uint64_t)v49;
    if ((v5 & 1) == 0)
      v6 = (uint64_t)v48;
    v44 = v6;
    v7 = -[objc_class hidingPreferredDescriptor](v72[4].isa, "hidingPreferredDescriptor");
    v8 = (uint64_t)v49;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v48;
    v45 = v8;
    v46 = (id)objc_msgSend(*((id *)v72[4].isa + 32), "humanReadableUpdateName");
    v47 = v46;
    v95 = v47;
    v9 = -[objc_class hidingAlternateDescriptor](v72[4].isa, "hidingAlternateDescriptor");
    v10 = (uint64_t)v49;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v48;
    v50 = v10;
    v51 = (id)objc_msgSend(*((id *)v72[4].isa + 33), "humanReadableUpdateName");
    v52 = v51;
    location = v52;
    v54 = (id)-[objc_class enrolledBetaProgram](v72[4].isa, "enrolledBetaProgram");
    v92 = 0;
    if (v54)
    {
      v93 = (id)-[objc_class enrolledBetaProgram](v72[4].isa, "enrolledBetaProgram");
      v92 = 1;
      v40 = objc_msgSend(v93, "programID");
    }
    else
    {
      v40 = 0;
    }
    v31 = v40;
    v32 = (id)-[objc_class betaPrograms](v72[4].isa, "betaPrograms");
    v33 = objc_msgSend(v32, "count");
    v34 = (id)-[objc_class currentFullScanOperation](v72[4].isa, "currentFullScanOperation");
    v35 = (id)-[objc_class currentRefreshScanOperation](v72[4].isa, "currentRefreshScanOperation");
    v36 = (id)-[objc_class currentUpdateOperation](v72[4].isa, "currentUpdateOperation");
    v37 = (id)-[objc_class auxiliaryOperations](v72[4].isa, "auxiliaryOperations");
    v38 = objc_msgSend(v37, "count");
    isa = (char)v72[10].isa;
    v39 = 0;
    if ((isa & 1) != 0)
      v39 = v109;
    v29 = &v12;
    buf = v111;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0((uint64_t)v111, (uint64_t)v73, (uint64_t)v68, v69, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61, (uint64_t)v41, (uint64_t)v42, (uint64_t)v43, v44, v45, (uint64_t)v47, v50, (uint64_t)v52, v31, v33,
      (uint64_t)v34,
      (uint64_t)v35,
      (uint64_t)v36,
      v38,
      v39 & 1);
    _os_log_impl(&dword_21BF33000, log, v66[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform an update of type \"Update Tonight\" with result: %d",
      buf,
      0xE4u);

    if ((v92 & 1) != 0)
    if ((v96 & 1) != 0)

    if ((v98 & 1) != 0)
    if ((v100 & 1) != 0)

    if ((v102 & 1) != 0)
    if ((v104 & 1) != 0)

    obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v95, obj);
    objc_storeStrong(&v106, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v72[9].isa)
  {
    v22 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    queue = (dispatch_queue_t)(id)objc_msgSend(v22, "selectDelegateCallbackQueue:", *((_QWORD *)v72[4].isa + 5));
    block = &v80;
    v80 = MEMORY[0x24BDAC760];
    v81 = -1073741824;
    v82 = 0;
    v83 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_246;
    v84 = &unk_24DFF7CE8;
    v26 = (id *)&v88;
    v88 = v72[9].isa;
    v89 = (uint64_t)v72[10].isa & 1;
    v90 = v109 & 1;
    v25 = (id *)((char *)block + 32);
    v85 = v72[5].isa;
    v91 = BYTE1(v72[10].isa) & 1;
    v24 = (id *)((char *)block + 40);
    v86 = v72[6].isa;
    v23 = (id *)((char *)block + 48);
    v87 = v72[7].isa;
    dispatch_async(queue, block);

    v27 = 0;
    objc_storeStrong(v23, 0);
    objc_storeStrong(v24, v27);
    objc_storeStrong(v25, v27);
    objc_storeStrong(v26, v27);
  }
  v15 = v72[4].isa;
  v13 = sel_statefulUIManager_didStartDownloadForDescriptor_withDownload_;
  v14 = &v74;
  v74 = MEMORY[0x24BDAC760];
  v75 = -1073741824;
  v76 = 0;
  v77 = __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_247;
  v78 = &unk_24DFF7C20;
  v18 = (id *)v79;
  v79[0] = v72[4].isa;
  v17 = (id *)(v14 + 5);
  v79[1] = v72[8].isa;
  v16 = (id *)(v14 + 6);
  v79[2] = v72[5].isa;
  -[objc_class executeOperationOnDelegate:usingBlock:](v15, "executeOperationOnDelegate:usingBlock:", v13, v14);
  v19 = 0;
  objc_storeStrong(v16, 0);
  objc_storeStrong(v17, v19);
  objc_storeStrong(v18, v19);
}

uint64_t __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_246(uint64_t a1)
{
  char v2;

  v2 = 0;
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
    v2 = *(_BYTE *)(a1 + 65);
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v2 & 1, *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 66) & 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __115__SUSettingsStatefulUIManager_downloadAndScheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_247(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManager:didStartDownloadForDescriptor:withDownload:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)installUpdate:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6
{
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(NSObject *, void *);
  void *v13;
  SUSettingsStatefulUIManager *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id location[2];
  SUSettingsStatefulUIManager *v22;

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
  v9 = MEMORY[0x24BDAC760];
  v10 = -1073741824;
  v11 = 0;
  v12 = __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke;
  v13 = &unk_24DFF7C98;
  v14 = v22;
  v15 = location[0];
  v16 = v20;
  v17 = (id)MEMORY[0x220773A28]();
  -[SUSettingsStatefulUIManager beginUpdateOperationWithDescriptor:operationDelegate:delegateCallbackQueue:operationTypeBlock:](v22, "beginUpdateOperationWithDescriptor:operationDelegate:delegateCallbackQueue:operationTypeBlock:", location[0], v19, v18, v17);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke(NSObject *a1, void *a2)
{
  objc_class *v2;
  char v3;
  const char *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t isa;
  uint64_t v13;
  uint64_t *v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  id *v19;
  id *v20;
  id v21;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v24;
  id *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint8_t *buf;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  id v47;
  id v48;
  int v49;
  id v50;
  int v51;
  const __CFString *v52;
  const __CFString *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  int v59;
  const __CFString *v60;
  os_log_t log;
  os_log_type_t v62[4];
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  const char *v68;
  NSObject *v69;
  uint64_t v70;
  int v71;
  int v72;
  void (*v73)(NSObject *, char, id);
  void *v74;
  _QWORD v75[3];
  int v76;
  uint64_t v77;
  int v78;
  int v79;
  void (*v80)(uint64_t);
  void *v81;
  objc_class *v82;
  char v83;
  id v84;
  id v85;
  id v86;
  char v87;
  id v88;
  char v89;
  id v90;
  char v91;
  id v92;
  char v93;
  id v94;
  char v95;
  id v96;
  id v97;
  os_log_type_t type;
  os_log_t oslog[2];
  id location[2];
  _BYTE v101[232];
  uint64_t v102;

  v69 = a1;
  v68 = "-[SUSettingsStatefulUIManager installUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke";
  v102 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = v69;
  v67 = (id)-[objc_class log](v69[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v67, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v62 = type;
    v63 = SUSettingsUIStateToString(-[objc_class currentState](v69[4].isa, "currentState"));
    v64 = v63;
    v97 = v64;
    v65 = -[objc_class currentState](v69[4].isa, "currentState");
    v66 = (id)-[objc_class delegate](v69[4].isa, "delegate");
    v95 = 0;
    v93 = 0;
    if (v66)
    {
      v96 = (id)-[objc_class delegate](v69[4].isa, "delegate");
      v59 = 1;
      v95 = 1;
      v2 = (objc_class *)objc_opt_class();
      v94 = NSStringFromClass(v2);
      v93 = 1;
      v60 = (const __CFString *)v94;
    }
    else
    {
      v60 = CFSTR("(null)");
    }
    v53 = v60;
    v54 = (id)-[objc_class delegate](v69[4].isa, "delegate");
    v55 = (id)-[objc_class scanError](v69[4].isa, "scanError");
    v56 = (id)-[objc_class preferredStatefulDescriptor](v69[4].isa, "preferredStatefulDescriptor");
    v57 = (id)-[objc_class alternateStatefulDescriptor](v69[4].isa, "alternateStatefulDescriptor");
    v58 = (id)-[objc_class currentDownload](v69[4].isa, "currentDownload");
    v91 = 0;
    v89 = 0;
    v87 = 0;
    if (v58)
    {
      v92 = (id)-[objc_class currentDownload](v69[4].isa, "currentDownload");
      v51 = 1;
      v91 = 1;
      v90 = (id)objc_msgSend(v92, "descriptor");
      v89 = 1;
      v88 = (id)objc_msgSend(v90, "humanReadableUpdateName");
      v87 = 1;
      v52 = (const __CFString *)v88;
    }
    else
    {
      v52 = CFSTR("(null)");
    }
    v37 = v52;
    v38 = (id)-[objc_class currentDownload](v69[4].isa, "currentDownload");
    v3 = -[objc_class performThirdPartyScan](v69[4].isa, "performThirdPartyScan");
    v44 = "NO";
    v4 = "YES";
    v45 = "YES";
    v49 = 1;
    if ((v3 & 1) == 0)
      v4 = "NO";
    v39 = v4;
    v5 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v69[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v6 = (uint64_t)v45;
    if ((v5 & 1) == 0)
      v6 = (uint64_t)v44;
    v40 = v6;
    v7 = -[objc_class hidingPreferredDescriptor](v69[4].isa, "hidingPreferredDescriptor");
    v8 = (uint64_t)v45;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v44;
    v41 = v8;
    v42 = (id)objc_msgSend(*((id *)v69[4].isa + 32), "humanReadableUpdateName");
    v43 = v42;
    v86 = v43;
    v9 = -[objc_class hidingAlternateDescriptor](v69[4].isa, "hidingAlternateDescriptor");
    v10 = (uint64_t)v45;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v44;
    v46 = v10;
    v47 = (id)objc_msgSend(*((id *)v69[4].isa + 33), "humanReadableUpdateName");
    v48 = v47;
    v85 = v48;
    v50 = (id)-[objc_class enrolledBetaProgram](v69[4].isa, "enrolledBetaProgram");
    v83 = 0;
    if (v50)
    {
      v84 = (id)-[objc_class enrolledBetaProgram](v69[4].isa, "enrolledBetaProgram");
      v83 = 1;
      v36 = objc_msgSend(v84, "programID");
    }
    else
    {
      v36 = 0;
    }
    v27 = v36;
    v35 = (id)-[objc_class betaPrograms](v69[4].isa, "betaPrograms");
    v28 = objc_msgSend(v35, "count");
    v34 = (id)-[objc_class currentFullScanOperation](v69[4].isa, "currentFullScanOperation");
    v33 = (id)-[objc_class currentRefreshScanOperation](v69[4].isa, "currentRefreshScanOperation");
    v32 = (id)-[objc_class currentUpdateOperation](v69[4].isa, "currentUpdateOperation");
    v31 = (id)-[objc_class auxiliaryOperations](v69[4].isa, "auxiliaryOperations");
    v11 = objc_msgSend(v31, "count");
    isa = (uint64_t)v69[5].isa;
    v29 = &v13;
    buf = v101;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v101, (uint64_t)v68, (uint64_t)v64, v65, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v37, (uint64_t)v38, (uint64_t)v39, v40, v41, (uint64_t)v43, v46, (uint64_t)v48, v36, v28,
      (uint64_t)v34,
      (uint64_t)v33,
      (uint64_t)v32,
      v11,
      isa);
    _os_log_impl(&dword_21BF33000, log, v62[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Starting to install (Install Now) the update: %{public}@",
      buf,
      0xE8u);

    if ((v83 & 1) != 0)
    if ((v87 & 1) != 0)

    if ((v89 & 1) != 0)
    if ((v91 & 1) != 0)

    if ((v93 & 1) != 0)
    if ((v95 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v85, 0);
    objc_storeStrong(&v86, obj);
    objc_storeStrong(&v97, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (location[0])
  {
    v15 = (id)*((_QWORD *)v69[4].isa + 25);
    v17 = (id)-[objc_class descriptor](v69[5].isa, "descriptor");
    v16 = (id)-[objc_class createUpdateOperationOptions](v69[4].isa, "createUpdateOperationOptions");
    v14 = &v70;
    v70 = MEMORY[0x24BDAC760];
    v71 = -1073741824;
    v72 = 0;
    v73 = __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2;
    v74 = &unk_24DFF7D88;
    v20 = (id *)v75;
    v75[0] = v69[4].isa;
    v19 = (id *)(v14 + 6);
    v75[2] = v69[6].isa;
    v18 = (id *)(v14 + 5);
    v75[1] = v69[5].isa;
    objc_msgSend(v15, "installUpdate:withOptions:completionHandler:", v17, v16, v14);

    v21 = 0;
    objc_storeStrong(v18, 0);
    objc_storeStrong(v19, v21);
    objc_storeStrong(v20, v21);
    v76 = 0;
  }
  else
  {
    if (v69[6].isa)
    {
      v24 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      queue = (dispatch_queue_t)(id)objc_msgSend(v24, "selectDelegateCallbackQueue:", *((_QWORD *)v69[4].isa + 5));
      block = &v77;
      v77 = MEMORY[0x24BDAC760];
      v78 = -1073741824;
      v79 = 0;
      v80 = __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_249;
      v81 = &unk_24DFF7BA8;
      v25 = (id *)&v82;
      v82 = v69[6].isa;
      dispatch_async(queue, block);

      objc_storeStrong(v25, 0);
    }
    v76 = 1;
  }
  objc_storeStrong(location, 0);
}

void __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_249(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAED98], 8102, 0);
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);

}

void __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2(NSObject *a1, char a2, id obj)
{
  objc_class *v3;
  char v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char *v15;
  uint64_t *v16;
  Class isa;
  id *v18;
  id *v19;
  id v20;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v23;
  id *v24;
  id *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  int v30;
  id v31;
  id v32;
  id obja;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint8_t *buf;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  const __CFString *v44;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  id v54;
  id v55;
  int v56;
  id v57;
  int v58;
  const __CFString *v59;
  const __CFString *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  int v66;
  const __CFString *v67;
  os_log_t log;
  os_log_type_t v69[4];
  id v70;
  id v71;
  uint64_t v72;
  id v73;
  id v74;
  const char *v75;
  NSObject *v76;
  uint64_t v77;
  int v78;
  int v79;
  void (*v80)(uint64_t);
  void *v81;
  _QWORD v82[2];
  uint64_t v83;
  int v84;
  int v85;
  uint64_t (*v86)(uint64_t);
  void *v87;
  id v88;
  objc_class *v89;
  char v90;
  char v91;
  id v92;
  id v93;
  char v94;
  id v95;
  id v96;
  id v97;
  char v98;
  id v99;
  char v100;
  id v101;
  char v102;
  id v103;
  char v104;
  id v105;
  char v106;
  id v107;
  id v108;
  os_log_type_t type;
  os_log_t oslog[2];
  id location;
  char v112;
  NSObject *v113;
  _BYTE v114[248];
  uint64_t v115;

  v76 = a1;
  v75 = "-[SUSettingsStatefulUIManager installUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke_2";
  v115 = *MEMORY[0x24BDAC8D0];
  v113 = a1;
  v112 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = v76;
  v74 = (id)-[objc_class log](v76[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v74, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v69 = type;
    v70 = SUSettingsUIStateToString(-[objc_class currentState](v76[4].isa, "currentState"));
    v71 = v70;
    v108 = v71;
    v72 = -[objc_class currentState](v76[4].isa, "currentState");
    v73 = (id)-[objc_class delegate](v76[4].isa, "delegate");
    v106 = 0;
    v104 = 0;
    if (v73)
    {
      v107 = (id)-[objc_class delegate](v76[4].isa, "delegate");
      v66 = 1;
      v106 = 1;
      v3 = (objc_class *)objc_opt_class();
      v105 = NSStringFromClass(v3);
      v104 = 1;
      v67 = (const __CFString *)v105;
    }
    else
    {
      v67 = CFSTR("(null)");
    }
    v60 = v67;
    v61 = (id)-[objc_class delegate](v76[4].isa, "delegate");
    v62 = (id)-[objc_class scanError](v76[4].isa, "scanError");
    v63 = (id)-[objc_class preferredStatefulDescriptor](v76[4].isa, "preferredStatefulDescriptor");
    v64 = (id)-[objc_class alternateStatefulDescriptor](v76[4].isa, "alternateStatefulDescriptor");
    v65 = (id)-[objc_class currentDownload](v76[4].isa, "currentDownload");
    v102 = 0;
    v100 = 0;
    v98 = 0;
    if (v65)
    {
      v103 = (id)-[objc_class currentDownload](v76[4].isa, "currentDownload");
      v58 = 1;
      v102 = 1;
      v101 = (id)objc_msgSend(v103, "descriptor");
      v100 = 1;
      v99 = (id)objc_msgSend(v101, "humanReadableUpdateName");
      v98 = 1;
      v59 = (const __CFString *)v99;
    }
    else
    {
      v59 = CFSTR("(null)");
    }
    v44 = v59;
    v45 = (id)-[objc_class currentDownload](v76[4].isa, "currentDownload");
    v4 = -[objc_class performThirdPartyScan](v76[4].isa, "performThirdPartyScan");
    v51 = "NO";
    v5 = "YES";
    v52 = "YES";
    v56 = 1;
    if ((v4 & 1) == 0)
      v5 = "NO";
    v46 = v5;
    v6 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v76[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v7 = (uint64_t)v52;
    if ((v6 & 1) == 0)
      v7 = (uint64_t)v51;
    v47 = v7;
    v8 = -[objc_class hidingPreferredDescriptor](v76[4].isa, "hidingPreferredDescriptor");
    v9 = (uint64_t)v52;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v51;
    v48 = v9;
    v49 = (id)objc_msgSend(*((id *)v76[4].isa + 32), "humanReadableUpdateName");
    v50 = v49;
    v97 = v50;
    v10 = -[objc_class hidingAlternateDescriptor](v76[4].isa, "hidingAlternateDescriptor");
    v11 = (uint64_t)v52;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v51;
    v53 = v11;
    v54 = (id)objc_msgSend(*((id *)v76[4].isa + 33), "humanReadableUpdateName");
    v55 = v54;
    v96 = v55;
    v57 = (id)-[objc_class enrolledBetaProgram](v76[4].isa, "enrolledBetaProgram");
    v94 = 0;
    if (v57)
    {
      v95 = (id)-[objc_class enrolledBetaProgram](v76[4].isa, "enrolledBetaProgram");
      v94 = 1;
      v43 = objc_msgSend(v95, "programID");
    }
    else
    {
      v43 = 0;
    }
    v34 = v43;
    v42 = (id)-[objc_class betaPrograms](v76[4].isa, "betaPrograms");
    v35 = objc_msgSend(v42, "count");
    v41 = (id)-[objc_class currentFullScanOperation](v76[4].isa, "currentFullScanOperation");
    v40 = (id)-[objc_class currentRefreshScanOperation](v76[4].isa, "currentRefreshScanOperation");
    v39 = (id)-[objc_class currentUpdateOperation](v76[4].isa, "currentUpdateOperation");
    v38 = (id)-[objc_class auxiliaryOperations](v76[4].isa, "auxiliaryOperations");
    v12 = objc_msgSend(v38, "count");
    v36 = &v13;
    buf = v114;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_8_66((uint64_t)v114, (uint64_t)v75, (uint64_t)v71, v72, (uint64_t)v60, (uint64_t)v61, (uint64_t)v62, (uint64_t)v63, (uint64_t)v64, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, v47, v48, (uint64_t)v50, v53, (uint64_t)v55, v43, v35,
      (uint64_t)v41,
      (uint64_t)v40,
      (uint64_t)v39,
      v12,
      v112 & 1,
      (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, v69[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Update installation (Install Now) operation completed with download result: %d; error: %{public}@",
      buf,
      0xEEu);

    if ((v94 & 1) != 0)
    if ((v98 & 1) != 0)

    if ((v100 & 1) != 0)
    if ((v102 & 1) != 0)

    if ((v104 & 1) != 0)
    if ((v106 & 1) != 0)

    obja = 0;
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, obja);
    objc_storeStrong(&v108, obja);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)v76[4].isa + 25, 0);
  v93 = (id)-[objc_class targetedUpdateStatefulDescriptor](v76[4].isa, "targetedUpdateStatefulDescriptor");
  v28 = v93;
  v29 = (id)-[objc_class currentDownload](v76[4].isa, "currentDownload");
  v30 = objc_msgSend(v93, "updateDownloadable");
  v31 = (id)objc_msgSend(v93, "updateDownloadError");
  v32 = location;
  v91 = 0;
  if (location)
  {
    v27 = v32;
  }
  else
  {
    v92 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAED98], 14, 0);
    v91 = 1;
    v27 = v92;
  }
  objc_msgSend(v28, "updateStateFromConcreteDownload:downloadable:downloadError:isUpdateReadyForInstallation:updateInstallationError:error:", v29, v30 & 1, v31, 0, v27, location);
  if ((v91 & 1) != 0)

  if (v76[6].isa)
  {
    v23 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    queue = (dispatch_queue_t)(id)objc_msgSend(v23, "selectDelegateCallbackQueue:", *((_QWORD *)v76[4].isa + 5));
    block = &v83;
    v83 = MEMORY[0x24BDAC760];
    v84 = -1073741824;
    v85 = 0;
    v86 = __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_250;
    v87 = &unk_24DFF7D60;
    v25 = (id *)&v89;
    v89 = v76[6].isa;
    v90 = v112 & 1;
    v24 = (id *)((char *)block + 32);
    v88 = location;
    dispatch_async(queue, block);

    v26 = 0;
    objc_storeStrong(v24, 0);
    objc_storeStrong(v25, v26);
  }
  if ((v112 & 1) != 0)
  {
    isa = v76[4].isa;
    v15 = sel_statefulUIManager_didStartInstallingUpdateWithDescriptor_;
    v16 = &v77;
    v77 = MEMORY[0x24BDAC760];
    v78 = -1073741824;
    v79 = 0;
    v80 = __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_253;
    v81 = &unk_24DFF7B80;
    v19 = (id *)v82;
    v82[0] = v76[4].isa;
    v18 = (id *)(v16 + 5);
    v82[1] = v76[5].isa;
    -[objc_class executeOperationOnDelegate:usingBlock:](isa, "executeOperationOnDelegate:usingBlock:", v15, v16);
    v20 = 0;
    objc_storeStrong(v18, 0);
    objc_storeStrong(v19, v20);
  }
  v14 = 0;
  objc_storeStrong(&v93, 0);
  objc_storeStrong(&location, v14);
}

uint64_t __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_250(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) & 1);
}

void __103__SUSettingsStatefulUIManager_installUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_253(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManager:didStartInstallingUpdateWithDescriptor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)scheduleUpdate:(id)a3 completionHandler:(id)a4 operationDelegate:(id)a5 delegateCallbackQueue:(id)a6
{
  id v6;
  objc_class *v7;
  char v8;
  const char *v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  char v18;
  const char *v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  objc_class *v26;
  char v27;
  const char *v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  SUSettingsUpdateOperation *v36;
  uint64_t v37;
  id v38;
  SUSettingsUpdateOperation *v39;
  id v40;
  id v41;
  uint64_t *v42;
  id v43;
  id v44;
  id v45;
  id *v46;
  id *v47;
  id *v48;
  id *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint8_t *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  const __CFString *v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  id v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  id v72;
  id v73;
  int v74;
  id v75;
  int v76;
  const __CFString *v77;
  const __CFString *v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  int v84;
  const __CFString *v85;
  os_log_t v86;
  os_log_type_t v87[4];
  id v88;
  id v89;
  uint64_t v90;
  id v91;
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  uint64_t *v98;
  uint8_t *v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  const __CFString *v110;
  id v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  id v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  id v120;
  id v121;
  int v122;
  id v123;
  int v124;
  const __CFString *v125;
  const __CFString *v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  int v132;
  const __CFString *v133;
  os_log_t v134;
  os_log_type_t v135[4];
  id v136;
  id v137;
  uint64_t v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  int v144;
  id v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t *v148;
  uint8_t *buf;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  uint64_t v155;
  const __CFString *v156;
  id v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  id v161;
  id v162;
  const char *v163;
  const char *v164;
  uint64_t v165;
  id v166;
  id v167;
  int v168;
  id v169;
  int v170;
  const __CFString *v171;
  const __CFString *v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  int v178;
  const __CFString *v179;
  os_log_t log;
  os_log_type_t v181[4];
  id v182;
  id v183;
  uint64_t v184;
  id v185;
  id v186;
  const char *v187;
  id obj;
  id v189;
  id v190;
  _BOOL4 v191;
  uint64_t v192;
  int v193;
  int v194;
  void (*v195)(NSObject *, char, id, void *);
  void *v196;
  _QWORD v197[3];
  id v198;
  char v199;
  id v200;
  id v201;
  id v202;
  char v203;
  id v204;
  char v205;
  id v206;
  char v207;
  id v208;
  char v209;
  id v210;
  char v211;
  id v212;
  id v213;
  os_log_type_t v214;
  os_log_t v215;
  id v216;
  id v217;
  char v218;
  id v219;
  id v220;
  id v221;
  char v222;
  id v223;
  char v224;
  id v225;
  char v226;
  id v227;
  char v228;
  id v229;
  char v230;
  id v231;
  id v232;
  os_log_type_t v233;
  os_log_t v234;
  int v235;
  char v236;
  id v237;
  id v238;
  id v239;
  char v240;
  id v241;
  char v242;
  id v243;
  char v244;
  id v245;
  char v246;
  id v247;
  char v248;
  id v249;
  id v250;
  os_log_type_t type;
  os_log_t oslog;
  id v253;
  id v254;
  id v255;
  id location[2];
  id v257;
  _BYTE v258[240];
  _BYTE v259[256];
  _BYTE v260[232];
  uint64_t v261;

  obj = a4;
  v189 = a5;
  v190 = a6;
  v187 = "-[SUSettingsStatefulUIManager scheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]";
  v261 = *MEMORY[0x24BDAC8D0];
  v257 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v255 = 0;
  objc_storeStrong(&v255, obj);
  v254 = 0;
  objc_storeStrong(&v254, v189);
  v253 = 0;
  objc_storeStrong(&v253, v190);
  v6 = (id)objc_msgSend(v257, "currentDownload");
  v191 = v6 != 0;

  if (v191)
  {
    v141 = location[0];
    v143 = (id)objc_msgSend(v257, "currentDownload");
    v142 = (id)objc_msgSend(v143, "descriptor");
    v144 = objc_msgSend(v141, "isEqualToDescriptor:");

    if ((v144 & 1) != 0)
    {
      v92 = (id)objc_msgSend(v257, "log");
      v215 = (os_log_t)(id)objc_msgSend(v92, "oslog");

      v214 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v215, OS_LOG_TYPE_DEFAULT))
      {
        v86 = v215;
        *(_DWORD *)v87 = v214;
        v88 = SUSettingsUIStateToString(objc_msgSend(v257, "currentState"));
        v89 = v88;
        v213 = v89;
        v90 = objc_msgSend(v257, "currentState");
        v91 = (id)objc_msgSend(v257, "delegate");
        v211 = 0;
        v209 = 0;
        if (v91)
        {
          v212 = (id)objc_msgSend(v257, "delegate");
          v84 = 1;
          v211 = 1;
          v26 = (objc_class *)objc_opt_class();
          v210 = NSStringFromClass(v26);
          v209 = 1;
          v85 = (const __CFString *)v210;
        }
        else
        {
          v85 = CFSTR("(null)");
        }
        v78 = v85;
        v79 = (id)objc_msgSend(v257, "delegate");
        v80 = (id)objc_msgSend(v257, "scanError");
        v81 = (id)objc_msgSend(v257, "preferredStatefulDescriptor");
        v82 = (id)objc_msgSend(v257, "alternateStatefulDescriptor");
        v83 = (id)objc_msgSend(v257, "currentDownload");
        v207 = 0;
        v205 = 0;
        v203 = 0;
        if (v83)
        {
          v208 = (id)objc_msgSend(v257, "currentDownload");
          v76 = 1;
          v207 = 1;
          v206 = (id)objc_msgSend(v208, "descriptor");
          v205 = 1;
          v204 = (id)objc_msgSend(v206, "humanReadableUpdateName");
          v203 = 1;
          v77 = (const __CFString *)v204;
        }
        else
        {
          v77 = CFSTR("(null)");
        }
        v62 = v77;
        v63 = (id)objc_msgSend(v257, "currentDownload");
        v27 = objc_msgSend(v257, "performThirdPartyScan");
        v69 = "NO";
        v28 = "YES";
        v70 = "YES";
        v74 = 1;
        if ((v27 & 1) == 0)
          v28 = "NO";
        v64 = v28;
        v29 = objc_msgSend(v257, "isTargetedUpdateScheduledForAutoInstall");
        v30 = (uint64_t)v70;
        if ((v29 & 1) == 0)
          v30 = (uint64_t)v69;
        v65 = v30;
        v31 = objc_msgSend(v257, "hidingPreferredDescriptor");
        v32 = (uint64_t)v70;
        if ((v31 & 1) == 0)
          v32 = (uint64_t)v69;
        v66 = v32;
        v67 = (id)objc_msgSend(*((id *)v257 + 32), "humanReadableUpdateName");
        v68 = v67;
        v202 = v68;
        v33 = objc_msgSend(v257, "hidingAlternateDescriptor");
        v34 = (uint64_t)v70;
        if ((v33 & 1) == 0)
          v34 = (uint64_t)v69;
        v71 = v34;
        v72 = (id)objc_msgSend(*((id *)v257 + 33), "humanReadableUpdateName");
        v73 = v72;
        v201 = v73;
        v75 = (id)objc_msgSend(v257, "enrolledBetaProgram");
        v199 = 0;
        if (v75)
        {
          v200 = (id)objc_msgSend(v257, "enrolledBetaProgram");
          v199 = 1;
          v61 = objc_msgSend(v200, "programID");
        }
        else
        {
          v61 = 0;
        }
        v52 = v61;
        v60 = (id)objc_msgSend(v257, "betaPrograms");
        v53 = objc_msgSend(v60, "count");
        v59 = (id)objc_msgSend(v257, "currentFullScanOperation");
        v58 = (id)objc_msgSend(v257, "currentRefreshScanOperation");
        v57 = (id)objc_msgSend(v257, "currentUpdateOperation");
        v56 = (id)objc_msgSend(v257, "auxiliaryOperations");
        v35 = objc_msgSend(v56, "count");
        v54 = &v37;
        v55 = v258;
        __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v258, (uint64_t)v187, (uint64_t)v89, v90, (uint64_t)v78, (uint64_t)v79, (uint64_t)v80, (uint64_t)v81, (uint64_t)v82, (uint64_t)v62, (uint64_t)v63, (uint64_t)v64, v65, v66, (uint64_t)v68, v71, (uint64_t)v73, v61, v53,
          (uint64_t)v59,
          (uint64_t)v58,
          (uint64_t)v57,
          v35,
          (uint64_t)location[0]);
        _os_log_impl(&dword_21BF33000, v86, v87[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
          "\tselectedBetaProgram: %lu (count: %ld)\n"
          "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
          "\n"
          "Starting to schedule (Install Tonight) the update: %{public}@",
          v55,
          0xE8u);

        if ((v199 & 1) != 0)
        if ((v203 & 1) != 0)

        if ((v205 & 1) != 0)
        if ((v207 & 1) != 0)

        if ((v209 & 1) != 0)
        if ((v211 & 1) != 0)

        v51 = 0;
        objc_storeStrong(&v201, 0);
        objc_storeStrong(&v202, v51);
        objc_storeStrong(&v213, v51);
      }
      objc_storeStrong((id *)&v215, 0);
      v39 = [SUSettingsUpdateOperation alloc];
      v41 = (id)objc_msgSend(v257, "targetedUpdateStatefulDescriptor");
      v40 = (id)objc_msgSend(v41, "descriptor");
      v36 = -[SUSettingsUpdateOperation initWithDescriptor:usingSUManagerClient:delegate:](v39, "initWithDescriptor:usingSUManagerClient:delegate:");
      v49 = &v198;
      v198 = v36;

      objc_msgSend(v198, "setDelegateCallbackQueue:", v253);
      objc_msgSend(v198, "setCompletionQueue:", *((_QWORD *)v257 + 21));
      objc_msgSend(*((id *)v257 + 26), "addObject:", v198);
      v43 = v198;
      v45 = (id)objc_msgSend(location[0], "descriptor");
      v44 = (id)objc_msgSend(v257, "createUpdateOperationOptions");
      v42 = &v192;
      v192 = MEMORY[0x24BDAC760];
      v193 = -1073741824;
      v194 = 0;
      v195 = __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke;
      v196 = &unk_24DFF7DB0;
      v48 = (id *)v197;
      v197[0] = v257;
      v47 = (id *)(v42 + 6);
      v197[2] = v255;
      v46 = (id *)(v42 + 5);
      v197[1] = v198;
      objc_msgSend(v43, "scheduleUpdate:forInstallationTonightWithOptions:completionHandler:", v45, v44, v42);

      v50 = 0;
      objc_storeStrong(v46, 0);
      objc_storeStrong(v47, v50);
      objc_storeStrong(v48, v50);
      objc_storeStrong(v49, v50);
      v235 = 0;
    }
    else
    {
      v140 = (id)objc_msgSend(v257, "log");
      v234 = (os_log_t)(id)objc_msgSend(v140, "oslog");

      v233 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v234, OS_LOG_TYPE_DEFAULT))
      {
        v134 = v234;
        *(_DWORD *)v135 = v233;
        v136 = SUSettingsUIStateToString(objc_msgSend(v257, "currentState"));
        v137 = v136;
        v232 = v137;
        v138 = objc_msgSend(v257, "currentState");
        v139 = (id)objc_msgSend(v257, "delegate");
        v230 = 0;
        v228 = 0;
        if (v139)
        {
          v231 = (id)objc_msgSend(v257, "delegate");
          v132 = 1;
          v230 = 1;
          v17 = (objc_class *)objc_opt_class();
          v229 = NSStringFromClass(v17);
          v228 = 1;
          v133 = (const __CFString *)v229;
        }
        else
        {
          v133 = CFSTR("(null)");
        }
        v126 = v133;
        v127 = (id)objc_msgSend(v257, "delegate");
        v128 = (id)objc_msgSend(v257, "scanError");
        v129 = (id)objc_msgSend(v257, "preferredStatefulDescriptor");
        v130 = (id)objc_msgSend(v257, "alternateStatefulDescriptor");
        v131 = (id)objc_msgSend(v257, "currentDownload");
        v226 = 0;
        v224 = 0;
        v222 = 0;
        if (v131)
        {
          v227 = (id)objc_msgSend(v257, "currentDownload");
          v124 = 1;
          v226 = 1;
          v225 = (id)objc_msgSend(v227, "descriptor");
          v224 = 1;
          v223 = (id)objc_msgSend(v225, "humanReadableUpdateName");
          v222 = 1;
          v125 = (const __CFString *)v223;
        }
        else
        {
          v125 = CFSTR("(null)");
        }
        v110 = v125;
        v111 = (id)objc_msgSend(v257, "currentDownload");
        v18 = objc_msgSend(v257, "performThirdPartyScan");
        v117 = "NO";
        v19 = "YES";
        v118 = "YES";
        v122 = 1;
        if ((v18 & 1) == 0)
          v19 = "NO";
        v112 = v19;
        v20 = objc_msgSend(v257, "isTargetedUpdateScheduledForAutoInstall");
        v21 = (uint64_t)v118;
        if ((v20 & 1) == 0)
          v21 = (uint64_t)v117;
        v113 = v21;
        v22 = objc_msgSend(v257, "hidingPreferredDescriptor");
        v23 = (uint64_t)v118;
        if ((v22 & 1) == 0)
          v23 = (uint64_t)v117;
        v114 = v23;
        v115 = (id)objc_msgSend(*((id *)v257 + 32), "humanReadableUpdateName");
        v116 = v115;
        v221 = v116;
        v24 = objc_msgSend(v257, "hidingAlternateDescriptor");
        v25 = (uint64_t)v118;
        if ((v24 & 1) == 0)
          v25 = (uint64_t)v117;
        v119 = v25;
        v120 = (id)objc_msgSend(*((id *)v257 + 33), "humanReadableUpdateName");
        v121 = v120;
        v220 = v121;
        v123 = (id)objc_msgSend(v257, "enrolledBetaProgram");
        v218 = 0;
        if (v123)
        {
          v219 = (id)objc_msgSend(v257, "enrolledBetaProgram");
          v218 = 1;
          v109 = objc_msgSend(v219, "programID");
        }
        else
        {
          v109 = 0;
        }
        v94 = v109;
        v108 = (id)objc_msgSend(v257, "betaPrograms");
        v95 = objc_msgSend(v108, "count");
        v107 = (id)objc_msgSend(v257, "currentFullScanOperation");
        v106 = (id)objc_msgSend(v257, "currentRefreshScanOperation");
        v105 = (id)objc_msgSend(v257, "currentUpdateOperation");
        v104 = (id)objc_msgSend(v257, "auxiliaryOperations");
        v96 = objc_msgSend(v104, "count");
        v103 = (id)objc_msgSend(v257, "currentDownload");
        v102 = (id)objc_msgSend(v103, "descriptor");
        v101 = (id)objc_msgSend(v102, "humanReadableUpdateName");
        v97 = v101;
        v217 = v97;
        v100 = (id)objc_msgSend(location[0], "humanReadableUpdateName");
        v216 = v100;
        v98 = &v37;
        v99 = v259;
        __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66((uint64_t)v259, (uint64_t)v187, (uint64_t)v137, v138, (uint64_t)v126, (uint64_t)v127, (uint64_t)v128, (uint64_t)v129, (uint64_t)v130, (uint64_t)v110, (uint64_t)v111, (uint64_t)v112, v113, v114, (uint64_t)v116, v119, (uint64_t)v121, v109, v95,
          (uint64_t)v107,
          (uint64_t)v106,
          (uint64_t)v105,
          v96,
          (uint64_t)v97,
          (uint64_t)v216);
        _os_log_impl(&dword_21BF33000, v134, v135[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
          "\tselectedBetaProgram: %lu (count: %ld)\n"
          "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
          "\n"
          "Can not schedule the update because the current download points to a different descriptor.\n"
          "\tCurrent Download: %{public}@\n"
          "\tUpdate: %{public}@",
          v99,
          0xF2u);

        if ((v218 & 1) != 0)
        if ((v222 & 1) != 0)

        if ((v224 & 1) != 0)
        if ((v226 & 1) != 0)

        if ((v228 & 1) != 0)
        if ((v230 & 1) != 0)

        v93 = 0;
        objc_storeStrong(&v216, 0);
        objc_storeStrong(&v217, v93);
        objc_storeStrong(&v220, v93);
        objc_storeStrong(&v221, v93);
        objc_storeStrong(&v232, v93);
      }
      objc_storeStrong((id *)&v234, 0);
      v235 = 1;
    }
  }
  else
  {
    v186 = (id)objc_msgSend(v257, "log");
    oslog = (os_log_t)(id)objc_msgSend(v186, "oslog");

    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      *(_DWORD *)v181 = type;
      v182 = SUSettingsUIStateToString(objc_msgSend(v257, "currentState"));
      v183 = v182;
      v250 = v183;
      v184 = objc_msgSend(v257, "currentState");
      v185 = (id)objc_msgSend(v257, "delegate");
      v248 = 0;
      v246 = 0;
      if (v185)
      {
        v249 = (id)objc_msgSend(v257, "delegate");
        v178 = 1;
        v248 = 1;
        v7 = (objc_class *)objc_opt_class();
        v247 = NSStringFromClass(v7);
        v246 = 1;
        v179 = (const __CFString *)v247;
      }
      else
      {
        v179 = CFSTR("(null)");
      }
      v172 = v179;
      v173 = (id)objc_msgSend(v257, "delegate");
      v174 = (id)objc_msgSend(v257, "scanError");
      v175 = (id)objc_msgSend(v257, "preferredStatefulDescriptor");
      v176 = (id)objc_msgSend(v257, "alternateStatefulDescriptor");
      v177 = (id)objc_msgSend(v257, "currentDownload");
      v244 = 0;
      v242 = 0;
      v240 = 0;
      if (v177)
      {
        v245 = (id)objc_msgSend(v257, "currentDownload");
        v170 = 1;
        v244 = 1;
        v243 = (id)objc_msgSend(v245, "descriptor");
        v242 = 1;
        v241 = (id)objc_msgSend(v243, "humanReadableUpdateName");
        v240 = 1;
        v171 = (const __CFString *)v241;
      }
      else
      {
        v171 = CFSTR("(null)");
      }
      v156 = v171;
      v157 = (id)objc_msgSend(v257, "currentDownload");
      v8 = objc_msgSend(v257, "performThirdPartyScan");
      v163 = "NO";
      v9 = "YES";
      v164 = "YES";
      v168 = 1;
      if ((v8 & 1) == 0)
        v9 = "NO";
      v158 = v9;
      v10 = objc_msgSend(v257, "isTargetedUpdateScheduledForAutoInstall");
      v11 = (uint64_t)v164;
      if ((v10 & 1) == 0)
        v11 = (uint64_t)v163;
      v159 = v11;
      v12 = objc_msgSend(v257, "hidingPreferredDescriptor");
      v13 = (uint64_t)v164;
      if ((v12 & 1) == 0)
        v13 = (uint64_t)v163;
      v160 = v13;
      v161 = (id)objc_msgSend(*((id *)v257 + 32), "humanReadableUpdateName");
      v162 = v161;
      v239 = v162;
      v14 = objc_msgSend(v257, "hidingAlternateDescriptor");
      v15 = (uint64_t)v164;
      if ((v14 & 1) == 0)
        v15 = (uint64_t)v163;
      v165 = v15;
      v166 = (id)objc_msgSend(*((id *)v257 + 33), "humanReadableUpdateName");
      v167 = v166;
      v238 = v167;
      v169 = (id)objc_msgSend(v257, "enrolledBetaProgram");
      v236 = 0;
      if (v169)
      {
        v237 = (id)objc_msgSend(v257, "enrolledBetaProgram");
        v236 = 1;
        v155 = objc_msgSend(v237, "programID");
      }
      else
      {
        v155 = 0;
      }
      v146 = v155;
      v154 = (id)objc_msgSend(v257, "betaPrograms");
      v147 = objc_msgSend(v154, "count");
      v153 = (id)objc_msgSend(v257, "currentFullScanOperation");
      v152 = (id)objc_msgSend(v257, "currentRefreshScanOperation");
      v151 = (id)objc_msgSend(v257, "currentUpdateOperation");
      v150 = (id)objc_msgSend(v257, "auxiliaryOperations");
      v16 = objc_msgSend(v150, "count");
      v148 = &v37;
      buf = v260;
      __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v260, (uint64_t)v187, (uint64_t)v183, v184, (uint64_t)v172, (uint64_t)v173, (uint64_t)v174, (uint64_t)v175, (uint64_t)v176, (uint64_t)v156, (uint64_t)v157, (uint64_t)v158, v159, v160, (uint64_t)v162, v165, (uint64_t)v167, v155, v147,
        (uint64_t)v153,
        (uint64_t)v152,
        (uint64_t)v151,
        v16,
        (uint64_t)location[0]);
      _os_log_impl(&dword_21BF33000, log, v181[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Can't schedule update as the current download is nil (and thus no update has been downloaded). You should use do"
        "wnloadAndScheduleUpdate: to do both operations. Update: %{public}@",
        buf,
        0xE8u);

      if ((v236 & 1) != 0)
      if ((v240 & 1) != 0)

      if ((v242 & 1) != 0)
      if ((v244 & 1) != 0)

      if ((v246 & 1) != 0)
      if ((v248 & 1) != 0)

      v145 = 0;
      objc_storeStrong(&v238, 0);
      objc_storeStrong(&v239, v145);
      objc_storeStrong(&v250, v145);
    }
    objc_storeStrong((id *)&oslog, 0);
    v235 = 1;
  }
  v38 = 0;
  objc_storeStrong(&v253, 0);
  objc_storeStrong(&v254, v38);
  objc_storeStrong(&v255, v38);
  objc_storeStrong(location, v38);
}

void __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke(NSObject *a1, char a2, id obj, void *a4)
{
  objc_class *v4;
  char v5;
  const char *v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  int v17;
  int v18;
  id v19;
  id v20;
  id *v21;
  Class isa;
  id v23;
  id *v24;
  id *v25;
  id *v26;
  id *v27;
  id *v28;
  id v29;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v32;
  id *v33;
  id *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint8_t *buf;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  const __CFString *v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  id v57;
  id v58;
  int v59;
  id v60;
  int v61;
  const __CFString *v62;
  const __CFString *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  int v69;
  const __CFString *v70;
  os_log_t log;
  os_log_type_t v72[4];
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  id v77;
  const char *v78;
  id obja;
  NSObject *v80;
  uint64_t v81;
  int v82;
  int v83;
  void (*v84)(NSObject *, char);
  void *v85;
  _QWORD v86[5];
  char v87;
  int v88;
  uint64_t v89;
  int v90;
  int v91;
  uint64_t (*v92)(uint64_t);
  void *v93;
  id v94;
  objc_class *v95;
  char v96;
  id v97;
  id v98;
  id v99;
  char v100;
  id v101;
  char v102;
  id v103;
  char v104;
  id v105;
  char v106;
  id v107;
  char v108;
  id v109;
  id v110;
  os_log_type_t type;
  os_log_t oslog[2];
  id v113;
  id location;
  unsigned __int8 v115;
  NSObject *v116;
  _BYTE v117[248];
  uint64_t v118;

  v80 = a1;
  obja = a4;
  v78 = "-[SUSettingsStatefulUIManager scheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke";
  v118 = *MEMORY[0x24BDAC8D0];
  v116 = a1;
  v115 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v113 = 0;
  objc_storeStrong(&v113, obja);
  oslog[1] = v80;
  v77 = (id)-[objc_class log](v80[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v77, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v72 = type;
    v73 = SUSettingsUIStateToString(-[objc_class currentState](v80[4].isa, "currentState"));
    v74 = v73;
    v110 = v74;
    v75 = -[objc_class currentState](v80[4].isa, "currentState");
    v76 = (id)-[objc_class delegate](v80[4].isa, "delegate");
    v108 = 0;
    v106 = 0;
    if (v76)
    {
      v109 = (id)-[objc_class delegate](v80[4].isa, "delegate");
      v69 = 1;
      v108 = 1;
      v4 = (objc_class *)objc_opt_class();
      v107 = NSStringFromClass(v4);
      v106 = 1;
      v70 = (const __CFString *)v107;
    }
    else
    {
      v70 = CFSTR("(null)");
    }
    v63 = v70;
    v64 = (id)-[objc_class delegate](v80[4].isa, "delegate");
    v65 = (id)-[objc_class scanError](v80[4].isa, "scanError");
    v66 = (id)-[objc_class preferredStatefulDescriptor](v80[4].isa, "preferredStatefulDescriptor");
    v67 = (id)-[objc_class alternateStatefulDescriptor](v80[4].isa, "alternateStatefulDescriptor");
    v68 = (id)-[objc_class currentDownload](v80[4].isa, "currentDownload");
    v104 = 0;
    v102 = 0;
    v100 = 0;
    if (v68)
    {
      v105 = (id)-[objc_class currentDownload](v80[4].isa, "currentDownload");
      v61 = 1;
      v104 = 1;
      v103 = (id)objc_msgSend(v105, "descriptor");
      v102 = 1;
      v101 = (id)objc_msgSend(v103, "humanReadableUpdateName");
      v100 = 1;
      v62 = (const __CFString *)v101;
    }
    else
    {
      v62 = CFSTR("(null)");
    }
    v47 = v62;
    v48 = (id)-[objc_class currentDownload](v80[4].isa, "currentDownload");
    v5 = -[objc_class performThirdPartyScan](v80[4].isa, "performThirdPartyScan");
    v54 = "NO";
    v6 = "YES";
    v55 = "YES";
    v59 = 1;
    if ((v5 & 1) == 0)
      v6 = "NO";
    v49 = v6;
    v7 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v80[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v8 = (uint64_t)v55;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v54;
    v50 = v8;
    v9 = -[objc_class hidingPreferredDescriptor](v80[4].isa, "hidingPreferredDescriptor");
    v10 = (uint64_t)v55;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v54;
    v51 = v10;
    v52 = (id)objc_msgSend(*((id *)v80[4].isa + 32), "humanReadableUpdateName");
    v53 = v52;
    v99 = v53;
    v11 = -[objc_class hidingAlternateDescriptor](v80[4].isa, "hidingAlternateDescriptor");
    v12 = (uint64_t)v55;
    if ((v11 & 1) == 0)
      v12 = (uint64_t)v54;
    v56 = v12;
    v57 = (id)objc_msgSend(*((id *)v80[4].isa + 33), "humanReadableUpdateName");
    v58 = v57;
    v98 = v58;
    v60 = (id)-[objc_class enrolledBetaProgram](v80[4].isa, "enrolledBetaProgram");
    v96 = 0;
    if (v60)
    {
      v97 = (id)-[objc_class enrolledBetaProgram](v80[4].isa, "enrolledBetaProgram");
      v96 = 1;
      v46 = objc_msgSend(v97, "programID");
    }
    else
    {
      v46 = 0;
    }
    v37 = v46;
    v45 = (id)-[objc_class betaPrograms](v80[4].isa, "betaPrograms");
    v38 = objc_msgSend(v45, "count");
    v44 = (id)-[objc_class currentFullScanOperation](v80[4].isa, "currentFullScanOperation");
    v43 = (id)-[objc_class currentRefreshScanOperation](v80[4].isa, "currentRefreshScanOperation");
    v42 = (id)-[objc_class currentUpdateOperation](v80[4].isa, "currentUpdateOperation");
    v41 = (id)-[objc_class auxiliaryOperations](v80[4].isa, "auxiliaryOperations");
    v13 = objc_msgSend(v41, "count");
    v39 = &v15;
    buf = v117;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_8_66((uint64_t)v117, (uint64_t)v78, (uint64_t)v74, v75, (uint64_t)v63, (uint64_t)v64, (uint64_t)v65, (uint64_t)v66, (uint64_t)v67, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, v50, v51, (uint64_t)v53, v56, (uint64_t)v58, v46, v38,
      (uint64_t)v44,
      (uint64_t)v43,
      (uint64_t)v42,
      v13,
      v115 & 1,
      (uint64_t)v113);
    _os_log_impl(&dword_21BF33000, log, v72[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Schedule (Install Tonight) operation completed with result: %d; error: %{public}@",
      buf,
      0xEEu);

    if ((v96 & 1) != 0)
    if ((v100 & 1) != 0)

    if ((v102 & 1) != 0)
    if ((v104 & 1) != 0)

    if ((v106 & 1) != 0)
    if ((v108 & 1) != 0)

    v36 = 0;
    objc_storeStrong(&v98, 0);
    objc_storeStrong(&v99, v36);
    objc_storeStrong(&v110, v36);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong((id *)v80[4].isa + 25, 0);
  if ((v115 & 1) != 0)
  {
    objc_storeStrong((id *)v80[4].isa + 31, location);
    v14 = v80;
    *((_BYTE *)v80[4].isa + 14) = v115 & 1;
    if (*((_QWORD *)v14[4].isa + 31))
      objc_msgSend(*((id *)v80[4].isa + 31), "setDelegate:", v80[4].isa);
    isa = v80[4].isa;
    v23 = (id)-[objc_class currentDownload](v80[4].isa, "currentDownload");
    v18 = v115;
    v19 = location;
    v20 = v113;
    v21 = (id *)&v81;
    v81 = MEMORY[0x24BDAC760];
    v82 = -1073741824;
    v83 = 0;
    v84 = __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2;
    v85 = &unk_24DFF7C48;
    v28 = (id *)v86;
    v86[0] = v80[4].isa;
    v17 = 1;
    v87 = v115 & 1;
    v27 = v21 + 8;
    v86[4] = v80[6].isa;
    v26 = v21 + 5;
    v86[1] = location;
    v25 = v21 + 6;
    v86[2] = v113;
    v24 = v21 + 7;
    v86[3] = v80[5].isa;
    -[objc_class performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:](isa, "performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:", v17 & 1, v23, v18 & 1, v19, v20, v21);

    v29 = 0;
    objc_storeStrong(v24, 0);
    objc_storeStrong(v25, v29);
    objc_storeStrong(v26, v29);
    objc_storeStrong(v27, v29);
    objc_storeStrong(v28, v29);
    v88 = 0;
  }
  else
  {
    if (v80[6].isa)
    {
      v32 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
      queue = (dispatch_queue_t)(id)objc_msgSend(v32, "selectDelegateCallbackQueue:", *((_QWORD *)v80[4].isa + 5));
      block = &v89;
      v89 = MEMORY[0x24BDAC760];
      v90 = -1073741824;
      v91 = 0;
      v92 = __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_256;
      v93 = &unk_24DFF7BD0;
      v34 = (id *)&v95;
      v95 = v80[6].isa;
      v33 = (id *)((char *)block + 32);
      v94 = v113;
      dispatch_async(queue, block);

      v35 = 0;
      objc_storeStrong(v33, 0);
      objc_storeStrong(v34, v35);
    }
    v88 = 1;
  }
  v16 = 0;
  objc_storeStrong(&v113, 0);
  objc_storeStrong(&location, v16);
}

uint64_t __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_256(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
}

void __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2(NSObject *a1, char a2)
{
  objc_class *v2;
  char v3;
  const char *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  Class isa;
  id *v17;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v20;
  id *v21;
  id *v22;
  id *v23;
  id v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint8_t *buf;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  id v46;
  id v47;
  int v48;
  id v49;
  int v50;
  const __CFString *v51;
  const __CFString *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  int v58;
  const __CFString *v59;
  os_log_t log;
  os_log_type_t v61[4];
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  int v70;
  int v71;
  void (*v72)(uint64_t);
  void *v73;
  objc_class *v74;
  uint64_t v75;
  int v76;
  int v77;
  uint64_t (*v78)(uint64_t);
  void *v79;
  objc_class *v80;
  objc_class *v81;
  objc_class *v82;
  char v83;
  char v84;
  id v85;
  id location;
  id v87;
  char v88;
  id v89;
  char v90;
  id v91;
  char v92;
  id v93;
  char v94;
  id v95;
  char v96;
  id v97;
  id v98;
  os_log_type_t type;
  os_log_t oslog[2];
  char v101;
  NSObject *v102;
  _BYTE v103[232];
  uint64_t v104;

  v67 = a1;
  v68 = "-[SUSettingsStatefulUIManager scheduleUpdate:completionHandler:operationDelegate:delegateCallbackQueue:]_block_invoke_2";
  v104 = *MEMORY[0x24BDAC8D0];
  v102 = a1;
  v101 = a2 & 1;
  oslog[1] = a1;
  v66 = (id)-[objc_class log](a1[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v66, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v61 = type;
    v62 = SUSettingsUIStateToString(-[objc_class currentState](v67[4].isa, "currentState"));
    v63 = v62;
    v98 = v63;
    v64 = -[objc_class currentState](v67[4].isa, "currentState");
    v65 = (id)-[objc_class delegate](v67[4].isa, "delegate");
    v96 = 0;
    v94 = 0;
    if (v65)
    {
      v97 = (id)-[objc_class delegate](v67[4].isa, "delegate");
      v58 = 1;
      v96 = 1;
      v2 = (objc_class *)objc_opt_class();
      v95 = NSStringFromClass(v2);
      v94 = 1;
      v59 = (const __CFString *)v95;
    }
    else
    {
      v59 = CFSTR("(null)");
    }
    v52 = v59;
    v53 = (id)-[objc_class delegate](v67[4].isa, "delegate");
    v54 = (id)-[objc_class scanError](v67[4].isa, "scanError");
    v55 = (id)-[objc_class preferredStatefulDescriptor](v67[4].isa, "preferredStatefulDescriptor");
    v56 = (id)-[objc_class alternateStatefulDescriptor](v67[4].isa, "alternateStatefulDescriptor");
    v57 = (id)-[objc_class currentDownload](v67[4].isa, "currentDownload");
    v92 = 0;
    v90 = 0;
    v88 = 0;
    if (v57)
    {
      v93 = (id)-[objc_class currentDownload](v67[4].isa, "currentDownload");
      v50 = 1;
      v92 = 1;
      v91 = (id)objc_msgSend(v93, "descriptor");
      v90 = 1;
      v89 = (id)objc_msgSend(v91, "humanReadableUpdateName");
      v88 = 1;
      v51 = (const __CFString *)v89;
    }
    else
    {
      v51 = CFSTR("(null)");
    }
    v36 = v51;
    v37 = (id)-[objc_class currentDownload](v67[4].isa, "currentDownload");
    v3 = -[objc_class performThirdPartyScan](v67[4].isa, "performThirdPartyScan");
    v43 = "NO";
    v4 = "YES";
    v44 = "YES";
    v48 = 1;
    if ((v3 & 1) == 0)
      v4 = "NO";
    v38 = v4;
    v5 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v67[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v6 = (uint64_t)v44;
    if ((v5 & 1) == 0)
      v6 = (uint64_t)v43;
    v39 = v6;
    v7 = -[objc_class hidingPreferredDescriptor](v67[4].isa, "hidingPreferredDescriptor");
    v8 = (uint64_t)v44;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v43;
    v40 = v8;
    v41 = (id)objc_msgSend(*((id *)v67[4].isa + 32), "humanReadableUpdateName");
    v42 = v41;
    v87 = v42;
    v9 = -[objc_class hidingAlternateDescriptor](v67[4].isa, "hidingAlternateDescriptor");
    v10 = (uint64_t)v44;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v43;
    v45 = v10;
    v46 = (id)objc_msgSend(*((id *)v67[4].isa + 33), "humanReadableUpdateName");
    v47 = v46;
    location = v47;
    v49 = (id)-[objc_class enrolledBetaProgram](v67[4].isa, "enrolledBetaProgram");
    v84 = 0;
    if (v49)
    {
      v85 = (id)-[objc_class enrolledBetaProgram](v67[4].isa, "enrolledBetaProgram");
      v84 = 1;
      v35 = objc_msgSend(v85, "programID");
    }
    else
    {
      v35 = 0;
    }
    v26 = v35;
    v34 = (id)-[objc_class betaPrograms](v67[4].isa, "betaPrograms");
    v27 = objc_msgSend(v34, "count");
    v33 = (id)-[objc_class currentFullScanOperation](v67[4].isa, "currentFullScanOperation");
    v32 = (id)-[objc_class currentRefreshScanOperation](v67[4].isa, "currentRefreshScanOperation");
    v31 = (id)-[objc_class currentUpdateOperation](v67[4].isa, "currentUpdateOperation");
    v30 = (id)-[objc_class auxiliaryOperations](v67[4].isa, "auxiliaryOperations");
    v11 = objc_msgSend(v30, "count");
    v12 = (uint64_t)v67[9].isa & 1;
    v28 = &v13;
    buf = v103;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0((uint64_t)v103, (uint64_t)v68, (uint64_t)v63, v64, (uint64_t)v52, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v36, (uint64_t)v37, (uint64_t)v38, v39, v40, (uint64_t)v42, v45, (uint64_t)v47, v35, v27,
      (uint64_t)v33,
      (uint64_t)v32,
      (uint64_t)v31,
      v11,
      v12);
    _os_log_impl(&dword_21BF33000, log, v61[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform an update of type \"Install Tonight\" with result: %d",
      buf,
      0xE4u);

    if ((v84 & 1) != 0)
    if ((v88 & 1) != 0)

    if ((v90 & 1) != 0)
    if ((v92 & 1) != 0)

    if ((v94 & 1) != 0)
    if ((v96 & 1) != 0)

    obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v87, obj);
    objc_storeStrong(&v98, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v67[8].isa)
  {
    v20 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    queue = (dispatch_queue_t)(id)objc_msgSend(v20, "selectDelegateCallbackQueue:", *((_QWORD *)v67[4].isa + 5));
    block = &v75;
    v75 = MEMORY[0x24BDAC760];
    v76 = -1073741824;
    v77 = 0;
    v78 = __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_257;
    v79 = &unk_24DFF7CC0;
    v23 = (id *)&v82;
    v82 = v67[8].isa;
    v83 = (uint64_t)v67[9].isa & 1;
    v22 = (id *)((char *)block + 32);
    v80 = v67[5].isa;
    v21 = (id *)((char *)block + 40);
    v81 = v67[6].isa;
    dispatch_async(queue, block);

    v24 = 0;
    objc_storeStrong(v21, 0);
    objc_storeStrong(v22, v24);
    objc_storeStrong(v23, v24);
  }
  isa = v67[4].isa;
  v14 = sel_statefulUIManagerDidRefreshState_;
  v15 = &v69;
  v69 = MEMORY[0x24BDAC760];
  v70 = -1073741824;
  v71 = 0;
  v72 = __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_258;
  v73 = &unk_24DFF7B58;
  v17 = (id *)&v74;
  v74 = v67[4].isa;
  -[objc_class executeOperationOnDelegate:usingBlock:](isa, "executeOperationOnDelegate:usingBlock:", v14, v15);
  objc_msgSend(*((id *)v67[4].isa + 26), "removeObject:", v67[7].isa);
  objc_storeStrong(v17, 0);
}

uint64_t __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_257(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56) & 1);
}

void __104__SUSettingsStatefulUIManager_scheduleUpdate_completionHandler_operationDelegate_delegateCallbackQueue___block_invoke_2_258(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManagerDidRefreshState:", *(_QWORD *)(a1 + 32));

}

- (void)promoteTargetedUpdateToUserInitiatedStatus
{
  SUDownload *v2;
  objc_class *v3;
  char v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  SUSettingsUpdateOperation *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id *v18;
  id v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint8_t *buf;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  const __CFString *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  id v41;
  id v42;
  int v43;
  id v44;
  int v45;
  const __CFString *v46;
  const __CFString *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  int v53;
  const __CFString *v54;
  os_log_t log;
  os_log_type_t v56[4];
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  id v61;
  const char *v62;
  _BOOL4 v63;
  uint64_t v64;
  int v65;
  int v66;
  void (*v67)(NSObject *, void *, int, void *);
  void *v68;
  id v69;
  id v70;
  id v71;
  char v72;
  id v73;
  id location;
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  char v82;
  id v83;
  char v84;
  id v85;
  id v86;
  os_log_type_t type;
  os_log_t oslog[2];
  id v89;
  _BYTE v90[232];
  uint64_t v91;

  v62 = "-[SUSettingsStatefulUIManager promoteTargetedUpdateToUserInitiatedStatus]";
  v91 = *MEMORY[0x24BDAC8D0];
  v89 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[SUSettingsStatefulUIManager currentDownload](self, "currentDownload");
  v63 = v2 != 0;

  if (v63)
  {
    v13 = [SUSettingsUpdateOperation alloc];
    v15 = (id)objc_msgSend(v89, "targetedUpdateStatefulDescriptor");
    v14 = (id)objc_msgSend(v15, "descriptor");
    v19 = 0;
    v18 = &v71;
    v71 = -[SUSettingsUpdateOperation initWithDescriptor:usingSUManagerClient:delegate:](v13, "initWithDescriptor:usingSUManagerClient:delegate:");

    objc_msgSend(v71, "setDelegateCallbackQueue:", *((_QWORD *)v89 + 21));
    objc_msgSend(v71, "setCompletionQueue:", *((_QWORD *)v89 + 21));
    objc_msgSend(*((id *)v89 + 26), "addObject:", v71);
    v16 = v71;
    v17 = (id)objc_msgSend(v89, "currentDownload");
    v64 = MEMORY[0x24BDAC760];
    v65 = -1073741824;
    v66 = 0;
    v67 = __73__SUSettingsStatefulUIManager_promoteTargetedUpdateToUserInitiatedStatus__block_invoke;
    v68 = &unk_24DFF7DD8;
    v69 = v89;
    v70 = v71;
    objc_msgSend(v16, "promoteDownloadToUserInitiated:completionHandler:", v17, &v64);

    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v69, 0);
    objc_storeStrong(&v71, 0);
  }
  else
  {
    v61 = (id)objc_msgSend(v89, "log");
    oslog[0] = (os_log_t)(id)objc_msgSend(v61, "oslog");

    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      log = oslog[0];
      *(_DWORD *)v56 = type;
      v57 = SUSettingsUIStateToString(objc_msgSend(v89, "currentState"));
      v58 = v57;
      v86 = v58;
      v59 = objc_msgSend(v89, "currentState");
      v60 = (id)objc_msgSend(v89, "delegate");
      v84 = 0;
      v82 = 0;
      if (v60)
      {
        v85 = (id)objc_msgSend(v89, "delegate");
        v53 = 1;
        v84 = 1;
        v3 = (objc_class *)objc_opt_class();
        v83 = NSStringFromClass(v3);
        v82 = 1;
        v54 = (const __CFString *)v83;
      }
      else
      {
        v54 = CFSTR("(null)");
      }
      v47 = v54;
      v48 = (id)objc_msgSend(v89, "delegate");
      v49 = (id)objc_msgSend(v89, "scanError");
      v50 = (id)objc_msgSend(v89, "preferredStatefulDescriptor");
      v51 = (id)objc_msgSend(v89, "alternateStatefulDescriptor");
      v52 = (id)objc_msgSend(v89, "currentDownload");
      v80 = 0;
      v78 = 0;
      v76 = 0;
      if (v52)
      {
        v81 = (id)objc_msgSend(v89, "currentDownload");
        v45 = 1;
        v80 = 1;
        v79 = (id)objc_msgSend(v81, "descriptor");
        v78 = 1;
        v77 = (id)objc_msgSend(v79, "humanReadableUpdateName");
        v76 = 1;
        v46 = (const __CFString *)v77;
      }
      else
      {
        v46 = CFSTR("(null)");
      }
      v31 = v46;
      v32 = (id)objc_msgSend(v89, "currentDownload");
      v4 = objc_msgSend(v89, "performThirdPartyScan");
      v38 = "NO";
      v5 = "YES";
      v39 = "YES";
      v43 = 1;
      if ((v4 & 1) == 0)
        v5 = "NO";
      v33 = v5;
      v6 = objc_msgSend(v89, "isTargetedUpdateScheduledForAutoInstall");
      v7 = (uint64_t)v39;
      if ((v6 & 1) == 0)
        v7 = (uint64_t)v38;
      v34 = v7;
      v8 = objc_msgSend(v89, "hidingPreferredDescriptor");
      v9 = (uint64_t)v39;
      if ((v8 & 1) == 0)
        v9 = (uint64_t)v38;
      v35 = v9;
      v36 = (id)objc_msgSend(*((id *)v89 + 32), "humanReadableUpdateName");
      v37 = v36;
      v75 = v37;
      v10 = objc_msgSend(v89, "hidingAlternateDescriptor");
      v11 = (uint64_t)v39;
      if ((v10 & 1) == 0)
        v11 = (uint64_t)v38;
      v40 = v11;
      v41 = (id)objc_msgSend(*((id *)v89 + 33), "humanReadableUpdateName");
      v42 = v41;
      location = v42;
      v44 = (id)objc_msgSend(v89, "enrolledBetaProgram");
      v72 = 0;
      if (v44)
      {
        v73 = (id)objc_msgSend(v89, "enrolledBetaProgram");
        v72 = 1;
        v30 = objc_msgSend(v73, "programID");
      }
      else
      {
        v30 = 0;
      }
      v21 = v30;
      v29 = (id)objc_msgSend(v89, "betaPrograms");
      v22 = objc_msgSend(v29, "count");
      v28 = (id)objc_msgSend(v89, "currentFullScanOperation");
      v27 = (id)objc_msgSend(v89, "currentRefreshScanOperation");
      v26 = (id)objc_msgSend(v89, "currentUpdateOperation");
      v25 = (id)objc_msgSend(v89, "auxiliaryOperations");
      v23 = &v12;
      buf = v90;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v90, (uint64_t)v62, (uint64_t)v58, v59, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, v34, v35, (uint64_t)v37, v40, (uint64_t)v42, v30, v22,
        (uint64_t)v28,
        (uint64_t)v27,
        (uint64_t)v26,
        objc_msgSend(v25, "count"));
      _os_log_impl(&dword_21BF33000, log, v56[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Can not promote the initial status of a nil targeted update.",
        buf,
        0xDEu);

      if ((v72 & 1) != 0)
      if ((v76 & 1) != 0)

      if ((v78 & 1) != 0)
      if ((v80 & 1) != 0)

      if ((v82 & 1) != 0)
      if ((v84 & 1) != 0)

      obj = 0;
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v75, obj);
      objc_storeStrong(&v86, obj);
    }
    objc_storeStrong((id *)oslog, 0);
  }
}

void __73__SUSettingsStatefulUIManager_promoteTargetedUpdateToUserInitiatedStatus__block_invoke(NSObject *a1, void *a2, int a3, void *a4)
{
  objc_class *v4;
  char v5;
  const char *v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  char *v16;
  uint64_t *v17;
  Class isa;
  id *v19;
  id *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint8_t *buf;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  id v43;
  id v44;
  int v45;
  id v46;
  int v47;
  const __CFString *v48;
  const __CFString *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  int v55;
  const __CFString *v56;
  os_log_t log;
  os_log_type_t v58[4];
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  id v63;
  const char *v64;
  int v65;
  id obj;
  NSObject *v67;
  uint64_t v68;
  int v69;
  int v70;
  void (*v71)(uint64_t);
  void *v72;
  objc_class *v73;
  char v74;
  id v75;
  id v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  char v82;
  id v83;
  char v84;
  id v85;
  char v86;
  id v87;
  id v88;
  os_log_type_t type;
  os_log_t oslog[2];
  id v91;
  char v92;
  id location[2];
  _BYTE v94[248];
  uint64_t v95;

  v67 = a1;
  v65 = a3;
  obj = a4;
  v64 = "-[SUSettingsStatefulUIManager promoteTargetedUpdateToUserInitiatedStatus]_block_invoke";
  v95 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v92 = v65 & 1;
  v91 = 0;
  objc_storeStrong(&v91, obj);
  oslog[1] = v67;
  v63 = (id)-[objc_class log](v67[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v63, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v58 = type;
    v59 = SUSettingsUIStateToString(-[objc_class currentState](v67[4].isa, "currentState"));
    v60 = v59;
    v88 = v60;
    v61 = -[objc_class currentState](v67[4].isa, "currentState");
    v62 = (id)-[objc_class delegate](v67[4].isa, "delegate");
    v86 = 0;
    v84 = 0;
    if (v62)
    {
      v87 = (id)-[objc_class delegate](v67[4].isa, "delegate");
      v55 = 1;
      v86 = 1;
      v4 = (objc_class *)objc_opt_class();
      v85 = NSStringFromClass(v4);
      v84 = 1;
      v56 = (const __CFString *)v85;
    }
    else
    {
      v56 = CFSTR("(null)");
    }
    v49 = v56;
    v50 = (id)-[objc_class delegate](v67[4].isa, "delegate");
    v51 = (id)-[objc_class scanError](v67[4].isa, "scanError");
    v52 = (id)-[objc_class preferredStatefulDescriptor](v67[4].isa, "preferredStatefulDescriptor");
    v53 = (id)-[objc_class alternateStatefulDescriptor](v67[4].isa, "alternateStatefulDescriptor");
    v54 = (id)-[objc_class currentDownload](v67[4].isa, "currentDownload");
    v82 = 0;
    v80 = 0;
    v78 = 0;
    if (v54)
    {
      v83 = (id)-[objc_class currentDownload](v67[4].isa, "currentDownload");
      v47 = 1;
      v82 = 1;
      v81 = (id)objc_msgSend(v83, "descriptor");
      v80 = 1;
      v79 = (id)objc_msgSend(v81, "humanReadableUpdateName");
      v78 = 1;
      v48 = (const __CFString *)v79;
    }
    else
    {
      v48 = CFSTR("(null)");
    }
    v33 = v48;
    v34 = (id)-[objc_class currentDownload](v67[4].isa, "currentDownload");
    v5 = -[objc_class performThirdPartyScan](v67[4].isa, "performThirdPartyScan");
    v40 = "NO";
    v6 = "YES";
    v41 = "YES";
    v45 = 1;
    if ((v5 & 1) == 0)
      v6 = "NO";
    v35 = v6;
    v7 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v67[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v8 = (uint64_t)v41;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v40;
    v36 = v8;
    v9 = -[objc_class hidingPreferredDescriptor](v67[4].isa, "hidingPreferredDescriptor");
    v10 = (uint64_t)v41;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v40;
    v37 = v10;
    v38 = (id)objc_msgSend(*((id *)v67[4].isa + 32), "humanReadableUpdateName");
    v39 = v38;
    v77 = v39;
    v11 = -[objc_class hidingAlternateDescriptor](v67[4].isa, "hidingAlternateDescriptor");
    v12 = (uint64_t)v41;
    if ((v11 & 1) == 0)
      v12 = (uint64_t)v40;
    v42 = v12;
    v43 = (id)objc_msgSend(*((id *)v67[4].isa + 33), "humanReadableUpdateName");
    v44 = v43;
    v76 = v44;
    v46 = (id)-[objc_class enrolledBetaProgram](v67[4].isa, "enrolledBetaProgram");
    v74 = 0;
    if (v46)
    {
      v75 = (id)-[objc_class enrolledBetaProgram](v67[4].isa, "enrolledBetaProgram");
      v74 = 1;
      v32 = objc_msgSend(v75, "programID");
    }
    else
    {
      v32 = 0;
    }
    v23 = v32;
    v31 = (id)-[objc_class betaPrograms](v67[4].isa, "betaPrograms");
    v24 = objc_msgSend(v31, "count");
    v30 = (id)-[objc_class currentFullScanOperation](v67[4].isa, "currentFullScanOperation");
    v29 = (id)-[objc_class currentRefreshScanOperation](v67[4].isa, "currentRefreshScanOperation");
    v28 = (id)-[objc_class currentUpdateOperation](v67[4].isa, "currentUpdateOperation");
    v27 = (id)-[objc_class auxiliaryOperations](v67[4].isa, "auxiliaryOperations");
    v13 = objc_msgSend(v27, "count");
    if ((v92 & 1) != 0)
      v14 = "succeeded";
    else
      v14 = "failed";
    v25 = &v15;
    buf = v94;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_34_8_66((uint64_t)v94, (uint64_t)v64, (uint64_t)v60, v61, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, (uint64_t)v53, (uint64_t)v33, (uint64_t)v34, (uint64_t)v35, v36, v37, (uint64_t)v39, v42, (uint64_t)v44, v23, v24,
      (uint64_t)v30,
      (uint64_t)v29,
      (uint64_t)v28,
      v13,
      (uint64_t)v14,
      (uint64_t)v91);
    _os_log_impl(&dword_21BF33000, log, v58[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Promote targeted update to user initiated status: %{public}s; error: %{public}@",
      buf,
      0xF2u);

    if ((v74 & 1) != 0)
    if ((v78 & 1) != 0)

    if ((v80 & 1) != 0)
    if ((v82 & 1) != 0)

    if ((v84 & 1) != 0)
    if ((v86 & 1) != 0)

    v22 = 0;
    objc_storeStrong(&v76, 0);
    objc_storeStrong(&v77, v22);
    objc_storeStrong(&v88, v22);
  }
  objc_storeStrong((id *)oslog, 0);
  v20 = location;
  -[objc_class setCurrentDownload:](v67[4].isa, "setCurrentDownload:", location[0]);
  isa = v67[4].isa;
  v16 = sel_statefulUIManagerDidRefreshState_;
  v17 = &v68;
  v68 = MEMORY[0x24BDAC760];
  v69 = -1073741824;
  v70 = 0;
  v71 = __73__SUSettingsStatefulUIManager_promoteTargetedUpdateToUserInitiatedStatus__block_invoke_262;
  v72 = &unk_24DFF7B58;
  v19 = (id *)&v73;
  v73 = v67[4].isa;
  -[objc_class executeOperationOnDelegate:usingBlock:](isa, "executeOperationOnDelegate:usingBlock:", v16, v17);
  objc_msgSend(*((id *)v67[4].isa + 26), "removeObject:", v67[5].isa);
  v21 = 0;
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v91, v21);
  objc_storeStrong(v20, v21);
}

void __73__SUSettingsStatefulUIManager_promoteTargetedUpdateToUserInitiatedStatus__block_invoke_262(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManagerDidRefreshState:", *(_QWORD *)(a1 + 32));

}

- (void)unscheduleTargetedUpdateAutomaticInstallation
{
  SUDownload *v2;
  objc_class *v3;
  char v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  id v12;
  objc_class *v13;
  char v14;
  const char *v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  SUSettingsUpdateOperation *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint8_t *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  id v51;
  id v52;
  int v53;
  id v54;
  int v55;
  const __CFString *v56;
  const __CFString *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  int v63;
  const __CFString *v64;
  os_log_t v65;
  os_log_type_t v66[4];
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  _BOOL4 v72;
  id obj;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint8_t *buf;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  const __CFString *v84;
  id v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  id v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  id v94;
  id v95;
  int v96;
  id v97;
  int v98;
  const __CFString *v99;
  const __CFString *v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  int v106;
  const __CFString *v107;
  os_log_t log;
  os_log_type_t v109[4];
  id v110;
  id v111;
  uint64_t v112;
  id v113;
  id v114;
  const char *v115;
  _BOOL4 v116;
  uint64_t v117;
  int v118;
  int v119;
  void (*v120)(uint64_t, char, id);
  void *v121;
  id v122;
  id v123;
  id v124;
  char v125;
  id v126;
  id v127;
  id v128;
  char v129;
  id v130;
  char v131;
  id v132;
  char v133;
  id v134;
  char v135;
  id v136;
  char v137;
  id v138;
  id v139;
  os_log_type_t v140;
  os_log_t v141;
  char v142;
  id v143;
  id location;
  id v145;
  char v146;
  id v147;
  char v148;
  id v149;
  char v150;
  id v151;
  char v152;
  id v153;
  char v154;
  id v155;
  id v156;
  os_log_type_t type;
  os_log_t oslog[2];
  id v159;
  _BYTE v160[224];
  _BYTE v161[232];
  uint64_t v162;

  v115 = "-[SUSettingsStatefulUIManager unscheduleTargetedUpdateAutomaticInstallation]";
  v162 = *MEMORY[0x24BDAC8D0];
  v159 = self;
  oslog[1] = (os_log_t)a2;
  v2 = -[SUSettingsStatefulUIManager currentDownload](self, "currentDownload");
  v116 = v2 != 0;

  if (v116)
  {
    v12 = (id)objc_msgSend(v159, "currentAutoInstallOperation");
    v72 = v12 != 0;

    if (v72)
    {
      v23 = [SUSettingsUpdateOperation alloc];
      v25 = (id)objc_msgSend(v159, "targetedUpdateStatefulDescriptor");
      v24 = (id)objc_msgSend(v25, "descriptor");
      v29 = 0;
      v28 = &v124;
      v124 = -[SUSettingsUpdateOperation initWithDescriptor:usingSUManagerClient:delegate:](v23, "initWithDescriptor:usingSUManagerClient:delegate:");

      objc_msgSend(v124, "setDelegateCallbackQueue:", *((_QWORD *)v159 + 21));
      objc_msgSend(v124, "setCompletionQueue:", *((_QWORD *)v159 + 21));
      objc_msgSend(*((id *)v159 + 26), "addObject:", v124);
      v26 = v124;
      v27 = (id)objc_msgSend(v159, "currentAutoInstallOperation");
      v117 = MEMORY[0x24BDAC760];
      v118 = -1073741824;
      v119 = 0;
      v120 = __76__SUSettingsStatefulUIManager_unscheduleTargetedUpdateAutomaticInstallation__block_invoke;
      v121 = &unk_24DFF7E00;
      v122 = v159;
      v123 = v124;
      objc_msgSend(v26, "unscheduleAutomaticInstallation:completionHandler:", v27, &v117);

      objc_storeStrong(&v123, 0);
      objc_storeStrong(&v122, 0);
      objc_storeStrong(&v124, 0);
    }
    else
    {
      v71 = (id)objc_msgSend(v159, "log");
      v141 = (os_log_t)(id)objc_msgSend(v71, "oslog");

      v140 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
      {
        v65 = v141;
        *(_DWORD *)v66 = v140;
        v67 = SUSettingsUIStateToString(objc_msgSend(v159, "currentState"));
        v68 = v67;
        v139 = v68;
        v69 = objc_msgSend(v159, "currentState");
        v70 = (id)objc_msgSend(v159, "delegate");
        v137 = 0;
        v135 = 0;
        if (v70)
        {
          v138 = (id)objc_msgSend(v159, "delegate");
          v63 = 1;
          v137 = 1;
          v13 = (objc_class *)objc_opt_class();
          v136 = NSStringFromClass(v13);
          v135 = 1;
          v64 = (const __CFString *)v136;
        }
        else
        {
          v64 = CFSTR("(null)");
        }
        v57 = v64;
        v58 = (id)objc_msgSend(v159, "delegate");
        v59 = (id)objc_msgSend(v159, "scanError");
        v60 = (id)objc_msgSend(v159, "preferredStatefulDescriptor");
        v61 = (id)objc_msgSend(v159, "alternateStatefulDescriptor");
        v62 = (id)objc_msgSend(v159, "currentDownload");
        v133 = 0;
        v131 = 0;
        v129 = 0;
        if (v62)
        {
          v134 = (id)objc_msgSend(v159, "currentDownload");
          v55 = 1;
          v133 = 1;
          v132 = (id)objc_msgSend(v134, "descriptor");
          v131 = 1;
          v130 = (id)objc_msgSend(v132, "humanReadableUpdateName");
          v129 = 1;
          v56 = (const __CFString *)v130;
        }
        else
        {
          v56 = CFSTR("(null)");
        }
        v41 = v56;
        v42 = (id)objc_msgSend(v159, "currentDownload");
        v14 = objc_msgSend(v159, "performThirdPartyScan");
        v48 = "NO";
        v15 = "YES";
        v49 = "YES";
        v53 = 1;
        if ((v14 & 1) == 0)
          v15 = "NO";
        v43 = v15;
        v16 = objc_msgSend(v159, "isTargetedUpdateScheduledForAutoInstall");
        v17 = (uint64_t)v49;
        if ((v16 & 1) == 0)
          v17 = (uint64_t)v48;
        v44 = v17;
        v18 = objc_msgSend(v159, "hidingPreferredDescriptor");
        v19 = (uint64_t)v49;
        if ((v18 & 1) == 0)
          v19 = (uint64_t)v48;
        v45 = v19;
        v46 = (id)objc_msgSend(*((id *)v159 + 32), "humanReadableUpdateName");
        v47 = v46;
        v128 = v47;
        v20 = objc_msgSend(v159, "hidingAlternateDescriptor");
        v21 = (uint64_t)v49;
        if ((v20 & 1) == 0)
          v21 = (uint64_t)v48;
        v50 = v21;
        v51 = (id)objc_msgSend(*((id *)v159 + 33), "humanReadableUpdateName");
        v52 = v51;
        v127 = v52;
        v54 = (id)objc_msgSend(v159, "enrolledBetaProgram");
        v125 = 0;
        if (v54)
        {
          v126 = (id)objc_msgSend(v159, "enrolledBetaProgram");
          v125 = 1;
          v40 = objc_msgSend(v126, "programID");
        }
        else
        {
          v40 = 0;
        }
        v31 = v40;
        v39 = (id)objc_msgSend(v159, "betaPrograms");
        v32 = objc_msgSend(v39, "count");
        v38 = (id)objc_msgSend(v159, "currentFullScanOperation");
        v37 = (id)objc_msgSend(v159, "currentRefreshScanOperation");
        v36 = (id)objc_msgSend(v159, "currentUpdateOperation");
        v35 = (id)objc_msgSend(v159, "auxiliaryOperations");
        v33 = &v22;
        v34 = v160;
        __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v160, (uint64_t)v115, (uint64_t)v68, v69, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61, (uint64_t)v41, (uint64_t)v42, (uint64_t)v43, v44, v45, (uint64_t)v47, v50, (uint64_t)v52, v40, v32,
          (uint64_t)v38,
          (uint64_t)v37,
          (uint64_t)v36,
          objc_msgSend(v35, "count"));
        _os_log_impl(&dword_21BF33000, v65, v66[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
          "\tselectedBetaProgram: %lu (count: %ld)\n"
          "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
          "\n"
          "Can not unschedule an update when the auto-install operation is nil.",
          v34,
          0xDEu);

        if ((v125 & 1) != 0)
        if ((v129 & 1) != 0)

        if ((v131 & 1) != 0)
        if ((v133 & 1) != 0)

        if ((v135 & 1) != 0)
        if ((v137 & 1) != 0)

        v30 = 0;
        objc_storeStrong(&v127, 0);
        objc_storeStrong(&v128, v30);
        objc_storeStrong(&v139, v30);
      }
      objc_storeStrong((id *)&v141, 0);
    }
  }
  else
  {
    v114 = (id)objc_msgSend(v159, "log");
    oslog[0] = (os_log_t)(id)objc_msgSend(v114, "oslog");

    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      log = oslog[0];
      *(_DWORD *)v109 = type;
      v110 = SUSettingsUIStateToString(objc_msgSend(v159, "currentState"));
      v111 = v110;
      v156 = v111;
      v112 = objc_msgSend(v159, "currentState");
      v113 = (id)objc_msgSend(v159, "delegate");
      v154 = 0;
      v152 = 0;
      if (v113)
      {
        v155 = (id)objc_msgSend(v159, "delegate");
        v106 = 1;
        v154 = 1;
        v3 = (objc_class *)objc_opt_class();
        v153 = NSStringFromClass(v3);
        v152 = 1;
        v107 = (const __CFString *)v153;
      }
      else
      {
        v107 = CFSTR("(null)");
      }
      v100 = v107;
      v101 = (id)objc_msgSend(v159, "delegate");
      v102 = (id)objc_msgSend(v159, "scanError");
      v103 = (id)objc_msgSend(v159, "preferredStatefulDescriptor");
      v104 = (id)objc_msgSend(v159, "alternateStatefulDescriptor");
      v105 = (id)objc_msgSend(v159, "currentDownload");
      v150 = 0;
      v148 = 0;
      v146 = 0;
      if (v105)
      {
        v151 = (id)objc_msgSend(v159, "currentDownload");
        v98 = 1;
        v150 = 1;
        v149 = (id)objc_msgSend(v151, "descriptor");
        v148 = 1;
        v147 = (id)objc_msgSend(v149, "humanReadableUpdateName");
        v146 = 1;
        v99 = (const __CFString *)v147;
      }
      else
      {
        v99 = CFSTR("(null)");
      }
      v84 = v99;
      v85 = (id)objc_msgSend(v159, "currentDownload");
      v4 = objc_msgSend(v159, "performThirdPartyScan");
      v91 = "NO";
      v5 = "YES";
      v92 = "YES";
      v96 = 1;
      if ((v4 & 1) == 0)
        v5 = "NO";
      v86 = v5;
      v6 = objc_msgSend(v159, "isTargetedUpdateScheduledForAutoInstall");
      v7 = (uint64_t)v92;
      if ((v6 & 1) == 0)
        v7 = (uint64_t)v91;
      v87 = v7;
      v8 = objc_msgSend(v159, "hidingPreferredDescriptor");
      v9 = (uint64_t)v92;
      if ((v8 & 1) == 0)
        v9 = (uint64_t)v91;
      v88 = v9;
      v89 = (id)objc_msgSend(*((id *)v159 + 32), "humanReadableUpdateName");
      v90 = v89;
      v145 = v90;
      v10 = objc_msgSend(v159, "hidingAlternateDescriptor");
      v11 = (uint64_t)v92;
      if ((v10 & 1) == 0)
        v11 = (uint64_t)v91;
      v93 = v11;
      v94 = (id)objc_msgSend(*((id *)v159 + 33), "humanReadableUpdateName");
      v95 = v94;
      location = v95;
      v97 = (id)objc_msgSend(v159, "enrolledBetaProgram");
      v142 = 0;
      if (v97)
      {
        v143 = (id)objc_msgSend(v159, "enrolledBetaProgram");
        v142 = 1;
        v83 = objc_msgSend(v143, "programID");
      }
      else
      {
        v83 = 0;
      }
      v74 = v83;
      v82 = (id)objc_msgSend(v159, "betaPrograms");
      v75 = objc_msgSend(v82, "count");
      v81 = (id)objc_msgSend(v159, "currentFullScanOperation");
      v80 = (id)objc_msgSend(v159, "currentRefreshScanOperation");
      v79 = (id)objc_msgSend(v159, "currentUpdateOperation");
      v78 = (id)objc_msgSend(v159, "auxiliaryOperations");
      v76 = &v22;
      buf = v161;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v161, (uint64_t)v115, (uint64_t)v111, v112, (uint64_t)v100, (uint64_t)v101, (uint64_t)v102, (uint64_t)v103, (uint64_t)v104, (uint64_t)v84, (uint64_t)v85, (uint64_t)v86, v87, v88, (uint64_t)v90, v93, (uint64_t)v95, v83, v75,
        (uint64_t)v81,
        (uint64_t)v80,
        (uint64_t)v79,
        objc_msgSend(v78, "count"));
      _os_log_impl(&dword_21BF33000, log, v109[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Can not unschedule an update without having the current download object.",
        buf,
        0xDEu);

      if ((v142 & 1) != 0)
      if ((v146 & 1) != 0)

      if ((v148 & 1) != 0)
      if ((v150 & 1) != 0)

      if ((v152 & 1) != 0)
      if ((v154 & 1) != 0)

      obj = 0;
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v145, obj);
      objc_storeStrong(&v156, obj);
    }
    objc_storeStrong((id *)oslog, 0);
  }
}

void __76__SUSettingsStatefulUIManager_unscheduleTargetedUpdateAutomaticInstallation__block_invoke(uint64_t a1, char a2, id obj)
{
  objc_class *v3;
  char v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id obja;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint8_t *buf;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  const __CFString *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  id v37;
  id v38;
  int v39;
  id v40;
  int v41;
  const __CFString *v42;
  const __CFString *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  int v49;
  const __CFString *v50;
  os_log_t log;
  os_log_type_t v52[4];
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  const char *v58;
  uint64_t v59;
  uint64_t *v60;
  char v61;
  id v62;
  id v63;
  id v64;
  char v65;
  id v66;
  char v67;
  id v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  id v75;
  os_log_type_t type;
  os_log_t oslog;
  uint64_t v78;
  id location;
  char v80;
  uint64_t v81;
  _BYTE v82[248];
  uint64_t v83;

  v60 = &v78;
  v59 = a1;
  v58 = "-[SUSettingsStatefulUIManager unscheduleTargetedUpdateAutomaticInstallation]_block_invoke";
  v83 = *MEMORY[0x24BDAC8D0];
  v81 = a1;
  v80 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v78 = v59;
  v57 = (id)objc_msgSend(*(id *)(v59 + 32), "log");
  oslog = (os_log_t)(id)objc_msgSend(v57, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v52 = type;
    v53 = SUSettingsUIStateToString(objc_msgSend(*(id *)(v59 + 32), "currentState"));
    v54 = v53;
    v75 = v54;
    v55 = objc_msgSend(*(id *)(v59 + 32), "currentState");
    v56 = (id)objc_msgSend(*(id *)(v59 + 32), "delegate");
    v73 = 0;
    v71 = 0;
    if (v56)
    {
      v74 = (id)objc_msgSend(*(id *)(v59 + 32), "delegate");
      v49 = 1;
      v73 = 1;
      v3 = (objc_class *)objc_opt_class();
      v72 = NSStringFromClass(v3);
      v71 = 1;
      v50 = (const __CFString *)v72;
    }
    else
    {
      v50 = CFSTR("(null)");
    }
    v43 = v50;
    v44 = (id)objc_msgSend(*(id *)(v59 + 32), "delegate");
    v45 = (id)objc_msgSend(*(id *)(v59 + 32), "scanError");
    v46 = (id)objc_msgSend(*(id *)(v59 + 32), "preferredStatefulDescriptor");
    v47 = (id)objc_msgSend(*(id *)(v59 + 32), "alternateStatefulDescriptor");
    v48 = (id)objc_msgSend(*(id *)(v59 + 32), "currentDownload");
    v69 = 0;
    v67 = 0;
    v65 = 0;
    if (v48)
    {
      v70 = (id)objc_msgSend(*(id *)(v59 + 32), "currentDownload");
      v41 = 1;
      v69 = 1;
      v68 = (id)objc_msgSend(v70, "descriptor");
      v67 = 1;
      v66 = (id)objc_msgSend(v68, "humanReadableUpdateName");
      v65 = 1;
      v42 = (const __CFString *)v66;
    }
    else
    {
      v42 = CFSTR("(null)");
    }
    v27 = v42;
    v28 = (id)objc_msgSend(*(id *)(v59 + 32), "currentDownload");
    v4 = objc_msgSend(*(id *)(v59 + 32), "performThirdPartyScan");
    v34 = "NO";
    v5 = "YES";
    v35 = "YES";
    v39 = 1;
    if ((v4 & 1) == 0)
      v5 = "NO";
    v29 = v5;
    v6 = objc_msgSend(*(id *)(v59 + 32), "isTargetedUpdateScheduledForAutoInstall");
    v7 = (uint64_t)v35;
    if ((v6 & 1) == 0)
      v7 = (uint64_t)v34;
    v30 = v7;
    v8 = objc_msgSend(*(id *)(v59 + 32), "hidingPreferredDescriptor");
    v9 = (uint64_t)v35;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v34;
    v31 = v9;
    v32 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v59 + 32) + 256), "humanReadableUpdateName");
    v33 = v32;
    v64 = v33;
    v10 = objc_msgSend(*(id *)(v59 + 32), "hidingAlternateDescriptor");
    v11 = (uint64_t)v35;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v34;
    v36 = v11;
    v37 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v59 + 32) + 264), "humanReadableUpdateName");
    v38 = v37;
    v63 = v38;
    v40 = (id)objc_msgSend(*(id *)(v59 + 32), "enrolledBetaProgram");
    v61 = 0;
    if (v40)
    {
      v62 = (id)objc_msgSend(*(id *)(v59 + 32), "enrolledBetaProgram");
      v61 = 1;
      v26 = objc_msgSend(v62, "programID");
    }
    else
    {
      v26 = 0;
    }
    v17 = v26;
    v25 = (id)objc_msgSend(*(id *)(v59 + 32), "betaPrograms");
    v18 = objc_msgSend(v25, "count");
    v24 = (id)objc_msgSend(*(id *)(v59 + 32), "currentFullScanOperation");
    v23 = (id)objc_msgSend(*(id *)(v59 + 32), "currentRefreshScanOperation");
    v22 = (id)objc_msgSend(*(id *)(v59 + 32), "currentUpdateOperation");
    v21 = (id)objc_msgSend(*(id *)(v59 + 32), "auxiliaryOperations");
    v12 = objc_msgSend(v21, "count");
    v13 = "Failure";
    if ((v80 & 1) != 0)
      v13 = "Success";
    v14 = v60[1];
    v19 = &v15;
    buf = v82;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_34_8_66((uint64_t)v82, (uint64_t)v58, (uint64_t)v54, v55, (uint64_t)v43, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, (uint64_t)v27, (uint64_t)v28, (uint64_t)v29, v30, v31, (uint64_t)v33, v36, (uint64_t)v38, v17, v18,
      (uint64_t)v24,
      (uint64_t)v23,
      (uint64_t)v22,
      v12,
      (uint64_t)v13,
      v14);
    _os_log_impl(&dword_21BF33000, log, v52[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Unschedule targeted update automatic installation: %{public}s; error: %{public}@",
      buf,
      0xF2u);

    if ((v61 & 1) != 0)
    if ((v65 & 1) != 0)

    if ((v67 & 1) != 0)
    if ((v69 & 1) != 0)

    if ((v71 & 1) != 0)
    if ((v73 & 1) != 0)

    obja = 0;
    objc_storeStrong(&v63, 0);
    objc_storeStrong(&v64, obja);
    objc_storeStrong(&v75, obja);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(v59 + 32) + 208), "removeObject:", *(_QWORD *)(v59 + 40));
  objc_storeStrong(&location, 0);
}

- (BOOL)isPerformingFullScan
{
  SUSettingsStatefulUIManager *obj;
  BOOL v4;

  obj = self;
  objc_sync_enter(obj);
  v4 = self->_currentFullScanOperation != 0;
  objc_sync_exit(obj);

  return v4;
}

- (BOOL)isPerformingRefresh
{
  SUSettingsStatefulUIManager *obj;
  BOOL v4;

  obj = self;
  objc_sync_enter(obj);
  v4 = self->_currentRefreshScanOperation != 0;
  objc_sync_exit(obj);

  return v4;
}

- (BOOL)isPerformingUpdate
{
  SUSettingsStatefulUIManager *obj;
  BOOL v4;

  obj = self;
  objc_sync_enter(obj);
  v4 = self->_currentUpdateOperation != 0;
  objc_sync_exit(obj);

  return v4;
}

- (void)enrollInBetaUpdatesProgram:(id)a3 completionHandler:(id)a4
{
  objc_class *v4;
  char v5;
  const char *v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  id v13;
  objc_class *v14;
  char v15;
  const char *v16;
  char v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  objc_class *v23;
  char v24;
  const char *v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t *v38;
  id v39;
  id v40;
  id *v41;
  id *v42;
  id *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint8_t *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  const __CFString *v58;
  id v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  id v68;
  id v69;
  int v70;
  id v71;
  int v72;
  const __CFString *v73;
  const __CFString *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  int v80;
  const __CFString *v81;
  os_log_t v82;
  os_log_type_t v83[4];
  id v84;
  id v85;
  uint64_t v86;
  id v87;
  id v88;
  _BOOL4 v89;
  id v90;
  _BOOL4 v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint8_t *v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  uint64_t v102;
  const __CFString *v103;
  id v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  id v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  id v113;
  id v114;
  int v115;
  id v116;
  int v117;
  const __CFString *v118;
  const __CFString *v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  int v125;
  const __CFString *v126;
  os_log_t v127;
  os_log_type_t v128[4];
  id v129;
  id v130;
  uint64_t v131;
  id v132;
  id v133;
  _BOOL4 v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t *v138;
  uint8_t *buf;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  uint64_t v145;
  const __CFString *v146;
  id v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  id v151;
  id v152;
  const char *v153;
  const char *v154;
  uint64_t v155;
  id v156;
  id v157;
  int v158;
  id v159;
  int v160;
  const __CFString *v161;
  const __CFString *v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  int v168;
  const __CFString *v169;
  os_log_t log;
  os_log_type_t v171[4];
  id v172;
  id v173;
  uint64_t v174;
  id v175;
  id v176;
  const char *v177;
  id obj;
  uint64_t v179;
  int v180;
  int v181;
  void (*v182)(NSObject *, void *);
  void *v183;
  id v184;
  id v185;
  id v186;
  char v187;
  id v188;
  id v189;
  id v190;
  char v191;
  id v192;
  char v193;
  id v194;
  char v195;
  id v196;
  char v197;
  id v198;
  char v199;
  id v200;
  id v201;
  os_log_type_t v202;
  os_log_t v203;
  char v204;
  id v205;
  char v206;
  id v207;
  id v208;
  id v209;
  char v210;
  id v211;
  char v212;
  id v213;
  char v214;
  id v215;
  char v216;
  id v217;
  char v218;
  id v219;
  id v220;
  os_log_type_t v221;
  os_log_t v222;
  char v223;
  id v224;
  id v225;
  id v226;
  char v227;
  id v228;
  char v229;
  id v230;
  char v231;
  id v232;
  char v233;
  id v234;
  char v235;
  id v236;
  id v237;
  os_log_type_t type;
  os_log_t oslog;
  int v240;
  id v241;
  id location[2];
  id v243;
  _BYTE v244[256];
  _BYTE v245[224];
  _BYTE v246[232];
  uint64_t v247;

  obj = a4;
  v177 = "-[SUSettingsStatefulUIManager enrollInBetaUpdatesProgram:completionHandler:]";
  v247 = *MEMORY[0x24BDAC8D0];
  v243 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v241 = 0;
  objc_storeStrong(&v241, obj);
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(v243, "currentState") > 1)
    {
      v13 = (id)objc_msgSend(v243, "currentSeedingDevice");
      v134 = v13 != 0;

      if (v134)
      {
        v90 = (id)objc_msgSend(v243, "betaPrograms");
        v204 = 0;
        v91 = 1;
        if (v90)
        {
          v205 = (id)objc_msgSend(v243, "betaPrograms");
          v204 = 1;
          v91 = objc_msgSend(v205, "count") == 0;
        }
        v89 = v91;
        if ((v204 & 1) != 0)

        if (v89)
        {
          v88 = (id)objc_msgSend(v243, "log");
          v203 = (os_log_t)(id)objc_msgSend(v88, "oslog");

          v202 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v203, OS_LOG_TYPE_DEFAULT))
          {
            v82 = v203;
            *(_DWORD *)v83 = v202;
            v84 = SUSettingsUIStateToString(objc_msgSend(v243, "currentState"));
            v85 = v84;
            v201 = v85;
            v86 = objc_msgSend(v243, "currentState");
            v87 = (id)objc_msgSend(v243, "delegate");
            v199 = 0;
            v197 = 0;
            if (v87)
            {
              v200 = (id)objc_msgSend(v243, "delegate");
              v80 = 1;
              v199 = 1;
              v23 = (objc_class *)objc_opt_class();
              v198 = NSStringFromClass(v23);
              v197 = 1;
              v81 = (const __CFString *)v198;
            }
            else
            {
              v81 = CFSTR("(null)");
            }
            v74 = v81;
            v75 = (id)objc_msgSend(v243, "delegate");
            v76 = (id)objc_msgSend(v243, "scanError");
            v77 = (id)objc_msgSend(v243, "preferredStatefulDescriptor");
            v78 = (id)objc_msgSend(v243, "alternateStatefulDescriptor");
            v79 = (id)objc_msgSend(v243, "currentDownload");
            v195 = 0;
            v193 = 0;
            v191 = 0;
            if (v79)
            {
              v196 = (id)objc_msgSend(v243, "currentDownload");
              v72 = 1;
              v195 = 1;
              v194 = (id)objc_msgSend(v196, "descriptor");
              v193 = 1;
              v192 = (id)objc_msgSend(v194, "humanReadableUpdateName");
              v191 = 1;
              v73 = (const __CFString *)v192;
            }
            else
            {
              v73 = CFSTR("(null)");
            }
            v58 = v73;
            v59 = (id)objc_msgSend(v243, "currentDownload");
            v24 = objc_msgSend(v243, "performThirdPartyScan");
            v65 = "NO";
            v25 = "YES";
            v66 = "YES";
            v70 = 1;
            if ((v24 & 1) == 0)
              v25 = "NO";
            v60 = v25;
            v26 = objc_msgSend(v243, "isTargetedUpdateScheduledForAutoInstall");
            v27 = (uint64_t)v66;
            if ((v26 & 1) == 0)
              v27 = (uint64_t)v65;
            v61 = v27;
            v28 = objc_msgSend(v243, "hidingPreferredDescriptor");
            v29 = (uint64_t)v66;
            if ((v28 & 1) == 0)
              v29 = (uint64_t)v65;
            v62 = v29;
            v63 = (id)objc_msgSend(*((id *)v243 + 32), "humanReadableUpdateName");
            v64 = v63;
            v190 = v64;
            v30 = objc_msgSend(v243, "hidingAlternateDescriptor");
            v31 = (uint64_t)v66;
            if ((v30 & 1) == 0)
              v31 = (uint64_t)v65;
            v67 = v31;
            v68 = (id)objc_msgSend(*((id *)v243 + 33), "humanReadableUpdateName");
            v69 = v68;
            v189 = v69;
            v71 = (id)objc_msgSend(v243, "enrolledBetaProgram");
            v187 = 0;
            if (v71)
            {
              v188 = (id)objc_msgSend(v243, "enrolledBetaProgram");
              v187 = 1;
              v57 = objc_msgSend(v188, "programID");
            }
            else
            {
              v57 = 0;
            }
            v47 = v57;
            v56 = (id)objc_msgSend(v243, "betaPrograms");
            v48 = objc_msgSend(v56, "count");
            v55 = (id)objc_msgSend(v243, "currentFullScanOperation");
            v54 = (id)objc_msgSend(v243, "currentRefreshScanOperation");
            v53 = (id)objc_msgSend(v243, "currentUpdateOperation");
            v52 = (id)objc_msgSend(v243, "auxiliaryOperations");
            v49 = objc_msgSend(v52, "count");
            v32 = objc_msgSend(location[0], "programID");
            v50 = &v35;
            v51 = v244;
            __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v244, (uint64_t)v177, (uint64_t)v85, v86, (uint64_t)v74, (uint64_t)v75, (uint64_t)v76, (uint64_t)v77, (uint64_t)v78, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, v61, v62, (uint64_t)v64, v67, (uint64_t)v69, v57, v48,
              (uint64_t)v55,
              (uint64_t)v54,
              (uint64_t)v53,
              v49,
              v32,
              (uint64_t)location[0]);
            _os_log_impl(&dword_21BF33000, v82, v83[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
              "\tselectedBetaProgram: %lu (count: %ld)\n"
              "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
              "\n"
              "Can not register to the beta progra \"%ld\" (%p) as no beta programs have been discovered by the Stateful "
              "UI. Attempts to perform a full re-scan.",
              v51,
              0xF2u);

            if ((v187 & 1) != 0)
            if ((v191 & 1) != 0)

            if ((v193 & 1) != 0)
            if ((v195 & 1) != 0)

            if ((v197 & 1) != 0)
            if ((v199 & 1) != 0)

            v46 = 0;
            objc_storeStrong(&v189, 0);
            objc_storeStrong(&v190, v46);
            objc_storeStrong(&v201, v46);
          }
          objc_storeStrong((id *)&v203, 0);
          objc_msgSend(v243, "checkForAvailableUpdates");
          v240 = 1;
        }
        else
        {
          if (!location[0])
          {
            v45 = (id)objc_msgSend(v243, "betaPrograms");
            v33 = (id)objc_msgSend(v45, "firstObject");
            v34 = location[0];
            location[0] = v33;

          }
          v40 = (id)objc_msgSend(v243, "seedingBetaManager");
          v39 = (id)objc_msgSend(v243, "currentSeedingDevice");
          v37 = location[0];
          v38 = &v179;
          v179 = MEMORY[0x24BDAC760];
          v180 = -1073741824;
          v181 = 0;
          v182 = __76__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_completionHandler___block_invoke;
          v183 = &unk_24DFF7E50;
          v43 = &v184;
          v184 = v243;
          v42 = &v185;
          v185 = location[0];
          v41 = &v186;
          v186 = v241;
          objc_msgSend(v40, "enrollDevice:inBetaProgram:completion:", v39, v37, &v179);

          v44 = 0;
          objc_storeStrong(&v186, 0);
          objc_storeStrong(&v185, 0);
          objc_storeStrong(&v184, 0);
          v240 = 0;
        }
      }
      else
      {
        v133 = (id)objc_msgSend(v243, "log");
        v222 = (os_log_t)(id)objc_msgSend(v133, "oslog");

        v221 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v222, OS_LOG_TYPE_DEFAULT))
        {
          v127 = v222;
          *(_DWORD *)v128 = v221;
          v129 = SUSettingsUIStateToString(objc_msgSend(v243, "currentState"));
          v130 = v129;
          v220 = v130;
          v131 = objc_msgSend(v243, "currentState");
          v132 = (id)objc_msgSend(v243, "delegate");
          v218 = 0;
          v216 = 0;
          if (v132)
          {
            v219 = (id)objc_msgSend(v243, "delegate");
            v125 = 1;
            v218 = 1;
            v14 = (objc_class *)objc_opt_class();
            v217 = NSStringFromClass(v14);
            v216 = 1;
            v126 = (const __CFString *)v217;
          }
          else
          {
            v126 = CFSTR("(null)");
          }
          v119 = v126;
          v120 = (id)objc_msgSend(v243, "delegate");
          v121 = (id)objc_msgSend(v243, "scanError");
          v122 = (id)objc_msgSend(v243, "preferredStatefulDescriptor");
          v123 = (id)objc_msgSend(v243, "alternateStatefulDescriptor");
          v124 = (id)objc_msgSend(v243, "currentDownload");
          v214 = 0;
          v212 = 0;
          v210 = 0;
          if (v124)
          {
            v215 = (id)objc_msgSend(v243, "currentDownload");
            v117 = 1;
            v214 = 1;
            v213 = (id)objc_msgSend(v215, "descriptor");
            v212 = 1;
            v211 = (id)objc_msgSend(v213, "humanReadableUpdateName");
            v210 = 1;
            v118 = (const __CFString *)v211;
          }
          else
          {
            v118 = CFSTR("(null)");
          }
          v103 = v118;
          v104 = (id)objc_msgSend(v243, "currentDownload");
          v15 = objc_msgSend(v243, "performThirdPartyScan");
          v110 = "NO";
          v16 = "YES";
          v111 = "YES";
          v115 = 1;
          if ((v15 & 1) == 0)
            v16 = "NO";
          v105 = v16;
          v17 = objc_msgSend(v243, "isTargetedUpdateScheduledForAutoInstall");
          v18 = (uint64_t)v111;
          if ((v17 & 1) == 0)
            v18 = (uint64_t)v110;
          v106 = v18;
          v19 = objc_msgSend(v243, "hidingPreferredDescriptor");
          v20 = (uint64_t)v111;
          if ((v19 & 1) == 0)
            v20 = (uint64_t)v110;
          v107 = v20;
          v108 = (id)objc_msgSend(*((id *)v243 + 32), "humanReadableUpdateName");
          v109 = v108;
          v209 = v109;
          v21 = objc_msgSend(v243, "hidingAlternateDescriptor");
          v22 = (uint64_t)v111;
          if ((v21 & 1) == 0)
            v22 = (uint64_t)v110;
          v112 = v22;
          v113 = (id)objc_msgSend(*((id *)v243 + 33), "humanReadableUpdateName");
          v114 = v113;
          v208 = v114;
          v116 = (id)objc_msgSend(v243, "enrolledBetaProgram");
          v206 = 0;
          if (v116)
          {
            v207 = (id)objc_msgSend(v243, "enrolledBetaProgram");
            v206 = 1;
            v102 = objc_msgSend(v207, "programID");
          }
          else
          {
            v102 = 0;
          }
          v93 = v102;
          v101 = (id)objc_msgSend(v243, "betaPrograms");
          v94 = objc_msgSend(v101, "count");
          v100 = (id)objc_msgSend(v243, "currentFullScanOperation");
          v99 = (id)objc_msgSend(v243, "currentRefreshScanOperation");
          v98 = (id)objc_msgSend(v243, "currentUpdateOperation");
          v97 = (id)objc_msgSend(v243, "auxiliaryOperations");
          v95 = &v35;
          v96 = v245;
          __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v245, (uint64_t)v177, (uint64_t)v130, v131, (uint64_t)v119, (uint64_t)v120, (uint64_t)v121, (uint64_t)v122, (uint64_t)v123, (uint64_t)v103, (uint64_t)v104, (uint64_t)v105, v106, v107, (uint64_t)v109, v112, (uint64_t)v114, v102, v94,
            (uint64_t)v100,
            (uint64_t)v99,
            (uint64_t)v98,
            objc_msgSend(v97, "count"));
          _os_log_impl(&dword_21BF33000, v127, v128[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
            "\tselectedBetaProgram: %lu (count: %ld)\n"
            "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
            "\n"
            "Can not enroll in beta updates as we have not discovered a seeding device.",
            v96,
            0xDEu);

          if ((v206 & 1) != 0)
          if ((v210 & 1) != 0)

          if ((v212 & 1) != 0)
          if ((v214 & 1) != 0)

          if ((v216 & 1) != 0)
          if ((v218 & 1) != 0)

          v92 = 0;
          objc_storeStrong(&v208, 0);
          objc_storeStrong(&v209, v92);
          objc_storeStrong(&v220, v92);
        }
        objc_storeStrong((id *)&v222, 0);
        v240 = 1;
      }
    }
    else
    {
      v176 = (id)objc_msgSend(v243, "log");
      oslog = (os_log_t)(id)objc_msgSend(v176, "oslog");

      type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        *(_DWORD *)v171 = type;
        v172 = SUSettingsUIStateToString(objc_msgSend(v243, "currentState"));
        v173 = v172;
        v237 = v173;
        v174 = objc_msgSend(v243, "currentState");
        v175 = (id)objc_msgSend(v243, "delegate");
        v235 = 0;
        v233 = 0;
        if (v175)
        {
          v236 = (id)objc_msgSend(v243, "delegate");
          v168 = 1;
          v235 = 1;
          v4 = (objc_class *)objc_opt_class();
          v234 = NSStringFromClass(v4);
          v233 = 1;
          v169 = (const __CFString *)v234;
        }
        else
        {
          v169 = CFSTR("(null)");
        }
        v162 = v169;
        v163 = (id)objc_msgSend(v243, "delegate");
        v164 = (id)objc_msgSend(v243, "scanError");
        v165 = (id)objc_msgSend(v243, "preferredStatefulDescriptor");
        v166 = (id)objc_msgSend(v243, "alternateStatefulDescriptor");
        v167 = (id)objc_msgSend(v243, "currentDownload");
        v231 = 0;
        v229 = 0;
        v227 = 0;
        if (v167)
        {
          v232 = (id)objc_msgSend(v243, "currentDownload");
          v160 = 1;
          v231 = 1;
          v230 = (id)objc_msgSend(v232, "descriptor");
          v229 = 1;
          v228 = (id)objc_msgSend(v230, "humanReadableUpdateName");
          v227 = 1;
          v161 = (const __CFString *)v228;
        }
        else
        {
          v161 = CFSTR("(null)");
        }
        v146 = v161;
        v147 = (id)objc_msgSend(v243, "currentDownload");
        v5 = objc_msgSend(v243, "performThirdPartyScan");
        v153 = "NO";
        v6 = "YES";
        v154 = "YES";
        v158 = 1;
        if ((v5 & 1) == 0)
          v6 = "NO";
        v148 = v6;
        v7 = objc_msgSend(v243, "isTargetedUpdateScheduledForAutoInstall");
        v8 = (uint64_t)v154;
        if ((v7 & 1) == 0)
          v8 = (uint64_t)v153;
        v149 = v8;
        v9 = objc_msgSend(v243, "hidingPreferredDescriptor");
        v10 = (uint64_t)v154;
        if ((v9 & 1) == 0)
          v10 = (uint64_t)v153;
        v150 = v10;
        v151 = (id)objc_msgSend(*((id *)v243 + 32), "humanReadableUpdateName");
        v152 = v151;
        v226 = v152;
        v11 = objc_msgSend(v243, "hidingAlternateDescriptor");
        v12 = (uint64_t)v154;
        if ((v11 & 1) == 0)
          v12 = (uint64_t)v153;
        v155 = v12;
        v156 = (id)objc_msgSend(*((id *)v243 + 33), "humanReadableUpdateName");
        v157 = v156;
        v225 = v157;
        v159 = (id)objc_msgSend(v243, "enrolledBetaProgram");
        v223 = 0;
        if (v159)
        {
          v224 = (id)objc_msgSend(v243, "enrolledBetaProgram");
          v223 = 1;
          v145 = objc_msgSend(v224, "programID");
        }
        else
        {
          v145 = 0;
        }
        v136 = v145;
        v144 = (id)objc_msgSend(v243, "betaPrograms");
        v137 = objc_msgSend(v144, "count");
        v143 = (id)objc_msgSend(v243, "currentFullScanOperation");
        v142 = (id)objc_msgSend(v243, "currentRefreshScanOperation");
        v141 = (id)objc_msgSend(v243, "currentUpdateOperation");
        v140 = (id)objc_msgSend(v243, "auxiliaryOperations");
        v138 = &v35;
        buf = v246;
        __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v246, (uint64_t)v177, (uint64_t)v173, v174, (uint64_t)v162, (uint64_t)v163, (uint64_t)v164, (uint64_t)v165, (uint64_t)v166, (uint64_t)v146, (uint64_t)v147, (uint64_t)v148, v149, v150, (uint64_t)v152, v155, (uint64_t)v157, v145, v137,
          (uint64_t)v143,
          (uint64_t)v142,
          (uint64_t)v141,
          objc_msgSend(v140, "count"));
        _os_log_impl(&dword_21BF33000, log, v171[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
          "\tselectedBetaProgram: %lu (count: %ld)\n"
          "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
          "\n"
          "Can not enroll in beta updates as we are currently checking for updates.",
          buf,
          0xDEu);

        if ((v223 & 1) != 0)
        if ((v227 & 1) != 0)

        if ((v229 & 1) != 0)
        if ((v231 & 1) != 0)

        if ((v233 & 1) != 0)
        if ((v235 & 1) != 0)

        v135 = 0;
        objc_storeStrong(&v225, 0);
        objc_storeStrong(&v226, v135);
        objc_storeStrong(&v237, v135);
      }
      objc_storeStrong((id *)&oslog, 0);
      v240 = 1;
    }
  }
  else
  {
    v240 = 1;
  }
  v36 = 0;
  objc_storeStrong(&v241, 0);
  objc_storeStrong(location, v36);
}

void __76__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_completionHandler___block_invoke(NSObject *a1, void *a2)
{
  objc_class *v2;
  char v3;
  const char *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t isa;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  Class v16;
  id *v17;
  id *v18;
  id *v19;
  id *v20;
  id v21;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v24;
  id *v25;
  id *v26;
  id *v27;
  id v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint8_t *buf;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  id v51;
  id v52;
  int v53;
  id v54;
  int v55;
  const __CFString *v56;
  const __CFString *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  int v63;
  const __CFString *v64;
  os_log_t log;
  os_log_type_t v66[4];
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  const char *v72;
  NSObject *v73;
  uint64_t v74;
  int v75;
  int v76;
  void (*v77)(uint64_t);
  void *v78;
  _QWORD v79[3];
  uint64_t v80;
  int v81;
  int v82;
  uint64_t (*v83)(uint64_t);
  void *v84;
  objc_class *v85;
  id v86;
  objc_class *v87;
  char v88;
  id v89;
  id v90;
  id v91;
  char v92;
  id v93;
  char v94;
  id v95;
  char v96;
  id v97;
  char v98;
  id v99;
  char v100;
  id v101;
  id v102;
  os_log_type_t type;
  os_log_t oslog[2];
  id location[2];
  _BYTE v106[264];
  uint64_t v107;

  v73 = a1;
  v72 = "-[SUSettingsStatefulUIManager enrollInBetaUpdatesProgram:completionHandler:]_block_invoke";
  v107 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = v73;
  v71 = (id)-[objc_class log](v73[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v71, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v66 = type;
    v67 = SUSettingsUIStateToString(-[objc_class currentState](v73[4].isa, "currentState"));
    v68 = v67;
    v102 = v68;
    v69 = -[objc_class currentState](v73[4].isa, "currentState");
    v70 = (id)-[objc_class delegate](v73[4].isa, "delegate");
    v100 = 0;
    v98 = 0;
    if (v70)
    {
      v101 = (id)-[objc_class delegate](v73[4].isa, "delegate");
      v63 = 1;
      v100 = 1;
      v2 = (objc_class *)objc_opt_class();
      v99 = NSStringFromClass(v2);
      v98 = 1;
      v64 = (const __CFString *)v99;
    }
    else
    {
      v64 = CFSTR("(null)");
    }
    v57 = v64;
    v58 = (id)-[objc_class delegate](v73[4].isa, "delegate");
    v59 = (id)-[objc_class scanError](v73[4].isa, "scanError");
    v60 = (id)-[objc_class preferredStatefulDescriptor](v73[4].isa, "preferredStatefulDescriptor");
    v61 = (id)-[objc_class alternateStatefulDescriptor](v73[4].isa, "alternateStatefulDescriptor");
    v62 = (id)-[objc_class currentDownload](v73[4].isa, "currentDownload");
    v96 = 0;
    v94 = 0;
    v92 = 0;
    if (v62)
    {
      v97 = (id)-[objc_class currentDownload](v73[4].isa, "currentDownload");
      v55 = 1;
      v96 = 1;
      v95 = (id)objc_msgSend(v97, "descriptor");
      v94 = 1;
      v93 = (id)objc_msgSend(v95, "humanReadableUpdateName");
      v92 = 1;
      v56 = (const __CFString *)v93;
    }
    else
    {
      v56 = CFSTR("(null)");
    }
    v41 = v56;
    v42 = (id)-[objc_class currentDownload](v73[4].isa, "currentDownload");
    v3 = -[objc_class performThirdPartyScan](v73[4].isa, "performThirdPartyScan");
    v48 = "NO";
    v4 = "YES";
    v49 = "YES";
    v53 = 1;
    if ((v3 & 1) == 0)
      v4 = "NO";
    v43 = v4;
    v5 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v73[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v6 = (uint64_t)v49;
    if ((v5 & 1) == 0)
      v6 = (uint64_t)v48;
    v44 = v6;
    v7 = -[objc_class hidingPreferredDescriptor](v73[4].isa, "hidingPreferredDescriptor");
    v8 = (uint64_t)v49;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v48;
    v45 = v8;
    v46 = (id)objc_msgSend(*((id *)v73[4].isa + 32), "humanReadableUpdateName");
    v47 = v46;
    v91 = v47;
    v9 = -[objc_class hidingAlternateDescriptor](v73[4].isa, "hidingAlternateDescriptor");
    v10 = (uint64_t)v49;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v48;
    v50 = v10;
    v51 = (id)objc_msgSend(*((id *)v73[4].isa + 33), "humanReadableUpdateName");
    v52 = v51;
    v90 = v52;
    v54 = (id)-[objc_class enrolledBetaProgram](v73[4].isa, "enrolledBetaProgram");
    v88 = 0;
    if (v54)
    {
      v89 = (id)-[objc_class enrolledBetaProgram](v73[4].isa, "enrolledBetaProgram");
      v88 = 1;
      v40 = objc_msgSend(v89, "programID");
    }
    else
    {
      v40 = 0;
    }
    v30 = v40;
    v39 = (id)-[objc_class betaPrograms](v73[4].isa, "betaPrograms");
    v31 = objc_msgSend(v39, "count");
    v38 = (id)-[objc_class currentFullScanOperation](v73[4].isa, "currentFullScanOperation");
    v37 = (id)-[objc_class currentRefreshScanOperation](v73[4].isa, "currentRefreshScanOperation");
    v36 = (id)-[objc_class currentUpdateOperation](v73[4].isa, "currentUpdateOperation");
    v35 = (id)-[objc_class auxiliaryOperations](v73[4].isa, "auxiliaryOperations");
    v32 = objc_msgSend(v35, "count");
    v11 = -[objc_class programID](v73[5].isa, "programID");
    isa = (uint64_t)v73[5].isa;
    v33 = &v13;
    buf = v106;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v106, (uint64_t)v72, (uint64_t)v68, v69, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61, (uint64_t)v41, (uint64_t)v42, (uint64_t)v43, v44, v45, (uint64_t)v47, v50, (uint64_t)v52, v40, v31,
      (uint64_t)v38,
      (uint64_t)v37,
      (uint64_t)v36,
      v32,
      v11,
      isa,
      (uint64_t)location[0]);
    _os_log_impl(&dword_21BF33000, log, v66[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to enroll in beta program: %ld (%p); error: %{public}@",
      buf,
      0xFCu);

    if ((v88 & 1) != 0)
    if ((v92 & 1) != 0)

    if ((v94 & 1) != 0)
    if ((v96 & 1) != 0)

    if ((v98 & 1) != 0)
    if ((v100 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v90, 0);
    objc_storeStrong(&v91, obj);
    objc_storeStrong(&v102, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  -[objc_class setEnrolledBetaProgram:](v73[4].isa, "setEnrolledBetaProgram:", v73[5].isa);
  -[objc_class checkForAvailableUpdates](v73[4].isa, "checkForAvailableUpdates");
  if (v73[6].isa)
  {
    v24 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    queue = (dispatch_queue_t)(id)objc_msgSend(v24, "selectDelegateCallbackQueue:", *((_QWORD *)v73[4].isa + 5));
    block = &v80;
    v80 = MEMORY[0x24BDAC760];
    v81 = -1073741824;
    v82 = 0;
    v83 = __76__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_completionHandler___block_invoke_268;
    v84 = &unk_24DFF7E28;
    v27 = (id *)&v87;
    v87 = v73[6].isa;
    v26 = (id *)((char *)block + 32);
    v85 = v73[5].isa;
    v25 = (id *)((char *)block + 40);
    v86 = location[0];
    dispatch_async(queue, block);

    v28 = 0;
    objc_storeStrong(v25, 0);
    objc_storeStrong(v26, v28);
    objc_storeStrong(v27, v28);
  }
  v16 = v73[4].isa;
  v14 = sel_statefulUIManager_didEnrollDevice_inBetaUpdatesProgram_withError_;
  v15 = &v74;
  v74 = MEMORY[0x24BDAC760];
  v75 = -1073741824;
  v76 = 0;
  v77 = __76__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_completionHandler___block_invoke_2;
  v78 = &unk_24DFF7C20;
  v19 = (id *)v79;
  v79[0] = v73[4].isa;
  v18 = (id *)(v15 + 5);
  v79[1] = v73[5].isa;
  v17 = (id *)(v15 + 6);
  v20 = location;
  v79[2] = location[0];
  -[objc_class executeOperationOnDelegate:usingBlock:](v16, "executeOperationOnDelegate:usingBlock:", v14, v15);
  v21 = 0;
  objc_storeStrong(v17, 0);
  objc_storeStrong(v18, v21);
  objc_storeStrong(v19, v21);
  objc_storeStrong(v20, v21);
}

uint64_t __76__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_completionHandler___block_invoke_268(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __76__SUSettingsStatefulUIManager_enrollInBetaUpdatesProgram_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(v2, "currentSeedingDevice");
  objc_msgSend(v4, "statefulUIManager:didEnrollDevice:inBetaUpdatesProgram:withError:", v2);

}

- (void)unenrollFromBetaUpdatesWithCompletion:(id)a3
{
  objc_class *v3;
  char v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  id v12;
  objc_class *v13;
  char v14;
  const char *v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  id v22[16];
  id v23;
  id v24;
  id *v25;
  id *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id *v31;
  uint8_t *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  const __CFString *v39;
  id v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  id v49;
  id v50;
  int v51;
  id v52;
  int v53;
  const __CFString *v54;
  const __CFString *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  int v61;
  const __CFString *v62;
  os_log_t v63;
  os_log_type_t v64[4];
  id v65;
  id v66;
  uint64_t v67;
  id v68;
  id v69;
  _BOOL4 v70;
  id obj;
  uint64_t v72;
  uint64_t v73;
  id *v74;
  uint8_t *buf;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  const __CFString *v82;
  id v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  id v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  id v92;
  id v93;
  int v94;
  id v95;
  int v96;
  const __CFString *v97;
  const __CFString *v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  int v104;
  const __CFString *v105;
  os_log_t log;
  os_log_type_t v107[4];
  id v108;
  id v109;
  uint64_t v110;
  id v111;
  id v112;
  const char *v113;
  uint64_t v114;
  int v115;
  int v116;
  void (*v117)(NSObject *, char);
  void *v118;
  id v119;
  id v120;
  char v121;
  id v122;
  id v123;
  id v124;
  char v125;
  id v126;
  char v127;
  id v128;
  char v129;
  id v130;
  char v131;
  id v132;
  char v133;
  id v134;
  id v135;
  os_log_type_t v136;
  os_log_t v137;
  char v138;
  id v139;
  id v140;
  id v141;
  char v142;
  id v143;
  char v144;
  id v145;
  char v146;
  id v147;
  char v148;
  id v149;
  char v150;
  id v151;
  id v152;
  os_log_type_t type;
  os_log_t oslog;
  int v155;
  id location[2];
  id v157;
  _BYTE v158[224];
  _BYTE v159[232];
  uint64_t v160;

  v113 = "-[SUSettingsStatefulUIManager unenrollFromBetaUpdatesWithCompletion:]";
  v160 = *MEMORY[0x24BDAC8D0];
  v157 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(v157, "currentState") > 1)
    {
      v12 = (id)objc_msgSend(v157, "currentSeedingDevice");
      v70 = v12 != 0;

      if (v70)
      {
        v24 = (id)objc_msgSend(MEMORY[0x24BE85330], "sharedManager");
        v23 = (id)objc_msgSend(v157, "currentSeedingDevice");
        v22[15] = &v114;
        v114 = MEMORY[0x24BDAC760];
        v115 = -1073741824;
        v116 = 0;
        v117 = __69__SUSettingsStatefulUIManager_unenrollFromBetaUpdatesWithCompletion___block_invoke;
        v118 = &unk_24DFF7EC8;
        v26 = &v119;
        v119 = v157;
        v25 = &v120;
        v120 = location[0];
        objc_msgSend(v24, "unenrollDevice:completion:", v23, &v114);

        v27 = 0;
        objc_storeStrong(&v120, 0);
        objc_storeStrong(&v119, 0);
        v155 = 0;
      }
      else
      {
        v69 = (id)objc_msgSend(v157, "log");
        v137 = (os_log_t)(id)objc_msgSend(v69, "oslog");

        v136 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
        {
          v63 = v137;
          *(_DWORD *)v64 = v136;
          v65 = SUSettingsUIStateToString(objc_msgSend(v157, "currentState"));
          v66 = v65;
          v135 = v66;
          v67 = objc_msgSend(v157, "currentState");
          v68 = (id)objc_msgSend(v157, "delegate");
          v133 = 0;
          v131 = 0;
          if (v68)
          {
            v134 = (id)objc_msgSend(v157, "delegate");
            v61 = 1;
            v133 = 1;
            v13 = (objc_class *)objc_opt_class();
            v132 = NSStringFromClass(v13);
            v131 = 1;
            v62 = (const __CFString *)v132;
          }
          else
          {
            v62 = CFSTR("(null)");
          }
          v55 = v62;
          v56 = (id)objc_msgSend(v157, "delegate");
          v57 = (id)objc_msgSend(v157, "scanError");
          v58 = (id)objc_msgSend(v157, "preferredStatefulDescriptor");
          v59 = (id)objc_msgSend(v157, "alternateStatefulDescriptor");
          v60 = (id)objc_msgSend(v157, "currentDownload");
          v129 = 0;
          v127 = 0;
          v125 = 0;
          if (v60)
          {
            v130 = (id)objc_msgSend(v157, "currentDownload");
            v53 = 1;
            v129 = 1;
            v128 = (id)objc_msgSend(v130, "descriptor");
            v127 = 1;
            v126 = (id)objc_msgSend(v128, "humanReadableUpdateName");
            v125 = 1;
            v54 = (const __CFString *)v126;
          }
          else
          {
            v54 = CFSTR("(null)");
          }
          v39 = v54;
          v40 = (id)objc_msgSend(v157, "currentDownload");
          v14 = objc_msgSend(v157, "performThirdPartyScan");
          v46 = "NO";
          v15 = "YES";
          v47 = "YES";
          v51 = 1;
          if ((v14 & 1) == 0)
            v15 = "NO";
          v41 = v15;
          v16 = objc_msgSend(v157, "isTargetedUpdateScheduledForAutoInstall");
          v17 = (uint64_t)v47;
          if ((v16 & 1) == 0)
            v17 = (uint64_t)v46;
          v42 = v17;
          v18 = objc_msgSend(v157, "hidingPreferredDescriptor");
          v19 = (uint64_t)v47;
          if ((v18 & 1) == 0)
            v19 = (uint64_t)v46;
          v43 = v19;
          v44 = (id)objc_msgSend(*((id *)v157 + 32), "humanReadableUpdateName");
          v45 = v44;
          v124 = v45;
          v20 = objc_msgSend(v157, "hidingAlternateDescriptor");
          v21 = (uint64_t)v47;
          if ((v20 & 1) == 0)
            v21 = (uint64_t)v46;
          v48 = v21;
          v49 = (id)objc_msgSend(*((id *)v157 + 33), "humanReadableUpdateName");
          v50 = v49;
          v123 = v50;
          v52 = (id)objc_msgSend(v157, "enrolledBetaProgram");
          v121 = 0;
          if (v52)
          {
            v122 = (id)objc_msgSend(v157, "enrolledBetaProgram");
            v121 = 1;
            v38 = objc_msgSend(v122, "programID");
          }
          else
          {
            v38 = 0;
          }
          v29 = v38;
          v37 = (id)objc_msgSend(v157, "betaPrograms");
          v30 = objc_msgSend(v37, "count");
          v36 = (id)objc_msgSend(v157, "currentFullScanOperation");
          v35 = (id)objc_msgSend(v157, "currentRefreshScanOperation");
          v34 = (id)objc_msgSend(v157, "currentUpdateOperation");
          v33 = (id)objc_msgSend(v157, "auxiliaryOperations");
          v31 = v22;
          v32 = v158;
          __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v158, (uint64_t)v113, (uint64_t)v66, v67, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v39, (uint64_t)v40, (uint64_t)v41, v42, v43, (uint64_t)v45, v48, (uint64_t)v50, v38, v30,
            (uint64_t)v36,
            (uint64_t)v35,
            (uint64_t)v34,
            objc_msgSend(v33, "count"));
          _os_log_impl(&dword_21BF33000, v63, v64[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
            "\tselectedBetaProgram: %lu (count: %ld)\n"
            "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
            "\n"
            "Can not unenroll from beta updates as we have not discovered a seeding device.",
            v32,
            0xDEu);

          if ((v121 & 1) != 0)
          if ((v125 & 1) != 0)

          if ((v127 & 1) != 0)
          if ((v129 & 1) != 0)

          if ((v131 & 1) != 0)
          if ((v133 & 1) != 0)

          v28 = 0;
          objc_storeStrong(&v123, 0);
          objc_storeStrong(&v124, v28);
          objc_storeStrong(&v135, v28);
        }
        objc_storeStrong((id *)&v137, 0);
        v155 = 1;
      }
    }
    else
    {
      v112 = (id)objc_msgSend(v157, "log");
      oslog = (os_log_t)(id)objc_msgSend(v112, "oslog");

      type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        *(_DWORD *)v107 = type;
        v108 = SUSettingsUIStateToString(objc_msgSend(v157, "currentState"));
        v109 = v108;
        v152 = v109;
        v110 = objc_msgSend(v157, "currentState");
        v111 = (id)objc_msgSend(v157, "delegate");
        v150 = 0;
        v148 = 0;
        if (v111)
        {
          v151 = (id)objc_msgSend(v157, "delegate");
          v104 = 1;
          v150 = 1;
          v3 = (objc_class *)objc_opt_class();
          v149 = NSStringFromClass(v3);
          v148 = 1;
          v105 = (const __CFString *)v149;
        }
        else
        {
          v105 = CFSTR("(null)");
        }
        v98 = v105;
        v99 = (id)objc_msgSend(v157, "delegate");
        v100 = (id)objc_msgSend(v157, "scanError");
        v101 = (id)objc_msgSend(v157, "preferredStatefulDescriptor");
        v102 = (id)objc_msgSend(v157, "alternateStatefulDescriptor");
        v103 = (id)objc_msgSend(v157, "currentDownload");
        v146 = 0;
        v144 = 0;
        v142 = 0;
        if (v103)
        {
          v147 = (id)objc_msgSend(v157, "currentDownload");
          v96 = 1;
          v146 = 1;
          v145 = (id)objc_msgSend(v147, "descriptor");
          v144 = 1;
          v143 = (id)objc_msgSend(v145, "humanReadableUpdateName");
          v142 = 1;
          v97 = (const __CFString *)v143;
        }
        else
        {
          v97 = CFSTR("(null)");
        }
        v82 = v97;
        v83 = (id)objc_msgSend(v157, "currentDownload");
        v4 = objc_msgSend(v157, "performThirdPartyScan");
        v89 = "NO";
        v5 = "YES";
        v90 = "YES";
        v94 = 1;
        if ((v4 & 1) == 0)
          v5 = "NO";
        v84 = v5;
        v6 = objc_msgSend(v157, "isTargetedUpdateScheduledForAutoInstall");
        v7 = (uint64_t)v90;
        if ((v6 & 1) == 0)
          v7 = (uint64_t)v89;
        v85 = v7;
        v8 = objc_msgSend(v157, "hidingPreferredDescriptor");
        v9 = (uint64_t)v90;
        if ((v8 & 1) == 0)
          v9 = (uint64_t)v89;
        v86 = v9;
        v87 = (id)objc_msgSend(*((id *)v157 + 32), "humanReadableUpdateName");
        v88 = v87;
        v141 = v88;
        v10 = objc_msgSend(v157, "hidingAlternateDescriptor");
        v11 = (uint64_t)v90;
        if ((v10 & 1) == 0)
          v11 = (uint64_t)v89;
        v91 = v11;
        v92 = (id)objc_msgSend(*((id *)v157 + 33), "humanReadableUpdateName");
        v93 = v92;
        v140 = v93;
        v95 = (id)objc_msgSend(v157, "enrolledBetaProgram");
        v138 = 0;
        if (v95)
        {
          v139 = (id)objc_msgSend(v157, "enrolledBetaProgram");
          v138 = 1;
          v81 = objc_msgSend(v139, "programID");
        }
        else
        {
          v81 = 0;
        }
        v72 = v81;
        v80 = (id)objc_msgSend(v157, "betaPrograms");
        v73 = objc_msgSend(v80, "count");
        v79 = (id)objc_msgSend(v157, "currentFullScanOperation");
        v78 = (id)objc_msgSend(v157, "currentRefreshScanOperation");
        v77 = (id)objc_msgSend(v157, "currentUpdateOperation");
        v76 = (id)objc_msgSend(v157, "auxiliaryOperations");
        v74 = v22;
        buf = v159;
        __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v159, (uint64_t)v113, (uint64_t)v109, v110, (uint64_t)v98, (uint64_t)v99, (uint64_t)v100, (uint64_t)v101, (uint64_t)v102, (uint64_t)v82, (uint64_t)v83, (uint64_t)v84, v85, v86, (uint64_t)v88, v91, (uint64_t)v93, v81, v73,
          (uint64_t)v79,
          (uint64_t)v78,
          (uint64_t)v77,
          objc_msgSend(v76, "count"));
        _os_log_impl(&dword_21BF33000, log, v107[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
          "\tselectedBetaProgram: %lu (count: %ld)\n"
          "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
          "\n"
          "Can not unenroll from beta updates as we are currently checking for updates.",
          buf,
          0xDEu);

        if ((v138 & 1) != 0)
        if ((v142 & 1) != 0)

        if ((v144 & 1) != 0)
        if ((v146 & 1) != 0)

        if ((v148 & 1) != 0)
        if ((v150 & 1) != 0)

        obj = 0;
        objc_storeStrong(&v140, 0);
        objc_storeStrong(&v141, obj);
        objc_storeStrong(&v152, obj);
      }
      objc_storeStrong((id *)&oslog, 0);
      v155 = 1;
    }
  }
  else
  {
    v155 = 1;
  }
  objc_storeStrong(location, 0);
}

void __69__SUSettingsStatefulUIManager_unenrollFromBetaUpdatesWithCompletion___block_invoke(NSObject *a1, char a2)
{
  objc_class *v2;
  char v3;
  const char *v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t *v13;
  Class isa;
  id *v15;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v18;
  id *v19;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint8_t *buf;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  const __CFString *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  id v41;
  id v42;
  int v43;
  id v44;
  int v45;
  const __CFString *v46;
  const __CFString *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  int v53;
  const __CFString *v54;
  os_log_t log;
  os_log_type_t v56[4];
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  id v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  int v65;
  int v66;
  void (*v67)(uint64_t);
  void *v68;
  objc_class *v69;
  char v70;
  uint64_t v71;
  int v72;
  int v73;
  uint64_t (*v74)(uint64_t);
  void *v75;
  objc_class *v76;
  char v77;
  char v78;
  id v79;
  id location;
  id v81;
  char v82;
  id v83;
  char v84;
  id v85;
  char v86;
  id v87;
  char v88;
  id v89;
  char v90;
  id v91;
  id v92;
  os_log_type_t type;
  os_log_t oslog[2];
  char v95;
  NSObject *v96;
  _BYTE v97[232];
  uint64_t v98;

  v62 = a1;
  v63 = "-[SUSettingsStatefulUIManager unenrollFromBetaUpdatesWithCompletion:]_block_invoke";
  v98 = *MEMORY[0x24BDAC8D0];
  v96 = a1;
  v95 = a2 & 1;
  oslog[1] = a1;
  v61 = (id)-[objc_class log](a1[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v61, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v56 = type;
    v57 = SUSettingsUIStateToString(-[objc_class currentState](v62[4].isa, "currentState"));
    v58 = v57;
    v92 = v58;
    v59 = -[objc_class currentState](v62[4].isa, "currentState");
    v60 = (id)-[objc_class delegate](v62[4].isa, "delegate");
    v90 = 0;
    v88 = 0;
    if (v60)
    {
      v91 = (id)-[objc_class delegate](v62[4].isa, "delegate");
      v53 = 1;
      v90 = 1;
      v2 = (objc_class *)objc_opt_class();
      v89 = NSStringFromClass(v2);
      v88 = 1;
      v54 = (const __CFString *)v89;
    }
    else
    {
      v54 = CFSTR("(null)");
    }
    v47 = v54;
    v48 = (id)-[objc_class delegate](v62[4].isa, "delegate");
    v49 = (id)-[objc_class scanError](v62[4].isa, "scanError");
    v50 = (id)-[objc_class preferredStatefulDescriptor](v62[4].isa, "preferredStatefulDescriptor");
    v51 = (id)-[objc_class alternateStatefulDescriptor](v62[4].isa, "alternateStatefulDescriptor");
    v52 = (id)-[objc_class currentDownload](v62[4].isa, "currentDownload");
    v86 = 0;
    v84 = 0;
    v82 = 0;
    if (v52)
    {
      v87 = (id)-[objc_class currentDownload](v62[4].isa, "currentDownload");
      v45 = 1;
      v86 = 1;
      v85 = (id)objc_msgSend(v87, "descriptor");
      v84 = 1;
      v83 = (id)objc_msgSend(v85, "humanReadableUpdateName");
      v82 = 1;
      v46 = (const __CFString *)v83;
    }
    else
    {
      v46 = CFSTR("(null)");
    }
    v31 = v46;
    v32 = (id)-[objc_class currentDownload](v62[4].isa, "currentDownload");
    v3 = -[objc_class performThirdPartyScan](v62[4].isa, "performThirdPartyScan");
    v38 = "NO";
    v4 = "YES";
    v39 = "YES";
    v43 = 1;
    if ((v3 & 1) == 0)
      v4 = "NO";
    v33 = v4;
    v5 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v62[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v6 = (uint64_t)v39;
    if ((v5 & 1) == 0)
      v6 = (uint64_t)v38;
    v34 = v6;
    v7 = -[objc_class hidingPreferredDescriptor](v62[4].isa, "hidingPreferredDescriptor");
    v8 = (uint64_t)v39;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v38;
    v35 = v8;
    v36 = (id)objc_msgSend(*((id *)v62[4].isa + 32), "humanReadableUpdateName");
    v37 = v36;
    v81 = v37;
    v9 = -[objc_class hidingAlternateDescriptor](v62[4].isa, "hidingAlternateDescriptor");
    v10 = (uint64_t)v39;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v38;
    v40 = v10;
    v41 = (id)objc_msgSend(*((id *)v62[4].isa + 33), "humanReadableUpdateName");
    v42 = v41;
    location = v42;
    v44 = (id)-[objc_class enrolledBetaProgram](v62[4].isa, "enrolledBetaProgram");
    v78 = 0;
    if (v44)
    {
      v79 = (id)-[objc_class enrolledBetaProgram](v62[4].isa, "enrolledBetaProgram");
      v78 = 1;
      v30 = objc_msgSend(v79, "programID");
    }
    else
    {
      v30 = 0;
    }
    v21 = v30;
    v29 = (id)-[objc_class betaPrograms](v62[4].isa, "betaPrograms");
    v22 = objc_msgSend(v29, "count");
    v28 = (id)-[objc_class currentFullScanOperation](v62[4].isa, "currentFullScanOperation");
    v27 = (id)-[objc_class currentRefreshScanOperation](v62[4].isa, "currentRefreshScanOperation");
    v26 = (id)-[objc_class currentUpdateOperation](v62[4].isa, "currentUpdateOperation");
    v25 = (id)-[objc_class auxiliaryOperations](v62[4].isa, "auxiliaryOperations");
    v23 = &v11;
    buf = v97;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0((uint64_t)v97, (uint64_t)v63, (uint64_t)v58, v59, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, v34, v35, (uint64_t)v37, v40, (uint64_t)v42, v30, v22,
      (uint64_t)v28,
      (uint64_t)v27,
      (uint64_t)v26,
      objc_msgSend(v25, "count"),
      v95 & 1);
    _os_log_impl(&dword_21BF33000, log, v56[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Un-enroll from beta program success: %d",
      buf,
      0xE4u);

    if ((v78 & 1) != 0)
    if ((v82 & 1) != 0)

    if ((v84 & 1) != 0)
    if ((v86 & 1) != 0)

    if ((v88 & 1) != 0)
    if ((v90 & 1) != 0)

    obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v81, obj);
    objc_storeStrong(&v92, obj);
  }
  objc_storeStrong((id *)oslog, 0);
  if ((v95 & 1) != 0)
    -[objc_class setEnrolledBetaProgram:](v62[4].isa, "setEnrolledBetaProgram:", 0);
  -[objc_class checkForAvailableUpdates](v62[4].isa, "checkForAvailableUpdates");
  if (v62[5].isa)
  {
    v18 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    queue = (dispatch_queue_t)(id)objc_msgSend(v18, "selectDelegateCallbackQueue:", *((_QWORD *)v62[4].isa + 5));
    block = &v71;
    v71 = MEMORY[0x24BDAC760];
    v72 = -1073741824;
    v73 = 0;
    v74 = __69__SUSettingsStatefulUIManager_unenrollFromBetaUpdatesWithCompletion___block_invoke_272;
    v75 = &unk_24DFF7E78;
    v19 = (id *)&v76;
    v76 = v62[5].isa;
    v77 = v95 & 1;
    dispatch_async(queue, block);

    objc_storeStrong(v19, 0);
  }
  isa = v62[4].isa;
  v12 = sel_statefulUIManager_didUnenrollDevice_fromBetaUpdatesProgram_;
  v13 = &v64;
  v64 = MEMORY[0x24BDAC760];
  v65 = -1073741824;
  v66 = 0;
  v67 = __69__SUSettingsStatefulUIManager_unenrollFromBetaUpdatesWithCompletion___block_invoke_2;
  v68 = &unk_24DFF7EA0;
  v15 = (id *)&v69;
  v69 = v62[4].isa;
  v70 = v95 & 1;
  -[objc_class executeOperationOnDelegate:usingBlock:](isa, "executeOperationOnDelegate:usingBlock:", v12, v13);
  objc_storeStrong(v15, 0);
}

uint64_t __69__SUSettingsStatefulUIManager_unenrollFromBetaUpdatesWithCompletion___block_invoke_272(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) & 1);
}

void __69__SUSettingsStatefulUIManager_unenrollFromBetaUpdatesWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(v2, "currentSeedingDevice");
  objc_msgSend(v4, "statefulUIManager:didUnenrollDevice:fromBetaUpdatesProgram:", v2);

}

- (void)refreshBetaUpdates
{
  -[SUSettingsStatefulUIManager refreshBetaUpdates:](self, "refreshBetaUpdates:", 0, a2, self);
}

- (void)refreshBetaUpdates:(id)a3
{
  objc_class *v3;
  char v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SUSettingsScanOperation *v15;
  SUSettingsScanOperation *v16;
  uint64_t v17;
  uint64_t *v18;
  SUSettingsScanOperation *v19;
  id v20;
  id *v21;
  id *v22;
  id *v23;
  id *v24;
  id *v25;
  id v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint8_t *buf;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  const __CFString *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  id v48;
  id v49;
  int v50;
  id v51;
  int v52;
  const __CFString *v53;
  const __CFString *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  int v60;
  const __CFString *v61;
  os_log_t log;
  os_log_type_t v63[4];
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  const char *v69;
  id v70;
  uint64_t v71;
  int v72;
  int v73;
  void (*v74)(id *, void *, void *);
  void *v75;
  _QWORD v76[2];
  SUSettingsScanOperation *v77;
  char v78;
  id v79;
  id v80;
  id v81;
  char v82;
  id v83;
  char v84;
  id v85;
  char v86;
  id v87;
  char v88;
  id v89;
  char v90;
  id v91;
  id v92;
  os_log_type_t type;
  os_log_t oslog;
  id v95;
  id location[2];
  id v97;
  _BYTE v98[264];
  uint64_t v99;

  v69 = "-[SUSettingsStatefulUIManager refreshBetaUpdates:]";
  v99 = *MEMORY[0x24BDAC8D0];
  v97 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v70 = (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v95 = (id)objc_msgSend(v70, "UUIDString");

  v68 = (id)objc_msgSend(v97, "log");
  oslog = (os_log_t)(id)objc_msgSend(v68, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v63 = type;
    v64 = SUSettingsUIStateToString(objc_msgSend(v97, "currentState"));
    v65 = v64;
    v92 = v65;
    v66 = objc_msgSend(v97, "currentState");
    v67 = (id)objc_msgSend(v97, "delegate");
    v90 = 0;
    v88 = 0;
    if (v67)
    {
      v91 = (id)objc_msgSend(v97, "delegate");
      v60 = 1;
      v90 = 1;
      v3 = (objc_class *)objc_opt_class();
      v89 = NSStringFromClass(v3);
      v88 = 1;
      v61 = (const __CFString *)v89;
    }
    else
    {
      v61 = CFSTR("(null)");
    }
    v54 = v61;
    v55 = (id)objc_msgSend(v97, "delegate");
    v56 = (id)objc_msgSend(v97, "scanError");
    v57 = (id)objc_msgSend(v97, "preferredStatefulDescriptor");
    v58 = (id)objc_msgSend(v97, "alternateStatefulDescriptor");
    v59 = (id)objc_msgSend(v97, "currentDownload");
    v86 = 0;
    v84 = 0;
    v82 = 0;
    if (v59)
    {
      v87 = (id)objc_msgSend(v97, "currentDownload");
      v52 = 1;
      v86 = 1;
      v85 = (id)objc_msgSend(v87, "descriptor");
      v84 = 1;
      v83 = (id)objc_msgSend(v85, "humanReadableUpdateName");
      v82 = 1;
      v53 = (const __CFString *)v83;
    }
    else
    {
      v53 = CFSTR("(null)");
    }
    v38 = v53;
    v39 = (id)objc_msgSend(v97, "currentDownload");
    v4 = objc_msgSend(v97, "performThirdPartyScan");
    v45 = "NO";
    v5 = "YES";
    v46 = "YES";
    v50 = 1;
    if ((v4 & 1) == 0)
      v5 = "NO";
    v40 = v5;
    v6 = objc_msgSend(v97, "isTargetedUpdateScheduledForAutoInstall");
    v7 = (uint64_t)v46;
    if ((v6 & 1) == 0)
      v7 = (uint64_t)v45;
    v41 = v7;
    v8 = objc_msgSend(v97, "hidingPreferredDescriptor");
    v9 = (uint64_t)v46;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v45;
    v42 = v9;
    v43 = (id)objc_msgSend(*((id *)v97 + 32), "humanReadableUpdateName");
    v44 = v43;
    v81 = v44;
    v10 = objc_msgSend(v97, "hidingAlternateDescriptor");
    v11 = (uint64_t)v46;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v45;
    v47 = v11;
    v48 = (id)objc_msgSend(*((id *)v97 + 33), "humanReadableUpdateName");
    v49 = v48;
    v80 = v49;
    v51 = (id)objc_msgSend(v97, "enrolledBetaProgram");
    v78 = 0;
    if (v51)
    {
      v79 = (id)objc_msgSend(v97, "enrolledBetaProgram");
      v78 = 1;
      v37 = objc_msgSend(v79, "programID");
    }
    else
    {
      v37 = 0;
    }
    v28 = v37;
    v36 = (id)objc_msgSend(v97, "betaPrograms");
    v29 = objc_msgSend(v36, "count");
    v35 = (id)objc_msgSend(v97, "currentFullScanOperation");
    v34 = (id)objc_msgSend(v97, "currentRefreshScanOperation");
    v33 = (id)objc_msgSend(v97, "currentUpdateOperation");
    v32 = (id)objc_msgSend(v97, "auxiliaryOperations");
    v12 = objc_msgSend(v32, "count");
    v13 = *((_QWORD *)v97 + 23);
    v14 = *((_QWORD *)v97 + 24);
    v30 = &v17;
    buf = v98;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_0((uint64_t)v98, (uint64_t)v69, (uint64_t)v65, v66, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v38, (uint64_t)v39, (uint64_t)v40, v41, v42, (uint64_t)v44, v47, (uint64_t)v49, v37, v29,
      (uint64_t)v35,
      (uint64_t)v34,
      (uint64_t)v33,
      v12,
      (uint64_t)v95,
      v13,
      v14);
    _os_log_impl(&dword_21BF33000, log, v63[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Beginning a beta updates scan operation with scan ID: %{public}@ (full scan FSM: %p, refresh scan FSM: %p)",
      buf,
      0xFCu);

    if ((v78 & 1) != 0)
    if ((v82 & 1) != 0)

    if ((v84 & 1) != 0)
    if ((v86 & 1) != 0)

    if ((v88 & 1) != 0)
    if ((v90 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v80, 0);
    objc_storeStrong(&v81, obj);
    objc_storeStrong(&v92, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  v15 = [SUSettingsScanOperation alloc];
  v24 = &v95;
  v16 = -[SUSettingsScanOperation initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:](v15, "initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:", v95, *((_QWORD *)v97 + 28), *((_QWORD *)v97 + 29), *((_QWORD *)v97 + 21));
  v23 = (id *)&v77;
  v77 = v16;
  v19 = v16;
  v20 = (id)objc_msgSend(v97, "createScanOperationOptions");
  v18 = &v71;
  v71 = MEMORY[0x24BDAC760];
  v72 = -1073741824;
  v73 = 0;
  v74 = __50__SUSettingsStatefulUIManager_refreshBetaUpdates___block_invoke;
  v75 = &unk_24DFF7EF0;
  v22 = (id *)v76;
  v76[0] = v97;
  v21 = (id *)(v18 + 5);
  v25 = location;
  v76[1] = location[0];
  -[SUSettingsScanOperation refreshBetaProgramsWithOptions:completionHandler:](v19, "refreshBetaProgramsWithOptions:completionHandler:", v20, v18);

  v26 = 0;
  objc_storeStrong(v21, 0);
  objc_storeStrong(v22, v26);
  objc_storeStrong(v23, v26);
  objc_storeStrong(v24, v26);
  objc_storeStrong(v25, v26);
}

void __50__SUSettingsStatefulUIManager_refreshBetaUpdates___block_invoke(id *a1, void *a2, void *a3)
{
  objc_class *v3;
  char v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  id v12;
  const char *v13;
  id *v14;
  id v15;
  _QWORD *v16;
  void *v17;
  id v18;
  _QWORD *v19;
  void *v20;
  id v21;
  _QWORD *v22;
  void *v23;
  uint64_t v24;
  id v25;
  dispatch_block_t block;
  dispatch_queue_t queue;
  id v28;
  id *v29;
  id *v30;
  id *v31;
  id v32;
  id *v33;
  char *v34;
  uint64_t *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint8_t *buf;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  const __CFString *v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  id v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  id v61;
  id v62;
  int v63;
  id v64;
  int v65;
  const __CFString *v66;
  const __CFString *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  int v73;
  const __CFString *v74;
  os_log_t log;
  os_log_type_t v76[4];
  id v77;
  id v78;
  uint64_t v79;
  id v80;
  id v81;
  int v82;
  int v83;
  id v84;
  const char *v85;
  id obj;
  id *v87;
  int v88;
  uint64_t v89;
  int v90;
  int v91;
  uint64_t (*v92)(uint64_t);
  void *v93;
  id v94;
  id v95;
  id v96;
  uint64_t v97;
  int v98;
  int v99;
  void (*v100)(uint64_t);
  void *v101;
  id v102;
  char v103;
  id v104;
  id v105;
  id v106;
  char v107;
  id v108;
  char v109;
  id v110;
  char v111;
  id v112;
  char v113;
  id v114;
  char v115;
  id v116;
  id v117;
  os_log_type_t type;
  os_log_t oslog;
  char v120;
  id v121;
  char v122;
  id v123;
  char v124;
  id *v125;
  id v126;
  id location[2];
  _BYTE v128[264];
  uint64_t v129;

  v87 = a1;
  obj = a3;
  v85 = "-[SUSettingsStatefulUIManager refreshBetaUpdates:]_block_invoke";
  v129 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v126 = 0;
  objc_storeStrong(&v126, obj);
  v125 = v87;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v87[4] + 21));
  v124 = 0;
  v122 = 0;
  v120 = 0;
  v88 = 1;
  if (!v126)
  {
    v84 = (id)objc_msgSend(v87[4], "enrolledBetaProgram");
    v123 = v84;
    v83 = 1;
    v122 = 1;
    v121 = (id)objc_msgSend(location[0], "enrolledBetaProgram");
    v120 = 1;
    v88 = objc_msgSend(v84, "isEqual:");
  }
  v82 = v88;
  if ((v120 & 1) != 0)

  if ((v122 & 1) != 0)
  v124 = v82 & 1;
  v81 = (id)objc_msgSend(v87[4], "log");
  oslog = (os_log_t)(id)objc_msgSend(v81, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v76 = type;
    v77 = SUSettingsUIStateToString(objc_msgSend(v87[4], "currentState"));
    v78 = v77;
    v117 = v78;
    v79 = objc_msgSend(v87[4], "currentState");
    v80 = (id)objc_msgSend(v87[4], "delegate");
    v115 = 0;
    v113 = 0;
    if (v80)
    {
      v116 = (id)objc_msgSend(v87[4], "delegate");
      v73 = 1;
      v115 = 1;
      v3 = (objc_class *)objc_opt_class();
      v114 = NSStringFromClass(v3);
      v113 = 1;
      v74 = (const __CFString *)v114;
    }
    else
    {
      v74 = CFSTR("(null)");
    }
    v67 = v74;
    v68 = (id)objc_msgSend(v87[4], "delegate");
    v69 = (id)objc_msgSend(v87[4], "scanError");
    v70 = (id)objc_msgSend(v87[4], "preferredStatefulDescriptor");
    v71 = (id)objc_msgSend(v87[4], "alternateStatefulDescriptor");
    v72 = (id)objc_msgSend(v87[4], "currentDownload");
    v111 = 0;
    v109 = 0;
    v107 = 0;
    if (v72)
    {
      v112 = (id)objc_msgSend(v87[4], "currentDownload");
      v65 = 1;
      v111 = 1;
      v110 = (id)objc_msgSend(v112, "descriptor");
      v109 = 1;
      v108 = (id)objc_msgSend(v110, "humanReadableUpdateName");
      v107 = 1;
      v66 = (const __CFString *)v108;
    }
    else
    {
      v66 = CFSTR("(null)");
    }
    v51 = v66;
    v52 = (id)objc_msgSend(v87[4], "currentDownload");
    v4 = objc_msgSend(v87[4], "performThirdPartyScan");
    v58 = "NO";
    v5 = "YES";
    v59 = "YES";
    v63 = 1;
    if ((v4 & 1) == 0)
      v5 = "NO";
    v53 = v5;
    v6 = objc_msgSend(v87[4], "isTargetedUpdateScheduledForAutoInstall");
    v7 = (uint64_t)v59;
    if ((v6 & 1) == 0)
      v7 = (uint64_t)v58;
    v54 = v7;
    v8 = objc_msgSend(v87[4], "hidingPreferredDescriptor");
    v9 = (uint64_t)v59;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v58;
    v55 = v9;
    v56 = (id)objc_msgSend(*((id *)v87[4] + 32), "humanReadableUpdateName");
    v57 = v56;
    v106 = v57;
    v10 = objc_msgSend(v87[4], "hidingAlternateDescriptor");
    v11 = (uint64_t)v59;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v58;
    v60 = v11;
    v61 = (id)objc_msgSend(*((id *)v87[4] + 33), "humanReadableUpdateName");
    v62 = v61;
    v105 = v62;
    v64 = (id)objc_msgSend(v87[4], "enrolledBetaProgram");
    v103 = 0;
    if (v64)
    {
      v104 = (id)objc_msgSend(v87[4], "enrolledBetaProgram");
      v103 = 1;
      v50 = objc_msgSend(v104, "programID");
    }
    else
    {
      v50 = 0;
    }
    v39 = v50;
    v49 = (id)objc_msgSend(v87[4], "betaPrograms");
    v40 = objc_msgSend(v49, "count");
    v48 = (id)objc_msgSend(v87[4], "currentFullScanOperation");
    v47 = (id)objc_msgSend(v87[4], "currentRefreshScanOperation");
    v46 = (id)objc_msgSend(v87[4], "currentUpdateOperation");
    v45 = (id)objc_msgSend(v87[4], "auxiliaryOperations");
    v41 = objc_msgSend(v45, "count");
    v12 = (id)objc_msgSend(location[0], "scanUUID");
    v44 = v12;
    if ((v124 & 1) != 0)
      v13 = "YES";
    else
      v13 = "NO";
    v42 = &v24;
    buf = v128;
    __os_log_helper_16_2_26_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66_8_34_8_66((uint64_t)v128, (uint64_t)v85, (uint64_t)v78, v79, (uint64_t)v67, (uint64_t)v68, (uint64_t)v69, (uint64_t)v70, (uint64_t)v71, (uint64_t)v51, (uint64_t)v52, (uint64_t)v53, v54, v55, (uint64_t)v57, v60, (uint64_t)v62, v39, v40,
      (uint64_t)v48,
      (uint64_t)v47,
      (uint64_t)v46,
      v41,
      (uint64_t)v12,
      (uint64_t)v126,
      (uint64_t)v13,
      (uint64_t)location[0]);
    _os_log_impl(&dword_21BF33000, log, v76[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform a beta updates scan with ID: %{public}@.\n"
      "Error: %{public}@;\n"
      "Enrolled to a different beta program: %{public}s\n"
      "Results: %{public}@",
      buf,
      0x106u);

    if ((v103 & 1) != 0)
    if ((v107 & 1) != 0)

    if ((v109 & 1) != 0)
    if ((v111 & 1) != 0)

    if ((v113 & 1) != 0)
    if ((v115 & 1) != 0)

    v38 = 0;
    objc_storeStrong(&v105, 0);
    objc_storeStrong(&v106, v38);
    objc_storeStrong(&v117, v38);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v126)
  {
    v14 = (id *)((char *)v87[4] + 128);
    v37 = 0;
    objc_storeStrong(v14, 0);
    objc_storeStrong((id *)v87[4] + 17, v37);
    objc_storeStrong((id *)v87[4] + 18, v37);
  }
  else
  {
    v15 = (id)objc_msgSend(location[0], "currentSeedingDevice");
    v16 = v87[4];
    v17 = (void *)v16[16];
    v16[16] = v15;

    v18 = (id)objc_msgSend(location[0], "betaPrograms");
    v19 = v87[4];
    v20 = (void *)v19[17];
    v19[17] = v18;

    v21 = (id)objc_msgSend(location[0], "enrolledBetaProgram");
    v22 = v87[4];
    v23 = (void *)v22[18];
    v22[18] = v21;

  }
  v36 = v87[4];
  v34 = sel_statefulUIManagerDidRefreshBetaUpdates_;
  v35 = &v97;
  v97 = MEMORY[0x24BDAC760];
  v98 = -1073741824;
  v99 = 0;
  v100 = __50__SUSettingsStatefulUIManager_refreshBetaUpdates___block_invoke_279;
  v101 = &unk_24DFF7B58;
  v33 = &v102;
  v102 = v87[4];
  objc_msgSend(v36, "executeOperationOnDelegate:usingBlock:", v34, v35);
  if (v87[5])
  {
    v28 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    queue = (dispatch_queue_t)(id)objc_msgSend(v28, "selectDelegateCallbackQueue:", *((_QWORD *)v87[4] + 5));
    block = &v89;
    v89 = MEMORY[0x24BDAC760];
    v90 = -1073741824;
    v91 = 0;
    v92 = __50__SUSettingsStatefulUIManager_refreshBetaUpdates___block_invoke_2;
    v93 = &unk_24DFF7E28;
    v31 = &v96;
    v96 = v87[5];
    v30 = (id *)((char *)block + 32);
    v94 = location[0];
    v29 = (id *)((char *)block + 40);
    v95 = v126;
    dispatch_async(queue, block);

    v32 = 0;
    objc_storeStrong(v29, 0);
    objc_storeStrong(v30, v32);
    objc_storeStrong(v31, v32);
  }
  if ((v124 & 1) != 0)
    objc_msgSend(v87[4], "checkForAvailableUpdates");
  v25 = 0;
  objc_storeStrong(v33, 0);
  objc_storeStrong(&v126, v25);
  objc_storeStrong(location, v25);
}

void __50__SUSettingsStatefulUIManager_refreshBetaUpdates___block_invoke_279(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManagerDidRefreshBetaUpdates:", *(_QWORD *)(a1 + 32));

}

uint64_t __50__SUSettingsStatefulUIManager_refreshBetaUpdates___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (BOOL)hasSUPathRestrictions
{
  return self->_mdmPathRestrictions != 0;
}

- (BOOL)isDelayingUpdate
{
  BOOL v3;
  BOOL v4;
  char v5;
  NSError *v6;
  char v7;
  NSString *v8;
  char v9;
  NSError *v10;
  char v11;
  NSError *v12;

  v11 = 0;
  v9 = 0;
  v7 = 0;
  v5 = 0;
  v4 = 1;
  if (!self->_delayingUpdate)
  {
    v12 = -[SUSettingsStatefulUIManager scanError](self, "scanError");
    v11 = 1;
    v3 = 0;
    if (v12)
    {
      v10 = -[SUSettingsStatefulUIManager scanError](self, "scanError");
      v9 = 1;
      v8 = -[NSError domain](v10, "domain");
      v7 = 1;
      v3 = 0;
      if (-[NSString isEqualToString:](v8, "isEqualToString:", *MEMORY[0x24BEAED98]))
      {
        v6 = -[SUSettingsStatefulUIManager scanError](self, "scanError");
        v5 = 1;
        v3 = -[NSError code](v6, "code") == 55;
      }
    }
    v4 = v3;
  }
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  if ((v9 & 1) != 0)

  if ((v11 & 1) != 0)
  return v4;
}

- (BOOL)isPreferredUpdatePromotedAsAlternate
{
  SUDescriptor *v3;
  SUSettingsStatefulDescriptor *v4;
  SUSettingsStatefulDescriptor *v5;
  BOOL v6;
  char v7;
  SUDescriptor *v8;
  char v9;
  SUSettingsStatefulDescriptor *v10;
  char v11;
  SUSettingsStatefulDescriptor *v12;
  char v14;

  v5 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](self, "preferredStatefulDescriptor");
  v11 = 0;
  v9 = 0;
  v7 = 0;
  v6 = 0;
  if (v5)
  {
    v12 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](self, "alternateStatefulDescriptor");
    v11 = 1;
    v6 = 0;
    if (!v12)
    {
      v10 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](self, "preferredStatefulDescriptor");
      v9 = 1;
      v8 = -[SUSettingsStatefulDescriptor descriptor](v10, "descriptor");
      v7 = 1;
      v6 = 0;
      if (-[SUDescriptor audienceType](v8, "audienceType") == 1)
        v6 = !self->_hidingPreferredDescriptor;
    }
  }
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  if ((v11 & 1) != 0)

  if (v6)
  {
    v4 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](self, "preferredStatefulDescriptor");
    v3 = -[SUSettingsStatefulDescriptor descriptor](v4, "descriptor");
    v14 = -[SUDescriptor promoteAlternateUpdate](v3, "promoteAlternateUpdate") & 1;

  }
  else
  {
    v14 = 0;
  }
  return v14 & 1;
}

- (void)rvTriggerNeRDUpdate
{
  -[SUSettingsStatefulUIManager rvTriggerNeRDUpdate:](self, "rvTriggerNeRDUpdate:", 0, a2, self);
}

- (void)rvTriggerNeRDUpdate:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  SUSettingsStatefulUIManager *v9;
  id v10;
  id location[2];
  SUSettingsStatefulUIManager *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_workQueue;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __51__SUSettingsStatefulUIManager_rvTriggerNeRDUpdate___block_invoke;
  v8 = &unk_24DFF7B80;
  v9 = v12;
  v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __51__SUSettingsStatefulUIManager_rvTriggerNeRDUpdate___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 224);
  if (*(_QWORD *)(a1 + 40))
    return objc_msgSend(v2, "rvTriggerNeRDUpdate:", *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v2, "rvTriggerNeRDUpdate:", MEMORY[0x24BDBD1B8]);
}

- (id)rvGetCurrentNeRDInfo
{
  return -[SUManagerClient rvGetCurrentNeRDInfo](self->_suClient, "rvGetCurrentNeRDInfo", a2, self);
}

- (void)networkChangedFromNetworkType:(int)a3 toNetworkType:(int)a4
{
  NSObject *queue;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8);
  void *v9;
  SUSettingsStatefulUIManager *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  SEL v15;
  SUSettingsStatefulUIManager *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = a4;
  queue = self->_workQueue;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __75__SUSettingsStatefulUIManager_networkChangedFromNetworkType_toNetworkType___block_invoke;
  v9 = &unk_24DFF7F18;
  v10 = self;
  v11 = v13;
  v12 = v14;
  dispatch_async(queue, &v5);
  objc_storeStrong((id *)&v10, 0);
}

void __75__SUSettingsStatefulUIManager_networkChangedFromNetworkType_toNetworkType___block_invoke(NSObject *a1)
{
  Class isa;
  Class v2;
  const char *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  Class v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint8_t *buf;
  id v18;
  id v19;
  id v20;
  int v21;
  id v22;
  id v23;
  id v24;
  int isa_high;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  const char *v48;
  id v49;
  id v50;
  id v51;
  int v52;
  const char *v53;
  id v54;
  const char *v55;
  int v56;
  const char *v57;
  int v58;
  id v59;
  int v60;
  const __CFString *v61;
  id v62;
  const __CFString *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  const __CFString *v76;
  id v77;
  const __CFString *v78;
  id v79;
  Class aClass;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  id v87;
  os_log_t log;
  os_log_type_t v89[4];
  unint64_t v90;
  id v91;
  id v92;
  id v93;
  const char *v94;
  id obj;
  NSObject *v96;
  id location;
  id v98;
  id v99;
  char v100;
  id v101;
  id v102;
  id v103;
  char v104;
  id v105;
  char v106;
  id v107;
  char v108;
  id v109;
  char v110;
  id v111;
  char v112;
  id v113;
  id v114;
  os_log_type_t type;
  os_log_t oslog[3];
  _BYTE v117[272];
  uint64_t v118;

  v96 = a1;
  v94 = "-[SUSettingsStatefulUIManager networkChangedFromNetworkType:toNetworkType:]_block_invoke";
  v118 = *MEMORY[0x24BDAC8D0];
  oslog[2] = a1;
  oslog[1] = a1;
  obj = a1[4].isa;
  objc_sync_enter(obj);
  if (LODWORD(v96[5].isa) != *((_DWORD *)v96[4].isa + 5))
  {
    v93 = (id)-[objc_class log](v96[4].isa, "log");
    v91 = v93;
    v92 = (id)objc_msgSend(v91, "oslog");
    oslog[0] = (os_log_t)v92;

    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      log = oslog[0];
      *(_DWORD *)v89 = type;
      v90 = -[objc_class currentState](v96[4].isa, "currentState");
      v87 = SUSettingsUIStateToString(v90);
      v84 = v87;
      v85 = v84;
      v114 = v85;
      v86 = -[objc_class currentState](v96[4].isa, "currentState");
      isa = v96[4].isa;
      v112 = 0;
      v110 = 0;
      v83 = (id)-[objc_class delegate](isa, "delegate");
      v82 = v83;
      if (v82)
      {
        v81 = (id)-[objc_class delegate](v96[4].isa, "delegate");
        v113 = v81;
        v112 = 1;
        aClass = (Class)objc_opt_class();
        v79 = NSStringFromClass(aClass);
        v111 = v79;
        v110 = 1;
        v78 = (const __CFString *)v111;
      }
      else
      {
        v78 = CFSTR("(null)");
      }
      v76 = v78;
      v77 = (id)-[objc_class delegate](v96[4].isa, "delegate");
      v74 = v77;
      v75 = (id)-[objc_class scanError](v96[4].isa, "scanError");
      v72 = v75;
      v73 = (id)-[objc_class preferredStatefulDescriptor](v96[4].isa, "preferredStatefulDescriptor");
      v70 = v73;
      v71 = (id)-[objc_class alternateStatefulDescriptor](v96[4].isa, "alternateStatefulDescriptor");
      v68 = v71;
      v2 = v96[4].isa;
      v108 = 0;
      v106 = 0;
      v104 = 0;
      v69 = (id)-[objc_class currentDownload](v2, "currentDownload");
      v67 = v69;
      if (v67)
      {
        v66 = (id)-[objc_class currentDownload](v96[4].isa, "currentDownload");
        v109 = v66;
        v108 = 1;
        v65 = (id)objc_msgSend(v109, "descriptor");
        v107 = v65;
        v106 = 1;
        v64 = (id)objc_msgSend(v107, "humanReadableUpdateName");
        v105 = v64;
        v104 = 1;
        v63 = (const __CFString *)v105;
      }
      else
      {
        v63 = CFSTR("(null)");
      }
      v61 = v63;
      v62 = (id)-[objc_class currentDownload](v96[4].isa, "currentDownload");
      v59 = v62;
      v60 = -[objc_class performThirdPartyScan](v96[4].isa, "performThirdPartyScan");
      v3 = "YES";
      if ((v60 & 1) == 0)
        v3 = "NO";
      v57 = v3;
      v58 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v96[4].isa, "isTargetedUpdateScheduledForAutoInstall");
      v4 = "YES";
      if ((v58 & 1) == 0)
        v4 = "NO";
      v55 = v4;
      v56 = -[objc_class hidingPreferredDescriptor](v96[4].isa, "hidingPreferredDescriptor");
      v5 = "YES";
      if ((v56 & 1) == 0)
        v5 = "NO";
      v53 = v5;
      v54 = (id)objc_msgSend(*((id *)v96[4].isa + 32), "humanReadableUpdateName");
      v50 = v54;
      v51 = v50;
      v103 = v51;
      v52 = -[objc_class hidingAlternateDescriptor](v96[4].isa, "hidingAlternateDescriptor");
      v6 = "YES";
      if ((v52 & 1) == 0)
        v6 = "NO";
      v48 = v6;
      v49 = (id)objc_msgSend(*((id *)v96[4].isa + 33), "humanReadableUpdateName");
      v45 = v49;
      v46 = v45;
      v102 = v46;
      v7 = v96[4].isa;
      v100 = 0;
      v47 = (id)-[objc_class enrolledBetaProgram](v7, "enrolledBetaProgram");
      v44 = v47;
      if (v44)
      {
        v43 = (id)-[objc_class enrolledBetaProgram](v96[4].isa, "enrolledBetaProgram");
        v101 = v43;
        v100 = 1;
        v42 = objc_msgSend(v101, "programID");
        v41 = v42;
      }
      else
      {
        v41 = 0;
      }
      v39 = v41;
      v40 = (id)-[objc_class betaPrograms](v96[4].isa, "betaPrograms");
      v37 = v40;
      v38 = objc_msgSend(v37, "count");
      v36 = (id)-[objc_class currentFullScanOperation](v96[4].isa, "currentFullScanOperation");
      v34 = v36;
      v35 = (id)-[objc_class currentRefreshScanOperation](v96[4].isa, "currentRefreshScanOperation");
      v32 = v35;
      v33 = (id)-[objc_class currentUpdateOperation](v96[4].isa, "currentUpdateOperation");
      v30 = v33;
      v31 = (id)-[objc_class auxiliaryOperations](v96[4].isa, "auxiliaryOperations");
      v28 = v31;
      v29 = objc_msgSend(v28, "count");
      v27 = (id)SUStringFromNetworkType();
      v23 = v27;
      v24 = v23;
      v99 = v24;
      isa_high = HIDWORD(v96[5].isa);
      v26 = (id)SUStringFromNetworkType();
      v19 = v26;
      v20 = v19;
      v98 = v20;
      v21 = (int)v96[5].isa;
      v22 = (id)SUStringFromNetworkType();
      v18 = v22;
      location = v18;
      v8 = *((_DWORD *)v96[4].isa + 5);
      v16 = &v10;
      buf = v117;
      __os_log_helper_16_2_28_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_64_4_0_8_66_4_0_8_66_4_0((uint64_t)v117, (uint64_t)v94, (uint64_t)v85, v86, (uint64_t)v76, (uint64_t)v74, (uint64_t)v72, (uint64_t)v70, (uint64_t)v68, (uint64_t)v61, (uint64_t)v59, (uint64_t)v57, (uint64_t)v55, (uint64_t)v53, (uint64_t)v51, (uint64_t)v48, (uint64_t)v46, v41, v38,
        (uint64_t)v34,
        (uint64_t)v32,
        (uint64_t)v30,
        v29,
        (uint64_t)v24,
        isa_high,
        (uint64_t)v20,
        v21,
        (uint64_t)location,
        v8);
      _os_log_impl(&dword_21BF33000, log, v89[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Changed network type: %@ (%d) -> %{public}@ (%d) (current network type: %{public}@ (%d))",
        buf,
        0x10Eu);

      if ((v100 & 1) != 0)
      if ((v104 & 1) != 0)

      if ((v106 & 1) != 0)
      if ((v108 & 1) != 0)

      if ((v110 & 1) != 0)
      if ((v112 & 1) != 0)

      objc_storeStrong(&location, 0);
      objc_storeStrong(&v98, 0);
      objc_storeStrong(&v99, 0);
      objc_storeStrong(&v102, 0);
      objc_storeStrong(&v103, 0);
      objc_storeStrong(&v114, 0);
    }
    objc_storeStrong((id *)oslog, 0);
    v9 = v96;
    *((_DWORD *)v96[4].isa + 5) = v96[5].isa;
    if (LODWORD(v9[5].isa))
    {
      if ((*((_QWORD *)v96[4].isa + 10) || (v15 = -[objc_class currentState](v96[4].isa, "currentState"), v15 == 3))
        && (v14 = -[objc_class currentState](v96[4].isa, "currentState"), v14 != 2))
      {
        -[objc_class setScanError:](v96[4].isa, "setScanError:", 0);
        -[objc_class refreshState:](v96[4].isa, "refreshState:", 1);
      }
      else
      {
        -[objc_class checkForAvailableUpdatesWithRetriesCount:](v96[4].isa, "checkForAvailableUpdatesWithRetriesCount:", kSUSettingsStatefulUINetworkErrorRetriesCount);
      }
    }
    else
    {
      v13 = -[objc_class currentState](v96[4].isa, "currentState");
      if (v13 != 2)
      {
        v12 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAED98], 7, 0);
        v11 = v12;
        -[objc_class setScanError:](v96[4].isa, "setScanError:");

        -[objc_class refreshState](v96[4].isa, "refreshState");
      }
    }
  }
  objc_sync_exit(obj);

}

- (void)client:(id)a3 scanRequestDidStartForOptions:(id)a4
{
  objc_class *v4;
  BOOL v5;
  const char *v6;
  BOOL v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const __CFString *v15;
  SUCoreFSM *managerFSM;
  id v17;
  id v18;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint8_t *buf;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  id v43;
  id v44;
  int v45;
  id v46;
  int v47;
  const __CFString *v48;
  const __CFString *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  int v55;
  const __CFString *v56;
  os_log_t log;
  os_log_type_t v58[4];
  id v59;
  id v60;
  unint64_t v61;
  id v62;
  id v63;
  const char *v64;
  id obj;
  int v66;
  char v67;
  id v68;
  id v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  char v75;
  id v76;
  char v77;
  id v78;
  char v79;
  id v80;
  id v81;
  os_log_type_t type;
  os_log_t oslog;
  id v84;
  id location[2];
  SUSettingsStatefulUIManager *v86;
  _BYTE v87[232];
  uint64_t v88;

  obj = a4;
  v64 = "-[SUSettingsStatefulUIManager client:scanRequestDidStartForOptions:]";
  v88 = *MEMORY[0x24BDAC8D0];
  v86 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v84 = 0;
  objc_storeStrong(&v84, obj);
  v63 = -[SUSettingsStatefulUIManager log](v86, "log");
  oslog = (os_log_t)(id)objc_msgSend(v63, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v58 = type;
    v59 = SUSettingsUIStateToString(-[SUSettingsStatefulUIManager currentState](v86, "currentState"));
    v60 = v59;
    v81 = v60;
    v61 = -[SUSettingsStatefulUIManager currentState](v86, "currentState");
    v62 = -[SUSettingsStatefulUIManager delegate](v86, "delegate");
    v79 = 0;
    v77 = 0;
    if (v62)
    {
      v80 = -[SUSettingsStatefulUIManager delegate](v86, "delegate");
      v55 = 1;
      v79 = 1;
      v4 = (objc_class *)objc_opt_class();
      v78 = NSStringFromClass(v4);
      v77 = 1;
      v56 = (const __CFString *)v78;
    }
    else
    {
      v56 = CFSTR("(null)");
    }
    v49 = v56;
    v50 = -[SUSettingsStatefulUIManager delegate](v86, "delegate");
    v51 = -[SUSettingsStatefulUIManager scanError](v86, "scanError");
    v52 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](v86, "preferredStatefulDescriptor");
    v53 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](v86, "alternateStatefulDescriptor");
    v54 = -[SUSettingsStatefulUIManager currentDownload](v86, "currentDownload");
    v75 = 0;
    v73 = 0;
    v71 = 0;
    if (v54)
    {
      v76 = -[SUSettingsStatefulUIManager currentDownload](v86, "currentDownload");
      v47 = 1;
      v75 = 1;
      v74 = (id)objc_msgSend(v76, "descriptor");
      v73 = 1;
      v72 = (id)objc_msgSend(v74, "humanReadableUpdateName");
      v71 = 1;
      v48 = (const __CFString *)v72;
    }
    else
    {
      v48 = CFSTR("(null)");
    }
    v33 = v48;
    v34 = -[SUSettingsStatefulUIManager currentDownload](v86, "currentDownload");
    v5 = -[SUSettingsStatefulUIManager performThirdPartyScan](v86, "performThirdPartyScan");
    v40 = "NO";
    v6 = "YES";
    v41 = "YES";
    v45 = 1;
    if (!v5)
      v6 = "NO";
    v35 = v6;
    v7 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v86, "isTargetedUpdateScheduledForAutoInstall");
    v8 = (uint64_t)v41;
    if (!v7)
      v8 = (uint64_t)v40;
    v36 = v8;
    v9 = -[SUSettingsStatefulUIManager hidingPreferredDescriptor](v86, "hidingPreferredDescriptor");
    v10 = (uint64_t)v41;
    if (!v9)
      v10 = (uint64_t)v40;
    v37 = v10;
    v38 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v86->_hiddenPreferredStatefulDescriptor, "humanReadableUpdateName");
    v39 = v38;
    v70 = v39;
    v11 = -[SUSettingsStatefulUIManager hidingAlternateDescriptor](v86, "hidingAlternateDescriptor");
    v12 = (uint64_t)v41;
    if (!v11)
      v12 = (uint64_t)v40;
    v42 = v12;
    v43 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v86->_hiddenAlternateStatefulDescriptor, "humanReadableUpdateName");
    v44 = v43;
    v69 = v44;
    v46 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v86, "enrolledBetaProgram");
    v67 = 0;
    if (v46)
    {
      v68 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v86, "enrolledBetaProgram");
      v67 = 1;
      v32 = objc_msgSend(v68, "programID");
    }
    else
    {
      v32 = 0;
    }
    v21 = v32;
    v31 = -[SUSettingsStatefulUIManager betaPrograms](v86, "betaPrograms");
    v22 = objc_msgSend(v31, "count");
    v30 = -[SUSettingsStatefulUIManager currentFullScanOperation](v86, "currentFullScanOperation");
    v29 = -[SUSettingsStatefulUIManager currentRefreshScanOperation](v86, "currentRefreshScanOperation");
    v28 = -[SUSettingsStatefulUIManager currentUpdateOperation](v86, "currentUpdateOperation");
    v27 = -[SUSettingsStatefulUIManager auxiliaryOperations](v86, "auxiliaryOperations");
    v23 = objc_msgSend(v27, "count");
    v26 = (id)objc_msgSend(v84, "identifier");
    v24 = &v13;
    buf = v87;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v87, (uint64_t)v64, (uint64_t)v60, v61, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, (uint64_t)v53, (uint64_t)v33, (uint64_t)v34, (uint64_t)v35, v36, v37, (uint64_t)v39, v42, (uint64_t)v44, v32, v22,
      (uint64_t)v30,
      (uint64_t)v29,
      (uint64_t)v28,
      v23,
      (uint64_t)v26);
    _os_log_impl(&dword_21BF33000, log, v58[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Scan has started on behalf of: %{public}@",
      buf,
      0xE8u);

    if ((v67 & 1) != 0)
    if ((v71 & 1) != 0)

    if ((v73 & 1) != 0)
    if ((v75 & 1) != 0)

    if ((v77 & 1) != 0)
    if ((v79 & 1) != 0)

    v20 = 0;
    objc_storeStrong(&v69, 0);
    objc_storeStrong(&v70, v20);
    objc_storeStrong(&v81, v20);
  }
  objc_storeStrong((id *)&oslog, 0);
  v18 = (id)objc_msgSend(v84, "identifier");
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.Preferences.software_update"));

  if ((v19 & 1) != 0)
  {
    v66 = 1;
  }
  else
  {
    -[SUSettingsStatefulUIManager setPerformThirdPartyScan:](v86, "setPerformThirdPartyScan:", 1);
    managerFSM = v86->_managerFSM;
    v15 = CFSTR("PerformThirdPartyScan");
    v17 = objc_alloc_init(SUSettingsStatefulUIManagerFSMParam);
    -[SUCoreFSM postEvent:withInfo:](managerFSM, "postEvent:withInfo:", v15);

    v66 = 0;
  }
  v14 = 0;
  objc_storeStrong(&v84, 0);
  objc_storeStrong(location, v14);
}

- (void)client:(id)a3 scanRequestDidFinishForOptions:(id)a4 results:(id)a5 error:(id)a6
{
  id v6;
  id *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  os_log_t v15;
  os_log_type_t v16[4];
  uint8_t *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  int v23;
  id v24;
  uint64_t *v25;
  uint8_t *buf;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  const char *v49;
  id v50;
  id v51;
  id v52;
  int v53;
  const char *v54;
  id v55;
  const char *v56;
  int v57;
  const char *v58;
  int v59;
  id v60;
  int v61;
  const __CFString *v62;
  id v63;
  const __CFString *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  const __CFString *v77;
  id v78;
  const __CFString *v79;
  id v80;
  Class aClass;
  id v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  os_log_t log;
  os_log_type_t v90[4];
  unint64_t v91;
  id v92;
  id v93;
  id v94;
  id *v95;
  id obj;
  id v97;
  id v98;
  const char *v99;
  os_log_type_t v100;
  os_log_t oslog;
  int v102;
  char v103;
  id v104;
  id v105;
  id v106;
  char v107;
  id v108;
  char v109;
  id v110;
  char v111;
  id v112;
  char v113;
  id v114;
  char v115;
  id v116;
  id v117;
  os_log_type_t type;
  id v119;
  id v120;
  id v121;
  id v122;
  id location[2];
  SUSettingsStatefulUIManager *v124;
  _BYTE v125[32];
  _BYTE v126[232];
  uint64_t v127;

  v95 = &v117;
  obj = a4;
  v97 = a5;
  v98 = a6;
  v99 = "-[SUSettingsStatefulUIManager client:scanRequestDidFinishForOptions:results:error:]";
  v127 = *MEMORY[0x24BDAC8D0];
  v124 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v122 = 0;
  objc_storeStrong(&v122, obj);
  v121 = 0;
  objc_storeStrong(&v121, v97);
  v120 = 0;
  objc_storeStrong(&v120, v98);
  v94 = -[SUSettingsStatefulUIManager log](v124, "log");
  v92 = v94;
  v93 = (id)objc_msgSend(v92, "oslog");
  v119 = v93;

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v119, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)v95[2];
    *(_DWORD *)v90 = type;
    v91 = objc_msgSend(v95[8], "currentState");
    v88 = SUSettingsUIStateToString(v91);
    v85 = v88;
    v6 = v85;
    v7 = v95;
    v86 = (uint64_t)v6;
    *v95 = v6;
    v87 = objc_msgSend(v7[8], "currentState");
    v84 = (id)objc_msgSend(v95[8], "delegate");
    v83 = v84;
    v115 = 0;
    v113 = 0;
    if (v83)
    {
      v82 = (id)objc_msgSend(v95[8], "delegate");
      v116 = v82;
      v115 = 1;
      aClass = (Class)objc_opt_class();
      v80 = NSStringFromClass(aClass);
      v114 = v80;
      v113 = 1;
      v79 = (const __CFString *)v114;
    }
    else
    {
      v79 = CFSTR("(null)");
    }
    v77 = v79;
    v78 = (id)objc_msgSend(v95[8], "delegate");
    v75 = v78;
    v76 = (id)objc_msgSend(v95[8], "scanError");
    v73 = v76;
    v74 = (id)objc_msgSend(v95[8], "preferredStatefulDescriptor");
    v71 = v74;
    v72 = (id)objc_msgSend(v95[8], "alternateStatefulDescriptor");
    v69 = v72;
    v70 = (id)objc_msgSend(v95[8], "currentDownload");
    v68 = v70;
    v111 = 0;
    v109 = 0;
    v107 = 0;
    if (v68)
    {
      v67 = (id)objc_msgSend(v95[8], "currentDownload");
      v112 = v67;
      v111 = 1;
      v66 = (id)objc_msgSend(v112, "descriptor");
      v110 = v66;
      v109 = 1;
      v65 = (id)objc_msgSend(v110, "humanReadableUpdateName");
      v108 = v65;
      v107 = 1;
      v64 = (const __CFString *)v108;
    }
    else
    {
      v64 = CFSTR("(null)");
    }
    v62 = v64;
    v63 = (id)objc_msgSend(v95[8], "currentDownload");
    v60 = v63;
    v61 = objc_msgSend(v95[8], "performThirdPartyScan");
    v8 = "YES";
    if ((v61 & 1) == 0)
      v8 = "NO";
    v58 = v8;
    v59 = objc_msgSend(v95[8], "isTargetedUpdateScheduledForAutoInstall");
    v9 = "YES";
    if ((v59 & 1) == 0)
      v9 = "NO";
    v56 = v9;
    v57 = objc_msgSend(v95[8], "hidingPreferredDescriptor");
    v10 = "YES";
    if ((v57 & 1) == 0)
      v10 = "NO";
    v54 = v10;
    v55 = (id)objc_msgSend(*((id *)v95[8] + 32), "humanReadableUpdateName");
    v51 = v55;
    v52 = v51;
    v106 = v52;
    v53 = objc_msgSend(v95[8], "hidingAlternateDescriptor");
    v11 = "YES";
    if ((v53 & 1) == 0)
      v11 = "NO";
    v49 = v11;
    v50 = (id)objc_msgSend(*((id *)v95[8] + 33), "humanReadableUpdateName");
    v46 = v50;
    v47 = v46;
    v105 = v47;
    v48 = (id)objc_msgSend(v95[8], "enrolledBetaProgram");
    v45 = v48;
    v103 = 0;
    if (v45)
    {
      v44 = (id)objc_msgSend(v95[8], "enrolledBetaProgram");
      v104 = v44;
      v103 = 1;
      v43 = objc_msgSend(v104, "programID");
      v42 = v43;
    }
    else
    {
      v42 = 0;
    }
    v40 = v42;
    v41 = (id)objc_msgSend(v95[8], "betaPrograms");
    v38 = v41;
    v39 = objc_msgSend(v38, "count");
    v37 = (id)objc_msgSend(v95[8], "currentFullScanOperation");
    v35 = v37;
    v36 = (id)objc_msgSend(v95[8], "currentRefreshScanOperation");
    v33 = v36;
    v34 = (id)objc_msgSend(v95[8], "currentUpdateOperation");
    v31 = v34;
    v32 = (id)objc_msgSend(v95[8], "auxiliaryOperations");
    v29 = v32;
    v30 = objc_msgSend(v29, "count");
    v28 = (id)objc_msgSend(v95[5], "identifier");
    v27 = v28;
    v25 = &v14;
    buf = v126;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v126, (uint64_t)v99, v86, v87, (uint64_t)v77, (uint64_t)v75, (uint64_t)v73, (uint64_t)v71, (uint64_t)v69, (uint64_t)v62, (uint64_t)v60, (uint64_t)v58, (uint64_t)v56, (uint64_t)v54, (uint64_t)v52, (uint64_t)v49, (uint64_t)v47, v42, v39,
      (uint64_t)v35,
      (uint64_t)v33,
      (uint64_t)v31,
      v30,
      (uint64_t)v27);
    _os_log_impl(&dword_21BF33000, log, v90[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Scan has finished, triggered by the initiator: %{public}@",
      buf,
      0xE8u);

    if ((v103 & 1) != 0)
    if ((v107 & 1) != 0)

    if ((v109 & 1) != 0)
    if ((v111 & 1) != 0)

    if ((v113 & 1) != 0)
    if ((v115 & 1) != 0)

    objc_storeStrong(&v105, 0);
    objc_storeStrong(&v106, 0);
    objc_storeStrong(&v117, 0);
  }
  objc_storeStrong(&v119, 0);
  v24 = (id)objc_msgSend(v95[5], "identifier");
  v22 = v24;
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.Preferences.software_update"));

  if ((v23 & 1) != 0)
  {
    v102 = 1;
  }
  else
  {
    v21 = *((id *)v95[8] + 27);
    objc_sync_enter(v21);
    if ((*((_BYTE *)v95[8] + 10) & 1) == 0)
    {
      v20 = (id)objc_msgSend(v95[8], "log");
      v18 = v20;
      v19 = (id)objc_msgSend(v18, "oslog");
      oslog = (os_log_t)v19;

      v100 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v15 = oslog;
        *(_DWORD *)v16 = v100;
        v12 = (uint64_t)v95[3];
        v13 = (uint64_t)v95[4];
        v17 = v125;
        __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v125, (uint64_t)v99, v12, v13);
        _os_log_impl(&dword_21BF33000, v15, v16[0], "%s: Got a third-party scan completion even, but performThirdPartyScan is NO. Recovering.\nerror: %{public}@; SUScanResults: %{public}@",
          v17,
          0x20u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_msgSend(v95[8], "performFullScanWithScanResults:andScanError:", v95[4], v95[3]);
    objc_sync_exit(v21);

    v102 = 0;
  }
  objc_storeStrong(&v120, 0);
  objc_storeStrong(&v121, 0);
  objc_storeStrong(&v122, 0);
  objc_storeStrong(location, 0);
}

- (void)client:(id)a3 downloadDidStart:(id)a4
{
  objc_class *v4;
  char v5;
  const char *v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t *v16;
  id v17;
  id *v18;
  id *v19;
  id *v20;
  id v21;
  os_log_t v22;
  os_log_type_t v23[4];
  uint8_t *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint8_t *buf;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  const __CFString *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  id v50;
  id v51;
  int v52;
  id v53;
  int v54;
  const __CFString *v55;
  const __CFString *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  int v62;
  const __CFString *v63;
  os_log_t log;
  os_log_type_t v65[4];
  id v66;
  id v67;
  uint64_t v68;
  id v69;
  id v70;
  const char *v71;
  id obj;
  uint64_t v73;
  int v74;
  int v75;
  void (*v76)(id *, char);
  void *v77;
  _QWORD v78[3];
  os_log_type_t v79;
  os_log_t v80;
  id v81;
  int v82;
  id v83;
  char v84;
  id v85;
  id v86;
  id v87;
  char v88;
  id v89;
  char v90;
  id v91;
  char v92;
  id v93;
  char v94;
  id v95;
  char v96;
  id v97;
  id v98;
  os_log_type_t type;
  os_log_t oslog;
  id v101;
  id location[2];
  id v103;
  _BYTE v104[16];
  _BYTE v105[248];
  uint64_t v106;

  obj = a4;
  v71 = "-[SUSettingsStatefulUIManager client:downloadDidStart:]";
  v106 = *MEMORY[0x24BDAC8D0];
  v103 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v101 = 0;
  objc_storeStrong(&v101, obj);
  v70 = (id)objc_msgSend(v103, "log");
  oslog = (os_log_t)(id)objc_msgSend(v70, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v65 = type;
    v66 = SUSettingsUIStateToString(objc_msgSend(v103, "currentState"));
    v67 = v66;
    v98 = v67;
    v68 = objc_msgSend(v103, "currentState");
    v69 = (id)objc_msgSend(v103, "delegate");
    v96 = 0;
    v94 = 0;
    if (v69)
    {
      v97 = (id)objc_msgSend(v103, "delegate");
      v62 = 1;
      v96 = 1;
      v4 = (objc_class *)objc_opt_class();
      v95 = NSStringFromClass(v4);
      v94 = 1;
      v63 = (const __CFString *)v95;
    }
    else
    {
      v63 = CFSTR("(null)");
    }
    v56 = v63;
    v57 = (id)objc_msgSend(v103, "delegate");
    v58 = (id)objc_msgSend(v103, "scanError");
    v59 = (id)objc_msgSend(v103, "preferredStatefulDescriptor");
    v60 = (id)objc_msgSend(v103, "alternateStatefulDescriptor");
    v61 = (id)objc_msgSend(v103, "currentDownload");
    v92 = 0;
    v90 = 0;
    v88 = 0;
    if (v61)
    {
      v93 = (id)objc_msgSend(v103, "currentDownload");
      v54 = 1;
      v92 = 1;
      v91 = (id)objc_msgSend(v93, "descriptor");
      v90 = 1;
      v89 = (id)objc_msgSend(v91, "humanReadableUpdateName");
      v88 = 1;
      v55 = (const __CFString *)v89;
    }
    else
    {
      v55 = CFSTR("(null)");
    }
    v40 = v55;
    v41 = (id)objc_msgSend(v103, "currentDownload");
    v5 = objc_msgSend(v103, "performThirdPartyScan");
    v47 = "NO";
    v6 = "YES";
    v48 = "YES";
    v52 = 1;
    if ((v5 & 1) == 0)
      v6 = "NO";
    v42 = v6;
    v7 = objc_msgSend(v103, "isTargetedUpdateScheduledForAutoInstall");
    v8 = (uint64_t)v48;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v47;
    v43 = v8;
    v9 = objc_msgSend(v103, "hidingPreferredDescriptor");
    v10 = (uint64_t)v48;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v47;
    v44 = v10;
    v45 = (id)objc_msgSend(*((id *)v103 + 32), "humanReadableUpdateName");
    v46 = v45;
    v87 = v46;
    v11 = objc_msgSend(v103, "hidingAlternateDescriptor");
    v12 = (uint64_t)v48;
    if ((v11 & 1) == 0)
      v12 = (uint64_t)v47;
    v49 = v12;
    v50 = (id)objc_msgSend(*((id *)v103 + 33), "humanReadableUpdateName");
    v51 = v50;
    v86 = v51;
    v53 = (id)objc_msgSend(v103, "enrolledBetaProgram");
    v84 = 0;
    if (v53)
    {
      v85 = (id)objc_msgSend(v103, "enrolledBetaProgram");
      v84 = 1;
      v39 = objc_msgSend(v85, "programID");
    }
    else
    {
      v39 = 0;
    }
    v27 = v39;
    v38 = (id)objc_msgSend(v103, "betaPrograms");
    v28 = objc_msgSend(v38, "count");
    v37 = (id)objc_msgSend(v103, "currentFullScanOperation");
    v36 = (id)objc_msgSend(v103, "currentRefreshScanOperation");
    v35 = (id)objc_msgSend(v103, "currentUpdateOperation");
    v34 = (id)objc_msgSend(v103, "auxiliaryOperations");
    v29 = objc_msgSend(v34, "count");
    v33 = (id)objc_msgSend(v101, "descriptor");
    v32 = (id)objc_msgSend(v33, "humanReadableUpdateName");
    v83 = v32;
    v30 = &v13;
    buf = v105;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0((uint64_t)v105, (uint64_t)v71, (uint64_t)v67, v68, (uint64_t)v56, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v40, (uint64_t)v41, (uint64_t)v42, v43, v44, (uint64_t)v46, v49, (uint64_t)v51, v39, v28,
      (uint64_t)v37,
      (uint64_t)v36,
      (uint64_t)v35,
      v29,
      (uint64_t)v83,
      (uint64_t)v101);
    _os_log_impl(&dword_21BF33000, log, v65[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Starting to download an update targeting \"%{public}@\" (%p)",
      buf,
      0xF2u);

    if ((v84 & 1) != 0)
    if ((v88 & 1) != 0)

    if ((v90 & 1) != 0)
    if ((v92 & 1) != 0)

    if ((v94 & 1) != 0)
    if ((v96 & 1) != 0)

    v26 = 0;
    objc_storeStrong(&v83, 0);
    objc_storeStrong(&v86, v26);
    objc_storeStrong(&v87, v26);
    objc_storeStrong(&v98, v26);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (*((_QWORD *)v103 + 25))
  {
    v82 = 1;
  }
  else
  {
    v81 = (id)objc_msgSend(v103, "targetedUpdateForDownload:", v101);
    if (v81)
    {
      v17 = v103;
      v15 = v101;
      v16 = &v73;
      v73 = MEMORY[0x24BDAC760];
      v74 = -1073741824;
      v75 = 0;
      v76 = __55__SUSettingsStatefulUIManager_client_downloadDidStart___block_invoke;
      v77 = &unk_24DFF7F40;
      v20 = (id *)v78;
      v78[0] = v103;
      v19 = (id *)(v16 + 5);
      v78[1] = v81;
      v18 = (id *)(v16 + 6);
      v78[2] = v101;
      v21 = 0;
      objc_msgSend(v17, "updateStatePostDownloadOperation:withDownload:error:completionHandler:", 1, v15);
      objc_storeStrong(v18, v21);
      objc_storeStrong(v19, v21);
      objc_storeStrong(v20, v21);
      v82 = 0;
    }
    else
    {
      v25 = (id)objc_msgSend(v103, "log");
      v80 = (os_log_t)(id)objc_msgSend(v25, "oslog");

      v79 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        v22 = v80;
        *(_DWORD *)v23 = v79;
        v24 = v104;
        __os_log_helper_16_2_1_8_32((uint64_t)v104, (uint64_t)v71);
        _os_log_error_impl(&dword_21BF33000, v22, v23[0], "%s: Could not resolve the targeted update from the current download. Skipping on the downloadDidStart event and performing a new scan instead.", v24, 0xCu);
      }
      objc_storeStrong((id *)&v80, 0);
      objc_msgSend(v103, "checkForUpdatesInBackground");
      v82 = 1;
    }
    objc_storeStrong(&v81, 0);
  }
  v14 = 0;
  objc_storeStrong(&v101, 0);
  objc_storeStrong(location, v14);
}

void __55__SUSettingsStatefulUIManager_client_downloadDidStart___block_invoke(id *a1, char a2)
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11[2];
  char v12;
  id *v13;

  v13 = a1;
  v12 = a2 & 1;
  v11[1] = a1;
  v3 = a1[4];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __55__SUSettingsStatefulUIManager_client_downloadDidStart___block_invoke_2;
  v8 = &unk_24DFF7C20;
  v9 = a1[4];
  v10 = a1[5];
  v11[0] = a1[6];
  objc_msgSend(v3, "executeOperationOnDelegate:usingBlock:", sel_statefulUIManager_didStartDownloadForDescriptor_withDownload_);
  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
}

void __55__SUSettingsStatefulUIManager_client_downloadDidStart___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManager:didStartDownloadForDescriptor:withDownload:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)client:(id)a3 downloadProgressDidChange:(id)a4
{
  float v4;
  uint64_t v5;
  SUSettingsStatefulUIManager *v6;
  SUCoreLog *v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *log;
  os_log_type_t type;
  id v13;
  id v14;
  SUCoreLog *v15;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(uint64_t);
  void *v21;
  SUSettingsStatefulUIManager *v22;
  id v23;
  id v24;
  os_log_type_t v25;
  id v26;
  id v27;
  id v28;
  os_log_type_t v29;
  id v30;
  id v31;
  float v32;
  id v33;
  int v34;
  id v35;
  id location[2];
  SUSettingsStatefulUIManager *v37;
  uint8_t v38[16];
  uint8_t v39[72];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = 0;
  objc_storeStrong(&v35, a4);
  if (-[SUSettingsStatefulUIManager currentState](v37, "currentState") == 4)
  {
    v33 = (id)objc_msgSend(v35, "progress");
    objc_msgSend(v33, "normalizedPercentComplete");
    v32 = v4;
    v31 = (id)objc_msgSend(v33, "phase");
    v15 = -[SUSettingsStatefulUIManager log](v37, "log");
    v30 = (id)-[SUCoreLog oslog](v15, "oslog");

    v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_DEFAULT))
    {
      log = v30;
      type = v29;
      v14 = (id)objc_msgSend(v35, "descriptor");
      v13 = (id)objc_msgSend(v14, "humanReadableUpdateName");
      v8 = v13;
      v28 = v8;
      *(double *)&v9 = v32;
      v10 = v31;
      objc_msgSend(v33, "timeRemaining");
      __os_log_helper_16_2_6_8_32_8_66_8_0_8_66_8_0_8_0((uint64_t)v39, (uint64_t)"-[SUSettingsStatefulUIManager client:downloadProgressDidChange:]", (uint64_t)v8, v9, (uint64_t)v10, v5, (uint64_t)v35);
      _os_log_impl(&dword_21BF33000, log, type, "%s [->\"%{public}@\"]: progress: %.02f; phase: %{public}@; time remaining: %f, download: %p",
        v39,
        0x3Eu);

      objc_storeStrong(&v28, 0);
    }
    objc_storeStrong(&v30, 0);
    -[SUSettingsStatefulUIManager setCurrentDownload:](v37, "setCurrentDownload:", v35);
    v27 = -[SUSettingsStatefulUIManager targetedUpdateForDownload:](v37, "targetedUpdateForDownload:", v35);
    if (v27)
    {
      objc_msgSend(v27, "updateStateFromProgressedDownload:", v35);
      v6 = v37;
      v17 = MEMORY[0x24BDAC760];
      v18 = -1073741824;
      v19 = 0;
      v20 = __64__SUSettingsStatefulUIManager_client_downloadProgressDidChange___block_invoke;
      v21 = &unk_24DFF7C20;
      v22 = v37;
      v23 = v27;
      v24 = v35;
      -[SUSettingsStatefulUIManager executeOperationOnDelegate:usingBlock:](v6, "executeOperationOnDelegate:usingBlock:", sel_statefulUIManager_didChangeProgressForDownloadOfDescriptor_withDownload_, &v17);
      objc_storeStrong(&v24, 0);
      objc_storeStrong(&v23, 0);
      objc_storeStrong((id *)&v22, 0);
      v34 = 0;
    }
    else
    {
      v7 = -[SUSettingsStatefulUIManager log](v37, "log");
      v26 = (id)-[SUCoreLog oslog](v7, "oslog");

      v25 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v38, (uint64_t)"-[SUSettingsStatefulUIManager client:downloadProgressDidChange:]");
        _os_log_error_impl(&dword_21BF33000, (os_log_t)v26, v25, "%s: Could not resolve the targeted update from the current download. Skipping on the downloadProgressDidChange event and performing a new scan instead.", v38, 0xCu);
      }
      objc_storeStrong(&v26, 0);
      -[SUSettingsStatefulUIManager checkForAvailableUpdates](v37, "checkForAvailableUpdates");
      v34 = 1;
    }
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v33, 0);
  }
  else
  {
    v34 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

void __64__SUSettingsStatefulUIManager_client_downloadProgressDidChange___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManager:didChangeProgressForDownloadOfDescriptor:withDownload:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)client:(id)a3 downloadDidFinish:(id)a4 withInstallPolicy:(id)a5
{
  objc_class *v5;
  char v6;
  const char *v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t *v17;
  id v18;
  id *v19;
  id *v20;
  id *v21;
  id v22;
  os_log_t v23;
  os_log_type_t v24[4];
  uint8_t *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint8_t *buf;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  const __CFString *v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  id v51;
  id v52;
  int v53;
  id v54;
  int v55;
  const __CFString *v56;
  const __CFString *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  int v63;
  const __CFString *v64;
  os_log_t log;
  os_log_type_t v66[4];
  id v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  const char *v72;
  id obj;
  id v74;
  uint64_t v75;
  int v76;
  int v77;
  void (*v78)(id *, char);
  void *v79;
  _QWORD v80[3];
  os_log_type_t v81;
  os_log_t v82;
  id v83;
  int v84;
  id v85;
  char v86;
  id v87;
  id v88;
  id v89;
  char v90;
  id v91;
  char v92;
  id v93;
  char v94;
  id v95;
  char v96;
  id v97;
  char v98;
  id v99;
  id v100;
  os_log_type_t type;
  os_log_t oslog;
  id v103;
  id v104;
  id location[2];
  id v106;
  _BYTE v107[16];
  _BYTE v108[248];
  uint64_t v109;

  obj = a4;
  v74 = a5;
  v72 = "-[SUSettingsStatefulUIManager client:downloadDidFinish:withInstallPolicy:]";
  v109 = *MEMORY[0x24BDAC8D0];
  v106 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v104 = 0;
  objc_storeStrong(&v104, obj);
  v103 = 0;
  objc_storeStrong(&v103, v74);
  v71 = (id)objc_msgSend(v106, "log");
  oslog = (os_log_t)(id)objc_msgSend(v71, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v66 = type;
    v67 = SUSettingsUIStateToString(objc_msgSend(v106, "currentState"));
    v68 = v67;
    v100 = v68;
    v69 = objc_msgSend(v106, "currentState");
    v70 = (id)objc_msgSend(v106, "delegate");
    v98 = 0;
    v96 = 0;
    if (v70)
    {
      v99 = (id)objc_msgSend(v106, "delegate");
      v63 = 1;
      v98 = 1;
      v5 = (objc_class *)objc_opt_class();
      v97 = NSStringFromClass(v5);
      v96 = 1;
      v64 = (const __CFString *)v97;
    }
    else
    {
      v64 = CFSTR("(null)");
    }
    v57 = v64;
    v58 = (id)objc_msgSend(v106, "delegate");
    v59 = (id)objc_msgSend(v106, "scanError");
    v60 = (id)objc_msgSend(v106, "preferredStatefulDescriptor");
    v61 = (id)objc_msgSend(v106, "alternateStatefulDescriptor");
    v62 = (id)objc_msgSend(v106, "currentDownload");
    v94 = 0;
    v92 = 0;
    v90 = 0;
    if (v62)
    {
      v95 = (id)objc_msgSend(v106, "currentDownload");
      v55 = 1;
      v94 = 1;
      v93 = (id)objc_msgSend(v95, "descriptor");
      v92 = 1;
      v91 = (id)objc_msgSend(v93, "humanReadableUpdateName");
      v90 = 1;
      v56 = (const __CFString *)v91;
    }
    else
    {
      v56 = CFSTR("(null)");
    }
    v41 = v56;
    v42 = (id)objc_msgSend(v106, "currentDownload");
    v6 = objc_msgSend(v106, "performThirdPartyScan");
    v48 = "NO";
    v7 = "YES";
    v49 = "YES";
    v53 = 1;
    if ((v6 & 1) == 0)
      v7 = "NO";
    v43 = v7;
    v8 = objc_msgSend(v106, "isTargetedUpdateScheduledForAutoInstall");
    v9 = (uint64_t)v49;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v48;
    v44 = v9;
    v10 = objc_msgSend(v106, "hidingPreferredDescriptor");
    v11 = (uint64_t)v49;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v48;
    v45 = v11;
    v46 = (id)objc_msgSend(*((id *)v106 + 32), "humanReadableUpdateName");
    v47 = v46;
    v89 = v47;
    v12 = objc_msgSend(v106, "hidingAlternateDescriptor");
    v13 = (uint64_t)v49;
    if ((v12 & 1) == 0)
      v13 = (uint64_t)v48;
    v50 = v13;
    v51 = (id)objc_msgSend(*((id *)v106 + 33), "humanReadableUpdateName");
    v52 = v51;
    v88 = v52;
    v54 = (id)objc_msgSend(v106, "enrolledBetaProgram");
    v86 = 0;
    if (v54)
    {
      v87 = (id)objc_msgSend(v106, "enrolledBetaProgram");
      v86 = 1;
      v40 = objc_msgSend(v87, "programID");
    }
    else
    {
      v40 = 0;
    }
    v28 = v40;
    v39 = (id)objc_msgSend(v106, "betaPrograms");
    v29 = objc_msgSend(v39, "count");
    v38 = (id)objc_msgSend(v106, "currentFullScanOperation");
    v37 = (id)objc_msgSend(v106, "currentRefreshScanOperation");
    v36 = (id)objc_msgSend(v106, "currentUpdateOperation");
    v35 = (id)objc_msgSend(v106, "auxiliaryOperations");
    v30 = objc_msgSend(v35, "count");
    v34 = (id)objc_msgSend(v104, "descriptor");
    v33 = (id)objc_msgSend(v34, "humanReadableUpdateName");
    v85 = v33;
    v31 = &v14;
    buf = v108;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0((uint64_t)v108, (uint64_t)v72, (uint64_t)v68, v69, (uint64_t)v57, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61, (uint64_t)v41, (uint64_t)v42, (uint64_t)v43, v44, v45, (uint64_t)v47, v50, (uint64_t)v52, v40, v29,
      (uint64_t)v38,
      (uint64_t)v37,
      (uint64_t)v36,
      v30,
      (uint64_t)v85,
      (uint64_t)v104);
    _os_log_impl(&dword_21BF33000, log, v66[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to download an update targeting \"%{public}@\": (%p)",
      buf,
      0xF2u);

    if ((v86 & 1) != 0)
    if ((v90 & 1) != 0)

    if ((v92 & 1) != 0)
    if ((v94 & 1) != 0)

    if ((v96 & 1) != 0)
    if ((v98 & 1) != 0)

    v27 = 0;
    objc_storeStrong(&v85, 0);
    objc_storeStrong(&v88, v27);
    objc_storeStrong(&v89, v27);
    objc_storeStrong(&v100, v27);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (*((_QWORD *)v106 + 25))
  {
    v84 = 1;
  }
  else
  {
    v83 = (id)objc_msgSend(v106, "targetedUpdateForDownload:", v104);
    if (v83)
    {
      v18 = v106;
      v16 = v104;
      v17 = &v75;
      v75 = MEMORY[0x24BDAC760];
      v76 = -1073741824;
      v77 = 0;
      v78 = __74__SUSettingsStatefulUIManager_client_downloadDidFinish_withInstallPolicy___block_invoke;
      v79 = &unk_24DFF7F40;
      v21 = (id *)v80;
      v80[0] = v106;
      v20 = (id *)(v17 + 5);
      v80[1] = v83;
      v19 = (id *)(v17 + 6);
      v80[2] = v104;
      v22 = 0;
      objc_msgSend(v18, "updateStatePostDownloadOperation:withDownload:error:completionHandler:", 1, v16);
      objc_storeStrong(v19, v22);
      objc_storeStrong(v20, v22);
      objc_storeStrong(v21, v22);
      v84 = 0;
    }
    else
    {
      v26 = (id)objc_msgSend(v106, "log");
      v82 = (os_log_t)(id)objc_msgSend(v26, "oslog");

      v81 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      {
        v23 = v82;
        *(_DWORD *)v24 = v81;
        v25 = v107;
        __os_log_helper_16_2_1_8_32((uint64_t)v107, (uint64_t)v72);
        _os_log_error_impl(&dword_21BF33000, v23, v24[0], "%s: Could not resolve the targeted update from the current download. Skipping on the downloadDidStart event and performing a new scan instead.", v25, 0xCu);
      }
      objc_storeStrong((id *)&v82, 0);
      objc_msgSend(v106, "checkForAvailableUpdates");
      v84 = 1;
    }
    objc_storeStrong(&v83, 0);
  }
  v15 = 0;
  objc_storeStrong(&v103, 0);
  objc_storeStrong(&v104, v15);
  objc_storeStrong(location, v15);
}

void __74__SUSettingsStatefulUIManager_client_downloadDidFinish_withInstallPolicy___block_invoke(id *a1, char a2)
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11[2];
  char v12;
  id *v13;

  v13 = a1;
  v12 = a2 & 1;
  v11[1] = a1;
  v3 = a1[4];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __74__SUSettingsStatefulUIManager_client_downloadDidFinish_withInstallPolicy___block_invoke_2;
  v8 = &unk_24DFF7C20;
  v9 = a1[4];
  v10 = a1[5];
  v11[0] = a1[6];
  objc_msgSend(v3, "executeOperationOnDelegate:usingBlock:", sel_statefulUIManager_didFinishDownloadForDescriptor_withDownload_);
  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
}

void __74__SUSettingsStatefulUIManager_client_downloadDidFinish_withInstallPolicy___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManager:didFinishDownloadForDescriptor:withDownload:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)client:(id)a3 downloadWasInvalidatedForNewUpdatesAvailable:(id)a4
{
  objc_class *v4;
  char v5;
  const char *v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  id *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint8_t *buf;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  const __CFString *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  id v41;
  id v42;
  int v43;
  id v44;
  int v45;
  const __CFString *v46;
  const __CFString *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  int v53;
  const __CFString *v54;
  os_log_t log;
  os_log_type_t v56[4];
  id v57;
  id v58;
  uint64_t v59;
  id v60;
  id v61;
  const char *v62;
  id *v63;
  id obj;
  char v65;
  id v66;
  id v67;
  id v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  char v75;
  id v76;
  char v77;
  id v78;
  id v79;
  os_log_type_t type;
  os_log_t oslog;
  id v82;
  id location[2];
  SUSettingsStatefulUIManager *v84;
  _BYTE v85[232];
  uint64_t v86;

  v63 = &v82;
  obj = a4;
  v62 = "-[SUSettingsStatefulUIManager client:downloadWasInvalidatedForNewUpdatesAvailable:]";
  v86 = *MEMORY[0x24BDAC8D0];
  v84 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v82 = 0;
  objc_storeStrong(&v82, obj);
  v61 = -[SUSettingsStatefulUIManager log](v84, "log");
  oslog = (os_log_t)(id)objc_msgSend(v61, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v56 = type;
    v57 = SUSettingsUIStateToString(objc_msgSend(v63[3], "currentState"));
    v58 = v57;
    v79 = v58;
    v59 = objc_msgSend(v63[3], "currentState");
    v60 = (id)objc_msgSend(v63[3], "delegate");
    v77 = 0;
    v75 = 0;
    if (v60)
    {
      v78 = (id)objc_msgSend(v63[3], "delegate");
      v53 = 1;
      v77 = 1;
      v4 = (objc_class *)objc_opt_class();
      v76 = NSStringFromClass(v4);
      v75 = 1;
      v54 = (const __CFString *)v76;
    }
    else
    {
      v54 = CFSTR("(null)");
    }
    v47 = v54;
    v48 = (id)objc_msgSend(v63[3], "delegate");
    v49 = (id)objc_msgSend(v63[3], "scanError");
    v50 = (id)objc_msgSend(v63[3], "preferredStatefulDescriptor");
    v51 = (id)objc_msgSend(v63[3], "alternateStatefulDescriptor");
    v52 = (id)objc_msgSend(v63[3], "currentDownload");
    v73 = 0;
    v71 = 0;
    v69 = 0;
    if (v52)
    {
      v74 = (id)objc_msgSend(v63[3], "currentDownload");
      v45 = 1;
      v73 = 1;
      v72 = (id)objc_msgSend(v74, "descriptor");
      v71 = 1;
      v70 = (id)objc_msgSend(v72, "humanReadableUpdateName");
      v69 = 1;
      v46 = (const __CFString *)v70;
    }
    else
    {
      v46 = CFSTR("(null)");
    }
    v31 = v46;
    v32 = (id)objc_msgSend(v63[3], "currentDownload");
    v5 = objc_msgSend(v63[3], "performThirdPartyScan");
    v38 = "NO";
    v6 = "YES";
    v39 = "YES";
    v43 = 1;
    if ((v5 & 1) == 0)
      v6 = "NO";
    v33 = v6;
    v7 = objc_msgSend(v63[3], "isTargetedUpdateScheduledForAutoInstall");
    v8 = (uint64_t)v39;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v38;
    v34 = v8;
    v9 = objc_msgSend(v63[3], "hidingPreferredDescriptor");
    v10 = (uint64_t)v39;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v38;
    v35 = v10;
    v36 = (id)objc_msgSend(*((id *)v63[3] + 32), "humanReadableUpdateName");
    v37 = v36;
    v68 = v37;
    v11 = objc_msgSend(v63[3], "hidingAlternateDescriptor");
    v12 = (uint64_t)v39;
    if ((v11 & 1) == 0)
      v12 = (uint64_t)v38;
    v40 = v12;
    v41 = (id)objc_msgSend(*((id *)v63[3] + 33), "humanReadableUpdateName");
    v42 = v41;
    v67 = v42;
    v44 = (id)objc_msgSend(v63[3], "enrolledBetaProgram");
    v65 = 0;
    if (v44)
    {
      v66 = (id)objc_msgSend(v63[3], "enrolledBetaProgram");
      v65 = 1;
      v30 = objc_msgSend(v66, "programID");
    }
    else
    {
      v30 = 0;
    }
    v21 = v30;
    v29 = (id)objc_msgSend(v63[3], "betaPrograms");
    v22 = objc_msgSend(v29, "count");
    v28 = (id)objc_msgSend(v63[3], "currentFullScanOperation");
    v27 = (id)objc_msgSend(v63[3], "currentRefreshScanOperation");
    v26 = (id)objc_msgSend(v63[3], "currentUpdateOperation");
    v25 = (id)objc_msgSend(v63[3], "auxiliaryOperations");
    v13 = objc_msgSend(v25, "count");
    v14 = (uint64_t)*v63;
    v23 = &v17;
    buf = v85;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v85, (uint64_t)v62, (uint64_t)v58, v59, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v31, (uint64_t)v32, (uint64_t)v33, v34, v35, (uint64_t)v37, v40, (uint64_t)v42, v30, v22,
      (uint64_t)v28,
      (uint64_t)v27,
      (uint64_t)v26,
      v13,
      v14);
    _os_log_impl(&dword_21BF33000, log, v56[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Download was invalidated for new updates available: %{public}@",
      buf,
      0xE8u);

    if ((v65 & 1) != 0)
    if ((v69 & 1) != 0)

    if ((v71 & 1) != 0)
    if ((v73 & 1) != 0)

    if ((v75 & 1) != 0)
    if ((v77 & 1) != 0)

    v20 = 0;
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v68, v20);
    objc_storeStrong(&v79, v20);
  }
  objc_storeStrong((id *)&oslog, 0);
  v15 = v63[3];
  v18 = &v82;
  v16 = *v63;
  v19 = 0;
  objc_msgSend(v15, "performFullScanWithScanResults:andScanError:", v16);
  objc_storeStrong(v18, v19);
  objc_storeStrong(location, v19);
}

- (void)client:(id)a3 downloadDidFail:(id)a4 withError:(id)a5
{
  objc_class *v5;
  char v6;
  const char *v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  id v17;
  char *v18;
  id *v19;
  id v20;
  id *v21;
  id *v22;
  id *v23;
  id *v24;
  id v25;
  int v26;
  int v27;
  id v28;
  id v29;
  int v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint8_t *buf;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  const __CFString *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  id v55;
  id v56;
  int v57;
  id v58;
  int v59;
  const __CFString *v60;
  const __CFString *v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  int v67;
  const __CFString *v68;
  os_log_t log;
  os_log_type_t v70[4];
  id v71;
  id v72;
  uint64_t v73;
  id v74;
  id v75;
  const char *v76;
  id obj;
  id v78;
  uint64_t v79;
  int v80;
  int v81;
  void (*v82)(uint64_t);
  void *v83;
  _QWORD v84[4];
  int v85;
  char v86;
  id v87;
  char v88;
  id v89;
  id v90;
  id v91;
  char v92;
  id v93;
  id v94;
  id v95;
  char v96;
  id v97;
  char v98;
  id v99;
  char v100;
  id v101;
  char v102;
  id v103;
  char v104;
  id v105;
  id v106;
  os_log_type_t type;
  os_log_t oslog;
  id v109;
  id v110;
  id location[2];
  id v112;
  _BYTE v113[264];
  uint64_t v114;

  obj = a4;
  v78 = a5;
  v76 = "-[SUSettingsStatefulUIManager client:downloadDidFail:withError:]";
  v114 = *MEMORY[0x24BDAC8D0];
  v112 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v110 = 0;
  objc_storeStrong(&v110, obj);
  v109 = 0;
  objc_storeStrong(&v109, v78);
  v75 = (id)objc_msgSend(v112, "log");
  oslog = (os_log_t)(id)objc_msgSend(v75, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v70 = type;
    v71 = SUSettingsUIStateToString(objc_msgSend(v112, "currentState"));
    v72 = v71;
    v106 = v72;
    v73 = objc_msgSend(v112, "currentState");
    v74 = (id)objc_msgSend(v112, "delegate");
    v104 = 0;
    v102 = 0;
    if (v74)
    {
      v105 = (id)objc_msgSend(v112, "delegate");
      v67 = 1;
      v104 = 1;
      v5 = (objc_class *)objc_opt_class();
      v103 = NSStringFromClass(v5);
      v102 = 1;
      v68 = (const __CFString *)v103;
    }
    else
    {
      v68 = CFSTR("(null)");
    }
    v61 = v68;
    v62 = (id)objc_msgSend(v112, "delegate");
    v63 = (id)objc_msgSend(v112, "scanError");
    v64 = (id)objc_msgSend(v112, "preferredStatefulDescriptor");
    v65 = (id)objc_msgSend(v112, "alternateStatefulDescriptor");
    v66 = (id)objc_msgSend(v112, "currentDownload");
    v100 = 0;
    v98 = 0;
    v96 = 0;
    if (v66)
    {
      v101 = (id)objc_msgSend(v112, "currentDownload");
      v59 = 1;
      v100 = 1;
      v99 = (id)objc_msgSend(v101, "descriptor");
      v98 = 1;
      v97 = (id)objc_msgSend(v99, "humanReadableUpdateName");
      v96 = 1;
      v60 = (const __CFString *)v97;
    }
    else
    {
      v60 = CFSTR("(null)");
    }
    v45 = v60;
    v46 = (id)objc_msgSend(v112, "currentDownload");
    v6 = objc_msgSend(v112, "performThirdPartyScan");
    v52 = "NO";
    v7 = "YES";
    v53 = "YES";
    v57 = 1;
    if ((v6 & 1) == 0)
      v7 = "NO";
    v47 = v7;
    v8 = objc_msgSend(v112, "isTargetedUpdateScheduledForAutoInstall");
    v9 = (uint64_t)v53;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v52;
    v48 = v9;
    v10 = objc_msgSend(v112, "hidingPreferredDescriptor");
    v11 = (uint64_t)v53;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v52;
    v49 = v11;
    v50 = (id)objc_msgSend(*((id *)v112 + 32), "humanReadableUpdateName");
    v51 = v50;
    v95 = v51;
    v12 = objc_msgSend(v112, "hidingAlternateDescriptor");
    v13 = (uint64_t)v53;
    if ((v12 & 1) == 0)
      v13 = (uint64_t)v52;
    v54 = v13;
    v55 = (id)objc_msgSend(*((id *)v112 + 33), "humanReadableUpdateName");
    v56 = v55;
    v94 = v56;
    v58 = (id)objc_msgSend(v112, "enrolledBetaProgram");
    v92 = 0;
    if (v58)
    {
      v93 = (id)objc_msgSend(v112, "enrolledBetaProgram");
      v92 = 1;
      v44 = objc_msgSend(v93, "programID");
    }
    else
    {
      v44 = 0;
    }
    v32 = v44;
    v43 = (id)objc_msgSend(v112, "betaPrograms");
    v33 = objc_msgSend(v43, "count");
    v42 = (id)objc_msgSend(v112, "currentFullScanOperation");
    v41 = (id)objc_msgSend(v112, "currentRefreshScanOperation");
    v40 = (id)objc_msgSend(v112, "currentUpdateOperation");
    v39 = (id)objc_msgSend(v112, "auxiliaryOperations");
    v34 = objc_msgSend(v39, "count");
    v38 = (id)objc_msgSend(v110, "descriptor");
    v37 = (id)objc_msgSend(v38, "humanReadableUpdateName");
    v91 = v37;
    v35 = &v16;
    buf = v113;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_66((uint64_t)v113, (uint64_t)v76, (uint64_t)v72, v73, (uint64_t)v61, (uint64_t)v62, (uint64_t)v63, (uint64_t)v64, (uint64_t)v65, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, v48, v49, (uint64_t)v51, v54, (uint64_t)v56, v44, v33,
      (uint64_t)v42,
      (uint64_t)v41,
      (uint64_t)v40,
      v34,
      (uint64_t)v91,
      (uint64_t)v110,
      (uint64_t)v109);
    _os_log_impl(&dword_21BF33000, log, v70[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Download of update %{public}@ (%p) failed: %{public}@",
      buf,
      0xFCu);

    if ((v92 & 1) != 0)
    if ((v96 & 1) != 0)

    if ((v98 & 1) != 0)
    if ((v100 & 1) != 0)

    if ((v102 & 1) != 0)
    if ((v104 & 1) != 0)

    v31 = 0;
    objc_storeStrong(&v91, 0);
    objc_storeStrong(&v94, v31);
    objc_storeStrong(&v95, v31);
    objc_storeStrong(&v106, v31);
  }
  objc_storeStrong((id *)&oslog, 0);
  v90 = (id)objc_msgSend(v112, "targetedUpdateForDownload:", v110);
  v28 = (id)objc_msgSend(v109, "domain");
  v29 = getSUErrorDomain();
  v14 = objc_msgSend(v28, "isEqualToString:");
  v88 = 0;
  v86 = 0;
  v30 = 0;
  if ((v14 & 1) != 0)
  {
    v15 = objc_msgSend(v109, "code") != 16;
    v30 = 0;
    if (!v15)
    {
      v89 = (id)objc_msgSend(v109, "userInfo");
      v27 = 1;
      v88 = 1;
      v87 = (id)objc_msgSend(v89, "objectForKey:", *MEMORY[0x24BEAEEF0]);
      v86 = v27 & 1;
      v30 = objc_msgSend(v87, "BOOLValue");
    }
  }
  v26 = v30;
  if ((v86 & 1) != 0)

  if ((v88 & 1) != 0)
  if ((v26 & 1) != 0 && v90)
  {
    objc_msgSend(v90, "updateStateFromProgressedDownload:", 0);
    v85 = 1;
  }
  else
  {
    objc_msgSend(*((id *)v112 + 28), "destroyInstallationKeybag");
    objc_msgSend(v112, "checkForUpdatesInBackground");
    v20 = v112;
    v18 = sel_statefulUIManager_didFailToDownloadUpdateForDescriptor_withError_download_;
    v19 = (id *)&v79;
    v79 = MEMORY[0x24BDAC760];
    v80 = -1073741824;
    v81 = 0;
    v82 = __64__SUSettingsStatefulUIManager_client_downloadDidFail_withError___block_invoke;
    v83 = &unk_24DFF7F68;
    v24 = (id *)v84;
    v84[0] = v112;
    v23 = v19 + 5;
    v84[1] = v90;
    v22 = v19 + 6;
    v84[2] = v109;
    v21 = v19 + 7;
    v84[3] = v110;
    objc_msgSend(v20, "executeOperationOnDelegate:usingBlock:", v18, v19);
    v25 = 0;
    objc_storeStrong(v21, 0);
    objc_storeStrong(v22, v25);
    objc_storeStrong(v23, v25);
    objc_storeStrong(v24, v25);
    v85 = 0;
  }
  v17 = 0;
  objc_storeStrong(&v90, 0);
  objc_storeStrong(&v109, v17);
  objc_storeStrong(&v110, v17);
  objc_storeStrong(location, v17);
}

void __64__SUSettingsStatefulUIManager_client_downloadDidFail_withError___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManager:didFailToDownloadUpdateForDescriptor:withError:download:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)client:(id)a3 clearingSpaceForDownload:(id)a4 clearingSpace:(BOOL)a5
{
  objc_class *v5;
  char v6;
  const char *v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  id v19;
  id *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint8_t *buf;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  id v46;
  id v47;
  int v48;
  id v49;
  int v50;
  const __CFString *v51;
  const __CFString *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  int v58;
  const __CFString *v59;
  os_log_t log;
  os_log_type_t v61[4];
  id v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  const char *v67;
  id obj;
  _BOOL4 v69;
  uint64_t v70;
  int v71;
  int v72;
  void (*v73)(uint64_t);
  void *v74;
  id v75;
  id v76;
  char v77;
  id v78;
  id v79;
  id v80;
  char v81;
  id v82;
  char v83;
  id v84;
  char v85;
  id v86;
  char v87;
  id v88;
  char v89;
  id v90;
  id v91;
  os_log_type_t type;
  os_log_t oslog;
  BOOL v94;
  id v95;
  id location[2];
  id v97;
  _BYTE v98[264];
  uint64_t v99;

  obj = a4;
  v69 = a5;
  v67 = "-[SUSettingsStatefulUIManager client:clearingSpaceForDownload:clearingSpace:]";
  v99 = *MEMORY[0x24BDAC8D0];
  v97 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v95 = 0;
  objc_storeStrong(&v95, obj);
  v94 = v69;
  v66 = (id)objc_msgSend(v97, "log");
  oslog = (os_log_t)(id)objc_msgSend(v66, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v61 = type;
    v62 = SUSettingsUIStateToString(objc_msgSend(v97, "currentState"));
    v63 = v62;
    v91 = v63;
    v64 = objc_msgSend(v97, "currentState");
    v65 = (id)objc_msgSend(v97, "delegate");
    v89 = 0;
    v87 = 0;
    if (v65)
    {
      v90 = (id)objc_msgSend(v97, "delegate");
      v58 = 1;
      v89 = 1;
      v5 = (objc_class *)objc_opt_class();
      v88 = NSStringFromClass(v5);
      v87 = 1;
      v59 = (const __CFString *)v88;
    }
    else
    {
      v59 = CFSTR("(null)");
    }
    v52 = v59;
    v53 = (id)objc_msgSend(v97, "delegate");
    v54 = (id)objc_msgSend(v97, "scanError");
    v55 = (id)objc_msgSend(v97, "preferredStatefulDescriptor");
    v56 = (id)objc_msgSend(v97, "alternateStatefulDescriptor");
    v57 = (id)objc_msgSend(v97, "currentDownload");
    v85 = 0;
    v83 = 0;
    v81 = 0;
    if (v57)
    {
      v86 = (id)objc_msgSend(v97, "currentDownload");
      v50 = 1;
      v85 = 1;
      v84 = (id)objc_msgSend(v86, "descriptor");
      v83 = 1;
      v82 = (id)objc_msgSend(v84, "humanReadableUpdateName");
      v81 = 1;
      v51 = (const __CFString *)v82;
    }
    else
    {
      v51 = CFSTR("(null)");
    }
    v36 = v51;
    v37 = (id)objc_msgSend(v97, "currentDownload");
    v6 = objc_msgSend(v97, "performThirdPartyScan");
    v43 = "NO";
    v7 = "YES";
    v44 = "YES";
    v48 = 1;
    if ((v6 & 1) == 0)
      v7 = "NO";
    v38 = v7;
    v8 = objc_msgSend(v97, "isTargetedUpdateScheduledForAutoInstall");
    v9 = (uint64_t)v44;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v43;
    v39 = v9;
    v10 = objc_msgSend(v97, "hidingPreferredDescriptor");
    v11 = (uint64_t)v44;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v43;
    v40 = v11;
    v41 = (id)objc_msgSend(*((id *)v97 + 32), "humanReadableUpdateName");
    v42 = v41;
    v80 = v42;
    v12 = objc_msgSend(v97, "hidingAlternateDescriptor");
    v13 = (uint64_t)v44;
    if ((v12 & 1) == 0)
      v13 = (uint64_t)v43;
    v45 = v13;
    v46 = (id)objc_msgSend(*((id *)v97 + 33), "humanReadableUpdateName");
    v47 = v46;
    v79 = v47;
    v49 = (id)objc_msgSend(v97, "enrolledBetaProgram");
    v77 = 0;
    if (v49)
    {
      v78 = (id)objc_msgSend(v97, "enrolledBetaProgram");
      v77 = 1;
      v35 = objc_msgSend(v78, "programID");
    }
    else
    {
      v35 = 0;
    }
    v23 = v35;
    v34 = (id)objc_msgSend(v97, "betaPrograms");
    v24 = objc_msgSend(v34, "count");
    v33 = (id)objc_msgSend(v97, "currentFullScanOperation");
    v32 = (id)objc_msgSend(v97, "currentRefreshScanOperation");
    v31 = (id)objc_msgSend(v97, "currentUpdateOperation");
    v30 = (id)objc_msgSend(v97, "auxiliaryOperations");
    v25 = objc_msgSend(v30, "count");
    v29 = (id)objc_msgSend(v95, "descriptor");
    v28 = (id)objc_msgSend(v29, "humanReadableUpdateName");
    v14 = v28;
    v76 = v14;
    v15 = "YES";
    if (!v94)
      v15 = "NO";
    v26 = &v16;
    buf = v98;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_32((uint64_t)v98, (uint64_t)v67, (uint64_t)v63, v64, (uint64_t)v52, (uint64_t)v53, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, (uint64_t)v36, (uint64_t)v37, (uint64_t)v38, v39, v40, (uint64_t)v42, v45, (uint64_t)v47, v23, v24,
      (uint64_t)v33,
      (uint64_t)v32,
      (uint64_t)v31,
      v25,
      (uint64_t)v14,
      (uint64_t)v95,
      (uint64_t)v15);
    _os_log_impl(&dword_21BF33000, log, v61[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Clearing space for update %{public}@ (%p): %s",
      buf,
      0xFCu);

    if ((v77 & 1) != 0)
    if ((v81 & 1) != 0)

    if ((v83 & 1) != 0)
    if ((v85 & 1) != 0)

    if ((v87 & 1) != 0)
    if ((v89 & 1) != 0)

    v22 = 0;
    objc_storeStrong(&v76, 0);
    objc_storeStrong(&v79, v22);
    objc_storeStrong(&v80, v22);
    objc_storeStrong(&v91, v22);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_msgSend(v97, "setClearingSpaceForDownload:", 1);
  v19 = v97;
  v17 = sel_statefulUIManagerDidRefreshState_;
  v18 = &v70;
  v70 = MEMORY[0x24BDAC760];
  v71 = -1073741824;
  v72 = 0;
  v73 = __77__SUSettingsStatefulUIManager_client_clearingSpaceForDownload_clearingSpace___block_invoke;
  v74 = &unk_24DFF7B58;
  v20 = &v75;
  v75 = v97;
  objc_msgSend(v19, "executeOperationOnDelegate:usingBlock:", v17, v18);
  v21 = 0;
  objc_storeStrong(v20, 0);
  objc_storeStrong(&v95, v21);
  objc_storeStrong(location, v21);
}

void __77__SUSettingsStatefulUIManager_client_clearingSpaceForDownload_clearingSpace___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManagerDidRefreshState:", *(_QWORD *)(a1 + 32));

}

- (void)client:(id)a3 installDidStart:(id)a4
{
  objc_class *v4;
  char v5;
  const char *v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  char *v15;
  uint64_t *v16;
  id v17;
  id *v18;
  id *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint8_t *buf;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  const __CFString *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  id v44;
  id v45;
  int v46;
  id v47;
  int v48;
  const __CFString *v49;
  const __CFString *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  int v56;
  const __CFString *v57;
  os_log_t log;
  os_log_type_t v59[4];
  id v60;
  id v61;
  uint64_t v62;
  id v63;
  id v64;
  const char *v65;
  id obj;
  uint64_t v67;
  int v68;
  int v69;
  void (*v70)(uint64_t);
  void *v71;
  _QWORD v72[2];
  id v73;
  int v74;
  id v75;
  char v76;
  id v77;
  id v78;
  id v79;
  char v80;
  id v81;
  char v82;
  id v83;
  char v84;
  id v85;
  char v86;
  id v87;
  char v88;
  id v89;
  id v90;
  os_log_type_t type;
  os_log_t oslog;
  id v93;
  id location[2];
  id v95;
  _BYTE v96[248];
  uint64_t v97;

  obj = a4;
  v65 = "-[SUSettingsStatefulUIManager client:installDidStart:]";
  v97 = *MEMORY[0x24BDAC8D0];
  v95 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v93 = 0;
  objc_storeStrong(&v93, obj);
  v64 = (id)objc_msgSend(v95, "log");
  oslog = (os_log_t)(id)objc_msgSend(v64, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v59 = type;
    v60 = SUSettingsUIStateToString(objc_msgSend(v95, "currentState"));
    v61 = v60;
    v90 = v61;
    v62 = objc_msgSend(v95, "currentState");
    v63 = (id)objc_msgSend(v95, "delegate");
    v88 = 0;
    v86 = 0;
    if (v63)
    {
      v89 = (id)objc_msgSend(v95, "delegate");
      v56 = 1;
      v88 = 1;
      v4 = (objc_class *)objc_opt_class();
      v87 = NSStringFromClass(v4);
      v86 = 1;
      v57 = (const __CFString *)v87;
    }
    else
    {
      v57 = CFSTR("(null)");
    }
    v50 = v57;
    v51 = (id)objc_msgSend(v95, "delegate");
    v52 = (id)objc_msgSend(v95, "scanError");
    v53 = (id)objc_msgSend(v95, "preferredStatefulDescriptor");
    v54 = (id)objc_msgSend(v95, "alternateStatefulDescriptor");
    v55 = (id)objc_msgSend(v95, "currentDownload");
    v84 = 0;
    v82 = 0;
    v80 = 0;
    if (v55)
    {
      v85 = (id)objc_msgSend(v95, "currentDownload");
      v48 = 1;
      v84 = 1;
      v83 = (id)objc_msgSend(v85, "descriptor");
      v82 = 1;
      v81 = (id)objc_msgSend(v83, "humanReadableUpdateName");
      v80 = 1;
      v49 = (const __CFString *)v81;
    }
    else
    {
      v49 = CFSTR("(null)");
    }
    v34 = v49;
    v35 = (id)objc_msgSend(v95, "currentDownload");
    v5 = objc_msgSend(v95, "performThirdPartyScan");
    v41 = "NO";
    v6 = "YES";
    v42 = "YES";
    v46 = 1;
    if ((v5 & 1) == 0)
      v6 = "NO";
    v36 = v6;
    v7 = objc_msgSend(v95, "isTargetedUpdateScheduledForAutoInstall");
    v8 = (uint64_t)v42;
    if ((v7 & 1) == 0)
      v8 = (uint64_t)v41;
    v37 = v8;
    v9 = objc_msgSend(v95, "hidingPreferredDescriptor");
    v10 = (uint64_t)v42;
    if ((v9 & 1) == 0)
      v10 = (uint64_t)v41;
    v38 = v10;
    v39 = (id)objc_msgSend(*((id *)v95 + 32), "humanReadableUpdateName");
    v40 = v39;
    v79 = v40;
    v11 = objc_msgSend(v95, "hidingAlternateDescriptor");
    v12 = (uint64_t)v42;
    if ((v11 & 1) == 0)
      v12 = (uint64_t)v41;
    v43 = v12;
    v44 = (id)objc_msgSend(*((id *)v95 + 33), "humanReadableUpdateName");
    v45 = v44;
    v78 = v45;
    v47 = (id)objc_msgSend(v95, "enrolledBetaProgram");
    v76 = 0;
    if (v47)
    {
      v77 = (id)objc_msgSend(v95, "enrolledBetaProgram");
      v76 = 1;
      v33 = objc_msgSend(v77, "programID");
    }
    else
    {
      v33 = 0;
    }
    v22 = v33;
    v32 = (id)objc_msgSend(v95, "betaPrograms");
    v23 = objc_msgSend(v32, "count");
    v31 = (id)objc_msgSend(v95, "currentFullScanOperation");
    v30 = (id)objc_msgSend(v95, "currentRefreshScanOperation");
    v29 = (id)objc_msgSend(v95, "currentUpdateOperation");
    v28 = (id)objc_msgSend(v95, "auxiliaryOperations");
    v24 = objc_msgSend(v28, "count");
    v27 = (id)objc_msgSend(v93, "humanReadableUpdateName");
    v75 = v27;
    v25 = &v13;
    buf = v96;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0((uint64_t)v96, (uint64_t)v65, (uint64_t)v61, v62, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, (uint64_t)v53, (uint64_t)v54, (uint64_t)v34, (uint64_t)v35, (uint64_t)v36, v37, v38, (uint64_t)v40, v43, (uint64_t)v45, v33, v23,
      (uint64_t)v31,
      (uint64_t)v30,
      (uint64_t)v29,
      v24,
      (uint64_t)v75,
      (uint64_t)v93);
    _os_log_impl(&dword_21BF33000, log, v59[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Starting to install an update targeting \"%{public}@\" (%p)",
      buf,
      0xF2u);

    if ((v76 & 1) != 0)
    if ((v80 & 1) != 0)

    if ((v82 & 1) != 0)
    if ((v84 & 1) != 0)

    if ((v86 & 1) != 0)
    if ((v88 & 1) != 0)

    v21 = 0;
    objc_storeStrong(&v75, 0);
    objc_storeStrong(&v78, v21);
    objc_storeStrong(&v79, v21);
    objc_storeStrong(&v90, v21);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (*((_QWORD *)v95 + 25))
  {
    v74 = 1;
  }
  else
  {
    v73 = (id)objc_msgSend(v95, "targetedUpdateMatchingDescriptor:", v93);
    if (v73)
    {
      v17 = v95;
      v15 = sel_statefulUIManager_didStartInstallingUpdateWithDescriptor_;
      v16 = &v67;
      v67 = MEMORY[0x24BDAC760];
      v68 = -1073741824;
      v69 = 0;
      v70 = __54__SUSettingsStatefulUIManager_client_installDidStart___block_invoke;
      v71 = &unk_24DFF7B80;
      v19 = (id *)v72;
      v72[0] = v95;
      v18 = (id *)(v16 + 5);
      v72[1] = v73;
      objc_msgSend(v17, "executeOperationOnDelegate:usingBlock:", v15, v16);
      v20 = 0;
      objc_storeStrong(v18, 0);
      objc_storeStrong(v19, v20);
      v74 = 0;
    }
    else
    {
      objc_msgSend(v95, "checkForAvailableUpdates");
      v74 = 1;
    }
    objc_storeStrong(&v73, 0);
  }
  v14 = 0;
  objc_storeStrong(&v93, 0);
  objc_storeStrong(location, v14);
}

void __54__SUSettingsStatefulUIManager_client_installDidStart___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManager:didStartInstallingUpdateWithDescriptor:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)client:(id)a3 installDidFail:(id)a4 withError:(id)a5
{
  objc_class *v5;
  char v6;
  const char *v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint8_t *buf;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  id v40;
  id v41;
  int v42;
  id v43;
  int v44;
  const __CFString *v45;
  const __CFString *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  int v52;
  const __CFString *v53;
  os_log_t log;
  os_log_type_t v55[4];
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  const char *v61;
  id obj;
  id *v63;
  id v64;
  char v65;
  id v66;
  id v67;
  id v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  char v75;
  id v76;
  char v77;
  id v78;
  id v79;
  os_log_type_t type;
  os_log_t oslog;
  id v82;
  id v83;
  id location[2];
  SUSettingsStatefulUIManager *v85;
  _BYTE v86[248];
  uint64_t v87;

  v63 = &v82;
  obj = a4;
  v64 = a5;
  v61 = "-[SUSettingsStatefulUIManager client:installDidFail:withError:]";
  v87 = *MEMORY[0x24BDAC8D0];
  v85 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v83 = 0;
  objc_storeStrong(&v83, obj);
  v82 = 0;
  objc_storeStrong(&v82, v64);
  v60 = -[SUSettingsStatefulUIManager log](v85, "log");
  oslog = (os_log_t)(id)objc_msgSend(v60, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v55 = type;
    v56 = SUSettingsUIStateToString(objc_msgSend(v63[4], "currentState"));
    v57 = v56;
    v79 = v57;
    v58 = objc_msgSend(v63[4], "currentState");
    v59 = (id)objc_msgSend(v63[4], "delegate");
    v77 = 0;
    v75 = 0;
    if (v59)
    {
      v78 = (id)objc_msgSend(v63[4], "delegate");
      v52 = 1;
      v77 = 1;
      v5 = (objc_class *)objc_opt_class();
      v76 = NSStringFromClass(v5);
      v75 = 1;
      v53 = (const __CFString *)v76;
    }
    else
    {
      v53 = CFSTR("(null)");
    }
    v46 = v53;
    v47 = (id)objc_msgSend(v63[4], "delegate");
    v48 = (id)objc_msgSend(v63[4], "scanError");
    v49 = (id)objc_msgSend(v63[4], "preferredStatefulDescriptor");
    v50 = (id)objc_msgSend(v63[4], "alternateStatefulDescriptor");
    v51 = (id)objc_msgSend(v63[4], "currentDownload");
    v73 = 0;
    v71 = 0;
    v69 = 0;
    if (v51)
    {
      v74 = (id)objc_msgSend(v63[4], "currentDownload");
      v44 = 1;
      v73 = 1;
      v72 = (id)objc_msgSend(v74, "descriptor");
      v71 = 1;
      v70 = (id)objc_msgSend(v72, "humanReadableUpdateName");
      v69 = 1;
      v45 = (const __CFString *)v70;
    }
    else
    {
      v45 = CFSTR("(null)");
    }
    v30 = v45;
    v31 = (id)objc_msgSend(v63[4], "currentDownload");
    v6 = objc_msgSend(v63[4], "performThirdPartyScan");
    v37 = "NO";
    v7 = "YES";
    v38 = "YES";
    v42 = 1;
    if ((v6 & 1) == 0)
      v7 = "NO";
    v32 = v7;
    v8 = objc_msgSend(v63[4], "isTargetedUpdateScheduledForAutoInstall");
    v9 = (uint64_t)v38;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v37;
    v33 = v9;
    v10 = objc_msgSend(v63[4], "hidingPreferredDescriptor");
    v11 = (uint64_t)v38;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v37;
    v34 = v11;
    v35 = (id)objc_msgSend(*((id *)v63[4] + 32), "humanReadableUpdateName");
    v36 = v35;
    v68 = v36;
    v12 = objc_msgSend(v63[4], "hidingAlternateDescriptor");
    v13 = (uint64_t)v38;
    if ((v12 & 1) == 0)
      v13 = (uint64_t)v37;
    v39 = v13;
    v40 = (id)objc_msgSend(*((id *)v63[4] + 33), "humanReadableUpdateName");
    v41 = v40;
    v67 = v41;
    v43 = (id)objc_msgSend(v63[4], "enrolledBetaProgram");
    v65 = 0;
    if (v43)
    {
      v66 = (id)objc_msgSend(v63[4], "enrolledBetaProgram");
      v65 = 1;
      v29 = objc_msgSend(v66, "programID");
    }
    else
    {
      v29 = 0;
    }
    v20 = v29;
    v28 = (id)objc_msgSend(v63[4], "betaPrograms");
    v21 = objc_msgSend(v28, "count");
    v27 = (id)objc_msgSend(v63[4], "currentFullScanOperation");
    v26 = (id)objc_msgSend(v63[4], "currentRefreshScanOperation");
    v25 = (id)objc_msgSend(v63[4], "currentUpdateOperation");
    v24 = (id)objc_msgSend(v63[4], "auxiliaryOperations");
    v14 = objc_msgSend(v24, "count");
    v15 = (uint64_t)v63[1];
    v16 = (uint64_t)*v63;
    v22 = &v17;
    buf = v86;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66((uint64_t)v86, (uint64_t)v61, (uint64_t)v57, v58, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, v33, v34, (uint64_t)v36, v39, (uint64_t)v41, v29, v21,
      (uint64_t)v27,
      (uint64_t)v26,
      (uint64_t)v25,
      v14,
      v15,
      v16);
    _os_log_impl(&dword_21BF33000, log, v55[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Failed to install an update. Error: %{public}@; Descriptor: %{public}@",
      buf,
      0xF2u);

    if ((v65 & 1) != 0)
    if ((v69 & 1) != 0)

    if ((v71 & 1) != 0)
    if ((v73 & 1) != 0)

    if ((v75 & 1) != 0)
    if ((v77 & 1) != 0)

    v19 = 0;
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v68, v19);
    objc_storeStrong(&v79, v19);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_msgSend(v63[4], "checkForAvailableUpdates");
  v18 = 0;
  objc_storeStrong(&v82, 0);
  objc_storeStrong(&v83, v18);
  objc_storeStrong(location, v18);
}

- (void)autoInstallOperationWasCancelled:(id)a3
{
  SUSettingsStatefulUIManager *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  SUSettingsStatefulUIManager *v9;
  id location[2];
  SUSettingsStatefulUIManager *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[SUSettingsStatefulUIManager setIsAutoUpdateScheduled:](v11, "setIsAutoUpdateScheduled:", 0);
  -[SUSettingsStatefulUIManager setCurrentAutoInstallOperation:](v11, "setCurrentAutoInstallOperation:", 0);
  v3 = v11;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __64__SUSettingsStatefulUIManager_autoInstallOperationWasCancelled___block_invoke;
  v8 = &unk_24DFF7B58;
  v9 = v11;
  -[SUSettingsStatefulUIManager executeOperationOnDelegate:usingBlock:](v3, "executeOperationOnDelegate:usingBlock:", sel_statefulUIManagerDidRefreshState_);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

void __64__SUSettingsStatefulUIManager_autoInstallOperationWasCancelled___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  objc_msgSend(v2, "statefulUIManagerDidRefreshState:", *(_QWORD *)(a1 + 32));

}

- (void)autoInstallOperationDidConsent:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationIsReadyToInstall:(id)a3 withResponse:(id)a4
{
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)autoInstallOperationPasscodePolicyDidChange:(id)a3 passcodePolicyType:(unint64_t)a4
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)batteryStateChanged:(id)a3
{
  objc_class *v3;
  char v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t *v14;
  uint64_t v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint8_t *buf;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  const __CFString *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  id v37;
  id v38;
  int v39;
  id v40;
  int v41;
  const __CFString *v42;
  const __CFString *v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  int v49;
  const __CFString *v50;
  os_log_t log;
  os_log_type_t v52[4];
  id v53;
  id v54;
  uint64_t v55;
  id v56;
  id v57;
  const char *v58;
  id v59;
  uint64_t v60;
  uint64_t *v61;
  _BOOL4 v62;
  char v63;
  id v64;
  id v65;
  id v66;
  char v67;
  id v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  char v75;
  id v76;
  id v77;
  os_log_type_t type;
  os_log_t oslog;
  BOOL v80;
  uint64_t v81;
  id location[3];
  _BYTE v83[248];
  uint64_t v84;

  v61 = &v81;
  v58 = "-[SUSettingsStatefulUIManager batteryStateChanged:]";
  v84 = *MEMORY[0x24BDAC8D0];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v81 = 0;
  v59 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v60 = objc_msgSend(v59, "batteryState");

  v81 = v60;
  v80 = 0;
  v62 = 1;
  if (v60 != 2)
    v62 = *v61 == 3;
  v80 = v62;
  v57 = (id)objc_msgSend((id)v61[3], "log");
  oslog = (os_log_t)(id)objc_msgSend(v57, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v52 = type;
    v53 = SUSettingsUIStateToString(objc_msgSend((id)v61[3], "currentState"));
    v54 = v53;
    v77 = v54;
    v55 = objc_msgSend((id)v61[3], "currentState");
    v56 = (id)objc_msgSend((id)v61[3], "delegate");
    v75 = 0;
    v73 = 0;
    if (v56)
    {
      v76 = (id)objc_msgSend((id)v61[3], "delegate");
      v49 = 1;
      v75 = 1;
      v3 = (objc_class *)objc_opt_class();
      v74 = NSStringFromClass(v3);
      v73 = 1;
      v50 = (const __CFString *)v74;
    }
    else
    {
      v50 = CFSTR("(null)");
    }
    v43 = v50;
    v44 = (id)objc_msgSend((id)v61[3], "delegate");
    v45 = (id)objc_msgSend((id)v61[3], "scanError");
    v46 = (id)objc_msgSend((id)v61[3], "preferredStatefulDescriptor");
    v47 = (id)objc_msgSend((id)v61[3], "alternateStatefulDescriptor");
    v48 = (id)objc_msgSend((id)v61[3], "currentDownload");
    v71 = 0;
    v69 = 0;
    v67 = 0;
    if (v48)
    {
      v72 = (id)objc_msgSend((id)v61[3], "currentDownload");
      v41 = 1;
      v71 = 1;
      v70 = (id)objc_msgSend(v72, "descriptor");
      v69 = 1;
      v68 = (id)objc_msgSend(v70, "humanReadableUpdateName");
      v67 = 1;
      v42 = (const __CFString *)v68;
    }
    else
    {
      v42 = CFSTR("(null)");
    }
    v27 = v42;
    v28 = (id)objc_msgSend((id)v61[3], "currentDownload");
    v4 = objc_msgSend((id)v61[3], "performThirdPartyScan");
    v34 = "NO";
    v5 = "YES";
    v35 = "YES";
    v39 = 1;
    if ((v4 & 1) == 0)
      v5 = "NO";
    v29 = v5;
    v6 = objc_msgSend((id)v61[3], "isTargetedUpdateScheduledForAutoInstall");
    v7 = (uint64_t)v35;
    if ((v6 & 1) == 0)
      v7 = (uint64_t)v34;
    v30 = v7;
    v8 = objc_msgSend((id)v61[3], "hidingPreferredDescriptor");
    v9 = (uint64_t)v35;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v34;
    v31 = v9;
    v32 = (id)objc_msgSend(*(id *)(v61[3] + 256), "humanReadableUpdateName");
    v33 = v32;
    v66 = v33;
    v10 = objc_msgSend((id)v61[3], "hidingAlternateDescriptor");
    v11 = (uint64_t)v35;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v34;
    v36 = v11;
    v37 = (id)objc_msgSend(*(id *)(v61[3] + 264), "humanReadableUpdateName");
    v38 = v37;
    v65 = v38;
    v40 = (id)objc_msgSend((id)v61[3], "enrolledBetaProgram");
    v63 = 0;
    if (v40)
    {
      v64 = (id)objc_msgSend((id)v61[3], "enrolledBetaProgram");
      v63 = 1;
      v26 = objc_msgSend(v64, "programID");
    }
    else
    {
      v26 = 0;
    }
    v17 = v26;
    v25 = (id)objc_msgSend((id)v61[3], "betaPrograms");
    v18 = objc_msgSend(v25, "count");
    v24 = (id)objc_msgSend((id)v61[3], "currentFullScanOperation");
    v23 = (id)objc_msgSend((id)v61[3], "currentRefreshScanOperation");
    v22 = (id)objc_msgSend((id)v61[3], "currentUpdateOperation");
    v21 = (id)objc_msgSend((id)v61[3], "auxiliaryOperations");
    v12 = objc_msgSend(v21, "count");
    v13 = *(_BYTE *)(v61[3] + 13) & 1;
    v19 = &v15;
    buf = v83;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_4_0_4_0((uint64_t)v83, (uint64_t)v58, (uint64_t)v54, v55, (uint64_t)v43, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, (uint64_t)v47, (uint64_t)v27, (uint64_t)v28, (uint64_t)v29, v30, v31, (uint64_t)v33, v36, (uint64_t)v38, v26, v18,
      (uint64_t)v24,
      (uint64_t)v23,
      (uint64_t)v22,
      v12,
      v13,
      v80);
    _os_log_impl(&dword_21BF33000, log, v52[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Battery state changed: %d -> %d",
      buf,
      0xEAu);

    if ((v63 & 1) != 0)
    if ((v67 & 1) != 0)

    if ((v69 & 1) != 0)
    if ((v71 & 1) != 0)

    if ((v73 & 1) != 0)
    if ((v75 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v65, 0);
    objc_storeStrong(&v66, obj);
    objc_storeStrong(&v77, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  if ((*(_BYTE *)(v61[3] + 13) & 1) != v80)
  {
    v14 = v61;
    *(_BYTE *)(v61[3] + 13) = v80;
    objc_msgSend((id)v14[3], "refreshState");
  }
  objc_storeStrong(location, 0);
}

- (void)batteryLevelChanged:(id)a3
{
  id v3;
  float v4;
  double v5;
  objc_class *v6;
  char v7;
  const char *v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint8_t *buf;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  id v40;
  id v41;
  int v42;
  id v43;
  int v44;
  const __CFString *v45;
  const __CFString *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  int v52;
  const __CFString *v53;
  os_log_t log;
  os_log_type_t v55[4];
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  const char *v61;
  id v62;
  _DWORD *v63;
  float v64;
  char v65;
  id v66;
  id v67;
  id v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  char v75;
  id v76;
  char v77;
  id v78;
  id v79;
  os_log_type_t type;
  os_log_t oslog;
  _DWORD v82[3];
  id location[2];
  SUSettingsStatefulUIManager *v84;
  _BYTE v85[248];
  uint64_t v86;

  v63 = v82;
  v61 = "-[SUSettingsStatefulUIManager batteryLevelChanged:]";
  v86 = *MEMORY[0x24BDAC8D0];
  v84 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v64 = 0.2;
  v82[2] = 1045220557;
  v82[1] = 0.5;
  v82[0] = 0;
  v82[0] = LODWORD(v84->_batteryLevel);
  v62 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  objc_msgSend(v62, "batteryLevel");
  v3 = v62;
  v84->_batteryLevel = v4;

  if (*(float *)(*(_QWORD *)(v63 + 7) + 24) < v64 && (LODWORD(v5) = *v63, *(float *)v63 >= 0.2)
    || *(float *)(*(_QWORD *)(v63 + 7) + 24) >= 0.2 && (LODWORD(v5) = *v63, *(float *)v63 < 0.2)
    || *(float *)(*(_QWORD *)(v63 + 7) + 24) < 0.5 && (LODWORD(v5) = *v63, *(float *)v63 >= 0.5)
    || *(float *)(*(_QWORD *)(v63 + 7) + 24) >= 0.5 && (LODWORD(v5) = *v63, *(float *)v63 < 0.5))
  {
    v60 = (id)objc_msgSend(*(id *)(v63 + 7), "log", v5);
    oslog = (os_log_t)(id)objc_msgSend(v60, "oslog");

    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      *(_DWORD *)v55 = type;
      v56 = SUSettingsUIStateToString(objc_msgSend(*(id *)(v63 + 7), "currentState"));
      v57 = v56;
      v79 = v57;
      v58 = objc_msgSend(*(id *)(v63 + 7), "currentState");
      v59 = (id)objc_msgSend(*(id *)(v63 + 7), "delegate");
      v77 = 0;
      v75 = 0;
      if (v59)
      {
        v78 = (id)objc_msgSend(*(id *)(v63 + 7), "delegate");
        v52 = 1;
        v77 = 1;
        v6 = (objc_class *)objc_opt_class();
        v76 = NSStringFromClass(v6);
        v75 = 1;
        v53 = (const __CFString *)v76;
      }
      else
      {
        v53 = CFSTR("(null)");
      }
      v46 = v53;
      v47 = (id)objc_msgSend(*(id *)(v63 + 7), "delegate");
      v48 = (id)objc_msgSend(*(id *)(v63 + 7), "scanError");
      v49 = (id)objc_msgSend(*(id *)(v63 + 7), "preferredStatefulDescriptor");
      v50 = (id)objc_msgSend(*(id *)(v63 + 7), "alternateStatefulDescriptor");
      v51 = (id)objc_msgSend(*(id *)(v63 + 7), "currentDownload");
      v73 = 0;
      v71 = 0;
      v69 = 0;
      if (v51)
      {
        v74 = (id)objc_msgSend(*(id *)(v63 + 7), "currentDownload");
        v44 = 1;
        v73 = 1;
        v72 = (id)objc_msgSend(v74, "descriptor");
        v71 = 1;
        v70 = (id)objc_msgSend(v72, "humanReadableUpdateName");
        v69 = 1;
        v45 = (const __CFString *)v70;
      }
      else
      {
        v45 = CFSTR("(null)");
      }
      v30 = v45;
      v31 = (id)objc_msgSend(*(id *)(v63 + 7), "currentDownload");
      v7 = objc_msgSend(*(id *)(v63 + 7), "performThirdPartyScan");
      v37 = "NO";
      v8 = "YES";
      v38 = "YES";
      v42 = 1;
      if ((v7 & 1) == 0)
        v8 = "NO";
      v32 = v8;
      v9 = objc_msgSend(*(id *)(v63 + 7), "isTargetedUpdateScheduledForAutoInstall");
      v10 = (uint64_t)v38;
      if ((v9 & 1) == 0)
        v10 = (uint64_t)v37;
      v33 = v10;
      v11 = objc_msgSend(*(id *)(v63 + 7), "hidingPreferredDescriptor");
      v12 = (uint64_t)v38;
      if ((v11 & 1) == 0)
        v12 = (uint64_t)v37;
      v34 = v12;
      v35 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v63 + 7) + 256), "humanReadableUpdateName");
      v36 = v35;
      v68 = v36;
      v13 = objc_msgSend(*(id *)(v63 + 7), "hidingAlternateDescriptor");
      v14 = (uint64_t)v38;
      if ((v13 & 1) == 0)
        v14 = (uint64_t)v37;
      v39 = v14;
      v40 = (id)objc_msgSend(*(id *)(*(_QWORD *)(v63 + 7) + 264), "humanReadableUpdateName");
      v41 = v40;
      v67 = v41;
      v43 = (id)objc_msgSend(*(id *)(v63 + 7), "enrolledBetaProgram");
      v65 = 0;
      if (v43)
      {
        v66 = (id)objc_msgSend(*(id *)(v63 + 7), "enrolledBetaProgram");
        v65 = 1;
        v29 = objc_msgSend(v66, "programID");
      }
      else
      {
        v29 = 0;
      }
      v20 = v29;
      v28 = (id)objc_msgSend(*(id *)(v63 + 7), "betaPrograms");
      v21 = objc_msgSend(v28, "count");
      v27 = (id)objc_msgSend(*(id *)(v63 + 7), "currentFullScanOperation");
      v26 = (id)objc_msgSend(*(id *)(v63 + 7), "currentRefreshScanOperation");
      v25 = (id)objc_msgSend(*(id *)(v63 + 7), "currentUpdateOperation");
      v24 = (id)objc_msgSend(*(id *)(v63 + 7), "auxiliaryOperations");
      v15 = objc_msgSend(v24, "count");
      *(double *)&v16 = *(float *)v63;
      *(double *)&v17 = *(float *)(*(_QWORD *)(v63 + 7) + 24);
      v22 = &v18;
      buf = v85;
      __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v85, (uint64_t)v61, (uint64_t)v57, v58, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, v33, v34, (uint64_t)v36, v39, (uint64_t)v41, v29, v21,
        (uint64_t)v27,
        (uint64_t)v26,
        (uint64_t)v25,
        v15,
        v16,
        v17);
      _os_log_impl(&dword_21BF33000, log, v55[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Battery level changed: %f -> %f",
        buf,
        0xF2u);

      if ((v65 & 1) != 0)
      if ((v69 & 1) != 0)

      if ((v71 & 1) != 0)
      if ((v73 & 1) != 0)

      if ((v75 & 1) != 0)
      if ((v77 & 1) != 0)

      obj = 0;
      objc_storeStrong(&v67, 0);
      objc_storeStrong(&v68, obj);
      objc_storeStrong(&v79, obj);
    }
    objc_storeStrong((id *)&oslog, 0);
    objc_msgSend(*(id *)(v63 + 7), "refreshState");
  }
  objc_storeStrong(location, 0);
}

- (void)didBecomeActive:(id)a3
{
  id location[2];
  SUSettingsStatefulUIManager *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[SUSettingsStatefulUIManager currentState](v4, "currentState") != 1)
    -[SUSettingsStatefulUIManager refreshState](v4, "refreshState");
  objc_storeStrong(location, 0);
}

- (void)setupFSM
{
  objc_class *v2;
  NSDictionary *v3;
  NSDictionary *stateTable;
  dispatch_queue_t v5;
  OS_dispatch_queue *workQueue;
  uint64_t v7;
  SUCoreFSM *managerFSM;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];
  SUSettingsStatefulUIManager *v18;
  id v19;
  id v20;

  v18 = self;
  v17[1] = (id)a2;
  v20 = (id)MGCopyAnswer();
  v17[0] = v20;
  v19 = (id)MGCopyAnswer();
  v16 = v19;
  v9 = objc_alloc(MEMORY[0x24BDD17C8]);
  v2 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v2);
  v15 = (id)objc_msgSend(v9, "initWithFormat:", CFSTR("%@:%@(%@)"), v10, v17[0], v16);

  v3 = (NSDictionary *)(id)objc_msgSend((id)objc_opt_class(), "_generateStateTable");
  stateTable = v18->_stateTable;
  v18->_stateTable = v3;

  v11 = (void *)MEMORY[0x24BDD17C8];
  v13 = -[SUSettingsStatefulUIManager baseDomain](v18, "baseDomain");
  v12 = (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.stateful-ui-manager"), v13);
  v5 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), 0);
  workQueue = v18->_workQueue;
  v18->_workQueue = (OS_dispatch_queue *)v5;

  v14 = objc_alloc(MEMORY[0x24BEAEA60]);
  v7 = objc_msgSend(v14, "initMachine:withTable:startingIn:usingDelegate:registeringAllInfoClass:", v15, v18->_stateTable, CFSTR("Idle"), v18, objc_opt_class());
  managerFSM = v18->_managerFSM;
  v18->_managerFSM = (SUCoreFSM *)v7;

  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(v17, 0);
}

- (void)setupNetworkMonitoring
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5[2];
  SUSettingsStatefulUIManager *v6;

  v6 = self;
  v5[1] = (id)a2;
  v5[0] = (id)objc_msgSend(getSUNetworkMonitorClass(), "sharedInstance");
  v2 = objc_msgSend(v5[0], "currentNetworkType");
  -[SUSettingsStatefulUIManager setNetworkType:](v6, "setNetworkType:", v2);
  objc_msgSend(v5[0], "addObserver:", v6);
  v3 = SBSSpringBoardServerPort();
  MEMORY[0x2207736EC](v3, &v6->_originalCellFlag, &v6->_originalWifiFlag);
  v4 = SBSSpringBoardServerPort();
  MEMORY[0x220773704](v4, 1);
  objc_storeStrong(v5, 0);
}

- (void)setupBatteryMonitoring
{
  float v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;

  PSSetBatteryMonitoringEnabled();
  v6 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = objc_msgSend(v6, "batteryState");

  v8 = 1;
  if (v7 != 2)
    v8 = v7 == 3;
  self->_connectedToPowerSource = v8;
  v3 = (id)objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  objc_msgSend(v3, "batteryLevel");
  self->_batteryLevel = v2;

  v4 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_batteryStateChanged_, *MEMORY[0x24BEBE0F8]);

  v5 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_batteryLevelChanged_, *MEMORY[0x24BEBE0F0], 0);

}

- (void)setupObservers
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v2, "addObserver:selector:name:object:", self, sel_didBecomeActive_, *MEMORY[0x24BEBDF88], 0);

}

- (void)checkForAvailableUpdatesWithRetriesCount:(unsigned __int8)a3
{
  objc_class *v3;
  BOOL v4;
  const char *v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  SUSettingsStatefulUIManagerFSMParam *v12;
  uint64_t v13;
  const __CFString *v14;
  id v15;
  id v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint8_t *buf;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  id v40;
  id v41;
  int v42;
  id v43;
  int v44;
  const __CFString *v45;
  const __CFString *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  int v52;
  const __CFString *v53;
  os_log_t log;
  os_log_type_t v55[4];
  id v56;
  id v57;
  unint64_t v58;
  id v59;
  id v60;
  const char *v61;
  id location;
  char v63;
  id v64;
  id v65;
  id v66;
  char v67;
  id v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  char v75;
  id v76;
  id v77;
  os_log_type_t type;
  os_log_t oslog;
  unsigned __int8 v80;
  SEL v81;
  SUSettingsStatefulUIManager *v82;
  _BYTE v83[232];
  uint64_t v84;

  v61 = "-[SUSettingsStatefulUIManager checkForAvailableUpdatesWithRetriesCount:]";
  v84 = *MEMORY[0x24BDAC8D0];
  v82 = self;
  v81 = a2;
  v80 = a3;
  v60 = -[SUSettingsStatefulUIManager log](self, "log");
  oslog = (os_log_t)(id)objc_msgSend(v60, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v55 = type;
    v56 = SUSettingsUIStateToString(-[SUSettingsStatefulUIManager currentState](v82, "currentState"));
    v57 = v56;
    v77 = v57;
    v58 = -[SUSettingsStatefulUIManager currentState](v82, "currentState");
    v59 = -[SUSettingsStatefulUIManager delegate](v82, "delegate");
    v75 = 0;
    v73 = 0;
    if (v59)
    {
      v76 = -[SUSettingsStatefulUIManager delegate](v82, "delegate");
      v52 = 1;
      v75 = 1;
      v3 = (objc_class *)objc_opt_class();
      v74 = NSStringFromClass(v3);
      v73 = 1;
      v53 = (const __CFString *)v74;
    }
    else
    {
      v53 = CFSTR("(null)");
    }
    v46 = v53;
    v47 = -[SUSettingsStatefulUIManager delegate](v82, "delegate");
    v48 = -[SUSettingsStatefulUIManager scanError](v82, "scanError");
    v49 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](v82, "preferredStatefulDescriptor");
    v50 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](v82, "alternateStatefulDescriptor");
    v51 = -[SUSettingsStatefulUIManager currentDownload](v82, "currentDownload");
    v71 = 0;
    v69 = 0;
    v67 = 0;
    if (v51)
    {
      v72 = -[SUSettingsStatefulUIManager currentDownload](v82, "currentDownload");
      v44 = 1;
      v71 = 1;
      v70 = (id)objc_msgSend(v72, "descriptor");
      v69 = 1;
      v68 = (id)objc_msgSend(v70, "humanReadableUpdateName");
      v67 = 1;
      v45 = (const __CFString *)v68;
    }
    else
    {
      v45 = CFSTR("(null)");
    }
    v30 = v45;
    v31 = -[SUSettingsStatefulUIManager currentDownload](v82, "currentDownload");
    v4 = -[SUSettingsStatefulUIManager performThirdPartyScan](v82, "performThirdPartyScan");
    v37 = "NO";
    v5 = "YES";
    v38 = "YES";
    v42 = 1;
    if (!v4)
      v5 = "NO";
    v32 = v5;
    v6 = -[SUSettingsStatefulUIManager isTargetedUpdateScheduledForAutoInstall](v82, "isTargetedUpdateScheduledForAutoInstall");
    v7 = (uint64_t)v38;
    if (!v6)
      v7 = (uint64_t)v37;
    v33 = v7;
    v8 = -[SUSettingsStatefulUIManager hidingPreferredDescriptor](v82, "hidingPreferredDescriptor");
    v9 = (uint64_t)v38;
    if (!v8)
      v9 = (uint64_t)v37;
    v34 = v9;
    v35 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v82->_hiddenPreferredStatefulDescriptor, "humanReadableUpdateName");
    v36 = v35;
    v66 = v36;
    v10 = -[SUSettingsStatefulUIManager hidingAlternateDescriptor](v82, "hidingAlternateDescriptor");
    v11 = (uint64_t)v38;
    if (!v10)
      v11 = (uint64_t)v37;
    v39 = v11;
    v40 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v82->_hiddenAlternateStatefulDescriptor, "humanReadableUpdateName");
    v41 = v40;
    v65 = v41;
    v43 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v82, "enrolledBetaProgram");
    v63 = 0;
    if (v43)
    {
      v64 = -[SUSettingsStatefulUIManager enrolledBetaProgram](v82, "enrolledBetaProgram");
      v63 = 1;
      v29 = objc_msgSend(v64, "programID");
    }
    else
    {
      v29 = 0;
    }
    v18 = v29;
    v28 = -[SUSettingsStatefulUIManager betaPrograms](v82, "betaPrograms");
    v19 = objc_msgSend(v28, "count");
    v27 = -[SUSettingsStatefulUIManager currentFullScanOperation](v82, "currentFullScanOperation");
    v26 = -[SUSettingsStatefulUIManager currentRefreshScanOperation](v82, "currentRefreshScanOperation");
    v25 = -[SUSettingsStatefulUIManager currentUpdateOperation](v82, "currentUpdateOperation");
    v24 = -[SUSettingsStatefulUIManager auxiliaryOperations](v82, "auxiliaryOperations");
    v20 = objc_msgSend(v24, "count");
    v23 = (id)-[SUCoreFSM copyCurrentState](v82->_managerFSM, "copyCurrentState");
    location = v23;
    v21 = &v13;
    buf = v83;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v83, (uint64_t)v61, (uint64_t)v57, v58, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, v33, v34, (uint64_t)v36, v39, (uint64_t)v41, v29, v19,
      (uint64_t)v27,
      (uint64_t)v26,
      (uint64_t)v25,
      v20,
      (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, v55[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Current FSM state: %{public}@",
      buf,
      0xE8u);

    if ((v63 & 1) != 0)
    if ((v67 & 1) != 0)

    if ((v69 & 1) != 0)
    if ((v71 & 1) != 0)

    if ((v73 & 1) != 0)
    if ((v75 & 1) != 0)

    obj = 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v65, obj);
    objc_storeStrong(&v66, obj);
    objc_storeStrong(&v77, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  v16 = -[SUSettingsStatefulUIManager managerFSM](v82, "managerFSM");
  v14 = CFSTR("CheckForAvailableUpdate");
  v12 = [SUSettingsStatefulUIManagerFSMParam alloc];
  v15 = -[SUSettingsStatefulUIManagerFSMParam initWithRetriesCount:](v12, "initWithRetriesCount:", v80);
  objc_msgSend(v16, "postEvent:withInfo:", v14);

}

- (void)performFullScan:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  id v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id *v21;
  id *v22;
  id v23;
  uint64_t *v24;
  id v25;
  id v26;
  uint64_t v27;
  SUSettingsScanOperation *v28;
  uint64_t *v29;
  uint8_t *v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  const char *v51;
  id v52;
  id v53;
  id v54;
  int v55;
  const char *v56;
  id v57;
  const char *v58;
  int v59;
  const char *v60;
  int v61;
  id v62;
  int v63;
  const __CFString *v64;
  id v65;
  const __CFString *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  const __CFString *v79;
  id v80;
  const __CFString *v81;
  id v82;
  Class v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  id v90;
  os_log_t v91;
  os_log_type_t v92[4];
  unint64_t v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t *v100;
  uint8_t *v101;
  id v102;
  uint64_t v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  const char *v122;
  id v123;
  id v124;
  id v125;
  int v126;
  const char *v127;
  id v128;
  const char *v129;
  int v130;
  const char *v131;
  int v132;
  id v133;
  int v134;
  const __CFString *v135;
  id v136;
  const __CFString *v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  const __CFString *v150;
  id v151;
  const __CFString *v152;
  id v153;
  Class v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  uint64_t v160;
  id v161;
  os_log_t v162;
  os_log_type_t v163[4];
  unint64_t v164;
  id v165;
  id v166;
  id v167;
  _BOOL4 v168;
  id v169;
  id *v170;
  uint64_t *v171;
  id v172;
  uint64_t *v173;
  uint8_t *buf;
  id v175;
  uint64_t v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  const char *v195;
  id v196;
  id v197;
  id v198;
  int v199;
  const char *v200;
  id v201;
  const char *v202;
  int v203;
  const char *v204;
  int v205;
  id v206;
  int v207;
  const __CFString *v208;
  id v209;
  const __CFString *v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  const __CFString *v223;
  id v224;
  const __CFString *v225;
  id v226;
  Class aClass;
  id v228;
  id v229;
  id v230;
  id v231;
  id v232;
  uint64_t v233;
  id v234;
  os_log_t log;
  os_log_type_t v236[4];
  unint64_t v237;
  id v238;
  id v239;
  id v240;
  _BOOL4 v241;
  id obj;
  id v243;
  const char *v244;
  uint64_t v245;
  int v246;
  int v247;
  void (*v248)(id *, void *, void *);
  void *v249;
  _QWORD v250[2];
  char v251;
  id v252;
  id v253;
  id v254;
  char v255;
  id v256;
  char v257;
  id v258;
  char v259;
  id v260;
  char v261;
  id v262;
  char v263;
  id v264;
  id v265;
  os_log_type_t v266;
  os_log_t v267;
  id v268;
  int v269;
  char v270;
  id v271;
  id v272;
  id v273;
  char v274;
  id v275;
  char v276;
  id v277;
  char v278;
  id v279;
  char v280;
  id v281;
  char v282;
  id v283;
  id v284;
  os_log_type_t v285;
  os_log_t v286;
  uint64_t v287;
  int v288;
  int v289;
  uint64_t (*v290)(uint64_t);
  void *v291;
  id v292;
  char v293;
  id v294;
  id v295;
  id v296;
  char v297;
  id v298;
  char v299;
  id v300;
  char v301;
  id v302;
  char v303;
  id v304;
  char v305;
  id v306;
  id v307;
  os_log_type_t type;
  os_log_t oslog;
  id location[2];
  id v311;
  _BYTE v312[256];
  _BYTE v313[224];
  _BYTE v314[232];
  uint64_t v315;

  v244 = "-[SUSettingsStatefulUIManager performFullScan:]";
  v315 = *MEMORY[0x24BDAC8D0];
  v311 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = *((id *)v311 + 27);
  objc_sync_enter(obj);
  v243 = (id)objc_msgSend(v311, "currentRefreshScanOperation");
  v3 = v243;
  v241 = v3 == 0;

  if (!v241)
  {
    v240 = (id)objc_msgSend(v311, "log");
    v238 = v240;
    v239 = (id)objc_msgSend(v238, "oslog");
    oslog = (os_log_t)v239;

    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      *(_DWORD *)v236 = type;
      v237 = objc_msgSend(v311, "currentState");
      v234 = SUSettingsUIStateToString(v237);
      v231 = v234;
      v232 = v231;
      v307 = v232;
      v233 = objc_msgSend(v311, "currentState");
      v305 = 0;
      v303 = 0;
      v230 = (id)objc_msgSend(v311, "delegate");
      v229 = v230;
      if (v229)
      {
        v228 = (id)objc_msgSend(v311, "delegate");
        v306 = v228;
        v305 = 1;
        aClass = (Class)objc_opt_class();
        v226 = NSStringFromClass(aClass);
        v304 = v226;
        v303 = 1;
        v225 = (const __CFString *)v304;
      }
      else
      {
        v225 = CFSTR("(null)");
      }
      v223 = v225;
      v224 = (id)objc_msgSend(v311, "delegate");
      v221 = v224;
      v222 = (id)objc_msgSend(v311, "scanError");
      v219 = v222;
      v220 = (id)objc_msgSend(v311, "preferredStatefulDescriptor");
      v217 = v220;
      v218 = (id)objc_msgSend(v311, "alternateStatefulDescriptor");
      v215 = v218;
      v301 = 0;
      v299 = 0;
      v297 = 0;
      v216 = (id)objc_msgSend(v311, "currentDownload");
      v214 = v216;
      if (v214)
      {
        v213 = (id)objc_msgSend(v311, "currentDownload");
        v302 = v213;
        v301 = 1;
        v212 = (id)objc_msgSend(v302, "descriptor");
        v300 = v212;
        v299 = 1;
        v211 = (id)objc_msgSend(v300, "humanReadableUpdateName");
        v298 = v211;
        v297 = 1;
        v210 = (const __CFString *)v298;
      }
      else
      {
        v210 = CFSTR("(null)");
      }
      v208 = v210;
      v209 = (id)objc_msgSend(v311, "currentDownload");
      v206 = v209;
      v207 = objc_msgSend(v311, "performThirdPartyScan");
      v4 = "YES";
      if ((v207 & 1) == 0)
        v4 = "NO";
      v204 = v4;
      v205 = objc_msgSend(v311, "isTargetedUpdateScheduledForAutoInstall");
      v5 = "YES";
      if ((v205 & 1) == 0)
        v5 = "NO";
      v202 = v5;
      v203 = objc_msgSend(v311, "hidingPreferredDescriptor");
      v6 = "YES";
      if ((v203 & 1) == 0)
        v6 = "NO";
      v200 = v6;
      v201 = (id)objc_msgSend(*((id *)v311 + 32), "humanReadableUpdateName");
      v197 = v201;
      v198 = v197;
      v296 = v198;
      v199 = objc_msgSend(v311, "hidingAlternateDescriptor");
      v7 = "YES";
      if ((v199 & 1) == 0)
        v7 = "NO";
      v195 = v7;
      v196 = (id)objc_msgSend(*((id *)v311 + 33), "humanReadableUpdateName");
      v192 = v196;
      v193 = v192;
      v295 = v193;
      v293 = 0;
      v194 = (id)objc_msgSend(v311, "enrolledBetaProgram");
      v191 = v194;
      if (v191)
      {
        v190 = (id)objc_msgSend(v311, "enrolledBetaProgram");
        v294 = v190;
        v293 = 1;
        v189 = objc_msgSend(v294, "programID");
        v188 = v189;
      }
      else
      {
        v188 = 0;
      }
      v186 = v188;
      v187 = (id)objc_msgSend(v311, "betaPrograms");
      v184 = v187;
      v185 = objc_msgSend(v184, "count");
      v183 = (id)objc_msgSend(v311, "currentFullScanOperation");
      v181 = v183;
      v182 = (id)objc_msgSend(v311, "currentRefreshScanOperation");
      v179 = v182;
      v180 = (id)objc_msgSend(v311, "currentUpdateOperation");
      v177 = v180;
      v178 = (id)objc_msgSend(v311, "auxiliaryOperations");
      v175 = v178;
      v176 = objc_msgSend(v175, "count");
      v173 = &v20;
      buf = v314;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v314, (uint64_t)v244, (uint64_t)v232, v233, (uint64_t)v223, (uint64_t)v221, (uint64_t)v219, (uint64_t)v217, (uint64_t)v215, (uint64_t)v208, (uint64_t)v206, (uint64_t)v204, (uint64_t)v202, (uint64_t)v200, (uint64_t)v198, (uint64_t)v195, (uint64_t)v193, v188, v185,
        (uint64_t)v181,
        (uint64_t)v179,
        (uint64_t)v177,
        v176);
      _os_log_impl(&dword_21BF33000, log, v236[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A refresh operation is currently running. Canceling it as we start a full-scan.",
        buf,
        0xDEu);

      if ((v293 & 1) != 0)
      if ((v297 & 1) != 0)

      if ((v299 & 1) != 0)
      if ((v301 & 1) != 0)

      if ((v303 & 1) != 0)
      if ((v305 & 1) != 0)

      objc_storeStrong(&v295, 0);
      objc_storeStrong(&v296, 0);
      objc_storeStrong(&v307, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v172 = (id)*((_QWORD *)v311 + 24);
    v171 = &v287;
    v287 = MEMORY[0x24BDAC760];
    v288 = -1073741824;
    v289 = 0;
    v290 = __47__SUSettingsStatefulUIManager_performFullScan___block_invoke;
    v291 = &unk_24DFF7B58;
    v170 = &v292;
    v292 = v311;
    objc_msgSend(v172, "cancel:", v171);
    objc_storeStrong(v170, 0);
  }
  v169 = (id)objc_msgSend(v311, "currentFullScanOperation");
  v8 = v169;
  v168 = v8 == 0;

  if (v168)
  {
    v269 = 0;
  }
  else
  {
    v167 = (id)objc_msgSend(v311, "log");
    v165 = v167;
    v166 = (id)objc_msgSend(v165, "oslog");
    v286 = (os_log_t)v166;

    v285 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v286, OS_LOG_TYPE_DEFAULT))
    {
      v162 = v286;
      *(_DWORD *)v163 = v285;
      v164 = objc_msgSend(v311, "currentState");
      v161 = SUSettingsUIStateToString(v164);
      v158 = v161;
      v159 = v158;
      v284 = v159;
      v160 = objc_msgSend(v311, "currentState");
      v282 = 0;
      v280 = 0;
      v157 = (id)objc_msgSend(v311, "delegate");
      v156 = v157;
      if (v156)
      {
        v155 = (id)objc_msgSend(v311, "delegate");
        v283 = v155;
        v282 = 1;
        v154 = (Class)objc_opt_class();
        v153 = NSStringFromClass(v154);
        v281 = v153;
        v280 = 1;
        v152 = (const __CFString *)v281;
      }
      else
      {
        v152 = CFSTR("(null)");
      }
      v150 = v152;
      v151 = (id)objc_msgSend(v311, "delegate");
      v148 = v151;
      v149 = (id)objc_msgSend(v311, "scanError");
      v146 = v149;
      v147 = (id)objc_msgSend(v311, "preferredStatefulDescriptor");
      v144 = v147;
      v145 = (id)objc_msgSend(v311, "alternateStatefulDescriptor");
      v142 = v145;
      v278 = 0;
      v276 = 0;
      v274 = 0;
      v143 = (id)objc_msgSend(v311, "currentDownload");
      v141 = v143;
      if (v141)
      {
        v140 = (id)objc_msgSend(v311, "currentDownload");
        v279 = v140;
        v278 = 1;
        v139 = (id)objc_msgSend(v279, "descriptor");
        v277 = v139;
        v276 = 1;
        v138 = (id)objc_msgSend(v277, "humanReadableUpdateName");
        v275 = v138;
        v274 = 1;
        v137 = (const __CFString *)v275;
      }
      else
      {
        v137 = CFSTR("(null)");
      }
      v135 = v137;
      v136 = (id)objc_msgSend(v311, "currentDownload");
      v133 = v136;
      v134 = objc_msgSend(v311, "performThirdPartyScan");
      v9 = "YES";
      if ((v134 & 1) == 0)
        v9 = "NO";
      v131 = v9;
      v132 = objc_msgSend(v311, "isTargetedUpdateScheduledForAutoInstall");
      v10 = "YES";
      if ((v132 & 1) == 0)
        v10 = "NO";
      v129 = v10;
      v130 = objc_msgSend(v311, "hidingPreferredDescriptor");
      v11 = "YES";
      if ((v130 & 1) == 0)
        v11 = "NO";
      v127 = v11;
      v128 = (id)objc_msgSend(*((id *)v311 + 32), "humanReadableUpdateName");
      v124 = v128;
      v125 = v124;
      v273 = v125;
      v126 = objc_msgSend(v311, "hidingAlternateDescriptor");
      v12 = "YES";
      if ((v126 & 1) == 0)
        v12 = "NO";
      v122 = v12;
      v123 = (id)objc_msgSend(*((id *)v311 + 33), "humanReadableUpdateName");
      v119 = v123;
      v120 = v119;
      v272 = v120;
      v270 = 0;
      v121 = (id)objc_msgSend(v311, "enrolledBetaProgram");
      v118 = v121;
      if (v118)
      {
        v117 = (id)objc_msgSend(v311, "enrolledBetaProgram");
        v271 = v117;
        v270 = 1;
        v116 = objc_msgSend(v271, "programID");
        v115 = v116;
      }
      else
      {
        v115 = 0;
      }
      v113 = v115;
      v114 = (id)objc_msgSend(v311, "betaPrograms");
      v111 = v114;
      v112 = objc_msgSend(v111, "count");
      v110 = (id)objc_msgSend(v311, "currentFullScanOperation");
      v108 = v110;
      v109 = (id)objc_msgSend(v311, "currentRefreshScanOperation");
      v106 = v109;
      v107 = (id)objc_msgSend(v311, "currentUpdateOperation");
      v104 = v107;
      v105 = (id)objc_msgSend(v311, "auxiliaryOperations");
      v102 = v105;
      v103 = objc_msgSend(v102, "count");
      v100 = &v20;
      v101 = v313;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v313, (uint64_t)v244, (uint64_t)v159, v160, (uint64_t)v150, (uint64_t)v148, (uint64_t)v146, (uint64_t)v144, (uint64_t)v142, (uint64_t)v135, (uint64_t)v133, (uint64_t)v131, (uint64_t)v129, (uint64_t)v127, (uint64_t)v125, (uint64_t)v122, (uint64_t)v120, v113, v112,
        (uint64_t)v108,
        (uint64_t)v106,
        (uint64_t)v104,
        v103);
      _os_log_impl(&dword_21BF33000, v162, v163[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A full-scan operation is already running. Skipping on this full-scan request.",
        v101,
        0xDEu);

      if ((v270 & 1) != 0)
      if ((v274 & 1) != 0)

      if ((v276 & 1) != 0)
      if ((v278 & 1) != 0)

      if ((v280 & 1) != 0)
      if ((v282 & 1) != 0)

      objc_storeStrong(&v272, 0);
      objc_storeStrong(&v273, 0);
      objc_storeStrong(&v284, 0);
    }
    objc_storeStrong((id *)&v286, 0);
    v269 = 1;
  }
  objc_sync_exit(obj);

  if (!v269)
  {
    v99 = (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v97 = v99;
    v98 = (id)objc_msgSend(v97, "UUIDString");
    v268 = v98;

    v96 = (id)objc_msgSend(v311, "log");
    v94 = v96;
    v95 = (id)objc_msgSend(v94, "oslog");
    v267 = (os_log_t)v95;

    v266 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v267, OS_LOG_TYPE_DEFAULT))
    {
      v91 = v267;
      *(_DWORD *)v92 = v266;
      v93 = objc_msgSend(v311, "currentState");
      v90 = SUSettingsUIStateToString(v93);
      v87 = v90;
      v88 = v87;
      v265 = v88;
      v89 = objc_msgSend(v311, "currentState");
      v86 = (id)objc_msgSend(v311, "delegate");
      v85 = v86;
      v263 = 0;
      v261 = 0;
      if (v85)
      {
        v84 = (id)objc_msgSend(v311, "delegate");
        v264 = v84;
        v263 = 1;
        v83 = (Class)objc_opt_class();
        v82 = NSStringFromClass(v83);
        v262 = v82;
        v261 = 1;
        v81 = (const __CFString *)v262;
      }
      else
      {
        v81 = CFSTR("(null)");
      }
      v79 = v81;
      v80 = (id)objc_msgSend(v311, "delegate");
      v77 = v80;
      v78 = (id)objc_msgSend(v311, "scanError");
      v75 = v78;
      v76 = (id)objc_msgSend(v311, "preferredStatefulDescriptor");
      v73 = v76;
      v74 = (id)objc_msgSend(v311, "alternateStatefulDescriptor");
      v71 = v74;
      v72 = (id)objc_msgSend(v311, "currentDownload");
      v70 = v72;
      v259 = 0;
      v257 = 0;
      v255 = 0;
      if (v70)
      {
        v69 = (id)objc_msgSend(v311, "currentDownload");
        v260 = v69;
        v259 = 1;
        v68 = (id)objc_msgSend(v260, "descriptor");
        v258 = v68;
        v257 = 1;
        v67 = (id)objc_msgSend(v258, "humanReadableUpdateName");
        v256 = v67;
        v255 = 1;
        v66 = (const __CFString *)v256;
      }
      else
      {
        v66 = CFSTR("(null)");
      }
      v64 = v66;
      v65 = (id)objc_msgSend(v311, "currentDownload");
      v62 = v65;
      v63 = objc_msgSend(v311, "performThirdPartyScan");
      v13 = "YES";
      if ((v63 & 1) == 0)
        v13 = "NO";
      v60 = v13;
      v61 = objc_msgSend(v311, "isTargetedUpdateScheduledForAutoInstall");
      v14 = "YES";
      if ((v61 & 1) == 0)
        v14 = "NO";
      v58 = v14;
      v59 = objc_msgSend(v311, "hidingPreferredDescriptor");
      v15 = "YES";
      if ((v59 & 1) == 0)
        v15 = "NO";
      v56 = v15;
      v57 = (id)objc_msgSend(*((id *)v311 + 32), "humanReadableUpdateName");
      v53 = v57;
      v54 = v53;
      v254 = v54;
      v55 = objc_msgSend(v311, "hidingAlternateDescriptor");
      v16 = "YES";
      if ((v55 & 1) == 0)
        v16 = "NO";
      v51 = v16;
      v52 = (id)objc_msgSend(*((id *)v311 + 33), "humanReadableUpdateName");
      v48 = v52;
      v49 = v48;
      v253 = v49;
      v50 = (id)objc_msgSend(v311, "enrolledBetaProgram");
      v47 = v50;
      v251 = 0;
      if (v47)
      {
        v46 = (id)objc_msgSend(v311, "enrolledBetaProgram");
        v252 = v46;
        v251 = 1;
        v45 = objc_msgSend(v252, "programID");
        v44 = v45;
      }
      else
      {
        v44 = 0;
      }
      v42 = v44;
      v43 = (id)objc_msgSend(v311, "betaPrograms");
      v40 = v43;
      v41 = objc_msgSend(v40, "count");
      v39 = (id)objc_msgSend(v311, "currentFullScanOperation");
      v37 = v39;
      v38 = (id)objc_msgSend(v311, "currentRefreshScanOperation");
      v35 = v38;
      v36 = (id)objc_msgSend(v311, "currentUpdateOperation");
      v33 = v36;
      v34 = (id)objc_msgSend(v311, "auxiliaryOperations");
      v31 = v34;
      v32 = objc_msgSend(v31, "count");
      v17 = *((_QWORD *)v311 + 23);
      v18 = *((_QWORD *)v311 + 24);
      v29 = &v20;
      v30 = v312;
      __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_0((uint64_t)v312, (uint64_t)v244, (uint64_t)v88, v89, (uint64_t)v79, (uint64_t)v77, (uint64_t)v75, (uint64_t)v73, (uint64_t)v71, (uint64_t)v64, (uint64_t)v62, (uint64_t)v60, (uint64_t)v58, (uint64_t)v56, (uint64_t)v54, (uint64_t)v51, (uint64_t)v49, v42, v41,
        (uint64_t)v37,
        (uint64_t)v35,
        (uint64_t)v33,
        v32,
        (uint64_t)v268,
        v17,
        v18);
      _os_log_impl(&dword_21BF33000, v91, v92[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Beginning a full scan operation with scan ID: %{public}@ (full scan FSM: %p, refresh scan FSM: %p)",
        v30,
        0xFCu);

      if ((v251 & 1) != 0)
      if ((v255 & 1) != 0)

      if ((v257 & 1) != 0)
      if ((v259 & 1) != 0)

      if ((v261 & 1) != 0)
      if ((v263 & 1) != 0)

      objc_storeStrong(&v253, 0);
      objc_storeStrong(&v254, 0);
      objc_storeStrong(&v265, 0);
    }
    objc_storeStrong((id *)&v267, 0);
    *((_BYTE *)v311 + 10) = 0;
    v28 = [SUSettingsScanOperation alloc];
    v27 = -[SUSettingsScanOperation initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:](v28, "initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:", v268, *((_QWORD *)v311 + 28), *((_QWORD *)v311 + 29), *((_QWORD *)v311 + 21));
    v19 = (void *)*((_QWORD *)v311 + 23);
    *((_QWORD *)v311 + 23) = v27;

    v25 = (id)*((_QWORD *)v311 + 23);
    v26 = (id)objc_msgSend(v311, "createScanOperationOptions");
    v23 = v26;
    v24 = &v245;
    v245 = MEMORY[0x24BDAC760];
    v246 = -1073741824;
    v247 = 0;
    v248 = __47__SUSettingsStatefulUIManager_performFullScan___block_invoke_303;
    v249 = &unk_24DFF7F90;
    v21 = (id *)v250;
    v250[0] = v311;
    v22 = (id *)(v24 + 5);
    v250[1] = location[0];
    objc_msgSend(v25, "checkForAvailableUpdatesWithOptions:usingCompletionHandler:", v23, v24);

    objc_storeStrong(v22, 0);
    objc_storeStrong(v21, 0);
    objc_storeStrong(&v268, 0);
    v269 = 0;
  }
  objc_storeStrong(location, 0);
}

uint64_t __47__SUSettingsStatefulUIManager_performFullScan___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentRefreshScanOperation:", 0, a1, a1);
}

void __47__SUSettingsStatefulUIManager_performFullScan___block_invoke_303(id *a1, void *a2, void *a3)
{
  id v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = 0;
  objc_storeStrong(&v5, a3);
  dispatch_assert_queue_V2(*((dispatch_queue_t *)a1[4] + 21));
  if (v5)
  {
    objc_msgSend(a1[5], "setError:", v5);
    objc_msgSend(a1[4], "handleFailedFullScan:", a1[5]);
  }
  else
  {
    objc_msgSend(a1[5], "setFullScanResults:", location[0]);
    objc_msgSend(a1[4], "handleFullScanResults:", a1[5]);
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)performFullScanWithScanResults:(id)a3 andScanError:(id)a4
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  id v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id *v22;
  id v23;
  uint64_t *v24;
  id v25;
  id v26;
  uint64_t v27;
  SUSettingsScanOperation *v28;
  uint64_t *v29;
  uint8_t *v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  const char *v51;
  id v52;
  id v53;
  id v54;
  int v55;
  const char *v56;
  id v57;
  const char *v58;
  int v59;
  const char *v60;
  int v61;
  id v62;
  int v63;
  const __CFString *v64;
  id v65;
  const __CFString *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  const __CFString *v79;
  id v80;
  const __CFString *v81;
  id v82;
  Class v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  uint64_t v89;
  id v90;
  os_log_t v91;
  os_log_type_t v92[4];
  unint64_t v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t *v100;
  uint8_t *v101;
  id v102;
  uint64_t v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  id v118;
  id v119;
  id v120;
  id v121;
  const char *v122;
  id v123;
  id v124;
  id v125;
  int v126;
  const char *v127;
  id v128;
  const char *v129;
  int v130;
  const char *v131;
  int v132;
  id v133;
  int v134;
  const __CFString *v135;
  id v136;
  const __CFString *v137;
  id v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  const __CFString *v150;
  id v151;
  const __CFString *v152;
  id v153;
  Class v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  uint64_t v160;
  id v161;
  os_log_t v162;
  os_log_type_t v163[4];
  unint64_t v164;
  id v165;
  id v166;
  id v167;
  _BOOL4 v168;
  id v169;
  id *v170;
  uint64_t *v171;
  id v172;
  uint64_t *v173;
  uint8_t *buf;
  id v175;
  uint64_t v176;
  id v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  const char *v195;
  id v196;
  id v197;
  id v198;
  int v199;
  const char *v200;
  id v201;
  const char *v202;
  int v203;
  const char *v204;
  int v205;
  id v206;
  int v207;
  const __CFString *v208;
  id v209;
  const __CFString *v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  id v221;
  id v222;
  const __CFString *v223;
  id v224;
  const __CFString *v225;
  id v226;
  Class aClass;
  id v228;
  id v229;
  id v230;
  id v231;
  id v232;
  uint64_t v233;
  id v234;
  os_log_t log;
  os_log_type_t v236[4];
  unint64_t v237;
  id v238;
  id v239;
  id v240;
  _BOOL4 v241;
  id v242;
  id v243;
  id obj;
  const char *v245;
  uint64_t v246;
  int v247;
  int v248;
  void (*v249)(id *, void *, void *);
  void *v250;
  id v251;
  char v252;
  id v253;
  id v254;
  id v255;
  char v256;
  id v257;
  char v258;
  id v259;
  char v260;
  id v261;
  char v262;
  id v263;
  char v264;
  id v265;
  id v266;
  os_log_type_t v267;
  os_log_t v268;
  id v269;
  int v270;
  char v271;
  id v272;
  id v273;
  id v274;
  char v275;
  id v276;
  char v277;
  id v278;
  char v279;
  id v280;
  char v281;
  id v282;
  char v283;
  id v284;
  id v285;
  os_log_type_t v286;
  os_log_t v287;
  uint64_t v288;
  int v289;
  int v290;
  uint64_t (*v291)(uint64_t);
  void *v292;
  id v293;
  char v294;
  id v295;
  id v296;
  id v297;
  char v298;
  id v299;
  char v300;
  id v301;
  char v302;
  id v303;
  char v304;
  id v305;
  char v306;
  id v307;
  id v308;
  os_log_type_t type;
  os_log_t oslog;
  id v311;
  id location[2];
  id v313;
  _BYTE v314[272];
  _BYTE v315[224];
  _BYTE v316[224];
  uint64_t v317;

  obj = a4;
  v245 = "-[SUSettingsStatefulUIManager performFullScanWithScanResults:andScanError:]";
  v317 = *MEMORY[0x24BDAC8D0];
  v313 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v311 = 0;
  objc_storeStrong(&v311, obj);
  v242 = *((id *)v313 + 27);
  objc_sync_enter(v242);
  v243 = (id)objc_msgSend(v313, "currentRefreshScanOperation");
  v4 = v243;
  v241 = v4 == 0;

  if (!v241)
  {
    v240 = (id)objc_msgSend(v313, "log");
    v238 = v240;
    v239 = (id)objc_msgSend(v238, "oslog");
    oslog = (os_log_t)v239;

    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      *(_DWORD *)v236 = type;
      v237 = objc_msgSend(v313, "currentState");
      v234 = SUSettingsUIStateToString(v237);
      v231 = v234;
      v232 = v231;
      v308 = v232;
      v233 = objc_msgSend(v313, "currentState");
      v306 = 0;
      v304 = 0;
      v230 = (id)objc_msgSend(v313, "delegate");
      v229 = v230;
      if (v229)
      {
        v228 = (id)objc_msgSend(v313, "delegate");
        v307 = v228;
        v306 = 1;
        aClass = (Class)objc_opt_class();
        v226 = NSStringFromClass(aClass);
        v305 = v226;
        v304 = 1;
        v225 = (const __CFString *)v305;
      }
      else
      {
        v225 = CFSTR("(null)");
      }
      v223 = v225;
      v224 = (id)objc_msgSend(v313, "delegate");
      v221 = v224;
      v222 = (id)objc_msgSend(v313, "scanError");
      v219 = v222;
      v220 = (id)objc_msgSend(v313, "preferredStatefulDescriptor");
      v217 = v220;
      v218 = (id)objc_msgSend(v313, "alternateStatefulDescriptor");
      v215 = v218;
      v302 = 0;
      v300 = 0;
      v298 = 0;
      v216 = (id)objc_msgSend(v313, "currentDownload");
      v214 = v216;
      if (v214)
      {
        v213 = (id)objc_msgSend(v313, "currentDownload");
        v303 = v213;
        v302 = 1;
        v212 = (id)objc_msgSend(v303, "descriptor");
        v301 = v212;
        v300 = 1;
        v211 = (id)objc_msgSend(v301, "humanReadableUpdateName");
        v299 = v211;
        v298 = 1;
        v210 = (const __CFString *)v299;
      }
      else
      {
        v210 = CFSTR("(null)");
      }
      v208 = v210;
      v209 = (id)objc_msgSend(v313, "currentDownload");
      v206 = v209;
      v207 = objc_msgSend(v313, "performThirdPartyScan");
      v5 = "YES";
      if ((v207 & 1) == 0)
        v5 = "NO";
      v204 = v5;
      v205 = objc_msgSend(v313, "isTargetedUpdateScheduledForAutoInstall");
      v6 = "YES";
      if ((v205 & 1) == 0)
        v6 = "NO";
      v202 = v6;
      v203 = objc_msgSend(v313, "hidingPreferredDescriptor");
      v7 = "YES";
      if ((v203 & 1) == 0)
        v7 = "NO";
      v200 = v7;
      v201 = (id)objc_msgSend(*((id *)v313 + 32), "humanReadableUpdateName");
      v197 = v201;
      v198 = v197;
      v297 = v198;
      v199 = objc_msgSend(v313, "hidingAlternateDescriptor");
      v8 = "YES";
      if ((v199 & 1) == 0)
        v8 = "NO";
      v195 = v8;
      v196 = (id)objc_msgSend(*((id *)v313 + 33), "humanReadableUpdateName");
      v192 = v196;
      v193 = v192;
      v296 = v193;
      v294 = 0;
      v194 = (id)objc_msgSend(v313, "enrolledBetaProgram");
      v191 = v194;
      if (v191)
      {
        v190 = (id)objc_msgSend(v313, "enrolledBetaProgram");
        v295 = v190;
        v294 = 1;
        v189 = objc_msgSend(v295, "programID");
        v188 = v189;
      }
      else
      {
        v188 = 0;
      }
      v186 = v188;
      v187 = (id)objc_msgSend(v313, "betaPrograms");
      v184 = v187;
      v185 = objc_msgSend(v184, "count");
      v183 = (id)objc_msgSend(v313, "currentFullScanOperation");
      v181 = v183;
      v182 = (id)objc_msgSend(v313, "currentRefreshScanOperation");
      v179 = v182;
      v180 = (id)objc_msgSend(v313, "currentUpdateOperation");
      v177 = v180;
      v178 = (id)objc_msgSend(v313, "auxiliaryOperations");
      v175 = v178;
      v176 = objc_msgSend(v175, "count");
      v173 = &v21;
      buf = v316;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v316, (uint64_t)v245, (uint64_t)v232, v233, (uint64_t)v223, (uint64_t)v221, (uint64_t)v219, (uint64_t)v217, (uint64_t)v215, (uint64_t)v208, (uint64_t)v206, (uint64_t)v204, (uint64_t)v202, (uint64_t)v200, (uint64_t)v198, (uint64_t)v195, (uint64_t)v193, v188, v185,
        (uint64_t)v181,
        (uint64_t)v179,
        (uint64_t)v177,
        v176);
      _os_log_impl(&dword_21BF33000, log, v236[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A refresh operation is currently running. Canceling it as we start a full-scan.",
        buf,
        0xDEu);

      if ((v294 & 1) != 0)
      if ((v298 & 1) != 0)

      if ((v300 & 1) != 0)
      if ((v302 & 1) != 0)

      if ((v304 & 1) != 0)
      if ((v306 & 1) != 0)

      objc_storeStrong(&v296, 0);
      objc_storeStrong(&v297, 0);
      objc_storeStrong(&v308, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v172 = (id)*((_QWORD *)v313 + 24);
    v171 = &v288;
    v288 = MEMORY[0x24BDAC760];
    v289 = -1073741824;
    v290 = 0;
    v291 = __75__SUSettingsStatefulUIManager_performFullScanWithScanResults_andScanError___block_invoke;
    v292 = &unk_24DFF7B58;
    v170 = &v293;
    v293 = v313;
    objc_msgSend(v172, "cancel:", v171);
    objc_storeStrong(v170, 0);
  }
  v169 = (id)objc_msgSend(v313, "currentFullScanOperation");
  v9 = v169;
  v168 = v9 == 0;

  if (v168)
  {
    v270 = 0;
  }
  else
  {
    v167 = (id)objc_msgSend(v313, "log");
    v165 = v167;
    v166 = (id)objc_msgSend(v165, "oslog");
    v287 = (os_log_t)v166;

    v286 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT))
    {
      v162 = v287;
      *(_DWORD *)v163 = v286;
      v164 = objc_msgSend(v313, "currentState");
      v161 = SUSettingsUIStateToString(v164);
      v158 = v161;
      v159 = v158;
      v285 = v159;
      v160 = objc_msgSend(v313, "currentState");
      v283 = 0;
      v281 = 0;
      v157 = (id)objc_msgSend(v313, "delegate");
      v156 = v157;
      if (v156)
      {
        v155 = (id)objc_msgSend(v313, "delegate");
        v284 = v155;
        v283 = 1;
        v154 = (Class)objc_opt_class();
        v153 = NSStringFromClass(v154);
        v282 = v153;
        v281 = 1;
        v152 = (const __CFString *)v282;
      }
      else
      {
        v152 = CFSTR("(null)");
      }
      v150 = v152;
      v151 = (id)objc_msgSend(v313, "delegate");
      v148 = v151;
      v149 = (id)objc_msgSend(v313, "scanError");
      v146 = v149;
      v147 = (id)objc_msgSend(v313, "preferredStatefulDescriptor");
      v144 = v147;
      v145 = (id)objc_msgSend(v313, "alternateStatefulDescriptor");
      v142 = v145;
      v279 = 0;
      v277 = 0;
      v275 = 0;
      v143 = (id)objc_msgSend(v313, "currentDownload");
      v141 = v143;
      if (v141)
      {
        v140 = (id)objc_msgSend(v313, "currentDownload");
        v280 = v140;
        v279 = 1;
        v139 = (id)objc_msgSend(v280, "descriptor");
        v278 = v139;
        v277 = 1;
        v138 = (id)objc_msgSend(v278, "humanReadableUpdateName");
        v276 = v138;
        v275 = 1;
        v137 = (const __CFString *)v276;
      }
      else
      {
        v137 = CFSTR("(null)");
      }
      v135 = v137;
      v136 = (id)objc_msgSend(v313, "currentDownload");
      v133 = v136;
      v134 = objc_msgSend(v313, "performThirdPartyScan");
      v10 = "YES";
      if ((v134 & 1) == 0)
        v10 = "NO";
      v131 = v10;
      v132 = objc_msgSend(v313, "isTargetedUpdateScheduledForAutoInstall");
      v11 = "YES";
      if ((v132 & 1) == 0)
        v11 = "NO";
      v129 = v11;
      v130 = objc_msgSend(v313, "hidingPreferredDescriptor");
      v12 = "YES";
      if ((v130 & 1) == 0)
        v12 = "NO";
      v127 = v12;
      v128 = (id)objc_msgSend(*((id *)v313 + 32), "humanReadableUpdateName");
      v124 = v128;
      v125 = v124;
      v274 = v125;
      v126 = objc_msgSend(v313, "hidingAlternateDescriptor");
      v13 = "YES";
      if ((v126 & 1) == 0)
        v13 = "NO";
      v122 = v13;
      v123 = (id)objc_msgSend(*((id *)v313 + 33), "humanReadableUpdateName");
      v119 = v123;
      v120 = v119;
      v273 = v120;
      v271 = 0;
      v121 = (id)objc_msgSend(v313, "enrolledBetaProgram");
      v118 = v121;
      if (v118)
      {
        v117 = (id)objc_msgSend(v313, "enrolledBetaProgram");
        v272 = v117;
        v271 = 1;
        v116 = objc_msgSend(v272, "programID");
        v115 = v116;
      }
      else
      {
        v115 = 0;
      }
      v113 = v115;
      v114 = (id)objc_msgSend(v313, "betaPrograms");
      v111 = v114;
      v112 = objc_msgSend(v111, "count");
      v110 = (id)objc_msgSend(v313, "currentFullScanOperation");
      v108 = v110;
      v109 = (id)objc_msgSend(v313, "currentRefreshScanOperation");
      v106 = v109;
      v107 = (id)objc_msgSend(v313, "currentUpdateOperation");
      v104 = v107;
      v105 = (id)objc_msgSend(v313, "auxiliaryOperations");
      v102 = v105;
      v103 = objc_msgSend(v102, "count");
      v100 = &v21;
      v101 = v315;
      __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v315, (uint64_t)v245, (uint64_t)v159, v160, (uint64_t)v150, (uint64_t)v148, (uint64_t)v146, (uint64_t)v144, (uint64_t)v142, (uint64_t)v135, (uint64_t)v133, (uint64_t)v131, (uint64_t)v129, (uint64_t)v127, (uint64_t)v125, (uint64_t)v122, (uint64_t)v120, v113, v112,
        (uint64_t)v108,
        (uint64_t)v106,
        (uint64_t)v104,
        v103);
      _os_log_impl(&dword_21BF33000, v162, v163[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "A full-scan operation is already running. Skipping on this full-scan request.",
        v101,
        0xDEu);

      if ((v271 & 1) != 0)
      if ((v275 & 1) != 0)

      if ((v277 & 1) != 0)
      if ((v279 & 1) != 0)

      if ((v281 & 1) != 0)
      if ((v283 & 1) != 0)

      objc_storeStrong(&v273, 0);
      objc_storeStrong(&v274, 0);
      objc_storeStrong(&v285, 0);
    }
    objc_storeStrong((id *)&v287, 0);
    v270 = 1;
  }
  objc_sync_exit(v242);

  if (!v270)
  {
    v99 = (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v97 = v99;
    v98 = (id)objc_msgSend(v97, "UUIDString");
    v269 = v98;

    v96 = (id)objc_msgSend(v313, "log");
    v94 = v96;
    v95 = (id)objc_msgSend(v94, "oslog");
    v268 = (os_log_t)v95;

    v267 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v268, OS_LOG_TYPE_DEFAULT))
    {
      v91 = v268;
      *(_DWORD *)v92 = v267;
      v93 = objc_msgSend(v313, "currentState");
      v90 = SUSettingsUIStateToString(v93);
      v87 = v90;
      v88 = v87;
      v266 = v88;
      v89 = objc_msgSend(v313, "currentState");
      v86 = (id)objc_msgSend(v313, "delegate");
      v85 = v86;
      v264 = 0;
      v262 = 0;
      if (v85)
      {
        v84 = (id)objc_msgSend(v313, "delegate");
        v265 = v84;
        v264 = 1;
        v83 = (Class)objc_opt_class();
        v82 = NSStringFromClass(v83);
        v263 = v82;
        v262 = 1;
        v81 = (const __CFString *)v263;
      }
      else
      {
        v81 = CFSTR("(null)");
      }
      v79 = v81;
      v80 = (id)objc_msgSend(v313, "delegate");
      v77 = v80;
      v78 = (id)objc_msgSend(v313, "scanError");
      v75 = v78;
      v76 = (id)objc_msgSend(v313, "preferredStatefulDescriptor");
      v73 = v76;
      v74 = (id)objc_msgSend(v313, "alternateStatefulDescriptor");
      v71 = v74;
      v72 = (id)objc_msgSend(v313, "currentDownload");
      v70 = v72;
      v260 = 0;
      v258 = 0;
      v256 = 0;
      if (v70)
      {
        v69 = (id)objc_msgSend(v313, "currentDownload");
        v261 = v69;
        v260 = 1;
        v68 = (id)objc_msgSend(v261, "descriptor");
        v259 = v68;
        v258 = 1;
        v67 = (id)objc_msgSend(v259, "humanReadableUpdateName");
        v257 = v67;
        v256 = 1;
        v66 = (const __CFString *)v257;
      }
      else
      {
        v66 = CFSTR("(null)");
      }
      v64 = v66;
      v65 = (id)objc_msgSend(v313, "currentDownload");
      v62 = v65;
      v63 = objc_msgSend(v313, "performThirdPartyScan");
      v14 = "YES";
      if ((v63 & 1) == 0)
        v14 = "NO";
      v60 = v14;
      v61 = objc_msgSend(v313, "isTargetedUpdateScheduledForAutoInstall");
      v15 = "YES";
      if ((v61 & 1) == 0)
        v15 = "NO";
      v58 = v15;
      v59 = objc_msgSend(v313, "hidingPreferredDescriptor");
      v16 = "YES";
      if ((v59 & 1) == 0)
        v16 = "NO";
      v56 = v16;
      v57 = (id)objc_msgSend(*((id *)v313 + 32), "humanReadableUpdateName");
      v53 = v57;
      v54 = v53;
      v255 = v54;
      v55 = objc_msgSend(v313, "hidingAlternateDescriptor");
      v17 = "YES";
      if ((v55 & 1) == 0)
        v17 = "NO";
      v51 = v17;
      v52 = (id)objc_msgSend(*((id *)v313 + 33), "humanReadableUpdateName");
      v48 = v52;
      v49 = v48;
      v254 = v49;
      v50 = (id)objc_msgSend(v313, "enrolledBetaProgram");
      v47 = v50;
      v252 = 0;
      if (v47)
      {
        v46 = (id)objc_msgSend(v313, "enrolledBetaProgram");
        v253 = v46;
        v252 = 1;
        v45 = objc_msgSend(v253, "programID");
        v44 = v45;
      }
      else
      {
        v44 = 0;
      }
      v42 = v44;
      v43 = (id)objc_msgSend(v313, "betaPrograms");
      v40 = v43;
      v41 = objc_msgSend(v40, "count");
      v39 = (id)objc_msgSend(v313, "currentFullScanOperation");
      v37 = v39;
      v38 = (id)objc_msgSend(v313, "currentRefreshScanOperation");
      v35 = v38;
      v36 = (id)objc_msgSend(v313, "currentUpdateOperation");
      v33 = v36;
      v34 = (id)objc_msgSend(v313, "auxiliaryOperations");
      v31 = v34;
      v32 = objc_msgSend(v31, "count");
      v18 = *((_QWORD *)v313 + 23);
      v19 = *((_QWORD *)v313 + 24);
      v29 = &v21;
      v30 = v314;
      __os_log_helper_16_2_27_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66_8_0_8_0((uint64_t)v314, (uint64_t)v245, (uint64_t)v88, v89, (uint64_t)v79, (uint64_t)v77, (uint64_t)v75, (uint64_t)v73, (uint64_t)v71, (uint64_t)v64, (uint64_t)v62, (uint64_t)v60, (uint64_t)v58, (uint64_t)v56, (uint64_t)v54, (uint64_t)v51, (uint64_t)v49, v42, v41,
        (uint64_t)v37,
        (uint64_t)v35,
        (uint64_t)v33,
        v32,
        (uint64_t)location[0],
        (uint64_t)v311,
        (uint64_t)v269,
        v18,
        v19);
      _os_log_impl(&dword_21BF33000, v91, v92[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "Beginning a full scan operation with with existing scan results (results: %p, error: %{public}@), usoing scan ID"
        ": %{public}@ (full scan FSM: %p, refresh scan FSM: %p)",
        v30,
        0x110u);

      if ((v252 & 1) != 0)
      if ((v256 & 1) != 0)

      if ((v258 & 1) != 0)
      if ((v260 & 1) != 0)

      if ((v262 & 1) != 0)
      if ((v264 & 1) != 0)

      objc_storeStrong(&v254, 0);
      objc_storeStrong(&v255, 0);
      objc_storeStrong(&v266, 0);
    }
    objc_storeStrong((id *)&v268, 0);
    *((_BYTE *)v313 + 10) = 0;
    v28 = [SUSettingsScanOperation alloc];
    v27 = -[SUSettingsScanOperation initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:](v28, "initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:", v269, *((_QWORD *)v313 + 28), *((_QWORD *)v313 + 29), *((_QWORD *)v313 + 21));
    v20 = (void *)*((_QWORD *)v313 + 23);
    *((_QWORD *)v313 + 23) = v27;

    v25 = (id)*((_QWORD *)v313 + 23);
    v26 = (id)objc_msgSend(v313, "createScanOperationOptions");
    v23 = v26;
    v24 = &v246;
    v246 = MEMORY[0x24BDAC760];
    v247 = -1073741824;
    v248 = 0;
    v249 = __75__SUSettingsStatefulUIManager_performFullScanWithScanResults_andScanError___block_invoke_305;
    v250 = &unk_24DFF7FB8;
    v22 = &v251;
    v251 = v313;
    objc_msgSend(v25, "checkForAvailableUpdatesWithOptions:usingCompletionHandler:usingThirdPartyScanResults:andScanError:", v23, v24, location[0], v311);

    objc_storeStrong(v22, 0);
    objc_storeStrong(&v269, 0);
    v270 = 0;
  }
  objc_storeStrong(&v311, 0);
  objc_storeStrong(location, 0);
}

uint64_t __75__SUSettingsStatefulUIManager_performFullScanWithScanResults_andScanError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentRefreshScanOperation:", 0, a1, a1);
}

void __75__SUSettingsStatefulUIManager_performFullScanWithScanResults_andScanError___block_invoke_305(id *a1, void *a2, void *a3)
{
  SUSettingsStatefulUIManagerFSMParam *v5;
  id v6[2];
  id v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  v6[1] = a1;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)a1[4] + 21));
  if (v7)
  {
    v5 = objc_alloc_init(SUSettingsStatefulUIManagerFSMParam);
    -[SUSettingsStatefulUIManagerFSMParam setError:](v5, "setError:", v7);
    objc_msgSend(a1[4], "handleFailedFullScan:", v5);
    objc_storeStrong((id *)&v5, 0);
  }
  else
  {
    v6[0] = objc_alloc_init(SUSettingsStatefulUIManagerFSMParam);
    objc_msgSend(v6[0], "setFullScanResults:", location[0]);
    objc_msgSend(a1[4], "handleFullScanResults:", v6[0]);
    objc_storeStrong(v6, 0);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)performRefreshScan:(id)a3
{
  objc_class *v3;
  char v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SUSettingsScanOperation *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id *v26;
  id *v27;
  id *v28;
  id *v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint8_t *buf;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  const __CFString *v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  id v52;
  id v53;
  int v54;
  id v55;
  int v56;
  const __CFString *v57;
  const __CFString *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  int v64;
  const __CFString *v65;
  os_log_t log;
  os_log_type_t v67[4];
  id v68;
  id v69;
  uint64_t v70;
  id v71;
  id v72;
  const char *v73;
  id v74;
  uint64_t v75;
  int v76;
  int v77;
  void (*v78)(id *, void *, void *);
  void *v79;
  _QWORD v80[2];
  char v81;
  id v82;
  id v83;
  id v84;
  char v85;
  id v86;
  char v87;
  id v88;
  char v89;
  id v90;
  char v91;
  id v92;
  char v93;
  id v94;
  id v95;
  os_log_type_t type;
  os_log_t oslog;
  id v98;
  id location[2];
  id v100;
  _BYTE v101[264];
  uint64_t v102;

  v73 = "-[SUSettingsStatefulUIManager performRefreshScan:]";
  v102 = *MEMORY[0x24BDAC8D0];
  v100 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v74 = (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v98 = (id)objc_msgSend(v74, "UUIDString");

  v72 = (id)objc_msgSend(v100, "log");
  oslog = (os_log_t)(id)objc_msgSend(v72, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v67 = type;
    v68 = SUSettingsUIStateToString(objc_msgSend(v100, "currentState"));
    v69 = v68;
    v95 = v69;
    v70 = objc_msgSend(v100, "currentState");
    v71 = (id)objc_msgSend(v100, "delegate");
    v93 = 0;
    v91 = 0;
    if (v71)
    {
      v94 = (id)objc_msgSend(v100, "delegate");
      v64 = 1;
      v93 = 1;
      v3 = (objc_class *)objc_opt_class();
      v92 = NSStringFromClass(v3);
      v91 = 1;
      v65 = (const __CFString *)v92;
    }
    else
    {
      v65 = CFSTR("(null)");
    }
    v58 = v65;
    v59 = (id)objc_msgSend(v100, "delegate");
    v60 = (id)objc_msgSend(v100, "scanError");
    v61 = (id)objc_msgSend(v100, "preferredStatefulDescriptor");
    v62 = (id)objc_msgSend(v100, "alternateStatefulDescriptor");
    v63 = (id)objc_msgSend(v100, "currentDownload");
    v89 = 0;
    v87 = 0;
    v85 = 0;
    if (v63)
    {
      v90 = (id)objc_msgSend(v100, "currentDownload");
      v56 = 1;
      v89 = 1;
      v88 = (id)objc_msgSend(v90, "descriptor");
      v87 = 1;
      v86 = (id)objc_msgSend(v88, "humanReadableUpdateName");
      v85 = 1;
      v57 = (const __CFString *)v86;
    }
    else
    {
      v57 = CFSTR("(null)");
    }
    v42 = v57;
    v43 = (id)objc_msgSend(v100, "currentDownload");
    v4 = objc_msgSend(v100, "performThirdPartyScan");
    v49 = "NO";
    v5 = "YES";
    v50 = "YES";
    v54 = 1;
    if ((v4 & 1) == 0)
      v5 = "NO";
    v44 = v5;
    v6 = objc_msgSend(v100, "isTargetedUpdateScheduledForAutoInstall");
    v7 = (uint64_t)v50;
    if ((v6 & 1) == 0)
      v7 = (uint64_t)v49;
    v45 = v7;
    v8 = objc_msgSend(v100, "hidingPreferredDescriptor");
    v9 = (uint64_t)v50;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v49;
    v46 = v9;
    v47 = (id)objc_msgSend(*((id *)v100 + 32), "humanReadableUpdateName");
    v48 = v47;
    v84 = v48;
    v10 = objc_msgSend(v100, "hidingAlternateDescriptor");
    v11 = (uint64_t)v50;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v49;
    v51 = v11;
    v52 = (id)objc_msgSend(*((id *)v100 + 33), "humanReadableUpdateName");
    v53 = v52;
    v83 = v53;
    v55 = (id)objc_msgSend(v100, "enrolledBetaProgram");
    v81 = 0;
    if (v55)
    {
      v82 = (id)objc_msgSend(v100, "enrolledBetaProgram");
      v81 = 1;
      v41 = objc_msgSend(v82, "programID");
    }
    else
    {
      v41 = 0;
    }
    v32 = v41;
    v40 = (id)objc_msgSend(v100, "betaPrograms");
    v33 = objc_msgSend(v40, "count");
    v39 = (id)objc_msgSend(v100, "currentFullScanOperation");
    v38 = (id)objc_msgSend(v100, "currentRefreshScanOperation");
    v37 = (id)objc_msgSend(v100, "currentUpdateOperation");
    v36 = (id)objc_msgSend(v100, "auxiliaryOperations");
    v12 = objc_msgSend(v36, "count");
    v13 = *((_QWORD *)v100 + 23);
    v14 = *((_QWORD *)v100 + 24);
    v34 = &v18;
    buf = v101;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_0_8_0((uint64_t)v101, (uint64_t)v73, (uint64_t)v69, v70, (uint64_t)v58, (uint64_t)v59, (uint64_t)v60, (uint64_t)v61, (uint64_t)v62, (uint64_t)v42, (uint64_t)v43, (uint64_t)v44, v45, v46, (uint64_t)v48, v51, (uint64_t)v53, v41, v33,
      (uint64_t)v39,
      (uint64_t)v38,
      (uint64_t)v37,
      v12,
      (uint64_t)v98,
      v13,
      v14);
    _os_log_impl(&dword_21BF33000, log, v67[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Beginning to refresh the current scan results with scan ID: %{public}@ (full scan FSM: %p, refresh scan FSM: %p)",
      buf,
      0xFCu);

    if ((v81 & 1) != 0)
    if ((v85 & 1) != 0)

    if ((v87 & 1) != 0)
    if ((v89 & 1) != 0)

    if ((v91 & 1) != 0)
    if ((v93 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v83, 0);
    objc_storeStrong(&v84, obj);
    objc_storeStrong(&v95, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  v15 = [SUSettingsScanOperation alloc];
  v28 = &v98;
  v16 = -[SUSettingsScanOperation initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:](v15, "initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:", v98, *((_QWORD *)v100 + 28), *((_QWORD *)v100 + 29), *((_QWORD *)v100 + 21));
  v17 = (void *)*((_QWORD *)v100 + 24);
  *((_QWORD *)v100 + 24) = v16;

  *((_BYTE *)v100 + 10) = 0;
  v20 = (id)*((_QWORD *)v100 + 24);
  v25 = (id)objc_msgSend(v100, "preferredStatefulDescriptor");
  v24 = (id)objc_msgSend(v25, "descriptor");
  v23 = (id)objc_msgSend(v100, "alternateStatefulDescriptor");
  v22 = (id)objc_msgSend(v23, "descriptor");
  v21 = (id)objc_msgSend(v100, "createScanOperationOptions");
  v19 = &v75;
  v75 = MEMORY[0x24BDAC760];
  v76 = -1073741824;
  v77 = 0;
  v78 = __50__SUSettingsStatefulUIManager_performRefreshScan___block_invoke;
  v79 = &unk_24DFF7FE0;
  v27 = (id *)v80;
  v80[0] = v100;
  v26 = (id *)(v19 + 5);
  v29 = location;
  v80[1] = location[0];
  objc_msgSend(v20, "refreshScanResultsWithPreferredUpdate:alternateUpdate:options:completionHandler:", v24, v22, v21, v19);

  v30 = 0;
  objc_storeStrong(v26, 0);
  objc_storeStrong(v27, v30);
  objc_storeStrong(v28, v30);
  objc_storeStrong(v29, v30);
}

void __50__SUSettingsStatefulUIManager_performRefreshScan___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = 0;
  objc_storeStrong(&v5, a3);
  dispatch_assert_queue_V2(*((dispatch_queue_t *)a1[4] + 21));
  if (v5)
  {
    objc_storeStrong((id *)a1[4] + 12, v5);
    objc_msgSend(a1[5], "setError:", v5);
    objc_msgSend(*((id *)a1[4] + 27), "postEvent:withInfo:", CFSTR("RefreshScanResultsFailed"), a1[5]);
  }
  else
  {
    objc_msgSend(a1[5], "setRefreshScanResults:", location[0]);
    objc_msgSend(a1[4], "handleRefreshScanResults:", a1[5]);
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)handleFullScanResults:(id)a3
{
  objc_class *v3;
  char v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  objc_class *v13;
  char v14;
  const char *v15;
  char v16;
  const char *v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  char v28;
  char v29;
  char v30;
  int v31;
  objc_class *v32;
  char v33;
  const char *v34;
  char v35;
  const char *v36;
  char v37;
  const char *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  char v51;
  char v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  char v63;
  id v64;
  uint64_t v65;
  id v66;
  id v67;
  _BOOL4 v68;
  _BOOL4 v69;
  id v70;
  _BOOL4 v71;
  os_log_t v72;
  os_log_type_t v73[4];
  uint8_t *v74;
  id v75;
  int v76;
  id v77;
  int v78;
  uint64_t *v79;
  id v80;
  id *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t *v87;
  uint8_t *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  uint64_t v98;
  const __CFString *v99;
  id v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  id v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  id v109;
  id v110;
  int v111;
  id v112;
  int v113;
  const __CFString *v114;
  const __CFString *v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  int v121;
  const __CFString *v122;
  os_log_t v123;
  os_log_type_t v124[4];
  id v125;
  id v126;
  uint64_t v127;
  id v128;
  id v129;
  int v130;
  id v131;
  int v132;
  id v133;
  int v134;
  id v135;
  int v136;
  id v137;
  id v138;
  uint64_t *v139;
  id v140;
  id *v141;
  id v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t *v145;
  uint8_t *v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  uint64_t v152;
  const __CFString *v153;
  id v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  id v158;
  id v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  id v163;
  id v164;
  int v165;
  id v166;
  int v167;
  const __CFString *v168;
  const __CFString *v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  int v175;
  const __CFString *v176;
  os_log_t v177;
  os_log_type_t v178[4];
  id v179;
  id v180;
  uint64_t v181;
  id v182;
  id v183;
  _BOOL4 v184;
  _BOOL4 v185;
  id obj;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t *v190;
  uint8_t *buf;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  uint64_t v198;
  const __CFString *v199;
  id v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  id v204;
  id v205;
  const char *v206;
  const char *v207;
  uint64_t v208;
  id v209;
  id v210;
  int v211;
  id v212;
  int v213;
  const __CFString *v214;
  const __CFString *v215;
  id v216;
  id v217;
  id v218;
  id v219;
  id v220;
  int v221;
  const __CFString *v222;
  os_log_t log;
  os_log_type_t v224[4];
  id v225;
  id v226;
  uint64_t v227;
  id v228;
  id v229;
  const char *v230;
  int v231;
  os_log_type_t v232;
  os_log_t v233;
  uint64_t v234;
  int v235;
  int v236;
  void (*v237)(uint64_t);
  void *v238;
  id v239;
  id v240;
  id v241;
  char v242;
  id v243;
  id v244;
  id v245;
  char v246;
  id v247;
  char v248;
  id v249;
  char v250;
  id v251;
  char v252;
  id v253;
  char v254;
  id v255;
  id v256;
  os_log_type_t v257;
  os_log_t v258;
  char v259;
  id v260;
  char v261;
  id v262;
  char v263;
  id v264;
  uint64_t v265;
  int v266;
  int v267;
  void (*v268)(uint64_t);
  void *v269;
  id v270;
  char v271;
  id v272;
  id v273;
  id v274;
  char v275;
  id v276;
  char v277;
  id v278;
  char v279;
  id v280;
  char v281;
  id v282;
  char v283;
  id v284;
  id v285;
  os_log_type_t v286;
  os_log_t v287;
  char v288;
  id v289;
  char v290;
  id v291;
  id v292;
  id v293;
  char v294;
  id v295;
  char v296;
  id v297;
  char v298;
  id v299;
  char v300;
  id v301;
  char v302;
  id v303;
  id v304;
  os_log_type_t type;
  os_log_t oslog;
  id v307;
  id location[2];
  id v309;
  _BYTE v310[16];
  _BYTE v311[256];
  _BYTE v312[224];
  _BYTE v313[248];
  uint64_t v314;

  v230 = "-[SUSettingsStatefulUIManager handleFullScanResults:]";
  v314 = *MEMORY[0x24BDAC8D0];
  v309 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v307 = (id)objc_msgSend(location[0], "fullScanResults");
  v229 = (id)objc_msgSend(v309, "log");
  oslog = (os_log_t)(id)objc_msgSend(v229, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v224 = type;
    v225 = SUSettingsUIStateToString(objc_msgSend(v309, "currentState"));
    v226 = v225;
    v304 = v226;
    v227 = objc_msgSend(v309, "currentState");
    v228 = (id)objc_msgSend(v309, "delegate");
    v302 = 0;
    v300 = 0;
    if (v228)
    {
      v303 = (id)objc_msgSend(v309, "delegate");
      v221 = 1;
      v302 = 1;
      v3 = (objc_class *)objc_opt_class();
      v301 = NSStringFromClass(v3);
      v300 = 1;
      v222 = (const __CFString *)v301;
    }
    else
    {
      v222 = CFSTR("(null)");
    }
    v215 = v222;
    v216 = (id)objc_msgSend(v309, "delegate");
    v217 = (id)objc_msgSend(v309, "scanError");
    v218 = (id)objc_msgSend(v309, "preferredStatefulDescriptor");
    v219 = (id)objc_msgSend(v309, "alternateStatefulDescriptor");
    v220 = (id)objc_msgSend(v309, "currentDownload");
    v298 = 0;
    v296 = 0;
    v294 = 0;
    if (v220)
    {
      v299 = (id)objc_msgSend(v309, "currentDownload");
      v213 = 1;
      v298 = 1;
      v297 = (id)objc_msgSend(v299, "descriptor");
      v296 = 1;
      v295 = (id)objc_msgSend(v297, "humanReadableUpdateName");
      v294 = 1;
      v214 = (const __CFString *)v295;
    }
    else
    {
      v214 = CFSTR("(null)");
    }
    v199 = v214;
    v200 = (id)objc_msgSend(v309, "currentDownload");
    v4 = objc_msgSend(v309, "performThirdPartyScan");
    v206 = "NO";
    v5 = "YES";
    v207 = "YES";
    v211 = 1;
    if ((v4 & 1) == 0)
      v5 = "NO";
    v201 = v5;
    v6 = objc_msgSend(v309, "isTargetedUpdateScheduledForAutoInstall");
    v7 = (uint64_t)v207;
    if ((v6 & 1) == 0)
      v7 = (uint64_t)v206;
    v202 = v7;
    v8 = objc_msgSend(v309, "hidingPreferredDescriptor");
    v9 = (uint64_t)v207;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v206;
    v203 = v9;
    v204 = (id)objc_msgSend(*((id *)v309 + 32), "humanReadableUpdateName");
    v205 = v204;
    v293 = v205;
    v10 = objc_msgSend(v309, "hidingAlternateDescriptor");
    v11 = (uint64_t)v207;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v206;
    v208 = v11;
    v209 = (id)objc_msgSend(*((id *)v309 + 33), "humanReadableUpdateName");
    v210 = v209;
    v292 = v210;
    v212 = (id)objc_msgSend(v309, "enrolledBetaProgram");
    v290 = 0;
    if (v212)
    {
      v291 = (id)objc_msgSend(v309, "enrolledBetaProgram");
      v290 = 1;
      v198 = objc_msgSend(v291, "programID");
    }
    else
    {
      v198 = 0;
    }
    v187 = v198;
    v197 = (id)objc_msgSend(v309, "betaPrograms");
    v188 = objc_msgSend(v197, "count");
    v196 = (id)objc_msgSend(v309, "currentFullScanOperation");
    v195 = (id)objc_msgSend(v309, "currentRefreshScanOperation");
    v194 = (id)objc_msgSend(v309, "currentUpdateOperation");
    v193 = (id)objc_msgSend(v309, "auxiliaryOperations");
    v189 = objc_msgSend(v193, "count");
    v192 = (id)objc_msgSend(v307, "scanUUID");
    v190 = &v65;
    buf = v313;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66((uint64_t)v313, (uint64_t)v230, (uint64_t)v226, v227, (uint64_t)v215, (uint64_t)v216, (uint64_t)v217, (uint64_t)v218, (uint64_t)v219, (uint64_t)v199, (uint64_t)v200, (uint64_t)v201, v202, v203, (uint64_t)v205, v208, (uint64_t)v210, v198, v188,
      (uint64_t)v196,
      (uint64_t)v195,
      (uint64_t)v194,
      v189,
      (uint64_t)v192,
      (uint64_t)v307);
    _os_log_impl(&dword_21BF33000, log, v224[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform a full-scan with ID: %{public}@.\n"
      "Results: %{public}@",
      buf,
      0xF2u);

    if ((v290 & 1) != 0)
    if ((v294 & 1) != 0)

    if ((v296 & 1) != 0)
    if ((v298 & 1) != 0)

    if ((v300 & 1) != 0)
    if ((v302 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v292, 0);
    objc_storeStrong(&v293, obj);
    objc_storeStrong(&v304, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (*((_QWORD *)v309 + 25))
  {
    v12 = objc_msgSend(v307, "emptyScanResults");
    v288 = 0;
    v185 = 0;
    if ((v12 & 1) != 0)
    {
      v289 = (id)objc_msgSend(v307, "currentDownload");
      v288 = 1;
      v185 = v289 == 0;
    }
    v184 = v185;
    if ((v288 & 1) != 0)

    if (v184)
    {
      v183 = (id)objc_msgSend(v309, "log");
      v287 = (os_log_t)(id)objc_msgSend(v183, "oslog");

      v286 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v287, OS_LOG_TYPE_DEFAULT))
      {
        v177 = v287;
        *(_DWORD *)v178 = v286;
        v179 = SUSettingsUIStateToString(objc_msgSend(v309, "currentState"));
        v180 = v179;
        v285 = v180;
        v181 = objc_msgSend(v309, "currentState");
        v182 = (id)objc_msgSend(v309, "delegate");
        v283 = 0;
        v281 = 0;
        if (v182)
        {
          v284 = (id)objc_msgSend(v309, "delegate");
          v175 = 1;
          v283 = 1;
          v13 = (objc_class *)objc_opt_class();
          v282 = NSStringFromClass(v13);
          v281 = v175 & 1;
          v176 = (const __CFString *)v282;
        }
        else
        {
          v176 = CFSTR("(null)");
        }
        v169 = v176;
        v170 = (id)objc_msgSend(v309, "delegate");
        v171 = (id)objc_msgSend(v309, "scanError");
        v172 = (id)objc_msgSend(v309, "preferredStatefulDescriptor");
        v173 = (id)objc_msgSend(v309, "alternateStatefulDescriptor");
        v174 = (id)objc_msgSend(v309, "currentDownload");
        v279 = 0;
        v277 = 0;
        v275 = 0;
        if (v174)
        {
          v280 = (id)objc_msgSend(v309, "currentDownload");
          v167 = 1;
          v279 = 1;
          v278 = (id)objc_msgSend(v280, "descriptor");
          v277 = v167 & 1;
          v276 = (id)objc_msgSend(v278, "humanReadableUpdateName");
          v275 = v167 & 1;
          v168 = (const __CFString *)v276;
        }
        else
        {
          v168 = CFSTR("(null)");
        }
        v153 = v168;
        v154 = (id)objc_msgSend(v309, "currentDownload");
        v14 = objc_msgSend(v309, "performThirdPartyScan");
        v160 = "NO";
        v15 = "YES";
        v161 = "YES";
        v165 = 1;
        if ((v14 & 1) == 0)
          v15 = "NO";
        v155 = v15;
        v16 = objc_msgSend(v309, "isTargetedUpdateScheduledForAutoInstall");
        v17 = v161;
        if ((v16 & 1) == 0)
          v17 = v160;
        v156 = (uint64_t)v17;
        v18 = objc_msgSend(v309, "hidingPreferredDescriptor");
        v19 = (uint64_t)v161;
        if ((v18 & 1) == 0)
          v19 = (uint64_t)v160;
        v157 = v19;
        v158 = (id)objc_msgSend(*((id *)v309 + 32), "humanReadableUpdateName");
        v159 = v158;
        v274 = v159;
        v20 = objc_msgSend(v309, "hidingAlternateDescriptor");
        v21 = (uint64_t)v161;
        if ((v20 & 1) == 0)
          v21 = (uint64_t)v160;
        v162 = v21;
        v163 = (id)objc_msgSend(*((id *)v309 + 33), "humanReadableUpdateName");
        v164 = v163;
        v273 = v164;
        v166 = (id)objc_msgSend(v309, "enrolledBetaProgram");
        v271 = 0;
        if (v166)
        {
          v272 = (id)objc_msgSend(v309, "enrolledBetaProgram");
          v271 = 1;
          v152 = objc_msgSend(v272, "programID");
        }
        else
        {
          v152 = 0;
        }
        v22 = v156;
        v23 = (uint64_t)v155;
        v24 = v154;
        v25 = (uint64_t)v153;
        v26 = v173;
        v143 = v152;
        v151 = (id)objc_msgSend(v309, "betaPrograms");
        v144 = objc_msgSend(v151, "count");
        v150 = (id)objc_msgSend(v309, "currentFullScanOperation");
        v149 = (id)objc_msgSend(v309, "currentRefreshScanOperation");
        v148 = (id)objc_msgSend(v309, "currentUpdateOperation");
        v147 = (id)objc_msgSend(v309, "auxiliaryOperations");
        v27 = objc_msgSend(v147, "count");
        v145 = &v65;
        v146 = v312;
        __os_log_helper_16_2_22_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0((uint64_t)v312, (uint64_t)v230, (uint64_t)v180, v181, (uint64_t)v169, (uint64_t)v170, (uint64_t)v171, (uint64_t)v172, (uint64_t)v26, v25, (uint64_t)v24, v23, v22, v157, (uint64_t)v159, v162, (uint64_t)v164, v143, v144,
          (uint64_t)v150,
          (uint64_t)v149,
          (uint64_t)v148,
          v27);
        _os_log_impl(&dword_21BF33000, v177, v178[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
          "\tselectedBetaProgram: %lu (count: %ld)\n"
          "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
          "\n"
          "The full scan yielded empty scan results - cancelling the currently active update operation",
          v146,
          0xDEu);

        if ((v271 & 1) != 0)
        if ((v275 & 1) != 0)

        if ((v277 & 1) != 0)
        if ((v279 & 1) != 0)

        if ((v281 & 1) != 0)
        if ((v283 & 1) != 0)

        v142 = 0;
        objc_storeStrong(&v273, 0);
        objc_storeStrong(&v274, v142);
        objc_storeStrong(&v285, v142);
      }
      objc_storeStrong((id *)&v287, 0);
      v140 = (id)*((_QWORD *)v309 + 25);
      v139 = &v265;
      v265 = MEMORY[0x24BDAC760];
      v266 = -1073741824;
      v267 = 0;
      v268 = __53__SUSettingsStatefulUIManager_handleFullScanResults___block_invoke;
      v269 = &unk_24DFF8008;
      v141 = &v270;
      v270 = v309;
      objc_msgSend(v140, "cancel:", v139);
      objc_storeStrong(v141, 0);
    }
    else
    {
      v137 = (id)*((_QWORD *)v309 + 10);
      v138 = (id)objc_msgSend(v307, "preferredDescriptor");
      v28 = objc_msgSend(v137, "isEqualToDescriptor:");
      v263 = 0;
      v261 = 0;
      v259 = 0;
      if ((v28 & 1) != 0
        || (v135 = (id)*((_QWORD *)v309 + 10),
            v264 = (id)objc_msgSend(v307, "alternateDescriptor"),
            v263 = 1,
            v29 = objc_msgSend(v135, "isEqualToDescriptor:"),
            v136 = 1,
            (v29 & 1) != 0))
      {
        v133 = (id)*((_QWORD *)v309 + 11);
        v262 = (id)objc_msgSend(v307, "preferredDescriptor");
        v261 = 1;
        v30 = objc_msgSend(v133, "isEqualToDescriptor:");
        v134 = 0;
        if ((v30 & 1) == 0)
        {
          v131 = (id)*((_QWORD *)v309 + 11);
          v260 = (id)objc_msgSend(v307, "alternateDescriptor");
          v132 = 1;
          v259 = 1;
          v31 = objc_msgSend(v131, "isEqualToDescriptor:");
          v134 = v31 ^ v132;
        }
        v136 = v134;
      }
      v130 = v136;
      if ((v259 & 1) != 0)

      if ((v261 & 1) != 0)
      if ((v263 & 1) != 0)

      if ((v130 & 1) != 0)
      {
        v129 = (id)objc_msgSend(v309, "log");
        v258 = (os_log_t)(id)objc_msgSend(v129, "oslog");

        v257 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v258, OS_LOG_TYPE_DEFAULT))
        {
          v123 = v258;
          *(_DWORD *)v124 = v257;
          v125 = SUSettingsUIStateToString(objc_msgSend(v309, "currentState"));
          v126 = v125;
          v256 = v126;
          v127 = objc_msgSend(v309, "currentState");
          v128 = (id)objc_msgSend(v309, "delegate");
          v254 = 0;
          v252 = 0;
          if (v128)
          {
            v255 = (id)objc_msgSend(v309, "delegate");
            v121 = 1;
            v254 = 1;
            v32 = (objc_class *)objc_opt_class();
            v253 = NSStringFromClass(v32);
            v252 = v121 & 1;
            v122 = (const __CFString *)v253;
          }
          else
          {
            v122 = CFSTR("(null)");
          }
          v115 = v122;
          v116 = (id)objc_msgSend(v309, "delegate");
          v117 = (id)objc_msgSend(v309, "scanError");
          v118 = (id)objc_msgSend(v309, "preferredStatefulDescriptor");
          v119 = (id)objc_msgSend(v309, "alternateStatefulDescriptor");
          v120 = (id)objc_msgSend(v309, "currentDownload");
          v250 = 0;
          v248 = 0;
          v246 = 0;
          if (v120)
          {
            v251 = (id)objc_msgSend(v309, "currentDownload");
            v113 = 1;
            v250 = 1;
            v249 = (id)objc_msgSend(v251, "descriptor");
            v248 = v113 & 1;
            v247 = (id)objc_msgSend(v249, "humanReadableUpdateName");
            v246 = v113 & 1;
            v114 = (const __CFString *)v247;
          }
          else
          {
            v114 = CFSTR("(null)");
          }
          v99 = v114;
          v100 = (id)objc_msgSend(v309, "currentDownload");
          v33 = objc_msgSend(v309, "performThirdPartyScan");
          v106 = "NO";
          v34 = "YES";
          v107 = "YES";
          v111 = 1;
          if ((v33 & 1) == 0)
            v34 = "NO";
          v101 = v34;
          v35 = objc_msgSend(v309, "isTargetedUpdateScheduledForAutoInstall");
          v36 = v107;
          if ((v35 & 1) == 0)
            v36 = v106;
          v102 = (uint64_t)v36;
          v37 = objc_msgSend(v309, "hidingPreferredDescriptor");
          v38 = v107;
          if ((v37 & 1) == 0)
            v38 = v106;
          v103 = (uint64_t)v38;
          v104 = (id)objc_msgSend(*((id *)v309 + 32), "humanReadableUpdateName");
          v105 = v104;
          v245 = v105;
          v39 = objc_msgSend(v309, "hidingAlternateDescriptor");
          v40 = (uint64_t)v107;
          if ((v39 & 1) == 0)
            v40 = (uint64_t)v106;
          v108 = v40;
          v109 = (id)objc_msgSend(*((id *)v309 + 33), "humanReadableUpdateName");
          v110 = v109;
          v244 = v110;
          v112 = (id)objc_msgSend(v309, "enrolledBetaProgram");
          v242 = 0;
          if (v112)
          {
            v243 = (id)objc_msgSend(v309, "enrolledBetaProgram");
            v242 = 1;
            v98 = objc_msgSend(v243, "programID");
          }
          else
          {
            v98 = 0;
          }
          v41 = (uint64_t)v105;
          v42 = v103;
          v43 = v102;
          v44 = (uint64_t)v101;
          v45 = v100;
          v46 = (uint64_t)v99;
          v47 = v119;
          v83 = v98;
          v97 = (id)objc_msgSend(v309, "betaPrograms");
          v84 = objc_msgSend(v97, "count");
          v96 = (id)objc_msgSend(v309, "currentFullScanOperation");
          v95 = (id)objc_msgSend(v309, "currentRefreshScanOperation");
          v94 = (id)objc_msgSend(v309, "currentUpdateOperation");
          v93 = (id)objc_msgSend(v309, "auxiliaryOperations");
          v85 = objc_msgSend(v93, "count");
          v92 = (id)objc_msgSend(v307, "preferredDescriptor");
          v91 = (id)objc_msgSend(v92, "humanReadableUpdateName");
          v86 = v91;
          v241 = v86;
          v90 = (id)objc_msgSend(v307, "alternateDescriptor");
          v89 = (id)objc_msgSend(v90, "humanReadableUpdateName");
          v240 = v89;
          v87 = &v65;
          v88 = v311;
          __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66((uint64_t)v311, (uint64_t)v230, (uint64_t)v126, v127, (uint64_t)v115, (uint64_t)v116, (uint64_t)v117, (uint64_t)v118, (uint64_t)v47, v46, (uint64_t)v45, v44, v43, v42, v41, v108, (uint64_t)v110, v83, v84,
            (uint64_t)v96,
            (uint64_t)v95,
            (uint64_t)v94,
            v85,
            (uint64_t)v86,
            (uint64_t)v240);
          _os_log_impl(&dword_21BF33000, v123, v124[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
            "\tselectedBetaProgram: %lu (count: %ld)\n"
            "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
            "\n"
            "The full scan yielded results that are different then the previously discovered results - cancelling the cur"
            "rently active update operation.\n"
            "\tresults.preferredDescriptor: %{public}@\n"
            "\tresults.alternateDescriptor: %{public}@",
            v88,
            0xF2u);

          if ((v242 & 1) != 0)
          if ((v246 & 1) != 0)

          if ((v248 & 1) != 0)
          if ((v250 & 1) != 0)

          if ((v252 & 1) != 0)
          if ((v254 & 1) != 0)

          v82 = 0;
          objc_storeStrong(&v240, 0);
          objc_storeStrong(&v241, v82);
          objc_storeStrong(&v244, v82);
          objc_storeStrong(&v245, v82);
          objc_storeStrong(&v256, v82);
        }
        objc_storeStrong((id *)&v258, 0);
        v80 = (id)*((_QWORD *)v309 + 25);
        v79 = &v234;
        v234 = MEMORY[0x24BDAC760];
        v235 = -1073741824;
        v236 = 0;
        v237 = __53__SUSettingsStatefulUIManager_handleFullScanResults___block_invoke_307;
        v238 = &unk_24DFF8008;
        v81 = &v239;
        v239 = v309;
        objc_msgSend(v80, "cancel:", v79);
        objc_storeStrong(v81, 0);
      }
    }
  }
  objc_msgSend(v309, "assignScanRelatedMembersFromScanResults:", v307);
  v48 = (id)objc_msgSend(v307, "scanError");
  v49 = (void *)*((_QWORD *)v309 + 12);
  *((_QWORD *)v309 + 12) = v48;

  v50 = objc_msgSend(v307, "mdmPathRestrictions");
  *((_QWORD *)v309 + 34) = v50;
  v51 = objc_msgSend(v307, "isDelayingUpdate");
  v76 = 1;
  *((_BYTE *)v309 + 17) = v51 & 1;
  v52 = objc_msgSend(v307, "isRollingBack");
  *((_BYTE *)v309 + 9) = v52 & v76;
  v53 = (id)objc_msgSend(v307, "rollbackDescriptor");
  v54 = (void *)*((_QWORD *)v309 + 15);
  *((_QWORD *)v309 + 15) = v53;

  v55 = (id)objc_msgSend(v307, "currentSeedingDevice");
  v56 = (void *)*((_QWORD *)v309 + 16);
  *((_QWORD *)v309 + 16) = v55;

  v57 = (id)objc_msgSend(v307, "betaPrograms");
  v58 = (void *)*((_QWORD *)v309 + 17);
  *((_QWORD *)v309 + 17) = v57;

  v59 = (id)objc_msgSend(v307, "enrolledBetaProgram");
  v60 = (void *)*((_QWORD *)v309 + 18);
  *((_QWORD *)v309 + 18) = v59;

  v61 = (id)objc_msgSend(v307, "ddmDeclaration");
  v62 = (void *)*((_QWORD *)v309 + 14);
  *((_QWORD *)v309 + 14) = v61;

  v77 = (id)objc_msgSend(MEMORY[0x24BEAEA40], "sharedDevice");
  v78 = objc_msgSend(v77, "hasSemiSplatActive");

  if ((v78 & 1) != 0)
  {
    v75 = (id)objc_msgSend(v309, "log");
    v233 = (os_log_t)(id)objc_msgSend(v75, "oslog");

    v232 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v233, OS_LOG_TYPE_DEFAULT))
    {
      v72 = v233;
      *(_DWORD *)v73 = v232;
      v74 = v310;
      __os_log_helper_16_2_1_8_32((uint64_t)v310, (uint64_t)v230);
      _os_log_impl(&dword_21BF33000, v72, v73[0], "%s: Rollback already applied, show the user an alert to reboot, and show no available updates.", v74, 0xCu);
    }
    objc_storeStrong((id *)&v233, 0);
    objc_msgSend(v309, "clearPastScanResults");
    objc_msgSend(v309, "handleScanFinishedRollbackApplied:", location[0]);
    objc_msgSend(*((id *)v309 + 27), "postEvent:withInfo:", CFSTR("NoUpdateAvailable"), location[0]);
    v231 = 1;
  }
  else if (*((_QWORD *)v309 + 12))
  {
    v70 = (id)objc_msgSend(*((id *)v309 + 12), "domain");
    v63 = objc_msgSend(v70, "isEqualToString:", *MEMORY[0x24BEAED98]);
    v71 = 0;
    if ((v63 & 1) != 0)
      v71 = objc_msgSend(*((id *)v309 + 12), "code") == 3;
    v69 = v71;

    if (v69)
      objc_msgSend(v309, "clearPastScanResults");
    objc_msgSend(*((id *)v309 + 27), "postEvent:withInfo:", CFSTR("NoUpdateAvailable"), location[0]);
    v231 = 1;
  }
  else if ((objc_msgSend(v307, "emptyScanResults") & 1) != 0)
  {
    if (*((_QWORD *)v309 + 13) && (*((_QWORD *)v309 + 10) || *((_QWORD *)v309 + 11)))
    {
      objc_msgSend(v309, "updateDescriptorsUsingScanResults:andWithConcreteError:", v307, 0);
      objc_msgSend(*((id *)v309 + 27), "postEvent:withInfo:", CFSTR("UpdatesAvailable"), location[0]);
      v231 = 1;
    }
    else
    {
      objc_msgSend(v309, "clearPastScanResults");
      objc_msgSend(*((id *)v309 + 27), "postEvent:withInfo:", CFSTR("NoUpdateAvailable"), location[0]);
      v231 = 0;
    }
  }
  else
  {
    objc_msgSend(v309, "assignDescriptorOfType:fromSearchResults:", 0, v307);
    objc_msgSend(v309, "assignDescriptorOfType:fromSearchResults:", 1, v307);
    v67 = 0;
    objc_storeStrong((id *)v309 + 32, 0);
    objc_storeStrong((id *)v309 + 33, v67);
    *((_BYTE *)v309 + 15) = 0;
    *((_BYTE *)v309 + 16) = 0;
    v64 = (id)objc_msgSend(v309, "currentDownload");
    v68 = v64 == 0;

    if (!v68)
      objc_msgSend(v309, "hideNonTargetedUpdateDescriptors");
    objc_msgSend(*((id *)v309 + 27), "postEvent:withInfo:", CFSTR("UpdatesAvailable"), location[0]);
    v231 = 1;
  }
  v66 = 0;
  objc_storeStrong(&v307, 0);
  objc_storeStrong(location, v66);
}

void __53__SUSettingsStatefulUIManager_handleFullScanResults___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 200), 0);
}

void __53__SUSettingsStatefulUIManager_handleFullScanResults___block_invoke_307(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 200), 0);
}

- (void)handleFailedFullScan:(id)a3
{
  id v3;
  id *v4;
  objc_class *v5;
  NSString *v6;
  id v7;
  char v8;
  const char *v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  char v19;
  unsigned __int8 v20;
  BOOL v21;
  char v22;
  char v23;
  char v24;
  unsigned __int8 v25;
  uint64_t v26;
  dispatch_block_t block;
  dispatch_time_t when;
  dispatch_queue_t queue;
  id *v30;
  id *v31;
  id v32;
  os_log_t v33;
  os_log_type_t v34[4];
  uint8_t *v35;
  id v36;
  int v37;
  _BOOL4 v38;
  id v39;
  _BOOL4 v40;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint8_t *buf;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  const __CFString *v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  id v64;
  id v65;
  int v66;
  id v67;
  int v68;
  const __CFString *v69;
  const __CFString *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  int v76;
  const __CFString *v77;
  os_log_t log;
  os_log_type_t v79[4];
  id v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  id v84;
  char *v85;
  const char *v86;
  int v87;
  uint64_t v88;
  int v89;
  int v90;
  uint64_t (*v91)(uint64_t);
  void *v92;
  _QWORD v93[2];
  os_log_type_t v94;
  os_log_t oslog;
  BOOL v96;
  unsigned __int8 v97;
  char v98;
  id v99;
  id v100;
  id v101;
  char v102;
  id v103;
  char v104;
  id v105;
  char v106;
  char v107;
  char v108;
  char v109;
  id v110;
  os_log_type_t type;
  id v112;
  id location[2];
  SUSettingsStatefulUIManager *v114;
  BOOL v115;
  _BYTE v116[32];
  _BYTE v117[232];
  uint64_t v118;

  v85 = &v107;
  v86 = "-[SUSettingsStatefulUIManager handleFailedFullScan:]";
  v118 = *MEMORY[0x24BDAC8D0];
  v114 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v84 = -[SUSettingsStatefulUIManager log](v114, "log");
  v112 = (id)objc_msgSend(v84, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v112, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_t)*((_QWORD *)v85 + 7);
    *(_DWORD *)v79 = type;
    v80 = SUSettingsUIStateToString(objc_msgSend(*((id *)v85 + 10), "currentState"));
    v3 = v80;
    v4 = (id *)v85;
    v81 = (uint64_t)v3;
    *((_QWORD *)v85 + 5) = v3;
    v82 = objc_msgSend(v4[10], "currentState");
    v83 = (id)objc_msgSend(*((id *)v85 + 10), "delegate");
    v109 = 0;
    v108 = 0;
    if (v83)
    {
      *((_QWORD *)v85 + 4) = (id)objc_msgSend(*((id *)v85 + 10), "delegate");
      v76 = 1;
      v109 = 1;
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      *((_QWORD *)v85 + 2) = v6;
      v108 = 1;
      v77 = (const __CFString *)v6;
    }
    else
    {
      v77 = CFSTR("(null)");
    }
    v70 = v77;
    v71 = (id)objc_msgSend(*((id *)v85 + 10), "delegate");
    v72 = (id)objc_msgSend(*((id *)v85 + 10), "scanError");
    v73 = (id)objc_msgSend(*((id *)v85 + 10), "preferredStatefulDescriptor");
    v74 = (id)objc_msgSend(*((id *)v85 + 10), "alternateStatefulDescriptor");
    v75 = (id)objc_msgSend(*((id *)v85 + 10), "currentDownload");
    v106 = 0;
    v104 = 0;
    v102 = 0;
    if (v75)
    {
      v7 = (id)objc_msgSend(*((id *)v85 + 10), "currentDownload");
      *(_QWORD *)v85 = v7;
      v68 = 1;
      v106 = 1;
      v105 = (id)objc_msgSend(v7, "descriptor");
      v104 = 1;
      v103 = (id)objc_msgSend(v105, "humanReadableUpdateName");
      v102 = 1;
      v69 = (const __CFString *)v103;
    }
    else
    {
      v69 = CFSTR("(null)");
    }
    v54 = v69;
    v55 = (id)objc_msgSend(*((id *)v85 + 10), "currentDownload");
    v8 = objc_msgSend(*((id *)v85 + 10), "performThirdPartyScan");
    v61 = "NO";
    v9 = "YES";
    v62 = "YES";
    v66 = 1;
    if ((v8 & 1) == 0)
      v9 = "NO";
    v56 = v9;
    v10 = objc_msgSend(*((id *)v85 + 10), "isTargetedUpdateScheduledForAutoInstall");
    v11 = (uint64_t)v62;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v61;
    v57 = v11;
    v12 = objc_msgSend(*((id *)v85 + 10), "hidingPreferredDescriptor");
    v13 = (uint64_t)v62;
    if ((v12 & 1) == 0)
      v13 = (uint64_t)v61;
    v58 = v13;
    v59 = (id)objc_msgSend(*(id *)(*((_QWORD *)v85 + 10) + 256), "humanReadableUpdateName");
    v60 = v59;
    v101 = v60;
    v14 = objc_msgSend(*((id *)v85 + 10), "hidingAlternateDescriptor");
    v15 = (uint64_t)v62;
    if ((v14 & 1) == 0)
      v15 = (uint64_t)v61;
    v63 = v15;
    v64 = (id)objc_msgSend(*(id *)(*((_QWORD *)v85 + 10) + 264), "humanReadableUpdateName");
    v65 = v64;
    v100 = v65;
    v67 = (id)objc_msgSend(*((id *)v85 + 10), "enrolledBetaProgram");
    v98 = 0;
    if (v67)
    {
      v99 = (id)objc_msgSend(*((id *)v85 + 10), "enrolledBetaProgram");
      v98 = 1;
      v53 = objc_msgSend(v99, "programID");
    }
    else
    {
      v53 = 0;
    }
    v42 = v53;
    v52 = (id)objc_msgSend(*((id *)v85 + 10), "betaPrograms");
    v43 = objc_msgSend(v52, "count");
    v51 = (id)objc_msgSend(*((id *)v85 + 10), "currentFullScanOperation");
    v50 = (id)objc_msgSend(*((id *)v85 + 10), "currentRefreshScanOperation");
    v49 = (id)objc_msgSend(*((id *)v85 + 10), "currentUpdateOperation");
    v48 = (id)objc_msgSend(*((id *)v85 + 10), "auxiliaryOperations");
    v44 = objc_msgSend(v48, "count");
    v47 = (id)objc_msgSend(*((id *)v85 + 8), "error");
    v45 = &v26;
    buf = v117;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v117, (uint64_t)v86, v81, v82, (uint64_t)v70, (uint64_t)v71, (uint64_t)v72, (uint64_t)v73, (uint64_t)v74, (uint64_t)v54, (uint64_t)v55, (uint64_t)v56, v57, v58, (uint64_t)v60, v63, (uint64_t)v65, v53, v43,
      (uint64_t)v51,
      (uint64_t)v50,
      (uint64_t)v49,
      v44,
      (uint64_t)v47);
    _os_log_impl(&dword_21BF33000, log, v79[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to perform a full-scan with error: %{public}@",
      buf,
      0xE8u);

    if ((v98 & 1) != 0)
    if ((v102 & 1) != 0)

    if ((v104 & 1) != 0)
    if ((v106 & 1) != 0)

    if ((v108 & 1) != 0)
    if ((v109 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v100, 0);
    objc_storeStrong(&v101, obj);
    objc_storeStrong(&v110, obj);
  }
  objc_storeStrong(&v112, 0);
  v16 = (id)objc_msgSend(*((id *)v85 + 8), "error");
  v17 = *((_QWORD *)v85 + 10);
  v18 = *(void **)(v17 + 96);
  *(_QWORD *)(v17 + 96) = v16;

  v39 = (id)objc_msgSend(*(id *)(*((_QWORD *)v85 + 10) + 96), "domain");
  v19 = objc_msgSend(v39, "isEqualToString:", *MEMORY[0x24BEAED98]);
  v40 = 0;
  if ((v19 & 1) != 0)
    v40 = objc_msgSend(*(id *)(*((_QWORD *)v85 + 10) + 96), "code") == 26;
  v38 = v40;

  if (!v38)
    goto LABEL_48;
  v97 = 0;
  v96 = 0;
  v20 = objc_msgSend(*((id *)v85 + 8), "retries");
  v21 = __OFSUB__(v20, 1);
  v97 = v20 - 1;
  v115 = v21 || v20 - 1 != (v20 - 1);
  v96 = v115;
  v37 = v115 ? 0 : v97;
  objc_msgSend(*((id *)v85 + 8), "setRetries:", v37);
  v22 = objc_msgSend(*((id *)v85 + 8), "retries");
  v24 = v23 | (v22 == 0);
  if ((v24 & 1) != 0)
  {
LABEL_48:
    objc_msgSend(*(id *)(*((_QWORD *)v85 + 10) + 216), "postEvent:withInfo:", CFSTR("CheckingForUpdatesFailed"), *((_QWORD *)v85 + 8));
    v87 = 0;
  }
  else
  {
    v36 = (id)objc_msgSend(*((id *)v85 + 10), "log");
    oslog = (os_log_t)(id)objc_msgSend(v36, "oslog");

    v94 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v33 = oslog;
      *(_DWORD *)v34 = v94;
      v25 = objc_msgSend(*((id *)v85 + 8), "retries");
      v35 = v116;
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v116, (uint64_t)v86, v25 + 1);
      _os_log_impl(&dword_21BF33000, v33, v34[0], "%s: The scan failed but got %u retries left. Performing a retry.", v35, 0x12u);
    }
    objc_storeStrong((id *)&oslog, 0);
    when = dispatch_time(0, 1000000000 * kSUSettingsStatefulUIRetryDelay);
    queue = (dispatch_queue_t)(id)objc_msgSend(*((id *)v85 + 10), "workQueue");
    block = &v88;
    v88 = MEMORY[0x24BDAC760];
    v89 = -1073741824;
    v90 = 0;
    v91 = __52__SUSettingsStatefulUIManager_handleFailedFullScan___block_invoke;
    v92 = &unk_24DFF7B80;
    v31 = (id *)v93;
    v93[0] = *((id *)v85 + 8);
    v30 = (id *)((char *)block + 40);
    v93[1] = *((id *)v85 + 10);
    dispatch_after(when, queue, block);

    v87 = 1;
    v32 = 0;
    objc_storeStrong(v30, 0);
    objc_storeStrong(v31, v32);
  }
  objc_storeStrong(location, 0);
}

uint64_t __52__SUSettingsStatefulUIManager_handleFailedFullScan___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setError:");
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 184), 0);
  return objc_msgSend(*(id *)(a1 + 40), "performFullScan:", *(_QWORD *)(a1 + 32));
}

- (void)handleRefreshScanResults:(id)a3
{
  objc_class *v3;
  char v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  id *v15;
  id *v16;
  id *v17;
  id v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint8_t *buf;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  const __CFString *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  id v42;
  id v43;
  int v44;
  id v45;
  int v46;
  const __CFString *v47;
  const __CFString *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  int v54;
  const __CFString *v55;
  os_log_t log;
  os_log_type_t v57[4];
  id v58;
  id v59;
  uint64_t v60;
  id v61;
  id v62;
  const char *v63;
  uint64_t v64;
  int v65;
  int v66;
  void (*v67)(NSObject *, char, id);
  void *v68;
  _QWORD v69[2];
  char v70;
  id v71;
  id v72;
  id v73;
  char v74;
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  char v82;
  id v83;
  id v84;
  os_log_type_t type;
  os_log_t oslog;
  id v87;
  id location[2];
  id v89;
  _BYTE v90[248];
  uint64_t v91;

  v63 = "-[SUSettingsStatefulUIManager handleRefreshScanResults:]";
  v91 = *MEMORY[0x24BDAC8D0];
  v89 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v87 = (id)objc_msgSend(location[0], "refreshScanResults");
  v62 = (id)objc_msgSend(v89, "log");
  oslog = (os_log_t)(id)objc_msgSend(v62, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v57 = type;
    v58 = SUSettingsUIStateToString(objc_msgSend(v89, "currentState"));
    v59 = v58;
    v84 = v59;
    v60 = objc_msgSend(v89, "currentState");
    v61 = (id)objc_msgSend(v89, "delegate");
    v82 = 0;
    v80 = 0;
    if (v61)
    {
      v83 = (id)objc_msgSend(v89, "delegate");
      v54 = 1;
      v82 = 1;
      v3 = (objc_class *)objc_opt_class();
      v81 = NSStringFromClass(v3);
      v80 = 1;
      v55 = (const __CFString *)v81;
    }
    else
    {
      v55 = CFSTR("(null)");
    }
    v48 = v55;
    v49 = (id)objc_msgSend(v89, "delegate");
    v50 = (id)objc_msgSend(v89, "scanError");
    v51 = (id)objc_msgSend(v89, "preferredStatefulDescriptor");
    v52 = (id)objc_msgSend(v89, "alternateStatefulDescriptor");
    v53 = (id)objc_msgSend(v89, "currentDownload");
    v78 = 0;
    v76 = 0;
    v74 = 0;
    if (v53)
    {
      v79 = (id)objc_msgSend(v89, "currentDownload");
      v46 = 1;
      v78 = 1;
      v77 = (id)objc_msgSend(v79, "descriptor");
      v76 = 1;
      v75 = (id)objc_msgSend(v77, "humanReadableUpdateName");
      v74 = 1;
      v47 = (const __CFString *)v75;
    }
    else
    {
      v47 = CFSTR("(null)");
    }
    v32 = v47;
    v33 = (id)objc_msgSend(v89, "currentDownload");
    v4 = objc_msgSend(v89, "performThirdPartyScan");
    v39 = "NO";
    v5 = "YES";
    v40 = "YES";
    v44 = 1;
    if ((v4 & 1) == 0)
      v5 = "NO";
    v34 = v5;
    v6 = objc_msgSend(v89, "isTargetedUpdateScheduledForAutoInstall");
    v7 = (uint64_t)v40;
    if ((v6 & 1) == 0)
      v7 = (uint64_t)v39;
    v35 = v7;
    v8 = objc_msgSend(v89, "hidingPreferredDescriptor");
    v9 = (uint64_t)v40;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v39;
    v36 = v9;
    v37 = (id)objc_msgSend(*((id *)v89 + 32), "humanReadableUpdateName");
    v38 = v37;
    v73 = v38;
    v10 = objc_msgSend(v89, "hidingAlternateDescriptor");
    v11 = (uint64_t)v40;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v39;
    v41 = v11;
    v42 = (id)objc_msgSend(*((id *)v89 + 33), "humanReadableUpdateName");
    v43 = v42;
    v72 = v43;
    v45 = (id)objc_msgSend(v89, "enrolledBetaProgram");
    v70 = 0;
    if (v45)
    {
      v71 = (id)objc_msgSend(v89, "enrolledBetaProgram");
      v70 = 1;
      v31 = objc_msgSend(v71, "programID");
    }
    else
    {
      v31 = 0;
    }
    v20 = v31;
    v30 = (id)objc_msgSend(v89, "betaPrograms");
    v21 = objc_msgSend(v30, "count");
    v29 = (id)objc_msgSend(v89, "currentFullScanOperation");
    v28 = (id)objc_msgSend(v89, "currentRefreshScanOperation");
    v27 = (id)objc_msgSend(v89, "currentUpdateOperation");
    v26 = (id)objc_msgSend(v89, "auxiliaryOperations");
    v22 = objc_msgSend(v26, "count");
    v25 = (id)objc_msgSend(v87, "scanUUID");
    v23 = &v12;
    buf = v90;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66_8_66((uint64_t)v90, (uint64_t)v63, (uint64_t)v59, v60, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, (uint64_t)v32, (uint64_t)v33, (uint64_t)v34, v35, v36, (uint64_t)v38, v41, (uint64_t)v43, v31, v21,
      (uint64_t)v29,
      (uint64_t)v28,
      (uint64_t)v27,
      v22,
      (uint64_t)v25,
      (uint64_t)v87);
    _os_log_impl(&dword_21BF33000, log, v57[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Finished to refresh the current scan results with ID: %{public}@.\n"
      "Results: %{public}@",
      buf,
      0xF2u);

    if ((v70 & 1) != 0)
    if ((v74 & 1) != 0)

    if ((v76 & 1) != 0)
    if ((v78 & 1) != 0)

    if ((v80 & 1) != 0)
    if ((v82 & 1) != 0)

    obj = 0;
    objc_storeStrong(&v72, 0);
    objc_storeStrong(&v73, obj);
    objc_storeStrong(&v84, obj);
  }
  objc_storeStrong((id *)&oslog, 0);
  v14 = (id)*((_QWORD *)v89 + 28);
  v13 = &v64;
  v64 = MEMORY[0x24BDAC760];
  v65 = -1073741824;
  v66 = 0;
  v67 = __56__SUSettingsStatefulUIManager_handleRefreshScanResults___block_invoke;
  v68 = &unk_24DFF7E00;
  v16 = (id *)v69;
  v69[0] = v89;
  v15 = (id *)(v13 + 5);
  v17 = location;
  v69[1] = location[0];
  objc_msgSend(v14, "isScanning:", v13);
  v18 = 0;
  objc_storeStrong(v15, 0);
  objc_storeStrong(v16, v18);
  objc_storeStrong(&v87, v18);
  objc_storeStrong(v17, v18);
}

void __56__SUSettingsStatefulUIManager_handleRefreshScanResults___block_invoke(NSObject *a1, char a2, id obj)
{
  objc_class *v3;
  char v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id obja;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint8_t *buf;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  id v36;
  id v37;
  int v38;
  id v39;
  int v40;
  const __CFString *v41;
  const __CFString *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  int v48;
  const __CFString *v49;
  os_log_t log;
  os_log_type_t v51[4];
  id v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  const char *v57;
  NSObject *v58;
  int v59;
  char v60;
  id v61;
  id v62;
  id v63;
  char v64;
  id v65;
  char v66;
  id v67;
  char v68;
  id v69;
  char v70;
  id v71;
  char v72;
  id v73;
  id v74;
  os_log_type_t type;
  os_log_t oslog[2];
  id location;
  char v78;
  NSObject *v79;
  _BYTE v80[248];
  uint64_t v81;

  v58 = a1;
  v57 = "-[SUSettingsStatefulUIManager handleRefreshScanResults:]_block_invoke";
  v81 = *MEMORY[0x24BDAC8D0];
  v79 = a1;
  v78 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = v58;
  v56 = (id)-[objc_class log](v58[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v56, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v51 = type;
    v52 = SUSettingsUIStateToString(-[objc_class currentState](v58[4].isa, "currentState"));
    v53 = v52;
    v74 = v53;
    v54 = -[objc_class currentState](v58[4].isa, "currentState");
    v55 = (id)-[objc_class delegate](v58[4].isa, "delegate");
    v72 = 0;
    v70 = 0;
    if (v55)
    {
      v73 = (id)-[objc_class delegate](v58[4].isa, "delegate");
      v48 = 1;
      v72 = 1;
      v3 = (objc_class *)objc_opt_class();
      v71 = NSStringFromClass(v3);
      v70 = 1;
      v49 = (const __CFString *)v71;
    }
    else
    {
      v49 = CFSTR("(null)");
    }
    v42 = v49;
    v43 = (id)-[objc_class delegate](v58[4].isa, "delegate");
    v44 = (id)-[objc_class scanError](v58[4].isa, "scanError");
    v45 = (id)-[objc_class preferredStatefulDescriptor](v58[4].isa, "preferredStatefulDescriptor");
    v46 = (id)-[objc_class alternateStatefulDescriptor](v58[4].isa, "alternateStatefulDescriptor");
    v47 = (id)-[objc_class currentDownload](v58[4].isa, "currentDownload");
    v68 = 0;
    v66 = 0;
    v64 = 0;
    if (v47)
    {
      v69 = (id)-[objc_class currentDownload](v58[4].isa, "currentDownload");
      v40 = 1;
      v68 = 1;
      v67 = (id)objc_msgSend(v69, "descriptor");
      v66 = 1;
      v65 = (id)objc_msgSend(v67, "humanReadableUpdateName");
      v64 = 1;
      v41 = (const __CFString *)v65;
    }
    else
    {
      v41 = CFSTR("(null)");
    }
    v26 = v41;
    v27 = (id)-[objc_class currentDownload](v58[4].isa, "currentDownload");
    v4 = -[objc_class performThirdPartyScan](v58[4].isa, "performThirdPartyScan");
    v33 = "NO";
    v5 = "YES";
    v34 = "YES";
    v38 = 1;
    if ((v4 & 1) == 0)
      v5 = "NO";
    v28 = v5;
    v6 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v58[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v7 = (uint64_t)v34;
    if ((v6 & 1) == 0)
      v7 = (uint64_t)v33;
    v29 = v7;
    v8 = -[objc_class hidingPreferredDescriptor](v58[4].isa, "hidingPreferredDescriptor");
    v9 = (uint64_t)v34;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v33;
    v30 = v9;
    v31 = (id)objc_msgSend(*((id *)v58[4].isa + 32), "humanReadableUpdateName");
    v32 = v31;
    v63 = v32;
    v10 = -[objc_class hidingAlternateDescriptor](v58[4].isa, "hidingAlternateDescriptor");
    v11 = (uint64_t)v34;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v33;
    v35 = v11;
    v36 = (id)objc_msgSend(*((id *)v58[4].isa + 33), "humanReadableUpdateName");
    v37 = v36;
    v62 = v37;
    v39 = (id)-[objc_class enrolledBetaProgram](v58[4].isa, "enrolledBetaProgram");
    v60 = 0;
    if (v39)
    {
      v61 = (id)-[objc_class enrolledBetaProgram](v58[4].isa, "enrolledBetaProgram");
      v60 = 1;
      v25 = objc_msgSend(v61, "programID");
    }
    else
    {
      v25 = 0;
    }
    v16 = v25;
    v24 = (id)-[objc_class betaPrograms](v58[4].isa, "betaPrograms");
    v17 = objc_msgSend(v24, "count");
    v23 = (id)-[objc_class currentFullScanOperation](v58[4].isa, "currentFullScanOperation");
    v22 = (id)-[objc_class currentRefreshScanOperation](v58[4].isa, "currentRefreshScanOperation");
    v21 = (id)-[objc_class currentUpdateOperation](v58[4].isa, "currentUpdateOperation");
    v20 = (id)-[objc_class auxiliaryOperations](v58[4].isa, "auxiliaryOperations");
    v12 = objc_msgSend(v20, "count");
    if ((v78 & 1) != 0)
      v13 = "YES";
    else
      v13 = "NO";
    v18 = &v14;
    buf = v80;
    __os_log_helper_16_2_24_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_66((uint64_t)v80, (uint64_t)v57, (uint64_t)v53, v54, (uint64_t)v42, (uint64_t)v43, (uint64_t)v44, (uint64_t)v45, (uint64_t)v46, (uint64_t)v26, (uint64_t)v27, (uint64_t)v28, v29, v30, (uint64_t)v32, v35, (uint64_t)v37, v16, v17,
      (uint64_t)v23,
      (uint64_t)v22,
      (uint64_t)v21,
      v12,
      (uint64_t)v13,
      (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, v51[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "isScanning: %s; error: %{public}@",
      buf,
      0xF2u);

    if ((v60 & 1) != 0)
    if ((v64 & 1) != 0)

    if ((v66 & 1) != 0)
    if ((v68 & 1) != 0)

    if ((v70 & 1) != 0)
    if ((v72 & 1) != 0)

    obja = 0;
    objc_storeStrong(&v62, 0);
    objc_storeStrong(&v63, obja);
    objc_storeStrong(&v74, obja);
  }
  objc_storeStrong((id *)oslog, 0);
  if ((v78 & 1) != 0)
  {
    if ((unint64_t)-[objc_class currentState](v58[4].isa, "currentState") > 1)
      -[objc_class checkForUpdatesInBackground](v58[4].isa, "checkForUpdatesInBackground");
    else
      -[objc_class checkForAvailableUpdates](v58[4].isa, "checkForAvailableUpdates");
    v59 = 1;
  }
  else
  {
    -[objc_class assignRefreshScanResults:](v58[4].isa, "assignRefreshScanResults:", v58[5].isa);
    if (*((_QWORD *)v58[4].isa + 10) || *((_QWORD *)v58[4].isa + 11))
    {
      objc_msgSend(*((id *)v58[4].isa + 27), "postEvent:withInfo:", CFSTR("UpdatesAvailable"), v58[5].isa);
    }
    else if (-[objc_class refreshPreviousState](v58[5].isa, "refreshPreviousState") == 3)
    {
      objc_msgSend(*((id *)v58[4].isa + 27), "postEvent:withInfo:", CFSTR("NoUpdateAvailable"), v58[5].isa);
    }
    else
    {
      objc_msgSend(*((id *)v58[4].isa + 27), "postEvent:withInfo:", CFSTR("CheckForAvailableUpdate"), v58[5].isa);
    }
    v59 = 0;
  }
  objc_storeStrong(&location, 0);
}

- (void)assignRefreshScanResults:(id)a3
{
  id *v3;
  char v4;
  SUCoreLog *v5;
  int v6;
  char v7;
  char v8;
  os_log_t oslog;
  char v10;
  id v11;
  id v12;
  char v13;
  id v14;
  id location[2];
  SUSettingsStatefulUIManager *v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = (id)objc_msgSend(location[0], "refreshScanResults");
  v13 = -[SUSettingsStatefulUIManager assignScanRelatedMembersFromScanResults:](v16, "assignScanRelatedMembersFromScanResults:", v14);
  v12 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](v16, "preferredStatefulDescriptor");
  v11 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](v16, "alternateStatefulDescriptor");
  if (*(_OWORD *)&v16->_preferredStatefulDescriptor == 0)
  {
    if (!v16->_currentDownload)
    {
      objc_storeStrong((id *)&v16->_preferredStatefulDescriptor, 0);
      objc_storeStrong((id *)&v16->_alternateStatefulDescriptor, 0);
    }
  }
  else
  {
    -[SUSettingsStatefulUIManager updateDescriptorsUsingScanResults:andWithConcreteError:](v16, "updateDescriptorsUsingScanResults:andWithConcreteError:", v14, 0);
  }
  v10 = 0;
  if (v16->_preferredStatefulDescriptor == v12
    || (v8 = 1, v16->_preferredStatefulDescriptor)
    && (v8 = 1, -[SUSettingsStatefulDescriptor isEqual:](v16->_preferredStatefulDescriptor, "isEqual:", v12)))
  {
    v7 = 0;
    if (v16->_alternateStatefulDescriptor != v11)
    {
      LOBYTE(v6) = 1;
      if (v16->_alternateStatefulDescriptor)
        v6 = !-[SUSettingsStatefulDescriptor isEqual:](v16->_alternateStatefulDescriptor, "isEqual:", v11);
      v7 = v6;
    }
    v8 = v7;
  }
  v10 = v8 & 1;
  v5 = -[SUSettingsStatefulUIManager log](v16, "log");
  oslog = (os_log_t)(id)-[SUCoreLog oslog](v5, "oslog");

  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_32_4_0_4_0((uint64_t)v17, (uint64_t)"-[SUSettingsStatefulUIManager assignRefreshScanResults:]", v13 & 1, v10 & 1);
    _os_log_impl(&dword_21BF33000, oslog, OS_LOG_TYPE_DEFAULT, "%s: Refreshed results changes from previous data: changedScanRelatedData = %d, changedDescriptors: %d", v17, 0x18u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4 = 1;
  if ((v13 & 1) == 0)
    v4 = v10;
  objc_msgSend(location[0], "setRefreshHasAnyChanges:", v4 & 1, location);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(v3, 0);
}

- (BOOL)assignScanRelatedMembersFromScanResults:(id)a3
{
  SUSUIUpdateAgreementManager *v3;
  SUSUIUpdateAgreementManager *v4;
  SUDownload *v5;
  SUDownload *v6;
  SUAutoInstallOperation *v7;
  SUAutoInstallOperation *v8;
  int v10;
  SUAutoInstallOperation *v11;
  char v12;
  SUAutoInstallOperation *currentAutoInstallOperation;
  char v14;
  int isAutoUpdateScheduled;
  int v16;
  SUDownload *v17;
  char v18;
  SUDownload *currentDownload;
  char v20;
  int clearingSpaceForDownload;
  int v22;
  SUSUIUpdateAgreementManager *v23;
  char v24;
  SUSettingsStatefulUIManager *v25;
  SUSUIUpdateAgreementManager *agreementManager;
  char v27;
  id v28;
  char v29;
  id v30;
  char v31;
  id v32;
  char v33;
  id location[2];
  SUSettingsStatefulUIManager *v35;

  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  v25 = v35;
  objc_sync_enter(v25);
  agreementManager = v35->_agreementManager;
  v31 = 0;
  v23 = (SUSUIUpdateAgreementManager *)(id)objc_msgSend(location[0], "agreementManager");
  v24 = 0;
  if (agreementManager != v23)
  {
    LOBYTE(v22) = 1;
    if (v35->_agreementManager)
    {
      v32 = (id)objc_msgSend(location[0], "agreementManager");
      v31 = 1;
      v22 = objc_msgSend(v32, "isEqual:", v35->_agreementManager) ^ 1;
    }
    v24 = v22;
  }
  if ((v31 & 1) != 0)

  if ((v24 & 1) != 0)
  {
    v3 = (SUSUIUpdateAgreementManager *)(id)objc_msgSend(location[0], "agreementManager");
    v4 = v35->_agreementManager;
    v35->_agreementManager = v3;

    v33 = 1;
  }
  clearingSpaceForDownload = v35->_clearingSpaceForDownload;
  if (clearingSpaceForDownload != (objc_msgSend(location[0], "isClearingSpaceForDownload") & 1))
  {
    v20 = objc_msgSend(location[0], "isClearingSpaceForDownload");
    v35->_clearingSpaceForDownload = v20 & 1;
    v33 = 1;
  }
  currentDownload = v35->_currentDownload;
  v29 = 0;
  v17 = (SUDownload *)(id)objc_msgSend(location[0], "currentDownload");
  v18 = 0;
  if (currentDownload != v17)
  {
    LOBYTE(v16) = 1;
    if (v35->_currentDownload)
    {
      v30 = (id)objc_msgSend(location[0], "currentDownload");
      v29 = 1;
      v16 = objc_msgSend(v30, "isEqual:", v35->_currentDownload) ^ 1;
    }
    v18 = v16;
  }
  if ((v29 & 1) != 0)

  if ((v18 & 1) != 0)
  {
    v5 = (SUDownload *)(id)objc_msgSend(location[0], "currentDownload");
    v6 = v35->_currentDownload;
    v35->_currentDownload = v5;

    v33 = 1;
  }
  isAutoUpdateScheduled = v35->_isAutoUpdateScheduled;
  if (isAutoUpdateScheduled != (objc_msgSend(location[0], "isAutoUpdateScheduled") & 1))
  {
    v14 = objc_msgSend(location[0], "isAutoUpdateScheduled");
    v35->_isAutoUpdateScheduled = v14 & 1;
    v33 = 1;
  }
  currentAutoInstallOperation = v35->_currentAutoInstallOperation;
  v27 = 0;
  v11 = (SUAutoInstallOperation *)(id)objc_msgSend(location[0], "currentAutoInstallOperation");
  v12 = 0;
  if (currentAutoInstallOperation != v11)
  {
    LOBYTE(v10) = 1;
    if (v35->_currentAutoInstallOperation)
    {
      v28 = (id)objc_msgSend(location[0], "currentAutoInstallOperation");
      v27 = 1;
      v10 = objc_msgSend(v28, "isEqual:", v35->_currentAutoInstallOperation) ^ 1;
    }
    v12 = v10;
  }
  if ((v27 & 1) != 0)

  if ((v12 & 1) != 0)
  {
    if (v35->_currentAutoInstallOperation)
      -[SUAutoInstallOperation setDelegate:](v35->_currentAutoInstallOperation, "setDelegate:", 0);
    v7 = (SUAutoInstallOperation *)(id)objc_msgSend(location[0], "currentAutoInstallOperation");
    v8 = v35->_currentAutoInstallOperation;
    v35->_currentAutoInstallOperation = v7;

    v33 = 1;
    if (v35->_currentAutoInstallOperation)
      -[SUAutoInstallOperation setDelegate:](v35->_currentAutoInstallOperation, "setDelegate:", v35);
  }
  objc_sync_exit(v25);

  objc_storeStrong(location, 0);
  return v33 & 1;
}

- (void)clearPastScanResults
{
  SUSettingsStatefulUIManager *v2;

  v2 = self;
  objc_sync_enter(v2);
  objc_storeStrong((id *)&self->_preferredStatefulDescriptor, 0);
  objc_storeStrong((id *)&self->_alternateStatefulDescriptor, 0);
  objc_storeStrong((id *)&self->_hiddenPreferredStatefulDescriptor, 0);
  objc_storeStrong((id *)&self->_hiddenAlternateStatefulDescriptor, 0);
  self->_hidingPreferredDescriptor = 0;
  self->_hidingAlternateDescriptor = 0;
  objc_sync_exit(v2);

}

- (id)createScanOperationOptions
{
  BOOL v2;
  BOOL v3;
  SUSettingsStatefulUIOptions *v5;
  SDDevice *v6;
  SUSettingsStatefulUIOptions *v7;
  id v8;
  id v9[2];
  SUSettingsStatefulUIManager *v10;

  v10 = self;
  v9[1] = (id)a2;
  v9[0] = -[SUSettingsScanOptions initWithScanOptions:]([SUSettingsScanOptions alloc], "initWithScanOptions:");
  v5 = -[SUSettingsStatefulUIManager options](v10, "options");
  v2 = -[SUSettingsStatefulUIOptions allowUnrestrictedCellularDownload](v5, "allowUnrestrictedCellularDownload");
  objc_msgSend(v9[0], "setAllowUnrestrictedCellularDownload:", v2);

  v6 = -[SUSettingsStatefulUIManager currentSeedingDevice](v10, "currentSeedingDevice");
  objc_msgSend(v9[0], "setCurrentSeedingDevice:");

  v7 = -[SUSettingsStatefulUIManager options](v10, "options");
  v3 = -[SUSettingsStatefulUIOptions clientIsBuddy](v7, "clientIsBuddy");
  objc_msgSend(v9[0], "setClientIsBuddy:", v3);

  v8 = v9[0];
  objc_storeStrong(v9, 0);
  return v8;
}

- (id)targetedUpdateForDownload:(id)a3
{
  SUSettingsStatefulDescriptor *alternateStatefulDescriptor;
  id v5;
  BOOL v6;
  SUSettingsStatefulDescriptor *preferredStatefulDescriptor;
  id v8;
  BOOL v9;
  id location[2];
  SUSettingsStatefulUIManager *v11;
  SUSettingsStatefulDescriptor *v12;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  preferredStatefulDescriptor = v11->_preferredStatefulDescriptor;
  v8 = (id)objc_msgSend(location[0], "descriptor");
  v9 = -[SUSettingsStatefulDescriptor isEqualToDescriptor:](preferredStatefulDescriptor, "isEqualToDescriptor:");

  if (v9)
  {
    v12 = v11->_preferredStatefulDescriptor;
  }
  else
  {
    alternateStatefulDescriptor = v11->_alternateStatefulDescriptor;
    v5 = (id)objc_msgSend(location[0], "descriptor");
    v6 = -[SUSettingsStatefulDescriptor isEqualToDescriptor:](alternateStatefulDescriptor, "isEqualToDescriptor:");

    if (v6)
      v12 = v11->_alternateStatefulDescriptor;
    else
      v12 = 0;
  }
  objc_storeStrong(location, 0);
  return v12;
}

- (id)targetedUpdateMatchingDescriptor:(id)a3
{
  id location[2];
  SUSettingsStatefulUIManager *v5;
  SUSettingsStatefulDescriptor *v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[SUSettingsStatefulDescriptor isEqualToDescriptor:](v5->_preferredStatefulDescriptor, "isEqualToDescriptor:", location[0]))
  {
    v6 = v5->_preferredStatefulDescriptor;
  }
  else if (-[SUSettingsStatefulDescriptor isEqualToDescriptor:](v5->_alternateStatefulDescriptor, "isEqualToDescriptor:", location[0]))
  {
    v6 = v5->_alternateStatefulDescriptor;
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (void)beginUpdateOperationWithDescriptor:(id)a3 operationDelegate:(id)a4 delegateCallbackQueue:(id)a5 operationTypeBlock:(id)a6
{
  NSObject *queue;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t (*v13);
  void *v14;
  SUSettingsStatefulUIManager *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location[2];
  SUSettingsStatefulUIManager *v24;

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
  queue = v24->_workQueue;
  v10 = MEMORY[0x24BDAC760];
  v11 = -1073741824;
  v12 = 0;
  v13 = __125__SUSettingsStatefulUIManager_beginUpdateOperationWithDescriptor_operationDelegate_delegateCallbackQueue_operationTypeBlock___block_invoke;
  v14 = &unk_24DFF8030;
  v15 = v24;
  v16 = location[0];
  v19 = v20;
  v17 = v22;
  v18 = v21;
  dispatch_async(queue, &v10);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

uint64_t __125__SUSettingsStatefulUIManager_beginUpdateOperationWithDescriptor_operationDelegate_delegateCallbackQueue_operationTypeBlock___block_invoke(NSObject *a1)
{
  objc_class *v1;
  char v2;
  const char *v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t isa;
  uint64_t v13;
  Class v14;
  void *v15;
  uint64_t v16;
  SUSettingsUpdateOperation *v17;
  id v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint8_t *buf;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  id v40;
  id v41;
  int v42;
  id v43;
  int v44;
  const __CFString *v45;
  const __CFString *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  int v52;
  const __CFString *v53;
  os_log_t log;
  os_log_type_t v55[4];
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  NSObject *v61;
  const char *v62;
  char v63;
  id v64;
  id location;
  id v66;
  char v67;
  id v68;
  char v69;
  id v70;
  char v71;
  id v72;
  char v73;
  id v74;
  char v75;
  id v76;
  id v77;
  os_log_type_t type;
  os_log_t oslog[3];
  _BYTE v80[232];
  uint64_t v81;

  v61 = a1;
  v62 = "-[SUSettingsStatefulUIManager beginUpdateOperationWithDescriptor:operationDelegate:delegateCallbackQueue:operati"
        "onTypeBlock:]_block_invoke";
  v81 = *MEMORY[0x24BDAC8D0];
  oslog[2] = a1;
  oslog[1] = a1;
  if (*((_QWORD *)a1[4].isa + 25))
  {
    v60 = (id)-[objc_class log](v61[4].isa, "log");
    oslog[0] = (os_log_t)(id)objc_msgSend(v60, "oslog");

    type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      log = oslog[0];
      *(_DWORD *)v55 = type;
      v56 = SUSettingsUIStateToString(-[objc_class currentState](v61[4].isa, "currentState"));
      v57 = v56;
      v77 = v57;
      v58 = -[objc_class currentState](v61[4].isa, "currentState");
      v59 = (id)-[objc_class delegate](v61[4].isa, "delegate");
      v75 = 0;
      v73 = 0;
      if (v59)
      {
        v76 = (id)-[objc_class delegate](v61[4].isa, "delegate");
        v52 = 1;
        v75 = 1;
        v1 = (objc_class *)objc_opt_class();
        v74 = NSStringFromClass(v1);
        v73 = 1;
        v53 = (const __CFString *)v74;
      }
      else
      {
        v53 = CFSTR("(null)");
      }
      v46 = v53;
      v47 = (id)-[objc_class delegate](v61[4].isa, "delegate");
      v48 = (id)-[objc_class scanError](v61[4].isa, "scanError");
      v49 = (id)-[objc_class preferredStatefulDescriptor](v61[4].isa, "preferredStatefulDescriptor");
      v50 = (id)-[objc_class alternateStatefulDescriptor](v61[4].isa, "alternateStatefulDescriptor");
      v51 = (id)-[objc_class currentDownload](v61[4].isa, "currentDownload");
      v71 = 0;
      v69 = 0;
      v67 = 0;
      if (v51)
      {
        v72 = (id)-[objc_class currentDownload](v61[4].isa, "currentDownload");
        v44 = 1;
        v71 = 1;
        v70 = (id)objc_msgSend(v72, "descriptor");
        v69 = 1;
        v68 = (id)objc_msgSend(v70, "humanReadableUpdateName");
        v67 = 1;
        v45 = (const __CFString *)v68;
      }
      else
      {
        v45 = CFSTR("(null)");
      }
      v30 = v45;
      v31 = (id)-[objc_class currentDownload](v61[4].isa, "currentDownload");
      v2 = -[objc_class performThirdPartyScan](v61[4].isa, "performThirdPartyScan");
      v37 = "NO";
      v3 = "YES";
      v38 = "YES";
      v42 = 1;
      if ((v2 & 1) == 0)
        v3 = "NO";
      v32 = v3;
      v4 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v61[4].isa, "isTargetedUpdateScheduledForAutoInstall");
      v5 = (uint64_t)v38;
      if ((v4 & 1) == 0)
        v5 = (uint64_t)v37;
      v33 = v5;
      v6 = -[objc_class hidingPreferredDescriptor](v61[4].isa, "hidingPreferredDescriptor");
      v7 = (uint64_t)v38;
      if ((v6 & 1) == 0)
        v7 = (uint64_t)v37;
      v34 = v7;
      v35 = (id)objc_msgSend(*((id *)v61[4].isa + 32), "humanReadableUpdateName");
      v36 = v35;
      v66 = v36;
      v8 = -[objc_class hidingAlternateDescriptor](v61[4].isa, "hidingAlternateDescriptor");
      v9 = (uint64_t)v38;
      if ((v8 & 1) == 0)
        v9 = (uint64_t)v37;
      v39 = v9;
      v40 = (id)objc_msgSend(*((id *)v61[4].isa + 33), "humanReadableUpdateName");
      v41 = v40;
      location = v41;
      v43 = (id)-[objc_class enrolledBetaProgram](v61[4].isa, "enrolledBetaProgram");
      v63 = 0;
      if (v43)
      {
        v64 = (id)-[objc_class enrolledBetaProgram](v61[4].isa, "enrolledBetaProgram");
        v63 = 1;
        v29 = objc_msgSend(v64, "programID");
      }
      else
      {
        v29 = 0;
      }
      v20 = v29;
      v28 = (id)-[objc_class betaPrograms](v61[4].isa, "betaPrograms");
      v21 = objc_msgSend(v28, "count");
      v27 = (id)-[objc_class currentFullScanOperation](v61[4].isa, "currentFullScanOperation");
      v26 = (id)-[objc_class currentRefreshScanOperation](v61[4].isa, "currentRefreshScanOperation");
      v25 = (id)-[objc_class currentUpdateOperation](v61[4].isa, "currentUpdateOperation");
      v24 = (id)-[objc_class auxiliaryOperations](v61[4].isa, "auxiliaryOperations");
      v10 = objc_msgSend(v24, "count");
      isa = (uint64_t)v61[5].isa;
      v22 = &v16;
      buf = v80;
      __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v80, (uint64_t)v62, (uint64_t)v57, v58, (uint64_t)v46, (uint64_t)v47, (uint64_t)v48, (uint64_t)v49, (uint64_t)v50, (uint64_t)v30, (uint64_t)v31, (uint64_t)v32, v33, v34, (uint64_t)v36, v39, (uint64_t)v41, v29, v21,
        (uint64_t)v27,
        (uint64_t)v26,
        (uint64_t)v25,
        v10,
        isa);
      _os_log_impl(&dword_21BF33000, log, v55[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
        "\tselectedBetaProgram: %lu (count: %ld)\n"
        "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
        "\n"
        "There is already an update process running. Ignoring request to update into: %{public}@",
        buf,
        0xE8u);

      if ((v63 & 1) != 0)
      if ((v67 & 1) != 0)

      if ((v69 & 1) != 0)
      if ((v71 & 1) != 0)

      if ((v73 & 1) != 0)
      if ((v75 & 1) != 0)

      obj = 0;
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v66, obj);
      objc_storeStrong(&v77, obj);
    }
    objc_storeStrong((id *)oslog, 0);
    return (*((uint64_t (**)(void))v61[8].isa + 2))();
  }
  else
  {
    v17 = [SUSettingsUpdateOperation alloc];
    v18 = (id)-[objc_class descriptor](v61[5].isa, "descriptor");
    v13 = -[SUSettingsUpdateOperation initWithDescriptor:usingSUManagerClient:delegate:](v17, "initWithDescriptor:usingSUManagerClient:delegate:");
    v14 = v61[4].isa;
    v15 = (void *)*((_QWORD *)v14 + 25);
    *((_QWORD *)v14 + 25) = v13;

    objc_msgSend(*((id *)v61[4].isa + 25), "setDelegateCallbackQueue:", v61[7].isa);
    objc_msgSend(*((id *)v61[4].isa + 25), "setCompletionQueue:", *((_QWORD *)v61[4].isa + 21));
    return (*((uint64_t (**)(void))v61[8].isa + 2))();
  }
}

- (void)updateStatePostDownloadOperation:(BOOL)a3 withDownload:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  id location;
  BOOL v11;
  SEL v12;
  SUSettingsStatefulUIManager *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v9 = 0;
  objc_storeStrong(&v9, a5);
  v8 = 0;
  objc_storeStrong(&v8, a6);
  -[SUSettingsStatefulUIManager performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:](v13, "performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOperation:error:completionHandler:", v11, location, 0, 0, v9, v8);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

- (void)performPostUpdateOperationRefresh:(BOOL)a3 withDownload:(id)a4 didScheduledUpdate:(BOOL)a5 autoInstallOperation:(id)a6 error:(id)a7 completionHandler:(id)a8
{
  objc_class *v8;
  char v9;
  const char *v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  SUSettingsScanOperation *v17;
  SUSettingsScanOperation *v18;
  uint64_t v19;
  uint64_t v20;
  id *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id *v26;
  id *v27;
  id *v28;
  id *v29;
  id *v30;
  id *v31;
  id *v32;
  id *v33;
  id *v34;
  id *v35;
  id *p_location;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint8_t *buf;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  const __CFString *v49;
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  id v59;
  id v60;
  int v61;
  id v62;
  int v63;
  const __CFString *v64;
  const __CFString *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  int v71;
  const __CFString *v72;
  os_log_t log;
  os_log_type_t v74[4];
  id v75;
  id v76;
  uint64_t v77;
  id v78;
  id v79;
  const char *v80;
  _BOOL4 v81;
  id obj;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  int v87;
  int v88;
  void (*v89)(NSObject *, void *, void *);
  void *v90;
  _QWORD v91[4];
  uint64_t v92;
  id v93;
  char v94;
  id v95;
  id v96;
  id v97;
  char v98;
  id v99;
  char v100;
  id v101;
  char v102;
  id v103;
  char v104;
  id v105;
  char v106;
  id v107;
  id v108;
  os_log_type_t type;
  os_log_t oslog;
  id v111;
  id v112;
  id v113;
  id v114;
  BOOL v115;
  id location;
  BOOL v117;
  SEL v118;
  id v119;
  _BYTE v120[232];
  uint64_t v121;

  v81 = a5;
  obj = a6;
  v83 = a7;
  v84 = a8;
  v80 = "-[SUSettingsStatefulUIManager performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOpera"
        "tion:error:completionHandler:]";
  v121 = *MEMORY[0x24BDAC8D0];
  v119 = self;
  v118 = a2;
  v117 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v115 = v81;
  v114 = 0;
  objc_storeStrong(&v114, obj);
  v113 = 0;
  objc_storeStrong(&v113, v83);
  v112 = 0;
  objc_storeStrong(&v112, v84);
  v85 = (id)objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v111 = (id)objc_msgSend(v85, "UUIDString");

  v79 = (id)objc_msgSend(v119, "log");
  oslog = (os_log_t)(id)objc_msgSend(v79, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    *(_DWORD *)v74 = type;
    v75 = SUSettingsUIStateToString(objc_msgSend(v119, "currentState"));
    v76 = v75;
    v108 = v76;
    v77 = objc_msgSend(v119, "currentState");
    v78 = (id)objc_msgSend(v119, "delegate");
    v106 = 0;
    v104 = 0;
    if (v78)
    {
      v107 = (id)objc_msgSend(v119, "delegate");
      v71 = 1;
      v106 = 1;
      v8 = (objc_class *)objc_opt_class();
      v105 = NSStringFromClass(v8);
      v104 = 1;
      v72 = (const __CFString *)v105;
    }
    else
    {
      v72 = CFSTR("(null)");
    }
    v65 = v72;
    v66 = (id)objc_msgSend(v119, "delegate");
    v67 = (id)objc_msgSend(v119, "scanError");
    v68 = (id)objc_msgSend(v119, "preferredStatefulDescriptor");
    v69 = (id)objc_msgSend(v119, "alternateStatefulDescriptor");
    v70 = (id)objc_msgSend(v119, "currentDownload");
    v102 = 0;
    v100 = 0;
    v98 = 0;
    if (v70)
    {
      v103 = (id)objc_msgSend(v119, "currentDownload");
      v63 = 1;
      v102 = 1;
      v101 = (id)objc_msgSend(v103, "descriptor");
      v100 = 1;
      v99 = (id)objc_msgSend(v101, "humanReadableUpdateName");
      v98 = 1;
      v64 = (const __CFString *)v99;
    }
    else
    {
      v64 = CFSTR("(null)");
    }
    v49 = v64;
    v50 = (id)objc_msgSend(v119, "currentDownload");
    v9 = objc_msgSend(v119, "performThirdPartyScan");
    v56 = "NO";
    v10 = "YES";
    v57 = "YES";
    v61 = 1;
    if ((v9 & 1) == 0)
      v10 = "NO";
    v51 = v10;
    v11 = objc_msgSend(v119, "isTargetedUpdateScheduledForAutoInstall");
    v12 = (uint64_t)v57;
    if ((v11 & 1) == 0)
      v12 = (uint64_t)v56;
    v52 = v12;
    v13 = objc_msgSend(v119, "hidingPreferredDescriptor");
    v14 = (uint64_t)v57;
    if ((v13 & 1) == 0)
      v14 = (uint64_t)v56;
    v53 = v14;
    v54 = (id)objc_msgSend(*((id *)v119 + 32), "humanReadableUpdateName");
    v55 = v54;
    v97 = v55;
    v15 = objc_msgSend(v119, "hidingAlternateDescriptor");
    v16 = (uint64_t)v57;
    if ((v15 & 1) == 0)
      v16 = (uint64_t)v56;
    v58 = v16;
    v59 = (id)objc_msgSend(*((id *)v119 + 33), "humanReadableUpdateName");
    v60 = v59;
    v96 = v60;
    v62 = (id)objc_msgSend(v119, "enrolledBetaProgram");
    v94 = 0;
    if (v62)
    {
      v95 = (id)objc_msgSend(v119, "enrolledBetaProgram");
      v94 = 1;
      v48 = objc_msgSend(v95, "programID");
    }
    else
    {
      v48 = 0;
    }
    v39 = v48;
    v47 = (id)objc_msgSend(v119, "betaPrograms");
    v40 = objc_msgSend(v47, "count");
    v46 = (id)objc_msgSend(v119, "currentFullScanOperation");
    v45 = (id)objc_msgSend(v119, "currentRefreshScanOperation");
    v44 = (id)objc_msgSend(v119, "currentUpdateOperation");
    v43 = (id)objc_msgSend(v119, "auxiliaryOperations");
    v41 = &v20;
    buf = v120;
    __os_log_helper_16_2_23_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_66((uint64_t)v120, (uint64_t)v80, (uint64_t)v76, v77, (uint64_t)v65, (uint64_t)v66, (uint64_t)v67, (uint64_t)v68, (uint64_t)v69, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, v52, v53, (uint64_t)v55, v58, (uint64_t)v60, v48, v40,
      (uint64_t)v46,
      (uint64_t)v45,
      (uint64_t)v44,
      objc_msgSend(v43, "count"),
      (uint64_t)v111);
    _os_log_impl(&dword_21BF33000, log, v74[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Beginning a post download refresh operation with scan ID: %{public}@",
      buf,
      0xE8u);

    if ((v94 & 1) != 0)
    if ((v98 & 1) != 0)

    if ((v100 & 1) != 0)
    if ((v102 & 1) != 0)

    if ((v104 & 1) != 0)
    if ((v106 & 1) != 0)

    v38 = 0;
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, v38);
    objc_storeStrong(&v108, v38);
  }
  objc_storeStrong((id *)&oslog, 0);
  v17 = [SUSettingsScanOperation alloc];
  v32 = &v111;
  v18 = -[SUSettingsScanOperation initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:](v17, "initWithUUID:usingSUManagerClient:andBetaManager:withCompletionQueue:", v111, *((_QWORD *)v119 + 28), *((_QWORD *)v119 + 29), *((_QWORD *)v119 + 21));
  v31 = &v93;
  v93 = v18;
  objc_msgSend(*((id *)v119 + 26), "addObject:", v18);
  v21 = (id *)&v86;
  v86 = MEMORY[0x24BDAC760];
  v87 = -1073741824;
  v88 = 0;
  v89 = __142__SUSettingsStatefulUIManager_performPostUpdateOperationRefresh_withDownload_didScheduledUpdate_autoInstallOperation_error_completionHandler___block_invoke;
  v90 = &unk_24DFF8058;
  v30 = (id *)v91;
  v91[0] = v119;
  v29 = v21 + 7;
  v33 = &v112;
  v91[3] = v112;
  v28 = v21 + 5;
  v91[1] = v93;
  v27 = v21 + 6;
  v34 = &v113;
  v91[2] = v113;
  v19 = MEMORY[0x220773A28](v21);
  v26 = (id *)&v92;
  v92 = v19;
  v22 = v93;
  v25 = (id)objc_msgSend(*((id *)v119 + 10), "descriptor");
  v24 = (id)objc_msgSend(*((id *)v119 + 11), "descriptor");
  v23 = (id)objc_msgSend(v119, "createScanOperationOptions");
  p_location = &location;
  v35 = &v114;
  objc_msgSend(v22, "refreshScanResultsWithPreferredUpdate:alternateUpdate:options:previouslyDiscoveredDownload:previouslyDiscoveredAutoInstallOperation:encounteredError:completionHandler:", v25, v24, v92);

  v37 = 0;
  objc_storeStrong(v26, 0);
  objc_storeStrong(v27, v37);
  objc_storeStrong(v28, v37);
  objc_storeStrong(v29, v37);
  objc_storeStrong(v30, v37);
  objc_storeStrong(v31, v37);
  objc_storeStrong(v32, v37);
  objc_storeStrong(v33, v37);
  objc_storeStrong(v34, v37);
  objc_storeStrong(v35, v37);
  objc_storeStrong(p_location, v37);
}

void __142__SUSettingsStatefulUIManager_performPostUpdateOperationRefresh_withDownload_didScheduledUpdate_autoInstallOperation_error_completionHandler___block_invoke(NSObject *a1, void *a2, void *a3)
{
  objc_class *v3;
  char v4;
  const char *v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void (*v14)(void);
  id v15;
  Class isa;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint8_t *buf;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  id v43;
  id v44;
  int v45;
  id v46;
  int v47;
  const __CFString *v48;
  const __CFString *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  int v55;
  const __CFString *v56;
  os_log_t log;
  os_log_type_t v58[4];
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  id v63;
  const char *v64;
  id obj;
  NSObject *v66;
  int v67;
  char v68;
  id v69;
  id v70;
  id v71;
  char v72;
  id v73;
  char v74;
  id v75;
  char v76;
  id v77;
  char v78;
  id v79;
  char v80;
  id v81;
  id v82;
  os_log_type_t type;
  os_log_t oslog[2];
  id v85;
  id location[2];
  _BYTE v87[264];
  uint64_t v88;

  v66 = a1;
  obj = a3;
  v64 = "-[SUSettingsStatefulUIManager performPostUpdateOperationRefresh:withDownload:didScheduledUpdate:autoInstallOpera"
        "tion:error:completionHandler:]_block_invoke";
  v88 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v85 = 0;
  objc_storeStrong(&v85, obj);
  oslog[1] = v66;
  v63 = (id)-[objc_class log](v66[4].isa, "log");
  oslog[0] = (os_log_t)(id)objc_msgSend(v63, "oslog");

  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    log = oslog[0];
    *(_DWORD *)v58 = type;
    v59 = SUSettingsUIStateToString(-[objc_class currentState](v66[4].isa, "currentState"));
    v60 = v59;
    v82 = v60;
    v61 = -[objc_class currentState](v66[4].isa, "currentState");
    v62 = (id)-[objc_class delegate](v66[4].isa, "delegate");
    v80 = 0;
    v78 = 0;
    if (v62)
    {
      v81 = (id)-[objc_class delegate](v66[4].isa, "delegate");
      v55 = 1;
      v80 = 1;
      v3 = (objc_class *)objc_opt_class();
      v79 = NSStringFromClass(v3);
      v78 = 1;
      v56 = (const __CFString *)v79;
    }
    else
    {
      v56 = CFSTR("(null)");
    }
    v49 = v56;
    v50 = (id)-[objc_class delegate](v66[4].isa, "delegate");
    v51 = (id)-[objc_class scanError](v66[4].isa, "scanError");
    v52 = (id)-[objc_class preferredStatefulDescriptor](v66[4].isa, "preferredStatefulDescriptor");
    v53 = (id)-[objc_class alternateStatefulDescriptor](v66[4].isa, "alternateStatefulDescriptor");
    v54 = (id)-[objc_class currentDownload](v66[4].isa, "currentDownload");
    v76 = 0;
    v74 = 0;
    v72 = 0;
    if (v54)
    {
      v77 = (id)-[objc_class currentDownload](v66[4].isa, "currentDownload");
      v47 = 1;
      v76 = 1;
      v75 = (id)objc_msgSend(v77, "descriptor");
      v74 = 1;
      v73 = (id)objc_msgSend(v75, "humanReadableUpdateName");
      v72 = 1;
      v48 = (const __CFString *)v73;
    }
    else
    {
      v48 = CFSTR("(null)");
    }
    v33 = v48;
    v34 = (id)-[objc_class currentDownload](v66[4].isa, "currentDownload");
    v4 = -[objc_class performThirdPartyScan](v66[4].isa, "performThirdPartyScan");
    v40 = "NO";
    v5 = "YES";
    v41 = "YES";
    v45 = 1;
    if ((v4 & 1) == 0)
      v5 = "NO";
    v35 = v5;
    v6 = -[objc_class isTargetedUpdateScheduledForAutoInstall](v66[4].isa, "isTargetedUpdateScheduledForAutoInstall");
    v7 = (uint64_t)v41;
    if ((v6 & 1) == 0)
      v7 = (uint64_t)v40;
    v36 = v7;
    v8 = -[objc_class hidingPreferredDescriptor](v66[4].isa, "hidingPreferredDescriptor");
    v9 = (uint64_t)v41;
    if ((v8 & 1) == 0)
      v9 = (uint64_t)v40;
    v37 = v9;
    v38 = (id)objc_msgSend(*((id *)v66[4].isa + 32), "humanReadableUpdateName");
    v39 = v38;
    v71 = v39;
    v10 = -[objc_class hidingAlternateDescriptor](v66[4].isa, "hidingAlternateDescriptor");
    v11 = (uint64_t)v41;
    if ((v10 & 1) == 0)
      v11 = (uint64_t)v40;
    v42 = v11;
    v43 = (id)objc_msgSend(*((id *)v66[4].isa + 33), "humanReadableUpdateName");
    v44 = v43;
    v70 = v44;
    v46 = (id)-[objc_class enrolledBetaProgram](v66[4].isa, "enrolledBetaProgram");
    v68 = 0;
    if (v46)
    {
      v69 = (id)-[objc_class enrolledBetaProgram](v66[4].isa, "enrolledBetaProgram");
      v68 = 1;
      v32 = objc_msgSend(v69, "programID");
    }
    else
    {
      v32 = 0;
    }
    v23 = v32;
    v31 = (id)-[objc_class betaPrograms](v66[4].isa, "betaPrograms");
    v24 = objc_msgSend(v31, "count");
    v30 = (id)-[objc_class currentFullScanOperation](v66[4].isa, "currentFullScanOperation");
    v29 = (id)-[objc_class currentRefreshScanOperation](v66[4].isa, "currentRefreshScanOperation");
    v28 = (id)-[objc_class currentUpdateOperation](v66[4].isa, "currentUpdateOperation");
    v27 = (id)-[objc_class auxiliaryOperations](v66[4].isa, "auxiliaryOperations");
    v12 = objc_msgSend(v27, "count");
    if (v85)
      v13 = "failed";
    else
      v13 = "completed successfully";
    v25 = &v18;
    buf = v87;
    __os_log_helper_16_2_25_8_32_8_66_8_0_8_66_8_0_8_66_8_66_8_66_8_66_8_0_8_34_8_34_8_34_8_66_8_34_8_66_8_0_8_0_8_0_8_0_8_0_8_0_8_32_8_66_8_66((uint64_t)v87, (uint64_t)v64, (uint64_t)v60, v61, (uint64_t)v49, (uint64_t)v50, (uint64_t)v51, (uint64_t)v52, (uint64_t)v53, (uint64_t)v33, (uint64_t)v34, (uint64_t)v35, v36, v37, (uint64_t)v39, v42, (uint64_t)v44, v23, v24,
      (uint64_t)v30,
      (uint64_t)v29,
      (uint64_t)v28,
      v12,
      (uint64_t)v13,
      (uint64_t)v85,
      (uint64_t)location[0]);
    _os_log_impl(&dword_21BF33000, log, v58[0], "%s: Stateful UI Manager Checkpoint\n\tcurrentState: %{public}@ (%ld)\n\tdelegate: %{public}@ (%p)\n\tscanError: %{public}@\n\tpreferredDescriptor: %{public}@\n\talternateDescriptor: %{public}@\n\tdownload: %{public}@ (%p)\n\tthirdPartyScan: %{public}s\n\tscheduledForAutoInstall: %{public}s\n\thiddenUpdatesPostSelection: preferred[%{public}s, %{public}@]; alternate[%{public}s, %{public}@];\n"
      "\tselectedBetaProgram: %lu (count: %ld)\n"
      "\tOpFSMs: scan[%p]; refresh[%p]; update[%p]; auxiliaryOperationsCount[%lu]\n"
      "\n"
      "Post update request refresh operation %s with error: %{public}@; scan results: %{public}@",
      buf,
      0xFCu);

    if ((v68 & 1) != 0)
    if ((v72 & 1) != 0)

    if ((v74 & 1) != 0)
    if ((v76 & 1) != 0)

    if ((v78 & 1) != 0)
    if ((v80 & 1) != 0)

    v22 = 0;
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, v22);
    objc_storeStrong(&v82, v22);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v85)
  {
    v14 = (void (*)(void))*((_QWORD *)v66[7].isa + 2);
    v21 = 1;
    v14();
    v20 = (id)-[objc_class auxiliaryOperations](v66[4].isa, "auxiliaryOperations");
    objc_msgSend(v20, "removeObject:", v66[5].isa);

    v67 = v21;
  }
  else
  {
    v15 = (id)objc_msgSend(location[0], "currentDownload");
    isa = v66[4].isa;
    v17 = (void *)*((_QWORD *)isa + 13);
    *((_QWORD *)isa + 13) = v15;

    -[objc_class updateDescriptorsUsingScanResults:andWithConcreteError:](v66[4].isa, "updateDescriptorsUsingScanResults:andWithConcreteError:", location[0], v66[6].isa);
    (*((void (**)(void))v66[7].isa + 2))();
    objc_msgSend(*((id *)v66[4].isa + 26), "removeObject:", v66[5].isa);
    v67 = 0;
  }
  v19 = 0;
  objc_storeStrong(&v85, 0);
  objc_storeStrong(location, v19);
}

- (id)createUpdateOperationOptions
{
  BOOL v2;
  BOOL v3;
  BOOL v4;
  id v6;
  id v7[2];
  SUSettingsStatefulUIManager *v8;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = objc_alloc_init(SUSettingsUpdateOptions);
  v2 = -[SUSettingsStatefulUIOptions allowUnrestrictedCellularDownload](v8->_options, "allowUnrestrictedCellularDownload");
  objc_msgSend(v7[0], "setAllowUnrestrictedCellularDownload:", v2);
  v3 = -[SUSettingsStatefulUIOptions clientIsBuddy](v8->_options, "clientIsBuddy");
  objc_msgSend(v7[0], "setClientIsBuddy:", v3);
  v4 = -[SUSettingsStatefulUIOptions bypassTermsAndConditions](v8->_options, "bypassTermsAndConditions");
  objc_msgSend(v7[0], "setBypassTermsAndConditions:", v4);
  objc_msgSend(v7[0], "setAgreementManager:", v8->_agreementManager);
  v6 = v7[0];
  objc_storeStrong(v7, 0);
  return v6;
}

- (void)hidePreferredUpdate
{
  id v2;
  SUCoreLog *v3;
  SUCoreLog *v4;
  SUSettingsStatefulUIManager *obj;
  id v6;
  os_log_type_t v7;
  id v8;
  int v9;
  os_log_type_t v10;
  id location[4];
  SUSettingsStatefulUIManager *v12;
  uint8_t v13[32];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  location[3] = (id)a2;
  obj = self;
  objc_sync_enter(obj);
  if (-[SUSettingsStatefulUIOptions shouldHideNonTargetedUpdatesPostUserSelection](v12->_options, "shouldHideNonTargetedUpdatesPostUserSelection"))
  {
    v3 = -[SUSettingsStatefulUIManager log](v12, "log");
    v8 = (id)-[SUCoreLog oslog](v3, "oslog");

    v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      v2 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v12->_preferredStatefulDescriptor, "humanReadableUpdateName");
      v6 = v2;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v13, (uint64_t)"-[SUSettingsStatefulUIManager hidePreferredUpdate]", (uint64_t)v6);
      _os_log_impl(&dword_21BF33000, (os_log_t)v8, v7, "%s: Hiding preferred update: %{public}@", v13, 0x16u);

      objc_storeStrong(&v6, 0);
    }
    objc_storeStrong(&v8, 0);
    objc_storeStrong((id *)&v12->_hiddenPreferredStatefulDescriptor, v12->_preferredStatefulDescriptor);
    objc_storeStrong((id *)&v12->_preferredStatefulDescriptor, v12->_alternateStatefulDescriptor);
    objc_storeStrong((id *)&v12->_alternateStatefulDescriptor, 0);
    v12->_hidingPreferredDescriptor = 1;
    v12->_hidingAlternateDescriptor = 0;
    v9 = 0;
  }
  else
  {
    v4 = -[SUSettingsStatefulUIManager log](v12, "log");
    location[0] = (id)-[SUCoreLog oslog](v4, "oslog");

    v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[SUSettingsStatefulUIManager hidePreferredUpdate]");
      _os_log_impl(&dword_21BF33000, (os_log_t)location[0], v10, "%s: A request to hide the preferred update was received. Rejecting this request as this ability was disabled via the manager's options.", v14, 0xCu);
    }
    objc_storeStrong(location, 0);
    v9 = 1;
  }
  objc_sync_exit(obj);

}

- (void)hideAlternateUpdate
{
  id v2;
  SUCoreLog *v3;
  SUCoreLog *v4;
  SUSettingsStatefulUIManager *obj;
  id v6;
  os_log_type_t v7;
  id v8;
  int v9;
  os_log_type_t v10;
  id location[4];
  SUSettingsStatefulUIManager *v12;
  uint8_t v13[32];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  location[3] = (id)a2;
  obj = self;
  objc_sync_enter(obj);
  if (-[SUSettingsStatefulUIOptions shouldHideNonTargetedUpdatesPostUserSelection](v12->_options, "shouldHideNonTargetedUpdatesPostUserSelection"))
  {
    v3 = -[SUSettingsStatefulUIManager log](v12, "log");
    v8 = (id)-[SUCoreLog oslog](v3, "oslog");

    v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      v2 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v12->_alternateStatefulDescriptor, "humanReadableUpdateName");
      v6 = v2;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v13, (uint64_t)"-[SUSettingsStatefulUIManager hideAlternateUpdate]", (uint64_t)v6);
      _os_log_impl(&dword_21BF33000, (os_log_t)v8, v7, "%s: Hiding alternate update: %{public}@", v13, 0x16u);

      objc_storeStrong(&v6, 0);
    }
    objc_storeStrong(&v8, 0);
    objc_storeStrong((id *)&v12->_hiddenAlternateStatefulDescriptor, v12->_alternateStatefulDescriptor);
    objc_storeStrong((id *)&v12->_alternateStatefulDescriptor, 0);
    v12->_hidingPreferredDescriptor = 0;
    v12->_hidingAlternateDescriptor = 1;
    v9 = 0;
  }
  else
  {
    v4 = -[SUSettingsStatefulUIManager log](v12, "log");
    location[0] = (id)-[SUCoreLog oslog](v4, "oslog");

    v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[SUSettingsStatefulUIManager hideAlternateUpdate]");
      _os_log_impl(&dword_21BF33000, (os_log_t)location[0], v10, "%s: A request to hide the alternate update was received. Rejecting this request as this ability was disabled via the manager's options.", v14, 0xCu);
    }
    objc_storeStrong(location, 0);
    v9 = 1;
  }
  objc_sync_exit(obj);

}

- (void)revealHiddenPreferredUpdate
{
  id v2;
  SUCoreLog *v3;
  SUCoreLog *v4;
  SUSettingsStatefulUIManager *obj;
  id v6;
  os_log_type_t v7;
  id v8;
  int v9;
  os_log_type_t v10;
  id location[4];
  SUSettingsStatefulUIManager *v12;
  uint8_t v13[32];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  location[3] = (id)a2;
  obj = self;
  objc_sync_enter(obj);
  if (-[SUSettingsStatefulUIOptions shouldHideNonTargetedUpdatesPostUserSelection](v12->_options, "shouldHideNonTargetedUpdatesPostUserSelection"))
  {
    v3 = -[SUSettingsStatefulUIManager log](v12, "log");
    v8 = (id)-[SUCoreLog oslog](v3, "oslog");

    v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      v2 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v12->_hiddenPreferredStatefulDescriptor, "humanReadableUpdateName");
      v6 = v2;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v13, (uint64_t)"-[SUSettingsStatefulUIManager revealHiddenPreferredUpdate]", (uint64_t)v6);
      _os_log_impl(&dword_21BF33000, (os_log_t)v8, v7, "%s: Revealing the previously hidden preferred update: %{public}@", v13, 0x16u);

      objc_storeStrong(&v6, 0);
    }
    objc_storeStrong(&v8, 0);
    objc_storeStrong((id *)&v12->_alternateStatefulDescriptor, v12->_preferredStatefulDescriptor);
    objc_storeStrong((id *)&v12->_preferredStatefulDescriptor, v12->_hiddenPreferredStatefulDescriptor);
    objc_storeStrong((id *)&v12->_hiddenPreferredStatefulDescriptor, 0);
    v12->_hidingPreferredDescriptor = 0;
    v9 = 0;
  }
  else
  {
    v4 = -[SUSettingsStatefulUIManager log](v12, "log");
    location[0] = (id)-[SUCoreLog oslog](v4, "oslog");

    v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[SUSettingsStatefulUIManager revealHiddenPreferredUpdate]");
      _os_log_impl(&dword_21BF33000, (os_log_t)location[0], v10, "%s: A request to reveal the hidden preferred update was received. Rejecting this request as this ability was disabled via the manager's options.", v14, 0xCu);
    }
    objc_storeStrong(location, 0);
    v9 = 1;
  }
  objc_sync_exit(obj);

}

- (void)revealHiddenAlteranteUpdate
{
  id v2;
  SUCoreLog *v3;
  SUCoreLog *v4;
  SUSettingsStatefulUIManager *obj;
  id v6;
  os_log_type_t v7;
  id v8;
  int v9;
  os_log_type_t v10;
  id location[4];
  SUSettingsStatefulUIManager *v12;
  uint8_t v13[32];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = self;
  location[3] = (id)a2;
  obj = self;
  objc_sync_enter(obj);
  if (-[SUSettingsStatefulUIOptions shouldHideNonTargetedUpdatesPostUserSelection](v12->_options, "shouldHideNonTargetedUpdatesPostUserSelection"))
  {
    v3 = -[SUSettingsStatefulUIManager log](v12, "log");
    v8 = (id)-[SUCoreLog oslog](v3, "oslog");

    v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      v2 = -[SUSettingsStatefulDescriptor humanReadableUpdateName](v12->_hiddenAlternateStatefulDescriptor, "humanReadableUpdateName");
      v6 = v2;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v13, (uint64_t)"-[SUSettingsStatefulUIManager revealHiddenAlteranteUpdate]", (uint64_t)v6);
      _os_log_impl(&dword_21BF33000, (os_log_t)v8, v7, "%s: Reveal the previously hidden alternate update: %{public}@", v13, 0x16u);

      objc_storeStrong(&v6, 0);
    }
    objc_storeStrong(&v8, 0);
    objc_storeStrong((id *)&v12->_alternateStatefulDescriptor, v12->_hiddenAlternateStatefulDescriptor);
    objc_storeStrong((id *)&v12->_hiddenAlternateStatefulDescriptor, 0);
    v12->_hidingAlternateDescriptor = 0;
    v9 = 0;
  }
  else
  {
    v4 = -[SUSettingsStatefulUIManager log](v12, "log");
    location[0] = (id)-[SUCoreLog oslog](v4, "oslog");

    v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v14, (uint64_t)"-[SUSettingsStatefulUIManager revealHiddenAlteranteUpdate]");
      _os_log_impl(&dword_21BF33000, (os_log_t)location[0], v10, "%s: A request to reveal the hidden alternate update was received. Rejecting this request as this ability was disabled via the manager's options.", v14, 0xCu);
    }
    objc_storeStrong(location, 0);
    v9 = 1;
  }
  objc_sync_exit(obj);

}

- (void)handleScanFinishedRollbackApplied:(id)a3
{
  NSObject *queue;
  SUCoreLog *v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(id *);
  void *v9;
  SUSettingsStatefulUIManager *v10;
  id v11;
  os_log_type_t v12;
  id v13;
  id location[2];
  SUSettingsStatefulUIManager *v15;
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[SUSettingsStatefulUIManager log](v15, "log");
  v13 = (id)-[SUCoreLog oslog](v4, "oslog");

  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v16, (uint64_t)"-[SUSettingsStatefulUIManager handleScanFinishedRollbackApplied:]");
    _os_log_impl(&dword_21BF33000, (os_log_t)v13, v12, "%s: Rollback applied. Attempts to ask to reboot the device.", v16, 0xCu);
  }
  objc_storeStrong(&v13, 0);
  queue = v15->_delegateCallbackQueue;
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __65__SUSettingsStatefulUIManager_handleScanFinishedRollbackApplied___block_invoke;
  v9 = &unk_24DFF7B80;
  v10 = v15;
  v11 = location[0];
  dispatch_async(queue, &v5);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(location, 0);
}

void __65__SUSettingsStatefulUIManager_handleScanFinishedRollbackApplied___block_invoke(id *a1)
{
  id v2;
  id WeakRetained;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *, void *);
  void *v8;
  id v9;
  id v10[3];

  v10[2] = a1;
  v10[1] = a1;
  WeakRetained = objc_loadWeakRetained((id *)a1[4] + 4);
  v2 = a1[4];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __65__SUSettingsStatefulUIManager_handleScanFinishedRollbackApplied___block_invoke_2;
  v8 = &unk_24DFF80A8;
  v9 = a1[4];
  v10[0] = a1[5];
  objc_msgSend(WeakRetained, "statefulUIManager:requestRollbackRestartApprovalWithReplyHandler:", v2);

  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
}

void __65__SUSettingsStatefulUIManager_handleScanFinishedRollbackApplied___block_invoke_2(id *a1, void *a2)
{
  NSObject *queue;
  NSObject *log;
  os_log_type_t type;
  __CFString *v5;
  id v6;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(_QWORD *);
  void *v12;
  id v13;
  id v14[2];
  __CFString *v15;
  os_log_type_t v16;
  id v17[2];
  void *v18;
  id *v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = a1;
  v18 = a2;
  v17[1] = a1;
  v6 = (id)objc_msgSend(a1[4], "log");
  v17[0] = (id)objc_msgSend(v6, "oslog");

  v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v17[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v17[0];
    type = v16;
    v5 = SUSettingsUserInteractionResponseTypeToString((uint64_t)v18);
    v15 = v5;
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v20, (uint64_t)"-[SUSettingsStatefulUIManager handleScanFinishedRollbackApplied:]_block_invoke_2", (uint64_t)v15);
    _os_log_impl(&dword_21BF33000, log, type, "%s: User responded to the rollback reboot request: %{public}@", v20, 0x16u);

    objc_storeStrong((id *)&v15, 0);
  }
  objc_storeStrong(v17, 0);
  queue = *((_QWORD *)a1[4] + 21);
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __65__SUSettingsStatefulUIManager_handleScanFinishedRollbackApplied___block_invoke_312;
  v12 = &unk_24DFF8080;
  v14[1] = v18;
  v13 = a1[4];
  v14[0] = a1[5];
  dispatch_async(queue, &v8);
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
}

void __65__SUSettingsStatefulUIManager_handleScanFinishedRollbackApplied___block_invoke_312(_QWORD *a1)
{
  id v1;
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  if (a1[6])
  {
    objc_msgSend(*(id *)(a1[4] + 216), "postEvent:withInfo:", CFSTR("CheckingForUpdatesFailed"), a1[5]);
  }
  else
  {
    v2[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE38500]), "initWithReason:", CFSTR("Reboot for rollback apply"));
    objc_msgSend(v2[0], "setRebootType:", 1);
    v1 = objc_alloc_init(MEMORY[0x24BE38508]);
    objc_msgSend(v1, "shutdownWithOptions:", v2[0]);
    objc_storeStrong(&v1, 0);
    objc_storeStrong(v2, 0);
  }
}

- (void)updateDescriptorsUsingScanResults:(id)a3 andWithConcreteError:(id)a4
{
  id v5;
  id location[2];
  SUSettingsStatefulUIManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[SUSettingsStatefulUIManager hideNonTargetedUpdateDescriptors](v7, "hideNonTargetedUpdateDescriptors");
  -[SUSettingsStatefulDescriptor updateStateWithScanResults:andWithConcreteError:](v7->_preferredStatefulDescriptor, "updateStateWithScanResults:andWithConcreteError:", location[0], v5);
  -[SUSettingsStatefulDescriptor updateStateWithScanResults:andWithConcreteError:](v7->_alternateStatefulDescriptor, "updateStateWithScanResults:andWithConcreteError:", location[0], v5);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)hideNonTargetedUpdateDescriptors
{
  SUDescriptor *v2;
  SUDescriptor *v3;
  char v4;
  SUDescriptor *v5;
  SUDescriptor *v6;
  char v7;
  SUDownloadOptions *v8;
  BOOL v9;

  if (self->_currentDownload)
  {
    v8 = -[SUDownload downloadOptions](self->_currentDownload, "downloadOptions");
    v9 = 0;
    if ((-[SUDownloadOptions isAutoDownload](v8, "isAutoDownload") & 1) == 0)
    {
      v9 = 0;
      if (!self->_hidingPreferredDescriptor)
        v9 = !self->_hidingAlternateDescriptor;
    }

    if (v9)
    {
      v6 = -[SUDownload descriptor](self->_currentDownload, "descriptor");
      v5 = -[SUSettingsStatefulDescriptor descriptor](self->_preferredStatefulDescriptor, "descriptor");
      v7 = -[SUDescriptor isEqual:](v6, "isEqual:");

      if ((v7 & 1) != 0)
      {
        -[SUSettingsStatefulUIManager hideAlternateUpdate](self, "hideAlternateUpdate");
      }
      else
      {
        v3 = -[SUDownload descriptor](self->_currentDownload, "descriptor");
        v2 = -[SUSettingsStatefulDescriptor descriptor](self->_alternateStatefulDescriptor, "descriptor");
        v4 = -[SUDescriptor isEqual:](v3, "isEqual:");

        if ((v4 & 1) != 0)
          -[SUSettingsStatefulUIManager hidePreferredUpdate](self, "hidePreferredUpdate");
      }
    }
  }
}

- (void)executeOperationOnDelegate:(SEL)a3 usingBlock:(id)a4
{
  NSObject *queue;
  id v5;
  SUSettingsStatefulUIManagerDelegate *v6;
  char v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  char v14;
  SUSettingsStatefulUIManagerDelegate *v15;
  id location[3];
  SUSettingsStatefulUIManager *v17;

  v17 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v6 = -[SUSettingsStatefulUIManager delegate](v17, "delegate");
  v14 = 0;
  v7 = 0;
  if (v6)
  {
    v15 = -[SUSettingsStatefulUIManager delegate](v17, "delegate");
    v14 = 1;
    v7 = objc_opt_respondsToSelector();
  }
  if ((v14 & 1) != 0)

  if ((v7 & 1) != 0)
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    queue = (id)objc_msgSend(v5, "selectDelegateCallbackQueue:", v17->_delegateCallbackQueue);
    v8 = MEMORY[0x24BDAC760];
    v9 = -1073741824;
    v10 = 0;
    v11 = __69__SUSettingsStatefulUIManager_executeOperationOnDelegate_usingBlock___block_invoke;
    v12 = &unk_24DFF7BA8;
    v13 = location[0];
    dispatch_async(queue, &v8);

    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(location, 0);
}

uint64_t __69__SUSettingsStatefulUIManager_executeOperationOnDelegate_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2);
}

- (void)setCurrentDownload:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  char isKindOfClass;
  uint64_t currentDownload;
  const __CFString *v10;
  id v11;
  SUSettingsStatefulUIManager *obj;
  char v13;
  __CFString *v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  __CFString *v20;
  char v21;
  SUDescriptor *v22;
  char v23;
  SUDescriptor *v24;
  id v25;
  id location[2];
  SUSettingsStatefulUIManager *v27;
  uint8_t v28[72];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  obj = v27;
  objc_sync_enter(obj);
  if (location[0] != v27->_currentDownload || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v11 = SUSettingsSharedLogger();
    v25 = (id)objc_msgSend(v11, "oslog");

    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 0;
      v21 = 0;
      v19 = 0;
      if (v27->_currentDownload
        && (v24 = -[SUDownload descriptor](v27->_currentDownload, "descriptor"),
            v23 = 1,
            v24))
      {
        v22 = -[SUDownload descriptor](v27->_currentDownload, "descriptor");
        v21 = 1;
        v20 = (__CFString *)(id)-[SUDescriptor humanReadableUpdateName](v22, "humanReadableUpdateName");
        v19 = 1;
        v10 = v20;
      }
      else
      {
        v10 = CFSTR("N/A");
      }
      currentDownload = (uint64_t)v27->_currentDownload;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v3 = CFSTR("YES");
      if ((isKindOfClass & 1) == 0)
        v3 = CFSTR("NO");
      v7 = (uint64_t)v3;
      v17 = 0;
      v15 = 0;
      v13 = 0;
      if (location[0]
        && (v18 = (id)objc_msgSend(location[0], "descriptor"), v17 = 1, v18))
      {
        v16 = (id)objc_msgSend(location[0], "descriptor");
        v15 = 1;
        v14 = (__CFString *)(id)objc_msgSend(v16, "humanReadableUpdateName");
        v13 = 1;
        v6 = v14;
      }
      else
      {
        v6 = CFSTR("N/A");
      }
      v5 = location[0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4 = CFSTR("YES");
      else
        v4 = CFSTR("NO");
      __os_log_helper_16_2_7_8_32_8_66_8_0_8_66_8_66_8_0_8_66((uint64_t)v28, (uint64_t)"-[SUSettingsStatefulUIManager setCurrentDownload:]", (uint64_t)v10, currentDownload, v7, (uint64_t)v6, (uint64_t)v5, (uint64_t)v4);
      _os_log_impl(&dword_21BF33000, (os_log_t)v25, OS_LOG_TYPE_DEFAULT, "%s: Replacing the current download object with a new one.\n\tCurrent: %{public}@ (%p, is SUSUIUninitializedDownload? %{public}@)\n\tNew: %{public}@ (%p, is SUSUIUninitializedDownload? %{public}@)\n", v28, 0x48u);
      if ((v13 & 1) != 0)

      if ((v15 & 1) != 0)
      if ((v17 & 1) != 0)

      if ((v19 & 1) != 0)
      if ((v21 & 1) != 0)

      if ((v23 & 1) != 0)
    }
    objc_storeStrong(&v25, 0);
    objc_storeStrong((id *)&v27->_currentDownload, location[0]);
  }
  objc_sync_exit(obj);

  objc_storeStrong(location, 0);
}

- (int64_t)convertFSMStateToUIState:(id)a3
{
  id location[3];
  int64_t v5;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("Idle")) & 1) != 0)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("CheckingForAvailableUpdate")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("ScanFailed")) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("NoUpdateFound")) & 1) != 0)
  {
    v5 = 3;
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("UpdatesAvailable")) & 1) != 0)
  {
    v5 = 4;
  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_storeStrong(location, 0);
  return v5;
}

- (void)assignDescriptorOfType:(unint64_t)a3 fromSearchResults:(id)a4
{
  id v4;
  id v5;
  BOOL v6;
  const char *v7;
  const char *v8;
  BOOL v9;
  const char *v10;
  const char *v11;
  SUSettingsStatefulDescriptor *v12;
  SUSettingsStatefulDescriptor *v13;
  id v14;
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  id v22;
  id v23;
  __CFString *v24;
  SUCoreLog *v25;
  __CFString *v26;
  id v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  id v32;
  id v33;
  __CFString *v34;
  SUCoreLog *v35;
  NSObject *log;
  os_log_type_t type;
  __CFString *v38;
  SUCoreLog *v39;
  id v40;
  id v41;
  __CFString *v42;
  os_log_type_t v43;
  os_log_t v44;
  id v45;
  id v46;
  __CFString *v47;
  os_log_type_t v48;
  os_log_t oslog;
  char v50;
  id v51;
  char v52;
  id v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  id v59;
  int v60;
  __CFString *v61;
  char v62;
  id v63;
  id location;
  unint64_t v65;
  SEL v66;
  SUSettingsStatefulUIManager *v67;
  uint8_t v68[80];
  uint8_t v69[80];
  uint8_t v70[24];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v67 = self;
  v66 = a2;
  v65 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  if (v65 < 2)
  {
    v57 = 0;
    v55 = 0;
    if (v65)
    {
      v56 = -[SUSettingsStatefulUIManager alternateStatefulDescriptor](v67, "alternateStatefulDescriptor");
      v55 = 1;
      v4 = v56;
    }
    else
    {
      v58 = -[SUSettingsStatefulUIManager preferredStatefulDescriptor](v67, "preferredStatefulDescriptor");
      v57 = 1;
      v4 = v58;
    }
    v59 = v4;
    if ((v55 & 1) != 0)

    if ((v57 & 1) != 0)
    v52 = 0;
    v50 = 0;
    if (v65)
    {
      v51 = (id)objc_msgSend(location, "alternateDescriptor");
      v50 = 1;
      v5 = v51;
    }
    else
    {
      v53 = (id)objc_msgSend(location, "preferredDescriptor");
      v52 = 1;
      v5 = v53;
    }
    v54 = v5;
    if ((v50 & 1) != 0)

    if ((v52 & 1) != 0)
    if (v59 || v54)
    {
      if ((objc_msgSend(v59, "isEqualToDescriptor:", v54) & 1) != 0)
      {
        v35 = -[SUSettingsStatefulUIManager log](v67, "log");
        oslog = (os_log_t)(id)-[SUCoreLog oslog](v35, "oslog");

        v48 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v30 = oslog;
          v31 = v48;
          v34 = SUSettingsDescriptorTypeToString(v65);
          v26 = v34;
          v47 = v26;
          v33 = (id)objc_msgSend(v59, "humanReadableUpdateName");
          v27 = v33;
          v46 = v27;
          v32 = (id)objc_msgSend(v54, "humanReadableUpdateName");
          v28 = v32;
          v45 = v28;
          v6 = -[SUSettingsStatefulUIManager hidingPreferredDescriptor](v67, "hidingPreferredDescriptor");
          v7 = "YES";
          if (!v6)
            v7 = "NO";
          v29 = (uint64_t)v7;
          if (-[SUSettingsStatefulUIManager hidingAlternateDescriptor](v67, "hidingAlternateDescriptor"))
            v8 = "YES";
          else
            v8 = "NO";
          __os_log_helper_16_2_7_8_66_8_66_8_0_8_66_8_0_8_32_8_32((uint64_t)v69, (uint64_t)v26, (uint64_t)v27, (uint64_t)v59, (uint64_t)v28, (uint64_t)v54, v29, (uint64_t)v8);
          _os_log_impl(&dword_21BF33000, v30, v31, "%{public}@ descriptor assignment: the given descriptor is equal to the current stateful descriptor. Updating internal state instead of creation of an entirely new one.\n\tCurrent: %{public}@ (%p)\n\tNew: %{public}@ (%p)\n\tHiding: Preferred - %s; Alternate: %s",
            v69,
            0x48u);

          objc_storeStrong(&v45, 0);
          objc_storeStrong(&v46, 0);
          objc_storeStrong((id *)&v47, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        -[SUSettingsStatefulUIManager hideNonTargetedUpdateDescriptors](v67, "hideNonTargetedUpdateDescriptors");
        objc_msgSend(v59, "updateStateWithScanResults:andWithConcreteError:", location, 0);
        v60 = 1;
      }
      else
      {
        v25 = -[SUSettingsStatefulUIManager log](v67, "log");
        v44 = (os_log_t)(id)-[SUCoreLog oslog](v25, "oslog");

        v43 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v44;
          v21 = v43;
          v24 = SUSettingsDescriptorTypeToString(v65);
          v16 = v24;
          v42 = v16;
          v23 = (id)objc_msgSend(v59, "humanReadableUpdateName");
          v17 = v23;
          v41 = v17;
          v22 = (id)objc_msgSend(v54, "humanReadableUpdateName");
          v18 = v22;
          v40 = v18;
          v9 = -[SUSettingsStatefulUIManager hidingPreferredDescriptor](v67, "hidingPreferredDescriptor");
          v10 = "YES";
          if (!v9)
            v10 = "NO";
          v19 = (uint64_t)v10;
          if (-[SUSettingsStatefulUIManager hidingAlternateDescriptor](v67, "hidingAlternateDescriptor"))
            v11 = "YES";
          else
            v11 = "NO";
          __os_log_helper_16_2_7_8_66_8_66_8_0_8_66_8_0_8_32_8_32((uint64_t)v68, (uint64_t)v16, (uint64_t)v17, (uint64_t)v59, (uint64_t)v18, (uint64_t)v54, v19, (uint64_t)v11);
          _os_log_impl(&dword_21BF33000, v20, v21, "%{public}@ descriptor assignment: Replacing the current descriptor with a new descriptor.\n\tCurrent: %{public}@ (%p)\n\tNew: %{public}@ (%p)\n\tHiding: Preferred - %s; Alternate: %s",
            v68,
            0x48u);

          objc_storeStrong(&v40, 0);
          objc_storeStrong(&v41, 0);
          objc_storeStrong((id *)&v42, 0);
        }
        objc_storeStrong((id *)&v44, 0);
        if (v65)
        {
          if (v54)
          {
            v13 = [SUSettingsStatefulDescriptor alloc];
            v14 = -[SUSettingsStatefulDescriptor initForDescriptor:fromScanResults:managedBy:](v13, "initForDescriptor:fromScanResults:managedBy:", v65, location, v67);
            -[SUSettingsStatefulUIManager setAlternateStatefulDescriptor:](v67, "setAlternateStatefulDescriptor:");

          }
          else
          {
            -[SUSettingsStatefulUIManager setAlternateStatefulDescriptor:](v67, "setAlternateStatefulDescriptor:", 0);
          }
        }
        else if (v54)
        {
          v12 = [SUSettingsStatefulDescriptor alloc];
          v15 = -[SUSettingsStatefulDescriptor initForDescriptor:fromScanResults:managedBy:](v12, "initForDescriptor:fromScanResults:managedBy:", v65, location, v67);
          -[SUSettingsStatefulUIManager setPreferredStatefulDescriptor:](v67, "setPreferredStatefulDescriptor:");

        }
        else
        {
          -[SUSettingsStatefulUIManager setPreferredStatefulDescriptor:](v67, "setPreferredStatefulDescriptor:", 0);
        }
        v60 = 0;
      }
    }
    else
    {
      v60 = 1;
    }
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v59, 0);
  }
  else
  {
    v39 = -[SUSettingsStatefulUIManager log](v67, "log");
    v63 = (id)-[SUCoreLog oslog](v39, "oslog");

    v62 = 16;
    if (os_log_type_enabled((os_log_t)v63, OS_LOG_TYPE_ERROR))
    {
      log = v63;
      type = v62;
      v38 = SUSettingsDescriptorTypeToString(v65);
      v61 = v38;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v70, (uint64_t)"-[SUSettingsStatefulUIManager assignDescriptorOfType:fromSearchResults:]", (uint64_t)v61);
      _os_log_error_impl(&dword_21BF33000, log, type, "%s: Invalid descriptor type: %{public}@", v70, 0x16u);

      objc_storeStrong((id *)&v61, 0);
    }
    objc_storeStrong(&v63, 0);
    v60 = 1;
  }
  objc_storeStrong(&location, 0);
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
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@.susettings.fsm.manager"), v4);

  return v6;
}

- (SUSettingsStatefulUIManagerDelegate)delegate
{
  return (SUSettingsStatefulUIManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegateCallbackQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (SUSettingsStatefulUIOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (SUSettingsStatefulErrorContextProvider)errorContextProvider
{
  return self->_errorContextProvider;
}

- (void)setErrorContextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_errorContextProvider, a3);
}

- (SUSettingsSUPreferencesManager)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (SUSettingsStatefulDescriptor)preferredStatefulDescriptor
{
  return (SUSettingsStatefulDescriptor *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPreferredStatefulDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (SUSettingsStatefulDescriptor)alternateStatefulDescriptor
{
  return (SUSettingsStatefulDescriptor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAlternateStatefulDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSError)scanError
{
  return (NSError *)objc_getProperty(self, a2, 96, 1);
}

- (void)setScanError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (SUDownload)currentDownload
{
  return self->_currentDownload;
}

- (BOOL)isClearingSpaceForDownload
{
  return self->_clearingSpaceForDownload;
}

- (void)setClearingSpaceForDownload:(BOOL)a3
{
  self->_clearingSpaceForDownload = a3;
}

- (SUCoreDDMDeclaration)ddmDeclaration
{
  return self->_ddmDeclaration;
}

- (void)setDDMDeclaration:(id)a3
{
  objc_storeStrong((id *)&self->_ddmDeclaration, a3);
}

- (BOOL)isRollingBack
{
  return self->_rollingBack;
}

- (void)setRollingBack:(BOOL)a3
{
  self->_rollingBack = a3;
}

- (SURollbackDescriptor)rollbackDescriptor
{
  return self->_rollbackDescriptor;
}

- (void)setRollbackDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_rollbackDescriptor, a3);
}

- (SDDevice)currentSeedingDevice
{
  return self->_currentSeedingDevice;
}

- (void)setCurrentSeedingDevice:(id)a3
{
  objc_storeStrong((id *)&self->_currentSeedingDevice, a3);
}

- (NSArray)betaPrograms
{
  return self->_betaPrograms;
}

- (void)setBetaPrograms:(id)a3
{
  objc_storeStrong((id *)&self->_betaPrograms, a3);
}

- (SDBetaProgram)enrolledBetaProgram
{
  return self->_enrolledBetaProgram;
}

- (void)setEnrolledBetaProgram:(id)a3
{
  objc_storeStrong((id *)&self->_enrolledBetaProgram, a3);
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (SUCoreLog)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)preferencesQueue
{
  return self->_preferencesQueue;
}

- (void)setPreferencesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_preferencesQueue, a3);
}

- (SUSettingsScanOperation)currentFullScanOperation
{
  return (SUSettingsScanOperation *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCurrentFullScanOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (SUSettingsScanOperation)currentRefreshScanOperation
{
  return (SUSettingsScanOperation *)objc_getProperty(self, a2, 192, 1);
}

- (void)setCurrentRefreshScanOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (SUSettingsUpdateOperation)currentUpdateOperation
{
  return (SUSettingsUpdateOperation *)objc_getProperty(self, a2, 200, 1);
}

- (void)setCurrentUpdateOperation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSMutableSet)auxiliaryOperations
{
  return self->_auxiliaryOperations;
}

- (void)setAuxiliaryOperations:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryOperations, a3);
}

- (BOOL)performThirdPartyScan
{
  return self->_performThirdPartyScan;
}

- (void)setPerformThirdPartyScan:(BOOL)a3
{
  self->_performThirdPartyScan = a3;
}

- (int)networkType
{
  return self->_networkType;
}

- (void)setNetworkType:(int)a3
{
  self->_networkType = a3;
}

- (unsigned)originalWifiFlag
{
  return self->_originalWifiFlag;
}

- (void)setOriginalWifiFlag:(unsigned __int8)a3
{
  self->_originalWifiFlag = a3;
}

- (unsigned)originalCellFlag
{
  return self->_originalCellFlag;
}

- (void)setOriginalCellFlag:(unsigned __int8)a3
{
  self->_originalCellFlag = a3;
}

- (BOOL)connectedToPowerSource
{
  return self->_connectedToPowerSource;
}

- (void)setConnectedToPowerSource:(BOOL)a3
{
  self->_connectedToPowerSource = a3;
}

- (float)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(float)a3
{
  self->_batteryLevel = a3;
}

- (SUCoreFSM)managerFSM
{
  return self->_managerFSM;
}

- (SUManagerClient)suClient
{
  return self->_suClient;
}

- (SDBetaManager)seedingBetaManager
{
  return self->_seedingBetaManager;
}

- (SUSUIUpdateAgreementManager)agreementManager
{
  return self->_agreementManager;
}

- (void)setAgreementManager:(id)a3
{
  objc_storeStrong((id *)&self->_agreementManager, a3);
}

- (BOOL)isAutoUpdateScheduled
{
  return self->_isAutoUpdateScheduled;
}

- (void)setIsAutoUpdateScheduled:(BOOL)a3
{
  self->_isAutoUpdateScheduled = a3;
}

- (SUAutoInstallOperation)currentAutoInstallOperation
{
  return self->_currentAutoInstallOperation;
}

- (void)setCurrentAutoInstallOperation:(id)a3
{
  objc_storeStrong((id *)&self->_currentAutoInstallOperation, a3);
}

- (SUSettingsStatefulDescriptor)hiddenPreferredStatefulDescriptor
{
  return (SUSettingsStatefulDescriptor *)objc_getProperty(self, a2, 256, 1);
}

- (void)setHiddenPreferredStatefulDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (SUSettingsStatefulDescriptor)hiddenAlternateStatefulDescriptor
{
  return (SUSettingsStatefulDescriptor *)objc_getProperty(self, a2, 264, 1);
}

- (void)setHiddenAlternateStatefulDescriptor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (BOOL)hidingPreferredDescriptor
{
  return self->_hidingPreferredDescriptor;
}

- (void)setHidingPreferredDescriptor:(BOOL)a3
{
  self->_hidingPreferredDescriptor = a3;
}

- (BOOL)hidingAlternateDescriptor
{
  return self->_hidingAlternateDescriptor;
}

- (void)setHidingAlternateDescriptor:(BOOL)a3
{
  self->_hidingAlternateDescriptor = a3;
}

- (unint64_t)mdmPathRestrictions
{
  return self->_mdmPathRestrictions;
}

- (void)setMdmPathRestrictions:(unint64_t)a3
{
  self->_mdmPathRestrictions = a3;
}

- (void)setDelayingUpdate:(BOOL)a3
{
  self->_delayingUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenAlternateStatefulDescriptor, 0);
  objc_storeStrong((id *)&self->_hiddenPreferredStatefulDescriptor, 0);
  objc_storeStrong((id *)&self->_currentAutoInstallOperation, 0);
  objc_storeStrong((id *)&self->_agreementManager, 0);
  objc_storeStrong((id *)&self->_seedingBetaManager, 0);
  objc_storeStrong((id *)&self->_suClient, 0);
  objc_storeStrong((id *)&self->_managerFSM, 0);
  objc_storeStrong((id *)&self->_auxiliaryOperations, 0);
  objc_storeStrong((id *)&self->_currentUpdateOperation, 0);
  objc_storeStrong((id *)&self->_currentRefreshScanOperation, 0);
  objc_storeStrong((id *)&self->_currentFullScanOperation, 0);
  objc_storeStrong((id *)&self->_preferencesQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_stateTable, 0);
  objc_storeStrong((id *)&self->_enrolledBetaProgram, 0);
  objc_storeStrong((id *)&self->_betaPrograms, 0);
  objc_storeStrong((id *)&self->_currentSeedingDevice, 0);
  objc_storeStrong((id *)&self->_rollbackDescriptor, 0);
  objc_storeStrong((id *)&self->_ddmDeclaration, 0);
  objc_storeStrong((id *)&self->_currentDownload, 0);
  objc_storeStrong((id *)&self->_scanError, 0);
  objc_storeStrong((id *)&self->_alternateStatefulDescriptor, 0);
  objc_storeStrong((id *)&self->_preferredStatefulDescriptor, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_errorContextProvider, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_delegateCallbackQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
