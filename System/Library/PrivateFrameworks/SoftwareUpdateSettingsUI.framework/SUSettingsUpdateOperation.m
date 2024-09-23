@implementation SUSettingsUpdateOperation

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
  id v56;
  id v57;
  id v58;
  id v59[3];
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[4];
  _QWORD v89[4];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[2];
  _QWORD v101[2];
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
  _QWORD v112[6];
  _QWORD v113[6];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[2];
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[2];
  _QWORD v123[2];
  _QWORD v124[2];
  _QWORD v125[2];
  _QWORD v126[6];
  _QWORD v127[6];
  _QWORD v128[2];
  _QWORD v129[2];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  _QWORD v137[2];
  _QWORD v138[5];
  _QWORD v139[5];
  _QWORD v140[2];
  _QWORD v141[2];
  _QWORD v142[2];
  _QWORD v143[2];
  _QWORD v144[2];
  _QWORD v145[2];
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[2];
  _QWORD v149[2];
  _QWORD v150[5];
  _QWORD v151[5];
  _QWORD v152[2];
  _QWORD v153[2];
  uint64_t v154;
  const __CFString *v155;
  _QWORD v156[2];
  _QWORD v157[2];
  uint64_t v158;
  const __CFString *v159;
  _QWORD v160[4];
  _QWORD v161[4];
  _QWORD v162[10];
  _QWORD v163[11];

  v163[10] = *MEMORY[0x24BDAC8D0];
  v59[2] = a1;
  v59[1] = (id)a2;
  v162[0] = CFSTR("Idle");
  v160[0] = CFSTR("BeginDownloadUpdate");
  v4 = (_QWORD *)MEMORY[0x24BEAEA98];
  v158 = *MEMORY[0x24BEAEA98];
  v159 = CFSTR("PrepareUpdateProcess");
  v56 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v159, &v158);
  v161[0] = v56;
  v160[1] = CFSTR("PrepareUpdateProcessSuccess");
  v5 = (_QWORD *)MEMORY[0x24BEAEBD0];
  v156[0] = *MEMORY[0x24BEAEBD0];
  v157[0] = CFSTR("PurgingSpace");
  v156[1] = *v4;
  v157[1] = CFSTR("PurgeSpace");
  v55 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v157, v156);
  v161[1] = v55;
  v160[2] = CFSTR("PrepareUpdateProcessFailed");
  v154 = *v4;
  v155 = CFSTR("ReportUpdateOperationOutcome");
  v54 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
  v161[2] = v54;
  v160[3] = CFSTR("CancelUpdate");
  v152[0] = *v5;
  v153[0] = CFSTR("Idle");
  v152[1] = *v4;
  v153[1] = CFSTR("ReportUpdateOperationOutcome");
  v53 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v153, v152, 2);
  v161[3] = v53;
  v52 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v161, v160);
  v163[0] = v52;
  v162[1] = CFSTR("PurgingSpace");
  v150[0] = CFSTR("PurgeSuccess");
  v148[0] = *v5;
  v149[0] = CFSTR("AquiringKeybag");
  v148[1] = *v4;
  v149[1] = CFSTR("AquireKeybag");
  v51 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v149, v148, 2);
  v151[0] = v51;
  v150[1] = CFSTR("NoPurgableDownloadAvailable");
  v146[0] = *v5;
  v147[0] = CFSTR("AquiringKeybag");
  v146[1] = *v4;
  v147[1] = CFSTR("AquireKeybag");
  v50 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v147, v146, 2);
  v151[1] = v50;
  v150[2] = CFSTR("PurgeUserReject");
  v144[0] = *v5;
  v145[0] = CFSTR("Idle");
  v144[1] = *v4;
  v145[1] = CFSTR("ReportUpdateOperationOutcome");
  v49 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v145, v144, 2);
  v151[2] = v49;
  v150[3] = CFSTR("PurgeFailed");
  v142[0] = *v5;
  v143[0] = CFSTR("Idle");
  v142[1] = *v4;
  v143[1] = CFSTR("ReportUpdateOperationOutcome");
  v48 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v143, v142, 2);
  v151[3] = v48;
  v150[4] = CFSTR("CancelUpdate");
  v140[0] = *v5;
  v141[0] = CFSTR("Idle");
  v140[1] = *v4;
  v141[1] = CFSTR("ReportUpdateOperationOutcome");
  v47 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v141, v140, 2);
  v151[4] = v47;
  v46 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v151, v150);
  v163[1] = v46;
  v162[2] = CFSTR("AquiringKeybag");
  v138[0] = CFSTR("KeybagNotRequired");
  v136[0] = *v5;
  v137[0] = CFSTR("PresentingTermsConditions");
  v136[1] = *v4;
  v137[1] = CFSTR("PresentTermsConditions");
  v45 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v137, v136, 2);
  v139[0] = v45;
  v138[1] = CFSTR("KeybagCreated");
  v134[0] = *v5;
  v135[0] = CFSTR("PresentingTermsConditions");
  v134[1] = *v4;
  v135[1] = CFSTR("PresentTermsConditions");
  v44 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v135, v134, 2);
  v139[1] = v44;
  v138[2] = CFSTR("KeybagCreationFailed");
  v132[0] = *v5;
  v133[0] = CFSTR("Idle");
  v132[1] = *v4;
  v133[1] = CFSTR("ReportUpdateOperationOutcome");
  v43 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v133, v132, 2);
  v139[2] = v43;
  v138[3] = CFSTR("KeybagUserReject");
  v130[0] = *v5;
  v131[0] = CFSTR("Idle");
  v130[1] = *v4;
  v131[1] = CFSTR("ReportUpdateOperationOutcome");
  v42 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v131, v130, 2);
  v139[3] = v42;
  v138[4] = CFSTR("CancelUpdate");
  v128[0] = *v5;
  v129[0] = CFSTR("Idle");
  v128[1] = *v4;
  v129[1] = CFSTR("ReportUpdateOperationOutcome");
  v41 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v129, v128, 2);
  v139[4] = v41;
  v40 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v139, v138, 5);
  v163[2] = v40;
  v162[3] = CFSTR("PresentingTermsConditions");
  v126[0] = CFSTR("TermsConditionsAlreadyAgreed");
  v124[0] = *v5;
  v125[0] = CFSTR("ResolvingUpdateOperation");
  v124[1] = *v4;
  v125[1] = CFSTR("ResolveUpdateOperation");
  v39 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v125, v124, 2);
  v127[0] = v39;
  v126[1] = CFSTR("TermsConditionsNotRequired");
  v122[0] = *v5;
  v123[0] = CFSTR("ResolvingUpdateOperation");
  v122[1] = *v4;
  v123[1] = CFSTR("ResolveUpdateOperation");
  v38 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v123, v122, 2);
  v127[1] = v38;
  v126[2] = CFSTR("TermsConditionsBypassed");
  v120[0] = *v5;
  v121[0] = CFSTR("ResolvingUpdateOperation");
  v120[1] = *v4;
  v121[1] = CFSTR("ResolveUpdateOperation");
  v37 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v121, v120, 2);
  v127[2] = v37;
  v126[3] = CFSTR("TermsConditionsAgreed");
  v118[0] = *v5;
  v119[0] = CFSTR("ResolvingUpdateOperation");
  v118[1] = *v4;
  v119[1] = CFSTR("ResolveUpdateOperation");
  v36 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v119, v118, 2);
  v127[3] = v36;
  v126[4] = CFSTR("TermsConditionsRejected");
  v116[0] = *v5;
  v117[0] = CFSTR("Idle");
  v116[1] = *v4;
  v117[1] = CFSTR("ReportUpdateOperationOutcome");
  v35 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v117, v116, 2);
  v127[4] = v35;
  v126[5] = CFSTR("CancelUpdate");
  v114[0] = *v5;
  v115[0] = CFSTR("Idle");
  v114[1] = *v4;
  v115[1] = CFSTR("ReportUpdateOperationOutcome");
  v34 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v115, v114, 2);
  v127[5] = v34;
  v33 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v127, v126);
  v163[3] = v33;
  v162[4] = CFSTR("ResolvingUpdateOperation");
  v112[0] = CFSTR("UpdateOpDownloadAndInstall");
  v110[0] = *v5;
  v111[0] = CFSTR("PresentingDownloadConstraints");
  v110[1] = *v4;
  v111[1] = CFSTR("PresentDownloadConstraints");
  v32 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v111, v110, 2);
  v113[0] = v32;
  v112[1] = CFSTR("UpdateOpDownloadAndSchedule");
  v108[0] = *v5;
  v109[0] = CFSTR("PresentingDownloadConstraints");
  v108[1] = *v4;
  v109[1] = CFSTR("PresentDownloadConstraints");
  v31 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v109, v108, 2);
  v113[1] = v31;
  v112[2] = CFSTR("UpdateOpOnlyDownload");
  v106[0] = *v5;
  v107[0] = CFSTR("PresentingDownloadConstraints");
  v106[1] = *v4;
  v107[1] = CFSTR("PresentDownloadConstraints");
  v30 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v107, v106, 2);
  v113[2] = v30;
  v112[3] = CFSTR("UpdateOpOnlySchedule");
  v104[0] = *v5;
  v105[0] = CFSTR("SchedulingUpdate");
  v104[1] = *v4;
  v105[1] = CFSTR("ScheduleUpdate");
  v29 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v105, v104, 2);
  v113[3] = v29;
  v112[4] = CFSTR("UpdateOpOnlyInstall");
  v102[0] = *v5;
  v103[0] = CFSTR("InitiatingUpdateInstallation");
  v102[1] = *v4;
  v103[1] = CFSTR("InitiateUpdateInstallation");
  v28 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v103, v102, 2);
  v113[4] = v28;
  v112[5] = CFSTR("CancelUpdate");
  v100[0] = *v5;
  v101[0] = CFSTR("Idle");
  v100[1] = *v4;
  v101[1] = CFSTR("ReportUpdateOperationOutcome");
  v27 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v101, v100, 2);
  v113[5] = v27;
  v26 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v113, v112, 6);
  v163[4] = v26;
  v162[5] = CFSTR("PresentingDownloadConstraints");
  v98[0] = CFSTR("DownloadConstraintsNotRequired");
  v96[0] = *v5;
  v97[0] = CFSTR("InitiatingUpdateDownload");
  v96[1] = *v4;
  v97[1] = CFSTR("InitiateUpdateDownload");
  v25 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v97, v96, 2);
  v99[0] = v25;
  v98[1] = CFSTR("DownloadConstraintsAgreed");
  v94[0] = *v5;
  v95[0] = CFSTR("InitiatingUpdateDownload");
  v94[1] = *v4;
  v95[1] = CFSTR("InitiateUpdateDownload");
  v24 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v95, v94, 2);
  v99[1] = v24;
  v98[2] = CFSTR("DownloadConstraintsRejected");
  v92[0] = *v5;
  v93[0] = CFSTR("Idle");
  v92[1] = *v4;
  v93[1] = CFSTR("ReportUpdateOperationOutcome");
  v23 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
  v99[2] = v23;
  v98[3] = CFSTR("CancelUpdate");
  v90[0] = *v5;
  v91[0] = CFSTR("Idle");
  v90[1] = *v4;
  v91[1] = CFSTR("ReportUpdateOperationOutcome");
  v22 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
  v99[3] = v22;
  v21 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v99, v98, 4);
  v163[5] = v21;
  v162[6] = CFSTR("InitiatingUpdateDownload");
  v88[0] = CFSTR("UpdateDownloadStarted");
  v86[0] = *v5;
  v87[0] = CFSTR("Idle");
  v86[1] = *v4;
  v87[1] = CFSTR("ReportUpdateOperationOutcome");
  v20 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
  v89[0] = v20;
  v88[1] = CFSTR("UpdateDownloadReadyToSchedule");
  v84[0] = *v5;
  v85[0] = CFSTR("SchedulingUpdate");
  v84[1] = *v4;
  v85[1] = CFSTR("ScheduleUpdate");
  v19 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
  v89[1] = v19;
  v88[2] = CFSTR("UpdateDownloadInitFailed");
  v82[0] = *v5;
  v83[0] = CFSTR("Idle");
  v82[1] = *v4;
  v83[1] = CFSTR("ReportUpdateOperationOutcome");
  v18 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
  v89[2] = v18;
  v88[3] = CFSTR("CancelUpdate");
  v80[0] = *v5;
  v81[0] = CFSTR("Idle");
  v80[1] = *v4;
  v81[1] = CFSTR("ReportUpdateOperationOutcome");
  v17 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
  v89[3] = v17;
  v16 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v89, v88, 4);
  v163[6] = v16;
  v162[7] = CFSTR("InitiatingUpdateInstallation");
  v78[0] = CFSTR("UpdateInstallationStarted");
  v76[0] = *v5;
  v77[0] = CFSTR("Idle");
  v76[1] = *v4;
  v77[1] = CFSTR("ReportUpdateOperationOutcome");
  v15 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
  v79[0] = v15;
  v78[1] = CFSTR("UpdateInstallationFailed");
  v74[0] = *v5;
  v75[0] = CFSTR("Idle");
  v74[1] = *v4;
  v75[1] = CFSTR("ReportUpdateOperationOutcome");
  v14 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v75, v74, 2);
  v79[1] = v14;
  v78[2] = CFSTR("CancelUpdate");
  v72[0] = *v5;
  v73[0] = CFSTR("Idle");
  v72[1] = *v4;
  v73[1] = CFSTR("ReportUpdateOperationOutcome");
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
  v79[2] = v13;
  v12 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v79, v78);
  v163[7] = v12;
  v162[8] = CFSTR("SchedulingUpdate");
  v70[0] = CFSTR("UpdateScheduleSuccess");
  v68[0] = *v5;
  v69[0] = CFSTR("Idle");
  v68[1] = *v4;
  v69[1] = CFSTR("ReportUpdateOperationOutcome");
  v11 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
  v71[0] = v11;
  v70[1] = CFSTR("UpdateScheduleFailed");
  v66[0] = *v5;
  v67[0] = CFSTR("Idle");
  v66[1] = *v4;
  v67[1] = CFSTR("ReportUpdateOperationOutcome");
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
  v71[1] = v10;
  v70[2] = CFSTR("CancelUpdate");
  v64[0] = *v5;
  v65[0] = CFSTR("Idle");
  v64[1] = *v4;
  v65[1] = CFSTR("ReportUpdateOperationOutcome");
  v9 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
  v71[2] = v9;
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 3);
  v163[8] = v8;
  v162[9] = *MEMORY[0x24BEAEBC0];
  v62 = *MEMORY[0x24BEAEBB8];
  v60 = *v5;
  v61 = *MEMORY[0x24BEAEBC8];
  v7 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
  v63 = v7;
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
  v163[9] = v6;
  v59[0] = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v163, v162, 10);

  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  v58 = (id)objc_msgSend(v2, "initWithDictionary:copyItems:", v59[0], 1);
  v57 = v58;
  objc_storeStrong(&v58, 0);
  objc_storeStrong(v59, 0);
  return v57;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  NSObject *queue;
  id v10;
  id v11;
  SUCoreFSM *v12;
  NSObject *v18;
  SUCoreFSM *v19;
  SUCoreFSM *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  void (*v26)(uint64_t);
  void *v27;
  SUSettingsUpdateOperation *v28;
  id *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id location[2];
  SUSettingsUpdateOperation *v35;
  int64_t v36;

  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  objc_storeStrong(&v33, a4);
  v32 = 0;
  objc_storeStrong(&v32, a5);
  v31 = 0;
  objc_storeStrong(&v31, a6);
  v30 = 0;
  objc_storeStrong(&v30, a7);
  v29 = a8;
  v19 = -[SUSettingsUpdateOperation updateFSM](v35, "updateFSM");
  v18 = (id)-[SUCoreFSM extendedStateQueue](v19, "extendedStateQueue");
  dispatch_assert_queue_V2(v18);

  v20 = v35->_updateFSM;
  objc_sync_enter(v20);
  if (v35->_canceled && !-[SUSettingsUpdateOperation isCancelableState:](v35, "isCancelableState:", v32))
  {
    v12 = -[SUSettingsUpdateOperation updateFSM](v35, "updateFSM");
    v11 = (id)-[SUCoreFSM diag](v12, "diag");
    v10 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("It's too late to cancel the operation in the current state. State: %@"), v32);
    objc_msgSend(v11, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"));

    queue = v35->_completionQueue;
    v23 = MEMORY[0x24BDAC760];
    v24 = -1073741824;
    v25 = 0;
    v26 = __84__SUSettingsUpdateOperation_performAction_onEvent_inState_withInfo_nextState_error___block_invoke;
    v27 = &unk_24DFF7B58;
    v28 = v35;
    dispatch_async(queue, &v23);
    v35->_canceled = 0;
    objc_storeStrong((id *)&v28, 0);
  }
  if (!v35->_canceled
    || (objc_msgSend(location[0], "isEqualToString:", CFSTR("ReportUpdateOperationOutcome")) & 1) != 0)
  {
    v22 = 0;
  }
  else
  {
    v36 = 0;
    v22 = 1;
  }
  objc_sync_exit(v20);

  if (!v22)
  {
    if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x24BEAEBB0]) & 1) != 0)
    {
      v21 = 0;
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("PrepareUpdateProcess")) & 1) != 0)
    {
      v21 = -[SUSettingsUpdateOperation action_PrepareUpdateProcess:error:](v35, "action_PrepareUpdateProcess:error:", v31, v29);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("PurgeSpace")) & 1) != 0)
    {
      v21 = -[SUSettingsUpdateOperation action_PurgeSpace:error:](v35, "action_PurgeSpace:error:", v31, v29);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("AquireKeybag")) & 1) != 0)
    {
      v21 = -[SUSettingsUpdateOperation action_AquireKeybag:error:](v35, "action_AquireKeybag:error:", v31, v29);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("PresentTermsConditions")) & 1) != 0)
    {
      v21 = -[SUSettingsUpdateOperation action_PresentTermsConditions:error:](v35, "action_PresentTermsConditions:error:", v31, v29);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("ResolveUpdateOperation")) & 1) != 0)
    {
      v21 = -[SUSettingsUpdateOperation action_ResolveUpdateOperation:error:](v35, "action_ResolveUpdateOperation:error:", v31, v29);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("PresentDownloadConstraints")) & 1) != 0)
    {
      v21 = -[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:](v35, "action_PresentDownloadConstraints:error:", v31, v29);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("InitiateUpdateDownload")) & 1) != 0)
    {
      v21 = -[SUSettingsUpdateOperation action_InitiateUpdateDownload:error:](v35, "action_InitiateUpdateDownload:error:", v31, v29);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("InitiateUpdateInstallation")) & 1) != 0)
    {
      v21 = -[SUSettingsUpdateOperation action_InitiateUpdateInstallation:error:](v35, "action_InitiateUpdateInstallation:error:", v31, v29);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("ScheduleUpdate")) & 1) != 0)
    {
      v21 = -[SUSettingsUpdateOperation action_ScheduleUpdate:error:](v35, "action_ScheduleUpdate:error:", v31, v29);
    }
    else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("ReportUpdateOperationOutcome")) & 1) != 0)
    {
      v21 = -[SUSettingsUpdateOperation action_ReportUpdateOperationOutcome:error:](v35, "action_ReportUpdateOperationOutcome:error:", v31, v29);
    }
    else
    {
      v21 = -[SUSettingsUpdateOperation actionUnknownAction:error:](v35, "actionUnknownAction:error:", location[0], v29);
    }
    v36 = v21;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v36;
}

void __84__SUSettingsUpdateOperation_performAction_onEvent_inState_withInfo_nextState_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 16))();
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 72);
  *(_QWORD *)(v1 + 72) = 0;

}

- (int64_t)action_PrepareUpdateProcess:(id)a3 error:(id *)a4
{
  SUManagerClient *suClient;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(id *, void *, void *);
  void *v11;
  SUSettingsUpdateOperation *v12;
  id v13[2];
  id location[2];
  SUSettingsUpdateOperation *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13[1] = a4;
  suClient = v15->_suClient;
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __63__SUSettingsUpdateOperation_action_PrepareUpdateProcess_error___block_invoke;
  v11 = &unk_24DFFAA18;
  v12 = v15;
  v13[0] = location[0];
  -[SUManagerClient download:](suClient, "download:");
  objc_storeStrong(v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(location, 0);
  return 0;
}

void __63__SUSettingsUpdateOperation_action_PrepareUpdateProcess_error___block_invoke(id *a1, void *a2, void *a3)
{
  const __CFString *v3;
  id v4;
  const __CFString *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v13;
  __CFString *v14;
  char v15;
  __CFString *v16;
  char v17;
  id v18;
  char v19;
  id v20;
  id v21;
  os_log_type_t v22;
  id v23[2];
  id v24;
  id location[2];
  uint8_t v26[72];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v24 = 0;
  objc_storeStrong(&v24, a3);
  v23[1] = a1;
  v10 = (id)objc_msgSend(a1[4], "log");
  v23[0] = (id)objc_msgSend(v10, "oslog");

  v22 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v23[0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = (id)objc_msgSend(a1[5], "descriptor");
    v7 = (id)objc_msgSend(v6, "humanReadableUpdateName");
    v8 = v7;
    v21 = v8;
    v9 = v24;
    v19 = 0;
    v17 = 0;
    v15 = 0;
    if (location[0]
      && (v20 = (id)objc_msgSend(location[0], "descriptor"), v19 = 1, v20))
    {
      v18 = (id)objc_msgSend(location[0], "descriptor");
      v17 = 1;
      v16 = (__CFString *)(id)objc_msgSend(v18, "humanReadableUpdateName");
      v15 = 1;
      v5 = v16;
    }
    else
    {
      v5 = CFSTR("N/A");
    }
    v4 = location[0];
    v13 = 0;
    if (location[0])
    {
      v14 = (__CFString *)(id)objc_msgSend(location[0], "progress");
      v13 = 1;
      v3 = v14;
    }
    else
    {
      v3 = CFSTR("N/A");
    }
    __os_log_helper_16_2_6_8_32_8_66_8_66_8_66_8_0_8_66((uint64_t)v26, (uint64_t)"-[SUSettingsUpdateOperation action_PrepareUpdateProcess:error:]_block_invoke", (uint64_t)v8, (uint64_t)v9, (uint64_t)v5, (uint64_t)v4, (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, (os_log_t)v23[0], v22, "%s [->%{public}@]: error: %{public}@; download: %{public}@ (%p); progress: %{public}@",
      v26,
      0x3Eu);
    if ((v13 & 1) != 0)

    if ((v15 & 1) != 0)
    if ((v17 & 1) != 0)

    if ((v19 & 1) != 0)
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(v23, 0);
  if (v24)
  {
    objc_msgSend(a1[5], "setOperationError:", v24);
    objc_msgSend(*((id *)a1[4] + 14), "postEvent:withInfo:", CFSTR("PrepareUpdateProcessFailed"), a1[5]);
  }
  else
  {
    objc_msgSend(a1[5], "setCurrentDownload:", location[0]);
    objc_msgSend(*((id *)a1[4] + 14), "postEvent:withInfo:", CFSTR("PrepareUpdateProcessSuccess"), a1[5]);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)action_PurgeSpace:(id)a3 error:(id *)a4
{
  NSObject *queue;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  SUCoreLog *v13;
  id v14;
  SUManagerClient *suClient;
  NSObject *v16;
  os_log_type_t v17;
  id v18;
  id v19;
  SUCoreLog *v20;
  id v21;
  char v22;
  NSObject *v23;
  os_log_type_t v24;
  id v25;
  id v26;
  SUCoreLog *v27;
  NSObject *log;
  os_log_type_t type;
  id v30;
  id v31;
  SUCoreLog *v32;
  id v33;
  id v34;
  char v35;
  id v36;
  NSObject *v38;
  SUCoreFSM *v39;
  uint64_t v40;
  int v41;
  int v42;
  void (*v43)(id *);
  void *v44;
  SUSettingsUpdateOperation *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  os_log_type_t v50;
  os_log_t oslog;
  uint64_t v52;
  int v53;
  int v54;
  void (*v55)(id *, char, id);
  void *v56;
  SUSettingsUpdateOperation *v57;
  id v58;
  id v59;
  id v60;
  os_log_type_t v61;
  id v62;
  id v63;
  os_log_type_t v64;
  id v65;
  id v66;
  os_log_type_t v67;
  id v68;
  id v69;
  int v70;
  id *v71;
  id location[2];
  SUSettingsUpdateOperation *v73;
  int64_t v74;
  uint8_t v75[32];
  uint8_t v76[32];
  uint8_t v77[32];
  uint8_t v78[24];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v73 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v71 = a4;
  v39 = -[SUSettingsUpdateOperation updateFSM](v73, "updateFSM");
  v38 = (id)-[SUCoreFSM extendedStateQueue](v39, "extendedStateQueue");
  dispatch_assert_queue_V2(v38);

  if (location[0])
  {
    v69 = (id)objc_msgSend(location[0], "currentDownload");
    v34 = (id)objc_msgSend(v69, "descriptor");
    v33 = (id)objc_msgSend(location[0], "descriptor");
    v35 = objc_msgSend(v34, "isEqual:");

    if ((v35 & 1) != 0)
    {
      v32 = -[SUSettingsUpdateOperation log](v73, "log");
      v68 = (id)-[SUCoreLog oslog](v32, "oslog");

      v67 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v68, OS_LOG_TYPE_DEFAULT))
      {
        log = v68;
        type = v67;
        v31 = (id)objc_msgSend(location[0], "descriptor");
        v30 = (id)objc_msgSend(v31, "humanReadableUpdateName");
        v66 = v30;
        __os_log_helper_16_2_2_8_32_8_66((uint64_t)v78, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]", (uint64_t)v66);
        _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: Currently downloading descriptor is the same as requested descriptor, do not purge", v78, 0x16u);

        objc_storeStrong(&v66, 0);
      }
      objc_storeStrong(&v68, 0);
      -[SUCoreFSM postEvent:withInfo:](v73->_updateFSM, "postEvent:withInfo:", CFSTR("NoPurgableDownloadAvailable"), location[0]);
      v74 = 0;
      v70 = 1;
    }
    else if (v69)
    {
      v21 = (id)objc_msgSend(location[0], "options");
      v22 = objc_msgSend(v21, "clientIsBuddy");

      if ((v22 & 1) != 0)
      {
        v20 = -[SUSettingsUpdateOperation log](v73, "log");
        v62 = (id)-[SUCoreLog oslog](v20, "oslog");

        v61 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v62, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v62;
          v17 = v61;
          v19 = (id)objc_msgSend(location[0], "descriptor");
          v18 = (id)objc_msgSend(v19, "humanReadableUpdateName");
          v60 = v18;
          __os_log_helper_16_2_2_8_32_8_66((uint64_t)v76, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]", (uint64_t)v60);
          _os_log_impl(&dword_21BF33000, v16, v17, "%s [->%{public}@]: Client is buddy: Attempting to purge w/o user confirmation", v76, 0x16u);

          objc_storeStrong(&v60, 0);
        }
        objc_storeStrong(&v62, 0);
        v59 = objc_alloc_init(MEMORY[0x24BEAEC58]);
        objc_msgSend(v59, "setNotifyUser:", 0);
        objc_msgSend(v59, "setUserRequested:", 0);
        suClient = v73->_suClient;
        v14 = v59;
        v52 = MEMORY[0x24BDAC760];
        v53 = -1073741824;
        v54 = 0;
        v55 = __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke;
        v56 = &unk_24DFF7E00;
        v57 = v73;
        v58 = location[0];
        -[SUManagerClient purgeDownloadWithOptions:withResult:](suClient, "purgeDownloadWithOptions:withResult:", v14, &v52);
        v74 = 0;
        v70 = 1;
        objc_storeStrong(&v58, 0);
        objc_storeStrong((id *)&v57, 0);
        objc_storeStrong(&v59, 0);
      }
      else
      {
        v13 = -[SUSettingsUpdateOperation log](v73, "log");
        oslog = (os_log_t)(id)-[SUCoreLog oslog](v13, "oslog");

        v50 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          v7 = oslog;
          v8 = v50;
          v12 = (id)objc_msgSend(location[0], "descriptor");
          v11 = (id)objc_msgSend(v12, "humanReadableUpdateName");
          v6 = v11;
          v49 = v6;
          v10 = (id)objc_msgSend(v69, "descriptor");
          v9 = (id)objc_msgSend(v10, "humanReadableUpdateName");
          v48 = v9;
          __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v75, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]", (uint64_t)v6, (uint64_t)v48);
          _os_log_impl(&dword_21BF33000, v7, v8, "%s [->%{public}@]: Attempting to get the user consent to purge the download: %{public}@", v75, 0x20u);

          objc_storeStrong(&v48, 0);
          objc_storeStrong(&v49, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        queue = v73->_delegateCallbackQueue;
        v40 = MEMORY[0x24BDAC760];
        v41 = -1073741824;
        v42 = 0;
        v43 = __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_206;
        v44 = &unk_24DFF7C20;
        v45 = v73;
        v46 = v69;
        v47 = location[0];
        dispatch_async(queue, &v40);
        v74 = 0;
        v70 = 1;
        objc_storeStrong(&v47, 0);
        objc_storeStrong(&v46, 0);
        objc_storeStrong((id *)&v45, 0);
      }
    }
    else
    {
      v27 = -[SUSettingsUpdateOperation log](v73, "log");
      v65 = (id)-[SUCoreLog oslog](v27, "oslog");

      v64 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v65;
        v24 = v64;
        v26 = (id)objc_msgSend(location[0], "descriptor");
        v25 = (id)objc_msgSend(v26, "humanReadableUpdateName");
        v63 = v25;
        __os_log_helper_16_2_2_8_32_8_66((uint64_t)v77, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]", (uint64_t)v63);
        _os_log_impl(&dword_21BF33000, v23, v24, "%s [->%{public}@]: There's no purgable download available.", v77, 0x16u);

        objc_storeStrong(&v63, 0);
      }
      objc_storeStrong(&v65, 0);
      -[SUCoreFSM postEvent:withInfo:](v73->_updateFSM, "postEvent:withInfo:", CFSTR("NoPurgableDownloadAvailable"), location[0]);
      v74 = 0;
      v70 = 1;
    }
    objc_storeStrong(&v69, 0);
  }
  else
  {
    v36 = (id)-[SUCoreFSM diag](v73->_updateFSM, "diag");
    objc_msgSend(v36, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v74 = 8102;
    v70 = 1;
  }
  objc_storeStrong(location, 0);
  return v74;
}

void __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke(id *a1, char a2, id obj)
{
  NSObject *log;
  os_log_type_t type;
  id v5;
  id v6;
  id v7;
  id v9;
  os_log_type_t v10;
  id v11[2];
  id location;
  char v13;
  id *v14;
  uint8_t v15[40];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v11[1] = a1;
  v7 = (id)objc_msgSend(a1[4], "log");
  v11[0] = (id)objc_msgSend(v7, "oslog");

  v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v11[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v11[0];
    type = v10;
    v6 = (id)objc_msgSend(a1[5], "descriptor");
    v5 = (id)objc_msgSend(v6, "humanReadableUpdateName");
    v9 = v5;
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v15, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]_block_invoke", (uint64_t)v9, v13 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: Purge result: %d; error: %{public}@", v15, 0x26u);

    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(v11, 0);
  if (location)
  {
    objc_msgSend(a1[5], "setOperationError:", location);
    objc_msgSend(*((id *)a1[4] + 14), "postEvent:withInfo:", CFSTR("PurgeFailed"), a1[5]);
  }
  else
  {
    objc_msgSend(*((id *)a1[4] + 14), "postEvent:withInfo:", CFSTR("PurgeSuccess"), a1[5]);
  }
  objc_storeStrong(&location, 0);
}

void __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_206(id *a1)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(id *, void *);
  void *v9;
  id v10;
  id v11;
  id v12[3];

  v12[2] = a1;
  v12[1] = a1;
  v4 = (void *)*((_QWORD *)a1[4] + 2);
  v2 = a1[4];
  v3 = a1[5];
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_2;
  v9 = &unk_24DFFAA68;
  v10 = a1[4];
  v11 = a1[6];
  v12[0] = a1[5];
  objc_msgSend(v4, "operation:requestPurgeConfirmationForDownload:replyHandler:", v2, v3);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
}

void __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_2(id *a1, void *a2)
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10;
  id v11[3];
  void *v12;
  id *v13;

  v13 = a1;
  v12 = a2;
  v11[2] = a1;
  queue = *((_QWORD *)a1[4] + 12);
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_3;
  v8 = &unk_24DFFAA40;
  v9 = a1[4];
  v10 = a1[5];
  v11[0] = a1[6];
  v11[1] = v12;
  dispatch_async(queue, &v4);
  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v9, 0);
}

void __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_3(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  NSObject *log;
  os_log_type_t type;
  __CFString *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(id *, char, id);
  void *v18;
  id v19;
  id v20;
  id v21;
  __CFString *v22;
  id v23;
  id v24;
  os_log_type_t v25;
  id v26[3];
  uint8_t v27[56];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v26[2] = (id)a1;
  v26[1] = (id)a1;
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "log");
  v26[0] = (id)objc_msgSend(v12, "oslog");

  v25 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v26[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v26[0];
    type = v25;
    v11 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
    v10 = (id)objc_msgSend(v11, "humanReadableUpdateName");
    v3 = v10;
    v24 = v3;
    v9 = (id)objc_msgSend(*(id *)(a1 + 48), "descriptor");
    v8 = (id)objc_msgSend(v9, "humanReadableUpdateName");
    v4 = v8;
    v23 = v4;
    v7 = SUSettingsUserInteractionResponseTypeToString(*(_QWORD *)(a1 + 56));
    v22 = v7;
    __os_log_helper_16_2_4_8_32_8_66_8_66_8_66((uint64_t)v27, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]_block_invoke_3", (uint64_t)v3, (uint64_t)v4, (uint64_t)v22);
    _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: User responded to the purge request of %{public}@: %{public}@", v27, 0x2Au);

    objc_storeStrong((id *)&v22, 0);
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(v26, 0);
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "postEvent:withInfo:", CFSTR("PurgeUserReject"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v21 = objc_alloc_init(MEMORY[0x24BEAEC58]);
    objc_msgSend(v21, "setNotifyUser:", 0);
    objc_msgSend(v21, "setUserRequested:", 1);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    v1 = v21;
    v14 = MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_207;
    v18 = &unk_24DFF7E00;
    v19 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 40);
    objc_msgSend(v2, "purgeDownloadWithOptions:withResult:", v1, &v14);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v21, 0);
  }
}

void __53__SUSettingsUpdateOperation_action_PurgeSpace_error___block_invoke_207(id *a1, char a2, id obj)
{
  NSObject *log;
  os_log_type_t type;
  id v5;
  id v6;
  id v7;
  id v9;
  os_log_type_t v10;
  id v11[2];
  id location;
  char v13;
  id *v14;
  uint8_t v15[40];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v11[1] = a1;
  v7 = (id)objc_msgSend(a1[4], "log");
  v11[0] = (id)objc_msgSend(v7, "oslog");

  v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v11[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v11[0];
    type = v10;
    v6 = (id)objc_msgSend(a1[5], "descriptor");
    v5 = (id)objc_msgSend(v6, "humanReadableUpdateName");
    v9 = v5;
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v15, (uint64_t)"-[SUSettingsUpdateOperation action_PurgeSpace:error:]_block_invoke", (uint64_t)v9, v13 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: Purge result: %d; error: %{public}@", v15, 0x26u);

    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(v11, 0);
  if (location)
  {
    objc_msgSend(a1[5], "setOperationError:", location);
    objc_msgSend(*((id *)a1[4] + 14), "postEvent:withInfo:", CFSTR("PurgeFailed"), a1[5]);
  }
  else
  {
    objc_msgSend(*((id *)a1[4] + 14), "postEvent:withInfo:", CFSTR("PurgeSuccess"), a1[5]);
  }
  objc_storeStrong(&location, 0);
}

- (int64_t)action_AquireKeybag:(id)a3 error:(id *)a4
{
  NSObject *queue;
  NSObject *v6;
  os_log_type_t v7;
  id v8;
  id v9;
  SUCoreLog *v10;
  NSObject *log;
  os_log_type_t type;
  id v13;
  id v14;
  SUCoreLog *v15;
  SUManagerClient *suClient;
  id v17;
  BOOL v18;
  char v19;
  id v20;
  NSObject *v22;
  SUCoreFSM *v23;
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(uint64_t);
  void *v28;
  SUSettingsUpdateOperation *v29;
  id v30;
  BOOL v31;
  id v32;
  os_log_type_t v33;
  id v34;
  id v35;
  os_log_type_t v36;
  id v37;
  char v38;
  id v39;
  char v40;
  id v41;
  char v42;
  BOOL v43;
  int v44;
  id *v45;
  id location[2];
  SUSettingsUpdateOperation *v47;
  int64_t v48;
  uint8_t v49[48];
  uint8_t v50[24];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v45 = a4;
  v23 = -[SUSettingsUpdateOperation updateFSM](v47, "updateFSM");
  v22 = (id)-[SUCoreFSM extendedStateQueue](v23, "extendedStateQueue");
  dispatch_assert_queue_V2(v22);

  if (location[0])
  {
    v43 = 0;
    suClient = v47->_suClient;
    v17 = (id)objc_msgSend(location[0], "descriptor");
    v18 = -[SUManagerClient isInstallationKeybagRequiredForDescriptor:](suClient, "isInstallationKeybagRequiredForDescriptor:");

    v43 = v18;
    v42 = v18;
    v40 = 0;
    v38 = 0;
    v19 = 0;
    if (!v18)
    {
      v41 = (id)objc_msgSend(location[0], "descriptor");
      v40 = 1;
      v19 = 0;
      if ((objc_msgSend(v41, "isSplatOnly") & 1) != 0)
      {
        v39 = (id)objc_msgSend(MEMORY[0x24BEAEC28], "sharedInstance");
        v38 = 1;
        v19 = objc_msgSend(v39, "hasPasscodeSet");
      }
    }
    if ((v38 & 1) != 0)

    if ((v40 & 1) != 0)
    if ((v19 & 1) != 0)
    {
      v15 = -[SUSettingsUpdateOperation log](v47, "log");
      v37 = (id)-[SUCoreLog oslog](v15, "oslog");

      v36 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v37, OS_LOG_TYPE_DEFAULT))
      {
        log = v37;
        type = v36;
        v14 = (id)objc_msgSend(location[0], "descriptor");
        v13 = (id)objc_msgSend(v14, "humanReadableUpdateName");
        v35 = v13;
        __os_log_helper_16_2_2_8_32_8_66((uint64_t)v50, (uint64_t)"-[SUSettingsUpdateOperation action_AquireKeybag:error:]", (uint64_t)v35);
        _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: Prompting for passcode for splat-only update, but not generating an installation keybag", v50, 0x16u);

        objc_storeStrong(&v35, 0);
      }
      objc_storeStrong(&v37, 0);
      v42 = 1;
    }
    if ((v42 & 1) != 0)
    {
      v10 = -[SUSettingsUpdateOperation log](v47, "log");
      v34 = (id)-[SUCoreLog oslog](v10, "oslog");

      v33 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
      {
        v6 = v34;
        v7 = v33;
        v9 = (id)objc_msgSend(location[0], "descriptor");
        v8 = (id)objc_msgSend(v9, "humanReadableUpdateName");
        v32 = v8;
        __os_log_helper_16_2_4_8_32_8_66_4_0_4_0((uint64_t)v49, (uint64_t)"-[SUSettingsUpdateOperation action_AquireKeybag:error:]", (uint64_t)v32, v43, v42 & 1);
        _os_log_impl(&dword_21BF33000, v6, v7, "%s [->%{public}@]: Attempts to create a Keybag by asking the user for the device passcode. isKeybagRequired: %d, askForPasscode: %d", v49, 0x22u);

        objc_storeStrong(&v32, 0);
      }
      objc_storeStrong(&v34, 0);
      queue = v47->_delegateCallbackQueue;
      v24 = MEMORY[0x24BDAC760];
      v25 = -1073741824;
      v26 = 0;
      v27 = __55__SUSettingsUpdateOperation_action_AquireKeybag_error___block_invoke;
      v28 = &unk_24DFFAAE0;
      v29 = v47;
      v30 = location[0];
      v31 = v43;
      dispatch_async(queue, &v24);
      v48 = 0;
      v44 = 1;
      objc_storeStrong(&v30, 0);
      objc_storeStrong((id *)&v29, 0);
    }
    else
    {
      -[SUCoreFSM postEvent:withInfo:](v47->_updateFSM, "postEvent:withInfo:", CFSTR("KeybagNotRequired"), location[0]);
      v48 = 0;
      v44 = 1;
    }
  }
  else
  {
    v20 = (id)-[SUCoreFSM diag](v47->_updateFSM, "diag");
    objc_msgSend(v20, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v48 = 8102;
    v44 = 1;
  }
  objc_storeStrong(location, 0);
  return v48;
}

void __55__SUSettingsUpdateOperation_action_AquireKeybag_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, void *, id);
  void *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v14 = a1;
  v13 = a1;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v2 = *(_QWORD *)(a1 + 32);
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __55__SUSettingsUpdateOperation_action_AquireKeybag_error___block_invoke_2;
  v9 = &unk_24DFFAAB8;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(_BYTE *)(a1 + 48) & 1;
  objc_msgSend(v3, "operation:requestDevicePasscodeForDescriptor:replyHandler:", v2, v4);

  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
}

void __55__SUSettingsUpdateOperation_action_AquireKeybag_error___block_invoke_2(uint64_t a1, void *a2, id obj)
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
  uint64_t v14;
  id location;
  void *v16;
  uint64_t v17;

  v17 = a1;
  v16 = a2;
  location = 0;
  objc_storeStrong(&location, obj);
  v14 = a1;
  queue = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __55__SUSettingsUpdateOperation_action_AquireKeybag_error___block_invoke_3;
  v9 = &unk_24DFFAA90;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12[1] = v16;
  v12[0] = location;
  v13 = *(_BYTE *)(a1 + 48) & 1;
  dispatch_async(queue, &v5);
  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
}

void __55__SUSettingsUpdateOperation_action_AquireKeybag_error___block_invoke_3(uint64_t a1)
{
  id v1;
  NSObject *v2;
  os_log_type_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;
  NSObject *log;
  os_log_type_t type;
  __CFString *v20;
  id v21;
  id v22;
  id v23;
  id v25;
  os_log_type_t v26;
  id v27;
  char v28;
  id v29;
  int v30;
  id v31;
  os_log_type_t v32;
  id v33;
  id v34;
  __CFString *v35;
  id v36;
  os_log_type_t v37;
  id v38[3];
  uint8_t v39[32];
  uint8_t v40[32];
  uint8_t v41[56];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v38[2] = (id)a1;
  v38[1] = (id)a1;
  v23 = (id)objc_msgSend(*(id *)(a1 + 32), "log");
  v38[0] = (id)objc_msgSend(v23, "oslog");

  v37 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v38[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v38[0];
    type = v37;
    v22 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
    v21 = (id)objc_msgSend(v22, "humanReadableUpdateName");
    v17 = v21;
    v36 = v17;
    v20 = SUSettingsUserInteractionResponseTypeToString(*(_QWORD *)(a1 + 56));
    v35 = v20;
    __os_log_helper_16_2_5_8_32_8_66_8_66_4_0_4_0((uint64_t)v41, (uint64_t)"-[SUSettingsUpdateOperation action_AquireKeybag:error:]_block_invoke_3", (uint64_t)v17, (uint64_t)v35, *(_QWORD *)(a1 + 48) != 0, objc_msgSend(*(id *)(a1 + 40), "isUnattendedInstall") & 1);
    _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: Passcode request result: %{public}@; passcode present: %d; for unattended install? %d",
      v41,
      0x2Cu);

    objc_storeStrong((id *)&v35, 0);
    objc_storeStrong(&v36, 0);
  }
  objc_storeStrong(v38, 0);
  if (!*(_QWORD *)(a1 + 56) && *(_QWORD *)(a1 + 48))
  {
    if ((*(_BYTE *)(a1 + 64) & 1) != 0)
    {
      v34 = objc_alloc_init(MEMORY[0x24BDDA938]);
      v14 = (id)objc_msgSend(*(id *)(a1 + 48), "dataUsingEncoding:", 4);
      v15 = objc_msgSend(v34, "setCredential:type:");

      if ((v15 & 1) != 0)
      {
        v29 = objc_alloc_init(MEMORY[0x24BEAEC30]);
        objc_msgSend(v29, "setLaContext:", v34);
        v7 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
        objc_msgSend(v29, "setDescriptor:");

        objc_msgSend(v29, "setKeybagType:", (objc_msgSend(*(id *)(a1 + 40), "isUnattendedInstall") & 1) != 0);
        v28 = 0;
        v28 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "createInstallationKeybagWithOptions:", v29) & 1;
        objc_msgSend(*(id *)(a1 + 40), "setCreatedKeybag:", v28 & 1);
        v6 = (id)objc_msgSend(*(id *)(a1 + 32), "log");
        v27 = (id)objc_msgSend(v6, "oslog");

        v26 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT))
        {
          v2 = v27;
          v3 = v26;
          v5 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
          v4 = (id)objc_msgSend(v5, "humanReadableUpdateName");
          v25 = v4;
          __os_log_helper_16_2_3_8_32_8_66_4_0((uint64_t)v39, (uint64_t)"-[SUSettingsUpdateOperation action_AquireKeybag:error:]_block_invoke", (uint64_t)v25, v28 & 1);
          _os_log_impl(&dword_21BF33000, v2, v3, "%s [->%{public}@]: Keybag creation result: %d", v39, 0x1Cu);

          objc_storeStrong(&v25, 0);
        }
        objc_storeStrong(&v27, 0);
        if ((v28 & 1) != 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "postEvent:withInfo:", CFSTR("KeybagCreated"), *(_QWORD *)(a1 + 40));
        }
        else
        {
          v1 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAEF50], 6, 0);
          objc_msgSend(*(id *)(a1 + 40), "setOperationError:");

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "postEvent:withInfo:", CFSTR("KeybagCreationFailed"), *(_QWORD *)(a1 + 40));
        }
        objc_storeStrong(&v29, 0);
        v30 = 0;
      }
      else
      {
        v13 = (id)objc_msgSend(*(id *)(a1 + 32), "log");
        v33 = (id)objc_msgSend(v13, "oslog");

        v32 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
        {
          v9 = v33;
          v10 = v32;
          v12 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
          v11 = (id)objc_msgSend(v12, "humanReadableUpdateName");
          v31 = v11;
          __os_log_helper_16_2_2_8_32_8_66((uint64_t)v40, (uint64_t)"-[SUSettingsUpdateOperation action_AquireKeybag:error:]_block_invoke", (uint64_t)v31);
          _os_log_impl(&dword_21BF33000, v9, v10, "%s [->%{public}@]: Failed to create a LAContext with the given passcode", v40, 0x16u);

          objc_storeStrong(&v31, 0);
        }
        objc_storeStrong(&v33, 0);
        v8 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAEF50], 6, 0);
        objc_msgSend(*(id *)(a1 + 40), "setOperationError:");

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "postEvent:withInfo:", CFSTR("KeybagCreationFailed"), *(_QWORD *)(a1 + 40));
        v30 = 1;
      }
      objc_storeStrong(&v34, 0);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "postEvent:withInfo:", CFSTR("KeybagNotRequired"), *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    v16 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAEF50], 6, 0);
    objc_msgSend(*(id *)(a1 + 40), "setOperationError:");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "postEvent:withInfo:", CFSTR("KeybagUserReject"), *(_QWORD *)(a1 + 40));
  }
}

- (int64_t)action_PresentTermsConditions:(id)a3 error:(id *)a4
{
  id v4;
  NSObject *queue;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  id v10;
  SUCoreLog *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *log;
  os_log_type_t type;
  id v28;
  id v29;
  id v30;
  SUCoreLog *v31;
  id v32;
  id v33;
  int v34;
  BOOL v35;
  id v36;
  NSObject *v38;
  SUCoreFSM *v39;
  uint64_t v40;
  int v41;
  int v42;
  void (*v43)(id *);
  void *v44;
  SUSettingsUpdateOperation *v45;
  id v46;
  id v47;
  os_log_type_t v48;
  id v49;
  id v50;
  id v51;
  os_log_type_t v52;
  id v53;
  int v54;
  int v55;
  id *v56;
  id location[2];
  SUSettingsUpdateOperation *v58;
  int64_t v59;
  uint8_t v60[32];
  uint8_t v61[40];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v58 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v56 = a4;
  v39 = -[SUSettingsUpdateOperation updateFSM](v58, "updateFSM");
  v38 = (id)-[SUCoreFSM extendedStateQueue](v39, "extendedStateQueue");
  dispatch_assert_queue_V2(v38);

  if (location[0])
  {
    v4 = (id)objc_msgSend(location[0], "currentDownload");
    v35 = v4 == 0;

    if (v35)
      goto LABEL_8;
    v33 = (id)objc_msgSend(location[0], "currentDownload");
    v32 = (id)objc_msgSend(v33, "downloadOptions");
    v34 = objc_msgSend(v32, "termsAndConditionsAgreementStatus");

    v54 = v34;
    v31 = -[SUSettingsUpdateOperation log](v58, "log");
    v53 = (id)-[SUCoreLog oslog](v31, "oslog");

    v52 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_DEFAULT))
    {
      log = v53;
      type = v52;
      v30 = (id)objc_msgSend(location[0], "descriptor");
      v29 = (id)objc_msgSend(v30, "humanReadableUpdateName");
      v25 = v29;
      v51 = v25;
      v28 = (id)SUStringFromAgreementStatus();
      v50 = v28;
      __os_log_helper_16_2_4_8_32_8_66_8_66_4_0((uint64_t)v61, (uint64_t)"-[SUSettingsUpdateOperation action_PresentTermsConditions:error:]", (uint64_t)v25, (uint64_t)v50, v54);
      _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: A download object is available. SU T&C  agreement status: %{public}@ (%d)", v61, 0x26u);

      objc_storeStrong(&v50, 0);
      objc_storeStrong(&v51, 0);
    }
    objc_storeStrong(&v53, 0);
    if (v54 != 1)
    {
LABEL_8:
      v20 = (id)objc_msgSend(location[0], "descriptor");
      v21 = objc_msgSend(v20, "isSplatOnly");

      if ((v21 & 1) != 0)
      {
        v19 = (id)objc_msgSend(location[0], "options");
        v18 = (id)objc_msgSend(v19, "agreementManager");
        v17 = (id)objc_msgSend(location[0], "descriptor");
        objc_msgSend(v18, "setTermsAgreementStatus:forUpdate:");

        -[SUCoreFSM postEvent:withInfo:](v58->_updateFSM, "postEvent:withInfo:", CFSTR("TermsConditionsNotRequired"), location[0]);
        v59 = 0;
        v55 = 1;
      }
      else
      {
        v15 = (id)objc_msgSend(location[0], "options");
        v16 = objc_msgSend(v15, "bypassTermsAndConditions");

        if ((v16 & 1) != 0)
        {
          v14 = (id)objc_msgSend(location[0], "options");
          v13 = (id)objc_msgSend(v14, "agreementManager");
          v12 = (id)objc_msgSend(location[0], "descriptor");
          objc_msgSend(v13, "setTermsAgreementStatus:forUpdate:");

          -[SUCoreFSM postEvent:withInfo:](v58->_updateFSM, "postEvent:withInfo:", CFSTR("TermsConditionsBypassed"), location[0]);
          v59 = 0;
          v55 = 1;
        }
        else
        {
          v11 = -[SUSettingsUpdateOperation log](v58, "log");
          v49 = (id)-[SUCoreLog oslog](v11, "oslog");

          v48 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v49, OS_LOG_TYPE_DEFAULT))
          {
            v7 = v49;
            v8 = v48;
            v10 = (id)objc_msgSend(location[0], "descriptor");
            v9 = (id)objc_msgSend(v10, "humanReadableUpdateName");
            v47 = v9;
            __os_log_helper_16_2_2_8_32_8_66((uint64_t)v60, (uint64_t)"-[SUSettingsUpdateOperation action_PresentTermsConditions:error:]", (uint64_t)v47);
            _os_log_impl(&dword_21BF33000, v7, v8, "%s [->%{public}@]: Attempting to present the T&C sheet", v60, 0x16u);

            objc_storeStrong(&v47, 0);
          }
          objc_storeStrong(&v49, 0);
          queue = v58->_delegateCallbackQueue;
          v40 = MEMORY[0x24BDAC760];
          v41 = -1073741824;
          v42 = 0;
          v43 = __65__SUSettingsUpdateOperation_action_PresentTermsConditions_error___block_invoke;
          v44 = &unk_24DFF7B80;
          v45 = v58;
          v46 = location[0];
          dispatch_async(queue, &v40);
          v59 = 0;
          v55 = 1;
          objc_storeStrong(&v46, 0);
          objc_storeStrong((id *)&v45, 0);
        }
      }
    }
    else
    {
      v24 = (id)objc_msgSend(location[0], "options");
      v23 = (id)objc_msgSend(v24, "agreementManager");
      v22 = (id)objc_msgSend(location[0], "descriptor");
      objc_msgSend(v23, "setTermsAgreementStatus:forUpdate:");

      -[SUCoreFSM postEvent:withInfo:](v58->_updateFSM, "postEvent:withInfo:", CFSTR("TermsConditionsAlreadyAgreed"), location[0]);
      v59 = 0;
      v55 = 1;
    }
  }
  else
  {
    v36 = (id)-[SUCoreFSM diag](v58->_updateFSM, "diag");
    objc_msgSend(v36, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v59 = 8102;
    v55 = 1;
  }
  objc_storeStrong(location, 0);
  return v59;
}

void __65__SUSettingsUpdateOperation_action_PresentTermsConditions_error___block_invoke(id *a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(id *, void *);
  void *v9;
  id v10;
  id v11[3];

  v11[2] = a1;
  v11[1] = a1;
  v3 = (void *)*((_QWORD *)a1[4] + 2);
  v2 = a1[4];
  v4 = (id)objc_msgSend(a1[5], "descriptor");
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __65__SUSettingsUpdateOperation_action_PresentTermsConditions_error___block_invoke_2;
  v9 = &unk_24DFF80A8;
  v10 = a1[4];
  v11[0] = a1[5];
  objc_msgSend(v3, "operation:requestAgreementToTermsAndConditionsForUpdate:replyHandler:", v2, v4);

  objc_storeStrong(v11, 0);
  objc_storeStrong(&v10, 0);
}

void __65__SUSettingsUpdateOperation_action_PresentTermsConditions_error___block_invoke_2(id *a1, void *a2)
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10[3];
  void *v11;
  id *v12;

  v12 = a1;
  v11 = a2;
  v10[2] = a1;
  queue = *((_QWORD *)a1[4] + 12);
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __65__SUSettingsUpdateOperation_action_PresentTermsConditions_error___block_invoke_3;
  v8 = &unk_24DFF8080;
  v9 = a1[4];
  v10[0] = a1[5];
  v10[1] = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
}

uint64_t __65__SUSettingsUpdateOperation_action_PresentTermsConditions_error___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *log;
  os_log_type_t type;
  __CFString *v16;
  id v17;
  id v18;
  id v19;
  __CFString *v21;
  id v22;
  os_log_type_t v23;
  id v24[3];
  uint8_t v25[40];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24[2] = (id)a1;
  v24[1] = (id)a1;
  v19 = (id)objc_msgSend(*(id *)(a1 + 32), "log");
  v24[0] = (id)objc_msgSend(v19, "oslog");

  v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v24[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v24[0];
    type = v23;
    v18 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
    v17 = (id)objc_msgSend(v18, "humanReadableUpdateName");
    v13 = v17;
    v22 = v13;
    v16 = SUSettingsUserInteractionResponseTypeToString(*(_QWORD *)(a1 + 48));
    v21 = v16;
    __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v25, (uint64_t)"-[SUSettingsUpdateOperation action_PresentTermsConditions:error:]_block_invoke_3", (uint64_t)v13, (uint64_t)v21);
    _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: T&C request result: %{public}@", v25, 0x20u);

    objc_storeStrong((id *)&v21, 0);
    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(v24, 0);
  if (*(_QWORD *)(a1 + 48))
  {
    v9 = (id)objc_msgSend(*(id *)(a1 + 40), "options");
    v8 = (id)objc_msgSend(v9, "agreementManager");
    v7 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
    objc_msgSend(v8, "setTermsAgreementStatus:forUpdate:");

    v11 = (id)objc_msgSend(*(id *)(a1 + 40), "currentDownload");
    v10 = (id)objc_msgSend(v11, "downloadOptions");
    objc_msgSend(v10, "setTermsAndConditionsAgreementStatus:", 2);

    v12 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAEF50], 3, 0);
    objc_msgSend(*(id *)(a1 + 40), "setOperationError:");

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "postEvent:withInfo:", CFSTR("TermsConditionsRejected"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "options");
    v3 = (id)objc_msgSend(v4, "agreementManager");
    v2 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
    objc_msgSend(v3, "setTermsAgreementStatus:forUpdate:");

    v6 = (id)objc_msgSend(*(id *)(a1 + 40), "currentDownload");
    v5 = (id)objc_msgSend(v6, "downloadOptions");
    objc_msgSend(v5, "setTermsAndConditionsAgreementStatus:", 1);

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "postEvent:withInfo:", CFSTR("TermsConditionsAgreed"), *(_QWORD *)(a1 + 40));
  }
}

- (int64_t)action_ResolveUpdateOperation:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  NSObject *log;
  os_log_type_t type;
  __CFString *v9;
  id v10;
  id v11;
  SUCoreLog *v12;
  unint64_t v13;
  id v14;
  NSObject *v16;
  SUCoreFSM *v17;
  __CFString *v18;
  id v19;
  os_log_type_t v20;
  id v21;
  int v22;
  id *v23;
  id location[2];
  SUSettingsUpdateOperation *v25;
  int64_t v26;
  uint8_t v27[56];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = a4;
  v17 = -[SUSettingsUpdateOperation updateFSM](v25, "updateFSM");
  v16 = (id)-[SUCoreFSM extendedStateQueue](v17, "extendedStateQueue");
  dispatch_assert_queue_V2(v16);

  if (location[0])
  {
    v13 = v25->_operationType - 1;
    if (v13 <= 4)
      __asm { BR              X8 }
    v12 = -[SUSettingsUpdateOperation log](v25, "log");
    v21 = (id)-[SUCoreLog oslog](v12, "oslog");

    v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEFAULT))
    {
      log = v21;
      type = v20;
      v11 = (id)objc_msgSend(location[0], "descriptor");
      v10 = (id)objc_msgSend(v11, "humanReadableUpdateName");
      v6 = v10;
      v19 = v6;
      v9 = SUSettingsUpdateOperationTypeToString(v25->_operationType);
      v18 = v9;
      __os_log_helper_16_2_4_8_32_8_66_8_66_8_2((uint64_t)v27, (uint64_t)"-[SUSettingsUpdateOperation action_ResolveUpdateOperation:error:]", (uint64_t)v6, (uint64_t)v18, v25->_operationType);
      _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: Can not resovle unknown operation type: %{public}@ (%{public}ld)", v27, 0x2Au);

      objc_storeStrong((id *)&v18, 0);
      objc_storeStrong(&v19, 0);
    }
    objc_storeStrong(&v21, 0);
    v5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAEF50], 2, 0);
    objc_msgSend(location[0], "setOperationError:");

    -[SUCoreFSM postEvent:withInfo:](v25->_updateFSM, "postEvent:withInfo:", CFSTR("CancelUpdate"), location[0]);
    v26 = 0;
    v22 = 1;
  }
  else
  {
    v14 = (id)-[SUCoreFSM diag](v25->_updateFSM, "diag");
    objc_msgSend(v14, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v26 = 8102;
    v22 = 1;
  }
  objc_storeStrong(location, 0);
  return v26;
}

- (int64_t)action_PresentDownloadConstraints:(id)a3 error:(id *)a4
{
  NSObject *queue;
  NSObject *v6;
  os_log_type_t v7;
  id v8;
  id v9;
  SUCoreLog *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  id v17;
  SUCoreLog *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  id v24;
  id v25;
  SUCoreLog *v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  id v32;
  id v33;
  SUCoreLog *v34;
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  id v40;
  id v41;
  SUCoreLog *v42;
  id v43;
  id v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  id v48;
  id v49;
  SUCoreLog *v50;
  id v51;
  char v52;
  id v53;
  id v54;
  id v55;
  NSObject *log;
  os_log_type_t v57;
  id v58;
  id v59;
  SUCoreLog *v60;
  id SUDownloadPolicyFactoryClass;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  NSObject *v69;
  SUCoreFSM *v70;
  uint64_t v71;
  int v72;
  int v73;
  void (*v74)(uint64_t);
  void *v75;
  SUSettingsUpdateOperation *v76;
  id v77;
  id v78;
  id v79;
  os_log_type_t v80;
  os_log_t v81;
  id v82;
  os_log_type_t v83;
  os_log_t v84;
  id v85;
  os_log_type_t v86;
  os_log_t v87;
  id v88;
  os_log_type_t v89;
  os_log_t v90;
  id v91;
  os_log_type_t v92;
  os_log_t v93;
  id v95;
  os_log_type_t v96;
  os_log_t v97;
  id v98;
  id v99;
  os_log_type_t type;
  os_log_t oslog;
  id v102;
  int v103;
  id *v104;
  id location[2];
  SUSettingsUpdateOperation *v106;
  int64_t v107;
  uint8_t v108[32];
  uint8_t v109[32];
  uint8_t v110[32];
  uint8_t v111[32];
  uint8_t v112[32];
  uint8_t v113[32];
  uint8_t v114[24];
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v106 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v104 = a4;
  v70 = -[SUSettingsUpdateOperation updateFSM](v106, "updateFSM");
  v69 = (id)-[SUCoreFSM extendedStateQueue](v70, "extendedStateQueue");
  dispatch_assert_queue_V2(v69);

  if (location[0])
  {
    SUDownloadPolicyFactoryClass = getSUDownloadPolicyFactoryClass();
    v66 = (id)objc_msgSend(location[0], "descriptor");
    v65 = (id)objc_msgSend(location[0], "currentDownload");
    v64 = (id)objc_msgSend(v65, "downloadOptions");
    v63 = (id)objc_msgSend(v64, "activeDownloadPolicy");
    v62 = (id)objc_msgSend(location[0], "options");
    v102 = (id)objc_msgSend(SUDownloadPolicyFactoryClass, "userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:", v66, v63, objc_msgSend(v62, "allowUnrestrictedCellularDownload") & 1);

    if (-[SUSettingsUpdateOperation deviceSupportsCellularCapability](v106, "deviceSupportsCellularCapability"))
    {
      v98 = (id)objc_msgSend(MEMORY[0x24BEAEC40], "sharedInstance");
      v51 = (id)objc_msgSend(location[0], "options");
      v52 = objc_msgSend(v51, "clientIsBuddy");

      if ((v52 & 1) != 0
        && (objc_msgSend(v98, "isBootstrap") & 1) != 0
        && (objc_msgSend(v98, "isPathSatisfied") & 1) == 0)
      {
        v50 = -[SUSettingsUpdateOperation log](v106, "log");
        v97 = (os_log_t)(id)-[SUCoreLog oslog](v50, "oslog");

        v96 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
        {
          v46 = v97;
          v47 = v96;
          v49 = (id)objc_msgSend(location[0], "descriptor");
          v48 = (id)objc_msgSend(v49, "humanReadableUpdateName");
          v95 = v48;
          __os_log_helper_16_2_2_8_32_8_66((uint64_t)v113, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v95);
          _os_log_impl(&dword_21BF33000, v46, v47, "%s [->%{public}@]: Can't download update in bootstrap network. Not prompting for cellular download acceptance", v113, 0x16u);

          objc_storeStrong(&v95, 0);
        }
        objc_storeStrong((id *)&v97, 0);
        v45 = (id)objc_msgSend(location[0], "options");
        v44 = (id)objc_msgSend(v45, "agreementManager");
        v43 = (id)objc_msgSend(location[0], "descriptor");
        objc_msgSend(v44, "setCellularFeeAgreementStatus:forUpdate:");

        objc_msgSend(location[0], "setCellularAgreementStatus:", 0);
        -[SUCoreFSM postEvent:withInfo:](v106->_updateFSM, "postEvent:withInfo:", CFSTR("DownloadConstraintsNotRequired"), location[0]);
        v107 = 0;
        v103 = 1;
      }
      else if (MGGetBoolAnswer() & 1)
      {
        if ((objc_msgSend(v102, "isDownloadAllowableForCellular") & 1) != 0)
        {
          if (objc_msgSend(v98, "currentNetworkType") == 1)
          {
            v26 = -[SUSettingsUpdateOperation log](v106, "log");
            v87 = (os_log_t)(id)-[SUCoreLog oslog](v26, "oslog");

            v86 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              v22 = v87;
              v23 = v86;
              v25 = (id)objc_msgSend(location[0], "descriptor");
              v24 = (id)objc_msgSend(v25, "humanReadableUpdateName");
              v85 = v24;
              __os_log_helper_16_2_2_8_32_8_66((uint64_t)v110, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v85);
              _os_log_impl(&dword_21BF33000, v22, v23, "%s [->%{public}@]: Device is currently using Wi-Fi. Skipping on the download constraints acceptance step.", v110, 0x16u);

              objc_storeStrong(&v85, 0);
            }
            objc_storeStrong((id *)&v87, 0);
            v21 = (id)objc_msgSend(location[0], "options");
            v20 = (id)objc_msgSend(v21, "agreementManager");
            v19 = (id)objc_msgSend(location[0], "descriptor");
            objc_msgSend(v20, "setCellularFeeAgreementStatus:forUpdate:");

            objc_msgSend(location[0], "setCellularAgreementStatus:", 0);
            -[SUCoreFSM postEvent:withInfo:](v106->_updateFSM, "postEvent:withInfo:", CFSTR("DownloadConstraintsNotRequired"), location[0]);
            v107 = 0;
            v103 = 1;
          }
          else if ((objc_msgSend(v102, "is5GDownloadAllowed") & 1) != 0)
          {
            v18 = -[SUSettingsUpdateOperation log](v106, "log");
            v84 = (os_log_t)(id)-[SUCoreLog oslog](v18, "oslog");

            v83 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
            {
              v14 = v84;
              v15 = v83;
              v17 = (id)objc_msgSend(location[0], "descriptor");
              v16 = (id)objc_msgSend(v17, "humanReadableUpdateName");
              v82 = v16;
              __os_log_helper_16_2_2_8_32_8_66((uint64_t)v109, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v82);
              _os_log_impl(&dword_21BF33000, v14, v15, "%s [->%{public}@]: Device is using inexpensive HDM. Skipping on the download constraints acceptance step.", v109, 0x16u);

              objc_storeStrong(&v82, 0);
            }
            objc_storeStrong((id *)&v84, 0);
            v13 = (id)objc_msgSend(location[0], "options");
            v12 = (id)objc_msgSend(v13, "agreementManager");
            v11 = (id)objc_msgSend(location[0], "descriptor");
            objc_msgSend(v12, "setCellularFeeAgreementStatus:forUpdate:");

            objc_msgSend(location[0], "setCellularAgreementStatus:", 0);
            -[SUCoreFSM postEvent:withInfo:](v106->_updateFSM, "postEvent:withInfo:", CFSTR("DownloadConstraintsNotRequired"), location[0]);
            v107 = 0;
            v103 = 1;
          }
          else
          {
            v10 = -[SUSettingsUpdateOperation log](v106, "log");
            v81 = (os_log_t)(id)-[SUCoreLog oslog](v10, "oslog");

            v80 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              v6 = v81;
              v7 = v80;
              v9 = (id)objc_msgSend(location[0], "descriptor");
              v8 = (id)objc_msgSend(v9, "humanReadableUpdateName");
              v79 = v8;
              __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v108, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v79, (uint64_t)v102);
              _os_log_impl(&dword_21BF33000, v6, v7, "%s [->%{public}@]: Attempting to ask for download constraints approval for download policy: %{public}@", v108, 0x20u);

              objc_storeStrong(&v79, 0);
            }
            objc_storeStrong((id *)&v81, 0);
            queue = v106->_delegateCallbackQueue;
            v71 = MEMORY[0x24BDAC760];
            v72 = -1073741824;
            v73 = 0;
            v74 = __69__SUSettingsUpdateOperation_action_PresentDownloadConstraints_error___block_invoke;
            v75 = &unk_24DFF7C20;
            v76 = v106;
            v77 = location[0];
            v78 = v102;
            dispatch_async(queue, &v71);
            v107 = 0;
            v103 = 1;
            objc_storeStrong(&v78, 0);
            objc_storeStrong(&v77, 0);
            objc_storeStrong((id *)&v76, 0);
          }
        }
        else
        {
          v34 = -[SUSettingsUpdateOperation log](v106, "log");
          v90 = (os_log_t)(id)-[SUCoreLog oslog](v34, "oslog");

          v89 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
            v30 = v90;
            v31 = v89;
            v33 = (id)objc_msgSend(location[0], "descriptor");
            v32 = (id)objc_msgSend(v33, "humanReadableUpdateName");
            v88 = v32;
            __os_log_helper_16_2_2_8_32_8_66((uint64_t)v111, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v88);
            _os_log_impl(&dword_21BF33000, v30, v31, "%s [->%{public}@]: The download policy does not support cellular capability. Skipping on the download constraints acceptance step.", v111, 0x16u);

            objc_storeStrong(&v88, 0);
          }
          objc_storeStrong((id *)&v90, 0);
          v29 = (id)objc_msgSend(location[0], "options");
          v28 = (id)objc_msgSend(v29, "agreementManager");
          v27 = (id)objc_msgSend(location[0], "descriptor");
          objc_msgSend(v28, "setCellularFeeAgreementStatus:forUpdate:");

          objc_msgSend(location[0], "setCellularAgreementStatus:", 0);
          -[SUCoreFSM postEvent:withInfo:](v106->_updateFSM, "postEvent:withInfo:", CFSTR("DownloadConstraintsNotRequired"), location[0]);
          v107 = 0;
          v103 = 1;
        }
      }
      else
      {
        v42 = -[SUSettingsUpdateOperation log](v106, "log");
        v93 = (os_log_t)(id)-[SUCoreLog oslog](v42, "oslog");

        v92 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          v38 = v93;
          v39 = v92;
          v41 = (id)objc_msgSend(location[0], "descriptor");
          v40 = (id)objc_msgSend(v41, "humanReadableUpdateName");
          v91 = v40;
          __os_log_helper_16_2_2_8_32_8_66((uint64_t)v112, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v91);
          _os_log_impl(&dword_21BF33000, v38, v39, "%s [->%{public}@]: MobileGestalt: The device does not support cellular capability. Skipping on the download constraints acceptance step.", v112, 0x16u);

          objc_storeStrong(&v91, 0);
        }
        objc_storeStrong((id *)&v93, 0);
        v37 = (id)objc_msgSend(location[0], "options");
        v36 = (id)objc_msgSend(v37, "agreementManager");
        v35 = (id)objc_msgSend(location[0], "descriptor");
        objc_msgSend(v36, "setCellularFeeAgreementStatus:forUpdate:");

        objc_msgSend(location[0], "setCellularAgreementStatus:", 0);
        -[SUCoreFSM postEvent:withInfo:](v106->_updateFSM, "postEvent:withInfo:", CFSTR("DownloadConstraintsNotRequired"), location[0]);
        v107 = 0;
        v103 = 1;
      }
      objc_storeStrong(&v98, 0);
    }
    else
    {
      v60 = -[SUSettingsUpdateOperation log](v106, "log");
      oslog = (os_log_t)(id)-[SUCoreLog oslog](v60, "oslog");

      type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        v57 = type;
        v59 = (id)objc_msgSend(location[0], "descriptor");
        v58 = (id)objc_msgSend(v59, "humanReadableUpdateName");
        v99 = v58;
        __os_log_helper_16_2_2_8_32_8_66((uint64_t)v114, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]", (uint64_t)v99);
        _os_log_impl(&dword_21BF33000, log, v57, "%s [->%{public}@]: CoreTelephony: The device does not support cellular capability. Skipping on the download constraints acceptance step.", v114, 0x16u);

        objc_storeStrong(&v99, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      v55 = (id)objc_msgSend(location[0], "options");
      v54 = (id)objc_msgSend(v55, "agreementManager");
      v53 = (id)objc_msgSend(location[0], "descriptor");
      objc_msgSend(v54, "setCellularFeeAgreementStatus:forUpdate:");

      objc_msgSend(location[0], "setCellularAgreementStatus:", 0);
      -[SUCoreFSM postEvent:withInfo:](v106->_updateFSM, "postEvent:withInfo:", CFSTR("DownloadConstraintsNotRequired"), location[0]);
      v107 = 0;
      v103 = 1;
    }
    objc_storeStrong(&v102, 0);
  }
  else
  {
    v67 = (id)-[SUCoreFSM diag](v106->_updateFSM, "diag");
    objc_msgSend(v67, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v107 = 8102;
    v103 = 1;
  }
  objc_storeStrong(location, 0);
  return v107;
}

void __69__SUSettingsUpdateOperation_action_PresentDownloadConstraints_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(id *, void *);
  void *v10;
  id v11;
  id v12[3];

  v12[2] = (id)a1;
  v12[1] = (id)a1;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v2 = *(_QWORD *)(a1 + 32);
  v5 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
  v3 = *(_QWORD *)(a1 + 48);
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __69__SUSettingsUpdateOperation_action_PresentDownloadConstraints_error___block_invoke_2;
  v10 = &unk_24DFF80A8;
  v11 = *(id *)(a1 + 32);
  v12[0] = *(id *)(a1 + 40);
  objc_msgSend(v4, "operation:requestApprovalForDownloadConstraints:downloadPolicy:replyHandler:", v2, v5, v3);

  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
}

void __69__SUSettingsUpdateOperation_action_PresentDownloadConstraints_error___block_invoke_2(id *a1, void *a2)
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  id v10[3];
  void *v11;
  id *v12;

  v12 = a1;
  v11 = a2;
  v10[2] = a1;
  queue = *((_QWORD *)a1[4] + 12);
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __69__SUSettingsUpdateOperation_action_PresentDownloadConstraints_error___block_invoke_3;
  v8 = &unk_24DFF8080;
  v9 = a1[4];
  v10[0] = a1[5];
  v10[1] = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
}

uint64_t __69__SUSettingsUpdateOperation_action_PresentDownloadConstraints_error___block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *log;
  os_log_type_t type;
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  __CFString *v17;
  id v18;
  os_log_type_t v19;
  id v20[3];
  uint8_t v21[40];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20[2] = (id)a1;
  v20[1] = (id)a1;
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "log");
  v20[0] = (id)objc_msgSend(v15, "oslog");

  v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v20[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v20[0];
    type = v19;
    v14 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
    v13 = (id)objc_msgSend(v14, "humanReadableUpdateName");
    v9 = v13;
    v18 = v9;
    v12 = SUSettingsUserInteractionResponseTypeToString(*(_QWORD *)(a1 + 48));
    v17 = v12;
    __os_log_helper_16_2_3_8_32_8_66_8_66((uint64_t)v21, (uint64_t)"-[SUSettingsUpdateOperation action_PresentDownloadConstraints:error:]_block_invoke_3", (uint64_t)v9, (uint64_t)v17);
    _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: Download constraints approval request result: %{public}@", v21, 0x20u);

    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong(v20, 0);
  if (*(_QWORD *)(a1 + 48))
  {
    v7 = (id)objc_msgSend(*(id *)(a1 + 40), "options");
    v6 = (id)objc_msgSend(v7, "agreementManager");
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
    objc_msgSend(v6, "setCellularFeeAgreementStatus:forUpdate:");

    objc_msgSend(*(id *)(a1 + 40), "setCellularAgreementStatus:", 2);
    v8 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAEF50], 4, 0);
    objc_msgSend(*(id *)(a1 + 40), "setOperationError:");

    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "postEvent:withInfo:", CFSTR("DownloadConstraintsRejected"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "options");
    v3 = (id)objc_msgSend(v4, "agreementManager");
    v2 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
    objc_msgSend(v3, "setCellularFeeAgreementStatus:forUpdate:");

    objc_msgSend(*(id *)(a1 + 40), "setCellularAgreementStatus:", 1);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "postEvent:withInfo:", CFSTR("DownloadConstraintsAgreed"), *(_QWORD *)(a1 + 40));
  }
}

- (int64_t)action_InitiateUpdateDownload:(id)a3 error:(id *)a4
{
  id v5;
  SUManagerClient *suClient;
  id v7;
  id v8;
  id SUDownloadPolicyFactoryClass;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v15;
  SUCoreFSM *v16;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(id *, char, id);
  void *v21;
  SUSettingsUpdateOperation *v22;
  id v23;
  id v24;
  id v25;
  int v26;
  id *v27;
  id location[2];
  SUSettingsUpdateOperation *v29;
  int64_t v30;

  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = a4;
  v16 = -[SUSettingsUpdateOperation updateFSM](v29, "updateFSM");
  v15 = (id)-[SUCoreFSM extendedStateQueue](v16, "extendedStateQueue");
  dispatch_assert_queue_V2(v15);

  if (location[0])
  {
    v7 = objc_alloc(MEMORY[0x24BEAEC18]);
    v8 = (id)objc_msgSend(location[0], "descriptor");
    v25 = (id)objc_msgSend(v7, "initWithDescriptor:");

    SUDownloadPolicyFactoryClass = getSUDownloadPolicyFactoryClass();
    v11 = (id)objc_msgSend(location[0], "descriptor");
    v10 = (id)objc_msgSend(location[0], "options");
    v24 = (id)objc_msgSend(SUDownloadPolicyFactoryClass, "userDownloadPolicyForDescriptor:existingPolicy:allowCellularOverride:", v11, 0, objc_msgSend(v10, "allowUnrestrictedCellularDownload") & 1);

    v12 = -[SUSettingsUpdateOperation operationType](v29, "operationType");
    if (v12 != 1)
    {
      if (v12 != 3)
      {
LABEL_7:
        objc_msgSend(v25, "setActiveDownloadPolicy:", v24);
        objc_msgSend(v25, "setDownloadFeeAgreementStatus:", objc_msgSend(location[0], "cellularAgreementStatus"));
        objc_msgSend(v25, "setTermsAndConditionsAgreementStatus:");
        suClient = v29->_suClient;
        v5 = v25;
        v17 = MEMORY[0x24BDAC760];
        v18 = -1073741824;
        v19 = 0;
        v20 = __65__SUSettingsUpdateOperation_action_InitiateUpdateDownload_error___block_invoke;
        v21 = &unk_24DFF7E00;
        v22 = v29;
        v23 = location[0];
        -[SUManagerClient startDownloadWithOptions:withResult:](suClient, "startDownloadWithOptions:withResult:", v5, &v17);
        v30 = 0;
        v26 = 1;
        objc_storeStrong(&v23, 0);
        objc_storeStrong((id *)&v22, 0);
        objc_storeStrong(&v24, 0);
        objc_storeStrong(&v25, 0);
        goto LABEL_8;
      }
      objc_msgSend(v25, "setUserUpdateTonight:", 1);
    }
    objc_msgSend(v25, "setDownloadOnly:", 1);
    goto LABEL_7;
  }
  v13 = (id)-[SUCoreFSM diag](v29->_updateFSM, "diag");
  objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

  v30 = 8102;
  v26 = 1;
LABEL_8:
  objc_storeStrong(location, 0);
  return v30;
}

void __65__SUSettingsUpdateOperation_action_InitiateUpdateDownload_error___block_invoke(id *a1, char a2, id obj)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  id v13;
  char v14;
  NSObject *log;
  os_log_type_t type;
  id v17;
  id v18;
  id v19;
  uint64_t v21;
  int v22;
  int v23;
  void (*v24)(id *, void *, void *);
  void *v25;
  id v26;
  id v27;
  int v28;
  id v29;
  os_log_type_t v30;
  id v31;
  uint64_t v32;
  id v33;
  os_log_type_t v34;
  id v35[2];
  id location;
  char v37;
  id *v38;
  uint8_t v39[48];
  uint8_t v40[40];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v38 = a1;
  v37 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v35[1] = a1;
  v19 = (id)objc_msgSend(a1[4], "log");
  v35[0] = (id)objc_msgSend(v19, "oslog");

  v34 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v35[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v35[0];
    type = v34;
    v18 = (id)objc_msgSend(a1[5], "descriptor");
    v17 = (id)objc_msgSend(v18, "humanReadableUpdateName");
    v33 = v17;
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v40, (uint64_t)"-[SUSettingsUpdateOperation action_InitiateUpdateDownload:error:]_block_invoke", (uint64_t)v33, v37 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: Initiated the update download. Successfully started: %d; error: %{public}@",
      v40,
      0x26u);

    objc_storeStrong(&v33, 0);
  }
  objc_storeStrong(v35, 0);
  v13 = (id)objc_msgSend(location, "domain");
  v12 = getSUErrorDomain_2();
  v14 = objc_msgSend(v13, "isEqualToString:");

  if ((v14 & 1) != 0)
  {
    v32 = objc_msgSend(location, "code");
    if (v32 == 11 || v32 == 41)
      v37 = 1;
  }
  objc_msgSend(a1[5], "setDownloadStartedSuccessfully:", v37 & 1);
  objc_msgSend(a1[5], "setOperationError:", location);
  if ((v37 & 1) != 0)
  {
    v4 = (void *)*((_QWORD *)a1[4] + 15);
    v21 = MEMORY[0x24BDAC760];
    v22 = -1073741824;
    v23 = 0;
    v24 = __65__SUSettingsUpdateOperation_action_InitiateUpdateDownload_error___block_invoke_219;
    v25 = &unk_24DFFAA18;
    v26 = a1[4];
    v27 = a1[5];
    objc_msgSend(v4, "download:", &v21);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v26, 0);
    v28 = 0;
  }
  else
  {
    v3 = (id)objc_msgSend(a1[5], "operationError");
    v11 = v3 != 0;

    if (!v11)
    {
      v10 = (id)objc_msgSend(a1[4], "log");
      v31 = (id)objc_msgSend(v10, "oslog");

      v30 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEFAULT))
      {
        v6 = v31;
        v7 = v30;
        v9 = (id)objc_msgSend(a1[5], "descriptor");
        v8 = (id)objc_msgSend(v9, "humanReadableUpdateName");
        v29 = v8;
        __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v39, (uint64_t)"-[SUSettingsUpdateOperation action_InitiateUpdateDownload:error:]_block_invoke", (uint64_t)v29, v37 & 1, (uint64_t)location);
        _os_log_impl(&dword_21BF33000, v6, v7, "%s [->%{public}@]: The download attempt has failed but there's no error assigned to it. result: %d; startDownl"
          "oadError: %{public}@",
          v39,
          0x26u);

        objc_storeStrong(&v29, 0);
      }
      objc_storeStrong(&v31, 0);
      v5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAEF50], -1, 0);
      objc_msgSend(a1[5], "setOperationError:");

    }
    objc_msgSend(*((id *)a1[4] + 14), "postEvent:withInfo:", CFSTR("UpdateDownloadInitFailed"), a1[5]);
    v28 = 1;
  }
  objc_storeStrong(&location, 0);
}

void __65__SUSettingsUpdateOperation_action_InitiateUpdateDownload_error___block_invoke_219(id *a1, void *a2, void *a3)
{
  SUSUIUninitializedDownload *v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  id v7;
  id v8;
  id v9;
  SUSUIUninitializedDownload *v10;
  id v11;
  BOOL v12;
  NSObject *log;
  os_log_type_t type;
  id v15;
  id v16;
  id v17;
  id v20;
  os_log_type_t v21;
  os_log_t oslog;
  char v23;
  id v24;
  char v25;
  id v26;
  id v27;
  os_log_type_t v28;
  id v29[2];
  id v30;
  id location[2];
  uint8_t v32[48];
  uint8_t v33[56];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v30 = 0;
  objc_storeStrong(&v30, a3);
  v29[1] = a1;
  v17 = (id)objc_msgSend(a1[4], "log");
  v29[0] = (id)objc_msgSend(v17, "oslog");

  v28 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v29[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v29[0];
    type = v28;
    v16 = (id)objc_msgSend(a1[5], "descriptor");
    v15 = (id)objc_msgSend(v16, "humanReadableUpdateName");
    v27 = v15;
    __os_log_helper_16_2_4_8_32_8_66_8_66_8_66((uint64_t)v33, (uint64_t)"-[SUSettingsUpdateOperation action_InitiateUpdateDownload:error:]_block_invoke", (uint64_t)v27, (uint64_t)location[0], (uint64_t)v30);
    _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: Received the newly created download object: %{public}@; error: %{public}@",
      v33,
      0x2Au);

    objc_storeStrong(&v27, 0);
  }
  objc_storeStrong(v29, 0);
  v25 = 0;
  v23 = 0;
  v12 = 0;
  if (!location[0])
  {
    v26 = (id)objc_msgSend(v30, "domain");
    v25 = 1;
    v24 = getSUErrorDomain_2();
    v23 = 1;
    v12 = 0;
    if ((objc_msgSend(v26, "isEqualToString:") & 1) != 0)
      v12 = objc_msgSend(v30, "code") == 11;
  }
  if ((v23 & 1) != 0)

  if ((v25 & 1) != 0)
  if (v12)
  {
    v10 = [SUSUIUninitializedDownload alloc];
    v11 = (id)objc_msgSend(a1[5], "descriptor");
    v3 = -[SUSUIUninitializedDownload initWithDescriptor:](v10, "initWithDescriptor:");
    v4 = location[0];
    location[0] = v3;

    v9 = (id)objc_msgSend(a1[4], "log");
    oslog = (os_log_t)(id)objc_msgSend(v9, "oslog");

    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v5 = oslog;
      v6 = v21;
      v8 = (id)objc_msgSend(a1[5], "descriptor");
      v7 = (id)objc_msgSend(v8, "humanReadableUpdateName");
      v20 = v7;
      __os_log_helper_16_2_4_8_32_8_66_8_66_8_66((uint64_t)v32, (uint64_t)"-[SUSettingsUpdateOperation action_InitiateUpdateDownload:error:]_block_invoke", (uint64_t)v20, (uint64_t)v30, (uint64_t)location[0]);
      _os_log_impl(&dword_21BF33000, v5, v6, "%s [->%{public}@]: Received a nil download and SUErrorCodeDownloadInProgress error (%{public}@) - assigned SUDownloadUninitialized to the download object: %{public}@", v32, 0x2Au);

      objc_storeStrong(&v20, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_msgSend(a1[5], "setCurrentDownload:", location[0]);
  if (*((_QWORD *)a1[4] + 13) == 3)
    objc_msgSend(*((id *)a1[4] + 14), "postEvent:withInfo:", CFSTR("UpdateDownloadReadyToSchedule"), a1[5]);
  else
    objc_msgSend(*((id *)a1[4] + 14), "postEvent:withInfo:", CFSTR("UpdateDownloadStarted"), a1[5]);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)action_InitiateUpdateInstallation:(id)a3 error:(id *)a4
{
  unint64_t v4;
  id v6;
  SUManagerClient *suClient;
  id v8;
  NSObject *v10;
  SUCoreFSM *v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, char, id);
  void *v16;
  id v17;
  SUSettingsUpdateOperation *v18;
  id v19;
  int v20;
  id *v21;
  id location[2];
  SUSettingsUpdateOperation *v23;
  int64_t v24;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = a4;
  v11 = -[SUSettingsUpdateOperation updateFSM](v23, "updateFSM");
  v10 = (id)-[SUCoreFSM extendedStateQueue](v11, "extendedStateQueue");
  dispatch_assert_queue_V2(v10);

  if (location[0])
  {
    v19 = objc_alloc_init(MEMORY[0x24BEAEC20]);
    v4 = +[SUSettingsScanOperation installationIgnorableConstraints](SUSettingsScanOperation, "installationIgnorableConstraints");
    objc_msgSend(v19, "setIgnorableConstraints:", v4);
    suClient = v23->_suClient;
    v6 = v19;
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __69__SUSettingsUpdateOperation_action_InitiateUpdateInstallation_error___block_invoke;
    v16 = &unk_24DFF7E00;
    v17 = location[0];
    v18 = v23;
    -[SUManagerClient installUpdateWithInstallOptions:withResult:](suClient, "installUpdateWithInstallOptions:withResult:", v6, &v12);
    v24 = 0;
    v20 = 1;
    objc_storeStrong((id *)&v18, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    v8 = (id)-[SUCoreFSM diag](v23->_updateFSM, "diag");
    objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v24 = 8102;
    v20 = 1;
  }
  objc_storeStrong(location, 0);
  return v24;
}

void __69__SUSettingsUpdateOperation_action_InitiateUpdateInstallation_error___block_invoke(uint64_t a1, char a2, id obj)
{
  void *v3;
  id v4;
  NSObject *log;
  os_log_type_t type;
  id v7;
  id v8;
  id v9;
  BOOL v11;
  id v12;
  os_log_type_t v13;
  id v14;
  char v15;
  id v16;
  uint64_t v17;
  id location;
  char v19;
  uint64_t v20;
  uint8_t v21[40];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v20 = a1;
  v19 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v17 = a1;
  objc_msgSend(*(id *)(a1 + 32), "setInstallInitiatedSuccessfully:", v19 & 1);
  objc_msgSend(*(id *)(a1 + 32), "setOperationError:", location);
  v15 = 0;
  v11 = 0;
  if ((v19 & 1) == 0)
  {
    v16 = (id)objc_msgSend(*(id *)(a1 + 32), "operationError");
    v15 = 1;
    v11 = v16 == 0;
  }
  if ((v15 & 1) != 0)

  if (v11)
  {
    v9 = (id)objc_msgSend(*(id *)(a1 + 40), "log");
    v14 = (id)objc_msgSend(v9, "oslog");

    v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
      log = v14;
      type = v13;
      v8 = (id)objc_msgSend(*(id *)(a1 + 32), "descriptor");
      v7 = (id)objc_msgSend(v8, "humanReadableUpdateName");
      v12 = v7;
      __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v21, (uint64_t)"-[SUSettingsUpdateOperation action_InitiateUpdateInstallation:error:]_block_invoke", (uint64_t)v12, v19 & 1, (uint64_t)location);
      _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: The installation attempt has failed but there's no error assigned to it. result: %d; installa"
        "tionError: %{public}@",
        v21,
        0x26u);

      objc_storeStrong(&v12, 0);
    }
    objc_storeStrong(&v14, 0);
    v4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAEF50], -1, 0);
    objc_msgSend(*(id *)(a1 + 32), "setOperationError:");

  }
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
  if ((v19 & 1) != 0)
    objc_msgSend(v3, "postEvent:withInfo:", CFSTR("UpdateInstallationStarted"), *(_QWORD *)(a1 + 32), CFSTR("UpdateInstallationStarted"));
  else
    objc_msgSend(v3, "postEvent:withInfo:", CFSTR("UpdateInstallationFailed"), *(_QWORD *)(a1 + 32), CFSTR("UpdateInstallationFailed"));
  objc_storeStrong(&location, 0);
}

- (int64_t)action_ScheduleUpdate:(id)a3 error:(id *)a4
{
  SUManagerClient *suClient;
  id v6;
  NSObject *v8;
  SUCoreFSM *v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(id *, void *, void *);
  void *v14;
  SUSettingsUpdateOperation *v15;
  id v16;
  int v17;
  id *v18;
  id location[2];
  SUSettingsUpdateOperation *v20;
  int64_t v21;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = a4;
  v9 = -[SUSettingsUpdateOperation updateFSM](v20, "updateFSM");
  v8 = (id)-[SUCoreFSM extendedStateQueue](v9, "extendedStateQueue");
  dispatch_assert_queue_V2(v8);

  if (location[0])
  {
    suClient = v20->_suClient;
    v10 = MEMORY[0x24BDAC760];
    v11 = -1073741824;
    v12 = 0;
    v13 = __57__SUSettingsUpdateOperation_action_ScheduleUpdate_error___block_invoke;
    v14 = &unk_24DFFAB30;
    v15 = v20;
    v16 = location[0];
    -[SUManagerClient currentAutoInstallOperation:withResult:](suClient, "currentAutoInstallOperation:withResult:", 1, &v10);
    v21 = 0;
    v17 = 1;
    objc_storeStrong(&v16, 0);
    objc_storeStrong((id *)&v15, 0);
  }
  else
  {
    v6 = (id)-[SUCoreFSM diag](v20->_updateFSM, "diag");
    objc_msgSend(v6, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v21 = 8102;
    v17 = 1;
  }
  objc_storeStrong(location, 0);
  return v21;
}

void __57__SUSettingsUpdateOperation_action_ScheduleUpdate_error___block_invoke(id *a1, void *a2, void *a3)
{
  id v3;
  void *v4;
  NSObject *log;
  os_log_type_t type;
  id v7;
  id v8;
  id v9;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t, char, id);
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  id v22;
  os_log_type_t v23;
  id v24[2];
  id v25;
  id location[2];
  uint8_t v27[56];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v25 = 0;
  objc_storeStrong(&v25, a3);
  v24[1] = a1;
  v9 = (id)objc_msgSend(a1[4], "log");
  v24[0] = (id)objc_msgSend(v9, "oslog");

  v23 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v24[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v24[0];
    type = v23;
    v8 = (id)objc_msgSend(a1[5], "descriptor");
    v7 = (id)objc_msgSend(v8, "humanReadableUpdateName");
    v22 = v7;
    __os_log_helper_16_2_4_8_32_8_66_8_66_8_66((uint64_t)v27, (uint64_t)"-[SUSettingsUpdateOperation action_ScheduleUpdate:error:]_block_invoke", (uint64_t)v22, (uint64_t)location[0], (uint64_t)v25);
    _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: Operation aquired from currentAutoInstallOperation: %{public}@; error: %{public}@",
      v27,
      0x2Au);

    objc_storeStrong(&v22, 0);
  }
  objc_storeStrong(v24, 0);
  if (location[0] && !v25)
  {
    v4 = (void *)*((_QWORD *)a1[4] + 15);
    v3 = location[0];
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __57__SUSettingsUpdateOperation_action_ScheduleUpdate_error___block_invoke_223;
    v16 = &unk_24DFFAB08;
    v17 = a1[4];
    v18 = a1[5];
    v19 = location[0];
    v20 = v25;
    objc_msgSend(v4, "_consentAutoInstallOperation:withResult:", v3, &v12);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    v21 = 0;
  }
  else
  {
    objc_msgSend(a1[5], "setUpdateScheduledSuccessfully:", 0);
    objc_msgSend(a1[5], "setScheduleError:", v25);
    objc_msgSend(*((id *)a1[4] + 14), "postEvent:withInfo:", CFSTR("UpdateScheduleFailed"), a1[5]);
    v21 = 1;
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

void __57__SUSettingsUpdateOperation_action_ScheduleUpdate_error___block_invoke_223(uint64_t a1, char a2, id obj)
{
  uint64_t v3;
  id v4;
  BOOL v5;
  NSObject *log;
  os_log_type_t type;
  id v8;
  id v9;
  id v10;
  id v12;
  os_log_type_t v13;
  id v14[2];
  id location;
  char v16;
  uint64_t v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = a1;
  v16 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v14[1] = (id)a1;
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "log");
  v14[0] = (id)objc_msgSend(v10, "oslog");

  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v14[0];
    type = v13;
    v9 = (id)objc_msgSend(*(id *)(a1 + 40), "descriptor");
    v8 = (id)objc_msgSend(v9, "humanReadableUpdateName");
    v12 = v8;
    __os_log_helper_16_2_4_8_32_8_66_4_0_8_66((uint64_t)v18, (uint64_t)"-[SUSettingsUpdateOperation action_ScheduleUpdate:error:]_block_invoke", (uint64_t)v12, v16 & 1, (uint64_t)location);
    _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: Consent aquired: %d; error: %{public}@", v18, 0x26u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(v14, 0);
  v5 = 0;
  if ((v16 & 1) != 0)
    v5 = *(_QWORD *)(a1 + 48) != 0;
  objc_msgSend(*(id *)(a1 + 40), "setUpdateScheduledSuccessfully:", v5);
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "scheduleError");
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "setScheduleError:", v4, v4);
  else
    objc_msgSend(*(id *)(a1 + 40), "setScheduleError:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 56));

  if (*(_QWORD *)(a1 + 48))
  {
    if ((v16 & 1) != 0)
      v3 = 1;
    else
      v3 = 2;
    objc_msgSend(*(id *)(a1 + 48), "setAgreementStatus:", v3);
    objc_msgSend(*(id *)(a1 + 40), "setAutoInstallOperation:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "postEvent:withInfo:", CFSTR("UpdateScheduleSuccess"), *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "postEvent:withInfo:", CFSTR("UpdateScheduleFailed"), *(_QWORD *)(a1 + 40));
  }
  objc_storeStrong(&location, 0);
}

- (int64_t)action_ReportUpdateOperationOutcome:(id)a3 error:(id *)a4
{
  const char *v4;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  __CFString *v9;
  id v10;
  id v11;
  SUCoreLog *v12;
  unint64_t v13;
  id v14;
  NSObject *queue;
  id v16;
  uint64_t v17;
  NSObject *log;
  os_log_type_t type;
  id v20;
  id v21;
  id v22;
  SUCoreLog *v23;
  BOOL v24;
  BOOL v25;
  id v26;
  NSObject *v28;
  SUCoreFSM *v29;
  __CFString *v30;
  id v31;
  os_log_type_t v32;
  os_log_t oslog;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  SUSettingsUpdateOperation *v39;
  id v40;
  os_log_type_t v41;
  id v42;
  char v43;
  id v44;
  int v45;
  id *v46;
  id location[2];
  SUSettingsUpdateOperation *v48;
  int64_t v49;
  uint8_t v50[48];
  uint8_t v51[56];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v48 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v46 = a4;
  v29 = -[SUSettingsUpdateOperation updateFSM](v48, "updateFSM");
  v28 = (id)-[SUCoreFSM extendedStateQueue](v29, "extendedStateQueue");
  dispatch_assert_queue_V2(v28);

  if (location[0])
  {
    v43 = 0;
    v25 = 0;
    if ((objc_msgSend(location[0], "createdKeybag") & 1) != 0)
    {
      v24 = 1;
      if (!v48->_canceled)
      {
        v44 = (id)objc_msgSend(location[0], "operationError");
        v43 = 1;
        v24 = v44 != 0;
      }
      v25 = v24;
    }
    if ((v43 & 1) != 0)

    if (v25)
    {
      v23 = -[SUSettingsUpdateOperation log](v48, "log");
      v42 = (id)-[SUCoreLog oslog](v23, "oslog");

      v41 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEFAULT))
      {
        log = v42;
        type = v41;
        v22 = (id)objc_msgSend(location[0], "descriptor");
        v21 = (id)objc_msgSend(v22, "humanReadableUpdateName");
        v16 = v21;
        v40 = v16;
        v4 = "YES";
        if (!v48->_canceled)
          v4 = "NO";
        v17 = (uint64_t)v4;
        v20 = (id)objc_msgSend(location[0], "operationError");
        __os_log_helper_16_2_4_8_32_8_66_8_32_8_66((uint64_t)v51, (uint64_t)"-[SUSettingsUpdateOperation action_ReportUpdateOperationOutcome:error:]", (uint64_t)v16, v17, (uint64_t)v20);
        _os_log_impl(&dword_21BF33000, log, type, "%s [->%{public}@]: A keybag was created during the update attempt, but the update operation did not finish with success result. Destroying the keybag.\ncanceled? %s; operationError: %{public}@",
          v51,
          0x2Au);

        objc_storeStrong(&v40, 0);
      }
      objc_storeStrong(&v42, 0);
      -[SUManagerClient destroyInstallationKeybag](v48->_suClient, "destroyInstallationKeybag");
    }
    if (v48->_canceled)
    {
      objc_msgSend(location[0], "setDownloadStartedSuccessfully:", 0);
      objc_msgSend(location[0], "setInstallInitiatedSuccessfully:", 0);
      objc_msgSend(location[0], "setUpdateScheduledSuccessfully:", 0);
      v14 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAED98], 16);
      objc_msgSend(location[0], "setOperationError:");

      queue = v48->_completionQueue;
      v34 = MEMORY[0x24BDAC760];
      v35 = -1073741824;
      v36 = 0;
      v37 = __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke;
      v38 = &unk_24DFF7B58;
      v39 = v48;
      dispatch_async(queue, &v34);
      objc_storeStrong((id *)&v39, 0);
    }
    v13 = v48->_operationType - 1;
    if (v13 <= 4)
      __asm { BR              X8 }
    v12 = -[SUSettingsUpdateOperation log](v48, "log");
    oslog = (os_log_t)(id)-[SUCoreLog oslog](v12, "oslog");

    v32 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = oslog;
      v8 = v32;
      v11 = (id)objc_msgSend(location[0], "descriptor");
      v10 = (id)objc_msgSend(v11, "humanReadableUpdateName");
      v6 = v10;
      v31 = v6;
      v9 = SUSettingsUpdateOperationTypeToString(v48->_operationType);
      v30 = v9;
      __os_log_helper_16_2_4_8_32_8_66_8_66_8_2((uint64_t)v50, (uint64_t)"-[SUSettingsUpdateOperation action_ReportUpdateOperationOutcome:error:]", (uint64_t)v6, (uint64_t)v30, v48->_operationType);
      _os_log_impl(&dword_21BF33000, v7, v8, "%s [->%{public}@]: Unknown operation type: %{public}@ (%{public}ld)", v50, 0x2Au);

      objc_storeStrong((id *)&v30, 0);
      objc_storeStrong(&v31, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    v49 = 0;
    v45 = 1;
  }
  else
  {
    v26 = (id)-[SUCoreFSM diag](v48->_updateFSM, "diag");
    objc_msgSend(v26, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("The given eventInfo parameter must not be nil."));

    v49 = 8102;
    v45 = 1;
  }
  objc_storeStrong(location, 0);
  return v49;
}

uint64_t __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidateMachine");
}

uint64_t __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke_2(uint64_t a1)
{
  char v2;
  uint64_t v3;
  id v4;
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    v2 = objc_msgSend(*(id *)(a1 + 40), "downloadStartedSuccessfully");
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "currentDownload");
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "operationError");
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, v2 & 1, v5);

  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidateMachine");
}

uint64_t __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  char v3;
  id v4;
  char v5;
  id v6;
  id v7;
  char v9;
  id v10;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v3 = objc_msgSend(*(id *)(a1 + 40), "downloadStartedSuccessfully");
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "currentDownload");
    v5 = objc_msgSend(*(id *)(a1 + 40), "updateScheduledSuccessfully");
    v6 = (id)objc_msgSend(*(id *)(a1 + 40), "autoInstallOperation");
    v7 = (id)objc_msgSend(*(id *)(a1 + 40), "operationError");
    v9 = 0;
    if (v7)
    {
      (*(void (**)(uint64_t, _QWORD, id, _QWORD, id, id))(v2 + 16))(v2, v3 & 1, v4, v5 & 1, v6, v7);
    }
    else
    {
      v10 = (id)objc_msgSend(*(id *)(a1 + 40), "scheduleError");
      v9 = 1;
      (*(void (**)(uint64_t, _QWORD, id, _QWORD, id, id))(v2 + 16))(v2, v3 & 1, v4, v5 & 1, v6, v10);
    }
    if ((v9 & 1) != 0)

  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidateMachine");
}

uint64_t __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke_4(uint64_t a1)
{
  char v2;
  uint64_t v3;
  id v4;
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v2 = objc_msgSend(*(id *)(a1 + 40), "updateScheduledSuccessfully");
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "autoInstallOperation");
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "operationError");
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, v2 & 1, v5);

  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidateMachine");
}

uint64_t __71__SUSettingsUpdateOperation_action_ReportUpdateOperationOutcome_error___block_invoke_5(uint64_t a1)
{
  char v2;
  uint64_t v3;
  id v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
    v2 = objc_msgSend(*(id *)(a1 + 40), "installInitiatedSuccessfully");
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "operationError");
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, v2 & 1);

  }
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
  SUSettingsUpdateOperation *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16[1] = a4;
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v16[0] = (id)objc_msgSend(v4, "initWithFormat:", location[0]);
  v11 = -[SUSettingsUpdateOperation updateFSM](v18, "updateFSM");
  v10 = (id)-[SUCoreFSM diag](v11, "diag");
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  v9 = (id)objc_msgSend(v5, "initWithFormat:", CFSTR("unknown action(%@)"), location[0]);
  objc_msgSend(v10, "dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:");

  v12 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
  v15 = (id)objc_msgSend(v12, "buildError:underlying:description:", 8116, 0, v16[0]);

  v14 = -[SUSettingsUpdateOperation updateFSM](v18, "updateFSM");
  v13 = (id)-[SUCoreFSM diag](v14, "diag");
  v6 = objc_msgSend(v15, "code");
  objc_msgSend(v13, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("Scan FSM has reported an anomaly"), v6, v15);

  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  objc_storeStrong(location, 0);
  return 0;
}

- (SUSettingsUpdateOperation)initWithDescriptor:(id)a3 usingSUManagerClient:(id)a4 delegate:(id)a5
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  dispatch_queue_t v13;
  void *v14;
  dispatch_queue_t v15;
  void *v16;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  NSString *v28;
  id v29;
  id v30;
  SUSettingsUpdateOperation *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  int v38;
  os_log_type_t v39;
  id v40;
  objc_super v41;
  id v42;
  id v43;
  id location[2];
  id v45;
  SUSettingsUpdateOperation *v46;
  id v47;
  id v48;
  uint8_t v49[16];
  uint8_t v50[24];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v45 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v43 = 0;
  objc_storeStrong(&v43, a4);
  v42 = 0;
  objc_storeStrong(&v42, a5);
  v5 = v45;
  v45 = 0;
  v41.receiver = v5;
  v41.super_class = (Class)SUSettingsUpdateOperation;
  v33 = -[SUSettingsUpdateOperation init](&v41, sel_init);
  v45 = v33;
  objc_storeStrong(&v45, v33);
  if (!v33)
    goto LABEL_12;
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEAEA70]), "initWithCategory:", CFSTR("SUSettingsScanOperation"));
  v7 = (void *)*((_QWORD *)v45 + 5);
  *((_QWORD *)v45 + 5) = v6;

  if (!*((_QWORD *)v45 + 5))
  {
    v30 = SUSettingsSharedLogger();
    v40 = (id)objc_msgSend(v30, "oslog");

    v39 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v50, (uint64_t)"-[SUSettingsUpdateOperation initWithDescriptor:usingSUManagerClient:delegate:]", (uint64_t)CFSTR("SUSettingsScanOperation"));
      _os_log_impl(&dword_21BF33000, (os_log_t)v40, v39, "%s: Could not create a log category for %@", v50, 0x16u);
    }
    objc_storeStrong(&v40, 0);
    v46 = 0;
    v38 = 1;
    goto LABEL_13;
  }
  v48 = (id)MGCopyAnswer();
  v37 = v48;
  v47 = (id)MGCopyAnswer();
  v36 = v47;
  v25 = objc_alloc(MEMORY[0x24BDD17C8]);
  v8 = (objc_class *)objc_opt_class();
  v28 = NSStringFromClass(v8);
  v27 = (id)objc_msgSend(location[0], "productVersion");
  v26 = (id)objc_msgSend(location[0], "productBuildVersion");
  v35 = (id)objc_msgSend(v25, "initWithFormat:", CFSTR("%@:[(%@, %@)->(%@, %@)]"), v28, v37, v36, v27, v26);

  objc_storeStrong((id *)v45 + 15, v43);
  objc_storeStrong((id *)v45 + 2, v42);
  v9 = (id)objc_msgSend((id)objc_opt_class(), "_generateStateTable");
  v10 = (void *)*((_QWORD *)v45 + 16);
  *((_QWORD *)v45 + 16) = v9;

  *((_QWORD *)v45 + 13) = 0;
  v29 = objc_alloc(MEMORY[0x24BEAEA60]);
  v11 = objc_msgSend(v29, "initMachine:withTable:startingIn:usingDelegate:registeringAllInfoClass:", v35, *((_QWORD *)v45 + 16), CFSTR("Idle"), v45, objc_opt_class());
  v12 = (void *)*((_QWORD *)v45 + 14);
  *((_QWORD *)v45 + 14) = v11;

  if (*((_QWORD *)v45 + 14))
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    v20 = (id)objc_msgSend(v45, "baseDomain");
    v19 = (id)objc_msgSend(v18, "stringWithFormat:", CFSTR("%@.requests-queue"), v20);
    v13 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String"), 0);
    v14 = (void *)*((_QWORD *)v45 + 11);
    *((_QWORD *)v45 + 11) = v13;

    v21 = (void *)MEMORY[0x24BDD17C8];
    v23 = (id)objc_msgSend(v45, "baseDomain");
    v22 = (id)objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.work-queue"), v23);
    v15 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(v22), "UTF8String"), 0);
    v16 = (void *)*((_QWORD *)v45 + 12);
    *((_QWORD *)v45 + 12) = v15;

    v38 = 0;
  }
  else
  {
    v24 = SUSettingsSharedLogger();
    v34 = (id)objc_msgSend(v24, "oslog");

    if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v49, (uint64_t)"-[SUSettingsUpdateOperation initWithDescriptor:usingSUManagerClient:delegate:]");
      _os_log_impl(&dword_21BF33000, (os_log_t)v34, OS_LOG_TYPE_DEFAULT, "%s: Failed creating the update FSM", v49, 0xCu);
    }
    objc_storeStrong(&v34, 0);
    v46 = 0;
    v38 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  if (!v38)
  {
LABEL_12:
    v46 = (SUSettingsUpdateOperation *)v45;
    v38 = 1;
  }
LABEL_13:
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v45, 0);
  return v46;
}

- (void)downloadUpdate:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id downloadUpdateCompletion;
  uint64_t v6;
  id v7;
  SUCoreFSM *v8;
  id v9;
  SUCoreLog *v10;
  id v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  SUSettingsUpdateOperation *v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v10 = -[SUSettingsUpdateOperation log](v19, "log");
  v15 = (id)-[SUCoreLog oslog](v10, "oslog");

  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (id)objc_msgSend(location[0], "humanReadableUpdateName");
    v13 = v9;
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v20, (uint64_t)"-[SUSettingsUpdateOperation downloadUpdate:withOptions:completionHandler:]", (uint64_t)v13);
    _os_log_impl(&dword_21BF33000, (os_log_t)v15, v14, "%s: Initiating an update operation (Download Only) to target: %{public}@", v20, 0x16u);

    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  v8 = v19->_updateFSM;
  objc_sync_enter(v8);
  if (-[SUSettingsUpdateOperation isActive](v19, "isActive"))
  {
    v7 = (id)-[SUCoreFSM diag](v19->_updateFSM, "diag");
    objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("This update machine is currently process another scan request. Queuing requests is not currently supported."), 8102, 0);

  }
  else
  {
    v6 = MEMORY[0x220773A28](v16);
    downloadUpdateCompletion = v19->_downloadUpdateCompletion;
    v19->_downloadUpdateCompletion = (id)v6;

    if (!-[SUSettingsUpdateOperation beginOperation:ofUnattendedInstall:descriptor:options:](v19, "beginOperation:ofUnattendedInstall:descriptor:options:", 1, 0, location[0], v17))(*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
  }
  objc_sync_exit(v8);

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)downloadAndInstall:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id downloadUpdateCompletion;
  uint64_t v6;
  id v7;
  SUCoreFSM *v8;
  id v9;
  SUCoreLog *v10;
  id v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  SUSettingsUpdateOperation *v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v10 = -[SUSettingsUpdateOperation log](v19, "log");
  v15 = (id)-[SUCoreLog oslog](v10, "oslog");

  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (id)objc_msgSend(location[0], "humanReadableUpdateName");
    v13 = v9;
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v20, (uint64_t)"-[SUSettingsUpdateOperation downloadAndInstall:withOptions:completionHandler:]", (uint64_t)v13);
    _os_log_impl(&dword_21BF33000, (os_log_t)v15, v14, "%s: Initiating an update operation (Download and Install) to target: %{public}@", v20, 0x16u);

    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  v8 = v19->_updateFSM;
  objc_sync_enter(v8);
  if (-[SUSettingsUpdateOperation isActive](v19, "isActive"))
  {
    v7 = (id)-[SUCoreFSM diag](v19->_updateFSM, "diag");
    objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("This update machine is currently process another scan request. Queuing requests is not currently supported."), 8102, 0);

  }
  else
  {
    v6 = MEMORY[0x220773A28](v16);
    downloadUpdateCompletion = v19->_downloadUpdateCompletion;
    v19->_downloadUpdateCompletion = (id)v6;

    if (!-[SUSettingsUpdateOperation beginOperation:ofUnattendedInstall:descriptor:options:](v19, "beginOperation:ofUnattendedInstall:descriptor:options:", 2, 1, location[0], v17))(*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
  }
  objc_sync_exit(v8);

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)downloadAndScheduleUpdate:(id)a3 forInstallationTonightWithOptions:(id)a4 completionHandler:(id)a5
{
  id downloadAndScheduleCompletion;
  uint64_t v6;
  id v7;
  SUCoreFSM *v8;
  id v9;
  SUCoreLog *v10;
  id v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  SUSettingsUpdateOperation *v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v10 = -[SUSettingsUpdateOperation log](v19, "log");
  v15 = (id)-[SUCoreLog oslog](v10, "oslog");

  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (id)objc_msgSend(location[0], "humanReadableUpdateName");
    v13 = v9;
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v20, (uint64_t)"-[SUSettingsUpdateOperation downloadAndScheduleUpdate:forInstallationTonightWithOptions:completionHandler:]", (uint64_t)v13);
    _os_log_impl(&dword_21BF33000, (os_log_t)v15, v14, "%s: Initiating an update operation (Update Tonight) to target: %{public}@", v20, 0x16u);

    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  v8 = v19->_updateFSM;
  objc_sync_enter(v8);
  if (-[SUSettingsUpdateOperation isActive](v19, "isActive"))
  {
    v7 = (id)-[SUCoreFSM diag](v19->_updateFSM, "diag");
    objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("This update machine is currently process another scan request. Queuing requests is not currently supported."), 8102, 0);

  }
  else
  {
    v6 = MEMORY[0x220773A28](v16);
    downloadAndScheduleCompletion = v19->_downloadAndScheduleCompletion;
    v19->_downloadAndScheduleCompletion = (id)v6;

    if (!-[SUSettingsUpdateOperation beginOperation:ofUnattendedInstall:descriptor:options:](v19, "beginOperation:ofUnattendedInstall:descriptor:options:", 3, 1, location[0], v17))(*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v16 + 2))(v16, 0, 0, 0, 0);
  }
  objc_sync_exit(v8);

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)installUpdate:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id installCompletion;
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  id v9;
  SUCoreFSM *v10;
  id v11;
  SUCoreLog *v12;
  id v15;
  os_log_type_t v16;
  id v17;
  id v18;
  id v19;
  id location[2];
  SUSettingsUpdateOperation *v21;
  uint8_t v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = 0;
  objc_storeStrong(&v18, a5);
  v12 = -[SUSettingsUpdateOperation log](v21, "log");
  v17 = (id)-[SUCoreLog oslog](v12, "oslog");

  v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (id)objc_msgSend(location[0], "humanReadableUpdateName");
    v15 = v11;
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v22, (uint64_t)"-[SUSettingsUpdateOperation installUpdate:withOptions:completionHandler:]", (uint64_t)v15);
    _os_log_impl(&dword_21BF33000, (os_log_t)v17, v16, "%s: Initiating an install operation (Install Now) to target: %{public}@", v22, 0x16u);

    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v17, 0);
  v10 = v21->_updateFSM;
  objc_sync_enter(v10);
  if (-[SUSettingsUpdateOperation isActive](v21, "isActive"))
  {
    v9 = (id)-[SUCoreFSM diag](v21->_updateFSM, "diag");
    objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("This update machine is currently process another scan request. Queuing requests is not currently supported."), 8102, 0);

  }
  else
  {
    v8 = MEMORY[0x220773A28](v18);
    installCompletion = v21->_installCompletion;
    v21->_installCompletion = (id)v8;

    if (!-[SUSettingsUpdateOperation beginOperation:ofUnattendedInstall:descriptor:options:](v21, "beginOperation:ofUnattendedInstall:descriptor:options:", 5, 1, location[0], v19))
    {
      v7 = (void (**)(id, _QWORD))v18;
      v6 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEAED98], 8102, 0);
      v7[2](v7, 0);

    }
  }
  objc_sync_exit(v10);

  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)promoteDownloadToUserInitiated:(id)a3 completionHandler:(id)a4
{
  id v4;
  SUManagerClient *suClient;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  id v10;
  SUCoreLog *v11;
  SUCoreLog *v12;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, char, id);
  void *v18;
  id v19;
  id v20;
  id v21;
  os_log_type_t v22;
  id v23;
  int v24;
  os_log_type_t v25;
  id v26;
  id v27;
  id location[2];
  SUSettingsUpdateOperation *v29;
  uint8_t v30[32];
  uint8_t v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v27 = 0;
  objc_storeStrong(&v27, a4);
  if (location[0])
  {
    v11 = -[SUSettingsUpdateOperation log](v29, "log");
    v23 = (id)-[SUCoreLog oslog](v11, "oslog");

    v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v23;
      v8 = v22;
      v10 = (id)objc_msgSend(location[0], "descriptor");
      v9 = (id)objc_msgSend(v10, "humanReadableUpdateName");
      v21 = v9;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v30, (uint64_t)"-[SUSettingsUpdateOperation promoteDownloadToUserInitiated:completionHandler:]", (uint64_t)v21);
      _os_log_impl(&dword_21BF33000, v7, v8, "%s: Initiating an update operation (Install once Downloaded) to target: %{public}@", v30, 0x16u);

      objc_storeStrong(&v21, 0);
    }
    objc_storeStrong(&v23, 0);
    v4 = (id)objc_msgSend(location[0], "downloadOptions");
    objc_msgSend(v4, "setAutoDownload:", 0);

    suClient = v29->_suClient;
    v6 = (id)objc_msgSend(location[0], "downloadOptions");
    v14 = MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __78__SUSettingsUpdateOperation_promoteDownloadToUserInitiated_completionHandler___block_invoke;
    v18 = &unk_24DFFAB58;
    v20 = v27;
    v19 = location[0];
    -[SUManagerClient updateDownloadOptions:withResult:](suClient, "updateDownloadOptions:withResult:", v6, &v14);

    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
    v24 = 0;
  }
  else
  {
    v12 = -[SUSettingsUpdateOperation log](v29, "log");
    v26 = (id)-[SUCoreLog oslog](v12, "oslog");

    v25 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v31, (uint64_t)"-[SUSettingsUpdateOperation promoteDownloadToUserInitiated:completionHandler:]");
      _os_log_error_impl(&dword_21BF33000, (os_log_t)v26, v25, "%s: Can not promote the initial status of a nil targeted update.", v31, 0xCu);
    }
    objc_storeStrong(&v26, 0);
    v24 = 1;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

void __78__SUSettingsUpdateOperation_promoteDownloadToUserInitiated_completionHandler___block_invoke(uint64_t a1, char a2, id obj)
{
  id location;
  char v5;
  uint64_t v6;

  v6 = a1;
  v5 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(&location, 0);
}

- (void)scheduleUpdate:(id)a3 forInstallationTonightWithOptions:(id)a4 completionHandler:(id)a5
{
  id scheduleCompletion;
  uint64_t v6;
  id v7;
  SUCoreFSM *v8;
  id v9;
  SUCoreLog *v10;
  id v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  SUSettingsUpdateOperation *v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v10 = -[SUSettingsUpdateOperation log](v19, "log");
  v15 = (id)-[SUCoreLog oslog](v10, "oslog");

  v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (id)objc_msgSend(location[0], "humanReadableUpdateName");
    v13 = v9;
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v20, (uint64_t)"-[SUSettingsUpdateOperation scheduleUpdate:forInstallationTonightWithOptions:completionHandler:]", (uint64_t)v13);
    _os_log_impl(&dword_21BF33000, (os_log_t)v15, v14, "%s: Initiating a schedule operation (Install Tonight) of target: %{public}@", v20, 0x16u);

    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(&v15, 0);
  v8 = v19->_updateFSM;
  objc_sync_enter(v8);
  if (-[SUSettingsUpdateOperation isActive](v19, "isActive"))
  {
    v7 = (id)-[SUCoreFSM diag](v19->_updateFSM, "diag");
    objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("This update machine is currently process another scan request. Queuing requests is not currently supported."), 8102, 0);

  }
  else
  {
    v6 = MEMORY[0x220773A28](v16);
    scheduleCompletion = v19->_scheduleCompletion;
    v19->_scheduleCompletion = (id)v6;

    if (!-[SUSettingsUpdateOperation beginOperation:ofUnattendedInstall:descriptor:options:](v19, "beginOperation:ofUnattendedInstall:descriptor:options:", 4, 1, location[0], v17))(*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
  }
  objc_sync_exit(v8);

  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)unscheduleAutomaticInstallation:(id)a3 completionHandler:(id)a4
{
  SUCoreLog *v4;
  id v6;
  id v7;
  id location[2];
  SUSettingsUpdateOperation *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v4 = -[SUSettingsUpdateOperation log](v9, "log");
  v6 = (id)-[SUCoreLog oslog](v4, "oslog");

  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_8_66((uint64_t)v10, (uint64_t)"-[SUSettingsUpdateOperation unscheduleAutomaticInstallation:completionHandler:]", (uint64_t)location[0]);
    _os_log_impl(&dword_21BF33000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "%s: Initiating an update operation (Cancel Install Tonight) to operation: %{public}@", v10, 0x16u);
  }
  objc_storeStrong(&v6, 0);
  objc_msgSend(location[0], "cancel");
  (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)cancel:(id)a3
{
  SUCoreFSM *updateFSM;
  SUSettingsUpdateParam *v4;
  id v5;
  SUCoreFSM *obj;
  SUCoreLog *v7;
  id v8;
  id location[2];
  SUSettingsUpdateOperation *v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = -[SUSettingsUpdateOperation log](v10, "log");
  v8 = (id)-[SUCoreLog oslog](v7, "oslog");

  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_32((uint64_t)v11, (uint64_t)"-[SUSettingsUpdateOperation cancel:]");
    _os_log_impl(&dword_21BF33000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "%s: Requesting to cancel the current update operation", v11, 0xCu);
  }
  objc_storeStrong(&v8, 0);
  obj = v10->_updateFSM;
  objc_sync_enter(obj);
  if (-[SUSettingsUpdateOperation isActive](v10, "isActive"))
  {
    if (!-[SUSettingsUpdateOperation canceled](v10, "canceled"))
    {
      -[SUSettingsUpdateOperation setCanceled:](v10, "setCanceled:", 1);
      -[SUSettingsUpdateOperation setCancelHandler:](v10, "setCancelHandler:", location[0]);
      updateFSM = v10->_updateFSM;
      v4 = objc_alloc_init(SUSettingsUpdateParam);
      -[SUCoreFSM postEvent:withInfo:](updateFSM, "postEvent:withInfo:", CFSTR("CancelUpdate"), v4);

    }
  }
  else
  {
    v5 = (id)-[SUCoreFSM diag](v10->_updateFSM, "diag");
    objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SUSettingsUpdateOperation]"), CFSTR("There is no active search to cancel"), 8102, 0);

  }
  objc_sync_exit(obj);

  objc_storeStrong(location, 0);
}

- (BOOL)isActive
{
  return -[SUSettingsUpdateOperation operationType](self, "operationType", a2, self) != 0;
}

- (void)invalidateMachine
{
  id scheduleCompletion;
  id downloadUpdateCompletion;
  id downloadAndScheduleCompletion;
  id installCompletion;
  id cancelHandler;

  self->_operationType = 0;
  scheduleCompletion = self->_scheduleCompletion;
  self->_scheduleCompletion = 0;

  downloadUpdateCompletion = self->_downloadUpdateCompletion;
  self->_downloadUpdateCompletion = 0;

  downloadAndScheduleCompletion = self->_downloadAndScheduleCompletion;
  self->_downloadAndScheduleCompletion = 0;

  installCompletion = self->_installCompletion;
  self->_installCompletion = 0;

  cancelHandler = self->_cancelHandler;
  self->_cancelHandler = 0;

  self->_canceled = 0;
}

- (BOOL)beginOperation:(unint64_t)a3 ofUnattendedInstall:(BOOL)a4 descriptor:(id)a5 options:(id)a6
{
  OS_dispatch_queue *v6;
  OS_dispatch_queue *delegateCallbackQueue;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *completionQueue;
  SUSettingsUpdateParam *v10;
  id v12;
  id v13;
  SUCoreFSM *updateFSM;
  SUSettingsUpdateParam *v15;
  SUCoreLog *v16;
  id v18;
  id v19;
  id location;
  BOOL v21;
  unint64_t v22;
  SEL v23;
  SUSettingsUpdateOperation *v24;
  char v25;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24 = self;
  v23 = a2;
  v22 = a3;
  v21 = a4;
  location = 0;
  objc_storeStrong(&location, a5);
  v19 = 0;
  objc_storeStrong(&v19, a6);
  if (v24->_delegate)
  {
    v24->_operationType = v22;
    v12 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    v6 = (OS_dispatch_queue *)(id)objc_msgSend(v12, "selectDelegateCallbackQueue:", v24->_delegateCallbackQueue);
    delegateCallbackQueue = v24->_delegateCallbackQueue;
    v24->_delegateCallbackQueue = v6;

    v13 = (id)objc_msgSend(MEMORY[0x24BEAEA30], "sharedCore");
    v8 = (OS_dispatch_queue *)(id)objc_msgSend(v13, "selectCompletionQueue:", v24->_completionQueue);
    completionQueue = v24->_completionQueue;
    v24->_completionQueue = v8;

    -[SUCoreFSM activateMachine](v24->_updateFSM, "activateMachine");
    updateFSM = v24->_updateFSM;
    v10 = [SUSettingsUpdateParam alloc];
    v15 = -[SUSettingsUpdateParam initWithDescriptor:andUpdateOptions:forUnattendedInstall:](v10, "initWithDescriptor:andUpdateOptions:forUnattendedInstall:", location, v19, v21);
    -[SUCoreFSM postEvent:withInfo:](updateFSM, "postEvent:withInfo:", CFSTR("BeginDownloadUpdate"));

    v25 = 1;
  }
  else
  {
    v16 = -[SUSettingsUpdateOperation log](v24, "log");
    v18 = (id)-[SUCoreLog oslog](v16, "oslog");

    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_8_0((uint64_t)v26, (uint64_t)"-[SUSettingsUpdateOperation beginOperation:ofUnattendedInstall:descriptor:options:]", v22);
      _os_log_error_impl(&dword_21BF33000, (os_log_t)v18, OS_LOG_TYPE_ERROR, "%s: Can not perform operation %ld: The class delegate must not be nil.", v26, 0x16u);
    }
    objc_storeStrong(&v18, 0);
    v25 = 0;
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);
  return v25 & 1;
}

- (BOOL)deviceSupportsCellularCapability
{
  char v3;
  id location;
  id v5[3];
  char v6;

  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDC2810]), "initWithQueue:", 0);
  if (v5[0])
  {
    location = (id)objc_msgSend(v5[0], "getInternetDataStatusSync:", 0);
    v3 = 0;
    if (location)
      v3 = objc_msgSend(location, "cellularDataPossible");
    v6 = v3 & 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(v5, 0);
  return v6 & 1;
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
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@.susettings.fsm.update"), v4);

  return v6;
}

- (BOOL)isCancelableState:(id)a3
{
  id location[3];
  BOOL v5;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("Idle")) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("PurgingSpace")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = (objc_msgSend(location[0], "isEqualToString:", CFSTR("AquiringKeybag")) & 1) != 0
      || (objc_msgSend(location[0], "isEqualToString:", CFSTR("PresentingTermsConditions")) & 1) != 0
      || (objc_msgSend(location[0], "isEqualToString:", CFSTR("ResolvingUpdateOperation")) & 1) != 0;
  }
  objc_storeStrong(location, 0);
  return v5;
}

- (SUSettingsUpdateOperationDelegate)delegate
{
  return self->_delegate;
}

- (OS_dispatch_queue)completionQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCompletionQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegateCallbackQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (SUCoreLog)log
{
  return self->_log;
}

- (id)downloadUpdateCompletion
{
  return self->_downloadUpdateCompletion;
}

- (void)setDownloadUpdateCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)downloadAndScheduleCompletion
{
  return self->_downloadAndScheduleCompletion;
}

- (void)setDownloadAndScheduleCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)scheduleCompletion
{
  return self->_scheduleCompletion;
}

- (void)setScheduleCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setCancelHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)installCompletion
{
  return self->_installCompletion;
}

- (void)setInstallCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (OS_dispatch_queue)requestsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRequestsQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(unint64_t)a3
{
  self->_operationType = a3;
}

- (SUCoreFSM)updateFSM
{
  return self->_updateFSM;
}

- (SUManagerClient)suClient
{
  return self->_suClient;
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
  objc_storeStrong((id *)&self->_suClient, 0);
  objc_storeStrong((id *)&self->_updateFSM, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_requestsQueue, 0);
  objc_storeStrong(&self->_installCompletion, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_scheduleCompletion, 0);
  objc_storeStrong(&self->_downloadAndScheduleCompletion, 0);
  objc_storeStrong(&self->_downloadUpdateCompletion, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_delegateCallbackQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
