@implementation DiagnosticDataController

- (DiagnosticDataController)init
{
  DiagnosticDataController *v2;
  DiagnosticDataController *v3;
  void *v4;
  void *v5;
  void *v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  void *v10;
  void *v11;
  BOOL value;
  _QWORD handler[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  xpc_connection_t mach_service;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)DiagnosticDataController;
  v2 = -[DiagnosticDataController init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->__state = 0;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("plist"), CFSTR("synced"), CFSTR("ips"), CFSTR("metriclog"), CFSTR("anon"), CFSTR("crash"), CFSTR("session"), CFSTR("log"), CFSTR("gz"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v4, CFSTR("Extensions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    mach_service = xpc_connection_create_mach_service("com.apple.crash_mover", 0, 0);
    v7 = (_xpc_connection_s *)v15[5];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __32__DiagnosticDataController_init__block_invoke;
    handler[3] = &unk_1EA26B6B0;
    handler[4] = &v14;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_resume((xpc_connection_t)v15[5]);
    v8 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v15[5], v6);
    if (MEMORY[0x1DF0AB5FC]() != MEMORY[0x1E0C812F8]
      || (xpc_dictionary_get_value(v8, "Success"), v10 = (void *)objc_claimAutoreleasedReturnValue(), (v11 = v10) == 0)
      || (value = xpc_BOOL_get_value(v10), v11, !value))
    {
      NSLog(CFSTR("crash_mover xpc service failed."));
    }

    _Block_object_dispose(&v14, 8);
  }
  return v3;
}

void __32__DiagnosticDataController_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v6;
  void *v7;

  v4 = MEMORY[0x1DF0AB5FC](a2);
  if (a2 == MEMORY[0x1E0C81258] && v4 == MEMORY[0x1E0C81310])
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
}

- (void)viewDidLoad
{
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DiagnosticDataController;
  -[DiagnosticDataController viewDidLoad](&v16, sel_viewDidLoad);
  PUI_LocalizedStringForProblemReporting(CFSTR("PROBLEM_REPORTING_DATA"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticDataController setTitle:](self, "setTitle:", v3);

  -[DiagnosticDataController table](self, "table");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setDisplaysCellContentStringsOnTapAndHold:", 1);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
  -[DiagnosticDataController setSearchController:](self, "setSearchController:", v5);

  -[DiagnosticDataController searchController](self, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSearchResultsUpdater:", self);

  -[DiagnosticDataController searchController](self, "searchController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObscuresBackgroundDuringPresentation:", 0);

  -[DiagnosticDataController searchController](self, "searchController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutocapitalizationType:", 0);

  -[DiagnosticDataController searchController](self, "searchController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "searchBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setKeyboardType:", 0);

  -[DiagnosticDataController searchController](self, "searchController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "searchBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAutocorrectionType:", 1);

  -[DiagnosticDataController searchController](self, "searchController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DiagnosticDataController navigationItem](self, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSearchController:", v14);

  -[DiagnosticDataController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
}

- (void)_loadDiagnosticsDataWithCompletion:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(33, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__DiagnosticDataController__loadDiagnosticsDataWithCompletion___block_invoke;
  block[3] = &unk_1EA26B718;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __63__DiagnosticDataController__loadDiagnosticsDataWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void (*v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void (*v32)(id *);
  NSObject *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  void (*v40)(id *);
  NSObject *v41;
  void (*DRGetAllLogFileURLsSymbolLoc)(id *);
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  objc_class *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  id v88;
  id v89;
  id obj;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  id v96;
  id v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  id v107;
  id v108;
  id v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  void *v113;
  _BYTE v114[128];
  _BYTE v115[128];
  uint8_t v116[128];
  __int128 buf;
  void *v118;
  void *v119;
  uint64_t *v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  v88 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = (void *)MEMORY[0x1E0C99DE8];
  v110 = 0;
  v111 = &v110;
  v112 = 0x2020000000;
  v3 = (void (*)(_QWORD))getOSAGetSubmittableLogsSymbolLoc_ptr;
  v113 = getOSAGetSubmittableLogsSymbolLoc_ptr;
  if (!getOSAGetSubmittableLogsSymbolLoc_ptr)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v118 = __getOSAGetSubmittableLogsSymbolLoc_block_invoke;
    v119 = &unk_1EA26B260;
    v120 = &v110;
    __getOSAGetSubmittableLogsSymbolLoc_block_invoke((uint64_t)&buf);
    v3 = (void (*)(_QWORD))v111[3];
  }
  _Block_object_dispose(&v110, 8);
  if (!v3)
  {
    __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    goto LABEL_101;
  }
  v71 = a1;
  v3(0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v110 = 0;
  v111 = &v110;
  v112 = 0x2050000000;
  v6 = (void *)getRTCReportingClass_softClass;
  v113 = (void *)getRTCReportingClass_softClass;
  if (!getRTCReportingClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v118 = __getRTCReportingClass_block_invoke;
    v119 = &unk_1EA26B260;
    v120 = &v110;
    __getRTCReportingClass_block_invoke((uint64_t)&buf);
    v6 = (void *)v111[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v110, 8);
  v109 = 0;
  objc_msgSend(v7, "_privacyLogs:", &v109);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v109;
  if (v77)
  {
    _PUILoggingFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v77;
      _os_log_impl(&dword_1DB1FB000, v8, OS_LOG_TYPE_DEFAULT, "RTCReporting log files not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(v5, "addObjectsFromArray:", v80);
  }
  v110 = 0;
  v111 = &v110;
  v112 = 0x2050000000;
  v9 = (void *)getCloudTelemetryReporterClass_softClass;
  v113 = (void *)getCloudTelemetryReporterClass_softClass;
  if (!getCloudTelemetryReporterClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v118 = __getCloudTelemetryReporterClass_block_invoke;
    v119 = &unk_1EA26B260;
    v120 = &v110;
    __getCloudTelemetryReporterClass_block_invoke((uint64_t)&buf);
    v9 = (void *)v111[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v110, 8);
  v108 = 0;
  objc_msgSend(v10, "_privacyLogs:", &v108);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v108;
  if (v76)
  {
    _PUILoggingFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v76;
      _os_log_impl(&dword_1DB1FB000, v11, OS_LOG_TYPE_DEFAULT, "CloudTelemetry log files not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(v5, "addObjectsFromArray:", v79);
  }
  v110 = 0;
  v111 = &v110;
  v112 = 0x2050000000;
  v12 = (void *)getAATransparencyLoggingClass_softClass;
  v113 = (void *)getAATransparencyLoggingClass_softClass;
  if (!getAATransparencyLoggingClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v118 = __getAATransparencyLoggingClass_block_invoke;
    v119 = &unk_1EA26B260;
    v120 = &v110;
    __getAATransparencyLoggingClass_block_invoke((uint64_t)&buf);
    v12 = (void *)v111[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v110, 8);
  v107 = 0;
  objc_msgSend(v13, "logsWithError:", &v107);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v107;
  if (v75)
  {
    _PUILoggingFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v75;
      _os_log_impl(&dword_1DB1FB000, v14, OS_LOG_TYPE_DEFAULT, "AppAnalytics log files not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    objc_msgSend(v5, "addObjectsFromArray:", v78);
  }
  v110 = 0;
  v111 = &v110;
  v112 = 0x2050000000;
  v15 = (void *)get_DPReportFileManagerClass_softClass;
  v113 = (void *)get_DPReportFileManagerClass_softClass;
  if (!get_DPReportFileManagerClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v118 = __get_DPReportFileManagerClass_block_invoke;
    v119 = &unk_1EA26B260;
    v120 = &v110;
    __get_DPReportFileManagerClass_block_invoke((uint64_t)&buf);
    v15 = (void *)v111[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v110, 8);
  objc_msgSend(v16, "submittedReports");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v86);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/sysdiagnose"), 1);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0C99A90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99A90]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v85, v19, 4, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = v20;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v104 != v22)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * i), "absoluteURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v24);

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
    }
    while (v21);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/PerformanceTraces"), 1);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v84, v26, 4, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v89 = v27;
  v28 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v100;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v100 != v29)
          objc_enumerationMutation(v89);
        objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * j), "absoluteURL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v31);

      }
      v28 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v99, v115, 16);
    }
    while (v28);
  }

  v98 = 0;
  v110 = 0;
  v111 = &v110;
  v112 = 0x2020000000;
  v32 = (void (*)(id *))getDESSubmissionLogFileURLsSymbolLoc_ptr;
  v113 = getDESSubmissionLogFileURLsSymbolLoc_ptr;
  if (!getDESSubmissionLogFileURLsSymbolLoc_ptr)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v118 = __getDESSubmissionLogFileURLsSymbolLoc_block_invoke;
    v119 = &unk_1EA26B260;
    v120 = &v110;
    __getDESSubmissionLogFileURLsSymbolLoc_block_invoke((uint64_t)&buf);
    v32 = (void (*)(id *))v111[3];
  }
  _Block_object_dispose(&v110, 8);
  if (!v32)
  {
    __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    goto LABEL_101;
  }
  v32(&v98);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v98;
  if (v74)
  {
    _PUILoggingFacility();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v74;
      _os_log_impl(&dword_1DB1FB000, v33, OS_LOG_TYPE_DEFAULT, "DES Submission Log Files not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  else if (v83)
  {
    objc_msgSend(v5, "addObjectsFromArray:", v83);
  }
  v110 = 0;
  v111 = &v110;
  v112 = 0x2050000000;
  v34 = (void *)getSPMLLoggingClass_softClass;
  v113 = (void *)getSPMLLoggingClass_softClass;
  if (!getSPMLLoggingClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v118 = __getSPMLLoggingClass_block_invoke;
    v119 = &unk_1EA26B260;
    v120 = &v110;
    __getSPMLLoggingClass_block_invoke((uint64_t)&buf);
    v34 = (void *)v111[3];
  }
  v35 = objc_retainAutorelease(v34);
  _Block_object_dispose(&v110, 8);
  v97 = 0;
  objc_msgSend(v35, "submitttedSpotlightReportsError:", &v97);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v97;
  if (v73)
  {
    _PUILoggingFacility();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v73;
      _os_log_impl(&dword_1DB1FB000, v36, OS_LOG_TYPE_DEFAULT, "Search metadata reports not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  else if (v82)
  {
    objc_msgSend(v5, "addObjectsFromArray:", v82);
  }
  v110 = 0;
  v111 = &v110;
  v112 = 0x2050000000;
  v37 = (void *)getPLDiagnosticsClass_softClass;
  v113 = (void *)getPLDiagnosticsClass_softClass;
  if (!getPLDiagnosticsClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v118 = __getPLDiagnosticsClass_block_invoke;
    v119 = &unk_1EA26B260;
    v120 = &v110;
    __getPLDiagnosticsClass_block_invoke((uint64_t)&buf);
    v37 = (void *)v111[3];
  }
  v38 = objc_retainAutorelease(v37);
  _Block_object_dispose(&v110, 8);
  objc_msgSend(v38, "diagnosticsURLs");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v39);

  v96 = 0;
  v110 = 0;
  v111 = &v110;
  v112 = 0x2020000000;
  v40 = (void (*)(id *))getSDRGetAllLogFileURLsSymbolLoc_ptr;
  v113 = getSDRGetAllLogFileURLsSymbolLoc_ptr;
  if (!getSDRGetAllLogFileURLsSymbolLoc_ptr)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v118 = __getSDRGetAllLogFileURLsSymbolLoc_block_invoke;
    v119 = &unk_1EA26B260;
    v120 = &v110;
    __getSDRGetAllLogFileURLsSymbolLoc_block_invoke((uint64_t)&buf);
    v40 = (void (*)(id *))v111[3];
  }
  _Block_object_dispose(&v110, 8);
  if (!v40)
  {
    __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
    goto LABEL_101;
  }
  v40(&v96);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v96;
  if (v72)
  {
    _PUILoggingFacility();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v72;
      _os_log_impl(&dword_1DB1FB000, v41, OS_LOG_TYPE_DEFAULT, "System Diagnostic Reporter logs not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  else if (v81)
  {
    objc_msgSend(v5, "addObjectsFromArray:", v81);
  }
  if (getDRGetAllLogFileURLsSymbolLoc())
  {
    v95 = 0;
    DRGetAllLogFileURLsSymbolLoc = (void (*)(id *))getDRGetAllLogFileURLsSymbolLoc();
    if (DRGetAllLogFileURLsSymbolLoc)
    {
      DRGetAllLogFileURLsSymbolLoc(&v95);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v95;
      if (v44)
      {
        _PUILoggingFacility();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v44;
          _os_log_impl(&dword_1DB1FB000, v45, OS_LOG_TYPE_DEFAULT, "DiagnosticPipeline logs not fetched: Error: %@", (uint8_t *)&buf, 0xCu);
        }

      }
      else if (v43)
      {
        objc_msgSend(v5, "addObjectsFromArray:", v43);
      }

      goto LABEL_78;
    }
    __43__PUIPrivacyController_updateSecurityGroup__block_invoke_3_cold_1();
LABEL_101:
    __break(1u);
  }
LABEL_78:
  if (!objc_msgSend(v5, "count"))
  {
LABEL_95:
    v67 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForProblemReporting(CFSTR("PROBLEM_REPORTING_NO_DATA"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v68, 0, 0, 0, 0, 13, 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setProperty:forKey:", v70, *MEMORY[0x1E0D80808]);

    objc_msgSend(v88, "addObject:", v69);
    goto LABEL_96;
  }
  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_2);
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  v46 = v5;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v91, v114, 16);
  if (!v47)
  {

    goto LABEL_95;
  }
  v48 = 0;
  v49 = *(_QWORD *)v92;
  v87 = *MEMORY[0x1E0D80438];
  do
  {
    for (k = 0; k != v47; ++k)
    {
      if (*(_QWORD *)v92 != v49)
        objc_enumerationMutation(v46);
      v51 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * k);
      objc_msgSend(v51, "URLByStandardizingPath");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "absoluteString");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "hasSuffix:", CFSTR("/"));

      if ((v54 & 1) == 0)
      {
        v55 = (void *)MEMORY[0x1E0D804E8];
        objc_msgSend(v51, "lastPathComponent");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_opt_class();
        objc_msgSend(v55, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v56, 0, 0, 0, v57, 2, objc_opt_class());
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v51, "lastPathComponent");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v57) = objc_msgSend(v59, "hasSuffix:", CFSTR("PLSQL.pll.anon"));

        if ((_DWORD)v57)
        {
          objc_msgSend(v58, "setDetailControllerClass:", objc_opt_class());
          v110 = 0;
          v111 = &v110;
          v112 = 0x2050000000;
          v60 = (void *)getPLDatabaseReaderClass_softClass;
          v113 = (void *)getPLDatabaseReaderClass_softClass;
          if (!getPLDatabaseReaderClass_softClass)
          {
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v118 = __getPLDatabaseReaderClass_block_invoke;
            v119 = &unk_1EA26B260;
            v120 = &v110;
            __getPLDatabaseReaderClass_block_invoke((uint64_t)&buf);
            v60 = (void *)v111[3];
          }
          v61 = objc_retainAutorelease(v60);
          _Block_object_dispose(&v110, 8);
          v62 = [v61 alloc];
          objc_msgSend(v51, "absoluteString");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (void *)objc_msgSend(v62, "initWithDatabaseFile:", v63);

          objc_msgSend(v58, "setProperty:forKey:", v64, CFSTR("powerlogReader"));
          objc_msgSend(v64, "tableNamesFromDatabase");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "setValues:titles:", v65, v65);

        }
        objc_msgSend(v51, "path");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setProperty:forKey:", v66, v87);

        objc_msgSend(v88, "addObject:", v58);
        v48 = 1;
      }
    }
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v91, v114, 16);
  }
  while (v47);

  if ((v48 & 1) == 0)
    goto LABEL_95;
LABEL_96:
  (*(void (**)(void))(*(_QWORD *)(v71 + 32) + 16))();

}

uint64_t __63__DiagnosticDataController__loadDiagnosticsDataWithCompletion___block_invoke_295(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (id)specifiers
{
  unint64_t v3;
  int *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  objc_class *v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;
  id location;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = -[DiagnosticDataController _state](self, "_state");
  v4 = (int *)MEMORY[0x1E0D80590];
  if (!v3)
  {
    -[DiagnosticDataController _allSpecifiers](self, "_allSpecifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_initWeak(&location, self);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __38__DiagnosticDataController_specifiers__block_invoke;
      v15[3] = &unk_1EA26B740;
      objc_copyWeak(&v16, &location);
      -[DiagnosticDataController _loadDiagnosticsDataWithCompletion:](self, "_loadDiagnosticsDataWithCompletion:", v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 15, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v8 = *v4;
    v9 = *(Class *)((char *)&self->super.super.super.super.super.isa + v8);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = v7;

  }
  -[DiagnosticDataController searchController](self, "searchController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isActive") & 1) != 0)
    goto LABEL_8;
  v11 = -[DiagnosticDataController _state](self, "_state") == 1;

  if (v11)
  {
    -[DiagnosticDataController _allSpecifiers](self, "_allSpecifiers");
    v12 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v13 = *v4;
    v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v13);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v13) = v12;
LABEL_8:

  }
  return *(id *)((char *)&self->super.super.super.super.super.isa + *v4);
}

void __38__DiagnosticDataController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__DiagnosticDataController_specifiers__block_invoke_2;
  v5[3] = &unk_1EA26B410;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __38__DiagnosticDataController_specifiers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void (**v5)(_QWORD);
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(WeakRetained, "set_allSpecifiers:", v3);

  objc_msgSend(WeakRetained, "unprotectedSpecifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__DiagnosticDataController_specifiers__block_invoke_3;
  v6[3] = &unk_1EA26B358;
  v6[4] = WeakRetained;
  v5 = (void (**)(_QWORD))MEMORY[0x1DF0AB308](v6);
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(WeakRetained, "removeContiguousSpecifiers:animated:", v4, 1);
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }
  else
  {
    v5[2](v5);
  }

}

uint64_t __38__DiagnosticDataController_specifiers__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_allSpecifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertContiguousSpecifiers:atIndex:animated:", v3, 0, 1);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "_allSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpecifiers:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "set_state:", 1);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(a3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DiagnosticDataController _allSpecifiers](self, "_allSpecifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__DiagnosticDataController_updateSearchResultsForSearchController___block_invoke;
    v9[3] = &unk_1EA26B768;
    v10 = v8;
    v11 = v5;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

    -[DiagnosticDataController setSpecifiers:](self, "setSpecifiers:", v7);
  }
  else
  {
    -[DiagnosticDataController _allSpecifiers](self, "_allSpecifiers");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[DiagnosticDataController setSpecifiers:](self, "setSpecifiers:", v7);
  }

}

void __67__DiagnosticDataController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32));

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (unint64_t)_state
{
  return self->__state;
}

- (void)set_state:(unint64_t)a3
{
  self->__state = a3;
}

- (NSArray)_allSpecifiers
{
  return self->__allSpecifiers;
}

- (void)set_allSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->__allSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allSpecifiers, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end
