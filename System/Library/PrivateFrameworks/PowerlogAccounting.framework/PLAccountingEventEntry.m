@implementation PLAccountingEventEntry

- (PLAccountingEventEntry)initWithRange:(id)a3
{
  id v5;
  void *v6;
  PLAccountingEventEntry *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  PLAccountingEventEntry *v18;
  objc_super v20;

  v5 = a3;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "entryKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20.receiver = self;
    v20.super_class = (Class)PLAccountingEventEntry;
    v7 = -[PLEntry initWithEntryKey:](&v20, sel_initWithEntryKey_, v6);

    if (v7)
    {
      v7->_used = 0;
      objc_storeStrong((id *)&v7->_range, a3);
      objc_msgSend(v5, "startDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v10 = (void *)MEMORY[0x24BDD16E0];
        -[PLEntry entryDate](v7, "entryDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSinceDate:", v11);
        objc_msgSend(v10, "numberWithDouble:", v12 * 1000.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLEntry setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v13, CFSTR("StartOffset"));

      }
      if (v9 && objc_msgSend((id)objc_opt_class(), "classDirectionality") != 4)
      {
        v14 = (void *)MEMORY[0x24BDD16E0];
        -[PLEntry entryDate](v7, "entryDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", v15);
        objc_msgSend(v14, "numberWithDouble:", v16 * 1000.0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLEntry setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v17, CFSTR("EndOffset"));

      }
    }
    self = v7;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)rangeSinceEvent:(id)a3
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
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
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  _QWORD block[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];

  v4 = a3;
  switch(objc_msgSend((id)objc_opt_class(), "classDirectionality"))
  {
    case 1u:
      if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        goto LABEL_30;
      v5 = objc_opt_class();
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke;
      v48[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v48[4] = v5;
      if (rangeSinceEvent__defaultOnce != -1)
        dispatch_once(&rangeSinceEvent__defaultOnce, v48);
      if (!rangeSinceEvent__classDebugEnabled)
        goto LABEL_30;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("forward"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEventEntry rangeSinceEvent:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 81);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();
      break;
    case 2u:
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v14 = objc_opt_class();
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_20;
        v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v47[4] = v14;
        if (rangeSinceEvent__defaultOnce_18 != -1)
          dispatch_once(&rangeSinceEvent__defaultOnce_18, v47);
        if (rangeSinceEvent__classDebugEnabled_19)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("backward"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastPathComponent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEventEntry rangeSinceEvent:]");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 86);

          PLLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

        }
      }
      objc_msgSend(v4, "range");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLAccountingEventEntry range](self, "range");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "endDate");
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    case 3u:
      if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        goto LABEL_30;
      v24 = objc_opt_class();
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_25;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v24;
      if (rangeSinceEvent__defaultOnce_23 != -1)
        dispatch_once(&rangeSinceEvent__defaultOnce_23, v46);
      if (!rangeSinceEvent__classDebugEnabled_24)
        goto LABEL_30;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("interval"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEventEntry rangeSinceEvent:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v27, v28, 91);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();
      break;
    case 4u:
      if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        goto LABEL_30;
      v29 = objc_opt_class();
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_30;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v29;
      if (rangeSinceEvent__defaultOnce_28 != -1)
        dispatch_once(&rangeSinceEvent__defaultOnce_28, v45);
      if (!rangeSinceEvent__classDebugEnabled_29)
        goto LABEL_30;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("point"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastPathComponent");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEventEntry rangeSinceEvent:]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v32, v33, 96);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();
      break;
    default:
      v12 = 0;
      v13 = 0;
      goto LABEL_32;
  }

LABEL_30:
  objc_msgSend(v4, "range");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLAccountingEventEntry range](self, "range");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "startDate");
  v23 = objc_claimAutoreleasedReturnValue();
LABEL_31:
  v12 = (void *)v23;

LABEL_32:
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v35 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_35;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v35;
    if (rangeSinceEvent__defaultOnce_33 != -1)
      dispatch_once(&rangeSinceEvent__defaultOnce_33, block);
    if (rangeSinceEvent__classDebugEnabled_34)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("startDate=%@, endDate=%@"), v13, v12);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "lastPathComponent");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEventEntry rangeSinceEvent:]");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v39, v40, 100);

      PLLogCommon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", v13, v12);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (PLAccountingRange)range
{
  PLAccountingEventEntry *v2;
  PLAccountingRange *range;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  PLAccountingRange *v14;
  PLAccountingRange *v15;

  v2 = self;
  objc_sync_enter(v2);
  range = v2->_range;
  if (!range)
  {
    -[PLEntry entryDate](v2, "entryDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", CFSTR("StartOffset"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v4, "dateByAddingTimeInterval:", v6 / 1000.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLEntry entryDate](v2, "entryDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", CFSTR("EndOffset"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v8, "dateByAddingTimeInterval:", v10 / 1000.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)objc_opt_class(), "classDirectionality") == 4)
      v12 = v7;
    else
      v12 = v11;
    +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", v7, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v2->_range;
    v2->_range = (PLAccountingRange *)v13;

    range = v2->_range;
  }
  v15 = range;
  objc_sync_exit(v2);

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_range, 0);
}

- (BOOL)used
{
  return self->_used;
}

- (BOOL)canMergeWithEvent:(id)a3
{
  return -[PLAccountingEventEntry instanceDirectionality](self, "instanceDirectionality", a3) != 4;
}

- (void)setUsed:(BOOL)a3
{
  self->_used = a3;
}

void __35__PLAccountingEventEntry_setRange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(*(id *)(a1 + 40), "entryDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", v4);
    objc_msgSend(v3, "numberWithDouble:", v5 * 1000.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, CFSTR("StartOffset"));

  }
  if (*(_QWORD *)(a1 + 48))
  {
    if (objc_msgSend((id)objc_opt_class(), "classDirectionality") != 4)
    {
      v7 = (void *)MEMORY[0x24BDD16E0];
      v8 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "entryDate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v11);
      objc_msgSend(v7, "numberWithDouble:", v9 * 1000.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, CFSTR("EndOffset"));

    }
  }
}

- (void)mergeWithEvent:(id)a3
{
  id v4;
  int v5;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t v40;
  _QWORD block[5];
  _QWORD v42[5];
  _QWORD v43[5];

  v4 = a3;
  v5 = -[PLAccountingEventEntry instanceDirectionality](self, "instanceDirectionality");
  if (v5 == objc_msgSend(v4, "instanceDirectionality"))
  {
    switch(objc_msgSend((id)objc_opt_class(), "classDirectionality"))
    {
      case 1u:
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v6 = objc_opt_class();
          v43[0] = MEMORY[0x24BDAC760];
          v43[1] = 3221225472;
          v43[2] = __41__PLAccountingEventEntry_mergeWithEvent___block_invoke;
          v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v43[4] = v6;
          if (mergeWithEvent__defaultOnce != -1)
            dispatch_once(&mergeWithEvent__defaultOnce, v43);
          if (mergeWithEvent__classDebugEnabled)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("forward"));
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v8 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "lastPathComponent");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEventEntry mergeWithEvent:]");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 116);

            PLLogCommon();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();
            goto LABEL_31;
          }
        }
        break;
      case 2u:
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v13 = objc_opt_class();
          v42[0] = MEMORY[0x24BDAC760];
          v42[1] = 3221225472;
          v42[2] = __41__PLAccountingEventEntry_mergeWithEvent___block_invoke_40;
          v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v42[4] = v13;
          if (mergeWithEvent__defaultOnce_38 != -1)
            dispatch_once(&mergeWithEvent__defaultOnce_38, v42);
          if (mergeWithEvent__classDebugEnabled_39)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("backward"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "lastPathComponent");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEventEntry mergeWithEvent:]");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 120);

            PLLogCommon();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();

          }
        }
        objc_msgSend(v4, "range");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "endDate");
        v12 = objc_claimAutoreleasedReturnValue();
        +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", 0, v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAccountingEventEntry setRange:](self, "setRange:", v20);

        goto LABEL_31;
      case 3u:
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v21 = objc_opt_class();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __41__PLAccountingEventEntry_mergeWithEvent___block_invoke_43;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v21;
          if (mergeWithEvent__defaultOnce_41 != -1)
            dispatch_once(&mergeWithEvent__defaultOnce_41, block);
          if (mergeWithEvent__classDebugEnabled_42)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("interval"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "lastPathComponent");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEventEntry mergeWithEvent:]");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 125);

            PLLogCommon();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();

          }
        }
        -[PLAccountingEventEntry range](self, "range");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "startDate");
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "range");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "endDate");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLAccountingRange rangeWithStartDate:withEndDate:](PLAccountingRange, "rangeWithStartDate:withEndDate:", v12, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAccountingEventEntry setRange:](self, "setRange:", v30);

        goto LABEL_31;
      case 4u:
        if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
          break;
        v31 = objc_opt_class();
        v36 = MEMORY[0x24BDAC760];
        v37 = 3221225472;
        v38 = __41__PLAccountingEventEntry_mergeWithEvent___block_invoke_46;
        v39 = &__block_descriptor_40_e5_v8__0lu32l8;
        v40 = v31;
        if (mergeWithEvent__defaultOnce_44 != -1)
          dispatch_once(&mergeWithEvent__defaultOnce_44, &v36);
        if (!mergeWithEvent__classDebugEnabled_45)
          break;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("point"), v36, v37, v38, v39, v40);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Entries/PLAccountingEventEntry.m");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "lastPathComponent");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingEventEntry mergeWithEvent:]");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v34, v35, 130);

        PLLogCommon();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();
LABEL_31:

        break;
      default:
        break;
    }
  }

}

- (void)setRange:(id)a3
{
  id v5;
  PLAccountingEventEntry *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  PLAccountingEventEntry *v15;
  id v16;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (!-[PLAccountingRange isEqual:](v6->_range, "isEqual:", v5))
  {
    objc_storeStrong((id *)&v6->_range, a3);
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "storage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __35__PLAccountingEventEntry_setRange___block_invoke;
    v13[3] = &unk_24DCF9AE8;
    v11 = v7;
    v14 = v11;
    v15 = v6;
    v12 = v8;
    v16 = v12;
    objc_msgSend(v10, "blockingUpdateEntry:withBlock:", v6, v13);

  }
  objc_sync_exit(v6);

}

+ (int)classDirectionality
{
  return 0;
}

- (int)instanceDirectionality
{
  return 0;
}

- (BOOL)isEqualContentsWithEvent:(id)a3
{
  return 0;
}

uint64_t __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  rangeSinceEvent__classDebugEnabled = result;
  return result;
}

uint64_t __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_20(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  rangeSinceEvent__classDebugEnabled_19 = result;
  return result;
}

uint64_t __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_25(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  rangeSinceEvent__classDebugEnabled_24 = result;
  return result;
}

uint64_t __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_30(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  rangeSinceEvent__classDebugEnabled_29 = result;
  return result;
}

uint64_t __42__PLAccountingEventEntry_rangeSinceEvent___block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  rangeSinceEvent__classDebugEnabled_34 = result;
  return result;
}

uint64_t __41__PLAccountingEventEntry_mergeWithEvent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  mergeWithEvent__classDebugEnabled = result;
  return result;
}

uint64_t __41__PLAccountingEventEntry_mergeWithEvent___block_invoke_40(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  mergeWithEvent__classDebugEnabled_39 = result;
  return result;
}

uint64_t __41__PLAccountingEventEntry_mergeWithEvent___block_invoke_43(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  mergeWithEvent__classDebugEnabled_42 = result;
  return result;
}

uint64_t __41__PLAccountingEventEntry_mergeWithEvent___block_invoke_46(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  mergeWithEvent__classDebugEnabled_45 = result;
  return result;
}

- (BOOL)isEmptyEvent
{
  return 1;
}

@end
