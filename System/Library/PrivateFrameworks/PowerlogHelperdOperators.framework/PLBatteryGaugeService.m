@implementation PLBatteryGaugeService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBatteryGaugeService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (BOOL)shouldCalculateDisplayCost
{
  if ((objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 0) & 1) != 0)
    return 1;
  else
    return objc_msgSend(MEMORY[0x1E0D80020], "hasCapability:", 8);
}

- (void)initResponseSemaphore
{
  PLSemaphore *v3;
  PLSemaphore *responseSemaphore;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D80030], "sharedSemaphoreForKey:", CFSTR("response"));
  v3 = (PLSemaphore *)objc_claimAutoreleasedReturnValue();
  responseSemaphore = self->_responseSemaphore;
  self->_responseSemaphore = v3;

  -[PLBatteryGaugeService responseSemaphore](self, "responseSemaphore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "signalInterestByObject:", self);

  -[PLBatteryGaugeService responseSemaphore](self, "responseSemaphore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "signalStartListening");

  -[PLBatteryGaugeService responseSemaphore](self, "responseSemaphore");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeout:", 0.2);

}

- (PLBatteryGaugeService)init
{
  PLBatteryGaugeService *v3;
  PLBatteryGaugeService *v4;
  void *v5;
  uint64_t v6;
  NSMutableDictionary *measurements;
  uint64_t v8;
  NSMutableDictionary *bundleIDandPidMap;
  uint64_t v10;
  NSMutableDictionary *entrykeyCallBackMapping;
  uint64_t v12;
  NSMutableDictionary *entrykeyCallBackOnceMapping;
  uint64_t v14;
  NSDate *lastQueryTime;
  uint64_t v16;
  NSDate *curQueryTime;
  id costElement;
  PLDTCostElement *v19;
  PLDTCostElement *networkingCostElement;
  uint64_t v21;
  NSMutableArray *trackedProcesses;
  uint64_t v23;
  NSMutableDictionary *results;
  uint64_t v25;
  NSMutableDictionary *reported;
  _BOOL4 v27;
  id v28;
  uint64_t v29;
  NSSet *scoringEntities;
  void *v31;
  uint64_t v32;
  NSMutableDictionary *responseTime;
  uint64_t v34;
  NSMutableDictionary *returnTime;
  uint64_t v36;
  NSMutableDictionary *requestTime;
  uint64_t v38;
  NSMutableDictionary *processMonitorResults;
  uint64_t v40;
  NSMutableDictionary *reportedProcessMonitor;
  uint64_t v42;
  NSMutableDictionary *processNetworkResults;
  uint64_t v44;
  NSMutableDictionary *reportedProcessNetwork;
  uint64_t v46;
  NSMutableDictionary *locationResults;
  uint64_t v48;
  NSMutableDictionary *reportedLocation;
  uint64_t v50;
  NSMutableDictionary *applicationResults;
  uint64_t v52;
  NSMutableDictionary *reportedApplication;
  uint64_t v54;
  NSTimer *thermalStateTimer;
  uint64_t v57;
  objc_super v58;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v58.receiver = self;
    v58.super_class = (Class)PLBatteryGaugeService;
    v4 = -[PLOperator init](&v58, sel_init);
    if (v4)
    {
      v5 = (void *)objc_opt_new();
      v6 = objc_opt_new();
      measurements = v4->_measurements;
      v4->_measurements = (NSMutableDictionary *)v6;

      v8 = objc_opt_new();
      bundleIDandPidMap = v4->_bundleIDandPidMap;
      v4->_bundleIDandPidMap = (NSMutableDictionary *)v8;

      v4->_startTime = 0.0;
      v4->_stopTime = 0.0;
      v10 = objc_opt_new();
      entrykeyCallBackMapping = v4->_entrykeyCallBackMapping;
      v4->_entrykeyCallBackMapping = (NSMutableDictionary *)v10;

      v12 = objc_opt_new();
      entrykeyCallBackOnceMapping = v4->_entrykeyCallBackOnceMapping;
      v4->_entrykeyCallBackOnceMapping = (NSMutableDictionary *)v12;

      v14 = objc_opt_new();
      lastQueryTime = v4->_lastQueryTime;
      v4->_lastQueryTime = (NSDate *)v14;

      v16 = objc_opt_new();
      curQueryTime = v4->_curQueryTime;
      v4->_curQueryTime = (NSDate *)v16;

      v4->_isTestingRunning = 0;
      costElement = v4->_costElement;
      v4->_costElement = 0;

      v4->_lastQueryCount = 0;
      v4->_curQueryCount = 0;
      v19 = -[PLDTCostElement initWithTime:]([PLDTCostElement alloc], "initWithTime:", v5);
      networkingCostElement = v4->_networkingCostElement;
      v4->_networkingCostElement = v19;

      v21 = objc_opt_new();
      trackedProcesses = v4->_trackedProcesses;
      v4->_trackedProcesses = (NSMutableArray *)v21;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v23 = objc_claimAutoreleasedReturnValue();
      results = v4->_results;
      v4->_results = (NSMutableDictionary *)v23;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v25 = objc_claimAutoreleasedReturnValue();
      reported = v4->_reported;
      v4->_reported = (NSMutableDictionary *)v25;

      v27 = +[PLBatteryGaugeService shouldCalculateDisplayCost](PLBatteryGaugeService, "shouldCalculateDisplayCost");
      v28 = objc_alloc(MEMORY[0x1E0C99E60]);
      if (v27)
        v29 = objc_msgSend(v28, "initWithObjects:", &unk_1EA1C09C8, &unk_1EA1C09E0, &unk_1EA1C09F8, &unk_1EA1C0A10, &unk_1EA1C0A28, &unk_1EA1C0A40, &unk_1EA1C0A58, &unk_1EA1C0A70, 0);
      else
        v29 = objc_msgSend(v28, "initWithObjects:", &unk_1EA1C09C8, &unk_1EA1C09E0, &unk_1EA1C09F8, &unk_1EA1C0A10, &unk_1EA1C0A28, &unk_1EA1C0A58, &unk_1EA1C0A70, 0, v57);
      scoringEntities = v4->_scoringEntities;
      v4->_scoringEntities = (NSSet *)v29;

      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v4, sel_selfExit_, 0, 1, 3600.0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v4->_exitTimer, v31);
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", objc_opt_class()))
      {
        v32 = objc_opt_new();
        responseTime = v4->_responseTime;
        v4->_responseTime = (NSMutableDictionary *)v32;

        v34 = objc_opt_new();
        returnTime = v4->_returnTime;
        v4->_returnTime = (NSMutableDictionary *)v34;

        v36 = objc_opt_new();
        requestTime = v4->_requestTime;
        v4->_requestTime = (NSMutableDictionary *)v36;

        v38 = objc_opt_new();
        processMonitorResults = v4->_processMonitorResults;
        v4->_processMonitorResults = (NSMutableDictionary *)v38;

        v40 = objc_opt_new();
        reportedProcessMonitor = v4->_reportedProcessMonitor;
        v4->_reportedProcessMonitor = (NSMutableDictionary *)v40;

        v42 = objc_opt_new();
        processNetworkResults = v4->_processNetworkResults;
        v4->_processNetworkResults = (NSMutableDictionary *)v42;

        v44 = objc_opt_new();
        reportedProcessNetwork = v4->_reportedProcessNetwork;
        v4->_reportedProcessNetwork = (NSMutableDictionary *)v44;

        v46 = objc_opt_new();
        locationResults = v4->_locationResults;
        v4->_locationResults = (NSMutableDictionary *)v46;

        v48 = objc_opt_new();
        reportedLocation = v4->_reportedLocation;
        v4->_reportedLocation = (NSMutableDictionary *)v48;

        v50 = objc_opt_new();
        applicationResults = v4->_applicationResults;
        v4->_applicationResults = (NSMutableDictionary *)v50;

        v52 = objc_opt_new();
        reportedApplication = v4->_reportedApplication;
        v4->_reportedApplication = (NSMutableDictionary *)v52;

      }
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v4, sel_parseThermalStateCallback_, 0, 1, 1.0);
      v54 = objc_claimAutoreleasedReturnValue();
      thermalStateTimer = v4->_thermalStateTimer;
      v4->_thermalStateTimer = (NSTimer *)v54;

    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)resetExitTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_11_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: reset exit timer!", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)selfExit:(id)a3
{
  NSObject *v3;
  void *v4;

  PLLogBatteryGaugeService();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService selfExit:].cold.1();

  objc_msgSend(MEMORY[0x1E0D7FFE0], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signalServiceInactive:", 1);

}

- (void)initOperatorDependancies
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  void *v6;
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
  void *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[16];

  PLLogBatteryGaugeService();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v3, OS_LOG_TYPE_INFO, "Initializing Battery Gauge Service...", buf, 2u);
  }

  v4 = objc_alloc(MEMORY[0x1E0D80098]);
  v5 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke;
  v26[3] = &unk_1EA16D1A8;
  v26[4] = self;
  v19 = (void *)objc_msgSend(v4, "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D85F8, v26);
  -[PLBatteryGaugeService setXpcResponderBatteryGaugeDT:](self, "setXpcResponderBatteryGaugeDT:");
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_51;
  v25[3] = &unk_1EA16D158;
  v25[4] = self;
  v6 = (void *)MEMORY[0x1DF0A4968](v25);
  +[PLOperator className](PLProcessMonitorAgent, "className");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D80380];
  -[PLBatteryGaugeService registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:](self, "registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:", v7, *MEMORY[0x1E0D80380], CFSTR("ProcessMonitorInterval"), 0, v6);

  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_2;
  v24[3] = &unk_1EA16D158;
  v24[4] = self;
  v9 = (void *)MEMORY[0x1DF0A4968](v24);
  +[PLOperator className](PLProcessNetworkAgent, "className");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryGaugeService registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:](self, "registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:", v10, v8, CFSTR("UsageDiff"), 0, v9);

  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_3;
  v23[3] = &unk_1EA16D158;
  v23[4] = self;
  v11 = (void *)MEMORY[0x1DF0A4968](v23);
  +[PLOperator className](PLLocationAgent, "className");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryGaugeService registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:](self, "registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:", v12, *MEMORY[0x1E0D80390], CFSTR("ClientStatus"), 0, v11);

  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_4;
  v22[3] = &unk_1EA16D158;
  v22[4] = self;
  v13 = (void *)MEMORY[0x1DF0A4968](v22);
  +[PLOperator className](PLApplicationAgent, "className");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryGaugeService registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:](self, "registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:", v14, *MEMORY[0x1E0D80378], CFSTR("Application"), 1, v13);

  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_5;
  v21[3] = &unk_1EA16D158;
  v21[4] = self;
  v15 = (void *)MEMORY[0x1DF0A4968](v21);
  +[PLOperator className](PLCoalitionAgent, "className");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryGaugeService registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:](self, "registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:", v16, v8, CFSTR("CoalitionInterval"), 0, v15);

  if (+[PLBatteryGaugeService shouldCalculateDisplayCost](PLBatteryGaugeService, "shouldCalculateDisplayCost"))
  {
    v20[0] = v5;
    v20[1] = 3221225472;
    v20[2] = __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_6;
    v20[3] = &unk_1EA16D158;
    v20[4] = self;
    v17 = (void *)MEMORY[0x1DF0A4968](v20);
    +[PLOperator className](PLDisplayAgent, "className");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryGaugeService registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:](self, "registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:", v18, *MEMORY[0x1E0D80370], CFSTR("APLStats"), 0, v17);

  }
}

id __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  v6 = a5;
  PLLogBatteryGaugeService();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "DTQueryResponse:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogBatteryGaugeService();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_cold_1();

  return v8;
}

uint64_t __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_51(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseProcessMonitorResults:", a2);
}

uint64_t __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseProcessNetworkResults:", a2);
}

uint64_t __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseLocationResults:", a2);
}

uint64_t __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseApplicationResults:", a2);
}

uint64_t __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseCoalitionResults:", a2);
}

uint64_t __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "parseDisplayResults:", a2);
}

- (void)registerNotificationWithAgent:(id)a3 withType:(id)a4 withTableName:(id)a5 withCallBackType:(BOOL)a6 withBlock:(id)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  -[objc_class entryKeyForType:andName:](NSClassFromString((NSString *)a3), "entryKeyForType:andName:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __105__PLBatteryGaugeService_registerNotificationWithAgent_withType_withTableName_withCallBackType_withBlock___block_invoke;
  v21[3] = &unk_1EA16FB28;
  v21[4] = self;
  v17 = v15;
  v22 = v17;
  v23 = v12;
  v18 = v12;
  v19 = (void *)objc_msgSend(v16, "initWithOperator:forEntryKey:withBlock:", self, v17, v21);
  if (v7)
    -[PLBatteryGaugeService entrykeyCallBackOnceMapping](self, "entrykeyCallBackOnceMapping");
  else
    -[PLBatteryGaugeService entrykeyCallBackMapping](self, "entrykeyCallBackMapping");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v17);

}

void __105__PLBatteryGaugeService_registerNotificationWithAgent_withType_withTableName_withCallBackType_withBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
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
  NSObject *v22;
  uint64_t block;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  uint64_t v27;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_opt_class();
  block = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __105__PLBatteryGaugeService_registerNotificationWithAgent_withType_withTableName_withCallBackType_withBlock___block_invoke_2;
  v26 = &__block_descriptor_40_e5_v8__0lu32l8;
  v27 = v10;
  if (kPLGPUTime_block_invoke_defaultOnce != -1)
    dispatch_once(&kPLGPUTime_block_invoke_defaultOnce, &block);
  if (kPLGPUTime_block_invoke_classDebugEnabled)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataReceivedFrom:", v8);
    objc_msgSend(*(id *)(a1 + 32), "results");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, v13);

    objc_msgSend(*(id *)(a1 + 32), "reported");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v7, *(_QWORD *)(a1 + 40));

    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("reportedApplication=%@"), v16, block, v24, v25, v26, v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryGaugeService.m");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryGaugeService registerNotificationWithAgent:withType:withTableName:withCallBackType:withBlock:]_block_invoke");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 325);

    PLLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __105__PLBatteryGaugeService_registerNotificationWithAgent_withType_withTableName_withCallBackType_withBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLGPUTime_block_invoke_classDebugEnabled = result;
  return result;
}

- (id)getObjectInMeasurementsWithPid:(int)a3 withCategory:(id)a4 withKey:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  -[PLBatteryGaugeService measurements](self, "measurements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)setObjectInMeasurementsWithObject:(id)a3 withPid:(int)a4 withCategory:(id)a5 withKey:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = *(_QWORD *)&a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[PLBatteryGaugeService measurements](self, "measurements");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v10);
}

- (void)parseProcessMonitorResults:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  id obj;
  _QWORD block[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[PLBatteryGaugeService trackedProcesses](self, "trackedProcesses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  v41 = v4;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v45;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v9);
        objc_msgSend(v4, "objectsForSubKey:ofSubKeyType:", v11, CFSTR("PID"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "count"))
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doubleValue");
          v14 = v13 / 1000.0;

          -[PLBatteryGaugeService curQueryTime](self, "curQueryTime");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBatteryGaugeService lastQueryTime](self, "lastQueryTime");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "timeIntervalSinceDate:", v16);
          v18 = v17;

          if (v18 > 0.0)
            v14 = fmin(v14 / v18 * 1000.0 * 0.5, 1000.0);
          -[PLBatteryGaugeService measurements](self, "measurements");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v11);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v21, &unk_1EA1C09C8);

        }
        else
        {
          -[PLBatteryGaugeService measurements](self, "measurements");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v11);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", &unk_1EA1C0AA0, &unk_1EA1C09C8);
        }

        PLLogBatteryGaugeService();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          -[PLBatteryGaugeService measurements](self, "measurements");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v11);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKeyedSubscript:", &unk_1EA1C09C8);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v49 = v11;
          v50 = 2112;
          v51 = v25;
          _os_log_impl(&dword_1DA9D6000, v22, OS_LOG_TYPE_INFO, "ProcessMonitor parsing for PID %@: CPU cost = %@", buf, 0x16u);

          v4 = v41;
        }

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v6);

  }
  v26 = objc_opt_class();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PLBatteryGaugeService_parseProcessMonitorResults___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v26;
  if (parseProcessMonitorResults__defaultOnce != -1)
    dispatch_once(&parseProcessMonitorResults__defaultOnce, block);
  if (parseProcessMonitorResults__classDebugEnabled)
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    -[PLBatteryGaugeService measurements](self, "measurements");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("!!! %s/%d: measurements=%@"), "-[PLBatteryGaugeService parseProcessMonitorResults:]", 390, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryGaugeService.m");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "lastPathComponent");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryGaugeService parseProcessMonitorResults:]");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 390);

    PLLogCommon();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("!!! %s/%d: processMonitorEntry=%@"), "-[PLBatteryGaugeService parseProcessMonitorResults:]", 391, v41);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryGaugeService.m");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "lastPathComponent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryGaugeService parseProcessMonitorResults:]");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 391);

    PLLogCommon();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    v4 = v41;
  }

}

uint64_t __52__PLBatteryGaugeService_parseProcessMonitorResults___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  parseProcessMonitorResults__classDebugEnabled = result;
  return result;
}

- (void)parseProcessNetworkResults:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  void *v27;
  __int16 v28;
  _BYTE v29[10];
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryGaugeService bundleIDandPidMap](self, "bundleIDandPidMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BundleName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WifiIn"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WifiOut"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CellIn"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "intValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CellOut"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");

    PLLogBatteryGaugeService();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v26 = 138413570;
      v27 = v4;
      v28 = 1024;
      *(_DWORD *)v29 = v9;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v11;
      v30 = 1024;
      v31 = v13;
      v32 = 1024;
      v33 = v15;
      v34 = 2112;
      v35 = v7;
      _os_log_debug_impl(&dword_1DA9D6000, v16, OS_LOG_TYPE_DEBUG, "!!! processNetworkEntry=%@, wifiIn=%d, wifiOut=%d, cellIn=%d, cellOut=%d, pid=%@", (uint8_t *)&v26, 0x2Eu);
    }

    -[PLBatteryGaugeService measurements](self, "measurements");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[PLBatteryGaugeService computeNetworkingCostWithWifiIn:withWifiOut:withCellIn:withCellOut:](self, "computeNetworkingCostWithWifiIn:withWifiOut:withCellIn:withCellOut:", v9, v11, v13, v15);
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v20, &unk_1EA1C09E0);

    PLLogBatteryGaugeService();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      -[PLBatteryGaugeService measurements](self, "measurements");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", &unk_1EA1C09E0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412546;
      v27 = v7;
      v28 = 2112;
      *(_QWORD *)v29 = v24;
      _os_log_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_INFO, "ProcessNetwork parsing for PID %@: network cost = %@", (uint8_t *)&v26, 0x16u);

    }
  }
  PLLogBatteryGaugeService();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService parseProcessNetworkResults:].cold.1(v4, self, v25);

}

- (void)parseLocationResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  char *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  void *v35;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  _BYTE v44[14];
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKey:", CFSTR("BundleId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5 == v6))
  {
    PLLogBatteryGaugeService();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[PLBatteryGaugeService parseLocationResults:].cold.1();
  }
  else
  {
    v34 = v4;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[PLBatteryGaugeService bundleIDandPidMap](self, "bundleIDandPidMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v8;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    v10 = v35;
    if (v9)
    {
      v11 = v9;
      v12 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v5, "isEqualToString:", v14))
          {
            -[PLBatteryGaugeService bundleIDandPidMap](self, "bundleIDandPidMap");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectForKeyedSubscript:", v14);
            v16 = (char *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "objectForKey:", CFSTR("timestampEnd"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {

              goto LABEL_11;
            }
            objc_msgSend(v10, "objectForKey:", CFSTR("LocationDesiredAccuracy"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
            {
              PLLogBatteryGaugeService();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                -[PLBatteryGaugeService measurements](self, "measurements");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315906;
                v42 = "-[PLBatteryGaugeService parseLocationResults:]";
                v43 = 1024;
                *(_DWORD *)v44 = 439;
                *(_WORD *)&v44[4] = 2112;
                *(_QWORD *)&v44[6] = v5;
                v45 = 2112;
                v46 = v32;
                _os_log_debug_impl(&dword_1DA9D6000, v22, OS_LOG_TYPE_DEBUG, "!!! %s/%d: location start signal; bundleId=%@, measuerment=%@",
                  buf,
                  0x26u);

              }
              -[PLBatteryGaugeService measurements](self, "measurements");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectForKeyedSubscript:", v16);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("Ongoing Location"));

              -[PLBatteryGaugeService measurements](self, "measurements");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", v16);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = (void *)MEMORY[0x1E0CB37E8];
              -[PLBatteryGaugeService computeLocationCostWithWifiCost:withGpsCost:withCellCost:withSkyhookCost:](self, "computeLocationCostWithWifiCost:withGpsCost:withCellCost:withSkyhookCost:", 0, 1, 0, 0);
              objc_msgSend(v25, "numberWithDouble:");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKey:", v26, &unk_1EA1C09F8);

            }
            else
            {
LABEL_11:
              PLLogBatteryGaugeService();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                -[PLBatteryGaugeService measurements](self, "measurements");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315906;
                v42 = "-[PLBatteryGaugeService parseLocationResults:]";
                v43 = 1024;
                *(_DWORD *)v44 = 433;
                *(_WORD *)&v44[4] = 2112;
                *(_QWORD *)&v44[6] = v5;
                v45 = 2112;
                v46 = v31;
                _os_log_debug_impl(&dword_1DA9D6000, v18, OS_LOG_TYPE_DEBUG, "!!! %s/%d: location terminate signal; bundleId=%@, measuerment=%@",
                  buf,
                  0x26u);

              }
              -[PLBatteryGaugeService measurements](self, "measurements");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", v16);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("Ongoing Location"));
            }

            PLLogBatteryGaugeService();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              -[PLBatteryGaugeService measurements](self, "measurements");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectForKeyedSubscript:", v16);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKeyedSubscript:", &unk_1EA1C09F8);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v42 = v16;
              v43 = 2112;
              *(_QWORD *)v44 = v30;
              _os_log_impl(&dword_1DA9D6000, v27, OS_LOG_TYPE_INFO, "Location parsing for PID %@: location cost = %@", buf, 0x16u);

              v10 = v35;
            }

            continue;
          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v11);
    }

    PLLogBatteryGaugeService();
    v33 = objc_claimAutoreleasedReturnValue();
    v4 = v34;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[PLBatteryGaugeService parseLocationResults:].cold.2();
  }

}

- (void)parseApplicationResults:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  _BYTE v26[14];
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("pid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryGaugeService measurements](self, "measurements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("State"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "intValue");

    PLLogBatteryGaugeService();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PLBatteryGaugeService parseApplicationResults:].cold.2(v10, v11);

    -[PLBatteryGaugeService measurements](self, "measurements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, &unk_1EA1C0A10);

    v15 = objc_msgSend(v6, "intValue");
    -[PLBatteryGaugeService curQueryTime](self, "curQueryTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryGaugeService setLastActiveStartTimeAndLastSuspendTimeWithPid:withAppState:withCurrentTime:](self, "setLastActiveStartTimeAndLastSuspendTimeWithPid:withAppState:withCurrentTime:", v15, v10, v16);

    PLLogBatteryGaugeService();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      -[PLBatteryGaugeService measurements](self, "measurements");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", &unk_1EA1C0A10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138412546;
      v24 = (const char *)v6;
      v25 = 2112;
      *(_QWORD *)v26 = v20;
      _os_log_impl(&dword_1DA9D6000, v17, OS_LOG_TYPE_INFO, "Application parsing for PID %@: app state = %@", (uint8_t *)&v23, 0x16u);

    }
  }
  else
  {
    PLLogBatteryGaugeService();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[PLBatteryGaugeService parseApplicationResults:].cold.1();
  }

  PLLogBatteryGaugeService();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    -[PLBatteryGaugeService measurements](self, "measurements");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 136316418;
    v24 = "-[PLBatteryGaugeService parseApplicationResults:]";
    v25 = 1024;
    *(_DWORD *)v26 = 489;
    *(_WORD *)&v26[4] = 2112;
    *(_QWORD *)&v26[6] = v6;
    v27 = 2112;
    v28 = v22;
    v29 = 2112;
    v30 = v4;
    v31 = 2112;
    v32 = v5;
    _os_log_debug_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_DEBUG, "!!! %s/%d: applicationPid=%@, self.measurements=%@, applicationEntry=%@, keys=%@", (uint8_t *)&v23, 0x3Au);

  }
}

- (void)parseCoalitionResults:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  void *v21;
  char *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  _BYTE v33[14];
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogBatteryGaugeService();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService parseCoalitionResults:].cold.2();

  -[PLBatteryGaugeService bundleIDandPidMap](self, "bundleIDandPidMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("BundleId"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9 == v10))
    {
      PLLogBatteryGaugeService();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        -[PLBatteryGaugeService bundleIDandPidMap](self, "bundleIDandPidMap");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v31 = "-[PLBatteryGaugeService parseCoalitionResults:]";
        v32 = 1024;
        *(_DWORD *)v33 = 522;
        *(_WORD *)&v33[4] = 2112;
        *(_QWORD *)&v33[6] = v9;
        v34 = 2112;
        v35 = v21;
        v36 = 2112;
        v37 = v4;
        _os_log_debug_impl(&dword_1DA9D6000, v20, OS_LOG_TYPE_DEBUG, "!!! %s/%d: bundleId=%@, bundleIDandPidMap=%@, userInfo=%@", buf, 0x30u);

      }
      goto LABEL_16;
    }
    if (objc_msgSend(v8, "containsObject:", v9))
    {
      -[PLBatteryGaugeService measurements](self, "measurements");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBatteryGaugeService bundleIDandPidMap](self, "bundleIDandPidMap");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "objectForKey:", CFSTR("gpu_time"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBatteryGaugeService computeGPUCostWithGPUSec:](self, "computeGPUCostWithGPUSec:", v15);
      objc_msgSend(v14, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v16, &unk_1EA1C0A28);

      PLLogBatteryGaugeService();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        goto LABEL_14;
      -[PLBatteryGaugeService measurements](self, "measurements");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v31 = "-[PLBatteryGaugeService parseCoalitionResults:]";
      v32 = 1024;
      *(_DWORD *)v33 = 508;
      *(_WORD *)&v33[4] = 2112;
      *(_QWORD *)&v33[6] = v9;
      v34 = 2112;
      v35 = v18;
      v36 = 2112;
      v37 = v4;
      v19 = "!!! %s/%d: bundleId=%@, measurements=%@, userInfo=%@";
    }
    else
    {
      PLLogBatteryGaugeService();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        goto LABEL_14;
      -[PLBatteryGaugeService bundleIDandPidMap](self, "bundleIDandPidMap");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v31 = "-[PLBatteryGaugeService parseCoalitionResults:]";
      v32 = 1024;
      *(_DWORD *)v33 = 514;
      *(_WORD *)&v33[4] = 2112;
      *(_QWORD *)&v33[6] = v9;
      v34 = 2112;
      v35 = v18;
      v36 = 2112;
      v37 = v4;
      v19 = "!!! %s/%d: bundleId=%@, bundleIDandPidMap=%@, userInfo=%@";
    }
    _os_log_debug_impl(&dword_1DA9D6000, v17, OS_LOG_TYPE_DEBUG, v19, buf, 0x30u);

LABEL_14:
    PLLogBatteryGaugeService();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      -[PLBatteryGaugeService bundleIDandPidMap](self, "bundleIDandPidMap");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", v9);
      v22 = (char *)objc_claimAutoreleasedReturnValue();
      -[PLBatteryGaugeService measurements](self, "measurements");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBatteryGaugeService bundleIDandPidMap](self, "bundleIDandPidMap");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectForKeyedSubscript:", &unk_1EA1C0A28);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v22;
      v32 = 2112;
      *(_QWORD *)v33 = v26;
      _os_log_impl(&dword_1DA9D6000, v20, OS_LOG_TYPE_INFO, "Coalition parsing for PID %@: GPU cost = %@", buf, 0x16u);

    }
LABEL_16:

    goto LABEL_17;
  }
  PLLogBatteryGaugeService();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService parseCoalitionResults:].cold.1(self, (uint64_t)v4, v9);
LABEL_17:

}

- (void)parseThermalStateCallback:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PLBatteryGaugeService *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id obj;
  void *v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  if (parseThermalStateCallback__onceToken != -1)
    dispatch_once(&parseThermalStateCallback__onceToken, &__block_literal_global_98);
  state64 = 0;
  notify_get_state(parseThermalStateCallback__thermalStateToken, &state64);
  v4 = state64;
  if (state64 >= 0x1E)
    v4 = 30;
  state64 = v4;
  objc_msgSend((id)parseThermalStateCallback__cltmDefaults, "stringForKey:", CFSTR("thermalSimulationMode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v5;
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("nominal"), v5, v30) & 1) != 0)
    {
      v7 = 0;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("light")) & 1) != 0)
    {
      v7 = 10;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("moderate")) & 1) != 0)
    {
      v7 = 20;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("heavy")))
    {
      v7 = 30;
    }
    else
    {
      v7 = -10;
    }
  }
  else
  {
    v7 = -10;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[PLBatteryGaugeService trackedProcesses](self, "trackedProcesses", v28);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v35)
  {
    v8 = *(_QWORD *)v37;
    v9 = 0x1E0CB3000uLL;
    v10 = &unk_1EA1C0A58;
    v31 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        -[PLBatteryGaugeService measurements](self, "measurements");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v9 + 2024), "numberWithUnsignedLongLong:", state64);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v15, v10);

        -[PLBatteryGaugeService measurements](self, "measurements");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v9 + 2024), "numberWithLongLong:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v18, &unk_1EA1C0A70);

        PLLogBatteryGaugeService();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          -[PLBatteryGaugeService measurements](self, "measurements");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v12);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectForKeyedSubscript:", v10);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBatteryGaugeService measurements](self, "measurements");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v12);
          v22 = v10;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", &unk_1EA1C0A70);
          v24 = self;
          v25 = v7;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v42 = v12;
          v43 = 2112;
          v44 = v20;
          v45 = 2112;
          v46 = v26;
          _os_log_impl(&dword_1DA9D6000, v19, OS_LOG_TYPE_INFO, "Coalition parsing for PID %@: current thermal state = %@, induced thermal state = %@", buf, 0x20u);

          v7 = v25;
          self = v24;

          v10 = v22;
          v9 = 0x1E0CB3000;

          v8 = v31;
        }

      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    }
    while (v35);
  }

  PLLogBatteryGaugeService();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService parseThermalStateCallback:].cold.1((uint64_t *)&state64, v7, v27);

}

void __51__PLBatteryGaugeService_parseThermalStateCallback___block_invoke()
{
  uint64_t v0;
  void *v1;

  notify_register_check((const char *)*MEMORY[0x1E0C83A00], &parseThermalStateCallback__thermalStateToken);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.cltm"));
  v1 = (void *)parseThermalStateCallback__cltmDefaults;
  parseThermalStateCallback__cltmDefaults = v0;

}

- (void)parseDisplayResults:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  PLBatteryGaugeService *v30;
  id obj;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  _BYTE v43[10];
  __int16 v44;
  unsigned int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AvgRed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v5, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AvgGreen"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v6, "intValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AvgBlue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v7, "intValue");

  PLLogBatteryGaugeService();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v41 = v4;
    v42 = 1024;
    *(_DWORD *)v43 = v34;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v33;
    v44 = 1024;
    v45 = v32;
    _os_log_debug_impl(&dword_1DA9D6000, v8, OS_LOG_TYPE_DEBUG, "!!! displayEntry=%@, avgRed=%d, avgGreen=%d, avgBlue=%d", buf, 0x1Eu);
  }
  v29 = v4;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[PLBatteryGaugeService trackedProcesses](self, "trackedProcesses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    v12 = 0x1E0CB3000uLL;
    v13 = &unk_1EA1C0A40;
    v30 = self;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[PLBatteryGaugeService measurements](self, "measurements");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(v12 + 2024);
        -[PLBatteryGaugeService computeDisplayCostWithAvgRed:withAvgGreen:withAvgBlue:](self, "computeDisplayCostWithAvgRed:withAvgGreen:withAvgBlue:", v34, v33, v32);
        objc_msgSend(v18, "numberWithDouble:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v19, v13);

        PLLogBatteryGaugeService();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          -[PLBatteryGaugeService measurements](self, "measurements");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v13);
          v23 = v10;
          v24 = v11;
          v25 = v13;
          v26 = v12;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v41 = v15;
          v42 = 2112;
          *(_QWORD *)v43 = v27;
          _os_log_impl(&dword_1DA9D6000, v20, OS_LOG_TYPE_INFO, "Display parsing for PID %@: display cost = %@", buf, 0x16u);

          v12 = v26;
          v13 = v25;
          v11 = v24;
          v10 = v23;
          self = v30;

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v10);
  }

  PLLogBatteryGaugeService();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService parseDisplayResults:].cold.1(v29, self, v28);

}

- (void)setLastActiveStartTimeAndLastSuspendTimeWithPid:(int)a3 withAppState:(int)a4 withCurrentTime:(id)a5
{
  uint64_t v6;
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
  const __CFString *v22;
  void *v23;
  void *v24;
  id v25;

  v6 = *(_QWORD *)&a3;
  v25 = a5;
  -[PLBatteryGaugeService measurements](self, "measurements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lastActiveStart"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryGaugeService measurements](self, "measurements");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("lastSuspendStart"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 == 8 || a4 == 4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 == v16
      || (objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v17,
          v15 != v17)
      && v15 > v11)
    {
      -[PLBatteryGaugeService measurements](self, "measurements");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = CFSTR("lastActiveStart");
LABEL_11:
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, v22);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 == v23
      || (objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v24,
          v11 != v24)
      && v15 < v11)
    {
      -[PLBatteryGaugeService measurements](self, "measurements");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      v22 = CFSTR("lastSuspendStart");
      goto LABEL_11;
    }
  }

}

- (double)computeNetworkingCostWithWifiIn:(int)a3 withWifiOut:(int)a4 withCellIn:(int)a5 withCellOut:(int)a6
{
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = (double)(a4 + a3 + a5 + a6);
  PLLogBatteryGaugeService();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService computeNetworkingCostWithWifiIn:withWifiOut:withCellIn:withCellOut:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  return v6;
}

- (double)computeLocationCostWithWifiCost:(int)a3 withGpsCost:(int)a4 withCellCost:(int)a5 withSkyhookCost:(int)a6
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
  PLLogBatteryGaugeService();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService computeLocationCostWithWifiCost:withGpsCost:withCellCost:withSkyhookCost:].cold.1();

  return v12;
}

- (double)computeGPUCostWithGPUSec:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;

  objc_msgSend(a3, "doubleValue");
  v5 = v4;
  -[PLBatteryGaugeService curQueryTime](self, "curQueryTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryGaugeService lastQueryTime](self, "lastQueryTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  if (v9 > 0.0)
    v5 = fmin(v5 / v9 * 1000.0 * 0.5, 1000.0);
  PLLogBatteryGaugeService();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService computeGPUCostWithGPUSec:].cold.1();

  return v5;
}

- (double)computeDisplayCostWithAvgRed:(int)a3 withAvgGreen:(int)a4 withAvgBlue:(int)a5
{
  double v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = ((double)a4 / 255.0 * 0.25 + (double)a3 / 255.0 * 0.31 + (double)a5 * 0.44 / 255.0) * 600.0;
  PLLogBatteryGaugeService();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService computeNetworkingCostWithWifiIn:withWifiOut:withCellIn:withCellOut:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  return v5;
}

- (id)convertRawUsageToScore:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
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
  double v42;
  double v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
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
  double v60;
  double v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  double v83;
  void *v84;
  void *v85;
  double v86;
  int v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  id obj;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  unsigned int v117;
  PLBatteryGaugeService *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _QWORD v132[2];
  _QWORD v133[2];
  uint8_t buf[4];
  uint64_t v135;
  _BYTE v136[128];
  _BYTE v137[128];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  -[PLBatteryGaugeService trackedProcesses](self, "trackedProcesses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v137, 16);
  if (v111)
  {
    v109 = *(_QWORD *)v129;
    v110 = v4;
    v118 = self;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v129 != v109)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v5);
        v7 = (void *)objc_opt_new();
        v116 = v6;
        objc_msgSend(v4, "objectForKeyedSubscript:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("usage_data"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "objectForKeyedSubscript:", &unk_1EA1C0A10);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("cost"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = objc_msgSend(v11, "intValue");

        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        -[PLBatteryGaugeService scoringEntities](self, "scoringEntities");
        v113 = (id)objc_claimAutoreleasedReturnValue();
        v122 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
        v112 = v5;
        if (!v122)
        {
          v12 = 0.0;
          v13 = 0.0;
          goto LABEL_54;
        }
        v121 = *(_QWORD *)v125;
        v12 = 0.0;
        v13 = 0.0;
        v114 = v9;
        v115 = v7;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v125 != v121)
              objc_enumerationMutation(v113);
            v15 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v14);
            objc_msgSend(v9, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
              goto LABEL_41;
            v123 = v14;
            if (objc_msgSend(v15, "shortValue") == 5)
            {
              PLLogBatteryGaugeService();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v9, "objectForKeyedSubscript:", v15);
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "objectForKeyedSubscript:", CFSTR("cost"));
                v98 = v15;
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "doubleValue");
                *(_DWORD *)buf = 134217984;
                v135 = v100;
                _os_log_debug_impl(&dword_1DA9D6000, v17, OS_LOG_TYPE_DEBUG, "Cost %f", buf, 0xCu);

                v15 = v98;
              }

              -[PLBatteryGaugeService costElement](self, "costElement");
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v18)
              {
                +[PLDTCostElement getCostElementInstance](PLDTCostElement, "getCostElementInstance");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBatteryGaugeService setCostElement:](self, "setCostElement:", v19);

              }
              -[PLBatteryGaugeService costElement](self, "costElement");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "objectForKeyedSubscript:", v15);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("cost"));
              v119 = v15;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "doubleValue");
              v24 = v23;
              -[PLBatteryGaugeService lastQueryTime](self, "lastQueryTime");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addNetworkingEvent:atTime:withPid:withAppState:withQueryCount:", v25, objc_msgSend(v116, "intValue"), v117, -[PLBatteryGaugeService lastQueryCount](self, "lastQueryCount"), v24);

              -[PLBatteryGaugeService costElement](self, "costElement");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLBatteryGaugeService curQueryTime](self, "curQueryTime");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v116, "intValue");
              -[PLBatteryGaugeService measurements](self, "measurements");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKeyedSubscript:", v116);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("lastActiveStart"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLBatteryGaugeService measurements](self, "measurements");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "objectForKeyedSubscript:", v116);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("lastSuspendStart"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "getNetworkingCostUptoTime:withPid:withLastActiveStart:withLastSuspendStart:withAppState:withQueryCount:", v27, v28, v31, v34, v117, -[PLBatteryGaugeService curQueryCount](v118, "curQueryCount"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v7 = v115;
              objc_msgSend(v115, "setObject:forKeyedSubscript:", v35, v119);

              v36 = v26;
              self = v118;

              v9 = v114;
              v15 = v119;

            }
            else
            {
              if (objc_msgSend(v15, "shortValue") == 6)
              {
                -[PLBatteryGaugeService costElement](self, "costElement");
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v37)
                {
                  +[PLDTCostElement getCostElementInstance](PLDTCostElement, "getCostElementInstance");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PLBatteryGaugeService setCostElement:](self, "setCostElement:", v38);

                }
                -[PLBatteryGaugeService costElement](self, "costElement");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "objectForKeyedSubscript:", v15);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("cost"));
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "doubleValue");
                v43 = v42;
                -[PLBatteryGaugeService lastQueryTime](self, "lastQueryTime");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "addLocationEvent:atTime:withPid:withAppState:", v44, objc_msgSend(v116, "intValue"), v117, v43);

                -[PLBatteryGaugeService costElement](self, "costElement");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBatteryGaugeService curQueryTime](self, "curQueryTime");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v116, "intValue");
                -[PLBatteryGaugeService measurements](self, "measurements");
                v47 = v15;
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "objectForKeyedSubscript:", v116);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("lastActiveStart"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBatteryGaugeService measurements](self, "measurements");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "objectForKeyedSubscript:", v116);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("lastSuspendStart"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "getLocationCostUptoTime:withPid:withLastActiveStart:withLastSuspendStart:withAppState:", v120, v46, v50, v53, v117);
                v54 = objc_claimAutoreleasedReturnValue();
              }
              else if (objc_msgSend(v15, "shortValue") == 2)
              {
                -[PLBatteryGaugeService costElement](self, "costElement");
                v55 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v55)
                {
                  +[PLDTCostElement getCostElementInstance](PLDTCostElement, "getCostElementInstance");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PLBatteryGaugeService setCostElement:](self, "setCostElement:", v56);

                }
                -[PLBatteryGaugeService costElement](self, "costElement");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "objectForKeyedSubscript:", v15);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("cost"));
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "doubleValue");
                v61 = v60;
                -[PLBatteryGaugeService lastQueryTime](self, "lastQueryTime");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "addCpuEvent:atTime:withPid:withAppState:", v62, objc_msgSend(v116, "intValue"), v117, v61);

                -[PLBatteryGaugeService costElement](self, "costElement");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBatteryGaugeService curQueryTime](self, "curQueryTime");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = objc_msgSend(v116, "intValue");
                -[PLBatteryGaugeService measurements](self, "measurements");
                v47 = v15;
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "objectForKeyedSubscript:", v116);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("lastActiveStart"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBatteryGaugeService measurements](self, "measurements");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "objectForKeyedSubscript:", v116);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("lastSuspendStart"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "getCpuCostUptoTime:withPid:withLastActiveStart:withLastSuspendStart:withAppState:", v120, v63, v50, v53, v117);
                v54 = objc_claimAutoreleasedReturnValue();
              }
              else if (objc_msgSend(v15, "shortValue") == 8)
              {
                -[PLBatteryGaugeService costElement](self, "costElement");
                v64 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v64)
                {
                  +[PLDTCostElement getCostElementInstance](PLDTCostElement, "getCostElementInstance");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PLBatteryGaugeService setCostElement:](self, "setCostElement:", v65);

                }
                -[PLBatteryGaugeService costElement](self, "costElement");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "objectForKeyedSubscript:", v15);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("cost"));
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "doubleValue");
                v70 = v69;
                -[PLBatteryGaugeService lastQueryTime](self, "lastQueryTime");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "addGpuEvent:atTime:withPid:withAppState:", v71, objc_msgSend(v116, "intValue"), v117, v70);

                -[PLBatteryGaugeService costElement](self, "costElement");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBatteryGaugeService curQueryTime](self, "curQueryTime");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = objc_msgSend(v116, "intValue");
                -[PLBatteryGaugeService measurements](self, "measurements");
                v47 = v15;
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "objectForKeyedSubscript:", v116);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("lastActiveStart"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBatteryGaugeService measurements](self, "measurements");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "objectForKeyedSubscript:", v116);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("lastSuspendStart"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "getGpuCostUptoTime:withPid:withLastActiveStart:withLastSuspendStart:withAppState:", v120, v72, v50, v53, v117);
                v54 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                if (!+[PLBatteryGaugeService shouldCalculateDisplayCost](PLBatteryGaugeService, "shouldCalculateDisplayCost")|| objc_msgSend(v15, "shortValue") != 9)
                {
                  objc_msgSend(v9, "objectForKeyedSubscript:", v15);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, v15);
                  goto LABEL_32;
                }
                -[PLBatteryGaugeService costElement](self, "costElement");
                v88 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v88)
                {
                  +[PLDTCostElement getCostElementInstance](PLDTCostElement, "getCostElementInstance");
                  v89 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PLBatteryGaugeService setCostElement:](self, "setCostElement:", v89);

                }
                -[PLBatteryGaugeService costElement](self, "costElement");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "objectForKeyedSubscript:", v15);
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("cost"));
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "doubleValue");
                v94 = v93;
                -[PLBatteryGaugeService lastQueryTime](self, "lastQueryTime");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "addDisplayEvent:atTime:withPid:withAppState:", v95, objc_msgSend(v116, "intValue"), v117, v94);

                -[PLBatteryGaugeService costElement](self, "costElement");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBatteryGaugeService curQueryTime](self, "curQueryTime");
                v120 = (void *)objc_claimAutoreleasedReturnValue();
                v96 = objc_msgSend(v116, "intValue");
                -[PLBatteryGaugeService measurements](self, "measurements");
                v47 = v15;
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "objectForKeyedSubscript:", v116);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("lastActiveStart"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBatteryGaugeService measurements](self, "measurements");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "objectForKeyedSubscript:", v116);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("lastSuspendStart"));
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "getDisplayCostUptoTime:withPid:withLastActiveStart:withLastSuspendStart:withAppState:", v120, v96, v50, v53, v117);
                v54 = objc_claimAutoreleasedReturnValue();
              }
              v73 = (void *)v54;
              objc_msgSend(v115, "setObject:forKeyedSubscript:", v54, v47);

              v36 = v45;
              v7 = v115;

              self = v118;
              v9 = v114;

              v15 = v47;
            }
            v14 = v123;
LABEL_32:

            if (objc_msgSend(v15, "shortValue") == 7)
            {
              objc_msgSend(v7, "objectForKeyedSubscript:", v15);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "objectForKeyedSubscript:", CFSTR("cost"));
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v75, "doubleValue");
              if (v76 == 4.0 || objc_msgSend(v15, "shortValue") == 10)
              {

              }
              else
              {
                v87 = objc_msgSend(v15, "shortValue");

                if (v87 != 11)
                  goto LABEL_41;
              }
            }
            if (objc_msgSend(v15, "shortValue") != 7)
              goto LABEL_39;
            objc_msgSend(v7, "objectForKeyedSubscript:", v15);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("cost"));
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "doubleValue");
            v80 = v79;

            if (v80 == 4.0)
            {
              v13 = v13 + 200.0;
            }
            else
            {
LABEL_39:
              objc_msgSend(v7, "objectForKeyedSubscript:", v15);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "objectForKeyedSubscript:", CFSTR("cost"));
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "doubleValue");
              v13 = v13 + v83;

            }
            objc_msgSend(v7, "objectForKeyedSubscript:", v15);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("overhead"));
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "doubleValue");
            v12 = v12 + v86;

LABEL_41:
            ++v14;
          }
          while (v122 != v14);
          v101 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v124, v136, 16);
          v122 = v101;
        }
        while (v101);
LABEL_54:

        v132[0] = CFSTR("cost");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v132[1] = CFSTR("overhead");
        v133[0] = v102;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v133[1] = v103;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v133, v132, 2);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v104, &unk_1EA1C0AB8);

        v4 = v110;
        objc_msgSend(v110, "objectForKeyedSubscript:", v116);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "setObject:forKeyedSubscript:", v7, CFSTR("usage_data"));

        v5 = v112 + 1;
      }
      while (v112 + 1 != v111);
      v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v137, 16);
    }
    while (v111);
  }

  PLLogBatteryGaugeService();
  v106 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService convertRawUsageToScore:].cold.1();

  return v4;
}

- (void)requestDataFrom:(id)a3 withType:(int)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _QWORD block[5];

  v6 = a3;
  objc_sync_enter(CFSTR("___Sync___"));
  v7 = objc_opt_class();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PLBatteryGaugeService_requestDataFrom_withType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = v7;
  if (requestDataFrom_withType__defaultOnce != -1)
    dispatch_once(&requestDataFrom_withType__defaultOnce, block);
  if (requestDataFrom_withType__classDebugEnabled)
  {
    -[PLBatteryGaugeService requestTime](self, "requestTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)objc_opt_new();
      -[PLBatteryGaugeService requestTime](self, "requestTime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v6);

    }
    -[PLBatteryGaugeService requestTime](self, "requestTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

  }
  if (a4 == 1)
  {
    -[PLBatteryGaugeService entrykeyCallBackOnceMapping](self, "entrykeyCallBackOnceMapping");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!a4)
  {
    -[PLBatteryGaugeService entrykeyCallBackMapping](self, "entrykeyCallBackMapping");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v6);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v17 = (void *)v16;

    goto LABEL_13;
  }
  v17 = 0;
LABEL_13:
  PLLogBatteryGaugeService();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService requestDataFrom:withType:].cold.1();

  objc_msgSend(v17, "requestEntry");
  objc_sync_exit(CFSTR("___Sync___"));

}

uint64_t __50__PLBatteryGaugeService_requestDataFrom_withType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  requestDataFrom_withType__classDebugEnabled = result;
  return result;
}

- (void)dataReceivedFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  objc_sync_enter(CFSTR("___Sync___"));
  -[PLBatteryGaugeService returnTime](self, "returnTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    -[PLBatteryGaugeService returnTime](self, "returnTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v4);

  }
  -[PLBatteryGaugeService returnTime](self, "returnTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  PLLogBatteryGaugeService();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService dataReceivedFrom:].cold.1();

  objc_sync_exit(CFSTR("___Sync___"));
}

- (void)listAllRunningPidsWithBuffer:(int *)a3 withSizeOfBuffer:(int)a4
{
  if (a4 >= 1)
    memset(a3, 255, 4 * a4);
  proc_listpids(1u, 0, a3, 4 * a4);
}

- (int)matchingPidWithProcessName:(id)a3 withBundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  _DWORD v15[1024];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1DF0A47AC]();
  -[PLBatteryGaugeService listAllRunningPidsWithBuffer:withSizeOfBuffer:](self, "listAllRunningPidsWithBuffer:withSizeOfBuffer:", v15, 1024);
  v9 = proc_listpids(1u, 0, 0, 0);
  v10 = 0;
  if (v9 >= 4)
  {
    v11 = 0;
    v12 = (unint64_t)v9 >> 2;
    while (1)
    {
      if (v6)
      {
        +[PLUtilities processNameForPid:](PLUtilities, "processNameForPid:", v15[v11]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", v6) & 1) != 0)
          goto LABEL_12;

      }
      if (v7)
      {
        +[PLUtilities bundleIDFromPid:](PLUtilities, "bundleIDFromPid:", v15[v11]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v7, "isEqualToString:", v13) & 1) != 0)
        {
LABEL_12:
          v10 = v15[v11];

          break;
        }

      }
      v10 = 0;
      if (v11 <= 0x3FE && v12 > ++v11)
        continue;
      break;
    }
  }
  objc_autoreleasePoolPop(v8);

  return v10;
}

- (id)extractAndTranslateProcessIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[PLBatteryGaugeService extractAndSetProcessIdentifierWithPayload:](self, "extractAndSetProcessIdentifierWithPayload:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryGaugeService translateProcessIdentifierWithInput:](self, "translateProcessIdentifierWithInput:", v6);
  PLLogBatteryGaugeService();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService extractAndTranslateProcessIdentifier:].cold.1();

  return v6;
}

- (void)translateProcessIdentifierWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundle_id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("process_name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PLBatteryGaugeService matchingPidWithProcessName:withBundleID:](self, "matchingPidWithProcessName:withBundleID:", v7, v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("pid"));

    if (v6)
    {
LABEL_3:
      if (v7)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  +[PLUtilities bundleIDFromPid:](PLUtilities, "bundleIDFromPid:", objc_msgSend(v5, "intValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("bundle_id"));

  if (v7)
    goto LABEL_4;
LABEL_12:
  +[PLUtilities processNameForPid:](PLUtilities, "processNameForPid:", objc_msgSend(v5, "intValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("process_name"));

LABEL_4:
  PLLogBatteryGaugeService();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService translateProcessIdentifierWithInput:].cold.1(v4, v8);

}

- (id)extractAndSetProcessIdentifierWithPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  NSObject *v13;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundle_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("process_name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v8 = v7;
  if (v4)
  {
    v9 = CFSTR("pid");
    v10 = v4;
LABEL_7:
    objc_msgSend(v7, "setObject:forKey:", v10, v9);
    goto LABEL_8;
  }
  if (v6)
  {
    v9 = CFSTR("process_name");
    v10 = v6;
    goto LABEL_7;
  }
  if (v5)
  {
    v9 = CFSTR("bundle_id");
    v10 = v5;
    goto LABEL_7;
  }
  PLLogBatteryGaugeService();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService extractAndSetProcessIdentifierWithPayload:].cold.2();

LABEL_8:
  PLLogBatteryGaugeService();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService extractAndSetProcessIdentifierWithPayload:].cold.1(v8, v11);

  return v8;
}

- (id)startRoutineWithPayload:(id)a3
{
  id v4;
  NSObject *v5;
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
  int v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
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
  char v47;
  NSObject *v48;
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
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  const __CFString *v81;
  uint64_t v82;
  const __CFString *v83;
  void *v84;
  void *v85;
  const __CFString *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  uint8_t buf[2];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogBatteryGaugeService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v5, OS_LOG_TYPE_INFO, "Starting routine...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D7FFE0], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "signalServiceActive:", 1);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v80 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("battery_gauge_event"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("event"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C0AD0, CFSTR("return_value"));
  -[PLBatteryGaugeService extractAndTranslateProcessIdentifier:](self, "extractAndTranslateProcessIdentifier:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("pid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "intValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("process_name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundle_id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("time"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v12, "intValue") <= 0)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C0AE8, CFSTR("return_value"));
    PLLogBatteryGaugeService();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[PLBatteryGaugeService startRoutineWithPayload:].cold.2();

  }
  else
  {
    v78 = v15;
    v79 = v14;
    v77 = v13;
    v16 = proc_listpids(1u, 0, 0, 0);
    -[PLBatteryGaugeService listAllRunningPidsWithBuffer:withSizeOfBuffer:](self, "listAllRunningPidsWithBuffer:withSizeOfBuffer:", buf, 1024);
    if (v16 >= 4)
    {
      v19 = 0;
      v20 = (unint64_t)v16 >> 2;
      while (1)
      {
        v21 = *(_DWORD *)&buf[4 * v19];
        if (v21 == objc_msgSend(v12, "intValue"))
          break;
        if (v19 <= 0x3FE && v20 > ++v19)
          continue;
        goto LABEL_5;
      }
      v13 = v77;
      if (!v79
        || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v22,
            v79 == v22))
      {
        if (!v77
          || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              v29,
              v77 == v29))
        {
          v32 = (void *)MEMORY[0x1E0C99E20];
          v33 = (void *)objc_opt_new();
          objc_msgSend(v32, "setWithArray:", v33);
          v74 = objc_claimAutoreleasedReturnValue();

          PLLogBatteryGaugeService();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            -[PLBatteryGaugeService startRoutineWithPayload:].cold.7();
        }
        else
        {
          v30 = (void *)MEMORY[0x1E0C99E20];
          v88 = v77;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setWithArray:", v31);
          v74 = objc_claimAutoreleasedReturnValue();

          PLLogBatteryGaugeService();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            -[PLBatteryGaugeService startRoutineWithPayload:].cold.8();
        }
        v75 = 0;
      }
      else
      {
        v23 = (void *)MEMORY[0x1E0C99E20];
        v90 = v79;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setWithArray:", v24);
        v74 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)MEMORY[0x1E0C99E20];
        v89 = v79;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setWithArray:", v26);
        v27 = objc_claimAutoreleasedReturnValue();

        PLLogBatteryGaugeService();
        v28 = objc_claimAutoreleasedReturnValue();
        v75 = v27;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[PLBatteryGaugeService startRoutineWithPayload:].cold.9();
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = CFSTR("entry");
      v87 = v74;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "postNotificationName:object:userInfo:", CFSTR("PLProcessNetworkAgent.addProcessesOfInterest"), 0, v35);

      v36 = (void *)MEMORY[0x1E0C99E20];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "intValue"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v37;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setWithArray:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = CFSTR("entry");
      v84 = v39;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "postNotificationName:object:userInfo:", CFSTR("PLProcessMonitorAgent.addProcessesOfInterest"), 0, v41);

      v42 = (void *)v75;
      if (v75)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = CFSTR("entry");
        v82 = v75;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "postNotificationName:object:userInfo:", CFSTR("PLLocationAgent.addProcessesOfInterest"), 0, v44);

        v42 = (void *)v75;
      }
      v15 = v78;
      v76 = v42;
      if (v78)
      {
        -[PLBatteryGaugeService measurements](self, "measurements");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "allKeys");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "containsObject:", v12);

        if ((v47 & 1) != 0)
        {
          objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C0B18, CFSTR("return_value"));
          PLLogBatteryGaugeService();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            -[PLBatteryGaugeService startRoutineWithPayload:].cold.5();
          v14 = v79;
        }
        else
        {
          -[PLBatteryGaugeService measurements](self, "measurements");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "intValue"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setObject:forKey:", v50, v51);

          if (v79)
          {
            -[PLBatteryGaugeService measurements](self, "measurements");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "objectForKeyedSubscript:", v12);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "setObject:forKey:", v79, CFSTR("bundle_id"));

          }
          if (v77)
          {
            -[PLBatteryGaugeService measurements](self, "measurements");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectForKeyedSubscript:", v12);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "setObject:forKey:", v77, CFSTR("process_name"));

          }
          -[PLBatteryGaugeService measurements](self, "measurements");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectForKeyedSubscript:", v12);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v78, "doubleValue");
          objc_msgSend(v58, "numberWithDouble:");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "setObject:forKey:", v59, CFSTR("start_time"));

          -[PLBatteryGaugeService measurements](self, "measurements");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "objectForKeyedSubscript:", v12);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "setObject:forKey:", v62, CFSTR("lastActiveStart"));

          -[PLBatteryGaugeService measurements](self, "measurements");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "objectForKeyedSubscript:", v12);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setObject:forKey:", v65, CFSTR("lastSuspendStart"));

          -[PLBatteryGaugeService measurements](self, "measurements");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "objectForKeyedSubscript:", v12);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setObject:forKey:", &unk_1EA1C0B00, &unk_1EA1C0A10);

          objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C0AB8, CFSTR("return_value"));
          PLLogBatteryGaugeService();
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
            -[PLBatteryGaugeService startRoutineWithPayload:].cold.6();

          -[PLBatteryGaugeService bundleIDandPidMap](self, "bundleIDandPidMap");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "intValue"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v79;
          objc_msgSend(v69, "setObject:forKey:", v70, v79);

          -[PLBatteryGaugeService trackedProcesses](self, "trackedProcesses");
          v48 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v12, "intValue"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v48, "addObject:", v71);

          v13 = v77;
        }
        v15 = v78;
      }
      else
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C0B30, CFSTR("return_value"));
        PLLogBatteryGaugeService();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          -[PLBatteryGaugeService startRoutineWithPayload:].cold.4();
        v14 = v79;
      }
      v17 = v74;

    }
    else
    {
LABEL_5:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C0AE8, CFSTR("return_value"));
      PLLogBatteryGaugeService();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[PLBatteryGaugeService startRoutineWithPayload:].cold.3();
      v13 = v77;
      v14 = v79;
    }

  }
  objc_msgSend(v80, "setObject:forKey:", v7, &unk_1EA1C0B48);
  PLLogBatteryGaugeService();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService startRoutineWithPayload:].cold.1();

  return v80;
}

- (id)stopRoutineWithPayload:(id)a3
{
  id v4;
  NSObject *v5;
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
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint8_t v31[16];

  v4 = a3;
  PLLogBatteryGaugeService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_1DA9D6000, v5, OS_LOG_TYPE_INFO, "Stopping routine...", v31, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("battery_gauge_event"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("event"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C0AD0, CFSTR("return_value"));
  -[PLBatteryGaugeService extractAndTranslateProcessIdentifier:](self, "extractAndTranslateProcessIdentifier:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("pid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "intValue"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundle_id"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "intValue") == -1)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C0AB8, CFSTR("return_value"));
    PLLogBatteryGaugeService();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[PLBatteryGaugeService stopRoutineWithPayload:].cold.2();

    objc_msgSend(MEMORY[0x1E0D7FFE0], "sharedManager");
    v26 = objc_claimAutoreleasedReturnValue();
    -[NSObject signalServiceInactive:](v26, "signalServiceInactive:", 1);
    goto LABEL_21;
  }
  if (!objc_msgSend(v12, "intValue"))
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C0AE8, CFSTR("return_value"));
    PLLogBatteryGaugeService();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[PLBatteryGaugeService stopRoutineWithPayload:].cold.3();
    goto LABEL_21;
  }
  -[PLBatteryGaugeService measurements](self, "measurements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C0AE8, CFSTR("return_value"));
    PLLogBatteryGaugeService();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[PLBatteryGaugeService stopRoutineWithPayload:].cold.4();
LABEL_21:

    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 && v13 != v16)
  {
    -[PLBatteryGaugeService bundleIDandPidMap](self, "bundleIDandPidMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectForKey:", v13);

  }
  -[PLBatteryGaugeService measurements](self, "measurements");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectForKey:", v12);

  -[PLBatteryGaugeService trackedProcesses](self, "trackedProcesses");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "removeObject:", v12);

  -[PLBatteryGaugeService measurements](self, "measurements");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (!v22)
  {
    PLLogBatteryGaugeService();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[PLBatteryGaugeService stopRoutineWithPayload:].cold.5();

    objc_msgSend(MEMORY[0x1E0D7FFE0], "sharedManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "signalServiceInactive:", 1);

  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1EA1C0AB8, CFSTR("return_value"));
LABEL_22:
  -[PLBatteryGaugeService measurements](self, "measurements");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v28, CFSTR("tracked_processes"));

  objc_msgSend(v6, "setObject:forKey:", v7, &unk_1EA1C0B48);
  PLLogBatteryGaugeService();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService stopRoutineWithPayload:].cold.1();

  return v6;
}

- (id)pauseRoutineWithPayload:(id)a3
{
  id v4;
  NSObject *v5;
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
  uint8_t buf[16];

  v4 = a3;
  PLLogBatteryGaugeService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v5, OS_LOG_TYPE_INFO, "Pausing routine...", buf, 2u);
  }

  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("battery_gauge_event"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("event"));

  objc_msgSend(v6, "setObject:forKey:", &unk_1EA1C0AD0, CFSTR("return_value"));
  -[PLBatteryGaugeService extractAndTranslateProcessIdentifier:](self, "extractAndTranslateProcessIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bundle_id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("process_name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v13, "intValue") <= 0)
  {
    if (v14)
      v21 = v14;
    else
      v21 = v15;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot find specified process:%@"), v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v19);
    v20 = &unk_1EA1C0AE8;
  }
  else
  {
    -[PLBatteryGaugeService measurements](self, "measurements");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[PLBatteryGaugeService trackedProcesses](self, "trackedProcesses");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeObject:", v13);

      -[PLBatteryGaugeService trackedProcesses](self, "trackedProcesses");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v19);
      v20 = &unk_1EA1C0AB8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Specified process is not tracked:%@"), v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v19);
      v20 = &unk_1EA1C0B60;
    }
  }

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("return_value"));
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("tracked_processes"));
  objc_msgSend(v7, "setObject:forKey:", v6, &unk_1EA1C0B48);

  return v7;
}

- (id)resumeRoutineWithPayload:(id)a3
{
  id v4;
  NSObject *v5;
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
  uint8_t buf[16];

  v4 = a3;
  PLLogBatteryGaugeService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v5, OS_LOG_TYPE_INFO, "Resuming routine...", buf, 2u);
  }

  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("battery_gauge_event"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("event"));

  objc_msgSend(v6, "setObject:forKey:", &unk_1EA1C0AD0, CFSTR("return_value"));
  -[PLBatteryGaugeService extractAndTranslateProcessIdentifier:](self, "extractAndTranslateProcessIdentifier:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bundle_id"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("process_name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[PLBatteryGaugeService measurements](self, "measurements");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[PLBatteryGaugeService trackedProcesses](self, "trackedProcesses");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v13);

      -[PLBatteryGaugeService trackedProcesses](self, "trackedProcesses");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v19);
      v20 = &unk_1EA1C0AB8;
    }
    else
    {
      if (v14)
        v22 = v14;
      else
        v22 = v13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Specified process is not tracked:%@"), v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v19);
      v20 = &unk_1EA1C0B60;
    }
  }
  else
  {
    if (v14)
      v21 = v14;
    else
      v21 = v15;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot find specified process:%@"), v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v19);
    v20 = &unk_1EA1C0AE8;
  }

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("return_value"));
  objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("tracked_processes"));
  objc_msgSend(v7, "setObject:forKey:", v6, &unk_1EA1C0B48);

  return v7;
}

- (id)clearStateRoutine:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  v3 = a3;
  PLLogBatteryGaugeService();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1DA9D6000, v4, OS_LOG_TYPE_INFO, "Clearing state...", v11, 2u);
  }

  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("battery_gauge_event"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("event"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA1C0AB8, CFSTR("return_value"));
  objc_msgSend(MEMORY[0x1E0D7FFE0], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "signalServiceInactive:", 1);

  PLLogBatteryGaugeService();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService clearStateRoutine:].cold.1();

  objc_msgSend(v6, "setObject:forKey:", v5, &unk_1EA1C0B48);
  return v6;
}

- (void)triggerAllData
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  PLLogBatteryGaugeService();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v3, OS_LOG_TYPE_INFO, "Requesting source data...", buf, 2u);
  }

  -[PLBatteryGaugeService curQueryTime](self, "curQueryTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryGaugeService setLastQueryTime:](self, "setLastQueryTime:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryGaugeService setCurQueryTime:](self, "setCurQueryTime:", v5);

  -[PLBatteryGaugeService setLastQueryCount:](self, "setLastQueryCount:", -[PLBatteryGaugeService curQueryCount](self, "curQueryCount"));
  -[PLBatteryGaugeService setCurQueryCount:](self, "setCurQueryCount:", -[PLBatteryGaugeService lastQueryCount](self, "lastQueryCount") + 1);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[PLBatteryGaugeService entrykeyCallBackMapping](self, "entrykeyCallBackMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11);
        PLLogBatteryGaugeService();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v32 = "-[PLBatteryGaugeService triggerAllData]";
          v33 = 1024;
          v34 = 1287;
          v35 = 2112;
          v36 = v12;
          _os_log_debug_impl(&dword_1DA9D6000, v13, OS_LOG_TYPE_DEBUG, "!!! %s/%d: requestDataFrom:%@", buf, 0x1Cu);
        }

        -[PLBatteryGaugeService requestDataFrom:withType:](self, "requestDataFrom:withType:", v12, 0);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    }
    while (v9);
  }

  if ((triggerAllData_triggered & 1) == 0)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[PLBatteryGaugeService entrykeyCallBackOnceMapping](self, "entrykeyCallBackOnceMapping");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19);
          PLLogBatteryGaugeService();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v32 = "-[PLBatteryGaugeService triggerAllData]";
            v33 = 1024;
            v34 = 1295;
            v35 = 2112;
            v36 = v20;
            _os_log_debug_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_DEBUG, "!!! %s/%d: requestDataFrom:%@", buf, 0x1Cu);
          }

          -[PLBatteryGaugeService requestDataFrom:withType:](self, "requestDataFrom:withType:", v20, 1);
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v17);
    }

    triggerAllData_triggered = 1;
  }
}

- (id)compileSnapshotResponse
{
  uint64_t v3;
  uint64_t v4;
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
  int v51;
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
  NSObject *v76;
  void *v77;
  NSObject *v78;
  id obj;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  void *v100;
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[2];
  _QWORD v120[2];
  _BYTE v121[128];
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v82 = (void *)objc_opt_new();
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[PLBatteryGaugeService trackedProcesses](self, "trackedProcesses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v121, 16);
  if (v83)
  {
    v81 = *(_QWORD *)v96;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v96 != v81)
          objc_enumerationMutation(obj);
        v84 = v3;
        v4 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * v3);
        v5 = (void *)objc_opt_new();
        -[PLBatteryGaugeService measurements](self, "measurements");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", &unk_1EA1C09C8);
        v94 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLBatteryGaugeService measurements](self, "measurements");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", &unk_1EA1C0B78);
        v93 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLBatteryGaugeService measurements](self, "measurements");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", &unk_1EA1C0B90);
        v92 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLBatteryGaugeService measurements](self, "measurements");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", &unk_1EA1C09E0);
        v91 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLBatteryGaugeService measurements](self, "measurements");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", &unk_1EA1C09F8);
        v90 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLBatteryGaugeService measurements](self, "measurements");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", &unk_1EA1C0A10);
        v89 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLBatteryGaugeService measurements](self, "measurements");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", &unk_1EA1C0A28);
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        if (+[PLBatteryGaugeService shouldCalculateDisplayCost](PLBatteryGaugeService, "shouldCalculateDisplayCost"))
        {
          -[PLBatteryGaugeService measurements](self, "measurements");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKey:", &unk_1EA1C0A40);
          v85 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v85 = 0;
        }
        -[PLBatteryGaugeService measurements](self, "measurements");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", &unk_1EA1C0A58);
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLBatteryGaugeService measurements](self, "measurements");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", v4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKey:", &unk_1EA1C0A70);
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = v94;
        if (!v94)
          v26 = &unk_1EA1C0AA0;
        v119[0] = CFSTR("cost");
        v119[1] = CFSTR("overhead");
        v120[0] = v26;
        v120[1] = &unk_1EA1C0AA0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v27, &unk_1EA1C09C8);

        v28 = v93;
        if (!v93)
          v28 = &unk_1EA1C0AA0;
        v117[0] = CFSTR("cost");
        v117[1] = CFSTR("overhead");
        v118[0] = v28;
        v118[1] = &unk_1EA1C0AA0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, v117, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v29, &unk_1EA1C0B78);

        v30 = v92;
        if (!v92)
          v30 = &unk_1EA1C0AA0;
        v115[0] = CFSTR("cost");
        v115[1] = CFSTR("overhead");
        v116[0] = v30;
        v116[1] = &unk_1EA1C0AA0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v31, &unk_1EA1C0B90);

        v32 = v91;
        if (!v91)
          v32 = &unk_1EA1C0AA0;
        v113[0] = CFSTR("cost");
        v113[1] = CFSTR("overhead");
        v114[0] = v32;
        v114[1] = &unk_1EA1C0AA0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v33, &unk_1EA1C09E0);

        v34 = v90;
        if (!v90)
          v34 = &unk_1EA1C0AA0;
        v111[0] = CFSTR("cost");
        v111[1] = CFSTR("overhead");
        v112[0] = v34;
        v112[1] = &unk_1EA1C0AA0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v35, &unk_1EA1C09F8);

        v36 = v89;
        if (!v89)
          v36 = &unk_1EA1C0AA0;
        v109[0] = CFSTR("cost");
        v109[1] = CFSTR("overhead");
        v110[0] = v36;
        v110[1] = &unk_1EA1C0AA0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v37, &unk_1EA1C0A10);

        v38 = v88;
        if (!v88)
          v38 = &unk_1EA1C0AA0;
        v107[0] = CFSTR("cost");
        v107[1] = CFSTR("overhead");
        v108[0] = v38;
        v108[1] = &unk_1EA1C0AA0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v39, &unk_1EA1C0A28);

        if (+[PLBatteryGaugeService shouldCalculateDisplayCost](PLBatteryGaugeService, "shouldCalculateDisplayCost"))
        {
          v40 = v85;
          if (!v85)
            v40 = &unk_1EA1C0AA0;
          v105[0] = CFSTR("cost");
          v105[1] = CFSTR("overhead");
          v106[0] = v40;
          v106[1] = &unk_1EA1C0AA0;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 2);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v41, &unk_1EA1C0A40);

        }
        v42 = v87;
        if (!v87)
          v42 = &unk_1EA1C0AA0;
        v103[0] = CFSTR("cost");
        v103[1] = CFSTR("overhead");
        v104[0] = v42;
        v104[1] = &unk_1EA1C0AA0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v43, &unk_1EA1C0A58);

        if (v86)
          v44 = v86;
        else
          v44 = &unk_1EA1C0BA8;
        v101[0] = CFSTR("cost");
        v101[1] = CFSTR("overhead");
        v102[0] = v44;
        v102[1] = &unk_1EA1C0BA8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v45, &unk_1EA1C0A70);

        v46 = (void *)objc_opt_new();
        objc_msgSend(v82, "setObject:forKey:", v46, v4);

        objc_msgSend(v82, "objectForKeyedSubscript:", v4);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setObject:forKey:", v5, CFSTR("usage_data"));

        -[PLBatteryGaugeService measurements](self, "measurements");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", v4);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectForKey:", CFSTR("Ongoing Location"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "intValue");

        if (!v51)
        {
          -[PLBatteryGaugeService measurements](self, "measurements");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKeyedSubscript:", v4);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setObject:forKey:", &unk_1EA1C0AA0, &unk_1EA1C09F8);

        }
        -[PLBatteryGaugeService measurements](self, "measurements");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKeyedSubscript:", v4);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "setObject:forKey:", &unk_1EA1C0AA0, &unk_1EA1C09C8);

        -[PLBatteryGaugeService measurements](self, "measurements");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "objectForKeyedSubscript:", v4);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setObject:forKey:", &unk_1EA1C0AA0, &unk_1EA1C0B78);

        -[PLBatteryGaugeService measurements](self, "measurements");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectForKeyedSubscript:", v4);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setObject:forKey:", &unk_1EA1C0AA0, &unk_1EA1C0B90);

        -[PLBatteryGaugeService measurements](self, "measurements");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectForKeyedSubscript:", v4);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setObject:forKey:", &unk_1EA1C0AA0, &unk_1EA1C09E0);

        -[PLBatteryGaugeService measurements](self, "measurements");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKeyedSubscript:", v4);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setObject:forKey:", &unk_1EA1C0AA0, &unk_1EA1C0A28);

        if (+[PLBatteryGaugeService shouldCalculateDisplayCost](PLBatteryGaugeService, "shouldCalculateDisplayCost"))
        {
          -[PLBatteryGaugeService measurements](self, "measurements");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", v4);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setObject:forKey:", &unk_1EA1C0AA0, &unk_1EA1C0A40);

        }
        -[PLBatteryGaugeService measurements](self, "measurements");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectForKeyedSubscript:", v4);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBatteryGaugeService lastQueryTime](self, "lastQueryTime");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setObject:forKey:", v68, CFSTR("start_time"));

        -[PLBatteryGaugeService measurements](self, "measurements");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "objectForKeyedSubscript:", v4);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBatteryGaugeService curQueryTime](self, "curQueryTime");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "setObject:forKey:", v71, CFSTR("stop_time"));

        -[PLBatteryGaugeService measurements](self, "measurements");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "objectForKeyedSubscript:", v4);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setObject:forKey:", &unk_1EA1C0B48, CFSTR("return_value"));

        -[PLBatteryGaugeService measurements](self, "measurements");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "objectForKeyedSubscript:", v4);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setObject:forKey:", &unk_1EA1C0B90, CFSTR("event"));

        v3 = v84 + 1;
      }
      while (v83 != v84 + 1);
      v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v121, 16);
    }
    while (v83);
  }

  PLLogBatteryGaugeService();
  v76 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService compileSnapshotResponse].cold.1((uint64_t)v82, self, v76);

  -[PLBatteryGaugeService convertRawUsageToScore:](self, "convertRawUsageToScore:", v82);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogBatteryGaugeService();
  v78 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v100 = v77;
    _os_log_impl(&dword_1DA9D6000, v78, OS_LOG_TYPE_INFO, "Compiled snapshot response: %@", buf, 0xCu);
  }

  return v77;
}

- (id)DTQueryResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  _QWORD block[5];
  _QWORD v27[6];
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogBatteryGaugeService();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1DA9D6000, v5, OS_LOG_TYPE_DEFAULT, "DT query payload received: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__12;
  v31 = __Block_byref_object_dispose__12;
  v32 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("battery_gauge_event"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  v8 = MEMORY[0x1E0C809B0];
  switch(v7)
  {
    case 0:
      -[PLBatteryGaugeService startRoutineWithPayload:](self, "startRoutineWithPayload:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v9;

      break;
    case 1:
      -[PLBatteryGaugeService stopRoutineWithPayload:](self, "stopRoutineWithPayload:", v4);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v11;

      break;
    case 2:
      -[PLBatteryGaugeService triggerAllData](self, "triggerAllData");
      PLLogBatteryGaugeService();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLBatteryGaugeService DTQueryResponse:].cold.1();

      -[PLBatteryGaugeService initResponseSemaphore](self, "initResponseSemaphore");
      -[PLBatteryGaugeService responseSemaphore](self, "responseSemaphore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v8;
      v27[1] = 3221225472;
      v27[2] = __41__PLBatteryGaugeService_DTQueryResponse___block_invoke;
      v27[3] = &unk_1EA16D8F8;
      v27[4] = self;
      v27[5] = &buf;
      objc_msgSend(v14, "waitWithBlockSync:", v27);

      break;
    case 3:
      -[PLBatteryGaugeService pauseRoutineWithPayload:](self, "pauseRoutineWithPayload:", v4);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v15;

      break;
    case 4:
      -[PLBatteryGaugeService resumeRoutineWithPayload:](self, "resumeRoutineWithPayload:", v4);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v17;

      break;
    case 5:
      -[PLBatteryGaugeService clearStateRoutine:](self, "clearStateRoutine:", v4);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v19;

      break;
    default:
      break;
  }
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __41__PLBatteryGaugeService_DTQueryResponse___block_invoke_163;
  block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  block[4] = objc_opt_class();
  if (DTQueryResponse__defaultOnce != -1)
    dispatch_once(&DTQueryResponse__defaultOnce, block);
  if (DTQueryResponse__classDebugEnabled)
  {
    -[PLBatteryGaugeService responseTime](self, "responseTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v22, v23);

  }
  -[PLBatteryGaugeService resetExitTimer](self, "resetExitTimer");
  v24 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v24;
}

void __41__PLBatteryGaugeService_DTQueryResponse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  PLLogBatteryGaugeService();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __41__PLBatteryGaugeService_DTQueryResponse___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "compileSnapshotResponse");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __41__PLBatteryGaugeService_DTQueryResponse___block_invoke_163(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  DTQueryResponse__classDebugEnabled = result;
  return result;
}

- (void)testGaugeServiceSingleInstance:(id)a3
{
  NSObject *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  PLLogBatteryGaugeService();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PLBatteryGaugeService testGaugeServiceSingleInstance:].cold.1();

  if (testGaugeServiceSingleInstance__iteration <= 14)
  {
    if (!testGaugeServiceSingleInstance__iteration)
    {
      v20[0] = CFSTR("pid");
      v20[1] = CFSTR("battery_gauge_event");
      v21[0] = &unk_1EA1C0BC0;
      v21[1] = &unk_1EA1C0AA0;
      v20[2] = CFSTR("time");
      v14 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSince1970");
      objc_msgSend(v14, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v9;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v21;
      v12 = v20;
      goto LABEL_16;
    }
    if (testGaugeServiceSingleInstance__iteration == 1)
    {
      v18[0] = CFSTR("pid");
      v18[1] = CFSTR("battery_gauge_event");
      v19[0] = &unk_1EA1C0BC0;
      v19[1] = &unk_1EA1C0AA0;
      v18[2] = CFSTR("time");
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSince1970");
      objc_msgSend(v7, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2] = v9;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v19;
      v12 = v18;
LABEL_16:
      objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
LABEL_17:
    v6 = &unk_1EA1D8620;
    goto LABEL_18;
  }
  if (testGaugeServiceSingleInstance__iteration != 15 && testGaugeServiceSingleInstance__iteration != 30)
  {
    if (testGaugeServiceSingleInstance__iteration == 10000)
    {
      v16[0] = CFSTR("pid");
      v16[1] = CFSTR("battery_gauge_event");
      v17[0] = &unk_1EA1C0BC0;
      v17[1] = &unk_1EA1C0B48;
      v16[2] = CFSTR("time");
      v13 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSince1970");
      objc_msgSend(v13, "numberWithDouble:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2] = v9;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = v17;
      v12 = v16;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v6 = 0;
LABEL_18:
  v15 = -[PLBatteryGaugeService DTQueryResponse:](self, "DTQueryResponse:", v6);
  ++testGaugeServiceSingleInstance__iteration;

}

- (void)testGaugeService
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E88]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "initWithFireDate:interval:target:selector:userInfo:repeats:", v4, self, sel_testGaugeServiceSingleInstance_, 0, 1, 1.0);

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addTimer:forMode:", v6, *MEMORY[0x1E0C99748]);

}

- (PLXPCResponderOperatorComposition)xpcResponderBatteryGaugeDT
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setXpcResponderBatteryGaugeDT:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)stopTime
{
  return self->_stopTime;
}

- (void)setStopTime:(double)a3
{
  self->_stopTime = a3;
}

- (NSMutableDictionary)measurements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMeasurements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableDictionary)bundleIDandPidMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBundleIDandPidMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableDictionary)requestTime
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRequestTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableDictionary)returnTime
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setReturnTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMutableDictionary)responseTime
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setResponseTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSMutableDictionary)entrykeyCallBackMapping
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setEntrykeyCallBackMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSMutableDictionary)entrykeyCallBackOnceMapping
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setEntrykeyCallBackOnceMapping:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLSemaphore)responseSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 144, 1);
}

- (void)setResponseSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDate)curQueryTime
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCurQueryTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSDate)lastQueryTime
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLastQueryTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (BOOL)isTestingRunning
{
  return self->_isTestingRunning;
}

- (void)setIsTestingRunning:(BOOL)a3
{
  self->_isTestingRunning = a3;
}

- (id)costElement
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setCostElement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (int)lastQueryCount
{
  return self->_lastQueryCount;
}

- (void)setLastQueryCount:(int)a3
{
  self->_lastQueryCount = a3;
}

- (int)curQueryCount
{
  return self->_curQueryCount;
}

- (void)setCurQueryCount:(int)a3
{
  self->_curQueryCount = a3;
}

- (NSMutableArray)trackedProcesses
{
  return (NSMutableArray *)objc_getProperty(self, a2, 176, 1);
}

- (void)setTrackedProcesses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSMutableDictionary)results
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSMutableDictionary)reported
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setReported:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (NSMutableDictionary)processMonitorResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 200, 1);
}

- (void)setProcessMonitorResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSMutableDictionary)reportedProcessMonitor
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setReportedProcessMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSMutableDictionary)processNetworkResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProcessNetworkResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSMutableDictionary)reportedProcessNetwork
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setReportedProcessNetwork:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSMutableDictionary)locationResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setLocationResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSMutableDictionary)reportedLocation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setReportedLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSMutableDictionary)applicationResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setApplicationResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSMutableDictionary)reportedApplication
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setReportedApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (NSSet)scoringEntities
{
  return (NSSet *)objc_getProperty(self, a2, 264, 1);
}

- (PLDTCostElement)networkingCostElement
{
  return (PLDTCostElement *)objc_getProperty(self, a2, 272, 1);
}

- (void)setNetworkingCostElement:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (NSTimer)exitTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 280, 1);
}

- (void)setExitTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (NSTimer)thermalStateTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 288, 1);
}

- (void)setThermalStateTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thermalStateTimer, 0);
  objc_storeStrong((id *)&self->_exitTimer, 0);
  objc_storeStrong((id *)&self->_networkingCostElement, 0);
  objc_storeStrong((id *)&self->_scoringEntities, 0);
  objc_storeStrong((id *)&self->_reportedApplication, 0);
  objc_storeStrong((id *)&self->_applicationResults, 0);
  objc_storeStrong((id *)&self->_reportedLocation, 0);
  objc_storeStrong((id *)&self->_locationResults, 0);
  objc_storeStrong((id *)&self->_reportedProcessNetwork, 0);
  objc_storeStrong((id *)&self->_processNetworkResults, 0);
  objc_storeStrong((id *)&self->_reportedProcessMonitor, 0);
  objc_storeStrong((id *)&self->_processMonitorResults, 0);
  objc_storeStrong((id *)&self->_reported, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_trackedProcesses, 0);
  objc_storeStrong(&self->_costElement, 0);
  objc_storeStrong((id *)&self->_lastQueryTime, 0);
  objc_storeStrong((id *)&self->_curQueryTime, 0);
  objc_storeStrong((id *)&self->_responseSemaphore, 0);
  objc_storeStrong((id *)&self->_entrykeyCallBackOnceMapping, 0);
  objc_storeStrong((id *)&self->_entrykeyCallBackMapping, 0);
  objc_storeStrong((id *)&self->_responseTime, 0);
  objc_storeStrong((id *)&self->_returnTime, 0);
  objc_storeStrong((id *)&self->_requestTime, 0);
  objc_storeStrong((id *)&self->_bundleIDandPidMap, 0);
  objc_storeStrong((id *)&self->_measurements, 0);
  objc_storeStrong((id *)&self->_xpcResponderBatteryGaugeDT, 0);
}

- (void)selfExit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_11_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: signalling PLBatteryGaugeService is becoming inactive!", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315906;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_5_2(&dword_1DA9D6000, v0, v1, "!!! %s/%d: payload=%@, response=%@", v2);
  OUTLINED_FUNCTION_4_1();
}

void __49__PLBatteryGaugeService_initOperatorDependancies__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Asked: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)parseProcessNetworkResults:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8[10];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("BundleName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "measurements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136315906;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_8_3(&dword_1DA9D6000, a3, v7, "!!! %s/%d: processNetworkEntry[@\"BundleName\"]=%@, measuerment=%@", (uint8_t *)v8);

  OUTLINED_FUNCTION_10_1();
}

- (void)parseLocationResults:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: no bundleID; userInfo=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)parseLocationResults:.cold.2()
{
  uint64_t v0;
  __int16 v1;
  uint64_t v2;
  os_log_t v3;
  _WORD v4[10];
  uint64_t v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)v4 = 136316162;
  OUTLINED_FUNCTION_0_2();
  *(_DWORD *)&v4[7] = 457;
  v4[9] = 2112;
  v5 = v0;
  v6 = v1;
  v7 = 0;
  v8 = 2112;
  v9 = v2;
  _os_log_debug_impl(&dword_1DA9D6000, v3, OS_LOG_TYPE_DEBUG, "!!! %s/%d: bundleId=%@, locationDesiredAccuracy=%d, userInfo=%@", (uint8_t *)v4, 0x2Cu);
}

- (void)parseApplicationResults:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "!!! pid=%@ is not tracked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)parseApplicationResults:(int)a1 .cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "!!! curApplicationState=%d", (uint8_t *)v2, 8u);
}

- (void)parseCoalitionResults:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _WORD v8[10];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "measurements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v8 = 136315906;
  OUTLINED_FUNCTION_0_2();
  *(_DWORD *)&v8[7] = 528;
  v8[9] = 2112;
  v9 = v6;
  v10 = 2112;
  v11 = a2;
  OUTLINED_FUNCTION_8_3(&dword_1DA9D6000, a3, v7, "!!! %s/%d: empty bundleIDandPidMap! measurements=%@, userInfo=%@", (uint8_t *)v8);

  OUTLINED_FUNCTION_10_1();
}

- (void)parseCoalitionResults:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "coalitionEntry=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)parseThermalStateCallback:(NSObject *)a3 .cold.1(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a3, (uint64_t)a3, "!!! current ThermalState=%llu, induced ThermalState=%lld", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)parseDisplayResults:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8[10];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("BundleName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "measurements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136315906;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_8_3(&dword_1DA9D6000, a3, v7, "!!! %s/%d: displayEntry[@\"BundleName\"]=%@, measuerment=%@", (uint8_t *)v8);

  OUTLINED_FUNCTION_10_1();
}

- (void)computeNetworkingCostWithWifiIn:(uint64_t)a3 withWifiOut:(uint64_t)a4 withCellIn:(uint64_t)a5 withCellOut:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a1, a3, "cost=%f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)computeLocationCostWithWifiCost:withGpsCost:withCellCost:withSkyhookCost:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: locationCost=%f", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)computeGPUCostWithGPUSec:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: gpuCost=%f", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)convertRawUsageToScore:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: rawUsage=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)requestDataFrom:withType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315906;
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_5_2(&dword_1DA9D6000, v0, v1, "!!! %s/%d: request entry:%@, requestTime=%@", v2);
  OUTLINED_FUNCTION_4_1();
}

- (void)dataReceivedFrom:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315906;
  OUTLINED_FUNCTION_14_3();
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_5_2(&dword_1DA9D6000, v0, v1, "!!! %s/%d: return entry:%@, returnTime=%@", v2);
  OUTLINED_FUNCTION_4_1();
}

- (void)extractAndTranslateProcessIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315906;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_5_2(&dword_1DA9D6000, v0, v1, "!!! %s/%d: response=%@, payload=%@", v2);
  OUTLINED_FUNCTION_4_1();
}

- (void)translateProcessIdentifierWithInput:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  _WORD v10[10];
  int v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("pid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("bundle_id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("process_name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v10 = 136316418;
  OUTLINED_FUNCTION_0_2();
  *(_DWORD *)&v10[7] = 901;
  v10[9] = v8;
  v11 = v5;
  v12 = 2112;
  v13 = v6;
  v14 = 2112;
  v15 = v9;
  v16 = 2112;
  v17 = a1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "!!! %s/%d: Pid=%d, BundleID=%@, ProcessName=%@, input=%@", (uint8_t *)v10, 0x36u);

}

- (void)extractAndSetProcessIdentifierWithPayload:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _WORD v8[10];
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("pid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("bundle_id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("process_name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)v8 = 136316418;
  OUTLINED_FUNCTION_0_2();
  *(_DWORD *)&v8[7] = 927;
  v8[9] = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = a1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "!!! %s/%d: Pid=%@, BundleID=%@, ProcessName=%@, response=%@", (uint8_t *)v8, 0x3Au);

}

- (void)extractAndSetProcessIdentifierWithPayload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: something wrong; cannot find valid process identifier; payload=%@",
    v2,
    v3,
    v4,
    v5,
    2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)startRoutineWithPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)startRoutineWithPayload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)startRoutineWithPayload:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)startRoutineWithPayload:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)startRoutineWithPayload:.cold.5()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315906;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_5_2(&dword_1DA9D6000, v0, v1, "!!! %s/%d: pid (%@) is tracked already; usageDict=%@", v2);
  OUTLINED_FUNCTION_4_1();
}

- (void)startRoutineWithPayload:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)startRoutineWithPayload:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)startRoutineWithPayload:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)startRoutineWithPayload:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)stopRoutineWithPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)stopRoutineWithPayload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: signalling PLBatteryGaugeService becoming inactive; usageDict=%@",
    v2,
    v3,
    v4,
    v5,
    2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)stopRoutineWithPayload:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)stopRoutineWithPayload:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: usageDict=%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_1();
}

- (void)stopRoutineWithPayload:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_11_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: no more process to track; signalling PLBatteryGaugeService becoming inactive!",
    v2,
    v3,
    v4,
    v5,
    2u);
  OUTLINED_FUNCTION_1();
}

- (void)clearStateRoutine:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_11_0(&dword_1DA9D6000, v0, v1, "!!! %s/%d: no more process to track; signaling PLBatteryGaugeService becoming inactive!",
    v2,
    v3,
    v4,
    v5,
    2u);
  OUTLINED_FUNCTION_1();
}

- (void)compileSnapshotResponse
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "measurements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a3, v6, "Constructed raw measurement dictionaries: %@, %@", (uint8_t *)&v7);

}

- (void)DTQueryResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_11_0(&dword_1DA9D6000, v0, v1, "%s/%d: trigger response timer!", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __41__PLBatteryGaugeService_DTQueryResponse___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_11_0(&dword_1DA9D6000, v0, v1, "%s/%d: response timer fired!", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)testGaugeServiceSingleInstance:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  _WORD v3[10];
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)v3 = 136315650;
  OUTLINED_FUNCTION_14_3();
  *(_DWORD *)&v3[7] = 1459;
  v3[9] = v0;
  v4 = v1;
  _os_log_debug_impl(&dword_1DA9D6000, v2, OS_LOG_TYPE_DEBUG, "%s/%d: iteration = %d", (uint8_t *)v3, 0x18u);
  OUTLINED_FUNCTION_1();
}

@end
