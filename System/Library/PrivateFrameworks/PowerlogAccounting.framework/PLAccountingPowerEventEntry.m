@implementation PLAccountingPowerEventEntry

- (double)power
{
  void *v2;
  double v3;
  double v4;

  -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75158]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3 / 1000.0;

  return v4;
}

- (id)subEntryKey
{
  return -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75160]);
}

- (BOOL)isEqualContentsWithEvent:(id)a3
{
  id v4;
  double v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v4 = a3;
  -[PLAccountingPowerEventEntry power](self, "power");
  if (v5 == 0.0)
  {
    objc_msgSend(v4, "power");
    v7 = v6 == 0.0;
  }
  else
  {
    -[PLAccountingPowerEventEntry power](self, "power");
    v9 = v8;
    objc_msgSend(v4, "power");
    v11 = vabdd_f64(v9, v10);
    objc_msgSend((id)objc_opt_class(), "minPowerDifference");
    if (v11 <= v12)
    {
      v7 = 1;
    }
    else
    {
      -[PLAccountingPowerEventEntry power](self, "power");
      v14 = v13;
      objc_msgSend(v4, "power");
      v16 = vabdd_f64(v14, v15);
      -[PLAccountingPowerEventEntry power](self, "power");
      v18 = v16 / v17 * 100.0;
      objc_msgSend((id)objc_opt_class(), "minPowerPercentageDifference");
      v7 = v18 <= v19;
    }
  }

  return v7;
}

+ (double)minPowerDifference
{
  int v2;
  double result;
  _QWORD v4[4];
  __CFString *v5;
  char v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[2] = __49__PLAccountingPowerEventEntry_minPowerDifference__block_invoke;
  v4[3] = &unk_24DCF9BA8;
  v4[1] = 3221225472;
  v5 = CFSTR("PLAccountingDebugService_Debug");
  v6 = 0;
  if (minPowerDifference_defaultOnce != -1)
    dispatch_once(&minPowerDifference_defaultOnce, v4);
  v2 = minPowerDifference_objectForKey;

  result = 0.0;
  if (!v2)
    return 3.0;
  return result;
}

+ (double)minPowerPercentageDifference
{
  int v2;
  double result;
  _QWORD v4[4];
  __CFString *v5;
  char v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[2] = __59__PLAccountingPowerEventEntry_minPowerPercentageDifference__block_invoke;
  v4[3] = &unk_24DCF9BA8;
  v4[1] = 3221225472;
  v5 = CFSTR("PLAccountingDebugService_Debug");
  v6 = 0;
  if (minPowerPercentageDifference_defaultOnce != -1)
    dispatch_once(&minPowerPercentageDifference_defaultOnce, v4);
  v2 = minPowerPercentageDifference_objectForKey;

  result = 0.0;
  if (!v2)
    return 3.0;
  return result;
}

- (PLAccountingPowerEventEntry)initWithRootNodeID:(id)a3 withPower:(double)a4 withRange:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  PLAccountingPowerEventEntry *v12;
  void *v13;
  PLAccountingPowerEventEntry *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_super v22;

  v8 = a3;
  v9 = a5;
  if ((int)objc_msgSend(v8, "intValue") < 1
    || (+[PLAccountingEngine deviceRootNodeIDs](PLAccountingEngine, "deviceRootNodeIDs"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "containsObject:", v8),
        v10,
        !v11)
    || !objc_msgSend((id)objc_opt_class(), "isValidPower:forRootNodeID:", v8, a4))
  {
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  v22.receiver = self;
  v22.super_class = (Class)PLAccountingPowerEventEntry;
  v12 = -[PLAccountingEventEntry initWithRange:](&v22, sel_initWithRange_, v9);
  self = v12;
  if (v12)
  {
    -[PLEntry setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75160]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", llround(a4 * 1000.0));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE75158]);

    LODWORD(v13) = -[PLAccountingPowerEventEntry instanceDirectionality](self, "instanceDirectionality");
    if ((_DWORD)v13 != objc_msgSend((id)objc_opt_class(), "classDirectionality"))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Directionality mismatch for rootNodeID=%@"), v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Power/PLAccountingPowerEventEntry.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingPowerEventEntry initWithRootNodeID:withPower:withRange:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 69);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      goto LABEL_10;
    }
  }
  self = self;
  v14 = self;
LABEL_11:

  return v14;
}

- (int)instanceDirectionality
{
  void *v2;
  void *v3;
  int v4;

  -[PLAccountingPowerEventEntry rootNodeID](self, "rootNodeID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_24DD031A8, "objectAtIndexedSubscript:", (int)objc_msgSend(v2, "intValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

+ (BOOL)isValidPower:(double)a3 forRootNodeID:(id)a4
{
  id v5;
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
  BOOL v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  _QWORD block[5];

  v5 = a4;
  if (a3 < 0.0)
  {
    if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      goto LABEL_16;
    v6 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__PLAccountingPowerEventEntry_isValidPower_forRootNodeID___block_invoke_15;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (isValidPower_forRootNodeID__defaultOnce_13 != -1)
      dispatch_once(&isValidPower_forRootNodeID__defaultOnce_13, block);
    if (!isValidPower_forRootNodeID__classDebugEnabled_14)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR: Negative power of %.2f mWh received for rootNodeID:%@"), *(_QWORD *)&a3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BE74FA8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Power/PLAccountingPowerEventEntry.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PLAccountingPowerEventEntry isValidPower:forRootNodeID:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 37);

    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PLAccountingDependency activate].cold.1();
    goto LABEL_15;
  }
  if (a3 <= 10000.0)
  {
    v18 = 1;
    goto LABEL_18;
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v13 = objc_opt_class();
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __58__PLAccountingPowerEventEntry_isValidPower_forRootNodeID___block_invoke_20;
    v23 = &__block_descriptor_40_e5_v8__0lu32l8;
    v24 = v13;
    if (isValidPower_forRootNodeID__defaultOnce_18 != -1)
      dispatch_once(&isValidPower_forRootNodeID__defaultOnce_18, &v20);
    if (isValidPower_forRootNodeID__classDebugEnabled_19)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ERROR:  %.2f mWh received for rootNodeID:%@ exceeds max threshold of %d"), *(_QWORD *)&a3, v5, 10000, v20, v21, v22, v23, v24);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/Power/PLAccountingPowerEventEntry.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PLAccountingPowerEventEntry isValidPower:forRootNodeID:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v16, v17, 40);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();
LABEL_15:

    }
  }
LABEL_16:
  v18 = 0;
LABEL_18:

  return v18;
}

- (NSNumber)rootNodeID
{
  return (NSNumber *)-[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", *MEMORY[0x24BE75160]);
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccountingPowerEventEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

uint64_t __49__PLAccountingPowerEventEntry_minPowerDifference__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "BOOLForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  minPowerDifference_objectForKey = result;
  return result;
}

uint64_t __59__PLAccountingPowerEventEntry_minPowerPercentageDifference__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "BOOLForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  minPowerPercentageDifference_objectForKey = result;
  return result;
}

uint64_t __58__PLAccountingPowerEventEntry_isValidPower_forRootNodeID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  isValidPower_forRootNodeID__classDebugEnabled = result;
  return result;
}

uint64_t __58__PLAccountingPowerEventEntry_isValidPower_forRootNodeID___block_invoke_15(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  isValidPower_forRootNodeID__classDebugEnabled_14 = result;
  return result;
}

uint64_t __58__PLAccountingPowerEventEntry_isValidPower_forRootNodeID___block_invoke_20(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  isValidPower_forRootNodeID__classDebugEnabled_19 = result;
  return result;
}

- (BOOL)isEmptyEvent
{
  double v2;

  -[PLAccountingPowerEventEntry power](self, "power");
  return v2 == 0.0;
}

@end
