@implementation PLAWDMetricsService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAWDMetricsService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (BOOL)connectToAWDServer
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t v19;

  -[PLAWDMetricsService awdServerConn](self, "awdServerConn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  v4 = 1;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2B20]), "initWithComponentId:andBlockOnConfiguration:", 31, 1);
  -[PLAWDMetricsService setAwdServerConn:](self, "setAwdServerConn:", v5);

  -[PLAWDMetricsService awdServerConn](self, "awdServerConn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      block = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __41__PLAWDMetricsService_connectToAWDServer__block_invoke;
      v18 = &__block_descriptor_40_e5_v8__0lu32l8;
      v19 = v7;
      if (connectToAWDServer_defaultOnce != -1)
        dispatch_once(&connectToAWDServer_defaultOnce, &block);
      if (connectToAWDServer_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : Connection to awd server failed!"), CFSTR("*******PLAWDMetricsService*******"), block, v16, v17, v18, v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAWDMetricsService.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDMetricsService connectToAWDServer]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 49);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLAWDDisplay startMetricCollection:].cold.1();

      }
    }
    return 0;
  }
  return v4;
}

uint64_t __41__PLAWDMetricsService_connectToAWDServer__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  connectToAWDServer_classDebugEnabled = result;
  return result;
}

+ (id)entryAggregateDefinitions
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

  v2 = (void *)objc_opt_new();
  +[PLAWDAudio entryAggregateDefinitions](PLAWDAudio, "entryAggregateDefinitions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  +[PLAWDNetworkUsage entryAggregateDefinitions](PLAWDNetworkUsage, "entryAggregateDefinitions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v4);

  +[PLAWDCpuAP entryAggregateDefinitions](PLAWDCpuAP, "entryAggregateDefinitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v5);

  +[PLAWDWifiBT entryAggregateDefinitions](PLAWDWifiBT, "entryAggregateDefinitions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v6);

  +[PLAWDDisplay entryAggregateDefinitions](PLAWDDisplay, "entryAggregateDefinitions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v7);

  +[PLAWDBattery entryAggregateDefinitions](PLAWDBattery, "entryAggregateDefinitions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v8);

  +[PLAWDCamera entryAggregateDefinitions](PLAWDCamera, "entryAggregateDefinitions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v9);

  +[PLAWDBB entryAggregateDefinitions](PLAWDBB, "entryAggregateDefinitions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v10);

  return v2;
}

+ (id)entryEventPointDefinitions
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

  v2 = (void *)objc_opt_new();
  +[PLAWDAuxMetrics entryEventPointDefinitions](PLAWDAudio, "entryEventPointDefinitions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  +[PLAWDAuxMetrics entryEventPointDefinitions](PLAWDNetworkUsage, "entryEventPointDefinitions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v4);

  +[PLAWDAuxMetrics entryEventPointDefinitions](PLAWDCpuAP, "entryEventPointDefinitions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v5);

  +[PLAWDAuxMetrics entryEventPointDefinitions](PLAWDWifiBT, "entryEventPointDefinitions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v6);

  +[PLAWDAuxMetrics entryEventPointDefinitions](PLAWDDisplay, "entryEventPointDefinitions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v7);

  +[PLAWDAuxMetrics entryEventPointDefinitions](PLAWDBattery, "entryEventPointDefinitions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v8);

  +[PLAWDAuxMetrics entryEventPointDefinitions](PLAWDCamera, "entryEventPointDefinitions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v9);

  +[PLAWDAuxMetrics entryEventPointDefinitions](PLAWDBB, "entryEventPointDefinitions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v10);

  return v2;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (PLAWDMetricsService)init
{
  PLAWDMetricsService *v3;
  PLAWDMetricsService *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  objc_super v18;

  if ((objc_msgSend(MEMORY[0x24BE74FD8], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)PLAWDMetricsService;
    v4 = -[PLOperator init](&v18, sel_init);
    if (v4)
    {
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v5 = objc_opt_class();
        block = MEMORY[0x24BDAC760];
        v14 = 3221225472;
        v15 = __27__PLAWDMetricsService_init__block_invoke;
        v16 = &__block_descriptor_40_e5_v8__0lu32l8;
        v17 = v5;
        if (init_defaultOnce_0 != -1)
          dispatch_once(&init_defaultOnce_0, &block);
        if (init_classDebugEnabled_0)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : init"), CFSTR("*******PLAWDMetricsService*******"), block, v14, v15, v16, v17);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAWDMetricsService.m");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastPathComponent");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDMetricsService init]");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 95);

          PLLogCommon();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            -[PLAWDDisplay startMetricCollection:].cold.1();

        }
      }
      -[PLAWDMetricsService setAwdServerConn:](v4, "setAwdServerConn:", 0);
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

uint64_t __27__PLAWDMetricsService_init__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  init_classDebugEnabled_0 = result;
  return result;
}

- (void)initOperatorDependancies
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

  if (self
    && !-[PLAWDMetricsService initAWDInterface](self, "initAWDInterface")
    && objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __47__PLAWDMetricsService_initOperatorDependancies__block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v3;
    if (initOperatorDependancies_defaultOnce != -1)
      dispatch_once(&initOperatorDependancies_defaultOnce, &block);
    if (initOperatorDependancies_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: initAWDInterface Failed!"), CFSTR("*******PLAWDMetricsService*******"), block, v11, v12, v13, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAWDMetricsService.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDMetricsService initOperatorDependancies]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 109);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  -[PLOperator defaultBoolForKey:](self, "defaultBoolForKey:", CFSTR("simulatedMode"));
}

uint64_t __47__PLAWDMetricsService_initOperatorDependancies__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  initOperatorDependancies_classDebugEnabled = result;
  return result;
}

- (void)auxClassWrapper:(id)a3 withAction:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  switch(a4)
  {
    case 2:
      if (-[PLAWDMetricsService connectToAWDServer](self, "connectToAWDServer"))
      {
        -[PLAWDMetricsService classDictionary](self, "classDictionary");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "getSharedObjWithOperator:", self);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAWDMetricsService awdServerConn](self, "awdServerConn");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "submitDataToAWDServer:withAwdConn:", v10, v9);

        goto LABEL_8;
      }
      break;
    case 1:
      -[PLAWDMetricsService classDictionary](self, "classDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "getSharedObjWithOperator:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stopMetricCollection:", v10);
      goto LABEL_8;
    case 0:
      -[PLAWDMetricsService classDictionary](self, "classDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "getSharedObjWithOperator:", self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startMetricCollection:", v10);
LABEL_8:

      break;
  }

}

- (void)threadFunc
{
  -[PLOperator defaultBoolForKey:](self, "defaultBoolForKey:", CFSTR("simulatedMode"));
}

- (BOOL)initAWDInterface
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
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
  _BOOL4 v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  _BYTE v41[128];
  uint64_t v42;

  v3 = MEMORY[0x24BDAC760];
  v42 = *MEMORY[0x24BDAC8D0];
  v40[0] = MEMORY[0x24BDAC760];
  v40[1] = 3221225472;
  v40[2] = __39__PLAWDMetricsService_initAWDInterface__block_invoke;
  v40[3] = &unk_24EB5CFC0;
  v40[4] = self;
  v4 = (void *)MEMORY[0x22767BBB0](v40, a2);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[PLAWDMetricsService setCurrRunningMetrics:](self, "setCurrRunningMetrics:", v5);

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[PLAWDMetricsService setClassDictionary:](self, "setClassDictionary:", v6);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", objc_opt_class(), &unk_24EB64808);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", objc_opt_class(), &unk_24EB64820);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", objc_opt_class(), &unk_24EB64838);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", objc_opt_class(), &unk_24EB64850);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", objc_opt_class(), &unk_24EB64868);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", objc_opt_class(), &unk_24EB64880);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", objc_opt_class(), &unk_24EB64898);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", objc_opt_class(), &unk_24EB648B0);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", objc_opt_class(), &unk_24EB648C8);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", objc_opt_class(), &unk_24EB648E0);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKey:", objc_opt_class(), &unk_24EB648F8);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", objc_opt_class(), &unk_24EB64910);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", objc_opt_class(), &unk_24EB64928);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", objc_opt_class(), &unk_24EB64940);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKey:", objc_opt_class(), &unk_24EB64958);

  -[PLAWDMetricsService classDictionary](self, "classDictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", objc_opt_class(), &unk_24EB64970);

  v23 = -[PLAWDMetricsService connectToAWDServer](self, "connectToAWDServer");
  if (v23)
  {
    -[PLAWDMetricsService classDictionary](self, "classDictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "allKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v37;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v37 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v30);
          -[PLAWDMetricsService awdServerConn](self, "awdServerConn");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "registerQueriableMetricCallback:forIdentifier:", v4, objc_msgSend(v31, "unsignedIntValue"));

          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v28);
    }

    -[PLAWDMetricsService awdServerConn](self, "awdServerConn");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v3;
    v35[1] = 3221225472;
    v35[2] = __39__PLAWDMetricsService_initAWDInterface__block_invoke_54;
    v35[3] = &unk_24EB5CFE8;
    v35[4] = self;
    objc_msgSend(v33, "registerConfigChangeCallback:", v35);

  }
  return v23;
}

void __39__PLAWDMetricsService_initAWDInterface__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  _QWORD block[5];

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__PLAWDMetricsService_initAWDInterface__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : AWD Submit data callback: metricType=%d"), CFSTR("*******PLAWDMetricsService*******"), a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAWDMetricsService.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDMetricsService initAWDInterface]_block_invoke");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 218);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "currRunningMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "containsObject:", v12);

  if (v13)
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "auxClassWrapper:withAction:", v15, 2);

  }
}

uint64_t __39__PLAWDMetricsService_initAWDInterface__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled = result;
  return result;
}

void __39__PLAWDMetricsService_initAWDInterface__block_invoke_54(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD block[5];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__PLAWDMetricsService_initAWDInterface__block_invoke_2_55;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ : AWD config change callback: %@"), CFSTR("*******PLAWDMetricsService*******"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAWDMetricsService.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDMetricsService initAWDInterface]_block_invoke");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 255);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  v11 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "setUpdateRunningMetrics:", v11);

  if (v3)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = v3;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "updateRunningMetrics");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v17);

          objc_msgSend(*(id *)(a1 + 32), "currRunningMetrics");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsObject:", v17);

          v21 = *(void **)(a1 + 32);
          if (v20)
          {
            objc_msgSend(v21, "currRunningMetrics");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "removeObject:", v17);

          }
          else
          {
            objc_msgSend(v21, "auxClassWrapper:withAction:", v17, 0);
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v14);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "currRunningMetrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "currRunningMetrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v32 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(a1 + 32), "auxClassWrapper:withAction:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j), 1);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v27);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "updateRunningMetrics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurrRunningMetrics:", v30);

  objc_msgSend(*(id *)(a1 + 32), "setUpdateRunningMetrics:", 0);
}

uint64_t __39__PLAWDMetricsService_initAWDInterface__block_invoke_2_55(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled = result;
  return result;
}

- (AWDServerConnection)awdServerConn
{
  return (AWDServerConnection *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAwdServerConn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableSet)currRunningMetrics
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrRunningMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableSet)updateRunningMetrics
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setUpdateRunningMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)classDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setClassDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classDictionary, 0);
  objc_storeStrong((id *)&self->_updateRunningMetrics, 0);
  objc_storeStrong((id *)&self->_currRunningMetrics, 0);
  objc_storeStrong((id *)&self->_awdServerConn, 0);
}

@end
