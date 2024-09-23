@implementation PLAccountingDistributionManager

- (void)addEnergyEstimate:(id)a3 withNow:(id)a4
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
  PLAccountingDistributionOwner *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__PLAccountingDistributionManager_addEnergyEstimate_withNow___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (addEnergyEstimate_withNow__defaultOnce_0 != -1)
      dispatch_once(&addEnergyEstimate_withNow__defaultOnce_0, block);
    if (addEnergyEstimate_withNow__classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("energyEstimate=%@, now=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager addEnergyEstimate:withNow:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 26);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v6 && v7)
  {
    if ((int)objc_msgSend(v6, "numAncestors") < 100)
    {
      v15 = -[PLAccountingDistributionOwner initWithEnergyEstimate:]([PLAccountingDistributionOwner alloc], "initWithEnergyEstimate:", v6);
      objc_msgSend(v6, "distributionRuleID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "intValue");

      if (v22 < 1)
      {
        if (objc_msgSend(v6, "writeToDB"))
        {
          objc_msgSend(v6, "setDistributionDate:", v7);
          -[PLAccountingDistributionManager delegate](self, "delegate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "didDistributeEnergyEstimate:", v6);

        }
      }
      else
      {
        if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
        {
          v23 = objc_opt_class();
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __61__PLAccountingDistributionManager_addEnergyEstimate_withNow___block_invoke_16;
          v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v31[4] = v23;
          if (addEnergyEstimate_withNow__defaultOnce_14 != -1)
            dispatch_once(&addEnergyEstimate_withNow__defaultOnce_14, v31);
          if (addEnergyEstimate_withNow__classDebugEnabled_15)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rule exists"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = (void *)MEMORY[0x24BE74FA8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "lastPathComponent");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager addEnergyEstimate:withNow:]");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 39);

            PLLogCommon();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              -[PLAccountingDependency activate].cold.1();

          }
        }
        -[PLAccountingOwnerDependencyManager addOwner:](self, "addOwner:", v15);
      }
      -[PLAccountingOwnerDependencyManager notifyDependenciesWithOwner:](self, "notifyDependenciesWithOwner:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("WARNING: possible accounting distribution loop detected for energyEstimate=%@"), v6);
      v15 = (PLAccountingDistributionOwner *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager addEnergyEstimate:withNow:]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 31);

      PLLogCommon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }

}

- (PLAccountingDistributionManagerDelegate)delegate
{
  return (PLAccountingDistributionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)didDistributeEnergyEstimate:(id)a3
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
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD block[5];
  id v17;
  _QWORD v18[5];

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __63__PLAccountingDistributionManager_didDistributeEnergyEstimate___block_invoke;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = objc_opt_class();
    if (didDistributeEnergyEstimate__defaultOnce != -1)
      dispatch_once(&didDistributeEnergyEstimate__defaultOnce, v18);
    if (didDistributeEnergyEstimate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("energyEstimate=%@"), v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager didDistributeEnergyEstimate:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 177);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingDistributionManager delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __63__PLAccountingDistributionManager_didDistributeEnergyEstimate___block_invoke_89;
  block[3] = &unk_24DCF9B10;
  block[4] = self;
  v17 = v4;
  v15 = v4;
  dispatch_async(v14, block);

}

- (id)ownerIDsForDependency:(id)a3
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
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  _QWORD block[5];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__PLAccountingDistributionManager_ownerIDsForDependency___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (ownerIDsForDependency__defaultOnce_0 != -1)
      dispatch_once(&ownerIDsForDependency__defaultOnce_0, block);
    if (ownerIDsForDependency__classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dependency=%@"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager ownerIDsForDependency:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 197);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v3)
  {
    +[PLAccountingDistributionRuleManager sharedInstance](PLAccountingDistributionRuleManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "distributionRulesForDistributionID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __57__PLAccountingDistributionManager_ownerIDsForDependency___block_invoke_102;
      v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v45[4] = v14;
      if (ownerIDsForDependency__defaultOnce_100 != -1)
        dispatch_once(&ownerIDsForDependency__defaultOnce_100, v45);
      if (ownerIDsForDependency__classDebugEnabled_101)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionRules=%@"), v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager ownerIDsForDependency:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 202);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v22 = v13;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v42 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "entryID"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v27);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v24);
      }

      if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
      {
        v28 = objc_opt_class();
        v36 = MEMORY[0x24BDAC760];
        v37 = 3221225472;
        v38 = __57__PLAccountingDistributionManager_ownerIDsForDependency___block_invoke_106;
        v39 = &__block_descriptor_40_e5_v8__0lu32l8;
        v40 = v28;
        if (ownerIDsForDependency__defaultOnce_104 != -1)
          dispatch_once(&ownerIDsForDependency__defaultOnce_104, &v36);
        if (ownerIDsForDependency__classDebugEnabled_105)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionRuleIDs=%@"), v21, v36, v37, v38, v39, v40, (_QWORD)v41);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)MEMORY[0x24BE74FA8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "lastPathComponent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager ownerIDsForDependency:]");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "logMessage:fromFile:fromFunction:fromLineNumber:", v29, v32, v33, 209);

          PLLogCommon();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            -[PLAccountingDependency activate].cold.1();

        }
      }
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)addDistributionEvent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  PLAccountingDistributionDependency *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[5];
  _QWORD block[5];

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__PLAccountingDistributionManager_addDistributionEvent___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (addDistributionEvent__defaultOnce != -1)
      dispatch_once(&addDistributionEvent__defaultOnce, block);
    if (addDistributionEvent__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionEvent=%@"), v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager addDistributionEvent:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 52);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v4)
  {
    v12 = -[PLAccountingDistributionDependency initWithDistributionEvent:]([PLAccountingDistributionDependency alloc], "initWithDistributionEvent:", v4);
    +[PLAccountingDistributionRuleManager sharedInstance](PLAccountingDistributionRuleManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "distributionID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "distributionRulesForDistributionID:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v16 = objc_opt_class();
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __56__PLAccountingDistributionManager_addDistributionEvent___block_invoke_25;
      v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v23[4] = v16;
      if (addDistributionEvent__defaultOnce_23 != -1)
        dispatch_once(&addDistributionEvent__defaultOnce_23, v23);
      if (addDistributionEvent__classDebugEnabled_24)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionRules=%@"), v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager addDistributionEvent:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 59);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    if (v15 && objc_msgSend(v15, "count"))
      -[PLAccountingOwnerDependencyManager addDependency:](self, "addDependency:", v12);
    -[PLAccountingOwnerDependencyManager notifyOwnersWithDependency:](self, "notifyOwnersWithDependency:", v12);

  }
}

- (void)didDistributeToChildEnergyEstimate:(id)a3 fromParentEnergyEstimate:(id)a4
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
  NSObject *v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  _QWORD v23[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled");
  v9 = MEMORY[0x24BDAC760];
  if (v8)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __95__PLAccountingDistributionManager_didDistributeToChildEnergyEstimate_fromParentEnergyEstimate___block_invoke;
    v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v23[4] = objc_opt_class();
    if (didDistributeToChildEnergyEstimate_fromParentEnergyEstimate__defaultOnce != -1)
      dispatch_once(&didDistributeToChildEnergyEstimate_fromParentEnergyEstimate__defaultOnce, v23);
    if (didDistributeToChildEnergyEstimate_fromParentEnergyEstimate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("childEnergyEstimate=%@, parentEnergyEstimate=%@"), v6, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager didDistributeToChildEnergyEstimate:fromParentEnergyEstimate:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 169);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  -[PLAccountingDistributionManager delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "workQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __95__PLAccountingDistributionManager_didDistributeToChildEnergyEstimate_fromParentEnergyEstimate___block_invoke_86;
  block[3] = &unk_24DCF9AE8;
  block[4] = self;
  v21 = v6;
  v22 = v7;
  v18 = v7;
  v19 = v6;
  dispatch_async(v17, block);

}

- (void)closeLastDistributionEventForwardWithDistributionID:(id)a3 withEndDate:(id)a4
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
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[5];
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __99__PLAccountingDistributionManager_closeLastDistributionEventForwardWithDistributionID_withEndDate___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (closeLastDistributionEventForwardWithDistributionID_withEndDate__defaultOnce != -1)
      dispatch_once(&closeLastDistributionEventForwardWithDistributionID_withEndDate__defaultOnce, block);
    if (closeLastDistributionEventForwardWithDistributionID_withEndDate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionID=%@, endDate=%@"), v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager closeLastDistributionEventForwardWithDistributionID:withEndDate:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 71);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  v15 = objc_msgSend(v6, "intValue");
  if (v7 && v15 >= 1)
  {
    objc_msgSend(&unk_24DD030B8, "objectAtIndexedSubscript:", (int)objc_msgSend(v6, "intValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intValue");

    if ((_DWORD)v17 == 1)
    {
      -[PLAccountingOwnerDependencyManager updateLastDependencyID:withEndDate:](self, "updateLastDependencyID:withEndDate:", v6, v7);
    }
    else if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v18 = objc_opt_class();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __99__PLAccountingDistributionManager_closeLastDistributionEventForwardWithDistributionID_withEndDate___block_invoke_37;
      v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v25[4] = v18;
      if (closeLastDistributionEventForwardWithDistributionID_withEndDate__defaultOnce_35 != -1)
        dispatch_once(&closeLastDistributionEventForwardWithDistributionID_withEndDate__defaultOnce_35, v25);
      if (closeLastDistributionEventForwardWithDistributionID_withEndDate__classDebugEnabled_36)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("directionality=%i not allowed for closing"), v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastPathComponent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager closeLastDistributionEventForwardWithDistributionID:withEndDate:]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v22, v23, 76);

        PLLogCommon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
  }

}

- (id)dependencyIDsForOwner:(id)a3
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
  void *v23;
  _QWORD v25[5];
  _QWORD block[5];

  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v4 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__PLAccountingDistributionManager_dependencyIDsForOwner___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (dependencyIDsForOwner__defaultOnce_0 != -1)
      dispatch_once(&dependencyIDsForOwner__defaultOnce_0, block);
    if (dependencyIDsForOwner__classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("owner=%@"), v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager dependencyIDsForOwner:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 185);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  if (v3)
  {
    +[PLAccountingDistributionRuleManager sharedInstance](PLAccountingDistributionRuleManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ruleForRuleID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
    {
      v14 = objc_opt_class();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __57__PLAccountingDistributionManager_dependencyIDsForOwner___block_invoke_94;
      v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v25[4] = v14;
      if (dependencyIDsForOwner__defaultOnce_92 != -1)
        dispatch_once(&dependencyIDsForOwner__defaultOnce_92, v25);
      if (dependencyIDsForOwner__classDebugEnabled_93)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionRule=%@"), v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BE74FA8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager dependencyIDsForOwner:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 189);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[PLAccountingDependency activate].cold.1();

      }
    }
    if (v13)
    {
      v21 = (void *)MEMORY[0x24BDBCEF0];
      objc_msgSend(v13, "distributionID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setWithObject:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (double)freeTimerInterval
{
  double v2;
  _QWORD v4[4];
  __CFString *v5;
  uint64_t v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__PLAccountingDistributionManager_freeTimerInterval__block_invoke;
  v4[3] = &unk_24DCF9A50;
  v5 = CFSTR("PLAccountingDistributionManager_freeTimerInterval");
  v6 = 0x409C200000000000;
  if (freeTimerInterval_defaultOnce_0 != -1)
    dispatch_once(&freeTimerInterval_defaultOnce_0, v4);
  v2 = *(double *)&freeTimerInterval_objectForKey_0;

  return v2;
}

- (PLAccountingDistributionManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLAccountingDistributionManager;
  return -[PLAccountingOwnerDependencyManager init](&v3, sel_init);
}

uint64_t __61__PLAccountingDistributionManager_addEnergyEstimate_withNow___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addEnergyEstimate_withNow__classDebugEnabled_0 = result;
  return result;
}

uint64_t __61__PLAccountingDistributionManager_addEnergyEstimate_withNow___block_invoke_16(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addEnergyEstimate_withNow__classDebugEnabled_15 = result;
  return result;
}

uint64_t __56__PLAccountingDistributionManager_addDistributionEvent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addDistributionEvent__classDebugEnabled = result;
  return result;
}

uint64_t __56__PLAccountingDistributionManager_addDistributionEvent___block_invoke_25(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addDistributionEvent__classDebugEnabled_24 = result;
  return result;
}

uint64_t __99__PLAccountingDistributionManager_closeLastDistributionEventForwardWithDistributionID_withEndDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  closeLastDistributionEventForwardWithDistributionID_withEndDate__classDebugEnabled = result;
  return result;
}

uint64_t __99__PLAccountingDistributionManager_closeLastDistributionEventForwardWithDistributionID_withEndDate___block_invoke_37(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  closeLastDistributionEventForwardWithDistributionID_withEndDate__classDebugEnabled_36 = result;
  return result;
}

uint64_t __52__PLAccountingDistributionManager_freeTimerInterval__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "doubleForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  freeTimerInterval_objectForKey_0 = v2;
  return result;
}

- (void)reloadDependenciesNewerThanDate:(id)a3
{
  void *v3;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  unint64_t v73;
  PLAccountingDistributionManager *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id obj;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  id v102;
  void *v103;
  id v104;
  _QWORD block[5];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _QWORD v110[5];
  _QWORD v111[5];
  _QWORD v112[5];
  _QWORD v113[5];
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _QWORD v118[5];
  uint8_t v119[128];
  uint8_t buf[4];
  void *v121;
  _BYTE v122[128];
  uint64_t v123;

  v123 = *MEMORY[0x24BDAC8D0];
  v91 = a3;
  v5 = 0x24BE74000uLL;
  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v118[0] = MEMORY[0x24BDAC760];
    v118[1] = 3221225472;
    v118[2] = __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke;
    v118[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v118[4] = v6;
    if (reloadDependenciesNewerThanDate__defaultOnce_0 != -1)
      dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_0, v118);
    if (reloadDependenciesNewerThanDate__classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("date=%@"), v91);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager reloadDependenciesNewerThanDate:]");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v3, 90);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLAccountingDependency activate].cold.1();

    }
  }
  v12 = v91;
  if (v91)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v91, "isEqualToDate:", v13);

    v12 = v91;
    if ((v14 & 1) == 0)
    {
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      +[PLAccountingEngine allDistributionIDs](PLAccountingEngine, "allDistributionIDs");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v122, 16);
      if (v94)
      {
        v15 = 0x24BDD1000uLL;
        v89 = *MEMORY[0x24BE75148];
        v88 = *MEMORY[0x24BE75140];
        v92 = *MEMORY[0x24BE75138];
        v93 = *(_QWORD *)v115;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v115 != v93)
            {
              v17 = v16;
              objc_enumerationMutation(obj);
              v16 = v17;
            }
            v96 = v16;
            v18 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v16);
            if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
            {
              v19 = objc_opt_class();
              v113[0] = MEMORY[0x24BDAC760];
              v113[1] = 3221225472;
              v113[2] = __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_48;
              v113[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v113[4] = v19;
              if (reloadDependenciesNewerThanDate__defaultOnce_46 != -1)
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_46, v113);
              if (reloadDependenciesNewerThanDate__classDebugEnabled_47)
              {
                v20 = v18;
                objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("distributionID=%@"), v18);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "lastPathComponent");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "-[PLAccountingDistributionManager reloadDependenciesNewerThanDate:]");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v24, v25, 95);

                PLLogCommon();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v121 = v21;
                  _os_log_debug_impl(&dword_21A62B000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v18 = v20;
              }
            }
            objc_msgSend(&unk_24DD030D0, "objectAtIndexedSubscript:", (int)objc_msgSend(v18, "intValue"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "intValue");

            if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
            {
              v29 = objc_opt_class();
              v112[0] = MEMORY[0x24BDAC760];
              v112[1] = 3221225472;
              v112[2] = __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_55;
              v112[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v112[4] = v29;
              if (reloadDependenciesNewerThanDate__defaultOnce_53_0 != -1)
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_53_0, v112);
              if (reloadDependenciesNewerThanDate__classDebugEnabled_54_0)
              {
                v103 = v18;
                objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("directionality=%i"), v28);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "lastPathComponent");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "-[PLAccountingDistributionManager reloadDependenciesNewerThanDate:]");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v33, v34, 99);

                PLLogCommon();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v121 = v30;
                  _os_log_debug_impl(&dword_21A62B000, v35, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v18 = v103;
              }
            }
            v36 = v28 - 1;
            v37 = v92;
            switch(v36)
            {
              case 0:
                +[PLAccountingDistributionEventForwardEntry entryKey](PLAccountingDistributionEventForwardEntry, "entryKey");
                v38 = objc_claimAutoreleasedReturnValue();
                v39 = *(void **)(v15 + 1992);
                objc_msgSend(v91, "timeIntervalSince1970");
                v87 = v40;
                v41 = v89;
                goto LABEL_32;
              case 1:
                +[PLAccountingDistributionEventBackwardEntry entryKey](PLAccountingDistributionEventBackwardEntry, "entryKey");
                v38 = objc_claimAutoreleasedReturnValue();
                v39 = *(void **)(v15 + 1992);
                objc_msgSend(v91, "timeIntervalSince1970");
                v87 = v42;
                v41 = v88;
LABEL_32:
                objc_msgSend(v39, "stringWithFormat:", CFSTR("ID >= (SELECT MIN(ID)-1 FROM '%@' WHERE (%@ = %@ AND (timestamp+%@) >= %f))"), v38, v92, v18, v41, v87);
                goto LABEL_35;
              case 2:
                +[PLAccountingDistributionEventIntervalEntry entryKey](PLAccountingDistributionEventIntervalEntry, "entryKey");
                v38 = objc_claimAutoreleasedReturnValue();
                v43 = *(void **)(v15 + 1992);
                objc_msgSend(v91, "timeIntervalSince1970");
                objc_msgSend(v43, "stringWithFormat:", CFSTR("(timestamp+%@) >= %f"), v88, v44, v84, v85, v86);
                goto LABEL_35;
              case 3:
                +[PLAccountingDistributionEventPointEntry entryKey](PLAccountingDistributionEventPointEntry, "entryKey");
                v38 = objc_claimAutoreleasedReturnValue();
                v45 = *(void **)(v15 + 1992);
                objc_msgSend(v91, "timeIntervalSince1970");
                objc_msgSend(v45, "stringWithFormat:", CFSTR("(timestamp+%@) >= %f"), v89, v46, v84, v85, v86);
LABEL_35:
                v47 = objc_claimAutoreleasedReturnValue();
                break;
              default:
                v47 = 0;
                v38 = 0;
                v37 = v92;
                break;
            }
            v95 = (void *)v47;
            v84 = v18;
            v85 = v47;
            v97 = (void *)v38;
            objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("SELECT * FROM '%@' WHERE (%@ = %@ AND (%@));"),
              v38,
              v37);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
            {
              v48 = objc_opt_class();
              v111[0] = MEMORY[0x24BDAC760];
              v111[1] = 3221225472;
              v111[2] = __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_70;
              v111[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v111[4] = v48;
              if (reloadDependenciesNewerThanDate__defaultOnce_68_0 != -1)
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_68_0, v111);
              if (reloadDependenciesNewerThanDate__classDebugEnabled_69_0)
              {
                v49 = v36;
                objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("distributionQuery=%@"), v98);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "lastPathComponent");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "-[PLAccountingDistributionManager reloadDependenciesNewerThanDate:]");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "logMessage:fromFile:fromFunction:fromLineNumber:", v50, v53, v54, 128);

                PLLogCommon();
                v55 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v121 = v50;
                  _os_log_debug_impl(&dword_21A62B000, v55, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v36 = v49;
              }
            }
            objc_msgSend(MEMORY[0x24BE75008], "sharedCore");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "storage");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "entriesForKey:withQuery:", v97, v98);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            v100 = v36;
            if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
            {
              v59 = objc_opt_class();
              v110[0] = MEMORY[0x24BDAC760];
              v110[1] = 3221225472;
              v110[2] = __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_76;
              v110[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v110[4] = v59;
              if (reloadDependenciesNewerThanDate__defaultOnce_74_0 != -1)
                dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_74_0, v110);
              if (reloadDependenciesNewerThanDate__classDebugEnabled_75_0)
              {
                objc_msgSend(*(id *)(v15 + 1992), "stringWithFormat:", CFSTR("distributionEvents=%@"), v58);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = (void *)MEMORY[0x24BE74FA8];
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "lastPathComponent");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(v15 + 1992), "stringWithUTF8String:", "-[PLAccountingDistributionManager reloadDependenciesNewerThanDate:]");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v61, "logMessage:fromFile:fromFunction:fromLineNumber:", v60, v63, v64, 132);

                PLLogCommon();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v121 = v60;
                  _os_log_debug_impl(&dword_21A62B000, v65, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v36 = v100;
              }
            }
            v108 = 0u;
            v109 = 0u;
            v106 = 0u;
            v107 = 0u;
            v102 = v58;
            v66 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
            if (v66)
            {
              v67 = v66;
              v104 = 0;
              v68 = *(_QWORD *)v107;
              v99 = *(_QWORD *)v107;
              do
              {
                v69 = 0;
                v101 = v67;
                do
                {
                  if (*(_QWORD *)v107 != v68)
                    objc_enumerationMutation(v102);
                  v70 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * v69);
                  if (objc_msgSend(*(id *)(v5 + 4016), "debugEnabled"))
                  {
                    v71 = objc_opt_class();
                    block[0] = MEMORY[0x24BDAC760];
                    block[1] = 3221225472;
                    block[2] = __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_81;
                    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                    block[4] = v71;
                    if (reloadDependenciesNewerThanDate__defaultOnce_79_0 != -1)
                      dispatch_once(&reloadDependenciesNewerThanDate__defaultOnce_79_0, block);
                    if (reloadDependenciesNewerThanDate__classDebugEnabled_80_0)
                    {
                      v72 = v3;
                      v73 = v5;
                      v74 = self;
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("distributionEvent=%@, lastDistributionEvent=%@"), v70, v104);
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      v76 = (void *)MEMORY[0x24BE74FA8];
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/PowerlogAccounting/Distribution/PLAccountingDistributionManager.m");
                      v77 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v77, "lastPathComponent");
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLAccountingDistributionManager reloadDependenciesNewerThanDate:]");
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v76, "logMessage:fromFile:fromFunction:fromLineNumber:", v75, v78, v79, 137);

                      PLLogCommon();
                      v80 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v121 = v75;
                        _os_log_debug_impl(&dword_21A62B000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                      }

                      self = v74;
                      v5 = v73;
                      v3 = v72;
                      v68 = v99;
                      v36 = v100;
                      v67 = v101;
                    }
                  }
                  switch(v36)
                  {
                    case 0:
                      -[PLAccountingDistributionManager delegate](self, "delegate");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = v104;
                      objc_msgSend(v81, "addDistributionEventIntervalWithLastDistributionEventForward:withDistributionEventForward:", v104, v70);
                      goto LABEL_67;
                    case 1:
                      -[PLAccountingDistributionManager delegate](self, "delegate");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = v104;
                      objc_msgSend(v81, "addDistributionEventIntervalWithLastDistributionEventBackward:withDistributionEventBackward:", v104, v70);
LABEL_67:

                      v104 = v70;
                      goto LABEL_68;
                    case 2:
                      -[PLAccountingDistributionManager delegate](self, "delegate");
                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v82, "addDistributionEventInterval:", v70);
                      goto LABEL_68;
                    case 3:
                      -[PLAccountingDistributionManager delegate](self, "delegate");
                      v82 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v82, "addDistributionEventPoint:", v70);
LABEL_68:

                      break;
                    default:
                      break;
                  }
                  ++v69;
                }
                while (v67 != v69);
                v67 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
              }
              while (v67);
            }
            else
            {
              v104 = 0;
            }

            v16 = v96 + 1;
            v15 = 0x24BDD1000;
          }
          while (v96 + 1 != v94);
          v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v122, 16);
          v94 = v83;
        }
        while (v83);
      }

      v12 = v91;
    }
  }

}

uint64_t __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_0 = result;
  return result;
}

uint64_t __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_48(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_47 = result;
  return result;
}

uint64_t __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_55(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_54_0 = result;
  return result;
}

uint64_t __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_70(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_69_0 = result;
  return result;
}

uint64_t __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_76(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_75_0 = result;
  return result;
}

uint64_t __67__PLAccountingDistributionManager_reloadDependenciesNewerThanDate___block_invoke_81(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reloadDependenciesNewerThanDate__classDebugEnabled_80_0 = result;
  return result;
}

uint64_t __95__PLAccountingDistributionManager_didDistributeToChildEnergyEstimate_fromParentEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didDistributeToChildEnergyEstimate_fromParentEnergyEstimate__classDebugEnabled = result;
  return result;
}

void __95__PLAccountingDistributionManager_didDistributeToChildEnergyEstimate_fromParentEnergyEstimate___block_invoke_86(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didCreateChildEnergyEstimate:withParentEnergyEstimate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __63__PLAccountingDistributionManager_didDistributeEnergyEstimate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didDistributeEnergyEstimate__classDebugEnabled = result;
  return result;
}

void __63__PLAccountingDistributionManager_didDistributeEnergyEstimate___block_invoke_89(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDistributeEnergyEstimate:", *(_QWORD *)(a1 + 40));

}

uint64_t __57__PLAccountingDistributionManager_dependencyIDsForOwner___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dependencyIDsForOwner__classDebugEnabled_0 = result;
  return result;
}

uint64_t __57__PLAccountingDistributionManager_dependencyIDsForOwner___block_invoke_94(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dependencyIDsForOwner__classDebugEnabled_93 = result;
  return result;
}

uint64_t __57__PLAccountingDistributionManager_ownerIDsForDependency___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ownerIDsForDependency__classDebugEnabled_0 = result;
  return result;
}

uint64_t __57__PLAccountingDistributionManager_ownerIDsForDependency___block_invoke_102(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ownerIDsForDependency__classDebugEnabled_101 = result;
  return result;
}

uint64_t __57__PLAccountingDistributionManager_ownerIDsForDependency___block_invoke_106(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  ownerIDsForDependency__classDebugEnabled_105 = result;
  return result;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
