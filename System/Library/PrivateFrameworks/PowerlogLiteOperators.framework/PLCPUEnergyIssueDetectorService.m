@implementation PLCPUEnergyIssueDetectorService

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLCPUEnergyIssueDetectorService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitionAppRunTime
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLCPUEnergyIssueDetectorService)init
{
  PLCPUEnergyIssueDetectorService *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D80020], "seedBuild") & 1) == 0
    && !objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLCPUEnergyIssueDetectorService;
    self = -[PLOperator init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  id v3;
  uint64_t v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *cpuUsage;
  NSDictionary *v8;
  NSDictionary *cpuThresholds;
  NSArray *v10;
  NSArray *cpuAllowList;
  NSString *v12;
  void *v13;
  NSString *entryKeyPLCoalitionAgentEventIntervalCoalition;
  NSString *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];

  if ((objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) == 0
    && ((objc_msgSend(MEMORY[0x1E0D80020], "seedBuild") & 1) != 0
     || objc_msgSend(MEMORY[0x1E0D80020], "internalBuild")))
  {
    v3 = objc_alloc(MEMORY[0x1E0D80090]);
    v4 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__PLCPUEnergyIssueDetectorService_initOperatorDependancies__block_invoke;
    v20[3] = &unk_1E8578610;
    v20[4] = self;
    v5 = (void *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864CD28, v20);
    -[PLCPUEnergyIssueDetectorService setDetectorListener:](self, "setDetectorListener:", v5);

    self->_pluggedInBetweenCoalitionSBC = 0;
    self->_deviceIsPluggedIn = 0;
    v6 = (NSMutableDictionary *)objc_opt_new();
    cpuUsage = self->_cpuUsage;
    self->_cpuUsage = v6;

    -[PLCPUEnergyIssueDetectorService loadCpuThresholds](self, "loadCpuThresholds");
    v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    cpuThresholds = self->_cpuThresholds;
    self->_cpuThresholds = v8;

    -[PLCPUEnergyIssueDetectorService loadCPUAllowlist](self, "loadCPUAllowlist");
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cpuAllowList = self->_cpuAllowList;
    self->_cpuAllowList = v10;

    +[PLOperator entryKeyForType:andName:](PLCoalitionAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("CoalitionInterval"));
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v19[0] = v4;
    v19[1] = 3221225472;
    v19[2] = __59__PLCPUEnergyIssueDetectorService_initOperatorDependancies__block_invoke_2;
    v19[3] = &unk_1E8578710;
    v19[4] = self;
    -[PLCPUEnergyIssueDetectorService buildCallBack:withGroup:withHandler:](self, "buildCallBack:withGroup:withHandler:", v12, 1, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCPUEnergyIssueDetectorService setCoalitionCallback:](self, "setCoalitionCallback:", v13);

    entryKeyPLCoalitionAgentEventIntervalCoalition = self->_entryKeyPLCoalitionAgentEventIntervalCoalition;
    self->_entryKeyPLCoalitionAgentEventIntervalCoalition = v12;
    v15 = v12;

    +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("Battery"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __59__PLCPUEnergyIssueDetectorService_initOperatorDependancies__block_invoke_3;
    v18[3] = &unk_1E8578710;
    v18[4] = self;
    -[PLCPUEnergyIssueDetectorService buildCallBack:withGroup:withHandler:](self, "buildCallBack:withGroup:withHandler:", v16, 0, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCPUEnergyIssueDetectorService setBatteryCallback:](self, "setBatteryCallback:", v17);

  }
}

uint64_t __59__PLCPUEnergyIssueDetectorService_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendEnergyIssueSignatureNotification:withThreshold:", CFSTR("testApp"), 50.0);
}

uint64_t __59__PLCPUEnergyIssueDetectorService_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCoalitionCallback:", a2);
}

uint64_t __59__PLCPUEnergyIssueDetectorService_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBatteryCallback:", a2);
}

- (id)buildCallBack:(id)a3 withGroup:(BOOL)a4 withHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GroupID_%@"), v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__PLCPUEnergyIssueDetectorService_buildCallBack_withGroup_withHandler___block_invoke;
  v16[3] = &unk_1E8578760;
  v17 = v9;
  v13 = v9;
  v14 = (void *)objc_msgSend(v12, "initWithOperator:forEntryKey:withBlock:", self, v11, v16);

  return v14;
}

uint64_t __71__PLCPUEnergyIssueDetectorService_buildCallBack_withGroup_withHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)handleCoalitionCallback:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "monotonicDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("group"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLCPUEnergyIssueDetectorService entryKeyPLCoalitionAgentEventIntervalCoalition](self, "entryKeyPLCoalitionAgentEventIntervalCoalition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLCPUEnergyIssueDetectorService checkCpuUsage:withNewCoaltionArray:](self, "checkCpuUsage:withNewCoaltionArray:", v9, v8);
}

- (void)handleBatteryCallback:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExternalConnected"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("entry"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CurrentCapacity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("entry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MaxCapacity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  v15 = 0.0;
  if (v14 > 0.0)
    v15 = v10 * 100.0 / v14;
  v16 = objc_msgSend(MEMORY[0x1E0D80078], "isPingPongChargingWith:andBatteryLevelPercent:", v6, v15);
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("entry"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("IsCharging"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue") | v16;

  -[PLCPUEnergyIssueDetectorService setDeviceIsPluggedIn:](self, "setDeviceIsPluggedIn:", v19);
  if (-[PLCPUEnergyIssueDetectorService deviceIsPluggedIn](self, "deviceIsPluggedIn"))
    -[PLCPUEnergyIssueDetectorService setPluggedInBetweenCoalitionSBC:](self, "setPluggedInBetweenCoalitionSBC:", 1);

}

- (double)getCPUTime:(id)a3
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("cpu_time"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)checkCpuUsage:(id)a3 withNewCoaltionArray:(id)a4
{
  id v7;
  id v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  id v86;
  id v87;
  uint64_t v88;
  id obj;
  uint64_t v90;
  _QWORD v91[5];
  _QWORD v92[5];
  _QWORD v93[5];
  _QWORD block[5];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[5];
  uint8_t v100[128];
  uint8_t buf[4];
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (self->_detectionStartTime)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:");
    if (v9 > 3600.0)
      -[NSMutableDictionary removeAllObjects](self->_cpuUsage, "removeAllObjects");
  }
  else
  {
    objc_storeStrong((id *)&self->_detectionStartTime, a3);
  }
  v10 = 0x1E0D7F000uLL;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v11 = objc_opt_class();
    v99[0] = MEMORY[0x1E0C809B0];
    v99[1] = 3221225472;
    v99[2] = __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke;
    v99[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v99[4] = v11;
    if (qword_1ED884958 != -1)
      dispatch_once(&qword_1ED884958, v99);
    if (_MergedGlobals_1_44)
    {
      v12 = v8;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CPUEnergyIssueDetectorService: checkCpuUsage"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCPUEnergyIssueDetectorService checkCpuUsage:withNewCoaltionArray:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 223);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v102 = v13;
        _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v8 = v12;
      v10 = 0x1E0D7F000uLL;
    }
  }
  if (!-[PLCPUEnergyIssueDetectorService pluggedInBetweenCoalitionSBC](self, "pluggedInBetweenCoalitionSBC")
    && objc_msgSend(v8, "count"))
  {
    v86 = v8;
    v87 = v7;
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    obj = v8;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
    if (v19)
    {
      v20 = v19;
      v90 = *(_QWORD *)v96;
      do
      {
        v21 = 0;
        v88 = v20;
        do
        {
          if (*(_QWORD *)v96 != v90)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v21);
          if (objc_msgSend(*(id *)(v10 + 4000), "debugEnabled"))
          {
            v23 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_53;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v23;
            if (qword_1ED884960 != -1)
              dispatch_once(&qword_1ED884960, block);
            if (byte_1ED884951)
            {
              v24 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("LaunchdName"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BundleId"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "stringWithFormat:", CFSTR("CPUEnergyIssueDetectorService: entry[LaunchdName] = %@, entry[bunldeId]=%@"), v25, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              v28 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "lastPathComponent");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCPUEnergyIssueDetectorService checkCpuUsage:withNewCoaltionArray:]");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 229);

              PLLogCommon();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v102 = v27;
                _os_log_debug_impl(&dword_1CAF47000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v10 = 0x1E0D7F000uLL;
            }
          }
          objc_msgSend(MEMORY[0x1E0D80078], "getIdentifierFromEntry:", v22);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(v10 + 4000), "debugEnabled"))
          {
            v34 = objc_opt_class();
            v93[0] = MEMORY[0x1E0C809B0];
            v93[1] = 3221225472;
            v93[2] = __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_62;
            v93[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v93[4] = v34;
            if (qword_1ED884968 != -1)
              dispatch_once(&qword_1ED884968, v93);
            if (byte_1ED884952)
            {
              v35 = (void *)MEMORY[0x1E0CB3940];
              -[NSDictionary objectForKeyedSubscript:](self->_cpuThresholds, "objectForKeyedSubscript:", v33);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "doubleValue");
              objc_msgSend(v35, "stringWithFormat:", CFSTR("CPUEnergyIssueDetectorService: bundleId=%@, _cpuThreshold[bundleID]=%f"), v33, v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              v39 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "lastPathComponent");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCPUEnergyIssueDetectorService checkCpuUsage:withNewCoaltionArray:]");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v38, v41, v42, 234);

              PLLogCommon();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v102 = v38;
                _os_log_debug_impl(&dword_1CAF47000, v43, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v10 = 0x1E0D7F000uLL;
            }
          }
          if (v33)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("BundleId"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "length");

            if (!v45 && !-[NSArray containsObject:](self->_cpuAllowList, "containsObject:", v33))
            {
              if ((objc_msgSend(*(id *)(v10 + 4000), "debugEnabled") & 1) != 0)
              {
                v46 = objc_opt_class();
                v92[0] = MEMORY[0x1E0C809B0];
                v92[1] = 3221225472;
                v92[2] = __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_67;
                v92[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                v92[4] = v46;
                if (qword_1ED884970 != -1)
                  dispatch_once(&qword_1ED884970, v92);
                if (byte_1ED884953)
                {
                  v47 = (void *)MEMORY[0x1E0CB3940];
                  -[NSMutableDictionary objectForKeyedSubscript:](self->_cpuUsage, "objectForKeyedSubscript:", v33);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "doubleValue");
                  v50 = v49;
                  -[NSDictionary objectForKeyedSubscript:](self->_cpuThresholds, "objectForKeyedSubscript:", v33);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "doubleValue");
                  objc_msgSend(v47, "stringWithFormat:", CFSTR("CPUEnergyIssueDetectorService: bundleID=%@, cpuUsage=%f, threshold=%f"), v33, v50, v52);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();

                  v54 = (void *)MEMORY[0x1E0D7FF98];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "lastPathComponent");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCPUEnergyIssueDetectorService checkCpuUsage:withNewCoaltionArray:]");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "logMessage:fromFile:fromFunction:fromLineNumber:", v53, v56, v57, 255);

                  PLLogCommon();
                  v58 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v102 = v53;
                    _os_log_debug_impl(&dword_1CAF47000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                  }

                  v10 = 0x1E0D7F000;
                  v20 = v88;
                }
              }
              -[NSMutableDictionary objectForKey:](self->_cpuUsage, "objectForKey:", v33);
              v59 = (void *)objc_claimAutoreleasedReturnValue();

              v60 = (void *)MEMORY[0x1E0CB37E8];
              if (v59)
              {
                -[NSMutableDictionary objectForKeyedSubscript:](self->_cpuUsage, "objectForKeyedSubscript:", v33);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "doubleValue");
                v63 = v62;
                -[PLCPUEnergyIssueDetectorService getCPUTime:](self, "getCPUTime:", v22);
                objc_msgSend(v60, "numberWithDouble:", v63 + v64);
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cpuUsage, "setObject:forKeyedSubscript:", v65, v33);

              }
              else
              {
                -[PLCPUEnergyIssueDetectorService getCPUTime:](self, "getCPUTime:", v22);
                objc_msgSend(v60, "numberWithDouble:");
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cpuUsage, "setObject:forKeyedSubscript:", v61, v33);
              }

              -[NSDictionary objectForKey:](self->_cpuThresholds, "objectForKey:", v33);
              v66 = (void *)objc_claimAutoreleasedReturnValue();

              v67 = 2000.0;
              if (v66)
              {
                -[NSDictionary objectForKeyedSubscript:](self->_cpuThresholds, "objectForKeyedSubscript:", v33);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v68, "doubleValue");
                v67 = v69;

              }
              if (-[PLCPUEnergyIssueDetectorService customLongTermCPUThreshold](self, "customLongTermCPUThreshold") >= 1)
                v67 = (double)-[PLCPUEnergyIssueDetectorService customLongTermCPUThreshold](self, "customLongTermCPUThreshold");
              -[NSMutableDictionary objectForKeyedSubscript:](self->_cpuUsage, "objectForKeyedSubscript:", v33);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "doubleValue");
              v72 = v71;

              if (v72 > v67)
              {
                if (objc_msgSend(*(id *)(v10 + 4000), "debugEnabled"))
                {
                  v73 = objc_opt_class();
                  v91[0] = MEMORY[0x1E0C809B0];
                  v91[1] = 3221225472;
                  v91[2] = __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_73;
                  v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v91[4] = v73;
                  if (qword_1ED884978 != -1)
                    dispatch_once(&qword_1ED884978, v91);
                  if (byte_1ED884954)
                  {
                    v74 = (void *)MEMORY[0x1E0CB3940];
                    -[NSMutableDictionary objectForKeyedSubscript:](self->_cpuUsage, "objectForKeyedSubscript:", v33);
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "doubleValue");
                    v77 = v76;
                    -[NSDictionary objectForKeyedSubscript:](self->_cpuThresholds, "objectForKeyedSubscript:", v33);
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "doubleValue");
                    objc_msgSend(v74, "stringWithFormat:", CFSTR("CPUEnergyIssueDetectorService: CPU threshold crossed: %@ CPU usage of %f crossed threshold %f"), v33, v77, v79);
                    v80 = (void *)objc_claimAutoreleasedReturnValue();

                    v81 = (void *)MEMORY[0x1E0D7FF98];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v82, "lastPathComponent");
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCPUEnergyIssueDetectorService checkCpuUsage:withNewCoaltionArray:]");
                    v84 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v81, "logMessage:fromFile:fromFunction:fromLineNumber:", v80, v83, v84, 275);

                    PLLogCommon();
                    v85 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v102 = v80;
                      _os_log_debug_impl(&dword_1CAF47000, v85, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                    v10 = 0x1E0D7F000;
                  }
                }
                -[PLCPUEnergyIssueDetectorService sendEnergyIssueSignatureNotification:withThreshold:](self, "sendEnergyIssueSignatureNotification:withThreshold:", v33, v67);
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cpuUsage, "setObject:forKeyedSubscript:", &unk_1E8633A80, v33);
              }
            }
          }

          ++v21;
        }
        while (v20 != v21);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
      }
      while (v20);
    }

    v8 = v86;
    v7 = v87;
  }
  -[PLCPUEnergyIssueDetectorService setPluggedInBetweenCoalitionSBC:](self, "setPluggedInBetweenCoalitionSBC:", -[PLCPUEnergyIssueDetectorService deviceIsPluggedIn](self, "deviceIsPluggedIn"));

}

uint64_t __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_44 = result;
  return result;
}

uint64_t __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_53(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884951 = result;
  return result;
}

uint64_t __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_62(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884952 = result;
  return result;
}

uint64_t __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_67(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884953 = result;
  return result;
}

uint64_t __70__PLCPUEnergyIssueDetectorService_checkCpuUsage_withNewCoaltionArray___block_invoke_73(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884954 = result;
  return result;
}

- (void)listAllRunningPidsWithBuffer:(int *)a3 withSizeOfBuffer:(int)a4
{
  if (a4 >= 1)
    memset(a3, 255, 4 * a4);
  proc_listpids(1u, 0, a3, 4 * a4);
}

- (int)matchingPidWithProcessName:(id)a3 withBundleID:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  int v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  unint64_t v26;
  void *context;
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  _BYTE v31[4096];
  uint64_t v32;

  v4 = MEMORY[0x1E0C80A78](self);
  v6 = v5;
  v7 = (void *)v4;
  v32 = *MEMORY[0x1E0C80C00];
  v9 = v8;
  v10 = v6;
  context = (void *)MEMORY[0x1D179C2E0]();
  objc_msgSend(v7, "listAllRunningPidsWithBuffer:withSizeOfBuffer:", v31, 1024);
  v11 = proc_listpids(1u, 0, 0, 0);
  v12 = 0;
  if (v11 >= 4)
  {
    v13 = 0;
    v14 = (unint64_t)v11 >> 2;
    v15 = (unsigned int *)v31;
    v16 = 0x1E0D7F000uLL;
    v26 = v14;
    while (1)
    {
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0D80078], "processNameForPid:", *v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(v16 + 4000), "debugEnabled"))
        {
          v18 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __75__PLCPUEnergyIssueDetectorService_matchingPidWithProcessName_withBundleID___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v18;
          if (qword_1ED884980 != -1)
            dispatch_once(&qword_1ED884980, block);
          if (byte_1ED884955)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pid[%d]=%@"), *v15, v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "lastPathComponent");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCPUEnergyIssueDetectorService matchingPidWithProcessName:withBundleID:]");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 319);

            PLLogCommon();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v19;
              _os_log_debug_impl(&dword_1CAF47000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v14 = v26;
            v16 = 0x1E0D7F000;
          }
        }
        if ((objc_msgSend(v17, "isEqualToString:", v9) & 1) != 0)
        {
LABEL_19:
          v12 = *v15;

          break;
        }

      }
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0D80078], "bundleIDFromPid:", *v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToString:", v17) & 1) != 0)
          goto LABEL_19;

      }
      v12 = 0;
      if (v13 <= 0x3FE)
      {
        ++v13;
        ++v15;
        if (v14 > v13)
          continue;
      }
      break;
    }
  }
  objc_autoreleasePoolPop(context);

  return v12;
}

uint64_t __75__PLCPUEnergyIssueDetectorService_matchingPidWithProcessName_withBundleID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884955 = result;
  return result;
}

- (void)sendEnergyIssueSignatureNotification:(id)a3 withThreshold:(double)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("Energy"), CFSTR("CPU"), CFSTR("LongTerm"), &stru_1E8587D00, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __86__PLCPUEnergyIssueDetectorService_sendEnergyIssueSignatureNotification_withThreshold___block_invoke;
    v10[3] = &unk_1E8578710;
    v10[4] = self;
    objc_msgSend(v7, "snapshotWithSignature:duration:events:payload:actions:reply:", v9, 0, 0, 0, v10, 120.0);

  }
}

void __86__PLCPUEnergyIssueDetectorService_sendEnergyIssueSignatureNotification_withThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD block[5];
  uint8_t buf[4];
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A0]);
    v5 = objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_16;
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__PLCPUEnergyIssueDetectorService_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1ED884988 != -1)
      dispatch_once(&qword_1ED884988, block);
    if (!byte_1ED884956)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SDRDiagnosticReporter response = %@, sessionID = %@"), v2, v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCPUEnergyIssueDetectorService sendEnergyIssueSignatureNotification:withThreshold:]_block_invoke");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 359);

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_15:
LABEL_16:

    goto LABEL_17;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v13 = objc_opt_class();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __86__PLCPUEnergyIssueDetectorService_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_95;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = v13;
    if (qword_1ED884990 != -1)
      dispatch_once(&qword_1ED884990, v18);
    if (byte_1ED884957)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SDRDiagnosticReporter dampened"));
      v5 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLCPUEnergyIssueDetectorService.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLCPUEnergyIssueDetectorService sendEnergyIssueSignatureNotification:withThreshold:]_block_invoke_2");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v16, v17, 362);

      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v5;
        _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_15;
    }
  }
LABEL_17:

}

uint64_t __86__PLCPUEnergyIssueDetectorService_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884956 = result;
  return result;
}

uint64_t __86__PLCPUEnergyIssueDetectorService_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_95(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED884957 = result;
  return result;
}

- (id)loadCPUAllowlist
{
  NSArray *cpuAllowList;
  NSArray *v4;
  NSArray *v5;

  cpuAllowList = self->_cpuAllowList;
  if (!cpuAllowList)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("Maps_mapspushd"), CFSTR("NPKCompanionAgent"), CFSTR("OTACrashCopier"), CFSTR("Springboard"), CFSTR("askpermissiond"), CFSTR("familynotification"), CFSTR("fileprovider_fileproviderd"), CFSTR("homed"), CFSTR("mobile_lockdown"), CFSTR("mobile_softwareupdated"), CFSTR("mobile.softwareupdated"), CFSTR("abm-helper"), CFSTR("pairedsyncd"), CFSTR("passd"), CFSTR("pipelined"), CFSTR("prdaily"), CFSTR("seld"),
      CFSTR("tipsd"),
      CFSTR("wcd"),
      CFSTR("kernel_task"),
      CFSTR("ReportCrash"),
      0);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cpuAllowList;
    self->_cpuAllowList = v4;

    cpuAllowList = self->_cpuAllowList;
  }
  return cpuAllowList;
}

- (id)loadCpuThresholds
{
  NSDictionary *cpuThresholds;

  cpuThresholds = self->_cpuThresholds;
  if (!cpuThresholds)
  {
    self->_cpuThresholds = (NSDictionary *)&unk_1E864CD50;
    cpuThresholds = self->_cpuThresholds;
  }
  return cpuThresholds;
}

- (int)customLongTermCPUThreshold
{
  if (qword_1ED884998 != -1)
    dispatch_once(&qword_1ED884998, &__block_literal_global_36);
  if (qword_1ED8849A0)
    return objc_msgSend((id)qword_1ED8849A0, "intValue");
  else
    return -1;
}

void __61__PLCPUEnergyIssueDetectorService_customLongTermCPUThreshold__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D80078], "containerPath");
  v0 = _CFPreferencesCopyValueWithContainer();
  v1 = (void *)qword_1ED8849A0;
  qword_1ED8849A0 = v0;

}

- (PLEntryNotificationOperatorComposition)coalitionCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCoalitionCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLEntryNotificationOperatorComposition)batteryCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBatteryCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)entryKeyPLCoalitionAgentEventIntervalCoalition
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)deviceIsPluggedIn
{
  return self->_deviceIsPluggedIn;
}

- (void)setDeviceIsPluggedIn:(BOOL)a3
{
  self->_deviceIsPluggedIn = a3;
}

- (BOOL)pluggedInBetweenCoalitionSBC
{
  return self->_pluggedInBetweenCoalitionSBC;
}

- (void)setPluggedInBetweenCoalitionSBC:(BOOL)a3
{
  self->_pluggedInBetweenCoalitionSBC = a3;
}

- (NSMutableDictionary)cpuUsage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setCpuUsage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)cpuAllowList
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCpuAllowList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDictionary)cpuThresholds
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCpuThresholds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDate)detectionStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDetectionStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLXPCListenerOperatorComposition)detectorListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDetectorListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectorListener, 0);
  objc_storeStrong((id *)&self->_detectionStartTime, 0);
  objc_storeStrong((id *)&self->_cpuThresholds, 0);
  objc_storeStrong((id *)&self->_cpuAllowList, 0);
  objc_storeStrong((id *)&self->_cpuUsage, 0);
  objc_storeStrong((id *)&self->_entryKeyPLCoalitionAgentEventIntervalCoalition, 0);
  objc_storeStrong((id *)&self->_batteryCallback, 0);
  objc_storeStrong((id *)&self->_coalitionCallback, 0);
}

@end
