@implementation PLDiscretionaryIntervalManager

- (void)handleOpenIntervalTimer
{
  NSObject *v3;
  _QWORD block[5];

  discretionaryEnergyMonitorQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke;
  block[3] = &unk_1E4165E90;
  block[4] = self;
  dispatch_async(v3, block);

}

void __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];

  PLLogDiscretionaryEnergyMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "identifierToDiscretionaryIntervals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke_312;
  v4[3] = &unk_1E4165E68;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

- (void)reportIntervalsToPowerlog
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifierToDiscretionaryIntervals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, a2, v4, "After persisting open intervals, identifierToDiscretionaryIntervals=%@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)logDiscretionaryIntervals
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLLogDiscretionaryEnergyMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PLDiscretionaryIntervalManager identifierToDiscretionaryIntervals](self, "identifierToDiscretionaryIntervals");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134217984;
    v7 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_19EA99000, v3, OS_LOG_TYPE_DEFAULT, "Logging identifierToDiscretionaryIntervals, count=%lu", (uint8_t *)&v6, 0xCu);

  }
  -[PLDiscretionaryIntervalManager identifierToDiscretionaryIntervals](self, "identifierToDiscretionaryIntervals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_315);

}

- (NSMutableDictionary)identifierToDiscretionaryIntervals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

uint64_t __59__PLDiscretionaryIntervalManager_handlePowerlogReportTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;

  PLLogDiscretionaryEnergyMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __59__PLDiscretionaryIntervalManager_handlePowerlogReportTimer__block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "reportIntervalsToPowerlog");
}

uint64_t __59__PLDiscretionaryIntervalManager_createPowerlogReportTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handlePowerlogReportTimer");
}

uint64_t __57__PLDiscretionaryIntervalManager_createOpenIntervalTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleOpenIntervalTimer");
}

- (void)setIdentifierToDiscretionaryIntervals:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)handlePowerlogReportTimer
{
  NSObject *v3;
  _QWORD block[5];

  discretionaryEnergyMonitorQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PLDiscretionaryIntervalManager_handlePowerlogReportTimer__block_invoke;
  block[3] = &unk_1E4165E90;
  block[4] = self;
  dispatch_async(v3, block);

}

- (PLDiscretionaryEnergyMonitor)discretionaryEnergyMonitor
{
  return (PLDiscretionaryEnergyMonitor *)objc_loadWeakRetained((id *)&self->_discretionaryEnergyMonitor);
}

- (PLDiscretionaryIntervalManager)initWithEnergyMonitor:(id)a3 andMockData:(id)a4
{
  id v6;
  id v7;
  PLDiscretionaryIntervalManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PLDiscretionaryIntervalManager;
  v8 = -[PLDiscretionaryIntervalManager init](&v16, sel_init);
  if (v8)
  {
    PLLogDiscretionaryEnergyMonitor();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_19EA99000, v9, OS_LOG_TYPE_DEFAULT, "Initializing DiscretionaryIntervalManager, with mockData=%@", buf, 0xCu);
    }

    -[PLDiscretionaryIntervalManager setMockData:](v8, "setMockData:", v7);
    v10 = (void *)objc_opt_new();
    -[PLDiscretionaryIntervalManager setIdentifierToDiscretionaryIntervals:](v8, "setIdentifierToDiscretionaryIntervals:", v10);

    v11 = (void *)objc_opt_new();
    -[PLDiscretionaryIntervalManager setActivityNameToInvolvedIdentifiers:](v8, "setActivityNameToInvolvedIdentifiers:", v11);

    -[PLDiscretionaryIntervalManager setDiscretionaryEnergyMonitor:](v8, "setDiscretionaryEnergyMonitor:", v6);
    -[PLDiscretionaryIntervalManager setQuickEnergyEnabled:](v8, "setQuickEnergyEnabled:", 1);
    -[PLDiscretionaryIntervalManager createOpenIntervalTimer](v8, "createOpenIntervalTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryIntervalManager setOpenIntervalTimer:](v8, "setOpenIntervalTimer:", v12);

    -[PLDiscretionaryIntervalManager createPowerlogReportTimer](v8, "createPowerlogReportTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryIntervalManager setPowerlogReportTimer:](v8, "setPowerlogReportTimer:", v13);

    PLLogDiscretionaryEnergyMonitor();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EA99000, v14, OS_LOG_TYPE_DEFAULT, "Finished initializing DiscretionaryIntervalManager", buf, 2u);
    }

  }
  return v8;
}

- (void)handleStartEvent:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;

  v6 = a3;
  v7 = a4;
  PLLogDiscretionaryEnergyMonitor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PLDiscretionaryIntervalManager handleStartEvent:withInfo:].cold.2();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("involvedIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDiscretionaryIntervalManager activityNameToInvolvedIdentifiers](self, "activityNameToInvolvedIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("involvedIdentifiers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("requiresNetwork"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v12, "BOOLValue");

  if ((_DWORD)v10)
  {
    v13 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v13, "addObject:", CFSTR("discretionaryNetworkTasks"));
    v11 = v13;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__PLDiscretionaryIntervalManager_handleStartEvent_withInfo___block_invoke;
  v16[3] = &unk_1E4165D88;
  v16[4] = self;
  v17 = v7;
  v14 = v7;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v16);
  PLLogDiscretionaryEnergyMonitor();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[PLDiscretionaryIntervalManager handleStartEvent:withInfo:].cold.1(self, v15);

}

void __60__PLDiscretionaryIntervalManager_handleStartEvent_withInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  PLDiscretionaryInterval *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  PLDiscretionaryInterval *v14;
  NSObject *v15;
  void *v16;
  double v17;
  double v18;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifierToDiscretionaryIntervals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifierToDiscretionaryIntervals");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v3);

  }
  if (objc_msgSend(v5, "count")
    && (objc_msgSend(v5, "lastObject"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isClosed"),
        v7,
        (v8 & 1) == 0))
  {
    PLLogDiscretionaryEnergyMonitor();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __60__PLDiscretionaryIntervalManager_handleStartEvent_withInfo___block_invoke_cold_2();

    objc_msgSend(v5, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "openCount");
    objc_msgSend(v16, "setOpenCount:", v17 + 1.0);

    objc_msgSend(v5, "lastObject");
    v14 = (PLDiscretionaryInterval *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryInterval startCount](v14, "startCount");
    -[PLDiscretionaryInterval setStartCount:](v14, "setStartCount:", v18 + 1.0);
  }
  else
  {
    PLLogDiscretionaryEnergyMonitor();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __60__PLDiscretionaryIntervalManager_handleStartEvent_withInfo___block_invoke_cold_1();

    v10 = [PLDiscretionaryInterval alloc];
    v11 = *(_QWORD *)(a1 + 40);
    v12 = objc_msgSend(*(id *)(a1 + 32), "quickEnergyEnabled");
    objc_msgSend(*(id *)(a1 + 32), "mockData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PLDiscretionaryInterval initWithIdentifier:andInfo:andSnapshottingEnabled:andMockData:](v10, "initWithIdentifier:andInfo:andSnapshottingEnabled:andMockData:", v3, v11, v12, v13);

    objc_msgSend(v5, "addObject:", v14);
  }

}

- (void)handleStopEvent:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _QWORD v20[5];

  v6 = a3;
  v7 = a4;
  PLLogDiscretionaryEnergyMonitor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PLDiscretionaryIntervalManager handleStopEvent:withInfo:].cold.4();

  -[PLDiscretionaryIntervalManager activityNameToInvolvedIdentifiers](self, "activityNameToInvolvedIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_msgSend(v7, "mutableCopy");
    PLLogDiscretionaryEnergyMonitor();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PLDiscretionaryIntervalManager handleStopEvent:withInfo:].cold.3(self, (uint64_t)v11, v12);

    -[PLDiscretionaryIntervalManager activityNameToInvolvedIdentifiers](self, "activityNameToInvolvedIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v14, CFSTR("involvedIdentifiers"));

    -[NSObject objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", CFSTR("involvedIdentifiers"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("requiresNetwork"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v18)
      objc_msgSend(v16, "addObject:", CFSTR("discretionaryNetworkTasks"));
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke;
    v20[3] = &unk_1E4165DD8;
    v20[4] = self;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v20);
    PLLogDiscretionaryEnergyMonitor();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[PLDiscretionaryIntervalManager handleStopEvent:withInfo:].cold.2(self, v19);

  }
  else
  {
    PLLogDiscretionaryEnergyMonitor();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PLDiscretionaryIntervalManager handleStopEvent:withInfo:].cold.1((uint64_t)v6, self, v11);
  }

}

void __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifierToDiscretionaryIntervals");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "lastObject");
    v6 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isClosed](v6, "isClosed"))
    {
      PLLogDiscretionaryEnergyMonitor();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_cold_2();
LABEL_15:

      goto LABEL_16;
    }
    -[NSObject openCount](v6, "openCount");
    -[NSObject setOpenCount:](v6, "setOpenCount:", v8 + -1.0);
    if (-[NSObject shouldClose](v6, "shouldClose"))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "quickEnergyEnabled"))
        objc_msgSend(*(id *)(a1 + 32), "reportQuickEnergyForInterval:withIdentifier:andAdjustSnapshotToNow:", v6, v3, 0);
      -[NSObject closeInterval](v6, "closeInterval");
      objc_msgSend(*(id *)(a1 + 32), "activityNameToInvolvedIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_294;
      v14[3] = &unk_1E4165DB0;
      v15 = v3;
      objc_msgSend(v9, "keysOfEntriesPassingTest:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(*(id *)(a1 + 32), "activityNameToInvolvedIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectsForKeys:", v12);

      }
      PLLogDiscretionaryEnergyMonitor();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_cold_3();

      v7 = v15;
      goto LABEL_15;
    }
  }
  else
  {
    PLLogDiscretionaryEnergyMonitor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_cold_1();
  }
LABEL_16:

}

uint64_t __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_294(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32));
}

void __59__PLDiscretionaryIntervalManager_reportIntervalsToPowerlog__block_invoke(id *a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  _QWORD v45[2];
  _QWORD v46[2];
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v36 = a2;
  v4 = a3;
  PLLogDiscretionaryEnergyMonitor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __59__PLDiscretionaryIntervalManager_reportIntervalsToPowerlog__block_invoke_cold_2();

  v6 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  v34 = v6;
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v13, "originalStartDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isClosed") & 1) == 0)
        {
          objc_msgSend(v13, "checkOpenIntervalDuration:", v36);
          v10 |= v16 > 600.0;
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v17 = (id)objc_claimAutoreleasedReturnValue();

          v47 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "mutableCopy");
          v6 = v34;
          objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v19, v36);

          v15 = v17;
        }
        v45[0] = CFSTR("startDate");
        v45[1] = CFSTR("endDate");
        v46[0] = v14;
        v46[1] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "mutableCopy");
        objc_msgSend(v6, "addObject:", v21);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    }
    while (v9);

    if ((v10 & 1) != 0)
      objc_msgSend(a1[5], "logActivityNameToInvolvedIdentifiers");
  }
  else
  {

  }
  if ((objc_msgSend(v36, "isEqualToString:", CFSTR("discretionaryNetworkTasks")) & 1) == 0)
  {
    PLLogDiscretionaryEnergyMonitor();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __59__PLDiscretionaryIntervalManager_reportIntervalsToPowerlog__block_invoke_cold_1();

    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", &unk_1E416C340, CFSTR("updateType"));
    v24 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(a1[5], "coalesceIntervals:", v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "arrayWithArray:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("eventIntervals"));

    v27 = v36;
    +[PLCPUEnergySnapshot identifierToAccountingName](PLCPUEnergySnapshot, "identifierToAccountingName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      +[PLCPUEnergySnapshot identifierToAccountingName](PLCPUEnergySnapshot, "identifierToAccountingName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogDiscretionaryEnergyMonitor();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v27;
        v43 = 2112;
        v44 = v31;
        _os_log_impl(&dword_19EA99000, v32, OS_LOG_TYPE_INFO, "Adjusting identifier=%@ to accountingName=%@ before reporting to powerlog", buf, 0x16u);
      }

    }
    else
    {
      v31 = v27;
    }
    v6 = v34;
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v31, CFSTR("bundleID"));
    v33 = (void *)objc_msgSend(v23, "mutableCopy");
    objc_msgSend(a1[6], "addObject:", v33);

  }
}

void __59__PLDiscretionaryIntervalManager_reportIntervalsToPowerlog__block_invoke_309(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLLogDiscretionaryEnergyMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19EA99000, v3, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)coalesceIntervals:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLLogDiscretionaryEnergyMonitor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PLDiscretionaryIntervalManager coalesceIntervals:].cold.2();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (v8)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("startDate"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("endDate"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "timeIntervalSinceDate:", v13);
          v15 = v14;

          v16 = -v15;
          if (v15 >= 0.0)
            v16 = v15;
          if (v16 >= 5.0)
          {
            objc_msgSend(v21, "addObject:", v8);
            v18 = v11;

            v8 = v18;
          }
          else
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("endDate"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("endDate"));

          }
        }
        else
        {
          v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "mutableCopy");
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);

    if (v8)
      objc_msgSend(v21, "addObject:", v8);
  }
  else
  {

    v8 = 0;
  }
  PLLogDiscretionaryEnergyMonitor();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[PLDiscretionaryIntervalManager coalesceIntervals:].cold.1();

  return v21;
}

- (void)reportQuickEnergyForInterval:(id)a3 withIdentifier:(id)a4 andAdjustSnapshotToNow:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  double v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v5 = a5;
  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  PLLogDiscretionaryEnergyMonitor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138412802;
    v33 = *(double *)&v8;
    v34 = 2112;
    v35 = v9;
    v36 = 2112;
    v37 = v31;
    _os_log_debug_impl(&dword_19EA99000, v10, OS_LOG_TYPE_DEBUG, "reporting quick energy for interval=%@, identifier=%@, adjustSnapshotToNow=%@", (uint8_t *)&v32, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentStartDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v12);
  v14 = v13;

  objc_msgSend(v8, "cpuEnergySnapshot");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v8, "cpuEnergySnapshot");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "computeEnergyDiffUntilNow:andAdjustSnapshotToNow:", v9, v5);
    v18 = v17;

    if (v18 > 0.0)
    {
      PLLogDiscretionaryEnergyMonitor();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "currentStartDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 134219010;
        v33 = v18;
        v34 = 2112;
        v35 = v9;
        v36 = 2048;
        v37 = v14;
        v38 = 2112;
        v39 = v20;
        v40 = 2112;
        v41 = v11;
        _os_log_impl(&dword_19EA99000, v19, OS_LOG_TYPE_DEFAULT, "Adding CPUEnergy=%f for identifier=%@ over %f seconds from startDate=%@ to endDate=%@", (uint8_t *)&v32, 0x34u);

      }
      -[PLDiscretionaryIntervalManager discretionaryEnergyMonitor](self, "discretionaryEnergyMonitor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "incrementCPUEnergy:", v18);

    }
  }
  objc_msgSend(v8, "networkEnergySnapshot");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    v24 = objc_msgSend(v9, "isEqualToString:", CFSTR("discretionaryNetworkTasks"));

    if (v24)
    {
      objc_msgSend(v8, "networkEnergySnapshot");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "computeEnergyDiffUntilNow:", v5);
      v27 = v26;

      if (v27 > 0.0)
      {
        PLLogDiscretionaryEnergyMonitor();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v8, "currentStartDate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 134219010;
          v33 = v27;
          v34 = 2112;
          v35 = v9;
          v36 = 2048;
          v37 = v14;
          v38 = 2112;
          v39 = v29;
          v40 = 2112;
          v41 = v11;
          _os_log_impl(&dword_19EA99000, v28, OS_LOG_TYPE_INFO, "Adding NetworkEnergy=%f for identifier=%@ over %f seconds from startDate=%@ to endDate=%@", (uint8_t *)&v32, 0x34u);

        }
        -[PLDiscretionaryIntervalManager discretionaryEnergyMonitor](self, "discretionaryEnergyMonitor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "incrementNetworkEnergy:", v27);

      }
    }
  }
  if (v5)
    objc_msgSend(v8, "setCurrentStartDate:", v11);

}

- (void)enableQuickEnergy
{
  -[PLDiscretionaryIntervalManager setQuickEnergyEnabled:](self, "setQuickEnergyEnabled:", 1);
}

- (void)disableQuickEnergy
{
  -[PLDiscretionaryIntervalManager setQuickEnergyEnabled:](self, "setQuickEnergyEnabled:", 0);
}

void __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke_312(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "isClosed");
  if ((v6 & 1) == 0 && objc_msgSend(*(id *)(a1 + 32), "quickEnergyEnabled"))
  {
    PLLogDiscretionaryEnergyMonitor();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke_312_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "reportQuickEnergyForInterval:withIdentifier:andAdjustSnapshotToNow:", v7, v5, 1);
  }

}

- (id)createOpenIntervalTimer
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD handler[5];

  PLLogDiscretionaryEnergyMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PLDiscretionaryIntervalManager createOpenIntervalTimer].cold.1();

  dispatch_get_global_queue(-32768, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);

  v6 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v5, v6, 0xDF8475800uLL, 0x165A0BC00uLL);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __57__PLDiscretionaryIntervalManager_createOpenIntervalTimer__block_invoke;
  handler[3] = &unk_1E4165E90;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  return v5;
}

- (id)createPowerlogReportTimer
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD handler[5];

  PLLogDiscretionaryEnergyMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PLDiscretionaryIntervalManager createPowerlogReportTimer].cold.1();

  dispatch_get_global_queue(-32768, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);

  v6 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v5, v6, 0x8BB2C97000uLL, 0x165A0BC00uLL);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __59__PLDiscretionaryIntervalManager_createPowerlogReportTimer__block_invoke;
  handler[3] = &unk_1E4165E90;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  return v5;
}

- (void)logActivityNameToInvolvedIdentifiers
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLLogDiscretionaryEnergyMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[PLDiscretionaryIntervalManager activityNameToInvolvedIdentifiers](self, "activityNameToInvolvedIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134217984;
    v7 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_19EA99000, v3, OS_LOG_TYPE_INFO, "Logging activityNameToInvolvedIdentifiers, count=%lu", (uint8_t *)&v6, 0xCu);

  }
  -[PLDiscretionaryIntervalManager activityNameToInvolvedIdentifiers](self, "activityNameToInvolvedIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_314);

}

void __70__PLDiscretionaryIntervalManager_logActivityNameToInvolvedIdentifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  PLLogDiscretionaryEnergyMonitor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_19EA99000, v6, OS_LOG_TYPE_INFO, "activityName=%@, involvedIdentifiers=%@", (uint8_t *)&v7, 0x16u);
  }

}

void __59__PLDiscretionaryIntervalManager_logDiscretionaryIntervals__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  PLLogDiscretionaryEnergyMonitor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v4;
    v27 = 2048;
    v28 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_19EA99000, v6, OS_LOG_TYPE_INFO, "identifier=%@, intervalCount=%lu", buf, 0x16u);
  }
  v19 = v4;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        PLLogDiscretionaryEnergyMonitor();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v11, "originalStartDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "currentStartDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "endDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "openCount");
          v17 = v16;
          objc_msgSend(v11, "startCount");
          *(_DWORD *)buf = 138413314;
          v26 = v13;
          v27 = 2112;
          v28 = (uint64_t)v14;
          v29 = 2112;
          v30 = v15;
          v31 = 2048;
          v32 = v17;
          v33 = 2048;
          v34 = v18;
          _os_log_impl(&dword_19EA99000, v12, OS_LOG_TYPE_INFO, "-> interval: originalStartDate=%@, currentStartDate=%@, endDate=%@, openCount=%f, startCount=%f", buf, 0x34u);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
    }
    while (v8);
  }

}

- (NSMutableDictionary)activityNameToInvolvedIdentifiers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActivityNameToInvolvedIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_source)openIntervalTimer
{
  return self->_openIntervalTimer;
}

- (void)setOpenIntervalTimer:(id)a3
{
  objc_storeStrong((id *)&self->_openIntervalTimer, a3);
}

- (OS_dispatch_source)powerlogReportTimer
{
  return self->_powerlogReportTimer;
}

- (void)setPowerlogReportTimer:(id)a3
{
  objc_storeStrong((id *)&self->_powerlogReportTimer, a3);
}

- (void)setDiscretionaryEnergyMonitor:(id)a3
{
  objc_storeWeak((id *)&self->_discretionaryEnergyMonitor, a3);
}

- (BOOL)quickEnergyEnabled
{
  return self->_quickEnergyEnabled;
}

- (void)setQuickEnergyEnabled:(BOOL)a3
{
  self->_quickEnergyEnabled = a3;
}

- (NSMutableDictionary)mockData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMockData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockData, 0);
  objc_destroyWeak((id *)&self->_discretionaryEnergyMonitor);
  objc_storeStrong((id *)&self->_powerlogReportTimer, 0);
  objc_storeStrong((id *)&self->_openIntervalTimer, 0);
  objc_storeStrong((id *)&self->_activityNameToInvolvedIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifierToDiscretionaryIntervals, 0);
}

- (void)handleStartEvent:(void *)a1 withInfo:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifierToDiscretionaryIntervals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, a2, v4, "after handleStartEvent, identifierToDiscretionaryIntervals=%@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)handleStartEvent:withInfo:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EA99000, v0, v1, "handling start event for activityName=%@ with info=%@");
  OUTLINED_FUNCTION_1();
}

void __60__PLDiscretionaryIntervalManager_handleStartEvent_withInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "Adding a new open interval for identifier=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __60__PLDiscretionaryIntervalManager_handleStartEvent_withInfo___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "There is already an open interval for identifier=%@, incrementing openCount", v2);
  OUTLINED_FUNCTION_1();
}

- (void)handleStopEvent:(NSObject *)a3 withInfo:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "activityNameToInvolvedIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_13(&dword_19EA99000, a3, v5, "Received stop event for activity with no involvedIdentifiers known for activityName=%@, activityNameToInvolvedIdentifiers=%@", v6);

  OUTLINED_FUNCTION_11();
}

- (void)handleStopEvent:(void *)a1 withInfo:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifierToDiscretionaryIntervals");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, a2, v4, "after handleStopEvent, identifierToDiscretionaryIntervals=%@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)handleStopEvent:(NSObject *)a3 withInfo:.cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "activityNameToInvolvedIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_6(&dword_19EA99000, a3, v6, "activityNameToInvolvedIdentifiers=%@, infoWithIdentifiers=%@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_11();
}

- (void)handleStopEvent:withInfo:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EA99000, v0, v1, "handling stop event for activityName=%@ with info=%@");
  OUTLINED_FUNCTION_1();
}

void __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_19EA99000, v0, v1, "There are 0 intervals for identifier=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_19EA99000, v0, v1, "No open intervals for identifier=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EA99000, v0, v1, "closed interval=%@ for identifier=%@");
  OUTLINED_FUNCTION_1();
}

void __59__PLDiscretionaryIntervalManager_reportIntervalsToPowerlog__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "intervalsPowerlogFormat=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __59__PLDiscretionaryIntervalManager_reportIntervalsToPowerlog__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EA99000, v0, v1, "Processing identifier=%@ and intervals=%@");
  OUTLINED_FUNCTION_1();
}

- (void)coalesceIntervals:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "After coalescing intervals, intervals=%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)coalesceIntervals:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "Coalescing intervals=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "handlingOpenIntervalTimer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke_312_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "reporting energy for openInterval=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __59__PLDiscretionaryIntervalManager_handlePowerlogReportTimer__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "handlingPowerlogReportTimer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)createOpenIntervalTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "Initializing open interval timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)createPowerlogReportTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "Initializing Powerlog report timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
