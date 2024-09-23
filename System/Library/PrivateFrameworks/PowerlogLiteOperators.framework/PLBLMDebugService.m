@implementation PLBLMDebugService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBLMDebugService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventNoneDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("BLMQADebug");
  objc_msgSend(a1, "entryEventNoneDefinitionBLMDebug");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventNoneDefinitionBLMDebug
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  _QWORD v24[9];
  _QWORD v25[9];
  uint64_t v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x1E0C80C00];
  v28[0] = *MEMORY[0x1E0D80298];
  v26 = *MEMORY[0x1E0D80318];
  v27 = &unk_1E8653100;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E0D802F0];
  v24[0] = CFSTR("trigger_name");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "commonTypeDict_StringFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  v24[1] = CFSTR("trigger_start_time");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "commonTypeDict_DateFormat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v24[2] = CFSTR("trigger_stop_time");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commonTypeDict_DateFormat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("trigger_start_time_monotonic");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commonTypeDict_DateFormat");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v15;
  v24[4] = CFSTR("trigger_stop_time_monotonic");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commonTypeDict_DateFormat");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v13;
  v24[5] = CFSTR("trigger_diff_time");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "commonTypeDict_RealFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v3;
  v24[6] = CFSTR("rootnodeid");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v5;
  v24[7] = CFSTR("railpower");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[7] = v7;
  v24[8] = CFSTR("SafeTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_RealFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[8] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)isModelTriggerRun
{
  if (qword_1ED8834E8 != -1)
    dispatch_once(&qword_1ED8834E8, &__block_literal_global_30);
  return _MergedGlobals_1_34;
}

uint64_t __38__PLBLMDebugService_isModelTriggerRun__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:", CFSTR("ModelTrigger"));
  _MergedGlobals_1_34 = result;
  return result;
}

- (PLBLMDebugService)init
{
  PLBLMDebugService *v3;
  uint64_t v4;
  NSMutableDictionary *triggers;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  PLBLMDebugService *v13;
  _QWORD block[5];
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) == 0
    && objc_msgSend(MEMORY[0x1E0D80020], "internalBuild")
    && ((objc_msgSend(MEMORY[0x1E0D7FFA0], "isDevBoard") & 1) != 0
     || (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled") & 1) != 0
     || +[PLBLMDebugService isModelTriggerRun](PLBLMDebugService, "isModelTriggerRun")))
  {
    v16.receiver = self;
    v16.super_class = (Class)PLBLMDebugService;
    v3 = -[PLOperator init](&v16, sel_init);
    if (v3)
    {
      v4 = objc_opt_new();
      triggers = v3->_triggers;
      v3->_triggers = (NSMutableDictionary *)v4;

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v6 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __25__PLBLMDebugService_init__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v6;
        if (qword_1ED8834F0 != -1)
          dispatch_once(&qword_1ED8834F0, block);
        if (byte_1ED8834D9)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Inited Trigger"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastPathComponent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLMDebugService init]");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 105);

          PLLogCommon();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v7;
            _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
    }
    self = v3;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __25__PLBLMDebugService_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834D9 = result;
  return result;
}

- (void)initOperatorDependancies
{
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
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
  _QWORD v27[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild")
    && ((objc_msgSend(MEMORY[0x1E0D7FFA0], "isDevBoard") & 1) != 0
     || (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled") & 1) != 0
     || +[PLBLMDebugService isModelTriggerRun](PLBLMDebugService, "isModelTriggerRun")))
  {
    v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    v4 = MEMORY[0x1E0C809B0];
    if (v3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__PLBLMDebugService_initOperatorDependancies__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = objc_opt_class();
      if (qword_1ED8834F8 != -1)
        dispatch_once(&qword_1ED8834F8, block);
      if (byte_1ED8834DA)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Initoperators for triggers"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLMDebugService initOperatorDependancies]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 115);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v5;
          _os_log_debug_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v27[0] = v4;
    v27[1] = 3221225472;
    v27[2] = __45__PLBLMDebugService_initOperatorDependancies__block_invoke_49;
    v27[3] = &unk_1E8578610;
    v27[4] = self;
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C698, v27);
    -[PLBLMDebugService setXpcListenerBLMDebugTrigger:](self, "setXpcListenerBLMDebugTrigger:", v26);
    v11 = *MEMORY[0x1E0D80370];
    +[PLOperator entryKeyForType:andName:](PLIOReportAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("EnergyModel"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, v25, &__block_literal_global_57_0);
    -[PLBLMDebugService setIoreportCallback:](self, "setIoreportCallback:", v24);
    +[PLOperator entryKeyForType:andName:](PLProcessNetworkAgent, "entryKeyForType:andName:", v11, CFSTR("Usage"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, v23, &__block_literal_global_59);
    -[PLBLMDebugService setProcessnetworkCallback:](self, "setProcessnetworkCallback:", v12);
    +[PLOperator entryKeyForType:andName:](PLWifiAgent, "entryKeyForType:andName:", v11, CFSTR("DiffProperties"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, v13, &__block_literal_global_61);
    -[PLBLMDebugService setWifiCallback:](self, "setWifiCallback:", v14);
    v15 = *MEMORY[0x1E0D80388];
    +[PLBBAgent getNameBBReport](PLBBAgent, "getNameBBReport");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLOperator entryKeyForType:andName:](PLBBAgent, "entryKeyForType:andName:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, v17, &__block_literal_global_63);
    -[PLBLMDebugService setBbCallback:](self, "setBbCallback:", v18);
    +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", v11, CFSTR("PowerProfileStats"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, v19, &__block_literal_global_65_0);
    -[PLBLMDebugService setBtCallback:](self, "setBtCallback:", v20);
    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", v11, CFSTR("APLStats"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, v21, &__block_literal_global_67);
    -[PLBLMDebugService setDisplayAPLCallback:](self, "setDisplayAPLCallback:", v22);

  }
}

uint64_t __45__PLBLMDebugService_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834DA = result;
  return result;
}

void __45__PLBLMDebugService_initOperatorDependancies__block_invoke_49(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a5;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Asked Trigger: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLMDebugService initOperatorDependancies]_block_invoke");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 118);

  PLLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "registerTrigger:", v7);
}

- (void)registerTrigger:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
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
  uint64_t block;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  void *v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __37__PLBLMDebugService_registerTrigger___block_invoke;
    v36 = &__block_descriptor_40_e5_v8__0lu32l8;
    v37 = v5;
    if (qword_1ED883500 != -1)
      dispatch_once(&qword_1ED883500, &block);
    if (byte_1ED8834DB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Got a trigger %@"), v4, block, v34, v35, v36, v37);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLMDebugService registerTrigger:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 162);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v41 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trigger_name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  -[PLBLMDebugService triggers](self, "triggers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v12);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trigger_start_time"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trigger_diff_time"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  if (v17 == -1.0)
  {
    -[PLBLMDebugService triggerLoggersNow:](self, "triggerLoggersNow:", 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "convertFromSystemToMonotonic");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBLMDebugService triggerSelectorAtDate:withSelector:withUseInfo:](self, "triggerSelectorAtDate:withSelector:withUseInfo:", v21, sel_triggerLoggersNow_, 0);
  }
  objc_msgSend(v21, "dateByAddingTimeInterval:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v23, 65.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBLMDebugService triggers](self, "triggers");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v21, CFSTR("trigger_start_time"));

  -[PLBLMDebugService triggers](self, "triggers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v23, CFSTR("trigger_stop_time"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBLMDebugService triggers](self, "triggers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v29, CFSTR("trigger_diff_time"));

  -[PLBLMDebugService triggerSelectorAtDate:withSelector:withUseInfo:](self, "triggerSelectorAtDate:withSelector:withUseInfo:", v23, sel_triggerLoggersNow_, 0);
  v38 = CFSTR("trigger_name");
  v39 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBLMDebugService triggerSelectorAtDate:withSelector:withUseInfo:](self, "triggerSelectorAtDate:withSelector:withUseInfo:", v24, sel_respondBLMDDebugQuery_, v32);

}

uint64_t __37__PLBLMDebugService_registerTrigger___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834DB = result;
  return result;
}

- (void)triggerSelectorAtDate:(id)a3 withSelector:(SEL)a4 withUseInfo:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v10 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PLBLMDebugService_triggerSelectorAtDate_withSelector_withUseInfo___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1ED883508 != -1)
      dispatch_once(&qword_1ED883508, block);
    if (byte_1ED8834DC)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setting time at date %@ %@"), v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLMDebugService triggerSelectorAtDate:withSelector:withUseInfo:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 189);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v11;
        _os_log_debug_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v17 = objc_alloc(MEMORY[0x1E0C99E88]);
  objc_msgSend(v8, "convertFromMonotonicToSystem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithFireDate:interval:target:selector:userInfo:repeats:", v18, self, a4, v9, 0, 0.0);

  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addTimer:forMode:", v19, *MEMORY[0x1E0C99748]);

}

uint64_t __68__PLBLMDebugService_triggerSelectorAtDate_withSelector_withUseInfo___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834DC = result;
  return result;
}

- (void)triggerLoggersNow:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t block;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __39__PLBLMDebugService_triggerLoggersNow___block_invoke;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = v5;
    if (qword_1ED883510 != -1)
      dispatch_once(&qword_1ED883510, &block);
    if (byte_1ED8834DD)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Triggering Now %@"), v4, block, v16, v17, v18, v19);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLMDebugService triggerLoggersNow:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 199);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v6;
        _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D80078], "postNotificationName:object:userInfo:", CFSTR("PLBatteryAgent_EventBackward_Battery.filtered.Level_0_1.Level_7_1800.Level_8_300"), self, v12);
  -[PLBLMDebugService displayAPLCallback](self, "displayAPLCallback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestEntry");

  sleep(1u);
  -[PLBLMDebugService bbCallback](self, "bbCallback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestEntry");

}

uint64_t __39__PLBLMDebugService_triggerLoggersNow___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834DD = result;
  return result;
}

- (id)respondBLMDDebugQuery:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
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
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  const __CFString *v42;
  PLBLMDebugService *v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id obj;
  _QWORD block[5];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[5];
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0x1E0D7F000uLL;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __43__PLBLMDebugService_respondBLMDDebugQuery___block_invoke;
    v64[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v64[4] = v6;
    if (qword_1ED883518 != -1)
      dispatch_once(&qword_1ED883518, v64);
    if (byte_1ED8834DE)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("responding to query %@"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLMDebugService respondBLMDDebugQuery:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 217);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v4, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("trigger_name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBLMDebugService triggers](self, "triggers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v54 = v4;
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("trigger_name"));
    -[PLBLMDebugService triggers](self, "triggers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v15);
    v19 = v15;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("trigger_start_time"));
    v56 = v13;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, CFSTR("trigger_start_time"));

    -[PLBLMDebugService triggers](self, "triggers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v19;
    objc_msgSend(v22, "objectForKeyedSubscript:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("trigger_stop_time"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v24, CFSTR("trigger_stop_time"));

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("trigger_start_time"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v56;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("trigger_stop_time"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSince1970");
    v28 = v27;
    objc_msgSend(v26, "timeIntervalSince1970");
    v30 = v29;

    v31 = (void *)objc_opt_new();
    v53 = v14;
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v31, CFSTR("trigger_rail_data"));

    objc_msgSend(MEMORY[0x1E0D7FED8], "deviceRootNodeIDs");
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (v32)
    {
      v33 = v32;
      v34 = v30 - v28;
      v35 = CFSTR("trigger_name");
      v36 = *(_QWORD *)v61;
      v55 = *(_QWORD *)v61;
      do
      {
        v37 = 0;
        v57 = v33;
        do
        {
          if (*(_QWORD *)v61 != v36)
            objc_enumerationMutation(obj);
          v38 = objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v37), "intValue");
          objc_msgSend(v13, "objectForKeyedSubscript:", v35);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBLMDebugService logRailData:withTriggerName:inTimeRange:](self, "logRailData:withTriggerName:inTimeRange:", v38, v39, v28, v34);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(*(id *)(v5 + 4000), "debugEnabled"))
          {
            v41 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __43__PLBLMDebugService_respondBLMDDebugQuery___block_invoke_92;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v41;
            if (qword_1ED883520 != -1)
              dispatch_once(&qword_1ED883520, block);
            if (byte_1ED8834DF)
            {
              v42 = v35;
              v43 = self;
              v44 = v5;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Written %@"), v40);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "lastPathComponent");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLMDebugService respondBLMDDebugQuery:]");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v48, v49, 232);

              PLLogCommon();
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v67 = v45;
                _os_log_debug_impl(&dword_1CAF47000, v50, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v5 = v44;
              self = v43;
              v35 = v42;
              v13 = v56;
              v33 = v57;
              v36 = v55;
            }
          }

          ++v37;
        }
        while (v33 != v37);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      }
      while (v33);
    }

    v14 = v53;
    v4 = v54;
    v15 = v52;
  }

  return v14;
}

uint64_t __43__PLBLMDebugService_respondBLMDDebugQuery___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834DE = result;
  return result;
}

uint64_t __43__PLBLMDebugService_respondBLMDDebugQuery___block_invoke_92(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834DF = result;
  return result;
}

- (id)logRailData:(int)a3 withTriggerName:(id)a4 inTimeRange:(_PLTimeIntervalRange)a5
{
  double var1;
  double var0;
  uint64_t v7;
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
  NSObject *v20;
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
  double v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v41;
  _QWORD block[5];
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  var1 = a5.var1;
  var0 = a5.var0;
  v7 = *(_QWORD *)&a3;
  v45 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v10 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PLBLMDebugService_logRailData_withTriggerName_inTimeRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v10;
    if (qword_1ED883528 != -1)
      dispatch_once(&qword_1ED883528, block);
    if (byte_1ED8834E0)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", var0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", var0 + var1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("Start: %@, End %@"), v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "stringWithFormat:", CFSTR("Logging rail data %li %@ %@"), (int)v7, v9, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLMDebugService logRailData:withTriggerName:inTimeRange:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 239);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v41 = v7;
  +[PLOperator entryKeyForType:andName:](PLBLMDebugService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("BLMQADebug"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v21);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v9, CFSTR("trigger_name"));
  -[PLBLMDebugService triggers](self, "triggers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("trigger_start_time"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBLMDebugService triggers](self, "triggers");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", v9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("trigger_stop_time"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v25, "convertFromMonotonicToSystem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v29, CFSTR("trigger_start_time"));

    objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, CFSTR("trigger_start_time_monotonic"));
  }
  if (v28)
  {
    objc_msgSend(v28, "convertFromMonotonicToSystem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, CFSTR("trigger_stop_time"));

    objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, CFSTR("trigger_stop_time_monotonic"));
  }
  -[PLBLMDebugService triggers](self, "triggers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", v9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("trigger_diff_time"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v33, CFSTR("trigger_diff_time"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v41);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v34, CFSTR("rootnodeid"));

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "timeIntervalSince1970");
  v37 = v36;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v38, CFSTR("SafeTime"));

  if (v37 >= var0 + var1)
  {
    -[PLBLMDebugService energyForRootNodeID:withRange:](self, "energyForRootNodeID:withRange:", v41, var0, var1);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v39, CFSTR("railpower"));

  }
  else
  {
    objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1E86335E8, CFSTR("railpower"));
  }
  -[PLOperator logEntry:](self, "logEntry:", v22);

  return v22;
}

uint64_t __61__PLBLMDebugService_logRailData_withTriggerName_inTimeRange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834E0 = result;
  return result;
}

- (double)energyForRootNodeID:(int)a3 withRange:(_PLTimeIntervalRange)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t i;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  _QWORD block[5];
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(timestamp+%@)>%f AND (timestamp+%@)<%f AND %@=%i"), *MEMORY[0x1E0D801B8], *(_QWORD *)&a4.var0, *MEMORY[0x1E0D801D8], a4.var0 + a4.var1, *MEMORY[0x1E0D801C8], *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D7FED0], "entryKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("SELECT * FROM '%@' WHERE (%@);"), v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v9 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PLBLMDebugService_energyForRootNodeID_withRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1ED883530 != -1)
      dispatch_once(&qword_1ED883530, block);
    if (byte_1ED8834E1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rootNodeEnergyQuery=%@"), v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLMDebugService energyForRootNodeID:withRange:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 283);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v10;
        _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  -[PLOperator storage](self, "storage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FED0], "entryKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "entriesForKey:withQuery:", v17, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v19 = objc_opt_class();
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __51__PLBLMDebugService_energyForRootNodeID_withRange___block_invoke_108;
    v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v46[4] = v19;
    if (qword_1ED883538 != -1)
      dispatch_once(&qword_1ED883538, v46);
    if (byte_1ED8834E2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rootNodeEnergyEntries=%@"), v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLMDebugService energyForRootNodeID:withRange:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 287);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v20;
        _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v26 = v18;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v43;
    v30 = 0.0;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "energy");
        v30 = v30 + v32;
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v28);
  }
  else
  {
    v30 = 0.0;
  }

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v33 = objc_opt_class();
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __51__PLBLMDebugService_energyForRootNodeID_withRange___block_invoke_113;
    v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v41[4] = v33;
    if (qword_1ED883540 != -1)
      dispatch_once(&qword_1ED883540, v41);
    if (byte_1ED8834E3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("totalEnergy=%f"), *(_QWORD *)&v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLMDebugService.m");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "lastPathComponent");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLMDebugService energyForRootNodeID:withRange:]");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v37, v38, 294);

      PLLogCommon();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v34;
        _os_log_debug_impl(&dword_1CAF47000, v39, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }

  return v30;
}

uint64_t __51__PLBLMDebugService_energyForRootNodeID_withRange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834E1 = result;
  return result;
}

uint64_t __51__PLBLMDebugService_energyForRootNodeID_withRange___block_invoke_108(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834E2 = result;
  return result;
}

uint64_t __51__PLBLMDebugService_energyForRootNodeID_withRange___block_invoke_113(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8834E3 = result;
  return result;
}

- (id)Testservice:(id)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E86335E8, CFSTR("trigger_start_time"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E8633600, CFSTR("trigger_diff_time"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Abcd"), CFSTR("trigger_name"));
  -[PLBLMDebugService registerTrigger:](self, "registerTrigger:", v4);

  return 0;
}

- (void)debugTrigger
{
  id v3;
  void *v4;
  void *v5;
  PLTimer *v6;
  PLTimer *debugTimers;
  _QWORD v8[5];

  v3 = objc_alloc(MEMORY[0x1E0D80070]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__PLBLMDebugService_debugTrigger__block_invoke;
  v8[3] = &unk_1E8578078;
  v8[4] = self;
  v6 = (PLTimer *)objc_msgSend(v3, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v4, 1, 0, v5, v8, 20.0, 0.0);
  debugTimers = self->_debugTimers;
  self->_debugTimers = v6;

}

uint64_t __33__PLBLMDebugService_debugTrigger__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "triggerLoggersNow:", 0);
}

- (PLXPCListenerOperatorComposition)xpcListenerBLMDebugTrigger
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setXpcListenerBLMDebugTrigger:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLEntryNotificationOperatorComposition)ioreportCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setIoreportCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLEntryNotificationOperatorComposition)processnetworkCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProcessnetworkCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLEntryNotificationOperatorComposition)wifiCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setWifiCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLEntryNotificationOperatorComposition)bbCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBbCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLEntryNotificationOperatorComposition)btCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBtCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLEntryNotificationOperatorComposition)displayAPLCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDisplayAPLCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLTimer)debugTimers
{
  return (PLTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDebugTimers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableDictionary)triggers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTriggers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_debugTimers, 0);
  objc_storeStrong((id *)&self->_displayAPLCallback, 0);
  objc_storeStrong((id *)&self->_btCallback, 0);
  objc_storeStrong((id *)&self->_bbCallback, 0);
  objc_storeStrong((id *)&self->_wifiCallback, 0);
  objc_storeStrong((id *)&self->_processnetworkCallback, 0);
  objc_storeStrong((id *)&self->_ioreportCallback, 0);
  objc_storeStrong((id *)&self->_xpcListenerBLMDebugTrigger, 0);
}

@end
