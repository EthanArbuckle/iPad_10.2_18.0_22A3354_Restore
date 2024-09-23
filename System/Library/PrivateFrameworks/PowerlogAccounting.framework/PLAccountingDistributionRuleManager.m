@implementation PLAccountingDistributionRuleManager

+ (id)sharedInstance
{
  void *v3;
  void *v4;
  char v5;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "storageLocked");

  if ((v5 & 1) != 0)
    return 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__PLAccountingDistributionRuleManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sharedInstance_0;
}

- (id)distributionRuleForRootNodeID:(id)a3 andNodeID:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v26[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79__PLAccountingDistributionRuleManager_distributionRuleForRootNodeID_andNodeID___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (distributionRuleForRootNodeID_andNodeID__defaultOnce != -1)
      dispatch_once(&distributionRuleForRootNodeID_andNodeID__defaultOnce, block);
    if (distributionRuleForRootNodeID_andNodeID__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rootNodeID=%@, nodeID=%@"), v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionRuleManager distributionRuleForRootNodeID:andNodeID:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 36);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingDistributionRuleManager rootNodeIDToNodeIDToDistributionRule](self, "rootNodeIDToNodeIDToDistributionRule");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __79__PLAccountingDistributionRuleManager_distributionRuleForRootNodeID_andNodeID___block_invoke_15;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = objc_opt_class();
    if (distributionRuleForRootNodeID_andNodeID__defaultOnce_13 != -1)
      dispatch_once(&distributionRuleForRootNodeID_andNodeID__defaultOnce_13, v26);
    if (distributionRuleForRootNodeID_andNodeID__classDebugEnabled_14)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("nodeIDToDistributionRule=%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionRuleManager distributionRuleForRootNodeID:andNodeID:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 40);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v17)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (NSMutableDictionary)rootNodeIDToNodeIDToDistributionRule
{
  NSMutableDictionary *rootNodeIDToNodeIDToDistributionRule;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  rootNodeIDToNodeIDToDistributionRule = self->_rootNodeIDToNodeIDToDistributionRule;
  if (!rootNodeIDToNodeIDToDistributionRule)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rootNodeIDToNodeIDToDistributionRule;
    self->_rootNodeIDToNodeIDToDistributionRule = v4;

    rootNodeIDToNodeIDToDistributionRule = self->_rootNodeIDToNodeIDToDistributionRule;
  }
  return rootNodeIDToNodeIDToDistributionRule;
}

- (id)distributionRulesForDistributionID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLAccountingDistributionRuleManager distributionIDToDistributionRules](self, "distributionIDToDistributionRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)distributionIDToDistributionRules
{
  NSMutableDictionary *distributionIDToDistributionRules;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  distributionIDToDistributionRules = self->_distributionIDToDistributionRules;
  if (!distributionIDToDistributionRules)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_distributionIDToDistributionRules;
    self->_distributionIDToDistributionRules = v4;

    distributionIDToDistributionRules = self->_distributionIDToDistributionRules;
  }
  return distributionIDToDistributionRules;
}

void __53__PLAccountingDistributionRuleManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

uint64_t __79__PLAccountingDistributionRuleManager_distributionRuleForRootNodeID_andNodeID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  distributionRuleForRootNodeID_andNodeID__classDebugEnabled = result;
  return result;
}

uint64_t __79__PLAccountingDistributionRuleManager_distributionRuleForRootNodeID_andNodeID___block_invoke_15(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  distributionRuleForRootNodeID_andNodeID__classDebugEnabled_14 = result;
  return result;
}

- (id)regex
{
  NSRegularExpression *regex;
  NSRegularExpression *v4;
  NSRegularExpression *v5;

  regex = self->_regex;
  if (!regex)
  {
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("([-.\\w]*) -> .* \\[label=\"([-\\w]*): ([-\\w]*)\"]"), 0, 0);
    v4 = (NSRegularExpression *)objc_claimAutoreleasedReturnValue();
    v5 = self->_regex;
    self->_regex = v4;

    regex = self->_regex;
  }
  return regex;
}

+ (id)rulesEntryKey
{
  return +[PLAccountingDistributionRuleEntry entryKey](PLAccountingDistributionRuleEntry, "entryKey");
}

+ (id)rulesPath
{
  void *v2;
  void *v3;
  __CFString *v4;
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
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BE74FD8], "kPLDeviceClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Distribution_Rules_%@.txt"), v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByDeletingPathExtension](v4, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString pathExtension](v4, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BE74FD8], "kPLDeviceClassName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("ERROR: Could not find distribution rules file for %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BE74FA8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PLAccountingDistributionRuleManager rulesPath]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 87);

    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[PLAccountingDependency activate].cold.1();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("Distribution_Rules_N41.txt");
    objc_msgSend(CFSTR("Distribution_Rules_N41.txt"), "stringByDeletingPathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Distribution_Rules_N41.txt"), "pathExtension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pathForResource:ofType:", v18, v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)ruleWithString:(id)a3 withEntryDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
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
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  PLAccountingDistributionRuleEntry *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  _QWORD v60[5];
  _QWORD v61[5];
  _QWORD v62[5];
  _QWORD block[6];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (ruleWithString_withEntryDate__defaultOnce != -1)
      dispatch_once(&ruleWithString_withEntryDate__defaultOnce, block);
    if (ruleWithString_withEntryDate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("str=%@, entryDate=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionRuleManager ruleWithString:withEntryDate:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 98);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingDistributionRuleManager regex](self, "regex");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_msgSend(v16, "rangeAtIndex:", 1);
    objc_msgSend(v6, "substringWithRange:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLAccountingNodeManager sharedInstance](PLAccountingNodeManager, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "nodeIDForNodeName:isPermanent:", v19, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v19;
    v59 = v7;
    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v22 = objc_opt_class();
      v62[0] = MEMORY[0x24BDAC760];
      v62[1] = 3221225472;
      v62[2] = __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke_36;
      v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v62[4] = v22;
      if (ruleWithString_withEntryDate__defaultOnce_34 != -1)
        dispatch_once(&ruleWithString_withEntryDate__defaultOnce_34, v62);
      if (ruleWithString_withEntryDate__classDebugEnabled_35)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("nodeName=%@, nodeID=%@"), v19, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lastPathComponent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionRuleManager ruleWithString:withEntryDate:]");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 109);

        PLLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

        v19 = v58;
        v7 = v59;
      }
    }
    if (v21)
    {
      v29 = objc_msgSend(v16, "rangeAtIndex:", 2);
      objc_msgSend(v6, "substringWithRange:", v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLAccountingNodeManager sharedInstance](PLAccountingNodeManager, "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "nodeIDForNodeName:isPermanent:", v31, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v34 = objc_opt_class();
        v61[0] = MEMORY[0x24BDAC760];
        v61[1] = 3221225472;
        v61[2] = __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke_41;
        v61[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v61[4] = v34;
        if (ruleWithString_withEntryDate__defaultOnce_39 != -1)
          dispatch_once(&ruleWithString_withEntryDate__defaultOnce_39, v61);
        if (ruleWithString_withEntryDate__classDebugEnabled_40)
        {
          v54 = v33;
          v56 = v31;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rootNodeName=%@, rootNodeID=%@"), v31, v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "lastPathComponent");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionRuleManager ruleWithString:withEntryDate:]");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 115);

          PLLogCommon();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

          v19 = v58;
          v7 = v59;
          v33 = v54;
          v31 = v56;
        }
      }
      if (v33)
      {
        v41 = objc_msgSend(v16, "rangeAtIndex:", 3);
        objc_msgSend(v6, "substringWithRange:", v41, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLAccountingEngine distributionIDForDistributionName:](PLAccountingEngine, "distributionIDForDistributionName:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v45 = objc_opt_class();
          v60[0] = MEMORY[0x24BDAC760];
          v60[1] = 3221225472;
          v60[2] = __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke_47;
          v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v60[4] = v45;
          if (ruleWithString_withEntryDate__defaultOnce_45 != -1)
            dispatch_once(&ruleWithString_withEntryDate__defaultOnce_45, v60);
          if (ruleWithString_withEntryDate__classDebugEnabled_46)
          {
            v55 = v33;
            v57 = v31;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionName=%@, distributionID=%@"), v43, v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "lastPathComponent");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionRuleManager ruleWithString:withEntryDate:]");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v49, v50, 120);

            PLLogCommon();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();

            v33 = v55;
            v31 = v57;
          }
        }
        if (v44)
          v52 = -[PLAccountingDistributionRuleEntry initWithNodeID:withRootNodeID:withDistributionID:withEntryDate:]([PLAccountingDistributionRuleEntry alloc], "initWithNodeID:withRootNodeID:withDistributionID:withEntryDate:", v21, v33, v44, v59);
        else
          v52 = 0;

        v19 = v58;
        v7 = v59;
      }
      else
      {
        v52 = 0;
      }

    }
    else
    {
      v52 = 0;
    }

  }
  else
  {
    v52 = 0;
  }

  return v52;
}

uint64_t __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ruleWithString_withEntryDate__classDebugEnabled = result;
  return result;
}

uint64_t __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke_36(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ruleWithString_withEntryDate__classDebugEnabled_35 = result;
  return result;
}

uint64_t __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke_41(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ruleWithString_withEntryDate__classDebugEnabled_40 = result;
  return result;
}

uint64_t __68__PLAccountingDistributionRuleManager_ruleWithString_withEntryDate___block_invoke_47(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ruleWithString_withEntryDate__classDebugEnabled_46 = result;
  return result;
}

- (void)indexRule:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _QWORD v35[5];
  _QWORD block[5];
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PLAccountingDistributionRuleManager;
  -[PLAccountingRuleManager indexRule:](&v37, sel_indexRule_, v4);
  v5 = v4;
  -[PLAccountingDistributionRuleManager rootNodeIDToNodeIDToDistributionRule](self, "rootNodeIDToNodeIDToDistributionRule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootNodeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAccountingDistributionRuleManager rootNodeIDToNodeIDToDistributionRule](self, "rootNodeIDToNodeIDToDistributionRule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootNodeID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  objc_msgSend(v5, "nodeID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, v11);

  v12 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v13 = MEMORY[0x24BDAC760];
  if (v12)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__PLAccountingDistributionRuleManager_indexRule___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (indexRule__defaultOnce != -1)
      dispatch_once(&indexRule__defaultOnce, block);
    if (indexRule__classDebugEnabled)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingDistributionRuleManager rootNodeIDToNodeIDToDistributionRule](self, "rootNodeIDToNodeIDToDistributionRule");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("rootNodeIDToNodeIDToDistributionRule=%@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionRuleManager indexRule:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 143);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingDistributionRuleManager distributionIDToDistributionRules](self, "distributionIDToDistributionRules");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "distributionID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAccountingDistributionRuleManager distributionIDToDistributionRules](self, "distributionIDToDistributionRules");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "distributionID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v26);

  }
  objc_msgSend(v24, "addObject:", v5);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v35[0] = v13;
    v35[1] = 3221225472;
    v35[2] = __49__PLAccountingDistributionRuleManager_indexRule___block_invoke_55;
    v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v35[4] = objc_opt_class();
    if (indexRule__defaultOnce_53 != -1)
      dispatch_once(&indexRule__defaultOnce_53, v35);
    if (indexRule__classDebugEnabled_54)
    {
      v27 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingDistributionRuleManager distributionIDToDistributionRules](self, "distributionIDToDistributionRules");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("distributionIDToDistributionRules=%@"), v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingDistributionRuleManager.m");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastPathComponent");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionRuleManager indexRule:]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 152);

      PLLogCommon();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

uint64_t __49__PLAccountingDistributionRuleManager_indexRule___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  indexRule__classDebugEnabled = result;
  return result;
}

uint64_t __49__PLAccountingDistributionRuleManager_indexRule___block_invoke_55(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  indexRule__classDebugEnabled_54 = result;
  return result;
}

- (void)setRegex:(id)a3
{
  objc_storeStrong((id *)&self->_regex, a3);
}

- (void)setRootNodeIDToNodeIDToDistributionRule:(id)a3
{
  objc_storeStrong((id *)&self->_rootNodeIDToNodeIDToDistributionRule, a3);
}

- (void)setDistributionIDToDistributionRules:(id)a3
{
  objc_storeStrong((id *)&self->_distributionIDToDistributionRules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distributionIDToDistributionRules, 0);
  objc_storeStrong((id *)&self->_rootNodeIDToNodeIDToDistributionRule, 0);
  objc_storeStrong((id *)&self->_regex, 0);
}

@end
