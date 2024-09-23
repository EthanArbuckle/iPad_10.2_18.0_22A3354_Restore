@implementation PLIOReportMetricsAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLIOReportMetricsAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLIOReportMetricsAgent)init
{
  PLIOReportMetricsAgent *v3;
  NSObject *v4;
  objc_super v6;
  uint8_t buf[16];

  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("DynamicIOReportMetricEnable"), 1) & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)PLIOReportMetricsAgent;
    self = -[PLAgent init](&v6, sel_init);
    v3 = self;
  }
  else
  {
    PLLogIOReportMetrics();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "IOReport Metrics: Dynamic telemetry disabled", buf, 2u);
    }

    v3 = 0;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  void *v3;
  uint64_t v4;
  void *v5;
  PLNSNotificationOperatorComposition *v6;
  PLNSNotificationOperatorComposition *enhancedScreenStateChangeListener;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  -[PLIOReportMetricsAgent subscribeToChannelSets](self, "subscribeToChannelSets");
  -[PLIOReportMetricsAgent sampleDeltaForChannelSets](self, "sampleDeltaForChannelSets");
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent setLastEntryDate:](self, "setLastEntryDate:", v3);

  v4 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke;
  v19[3] = &unk_1E8577F48;
  v19[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent setBatteryLevelChangedNotifications:](self, "setBatteryLevelChangedNotifications:", v5);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
  {
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_2;
    v18[3] = &unk_1E8577F48;
    v18[4] = self;
    v6 = (PLNSNotificationOperatorComposition *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80010]), "initWithOperator:forNotification:withBlock:", self, CFSTR("com.apple.powerlog.EnhancedScreenState"), v18);
    enhancedScreenStateChangeListener = self->_enhancedScreenStateChangeListener;
    self->_enhancedScreenStateChangeListener = v6;

  }
  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_19;
  v17[3] = &unk_1E8577F48;
  v17[4] = self;
  objc_msgSend(MEMORY[0x1E0D7FFC8], "displayOffNotificationWithOperator:withBlock:", self, v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent setDisplayOffNotification:](self, "setDisplayOffNotification:", v8);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
  {
    objc_msgSend(MEMORY[0x1E0D80038], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLIOReportMetricsAgent setStateTracker:](self, "setStateTracker:", v9);

    -[PLIOReportMetricsAgent stateTracker](self, "stateTracker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerForStates:withOperator:withBlock:", 8, self, &__block_literal_global_22);

    if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    {
      v16[0] = v4;
      v16[1] = 3221225472;
      v16[2] = __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_3;
      v16[3] = &unk_1E8577F48;
      v16[4] = self;
      objc_msgSend(MEMORY[0x1E0D7FFC8], "displayOffOrAODNotificationWithOperator:withBlock:", self, v16);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15[0] = v4;
      v15[1] = 3221225472;
      v15[2] = __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_24;
      v15[3] = &unk_1E8577F48;
      v15[4] = self;
      objc_msgSend(MEMORY[0x1E0D7FFC8], "displayOffNotificationWithOperator:withBlock:", self, v15);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v11;
    -[PLIOReportMetricsAgent setDisplayOffNotification:](self, "setDisplayOffNotification:", v11);

    v14[0] = v4;
    v14[1] = 3221225472;
    v14[2] = __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_25;
    v14[3] = &unk_1E8577F48;
    v14[4] = self;
    objc_msgSend(MEMORY[0x1E0D7FFC8], "displayOnNotificationWithOperator:withBlock:", self, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLIOReportMetricsAgent setDisplayOnNotification:](self, "setDisplayOnNotification:", v13);

  }
}

uint64_t __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logSBC");
}

void __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLLogIOReportMetrics();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Notification for ScreenState change: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logScreenStateChange");
}

uint64_t __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_19(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "logScreenStateChange");
  return result;
}

uint64_t __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_3(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  if (a2)
  {
    v2 = result;
    PLLogIOReportMetrics();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "AOD case: Received Display OFF Notification", v4, 2u);
    }

    return objc_msgSend(*(id *)(v2 + 32), "startDisplayOffPeriodicTimer");
  }
  return result;
}

uint64_t __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_24(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  if (a2)
  {
    v2 = result;
    PLLogIOReportMetrics();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "Non-AOD case: Received Display OFF Notification", v4, 2u);
    }

    return objc_msgSend(*(id *)(v2 + 32), "startDisplayOffPeriodicTimer");
  }
  return result;
}

uint64_t __50__PLIOReportMetricsAgent_initOperatorDependancies__block_invoke_25(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  if (a2)
  {
    v2 = result;
    PLLogIOReportMetrics();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "Received Display ON Notification", v4, 2u);
    }

    return objc_msgSend(*(id *)(v2 + 32), "stopDisplayOffPeriodicTimer");
  }
  return result;
}

- (IOReportGroupChecks)initGroupChecks
{
  __int16 v2;
  __int16 v3;

  v2 = objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode");
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "fullMode"))
    v3 = 256;
  else
    v3 = 0;
  return (IOReportGroupChecks)(v3 | v2);
}

- (id)buildBaseSet:(IOReportGroupChecks *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[10];
  _QWORD v24[12];

  v24[10] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("AMC Stats,Perf Counters");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  v23[1] = CFSTR("AOP2,Power");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v4;
  v23[2] = CFSTR("PMP,DCS Floor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v5;
  v23[3] = CFSTR("PMP,SOC Floor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v6;
  v23[4] = CFSTR("PMP,PMC AVE Floor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v7;
  v23[5] = CFSTR("PMP,PMC DISP Floor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v8;
  v23[6] = CFSTR("SoC Stats,Events");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v9;
  v23[7] = CFSTR("SoC Stats,PMGR Counters");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v10;
  v23[8] = CFSTR("SoC Stats,Device States");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v11;
  v23[9] = CFSTR("AOP-EXCLAVE,Power");
  v12 = a3->var0 || a3->var1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_new();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __39__PLIOReportMetricsAgent_buildBaseSet___block_invoke;
  v21[3] = &unk_1E857B198;
  v22 = v15;
  v16 = v15;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v21);
  if (objc_msgSend(v16, "count"))
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

void __39__PLIOReportMetricsAgent_buildBaseSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(a3, "BOOLValue"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    PLLogIOReportMetrics();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_INFO, "Base set has following subscription %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (id)buildScreenStateSet:(IOReportGroupChecks *)a3
{
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
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[9];
  _QWORD v22[11];

  v22[9] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("AMC Stats,Perf Counters");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v4;
  v21[1] = CFSTR("AOP2,Power");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v5;
  v21[2] = CFSTR("PMP,DCS Floor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v6;
  v21[3] = CFSTR("PMP,SOC Floor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v7;
  v21[4] = CFSTR("PMP,PMC AVE Floor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v8;
  v21[5] = CFSTR("PMP,PMC DISP Floor");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v9;
  v21[6] = CFSTR("SoC Stats,Events");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v10;
  v21[7] = CFSTR("SoC Stats,PMGR Counters");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v11;
  v21[8] = CFSTR("SoC Stats,Device States");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3->var0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __46__PLIOReportMetricsAgent_buildScreenStateSet___block_invoke;
  v19[3] = &unk_1E857B198;
  v20 = v14;
  v15 = v14;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v19);
  if (objc_msgSend(v15, "count"))
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  return v17;
}

void __46__PLIOReportMetricsAgent_buildScreenStateSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(a3, "BOOLValue"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    PLLogIOReportMetrics();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_INFO, "ScreenState set has following subscription %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (id)buildSnapshotSet:(IOReportGroupChecks *)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = CFSTR("SoC Stats,AON Fuse");
  v3 = a3->var0 || a3->var1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __43__PLIOReportMetricsAgent_buildSnapshotSet___block_invoke;
  v14 = &unk_1E857B198;
  v15 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v11);
  if (objc_msgSend(v7, "count", v11, v12, v13, v14))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

void __43__PLIOReportMetricsAgent_buildSnapshotSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(a3, "BOOLValue"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
    PLLogIOReportMetrics();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_INFO, "Snapshot set has following subscription %@", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (id)channelDictionaryWithChannelSet:(id)a3 withMinProcessTime:(double)a4
{
  id v5;
  const void *v6;
  void *Subscription;
  void *v8;
  void *v9;
  const void *v10;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (const void *)IOReportCopyFilteredChannels();
  if (!IOReportGetChannelCount())
  {
    v10 = v6;
LABEL_9:
    CFRelease(v10);
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  Subscription = (void *)IOReportCreateSubscription();
  if (v6)
    CFRelease(v6);
  if (!Subscription)
    goto LABEL_10;
  if (!IOReportGetChannelCount())
  {
    CFRelease(Subscription);
    v10 = 0;
    goto LABEL_9;
  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", Subscription, CFSTR("subscription"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, CFSTR("subscribedChannels"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("minNotificationProcessTime"));

LABEL_11:
  return v8;
}

uint64_t __77__PLIOReportMetricsAgent_channelDictionaryWithChannelSet_withMinProcessTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D179C2E0]();
  IOReportChannelGetGroup();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IOReportChannelGetSubGroup();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(","));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6);
  PLLogIOReportMetrics();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "!!! Retain: groupSubgroupObj = %@ !!!", (uint8_t *)&v12, 0xCu);
    }
    v10 = 0;
  }
  else
  {
    if (v9)
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "!!! Remove: groupSubgroupObj = %@ !!!", (uint8_t *)&v12, 0xCu);
    }
    v10 = 16;
  }

  objc_autoreleasePoolPop(v2);
  return v10;
}

- (void)subscribeToChannelSets
{
  void *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *sampleChannelsSignificantBattery;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *sampleChannelsScreenState;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *sampleChannelsSnapshot;
  IOReportGroupChecks v12;

  v12 = (IOReportGroupChecks)-[PLIOReportMetricsAgent initGroupChecks](self, "initGroupChecks");
  -[PLIOReportMetricsAgent buildBaseSet:](self, "buildBaseSet:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLIOReportMetricsAgent channelDictionaryWithChannelSet:withMinProcessTime:](self, "channelDictionaryWithChannelSet:withMinProcessTime:", v3, -300.0);
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    sampleChannelsSignificantBattery = self->_sampleChannelsSignificantBattery;
    self->_sampleChannelsSignificantBattery = v4;

  }
  -[PLIOReportMetricsAgent buildScreenStateSet:](self, "buildScreenStateSet:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PLIOReportMetricsAgent channelDictionaryWithChannelSet:withMinProcessTime:](self, "channelDictionaryWithChannelSet:withMinProcessTime:", v6, 0.0);
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    sampleChannelsScreenState = self->_sampleChannelsScreenState;
    self->_sampleChannelsScreenState = v7;

  }
  -[PLIOReportMetricsAgent buildSnapshotSet:](self, "buildSnapshotSet:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PLIOReportMetricsAgent channelDictionaryWithChannelSet:withMinProcessTime:](self, "channelDictionaryWithChannelSet:withMinProcessTime:", v9, -300.0);
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    sampleChannelsSnapshot = self->_sampleChannelsSnapshot;
    self->_sampleChannelsSnapshot = v10;

  }
}

- (void)sampleDeltaForChannelSets
{
  id v3;
  id v4;

  if (self->_sampleChannelsSignificantBattery)
    v3 = -[PLIOReportMetricsAgent sampleDeltaForChannelGroup:](self, "sampleDeltaForChannelGroup:");
  if (self->_sampleChannelsScreenState)
    v4 = -[PLIOReportMetricsAgent sampleDeltaForChannelGroup:](self, "sampleDeltaForChannelGroup:");
}

- (id)sampleDeltaForChannelGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *Samples;
  void *v9;
  void *v10;
  void *v11;
  void *SamplesDelta;
  uint64_t v13;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D179C2E0]();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    SamplesDelta = (void *)v13;
    goto LABEL_7;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("currentSample"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("lastSample"));

  objc_msgSend(v3, "objectForKey:", CFSTR("currentSampleDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("lastSampleDate"));

  objc_msgSend(v3, "objectForKey:", CFSTR("currentSampleAPWakeTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("lastSampleAPWakeTime"));

  objc_msgSend(v3, "objectForKey:", CFSTR("subscription"));
  objc_msgSend(v3, "objectForKey:", CFSTR("subscribedChannels"));
  Samples = (void *)IOReportCreateSamples();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("currentSampleDate"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", Samples, CFSTR("currentSample"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_absolute_time());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("currentSampleAPWakeTime"));

  objc_msgSend(v3, "objectForKey:", CFSTR("lastSample"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("currentSample"));
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("lastSample"));
  objc_msgSend(v3, "objectForKey:", CFSTR("currentSample"));
  SamplesDelta = (void *)IOReportCreateSamplesDelta();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("lastSample"));
LABEL_7:
  objc_autoreleasePoolPop(v4);

  return SamplesDelta;
}

- (id)sampleSnapshotForChannelGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *Samples;
  void *v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subscription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("subscribedChannels"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  Samples = 0;
  if (v3 && v5 && v6)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("cachedSample"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cachedSample"));
      Samples = (void *)objc_claimAutoreleasedReturnValue();
      if (!IOReportUpdateSamples())
      {
        objc_msgSend(v3, "removeObjectForKey:", CFSTR("cachedSample"));
        goto LABEL_9;
      }
    }
    else
    {
      Samples = (void *)IOReportCreateSamples();
      if (!Samples)
        goto LABEL_9;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", Samples, CFSTR("cachedSample"));
  }
LABEL_9:

  objc_autoreleasePoolPop(v4);
  return Samples;
}

- (void)log
{
  -[PLIOReportMetricsAgent logInit](self, "logInit");
  -[PLIOReportMetricsAgent logSBC](self, "logSBC");
  -[PLIOReportMetricsAgent logScreenStateChange](self, "logScreenStateChange");
}

- (void)logInit
{
  void *v3;
  id v4;

  -[PLIOReportMetricsAgent sampleChannelsSnapshot](self, "sampleChannelsSnapshot");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent sampleSnapshotForChannelGroup:](self, "sampleSnapshotForChannelGroup:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent logIOReportSnapshots:](self, "logIOReportSnapshots:", v3);

}

- (void)logSBC
{
  void *v3;
  void *v4;
  id v5;

  -[PLIOReportMetricsAgent sampleChannelsSignificantBattery](self, "sampleChannelsSignificantBattery");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent sampleDeltaForChannelGroup:](self, "sampleDeltaForChannelGroup:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent sampleChannelsSignificantBattery](self, "sampleChannelsSignificantBattery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent logIOReportIntervals:forChannelGroup:](self, "logIOReportIntervals:forChannelGroup:", v3, v4);

}

- (void)logScreenStateChange
{
  void *v3;
  void *v4;
  id v5;

  -[PLIOReportMetricsAgent sampleChannelsScreenState](self, "sampleChannelsScreenState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent sampleDeltaForChannelGroup:](self, "sampleDeltaForChannelGroup:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent sampleChannelsScreenState](self, "sampleChannelsScreenState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent logIOReportIntervals:forChannelGroup:](self, "logIOReportIntervals:forChannelGroup:", v3, v4);

}

- (void)logDisplayOffAPWake
{
  void *v3;
  void *v4;
  id v5;

  -[PLIOReportMetricsAgent sampleChannelsScreenState](self, "sampleChannelsScreenState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent sampleDeltaForChannelGroup:](self, "sampleDeltaForChannelGroup:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent sampleChannelsScreenState](self, "sampleChannelsScreenState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIOReportMetricsAgent logIOReportIntervals:forChannelGroup:](self, "logIOReportIntervals:forChannelGroup:", v3, v4);

}

- (void)logIOReportSnapshots:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PLIOReportMetricsAgent *v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("IOReportChannelGroups"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PLIOReportMetricsAgent_logIOReportSnapshots___block_invoke;
  v8[3] = &unk_1E857B3F0;
  v9 = v4;
  v10 = self;
  v6 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

}

void __47__PLIOReportMetricsAgent_logIOReportSnapshots___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("IOReportChannelGroups"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", CFSTR("IOReportChannelGroups"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__PLIOReportMetricsAgent_logIOReportSnapshots___block_invoke_2;
  v11[3] = &unk_1E857B460;
  v7 = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v14 = v3;
  v8 = v3;
  v9 = v5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void __47__PLIOReportMetricsAgent_logIOReportSnapshots___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", CFSTR("IOReportChannelGroups"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "createCategoryString:forSubgroup:", *(_QWORD *)(a1 + 48), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "logIOReportEntry:forCategory:withEntryDate:withAPWakeTime:isInterval:", v7, v6, 0, 0, 0.0);
}

- (void)logIOReportIntervals:(id)a3 forChannelGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *context;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D179C2E0]();
  if (v6)
  {
    v34 = v8;
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("currentSampleAPWakeTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedLongLongValue");

    v35 = v7;
    objc_msgSend(v7, "objectForKey:", CFSTR("lastSampleAPWakeTime"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedLongLongValue");

    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v10);
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0D80078], "secondsFromMachTime:", v12);
    v16 = v15;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v6, "objectForKey:", CFSTR("IOReportChannelGroups"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v18;
    v39 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v39)
    {
      v19 = v14 - v16;
      v37 = *(_QWORD *)v48;
      v38 = v6;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v48 != v37)
            objc_enumerationMutation(obj);
          v41 = v20;
          v21 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v20);
          context = (void *)MEMORY[0x1D179C2E0]();
          objc_msgSend(v6, "objectForKey:", CFSTR("IOReportChannelGroups"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKey:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          objc_msgSend(v23, "objectForKey:", CFSTR("IOReportChannelGroups"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "allKeys");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v44;
            do
            {
              v29 = 0;
              do
              {
                if (*(_QWORD *)v44 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v29);
                objc_msgSend(v23, "objectForKey:", CFSTR("IOReportChannelGroups"));
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectForKey:", v30);
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                -[PLIOReportMetricsAgent createCategoryString:forSubgroup:](self, "createCategoryString:forSubgroup:", v21, v30);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLIOReportMetricsAgent logIOReportEntry:forCategory:withEntryDate:withAPWakeTime:isInterval:](self, "logIOReportEntry:forCategory:withEntryDate:withAPWakeTime:isInterval:", v32, v33, v42, 1, v19);

                ++v29;
              }
              while (v27 != v29);
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            }
            while (v27);
          }

          objc_autoreleasePoolPop(context);
          v20 = v41 + 1;
          v6 = v38;
        }
        while (v41 + 1 != v39);
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v39);
    }

    -[PLIOReportMetricsAgent setLastEntryDate:](self, "setLastEntryDate:", v42);
    v8 = v34;
    v7 = v35;
  }
  objc_autoreleasePoolPop(v8);

}

- (void)logIOReportEntry:(id)a3 forCategory:(id)a4 withEntryDate:(id)a5 withAPWakeTime:(double)a6 isInterval:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  char v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v7 = a7;
  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_opt_new();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("APWakeTime"));

    objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("timestampEnd"));
  }
  v19 = objc_msgSend(v13, "isEqualToString:", CFSTR("AOP2Power"));
  v20 = objc_msgSend(v13, "isEqualToString:", CFSTR("AOP-EXCLAVEPower")) | v19;
  v21 = v17;
  v22 = v16;
  v23 = v13;
  IOReportIterate();
  if ((v20 & 1) == 0)
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("__PPSKVPairs__"));
  PLLogIOReportMetrics();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v23;
    v28 = 2112;
    v29 = v22;
    _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "IOReportMetrics: category = %@, payload = %@", buf, 0x16u);
  }

  -[PLIOReportMetricsAgent lastEntryDate](self, "lastEntryDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator logForSubsystem:category:data:date:](self, "logForSubsystem:category:data:date:", CFSTR("IOReportMetrics"), v23, v22, v25);

  objc_autoreleasePoolPop(v15);
}

uint64_t __95__PLIOReportMetricsAgent_logIOReportEntry_forCategory_withEntryDate_withAPWakeTime_isInterval___block_invoke(uint64_t a1, uint64_t a2)
{
  int Format;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t BucketCount;
  uint64_t v10;
  int v11;
  unint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  NSObject *v31;
  int Count;
  int v33;
  uint64_t v34;
  unint64_t v35;
  const __CFString *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  BOOL v44;
  double v45;
  void *v46;
  unint64_t v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v52;
  uint64_t v53;
  void *v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  uint8_t buf[16];
  _QWORD v60[2];
  _QWORD v61[4];

  v61[2] = *MEMORY[0x1E0C80C00];
  IOReportChannelGetChannelName();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  Format = IOReportChannelGetFormat();
  v53 = a1;
  if (Format != 3)
  {
    if (Format != 2)
    {
      if (Format == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", IOReportSimpleGetIntegerValue());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (v54 && v5)
        {
          if (*(_BYTE *)(a1 + 64))
          {
            if (objc_msgSend(v5, "unsignedIntegerValue"))
            {
              v7 = *(void **)(a1 + 32);
              v60[0] = CFSTR("Channel");
              v60[1] = CFSTR("Value");
              v61[0] = v54;
              v61[1] = v6;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
              v8 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v8);

            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v54);
          }
        }

      }
      goto LABEL_47;
    }
    if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild")
      && objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("SoCStatsDeviceStates")))
    {
      if (!objc_msgSend(*(id *)(a1 + 56), "allowlistedChannel:", v54))
        goto LABEL_47;
      PLLogIOReportMetrics();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v54;
        _os_log_debug_impl(&dword_1CAF47000, v31, OS_LOG_TYPE_DEBUG, "IOReportMetrics: Device States channel %@ is allowlisted", buf, 0xCu);
      }

    }
    Count = IOReportStateGetCount();
    if (Count < 1)
      goto LABEL_47;
    v33 = Count;
    v34 = 0;
    v35 = 0x1E0CB3000uLL;
    v36 = CFSTR("%@_%@");
    v37 = 0x1E0CB3000uLL;
    while (1)
    {
      IOReportStateGetNameForIndex();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v38)
        break;
      v39 = v38;
      if (objc_msgSend(v38, "caseInsensitiveCompare:", CFSTR("OFF"))
        && objc_msgSend(v39, "caseInsensitiveCompare:", CFSTR("INACT"))
        && objc_msgSend(v39, "caseInsensitiveCompare:", CFSTR("PWROFF")))
      {
        goto LABEL_34;
      }
LABEL_43:

      v34 = (v34 + 1);
      if (v33 == (_DWORD)v34)
        goto LABEL_47;
    }
    objc_msgSend(*(id *)(v35 + 2368), "stringWithFormat:", CFSTR("%d"), v34);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:
    objc_msgSend(*(id *)(v35 + 2368), "stringWithFormat:", v36, v54, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = *(void **)(v37 + 2024);
    IOReportStateGetDutyCycle();
    objc_msgSend(v41, "numberWithDouble:");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v40)
      v44 = v42 == 0;
    else
      v44 = 1;
    if (!v44)
    {
      if (*(_BYTE *)(v53 + 64))
      {
        objc_msgSend(v42, "doubleValue");
        if (v45 >= 0.0)
        {
          v46 = *(void **)(v53 + 32);
          v57[0] = CFSTR("Channel");
          v57[1] = CFSTR("DutyCycle");
          v58[0] = v40;
          v58[1] = v43;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
          v47 = v37;
          v48 = v36;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v46;
          v35 = 0x1E0CB3000;
          objc_msgSend(v50, "addObject:", v49);

          v36 = v48;
          v37 = v47;
        }
      }
      else
      {
        objc_msgSend(*(id *)(v53 + 40), "setObject:forKeyedSubscript:", v42, v40);
      }
    }

    goto LABEL_43;
  }
  *(_QWORD *)buf = 0;
  BucketCount = IOReportHistogramGetBucketCount();
  if ((int)BucketCount >= 1)
  {
    v10 = BucketCount;
    v11 = 0;
    v12 = 0x1E0CB3000uLL;
    v13 = CFSTR("ms");
    v14 = CFSTR("%.1f%@-%.1f%@");
    v15 = 0x1E0CB3000uLL;
    do
    {
      IOReportHistogramGetBucketBounds();
      IOReportChannelGetUnit();
      v16 = *(void **)(v12 + 2368);
      IOReportScaleValue();
      v18 = v17;
      IOReportScaleValue();
      objc_msgSend(v16, "stringWithFormat:", v14, v18, v13, v19, v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", IOReportHistogramGetBucketHits());
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      if (v20)
        v23 = v21 == 0;
      else
        v23 = 1;
      if (!v23)
      {
        if (*(_BYTE *)(a1 + 64))
        {
          v52 = *(void **)(a1 + 32);
          v55[0] = CFSTR("Channel");
          v55[1] = CFSTR("DutyCycle");
          v56[0] = v20;
          v56[1] = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
          v24 = a2;
          v25 = v10;
          v26 = v13;
          v27 = v14;
          v28 = v15;
          v29 = v12;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "addObject:", v30);

          v12 = v29;
          v15 = v28;
          v14 = v27;
          v13 = v26;
          v10 = v25;
          a2 = v24;
          a1 = v53;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v21, v20);
        }
      }

      ++v11;
    }
    while ((_DWORD)v10 != v11);
  }
LABEL_47:

  return 0;
}

- (void)startDisplayOffPeriodicTimer
{
  void *v3;
  void *v4;
  void *v5;
  PLMonotonicTimer *v6;
  PLMonotonicTimer *displayOffTimer;
  NSObject *v8;
  uint8_t v9[8];
  _QWORD v10[5];

  if (!self->_displayOffTimer)
  {
    v3 = (void *)MEMORY[0x1E0D80000];
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__PLIOReportMetricsAgent_startDisplayOffPeriodicTimer__block_invoke;
    v10[3] = &unk_1E85793E0;
    v10[4] = self;
    objc_msgSend(v3, "scheduledTimerWithMonotonicFireDate:withInterval:withQueue:withBlock:", v4, v5, v10, 180.0);
    v6 = (PLMonotonicTimer *)objc_claimAutoreleasedReturnValue();
    displayOffTimer = self->_displayOffTimer;
    self->_displayOffTimer = v6;

    PLLogIOReportMetrics();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Display OFF timer started", v9, 2u);
    }

  }
}

uint64_t __54__PLIOReportMetricsAgent_startDisplayOffPeriodicTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logDisplayOffAPWakeStats");
}

- (void)stopDisplayOffPeriodicTimer
{
  PLMonotonicTimer *displayOffTimer;
  PLMonotonicTimer *v4;
  NSObject *v5;
  uint8_t v6[16];

  displayOffTimer = self->_displayOffTimer;
  if (displayOffTimer)
  {
    -[PLMonotonicTimer cancel](displayOffTimer, "cancel");
    v4 = self->_displayOffTimer;
    self->_displayOffTimer = 0;

    PLLogIOReportMetrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "Display OFF timer stopped", v6, 2u);
    }

  }
}

- (void)logDisplayOffAPWakeStats
{
  void *v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
  {
    -[PLStateTrackingComposition getCurrState:](self->_stateTracker, "getCurrState:", 8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");
    PLLogIOReportMetrics();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 67109120;
      v7[1] = v4;
      _os_log_debug_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEBUG, "logDisplayOffAPWakeStats: AP ON is %d", (uint8_t *)v7, 8u);
    }

    if (v4)
    {
      PLLogIOReportMetrics();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v7[0]) = 0;
        _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "Log table entries at display OFF + AP ON occurrence", (uint8_t *)v7, 2u);
      }

      -[PLIOReportMetricsAgent logDisplayOffAPWake](self, "logDisplayOffAPWake");
    }

  }
}

- (id)createCategoryString:(id)a3 forSubgroup:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    objc_msgSend(v5, "stringByAppendingString:", a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;
  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), &stru_1E8587D00, 0, 0, objc_msgSend(v9, "length"));

  return v9;
}

- (BOOL)allowlistedChannel:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (qword_1ED883498 != -1)
    dispatch_once(&qword_1ED883498, &__block_literal_global_120);
  if (qword_1ED883490)
    v4 = objc_msgSend((id)qword_1ED883490, "containsObject:", v3);
  else
    v4 = 0;

  return v4;
}

void __45__PLIOReportMetricsAgent_allowlistedChannel___block_invoke()
{
  uint64_t v0;
  void *v1;

  if (objc_msgSend(MEMORY[0x1E0D80020], "isiPhone"))
  {
    if ((int)objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice") >= 1001021)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("ATC0_COMMON"), CFSTR("ATC0_USB"), CFSTR("VENC0_DMA"), CFSTR("VENC1_DMA"), CFSTR("VENC0_SYS"), CFSTR("VENC1_SYS"), CFSTR("VENC0_PIPE4"), CFSTR("VENC1_PIPE4"), CFSTR("VENC0_PIPE5"), CFSTR("VENC1_PIPE5"), CFSTR("VENC0_ME0"), CFSTR("VENC1_ME0"), CFSTR("VENC0_ME1"), CFSTR("VENC1_ME1"), CFSTR("ISP_SYS"), CFSTR("ISP_CPU"), CFSTR("ISP_FE"),
        0);
      v0 = objc_claimAutoreleasedReturnValue();
      v1 = (void *)qword_1ED883490;
      qword_1ED883490 = v0;

    }
  }
}

- (PLEntryNotificationOperatorComposition)batteryLevelChangedNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBatteryLevelChangedNotifications:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLEntryNotificationOperatorComposition)screenstateChangedNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setScreenstateChangedNotifications:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLEntryNotificationOperatorComposition)displayOffNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDisplayOffNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLEntryNotificationOperatorComposition)displayOnNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisplayOnNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLNSNotificationOperatorComposition)enhancedScreenStateChangeListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEnhancedScreenStateChangeListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLStateTrackingComposition)stateTracker
{
  return (PLStateTrackingComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setStateTracker:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLMonotonicTimer)displayOffTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisplayOffTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableDictionary)sampleChannelsSignificantBattery
{
  return self->_sampleChannelsSignificantBattery;
}

- (void)setSampleChannelsSignificantBattery:(id)a3
{
  objc_storeStrong((id *)&self->_sampleChannelsSignificantBattery, a3);
}

- (NSMutableDictionary)sampleChannelsScreenState
{
  return self->_sampleChannelsScreenState;
}

- (void)setSampleChannelsScreenState:(id)a3
{
  objc_storeStrong((id *)&self->_sampleChannelsScreenState, a3);
}

- (NSMutableDictionary)sampleChannelsSnapshot
{
  return self->_sampleChannelsSnapshot;
}

- (void)setSampleChannelsSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_sampleChannelsSnapshot, a3);
}

- (NSDate)lastEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLastEntryDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastEntryDate, 0);
  objc_storeStrong((id *)&self->_sampleChannelsSnapshot, 0);
  objc_storeStrong((id *)&self->_sampleChannelsScreenState, 0);
  objc_storeStrong((id *)&self->_sampleChannelsSignificantBattery, 0);
  objc_storeStrong((id *)&self->_displayOffTimer, 0);
  objc_storeStrong((id *)&self->_stateTracker, 0);
  objc_storeStrong((id *)&self->_enhancedScreenStateChangeListener, 0);
  objc_storeStrong((id *)&self->_displayOnNotification, 0);
  objc_storeStrong((id *)&self->_displayOffNotification, 0);
  objc_storeStrong((id *)&self->_screenstateChangedNotifications, 0);
  objc_storeStrong((id *)&self->_batteryLevelChangedNotifications, 0);
}

@end
