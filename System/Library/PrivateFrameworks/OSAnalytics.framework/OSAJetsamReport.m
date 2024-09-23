@implementation OSAJetsamReport

- (OSAJetsamReport)initWithIncidentID:(id)a3 visibilityEndowmentState:(id)a4 audioAssertionState:(id)a5
{
  id v9;
  id v10;
  id v11;
  OSAJetsamReport *v12;
  OSAJetsamReport *v13;
  NSSet *v14;
  NSSet *visibilityEndowmentState;
  NSSet *v16;
  NSSet *audioAssertionState;
  NSString *largestActiveApp;
  uint64_t v19;
  NSMutableArray *killedActiveApps;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)OSAJetsamReport;
  v12 = -[OSAReport init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    if (v9)
      objc_storeStrong((id *)&v12->super._incidentID, a3);
    if (v10)
      v14 = (NSSet *)v10;
    else
      v14 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    visibilityEndowmentState = v13->_visibilityEndowmentState;
    v13->_visibilityEndowmentState = v14;

    if (v11)
      v16 = (NSSet *)v11;
    else
      v16 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    audioAssertionState = v13->_audioAssertionState;
    v13->_audioAssertionState = v16;

    largestActiveApp = v13->_largestActiveApp;
    v13->_largestActiveApp = (NSString *)&stru_1E4DEECB8;

    v19 = objc_opt_new();
    killedActiveApps = v13->_killedActiveApps;
    v13->_killedActiveApps = (NSMutableArray *)v19;

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_snapshot);
  v3.receiver = self;
  v3.super_class = (Class)OSAJetsamReport;
  -[OSAJetsamReport dealloc](&v3, sel_dealloc);
}

- (id)problemType
{
  return CFSTR("298");
}

- (id)appleCareDetails
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_killedActiveApps, "count"))
    return 0;
  -[NSMutableArray componentsJoinedByString:](self->_killedActiveApps, "componentsJoinedByString:", CFSTR(";"),
    self->_largestActiveApp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_wiredBytes);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)reportNamePrefix
{
  return CFSTR("JetsamEvent");
}

- (id)additionalIPSMetadata
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("incident_id");
  -[OSAReport incidentID](self, "incidentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (self->_aleFlag)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ale_flag"));
  return v5;
}

- (BOOL)saveWithOptions:(id)a3
{
  _BOOL8 v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OSAJetsamReport;
  v4 = -[OSAReport saveWithOptions:](&v6, sel_saveWithOptions_, a3);
  -[OSAJetsamReport instrumentEvents:](self, "instrumentEvents:", v4);
  return v4;
}

+ (jetsam_snapshot)fetchSnapshotWithFlags:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int *v9;
  jetsam_snapshot *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t var4;
  id v14;
  uint64_t v16;
  void *v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = memorystatus_control();
  if ((v5 & 0x80000000) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = __error();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("memorystatus_control(MEMORYSTATUS_CMD_GET_JETSAM_SNAPSHOT) failed: %s"), strerror(*v9), v20);
    goto LABEL_13;
  }
  v6 = v5;
  if (!(_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("kernel returned (0) from memorystatus_control(MEMORYSTATUS_CMD_GET_JETSAM_SNAPSHOT) -- no jetsam data available"), v19, v20);
    goto LABEL_13;
  }
  v7 = v5;
  if (v5 >= 0xC9 && __ROR8__(0xAF8AF8AF8AF8AF8BLL * (v5 - 200), 3) >= 0xEA0EA0EA0EA0EBuLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("memorystatus_control gave snapshot size (%lu) not multiple of jetsam entry type (%lu)"), v5 - 200, 280);
LABEL_13:
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v10 = (jetsam_snapshot *)malloc_type_malloc(v5, 0x3D3D2569uLL);
  if (v10)
  {
    v11 = memorystatus_control();
    if ((_DWORD)v11 != (_DWORD)v6)
    {
      v16 = v11;
      v17 = (void *)MEMORY[0x1E0CB3940];
      v18 = __error();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("memorystatus_control returned unexpected value - %d: %s"), v16, strerror(*v18));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      free(v10);
LABEL_14:
      v10 = 0;
      if (!v14)
        goto LABEL_19;
      goto LABEL_15;
    }
    v12 = ((unint64_t)v6 - 200) / 0x118;
    var4 = v10->var4;
    if (v12 >= var4)
    {
      v14 = 0;
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got fewer jetsam entries from the kernel; received %zu, expected %zu"),
      (v7 - 200) / 0x118uLL,
      var4);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v10->var4 = v12;
    if (!v14)
      goto LABEL_19;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to allocate %d bytes for jetsam snapshot"), v6);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_19;
  }
LABEL_15:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  if (a4)
  {
    v14 = objc_retainAutorelease(v14);
    *a4 = v14;
  }
LABEL_19:

  return v10;
}

- (unint64_t)getEventPriority:(id)a3 terminationReason:(unint64_t)a4 priority:(int64_t)a5
{
  if (objc_msgSend(&unk_1E4DFEE58, "containsObject:", a3))
  {
    self->_aleFlag = 1;
    return 3;
  }
  else if (a4 <= 9 && ((1 << a4) & 0x284) != 0)
  {
    return 0;
  }
  else if (a5 <= 89)
  {
    return 1;
  }
  else
  {
    return 2;
  }
}

- (void)updateLogLimitFor:(unint64_t)a3
{
  char v5;
  void *v6;
  const __CFString *v7;

  v5 = 0;
  v6 = &unk_1E4DFD918;
  v7 = CFSTR("298_LOW_PRIORITY");
  switch(a3)
  {
    case 0uLL:
      goto LABEL_5;
    case 1uLL:
      v6 = &unk_1E4DFD930;
      goto LABEL_6;
    case 2uLL:
      v5 = 0;
      v6 = &unk_1E4DFD930;
      v7 = CFSTR("298_HIGH_PRIORITY");
      goto LABEL_5;
    case 3uLL:
      v6 = 0;
      v5 = 1;
      v7 = CFSTR("298_ALE");
LABEL_5:
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._logWritingOptions, "setObject:forKeyedSubscript:", v7, CFSTR("LogType"));
      if ((v5 & 1) == 0)
LABEL_6:
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._logWritingOptions, "setObject:forKeyedSubscript:", v6, CFSTR("set-log-limit"));
      break;
    default:
      return;
  }
}

+ (int)instrumentEventsWithAudioAssertionState:(id)a3 visibliltyEndowmentState:(id)a4
{
  return 0;
}

- (void)instrumentEvents:(BOOL)a3
{
  jetsam_snapshot *snapshot;
  OSAJetsamReport *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  char *v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSSet *audioAssertionState;
  void *v14;
  uint64_t v15;
  NSSet *visibilityEndowmentState;
  void *v17;
  uint64_t v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  mach_timebase_info info;
  _QWORD v49[4];
  _QWORD v50[4];
  _QWORD v51[16];
  _QWORD v52[16];
  char out[40];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  snapshot = self->_snapshot;
  if (snapshot)
  {
    if (snapshot->var4)
    {
      v4 = self;
      v5 = 0;
      v6 = 0;
      v7 = &unk_1E4DFD948;
      if (a3)
        v7 = &unk_1E4DFD918;
      v37 = v7;
      do
      {
        v8 = (char *)snapshot + v5 * 280;
        if (snapshot->var5[v5].var8)
        {
          v9 = (unsigned int *)(v8 + 200);
          processName();
          v10 = objc_claimAutoreleasedReturnValue();
          killDescription(*((_QWORD *)v8 + 35));
          v11 = objc_claimAutoreleasedReturnValue();
          info = 0;
          v12 = 0;
          v47 = v6;
          if (!mach_timebase_info(&info) && info.denom)
            v12 = (unint64_t)((double)((snapshot->var5[v5].var23 - snapshot->var5[v5].var22)
                                            * info.numer
                                            / info.denom
                                            / 0xF4240)
                                   / 1000.0);
          audioAssertionState = v4->_audioAssertionState;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[NSSet containsObject:](audioAssertionState, "containsObject:", v14);

          visibilityEndowmentState = v4->_visibilityEndowmentState;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[NSSet containsObject:](visibilityEndowmentState, "containsObject:", v17);

          memset(out, 0, 37);
          v19 = (char *)snapshot + v5 * 280;
          uuid_unparse_lower(snapshot->var5[v5].var6, out);
          v51[0] = CFSTR("name");
          v51[1] = CFSTR("reason");
          v52[0] = v10;
          v52[1] = v11;
          v51[2] = CFSTR("priority");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", snapshot->var5[v5].var2);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v52[2] = v46;
          v51[3] = CFSTR("uptime");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v52[3] = v45;
          v51[4] = CFSTR("audio");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v52[4] = v44;
          v51[5] = CFSTR("visible");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v52[5] = v43;
          v51[6] = CFSTR("uuid");
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v52[6] = v42;
          v51[7] = CFSTR("max_pages");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", snapshot->var5[v5].var10);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v52[7] = v41;
          v51[8] = CFSTR("suspended");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", snapshot->var5[v5].var3 & 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v52[8] = v40;
          v51[9] = CFSTR("frozen");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (snapshot->var5[v5].var3 >> 1) & 1);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v52[9] = v39;
          v51[10] = CFSTR("thawed");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (snapshot->var5[v5].var3 >> 2) & 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v52[10] = v20;
          v51[11] = CFSTR("tracked");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (snapshot->var5[v5].var3 >> 3) & 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v52[11] = v21;
          v51[12] = CFSTR("can_idle_exit");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (snapshot->var5[v5].var3 >> 4) & 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v52[12] = v22;
          v51[13] = CFSTR("dirty");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((_DWORD *)v19 + 61) >> 5) & 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v52[13] = v23;
          v51[14] = CFSTR("assertion");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((_DWORD *)v19 + 61) >> 6) & 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v51[15] = CFSTR("logwritten");
          v52[14] = v24;
          v52[15] = v37;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 16);
          v25 = (__CFString *)v11;
          v26 = (__CFString *)v10;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

          v28 = v26;
          v29 = v25;

          if (OSARTCIsProcessOfInterest(v28))
          {
            v49[0] = CFSTR("crk");
            +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "crashReporterKey");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v50[0] = v31;
            v49[1] = CFSTR("dirty");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*((_DWORD *)v19 + 61) >> 5) & 1);
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = (void *)v32;
            if (v28)
              v34 = v28;
            else
              v34 = CFSTR("<unknown>");
            v50[1] = v32;
            v50[2] = v34;
            v49[2] = CFSTR("name");
            v49[3] = CFSTR("reason");
            if (v29)
              v35 = v29;
            else
              v35 = CFSTR("<unknown>");
            v50[3] = v35;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 4);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            rtcsc_send(2004, 2004, v36);

          }
          v4 = self;
          snapshot = self->_snapshot;
          v6 = v47;
        }
        ++v6;
        ++v5;
      }
      while (snapshot->var4 > v6);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[OSAJetsamReport instrumentEvents:].cold.1();
  }
}

- (void)fetchWiredMemoryInfo
{
  __int16 v5;
  uint8_t v6[10];
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedIntValue");
  OUTLINED_FUNCTION_0_2();
  v7 = a2;
  v8 = v5;
  v9 = a3;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "memorystatus_control for command %d returned unexpected valud of %d which does not match buffer size of %d", v6, 0x14u);
  OUTLINED_FUNCTION_2();
}

- (void)acquireJetsamDataWithFlags:(unsigned int)a3
{
  uint64_t v3;
  jetsam_snapshot *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  jetsam_snapshot *snapshot;
  unint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  int v22;
  int v23;
  BOOL v24;
  int v25;
  char *v26;
  void *v27;
  char v28;
  __CFString *v29;
  __CFString *v30;
  id v31;
  unint64_t v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v3 = *(_QWORD *)&a3;
  v40 = *MEMORY[0x1E0C80C00];
  self->super._capture_time = CFAbsoluteTimeGetCurrent();
  v33 = 0;
  v5 = +[OSAJetsamReport fetchSnapshotWithFlags:error:](OSAJetsamReport, "fetchSnapshotWithFlags:error:", v3, &v33);
  v6 = v33;
  self->_snapshot = v5;
  if (v6)
    -[NSMutableArray addObject:](self->super._notes, "addObject:", v6);
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "appleInternal") & 1) != 0)
  {
    -[OSAJetsamReport problemType](self, "problemType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("298"));

    if (v9)
      -[OSAJetsamReport fetchWiredMemoryInfo](self, "fetchWiredMemoryInfo");
  }
  else
  {

  }
  snapshot = self->_snapshot;
  if (snapshot)
  {
    v31 = v6;
    self->_wiredBytes = *MEMORY[0x1E0C85AD8] * snapshot->var3.var5;
    self->_isSuspendedOnlyJetsam = 1;
    if (snapshot->var4)
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v32 = 0;
      v14 = 288;
      do
      {
        v15 = (char *)snapshot + v14;
        v16 = *(_QWORD *)((char *)snapshot + v14 - 8);
        v17 = v16 == 2 || v16 == 7;
        if (v17
          || ((v23 = *((_DWORD *)v15 - 11), v16) ? (v24 = (*((_DWORD *)v15 - 11) & 1) == 0) : (v24 = 0),
              v24
           && ((v23 & 0x10) == 0
            || (*(_QWORD *)((char *)snapshot + v14 - 16) & 0x12B1FLL) != 0
            || (v25 = strcmp((const char *)snapshot + v14 - 84, "SpringBoard"), (v23 & 0x20) != 0)
            || !v25)))
        {
          self->_isSuspendedOnlyJetsam = 0;
        }
        if (!v12 || *(unint64_t *)((char *)&snapshot->var0 + v14) > *((_QWORD *)v12 + 11))
          v12 = v15 - 88;
        if ((*((_BYTE *)snapshot + v14 - 44) & 1) == 0
          && (!v13 || *(unint64_t *)((char *)&snapshot->var0 + v14) > *((_QWORD *)v13 + 11)))
        {
          v13 = v15 - 88;
        }
        if (v16)
        {
          ++self->_killed_or_suspended_count;
          processName();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((*((_BYTE *)snapshot + v14 - 44) & 1) == 0)
            -[NSMutableArray addObject:](self->_killedActiveApps, "addObject:", v18);
          v19 = -[OSAJetsamReport getEventPriority:terminationReason:priority:](self, "getEventPriority:terminationReason:priority:", v18, *((_QWORD *)v15 - 1), *(int *)((char *)snapshot + v14 - 48));
          v20 = v32;
          if (v32 <= v19)
            v20 = v19;
          v32 = v20;
          killDescription(*((_QWORD *)v15 - 1));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v22 = *((_DWORD *)v15 - 22);
            *(_DWORD *)buf = 138543874;
            v35 = v18;
            v36 = 1024;
            v37 = v22;
            v38 = 2114;
            v39 = v21;
            _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Process %{public}@ [%d] killed by jetsam reason %{public}@", buf, 0x1Cu);
          }

          snapshot = self->_snapshot;
        }
        ++v11;
        v14 += 280;
      }
      while (snapshot->var4 > v11);
    }
    else
    {
      v32 = 0;
      v13 = 0;
      v12 = 0;
    }
    v26 = v13;
    -[OSAJetsamReport problemType](self, "problemType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("298"));

    if ((v28 & 1) != 0)
      -[OSAJetsamReport updateLogLimitFor:](self, "updateLogLimitFor:", v32);
    if (v12)
    {
      processName();
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = CFSTR("none");
    }
    v6 = v31;
    objc_storeStrong((id *)&self->_largestProcess, v29);
    if (v12)

    if (v26)
    {
      processName();
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = CFSTR("none");
      v26 = 0;
    }
    objc_storeStrong((id *)&self->_largestActiveApp, v30);
    if (v26)

  }
}

- (void)acquireJetsamData
{
  -[OSAJetsamReport acquireJetsamDataWithFlags:](self, "acquireJetsamDataWithFlags:", 0);
}

- (BOOL)alreadyDumpedSuspendedJetsamLogToday
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastSuspendedLogDumpedDaySince1970"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(v3, "integerValue");
    v5 = v4 == +[OSAJetsamReport _daysSince1970](OSAJetsamReport, "_daysSince1970");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_setDumpedSuspendedJetsamLog
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInteger:forKey:", +[OSAJetsamReport _daysSince1970](OSAJetsamReport, "_daysSince1970"), CFSTR("lastSuspendedLogDumpedDaySince1970"));

}

- (BOOL)isActionable
{
  NSMutableArray *notes;
  void *v4;
  const __CFString *v5;
  void *v7;

  if (self->_snapshot)
  {
    if (self->_killed_or_suspended_count)
    {
      if (!self->_isSuspendedOnlyJetsam
        || -[OSAReport isAppleTV](self, "isAppleTV")
        || !-[OSAJetsamReport alreadyDumpedSuspendedJetsamLogToday](self, "alreadyDumpedSuspendedJetsamLogToday"))
      {
        return 1;
      }
      notes = self->super._notes;
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = CFSTR("suspended-only jetsam log already dumped today");
    }
    else
    {
      notes = self->super._notes;
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = CFSTR("No processes were jettisoned (either killed or suspended)");
    }
    objc_msgSend(v4, "stringWithFormat:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](notes, "addObject:", v7);

  }
  return 0;
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
  const __CFString *event_reason;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSString *largestProcess;
  void *v30;
  void *v31;
  jetsam_snapshot *snapshot;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSSet *visibilityEndowmentState;
  void *v40;
  const __CFString *v41;
  uint64_t v42;
  const __CFString *v43;
  char *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  unint64_t v62;
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
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  NSMutableArray *zones;
  void *v90;
  NSMutableArray *tags;
  void *v92;
  NSMutableArray *notes;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void (**v99)(id, void *);
  void *v100;
  int v101;
  void *v102;
  void *v103;
  OSAJetsamReport *v104;
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
  jetsam_snapshot *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  mach_timebase_info info;
  const __CFString *v123;
  NSMutableArray *v124;
  const __CFString *v125;
  NSMutableArray *v126;
  const __CFString *v127;
  NSMutableArray *v128;
  _QWORD v129[2];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[2];
  _QWORD v134[12];
  _QWORD v135[12];
  char out[40];
  _QWORD v137[9];
  _QWORD v138[9];
  _QWORD v139[10];
  _QWORD v140[10];
  _QWORD v141[5];
  _QWORD v142[5];
  _QWORD v143[3];
  _QWORD v144[3];
  _QWORD v145[7];
  _QWORD v146[10];

  v146[7] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a4;
  v145[0] = CFSTR("incident");
  -[OSAReport incidentID](self, "incidentID");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v146[0] = v119;
  v145[1] = CFSTR("crashReporterKey");
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v116, "crashReporterKey");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v146[1] = v113;
  v145[2] = CFSTR("product");
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v146[2] = v7;
  v145[3] = CFSTR("build");
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "productNameVersionBuildString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v146[3] = v9;
  v145[4] = CFSTR("kernel");
  objc_msgSend((id)objc_opt_class(), "kernelVersionDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v146[4] = v10;
  v145[5] = CFSTR("date");
  OSADateFormat(1u, self->super._capture_time);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v146[5] = v11;
  v145[6] = CFSTR("codeSigningMonitor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_opt_class(), "codeSigningMonitor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v146[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v146, v145, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v13);

  -[OSAJetsamReport problemType](self, "problemType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSALog commonFieldsForBody:](OSALog, "commonFieldsForBody:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v15);

  if (-[NSString length](self->_event_reason, "length") | self->_event_code)
  {
    event_reason = (const __CFString *)self->_event_reason;
    if (!event_reason)
      event_reason = &stru_1E4DEECB8;
    v144[0] = event_reason;
    v143[0] = CFSTR("eventReason");
    v143[1] = CFSTR("eventCode");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v143[2] = &unk_1E4DFD9A8;
    v144[1] = v17;
    v144[2] = &unk_1E4DFD918;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v144, v143, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v18);

  }
  if (self->_snapshot)
  {
    info = 0;
    mach_timebase_info(&info);
    v99 = v5;
    if (info.denom)
      v19 = ((self->_snapshot->var1 - self->_snapshot->var0) * info.numer / info.denom + 500000) / 0xF4240;
    else
      v19 = 0xFFFFFFFFLL;
    v141[0] = CFSTR("timeDelta");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v142[0] = v120;
    v141[1] = CFSTR("memoryStatus");
    v139[0] = CFSTR("memoryPages");
    v137[0] = CFSTR("free");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_snapshot->var3.var0);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v138[0] = v117;
    v137[1] = CFSTR("active");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_snapshot->var3.var1);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v138[1] = v114;
    v137[2] = CFSTR("inactive");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_snapshot->var3.var2);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v138[2] = v111;
    v137[3] = CFSTR("purgeable");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_snapshot->var3.var4);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v138[3] = v109;
    v137[4] = CFSTR("wired");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_snapshot->var3.var5);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v138[4] = v107;
    v137[5] = CFSTR("speculative");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_snapshot->var3.var6);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v138[5] = v105;
    v137[6] = CFSTR("throttled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_snapshot->var3.var3);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v138[6] = v102;
    v137[7] = CFSTR("fileBacked");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_snapshot->var3.var7);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v138[7] = v100;
    v137[8] = CFSTR("anonymous");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_snapshot->var3.var8);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v138[8] = v98;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v138, v137, 9);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v140[0] = v97;
    v139[1] = CFSTR("compressions");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_snapshot->var3.var10);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v140[1] = v96;
    v139[2] = CFSTR("decompressions");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_snapshot->var3.var11);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v140[2] = v95;
    v139[3] = CFSTR("compressorSize");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_snapshot->var3.var9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v140[3] = v20;
    v139[4] = CFSTR("uncompressed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_snapshot->var3.var12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v140[4] = v21;
    v139[5] = CFSTR("zoneMapSize");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_snapshot->var3.var13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v140[5] = v22;
    v139[6] = CFSTR("zoneMapCap");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_snapshot->var3.var14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v140[6] = v23;
    v139[7] = CFSTR("largestZone");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->_snapshot->var3.var16);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v140[7] = v24;
    v139[8] = CFSTR("largestZoneSize");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_snapshot->var3.var15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v140[8] = v25;
    v139[9] = CFSTR("pageSize");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *MEMORY[0x1E0C85AA8]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v140[9] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v140, v139, 10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v142[1] = v27;
    v141[2] = CFSTR("genCounter");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_snapshot->var2);
    v104 = self;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    largestProcess = v104->_largestProcess;
    v142[2] = v28;
    v142[3] = largestProcess;
    v141[3] = CFSTR("largestProcess");
    v141[4] = &unk_1E4DFD9A8;
    v142[4] = &unk_1E4DFD918;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, v141, 5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v99[2](v99, v30);

    self = v104;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v31, "appleInternal");

    snapshot = v104->_snapshot;
    if (snapshot->var4)
    {
      v33 = 0;
      v34 = 472;
      do
      {
        v121 = v33;
        v35 = (char *)snapshot + v34;
        memset(out, 0, 37);
        uuid_unparse_lower((const unsigned __int8 *)snapshot + v34 - 216, out);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v36;
        if ((*((_BYTE *)snapshot + v34 - 228) & 1) != 0)
          objc_msgSend(v36, "addObject:", CFSTR("suspended"));
        v38 = *((_QWORD *)v35 - 25);
        if ((v38 & 1) != 0)
        {
          objc_msgSend(v37, "addObject:", CFSTR("audio"));
          v38 = *((_QWORD *)v35 - 25);
          if ((v38 & 4) == 0)
          {
LABEL_15:
            if ((v38 & 2) != 0)
              goto LABEL_65;
            goto LABEL_16;
          }
        }
        else if ((v38 & 4) == 0)
        {
          goto LABEL_15;
        }
        objc_msgSend(v37, "addObject:", CFSTR("accessory"));
        v38 = *((_QWORD *)v35 - 25);
        if ((v38 & 2) != 0)
        {
LABEL_65:
          objc_msgSend(v37, "addObject:", CFSTR("location"));
          if ((*((_QWORD *)v35 - 25) & 0x10) == 0)
            goto LABEL_18;
LABEL_17:
          objc_msgSend(v37, "addObject:", CFSTR("bluetooth"));
          goto LABEL_18;
        }
LABEL_16:
        if ((v38 & 0x10) != 0)
          goto LABEL_17;
LABEL_18:
        visibilityEndowmentState = self->_visibilityEndowmentState;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v35 - 68));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(visibilityEndowmentState) = -[NSSet containsObject:](visibilityEndowmentState, "containsObject:", v40);

        v41 = CFSTR("frontmost");
        if ((visibilityEndowmentState & 1) != 0
          || (v41 = CFSTR("background"), (*(v35 - 200) & 8) != 0))
        {
          objc_msgSend(v37, "addObject:", v41);
        }
        v42 = *((_QWORD *)v35 - 25);
        if ((v42 & 0x100) != 0)
        {
          objc_msgSend(v37, "addObject:", CFSTR("resume"));
          v42 = *((_QWORD *)v35 - 25);
          if ((v42 & 0x200) == 0)
          {
LABEL_23:
            if ((v42 & 0x800) == 0)
              goto LABEL_24;
            goto LABEL_69;
          }
        }
        else if ((v42 & 0x200) == 0)
        {
          goto LABEL_23;
        }
        objc_msgSend(v37, "addObject:", CFSTR("suspending"));
        v42 = *((_QWORD *)v35 - 25);
        if ((v42 & 0x800) == 0)
        {
LABEL_24:
          if ((v42 & 0x2000) == 0)
            goto LABEL_26;
LABEL_25:
          objc_msgSend(v37, "addObject:", CFSTR("continuous"));
          goto LABEL_26;
        }
LABEL_69:
        objc_msgSend(v37, "addObject:", CFSTR("periodic"));
        if ((*((_QWORD *)v35 - 25) & 0x2000) != 0)
          goto LABEL_25;
LABEL_26:
        if (!objc_msgSend(v37, "count", v41))
        {
          if (strcmp((const char *)snapshot + v34 - 268, "SpringBoard"))
          {
            v43 = CFSTR("background");
            if (*((_QWORD *)v35 - 25)
              || (objc_msgSend(v37, "addObject:", CFSTR("daemon")),
                  v43 = CFSTR("idle"),
                  (*((_DWORD *)v35 - 57) & 0x30) == 0x10))
            {
              objc_msgSend(v37, "addObject:", v43);
            }
          }
        }
        v134[0] = CFSTR("name");
        processName();
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v135[0] = v110;
        v134[1] = CFSTR("pid");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v35 - 68));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v135[1] = v108;
        v134[2] = CFSTR("uuid");
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        v135[2] = v106;
        v134[3] = CFSTR("cpuTime");
        v115 = snapshot;
        v118 = v34;
        v44 = (char *)snapshot + v34;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)*(uint64_t *)((char *)snapshot + v34 - 40) / 1000000.0+ (double)*(uint64_t *)((char *)snapshot + v34 - 48));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v135[3] = v45;
        v134[4] = CFSTR("rpages");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)v44 - 23));
        v46 = v37;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v135[4] = v47;
        v134[5] = CFSTR("purgeable");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)v44 - 21));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v135[5] = v48;
        v134[6] = CFSTR("lifetimeMax");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)v44 - 22));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v135[6] = v49;
        v134[7] = CFSTR("fds");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v44 - 56));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v135[7] = v50;
        v135[8] = v46;
        v112 = v46;
        v134[8] = CFSTR("states");
        v134[9] = CFSTR("age");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_snapshot->var0 - *((_QWORD *)v44 - 10));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v135[9] = v51;
        v134[10] = CFSTR("priority");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v44 - 58));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v135[10] = v52;
        v134[11] = CFSTR("freeze_skip_reason:");
        v53 = *((_DWORD *)v44 - 55);
        v54 = CFSTR("(unknown-reason)");
        if (v53 <= 0xAu)
          v54 = off_1E4DEDC60[(char)v53];
        v135[11] = v54;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v135, v134, 12);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = (void *)objc_msgSend(v55, "mutableCopy");

        if (*((_QWORD *)v44 - 8))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v57, CFSTR("idleDelta"));

        }
        v58 = (uint64_t)v115 + v118;
        v59 = *(_QWORD *)((char *)v115 + v118 - 72);
        self = v104;
        if (v59)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v59 - v104->_snapshot->var0);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v60, CFSTR("killDelta"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v58 - 88));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v61, CFSTR("genCount"));

        }
        v62 = *(_QWORD *)(v58 - 192);
        if (v62)
        {
          killDescription(v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v63, CFSTR("reason"));

        }
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = (uint64_t)v115 + v118;
        if (*(_QWORD *)((char *)v115 + v118 - 160) || *(_QWORD *)(v65 - 152))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v133[0] = v66;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v65 - 152));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v133[1] = v67;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v133, 2);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setObject:forKeyedSubscript:", v68, CFSTR("internal"));

        }
        if (*(_QWORD *)((char *)v115 + v118 - 24))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setObject:forKeyedSubscript:", v69, CFSTR("frozen_to_swap_pages"));

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)((char *)v115 + v118 - 96));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v70, CFSTR("mem_regions"));

        if (v101)
        {
          v71 = (uint64_t)v115 + v118;
          if (*(_QWORD *)((char *)v115 + v118 - 144) || *(_QWORD *)(v71 - 136))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v132[0] = v72;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v71 - 136));
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v132[1] = v73;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v132, 2);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v74, CFSTR("purgeable_nv"));

          }
          v75 = (uint64_t)v115 + v118;
          if (*(_QWORD *)((char *)v115 + v118 - 128) || *(_QWORD *)(v75 - 120))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v131[0] = v76;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v75 - 120));
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v131[1] = v77;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 2);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v78, CFSTR("alternate"));

          }
          if (*(_QWORD *)((char *)v115 + v118 - 112))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v79, CFSTR("iokit"));

          }
          if (*(_QWORD *)((char *)v115 + v118 - 104))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "setObject:forKeyedSubscript:", v80, CFSTR("table"));

          }
          if (*(unint64_t *)((char *)&v115->var0 + v118))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setObject:forKeyedSubscript:", v81, CFSTR("neuralPages"));

          }
        }
        if (objc_msgSend(v64, "count"))
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v64, CFSTR("physicalPages"));
        v82 = (uint64_t)v115 + v118;
        if (*(_QWORD *)((char *)v115 + v118 - 56))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v83, CFSTR("coalition"));

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v82 - 16));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v84, CFSTR("csFlags"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v82 - 8));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setObject:forKeyedSubscript:", v85, CFSTR("csTrustLevel"));

        objc_msgSend(v103, "addObject:", v56);
        v33 = v121 + 1;
        snapshot = v104->_snapshot;
        v34 = v118 + 280;
      }
      while (snapshot->var4 > v121 + 1);
    }
    v129[0] = CFSTR("processes");
    v129[1] = &unk_1E4DFD9A8;
    v130[0] = v103;
    v130[1] = &unk_1E4DFD918;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 2);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v99;
    v99[2](v99, v86);

  }
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(v87, "appleInternal");

  if (v88)
  {
    if (-[NSMutableArray count](self->_zones, "count"))
    {
      zones = self->_zones;
      v127 = CFSTR("zones");
      v128 = zones;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v90);

    }
    if (-[NSMutableArray count](self->_tags, "count"))
    {
      tags = self->_tags;
      v125 = CFSTR("tags");
      v126 = tags;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v92);

    }
  }
  if (-[NSMutableArray count](self->super._notes, "count"))
  {
    notes = self->super._notes;
    v123 = CFSTR("notes");
    v124 = notes;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v94);

  }
  if (self->_isSuspendedOnlyJetsam)
    -[OSAJetsamReport _setDumpedSuspendedJetsamLog](self, "_setDumpedSuspendedJetsamLog");

}

+ (int64_t)_daysSince1970
{
  int64_t result;

  result = time(0);
  if (result >= 0)
    return result / 0x15180uLL;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_zones, 0);
  objc_storeStrong((id *)&self->_audioAssertionState, 0);
  objc_storeStrong((id *)&self->_visibilityEndowmentState, 0);
  objc_storeStrong((id *)&self->_event_reason, 0);
  objc_storeStrong((id *)&self->_killedActiveApps, 0);
  objc_storeStrong((id *)&self->_largestActiveApp, 0);
  objc_storeStrong((id *)&self->_largestProcess, 0);
}

- (void)instrumentEvents:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Not sending Core Analytics events because snapshot is missing.", v0, 2u);
}

@end
