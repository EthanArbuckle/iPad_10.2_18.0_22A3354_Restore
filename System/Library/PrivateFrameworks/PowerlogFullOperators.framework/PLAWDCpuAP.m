@implementation PLAWDCpuAP

+ (id)getSharedObjWithOperator:(id)a3
{
  void *v3;
  id v4;
  PLAWDCpuAP *v5;
  void *v6;

  v3 = (void *)plAwdCpuAp;
  if (!plAwdCpuAp)
  {
    v4 = a3;
    v5 = -[PLAWDAuxMetrics initWithOperator:]([PLAWDCpuAP alloc], "initWithOperator:", v4);

    v6 = (void *)plAwdCpuAp;
    plAwdCpuAp = (uint64_t)v5;

    v3 = (void *)plAwdCpuAp;
  }
  return v3;
}

+ (id)entryAggregateDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("ApMetrics");
  objc_msgSend(a1, "entryAggregateDefinitionAwdAp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("CpuMetrics");
  v8[0] = v3;
  objc_msgSend(a1, "entryAggregateDefinitionAwdCpu");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)startMetricCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD block[5];

  v4 = a3;
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  v6 = objc_msgSend(v4, "longValue");
  if (v6 == 2031620)
  {
    -[PLAWDCpuAP startCpuMetricCollection:](self, "startCpuMetricCollection:", v4);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __36__PLAWDCpuAP_startMetricCollection___block_invoke_39;
      v19[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v19[4] = v14;
      if (startMetricCollection__defaultOnce_37 != -1)
        dispatch_once(&startMetricCollection__defaultOnce_37, v19);
      if (startMetricCollection__classDebugEnabled_38)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Start CpuLoad collection"), CFSTR("*******PLAWDMetricsService*******"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCpuAP startMetricCollection:]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v17, v18, 77);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();
        goto LABEL_15;
      }
    }
  }
  else if (v6 == 2031634)
  {
    -[PLAWDCpuAP startApMetricCollection:](self, "startApMetricCollection:", v4);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __36__PLAWDCpuAP_startMetricCollection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (startMetricCollection__defaultOnce_0 != -1)
        dispatch_once(&startMetricCollection__defaultOnce_0, block);
      if (startMetricCollection__classDebugEnabled_0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Start ApData collection"), CFSTR("*******PLAWDMetricsService*******"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCpuAP startMetricCollection:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 72);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();
LABEL_15:

      }
    }
  }

}

uint64_t __36__PLAWDCpuAP_startMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startMetricCollection__classDebugEnabled_0 = result;
  return result;
}

uint64_t __36__PLAWDCpuAP_startMetricCollection___block_invoke_39(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startMetricCollection__classDebugEnabled_38 = result;
  return result;
}

- (void)stopMetricCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  _QWORD block[5];

  v4 = a3;
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  v6 = objc_msgSend(v4, "longValue");
  if (v6 == 2031620)
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __35__PLAWDCpuAP_stopMetricCollection___block_invoke_46;
      v22[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v22[4] = v14;
      if (stopMetricCollection__defaultOnce_44 != -1)
        dispatch_once(&stopMetricCollection__defaultOnce_44, v22);
      if (stopMetricCollection__classDebugEnabled_45)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Stop CpuLoad collection"), CFSTR("*******PLAWDMetricsService*******"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCpuAP stopMetricCollection:]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v17, v18, 98);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();
        goto LABEL_15;
      }
    }
  }
  else if (v6 == 2031634)
  {
    -[PLAWDCpuAP setIoreportEnergyEventCallback:](self, "setIoreportEnergyEventCallback:", 0);
    -[PLAWDCpuAP setMonitorEventCallback:](self, "setMonitorEventCallback:", 0);
    -[PLAWDCpuAP setWakeEventCallback:](self, "setWakeEventCallback:", 0);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __35__PLAWDCpuAP_stopMetricCollection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (stopMetricCollection__defaultOnce_0 != -1)
        dispatch_once(&stopMetricCollection__defaultOnce_0, block);
      if (stopMetricCollection__classDebugEnabled_0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Stop ApData collection"), CFSTR("*******PLAWDMetricsService*******"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCpuAP stopMetricCollection:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 94);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();
LABEL_15:

      }
    }
  }
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (!v20)
  {
    v21 = (void *)plAwdCpuAp;
    plAwdCpuAp = 0;

  }
}

uint64_t __35__PLAWDCpuAP_stopMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopMetricCollection__classDebugEnabled_0 = result;
  return result;
}

uint64_t __35__PLAWDCpuAP_stopMetricCollection___block_invoke_46(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopMetricCollection__classDebugEnabled_45 = result;
  return result;
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "longValue");
  if (v8 == 2031620)
  {
    -[PLAWDCpuAP submitCpuDataToAWDServer:withAwdConn:](self, "submitCpuDataToAWDServer:withAwdConn:", v6, v7);
  }
  else
  {
    if (v8 != 2031634)
    {
      v9 = 0;
      goto LABEL_7;
    }
    -[PLAWDCpuAP submitApDataToAWDServer:withAwdConn:](self, "submitApDataToAWDServer:withAwdConn:", v6, v7);
  }
  v9 = 1;
LABEL_7:

  return v9;
}

+ (id)entryAggregateDefinitionAwdAp
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
  v22[0] = &unk_24EB64620;
  v22[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v23[1] = *MEMORY[0x24BE751E8];
  v19[0] = CFSTR("ApSource");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("ApValue");
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
  v17 = &unk_24EB64630;
  v15 = *MEMORY[0x24BE75198];
  v16 = &unk_24EB64630;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  v23[3] = *MEMORY[0x24BE751A8];
  v14 = CFSTR("ApValue");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)startApMetricCollection:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];

  -[PLAWDCpuAP setApSubmitCnt:](self, "setApSubmitCnt:", 0);
  -[PLAWDCpuAP resetApTable](self, "resetApTable");
  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDCpuAP setSleepStartTime:](self, "setSleepStartTime:", v4);

  -[PLAWDCpuAP setIsIoreportEnergy:](self, "setIsIoreportEnergy:", 1);
  objc_msgSend(MEMORY[0x24BE75268], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75388]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __38__PLAWDCpuAP_startApMetricCollection___block_invoke;
  v16[3] = &unk_24EB5CDA0;
  v16[4] = self;
  v9 = (void *)objc_msgSend(v6, "initWithOperator:forEntryKey:withBlock:", v7, v5, v16);

  -[PLAWDCpuAP setIoreportEnergyEventCallback:](self, "setIoreportEnergyEventCallback:", v9);
  -[PLAWDCpuAP ioreportEnergyEventCallback](self, "ioreportEnergyEventCallback");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestEntry");

  objc_msgSend(MEMORY[0x24BE75290], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE753B0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __38__PLAWDCpuAP_startApMetricCollection___block_invoke_2;
  v15[3] = &unk_24EB5CDA0;
  v15[4] = self;
  v14 = (void *)objc_msgSend(v12, "initWithOperator:forEntryKey:withBlock:", v13, v11, v15);

  -[PLAWDCpuAP setWakeEventCallback:](self, "setWakeEventCallback:", v14);
}

uint64_t __38__PLAWDCpuAP_startApMetricCollection___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleIOReportEnergyCallback:", a2);
  return result;
}

uint64_t __38__PLAWDCpuAP_startApMetricCollection___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleWakeCallback:", a2);
  return result;
}

- (void)addEntryToApMetricsTable:(id)a3 withValue:(double)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = *MEMORY[0x24BE75200];
  v7 = a3;
  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", v6, CFSTR("ApMetrics"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v11);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("ApSource"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("ApValue"));

  -[PLAWDAuxMetrics operator](self, "operator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logEntry:", v8);

}

- (void)handleIOReportEnergyCallback:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  _QWORD block[5];
  objc_super v47;
  _QWORD v48[5];
  objc_super v49;
  _QWORD v50[5];

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (!-[PLAWDCpuAP isIoreportEnergy](self, "isIoreportEnergy"))
      goto LABEL_17;
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __43__PLAWDCpuAP_handleIOReportEnergyCallback___block_invoke;
      v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v50[4] = v5;
      if (handleIOReportEnergyCallback__defaultOnce != -1)
        dispatch_once(&handleIOReportEnergyCallback__defaultOnce, v50);
      if (handleIOReportEnergyCallback__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Ioreport CPU/SoC/GPU energy first entry"), CFSTR("*******PLAWDMetricsService*******"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCpuAP handleIOReportEnergyCallback:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 188);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    -[PLAWDCpuAP setIsIoreportEnergy:](self, "setIsIoreportEnergy:", 0);
    v49.receiver = self;
    v49.super_class = (Class)PLAWDCpuAP;
    if (!-[PLAWDAuxMetrics dropFirstEntryReceived:usingFilter:andStartTime:](&v49, sel_dropFirstEntryReceived_usingFilter_andStartTime_, v4, 0, 0))
    {
LABEL_17:
      v19 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SampleTime"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "doubleValue");
      v22 = -v21;
      objc_msgSend(v4, "entryDate");
      v23 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dateWithTimeInterval:sinceDate:", v23, v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "entryDate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v47.receiver = self;
      v47.super_class = (Class)PLAWDCpuAP;
      LOBYTE(v23) = -[PLAWDAuxMetrics doesInterfereWithChargerWithStartDate:withEndDate:](&v47, sel_doesInterfereWithChargerWithStartDate_withEndDate_, v13, v24);

      if ((v23 & 1) == 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CPU Energy"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        v27 = v26;

        if (v27 > 0.0)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CPU Energy"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "doubleValue");
          -[PLAWDCpuAP addEntryToApMetricsTable:withValue:](self, "addEntryToApMetricsTable:withValue:", CFSTR("CPU"), v29 / 3600.0);

        }
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GPU Energy"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "doubleValue");
        v32 = v31;

        if (v32 > 0.0)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("GPU Energy"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          -[PLAWDCpuAP addEntryToApMetricsTable:withValue:](self, "addEntryToApMetricsTable:withValue:", CFSTR("GPU"), v34 / 3600.0);

        }
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SoC Energy"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        v37 = v36;

        if (v37 != 0.0)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SoC Energy"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "doubleValue");
          -[PLAWDCpuAP addEntryToApMetricsTable:withValue:](self, "addEntryToApMetricsTable:withValue:", CFSTR("SOC"), v39 / 3600.0);

        }
      }
      if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        goto LABEL_32;
      v40 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __43__PLAWDCpuAP_handleIOReportEnergyCallback___block_invoke_81;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v40;
      if (handleIOReportEnergyCallback__defaultOnce_79 != -1)
        dispatch_once(&handleIOReportEnergyCallback__defaultOnce_79, block);
      if (!handleIOReportEnergyCallback__classDebugEnabled_80)
        goto LABEL_32;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Cpu/Soc/Gpu energy entry= %@"), CFSTR("*******PLAWDMetricsService*******"), v4);
      v18 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "lastPathComponent");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCpuAP handleIOReportEnergyCallback:]");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v43, v44, 214);

      PLLogCommon();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

LABEL_31:
LABEL_32:

      goto LABEL_33;
    }
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v12 = objc_opt_class();
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __43__PLAWDCpuAP_handleIOReportEnergyCallback___block_invoke_66;
      v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v48[4] = v12;
      if (handleIOReportEnergyCallback__defaultOnce_64 != -1)
        dispatch_once(&handleIOReportEnergyCallback__defaultOnce_64, v48);
      if (handleIOReportEnergyCallback__classDebugEnabled_65)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Ioreport CPU/SoC/GPU energy first entry - dropped"), CFSTR("*******PLAWDMetricsService*******"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lastPathComponent");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCpuAP handleIOReportEnergyCallback:]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v16, v17, 193);

        PLLogCommon();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();
        goto LABEL_31;
      }
    }
  }
LABEL_33:

}

uint64_t __43__PLAWDCpuAP_handleIOReportEnergyCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleIOReportEnergyCallback__classDebugEnabled = result;
  return result;
}

uint64_t __43__PLAWDCpuAP_handleIOReportEnergyCallback___block_invoke_66(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleIOReportEnergyCallback__classDebugEnabled_65 = result;
  return result;
}

uint64_t __43__PLAWDCpuAP_handleIOReportEnergyCallback___block_invoke_81(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleIOReportEnergyCallback__classDebugEnabled_80 = result;
  return result;
}

- (void)handleWakeCallback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t block;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  uint64_t v34;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("ApMetrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v5);
  -[PLAWDAuxMetrics operator](self, "operator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entryForKey:withID:", v9, objc_msgSend(v4, "entryID") - 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("State"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  if (v13 == 4.0)
  {
    objc_msgSend(v4, "entryDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDCpuAP setSleepStartTime:](self, "setSleepStartTime:", v14);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("State"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  if (v16 == 4.0)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("State"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    if (v19 != 4.0)
      goto LABEL_7;
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("Awake"), CFSTR("ApSource"));
    v20 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v10, "entryDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDCpuAP sleepStartTime](self, "sleepStartTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v21);
    objc_msgSend(v20, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("ApValue"));

  }
LABEL_7:
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v23 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v31 = 3221225472;
    v32 = __33__PLAWDCpuAP_handleWakeCallback___block_invoke;
    v33 = &__block_descriptor_40_e5_v8__0lu32l8;
    v34 = v23;
    if (handleWakeCallback__defaultOnce != -1)
      dispatch_once(&handleWakeCallback__defaultOnce, &block);
    if (handleWakeCallback__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("From WakeCallback - %@"), v4, block, v31, v32, v33, v34);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCpuAP handleWakeCallback:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 236);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __33__PLAWDCpuAP_handleWakeCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleWakeCallback__classDebugEnabled = result;
  return result;
}

- (void)resetApTable
{
  void *v3;
  objc_super v4;

  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("ApMetrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PLAWDCpuAP;
  -[PLAWDAuxMetrics resetTableWithEntryKey:](&v4, sel_resetTableWithEntryKey_, v3);

}

- (BOOL)submitApDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  NSObject *v58;
  void *v59;
  void *v60;
  PLAWDCpuAP *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[5];
  _QWORD v66[5];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD block[5];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  v8 = 0x24BE74000uLL;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDateWithTimeIntervalSinceNow:", -86400.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    v12 = v11;
    objc_msgSend(v10, "timeIntervalSince1970");
    v14 = v13 - v12;

    +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("ApMetrics"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDAuxMetrics operator](self, "operator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "storage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_opt_new();
    v21 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
    v22 = MEMORY[0x24BDAC760];
    v64 = v19;
    if (v21)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __50__PLAWDCpuAP_submitApDataToAWDServer_withAwdConn___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = objc_opt_class();
      if (submitApDataToAWDServer_withAwdConn__defaultOnce != -1)
        dispatch_once(&submitApDataToAWDServer_withAwdConn__defaultOnce, block);
      if (submitApDataToAWDServer_withAwdConn__classDebugEnabled)
      {
        v62 = v20;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : %@"), CFSTR("*******PLAWDMetricsService*******"), v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lastPathComponent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCpuAP submitApDataToAWDServer:withAwdConn:]");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 280);

        PLLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

        v20 = v62;
        v19 = v64;
        v8 = 0x24BE74000;
        v22 = MEMORY[0x24BDAC760];
      }
    }
    if (v20)
    {
      v58 = v18;
      v59 = v15;
      v60 = v7;
      v61 = self;
      objc_msgSend(v20, "setTimestamp:", objc_msgSend(v6, "getAWDTimestamp"));
      objc_msgSend(v20, "setSocPowerMicroWatt:", 0);
      objc_msgSend(v20, "setCpuPowerMicroWatt:", 0);
      objc_msgSend(v20, "setGpuPowerMicroWatt:", 0);
      objc_msgSend(v20, "setDramPowerMicroWatt:", 0);
      v29 = v20;
      objc_msgSend(v20, "setApAwakeDuration:", 0);
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v30 = v19;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      if (!v31)
        goto LABEL_28;
      v32 = v31;
      v33 = *(_QWORD *)v68;
      while (1)
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v68 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          v36 = objc_alloc(MEMORY[0x24BDD17C8]);
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("ApSource"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v36, "initWithFormat:", CFSTR("%@"), v37);

          if (objc_msgSend(v38, "isEqualToString:", CFSTR("CPU")))
          {
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("ApValue"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "doubleValue");
            objc_msgSend(v29, "setCpuPowerMicroWatt:", (v40 * 1000.0));
          }
          else if (objc_msgSend(v38, "isEqualToString:", CFSTR("GPU")))
          {
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("ApValue"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "doubleValue");
            objc_msgSend(v29, "setGpuPowerMicroWatt:", (v41 * 1000.0));
          }
          else if (objc_msgSend(v38, "isEqualToString:", CFSTR("SOC")))
          {
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("ApValue"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "doubleValue");
            objc_msgSend(v29, "setSocPowerMicroWatt:", (v42 * 1000.0));
          }
          else if (objc_msgSend(v38, "isEqualToString:", CFSTR("DRAM")))
          {
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("ApValue"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "doubleValue");
            objc_msgSend(v29, "setDramPowerMicroWatt:", (v43 * 1000.0));
          }
          else
          {
            if (!objc_msgSend(v38, "isEqualToString:", CFSTR("Awake")))
              goto LABEL_26;
            objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("ApValue"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "doubleValue");
            objc_msgSend(v29, "setApAwakeDuration:", v44);
          }

LABEL_26:
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
        if (!v32)
        {
LABEL_28:

          v7 = v60;
          v20 = v29;
          objc_msgSend(v60, "setMetric:", v29);
          self = v61;
          v18 = v58;
          v15 = v59;
          v19 = v64;
          v8 = 0x24BE74000uLL;
          v22 = MEMORY[0x24BDAC760];
          break;
        }
      }
    }
    -[PLAWDCpuAP setApSubmitCnt:](self, "setApSubmitCnt:", -[PLAWDCpuAP apSubmitCnt](self, "apSubmitCnt") + 1);
    if (objc_msgSend(*(id *)(v8 + 4016), "debugEnabled"))
    {
      v66[0] = v22;
      v66[1] = 3221225472;
      v66[2] = __50__PLAWDCpuAP_submitApDataToAWDServer_withAwdConn___block_invoke_97;
      v66[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v66[4] = objc_opt_class();
      if (submitApDataToAWDServer_withAwdConn__defaultOnce_95 != -1)
        dispatch_once(&submitApDataToAWDServer_withAwdConn__defaultOnce_95, v66);
      if (submitApDataToAWDServer_withAwdConn__classDebugEnabled_96)
      {
        v63 = v20;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Submit ApData stats: submit cnt=%ld"), CFSTR("*******PLAWDMetricsService*******"), -[PLAWDCpuAP apSubmitCnt](self, "apSubmitCnt"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "lastPathComponent");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCpuAP submitApDataToAWDServer:withAwdConn:]");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v48, v49, 313);

        PLLogCommon();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

        v20 = v63;
        v19 = v64;
      }
    }

    goto LABEL_37;
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v51 = objc_opt_class();
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v65[2] = __50__PLAWDCpuAP_submitApDataToAWDServer_withAwdConn___block_invoke_102;
    v65[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v65[4] = v51;
    if (submitApDataToAWDServer_withAwdConn__defaultOnce_100 != -1)
      dispatch_once(&submitApDataToAWDServer_withAwdConn__defaultOnce_100, v65);
    if (submitApDataToAWDServer_withAwdConn__classDebugEnabled_101)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Submit ApData stats: Empty container!!"), CFSTR("*******PLAWDMetricsService*******"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "lastPathComponent");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCpuAP submitApDataToAWDServer:withAwdConn:]");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v54, v55, 316);

      PLLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();
LABEL_37:

    }
  }
  -[PLAWDCpuAP resetApTable](self, "resetApTable");
  v56 = objc_msgSend(v6, "submitMetric:", v7);

  return v56;
}

uint64_t __50__PLAWDCpuAP_submitApDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitApDataToAWDServer_withAwdConn__classDebugEnabled = result;
  return result;
}

uint64_t __50__PLAWDCpuAP_submitApDataToAWDServer_withAwdConn___block_invoke_97(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitApDataToAWDServer_withAwdConn__classDebugEnabled_96 = result;
  return result;
}

uint64_t __50__PLAWDCpuAP_submitApDataToAWDServer_withAwdConn___block_invoke_102(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitApDataToAWDServer_withAwdConn__classDebugEnabled_101 = result;
  return result;
}

+ (id)entryAggregateDefinitionAwdCpu
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
  v22[0] = &unk_24EB64620;
  v22[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v23[1] = *MEMORY[0x24BE751E8];
  v19[0] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("ProcessTime");
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
  v17 = &unk_24EB64630;
  v15 = *MEMORY[0x24BE75198];
  v16 = &unk_24EB64630;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  v23[3] = *MEMORY[0x24BE751A8];
  v14 = CFSTR("ApValue");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)startCpuMetricCollection:(id)a3
{
  -[PLAWDCpuAP setCpuLoadSubmitCnt:](self, "setCpuLoadSubmitCnt:", 0);
}

- (BOOL)submitCpuDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  PLAWDCpuAP *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id obj;
  _QWORD v45[5];
  _QWORD block[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v43 = (void *)objc_msgSend(v6, "newMetricContainerWithIdentifier:", objc_msgSend(a3, "unsignedIntValue"));
  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDateWithTimeIntervalSinceNow:", -86400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v10 = v9;
  objc_msgSend(v8, "timeIntervalSince1970");
  v12 = v11 - v10;

  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("ApMetrics"));
  v13 = objc_claimAutoreleasedReturnValue();
  -[PLAWDAuxMetrics operator](self, "operator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "storage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)v13;
  objc_msgSend(v15, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v13, 86400.0, v10, v12);
  v16 = objc_claimAutoreleasedReturnValue();

  v39 = (void *)v16;
  objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v6;
  v42 = objc_alloc_init(MEMORY[0x24BED1F98]);
  objc_msgSend(v42, "setTimestamp:", objc_msgSend(v6, "getAWDTimestamp"));
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v17;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v48;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v48 != v20)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v21);
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v23 = objc_opt_class();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __51__PLAWDCpuAP_submitCpuDataToAWDServer_withAwdConn___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v23;
          if (submitCpuDataToAWDServer_withAwdConn__defaultOnce != -1)
            dispatch_once(&submitCpuDataToAWDServer_withAwdConn__defaultOnce, block);
          if (submitCpuDataToAWDServer_withAwdConn__classDebugEnabled)
          {
            v24 = self;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dbEntry = %@ metric = %@ metricContainer = %@"), v22, v42, v43);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "lastPathComponent");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCpuAP submitCpuDataToAWDServer:withAwdConn:]");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 371);

            PLLogCommon();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v52 = v25;
              _os_log_debug_impl(&dword_222C6D000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v24;
          }
        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v19);
  }

  -[PLAWDCpuAP setCpuLoadSubmitCnt:](self, "setCpuLoadSubmitCnt:", -[PLAWDCpuAP cpuLoadSubmitCnt](self, "cpuLoadSubmitCnt") + 1);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v31 = objc_opt_class();
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __51__PLAWDCpuAP_submitCpuDataToAWDServer_withAwdConn___block_invoke_110;
    v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v45[4] = v31;
    if (submitCpuDataToAWDServer_withAwdConn__defaultOnce_108 != -1)
      dispatch_once(&submitCpuDataToAWDServer_withAwdConn__defaultOnce_108, v45);
    if (submitCpuDataToAWDServer_withAwdConn__classDebugEnabled_109)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Submit cpuLoad stats: submit cnt=%ld"), CFSTR("*******PLAWDMetricsService*******"), -[PLAWDCpuAP cpuLoadSubmitCnt](self, "cpuLoadSubmitCnt"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCpuAP.m");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lastPathComponent");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCpuAP submitCpuDataToAWDServer:withAwdConn:]");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 375);

      PLLogCommon();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

  return 0;
}

uint64_t __51__PLAWDCpuAP_submitCpuDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitCpuDataToAWDServer_withAwdConn__classDebugEnabled = result;
  return result;
}

uint64_t __51__PLAWDCpuAP_submitCpuDataToAWDServer_withAwdConn___block_invoke_110(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitCpuDataToAWDServer_withAwdConn__classDebugEnabled_109 = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)monitorEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMonitorEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PLEntryNotificationOperatorComposition)wakeEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWakeEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PLEntryNotificationOperatorComposition)ioreportEnergyEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIoreportEnergyEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)sleepStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSleepStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)isIoreportEnergy
{
  return self->_isIoreportEnergy;
}

- (void)setIsIoreportEnergy:(BOOL)a3
{
  self->_isIoreportEnergy = a3;
}

- (int64_t)apSubmitCnt
{
  return self->_apSubmitCnt;
}

- (void)setApSubmitCnt:(int64_t)a3
{
  self->_apSubmitCnt = a3;
}

- (int64_t)cpuLoadSubmitCnt
{
  return self->_cpuLoadSubmitCnt;
}

- (void)setCpuLoadSubmitCnt:(int64_t)a3
{
  self->_cpuLoadSubmitCnt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepStartTime, 0);
  objc_storeStrong((id *)&self->_ioreportEnergyEventCallback, 0);
  objc_storeStrong((id *)&self->_wakeEventCallback, 0);
  objc_storeStrong((id *)&self->_monitorEventCallback, 0);
}

@end
