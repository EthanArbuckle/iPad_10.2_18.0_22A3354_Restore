@implementation OSAStackShotReport

- (id)initForPid:(int)a3 process:(id)a4 withReason:(id)a5 exceptionCode:(int64_t *)a6 exceptionCodeCount:(unsigned int)a7 stackshotFlags:(unsigned int)a8
{
  id v15;
  id v16;
  OSAStackShotReport *v17;
  OSAStackShotReport *v18;
  uint64_t v19;
  NSMutableArray *frontmostPids;
  int64_t *v21;
  uint64_t v22;
  NSMutableDictionary *extras;
  void *v24;
  int v25;
  objc_super v27;

  v15 = a4;
  v16 = a5;
  v27.receiver = self;
  v27.super_class = (Class)OSAStackShotReport;
  v17 = -[OSAReport init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_pid = a3;
    objc_storeStrong((id *)&v17->_appName, a4);
    -[OSAStackShotReport setReason:](v18, "setReason:", v16);
    v19 = objc_opt_new();
    frontmostPids = v18->_frontmostPids;
    v18->_frontmostPids = (NSMutableArray *)v19;

    v18->_ss_sequence = -1;
    v18->_exceptionCodeCount = a7;
    v21 = (int64_t *)malloc_type_calloc(8uLL, a7, 0xB20B5314uLL);
    v18->_exceptionCodes = v21;
    memcpy(v21, a6, 8 * v18->_exceptionCodeCount);
    if ((a8 & 0x80000000) != 0)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v18->super._logWritingOptions, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("override-limit"));
    v18->_flags = a8 & 0x7FFFFFFF;
    v18->_jetsamLevel = -1;
    v22 = objc_opt_new();
    extras = v18->_extras;
    v18->_extras = (NSMutableDictionary *)v22;

    v18->_capture_absoluteTime = mach_absolute_time();
    v18->super._capture_time = CFAbsoluteTimeGetCurrent();
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "appleInternal");

    if (v25)
      v18->_includeSyslog = 1;
    if (initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags__onceToken != -1)
      dispatch_once(&initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags__onceToken, &__block_literal_global);
  }

  return v18;
}

void __100__OSAStackShotReport_initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getTaskingKey:", CFSTR("stackshot_tuning"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)tasked_tuning;
  tasked_tuning = v1;

  if (tasked_tuning)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v3 = (void *)tasked_tuning;
      tasked_tuning = 0;

    }
  }
}

- (OSAStackShotReport)initWithName:(id)a3 reason:(id)a4 exceptionCode:(int64_t *)a5 exceptionCodeCount:(unsigned int)a6
{
  return (OSAStackShotReport *)-[OSAStackShotReport initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:](self, "initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:", 0, a3, a4, a5, *(_QWORD *)&a6, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_stackshot_config)
    stackshot_config_dealloc();
  free(self->_exceptionCodes);
  v3.receiver = self;
  v3.super_class = (Class)OSAStackShotReport;
  -[OSAStackShotReport dealloc](&v3, sel_dealloc);
}

- (id)problemType
{
  return CFSTR("288");
}

- (id)appleCareDetails
{
  void *v3;
  void *v4;
  __CFString *v5;
  CFURLRef v6;
  CFURLRef v7;
  const __CFURL *v8;
  const __CFURL *v9;
  __CFBundle *v10;
  __CFBundle *v11;
  __CFString *v12;
  NSString *appName;
  __CFString *v14;
  const __CFString *v15;
  NSString *reason;
  void *v17;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  if (self->_pid)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAFED0]), "initWithPid:", self->_pid);
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "userAppName");
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v6 = CFURLCreateWithFileSystemPath(0, v5, kCFURLPOSIXPathStyle, 1u);
      if (v6)
      {
        v7 = v6;
        v8 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
        if (v8)
        {
          v9 = v8;
          v10 = CFBundleCreate(0, v8);
          if (v10)
          {
            v11 = v10;
            CFBundleGetIdentifier(v10);
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
            CFRelease(v11);
          }
          else
          {
            v12 = 0;
          }
          CFRelease(v9);
        }
        else
        {
          v12 = 0;
        }
        CFRelease(v7);
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  appName = self->_appName;
  if (appName)
  {
    v19[0] = &unk_1E4DFD8A0;
    v19[1] = appName;
    v14 = &stru_1E4DEECB8;
    if (v12)
      v15 = v12;
    else
      v15 = &stru_1E4DEECB8;
    v19[2] = v15;
    reason = self->_reason;
    if (reason)
    {
      -[NSString stringByReplacingOccurrencesOfString:withString:](reason, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v19[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (reason)

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)reportNamePrefix
{
  NSString *appName;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  appName = self->_appName;
  if (appName)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stacks+%@"), appName);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("stacks");
  }
  if (self->_ss_sequence == -1)
  {
    v5 = &stru_1E4DEECB8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%u"), self->_ss_sequence);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setIncidentID:(id)a3
{
  objc_storeStrong((id *)&self->super._incidentID, a3);
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (id)getExtraData:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_extras, "objectForKey:", a3);
}

- (void)queryThermalData
{
  double Current;
  _QWORD v4[5];

  Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&queryThermalData_queried > 30.0)
  {
    queryThermalData_queried = *(_QWORD *)&Current;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __38__OSAStackShotReport_queryThermalData__block_invoke;
    v4[3] = &unk_1E4DED7B8;
    v4[4] = self;
    +[OSAReport executeWithTimeout:Code:](OSAReport, "executeWithTimeout:Code:", 2000, v4);
  }
}

uint64_t __38__OSAStackShotReport_queryThermalData__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = OSThermalNotificationCurrentLevel();
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 120) = result;
  return result;
}

- (void)useStackshotBuffer:(const void *)a3 size:(unsigned int)a4 frontmostPids:(id)a5 atTime:(double)a6 machTime:(unint64_t)a7 sequence:(unsigned int)a8
{
  id v14;

  v14 = a5;
  if (self->_stackshot_config)
  {
    stackshot_config_dealloc();
    self->_stackshot_config = 0;
  }
  self->_ss_trace_buffer = a3;
  self->_ss_trace_length = a4;
  self->_ss_sequence = a8;
  if (!self->_pid)
    self->_pid = -1;
  -[NSMutableArray removeAllObjects](self->_frontmostPids, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_frontmostPids, "addObjectsFromArray:", v14);
  self->super._capture_time = a6;
  self->_capture_absoluteTime = a7;
  self->_dead_snapshot = 1;

}

- (void)useStackshotData:(id)a3 frontmostPids:(id)a4 atTime:(double)a5 machTime:(unint64_t)a6 sequence:(unsigned int)a7
{
  uint64_t v7;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v7 = *(_QWORD *)&a7;
  v12 = objc_retainAutorelease(a3);
  v16 = a4;
  v13 = v12;
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");

  -[OSAStackShotReport useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:](self, "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:", v14, v15, v16, a6, v7, a5);
}

- (void)acquireStackshot
{
  uint64_t v3;
  void *v4;
  unsigned int flags;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *notes;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  int v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  NSMutableArray *frontmostPids;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  NSMutableArray *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSMutableArray *v36;
  void *v37;
  uint64_t v38;
  uint64_t buffer;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray removeAllObjects](self->super._notes, "removeAllObjects");
  if (self->_stackshot_config)
  {
    stackshot_config_dealloc();
    self->_stackshot_config = 0;
  }
  self->_ss_trace_buffer = 0;
  self->_ss_trace_length = 0;
  self->_capture_absoluteTime = mach_absolute_time();
  self->super._capture_time = CFAbsoluteTimeGetCurrent();
  v3 = stackshot_config_create();
  if (v3)
  {
    v4 = (void *)v3;
    flags = self->_flags;
    self->_flags = flags | 0x10000;
    if ((flags & 0xFFFEFFFF) == 0)
    {
      self->_flags = flags | 0x1200F;
      objc_msgSend((id)tasked_tuning, "objectForKeyedSubscript:", CFSTR("uuid_faulting"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (!v6 || objc_msgSend(v6, "BOOLValue"))
        self->_flags |= 0x200000u;
      objc_msgSend((id)tasked_tuning, "objectForKeyedSubscript:", CFSTR("waitinfos"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v8 || objc_msgSend(v8, "BOOLValue"))
        self->_flags |= 0x1000000u;
      objc_msgSend((id)tasked_tuning, "objectForKeyedSubscript:", CFSTR("shared_cache_layout"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10 || objc_msgSend(v10, "BOOLValue"))
        self->_flags |= 0x80000u;

    }
    if (stackshot_config_set_flags())
    {
      notes = self->super._notes;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set flags for stackshot config"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](notes, "addObject:", v13);

LABEL_17:
      stackshot_config_dealloc();
      goto LABEL_19;
    }
    v29 = stackshot_capture_with_config();
    if ((_DWORD)v29)
    {
      v30 = v29;
      v31 = self->super._notes;
      v32 = (void *)MEMORY[0x1E0CB3940];
      v33 = geteuid();
      objc_msgSend(v32, "stringWithFormat:", CFSTR("Stackshot syscall failed (from euid %d) with error %d: %s"), v33, v30, strerror(v30));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v31, "addObject:", v34);

      if ((_DWORD)v30 == 2 && (self->_flags & 0x8000) != 0)
        -[NSMutableArray addObject:](self->super._notes, "addObject:", CFSTR("Stackshot key-combo received while a prior stackshot was still processing."));
      goto LABEL_17;
    }
    self->_stackshot_config = v4;
    self->_ss_trace_buffer = (const void *)stackshot_config_get_stackshot_buffer();
    self->_ss_trace_length = stackshot_config_get_stackshot_size();
    if ((self->_flags & 0x10000) == 0)
      self->_jetsamLevel = memorystatus_control();
  }
  else
  {
    v14 = self->super._notes;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to allocate memory for stackshot config"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v14, "addObject:", v15);

  }
LABEL_19:
  -[NSMutableArray removeAllObjects](self->_frontmostPids, "removeAllObjects");
  v16 = memorystatus_control();
  if (v16 < 1)
  {
    v28 = self->super._notes;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No jetsam status list available (size query returned %d)"), (2 * v16));
LABEL_44:
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v28, "addObject:", v35);

    goto LABEL_47;
  }
  v17 = malloc_type_malloc((2 * v16), 0x8713EE74uLL);
  if (!v17)
  {
    v28 = self->super._notes;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to allocate memory for jetsam status list"), v38);
    goto LABEL_44;
  }
  v18 = v17;
  v19 = memorystatus_control();
  if ((int)v19 >= 25)
  {
    v20 = v19 / 0x18uLL;
    v21 = v18 + 1;
    while (1)
    {
      v22 = *v21;
      v23 = *((unsigned int *)v21 - 2);
      if (!proc_name(*((_DWORD *)v21 - 2), &buffer, 0x20u)
        || (buffer == 0x6F42676E69727053 ? (v24 = v40 == 6582881) : (v24 = 0), !v24))
      {
        if ((v22 & 0x100) != 0)
        {
          if (*((_DWORD *)v21 - 1) != 100 && (v22 & 1) == 0)
            goto LABEL_36;
        }
        else if ((v22 & 1) == 0)
        {
          goto LABEL_36;
        }
      }
      frontmostPids = self->_frontmostPids;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](frontmostPids, "addObject:", v27);

LABEL_36:
      v21 += 3;
      if (!--v20)
        goto LABEL_46;
    }
  }
  v36 = self->super._notes;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to get jetsam status list (query returned %d)"), v19);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v36, "addObject:", v37);

LABEL_46:
  free(v18);
LABEL_47:
  -[OSAStackShotReport queryThermalData](self, "queryThermalData");
}

- (id)getStackshotData
{
  void *v2;

  if (self->_ss_trace_buffer && self->_ss_trace_length)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)addNotes:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->super._notes, "addObjectsFromArray:", a3);
}

- (void)setAdditionalPayload:(id)a3
{
  objc_storeStrong((id *)&self->_additionalPayload, a3);
}

- (BOOL)isActionable
{
  return self->_ss_trace_buffer && self->_ss_trace_length || (self->_flags & 0x8000) == 0;
}

- (void)generateLogAtLevel:(BOOL)a3 withBlock:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *reason;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSDictionary *additionalPayload;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  OSABinaryImageCatalog *v26;
  void *v27;
  id v28;
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
  NSMutableArray *notes;
  void *v41;
  NSMutableDictionary *extras;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  NSMutableDictionary *v49;
  const __CFString *v50;
  NSMutableArray *v51;
  _QWORD v52[2];
  _QWORD v53[2];
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  _QWORD v60[2];
  _QWORD v61[2];
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  NSDictionary *v65;
  const __CFString *v66;
  void *v67;
  _QWORD v68[10];
  _QWORD v69[12];

  v69[10] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  v68[0] = CFSTR("incident");
  -[OSAReport incidentID](self, "incidentID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = v47;
  v68[1] = CFSTR("crashReporterKey");
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "crashReporterKey");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v45;
  v68[2] = CFSTR("product");
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "modelCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v69[2] = v6;
  v68[3] = CFSTR("build");
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "productNameVersionBuildString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v69[3] = v8;
  v68[4] = CFSTR("kernel");
  objc_msgSend((id)objc_opt_class(), "kernelVersionDescription");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = tasked_tuning;
  if (!tasked_tuning)
    v11 = MEMORY[0x1E0C9AA70];
  v69[4] = v9;
  v69[5] = v11;
  v68[5] = CFSTR("tuning");
  v68[6] = CFSTR("exception");
  -[OSAStackShotReport exceptionCodesDescription](self, "exceptionCodesDescription");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  reason = (const __CFString *)self->_reason;
  if (!reason)
    reason = &stru_1E4DEECB8;
  v69[6] = v12;
  v69[7] = reason;
  v68[7] = CFSTR("reason");
  v68[8] = CFSTR("frontmostPids");
  v69[8] = self->_frontmostPids;
  v68[9] = CFSTR("codeSigningMonitor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(), "codeSigningMonitor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v69[9] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v16);

  -[OSAStackShotReport problemType](self, "problemType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSALog commonFieldsForBody:](OSALog, "commonFieldsForBody:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v18);

  if (self->_pid)
  {
    v66 = CFSTR("pid");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v20);

  }
  additionalPayload = self->_additionalPayload;
  if (additionalPayload)
  {
    v64 = CFSTR("additionalPayload");
    v65 = additionalPayload;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v22);

  }
  if (self->_thermalSensorValues)
  {
    v62 = CFSTR("thermalData");
    v60[0] = CFSTR("thermalLevel");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_thermalNotificationCurrentLevel);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = CFSTR("sensors");
    v61[0] = v23;
    v61[1] = self->_thermalSensorValues;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v25);

  }
  v26 = objc_alloc_init(OSABinaryImageCatalog);
  if (*self->_exceptionCodes == 3131746989)
    v27 = &unk_1E4DFE9B8;
  else
    v27 = (void *)tasked_tuning;
  v28 = v27;
  -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:](self, "decodeKCDataWithBlock:withTuning:usingCatalog:", v5, v28, v26);
  v58 = CFSTR("date");
  OSADateFormat(1u, self->super._capture_time);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v30);

  v56 = CFSTR("absoluteTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_capture_absoluteTime);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v32);

  v54 = CFSTR("binaryImages");
  -[OSABinaryImageCatalog reportUsedImages](v26, "reportUsedImages");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v33;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v34);

  -[OSABinaryImageCatalog appendNotesTo:](v26, "appendNotesTo:", self->super._notes);
  if (self->_includeSyslog && includeSection((void *)tasked_tuning, (uint64_t)CFSTR("syslog")))
  {
    -[OSAReport getSyslogForPids:andOptionalSenders:additionalPredicates:](self, "getSyslogForPids:andOptionalSenders:additionalPredicates:", 0, 0, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (v35)
    {
      v52[0] = CFSTR("syslog");
      objc_msgSend(v35, "reverseObjectEnumerator");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "allObjects");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v52[1] = &unk_1E4DFD8D0;
      v53[0] = v38;
      v53[1] = &unk_1E4DFD8B8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v39);

    }
    else
    {
      -[NSMutableArray addObject:](self->super._notes, "addObject:", CFSTR("Syslog query timed out"));
    }

  }
  if (-[NSMutableArray count](self->super._notes, "count"))
  {
    notes = self->super._notes;
    v50 = CFSTR("notes");
    v51 = notes;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v41);

  }
  if (-[NSMutableDictionary count](self->_extras, "count"))
  {
    extras = self->_extras;
    v48 = CFSTR("additionalDetails");
    v49 = extras;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v43);

  }
}

- (id)exceptionCodesDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  __CFString *v6;

  if (self->_exceptionCodeCount)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_exceptionCodeCount)
    {
      v4 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%08x"), self->_exceptionCodes[v4]);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v5);

        ++v4;
      }
      while (v4 < self->_exceptionCodeCount);
    }
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E4DEECB8;
  }
  return v6;
}

- (id)getVMStatistics
{
  void *v2;
  host_t v3;
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
  mach_msg_type_number_t host_info64_outCnt;
  integer_t host_info64_out[4];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 22);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v38 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  *(_OWORD *)host_info64_out = 0u;
  v31 = 0u;
  host_info64_outCnt = 38;
  v3 = MEMORY[0x1A85A7ED8]();
  if (host_statistics64(v3, 4, host_info64_out, &host_info64_outCnt))
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("host_statistics64 failed"), CFSTR("error"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", host_info64_out[0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("free_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", host_info64_out[1]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("active_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", host_info64_out[2]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("inactive_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", host_info64_out[3]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("wire_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("zero_fill_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v31 + 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("reactivations"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v32);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("pageins"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v32 + 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("pageouts"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v33);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("faults"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v33 + 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("cow_faults"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v34);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("lookups"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v34 + 1));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("hits"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v35);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, CFSTR("purges"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(v35));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, CFSTR("purgeable_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v35));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v18, CFSTR("speculative_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, CFSTR("decompressions"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v36 + 1));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v20, CFSTR("compressions"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)v37);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, CFSTR("swapins"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)&v37 + 1));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v22, CFSTR("swapouts"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v38);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, CFSTR("compressor_page_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD1(v38));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v24, CFSTR("throttled_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", DWORD2(v38));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v25, CFSTR("external_page_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v38));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v26, CFSTR("internal_page_count"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v39);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v27, CFSTR("total_uncompressed_pages_in_compressor"));

  }
  mach_port_deallocate(*MEMORY[0x1E0C83DA0], v3);
  return v2;
}

- (int)resampleTruncatedBacktracesForTask:(int)a3 forThreads:(id)a4 usingCatalog:(id)a5 in:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  ipc_space_t *v15;
  NSMutableArray *notes;
  id v17;
  NSMutableArray *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  void *v35;
  BOOL v36;
  mach_vm_size_t v37;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  int v43;
  unint64_t v44;
  void *v45;
  id v46;
  mach_msg_type_number_t thread_info_outCnt;
  integer_t thread_info_out[2];
  uint64_t v49;
  uint64_t v50;
  mach_msg_type_number_t act_listCnt;
  thread_act_array_t act_list;
  mach_port_name_t v53;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (getpid() != (_DWORD)v8)
  {
    v14 = (void *)MEMORY[0x1A85A7FC8]();
    v53 = 0;
    v15 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    if (task_read_for_pid())
    {
      notes = self->super._notes;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("task_read_for_pid(%d) for resampling backtraces failed"), v8);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](notes, "addObject:", v17);
      v13 = 0;
LABEL_34:

      objc_autoreleasePoolPop(v14);
      goto LABEL_35;
    }
    v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAFED8]), "initWithPID:options:", v8, 32);
    if (v41)
    {
      act_list = 0;
      act_listCnt = 0;
      if (!task_threads(v53, &act_list, &act_listCnt))
      {
        if (act_listCnt)
        {
          v39 = v14;
          v40 = v10;
          v20 = 0;
          v13 = 0;
          v17 = 0;
          do
          {
            v21 = act_list[v20];
            *(_QWORD *)thread_info_out = 0;
            v49 = 0;
            v50 = 0;
            thread_info_outCnt = 6;
            if (thread_info(v21, 4u, thread_info_out, &thread_info_outCnt))
              v22 = -1;
            else
              v22 = *(_QWORD *)thread_info_out;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              v44 = v20;
              v43 = v21;
              objc_msgSend(v41, "sampleThread:", v21);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = (uint64_t *)objc_msgSend(v25, "backtrace");
              v42 = v25;
              v27 = objc_msgSend(v25, "backtraceLength");
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unmapped pages caused truncated backtrace; re-sampled %d frames"),
                v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v24;
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, CFSTR("notice"));

              if (v26)
                v29 = (_DWORD)v27 == 0;
              else
                v29 = 1;
              if (!v29)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v27);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                do
                {
                  v31 = v17;
                  v32 = *v26++;
                  v46 = v17;
                  objc_msgSend(v11, "searchFrame:in:result:", v32, v12, &v46);
                  v33 = v12;
                  v34 = v11;
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v17 = v46;

                  objc_msgSend(v30, "addObject:", v35);
                  v11 = v34;
                  v12 = v33;
                  if (v32)
                    v36 = v17 == 0;
                  else
                    v36 = 0;
                  if (v36)
                    ++v13;
                  LODWORD(v27) = v27 - 1;
                }
                while ((_DWORD)v27);
                objc_msgSend(v45, "setObject:forKeyedSubscript:", v30, CFSTR("resampledUserFrames"));

                v10 = v40;
                v15 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
              }

              v20 = v44;
              v24 = v45;
              LODWORD(v21) = v43;
            }
            mach_port_deallocate(*v15, v21);

            ++v20;
          }
          while (v20 < act_listCnt);
          v37 = 4 * act_listCnt;
          v14 = v39;
        }
        else
        {
          v17 = 0;
          v13 = 0;
          v37 = 0;
        }
        mach_vm_deallocate(*v15, (mach_vm_address_t)act_list, v37);
        goto LABEL_33;
      }
      v18 = self->super._notes;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("task_threads() for %d failed"), v8);
    }
    else
    {
      v18 = self->super._notes;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create VMUSampler for %d"), v8);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v18, "addObject:", v19);

    v17 = 0;
    v13 = 0;
LABEL_33:
    mach_port_deallocate(*v15, v53);

    goto LABEL_34;
  }
  v13 = 0;
LABEL_35:

  return v13;
}

- (id)resampleUUIDsForTask:(int)a3 usingCatalog:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  ipc_space_t *v9;
  NSMutableArray *notes;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  id v15;
  id v16;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (getpid() != (_DWORD)v4)
  {
    v8 = (void *)MEMORY[0x1A85A7FC8]();
    v9 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    if (task_read_for_pid())
    {
      notes = self->super._notes;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("task_read_for_pid(%d) for resampling UUIDs failed"), v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](notes, "addObject:", v11);

    }
    else
    {
      if (_dyld_process_info_create())
      {
        v15 = v6;
        v16 = v7;
        _dyld_process_info_for_each_image();
        _dyld_process_info_release();
        objc_msgSend(v16, "sortByAddressAndSetInferredSizes");

        v12 = v15;
      }
      else
      {
        v13 = self->super._notes;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_dyld_process_info_create(%d) for resampling UUIDs failed with %d"), v4, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v13, "addObject:", v12);
      }

      mach_port_deallocate(*v9, 0);
    }
    objc_autoreleasePoolPop(v8);
  }

  return v7;
}

uint64_t __56__OSAStackShotReport_resampleUUIDsForTask_usingCatalog___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isAddressInTargetedCache:", a2);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "addImage:address:size:", a3, a2, 0);
  return result;
}

- (void)addCustomField:(const char *)a3 value:(id)a4 into:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  if (a3 && v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (objc_msgSend(v8, "count")
        && (objc_msgSend(v8, "top"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = v10;
        objc_msgSend(v10, "data");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v9);

      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extras, "setObject:forKeyedSubscript:", v13, v9);
      }
    }

  }
}

- (void)decodeKCDataWithBlock:(id)a3 withTuning:(id)a4 usingCatalog:(id)a5
{
  void (**v8)(_QWORD, void *);
  id v9;
  id v10;
  char *ss_trace_buffer;
  uint64_t ss_trace_length;
  unint64_t v13;
  char *v14;
  NSMutableArray *notes;
  const __CFString *v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
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
  NSObject *v50;
  NSMutableArray *v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  BOOL v55;
  KCContainer *v56;
  char *v57;
  char *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSMutableArray *frontmostPids;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  unint64_t v91;
  void *v92;
  void *v93;
  unint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  const __CFString *v107;
  void *v108;
  void *v109;
  const __CFString *v110;
  const __CFString *v111;
  void *v112;
  void *v113;
  void *v114;
  OSAStackShotReport *v115;
  const char *v116;
  unint64_t v117;
  void *v118;
  unint64_t v119;
  void *v120;
  int v121;
  unsigned int *v122;
  unsigned int v123;
  void *v124;
  int v125;
  unsigned int v126;
  uint64_t v127;
  const __CFString *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  NSMutableArray *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  int v147;
  OSASharedCacheEntry *v148;
  void *v149;
  int v150;
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
  int v164;
  unsigned int v165;
  void *v166;
  unint64_t v167;
  void *v168;
  void *v169;
  void (**v170)(_QWORD, void *);
  unint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  uint64_t v178;
  void *v179;
  uint64_t v180;
  void *v181;
  unsigned int v182;
  unsigned int v183;
  unsigned int v184;
  void *v185;
  void *v186;
  void *v187;
  OSASharedCacheEntry *v188;
  void *v189;
  OSASharedCacheEntry *v190;
  int v191;
  int v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  int v197;
  OSASharedCacheEntry *v198;
  void *v199;
  int v200;
  void *v201;
  void *v202;
  void *v203;
  unint64_t v204;
  unint64_t v205;
  void *v206;
  uint64_t v207;
  const unsigned __int8 *v208;
  void *v209;
  void *v210;
  NSObject *v211;
  uint64_t v212;
  const unsigned __int8 *v213;
  void *v214;
  uint64_t v215;
  uint64_t v216;
  unint64_t v217;
  void *v218;
  void *v219;
  unint64_t v220;
  void *v221;
  void *v222;
  unint64_t v223;
  void *v224;
  void *v225;
  uint64_t v226;
  unint64_t v227;
  void *v228;
  void *v229;
  char v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  uint64_t v253;
  void *v254;
  void *v255;
  void *v256;
  int v257;
  uint64_t v258;
  int v259;
  const __CFString *v260;
  unint64_t v261;
  void *v262;
  void *v263;
  uint64_t v264;
  void *v265;
  void *v266;
  void *v267;
  NSMutableArray *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  int v273;
  void *v274;
  void *v275;
  OSASharedCacheEntry *v276;
  OSASharedCacheEntry *v277;
  OSASharedCacheEntry *v278;
  unint64_t v279;
  void *v280;
  void *v281;
  void *v282;
  const __CFString *v283;
  void *v284;
  void *v285;
  NSObject *v286;
  int v287;
  unint64_t v288;
  void *v289;
  uint64_t v290;
  void *v291;
  OSAStackShotReport *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  int pid;
  int v303;
  uint64_t v304;
  void (**v305)(_QWORD, void *);
  NSMutableArray *v306;
  void *v307;
  uint64_t v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  unsigned int *v316;
  unsigned int v317;
  void *v318;
  BOOL v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  int v324;
  void *v325;
  void *v326;
  unsigned int *v327;
  unsigned int v328;
  void *v329;
  uint64_t v330;
  void *v331;
  void *v332;
  uint64_t *v333;
  uint64_t v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  id v340;
  _DWORD *v341;
  uint64_t v342;
  void *v343;
  uint64_t v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  id v350;
  uint64_t *v351;
  uint64_t v352;
  void *v353;
  uint64_t v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  id v359;
  NSMutableArray *v360;
  void *v361;
  NSMutableArray *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  uint64_t v372;
  void *v373;
  int v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  uint64_t v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  NSMutableArray *v386;
  void *v387;
  uint64_t v388;
  void *v389;
  void *v390;
  NSMutableArray *v391;
  void *v392;
  uint64_t v393;
  void *v394;
  void *v395;
  NSMutableArray *v396;
  void *v397;
  uint64_t v398;
  void *v399;
  void *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  char v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  char v439;
  uint64_t v440;
  uint64_t v441;
  int v442;
  void *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  void *v449;
  void *v450;
  id v451;
  id v452;
  id v453;
  id v454;
  id v455;
  id v456;
  uint64_t v457;
  int v458;
  OSAExclaveContainer *v459;
  unint64_t v460;
  unint64_t v461;
  void (**v462)(_QWORD, void *);
  void *v463;
  OSASharedCacheEntry *v464;
  unsigned int *v465;
  void *v466;
  void *v467;
  OSASharedCacheEntry *v468;
  id v469;
  id v470;
  void *v471;
  void *v472;
  void *v473;
  NSMutableArray *v474;
  OSAStackShotReport *v475;
  void *v476;
  id v477;
  id v478;
  const __CFString *v479;
  void *v480;
  _QWORD v481[2];
  _QWORD v482[2];
  const __CFString *v483;
  void *v484;
  void *v485;
  const __CFString *v486;
  _QWORD v487[2];
  _QWORD v488[2];
  _QWORD v489[2];
  _QWORD v490[2];
  _QWORD v491[2];
  _QWORD v492[2];
  _QWORD v493[7];
  _QWORD v494[7];
  _QWORD v495[2];
  _QWORD v496[2];
  _QWORD v497[2];
  void *v498;
  const __CFString *v499;
  _QWORD v500[2];
  _QWORD v501[2];
  uint8_t v502[4];
  uint64_t v503;
  uint8_t v504[4];
  uint64_t v505;
  _QWORD v506[2];
  _QWORD v507[2];
  uuid_string_t out;
  const __CFString *v509;
  void *v510;
  _QWORD v511[2];
  _QWORD v512[2];
  _QWORD v513[8];
  _QWORD v514[8];
  _QWORD v515[8];
  _QWORD v516[8];
  const __CFString *v517;
  _QWORD v518[4];

  v518[1] = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(_QWORD, void *))a3;
  v9 = a4;
  v10 = a5;
  ss_trace_buffer = (char *)self->_ss_trace_buffer;
  if (!ss_trace_buffer || (ss_trace_length = self->_ss_trace_length, !(_DWORD)ss_trace_length))
  {
    notes = self->super._notes;
    v16 = CFSTR("missing stackshot buffer or size");
    goto LABEL_7;
  }
  v13 = (unint64_t)&ss_trace_buffer[ss_trace_length];
  v14 = ss_trace_buffer + 16;
  if (ss_trace_buffer + 16 > &ss_trace_buffer[ss_trace_length]
    || (unint64_t)&v14[*((unsigned int *)ss_trace_buffer + 1)] > v13
    || *(_DWORD *)ss_trace_buffer != 1503811591)
  {
    notes = self->super._notes;
    v16 = CFSTR("non-parseable kc snapshot buffer");
LABEL_7:
    -[NSMutableArray addObject:](notes, "addObject:", v16);
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v472 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v462 = v8;
  if (self->_dead_snapshot)
    v442 = 0;
  else
    v442 = excludeSection(v9, (uint64_t)CFSTR("sampleTruncatedStacks")) ^ 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v450 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  v463 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v449 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v443 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v458 = objc_msgSend(v18, "appleInternal");

  v459 = objc_alloc_init(OSAExclaveContainer);
  -[OSAExclaveContainer parseKCdata:](v459, "parseKCdata:", ss_trace_buffer, v13);
  v464 = 0;
  v465 = 0;
  v460 = 0;
  v461 = 0;
  v447 = 0;
  v448 = 0;
  v457 = 0;
  v440 = 0;
  v441 = 0;
  v445 = 0;
  v446 = 0;
  v444 = 0;
  v468 = 0;
  v413 = 0;
  v19 = *MEMORY[0x1E0C9ADF8];
  v439 = 1;
  v471 = v9;
  v473 = v10;
  v475 = self;
  v476 = v17;
  while (1)
  {
    v20 = *((unsigned int *)ss_trace_buffer + 1);
    if ((unint64_t)&v14[v20] > v13)
LABEL_595:
      -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.1();
    v21 = *(_DWORD *)ss_trace_buffer;
    if (*(_DWORD *)ss_trace_buffer == -242132755)
      break;
    if ((v21 & 0xFFFFFFF0) == 0x20)
      v22 = 17;
    else
      v22 = v21;
    if ((int)v22 > 2111)
    {
      switch((int)v22)
      {
        case 2305:
          if (includeSection(v9, (uint64_t)CFSTR("ioStats")))
          {
            objc_msgSend(v17, "top");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v23)
              -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.20();
            v24 = v23;
            objc_msgSend(v23, "data");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              v451 = v24;
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              for (i = 0; i != 32; i += 8)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&ss_trace_buffer[i + 48]);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v495[0] = v28;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)&ss_trace_buffer[i + 80]);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v495[1] = v29;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v495, 2);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addObject:", v30);

              }
              v493[0] = CFSTR("reads");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 2));
              v435 = (void *)objc_claimAutoreleasedReturnValue();
              v492[0] = v435;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 3));
              v431 = (void *)objc_claimAutoreleasedReturnValue();
              v492[1] = v431;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v492, 2);
              v428 = (void *)objc_claimAutoreleasedReturnValue();
              v494[0] = v428;
              v493[1] = CFSTR("writes");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 4));
              v426 = (void *)objc_claimAutoreleasedReturnValue();
              v491[0] = v426;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 5));
              v424 = (void *)objc_claimAutoreleasedReturnValue();
              v491[1] = v424;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v491, 2);
              v422 = (void *)objc_claimAutoreleasedReturnValue();
              v494[1] = v422;
              v493[2] = CFSTR("paging");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 14));
              v420 = (void *)objc_claimAutoreleasedReturnValue();
              v490[0] = v420;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 15));
              v418 = (void *)objc_claimAutoreleasedReturnValue();
              v490[1] = v418;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v490, 2);
              v416 = (void *)objc_claimAutoreleasedReturnValue();
              v494[2] = v416;
              v493[3] = CFSTR("nonpaging");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 16));
              v414 = (void *)objc_claimAutoreleasedReturnValue();
              v489[0] = v414;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 17));
              v409 = (void *)objc_claimAutoreleasedReturnValue();
              v489[1] = v409;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v489, 2);
              v408 = (void *)objc_claimAutoreleasedReturnValue();
              v494[3] = v408;
              v493[4] = CFSTR("data");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 18));
              v407 = (void *)objc_claimAutoreleasedReturnValue();
              v488[0] = v407;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 19));
              v406 = (void *)objc_claimAutoreleasedReturnValue();
              v488[1] = v406;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v488, 2);
              v405 = (void *)objc_claimAutoreleasedReturnValue();
              v494[4] = v405;
              v493[5] = CFSTR("metadata");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 20));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v487[0] = v31;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 21));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v487[1] = v32;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v487, 2);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v493[6] = CFSTR("priorities");
              v494[5] = v33;
              v494[6] = v26;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v494, v493, 7);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v451, "data");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, CFSTR("ioStats"));

              v24 = v451;
              v9 = v471;
              v17 = v476;
            }

            v10 = v473;
            self = v475;
          }
          goto LABEL_555;
        case 2306:
          v517 = CFSTR("memoryStatus");
          v515[0] = CFSTR("memoryPressure");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_jetsamLevel > 0);
          v454 = (id)objc_claimAutoreleasedReturnValue();
          v516[0] = v454;
          v515[1] = CFSTR("memoryPages");
          v513[0] = CFSTR("free");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 5));
          v437 = (void *)objc_claimAutoreleasedReturnValue();
          v514[0] = v437;
          v513[1] = CFSTR("active");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 6));
          v432 = (void *)objc_claimAutoreleasedReturnValue();
          v514[1] = v432;
          v513[2] = CFSTR("inactive");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 7));
          v429 = (void *)objc_claimAutoreleasedReturnValue();
          v514[2] = v429;
          v513[3] = CFSTR("purgeable");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 8));
          v427 = (void *)objc_claimAutoreleasedReturnValue();
          v514[3] = v427;
          v513[4] = CFSTR("wired");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 9));
          v425 = (void *)objc_claimAutoreleasedReturnValue();
          v514[4] = v425;
          v513[5] = CFSTR("speculative");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 10));
          v423 = (void *)objc_claimAutoreleasedReturnValue();
          v514[5] = v423;
          v513[6] = CFSTR("throttled");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 11));
          v421 = (void *)objc_claimAutoreleasedReturnValue();
          v514[6] = v421;
          v513[7] = CFSTR("fileBacked");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 12));
          v419 = (void *)objc_claimAutoreleasedReturnValue();
          v514[7] = v419;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v514, v513, 8);
          v417 = (void *)objc_claimAutoreleasedReturnValue();
          v516[1] = v417;
          v515[2] = CFSTR("compressions");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 13));
          v415 = (void *)objc_claimAutoreleasedReturnValue();
          v516[2] = v415;
          v515[3] = CFSTR("decompressions");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 14));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v516[3] = v60;
          v515[4] = CFSTR("compressorSize");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 15));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v516[4] = v61;
          v515[5] = CFSTR("busyBufferCount");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)ss_trace_buffer + 16));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v516[5] = v62;
          v515[6] = CFSTR("memoryPressureDetails");
          v63 = ss_trace_buffer[76];
          if (ss_trace_buffer[76])
          {
            v511[0] = CFSTR("pagesWanted");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 17));
            v412 = (void *)objc_claimAutoreleasedReturnValue();
            v512[0] = v412;
            v511[1] = CFSTR("pagesReclaimed");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 18));
            v411 = (void *)objc_claimAutoreleasedReturnValue();
            v512[1] = v411;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v512, v511, 2);
            v410 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v410;
          }
          else
          {
            v64 = (void *)MEMORY[0x1E0C9AA70];
          }
          v516[6] = v64;
          v515[7] = CFSTR("pageSize");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v447));
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          v516[7] = v185;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v516, v515, 8);
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          v518[0] = v186;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v518, &v517, 1);
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          v462[2](v462, v187);

          if (v63)
          {

          }
          goto LABEL_292;
        case 2307:
        case 2308:
        case 2311:
        case 2314:
        case 2315:
        case 2316:
        case 2317:
        case 2322:
        case 2323:
        case 2324:
        case 2325:
        case 2326:
        case 2327:
        case 2328:
        case 2334:
        case 2335:
        case 2336:
        case 2339:
        case 2340:
        case 2341:
        case 2342:
        case 2343:
        case 2350:
        case 2351:
        case 2353:
        case 2354:
        case 2355:
        case 2356:
        case 2357:
        case 2358:
        case 2359:
        case 2360:
        case 2361:
        case 2362:
        case 2363:
        case 2364:
        case 2365:
        case 2366:
        case 2367:
        case 2368:
        case 2369:
        case 2370:
        case 2375:
          goto LABEL_58;
        case 2309:
          objc_msgSend(v17, "top");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v65 || (v66 = v65, objc_msgSend(v65, "type") != 2307))
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.15();
          v67 = *((unsigned int *)ss_trace_buffer + 25);
          if ((_DWORD)v67 == self->_pid)
            goto LABEL_296;
          if ((_DWORD)v67)
            goto LABEL_80;
          if (!excludeSection(v9, (uint64_t)CFSTR("kernel")))
            goto LABEL_296;
          v67 = *((unsigned int *)ss_trace_buffer + 25);
LABEL_80:
          frontmostPids = self->_frontmostPids;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v67);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSMutableArray containsObject:](frontmostPids, "containsObject:", v69))
          {

          }
          else
          {
            if (!*((_DWORD *)ss_trace_buffer + 25))
            {

LABEL_463:
              objc_msgSend(v17, "top");
              v252 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v252, "omit");
              goto LABEL_433;
            }
            v230 = excludeSection(v9, (uint64_t)CFSTR("allPids"));

            if ((v230 & 1) != 0)
              goto LABEL_463;
          }
LABEL_296:
          objc_msgSend(v66, "setPid:", *((unsigned int *)ss_trace_buffer + 25));
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v231 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "data");
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v232, "setObject:forKeyedSubscript:", v231, CFSTR("threadById"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)ss_trace_buffer + 25));
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "data");
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v234, "setObject:forKeyedSubscript:", v233, CFSTR("pid"));

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ss_trace_buffer + 104);
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "data");
          v236 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v236, "setObject:forKeyedSubscript:", v235, CFSTR("procname"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 19));
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "data");
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v238, "setObject:forKeyedSubscript:", v237, CFSTR("pageFaults"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 20));
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "data");
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v240, "setObject:forKeyedSubscript:", v239, CFSTR("pageIns"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 21));
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "data");
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v242, "setObject:forKeyedSubscript:", v241, CFSTR("copyOnWriteFaults"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 22));
          v243 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "data");
          v244 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v244, "setObject:forKeyedSubscript:", v243, CFSTR("timesThrottled"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 23));
          v245 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "data");
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v246, "setObject:forKeyedSubscript:", v245, CFSTR("timesDidThrottle"));

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%llX"), *((_QWORD *)ss_trace_buffer + 3));
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "data");
          v248 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v248, "setObject:forKeyedSubscript:", v247, CFSTR("rawFlags"));

          if (*((_DWORD *)ss_trace_buffer + 18))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
            v249 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "data");
            v250 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v250, "setObject:forKeyedSubscript:", v249, CFSTR("suspendCount"));

          }
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v251 = (void *)objc_claimAutoreleasedReturnValue();
          v252 = v251;
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 4) != 0)
          {
            objc_msgSend(v251, "addObject:", CFSTR("rsrcFlagged"));
            v253 = *((_QWORD *)ss_trace_buffer + 3);
            if ((v253 & 8) == 0)
            {
LABEL_300:
              if ((v253 & 0x10) == 0)
                goto LABEL_301;
              goto LABEL_316;
            }
          }
          else if ((v253 & 8) == 0)
          {
            goto LABEL_300;
          }
          objc_msgSend(v252, "addObject:", CFSTR("terminatedSnapshot"));
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 0x10) == 0)
          {
LABEL_301:
            if ((v253 & 0x20) == 0)
              goto LABEL_302;
            goto LABEL_317;
          }
LABEL_316:
          objc_msgSend(v252, "addObject:", CFSTR("suspended"));
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 0x20) == 0)
          {
LABEL_302:
            if ((v253 & 0x40) == 0)
              goto LABEL_303;
            goto LABEL_318;
          }
LABEL_317:
          objc_msgSend(v252, "addObject:", CFSTR("frozen"));
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 0x40) == 0)
          {
LABEL_303:
            if ((v253 & 0x80) == 0)
              goto LABEL_304;
            goto LABEL_319;
          }
LABEL_318:
          objc_msgSend(v252, "addObject:", CFSTR("darwinBG"));
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 0x80) == 0)
          {
LABEL_304:
            if ((v253 & 0x100) == 0)
              goto LABEL_305;
            goto LABEL_320;
          }
LABEL_319:
          objc_msgSend(v252, "addObject:", CFSTR("extDarwinBG"));
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 0x100) == 0)
          {
LABEL_305:
            if ((v253 & 0x200) == 0)
              goto LABEL_306;
            goto LABEL_321;
          }
LABEL_320:
          objc_msgSend(v252, "addObject:", CFSTR("visVisible"));
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 0x200) == 0)
          {
LABEL_306:
            if ((v253 & 0x400) == 0)
              goto LABEL_307;
            goto LABEL_322;
          }
LABEL_321:
          objc_msgSend(v252, "addObject:", CFSTR("visNonvisible"));
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 0x400) == 0)
          {
LABEL_307:
            if ((v253 & 0x800) == 0)
              goto LABEL_308;
            goto LABEL_323;
          }
LABEL_322:
          objc_msgSend(v252, "addObject:", CFSTR("foreground"));
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 0x800) == 0)
          {
LABEL_308:
            if ((v253 & 0x1000) == 0)
              goto LABEL_309;
            goto LABEL_324;
          }
LABEL_323:
          objc_msgSend(v252, "addObject:", CFSTR("boosted"));
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 0x1000) == 0)
          {
LABEL_309:
            if ((v253 & 0x4000) == 0)
              goto LABEL_310;
            goto LABEL_325;
          }
LABEL_324:
          objc_msgSend(v252, "addObject:", CFSTR("suppressed"));
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 0x4000) == 0)
          {
LABEL_310:
            if ((v253 & 0x8000) == 0)
              goto LABEL_311;
            goto LABEL_326;
          }
LABEL_325:
          objc_msgSend(v252, "addObject:", CFSTR("isImpDonor"));
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 0x8000) == 0)
          {
LABEL_311:
            if ((v253 & 0x10000) == 0)
              goto LABEL_312;
            goto LABEL_327;
          }
LABEL_326:
          objc_msgSend(v252, "addObject:", CFSTR("isLiveImpDonor"));
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 0x10000) == 0)
          {
LABEL_312:
            if ((v253 & 0x80000) == 0)
              goto LABEL_332;
            goto LABEL_328;
          }
LABEL_327:
          objc_msgSend(v252, "addObject:", CFSTR("dirty"));
          v253 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v253 & 0x80000) == 0)
            goto LABEL_332;
LABEL_328:
          if ((v253 & 0x20000) != 0)
          {
            objc_msgSend(v252, "addObject:", CFSTR("exceededWQConstrainedLimit"));
            v253 = *((_QWORD *)ss_trace_buffer + 3);
          }
          if ((v253 & 0x40000) != 0)
          {
            objc_msgSend(v252, "addObject:", CFSTR("exceededWQTotalLimit"));
            v253 = *((_QWORD *)ss_trace_buffer + 3);
          }
LABEL_332:
          if ((v253 & 0x700000) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uuidFaultFlags0x%08llX"), v253 & 0x700000);
            v254 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v252, "addObject:", v254);

            v253 = *((_QWORD *)ss_trace_buffer + 3);
          }
          if ((v253 & 0x200000) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v66, "pid"));
            v255 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v467, "addObject:", v255);

            objc_msgSend(v66, "setInvalid_images:", objc_msgSend(v66, "invalid_images") + objc_msgSend(v466, "count"));
            if ((excludeSection(v471, (uint64_t)CFSTR("uuidResampling")) & 1) == 0 && !self->_dead_snapshot)
            {
              -[OSAStackShotReport resampleUUIDsForTask:usingCatalog:](self, "resampleUUIDsForTask:usingCatalog:", objc_msgSend(v66, "pid"), v473);
              v256 = (void *)objc_claimAutoreleasedReturnValue();
              v257 = objc_msgSend(v256, "count");
              v258 = objc_msgSend(v256, "count");
              v259 = objc_msgSend(v66, "invalid_images");
              v260 = CFSTR("resampledAllImages");
              if (v258 != v259)
              {
                v261 = objc_msgSend(v256, "count", CFSTR("resampledAllImages"));
                if (v261 <= (int)objc_msgSend(v66, "invalid_images"))
                  v260 = CFSTR("resampleIncomplete");
                else
                  v260 = CFSTR("resampledExtraImages");
              }
              objc_msgSend(v252, "addObject:", v260);
              if (objc_msgSend(v256, "count"))
              {
                objc_msgSend(v256, "valueForKey:", CFSTR("details"));
                v262 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "data");
                v263 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v263, "setObject:forKeyedSubscript:", v262, CFSTR("resampled_images"));

                self = v475;
                objc_msgSend(v472, "addObjectsFromArray:", v256);
              }
              v440 = (v440 + v257);

            }
          }
          else if (objc_msgSend(v466, "count"))
          {
            objc_msgSend(v472, "addObjectsFromArray:", v466);
            objc_msgSend(v472, "sortByAddressAndSetInferredSizes");
          }
          v264 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v264 & 0x1000000) != 0)
          {
            objc_msgSend(v252, "addObject:", CFSTR("TALEngaged"));
            v264 = *((_QWORD *)ss_trace_buffer + 3);
            if ((v264 & 0x4000000) == 0)
            {
LABEL_348:
              if ((v264 & 0x8000000) == 0)
                goto LABEL_349;
              goto LABEL_369;
            }
          }
          else if ((v264 & 0x4000000) == 0)
          {
            goto LABEL_348;
          }
          objc_msgSend(v252, "addObject:", CFSTR("isDirtyTracked"));
          v264 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v264 & 0x8000000) == 0)
          {
LABEL_349:
            if ((v264 & 0x10000000) == 0)
              goto LABEL_350;
            goto LABEL_370;
          }
LABEL_369:
          objc_msgSend(v252, "addObject:", CFSTR("allowIdleExit"));
          v264 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v264 & 0x10000000) == 0)
          {
LABEL_350:
            if ((v264 & 0x20000000) == 0)
              goto LABEL_351;
            goto LABEL_371;
          }
LABEL_370:
          objc_msgSend(v252, "addObject:", CFSTR("isTranslated"));
          v264 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v264 & 0x20000000) == 0)
          {
LABEL_351:
            if ((v264 & 0x40000000) == 0)
              goto LABEL_352;
            goto LABEL_372;
          }
LABEL_371:
          objc_msgSend(v252, "addObject:", CFSTR("sharedRegionNone"));
          v264 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v264 & 0x40000000) == 0)
          {
LABEL_352:
            if ((v264 & 0x80000000) == 0)
              goto LABEL_353;
            goto LABEL_373;
          }
LABEL_372:
          objc_msgSend(v252, "addObject:", CFSTR("sharedRegionSystem"));
          v264 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v264 & 0x80000000) == 0)
          {
LABEL_353:
            if ((v264 & 0x100000000) == 0)
              goto LABEL_354;
            goto LABEL_374;
          }
LABEL_373:
          objc_msgSend(v252, "addObject:", CFSTR("sharedRegionOther"));
          v264 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v264 & 0x100000000) == 0)
          {
LABEL_354:
            if ((v264 & 0x200000000) == 0)
              goto LABEL_355;
            goto LABEL_375;
          }
LABEL_374:
          objc_msgSend(v252, "addObject:", CFSTR("dyldCompactInfoNone"));
          v264 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v264 & 0x200000000) == 0)
          {
LABEL_355:
            if ((v264 & 0x400000000) == 0)
              goto LABEL_356;
            goto LABEL_376;
          }
LABEL_375:
          objc_msgSend(v252, "addObject:", CFSTR("dyldCompactInfoTooBig"));
          v264 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v264 & 0x400000000) == 0)
          {
LABEL_356:
            if ((v264 & 0x800000000) == 0)
              goto LABEL_357;
            goto LABEL_377;
          }
LABEL_376:
          objc_msgSend(v252, "addObject:", CFSTR("dyldCompactInfoFaultedIn"));
          v264 = *((_QWORD *)ss_trace_buffer + 3);
          if ((v264 & 0x800000000) == 0)
          {
LABEL_357:
            if ((v264 & 0x1000000000) == 0)
              goto LABEL_359;
LABEL_358:
            objc_msgSend(v252, "addObject:", CFSTR("dyldCompactInfoTriedFault"));
            goto LABEL_359;
          }
LABEL_377:
          objc_msgSend(v252, "addObject:", CFSTR("dyldCompactInfoMissing"));
          if ((*((_QWORD *)ss_trace_buffer + 3) & 0x1000000000) != 0)
            goto LABEL_358;
LABEL_359:
          if (objc_msgSend(v252, "count"))
          {
            objc_msgSend(v66, "data");
            v265 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v265, "setObject:forKeyedSubscript:", v252, CFSTR("flags"));

          }
          if (*((_QWORD *)ss_trace_buffer + 7))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "data");
            v267 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v267, "setObject:forKeyedSubscript:", v266, CFSTR("residentMemoryBytes"));

          }
          v268 = self->_frontmostPids;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)ss_trace_buffer + 25));
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v268) = -[NSMutableArray containsObject:](v268, "containsObject:", v269);

          if ((_DWORD)v268)
          {
            objc_msgSend(v66, "data");
            v270 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v270, "setObject:forKeyedSubscript:", &unk_1E4DFD8B8, CFSTR("frontmost"));

          }
          v460 = *((_QWORD *)ss_trace_buffer + 4);
          v461 = *((_QWORD *)ss_trace_buffer + 5);
          -[OSAStackShotReport problemType](self, "problemType");
          v271 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v271, "isEqualToString:", CFSTR("409")))
          {

          }
          else
          {
            -[OSAStackShotReport problemType](self, "problemType");
            v272 = (void *)objc_claimAutoreleasedReturnValue();
            v273 = objc_msgSend(v272, "isEqualToString:", CFSTR("509"));

            if (!v273)
              goto LABEL_381;
          }
          objc_msgSend((id)objc_opt_class(), "reduceToTwoSigFigures:", (unint64_t)(self->super._capture_time - ((double)*((unint64_t *)ss_trace_buffer + 6) - v19)));
          v274 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "data");
          v275 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v275, "setObject:forKeyedSubscript:", v274, CFSTR("processUptime"));

LABEL_381:
          v276 = v464;
          if (v468)
            v276 = v468;
          v277 = v276;
          v278 = v277;
          if (v277)
          {
            objc_msgSend(v473, "targetSharedCache:withSlide:atBaseAddress:", -[OSASharedCacheEntry original](v277, "original") + 8, -[OSASharedCacheEntry sharedCacheSlide](v277, "sharedCacheSlide"), (_QWORD)-[OSASharedCacheEntry original](v277, "original")[32]);
            if (-[OSASharedCacheEntry layout](v278, "layout"))
            {
              v17 = v476;
              if (-[OSASharedCacheEntry isDefaultSharedCache](v278, "isDefaultSharedCache"))
              {
                if ((v413 & 1) == 0)
                  objc_msgSend(v473, "setRootedCacheLibs:count:", -[OSASharedCacheEntry layout](v278, "layout"), -[OSASharedCacheEntry layoutImageCount](v278, "layoutImageCount"));
                v413 = 1;
              }
              else
              {
                objc_msgSend(v473, "setRootedCacheLibs:count:", -[OSASharedCacheEntry layout](v278, "layout"), -[OSASharedCacheEntry layoutImageCount](v278, "layoutImageCount"));
                v413 = 0;
              }
            }
            else
            {
              v17 = v476;
            }
          }
          else
          {
            v17 = v476;
            if ((v439 & 1) != 0)
              -[NSMutableArray addObject:](self->super._notes, "addObject:", CFSTR("no shared cache available from the kernel snapshot -- this may impact symbolication"));
            v439 = 0;
          }

LABEL_433:
          v10 = v473;
          v9 = v471;
          goto LABEL_555;
        case 2310:
          objc_msgSend(v17, "top");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v70 || (v71 = v70, objc_msgSend(v70, "type") != 2308))
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.17();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 2));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "data");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setObject:forKeyedSubscript:", v72, CFSTR("id"));

          v74 = *((_DWORD *)ss_trace_buffer + 26);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = v75;
          if ((v74 & 1) != 0)
          {
            objc_msgSend(v75, "addObject:", CFSTR("TH_WAIT"));
            if ((v74 & 2) == 0)
            {
LABEL_86:
              if ((v74 & 4) == 0)
                goto LABEL_87;
              goto LABEL_198;
            }
          }
          else if ((v74 & 2) == 0)
          {
            goto LABEL_86;
          }
          objc_msgSend(v76, "addObject:", CFSTR("TH_SUSP"));
          if ((v74 & 4) == 0)
          {
LABEL_87:
            if ((v74 & 8) == 0)
              goto LABEL_88;
            goto LABEL_199;
          }
LABEL_198:
          objc_msgSend(v76, "addObject:", CFSTR("TH_RUN"));
          if ((v74 & 8) == 0)
          {
LABEL_88:
            if ((v74 & 0x10) == 0)
              goto LABEL_89;
            goto LABEL_200;
          }
LABEL_199:
          objc_msgSend(v76, "addObject:", CFSTR("TH_UNINT"));
          if ((v74 & 0x10) == 0)
          {
LABEL_89:
            if ((v74 & 0x20) == 0)
              goto LABEL_90;
            goto LABEL_201;
          }
LABEL_200:
          objc_msgSend(v76, "addObject:", CFSTR("TH_TERMINATE"));
          if ((v74 & 0x20) == 0)
          {
LABEL_90:
            if ((v74 & 0x80) == 0)
              goto LABEL_92;
LABEL_91:
            objc_msgSend(v76, "addObject:", CFSTR("TH_IDLE"));
            goto LABEL_92;
          }
LABEL_201:
          objc_msgSend(v76, "addObject:", CFSTR("TH_TERMINATE2"));
          if ((v74 & 0x80) != 0)
            goto LABEL_91;
LABEL_92:
          objc_msgSend(v71, "data");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "setObject:forKeyedSubscript:", v76, CFSTR("state"));

          v78 = *((_QWORD *)ss_trace_buffer + 3);
          if (v78)
          {
            objc_msgSend(v473, "searchFrame:in:result:", v78, v472, 0);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "data");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "setObject:forKeyedSubscript:", v79, CFSTR("waitEvent"));

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *((__int16 *)ss_trace_buffer + 57));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "data");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "setObject:forKeyedSubscript:", v81, CFSTR("schedPriority"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *((__int16 *)ss_trace_buffer + 56));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "data");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "setObject:forKeyedSubscript:", v83, CFSTR("basePriority"));

          if (ss_trace_buffer[117])
          {
            DecodeQOS(ss_trace_buffer[117]);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "data");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v86, "setObject:forKeyedSubscript:", v85, CFSTR("qosRequested"));

          }
          if (ss_trace_buffer[118])
          {
            DecodeQOS(ss_trace_buffer[118]);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "data");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "setObject:forKeyedSubscript:", v87, CFSTR("qosOverride"));

          }
          if (ss_trace_buffer[116])
          {
            DecodeQOS(ss_trace_buffer[116]);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "data");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "setObject:forKeyedSubscript:", v89, CFSTR("qosEffective"));

          }
          v91 = *((unsigned int *)ss_trace_buffer + 27);
          if ((_DWORD)v91)
          {
            DecodeThreadFlags(v91, 0);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "data");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "setObject:forKeyedSubscript:", v92, CFSTR("schedFlags"));

          }
          v94 = *((_QWORD *)ss_trace_buffer + 10);
          if (v94)
          {
            DecodeThreadFlags(v94, 1);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "data");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "setObject:forKeyedSubscript:", v95, CFSTR("snapshotFlags"));

          }
          v97 = *((_QWORD *)ss_trace_buffer + 4);
          if (v97)
          {
            objc_msgSend(v473, "searchFrame:in:result:", v97, v472, 0);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "data");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "setObject:forKeyedSubscript:", v98, CFSTR("continuation"));

          }
          if (ss_trace_buffer[80] < 0)
          {
            if (v442)
            {
              objc_msgSend(v476, "parent");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "data");
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "truncated_threads");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 2));
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "setObject:forKeyedSubscript:", v101, v103);

            }
            else
            {
              objc_msgSend(v71, "data");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "setObject:forKeyedSubscript:", CFSTR("Unmapped pages caused truncated backtrace (resampling disabled)"), CFSTR("notice"));
            }
            v448 = (v448 + 1);

          }
          v215 = *((_QWORD *)ss_trace_buffer + 8);
          v216 = *((_QWORD *)ss_trace_buffer + 9);
          if (v465)
            v217 = v215 * (unint64_t)*v465 / v465[1];
          else
            v217 = *((_QWORD *)ss_trace_buffer + 8);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v217 / 1000000000.0);
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "data");
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v219, "setObject:forKeyedSubscript:", v218, CFSTR("userTime"));

          v220 = *((_QWORD *)ss_trace_buffer + 9);
          if (v465)
            v220 = v220 * *v465 / v465[1];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v220 / 1000000000.0);
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "data");
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v222, "setObject:forKeyedSubscript:", v221, CFSTR("systemTime"));

          v223 = v475->_capture_absoluteTime - *((_QWORD *)ss_trace_buffer + 11);
          if (v465)
            v223 = v223 * *v465 / v465[1];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v223 / 1000000000.0);
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "data");
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v225, "setObject:forKeyedSubscript:", v224, CFSTR("lastRunTime"));

          v226 = *((_QWORD *)ss_trace_buffer + 12);
          if (v226 != -1)
          {
            v227 = v475->_capture_absoluteTime - v226;
            if (v465)
              v227 = v227 * *v465 / v465[1];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v227 / 1000000000.0);
            v228 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "data");
            v229 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v229, "setObject:forKeyedSubscript:", v228, CFSTR("lastMadeRunnableTime"));

          }
          v457 = (v457 + 1);
          v460 += v215;
          v461 += v216;

LABEL_292:
          v9 = v471;
          v10 = v473;
          self = v475;
LABEL_293:
          v17 = v476;
          goto LABEL_555;
        case 2312:
        case 2319:
        case 2331:
        case 2332:
        case 2333:
        case 2338:
        case 2345:
        case 2346:
        case 2347:
        case 2348:
        case 2349:
        case 2372:
          goto LABEL_555;
        case 2313:
          objc_msgSend(v17, "top");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v104, "type") != 2308)
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.18();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ss_trace_buffer + 16);
          v105 = objc_claimAutoreleasedReturnValue();
          v106 = (void *)v105;
          if (v105)
            v107 = (const __CFString *)v105;
          else
            v107 = CFSTR("<unprintable>");
          objc_msgSend(v104, "data");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = v108;
          v110 = v107;
          v111 = CFSTR("name");
          goto LABEL_143;
        case 2318:
          if (!v458)
            goto LABEL_555;
          v509 = CFSTR("bootArgs");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ss_trace_buffer + 16);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v510 = v112;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v510, &v509, 1);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v462[2](v462, v113);
          goto LABEL_429;
        case 2320:
          HIDWORD(v447) = *((_DWORD *)ss_trace_buffer + 4);
          goto LABEL_555;
        case 2321:
          self->_jetsamLevel = *((_DWORD *)ss_trace_buffer + 4);
          goto LABEL_555;
        case 2329:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 2));
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          -[OSAStackShotReport addCustomField:value:into:](self, "addCustomField:value:into:", "user_usec", v114, v17);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 3));
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = self;
          v116 = "system_usec";
          goto LABEL_403;
        case 2330:
          v117 = *((_QWORD *)ss_trace_buffer + 2);
          if (v465)
            v117 = v117 * *v465 / v465[1];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v117);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          -[OSAStackShotReport addCustomField:value:into:](self, "addCustomField:value:into:", "stackshot_duration_nsec", v118, v17);

          v119 = *((_QWORD *)ss_trace_buffer + 3);
          if (v465)
            v119 = v119 * *v465 / v465[1];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v119);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          -[OSAStackShotReport addCustomField:value:into:](self, "addCustomField:value:into:", "stackshot_duration_outer_nsec", v120, v17);

          v121 = *(_DWORD *)ss_trace_buffer;
          if ((*(_DWORD *)ss_trace_buffer & 0xFFFFFFF0) == 0x20)
            v121 = 17;
          if (v121 <= 2309)
          {
            v122 = v465;
            if (v121 == 17 || v121 == 19)
            {
              v123 = *((_DWORD *)ss_trace_buffer + 1);
              goto LABEL_399;
            }
LABEL_396:
            v182 = *((_DWORD *)ss_trace_buffer + 1);
            goto LABEL_397;
          }
          if (v121 == 2310)
          {
            v182 = *((_DWORD *)ss_trace_buffer + 1);
            v122 = v465;
            if (v182 == 112)
            {
              if ((ss_trace_buffer[8] & 0x8F) == 0)
                goto LABEL_400;
              v182 = 112;
            }
          }
          else
          {
            v122 = v465;
            if (v121 != 2312)
              goto LABEL_396;
            v182 = *((_DWORD *)ss_trace_buffer + 1);
            if (v182 == 32)
            {
              if ((ss_trace_buffer[8] & 0x8F) == 0)
                goto LABEL_400;
              v182 = 32;
            }
          }
LABEL_397:
          v55 = v182 >= (*((_DWORD *)ss_trace_buffer + 2) & 0xFu);
          v123 = v182 - (*((_DWORD *)ss_trace_buffer + 2) & 0xF);
          if (!v55)
            v123 = 0;
LABEL_399:
          if (v123 < 0x11)
            goto LABEL_555;
LABEL_400:
          v279 = *((_QWORD *)ss_trace_buffer + 4);
          if (v122)
            v279 = v279 * *v122 / v122[1];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v279);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = self;
          v116 = "stackshot_duration_prior_nsec";
LABEL_403:
          -[OSAStackShotReport addCustomField:value:into:](v115, "addCustomField:value:into:", v116, v112, v17);
          goto LABEL_430;
        case 2337:
          objc_msgSend(v17, "top");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v124
            || (v112 = v124, objc_msgSend(v124, "type") != 2307)
            && objc_msgSend(v112, "type") != 2353)
          {
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.21();
          }
          v125 = *(_DWORD *)ss_trace_buffer;
          if ((*(_DWORD *)ss_trace_buffer & 0xFFFFFFF0) == 0x20)
            v125 = 17;
          if (v125 <= 2309)
          {
            if (v125 == 17 || v125 == 19)
            {
              v126 = *((_DWORD *)ss_trace_buffer + 1);
              goto LABEL_410;
            }
LABEL_407:
            v183 = *((_DWORD *)ss_trace_buffer + 1);
            goto LABEL_408;
          }
          if (v125 == 2310)
          {
            v183 = *((_DWORD *)ss_trace_buffer + 1);
            if (v183 == 112)
            {
              if ((ss_trace_buffer[8] & 0x8F) == 0)
                goto LABEL_411;
              v183 = 112;
            }
          }
          else
          {
            if (v125 != 2312)
              goto LABEL_407;
            v183 = *((_DWORD *)ss_trace_buffer + 1);
            if (v183 == 32)
            {
              if ((ss_trace_buffer[8] & 0x8F) == 0)
                goto LABEL_411;
              v183 = 32;
            }
          }
LABEL_408:
          v55 = v183 >= (*((_DWORD *)ss_trace_buffer + 2) & 0xFu);
          v126 = v183 - (*((_DWORD *)ss_trace_buffer + 2) & 0xF);
          if (!v55)
            v126 = 0;
LABEL_410:
          if (v126 < 8)
            goto LABEL_430;
LABEL_411:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 2));
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "data");
          v280 = (void *)objc_claimAutoreleasedReturnValue();
          v281 = v280;
          v282 = v113;
          v283 = CFSTR("jetsamCoalition");
LABEL_428:
          objc_msgSend(v280, "setObject:forKeyedSubscript:", v282, v283);

          v17 = v476;
LABEL_429:

LABEL_430:
          goto LABEL_555;
        case 2344:
          objc_msgSend(v17, "top");
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v104, "type") != 2308)
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.19();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ss_trace_buffer + 16);
          v127 = objc_claimAutoreleasedReturnValue();
          v106 = (void *)v127;
          if (v127)
            v128 = (const __CFString *)v127;
          else
            v128 = CFSTR("<unknown>");
          objc_msgSend(v104, "data");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = v108;
          v110 = v128;
          v111 = CFSTR("dispatch_queue_label");
LABEL_143:
          objc_msgSend(v108, "setObject:forKeyedSubscript:", v110, v111);

          self = v475;
          goto LABEL_419;
        case 2352:
          objc_msgSend(v17, "top");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v129 || (v130 = v129, objc_msgSend(v129, "type") != 2353))
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.16();
          objc_msgSend(v130, "setPid:", *((unsigned int *)ss_trace_buffer + 10));
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "data");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "setObject:forKeyedSubscript:", v131, CFSTR("threadById"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)ss_trace_buffer + 10));
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "data");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "setObject:forKeyedSubscript:", v133, CFSTR("pid"));

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ss_trace_buffer + 44);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "data");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "setObject:forKeyedSubscript:", v135, CFSTR("procname"));

          v137 = self->super._notes;
          v138 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v130, "data");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("pid"));
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 4));
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "stringWithFormat:", CFSTR("Process %@ is in transition type %@"), v140, v141);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v137, "addObject:", v142);

          self = v475;
          v9 = v471;
          v10 = v473;
          goto LABEL_293;
        case 2371:
          if (objc_msgSend(v17, "count"))
          {
            objc_msgSend(v17, "top");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v143 = 0;
          }
          v188 = objc_alloc_init(OSASharedCacheEntry);
          -[OSASharedCacheEntry setSharedCacheInfo:](v188, "setSharedCacheInfo:", ss_trace_buffer + 16);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 14));
          v189 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v143, "type") == 2370)
            objc_msgSend(v143, "setPid:", *((unsigned int *)ss_trace_buffer + 14));
          objc_msgSend(v463, "setObject:forKeyedSubscript:", v188, v189);
          if (-[OSASharedCacheEntry isDefaultSharedCache](v188, "isDefaultSharedCache"))
          {
            v190 = v188;

            v464 = v190;
            self = v475;
          }

          goto LABEL_218;
        case 2373:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 4));
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v463, "objectForKeyedSubscript:", v144);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v145, "sharedCacheID"));
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          v147 = objc_msgSend(v146, "isEqual:", v144);

          if (v147)
          {
            v148 = v145;

            if (objc_msgSend(v476, "count"))
            {
              objc_msgSend(v476, "top");
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              v150 = v458;
              if (!v149)
                v150 = 0;
              if (v150 == 1)
              {
                memset(out, 0, sizeof(out));
                uuid_unparse((const unsigned __int8 *)(-[OSASharedCacheEntry original](v148, "original") + 8), out);
                v506[0] = CFSTR("uuid");
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
                v469 = (id)objc_claimAutoreleasedReturnValue();
                v507[0] = v469;
                v506[1] = CFSTR("slide");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[OSASharedCacheEntry original](v148, "original")[32]);
                v151 = (void *)objc_claimAutoreleasedReturnValue();
                v507[1] = v151;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v507, v506, 2);
                v152 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v149, "data");
                v153 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v153, "setObject:forKeyedSubscript:", v152, CFSTR("taskSpecificSharedCache"));

                v10 = v473;
                v9 = v471;

              }
            }
            else
            {
              v149 = 0;
            }

          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.3(v504, (uint64_t)v144, &v505);
            v148 = v468;
          }
          self = v475;

          v468 = v148;
          goto LABEL_419;
        case 2374:
          objc_msgSend(v17, "top");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v154 || (v155 = v154, objc_msgSend(v154, "type") != 2307))
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.22();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 2));
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "data");
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v157, "setObject:forKeyedSubscript:", v156, CFSTR("csFlags"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 6));
          v158 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v155, "data");
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v159, "setObject:forKeyedSubscript:", v158, CFSTR("csTrustLevel"));

          goto LABEL_293;
        case 2376:
          objc_msgSend(v17, "top");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v160 || (v143 = v160, objc_msgSend(v160, "type") != 2308))
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.23();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 2));
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v143, "data");
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v162, "setObject:forKeyedSubscript:", v161, CFSTR("exclaveScid"));

          v445 = *((unsigned int *)ss_trace_buffer + 6);
LABEL_218:

LABEL_419:
          v17 = v476;
          goto LABEL_555;
        default:
          if ((_DWORD)v22 != 2112)
          {
            if ((_DWORD)v22 == 1503811591)
              goto LABEL_555;
LABEL_58:
            v55 = v20 >= (*((_DWORD *)ss_trace_buffer + 2) & 0xFu);
            LODWORD(v20) = v20 - (*((_DWORD *)ss_trace_buffer + 2) & 0xF);
            if (v55)
              v20 = v20;
            else
              v20 = 0;
            NSLog(CFSTR("Unknown KCDATA %X, size %d, flags %X"), v22, v20, v22);
            goto LABEL_555;
          }
          objc_msgSend(v17, "top");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v163 || (v112 = v163, objc_msgSend(v163, "type") != 2307))
            -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.24();
          v164 = *(_DWORD *)ss_trace_buffer;
          if ((*(_DWORD *)ss_trace_buffer & 0xFFFFFFF0) == 0x20)
            v164 = 17;
          if (v164 <= 2309)
          {
            if (v164 == 17 || v164 == 19)
            {
              v165 = *((_DWORD *)ss_trace_buffer + 1);
              goto LABEL_426;
            }
            goto LABEL_423;
          }
          if (v164 == 2310)
          {
            v184 = *((_DWORD *)ss_trace_buffer + 1);
            if (v184 != 112)
              goto LABEL_424;
            if ((ss_trace_buffer[8] & 0x8F) != 0)
            {
              v184 = 112;
              goto LABEL_424;
            }
          }
          else
          {
            if (v164 != 2312)
            {
LABEL_423:
              v184 = *((_DWORD *)ss_trace_buffer + 1);
LABEL_424:
              v55 = v184 >= (*((_DWORD *)ss_trace_buffer + 2) & 0xFu);
              v165 = v184 - (*((_DWORD *)ss_trace_buffer + 2) & 0xF);
              if (!v55)
                v165 = 0;
LABEL_426:
              if (v165 < 0x10)
                goto LABEL_430;
              goto LABEL_427;
            }
            v184 = *((_DWORD *)ss_trace_buffer + 1);
            if (v184 != 32)
              goto LABEL_424;
            if ((ss_trace_buffer[8] & 0x8F) != 0)
            {
              v184 = 32;
              goto LABEL_424;
            }
          }
LABEL_427:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 2));
          v284 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "data");
          v285 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v285, "setObject:forKeyedSubscript:", v284, CFSTR("jitStartAddress"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 3));
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "data");
          v280 = (void *)objc_claimAutoreleasedReturnValue();
          v281 = v280;
          v282 = v113;
          v283 = CFSTR("jitEndAddress");
          goto LABEL_428;
      }
    }
    if ((int)v22 > 18)
    {
      if ((int)v22 > 49)
      {
        switch((_DWORD)v22)
        {
          case '2':
            v465 = (unsigned int *)(ss_trace_buffer + 16);
            break;
          case '3':
            self->_capture_absoluteTime = *((_QWORD *)ss_trace_buffer + 2);
            break;
          case '5':
            self->super._capture_time = (double)*((unint64_t *)ss_trace_buffer + 2) / 1000000.0 - v19;
            break;
          default:
            goto LABEL_58;
        }
        goto LABEL_555;
      }
      if ((_DWORD)v22 != 19)
      {
        if ((_DWORD)v22 != 20)
          goto LABEL_58;
        objc_msgSend(v17, "pop");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = *((_QWORD *)ss_trace_buffer + 1);
        if (v39 != objc_msgSend(v38, "tag"))
          -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.14();
        if (objc_msgSend(v38, "type") != 2308)
        {
          if (objc_msgSend(v38, "type") == 2307 || objc_msgSend(v38, "type") == 2353)
          {
            objc_msgSend(v38, "data");
            v166 = (void *)objc_claimAutoreleasedReturnValue();

            if (v166)
            {
              v167 = v460;
              if (v465)
                v167 = v460 * *v465 / v465[1];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v167 / 1000000000.0);
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "data");
              v169 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v169, "setObject:forKeyedSubscript:", v168, CFSTR("userTimeTask"));

              v170 = v462;
              v171 = v461;
              if (v465)
                v171 = v461 * *v465 / v465[1];
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v171 / 1000000000.0);
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "data");
              v173 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v173, "setObject:forKeyedSubscript:", v172, CFSTR("systemTimeTask"));

              if (objc_msgSend(v38, "unindexed_frames"))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v38, "unindexed_frames"));
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "data");
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v175, "setObject:forKeyedSubscript:", v174, CFSTR("unindexed_frames"));

                v446 = objc_msgSend(v38, "unindexed_frames") + v446;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v38, "pid"));
                v176 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v449, "addObject:", v176);

              }
              objc_msgSend(v38, "truncated_threads");
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              v178 = objc_msgSend(v177, "count");

              if (v178
                && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v38, "pid")),
                    v179 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v450, "addObject:", v179),
                    v179,
                    (excludeSection(v9, (uint64_t)CFSTR("stackResampling")) & 1) == 0))
              {
                v290 = objc_msgSend(v38, "pid");
                objc_msgSend(v38, "truncated_threads");
                v291 = (void *)objc_claimAutoreleasedReturnValue();
                v292 = self;
                v181 = v472;
                v180 = -[OSAStackShotReport resampleTruncatedBacktracesForTask:forThreads:usingCatalog:in:](v292, "resampleTruncatedBacktracesForTask:forThreads:usingCatalog:in:", v290, v291, v473, v472);

                if ((_DWORD)v180)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v180);
                  v293 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "data");
                  v294 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v294, "setObject:forKeyedSubscript:", v293, CFSTR("unindexed_rs_frames"));

                  v444 = (v180 + v444);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v38, "pid"));
                  v180 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v443, "addObject:", v180);

                  LODWORD(v180) = 1;
                }
                v170 = v462;
              }
              else
              {
                LODWORD(v180) = 0;
                v181 = v472;
              }
              if (v458 && ((objc_msgSend(v38, "unindexed_frames") == 0) & ~(_DWORD)v180) == 0)
              {
                objc_msgSend(v181, "valueForKey:", CFSTR("details"));
                v295 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "data");
                v296 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v296, "setObject:forKeyedSubscript:", v295, CFSTR("process_images"));

              }
              if (objc_msgSend(v38, "invalid_images"))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v38, "invalid_images"));
                v297 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "data");
                v298 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v298, "setObject:forKeyedSubscript:", v297, CFSTR("invalid_images"));

                v441 = objc_msgSend(v38, "invalid_images") + v441;
              }
              if ((v447 & 1) == 0)
              {
                v498 = &unk_1E4DFD8E8;
                v499 = CFSTR("processByPid");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v499, &v498, 1);
                v299 = (void *)objc_claimAutoreleasedReturnValue();
                v170[2](v170, v299);

              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v38, "pid"));
              v455 = (id)objc_claimAutoreleasedReturnValue();
              v496[0] = v455;
              objc_msgSend(v38, "data");
              v300 = (void *)objc_claimAutoreleasedReturnValue();
              v497[0] = v300;
              v496[1] = &unk_1E4DFD8D0;
              v301 = (void *)MEMORY[0x1E0CB37E8];
              pid = v475->_pid;
              v303 = objc_msgSend(v38, "pid");
              if (pid == v303)
              {
                v304 = 1;
                v305 = v462;
              }
              else
              {
                v306 = v475->_frontmostPids;
                v307 = (void *)MEMORY[0x1E0CB37E8];
                v308 = objc_msgSend(v38, "pid");
                v309 = v307;
                v305 = v462;
                objc_msgSend(v309, "numberWithInt:", v308);
                v404 = (void *)objc_claimAutoreleasedReturnValue();
                v304 = -[NSMutableArray containsObject:](v306, "containsObject:");
              }
              objc_msgSend(v301, "numberWithInt:", v304);
              v310 = (void *)objc_claimAutoreleasedReturnValue();
              v497[1] = v310;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v497, v496, 2);
              v311 = (void *)objc_claimAutoreleasedReturnValue();
              v305[2](v305, v311);

              if (pid != v303)
              LOBYTE(v447) = 1;
              v9 = v471;
              self = v475;
              v17 = v476;
            }
          }
          else
          {
            v286 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v287 = objc_msgSend(v38, "type");
              *(_DWORD *)out = 67109120;
              *(_DWORD *)&out[4] = v287;
              _os_log_impl(&dword_1A4D21000, v286, OS_LOG_TYPE_DEFAULT, "Unknown KCDATA CONTAINER %X", (uint8_t *)out, 8u);
            }
          }
          goto LABEL_554;
        }
        if (!objc_msgSend(v17, "count"))
          -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.13();
        v452 = (id)v13;
        objc_msgSend(v38, "data");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("id"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v38, "data");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("exclaveScid"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v43)
          goto LABEL_551;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%llX"), objc_msgSend(v43, "unsignedLongLongValue"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "data");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v44, CFSTR("exclaveScid"));

        v436 = v43;
        -[OSAExclaveContainer setThreadId:withScId:](v459, "setThreadId:withScId:", v41, v43);
        -[OSAExclaveContainer getFramesForThread:usingCatalog:](v459, "getFramesForThread:usingCatalog:", v41, v473);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v46, "count"))
          goto LABEL_550;
        objc_msgSend(v38, "data");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("kernelFrames"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v48, "count") < (unint64_t)v445)
        {
          v50 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v372 = objc_msgSend(v41, "unsignedLongLongValue");
            *(_DWORD *)out = 67109376;
            *(_DWORD *)&out[4] = v445;
            *(_WORD *)&out[8] = 2048;
            *(_QWORD *)&out[10] = v372;
            _os_log_error_impl(&dword_1A4D21000, v50, OS_LOG_TYPE_ERROR, "Exclave frames offset of %d for thread %llu is invalid", (uint8_t *)out, 0x12u);
          }
          v51 = self->super._notes;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Thread %llu with %lu kernel frames has exclave frames but invalid exclave frame offset of %d. Skipping adding exclave frames into kernel frames "), objc_msgSend(v41, "unsignedLongLongValue"), objc_msgSend(v48, "count"), v445);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v51, "addObject:", v52);
LABEL_549:

          v17 = v476;
LABEL_550:

          v43 = v436;
LABEL_551:
          objc_msgSend(v17, "top");
          v363 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v363, "data");
          v364 = (void *)objc_claimAutoreleasedReturnValue();

          if (v364)
          {
            objc_msgSend(v363, "data");
            v365 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v365, "objectForKeyedSubscript:", CFSTR("threadById"));
            v366 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v38, "data");
            v367 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v41);
            v368 = v38;
            v369 = v41;
            v370 = v43;
            v371 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v366, "setObject:forKeyedSubscript:", v367, v371);

            v43 = v370;
            v41 = v369;
            v38 = v368;

            v17 = v476;
          }

          v9 = v471;
          v13 = (unint64_t)v452;
LABEL_554:

          v10 = v473;
          goto LABEL_555;
        }
        if (v48)
        {
          v434 = v41;
          if (objc_msgSend(v48, "count"))
          {
            v288 = 0;
            do
            {
              if (v445 == v288)
                objc_msgSend(v49, "addObjectsFromArray:", v46);
              objc_msgSend(v48, "objectAtIndexedSubscript:", v288);
              v289 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "addObject:", v289);

              ++v288;
            }
            while (objc_msgSend(v48, "count") > v288);
          }
          if (objc_msgSend(v48, "count") == v445)
            objc_msgSend(v49, "addObjectsFromArray:", v46);
          self = v475;
          if ((_DWORD)v445)
          {
            v41 = v434;
LABEL_548:
            objc_msgSend(v38, "data");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "setObject:forKeyedSubscript:", v49, CFSTR("kernelFrames"));
            goto LABEL_549;
          }
          v362 = v475->super._notes;
          v41 = v434;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Thread %llu has an incorrect exclave frame offset %d"), objc_msgSend(v434, "unsignedLongLongValue"), 0);
          v361 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v362, "addObject:", v361);
        }
        else
        {
          v359 = v46;

          v360 = self->super._notes;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Thread %llu has exclave frames but no kernel frames"), objc_msgSend(v41, "unsignedLongLongValue"));
          v361 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](v360, "addObject:", v361);
          v49 = v359;
        }

        goto LABEL_548;
      }
      v56 = -[KCContainer initWithKCData:]([KCContainer alloc], "initWithKCData:", ss_trace_buffer, v13);
      objc_msgSend(v17, "push:", v56);

      if (*((_DWORD *)ss_trace_buffer + 4) != 2307)
        goto LABEL_555;
      v453 = (id)*((unsigned int *)ss_trace_buffer + 2);

      objc_msgSend(v472, "removeAllObjects");
      objc_msgSend(v466, "removeAllObjects");
      v57 = &v14[*((unsigned int *)ss_trace_buffer + 1)];
      v58 = v57 + 16;
      if ((unint64_t)(v57 + 16) > v13)
      {
        v468 = 0;
LABEL_277:
        v9 = v471;
        v10 = v473;
        goto LABEL_555;
      }
      v468 = 0;
      v191 = 1;
      while (2)
      {
        if ((unint64_t)&v58[*((unsigned int *)v57 + 1)] > v13)
          goto LABEL_277;
        v192 = *(_DWORD *)v57;
        if (*(_DWORD *)v57 == -242132755)
          goto LABEL_277;
        if ((v192 & 0xFFFFFFF0) == 0x20)
          v192 = 17;
        if (v192 > 19)
        {
          switch(v192)
          {
            case 20:
              if (!--v191)
                goto LABEL_277;
              break;
            case 2332:
              objc_msgSend(v473, "setKernelCache:address:size:", v57 + 24, *((_QWORD *)v57 + 2), 0);
              break;
            case 2373:
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v57 + 4));
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v463, "objectForKeyedSubscript:", v193);
              v194 = (void *)objc_claimAutoreleasedReturnValue();
              v195 = v194;
              if (v194
                && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v194, "sharedCacheID")),
                    v196 = (void *)objc_claimAutoreleasedReturnValue(),
                    v197 = objc_msgSend(v196, "isEqual:", v193),
                    v196,
                    v197))
              {
                v198 = v195;

                v199 = (void *)objc_msgSend(v476, "count");
                if (v199)
                {
                  objc_msgSend(v476, "top");
                  v199 = (void *)objc_claimAutoreleasedReturnValue();
                  v200 = v458;
                  if (!v199)
                    v200 = 0;
                  if (v200 == 1)
                  {
                    memset(out, 0, sizeof(out));
                    v470 = v199;
                    uuid_unparse((const unsigned __int8 *)(-[OSASharedCacheEntry original](v198, "original") + 8), out);
                    v500[0] = CFSTR("uuid");
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
                    v433 = (void *)objc_claimAutoreleasedReturnValue();
                    v501[0] = v433;
                    v500[1] = CFSTR("slide");
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[OSASharedCacheEntry original](v198, "original")[32]);
                    v430 = (void *)objc_claimAutoreleasedReturnValue();
                    v501[1] = v430;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v501, v500, 2);
                    v438 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v470, "data");
                    v201 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v201, "setObject:forKeyedSubscript:", v438, CFSTR("taskSpecificSharedCache"));

                    v199 = v470;
                  }
                }
                self = v475;

              }
              else
              {
                v211 = MEMORY[0x1E0C81028];
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)out = 138412290;
                  *(_QWORD *)&out[4] = v193;
                  _os_log_impl(&dword_1A4D21000, v211, OS_LOG_TYPE_DEFAULT, "Expected a task specific shared cache with id %@ but none was found", (uint8_t *)out, 0xCu);
                }
                v198 = v468;
                self = v475;
              }

              v468 = v198;
LABEL_275:
              v17 = v476;
              break;
          }
LABEL_276:
          v57 = &v58[*((unsigned int *)v57 + 1)];
          v58 = v57 + 16;
          if ((unint64_t)(v57 + 16) > v13)
            goto LABEL_277;
          continue;
        }
        break;
      }
      if (v192 != 17)
      {
        if (v192 == 19)
        {
          ++v191;
          if (*((_DWORD *)v57 + 4) == 2356)
          {
            objc_msgSend(v17, "top");
            v202 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v202, "data");
            v203 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v203, "parsePortLabelContainer:", v57, v13);

          }
        }
        goto LABEL_276;
      }
      v204 = *((_QWORD *)v57 + 1);
      v205 = HIDWORD(v204);
      if (HIDWORD(v204) != 48)
      {
        if (HIDWORD(v204) != 2350 && HIDWORD(v204) != 49)
          goto LABEL_275;
        objc_msgSend(v476, "top");
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_DWORD)v204)
        {
          v207 = v204;
          v208 = (const unsigned __int8 *)(v57 + 24);
          do
          {
            if (uuid_is_null(v208))
            {
              if (!*((_QWORD *)v208 - 1))
              {
                objc_msgSend(v206, "setInvalid_images:", objc_msgSend(v206, "invalid_images") + 1);
                goto LABEL_254;
              }
              v209 = v466;
            }
            else
            {
              v209 = v472;
            }
            objc_msgSend(v209, "addImage:address:size:", v208);
LABEL_254:
            v208 += 24;
            --v207;
          }
          while (v207);
        }
        objc_msgSend(v472, "sortByAddressAndSetInferredSizes");
        self = v475;
        if (!v453)
        {
          if ((_DWORD)v205 == 2350)
          {
            v210 = v472;
            objc_msgSend(v473, "setKernelTextExecImages:", v472);
            goto LABEL_273;
          }
LABEL_272:
          v210 = v472;
          objc_msgSend(v473, "setKernelImages:", v472);
LABEL_273:
          objc_msgSend(v210, "removeAllObjects");
        }
LABEL_274:

        goto LABEL_275;
      }
      objc_msgSend(v476, "top");
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      if (!(_DWORD)v204)
      {
LABEL_271:
        objc_msgSend(v472, "sortByAddressAndSetInferredSizes");
        if (!v453)
          goto LABEL_272;
        goto LABEL_274;
      }
      v212 = v204;
      v213 = (const unsigned __int8 *)(v57 + 20);
      while (2)
      {
        if (uuid_is_null(v213))
        {
          if (*((_DWORD *)v213 - 1))
          {
            v214 = v466;
            goto LABEL_268;
          }
          objc_msgSend(v206, "setInvalid_images:", objc_msgSend(v206, "invalid_images") + 1);
        }
        else
        {
          v214 = v472;
LABEL_268:
          objc_msgSend(v214, "addImage:address:size:", v213);
        }
        v213 += 20;
        if (!--v212)
          goto LABEL_271;
        continue;
      }
    }
    if ((int)v22 > 2)
    {
      if ((_DWORD)v22 != 3)
      {
        if ((_DWORD)v22 != 17)
          goto LABEL_58;
        v53 = *((_QWORD *)ss_trace_buffer + 1);
        if (v21 == 17)
        {
          if (SHIDWORD(v53) > 2310)
          {
            switch(HIDWORD(v53))
            {
              case 0x907:
                v54 = 4;
                break;
              case 0x908:
              case 0x909:
                goto LABEL_466;
              case 0x90A:
              case 0x90C:
                goto LABEL_415;
              case 0x90B:
              case 0x90D:
                v54 = 16;
                break;
              default:
                if (HIDWORD(v53) != 2369)
                  goto LABEL_466;
                v54 = 48;
                break;
            }
LABEL_467:
            v312 = (void *)objc_msgSend(v17, "count");
            if (v312)
            {
              objc_msgSend(v17, "top");
              v312 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v456 = v312;
            if (SHIDWORD(v53) <= 2342)
            {
              switch(HIDWORD(v53))
              {
                case 0x913:
                  if (!v312 || (v313 = v312, objc_msgSend(v312, "type") != 2308))
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.7();
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v314 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v313, "data");
                  v315 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v315, "setObject:forKeyedSubscript:", v314, CFSTR("kernelFrames"));

                  if ((_DWORD)v53)
                  {
                    v316 = (unsigned int *)(ss_trace_buffer + 16);
                    v53 = v53;
                    do
                    {
                      v317 = *v316++;
                      objc_msgSend(v10, "searchFrame:in:result:", v317, v472, 0);
                      v318 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v314, "addObject:", v318);

                      --v53;
                    }
                    while (v53);
                  }
                  goto LABEL_506;
                case 0x914:
                  if (!v312 || (v331 = v312, objc_msgSend(v312, "type") != 2308))
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.6();
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v314 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v331, "data");
                  v332 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v332, "setObject:forKeyedSubscript:", v314, CFSTR("kernelFrames"));

                  if ((_DWORD)v53)
                  {
                    v333 = (uint64_t *)(ss_trace_buffer + 16);
                    v53 = v53;
                    do
                    {
                      v334 = *v333++;
                      objc_msgSend(v10, "searchFrame:in:result:", v334, v472, 0);
                      v335 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v314, "addObject:", v335);

                      --v53;
                    }
                    while (v53);
                  }
                  goto LABEL_506;
                case 0x915:
                  if (!v312 || (v336 = v312, objc_msgSend(v312, "type") != 2308))
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.9();
                  objc_msgSend(v17, "parent");
                  v337 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v338 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v336, "data");
                  v339 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v339, "setObject:forKeyedSubscript:", v338, CFSTR("userFrames"));

                  if ((_DWORD)v53)
                  {
                    v340 = 0;
                    v341 = ss_trace_buffer + 16;
                    v342 = v53;
                    do
                    {
                      v343 = v340;
                      v344 = *v341;
                      v477 = v340;
                      objc_msgSend(v473, "searchFrame:in:result:", v344, v472, &v477);
                      v345 = (void *)objc_claimAutoreleasedReturnValue();
                      v340 = v477;

                      objc_msgSend(v338, "addObject:", v345);
                      if (!v340 && *v341)
                        objc_msgSend(v337, "setUnindexed_frames:", objc_msgSend(v337, "unindexed_frames") + 1);
                      ++v341;
                      --v342;
                    }
                    while (v342);

                  }
                  v9 = v471;
                  v10 = v473;
                  goto LABEL_528;
                case 0x916:
                  if (!v312 || (v346 = v312, objc_msgSend(v312, "type") != 2308))
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.8();
                  objc_msgSend(v17, "parent");
                  v347 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v348 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v346, "data");
                  v349 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v349, "setObject:forKeyedSubscript:", v348, CFSTR("userFrames"));

                  if ((_DWORD)v53)
                  {
                    v350 = 0;
                    v351 = (uint64_t *)(ss_trace_buffer + 16);
                    v352 = v53;
                    do
                    {
                      v353 = v350;
                      v354 = *v351;
                      v478 = v350;
                      objc_msgSend(v473, "searchFrame:in:result:", v354, v472, &v478);
                      v355 = (void *)objc_claimAutoreleasedReturnValue();
                      v350 = v478;

                      objc_msgSend(v348, "addObject:", v355);
                      if (!v350 && *v351)
                        objc_msgSend(v347, "setUnindexed_frames:", objc_msgSend(v347, "unindexed_frames") + 1);
                      ++v351;
                      --v352;
                    }
                    while (v352);

                    v10 = v473;
                  }

                  v9 = v471;
LABEL_528:
                  v17 = v476;
                  goto LABEL_540;
                case 0x917:
                case 0x918:
                case 0x919:
                case 0x91A:
                case 0x91B:
                case 0x91C:
                  goto LABEL_500;
                case 0x91D:
                  if (!v312
                    || objc_msgSend(v312, "type") != 2307
                    && objc_msgSend(v456, "type") != 2353)
                  {
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.11();
                  }
                  objc_msgSend(v456, "data");
                  v356 = (void *)objc_claimAutoreleasedReturnValue();

                  v312 = v456;
                  if (!v356)
                    goto LABEL_541;
                  objc_msgSend(v456, "data");
                  v357 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v357, "addWaitInfoDesc:count:elSize:", ss_trace_buffer + 16, v53, v54);
                  goto LABEL_539;
                default:
                  if ((HIDWORD(v53) - 48) < 2)
                    goto LABEL_487;
                  if (HIDWORD(v53) != 2311)
                    goto LABEL_500;
                  if (!v312
                    || objc_msgSend(v312, "type") != 2307
                    && objc_msgSend(v456, "type") != 2353)
                  {
                    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.10();
                  }
                  objc_msgSend(v456, "data");
                  v325 = (void *)objc_claimAutoreleasedReturnValue();

                  v312 = v456;
                  if (!v325)
                    goto LABEL_541;
                  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                  v314 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v456, "data");
                  v326 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v326, "setObject:forKeyedSubscript:", v314, CFSTR("donatingPids"));

                  if ((_DWORD)v53)
                  {
                    v327 = (unsigned int *)(ss_trace_buffer + 16);
                    v53 = v53;
                    do
                    {
                      v328 = *v327++;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v328);
                      v329 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v314, "addObject:", v329);

                      --v53;
                    }
                    while (v53);
                  }
LABEL_506:

                  v17 = v476;
                  break;
              }
              goto LABEL_507;
            }
            switch(HIDWORD(v53))
            {
              case 0x92E:
LABEL_487:
                if (!v312
                  || (v319 = objc_msgSend(v312, "type") == 2307, v312 = v456, !v319)
                  && (v319 = objc_msgSend(v456, "type") == 2353, v312 = v456, !v319))
                {
                  -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.5();
                }
                goto LABEL_541;
              case 0x929:
                if (!v312
                  || objc_msgSend(v312, "type") != 2307
                  && objc_msgSend(v456, "type") != 2353)
                {
                  -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.12();
                }
                objc_msgSend(v456, "data");
                v358 = (void *)objc_claimAutoreleasedReturnValue();

                v312 = v456;
                if (!v358)
                  goto LABEL_541;
                objc_msgSend(v456, "data");
                v357 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v357, "addTurnstileInfoDesc:count:elSize:", ss_trace_buffer + 16, v53, v54);
LABEL_539:

                break;
              case 0x927:
                if (!v312)
                  goto LABEL_541;
                v319 = objc_msgSend(v312, "type") == 2370;
                v312 = v456;
                if (!v319)
                  goto LABEL_541;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v456, "pid"));
                v320 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v463, "objectForKeyedSubscript:", v320);
                v321 = (void *)objc_claimAutoreleasedReturnValue();
                v322 = v321;
                if (v321
                  && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v321, "sharedCacheID")),
                      v323 = (void *)objc_claimAutoreleasedReturnValue(),
                      v324 = objc_msgSend(v323, "isEqual:", v320),
                      v323,
                      v17 = v476,
                      v324))
                {
                  objc_msgSend(v322, "setSharedCacheLayout:andCount:", ss_trace_buffer + 16, v53);
                }
                else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.3(v502, (uint64_t)v320, &v503);
                }

LABEL_507:
                v9 = v471;
                break;
              default:
LABEL_500:
                v330 = kcdata_iter_size((uint64_t)ss_trace_buffer);
                NSLog(CFSTR("Unknown KCDATA ARRAY type %X, count %d, size %d, flags %llX"), HIDWORD(v53), v53, v330, *((_QWORD *)ss_trace_buffer + 1));
                break;
            }
LABEL_540:
            v312 = v456;
LABEL_541:

            self = v475;
            goto LABEL_555;
          }
          switch(HIDWORD(v53))
          {
            case 0x30:
              v54 = 20;
              goto LABEL_467;
            case 0x31:
              v54 = 24;
              goto LABEL_467;
            case 0x81A:
LABEL_415:
              v54 = 8;
              goto LABEL_467;
          }
        }
        else if ((_DWORD)v53)
        {
          v54 = (v20 - (*(_DWORD *)ss_trace_buffer & 0xF)) / v53;
          goto LABEL_467;
        }
LABEL_466:
        v54 = 0;
        goto LABEL_467;
      }
      v36 = ss_trace_buffer + 16;
      if (ss_trace_buffer != (char *)-48)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)ss_trace_buffer + 6));
        v37 = objc_claimAutoreleasedReturnValue();
        goto LABEL_71;
      }
    }
    else if ((_DWORD)v22 == 1)
    {
      if (ss_trace_buffer != (char *)-48)
      {
        v36 = ss_trace_buffer + 16;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", ss_trace_buffer + 48);
        v37 = objc_claimAutoreleasedReturnValue();
        goto LABEL_71;
      }
    }
    else
    {
      if ((_DWORD)v22 != 2)
        goto LABEL_58;
      v36 = ss_trace_buffer + 16;
      if (ss_trace_buffer != (char *)-48)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)ss_trace_buffer + 12));
        v37 = objc_claimAutoreleasedReturnValue();
LABEL_71:
        v59 = (void *)v37;
        -[OSAStackShotReport addCustomField:value:into:](self, "addCustomField:value:into:", v36, v37, v17);

      }
    }
LABEL_555:
    ss_trace_buffer = &v14[*((unsigned int *)ss_trace_buffer + 1)];
    v14 = ss_trace_buffer + 16;
    if ((unint64_t)(ss_trace_buffer + 16) > v13)
      goto LABEL_595;
  }
  if (objc_msgSend(v17, "count"))
    -[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:].cold.2();
  -[OSAExclaveContainer appendNotesTo:](v459, "appendNotesTo:", self->super._notes);
  v8 = v462;
  if ((v447 & 1) != 0)
  {
    v485 = &unk_1E4DFD900;
    v486 = &stru_1E4DEECB8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v486, &v485, 1);
    v373 = (void *)objc_claimAutoreleasedReturnValue();
    v462[2](v462, v373);

  }
  v374 = v458;
  if (!v464)
    v374 = 0;
  if (v374 == 1)
  {
    memset(out, 0, sizeof(out));
    uuid_unparse((const unsigned __int8 *)(-[OSASharedCacheEntry original](v464, "original") + 8), out);
    v483 = CFSTR("systemDefaultSharedCache");
    v481[0] = CFSTR("uuid");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
    v375 = (void *)objc_claimAutoreleasedReturnValue();
    v482[0] = v375;
    v481[1] = CFSTR("slide");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", (_QWORD)-[OSASharedCacheEntry original](v464, "original")[32]);
    v376 = (void *)objc_claimAutoreleasedReturnValue();
    v482[1] = v376;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v482, v481, 2);
    v377 = (void *)objc_claimAutoreleasedReturnValue();
    v484 = v377;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v484, &v483, 1);
    v378 = (void *)objc_claimAutoreleasedReturnValue();
    v462[2](v462, v378);

    self = v475;
  }
  if ((_DWORD)v448)
  {
    v474 = self->super._notes;
    v379 = (void *)MEMORY[0x1E0CB3940];
    v380 = objc_msgSend(v450, "count");
    objc_msgSend(v450, "sortedPids");
    v381 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v379, "stringWithFormat:", CFSTR("resampled %d of %d threads with truncated backtraces from %d pids: %@"), v448, v457, v380, v381);
    v382 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v474, "addObject:", v382);

    self = v475;
    if (v442)
    {
      v479 = CFSTR("postSampleVMStats");
      -[OSAStackShotReport getVMStatistics](v475, "getVMStatistics");
      v383 = (void *)objc_claimAutoreleasedReturnValue();
      v480 = v383;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v480, &v479, 1);
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      v462[2](v462, v384);

    }
  }
  v385 = v467;
  if (objc_msgSend(v467, "count"))
  {
    v386 = self->super._notes;
    v387 = (void *)MEMORY[0x1E0CB3940];
    v388 = objc_msgSend(v467, "count");
    objc_msgSend(v467, "sortedPids");
    v389 = (void *)objc_claimAutoreleasedReturnValue();
    v403 = v388;
    v385 = v467;
    objc_msgSend(v387, "stringWithFormat:", CFSTR("resampled %d of %d images missing from %d pids: %@"), v440, v441, v403, v389);
    v390 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v386, "addObject:", v390);

    self = v475;
  }
  if ((_DWORD)v446)
  {
    v391 = self->super._notes;
    v392 = (void *)MEMORY[0x1E0CB3940];
    v393 = objc_msgSend(v449, "count");
    objc_msgSend(v449, "sortedPids");
    v394 = (void *)objc_claimAutoreleasedReturnValue();
    v401 = v393;
    v385 = v467;
    objc_msgSend(v392, "stringWithFormat:", CFSTR("%d unindexed user-stack frames from %d pids: %@"), v446, v401, v394);
    v395 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v391, "addObject:", v395);

    self = v475;
  }
  if ((_DWORD)v444)
  {
    v396 = self->super._notes;
    v397 = (void *)MEMORY[0x1E0CB3940];
    v398 = objc_msgSend(v443, "count");
    objc_msgSend(v443, "sortedPids");
    v399 = (void *)objc_claimAutoreleasedReturnValue();
    v402 = v398;
    v385 = v467;
    objc_msgSend(v397, "stringWithFormat:", CFSTR("%d unindexed re-sampled frames from %d pids: %@"), v444, v402, v399);
    v400 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v396, "addObject:", v400);

  }
LABEL_8:

}

- (BOOL)includeSyslog
{
  return self->_includeSyslog;
}

- (void)setIncludeSyslog:(BOOL)a3
{
  self->_includeSyslog = a3;
}

- (NSArray)frontmostPids
{
  return &self->_frontmostPids->super;
}

- (unint64_t)capture_absoluteTime
{
  return self->_capture_absoluteTime;
}

- (const)ss_trace_buffer
{
  return self->_ss_trace_buffer;
}

- (unsigned)ss_trace_length
{
  return self->_ss_trace_length;
}

- (int)jetsamLevel
{
  return self->_jetsamLevel;
}

- (void)setJetsamLevel:(int)a3
{
  self->_jetsamLevel = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (BOOL)dead_snapshot
{
  return self->_dead_snapshot;
}

- (void)setDead_snapshot:(BOOL)a3
{
  self->_dead_snapshot = a3;
}

- (unsigned)ss_sequence
{
  return self->_ss_sequence;
}

- (void)setSs_sequence:(unsigned int)a3
{
  self->_ss_sequence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extras, 0);
  objc_storeStrong((id *)&self->_frontmostPids, 0);
  objc_storeStrong((id *)&self->_thermalSensorValues, 0);
  objc_storeStrong((id *)&self->_additionalPayload, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.1()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1976, "!KCDATA_ITER_FOREACH_FAILED(kcData)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.2()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1977, "[kc_stack count] == 0");
}

- (void)decodeKCDataWithBlock:(uint8_t *)a1 withTuning:(uint64_t)a2 usingCatalog:(_QWORD *)a3 .cold.3(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138543362;
  *a3 = a2;
  OUTLINED_FUNCTION_0(&dword_1A4D21000, MEMORY[0x1E0C81028], (uint64_t)a3, "Expected a task specific shared cache with ID %{public}@ but none was found", a1);
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.5()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1267, "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.6()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1272, "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.7()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1282, "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.8()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1294, "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.9()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1312, "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.10()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1327, "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.11()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1339, "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.12()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1346, "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.13()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1499, "[kc_stack count]");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.14()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1495, "kcdata_iter_container_id(kcData) == end.tag");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.15()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1605, "container && (container.type == STACKSHOT_KCCONTAINER_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.16()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1807, "container && (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.17()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1818, "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.18()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1874, "container.type == STACKSHOT_KCCONTAINER_THREAD");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.19()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1884, "container.type == STACKSHOT_KCCONTAINER_THREAD");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.20()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1895, "container");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.21()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1916, "container && ((container.type == STACKSHOT_KCCONTAINER_TASK) || (container.type == STACKSHOT_KCCONTAINER_TRANSITIONING_TASK))");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.22()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1926, "container && (container.type == STACKSHOT_KCCONTAINER_TASK)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.23()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1935, "container && (container.type == STACKSHOT_KCCONTAINER_THREAD)");
}

- (void)decodeKCDataWithBlock:withTuning:usingCatalog:.cold.24()
{
  __assert_rtn("-[OSAStackShotReport decodeKCDataWithBlock:withTuning:usingCatalog:]", "OSAStackShotReport.m", 1944, "container && (container.type == STACKSHOT_KCCONTAINER_TASK)");
}

@end
