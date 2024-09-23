@implementation PLDiscretionaryEnergyMonitor

- (void)logPowerlogResponse:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BLMEnergyForDuet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &__block_literal_global_433);

  PLLogDiscretionaryEnergyMonitor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BLMEnergyResponseTimestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_19EA99000, v5, OS_LOG_TYPE_INFO, "EnergyResponseTimestamp: %@", (uint8_t *)&v9, 0xCu);

  }
  PLLogDiscretionaryEnergyMonitor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BLMUUIDForDuet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_19EA99000, v7, OS_LOG_TYPE_INFO, "UUIDForDuet: %@", (uint8_t *)&v9, 0xCu);

  }
}

void __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  int v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  PLLogDiscretionaryEnergyMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v32) = 0;
    _os_log_impl(&dword_19EA99000, v2, OS_LOG_TYPE_INFO, "Querying powerlog for discretionary energy", (uint8_t *)&v32, 2u);
  }

  if ((objc_msgSend(*(id *)(a1 + 32), "debugMode") & 1) != 0)
  {
    PLLogDiscretionaryEnergyMonitor();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_19EA99000, v3, OS_LOG_TYPE_INFO, "Not querying for powerlog response in debug mode, using lastPowerlogResponse instead", (uint8_t *)&v32, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "lastPowerlogResponse");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLQueryRegistered(24, CFSTR("BLMReportEnergyDuet"), 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  PLLogDiscretionaryEnergyMonitor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v32 = 138412290;
    v33 = v5;
    _os_log_impl(&dword_19EA99000, v6, OS_LOG_TYPE_INFO, "Powerlog response: %@", (uint8_t *)&v32, 0xCu);
  }

  if (!v5
    || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PermissionUnknown")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    PLLogDiscretionaryEnergyMonitor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke_cold_1();
    goto LABEL_32;
  }
  objc_msgSend(*(id *)(a1 + 32), "logPowerlogResponse:", v5);
  objc_msgSend(*(id *)(a1 + 32), "lastPowerlogResponse");
  v8 = objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "lastPowerlogResponse");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BLMEnergyResponseTimestamp"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPowerlogTimestampLast:", v9);

  objc_msgSend(*(id *)(a1 + 32), "getPowerlogEnergySum:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setPowerlogEnergyLast:");
  objc_msgSend(*(id *)(a1 + 32), "setLastPowerlogResponse:", v5);
  if (!v8)
    goto LABEL_29;
  -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("BLMEnergyResponseTimestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPowerlogTimestampPrevious:", v10);
  objc_msgSend(*(id *)(a1 + 32), "getPowerlogEnergySum:", v8);
  objc_msgSend(*(id *)(a1 + 32), "setPowerlogEnergyPrevious:");
  objc_msgSend(*(id *)(a1 + 32), "powerlogTimestampLast");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 1;
  if (v10)
  {
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "powerlogTimestampLast");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", v10);
      v15 = v14;

      if (v15 > 0.0)
      {
        objc_msgSend(*(id *)(a1 + 32), "powerlogEnergyLast");
        v17 = v16;
        objc_msgSend(*(id *)(a1 + 32), "powerlogEnergyPrevious");
        objc_msgSend(*(id *)(a1 + 32), "setPowerlogEnergyDiff:", v17 - v18);
        PLLogDiscretionaryEnergyMonitor();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "powerlogEnergyPrevious");
          v21 = v20;
          objc_msgSend(*(id *)(a1 + 32), "powerlogEnergyLast");
          v23 = v22;
          objc_msgSend(*(id *)(a1 + 32), "powerlogEnergyDiff");
          v25 = v24;
          objc_msgSend(*(id *)(a1 + 32), "powerlogTimestampPrevious");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "powerlogTimestampLast");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 134219010;
          v33 = v21;
          v34 = 2048;
          v35 = v23;
          v36 = 2048;
          v37 = v25;
          v38 = 2112;
          v39 = v26;
          v40 = 2112;
          v41 = v27;
          _os_log_impl(&dword_19EA99000, v19, OS_LOG_TYPE_DEFAULT, "New Powerlog Accounting Energy: previousPowerlogEnergySum=%f, lastPowerlogEnergySum=%f, powerlogEnergyDiff=%f from previousResponseTimestamp=%@ to lastResponseTimestamp=%@", (uint8_t *)&v32, 0x34u);

        }
        v12 = 0;
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "powerlogTimestampLast");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
  {

LABEL_29:
    PLLogDiscretionaryEnergyMonitor();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "generateEnergyReport");
    goto LABEL_32;
  }
  v29 = (void *)v28;
  objc_msgSend(*(id *)(a1 + 32), "powerlogTimestampPrevious");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
    v12 = 0;

  if ((v12 & 1) == 0)
    goto LABEL_29;
LABEL_32:

}

- (NSDate)powerlogTimestampLast
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (NSDictionary)lastPowerlogResponse
{
  return self->_lastPowerlogResponse;
}

- (double)getPowerlogEnergySum:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  _QWORD v9[5];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BLMEnergyForDuet"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v10 = 0;
    v11 = (double *)&v10;
    v12 = 0x2020000000;
    v13 = 0;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BLMEnergyForDuet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__PLDiscretionaryEnergyMonitor_getPowerlogEnergySum___block_invoke;
    v9[3] = &unk_1E4165F88;
    v9[4] = &v10;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
    v7 = v11[3];

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

void __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  PLQuickEnergySnapshot *v11;
  id *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  PLQuickEnergySnapshot *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  double v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  PLLogDiscretionaryEnergyMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_19EA99000, v2, OS_LOG_TYPE_INFO, "accumulating quick energy", (uint8_t *)&v27, 2u);
  }

  PLLogDiscretionaryEnergyMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "accumulatedCPUEnergy");
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 32), "accumulatedNetworkEnergy");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "accumulatedCPUEnergy");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "accumulatedNetworkEnergy");
    v27 = 134218496;
    v28 = v5;
    v29 = 2048;
    v30 = v7;
    v31 = 2048;
    v32 = v9 + v10;
    _os_log_impl(&dword_19EA99000, v3, OS_LOG_TYPE_DEFAULT, "Creating quick energy snapshot, cpuEnergyTotal=%f, networkEnergyTotal=%f, totalEnergy=%f", (uint8_t *)&v27, 0x20u);
  }

  v11 = [PLQuickEnergySnapshot alloc];
  v13 = *(void **)(a1 + 32);
  v12 = (id *)(a1 + 32);
  objc_msgSend(v13, "accumulatedCPUEnergy");
  v15 = v14;
  objc_msgSend(*v12, "accumulatedNetworkEnergy");
  v17 = -[PLQuickEnergySnapshot initWithEnergies:andNetworkEnergy:](v11, "initWithEnergies:andNetworkEnergy:", v15, v16);
  objc_msgSend(*v12, "quickEnergySnapshots");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  objc_msgSend(*v12, "quickEnergySnapshots");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
  {
    objc_msgSend(v20, "lastObject");
    v22 = objc_claimAutoreleasedReturnValue();

    -[PLQuickEnergySnapshot computeEnergyDiff:](v17, "computeEnergyDiff:", v22);
    if (v23 >= 1.0)
    {
      objc_msgSend(*v12, "quickEnergySnapshots");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v17);

      objc_msgSend(*v12, "generateEnergyReport");
      PLLogDiscretionaryEnergyMonitor();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*v12, "quickEnergySnapshots");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v26;
        _os_log_impl(&dword_19EA99000, v24, OS_LOG_TYPE_INFO, "quickEnergySnapshots=%@", (uint8_t *)&v27, 0xCu);

      }
    }
    else
    {
      PLLogDiscretionaryEnergyMonitor();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke_cold_2();
    }

  }
  else
  {
    objc_msgSend(v20, "addObject:", v17);

    PLLogDiscretionaryEnergyMonitor();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke_cold_1(v12, v22);
  }

}

- (NSMutableArray)quickEnergySnapshots
{
  return self->_quickEnergySnapshots;
}

- (double)accumulatedNetworkEnergy
{
  return self->_accumulatedNetworkEnergy;
}

- (double)accumulatedCPUEnergy
{
  return self->_accumulatedCPUEnergy;
}

uint64_t __65__PLDiscretionaryEnergyMonitor_createQuickEnergyAccumulatorTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accumulateQuickEnergy");
}

uint64_t __56__PLDiscretionaryEnergyMonitor_createPowerlogQueryTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queryPowerlogForDiscretionaryEnergy");
}

- (void)setPowerlogTimestampPrevious:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void)setPowerlogTimestampLast:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void)setPowerlogEnergyPrevious:(double)a3
{
  self->_powerlogEnergyPrevious = a3;
}

- (void)setPowerlogEnergyLast:(double)a3
{
  self->_powerlogEnergyLast = a3;
}

- (void)setLastPowerlogResponse:(id)a3
{
  objc_storeStrong((id *)&self->_lastPowerlogResponse, a3);
}

- (void)queryPowerlogForDiscretionaryEnergy
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke;
  block[3] = &unk_1E4165E90;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (NSDate)powerlogTimestampPrevious
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)debugMode
{
  return self->_debugMode;
}

- (void)accumulateQuickEnergy
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke;
  block[3] = &unk_1E4165E90;
  block[4] = self;
  dispatch_async(workQueue, block);
}

+ (double)getDiscretionaryEnergyBudget
{
  double result;

  +[PLModelingUtilities duetDiscretionaryBudget](PLModelingUtilities, "duetDiscretionaryBudget");
  return result;
}

- (PLDiscretionaryEnergyMonitor)initWithCompletionBlock:(id)a3
{
  id v4;
  PLDiscretionaryEnergyMonitor *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v9[16];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLDiscretionaryEnergyMonitor;
  v5 = -[PLDiscretionaryEnergyMonitor init](&v10, sel_init);
  if (v5)
  {
    PLLogDiscretionaryEnergyMonitor();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19EA99000, v6, OS_LOG_TYPE_DEFAULT, "Initializing PLDiscretionaryEnergyMonitor...", v9, 2u);
    }

    v5 = -[PLDiscretionaryEnergyMonitor initWithDebugMode:andMockData:andCompletionBlock:](v5, "initWithDebugMode:andMockData:andCompletionBlock:", 0, 0, v4);
    PLLogDiscretionaryEnergyMonitor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_19EA99000, v7, OS_LOG_TYPE_DEFAULT, "Finished initializing PLDiscretionaryEnergyMonitor...", v9, 2u);
    }

  }
  return v5;
}

- (PLDiscretionaryEnergyMonitor)initWithDebugMode:(BOOL)a3 andMockData:(id)a4 andCompletionBlock:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  PLDiscretionaryEnergyMonitor *v10;
  PLDiscretionaryEnergyMonitor *v11;
  void *v12;
  _BOOL8 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PLDiscretionaryIntervalManager *v21;
  void *v22;
  PLDiscretionaryIntervalManager *v23;
  objc_super v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v6 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)PLDiscretionaryEnergyMonitor;
  v10 = -[PLDiscretionaryEnergyMonitor init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    -[PLDiscretionaryEnergyMonitor setCompletionBlock:](v10, "setCompletionBlock:", v9);
    discretionaryEnergyMonitorQueue();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryEnergyMonitor setWorkQueue:](v11, "setWorkQueue:", v12);

    -[PLDiscretionaryEnergyMonitor setMockData:](v11, "setMockData:", 0);
    v13 = v6 && +[PLModelingUtilities internalBuild](PLModelingUtilities, "internalBuild");
    -[PLDiscretionaryEnergyMonitor setDebugMode:](v11, "setDebugMode:", v13);
    if (-[PLDiscretionaryEnergyMonitor debugMode](v11, "debugMode"))
    {
      PLLogDiscretionaryEnergyMonitor();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v8;
        _os_log_impl(&dword_19EA99000, v14, OS_LOG_TYPE_INFO, "Initializing in debug mode with mockData=%@", buf, 0xCu);
      }

      if (v8)
      {
        v15 = (void *)objc_msgSend(v8, "mutableCopy");
        -[PLDiscretionaryEnergyMonitor setMockData:](v11, "setMockData:", v15);

        -[PLDiscretionaryEnergyMonitor mockData](v11, "mockData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("LastPowerlogResponseMock"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDiscretionaryEnergyMonitor setLastPowerlogResponse:](v11, "setLastPowerlogResponse:", v17);

      }
    }
    else if (+[PLModelingUtilities internalBuild](PLModelingUtilities, "internalBuild"))
    {
      -[PLDiscretionaryEnergyMonitor setupNotificationListeners](v11, "setupNotificationListeners");
    }
    -[PLDiscretionaryEnergyMonitor setAccumulatedCPUEnergy:](v11, "setAccumulatedCPUEnergy:", 0.0);
    -[PLDiscretionaryEnergyMonitor setAccumulatedNetworkEnergy:](v11, "setAccumulatedNetworkEnergy:", 0.0);
    -[PLDiscretionaryEnergyMonitor setLastReportedTotalEnergy:](v11, "setLastReportedTotalEnergy:", 0.0);
    -[PLDiscretionaryEnergyMonitor setPowerlogEnergyLast:](v11, "setPowerlogEnergyLast:", 0.0);
    -[PLDiscretionaryEnergyMonitor setPowerlogEnergyPrevious:](v11, "setPowerlogEnergyPrevious:", 0.0);
    -[PLDiscretionaryEnergyMonitor createPowerlogQueryTimer](v11, "createPowerlogQueryTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryEnergyMonitor setPowerlogQueryTimer:](v11, "setPowerlogQueryTimer:", v18);

    -[PLDiscretionaryEnergyMonitor createQuickEnergyAccumulatorTimer](v11, "createQuickEnergyAccumulatorTimer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryEnergyMonitor setQuickEnergyAccumulatorTimer:](v11, "setQuickEnergyAccumulatorTimer:", v19);

    v20 = (void *)objc_opt_new();
    -[PLDiscretionaryEnergyMonitor setQuickEnergySnapshots:](v11, "setQuickEnergySnapshots:", v20);

    -[PLDiscretionaryEnergyMonitor queryPowerlogForDiscretionaryEnergy](v11, "queryPowerlogForDiscretionaryEnergy");
    -[PLDiscretionaryEnergyMonitor accumulateQuickEnergy](v11, "accumulateQuickEnergy");
    -[PLDiscretionaryEnergyMonitor setIsCharging:](v11, "setIsCharging:", 0);
    v21 = [PLDiscretionaryIntervalManager alloc];
    -[PLDiscretionaryEnergyMonitor mockData](v11, "mockData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PLDiscretionaryIntervalManager initWithEnergyMonitor:andMockData:](v21, "initWithEnergyMonitor:andMockData:", v11, v22);
    -[PLDiscretionaryEnergyMonitor setIntervalManager:](v11, "setIntervalManager:", v23);

  }
  return v11;
}

- (void)reportStartEvent:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  PLLogDiscretionaryEnergyMonitor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PLDiscretionaryEnergyMonitor reportStartEvent:withInfo:].cold.1();

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PLDiscretionaryEnergyMonitor_reportStartEvent_withInfo___block_invoke;
  block[3] = &unk_1E4165F38;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(workQueue, block);

}

void __58__PLDiscretionaryEnergyMonitor_reportStartEvent_withInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "intervalManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleStartEvent:withInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)reportStopEvent:(id)a3 withInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *workQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  PLLogDiscretionaryEnergyMonitor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PLDiscretionaryEnergyMonitor reportStopEvent:withInfo:].cold.1();

  v9 = dispatch_time(0, 1000000000);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__PLDiscretionaryEnergyMonitor_reportStopEvent_withInfo___block_invoke;
  block[3] = &unk_1E4165F38;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_after(v9, workQueue, block);

}

void __57__PLDiscretionaryEnergyMonitor_reportStopEvent_withInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "intervalManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleStopEvent:withInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)generateEnergyReport
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "cumulativePowerlogEnergy=%f", v2);
  OUTLINED_FUNCTION_1();
}

void __52__PLDiscretionaryEnergyMonitor_generateEnergyReport__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;

  v7 = a2;
  PLLogDiscretionaryEnergyMonitor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __52__PLDiscretionaryEnergyMonitor_generateEnergyReport__block_invoke_cold_1(a1, v7, v8);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v7, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11;

  if (v12 <= 60.0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }

}

- (void)runCompletionBlockWithEnergyResponse:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[PLDiscretionaryEnergyMonitor completionBlock](self, "completionBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLDiscretionaryEnergyMonitor completionBlock](self, "completionBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)createPowerlogQueryTimer
{
  NSObject *v3;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD handler[5];

  dispatch_get_global_queue(-32768, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);

  v5 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v4, v5, 0x8BB2C97000uLL, 0x165A0BC00uLL);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __56__PLDiscretionaryEnergyMonitor_createPowerlogQueryTimer__block_invoke;
  handler[3] = &unk_1E4165E90;
  handler[4] = self;
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(v4);
  return v4;
}

- (id)createQuickEnergyAccumulatorTimer
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  _QWORD handler[5];

  PLLogDiscretionaryEnergyMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PLDiscretionaryEnergyMonitor createQuickEnergyAccumulatorTimer].cold.1();

  dispatch_get_global_queue(-32768, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);

  v6 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v5, v6, 0xDF8475800uLL, 0x165A0BC00uLL);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __65__PLDiscretionaryEnergyMonitor_createQuickEnergyAccumulatorTimer__block_invoke;
  handler[3] = &unk_1E4165E90;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  return v5;
}

void __53__PLDiscretionaryEnergyMonitor_getPowerlogEnergySum___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("energy"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);

}

- (void)reportChargingStatus:(BOOL)a3
{
  NSObject *workQueue;
  _QWORD v4[5];
  BOOL v5;

  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke;
  v4[3] = &unk_1E4165FB0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(workQueue, v4);
}

uint64_t __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLLogDiscretionaryEnergyMonitor();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isCharging"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19EA99000, v2, OS_LOG_TYPE_DEFAULT, "Setting chargingStatus from isCharging=%@ to isCharging=%@", (uint8_t *)&v12, 0x16u);

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isCharging") & 1) == 0 && *(_BYTE *)(a1 + 40))
  {
    PLLogDiscretionaryEnergyMonitor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "intervalManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleOpenIntervalTimer");

    objc_msgSend(*(id *)(a1 + 32), "intervalManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disableQuickEnergy");

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isCharging") && !*(_BYTE *)(a1 + 40))
  {
    PLLogDiscretionaryEnergyMonitor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "intervalManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleOpenIntervalTimer");

    objc_msgSend(*(id *)(a1 + 32), "intervalManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enableQuickEnergy");

  }
  return objc_msgSend(*(id *)(a1 + 32), "setIsCharging:", *(unsigned __int8 *)(a1 + 40));
}

- (void)incrementCPUEnergy:(double)a3
{
  NSObject *workQueue;
  _QWORD v4[6];

  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke;
  v4[3] = &unk_1E4165FD8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(workQueue, v4);
}

void __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  double v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCharging");
  PLLogDiscretionaryEnergyMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
      __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_1();

  }
  else
  {
    if (v4)
      __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_2(a1, v3, v5);

    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "accumulatedCPUEnergy");
    objc_msgSend(v6, "setAccumulatedCPUEnergy:", v7 + *(double *)(a1 + 40));
  }
}

- (void)incrementNetworkEnergy:(double)a3
{
  NSObject *workQueue;
  _QWORD v4[6];

  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__PLDiscretionaryEnergyMonitor_incrementNetworkEnergy___block_invoke;
  v4[3] = &unk_1E4165FD8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(workQueue, v4);
}

void __55__PLDiscretionaryEnergyMonitor_incrementNetworkEnergy___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  double v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCharging");
  PLLogDiscretionaryEnergyMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
      __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_1();

  }
  else
  {
    if (v4)
      __55__PLDiscretionaryEnergyMonitor_incrementNetworkEnergy___block_invoke_cold_2(a1, v3, v5);

    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "accumulatedNetworkEnergy");
    objc_msgSend(v6, "setAccumulatedNetworkEnergy:", v7 + *(double *)(a1 + 40));
  }
}

- (void)testHighVolumeStartStopReporting:(id)a3 withInfo:(id)a4 withNumIterations:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  double v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  PLLogDiscretionaryEnergyMonitor();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412802;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2048;
    v18 = a5;
    _os_log_impl(&dword_19EA99000, v10, OS_LOG_TYPE_DEFAULT, "Testing high volume start/stops for activityName=%@, withInfo=%@ for %f iterations", (uint8_t *)&v13, 0x20u);
  }

  if (a5 > 0.0)
  {
    v11 = 1;
    do
    {
      -[PLDiscretionaryEnergyMonitor reportStartEvent:withInfo:](self, "reportStartEvent:withInfo:", v8, v9);
      -[PLDiscretionaryEnergyMonitor reportStopEvent:withInfo:](self, "reportStopEvent:withInfo:", v8, v9);
      v12 = (double)v11++;
    }
    while (v12 < a5);
  }

}

- (void)setupNotificationListeners
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  __CFNotificationCenter *v7;
  __CFNotificationCenter *v8;
  __CFNotificationCenter *v9;
  __CFNotificationCenter *v10;
  __CFNotificationCenter *v11;
  __CFNotificationCenter *v12;
  __CFNotificationCenter *v13;
  __CFNotificationCenter *v14;
  __CFNotificationCenter *v15;
  uint8_t v16[16];

  PLLogDiscretionaryEnergyMonitor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_19EA99000, v3, OS_LOG_TYPE_DEFAULT, "Setting up debug listeners", v16, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)didReceiveNotification, CFSTR("com.apple.energybudgetingdebug.quickEnergySnapshots"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)didReceiveNotification, CFSTR("com.apple.energybudgetingdebug.queryPowerlog"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)didReceiveNotification, CFSTR("com.apple.energybudgetingdebug.generateEnergyReport"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v7, self, (CFNotificationCallback)didReceiveNotification, CFSTR("com.apple.energybudgetingdebug.discretionaryIntervals"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v8, self, (CFNotificationCallback)didReceiveNotification, CFSTR("com.apple.energybudgetingdebug.lastPowerlogEnergy"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, self, (CFNotificationCallback)didReceiveNotification, CFSTR("com.apple.energybudgetingdebug.lastPowerlogTimestamp"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v10, self, (CFNotificationCallback)didReceiveNotification, CFSTR("com.apple.energybudgetingdebug.chargingStatus"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v11 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v11, self, (CFNotificationCallback)didReceiveNotification, CFSTR("com.apple.energybudgetingdebug.lastReportedTotalEnergy"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v12 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v12, self, (CFNotificationCallback)didReceiveNotification, CFSTR("com.apple.energybudgetingdebug.lastReportedCPUEnergy"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v13 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v13, self, (CFNotificationCallback)didReceiveNotification, CFSTR("com.apple.energybudgetingdebug.lastReportedNetworkEnergy"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v14 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v14, self, (CFNotificationCallback)didReceiveNotification, CFSTR("com.apple.energybudgetingdebug.accumulatedCPUEnergy"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v15 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v15, self, (CFNotificationCallback)didReceiveNotification, CFSTR("com.apple.energybudgetingdebug.accumulatedNetworkEnergy"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)setStateForNotification:(id)a3 withState:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
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
  uint64_t v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PLLogDiscretionaryEnergyMonitor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v26 = 138412546;
    v27 = v6;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_19EA99000, v7, OS_LOG_TYPE_INFO, "Setting state=%@ for notificationName=%@", (uint8_t *)&v26, 0x16u);
  }

  v26 = 0;
  v8 = objc_retainAutorelease(v5);
  v9 = notify_register_check((const char *)objc_msgSend(v8, "UTF8String"), &v26);
  if ((_DWORD)v9)
  {
    v10 = v9;
    PLLogDiscretionaryEnergyMonitor();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PLDiscretionaryEnergyMonitor setStateForNotification:withState:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_9:

    goto LABEL_10;
  }
  v18 = notify_set_state(v26, objc_msgSend(v6, "unsignedLongLongValue"));
  if ((_DWORD)v18)
  {
    v19 = v18;
    PLLogDiscretionaryEnergyMonitor();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PLDiscretionaryEnergyMonitor setStateForNotification:withState:].cold.1(v19, v11, v20, v21, v22, v23, v24, v25);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)updateMockData:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PLDiscretionaryEnergyMonitor debugMode](self, "debugMode");
  PLLogDiscretionaryEnergyMonitor();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_19EA99000, v7, OS_LOG_TYPE_INFO, "Updating to mockData=%@", (uint8_t *)&v14, 0xCu);
    }

    v7 = objc_msgSend(v4, "mutableCopy");
    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("LastPowerlogResponseMock"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryEnergyMonitor mockData](self, "mockData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("LastPowerlogResponseMock"));

    -[PLDiscretionaryEnergyMonitor mockData](self, "mockData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LastPowerlogResponseMock"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryEnergyMonitor setLastPowerlogResponse:](self, "setLastPowerlogResponse:", v11);

    -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("CPUCoalitionsMock"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryEnergyMonitor mockData](self, "mockData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("CPUCoalitionsMock"));

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[PLDiscretionaryEnergyMonitor updateMockData:].cold.1();
  }

}

void __52__PLDiscretionaryEnergyMonitor_logPowerlogResponse___block_invoke(uint64_t a1, void *a2)
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

- (void)logQuickEnergySnapshots
{
  id v2;

  -[PLDiscretionaryEnergyMonitor quickEnergySnapshots](self, "quickEnergySnapshots");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_436);

}

void __55__PLDiscretionaryEnergyMonitor_logQuickEnergySnapshots__block_invoke(uint64_t a1, void *a2)
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

- (void)logEnergyReport:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  PLLogDiscretionaryEnergyMonitor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PLDiscretionaryEnergyMonitor logEnergyReport:].cold.1();

  PLLogRegisteredEvent(70, CFSTR("DASEnergyReport"), v3);
}

- (PLDiscretionaryIntervalManager)intervalManager
{
  return (PLDiscretionaryIntervalManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIntervalManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)lastReportedTotalEnergy
{
  return self->_lastReportedTotalEnergy;
}

- (void)setLastReportedTotalEnergy:(double)a3
{
  self->_lastReportedTotalEnergy = a3;
}

- (double)lastReportedCPUEnergy
{
  return self->_lastReportedCPUEnergy;
}

- (void)setLastReportedCPUEnergy:(double)a3
{
  self->_lastReportedCPUEnergy = a3;
}

- (double)lastReportedNetworkEnergy
{
  return self->_lastReportedNetworkEnergy;
}

- (void)setLastReportedNetworkEnergy:(double)a3
{
  self->_lastReportedNetworkEnergy = a3;
}

- (void)setQuickEnergySnapshots:(id)a3
{
  objc_storeStrong((id *)&self->_quickEnergySnapshots, a3);
}

- (OS_dispatch_source)powerlogQueryTimer
{
  return self->_powerlogQueryTimer;
}

- (void)setPowerlogQueryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_powerlogQueryTimer, a3);
}

- (OS_dispatch_source)quickEnergyAccumulatorTimer
{
  return self->_quickEnergyAccumulatorTimer;
}

- (void)setQuickEnergyAccumulatorTimer:(id)a3
{
  objc_storeStrong((id *)&self->_quickEnergyAccumulatorTimer, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void)setAccumulatedCPUEnergy:(double)a3
{
  self->_accumulatedCPUEnergy = a3;
}

- (void)setAccumulatedNetworkEnergy:(double)a3
{
  self->_accumulatedNetworkEnergy = a3;
}

- (double)powerlogEnergyDiff
{
  return self->_powerlogEnergyDiff;
}

- (void)setPowerlogEnergyDiff:(double)a3
{
  self->_powerlogEnergyDiff = a3;
}

- (double)powerlogEnergyPrevious
{
  return self->_powerlogEnergyPrevious;
}

- (double)powerlogEnergyLast
{
  return self->_powerlogEnergyLast;
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (void)setIsCharging:(BOOL)a3
{
  self->_isCharging = a3;
}

- (void)setDebugMode:(BOOL)a3
{
  self->_debugMode = a3;
}

- (NSMutableDictionary)mockData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setMockData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockData, 0);
  objc_storeStrong((id *)&self->_powerlogTimestampLast, 0);
  objc_storeStrong((id *)&self->_powerlogTimestampPrevious, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_quickEnergyAccumulatorTimer, 0);
  objc_storeStrong((id *)&self->_powerlogQueryTimer, 0);
  objc_storeStrong((id *)&self->_quickEnergySnapshots, 0);
  objc_storeStrong((id *)&self->_lastPowerlogResponse, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_intervalManager, 0);
}

- (void)reportStartEvent:withInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EA99000, v0, v1, "Reporting startEvent activityName=%@, info=%@ from energyMonitor");
  OUTLINED_FUNCTION_1();
}

- (void)reportStopEvent:withInfo:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_19EA99000, v0, v1, "Reporting stopEvent activityName=%@, info=%@ from energyMonitor");
  OUTLINED_FUNCTION_1();
}

void __52__PLDiscretionaryEnergyMonitor_generateEnergyReport__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  objc_msgSend(a2, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v5);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0(&dword_19EA99000, a3, v6, "timedifferential=%f", v7);

  OUTLINED_FUNCTION_11();
}

void __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_19EA99000, v0, v1, "No valid response from powerlog, response=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "generating energy report after querying powerlog", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)createQuickEnergyAccumulatorTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "Creating quickEnergyAccumulator timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "quickEnergySnapshots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, a2, v4, "after enqueuing first quickEnergy snapshot, quickEnergySnapshots=%@", v5);

  OUTLINED_FUNCTION_8();
}

void __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "energyDiff=%f not sufficient to enqueue new quick energy snapshot", v2);
  OUTLINED_FUNCTION_1();
}

void __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "Firing open interval timer when switching charging state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "quick energy accumulation disabled while charging", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_19EA99000, a2, a3, "incrementing cpu energy by energy=%f", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __55__PLDiscretionaryEnergyMonitor_incrementNetworkEnergy___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_19EA99000, a2, a3, "incrementing network energy by energy=%f", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)setStateForNotification:(uint64_t)a3 withState:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_19EA99000, a2, a3, "notify_set_state failed %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)setStateForNotification:(uint64_t)a3 withState:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_14(&dword_19EA99000, a2, a3, "notify_register_check failed %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)updateMockData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_19EA99000, v0, v1, "Cannot update mock data unless in debug mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)logEnergyReport:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_19EA99000, v0, v1, "Logging energy report to powerlog ... logEvent=%@", v2);
  OUTLINED_FUNCTION_1();
}

@end
