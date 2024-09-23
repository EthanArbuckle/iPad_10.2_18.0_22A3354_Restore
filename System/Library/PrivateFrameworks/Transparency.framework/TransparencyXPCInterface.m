@implementation TransparencyXPCInterface

+ (id)interface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  _QWORD v189[2];
  uint64_t v190;
  uint64_t v191;
  id CNContactClass;
  uint64_t v193;
  _QWORD v194[2];
  uint64_t v195;
  uint64_t v196;
  _QWORD v197[2];
  _QWORD v198[5];
  _QWORD v199[5];
  _QWORD v200[8];

  v200[6] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2550DC128);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_initiateQueryForUris_application_completionBlock_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_initiateQueryForUris_application_completionBlock_, 0, 1);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_ignoreFailureForResults_application_completionBlock_, 0, 0);

  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_markFailureSeenForResults_application_completionBlock_, 0, 0);

  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_clearPeerCache_application_completionBlock_, 0, 0);

  v18 = (void *)MEMORY[0x24BDBCF20];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_validatePeers_application_fetchNow_completionBlock_, 0, 0);

  v22 = (void *)MEMORY[0x24BDBCF20];
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v25, sel_validatePeers_application_fetchNow_completionBlock_, 0, 1);

  v26 = (void *)MEMORY[0x24BDBCF20];
  v27 = objc_opt_class();
  objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_getCachedValidatePeerResults_application_completionBlock_, 0, 0);

  v29 = (void *)MEMORY[0x24BDBCF20];
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v32, sel_getCachedValidatePeerResults_application_completionBlock_, 0, 1);

  v33 = (void *)MEMORY[0x24BDBCF20];
  v34 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_fetchBatchQuery_application_userInitiated_completionHandler_, 0, 0);

  v36 = (void *)MEMORY[0x24BDBCF20];
  v200[0] = objc_opt_class();
  v200[1] = objc_opt_class();
  v200[2] = objc_opt_class();
  v200[3] = objc_opt_class();
  v200[4] = objc_opt_class();
  v200[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v200, 6);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setWithArray:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_fetchBatchQuery_application_userInitiated_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_fetchBatchQuery_application_userInitiated_completionHandler_, 1, 1);

  v40 = (void *)MEMORY[0x24BDBCF20];
  v41 = objc_opt_class();
  objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_validatePeerUri_application_accountKey_loggableDatas_queryRequest_queryResponse_promiseCompletionBlock_, 3, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v43, sel_validateEnrollmentUri_application_accountKey_loggableData_queryRequest_queryResponse_promiseCompletionBlock_, 3, 0);

  v44 = (void *)MEMORY[0x24BDBCF20];
  v45 = objc_opt_class();
  v46 = objc_opt_class();
  objc_msgSend(v44, "setWithObjects:", v45, v46, objc_opt_class(), 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v47, sel_validatePeerResult_uuid_fetchNow_completionBlock_, 0, 1);

  v48 = (void *)MEMORY[0x24BDBCF20];
  v49 = objc_opt_class();
  objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v50, sel_validateEnrollmentResult_uuid_completionBlock_, 3, 1);

  v51 = (void *)MEMORY[0x24BDBCF20];
  v52 = objc_opt_class();
  objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v53, sel_forceValidateUUID_uri_completionBlock_, 3, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v54, sel_getLoggableDataForDeviceId_application_completionBlock_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v55, sel_getKTOptInState_completion_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v56, sel_getKTOptInState_completion_, 0, 1);

  v57 = (void *)MEMORY[0x24BDBCF20];
  v58 = objc_opt_class();
  objc_msgSend(v57, "setWithObjects:", v58, objc_opt_class(), 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v59, sel_changeOptInState_application_completionBlock_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v60, sel_getStatus_completionBlock_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v61, sel_getStatus_completionBlock_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v62, sel_getSelfStatus_completionBlock_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v63, sel_getSelfStatus_completionBlock_, 1, 1);

  v64 = (void *)MEMORY[0x24BDBCF20];
  v65 = objc_opt_class();
  objc_msgSend(v64, "setWithObjects:", v65, objc_opt_class(), 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v66, sel_errorsForFailedEvents_completionBlock_, 0, 0);

  v67 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "setWithSet:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v69, "addObject:", objc_opt_class());
  objc_msgSend(v69, "addObject:", objc_opt_class());
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v69, sel_errorsForFailedEvents_completionBlock_, 1, 1);
  v70 = (void *)MEMORY[0x24BDBCF20];
  v71 = objc_opt_class();
  objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v72, sel_ignoreFailedEvents_completionBlock_, 0, 0);

  v73 = (void *)MEMORY[0x24BDBCF20];
  v74 = objc_opt_class();
  objc_msgSend(v73, "setWithObjects:", v74, objc_opt_class(), 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v75, sel_getReportsForUUIDs_completionBlock_, 0, 0);

  v76 = (void *)MEMORY[0x24BDBCF20];
  v199[0] = objc_opt_class();
  v199[1] = objc_opt_class();
  v199[2] = objc_opt_class();
  v199[3] = objc_opt_class();
  v199[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v199, 5);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setWithArray:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v78, sel_getReportsForUUIDs_completionBlock_, 0, 1);

  v79 = (void *)MEMORY[0x24BDBCF20];
  v198[0] = objc_opt_class();
  v198[1] = objc_opt_class();
  v198[2] = objc_opt_class();
  v198[3] = objc_opt_class();
  v198[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v198, 5);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setWithArray:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v81, sel_makeReports_additionalData_auditorURI_completionBlock_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v82, sel_makeReports_additionalData_auditorURI_completionBlock_, 2, 0);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v83, sel_transparencyIDSRepair_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v84, sel_transparencyTriggerIDMSFetch_, 0, 1);

  v85 = (void *)MEMORY[0x24BDBCF20];
  v86 = objc_opt_class();
  v87 = objc_opt_class();
  v88 = objc_opt_class();
  objc_msgSend(v85, "setWithObjects:", v86, v87, v88, objc_opt_class(), 0);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v89, sel_transparencySysDiagnose_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v90, sel_waitForIDSRegistration_, 0, 1);

  v91 = (void *)MEMORY[0x24BDBCF20];
  v92 = objc_opt_class();
  objc_msgSend(v91, "setWithObjects:", v92, objc_opt_class(), 0);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v93, sel_idmsDevices_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v94, sel_idmsDevices_, 1, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v95, sel_triggerSelfValidate_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v96, sel_performAndWaitForSelfValidate_, 1, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v97, sel_performAndWaitForSelfValidate_, 2, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v98, sel_replaySelfValidate_application_pcsAccountKey_queryRequest_queryResponse_responseTime_completionHandler_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v99, sel_replaySelfValidate_application_pcsAccountKey_queryRequest_queryResponse_responseTime_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v100, sel_replaySelfValidate_application_pcsAccountKey_queryRequest_queryResponse_responseTime_completionHandler_, 1, 1);

  v101 = (void *)MEMORY[0x24BDBCF20];
  v102 = objc_opt_class();
  objc_msgSend(v101, "setWithObjects:", v102, objc_opt_class(), 0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v103, sel_transparencyCloudDevices_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v104, sel_transparencyCloudDevices_, 1, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v105, sel_transparencyCloudDeviceAdd_clientData_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v106, sel_transparencyCloudDeviceRemove_clientData_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v107, sel_getOptInStateForAccount_complete_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v108, sel_getOptInStateForAccount_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v109, sel_getOptInStateForAccount_complete_, 1, 1);

  v110 = (void *)MEMORY[0x24BDBCF20];
  v197[0] = objc_opt_class();
  v197[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v197, 2);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v110, "setWithArray:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v112, sel_getAllOptInStates_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v113, sel_getAllOptInStates_, 1, 1);

  v114 = (void *)MEMORY[0x24BDBCF20];
  v196 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v196, 1);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setWithArray:", v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v116, sel_getOptInStateForApplication_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v117, sel_getOptInStateForApplication_complete_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v118, sel_transparencyGetKTSignatures_complete_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v119, sel_transparencyGetKTSignatures_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v120, sel_transparencyGetKTSignatures_complete_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v121, sel_transparencyDumpKTRegistrationData_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v122, sel_transparencyDumpKTRegistrationData_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v123, sel_transparencyPerformRegistrationSignature_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v124, sel_transparencyPerformRegistrationSignature_, 1, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v125, sel_transparencyClearKTRegistrationData_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v126, sel_transparencyCheckKTAccountKey_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v127, sel_transparencyCheckKTAccountKey_complete_, 0, 1);

  v128 = (void *)MEMORY[0x24BDBCF20];
  v129 = objc_opt_class();
  v130 = objc_opt_class();
  objc_msgSend(v128, "setWithObjects:", v129, v130, objc_opt_class(), 0);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v131, sel_copyDeviceStatus_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v132, sel_copyDeviceStatus_complete_, 1, 1);

  v133 = (void *)MEMORY[0x24BDBCF20];
  v134 = objc_opt_class();
  objc_msgSend(v133, "setWithObjects:", v134, objc_opt_class(), 0);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v135, sel_clearPeerState_uris_block_, 0, 0);

  v136 = (void *)MEMORY[0x24BDBCF20];
  v137 = objc_opt_class();
  v138 = objc_opt_class();
  v139 = objc_opt_class();
  objc_msgSend(v136, "setWithObjects:", v137, v138, v139, objc_opt_class(), 0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v140, sel_listPeerOverrides_, 0, 1);

  v141 = (void *)MEMORY[0x24BDBCF20];
  v195 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v195, 1);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "setWithArray:", v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v143, sel_updateStaticKeyEntry_contactIdentifier_contactExternalIdentifier_mappings_error_, 0, 0);

  v144 = (void *)MEMORY[0x24BDBCF20];
  v194[0] = objc_opt_class();
  v194[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v194, 2);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v144, "setWithArray:", v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v146, sel_updateStaticKeyEntry_contactIdentifier_contactExternalIdentifier_mappings_error_, 3, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v147, sel_updateStaticKeyEntry_contactIdentifier_contactExternalIdentifier_mappings_error_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v148, sel_updateStaticKeyEntry_contactIdentifier_contactExternalIdentifier_mappings_error_, 1, 1);

  v149 = (void *)MEMORY[0x24BDBCF20];
  v193 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v193, 1);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v149, "setWithArray:", v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v151, sel_updateStaticKeyEntry_contact_complete_, 0, 0);

  v152 = (void *)MEMORY[0x24BDBCF20];
  CNContactClass = getCNContactClass();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &CNContactClass, 1);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "setWithArray:", v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v154, sel_updateStaticKeyEntry_contact_complete_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v155, sel_updateStaticKeyEntry_contact_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v156, sel_updateStaticKeyEntry_contact_complete_, 1, 1);

  v157 = (void *)MEMORY[0x24BDBCF20];
  v191 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v191, 1);
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v157, "setWithArray:", v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v159, sel_findStaticKeyStoreMappingByKey_complete_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v160, sel_findStaticKeyStoreMappingByKey_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v161, sel_findStaticKeyStoreMappingByKey_complete_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v162, sel_findStaticKeyStoreMappingByIDSURI_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v163, sel_findStaticKeyStoreMappingByIDSURI_complete_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v164, sel_findStaticKeyStoreMappingByContactIdentifer_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v165, sel_findStaticKeyStoreMappingByContactIdentifer_complete_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", getCNContactClass());
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v166, sel_findStaticKeyStoreMappingByContact_complete_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v167, sel_findStaticKeyStoreMappingByContact_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v168, sel_findStaticKeyStoreMappingByContact_complete_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v169, sel_validateStaticKeyStoreMappingByContactIdentifer_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v170, sel_validateStaticKeyStoreMappingByContactIdentifer_complete_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v171, sel_validateStaticKeyStoreMappingByContactExternalURI_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v172, sel_validateStaticKeyStoreMappingByContactExternalURI_complete_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v173, sel_validateStaticKeyStoreMappingByKey_complete_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v174, sel_validateStaticKeyStoreMappingByKey_complete_, 1, 1);

  v175 = (void *)MEMORY[0x24BDBCF20];
  v190 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v190, 1);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v175, "setWithArray:", v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v177, sel_removeEntryByKDID_complete_, 0, 0);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v178, sel_removeEntryByKDID_complete_, 1, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v179, sel_removeEntryByContactIdentifier_complete_, 1, 1);

  v180 = (void *)MEMORY[0x24BDBCF20];
  v189[0] = objc_opt_class();
  v189[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v189, 2);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v180, "setWithArray:", v181);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v182, sel_listStaticKey_, 0, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v183, sel_listStaticKey_, 1, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v184, sel_setErrorCode_forMapping_complete_, 1, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v185, sel_staticKeyTriggerSync_, 1, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v186, sel_setupCloudSchema_complete_, 1, 1);

  objc_msgSend(MEMORY[0x24BDE84F8], "safeErrorClasses");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v187, sel_resetCloudZone_, 1, 1);

  return v2;
}

@end
