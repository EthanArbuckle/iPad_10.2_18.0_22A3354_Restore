@implementation PLAWDCamera

+ (id)getSharedObjWithOperator:(id)a3
{
  void *v3;
  id v4;
  PLAWDCamera *v5;
  void *v6;

  v3 = (void *)plAwdCamera;
  if (!plAwdCamera)
  {
    v4 = a3;
    v5 = -[PLAWDAuxMetrics initWithOperator:]([PLAWDCamera alloc], "initWithOperator:", v4);

    v6 = (void *)plAwdCamera;
    plAwdCamera = (uint64_t)v5;

    v3 = (void *)plAwdCamera;
  }
  return v3;
}

+ (id)entryAggregateDefinitions
{
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = kPLAWDAggregateNameCameraMetrics;
  objc_msgSend(a1, "entryAggregateDefinitionAwdCamera");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryAggregateDefinitionAwdCamera
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
  uint64_t v14;
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
  v22[0] = &unk_24EB646D0;
  v22[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v23[1] = *MEMORY[0x24BE751E8];
  v19[0] = kPLAWDCameraMetricsKey;
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = kPLAWDCameraMetricsValue;
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
  v17 = &unk_24EB646E0;
  v15 = *MEMORY[0x24BE75198];
  v16 = &unk_24EB646E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  v23[3] = *MEMORY[0x24BE751A8];
  v14 = kPLAWDCameraMetricsValue;
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
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
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
  _QWORD v28[5];
  _QWORD v29[5];

  v4 = a3;
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  v6 = objc_msgSend(v4, "longValue");
  if (v6 == 2031627)
  {
    -[PLAWDCamera initCameraStats](self, "initCameraStats");
    v7 = *MEMORY[0x24BE75218];
    objc_msgSend(MEMORY[0x24BE75258], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE75330]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x24BE74FC8]);
    -[PLAWDAuxMetrics operator](self, "operator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __37__PLAWDCamera_startMetricCollection___block_invoke;
    v29[3] = &unk_24EB5CDA0;
    v29[4] = self;
    v12 = (void *)objc_msgSend(v9, "initWithOperator:forEntryKey:withBlock:", v10, v8, v29);

    -[PLAWDCamera setCameraEventCallback:](self, "setCameraEventCallback:", v12);
    objc_msgSend(MEMORY[0x24BE75258], "entryKeyForType:andName:", v7, *MEMORY[0x24BE75338]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc(MEMORY[0x24BE74FC8]);
    -[PLAWDAuxMetrics operator](self, "operator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = __37__PLAWDCamera_startMetricCollection___block_invoke_2;
    v28[3] = &unk_24EB5CDA0;
    v28[4] = self;
    v16 = (void *)objc_msgSend(v14, "initWithOperator:forEntryKey:withBlock:", v15, v13, v28);

    -[PLAWDCamera setCameraEventCallbackTorch:](self, "setCameraEventCallbackTorch:", v16);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      block = v11;
      v24 = 3221225472;
      v25 = __37__PLAWDCamera_startMetricCollection___block_invoke_3;
      v26 = &__block_descriptor_40_e5_v8__0lu32l8;
      v27 = objc_opt_class();
      if (startMetricCollection__defaultOnce_3 != -1)
        dispatch_once(&startMetricCollection__defaultOnce_3, &block);
      if (startMetricCollection__classDebugEnabled_3)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Start Camera collection "), CFSTR("*******PLAWDMetricsService*******"), block, v24, v25, v26, v27);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCamera startMetricCollection:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 97);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }

  }
}

uint64_t __37__PLAWDCamera_startMetricCollection___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleCameraCallback:", a2);
  return result;
}

uint64_t __37__PLAWDCamera_startMetricCollection___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleTorchCameraCallback:", a2);
  return result;
}

uint64_t __37__PLAWDCamera_startMetricCollection___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startMetricCollection__classDebugEnabled_3 = result;
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
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t block;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;

  v4 = a3;
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  v6 = objc_msgSend(v4, "longValue");
  if (v6 == 2031627)
  {
    -[PLAWDCamera setCameraEventCallback:](self, "setCameraEventCallback:", 0);
    -[PLAWDCamera setCameraEventCallbackTorch:](self, "setCameraEventCallbackTorch:", 0);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      block = MEMORY[0x24BDAC760];
      v18 = 3221225472;
      v19 = __36__PLAWDCamera_stopMetricCollection___block_invoke;
      v20 = &__block_descriptor_40_e5_v8__0lu32l8;
      v21 = v7;
      if (stopMetricCollection__defaultOnce_3 != -1)
        dispatch_once(&stopMetricCollection__defaultOnce_3, &block);
      if (stopMetricCollection__classDebugEnabled_3)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Stop Camera collection "), CFSTR("*******PLAWDMetricsService*******"), block, v18, v19, v20, v21);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCamera stopMetricCollection:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 114);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
  }
  -[PLAWDAuxMetrics runningMetrics](self, "runningMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (!v15)
  {
    v16 = (void *)plAwdCamera;
    plAwdCamera = 0;

  }
}

uint64_t __36__PLAWDCamera_stopMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopMetricCollection__classDebugEnabled_3 = result;
  return result;
}

- (void)initCameraStats
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t block;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  uint64_t v14;

  -[PLAWDCamera setPrevFrontCameraState:](self, "setPrevFrontCameraState:", 0);
  -[PLAWDCamera setPrevBackCameraState:](self, "setPrevBackCameraState:", 0);
  -[PLAWDCamera setPrevTorchCameraState:](self, "setPrevTorchCameraState:", 0);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __30__PLAWDCamera_initCameraStats__block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v3;
    if (initCameraStats_defaultOnce != -1)
      dispatch_once(&initCameraStats_defaultOnce, &block);
    if (initCameraStats_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : init Camera stats: "), CFSTR("*******PLAWDMetricsService*******"), block, v11, v12, v13, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCamera initCameraStats]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 130);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  -[PLAWDCamera resetCameraTable](self, "resetCameraTable");
}

uint64_t __30__PLAWDCamera_initCameraStats__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initCameraStats_classDebugEnabled = result;
  return result;
}

- (void)reInitCameraStats
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  if (-[PLAWDCamera prevFrontCameraState](self, "prevFrontCameraState"))
    -[PLAWDCamera setFrontCameraTimestamp:](self, "setFrontCameraTimestamp:", v5);
  if (-[PLAWDCamera prevBackCameraState](self, "prevBackCameraState"))
    -[PLAWDCamera setBackCameraTimestamp:](self, "setBackCameraTimestamp:", v5);
  if (-[PLAWDCamera prevTorchCameraState](self, "prevTorchCameraState"))
    -[PLAWDCamera setTorchCameraTimestamp:](self, "setTorchCameraTimestamp:", v5);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __32__PLAWDCamera_reInitCameraStats__block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v6;
    if (reInitCameraStats_defaultOnce != -1)
      dispatch_once(&reInitCameraStats_defaultOnce, &block);
    if (reInitCameraStats_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Re-init Camera stats: "), CFSTR("*******PLAWDMetricsService*******"), block, v14, v15, v16, v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCamera reInitCameraStats]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 149);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  -[PLAWDCamera resetCameraTable](self, "resetCameraTable");
}

uint64_t __32__PLAWDCamera_reInitCameraStats__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reInitCameraStats_classDebugEnabled = result;
  return result;
}

- (void)resetCameraTable
{
  void *v3;
  objc_super v4;

  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], kPLAWDAggregateNameCameraMetrics);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4.receiver = self;
  v4.super_class = (Class)PLAWDCamera;
  -[PLAWDAuxMetrics resetTableWithEntryKey:](&v4, sel_resetTableWithEntryKey_, v3);

}

- (void)addEntryToCameraTable:(id)a3 withValue:(double)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = *MEMORY[0x24BE75200];
  v7 = kPLAWDAggregateNameCameraMetrics;
  v8 = a3;
  +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", v6, v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v12);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, kPLAWDCameraMetricsKey);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, kPLAWDCameraMetricsValue);

  -[PLAWDAuxMetrics operator](self, "operator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logEntry:", v9);

}

- (void)handleCameraCallback:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *MEMORY[0x24BE75328];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75328]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "intValue");

      if (objc_msgSend(MEMORY[0x24BE75258], "isBackFacingCamera:", v9))
      {
        -[PLAWDCamera handleBackCameraCallback:](self, "handleBackCameraCallback:", v10);
      }
      else if (objc_msgSend(MEMORY[0x24BE75258], "isFrontFacingCamera:", v9))
      {
        -[PLAWDCamera handleFrontCameraCallback:](self, "handleFrontCameraCallback:", v10);
      }
    }
  }

}

- (void)handleFrontCameraCallback:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    v7 = v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75348]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) != 0)
    {
      -[PLAWDCamera setFrontCameraTimestamp:](self, "setFrontCameraTimestamp:", v7);
    }
    else if (-[PLAWDCamera prevFrontCameraState](self, "prevFrontCameraState"))
    {
      -[PLAWDCamera frontCameraTimestamp](self, "frontCameraTimestamp");
      if (v7 - v10 > 0.0)
        -[PLAWDCamera addEntryToCameraTable:withValue:](self, "addEntryToCameraTable:withValue:", kPLAWDFrontCameraOnDuration);
    }
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v11 = objc_opt_class();
      block = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __41__PLAWDCamera_handleFrontCameraCallback___block_invoke;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      v24 = v11;
      if (handleFrontCameraCallback__defaultOnce != -1)
        dispatch_once(&handleFrontCameraCallback__defaultOnce, &block);
      if (handleFrontCameraCallback__classDebugEnabled)
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        v13 = -[PLAWDCamera prevFrontCameraState](self, "prevFrontCameraState");
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ : FrontCameraCallback: currState=%d prevState=%d  "), CFSTR("*******PLAWDMetricsService*******"), v9, v13, block, v21, v22, v23, v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCamera handleFrontCameraCallback:]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 200);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    -[PLAWDCamera setPrevFrontCameraState:](self, "setPrevFrontCameraState:", v9);
  }

}

uint64_t __41__PLAWDCamera_handleFrontCameraCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleFrontCameraCallback__classDebugEnabled = result;
  return result;
}

- (void)handleBackCameraCallback:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    v7 = v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75348]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) != 0)
    {
      -[PLAWDCamera setBackCameraTimestamp:](self, "setBackCameraTimestamp:", v7);
    }
    else if (-[PLAWDCamera prevBackCameraState](self, "prevBackCameraState"))
    {
      -[PLAWDCamera backCameraTimestamp](self, "backCameraTimestamp");
      if (v7 - v10 > 0.0)
        -[PLAWDCamera addEntryToCameraTable:withValue:](self, "addEntryToCameraTable:withValue:", kPLAWDBackCameraOnDuration);
    }
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v11 = objc_opt_class();
      block = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __40__PLAWDCamera_handleBackCameraCallback___block_invoke;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      v24 = v11;
      if (handleBackCameraCallback__defaultOnce != -1)
        dispatch_once(&handleBackCameraCallback__defaultOnce, &block);
      if (handleBackCameraCallback__classDebugEnabled)
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        v13 = -[PLAWDCamera prevBackCameraState](self, "prevBackCameraState");
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ : BackCameraCallback: currState=%d prevState=%d  "), CFSTR("*******PLAWDMetricsService*******"), v9, v13, block, v21, v22, v23, v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCamera handleBackCameraCallback:]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 222);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    -[PLAWDCamera setPrevBackCameraState:](self, "setPrevBackCameraState:", v9);
  }

}

uint64_t __40__PLAWDCamera_handleBackCameraCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleBackCameraCallback__classDebugEnabled = result;
  return result;
}

- (void)handleTorchCameraCallback:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    v7 = v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE75340]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if ((v9 & 1) != 0)
    {
      -[PLAWDCamera setTorchCameraTimestamp:](self, "setTorchCameraTimestamp:", v7);
    }
    else if (-[PLAWDCamera prevTorchCameraState](self, "prevTorchCameraState"))
    {
      -[PLAWDCamera torchCameraTimestamp](self, "torchCameraTimestamp");
      if (v7 - v10 > 0.0)
        -[PLAWDCamera addEntryToCameraTable:withValue:](self, "addEntryToCameraTable:withValue:", kPLAWDTorchCameraOnDuration);
    }
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v11 = objc_opt_class();
      block = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __41__PLAWDCamera_handleTorchCameraCallback___block_invoke;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      v24 = v11;
      if (handleTorchCameraCallback__defaultOnce != -1)
        dispatch_once(&handleTorchCameraCallback__defaultOnce, &block);
      if (handleTorchCameraCallback__classDebugEnabled)
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        v13 = -[PLAWDCamera prevTorchCameraState](self, "prevTorchCameraState");
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ : TorchCameraCallback: currState=%d prevState=%d  "), CFSTR("*******PLAWDMetricsService*******"), v9, v13, block, v21, v22, v23, v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCamera handleTorchCameraCallback:]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 244);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    -[PLAWDCamera setPrevTorchCameraState:](self, "setPrevTorchCameraState:", v9);
  }

}

uint64_t __41__PLAWDCamera_handleTorchCameraCallback___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleTorchCameraCallback__classDebugEnabled = result;
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
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  char v51;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[5];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD block[5];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
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

  if (objc_msgSend(v6, "longValue") == 2031627)
  {
    if (v8)
    {
      +[PLOperator entryKeyForType:andName:](PLAWDMetricsService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], kPLAWDAggregateNameCameraMetrics);
      v15 = objc_claimAutoreleasedReturnValue();
      -[PLAWDAuxMetrics operator](self, "operator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "storage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)v15;
      objc_msgSend(v17, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v15, 86400.0, v12, v14 - v12);
      v18 = objc_claimAutoreleasedReturnValue();

      v55 = (void *)v18;
      objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_opt_new();
      v57 = v20;
      v54 = v19;
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v21 = objc_opt_class();
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __49__PLAWDCamera_submitDataToAWDServer_withAwdConn___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v21;
        if (submitDataToAWDServer_withAwdConn__defaultOnce_1 != -1)
          dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_1, block);
        if (submitDataToAWDServer_withAwdConn__classDebugEnabled_1)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("aggregatedResults=%@"), v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "lastPathComponent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCamera submitDataToAWDServer:withAwdConn:]");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 268);

          PLLogCommon();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();

          v20 = v57;
          v19 = v54;
        }
      }
      if (v20)
      {
        v53 = v6;
        objc_msgSend(v20, "setTimestamp:", objc_msgSend(v7, "getAWDTimestamp"));
        objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "timeIntervalSince1970");
        v30 = v29;

        objc_msgSend(v20, "setCameraFrontOnDuration:", 0);
        objc_msgSend(v20, "setCameraBackOnDuration:", 0);
        objc_msgSend(v20, "setCameraTorchOnDuration:", 0);
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v31 = v19;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v60 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
              objc_msgSend(v36, "objectForKeyedSubscript:", kPLAWDCameraMetricsKey);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "objectForKeyedSubscript:", kPLAWDCameraMetricsValue);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "doubleValue");
              v40 = v39;

              if (objc_msgSend(v37, "isEqualToString:", kPLAWDFrontCameraOnDuration))
              {
                if (-[PLAWDCamera prevFrontCameraState](self, "prevFrontCameraState"))
                {
                  -[PLAWDCamera frontCameraTimestamp](self, "frontCameraTimestamp");
                  v40 = v40 + v30 - v41;
                  -[PLAWDCamera setFrontCameraTimestamp:](self, "setFrontCameraTimestamp:", v30);
                }
                objc_msgSend(v57, "setCameraFrontOnDuration:", (v40 * 1000.0));
              }
              else if (objc_msgSend(v37, "isEqualToString:", kPLAWDBackCameraOnDuration))
              {
                if (-[PLAWDCamera prevBackCameraState](self, "prevBackCameraState"))
                {
                  -[PLAWDCamera backCameraTimestamp](self, "backCameraTimestamp");
                  v40 = v40 + v30 - v42;
                  -[PLAWDCamera setBackCameraTimestamp:](self, "setBackCameraTimestamp:", v30);
                }
                objc_msgSend(v57, "setCameraBackOnDuration:", (v40 * 1000.0));
              }
              else if (objc_msgSend(v37, "isEqualToString:", kPLAWDTorchCameraOnDuration))
              {
                if (-[PLAWDCamera prevTorchCameraState](self, "prevTorchCameraState"))
                {
                  -[PLAWDCamera torchCameraTimestamp](self, "torchCameraTimestamp");
                  v40 = v40 + v30 - v43;
                  -[PLAWDCamera setTorchCameraTimestamp:](self, "setTorchCameraTimestamp:", v30);
                }
                objc_msgSend(v57, "setCameraTorchOnDuration:", (v40 * 1000.0));
              }

            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
          }
          while (v33);
        }

        -[PLAWDCamera setCameraSubmitCnt:](self, "setCameraSubmitCnt:", -[PLAWDCamera cameraSubmitCnt](self, "cameraSubmitCnt") + 1);
        v6 = v53;
        v20 = v57;
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v44 = objc_opt_class();
          v58[0] = MEMORY[0x24BDAC760];
          v58[1] = 3221225472;
          v58[2] = __49__PLAWDCamera_submitDataToAWDServer_withAwdConn___block_invoke_56;
          v58[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v58[4] = v44;
          if (submitDataToAWDServer_withAwdConn__defaultOnce_54 != -1)
            dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_54, v58);
          if (submitDataToAWDServer_withAwdConn__classDebugEnabled_55)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Submit Camera stats: submit cnt=%ld "), CFSTR("*******PLAWDMetricsService*******"), -[PLAWDCamera cameraSubmitCnt](self, "cameraSubmitCnt"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDCamera.m");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "lastPathComponent");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDCamera submitDataToAWDServer:withAwdConn:]");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v48, v49, 309);

            PLLogCommon();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              -[PLAWDDisplay startMetricCollection:].cold.1();

            v20 = v57;
          }
        }
        objc_msgSend(v8, "setMetric:", v20);
        v19 = v54;
      }

    }
    -[PLAWDCamera reInitCameraStats](self, "reInitCameraStats");
    v51 = objc_msgSend(v7, "submitMetric:", v8);
  }
  else
  {
    v51 = 0;
  }

  return v51;
}

uint64_t __49__PLAWDCamera_submitDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitDataToAWDServer_withAwdConn__classDebugEnabled_1 = result;
  return result;
}

uint64_t __49__PLAWDCamera_submitDataToAWDServer_withAwdConn___block_invoke_56(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitDataToAWDServer_withAwdConn__classDebugEnabled_55 = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)cameraEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCameraEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (PLEntryNotificationOperatorComposition)cameraEventCallbackTorch
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCameraEventCallbackTorch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)prevFrontCameraState
{
  return self->_prevFrontCameraState;
}

- (void)setPrevFrontCameraState:(BOOL)a3
{
  self->_prevFrontCameraState = a3;
}

- (BOOL)prevBackCameraState
{
  return self->_prevBackCameraState;
}

- (void)setPrevBackCameraState:(BOOL)a3
{
  self->_prevBackCameraState = a3;
}

- (BOOL)prevTorchCameraState
{
  return self->_prevTorchCameraState;
}

- (void)setPrevTorchCameraState:(BOOL)a3
{
  self->_prevTorchCameraState = a3;
}

- (double)frontCameraTimestamp
{
  return self->_frontCameraTimestamp;
}

- (void)setFrontCameraTimestamp:(double)a3
{
  self->_frontCameraTimestamp = a3;
}

- (double)backCameraTimestamp
{
  return self->_backCameraTimestamp;
}

- (void)setBackCameraTimestamp:(double)a3
{
  self->_backCameraTimestamp = a3;
}

- (double)torchCameraTimestamp
{
  return self->_torchCameraTimestamp;
}

- (void)setTorchCameraTimestamp:(double)a3
{
  self->_torchCameraTimestamp = a3;
}

- (int64_t)cameraSubmitCnt
{
  return self->_cameraSubmitCnt;
}

- (void)setCameraSubmitCnt:(int64_t)a3
{
  self->_cameraSubmitCnt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraEventCallbackTorch, 0);
  objc_storeStrong((id *)&self->_cameraEventCallback, 0);
}

@end
