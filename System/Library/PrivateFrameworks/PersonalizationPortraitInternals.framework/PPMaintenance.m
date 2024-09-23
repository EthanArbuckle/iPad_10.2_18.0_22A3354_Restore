@implementation PPMaintenance

+ (void)registerMaintenanceTasksInternal
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PPMaintenance_registerMaintenanceTasksInternal__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (registerMaintenanceTasksInternal_onceToken != -1)
    dispatch_once(&registerMaintenanceTasksInternal_onceToken, block);
}

void __49__PPMaintenance_registerMaintenanceTasksInternal__block_invoke()
{
  uint64_t v0;
  xpc_object_t v1;
  const char *v2;
  int64_t v3;
  const char *v4;
  const char *v5;
  NSObject *v6;
  uint64_t v7;
  xpc_object_t v8;
  NSObject *v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  const char **v18;
  xpc_object_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  xpc_object_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  xpc_object_t v30;
  NSObject *v31;
  uint64_t v32;
  xpc_object_t v33;
  const char *v34;
  NSObject *v35;
  uint64_t v36;
  xpc_object_t v37;
  NSObject *v38;
  uint64_t v39;
  xpc_object_t v40;
  NSObject *v41;
  uint64_t v42;
  xpc_object_t v43;
  NSObject *v44;
  xpc_object_t v45;
  NSObject *v46;
  uint64_t v47;
  xpc_object_t v48;
  NSObject *v49;
  uint64_t v50;
  xpc_object_t v51;
  NSObject *v52;
  uint64_t v53;
  xpc_object_t v54;
  NSObject *v55;
  uint64_t v56;
  xpc_object_t v57;
  NSObject *v58;
  uint64_t v59;
  xpc_object_t v60;
  NSObject *v61;
  uint64_t v62;
  xpc_object_t v63;
  NSObject *v64;
  uint64_t v65;
  xpc_object_t v66;
  NSObject *v67;
  uint64_t v68;
  xpc_object_t v69;
  NSObject *v70;
  uint64_t v71;
  const char *v72;
  xpc_object_t v73;
  NSObject *v74;
  uint64_t v75;
  xpc_object_t v76;
  NSObject *v77;
  uint64_t v78;
  xpc_object_t v79;
  NSObject *v80;
  xpc_object_t v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  xpc_object_t v88;
  NSObject *v89;
  uint64_t v90;
  xpc_object_t v91;
  NSObject *v92;
  xpc_object_t v93;
  NSObject *v94;
  uint64_t v95;
  xpc_object_t v96;
  NSObject *v97;
  uint64_t v98;
  xpc_object_t v99;
  NSObject *v100;
  uint64_t v101;
  xpc_object_t v102;
  NSObject *v103;
  uint64_t v104;
  xpc_object_t v105;
  NSObject *v106;
  void *v107;
  uint64_t v108;
  int64_t v109;
  const char *v110;
  int64_t value;
  char *key;
  char *v113;
  char *v114;
  char *string;
  const char *v116;
  id v117;
  uint8_t v118[16];
  uint8_t buf[8];
  uint64_t v120;
  uint64_t (*v121)(uint64_t);
  void *v122;
  uint64_t *v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  char v127;
  uint64_t handler;
  uint64_t v129;
  void (*v130)(uint64_t, void *);
  void *v131;
  char *v132;
  char *v133;

  v0 = objc_opt_self();
  v1 = xpc_dictionary_create(0, 0, 0);
  v2 = (const char *)*MEMORY[0x1E0C807A8];
  v3 = *MEMORY[0x1E0C807B8];
  xpc_dictionary_set_int64(v1, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
  string = (char *)*MEMORY[0x1E0C80880];
  v116 = (const char *)*MEMORY[0x1E0C80878];
  xpc_dictionary_set_string(v1, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  key = (char *)*MEMORY[0x1E0C80738];
  xpc_dictionary_set_BOOL(v1, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v1, (const char *)*MEMORY[0x1E0C808B0], 1);
  v4 = (const char *)*MEMORY[0x1E0C807A0];
  xpc_dictionary_set_string(v1, (const char *)*MEMORY[0x1E0C807A0], "com.apple.proactive.PersonalizationPortrait");
  v5 = (const char *)*MEMORY[0x1E0C80798];
  xpc_dictionary_set_uint64(v1, (const char *)*MEMORY[0x1E0C80798], 1uLL);
  handler = MEMORY[0x1E0C809B0];
  v129 = 3221225472;
  v130 = __43__PPMaintenance__registerCoreRoutineImport__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerCoreRoutineImport;
  v133 = (char *)v0;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.CoreRoutineImport", v1, &handler);
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_INFO, "PPMaintenance: registered task CoreRoutineImport", buf, 2u);
  }

  v7 = objc_opt_self();
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v8, v2, v3);
  xpc_dictionary_set_string(v8, v116, string);
  xpc_dictionary_set_BOOL(v8, key, 0);
  xpc_dictionary_set_string(v8, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v8, v5, 1uLL);
  handler = MEMORY[0x1E0C809B0];
  v129 = 3221225472;
  v130 = __36__PPMaintenance__registerMapsImport__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerMapsImport;
  v133 = (char *)v7;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.MapsImport", v8, &handler);
  pp_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_INFO, "PPMaintenance: registered task MapsImport", buf, 2u);
  }

  v113 = (char *)objc_opt_self();
  v124 = 0;
  v125 = &v124;
  v126 = 0x2020000000;
  v127 = 1;
  v10 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  v120 = 3221225472;
  v121 = __41__PPMaintenance__registerHealthKitImport__block_invoke;
  v122 = &unk_1E7E1F798;
  v123 = &v124;
  v11 = (void (**)(_QWORD))_Block_copy(buf);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);

  pp_maintenance_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(handler) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "HealthKitDataAvailable", ", (uint8_t *)&handler, 2u);
  }

  v11[2](v11);
  pp_maintenance_signpost_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  value = v3;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(handler) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v17, OS_SIGNPOST_INTERVAL_END, v13, "HealthKitDataAvailable", " enableTelemetry=YES ", (uint8_t *)&handler, 2u);
  }

  v18 = (const char **)MEMORY[0x1E0C808A8];
  if (*((_BYTE *)v125 + 24))
  {
    v19 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v19, v2, v3);
    xpc_dictionary_set_string(v19, v116, string);
    xpc_dictionary_set_BOOL(v19, key, 0);
    xpc_dictionary_set_BOOL(v19, *v18, 1);
    xpc_dictionary_set_string(v19, v4, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v19, v5, 1uLL);
    handler = v10;
    v129 = 3221225472;
    v130 = __41__PPMaintenance__registerHealthKitImport__block_invoke_100;
    v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v132 = sel__registerHealthKitImport;
    v133 = v113;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.HealthKitImport", v19, &handler);
    pp_default_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v118 = 0;
      _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_INFO, "PPMaintenance: registered task HealthKitImport", v118, 2u);
    }

  }
  _Block_object_dispose(&v124, 8);
  v21 = objc_opt_self();
  v22 = (void *)MEMORY[0x1E0D81598];
  +[PPMaintenance singletonWarmupQueue]();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "runAsyncOnQueue:afterDelaySeconds:block:", v23, &__block_literal_global_91_15327, 3.0);

  v24 = xpc_dictionary_create(0, 0, 0);
  v25 = MEMORY[0x1E0C809B0];
  xpc_dictionary_set_int64(v24, v2, *MEMORY[0x1E0C807F0]);
  xpc_dictionary_set_string(v24, v116, string);
  xpc_dictionary_set_BOOL(v24, key, 0);
  xpc_dictionary_set_string(v24, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v24, v5, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __40__PPMaintenance__registerEventKitImport__block_invoke_2;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerEventKitImport;
  v133 = (char *)v21;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.EventKitImport", v24, &handler);
  pp_default_log_handle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v26, OS_LOG_TYPE_INFO, "PPMaintenance: registered task EventKitImport", buf, 2u);
  }

  v27 = objc_opt_self();
  v28 = (void *)MEMORY[0x1E0D81598];
  +[PPMaintenance singletonWarmupQueue]();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "runAsyncOnQueue:afterDelaySeconds:block:", v29, &__block_literal_global_104_15311, 3.0);

  v30 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v30, v2, v3);
  xpc_dictionary_set_string(v30, v116, string);
  xpc_dictionary_set_BOOL(v30, key, 0);
  xpc_dictionary_set_string(v30, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v30, v5, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __40__PPMaintenance__registerContactsImport__block_invoke_2;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerContactsImport;
  v133 = (char *)v27;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.ContactsImport", v30, &handler);
  pp_default_log_handle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v31, OS_LOG_TYPE_INFO, "PPMaintenance: registered task ContactsImport", buf, 2u);
  }

  v32 = objc_opt_self();
  v33 = xpc_dictionary_create(0, 0, 0);
  v114 = (char *)v2;
  xpc_dictionary_set_int64(v33, v2, v3);
  xpc_dictionary_set_string(v33, v116, string);
  xpc_dictionary_set_BOOL(v33, key, 0);
  xpc_dictionary_set_string(v33, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v33, v5, 1uLL);
  v34 = (const char *)*MEMORY[0x1E0C80758];
  xpc_dictionary_set_BOOL(v33, (const char *)*MEMORY[0x1E0C80758], 1);
  handler = v25;
  v129 = 3221225472;
  v130 = __37__PPMaintenance__registerTopicImport__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerTopicImport;
  v133 = (char *)v32;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.TopicImport", v33, &handler);
  pp_default_log_handle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v35, OS_LOG_TYPE_INFO, "PPMaintenance: registered task TopicImport", buf, 2u);
  }

  v36 = objc_opt_self();
  v37 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v37, v2, v3);
  xpc_dictionary_set_string(v37, v116, string);
  xpc_dictionary_set_BOOL(v37, key, 0);
  xpc_dictionary_set_string(v37, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v37, v5, 1uLL);
  xpc_dictionary_set_BOOL(v37, v34, 1);
  handler = v25;
  v129 = 3221225472;
  v130 = __43__PPMaintenance__registerNamedEntityImport__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerNamedEntityImport;
  v133 = (char *)v36;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.NamedEntityImport", v37, &handler);
  pp_default_log_handle();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v38, OS_LOG_TYPE_INFO, "PPMaintenance: registered task NamedEntityImport", buf, 2u);
  }

  v39 = objc_opt_self();
  v40 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v40, v2, v3);
  xpc_dictionary_set_string(v40, v116, string);
  xpc_dictionary_set_BOOL(v40, key, 0);
  xpc_dictionary_set_string(v40, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v40, v5, 1uLL);
  xpc_dictionary_set_BOOL(v40, v34, 1);
  handler = v25;
  v129 = 3221225472;
  v130 = __46__PPMaintenance__registerTopicRepairAndExport__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerTopicRepairAndExport;
  v133 = (char *)v39;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.TopicRepairAndExport", v40, &handler);
  pp_default_log_handle();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v41, OS_LOG_TYPE_INFO, "PPMaintenance: registered task TopicRepairAndExport", buf, 2u);
  }

  v42 = objc_opt_self();
  v43 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v43, v2, v3);
  xpc_dictionary_set_string(v43, v116, string);
  xpc_dictionary_set_BOOL(v43, key, 0);
  xpc_dictionary_set_string(v43, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v43, v5, 1uLL);
  xpc_dictionary_set_BOOL(v43, v34, 1);
  handler = v25;
  v129 = 3221225472;
  v130 = __52__PPMaintenance__registerNamedEntityRepairAndExport__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerNamedEntityRepairAndExport;
  v133 = (char *)v42;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.NamedEntityRepairAndExport", v43, &handler);
  pp_default_log_handle();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v44, OS_LOG_TYPE_INFO, "PPMaintenance: registered task NamedEntityRepairAndExport", buf, 2u);
  }

  objc_opt_self();
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isAudioAccessory") & 1) == 0)
  {
    v45 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v45, v2, v3);
    xpc_dictionary_set_string(v45, v116, string);
    xpc_dictionary_set_BOOL(v45, key, 0);
    xpc_dictionary_set_string(v45, v4, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v45, v5, 1uLL);
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.RTCSendLogs", v45, &__block_literal_global_144_15295);
    pp_default_log_handle();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      LOWORD(handler) = 0;
      _os_log_impl(&dword_1C392E000, v46, OS_LOG_TYPE_INFO, "PPMaintenance: registered task RTCSendLogs", (uint8_t *)&handler, 2u);
    }

  }
  v47 = objc_opt_self();
  v48 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v48, v2, v3);
  xpc_dictionary_set_string(v48, v116, string);
  xpc_dictionary_set_BOOL(v48, key, 0);
  xpc_dictionary_set_string(v48, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v48, v5, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __45__PPMaintenance__registerDailyMetricsLogging__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = (char *)v47;
  v133 = sel__registerDailyMetricsLogging;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.DailyMetricsLogging", v48, &handler);
  pp_default_log_handle();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v49, OS_LOG_TYPE_INFO, "PPMaintenance: registered task DailyMetricsLogging", buf, 2u);
  }

  v50 = objc_opt_self();
  v51 = xpc_dictionary_create(0, 0, 0);
  v109 = *MEMORY[0x1E0C807E8];
  xpc_dictionary_set_int64(v51, v2, *MEMORY[0x1E0C807E8]);
  xpc_dictionary_set_string(v51, v116, string);
  xpc_dictionary_set_BOOL(v51, key, 0);
  xpc_dictionary_set_string(v51, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v51, v5, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __51__PPMaintenance__registerLogNamedEntityFirstSource__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerLogNamedEntityFirstSource;
  v133 = (char *)v50;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LogNamedEntityFirstSource", v51, &handler);
  pp_default_log_handle();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v52, OS_LOG_TYPE_INFO, "PPMaintenance: registered task LogNamedEntityFirstSource", buf, 2u);
  }

  v53 = objc_opt_self();
  v54 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v54, v2, v109);
  xpc_dictionary_set_string(v54, v116, string);
  xpc_dictionary_set_BOOL(v54, key, 0);
  xpc_dictionary_set_string(v54, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v54, v5, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __45__PPMaintenance__registerLogTopicFirstSource__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerLogTopicFirstSource;
  v133 = (char *)v53;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LogTopicFirstSource", v54, &handler);
  pp_default_log_handle();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v55, OS_LOG_TYPE_INFO, "PPMaintenance: registered task LogTopicFirstSource", buf, 2u);
  }

  v56 = objc_opt_self();
  v57 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v57, v2, v3);
  xpc_dictionary_set_string(v57, v116, string);
  xpc_dictionary_set_BOOL(v57, key, 0);
  xpc_dictionary_set_string(v57, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v57, v5, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerLogNamedEntityPerplexity;
  v133 = (char *)v56;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LogNamedEntityPerplexity", v57, &handler);
  pp_default_log_handle();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v58, OS_LOG_TYPE_INFO, "PPMaintenance: registered task LogNamedEntityPerplexity", buf, 2u);
  }

  v59 = objc_opt_self();
  v60 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v60, v2, v3);
  xpc_dictionary_set_string(v60, v116, string);
  xpc_dictionary_set_BOOL(v60, key, 0);
  xpc_dictionary_set_string(v60, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v60, v5, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __44__PPMaintenance__registerLogTopicPerplexity__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerLogTopicPerplexity;
  v133 = (char *)v59;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LogTopicPerplexity", v60, &handler);
  pp_default_log_handle();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v61, OS_LOG_TYPE_INFO, "PPMaintenance: registered task LogTopicPerplexity", buf, 2u);
  }

  v62 = objc_opt_self();
  v63 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v63, v2, v3);
  xpc_dictionary_set_string(v63, v116, string);
  xpc_dictionary_set_BOOL(v63, key, 0);
  xpc_dictionary_set_string(v63, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v63, v5, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __47__PPMaintenance__registerLogLocationPerplexity__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerLogLocationPerplexity;
  v133 = (char *)v62;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LogLocationPerplexity", v63, &handler);
  pp_default_log_handle();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v64, OS_LOG_TYPE_INFO, "PPMaintenance: registered task LogLocationPerplexity", buf, 2u);
  }

  v65 = objc_opt_self();
  v66 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v66, v2, v3);
  xpc_dictionary_set_string(v66, v116, string);
  xpc_dictionary_set_BOOL(v66, key, 0);
  xpc_dictionary_set_BOOL(v66, (const char *)*MEMORY[0x1E0C808C8], 1);
  xpc_dictionary_set_string(v66, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v66, v5, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __44__PPMaintenance__registerLogSportsFavorites__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = (char *)v65;
  v133 = sel__registerLogSportsFavorites;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.LogSportsFavorites", v66, &handler);
  pp_default_log_handle();
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v67, OS_LOG_TYPE_INFO, "PPMaintenance: registered task LogSportsFavorites", buf, 2u);
  }

  +[PPSocialHighlightMetrics registerCTSDataCollection](PPSocialHighlightMetrics, "registerCTSDataCollection");
  v68 = objc_opt_self();
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isAudioAccessory") & 1) == 0)
  {
    v69 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v69, v2, v3);
    xpc_dictionary_set_string(v69, v116, string);
    xpc_dictionary_set_BOOL(v69, key, 0);
    xpc_dictionary_set_string(v69, v4, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v69, v5, 1uLL);
    handler = v25;
    v129 = 3221225472;
    v130 = __49__PPMaintenance__registerTTLBasedDonationCleanup__block_invoke;
    v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v132 = sel__registerTTLBasedDonationCleanup;
    v133 = (char *)v68;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.TTLBasedDonationCleanup", v69, &handler);
    pp_default_log_handle();
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v70, OS_LOG_TYPE_INFO, "PPMaintenance: registered task TTLBasedDonationCleanup", buf, 2u);
    }

  }
  v71 = objc_opt_self();
  v72 = v116;
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isAudioAccessory") & 1) == 0)
  {
    v73 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v73, v2, v3);
    xpc_dictionary_set_string(v73, v116, string);
    xpc_dictionary_set_BOOL(v73, key, 0);
    xpc_dictionary_set_string(v73, v4, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v73, v5, 1uLL);
    handler = v25;
    v129 = 3221225472;
    v130 = __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke;
    v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v132 = sel__registerRemotelyDonatedRecordCleanup;
    v133 = (char *)v71;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.RemotelyDonatedRecordCleanup", v73, &handler);
    pp_default_log_handle();
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v74, OS_LOG_TYPE_INFO, "PPMaintenance: registered task RemotelyDonatedRecordCleanup", buf, 2u);
    }

    v72 = v116;
  }
  v75 = objc_opt_self();
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isAudioAccessory") & 1) == 0)
  {
    v76 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v76, v72, string);
    xpc_dictionary_set_int64(v76, v2, v3);
    xpc_dictionary_set_BOOL(v76, key, 0);
    xpc_dictionary_set_string(v76, v4, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v76, v5, 1uLL);
    handler = v25;
    v129 = 3221225472;
    v130 = __62__PPMaintenance__registerTTLBasedDecayedFeedbackCountsCleanup__block_invoke;
    v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v132 = sel__registerTTLBasedDecayedFeedbackCountsCleanup;
    v133 = (char *)v75;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.TTLBasedFeedbackRecordCleanup", v76, &handler);
    pp_default_log_handle();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v77, OS_LOG_TYPE_INFO, "PPMaintenance: registered task TTLBasedFeedbackRecordCleanup", buf, 2u);
    }

  }
  v78 = objc_opt_self();
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isAudioAccessory") & 1) == 0)
  {
    v79 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v79, v116, string);
    xpc_dictionary_set_int64(v79, v2, v3);
    xpc_dictionary_set_BOOL(v79, key, 0);
    xpc_dictionary_set_string(v79, v4, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v79, v5, 1uLL);
    handler = v25;
    v129 = 3221225472;
    v130 = __54__PPMaintenance__registerDecayedFeedbackCountsCleanup__block_invoke;
    v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v132 = sel__registerDecayedFeedbackCountsCleanup;
    v133 = (char *)v78;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.DecayedFeedbackCleanup", v79, &handler);
    pp_default_log_handle();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v80, OS_LOG_TYPE_INFO, "PPMaintenance: registered task DecayedFeedbackCleanup", buf, 2u);
    }

  }
  v108 = objc_opt_self();
  v81 = xpc_dictionary_create(0, 0, 0);
  v82 = v2;
  xpc_dictionary_set_int64(v81, v2, v3);
  v84 = string;
  v83 = v116;
  xpc_dictionary_set_string(v81, v116, string);
  v85 = key;
  xpc_dictionary_set_BOOL(v81, key, 0);
  xpc_dictionary_set_string(v81, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v81, v5, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __46__PPMaintenance__registerNamedEntityFiltering__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v86 = v5;
  v132 = sel__registerNamedEntityFiltering;
  v133 = (char *)v108;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.NamedEntityFiltering", v81, &handler);

  v87 = objc_opt_self();
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isAudioAccessory") & 1) == 0)
  {
    v88 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v88, v114, v109);
    xpc_dictionary_set_string(v88, v116, string);
    xpc_dictionary_set_BOOL(v88, key, 0);
    xpc_dictionary_set_BOOL(v88, (const char *)*MEMORY[0x1E0C808A8], 1);
    xpc_dictionary_set_string(v88, v4, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v88, v5, 1uLL);
    handler = v25;
    v129 = 3221225472;
    v130 = __40__PPMaintenance__registerDatabaseVacuum__block_invoke;
    v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v132 = sel__registerDatabaseVacuum;
    v133 = (char *)v87;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.VacuumDatabase", v88, &handler);
    pp_default_log_handle();
    v89 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v89, OS_LOG_TYPE_INFO, "PPMaintenance: registered task VacuumDatabase", buf, 2u);
    }

    v85 = key;
    v82 = v114;
    v86 = v5;
    v84 = string;
    v83 = v116;
  }
  v90 = objc_opt_self();
  v91 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v91, v82, value);
  xpc_dictionary_set_string(v91, v83, v84);
  xpc_dictionary_set_BOOL(v91, v85, 0);
  xpc_dictionary_set_string(v91, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v91, v86, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerSocialHighlightFeedbackCleanUp;
  v133 = (char *)v90;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.SocialHighlightFeedbackCleanUp", v91, &handler);
  pp_default_log_handle();
  v92 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v92, OS_LOG_TYPE_INFO, "PPMaintenance: registered task SocialHighlightCleanUp", buf, 2u);
  }

  objc_opt_self();
  v93 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v93, v82, value);
  xpc_dictionary_set_string(v93, v116, v84);
  xpc_dictionary_set_BOOL(v93, key, 1);
  xpc_dictionary_set_string(v93, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v93, v5, 1uLL);
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.SpotlightScoringCache", v93, &__block_literal_global_358);
  pp_default_log_handle();
  v94 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
  {
    LOWORD(handler) = 0;
    _os_log_impl(&dword_1C392E000, v94, OS_LOG_TYPE_INFO, "PPMaintenance: registered task SpotlightScoringCache", (uint8_t *)&handler, 2u);
  }

  v95 = objc_opt_self();
  v96 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v96, v114, value);
  xpc_dictionary_set_string(v96, v116, string);
  xpc_dictionary_set_BOOL(v96, key, 0);
  v110 = (const char *)*MEMORY[0x1E0C808A8];
  xpc_dictionary_set_BOOL(v96, (const char *)*MEMORY[0x1E0C808A8], 1);
  xpc_dictionary_set_string(v96, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v96, v5, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __45__PPMaintenance__registerContactHandlesCache__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerContactHandlesCache;
  v133 = (char *)v95;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.ContactHandlesCache", v96, &handler);
  pp_default_log_handle();
  v97 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v97, OS_LOG_TYPE_INFO, "PPMaintenance: registered task ContactHandlesCache", buf, 2u);
  }

  v98 = objc_opt_self();
  v99 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v99, v116, string);
  xpc_dictionary_set_int64(v99, v114, value);
  xpc_dictionary_set_BOOL(v99, key, 0);
  xpc_dictionary_set_string(v99, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v99, v5, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __48__PPMaintenance__registerProcessPendingFeedback__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = (char *)v98;
  v133 = sel__registerProcessPendingFeedback;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.FeedbackProcessing", v99, &handler);
  pp_default_log_handle();
  v100 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v100, OS_LOG_TYPE_INFO, "PPMaintenance: registered task FeedbackProcessing", buf, 2u);
  }

  v101 = objc_opt_self();
  v102 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v102, v116, string);
  xpc_dictionary_set_int64(v102, v114, value);
  xpc_dictionary_set_BOOL(v102, key, 0);
  xpc_dictionary_set_string(v102, v4, "com.apple.proactive.PersonalizationPortrait");
  xpc_dictionary_set_uint64(v102, v5, 1uLL);
  handler = v25;
  v129 = 3221225472;
  v130 = __52__PPMaintenance__registerDecayedFeedbackCountsDecay__block_invoke;
  v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
  v132 = sel__registerDecayedFeedbackCountsDecay;
  v133 = (char *)v101;
  xpc_activity_register("com.apple.proactive.PersonalizationPortrait.DecayedFeedbackCountsDecay", v102, &handler);
  pp_default_log_handle();
  v103 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v103, OS_LOG_TYPE_INFO, "PPMaintenance: registered task DecayedFeedbackCountsDecay", buf, 2u);
  }

  objc_opt_self();
  if (_registerNowPlayingMPRequestResponseController_onceToken != -1)
    dispatch_once(&_registerNowPlayingMPRequestResponseController_onceToken, &__block_literal_global_141);
  v104 = objc_opt_self();
  if ((objc_msgSend(MEMORY[0x1E0D81588], "isAudioAccessory") & 1) == 0)
  {
    v105 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v105, v114, value);
    xpc_dictionary_set_string(v105, v116, string);
    xpc_dictionary_set_BOOL(v105, key, 0);
    xpc_dictionary_set_BOOL(v105, v110, 1);
    xpc_dictionary_set_string(v105, v4, "com.apple.proactive.PersonalizationPortrait");
    xpc_dictionary_set_uint64(v105, v5, 1uLL);
    handler = v25;
    v129 = 3221225472;
    v130 = __42__PPMaintenance__registerOptimizeDatabase__block_invoke;
    v131 = &__block_descriptor_48_e33_v16__0__NSObject_OS_xpc_object__8l;
    v132 = sel__registerOptimizeDatabase;
    v133 = (char *)v104;
    xpc_activity_register("com.apple.proactive.PersonalizationPortrait.OptimizeDatabase", v105, &handler);
    pp_default_log_handle();
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v106, OS_LOG_TYPE_INFO, "PPMaintenance: registered task OptimizeDatabase", buf, 2u);
    }

  }
  objc_opt_self();
  xpc_activity_unregister("com.apple.proactive.PersonalizationPortrait.SocialHighlightFeedbackSync");
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "registerDisabledBundleIdPurgeHandler");

  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v117 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "registerCloudKitDisabledBundleIdRewriteHandler");

}

void __42__PPMaintenance__registerOptimizeDatabase__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__PPMaintenance__registerOptimizeDatabase__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __42__PPMaintenance__registerOptimizeDatabase__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "OptimizeDatabase", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "OptimizeDatabase", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 337, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: OptimizeDatabase: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __42__PPMaintenance__registerOptimizeDatabase__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __42__PPMaintenance__registerOptimizeDatabase__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  uint8_t buf[2];

  +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    pp_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "OptimizeDatabase failed to create database, giving up.";
      v6 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v2, "optimizeDatabaseWithShouldContinueBlock:", *(_QWORD *)(a1 + 32)))
  {
    pp_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 0;
      v5 = "OptimizeDatabase completed successfully.";
      v6 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

}

void __63__PPMaintenance__registerNowPlayingMPRequestResponseController__block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  uint8_t v3[16];

  v0 = objc_opt_new();
  v1 = (void *)_registerNowPlayingMPRequestResponseController_delegate;
  _registerNowPlayingMPRequestResponseController_delegate = v0;

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEBUG, "PPMediaPlayerDelegate: _registerNowPlayingMPRequestResponseController was called!", v3, 2u);
  }

}

void __52__PPMaintenance__registerDecayedFeedbackCountsDecay__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PPMaintenance__registerDecayedFeedbackCountsDecay__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __52__PPMaintenance__registerDecayedFeedbackCountsDecay__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "DecayedFeedbackCountsDecay", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "DecayedFeedbackCountsDecay", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 1234, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: DecayedFeedbackCountsDecay: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __52__PPMaintenance__registerDecayedFeedbackCountsDecay__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __52__PPMaintenance__registerDecayedFeedbackCountsDecay__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  char v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  char v32;
  NSObject *v33;
  NSObject *v34;
  uint8_t v35[16];

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: DecayedFeedbackCountsDecay: starting", v35, 2u);
  }

  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decayedFeedbackCountsHalfLifeDays");
  v5 = v4;

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    pp_default_log_handle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "DecayedFeedbackCountsDecay initializing topic store", v35, 2u);
    }

    +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "DecayedFeedbackCountsDecay initializing named entity store", v35, 2u);
    }

    +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    pp_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "DecayedFeedbackCountsDecay initializing location store", v35, 2u);
    }

    +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = 0.693147181 / v5;
  objc_msgSend(v7, "storage");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    if (v15)
    {
      pp_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Running DecayedFeedbackCountsDecay for topic feedback counts", v35, 2u);
      }

      objc_msgSend(v7, "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "decayFeedbackCountsWithDecayRate:shouldContinueBlock:", *(_QWORD *)(a1 + 32), v12);

      if ((v18 & 1) == 0)
      {
        pp_default_log_handle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v35 = 0;
          _os_log_error_impl(&dword_1C392E000, v19, OS_LOG_TYPE_ERROR, "PPMaintenance DecayedFeedbackCountsDecay failed for topic feedback", v35, 2u);
        }

      }
    }
  }
  objc_msgSend(v9, "storage");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = (void *)v20;
    v22 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    if (v22)
    {
      pp_default_log_handle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1C392E000, v23, OS_LOG_TYPE_DEFAULT, "Running DecayedFeedbackCountsDecay for named entity feedback counts", v35, 2u);
      }

      objc_msgSend(v9, "storage");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "decayFeedbackCountsWithDecayRate:shouldContinueBlock:", *(_QWORD *)(a1 + 32), v12);

      if ((v25 & 1) == 0)
      {
        pp_default_log_handle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v35 = 0;
          _os_log_error_impl(&dword_1C392E000, v26, OS_LOG_TYPE_ERROR, "PPMaintenance DecayedFeedbackCountsDecay failed for named entity feedback", v35, 2u);
        }

      }
    }
  }
  objc_msgSend(v11, "storage");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    v29 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    if (v29)
    {
      pp_default_log_handle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1C392E000, v30, OS_LOG_TYPE_DEFAULT, "Running DecayedFeedbackCountsDecay for location feedback counts", v35, 2u);
      }

      objc_msgSend(v11, "storage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "decayFeedbackCountsWithDecayRate:shouldContinueBlock:", *(_QWORD *)(a1 + 32), v12);

      if ((v32 & 1) == 0)
      {
        pp_default_log_handle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v35 = 0;
          _os_log_error_impl(&dword_1C392E000, v33, OS_LOG_TYPE_ERROR, "PPMaintenance DecayedFeedbackCountsDecay failed for location feedback", v35, 2u);
        }

      }
    }
  }
  pp_default_log_handle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_1C392E000, v34, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: DecayedFeedbackCountsDecay: finished", v35, 2u);
  }

}

void __48__PPMaintenance__registerProcessPendingFeedback__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t (**v10)(_QWORD);
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  char v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  const char **v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __48__PPMaintenance__registerProcessPendingFeedback__block_invoke_2;
  v33 = &unk_1E7E1B288;
  v35 = &v36;
  v4 = v3;
  v34 = v4;
  v5 = _Block_copy(&v30);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FeedbackProcessing", ", buf, 2u);
  }

  v10 = v5;
  objc_opt_self();
  v11 = (void *)objc_opt_new();
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance", v30, v31, v32, v33);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "portraitAnalyticsSamplingRate");
  v40 = 0;
  v13 = objc_msgSend(v11, "constructAndSendMessageForSamplingRate:shouldContinueBlock:error:", v10, &v40);
  v14 = v40;
  v41 = v14;

  if ((v13 & 1) == 0)
  {
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v14;
      _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "PPCollaborativeFilteringSampler: failed to complete: %@", buf, 0xCu);
    }

  }
  if ((v10[2](v10) & 1) == 0)
  {
    pp_default_log_handle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "Processing feedback deferred after data collection.";
      goto LABEL_22;
    }
LABEL_23:

    goto LABEL_24;
  }
  v16 = (void *)objc_opt_new();
  v17 = objc_msgSend(v16, "processPendingFeedbackWithShouldContinueBlock:error:", v10, &v41);

  if ((v17 & 1) == 0)
  {
    pp_default_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v41;
      _os_log_error_impl(&dword_1C392E000, v18, OS_LOG_TYPE_ERROR, "Feedback processing failed: %@", buf, 0xCu);
    }

  }
  if ((v10[2](v10) & 1) == 0)
  {
    pp_default_log_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEFAULT, "Processing feedback deferred partway through processing.", buf, 2u);
    }

  }
  v20 = (void *)objc_opt_new();
  v21 = objc_msgSend(v20, "deleteExpiredFeedbackWithShouldContinueBlock:", v10);

  if ((v21 & 1) == 0)
  {
    pp_default_log_handle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "Processing pending feedback deferred during clean up operations.";
LABEL_22:
      _os_log_impl(&dword_1C392E000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
LABEL_24:

  pp_maintenance_signpost_handle();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    v26 = *((unsigned __int8 *)v37 + 24);
    *(_DWORD *)buf = 67109120;
    LODWORD(v43) = v26;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v25, OS_SIGNPOST_INTERVAL_END, v7, "FeedbackProcessing", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v37 + 24))
    v27 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v27 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v27);

  if (*((_BYTE *)v37 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPMaintenance.m"), 1150, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: FeedbackProcessing: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v36, 8);

}

uint64_t __48__PPMaintenance__registerProcessPendingFeedback__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __45__PPMaintenance__registerContactHandlesCache__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PPMaintenance__registerContactHandlesCache__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __45__PPMaintenance__registerContactHandlesCache__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ContactHandlesCache", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "ContactHandlesCache", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 292, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: ContactHandlesCache: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __45__PPMaintenance__registerContactHandlesCache__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __45__PPMaintenance__registerContactHandlesCache__block_invoke_3(uint64_t a1)
{
  id v2;

  +[PPLocalContactStore defaultStore](PPLocalContactStore, "defaultStore");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rebuildCachedSignificantContactHandlesWithShouldContinue:", *(_QWORD *)(a1 + 32));

}

void __47__PPMaintenance__registerSpotlightScoringCache__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  const char **v13;
  _QWORD v14[5];
  uint8_t buf[16];
  _QWORD aBlock[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v2 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v3 = MEMORY[0x1E0C809B0];
  v22 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PPMaintenance__registerSpotlightScoringCache__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v18 = &v19;
  v4 = v2;
  v17 = v4;
  v5 = _Block_copy(aBlock);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SpotlightScoringCache", ", buf, 2u);
  }

  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __47__PPMaintenance__registerSpotlightScoringCache__block_invoke_359;
  v14[3] = &unk_1E7E1B2B0;
  v10 = v5;
  v14[4] = v10;
  __47__PPMaintenance__registerSpotlightScoringCache__block_invoke_359((uint64_t)v14);
  pp_maintenance_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_END, v7, "SpotlightScoringCache", " enableTelemetry=YES ", buf, 2u);
  }

  if (*((_BYTE *)v20 + 24))
    v13 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v13 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v13);

  _Block_object_dispose(&v19, 8);
}

uint64_t __47__PPMaintenance__registerSpotlightScoringCache__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __47__PPMaintenance__registerSpotlightScoringCache__block_invoke_359(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
    pp_default_log_handle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_INFO, "Deferred topic scores", buf, 2u);
    }

  }
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  v5 = objc_msgSend(v3, "computeAndCacheTopicScoresWithShouldContinueBlock:error:", v4, &v13);
  v6 = v13;

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = &stru_1E7E221D0;
      if (!v6)
        v11 = 0;
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "PPMaintenance was unable to compute and cache topic scores: %@", buf, 0xCu);
    }

    +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    objc_msgSend(v9, "clearTopicScoresCache:", &v12);
    v10 = v12;

  }
}

void __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SocialHighlightCleanUp", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "SocialHighlightCleanUp", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 769, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPMaintenance: SocialHighlightCleanUp: deferred.", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_opt_new();
  v2 = *(_QWORD *)(a1 + 32);
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "socialHighlightFeedbackDeletionInterval");
  objc_msgSend(v4, "cleanUpFeedbackWithShouldContinueBlock:ttl:onDeleteBlock:", v2, &__block_literal_global_120_15097);

}

void __56__PPMaintenance__registerSocialHighlightFeedbackCleanUp__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[PPSocialHighlightMetrics logMetricsForExpiringFeedback:](PPSocialHighlightMetrics, "logMetricsForExpiringFeedback:", v2);
  pp_social_highlights_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v2, "highlight");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "highlightIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_INFO, "PPMaintenance: removed feedback for identifier %@", (uint8_t *)&v6, 0xCu);

  }
}

void __40__PPMaintenance__registerDatabaseVacuum__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PPMaintenance__registerDatabaseVacuum__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __40__PPMaintenance__registerDatabaseVacuum__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VacuumDatabase", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "VacuumDatabase", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 383, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: VacuumDatabase: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __40__PPMaintenance__registerDatabaseVacuum__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __40__PPMaintenance__registerDatabaseVacuum__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  uint8_t buf[2];

  +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    pp_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v5 = "Vacuum database failed to create database, giving up.";
      v6 = buf;
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v2, "vacuumDatabaseWithShouldContinueBlock:", *(_QWORD *)(a1 + 32)))
  {
    pp_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 0;
      v5 = "Vacuum database completed successfully.";
      v6 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

}

void __46__PPMaintenance__registerNamedEntityFiltering__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PPMaintenance__registerNamedEntityFiltering__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __46__PPMaintenance__registerNamedEntityFiltering__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "NamedEntityFiltering", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "NamedEntityFiltering", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 669, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring named entity filtering.", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __46__PPMaintenance__registerNamedEntityFiltering__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __46__PPMaintenance__registerNamedEntityFiltering__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "PPMaintenance: beginning named entity filtering.", buf, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "filterExistingNamedEntitiesWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));

  if ((v4 & 1) == 0)
  {
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_INFO, "PPMaintenance: unable to successfully complete named entity filtering.", v6, 2u);
    }

  }
}

void __54__PPMaintenance__registerDecayedFeedbackCountsCleanup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t *v23;
  _QWORD aBlock[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v30 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PPMaintenance__registerDecayedFeedbackCountsCleanup__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v26 = &v27;
  v5 = v3;
  v25 = v5;
  v18 = v4;
  v19 = 3221225472;
  v20 = __54__PPMaintenance__registerDecayedFeedbackCountsCleanup__block_invoke_3;
  v21 = &unk_1E7E1B2F8;
  v6 = _Block_copy(aBlock);
  v22 = v6;
  v23 = &v27;
  v7 = (void (**)(_QWORD))_Block_copy(&v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "DecayedFeedbackCleanup", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v28 + 24);
    *(_DWORD *)buf = 67109120;
    v32 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "DecayedFeedbackCleanup", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v28 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v28 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v18, v19, v20, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 1423, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: DecayedFeedbackCleanup: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v27, 8);

}

uint64_t __54__PPMaintenance__registerDecayedFeedbackCountsCleanup__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __54__PPMaintenance__registerDecayedFeedbackCountsCleanup__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint8_t v21[16];
  uint8_t buf[15];
  char v23;

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: DecayedFeedbackCleanup: starting", buf, 2u);
  }

  pp_default_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "Performing topic feedback cleanup", buf, 2u);
  }

  v23 = 0;
  *(_QWORD *)buf = 0;
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = 30;
  while ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    if ((objc_msgSend(v4, "pruneOrphanedTopicFeedbackCountsWithLimit:rowOffset:deletedCount:isComplete:", 100, v5, buf, &v23) & 1) == 0)
    {
      pp_default_log_handle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "PPMaintenance failed while cleaning up topic feedback", v21, 2u);
      }

      break;
    }
    if (!v23)
    {
      v5 = v5 - *(_QWORD *)buf + 100;
      if (--v6)
        continue;
    }
    break;
  }
  pp_default_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "Finished topic feedback cleanup", v21, 2u);
  }

  pp_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "Running location feedback cleanup", buf, 2u);
  }

  v23 = 0;
  *(_QWORD *)buf = 0;
  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 30;
  while ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    if ((objc_msgSend(v10, "pruneOrphanedLocationFeedbackCountsWithLimit:rowOffset:deletedCount:isComplete:", 100, v11, buf, &v23) & 1) == 0)
    {
      pp_default_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_error_impl(&dword_1C392E000, v13, OS_LOG_TYPE_ERROR, "PPMaintenance failed while cleaning up location feedback", v21, 2u);
      }

      break;
    }
    if (!v23)
    {
      v11 = v11 - *(_QWORD *)buf + 100;
      if (--v12)
        continue;
    }
    break;
  }
  pp_default_log_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "Finished location feedback cleanup", v21, 2u);
  }

  pp_default_log_handle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "Running named entity feedback cleanup", buf, 2u);
  }

  v23 = 0;
  *(_QWORD *)buf = 0;
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = 30;
  while ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    if ((objc_msgSend(v16, "pruneOrphanedNamedEntityFeedbackCountsWithLimit:rowOffset:deletedCount:isComplete:", 100, v17, buf, &v23) & 1) == 0)
    {
      pp_default_log_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_error_impl(&dword_1C392E000, v19, OS_LOG_TYPE_ERROR, "PPMaintenance failed while cleaning up named entity feedback", v21, 2u);
      }

      break;
    }
    if (!v23)
    {
      v17 = v17 - *(_QWORD *)buf + 100;
      if (--v18)
        continue;
    }
    break;
  }

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    pp_default_log_handle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, "Finished named entity feedback cleanup", buf, 2u);
    }

  }
}

void __62__PPMaintenance__registerTTLBasedDecayedFeedbackCountsCleanup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t *v23;
  _QWORD aBlock[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v30 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__PPMaintenance__registerTTLBasedDecayedFeedbackCountsCleanup__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v26 = &v27;
  v5 = v3;
  v25 = v5;
  v18 = v4;
  v19 = 3221225472;
  v20 = __62__PPMaintenance__registerTTLBasedDecayedFeedbackCountsCleanup__block_invoke_3;
  v21 = &unk_1E7E1B2F8;
  v6 = _Block_copy(aBlock);
  v22 = v6;
  v23 = &v27;
  v7 = (void (**)(_QWORD))_Block_copy(&v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "TTLBasedFeedbackRecordCleanup", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v28 + 24);
    *(_DWORD *)buf = 67109120;
    v32 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "TTLBasedFeedbackRecordCleanup", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v28 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v28 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v18, v19, v20, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 1314, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TTLBasedFeedbackRecordCleanup: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v27, 8);

}

uint64_t __62__PPMaintenance__registerTTLBasedDecayedFeedbackCountsCleanup__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __62__PPMaintenance__registerTTLBasedDecayedFeedbackCountsCleanup__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v18[16];

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TTLBasedFeedbackRecordCleanup: starting", v18, 2u);
  }

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -2592000.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "TTLBasedFeedbackRecordCleanup initializing topic store", v18, 2u);
    }

    +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "TTLBasedFeedbackRecordCleanup initializing named entity store", v18, 2u);
    }

    +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v10 = 0;
    if (!v6)
      goto LABEL_26;
    goto LABEL_19;
  }
  pp_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "TTLBasedFeedbackRecordCleanup initializing location store", v18, 2u);
  }

  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
LABEL_19:
    if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    {
      pp_default_log_handle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "Running TTL-based topic feedback cleanup", v18, 2u);
      }

      if ((objc_msgSend(v6, "deleteAllTopicFeedbackCountsOlderThanDate:", v4) & 1) == 0)
      {
        pp_default_log_handle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v18 = 0;
          _os_log_error_impl(&dword_1C392E000, v12, OS_LOG_TYPE_ERROR, "PPMaintenance TTLBasedFeedbackRecordCleanup failed for topic feedback", v18, 2u);
        }

      }
    }
  }
LABEL_26:
  if (v8 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    pp_default_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "Running TTL-based named entity feedback cleanup", v18, 2u);
    }

    if ((objc_msgSend(v8, "deleteAllNamedEntityFeedbackCountsOlderThanDate:", v4) & 1) == 0)
    {
      pp_default_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_error_impl(&dword_1C392E000, v14, OS_LOG_TYPE_ERROR, "PPMaintenance TTLBasedFeedbackRecordCleanup failed for named entity feedback", v18, 2u);
      }

    }
  }
  if (v10 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "Running TTL-based location feedback cleanup", v18, 2u);
    }

    if ((objc_msgSend(v10, "deleteAllLocationFeedbackCountsOlderThanDate:", v4) & 1) == 0)
    {
      pp_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v18 = 0;
        _os_log_error_impl(&dword_1C392E000, v16, OS_LOG_TYPE_ERROR, "PPMaintenance TTLBasedFeedbackRecordCleanup failed for location feedback", v18, 2u);
      }

    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    pp_default_log_handle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TTLBasedFeedbackRecordCleanup: finished", v18, 2u);
    }

  }
}

void __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  const char **v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD aBlock[4];
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  int v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v42 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v38 = &v39;
  v5 = v3;
  v37 = v5;
  v34[0] = v4;
  v34[1] = 3221225472;
  v34[2] = __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_3;
  v34[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v35 = v6;
  v7 = _Block_copy(v34);
  v45[0] = v7;
  v32[0] = v4;
  v32[1] = 3221225472;
  v32[2] = __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_124;
  v32[3] = &unk_1E7E1B2B0;
  v8 = v6;
  v33 = v8;
  v9 = _Block_copy(v32);
  v45[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  objc_msgSend(v10, "_pas_shuffledArrayUsingRng:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v4;
  v27 = 3221225472;
  v28 = __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_128;
  v29 = &unk_1E7E1D3B0;
  v13 = v12;
  v30 = v13;
  v14 = v8;
  v31 = v14;
  v15 = (void (**)(_QWORD))_Block_copy(&v26);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);

  pp_maintenance_signpost_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "RemotelyDonatedRecordCleanup", ", buf, 2u);
  }

  v15[2](v15);
  pp_maintenance_signpost_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    v22 = *((unsigned __int8 *)v40 + 24);
    *(_DWORD *)buf = 67109120;
    v44 = v22;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v21, OS_SIGNPOST_INTERVAL_END, v17, "RemotelyDonatedRecordCleanup", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v40 + 24))
    v23 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v23 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v23);
  if (*((_BYTE *)v40 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v26, v27, v28, v29, v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 832, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v24, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: RemotelyDonatedRecordCleanup: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v39, 8);

}

uint64_t __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: RemotelyDonatedRecordCleanup: starting for named entity records", v5, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    objc_msgSend(v4, "clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));

}

void __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_124(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: RemotelyDonatedRecordCleanup: starting for topic records", v5, 2u);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    objc_msgSend(v4, "clearRemoteRecordsMissingFromDuetWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));

}

void __54__PPMaintenance__registerRemotelyDonatedRecordCleanup__block_invoke_128(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t buf[8];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: RemotelyDonatedRecordCleanup: starting", buf, 2u);
  }

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
LABEL_5:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v6)
        objc_enumerationMutation(v3);
      (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7));
      if (!(*(unsigned int (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40)))
        break;
      if (v5 == ++v7)
      {
        v5 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
        if (v5)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:

    pp_default_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: RemotelyDonatedRecordCleanup: finished", buf, 2u);
    }
  }

}

void __49__PPMaintenance__registerTTLBasedDonationCleanup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t *v23;
  _QWORD aBlock[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v30 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PPMaintenance__registerTTLBasedDonationCleanup__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v26 = &v27;
  v5 = v3;
  v25 = v5;
  v18 = v4;
  v19 = 3221225472;
  v20 = __49__PPMaintenance__registerTTLBasedDonationCleanup__block_invoke_3;
  v21 = &unk_1E7E1B2F8;
  v6 = _Block_copy(aBlock);
  v22 = v6;
  v23 = &v27;
  v7 = (void (**)(_QWORD))_Block_copy(&v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "TTLBasedDonationCleanup", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v28 + 24);
    *(_DWORD *)buf = 67109120;
    v32 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "TTLBasedDonationCleanup", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v28 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v28 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v18, v19, v20, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 723, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: deferred.", buf, 2u);
    }

  }
  _Block_object_dispose(&v27, 8);

}

uint64_t __49__PPMaintenance__registerTTLBasedDonationCleanup__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __49__PPMaintenance__registerTTLBasedDonationCleanup__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  id v13;
  uint8_t buf[4];
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: starting.", buf, 2u);
  }

  +[PPTTLDeletionPolicy defaultPolicy](PPTTLDeletionPolicy, "defaultPolicy");
  v3 = objc_claimAutoreleasedReturnValue();
  pp_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      v15 = v3;
      _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: using policy: %@", buf, 0xCu);
    }

    v13 = 0;
    v6 = -[NSObject applyPolicyWithError:shouldContinueBlock:](v3, "applyPolicyWithError:shouldContinueBlock:", &v13, *(_QWORD *)(a1 + 32));
    v4 = v13;
    v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        v10 = "PPMaintenance: TTLBasedDonationCleanup: deferring.";
LABEL_14:
        v11 = v8;
        v12 = 2;
LABEL_15:
        _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
    else
    {
      if (!v6)
      {
        if (!v9)
          goto LABEL_16;
        *(_DWORD *)buf = 138412290;
        v15 = v4;
        v10 = "PPMaintenance: TTLBasedDonationCleanup: failed with error: %@";
        v11 = v8;
        v12 = 12;
        goto LABEL_15;
      }
      if (v9)
      {
        *(_WORD *)buf = 0;
        v10 = "PPMaintenance: TTLBasedDonationCleanup: completed successfully.";
        goto LABEL_14;
      }
    }
LABEL_16:

    goto LABEL_17;
  }
  if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: failed to load default policy, possibly due to device lock.", buf, 2u);
  }
LABEL_17:

}

void __44__PPMaintenance__registerLogSportsFavorites__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  const char **v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _QWORD aBlock[4];
  id v31;
  uint8_t *v32;
  uint8_t v33[8];
  uint8_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D70D00];
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sportsMetricsSamplingRate");
  if ((objc_msgSend(v4, "yesWithProbability:") & 1) != 0)
  {

    goto LABEL_4;
  }
  v6 = objc_msgSend(MEMORY[0x1E0D70D00], "isInternalDevice");

  if ((v6 & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)v33 = 0;
    v34 = v33;
    v35 = 0x2020000000;
    v7 = MEMORY[0x1E0C809B0];
    v36 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__PPMaintenance__registerLogSportsFavorites__block_invoke_317;
    aBlock[3] = &unk_1E7E1B288;
    v32 = v33;
    v8 = v3;
    v31 = v8;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 1;
    v22[0] = v7;
    v22[1] = 3221225472;
    v22[2] = __44__PPMaintenance__registerLogSportsFavorites__block_invoke_2;
    v22[3] = &unk_1E7E1B6C0;
    v9 = _Block_copy(aBlock);
    v23 = v9;
    v24 = &v26;
    v25 = *(_QWORD *)(a1 + 32);
    v10 = (void (**)(_QWORD))_Block_copy(v22);
    PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
    pp_maintenance_signpost_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_signpost_id_generate(v11);

    pp_maintenance_signpost_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C392E000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "LogSportsFavorites", ", buf, 2u);
    }

    v10[2](v10);
    pp_maintenance_signpost_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      v17 = v34[24];
      *(_DWORD *)buf = 67109120;
      v38 = v17;
      _os_signpost_emit_with_name_impl(&dword_1C392E000, v16, OS_SIGNPOST_INTERVAL_END, v12, "LogSportsFavorites", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
    }

    if (v34[24])
      v18 = (const char **)&kPPMaintenanceJobDeferredNotification;
    else
      v18 = (const char **)&kPPMaintenanceJobCompletedNotification;
    PPPostNotification(*v18);
    if (!*((_BYTE *)v27 + 24) && v34[24])
    {
      if (!xpc_activity_set_state((xpc_activity_t)v8, 3))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPMaintenance.m"), 2582, CFSTR("Unexpected failure of deferral"));

      }
      pp_default_log_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v19, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: LogSportsFavorites: deferring", buf, 2u);
      }

    }
    _Block_object_dispose(&v26, 8);

    _Block_object_dispose(v33, 8);
    goto LABEL_24;
  }
  pp_default_log_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: Sports metrics skipped due to sampling.", v33, 2u);
  }

LABEL_24:
}

uint64_t __44__PPMaintenance__registerLogSportsFavorites__block_invoke_317(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __44__PPMaintenance__registerLogSportsFavorites__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  unint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSObject *v59;
  NSObject *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  id v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  void *context;
  uint64_t (**v73)(void);
  os_log_t oslog;
  void *v75;
  uint8_t v76[8];
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  uint64_t *v81;
  uint64_t *v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _QWORD v109[4];
  NSObject *v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  __int128 v118;
  void (*v119)(uint64_t, void *, unint64_t);
  void *v120;
  id v121;
  id v122;
  id v123;
  NSObject *v124;
  id v125;
  uint64_t *v126;
  uint64_t *v127;
  uint64_t v128;
  uint8_t buf[4];
  void *v130;
  __int16 v131;
  void *v132;
  uint8_t v133[136];
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
  {
    v71 = a1;
    v73 = (uint64_t (**)(void))*(id *)(a1 + 32);
    v2 = objc_opt_self();
    context = (void *)MEMORY[0x1C3BD6630](v2);
    pp_default_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v133 = 0;
      _os_log_debug_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEBUG, "PPMaintenance: enters _logSportsFavorites", v133, 2u);
    }

    +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "trieForFactorName:namespaceName:", CFSTR("tvAppSportsFavorites.trie"), CFSTR("PERSONALIZATION_PORTRAIT_TOPICS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if ((v73[2]() & 1) != 0)
      {
        oslog = (os_log_t)objc_opt_new();
        v6 = (void *)objc_msgSend(CFSTR("PersonalizationPortrait"), "copy");
        -[NSObject setCaller:](oslog, "setCaller:", v6);

        v7 = dispatch_group_create();
        dispatch_group_enter(v7);
        v112 = 0;
        v113 = &v112;
        v114 = 0x3032000000;
        v115 = __Block_byref_object_copy__15153;
        v116 = __Block_byref_object_dispose__15154;
        v117 = 0;
        v109[0] = MEMORY[0x1E0C809B0];
        v109[1] = 3221225472;
        v109[2] = __35__PPMaintenance__logSportsMetrics___block_invoke;
        v109[3] = &unk_1E7E1B6E8;
        v111 = &v112;
        v8 = v7;
        v110 = v8;
        -[NSObject makeRequestWithCompletion:](oslog, "makeRequestWithCompletion:", v109);
        v69 = v8;
        v9 = objc_msgSend(MEMORY[0x1E0D81598], "waitForGroup:timeoutSeconds:", v8, 8.0);
        if ((v73[2]() & 1) == 0)
        {
          pp_default_log_handle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v133 = 0;
            _os_log_debug_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring sports metrics.", v133, 2u);
          }
          v9 = 1;
          goto LABEL_62;
        }
        if (v9 != 1)
        {
          if (v113[5])
          {
            v10 = objc_alloc(MEMORY[0x1E0C99E20]);
            v11 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend((id)v113[5], "count"));
            v75 = (void *)objc_opt_new();
            v107 = 0u;
            v108 = 0u;
            v105 = 0u;
            v106 = 0u;
            v12 = (id)v113[5];
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v105, v133, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v106;
              do
              {
                v15 = 0;
                do
                {
                  if (*(_QWORD *)v106 != v14)
                    objc_enumerationMutation(v12);
                  v16 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v15);
                  pp_private_log_handle();
                  v17 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v16, "ID");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "name");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v130 = v19;
                    v131 = 2112;
                    v132 = v20;
                    _os_log_debug_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEBUG, "PPMaintenance: TV app favorite: %@: \t\t %@", buf, 0x16u);

                  }
                  objc_msgSend(v16, "ID");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v11, "addObject:", v18);

                  ++v15;
                }
                while (v13 != v15);
                v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v105, v133, 16);
              }
              while (v13);
            }

            v103 = 0u;
            v104 = 0u;
            v101 = 0u;
            v102 = 0u;
            v21 = v11;
            v22 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v101, buf, 16);
            if (v22)
            {
              v23 = *(_QWORD *)v102;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v102 != v23)
                    objc_enumerationMutation(v21);
                  v25 = objc_msgSend(v5, "payloadForString:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i));
                  if ((_DWORD)v25)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v25);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "addObject:", v26);

                  }
                }
                v22 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v101, buf, 16);
              }
              while (v22);
            }

            +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_opt_new();
            v100 = 0;
            objc_msgSend(v27, "scoresForTopicMapping:query:error:", CFSTR("sirisports"), v28, &v100);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = v100;

            if (v68)
            {
              pp_private_log_handle();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(v118) = 138412290;
                *(_QWORD *)((char *)&v118 + 4) = v68;
                _os_log_debug_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEBUG, "PPMaintenance: Portrait siri sports predictions:\n%@", (uint8_t *)&v118, 0xCu);
              }

              if ((v73[2]() & 1) != 0)
              {
                objc_msgSend(v68, "keysSortedByValueUsingComparator:", &__block_literal_global_329);
                v30 = objc_claimAutoreleasedReturnValue();
                v31 = (void *)objc_opt_new();
                v70 = v30;
                +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = objc_msgSend(v32, "sportsMetricsNumberOfTeamsLogged");

                v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("teamFalseNegativesTop%lu"), v65);
                objc_msgSend(v33, "_pas_stringBackedByUTF8CString");
                v64 = (void *)objc_claimAutoreleasedReturnValue();

                +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v33) = objc_msgSend(v34, "sportsMetricsNumberOfLeaguesLogged");

                v35 = (int)v33;
                v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("leagueFalseNegativesTop%lu"), (int)v33);
                objc_msgSend(v36, "_pas_stringBackedByUTF8CString");
                v63 = (void *)objc_claimAutoreleasedReturnValue();

                v37 = (void *)objc_opt_new();
                v96 = 0;
                v97 = &v96;
                v98 = 0x2020000000;
                v99 = 0;
                v99 = -[NSObject count](v21, "count");
                v92 = 0;
                v93 = &v92;
                v94 = 0x2020000000;
                v95 = 0;
                v95 = -[NSObject count](v21, "count");
                v88 = 0;
                v89 = &v88;
                v90 = 0x2020000000;
                v91 = 0;
                v91 = objc_msgSend(v75, "count");
                v84 = 0;
                v85 = &v84;
                v86 = 0x2020000000;
                v87 = 0;
                v87 = objc_msgSend(v75, "count");
                *(_QWORD *)&v118 = MEMORY[0x1E0C809B0];
                *((_QWORD *)&v118 + 1) = 3221225472;
                v119 = __35__PPMaintenance__logSportsMetrics___block_invoke_2;
                v120 = &unk_1E7E1B730;
                v121 = v5;
                v128 = v65;
                v38 = v37;
                v122 = v38;
                v123 = v68;
                v124 = v21;
                v126 = &v96;
                v127 = &v92;
                v61 = v31;
                v125 = v61;
                v39 = -[NSObject enumerateObjectsUsingBlock:](v70, "enumerateObjectsUsingBlock:", &v118);
                if (v65)
                {
                  for (j = 0; j != v65; ++j)
                  {
                    v41 = (void *)MEMORY[0x1C3BD6630](v39);
                    if (j >= -[NSObject count](v70, "count"))
                    {
                      v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("teamScore%lu"), j);
                      objc_msgSend(v42, "_pas_stringBackedByUTF8CString");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "setObject:forKeyedSubscript:", &unk_1E7E599D8, v43);

                      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("teamState%lu"), j);
                      objc_msgSend(v44, "_pas_stringBackedByUTF8CString");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "setObject:forKeyedSubscript:", &unk_1E7E599F0, v45);

                    }
                    objc_autoreleasePoolPop(v41);
                  }
                }
                objc_msgSend(v61, "keysSortedByValueUsingComparator:", &__block_literal_global_346);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v77[0] = MEMORY[0x1E0C809B0];
                v77[1] = 3221225472;
                v77[2] = __35__PPMaintenance__logSportsMetrics___block_invoke_2_347;
                v77[3] = &unk_1E7E1B778;
                v83 = v35;
                v46 = v38;
                v78 = v46;
                v62 = v61;
                v79 = v62;
                v80 = v75;
                v81 = &v88;
                v82 = &v84;
                objc_msgSend(v66, "enumerateObjectsUsingBlock:", v77);
                v47 = objc_msgSend(v66, "count");
                if (v47 < v35)
                {
                  do
                  {
                    v48 = (void *)MEMORY[0x1C3BD6630]();
                    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("leagueScore%lu"), v47, v62);
                    objc_msgSend(v49, "_pas_stringBackedByUTF8CString");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "setObject:forKeyedSubscript:", &unk_1E7E599D8, v50);

                    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("leagueState%lu"), v47);
                    objc_msgSend(v51, "_pas_stringBackedByUTF8CString");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "setObject:forKeyedSubscript:", &unk_1E7E599F0, v52);

                    objc_autoreleasePoolPop(v48);
                    ++v47;
                  }
                  while (v35 != v47);
                }
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v97[3]);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setObject:forKeyedSubscript:", v53, CFSTR("teamFalseNegativesAll"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v93[3]);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setObject:forKeyedSubscript:", v54, v64);

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v89[3]);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setObject:forKeyedSubscript:", v55, CFSTR("leagueFalseNegativesAll"));

                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v85[3]);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "setObject:forKeyedSubscript:", v56, v63);

                if ((v73[2]() & 1) != 0)
                {
                  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
                  v57 = objc_claimAutoreleasedReturnValue();
                  -[NSObject sportsMetricsEventName](v57, "sportsMetricsEventName");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v58, v46, 1);

                  v9 = 0;
                }
                else
                {
                  pp_default_log_handle();
                  v57 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)v76 = 0;
                    _os_log_debug_impl(&dword_1C392E000, v57, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring sports metrics.", v76, 2u);
                  }
                  v9 = 1;
                }

                _Block_object_dispose(&v84, 8);
                _Block_object_dispose(&v88, 8);
                _Block_object_dispose(&v92, 8);
                _Block_object_dispose(&v96, 8);

                v60 = v70;
                goto LABEL_61;
              }
              pp_default_log_handle();
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
              {
                LOWORD(v118) = 0;
                _os_log_debug_impl(&dword_1C392E000, v60, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring sports metrics.", (uint8_t *)&v118, 2u);
              }
            }
            else
            {
              pp_default_log_handle();
              v60 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
              {
                LODWORD(v118) = 138412290;
                *(_QWORD *)((char *)&v118 + 4) = v67;
                _os_log_error_impl(&dword_1C392E000, v60, OS_LOG_TYPE_ERROR, "PPMaintenance: Failed to get Portrait siri sports predictions:%@", (uint8_t *)&v118, 0xCu);
              }
            }
            v9 = 1;
LABEL_61:

LABEL_62:
            goto LABEL_63;
          }
          v9 = 1;
        }
LABEL_63:

        _Block_object_dispose(&v112, 8);
        goto LABEL_64;
      }
      pp_default_log_handle();
      oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v133 = 0;
        _os_log_debug_impl(&dword_1C392E000, oslog, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring sports metrics.", v133, 2u);
      }
    }
    else
    {
      pp_default_log_handle();
      oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v133 = 0;
        _os_log_error_impl(&dword_1C392E000, oslog, OS_LOG_TYPE_ERROR, "PPMaintenance: Failed to load TV app Sports Favorites trie.", v133, 2u);
      }
    }
    v9 = 1;
LABEL_64:

    objc_autoreleasePoolPop(context);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v71 + 40) + 8) + 24) = v9 == 0;
    return;
  }
  pp_default_log_handle();
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v133 = 0;
    _os_log_debug_impl(&dword_1C392E000, v59, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring sports metrics.", v133, 2u);
  }

}

void __35__PPMaintenance__logSportsMetrics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  pp_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v11) = 0;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "PPMaintenance: Enters favRequest completion block.", (uint8_t *)&v11, 2u);
  }

  if (v5)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = v5;
    v10 = *(NSObject **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
  }
  else
  {
    pp_default_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "PPMaintenance: Failed to make WLKFavoritesRequest: %@", (uint8_t *)&v11, 0xCu);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __35__PPMaintenance__logSportsMetrics___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v5;
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
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a2;
  v5 = objc_msgSend(*(id *)(a1 + 32), "payloadForString:");
  if (*(_QWORD *)(a1 + 88) > a3)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 40);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("teamScore%lu"), a3);
    objc_msgSend(v8, "_pas_stringBackedByUTF8CString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v9);

  }
  if ((_DWORD)v5)
  {
    if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v26))
    {
      --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      if (*(_QWORD *)(a1 + 88) > a3)
      {
        --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        v10 = *(void **)(a1 + 40);
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("teamState%lu"), a3);
        objc_msgSend(v11, "_pas_stringBackedByUTF8CString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = &unk_1E7E59990;
LABEL_11:
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v12);

      }
    }
    else if (*(_QWORD *)(a1 + 88) > a3)
    {
      v10 = *(void **)(a1 + 40);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("teamState%lu"), a3);
      objc_msgSend(v11, "_pas_stringBackedByUTF8CString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = &unk_1E7E599A8;
      goto LABEL_11;
    }
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v19 = v18;
    v20 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    objc_msgSend(v17, "numberWithDouble:", v19 + v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v25);

    goto LABEL_13;
  }
  if (*(_QWORD *)(a1 + 88) > a3)
  {
    v14 = *(void **)(a1 + 40);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("teamState%lu"), a3);
    objc_msgSend(v15, "_pas_stringBackedByUTF8CString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E7E599C0, v16);
LABEL_13:

  }
}

void __35__PPMaintenance__logSportsMetrics___block_invoke_2_347(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a2;
  v14 = v5;
  if (*(_QWORD *)(a1 + 72) > a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("leagueScore%lu"), a3);
    objc_msgSend(v8, "_pas_stringBackedByUTF8CString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v9);

    v5 = v14;
  }
  if (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v5))
  {
    --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if (*(_QWORD *)(a1 + 72) > a3)
    {
      --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v10 = *(void **)(a1 + 32);
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("leagueState%lu"), a3);
      objc_msgSend(v11, "_pas_stringBackedByUTF8CString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = &unk_1E7E59990;
LABEL_8:
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v12);

    }
  }
  else if (*(_QWORD *)(a1 + 72) > a3)
  {
    v10 = *(void **)(a1 + 32);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("leagueState%lu"), a3);
    objc_msgSend(v11, "_pas_stringBackedByUTF8CString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = &unk_1E7E599A8;
    goto LABEL_8;
  }

}

uint64_t __35__PPMaintenance__logSportsMetrics___block_invoke_345(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __35__PPMaintenance__logSportsMetrics___block_invoke_327(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __47__PPMaintenance__registerLogLocationPerplexity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD aBlock[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v34 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v30 = &v31;
  v5 = v3;
  v29 = v5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = v4;
  v19 = 3221225472;
  v20 = __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_3;
  v21 = &unk_1E7E1B2F8;
  v6 = _Block_copy(aBlock);
  v22 = v6;
  v23 = &v24;
  v7 = (void (**)(_QWORD))_Block_copy(&v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "LogLocationPerplexity", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v32 + 24);
    *(_DWORD *)buf = 67109120;
    v36 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "LogLocationPerplexity", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v32 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (!*((_BYTE *)v25 + 24) && *((_BYTE *)v32 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v18, v19, v20, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 2532, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: LogLocationPerplexity: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v31, 8);
}

uint64_t __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  NSObject *v43;
  id v44;
  NSObject *v45;
  id v46;
  id v47;
  NSObject *v48;
  uint8_t v49[8];
  _QWORD v50[4];
  NSObject *v51;
  id v52;
  __int128 *p_buf;
  NSObject *v54;
  id v55;
  uint8_t v56[128];
  __int128 buf;
  uint64_t v58;
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily perplexity location statistics.", (uint8_t *)&buf, 2u);
  }

  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setToDate:", v4);

    v55 = 0;
    objc_msgSend(v36, "locationRecordsWithQuery:error:", v3, &v55);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v55;
    if (!v35)
    {
      pp_default_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v5;
        _os_log_error_impl(&dword_1C392E000, v14, OS_LOG_TYPE_ERROR, "PPMaintenance: error fetching location records: %@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_37;
    }
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    +[PPLocationClusterID lookupTableWithRecords:](PPLocationClusterID, "lookupTableWithRecords:", v35);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v6, "initWithArray:", v8);

    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
    {
      pp_default_log_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_debug_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring location perplexity.", (uint8_t *)&buf, 2u);
      }
      goto LABEL_36;
    }
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -86400.0);
    objc_msgSend(v36, "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastDonationTimeForSourcesBeforeDate:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
    {
      pp_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf) = 0;
        _os_log_debug_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring location perplexity.", (uint8_t *)&buf, 2u);
      }
      goto LABEL_35;
    }
    if (objc_msgSend(MEMORY[0x1E0D70D00], "yesWithProbability:", 0.00999999978))
    {
      v10 = (void *)objc_opt_new();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v58 = 0x2020000000;
      v59 = 0;
      v11 = (void *)objc_opt_new();
      v54 = v5;
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_307;
      v50[3] = &unk_1E7E1B670;
      v52 = *(id *)(a1 + 32);
      v12 = v10;
      v51 = v12;
      p_buf = &buf;
      objc_msgSend(v36, "iterRankedLocationsWithQuery:error:block:", v11, &v54, v50);
      v13 = v54;

      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
      {
        pp_default_log_handle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v49 = 0;
          _os_log_debug_impl(&dword_1C392E000, v26, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring location perplexity.", v49, 2u);
        }

        _Block_object_dispose(&buf, 8);
        v5 = v13;
        v16 = v12;
        goto LABEL_35;
      }

      _Block_object_dispose(&buf, 8);
      v5 = v13;
    }
    else
    {
      v12 = 0;
    }
    v31 = (void *)objc_opt_new();

    v17 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFromDate:", v18);

    objc_msgSend(v31, "setDeviceFilter:", 1);
    v19 = (void *)objc_opt_new();
    v48 = v5;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_309;
    v42[3] = &unk_1E7E1B698;
    v43 = v34;
    v30 = v19;
    v44 = v30;
    v27 = v12;
    v45 = v27;
    v46 = v32;
    v28 = v17;
    v47 = v28;
    LOBYTE(v17) = objc_msgSend(v36, "iterLocationRecordsWithQuery:error:block:", v31, &v48, v42);
    v29 = v48;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v17;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      obj = v30;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v39;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v39 != v21)
              objc_enumerationMutation(obj);
            v23 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v22);
            v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.LocationDonationAnalyzed"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
            +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v24, v23, 1);

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
        }
        while (v20);
      }

      pp_default_log_handle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1C392E000, v25, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily perplexity location statistics.", (uint8_t *)&buf, 2u);
      }
    }
    else
    {
      pp_default_log_handle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v29;
        _os_log_error_impl(&dword_1C392E000, v25, OS_LOG_TYPE_ERROR, "PPMaintenance: Error logging location perplexity: %@", (uint8_t *)&buf, 0xCu);
      }
    }

    v5 = v29;
    v3 = v31;
    v16 = v27;
LABEL_35:

    v15 = v33;
LABEL_36:

    v14 = v34;
LABEL_37:

    goto LABEL_38;
  }
  pp_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_debug_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring location perplexity.", (uint8_t *)&buf, 2u);
  }
LABEL_38:

}

void __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_307(uint64_t a1, void *a2, _BYTE *a3)
{
  PPLocationClusterID *v5;
  void *v6;
  void *v7;
  PPLocationClusterID *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
    *a3 = 1;
  v5 = [PPLocationClusterID alloc];
  objc_msgSend(v12, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placemark");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PPLocationClusterID initWithPlacemark:](v5, "initWithPlacemark:", v7);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v10);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v8);

  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

void __47__PPMaintenance__registerLogLocationPerplexity__block_invoke_309(uint64_t a1, void *a2)
{
  id v3;
  PPLocationClusterID *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v25;
  void *context;
  void *v27;
  void *v28;
  _QWORD v29[6];
  _QWORD v30[8];

  v30[6] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = [PPLocationClusterID alloc];
  objc_msgSend(v3, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placemark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PPLocationClusterID initWithPlacemark:](v4, "initWithPlacemark:", v6);

  v8 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v7) ^ 1;
  v27 = *(void **)(a1 + 40);
  context = (void *)MEMORY[0x1C3BD6630]();
  v29[0] = CFSTR("source");
  objc_msgSend(v3, "source");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bundleId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPMetricsUtils filterBundleId:](PPMetricsUtils, "filterBundleId:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v23;
  v29[1] = CFSTR("algorithm");
  objc_msgSend(MEMORY[0x1E0D70B90], "describeAlgorithm:", objc_msgSend(v3, "algorithm"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v22;
  v29[2] = CFSTR("isNew");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v21;
  v29[3] = CFSTR("groupId");
  objc_msgSend(v3, "source");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "groupId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPMetricsUtils filterGroupIdAllowance:](PPMetricsUtils, "filterGroupIdAllowance:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v10 = (void *)objc_opt_new();
  v30[3] = v10;
  v29[4] = CFSTR("isUserCreated");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", objc_msgSend(v13, "flags") & 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v14;
  v29[5] = CFSTR("rank");
  v28 = (void *)v7;
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v15)
    v16 = (void *)objc_opt_new();
  v30[5] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)

  if (!v9)
  objc_autoreleasePoolPop(context);
  objc_msgSend(v27, "addObject:", v17);

  objc_msgSend(v3, "source");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPMaintenance _logDonationIntervalStatsForSource:domain:lastDonationTimes:lastBatchDonationTimes:]((uint64_t)PPMaintenance, v18, 2, *(void **)(a1 + 56), *(void **)(a1 + 64));

}

+ (void)_logDonationIntervalStatsForSource:(uint64_t)a3 domain:(void *)a4 lastDonationTimes:(void *)a5 lastBatchDonationTimes:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a2;
  v8 = a4;
  v9 = a5;
  objc_opt_self();
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setDomain:", +[PPMetricsUtils mapDomainForPET2:](PPMetricsUtils, "mapDomainForPET2:", a3));
  objc_msgSend(v34, "bundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSource:", +[PPMetricsUtils sourceForBundleId:](PPMetricsUtils, "sourceForBundleId:", v11));

  objc_msgSend(v34, "bundleId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v10, "setIsFirstDonation:", 1);
LABEL_8:
    objc_msgSend(v34, "date");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bundleId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, v32);

    goto LABEL_9;
  }
  objc_msgSend(v34, "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v16);
  v18 = fabs(v17);

  if (v18 >= 600.0)
  {
    objc_msgSend(v10, "setIsFirstDonation:", 0);
    objc_msgSend(v34, "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bundleId");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSinceDate:", v28);
    LODWORD(v30) = vcvtad_u64_f64(v29 / 3600.0);
    objc_msgSend(v10, "setInterval:", v30);

    objc_msgSend(v34, "bundleId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v21);
    goto LABEL_7;
  }
  objc_msgSend(v34, "bundleId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setIsFirstDonation:", v20 == 0);
  if (v20)
  {
    objc_msgSend(v34, "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bundleId");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceDate:", v23);
    LODWORD(v25) = vcvtad_u64_f64(v24 / 3600.0);
    objc_msgSend(v10, "setInterval:", v25);

LABEL_7:
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trackScalarForMessage:", v10);

}

void __44__PPMaintenance__registerLogTopicPerplexity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD aBlock[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v34 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v30 = &v31;
  v5 = v3;
  v29 = v5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = v4;
  v19 = 3221225472;
  v20 = __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_3;
  v21 = &unk_1E7E1B2F8;
  v6 = _Block_copy(aBlock);
  v22 = v6;
  v23 = &v24;
  v7 = (void (**)(_QWORD))_Block_copy(&v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "LogTopicPerplexity", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v32 + 24);
    *(_DWORD *)buf = 67109120;
    v36 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "LogTopicPerplexity", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v32 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (!*((_BYTE *)v25 + 24) && *((_BYTE *)v32 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v18, v19, v20, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 2151, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: LogTopicPerplexity: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v31, 8);
}

uint64_t __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *oslog;
  id obj;
  id obja;
  _QWORD v42[5];
  NSObject *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  uint8_t *v53;
  NSObject *v54;
  uint8_t buf[8];
  uint8_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  id v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint8_t v64[4];
  NSObject *v65;
  __int128 v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  pp_default_log_handle();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v1, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily perplexity topic statistics.", buf, 2u);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
  {
    oslog = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -86400.0);
    objc_msgSend(v37, "storage");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "clusterIdentifiersExistingBeforeDate:", oslog);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
    {
      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
      {
        v33 = (void *)objc_opt_new();
        objc_msgSend(v33, "setFromDate:", oslog);
        objc_msgSend(v33, "setDeviceFilter:", 1);
        if (objc_msgSend(MEMORY[0x1E0D70D00], "yesWithProbability:", 0.00999999978))
        {
          v34 = (id)objc_opt_new();
          v3 = (void *)objc_opt_new();
          v61 = 0;
          objc_msgSend(v37, "rankedTopicsWithQuery:error:", v3, &v61);
          v36 = (id)objc_claimAutoreleasedReturnValue();
          v4 = v61;

          if (objc_msgSend(v36, "count"))
          {
            v5 = 0;
            while (1)
            {
              v6 = (void *)MEMORY[0x1C3BD6630]();
              if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
                break;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectAtIndexedSubscript:", v5);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "item");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "topicIdentifier");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKeyedSubscript:", v7, v10);

              objc_autoreleasePoolPop(v6);
              if (++v5 >= (unint64_t)objc_msgSend(v36, "count"))
                goto LABEL_11;
            }
            pp_default_log_handle();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_debug_impl(&dword_1C392E000, v31, OS_LOG_TYPE_DEBUG, "PPMaintenance: deferring topic ranks.", buf, 2u);
            }

            objc_autoreleasePoolPop(v6);
            goto LABEL_52;
          }
LABEL_11:

        }
        else
        {
          v4 = 0;
          v34 = 0;
        }
        v11 = (void *)objc_opt_new();
        *(_QWORD *)buf = 0;
        v56 = buf;
        v57 = 0x3032000000;
        v58 = __Block_byref_object_copy__15153;
        v59 = __Block_byref_object_dispose__15154;
        v60 = 0;
        v54 = v4;
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_255;
        v48[3] = &unk_1E7E1B5A8;
        v52 = *(id *)(a1 + 32);
        v49 = v35;
        v34 = v34;
        v50 = v34;
        v36 = v11;
        v51 = v36;
        v53 = buf;
        LOBYTE(v11) = objc_msgSend(v37, "iterTopicRecordsWithQuery:error:block:", v33, &v54, v48);
        v32 = v54;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v11;
        if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
        {
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          obj = v36;
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v71, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v45;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v45 != v13)
                  objc_enumerationMutation(obj);
                v15 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
                v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.TopicDonationAnalyzed"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
                +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v16, v15, 1);

              }
              v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v71, 16);
            }
            while (v12);
          }

          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          {
            v4 = v32;
            if (*((_QWORD *)v56 + 5))
            {
              pp_default_log_handle();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                LOWORD(v66) = 0;
                _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_INFO, "PPMaintenance: performing sampled logging of user created entity", (uint8_t *)&v66, 2u);
              }

              v18 = (void *)objc_opt_new();
              v19 = (void *)MEMORY[0x1C3BD6630]();
              v20 = objc_alloc(MEMORY[0x1E0C99E60]);
              v21 = (void *)objc_msgSend(v20, "initWithObjects:", *((_QWORD *)v56 + 5), 0);
              objc_autoreleasePoolPop(v19);
              objc_msgSend(v18, "setMatchingTopicIds:", v21);

              objc_msgSend(v18, "setToDate:", oslog);
              *(_QWORD *)&v66 = 0;
              *((_QWORD *)&v66 + 1) = &v66;
              v67 = 0x3032000000;
              v68 = __Block_byref_object_copy__15153;
              v69 = __Block_byref_object_dispose__15154;
              v70 = 0;
              v43 = v32;
              v42[0] = MEMORY[0x1E0C809B0];
              v42[1] = 3221225472;
              v42[2] = __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_271;
              v42[3] = &unk_1E7E1B5D0;
              v42[4] = &v66;
              v22 = objc_msgSend(v37, "iterTopicRecordsWithQuery:error:block:", v18, &v43, v42);
              v4 = v43;

              if ((v22 & 1) != 0)
              {
                if (*(_QWORD *)(*((_QWORD *)&v66 + 1) + 40))
                {
                  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.UserWroteTopic"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
                  v24 = (void *)MEMORY[0x1C3BD6630]();
                  v62[0] = CFSTR("source");
                  objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 40), "source");
                  obja = (id)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(obja, "bundleId");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PPMetricsUtils filterBundleId:](PPMetricsUtils, "filterBundleId:", v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v62[1] = CFSTR("algorithm");
                  v63[0] = v26;
                  objc_msgSend(MEMORY[0x1E0D70CD0], "describeAlgorithm:", objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 40), "algorithm"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v63[1] = v27;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_autoreleasePoolPop(v24);
                  +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v23, v28, 1);

                }
                pp_default_log_handle();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)v64 = 0;
                  _os_log_impl(&dword_1C392E000, v29, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of sampled user created entity", v64, 2u);
                }
              }
              else
              {
                pp_default_log_handle();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v64 = 138412290;
                  v65 = v4;
                  _os_log_error_impl(&dword_1C392E000, v29, OS_LOG_TYPE_ERROR, "PPMaintenance: error logging sampled user creation metrics: %@", v64, 0xCu);
                }
              }

              _Block_object_dispose(&v66, 8);
              if ((v22 & 1) == 0)
                goto LABEL_51;
            }
            pp_default_log_handle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              LOWORD(v66) = 0;
              _os_log_impl(&dword_1C392E000, v30, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily perplexity topic statistics.", (uint8_t *)&v66, 2u);
            }
            v32 = v4;
          }
          else
          {
            pp_default_log_handle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v66) = 138412290;
              *(_QWORD *)((char *)&v66 + 4) = v32;
              _os_log_error_impl(&dword_1C392E000, v30, OS_LOG_TYPE_ERROR, "PPMaintenance: Error logging topic perplexity: %@", (uint8_t *)&v66, 0xCu);
            }
          }
        }
        else
        {
          pp_default_log_handle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v66) = 0;
            _os_log_impl(&dword_1C392E000, v30, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring topic donation analysis reporting.", (uint8_t *)&v66, 2u);
          }
        }

        v4 = v32;
LABEL_51:

        _Block_object_dispose(buf, 8);
LABEL_52:

        goto LABEL_53;
      }
      pp_default_log_handle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        goto LABEL_18;
      }
    }
    else
    {
      pp_default_log_handle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
LABEL_18:
        _os_log_debug_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring topic perplexity.", buf, 2u);
      }
    }
LABEL_53:

    goto LABEL_54;
  }
  pp_default_log_handle();
  oslog = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C392E000, oslog, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring topic perplexity.", buf, 2u);
  }
LABEL_54:

}

void __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_255(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
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
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  _QWORD v35[6];
  _QWORD v36[8];

  v36[6] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))() & 1) == 0)
  {
    *a3 = 1;
    goto LABEL_17;
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "topic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clusterIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v6, "containsObject:", v8);

  v35[0] = CFSTR("source");
  objc_msgSend(v5, "source");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bundleId");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPMetricsUtils filterBundleId:](PPMetricsUtils, "filterBundleId:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v31;
  v35[1] = CFSTR("algorithm");
  objc_msgSend(MEMORY[0x1E0D70CD0], "describeAlgorithm:", objc_msgSend(v5, "algorithm"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v30;
  v35[2] = CFSTR("isNew");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v34 ^ 1u);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v29;
  v35[3] = CFSTR("groupId");
  objc_msgSend(v5, "source");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "groupId");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPMetricsUtils filterGroupIdAllowance:](PPMetricsUtils, "filterGroupIdAllowance:");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
    v9 = objc_opt_new();
  v36[3] = v9;
  v35[4] = CFSTR("isUserCreated");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "source", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", objc_msgSend(v13, "flags") & 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v14;
  v35[5] = CFSTR("rank");
  v15 = *(void **)(a1 + 40);
  objc_msgSend(v5, "topic");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "topicIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18)
    v19 = (void *)objc_opt_new();
  v36[5] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)

  if (!v10)
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v27);
  if (v34)
  {
    objc_msgSend(v5, "source");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "flags") & 1) == 0)
    {
LABEL_14:

      goto LABEL_15;
    }
    v22 = objc_msgSend(MEMORY[0x1E0D70D00], "yesWithProbability:", 0.100000001);

    if (v22)
    {
      objc_msgSend(v5, "topic");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "topicIdentifier");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v21 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v23;
      goto LABEL_14;
    }
  }
LABEL_15:

LABEL_17:
}

void __44__PPMaintenance__registerLogTopicPerplexity__block_invoke_271(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD aBlock[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v34 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v30 = &v31;
  v5 = v3;
  v29 = v5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v18 = v4;
  v19 = 3221225472;
  v20 = __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_3;
  v21 = &unk_1E7E1B2F8;
  v6 = _Block_copy(aBlock);
  v22 = v6;
  v23 = &v24;
  v7 = (void (**)(_QWORD))_Block_copy(&v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "LogNamedEntityPerplexity", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v32 + 24);
    *(_DWORD *)buf = 67109120;
    v36 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "LogNamedEntityPerplexity", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v32 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (!*((_BYTE *)v25 + 24) && *((_BYTE *)v32 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v18, v19, v20, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 2412, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: LogNamedEntityPerplexity: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v31, 8);
}

uint64_t __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  char v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *oslog;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  NSObject *v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  NSObject *v56;
  id v57;
  uint8_t *v58;
  NSObject *v59;
  uint8_t buf[8];
  uint8_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  uint8_t *v69;
  id v70;
  _BYTE v71[128];
  _QWORD v72[2];
  _QWORD v73[2];
  uint8_t v74[4];
  NSObject *v75;
  __int128 v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily perplexity named entity statistics.", buf, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
  {
    oslog = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -86400.0);
    objc_msgSend(v44, "storage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clusterIdentifiersExistingBeforeDate:", oslog);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
    {
      pp_default_log_handle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring entity perplexity.", buf, 2u);
      }
      goto LABEL_46;
    }
    objc_msgSend(v44, "storage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastDonationTimeForSourcesBeforeDate:", oslog);
    v42 = objc_claimAutoreleasedReturnValue();

    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
    {
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring entity perplexity.", buf, 2u);
      }
      goto LABEL_45;
    }
    v41 = (void *)objc_opt_new();
    objc_msgSend(v41, "setFromDate:", oslog);
    objc_msgSend(v41, "setDeviceFilter:", 1);
    v40 = (void *)objc_opt_new();
    v5 = objc_msgSend(MEMORY[0x1E0D70D00], "yesWithProbability:", 0.00999999978);
    v6 = MEMORY[0x1E0C809B0];
    if (v5)
    {
      v7 = (void *)objc_opt_new();
      *(_QWORD *)buf = 0;
      v61 = buf;
      v62 = 0x2020000000;
      LODWORD(v63) = 0;
      v8 = (void *)objc_opt_new();
      v70 = 0;
      v66[0] = v6;
      v66[1] = 3221225472;
      v66[2] = __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_290;
      v66[3] = &unk_1E7E1B5F8;
      v68 = *(id *)(a1 + 32);
      v39 = v7;
      v67 = v39;
      v69 = buf;
      objc_msgSend(v44, "iterRankedNamedEntitiesWithQuery:error:block:", v8, &v70, v66);
      v9 = v70;

      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
      {
        pp_default_log_handle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v76) = 0;
          _os_log_debug_impl(&dword_1C392E000, v33, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring entity perplexity.", (uint8_t *)&v76, 2u);
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_44;
      }

      _Block_object_dispose(buf, 8);
      v10 = v39;
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    *(_QWORD *)buf = 0;
    v61 = buf;
    v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__15153;
    v64 = __Block_byref_object_dispose__15154;
    v65 = 0;
    v12 = (void *)objc_opt_new();
    v59 = v9;
    v52[0] = v6;
    v52[1] = 3221225472;
    v52[2] = __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_292;
    v52[3] = &unk_1E7E1B620;
    v53 = v43;
    v38 = v12;
    v54 = v38;
    v13 = v10;
    v55 = v13;
    v56 = v42;
    v57 = v40;
    v58 = buf;
    LOBYTE(v12) = objc_msgSend(v44, "iterNamedEntityRecordsWithQuery:error:block:", v41, &v59, v52);
    v39 = v13;
    v14 = v59;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v12;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      if (*((_QWORD *)v61 + 5))
      {
        pp_default_log_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v76) = 0;
          _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_INFO, "PPMaintenance: performing sampled logging of user created entity", (uint8_t *)&v76, 2u);
        }

        v37 = (void *)objc_opt_new();
        v16 = (void *)MEMORY[0x1C3BD6630]();
        v17 = objc_alloc(MEMORY[0x1E0C99E60]);
        v18 = (void *)objc_msgSend(v17, "initWithObjects:", *((_QWORD *)v61 + 5), 0);
        objc_autoreleasePoolPop(v16);
        objc_msgSend(v37, "setMatchingNames:", v18);

        objc_msgSend(v37, "setToDate:", oslog);
        *(_QWORD *)&v76 = 0;
        *((_QWORD *)&v76 + 1) = &v76;
        v77 = 0x3032000000;
        v78 = __Block_byref_object_copy__15153;
        v79 = __Block_byref_object_dispose__15154;
        v80 = 0;
        v50[4] = &v76;
        v51 = v14;
        v50[0] = v6;
        v50[1] = 3221225472;
        v50[2] = __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_299;
        v50[3] = &unk_1E7E1B648;
        v36 = objc_msgSend(v44, "iterNamedEntityRecordsWithQuery:error:block:", v37, &v51, v50);
        v35 = v51;

        if ((v36 & 1) != 0)
        {
          if (*(_QWORD *)(*((_QWORD *)&v76 + 1) + 40))
          {
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.UserWroteNamedEntity"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
            v20 = (void *)MEMORY[0x1C3BD6630]();
            v72[0] = CFSTR("source");
            objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 40), "source");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "bundleId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[PPMetricsUtils filterBundleId:](PPMetricsUtils, "filterBundleId:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v72[1] = CFSTR("algorithm");
            v73[0] = v22;
            objc_msgSend(MEMORY[0x1E0D70BD8], "describeAlgorithm:", objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 40), "algorithm"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v73[1] = v23;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_autoreleasePoolPop(v20);
            +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v19, v24, 1);

          }
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v25 = v38;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
          if (v26)
          {
            v27 = *(_QWORD *)v47;
            do
            {
              for (i = 0; i != v26; ++i)
              {
                if (*(_QWORD *)v47 != v27)
                  objc_enumerationMutation(v25);
                v29 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
                v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.NamedEntityDonationAnalyzed"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
                +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v30, v29, 1);

              }
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v71, 16);
            }
            while (v26);
          }

          pp_default_log_handle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v74 = 0;
            _os_log_impl(&dword_1C392E000, v31, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of sampled user created entity", v74, 2u);
          }
        }
        else
        {
          pp_default_log_handle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v74 = 138412290;
            v75 = v35;
            _os_log_error_impl(&dword_1C392E000, v31, OS_LOG_TYPE_ERROR, "PPMaintenance: error logging sampled user creation metrics: %@", v74, 0xCu);
          }
        }

        _Block_object_dispose(&v76, 8);
        v14 = v35;
        if ((v36 & 1) == 0)
          goto LABEL_43;
      }
      pp_default_log_handle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        LOWORD(v76) = 0;
        _os_log_impl(&dword_1C392E000, v32, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily perplexity entity statistics.", (uint8_t *)&v76, 2u);
      }
    }
    else
    {
      pp_default_log_handle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v76) = 138412290;
        *(_QWORD *)((char *)&v76 + 4) = v14;
        _os_log_error_impl(&dword_1C392E000, v32, OS_LOG_TYPE_ERROR, "PPMaintenance: Error logging entity perplexity: %@", (uint8_t *)&v76, 0xCu);
      }
    }

LABEL_43:
    v9 = v14;

    _Block_object_dispose(buf, 8);
LABEL_44:

LABEL_45:
    v11 = v42;
LABEL_46:

    goto LABEL_47;
  }
  pp_default_log_handle();
  oslog = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C392E000, oslog, OS_LOG_TYPE_DEBUG, "PPMaintenance: Deferring entity perplexity.", buf, 2u);
  }
LABEL_47:

}

void __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_290(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (((*(uint64_t (**)(void))(a1[5] + 16))() & 1) == 0)
    *a3 = 1;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(a1[6] + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);
  v7 = (void *)a1[4];
  v8 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v12, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v11);

  ++*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
}

void __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_292(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
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
  int v24;
  uint64_t v25;
  uint64_t v26;
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
  void *context;
  void *v43;
  int v44;
  _QWORD *v45;
  _QWORD v46[8];
  _QWORD v47[10];

  v47[8] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v3, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clusterIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v4, "containsObject:", v6);

  v43 = (void *)a1[5];
  context = (void *)MEMORY[0x1C3BD6630]();
  v46[0] = CFSTR("source");
  objc_msgSend(v3, "source");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bundleId");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPMetricsUtils filterBundleId:](PPMetricsUtils, "filterBundleId:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v39;
  v46[1] = CFSTR("algorithm");
  objc_msgSend(MEMORY[0x1E0D70BD8], "describeAlgorithm:", objc_msgSend(v3, "algorithm"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v38;
  v46[2] = CFSTR("category");
  v7 = (void *)MEMORY[0x1E0D70BC0];
  objc_msgSend(v3, "entity");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "describeCategory:", objc_msgSend(v37, "category"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v36;
  v46[3] = CFSTR("dynamicCategory");
  objc_msgSend(v3, "entity");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dynamicCategory");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "_pas_stringBackedByUTF8CString");
  v8 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v8;
  if (!v8)
    v8 = objc_opt_new();
  v28 = (void *)v8;
  v47[3] = v8;
  v46[4] = CFSTR("isNew");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v44 ^ 1u);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v32;
  v46[5] = CFSTR("groupId");
  objc_msgSend(v3, "source");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "groupId");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPMetricsUtils filterGroupIdAllowance:](PPMetricsUtils, "filterGroupIdAllowance:");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
    v9 = objc_opt_new();
  v27 = (void *)v9;
  v47[5] = v9;
  v46[6] = CFSTR("isUserCreated");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", objc_msgSend(v13, "flags") & 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v14;
  v46[7] = CFSTR("rank");
  v45 = a1;
  v15 = (void *)a1[6];
  objc_msgSend(v3, "entity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lowercaseString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
    v20 = (void *)objc_opt_new();
  v47[7] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)

  if (!v10)
  if (!v33)

  objc_autoreleasePoolPop(context);
  objc_msgSend(v43, "addObject:", v29);

  objc_msgSend(v3, "source");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPMaintenance _logDonationIntervalStatsForSource:domain:lastDonationTimes:lastBatchDonationTimes:]((uint64_t)PPMaintenance, v21, 1, (void *)v45[7], (void *)v45[8]);

  if (v44)
  {
    objc_msgSend(v3, "source");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "metadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "flags") & 1) == 0)
    {
LABEL_17:

      goto LABEL_18;
    }
    v24 = objc_msgSend(MEMORY[0x1E0D70D00], "yesWithProbability:", 0.100000001);

    if (v24)
    {
      objc_msgSend(v3, "entity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "name");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(v45[9] + 8);
      v23 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;
      goto LABEL_17;
    }
  }
LABEL_18:

}

void __50__PPMaintenance__registerLogNamedEntityPerplexity__block_invoke_299(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __45__PPMaintenance__registerLogTopicFirstSource__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const char **v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v3 = MEMORY[0x1E0C809B0];
  v23 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PPMaintenance__registerLogTopicFirstSource__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v19 = &v20;
  v4 = v2;
  v18 = v4;
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __45__PPMaintenance__registerLogTopicFirstSource__block_invoke_3;
  v15[3] = &unk_1E7E1B2B0;
  v5 = _Block_copy(aBlock);
  v16 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(v15);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  pp_maintenance_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "LogTopicFirstSource", ", buf, 2u);
  }

  v6[2](v6);
  pp_maintenance_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = *((unsigned __int8 *)v21 + 24);
    *(_DWORD *)buf = 67109120;
    v25 = v13;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_END, v8, "LogTopicFirstSource", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v21 + 24))
    v14 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v14 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v14);

  _Block_object_dispose(&v20, 8);
}

uint64_t __45__PPMaintenance__registerLogTopicFirstSource__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __45__PPMaintenance__registerLogTopicFirstSource__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[16];
  _BYTE v40[128];
  _QWORD v41[3];
  _QWORD v42[3];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_opt_new();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = a1;
  objc_msgSend(v3, "firstDonationSourceCountsWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v26 = v4;
    v27 = v2;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v5 = v4;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    v7 = v28;
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v36;
      obj = v5;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v36 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if (((*(uint64_t (**)(void))(*(_QWORD *)(v29 + 32) + 16))() & 1) == 0)
          {
            pp_default_log_handle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C392E000, v24, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring partially completed topic first source logging", buf, 2u);
            }

            goto LABEL_21;
          }
          v12 = (void *)MEMORY[0x1C3BD6630]();
          v41[0] = CFSTR("source");
          objc_msgSend(v11, "bundleId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPMetricsUtils filterBundleId:](PPMetricsUtils, "filterBundleId:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = v14;
          v41[1] = CFSTR("algorithm");
          objc_msgSend(MEMORY[0x1E0D70CD0], "describeAlgorithm:", objc_msgSend(v11, "algorithm"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v42[1] = v15;
          v41[2] = CFSTR("matchedCount");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "count"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v42[2] = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v12);
          objc_msgSend(v28, "addObject:", v17);

        }
        v5 = obj;
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v8)
          continue;
        break;
      }
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v28;
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.TopicInitialDonation"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
          +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v23, v22, 1);

        }
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v19);
      v2 = v27;
      v7 = v28;
    }
    else
    {
LABEL_21:
      v2 = v27;
    }
    v4 = v26;
    v25 = obj;
  }
  else
  {
    pp_default_log_handle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v25, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring bundle counts work due to nil result", buf, 2u);
    }
    v7 = v28;
  }

}

void __51__PPMaintenance__registerLogNamedEntityFirstSource__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void (**v6)(_QWORD);
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const char **v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v3 = MEMORY[0x1E0C809B0];
  v23 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PPMaintenance__registerLogNamedEntityFirstSource__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v19 = &v20;
  v4 = v2;
  v18 = v4;
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __51__PPMaintenance__registerLogNamedEntityFirstSource__block_invoke_3;
  v15[3] = &unk_1E7E1B2B0;
  v5 = _Block_copy(aBlock);
  v16 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(v15);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  pp_maintenance_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "LogNamedEntityFirstSource", ", buf, 2u);
  }

  v6[2](v6);
  pp_maintenance_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = *((unsigned __int8 *)v21 + 24);
    *(_DWORD *)buf = 67109120;
    v25 = v13;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_END, v8, "LogNamedEntityFirstSource", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v21 + 24))
    v14 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v14 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v14);

  _Block_object_dispose(&v20, 8);
}

uint64_t __51__PPMaintenance__registerLogNamedEntityFirstSource__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __51__PPMaintenance__registerLogNamedEntityFirstSource__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[16];
  _BYTE v40[128];
  _QWORD v41[3];
  _QWORD v42[3];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_opt_new();
  objc_msgSend(v2, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = a1;
  objc_msgSend(v3, "firstDonationSourceCountsWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v26 = v4;
    v27 = v2;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v5 = v4;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    v7 = v28;
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v36;
      obj = v5;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v36 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if (((*(uint64_t (**)(void))(*(_QWORD *)(v29 + 32) + 16))() & 1) == 0)
          {
            pp_default_log_handle();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C392E000, v24, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring partially completed entity first source logging", buf, 2u);
            }

            goto LABEL_21;
          }
          v12 = (void *)MEMORY[0x1C3BD6630]();
          v41[0] = CFSTR("source");
          objc_msgSend(v11, "bundleId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPMetricsUtils filterBundleId:](PPMetricsUtils, "filterBundleId:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = v14;
          v41[1] = CFSTR("algorithm");
          objc_msgSend(MEMORY[0x1E0D70BD8], "describeAlgorithm:", objc_msgSend(v11, "algorithm"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v42[1] = v15;
          v41[2] = CFSTR("matchedCount");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v11, "count"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v42[2] = v16;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v12);
          objc_msgSend(v28, "addObject:", v17);

        }
        v5 = obj;
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v8)
          continue;
        break;
      }
    }

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v28;
    v18 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.NamedEntityInitialDonation"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
          +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v23, v22, 1);

        }
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v19);
      v2 = v27;
      v7 = v28;
    }
    else
    {
LABEL_21:
      v2 = v27;
    }
    v4 = v26;
    v25 = obj;
  }
  else
  {
    pp_default_log_handle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v25, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring bundle counts work due to nil result", buf, 2u);
    }
    v7 = v28;
  }

}

void __45__PPMaintenance__registerDailyMetricsLogging__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char **v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  _QWORD aBlock[4];
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v34 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PPMaintenance__registerDailyMetricsLogging__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v30 = &v31;
  v5 = v3;
  v29 = v5;
  v6 = _Block_copy(aBlock);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v20[0] = v4;
  v20[1] = 3221225472;
  v20[2] = __45__PPMaintenance__registerDailyMetricsLogging__block_invoke_3;
  v20[3] = &unk_1E7E1B6C0;
  v7 = *(_QWORD *)(a1 + 32);
  v22 = &v24;
  v23 = v7;
  v8 = v6;
  v21 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(v20);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "DailyMetricsLogging", ", buf, 2u);
  }

  v9[2](v9);
  pp_maintenance_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    v16 = *((unsigned __int8 *)v32 + 24);
    *(_DWORD *)buf = 67109120;
    v36 = v16;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v15, OS_SIGNPOST_INTERVAL_END, v11, "DailyMetricsLogging", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v32 + 24))
    v17 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v17 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v17);
  if (!*((_BYTE *)v25 + 24) && *((_BYTE *)v32 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPMaintenance.m"), 1964, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: DailyMetricsLogging: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v31, 8);
}

uint64_t __45__PPMaintenance__registerDailyMetricsLogging__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __45__PPMaintenance__registerDailyMetricsLogging__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  NSObject *v24;
  char v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  uint8_t v30[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD aBlock[5];
  uint8_t buf[4];
  id v43;
  _QWORD v44[9];

  v44[7] = *MEMORY[0x1E0C80C00];
  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "PPMaintenance running periodic daily metrics logging", buf, 2u);
  }

  v3 = *(id *)(a1 + 32);
  v4 = objc_opt_self();
  pp_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_INFO, "PPMaintenance: beginning daily metrics generation.", buf, 2u);
  }

  v6 = (uint64_t (**)(_QWORD))v3;
  objc_opt_self();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.DeviceStats"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
  objc_autoreleasePoolPop((void *)MEMORY[0x1C3BD6630]());
  +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v7, MEMORY[0x1E0C9AA70], 1);

  if (v6[2](v6))
  {
    v29 = a1;
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke;
    aBlock[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    aBlock[4] = v4;
    v9 = _Block_copy(aBlock);
    v44[0] = v9;
    v40[0] = v8;
    v40[1] = 3221225472;
    v40[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_2;
    v40[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    v40[4] = v4;
    v10 = _Block_copy(v40);
    v44[1] = v10;
    v39[0] = v8;
    v39[1] = 3221225472;
    v39[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_3;
    v39[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    v39[4] = v4;
    v11 = _Block_copy(v39);
    v44[2] = v11;
    v38[0] = v8;
    v38[1] = 3221225472;
    v38[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_4;
    v38[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    v38[4] = v4;
    v12 = _Block_copy(v38);
    v44[3] = v12;
    v37[0] = v8;
    v37[1] = 3221225472;
    v37[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_5;
    v37[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    v37[4] = v4;
    v13 = _Block_copy(v37);
    v44[4] = v13;
    v36[0] = v8;
    v36[1] = 3221225472;
    v36[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_6;
    v36[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    v36[4] = v4;
    v14 = _Block_copy(v36);
    v44[5] = v14;
    v35[0] = v8;
    v35[1] = 3221225472;
    v35[2] = __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_7;
    v35[3] = &__block_descriptor_40_e18_B24__0__8___B___16l;
    v35[4] = v4;
    v15 = _Block_copy(v35);
    v44[6] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_opt_new();
    objc_msgSend(v16, "_pas_shuffledArrayUsingRng:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v19 = v18;
    v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v31, buf, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v19);
          if (!(*(unsigned int (**)(void))(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i) + 16))()
            || (v6[2](v6) & 1) == 0)
          {
            pp_default_log_handle();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v30 = 0;
              _os_log_impl(&dword_1C392E000, v26, OS_LOG_TYPE_INFO, "PPMaintenance: deferring daily metrics generation", v30, 2u);
            }

            v25 = 0;
            v24 = v19;
            goto LABEL_21;
          }
        }
        v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v31, buf, 16);
        if (v21)
          continue;
        break;
      }
    }

    pp_default_log_handle();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = 1;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_1C392E000, v24, OS_LOG_TYPE_INFO, "PPMaintenance: completed daily metrics generation.", v30, 2u);
    }
LABEL_21:
    a1 = v29;

  }
  else
  {
    v25 = 0;
  }

  v27 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v25;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    pp_default_log_handle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v27;
      _os_log_error_impl(&dword_1C392E000, v28, OS_LOG_TYPE_ERROR, "PPMaintenance failed to run periodic metrics logging operations: %@", buf, 0xCu);
    }

  }
}

uint64_t __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t (**v16)(_QWORD);
  uint64_t v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *context;
  uint8_t v39[8];
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint8_t buf[8];
  uint64_t v45;
  void (*v46)(uint64_t, void *, void *, _BYTE *);
  void *v47;
  id v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;

  v4 = a3;
  objc_opt_self();
  pp_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily database statistics.", buf, 2u);
  }

  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stats");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  v10 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rowCounts"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  v45 = 3221225472;
  v46 = __69__PPMaintenance__logDailyDatabaseStatisticsWithError_shouldContinue___block_invoke;
  v47 = &unk_1E7E1B450;
  v50 = v9;
  v13 = v4;
  v48 = v13;
  v49 = &v51;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", buf);

  objc_autoreleasePoolPop(v10);
  if (*((_BYTE *)v52 + 24))
    goto LABEL_5;
  v14 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("remoteRecordCounts"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v12;
  v40[1] = 3221225472;
  v40[2] = __69__PPMaintenance__logDailyDatabaseStatisticsWithError_shouldContinue___block_invoke_2;
  v40[3] = &unk_1E7E1B450;
  v43 = v9;
  v16 = (uint64_t (**)(_QWORD))v13;
  v41 = v16;
  v42 = &v51;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v40);

  objc_autoreleasePoolPop(v14);
  if (*((_BYTE *)v52 + 24))
  {
LABEL_5:
    v17 = 0;
  }
  else
  {
    objc_msgSend(v6, "checkWithError:", a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)MEMORY[0x1C3BD6630]();
    v20 = v19;
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("integrity_check"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isEqualToString:", CFSTR("ok")) & 1) != 0)
    {
      v23 = 0;
    }
    else
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("integrity_check"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v24, "count");

    }
    v25 = (void *)objc_opt_new();
    objc_msgSend(v25, "setSchemaVersion:", v9);
    objc_msgSend(v25, "setPragmaCheckType:", 1);
    +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "concatenatedTreatmentNames");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActiveTreatments:", v27);

    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trackScalarForMessage:updateCount:", v25, v23);

    objc_autoreleasePoolPop(context);
    v29 = v20;
    if ((v16[2](v16) & 1) == 0)
      goto LABEL_15;
    v30 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("foreign_key_check"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    v33 = (void *)objc_opt_new();
    objc_msgSend(v33, "setSchemaVersion:", v9);
    objc_msgSend(v33, "setPragmaCheckType:", 2);
    +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "concatenatedTreatmentNames");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActiveTreatments:", v35);

    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trackScalarForMessage:updateCount:", v33, v32);

    objc_autoreleasePoolPop(v30);
    if ((v16[2](v16) & 1) != 0)
    {
      pp_default_log_handle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_1C392E000, v37, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily database statistics.", v39, 2u);
      }

      v17 = 1;
    }
    else
    {
LABEL_15:
      v17 = 0;
    }

  }
  _Block_object_dispose(&v51, 8);

  return v17;
}

uint64_t __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int (**v3)(_QWORD);
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  NSObject *v31;
  uint8_t v33[8];
  const __CFString *v34;
  uint8_t buf[8];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_self();
  pp_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily named entity statistics.", buf, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "uniqueClusterIdentifierCount");

  if (!v3[2](v3))
    goto LABEL_12;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.NamedEntityStoreStats"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
  v9 = (void *)MEMORY[0x1C3BD6630]();
  v34 = CFSTR("uniqueItems");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v34, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v8, v11, 1);

  if (!v3[2](v3))
  {
LABEL_12:
    v30 = 0;
    goto LABEL_19;
  }
  objc_opt_self();
  pp_default_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily differentially private named entity statistics.", v33, 2u);
  }

  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.PersonalizationPortrait"), CFSTR("namedEntityDonationSource"), v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D328]), "initWithKey:", v16);
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "storage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "thirdPartyBundleIdsFromToday");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = (void *)MEMORY[0x1E0C9AA60];
  if (v20)
    v22 = (void *)v20;
  v23 = v22;

  v24 = objc_msgSend(v17, "record:", v23);
  pp_default_log_handle();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if ((v24 & 1) != 0)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v33 = 0;
      v27 = "PPMaintenance: Successfully logged named entity source bundle identifiers to differential privacy.";
      v28 = v26;
      v29 = OS_LOG_TYPE_INFO;
LABEL_15:
      _os_log_impl(&dword_1C392E000, v28, v29, v27, v33, 2u);
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    v27 = "PPMaintenance: unable to log named entity bundle identifiers to differential privacy.";
    v28 = v26;
    v29 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_15;
  }

  pp_default_log_handle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1C392E000, v31, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily named entity statistics.", v33, 2u);
  }

  v30 = 1;
LABEL_19:

  return v30;
}

BOOL __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_3(uint64_t a1, uint64_t *a2, void *a3)
{
  unsigned int (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  char v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  NSObject *v34;
  uint64_t v36;
  uint8_t v37[8];
  const __CFString *v38;
  uint8_t buf[24];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  pp_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily location statistics.", buf, 2u);
  }

  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "locationRecordsWithQuery:error:", v7, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8 != 0;
  if (!v8)
  {
    pp_default_log_handle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v36 = *a2;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v36;
      _os_log_error_impl(&dword_1C392E000, v34, OS_LOG_TYPE_ERROR, "PPMaintenance: error fetching location records: %@", buf, 0xCu);
    }
    goto LABEL_16;
  }
  +[PPLocationClusterID lookupTableWithRecords:](PPLocationClusterID, "lookupTableWithRecords:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v4[2](v4))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.LocationStoreStats"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
    v13 = (void *)MEMORY[0x1C3BD6630]();
    v38 = CFSTR("uniqueItems");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v38, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v13);
    +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v12, v15, 1);

    if (v4[2](v4))
    {
      objc_opt_self();
      pp_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily differentially private location statistics.", v37, 2u);
      }

      v17 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.PersonalizationPortrait"), CFSTR("locationDonationSource"), v19);

      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D328]), "initWithKey:", v20);
      +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "storage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "thirdPartyBundleIdsFromToday");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      v26 = (void *)MEMORY[0x1E0C9AA60];
      if (v24)
        v26 = (void *)v24;
      v27 = v26;

      v28 = objc_msgSend(v21, "record:", v27);
      pp_default_log_handle();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if ((v28 & 1) != 0)
      {
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          goto LABEL_21;
        *(_WORD *)v37 = 0;
        v31 = "PPMaintenance: Successfully logged location source bundle identifiers to differential privacy.";
        v32 = v30;
        v33 = OS_LOG_TYPE_INFO;
      }
      else
      {
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        *(_WORD *)v37 = 0;
        v31 = "PPMaintenance: unable to log location bundle identifiers to differential privacy.";
        v32 = v30;
        v33 = OS_LOG_TYPE_DEFAULT;
      }
      _os_log_impl(&dword_1C392E000, v32, v33, v31, v37, 2u);
LABEL_21:

      pp_default_log_handle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_1C392E000, v34, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily location statistics.", v37, 2u);
      }
LABEL_16:

      goto LABEL_17;
    }
  }
  v9 = 0;
LABEL_17:

  return v9;
}

uint64_t __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int (**v3)(_QWORD);
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  NSObject *v31;
  uint8_t v33[8];
  const __CFString *v34;
  uint8_t buf[8];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_self();
  pp_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily topic statistics.", buf, 2u);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "uniqueClusterIdentifierCount");

  if (!v3[2](v3))
    goto LABEL_12;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.TopicStoreStats"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
  v9 = (void *)MEMORY[0x1C3BD6630]();
  v34 = CFSTR("uniqueItems");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v34, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v8, v11, 1);

  if (!v3[2](v3))
  {
LABEL_12:
    v30 = 0;
    goto LABEL_19;
  }
  objc_opt_self();
  pp_default_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily differentially private topic statistics.", v33, 2u);
  }

  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@.%@.%@"), CFSTR("com.apple.PersonalizationPortrait"), CFSTR("topicDonationSource"), v15);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D328]), "initWithKey:", v16);
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "storage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "thirdPartyBundleIdsFromToday");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = (void *)MEMORY[0x1E0C9AA60];
  if (v20)
    v22 = (void *)v20;
  v23 = v22;

  v24 = objc_msgSend(v17, "record:", v23);
  pp_default_log_handle();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if ((v24 & 1) != 0)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v33 = 0;
      v27 = "PPMaintenance: Successfully logged topic source bundle identifiers to differential privacy.";
      v28 = v26;
      v29 = OS_LOG_TYPE_INFO;
LABEL_15:
      _os_log_impl(&dword_1C392E000, v28, v29, v27, v33, 2u);
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v33 = 0;
    v27 = "PPMaintenance: unable to log topic bundle identifiers to differential privacy.";
    v28 = v26;
    v29 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_15;
  }

  pp_default_log_handle();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_1C392E000, v31, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily topic statistics.", v33, 2u);
  }

  v30 = 1;
LABEL_19:

  return v30;
}

uint64_t __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  _UNKNOWN **v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  _BOOL8 v34;
  _BOOL8 v35;
  uint64_t v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  const char *v52;
  NSObject *v53;
  NSObject *v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *context;
  void *v71;
  uint64_t (**v72)(_QWORD);
  uint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t v82[16];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  _QWORD v88[6];
  _QWORD v89[6];
  uint8_t v90[128];
  uint8_t buf[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  pp_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily topic engagement statistics.", buf, 2u);
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setLimit:", +[PPMaintenance _kValue]());
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "mappedTopicsPendingFeedbackWithShouldContinueBlock:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v52 = "PPMaintenance: unable to fetch topic engagements.";
LABEL_43:
      _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, v52, buf, 2u);
    }
LABEL_44:
    v51 = 0;
    goto LABEL_51;
  }
  if ((v4[2](v4) & 1) == 0)
  {
    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v52 = "PPMaintenance: deferring topic engagements.";
      goto LABEL_43;
    }
    goto LABEL_44;
  }
  v62 = v6;
  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_233);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithArray:", v10);

  v66 = (void *)objc_opt_new();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v12 = v11;
  v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
  if (!v13)
  {
    v51 = 1;
    goto LABEL_50;
  }
  v14 = &off_1E7E12000;
  v15 = *(_QWORD *)v84;
  v72 = v4;
  v60 = v12;
  v61 = v8;
  v56 = a2;
  v58 = *(_QWORD *)v84;
  while (2)
  {
    v16 = 0;
    v57 = v13;
    do
    {
      if (*(_QWORD *)v84 != v15)
        objc_enumerationMutation(v12);
      v17 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v16);
      if ((((uint64_t (*)(void))v72[2])() & 1) == 0)
      {
        pp_default_log_handle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v82 = 0;
          _os_log_impl(&dword_1C392E000, v54, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring topic engagements.", v82, 2u);
        }
        v4 = v72;
        goto LABEL_48;
      }
      v59 = v16;
      objc_msgSend(v14[270], "defaultStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v17;
      objc_msgSend(v18, "scoresForTopicMapping:query:error:", v17, v62, a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "allKeys");
      v20 = objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        pp_default_log_handle();
        v54 = objc_claimAutoreleasedReturnValue();
        v4 = v72;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v82 = 0;
          _os_log_impl(&dword_1C392E000, v54, OS_LOG_TYPE_DEFAULT, "PPMaintenance: unable to fetch ranked items from topic store.", v82, 2u);
        }
LABEL_48:

        v51 = 0;
        goto LABEL_50;
      }
      v64 = v20;
      v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v20);
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      v21 = v8;
      v22 = v65;
      v4 = v72;
      v73 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
      if (v73)
      {
        v23 = *(_QWORD *)v79;
        v63 = v21;
        while (2)
        {
          for (i = 0; i != v73; ++i)
          {
            if (*(_QWORD *)v79 != v23)
              objc_enumerationMutation(v21);
            v25 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
            if ((v4[2](v4) & 1) == 0)
            {
              pp_default_log_handle();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v82 = 0;
                _os_log_impl(&dword_1C392E000, v53, OS_LOG_TYPE_DEFAULT, "PPMaintenance: deferring topic engagements.", v82, 2u);
              }

              v12 = v60;
              v8 = v61;
              v54 = v64;
              goto LABEL_48;
            }
            objc_msgSend(v25, "mappingId");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "isEqual:", v22);

            if (v27)
            {
              objc_msgSend(v25, "feedbackItems");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "firstObject");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v29, "itemString");
              v30 = objc_claimAutoreleasedReturnValue();
              if (v30)
              {
                v31 = (void *)v30;
                objc_msgSend(v29, "itemString");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v71, "containsObject:", v32);

                if (v33)
                {
                  if (objc_msgSend(v29, "itemFeedbackType") == 2
                    || objc_msgSend(v29, "itemFeedbackType") == 1)
                  {
                    v34 = 0;
                    v35 = 0;
                    v36 = 1;
                  }
                  else
                  {
                    v37 = objc_msgSend(v29, "itemFeedbackType");
                    v36 = 0;
                    v34 = v37 == 5;
                    v35 = v37 != 5;
                  }
                  context = (void *)MEMORY[0x1C3BD6630]();
                  v88[0] = CFSTR("rank");
                  v38 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v29, "itemString");
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "numberWithUnsignedInteger:", -[NSObject indexOfObject:](v64, "indexOfObject:", v69));
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  v89[0] = v68;
                  v88[1] = CFSTR("domain");
                  +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", 0);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  v89[1] = v67;
                  v88[2] = CFSTR("wasEngaged");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v36);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v89[2] = v39;
                  v88[3] = CFSTR("wasRejected");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v35);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v89[3] = v40;
                  v88[4] = CFSTR("wasOffered");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v34);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v88[5] = CFSTR("mappingId");
                  v89[4] = v41;
                  v89[5] = v65;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 6);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                  v22 = v65;
                  objc_autoreleasePoolPop(context);
                  objc_msgSend(v66, "addObject:", v42);

                  v21 = v63;
                }
              }

              v4 = v72;
            }
          }
          v73 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
          if (v73)
            continue;
          break;
        }
      }

      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v43 = v66;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v75;
        do
        {
          for (j = 0; j != v45; ++j)
          {
            if (*(_QWORD *)v75 != v46)
              objc_enumerationMutation(v43);
            v48 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
            v49 = (void *)MEMORY[0x1C3BD6630]();
            v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.EngagedToday"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
            +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v50, v48, 1);

            objc_autoreleasePoolPop(v49);
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
        }
        while (v45);
      }

      v12 = v60;
      v16 = v59 + 1;
      a2 = v56;
      v4 = v72;
      v8 = v61;
      v14 = &off_1E7E12000;
      v15 = v58;
    }
    while (v59 + 1 != v57);
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v83, buf, 16);
    v15 = v58;
    v51 = 1;
    if (v13)
      continue;
    break;
  }
LABEL_50:

  v6 = v62;
LABEL_51:

  return v51;
}

uint64_t __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t (**v4)(_QWORD);
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_opt_self();
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily location engagement statistics.", buf, 2u);
  }

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setLimit:", +[PPMaintenance _kValue]());
  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rankedLocationsWithQuery:clientProcessName:error:", v7, 0, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if ((v4[2](v4) & 1) != 0)
    {
      objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_240);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = +[PPMaintenance _logEngagementMetricsForDomain:feedback:count:shouldContinue:](v5, 2, v10, objc_msgSend(v9, "count"), v4);
    }
    else
    {
      pp_default_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_INFO, "PPMaintenance: deferring location engagement.", v13, 2u);
      }
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __63__PPMaintenance__logDailyMetricsWithError_shouldContinueBlock___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t (**v4)(_QWORD);
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = objc_opt_self();
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily named entity engagement statistics.", buf, 2u);
  }

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setLimit:", +[PPMaintenance _kValue]());
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rankedNamedEntitiesWithQuery:error:", v7, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if ((v4[2](v4) & 1) != 0)
    {
      objc_msgSend(v9, "_pas_mappedArrayWithTransform:", &__block_literal_global_238);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = +[PPMaintenance _logEngagementMetricsForDomain:feedback:count:shouldContinue:](v5, 1, v10, objc_msgSend(v9, "count"), v4);
    }
    else
    {
      pp_default_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_INFO, "PPMaintenance: deferring entity engagement.", v13, 2u);
      }
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)_kValue
{
  objc_opt_self();
  if (_kValue__pasOnceToken225 != -1)
    dispatch_once(&_kValue__pasOnceToken225, &__block_literal_global_195);
  return objc_msgSend((id)_kValue__pasExprOnceResult, "unsignedIntegerValue");
}

+ (uint64_t)_logEngagementMetricsForDomain:(void *)a3 feedback:(int)a4 count:(void *)a5 shouldContinue:
{
  id v8;
  uint64_t (**v9)(_QWORD);
  NSObject *v10;
  unsigned int v11;
  NSObject *v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  uint64_t (**v16)(_QWORD);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  unsigned int v26;
  NSObject *v27;
  id v28;
  NSObject *obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  NSObject *v36;
  id v37;
  unsigned int v38;
  int v39;
  char v40;
  uint8_t v41[128];
  uint8_t buf[4];
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_opt_self();
  pp_default_log_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v43 = a2;
    _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_INFO, "PPMaintenance: beginning logging of daily engagement statistics for domain %d", buf, 8u);
  }

  if ((v9[2](v9) & 1) != 0)
  {
    v11 = +[PPMaintenance _kValue]();
    if (v11 > 4)
    {
      v14 = v11 / 5;
      v15 = (void *)objc_opt_new();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __78__PPMaintenance__logEngagementMetricsForDomain_feedback_count_shouldContinue___block_invoke;
      v34[3] = &unk_1E7E1B4A0;
      v16 = v9;
      v37 = v16;
      v40 = a2;
      v38 = v14;
      v35 = v8;
      v39 = a4;
      v12 = v15;
      v36 = v12;
      objc_msgSend(v35, "enumerateObjectsUsingBlock:", v34);
      v17 = v9[2](v16);
      v13 = v17;
      if ((v17 & 1) != 0)
      {
        v26 = v17;
        v28 = v8;
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v27 = v12;
        obj = v12;
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v31 != v20)
                objc_enumerationMutation(obj);
              v22 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
              v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.EngagedToday"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
              +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v23, v22, 1);

            }
            v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
          }
          while (v19);
        }

        pp_default_log_handle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v43 = a2;
          _os_log_impl(&dword_1C392E000, v24, OS_LOG_TYPE_INFO, "PPMaintenance: completed logging of daily engagement statistics for domain %d.", buf, 8u);
        }
        v8 = v28;
        v12 = v27;
        v13 = v26;
      }
      else
      {
        pp_default_log_handle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          v43 = a2;
          _os_log_impl(&dword_1C392E000, v24, OS_LOG_TYPE_INFO, "PPMaintenance: deferring %d engagement before ratio.", buf, 8u);
        }
      }

    }
    else
    {
      pp_default_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v43 = a2;
        _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPMaintenance: no items found in domain %d", buf, 8u);
      }
      v13 = 1;
    }
  }
  else
  {
    pp_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v43 = a2;
      _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_INFO, "PPMaintenance: deferring %d engagement after decayed counts.", buf, 8u);
    }
    v13 = 0;
  }

  return v13;
}

void __78__PPMaintenance__logEngagementMetricsForDomain_feedback_count_shouldContinue___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  _BOOL8 v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  id obj;
  id v56;
  uint64_t v57;
  unsigned int v58;
  unint64_t v59;
  uint64_t v60;
  unsigned int v61;
  void *context;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[5];
  _QWORD v68[5];
  _QWORD v69[6];
  _QWORD v70[6];
  uint8_t buf[4];
  int v72;
  __int16 v73;
  unsigned int v74;
  uint8_t v75[4];
  int v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) != 0)
  {
    v52 = a3;
    v59 = a3 / *(_DWORD *)(a1 + 56);
    if (objc_msgSend(*(id *)(a1 + 32), "count") < v59)
      v59 = objc_msgSend(*(id *)(a1 + 32), "count") - 1;
    v61 = *(unsigned __int8 *)(a1 + 64);
    v53 = a1;
    v54 = v7;
    v58 = *(_DWORD *)(a1 + 60);
    v56 = v7;
    v8 = objc_opt_self();
    v9 = (void *)MEMORY[0x1C3BD6630](v8);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E7E59930, &unk_1E7E59948, &unk_1E7E59960, &unk_1E7E59978, 0);
    objc_autoreleasePoolPop(v9);
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    obj = v10;
    v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
    if (v60)
    {
      v11 = v61 - 1;
      v57 = *(_QWORD *)v64;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v64 != v57)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v12);
          v14 = MEMORY[0x1C3BD6630]();
          v15 = objc_msgSend(v13, "unsignedIntegerValue");
          context = (void *)v14;
          switch(v11)
          {
            case 0u:
              objc_msgSend(v56, "engagedExplicitly");
              goto LABEL_14;
            case 1u:
              objc_msgSend(v56, "engagedImplicitly");
              goto LABEL_14;
            case 2u:
              objc_msgSend(v56, "rejectedExplicitly");
              goto LABEL_14;
            case 3u:
              objc_msgSend(v56, "rejectedImplicitly");
LABEL_14:
              v17 = v16;
              break;
            default:
              pp_default_log_handle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                v72 = v15;
                v73 = 1024;
                v74 = v61;
                _os_log_impl(&dword_1C392E000, v27, OS_LOG_TYPE_DEFAULT, "PPMaintenance: attempted to log engagement metrics with unexpected feedback type %u and portrait domain %u", buf, 0xEu);
              }

              v17 = -1.0;
              break;
          }
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.FeedbackAtK"), CFSTR("com.apple.proactive.PersonalizationPortrait"));
          v19 = (void *)MEMORY[0x1C3BD6630]();
          v69[0] = CFSTR("k");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", +[PPMaintenance _kValue]());
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v70[0] = v20;
          v69[1] = CFSTR("evaluatedCount");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v58);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v70[1] = v21;
          v69[2] = CFSTR("bucket");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v59);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v70[2] = v22;
          v69[3] = CFSTR("domain");
          +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", v61);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v70[3] = v23;
          v69[4] = CFSTR("feedbackType");
          objc_msgSend(MEMORY[0x1E0D70B60], "stringForItemFeedbackType:", v15);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v70[4] = v24;
          v69[5] = CFSTR("rate");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v70[5] = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 6);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_autoreleasePoolPop(v19);
          +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", v18, v26, 1);

          objc_autoreleasePoolPop(context);
          ++v12;
          v11 = v61 - 1;
        }
        while (v60 != v12);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
        v60 = v28;
      }
      while (v28);
    }

    objc_msgSend(v56, "latestDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "timeIntervalSinceNow");
    v31 = v30;

    v7 = v54;
    if (v31 >= -86400.0)
    {
      objc_msgSend(v56, "engagedExplicitly");
      v33 = v32;
      v34 = objc_msgSend(v56, "engagedImplicitly");
      v36 = v33 + v35;
      if (v33 + v35 <= 0.0)
      {
        objc_msgSend(v56, "rejectedExplicitly");
        v42 = v41;
        v34 = objc_msgSend(v56, "rejectedImplicitly");
        v37 = v42 + v43 > 0.0;
        v38 = v37;
      }
      else
      {
        v37 = 0;
        v38 = 1;
      }
      v44 = *(void **)(v53 + 40);
      v45 = (void *)MEMORY[0x1C3BD6630](v34);
      v67[0] = CFSTR("rank");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v52);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v46;
      v67[1] = CFSTR("domain");
      +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", *(unsigned __int8 *)(v53 + 64));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v47;
      v67[2] = CFSTR("wasEngaged");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v36 > 0.0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v68[2] = v48;
      v67[3] = CFSTR("wasRejected");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v37);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v68[3] = v49;
      v67[4] = CFSTR("wasOffered");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v38);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v68[4] = v50;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v68, v67, 5);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v45);
      objc_msgSend(v44, "addObject:", v51);

    }
  }
  else
  {
    pp_default_log_handle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = *(unsigned __int8 *)(a1 + 64);
      *(_DWORD *)v75 = 67109120;
      v76 = v40;
      _os_log_impl(&dword_1C392E000, v39, OS_LOG_TYPE_INFO, "PPMaintenance: deferring %d engagement in loop.", v75, 8u);
    }

    *a4 = 1;
  }

}

id __79__PPMaintenance__logNamedEntityEngagementMetricsWithError_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "clusterIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decayedFeedbackCountsForClusterIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __24__PPMaintenance__kValue__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "engagementKValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(v2, "count")));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &unk_1E7E59918;
  }

  v4 = (void *)_kValue__pasExprOnceResult;
  _kValue__pasExprOnceResult = (uint64_t)v3;

  objc_autoreleasePoolPop(v0);
}

id __76__PPMaintenance__logLocationEngagementMetricsWithError_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "clusterIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decayedFeedbackCountsForClusterIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __73__PPMaintenance__logTopicEngagementMetricsWithError_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mappingId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_stringBackedByUTF8CString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __69__PPMaintenance__logDailyDatabaseStatisticsWithError_shouldContinue___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v7 = a3;
  v8 = a2;
  v13 = (id)objc_opt_new();
  objc_msgSend(v13, "setSchemaVersion:", *(unsigned int *)(a1 + 48));
  objc_msgSend(v13, "setTableName:", v8);

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "concatenatedTreatmentNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActiveTreatments:", v10);

  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v11, "trackScalarForMessage:updateCount:", v13, v12);
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __69__PPMaintenance__logDailyDatabaseStatisticsWithError_shouldContinue___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v7 = a3;
  v8 = a2;
  v13 = (id)objc_opt_new();
  objc_msgSend(v13, "setSchemaVersion:", *(unsigned int *)(a1 + 48));
  objc_msgSend(v13, "setTableName:", v8);

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "concatenatedTreatmentNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActiveTreatments:", v10);

  objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v11, "trackScalarForMessage:updateCount:", v13, v12);
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __37__PPMaintenance__registerRTCSendLogs__block_invoke()
{
  NSObject *v0;
  os_signpost_id_t v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];
  uint8_t v10[16];

  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_signpost_id_generate(v0);

  pp_maintenance_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v1, "RTCSendLogs", ", buf, 2u);
  }

  pp_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_debug_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEBUG, "PPMaintenance running sendRTCLogs", v10, 2u);
  }

  +[PPEventMetricsLogger defaultLogger](PPEventMetricsLogger, "defaultLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendRTCLogsWithCompletion:", &__block_literal_global_149_15297);

  pp_maintenance_signpost_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v7, OS_SIGNPOST_INTERVAL_END, v1, "RTCSendLogs", " enableTelemetry=YES ", v8, 2u);
  }

  PPPostNotification((const char *)kPPMaintenanceJobCompletedNotification);
}

void __37__PPMaintenance__registerRTCSendLogs__block_invoke_147(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4 || (a2 & 1) == 0)
  {
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_error_impl(&dword_1C392E000, v5, OS_LOG_TYPE_ERROR, "PPMaintenance failed to send RTCLogs: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __52__PPMaintenance__registerNamedEntityRepairAndExport__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__PPMaintenance__registerNamedEntityRepairAndExport__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __52__PPMaintenance__registerNamedEntityRepairAndExport__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "NamedEntityRepairAndExport", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "NamedEntityRepairAndExport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 950, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityRepairAndExport: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __52__PPMaintenance__registerNamedEntityRepairAndExport__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __52__PPMaintenance__registerNamedEntityRepairAndExport__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityRepairAndExport: starting", buf, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    if (v6)
    {
      pp_default_log_handle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityRepairAndExport: fixing named entity stream", v13, 2u);
      }

      objc_msgSend(v3, "storage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fixupDKEventsWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));

      objc_msgSend(v3, "storage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fixupDKEventsMetadataWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));

      if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
      {
        objc_msgSend(v3, "storage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "exportRecordsToDKWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));

        pp_default_log_handle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityRepairAndExport: finished", v12, 2u);
        }

      }
    }
  }

}

void __46__PPMaintenance__registerTopicRepairAndExport__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PPMaintenance__registerTopicRepairAndExport__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __46__PPMaintenance__registerTopicRepairAndExport__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "TopicRepairAndExport", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "TopicRepairAndExport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 892, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicRepairAndExport: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __46__PPMaintenance__registerTopicRepairAndExport__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __46__PPMaintenance__registerTopicRepairAndExport__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicRepairAndExport: starting", buf, 2u);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    if (v6)
    {
      pp_default_log_handle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicRepairAndExport: fixing topic stream", v15, 2u);
      }

      objc_msgSend(v3, "storage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fixupDKEventsWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));

      objc_msgSend(v3, "storage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fixupDKEventsMetadataWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));

      if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
      {
        pp_default_log_handle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicRepairAndExport: exporting locally generated topics", v14, 2u);
        }

        objc_msgSend(v3, "storage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "exportRecordsToDKWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));

        pp_default_log_handle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicRepairAndExport: finished", v13, 2u);
        }

      }
    }
  }

}

void __43__PPMaintenance__registerNamedEntityImport__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PPMaintenance__registerNamedEntityImport__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __43__PPMaintenance__registerNamedEntityImport__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "NamedEntityImport", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "NamedEntityImport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 1059, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityImport: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __43__PPMaintenance__registerNamedEntityImport__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __43__PPMaintenance__registerNamedEntityImport__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[15];
  char v7;
  uint8_t buf[16];

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityImport: starting", buf, 2u);
  }

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = 0;
    while ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    {
      objc_msgSend(v4, "importRemotelyGeneratedNamedEntityDKEventsWithLimit:isComplete:shouldContinueBlock:", objc_msgSend(v4, "duetReadBatchSize"), &v7, *(_QWORD *)(a1 + 32));
      if (v7)
        goto LABEL_9;
    }
    if (!v7)
      goto LABEL_12;
LABEL_9:
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: NamedEntityImport: finished", v6, 2u);
    }

  }
LABEL_12:

}

void __37__PPMaintenance__registerTopicImport__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__PPMaintenance__registerTopicImport__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __37__PPMaintenance__registerTopicImport__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "TopicImport", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "TopicImport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 1005, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicImport: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __37__PPMaintenance__registerTopicImport__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __37__PPMaintenance__registerTopicImport__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[15];
  char v7;
  uint8_t buf[16];

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicImport: starting", buf, 2u);
  }

  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = 0;
    while ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    {
      objc_msgSend(v4, "importRemotelyGeneratedTopicDKEventsWithLimit:isComplete:shouldContinueBlock:", objc_msgSend(v4, "duetReadBatchSize"), &v7, *(_QWORD *)(a1 + 32));
      if (v7)
        goto LABEL_9;
    }
    if (!v7)
      goto LABEL_12;
LABEL_9:
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: TopicImport: finished", v6, 2u);
    }

  }
LABEL_12:

}

+ (id)singletonWarmupQueue
{
  objc_opt_self();
  if (singletonWarmupQueue__pasOnceToken4 != -1)
    dispatch_once(&singletonWarmupQueue__pasOnceToken4, &__block_literal_global_15323);
  return (id)singletonWarmupQueue__pasExprOnceResult;
}

void __40__PPMaintenance__registerContactsImport__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v27 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PPMaintenance__registerContactsImport__block_invoke_3;
  aBlock[3] = &unk_1E7E1B288;
  v23 = &v24;
  v5 = v3;
  v22 = v5;
  v19[0] = v4;
  v19[1] = 3221225472;
  v19[2] = __40__PPMaintenance__registerContactsImport__block_invoke_4;
  v19[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v20 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v19);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ContactsImport", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v25 + 24);
    *(_DWORD *)buf = 67109120;
    v29 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "ContactsImport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v25 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v25 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 625, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "PPContactsImporter: deferring";
LABEL_17:
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    }
  }
  else
  {
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "PPContactsImporter: import complete.";
      goto LABEL_17;
    }
  }

  _Block_object_dispose(&v24, 8);
}

uint64_t __40__PPMaintenance__registerContactsImport__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __40__PPMaintenance__registerContactsImport__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: beginning import", buf, 2u);
  }

  +[PPContactsImporter defaultInstance](PPContactsImporter, "defaultInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "importContactsDataWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: failed to create importer.", v6, 2u);
    }

  }
}

id __40__PPMaintenance__registerContactsImport__block_invoke()
{
  return +[PPContactsImporter defaultInstance](PPContactsImporter, "defaultInstance");
}

void __37__PPMaintenance_singletonWarmupQueue__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.PersonalizationPortrait.singletonWarmupQueue", 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)singletonWarmupQueue__pasExprOnceResult;
  singletonWarmupQueue__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void __40__PPMaintenance__registerEventKitImport__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__PPMaintenance__registerEventKitImport__block_invoke_3;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __40__PPMaintenance__registerEventKitImport__block_invoke_4;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "EventKitImport", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "EventKitImport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 520, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: EventKitImport: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __40__PPMaintenance__registerEventKitImport__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __40__PPMaintenance__registerEventKitImport__block_invoke_4(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;

  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    v2 = +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    v3 = +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    v4 = +[PPLocalEventStore defaultStore](PPLocalEventStore, "defaultStore");
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    +[PPEventKitImporter defaultInstance](PPEventKitImporter, "defaultInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v6, "importEventDataWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));

  }
}

void __40__PPMaintenance__registerEventKitImport__block_invoke()
{
  id v0;

  +[PPEventKitImporter defaultInstance](PPEventKitImporter, "defaultInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "deleteAndReimportAllData");

}

uint64_t __41__PPMaintenance__registerHealthKitImport__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t result;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getHKHealthStoreClass_softClass;
  v9 = getHKHealthStoreClass_softClass;
  if (!getHKHealthStoreClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getHKHealthStoreClass_block_invoke;
    v5[3] = &unk_1E7E1F798;
    v5[4] = &v6;
    __getHKHealthStoreClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  result = objc_msgSend(v3, "isHealthDataAvailable");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __41__PPMaintenance__registerHealthKitImport__block_invoke_100(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char **v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v26 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__PPMaintenance__registerHealthKitImport__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v22 = &v23;
  v5 = v3;
  v21 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __41__PPMaintenance__registerHealthKitImport__block_invoke_3;
  v18[3] = &unk_1E7E1B2B0;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "HealthKitImport", ", buf, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v14;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "HealthKitImport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v15 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v15 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v15);
  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 574, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "PPHealthKitImporter: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __41__PPMaintenance__registerHealthKitImport__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __41__PPMaintenance__registerHealthKitImport__block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  PPHealthKitImporter *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  pp_default_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v2, OS_LOG_TYPE_DEFAULT, "PPHealthKitImporter: beginning import", buf, 2u);
  }

  +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[PPHealthKitImporter initWithDatabase:]([PPHealthKitImporter alloc], "initWithDatabase:", v3);
    -[PPHealthKitImporter importHealthKitDataWithShouldContinueBlock:](v4, "importHealthKitDataWithShouldContinueBlock:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    pp_default_log_handle();
    v4 = (PPHealthKitImporter *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1C392E000, &v4->super, OS_LOG_TYPE_DEFAULT, "PPHealthKitImporter: failed to create database, giving up.", v5, 2u);
    }
  }

}

void __36__PPMaintenance__registerMapsImport__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const char **v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __36__PPMaintenance__registerMapsImport__block_invoke_2;
  v20 = &unk_1E7E1B288;
  v22 = &v23;
  v4 = v3;
  v21 = v4;
  v5 = _Block_copy(&v17);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MapsImport", ", buf, 2u);
  }

  v10 = v5;
  +[PPMapsSupport importMapsDataWithShouldContinueBlock:](PPMapsSupport, "importMapsDataWithShouldContinueBlock:", v10, v17, v18, v19, v20);
  pp_maintenance_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = *((unsigned __int8 *)v24 + 24);
    *(_DWORD *)buf = 67109120;
    v28 = v13;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v12, OS_SIGNPOST_INTERVAL_END, v7, "MapsImport", " enableTelemetry=YES Deferred=%{signpost.telemetry:number1, Name=Deferred}d", buf, 8u);
  }

  if (*((_BYTE *)v24 + 24))
    v14 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v14 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v14);

  if (*((_BYTE *)v24 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v4, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 468, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "Portrait maintenance: MapsImport: deferring", buf, 2u);
    }

  }
  _Block_object_dispose(&v23, 8);

}

uint64_t __36__PPMaintenance__registerMapsImport__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __43__PPMaintenance__registerCoreRoutineImport__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const char **v14;
  NSObject *v15;
  void *v16;
  uint8_t v17[16];
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  _QWORD aBlock[4];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v3 = a2;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v4 = MEMORY[0x1E0C809B0];
  v27 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__PPMaintenance__registerCoreRoutineImport__block_invoke_2;
  aBlock[3] = &unk_1E7E1B288;
  v23 = &v24;
  v5 = v3;
  v22 = v5;
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __43__PPMaintenance__registerCoreRoutineImport__block_invoke_3;
  v18[3] = &unk_1E7E1B2F8;
  v6 = _Block_copy(aBlock);
  v19 = v6;
  v20 = &v24;
  v7 = (void (**)(_QWORD))_Block_copy(v18);
  PPPostNotification((const char *)kPPMaintenanceJobStartedNotification);
  pp_maintenance_signpost_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  pp_maintenance_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "CoreRoutineImport", ", v17, 2u);
  }

  v7[2](v7);
  pp_maintenance_signpost_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v13, OS_SIGNPOST_INTERVAL_END, v9, "CoreRoutineImport", " enableTelemetry=YES ", v17, 2u);
  }

  if (*((_BYTE *)v25 + 24))
    v14 = (const char **)&kPPMaintenanceJobDeferredNotification;
  else
    v14 = (const char **)&kPPMaintenanceJobCompletedNotification;
  PPPostNotification(*v14);
  if (*((_BYTE *)v25 + 24))
  {
    if (!xpc_activity_set_state((xpc_activity_t)v5, 3))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPMaintenance.m"), 432, CFSTR("Unexpected failure of deferral"));

    }
    pp_default_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "PPMaintenance: CoreRoutineImport: deferring", v17, 2u);
    }

  }
  _Block_object_dispose(&v24, 8);

}

uint64_t __43__PPMaintenance__registerCoreRoutineImport__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v1 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    result = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return result;
  }
  return 1;
}

void __43__PPMaintenance__registerCoreRoutineImport__block_invoke_3(uint64_t a1)
{
  BOOL v2;
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v2 = +[PPRoutineSupport importCoreRoutineDataWithError:shouldContinueBlock:](PPRoutineSupport, "importCoreRoutineDataWithError:shouldContinueBlock:", &v5, *(_QWORD *)(a1 + 32));
  v3 = v5;
  if (!v2)
  {
    pp_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_error_impl(&dword_1C392E000, v4, OS_LOG_TYPE_ERROR, "PPMaintenance: CoreRoutineImport: importCoreRoutineDataWithError failed: %@", buf, 0xCu);
    }
    goto LABEL_7;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    pp_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPMaintenance: CoreRoutineImport: completed successfully.", buf, 2u);
    }
LABEL_7:

  }
}

@end
