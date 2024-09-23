@implementation PLAWDAuxMetrics

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x24BDBD1B8];
}

- (PLAWDAuxMetrics)initWithOperator:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (self)
    -[PLAWDAuxMetrics setOperator:](self, "setOperator:", v4);
  v5 = (void *)objc_opt_new();
  -[PLAWDAuxMetrics setRunningMetrics:](self, "setRunningMetrics:", v5);

  if (initWithOperator__onceToken != -1)
    dispatch_once(&initWithOperator__onceToken, &__block_literal_global);

  return self;
}

void __36__PLAWDAuxMetrics_initWithOperator___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = objc_opt_new();
  v1 = (void *)startChargerPeriods;
  startChargerPeriods = v0;

  v2 = objc_opt_new();
  v3 = (void *)endChargerPeriods;
  endChargerPeriods = v2;

  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)awdStartTime;
  awdStartTime = v4;

}

+ (id)getSharedObjWithOperator:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t block;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled", a3))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __44__PLAWDAuxMetrics_getSharedObjWithOperator___block_invoke;
    v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    v15 = v3;
    if (getSharedObjWithOperator__defaultOnce != -1)
      dispatch_once(&getSharedObjWithOperator__defaultOnce, &block);
    if (getSharedObjWithOperator__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PLAWD AUX class %@ not implementing getSharedObj"), objc_opt_class(), block, v12, v13, v14, v15);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAuxMetrics.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PLAWDAuxMetrics getSharedObjWithOperator:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 49);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  return 0;
}

uint64_t __44__PLAWDAuxMetrics_getSharedObjWithOperator___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getSharedObjWithOperator__classDebugEnabled = result;
  return result;
}

- (void)startMetricCollection:(id)a3
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

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled", a3))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __41__PLAWDAuxMetrics_startMetricCollection___block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v3;
    if (startMetricCollection__defaultOnce_4 != -1)
      dispatch_once(&startMetricCollection__defaultOnce_4, &block);
    if (startMetricCollection__classDebugEnabled_4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PLAWD AUX class %@ not implementing startMetricCollection"), objc_opt_class(), block, v11, v12, v13, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAuxMetrics.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDAuxMetrics startMetricCollection:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 55);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
}

uint64_t __41__PLAWDAuxMetrics_startMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  startMetricCollection__classDebugEnabled_4 = result;
  return result;
}

- (void)stopMetricCollection:(id)a3
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

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled", a3))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __40__PLAWDAuxMetrics_stopMetricCollection___block_invoke;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v3;
    if (stopMetricCollection__defaultOnce_4 != -1)
      dispatch_once(&stopMetricCollection__defaultOnce_4, &block);
    if (stopMetricCollection__classDebugEnabled_4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PLAWD AUX class %@ not implementing stopMetricCollection"), objc_opt_class(), block, v11, v12, v13, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAuxMetrics.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDAuxMetrics stopMetricCollection:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 60);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
}

uint64_t __40__PLAWDAuxMetrics_stopMetricCollection___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  stopMetricCollection__classDebugEnabled_4 = result;
  return result;
}

- (BOOL)submitDataToAWDServer:(id)a3 withAwdConn:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled", a3, a4))
  {
    v4 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __53__PLAWDAuxMetrics_submitDataToAWDServer_withAwdConn___block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v4;
    if (submitDataToAWDServer_withAwdConn__defaultOnce_2 != -1)
      dispatch_once(&submitDataToAWDServer_withAwdConn__defaultOnce_2, &block);
    if (submitDataToAWDServer_withAwdConn__classDebugEnabled_2)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PLAWD AUX class %@ not implementing submitDataToAWDServer"), objc_opt_class(), block, v13, v14, v15, v16);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Utilities/AwdLibrary/PLAWDAuxMetrics.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAWDAuxMetrics submitDataToAWDServer:withAwdConn:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 65);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAWDDisplay startMetricCollection:].cold.1();

    }
  }
  return 0;
}

uint64_t __53__PLAWDAuxMetrics_submitDataToAWDServer_withAwdConn___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  submitDataToAWDServer_withAwdConn__classDebugEnabled_2 = result;
  return result;
}

- (void)resetTableWithEntryKey:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PLAWDAuxMetrics operator](self, "operator");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteAllEntriesForKey:", v4);

}

- (void)handleChargerChangeWithState:(BOOL)a3 withDate:(id)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  v11 = a4;
  v5 = objc_msgSend((id)startChargerPeriods, "count");
  if (v4)
  {
    if (v5 != objc_msgSend((id)endChargerPeriods, "count"))
      goto LABEL_7;
    v6 = &startChargerPeriods;
    goto LABEL_6;
  }
  if (!v5)
    goto LABEL_12;
  v7 = objc_msgSend((id)startChargerPeriods, "count");
  v6 = &endChargerPeriods;
  if (v7 != objc_msgSend((id)endChargerPeriods, "count"))
LABEL_6:
    objc_msgSend((id)*v6, "addObject:", v11);
LABEL_7:
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v11, -7200.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  while (objc_msgSend((id)endChargerPeriods, "count"))
  {
    objc_msgSend((id)endChargerPeriods, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "compare:", v9);

    if (v10 != 1)
      break;
    objc_msgSend((id)startChargerPeriods, "removeObjectAtIndex:", 0);
    objc_msgSend((id)endChargerPeriods, "removeObjectAtIndex:", 0);
  }

LABEL_12:
}

- (BOOL)doesInterfereWithChargerWithStartDate:(id)a3 withEndDate:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend((id)startChargerPeriods, "count"))
  {
    v7 = objc_msgSend((id)startChargerPeriods, "count");
    v8 = objc_msgSend((id)endChargerPeriods, "count");
    if (objc_msgSend((id)startChargerPeriods, "count"))
    {
      for (i = 0; objc_msgSend((id)startChargerPeriods, "count") > i; ++i)
      {
        if (v7 == v8 || i != objc_msgSend((id)startChargerPeriods, "count") - 1)
        {
          objc_msgSend((id)startChargerPeriods, "objectAtIndexedSubscript:", i);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "compare:", v12) == -1)
          {
            objc_msgSend((id)startChargerPeriods, "objectAtIndexedSubscript:", i);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v6, "compare:", v13);

            if (v14 == 1)
              goto LABEL_20;
          }
          else
          {

          }
          objc_msgSend((id)endChargerPeriods, "objectAtIndexedSubscript:", i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "compare:", v15) == -1)
          {
            objc_msgSend((id)endChargerPeriods, "objectAtIndexedSubscript:", i);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v6, "compare:", v16);

            if (v17 == 1)
              goto LABEL_20;
          }
          else
          {

          }
          objc_msgSend((id)startChargerPeriods, "objectAtIndexedSubscript:", i);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "compare:", v18) == 1)
          {
            objc_msgSend((id)endChargerPeriods, "objectAtIndexedSubscript:", i);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v6, "compare:", v19);

            if (v20 == -1)
            {
LABEL_20:
              v21 = 1;
              goto LABEL_21;
            }
          }
          else
          {

          }
        }
        else
        {
          objc_msgSend((id)startChargerPeriods, "objectAtIndexedSubscript:", i);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v5, "compare:", v10);

          if (v11 == 1)
            goto LABEL_20;
        }
      }
    }
  }
  v21 = 0;
LABEL_21:

  return v21;
}

- (double)getRailEnergyWithEntry:(id)a3 withFilter:(id)a4 isRailForward:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    -[PLAWDAuxMetrics operator](self, "operator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "storage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entryKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "entriesForKey:startingFromRowID:count:withFilters:", v12, objc_msgSend(v8, "entryID") - 1, -1, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        if (a5)
          goto LABEL_7;
        if (!awdStartTime)
          goto LABEL_7;
        objc_msgSend((id)awdStartTime, "timeIntervalSince1970");
        v16 = v15;
        objc_msgSend(v14, "entryDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSince1970");
        v19 = v16 - v18;

        objc_msgSend(v8, "entryDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSince1970");
        v22 = v21;
        objc_msgSend((id)awdStartTime, "timeIntervalSince1970");
        v24 = v22 - v23;

        if (v24 >= v19)
        {
LABEL_7:
          objc_msgSend(v14, "entryDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "entryDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLAWDAuxMetrics doesInterfereWithChargerWithStartDate:withEndDate:](self, "doesInterfereWithChargerWithStartDate:withEndDate:", v25, v26);

        }
      }

    }
  }

  return 0.0;
}

- (BOOL)dropFirstEntryReceived:(id)a3 usingFilter:(id)a4 andStartTime:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;

  v8 = a3;
  v9 = a5;
  v10 = v9;
  v11 = 1;
  if (v8 && v9)
  {
    v12 = a4;
    -[PLAWDAuxMetrics operator](self, "operator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "storage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entryKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entriesForKey:startingFromRowID:count:withFilters:", v15, objc_msgSend(v8, "entryID") - 1, -1, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count") == 1)
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v10, "timeIntervalSince1970");
        v19 = v18;
        objc_msgSend(v17, "entryDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSince1970");
        v22 = v19 - v21;

        objc_msgSend(v8, "entryDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSince1970");
        v25 = v24;
        objc_msgSend(v10, "timeIntervalSince1970");
        v27 = v25 - v26;

        v11 = v27 <= v22;
      }
      else
      {
        v11 = 1;
      }

    }
    else
    {
      v11 = 1;
    }

  }
  return v11;
}

- (PLOperator)operator
{
  return (PLOperator *)objc_loadWeakRetained((id *)&self->_operator);
}

- (void)setOperator:(id)a3
{
  objc_storeWeak((id *)&self->_operator, a3);
}

- (NSMutableSet)runningMetrics
{
  return self->_runningMetrics;
}

- (void)setRunningMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_runningMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningMetrics, 0);
  objc_destroyWeak((id *)&self->_operator);
}

@end
