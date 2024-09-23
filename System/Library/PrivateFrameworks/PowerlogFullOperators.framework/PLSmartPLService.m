@implementation PLSmartPLService

+ (id)defaults
{
  return &unk_24EB64B68;
}

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("SmartTrigger");
  objc_msgSend(a1, "entryEventPointDefinitionSmartTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("Sample");
  v8[0] = v3;
  objc_msgSend(a1, "entryEventPointDefinitionSample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryEventPointDefinitionSmartTrigger
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v15[0] = *MEMORY[0x24BE751D0];
  v2 = *MEMORY[0x24BE751B0];
  v13[0] = *MEMORY[0x24BE751F8];
  v13[1] = v2;
  v14[0] = &unk_24EB64670;
  v14[1] = MEMORY[0x24BDBD1C8];
  v13[2] = *MEMORY[0x24BE751F0];
  v14[2] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x24BE751E8];
  v11[0] = CFSTR("Helper");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("Reason");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventPointDefinitionSample
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
  _QWORD v12[3];
  _QWORD v13[3];
  uint64_t v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v16[0] = *MEMORY[0x24BE751D0];
  v14 = *MEMORY[0x24BE751F8];
  v15 = &unk_24EB64670;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v2;
  v16[1] = *MEMORY[0x24BE751E8];
  v12[0] = CFSTR("PID");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_StringFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  v12[2] = CFSTR("Sample");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSmartPLService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLSmartPLService)init
{
  PLSmartPLService *v3;
  PLSmartPLService *v4;
  uint64_t v5;
  NSMutableDictionary *smartPLHelpers;
  objc_super v8;

  if ((objc_msgSend(MEMORY[0x24BE74FD8], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLSmartPLService;
    v4 = -[PLOperator init](&v8, sel_init);
    if (v4)
    {
      v5 = objc_opt_new();
      smartPLHelpers = v4->_smartPLHelpers;
      v4->_smartPLHelpers = (NSMutableDictionary *)v5;

    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;

  v10 = (id)objc_opt_new();
  objc_msgSend(v10, "startWithOperator:", self);
  -[PLSmartPLService smartPLHelpers](self, "smartPLHelpers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v5);

  if (objc_msgSend(MEMORY[0x24BE74FB0], "BOOLForKey:ifNotSet:", CFSTR("MemoryTrackingEnabled"), 0))
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "startWithOperator:", self);
    -[PLSmartPLService smartPLHelpers](self, "smartPLHelpers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v9);

  }
}

- (void)logEventPointSmartPLFiredFromAuxilary:(Class)a3 withReason:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = *MEMORY[0x24BE75230];
  v7 = a4;
  +[PLOperator entryKeyForType:andName:](PLSmartPLService, "entryKeyForType:andName:", v6, CFSTR("SmartTrigger"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v10);
  NSStringFromClass(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("Helper"));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("Resason"));
  -[PLOperator logEntry:](self, "logEntry:", v8);

}

- (void)logEventPointHeap
{
  -[PLSmartPLService logEventPointHeapForProcessName:](self, "logEventPointHeapForProcessName:", CFSTR("PerfPowerServicesExtended"));
  -[PLSmartPLService logEventPointHeapForProcessName:](self, "logEventPointHeapForProcessName:", CFSTR("aggregated"));
}

- (void)logEventPointVMMap
{
  -[PLSmartPLService logEventPointVMMapForProcessName:](self, "logEventPointVMMapForProcessName:", CFSTR("PerfPowerServicesExtended"));
  -[PLSmartPLService logEventPointVMMapForProcessName:](self, "logEventPointVMMapForProcessName:", CFSTR("aggregated"));
}

- (void)logEventPointStackShot
{
  -[PLSmartPLService logEventPointStackShotWithReason:](self, "logEventPointStackShotWithReason:", CFSTR("Stackshot requested"));
}

- (void)logEventPointStackShotWithReason:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[5];
  _QWORD v9[5];

  v7 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __53__PLSmartPLService_logEventPointStackShotWithReason___block_invoke;
  v9[3] = &unk_24EB5CE80;
  v9[4] = self;
  if (logEventPointStackShotWithReason__defaultOnce != -1)
    dispatch_once(&logEventPointStackShotWithReason__defaultOnce, v9);
  v4 = logEventPointStackShotWithReason__objectForKey;
  if (logEventPointStackShotWithReason__objectForKey >= 1)
  {
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Powerlog: %@ %d of %ld"), v7, v5, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      WriteStackshotReport_async();

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __53__PLSmartPLService_logEventPointStackShotWithReason___block_invoke_2;
      block[3] = &unk_24EB5CE80;
      block[4] = self;
      if (logEventPointStackShotWithReason__defaultOnce_57 != -1)
        dispatch_once(&logEventPointStackShotWithReason__defaultOnce_57, block);
      sleep(logEventPointStackShotWithReason__objectForKey_58);
      ++v5;
    }
    while (v4 != v5);
  }

}

uint64_t __53__PLSmartPLService_logEventPointStackShotWithReason___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultLongForKey:", CFSTR("StackShotCount"));
  logEventPointStackShotWithReason__objectForKey = result;
  return result;
}

uint64_t __53__PLSmartPLService_logEventPointStackShotWithReason___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultLongForKey:", CFSTR("StackShotDelay"));
  logEventPointStackShotWithReason__objectForKey_58 = result;
  return result;
}

- (void)logEventPointSample
{
  -[PLSmartPLService logEventPointSampleForProcessName:](self, "logEventPointSampleForProcessName:", CFSTR("PerfPowerServicesExtended"));
  -[PLSmartPLService logEventPointSampleForProcessName:](self, "logEventPointSampleForProcessName:", CFSTR("aggregated"));
}

- (void)logEventPointSampleForProcessName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  _QWORD block[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[6];

  v4 = a3;
  v5 = (void *)MEMORY[0x22767BA78]();
  +[PLOperator entryKeyForType:andName:](PLSmartPLService, "entryKeyForType:andName:", *MEMORY[0x24BE75230], CFSTR("Sample"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v6);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("ProcessName"));
  v8 = pidFromHint();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("PID"));

  v10 = 0x24BE74000uLL;
  v11 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  if ((int)v8 < 2)
  {
    if (v11)
    {
      v23 = objc_opt_class();
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_77;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v23;
      if (logEventPointSampleForProcessName__defaultOnce_75 != -1)
        dispatch_once(&logEventPointSampleForProcessName__defaultOnce_75, v47);
      if (logEventPointSampleForProcessName__classDebugEnabled_76)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid pid (%d) for %@ no sample for you!"), v8, v4);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLSmartPLService.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLSmartPLService logEventPointSampleForProcessName:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 174);

        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

        v10 = 0x24BE74000;
      }
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("invalid PID"), CFSTR("Sample"));
  }
  else
  {
    if (v11)
    {
      v12 = objc_opt_class();
      v51[0] = MEMORY[0x24BDAC760];
      v51[1] = 3221225472;
      v51[2] = __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke;
      v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v51[4] = v12;
      if (logEventPointSampleForProcessName__defaultOnce != -1)
        dispatch_once(&logEventPointSampleForProcessName__defaultOnce, v51);
      if (logEventPointSampleForProcessName__classDebugEnabled)
      {
        v44 = v5;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("generating sample for %@(%d)"), v4, v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLSmartPLService.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLSmartPLService logEventPointSampleForProcessName:]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 163);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

        v5 = v44;
        v10 = 0x24BE74000uLL;
      }
    }
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3418]), "initWithPID:options:", v8, 17);
    if (v19)
    {
      v20 = MEMORY[0x24BDAC760];
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_66;
      v50[3] = &unk_24EB5CE80;
      v50[4] = self;
      if (logEventPointSampleForProcessName__defaultOnce_65 != -1)
        dispatch_once(&logEventPointSampleForProcessName__defaultOnce_65, v50);
      v21 = logEventPointSampleForProcessName__objectForKey;
      v49[0] = v20;
      v49[1] = 3221225472;
      v49[2] = __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_2;
      v49[3] = &unk_24EB5CE80;
      v49[4] = self;
      if (logEventPointSampleForProcessName__defaultOnce_67 != -1)
        dispatch_once(&logEventPointSampleForProcessName__defaultOnce_67, v49);
      objc_msgSend(v19, "sampleForDuration:interval:", v21, logEventPointSampleForProcessName__objectForKey_68);
      objc_msgSend(v19, "stopSampling");
      objc_msgSend(v19, "outputString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("Sample"));

    }
    else
    {
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v30 = objc_opt_class();
        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_3;
        v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v48[4] = v30;
        if (logEventPointSampleForProcessName__defaultOnce_69 != -1)
          dispatch_once(&logEventPointSampleForProcessName__defaultOnce_69, v48);
        if (logEventPointSampleForProcessName__classDebugEnabled_70)
        {
          v45 = v5;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("no sampler inited for %@(%d)"), v4, v8);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLSmartPLService.m");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "lastPathComponent");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLSmartPLService logEventPointSampleForProcessName:]");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 170);

          PLLogCommon();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();

          v5 = v45;
          v10 = 0x24BE74000uLL;
        }
      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("Error, no sampler inited"), CFSTR("Sample"));
    }

  }
  -[PLOperator logEntry:](self, "logEntry:", v7);
  if (objc_msgSend(*(id *)(v10 + 4016), "debugEnabled"))
  {
    v37 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_84;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v37;
    if (logEventPointSampleForProcessName__defaultOnce_82 != -1)
      dispatch_once(&logEventPointSampleForProcessName__defaultOnce_82, block);
    if (logEventPointSampleForProcessName__classDebugEnabled_83)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Logged!"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLSmartPLService.m");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "lastPathComponent");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLSmartPLService logEventPointSampleForProcessName:]");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "logMessage:fromFile:fromFunction:fromLineNumber:", v38, v41, v42, 179);

      PLLogCommon();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

  objc_autoreleasePoolPop(v5);
}

uint64_t __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointSampleForProcessName__classDebugEnabled = result;
  return result;
}

uint64_t __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_66(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultLongForKey:", CFSTR("SampleDuration"));
  logEventPointSampleForProcessName__objectForKey = result;
  return result;
}

uint64_t __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "defaultLongForKey:", CFSTR("SampleInterval"));
  logEventPointSampleForProcessName__objectForKey_68 = result;
  return result;
}

uint64_t __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointSampleForProcessName__classDebugEnabled_70 = result;
  return result;
}

uint64_t __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_77(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointSampleForProcessName__classDebugEnabled_76 = result;
  return result;
}

uint64_t __54__PLSmartPLService_logEventPointSampleForProcessName___block_invoke_84(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  logEventPointSampleForProcessName__classDebugEnabled_83 = result;
  return result;
}

- (NSMutableDictionary)smartPLHelpers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSmartPLHelpers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartPLHelpers, 0);
}

@end
