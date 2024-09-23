@implementation PLPowerMetricMonitorService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLPowerMetricMonitorService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (BOOL)deviceUsesPMPCounters
{
  return objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice") - 1001011 < 5;
}

- (PLPowerMetricMonitorService)init
{
  PLPowerMetricMonitorService *v2;
  PLPowerMetricMonitorService *v3;
  uint64_t v4;
  PPSMetricMonitorService *metricMonitorService;
  uint64_t v6;
  NSMutableDictionary *trackedProcesses;
  PPSMetricCollection *v8;
  PPSMetricCollection *metrics;
  PPSMetricCollection *v10;
  PPSMetricCollection *cachedMetrics;
  NSDate *v12;
  NSDate *lastQueryTime;
  NSDate *v14;
  uint64_t v15;
  NSMutableSet *systemMetricEntryKeys;
  uint64_t v17;
  NSMutableSet *processSpecificMetricEntryKeys;
  uint64_t v19;
  NSMutableSet *batteryGaugeConflictingSystemMetricEntryKeys;
  uint64_t v21;
  NSMutableSet *batteryGaugeConflictingProcessSpecificEntryKeys;
  uint64_t v23;
  NSMutableSet *entryKeysToCollect;
  uint64_t v25;
  NSMutableSet *entryKeysRequested;
  uint64_t v27;
  NSMutableSet *entryKeysCollected;
  uint64_t v29;
  NSMutableDictionary *entryKeyToEntryInfo;
  NSObject *v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *monitorQueue;
  uint64_t v34;
  NSSet *energyScoringEntities;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)PLPowerMetricMonitorService;
  v2 = -[PLOperator init](&v37, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isMonitoring = 0;
    v2->_isCollectingMetrics = 0;
    v2->_updateMode = 0;
    v2->_updateInterval = 0.0;
    objc_msgSend(MEMORY[0x1E0D709E8], "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    metricMonitorService = v3->_metricMonitorService;
    v3->_metricMonitorService = (PPSMetricMonitorService *)v4;

    -[PPSMetricMonitorService setDelegate:](v3->_metricMonitorService, "setDelegate:", v3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    trackedProcesses = v3->_trackedProcesses;
    v3->_trackedProcesses = (NSMutableDictionary *)v6;

    v8 = (PPSMetricCollection *)objc_alloc_init(MEMORY[0x1E0D709D0]);
    metrics = v3->_metrics;
    v3->_metrics = v8;

    v10 = (PPSMetricCollection *)objc_alloc_init(MEMORY[0x1E0D709D0]);
    cachedMetrics = v3->_cachedMetrics;
    v3->_cachedMetrics = v10;

    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v12 = (NSDate *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v3->_currQueryTime, v12);
    lastQueryTime = v3->_lastQueryTime;
    v3->_lastQueryTime = v12;
    v14 = v12;

    v3->_currQueryCount = 0;
    v3->_lastQueryCount = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    systemMetricEntryKeys = v3->_systemMetricEntryKeys;
    v3->_systemMetricEntryKeys = (NSMutableSet *)v15;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = objc_claimAutoreleasedReturnValue();
    processSpecificMetricEntryKeys = v3->_processSpecificMetricEntryKeys;
    v3->_processSpecificMetricEntryKeys = (NSMutableSet *)v17;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    batteryGaugeConflictingSystemMetricEntryKeys = v3->_batteryGaugeConflictingSystemMetricEntryKeys;
    v3->_batteryGaugeConflictingSystemMetricEntryKeys = (NSMutableSet *)v19;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    batteryGaugeConflictingProcessSpecificEntryKeys = v3->_batteryGaugeConflictingProcessSpecificEntryKeys;
    v3->_batteryGaugeConflictingProcessSpecificEntryKeys = (NSMutableSet *)v21;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    entryKeysToCollect = v3->_entryKeysToCollect;
    v3->_entryKeysToCollect = (NSMutableSet *)v23;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v25 = objc_claimAutoreleasedReturnValue();
    entryKeysRequested = v3->_entryKeysRequested;
    v3->_entryKeysRequested = (NSMutableSet *)v25;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v27 = objc_claimAutoreleasedReturnValue();
    entryKeysCollected = v3->_entryKeysCollected;
    v3->_entryKeysCollected = (NSMutableSet *)v27;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = objc_claimAutoreleasedReturnValue();
    entryKeyToEntryInfo = v3->_entryKeyToEntryInfo;
    v3->_entryKeyToEntryInfo = (NSMutableDictionary *)v29;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = dispatch_queue_create("com.apple.PerfPowerMetricMonitor.monitorQueue", v31);
    monitorQueue = v3->_monitorQueue;
    v3->_monitorQueue = (OS_dispatch_queue *)v32;

    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("DisplayCost"), CFSTR("CPUCost"), CFSTR("NetworkCost"), CFSTR("LocationCost"), CFSTR("CurrentApplicationState"), CFSTR("GPUCost"), CFSTR("CurrentThermalState"), CFSTR("InducedThermalState"), 0);
    energyScoringEntities = v3->_energyScoringEntities;
    v3->_energyScoringEntities = (NSSet *)v34;

  }
  return v3;
}

- (void)initOperatorDependancies
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];

  -[PLPowerMetricMonitorService metricMonitorService](self, "metricMonitorService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startXPCListener");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = *MEMORY[0x1E0D80398];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__PLPowerMetricMonitorService_initOperatorDependancies__block_invoke;
  v12[3] = &unk_1EA16D8D0;
  v12[4] = self;
  v7 = (id)objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", v6, 0, 0, v12);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D803A0];
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __55__PLPowerMetricMonitorService_initOperatorDependancies__block_invoke_2;
  v11[3] = &unk_1EA16D8D0;
  v11[4] = self;
  v10 = (id)objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v9, 0, 0, v11);

}

void __55__PLPowerMetricMonitorService_initOperatorDependancies__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D803A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (v5 == 1)
    objc_msgSend(*(id *)(a1 + 32), "_batteryGaugeServiceDidBecomeActive");
}

void __55__PLPowerMetricMonitorService_initOperatorDependancies__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D803A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  if (v5 == 1)
    objc_msgSend(*(id *)(a1 + 32), "_batteryGaugeServiceDidBecomeInactive");
}

- (void)_cleanUp
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PLPowerMetricMonitorService setIsMonitoring:](self, "setIsMonitoring:", 0);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService setEntryKeysToCollect:](self, "setEntryKeysToCollect:", v4);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService setEntryKeysRequested:](self, "setEntryKeysRequested:", v5);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService setEntryKeysCollected:](self, "setEntryKeysCollected:", v6);

  -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

}

- (BOOL)isMonitoringMetrics
{
  PLPowerMetricMonitorService *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PLPowerMetricMonitorService_isMonitoringMetrics__block_invoke;
  v5[3] = &unk_1EA16D8F8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__PLPowerMetricMonitorService_isMonitoringMetrics__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isMonitoring");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)currentUpdateMode
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PLPowerMetricMonitorService_currentUpdateMode__block_invoke;
  v6[3] = &unk_1EA16D8F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __48__PLPowerMetricMonitorService_currentUpdateMode__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "updateMode");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)currentUpdateInterval
{
  NSObject *v3;
  double v4;
  _QWORD v6[6];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PLPowerMetricMonitorService_currentUpdateInterval__block_invoke;
  v6[3] = &unk_1EA16D8F8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __52__PLPowerMetricMonitorService_currentUpdateInterval__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "updateInterval");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int)pidForProcessName:(id)a3
{
  return SFProcessIDForProcessNamed();
}

- (void)setUpForMonitoring
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __49__PLPowerMetricMonitorService_setUpForMonitoring__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "monitorQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PLPowerMetricMonitorService_setUpForMonitoring__block_invoke_2;
  block[3] = &unk_1EA16D040;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

uint64_t __49__PLPowerMetricMonitorService_setUpForMonitoring__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setUpAgents");
  return objc_msgSend(*(id *)(a1 + 32), "_setUpIOReporting");
}

- (void)startMonitoringWithConfigurationMode:(int64_t)a3 updateInterval:(double)a4
{
  NSObject *v7;
  _QWORD block[7];

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke;
  block[3] = &unk_1EA16D920;
  *(double *)&block[6] = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async(v7, block);

}

void __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  _QWORD v11[5];
  uint8_t buf[16];

  PLLogPowerMetricMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_cold_2(a1, v2);

  if (objc_msgSend(*(id *)(a1 + 32), "isMonitoring"))
  {
    PLLogPowerMetricMonitor();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsMonitoring:", 1);
    PLLogPowerMetricMonitor();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA9D6000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "startMonitoring", (const char *)&unk_1DABC9252, buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setUpdateMode:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setUpdateInterval:", *(double *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "entryKeysToCollect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "systemMetricEntryKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v6);

    objc_msgSend(MEMORY[0x1E0D7FFE0], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v7, "isServiceActive:", 1);

    if ((_DWORD)v6)
      objc_msgSend(*(id *)(a1 + 32), "_batteryGaugeServiceDidBecomeActive");
    v8 = *(_QWORD *)(a1 + 40);
    if ((unint64_t)(v8 - 1) >= 3)
    {
      if (!v8)
      {
        v9 = *(void **)(a1 + 32);
        v10 = *(double *)(a1 + 48);
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_196;
        v11[3] = &unk_1EA16D040;
        v11[4] = v9;
        objc_msgSend(v9, "_startMetricCollectionTimerWithInterval:block:", v11, v10);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_collectMetricsWithTimeout:completionHandler:", 0, 5.0);
    }
  }
}

uint64_t __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_196(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_2;
  v3[3] = &unk_1EA16D040;
  v3[4] = v1;
  return objc_msgSend(v1, "_collectMetricsWithTimeout:completionHandler:", v3, 1.0);
}

uint64_t __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMetrics");
}

- (void)finishMonitoringAndSendMetrics
{
  NSObject *v3;
  _QWORD block[5];

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke;
  block[3] = &unk_1EA16D040;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  void *v11;
  uint64_t result;
  uint64_t v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];

  PLLogPowerMetricMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);

  v11 = *(void **)(a1 + 32);
  v10 = (id *)(a1 + 32);
  result = objc_msgSend(v11, "isMonitoring");
  if ((_DWORD)result)
  {
    v13 = objc_msgSend(*v10, "updateMode");
    if ((unint64_t)(v13 - 2) >= 2)
    {
      if (v13 == 1)
      {
LABEL_10:
        v15 = *v10;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke_197;
        v16[3] = &unk_1EA16D040;
        v16[4] = v15;
        objc_msgSend(v15, "_collectMetricsWithTimeout:completionHandler:", v16, 5.0);
        return objc_msgSend(*v10, "setIsMonitoring:", 0);
      }
      if (v13)
        return objc_msgSend(*v10, "setIsMonitoring:", 0);
    }
    PLLogPowerMetricMonitor();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke_cold_1(v10, v14);

    goto LABEL_10;
  }
  return result;
}

uint64_t __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke_197(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendMetrics");
}

- (void)allClientsDidDisconnect
{
  NSObject *v3;
  _QWORD block[5];

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__PLPowerMetricMonitorService_allClientsDidDisconnect__block_invoke;
  block[3] = &unk_1EA16D040;
  block[4] = self;
  dispatch_async(v3, block);

}

void __54__PLPowerMetricMonitorService_allClientsDidDisconnect__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  PLLogPowerMetricMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __54__PLPowerMetricMonitorService_allClientsDidDisconnect__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "_cancelMetricCollectionTimer");
  objc_msgSend(*(id *)(a1 + 32), "_cancelMetricCollectionTimeoutTimer");
  objc_msgSend(*(id *)(a1 + 32), "_cleanUp");
  objc_msgSend(MEMORY[0x1E0D7FFE0], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "signalServiceInactive:", 2);

}

- (id)collectMetricsOnDemand
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  PLPowerMetricMonitorService *v12;
  dispatch_semaphore_t v13;

  v3 = dispatch_semaphore_create(0);
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke;
  v11 = &unk_1EA16D948;
  v12 = self;
  v13 = v3;
  v5 = v3;
  dispatch_sync(v4, &v8);

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  -[PLPowerMetricMonitorService metrics](self, "metrics", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if ((objc_msgSend(*(id *)(a1 + 32), "isMonitoring") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "updateMode") == 2)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_198;
      v4[3] = &unk_1EA16D948;
      v2 = *(void **)(a1 + 40);
      v5 = *(id *)(a1 + 32);
      v6 = v2;
      objc_msgSend(v5, "_collectMetricsWithTimeout:completionHandler:", v4, 1.0);

      return;
    }
    PLLogPowerMetricMonitor();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_cold_1();
  }
  else
  {
    PLLogPowerMetricMonitor();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_cold_2();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_198(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  PLLogPowerMetricMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_198_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "trackedProcesses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_computeEnergyScoreForProcess");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)collectMetricsOnSnapshotWithError:(id *)a3
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  PLPowerMetricMonitorService *v19;
  NSObject *v20;
  id *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = dispatch_semaphore_create(0);
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke;
  v18 = &unk_1EA16D970;
  v19 = self;
  v7 = v5;
  v20 = v7;
  v21 = a3;
  dispatch_sync(v6, &v15);

  v8 = dispatch_time(0, 2000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    PLLogPowerMetricMonitor();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PLPowerMetricMonitorService collectMetricsOnSnapshotWithError:].cold.1();

    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D70A00];
    v22 = *MEMORY[0x1E0CB2D50];
    v23[0] = CFSTR("Timed out while trying to collect metrics");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1, v15, v16, v17, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 9, v12);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v13 = 0;
  }
  else
  {
    -[PLPowerMetricMonitorService metrics](self, "metrics", v15, v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  PLLogPowerMetricMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_cold_3(v2, v3, v4, v5, v6, v7, v8, v9);

  if ((objc_msgSend(*(id *)(a1 + 32), "isMonitoring") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "updateMode") == 3)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_203;
      v16[3] = &unk_1EA16D948;
      v10 = *(void **)(a1 + 40);
      v17 = *(id *)(a1 + 32);
      v18 = v10;
      objc_msgSend(v17, "_collectMetricsWithTimeout:completionHandler:", v16, 1.0);

      return;
    }
    PLLogPowerMetricMonitor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_cold_1();

    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D70A00];
    v19 = *MEMORY[0x1E0CB2D50];
    v20[0] = CFSTR("PPSMetricMonitorMode is not PPSMetricMonitorModeUpdateOnSnapshot");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 0, v15);
    **(_QWORD **)(a1 + 48) = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLLogPowerMetricMonitor();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_cold_2();

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_203(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  PLLogPowerMetricMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_203_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "trackedProcesses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_computeEnergyScoreForProcess");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)addMonitoredProcessWithPID:(int)a3 error:(id *)a4
{
  NSObject *v7;
  _QWORD block[6];
  int v9;

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke;
  block[3] = &unk_1EA16D998;
  v9 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_sync(v7, block);

}

void __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  PLProcessMetadata *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  PLLogPowerMetricMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_4();

  if ((objc_msgSend(*(id *)(a1 + 32), "_pidIsValid:", *(unsigned int *)(a1 + 48)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "trackedProcesses");
    v3 = objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_15;
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 32), "trackedProcesses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_15:
      v11 = -[PLProcessMetadata initWithPid:]([PLProcessMetadata alloc], "initWithPid:", *(unsigned int *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "trackedProcesses");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v11, v25);

      PLLogPowerMetricMonitor();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_1();

      v27 = *(void **)(a1 + 32);
      objc_msgSend(v27, "trackedProcesses");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_postAgentNotificationWithProcess:", v30);

      objc_msgSend(*(id *)(a1 + 32), "entryKeysToCollect");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "processSpecificMetricEntryKeys");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "unionSet:", v32);

      goto LABEL_18;
    }
    PLLogPowerMetricMonitor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_2();

    if (*(_QWORD *)(a1 + 40))
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0D70A00];
      v33 = *MEMORY[0x1E0CB2D50];
      v34 = CFSTR("Already monitoring process");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v11 = (PLProcessMetadata *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      v13 = v10;
      v14 = 6;
LABEL_14:
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v11);
      **(_QWORD **)(a1 + 40) = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    }
  }
  else
  {
    PLLogPowerMetricMonitor();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_3(a1 + 48, v15, v16, v17, v18, v19, v20, v21);

    if (*(_QWORD *)(a1 + 40))
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0D70A00];
      v35 = *MEMORY[0x1E0CB2D50];
      v36[0] = CFSTR("Invalid PID");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v11 = (PLProcessMetadata *)objc_claimAutoreleasedReturnValue();
      v12 = v22;
      v13 = v23;
      v14 = 4;
      goto LABEL_14;
    }
  }
}

- (id)addMonitoredProcessesWithPIDs:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[4];
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "intValue");
        v29 = 0;
        -[PLPowerMetricMonitorService addMonitoredProcessWithPID:error:](self, "addMonitoredProcessWithPID:error:", v11, &v29);
        v12 = v29;
        if (v12)
        {
          PLLogPowerMetricMonitor();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[PLPowerMetricMonitorService addMonitoredProcessesWithPIDs:error:].cold.1(v35, v12, &v36, v13);

          *a4 = objc_retainAutorelease(v12);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    }
    while (v8);
  }
  v28 = 0;
  -[PLPowerMetricMonitorService collectMetricsOnSnapshotWithError:](self, "collectMetricsOnSnapshotWithError:", &v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v28;
  v16 = v15;
  if (v15)
  {
    v17 = 0;
    *a4 = objc_retainAutorelease(v15);
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = v6;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v14, "updateMetrics:forPid:", 0, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j), (_QWORD)v24);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      }
      while (v20);
    }

    v17 = v14;
  }

  return v17;
}

- (void)removeMonitoredProcessWithPID:(int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PLPowerMetricMonitorService_removeMonitoredProcessWithPID___block_invoke;
  v6[3] = &unk_1EA16D9C0;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

void __61__PLPowerMetricMonitorService_removeMonitoredProcessWithPID___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  PLLogPowerMetricMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __61__PLPowerMetricMonitorService_removeMonitoredProcessWithPID___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "trackedProcesses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "trackedProcesses");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", 0, v7);

  }
  else
  {
    PLLogPowerMetricMonitor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __61__PLPowerMetricMonitorService_removeMonitoredProcessWithPID___block_invoke_cold_1(a1 + 40, v6, v8, v9, v10, v11, v12, v13);
  }

  objc_msgSend(*(id *)(a1 + 32), "trackedProcesses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
  {
    objc_msgSend(*(id *)(a1 + 32), "entryKeysToCollect");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "processSpecificMetricEntryKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "minusSet:", v17);

  }
}

- (void)changeUpdateInterval:(double)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__PLPowerMetricMonitorService_changeUpdateInterval___block_invoke;
  v6[3] = &unk_1EA16D9E8;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

uint64_t __52__PLPowerMetricMonitorService_changeUpdateInterval___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  PLLogPowerMetricMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __52__PLPowerMetricMonitorService_changeUpdateInterval___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  objc_msgSend(*(id *)(a1 + 32), "setUpdateInterval:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setMetricCollectionTimerUpdateInterval:", *(double *)(a1 + 40));
}

- (void)_batteryGaugeServiceDidBecomeActive
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "PLBatteryGaugeService became active; ending with error",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_6();
}

- (void)_batteryGaugeServiceDidBecomeInactive
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "PLBatteryGaugeService became inactive; mode is updateOnStop so we should have already ended with error",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_6();
}

- (void)_setUpAgents
{
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[6];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = +[PLSMCAgent supportsBasicSMC](PLSMCAgent, "supportsBasicSMC");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = objc_opt_class();
    v7 = *MEMORY[0x1E0D80390];
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke;
    v23[3] = &unk_1EA16DA10;
    v23[4] = self;
    v8 = v23;
  }
  else
  {
    v6 = objc_opt_class();
    v7 = *MEMORY[0x1E0D80390];
    v22[0] = v5;
    v22[1] = 3221225472;
    v22[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_2;
    v22[3] = &unk_1EA16DA10;
    v22[4] = self;
    v8 = v22;
  }
  -[PLPowerMetricMonitorService _registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:](self, "_registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:", v6, v7, CFSTR("MetricMonitorInstantKeys"), 0, 1, v8, 0.0);
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_3;
  v21[3] = &unk_1EA16DA10;
  v21[4] = self;
  -[PLPowerMetricMonitorService _registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:](self, "_registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:", objc_opt_class(), v7, CFSTR("MetricMonitorInstantKeys"), 0, 1, v21, 1.0);
  if ((objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 0) & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 8))
  {
    v9 = (double)objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 8);
    v10 = objc_opt_class();
    v11 = *MEMORY[0x1E0D80370];
    v20[0] = v5;
    v20[1] = 3221225472;
    v20[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_4;
    v20[3] = &unk_1EA16DA38;
    v20[4] = self;
    *(double *)&v20[5] = v9;
    -[PLPowerMetricMonitorService _registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:](self, "_registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:", v10, v11, CFSTR("APLStats"), 0, 0, v20, v9);
    v12 = *MEMORY[0x1E0D80378];
  }
  else
  {
    v13 = objc_opt_class();
    v12 = *MEMORY[0x1E0D80378];
    v19[0] = v5;
    v19[1] = 3221225472;
    v19[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_5;
    v19[3] = &unk_1EA16DA10;
    v19[4] = self;
    -[PLPowerMetricMonitorService _registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:](self, "_registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:", v13, v12, CFSTR("DisplayBacklight"), 0, 1, v19, 0.0);
  }
  v14 = objc_opt_class();
  v15 = *MEMORY[0x1E0D80380];
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_6;
  v18[3] = &unk_1EA16DA10;
  v18[4] = self;
  -[PLPowerMetricMonitorService _registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:](self, "_registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:", v14, v15, CFSTR("UsageDiff"), 1, 0, v18, 0.0);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_7;
  v17[3] = &unk_1EA16DA10;
  v17[4] = self;
  -[PLPowerMetricMonitorService _registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:](self, "_registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:", objc_opt_class(), v7, CFSTR("ClientStatus"), 1, 0, v17, 0.0);
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_8;
  v16[3] = &unk_1EA16DA10;
  v16[4] = self;
  -[PLPowerMetricMonitorService _registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:](self, "_registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:", objc_opt_class(), v12, CFSTR("Application"), 1, 0, v16, 0.0);
}

uint64_t __43__PLPowerMetricMonitorService__setUpAgents__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_parseSMCMetricsFromEntry:", a2);
}

uint64_t __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_parseGasGaugeMetricsFromEntry:", a2);
}

void __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_parseWifiPowerMetricsFromEntry:cacheMetrics:", v3, objc_msgSend(v2, "_canCacheMetrics"));

}

void __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  if (objc_msgSend(v3, "_canCacheMetrics"))
    v4 = *(double *)(a1 + 40) > 0.0;
  else
    v4 = 0;
  objc_msgSend(v3, "_parseDisplayAPLMetricsFromEntry:cacheMetrics:", v5, v4);

}

uint64_t __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_parseDisplayBacklightPowerMetricsFromEntry:", a2);
}

uint64_t __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_parseProcessNetworkMetricsFromEntry:", a2);
}

uint64_t __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_parseLocationMetricsFromEntry:", a2);
}

uint64_t __43__PLPowerMetricMonitorService__setUpAgents__block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_parseApplicationMetricsFromEntry:", a2);
}

- (void)_registerNotificationWithAgent:(Class)a3 type:(id)a4 tableName:(id)a5 isProcessSpecific:(BOOL)a6 canRequestWhileBatteryGaugeIsRunning:(BOOL)a7 minRequestInterval:(double)a8 block:(id)a9
{
  _BOOL4 v11;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  PLEntryInfo *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;

  v11 = a6;
  v16 = a9;
  v17 = a5;
  v18 = a4;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v19);

  -[objc_class entryKeyForType:andName:](a3, "entryKeyForType:andName:", v18, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogPowerMetricMonitor();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[PLPowerMetricMonitorService _registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:].cold.1();

  v22 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __157__PLPowerMetricMonitorService__registerNotificationWithAgent_type_tableName_isProcessSpecific_canRequestWhileBatteryGaugeIsRunning_minRequestInterval_block___block_invoke;
  v32[3] = &unk_1EA16DA88;
  v32[4] = self;
  v23 = v16;
  v34 = v23;
  v24 = v20;
  v33 = v24;
  v25 = (void *)objc_msgSend(v22, "initWithOperator:forEntryKey:withBlock:", self, v24, v32);
  v26 = -[PLEntryInfo initWithNotificationComposition:minRequestInterval:]([PLEntryInfo alloc], "initWithNotificationComposition:minRequestInterval:", v25, a8);
  -[PLPowerMetricMonitorService entryKeyToEntryInfo](self, "entryKeyToEntryInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v24);

  if (v11)
  {
    -[PLPowerMetricMonitorService processSpecificMetricEntryKeys](self, "processSpecificMetricEntryKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObject:", v24);

    if (!a7)
    {
      -[PLPowerMetricMonitorService batteryGaugeConflictingProcessSpecificEntryKeys](self, "batteryGaugeConflictingProcessSpecificEntryKeys");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v31 = v29;
      objc_msgSend(v29, "addObject:", v24);

    }
  }
  else
  {
    -[PLPowerMetricMonitorService systemMetricEntryKeys](self, "systemMetricEntryKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v24);

    if (!a7)
    {
      -[PLPowerMetricMonitorService batteryGaugeConflictingSystemMetricEntryKeys](self, "batteryGaugeConflictingSystemMetricEntryKeys");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }

}

void __157__PLPowerMetricMonitorService__registerNotificationWithAgent_type_tableName_isProcessSpecific_canRequestWhileBatteryGaugeIsRunning_minRequestInterval_block___block_invoke(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(a1[4], "monitorQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __157__PLPowerMetricMonitorService__registerNotificationWithAgent_type_tableName_isProcessSpecific_canRequestWhileBatteryGaugeIsRunning_minRequestInterval_block___block_invoke_2;
  v6[3] = &unk_1EA16DA60;
  v6[4] = a1[4];
  v7 = v3;
  v9 = a1[6];
  v8 = a1[5];
  v5 = v3;
  dispatch_async(v4, v6);

}

void __157__PLPowerMetricMonitorService__registerNotificationWithAgent_type_tableName_isProcessSpecific_canRequestWhileBatteryGaugeIsRunning_minRequestInterval_block___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "isCollectingMetrics"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("entry"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_agentDidUpdateWithEntryKey:", *(_QWORD *)(a1 + 48));

  }
  else
  {
    PLLogPowerMetricMonitor();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __157__PLPowerMetricMonitorService__registerNotificationWithAgent_type_tableName_isProcessSpecific_canRequestWhileBatteryGaugeIsRunning_minRequestInterval_block___block_invoke_2_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  }
}

- (BOOL)_canCacheMetrics
{
  return (unint64_t)(-[PLPowerMetricMonitorService updateMode](self, "updateMode") - 4) < 0xFFFFFFFFFFFFFFFDLL;
}

- (void)_postAgentNotificationWithProcess:(id)a3
{
  id v3;
  void *v4;
  char v5;
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
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D7FFE0], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isServiceActive:", 1);

  if ((v5 & 1) != 0)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "bundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

    objc_msgSend(v3, "bundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v8;
LABEL_6:
    objc_msgSend(v12, "addObject:", v11);

    goto LABEL_7;
  }
  objc_msgSend(v3, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v3, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "pid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = CFSTR("entry");
  v26[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("PLProcessNetworkAgent.addProcessesOfInterest"), 0, v16);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = CFSTR("entry");
  v24 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("PLProcessMonitorAgent.addProcessesOfInterest"), 0, v18);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("entry");
    v22 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("PLLocationAgent.addProcessesOfInterest"), 0, v20);

  }
LABEL_10:

}

- (void)_setUpIOReporting
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Failed to subscribe to IOReport Energy Model", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_collectMetricsWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  _QWORD v66[6];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  id v77;
  id location;
  _QWORD v79[5];
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  PLLogPowerMetricMonitor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PLPowerMetricMonitorService _collectMetricsWithTimeout:completionHandler:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

  -[PLPowerMetricMonitorService _cancelMetricCollectionTimeoutTimer](self, "_cancelMetricCollectionTimeoutTimer");
  if (-[PLPowerMetricMonitorService isCollectingMetrics](self, "isCollectingMetrics"))
  {
    PLLogPowerMetricMonitor();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PLPowerMetricMonitorService _collectMetricsWithTimeout:completionHandler:].cold.1();

    -[PLPowerMetricMonitorService _metricCollectionTimedOut](self, "_metricCollectionTimedOut");
  }
  -[PLPowerMetricMonitorService currQueryTime](self, "currQueryTime");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService setLastQueryTime:](self, "setLastQueryTime:", v17);

  -[PLPowerMetricMonitorService setLastQueryCount:](self, "setLastQueryCount:", -[PLPowerMetricMonitorService currQueryCount](self, "currQueryCount"));
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService setCurrQueryTime:](self, "setCurrQueryTime:", v18);

  -[PLPowerMetricMonitorService setCurrQueryCount:](self, "setCurrQueryCount:", -[PLPowerMetricMonitorService lastQueryCount](self, "lastQueryCount") + 1);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService setEntryKeysRequested:](self, "setEntryKeysRequested:", v19);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService setEntryKeysCollected:](self, "setEntryKeysCollected:", v20);

  v21 = objc_alloc_init(MEMORY[0x1E0D709D0]);
  -[PLPowerMetricMonitorService setMetrics:](self, "setMetrics:", v21);

  if (-[PLPowerMetricMonitorService _canCacheMetrics](self, "_canCacheMetrics"))
  {
    -[PLPowerMetricMonitorService cachedMetrics](self, "cachedMetrics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    -[PLPowerMetricMonitorService setMetrics:](self, "setMetrics:", v23);

  }
  -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count") == 0;

  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke;
    v79[3] = &unk_1EA16DAB0;
    v79[4] = self;
    v80 = v26;
    v28 = v26;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v79);

    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setProcessMetrics:", v28);

  }
  objc_initWeak(&location, self);
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke_2;
  v75[3] = &unk_1EA16DAD8;
  objc_copyWeak(&v77, &location);
  v65 = v6;
  v76 = v65;
  -[PLPowerMetricMonitorService setMetricCollectionCompletionHandler:](self, "setMetricCollectionCompletionHandler:", v75);
  -[PLPowerMetricMonitorService setIsCollectingMetrics:](self, "setIsCollectingMetrics:", 1);
  -[PLPowerMetricMonitorService entryKeysToCollect](self, "entryKeysToCollect");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count") == 0;

  if (!v31)
  {
    if (-[PLPowerMetricMonitorService _canCacheMetrics](self, "_canCacheMetrics"))
    {
      v73 = 0uLL;
      v74 = 0uLL;
      v71 = 0uLL;
      v72 = 0uLL;
      -[PLPowerMetricMonitorService entryKeysToCollect](self, "entryKeysToCollect");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
      if (!v33)
        goto LABEL_34;
      v34 = *(_QWORD *)v72;
      while (1)
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v72 != v34)
            objc_enumerationMutation(v32);
          v36 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i);
          -[PLPowerMetricMonitorService entryKeyToEntryInfo](self, "entryKeyToEntryInfo");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "minRequestInterval");
          if (v39 == 0.0)
          {
            objc_msgSend(v38, "notificationComposition");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "requestEntry");

            -[PLPowerMetricMonitorService entryKeysRequested](self, "entryKeysRequested");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "addObject:", v36);
          }
          else
          {
            objc_msgSend(v38, "lastQueryDate");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "timeIntervalSinceNow");
            v44 = v43;
            objc_msgSend(v38, "minRequestInterval");
            v46 = v45 < -v44;

            if (!v46)
              goto LABEL_23;
            objc_msgSend(v38, "notificationComposition");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "requestEntry");

            -[PLPowerMetricMonitorService entryKeysRequested](self, "entryKeysRequested");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "addObject:", v36);

            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLPowerMetricMonitorService entryKeyToEntryInfo](self, "entryKeyToEntryInfo");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "objectForKeyedSubscript:", v36);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "setLastQueryDate:", v41);

          }
LABEL_23:

        }
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
        if (!v33)
          goto LABEL_34;
      }
    }
    v69 = 0uLL;
    v70 = 0uLL;
    v67 = 0uLL;
    v68 = 0uLL;
    -[PLPowerMetricMonitorService entryKeysToCollect](self, "entryKeysToCollect");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
    if (v52)
    {
      v53 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v52; ++j)
        {
          if (*(_QWORD *)v68 != v53)
            objc_enumerationMutation(v51);
          v55 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * j);
          -[PLPowerMetricMonitorService entryKeyToEntryInfo](self, "entryKeyToEntryInfo");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKeyedSubscript:", v55);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "notificationComposition");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "requestEntry");

        }
        v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
      }
      while (v52);
    }

    -[PLPowerMetricMonitorService entryKeysRequested](self, "entryKeysRequested");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService entryKeysToCollect](self, "entryKeysToCollect");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "unionSet:", v59);

LABEL_34:
  }
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke_3;
  v66[3] = &unk_1EA16D9E8;
  *(double *)&v66[5] = a3;
  v66[4] = self;
  -[PLPowerMetricMonitorService _startMetricCollectionTimeoutTimerWithTimeout:block:](self, "_startMetricCollectionTimeoutTimerWithTimeout:block:", v66, a3);
  -[PLPowerMetricMonitorService _updateIOReportStats](self, "_updateIOReportStats");
  -[PLPowerMetricMonitorService _updateMetricsWithThermalState](self, "_updateMetricsWithThermalState");
  -[PLPowerMetricMonitorService _sampleCoalitions](self, "_sampleCoalitions");
  v60 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPowerMetricMonitorService currQueryTime](self, "currQueryTime");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService lastQueryTime](self, "lastQueryTime");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "timeIntervalSinceDate:", v62);
  objc_msgSend(v60, "numberWithDouble:");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setSampleTime:", v63);

  objc_destroyWeak(&v77);
  objc_destroyWeak(&location);

}

void __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D709F8]);
    objc_msgSend(v9, "setPid:", objc_msgSend(v5, "pid"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "coalitionID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCoalitionID:", v10);

    objc_msgSend(v5, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setProcessName:", v11);

    objc_msgSend(v5, "bundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBundleID:", v12);

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v18);
    v13 = (void *)MEMORY[0x1E0D709F0];
    objc_msgSend(v5, "applicationState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastActiveStart");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sampleWithValue:timestamp:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setApplicationState:", v16);

  }
}

void __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIsCollectingMetrics:", 0);
  if ((a2 & 1) == 0)
    objc_msgSend(WeakRetained, "_cancelMetricCollectionTimeoutTimer");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

uint64_t __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  PLLogPowerMetricMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke_3_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  return objc_msgSend(*(id *)(a1 + 32), "_metricCollectionTimedOut");
}

- (void)_metricCollectionTimedOut
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_3(&dword_1DA9D6000, v0, v1, "Failed to collect metrics from %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_agentDidUpdateWithEntryKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);

  v4 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[PLPowerMetricMonitorService isCollectingMetrics](self, "isCollectingMetrics"))
  {
    PLLogPowerMetricMonitor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PLPowerMetricMonitorService _agentDidUpdateWithEntryKey:].cold.1();

    -[PLPowerMetricMonitorService entryKeysCollected](self, "entryKeysCollected");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v4);

    if ((v8 & 1) == 0)
    {
      -[PLPowerMetricMonitorService entryKeysCollected](self, "entryKeysCollected");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v4);

      -[PLPowerMetricMonitorService entryKeysCollected](self, "entryKeysCollected");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      -[PLPowerMetricMonitorService entryKeysRequested](self, "entryKeysRequested");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (v11 == v13)
      {
        -[PLPowerMetricMonitorService metricCollectionCompletionHandler](self, "metricCollectionCompletionHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[PLPowerMetricMonitorService metricCollectionCompletionHandler](self, "metricCollectionCompletionHandler");
          v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v15[2](v15, 0);

          -[PLPowerMetricMonitorService setMetricCollectionCompletionHandler:](self, "setMetricCollectionCompletionHandler:", 0);
        }
      }
    }
  }

}

- (void)_sendMetrics
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[PLPowerMetricMonitorService _computeEnergyScoreForProcess](self, "_computeEnergyScoreForProcess");
  -[PLPowerMetricMonitorService metricMonitorService](self, "metricMonitorService");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateWithMetricCollection:", v6);

}

- (void)_emitPowerSignpostWithMetric:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  PLLogPowerSignpost();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  PLEmitPowerSignpost(v7, v6, v5, 0);

}

- (void)_emitPowerSignpostWithMetric:(id)a3 value:(id)a4 pid:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  PLLogPowerSignpost();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  PLEmitPowerSignpost(v10, v9, v8, v7);

}

- (void)_updateIOReportStats
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "failed to read AMC sample", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_parseDisplayAPLMetricsFromEntry:(id)a3 cacheMetrics:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
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
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v4 = a4;
  v6 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AvgPower"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService _convertToWattsFromMilliwatts:](self, "_convertToWattsFromMilliwatts:", v8);
  v39 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(v6, "entryDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sampleWithValue:timestamp:", v39, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDisplayPower:", v11);

  -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("Display_Power_W"), v39);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AvgAPL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(v6, "entryDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sampleWithValue:timestamp:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDisplayAPL:", v16);

  -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("Display_APL"), v13);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AvgRed"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "intValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AvgGreen"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "intValue");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AvgBlue"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService _computeDisplayCostWithAvgRed:avgGreen:avgBlue:](self, "_computeDisplayCostWithAvgRed:avgGreen:avgBlue:", v19, v21, objc_msgSend(v22, "intValue"));
  v24 = (int)v23;

  v25 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "sampleWithValue:timestamp:", v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setDisplayCost:", v28);

  if (v4)
  {
    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "displayPower");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService cachedMetrics](self, "cachedMetrics");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setDisplayPower:", v31);

    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "displayAPL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService cachedMetrics](self, "cachedMetrics");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setDisplayAPL:", v34);

    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "displayCost");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService cachedMetrics](self, "cachedMetrics");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setDisplayCost:", v37);

  }
}

- (void)_parseDisplayBacklightPowerMetricsFromEntry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DisplayPower"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService _convertToWattsFromMilliwatts:](self, "_convertToWattsFromMilliwatts:", v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(v4, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sampleWithValue:timestamp:", v11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDisplayPower:", v9);

  -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("Display_Power_W"), v11);
}

- (void)_parseEnergyModelOrPMPMetricsFromSample:(id)a3 withSampleDuration:(double)a4 sourceChannel:(int64_t)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  PLPowerMetricMonitorService *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  double v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  double v124;
  double v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  double v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  double v146;
  double v147;
  void *v148;
  double v149;
  double v150;
  void *v151;
  double v152;
  double v153;
  void *v154;
  double v155;
  double v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  int v167;
  int v168;

  v8 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (a4 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(MEMORY[0x1E0D80020], "kPLSoCClassOfDevice");
    v12 = v11;
    if (a5 == 1 || v11 > 1001015)
    {
      v167 = v11;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DRAM"), a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15 / a4 * 1.2;

      v17 = (void *)MEMORY[0x1E0D709F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sampleWithValue:timestamp:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService metrics](self, "metrics");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setDramPower:", v20);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("DRAM_Power_W"), v22);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ANE"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v25 = v24 / a4 * 1.2;

      v26 = (void *)MEMORY[0x1E0D709F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "sampleWithValue:timestamp:", v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService metrics](self, "metrics");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setAnePower:", v29);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SOC_REST"));
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "doubleValue");
      v32 = v31;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ANE"));
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "doubleValue");
      v34 = v32 + v33;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AVE"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "doubleValue");
      v37 = v34 + v36;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DCS"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "doubleValue");
      v40 = v37 + v39;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DISP"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "doubleValue");
      v43 = v40 + v42;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ISP"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "doubleValue");
      v46 = v43 + v45;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MSR"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "doubleValue");
      v49 = v46 + v48;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VDEC"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "doubleValue");
      v52 = v49 + v51;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SOC_AON"));
      v53 = self;
      v54 = v10;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "doubleValue");
      v57 = v52 + v56;

      v10 = v54;
      self = v53;

      v58 = v57 / a4 * 1.2;
      v59 = (void *)MEMORY[0x1E0D709F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v58);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "sampleWithValue:timestamp:", v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService metrics](v53, "metrics");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "setOtherSocPower:", v62);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v58);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](v53, "_emitPowerSignpostWithMetric:value:", CFSTR("Other_SoC_Power_W"), v64);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("GPU SRAM"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "doubleValue");
      v67 = v66;

      v68 = (void *)MEMORY[0x1E0D709F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v67);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "sampleWithValue:timestamp:", v69, v10);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService metrics](v53, "metrics");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setGpuSRAMEnergy:", v70);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ANE"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "doubleValue");
      v74 = v73;

      v75 = (void *)MEMORY[0x1E0D709F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v74);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "sampleWithValue:timestamp:", v76, v10);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService metrics](v53, "metrics");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setAneEnergy:", v77);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DCS"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "doubleValue");
      v81 = v80;

      v82 = (void *)MEMORY[0x1E0D709F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v81);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "sampleWithValue:timestamp:", v83, v10);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService metrics](v53, "metrics");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "setDcsEnergy:", v84);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DRAM"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "doubleValue");
      v88 = v87;

      v89 = (void *)MEMORY[0x1E0D709F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v88);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "sampleWithValue:timestamp:", v90, v10);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService metrics](v53, "metrics");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "setDramEnergy:", v91);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PCIe Port 0 Energy"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();

      if (v93)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PCIe Port 0 Energy"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "doubleValue");
        v96 = v95 + 0.0;

      }
      else
      {
        v96 = 0.0;
      }
      v12 = v167;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PCIe Port 1 Energy"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      if (v97)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PCIe Port 1 Energy"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "doubleValue");
        v96 = v96 + v99;

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PCIe Port 2 Energy"));
      v100 = (void *)objc_claimAutoreleasedReturnValue();

      if (v100)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PCIe Port 2 Energy"));
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "doubleValue");
        v96 = v96 + v102;

      }
      v103 = (void *)MEMORY[0x1E0D709F0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v96);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "sampleWithValue:timestamp:", v104, v10);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService metrics](v53, "metrics");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setPcieEnergy:", v105);

      if (v162)
        goto LABEL_20;
    }
    else if (a5)
    {
LABEL_20:

      goto LABEL_21;
    }
    v107 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CPU Energy"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "doubleValue");
    objc_msgSend(v107, "numberWithDouble:", v109 / a4 * 1.2);
    v110 = objc_claimAutoreleasedReturnValue();

    v111 = (void *)MEMORY[0x1E0D709F0];
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "sampleWithValue:timestamp:", v110, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v168 = v12;
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "setCpuPower:", v113);

    v164 = (void *)v110;
    -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("CPU_Power_W"), v110);
    v115 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("GPU Energy"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "doubleValue");
    objc_msgSend(v115, "numberWithDouble:", v117 / a4 * 1.2);
    v118 = (void *)objc_claimAutoreleasedReturnValue();

    v119 = (void *)MEMORY[0x1E0D709F0];
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "sampleWithValue:timestamp:", v118, v120);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v166 = v10;
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "setGpuPower:", v121);

    v10 = v166;
    -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("GPU_Power_W"), v118);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CPU Energy"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "doubleValue");
    v125 = v124;

    v126 = (void *)MEMORY[0x1E0D709F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v125);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v126, "sampleWithValue:timestamp:", v127, v166);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v129, "setCpuEnergy:", v128);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("GPU Energy"));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "doubleValue");
    v132 = v131;

    v133 = (void *)MEMORY[0x1E0D709F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v132);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "sampleWithValue:timestamp:", v134, v166);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "setGpuEnergy:", v135);

    if (v168 < 1001011)
    {
      v137 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DRAM Energy"));
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "doubleValue");
      objc_msgSend(v137, "numberWithDouble:", v139 / a4 * 1.2);
      v140 = (void *)objc_claimAutoreleasedReturnValue();

      v141 = (void *)MEMORY[0x1E0D709F0];
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "sampleWithValue:timestamp:", v140, v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService metrics](self, "metrics");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v144, "setDramPower:", v143);

      -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("DRAM_Power_W"), v140);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Rest of SoC Energy"));
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "doubleValue");
      v147 = v146;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ISP Energy"));
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "doubleValue");
      v150 = v147 + v149;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VDEC Energy"));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v151, "doubleValue");
      v153 = v150 + v152;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VENC Energy"));
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "doubleValue");
      v156 = v153 + v155;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v156 / a4 * 1.2);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = (void *)MEMORY[0x1E0D709F0];
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "sampleWithValue:timestamp:", v157, v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService metrics](self, "metrics");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "setOtherSocPower:", v160);

      v10 = v166;
      -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("Other_SoC_Power_W"), v157);

    }
    goto LABEL_20;
  }
  PLLogPowerMetricMonitor();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[PLPowerMetricMonitorService _parseEnergyModelOrPMPMetricsFromSample:withSampleDuration:sourceChannel:].cold.1();

LABEL_21:
}

- (void)_parseDCPSwapStats:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = (double *)&v21;
  v23 = 0x2020000000;
  v24 = 0;
  +[PLDisplayAgent dcpSubFrameMap](PLDisplayAgent, "dcpSubFrameMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__PLPowerMetricMonitorService__parseDCPSwapStats___block_invoke;
  v17[3] = &unk_1EA16DB00;
  v7 = v4;
  v18 = v7;
  v19 = &v25;
  v20 = &v21;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v17);

  v8 = v22[3];
  v9 = 0.0;
  if (v8 != 0.0)
  {
    v10 = v26[3];
    if (v10 != 0.0)
      v9 = 1.0 / (v8 / v10);
  }
  v11 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService dcpSwapStats](self, "dcpSwapStats");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sampleTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sampleWithValue:timestamp:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDisplayFPS:", v15);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

}

double __50__PLPowerMetricMonitorService__parseDCPSwapStats___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double result;

  v5 = (void *)a1[4];
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  *(double *)(*(_QWORD *)(a1[5] + 8) + 24) = v9 + *(double *)(*(_QWORD *)(a1[5] + 8) + 24);
  objc_msgSend(v6, "doubleValue");
  v11 = v10;

  v12 = *(_QWORD *)(a1[6] + 8);
  result = *(double *)(v12 + 24) + v9 * (1.0 / v11);
  *(double *)(v12 + 24) = result;
  return result;
}

- (void)_parseAMCSample:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v4 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DCS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  v9 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sampleWithValue:timestamp:", v10, v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDramBytes:", v11);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ANE DCS RD"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ANE DCS WR"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  v19 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15 + v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sampleWithValue:timestamp:", v20, v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAneDCSBytes:", v21);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ANE RD"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ANE WR"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "doubleValue");
  v28 = v27;

  v29 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25 + v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sampleWithValue:timestamp:", v30, v33);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setAneFabricBytes:", v31);

}

- (void)_parseSMCMetricsFromEntry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
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
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
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
  double v44;
  void *v45;
  void *v46;
  double v47;
  id v48;
  NSObject *v49;
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

  v4 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("B0AP"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService _convertToWattsFromMilliwatts:](self, "_convertToWattsFromMilliwatts:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(v4, "entryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sampleWithValue:timestamp:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBatteryPower:", v10);

  v59 = (void *)v7;
  -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("Battery_Power_W"), v7);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zSPi"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService _convertToWattsFromMilliwatts:](self, "_convertToWattsFromMilliwatts:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(v4, "entryDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sampleWithValue:timestamp:", v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDcInputPower:", v16);

  -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("DC_Input_Power_W"), v13);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CHAS"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(v4, "entryDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sampleWithValue:timestamp:", v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setChargingRate:", v21);

  -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("Charging_Rate_mA"), v18);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xRPE"));
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(v4, "entryDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sampleWithValue:timestamp:", v23, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCellularPower:", v26);

  v58 = (void *)v23;
  -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("Cellular_Power_W"), v23);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TVRM"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    v30 = v28;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TVBM"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      v33 = v31;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TVBH"));
      v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = v33;

  }
  v34 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(v4, "entryDate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sampleWithValue:timestamp:", v30, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setSkinTemperature:", v36);

  -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("Skin_Temp_C"), v30);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TB0T"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(v4, "entryDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "sampleWithValue:timestamp:", v38, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setBatteryTemperature:", v41);

  -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("Battery_Temp_C"), v38);
  if (v18)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("zSLi"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v57 = v13;
    if (v44 == 0.0)
    {
      v45 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("B0AP"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "doubleValue");
      objc_msgSend(v45, "numberWithDouble:", -v47);
      v48 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v48 = v43;
    }
    -[PLPowerMetricMonitorService _convertToWattsFromMilliwatts:](self, "_convertToWattsFromMilliwatts:", v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = (void *)MEMORY[0x1E0D709F0];
    objc_msgSend(v4, "entryDate");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "sampleWithValue:timestamp:", v50, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setSystemLoadPower:", v53);

    -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("System_Load_Power_W"), v50);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v43 != 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setIsSystemPowerAvailableWhileCharging:", v55 != 0);

    v13 = v57;
  }
  else
  {
    PLLogPowerMetricMonitor();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      -[PLPowerMetricMonitorService _parseSMCMetricsFromEntry:].cold.1();

  }
}

- (void)_parseWifiPowerMetricsFromEntry:(id)a3 cacheMetrics:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v4 = a4;
  v6 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("WifiPower"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService _convertToWattsFromMilliwatts:](self, "_convertToWattsFromMilliwatts:", v8);
  v33 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(v6, "entryDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sampleWithValue:timestamp:", v33, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWifiPower:", v11);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AWDLDown"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v13, "BOOLValue");

  v14 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10 ^ 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sampleWithValue:timestamp:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWifiAWDLStatus:", v17);

  v19 = (void *)MEMORY[0x1E0D709F0];
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AWDLRanging"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "sampleWithValue:timestamp:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWifiAWDLRange:", v22);

  -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("WiFi_Power_W"), v33);
  if (v4)
  {
    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "wifiPower");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService cachedMetrics](self, "cachedMetrics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWifiPower:", v25);

    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "wifiAWDLStatus");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService cachedMetrics](self, "cachedMetrics");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setWifiAWDLStatus:", v28);

    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "wifiAWDLRange");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService cachedMetrics](self, "cachedMetrics");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWifiAWDLRange:", v31);

  }
}

- (void)_parseGasGaugeMetricsFromEntry:(id)a3
{
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("GasGaugePower"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  if (v7 <= 0.0)
  {
    v8 = (void *)MEMORY[0x1E0D709F0];
    v9 = v7 / -1000.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "entryDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sampleWithValue:timestamp:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSystemLoadPower:", v12);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("System_Load_Power_W"), v14);

  }
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIsSystemPowerAvailableWhileCharging:", 0);

}

- (void)_parseProcessMonitorMetricsFromEntry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v42 = v4;
    v48 = v4;
    -[PLPowerMetricMonitorService currQueryTime](self, "currQueryTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService lastQueryTime](self, "lastQueryTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10;

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allKeys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v13;
    v45 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v45)
    {
      v44 = *(_QWORD *)v50;
      v14 = &unk_1EA1BFE58;
      v15 = &unk_1EA1BFE58;
      do
      {
        for (i = 0; i != v45; ++i)
        {
          if (*(_QWORD *)v50 != v44)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          -[NSObject objectsForSubKey:ofSubKeyType:](v48, "objectsForSubKey:ofSubKeyType:", v17, CFSTR("PID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count"))
          {
            objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "doubleValue");
            v21 = v20;

            v22 = v21;
            if (v11 > 0.0)
              v22 = fmin(v21 / v11 * 1000.0 * 0.5, 1000.0);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
            v47 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22);
            v46 = objc_claimAutoreleasedReturnValue();

            v23 = (void *)MEMORY[0x1E0D709F0];
            -[NSObject entryDate](v48, "entryDate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "sampleWithValue:timestamp:", v47, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLPowerMetricMonitorService metrics](self, "metrics");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "processMetrics");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "objectForKeyedSubscript:", v17);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setCpuSeconds:", v25);

            v29 = (void *)MEMORY[0x1E0D709F0];
            -[NSObject entryDate](v48, "entryDate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "sampleWithValue:timestamp:", v46, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLPowerMetricMonitorService metrics](self, "metrics");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "processMetrics");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "objectForKeyedSubscript:", v17);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setCpuCost:", v31);

            v15 = (void *)v47;
            -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:pid:](self, "_emitPowerSignpostWithMetric:value:pid:", CFSTR("CPU_Seconds"), v47, v17);
            -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:pid:](self, "_emitPowerSignpostWithMetric:value:pid:", CFSTR("CPU_Cost"), v46, v17);
            v14 = (void *)v46;
          }

        }
        v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v45);
    }
    else
    {
      v14 = &unk_1EA1BFE58;
      v15 = &unk_1EA1BFE58;
    }

    v4 = v42;
  }
  else
  {
    PLLogPowerMetricMonitor();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      -[PLPowerMetricMonitorService _parseProcessMonitorMetricsFromEntry:].cold.1(v48, v35, v36, v37, v38, v39, v40, v41);
  }

}

- (void)_parseProcessNetworkMetricsFromEntry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
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
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  id obj;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  id v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleName"));
    v8 = objc_claimAutoreleasedReturnValue();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v10;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    if (v11)
    {
      v13 = v11;
      v14 = 0x1EA16B000uLL;
      v15 = *(_QWORD *)v70;
      *(_QWORD *)&v12 = 136315394;
      v59 = v12;
      v60 = *(_QWORD *)v70;
      v61 = v8;
      do
      {
        v16 = 0;
        v62 = v13;
        do
        {
          if (*(_QWORD *)v70 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v16);
          objc_msgSend(*(id *)(v14 + 3136), "bundleIDFromPid:", objc_msgSend(v17, "intValue", v59));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "isEqualToString:", v8))
          {
            v65 = v18;
            PLLogPowerMetricMonitor();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v59;
              v74 = "-[PLPowerMetricMonitorService _parseProcessNetworkMetricsFromEntry:]";
              v75 = 2112;
              v76 = v4;
              _os_log_debug_impl(&dword_1DA9D6000, v19, OS_LOG_TYPE_DEBUG, "%s: processNetworkEntry=%@", buf, 0x16u);
            }

            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WifiIn"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WifiOut"));
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CellIn"));
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CellOut"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x1E0D709F0];
            objc_msgSend(v4, "entryDate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "sampleWithValue:timestamp:", v67, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLPowerMetricMonitorService metrics](self, "metrics");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "processMetrics");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v17);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setWifiIn:", v22);

            v26 = (void *)MEMORY[0x1E0D709F0];
            objc_msgSend(v4, "entryDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "sampleWithValue:timestamp:", v66, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLPowerMetricMonitorService metrics](self, "metrics");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "processMetrics");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", v17);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "setWifiOut:", v28);

            v32 = (void *)MEMORY[0x1E0D709F0];
            objc_msgSend(v4, "entryDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "sampleWithValue:timestamp:", v68, v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLPowerMetricMonitorService metrics](self, "metrics");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "processMetrics");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectForKeyedSubscript:", v17);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setCellIn:", v34);

            v38 = (void *)MEMORY[0x1E0D709F0];
            objc_msgSend(v4, "entryDate");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "sampleWithValue:timestamp:", v64, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLPowerMetricMonitorService metrics](self, "metrics");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "processMetrics");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectForKeyedSubscript:", v17);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setCellOut:", v40);

            -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:pid:](self, "_emitPowerSignpostWithMetric:value:pid:", CFSTR("WiFi_In"), v67, v17);
            -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:pid:](self, "_emitPowerSignpostWithMetric:value:pid:", CFSTR("WiFi_Out"), v66, v17);
            -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:pid:](self, "_emitPowerSignpostWithMetric:value:pid:", CFSTR("Cell_In"), v68, v17);
            -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:pid:](self, "_emitPowerSignpostWithMetric:value:pid:", CFSTR("Cell_Out"), v64, v17);
            -[PLPowerMetricMonitorService _computeNetworkingCostWithWifiIn:wifiOut:cellIn:cellOut:](self, "_computeNetworkingCostWithWifiIn:wifiOut:cellIn:cellOut:", objc_msgSend(v67, "intValue"), objc_msgSend(v66, "intValue"), objc_msgSend(v68, "intValue"), objc_msgSend(v64, "intValue"));
            v45 = (void *)MEMORY[0x1E0D709F0];
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "entryDate");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "sampleWithValue:timestamp:", v46, v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLPowerMetricMonitorService metrics](self, "metrics");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "processMetrics");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "objectForKeyedSubscript:", v17);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "setNetworkCost:", v48);

            v15 = v60;
            v8 = v61;
            v14 = 0x1EA16B000;
            v13 = v62;
            v18 = v65;
          }

          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
      }
      while (v13);
    }

  }
  else
  {
    PLLogPowerMetricMonitor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PLPowerMetricMonitorService _parseProcessNetworkMetricsFromEntry:].cold.1(v8, v52, v53, v54, v55, v56, v57, v58);
  }

}

- (void)_parseLocationMetricsFromEntry:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
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
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  NSObject *v54;
  PLPowerMetricMonitorService *v55;
  uint64_t v56;
  id obj;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  NSObject *v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v58 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v55 = self;
  -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("BundleId"));
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7 == v8))
    {
      PLLogPowerMetricMonitor();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[PLPowerMetricMonitorService _parseLocationMetricsFromEntry:].cold.2();

    }
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v11;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v60;
      v16 = 0x1EA16B000uLL;
      *(_QWORD *)&v13 = 136315394;
      v52 = v13;
      v53 = *(_QWORD *)v60;
      v54 = v7;
      do
      {
        v17 = 0;
        v56 = v14;
        do
        {
          if (*(_QWORD *)v60 != v15)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v17);
          objc_msgSend(*(id *)(v16 + 3136), "bundleIDFromPid:", objc_msgSend(v18, "intValue", v52));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "isEqualToString:", v7))
          {
            objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {

              goto LABEL_15;
            }
            objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("LocationDesiredAccuracy"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            if (v29)
            {
              PLLogPowerMetricMonitor();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v52;
                v64 = "-[PLPowerMetricMonitorService _parseLocationMetricsFromEntry:]";
                v65 = 2112;
                v66 = v7;
                _os_log_debug_impl(&dword_1DA9D6000, v30, OS_LOG_TYPE_DEBUG, "%s: location start signal; bundleId=%@",
                  buf,
                  0x16u);
              }

              v31 = (void *)MEMORY[0x1E0D709F0];
              objc_msgSend(v58, "entryDate");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "sampleWithValue:timestamp:", MEMORY[0x1E0C9AAB0], v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLPowerMetricMonitorService metrics](v55, "metrics");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "processMetrics");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "objectForKeyedSubscript:", v18);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setOngoingLocation:", v33);

              -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:pid:](v55, "_emitPowerSignpostWithMetric:value:pid:", CFSTR("Ongoing_Location"), MEMORY[0x1E0C9AAB0], v18);
              v37 = (void *)MEMORY[0x1E0CB37E8];
              -[PLPowerMetricMonitorService _computeLocationCostWithWifiCost:gpsCost:cellCost:skyhookCost:](v55, "_computeLocationCostWithWifiCost:gpsCost:cellCost:skyhookCost:", 0, 1, 0, 0);
              objc_msgSend(v37, "numberWithDouble:");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = (void *)MEMORY[0x1E0D709F0];
              objc_msgSend(v58, "entryDate");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "sampleWithValue:timestamp:", v38, v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLPowerMetricMonitorService metrics](v55, "metrics");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "processMetrics");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "objectForKeyedSubscript:", v18);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "setLocationCost:", v41);

              v7 = v54;
              -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:pid:](v55, "_emitPowerSignpostWithMetric:value:pid:", CFSTR("Location_Cost"), v38, v18);

            }
            else
            {
LABEL_15:
              PLLogPowerMetricMonitor();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v52;
                v64 = "-[PLPowerMetricMonitorService _parseLocationMetricsFromEntry:]";
                v65 = 2112;
                v66 = v7;
                _os_log_debug_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_DEBUG, "%s: location terminate signal; bundleId=%@",
                  buf,
                  0x16u);
              }

              v22 = (void *)MEMORY[0x1E0D709F0];
              objc_msgSend(v58, "entryDate");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = MEMORY[0x1E0C9AAA0];
              objc_msgSend(v22, "sampleWithValue:timestamp:", MEMORY[0x1E0C9AAA0], v23);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLPowerMetricMonitorService metrics](v55, "metrics");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "processMetrics");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectForKeyedSubscript:", v18);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setOngoingLocation:", v25);

              v7 = v54;
              -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:pid:](v55, "_emitPowerSignpostWithMetric:value:pid:", CFSTR("Ongoing_Location"), v24, v18);
            }
            v14 = v56;
            v15 = v53;
            v16 = 0x1EA16B000;
          }

          ++v17;
        }
        while (v14 != v17);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
      }
      while (v14);
    }

  }
  else
  {
    PLLogPowerMetricMonitor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[PLPowerMetricMonitorService _parseLocationMetricsFromEntry:].cold.1(v7, v45, v46, v47, v48, v49, v50, v51);
  }

}

- (void)_parseApplicationMetricsFromEntry:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
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
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint8_t v24[16];

  v4 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pid"));
    v8 = objc_claimAutoreleasedReturnValue();
    -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("State"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D709F0];
      objc_msgSend(v4, "entryDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sampleWithValue:timestamp:", v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService metrics](self, "metrics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "processMetrics");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setApplicationState:", v14);

      -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setApplicationState:", v11);

      -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:pid:](self, "_emitPowerSignpostWithMetric:value:pid:", CFSTR("Application_State"), v11, v8);
      v20 = -[NSObject intValue](v8, "intValue");
      v21 = objc_msgSend(v11, "intValue");
      -[PLPowerMetricMonitorService currQueryTime](self, "currQueryTime");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPowerMetricMonitorService _setLastActiveStartTimeAndLastSuspendTimeWithPid:appState:currentTime:](self, "_setLastActiveStartTimeAndLastSuspendTimeWithPid:appState:currentTime:", v20, v21, v22);

    }
    else
    {
      PLLogPowerMetricMonitor();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[PLPowerMetricMonitorService _parseApplicationMetricsFromEntry:].cold.1();

    }
  }
  else
  {
    PLLogPowerMetricMonitor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1DA9D6000, v8, OS_LOG_TYPE_INFO, "Not currently tracking a PID", v24, 2u);
    }
  }

}

- (void)_updateMetricsWithThermalState
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t state64;

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (_updateMetricsWithThermalState_onceToken != -1)
    dispatch_once(&_updateMetricsWithThermalState_onceToken, &__block_literal_global_405);
  state64 = 0;
  notify_get_state(_updateMetricsWithThermalState_thermalStateToken, &state64);
  v4 = state64;
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setThermalPressure:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", state64);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("Thermal_State"), v6);

  objc_msgSend((id)_updateMetricsWithThermalState_cltmDefaults, "stringForKey:", CFSTR("thermalSimulationMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("nominal")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("light")) & 1) != 0)
    {
      v9 = 10;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("moderate")) & 1) != 0)
    {
      v9 = 20;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("heavy")))
    {
      v9 = 30;
    }
    else
    {
      v9 = -1;
    }
  }
  else
  {
    v9 = -1;
  }
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInducedThermalPressure:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService _emitPowerSignpostWithMetric:value:](self, "_emitPowerSignpostWithMetric:value:", CFSTR("Induced_Thermal_State"), v11);

}

void __61__PLPowerMetricMonitorService__updateMetricsWithThermalState__block_invoke()
{
  uint64_t v0;
  void *v1;

  notify_register_check((const char *)*MEMORY[0x1E0C83A00], &_updateMetricsWithThermalState_thermalStateToken);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.cltm"));
  v1 = (void *)_updateMetricsWithThermalState_cltmDefaults;
  _updateMetricsWithThermalState_cltmDefaults = v0;

}

- (id)_convertToWattsFromMilliwatts:(id)a3
{
  void *v3;
  double v4;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "doubleValue");
  return (id)objc_msgSend(v3, "numberWithDouble:", v4 / 1000.0);
}

- (double)_computeDisplayCostWithAvgRed:(int)a3 avgGreen:(int)a4 avgBlue:(int)a5
{
  double v5;
  NSObject *v6;

  v5 = ((double)a4 / 255.0 * 0.25 + (double)a3 / 255.0 * 0.31 + (double)a5 * 0.44 / 255.0) * 600.0;
  PLLogPowerMetricMonitor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PLPowerMetricMonitorService _computeDisplayCostWithAvgRed:avgGreen:avgBlue:].cold.1();

  return v5;
}

- (double)_computeNetworkingCostWithWifiIn:(int)a3 wifiOut:(int)a4 cellIn:(int)a5 cellOut:(int)a6
{
  double v6;
  NSObject *v7;

  v6 = (double)(a4 + a3 + a5 + a6);
  PLLogPowerMetricMonitor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLPowerMetricMonitorService _computeNetworkingCostWithWifiIn:wifiOut:cellIn:cellOut:].cold.1();

  return v6;
}

- (double)_computeLocationCostWithWifiCost:(int)a3 gpsCost:(int)a4 cellCost:(int)a5 skyhookCost:(int)a6
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  double v11;
  double v12;
  NSObject *v13;

  if (a3 <= 0)
    v6 = 0;
  else
    v6 = 50;
  if (a4 <= 0)
    v7 = 0;
  else
    v7 = 200;
  v8 = v7 | v6;
  if (a5 <= 0)
    v9 = 0;
  else
    v9 = 100;
  if (a6 <= 0)
    v10 = 0;
  else
    v10 = 50;
  v11 = (double)(v8 + v9 + v10);
  if (v11 < 50.0)
    v11 = 50.0;
  v12 = fmin(v11, 200.0);
  PLLogPowerMetricMonitor();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PLPowerMetricMonitorService _computeLocationCostWithWifiCost:gpsCost:cellCost:skyhookCost:].cold.1();

  return v12;
}

- (double)_computeGPUCostWithGPUSec:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "doubleValue");
  v7 = v6;

  -[PLPowerMetricMonitorService currQueryTime](self, "currQueryTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService lastQueryTime](self, "lastQueryTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = v10;

  if (v11 * 1000000000.0 > 0.0)
    v7 = fmin(v7 / (v11 * 1000000000.0) * 1000.0 * 0.5, 1000.0);
  PLLogPowerMetricMonitor();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[PLPowerMetricMonitorService _computeGPUCostWithGPUSec:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  return v7;
}

- (double)_computeCPUCostWithCPUTicks:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "doubleValue");
  v7 = v6;

  +[PLUtilities secondsFromMachTime:](PLUtilities, "secondsFromMachTime:", (unint64_t)v7);
  v9 = v8;
  -[PLPowerMetricMonitorService currQueryTime](self, "currQueryTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPowerMetricMonitorService lastQueryTime](self, "lastQueryTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = v12;

  if (v13 > 0.0)
    v9 = fmin(v9 / v13 * 1000.0 * 0.5, 1000.0);
  PLLogPowerMetricMonitor();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = 136315394;
    v17 = "-[PLPowerMetricMonitorService _computeCPUCostWithCPUTicks:]";
    v18 = 2048;
    v19 = v9;
    _os_log_impl(&dword_1DA9D6000, v14, OS_LOG_TYPE_INFO, "%s: CPU Cost=%f", (uint8_t *)&v16, 0x16u);
  }

  return v9;
}

- (void)_computeEnergyScoreForProcess
{
  OUTLINED_FUNCTION_3_3(&dword_1DA9D6000, a1, a3, "%s: PLServiceTypeBatteryGaugeService active, returning", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (id)_extractCurrentUsageMetrics
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
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
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id obj;
  id obja;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v79 = (void *)objc_opt_new();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v84;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v84 != v8)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
        -[PLPowerMetricMonitorService metrics](self, "metrics");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "processMetrics");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "cpuCost");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "value");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "doubleValue");
        v13 = v13 + v21;

        -[PLPowerMetricMonitorService metrics](self, "metrics");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "processMetrics");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "gpuCost");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "value");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "doubleValue");
        v12 = v12 + v27;

        -[PLPowerMetricMonitorService metrics](self, "metrics");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "processMetrics");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v15);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "networkCost");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "value");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "doubleValue");
        v11 = v11 + v33;

        -[PLPowerMetricMonitorService metrics](self, "metrics");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "processMetrics");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", v15);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "locationCost");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "value");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "doubleValue");
        v10 = v10 + v39;

        -[PLPowerMetricMonitorService metrics](self, "metrics");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "processMetrics");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", v15);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "applicationState");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "value");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "doubleValue");
        v9 = v9 + v45;

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  obja = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "numberWithInteger:", objc_msgSend(v47, "thermalPressure"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPowerMetricMonitorService metrics](self, "metrics");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "inducedThermalPressure");

  if (v49 == -1)
  {
    v74 = 0;
  }
  else
  {
    v50 = (void *)MEMORY[0x1E0CB37E8];
    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "numberWithInteger:", objc_msgSend(v51, "inducedThermalPressure"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 0))
  {
    -[PLPowerMetricMonitorService metrics](self, "metrics");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "displayCost");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "value");
    v54 = objc_claimAutoreleasedReturnValue();

    v73 = (void *)v54;
    if (v54)
      v55 = (void *)v54;
    else
      v55 = &unk_1EA1BFE58;
    v101[0] = CFSTR("cost");
    v101[1] = CFSTR("overhead");
    v102[0] = v55;
    v102[1] = &unk_1EA1BFE58;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v79;
    objc_msgSend(v79, "setObject:forKeyedSubscript:", v56, CFSTR("DisplayCost"));

  }
  else
  {
    v73 = 0;
    v57 = v79;
  }
  v58 = obja;
  if (!obja)
    v58 = &unk_1EA1BFE58;
  v99[0] = CFSTR("cost");
  v99[1] = CFSTR("overhead");
  v100[0] = v58;
  v100[1] = &unk_1EA1BFE58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v59, CFSTR("CPUCost"));

  v60 = v80;
  if (!v80)
    v60 = &unk_1EA1BFE58;
  v97[0] = CFSTR("cost");
  v97[1] = CFSTR("overhead");
  v98[0] = v60;
  v98[1] = &unk_1EA1BFE58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v61, CFSTR("NetworkCost"));

  if (v77)
    v62 = v77;
  else
    v62 = &unk_1EA1BFE58;
  v95[0] = CFSTR("cost");
  v95[1] = CFSTR("overhead");
  v96[0] = v62;
  v96[1] = &unk_1EA1BFE58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v63, CFSTR("LocationCost"));

  if (v76)
    v64 = v76;
  else
    v64 = &unk_1EA1BFE58;
  v93[0] = CFSTR("cost");
  v93[1] = CFSTR("overhead");
  v94[0] = v64;
  v94[1] = &unk_1EA1BFE58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v65, CFSTR("CurrentApplicationState"));

  if (v78)
    v66 = v78;
  else
    v66 = &unk_1EA1BFE58;
  v91[0] = CFSTR("cost");
  v91[1] = CFSTR("overhead");
  v92[0] = v66;
  v92[1] = &unk_1EA1BFE58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v67, CFSTR("GPUCost"));

  if (v75)
    v68 = v75;
  else
    v68 = &unk_1EA1BFE58;
  v89[0] = CFSTR("cost");
  v89[1] = CFSTR("overhead");
  v90[0] = v68;
  v90[1] = &unk_1EA1BFE58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v69, CFSTR("CurrentThermalState"));

  if (v74)
    v70 = v74;
  else
    v70 = &unk_1EA1BFE70;
  v87[0] = CFSTR("cost");
  v87[1] = CFSTR("overhead");
  v88[0] = v70;
  v88[1] = &unk_1EA1BFE70;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v71, CFSTR("InducedThermalState"));

  return v57;
}

- (BOOL)_pidIsValid:(int)a3
{
  int v4;
  BOOL result;
  unint64_t v6;
  int v7;
  _DWORD __b[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 < 1)
    return 0;
  v4 = proc_listpids(1u, 0, 0, 0);
  memset(__b, 255, sizeof(__b));
  proc_listpids(1u, 0, __b, 4096);
  result = 0;
  if (v4 >= 4)
  {
    v6 = 0;
    do
    {
      v7 = __b[v6];
      result = v7 == a3;
      if (v7 == a3)
        break;
      if (v6 > 0x3FE)
        break;
      ++v6;
    }
    while ((unint64_t)v4 >> 2 > v6);
  }
  return result;
}

- (void)_setLastActiveStartTimeAndLastSuspendTimeWithPid:(int)a3 appState:(int)a4 currentTime:(id)a5
{
  uint64_t v6;
  NSObject *v8;
  void *v9;
  uint64_t v10;
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
  id v26;

  v6 = *(_QWORD *)&a3;
  v26 = a5;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastActiveStart");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastSuspendStart");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 == 8 || a4 == 4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 != v19)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 == v20 || v18 <= v14)
          goto LABEL_13;
      }
      -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setLastActiveStart:", v26);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18 != v24)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 == v25 || v18 >= v14)
          goto LABEL_13;
      }
      -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setLastSuspendStart:", v26);
    }

LABEL_13:
  }

}

- (void)_startMetricCollectionTimerWithInterval:(double)a3 block:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_source_t v10;
  NSObject *v11;
  NSObject *v12;

  v6 = a4;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[PLPowerMetricMonitorService _cancelMetricCollectionTimer](self, "_cancelMetricCollectionTimer");
  if (a3 >= 0.2)
  {
    -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v9);
    -[PLPowerMetricMonitorService setMetricCollectionRepeatingTimer:](self, "setMetricCollectionRepeatingTimer:", v10);

    -[PLPowerMetricMonitorService metricCollectionRepeatingTimer](self, "metricCollectionRepeatingTimer");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v11, 0, (unint64_t)(a3 * 1000000000.0), 0x989680uLL);

    -[PLPowerMetricMonitorService metricCollectionRepeatingTimer](self, "metricCollectionRepeatingTimer");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_event_handler(v12, v6);

    -[PLPowerMetricMonitorService metricCollectionRepeatingTimer](self, "metricCollectionRepeatingTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v8);
  }
  else
  {
    PLLogPowerMetricMonitor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[PLPowerMetricMonitorService _startMetricCollectionTimerWithInterval:block:].cold.1();
  }

}

- (void)setMetricCollectionTimerUpdateInterval:(double)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (a3 >= 0.2)
  {
    -[PLPowerMetricMonitorService metricCollectionRepeatingTimer](self, "metricCollectionRepeatingTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PLPowerMetricMonitorService metricCollectionRepeatingTimer](self, "metricCollectionRepeatingTimer");
      v8 = objc_claimAutoreleasedReturnValue();
      dispatch_source_set_timer(v8, 0, (unint64_t)(a3 * 1000000000.0), 0x989680uLL);

    }
  }
  else
  {
    PLLogPowerMetricMonitor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[PLPowerMetricMonitorService _startMetricCollectionTimerWithInterval:block:].cold.1();

  }
}

- (void)_cancelMetricCollectionTimer
{
  NSObject *v3;
  void *v4;
  NSObject *v5;

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PLPowerMetricMonitorService metricCollectionRepeatingTimer](self, "metricCollectionRepeatingTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLPowerMetricMonitorService metricCollectionRepeatingTimer](self, "metricCollectionRepeatingTimer");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v5);

    -[PLPowerMetricMonitorService setMetricCollectionRepeatingTimer:](self, "setMetricCollectionRepeatingTimer:", 0);
  }
}

- (void)_startMetricCollectionTimeoutTimerWithTimeout:(double)a3 block:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_source_t v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  NSObject *v13;

  v6 = a4;
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[PLPowerMetricMonitorService _cancelMetricCollectionTimeoutTimer](self, "_cancelMetricCollectionTimeoutTimer");
  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v8);
  -[PLPowerMetricMonitorService setMetricCollectionTimeoutTimer:](self, "setMetricCollectionTimeoutTimer:", v9);

  -[PLPowerMetricMonitorService metricCollectionTimeoutTimer](self, "metricCollectionTimeoutTimer");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);

  -[PLPowerMetricMonitorService metricCollectionTimeoutTimer](self, "metricCollectionTimeoutTimer");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_source_set_event_handler(v12, v6);

  -[PLPowerMetricMonitorService metricCollectionTimeoutTimer](self, "metricCollectionTimeoutTimer");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v13);

}

- (void)_cancelMetricCollectionTimeoutTimer
{
  NSObject *v3;
  void *v4;
  NSObject *v5;

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PLPowerMetricMonitorService metricCollectionTimeoutTimer](self, "metricCollectionTimeoutTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLPowerMetricMonitorService metricCollectionTimeoutTimer](self, "metricCollectionTimeoutTimer");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v5);

    -[PLPowerMetricMonitorService setMetricCollectionTimeoutTimer:](self, "setMetricCollectionTimeoutTimer:", 0);
  }
}

- (void)_sampleCoalitions
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  -[PLPowerMetricMonitorService monitorQueue](self, "monitorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[PLPowerMetricMonitorService updateMode](self, "updateMode"))
  {
    -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      -[PLPowerMetricMonitorService trackedProcesses](self, "trackedProcesses");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke;
      v7[3] = &unk_1EA16DB48;
      v7[4] = self;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

    }
  }
}

void __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  NSObject *v8;
  PLCoalitionSample *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
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
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;

  v5 = a2;
  v6 = a3;
  v7 = malloc_type_malloc(0x160uLL, 0x1000040AF73A19AuLL);
  objc_msgSend(v6, "coalitionID");
  if (!coalition_info_resource_usage())
  {
    v9 = objc_alloc_init(PLCoalitionSample);
    -[PLCoalitionSample setInstructions:](v9, "setInstructions:", v7[31]);
    -[PLCoalitionSample setPInstructions:](v9, "setPInstructions:", v7[35]);
    -[PLCoalitionSample setBytesread:](v9, "setBytesread:", v7[6]);
    -[PLCoalitionSample setByteswritten:](v9, "setByteswritten:", v7[7]);
    -[PLCoalitionSample setGpuTime:](v9, "setGpuTime:", v7[8]);
    -[PLCoalitionSample setGpuEnergy:](v9, "setGpuEnergy:", v7[42] + v7[41] - v7[43]);
    -[PLCoalitionSample setCpuTime:](v9, "setCpuTime:", v7[9] + v7[3] - v7[10]);
    -[PLCoalitionSample setAneEnergy:](v9, "setAneEnergy:", v7[39]);
    -[PLCoalitionSample setAneTime:](v9, "setAneTime:", v7[38]);
    PLLogPowerMetricMonitor();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_3();

    objc_msgSend(v6, "coalitionSample");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogPowerMetricMonitor();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      v92 = v6;
      if (v13)
        __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_2();

      v14 = -[PLCoalitionSample instructions](v9, "instructions");
      v78 = v14 - objc_msgSend(v11, "instructions");
      v15 = -[PLCoalitionSample pInstructions](v9, "pInstructions");
      v80 = v15 - objc_msgSend(v11, "pInstructions");
      v16 = -[PLCoalitionSample bytesread](v9, "bytesread");
      v82 = v16 - objc_msgSend(v11, "bytesread");
      v17 = -[PLCoalitionSample byteswritten](v9, "byteswritten");
      v84 = v17 - objc_msgSend(v11, "byteswritten");
      v18 = -[PLCoalitionSample gpuTime](v9, "gpuTime");
      v19 = v18 - objc_msgSend(v11, "gpuTime");
      v20 = -[PLCoalitionSample gpuEnergy](v9, "gpuEnergy");
      v89 = v20 - objc_msgSend(v11, "gpuEnergy");
      v21 = -[PLCoalitionSample cpuTime](v9, "cpuTime");
      v22 = v21 - objc_msgSend(v11, "cpuTime");
      v23 = -[PLCoalitionSample aneEnergy](v9, "aneEnergy");
      v86 = v23 - objc_msgSend(v11, "aneEnergy");
      v24 = -[PLCoalitionSample aneTime](v9, "aneTime");
      v88 = v24 - objc_msgSend(v11, "aneTime");
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v77 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v22);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "_computeGPUCostWithGPUSec:", v93);
      objc_msgSend(v25, "numberWithDouble:");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "_computeCPUCostWithCPUTicks:", v90);
      objc_msgSend(v26, "numberWithDouble:");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "currQueryTime");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "lastQueryTime");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timeIntervalSinceDate:", v29);
      objc_msgSend(v27, "numberWithDouble:");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "processMetrics");
      v91 = v11;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v5);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setSampleTime:", v30);

      objc_msgSend(MEMORY[0x1E0D709F0], "sampleWithValue:timestamp:", v94, v77);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "processMetrics");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKeyedSubscript:", v5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setGpuCost:", v34);

      objc_msgSend(MEMORY[0x1E0D709F0], "sampleWithValue:timestamp:", v95, v77);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "processMetrics");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", v5);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setCpuCost:", v38);

      objc_msgSend(*(id *)(a1 + 32), "_emitPowerSignpostWithMetric:value:pid:", CFSTR("GPU_Cost"), v94, v5);
      objc_msgSend(MEMORY[0x1E0D709F0], "sampleWithValue:timestamp:", v93, v77);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "processMetrics");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", v5);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setGpuTime:", v42);

      objc_msgSend(*(id *)(a1 + 32), "_emitPowerSignpostWithMetric:value:pid:", CFSTR("GPU_Time"), v93, v5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D709F0], "sampleWithValue:timestamp:");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "processMetrics");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "objectForKeyedSubscript:", v5);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setCpuInstructions:", v46);

      objc_msgSend(*(id *)(a1 + 32), "_emitPowerSignpostWithMetric:value:pid:", CFSTR("CPU_Inst"), v79, v5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v77;
      objc_msgSend(MEMORY[0x1E0D709F0], "sampleWithValue:timestamp:", v81, v77);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "processMetrics");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKeyedSubscript:", v5);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setCpuPInstructions:", v50);

      objc_msgSend(*(id *)(a1 + 32), "_emitPowerSignpostWithMetric:value:pid:", CFSTR("CPU_PInst"), v81, v5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D709F0], "sampleWithValue:timestamp:", v83, v77);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "processMetrics");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectForKeyedSubscript:", v5);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setBytesRead:", v54);

      objc_msgSend(*(id *)(a1 + 32), "_emitPowerSignpostWithMetric:value:pid:", CFSTR("Disk_Read"), v83, v5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D709F0], "sampleWithValue:timestamp:", v85, v77);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "processMetrics");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectForKeyedSubscript:", v5);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setBytesWritten:", v58);

      objc_msgSend(*(id *)(a1 + 32), "_emitPowerSignpostWithMetric:value:pid:", CFSTR("Disk_Write"), v85, v5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D709F0], "sampleWithValue:timestamp:", v87, v77);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "processMetrics");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "objectForKeyedSubscript:", v5);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setAneEnergy:", v62);

      v66 = (void *)MEMORY[0x1E0CB37E8];
      +[PLUtilities secondsFromMachTime:](PLUtilities, "secondsFromMachTime:", v88);
      objc_msgSend(v66, "numberWithDouble:");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D709F0], "sampleWithValue:timestamp:", v67, v77);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "processMetrics");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "objectForKeyedSubscript:", v5);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setAneTime:", v68);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v89);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D709F0], "sampleWithValue:timestamp:", v72, v77);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "processMetrics");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "objectForKeyedSubscript:", v5);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setGpuEnergy:", v73);

      v11 = v91;
      v6 = v92;
    }
    else if (v13)
    {
      __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_1();
    }

    objc_msgSend(v6, "setCoalitionSample:", v9);
    goto LABEL_15;
  }
  PLLogPowerMetricMonitor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_4();

  if (v7)
LABEL_15:
    free(v7);

}

- (PPSMetricMonitorService)metricMonitorService
{
  return (PPSMetricMonitorService *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMetricMonitorService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (int64_t)updateMode
{
  return self->_updateMode;
}

- (void)setUpdateMode:(int64_t)a3
{
  self->_updateMode = a3;
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(double)a3
{
  self->_updateInterval = a3;
}

- (BOOL)isMonitoring
{
  return self->_isMonitoring;
}

- (void)setIsMonitoring:(BOOL)a3
{
  self->_isMonitoring = a3;
}

- (BOOL)isCollectingMetrics
{
  return self->_isCollectingMetrics;
}

- (void)setIsCollectingMetrics:(BOOL)a3
{
  self->_isCollectingMetrics = a3;
}

- (PPSMetricCollection)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (PPSMetricCollection)cachedMetrics
{
  return self->_cachedMetrics;
}

- (void)setCachedMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMetrics, a3);
}

- (NSMutableDictionary)trackedProcesses
{
  return self->_trackedProcesses;
}

- (void)setTrackedProcesses:(id)a3
{
  objc_storeStrong((id *)&self->_trackedProcesses, a3);
}

- (NSMutableSet)systemMetricEntryKeys
{
  return self->_systemMetricEntryKeys;
}

- (void)setSystemMetricEntryKeys:(id)a3
{
  objc_storeStrong((id *)&self->_systemMetricEntryKeys, a3);
}

- (NSMutableSet)processSpecificMetricEntryKeys
{
  return self->_processSpecificMetricEntryKeys;
}

- (void)setProcessSpecificMetricEntryKeys:(id)a3
{
  objc_storeStrong((id *)&self->_processSpecificMetricEntryKeys, a3);
}

- (NSMutableSet)batteryGaugeConflictingSystemMetricEntryKeys
{
  return self->_batteryGaugeConflictingSystemMetricEntryKeys;
}

- (void)setBatteryGaugeConflictingSystemMetricEntryKeys:(id)a3
{
  objc_storeStrong((id *)&self->_batteryGaugeConflictingSystemMetricEntryKeys, a3);
}

- (NSMutableSet)batteryGaugeConflictingProcessSpecificEntryKeys
{
  return self->_batteryGaugeConflictingProcessSpecificEntryKeys;
}

- (void)setBatteryGaugeConflictingProcessSpecificEntryKeys:(id)a3
{
  objc_storeStrong((id *)&self->_batteryGaugeConflictingProcessSpecificEntryKeys, a3);
}

- (NSMutableSet)entryKeysToCollect
{
  return self->_entryKeysToCollect;
}

- (void)setEntryKeysToCollect:(id)a3
{
  objc_storeStrong((id *)&self->_entryKeysToCollect, a3);
}

- (NSMutableSet)entryKeysRequested
{
  return self->_entryKeysRequested;
}

- (void)setEntryKeysRequested:(id)a3
{
  objc_storeStrong((id *)&self->_entryKeysRequested, a3);
}

- (NSMutableSet)entryKeysCollected
{
  return self->_entryKeysCollected;
}

- (void)setEntryKeysCollected:(id)a3
{
  objc_storeStrong((id *)&self->_entryKeysCollected, a3);
}

- (NSMutableDictionary)entryKeyToEntryInfo
{
  return self->_entryKeyToEntryInfo;
}

- (void)setEntryKeyToEntryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_entryKeyToEntryInfo, a3);
}

- (OS_dispatch_queue)monitorQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 176, 1);
}

- (void)setMonitorQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (OS_dispatch_source)metricCollectionRepeatingTimer
{
  return self->_metricCollectionRepeatingTimer;
}

- (void)setMetricCollectionRepeatingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_metricCollectionRepeatingTimer, a3);
}

- (OS_dispatch_source)metricCollectionTimeoutTimer
{
  return self->_metricCollectionTimeoutTimer;
}

- (void)setMetricCollectionTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_metricCollectionTimeoutTimer, a3);
}

- (id)metricCollectionCompletionHandler
{
  return self->_metricCollectionCompletionHandler;
}

- (void)setMetricCollectionCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (PLIOReportStats)energyModelStats
{
  return self->_energyModelStats;
}

- (void)setEnergyModelStats:(id)a3
{
  objc_storeStrong((id *)&self->_energyModelStats, a3);
}

- (PLIOReportStats)pmpCountersStats
{
  return self->_pmpCountersStats;
}

- (void)setPmpCountersStats:(id)a3
{
  objc_storeStrong((id *)&self->_pmpCountersStats, a3);
}

- (PLIOReportStats)dcpSwapStats
{
  return self->_dcpSwapStats;
}

- (void)setDcpSwapStats:(id)a3
{
  objc_storeStrong((id *)&self->_dcpSwapStats, a3);
}

- (PLIOReportStats)amcStats
{
  return self->_amcStats;
}

- (void)setAmcStats:(id)a3
{
  objc_storeStrong((id *)&self->_amcStats, a3);
}

- (NSDate)currQueryTime
{
  return self->_currQueryTime;
}

- (void)setCurrQueryTime:(id)a3
{
  objc_storeStrong((id *)&self->_currQueryTime, a3);
}

- (NSDate)lastQueryTime
{
  return self->_lastQueryTime;
}

- (void)setLastQueryTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastQueryTime, a3);
}

- (int)lastQueryCount
{
  return self->_lastQueryCount;
}

- (void)setLastQueryCount:(int)a3
{
  self->_lastQueryCount = a3;
}

- (int)currQueryCount
{
  return self->_currQueryCount;
}

- (void)setCurrQueryCount:(int)a3
{
  self->_currQueryCount = a3;
}

- (id)costElement
{
  return self->_costElement;
}

- (void)setCostElement:(id)a3
{
  objc_storeStrong(&self->_costElement, a3);
}

- (NSSet)energyScoringEntities
{
  return self->_energyScoringEntities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_energyScoringEntities, 0);
  objc_storeStrong(&self->_costElement, 0);
  objc_storeStrong((id *)&self->_lastQueryTime, 0);
  objc_storeStrong((id *)&self->_currQueryTime, 0);
  objc_storeStrong((id *)&self->_amcStats, 0);
  objc_storeStrong((id *)&self->_dcpSwapStats, 0);
  objc_storeStrong((id *)&self->_pmpCountersStats, 0);
  objc_storeStrong((id *)&self->_energyModelStats, 0);
  objc_storeStrong(&self->_metricCollectionCompletionHandler, 0);
  objc_storeStrong((id *)&self->_metricCollectionTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_metricCollectionRepeatingTimer, 0);
  objc_storeStrong((id *)&self->_monitorQueue, 0);
  objc_storeStrong((id *)&self->_entryKeyToEntryInfo, 0);
  objc_storeStrong((id *)&self->_entryKeysCollected, 0);
  objc_storeStrong((id *)&self->_entryKeysRequested, 0);
  objc_storeStrong((id *)&self->_entryKeysToCollect, 0);
  objc_storeStrong((id *)&self->_batteryGaugeConflictingProcessSpecificEntryKeys, 0);
  objc_storeStrong((id *)&self->_batteryGaugeConflictingSystemMetricEntryKeys, 0);
  objc_storeStrong((id *)&self->_processSpecificMetricEntryKeys, 0);
  objc_storeStrong((id *)&self->_systemMetricEntryKeys, 0);
  objc_storeStrong((id *)&self->_trackedProcesses, 0);
  objc_storeStrong((id *)&self->_cachedMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_metricMonitorService, 0);
}

void __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "startMonitoring called while already monitoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __83__PLPowerMetricMonitorService_startMonitoringWithConfigurationMode_updateInterval___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = 136315650;
  v5 = "-[PLPowerMetricMonitorService startMonitoringWithConfigurationMode:updateInterval:]_block_invoke";
  v6 = 2048;
  v7 = v2;
  v8 = 2048;
  v9 = v3;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "%s mode: %ld interval: %f", (uint8_t *)&v4, 0x20u);
}

void __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke_cold_1(id *a1, NSObject *a2)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*a1, "updateMode");
  v4[0] = 67109120;
  v4[1] = v3;
  _os_log_fault_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_FAULT, "Unexpected call of finishMonitoringAndSendMetrics in mode %d", (uint8_t *)v4, 8u);
  OUTLINED_FUNCTION_1();
}

void __61__PLPowerMetricMonitorService_finishMonitoringAndSendMetrics__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __54__PLPowerMetricMonitorService_allClientsDidDisconnect__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "collectMetricsOnDemand mode is not PPSMetricMonitorModeUpdateOnDemand", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "collectMetricsOnDemand called without start monitoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __53__PLPowerMetricMonitorService_collectMetricsOnDemand__block_invoke_198_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "collectMetricsOnDemand dispatch_semaphore_signal", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)collectMetricsOnSnapshotWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Timed out while trying to collect metrics", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "PPSMetricMonitorMode is not PPSMetricMonitorModeUpdateOnSnapshot", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "collectMetricsOnSnapshot called without start monitoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __65__PLPowerMetricMonitorService_collectMetricsOnSnapshotWithError___block_invoke_203_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "collectMetricsOnSnapshot dispatch_semaphore_signal", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_7_1(&dword_1DA9D6000, v0, v1, "%s monitoring %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Attempting to monitor multiple times", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12_1(&dword_1DA9D6000, a2, a3, "Received invalid PID: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __64__PLPowerMetricMonitorService_addMonitoredProcessWithPID_error___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_11_0(&dword_1DA9D6000, v0, v1, "%s PID: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addMonitoredProcessesWithPIDs:(_QWORD *)a3 error:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1DA9D6000, a4, OS_LOG_TYPE_ERROR, "Error while trying to addMonitoredProcessWithPID: %@", a1, 0xCu);

}

void __61__PLPowerMetricMonitorService_removeMonitoredProcessWithPID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12_1(&dword_1DA9D6000, a2, a3, "Not monitoring process %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

void __61__PLPowerMetricMonitorService_removeMonitoredProcessWithPID___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_11_0(&dword_1DA9D6000, v0, v1, "%s PID: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __52__PLPowerMetricMonitorService_changeUpdateInterval___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_1(&dword_1DA9D6000, a2, a3, "%s interval: %f", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_registerNotificationWithAgent:type:tableName:isProcessSpecific:canRequestWhileBatteryGaugeIsRunning:minRequestInterval:block:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Registering for updates from %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __157__PLPowerMetricMonitorService__registerNotificationWithAgent_type_tableName_isProcessSpecific_canRequestWhileBatteryGaugeIsRunning_minRequestInterval_block___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "ignoring callback from %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_collectMetricsWithTimeout:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Metric collection timed out due to a subsequent collectMetrics call", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_collectMetricsWithTimeout:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __76__PLPowerMetricMonitorService__collectMetricsWithTimeout_completionHandler___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1DA9D6000, a2, a3, "Metric collection timed out after %.2f seconds", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_agentDidUpdateWithEntryKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_7_1(&dword_1DA9D6000, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_parseEnergyModelOrPMPMetricsFromSample:withSampleDuration:sourceChannel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_3_3(&dword_1DA9D6000, v0, v1, "Parse failed. Invalid sample duration: %f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_parseSMCMetricsFromEntry:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "skipping system power calculation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_parseProcessMonitorMetricsFromEntry:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1DA9D6000, a1, a3, "%s: Not currently tracking a PID", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_parseProcessNetworkMetricsFromEntry:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1DA9D6000, a1, a3, "%s: Not currently tracking a PID", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_parseLocationMetricsFromEntry:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1DA9D6000, a1, a3, "%s: Not currently tracking a PID", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_parseLocationMetricsFromEntry:.cold.2()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_9_1();
  _os_log_error_impl(&dword_1DA9D6000, v0, OS_LOG_TYPE_ERROR, "%s: No matching bundleID found; entry=%@",
    (uint8_t *)v1,
    0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_parseApplicationMetricsFromEntry:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Not tracking pid %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_computeDisplayCostWithAvgRed:avgGreen:avgBlue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Display Cost=%f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_computeNetworkingCostWithWifiIn:wifiOut:cellIn:cellOut:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Network Cost=%f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_computeLocationCostWithWifiCost:gpsCost:cellCost:skyhookCost:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Location Cost=%f", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_computeGPUCostWithGPUSec:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7_1(&dword_1DA9D6000, a1, a3, "%s: GPU Cost=%f", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_startMetricCollectionTimerWithInterval:block:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_13_1(&dword_1DA9D6000, v0, v1, "Interval %f s is lower than minimum %f s; aborting",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

void __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "initial sample", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "diffing against %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1DA9D6000, v1, OS_LOG_TYPE_DEBUG, "sampling coalitions for %@ -> %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __48__PLPowerMetricMonitorService__sampleCoalitions__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_3(&dword_1DA9D6000, v0, v1, "failed to sample coalitions for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
