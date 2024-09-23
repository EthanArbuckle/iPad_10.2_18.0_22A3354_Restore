@implementation PLAccountingRuleManager

- (id)ruleForRuleID:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD block[5];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__PLAccountingRuleManager_ruleForRuleID___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (ruleForRuleID__defaultOnce != -1)
      dispatch_once(&ruleForRuleID__defaultOnce, block);
    if (ruleForRuleID__classDebugEnabled)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingRuleManager ruleIDToRule](self, "ruleIDToRule");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("ruleID=%@, ruleIDToRule=%@"), v4, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager ruleForRuleID:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 37);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingRuleManager ruleIDToRule](self, "ruleIDToRule");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSMutableDictionary)ruleIDToRule
{
  NSMutableDictionary *ruleIDToRule;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  ruleIDToRule = self->_ruleIDToRule;
  if (!ruleIDToRule)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_ruleIDToRule;
    self->_ruleIDToRule = v4;

    ruleIDToRule = self->_ruleIDToRule;
  }
  return ruleIDToRule;
}

+ (id)sharedInstance
{
  return 0;
}

- (PLAccountingRuleManager)init
{
  PLAccountingRuleManager *v2;
  PLAccountingRuleManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLAccountingRuleManager;
  v2 = -[PLAccountingRuleManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PLAccountingRuleManager loadRules](v2, "loadRules");
  return v3;
}

uint64_t __41__PLAccountingRuleManager_ruleForRuleID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ruleForRuleID__classDebugEnabled = result;
  return result;
}

- (void)indexRule:(id)a3
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
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __37__PLAccountingRuleManager_indexRule___block_invoke;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v5;
    if (indexRule__defaultOnce_1 != -1)
      dispatch_once(&indexRule__defaultOnce_1, &block);
    if (indexRule__classDebugEnabled_1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rule=%@"), v4, block, v15, v16, v17, v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager indexRule:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 42);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingRuleManager ruleIDToRule](self, "ruleIDToRule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v4, "entryID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v4, v13);

}

uint64_t __37__PLAccountingRuleManager_indexRule___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  indexRule__classDebugEnabled_1 = result;
  return result;
}

+ (id)rulesEntryKey
{
  return 0;
}

- (void)loadRules
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  PLAccountingRuleManager *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id obj;
  _QWORD v92[5];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[5];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _QWORD v102[5];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _QWORD block[5];
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[5];
  _QWORD v113[5];
  _BYTE v114[128];
  _BYTE v115[128];
  uint8_t v116[128];
  uint8_t buf[4];
  void *v118;
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  v3 = 0x24BE75000uLL;
  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "rulesEntryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entriesForKey:", v6);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0x24BE74000uLL;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    v113[0] = MEMORY[0x24BDAC760];
    v113[1] = 3221225472;
    v113[2] = __36__PLAccountingRuleManager_loadRules__block_invoke;
    v113[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v113[4] = v8;
    if (loadRules_defaultOnce != -1)
      dispatch_once(&loadRules_defaultOnce, v113);
    if (loadRules_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rulesFromDB=%@"), v86);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager loadRules]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 62);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      v3 = 0x24BE75000;
    }
  }
  -[PLAccountingRuleManager rulesFromFileWithForceLoad:](self, "rulesFromFileWithForceLoad:", objc_msgSend(v86, "count") == 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v84 = (void *)v15;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v16 = objc_opt_class();
    v112[0] = MEMORY[0x24BDAC760];
    v112[1] = 3221225472;
    v112[2] = __36__PLAccountingRuleManager_loadRules__block_invoke_20;
    v112[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v112[4] = v16;
    if (loadRules_defaultOnce_18 != -1)
      dispatch_once(&loadRules_defaultOnce_18, v112);
    if (loadRules_classDebugEnabled_19)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rulesFromFile=%@"), v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager loadRules]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 67);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

      v15 = (uint64_t)v84;
      v3 = 0x24BE75000;
    }
  }
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v86);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v15);
    v24 = objc_claimAutoreleasedReturnValue();
    v87 = v23;
    v25 = (void *)objc_msgSend(v23, "mutableCopy");
    v85 = (void *)v24;
    objc_msgSend(v25, "minusSet:", v24);
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    obj = v25;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v109;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v109 != v28)
            objc_enumerationMutation(obj);
          v30 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * v29);
          if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
          {
            v31 = objc_opt_class();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __36__PLAccountingRuleManager_loadRules__block_invoke_26;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v31;
            if (loadRules_defaultOnce_24 != -1)
              dispatch_once(&loadRules_defaultOnce_24, block);
            if (loadRules_classDebugEnabled_25)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ruleToDelete=%@"), v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)MEMORY[0x24BE74FA8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "lastPathComponent");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager loadRules]");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 78);

              PLLogCommon();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v118 = v32;
                _os_log_debug_impl(&dword_21A62B000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v7 = 0x24BE74000uLL;
              v3 = 0x24BE75000uLL;
            }
          }
          objc_msgSend(*(id *)(v3 + 8), "sharedCore");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "storage");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "deleteEntry:", v30);

          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
      }
      while (v27);
    }

    v40 = (void *)objc_msgSend(v85, "mutableCopy");
    objc_msgSend(v40, "minusSet:", v87);
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v90 = v40;
    v41 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v104;
      v44 = &__block_literal_global_14;
      do
      {
        v45 = 0;
        v88 = (id)v42;
        do
        {
          if (*(_QWORD *)v104 != v43)
            objc_enumerationMutation(v90);
          v46 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * v45);
          if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
          {
            v47 = objc_opt_class();
            v102[0] = MEMORY[0x24BDAC760];
            v102[1] = 3221225472;
            v102[2] = __36__PLAccountingRuleManager_loadRules__block_invoke_31;
            v102[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v102[4] = v47;
            if (loadRules_defaultOnce_29 != -1)
              dispatch_once(&loadRules_defaultOnce_29, v102);
            if (loadRules_classDebugEnabled_30)
            {
              v48 = v43;
              v49 = self;
              v50 = v44;
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ruleToAdd=%@"), v46);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = (void *)MEMORY[0x24BE74FA8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "lastPathComponent");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager loadRules]");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v54, v55, 86);

              PLLogCommon();
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v118 = v51;
                _os_log_debug_impl(&dword_21A62B000, v56, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v7 = 0x24BE74000uLL;
              v3 = 0x24BE75000uLL;
              v44 = v50;
              self = v49;
              v43 = v48;
              v42 = (uint64_t)v88;
            }
          }
          objc_msgSend(*(id *)(v3 + 8), "sharedCore");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "storage");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "blockingWriteEntry:withCompletionBlock:", v46, v44);

          -[PLAccountingRuleManager indexRule:](self, "indexRule:", v46);
          ++v45;
        }
        while (v42 != v45);
        v42 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v103, v116, 16);
      }
      while (v42);
    }

    v59 = (void *)objc_msgSend(v87, "mutableCopy");
    objc_msgSend(v59, "intersectSet:", v85);
    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v89 = v59;
    v60 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v99;
      do
      {
        v63 = 0;
        do
        {
          if (*(_QWORD *)v99 != v62)
            objc_enumerationMutation(v89);
          v64 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * v63);
          if (objc_msgSend(*(id *)(v7 + 4016), "debugEnabled"))
          {
            v65 = objc_opt_class();
            v97[0] = MEMORY[0x24BDAC760];
            v97[1] = 3221225472;
            v97[2] = __36__PLAccountingRuleManager_loadRules__block_invoke_2;
            v97[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v97[4] = v65;
            if (loadRules_defaultOnce_35 != -1)
              dispatch_once(&loadRules_defaultOnce_35, v97);
            if (loadRules_classDebugEnabled_36)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ruleInBoth=%@"), v64);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = (void *)MEMORY[0x24BE74FA8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "lastPathComponent");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager loadRules]");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "logMessage:fromFile:fromFunction:fromLineNumber:", v66, v69, v70, 95);

              PLLogCommon();
              v71 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v118 = v66;
                _os_log_debug_impl(&dword_21A62B000, v71, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v7 = 0x24BE74000;
            }
          }
          -[PLAccountingRuleManager indexRule:](self, "indexRule:", v64);
          ++v63;
        }
        while (v61 != v63);
        v61 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v98, v115, 16);
      }
      while (v61);
    }

  }
  else
  {
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v87 = v86;
    v72 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
    if (v72)
    {
      v73 = v72;
      v74 = *(_QWORD *)v94;
      do
      {
        v75 = 0;
        do
        {
          if (*(_QWORD *)v94 != v74)
            objc_enumerationMutation(v87);
          v76 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * v75);
          if (objc_msgSend(*(id *)(v7 + 4016), "debugEnabled"))
          {
            v77 = objc_opt_class();
            v92[0] = MEMORY[0x24BDAC760];
            v92[1] = 3221225472;
            v92[2] = __36__PLAccountingRuleManager_loadRules__block_invoke_41;
            v92[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v92[4] = v77;
            if (loadRules_defaultOnce_39 != -1)
              dispatch_once(&loadRules_defaultOnce_39, v92);
            if (loadRules_classDebugEnabled_40)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ruleFromDB=%@"), v76);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v79 = (void *)MEMORY[0x24BE74FA8];
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "lastPathComponent");
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager loadRules]");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "logMessage:fromFile:fromFunction:fromLineNumber:", v78, v81, v82, 102);

              PLLogCommon();
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v118 = v78;
                _os_log_debug_impl(&dword_21A62B000, v83, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v7 = 0x24BE74000;
            }
          }
          -[PLAccountingRuleManager indexRule:](self, "indexRule:", v76);
          ++v75;
        }
        while (v73 != v75);
        v73 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
      }
      while (v73);
    }
  }

}

uint64_t __36__PLAccountingRuleManager_loadRules__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  loadRules_classDebugEnabled = result;
  return result;
}

uint64_t __36__PLAccountingRuleManager_loadRules__block_invoke_20(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  loadRules_classDebugEnabled_19 = result;
  return result;
}

uint64_t __36__PLAccountingRuleManager_loadRules__block_invoke_26(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  loadRules_classDebugEnabled_25 = result;
  return result;
}

uint64_t __36__PLAccountingRuleManager_loadRules__block_invoke_31(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  loadRules_classDebugEnabled_30 = result;
  return result;
}

uint64_t __36__PLAccountingRuleManager_loadRules__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  loadRules_classDebugEnabled_36 = result;
  return result;
}

uint64_t __36__PLAccountingRuleManager_loadRules__block_invoke_41(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  loadRules_classDebugEnabled_40 = result;
  return result;
}

- (id)rulesFromFileWithForceLoad:(BOOL)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  NSObject *v77;
  void *v79;
  id v80;
  uint64_t v81;
  NSObject *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id obj;
  PLAccountingRuleManager *v89;
  id v90;
  _QWORD v91[5];
  _QWORD block[5];
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[5];
  _QWORD v98[5];
  _QWORD v99[5];
  _QWORD v100[5];
  uint8_t buf[4];
  void *v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "rulesPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0x24BDD1000uLL;
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "firstLineWithFile:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "rangeOfString:", CFSTR("Error")) != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("*** ERROR: parsing error in file %@"), v5);
      v8 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lastPathComponent");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager rulesFromFileWithForceLoad:]");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v35, v36, 120);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();
      v90 = 0;
      goto LABEL_65;
    }
    objc_msgSend(v7, "substringFromIndex:", 3);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_storedHash"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = 0x24BE74000uLL;
    objc_msgSend(MEMORY[0x24BE74FB0], "objectForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v14;
    v89 = self;
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v15 = objc_opt_class();
      v100[0] = MEMORY[0x24BDAC760];
      v100[1] = 3221225472;
      v100[2] = __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke;
      v100[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v100[4] = v15;
      if (rulesFromFileWithForceLoad__defaultOnce != -1)
        dispatch_once(&rulesFromFileWithForceLoad__defaultOnce, v100);
      if (rulesFromFileWithForceLoad__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("firstLine=%@, fileHash=%@, storedHash=%@"), v7, v8, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager rulesFromFileWithForceLoad:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 128);

        PLLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

        v6 = 0x24BDD1000uLL;
        v14 = v87;
        self = v89;
        v13 = 0x24BE74000uLL;
      }
    }
    if (!a3 && v14 && -[NSObject isEqualToString:](v8, "isEqualToString:", v14))
    {
      if (!objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v90 = 0;
        goto LABEL_64;
      }
      v22 = objc_opt_class();
      v99[0] = MEMORY[0x24BDAC760];
      v99[1] = 3221225472;
      v99[2] = __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_56;
      v99[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v99[4] = v22;
      if (rulesFromFileWithForceLoad__defaultOnce_54 != -1)
        dispatch_once(&rulesFromFileWithForceLoad__defaultOnce_54, v99);
      if (!rulesFromFileWithForceLoad__classDebugEnabled_55)
      {
        v90 = 0;
        v14 = v87;
        goto LABEL_64;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("hashes match, skipping parsing"));
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager rulesFromFileWithForceLoad:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = (void *)v23;
      objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 132);

      PLLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();
      v90 = 0;
      v14 = v87;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE74FB0], "setObject:forKey:saveToDisk:", v8, v12, 1);
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v5);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = v37;
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v38 = objc_opt_class();
        v98[0] = MEMORY[0x24BDAC760];
        v98[1] = 3221225472;
        v98[2] = __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_62;
        v98[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v98[4] = v38;
        if (rulesFromFileWithForceLoad__defaultOnce_60 != -1)
          dispatch_once(&rulesFromFileWithForceLoad__defaultOnce_60, v98);
        if (rulesFromFileWithForceLoad__classDebugEnabled_61)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fileBytes.length=%lu"), objc_msgSend(v37, "length"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "lastPathComponent");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager rulesFromFileWithForceLoad:]");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "logMessage:fromFile:fromFunction:fromLineNumber:", v39, v42, v43, 141);

          PLLogCommon();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

          v6 = 0x24BDD1000uLL;
          v13 = 0x24BE74000uLL;
          v37 = v86;
        }
      }
      objc_msgSend(v37, "subdataWithRange:", 89, objc_msgSend(v37, "length") - 89);
      v81 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "decryptData:withKey:", v81, CFSTR("563e097d3dea5165"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)MEMORY[0x24BDD17C8];
      v80 = objc_retainAutorelease(v45);
      objc_msgSend(v46, "stringWithUTF8String:", objc_msgSend(v80, "bytes"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v47;
      objc_msgSend(v47, "componentsSeparatedByCharactersInSet:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v50 = objc_opt_class();
        v97[0] = MEMORY[0x24BDAC760];
        v97[1] = 3221225472;
        v97[2] = __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_70;
        v97[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v97[4] = v50;
        if (rulesFromFileWithForceLoad__defaultOnce_68 != -1)
          dispatch_once(&rulesFromFileWithForceLoad__defaultOnce_68, v97);
        if (rulesFromFileWithForceLoad__classDebugEnabled_69)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("allLines=%@"), v49);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "lastPathComponent");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager rulesFromFileWithForceLoad:]");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v54, v55, 150);

          PLLogCommon();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

          v6 = 0x24BDD1000uLL;
          self = v89;
          v13 = 0x24BE74000uLL;
        }
      }
      v82 = v12;
      v83 = v8;
      v84 = v7;
      v85 = v5;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v90 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v96 = 0u;
      obj = v49;
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v94;
        do
        {
          v61 = 0;
          do
          {
            if (*(_QWORD *)v94 != v60)
              objc_enumerationMutation(obj);
            v62 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * v61);
            if (objc_msgSend(*(id *)(v13 + 4016), "debugEnabled"))
            {
              v63 = objc_opt_class();
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_77;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v63;
              if (rulesFromFileWithForceLoad__defaultOnce_75 != -1)
                dispatch_once(&rulesFromFileWithForceLoad__defaultOnce_75, block);
              if (rulesFromFileWithForceLoad__classDebugEnabled_76)
              {
                objc_msgSend(*(id *)(v6 + 1992), "stringWithFormat:", CFSTR("line=%@"), v62);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(*(id *)(v6 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "lastPathComponent");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v6 + 1992), "stringWithUTF8String:", "-[PLAccountingRuleManager rulesFromFileWithForceLoad:]");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "logMessage:fromFile:fromFunction:fromLineNumber:", v64, v67, v68, 156);

                PLLogCommon();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v102 = v64;
                  _os_log_debug_impl(&dword_21A62B000, v69, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v6 = 0x24BDD1000uLL;
                self = v89;
                v13 = 0x24BE74000uLL;
              }
            }
            -[PLAccountingRuleManager ruleWithString:withEntryDate:](self, "ruleWithString:withEntryDate:", v62, v57);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(*(id *)(v13 + 4016), "debugEnabled"))
            {
              v71 = objc_opt_class();
              v91[0] = MEMORY[0x24BDAC760];
              v91[1] = 3221225472;
              v91[2] = __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_82;
              v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v91[4] = v71;
              if (rulesFromFileWithForceLoad__defaultOnce_80 != -1)
                dispatch_once(&rulesFromFileWithForceLoad__defaultOnce_80, v91);
              if (rulesFromFileWithForceLoad__classDebugEnabled_81)
              {
                objc_msgSend(*(id *)(v6 + 1992), "stringWithFormat:", CFSTR("rule=%@"), v70);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(*(id *)(v6 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "lastPathComponent");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v6 + 1992), "stringWithUTF8String:", "-[PLAccountingRuleManager rulesFromFileWithForceLoad:]");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "logMessage:fromFile:fromFunction:fromLineNumber:", v72, v75, v76, 160);

                PLLogCommon();
                v77 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v102 = v72;
                  _os_log_debug_impl(&dword_21A62B000, v77, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v6 = 0x24BDD1000;
                self = v89;
                v13 = 0x24BE74000;
              }
            }
            if (v70)
              objc_msgSend(v90, "addObject:", v70);

            ++v61;
          }
          while (v59 != v61);
          v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
        }
        while (v59);
      }

      -[PLAccountingRuleManager setRegex:](self, "setRegex:", 0);
      v7 = v84;
      v5 = v85;
      v12 = v82;
      v8 = v83;
      v14 = v87;
      v28 = v81;
    }

LABEL_64:
LABEL_65:

    goto LABEL_66;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("*** ERROR: missing rules file %@"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x24BE74FA8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "lastPathComponent");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingRuleManager rulesFromFileWithForceLoad:]");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v31, v32, 111);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  v90 = 0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[PLAccountingDependency activate].cold.1();
    v90 = 0;
  }
LABEL_66:

  return v90;
}

uint64_t __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  rulesFromFileWithForceLoad__classDebugEnabled = result;
  return result;
}

uint64_t __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_56(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  rulesFromFileWithForceLoad__classDebugEnabled_55 = result;
  return result;
}

uint64_t __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_62(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  rulesFromFileWithForceLoad__classDebugEnabled_61 = result;
  return result;
}

uint64_t __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_70(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  rulesFromFileWithForceLoad__classDebugEnabled_69 = result;
  return result;
}

uint64_t __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_77(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  rulesFromFileWithForceLoad__classDebugEnabled_76 = result;
  return result;
}

uint64_t __54__PLAccountingRuleManager_rulesFromFileWithForceLoad___block_invoke_82(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  rulesFromFileWithForceLoad__classDebugEnabled_81 = result;
  return result;
}

+ (id)rulesPath
{
  return 0;
}

+ (id)storedHashDefaults
{
  return 0;
}

+ (id)firstLineWithFile:(id)a3
{
  id v3;
  FILE *v4;
  FILE *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  unsigned int v16;
  _BYTE v17[4097];
  uint64_t v18;

  MEMORY[0x24BDAC7A8](a1, a2, a3);
  v18 = *MEMORY[0x24BDAC8D0];
  v4 = fopen((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), "r");
  if (v4)
  {
    v5 = v4;
    v16 = 0;
    v6 = fscanf(v4, "%4096[^\n]%n%*c", v17, &v16);
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v7 = objc_opt_class();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __45__PLAccountingRuleManager_firstLineWithFile___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v7;
      if (firstLineWithFile__defaultOnce != -1)
        dispatch_once(&firstLineWithFile__defaultOnce, block);
      if (firstLineWithFile__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("buffer=%s, bytesRead=%i"), v17, v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PLAccountingRuleManager firstLineWithFile:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 189);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    fclose(v5);
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v17);
      v4 = (FILE *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

uint64_t __45__PLAccountingRuleManager_firstLineWithFile___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  firstLineWithFile__classDebugEnabled = result;
  return result;
}

- (id)ruleWithString:(id)a3 withEntryDate:(id)a4
{
  return 0;
}

+ (id)decryptData:(id)a3 withKey:(id)a4
{
  id v5;
  void *dataOut;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  CCCryptorStatus v16;
  void *v17;
  size_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v26[5];
  size_t v27;
  _QWORD block[5];
  _QWORD key[2];
  char v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  key[0] = 0;
  key[1] = 0;
  v30 = 0;
  objc_msgSend(a4, "getCString:maxLength:encoding:", key, 17, 4);
  dataOut = malloc_type_malloc(objc_msgSend(v5, "length") + 16, 0x4E7C9DECuLL);
  v7 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__PLAccountingRuleManager_decryptData_withKey___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (decryptData_withKey__defaultOnce != -1)
      dispatch_once(&decryptData_withKey__defaultOnce, block);
    if (decryptData_withKey__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("encryptedData.length=%lu"), objc_msgSend(v5, "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PLAccountingRuleManager decryptData:withKey:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 215);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  v27 = 0;
  v15 = objc_retainAutorelease(v5);
  v16 = CCCrypt(1u, 0, 3u, key, 0x10uLL, 0, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), dataOut, objc_msgSend(v15, "length") + 16, &v27);
  v17 = 0;
  v18 = v27;
  *((_BYTE *)dataOut + v27) = 0;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", dataOut, v18 + 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v26[0] = v8;
    v26[1] = 3221225472;
    v26[2] = __47__PLAccountingRuleManager_decryptData_withKey___block_invoke_91;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = objc_opt_class();
    if (decryptData_withKey__defaultOnce_89 != -1)
      dispatch_once(&decryptData_withKey__defaultOnce_89, v26);
    if (decryptData_withKey__classDebugEnabled_90)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("numBytesDecrypted=%lu"), v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingRuleManager.m");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PLAccountingRuleManager decryptData:withKey:]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 236);

      PLLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  free(dataOut);

  return v17;
}

uint64_t __47__PLAccountingRuleManager_decryptData_withKey___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decryptData_withKey__classDebugEnabled = result;
  return result;
}

uint64_t __47__PLAccountingRuleManager_decryptData_withKey___block_invoke_91(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  decryptData_withKey__classDebugEnabled_90 = result;
  return result;
}

- (NSRegularExpression)regex
{
  return self->_regex;
}

- (void)setRegex:(id)a3
{
  objc_storeStrong((id *)&self->_regex, a3);
}

- (void)setRuleIDToRule:(id)a3
{
  objc_storeStrong((id *)&self->_ruleIDToRule, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleIDToRule, 0);
  objc_storeStrong((id *)&self->_regex, 0);
}

@end
