@implementation PLAWDBattery

+ (id)getSharedObjWithOperator:(id)a3
{
  void *v3;
  id v4;
  PLAWDBattery *v5;
  void *v6;

  v3 = (void *)plAwdBattery;
  if (!plAwdBattery)
  {
    v4 = a3;
    v5 = -[PLAWDAuxMetrics initWithOperator:]([PLAWDBattery alloc], "initWithOperator:", v4);

    v6 = (void *)plAwdBattery;
    plAwdBattery = (uint64_t)v5;

    v3 = (void *)plAwdBattery;
  }
  return v3;
}

+ (id)entryAggregateDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("BatteryMetrics");
  objc_msgSend(a1, "entryAggregateDefinitionAwdBattery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryAggregateDefinitionAwdBattery
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[4];
  _QWORD v24[6];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v23[0] = *MEMORY[0x24BE751D0];
  v2 = *MEMORY[0x24BE751F0];
  v21[0] = *MEMORY[0x24BE751F8];
  v21[1] = v2;
  v22[0] = &unk_24EB64650;
  v22[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v23[1] = *MEMORY[0x24BE751E8];
  v19[0] = CFSTR("BatteryMetricsKey");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("BatteryMetricsValue");
  v20[0] = v5;
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_RealFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v8;
  v23[2] = *MEMORY[0x24BE751A0];
  v17 = &unk_24EB64660;
  v15 = *MEMORY[0x24BE75198];
  v16 = &unk_24EB64660;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  v23[3] = *MEMORY[0x24BE751A8];
  v14 = CFSTR("BatteryMetricsValue");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)startMetricCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD block[5];
  _QWORD v30[5];
  _QWORD v31[5];
  void *v32;
  const __CFString *v33;
  const __CFString *v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  if (objc_msgSend(v4, "longValue") == 2031623)
  {
    -[PLAWDBattery initBatteryStats](self, "initBatteryStats");
    objc_msgSend(MEMORY[0x24BE75248], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75310]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BE74FC8]);
    -[PLAWDAuxMetrics operator](self, "operator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __38__PLAWDBattery_startMetricCollection___block_invoke;
    v31[3] = &unk_24EB5CDA0;
    v31[4] = self;
    v9 = objc_msgSend(v7, "initWithOperator:forEntryKey:withBlock:", v8, v6, v31);

    -[PLAWDBattery setBatteryEventCallback:](self, "setBatteryEventCallback:", v9);
    if (objc_msgSend(MEMORY[0x24BE75260], "shouldLogDisplay"))
    {
      objc_msgSend(MEMORY[0x24BE75260], "entryKeyForType:andName:", *MEMORY[0x24BE75230], *MEMORY[0x24BE75370]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc(MEMORY[0x24BE74FC8]);
      -[PLAWDAuxMetrics operator](self, "operator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = &unk_24EB64790;
      v33 = CFSTR("Backlight");
      v34 = CFSTR("Block");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __38__PLAWDBattery_startMetricCollection___block_invoke_38;
      v30[3] = &unk_24EB5CDA0;
      v30[4] = self;
      v15 = (void *)objc_msgSend(v11, "initWithOperator:forEntryKey:withFilter:withBlock:", v12, v10, v14, v30);

      -[PLAWDBattery setDisplayEventCallback:](self, "setDisplayEventCallback:", v15);
    }
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v16 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __38__PLAWDBattery_startMetricCollection___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v16;
      if (startMetricCollection__defaultOnce_1 != -1)
        dispatch_once(&startMetricCollection__defaultOnce_1, block);
      if (startMetricCollection__classDebugEnabled_1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Start Battery collection "), CFSTR("*******PLAWDMetricsService*******"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery startMetricCollection:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 104);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
LABEL_17:

    goto LABEL_18;
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v23 = objc_opt_class();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __38__PLAWDBattery_startMetricCollection___block_invoke_50;
    v28[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v28[4] = v23;
    if (startMetricCollection__defaultOnce_48 != -1)
      dispatch_once(&startMetricCollection__defaultOnce_48, v28);
    if (startMetricCollection__classDebugEnabled_49)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported metric for battery class %@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery startMetricCollection:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v26, v27, 108);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();
      goto LABEL_17;
    }
  }
LABEL_18:

}

uint64_t __38__PLAWDBattery_startMetricCollection___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleBatteryCallback:", a2);
  return result;
}

uint64_t __38__PLAWDBattery_startMetricCollection___block_invoke_38(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleDisplayCallback:", a2);
  return result;
}

uint64_t __38__PLAWDBattery_startMetricCollection___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startMetricCollection__classDebugEnabled_1 = result;
  return result;
}

uint64_t __38__PLAWDBattery_startMetricCollection___block_invoke_50(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startMetricCollection__classDebugEnabled_49 = result;
  return result;
}

- (void)stopMetricCollection:(id)a3
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
  uint64_t v14;
  void *v15;
  uint64_t block;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;

  v4 = a3;
  if (objc_msgSend(v4, "longValue") == 2031623)
  {
    -[PLAWDBattery setBatteryEventCallback:](self, "setBatteryEventCallback:", 0);
    -[PLAWDBattery setDisplayEventCallback:](self, "setDisplayEventCallback:", 0);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      block = MEMORY[0x24BDAC760];
      v17 = 3221225472;
      v18 = __37__PLAWDBattery_stopMetricCollection___block_invoke;
      v19 = &__block_descriptor_40_e5_v8__0lu32l8;
      v20 = v5;
      if (stopMetricCollection__defaultOnce_1 != -1)
        dispatch_once(&stopMetricCollection__defaultOnce_1, &block);
      if (stopMetricCollection__classDebugEnabled_1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Stop Battery collection "), CFSTR("*******PLAWDMetricsService*******"), block, v17, v18, v19, v20);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery stopMetricCollection:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 119);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
  }
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObject:", v4);

  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    v15 = (void *)plAwdBattery;
    plAwdBattery = 0;

  }
}

uint64_t __37__PLAWDBattery_stopMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopMetricCollection__classDebugEnabled_1 = result;
  return result;
}

- (void)initBatteryStats
{
  void *v3;
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
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t block;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  uint64_t v33;

  -[PLAWDBattery setBatterySubmitCnt:](self, "setBatterySubmitCnt:", 0);
  -[PLAWDBattery setPrevDisplayON:](self, "setPrevDisplayON:", 0);
  -[PLAWDBattery setDispOnOffCnt:](self, "setDispOnOffCnt:", 0);
  -[PLAWDBattery setPrevDispTimeStamp:](self, "setPrevDispTimeStamp:", 0.0);
  -[PLAWDBattery setPrevCapacity:](self, "setPrevCapacity:", 0.0);
  -[PLAWDBattery setPrevVoltage:](self, "setPrevVoltage:", 0.0);
  -[PLAWDBattery setPrevDeviceCharging:](self, "setPrevDeviceCharging:", 0);
  -[PLAWDBattery resetBatteryTable](self, "resetBatteryTable");
  objc_msgSend(MEMORY[0x24BE75248], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75310]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDAuxMetrics operator](self, "operator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastEntryForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  -[PLAWDBattery setPrevDispTimeStamp:](self, "setPrevDispTimeStamp:");
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Voltage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    -[PLAWDBattery setPrevVoltage:](self, "setPrevVoltage:");

    -[PLAWDBattery setPrevDeviceCharging:](self, "setPrevDeviceCharging:", -[PLAWDBattery isDeviceCharging:](self, "isDeviceCharging:", v6));
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CurrentCapacity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    -[PLAWDBattery setPrevCapacity:](self, "setPrevCapacity:");

  }
  if (objc_msgSend(MEMORY[0x24BE75260], "shouldLogDisplay")
    && !-[PLAWDBattery prevDeviceCharging](self, "prevDeviceCharging"))
  {
    objc_msgSend(MEMORY[0x24BE75260], "entryKeyForType:andName:", *MEMORY[0x24BE75230], *MEMORY[0x24BE75370]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDAuxMetrics operator](self, "operator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "storage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastEntryForKey:withFilters:", v10, &unk_24EB64B50);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Active"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAWDBattery setPrevDisplayON:](self, "setPrevDisplayON:", objc_msgSend(v14, "BOOLValue"));

    }
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v15 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v30 = 3221225472;
    v31 = __32__PLAWDBattery_initBatteryStats__block_invoke;
    v32 = &__block_descriptor_40_e5_v8__0lu32l8;
    v33 = v15;
    if (initBatteryStats_defaultOnce != -1)
      dispatch_once(&initBatteryStats_defaultOnce, &block);
    if (initBatteryStats_classDebugEnabled)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      -[PLAWDBattery prevVoltage](self, "prevVoltage");
      v18 = v17;
      v19 = -[PLAWDBattery prevDeviceCharging](self, "prevDeviceCharging");
      -[PLAWDBattery prevCapacity](self, "prevCapacity");
      v21 = v20;
      v22 = -[PLAWDBattery prevDisplayON](self, "prevDisplayON");
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ : Initialize Battery metrics: prevVoltage=%f prevIsCharging=%d prevCapacity=%f prevDisplayOn=%d"), CFSTR("*******PLAWDMetricsService*******"), v18, v19, v21, v22, block, v30, v31, v32, v33);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery initBatteryStats]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 166);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __32__PLAWDBattery_initBatteryStats__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initBatteryStats_classDebugEnabled = result;
  return result;
}

- (void)reInitBatteryStats
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t block;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;

  -[PLAWDBattery resetBatteryTable](self, "resetBatteryTable");
  -[PLAWDBattery setDispOnOffCnt:](self, "setDispOnOffCnt:", 0);
  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  -[PLAWDBattery setPrevDispTimeStamp:](self, "setPrevDispTimeStamp:");

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __34__PLAWDBattery_reInitBatteryStats__block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    v22 = v4;
    if (reInitBatteryStats_defaultOnce != -1)
      dispatch_once(&reInitBatteryStats_defaultOnce, &block);
    if (reInitBatteryStats_classDebugEnabled)
    {
      v5 = (void *)MEMORY[0x24BDD17C8];
      -[PLAWDBattery prevVoltage](self, "prevVoltage");
      v7 = v6;
      v8 = -[PLAWDBattery prevDeviceCharging](self, "prevDeviceCharging");
      -[PLAWDBattery prevCapacity](self, "prevCapacity");
      v10 = v9;
      v11 = -[PLAWDBattery prevDisplayON](self, "prevDisplayON");
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ : Re-Init Battery metrics: prevVoltage=%f prevIsCharging=%d prevCapacity=%f prevDisplayOn=%d"), CFSTR("*******PLAWDMetricsService*******"), v7, v8, v10, v11, block, v19, v20, v21, v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery reInitBatteryStats]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 178);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
}

uint64_t __34__PLAWDBattery_reInitBatteryStats__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reInitBatteryStats_classDebugEnabled = result;
  return result;
}

- (BOOL)isDeviceCharging:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v9;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AdapterInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[PLAWDAuxMetrics handleChargerChangeWithState:withDate:](&v10, sel_handleChargerChangeWithState_withDate_, 1, v7, v9.receiver, v9.super_class, self, PLAWDBattery);
  else
    -[PLAWDAuxMetrics handleChargerChangeWithState:withDate:](&v9, sel_handleChargerChangeWithState_withDate_, 0, v7, self, PLAWDBattery, v10.receiver, v10.super_class);

  return v6;
}

- (void)resetBatteryTable
{
  void *v3;
  objc_super v4;

  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("BatteryMetrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PLAWDBattery;
  -[PLAWDAuxMetrics resetTableWithEntryKey:](&v4, sel_resetTableWithEntryKey_, v3);

}

- (void)addEntryToBatteryTable:(id)a3 withValue:(double)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = *MEMORY[0x24BE75200];
  v7 = a3;
  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", v6, CFSTR("BatteryMetrics"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v11);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("BatteryMetricsKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("BatteryMetricsValue"));

  -[PLAWDAuxMetrics operator](self, "operator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logEntry:", v8);

}

- (void)processEnergyConsumedAndAddEntry:(double)a3 withVoltage:(double)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _BOOL4 v31;
  int64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t block;
  uint64_t v40;
  uint64_t (*v41)(uint64_t);
  void *v42;
  uint64_t v43;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];

  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;

  -[PLAWDBattery prevDispTimeStamp](self, "prevDispTimeStamp");
  v11 = v9 - v10;
  if (-[PLAWDBattery prevDisplayON](self, "prevDisplayON") && !-[PLAWDBattery dispOnOffCnt](self, "dispOnOffCnt"))
  {
    if (a3 > 0.0)
      -[PLAWDBattery addEntryToBatteryTable:withValue:](self, "addEntryToBatteryTable:withValue:", CFSTR("DrainDisplayOn"), a3 * a4);
    -[PLAWDBattery addEntryToBatteryTable:withValue:](self, "addEntryToBatteryTable:withValue:", CFSTR("DurationDispOn"), v11);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v24 = objc_opt_class();
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v24;
      if (processEnergyConsumedAndAddEntry_withVoltage__defaultOnce != -1)
        dispatch_once(&processEnergyConsumedAndAddEntry_withVoltage__defaultOnce, v46);
      if (processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ Battery Event: EnergyConsumed: DurationDispOn =%f"), CFSTR("*******PLAWDMetricsService*******"), *(_QWORD *)&v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery processEnergyConsumedAndAddEntry:withVoltage:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v27, v28, 217);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();
        goto LABEL_28;
      }
    }
  }
  else if (-[PLAWDBattery prevDisplayON](self, "prevDisplayON") || -[PLAWDBattery dispOnOffCnt](self, "dispOnOffCnt"))
  {
    if (a3 > 0.0)
      -[PLAWDBattery addEntryToBatteryTable:withValue:](self, "addEntryToBatteryTable:withValue:", CFSTR("DrainPartialDisplayOn"), a3 * a4);
    if (-[PLAWDBattery prevDisplayON](self, "prevDisplayON"))
    {
      -[PLAWDBattery addEntryToBatteryTable:withValue:](self, "addEntryToBatteryTable:withValue:", CFSTR("DurationPartialDispOn"), v11);
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v12 = objc_opt_class();
        v45[0] = MEMORY[0x24BDAC760];
        v45[1] = 3221225472;
        v45[2] = __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke_79;
        v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v45[4] = v12;
        if (processEnergyConsumedAndAddEntry_withVoltage__defaultOnce_77 != -1)
          dispatch_once(&processEnergyConsumedAndAddEntry_withVoltage__defaultOnce_77, v45);
        if (processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled_78)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ Battery Event: EnergyConsumed: DurationPartialDispOn =%f"), CFSTR("*******PLAWDMetricsService*******"), *(_QWORD *)&v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery processEnergyConsumedAndAddEntry:withVoltage:]");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 227);

          PLLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();
LABEL_28:

        }
      }
    }
    else
    {
      -[PLAWDBattery addEntryToBatteryTable:withValue:](self, "addEntryToBatteryTable:withValue:", CFSTR("DurationPartialDispOff"), v11);
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v19 = objc_opt_class();
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke_84;
        v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v44[4] = v19;
        if (processEnergyConsumedAndAddEntry_withVoltage__defaultOnce_82 != -1)
          dispatch_once(&processEnergyConsumedAndAddEntry_withVoltage__defaultOnce_82, v44);
        if (processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled_83)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ Battery Event: EnergyConsumed: DurationPartialDispOff =%f"), CFSTR("*******PLAWDMetricsService*******"), *(_QWORD *)&v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "lastPathComponent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery processEnergyConsumedAndAddEntry:withVoltage:]");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v22, v23, 231);

          PLLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();
          goto LABEL_28;
        }
      }
    }
  }
  else if (a3 > 0.0)
  {
    -[PLAWDBattery addEntryToBatteryTable:withValue:](self, "addEntryToBatteryTable:withValue:", CFSTR("DrainDisplayOff"), a3 * a4);
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v29 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v40 = 3221225472;
    v41 = __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke_89;
    v42 = &__block_descriptor_40_e5_v8__0lu32l8;
    v43 = v29;
    if (processEnergyConsumedAndAddEntry_withVoltage__defaultOnce_87 != -1)
      dispatch_once(&processEnergyConsumedAndAddEntry_withVoltage__defaultOnce_87, &block);
    if (processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled_88)
    {
      v30 = (void *)MEMORY[0x24BDD17C8];
      v31 = -[PLAWDBattery prevDisplayON](self, "prevDisplayON");
      v32 = -[PLAWDBattery dispOnOffCnt](self, "dispOnOffCnt");
      objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ Battery Event: EnergyConsumed=%f Display On=%d dispOnOffCnt=%lu "), CFSTR("*******PLAWDMetricsService*******"), a3 * a4, v31, v32, block, v40, v41, v42, v43);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "lastPathComponent");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery processEnergyConsumedAndAddEntry:withVoltage:]");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 234);

      PLLogCommon();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  -[PLAWDBattery setPrevDispTimeStamp:](self, "setPrevDispTimeStamp:", v9);
  -[PLAWDBattery setDispOnOffCnt:](self, "setDispOnOffCnt:", 0);
}

uint64_t __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled = result;
  return result;
}

uint64_t __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke_79(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled_78 = result;
  return result;
}

uint64_t __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke_84(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled_83 = result;
  return result;
}

uint64_t __61__PLAWDBattery_processEnergyConsumedAndAddEntry_withVoltage___block_invoke_89(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  processEnergyConsumedAndAddEntry_withVoltage__classDebugEnabled_88 = result;
  return result;
}

- (void)handleBatteryCallback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  _BOOL8 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _QWORD block[5];

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CurrentCapacity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Voltage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    v12 = -[PLAWDBattery isDeviceCharging:](self, "isDeviceCharging:", v5);
    -[PLAWDBattery prevCapacity](self, "prevCapacity");
    v14 = v13;
    -[PLAWDBattery prevVoltage](self, "prevVoltage");
    v16 = v15;
    -[PLAWDBattery prevCapacity](self, "prevCapacity");
    if (v17 <= 0.0)
    {
LABEL_18:
      -[PLAWDBattery setPrevVoltage:](self, "setPrevVoltage:", v11);
      -[PLAWDBattery setPrevDeviceCharging:](self, "setPrevDeviceCharging:", v12);
      -[PLAWDBattery setPrevCapacity:](self, "setPrevCapacity:", v8);
      goto LABEL_19;
    }
    v18 = vabdd_f64(v8, v14);
    v19 = (v11 + v16) / 2000.0;
    v20 = -[PLAWDBattery prevDeviceCharging](self, "prevDeviceCharging");
    if (v12)
    {
      if (!v20)
        goto LABEL_5;
    }
    else if (!v20)
    {
LABEL_5:
      if (!-[PLAWDBattery prevDeviceCharging](self, "prevDeviceCharging"))
        -[PLAWDBattery processEnergyConsumedAndAddEntry:withVoltage:](self, "processEnergyConsumedAndAddEntry:withVoltage:", v18, v19);
      goto LABEL_18;
    }
    v21 = v8 - v14;
    if (v8 - v14 != 0.0)
    {
      v22 = v18 * v19;
      -[PLAWDBattery addEntryToBatteryTable:withValue:](self, "addEntryToBatteryTable:withValue:", CFSTR("EnergyCharged"), v22);
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v23 = objc_opt_class();
        block[0] = MEMORY[0x24BDAC760];
        *(_QWORD *)&v21 = 3221225472;
        block[1] = 3221225472;
        block[2] = __38__PLAWDBattery_handleBatteryCallback___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v23;
        if (handleBatteryCallback__defaultOnce_0 != -1)
          dispatch_once(&handleBatteryCallback__defaultOnce_0, block);
        if (handleBatteryCallback__classDebugEnabled_0)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Battery Event: energyCharged=%f"), CFSTR("*******PLAWDMetricsService*******"), *(_QWORD *)&v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastPathComponent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery handleBatteryCallback:]");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 268);

          PLLogCommon();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();

        }
      }
    }
    if (!v12)
    {
      -[PLAWDBattery setDispOnOffCnt:](self, "setDispOnOffCnt:", 0, v21);
      objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "timeIntervalSince1970");
      -[PLAWDBattery setPrevDispTimeStamp:](self, "setPrevDispTimeStamp:");

    }
    goto LABEL_18;
  }
LABEL_19:

}

uint64_t __38__PLAWDBattery_handleBatteryCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBatteryCallback__classDebugEnabled_0 = result;
  return result;
}

- (void)handleDisplayCallback:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  _BOOL4 v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  double v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _QWORD block[5];
  _QWORD v37[5];
  _QWORD v38[5];

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_27;
  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Active"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (!-[PLAWDBattery prevDeviceCharging](self, "prevDeviceCharging"))
  {
    v10 = -[PLAWDBattery prevDisplayON](self, "prevDisplayON");
    if ((_DWORD)v9)
    {
      if (v10)
        goto LABEL_19;
      -[PLAWDBattery setDispOnOffCnt:](self, "setDispOnOffCnt:", -[PLAWDBattery dispOnOffCnt](self, "dispOnOffCnt") + 1);
      -[PLAWDBattery prevDispTimeStamp](self, "prevDispTimeStamp");
      -[PLAWDBattery addEntryToBatteryTable:withValue:](self, "addEntryToBatteryTable:withValue:", CFSTR("DurationPartialDispOff"), v7 - v11);
      if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        goto LABEL_19;
      v12 = objc_opt_class();
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __38__PLAWDBattery_handleDisplayCallback___block_invoke;
      v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v38[4] = v12;
      if (handleDisplayCallback__defaultOnce != -1)
        dispatch_once(&handleDisplayCallback__defaultOnce, v38);
      if (!handleDisplayCallback__classDebugEnabled)
        goto LABEL_19;
      v13 = (void *)MEMORY[0x24BDD17C8];
      -[PLAWDBattery prevDispTimeStamp](self, "prevDispTimeStamp");
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ :DurationPartialDispOff =%f"), CFSTR("*******PLAWDMetricsService*******"), v7 - v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery handleDisplayCallback:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 301);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();
    }
    else
    {
      if (!v10)
        goto LABEL_19;
      -[PLAWDBattery setDispOnOffCnt:](self, "setDispOnOffCnt:", -[PLAWDBattery dispOnOffCnt](self, "dispOnOffCnt") + 1);
      -[PLAWDBattery prevDispTimeStamp](self, "prevDispTimeStamp");
      -[PLAWDBattery addEntryToBatteryTable:withValue:](self, "addEntryToBatteryTable:withValue:", CFSTR("DurationPartialDispOn"), v7 - v21);
      if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        goto LABEL_19;
      v22 = objc_opt_class();
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __38__PLAWDBattery_handleDisplayCallback___block_invoke_100;
      v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v37[4] = v22;
      if (handleDisplayCallback__defaultOnce_98 != -1)
        dispatch_once(&handleDisplayCallback__defaultOnce_98, v37);
      if (!handleDisplayCallback__classDebugEnabled_99)
        goto LABEL_19;
      v23 = (void *)MEMORY[0x24BDD17C8];
      -[PLAWDBattery prevDispTimeStamp](self, "prevDispTimeStamp");
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ :DurationPartialDispOn =%f"), CFSTR("*******PLAWDMetricsService*******"), v7 - v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery handleDisplayCallback:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v27, v28, 306);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();
    }

  }
LABEL_19:
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v29 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__PLAWDBattery_handleDisplayCallback___block_invoke_105;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v29;
    if (handleDisplayCallback__defaultOnce_103 != -1)
      dispatch_once(&handleDisplayCallback__defaultOnce_103, block);
    if (handleDisplayCallback__classDebugEnabled_104)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ AWD-Battery:DisplayEvent: currDisplayOn=%d self.prevDisplayON=%d dispOnOffCnt=%lu"), CFSTR("*******PLAWDMetricsService*******"), v9, -[PLAWDBattery prevDisplayON](self, "prevDisplayON"), -[PLAWDBattery dispOnOffCnt](self, "dispOnOffCnt"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "lastPathComponent");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery handleDisplayCallback:]");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 310);

      PLLogCommon();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  -[PLAWDBattery setPrevDisplayON:](self, "setPrevDisplayON:", v9);
  -[PLAWDBattery setPrevDispTimeStamp:](self, "setPrevDispTimeStamp:", v7);
LABEL_27:

}

uint64_t __38__PLAWDBattery_handleDisplayCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleDisplayCallback__classDebugEnabled = result;
  return result;
}

uint64_t __38__PLAWDBattery_handleDisplayCallback___block_invoke_100(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleDisplayCallback__classDebugEnabled_99 = result;
  return result;
}

uint64_t __38__PLAWDBattery_handleDisplayCallback___block_invoke_105(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleDisplayCallback__classDebugEnabled_104 = result;
  return result;
}

- (void)finalizeBatteryTable
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  double v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD block[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];

  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  -[PLAWDBattery prevDispTimeStamp](self, "prevDispTimeStamp");
  v7 = v6;
  if (-[PLAWDBattery prevDeviceCharging](self, "prevDeviceCharging"))
    goto LABEL_2;
  v15 = v5 - v7;
  v16 = -[PLAWDBattery prevDisplayON](self, "prevDisplayON");
  v17 = -[PLAWDBattery dispOnOffCnt](self, "dispOnOffCnt");
  if (v16)
  {
    if (v17)
    {
      if (-[PLAWDBattery dispOnOffCnt](self, "dispOnOffCnt") >= 1)
      {
        -[PLAWDBattery addEntryToBatteryTable:withValue:](self, "addEntryToBatteryTable:withValue:", CFSTR("DurationPartialDispOn"), v15);
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v18 = objc_opt_class();
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __36__PLAWDBattery_finalizeBatteryTable__block_invoke_112;
          v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v37[4] = v18;
          if (finalizeBatteryTable_defaultOnce_110 != -1)
            dispatch_once(&finalizeBatteryTable_defaultOnce_110, v37);
          if (finalizeBatteryTable_classDebugEnabled_111)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Finalize Battery table :DurationPartialDispOn =%f"), CFSTR("*******PLAWDMetricsService*******"), *(_QWORD *)&v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "lastPathComponent");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery finalizeBatteryTable]");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 331);

            PLLogCommon();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              -[PLAWDDisplay startMetricCollection:].cold.1();
LABEL_32:

          }
        }
      }
    }
    else
    {
      -[PLAWDBattery addEntryToBatteryTable:withValue:](self, "addEntryToBatteryTable:withValue:", CFSTR("DurationDispOn"), v15);
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v30 = objc_opt_class();
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __36__PLAWDBattery_finalizeBatteryTable__block_invoke;
        v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v38[4] = v30;
        if (finalizeBatteryTable_defaultOnce != -1)
          dispatch_once(&finalizeBatteryTable_defaultOnce, v38);
        if (finalizeBatteryTable_classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Finalize Battery table :DurationDispOn =%f"), CFSTR("*******PLAWDMetricsService*******"), *(_QWORD *)&v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "lastPathComponent");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery finalizeBatteryTable]");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v33, v34, 327);

          PLLogCommon();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();
          goto LABEL_32;
        }
      }
    }
  }
  else if (v17 >= 1)
  {
    -[PLAWDBattery addEntryToBatteryTable:withValue:](self, "addEntryToBatteryTable:withValue:", CFSTR("DurationPartialDispOff"), v15);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v25 = objc_opt_class();
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __36__PLAWDBattery_finalizeBatteryTable__block_invoke_117;
      v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v36[4] = v25;
      if (finalizeBatteryTable_defaultOnce_115 != -1)
        dispatch_once(&finalizeBatteryTable_defaultOnce_115, v36);
      if (finalizeBatteryTable_classDebugEnabled_116)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Finalize Battery table :DurationPartialDispOff =%f"), CFSTR("*******PLAWDMetricsService*******"), *(_QWORD *)&v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "lastPathComponent");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery finalizeBatteryTable]");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v28, v29, 337);

        PLLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();
        goto LABEL_32;
      }
    }
  }
LABEL_2:
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__PLAWDBattery_finalizeBatteryTable__block_invoke_122;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (finalizeBatteryTable_defaultOnce_120 != -1)
      dispatch_once(&finalizeBatteryTable_defaultOnce_120, block);
    if (finalizeBatteryTable_classDebugEnabled_121)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Finalize Battery table"), CFSTR("*******PLAWDMetricsService*******"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery finalizeBatteryTable]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 342);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
}

uint64_t __36__PLAWDBattery_finalizeBatteryTable__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  finalizeBatteryTable_classDebugEnabled = result;
  return result;
}

uint64_t __36__PLAWDBattery_finalizeBatteryTable__block_invoke_112(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  finalizeBatteryTable_classDebugEnabled_111 = result;
  return result;
}

uint64_t __36__PLAWDBattery_finalizeBatteryTable__block_invoke_117(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  finalizeBatteryTable_classDebugEnabled_116 = result;
  return result;
}

uint64_t __36__PLAWDBattery_finalizeBatteryTable__block_invoke_122(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  finalizeBatteryTable_classDebugEnabled_121 = result;
  return result;
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  char v53;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[5];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD block[5];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(v7, "newMetricContainerWithIdentifier:", objc_msgSend(v6, "unsignedIntValue"));
  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDateWithTimeIntervalSinceNow:", -86400.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  v12 = v11;
  objc_msgSend(v10, "timeIntervalSince1970");
  v14 = v13;

  if (objc_msgSend(v6, "longValue") == 2031623)
  {
    if (v8)
    {
      -[PLAWDBattery finalizeBatteryTable](self, "finalizeBatteryTable");
      +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("BatteryMetrics"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAWDAuxMetrics operator](self, "operator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14 - v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_opt_new();
      v58 = v15;
      v59 = v8;
      v57 = v18;
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v21 = objc_opt_class();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __50__PLAWDBattery_submitDataToAWDServer_withAwdConn___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v21;
        if (submitDataToAWDServer_withAwdConn__defaultOnce_0 != -1)
          dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_0, block);
        if (submitDataToAWDServer_withAwdConn__classDebugEnabled_0)
        {
          v22 = v19;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : %@"), CFSTR("*******PLAWDMetricsService*******"), v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery submitDataToAWDServer:withAwdConn:]");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 362);

          PLLogCommon();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();

          v15 = v58;
          v8 = v59;
          v18 = v57;
          v19 = v22;
        }
      }
      if (v20)
      {
        v55 = v7;
        objc_msgSend(v20, "setTimestamp:", objc_msgSend(v7, "getAWDTimestamp"));
        objc_msgSend(v20, "setEnergyConsumedDisplayOnMicroWatt:", 0);
        objc_msgSend(v20, "setEnergyConsumedDisplayOffMicroWatt:", 0);
        objc_msgSend(v20, "setEnergyConsumedPartailDispOnMicrowatt:", 0);
        objc_msgSend(v20, "setEnergyChargedMicroWatt:", 0);
        objc_msgSend(v20, "setDurationDispOn:", 0);
        objc_msgSend(v20, "setDurationPartialDispOn:", 0);
        objc_msgSend(v20, "setDurationPartialDispOff:", 0);
        objc_msgSend(v20, "setCycleCountKey:", 0);
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v56 = v19;
        v29 = v19;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v62;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v62 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
              objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("BatteryMetricsKey"));
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("BatteryMetricsValue"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "doubleValue");
              v38 = v37;

              if (objc_msgSend(v35, "isEqualToString:", CFSTR("DrainDisplayOn")))
              {
                objc_msgSend(v20, "setEnergyConsumedDisplayOnMicroWatt:", (v38 * 1000.0));
              }
              else if (objc_msgSend(v35, "isEqualToString:", CFSTR("DrainDisplayOff")))
              {
                objc_msgSend(v20, "setEnergyConsumedDisplayOffMicroWatt:", (v38 * 1000.0));
              }
              else if (objc_msgSend(v35, "isEqualToString:", CFSTR("DrainPartialDisplayOn")))
              {
                objc_msgSend(v20, "setEnergyConsumedPartailDispOnMicrowatt:", (v38 * 1000.0));
              }
              else if (objc_msgSend(v35, "isEqualToString:", CFSTR("EnergyCharged")))
              {
                objc_msgSend(v20, "setEnergyChargedMicroWatt:", (v38 * 1000.0));
              }
              else if (objc_msgSend(v35, "isEqualToString:", CFSTR("DurationDispOn")))
              {
                objc_msgSend(v20, "setDurationDispOn:", (v38 * 1000.0));
              }
              else if (objc_msgSend(v35, "isEqualToString:", CFSTR("DurationPartialDispOn")))
              {
                objc_msgSend(v20, "setDurationPartialDispOn:", (v38 * 1000.0));
              }
              else if (objc_msgSend(v35, "isEqualToString:", CFSTR("DurationPartialDispOff")))
              {
                objc_msgSend(v20, "setDurationPartialDispOff:", (v38 * 1000.0));
              }

            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
          }
          while (v31);
        }

        objc_msgSend(MEMORY[0x24BE75248], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75310]);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAWDAuxMetrics operator](self, "operator");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "storage");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "lastEntryForKey:", v39);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("CycleCount"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "doubleValue");
          v45 = v44;

          objc_msgSend(v20, "setCycleCountKey:", v45);
        }
        -[PLAWDBattery setBatterySubmitCnt:](self, "setBatterySubmitCnt:", -[PLAWDBattery batterySubmitCnt](self, "batterySubmitCnt") + 1);
        v19 = v56;
        v8 = v59;
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v46 = objc_opt_class();
          v60[0] = MEMORY[0x24BDAC760];
          v60[1] = 3221225472;
          v60[2] = __50__PLAWDBattery_submitDataToAWDServer_withAwdConn___block_invoke_132;
          v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v60[4] = v46;
          if (submitDataToAWDServer_withAwdConn__defaultOnce_130 != -1)
            dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_130, v60);
          if (submitDataToAWDServer_withAwdConn__classDebugEnabled_131)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Submit Battery stats: submit cnt=%ld"), CFSTR("*******PLAWDMetricsService*******"), -[PLAWDBattery batterySubmitCnt](self, "batterySubmitCnt"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDBattery.m");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "lastPathComponent");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDBattery submitDataToAWDServer:withAwdConn:]");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "logMessage:fromFile:fromFunction:fromLineNumber:", v47, v50, v51, 412);

            PLLogCommon();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
              -[PLAWDDisplay startMetricCollection:].cold.1();

            v8 = v59;
            v19 = v56;
          }
        }
        objc_msgSend(v8, "setMetric:", v20);

        v7 = v55;
        v18 = v57;
        v15 = v58;
      }

    }
    -[PLAWDBattery reInitBatteryStats](self, "reInitBatteryStats");
    v53 = objc_msgSend(v7, "submitMetric:", v8);
  }
  else
  {
    v53 = 0;
  }

  return v53;
}

uint64_t __50__PLAWDBattery_submitDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitDataToAWDServer_withAwdConn__classDebugEnabled_0 = result;
  return result;
}

uint64_t __50__PLAWDBattery_submitDataToAWDServer_withAwdConn___block_invoke_132(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitDataToAWDServer_withAwdConn__classDebugEnabled_131 = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)batteryEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBatteryEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PLEntryNotificationOperatorComposition)displayEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDisplayEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (double)prevCapacity
{
  return self->_prevCapacity;
}

- (void)setPrevCapacity:(double)a3
{
  self->_prevCapacity = a3;
}

- (double)prevVoltage
{
  return self->_prevVoltage;
}

- (void)setPrevVoltage:(double)a3
{
  self->_prevVoltage = a3;
}

- (BOOL)prevDeviceCharging
{
  return self->_prevDeviceCharging;
}

- (void)setPrevDeviceCharging:(BOOL)a3
{
  self->_prevDeviceCharging = a3;
}

- (BOOL)prevDisplayON
{
  return self->_prevDisplayON;
}

- (void)setPrevDisplayON:(BOOL)a3
{
  self->_prevDisplayON = a3;
}

- (int64_t)dispOnOffCnt
{
  return self->_dispOnOffCnt;
}

- (void)setDispOnOffCnt:(int64_t)a3
{
  self->_dispOnOffCnt = a3;
}

- (double)prevDispTimeStamp
{
  return self->_prevDispTimeStamp;
}

- (void)setPrevDispTimeStamp:(double)a3
{
  self->_prevDispTimeStamp = a3;
}

- (int64_t)batterySubmitCnt
{
  return self->_batterySubmitCnt;
}

- (void)setBatterySubmitCnt:(int64_t)a3
{
  self->_batterySubmitCnt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayEventCallback, 0);
  objc_storeStrong((id *)&self->_batteryEventCallback, 0);
}

@end
