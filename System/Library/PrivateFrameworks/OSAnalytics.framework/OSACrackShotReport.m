@implementation OSACrackShotReport

- (OSACrackShotReport)initWithPid:(int)a3 procName:(id)a4 bundleID:(id)a5 exitSnapshot:(exit_reason_snapshot *)a6 reason:(id)a7
{
  uint64_t v11;
  id v13;
  id v14;
  id v15;
  id *v16;
  OSACrackShotReport *v17;
  uint64_t v18;
  NSDictionary *termination_info;
  void *v20;
  void *v21;
  unint64_t v22;
  double v23;
  mach_timebase_info info;
  objc_super v26;

  v11 = *(_QWORD *)&a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)OSACrackShotReport;
  v16 = -[OSAStackShotReport initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:](&v26, sel_initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags_, v11, v13, 0, 0, 0, 0);
  v17 = (OSACrackShotReport *)v16;
  if (v16)
  {
    objc_storeStrong(v16 + 10, a4);
    objc_storeStrong((id *)&v17->_bundleID, a5);
    -[OSACrackShotReport decode_reason:reason:](v17, "decode_reason:reason:", a6, v15);
    v18 = objc_claimAutoreleasedReturnValue();
    termination_info = v17->_termination_info;
    v17->_termination_info = (NSDictionary *)v18;

    -[OSAStackShotReport setReason:](v17, "setReason:", v15);
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "getTaskingKey:", CFSTR("disableWatchdogStackshot"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_isSnapshotDisabled = objc_msgSend(v21, "BOOLValue");

    v17->_isSystemWatchdog = 1;
    info = 0;
    if (!mach_timebase_info(&info))
    {
      if (info.denom)
      {
        LODWORD(v22) = info.numer;
        v23 = (double)v22 * 0.000000001 / (double)info.denom;
        v17->_awakeSystemUptime = (unint64_t)(v23 * (double)mach_absolute_time());
      }
    }
  }

  return v17;
}

- (id)initForPid:(int)a3 exitSnapshot:(exit_reason_snapshot *)a4 reason:(id)a5
{
  uint64_t v6;
  ipc_space_t *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  OSACrackShotReport *v14;
  void *v15;
  uint64_t v16;
  NSString *procPath;
  void *v18;
  uint64_t v19;
  NSString *bundleID;
  uint8_t v22[16];
  uint8_t buf[12];
  mach_port_name_t name;

  v6 = *(_QWORD *)&a3;
  name = 0;
  v8 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  v9 = a5;
  if (task_read_for_pid())
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "failed task_read_for_pid", v22, 2u);
    }
    v10 = 0;
    v11 = 0;
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAFED0]), "initWithTask:", name);
    v10 = v12;
    if (v12)
    {
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v13, "copy");

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "failed to create VMUProcInfo", buf, 2u);
      }
      v11 = 0;
    }
    mach_port_deallocate(*v8, name);
  }
  v14 = -[OSACrackShotReport initWithPid:procName:bundleID:exitSnapshot:reason:](self, "initWithPid:procName:bundleID:exitSnapshot:reason:", v6, v11, 0, a4, v9);

  if (v14)
  {
    v14->_isSystemWatchdog = 0;
    if (v10)
    {
      *(&v14->_cpuType + 1) = objc_msgSend(v10, "cpuType");
      objc_msgSend(v10, "userAppName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      procPath = v14->_procPath;
      v14->_procPath = (NSString *)v16;

      if (-[NSString length](v14->_procPath, "length"))
      {
        +[OSAReport findBundleAtPath:withKeys:bundleURL:](OSAReport, "findBundleAtPath:withKeys:bundleURL:", v14->_procPath, &unk_1E4DFEEA0, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("CFBundleIdentifier"));
        v19 = objc_claimAutoreleasedReturnValue();
        bundleID = v14->_bundleID;
        v14->_bundleID = (NSString *)v19;

      }
    }
  }

  return v14;
}

- (id)problemType
{
  if (self->_isSystemWatchdog)
    return CFSTR("409");
  else
    return CFSTR("509");
}

- (id)reportNamePrefix
{
  NSString *appName;
  __CFString *v3;

  appName = self->super._appName;
  if (appName)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), appName);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("unknown");
  }
  return v3;
}

- (id)additionalIPSMetadata
{
  const __CFString *appName;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *bundleID;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  appName = (const __CFString *)self->super._appName;
  if (!appName)
    appName = CFSTR("Unknown");
  v14[0] = CFSTR("name");
  v14[1] = CFSTR("app_name");
  v15[0] = appName;
  v15[1] = appName;
  v14[2] = CFSTR("share_with_app_devs");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "optIn3rdParty"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v6;
  v14[3] = CFSTR("incident_id");
  -[OSAReport incidentID](self, "incidentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[OSAReport etlKey](self, "etlKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[OSAReport etlKey](self, "etlKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("etl_key"));

  }
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", bundleID, CFSTR("bundleID"));
  return v9;
}

- (id)decode_reason:(exit_reason_snapshot *)a3 reason:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)objc_opt_new();
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3->ers_code);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("code"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3->ers_flags);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("flags"));

    if (a3->ers_namespace == 20)
    {
      v18 = &unk_1E4DFD9F0;
      v19[0] = CFSTR("monitoring timed out for service");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3->ers_code);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("indicator"));

      v12 = CFSTR("WATCHDOG");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<0x%X>"), a3->ers_namespace);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = CFSTR("<NO_NS>");
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("namespace"));
  if (v5)
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", CFSTR("stringByTrimming"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF != ''"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filteredArrayUsingPredicate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count"))
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("details"));

  }
  return v6;
}

- (id)decode_cpuType
{
  return OSACPUTypeToString(*((unsigned int *)&self->_cpuType + 1));
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  void (**v5)(id, void *);
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
  NSString *appName;
  void *v19;
  NSString *procPath;
  void *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  NSDictionary *termination_info;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  OSABinaryImageCatalog *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSDictionary *additionalPayload;
  void *v42;
  NSMutableArray *notes;
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
  _QWORD v54[2];
  _QWORD v55[2];
  const __CFString *v56;
  NSDictionary *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  uint64_t v69;
  const __CFString *v70;
  NSDictionary *v71;
  const __CFString *v72;
  NSString *bundleID;
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  NSString *v77;
  const __CFString *v78;
  NSString *v79;
  const __CFString *v80;
  void *v81;
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[10];
  _QWORD v85[12];

  v85[10] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  v84[0] = CFSTR("incident");
  -[OSAReport incidentID](self, "incidentID");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v53;
  v84[1] = CFSTR("crashReporterKey");
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "crashReporterKey");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v51;
  v84[2] = CFSTR("modelCode");
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "modelCode");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v85[2] = v49;
  v84[3] = CFSTR("pid");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->super._pid);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v85[3] = v48;
  v84[4] = CFSTR("cpuType");
  -[OSACrackShotReport decode_cpuType](self, "decode_cpuType");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v85[4] = v47;
  v84[5] = CFSTR("osVersion");
  v82[0] = CFSTR("train");
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "osTrain");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = v45;
  v82[1] = CFSTR("build");
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v7;
  v82[2] = CFSTR("releaseType");
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "releaseType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v83[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v85[5] = v10;
  v84[6] = CFSTR("captureTime");
  OSADateFormat(2u, self->super.super._capture_time);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v85[6] = v11;
  v85[7] = &unk_1E4DFDA08;
  v84[7] = CFSTR("deployVersion");
  v84[8] = CFSTR("variant");
  v84[9] = CFSTR("variantVersion");
  v85[8] = CFSTR("stackshot");
  v85[9] = &unk_1E4DFDA20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v12);

  -[OSACrackShotReport problemType](self, "problemType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSALog commonFieldsForBody:](OSALog, "commonFieldsForBody:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v14);

  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v15, "appleInternal");

  if ((_DWORD)v13)
  {
    v16 = (void *)MGCopyAnswer();
    v80 = CFSTR("codeName");
    v81 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v17);

  }
  if (-[NSString length](self->super._appName, "length"))
  {
    appName = self->super._appName;
    v78 = CFSTR("procName");
    v79 = appName;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v79, &v78, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v19);

  }
  if (-[NSString length](self->_procPath, "length"))
  {
    procPath = self->_procPath;
    v76 = CFSTR("procPath");
    v77 = procPath;
    v21 = (void *)MEMORY[0x1E0C99D80];
    v22 = procPath;
    objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v5[2](v5, v23);
  }
  if (self->_bundleID)
  {
    bundleID = self->_bundleID;
    v74 = CFSTR("bundleInfo");
    v72 = CFSTR("CFBundleIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &bundleID, &v72, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v25);

  }
  if (-[NSDictionary count](self->_termination_info, "count"))
  {
    termination_info = self->_termination_info;
    v70 = CFSTR("termination");
    v71 = termination_info;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v27);

  }
  objc_msgSend((id)objc_opt_class(), "bootSessionUUID");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v28;
  if (v28)
  {
    v68 = CFSTR("bootSessionUUID");
    v69 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v30);

  }
  v66 = CFSTR("uptime");
  objc_msgSend((id)objc_opt_class(), "reduceToTwoSigFigures:", self->_awakeSystemUptime);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v32);

  if (!-[OSACrackShotReport isSnapshotDisabled](self, "isSnapshotDisabled"))
  {
    if (self->super._ss_trace_buffer)
    {
      v64 = &unk_1E4DFDA38;
      v65 = CFSTR("stackshot");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v33);

      v34 = objc_alloc_init(OSABinaryImageCatalog);
      -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:](self, "decodeKCDataWithBlock:withTuning:usingCatalog:", v5, &unk_1E4DFEAD0, v34);
      v62 = CFSTR("binaryImages");
      -[OSABinaryImageCatalog reportUsedImages](v34, "reportUsedImages");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v36);

      -[OSABinaryImageCatalog appendNotesTo:](v34, "appendNotesTo:", self->super.super._notes);
      v60 = &unk_1E4DFDA50;
      v61 = &stru_1E4DEECB8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v37);

    }
    -[OSACrackShotReport spindump](self, "spindump");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v58 = CFSTR("spindump");
      -[OSACrackShotReport spindump](self, "spindump");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v40);

    }
  }
  additionalPayload = self->super._additionalPayload;
  if (additionalPayload)
  {
    v56 = CFSTR("additionalPayload");
    v57 = additionalPayload;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v42);

  }
  -[NSMutableArray addObject:](self->super.super._notes, "addObject:", CFSTR("This is a watchdog-triggered termination event, and not expected to be well-represented in the legacy crash format"));
  if (self->_isSnapshotDisabled)
    -[NSMutableArray addObject:](self->super.super._notes, "addObject:", CFSTR("stackshot inclusion disabled"));
  if (-[NSMutableArray count](self->super.super._notes, "count"))
  {
    notes = self->super.super._notes;
    v54[0] = CFSTR("reportNotes");
    v54[1] = &unk_1E4DFDA68;
    v55[0] = notes;
    v55[1] = &unk_1E4DFD9F0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v44);

  }
}

- (BOOL)saveWithOptions:(id)a3
{
  BOOL v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OSACrackShotReport;
  v4 = -[OSAReport saveWithOptions:](&v8, sel_saveWithOptions_, a3);
  if (self->_isSystemWatchdog)
    v5 = 3;
  else
    v5 = 4;
  -[OSAReport logfile](self, "logfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSADiagnosticsReporterSupport handleDiagnosticLog:logPath:completion:](OSADiagnosticsReporterSupport, "handleDiagnosticLog:logPath:completion:", v5, v6, 0);

  return v4;
}

- (NSDictionary)spindump
{
  return self->_spindump;
}

- (void)setSpindump:(id)a3
{
  objc_storeStrong((id *)&self->_spindump, a3);
}

- (BOOL)isSnapshotDisabled
{
  return self->_isSnapshotDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spindump, 0);
  objc_storeStrong((id *)&self->_termination_info, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_procPath, 0);
}

@end
