@implementation PLAWDDisplay

+ (id)getSharedObjWithOperator:(id)a3
{
  void *v3;
  id v4;
  PLAWDDisplay *v5;
  void *v6;

  v3 = (void *)plAwdDisplay;
  if (!plAwdDisplay)
  {
    v4 = a3;
    v5 = -[PLAWDAuxMetrics initWithOperator:]([PLAWDDisplay alloc], "initWithOperator:", v4);

    v6 = (void *)plAwdDisplay;
    plAwdDisplay = (uint64_t)v5;

    v3 = (void *)plAwdDisplay;
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
  v5 = CFSTR("DisplayAlsMetrics");
  objc_msgSend(a1, "entryAggregateDefinitionAwdDisplayAndAls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryAggregateDefinitionAwdDisplayAndAls
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
  v22[0] = &unk_24EB64600;
  v22[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v23[1] = *MEMORY[0x24BE751E8];
  v19[0] = CFSTR("MetricsKey");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("MetricsValue");
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
  v17 = &unk_24EB64610;
  v15 = *MEMORY[0x24BE75198];
  v16 = &unk_24EB64610;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  v23[3] = *MEMORY[0x24BE751A8];
  v14 = CFSTR("MetricsValue");
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
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD block[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "longValue");
  if (v5 == 2031625)
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v13 = objc_opt_class();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __38__PLAWDDisplay_startMetricCollection___block_invoke_46;
      v21[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v21[4] = v13;
      if (startMetricCollection__defaultOnce_44 != -1)
        dispatch_once(&startMetricCollection__defaultOnce_44, v21);
      if (startMetricCollection__classDebugEnabled_45)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Start Touch collection"), CFSTR("*******PLAWDMetricsService*******"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay startMetricCollection:]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 122);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    -[PLAWDDisplay initTouchStats](self, "initTouchStats");
    -[PLAWDDisplay registerForTouchNotifications](self, "registerForTouchNotifications");
  }
  else if (v5 == 2031622)
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v6 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __38__PLAWDDisplay_startMetricCollection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v6;
      if (startMetricCollection__defaultOnce != -1)
        dispatch_once(&startMetricCollection__defaultOnce, block);
      if (startMetricCollection__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Start Display/Backlight/Als collection"), CFSTR("*******PLAWDMetricsService*******"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay startMetricCollection:]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 112);

        PLLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    -[PLAWDDisplay initDisplayBacklightAlsStats](self, "initDisplayBacklightAlsStats");
    -[PLAWDDisplay registerForDisplayAgentNotifications](self, "registerForDisplayAgentNotifications");
  }
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObject:", v4);

}

uint64_t __38__PLAWDDisplay_startMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startMetricCollection__classDebugEnabled = result;
  return result;
}

uint64_t __38__PLAWDDisplay_startMetricCollection___block_invoke_46(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startMetricCollection__classDebugEnabled_45 = result;
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
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  _QWORD block[5];

  v4 = a3;
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  v6 = objc_msgSend(v4, "longValue");
  if (v6 == 2031625)
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __37__PLAWDDisplay_stopMetricCollection___block_invoke_53;
      v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v24[4] = v14;
      if (stopMetricCollection__defaultOnce_51 != -1)
        dispatch_once(&stopMetricCollection__defaultOnce_51, v24);
      if (stopMetricCollection__classDebugEnabled_52)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Stop Touch collection."), CFSTR("*******PLAWDMetricsService*******"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay stopMetricCollection:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 154);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    -[PLAWDDisplay setTouchEventCallback:](self, "setTouchEventCallback:", 0);
  }
  else if (v6 == 2031622)
  {
    -[PLAWDDisplay setDisplayEventCallback:](self, "setDisplayEventCallback:", 0);
    -[PLAWDDisplay setBacklightEventCallback:](self, "setBacklightEventCallback:", 0);
    -[PLAWDDisplay setAlsUserPreferencesEventCallback:](self, "setAlsUserPreferencesEventCallback:", 0);
    -[PLAWDDisplay setBatteryEventCallback:](self, "setBatteryEventCallback:", 0);
    -[PLAWDDisplay setBacklightRailCallback:](self, "setBacklightRailCallback:", 0);
    -[PLAWDDisplay setAlsEnabledEventCallback:](self, "setAlsEnabledEventCallback:", 0);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __37__PLAWDDisplay_stopMetricCollection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (stopMetricCollection__defaultOnce != -1)
        dispatch_once(&stopMetricCollection__defaultOnce, block);
      if (stopMetricCollection__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Stop Display/Backlight/Als collection."), CFSTR("*******PLAWDMetricsService*******"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay stopMetricCollection:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 149);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
  }
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (!v22)
  {
    v23 = (void *)plAwdDisplay;
    plAwdDisplay = 0;

  }
}

uint64_t __37__PLAWDDisplay_stopMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopMetricCollection__classDebugEnabled = result;
  return result;
}

uint64_t __37__PLAWDDisplay_stopMetricCollection___block_invoke_53(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopMetricCollection__classDebugEnabled_52 = result;
  return result;
}

- (void)registerForTouchNotifications
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  objc_msgSend(MEMORY[0x24BE75260], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75350]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__PLAWDDisplay_registerForTouchNotifications__block_invoke;
  v8[3] = &unk_24EB5CDA0;
  v8[4] = self;
  v6 = (void *)objc_msgSend(v4, "initWithOperator:forEntryKey:withBlock:", v5, v3, v8);

  -[PLAWDDisplay setTouchEventCallback:](self, "setTouchEventCallback:", v6);
  -[PLAWDDisplay touchEventCallback](self, "touchEventCallback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestEntry");

}

uint64_t __45__PLAWDDisplay_registerForTouchNotifications__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleTouchCallback:", a2);
  return result;
}

- (void)registerForDisplayAgentNotifications
{
  unint64_t v3;
  char v4;
  uint64_t v5;
  char **__ptr32 *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void *v34;
  PLAWDDisplay *v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[6];

  v3 = 0x24BE75000uLL;
  v4 = objc_msgSend(MEMORY[0x24BE75260], "shouldLogDisplay");
  v5 = MEMORY[0x24BDAC760];
  v6 = &off_222C97000;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE75260], "entryKeyForType:andName:", *MEMORY[0x24BE75230], *MEMORY[0x24BE75370]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x24BE74FC8]);
    -[PLAWDAuxMetrics operator](self, "operator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v5;
    v38[1] = 3221225472;
    v38[2] = __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke;
    v38[3] = &unk_24EB5CDA0;
    v38[4] = self;
    v10 = (void *)objc_msgSend(v8, "initWithOperator:forEntryKey:withBlock:", v9, v7, v38);

    -[PLAWDDisplay setDisplayEventCallback:](self, "setDisplayEventCallback:", v10);
    if (-[PLAWDDisplay prevMieOn](self, "prevMieOn"))
    {
      -[PLAWDDisplay displayEventCallback](self, "displayEventCallback");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "requestEntry");

    }
    v12 = *MEMORY[0x24BE75218];
    objc_msgSend(MEMORY[0x24BE75260], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE75368]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x24BE74FC8]);
    -[PLAWDAuxMetrics operator](self, "operator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v5;
    v37[1] = 3221225472;
    v37[2] = __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_2;
    v37[3] = &unk_24EB5CDA0;
    v37[4] = self;
    v16 = (void *)objc_msgSend(v14, "initWithOperator:forEntryKey:withBlock:", v15, v13, v37);

    -[PLAWDDisplay setBacklightEventCallback:](self, "setBacklightEventCallback:", v16);
    v3 = 0x24BE75000;

    v6 = &off_222C97000;
  }
  else
  {
    v12 = *MEMORY[0x24BE75218];
  }
  if ((objc_msgSend(MEMORY[0x24BE74FD8], "isMac") & 1) == 0)
  {
    objc_msgSend(*(id *)(v3 + 608), "entryKeyForType:andName:", v12, *MEMORY[0x24BE75360]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x24BE74FC8]);
    -[PLAWDAuxMetrics operator](self, "operator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v5;
    v36[1] = *((_QWORD *)v6 + 81);
    v36[2] = __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_3;
    v36[3] = &unk_24EB5CDA0;
    v36[4] = self;
    v20 = (void *)objc_msgSend(v18, "initWithOperator:forEntryKey:withBlock:", v19, v17, v36);

    -[PLAWDDisplay setAlsUserPreferencesEventCallback:](self, "setAlsUserPreferencesEventCallback:", v20);
  }
  objc_msgSend(MEMORY[0x24BE75248], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75310]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v5;
  v32 = *((_QWORD *)v6 + 81);
  v24 = v32;
  v33 = __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_4;
  v34 = &unk_24EB5CDA0;
  v35 = self;
  v25 = (void *)objc_msgSend(v22, "initWithOperator:forEntryKey:withBlock:", v23, v21, &v31);

  -[PLAWDDisplay setBatteryEventCallback:](self, "setBatteryEventCallback:", v25);
  objc_msgSend(*(id *)(v3 + 608), "entryKeyForType:andName:", v12, *MEMORY[0x24BE75358]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc(MEMORY[0x24BE74FC8]);
  -[PLAWDAuxMetrics operator](self, "operator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v5;
  v30[1] = v24;
  v30[2] = __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_5;
  v30[3] = &unk_24EB5CDA0;
  v30[4] = self;
  v29 = (void *)objc_msgSend(v27, "initWithOperator:forEntryKey:withBlock:", v28, v26, v30);

  -[PLAWDDisplay setAlsEnabledEventCallback:](self, "setAlsEnabledEventCallback:", v29);
}

uint64_t __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleDisplayCallback:", a2);
  return result;
}

uint64_t __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleBacklightCallback:", a2);
  return result;
}

uint64_t __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleAlsUserPreferencesCallback:", a2);
  return result;
}

uint64_t __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleBatteryCallback:", a2);
  return result;
}

uint64_t __52__PLAWDDisplay_registerForDisplayAgentNotifications__block_invoke_5(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleAlsEnabledCallback:", a2);
  return result;
}

- (void)initTouchStats
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];

  -[PLAWDDisplay setTouchSubmitCnt:](self, "setTouchSubmitCnt:", 0);
  objc_msgSend(MEMORY[0x24BE75260], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75350]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDAuxMetrics operator](self, "operator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastEntryForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "entryID");
  else
    v7 = -1;
  -[PLAWDDisplay setStartTouchEntryId:](self, "setStartTouchEntryId:", v7);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__PLAWDDisplay_initTouchStats__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (initTouchStats_defaultOnce != -1)
      dispatch_once(&initTouchStats_defaultOnce, block);
    if (initTouchStats_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Init Touch stats: startTouchEntryId=%lld"), CFSTR("*******PLAWDMetricsService*******"), -[PLAWDDisplay startTouchEntryId](self, "startTouchEntryId"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay initTouchStats]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 251);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __30__PLAWDDisplay_initTouchStats__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initTouchStats_classDebugEnabled = result;
  return result;
}

- (void)initDisplayBacklightAlsStats
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _BOOL4 v39;
  int64_t v40;
  _BOOL4 v41;
  _BOOL4 v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD block[5];
  uint64_t v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x24BDAC8D0];
  -[PLAWDDisplay setDispSubmitCnt:](self, "setDispSubmitCnt:", 0);
  -[PLAWDDisplay setPrevDisplayOn:](self, "setPrevDisplayOn:", 0);
  -[PLAWDDisplay setPrevMieOn:](self, "setPrevMieOn:", 0);
  -[PLAWDDisplay setPrevDeviceCharging:](self, "setPrevDeviceCharging:", 0);
  -[PLAWDDisplay setPrevBklBucketIdx:](self, "setPrevBklBucketIdx:", -1);
  -[PLAWDDisplay setBklTimeStamp:](self, "setBklTimeStamp:", 0.0);
  -[PLAWDDisplay setDisplayOnTimeStamp:](self, "setDisplayOnTimeStamp:", 0.0);
  -[PLAWDDisplay setMieOnTimeStamp:](self, "setMieOnTimeStamp:", 0.0);
  -[PLAWDDisplay setPrevBklPower:](self, "setPrevBklPower:", 0.0);
  -[PLAWDDisplay setBklPowerRailTimeStamp:](self, "setBklPowerRailTimeStamp:", 0.0);
  -[PLAWDDisplay resetDisplayAlsTable](self, "resetDisplayAlsTable");
  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDDisplay setPrevAlsOn:](self, "setPrevAlsOn:", 0);
  v3 = *MEMORY[0x24BE75218];
  objc_msgSend(MEMORY[0x24BE75260], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE75358]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDAuxMetrics operator](self, "operator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastEntryForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ALSEnabled")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "BOOLValue"),
        v8,
        v9))
  {
    v52 = 1;
    -[PLAWDDisplay setPrevAlsOn:](self, "setPrevAlsOn:", 1);
    -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", CFSTR("AlsEnableCnt"), 1.0);
  }
  else
  {
    v52 = 0;
  }
  if (objc_msgSend(MEMORY[0x24BE75260], "shouldLogDisplay"))
  {
    v53 = v4;
    objc_msgSend(MEMORY[0x24BE75260], "entryKeyForType:andName:", *MEMORY[0x24BE75230], *MEMORY[0x24BE75370]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"), CFSTR("Block"), CFSTR("Backlight"));
    v11 = objc_claimAutoreleasedReturnValue();
    -[PLAWDAuxMetrics operator](self, "operator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "storage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)v11;
    v58[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastEntryForKey:withFilters:", v10, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Active"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAWDDisplay setPrevDisplayOn:](self, "setPrevDisplayOn:", objc_msgSend(v16, "BOOLValue"));

      if (-[PLAWDDisplay prevDisplayOn](self, "prevDisplayOn"))
      {
        -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", CFSTR("DisplayOnCount"), 1.0);
        objc_msgSend(v55, "timeIntervalSince1970");
        -[PLAWDDisplay setDisplayOnTimeStamp:](self, "setDisplayOnTimeStamp:");
      }
    }
    if (-[PLAWDDisplay prevDisplayOn](self, "prevDisplayOn"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"), CFSTR("Block"), CFSTR("MIE"));
      v17 = objc_claimAutoreleasedReturnValue();
      -[PLAWDAuxMetrics operator](self, "operator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "storage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)v17;
      v57 = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastEntryForKey:withFilters:", v10, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Active"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAWDDisplay setPrevMieOn:](self, "setPrevMieOn:", objc_msgSend(v22, "BOOLValue"));

        if (-[PLAWDDisplay prevMieOn](self, "prevMieOn"))
        {
          -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", CFSTR("MieOnCount"), 1.0);
          objc_msgSend(v55, "timeIntervalSince1970");
          -[PLAWDDisplay setMieOnTimeStamp:](self, "setMieOnTimeStamp:");
        }
      }
      objc_msgSend(MEMORY[0x24BE75260], "entryKeyForType:andName:", v3, *MEMORY[0x24BE75368]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAWDAuxMetrics operator](self, "operator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "storage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastEntryForKey:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("uAmps"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "longValue");

        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("lux"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "longValue");

        -[PLAWDDisplay setPrevBklBucketIdx:](self, "setPrevBklBucketIdx:", -[PLAWDDisplay getBklbucketIdx:withLux:](self, "getBklbucketIdx:withLux:", v28, v30));
        objc_msgSend(v55, "timeIntervalSince1970");
        -[PLAWDDisplay setBklTimeStamp:](self, "setBklTimeStamp:");
      }

    }
    v4 = v53;
  }
  objc_msgSend(MEMORY[0x24BE75248], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75310]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAWDAuxMetrics operator](self, "operator");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "storage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lastEntryForKey:", v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("AdapterInfo"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v35, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("IsCharging"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAWDDisplay setPrevDeviceCharging:](self, "setPrevDeviceCharging:", objc_msgSend(v36, "BOOLValue"));

    }
    else
    {
      -[PLAWDDisplay setPrevDeviceCharging:](self, "setPrevDeviceCharging:", 0);
    }

  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v37 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__PLAWDDisplay_initDisplayBacklightAlsStats__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v37;
    if (initDisplayBacklightAlsStats_defaultOnce != -1)
      dispatch_once(&initDisplayBacklightAlsStats_defaultOnce, block);
    if (initDisplayBacklightAlsStats_classDebugEnabled)
    {
      v54 = v4;
      v38 = (void *)MEMORY[0x24BDD17C8];
      v39 = -[PLAWDDisplay prevDisplayOn](self, "prevDisplayOn");
      v40 = -[PLAWDDisplay prevBklBucketIdx](self, "prevBklBucketIdx");
      v41 = -[PLAWDDisplay prevMieOn](self, "prevMieOn");
      v42 = -[PLAWDDisplay prevDeviceCharging](self, "prevDeviceCharging");
      -[PLAWDDisplay prevBklPower](self, "prevBklPower");
      objc_msgSend(v38, "stringWithFormat:", CFSTR("%@ : Initialize Display/Backlight/Als: Display-On=%d Backlight-Idx=%ld Mie-On=%d Als-Enabled=%d Plugged=%d bklPower=%f"), CFSTR("*******PLAWDMetricsService*******"), v39, v40, v41, v52, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "lastPathComponent");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay initDisplayBacklightAlsStats]");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "logMessage:fromFile:fromFunction:fromLineNumber:", v44, v47, v48, 341);

      PLLogCommon();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

      v4 = v54;
    }
  }

}

uint64_t __44__PLAWDDisplay_initDisplayBacklightAlsStats__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initDisplayBacklightAlsStats_classDebugEnabled = result;
  return result;
}

- (void)reInitDisplayBacklightAlsStats
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  int64_t v9;
  _BOOL4 v10;
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

  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLAWDDisplay prevDisplayOn](self, "prevDisplayOn"))
  {
    objc_msgSend(v3, "timeIntervalSince1970");
    -[PLAWDDisplay setDisplayOnTimeStamp:](self, "setDisplayOnTimeStamp:");
    objc_msgSend(v3, "timeIntervalSince1970");
    -[PLAWDDisplay setBklTimeStamp:](self, "setBklTimeStamp:");
    objc_msgSend(v3, "timeIntervalSince1970");
    -[PLAWDDisplay setBklPowerRailTimeStamp:](self, "setBklPowerRailTimeStamp:");
    if (!-[PLAWDDisplay prevMieOn](self, "prevMieOn"))
      goto LABEL_6;
    objc_msgSend(v3, "timeIntervalSince1970");
    v5 = v4;
  }
  else
  {
    -[PLAWDDisplay setPrevBklBucketIdx:](self, "setPrevBklBucketIdx:", -1);
    v5 = 0.0;
    -[PLAWDDisplay setBklTimeStamp:](self, "setBklTimeStamp:", 0.0);
    -[PLAWDDisplay setDisplayOnTimeStamp:](self, "setDisplayOnTimeStamp:", 0.0);
  }
  -[PLAWDDisplay setMieOnTimeStamp:](self, "setMieOnTimeStamp:", v5);
LABEL_6:
  -[PLAWDDisplay resetDisplayAlsTable](self, "resetDisplayAlsTable");
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __46__PLAWDDisplay_reInitDisplayBacklightAlsStats__block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    v22 = v6;
    if (reInitDisplayBacklightAlsStats_defaultOnce != -1)
      dispatch_once(&reInitDisplayBacklightAlsStats_defaultOnce, &block);
    if (reInitDisplayBacklightAlsStats_classDebugEnabled)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      v8 = -[PLAWDDisplay prevDisplayOn](self, "prevDisplayOn");
      v9 = -[PLAWDDisplay prevBklBucketIdx](self, "prevBklBucketIdx");
      v10 = -[PLAWDDisplay prevMieOn](self, "prevMieOn");
      v11 = -[PLAWDDisplay prevDeviceCharging](self, "prevDeviceCharging");
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ : Re- Initialize Display/Backlight/Als: Display-On=%d Backlight-Idx=%ld Mie-On=%d Plugged=%d"), CFSTR("*******PLAWDMetricsService*******"), v8, v9, v10, v11, block, v19, v20, v21, v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay reInitDisplayBacklightAlsStats]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 365);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }

}

uint64_t __46__PLAWDDisplay_reInitDisplayBacklightAlsStats__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reInitDisplayBacklightAlsStats_classDebugEnabled = result;
  return result;
}

- (void)resetDisplayAlsTable
{
  void *v3;
  objc_super v4;

  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("DisplayAlsMetrics"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PLAWDDisplay;
  -[PLAWDAuxMetrics resetTableWithEntryKey:](&v4, sel_resetTableWithEntryKey_, v3);

}

- (void)addEntryToDisplayAlsTable:(id)a3 withValue:(double)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = *MEMORY[0x24BE75200];
  v7 = a3;
  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", v6, CFSTR("DisplayAlsMetrics"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v11);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("MetricsKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("MetricsValue"));

  -[PLAWDAuxMetrics operator](self, "operator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logEntry:", v8);

}

- (int64_t)getLuxBucket:(int64_t)a3
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;

  v4 = -[PLAWDDisplay prevAlsOn](self, "prevAlsOn");
  v5 = 5;
  if (a3 <= 1001)
    v5 = -1;
  if ((unint64_t)(a3 - 501) >= 0x1F4)
    v6 = v5;
  else
    v6 = 4;
  if ((unint64_t)(a3 - 301) >= 0xC8)
    v7 = v6;
  else
    v7 = 3;
  if ((unint64_t)(a3 - 101) >= 0xC8)
    v8 = v7;
  else
    v8 = 2;
  if ((unint64_t)(a3 - 31) >= 0x46)
    v9 = v8;
  else
    v9 = 1;
  if ((unint64_t)(a3 - 1) >= 0x1E)
    v10 = v9;
  else
    v10 = 0;
  if (v4)
    return v10;
  else
    return 6;
}

- (int64_t)getUAmpsBucket:(int64_t)a3
{
  if (a3 < 1001)
    return 0;
  if ((unint64_t)a3 < 0x1389)
    return 1;
  if ((unint64_t)a3 < 0x2711)
    return 2;
  if (a3 != 10001 && (unint64_t)a3 < 0x3A99)
    return 3;
  if ((unint64_t)a3 <= 0x3A98)
    return -1;
  return 4;
}

- (int64_t)getBklbucketIdx:(int64_t)a3 withLux:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  int64_t v8;

  v6 = -[PLAWDDisplay getLuxBucket:](self, "getLuxBucket:", a4);
  v7 = -[PLAWDDisplay getUAmpsBucket:](self, "getUAmpsBucket:", a3);
  v8 = 5 * v6 + v7;
  if (!v6)
    v8 = v7;
  if (v7 < 0)
    v8 = -1;
  if (v6 >= 0)
    return v8;
  else
    return -1;
}

- (void)updateDisplayMetrics:(BOOL)a3 withState:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;
  double v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  double v21;
  double v22;
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
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _QWORD block[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;

  if (v5)
  {
    v10 = -[PLAWDDisplay prevDisplayOn](self, "prevDisplayOn");
    if (v4)
    {
      if (!v10)
      {
        -[PLAWDDisplay setDisplayOnTimeStamp:](self, "setDisplayOnTimeStamp:", v9);
        -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", CFSTR("DisplayOnCount"), 1.0);
      }
    }
    else if (v10)
    {
      -[PLAWDDisplay displayOnTimeStamp](self, "displayOnTimeStamp");
      v22 = v9 - v21;
      if (-[PLAWDDisplay prevDeviceCharging](self, "prevDeviceCharging"))
      {
        if (v22 > 0.0)
          -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", CFSTR("PluggedDispOnDur"), v22);
        if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
          goto LABEL_37;
        v23 = objc_opt_class();
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke_95;
        v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v44[4] = v23;
        if (updateDisplayMetrics_withState__defaultOnce_93 != -1)
          dispatch_once(&updateDisplayMetrics_withState__defaultOnce_93, v44);
        if (!updateDisplayMetrics_withState__classDebugEnabled_94)
          goto LABEL_37;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ DisplayEvent: Plugged Display On duration=%f"), CFSTR("*******PLAWDMetricsService*******"), *(_QWORD *)&v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay updateDisplayMetrics:withState:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 465);

        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();
      }
      else
      {
        if (v22 > 0.0)
          -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", CFSTR("UnpluggedDispOnDur"), v22);
        if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
          goto LABEL_37;
        v30 = objc_opt_class();
        v45[0] = MEMORY[0x24BDAC760];
        v45[1] = 3221225472;
        v45[2] = __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke;
        v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v45[4] = v30;
        if (updateDisplayMetrics_withState__defaultOnce != -1)
          dispatch_once(&updateDisplayMetrics_withState__defaultOnce, v45);
        if (!updateDisplayMetrics_withState__classDebugEnabled)
          goto LABEL_37;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ DisplayEvent: Unplugged Display On duration=%f"), CFSTR("*******PLAWDMetricsService*******"), *(_QWORD *)&v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "lastPathComponent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay updateDisplayMetrics:withState:]");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v33, v34, 461);

        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();
      }

    }
LABEL_37:
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v35 = objc_opt_class();
      v43[0] = MEMORY[0x24BDAC760];
      v43[1] = 3221225472;
      v43[2] = __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke_100;
      v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v43[4] = v35;
      if (updateDisplayMetrics_withState__defaultOnce_98 != -1)
        dispatch_once(&updateDisplayMetrics_withState__defaultOnce_98, v43);
      if (updateDisplayMetrics_withState__classDebugEnabled_99)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ DisplayEvent: currDisp=%d, prevDisp=%d currCharging=%d"), CFSTR("*******PLAWDMetricsService*******"), v4, -[PLAWDDisplay prevDisplayOn](self, "prevDisplayOn"), -[PLAWDDisplay prevDeviceCharging](self, "prevDeviceCharging"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "lastPathComponent");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay updateDisplayMetrics:withState:]");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 468);

        PLLogCommon();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    -[PLAWDDisplay setPrevDisplayOn:](self, "setPrevDisplayOn:", v4);
    return;
  }
  -[PLAWDDisplay displayOnTimeStamp](self, "displayOnTimeStamp");
  v12 = v9 - v11;
  if (v9 - v11 > 0.0)
  {
    if (v4)
      v13 = CFSTR("UnpluggedDispOnDur");
    else
      v13 = CFSTR("PluggedDispOnDur");
    -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", v13, v9 - v11);
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v14 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke_105;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v14;
    if (updateDisplayMetrics_withState__defaultOnce_103 != -1)
      dispatch_once(&updateDisplayMetrics_withState__defaultOnce_103, block);
    if (updateDisplayMetrics_withState__classDebugEnabled_104)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ :DisplayMetrics: currCharging=%d, prevCharging=%d currDisp=%d dur=%f"), CFSTR("*******PLAWDMetricsService*******"), v4, -[PLAWDDisplay prevDeviceCharging](self, "prevDeviceCharging"), -[PLAWDDisplay prevDisplayOn](self, "prevDisplayOn"), *(_QWORD *)&v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay updateDisplayMetrics:withState:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 480);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  -[PLAWDDisplay setDisplayOnTimeStamp:](self, "setDisplayOnTimeStamp:", v9);
}

uint64_t __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateDisplayMetrics_withState__classDebugEnabled = result;
  return result;
}

uint64_t __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke_95(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateDisplayMetrics_withState__classDebugEnabled_94 = result;
  return result;
}

uint64_t __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke_100(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateDisplayMetrics_withState__classDebugEnabled_99 = result;
  return result;
}

uint64_t __47__PLAWDDisplay_updateDisplayMetrics_withState___block_invoke_105(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateDisplayMetrics_withState__classDebugEnabled_104 = result;
  return result;
}

- (void)updateMieMetrics:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  _BOOL4 v8;
  double v9;
  const __CFString *v10;
  double v11;
  PLAWDDisplay *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[5];

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  v8 = -[PLAWDDisplay prevMieOn](self, "prevMieOn");
  v9 = 0.0;
  if (v3)
  {
    if (v8)
      goto LABEL_8;
    -[PLAWDDisplay setMieOnTimeStamp:](self, "setMieOnTimeStamp:", v7);
    v10 = CFSTR("MieOnCount");
    v11 = 1.0;
    v12 = self;
    goto LABEL_7;
  }
  if (v8)
  {
    -[PLAWDDisplay displayOnTimeStamp](self, "displayOnTimeStamp");
    v9 = v7 - v13;
    if (v7 - v13 > 0.0)
    {
      v10 = CFSTR("MieOnDur");
      v12 = self;
      v11 = v7 - v13;
LABEL_7:
      -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](v12, "addEntryToDisplayAlsTable:withValue:", v10, v11);
    }
  }
LABEL_8:
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v14 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__PLAWDDisplay_updateMieMetrics___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v14;
    if (updateMieMetrics__defaultOnce != -1)
      dispatch_once(&updateMieMetrics__defaultOnce, block);
    if (updateMieMetrics__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : MieEvent: currMie=%d, prevMie=%d dur =%f"), CFSTR("*******PLAWDMetricsService*******"), v3, -[PLAWDDisplay prevMieOn](self, "prevMieOn"), *(_QWORD *)&v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay updateMieMetrics:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 498);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  -[PLAWDDisplay setPrevMieOn:](self, "setPrevMieOn:", v3);
}

uint64_t __33__PLAWDDisplay_updateMieMetrics___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  updateMieMetrics__classDebugEnabled = result;
  return result;
}

- (void)handleTouchCallback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];

  v4 = a3;
  if (-[PLAWDDisplay startTouchEntryId](self, "startTouchEntryId") < 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("entry"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      -[PLAWDDisplay setStartTouchEntryId:](self, "setStartTouchEntryId:", objc_msgSend(v5, "entryID"));
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __36__PLAWDDisplay_handleTouchCallback___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (handleTouchCallback__defaultOnce != -1)
        dispatch_once(&handleTouchCallback__defaultOnce, block);
      if (handleTouchCallback__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Touch Callback: startTouchEntryId=%lld"), CFSTR("*******PLAWDMetricsService*******"), -[PLAWDDisplay startTouchEntryId](self, "startTouchEntryId"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay handleTouchCallback:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 511);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }

  }
}

uint64_t __36__PLAWDDisplay_handleTouchCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleTouchCallback__classDebugEnabled = result;
  return result;
}

- (void)handleDisplayCallback:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  id v11;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v11 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Active"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Block"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Backlight"));

    if (v8)
    {
      -[PLAWDDisplay updateDisplayMetrics:withState:](self, "updateDisplayMetrics:withState:", 1, v6);
LABEL_6:
      v4 = v11;
      goto LABEL_7;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Block"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("MIE"));

    v4 = v11;
    if (v10)
    {
      -[PLAWDDisplay updateMieMetrics:](self, "updateMieMetrics:", v6);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)handleBacklightCallback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
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
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Brightness"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    if (v8 <= 0.0)
    {
      v12 = -1;
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uAmps"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "longValue");
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lux"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PLAWDDisplay getBklbucketIdx:withLux:](self, "getBklbucketIdx:withLux:", v10, objc_msgSend(v11, "longValue"));

    }
    if (-[PLAWDDisplay prevBklBucketIdx](self, "prevBklBucketIdx") != v12)
    {
      if (-[PLAWDDisplay prevBklBucketIdx](self, "prevBklBucketIdx") < 0)
      {
        v18 = 0.0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), -[PLAWDDisplay prevBklBucketIdx](self, "prevBklBucketIdx"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "entryDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSince1970");
        v16 = v15;
        -[PLAWDDisplay bklTimeStamp](self, "bklTimeStamp");
        v18 = v16 - v17;

        if (v18 > 0.0)
          -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", v13, v18);

      }
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v19 = objc_opt_class();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __40__PLAWDDisplay_handleBacklightCallback___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v19;
        if (handleBacklightCallback__defaultOnce != -1)
          dispatch_once(&handleBacklightCallback__defaultOnce, block);
        if (handleBacklightCallback__classDebugEnabled)
        {
          v20 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("uAmps"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "unsignedLongValue");
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lux"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%@ :Backlight Event: MicroAmps=%lu Lux=%lu prevBucketIdx=%ld duration=%f newBucketIdx=%ld"), CFSTR("*******PLAWDMetricsService*******"), v22, objc_msgSend(v23, "unsignedLongValue"), -[PLAWDDisplay prevBklBucketIdx](self, "prevBklBucketIdx"), *(_QWORD *)&v18, v12);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastPathComponent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay handleBacklightCallback:]");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 577);

          PLLogCommon();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();

        }
      }
      if (v12 < 0)
      {
        -[PLAWDDisplay setPrevBklBucketIdx:](self, "setPrevBklBucketIdx:", -1);
      }
      else
      {
        -[PLAWDDisplay setPrevBklBucketIdx:](self, "setPrevBklBucketIdx:", v12);
        objc_msgSend(v5, "entryDate");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "timeIntervalSince1970");
        -[PLAWDDisplay setBklTimeStamp:](self, "setBklTimeStamp:");

      }
    }
  }

}

uint64_t __40__PLAWDDisplay_handleBacklightCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBacklightCallback__classDebugEnabled = result;
  return result;
}

- (void)handleAlsUserPreferencesCallback:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", CFSTR("AlsCount"), 1.0);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      block = MEMORY[0x24BDAC760];
      v13 = 3221225472;
      v14 = __49__PLAWDDisplay_handleAlsUserPreferencesCallback___block_invoke;
      v15 = &__block_descriptor_40_e5_v8__0lu32l8;
      v16 = v5;
      if (handleAlsUserPreferencesCallback__defaultOnce != -1)
        dispatch_once(&handleAlsUserPreferencesCallback__defaultOnce, &block);
      if (handleAlsUserPreferencesCallback__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : ALS Curve changed by user"), CFSTR("*******PLAWDMetricsService*******"), block, v13, v14, v15, v16);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay handleAlsUserPreferencesCallback:]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 596);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
  }

}

uint64_t __49__PLAWDDisplay_handleAlsUserPreferencesCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleAlsUserPreferencesCallback__classDebugEnabled = result;
  return result;
}

- (void)handleBatteryCallback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD block[5];

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AdapterInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (-[PLAWDDisplay prevDisplayOn](self, "prevDisplayOn")
      && (_DWORD)v7 != -[PLAWDDisplay prevDeviceCharging](self, "prevDeviceCharging"))
    {
      -[PLAWDDisplay updateDisplayMetrics:withState:](self, "updateDisplayMetrics:withState:", 0, v7);
    }
    v8 = -[PLAWDDisplay prevDeviceCharging](self, "prevDeviceCharging");
    if ((_DWORD)v7)
    {
      if (v8)
        goto LABEL_24;
      objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSince1970");
      v11 = v10;

      -[PLAWDDisplay bklPowerRailTimeStamp](self, "bklPowerRailTimeStamp");
      v13 = (v11 - v12) / 3600.0;
      -[PLAWDDisplay prevBklPower](self, "prevBklPower");
      if (v14 > 0.0 && v13 > 0.0)
      {
        -[PLAWDDisplay prevBklPower](self, "prevBklPower");
        -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", CFSTR("BacklightPower"), v13 * v15);
      }
      if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        goto LABEL_24;
      v16 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __38__PLAWDDisplay_handleBatteryCallback___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v16;
      if (handleBatteryCallback__defaultOnce != -1)
        dispatch_once(&handleBatteryCallback__defaultOnce, block);
      if (!handleBatteryCallback__classDebugEnabled)
        goto LABEL_24;
      v17 = (void *)MEMORY[0x24BDD17C8];
      -[PLAWDDisplay prevBklPower](self, "prevBklPower");
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@ : BacklightPowerRail: Charger event - mWhr=%f "), CFSTR("*******PLAWDMetricsService*******"), v13 * v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay handleBatteryCallback:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 619);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();
    }
    else
    {
      if (!v8)
        goto LABEL_24;
      objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSince1970");
      -[PLAWDDisplay setBklPowerRailTimeStamp:](self, "setBklPowerRailTimeStamp:");

      if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        goto LABEL_24;
      v26 = objc_opt_class();
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __38__PLAWDDisplay_handleBatteryCallback___block_invoke_126;
      v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v31[4] = v26;
      if (handleBatteryCallback__defaultOnce_124 != -1)
        dispatch_once(&handleBatteryCallback__defaultOnce_124, v31);
      if (!handleBatteryCallback__classDebugEnabled_125)
        goto LABEL_24;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : BacklightPowerRail: Charger event - update timestamp "), CFSTR("*******PLAWDMetricsService*******"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay handleBatteryCallback:]");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v29, v30, 624);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();
    }

LABEL_24:
    -[PLAWDDisplay setPrevDeviceCharging:](self, "setPrevDeviceCharging:", v7);
  }

}

uint64_t __38__PLAWDDisplay_handleBatteryCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBatteryCallback__classDebugEnabled = result;
  return result;
}

uint64_t __38__PLAWDDisplay_handleBatteryCallback___block_invoke_126(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBatteryCallback__classDebugEnabled_125 = result;
  return result;
}

- (void)handleAlsEnabledCallback:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[5];

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ALSEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if ((_DWORD)v7 != -[PLAWDDisplay prevAlsOn](self, "prevAlsOn"))
    {
      -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", CFSTR("AlsEnableCnt"), 1.0);
      -[PLAWDDisplay setPrevAlsOn:](self, "setPrevAlsOn:", v7);
    }
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v8 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __41__PLAWDDisplay_handleAlsEnabledCallback___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v8;
      if (handleAlsEnabledCallback__defaultOnce != -1)
        dispatch_once(&handleAlsEnabledCallback__defaultOnce, block);
      if (handleAlsEnabledCallback__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : ALS state changed by user. alsOn=%d"), CFSTR("*******PLAWDMetricsService*******"), v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay handleAlsEnabledCallback:]");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 640);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
  }

}

uint64_t __41__PLAWDDisplay_handleAlsEnabledCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleAlsEnabledCallback__classDebugEnabled = result;
  return result;
}

- (void)finalizeDisplayAlsTable
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  const __CFString *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _QWORD block[5];
  _QWORD v34[5];

  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  if (-[PLAWDDisplay prevDisplayOn](self, "prevDisplayOn"))
  {
    -[PLAWDDisplay displayOnTimeStamp](self, "displayOnTimeStamp");
    v7 = v5 - v6;
    if (v5 - v6 > 0.0)
    {
      if (-[PLAWDDisplay prevDeviceCharging](self, "prevDeviceCharging"))
        v8 = CFSTR("PluggedDispOnDur");
      else
        v8 = CFSTR("UnpluggedDispOnDur");
      -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", v8, v7);
    }
    if (-[PLAWDDisplay prevMieOn](self, "prevMieOn"))
    {
      -[PLAWDDisplay mieOnTimeStamp](self, "mieOnTimeStamp");
      if (v5 - v9 > 0.0)
        -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", CFSTR("MieOnDur"));
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), -[PLAWDDisplay prevBklBucketIdx](self, "prevBklBucketIdx"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAWDDisplay bklTimeStamp](self, "bklTimeStamp");
    if (v5 - v11 > 0.0)
      -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", v10);
    -[PLAWDDisplay bklPowerRailTimeStamp](self, "bklPowerRailTimeStamp");
    v13 = v12;
    if (!-[PLAWDDisplay prevDeviceCharging](self, "prevDeviceCharging"))
    {
      -[PLAWDDisplay prevBklPower](self, "prevBklPower");
      if (v14 > 0.0)
      {
        v15 = (v5 - v13) / 3600.0;
        if (v15 > 0.0)
        {
          -[PLAWDDisplay prevBklPower](self, "prevBklPower");
          -[PLAWDDisplay addEntryToDisplayAlsTable:withValue:](self, "addEntryToDisplayAlsTable:withValue:", CFSTR("BacklightPower"), v15 * v16);
        }
      }
    }
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v17 = objc_opt_class();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __39__PLAWDDisplay_finalizeDisplayAlsTable__block_invoke;
      v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v34[4] = v17;
      if (finalizeDisplayAlsTable_defaultOnce != -1)
        dispatch_once(&finalizeDisplayAlsTable_defaultOnce, v34);
      if (finalizeDisplayAlsTable_classDebugEnabled)
      {
        v18 = (void *)MEMORY[0x24BDD17C8];
        -[PLAWDDisplay prevBklPower](self, "prevBklPower");
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ : Finalize Display table backlightpower=%f dur=%f"), CFSTR("*******PLAWDMetricsService*******"), v19, *(_QWORD *)&v7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay finalizeDisplayAlsTable]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 672);

        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }

  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v26 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__PLAWDDisplay_finalizeDisplayAlsTable__block_invoke_135;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v26;
    if (finalizeDisplayAlsTable_defaultOnce_133 != -1)
      dispatch_once(&finalizeDisplayAlsTable_defaultOnce_133, block);
    if (finalizeDisplayAlsTable_classDebugEnabled_134)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Finalize Display table"), CFSTR("*******PLAWDMetricsService*******"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "lastPathComponent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay finalizeDisplayAlsTable]");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 676);

      PLLogCommon();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
}

uint64_t __39__PLAWDDisplay_finalizeDisplayAlsTable__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  finalizeDisplayAlsTable_classDebugEnabled = result;
  return result;
}

uint64_t __39__PLAWDDisplay_finalizeDisplayAlsTable__block_invoke_135(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  finalizeDisplayAlsTable_classDebugEnabled_134 = result;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
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
  double v33;
  double v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  unsigned int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  double v49;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  double v109;
  double v110;
  void *v111;
  double v112;
  double v113;
  void *v114;
  double v115;
  double v116;
  void *v117;
  void *v118;
  double v119;
  double v120;
  void *v121;
  void *v122;
  double v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  NSObject *v130;
  uint64_t v131;
  double v132;
  double v133;
  void *v134;
  double v135;
  double v136;
  void *v137;
  void *v138;
  void *v139;
  double v140;
  double v141;
  void *v142;
  double v143;
  double v144;
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
  double v158;
  double v159;
  void *v160;
  double v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  NSObject *v167;
  void *v168;
  id v169;
  uint64_t j;
  id v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  double v177;
  double v178;
  void *v179;
  double v180;
  double v181;
  void *v182;
  double v183;
  double v184;
  void *v185;
  double v186;
  double v187;
  void *v188;
  double v189;
  double v190;
  void *v191;
  double v192;
  double v193;
  void *v194;
  double v195;
  double v196;
  void *v197;
  double v198;
  double v199;
  void *v200;
  double v201;
  double v202;
  void *v203;
  double v204;
  double v205;
  uint64_t v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  NSObject *v212;
  void *v214;
  uint64_t v215;
  void *v216;
  uint64_t v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  id v222;
  void *v223;
  id v224;
  void *v225;
  void *v226;
  id v227;
  id v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  PLAWDDisplay *v240;
  void *v241;
  void *v242;
  _QWORD v243[5];
  _QWORD v244[5];
  _QWORD v245[5];
  _QWORD v246[5];
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  _QWORD block[5];
  _BYTE v252[128];
  _OWORD v253[9];
  uint64_t v254;

  v254 = *MEMORY[0x24BDAC8D0];
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

  if (v8)
  {
    v15 = objc_msgSend(v6, "longValue");
    if (v15 == 2031625)
    {
      -[PLAWDDisplay touchEventCallback](self, "touchEventCallback");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "requestEntry");

      sleep(5u);
      objc_msgSend(MEMORY[0x24BE75260], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75350]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAWDAuxMetrics operator](self, "operator");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "storage");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "entryForKey:withID:", v16, -[PLAWDDisplay startTouchEntryId](self, "startTouchEntryId"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLAWDAuxMetrics operator](self, "operator");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "storage");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "lastEntryForKey:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)objc_opt_new();
      if (v21)
      {
        objc_msgSend(v21, "setTimestamp:", objc_msgSend(v7, "getAWDTimestamp"));
        objc_msgSend(v21, "setTouchStateOnDuration:", 0);
        objc_msgSend(v21, "setTouchStateOffDuration:", 0);
        objc_msgSend(v21, "setTouchStateActiveDuration:", 0);
        objc_msgSend(v21, "setTouchStateReadyDuration:", 0);
        objc_msgSend(v21, "setTouchStateAnticipateDuration:", 0);
        objc_msgSend(v21, "setTouchStateOthersDuration:", 0);
        v57 = 0.0;
        v240 = self;
        v242 = v21;
        if (v19 && v20)
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("On"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "doubleValue");
          v60 = v59;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("On"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "doubleValue");
          v63 = v60 - v62;

          if (v63 > 0.0)
            objc_msgSend(v242, "setTouchStateOnDuration:", v63);
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Off"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "doubleValue");
          v66 = v65;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Off"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "doubleValue");
          v69 = v66 - v68;

          if (v69 > 0.0)
            objc_msgSend(v242, "setTouchStateOffDuration:", v69);
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Active"));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "doubleValue");
          v72 = v71;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Active"));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "doubleValue");
          v75 = v72 - v74;

          if (v75 > 0.0)
            objc_msgSend(v242, "setTouchStateActiveDuration:", v75);
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Ready"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "doubleValue");
          v78 = v77;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Ready"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "doubleValue");
          v81 = v78 - v80;

          if (v81 > 0.0)
            objc_msgSend(v242, "setTouchStateReadyDuration:", v81);
          v227 = v7;
          v230 = v16;
          v225 = v8;
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Anticipate"));
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "doubleValue");
          v84 = v83;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Anticipate"));
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "doubleValue");
          v87 = v84 - v86;

          if (v87 > 0.0)
            objc_msgSend(v242, "setTouchStateAnticipateDuration:", v87);
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("AutoReady"));
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v237, "doubleValue");
          v89 = v88;
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("AutoScan"));
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v233, "doubleValue");
          v91 = v89 + v90;
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("FaceDetected"));
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v223, "doubleValue");
          v93 = v91 + v92;
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("StationaryFingers"));
          v220 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v220, "doubleValue");
          v95 = v93 + v94;
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("UILock"));
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v218, "doubleValue");
          v97 = v95 + v96;
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Unknown"));
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v216, "doubleValue");
          v99 = v97 + v98;
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("VSFOMCal"));
          v214 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v214, "doubleValue");
          v101 = v99 + v100;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AutoReady"));
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v102, "doubleValue");
          v104 = v103;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AutoScan"));
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "doubleValue");
          v107 = v104 + v106;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("FaceDetected"));
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v108, "doubleValue");
          v110 = v107 + v109;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("StationaryFingers"));
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "doubleValue");
          v113 = v110 + v112;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("UILock"));
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "doubleValue");
          v116 = v113 + v115;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Unknown"));
          v117 = v20;
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v118, "doubleValue");
          v120 = v116 + v119;
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("VSFOMCal"));
          v121 = v19;
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "doubleValue");
          v57 = v101 - (v120 + v123);

          v19 = v121;
          v20 = v117;

          v21 = v242;
          objc_msgSend(v242, "setTouchStateOthersDuration:", v57);
          v8 = v225;
          v7 = v227;
          self = v240;
          v16 = v230;
        }
        -[PLAWDDisplay setTouchSubmitCnt:](self, "setTouchSubmitCnt:", -[PLAWDDisplay touchSubmitCnt](self, "touchSubmitCnt") + 1);
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v124 = objc_opt_class();
          v244[0] = MEMORY[0x24BDAC760];
          v244[1] = 3221225472;
          v244[2] = __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_198;
          v244[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v244[4] = v124;
          if (submitDataToAWDServer_withAwdConn__defaultOnce_196 != -1)
            dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_196, v244);
          if (submitDataToAWDServer_withAwdConn__classDebugEnabled_197)
          {
            v234 = v20;
            v238 = v19;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Submit Touch stats: submit cnt=%ld metric=%@"), CFSTR("*******PLAWDMetricsService*******"), -[PLAWDDisplay touchSubmitCnt](v240, "touchSubmitCnt"), v21);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v126 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v127, "lastPathComponent");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay submitDataToAWDServer:withAwdConn:]");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "logMessage:fromFile:fromFunction:fromLineNumber:", v125, v128, v129, 893);

            PLLogCommon();
            v130 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
              -[PLAWDDisplay startMetricCollection:].cold.1();

            v20 = v234;
            v19 = v238;
            v21 = v242;
          }
        }
        self = v240;
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v131 = objc_opt_class();
          v243[0] = MEMORY[0x24BDAC760];
          v243[1] = 3221225472;
          v243[2] = __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_203;
          v243[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v243[4] = v131;
          if (submitDataToAWDServer_withAwdConn__defaultOnce_201 != -1)
            dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_201, v243);
          if (submitDataToAWDServer_withAwdConn__classDebugEnabled_202)
          {
            v228 = v7;
            v231 = v16;
            v224 = v6;
            v226 = v8;
            v219 = (void *)MEMORY[0x24BDD17C8];
            v217 = objc_msgSend(v19, "entryID");
            v215 = objc_msgSend(v20, "entryID");
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("On"));
            v221 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v221, "doubleValue");
            v133 = v132;
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("On"));
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v134, "doubleValue");
            v136 = v133 - v135;
            v137 = v19;
            objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Off"));
            v138 = v20;
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v139, "doubleValue");
            v141 = v140;
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Off"));
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v142, "doubleValue");
            v144 = v141 - v143;
            objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("Ready"));
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "doubleValue");
            v147 = v146;
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Ready"));
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v148, "doubleValue");
            v150 = v147 - v149;
            objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("Anticipate"));
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v151, "doubleValue");
            v153 = v152;
            objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("Anticipate"));
            v154 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v154, "doubleValue");
            v156 = v153 - v155;
            v235 = v138;
            objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("Active"));
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "doubleValue");
            v159 = v158;
            v239 = v137;
            objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("Active"));
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v160, "doubleValue");
            objc_msgSend(v219, "stringWithFormat:", CFSTR("%@ : Submit Touch stats: start.entryId=%llu end.entryId=%llu On=%f Off=%f Ready=%f Anticipate=%f Active=%f Others=%f"), CFSTR("*******PLAWDMetricsService*******"), v217, v215, *(_QWORD *)&v136, *(_QWORD *)&v144, *(_QWORD *)&v150, *(_QWORD *)&v156, v159 - v161, *(_QWORD *)&v57);
            v162 = (void *)objc_claimAutoreleasedReturnValue();

            v163 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
            v164 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v164, "lastPathComponent");
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay submitDataToAWDServer:withAwdConn:]");
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "logMessage:fromFile:fromFunction:fromLineNumber:", v162, v165, v166, 895);

            PLLogCommon();
            v167 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v167, OS_LOG_TYPE_DEBUG))
              -[PLAWDDisplay startMetricCollection:].cold.1();

            v6 = v224;
            v8 = v226;
            v7 = v228;
            v16 = v231;
            v19 = v239;
            self = v240;
            v20 = v235;
            v21 = v242;
          }
        }
        objc_msgSend(v8, "setMetric:", v21);
      }
      if (v20)
      {
        -[PLAWDDisplay setStartTouchEntryId:](self, "setStartTouchEntryId:", objc_msgSend(v20, "entryID"));
      }
      else
      {
        -[PLAWDDisplay setStartTouchEntryId:](self, "setStartTouchEntryId:", -1);
        -[PLAWDDisplay touchEventCallback](self, "touchEventCallback");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v168, "requestEntry");

      }
      goto LABEL_104;
    }
    if (v15 == 2031622)
    {
      -[PLAWDDisplay finalizeDisplayAlsTable](self, "finalizeDisplayAlsTable");
      +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("DisplayAlsMetrics"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAWDAuxMetrics operator](self, "operator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "storage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v16, 86400.0, v12, v14 - v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_opt_new();
      v241 = v21;
      v232 = v20;
      v236 = v19;
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v22 = objc_opt_class();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v22;
        if (submitDataToAWDServer_withAwdConn__defaultOnce != -1)
          dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce, block);
        if (submitDataToAWDServer_withAwdConn__classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : %@"), CFSTR("*******PLAWDMetricsService*******"), v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay submitDataToAWDServer:withAwdConn:]");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 698);

          PLLogCommon();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();

          v20 = v232;
          v19 = v236;
          v21 = v241;
        }
      }
      if (v21)
      {
        v229 = v16;
        objc_msgSend(v21, "setTimestamp:", objc_msgSend(v7, "getAWDTimestamp"));
        memset(v253, 0, 140);
        objc_msgSend(v21, "setPluggedDisplayOnDuration:", 0);
        objc_msgSend(v21, "setUnpluggedDisplayOnDuration:", 0);
        objc_msgSend(v21, "setDispOnCount:", 0);
        objc_msgSend(v21, "setMieCount:", 0);
        objc_msgSend(v21, "setMieDuration:", 0);
        objc_msgSend(v21, "setTotalDisplayPower:", 0);
        objc_msgSend(v21, "setTotalBacklightPower:", 0);
        objc_msgSend(v21, "setAlsAutoBrightnessChangeCount:", 0);
        objc_msgSend(v21, "setAlsAutoBrightnessLux:", 0);
        objc_msgSend(v21, "setAlsAutoBrightnessSlider:", 0);
        objc_msgSend(v21, "setAlsBrightnessEnableCnt:", 0);
        objc_msgSend(v21, "setDisplayIdlePercentage:", 0);
        objc_msgSend(v21, "setAlsAutoBrightnessCurveE0A:", 0);
        objc_msgSend(v21, "setAlsAutoBrightnessCurveE0B:", 0);
        objc_msgSend(v21, "setAlsAutoBrightnessCurveE1:", 0);
        objc_msgSend(v21, "setAlsAutoBrightnessCurveE2:", 0);
        objc_msgSend(v21, "setAlsAutoBrightnessCurveL0A:", 0);
        objc_msgSend(v21, "setAlsAutoBrightnessCurveL0B:", 0);
        objc_msgSend(v21, "setAlsAutoBrightnessCurveL1:", 0);
        objc_msgSend(v21, "setAlsAutoBrightnessCurveL2:", 0);
        objc_msgSend(v21, "setAlsAutoBrightnessSlider:", 0);
        objc_msgSend(v21, "setAlsAutoBrightnessCurveEdynth:", 0);
        v249 = 0u;
        v250 = 0u;
        v247 = 0u;
        v248 = 0u;
        v29 = v20;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v247, v252, 16);
        if (v30)
        {
          v31 = v30;
          v222 = v6;
          v32 = *(_QWORD *)v248;
          v33 = 0.0;
          v34 = 0.0;
          do
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v248 != v32)
                objc_enumerationMutation(v29);
              v36 = *(void **)(*((_QWORD *)&v247 + 1) + 8 * i);
              objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("MetricsKey"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("MetricsValue"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "doubleValue");
              v40 = v39;

              if (objc_msgSend(v37, "isEqualToString:", CFSTR("UnpluggedDispOnDur")))
              {
                v34 = v34 + v40;
                objc_msgSend(v241, "setUnpluggedDisplayOnDuration:", (v40 * 1000.0));
              }
              else if (objc_msgSend(v37, "isEqualToString:", CFSTR("PluggedDispOnDur")))
              {
                v34 = v34 + v40;
                objc_msgSend(v241, "setPluggedDisplayOnDuration:", (v40 * 1000.0));
              }
              else if (objc_msgSend(v37, "isEqualToString:", CFSTR("DisplayOnCount")))
              {
                objc_msgSend(v241, "setDispOnCount:", v40);
              }
              else if (objc_msgSend(v37, "isEqualToString:", CFSTR("MieOnCount")))
              {
                objc_msgSend(v241, "setMieCount:", v40);
              }
              else if (objc_msgSend(v37, "isEqualToString:", CFSTR("MieOnDur")))
              {
                objc_msgSend(v241, "setMieDuration:", (v40 * 1000.0));
              }
              else if (objc_msgSend(v37, "isEqualToString:", CFSTR("DisplayPower")))
              {
                objc_msgSend(v241, "setTotalDisplayPower:", (v40 * 1000.0));
              }
              else if (objc_msgSend(v37, "isEqualToString:", CFSTR("BacklightPower")))
              {
                objc_msgSend(v241, "setTotalBacklightPower:", (v40 * 1000.0));
              }
              else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("IdlePercentDur")) & 1) != 0)
              {
                v33 = v40;
              }
              else if (objc_msgSend(v37, "isEqualToString:", CFSTR("AlsCount")))
              {
                objc_msgSend(v241, "setAlsAutoBrightnessChangeCount:", v40);
              }
              else if (objc_msgSend(v37, "isEqualToString:", CFSTR("AlsEnableCnt")))
              {
                objc_msgSend(v241, "setAlsBrightnessEnableCnt:", v40);
              }
              else
              {
                v41 = objc_msgSend(v37, "intValue");
                if ((v41 & 0x80000000) == 0)
                  *((_DWORD *)v253 + v41) = (v40 * 1000.0);
              }

            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v247, v252, 16);
          }
          while (v31);

          v6 = v222;
          v19 = v236;
          if (v34 > 0.0)
          {
            if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
            {
              v42 = objc_opt_class();
              v246[0] = MEMORY[0x24BDAC760];
              v246[1] = 3221225472;
              v246[2] = __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_143;
              v246[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v246[4] = v42;
              if (submitDataToAWDServer_withAwdConn__defaultOnce_141 != -1)
                dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_141, v246);
              if (submitDataToAWDServer_withAwdConn__classDebugEnabled_142)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Submit Disp idle duration: dispDur=%f dispIdleDur=%f"), CFSTR("*******PLAWDMetricsService*******"), *(_QWORD *)&v34, *(_QWORD *)&v33);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "lastPathComponent");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay submitDataToAWDServer:withAwdConn:]");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "logMessage:fromFile:fromFunction:fromLineNumber:", v43, v46, v47, 779);

                PLLogCommon();
                v48 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                  -[PLAWDDisplay startMetricCollection:].cold.1();

                v19 = v236;
              }
            }
            v49 = v33 * 100.0 / v34;
            if (v49 > 0.0 && v49 <= 100.0)
              objc_msgSend(v241, "setDisplayIdlePercentage:", v49);
          }
        }
        else
        {

          v19 = v236;
        }
        v169 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        for (j = 0; j != 140; j += 4)
        {
          v171 = objc_alloc_init(MEMORY[0x24BED1F18]);
          objc_msgSend(v171, "setBucketDuration:", *(unsigned int *)((char *)v253 + j));
          objc_msgSend(v169, "addObject:", v171);

        }
        v21 = v241;
        objc_msgSend(v241, "setBacklightBuckets:", v169);
        if ((objc_msgSend(MEMORY[0x24BE74FD8], "isMac") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BE75260], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE75360]);
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAWDAuxMetrics operator](self, "operator");
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v173, "storage");
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v174, "lastEntryForKey:", v172);
          v175 = (void *)objc_claimAutoreleasedReturnValue();

          if (v175)
          {
            objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("E0a"));
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v176, "doubleValue");
            v178 = v177;

            objc_msgSend(v241, "setAlsAutoBrightnessCurveE0A:", (int)v178);
            objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("E0b"));
            v179 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v179, "doubleValue");
            v181 = v180;

            objc_msgSend(v241, "setAlsAutoBrightnessCurveE0B:", (int)v181);
            objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("E1"));
            v182 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v182, "doubleValue");
            v184 = v183;

            objc_msgSend(v241, "setAlsAutoBrightnessCurveE1:", (int)v184);
            objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("E2"));
            v185 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v185, "doubleValue");
            v187 = v186;

            objc_msgSend(v241, "setAlsAutoBrightnessCurveE2:", (int)v187);
            objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("L0a"));
            v188 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v188, "doubleValue");
            v190 = v189;

            objc_msgSend(v241, "setAlsAutoBrightnessCurveL0A:", (int)v190);
            objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("L0b"));
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v191, "doubleValue");
            v193 = v192;

            objc_msgSend(v241, "setAlsAutoBrightnessCurveL0B:", (int)v193);
            objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("L1"));
            v194 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v194, "doubleValue");
            v196 = v195;

            objc_msgSend(v241, "setAlsAutoBrightnessCurveL1:", (int)v196);
            objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("L2"));
            v197 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v197, "doubleValue");
            v199 = v198;

            objc_msgSend(v241, "setAlsAutoBrightnessCurveL2:", (int)v199);
            objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("S"));
            v200 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v200, "doubleValue");
            v202 = v201;

            objc_msgSend(v241, "setAlsAutoBrightnessSlider:", v202);
            objc_msgSend(v175, "objectForKeyedSubscript:", CFSTR("Lux"));
            v203 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v203, "doubleValue");
            v205 = v204;

            objc_msgSend(v241, "setAlsAutoBrightnessLux:", v205);
          }

          v21 = v241;
        }
        -[PLAWDDisplay setDispSubmitCnt:](self, "setDispSubmitCnt:", -[PLAWDDisplay dispSubmitCnt](self, "dispSubmitCnt") + 1);
        v20 = v232;
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v206 = objc_opt_class();
          v245[0] = MEMORY[0x24BDAC760];
          v245[1] = 3221225472;
          v245[2] = __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_170;
          v245[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v245[4] = v206;
          if (submitDataToAWDServer_withAwdConn__defaultOnce_168 != -1)
            dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_168, v245);
          if (submitDataToAWDServer_withAwdConn__classDebugEnabled_169)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Submit Display stats: submit cnt=%ld "), CFSTR("*******PLAWDMetricsService*******"), -[PLAWDDisplay dispSubmitCnt](self, "dispSubmitCnt"));
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            v208 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDDisplay.m");
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v209, "lastPathComponent");
            v210 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDDisplay submitDataToAWDServer:withAwdConn:]");
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v208, "logMessage:fromFile:fromFunction:fromLineNumber:", v207, v210, v211, 835);

            PLLogCommon();
            v212 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v212, OS_LOG_TYPE_DEBUG))
              -[PLAWDDisplay startMetricCollection:].cold.1();

            v20 = v232;
            v19 = v236;
            v21 = v241;
          }
        }
        objc_msgSend(v8, "setMetric:", v21);

        v16 = v229;
      }
      -[PLAWDDisplay reInitDisplayBacklightAlsStats](self, "reInitDisplayBacklightAlsStats");
LABEL_104:
      v51 = objc_msgSend(v7, "submitMetric:", v8);

      goto LABEL_105;
    }
    v51 = 0;
  }
  else
  {
    v51 = 1;
  }
LABEL_105:

  return v51;
}

uint64_t __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitDataToAWDServer_withAwdConn__classDebugEnabled = result;
  return result;
}

uint64_t __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_143(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitDataToAWDServer_withAwdConn__classDebugEnabled_142 = result;
  return result;
}

uint64_t __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_170(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitDataToAWDServer_withAwdConn__classDebugEnabled_169 = result;
  return result;
}

uint64_t __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_198(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitDataToAWDServer_withAwdConn__classDebugEnabled_197 = result;
  return result;
}

uint64_t __50__PLAWDDisplay_submitDataToAWDServer_withAwdConn___block_invoke_203(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitDataToAWDServer_withAwdConn__classDebugEnabled_202 = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)displayEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDisplayEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PLEntryNotificationOperatorComposition)backlightEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBacklightEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PLEntryNotificationOperatorComposition)alsUserPreferencesEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAlsUserPreferencesEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLEntryNotificationOperatorComposition)batteryEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBatteryEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLEntryNotificationOperatorComposition)backlightRailCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBacklightRailCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLEntryNotificationOperatorComposition)touchEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTouchEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLEntryNotificationOperatorComposition)alsEnabledEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAlsEnabledEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)prevDisplayOn
{
  return self->_prevDisplayOn;
}

- (void)setPrevDisplayOn:(BOOL)a3
{
  self->_prevDisplayOn = a3;
}

- (double)displayOnTimeStamp
{
  return self->_displayOnTimeStamp;
}

- (void)setDisplayOnTimeStamp:(double)a3
{
  self->_displayOnTimeStamp = a3;
}

- (BOOL)prevDeviceCharging
{
  return self->_prevDeviceCharging;
}

- (void)setPrevDeviceCharging:(BOOL)a3
{
  self->_prevDeviceCharging = a3;
}

- (BOOL)prevMieOn
{
  return self->_prevMieOn;
}

- (void)setPrevMieOn:(BOOL)a3
{
  self->_prevMieOn = a3;
}

- (double)mieOnTimeStamp
{
  return self->_mieOnTimeStamp;
}

- (void)setMieOnTimeStamp:(double)a3
{
  self->_mieOnTimeStamp = a3;
}

- (double)bklTimeStamp
{
  return self->_bklTimeStamp;
}

- (void)setBklTimeStamp:(double)a3
{
  self->_bklTimeStamp = a3;
}

- (int64_t)prevBklBucketIdx
{
  return self->_prevBklBucketIdx;
}

- (void)setPrevBklBucketIdx:(int64_t)a3
{
  self->_prevBklBucketIdx = a3;
}

- (double)prevBklChgTimeStamp
{
  return self->_prevBklChgTimeStamp;
}

- (void)setPrevBklChgTimeStamp:(double)a3
{
  self->_prevBklChgTimeStamp = a3;
}

- (int64_t)startTouchEntryId
{
  return self->_startTouchEntryId;
}

- (void)setStartTouchEntryId:(int64_t)a3
{
  self->_startTouchEntryId = a3;
}

- (double)bklPowerRailTimeStamp
{
  return self->_bklPowerRailTimeStamp;
}

- (void)setBklPowerRailTimeStamp:(double)a3
{
  self->_bklPowerRailTimeStamp = a3;
}

- (int64_t)dispSubmitCnt
{
  return self->_dispSubmitCnt;
}

- (void)setDispSubmitCnt:(int64_t)a3
{
  self->_dispSubmitCnt = a3;
}

- (int64_t)touchSubmitCnt
{
  return self->_touchSubmitCnt;
}

- (void)setTouchSubmitCnt:(int64_t)a3
{
  self->_touchSubmitCnt = a3;
}

- (BOOL)prevAlsOn
{
  return self->_prevAlsOn;
}

- (void)setPrevAlsOn:(BOOL)a3
{
  self->_prevAlsOn = a3;
}

- (double)prevBklPower
{
  return self->_prevBklPower;
}

- (void)setPrevBklPower:(double)a3
{
  self->_prevBklPower = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alsEnabledEventCallback, 0);
  objc_storeStrong((id *)&self->_touchEventCallback, 0);
  objc_storeStrong((id *)&self->_backlightRailCallback, 0);
  objc_storeStrong((id *)&self->_batteryEventCallback, 0);
  objc_storeStrong((id *)&self->_alsUserPreferencesEventCallback, 0);
  objc_storeStrong((id *)&self->_backlightEventCallback, 0);
  objc_storeStrong((id *)&self->_displayEventCallback, 0);
}

- (void)startMetricCollection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_222C6D000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
