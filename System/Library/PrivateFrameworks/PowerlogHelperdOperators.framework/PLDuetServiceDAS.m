@implementation PLDuetServiceDAS

- (PLDuetServiceDAS)init
{
  PLDuetServiceDAS *v3;
  PLDuetServiceDAS *v4;
  objc_super v6;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PLDuetServiceDAS;
    v4 = -[PLDuetServiceDAS init](&v6, sel_init);
    -[PLDuetServiceDAS setDuetService:](v4, "setDuetService:", 0);
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)stopService
{
  -[PLDuetServiceDAS setDuetService:](self, "setDuetService:", 0);
}

+ (id)entryEventNoneDefinitionsDASPoliciesBlockingCriteria
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA1DAD88, *MEMORY[0x1E0D80318]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80288]);
  v15[0] = CFSTR("Policy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("Utility");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("Maintenance");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x1E0D802F0];
  v13[0] = *MEMORY[0x1E0D80298];
  v13[1] = v10;
  v14[0] = v2;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventNoneDefinitionsDASActivityLifecycle
{
  uint64_t v2;
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
  uint64_t v13;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[34];
  _QWORD v79[36];

  v79[34] = *MEMORY[0x1E0C80C00];
  v75 = (void *)objc_opt_new();
  objc_msgSend(v75, "setObject:forKeyedSubscript:", &unk_1EA1DAD98, *MEMORY[0x1E0D80318]);
  v2 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v75, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80250]);
  objc_msgSend(v75, "setObject:forKeyedSubscript:", v2, *MEMORY[0x1E0D80288]);
  v78[0] = CFSTR("Name");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "commonTypeDict_StringFormat");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v73;
  v78[1] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "commonTypeDict_StringFormat_withProcessName");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v71;
  v78[2] = CFSTR("Priority");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "commonTypeDict_IntegerFormat");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v79[2] = v69;
  v78[3] = CFSTR("PID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "commonTypeDict_IntegerFormat");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v79[3] = v67;
  v78[4] = CFSTR("StartDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "commonTypeDict_DateFormat");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v79[4] = v65;
  v78[5] = CFSTR("EndDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "commonTypeDict_DateFormat");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v79[5] = v63;
  v78[6] = CFSTR("Duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "commonTypeDict_IntegerFormat");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v79[6] = v61;
  v78[7] = CFSTR("SuspendRequestDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "commonTypeDict_DateFormat");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v79[7] = v59;
  v78[8] = CFSTR("SuspensionDelay");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "commonTypeDict_IntegerFormat");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v79[8] = v57;
  v78[9] = CFSTR("ScheduleAfterDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "commonTypeDict_DateFormat");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v79[9] = v55;
  v78[10] = CFSTR("ScheduleBeforeDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "commonTypeDict_DateFormat");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v79[10] = v53;
  v78[11] = CFSTR("BeyondDeadline");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "commonTypeDict_BoolFormat");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v79[11] = v51;
  v78[12] = CFSTR("Interval");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "commonTypeDict_IntegerFormat");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v79[12] = v49;
  v78[13] = CFSTR("FileProtection");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "commonTypeDict_IntegerFormat");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v79[13] = v47;
  v78[14] = CFSTR("IsCPUIntensive");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "commonTypeDict_BoolFormat");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v79[14] = v45;
  v78[15] = CFSTR("IsMemoryIntensive");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "commonTypeDict_BoolFormat");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v79[15] = v43;
  v78[16] = CFSTR("RequiresPlugin");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "commonTypeDict_BoolFormat");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v79[16] = v41;
  v78[17] = CFSTR("RequiresNetwork");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "commonTypeDict_BoolFormat");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v79[17] = v39;
  v78[18] = CFSTR("RequiresInexpensiveNetworking");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "commonTypeDict_BoolFormat");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v79[18] = v37;
  v78[19] = CFSTR("RequiresUnconstrainedNetworking");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_BoolFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v79[19] = v35;
  v78[20] = CFSTR("RequiresDeviceInactivity");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_BoolFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v79[20] = v33;
  v78[21] = CFSTR("RequiresSignificantUserInactivity");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_BoolFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v79[21] = v31;
  v78[22] = CFSTR("TriggersRestart");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_BoolFormat");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v79[22] = v28;
  v78[23] = CFSTR("Energy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v79[23] = v26;
  v78[24] = CFSTR("NetworkTaskSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v79[24] = v24;
  v78[25] = CFSTR("OptimalScore");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v79[25] = v22;
  v78[26] = CFSTR("ScoreWhenRun");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v79[26] = v20;
  v78[27] = CFSTR("OptimalScorePercentage");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v79[27] = v18;
  v78[28] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v79[28] = v16;
  v78[29] = CFSTR("Application");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat_withAppName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v79[29] = v4;
  v78[30] = CFSTR("InvolvedProcesses");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat_withProcessName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v79[30] = v6;
  v78[31] = CFSTR("GroupName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v79[31] = v8;
  v78[32] = CFSTR("SuspensionReason");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v79[32] = v10;
  v78[33] = CFSTR("Limitations");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v79[33] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 34);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x1E0D802F0];
  v76[0] = *MEMORY[0x1E0D80298];
  v76[1] = v13;
  v77[0] = v75;
  v77[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)entryEventNoneDefinitionsDASActivity
{
  uint64_t v2;
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
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[22];
  _QWORD v52[22];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[4];

  v56[2] = *MEMORY[0x1E0C80C00];
  v55[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v53[0] = *MEMORY[0x1E0D80318];
  v53[1] = v2;
  v54[0] = &unk_1EA1DADA8;
  v54[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v50;
  v55[1] = *MEMORY[0x1E0D802F0];
  v51[0] = CFSTR("taskName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_StringFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v48;
  v51[1] = CFSTR("startTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_DateFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v46;
  v51[2] = CFSTR("endTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_DateFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v44;
  v51[3] = CFSTR("duration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v42;
  v51[4] = CFSTR("optimalScore");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v40;
  v51[5] = CFSTR("scoreWhenRun");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "commonTypeDict_IntegerFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v38;
  v51[6] = CFSTR("networkTaskSize");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v36;
  v51[7] = CFSTR("priority");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v34;
  v51[8] = CFSTR("requiresPlugin");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "commonTypeDict_BoolFormat");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v32;
  v51[9] = CFSTR("requiresInexpensiveNetworking");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "commonTypeDict_BoolFormat");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v52[9] = v30;
  v51[10] = CFSTR("application");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "commonTypeDict_StringFormat_withBundleID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52[10] = v28;
  v51[11] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "commonTypeDict_StringFormat_withBundleID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v52[11] = v26;
  v51[12] = CFSTR("involvedProcesses");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "commonTypeDict_StringFormat_withBundleID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52[12] = v24;
  v51[13] = CFSTR("requiresDeviceInactivity");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_BoolFormat");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52[13] = v22;
  v51[14] = CFSTR("isCpuIntensive");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "commonTypeDict_BoolFormat");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52[14] = v20;
  v51[15] = CFSTR("isMemoryIntensive");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_BoolFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[15] = v18;
  v51[16] = CFSTR("scoreNetworkQualityPolicy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52[16] = v16;
  v51[17] = CFSTR("scoreBatteryLevelPolicy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v52[17] = v14;
  v51[18] = CFSTR("scoreEnergyBudgetPolicy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v52[18] = v4;
  v51[19] = CFSTR("scoreChargerPluggedInPolicy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v52[19] = v6;
  v51[20] = CFSTR("scoreDeviceActivityPolicy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v52[20] = v8;
  v51[21] = CFSTR("scoreApplicationPolicy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52[21] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventNoneDefinitionsDASActivityDropCount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1EA1DAD88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("droppedCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventNoneDefinitionsDASInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0D80298];
  v12 = *MEMORY[0x1E0D80318];
  v13 = &unk_1EA1DAD88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E0D802F0];
  v10[0] = CFSTR("eventsCoalesced");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("queuedTasks");
  v11[0] = v4;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)entryEventForwardDefinitionsDASPrediction
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  _QWORD v9[4];
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D80348];
  v14[0] = *MEMORY[0x1E0D80358];
  v14[1] = v2;
  v15[0] = &unk_1EA1C1640;
  v15[1] = &unk_1EA1C1658;
  v14[2] = *MEMORY[0x1E0D80350];
  v15[2] = &unk_1EA1C1670;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1EA1DAD88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8[0] = CFSTR("powerPluggedInPrediction");
  v8[1] = CFSTR("cellQualityPrediction");
  v9[0] = v3;
  v9[1] = v3;
  v8[2] = CFSTR("deviceActivityPrediction");
  v8[3] = CFSTR("wiFiAssociatedPrediction");
  v9[2] = v3;
  v9[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitionsDASTrial
{
  uint64_t v2;
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
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[4];

  v22[2] = *MEMORY[0x1E0C80C00];
  v21[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802B8];
  v19[0] = *MEMORY[0x1E0D80318];
  v19[1] = v2;
  v20[0] = &unk_1EA1DAD88;
  v20[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E0D802F0];
  v17[0] = CFSTR("trialExperimentId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v17[1] = CFSTR("trialTreatmentId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v4;
  v17[2] = CFSTR("trialDeploymentId");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v6;
  v17[3] = CFSTR("trialStartDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_DateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  v17[4] = CFSTR("trialEndDate");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_DateFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryEventForwardDefinitionsDASApplicationPrediction
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1EA1DAD88;
  v16[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("applicationBundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = CFSTR("applicationPredictionArray");
  v14[0] = v5;
  v6 = *MEMORY[0x1E0D80348];
  v11[0] = *MEMORY[0x1E0D80358];
  v11[1] = v6;
  v12[0] = &unk_1EA1C1640;
  v12[1] = &unk_1EA1C1658;
  v11[2] = *MEMORY[0x1E0D80350];
  v12[2] = &unk_1EA1C1670;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventForwardDefinitionsDASEnergyBudgetAvailable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1EA1DAD88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("energyAvailable");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventForwardDefinitionsDASDataBudgetAvailable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v12[0] = *MEMORY[0x1E0D80298];
  v10 = *MEMORY[0x1E0D80318];
  v11 = &unk_1EA1DAD88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E0D802F0];
  v8 = CFSTR("dataAvailable");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)entryEventBackwardDefinitionsDASEnergyBudgetReport
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  _QWORD v28[11];
  _QWORD v29[11];
  uint64_t v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v32[0] = *MEMORY[0x1E0D80298];
  v30 = *MEMORY[0x1E0D80318];
  v31 = &unk_1EA1DAD88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v27;
  v32[1] = *MEMORY[0x1E0D802F0];
  v28[0] = CFSTR("PowerlogEnergyReportedPrevious");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v25;
  v28[1] = CFSTR("PowerlogEnergyReportedLast");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v23;
  v28[2] = CFSTR("PowerlogTimestampPrevious");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_DateFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v21;
  v28[3] = CFSTR("PowerlogTimestampLast");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_DateFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v19;
  v28[4] = CFSTR("CPUEnergyPrevious");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v17;
  v28[5] = CFSTR("NetworkEnergyPrevious");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v15;
  v28[6] = CFSTR("CPUEnergyLast");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v13;
  v28[7] = CFSTR("NetworkEnergyLast");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v3;
  v28[8] = CFSTR("CPUEnergyCurrent");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v5;
  v28[9] = CFSTR("NetworkEnergyCurrent");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v7;
  v28[10] = CFSTR("DidReport");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_BoolFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[10] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)initOperatorDependanciesDAS:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
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
  dispatch_time_t v17;
  uint8_t v18[8];
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];

  v4 = a3;
  if (v4)
  {
    if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
    {
      -[PLDuetServiceDAS setDuetService:](self, "setDuetService:", v4);
      v5 = objc_alloc(MEMORY[0x1E0D80090]);
      v6 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke;
      v27[3] = &unk_1EA16CF18;
      v27[4] = self;
      v7 = (void *)objc_msgSend(v5, "initWithOperator:withRegistration:withBlock:", v4, &unk_1EA1D9DE0, v27);
      -[PLDuetServiceDAS setDasTrialEventListener:](self, "setDasTrialEventListener:", v7);

      v26[0] = v6;
      v26[1] = 3221225472;
      v26[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_2;
      v26[3] = &unk_1EA16CF18;
      v26[4] = self;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", v4, &unk_1EA1D9E08, v26);
      -[PLDuetServiceDAS setDasActivityEventListener:](self, "setDasActivityEventListener:", v8);

      v25[0] = v6;
      v25[1] = 3221225472;
      v25[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_3;
      v25[3] = &unk_1EA16CF18;
      v25[4] = self;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", v4, &unk_1EA1D9E30, v25);
      -[PLDuetServiceDAS setDasActivityLifecycleEventListener:](self, "setDasActivityLifecycleEventListener:", v9);

      v24[0] = v6;
      v24[1] = 3221225472;
      v24[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_4;
      v24[3] = &unk_1EA16CF18;
      v24[4] = self;
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", v4, &unk_1EA1D9E58, v24);
      -[PLDuetServiceDAS setDasInfoEventListener:](self, "setDasInfoEventListener:", v10);

      v23[0] = v6;
      v23[1] = 3221225472;
      v23[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_5;
      v23[3] = &unk_1EA16CF18;
      v23[4] = self;
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", v4, &unk_1EA1D9E80, v23);
      -[PLDuetServiceDAS setDasPoliciesBlockingCriteriaEventListener:](self, "setDasPoliciesBlockingCriteriaEventListener:", v11);

      v22[0] = v6;
      v22[1] = 3221225472;
      v22[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_6;
      v22[3] = &unk_1EA16CF18;
      v22[4] = self;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", v4, &unk_1EA1D9EA8, v22);
      -[PLDuetServiceDAS setDasPredictionEventListener:](self, "setDasPredictionEventListener:", v12);

      v21[0] = v6;
      v21[1] = 3221225472;
      v21[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_231;
      v21[3] = &unk_1EA16CF18;
      v21[4] = self;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", v4, &unk_1EA1D9ED0, v21);
      -[PLDuetServiceDAS setDasBudgetEventListener:](self, "setDasBudgetEventListener:", v13);

      v20[0] = v6;
      v20[1] = 3221225472;
      v20[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_2_237;
      v20[3] = &unk_1EA16CF18;
      v20[4] = self;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", v4, &unk_1EA1D9EF8, v20);
      -[PLDuetServiceDAS setDasDataBudgetEventListener:](self, "setDasDataBudgetEventListener:", v14);

      v19[0] = v6;
      v19[1] = 3221225472;
      v19[2] = __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_3_243;
      v19[3] = &unk_1EA16CF18;
      v19[4] = self;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", v4, &unk_1EA1D9F20, v19);
      -[PLDuetServiceDAS setDasEnergyReportEventListener:](self, "setDasEnergyReportEventListener:", v15);

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
      {
        PLLogDuetServiceDAS();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_1DA9D6000, v16, OS_LOG_TYPE_DEFAULT, "PerfPowerServices is ready to receive Background Processing Payload", v18, 2u);
        }

        v17 = dispatch_time(0, 60000000000);
        dispatch_after(v17, MEMORY[0x1E0C80D38], &__block_literal_global_246);
      }
    }
  }

}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveDASTrialEventWithPayload:", a5);
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveDASActivityEventWithPayload:", a5);
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveDASActivityLifecycleEventWithPayload:", a5);
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveDASInfoEventWithPayload:", a5);
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveDASPoliciesBlockingCriteriaEventWithPayload:", a5);
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveDASPredictionEventWithPayload:", a5);
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_231(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveDASBudgetEventWithPayload:", a5);
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_2_237(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveDASDataBudgetEventWithPayload:", a5);
}

uint64_t __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_3_243(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveDASReportEventWithPayload:", a5);
}

void __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_245()
{
  uint32_t v0;
  NSObject *v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v0 = notify_post("com.apple.perfpowerservices.reportfeaturestatus");
  PLLogDuetServiceDAS();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_245_cold_1(v0, v2);
  }
  else if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "com.apple.perfpowerservices.reportfeaturestatus";
    _os_log_impl(&dword_1DA9D6000, v2, OS_LOG_TYPE_INFO, "Posted %s", (uint8_t *)&v3, 0xCu);
  }

}

- (void)didReceiveDASActivityEventWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  const __CFString *v30;
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
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *context;
  PLDuetServiceDAS *v61;
  void *v62;
  id obj;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD block[5];
  void *v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PLDuetServiceDAS_didReceiveDASActivityEventWithPayload___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didReceiveDASActivityEventWithPayload__defaultOnce != -1)
      dispatch_once(&didReceiveDASActivityEventWithPayload__defaultOnce, block);
    if (didReceiveDASActivityEventWithPayload__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("payload=%@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetServiceDAS.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceDAS didReceiveDASActivityEventWithPayload:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 482);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  PLLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[PLDuetServiceDAS didReceiveDASActivityEventWithPayload:].cold.1();

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dasTasks"));
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[PLDuetServiceDAS duetService](self, "duetService");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v61 = self;
        context = (void *)MEMORY[0x1DF0A47AC]();
        v59 = *MEMORY[0x1E0D80388];
        +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = (void *)objc_opt_new();
        v66 = 0u;
        v67 = 0u;
        v68 = 0u;
        v69 = 0u;
        v62 = v4;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dasTasks"));
        obj = (id)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
        if (v16)
        {
          v17 = v16;
          v18 = CFSTR("timeWhenRun");
          v19 = *(_QWORD *)v67;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v67 != v19)
                objc_enumerationMutation(obj);
              v21 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
              v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v65);
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("taskName"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, CFSTR("taskName"));

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("startTime"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("startTime"));

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("endTime"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, CFSTR("endTime"));

              objc_msgSend(v21, "objectForKey:", v18);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v26)
              {
                objc_msgSend(v21, "objectForKeyedSubscript:", v18);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "timeIntervalSince1970");
                objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", floor(v28));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "convertFromSystemToMonotonic");
                v30 = v18;
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setEntryDate:", v31);

                v18 = v30;
              }
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("duration"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v32, CFSTR("duration"));

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("optimalScore"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v33, CFSTR("optimalScore"));

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("scoreWhenRun"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v34, CFSTR("scoreWhenRun"));

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("networkTaskSize"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v35, CFSTR("networkTaskSize"));

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("priority"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v36, CFSTR("priority"));

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("requiresPlugin"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v37, CFSTR("requiresPlugin"));

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("requiresInexpensiveNetworking"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v38, CFSTR("requiresInexpensiveNetworking"));

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("application"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v39, CFSTR("application"));

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("bundleID"));
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v40, CFSTR("bundleID"));

              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("involvedProcesses"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v41, CFSTR("involvedProcesses"));

              if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
              {
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("requiresDeviceInactivity"));
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v42, CFSTR("requiresDeviceInactivity"));

                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("isCpuIntensive"));
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v43, CFSTR("isCpuIntensive"));

                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("isMemoryIntensive"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v44, CFSTR("isMemoryIntensive"));

                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("scoreNetworkQualityPolicy"));
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v45, CFSTR("scoreNetworkQualityPolicy"));

                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("scoreBatteryLevelPolicy"));
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v46, CFSTR("scoreBatteryLevelPolicy"));

                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("scoreEnergyBudgetPolicy"));
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v47, CFSTR("scoreEnergyBudgetPolicy"));

                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("scoreChargerPluggedInPolicy"));
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v48, CFSTR("scoreChargerPluggedInPolicy"));

                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("scoreDeviceActivityPolicy"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v49, CFSTR("scoreDeviceActivityPolicy"));

                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("scoreApplicationPolicy"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setObject:forKeyedSubscript:", v50, CFSTR("scoreApplicationPolicy"));

              }
              objc_msgSend(v64, "addObject:", v22);

            }
            v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
          }
          while (v17);
        }

        -[PLDuetServiceDAS duetService](v61, "duetService");
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          -[PLDuetServiceDAS duetService](v61, "duetService");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v65;
          v72 = v64;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "logEntries:withGroupID:", v53, v65);

        }
        +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", v59, CFSTR("DASDropCount"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v54);
        v4 = v62;
        objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("droppedCount"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKeyedSubscript:", v56, CFSTR("droppedCount"));

        -[PLDuetServiceDAS duetService](v61, "duetService");
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (v57)
        {
          -[PLDuetServiceDAS duetService](v61, "duetService");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "logEntry:", v55);

        }
        objc_autoreleasePoolPop(context);
      }
    }
  }

}

uint64_t __58__PLDuetServiceDAS_didReceiveDASActivityEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveDASActivityEventWithPayload__classDebugEnabled = result;
  return result;
}

- (void)didReceiveDASActivityLifecycleEventWithPayload:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLDuetServiceDAS didReceiveDASActivityLifecycleEventWithPayload:].cold.1();

  v6 = (void *)MEMORY[0x1DF0A47AC]();
  +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("DASActivityLifecycle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FileProtection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLDuetServiceDAS fileProtectionTypeStringToEnum:](self, "fileProtectionTypeStringToEnum:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("FileProtection"));

  -[PLDuetServiceDAS duetService](self, "duetService");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[PLDuetServiceDAS duetService](self, "duetService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logEntry:", v8);

  }
  objc_autoreleasePoolPop(v6);

}

- (void)didReceiveDASInfoEventWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __54__PLDuetServiceDAS_didReceiveDASInfoEventWithPayload___block_invoke;
    v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    v24 = v5;
    if (didReceiveDASInfoEventWithPayload__defaultOnce != -1)
      dispatch_once(&didReceiveDASInfoEventWithPayload__defaultOnce, &block);
    if (didReceiveDASInfoEventWithPayload__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("payload=%@"), v4, block, v21, v22, v23, v24);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetServiceDAS.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceDAS didReceiveDASInfoEventWithPayload:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 549);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  if (v4)
  {
    -[PLDuetServiceDAS duetService](self, "duetService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x1DF0A47AC]();
      +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("DASInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v14);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventsCoalesced"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("eventsCoalesced"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queuedTasks"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("queuedTasks"));

      -[PLDuetServiceDAS duetService](self, "duetService");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[PLDuetServiceDAS duetService](self, "duetService");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logEntry:", v15);

      }
      objc_autoreleasePoolPop(v13);
    }
  }

}

uint64_t __54__PLDuetServiceDAS_didReceiveDASInfoEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveDASInfoEventWithPayload__classDebugEnabled = result;
  return result;
}

- (void)didReceiveDASBudgetEventWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __56__PLDuetServiceDAS_didReceiveDASBudgetEventWithPayload___block_invoke;
    v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    v24 = v5;
    if (didReceiveDASBudgetEventWithPayload__defaultOnce != -1)
      dispatch_once(&didReceiveDASBudgetEventWithPayload__defaultOnce, &block);
    if (didReceiveDASBudgetEventWithPayload__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("payload=%@"), v4, block, v21, v22, v23, v24);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetServiceDAS.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceDAS didReceiveDASBudgetEventWithPayload:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 563);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  PLLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[PLDuetServiceDAS didReceiveDASBudgetEventWithPayload:].cold.1();

  if (v4)
  {
    -[PLDuetServiceDAS duetService](self, "duetService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1DF0A47AC]();
      +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("DASEnergyBudgetAvailable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v15);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("energyAvailable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("energyAvailable"));

      -[PLDuetServiceDAS duetService](self, "duetService");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[PLDuetServiceDAS duetService](self, "duetService");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logEntry:", v16);

      }
      objc_autoreleasePoolPop(v14);
    }
  }

}

uint64_t __56__PLDuetServiceDAS_didReceiveDASBudgetEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveDASBudgetEventWithPayload__classDebugEnabled = result;
  return result;
}

- (void)didReceiveDASDataBudgetEventWithPayload:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4
    && (-[PLDuetServiceDAS duetService](self, "duetService"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    PLLogDuetServiceDAS();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PLDuetServiceDAS didReceiveDASDataBudgetEventWithPayload:].cold.2();

    +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("DASDataBudgetAvailable"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v7);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dataAvailable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("dataAvailable"));

    -[PLDuetServiceDAS duetService](self, "duetService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[PLDuetServiceDAS duetService](self, "duetService");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logEntry:", v8);

    }
  }
  else
  {
    PLLogDuetServiceDAS();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PLDuetServiceDAS didReceiveDASDataBudgetEventWithPayload:].cold.1();
  }

}

- (void)didReceiveDASReportEventWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t block;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  uint64_t v23;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __56__PLDuetServiceDAS_didReceiveDASReportEventWithPayload___block_invoke;
    v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    v23 = v5;
    if (didReceiveDASReportEventWithPayload__defaultOnce != -1)
      dispatch_once(&didReceiveDASReportEventWithPayload__defaultOnce, &block);
    if (didReceiveDASReportEventWithPayload__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("payload=%@"), v4, block, v20, v21, v22, v23);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetServiceDAS.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceDAS didReceiveDASReportEventWithPayload:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 596);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  PLLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[PLDuetServiceDAS didReceiveDASReportEventWithPayload:].cold.1();

  if (v4)
  {
    -[PLDuetServiceDAS duetService](self, "duetService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (void *)MEMORY[0x1DF0A47AC]();
      +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("DASEnergyBudgetReport"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v15, v4);
      -[PLDuetServiceDAS duetService](self, "duetService");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        -[PLDuetServiceDAS duetService](self, "duetService");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logEntry:", v16);

      }
      objc_autoreleasePoolPop(v14);
    }
  }

}

uint64_t __56__PLDuetServiceDAS_didReceiveDASReportEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveDASReportEventWithPayload__classDebugEnabled = result;
  return result;
}

- (void)didReceiveDASPredictionEventWithPayload:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *context;
  id v37;
  id obj;
  uint64_t v39;
  PLDuetServiceDAS *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD block[5];
  void *v54;
  void *v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PLDuetServiceDAS_didReceiveDASPredictionEventWithPayload___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didReceiveDASPredictionEventWithPayload__defaultOnce != -1)
      dispatch_once(&didReceiveDASPredictionEventWithPayload__defaultOnce, block);
    if (didReceiveDASPredictionEventWithPayload__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("payload=%@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetServiceDAS.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLDuetServiceDAS didReceiveDASPredictionEventWithPayload:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 609);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  if (v4)
  {
    -[PLDuetServiceDAS duetService](self, "duetService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      context = (void *)MEMORY[0x1DF0A47AC]();
      v41 = *MEMORY[0x1E0D80378];
      +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v35);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("powerPluggedInPrediction"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("powerPluggedInPrediction"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cellQualityPrediction"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("cellQualityPrediction"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceActivityPrediction"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("deviceActivityPrediction"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wiFiAssociatedPrediction"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("wiFiAssociatedPrediction"));

      -[PLDuetServiceDAS duetService](self, "duetService");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[PLDuetServiceDAS duetService](self, "duetService");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logEntry:", v13);

      }
      v34 = v13;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v37 = v4;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationUsagePrediction"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      if (v42)
      {
        v39 = *(_QWORD *)v50;
        v40 = self;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v50 != v39)
              objc_enumerationMutation(obj);
            v44 = v20;
            v21 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v20);
            +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", v41, CFSTR("DASApplicationUsagePrediction"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v43);
            v23 = (void *)objc_opt_new();
            objc_msgSend(v21, "allKeys");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v46 != v27)
                    objc_enumerationMutation(v24);
                  v29 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
                  objc_msgSend(v22, "setObject:forKeyedSubscript:", v29, CFSTR("applicationBundleID"));
                  objc_msgSend(v21, "objectForKeyedSubscript:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, CFSTR("applicationPredictionArray"));

                  objc_msgSend(v23, "addObject:", v22);
                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
              }
              while (v26);
            }
            -[PLDuetServiceDAS duetService](v40, "duetService");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              -[PLDuetServiceDAS duetService](v40, "duetService");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = v43;
              v55 = v23;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "logEntries:withGroupID:", v33, v43);

            }
            v20 = v44 + 1;
          }
          while (v44 + 1 != v42);
          v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
        }
        while (v42);
      }

      objc_autoreleasePoolPop(context);
      v4 = v37;
    }
  }

}

uint64_t __60__PLDuetServiceDAS_didReceiveDASPredictionEventWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didReceiveDASPredictionEventWithPayload__classDebugEnabled = result;
  return result;
}

- (void)didReceiveDASPoliciesBlockingCriteriaEventWithPayload:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *context;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLDuetServiceDAS didReceiveDASPoliciesBlockingCriteriaEventWithPayload:].cold.1();

  +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("DASPoliciesBlockingCriteria"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x1DF0A47AC]();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Evaluations"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v6);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Policy"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("Policy"));

        objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1EA1C16B8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("Utility"));

        objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1EA1C16D0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("Maintenance"));

        -[PLDuetServiceDAS duetService](self, "duetService");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logEntry:", v12);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  objc_autoreleasePoolPop(context);
}

- (void)didReceiveDASTrialEventWithPayload:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[PLDuetServiceDAS didReceiveDASTrialEventWithPayload:].cold.1();

  v6 = (void *)MEMORY[0x1DF0A47AC]();
  +[PLOperator entryKeyForType:andName:](PLDuetService, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("DASTrial"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v4);
  -[PLDuetServiceDAS duetService](self, "duetService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PLDuetServiceDAS duetService](self, "duetService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logEntry:", v8);

  }
  objc_autoreleasePoolPop(v6);

}

- (int64_t)fileProtectionTypeStringToEnum:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ClassA")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ClassB")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ClassC")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (PLService)duetService
{
  return (PLService *)objc_loadWeakRetained((id *)&self->_duetService);
}

- (void)setDuetService:(id)a3
{
  objc_storeWeak((id *)&self->_duetService, a3);
}

- (PLXPCListenerOperatorComposition)dasActivityEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDasActivityEventListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PLXPCListenerOperatorComposition)dasActivityLifecycleEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDasActivityLifecycleEventListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (PLXPCListenerOperatorComposition)dasInfoEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDasInfoEventListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PLXPCListenerOperatorComposition)dasPredictionEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDasPredictionEventListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PLXPCListenerOperatorComposition)dasBudgetEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDasBudgetEventListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLXPCListenerOperatorComposition)dasDataBudgetEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDasDataBudgetEventListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCListenerOperatorComposition)dasEnergyReportEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDasEnergyReportEventListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLXPCListenerOperatorComposition)dasPoliciesBlockingCriteriaEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDasPoliciesBlockingCriteriaEventListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)dasTrialEventListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDasTrialEventListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dasTrialEventListener, 0);
  objc_storeStrong((id *)&self->_dasPoliciesBlockingCriteriaEventListener, 0);
  objc_storeStrong((id *)&self->_dasEnergyReportEventListener, 0);
  objc_storeStrong((id *)&self->_dasDataBudgetEventListener, 0);
  objc_storeStrong((id *)&self->_dasBudgetEventListener, 0);
  objc_storeStrong((id *)&self->_dasPredictionEventListener, 0);
  objc_storeStrong((id *)&self->_dasInfoEventListener, 0);
  objc_storeStrong((id *)&self->_dasActivityLifecycleEventListener, 0);
  objc_storeStrong((id *)&self->_dasActivityEventListener, 0);
  objc_destroyWeak((id *)&self->_duetService);
}

void __48__PLDuetServiceDAS_initOperatorDependanciesDAS___block_invoke_245_cold_1(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "com.apple.perfpowerservices.reportfeaturestatus";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_ERROR, "Failed to post %s : %d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveDASActivityEventWithPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "didReceiveDASActivityEvent: payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveDASActivityLifecycleEventWithPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "didReceiveDASActivityLifecycle payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveDASBudgetEventWithPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "energyBudget payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveDASDataBudgetEventWithPayload:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1DA9D6000, v0, OS_LOG_TYPE_ERROR, "Empty Payload for dataBudget %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveDASDataBudgetEventWithPayload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Received dataBudget payload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveDASReportEventWithPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "energyReport payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveDASPoliciesBlockingCriteriaEventWithPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "DASPoliciesBlockingCriteria payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)didReceiveDASTrialEventWithPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "DASTrial payload=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
