@implementation PLAccountingQualificationRuleManager

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
  block[2] = __54__PLAccountingQualificationRuleManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_sharedInstance_1;
}

- (id)qualificationRulesForRootNodeID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLAccountingQualificationRuleManager rootNodeIDToQualificationRules](self, "rootNodeIDToQualificationRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)rootNodeIDToQualificationRules
{
  NSMutableDictionary *rootNodeIDToQualificationRules;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  rootNodeIDToQualificationRules = self->_rootNodeIDToQualificationRules;
  if (!rootNodeIDToQualificationRules)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_rootNodeIDToQualificationRules;
    self->_rootNodeIDToQualificationRules = v4;

    rootNodeIDToQualificationRules = self->_rootNodeIDToQualificationRules;
  }
  return rootNodeIDToQualificationRules;
}

- (id)qualificationRulesForQualificationID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PLAccountingQualificationRuleManager qualificationIDToQualificationRules](self, "qualificationIDToQualificationRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSMutableDictionary)qualificationIDToQualificationRules
{
  NSMutableDictionary *qualificationIDToQualificationRules;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  qualificationIDToQualificationRules = self->_qualificationIDToQualificationRules;
  if (!qualificationIDToQualificationRules)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_qualificationIDToQualificationRules;
    self->_qualificationIDToQualificationRules = v4;

    qualificationIDToQualificationRules = self->_qualificationIDToQualificationRules;
  }
  return qualificationIDToQualificationRules;
}

void __54__PLAccountingQualificationRuleManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;

}

- (id)regex
{
  NSRegularExpression *regex;
  NSRegularExpression *v4;
  NSRegularExpression *v5;

  regex = self->_regex;
  if (!regex)
  {
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("([-.\\w]*) -> ([-\\w]*)"), 0, 0);
    v4 = (NSRegularExpression *)objc_claimAutoreleasedReturnValue();
    v5 = self->_regex;
    self->_regex = v4;

    regex = self->_regex;
  }
  return regex;
}

+ (id)rulesEntryKey
{
  return +[PLAccountingQualificationRuleEntry entryKey](PLAccountingQualificationRuleEntry, "entryKey");
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
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Qualification_Rules_%@.txt"), v3);
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
    objc_msgSend(v9, "stringWithFormat:", CFSTR("ERROR: Could not find qualification rules file for %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BE74FA8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingQualificationRuleManager.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[PLAccountingQualificationRuleManager rulesPath]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 78);

    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[PLAccountingDependency activate].cold.1();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("Qualification_Rules_N41.txt");
    objc_msgSend(CFSTR("Qualification_Rules_N41.txt"), "stringByDeletingPathExtension");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Qualification_Rules_N41.txt"), "pathExtension");
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
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  PLAccountingQualificationRuleEntry *v39;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD block[6];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__PLAccountingQualificationRuleManager_ruleWithString_withEntryDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (ruleWithString_withEntryDate__defaultOnce_0 != -1)
      dispatch_once(&ruleWithString_withEntryDate__defaultOnce_0, block);
    if (ruleWithString_withEntryDate__classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("str=%@, entryDate=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingQualificationRuleManager.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationRuleManager ruleWithString:withEntryDate:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 89);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingQualificationRuleManager regex](self, "regex");
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

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v22 = objc_opt_class();
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __69__PLAccountingQualificationRuleManager_ruleWithString_withEntryDate___block_invoke_29;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v22;
      if (ruleWithString_withEntryDate__defaultOnce_27 != -1)
        dispatch_once(&ruleWithString_withEntryDate__defaultOnce_27, v45);
      if (ruleWithString_withEntryDate__classDebugEnabled_28)
      {
        v42 = v7;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rootNodeName=%@, rootNodeID=%@"), v19, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingQualificationRuleManager.m");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lastPathComponent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationRuleManager ruleWithString:withEntryDate:]");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 100);

        PLLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

        v7 = v42;
      }
    }
    if (v21)
    {
      v29 = objc_msgSend(v16, "rangeAtIndex:", 2);
      objc_msgSend(v6, "substringWithRange:", v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLAccountingEngine qualificationIDForQualificationName:](PLAccountingEngine, "qualificationIDForQualificationName:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v33 = objc_opt_class();
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __69__PLAccountingQualificationRuleManager_ruleWithString_withEntryDate___block_invoke_35;
        v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v44[4] = v33;
        if (ruleWithString_withEntryDate__defaultOnce_33 != -1)
          dispatch_once(&ruleWithString_withEntryDate__defaultOnce_33, v44);
        if (ruleWithString_withEntryDate__classDebugEnabled_34)
        {
          v43 = v7;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("qualificationName=%@, qualificationID=%@"), v31, v32);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingQualificationRuleManager.m");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "lastPathComponent");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationRuleManager ruleWithString:withEntryDate:]");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v36, v37, 105);

          PLLogCommon();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

          v7 = v43;
        }
      }
      if (v32)
        v39 = -[PLAccountingQualificationRuleEntry initWithRootNodeID:withQualificationID:withEntryDate:]([PLAccountingQualificationRuleEntry alloc], "initWithRootNodeID:withQualificationID:withEntryDate:", v21, v32, v7);
      else
        v39 = 0;

    }
    else
    {
      v39 = 0;
    }

  }
  else
  {
    v39 = 0;
  }

  return v39;
}

uint64_t __69__PLAccountingQualificationRuleManager_ruleWithString_withEntryDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ruleWithString_withEntryDate__classDebugEnabled_0 = result;
  return result;
}

uint64_t __69__PLAccountingQualificationRuleManager_ruleWithString_withEntryDate___block_invoke_29(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ruleWithString_withEntryDate__classDebugEnabled_28 = result;
  return result;
}

uint64_t __69__PLAccountingQualificationRuleManager_ruleWithString_withEntryDate___block_invoke_35(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ruleWithString_withEntryDate__classDebugEnabled_34 = result;
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
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
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
  NSObject *v33;
  _QWORD v34[5];
  _QWORD block[5];
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PLAccountingQualificationRuleManager;
  -[PLAccountingRuleManager indexRule:](&v36, sel_indexRule_, v4);
  v5 = v4;
  -[PLAccountingQualificationRuleManager rootNodeIDToQualificationRules](self, "rootNodeIDToQualificationRules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootNodeID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAccountingQualificationRuleManager rootNodeIDToQualificationRules](self, "rootNodeIDToQualificationRules");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rootNodeID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  objc_msgSend(v8, "addObject:", v5);
  v11 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v12 = MEMORY[0x24BDAC760];
  if (v11)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__PLAccountingQualificationRuleManager_indexRule___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (indexRule__defaultOnce_0 != -1)
      dispatch_once(&indexRule__defaultOnce_0, block);
    if (indexRule__classDebugEnabled_0)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingQualificationRuleManager rootNodeIDToQualificationRules](self, "rootNodeIDToQualificationRules");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("rootNodeIDToQualificationRules=%@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingQualificationRuleManager.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationRuleManager indexRule:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 127);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingQualificationRuleManager qualificationIDToQualificationRules](self, "qualificationIDToQualificationRules");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "qualificationID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAccountingQualificationRuleManager qualificationIDToQualificationRules](self, "qualificationIDToQualificationRules");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "qualificationID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v25);

  }
  objc_msgSend(v23, "addObject:", v5);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v34[0] = v12;
    v34[1] = 3221225472;
    v34[2] = __50__PLAccountingQualificationRuleManager_indexRule___block_invoke_43;
    v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v34[4] = objc_opt_class();
    if (indexRule__defaultOnce_41 != -1)
      dispatch_once(&indexRule__defaultOnce_41, v34);
    if (indexRule__classDebugEnabled_42)
    {
      v26 = (void *)MEMORY[0x24BDD17C8];
      -[PLAccountingQualificationRuleManager qualificationIDToQualificationRules](self, "qualificationIDToQualificationRules");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("qualificationIDToQualificationRules=%@"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Rule Managers/PLAccountingQualificationRuleManager.m");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lastPathComponent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingQualificationRuleManager indexRule:]");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 136);

      PLLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

uint64_t __50__PLAccountingQualificationRuleManager_indexRule___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  indexRule__classDebugEnabled_0 = result;
  return result;
}

uint64_t __50__PLAccountingQualificationRuleManager_indexRule___block_invoke_43(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  indexRule__classDebugEnabled_42 = result;
  return result;
}

- (void)setRegex:(id)a3
{
  objc_storeStrong((id *)&self->_regex, a3);
}

- (void)setRootNodeIDToQualificationRules:(id)a3
{
  objc_storeStrong((id *)&self->_rootNodeIDToQualificationRules, a3);
}

- (void)setQualificationIDToQualificationRules:(id)a3
{
  objc_storeStrong((id *)&self->_qualificationIDToQualificationRules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualificationIDToQualificationRules, 0);
  objc_storeStrong((id *)&self->_rootNodeIDToQualificationRules, 0);
  objc_storeStrong((id *)&self->_regex, 0);
}

@end
