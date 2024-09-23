@implementation PLSMCMetricsAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSMCMetricsAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLSMCMetricsAgent)init
{
  PLSMCMetricsAgent *v3;
  PLSMCMetricsAgent *v4;
  PLTimer *monitorTimer;
  uint64_t v6;
  NSSet *loggedKeys;
  uint64_t v8;
  NSSet *availableKeys;
  PLSMCMetricsAgent *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[16];

  if (+[PLSMCMetricsAgent supportsSMC](PLSMCMetricsAgent, "supportsSMC")
    && objc_msgSend(MEMORY[0x1E0D7FFA0], "longForKey:ifNotSet:", CFSTR("SMCMonitorCadence"), 0))
  {
    v13.receiver = self;
    v13.super_class = (Class)PLSMCMetricsAgent;
    v3 = -[PLAgent init](&v13, sel_init);
    v4 = v3;
    if (v3)
    {
      monitorTimer = v3->_monitorTimer;
      v3->_monitorTimer = 0;

      v4->_loggingCounter = 0;
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v6 = objc_claimAutoreleasedReturnValue();
      loggedKeys = v4->_loggedKeys;
      v4->_loggedKeys = (NSSet *)v6;

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v8 = objc_claimAutoreleasedReturnValue();
      availableKeys = v4->_availableKeys;
      v4->_availableKeys = (NSSet *)v8;

    }
    self = v4;
    v10 = self;
  }
  else
  {
    PLLogSMCMetrics();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_ERROR, "SMC Metrics: SMC telemetry disabled", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)initOperatorDependancies
{
  NSObject *v3;
  NSSet *v4;
  NSSet *availableKeys;
  NSObject *v6;
  void *v7;
  NSSet *v8;
  NSSet *loggedKeys;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  PLEntryNotificationOperatorComposition *v13;
  PLEntryNotificationOperatorComposition *sbc;
  id v15;
  void *v16;
  double monitorCadence;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSSet *v23;
  int v24;
  NSSet *v25;
  int v26;
  NSSet *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  uint8_t buf[4];
  int v31;
  __int16 v32;
  NSSet *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  self->_smcConnection = ($9CEE2F78D9152958F56DF80F82CC2BF0 *)SMCOpenConnectionWithDefaultService();
  PLLogSMCMetrics();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLSMCMetricsAgent getAllowedKeys](self, "getAllowedKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");
    -[PLSMCMetricsAgent getAllowedKeys](self, "getAllowedKeys");
    v23 = (NSSet *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v31 = v22;
    v32 = 2112;
    v33 = v23;
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "SMC Metrics: List of allowed SMC Keys (count %d): %@", buf, 0x12u);

  }
  -[PLSMCMetricsAgent getAllKeys](self, "getAllKeys");
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  availableKeys = self->_availableKeys;
  self->_availableKeys = v4;

  PLLogSMCMetrics();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v24 = -[NSSet count](self->_availableKeys, "count");
    v25 = self->_availableKeys;
    *(_DWORD *)buf = 67109378;
    v31 = v24;
    v32 = 2112;
    v33 = v25;
    _os_log_debug_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_DEBUG, "SMC Metrics: List of all SMC Keys (count %d): %@", buf, 0x12u);
  }

  -[PLSMCMetricsAgent getAllowedKeys](self, "getAllowedKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intersectSet:", self->_availableKeys);

  -[PLSMCMetricsAgent getAllowedKeys](self, "getAllowedKeys");
  v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
  loggedKeys = self->_loggedKeys;
  self->_loggedKeys = v8;

  PLLogSMCMetrics();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v26 = -[NSSet count](self->_loggedKeys, "count");
    v27 = self->_loggedKeys;
    *(_DWORD *)buf = 67109378;
    v31 = v26;
    v32 = 2112;
    v33 = v27;
    _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "SMC Metrics: List of metrics to be logged (count %d): %@", buf, 0x12u);
  }

  v11 = objc_msgSend(MEMORY[0x1E0D7FFA0], "longForKey:ifNotSet:", CFSTR("SMCMonitorCadence"), 0);
  self->_monitorCadence = (double)v11;
  if (v11)
  {
    v12 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __45__PLSMCMetricsAgent_initOperatorDependancies__block_invoke;
    v29[3] = &unk_1E8577F48;
    v29[4] = self;
    objc_msgSend(MEMORY[0x1E0D7FFC8], "significantBatteryChangeNotificationWithOperator:withBlock:", self, v29);
    v13 = (PLEntryNotificationOperatorComposition *)objc_claimAutoreleasedReturnValue();
    sbc = self->_sbc;
    self->_sbc = v13;

    v15 = objc_alloc(MEMORY[0x1E0D80070]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    monitorCadence = self->_monitorCadence;
    -[PLOperator workQueue](self, "workQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v12;
    v28[1] = 3221225472;
    v28[2] = __45__PLSMCMetricsAgent_initOperatorDependancies__block_invoke_2;
    v28[3] = &unk_1E8578078;
    v28[4] = self;
    v19 = (void *)objc_msgSend(v15, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v16, 1, 0, v18, v28, monitorCadence, 0.0);
    -[PLSMCMetricsAgent setMonitorTimer:](self, "setMonitorTimer:", v19);

  }
  else
  {
    PLLogSMCMetrics();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "SMC Metrics: SMC monitor disabled", buf, 2u);
    }

  }
}

uint64_t __45__PLSMCMetricsAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "log");
}

uint64_t __45__PLSMCMetricsAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "thermalMonitorCallback");
}

- (void)logThermalKeysToCoreAnalytics
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_loggedKeys;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[PLSMCMetricsAgent readSMCKey:](self, "readSMCKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "setObject:forKey:", v10, v9);

      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  PLLogSMCMetrics();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v3;
    _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "SMC Metrics: Log instant Keys to CA: %@", buf, 0xCu);
  }

  v13 = v3;
  v12 = v3;
  AnalyticsSendEventLazy();

}

id __50__PLSMCMetricsAgent_logThermalKeysToCoreAnalytics__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logEventPointInstantKeys
{
  void *v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_loggedKeys;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[PLSMCMetricsAgent readSMCKey:](self, "readSMCKey:", v9);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
        {
          v21[0] = CFSTR("Key");
          v21[1] = CFSTR("Value");
          v22[0] = v9;
          v22[1] = v10;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v6);
  }

  objc_msgSend(v14, "setObject:forKeyedSubscript:", v3, CFSTR("__PPSKVPairs__"));
  PLLogSMCMetrics();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v14;
    _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "SMC Metrics: logging SMC Payload: %@", buf, 0xCu);
  }

  -[PLOperator logForSubsystem:category:data:](self, "logForSubsystem:category:data:", CFSTR("SMC"), CFSTR("InstantKeys"), v14);
}

- (void)thermalMonitorCallback
{
  NSObject *v3;
  double v4;
  _DWORD v5[2];
  __int16 v6;
  unsigned int v7;
  __int16 v8;
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PLSMCMetricsAgent setLoggingCounter:](self, "setLoggingCounter:", -[PLSMCMetricsAgent loggingCounter](self, "loggingCounter") + 1);
  PLLogSMCMetrics();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[PLSMCMetricsAgent monitorCadence](self, "monitorCadence");
    v5[0] = 67109632;
    v5[1] = v4;
    v6 = 1024;
    v7 = -[PLSMCMetricsAgent loggingThreshold](self, "loggingThreshold");
    v8 = 1024;
    v9 = -[PLSMCMetricsAgent loggingCounter](self, "loggingCounter");
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "SMC Metrics:Monitoring timer callback (interval %ds, threshold %d, count %d)", (uint8_t *)v5, 0x14u);
  }

  if (+[PLSMCMetricsAgent supportsSMC](PLSMCMetricsAgent, "supportsSMC")
    && -[PLSMCMetricsAgent anyVirtualTemperatureAboveThreshold](self, "anyVirtualTemperatureAboveThreshold"))
  {
    -[PLSMCMetricsAgent logEventPointInstantKeys](self, "logEventPointInstantKeys");
  }
  if (-[PLSMCMetricsAgent loggingCounter](self, "loggingCounter") >= 0x1E)
  {
    -[PLSMCMetricsAgent logThermalKeysToCoreAnalytics](self, "logThermalKeysToCoreAnalytics");
    -[PLSMCMetricsAgent setLoggingCounter:](self, "setLoggingCounter:", 0);
  }
}

- (void)dealloc
{
  objc_super v3;

  if (-[PLSMCMetricsAgent smcConnection](self, "smcConnection"))
  {
    -[PLSMCMetricsAgent smcConnection](self, "smcConnection");
    SMCCloseConnection();
  }
  v3.receiver = self;
  v3.super_class = (Class)PLSMCMetricsAgent;
  -[PLAgent dealloc](&v3, sel_dealloc);
}

- (id)handleNumericKeys:(unsigned int)a3 keyInfo:(id *)a4 keyName:(id)a5 ret:(char)a6
{
  id v8;
  unsigned int v9;
  unsigned int v10;
  NSObject *v11;
  void *v12;
  int var0;
  double v14;
  uint64_t v15;
  unsigned int v17;
  unsigned int v18;
  const char *v19;
  NSObject *v20;
  int var1;
  unsigned int v22;
  void *v23;
  int v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  unsigned int var3;
  unsigned int v29;
  uint8_t buf[4];
  unsigned int v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  -[PLSMCMetricsAgent smcConnection](self, "smcConnection");
  v9 = SMCReadKeyAsNumericWithKnownKeyInfo();
  if (!v9)
  {
    var0 = a4->var2.var0.var0;
    if (var0)
    {
      if (var0 == 2 || var0 == 1)
      {
        HIDWORD(v14) = 0;
        *(float *)&v14 = 0.0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      PLLogSMCMetrics();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      v24 = a4->var2.var0.var0;
      *(_DWORD *)buf = 67109120;
      v31 = v24;
      v25 = "SMC Metrics: Unknown numeric SMC type: %d";
      v26 = v20;
      v27 = 8;
    }
    else
    {
      if (a4->var2.var0.var1)
      {
        -[PLSMCMetricsAgent smcConnection](self, "smcConnection");
        v17 = SMCReadKey();
        if (v17)
        {
          v18 = v17;
          PLLogSMCMetrics();
          v11 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            goto LABEL_3;
          *(_DWORD *)buf = 67109120;
          v31 = v18;
          v19 = "SMC Metrics: SMCReadKey error: %d";
LABEL_18:
          _os_log_error_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_ERROR, v19, buf, 8u);
          goto LABEL_3;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v12 = (void *)v15;
        goto LABEL_10;
      }
      var1 = a4->var1;
      if ((var1 & 0x80) != 0)
      {
        switch(a4->var3)
        {
          case 1u:
            v23 = (void *)MEMORY[0x1E0CB37E8];
            break;
          case 2u:
            v23 = (void *)MEMORY[0x1E0CB37E8];
            break;
          case 4u:
            v23 = (void *)MEMORY[0x1E0CB37E8];
            break;
          case 8u:
            v23 = (void *)MEMORY[0x1E0CB37E8];
            break;
          default:
            PLLogSMCMetrics();
            v20 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              goto LABEL_16;
            var3 = a4->var3;
            *(_DWORD *)buf = 67109378;
            v31 = var3;
            v32 = 2112;
            v33 = v8;
            v25 = "SMC Metrics: Unsupported key size %d for SMC key %@.";
            goto LABEL_40;
        }
        objc_msgSend(v23, "numberWithUnsignedLong:", 0);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      if ((var1 & 4) == 0)
        goto LABEL_4;
      v22 = a4->var3;
      switch(v22)
      {
        case 8u:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", bswap64(0));
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        case 4u:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", bswap32(0));
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
        case 2u:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", bswap32(0) >> 16);
          v15 = objc_claimAutoreleasedReturnValue();
          goto LABEL_9;
      }
      PLLogSMCMetrics();
      v20 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
LABEL_16:

        goto LABEL_4;
      }
      v29 = a4->var3;
      *(_DWORD *)buf = 67109378;
      v31 = v29;
      v32 = 2112;
      v33 = v8;
      v25 = "SMC Metrics:Unsupported key size %d for SMC key %@.";
LABEL_40:
      v26 = v20;
      v27 = 18;
    }
    _os_log_error_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_ERROR, v25, buf, v27);
    goto LABEL_16;
  }
  v10 = v9;
  PLLogSMCMetrics();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v31 = v10;
    v19 = "SMC Metrics:SMCReadKeyAsNumeric error: %d";
    goto LABEL_18;
  }
LABEL_3:

LABEL_4:
  v12 = 0;
LABEL_10:

  return v12;
}

- (id)handleNonNumericKeys:(unsigned int)a3 keyInfo:(id *)a4
{
  $0FB52BBF02DC6C58124663A472289E37 *p_var2;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  int v12;
  int v13;
  double v15;
  _DWORD v16[4];
  uint8_t buf[8];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_var2 = &a4->var2;
  if (!strcmp((const char *)&a4->var2, "ioft"))
  {
    *(_QWORD *)buf = 0;
    -[PLSMCMetricsAgent smcConnection](self, "smcConnection");
    v7 = SMCReadKey();
    if (!v7)
    {
      v15 = (double)*(uint64_t *)buf * 0.0000152587891;
      *(float *)&v15 = v15;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    v8 = v7;
    PLLogSMCMetrics();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v16[0] = 67109120;
    v16[1] = v8;
    v10 = "SMC Metrics: SMCReadKey error: %d";
    v11 = (uint8_t *)v16;
    goto LABEL_17;
  }
  if (!strcmp((const char *)p_var2, "flag"))
  {
    v16[0] = 0;
    -[PLSMCMetricsAgent smcConnection](self, "smcConnection");
    v12 = SMCReadKey();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16[0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
    v13 = v12;
    PLLogSMCMetrics();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v13;
    v10 = "SMC Metrics:SMCReadKey error: %d";
    v11 = buf;
LABEL_17:
    _os_log_error_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_ERROR, v10, v11, 8u);
LABEL_11:

LABEL_12:
    v6 = 0;
    return v6;
  }
  if (strcmp((const char *)p_var2, "hex_"))
    goto LABEL_12;
  *(_QWORD *)buf = 0;
  -[PLSMCMetricsAgent smcConnection](self, "smcConnection");
  if (SMCReadKey())
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)buf);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)readSMCKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  _BYTE v18[24];
  uint8_t buf[16];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    PLLogSMCMetrics();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_10:

      v12 = 0;
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    v14 = "SMC Metrics: invalid key name";
    v15 = v13;
    v16 = 2;
LABEL_16:
    _os_log_error_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
    goto LABEL_10;
  }
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v6, "UTF8String");
  v7 = SMCMakeUInt32Key();
  if (!(_DWORD)v7)
  {
    PLLogSMCMetrics();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = 0;
    v14 = "SMC Metrics: SMCMakeUInt32Key error: %d";
    v15 = v13;
    v16 = 8;
    goto LABEL_16;
  }
  v8 = v7;
  memset(buf, 0, sizeof(buf));
  v20 = 0;
  -[PLSMCMetricsAgent smcConnection](self, "smcConnection");
  v9 = SMCGetKeyInfo();
  if (v9)
  {
    v10 = v9;
    PLLogSMCMetrics();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 67109120;
      *(_DWORD *)&v18[4] = v10;
      _os_log_error_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_ERROR, "SMC Metrics:SMCGetKeyInfo error: %d", v18, 8u);
    }
    v12 = 0;
  }
  else
  {
    *(_OWORD *)v18 = *(_OWORD *)buf;
    *(_QWORD *)&v18[16] = v20;
    -[PLSMCMetricsAgent handleNumericKeys:keyInfo:keyName:ret:](self, "handleNumericKeys:keyInfo:keyName:ret:", v8, v18, v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogSMCMetrics();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v18 = 138412546;
      *(_QWORD *)&v18[4] = v6;
      *(_WORD *)&v18[12] = 2112;
      *(_QWORD *)&v18[14] = v12;
      _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "SMC Metrics: read keys %@: %@", v18, 0x16u);
    }
  }

LABEL_14:
  return v12;
}

- (id)getAllKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PLSMCMetricsAgent_getAllKeys__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  if (qword_1ED8822C8 != -1)
    dispatch_once(&qword_1ED8822C8, block);
  return (id)qword_1ED8822C0;
}

void __31__PLSMCMetricsAgent_getAllKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  _BYTE v8[7];
  int v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED8822C0;
  qword_1ED8822C0 = v2;

  v4 = 0;
  do
  {
    v9 = 0;
    objc_msgSend(*(id *)(a1 + 32), "smcConnection");
    v5 = SMCGetKeyFromIndex();
    if (!v5)
    {
      SMCUInt32ToString();
      v6 = (void *)qword_1ED8822C0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

    }
    ++v4;
  }
  while (v5 != -4);
}

- (id)getAllowedKeys
{
  if (qword_1ED8822D8 != -1)
    dispatch_once(&qword_1ED8822D8, &__block_literal_global_42);
  return (id)qword_1ED8822D0;
}

void __35__PLSMCMetricsAgent_getAllowedKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED8822D0;
  qword_1ED8822D0 = v0;

  objc_msgSend(MEMORY[0x1E0D80078], "getAllowblocklist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PLSMCAgent_EventPoint_ThermalInstantKeys"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if (*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7))
          objc_msgSend((id)qword_1ED8822D0, "addObject:");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)getTVKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__PLSMCMetricsAgent_getTVKeys__block_invoke;
  block[3] = &unk_1E85780C8;
  block[4] = self;
  if (qword_1ED8822E8 != -1)
    dispatch_once(&qword_1ED8822E8, block);
  return (id)qword_1ED8822E0;
}

void __30__PLSMCMetricsAgent_getTVKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED8822E0;
  qword_1ED8822E0 = v2;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("TV"), (_QWORD)v10))
          objc_msgSend((id)qword_1ED8822E0, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (BOOL)isThermalPressureFanNoiseAboveThreshold
{
  void *v3;
  void *v4;
  BOOL v5;

  -[PLSMCMetricsAgent readSMCKey:](self, "readSMCKey:", CFSTR("mTPL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSMCMetricsAgent readSMCKey:](self, "readSMCKey:", CFSTR("fdBA"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 && objc_msgSend(v3, "integerValue") > 0 || v4 && objc_msgSend(v4, "integerValue") > 22;

  return v5;
}

- (BOOL)isThermalMitigationAboveThreshold
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PLSMCMetricsAgent readSMCKey:](self, "readSMCKey:", CFSTR("mxTM"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = v2 && objc_msgSend(v2, "integerValue") > 7;

  return v4;
}

- (BOOL)anyVirtualTemperatureAboveThreshold
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PLSMCMetricsAgent getTVKeys](self, "getTVKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TVD0")) & 1) == 0)
        {
          -[PLSMCMetricsAgent readSMCKey:](self, "readSMCKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            objc_msgSend(v9, "floatValue");
            if (v11 > 35.0)
            {

              v12 = 1;
              goto LABEL_14;
            }
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_14:

  return v12;
}

+ (BOOL)supportsSMC
{
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isVirtualDevice") & 1) != 0)
    return 0;
  if (qword_1ED8822F0 != -1)
    dispatch_once(&qword_1ED8822F0, &__block_literal_global_57);
  return _MergedGlobals_1_0 != 0;
}

uint64_t __32__PLSMCMetricsAgent_supportsSMC__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice");
  _MergedGlobals_1_0 = (int)result > 1001014;
  return result;
}

- ($9CEE2F78D9152958F56DF80F82CC2BF0)smcConnection
{
  return self->_smcConnection;
}

- (void)setSmcConnection:(id *)a3
{
  self->_smcConnection = a3;
}

- (double)monitorCadence
{
  return self->_monitorCadence;
}

- (void)setMonitorCadence:(double)a3
{
  self->_monitorCadence = a3;
}

- (unsigned)loggingThreshold
{
  return self->_loggingThreshold;
}

- (void)setLoggingThreshold:(unsigned int)a3
{
  self->_loggingThreshold = a3;
}

- (unsigned)loggingCounter
{
  return self->_loggingCounter;
}

- (void)setLoggingCounter:(unsigned int)a3
{
  self->_loggingCounter = a3;
}

- (PLTimer)monitorTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMonitorTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLEntryNotificationOperatorComposition)sbc
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSbc:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSSet)loggedKeys
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLoggedKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSSet)availableKeys
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAvailableKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableKeys, 0);
  objc_storeStrong((id *)&self->_loggedKeys, 0);
  objc_storeStrong((id *)&self->_sbc, 0);
  objc_storeStrong((id *)&self->_monitorTimer, 0);
}

@end
